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

#align(center)[#text(size: 16pt, weight: "bold")[The entropy photon-number inequality]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The entropy photon number of an $n$-mode bosonic state is the mean photon number per mode of the product of $n$
  identical one-mode thermal states with the same total entropy.
  Guha, Erkmen, and Shapiro conjectured that this quantity obeys a concavity inequality under beam-splitter mixing
  of independent inputs [20]. Their entropy photon-number inequality is a quantum counterpart of the classical
  entropy power inequality and has consequences for minimum output entropy and the information capacities of
  bosonic channels. We prove its two-input form for finite-energy states.

Write

#[#set math.equation(numbering: n => "(1.1)")
 $ g \( t \) = \( t + 1 \) log \( t + 1 \) - t log t \, wide t gt.eq 0 \, $ <eq:g-definition>]

with $0 log 0 = 0$. This continuous function increases from zero to infinity; its inverse is denoted by $g^(- 1)$.
  All entropies and logarithms in this paper use the natural base.

#thm([Theorem 1.1.])[
  (Entropy photon-number inequality).  #emph[Let $n gt.eq 1$ be finite, and let $rho_A \,
    rho_B$ be states on $n$ bosonic modes, with annihilation operators $a_1 \, dots.h \, a_n$ and $b_1 \,
    dots.h \, b_n$, respectively, satisfying
$ "Tr" rho_A sum_(j = 1)^n a_j^dagger a_j < oo \, wide "Tr" rho_B sum_(j = 1)^n b_j^dagger b_j < oo . $

 The joint input is $rho_A ⊗ rho_B$; no independence assumption is made among the modes within either state.
   For $0 lt.eq eta lt.eq 1$, let $rho_C$ be the reduced state of the modes
$ c_j = sqrt(eta) thin a_j + sqrt(1 - eta) thin b_j \, wide 1 lt.eq j lt.eq n \, $

 after passive beam-splitter mixing. Then
#[#set math.equation(numbering: n => "(1.2)")
 $ g^(- 1) #h(-0.16667em) (frac(S \( rho_C \), n)) gt.eq eta thin g^(- 1) #h(-0.16667em)
   (frac(S \( rho_A \), n)) + \( 1 - eta \) thin g^(- 1) #h(-0.16667em) (frac(S \( rho_B \), n)) \, $ <eq:epni>]

 where $S \( rho \) = - "Tr" rho log rho$.]
] <thm:epni>

Thus Theorem 1 resolves the entropy photon-number conjecture positively for finite-energy inputs,
  including arbitrary internal multimode entanglement. Thermal inputs with a common mean photon number within each
  port give equality, even when the means at the two ports differ.

For the channel consequences, write $tau_r$ for the $n$-mode product thermal state with mean photon number $r$ in
  each mode, including the vacuum at $r = 0$; thus $S \( tau_r \) = n g \( r \)$.
  Let $cal(E)_(eta \, N_B)$ be the one-mode thermal attenuator obtained by retaining $c = sqrt(eta) thin a +
  sqrt(1 - eta) thin b$ when the environment mode $b$ is thermal with mean photon number $N_B$ and is independent
  of the input. Its tensor power $cal(E)_(eta \, N_B)^(⊗ n)$ uses the same parameters in every mode and the joint
  input $rho ⊗ tau_(N_B)$.

#thm([Corollary 1.2.])[
  (Constrained entropy minimum for identical thermal attenuators).  #emph[Let $n gt.eq 1$ be finite, let $s \,
    N_B gt.eq 0$ be finite, and let $0 lt.eq eta lt.eq 1$. Every state $rho$ on $n$ modes with $"Tr" rho
    sum_(j = 1)^n a_j^dagger a_j < oo$ satisfies
#[#set math.equation(numbering: n => "(1.3)")
 $ 1 / n S #h(-0.16667em) (cal(E)_(eta \, N_B)^(⊗ n) \( rho \)) gt.eq
   g #h(-0.16667em) (eta g^(- 1) #h(-0.16667em) (frac(S \( rho \), n)) + \( 1 - eta \) N_B) .
   $ <eq:thermal-attenuator-bound>]

 In particular, the exact constrained minimum is
#[#set math.equation(numbering: n => "(1.4)")
 $ min_(rho upright(" a state on ") n upright(" modes")\
"Tr" rho sum_(j = 1)^n a_j^dagger a_j < oo\
S \( rho \) = n s) 1 / n S #h(-0.16667em) (cal(E)_(eta \, N_B)^(⊗ n) \( rho \)) =
  g #h(-0.16667em) (eta g^(- 1) \( s \) + \( 1 - eta \) N_B) . $ <eq:thermal-attenuator-minimum>]

 It is attained by the product thermal input $tau_(g^(- 1) \( s \))$.
   No independence assumption is imposed among the modes of $rho$;
   only the environment is required to be independent of that input.]
] <cor:thermal-attenuator>

#proof[
  The environment $tau_(N_B)$ has finite total mean photon number $n N_B$ and entropy $n g \( N_B \)$.
    The retained output has finite energy because passive mixing preserves combined total number,
    so its entropy is finite by Lemma 4. Apply Theorem 1 to the independent inputs $rho$ and $tau_(N_B)$,
    and then apply the increasing function $g$, to obtain (1.3).
  For $r = g^(- 1) \( s \) < oo$, the state $tau_r$ has finite total mean photon number $n r$ and entropy $n s$.
    Proposition 5 gives
  $ cal(E)_(eta \, N_B)^(⊗ n) \( tau_r \) = tau_(eta r + \( 1 - eta \) N_B) \, $
  whose entropy is $n g \( eta r + \( 1 - eta \) N_B \)$. This attains the lower bound and proves (1.4).
    The endpoints are included: at $eta = 0$ the retained state is the environment, and at $eta =
    1$ it is the input. When $s = 0$ or $N_B = 0$, the corresponding thermal state is the vacuum,
    covered by the zero-mean case of Proposition 5. ◻
]

Corollary 2 concerns identical passive thermal attenuators with an independent product thermal environment.
  It asserts attainment, not uniqueness, and makes no claim for mode-dependent attenuations, amplifiers,
  or additive-noise channels.

The vacuum case also determines the classical capacity region of a degraded pure-loss broadcast channel.
  Here one input mode per use is passively split with auxiliary vacuum modes independent of the input between
  receivers $B \, C$ and an inaccessible loss output. The power transmissivities satisfy $0 lt.eq
  eta_C < eta_B$ and $eta_B + eta_C lt.eq 1$, so $C$’s marginal is obtained from $B$’s by a further pure-loss
  attenuation. Section 7 gives the exact region for independent classical messages and separate collective
  decoding, without feedback or receiver cooperation. Its finite mean photon constraint is averaged over the
  codebook and uses, and its finite-energy codewords may be entangled across uses.
  The vacuum-port specialization of Theorem 1 supplies the entropy input assumed in the converse of Guha, Shapiro,
  and Erkmen [21]; coherent-state superposition coding supplies achievability.

=== 1.1 Context and earlier results <context-and-earlier-results>

Shannon introduced entropy power in his theory of communication [28];
  the Fisher-information proofs of Stam and Blachman [30,4] became central to its later development.
  For independent classical random vectors, the entropy power inequality compares the entropy of a sum with the
  entropies of its summands. Its bosonic counterpart replaces addition by passive mixing of quantum modes.
  The analogy is especially natural for thermal states: their mean photon numbers add with the beam-splitter
  weights, and their entropies are given by the same function $g$ appearing in Theorem 1.
  The formulation of Guha, Erkmen, and Shapiro [20] Section II.B makes this thermal comparison the central
  conjecture and explains its consequences for bosonic communication.
  Earlier work had established the capacity of the pure-loss bosonic channel [18] and connected noisy-channel
  capacity questions with minimum output entropy [17]. The constrained minimum-output problem also appears in the
  bosonic broadcast-channel analysis of Guha, Shapiro, and Erkmen [21].
  Early EPnI special cases included one-mode number-diagonal inputs with two nonzero probabilities and a vacuum
  second port [6].

König and Smith [24] established a quantum entropy power inequality using quantum Fisher information and a heat
  evolution. Their results include the linear bound

$ S \( rho_C \) gt.eq eta S \( rho_A \) + \( 1 - eta \) S \( rho_B \) $

for every transmissivity, and the exponential entropy power bound for a balanced beam splitter.
  De Palma, Mari, and Giovannetti [10] proved the exponential bound for every transmissivity,

#[#set math.equation(numbering: n => "(1.5)")
 $ e^(S \( rho_C \) \/ n) gt.eq eta e^(S \( rho_A \) \/ n) + \( 1 - eta \) e^(S \( rho_B \) \/ n) .
   $ <eq:exponential-qepi>]

These results are formulated for an arbitrary finite number of modes and independent inputs,
  with no product assumption within a group. De Palma, Mari, Lloyd,
  and Giovannetti [11] subsequently treated more general linear mixing of several independent groups of modes.
  De Palma and Trevisan later gave a rigorous finite-energy treatment of the Fisher-information and heat-flow
  steps using an integral formulation; their conditional inequality with a trivial memory system yields (1.5) for
  arbitrary independent finite-energy inputs [12] Theorem 6.

The entropy photon-number inequality requires a sharper comparison than (1.5) when the input entropy levels
  differ. When $S \( rho_A \) = S \( rho_B \)$, the linear entropy bound already gives the EPnI value by
  monotonicity of $g^(- 1)$. For unequal entropy levels, thermal inputs attain EPnI,
  whereas the exponential bound does not recover their exact output entropy.
  This distinction matters for the minimum output entropy problem with an input-entropy constraint:
  the bound must reproduce the exact thermal comparison at unequal entropy levels.

The EPnI itself was also known for two independent Gaussian inputs in any finite number of modes,
  including Gaussian correlations within either input; De Palma proves this case using symplectic eigenvalue
  comparisons [7] Appendix A.8.

The Gaussian optimizer theorem of Giovannetti, Holevo, and García-Patrón [19] settled the unconstrained
  minimum-output problem for broad classes of Gaussian channels.
  Fixing a positive input entropy is a different optimization problem.
  For one-mode gauge-covariant channels, De Palma, Trevisan,
  and Giovannetti established optimality of passive rearrangement at fixed spectrum [13],
  then the sharp entropy bound for the quantum-limited attenuator [14],
  and finally the sharp bound for one-mode phase-covariant Gaussian channels with thermal noise [15] Theorem 4.
  Their multimode extension [16] Theorem 11 covers inputs diagonal in some product basis,
  including classical correlations in that basis.

Later advances address further parts of this landscape. De Palma [8] proved the sharp constrained bound for
  multimode entanglement-breaking Gaussian attenuators and amplifiers with thermal environments,
  and improved lower bounds for other parameter regimes. Beigi and Rahimi-Keshari [3] proved a one-mode
  meta-logarithmic-Sobolev inequality that also gives a variational proof of the one-mode constrained
  minimum-output result. Beigi and Mehrabi [2] established subset-convolution inequalities for exponential entropy
  power and entropy monotonicity under repeated symmetric quantum convolution of an identical input.

Theorem 1 supplies the thermal comparison for two freely varying inputs,
  including arbitrary entanglement within either port. Corollary 2 specializes it to the exact finite-mode
  constrained minimum for identical thermal attenuators, without a product or separability restriction on the
  finite-energy input. Thermal states enter the proof of Theorem 1 as reference states and as limits of
  regularized minimizers. The original inputs need not be Gaussian, number-diagonal, or independent across modes.

=== 1.2 Proof strategy <proof-strategy>

The difficulty is to compare the two freely varying inputs with thermal states at their respective entropy levels.
  We fix those thermal reference parameters near a hypothetical strictly violating pair.
  This turns the contradiction into a negative minimum of a linear combination of three entropies,
  after adding penalties that ensure compactness and regularity.
  The reference parameters remain fixed throughout the variational argument.

An independent analytic ingredient is an interpolation theorem for positive diagonal quadratic forms,
  proved in Section 3. For positive scalars $m$ and real parameters $x \, y$,
  it transforms four comparisons with weights

$ m f \( x \) e^x \, quad m f \( x \) e^(- x) \, quad m f \( y \) e^y \, quad m f \( y \) e^(- y) \, wide
  f \( x \) = frac(x, sinh x) \, quad f \( 0 \) = 1 \, $

into the comparison with weight $m f \( x \) f \( y \) \/ f \( x + y \)$.
  No compatibility is required between the linear maps and the diagonal multipliers.
  A Stieltjes representation for the derivative of an implicitly defined function is the essential analytic step.
  The theorem is formulated for finitely many spectral parameter values on source tests and permits unrestricted
  nonnegative target sums, so it also applies to the infinite matrix spaces used below.

Section 4 develops the variational argument. Assuming a strict violation, we add a thermal port,
  a small thermal replacement of the output, a relative-entropy penalty, and a fourth-moment penalty.
  The resulting functional has faithful Gibbs minimizers with enough moment control for all subsequent traces.
  Varying one input at a time yields a component contraction in the logarithmic-mean metric #emph[at those
  minimizers]. It is not asserted as a universal channel inequality.

Section 5 combines two product-port variance estimates with the component contractions.
  These supply precisely the four hypotheses of the interpolation theorem.
  Its conclusion controls the norm of a centered thermal-balance defect:
  a linear functional measuring the creation–annihilation balance after subtracting the state’s mean.
  In Section 6, pairing the Gibbs identities with the relaxation generators gives an exact cancellation of the
  centered energy terms. As the fourth-moment penalty vanishes, the remaining defects and means tend to zero;
  their number-basis identities force both limiting inputs to be thermal.
  Entropy continuity then contradicts the original strictly negative objective value.

The auxiliary regularizations have linked roles: the relative-entropy penalty gives energy coercivity and supplies
  the strict margin in the final defect and mean estimate, while the thermal port supplies the slack needed for
  the associated Hessian comparisons. Output replacement controls the output logarithm,
  and the moment penalty justifies the unbounded-generator calculations.
  Only the last penalty tends to zero in the concluding compactness argument.
  This avoids assuming differentiability of entropy along an unbounded evolution or convergence of the input energies.

Section 2 supplies the entropy, compactness, and thermal-mixing facts used in this argument.
  Each of the specialized interpolation, minimization, and limiting statements is proved within the paper.

== 2 Bosonic states, energy, and entropy <sec:preliminaries>

We work on the $n$-mode Fock space $cal(H)_n = ell^2 \( bb(N)_0^n \)$,
  with number basis ${ \| upright(bold(k)) chevron.r : upright(bold(k)) in bb(N)_0^n }$.
  For the annihilation operators $d_j$,

$ d_j \| upright(bold(k)) chevron.r = sqrt(k_j) thin \| upright(bold(k)) - upright(bold(e))_j chevron.r \, wide
  N = sum_(j = 1)^n d_j^dagger d_j \, wide W = I + N . $

A state is a positive trace-class operator of trace one. Expectations of positive unbounded operators are
  understood as increasing limits of bounded spectral truncations.
  Form inequalities have their usual quadratic-form meaning on the indicated domains.

For $r > 0$, put

#[#set math.equation(numbering: n => "(2.1)")
 $ h \( r \) = log \( 1 + 1 \/ r \) \, wide tau_r = \( r + 1 \)^(- n) e^(- h \( r \) N) . $ <eq:thermal-definition>]

The product geometric law gives

#[#set math.equation(numbering: n => "(2.2)")
 $ "Tr" tau_r N = n r \, wide S \( tau_r \) = n g \( r \) . $ <eq:thermal-moments>]

The state $tau_r$ is faithful and has all number moments finite. At $r = 0$, its limiting state is the multimode vacuum.

=== 2.1 Entropy estimates and compactness <entropy-estimates-and-compactness>

We first record the entropy facts needed in the infinite-dimensional argument.
  The relative entropy introduced by Umegaki [31] gives the Gibbs variational principle.
  For oscillator energy bounds, the compactness and entropy-continuity statements below are special cases of the
  general energy-constrained theory [29,32]; we include the elementary cutoff proof used here.

#thm([Lemma 2.1.])[
  (Relative entropy and the Gibbs variational inequality).  #emph[Let $sigma$ be a faithful state,
    and suppose both $S \( rho \)$ and $"Tr" rho \( - log sigma \)$ are finite. Then
