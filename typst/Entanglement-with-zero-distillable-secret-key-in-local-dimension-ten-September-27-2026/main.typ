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

#align(center)[#text(size: 16pt, weight: "bold")[Entanglement with zero distillable secret key \
in local dimension ten]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

Secret-key distillation asks whether two distant laboratories can turn a shared noisy resource into identical
  random bits that an eavesdropper cannot predict. For a bipartite quantum state $rho_(A B)$,
  Alice and Bob act locally and exchange authenticated public classical messages.
  Eve holds a purification of the input and receives the complete public transcript.
  An ideal key of length $ell$ is uniform, agrees at the two laboratories, and is independent of Eve:
  its joint state has the form

$ 2^(- ell) sum_(z in { 0 \, 1 }^ell) \| z \, z chevron.r chevron.l z \, z \| ⊗ sigma_(E') . $

We use the usual ideal-key security criterion [31,53]. The input is the only shared private resource.
  Alice and Bob may process all copies jointly in their respective laboratories and use local auxiliaries and
  private randomness. They may also begin with a public random variable,
  independent of the input and its reference and recorded for Eve.
  Conditional on that public variable, the input-reference state and the two private auxiliary resources form a
  product, with fixed preparation kernels for every input.

An #emph[admitted] protocol has a finite or $bb(N)$-indexed sequence of measurable local-instrument steps,
  after any supplied local aggregation. Its histories and terminal readouts must satisfy the
  reference-compatibility conditions of Definition 12. These include ordinary finite protocols with finite
  classical records obeying the preceding resource rules, as well as the specified countable processes.
  Eve retains the initial purification and the full public record,
  including speaker choices and stopping information. A protocol is #emph[completed on the actual input] when both
  laboratories produce their prescribed outputs almost surely and the joint output is normalized.

The distillable secret key $K_D \( rho \)$ is the supremum of $liminf_n ell_n \/
  n$ over admitted completed key-output sequences on $rho^(⊗ n)$ whose error from an ideal key tends to zero
  (Definition 15). All errors use the unhalved trace norm $∥X∥_1 = "tr" sqrt(X^(*) X)$.

We construct an entangled state for which even one approximately secret bit is uniformly out of reach.
  A density operator is a positive matrix of trace one. It is #emph[separable] if it is a finite sum of positive
  product matrices, and #emph[entangled] otherwise.

#thm([Theorem 1.1.])[
  #emph[There is an explicitly specified entangled density operator $rho$ on $bb(C)^10 ⊗
    bb(C)^10$ whose range contains no nonzero product vector and for which $K_D \( rho \) = 0$.
    More precisely, let $n gt.eq 1$ and let $tau_(K_A K_B E')$ be the normalized output of any admitted completed
    bit-output protocol of Definition 12 on $rho^(⊗ n)$, where $E'$ retains an initial purification and the
    complete public transcript. For every state $sigma_(E')$,
#[#set math.equation(numbering: n => "(1.1)")
 $ ∥tau_(K_A K_B E') - 1 / 2 sum_(i = 0)^1 \| i \, i chevron.r chevron.l i \, i \| ⊗ sigma_(E')∥_1 gt.eq 1 /
   5 . $ <eq:main-gap>]

 Thus the corresponding trace distance, with its conventional factor $1 \/ 2$, is at least $1 \/ 10$.]
] <thm:main-state>

There is no uniform bound on the amount of communication or the number of steps within the admitted model.
  Proposition 18 also gives separate consequences for public conditioning on an event of positive probability,
  vanishing abort probability, and trace-norm limits of completed outputs whose Eve registers retain or allow
  recovery of the purification and complete public record.

The state comes from a construction for completely positive maps.
  A complex-linear map $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \)
  b$ is #emph[completely positive] (CP) when $upright("id")_k ⊗ F$ preserves positive matrices for every $k gt.eq
  1$. We call it #emph[PPT] when both $F$ and $T_b compose F$ are CP, where $T_b$ is coordinate transposition.
  Write $J \( F \)$ for the unnormalized input-first Choi matrix, defined in (2.1).
  A CP map is #emph[entanglement breaking] when applying it to one subsystem of any positive bipartite input
  always gives a separable output. Equivalently, its Choi matrix is separable [33] Theorem 4;
  this cone formulation does not require trace preservation.

#thm([Theorem 1.2.])[
  #emph[There are explicitly specified PPT maps $Phi_1 \, Phi_2 : M_10 \( bb(C) \) arrow.r M_10 \( bb(C) \)$ for which
$ Z = J \( Phi_2 compose Phi_1 \) $

 is nonzero and its range contains no nonzero product vector in $bb(C)^10 ⊗ bb(C)^10$.
   In particular, the composition $Phi_2 compose Phi_1$ is not entanglement breaking.]
] <thm:main-pair>

The maps are given by (6.5), starting from the integer matrices in (7.1).
  They may differ, and the construction does not impose trace preservation or unitality. The state in Theorem 1 is

#[#set math.equation(numbering: n => "(1.2)")
 $ rho = frac(Z, "tr" Z) . $ <eq:main-state-formula>]

The denominator is positive because $Z$ is a nonzero positive Choi matrix.
  A separate construction supplies a trace-preserving example.

#thm([Theorem 1.3.])[
  #emph[There is an explicitly specified trace-preserving PPT channel $Theta : M_21 \( bb(C) \) arrow.r
    M_21 \( bb(C) \)$ whose square $Theta compose Theta$ is not entanglement breaking.]
] <thm:main-channel>

The pair in Theorem 2 gives a negative answer to the unrestricted two-map PPT-composition conjecture of
  Christandl, Müller-Hermes, and Wolf [16] Conjecture IV.1.
  The channel in Theorem 3 answers the channel question recorded in the 2012 BIRS workshop report [54] Problem G,
  already with the same channel in both positions. We do not claim that either dimension is minimal.

===== 1.1 Entanglement and secrecy. <entanglement-and-secrecy.>

Public discussion and privacy amplification are central to the classical theory of key agreement [9,41,7].
  Entanglement purification provides a quantum route to secrecy:
  nearly pure shared entangled pairs decouple from a purifying adversary [8,11,19].
  Bound entanglement showed that entanglement need not be distillable into singlets.
  In particular, PPT entangled states have zero distillable entanglement [32].
  Some PPT entangled states nevertheless have positive distillable secret key [30].
  Their private-state description explains how secrecy can persist in a quantum shield even when singlet
  distillation is impossible [31].

Separable states have zero key against a purifying Eve [17,30].
  The converse was posed explicitly as Problem 24, “Secret key from all entangled states,” in Krüger and Werner’s
  open-problem collection: the entry is dated 15 March 2005 and lists P. Horodecki as contact [40].
  The question is also discussed in the private-state literature [31,29].
  One-way coding theorems give useful positive-key criteria [20],
  while Theorem 1 in particular rules out a positive key rate for a specific entangled state under ordinary finite
  two-way protocols, whose round count may grow with the input length.
  The distinction between secrecy needed to prepare correlations and key recoverable from them also matters:
  measurements of an entangled state can yield correlations with a positive secrecy formation cost without proving
  a positive distillation rate [26,25,1].

There are earlier quantitative obstructions near private bits.
  Kim and Sanders obtained a distance bound for PPT states under a Hermitian-block hypothesis [38],
  and Badziąg and coauthors removed that hypothesis [5]. Those bounds depend on the shield dimension,
  which may grow with a protocol. Our bound applies to the final classical bit registers and Eve’s complete public
  side information, with a constant independent of the input length and the local memories.

Pauwels, Gisin, and Renner recently constructed a finite classical bipartite source with positive secrecy
  formation cost and zero asymptotic secret-key rate under finite-round authenticated public discussion,
  with the round count allowed to grow with block length [46] Theorem 1 and Appendix A.
  Their revised paper also proves positive two-way distillable quantum key for the Horodecki two-qutrit states
  $sigma_alpha$ with $3 < alpha lt.eq 5$, including the bound-entangled range $3 < alpha lt.eq 4$,
  against a purifying quantum Eve [46] Corollary 3 and Appendix I.7.
  The state in Theorem 1 gives the quantum zero-key conclusion under the local quantum protocol model above.

===== 1.2 The operational obstruction. <the-operational-obstruction.>

The first part of the proof concerns a class $cal(C)$ of states $omega$ on $bb(C)^a ⊗
  bb(C)^b$ with a local representation

$ omega = \( cal(L) ⊗ cal(M) \) \( chi chi^(*) \) \, quad chi in bb(C)^r ⊗ bb(C)^s \, quad cal(L) :
  M_() \( bb(C) \) r arrow.r M_() \( bb(C) \) a \, quad cal(M) : M_() \( bb(C) \) s arrow.r M_() \( bb(C) \) b \, $

where $cal(L) \, cal(L) compose T_r \, cal(M) \, cal(M) compose T_s$ are CP.
  These input-transpose conditions are equivalent to the output-transpose PPT convention above, as Lemma 4 shows.
  The maps may be rectangular and need not preserve trace; only the output $omega$ has trace one.
  This condition persists under tensor powers. Relative to one common transcript measure,
  the four final bit branches have positive local effect densities $X_i \( t \) ⊗
  Y_j \( t \)$ on the two local input spaces of the protocol for almost every complete transcript $t$,
  with the same two local pairs for all $i \, j in { 0 \, 1 }$.
  To prove this, we run the protocol on auxiliary product probes.
  Their two local sampling tapes are conditionally independent given the complete public record.
  Informationally complete tests on untouched references turn that independence into common product factors,
  and a filter on the references transfers the factors to the actual input.

For a state in $cal(C)$, a coherence inequality bounds the overlap between the $00$ and $11$ branches by the
  probabilities of disagreement. After integration over transcripts,
  let $e$ be the total probability of different bits and let $frak(f)$ be the root fidelity between Eve’s
  unnormalized $00$ and $11$ conditional states, summed over the public record. We prove

$ frak(f) lt.eq sqrt(e \( 1 - e \)) + e . $

If the output is at trace-norm distance $eta$ from an ideal bit, correctness and secrecy give, respectively,

$ e lt.eq eta / 2 \, wide frak(f) gt.eq frac(1 - eta, 2) . $

For $eta < 1 \/ 5$, the right side of the first display is less than $2 \/ 5$,
  whereas the second display requires more than $2 \/ 5$. This proves the uniform gap.
  Taking the first bit of a longer ideal key is a trace-norm contraction,
  so no positive asymptotic key rate is possible.

===== 1.3 How the dimension-ten construction enters. <how-the-dimension-ten-construction-enters.>

For CP maps $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \) b$ and $G : M_() \( bb(C) \) b arrow.r
  M_() \( bb(C) \) c$, define $F^sharp = T_a compose F^dagger compose T_b$,
  where $F^dagger$ is the Hilbert–Schmidt adjoint. The transpose-adjoint Choi identity is

$ J \( G compose F \) = \( F^sharp ⊗ G \) \( Omega_b Omega_b^(*) \) \, wide Omega_b = sum_(i = 1)^b e_i ⊗ e_i . $

This identity and the local-product formulation are established machinery [16] Lemma I.1(2), Section IV.B;
  we prove the needed rectangular form and normalization in Lemma 9.
  When $F$ and $G$ are PPT and the Choi matrix is nonzero, division by its trace gives a state in $cal(C)$.
  Applying this observation to Theorem 2 proves that (1.2) belongs to the class covered by the operational obstruction.

It remains to make this state entangled. A nonzero separable positive matrix has a nonzero product vector in its
  range, a necessary part of the range criterion [34]. We exclude such vectors directly.
  Start with a PPT map $L : M_4 \( bb(C) \) arrow.r M_4 \( bb(C) \)$ and twenty projective directions $\[ x \]$ at
  which $L \( x x^(*) \)$ is singular. No nonzero homogeneous quadratic in four variables vanishes at ten of these
  directions. The ten-dimensional symmetric square records the quadratic monomials of $x$,
  and the six-dimensional exterior square converts rank loss into a product vector in $ker Z$.
  If $"ran" Z$ contained a product vector, its two factors would give two nonzero quadratics whose zero sets cover
  all twenty directions. Each can cover at most nine, and $9 + 9 < 20$.
  A separate positive definite output of $L$ ensures that $Z$ is nonzero.

This range argument is related to unextendible product bases [10],
  nonorthogonal product exclusion by linear independence [49] Section IV, Lemma 3,
  and polynomial evaluation methods [45] Proposition 1.3. The complementary-pair operation on the exterior square
  agrees with the four-dimensional fermionic duality of Schliemann, Loss, and MacDonald [55] Section III.
  Our explicit $L$ comes from a real integer $6$-by-$4$ matrix pencil.
  Its rank-losing directions solve a bilinear system of the type appearing in the study of low-rank PPT states on
  $bb(C)^4 ⊗ bb(C)^4$ [27] Section 7. Exact reductions at three primes prove that the relevant degree-twenty
  algebra is a field with normal-closure Galois group $S_20$.
  This symmetry carries one nonzero quadratic evaluation determinant to every ten-point choice.
  The arithmetic certificate and its precise computational coverage are given in Appendix 11.

===== 1.4 The channel and the projection construction. <the-channel-and-the-projection-construction.>

The PPT-composition problem has important affirmative cases,
  including two maps on $M_3 \( bb(C) \)$ [16] Corollary III.1; see also [12].
  Other cases include Gaussian channels [16] and diagonal unitary covariant or conjugate diagonal unitary
  covariant PPT maps [56] Theorem 4.5. Asymptotic approach to the entanglement-breaking cone was proved for
  iterates of unital or trace-preserving PPT maps [37] Theorem 3.3.
  Finite entanglement-breaking index was proved for unital PPT channels by Rahaman, Jaques,
  and Paulsen [52] Theorem 4.4, and for PPT channels with a full-rank invariant state by Hanson, Rouzé,
  and Stilck França [28] Theorem 3.10. More recent results concern different scopes.
  An and Lee prove that a qutrit CP map whose Choi matrix is one-copy undistillable and a qutrit CP map whose Choi
  matrix has Schmidt number at most two compose to an entanglement-breaking map in either order [3] Theorem 4.
  Park’s preprint states eventual entanglement breaking for each CP and completely copositive endomap,
  with a map-dependent number of iterations [44] Theorem 1.1.
  A failure at the second iterate is compatible with such eventual behavior.

To obtain Theorem 3, we rescale the two maps, alternate them between two coordinate blocks,
  and send the missing trace to an absorbing flag. The switch follows Christandl, Müller-Hermes,
  and Wolf [16] Section IV.A; the flag completion follows Filippov’s trace-preserving extension [21] Proposition
  3, Equation (15). The Choi matrix of the square has a local corner equal to a positive multiple of $Z$.
  Local compression preserves separability, so that corner certifies that the square is not entanglement breaking.

The final part of the paper develops a second way to retain entanglement under two PPT maps.
  A rectangular criterion starts from real unit vectors and projective measurements,
  uses a block Gram matrix for positivity, and uses commutation for the partial-transpose property.
  A support argument using zero tensor-basis diagonal entries rules out separability over the complex field.
  We realize the criterion by a restricted-intersection construction [23,2] and tensor products of the
  Mermin–Peres parity measurements [42,47,48]. Its dimensions are much larger,
  but the mechanism is independent of the twenty-direction geometry.
  Frankl and Rödl’s forbidden-intersection theory similarly forces fixed-size orthogonal families in large subsets
  of a sign cube [22] Theorem 1.11; our eight-point estimate is proved by a direct polynomial bound and an
  elementary tensor-power fiber argument. The real construction also gives an entangled output when the same
  trace-preserving rectangular PPT channel is applied to both halves of a maximally entangled state.
  This distinction between real matrices and complex separability matters:
  the real-field example of Chiribella, Davidson, Paulsen, and Rahaman has an entanglement-breaking
  complexification [13] Example 9.6.

===== 1.5 Organization. <organization.>

Section 2 establishes the common map conventions, represented class, and Choi transfer.
  Sections 3–5 prove the operational theorem. Sections 6 and 7 construct the dimension-ten pair,
  and Section 8 proves the state and channel consequences. Sections 9 and 10 give the independent projection and
  combinatorial method. The appendices give the exact certificate, the general algebraic facts used in its proof,
  and the supplementary finite checks of the explicit data.

== 2 PPT maps and the represented class <sec:foundations>

All matrix algebras in the constructions are finite-dimensional over $bb(C)$,
  with fixed orthonormal bases and the induced product bases.
  We write $X^(*)$ for conjugate transpose, $overline(X)$ for entrywise conjugation, and $T_d \( X \) =
  X^(sans(T))$ for the complex-linear transpose on $M_() \( bb(C) \) d$.
  For a linear map $F$, its Hilbert–Schmidt adjoint $F^dagger$ is characterized by $"tr" \( Y^(*) F \( X \) \) =
  "tr" \( \( F^dagger \( Y \) \)^(*) X \)$. If $V$ is a matrix, then $"Ad"_V \( X \) = V X V^(*)$.

For $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \) b$ our Choi convention is

#[#set math.equation(numbering: n => "(2.1)")
 $ J \( F \) =
   sum_(i \, j = 1)^a E_(i j) ⊗ F \( E_(i j) \) = \( upright("id")_a ⊗ F \) \( Omega_a Omega_a^(*) \) \, wide
   Omega_a = sum_(i = 1)^a e_i ⊗ e_i . $ <eq:choi-definition>]

In particular, $∥Omega_a∥^2 = a$; the vector is not normalized. The first tensor factor is the input reference.
  This convention fixes every dimension factor in the transfer and channel formulas below.
  It is the map–operator correspondence associated with Jamiołkowski and Choi [35,15].

#thm([Lemma 2.1.])[
  #emph[Let $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \) b$ be CP.
    Then $F^dagger$ and $T_b compose F compose T_a$ are CP. Moreover,
$ F compose T_a upright(" is CP") quad arrow.l.r.double quad T_b compose F upright(" is CP") . $

 If $F$ is PPT, so are $T_b compose F$, $F compose T_a$, its adjoint, its simultaneous transpose $T_b compose
   F compose T_a$, and its transpose-adjoint $F^sharp := T_a compose F^dagger compose T_b$.
   Tensor products of PPT maps are PPT. If $P$ and $Q$ are compatible CP maps, then $Q compose F compose
   P$ is PPT whenever $F$ is PPT.]
] <lem:ppt-stability>

#proof[
  Choose Kraus matrices $A_r in bb(C)^(b times a)$ such that $F \( X \) = sum_r A_r X A_r^(*)$. Then
  $ F^dagger \( Y \) = sum_r A_r^(*) Y A_r \, wide \( T_b compose F compose T_a \) \( X \) =
    sum_r overline(A_r) X overline(A_r)^(thin *) \, $
  which proves both CP assertions. Applying the simultaneous-transpose assertion to $F compose
    T_a$ or to $T_b compose F$ proves their equivalence. This argument works with rectangular Kraus matrices.
    The operator-sum representation is standard [39,15].
  Transpose is self-adjoint for the Hilbert–Schmidt inner product. Hence, when $F$ is PPT,
  $ T_a compose F^dagger = \( F compose T_a \)^dagger quad upright("and") quad F^dagger compose
    T_b = \( T_b compose F \)^dagger $
  are CP. This proves the PPT assertion for the adjoint, and simultaneous transposition gives the simultaneous
    transpose and transpose-adjoint. The output transpose of $T_b compose F$ is $F$, while that of $F compose
    T_a$ is $T_b compose F compose T_a$; all these maps are CP. This proves the remaining PPT assertions.
    With product bases, $T_(b_1 b_2) = T_(b_1) ⊗ T_(b_2)$, so the tensor-product assertion follows from closure of
    CP maps under tensor products. Finally, for $P : M_(a') \( bb(C) \) arrow.r M_() \( bb(C) \) a$ and $Q :
    M_() \( bb(C) \) b arrow.r M_(b') \( bb(C) \)$,
  $ T_(b') compose Q compose F compose P = \( T_(b') compose Q compose T_b \) compose \( T_b compose F \) compose P $
  is a composition of CP maps. The untransposed composition is CP as well. ◻
]

The input- and output-transpose formulations of PPT will therefore be used interchangeably.
  No trace condition is included in this terminology. The elementary closure facts above are also recorded,
  in related forms, in [37] Lemma 2.1.

#thm([Lemma 2.2.])[
  #emph[A linear map $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \) b$ is CP if and only if $J \( F \)
    succ.curly.eq 0$. For a CP map, the following are equivalent:]
  + #emph[$J \( F \)$ is separable;]
  + #emph[for every $k gt.eq 1$ and every $W succ.curly.eq 0$ in $M_() \( bb(C) \) k ⊗ M_() \( bb(C) \) a$,
    $\( upright("id")_k ⊗ F \) \( W \)$ is separable.]
  #emph[Also,
$ J \( T_b compose F \) = \( upright("id")_a ⊗ T_b \) J \( F \) \, wide
  J \( F compose T_a \) = \( T_a ⊗ upright("id")_b \) J \( F \) . $

]
] <lem:choi-separable>

#proof[
  The forward CP implication follows from (2.1). Conversely, write a positive Choi matrix as $J \( F \) =
    sum_r v_r v_r^(*)$. There is a unique matrix $A_r in bb(C)^(b times a)$ with $v_r = \( I_a ⊗ A_r \) Omega_a$.
    Comparison of the $\( i \, j \)$ blocks gives $F \( E_(i j) \) =
    sum_r A_r E_(i j) A_r^(*)$ and hence the Kraus representation of $F$.
    This is Choi’s finite-dimensional criterion [15].
  If $J \( F \)$ is separable, spectral decompositions of its positive factors write it as $sum_r a_r a_r^(*) ⊗
    b_r b_r^(*)$. Comparison of blocks now gives the measure-and-prepare formula
  $ F \( X \) = sum_r "tr" #scale(x: 120%, y: 120%)[\[] \( a_r a_r^(*) \)^(sans(T)) X #scale(x: 120%, y: 120%)[\]]
    b_r b_r^(*) . $
  Put $E_r = \( a_r a_r^(*) \)^(sans(T)) succ.curly.eq 0$. For $W succ.curly.eq 0$, each partial matrix
  $ "tr"_a #scale(x: 120%, y: 120%)[\[] \( I_k ⊗ E_r \) W #scale(x: 120%, y: 120%)[\]] =
    "tr"_a #scale(x: 120%, y: 120%)[\[] \( I_k ⊗ sqrt(E_r) \) W \( I_k ⊗ sqrt(E_r) \) #scale(x: 120%, y: 120%)[\]] $
  is positive. Thus $\( upright("id")_k ⊗ F \) \( W \)$ is a sum of positive products with second factors $b_r
    b_r^(*)$. The converse follows by applying the asserted property to $W = Omega_a Omega_a^(*)$.
    This proves the entanglement-breaking characterization [33] Theorem 4 at the level of the CP cone.
    The two transpose identities follow directly by reindexing the matrix units in (2.1). ◻
]

#thm([Lemma 2.3.])[
  #emph[Every nonzero separable positive matrix has a nonzero product vector in its range.
    Consequently, a nonzero positive matrix whose range contains no nonzero product vector is nonseparable.]
] <lem:product-range>

#proof[
  Refine a separable decomposition by the spectral decompositions of its positive factors.
    It then has the form $Z = sum_r v_r v_r^(*)$ with product vectors $v_r = a_r ⊗ b_r$.
    Since $ker Z = ⋂_r v_r^perp$, every $v_r$ lies in $\( ker Z \)^perp = "ran" Z$.
    If $Z eq.not 0$, at least one $v_r$ is nonzero. ◻
]

This is the range condition we use from the range criterion [34].
  It is only a necessary condition for separability; the dimension-ten construction below establishes its failure
  directly.

#prodef([Definition 2.4.])[
  A density operator $omega$ on $bb(C)^a ⊗ bb(C)^b$ belongs to the represented class $cal(C)$ if there are
    positive integers $r \, s$, a vector $chi in bb(C)^r ⊗ bb(C)^s$, and linear maps $cal(L) :
    M_() \( bb(C) \) r arrow.r M_() \( bb(C) \) a$ and $cal(M) : M_() \( bb(C) \) s arrow.r
    M_() \( bb(C) \) b$ such that
  #[#set math.equation(numbering: n => "(2.2)")
   $ omega = \( cal(L) ⊗ cal(M) \) \( chi chi^(*) \) \, wide cal(L) \, med cal(L) compose T_r \, med cal(M) \, med
     cal(M) compose T_s upright(" are CP") . $ <eq:represented-class>]
  Only $omega$ is required to have trace one. The vector $chi$ may be unnormalized,
    and the maps need not preserve trace.
] <def:represented-class>

This is a representation property, with no assumed physical implementation of the representing maps.
  Lemma 4 shows that the two maps are PPT also in the output convention.
  In particular the state itself has positive partial transpose, since, for example,
  $\( T_a ⊗ upright("id")_b \) \( omega \) = \( \( T_a compose cal(L) \) ⊗ cal(M) \) \( chi chi^(*) \)
  succ.curly.eq 0$. The operational proof will use the representing maps themselves,
  in addition to this partial-transpose consequence.

#thm([Lemma 2.5.])[
  #emph[The class $cal(C)$ is closed under finite tensor products,
    after grouping all first-party systems and all second-party systems.
    In particular, $omega^(⊗ n) in cal(C)$ for every $omega in cal(C)$ and every $n gt.eq 1$.]
] <lem:tensor-closure>

#proof[
  Tensor the representing vectors and the first-party maps separately from the second-party maps,
    and use the canonical local permutation unitaries to group the systems.
    Tensor products of CP maps are CP, and input transpose in the grouped product basis is the tensor product of
    the individual input transposes. Hence the four maps required in (2.2) remain CP.
    The output is the tensor product of the original states and has trace one.
    The local permutation unitaries and their conjugates are CP pre- and post-compositions,
    so they do not affect the conclusion. ◻
]

#thm([Lemma 2.6.])[
  (Choi transfer).  #emph[Let $F : M_() \( bb(C) \) a arrow.r M_() \( bb(C) \) b$ and $G :
    M_() \( bb(C) \) b arrow.r M_() \( bb(C) \) c$ be CP maps, and set $F^sharp = T_a compose F^dagger compose
    T_b$. Then
#[#set math.equation(numbering: n => "(2.3)")
 $ J \( G compose F \) = \( F^sharp ⊗ G \) \( Omega_b Omega_b^(*) \) . $ <eq:choi-transfer>]

 If $F$ and $G$ are PPT and $Z = J \( G compose F \) eq.not 0$, then $lambda := "tr" Z > 0$ and
#[#set math.equation(numbering: n => "(2.4)")
 $ Z / lambda = \( F^sharp ⊗ G \) (frac(Omega_b Omega_b^(*), lambda)) in cal(C) quad
   upright("on ") bb(C)^a ⊗ bb(C)^c . $ <eq:choi-transfer-normalized>]

]
] <lem:choi-transfer>