$ D \( rho bar.v.double sigma \) := - S \( rho \) + "Tr" rho \( - log sigma \) gt.eq 0 \, $

 with equality if and only if $rho = sigma$. Consequently, if $K$ is bounded below and $0 < Z =
   "Tr" e^(- K) < oo$, its Gibbs state $Z^(- 1) e^(- K)$ uniquely minimizes $"Tr" rho K -
   S \( rho \)$ among states for which these expressions are finite,
   provided that Gibbs state belongs to the admitted class.]
] <lem:gibbs-variational>

#proof[
  Choose eigenvectors $psi_j$ of $rho$ with positive eigenvalues $p_j$, and set $q_j = chevron.l psi_j \,
    sigma psi_j chevron.r$. Scalar Jensen applied to the spectral measure of $sigma$ gives
  $ - chevron.l psi_j \, log sigma thin psi_j chevron.r gt.eq - log q_j . $
  The elementary inequality $p log \( p \/ q \) gt.eq p - q$ and $sum_j q_j lt.eq 1$ now imply nonnegativity.
    Equality requires $p_j = q_j$, no mass of $sigma$ outside the support of $rho$,
    and equality in each Jensen inequality. The last condition makes each $psi_j$ an eigenvector of $sigma$ with
    eigenvalue $q_j$, so $rho = sigma$. The Gibbs assertion follows by substituting $- log sigma = K + log Z$. ◻
]

#thm([Lemma 2.2.])[
  (Energy bound and compactness).  #emph[For each finite $E gt.eq 0$, the set of states with $"Tr" rho N lt.eq
    E$ is compact in trace norm. On this set entropy is continuous and obeys
#[#set math.equation(numbering: n => "(2.3)")
 $ 0 lt.eq S \( rho \) lt.eq n g \( E \/ n \) . $ <eq:entropy-energy>]

 Every finite-energy state is a trace-norm limit of normalized finite-number truncations with uniformly bounded
   energies and convergent entropies.]
] <lem:energy-compactness>

#proof[
  Diagonal entropy in any orthonormal basis bounds von Neumann entropy above:
    apply concavity of $- t log t$ to each diagonal entry expressed in a spectral decomposition,
    then sum the nonnegative terms. Compare the number-basis probabilities with the geometric probabilities of
    $tau_(E \/ n)$. Summing $- p log p lt.eq - p log q + q - p$ gives, when $E > 0$,
  $ S \( rho \) lt.eq n log \( 1 + E \/ n \) + h \( E \/ n \) E = n g \( E \/ n \) . $
  For $E = 0$, the state is the vacuum and the assertion is immediate.
  Let $P_K = upright(bold(1))_({ N lt.eq K })$, $Q_K = I - P_K$, and $q = "Tr" rho Q_K$.
    The rank of $P_K$ is finite, and $q lt.eq E \/ \( K + 1 \)$.
    Factoring off $rho^(1 \/ 2)$ and applying the Hilbert–Schmidt Cauchy–Schwarz inequality bounds each
    off-diagonal block by $sqrt(q)$ in trace norm. Hence $rho$ is uniformly approximated by its finite-dimensional
    compression; normalizing the latter changes its trace norm by at most $q$. This proves precompactness.
    The energy bound is closed by lower semicontinuity of positive spectral expectations, so the set is compact.
  For completeness, write $H_2 \( q \) = - q log q - \( 1 - q \) log \( 1 - q \)$.
    Pinching into the two number blocks changes the entropy by a quantity between zero and $H_2 \( q \)$.
    To see the upper bound directly, split each vector in a pure eigenensemble of $rho$ into its two projected
    vectors. Concavity of $H_2$ bounds the increase of the ensemble-weight entropy by $H_2 \( q \)$;
    the entropy of a pure-state mixture is at most its weight entropy.
    The latter fact follows by applying diagonal entropy to the Gram operator of the weighted vectors,
    which has the mixture’s nonzero eigenvalues. The lower bound follows from the same concavity argument for pinching.
  The pinched entropy equals
  $ H_2 \( q \) + \( 1 - q \) S #h(-0.16667em) (frac(P_K rho P_K, 1 - q)) +
    q S #h(-0.16667em) (frac(Q_K rho Q_K, q)) \, $
  where zero-mass terms are omitted. The last term is bounded by
  $ q n thin g #h(-0.16667em) (frac(E, q n)) \, $
  which tends to zero uniformly as $q arrow.b 0$. The low-number entropy term is continuous in the
    finite-dimensional compression. These bounds uniformly approximate $S \( rho \)$ by continuous
    finite-dimensional expressions and prove its continuity under the common energy bound.
  Finally, normalized number compressions converge in trace norm.
    Their energies are at most $E \/ \( 1 - q \)$, and hence are uniformly bounded for all sufficiently large $K$.
    The established continuity proves entropy convergence. ◻
]

In particular, entropy grows only logarithmically with energy for fixed $n$,
  whereas a positive linear energy penalty is coercive. For $r > 0$, we shall repeatedly use the identity

#[#set math.equation(numbering: n => "(2.4)")
 $ D \( rho bar.v.double tau_r \) = - S \( rho \) + n log \( r + 1 \) +
   h \( r \) "Tr" rho N . $ <eq:thermal-relative-entropy>]

=== 2.2 Passive mixing <passive-mixing>

For any finite collection of ports, a real orthogonal rotation of their mode operators,
  performed identically for every mode index, is implemented by a unitary on their joint Fock space.
  One way to construct it is to rotate the creation operators acting on the joint vacuum;
  the commutation relations show that the resulting number vectors again form an orthonormal basis.
  This unitary preserves combined total number. A retained subsystem therefore has energy no greater than the
  combined input energy. On each finite total-number sector, the unitary depends continuously on the rotation;
  consequently the induced channels are trace-norm continuous on every fixed state as the rotation varies.

#thm([Proposition 2.3.])[
  (Thermal mixing).  #emph[Suppose independent ports carry the $n$-mode states $tau_(r_s)$,
    and the retained modes are $sum_s sqrt(lambda_s) thin d_(s \, j)$, where $lambda_s gt.eq
    0$ and $sum_s lambda_s = 1$. Their joint retained state is
$ tau_(sum_s lambda_s r_s) . $

]
] <prop:thermal-mixing>

#proof[
  The coherent-state representation of a thermal state is
  $ tau_r = integral_(bb(C)^n) \| z chevron.r chevron.l z \| thin
    frac(e^(- lr(bar.v.double z bar.v.double)^2 \/ r), \( pi r \)^n) thin d^(2 n) z . $
  Indeed, inserting the coefficients $chevron.l upright(bold(k)) \| z chevron.r =
    e^(- lr(bar.v.double z bar.v.double)^2 \/ 2) z^(upright(bold(k))) \/
    sqrt(upright(bold(k)) !)$ and integrating gives the diagonal geometric probabilities in (2.1).
    Products of coherent states transform by the same linear rotation of their amplitudes,
    as follows from their annihilation eigenvector equations or creation-operator expansion.
    Independent centered circular complex Gaussians with covariances $r_s
    I$ consequently produce retained covariance $\( sum_s lambda_s r_s \) I$.
    The displayed representation proves the claim. Zero reference means follow by continuity. ◻
]

This thermal representation and its relation to entropy photon number are also the starting point of the original
  formulation [20] Section II.B. In the argument below it is only the auxiliary reference states that have this
  special form.

== 3 Interpolation of diagonal form comparisons <sec:interpolation>

The proof requires an interpolation principle for quadratic forms. Its hypotheses involve four simple weights.
  In the later application at the regularized minima, the target weight makes the squared norm of a centered
  thermal-balance defect equal to the normalized entropy-production pairing plus a centered-energy correction.
  This is the identity used in the stationarity cancellation.
  We prove the principle here, including the analytic property on which it depends.

Set

#[#set math.equation(numbering: n => "(3.1)")
 $ f \( x \) = frac(x, sinh x) \, wide b \( x \) = x coth x \, wide f \( 0 \) = b \( 0 \) = 1 . $ <int:fb>]

Both functions are positive and even on $bb(R)$. On Hilbert spaces $cal(H)_j$, $0 lt.eq j lt.eq k$,
  fix coordinate representations in which all weights below act by scalar multiplication.
  A positive weight $X_j$ defines the possibly unbounded form

$ Q_(X \, j) \( Z \) = sum_alpha X_j \( alpha \) \| Z_alpha \|^2 \; $

fixed positive coordinate measures can be absorbed into the coordinates.
  Let $cal(T) subset cal(H)_0$ be a linear test space, let $L_i : cal(T) arrow.r cal(H)_i$ be linear,
  and let $w_i > 0$ for $1 lt.eq i lt.eq k$. We say that the family $X = \( X_j \)_(j = 0)^k$ #emph[satisfies
  comparison] if

#[#set math.equation(numbering: n => "(3.2)")
 $ Q_(X \, 0) \( Z \) gt.eq sum_(i = 1)^k w_i Q_(X \, i) \( L_i Z \) wide \( Z in cal(T) \) . $ <int:comparison>]

All sums on the right are interpreted as nonnegative coordinate sums.

#thm([Theorem 3.1.])[
  (Four-weight interpolation).  #emph[At every coordinate of every space, let $m > 0$ and $x \,
    y in bb(R)$ be given. Suppose each $Z in cal(T)$ is supported on finitely many values of the parameter tuple
    $\( m \, x \, y \)$, and $cal(T)$ is invariant under scalar multiplication by functions of this tuple.
    If the four families
#[#set math.equation(numbering: n => "(3.3)")
 $ m f \( x \) e^x \, quad m f \( x \) e^(- x) \, quad m f \( y \) e^y \, quad m f \( y \) e^(- y) $ <int:four-weights>]

 satisfy comparison, then so does
#[#set math.equation(numbering: n => "(3.4)")
 $ F = m frac(f \( x \) f \( y \), f \( x + y \)) . $ <int:target-weight>]

]
] <thm:interpolation>

Finitely many parameter values do not mean finitely many nonzero coordinates.
  In particular, a centered finite matrix can have an infinite identity tail, all at the same parameter value.
  The hypothesis permits this situation, which will occur in our application.

=== 3.1 Operations that preserve comparison <int:operations>

The operations below belong to the parallel-sum and operator-mean calculus of Anderson–Duffin and Kubo–Ando
  [1,25]. We give direct form proofs, including the limits needed for unbounded weights.

Throughout this subsection, the auxiliary weights are positive functions of the parameter tuple
  $\( m \, x \, y \)$. Positive linear combinations preserve (3.2). So do pointwise limits of such weights:
  on a source test there are only finitely many parameter values, so its form converges;
  on the target spaces Fatou’s lemma gives the required inequality.

Comparisons also persist under the #emph[parallel sum]

#[#set math.equation(numbering: n => "(3.5)")
 $ X : Y = \( X^(- 1) + Y^(- 1) \)^(- 1) . $ <int:parallel>]

Indeed, coordinatewise,

$ \( X : Y \) \| z \|^2 = min_(u + v = z) #scale(x: 120%, y: 120%)[\(] X \| u \|^2 +
  Y \| v \|^2 #scale(x: 120%, y: 120%)[\)] \, wide u = frac(Y, X + Y) z \, quad v = frac(X, X + Y) z . $

The source minimizers $U \, V$ lie in $cal(T)$. Apply the comparisons for $X$ and $Y$ to them, then use $L_i U +
  L_i V = L_i Z$ and the coordinatewise minimum on each target space.
  Target minimizers need not belong to any specified test space.

Consequently, if $X \, Y$ satisfy comparison, so do their logarithmic mean
  $ell \( X \, Y \) = \( X - Y \) \/ \( log X - log Y \)$ and $X Y \/ ell \( X \, Y \)$,
  with the continuous value $ell \( X \, X \) = X$. The identities that implement these operations are

#[#set math.equation(numbering: n => "(3.6)")
 $ frac(1, ell \( X \, Y \)) = integral_0^1 frac(d t, \( 1 - t \) X + t Y) \, wide frac(X Y, ell \( X \, Y \)) =
   integral_0^1 frac(d t, t \/ X + \( 1 - t \) \/ Y) . $ <int:log-means>]

For the first identity, a positive quadrature followed by inversion is a finite parallel sum:
  if $q_j > 0$ and $V_j > 0$, then

$ (sum_(j = 1)^M q_j / V_j)^(- 1) = \( V_1 \/ q_1 \) : dots.h.c : \( V_M \/ q_M \) . $

Here $V_j = \( 1 - t_j \) X + t_j Y$ already satisfies comparison.
  The second identity is a positive average of weighted parallel sums.
  Pointwise limits give the integrals; zero coefficients are omitted or obtained by a limit.
  Thus no rule asserting preservation under multiplication of weights is being used.

Apply these two operations to each opposite-exponent pair in (3.3).
  Since their logarithmic mean is $m$, we obtain comparison for the three families

#[#set math.equation(numbering: n => "(3.7)")
 $ m \, wide m s \, wide m t \, wide s = f \( x \)^2 \, quad t = f \( y \)^2 . $ <int:basic-weights>]

The next step constructs one further weight from these three.

=== 3.2 A Stieltjes representation <a-stieltjes-representation>

The function $x mapsto f \( x \)^2$ decreases from $1$ to $0$ on $\[ 0 \, oo \)$. Define $B$ on $\( 0 \, 1 \]$ by

#[#set math.equation(numbering: n => "(3.8)")
 $ B #scale(x: 120%, y: 120%)[\(] f \( x \)^2 #scale(x: 120%, y: 120%)[\)] = b \( x \) . $ <int:B-definition>]

The scalar quadratic (3.18), used at the end of the proof, determines the candidate for the additional weight.
  It pairs the four original weights on $xi minus.plus phi.alt$ and $xi plus.minus phi.alt$ and adds $E \|
  phi.alt \|^2$. For a candidate $E = m e > 0$, write $a = b \( x \) + b \( y \)$. Its minimum is

$ m / 2 (a - frac(\( x - y \)^2, a + 2 e)) \| xi \|^2 . $

For $x^2 eq.not y^2$, the addition formula gives $F \/ m = \( y b \( x \) + x b \( y \) \) \/ \( x + y \)$.
  Equating the minimum with $F \| xi \|^2$ therefore requires, within this quadratic construction,

$ \( a + 2 e \) \( b \( x \) - b \( y \) \) = x^2 - y^2 \, wide E =
  frac(m \( t - s \), 2 \( B \( s \) - B \( t \) \)) \, quad s = f \( x \)^2 \, quad t = f \( y \)^2 \, $

where the last equality uses $b \( z \)^2 = f \( z \)^2 + z^2$.
  The final minimization will verify the value in all cases.
  It remains to obtain comparison for this candidate from the known weights.
  Its reciprocal has the integral form, initially for $0 < s \, t < 1$,

#[#set math.equation(numbering: n => "(3.9)")
 $ 1 / E = 2 / m integral_0^1 - B' #scale(x: 120%, y: 120%)[\(] theta s + \( 1 - theta \) t
   #scale(x: 120%, y: 120%)[\)] thin d theta \, wide s = f \( x \)^2 \, quad t = f \( y \)^2 . $ <int:E-integral>]

The lemma below will show that this defines a positive continuous weight also when $s = 1$ or $t = 1$.
  A Stieltjes representation of $- B'$ turns the reciprocal into a limit of positive combinations of $1 \/
  m$ and reciprocals of $theta \( m s \) + \( 1 - theta \) \( m t \) + r m$, with $r gt.eq 0$.
  The parallel-sum argument above will then construct $E$ from the three known weights.
  We now prove the required representation.

#thm([Lemma 3.2.])[
  #emph[The function $B$ extends holomorphically to the upper half-plane and across the positive real axis,
    is real and strictly decreasing there, and satisfies $B \( 1 \) = 1$, $B' \( 1 \) = - 1$.
    There are a constant $c gt.eq 0$ and a positive measure $nu$ on $\[ 0 \, oo \)$ such that
#[#set math.equation(numbering: n => "(3.10)")
 $ - B' \( s \) = c + integral_(\[ 0 \, oo \)) frac(d nu \( r \), s + r) quad \( s > 0 \) \, wide
   integral_(\[ 0 \, oo \)) frac(d nu \( r \), 1 + r) < oo . $ <int:stieltjes-form>]

 In particular $- B' \( s \) > 0$ for every $s > 0$.]
] <int:stieltjes>

#proof[
  For $x > 0$, put $s = f \( x \)^2 in \( 0 \, 1 \)$. Differentiating $s = f \( x \)^2$ and $B \( s \) =
    b \( x \)$ gives
  $ frac(d s, d x) = frac(2 s \( 1 - B \), x) \, wide frac(d b, d x) = frac(B - s, x) . $
  Here $B \( s \) = x coth x > 1$, so we may set
  $ R \( s \) = frac(1 - s, s \( B \( s \) - 1 \)) . $
  The derivatives give
  #[#set math.equation(numbering: n => "(3.11)")
   $ - B' \( s \) = frac(B \( s \) - s, 2 s \( B \( s \) - 1 \)) = 1 / 2 (1 / s + R \( s \)) . $ <int:B-derivative>]
  The term $1 \/ s$ is already a Stieltjes kernel, so it remains to obtain such a representation for $R$.
    We first construct the extension of $B$ using
  #[#set math.equation(numbering: n => "(3.12)")
   $ s = (frac(u, sin u))^2 \, wide B \( s \) = u cot u . $ <int:u-parametrization>]
  For $q > 0$ let $p_(*) \( q \) in \( pi \/ 2 \, pi \)$ be the unique solution of
  $ p_(*) \( q \) tan p_(*) \( q \) = - q tanh q \, $
  and put
  $ D = { p + i q : q > 0 \, med 0 < p < p_(*) \( q \) } \, wide cal(Q) = { z : "Re" z > 0 \, med "Im" z < 0 } . $
  Existence, uniqueness and continuity of $p_(*)$ follow because $p tan p$ increases strictly from $-
    oo$ to $0$ on $\( pi \/ 2 \, pi \)$: its derivative is $\( p + sin p cos p \) \/ cos^2 p > 0$.
    Thus $D$ is connected. The map $a \( u \) = sin u \/ u$ takes $D$ into $cal(Q)$, as follows from
  $ "Re" a \( p + i q \) & = frac(p sin p cosh q + q cos p sinh q, p^2 + q^2) > 0 \,\
"Im" a \( p + i q \) & = frac(p cos p sinh q - q sin p cosh q, p^2 + q^2) < 0 . $
  The first sign is precisely the boundary equation when $p > pi \/ 2$, and is immediate for $p lt.eq pi \/ 2$.
    For the second, when $p < pi \/ 2$ use $tan p \/ p > 1 > tanh q \/ q$; for $p gt.eq pi \/ 2$ the sign is immediate.
  This map is proper into $cal(Q)$. Its finite boundary pieces map to the coordinate axes:
    $p = 0$ and $q = 0$ map to the positive real axis, and $p = p_(*) \( q \)$ to the negative imaginary axis.
    The limiting corners $u = 0 \, pi$ map to $1 \, 0$, respectively. Moreover,
  $ \| a \( p + i q \) \| gt.eq frac(sinh q, sqrt(pi^2 + q^2)) arrow.r oo wide \( q arrow.r oo \) $
  uniformly for $0 lt.eq p lt.eq pi$. Thus the inverse image of a compact subset of $cal(Q)$ cannot approach the
    boundary or infinity. There are no critical points in $D$, because
  #[#set math.equation(numbering: n => "(3.13)")
   $ "Im" \( u cot u \) = frac(q sin \( 2 p \) - p sinh \( 2 q \), cosh \( 2 q \) - cos \( 2 p \)) < 0 \,
     $ <int:anti-pick-sign>]
  whereas $a' \( u \) = 0$ would imply $u cot u = 1$. The strict sign follows from $sin \( 2 p \) lt.eq
    2 p$ and $sinh \( 2 q \) > 2 q$.
  For completeness, properness and the inverse function theorem imply that $a \( D \)$ is both open and relatively
    closed in $cal(Q)$, hence is all of $cal(Q)$. Each fiber is finite,
    and local inverse neighborhoods at its points give an evenly covered neighborhood:
    an additional inverse point arbitrarily close to the chosen image point would, by properness,
    accumulate at that fiber. Thus $a$ is a covering map. A connected covering of the simply connected quadrant
    has one sheet: inverse branches continue along paths by successive evenly covered neighborhoods,
    and homotopies make the continuations independent of the path.
    Therefore $a : D arrow.r cal(Q)$ has a holomorphic inverse.
  For $"Im" s > 0$, take the branch of $s^(- 1 \/ 2)$ in $cal(Q)$ and define $u = a^(- 1) \( s^(- 1 \/ 2) \)$.
    Equations (3.12) and (3.13) give a holomorphic $B$ with $"Im" B < 0$.
    To check its continuation at $s_0 > 0$, the preceding bound on $\| a \|$ bounds $q$ as $s arrow.r
    s_0$ from above. Every cluster point of $u$ lies on $p = 0$ or $q = 0$,
    since the curved boundary has purely imaginary image. On these pieces $sinh q \/
    q$ increases strictly from $1$ to $oo$, and $sin p \/ p$ decreases strictly from $1$ to $0$ for $0 < p < pi$.
    These observations identify a unique boundary limit: $u = i q$ if $0 < s_0 < 1$, and $u =
    p in \( 0 \, pi \)$ if $s_0 > 1$. The derivatives there are nonzero,
    so local analytic inversion gives continuation across $s_0$. At $s_0 = 1$ use $u^2$ as parameter:
  $ (frac(u, sin u))^2 = 1 + u^2 / 3 + O \( u^4 \) \, wide u cot u = 1 - u^2 / 3 + O \( u^4 \) . $
  This gives $B \( 1 \) = 1$, $B' \( 1 \) = - 1$. The two real parametrizations also show that $B$ is strictly
    decreasing on $\( 0 \, oo \)$ and agrees with (3.8).
  We next recall the classical Herglotz representation [22],
    with a positive-harmonic proof in the form needed below. If $P$ is holomorphic with $"Im" P gt.eq
    0$ in the upper half-plane and extends holomorphically with real values across $\( 0 \, oo \)$, then
  #[#set math.equation(numbering: n => "(3.14)")
   $ P \( s \) = a_0 + beta s + integral_(\( - oo \, 0 \]) (frac(1, r - s) - frac(r, 1 + r^2)) d mu \( r \) \,
     wide beta gt.eq 0 \, $ <int:herglotz>]
  where $a_0 in bb(R)$, $mu gt.eq 0$ and $integral \( 1 + r^2 \)^(- 1) d mu \( r \) < oo$.
    Indeed, under $s = i \( 1 + z \) \/ \( 1 - z \)$ its imaginary part becomes a nonnegative harmonic function
    $v$ on the disk. The measures $v \( 𝜚 e^(i theta) \) d theta \/ \( 2 pi \)$ have the fixed mass $v \( 0 \)$.
    A weak limit as $𝜚 arrow.t 1$, together with the Poisson formula on each smaller disk,
    represents $v$ by a positive boundary measure. The atom at $z = 1$ contributes $beta "Im" s$;
    at the other boundary points the Poisson kernel becomes $\( 1 + r^2 \) "Im" s \/ \| r - s \|^2$.
    Incorporate the factor $1 + r^2$ into $d mu \( r \)$. The measure has no mass on the arcs corresponding to
    $r > 0$, because $v$ tends uniformly to zero on their compact subarcs, by the assumed continuation.
    The analytic integral in (3.14) converges locally uniformly; its imaginary part is the one just obtained.
    The remaining holomorphic function has zero imaginary part and is a real constant. This proves (3.14).
  Apply (3.14) to $P = - B$ and subtract the value at $1$. The function
  #[#set math.equation(numbering: n => "(3.15)")
   $ G \( s \) = frac(B \( s \) - 1, 1 - s) = beta + integral_(\( - oo \, 0 \])
     frac(d mu \( r \), \( 1 - r \) \( s - r \)) $ <int:G>]
  has a removable value $G \( 1 \) = 1$. It is positive on the positive real axis, and $H \( s \) =
    s G \( s \)$ has nonnegative imaginary part in the upper half-plane:
    this follows termwise from $beta gt.eq 0$ and $"Im" \( s \/ \( s - r \) \) gt.eq 0$ for $r lt.eq 0$.
    The function $H$ has no zero there. Otherwise the nonnegative harmonic function $"Im"
    H$ would attain zero inside, and the minimum principle would force $H$ to be a real constant;
    its positive real-axis values rule out the constant zero. Thus
  $ R \( s \) = frac(1, s G \( s \)) $
  continues the real function $R$ above holomorphically to the upper half-plane and across $\( 0 \, oo \)$,
    is positive on that interval, and satisfies $"Im" \( - R \) gt.eq 0$.
  Apply (3.14) once more, now to $- R$, with coefficients $tilde(beta) \, tilde(mu)$. For real $s > 1$ it gives
  $ 0 lt.eq R \( 1 \) - R \( s \) & = tilde(beta) \( s - 1 \) +
    integral_(\( - oo \, 0 \]) (frac(1, 1 - r) - frac(1, s - r)) d tilde(mu) \( r \)\
 & lt.eq R \( 1 \) . $
  Consequently $tilde(beta) = 0$, and monotone convergence gives $integral \( 1 - r \)^(- 1) d tilde(mu) \( r \)
    lt.eq R \( 1 \)$. We may therefore write
  #[#set math.equation(numbering: n => "(3.16)")
   $ R \( s \) = c_0 + integral_(\( - oo \, 0 \]) frac(d tilde(mu) \( r \), s - r) \, wide c_0 = R \( 1 \) -
     integral_(\( - oo \, 0 \]) frac(d tilde(mu) \( r \), 1 - r) gt.eq 0 . $ <int:R-stieltjes>]
  Initially this identity follows on the positive axis; local uniform convergence and analytic continuation give
    it in the upper half-plane as well.
  The holomorphic functions $- B'$ and $1 / 2 \( 1 \/ s + R \( s \) \)$ agree on $0 < s < 1$ by (3.11).
    The identity theorem extends their equality to the upper half-plane and the positive real axis.
    Equation (3.16), after replacing $r$ by $- r$, now proves (3.10);
    the term $1 \/ \( 2 s \)$ contributes an atom of mass $1 \/ 2$ at zero and ensures strict positivity. ◻
]

=== 3.3 The additional weight and the final minimization <the-additional-weight-and-the-final-minimization>

The lemma extends the same integral definition (3.9) continuously and positively to all $s \, t > 0$,
  including the values used in (3.7). The fundamental theorem of calculus gives

#[#set math.equation(numbering: n => "(3.17)")
 $ E =
   cases(delim: "{", frac(m \( t - s \), 2 \( B \( s \) - B \( t \) \)) \, & s eq.not t \,, - frac(m, 2 B' \(
   s \)) \, & s = t .) $ <int:E>]

Lemma 7 shows that $E$ is obtainable by the comparison-preserving operations already established.
  Indeed, after substitution of (3.10), every reciprocal term is of the form

$ frac(1, m \( theta s + \( 1 - theta \) t + r \)) = frac(1, theta \( m s \) + \( 1 - theta \) \( m t \) + r m) \, $

and the constant term is a multiple of $1 \/ m$. Positive finite quadratures followed by inversion are parallel
  sums of positive multiples of these positive linear combinations of $m \, m s \, m t$.
  Truncating the $r$-integral and refining partitions gives pointwise convergence for every $s \, t > 0$:
  on each bounded interval the integrands are continuous, and the tail is controlled by
  $integral \( 1 + r \)^(- 1) d nu \( r \) < oo$. The source finite-parameter hypothesis and target Fatou argument
  therefore prove comparison for $E$.

We complete the proof of Theorem 6 by an exact scalar minimization. For $xi \, phi.alt in bb(C)$ put

#[#set math.equation(numbering: n => "(3.18)")
 $ cal(Q) \( xi \, phi.alt \) = 1 / 4 sum_plus.minus m f \( x \) e^(plus.minus x) \| xi minus.plus phi.alt \|^2 +
   1 / 4 sum_plus.minus m f \( y \) e^(plus.minus y) \| xi plus.minus phi.alt \|^2 +
   E \| phi.alt \|^2 . $ <int:quadratic>]

Write $a = b \( x \) + b \( y \)$ and $e = E \/ m$. Since $f \( x \) e^(plus.minus x) = b \( x \) plus.minus x$,
  expansion gives

$ cal(Q) \( xi \, phi.alt \) = frac(m a, 2) \| xi \|^2 + m (a / 2 + e) \| phi.alt \|^2 -
  m \( x - y \) "Re" \( overline(xi) phi.alt \) . $

The unique minimizer and its value are

#[#set math.equation(numbering: n => "(3.19)")
 $ phi.alt = frac(x - y, a + 2 e) xi \, wide min_phi.alt cal(Q) \( xi \, phi.alt \) = m /
   2 (a - frac(\( x - y \)^2, a + 2 e)) \| xi \|^2 . $ <int:minimizer>]

If $x^2 eq.not y^2$, the identity $b \( z \)^2 = f \( z \)^2 + z^2$ and (3.17) give

$ \( a + 2 e \) \( b \( x \) - b \( y \) \) = x^2 - y^2 . $

Hence the minimum in (3.19) is

#[#set math.equation(numbering: n => "(3.20)")
 $ m frac(y b \( x \) + x b \( y \), x + y) \| xi \|^2 = m frac(f \( x \) f \( y \), f \( x + y \)) \| xi \|^2 \,
   $ <int:minimum-value>]

where the second equality is the addition formula for $sinh$, with continuous values when $x$ or $y$ is zero.

No singular minimization is hidden when $x^2 = y^2$. If $y = x$, the minimizer is $phi.alt =
  0$ and the value is $m b \( x \) \| xi \|^2 = m f \( x \)^2 \| xi \|^2 \/ f \( 2 x \)$.
  If $y = - x eq.not 0$, write $s = f \( x \)^2$ and $b = b \( x \)$. Equations (3.17) and (3.11) yield

$ e = frac(s \( b - 1 \), b - s) \, wide b + e = frac(x^2, b - s) . $

Thus (3.19) gives $m \( b - x^2 \/ \( b + e \) \) \| xi \|^2 = m s \| xi \|^2$, as required.
  At $x = y = 0$, we have $E = m \/ 2$, $phi.alt = 0$, and the value is $m \| xi \|^2$.
  This proves (3.20) in every case.

For a source test $Z$, let $Phi$ be its coordinatewise minimizer in (3.19).
  It belongs to $cal(T)$ by the invariance assumption. Apply the four assumed comparisons to $Z minus.plus
  Phi$ and $Z plus.minus Phi$, and the comparison for $E$ to $Phi$.
  After summing, the source side is $Q_(F \, 0) \( Z \)$ by (3.20), whereas the target side is

$ sum_i w_i sum_alpha cal(Q)_i #scale(x: 120%, y: 120%)[\(] \( L_i Z \)_alpha \, \( L_i Phi \)_alpha
  #scale(x: 120%, y: 120%)[\)] gt.eq sum_i w_i Q_(F \, i) \( L_i Z \) . $

This is the claimed comparison, and proves Theorem 6.

== 4 A regularized minimum and its Hessian <sec:minimization>

We argue by contradiction. This section constructs a strictly negative minimum with enough regularity to support
  the later operator identities. It then extracts an entropy-Hessian estimate at that minimum.

=== 4.1 The auxiliary ports and the functional <the-auxiliary-ports-and-the-functional>

Suppose Theorem 1 fails. The endpoint transmissions give equality, so $0 < eta < 1$.
  By Lemma 4, normalized number cutoffs of the inputs converge with bounded energies and convergent entropies,
  as do their outputs. Thus there is a fixed strictly violating pair
  $\( rho_1^(upright(w)) \, rho_2^(upright(w)) \)$ with finite number support.
  Write $a_i = g^(- 1) \( S \( rho_i^(upright(w)) \) \/ n \)$. At least one $a_i$ is positive.

Besides the two variable ports $1 \, 2$, introduce a fixed thermal port $D$, in state $rho_D =
  tau_(r_D)$ with $r_D > 0$. Its mixing weight and those of the variable inputs are

$ 0 < lambda_D < 1 \, wide lambda_1 = \( 1 - lambda_D \) eta \, wide lambda_2 = \( 1 - lambda_D \) \( 1 - eta \) . $

The retained port, denoted by $0$, has annihilators $d_(0 \, j) =
  sum_(s = 1 \, 2 \, D) sqrt(lambda_s) thin d_(s \, j)$ before reduction.
  For positive reference parameters $r_1 \, r_2$, set