#proof[
  Let $A_r in bb(C)^(b times a)$ and $B_s in bb(C)^(c times b)$ be Kraus matrices for $F$ and $G$.
    Transposing the adjoint formula gives
  $ F^sharp \( Y \) = sum_r A_r^(sans(T)) Y overline(A_r) = sum_r A_r^(sans(T)) Y \( A_r^(sans(T)) \)^(*) . $
  Thus the Kraus matrices of $F^sharp : M_() \( bb(C) \) b arrow.r
    M_() \( bb(C) \) a$ are the transposes $A_r^(sans(T))$. For each pair of Kraus matrices,
    direct expansion in the fixed bases gives
  $ \( A_r^(sans(T)) ⊗ B_s \) Omega_b = \( I_a ⊗ B_s A_r \) Omega_a . $
  Summing the corresponding rank-one matrices proves (2.3).
    This is the rectangular CP form of the transpose-adjoint identity in [16] Lemma I.1(2);
    its use for local products of PPT maps is discussed there in Section IV.B.
  Suppose now that $F$ and $G$ are PPT. Besides complete positivity of $F^sharp$ and $G$, Lemma 4 gives
  $ F^sharp compose T_b = T_a compose F^dagger = \( F compose T_a \)^dagger upright(" CP") \, wide G compose
    T_b upright(" CP") . $
  These are exactly the input-transpose conditions for the two local maps in Definition 7. Finally,
  $ Z = sum_(r \, s) \| \( I_a ⊗ B_s A_r \) Omega_a chevron.r chevron.l \( I_a ⊗ B_s A_r \) Omega_a \| \, wide
    lambda = sum_(r \, s) ∥B_s A_r∥_(upright(F))^(thin 2) . $
  The nonzero positive matrix $Z$ has $lambda > 0$. Taking $chi = Omega_b \/ sqrt(lambda)$ in (2.2) proves (2.4).
    Its squared norm is $b \/ lambda$, which is allowed by the definition.
    No trace-preserving hypothesis or additional factor of $b$ is used. ◻
]

== 3 A four-effect coherence bound <sec:coherence>

The first step in the operational argument is an inequality for four arbitrary positive local matrices.
  It compares the coherence between two equal-bit branches with the weights of branches in which the two bits
  differ. The matrices need not form measurements: later they will be densities at a fixed public transcript,
  where pointwise normalization is not required.

We use the represented class $cal(C)$ of Definition 7. Thus, if $omega in cal(C)$ acts on $bb(C)^p ⊗ bb(C)^q$,
  then for some positive integers $r \, s$ it has a representation

$ omega = \( cal(L) ⊗ cal(M) \) \( chi chi^(*) \) \, wide chi in bb(C)^r ⊗ bb(C)^s \, $

where $cal(L) : M_r \( bb(C) \) arrow.r M_p \( bb(C) \)$ and $cal(M) : M_s \( bb(C) \) arrow.r
  M_q \( bb(C) \)$ satisfy that $cal(L) \, cal(L) compose T_r \, cal(M) \, cal(M) compose
  T_s$ are completely positive. Only $omega$ has trace one;
  the vector and the rectangular maps have no normalization requirement.
  We will use that freedom to change coordinates on the input of $cal(L)$.

#thm([Lemma 3.1.])[
  (Positive block estimate).  #emph[Let $H$ and $J$ be square matrices, possibly of different sizes,
    and let $Z$ have the corresponding rectangular size. If
$ mat(delim: "(", H, Z; Z^(*), J) succ.curly.eq 0 \, $

 then
$ ∥Z∥_1 lt.eq sqrt("tr" H thin "tr" J) . $

 This estimate includes singular $H$ and $J$.]
] <lem:positive-block>

#proof[
  A spectral decomposition of the positive block matrix expresses it as a finite sum of outer products of block
    columns $binom(a_k, b_k)$. Consequently $H = sum_k a_k a_k^(*)$, $J = sum_k b_k b_k^(*)$, and $Z =
    sum_k a_k b_k^(*)$. Since a rank-one matrix $a b^(*)$ has trace norm $∥a∥ thin ∥b∥$,
    the triangle inequality and Cauchy–Schwarz give
  $ ∥Z∥_1 lt.eq sum_k ∥a_k∥ thin ∥b_k∥ lt.eq (sum_k ∥a_k∥^2)^(1 \/ 2) (sum_k ∥b_k∥^2)^(1 \/ 2) =
    sqrt("tr" H thin "tr" J) . $
  No inverse of a diagonal block is used. ◻
]

#thm([Lemma 3.2.])[
  (Four-effect inequality).  #emph[Let $omega in cal(C)$ act on $bb(C)^p ⊗ bb(C)^q$.
    For arbitrary $X_0 \, X_1 succ.curly.eq 0$ in $M_p \( bb(C) \)$ and $Y_0 \,
    Y_1 succ.curly.eq 0$ in $M_q \( bb(C) \)$, put
$ D_(i j) = X_i ⊗ Y_j \, wide p_(i j) = "tr" \( D_(i j) omega \) \, wide i \, j in { 0 \, 1 } . $

 Then
#[#set math.equation(numbering: n => "(3.1)")
 $ ∥sqrt(D_00) thin omega sqrt(D_11)∥_1 lt.eq sqrt(p_00 p_01) + sqrt(p_10 p_11) + 2 sqrt(p_01 p_10) . $ <eq:coherence>]

 There is no normalization assumption on $X_0 \, X_1 \, Y_0 \, Y_1$.]
] <lem:coherence>

#proof[
  Fix a representation of $omega$ as above. Pull the four matrices back to the two input spaces by the
    Hilbert–Schmidt adjoints:
  $ A_i = cal(L)^dagger \( X_i \) in M_r \( bb(C) \) \, wide B_j = cal(M)^dagger \( Y_j \) in M_s \( bb(C) \) . $
  These matrices are positive. For instance, for every $a in bb(C)^r$,
  $ a^(*) A_i a = "tr" #scale(x: 120%, y: 120%)[\[] X_i cal(L) \( a a^(*) \) #scale(x: 120%, y: 120%)[\]] gt.eq 0 . $
  We first replace the representation by one in which $A_0$ and $A_1$ commute;
    the two complete-positivity conditions will then give complementary estimates for each off-diagonal term of
    the input.
  ===== 3.1 Normalization on the support. <normalization-on-the-support.>
  Set $H = A_0 + A_1$, and let $Pi$ be the orthogonal projection onto $"ran" H$.
    If $a in ker H$, the nonnegative numbers $a^(*) A_i a = ∥sqrt(A_i) a∥^2$ sum to zero,
    so each $A_i$ annihilates $ker H$. It follows also that $A_i = Pi A_i Pi$.
    Define $S$ to be $H^(- 1 \/ 2)$ on $"ran" H$ and the identity on $ker H$.
    The matrix $S$ is positive and invertible on all of $bb(C)^r$, including when $H = 0$. The two positive matrices
  $ A'_i = S^(*) A_i S $
  are supported on $Pi$ and satisfy $A'_0 + A'_1 = Pi$. Hence they commute:
    $\[ A'_0 \, A'_1 \] = \[ A'_0 \, Pi - A'_0 \] = 0$.
  This congruence can be made inside the representation without changing $omega$.
    With $"Ad"_S \( U \) = S U S^(*)$, replace
  $ cal(L) quad upright("by") quad cal(L)' = cal(L) compose "Ad"_S \, wide chi quad upright("by") quad
    chi' = \( S^(- 1) ⊗ I_s \) chi . $
  The resulting output is the same, and the pullbacks of $X_i$ are $A'_i$.
    The new map is CP, and its input-transpose condition follows from
  $ "Ad"_S compose T_r = T_r compose "Ad"_(overline(S)) \, wide cal(L)' compose
    T_r = \( cal(L) compose T_r \) compose "Ad"_(overline(S)) . $
  Thus it remains a representation of the kind required by Definition 7. We now suppress the primes.
  ===== 3.2 The two block estimates. <the-two-block-estimates.>
  Let $C = cal(L) ⊗ cal(M)$. For input vectors $u \, z in bb(C)^r ⊗ bb(C)^s$, define
  $ p_(i j) \( u \) & = u^(*) \( A_i ⊗ B_j \) u = "tr" #scale(x: 120%, y: 120%)[\[] D_(i j) C \( u u^(*) \)
    #scale(x: 120%, y: 120%)[\]] \,\
Z \( u \, z \) & = sqrt(D_00) thin C \( u z^(*) \) sqrt(D_11) . $
  Complete positivity of $C$ means that applying it entrywise to
  $ mat(delim: "(", u u^(*), u z^(*); z u^(*), z z^(*)) = binom(u, z) binom(u, z)^(*) $
  gives a positive block matrix. Conjugate that matrix by $"diag" \( sqrt(D_00) \, sqrt(D_11) \)$ and apply
    Lemma 10. The result is
  #[#set math.equation(numbering: n => "(3.2)")
   $ ∥Z \( u \, z \)∥_1 lt.eq sqrt(p_00 \( u \) p_11 \( z \)) . $ <eq:direct-block-bound>]
  The second estimate concerns the same $Z \( u \, z \)$, but exchanges the two input vectors in the diagonal
    weights. In the product input basis the #emph[global input transpose] is $T_(r s) = T_r ⊗ T_s$. The map
  $ C compose T_(r s) = \( cal(L) compose T_r \) ⊗ \( cal(M) compose T_s \) $
  is CP. Apply the preceding block argument to this map, with the ordered pair $\( overline(z) \, overline(u) \)$
    and the same two output filters. The identities
  $ \( overline(z) thin overline(u)^(*) \)^(sans(T)) = u z^(*) \,
    wide \( overline(z) thin overline(z)^(*) \)^(sans(T)) = z z^(*) \,
    wide \( overline(u) thin overline(u)^(*) \)^(sans(T)) = u u^(*) $
  show that the off-diagonal output is unchanged while the two diagonal inputs are exchanged. We obtain
  #[#set math.equation(numbering: n => "(3.3)")
   $ ∥Z \( u \, z \)∥_1 lt.eq sqrt(p_00 \( z \) p_11 \( u \)) . $ <eq:reversed-block-bound>]
  It is the transpose on both input factors here that supplies this reverse estimate.
  ===== 3.3 Splitting the input vector. <splitting-the-input-vector.>
  Choose a common orthonormal eigenbasis of the commuting $A_0 \, A_1$.
    Let $P$ be the projection onto the basis vectors on which the eigenvalue of $A_0$ is at least the eigenvalue
    of $A_1$, and set
  $ v = \( P ⊗ I_s \) chi \, wide w = \( \( I_r - P \) ⊗ I_s \) chi . $
  Then $chi = v + w$. Because $P A_i \( I_r - P \) = 0$, the cross terms in the quadratic forms defining $p_(i j)$
    vanish. The eigenvalue comparison on the two subspaces, together with $B_0 \, B_1 succ.curly.eq 0$, therefore gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ p_(i j) = p_(i j) \( v \) + p_(i j) \( w \) \,\
p_11 \( v \) lt.eq p_01 \( v \) \, wide p_00 \( w \) lt.eq p_10 \( w \) . $ <eq:spectral-weights>]
  For example, $A_0 - A_1$ is positive on $"ran" P$, so its tensor product with $B_1$ has nonnegative quadratic
    form on $v$; the second comparison follows on $ker P$ using $B_0$.
  We can now bound the four terms in the expansion of $C \( chi chi^(*) \)$.
    For the diagonal terms, (3.2) and (3.4) give
  $ ∥Z \( v \, v \)∥_1 & lt.eq sqrt(p_00 \( v \) p_11 \( v \)) lt.eq sqrt(p_00 p_01) \,\
∥Z \( w \, w \)∥_1 & lt.eq sqrt(p_00 \( w \) p_11 \( w \)) lt.eq sqrt(p_10 p_11) . $
  For $Z \( v \, w \)$ use the reverse estimate (3.3); for $Z \( w \, v \)$ use the direct estimate (3.2).
    Both right sides become the same:
  $ ∥Z \( v \, w \)∥_1 & lt.eq sqrt(p_00 \( w \) p_11 \( v \)) lt.eq sqrt(p_10 p_01) \,\
∥Z \( w \, v \)∥_1 & lt.eq sqrt(p_00 \( w \) p_11 \( v \)) lt.eq sqrt(p_10 p_01) . $
  Finally,
  $ sqrt(D_00) thin omega sqrt(D_11) = Z \( v \, v \) + Z \( v \, w \) + Z \( w \, v \) + Z \( w \, w \) . $
  The triangle inequality now yields (3.1). ◻
]

By Lemma 8, the same inequality applies to arbitrary joint positive matrices on all of Alice’s and all of Bob’s
  copies of a state in $cal(C)$. Its lack of any normalization condition is the feature that will let us apply it
  at each complete public transcript.

== 4 Complete public transcripts <sec:transcripts>

To apply the four-effect inequality to a protocol, we must obtain $X_i \( t \) ⊗
  Y_j \( t \)$ at each public transcript $t$, with the same two local pairs for all four bit values.
  These matrices describe the effects of the entire protocol on its input.
  They are not the effects of just its last measurements. We first derive this form for finite classical records,
  then prove its measurable counterpart for the admitted protocols below.
  The transcript always retains every public message, public random draw, and public stopping decision.

=== 4.1 The finite-record mechanism <the-finite-record-mechanism>

Let $R$ be the input state on finite-dimensional spaces $A ⊗ B$. In fixed product bases, Eve’s canonical purification is

#[#set math.equation(numbering: n => "(4.1)")
 $ \| Psi_R chevron.r = sum_h sqrt(R) thin \| h chevron.r_(A B) \| h chevron.r_E \, wide
   E tilde.equiv A ⊗ B . $ <eq:canonical-purification>]

For the moment suppose there are finitely many local-instrument and public steps, including the final readouts,
  every classical record is finite, and each party produces its prescribed bit almost surely on $R$.
  Use the following resource rules: the recorded initial public variable $C_0$ is independent of the input and
  reference; conditional on $C_0$, that input-reference state and the two private auxiliary resources form a
  product. The initial public law and local preparation kernels are fixed when the input varies.
  All later public-source draws use fixed input-independent kernels of the preceding public record.
  Thus the input is the only shared private resource.

Fix a complete public transcript $t$. In Alice’s laboratory,
  compose the instrument branches consistent with $t$ and final bit $i$,
  retaining private memory until it is no longer used and summing private outcomes locally.
  This gives a CP map $cal(A)_i^t$ on her input. Bob obtains a CP map $cal(B)_j^t$ in the same way.
  At this fixed public record each local choice can depend on the preceding public messages but not on the other
  party’s unannounced private outcomes. The compatible private histories therefore sum independently within the
  two laboratories. Public-source weights are scalars fixed by $t$; absorbing their product into either local map,
  the joint branch is $cal(A)_i^t ⊗ cal(B)_j^t$.

Set $X_i \( t \) = \( cal(A)_i^t \)^dagger \( I \)$ and $Y_j \( t \) = \( cal(B)_j^t \)^dagger \( I \)$.
  These matrices are positive and the branch effect is $D_(i j) \( t \) = X_i \( t \) ⊗ Y_j \( t \)$.
  Tracing the final laboratory memories out of that branch leaves Eve with

$ tau_(i j) \( t \) = #scale(x: 120%, y: 120%)[\(] sqrt(R) thin D_(i j) \( t \) sqrt(R)
  #scale(x: 120%, y: 120%)[\)]^(sans(T)) . $

Indeed, the $\( h \, k \)$ matrix entry on Eve’s system is
  $"tr" \[ D_(i j) \( t \) sqrt(R) \| h chevron.r chevron.l k \| sqrt(R) \] =
  chevron.l k \| sqrt(R) D_(i j) \( t \) sqrt(R) \| h chevron.r$.
  The same $X_0 \, X_1$ and $Y_0 \, Y_1$ occur in all four branches.
  Private instrument labels have been summed, not added to Eve’s transcript.
  No pointwise normalization is required at a fixed $t$; normalization holds after summing all final bits and all
  transcripts.

For a continuous transcript, a singleton may have probability zero,
  and with countably many steps an output may depend on the complete local history.
  The general statement will replace the preceding matrices by densities with respect to a single transcript
  measure. Its proof runs the protocol on a product of two local probes, each with an untouched reference.
  On that product input the local histories are independent conditional on the complete public record.
  Reference measurements recover common product matrix densities from this scalar independence,
  and a fixed filter on the references gives the blocks for $R$.

=== 4.2 The admitted protocol model <the-admitted-protocol-model>

The instrument formalism originates with Davies and Lewis [18].
  Chitambar, Leung, Mančinska, Ozols, and Winter [14] distinguish finite-round LOCC, infinite linked protocols,
  and topological closure. We specify the measurable model used here so that both its complete-history law and any
  terminal readout are part of the protocol data. Ordinary finite protocols obtain these laws by composition;
  a countable schedule requires the compatibility conditions below.

#prodef([Definition 4.1.])[
  (Admitted local protocols).  Let $A$ and $B$ be finite-dimensional complex input spaces.
    An admitted protocol consists of local quantum instruments, local memories and randomness,
    and authenticated two-way public classical communication.
    Each party may process its whole input space jointly. Its data and their joint laws satisfy the following
    requirements.
  + #emph[Initial resources.] Before interaction, there is a recorded standard Borel public variable $C_0$,
    possibly constant, whose law is fixed once the protocol is chosen.
    It is independent of the supplied input together with any purifying or untouched reference.
    Conditional on $C_0$, the joint state or law of that input and reference and the two initial private auxiliary
    resources is the product of the input-reference state and one resource for each laboratory.
    These local resources include private ancillas and randomness and may depend on $C_0$.
    The public law and these two preparation kernels are the same whenever this protocol is run on another input.
    All shared initial randomness is included in $C_0$. An initialization acting on a party’s input is treated as
    a first local operation. Apart from this recorded public variable and the supplied input,
    there is no shared resource and no preshared secret key.
  + #emph[Local instruments.] An instrument assigns completely positive operations to measurable outcome sets,
    countably additively on input states. It has measurable outcome laws and measurable conditional local updates,
    and its total operation is trace preserving. Its classical outcome space is standard Borel.
    Local instruments may depend measurably on the local private history and the preceding public record.
  + #emph[Local aggregation and chronological history.] A local subroutine completed before a later step may be
    aggregated into one instrument when that aggregate is supplied as a local instrument reproducing its retained
    output and reference law on arbitrary inputs with untouched finite-dimensional references.
    It includes every private record later used and its continuing memory.
    Its total is normalized, including a nonreturn or failure tag when needed.
    All public communication remains in the public schedule. After any such aggregation and before a separate
    terminal readout on a complete infinite history, the genuine classical history,
    including private instrument outcomes and public records,
    forms a finite sequence or a sequence indexed by $bb(N)$, in fixed standard Borel coordinate spaces.
    Instrument-choice tags and fixed padding for stopped histories are included in these spaces.
    A local choice uses only that laboratory’s preceding private history and the preceding public record;
    any choice affecting the other laboratory is communicated through a public step.
  + #emph[Public steps and the complete record.] The public discussion is correspondingly finite or indexed by
    $bb(N)$. Each message is produced by its sender’s local process from that sender’s private history and the
    preceding public record. For a later public-source draw after the public record $T_m = t$,
    the recorded outcome is drawn from a measurable probability kernel $kappa_m \( t \, d c \)$ depending only on
    that record. On every unnormalized joint instrument law, this public update multiplies by the scalar kernel
    and acts as the identity on the quantum and reference registers.
    The kernel at a given record is the same for every initial input.
    A party-generated announced choice, deterministic or randomized, is that party’s message.
    Public choices of speaker and public stopping decisions use these same two rules;
    a choice measurable from the preceding public record is a Dirac public kernel.
    Simultaneous messages may be ordered while retaining their dependence on the earlier record.
    Every publicly observed control or other datum is generated and recorded by one of these steps.
    The standard Borel record $T$ is the encoded sequence of $C_0$ and all these public messages, draws,
    speaker choices, and stopping decisions. Private outcomes and quantum memories remain in their own laboratories.
  + #emph[Reference-compatible prefix laws.] The specified steps are one family of instruments on arbitrary
    positive trace-class inputs, with their amplifications by any untouched finite-dimensional reference.
    Their unnormalized branch laws give countably additive positive matrix-valued measures on that reference for
    finite prefixes. Integrating the next record recovers the preceding reference measure after the current
    laboratory memories are traced out.
  + #emph[Terminal outputs and local quantum readouts.] A terminal classical output may be a measurable function
    of that laboratory’s instrument history and the received complete transcript $T$.
    A decision to invoke a terminal quantum readout must be measurable in the same local records.
    For a terminal quantum readout, the protocol supplies both its incoming local memory and the instrument
      applied to it. The memory is supplied by one fixed measurable local CP process on those histories,
      defined on arbitrary inputs with any untouched finite-dimensional reference.
      The readout is a specified measurable local instrument on that memory,
      selected using only that laboratory’s private history and $T$.
      The two laboratories refine the reference measure on the complete history by these local operations,
      acting as the identity on the reference.
    Together with the preceding schedule, these refinements give one countably additive,
      unnormalized instrument law on the complete history and the terminal outcomes,
      for all initial inputs and finite untouched references. Include a tag for a missing or noninvoked readout
      among each laboratory’s outcomes. Summing either laboratory’s terminal outcomes removes that local
      refinement. Summing both and tracing the output memories recovers the reference measure on the complete
      history with its stated finite-prefix marginals.
    After any terminal outcomes have been included, each prescribed output status is a measurable local value in
      the finite output alphabet together with a symbol $perp$ for nonproduction.
      An output already produced is retained. The incoming-memory and compatibility requirements concern only
      memory used by a terminal readout; unused memory need not converge.
      An unspecified evolution through infinitely many quantum operations does not by itself define a terminal readout.
  + #emph[Completion on a specified input.] A #emph[completed bit-output protocol on a specified input] has a bit
    in each laboratory almost surely on that input, with normalized joint output.
    Almost-sure production is required only on this actual input.
    More generally a completed key-output protocol produces an output in a specified finite classical alphabet at
    each party almost surely on the actual input, again with normalized joint output.
    Trace-norm limits of completed actual outputs, with full recoverable public information,
    will be treated separately in Section 5.
] <def:protocol>

For a finite protocol whose instruments and public steps satisfy clauses Definition 4.1–Definition 4.1,
  composition of those instruments supplies the prefix laws and any finite terminal refinement in
  clauses Definition 4.1–Definition 4.1. The separate complete-history and terminal-process requirements matter
  when a countable schedule or an aggregated subroutine is used.
  There is no uniform bound on the amount of communication, the size of a standard Borel message,
  or the number of rounds within this scope. In particular,
  a terminal classical bit can depend on an entire infinite record.

=== 4.3 Common effects at a complete transcript <common-effects-at-a-complete-transcript>

#thm([Lemma 4.2.])[
  (Common local factors for a complete transcript).  #emph[Let $R$ be a density operator on finite-dimensional
    complex spaces $A ⊗ B$, and let an admitted protocol produce bits $i \, j in { 0 \, 1 }$ almost surely on $R$.
    Give Eve the canonical purification (4.1), and let her retain $E$ and the complete public transcript $T$ with
    value $t$ in its standard Borel space $sans(T)$. There exist a finite positive measure $mu$ on $sans(T)$ and
    measurable positive matrices $X_0 \( t \) \, X_1 \( t \)$ on $A$ and $Y_0 \( t \) \,
    Y_1 \( t \)$ on $B$ such that the positive matrix-valued measure of Eve in bit branch $\( i \, j \)$ has the density
#[#set math.equation(numbering: n => "(4.2)")
 $ tau_(i j) \( t \) = #scale(x: 120%, y: 120%)[\(] sqrt(R) thin \[ X_i \( t \) ⊗ Y_j \( t \) \] sqrt(R)
   #scale(x: 120%, y: 120%)[\)]^(sans(T)) quad upright("with respect to ") mu . $ <eq:eve-blocks>]

 The same $X_i \( t \)$ and $Y_j \( t \)$ work for all four branches outside one $mu$-null set, and
$ sum_(i \, j = 0)^1 integral_(sans(T)) "tr" tau_(i j) \( t \) thin d mu \( t \) = 1 . $

 The transpose in (4.2) is in the product basis identifying $E$ with $A ⊗ B$. No invertibility of $R$ is assumed.]
] <lem:transcript>

#proof[
  Write $a = dim A$ and $b = dim B$, and attach untouched finite references $A_0 tilde.equiv A$ and $B_0
    tilde.equiv B$. Run the protocol on the product of the normalized local probes
  #[#set math.equation(numbering: n => "(4.3)")
   $ \| Phi_a chevron.r_(A A_0) ⊗ \| Phi_b chevron.r_(B B_0) \, wide \| Phi_a chevron.r =
     a^(- 1 \/ 2) sum_(r = 1)^a \| r \, r chevron.r \, wide \| Phi_b chevron.r =
     b^(- 1 \/ 2) sum_(s = 1)^b \| s \, s chevron.r . $ <eq:local-probes>]
  The protocol need not produce both bits on this auxiliary input.
    For this experiment assign bit zero in a laboratory if its prescribed bit is never produced,
    and retain a bit that has already been produced. The assignment is a measurable local rule.
    It does not replace the other laboratory’s output when only one output is missing.
    We will remove the contribution of these auxiliary defaults after recovering the actual input.
  The proof has three steps. First, clauses Definition 4.1–Definition 4.1 give conditional independence of the two
    local sampling tapes on the product probes, given the complete public transcript.
    Next, clauses Definition 4.1–Definition 4.1 give positive reference measures;
    informationally complete tests turn the scalar independence into product matrix densities.
    Finally, a filter on the untouched references prepares (4.1) and transfers those densities to Eve’s actual blocks.
  ===== 4.3.1 Conditional independence on the product probes. <conditional-independence-on-the-product-probes.>
  The scalar factorization has the finite private-coin rectangle property as a classical antecedent [6] Lemma 6.7.
    We prove the complete-history version needed here before recovering its matrix-valued factors.
  Choose a finite informationally complete POVM on each reference.
    One explicit construction in dimension $d$ starts with the projections onto the basis vectors and onto
  $ \( \| r chevron.r + \| s chevron.r \) \/ sqrt(2) \, wide \( \| r chevron.r + upright(i) \| s chevron.r \) \/
    sqrt(2) quad \( r < s \) . $
  These projections span the real vector space of Hermitian matrices.
    If they are $P_1 \, dots.h \, P_N$, the $2 N$ effects $P_k \/ N$ and $\( I - P_k \) \/
    N$ form a POVM with the same spanning property. Call the two resulting POVMs $\( E_r \)_r$ and $\( G_s \)_s$.
    Because the references are untouched, these tests commute with all laboratory operations.
    Their joint statistics with the transcript and final bits can therefore be computed with the tests performed
    at the start.
  In this tested product-probe experiment, sample $C_0$ with the same fixed law as in the actual run.
    Conditional on $C_0$, all local outcomes can be sampled using independent local random tapes $U$ for Alice and
    $V$ for Bob. The tapes may be taken as countable products of uniform variables,
    with coordinates reserved for the reference tests and any terminal readouts.
    They are chosen before the sampling; the local outcome histories are then functions of these tapes and the
    public record. At each local instrument, sample its conditional outcome law using a fresh uniform variable on
    that laboratory’s tape and apply the stipulated conditional state update.
    The tested input and private ancillas are a product across laboratories conditional on $C_0$,
    and each local update changes only its own local state. At a public-source step,
    sample $kappa_m \( T_m \, d c \)$ using a fresh public uniform variable independent of the private tapes and
    all prior sampling variables; only the recorded draw enters the transcript.
    This step leaves the quantum registers unchanged. Induction over the specified finite prefixes therefore shows
    that this sampling has the genuine joint finite-prefix laws.
    For a standard Borel outcome space a probability kernel has such a jointly measurable sampler:
    one may code the space by a Borel subset of $\[ 0 \, 1 \]$ and use the measurable kernel-sampling theorem [36]
    Appendix A1, Theorem A1.2, and Lemma 3.22. The initial reference tests and each specified local terminal
    quantum readout are sampled in the same way. Their stated local compatible refinements give the genuine tested
    laws on the complete histories. A terminal classical readout is already a measurable function of its records.
    Each defaulted bit and each reference-test result is consequently a measurable function of that laboratory’s
    tape and the complete public transcript. This sampling describes the auxiliary product input;
    the actual input $R$ need not have a product simulation.
  Let $T_m$ consist of $C_0$ and the first $m$ subsequent public records, and let $cal(F)_m = sigma \( T_m \)$.
    At a step sent by Alice the new record is measurable with respect to $sigma \( U \) or cal(F)_m$;
    at a step sent by Bob the analogous statement holds with $V$.
    At a public-source step with new draw $C$, the sampling construction gives
  $ bb(P) \( C in d c divides sigma \( U \, V \) or cal(F)_m \) = kappa_m \( T_m \, d c \) . $
  We show by induction that $U$ and $V$ are conditionally independent given $cal(F)_m$.
    The assertion at $m = 0$ follows from the product initial resources and independent private tapes conditional
    on $C_0$.
  Suppose it holds at $m$ and Alice sends the next record. For bounded measurable functions $u$ and $v$,
    conditional independence gives
  $ bb(E) \[ v \( V \) divides sigma \( U \) or cal(F)_m \] = bb(E) \[ v \( V \) divides cal(F)_m \] . $
  As $cal(F)_(m + 1) subset.eq sigma \( U \) or cal(F)_m$, conditioning this equality on $cal(F)_(m + 1)$ shows that
  $ bb(E) \[ v \( V \) divides cal(F)_(m + 1) \] = bb(E) \[ v \( V \) divides cal(F)_m \] . $
  Using the same equality inside the conditional expectation of $u \( U \) v \( V \)$ gives
  #[#set math.equation(numbering: n => "(4.4)")
   $ bb(E) \[ u \( U \) v \( V \) divides cal(F)_(m + 1) \] =
     bb(E) \[ u \( U \) divides cal(F)_(m + 1) \] bb(E) \[ v \( V \) divides cal(F)_(m + 1) \] .
     $ <eq:tape-factorization>]
  The Bob step is symmetric.
  For a public-source step, let $phi$ be a bounded measurable function of its new draw $C$,
    and write $\( kappa_m phi \) \( T_m \) = integral phi \( c \) thin kappa_m \( T_m \, d c \)$.
    The kernel condition and the induction hypothesis give
  $ bb(E) \[ u \( U \) v \( V \) phi \( C \) divides cal(F)_m \] = \( kappa_m phi \) \( T_m \)
    bb(E) \[ u \( U \) divides cal(F)_m \] thin bb(E) \[ v \( V \) divides cal(F)_m \] . $
  Testing against bounded $cal(F)_m$-measurable factors times $phi \( C \)$ and applying the monotone class
    theorem identifies conditional expectations on $cal(F)_(m + 1) = cal(F)_m or sigma \( C \)$.
    Taking $v = 1$ or $u = 1$ shows that the respective conditional marginal is unchanged;
    taking both functions gives their product. Thus the same factorization (4.4) holds after the public-source
    step. The rules for speaker and stopping records are among these sender and public-source steps.
    If two messages were simultaneous, ordering them preserves the required measurability for the second,
    because it still depends only on its original earlier record.
    Fixed padding after a public stop also preserves the claim.
  Set $cal(F)_oo = sigma \( union.big_m cal(F)_m \) = sigma \( T \)$,
    the sigma field of the actual complete transcript. The auxiliary sampling uniforms for later public draws are
    not adjoined. If $Z$ is bounded, then
  $ bb(E) \[ Z divides cal(F)_m \] arrow.r bb(E) \[ Z divides cal(F)_oo \] quad upright("in ") L^2 . $
  Indeed, these are the orthogonal projections of $Z$ onto increasing closed subspaces of $L^2$.
    Their limit is the projection onto the closure of the union.
    Indicators of finite-prefix events belong to that union, and the monotone class theorem shows that their span
    is dense in $L^2 \( cal(F)_oo \)$. The limiting projection is therefore the indicated conditional expectation.
    For bounded $u \, v$, the two conditional expectations on the right of (4.4) converge in $L^2$ and remain
    bounded. Cauchy–Schwarz applied to the difference of their products gives convergence in $L^1$.
    Passing to the limit in (4.4) proves
  $ bb(E) \[ u \( U \) v \( V \) divides cal(F)_oo \] = bb(E) \[ u \( U \) divides cal(F)_oo \]
    bb(E) \[ v \( V \) divides cal(F)_oo \] . $
  The tape spaces and $sans(T)$ are standard Borel. They admit regular conditional probability kernels and
    conditional integration of functions depending on $t$ [36] Theorems 6.3–6.4.
    Apply the last factorization to indicators from countable generating algebras for the two tape spaces,
    including the whole spaces, and discard the union of the resulting null sets.
    Their product rectangles form a $pi$-system generating the product sigma field.
    Uniqueness of probability measures on that $pi$-system then yields, on a single set of full transcript measure,
  #[#set math.equation(numbering: n => "(4.5)")
   $ sans(P)_(U \, V divides T = t) = sans(P)_(U divides T = t) ⊗ sans(P)_(V divides T = t) . $ <eq:full-tape-law>]
  In particular this law factors the conditional expectations of any bounded measurable function of $\( U \, t \)$
    and any bounded measurable function of $\( V \, t \)$. Thus the pair consisting of Alice’s defaulted bit and
    her reference-test result is conditionally independent of the corresponding pair for Bob, given $t$.
  ===== 4.3.2 Positive reference measures and their densities. <positive-reference-measures-and-their-densities.>
  Return to the experiment in which the probes are retained and the reference tests are not performed.
    We first construct its reference matrix measure on the space of all genuine classical instrument histories,
    including private histories. The fixed initial law of $C_0$ and the specified finite-prefix instruments give a
    positive reference matrix measure at every prefix. Summing the next local outcome recovers the preceding
    reference measure because the total instrument is trace preserving.
    Integrating a public-source outcome does the same because its scalar kernel has total mass one and acts as the
    identity on the quantum registers. These measures are therefore consistent on finite cylinders.
  Here is the countable extension in finite-dimensional terms.
    For a positive reference test, its scalar finite-prefix laws are consistent finite measures;
    after normalization, or by adjoining the complementary test outcome,
    the countable product extension theorem applies [36] Theorem 6.14.
    It supplies a finite scalar measure on the countable standard Borel history space.
    Recover matrix entries from finitely many rank-one reference tests by polarization.
    For an arbitrary reference vector $z$, extend also its positive rank-one test.
    On finite cylinders the resulting scalar measure equals the quadratic form $z^(*) W \( thin dot.op thin \)
    z$ of the recovered matrix measure. Uniqueness of finite measures on cylinders extends this equality to the
    entire history sigma field. Thus $z^(*) W \( S \) z gt.eq 0$ for every measurable $S$ and every $z$,
    so $W$ is a positive matrix-valued measure. This argument constructs a measure for the untouched finite
    references; it asks for no limiting state of unused quantum memory.
  Measurable terminal classical readouts and the local default rule now give measurable events in the history
    space. If a terminal quantum readout is used, the incoming local process stipulated in Definition 12,
    on those same instrument histories and with an untouched finite reference,
    together with its specified local instrument gives the bit-conditioned positive reference measures.
    Each instrument is selected from its own laboratory’s history and $T$;
    their joint refinement is obtained by the two local operations.
    Include the missing or noninvoked tag among the outcomes,
    so summing both local outcomes recovers the reference measure on the complete history.
    This terminal operation is a separate extension of that history;
    its outcome is included in the enlarged history before the classical readout.
    This is where clauses Definition 4.1–Definition 4.1 supply the needed locality, prefix compatibility,
    and reference stability. Write $hat(W)$ for the resulting positive reference measure on the enlarged history
    space. Its marginal on the preterminal history is $W$; when no readout is used,
    identify $hat(W)$ with $W$ using trivial terminal tags. The construction uses the genuine instrument records;
    the tapes above were only a sampling device for their tested scalar laws.
  Let $W_(i j) \( S \)$ be the restriction and pushforward of $hat(W)$ to the defaulted bit pair $\( i \, j \)$
    and transcript in a measurable set $S subset.eq sans(T)$. Define the probe transcript law
  $ mu \( S \) = sum_(i \, j = 0)^1 "tr" W_(i j) \( S \) . $
  It is a probability measure: the probe is normalized, the instrument totals preserve trace,
    and the defaults assign a pair on every history. For each $i \, j$, positivity and $"tr" W_(i j) \( S \) lt.eq
    mu \( S \)$ imply absolute continuity of every matrix entry with respect to $mu$.
    Hence there are entrywise Radon–Nikodym densities $W_(i j) \( t \)$.
    Only the dominated finite-measure case is needed here. For completeness, if $0 lt.eq nu lt.eq c mu$,
    the functional $g mapsto integral g thin d nu$ on simple functions is bounded in $L^2 \( mu \)$ by
    Cauchy–Schwarz. Its Hilbert space representing vector is a density,
    and indicator tests show that the density lies between $0$ and $c$.
    Apply this fact to the finitely many polarization tests for the matrix entries.
  Testing the densities on a countable dense set of reference vectors shows that $W_(i j) \( t \) succ.curly.eq
    0$ outside one null set. The equality defining $mu$ also gives
  $ sum_(i \, j) "tr" W_(i j) \( t \) = 1 quad upright("for ") mu upright("-almost every ") t . $
  Put
  $ U_i \( t \) = sum_j "tr"_(B_0) W_(i j) \( t \) \, wide V_j \( t \) = sum_i "tr"_(A_0) W_(i j) \( t \) . $
  Both local pairs are positive, and $sum_i "tr" U_i \( t \) = sum_j "tr" V_j \( t \) = 1$ almost everywhere.
  The conditional scalar statistics of the reference tests are the traces against these densities.
    Their local marginals are $"tr" \[ E_r U_i \( t \) \]$ and $"tr" \[ G_s V_j \( t \) \]$,
    because the other POVM sums to the identity. Conditional independence from (4.5) therefore gives
  $ "tr" \[ \( E_r ⊗ G_s \) W_(i j) \( t \) \] = "tr" \[ E_r U_i \( t \) \] thin "tr" \[ G_s V_j \( t \) \] $
  for every $i \, j \, r \, s$, outside one null set. The tensor products $E_r ⊗
    G_s$ span the Hermitian matrices on $A_0 ⊗ B_0$. Equality against that spanning family proves
  #[#set math.equation(numbering: n => "(4.6)")
   $ W_(i j) \( t \) = U_i \( t \) ⊗ V_j \( t \) quad upright("for all ") i \,
     j upright(" and ") mu upright("-almost every ") t . $ <eq:probe-product>]
  We have obtained the same two local matrix pairs for all four branches,
    without conditioning on a positive-probability singleton transcript and without making private instrument
    labels public.
  ===== 4.3.3 Recovering the actual purification. <recovering-the-actual-purification.>
  Identify $A_0 ⊗ B_0$ with $E$ in the product basis and define
  $ K = sqrt(a b) thin \( sqrt(R) \)^(sans(T)) . $
  The elementary identity $\( I ⊗ S^(sans(T)) \) sum_h \| h \, h chevron.r = \( S ⊗ I \) sum_h \| h \,
    h chevron.r$ shows that applying $I_(A B) ⊗ K$ to the product probes (4.3) gives exactly $\| Psi_R chevron.r$.
    This joint filter on the references is an algebraic preparation of the input purification;
    the laboratories are not required to implement it. It need not be trace preserving or a contraction.
  The same independent law of $C_0$ and the same $C_0$-conditioned local auxiliary resources are used on the
    probes and on the actual input. Consequently the filter also prepares the full initial joint law,
    including $C_0$ and those resources. On each finite cylinder of genuine histories,
    the reference matrix for this filtered input is $K W \( thin dot.op thin \) K^(*)$,
    because the references are untouched and the filter commutes with every local instrument.
    Every public-source update also commutes with the filter:
    at a given public record it multiplies both laws by the same scalar kernel and acts as the identity on the
    reference. The scalar entries on both sides are finite measures,
    so uniqueness extends their equality from cylinders to the full history sigma field.
    The same commutation holds for any appended terminal instrument by clause Definition 4.1.
    Thus the filtered law on the enlarged history is $K hat(W) \( thin dot.op thin \) K^(*)$,
    and the identity holds for the bit-conditioned measures as well.
  Let $N$ be the event in this enlarged history space that at least one prescribed local bit is missing before the
    default rule. The event may depend on private records. On the actual input its probability is zero by
    hypothesis, so positivity gives
  $ "tr" \[ K hat(W) \( N \) K^(*) \] = 0 \, wide K hat(W) \( N \) K^(*) = 0 . $
  Every subevent of $N$ has a positive filtered matrix bounded by this zero matrix.
    It therefore also contributes zero. Thus the local defaults leave the actual output measure unchanged,
    even though they may occur on the probes. The argument was made on full histories before discarding private
    records, so $N$ need not be public.
  It follows from (4.6) that the actual Eve density in branch $\( i \, j \)$ is $K \( U_i \( t \) ⊗ V_j \( t \) \)
    K^(*)$. The matrix $\( sqrt(R) \)^(sans(T))$ is Hermitian. Hence direct multiplication gives
  $ K \( U_i ⊗ V_j \) K^(*) & = a b \( sqrt(R) \)^(sans(T)) \( U_i ⊗ V_j \) \( sqrt(R) \)^(sans(T))\
 & = #scale(x: 120%, y: 120%)[\(] sqrt(R) thin \[ a U_i^(sans(T)) ⊗ b V_j^(sans(T)) \] sqrt(R)
   #scale(x: 120%, y: 120%)[\)]^(sans(T)) . $
  Take $X_i \( t \) = a U_i \( t \)^(sans(T))$ and $Y_j \( t \) = b V_j \( t \)^(sans(T))$,
    redefining them on a null set if necessary. Transposition preserves positivity,
    so these are measurable positive local matrices. The filtered total trace is one because $R$ is normalized,
    and (4.2) follows. No inverse of $R$ appears anywhere in the construction. ◻
]

The canonical purification is convenient for the formula,
  but it does not restrict the adversary or the ideal comparison law.
  The following observation will let the secret-bit proof use that formula for every purifying space.

#thm([Lemma 4.3.])[
  (Recovery from another purifying space).  #emph[Let $R$ and $\| Psi_R chevron.r$ be as in Lemma 13,
    and let $\| psi chevron.r in A ⊗ B ⊗ tilde(E)$ be any purification of $R$.
    There is a channel $cal(R)$ from $tilde(E)$ to $E$ that recovers the canonical purification.
    If Alice and Bob run the same admitted protocol and Eve retains her purification and the full transcript,
    $cal(R)$ acting on the purifying register and the identity acting on the transcript recover the canonical
    output of Lemma 13. Moreover this channel maps every ideal secret-bit law with Eve in $tilde(E)
    T$ to an ideal secret-bit law with Eve in $E T$.]
] <lem:purification-recovery>

#proof[
  Let $cal(S) = "supp" \( R^(sans(T)) \) subset.eq E$. Schmidt decomposition gives an isometry $V : cal(S) arrow.r
    tilde(E)$ with $\| psi chevron.r = \( I_(A B) ⊗ V \) \| Psi_R chevron.r$;
    the canonical vector is supported on $cal(S)$ in its purifying factor.
    Choose any density operator $zeta$ on $E$, and define, with the compression term included into $E$ from $cal(S)$,
  $ cal(R) \( xi \) = V^(*) xi V + "tr" \[ \( I_(tilde(E)) - V V^(*) \) xi \] thin zeta . $
  Compression is CP, as is the positive trace functional followed by preparation of $zeta$.
    Their sum preserves trace, so $cal(R)$ is a channel. Its first term inverts $V$ on the actual purifying
    support, and the second term vanishes there. Local operations on $A \,
    B$ keep each conditional purifying state supported in $"ran" V$,
    and public-source steps act as the identity on that register,
    so recovery is exact in every transcript and bit branch. The same formula is valid when $tilde(E)$ is larger
    than the finite purifying support, acting on trace-class inputs.
  An ideal bit has the form $1 / 2 sum_(i = 0)^1 \| i \, i chevron.r chevron.l i \, i \| ⊗ sigma$.
    Applying $cal(R) ⊗ upright("id")_T$ to its Eve factor replaces $sigma$ by another normalized state and leaves
    that form intact. This includes ideal states with mass outside $"ran" V$.
    Thus trace-norm contraction transfers any lower bound proved for the canonical output and every canonical
    ideal law to the output for the arbitrary purification and every ideal law in its larger space. ◻
]

== 5 Separation from an ideal secret bit <sec:secret-key>

We now combine the common factors at a complete transcript with the four-effect inequality.
  A nearly correct bit has little weight in the $01$ and $10$ branches.
  A nearly uniform secret bit requires Eve’s $00$ and $11$ blocks to be close and to carry nearly half the total
  weight each. Root fidelity makes these two requirements comparable,
  and the resulting estimates give a uniform numerical gap.

Throughout the paper the trace norm is unhalved:

$ ∥H∥_1 = "tr" sqrt(H^(*) H) . $

For a classical standard Borel register with a finite-dimensional quantum register,
  a state is a positive matrix-valued measure of total trace one.
  If a Hermitian difference of such measures has density $H \( t \)$ with respect to a common finite dominating
  measure $lambda$, its trace norm is $integral ∥H \( t \)∥_1 thin d lambda \( t \)$.
  This value is independent of the chosen dominating measure by homogeneity.
  The usual trace distance between normalized states is one half of this norm.

We use trace-norm contraction on Hermitian differences under channels, including classical readouts.
  In finite dimensions it follows directly from duality: the adjoint of a trace-preserving positive map is unital
  and positive, so it sends each Hermitian contraction $Q$, with $- I prec.curly.eq Q prec.curly.eq I$,
  to another Hermitian contraction. Taking the supremum of $"tr" \( Q H \)$ over such $Q$ proves contraction.
  The same argument applies to trace-class quantum registers and classical matrix-valued measures through their
  bounded observables.

#prodef([Definition 5.1.])[
  (Distillable secret key).  Let $omega$ be a bipartite state, with Eve initially holding a purification.
    A key-distillation sequence uses an admitted protocol of Definition 12 on each $omega^(⊗ n)$,
    allowing each party to process all its $n$ copies jointly.
    The normalized classical output at each party is a string of a fixed length $ell_n in
    bb(Z)_(gt.eq 0)$ for that $n$. Eve’s output register $E'$ retains the initial purification and the complete
    public transcript. For any normalized state or classical-quantum law $sigma_(E')$,
    define the ideal length-$ell$ key by
  $ gamma_sigma^(\( ell \)) = 2^(- ell) sum_(z in { 0 \, 1 }^ell) \| z \, z chevron.r chevron.l z \,
    z \| ⊗ sigma_(E') . $
  The sequence is secure if there are normalized comparison laws $sigma_(E')^(\( n \))$ such that
  #[#set math.equation(numbering: n => "(5.1)")
   $ ∥tau_(K_A K_B E')^(\( n \)) - gamma_(sigma^(\( n \)))^(\( ell_n \))∥_1 arrow.r 0 . $ <eq:key-definition>]
  Its asymptotic lower rate is $liminf_(n arrow.r oo) ell_n \/ n$.
    The distillable secret key $K_D \( omega \)$ is the supremum of these rates over secure sequences,
    including the zero rate obtained by producing the empty key.
    A positive rate therefore requires $ell_n gt.eq 1$ for all sufficiently large $n$.
] <def:distillable-key>

For positive matrices define the unnormalized root fidelity by

$ f \( H \, J \) = ∥sqrt(H) sqrt(J)∥_1 . $

In particular $f \( c H \, c J \) = c f \( H \, J \)$ for $c gt.eq 0$.
  The next facts hold at singular matrices as well as invertible ones.
  The lower comparison is the unnormalized form associated with the Powers–Størmer inequality [50] Lemma 4.1;
  for normalized states it is the lower Fuchs–van de Graaf bound [24] Theorem 1.
  We give the short matrix proof needed at our exact normalization.

#thm([Lemma 5.2.])[
  (Root fidelity and trace norm).  #emph[For arbitrary square complex matrices $A \, B$ of the same size,
#[#set math.equation(numbering: n => "(5.2)")
 $ f \( A^(*) A \, B^(*) B \) = ∥A B^(*)∥_1 . $ <eq:polar-fidelity>]

 For positive matrices $H \, J$ of the same size,
#[#set math.equation(numbering: n => "(5.3)")
 $ f \( H \, J \) gt.eq frac("tr" H + "tr" J - ∥H - J∥_1, 2) . $ <eq:fidelity-lower>]

 Also $f \( H^(sans(T)) \, J^(sans(T)) \) = f \( H \, J \)$.]
] <lem:fidelity>

#proof[
  Extend the partial isometries in the polar decompositions of the square matrices to unitaries, writing $A =
    U sqrt(A^(*) A)$ and $B = V sqrt(B^(*) B)$. Then $A B^(*) = U sqrt(A^(*) A) sqrt(B^(*) B) V^(*)$,
    and unitary invariance of the trace norm proves (5.2). This extension is available even when either matrix is
    singular.
  For (5.3), put $A = sqrt(H)$, $B = sqrt(J)$, and $Z = A - B$.
    The matrix $Z$ is Hermitian and $H - J = Z A + B Z$. The spectral sign $"sgn" \( Z \)$ is a Hermitian
    contraction. Trace-norm duality and cyclicity therefore give
  $ ∥H - J∥_1 gt.eq "tr" \[ "sgn" \( Z \) \( H - J \) \] = "tr" \[ \| Z \| \( A + B \) \] . $
  In a unit eigenvector of $Z$ with eigenvalue $z$, positivity of $A \, B$ implies
  $ chevron.l A + B chevron.r gt.eq \| chevron.l A - B chevron.r \| = \| z \| . $
  Summing in an eigenbasis of $Z$ shows $"tr" \[ \| Z \| \( A + B \) \] gt.eq "tr" Z^2$. Finally,
  $ "tr" Z^2 = "tr" H + "tr" J - 2 "tr" \( A B \) \, wide 0 lt.eq "tr" \( A B \) lt.eq ∥A B∥_1 = f \( H \, J \) . $
  Combining these inequalities proves the lower bound. No commutation of $H$ and $J$ was used.
    For the transpose identity, functional calculus gives $sqrt(H^(sans(T))) = \( sqrt(H) \)^(sans(T))$.
    The product of the two transposed square roots is $\( sqrt(J) sqrt(H) \)^(sans(T))$;
    transpose and adjoint preserve trace norm, proving $f \( H^(sans(T)) \, J^(sans(T)) \) = f \( H \, J \)$. ◻
]

#thm([Theorem 5.3.])[
  (Uniform obstruction to a secret bit).  #emph[Let $omega in cal(C)$.
    For every integer $n gt.eq 1$, let an admitted completed protocol on $omega^(⊗ n)$ produce normalized bit
    registers $K_A \, K_B$, and let its output $tau_(K_A K_B E')$ retain in $E'$ an initial purification held by
    Eve and the complete public transcript. The purification may be arbitrary.
    For every normalized state or classical-quantum law $sigma_(E')$,
#[#set math.equation(numbering: n => "(5.4)")
 $ ∥tau_(K_A K_B E') - 1 / 2 sum_(i = 0)^1 \| i \, i chevron.r chevron.l i \, i \| ⊗ sigma_(E')∥_1 gt.eq 1 /
   5 . $ <eq:uniform-secret-bit-gap>]

 Thus the conventional trace distance is at least $1 \/ 10$, and $K_D \( omega \) = 0$ in Definition 15.]
] <thm:zero-key>