$ r_0 = lambda_1 r_1 + lambda_2 r_2 + lambda_D r_D \, wide h_s = h \( r_s \) quad \( s = 0 \, 1 \, 2 \, D \) . $

Let $gamma$ be the retained state obtained from $rho_1 ⊗ rho_2 ⊗ rho_D$.
  We also replace a small fraction of that output by its reference thermal:

$ rho_0 = \( 1 - kappa \) gamma + kappa tau_(r_0) \, wide 0 < kappa < 1 \, wide
  w_i = \( 1 - kappa \) lambda_i quad \( i = 1 \, 2 \) . $

Unless otherwise indicated, sums indexed by $i$ run over $1 \, 2$.
  Since $h \( r \) = g' \( r \)$, the quotient $\( S \( rho \) - n g \( r \) \) \/
  h \( r \)$ expresses the entropy deviation in the linearized scale of total photon number at the thermal
  reference. For $epsilon \, zeta > 0$ we minimize, over input states of finite fourth moment, the functional

#[#set math.equation(numbering: n => "(4.1)")
 $ J_zeta \( rho_1 \, rho_2 \) =  & frac(S \( rho_0 \) - n g \( r_0 \), h_0) -
   sum_i w_i frac(S \( rho_i \) - n g \( r_i \), h_i)\
 & + epsilon sum_i w_i / h_i D \( rho_i bar.v.double tau_(r_i) \) + zeta sum_i "Tr" rho_i W_i^4 . $ <eq:functional>]

The normalization of the relative-entropy penalty also matches the closing stationarity calculation.
  The thermal entropy formula and (2.4) give

$ frac(D \( rho bar.v.double tau_r \), h \( r \)) = - frac(S \( rho \) - n g \( r \), h \( r \)) +
  #scale(x: 120%, y: 120%)[\(] "Tr" rho N - n r #scale(x: 120%, y: 120%)[\)] . $

Thus the input terms pair an entropy coefficient $1 + epsilon$ with an energy coefficient $epsilon$.
  Their centered-energy coefficients differ by one in stationarity,
  matching the output centered-energy relation while retaining the strict defect and mean terms.

The parameters are chosen in the following order. First choose $r_i > 0$ equal or sufficiently close to $a_i$.
  At $lambda_D = kappa = epsilon = zeta = 0$, the value at the fixed witness approaches

$ frac(S \( rho_C^(upright(w)) \) - n g \( eta a_1 + \( 1 - eta \) a_2 \), h \( eta a_1 + \( 1 - eta \) a_2 \)) < 0 . $

The input differences vanish in this limit. If $a_i = 0$, this follows from $g \( r \) \/ h \( r \) arrow.r
  0$ as $r arrow.b 0$; the output denominator has a strictly positive, finite limit.
  Fix $r_D > 0$ and then choose $lambda_D > 0$ sufficiently small to retain negativity.
  Indeed, the additional mixing can be performed after the original beam splitter; as $lambda_D arrow.b 0$,
  its unitary converges strongly on each total number sector.
  The resulting states converge in trace norm with bounded energy, and their entropies converge by Lemma 4.

Next choose $epsilon > 0$ small enough to retain negativity and to have

#[#set math.equation(numbering: n => "(4.2)")
 $ \( 1 + epsilon \) sum_i lambda_i r_i lt.eq r_0 \, wide \( 1 + epsilon \) sum_i lambda_i \( r_i + 1 \) lt.eq
   r_0 + 1 . $ <eq:slack>]

At $epsilon = 0$ the gaps are respectively $lambda_D r_D$ and $lambda_D \( r_D + 1 \)$, both positive.
  Finally take $kappa > 0$ sufficiently small. The additional bound on $kappa$ used in Section 5 depends only on
  the parameters already fixed, so it is compatible with this choice.
  The witness has finite fourth moments and finite thermal relative entropies.
  Consequently there are constants $c > 0$ and $zeta_0 > 0$ such that

#[#set math.equation(numbering: n => "(4.3)")
 $ J_zeta \( rho_1^(upright(w)) \, rho_2^(upright(w)) \) lt.eq -
   c wide \( 0 < zeta lt.eq zeta_0 \) . $ <eq:negative-witness>]

All parameters except $zeta$ remain fixed from now on.

=== 4.2 A Gibbs regularity lemma <a-gibbs-regularity-lemma>

The fourth-moment penalty yields more regularity than its definition alone suggests.
  We record the needed form argument explicitly.

#thm([Lemma 4.1.])[
  #emph[Let $W = 1 + N$ on the $n$-mode Fock space. Suppose $k > 0$ and $B$ is a bounded positive operator.
    The positive form
$ K = k W^4 + W^(1 \/ 2) B W^(1 \/ 2) \, wide cal(D) \( K^(1 \/ 2) \) = cal(D) \( W^2 \) \, $

 defines a positive self-adjoint operator with compact inverse.
   Its normalized Gibbs state $omega = e^(- K) \/ "Tr" e^(- K)$ is faithful and satisfies $"Tr" omega W^7 < oo$.
   It uniquely minimizes $"Tr" sigma K - S \( sigma \)$ among states with finite fourth moment.]
] <lem:gibbs-regularity>

#proof[
  Put $C = k I + W^(- 3 \/ 2) B W^(- 3 \/ 2)$. The form is $parallel C^(1 \/ 2) W^2 phi.alt
    parallel^2$ on $cal(D) \( W^2 \)$, and is closed because $k I lt.eq C lt.eq parallel C parallel I$. The operator
  $ U = W^(- 2) C^(- 1) W^(- 2) $
  is positive, compact, and injective. Choose a complete orthonormal eigenbasis $psi_j$ with $U psi_j =
    u_j^(- 1) psi_j$ and $u_j > 0$. Every $psi_j$ belongs to $cal(D) \( W^2 \)$ and satisfies the form eigenvalue
    equation for $K$ with eigenvalue $u_j$. For completeness,
    the vectors $sqrt(u_j) thin C^(- 1 \/ 2) W^(- 2) psi_j$ are orthonormal and complete:
    orthonormality follows from $U$, and completeness from the dense range of $C^(- 1 \/ 2) W^(- 2)$.
    Parseval’s identity therefore gives
  $ parallel C^(1 \/ 2) W^2 phi.alt parallel^2 = sum_j u_j \| chevron.l psi_j \,
    phi.alt chevron.r \|^2 wide \( phi.alt in cal(D) \( W^2 \) \) . $
  Closedness and finite spectral sums show that the domain of this diagonal form is exactly $cal(D) \( W^2 \)$.
    This constructs $K = U^(- 1)$.
  The bound $U lt.eq k^(- 1) W^(- 4)$ gives
  $ \# { j : u_j lt.eq a } lt.eq "rank" upright(bold(1))_({ W^4 lt.eq a \/ k }) \, $
  by comparing dimensions with the complementary number subspace. The right side grows polynomially in $a$.
    Also $parallel W^2 psi_j parallel^2 lt.eq u_j \/ k$. Test the form eigenvalue equation against each number
    vector and multiply that coordinate equation by $W^(- 1 \/ 2)$. It gives
  $ k W^(7 \/ 2) psi_j = u_j W^(- 1 \/ 2) psi_j - B W^(1 \/ 2) psi_j . $
  The right side is square summable, so $psi_j in cal(D) \( W^(7 \/ 2) \)$, with the explicit bound
  $ parallel W^(7 \/ 2) psi_j parallel lt.eq k^(- 1) #scale(x: 120%, y: 120%)[\(] u_j +
    parallel B parallel sqrt(u_j \/ k) #scale(x: 120%, y: 120%)[\)] . $
  Polynomial eigenvalue counting and the exponential weights $e^(- u_j)$ now prove both $0 < "Tr" e^(- K) <
    oo$ and $"Tr" \( e^(- K) W^7 \) < oo$. Finally, for a state $sigma$ with finite fourth moment, all terms in
  $ "Tr" sigma K - S \( sigma \) = D \( sigma bar.v.double omega \) - log "Tr" e^(- K) $
  are finite. Nonnegativity and the equality case of relative entropy give the asserted unique minimum. ◻
]

=== 4.3 Attainment and the exact logarithm identity <attainment-and-the-exact-logarithm-identity>

#thm([Proposition 4.2.])[
  #emph[For every $0 < zeta lt.eq zeta_0$, the functional $J_zeta$ attains a minimum of value at most $- c$.
    The input energies at these minima are bounded uniformly in $zeta$.
    At each minimum all four states $rho_s$, $s = 0 \, 1 \, 2 \, D$, are faithful, have finite seventh moment,
    and satisfy $0 lt.eq H_s := - log rho_s lt.eq C_s W_s^4$ as forms. In fact $H_0 lt.eq C W_0$.
    The inputs obey the exact identities
#[#set math.equation(numbering: n => "(4.4)")
 $ frac(\( 1 + epsilon \) w_i, h_i) H_i = frac(1 - kappa, h_0) T_i H_0 + epsilon w_i N_i + zeta W_i^4 + c_i I \,
   wide i = 1 \, 2 \, $ <eq:log-identity>]

 where $T_i$ is the output-observable slice with the other two inputs fixed, and $c_i$ is a real scalar.
   The moment and logarithm bounds need not be uniform as $zeta arrow.b 0$.]
] <prop:regularized-minimum>

#proof[
  Write $E_i = "Tr" rho_i N_i$. Expanding the thermal relative entropy expresses $J_zeta$,
    up to constants depending only on the fixed parameters, as
  #[#set math.equation(numbering: n => "(4.5)")
   $ frac(S \( rho_0 \), h_0) - sum_i frac(\( 1 + epsilon \) w_i, h_i) S \( rho_i \) + epsilon sum_i w_i E_i +
     zeta sum_i "Tr" rho_i W_i^4 . $ <eq:coercive-functional>]
  The first term is nonnegative. The bound $S \( rho_i \) lt.eq n g \( E_i \/ n \) =
    O \( log \( 1 + E_i \) \)$ shows that the positive linear energy terms dominate every negative entropy term.
    Thus bounded upper sublevels have bounded input energies, uniformly in $0 < zeta lt.eq zeta_0$.
    For fixed $zeta > 0$ their fourth moments are bounded as well.
    Take a minimizing sequence in the sublevel supplied by (4.3).
    Lemma 4 gives a trace-norm convergent subsequence of each input.
    The product and channel maps are trace-norm continuous, and output energies are bounded by the combined input
    energy plus the fixed replacement energy. Entropy is continuous along this subsequence.
    The energy and fourth-moment expectations are lower semicontinuous, by bounded spectral truncation.
    Equation (4.5) therefore gives an admissible minimum, and the same sublevel estimate gives its uniform energy bound.
  Fix such a minimum. The replacement gives $rho_0 gt.eq kappa tau_(r_0)$.
    The resolvent representation of the logarithm, together with inverse order for positive operators, implies
  $ 0 lt.eq H_0 lt.eq - log \( kappa tau_(r_0) \) lt.eq C W_0 $
  as positive forms. To define $T_i$, pull an output observable back through the passive unitary and take its
    partial expectation in the states of the other two ports.
    For bounded $Z$, this is a bounded unital positive slice satisfying
  #[#set math.equation(numbering: n => "(4.6)")
   $ "Tr" rho_i T_i Z = "Tr" gamma Z . $ <eq:slice-expectation>]
  For $H_0$, use increasing bounded spectral truncations to define the positive form $T_i H_0$.
    Since the retained number is bounded by total number before reduction, slicing $H_0 lt.eq C W_0$ yields
  $ 0 lt.eq T_i H_0 lt.eq C_i W_i . $
  In particular, its expectation is the output cross entropy for every varied input of finite energy.
  Vary only input $i$ and replace the output entropy in $J_zeta$ by the cross entropy $"Tr" tilde(rho)_0 H_0$.
    Nonnegativity of relative entropy makes the resulting functional $overline(J)_i$ a majorant,
    with equality at the chosen minimum. Thus
  $ overline(J)_i \( tilde(rho)_i \) gt.eq J_zeta \( tilde(rho)_i \) gt.eq J_zeta \( rho_i \) =
    overline(J)_i \( rho_i \) . $
  After division by its entropy coefficient $\( 1 + epsilon \) w_i \/ h_i$,
    this majorant is $"Tr" tilde(rho)_i K_i - S \( tilde(rho)_i \)$ plus a constant, where
  #[#set math.equation(numbering: n => "(4.7)")
   $ K_i = frac(h_i, \( 1 + epsilon \) w_i) (frac(1 - kappa, h_0) T_i H_0 + epsilon w_i N_i + zeta W_i^4) .
     $ <eq:gibbs-hamiltonian>]
  This is a form $k W_i^4 + R_i$ with $k > 0$ and $0 lt.eq R_i lt.eq C_i W_i$.
    Hence $R_i = W_i^(1 \/ 2) B_i W_i^(1 \/ 2)$ for a bounded positive $B_i$. Lemma 8 identifies the input uniquely as
  $ rho_i = frac(e^(- K_i), "Tr" e^(- K_i)) . $
  It is faithful, has finite seventh moment, and satisfies $H_i = K_i + log "Tr" e^(- K_i)$,
    proving (4.4) and the claimed input logarithm bounds.
  The fixed thermal port has every number moment. Total-number preservation and $\( x_1 + x_2 + x_D \)^7 lt.eq
    3^6 \( x_1^7 + x_2^7 + x_D^7 \)$ for nonnegative numbers give finite seventh moment of the raw output;
    the thermal replacement preserves this property. This proves all remaining assertions. ◻
]

=== 4.4 The component entropy-Hessian estimate <the-component-entropy-hessian-estimate>

Work at one of the minima in Proposition 9. For each label $s$, fix an eigenbasis $rho_s =
  "diag" \( p_(s \, l) \)$, with all $p_(s \, l) > 0$. These orthonormal eigenbases generally differ from the
  number bases used to define the energy, and they depend on the minimizing states.
  With $ell \( a \, b \) = \( a - b \) \/ \( log a - log b \)$ and $ell \( a \, a \) = a$, define

#[#set math.equation(numbering: n => "(4.8)")
 $ parallel Z parallel_s^2 = sum_(l \, r) h_s ell \( p_(s \, l) \, p_(s \, r) \) \| Z_(l r) \|^2 \, wide
   v_s \( l \, r \) = frac(log \( p_(s \, l) \/ p_(s \, r) \), h_s) . $ <eq:logmean-metric>]

Up to the factor $h_s$, this is the Bogoliubov inner product on observables.
  Its dual form on state perturbations is the Bogoliubov–Kubo–Mori metric,
  obtained from the Hessian of relative entropy [27,26]. We establish the needed differentiation formulas on
  finite eigenblocks and then use density; no bounded inverse for the full state is assumed.

These weighted matrix spaces are Hilbert spaces, with inner product conjugate-linear in the first variable.
  Bounded observables belong to them because the logarithmic mean is at most the arithmetic mean.
  The centered subspace is the orthogonal complement of $I$;
  the orthogonal projection subtracts $chevron.l Z chevron.r_s I$, where $chevron.l Z chevron.r_s = "Tr" rho_s Z$. Set

#[#set math.equation(numbering: n => "(4.9)")
 $ L_i Z = frac(T_i Z - chevron.l T_i Z chevron.r_i I, sqrt(lambda_i)) . $ <eq:slice-map>]

Initially the centered output tests are finite eigenblock matrices with their expectation times $I$ subtracted.
  They form a dense subspace. Such a test can have an infinite identity tail,
  but has only finitely many frequencies $v_0$. Multiplication by any function of $v_0$ preserves this class and
  its centering: every diagonal entry, including that tail, has frequency zero.

#thm([Proposition 4.3.])[
  #emph[For $i = 1 \, 2$, the slice map on the centered output space satisfies
#[#set math.equation(numbering: n => "(4.10)")
 $ parallel L_i Z parallel_i^2 lt.eq frac(1 + epsilon, 1 - kappa) thin parallel Z parallel_0^2 . $ <eq:hessian>]

 It consequently extends continuously to the completed centered spaces.
   For bounded observables this extension agrees with (4.9).]
] <prop:hessian>