#proof[
  Group all of Alice’s factors and all of Bob’s factors, and set $R = omega^(⊗ n)$. Lemma 8 gives $R in cal(C)$.
    First apply the classical readout of Eve’s retained complete public transcript,
    leaving her initial purifying register unchanged, and discard any extra retained registers.
    On the actual output this produces the full classical transcript together with the purification.
    On any ideal bit comparison state it produces an ideal bit with a classical-quantum comparison law.
    Next, Lemma 14 supplies a channel from the retained purifying space to the canonical one,
    leaving the transcript unchanged. It recovers the actual canonical output and again sends every ideal law to
    an ideal law. Trace-norm contraction under these Eve-side channels therefore reduces the claim to the
    canonical purification (4.1) and the full classical transcript $T$.
  Apply Lemma 13 to obtain a finite transcript measure $mu$, the positive factors $X_i \( t \) \, Y_j \( t \)$,
    and the Eve densities $tau_(i j) \( t \)$ of (4.2). Fix any normalized positive matrix-valued comparison law
    $sigma_(E T)$ on the same transcript space.
  Let $nu$ be the transcript law of $sigma_(E T)$, namely $nu \( S \) = "tr" sigma_(E T) \( S \)$,
    and use the common finite measure $lambda = mu + nu$. If $h = d mu \/ d lambda$,
    replace each actual density by $h \( t \) tau_(i j) \( t \)$ and both $X_i \( t \)$ by $h \( t \)
    X_i \( t \)$, leaving the $Y_j \( t \)$ unchanged. Equation (4.2) then still holds, including where $h = 0$.
    The ideal law has a positive density $sigma \( t \)$ with respect to $lambda$ and $integral "tr" sigma \( t \)
    thin d lambda \( t \) = 1$. Homogeneity preserves all actual probabilities and root-fidelity integrals in this
    change of measure. We now denote $lambda$ again by $mu$. This common measure keeps singular parts of either
    original transcript law; there is no assumption that the ideal and actual laws have the same support.
  For these common densities set
  $ D_(i j) \( t \) = X_i \( t \) ⊗ Y_j \( t \) \, wide p_(i j) \( t \) = "tr" tau_(i j) \( t \) =
    "tr" \[ D_(i j) \( t \) R \] \, wide P_(i j) = integral p_(i j) \( t \) thin d mu \( t \) . $
  All $P_(i j)$ are nonnegative and $sum_(i \, j) P_(i j) = 1$.
    With $A = sqrt(D_00 \( t \)) sqrt(R)$ and $B = sqrt(D_11 \( t \)) sqrt(R)$, the transpose invariance and (5.2) give
  #[#set math.equation(numbering: n => "(5.5)")
   $ f \( tau_00 \( t \) \, tau_11 \( t \) \) & = f #scale(x: 120%, y: 120%)[\(] sqrt(R) D_00 \( t \) sqrt(R) \,
     sqrt(R) D_11 \( t \) sqrt(R) #scale(x: 120%, y: 120%)[\)]\
 & = ∥sqrt(D_00 \( t \)) R sqrt(D_11 \( t \))∥_1 . $ <eq:transcript-fidelity>]
  The privacy interpretation of an off-diagonal coherence norm as the fidelity of conditional Eve states is also
    used in the private-state approach [30] Eq. (7). Here the identity is applied to unnormalized branches at each
    complete transcript. Its proof includes singular $R$ and singular effects.
  Apply Lemma 11 at almost every $t$. Scalar Cauchy–Schwarz after integration gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ frak(f) & := integral f \( tau_00 \( t \) \, tau_11 \( t \) \) thin d mu \( t \)\
 & lt.eq sqrt(P_00 P_01) + sqrt(P_10 P_11) + 2 sqrt(P_01 P_10) . $ <eq:integrated-coherence>]
  For example, $integral sqrt(p_00 \( t \) p_01 \( t \)) thin d mu \( t \)$ is at most $sqrt(P_00 P_01)$.
    The factors need only be positive; no pointwise POVM normalization was used.
  We next express what small distance from the fixed ideal bit would require of this same $frak(f)$.
    Let $eta$ be the unhalved trace-norm distance after the common transcript readout, and define
  $ e & = P_01 + P_10 \,\
q & = integral ∥tau_00 \( t \) - tau_11 \( t \)∥_1 thin d mu \( t \) \,\
a_i & = integral ∥tau_(i i) \( t \) - 1 / 2 sigma \( t \)∥_1 thin d mu \( t \) quad \( i = 0 \, 1 \) . $
  The unequal-bit blocks of the ideal state are zero. Additivity of the trace norm across the classical bit
    blocks, and then the triangle inequality within the two equal-bit blocks, give
  #[#set math.equation(numbering: n => "(5.7)")
   $ eta = e + a_0 + a_1 \, wide q lt.eq a_0 + a_1 = eta - e . $ <eq:linked-errors>]
  Trace conservation gives one further inequality that is needed for the uniform constant.
    The actual equal-bit blocks have total trace $1 - e$, whereas the corresponding ideal blocks have total trace
    one. Thus
  $ a_0 + a_1 gt.eq
    lr(|sum_(i = 0)^1 integral "tr" #scale(x: 120%, y: 120%)[\(] tau_(i i) \( t \) - 1 / 2 sigma \( t \)
    #scale(x: 120%, y: 120%)[\)] thin d mu \( t \)|) = e \, $
  and (5.7) implies
  #[#set math.equation(numbering: n => "(5.8)")
   $ e lt.eq eta / 2 . $ <eq:unequal-error-bound>]
  Integrating (5.3) gives
  $ frak(f) gt.eq frac(P_00 + P_11 - q, 2) = frac(1 - e - q, 2) gt.eq frac(1 - eta, 2) . $
  On the other hand, Cauchy–Schwarz on the first two terms of (5.6) and the arithmetic–geometric mean inequality
    on the last give
  $ sqrt(P_00 P_01) + sqrt(P_10 P_11) & lt.eq sqrt(\( P_00 + P_11 \) \( P_01 + P_10 \)) = sqrt(e \( 1 - e \)) \,\
2 sqrt(P_01 P_10) & lt.eq e . $
  The two estimates have the exact combined form
  #[#set math.equation(numbering: n => "(5.9)")
   $ frac(1 - eta, 2) lt.eq frak(f) lt.eq sqrt(e \( 1 - e \)) + e \, wide e lt.eq eta / 2 . $ <eq:fidelity-sandwich>]
  If $eta < 1 \/ 5$, then $e < 1 \/ 10$. On $0 lt.eq e lt.eq 1 \/ 10$ the function $sqrt(e \( 1 - e \)) +
    e$ is increasing and has value $2 \/ 5$ at $e = 1 \/ 10$.
    The right side of (5.9) is therefore strictly less than $2 \/ 5$,
    while its left side is strictly greater than $2 \/ 5$. This contradiction proves (5.4), uniformly in $n$,
    the represented state, the protocol, and the ideal comparison law.
  Finally suppose a secure key-distillation sequence had $ell_n gt.eq 1$ for infinitely many $n$.
    Along those indices, the local classical channels that retain the first bit of each string and discard the
    other bits, while retaining $E'$, map $gamma_(sigma^(\( n \)))^(\( ell_n \))$ to an ideal bit:
    exactly half the uniform strings have either first bit. Trace-norm contraction would make the resulting
    bit-output error tend to zero, contradicting (5.4). Thus every secure sequence has $ell_n =
    0$ for all sufficiently large $n$. In particular its asymptotic lower rate is zero.
    The empty key achieves rate zero, so $K_D \( omega \) = 0$. ◻
]

The proof also yields the retained conditioning and limiting forms of the obstruction.
  These statements specify how normalization and Eve’s complete information are preserved.

#thm([Proposition 5.4.])[
  (Conditioning, aborts, and completed-output limits).  #emph[Consider inputs $omega^(⊗ n)$ with $omega in
    cal(C)$ and $n gt.eq 1$, and admitted protocols whose normalized completed outputs retain in Eve’s register an
    arbitrary initial purification and the complete public transcript.
    The following statements extend the gap in Theorem 17; in item 2,
    the completed local output alphabet may include an abort symbol.]
  + #emph[If $A$ is a measurable event of the complete public transcript with probability $r > 0$,
    the normalized bit output conditioned on $A$ has distance at least $1 \/
    5$ from every ideal bit law for that accepted output. This holds for every $r > 0$.]
  + #emph[Suppose a sequence of completed protocols has a locally available abort symbol at either party.
    If the probability that at least one party aborts tends to zero,
    and the normalized non-aborting outputs approach ideal non-aborting bit laws,
    then replacing each local abort by the fixed bit zero would give completed bit outputs approaching ideal bits.
    Such a sequence is impossible for inputs in $cal(C)$ (including any numbers of copies).]
  + #emph[Let $tau_k$ be completed normalized bit outputs to which the gap applies,
    possibly on different output spaces. Suppose their bit registers are kept fixed and their Eve registers are
    embedded in a common output space $F$, giving states $hat(tau)_k$.
    The embeddings must preserve and permit recovery of the full initial purification and complete public records,
    without coarse-graining those records. In particular, an Eve-side recovery channel recovers $tau_k$ from
    $hat(tau)_k$ while leaving the bits fixed. If $hat(tau)_k arrow.r tau$ in trace norm,
    then for every normalized law $sigma_F$,
$ ∥tau - 1 / 2 sum_(i = 0)^1 \| i \, i chevron.r chevron.l i \, i \| ⊗ sigma_F∥_1 gt.eq 1 / 5 . $

]
] <prop:operational-extensions>

#proof[
  For the first assertion, use the canonical factors from Lemma 13.
    Restrict their measure $mu$ to $A$ and replace both $X_0 \( t \) \, X_1 \( t \)$ by $X_0 \( t \) \/ r \,
    X_1 \( t \) \/ r$, leaving the $Y_j \( t \)$ unchanged. Each of the four blocks in (4.2) is divided by $r$,
    and its integral over $A$ is the corresponding normalized accepted block.
    All probabilities and the root fidelity scale by the same factor $1 \/ r$.
    The accepted total trace is one, so the proof of (5.9), including $e lt.eq eta \/ 2$, applies without change.
    The recovery and common-measure arguments cover arbitrary purifications and arbitrary ideal laws for the
    accepted output. No positive lower bound on $r$ was used.
  For the second assertion, let $delta_k$ be the probability of at least one abort,
    let $tau_k^(upright("ok"))$ be the normalized non-aborting state when $delta_k < 1$,
    and let $xi_k$ be the normalized state on the aborting part when $delta_k > 0$.
    The completed state is the sum of these two positive classical parts with weights $1 - delta_k$ and $delta_k$.
    Let $cal(Q)$ be the product of the two local classical channels sending each party’s own abort symbol to zero
    and fixing its bit values. It is defined on every completed output and preserves each non-aborting ideal bit
    $gamma_k$. Since the trace-norm distance between normalized states is at most two,
  $ ∥cal(Q) \( tau_k \) - gamma_k∥_1 lt.eq \( 1 - delta_k \) ∥tau_k^(upright("ok")) - gamma_k∥_1 + 2 delta_k . $
  The right side tends to zero under the stated hypotheses.
    This contradicts Theorem 17 for the completed bit-output protocol with the local replacement appended.
    The replacement uses only abort symbols actually available to the respective laboratories.
  For the third assertion, denote the recovery channel for the $k$th embedding by $cal(R)_k$.
    For any ideal bit $gamma_sigma$ in the common space, applying this channel to Eve maps it to the ideal bit
    $gamma_(cal(R)_k \( sigma \))$ on the $k$th output space and recovers $tau_k$ from $hat(tau)_k$.
    Contraction and the per-protocol gap therefore give
  $ ∥hat(tau)_k - gamma_sigma∥_1 gt.eq ∥tau_k - gamma_(cal(R)_k \( sigma \))∥_1 gt.eq 1 / 5 . $
  The triangle inequality now yields
  $ ∥tau - gamma_sigma∥_1 gt.eq 1 / 5 - ∥hat(tau)_k - tau∥_1 arrow.r 1 / 5 . $
  Only the completed actual outputs need converge. The embeddings must retain and permit recovery of the full
    purification and public records, so they do not coarse-grain that information.
    The argument requires no convergence on the auxiliary probe inputs and no factorization statement for the
    limit itself. In particular, it does not assume that finite padded transcript laws converge in trace norm to a
    law of an infinite transcript. ◻
]

== 6 Tensor geometry from singular directions <sec:geometry>

We now construct the PPT pair in Theorem 2. The geometric step uses a map on $M_4 \( bb(C) \)$ with twenty
  specified singular outputs. It turns each singular output into a product vector in the kernel of a Choi matrix
  on $bb(C)^10 ⊗ bb(C)^10$. A condition on quadratic evaluations then excludes product vectors from the range.

For a vector $x$, write $P_x = x x^(*)$, without normalizing it.
  A projective direction $\[ x \]$ is the complex line spanned by a nonzero vector $x$.

#thm([Proposition 6.1.])[
  (Tensor criterion).  #emph[Let $L : M_4 \( bb(C) \) arrow.r M_4 \( bb(C) \)$ be PPT.
    Suppose that $cal(X) = { x_1 \, dots.h \, x_20 } subset bb(C)^4 \\ {
    0 }$ represents twenty distinct projective directions and has the following properties:]
  + #emph[$"rank" L \( P_x \) < 4$ for every $x in cal(X)$,
    and every nonzero homogeneous quadratic in $bb(C) \[ x_0 \, x_1 \, x_2 \, x_3 \]$ vanishes on at most nine
    members of $cal(X)$;]
  + #emph[$L \( P_y \)$ is positive definite for some $y in bb(C)^4$.]
  #emph[Then there are PPT maps $Phi_1 \, Phi_2 : M_10 \( bb(C) \) arrow.r M_10 \( bb(C) \)$,
    constructed explicitly from $L$, such that
$ Z = J \( Phi_2 compose Phi_1 \) eq.not 0 \, wide "ran" Z ∩ { u ⊗ v : u \, v in bb(C)^10 } = { 0 } . $

 In particular, $Phi_2 compose Phi_1$ is not entanglement breaking.]
] <prop:tensor-criterion>

Section 7 supplies an integer construction of $L$ with these properties.
  We prove the criterion by using the symmetric square to record quadratic monomials and the exterior square to
  detect rank loss.

#proof[
  #emph[Symmetric and exterior tensors.] Index an orthonormal basis of $bb(C)^10$ by pairs $0 lt.eq i lt.eq
    j < 4$, and an orthonormal basis of $bb(C)^6$ by pairs $0 lt.eq i < j < 4$, both in lexicographic order.
    Define isometries $U : bb(C)^10 arrow.r bb(C)^4 ⊗ bb(C)^4$ and $V : bb(C)^6 arrow.r bb(C)^4 ⊗ bb(C)^4$ by
  #[#set math.equation(numbering: n => "(6.1)")
   $ U e_(i i) & = e_i ⊗ e_i \, & U e_(i j) & = frac(e_i ⊗ e_j + e_j ⊗ e_i, sqrt(2)) quad \( i < j \) \,\
V e_(i j) & = frac(e_i ⊗ e_j - e_j ⊗ e_i, sqrt(2)) quad \( i < j \) . $ <eq:UV>]
  Their ranges are the symmetric and antisymmetric tensor subspaces. Put
  #[#set math.equation(numbering: n => "(6.2)")
   $ hat(x) = U^(*) \( x ⊗ x \) = sum_i x_i^2 e_(i i) + sqrt(2) sum_(i < j) x_i x_j e_(i j)
     wide \( x in bb(C)^4 \) . $ <eq:veronese>]
  Thus $U hat(x) = x ⊗ x$ and $U P_(hat(x)) U^(*) = P_x ⊗ P_x$.
    The coordinates of $hat(x)$ are the ten quadratic monomials with nonzero normalization factors.
    Hence the quadratic hypothesis is equivalent to the assertion that any ten vectors among ${ hat(x) :
    x in cal(X) }$ span $bb(C)^10$: a failure to span would give a nonzero vector $u$ with $u^(*) hat(x) =
    0$ at those ten points, and $u^(*) hat(x)$ is a nonzero homogeneous quadratic.
  Identify $bb(C)^6$ with $and.big^2 bb(C)^4$ by $e_(i j) = e_i and e_j$, with this basis orthonormal.
    Under this identification,
  $ V \( a and b \) = frac(a ⊗ b - b ⊗ a, sqrt(2)) . $
  For $i < j$, let $k < l$ be the complementary indices, and let $epsilon.alt_(i j k l)$ be the sign of the
    ordering $\( i \, j \, k \, l \)$ of $\( 0 \, 1 \, 2 \, 3 \)$.
    Define the real signed permutation $K$ on $bb(C)^6$ by
  #[#set math.equation(numbering: n => "(6.3)")
   $ K e_(i j) = epsilon.alt_(i j k l) e_(k l) . $ <eq:complement>]
  Explicitly,
  $ \( K e_01 \, K e_02 \, K e_03 \, K e_12 \, K e_13 \, K e_23 \) = \( e_23 \, - e_13 \, e_12 \, e_03 \, -
    e_02 \, e_01 \) \, $
  so $K = K^(*) = K^(- 1)$. The conjugate operation $w mapsto K
    overline(w)$ is the complementary-pair exterior dual also used by Schliemann, Loss,
    and MacDonald for two fermions in a four-dimensional one-particle space [55] Section III, Equations (26)–(28).
  Define $S \, R : M_10 \( bb(C) \) arrow.r M_6 \( bb(C) \)$ by
  #[#set math.equation(numbering: n => "(6.4)")
   $ S \( A \) = V^(*) \( L ⊗ L \) \( U A U^(*) \) V \, wide R \( A \) = K thin S \( A \)^(sans(T)) K^(*) . $ <eq:SR>]
  The embeddings and compressions are CP, so Lemma 4 makes $S$ PPT.
    The map $T_6 compose S$ is CP by this PPT property, and its output transpose is $S$, which is CP.
    Thus $T_6 compose S$ is PPT, and the CP conjugation by $K$ makes $R$ PPT.
  #emph[The composite Choi matrix.] The rectangular maps give an endomorphism $R^dagger compose S compose
    T_10$ of $M_10 \( bb(C) \)$. To express it as the composition of two maps on that algebra, let $E :
    bb(C)^6 arrow.r bb(C)^10$ be the real coordinate inclusion into the first six positions and define
  #[#set math.equation(numbering: n => "(6.5)")
   $ Phi_1 \( A \) = E thin S \( A^(sans(T)) \) E^(*) \, wide Phi_2 \( B \) =
     R^dagger \( E^(*) B E \) . $ <eq:phi-pair>]
  For $Phi_1$, Lemma 4 makes $S compose T_10$ CP by input/output transpose equivalence,
    and makes its output transpose $T_6 compose S compose T_10$ CP by simultaneous transposition of $S$.
    Thus $S compose T_10$ is PPT, and the CP embedding by $E$ preserves that property.
    The adjoint and CP-composition clauses of the same lemma make $Phi_2$ PPT.
    The formulas determine both maps explicitly once $L$ is given.
    For example, if $L \( A \) = sum_r Q_r A Q_r^(*)$, the adjoints in the construction are
  $ L^dagger \( Y \) & = sum_r Q_r^(*) Y Q_r \,\
S^dagger \( Y \) & = U^(*) \( L^dagger ⊗ L^dagger \) \( V Y V^(*) \) U \,\
R^dagger \( Y \) & = S^dagger #scale(x: 120%, y: 120%)[\(] \( K^(*) Y K \)^(sans(T)) #scale(x: 120%, y: 120%)[\)] . $
  Since $E^(*) E = I_6$, $Phi_2 compose Phi_1 = R^dagger compose S compose T_10$. Its Choi matrix $Z$ is positive.
    The convention (2.1) gives, for arbitrary matrices $a \, b$ of the appropriate sizes,
  $ "tr" #scale(x: 120%, y: 120%)[\[] \( a ⊗ b \) J \( F \) #scale(x: 120%, y: 120%)[\]] =
    "tr" #scale(x: 120%, y: 120%)[\[] b F \( a^(sans(T)) \) #scale(x: 120%, y: 120%)[\]] . $
  For Hermitian $a \, b in M_10 \( bb(C) \)$, the Hilbert–Schmidt adjoint identity therefore gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ "tr" #scale(x: 120%, y: 120%)[\[] \( a ⊗ b \) Z #scale(x: 120%, y: 120%)[\]] =
     "tr" #scale(x: 120%, y: 120%)[\[] b R^dagger \( S \( a \) \) #scale(x: 120%, y: 120%)[\]] =
     "tr" #scale(x: 120%, y: 120%)[\[] R \( b \) S \( a \) #scale(x: 120%, y: 120%)[\]] . $ <eq:choi-pairing>]
  The Choi transpose has canceled the input transpose in (6.5).
    We will prove that the right side vanishes at $a = b = P_(hat(x))$ for each singular direction.
    Positivity of $Z$ will then give the kernel vector $hat(x) ⊗ hat(x)$.
    The positive definite output will separately show that $Z$ is nonzero.
  #emph[Singular outputs and kernel products.] For any operator $B$ on $bb(C)^4$,
  $ V^(*) \( B ⊗ B \) V = and.big^2 B . $
  Both sides send $a and b$ to $B a and B b$. If $B_x = L \( P_x \) succ.curly.eq 0$ and $W_x = "ran" B_x$,
    it follows that
  #[#set math.equation(numbering: n => "(6.7)")
   $ S \( P_(hat(x)) \) = and.big^2 B_x \, wide "ran" S \( P_(hat(x)) \) = and.big^2 W_x . $ <eq:exterior-range>]
  Indeed, in an orthonormal eigenbasis of $B_x$, the exterior eigenvalues are $lambda_i lambda_j$ for $i < j$.
    This proves both positivity and the range identity. A Hermitian matrix $D$ satisfies $D^(sans(T)) =
    overline(D)$, so transposition conjugates its range. Consequently
  #[#set math.equation(numbering: n => "(6.8)")
   $ "ran" R \( P_(hat(x)) \) = K overline(and.big^2 W_x) . $ <eq:complement-range>]
  For exterior two-vectors $w \, u$, let $\[ w and u \]_0123$ denote the coefficient of $e_0 and e_1 and e_2 and
    e_3$. With the Hermitian inner product conjugate-linear in its first argument, the definition of $K$ gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ chevron.l K overline(w) \, u chevron.r = sum_(i < j) w_(i j) epsilon.alt_(i j k l)
     u_(k l) = \[ w and u \]_0123 . $ <eq:wedge-pairing>]
  Here $k < l$ is complementary to $i < j$ in each term. If $w \, u in and.big^2 W$ and $dim W < 4$, then $w and
    u in and.big^4 W = 0$. Equations (6.7)–(6.9) show that $S \( P_(hat(x)) \)$ and $R \( P_(hat(x)) \)$ have
    orthogonal ranges for every $x in cal(X)$. This includes $dim W_x < 2$, when both exterior ranges are zero.
    The conjugation in (6.9) is essential for this conclusion over complex subspaces.
  For $x in cal(X)$, orthogonality of the two positive output ranges gives
  $ \( hat(x) ⊗ hat(x) \)^(*) Z \( hat(x) ⊗ hat(x) \) = "tr" #scale(x: 120%, y: 120%)[\[] R \( P_(hat(x)) \)
    S \( P_(hat(x)) \) #scale(x: 120%, y: 120%)[\]] = 0 . $
  For a positive matrix, $v^(*) Z v = 0$ implies $Z v = 0$. Hence
  #[#set math.equation(numbering: n => "(6.10)")
   $ hat(x) ⊗ hat(x) in ker Z wide \( x in cal(X) \) . $ <eq:kernel-vectors>]
  For the input $y$ in the second hypothesis, $S \( P_(hat(y)) \) =
    and.big^2 \( L \( P_y \) \)$ is positive definite, and so is $R \( P_(hat(y)) \) =
    K S \( P_(hat(y)) \)^(sans(T)) K^(*)$. The trace of their product is strictly positive.
    Equation (6.6) at $a = b = P_(hat(y))$ therefore proves $Z eq.not 0$.
  #emph[Excluding product vectors from the range.] It remains to exclude a product vector from the range.
    The following zero-set argument uses the product-exclusion principle of Bennett and coauthors [10] Lemma 1,
    in the nonorthogonal form given by Pittenger [49] Section IV, Lemma 3,
    and is related to Parthasarathy’s polynomial interpolation construction [45] Proposition 1.3.
    Suppose that a nonzero product $u ⊗ v$ belongs to $"ran" Z$.
    Since $Z$ is Hermitian, its range is the orthogonal complement of its kernel. Equation (6.10) implies
  $ p_u \( x \) p_v \( x \) = 0 quad \( x in cal(X) \) \, wide p_u \( x \) = u^(*) hat(x) \, quad p_v \( x \) =
    v^(*) hat(x) . $
  For example,
  $ p_u \( x \) = sum_i overline(u_(i i)) x_i^2 + sqrt(2) sum_(i < j) overline(u_(i j)) x_i x_j . $
  This is a homogeneous quadratic in $x$; only its fixed coefficients are conjugated.
    Its distinct monomials make it nonzero when $u eq.not 0$. The same holds for $p_v$, since $v eq.not 0$.
    Each polynomial therefore vanishes on at most nine members of $cal(X)$.
    Their zero sets cannot cover all twenty members, because $9 + 9 < 20$.
    This contradiction proves that $"ran" Z$ contains no nonzero product vector.
  By Lemma 6, the nonzero positive matrix $Z$ is nonseparable.
    Lemma 5 then shows that the composite is not entanglement breaking. ◻
]

== 7 An integer pencil and its exact certificate <sec:certificate>

This section verifies every hypothesis of Proposition 19 for an explicit map $L : M_4 \( bb(C) \) arrow.r
  M_4 \( bb(C) \)$. Four integer $6$-by-$4$ matrices $M_0 \, dots.h \, M_3$ define $L$ and the pencil $M \( x \) =
  sum_(i = 0)^3 x_i M_i$. The maximal minors of this pencil identify all singular projective directions.
  Exact reductions at three primes, together with the quotient and Galois arguments below,
  control quadratic evaluations on every ten of those directions.

=== 7.1 The explicit matrix pencil <the-explicit-matrix-pencil>

Use indices $0 \, 1 \, 2 \, 3$ and define real $6$-by-$4$ matrices

#[#set math.equation(numbering: n => "(7.1)")
 $ M_0 & = mat(delim: "(", 6, 0, 0, 0; 0, 6, 0, 0; 0, 0, 6, 0; 0, 0, 0, 6; 0, 0, 0, 0; 0, 0, 0, 0) \, & M_1 & =
   mat(delim: "(", - 12, 0, 0, 0; 0, - 6, 0, 0; 0, 0, 6, 0; 0, 0, 0, 12; - 6, 0, 6, 6; - 6, - 6, 6, 0) \,\
M_2 & = mat(delim: "(", 0, 6, - 2, 0; 6, 6, 0, 2; - 2, 0, 10, 0; 0, 2, 0, 24; 0, 0, 0, 6; 0, - 6, 6, - 6) \, &
  M_3 & =
  mat(delim: "(", 0, 0, - 4, - 3; 0, - 2, - 3, - 4; - 4, - 3, 11, 6; - 3, - 4, 6, 25; 6, 6, 0, 0; 0, - 6, 6, 6) .
  $ <eq:explicit-matrices>]

For $x = \( x_0 \, x_1 \, x_2 \, x_3 \) in bb(C)^4$, put $M \( x \) =
  sum_(i = 0)^3 x_i M_i$ and define the complex-linear map $L$ on matrix units by

#[#set math.equation(numbering: n => "(7.2)")
 $ L \( E_(i j) \) = M_i^(sans(T)) M_j wide \( 0 lt.eq i \, j < 4 \) . $ <eq:L>]

#thm([Lemma 7.1.])[
  #emph[The map $L : M_4 \( bb(C) \) arrow.r M_4 \( bb(C) \)$ in (7.2) is PPT. For every $x in bb(C)^4$,
#[#set math.equation(numbering: n => "(7.3)")
 $ L \( P_x \) = M \( x \)^(sans(T)) overline(M \( x \)) = M \( x \)^(*) M \( x \) \, wide "rank" L \( P_x \) =
   "rank" M \( x \) . $ <eq:gram-identity>]

 Moreover, $L \( P_(e_0) \) = 36 I_4$.]
] <lem:pencil-ppt>

#proof[
  Direct integer multiplication gives
  #[#set math.equation(numbering: n => "(7.4)")
   $ M_i^(sans(T)) M_j = M_j^(sans(T)) M_i wide \( 0 lt.eq i \, j < 4 \) . $ <eq:block-symmetry>]
  The exact checker in Appendix 11 verifies these equalities.
    For each row $r$, let $Q_r$ be the $4$-by-$4$ matrix whose $i$th column is the transpose of row $r$ of $M_i$.
    Comparing entries gives $L \( A \) = sum_(r = 1)^6 Q_r A Q_r^(*)$, so $L$ is CP.
    Equation (7.4) also makes every $M_i^(sans(T)) M_j$ symmetric.
    Therefore $T_4 compose L = L$, proving the PPT property.
  For complex $x$, expansion of (7.2) gives
  $ L \( P_x \) = sum_(i \, j) x_i overline(x_j) M_i^(sans(T)) M_j = M \( x \)^(sans(T)) overline(M \( x \)) . $
  Interchanging $i \, j$ and using (7.4) gives the second expression in (7.3).
    Since $v^(*) M \( x \)^(*) M \( x \) v = ∥M \( x \) v∥^2$, the kernel of this Gram matrix is $ker M \( x \)$,
    which proves the rank equality. Finally, $M_0^(sans(T)) M_0 = 36 I_4$. ◻
]

The positive-definite input required by the tensor criterion is now available.
  The remaining assertion concerns every complex rank-loss direction of the pencil.

#thm([Proposition 7.2.])[
  (Twenty rank-loss directions with independent quadratic evaluations).  #emph[The projective directions $\[ x \]
    in bb(P)^3 \( bb(C) \)$ for which $"rank" M \( x \) < 4$ consist of exactly twenty distinct points.
    Each has a unique representative $x = \( 1 \, t_1 \, t_2 \, t_3 \)$.
    Every nonzero homogeneous quadratic in $bb(C) \[ x_0 \, x_1 \, x_2 \, x_3 \]$ vanishes on at most nine of
    these representatives.]
] <prop:twenty-directions>

The equation $M \( x \) y = 0$ with $x \, y eq.not 0$ is related to the bilinear kernel geometry studied by
  Hansen, Hauge, Myrheim, and Sollid for $4$-by-$4$ PPT states whose matrix and partial transpose both have rank
  six [27] Sections 2.2 and 7. Their generic count concerns twenty product rays $x ⊗ y$.
  The quadratic condition here concerns the vectors $x ⊗ x$ for this specific pencil,
  and the following argument proves it from exact data.

#emph[Proof of Proposition 21.] The maximal-minor relations first show that the affine quotient is nonzero and
  spanned by twenty monomials. We then construct a formal multiplication matrix.
  Its irreducible characteristic polynomial, certified modulo $41$,
  proves that the spanning monomials are independent and that the quotient is a degree-twenty field.
  This identifies all twenty complex directions. Finally, reductions at $131$ and $139$ give the full symmetric
  Galois action, which transports one independent set of ten quadratic evaluations to every such set.
  The three general algebraic facts used along the way are stated at their uses;
  their proofs are collected in Appendix 11.2.

The checker in Appendix 11 supplies the integer block identities and the finite modular data used in these stages.
  It does not enumerate the twenty complex directions or their ten-point determinants.
  The quotient, projective, and Galois deductions are proved below.

=== 7.2 The maximal minors and a nonzero quotient <the-maximal-minors-and-a-nonzero-quotient>

Because $M \( x \)$ has four columns, the condition $"rank" M \( x \) <
  4$ is equivalent to simultaneous vanishing of its fifteen maximal minors.
  For each four-element subset $rho subset { 1 \, dots.h \, 6 }$,
  taken in lexicographic order with its rows in increasing order,
  let $Delta_rho \( x \)$ be the determinant of those rows of $M \( x \)$.
  Put $p_rho \( t \) = Delta_rho \( 1 \, t_1 \, t_2 \, t_3 \)$ and define

$ I = \( p_rho \)_rho subset bb(Q) \[ t_1 \, t_2 \, t_3 \] \, wide cal(A) = bb(Q) \[ t_1 \, t_2 \, t_3 \] \/ I . $

These equations describe the singular directions in the chart $x_0 = 1$.
  We have not yet proved that $I$ is proper, or that this chart contains all the singular directions.

Order monomials first by increasing total degree $d$ and, within degree $d$, by the exponent triples

#[#set math.equation(numbering: n => "(7.5)")
 $ \( a \, b \, d - a - b \) \, wide a = 0 \, dots.h \, d \, quad b = 0 \, dots.h \, d - a \, $ <eq:monomial-order>]

in the displayed nested order. Let $v$ be the column of the twenty monomials of degree at most three,
  and let $w$ be the column of the fifteen monomials of degree four.
  The coefficients of the minors define integer matrices $D \, H$ by

#[#set math.equation(numbering: n => "(7.6)")
 $ \( p_rho \( t \) \)_rho = D v \( t \) + H w \( t \) \, wide D in bb(Z)^(15 times 20) \, quad
   H in bb(Z)^(15 times 15) . $ <eq:DH>]

The exact coefficient calculation in Appendix 11 gives $det H equiv 40 med \( mod med 41 \)$,
  so $H$ is invertible over $bb(Q)$. Define $C = - H^(- 1) D$.
  In the quotient $cal(A)$, Equation (7.6) gives the relations $w = C v$,
  expressing each degree-four monomial as a linear combination of the twenty lower monomials.

The relations $w = C v$ must describe a nonzero quotient before they can be used to count its points.
  We first verify this and show that the low monomials span.
  The existence argument uses the following intersection fact for $bb(P)^3 times bb(P)^3$.

#thm([Lemma 7.3.])[
  (Six bilinear equations).  #emph[Any six complex bilinear forms on $bb(C)^4 times
    bb(C)^4$ have a common zero $\( x \, y \)$ with $x eq.not 0$ and $y eq.not 0$.]
] <lem:six-bilinear>

The proof is given in Appendix 11.2.

Apply the lemma to the six rows of $M \( x \) y$. It gives $x \, y eq.not 0$ with $M \( x \) y = 0$,
  so all $Delta_rho \( x \)$ vanish.

The homogeneous degree-four part of $p_rho \( t \)$ is $Delta_rho \( 0 \, t_1 \, t_2 \, t_3 \)$.
  Equation (7.6) therefore gives

$ #scale(x: 120%, y: 120%)[\(] Delta_rho \( 0 \, t \) #scale(x: 120%, y: 120%)[\)]_rho = H w \( t \) . $

If a common zero had $x_0 = 0$, invertibility of $H$ would imply $w \( t \) = 0$.
  The entries $t_1^4 \, t_2^4 \, t_3^4$ occur in $w$, so $t = 0$, contradicting $x eq.not 0$.
  Thus every projective common zero lies in the chart $x_0 = 1$.
  Rescaling the zero furnished by the lemma gives an affine common zero of the $p_rho$,
  proving that $I$ is proper and $cal(A) eq.not 0$. The same argument has excluded all points at infinity.

In $cal(A)$, the relations $w = C v$ show that the twenty low monomials span.
  In a monomial of total degree at least four, substitute for any degree-four factor.
  Each resulting term has strictly smaller total degree. Induction reduces every monomial to a linear combination
  of the low monomials; this proves spanning without assuming unique reductions.

=== 7.3 A formal multiplication operator <a-formal-multiplication-operator>

Multiplication matrices are a standard way to encode finite polynomial systems; see Sottile [57] Section 2.3.
  The quotient $cal(A)$ is now known to be nonzero and spanned by the twenty low monomials,
  but their independence remains to be proved. Take a formal twenty-dimensional rational vector space with basis
  $e_alpha$ indexed by exponent triples $\| alpha \| lt.eq 3$, in the order (7.5).
  Define an endomorphism $N$ of this formal space and its characteristic polynomial by

#[#set math.equation(numbering: n => "(7.7)")
 $ N e_alpha =
   cases(delim: "{", e_(alpha + \( 1 \, 0 \, 0 \)) \, & \| alpha \| lt.eq 2 \,, sum_(\| beta \| lt.eq 3)
   C_(alpha + \( 1 \, 0 \, 0 \) \, beta) e_beta \, & \| alpha \| = 3 \,) wide f \( z \) =
   det \( z I_20 - N \) . $ <eq:N>]

The row index of $C$ in the second line is the indicated degree-four monomial.
  Let $pi : bb(Q)^20 arrow.r cal(A)$ send $e_alpha$ to the class of $t^alpha$,
  and let $mu_1$ be multiplication by the class of $t_1$. The spanning result makes $pi$ surjective.
  By the definition of $N$,

#[#set math.equation(numbering: n => "(7.8)")
 $ pi N = mu_1 pi . $ <eq:intertwining>]

In particular, $ker pi$ is an $N$-invariant rational subspace.
  We will use irreducibility of $f$ to show that this kernel is zero,
  which will identify $N$ with multiplication by $t_1$.

For a prime $p$ with $det H equiv.not 0 med \( mod med p \)$, set

$ bb(Z)_(\( p \)) = { a \/ b : a \, b in bb(Z) \, med p divides.not b } . $

The identity $H^(- 1) = "adj" \( H \) \/ det H$ shows that the entries of $C \,
  N$ and the coefficients of the monic polynomial $f$ lie in $bb(Z)_(\( p \))$.
  In particular their denominators are units at $p$, and reduction gives $overline(f) =
  det \( z I_20 - overline(N) \) in bb(F)_p \[ z \]$. This is a statement of integrality at the specified prime;
  no global integrality of the coefficients of $f$ is needed.

For $k gt.eq 1$, put

$ d_p \( k \) = deg gcd \( overline(f) \, z^(p^k) - z \) . $

The exact calculation in Appendix 11 gives the computed columns of Table 1.
  Its output also records all twenty-one characteristic coefficients and all twenty gcd degrees at each prime.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, left, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$det H med mod med p$
], table.cell(rowspan: 1, colspan: 1)[computed gcd degrees
], table.cell(rowspan: 1, colspan: 1)[deduced factor degrees
]),
  table.cell(rowspan: 1, colspan: 1)[41
], table.cell(rowspan: 1, colspan: 1)[40
], table.cell(rowspan: 1, colspan: 1)[$d_41 \( k \) = 0 med \( 1 lt.eq k < 20 \) \, med d_41 \( 20 \) = 20$
], table.cell(rowspan: 1, colspan: 1)[$20$
],
  table.cell(rowspan: 1, colspan: 1)[131
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[$d_131 \( 1 \) = 1 \, med d_131 \( 2 \) = 3 \, med d_131 \( 17 \) = 18$
], table.cell(rowspan: 1, colspan: 1)[$1 \, 2 \, 17$
],
  table.cell(rowspan: 1, colspan: 1)[139
], table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[$d_139 \( 1 \) = 1 \, med d_139 \( 19 \) = 20$
], table.cell(rowspan: 1, colspan: 1)[$1 \, 19$
],
)
]],
  caption: [Table 1: Computed modular data and the factor degrees deduced from them. ],
)

The determinant residues justify all three local reductions.
  The primes exceed twenty, so the divisions in the Newton identities used to compute the characteristic
  polynomials are valid. Their primality follows by trial division by the primes at most eleven.

We explain the last column of the table. Over $bb(F)_p$ the polynomial $z^(p^k) - z$ is squarefree,
  since its derivative is $- 1$. Its irreducible factors are precisely the monic irreducible polynomials whose
  degrees divide $k$: a root of an irreducible polynomial of degree $s$ has a Frobenius orbit of length $s$.
  Hence $d_p \( k \)$ is the sum of the degrees of the #emph[distinct] irreducible factors of $overline(f)$ whose
  degrees divide $k$. At $p = 41$, a factor of degree $s < 20$ would make $d_41 \( s \)$ positive,
  so $overline(f)$ is irreducible of degree twenty. At $p = 131$,
  the three displayed values force one factor of degree one, one of degree two, and one of degree seventeen.
  These degrees already sum to twenty, so there are no further or repeated factors.
  The two values at $p = 139$ similarly force one factor of degree one and one of degree nineteen,
  without repetition. All three reductions are squarefree.

The following elementary reduction lemma lets us infer rational irreducibility without assuming that $f$ has
  integer coefficients. Its $p$-adic form is used in the proof of Lemma 24 in Appendix 11.2.

#thm([Lemma 7.4.])[
  (Monic local reduction).  #emph[Let $p$ be a prime, and let the coefficient field and its valuation ring be one
    of the pairs
$ \( bb(L) \, R_p \) = \( bb(Q) \, bb(Z)_(\( p \)) \) quad
  upright("or") quad \( bb(L) \, R_p \) = \( bb(Q)_p \, bb(Z)_p \) . $

 If a monic polynomial $P in R_p \[ z \]$ factors as $P = g h$ with monic $g \, h in bb(L) \[ z \]$, then $g \,
   h in R_p \[ z \]$, and their reductions modulo $p$ retain their degrees, including degree zero.
   Consequently, if $P$ has positive degree and irreducible reduction in $bb(F)_p \[ z \]$,
   then $P$ is irreducible over $bb(L)$.]
] <lem:monic-local-reduction>

The proof is given in Appendix 11.2.

Applying the lemma to $f in bb(Z)_(\( 41 \)) \[ z \]$ and its irreducible reduction proves that $f$ is irreducible
  over $bb(Q)$.

=== 7.4 The coordinate field and its twenty points <the-coordinate-field-and-its-twenty-points>

We can now prove independence of the twenty spanning monomials.
  An endomorphism with irreducible characteristic polynomial has no nonzero proper invariant subspace:
  a basis adapted to such a subspace makes the matrix block triangular and factors its characteristic polynomial
  into those of the restriction and quotient. Since $pi$ is surjective and $cal(A) eq.not 0$,
  its kernel is proper. Irreducibility of $f$ forces $ker pi = 0$.
  The twenty low monomials are therefore a basis of $cal(A)$, and $N$ is its multiplication matrix for $t_1$.

By Cayley–Hamilton the minimal polynomial of $N$ divides $f$.
  It is nonconstant, so irreducibility of $f$ makes it equal to $f$.
  In a nonzero unital algebra, a polynomial in an element vanishes exactly when the same polynomial in its
  multiplication operator vanishes; the reverse implication follows by applying the operator to $1$.
  Hence the subalgebra generated by $t_1$ is $bb(Q) \[ z \] \/ \( f \)$ and has dimension twenty.
  It is already all of $cal(A)$:

#[#set math.equation(numbering: n => "(7.9)")
 $ cal(A) tilde.eq bb(Q) \[ z \] \/ \( f \) \, wide z mapsto t_1 . $ <eq:coordinate-field>]

In particular $cal(A)$ is a field. Write the classes of $t_2 \, t_3$ as $h_2 \( t_1 \) \,
  h_3 \( t_1 \)$ with $h_2 \, h_3 in bb(Q) \[ z \]$ of degree below twenty.

The irreducible polynomial $f$ is separable in characteristic zero.
  Let its distinct complex roots be $lambda_1 \, dots.h \, lambda_20$.
  Extending scalars in (7.9) and applying the Chinese remainder theorem gives

#[#set math.equation(numbering: n => "(7.10)")
 $ bb(C) \[ t_1 \, t_2 \, t_3 \] \/ I bb(C) \[ t_1 \, t_2 \, t_3 \] tilde.eq bb(C) \[ z \] \/ \( f \) tilde.eq
   product_(j = 1)^20 bb(C) . $ <eq:split-algebra>]

The factors are evaluations at the distinct triples

#[#set math.equation(numbering: n => "(7.11)")
 $ t^(\( j \)) = \( lambda_j \, h_2 \( lambda_j \) \, h_3 \( lambda_j \) \) . $ <eq:points>]

Conversely, any complex common zero of the $p_rho$ defines a unital $bb(C)$-algebra homomorphism from the left
  side of (7.10) to $bb(C)$, and such a homomorphism selects one factor of the product.
  Thus the triples in (7.11) are all the affine common zeros.
  The product of fields also shows that the complex ideal is radical, so these twenty points are reduced.
  Together with the exclusion of $x_0 = 0$, this identifies all complex projective singular directions of the pencil.

=== 7.5 Local Frobenius and quadratic evaluations <local-frobenius-and-quadratic-evaluations>

It remains to prove that no nonzero quadratic vanishes on ten of the directions.
  We will show that the Galois group of the splitting field permutes the twenty roots arbitrarily.
  This transports independence for one set of ten evaluations to every set of ten.

The following is the locally integral form of the Frobenius factorization principle,
  often called Dedekind’s theorem. Milne states the monic integer case [43] Theorem 4.28.
  We give the local rational argument needed for the coefficients of $f$.

#thm([Lemma 7.5.])[
  (Locally integral Frobenius).  #emph[Let $F in bb(Q) \[ z \]$ be monic, separable, and of positive degree,
    with coefficients in $bb(Z)_(\( p \))$. If its reduction in $bb(F)_p \[ z \]$ is squarefree with
    irreducible-factor degrees $s_1 \, dots.h \, s_h$, then the Galois group of its rational splitting field
    contains an element with cycle lengths $s_1 \, dots.h \, s_h$ on the roots.]
] <lem:local-frobenius>

The proof is given in Appendix 11.2.

Let $bb(K) subset bb(C)$ be a splitting field of $f$, and let $G =
  "Gal" \( bb(K) \/ bb(Q) \)$ act on its twenty roots. Applying Lemma 24 to the reductions at $131$ and $139$
  gives elements of cycle types $\( 1 \, 2 \, 17 \)$ and $\( 1 \, 19 \)$.
  Irreducibility of $f$ makes this action transitive. A nineteen-cycle fixes one root and is transitive on the
  other nineteen, so the stabilizer of that root is transitive on its complement.
  Transitivity conjugates this property to every point stabilizer;
  hence $G$ is transitive on ordered pairs of distinct roots, or two-transitive.
  The seventeenth power of an element of type $\( 1 \, 2 \, 17 \)$ is a transposition.
  Two-transitivity sends its two entries to any ordered pair, and conjugation therefore gives every transposition. Thus

#[#set math.equation(numbering: n => "(7.12)")
 $ G = S_20 . $ <eq:galois-group>]

This is the elementary permutation criterion recorded in Milne [43] Lemma 4.31.
  The group in (7.12) is the splitting-field group acting on the twenty roots.

Form the $20$-by-$10$ evaluation matrix over $bb(K)$

$ cal(E)_(j \, alpha) = \( t^(\( j \)) \)^alpha \, wide 1 lt.eq j lt.eq 20 \, quad \| alpha \| lt.eq 2 . $

Its entries lie in $bb(K)$ by (7.11). The ten column monomials belong to the basis of $cal(A)$ already proved
  above. They remain independent after scalar extension to $bb(K)$,
  where the split algebra is $bb(K)^20$ through evaluation at the twenty triples.
  Hence $cal(E)$ has column rank ten over $bb(K)$, so some ten-row square submatrix has nonzero determinant.

Every $sigma in G$ permutes the triples in (7.11) according to its permutation of the roots, since $h_2 \,
  h_3$ have rational coefficients. In particular $sigma \( cal(E)_(j \, alpha) \) =
  cal(E)_(sigma \( j \) \, alpha)$. The group $S_20$ is transitive on ten-element subsets.
  Applying a suitable $sigma$ to the known nonzero determinant therefore gives, up to a row-order sign,
  the determinant for any prescribed ten rows. A field automorphism preserves nonzero elements,
  so every such determinant is nonzero in $bb(K)$ and hence in $bb(C)$.
  The Galois action has been used only on algebraic determinants;
  their nonvanishing gives invertibility for arbitrary complex coefficient vectors.

Every homogeneous quadratic has a unique expression

$ q \( x_0 \, x_1 \, x_2 \, x_3 \) = sum_(\| alpha \| lt.eq 2) a_alpha x_0^(2 - \| alpha \|) x_1^(alpha_1)
  x_2^(alpha_2) x_3^(alpha_3) . $

Its dehomogenization $q \( 1 \, t \)$ is nonzero exactly when $q$ is nonzero.
  If it vanished at ten triples, the corresponding invertible evaluation matrix would force every $a_alpha = 0$.
  Thus it vanishes on at most nine triples. The identification of all common zeros above, the exclusion of $x_0 =
  0$, and the equivalence between vanishing of the maximal minors and $"rank" M \( x \) <
  4$ now prove Proposition 21.0◻

#proof[
  Take $L$ from (7.2). Lemma 20 supplies its PPT property, the rank identity,
    and the positive-definite input $L \( P_(e_0) \) = 36 I_4$.
    Proposition 21 supplies the twenty distinct directions and the quadratic bound.
    Proposition 19 therefore applies, with the explicit maps in (6.5) determined by the integer matrices (7.1).
  The positive test also gives an exact nonzero Choi value. Since $hat(e_0) = e_00$, Equations (6.4) and (6.6) yield
  $ S \( P_(e_00) \) = R \( P_(e_00) \) = 36^2 I_6 \, wide \( e_00 ⊗ e_00 \)^(*) Z \( e_00 ⊗ e_00 \) =
    6 dot.op 36^4 = 10 \, 077 \, 696 > 0 . $
  Thus the constructed pair has the asserted nonzero product-free composite Choi range,
    and its composite is not entanglement breaking. ◻
]

== 8 The state and a trace-preserving channel <sec:applications>

We now combine the two independent inputs to the main state theorem:
  the operational obstruction for the represented class and the product-free Choi range of the explicit
  dimension-ten pair.

#proof[
  Take $Phi_1 \, Phi_2$ from (6.5) and put $Z = J \( Phi_2 compose Phi_1 \)$.
    Theorem 2 proves that $Z$ is nonzero and that its range contains no nonzero product vector.
    It is positive because $Phi_2 compose Phi_1$ is CP. Thus $lambda = "tr" Z > 0$, and $rho =
    Z \/ lambda$ is a density operator on $bb(C)^10 ⊗ bb(C)^10$ with the same range as $Z$.
    Lemma 6 makes $rho$ entangled.
  Both maps are PPT. Lemma 9, with $a = b = c = 10$, gives
  $ rho = \( Phi_1^sharp ⊗ Phi_2 \) (frac(Omega_10 Omega_10^(*), lambda)) in cal(C) . $
  In particular, the representing vector is $Omega_10 \/ sqrt(lambda)$; normalization is by the actual Choi trace.
    Theorem 17 now gives (1.1) for every $n gt.eq 1$ and every protocol and ideal bit in its stated scope,
    including the purification and complete public record. The same theorem gives $K_D \( rho \) = 0$.
    All matrices defining $rho$ are specified by (7.1) and (6.5), so the state is explicit. ◻
]

The maps $Phi_1 \, Phi_2$ need not preserve trace. The next proposition converts any square PPT pair into a
  trace-preserving PPT channel, while retaining the pair’s composite Choi matrix in a local corner.
  The two-block switch follows Christandl, Müller-Hermes, and Wolf [16] Section IV.A.
  The enlarged-input absorbing flag follows Filippov’s trace-preserving extension [21] Proposition 3, Equation (15).

#thm([Proposition 8.1.])[
  #emph[Let $Psi_1 \, Psi_2 : M_() \( bb(C) \) m arrow.r M_() \( bb(C) \) m$ be PPT maps.
    There are explicitly defined constants $c_1 \, c_2 > 0$, a trace-preserving PPT channel $Theta :
    M_(2 m + 1) \( bb(C) \) arrow.r M_(2 m + 1) \( bb(C) \)$, and a real coordinate isometry $W_0 :
    bb(C)^m arrow.r bb(C)^(2 m + 1)$ such that
#[#set math.equation(numbering: n => "(8.1)")
 $ \( W_0^(*) ⊗ W_0^(*) \) J \( Theta compose Theta \) \( W_0 ⊗ W_0 \) =
   c_1 c_2 J \( Psi_2 compose Psi_1 \) . $ <eq:choi-corner>]

 If $J \( Psi_2 compose Psi_1 \)$ is nonseparable, then $Theta compose Theta$ is not entanglement breaking.]
] <prop:channel-completion>