#proof[
  For a single varied input of finite fourth moment, denote the resulting modified output by $tilde(rho)_0$.
    The logarithm identity (4.4) cancels all linear terms in the objective difference, giving exactly
  #[#set math.equation(numbering: n => "(4.11)")
   $ J_zeta \( tilde(rho)_i \) - J_zeta \( rho_i \) = frac(\( 1 + epsilon \) w_i, h_i)
     D \( tilde(rho)_i bar.v.double rho_i \) - 1 / h_0 D \( tilde(rho)_0 bar.v.double rho_0 \) gt.eq
     0 . $ <eq:relative-entropy-difference>]
  All cross entropies are finite by the fourth-moment assumptions and the bounds on $H_i \, H_0$.
  Let $A$ be a traceless Hermitian matrix on a finite input eigenblock.
    Then $rho_i + t A$ is a state for all sufficiently small positive and negative $t$.
    Its fourth moment is finite: each selected eigenvector has finite seventh moment by the construction in
    Lemma 8. Finite-dimensional differentiation on that block gives
  $ D \( rho_i + t A bar.v.double rho_i \) = t^2 / 2 cal(Q)_i \( A \) + o \( t^2 \) \, wide cal(Q)_i \( A \) =
    sum_(l \, r) frac(\| A_(l r) \|^2, ell \( p_(i \, l) \, p_(i \, r) \)) . $
  For example, the derivative of the logarithm is the integral of $\( rho_i + u I \)^(- 1)
    A \( rho_i + u I \)^(- 1)$ over $u > 0$ on this block.
  To extract a dual lower bound without restricting the actual output perturbation to a finite eigenblock,
    we test the Gibbs variational formula with a centered output observable.
    Let $Z$ be a Hermitian centered output test as above. The Gibbs inequality gives
  $ D \( tilde(rho)_0 bar.v.double rho_0 \) gt.eq t "Tr" tilde(rho)_0 Z - log "Tr" exp \( log rho_0 + t Z \) . $
  The logarithm of this partition function has first derivative zero and second derivative $parallel Z
    parallel_0^2 \/ h_0$ at zero. This follows from finite-block exponential differentiation:
    before centering, only a finite eigenblock changes, and centering merely multiplies the exponential by a
    scalar. Writing $Z_t = "Tr" e^(log rho_0 + t Z)$ and $sigma_t = Z_t^(- 1) e^(log rho_0 + t Z)$,
    the same block decomposition gives $0 < Z_t < oo$ and makes $sigma_t$ faithful.
    Since $- log sigma_t = H_0 - t Z + log Z_t$, the finite energy of $tilde(rho)_0$, the bound $H_0 lt.eq C W_0$,
    and boundedness of $Z$ give finite entropy and finite cross entropy against $sigma_t$.
    Lemma 3 therefore gives the displayed lower bound. Since the output perturbation induced by $t
    A$ is $\( 1 - kappa \) t$ times the raw channel perturbation, the lower bound has expansion
  $ t^2 (\( 1 - kappa \) "Tr" A T_i Z - frac(parallel Z parallel_0^2, 2 h_0)) + o \( t^2 \) . $
  Put $alpha = \( 1 + epsilon \) w_i h_0 \/ h_i$. Comparing with (4.11) yields
  #[#set math.equation(numbering: n => "(4.12)")
   $ 2 \( 1 - kappa \) "Tr" A T_i Z - alpha cal(Q)_i \( A \) lt.eq
     frac(parallel Z parallel_0^2, h_0) . $ <eq:hessian-duality>]
  We can optimize the left side over the completed traceless Hermitian space for $cal(Q)_i$.
    Indeed, trace is continuous in this norm, since
  $ \| "Tr" A \|^2 lt.eq (sum_l p_(i \, l)) sum_l frac(\| A_(l l) \|^2, p_(i \, l)) lt.eq cal(Q)_i \( A \) . $
  Finite eigenblock truncation followed by correcting the trace at one fixed diagonal entry proves density in the
    trace-zero subspace. The constrained dual of $cal(Q)_i$ is the logarithmic-mean norm of the observable after
    subtracting its $rho_i$ expectation. Thus the supremum in (4.12) equals
  $ frac(\( 1 - kappa \)^2, alpha h_i) parallel T_i Z - chevron.l T_i Z chevron.r_i I parallel_i^2 . $
  It follows that
  $ \( 1 - kappa \)^2 parallel T_i Z - chevron.l T_i Z chevron.r_i I parallel_i^2 lt.eq \( 1 + epsilon \) w_i
    parallel Z parallel_0^2 . $
  Dividing by $lambda_i$ gives (4.10). The estimate extends to complex tests by writing real and imaginary
    Hermitian parts: symmetry of the logarithmic-mean weights and preservation of adjoints make each squared norm
    the sum of the corresponding two squared norms.
  Density now gives the continuous extension. To identify it on a bounded $Z$, approximate by $P_m Z P_m$,
    where $P_m$ are increasing finite spectral projections of $rho_0$, and center each approximant.
    They converge in both output arithmetic norms and hence in the logarithmic-mean norm.
    The slice is completely positive and unital, so its Schwarz inequality bounds the corresponding input
    arithmetic norms by the raw output norms. Those in turn are at most $\( 1 - kappa \)^(- 1)$ times the modified
    output norms, because $rho_0 gt.eq \( 1 - kappa \) gamma$.
    The sliced approximants therefore converge to the bounded slice in (4.9), as required. ◻
]

== 5 The metric adapted to thermal relaxation <sec:metric>

Fix a minimizing pair from Proposition 9. All comparisons in this section concern these states.
  We use the centered observable spaces, modular frequencies $v_s$, and maps $L_i$ introduced in Section 4;
  sums over $i$ run over $1 \, 2$. For a positive scalar weight $X_s \( v_s \)$, write

$ parallel Z parallel_(X_s \, s)^2 = chevron.l Z \, X_s Z chevron.r_s . $

We say that a family of weights satisfies comparison when

#[#set math.equation(numbering: n => "(5.1)")
 $ sum_i w_i parallel L_i Z parallel_(X_i \, i)^2 lt.eq parallel Z parallel_(X_0 \, 0)^2 . $ <eq:weight-comparison>]

Initially, $Z$ is a finite eigenblock matrix centered by a scalar multiple of the identity.
  Such tests have finitely many frequencies, including zero; they need not have finite matrix support after centering.

=== 5.1 Four elementary comparisons <four-elementary-comparisons>

Define, with continuous values at zero,

$ b_s \( v \) = v / 2 coth frac(h_s v, 2) \, wide R_(s \, plus.minus) \( v \) = b_s \( v \) plus.minus v / 2 \,
  wide b_s \( 0 \) = 1 / h_s . $

If $rho_s = "diag" \( p_l \)$, then

#[#set math.equation(numbering: n => "(5.2)")
 $ h_s ell \( p_l \, p_r \) R_(s \, +) \( v_s \( l \, r \) \) = p_l \, wide
   h_s ell \( p_l \, p_r \) R_(s \, -) \( v_s \( l \, r \) \) = p_r . $ <eq:arithmetic-weights>]

Thus the corresponding squared norms of a centered observable are $"Tr" rho_s Z Z^dagger$ and $"Tr" rho_s Z^dagger Z$.

Both families $R_(+)$ and $R_(-)$ satisfy comparison. To see this,
  embed $Z$ as an observable $tilde(Z)$ on the three input ports and equip the joint observable space with either
  arithmetic inner product. The centered one-port subspaces are mutually orthogonal because the joint state is
  $rho_1 ⊗ rho_2 ⊗ rho_D$. The centered slice $T_i Z - "Tr" gamma Z thin
  I$ is the orthogonal projection onto the $i$th such subspace:
  its pairing with a bounded one-port observable is the defining partial-expectation identity.
  Consequently the sum of the two slice variances is at most the corresponding variance in $gamma$.
  The variance in $rho_0 = \( 1 - kappa \) gamma + kappa tau_(r_0)$ is at least $\( 1 - kappa \)$ times that
  variance in $gamma$. Since $w_i \/ lambda_i = 1 - kappa$,
  these statements give (5.1) for both multiplication orders. Only independence across ports has been used.

The two constant families $r_s$ and $r_s + 1$ also satisfy comparison. Indeed, Proposition 10 and (4.2) give

$ sum_i w_i r_i parallel L_i Z parallel_i^2 lt.eq \( 1 + epsilon \) sum_i lambda_i r_i parallel Z parallel_0^2
  lt.eq r_0 parallel Z parallel_0^2 \, $

and the same argument applies with $r_s + 1$.

#thm([Proposition 5.1.])[
  (Interpolated comparison).  #emph[The positive weights
#[#set math.equation(numbering: n => "(5.3)")
 $ F_s \( v \) = 1 / h_s frac(f \( h_s v \/ 2 \) f \( - h_s \/ 2 \), f \( h_s \( v - 1 \) \/ 2 \)) =
   frac(b_s \( v \) - \( r_s + 1 / 2 \) v, 1 - v) $ <eq:thermal-metric>]

 satisfy (5.1). The quotient at $v = 1$ is understood continuously.
   For each fixed $r_s > 0$ there are constants $0 < c_s lt.eq C_s < oo$, independent of the minimizing states,
   such that $c_s lt.eq F_s \( v \) lt.eq C_s$ for every $v in bb(R)$.]
] <prop:metric>

#proof[
  Apply Theorem 6 with
  $ m = 1 \/ h_s \, wide x = h_s v_s \/ 2 \, wide y = - h_s \/ 2 . $
  The ambient coordinate spaces in Theorem 6 are the full weighted matrix spaces;
    its source test space consists of the centered finite-eigenblock tests described above.
    Multipliers depending on the frequency preserve that test space,
    because every diagonal entry has frequency zero. The first two weights are $R_(s \, +) \, R_(s \, -)$;
    the other two are $r_s \, r_s + 1$. The conclusion is the first expression in (5.3).
    The second follows from the hyperbolic addition formula and $coth \( h_s \/ 2 \) = 2 r_s + 1$.
    The first expression is continuous and strictly positive, while the second gives the limits $r_s$ at $+
    oo$ and $r_s + 1$ at $- oo$. This proves both bounds. ◻
]

The thermal weight has a useful logarithmic-mean interpretation:

#[#set math.equation(numbering: n => "(5.4)")
 $ ell \( p_l \, p_r \) F_s \( v_s \( l \, r \) \) = ell #scale(x: 120%, y: 120%)[\(] r_s p_l \, \( r_s + 1 \) p_r
   #scale(x: 120%, y: 120%)[\)] . $ <eq:tilted-logmean>]

Indeed the logarithmic difference on the right is $h_s \( v_s \( l \, r \) - 1 \)$;
  substitution in (5.3) proves the identity, including its continuous values.
  Up to a fixed normalization, this is the frequency-dependent logarithmic mean used in the detailed-balance
  entropy geometry of Carlen and Maas [5] Definition 5.7 and Lemma 5.8.
  Proposition 11 establishes the particular comparison needed at our regularized minima.

Write $parallel Z parallel_(F_s) = parallel Z parallel_(F_s \, s)$,
  and let $parallel q parallel_(F_s \, *)$ denote the dual norm of a linear functional on the centered space.
  For a list of $n$ functionals, its squared norm is the sum of the $n$ squared dual norms.
  Density and Proposition 10 extend Proposition 11 to the completed centered spaces.
  On bounded observables the extension of $L_i$ is the actual centered slice.
  In fact, bounded spectral compressions of $Z$ converge strongly with their adjoints, as do their slices.
  Dominated convergence in either arithmetic norm gives convergence in the logarithmic-mean norm,
  since $ell \( a \, b \) lt.eq \( a + b \) \/ 2$. This also explains why the comparison applies to fixed
  number-basis tests later, although the minimizing eigenbases vary.

=== 5.2 The thermal defect functionals <the-thermal-defect-functionals>

Let $d_(s \, j)$ be the annihilator of mode $j$ on port $s$, and put

$ mu_s = \( "Tr" rho_s d_(s \, j) \)_(j = 1)^n \, wide d'_(s \, j) = d_(s \, j) - \( mu_s \)_j I \, wide e'_s =
  "Tr" rho_s N_s - \| mu_s \|^2 . $

For bounded $Z$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ q_(s \, j) \( Z \) = \( r_s + 1 \) "Tr" rho_s \( d'_(s \, j) \)^dagger Z -
   r_s "Tr" rho_s Z \( d'_(s \, j) \)^dagger . $ <eq:thermal-defect>]

A coherent displacement shifts $d_(s \, j)$ and $\( mu_s \)_j$ by the same constant,
  so these centered functionals also vanish on displaced thermal states.
  The final argument must control $mu_s$ separately to recover the fixed, undisplaced thermal reference.
  These are well-defined weak trace pairings and vanish on $I$.
  For example, $d rho = \( d rho^(1 \/ 2) \) rho^(1 \/ 2)$ is trace class by Hilbert–Schmidt factorization
  whenever $"Tr" rho N < oo$; the same holds for $d^dagger rho$, $rho d$, and $rho d^dagger$.
  Thus no domain invariance for an arbitrary bounded $Z$ is being assumed.

We record the summability needed for both the metric estimate and the subsequent generator calculation.

#thm([Lemma 5.2.])[
  (Dual norm and logarithmic sums).  #emph[At each minimizing state, $q_s$ has finite dual norm. Set
$ K_(s \, l r) = \( r_s + 1 \) p_r - r_s p_l . $

 Then
#[#set math.equation(numbering: n => "(5.6)")
 $ parallel q_s parallel_(F_s \, *)^2 = sum_(j \, l \, r) \( 1 - v_s \( l \, r \) \)
   K_(s \, l r) \| \( d'_(s \, j) \)_(l r) \|^2 . $ <eq:dual-norm-sum>]

 The sums obtained by replacing the coefficient on the right by $\| K_(s \, l r) \|$ or $\| v_s \( l \, r \)
   K_(s \, l r) \|$ are finite.]
] <lem:dual-finiteness>

#proof[
  Suppress the label $s$ and write $H = - log rho$. By Proposition 9, $"Tr" rho W^7 < oo$ and $0 lt.eq H lt.eq
    C W^4$ as forms. Every eigenvector $psi_r$ of $rho$ belongs to $D \( W^(7 \/ 2) \)$, since $p_r > 0$.
    Number shifts give $parallel W^2 d' psi parallel + parallel W^2 \( d' \)^dagger psi parallel lt.eq
    C' parallel W^(5 \/ 2) psi parallel$. Consequently the crossed logarithmic sums, such as
  $ sum_(l \, r) p_r \( - log p_l \) \| d'_(l r) \|^2 = sum_r p_r chevron.l d' psi_r \, H d' psi_r chevron.r \, $
  are bounded by a constant times $"Tr" rho W^5$. For the uncrossed sums, use
  $ - log p_r lt.eq C chevron.l psi_r \, W^4 psi_r chevron.r \, wide
    chevron.l W^4 chevron.r_(psi_r) chevron.l W chevron.r_(psi_r) lt.eq chevron.l W^5 chevron.r_(psi_r) . $
  The last inequality is the elementary nonnegative covariance inequality for the increasing functions $t^4 \,
    t$ of the same positive random variable. It bounds $\( - log p_r \) parallel d' psi_r
    parallel^2$ and its creation-operator analogue. The corresponding sums without logarithms are finite by finite
    energy. These bounds imply the claimed absolute summability of $K$ and $v K$.
  In matrix coordinates, (5.5) is
  $ q_j \( Z \) = sum_(l \, r) K_(l r) overline(d'_(j \, l r)) Z_(l r) . $
  By (5.2) and (5.3),
  #[#set math.equation(numbering: n => "(5.7)")
   $ frac(K_(l r), h ell \( p_l \, p_r \)) = b \( v \) - \( r + 1 / 2 \) v = \( 1 - v \) F \( v \) .
     $ <eq:defect-multiplier>]
  Hence the representing vector in the $F$ inner product is $\( 1 - v \) d'_j$,
    and its squared norm is the sum in (5.6). That sum is finite by the preceding estimates.
    Finally, $F \( 0 \) = 1 \/ h$, so orthogonality to $I$ in the $F$ inner product is exactly zero $rho$-mean.
    The representing vector is orthogonal to $I$ because $q_j \( I \) = 0$.
    Restricting to the centered space therefore does not change the dual norm. ◻
]

#thm([Lemma 5.3.])[
  (Weak convolution identity).  #emph[Let $mu_gamma = sum_i sqrt(lambda_i) mu_i$ be the raw output mean.
    For every bounded output observable $Z$,
#[#set math.equation(numbering: n => "(5.8)")
 $ q_(0 \, j) \( Z \) = sum_i w_i q_(i \, j) \( L_i Z \) +
   kappa \( 1 - kappa \) overline(\( mu_gamma \)_j) "Tr" \[ \( gamma - tau_(r_0) \) Z \] . $ <eq:defect-convolution>]

]
] <lem:weak-traces>

#proof[
  The thermal defect is zero on $tau_r$, since $\( r + 1 \) d tau_r = r tau_r d$ by its geometric number weights.
    For the raw output, define $q_(gamma \, j)$ by (5.5) using its mean and reference parameter $r_0$.
    The terms with coefficient $1$ in the identity
  $ q_(gamma \, j) \( Z \) = sum_(s = 1 \, 2 \, D) sqrt(lambda_s) thin q_(s \, j) \( T_s Z \) $
  agree by $d_(0 \, j) = sum_s sqrt(lambda_s) d_(s \, j)$. The remaining terms are expected commutators.
    After rotation, $d_(s \, j)^dagger$ is $sqrt(lambda_s) d_(0 \, j)^dagger$ plus an operator on discarded modes.
    The weak commutator of that discarded operator with a retained observable has zero trace.
    Thus its retained coefficient is $sum_s lambda_s r_s = r_0$, as required.
  These statements use only finite energy: all one-mode-factor products with the state are trace class as above.
    A discarded operator can first be cut off in its own number basis; its bounded cutoff commutes with $Z ⊗ I$,
    so trace cyclicity applies. The cutoff products converge in trace norm by the same Hilbert–Schmidt
    factorization. This justifies the weak commutator and passage between joint, reduced, and sliced traces,
    without assigning an operator domain to $\[ d_(0 \, j)^dagger \, Z \]$.
  The $D$ term vanishes. Since the mean of the replaced output is $\( 1 - kappa \) mu_gamma$, direct centering gives
  $ q_(0 \, j) = \( 1 - kappa \) q_(gamma \, j) + kappa \( 1 - kappa \) overline(\( mu_gamma \)_j)
    "Tr" \[ \( gamma - tau_(r_0) \) thin dot.op thin \] . $
  The first term is $sum_i w_i q_(i \, j) compose L_i$, since $q_(i \, j) \( I \) = 0$. ◻
]

#thm([Proposition 5.4.])[
  (Defect estimate).  #emph[Set
$ A_(*)^2 = sum_i w_i parallel q_i parallel_(F_i \, *)^2 \, wide M_(*)^2 = sum_i w_i \| mu_i \|^2 \, wide
  C_0 = \( h_0 inf_(v in bb(R)) F_0 \( v \) \)^(- 1 \/ 2) . $

 Then
#[#set math.equation(numbering: n => "(5.9)")
 $ parallel q_0 parallel_(F_0 \, *) lt.eq A_(*) + sqrt(2 kappa) thin C_0 M_(*) . $ <eq:defect-triangle>]

 In particular, the previously reserved choice of $kappa$ may be made small enough that
#[#set math.equation(numbering: n => "(5.10)")
 $ parallel q_0 parallel_(F_0 \, *)^2 lt.eq A_(*)^2 + epsilon / 2 \( A_(*)^2 + M_(*)^2 \) $ <eq:defect-estimate>]

 holds uniformly in $zeta$ and the minimizing states.]
] <prop:defect-estimate>

#proof[
  By Proposition 11 and Cauchy–Schwarz, the dual norm of the first term in (5.8), summed over the modes,
    is at most $A_(*)$. For the second term put
  $ J \( Z \) = sqrt(kappa \( 1 - kappa \)) "Tr" \[ \( gamma - tau_(r_0) \) Z \] . $
  The variance between the two branches of the mixture gives $\| J \( Z \) \|^2 lt.eq
    parallel Z parallel_(R_(0 \, +) \, 0)^2$ and $\| J \( Z \) \|^2 lt.eq
    parallel Z parallel_(R_(0 \, -) \, 0)^2$ on centered tests.
    The two-weight logarithmic-mean operation proved in Section 3.1 applies to this scalar-valued map,
    with both target weights equal to $1$. Since $ell \( R_(0 \, +) \, R_(0 \, -) \) = 1 \/ h_0$, it yields
  $ \| J \( Z \) \|^2 lt.eq parallel Z parallel_0^2 \/ h_0 lt.eq C_0^2 parallel Z parallel_(F_0)^2 . $
  Moreover, $\( 1 - kappa \) \| mu_gamma \|^2 lt.eq 2 sum_i w_i \| mu_i \|^2 = 2 M_(*)^2$.
    The triangle inequality now proves (5.9). Using Young’s inequality with coefficient $epsilon \/ 2$,
    it is enough to impose
  $ 0 < kappa lt.eq frac(epsilon^2, 4 \( epsilon + 2 \) C_0^2) $
  to obtain (5.10). The right-hand side depends only on the reference parameters and $epsilon$,
    which were fixed before $kappa$; this requirement is therefore compatible with the parameter choice in
    Proposition 9. ◻
]

== 6 Stationarity and the thermal limit <sec:stationarity>

For each label $s$, consider the thermal relaxation expression

#[#set math.equation(numbering: n => "(6.1)")
 $ delta_s = cal(L)_s rho_s \, wide cal(L)_s rho = sum_(j = 1)^n #scale(x: 120%, y: 120%)[\[] \( r_s + 1 \)
   cal(D) \[ d_(s \, j) \] rho + r_s cal(D) \[ d_(s \, j)^dagger \] rho #scale(x: 120%, y: 120%)[\]] \, wide
   cal(D) \[ d \] rho = d rho d^dagger - 1 / 2 { d^dagger d \, rho } . $ <eq:thermal-generator>]

This is the standard bosonic thermal-relaxation, or quantum Ornstein–Uhlenbeck, generator;
  its entropy production has been studied in [23,5,9]. Here we use it as a trace-class expression at the
  regularized minima. The proof requires the weighted trace identities established below,
  rather than a log-Sobolev inequality or differentiation of entropy along an unbounded semigroup.
  The geometric weights give $cal(L)_s tau_(r_s) = 0$.

=== 6.1 Weighted traces and the exact stationarity identity <weighted-traces-and-the-exact-stationarity-identity>

#thm([Lemma 6.1.])[
  (Generator covariance and logarithmic pairings).  #emph[At a minimizing pair,
    $delta_s$ is traceless and $W_s^2 delta_s W_s^2$ is trace class.
    If $Phi_i$ is the raw channel with the other two input states fixed,
    extended linearly to trace-class operators, then
#[#set math.equation(numbering: n => "(6.2)")
 $ delta_0 = \( 1 - kappa \) sum_i Phi_i \( delta_i \) . $ <eq:generator-covariance>]

 The traces against the forms $H_s$ and $W_s^4$ are well defined, and
#[#set math.equation(numbering: n => "(6.3)")
 $ "Tr" delta_0 H_0 = \( 1 - kappa \) sum_i "Tr" delta_i T_i H_0 . $ <eq:logarithmic-slicing>]

]
] <lem:generator-covariance>

#proof[
  First consider finite total-number cutoffs, where all products in the calculation are finite rank.
    This covariance calculation is linear in the joint input and applies to arbitrary finite-number-supported
    joint operators, without a product assumption. The sum over the three ports of the coefficient-$1$ terms
    $cal(D) \[ d_(s \, j) \]$ is invariant under the real orthogonal mode rotation.
    Terms acting only on discarded modes vanish under partial trace. The remaining heat expression is
  $ cal(D) \[ d \] rho + cal(D) \[ d^dagger \] rho = - 1 / 2
    #scale(x: 120%, y: 120%)[\(] \[ d \, \[ d^dagger \, rho \] \] + \[ d^dagger \, \[ d \, rho \] \]
    #scale(x: 120%, y: 120%)[\)] . $
  Writing an original mode as its retained component plus discarded components,
    every commutator involving a discarded component disappears under partial trace.
    The retained part has coefficient $lambda_s$. The resulting generator on the raw output therefore has
    parameter $sum_s lambda_s r_s = r_0$. We next justify this covariance calculation for the full input state.
  Here is a weighted trace argument extending the finite-cutoff calculation.
    Suppress a label and put $T = W^3 rho W^3$, a positive trace-class operator by the finite seventh moment.
    Each term of $W^2 cal(L) rho W^2$ is a finite sum of bounded-factor products around $T$. For example,
  $ W^2 d rho d^dagger W^2 = \( W^2 d W^(- 3) \) T \( W^(- 3) d^dagger W^2 \) \, wide
    W^2 d^dagger d rho W^2 = \( d^dagger d W^(- 1) \) T W^(- 1) . $
  The outer factors are bounded because a mode shifts number by one and has coefficients growing as the square
    root of number. The creation terms satisfy the same estimates.
    For the number cutoff $P_K$, $W^3 P_K rho P_K W^3 = P_K T P_K arrow.r T$ in trace norm.
    Hence the cutoff generator expressions converge in the $W^2$-sandwiched trace norm.
    In particular they have trace-zero limits.
  The same estimates hold on the joint input using $W_(upright("tot")) = I + N_1 + N_2 + N_D$.
    The joint input has finite seventh moment, and the rotation preserves total-number sectors.
    Partial trace is continuous in the required weighted trace norms:
    for $k = 3$ on cutoff states and $k = 2$ on generator expressions,
    insert the bounded factor $\( W_0^k ⊗ I \) W_(upright("tot"))^(- k)$, of norm at most one,
    on both sides before taking the partial trace. On the full product input the fixed thermal port has zero
    generator, as does the replacement thermal. Consequently the covariance just proved reduces to (6.2).
  The form bound $0 lt.eq H_s lt.eq C_s W_s^4$ makes $W_s^(- 2) H_s W_s^(- 2)$ bounded.
    Its pairing with $W_s^2 delta_s W_s^2$ defines the logarithmic trace; $W_s^4$ is treated the same way.
    For the slicing assertion, decompose the self-adjoint trace-class operator $W_i^2 delta_i
    W_i^2$ into its positive and negative parts and conjugate back by $W_i^(- 2)$.
    This expresses $delta_i$ as a difference of positive operators with finite fourth moment.
    The positive slicing identity for $T_i H_0$ applies to each part, proving (6.3). ◻
]

Define $sigma_s = "Tr" delta_s H_s \/ h_s$. Pair the exact Hamiltonian identity (4.4) with $delta_i$ and sum over
  $i$. The scalar terms vanish by tracelessness, and Lemma 15 gives

#[#set math.equation(numbering: n => "(6.4)")
 $ 0 = sigma_0 - \( 1 + epsilon \) sum_i w_i sigma_i + epsilon sum_i w_i "Tr" delta_i N_i +
   zeta sum_i "Tr" delta_i W_i^4 . $ <eq:stationarity>]

This is an algebraic consequence of the Gibbs identity. It requires neither that $rho_i +
  t delta_i$ remain positive for two-sided $t$, nor that entropy be differentiated along this unbounded generator.

#thm([Lemma 6.2.])[
  (Entropy production identity).  #emph[The quantities in (6.4) satisfy
#[#set math.equation(numbering: n => "(6.5)")
 $ sigma_s = parallel q_s parallel_(F_s \, *)^2 - \( e'_s - n r_s \) . $ <eq:entropy-production>]

]
] <lem:entropy-production>

#proof[
  In an eigenbasis of $rho_s$, direct evaluation of the two dissipators gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ sigma_s = - sum_(j \, l \, r) v_s \( l \, r \) #scale(x: 120%, y: 120%)[\(] \( r_s + 1 \) p_r -
     r_s p_l #scale(x: 120%, y: 120%)[\)] \| \( d'_(s \, j) \)_(l r) \|^2 . $ <eq:production-sum>]
  For example, the contribution of $cal(D) \[ d \] rho$ to the trace against $H$ is $sum_(l \, r)
    p_r \( - log p_l + log p_r \) \| d_(l r) \|^2$. The creation term is obtained by interchanging $l \, r$;
    centering $d$ changes only diagonal entries, where $v_s \( l \, l \) = 0$.
  All these expansions are legitimate. Lemma 12 controls the crossed and uncrossed logarithmic sums absolutely.
    In the anticommutator terms, $d^dagger d psi_r$ and $d d^dagger psi_r$ belong to $D \( W^2 \)$ because $psi_r
    in D \( W^(7 \/ 2) \)$. The form pairing with $H psi_r = \( - log p_r \) psi_r$ is therefore valid.
    For the eigenbasis truncations $rho^(\( m \)) = sum_(r lt.eq m) p_r \| psi_r chevron.r chevron.l psi_r \|$, we have
  $ W^3 rho^(\( m \)) W^3 = sum_(r lt.eq m) p_r \| W^3 psi_r chevron.r chevron.l W^3 psi_r \| arrow.r
    W^3 rho W^3 quad upright("in trace norm") . $
  The bounded-factor expansions in Lemma 15 therefore justify the eigenvector expansions in the required weighted
    trace norm as well.
  Subtracting (6.6) from (5.6) leaves
  $ sum_(j \, l \, r) #scale(x: 120%, y: 120%)[\(] \( r_s + 1 \) p_r -
    r_s p_l #scale(x: 120%, y: 120%)[\)] \| \( d'_(s \, j) \)_(l r) \|^2 = \( r_s + 1 \) e'_s -
    r_s \( e'_s + n \) = e'_s - n r_s \, $
  where the canonical commutation relations give the additional $n$. This proves (6.5). ◻
]

=== 6.2 Cancellation and convergence to the thermal inputs <cancellation-and-convergence-to-the-thermal-inputs>

The number shifts in (6.1) give

#[#set math.equation(numbering: n => "(6.7)")
 $ "Tr" delta_i N_i = n r_i - "Tr" rho_i N_i = - \( e'_i - n r_i \) - \| mu_i \|^2 . $ <eq:number-drift>]

They also give

#[#set math.equation(numbering: n => "(6.8)")
 $ "Tr" delta_i W_i^4 & = "Tr" rho_i P_i \( N_i \) \,\
P_i \( N_i \) & = \( r_i + 1 \) N_i #scale(x: 120%, y: 120%)[\(] \( W_i - 1 \)^4 -
  W_i^4 #scale(x: 120%, y: 120%)[\)] + r_i \( N_i + n \) #scale(x: 120%, y: 120%)[\(] \( W_i + 1 \)^4 -
  W_i^4 #scale(x: 120%, y: 120%)[\)] . $ <eq:moment-drift>]

This polynomial has leading term $- 4 N_i^4$; hence its supremum on $N_i in { 0 \, 1 \, dots.h }$ is finite.
  In particular,

#[#set math.equation(numbering: n => "(6.9)")
 $ P := sum_i "Tr" delta_i W_i^4 lt.eq C \, $ <eq:moment-drift-bound>]

with $C$ independent of $zeta$ and the minimizing states.

Independence across the input ports and $mu_D = 0$ imply

$ e'_gamma = sum_i lambda_i e'_i + lambda_D n r_D \, wide mu_gamma = sum_i sqrt(lambda_i) mu_i . $

Taking account of the two branches of the replacement gives the exact centered-energy identity

#[#set math.equation(numbering: n => "(6.10)")
 $ e'_0 - n r_0 = sum_i w_i \( e'_i - n r_i \) + kappa \( 1 - kappa \) \| mu_gamma \|^2 . $ <eq:centered-energy>]

Insert (6.5), (6.7), and (6.10) into (6.4). All centered-energy terms cancel, yielding, before discarding any term,

#[#set math.equation(numbering: n => "(6.11)")
 $ 0 = parallel q_0 parallel_(F_0 \, *)^2 - \( 1 + epsilon \) A_(*)^2 - epsilon M_(*)^2 -
   kappa \( 1 - kappa \) \| mu_gamma \|^2 + zeta P . $ <eq:exact-cancellation>]

Now Proposition 14 and (6.9) imply

#[#set math.equation(numbering: n => "(6.12)")
 $ 0 lt.eq - epsilon / 2 \( A_(*)^2 + M_(*)^2 \) + C zeta . $ <eq:vanishing-defects>]