#proof[
  Define
  #[#set math.equation(numbering: n => "(8.2)")
   $ A_i = Psi_i^dagger \( I_m \) \, wide c_i = frac(1, 1 + "tr" A_i) \, wide F_i = I_m -
     c_i A_i quad \( i = 1 \, 2 \) . $ <eq:channel-effects>]
  The adjoint of a CP map is CP, so $A_i succ.curly.eq 0$. Since $A_i prec.curly.eq \( "tr" A_i \) I_m$,
    we have $F_i succ.curly.eq \( 1 - c_i "tr" A_i \) I_m = c_i I_m succ 0$.
    The adjoint identity, using that $A_i$ is Hermitian, gives
  $ "tr" Psi_i \( B \) = "tr" \( A_i B \) \, wide "tr" B - c_i "tr" Psi_i \( B \) = "tr" \( F_i B \) $
  for every complex matrix $B$. Hence $c_i Psi_i$ is trace nonincreasing on positive inputs,
    and the positive effect $F_i$ records the missing trace.
  Use the standard-coordinate decomposition
  $ bb(C)^(2 m + 1) = bb(C)_0^m xor bb(C)_1^m xor bb(C) e_star.op \, $
  and let $W_0 \, W_1$ be the real coordinate inclusions. For $X in M_(2 m + 1) \( bb(C) \)$ write $X_(j j) =
    W_j^(*) X W_j$, $x_star.op = e_star.op^(*) X e_star.op$, and $P_star.op = e_star.op e_star.op^(*)$. Set
  #[#set math.equation(numbering: n => "(8.3)")
   $ Theta \( X \) =  & c_2 W_0 Psi_2 \( X_11 \) W_0^(*) + c_1 W_1 Psi_1 \( X_00 \) W_1^(*)\
 & + #scale(x: 120%, y: 120%)[\(] "tr" \( F_1 X_00 \) + "tr" \( F_2 X_11 \) +
   x_star.op #scale(x: 120%, y: 120%)[\)] P_star.op . $ <eq:channel>]
  The formula discards the off-diagonal input blocks. The two moving branches are CP compositions.
    For the flag branches, take spectral decompositions $F_i = sum_r lambda_(i r) v_(i r) v_(i r)^(*)$ and set
  $ K_(i r) = sqrt(lambda_(i r)) thin e_star.op v_(i r)^(*) W_(i - 1)^(*) quad \( i = 1 \, 2 \) . $
  Then $"tr" \( F_i X_(i - 1 \, i - 1) \) P_star.op = sum_r K_(i r) X K_(i r)^(*)$.
    The remaining flag term is $P_star.op X P_star.op$. Thus $Theta$ is CP.
    Since $c_i A_i + F_i = I_m$, for every complex $X$,
  $ "tr" Theta \( X \) & = "tr" #scale(x: 120%, y: 120%)[\[] \( c_1 A_1 + F_1 \) X_00
    #scale(x: 120%, y: 120%)[\]] + "tr" #scale(x: 120%, y: 120%)[\[] \( c_2 A_2 + F_2 \) X_11
    #scale(x: 120%, y: 120%)[\]] + x_star.op\
 & = "tr" X_00 + "tr" X_11 + x_star.op = "tr" X . $
  The discarded blocks have zero trace, so $Theta$ is trace preserving.
  Because $W_0 \, W_1 \, e_star.op$ have real coordinates, output transposition in (8.3) replaces $Psi_i$ by $T_m
    compose Psi_i$ in the moving branches and fixes the flag output. Coordinate transpose is complex-linear:
    it does not conjugate the possibly complex scalar multiplying $P_star.op$. The effects $F_i$ need not be real.
    Each transposed moving branch is CP by the PPT hypothesis, and the flag branches are CP as shown above.
    Therefore $T_(2 m + 1) compose Theta$ is CP, proving that $Theta$ is PPT.
  The flag is absorbing: $Theta \( P_star.op \) = P_star.op$.
    Applying (8.3) twice to an input on the first block gives, for every $B in M_() \( bb(C) \) m$,
  $ Theta^2 \( W_0 B W_0^(*) \) =  & c_1 c_2 W_0 Psi_2 \( Psi_1 \( B \) \) W_0^(*)\
 & + #scale(x: 120%, y: 120%)[\(] "tr" \( F_1 B \) + c_1 "tr" \( F_2 Psi_1 \( B \) \) #scale(x: 120%, y: 120%)[\)]
   P_star.op . $
  Compression to that block consequently gives
  #[#set math.equation(numbering: n => "(8.4)")
   $ W_0^(*) Theta^2 \( W_0 B W_0^(*) \) W_0 = c_1 c_2 Psi_2 \( Psi_1 \( B \) \) . $ <eq:square-corner>]
  Expanding in the coordinate matrix units of the input turns (8.4) into (8.1).
    The coordinate qualification fixes the reference factor: for general complex isometries $W \,
    V$ and a compatible map $Gamma$,
  $ J #scale(x: 120%, y: 120%)[\(] B mapsto V^(*) Gamma \( W B W^(*) \) V
    #scale(x: 120%, y: 120%)[\)] = \( W^(sans(T)) ⊗ V^(*) \) J \( Gamma \) \( overline(W) ⊗ V \) . $
  Here $W_0$ is real, so the reference factor is exactly the one displayed in (8.1).
  Local compression preserves separability, since it takes a positive product $A ⊗
    B$ to $\( W_0^(*) A W_0 \) ⊗ \( W_0^(*) B W_0 \)$. Thus separability of $J \( Theta^2 \)$ would imply
    separability of the positive multiple $c_1 c_2 J \( Psi_2 compose Psi_1 \)$ in (8.1).
    This proves the last assertion. ◻
]

#proof[
  Apply Proposition 25 with $m = 10$ and $Psi_i = Phi_i$ from (6.5).
    Their composite Choi matrix is nonseparable by Theorem 2 and Lemma 6.
    Formula (8.3) therefore gives the required PPT channel on $M_21 \( bb(C) \)$. ◻
]

The product-free range assertion is used for the compressed matrix $Z$.
  The full channel Choi matrix has a product contribution from the absorbing flag:
  since $Theta$ annihilates off-diagonal blocks involving $e_star.op$ and $Theta \( P_star.op \) = P_star.op$,
  the matrix $P_star.op ⊗ P_star.op$ is a direct summand of $J \( Theta^2 \)$.
  The channel conclusion is the nonseparability of the full Choi matrix, certified by its entangled corner.

== 9 An alternative construction from projection overlaps <sec:projection>

The dimension-ten construction is complete. Sections 9 and 10 now produce another entangled member of $cal(C)$ in
  much larger finite dimensions. The real construction has an additional symmetry:
  the same trace-preserving rectangular PPT channel acts on both halves of a maximally entangled state.
  These are parallel local actions on two subsystems, distinct from the self-composition of a square channel in
  Theorem 3.

The mechanism also differs from the dimension-ten range obstruction.
  The input consists of real unit vectors and projective measurements.
  The vectors produce a large sum of correlations, whereas zero trace overlaps among the projections restrict the
  supports of the product vectors in a hypothetical separable decomposition. These two bounds will conflict.
  Trace Gram matrices of positive factors also occur in completely positive semidefinite factorizations [51];
  here the zero pattern of such trace pairings supplies the support restriction.

For self-adjoint projections $E \, F$, their trace overlap is always a nonnegative real number:

#[#set math.equation(numbering: n => "(9.1)")
 $ "tr" \( E F \) = "tr" \( F E F \) = "tr" #scale(x: 120%, y: 120%)[\(] \( E F \)^(*) E F
   #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:projection-overlap>]

In particular, it vanishes exactly when $E F = 0$. This fact does not require $E$ and $F$ to commute.

#thm([Proposition 9.1.])[
  (Rectangular projection criterion).  #emph[Let $Q \, K \, D$ be positive integers,
    let $cal(Q)$ be a set of $Q$ elements, and let $u_q in bb(R)^K$, $q in cal(Q)$, be unit vectors.
    Put $c_(q r) = u_q^(sans(T)) u_r$. For each $q$, let ${ P_i :
    i in cal(I)_q }$ be a finite projective measurement on $bb(C)^D$:
    its members are self-adjoint projections, they are mutually orthogonal, and their sum is $I_D$.
    Zero projections are allowed. Take the label sets $cal(I)_q$ disjoint, put $cal(I) =
    union.sq.big_(q in cal(Q)) cal(I)_q$, and set $n = \| cal(I) \|$. Suppose that]
  + #emph[$P_i P_j = P_j P_i$ whenever $i in cal(I)_q$, $j in cal(I)_r$, and $c_(q r) eq.not 0$;]
  + #emph[there is a real number $kappa < Q \/ K$ such that every $J subset.eq
    cal(I)$ satisfying $"tr" \( P_i P_j \) > 0$ for all distinct $i \, j in J$ has $\| J \| lt.eq kappa$.]
  #emph[After ordering $cal(I)$, define the complex-linear map $Psi : M_() \( bb(C) \) n arrow.r
    M_() \( bb(C) \) D$ on matrix units by
#[#set math.equation(numbering: n => "(9.2)")
 $ H_(i j) = c_(q r) P_i P_j \, wide Psi \( E_(i j) \) = H_(i j) quad \( i in cal(I)_q \, med j in cal(I)_r \) .
   $ <eq:projection-map>]

 Then $Psi$ and its Hilbert–Schmidt adjoint $Psi^dagger : M_() \( bb(C) \) D arrow.r M_() \( bb(C) \) n$ are PPT.
   Moreover,
#[#set math.equation(numbering: n => "(9.3)")
 $ C := J \( Psi^dagger compose Psi \) quad upright("is nonseparable over ") bb(C)^n ⊗ bb(C)^n \, wide "tr" C =
   Q^2 D . $ <eq:projection-composite>]

]
] <prop:projection-criterion>

#proof[
  We first prove that $Psi$ is PPT. To establish nonseparability,
    let $B$ be the compression of $C$ to the span of the vectors $e_i ⊗ e_i$, expressed in that basis,
    and let $upright(bold(1)) = \( 1 \, dots.h \, 1 \)^(sans(T))$.
    We will compare two bounds on the sum of its entries. The vector Gram matrix gives
  $ upright(bold(1))^(*) B upright(bold(1)) gt.eq Q / K "tr" B \, $
  whereas the zero tensor-basis diagonal entries would force a separable decomposition of $C$ to satisfy
    $upright(bold(1))^(*) B upright(bold(1)) lt.eq kappa "tr" B$.
    We will also have $"tr" B = Q D > 0$, so the strict inequality $kappa < Q \/ K$ will make these bounds incompatible.
  #emph[The block Gram matrix and its partial transposes.] Regard each $u_q$ also as a vector in $bb(C)^K$.
    For arbitrary $w_i in bb(C)^D$, self-adjointness of the projections gives
  #[#set math.equation(numbering: n => "(9.4)")
   $ sum_(i \, j in cal(I)) chevron.l w_i \, H_(i j) w_j chevron.r = ∥sum_(q in cal(Q)) sum_(i in cal(I)_q) u_q ⊗
     P_i w_i∥^2 gt.eq 0 . $ <eq:projection-block-gram>]
  Thus the block matrix $H = \[ H_(i j) \]_(i \, j in cal(I)) = J \( Psi \)$ is positive semidefinite.
    Lemma 5 implies that $Psi$ is CP.
  Since $c_(q r) = c_(r q)$ is real, the first hypothesis gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ H_(i j) = H_(j i) = H_(i j)^(*) . $ <eq:projection-block-symmetry>]
  Indeed, if $c_(q r) eq.not 0$, the two projections commute; if $c_(q r) = 0$,
    both blocks vanish and no commutation is needed. Let $Gamma_1 = T_n ⊗ upright("id")_D$ and $Gamma_2 =
    upright("id")_n ⊗ T_D$ denote the partial transposes on the input and output Choi factors. Block symmetry gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ H^(Gamma_1) = H \, wide H^(Gamma_2) = H^(sans(T)) succ.curly.eq 0 . $ <eq:projection-partial-transposes>]
  For the second identity, full transpose is the product of the two partial transposes.
    Full transpose preserves complex positive semidefiniteness:
    from $H = R^(*) R$ we get $H^(sans(T)) = \( overline(R) \)^(*) overline(R)$.
    The Choi identities in Lemma 5 now show that $T_D compose Psi$ is CP. Hence $Psi$ is PPT.
  Lemma 4 gives complete positivity and the PPT property for $Psi^dagger$.
    We will also use a more specific identity. Testing the defining adjoint relation on matrix units gives,
    for every $A in M_() \( bb(C) \) D$,
  #[#set math.equation(numbering: n => "(9.7)")
   $ \[ Psi^dagger \( A \) \]_(i j) = "tr" \( H_(i j)^(*) A \) . $ <eq:projection-adjoint>]
  Equation (9.5) therefore yields
  #[#set math.equation(numbering: n => "(9.8)")
   $ T_n compose Psi^dagger = Psi^dagger $ <eq:projection-adjoint-transpose>]
  on all complex matrices, including non-Hermitian ones.
  #emph[The tensor-basis diagonal and a compression.] The composition $Psi^dagger compose Psi$ is CP,
    so $C succ.curly.eq 0$. Index its rows and columns by $cal(I) times cal(I)$.
    Equation (9.7) gives the fully indexed formula
  #[#set math.equation(numbering: n => "(9.9)")
   $ C_(\( i \, a \) \, \( j \, b \)) = "tr" \( H_(a b)^(*) H_(i j) \) . $ <eq:projection-composite-entries>]
  Since $c_(q q) = 1$ and $P_i^2 = P_i$, we have $H_(i i) = P_i$.
    The diagonal entries with indices $\( i \, j \)$, and the entries of the compression $B$, are consequently
  #[#set math.equation(numbering: n => "(9.10)")
   $ C_(\( i \, j \) \, \( i \, j \)) & = "tr" \( P_i P_j \) \,\
B_(i j) := C_(\( i \, i \) \, \( j \, j \)) & = "tr" \( H_(i j)^(*) H_(i j) \) =
  c_(q r)^(thin 2) "tr" \( P_i P_j \) quad \( i in cal(I)_q \, med j in cal(I)_r \) .
  $ <eq:projection-crossed-diagonal>]
  The last equality follows from $"tr" \( P_j P_i P_i P_j \) = "tr" \( P_i P_j \)$,
    by idempotence and cyclicity of trace. It remains valid without commutation and when $c_(q r) = 0$.
  For each pair $q \, r$, completeness of the two measurements gives
  $ sum_(i in cal(I)_q) sum_(j in cal(I)_r) "tr" \( P_i P_j \) =
    "tr" #h(-0.16667em) [(sum_(i in cal(I)_q) P_i) (sum_(j in cal(I)_r) P_j)] = D . $
  Summing (9.10) proves $"tr" C = Q^2 D$. The same identity and (9.10) give
  #[#set math.equation(numbering: n => "(9.11)")
   $ "tr" B = Q D \, wide upright(bold(1))^(*) B upright(bold(1)) =
     D sum_(q \, r in cal(Q)) c_(q r)^(thin 2) gt.eq frac(D Q^2, K) . $ <eq:projection-gram-bound>]
  To see the inequality, set $M = sum_(q in cal(Q)) u_q u_q^(sans(T))$,
    a positive semidefinite $K$-by-$K$ real matrix. Then $"tr" M = Q$ and $"tr" \( M^2 \) =
    sum_(q \, r) c_(q r)^2$. Cauchy–Schwarz applied to its $K$ nonnegative eigenvalues yields $"tr" \( M^2 \)
    gt.eq \( "tr" M \)^2 \/ K = Q^2 \/ K$. Equivalently, the vector Gram matrix has rank at most $K$.
  #emph[The support bound forced by separability.] Suppose that $C$ is separable over $bb(C)^n ⊗ bb(C)^n$.
    Spectrally decomposing its local positive factors and absorbing positive weights into the vectors gives a
    finite decomposition
  $ C = sum_ell \( x^(\( ell \)) ⊗ y^(\( ell \)) \) \( x^(\( ell \)) ⊗ y^(\( ell \)) \)^(*) \, wide
    x^(\( ell \)) \, y^(\( ell \)) in bb(C)^n . $
  Whenever $"tr" \( P_i P_j \) = 0$, the corresponding tensor-basis diagonal entry is
  $ 0 = C_(\( i \, j \) \, \( i \, j \)) = sum_ell \| x_i^(\( ell \)) y_j^(\( ell \)) \|^2 . $
  Each summand is nonnegative, so $x_i^(\( ell \)) y_j^(\( ell \)) = 0$ for every $ell$.
    For one summand put $z_i = x_i y_i$. If distinct $i \, j$ lie in $"supp" z$, then $x_i y_j eq.not 0$.
    The preceding implication and (9.1) force $"tr" \( P_i P_j \) > 0$.
    The second hypothesis therefore gives $\| "supp" z \| lt.eq kappa$.
  Compressing the separable decomposition to the diagonal tensor subspace gives $B =
    sum_ell z^(\( ell \)) \( z^(\( ell \)) \)^(*)$. Complex Cauchy–Schwarz on each support now yields
  #[#set math.equation(numbering: n => "(9.12)")
   $ upright(bold(1))^(*) B upright(bold(1)) & = sum_ell lr(|sum_i z_i^(\( ell \))|)^2 lt.eq
     kappa sum_ell parallel z^(\( ell \)) parallel^2 = kappa "tr" B\
 & < Q / K "tr" B = frac(D Q^2, K) . $ <eq:projection-separable-bound>]
  The inequality is also valid for a zero $z^(\( ell \))$, whose support is empty.
    The strict step uses $kappa < Q \/ K$ and $"tr" B = Q D > 0$. This contradicts (9.11) and proves nonseparability. ◻
]

The complex criterion has a state interpretation without the reality assumption. By (9.8), Lemma 9 gives

#[#set math.equation(numbering: n => "(9.13)")
 $ C = #scale(x: 120%, y: 120%)[\(] \( Psi^dagger compose T_D \) ⊗ Psi^dagger
   #scale(x: 120%, y: 120%)[\)] \( Omega_D Omega_D^(*) \) . $ <eq:projection-complex-transfer>]

Both local maps in this formula satisfy the input-transpose CP conditions,
  as the transfer lemma asserts for the PPT pair $Psi \, Psi^dagger$.
  Thus $C \/ \( Q^2 D \) in cal(C)$ also in the complex case, and Theorem 17 and Proposition 18 apply to it.
  The two local maps in (9.13) may differ; the reality assumption is what gives the same channel in (9.15).

#thm([Corollary 9.2.])[
  (The same local channel for real projections).  #emph[Under the hypotheses of Proposition 26,
    suppose that every $P_i$ is real symmetric in the fixed basis of $bb(C)^D$, and put $Lambda = Psi^dagger :
    M_() \( bb(C) \) D arrow.r M_() \( bb(C) \) n$. Then, on all complex inputs,
#[#set math.equation(numbering: n => "(9.14)")
 $ Lambda compose T_D = Lambda = T_n compose Lambda \, wide "tr" Lambda \( A \) =
   Q thin "tr" A . $ <eq:projection-real-invariances>]

 In particular, $Lambda \/ Q$ is a trace-preserving PPT channel.
   For $Phi_D = Omega_D \/ sqrt(D)$, the normalized maximally entangled vector on $bb(C)^D ⊗ bb(C)^D$, one has
#[#set math.equation(numbering: n => "(9.15)")
 $ frac(C, Q^2 D) = (Lambda / Q ⊗ Lambda / Q) \( Phi_D Phi_D^(*) \) . $ <eq:projection-real-state>]

 This is an entangled density operator on $bb(C)^n ⊗ bb(C)^n$ in $cal(C)$.]
] <cor:real-channel>

#proof[
  Reality and (9.5) give the additional identity $H_(i j)^(sans(T)) = H_(i j)$. Equation (9.7) therefore becomes
  $ \[ Lambda \( A \) \]_(i j) = "tr" \( H_(i j) A \) \, wide \[ Lambda \( T_D \( A \) \) \]_(i j) =
    "tr" \( H_(i j)^(sans(T)) A \) = "tr" \( H_(i j) A \) . $
  This proves the first transpose invariance; the second is (9.8). Also,
  $ "tr" Lambda \( A \) = sum_i "tr" \( H_(i i) A \) = sum_(q in cal(Q)) sum_(i in cal(I)_q) "tr" \( P_i A \) =
    Q thin "tr" A . $
  Since $Lambda$ is CP and PPT by the proposition, $Lambda \/
    Q$ is a trace-preserving PPT channel with input size $D$ and output size $n$.
  Apply Lemma 9 to the pair $Psi \, Lambda$. Its first local factor is
  $ Psi^sharp = T_n compose Lambda compose T_D = Lambda $
  by the two invariances. Thus
  #[#set math.equation(numbering: n => "(9.16)")
   $ G := \( Lambda ⊗ Lambda \) \( Omega_D Omega_D^(*) \) = C . $ <eq:projection-real-identification>]
  Dividing this identity by $Q^2 D$ gives (9.15). Proposition 26 gives $"tr" C =
    Q^2 D > 0$ and complex nonseparability. Finally, $Lambda \/ Q$ and $\( Lambda \/ Q \) compose T_D$ are CP,
    so (9.15) is a representation of the form in Definition 7. This proves the assertion. ◻
]

The two channel uses in (9.15) act on separate subsystems.
  We next embed the rectangular maps into one matrix algebra to obtain a composition of square PPT maps.

#thm([Corollary 9.3.])[
  (Square embedding).  #emph[Under the hypotheses of Proposition 26, suppose in addition that $n gt.eq D$,
    and let $U : bb(C)^D arrow.r bb(C)^n$ be the real coordinate isometry onto the first $D$ coordinates. Define
#[#set math.equation(numbering: n => "(9.17)")
 $ Xi_1 = "Ad"_U compose Psi \, wide Xi_2 = Psi^dagger compose "Ad"_(U^(*)) =
   Xi_1^dagger . $ <eq:projection-square-pair>]

 Then $Xi_1 \, Xi_2 : M_() \( bb(C) \) n arrow.r M_() \( bb(C) \) n$ are PPT and
$ Xi_2 compose Xi_1 = Psi^dagger compose Psi . $

 Their composition is not entanglement breaking.]
] <cor:square-embedding>

#proof[
  Embedding and compression by $U$ are CP. The PPT composition stability in Lemma 4 therefore applies to both
    maps. Directly, the reality of $U$ also gives $T_n \( U A U^(*) \) = U T_D \( A \) U^(*)$,
    while (9.8) fixes the output transpose of the second map.
    The adjoint identity follows by reversing the two factors, and $U^(*) U = I_D$ gives the composite identity.
    Its Choi matrix is the nonseparable $C$ of Proposition 26;
    the characterization in Lemma 5 proves the last assertion. ◻
]

The dimension comparison in this corollary is used only to choose the isometry $U$.
  The rectangular criterion itself has no such comparison. The displayed square maps need not preserve trace or be
  unital.

== 10 A finite combinatorial realization <sec:combinatorial>

We construct data satisfying Proposition 26. A restricted-intersection bound gives real unit vectors such that
  every sufficiently large subfamily contains an orthogonal pair.
  The fiber argument for threefold tensor products strengthens this conclusion to eight mutually orthogonal
  members in every sufficiently large subfamily. Six of these eight vectors will index the six measurements in a
  parity obstruction; the remaining two receive a trivial measurement.
  Tensoring these measurements over the eight-subsets gives the projections required by the criterion.
  Because the projections are real, the resulting state is produced by the same trace-preserving PPT channel on
  both halves of a maximally entangled state.

=== 10.1 Vectors with forced orthogonality <vectors-with-forced-orthogonality>

Set $p = 257$, $k = 4 p = 1028$, and $\[ k \] = { 1 \, dots.h \, k }$. Define

#[#set math.equation(numbering: n => "(10.1)")
 $ cal(U) = { A subset.eq \[ k \] : \| A \| = 2 p \, med 1 in A } \,\
b = \| cal(U) \| = binom(1027, 513) = 1 / 2 binom(4 p, 2 p) \,\
s_A = 1 / sqrt(k) #scale(x: 120%, y: 120%)[\(] 2 upright(bold(1))_({ h in A }) -
  1 #scale(x: 120%, y: 120%)[\)]_(h = 1)^k in bb(R)^k quad \( A in cal(U) \) . $ <eq:combinatorial-base>]

Each $s_A$ is a unit vector. Since $\| A triangle.stroked.t B \| = 4 p - 2 \| A ∩ B \|$,
  counting agreeing and disagreeing coordinates gives

#[#set math.equation(numbering: n => "(10.2)")
 $ s_A^(sans(T)) s_B = frac(k - 2 \| A triangle.stroked.t B \|, k) = frac(\| A ∩ B \|, p) -
   1 . $ <eq:combinatorial-inner-product>]

Thus two base vectors are orthogonal exactly when their sets intersect in $p$ elements. Put

#[#set math.equation(numbering: n => "(10.3)")
 $ a_0 = sum_(j = 0)^(p - 1) binom(k, j) = sum_(j = 0)^256 binom(1028, j) \, wide delta = a_0 /
   b . $ <eq:combinatorial-delta>]

Frankl and Rödl’s theory of forbidden intersections also forces orthogonal families of a prescribed size in large
  subsets of a sign cube [22] Theorem 1.11. Here the precise bound follows from a direct polynomial argument and
  the fiber amplification below.

#thm([Lemma 10.1.])[
  (Restricted intersections).  #emph[If $cal(F) subset.eq cal(U)$ contains no two distinct sets whose associated
    vectors are orthogonal, then $\| cal(F) \| lt.eq a_0 = delta b$.]
] <lem:restricted-intersections>

#proof[
  The restricted-intersection estimate belongs to the Frankl–Wilson theory [23].
    The proof below uses the multilinear-polynomial approach of Alon, Babai, and Suzuki [2].
    We give the needed specialization in full. The integer $257$ is prime:
    the primes at most $sqrt(257)$ are $2 \, 3 \, 5 \, 7 \, 11 \, 13$, and the respective remainders are $1 \,
    2 \, 2 \, 5 \, 4 \, 10$.
  For distinct $A \, B in cal(F)$, their common element $1$ and their equal sizes give $1 lt.eq \| A ∩ B \| lt.eq
    2 p - 1$. Equation (10.2) excludes the value $p$. Hence $\| A ∩ B \|$ is nonzero modulo $p$,
    whereas $\| A ∩ A \| = 2 p$ is zero modulo $p$. Over the field $bb(F)_p$, define
  $ f_A \( x_1 \, dots.h \, x_k \) = 1 - (sum_(h in A) x_h)^(p - 1) quad \( A in cal(F) \) . $
  For every nonzero $a in bb(F)_p$, multiplication by $a$ permutes the nonzero field elements;
    comparing their products gives $a^(p - 1) = 1$. Therefore, on the indicator vectors of the members of $cal(F)$,
  $ f_A \( upright(bold(1))_B \) = cases(delim: "{", 1 \, & A = B \,, 0 \, & A eq.not B .) $
  Replace every positive power of each variable in every monomial by its first power.
    This preserves all evaluations on Boolean vectors and leaves degree at most $p - 1$.
    The resulting multilinear polynomials remain linearly independent:
    evaluating a linear relation at each $upright(bold(1))_B$ makes every coefficient zero.
    The space of multilinear polynomials of degree at most $p -
    1$ has a basis consisting of the $a_0$ squarefree monomials of those degrees. Thus $\| cal(F) \| lt.eq a_0$. ◻
]

#thm([Lemma 10.2.])[
  (Fiber amplification).  #emph[For $t = 1 \, 2 \, 3$, associate to $\( A_1 \, dots.h \, A_t \) in
    cal(U)^t$ the unit vector $s_(A_1) ⊗ dots.h.c ⊗ s_(A_t)$.
    If $cal(R) subset.eq cal(U)^t$ contains no collection of $2^t$ distinct tuples whose associated vectors are
    pairwise orthogonal, then
$ \| cal(R) \| lt.eq t delta b^t . $

]
] <lem:fiber-amplification>

#proof[
  The case $t = 1$ is Lemma 29. For $t = 2$ or $3$, write
  $ cal(R)_A = { \( A_2 \, dots.h \, A_t \) : \( A \, A_2 \, dots.h \, A_t \) in cal(R) } \, wide A in cal(U) . $
  Let $cal(G)$ consist of those $A$ for which $cal(R)_A$ contains $2^(t - 1)$ tuples with pairwise orthogonal
    tensor vectors in the last $t - 1$ factors. If distinct $A \, B in cal(G)$ had $s_A perp s_B$,
    choose one such collection in each fiber. Within either lifted collection,
    orthogonality comes from the last factors; between the two collections, it comes from the first factors.
    The two fibers are disjoint, so this would produce $2^t$ distinct tuples forbidden by the hypothesis.
    Thus $cal(G)$ has no orthogonal base pair, and $\| cal(G) \| lt.eq a_0 = delta b$ by the preceding lemma.
  Each fiber in $cal(G)$ has at most $b^(t - 1)$ elements. Each other fiber has at most $\( t - 1 \) delta
    b^(t - 1)$ elements by the induction hypothesis. Summing these bounds and using at most $b$ fibers of the
    latter kind gives
  $ \| cal(R) \| lt.eq \( delta b \) b^(t - 1) + b \( t - 1 \) delta b^(t - 1) = t delta b^t . $
  ◻
]

Use triples as measurement indices, called #emph[questions]:

#[#set math.equation(numbering: n => "(10.4)")
 $ cal(Q) = cal(U)^3 \, wide Q = b^3 \, wide K = k^3 = 1028^3 = 1086373952 \,\
u_q = s_(A_1) ⊗ s_(A_2) ⊗ s_(A_3) in bb(R)^K quad #scale(x: 120%, y: 120%)[\(] q = \( A_1 \, A_2 \, A_3 \)
  #scale(x: 120%, y: 120%)[\)] . $ <eq:combinatorial-questions>]

The scalar target is $3 delta < 1 \/ K$: the support bound $3 delta Q$ must be strictly below $Q \/
  K$ for the projection criterion. These vectors are unit vectors.
  If $q = \( A_1 \, A_2 \, A_3 \)$ and $r = \( B_1 \, B_2 \, B_3 \)$, their inner product is the rational number

#[#set math.equation(numbering: n => "(10.5)")
 $ c_(q r) = u_q^(sans(T)) u_r = product_(h = 1)^3 (frac(\| A_h ∩ B_h \|, 257) - 1) .
   $ <eq:combinatorial-question-gram>]

An #emph[orthogonal eight-set] will mean an eight-element subset of $cal(Q)$ whose associated vectors are pairwise
  orthogonal. By Lemma 30, with $t = 3$, every $cal(R) subset.eq cal(Q)$ containing no orthogonal eight-set satisfies

#[#set math.equation(numbering: n => "(10.6)")
 $ \| cal(R) \| lt.eq kappa \, wide kappa := 3 delta Q = 3 a_0 b^2 . $ <eq:combinatorial-eight-bound>]

The next analytic estimate is what makes this bound strict enough for Proposition 26.
  The central coefficient is largest among the $4 p + 1$ coefficients of $\( 1 + 1 \)^(4 p)$, so

$ b = 1 / 2 binom(4 p, 2 p) gt.eq frac(16^p, 2 \( 4 p + 1 \)) . $

The binomial coefficients increase up to the central one,
  and the degree-$p$ term in the expansion of $\( 1 + 1 \/ 3 \)^(4 p)$ is no greater than the full sum. Hence

$ a_0 lt.eq p binom(4 p, p) lt.eq p \( 4 \/ 3 \)^(4 p) 3^p = p \( 256 \/ 27 \)^p < p thin 12^p . $

It follows that

#[#set math.equation(numbering: n => "(10.7)")
 $ delta < 2 p \( 4 p + 1 \) \( 3 \/ 4 \)^p < 2^(- 65) . $ <eq:combinatorial-analytic-bound>]

For the last inequality, use $2 p \( 4 p + 1 \) = 528906 < 2^20$, $p = 3 dot.op 85 + 2$, and $\( 3 \/ 4 \)^3 =
  27 \/ 64 < 1 \/ 2$; the remaining factor $\( 3 \/ 4 \)^2$ is less than one. Also $1028 < 2^11$, so

$ K < 2^33 \, wide 3 delta < 3 dot.op 2^(- 65) < 2^(- 33) < 1 / K . $

Combining this with (10.6) proves

#[#set math.equation(numbering: n => "(10.8)")
 $ kappa = 3 a_0 b^2 < Q / K . $ <eq:combinatorial-strict-bound>]

The proof has now supplied the vector and cardinality ingredients.
  We next construct measurements that turn every orthogonal eight-set into a forbidden positive-overlap choice.

=== 10.2 Six parity measurements <six-parity-measurements>

On $bb(C)^2$, let

$ X = mat(delim: "(", 0, 1; 1, 0) \, wide Z = mat(delim: "(", 1, 0; 0, - 1) \, wide Y =
  mat(delim: "(", 0, - upright(i); upright(i), 0) . $

Use the Mermin–Peres square [42,47,48]; its interpretation in the setting of quantum magic games is discussed by
  Arkhipov [4]. The margins in the following array give the products of the three observables in each row and column:

#[#set math.equation(numbering: n => "(10.9)")
 $ X ⊗ I_2 & I_2 ⊗ X & X ⊗ X & + I_4\
I_2 ⊗ Z & Z ⊗ I_2 & Z ⊗ Z & + I_4\
X ⊗ Z & Z ⊗ X & Y ⊗ Y & + I_4\
+ I_4 & + I_4 & - I_4 & $ <eq:combinatorial-parity-square>]

All nine entries are real symmetric involutions. In particular, if $J = 0 & - 1\
1 & 0$, then $Y = upright(i) J$ and $Y ⊗ Y = - J ⊗ J$, a real integral symmetric matrix.
  Order the six contexts as the three rows followed by the three columns,
  each read left to right or top to bottom. In context $t$,
  write the three observables as $\( O_1 \, O_2 \, O_3 \)$. The first two commute and

#[#set math.equation(numbering: n => "(10.10)")
 $ O_3 = e_t O_1 O_2 \, wide \( e_1 \, e_2 \, e_3 \, e_4 \, e_5 \, e_6 \) = \( 1 \, 1 \, 1 \, 1 \, 1 \, - 1 \) .
   $ <eq:combinatorial-context-signs>]

These identities follow from $X Z = - upright(i) Y$ and $Z X = upright(i) Y$.
  For example, the first two entries of the last row multiply, in either order, to $Y ⊗ Y$;
  those of the last column multiply, in either order, to $- Y ⊗ Y$.
  Since $O_3$ is a signed product of the first two, all three commute.

Let $cal(A) = { - 1 \, + 1 }^2$. The four outcomes of context $t$ are the matrices

#[#set math.equation(numbering: n => "(10.11)")
 $ h_t \( alpha \, beta \) = 1 / 4 \( I_4 + alpha O_1 \) \( I_4 + beta O_2 \) \,
   wide \( alpha \, beta \) in cal(A) . $ <eq:combinatorial-context-projections>]

The two factors divided by two are commuting spectral projections.
  Their products are therefore self-adjoint projections. Distinct outcomes are orthogonal,
  and the four products sum to $I_4$. They are real symmetric with rational entries,
  and their ranges have the three context eigensigns $\( alpha \, beta \, e_t alpha beta \)$.

#thm([Lemma 10.3.])[
  (Parity obstruction).  #emph[There is no choice of one projection from each of the six measurements in (10.11)
    such that the trace overlap of every two chosen projections from distinct contexts is strictly positive.]
] <lem:parity-obstruction>

#proof[
  Suppose there were such a choice. All six selected projections would be nonzero.
    Let a selected row projection $E$ and column projection $F$ assign eigensigns $a \, b in { - 1 \, +
    1 }$ to their shared observable $O$. The eigenspace identities and self-adjointness give
  $ a E F = E O F = b E F . $
  If $a eq.not b$, then $E F = 0$ and their overlap is zero, contrary to the hypothesis.
    Thus the row and column assignments agree at each of the nine entries of the square.
  The choice would consequently give nine consistent signs.
    The product of the three signs in context $t$ is $e_t$, by (10.10).
    Multiplying the three row constraints gives product $+ 1$ for the nine signs;
    multiplying the three column constraints gives product $- 1$. This is a contradiction.
    The argument applies to eigenspaces in the complex Hilbert space $bb(C)^4$. ◻
]

=== 10.3 Tensor assembly and consequences <tensor-assembly-and-consequences>

We now impose the six-context obstruction on every orthogonal eight-set of questions.
  Each such set receives its own tensor factor. Six of its questions use the six parity measurements on that
  factor, while all other questions use the trivial measurement with one outcome $I_4$ and three zero outcomes.
  Thus any positive-overlap choice containing the eight-set violates parity on its factor.
  This arrangement also ensures the commutation needed in the projection criterion:
  two distinct questions with nonzero vector inner product cannot both have nontrivial measurements on any one factor.

For a uniform index set, include a factor carrying only trivial measurements for every nonorthogonal eight-subset
  as well. Let

#[#set math.equation(numbering: n => "(10.12)")
 $ cal(S) = { S subset.eq cal(Q) : \| S \| = 8 } \, wide L = \| cal(S) \| = binom(Q, 8) \,\
cal(H) = ⨂_(S in cal(S)) bb(C)^4 tilde.equiv bb(C)^D \, wide D = 4^L . $ <eq:combinatorial-tensor-space>]

To fix all bases, order subsets of $\[ k \]$ by their increasing lists, then order tuples lexicographically,
  and order the eight-subsets by their increasing lists in that order.
  Use the corresponding order for the tensor factors, the standard tensor-product basis in each $bb(C)^4 =
  bb(C)^2 ⊗ bb(C)^2$, and the lexicographic order on sign pairs with $- 1 < + 1$.

For $S in cal(S)$ and $q in cal(Q)$, define a four-outcome measurement $h_(S \, q)$ on the factor indexed by $S$.
  If $S$ is an orthogonal eight-set and $q$ is its $t$-th element with $1 lt.eq t lt.eq 6$, set $h_(S \, q) =
  h_t$. In every other case, set

#[#set math.equation(numbering: n => "(10.13)")
 $ h_(S \, q) \( + 1 \, + 1 \) = I_4 \, wide h_(S \, q) \( alpha \, beta \) = 0 quad
   upright("when ") \( alpha \, beta \) eq.not \( + 1 \, + 1 \) . $ <eq:combinatorial-trivial-measurement>]

Thus the last two questions in an orthogonal eight-set use the trivial measurement,
  as do all questions outside that set and all questions on a nonorthogonal factor.
  Every decision of whether a factor is orthogonal is determined by the rational numbers in (10.5).

For each $q$, retain an outcome string on every factor and define

#[#set math.equation(numbering: n => "(10.14)")
 $ cal(I)_q = { q } times cal(A)^(cal(S)) \, wide P_(q \, lambda) = ⨂_(S in cal(S)) h_(S \, q) \( lambda_S \) quad
   #scale(x: 120%, y: 120%)[\(] lambda in cal(A)^(cal(S)) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:combinatorial-global-projections>]

Order these outcome strings lexicographically using the stated factor and sign-pair orders,
  and order the full labels first by question and then by outcome string.
  This is the standard basis order used for the concrete maps.
  The matrices $P_(q \, lambda)$ are real symmetric projections.
  For a fixed $q$, two distinct strings differ in some factor, where their local projections have zero product;
  hence their global projections are orthogonal. Summing over all strings factors as $⨂_S sum_(alpha \, beta)
  h_(S \, q) \( alpha \, beta \) = I_D$. Keeping every outcome string, including those whose projection is zero,
  gives a uniform label set: there are exactly $4^L = D$ labels for every question. Hence

#[#set math.equation(numbering: n => "(10.15)")
 $ m := lr(|union.sq.big_(q in cal(Q)) cal(I)_q|) = Q D . $ <eq:combinatorial-label-count>]

In particular $m gt.eq D$, as required for the square embedding in Corollary 28.

#thm([Lemma 10.4.])[
  #emph[The vectors (10.4) and measurements (10.14) satisfy the two hypotheses of Proposition 26 with $n = m =
    Q D$ and $kappa = 3 a_0 b^2 < Q \/ K$.]
] <lem:combinatorial-measurements>

#proof[
  If $q = r$, projections with those labels belong to one projective measurement and commute.
    Suppose that $q eq.not r$ and $c_(q r) eq.not 0$. They cannot both receive nontrivial contexts on any one
    factor: that would place them together in an orthogonal eight-set, forcing $c_(q r) = 0$.
    On each factor at least one of the two selected local projections is consequently $0$ or $I_4$.
    They commute on each factor, so their tensor products commute. This proves the first hypothesis.
  Now let $J$ be a label set with strictly positive trace overlap between every distinct pair.
    Distinct labels for one question have zero product, so $J$ contains at most one label per question.
    The trace overlap of any two global projections factors as
  #[#set math.equation(numbering: n => "(10.16)")
   $ "tr" \( P_(q \, lambda) P_(r \, mu) \) = product_(S' in cal(S)) "tr" #scale(x: 120%, y: 120%)[\(]
     h_(S' \, q) \( lambda_(S') \) h_(S' \, r) \( mu_(S') \) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:combinatorial-overlap-product>]
  Every local factor is nonnegative by (9.1), whether or not the two local projections commute.
    Thus strict positivity of this finite product implies strict positivity of each factor.
  If the questions represented by $J$ contained an orthogonal eight-set $S$,
    take the selected labels for its first six questions. At the factor indexed by $S$,
    equation (10.16) would give strictly positive overlap for each pair of the six selected context projections.
    Lemma 31 forbids this. The represented questions therefore contain no orthogonal eight-set,
    and (10.6) gives $\| J \| lt.eq kappa$. For completeness,
    the pairwise condition on a singleton is vacuous even when its projection is zero;
    it still satisfies the bound because $a_0 \, b gt.eq 1$ and $kappa = 3 a_0 b^2 gt.eq 3$.
    The strict inequality $kappa < Q \/ K$ is (10.8). ◻
]

#thm([Theorem 10.5.])[
  (Finite combinatorial construction).  #emph[Set
#[#set math.equation(numbering: n => "(10.17)")
 $ p = 257 \, wide k = 1028 \, wide b = binom(1027, 513) \, wide a_0 = sum_(j = 0)^256 binom(1028, j) \,\
Q = b^3 \, wide K = 1086373952 \, wide kappa = 3 a_0 b^2 < Q / K \,\
L = binom(Q, 8) \, wide D = 4^L \, wide m = Q D . $ <eq:combinatorial-exact-data>]

 Use the vectors in (10.4), the $D$ labels per question and projections in (10.14), and the map $Psi :
   M_() \( bb(C) \) m arrow.r M_() \( bb(C) \) D$ in (9.2). Put $Lambda = Psi^dagger$ and $Phi_D = Omega_D \/ sqrt(D)$.]
  + #emph[The map $Lambda \/ Q : M_() \( bb(C) \) D arrow.r M_() \( bb(C) \) m$ is a trace-preserving PPT channel, and
#[#set math.equation(numbering: n => "(10.18)")
 $ rho_(upright("comb")) = (Lambda / Q ⊗ Lambda / Q) \( Phi_D Phi_D^(*) \) =
   frac(J \( Psi^dagger compose Psi \), Q^2 D) $ <eq:combinatorial-state>]

 is an entangled density operator on $bb(C)^m ⊗ bb(C)^m$ belonging to $cal(C)$.
   It has $K_D \( rho_(upright("comb")) \) = 0$ and satisfies the uniform unhalved $1 \/
   5$ gap and all operational consequences of Theorem 17 and Proposition 18, with their stated protocol,
   purification, and completion hypotheses.]
  + #emph[For the real coordinate isometry $U : bb(C)^D arrow.r bb(C)^m$ onto the first $D$ coordinates, the maps
$ Phi_1^(upright("comb")) = "Ad"_U compose Psi \, wide Phi_2^(upright("comb")) = Lambda compose
  "Ad"_(U^(*)) = \( Phi_1^(upright("comb")) \)^dagger $

 are PPT maps on $M_() \( bb(C) \) m$, and
#[#set math.equation(numbering: n => "(10.19)")
 $ J \( Phi_2^(upright("comb")) compose Phi_1^(upright("comb")) \) =
   Q^2 D thin rho_(upright("comb")) $ <eq:combinatorial-pair>]

 is nonseparable over $bb(C)^m ⊗ bb(C)^m$. In particular their composition is not entanglement breaking.]
  + #emph[Let $Theta_(upright("comb"))$ be the channel obtained by applying Proposition 25 to this square pair.
    It is a trace-preserving PPT channel on $M_(2 m + 1) \( bb(C) \)$.
    With the positive constants $c_1 \, c_2$ and the first coordinate inclusion $W_0$ from that proposition,
    the Choi matrix of its square has the corner
#[#set math.equation(numbering: n => "(10.20)")
 $ \( W_0^(*) ⊗ W_0^(*) \) J \( Theta_(upright("comb"))^2 \) \( W_0 ⊗ W_0 \) =
   c_1 c_2 Q^2 D thin rho_(upright("comb")) . $ <eq:combinatorial-channel-corner>]

 Consequently $Theta_(upright("comb"))^2 = Theta_(upright("comb")) compose
   Theta_(upright("comb"))$ is not entanglement breaking.]
] <thm:old-construction>

#proof[
  Lemma 32 verifies the hypotheses of Proposition 26. Its composite $C =
    J \( Psi^dagger compose Psi \)$ is positive and nonseparable over $bb(C)^m ⊗ bb(C)^m$, with $"tr" C = Q^2 D$.
    The projections are real symmetric, so Corollary 27 proves (10.18), the channel assertion,
    and membership in $cal(C)$. Theorem 17 and Proposition 18 give the stated operational conclusions.
  Since $m = Q D gt.eq D$, Corollary 28 applies to the displayed coordinate isometry and gives the square PPT
    pair. Its composite is $Psi^dagger compose Psi$, and the real identification (9.16) gives (10.19).
    Applying Proposition 25 to this pair gives the channel on $M_(2 m + 1) \( bb(C) \)$ and its exact corner
    (10.20). The corner is nonseparable, so that proposition also proves that the channel square is not
    entanglement breaking. ◻
]

All these objects are given by finite exact formulas. The normalized sign vectors $s_A$ have coordinates
  $plus.minus 1 \/ sqrt(1028) = plus.minus 1 \/ \( 2 sqrt(257) \)$, which are irrational because $257$ is prime.
  The Gram entries of the question vectors in (10.5), rather than the vector coordinates, enter the Choi blocks.
  Those Gram entries are rational; all nine local observables are integral,
  and all local and global projections are rational. Consequently every block $H_(i j)$,
  every coefficient of $Psi \, Lambda \, Phi_1^(upright("comb")) \, Phi_2^(upright("comb"))$,
  and every entry of $rho_(upright("comb"))$ is rational in the specified bases.
  The completion also has rational coefficients: its positive scalings and flag matrices in Proposition 25 are
  formed from the rational square maps using traces and rational operations.
  Appendix 12 describes supplementary exact checks of the small arithmetic and six-context calculations.

== 11 Details of the dimension-ten certificate <app:arithmetic>

=== 11.1 Finite arithmetic <finite-arithmetic>

This subsection gives the exact arithmetic support for the block identities (7.4) and the finite-field data in
  Section 7. The Python 3 program below uses only the standard library and integer arithmetic.
  Its input matrix entries are those of (7.1), with zero-based row indices in the code.

The function #raw("checksym") uses only $i < j$ and column indices $a < b$.
  The cases $i = j$ and $a = b$ vanish identically, while exchanging either pair of indices changes the sign of
  the same difference. Thus these strict loops check every equality in (7.4).

The code variable #raw("R") is the coefficient array $\[ D divides H \]$,
  and #raw("T") is the reduction of $N$ modulo the current prime.
  The program expands each determinant over the $4 !$ permutations, collects coefficients in the order (7.5),
  and performs Gaussian elimination on $H$ modulo each prime.
  The columns of #raw("T") are the reductions of the columns in (7.7).

For $f \( z \) = z^20 + c_1 z^19 + dots.h.c + c_20$, with $c_0 = 1$, the program uses the Newton identities

$ k c_k = - sum_(i = 0)^(k - 1) c_i "tr" \( N^(k - i) \) wide \( 1 lt.eq k lt.eq 20 \) . $

Division by $k$ is valid at each of $41 \, 131 \, 139$. Repeated $p$th powers modulo $overline(f)$ then give the
  residues of $z^(p^k)$, and the polynomial Euclidean algorithm gives $d_p \( k \)$.
  All inverses are taken in the stated prime field. No floating-point approximation or heuristic search is involved.

The program asserts the integer block identities and prints the modular data.
  Verification of the modular certificate includes comparing the printed output with the recorded values below.
  The operator, projective, and Galois deductions are proved in Sections 6 and 7,
  using the algebraic facts proved in the next subsection. The program does not perform a general elimination or
  Galois-group computation.

From the paper directory, run #raw("python3 verification/exact_certificate.py") with assertions enabled,
  without the #raw("-O") or #raw("-OO") optimization options, and with #raw("PYTHONOPTIMIZE") unset.

The listing uses an identical build copy of the verification source; its line numbers refer to that source file.

#raw(block: true, lang: "Exact verification of the matrix identities and modular certificate.", "")

The file #raw("verification/certificate-output.txt") records the values below;
  an identical build copy is used for typesetting. Coefficients of $overline(f)$ are in leading-first order,
  and the gcd-degree lists are ordered by $k = 1 \, dots.h \, 20$.
  The first line for each prime gives $p$ and $det H med mod med p$.

#raw(block: true, lang: "Recorded output of the exact verification program.", "")

=== 11.2 Algebraic facts <app:certificate-algebra>

We prove the three general lemmas used in Section 7. The first supplies a common zero used to prove the affine
  quotient nonzero; the second accommodates rational coefficients with denominators prime to $p$;
  the third converts squarefree modular factor degrees into Galois permutations.

#proof[
  Let $X_0 \, dots.h \, X_3 \, Y_0 \, dots.h \, Y_3$ be indeterminates, put $u_(i j) = X_i Y_j$,
    and consider the finitely generated complex algebra
  $ cal(R) = bb(C) \[ u_(i j) : 0 lt.eq i \, j < 4 \] subset
    bb(C) \[ X_0 \, dots.h \, X_3 \, Y_0 \, dots.h \, Y_3 \] . $
  It is a Noetherian domain. Its closed complex points are exactly the matrices of rank at most one.
    Indeed, the identities $u_(i j) u_(k ell) = u_(i ell) u_(k j)$ force the values at any point to have rank at
    most one, and every such matrix is $x y^(sans(T))$ and defines an evaluation of $cal(R)$.
    The maximal ideal $frak(m) = \( u_(i j) : 0 lt.eq i \, j < 4 \)$ corresponds to the zero matrix.
  For $1 lt.eq a \, b lt.eq 4$, put $P_(a \, b) = \( u_(i j) : i gt.eq a upright(" or ") j gt.eq b \)$.
    The quotient by $P_(a \, b)$ is the domain $bb(C) \[ X_i Y_j : 0 lt.eq i < a \, med 0 lt.eq j < b \]$.
    To justify the identification, use the monomial basis $X^alpha Y^beta$ with $\| alpha \| = \|
    beta \|$ for $cal(R)$: a monomial containing an excluded variable factors by an excluded generator,
    while the remaining monomials stay distinct. Hence
  $ 0 = P_(4 \, 4) subset.neq P_(3 \, 4) subset.neq P_(2 \, 4) subset.neq P_(1 \, 4) subset.neq P_(1 \, 3)
    subset.neq P_(1 \, 2) subset.neq P_(1 \, 1) subset.neq frak(m) $
  is a strict chain of prime ideals. In particular, $"ht" frak(m) gt.eq 7$.
  Let $ell_1 \, dots.h \, ell_6 in cal(R)$ be the linear combinations of the $u_(i j)$ representing the six
    bilinear forms, and put $frak(a) = \( ell_1 \, dots.h \, ell_6 \)$.
    If the only common zero on the rank-at-most-one matrices were the zero matrix,
    the Hilbert Nullstellensatz for the finite-type complex algebra $cal(R)$ would give $sqrt(frak(a)) = frak(m)$.
    The prime $frak(m)$ would then be minimal over an ideal generated by six elements.
    Krull’s height theorem bounds the height of such a prime in a Noetherian ring by six,
    contradicting the chain above [58] Tags 00FV and 0BBZ(1).
    Thus a nonzero rank-one matrix $x y^(sans(T))$ annihilates all six forms. Both factors are nonzero. ◻
]

#proof[
  Normalize the valuation by $v_p \( p \) = 1$. In either pair its values on nonzero elements are integers,
    and $R_p \/ p R_p = bb(F)_p$. For a nonzero polynomial $a \( z \) = sum_i a_i z^i$ over $bb(L)$,
    put $nu \( a \) = min_(a_i eq.not 0) v_p \( a_i \)$. Scaling nonzero polynomials $a \,
    b$ by $p^(- nu \( a \))$ and $p^(- nu \( b \))$ makes their coefficients integral with least valuation zero.
    Their reductions are nonzero and have nonzero product in the domain $bb(F)_p \[ z \]$. Thus
  $ nu \( a b \) = nu \( a \) + nu \( b \) . $
  For monic $g \, h$ one has $nu \( g \) \, nu \( h \) lt.eq 0$,
    whereas the monic $P in R_p \[ z \]$ has $nu \( P \) = 0$.
    Additivity forces $nu \( g \) = nu \( h \) = 0$, so all coefficients of both factors are integral.
    Their leading coefficients remain one after reduction, which preserves their degrees;
    a monic constant factor is $1$ and retains degree zero. Any factorization of $P$ into two positive-degree
    polynomials over $bb(L)$ can be normalized to monic factors,
    whose reductions would still have positive degree. This contradicts irreducibility of the reduction of $P$. ◻
]

#proof[
  Embed the coefficients of $F$ into $bb(Z)_p$ and put $s = "lcm" \( s_1 \, dots.h \, s_h \)$.
    Choose a monic irreducible $overline(g) in bb(F)_p \[ X \]$ of degree $s$ and a monic coefficient lift $g in
    bb(Z)_p \[ X \]$; we use the standard finite-field fact that an irreducible polynomial of every positive
    degree exists. Lemma 23 for $\( bb(Q)_p \, bb(Z)_p \)$ shows that $g$ is irreducible over $bb(Q)_p$.
    If $alpha$ is a root, put
  $ E = bb(Q)_p \( alpha \) \, wide cal(O) = bb(Z)_p \[ alpha \] tilde.eq bb(Z)_p \[ X \] \/ \( g \) . $
  The ring $cal(O)$ is free of rank $s$ over $bb(Z)_p$, hence complete and separated for the $p$-adic topology,
    and $cal(O) \/ p cal(O) tilde.eq bb(F)_(p^s)$. Every element with nonzero residue is a unit:
    lift an inverse modulo $p$ and correct it by a convergent geometric series.
  Every simple residue root of a polynomial in $bb(Z)_p \[ z \]$ lifts uniquely to a root in $cal(O)$.
    To see this, suppose $r_n$ is a root modulo $p^n$ whose derivative has nonzero residue.
    The first-order Taylor congruence gives a unique residue class of $c$ such that $r_(n + 1) = r_n +
    p^n c$ is a root modulo $p^(n + 1)$. Completeness gives a limiting root.
    If two roots have the same simple residue, the polynomial difference factorization writes their difference
    times a unit as zero; the roots therefore coincide.
  Every root of $overline(F)$ lies in $bb(F)_(p^s)$ and is simple.
    Lifting them gives $deg F$ distinct roots of $F$ in $cal(O)$, hence all the roots.
    Finite fields are perfect, so $overline(alpha)^(thin p)$ is a simple root of $overline(g)$.
    Lift it to a root $beta in cal(O)$ of $g$. Sending $alpha$ to $beta$ defines a $bb(Q)_p$-embedding $E arrow.r
    E$, because $g$ is irreducible. This embedding is an automorphism $sigma$,
    as $E$ is finite-dimensional over $bb(Q)_p$.
  Since $beta in cal(O)$, we have $sigma \( cal(O) \) subset.eq cal(O)$.
    The induced residue map fixes $bb(F)_p$ and sends $overline(alpha)$ to $overline(alpha)^(thin p)$,
    so it is Frobenius on $bb(F)_(p^s)$. In a $bb(Z)_p$-basis of $cal(O)$,
    the matrix of this endomorphism reduces to an invertible residue matrix.
    Its determinant is a $p$-adic unit, and therefore $sigma \( cal(O) \) = cal(O)$.
  If $rho_r$ is the lifted root of $F$ with residue $r$, uniqueness of lifting gives $sigma \( rho_r \) =
    rho_(r^p)$. Thus the permutation of the lifted roots has exactly the Frobenius cycle lengths on their
    residues, namely $s_1 \, dots.h \, s_h$. The subfield of $E$ generated over $bb(Q)$ by these roots is a
    rational splitting field of $F$. The automorphism $sigma$ permutes its generating roots and hence preserves
    this subfield. Its restriction is the required rational Galois automorphism.
    A $bb(Q)$-isomorphism transports the statement to any chosen splitting field. ◻
]