Thus, as $zeta arrow.b 0$, both input means tend to zero and both lists of input defect functionals tend to zero
  in their dual norms.

The uniform energy bound in Proposition 9 and Lemma 4 provide a subsequence along which both inputs converge in
  trace norm, say to $hat(rho)_i$. To identify these limits,
  fix a matrix $Z$ supported on a finite block of the number basis.
  By Proposition 11 and the arithmetic bound for the logarithmic mean,
  the centered version of $Z$ has $F_i$ norm at most a fixed constant times $parallel Z parallel$,
  uniformly in the minimizing state. Hence $q_(i \, j) \( Z \) arrow.r 0$ by (6.12).
  Replacing $d'_(i \, j)$ by $d_(i \, j)$ changes this functional by $overline(\( mu_i \)_j) "Tr" rho_i Z$,
  which also tends to zero. Both $d_(i \, j)^dagger Z$ and $Z
  d_(i \, j)^dagger$ are bounded finite-rank operators for this fixed test.
  Trace-norm convergence therefore passes the uncentered trace identity to the limit, giving

#[#set math.equation(numbering: n => "(6.13)")
 $ \( r_i + 1 \) d_(i \, j) hat(rho)_i = r_i hat(rho)_i d_(i \, j) quad
   upright("as number-basis matrices, for every ") j . $ <eq:thermal-recurrence>]

No convergence of energy or of unbounded first moments is used here.

For completeness, (6.13) determines the whole $n$-mode state.
  If multi-indices $upright(bold(p)) \, upright(bold(b))$ satisfy $p_j > 0$, its matrix entries obey

$ \( r_i + 1 \) sqrt(p_j) thin \( hat(rho)_i \)_(upright(bold(p)) \, upright(bold(b))) =
  r_i sqrt(b_j)
  thin \( hat(rho)_i \)_(upright(bold(p)) - upright(bold(e))_j \, upright(bold(b)) - upright(bold(e))_j) \, $

with zero right-hand side when $b_j = 0$. If $p_j > b_j$, iteration kills the entry; if $p_j < b_j$,
  self-adjointness does the same. Thus all off-diagonal entries vanish.
  Diagonal entries have ratio $r_i \/ \( r_i + 1 \)$ whenever any one coordinate is increased by one.
  Trace one fixes the normalization, so $hat(rho)_i = tau_(r_i)$.
  This conclusion excludes internal correlations as well as off-diagonal coherences in the limit;
  no product assumption within an input was made.

The raw output now converges to $tau_(r_0)$ by continuity of the channel and Proposition 5;
  the replaced output has the same limit. Uniformly bounded energies give convergence of all three entropies by
  Lemma 4. The entropy portion of $J_zeta$ in (4.1) consequently tends to zero.
  Its relative-entropy and fourth-moment penalties are nonnegative, so

$ liminf_(zeta arrow.b 0) J_zeta gt.eq 0 $

along the selected subsequence. This contradicts the uniform strict negative upper bound for the minima.
  It is unnecessary to prove that either penalty tends to zero,
  or to send any of the other auxiliary parameters to zero.

The strict violation assumed in Section 4 is therefore impossible.
  Since the reduction there preserved every arbitrary finite-energy input pair at each fixed finite $n$,
  this proves Theorem 1 for $0 < eta < 1$. At $eta = 0$ or $1$ the retained state is the corresponding input and
  the asserted inequality is equality.

== 7 A degraded pure-loss broadcast capacity region <sec:broadcast>

Write $cal(L)_xi = cal(E)_(xi \, 0)$ for the pure-loss attenuator.
  Consider the memoryless broadcast channel with one input mode per use,
  passively split with vacuum auxiliary inputs between receivers $B \, C$ and an inaccessible loss output.
  Let $eta_B \, eta_C$ be the power transmissivities to the two receivers,
  so the marginal channels are $cal(L)_(eta_B)$ and $cal(L)_(eta_C)$. We assume

$ 0 lt.eq eta_C < eta_B \, wide eta_B + eta_C lt.eq 1 . $

For an $n$-use code, the messages $m_B in { 1 \, dots.h \, M_B }$ and $m_C in { 1 \, dots.h \,
  M_C }$ are independent and uniform. The encoder may assign to each pair an arbitrary finite-energy $n$-mode
  state $rho_(m_B \, m_C)^(\( n \))$, including states entangled across uses, subject to

#[#set math.equation(numbering: n => "(7.1)")
 $ frac(1, M_B M_C) sum_(m_B \, m_C) "Tr" #h(-0.16667em) (rho_(m_B \, m_C)^(\( n \)) sum_(j = 1)^n a_j^dagger a_j)
   lt.eq n macron(N) . $ <eq:broadcast-energy>]

Thus the photon constraint is averaged over uses and the entire codebook, not imposed separately on each codeword.
  Each receiver uses an arbitrary collective measurement on its own $n$ output modes to recover its intended
  message, with vanishing average error. The receivers do not cooperate, and there is no feedback.

#thm([Corollary 7.1.])[
  (Degraded two-receiver pure-loss broadcast capacity).  #emph[Let $0 lt.eq macron(N) < oo$, $0 lt.eq
    eta_C < eta_B$, and $eta_B + eta_C lt.eq 1$. The classical capacity region for the channel and coding model
    above, with rates in nats per use, is the closed convex hull of the nonnegative pairs $\( R_B \, R_C \)$
    satisfying, for some $0 lt.eq beta lt.eq 1$,
#[#set math.equation(numbering: n => "(7.2)")
 $ R_B & lt.eq g \( eta_B beta macron(N) \) \,\
R_C & lt.eq g \( eta_C macron(N) \) - g \( eta_C beta macron(N) \) \, $ <eq:broadcast-region>]

 where $g$ is the natural-log function in (1.1).]
] <cor:broadcast-capacity>

#proof[
  #emph[Converse.] Set $lambda = eta_C \/ eta_B in \[ 0 \, 1 \)$.
    Composition of pure-loss attenuators gives $cal(L)_(eta_C) = cal(L)_lambda compose cal(L)_(eta_B)$.
    This is a degrading channel for the receiver marginals, implemented with a new independent vacuum port;
    it does not assert independence of the physical $B$ and $C$ outputs.
  For every finite $n$ and every finite-energy $n$-mode state $sigma$, Theorem 1 with an independent vacuum port,
    equivalently Corollary 2 at $N_B = 0$, gives
  #[#set math.equation(numbering: n => "(7.3)")
   $ S #h(-0.16667em) (cal(L)_lambda^(⊗ n) \( sigma \)) gt.eq
     n g #h(-0.16667em) (lambda g^(- 1) #h(-0.16667em) (frac(S \( sigma \), n))) . $ <eq:broadcast-vacuum-bound>]
  This supplies the finite-block vacuum-port inequality required from Strong Conjecture 2 in Guha, Shapiro,
    and Erkmen’s broadcast analysis [21] Appendix A on all states needed here.
    It does not require $sigma$ to be a product across modes.
  We follow the converse of Guha, Shapiro, and Erkmen [21],
    giving the averaging and information argument for the present coding model.
    For a fixed $n$-use code, let $sigma_(m k)^Y$ be the output at receiver $Y in { B \, C }$ for messages $m =
    m_B$, $k = m_C$, and set
  $ sigma_k^Y = 1 / M_B sum_m sigma_(m k)^Y \, wide macron(sigma)^C = 1 / M_C sum_k sigma_k^C \, wide
    macron(N)_k = frac(1, n M_B) sum_m "Tr" rho_(m \, k)^(\( n \)) N . $
  The codebook constraint gives $M_C^(- 1) sum_k macron(N)_k lt.eq macron(N)$.
    For every finite-energy input, a vacuum attenuator satisfies
  $ "Tr" #scale(x: 120%, y: 120%)[\(] cal(L)_xi^(⊗ n) \( rho \) N #scale(x: 120%, y: 120%)[\)] = xi "Tr" rho N : $
  expanding each output number operator, the independent vacuum has zero number and first moments,
    so its number term and both cross terms vanish. This calculation allows arbitrary entanglement across input
    modes. Thus $sigma_k^B$ has energy $n eta_B macron(N)_k$,
    while $macron(sigma)^C$ has energy at most $n eta_C macron(N)$.
    All conditional states have finite energy and entropy, and linearity and degradation give $sigma_k^C =
    cal(L)_lambda^(⊗ n) \( sigma_k^B \)$.
  Let $p_(B \, n) \, p_(C \, n)$ be the intended-message average error probabilities, and write $R_(Y \, n) =
    n^(- 1) log M_Y$. Fano’s inequality and the Holevo bounds used in the cited converse give
  $ \( 1 - p_(B \, n) \) R_(B \, n) & lt.eq frac(1, n M_C) sum_k S \( sigma_k^B \) + frac(H_2 \( p_(B \, n) \), n) \,\
\( 1 - p_(C \, n) \) R_(C \, n) & lt.eq frac(S \( macron(sigma)^C \), n) -
  frac(1, n M_C) sum_k S \( sigma_k^C \) + frac(H_2 \( p_(C \, n) \), n) \, $
  where $H_2$ is the binary entropy. For the first bound, reveal the independent weak message as side information
    to the strong decoder and discard the nonnegative entropies of the individual output states in the conditional
    Holevo quantity. This only enlarges the information used for the upper bound;
    it does not change the decoder required by the model. The second bound is the Holevo bound for the weak message.
  Assume $macron(N) > 0$ for now, and put
  $ u_(k \, n) = frac(S \( sigma_k^B \), n) \, wide macron(u)_n = 1 / M_C sum_k u_(k \, n) . $
  The energy–entropy bound and concavity of $g$, whose second derivative is $-
    1 \/ \[ r \( 1 + r \) \]$ for $r > 0$, imply
  $ 0 lt.eq macron(u)_n lt.eq 1 / M_C sum_k g \( eta_B macron(N)_k \) lt.eq g \( eta_B macron(N) \) . $
  There is therefore a code-dependent $beta_n in \[ 0 \, 1 \]$ with $macron(u)_n =
    g \( eta_B beta_n macron(N) \)$. Set $phi.alt_lambda \( u \) = g \( lambda g^(- 1) \( u \) \)$.
    This function is convex. Indeed, for $0 < lambda < 1$ and $r > 0$, differentiation using $g$ and $h = g'$ gives
  $ phi.alt''_lambda \( g \( r \) \) =
    frac(lambda #scale(x: 120%, y: 120%)[\[] \( 1 + lambda r \) h \( lambda r \) - \( 1 + r \) h \( r \)
    #scale(x: 120%, y: 120%)[\]], r \( 1 + r \) \( 1 + lambda r \) h \( r \)^3) gt.eq 0 \, $
  because $t mapsto \( 1 + t \) h \( t \)$ has derivative $h \( t \) - 1 \/ t < 0$.
    Continuity includes $u = 0$, and $phi.alt_0 = 0$. Applying (7.3) to each conditional state and then Jensen’s
    inequality gives
  $ frac(1, n M_C) sum_k S \( sigma_k^C \) gt.eq 1 / M_C sum_k phi.alt_lambda \( u_(k \, n) \) gt.eq
    phi.alt_lambda \( macron(u)_n \) = g \( eta_C beta_n macron(N) \) . $
  Also $S \( macron(sigma)^C \) lt.eq n g \( eta_C macron(N) \)$.
    Substituting these bounds into the information inequalities yields
  $ \( 1 - p_(B \, n) \) R_(B \, n) & lt.eq g \( eta_B beta_n macron(N) \) + frac(H_2 \( p_(B \, n) \), n) \,\
\( 1 - p_(C \, n) \) R_(C \, n) & lt.eq g \( eta_C macron(N) \) - g \( eta_C beta_n macron(N) \) +
  frac(H_2 \( p_(C \, n) \), n) . $
  For any achieved rate pair, take a subsequence on which $beta_n$ converges in $\[ 0 \, 1 \]$.
    Continuity of $g$, the rate lower limits, and vanishing decoding errors give the outer bound in (7.2) with the
    limiting $beta$.
  #emph[Achievability.] We use the coherent Gaussian superposition ensemble of Guha, Shapiro,
    and Erkmen [21] Section IV. To justify its bosonic limit and the photon constraint,
    we start with the finite-alphabet superposition construction in the proof of Yard, Hayden,
    and Devetak’s Theorem 1 [33] Section II.A, expressed here in nats.
    For a finite classical input alphabet, finite-dimensional quantum outputs, and a finite law $p \( t \, x \)$,
    that construction sends a common message to both receivers and a private message to $B$ at the strict rates
  $ R_B < sum_t p \( t \) chi #scale(x: 120%, y: 120%)[\(] p \( x divides t \) \,
    omega_x^B #scale(x: 120%, y: 120%)[\)] \, wide R_C < min_(Y = B \, C) chi #scale(x: 120%, y: 120%)[\(]
    p \( t \) \, omega_t^Y #scale(x: 120%, y: 120%)[\)] \, $
  where $omega_t^Y = sum_x p \( x divides t \) omega_x^Y$ and
  $ chi \( p_j \, omega_j \) = S #h(-0.16667em) (sum_j p_j omega_j) - sum_j p_j S \( omega_j \) . $
  We use the common message as the message for $C$; receiver $B$ may discard its decoded common label.
    Degradation and data processing make the minimum in the common-message bound equal to the $C$ quantity.
  Assume first that $macron(N) > 0$ and $eta_C > 0$. Fix $0 < N' < macron(N)$ and $0 < beta < 1$.
    Let $T \, Z$ be independent centered circular complex Gaussian variables of variances $\( 1 - beta \)
    N'$ and $beta N'$, respectively. Partition the disk ${ \| z \| lt.eq
    ell }$ into finitely many sets of diameter at most $1 \/ ell$, with its complement as one further cell,
    and let $T_ell \, Z_ell$ be the corresponding conditional expectations of $T \, Z$.
    For either $X = T \, Z$ and its corresponding $X_ell$,
  $ bb(E) \| X - X_ell \|^2 lt.eq ell^(- 2) + bb(E) #h(-0.16667em)
    [\| X \|^2 upright(bold(1))_({ \| X \| > ell })] arrow.r 0 . $
  They remain centered and independent, and conditional expectation contracts second moments. Hence
  $ bb(E) \| T_ell + Z_ell \|^2 = bb(E) \| T_ell \|^2 + bb(E) \| Z_ell \|^2 lt.eq N' . $
  For a symbol $x = \( t \, z \)$ of their finite product alphabet, transmit the coherent state $\| t +
    z chevron.r$. The finite law in the coding construction is $p \( t \, \( t' \, z \) \) =
    upright(bold(1))_({ t = t' }) p_(T_ell) \( t \) p_(Z_ell) \( z \)$.
    At receiver transmissivity $xi in { eta_B \, eta_C }$, put
  $ theta_(ell \, xi) = bb(E) \| sqrt(xi) Z_ell chevron.r chevron.l sqrt(xi) Z_ell \| \, wide omega_(ell \, xi) =
    bb(E) \| sqrt(xi) \( T_ell + Z_ell \) chevron.r chevron.l sqrt(xi) \( T_ell + Z_ell \) \| . $
  Conditioned on $T_ell = t$, the receiver state is a unitary displacement of $theta_(ell \, xi)$,
    and the output for each symbol is pure. The private-message Holevo quantity at $B$ and the common-message
    Holevo quantity at $C$ are therefore
  #[#set math.equation(numbering: n => "(7.4)")
   $ S \( theta_(ell \, eta_B) \) \, wide S \( omega_(ell \, eta_C) \) -
     S \( theta_(ell \, eta_C) \) . $ <eq:broadcast-holevo>]
  The coherent-projector identity
  $ parallel \| u chevron.r chevron.l u \| - \| v chevron.r chevron.l v \| #scale(x: 120%, y: 120%)[parallel]_1 =
    2 sqrt(1 - e^(- \| u - v \|^2)) lt.eq 2 \| u - v \| $
  and Cauchy–Schwarz show that, in trace norm, $theta_(ell \, xi)$ tends to the one-mode thermal state of mean
    photon number $xi beta N'$, and $omega_(ell \, xi)$ to the one-mode thermal state of mean photon number $xi
    N'$. Their mean photon numbers are bounded by $xi beta N'$ and $xi N'$, respectively.
    Lemma 4 thus gives convergence of the quantities in (7.4) to
  $ g \( eta_B beta N' \) \, wide g \( eta_C N' \) - g \( eta_C beta N' \) . $
  For each fixed $ell$, the finitely many coherent receiver vectors span finite-dimensional spaces.
    The physical channel on these symbols is therefore exactly a finite classical-input channel with such output
    spaces. Decoding measurements on those spaces extend to Fock space without changing their action on the
    transmitted states.
  It remains to enforce (7.1) on a deterministic code. For the fixed finite alphabet let
  $ c \( x \) = \| t + z \|^2 \, wide c_t = sum_x p \( x divides t \) c \( x \) \, wide macron(c) =
    sum_t p \( t \) c_t lt.eq N' \, wide c_max = max_x c \( x \) . $
  Fix a target rate pair strictly below the two finite Holevo bounds.
    Choose the type tolerance $delta > 0$ small enough for this rate backoff and so that $macron(c) +
    delta c_max lt.eq N'' < macron(N)$ for some $N''$. The cited superposition construction supplies a sequence of
    fixed outer codes whose words have a common type $P_n$ at block length $n$, with $parallel P_n -
    p_T parallel_1 lt.eq delta$, where $p_T \( t \) = p \( t \)$.
    The random inner letters in the corresponding blocks have law $p \( x divides t \)$,
    and the complete words are obtained by permutations. With each outer code fixed,
    all expectations and probabilities below are over these inner codebooks.
    Thus the photon cost $sans(C)_n$ per use, averaged over the entire random codebook, satisfies
  $ bb(E) sans(C)_n = sum_t P_n \( t \) c_t lt.eq macron(c) + delta c_max lt.eq N'' . $
  Before its final message expurgation, the cited construction also gives a vanishing expected bound on its
    average joint decoding error over the same inner codebooks.
    Let $sans(E)_n$ be the sum of the two intended-message average errors,
    with $B$’s decoded common label discarded. Each is bounded by that joint error, so,
    after absorbing a factor of two, $bb(E) sans(E)_n lt.eq e_n$ for a positive sequence $e_n arrow.r 0$.
    We use this stage because its average-error estimate suffices for the stated criterion and its full product
    message set is the one over which $sans(C)_n$ was computed. Markov’s inequality gives
  $ Pr { sans(C)_n > macron(N) } + Pr { sans(E)_n > sqrt(e_n) } lt.eq N'' / macron(N) + sqrt(e_n) < 1 $
  for all sufficiently large $n$. Hence a deterministic code satisfies the entire-codebook photon constraint and
    has vanishing average error. It retains the full uniform independent product message set.
    Each codeword is a product of finitely many coherent symbols and has finite energy,
    and $sans(E)_n$ controls each receiver’s intended-message error.
  For $0 < beta < 1$, fix a rate pair strictly below the corresponding Gaussian pair in (7.2).
    First choose $N' < macron(N)$ close enough that its Gaussian pair still exceeds the target,
    and then choose a finite $ell$ whose Holevo pair does so.
    For this fixed alphabet choose the type tolerance and cost slack as above,
    and only then let the block length grow. Taking closure reaches the boundary and includes $beta = 0 \, 1$,
    and time sharing among codes satisfying the same photon bound gives the closed convex hull.
  If $macron(N) = 0$, every codeword is the vacuum and both rates are zero.
    If $eta_C = 0$, receiver $C$ always receives the vacuum and the region reduces to $R_C = 0$, $R_B lt.eq
    g \( eta_B macron(N) \)$, the single-receiver pure-loss capacity [18]. Both endpoints are included in (7.2). ◻
]

Corollary 17 concerns only the stated two-receiver pure-loss classical coding model.
  It gives no noisy-broadcast, amplifier, wiretap, quantum-capacity, feedback, or receiver-cooperation statement.

#heading(level: 1)[References]
#bibitem([1])[W.~N.~Anderson, Jr., and R.~J.~Duffin, #emph[Series and parallel addition of matrices],
  Journal of Mathematical Analysis and Applications #strong[26] (1969), 576--594.
  #link("https://doi.org/10.1016/0022-247X(69)90200-5")[doi:10.1016/0022-247X(69)90200-5].]
#bibitem([2])[S.~Beigi and H.~Mehrabi, #emph[Monotonicity of the von Neumann entropy under quantum convolution],
  Communications in Mathematical Physics #strong[407] (2026), article 199.
  #link("https://doi.org/10.1007/s00220-026-05703-4")[doi:10.1007/s00220-026-05703-4]\;
  #link("https://arxiv.org/abs/2504.02206v3")[arXiv:2504.02206v3].]
#bibitem([3])[S.~Beigi and S.~Rahimi-Keshari, #emph[A meta logarithmic-Sobolev inequality for phase-covariant
  Gaussian channels], Annales Henri Poincaré #strong[26] (2025), 2737--2778.
  #link("https://doi.org/10.1007/s00023-024-01487-2")[doi:10.1007/s00023-024-01487-2]\;
  #link("https://arxiv.org/abs/2311.09572v2")[arXiv:2311.09572v2].]
#bibitem([4])[N.~M.~Blachman, #emph[The convolution inequality for entropy powers],
  IEEE Transactions on Information Theory #strong[11] (1965), 267--271.
  #link("https://doi.org/10.1109/TIT.1965.1053768")[doi:10.1109/TIT.1965.1053768].]
#bibitem([5])[E.~A.~Carlen and J.~Maas, #emph[Gradient flow and entropy inequalities for quantum Markov semigroups
  with detailed balance], Journal of Functional Analysis #strong[273] (2017), 1810--1869.
  #link("https://doi.org/10.1016/j.jfa.2017.05.003")[doi:10.1016/j.jfa.2017.05.003]\;
  #link("https://arxiv.org/abs/1609.01254")[arXiv:1609.01254].]
#bibitem([6])[S.~Das, N.~Sharma, and S.~Muthukrishnan, #emph[On some special cases of the entropy photon-number
  inequality], #link("https://arxiv.org/abs/1107.2365")[arXiv:1107.2365] (2011).]
#bibitem([7])[G.~De~Palma, #emph[Gaussian optimizers and other topics in quantum information], PhD thesis,
  defended 2016; #link("https://arxiv.org/abs/1710.09395v1")[arXiv:1710.09395v1] (2017).]
#bibitem([8])[G.~De~Palma, #emph[New lower bounds to the output entropy of multi-mode quantum Gaussian channels],
  IEEE Transactions on Information Theory #strong[65] (2019), 5959--5968.
  #link("https://doi.org/10.1109/TIT.2019.2914434")[doi:10.1109/TIT.2019.2914434]\;
  #link("https://arxiv.org/abs/1805.12469v3")[arXiv:1805.12469v3].]
#bibitem([9])[G.~De~Palma and S.~Huber, #emph[The conditional entropy power inequality for quantum additive noise
  channels], Journal of Mathematical Physics #strong[59] (2018), 122201.
  #link("https://doi.org/10.1063/1.5027495")[doi:10.1063/1.5027495]\;
  #link("https://arxiv.org/abs/1803.00470")[arXiv:1803.00470].]