== 12 Supplementary exact checks <app:supplementary-checks>

The construction in Section 10 is proved by finite formulas and analytic inequalities.
  The four accompanying files in #raw("verification/") preserve two exact integer checks of its small arithmetic
  components. These checks are supplementary: the restricted-intersection argument, fiber amplification,
  tensor construction, and nonseparability proof do not use their execution as a premise.

The program #raw("combinatorics_exact_checks.py") uses only the Python standard library.
  It checks primality of $257$ by trial division and verifies the intermediate binomial and power inequalities
  used in (10.7). It also checks $3 a_0 K < b$ and $3 a_0 b^2 gt.eq 3$.
  Its recorded output #raw("combinatorics_exact_checks.json") stores the exact integers $a_0$ (under the key
  #raw("A")) and $b$, confirms $K = 1086373952$, and records the stronger interval

#[#set math.equation(numbering: n => "(12.1)")
 $ 2^(- 194) lt.eq delta < 2^(- 193) . $ <eq:supplementary-delta-interval>]

The analytic proof needs only $delta < 2^(- 65)$.

The program #raw("gadget_exact_check.py") represents each local projection $h_t \( alpha \, beta \)$ by the
  integral matrix $R = 4 h_t \( alpha \, beta \)$. It checks the observable relations,
  identities and eigensigns for all 24 projections, and measurement completeness,
  and computes the 36 ordered context-pair overlap tables. The stored integer $"tr" \( R R' \)$ is exactly $16
  "tr" \( h_t h_(t') \)$. It then enumerates all $4^6 = 4096$ selections of one outcome per context and counts
  zero overlaps among the 15 unordered pairs of distinct contexts.
  The recorded output #raw("gadget_exact_check.json") has no selection with all overlaps positive and gives the
  following counts:

$ upright("number of zero-overlap pairs") & 1 & 3 & 5 & 7 & 9\
upright("number of selections") & 144 & 1344 & 2016 & 576 & 16 . $

The files retain all exact matrices and overlap tables, not just this summary.

From the paper directory the outputs can be regenerated by

#raw(block: true, lang: "", "python3 verification/combinatorics_exact_checks.py\npython3 verification/gadget_exact_check.py > verification/gadget_exact_check.json")

Run these commands with Python assertions enabled: do not use #raw("-O") or #raw("-OO"),
  and do not set #raw("PYTHONOPTIMIZE"). All computations in these programs use exact Python integers and no
  floating-point tolerance. They do not instantiate the enormous global matrices or enumerate the question set;
  those objects are specified and analyzed by the finite formulas in the text.

#heading(level: 1)[References]
#bibitem([1])[A.~Acín and N.~Gisin, "Quantum correlations and secret bits," #emph[Physical Review Letters]
  #strong[94], 020501 (2005).
  #link("https://doi.org/10.1103/PhysRevLett.94.020501")[doi:10.1103/PhysRevLett.94.020501].
  #link("https://arxiv.org/abs/quant-ph/0310054v3")[arXiv:quant-ph/0310054v3].]
#bibitem([2])[N.~Alon, L.~Babai, and H.~Suzuki, "Multilinear polynomials and Frankl--Ray-Chaudhuri--Wilson type
  intersection theorems," #emph[Journal of Combinatorial Theory, Series A] #strong[58]\(2), 165--180 (1991).
  #link("https://doi.org/10.1016/0097-3165(91)90058-O")[doi:10.1016/0097-3165(91)90058-O].]
#bibitem([3])[J.~An and S.~Lee, "Beyond the Positive Partial Transpose Squared Conjecture:
  The Qutrit Case," preprint, #link("https://arxiv.org/abs/2607.15947v1")[arXiv:2607.15947v1] \[quant-ph\] (17
  July 2026).]
#bibitem([4])[A.~Arkhipov, "Extending and characterizing quantum magic games,"
  #link("https://arxiv.org/abs/1209.3819")[arXiv:1209.3819] (2012).]
#bibitem([5])[P.~Badziąg, K.~Horodecki, M.~Horodecki, J.~Jenkinson, and S.~J.~Szarek,
  "Bound entangled states with extremal properties," #emph[Physical Review A] #strong[90], 012301 (2014).
  #link("https://doi.org/10.1103/PhysRevA.90.012301")[doi:10.1103/PhysRevA.90.012301].
  #link("https://arxiv.org/abs/1309.7992v2")[arXiv:1309.7992v2].]
#bibitem([6])[Z.~Bar-Yossef, T.~S.~Jayram, R.~Kumar, and D.~Sivakumar,
  "An information statistics approach to data stream and communication complexity," #emph[Journal of Computer and
  System Sciences] #strong[68]\(4), 702--732 (2004).
  #link("https://doi.org/10.1016/j.jcss.2003.11.006")[doi:10.1016/j.jcss.2003.11.006].]
#bibitem([7])[C.~H.~Bennett, G.~Brassard, C.~Crépeau, and U.~M.~Maurer,
  "Generalized privacy amplification," #emph[IEEE Transactions on Information Theory] #strong[41]\(6),
  1915--1923 (1995). #link("https://doi.org/10.1109/18.476316")[doi:10.1109/18.476316].]
#bibitem([8])[C.~H.~Bennett, G.~Brassard, S.~Popescu, B.~Schumacher, J.~A.~Smolin, and W.~K.~Wootters,
  "Purification of noisy entanglement and faithful teleportation via noisy channels," #emph[Physical Review
  Letters] #strong[76], 722--725 (1996).
  #link("https://doi.org/10.1103/PhysRevLett.76.722")[doi:10.1103/PhysRevLett.76.722].
  #link("https://arxiv.org/abs/quant-ph/9511027")[arXiv:quant-ph/9511027].]
#bibitem([9])[C.~H.~Bennett, G.~Brassard, and J.-M.~Robert,
  "Privacy amplification by public discussion," #emph[SIAM Journal on Computing] #strong[17]\(2), 210--229 (1988).
  #link("https://doi.org/10.1137/0217014")[doi:10.1137/0217014].]
#bibitem([10])[C.~H.~Bennett, D.~P.~DiVincenzo, T.~Mor, P.~W.~Shor, J.~A.~Smolin, and B.~M.~Terhal,
  "Unextendible product bases and bound entanglement," #emph[Physical Review Letters] #strong[82],
  5385--5388 (1999). #link("https://doi.org/10.1103/PhysRevLett.82.5385")[doi:10.1103/PhysRevLett.82.5385].
  The cited lemma locator refers to #link("https://arxiv.org/abs/quant-ph/9808030v2")[arXiv:quant-ph/9808030v2].]
#bibitem([11])[C.~H.~Bennett, D.~P.~DiVincenzo, J.~A.~Smolin, and W.~K.~Wootters,
  "Mixed-state entanglement and quantum error correction," #emph[Physical Review A] #strong[54],
  3824--3851 (1996). #link("https://doi.org/10.1103/PhysRevA.54.3824")[doi:10.1103/PhysRevA.54.3824].
  #link("https://arxiv.org/abs/quant-ph/9604024")[arXiv:quant-ph/9604024].]
#bibitem([12])[L.~Chen, Y.~Yang, and W.-S.~Tang, "Positive-partial-transpose square conjecture for $n =
  3$," #emph[Physical Review A] #strong[99], 012337 (2019).
  #link("https://doi.org/10.1103/PhysRevA.99.012337")[doi:10.1103/PhysRevA.99.012337].]
#bibitem([13])[G.~Chiribella, K.~R.~Davidson, V.~I.~Paulsen, and M.~Rahaman,
  "Positive maps and entanglement in real Hilbert spaces," #emph[Annales Henri Poincaré] #strong[24],
  4139--4168 (2023). #link("https://doi.org/10.1007/s00023-023-01325-x")[doi:10.1007/s00023-023-01325-x].
  #link("https://arxiv.org/abs/2207.02510v2")[arXiv:2207.02510v2].]
#bibitem([14])[E.~Chitambar, D.~Leung, L.~Mančinska, M.~Ozols, and A.~Winter,
  "Everything you always wanted to know about LOCC (but were afraid to ask)," #emph[Communications in Mathematical
  Physics] #strong[328]\(1), 303--326 (2014).
  #link("https://doi.org/10.1007/s00220-014-1953-9")[doi:10.1007/s00220-014-1953-9].
  #link("https://arxiv.org/abs/1210.4583")[arXiv:1210.4583].]
#bibitem([15])[M.-D.~Choi, "Completely positive linear maps on complex matrices," #emph[Linear Algebra and its
  Applications] #strong[10], 285--290 (1975).
  #link("https://doi.org/10.1016/0024-3795(75)90075-0")[doi:10.1016/0024-3795(75)90075-0].]
#bibitem([16])[M.~Christandl, A.~Müller-Hermes, and M.~M.~Wolf,
  "When do composed maps become entanglement breaking?" #emph[Annales Henri Poincaré] #strong[20],
  2295--2322 (2019). #link("https://doi.org/10.1007/s00023-019-00774-7")[doi:10.1007/s00023-019-00774-7].
  The cited section and theorem locators refer to #link("https://arxiv.org/abs/1807.01266v2")[arXiv:1807.01266v2].]
#bibitem([17])[M.~Curty, M.~Lewenstein, and N.~Lütkenhaus,
  "Entanglement as a precondition for secure quantum key distribution," #emph[Physical Review Letters]
  #strong[92], 217903 (2004).
  #link("https://doi.org/10.1103/PhysRevLett.92.217903")[doi:10.1103/PhysRevLett.92.217903].
  #link("https://arxiv.org/abs/quant-ph/0307151")[arXiv:quant-ph/0307151].]
#bibitem([18])[E.~B.~Davies and J.~T.~Lewis, "An operational approach to quantum probability,"
  #emph[Communications in Mathematical Physics] #strong[17], 239--260 (1970).
  #link("https://doi.org/10.1007/BF01647093")[doi:10.1007/BF01647093].]
#bibitem([19])[D.~Deutsch, A.~Ekert, R.~Jozsa, C.~Macchiavello, S.~Popescu, and A.~Sanpera,
  "Quantum privacy amplification and the security of quantum cryptography over noisy channels," #emph[Physical
  Review Letters] #strong[77], 2818--2821 (1996); erratum #strong[80], 2022 (1998).
  #link("https://doi.org/10.1103/PhysRevLett.77.2818")[doi:10.1103/PhysRevLett.77.2818].
  #link("https://doi.org/10.1103/PhysRevLett.80.2022")[Erratum DOI].
  #link("https://arxiv.org/abs/quant-ph/9604039")[arXiv:quant-ph/9604039].]
#bibitem([20])[I.~Devetak and A.~Winter, "Distillation of secret key and entanglement from quantum states,"
  #emph[Proceedings of the Royal Society A] #strong[461], 207--235 (2005).
  #link("https://doi.org/10.1098/rspa.2004.1372")[doi:10.1098/rspa.2004.1372].
  #link("https://arxiv.org/abs/quant-ph/0306078")[arXiv:quant-ph/0306078].]
#bibitem([21])[S.~N.~Filippov, "Capacity of trace decreasing quantum operations and superadditivity of coherent
  information for a generalized erasure channel," #emph[Journal of Physics A:
  Mathematical and Theoretical] #strong[54], 255301 (2021).
  #link("https://doi.org/10.1088/1751-8121/abfd61")[doi:10.1088/1751-8121/abfd61].
  The cited equation number refers to #link("https://arxiv.org/abs/2101.05686v3")[arXiv:2101.05686v3].]
#bibitem([22])[P.~Frankl and V.~Rödl, "Forbidden intersections," #emph[Transactions of the American Mathematical
  Society] #strong[300]\(1), 259--286 (1987).
  #link("https://doi.org/10.1090/S0002-9947-1987-0871675-6")[doi:10.1090/S0002-9947-1987-0871675-6].]
#bibitem([23])[P.~Frankl and R.~M.~Wilson, "Intersection theorems with geometric consequences,"
  #emph[Combinatorica] #strong[1]\(4), 357--368 (1981).
  #link("https://doi.org/10.1007/BF02579457")[doi:10.1007/BF02579457].]
#bibitem([24])[C.~A.~Fuchs and J.~van~de~Graaf, "Cryptographic distinguishability measures for quantum-mechanical
  states," #emph[IEEE Transactions on Information Theory] #strong[45]\(4), 1216--1227 (1999).
  #link("https://doi.org/10.1109/18.761271")[doi:10.1109/18.761271].
  #link("https://arxiv.org/abs/quant-ph/9712042")[arXiv:quant-ph/9712042].]
#bibitem([25])[N.~Gisin, R.~Renner, and S.~Wolf, "Linking classical and quantum key agreement:
  Is there a classical analog to bound entanglement?" #emph[Algorithmica] #strong[34]\(4), 389--412 (2002).
  #link("https://doi.org/10.1007/s00453-002-0972-7")[doi:10.1007/s00453-002-0972-7].]
#bibitem([26])[N.~Gisin and S.~Wolf, "Linking classical and quantum key agreement:
  Is there 'bound information'?" in #emph[Advances in Cryptology---CRYPTO 2000],
  Lecture Notes in Computer Science #strong[1880], pp.~482--500 (2000).
  #link("https://doi.org/10.1007/3-540-44598-6_30")[doi:10.1007/3-540-44598-6\_30].
  #link("https://arxiv.org/abs/quant-ph/0005042")[arXiv:quant-ph/0005042].]
#bibitem([27])[L.~O.~Hansen, A.~Hauge, J.~Myrheim, and P.~Ø.~Sollid,
  "Low-rank positive-partial-transpose states and their relation to product vectors," #emph[Physical Review A]
  #strong[85], 022309 (2012). #link("https://doi.org/10.1103/PhysRevA.85.022309")[doi:10.1103/PhysRevA.85.022309].
  See also #link("https://arxiv.org/abs/1104.1519v1")[arXiv:1104.1519v1].]
#bibitem([28])[E.~P.~Hanson, C.~Rouzé, and D.~Stilck França, "Eventually entanglement breaking Markovian dynamics:
  structure and characteristic times," #emph[Annales Henri Poincaré] #strong[21], 1517--1571 (2020).
  #link("https://doi.org/10.1007/s00023-020-00906-4")[doi:10.1007/s00023-020-00906-4].]
#bibitem([29])[K.~Horodecki, P.~Ćwikliński, A.~Rutkowski, and M.~Studziński,
  "On distilling secure key from reducible private states and (non)existence of entangled key-undistillable
  states," #emph[New Journal of Physics] #strong[20], 083021 (2018).
  #link("https://arxiv.org/abs/1612.08938v4")[arXiv:1612.08938v4].]
#bibitem([30])[K.~Horodecki, M.~Horodecki, P.~Horodecki, and J.~Oppenheim,
  "Secure key from bound entanglement," #emph[Physical Review Letters] #strong[94], 160502 (2005).
  #link("https://doi.org/10.1103/PhysRevLett.94.160502")[doi:10.1103/PhysRevLett.94.160502].
  #link("https://arxiv.org/abs/quant-ph/0309110v2")[arXiv:quant-ph/0309110v2].]
#bibitem([31])[K.~Horodecki, M.~Horodecki, P.~Horodecki, and J.~Oppenheim,
  "General paradigm for distilling classical key from quantum states," #emph[IEEE Transactions on Information
  Theory] #strong[55]\(4), 1898--1929 (2009).
  #link("https://doi.org/10.1109/TIT.2008.2009798")[doi:10.1109/TIT.2008.2009798].
  #link("https://arxiv.org/abs/quant-ph/0506189v2")[arXiv:quant-ph/0506189v2].]
#bibitem([32])[M.~Horodecki, P.~Horodecki, and R.~Horodecki, "Mixed-state entanglement and distillation:
  Is there a 'bound' entanglement in nature?" #emph[Physical Review Letters] #strong[80], 5239--5242 (1998).
  #link("https://doi.org/10.1103/PhysRevLett.80.5239")[doi:10.1103/PhysRevLett.80.5239].
  #link("https://arxiv.org/abs/quant-ph/9801069")[arXiv:quant-ph/9801069].]
#bibitem([33])[M.~Horodecki, P.~W.~Shor, and M.~B.~Ruskai,
  "Entanglement breaking channels," #emph[Reviews in Mathematical Physics] #strong[15], 629--641 (2003).
  #link("https://doi.org/10.1142/S0129055X03001709")[doi:10.1142/S0129055X03001709].
  See also #link("https://arxiv.org/abs/quant-ph/0302031v2")[arXiv:quant-ph/0302031v2].]
#bibitem([34])[P.~Horodecki, "Separability criterion and inseparable mixed states with positive partial
  transposition," #emph[Physics Letters A] #strong[232], 333--339 (1997).
  #link("https://doi.org/10.1016/S0375-9601(97)00416-7")[doi:10.1016/S0375-9601(97)00416-7].
  See also #link("https://arxiv.org/abs/quant-ph/9703004v2")[arXiv:quant-ph/9703004v2].]
#bibitem([35])[A.~Jamiołkowski, "Linear transformations which preserve trace and positive semidefiniteness of
  operators," #emph[Reports on Mathematical Physics] #strong[3], 275--278 (1972).
  #link("https://doi.org/10.1016/0034-4877(72)90011-0")[doi:10.1016/0034-4877(72)90011-0].]
#bibitem([36])[O.~Kallenberg, #emph[Foundations of Modern Probability], 2nd ed., Probability and Its Applications,
  Springer, New York (2002). #link("https://doi.org/10.1007/978-1-4757-4015-8")[doi:10.1007/978-1-4757-4015-8].]
#bibitem([37])[M.~Kennedy, N.~A.~Manor, and V.~I.~Paulsen,
  "Composition of PPT maps," #emph[Quantum Information and Computation] #strong[18]\(5--6), 472--480 (2018).
  #link("https://doi.org/10.26421/QIC18.5-6-4")[doi:10.26421/QIC18.5-6-4].
  #link("https://arxiv.org/abs/1710.08475v2")[arXiv:1710.08475v2].
  The cited theorem locator refers to the published version.]
#bibitem([38])[J.~S.~Kim and B.~C.~Sanders, "On the geometric distance between quantum states with positive
  partial transposition and private states," #emph[Letters in Mathematical Physics] #strong[92]\(1),
  67--79 (2010). #link("https://doi.org/10.1007/s11005-010-0376-6")[doi:10.1007/s11005-010-0376-6].
  #link("https://arxiv.org/abs/0904.0295v1")[arXiv:0904.0295v1].]
#bibitem([39])[K.~Kraus, "General state changes in quantum theory," #emph[Annals of Physics] #strong[64],
  311--335 (1971). #link("https://doi.org/10.1016/0003-4916(71)90108-4")[doi:10.1016/0003-4916(71)90108-4].]
#bibitem([40])[O.~Krüger and R.~F.~Werner (editors), #emph[Some open problems in quantum information theory]
  (2005). Problem~24, "Secret key from all entangled states," p.~64.
  The cited problem locator refers to #link("https://arxiv.org/abs/quant-ph/0504166v1")[arXiv:quant-ph/0504166v1].]
#bibitem([41])[U.~M.~Maurer, "Secret key agreement by public discussion from common information," #emph[IEEE
  Transactions on Information Theory] #strong[39]\(3), 733--742 (1993).
  #link("https://doi.org/10.1109/18.256484")[doi:10.1109/18.256484].]
#bibitem([42])[N.~D.~Mermin, "Simple unified form for the major no-hidden-variables theorems," #emph[Physical
  Review Letters] #strong[65], 3373--3376 (1990).
  #link("https://doi.org/10.1103/PhysRevLett.65.3373")[doi:10.1103/PhysRevLett.65.3373].]
#bibitem([43])[J.~S.~Milne, #emph[Fields and Galois Theory], version~5.10, September 2022.
  #link("https://www.jmilne.org/math/CourseNotes/FT.pdf")[Author's text], Theorem~4.28 and Lemma~4.31, pp.~55--56.]
#bibitem([44])[S.-J.~Park, "Every PPT channel has finite entanglement breaking index," preprint,
  #link("https://arxiv.org/abs/2608.13551v2")[arXiv:2608.13551v2] \[quant-ph\] (17 August 2026).]
#bibitem([45])[K.~R.~Parthasarathy, "On the maximal dimension of a completely entangled subspace for finite level
  quantum systems," #emph[Proceedings of the Indian Academy of Sciences (Mathematical Sciences)] #strong[114],
  365--374 (2004). #link("https://doi.org/10.1007/BF02829441")[doi:10.1007/BF02829441].
  See also #link("https://arxiv.org/abs/quant-ph/0405077v1")[arXiv:quant-ph/0405077v1].]
#bibitem([46])[J.~Pauwels, N.~Gisin, and R.~Renner, "Bipartite Bound Information Exists," preprint,
  #link("https://arxiv.org/abs/2607.25838v2")[arXiv:2607.25838v2] \[quant-ph\] (8 September 2026).]
#bibitem([47])[A.~Peres, "Incompatible results of quantum measurements," #emph[Physics Letters A] #strong[151],
  107--108 (1990). #link("https://doi.org/10.1016/0375-9601(90)90172-K")[doi:10.1016/0375-9601(90)90172-K].]
#bibitem([48])[A.~Peres, "Two simple proofs of the Kochen--Specker theorem," #emph[Journal of Physics A:
  Mathematical and General] #strong[24]\(4), L175--L178 (1991).
  #link("https://doi.org/10.1088/0305-4470/24/4/003")[doi:10.1088/0305-4470/24/4/003].]
#bibitem([49])[A.~O.~Pittenger, "Unextendible product bases and the construction of inseparable states,"
  #emph[Linear Algebra and its Applications] #strong[359], 235--248 (2003).
  #link("https://doi.org/10.1016/S0024-3795(02)00423-8")[doi:10.1016/S0024-3795(02)00423-8].
  See also #link("https://arxiv.org/abs/quant-ph/0208028v1")[arXiv:quant-ph/0208028v1].]
#bibitem([50])[R.~T.~Powers and E.~Størmer, "Free states of the canonical anticommutation relations,"
  #emph[Communications in Mathematical Physics] #strong[16], 1--33 (1970).
  #link("https://doi.org/10.1007/BF01645492")[doi:10.1007/BF01645492].]
#bibitem([51])[A.~Prakash, J.~Sikora, A.~Varvitsiotis, and Z.~Wei,
  "Completely positive semidefinite rank," #emph[Mathematical Programming] #strong[171]\(1--2), 397--431 (2018).
  #link("https://doi.org/10.1007/s10107-017-1198-4")[doi:10.1007/s10107-017-1198-4].
  #link("https://arxiv.org/abs/1604.07199")[arXiv:1604.07199].]
#bibitem([52])[M.~Rahaman, S.~Jaques, and V.~I.~Paulsen, "Eventually entanglement breaking maps," #emph[Journal of
  Mathematical Physics] #strong[59]\(6), 062201 (2018).
  #link("https://doi.org/10.1063/1.5024385")[doi:10.1063/1.5024385].
  The cited theorem locator refers to #link("https://arxiv.org/abs/1801.05542v2")[arXiv:1801.05542v2].]
#bibitem([53])[R.~Renner and R.~König, "Universally composable privacy amplification against quantum adversaries,"
  in #emph[Theory of Cryptography---TCC 2005], Lecture Notes in Computer Science #strong[3378],
  pp.~407--425 (2005). #link("https://doi.org/10.1007/978-3-540-30576-7_22")[doi:10.1007/978-3-540-30576-7\_22].
  #link("https://arxiv.org/abs/quant-ph/0403133")[arXiv:quant-ph/0403133].]
#bibitem([54])[M.~B.~Ruskai, M.~Junge, D.~Kribs, P.~Hayden, and A.~Winter (organizers),
  #emph[Operator structures in quantum information theory],
  Banff International Research Station workshop report 12w5084 (2012).
  #link("https://www.birs.ca/workshops/2012/12w5084/report12w5084.pdf")[Official report], Section~3, Problem~G, p.~5.]
#bibitem([55])[J.~Schliemann, D.~Loss, and A.~H.~MacDonald, "Double-occupancy errors, adiabaticity,
  and entanglement of spin qubits in quantum dots," #emph[Physical Review B] #strong[63], 085311 (2001).
  #link("https://doi.org/10.1103/PhysRevB.63.085311")[doi:10.1103/PhysRevB.63.085311].
  The cited equations refer to #link("https://arxiv.org/abs/cond-mat/0009083v1")[arXiv:cond-mat/0009083v1].]
#bibitem([56])[S.~Singh and I.~Nechita, "The PPT$""^2$ conjecture holds for all Choi-type maps," #emph[Annales
  Henri Poincaré] #strong[23], 3311--3329 (2022).
  #link("https://doi.org/10.1007/s00023-022-01166-0")[doi:10.1007/s00023-022-01166-0].
  #link("https://arxiv.org/abs/2011.03809v2")[arXiv:2011.03809v2].]
#bibitem([57])[F.~Sottile, "From enumerative geometry to solving systems of polynomial equations," in
  #emph[Computations in Algebraic Geometry with Macaulay 2], Algorithms and Computation in Mathematics #strong[8],
  Springer, pp.~101--129 (2001). #link("https://franksottile.github.io/research/pdf/M2.pdf")[Author's version],
  Sections~2.2--2.3, pp.~4--6.]
#bibitem([58])[The Stacks Project Authors, #emph[The Stacks project].
  #link("https://stacks.math.columbia.edu/tag/00FV")[Tag~00FV] (Hilbert Nullstellensatz) and
  #link("https://stacks.math.columbia.edu/tag/0BBZ")[Tag~0BBZ] (height theorem).]