#bibitem([10])[G.~De~Palma, A.~Mari, and V.~Giovannetti, #emph[A generalization of the entropy power inequality to
  bosonic quantum systems], Nature Photonics #strong[8] (2014), 958--964.
  #link("https://doi.org/10.1038/nphoton.2014.252")[doi:10.1038/nphoton.2014.252]\;
  #link("https://arxiv.org/abs/1402.0404v2")[arXiv:1402.0404v2].]
#bibitem([11])[G.~De~Palma, A.~Mari, S.~Lloyd, and V.~Giovannetti,
  #emph[Multimode quantum entropy power inequality], Physical Review A #strong[91] (2015), 032320.
  #link("https://doi.org/10.1103/PhysRevA.91.032320")[doi:10.1103/PhysRevA.91.032320]\;
  #link("https://arxiv.org/abs/1408.6410v2")[arXiv:1408.6410v2].]
#bibitem([12])[G.~De~Palma and D.~Trevisan, #emph[The conditional entropy power inequality for bosonic quantum
  systems], Communications in Mathematical Physics #strong[360] (2018), 639--662.
  #link("https://doi.org/10.1007/s00220-017-3082-8")[doi:10.1007/s00220-017-3082-8]\;
  #link("https://arxiv.org/abs/1706.00440v2")[arXiv:1706.00440v2].]
#bibitem([13])[G.~De~Palma, D.~Trevisan, and V.~Giovannetti,
  #emph[Passive states optimize the output of bosonic Gaussian quantum channels],
  IEEE Transactions on Information Theory #strong[62] (2016), 2895--2906.
  #link("https://doi.org/10.1109/TIT.2016.2547426")[doi:10.1109/TIT.2016.2547426].]
#bibitem([14])[G.~De~Palma, D.~Trevisan, and V.~Giovannetti,
  #emph[Gaussian states minimize the output entropy of the one-mode quantum attenuator],
  IEEE Transactions on Information Theory #strong[63] (2017), 728--737.
  #link("https://doi.org/10.1109/TIT.2016.2621748")[doi:10.1109/TIT.2016.2621748]\;
  #link("https://arxiv.org/abs/1605.00441")[arXiv:1605.00441].]
#bibitem([15])[G.~De~Palma, D.~Trevisan, and V.~Giovannetti,
  #emph[Gaussian states minimize the output entropy of one-mode quantum Gaussian channels],
  Physical Review Letters #strong[118] (2017), 160503.
  #link("https://doi.org/10.1103/PhysRevLett.118.160503")[doi:10.1103/PhysRevLett.118.160503]\;
  #link("https://arxiv.org/abs/1610.09970v2")[arXiv:1610.09970v2].]
#bibitem([16])[G.~De~Palma, D.~Trevisan, and V.~Giovannetti,
  #emph[Multimode Gaussian optimizers for the Wehrl entropy and quantum Gaussian channels],
  #link("https://arxiv.org/abs/1705.00499")[arXiv:1705.00499] (2017).]
#bibitem([17])[V.~Giovannetti, S.~Guha, S.~Lloyd, L.~Maccone, and J.~H.~Shapiro,
  #emph[Minimum output entropy of bosonic channels: a conjecture], Physical Review A #strong[70] (2004), 032315.
  #link("https://doi.org/10.1103/PhysRevA.70.032315")[doi:10.1103/PhysRevA.70.032315].]
#bibitem([18])[V.~Giovannetti, S.~Guha, S.~Lloyd, L.~Maccone, J.~H.~Shapiro, and H.~P.~Yuen,
  #emph[Classical capacity of the lossy bosonic channel: the exact solution],
  Physical Review Letters #strong[92] (2004), 027902.
  #link("https://doi.org/10.1103/PhysRevLett.92.027902")[doi:10.1103/PhysRevLett.92.027902].]
#bibitem([19])[V.~Giovannetti, A.~S.~Holevo, and R.~García-Patrón,
  #emph[A solution of Gaussian optimizer conjecture for quantum channels],
  Communications in Mathematical Physics #strong[334] (2015), 1553--1571.
  #link("https://doi.org/10.1007/s00220-014-2150-6")[doi:10.1007/s00220-014-2150-6]\;
  #link("https://arxiv.org/abs/1312.2251v2")[arXiv:1312.2251v2].]
#bibitem([20])[S.~Guha, B.~I.~Erkmen, and J.~H.~Shapiro, #emph[The entropy photon-number inequality and its
  consequences], in 2008 Information Theory and Applications Workshop (2008), 128--130.
  #link("https://doi.org/10.1109/ITA.2008.4601037")[doi:10.1109/ITA.2008.4601037]\;
  #link("https://arxiv.org/abs/0710.5666v2")[arXiv:0710.5666v2] (2007).]
#bibitem([21])[S.~Guha, J.~H.~Shapiro, and B.~I.~Erkmen, #emph[Classical capacity of bosonic broadcast
  communication and a minimum output entropy conjecture], Physical Review A #strong[76] (2007), 032303.
  #link("https://doi.org/10.1103/PhysRevA.76.032303")[doi:10.1103/PhysRevA.76.032303].]
#bibitem([22])[G.~Herglotz, #emph[Über Potenzreihen mit positivem, reellen Teil im Einheitskreis],
  Berichte über die Verhandlungen der Königlich-Sächsischen Gesellschaft der Wissenschaften zu Leipzig,
  Mathematisch-Physische Klasse #strong[63] (1911), 501--511.]
#bibitem([23])[S.~Huber, R.~König, and A.~Vershynina, #emph[Geometric inequalities from phase space translations],
  Journal of Mathematical Physics #strong[58] (2017), 012206.
  #link("https://doi.org/10.1063/1.4974224")[doi:10.1063/1.4974224]\;
  #link("https://arxiv.org/abs/1606.08603")[arXiv:1606.08603].]
#bibitem([24])[R.~König and G.~Smith, #emph[The entropy power inequality for quantum systems],
  IEEE Transactions on Information Theory #strong[60] (2014), 1536--1548.
  #link("https://doi.org/10.1109/TIT.2014.2298436")[doi:10.1109/TIT.2014.2298436]\;
  #link("https://arxiv.org/abs/1205.3409v2")[arXiv:1205.3409v2].]
#bibitem([25])[F.~Kubo and T.~Ando, #emph[Means of positive linear operators],
  Mathematische Annalen #strong[246] (1980), 205--224.
  #link("https://doi.org/10.1007/BF01371042")[doi:10.1007/BF01371042].]
#bibitem([26])[A.~Lesniewski and M.~B.~Ruskai, #emph[Monotone Riemannian metrics and relative entropy on
  noncommutative probability spaces], Journal of Mathematical Physics #strong[40] (1999), 5702--5724.
  #link("https://doi.org/10.1063/1.533053")[doi:10.1063/1.533053]\;
  #link("https://arxiv.org/abs/math-ph/9808016")[arXiv:math-ph/9808016].]
#bibitem([27])[D.~Petz and G.~Toth, #emph[The Bogoliubov inner product in quantum statistics],
  Letters in Mathematical Physics #strong[27] (1993), 205--216.
  #link("https://doi.org/10.1007/BF00739578")[doi:10.1007/BF00739578].]
#bibitem([28])[C.~E.~Shannon, #emph[A mathematical theory of communication],
  Bell System Technical Journal #strong[27] (1948), 379--423, 623--656.
  #link("https://doi.org/10.1002/j.1538-7305.1948.tb00917.x")[doi:10.1002/j.1538-7305.1948.tb00917.x].]
#bibitem([29])[M.~E.~Shirokov, #emph[Entropy characteristics of subsets of states. I], Izvestiya:
  Mathematics #strong[70] (2006), 1265--1292.
  #link("https://doi.org/10.1070/IM2006v070n06ABEH002346")[doi:10.1070/IM2006v070n06ABEH002346]\;
  #link("https://arxiv.org/abs/quant-ph/0510073")[arXiv:quant-ph/0510073].]
#bibitem([30])[A.~J.~Stam, #emph[Some inequalities satisfied by the quantities of information of Fisher and
  Shannon], Information and Control #strong[2] (1959), 101--112.
  #link("https://doi.org/10.1016/S0019-9958(59)90348-1")[doi:10.1016/S0019-9958(59)90348-1].]
#bibitem([31])[H.~Umegaki, #emph[Conditional expectation in an operator algebra, IV (Entropy and information)],
  Kodai Mathematical Seminar Reports #strong[14] (1962), 59--85.
  #link("https://doi.org/10.2996/kmj/1138844604")[doi:10.2996/kmj/1138844604].]
#bibitem([32])[A.~Winter, #emph[Tight uniform continuity bounds for quantum entropies:
  conditional entropy, relative entropy distance and energy constraints],
  Communications in Mathematical Physics #strong[347] (2016), 291--313.
  #link("https://doi.org/10.1007/s00220-016-2609-8")[doi:10.1007/s00220-016-2609-8]\;
  #link("https://arxiv.org/abs/1507.07775v6")[arXiv:1507.07775v6].]
#bibitem([33])[J.~Yard, P.~Hayden, and I.~Devetak, #emph[Quantum broadcast channels],
  IEEE Transactions on Information Theory #strong[57] (2011), 7147--7162.
  #link("https://doi.org/10.1109/TIT.2011.2165811")[doi:10.1109/TIT.2011.2165811]\;
  #link("https://arxiv.org/abs/quant-ph/0603098v2")[arXiv:quant-ph/0603098v2].]
