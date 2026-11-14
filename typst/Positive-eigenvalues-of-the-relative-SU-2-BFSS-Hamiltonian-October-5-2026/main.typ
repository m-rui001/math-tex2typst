#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The Banks–Fischler–Shenker–Susskind (BFSS) model is supersymmetric matrix quantum mechanics obtained by reducing
  ten-dimensional supersymmetric Yang–Mills theory to one time dimension.
  Its quartic potential vanishes on commuting matrices, leaving unbounded directions of classical escape.
  For the relative $"SU" \( 2 \)$ Hamiltonian defined below,
  we prove an unbounded sequence of positive eigenvalues with square-integrable eigenvectors.
  The proof selects $"Spin" \( 9 \)$ sectors in which symmetry excludes low transverse oscillator levels,
  so the remaining oscillator energy confines those sectors.
  We first specify the operator and its physical Hilbert space.

We study the relative model, with the free center of mass removed, and use the following normalization.
  The color basis $T_a = sigma_a \/ sqrt(2)$, where $sigma_a$ are the Pauli matrices, satisfies

$ "Tr" \( T_a T_b \) = delta_(a b) \, wide \[ T_a \, T_b \] = i f_(a b c) T_c \, wide f_(a b c) =
  sqrt(2) thin epsilon_(a b c) . $

Write the nine traceless bosonic matrices as $X_i = sum_(a = 1)^3 x_i^a T_a$ and group their coefficients into

$ x = \( x^1 \, x^2 \, x^3 \) in \( bb(R)^9 \)^3 \, wide x^a = \( x_i^a \)_(i = 1)^9 \, wide \| x \|^2 =
  sum_(a = 1)^3 \| x^a \|^2 . $

An orthogonal change of color basis acts unitarily on the bosonic and fermionic variables,
  so this choice represents the $"SU" \( 2 \)$ Hamiltonian in the stated normalization.

Let $cal(F)$ be an irreducible complex Clifford module with self-adjoint generators $theta_alpha^a$, $1 lt.eq
  alpha lt.eq 16$ and $1 lt.eq a lt.eq 3$, such that

$ { theta_alpha^a \, theta_beta^b } = delta_(alpha beta) delta_(a b) . $

In particular, $cal(F)$ is finite dimensional. Fix real symmetric matrices $gamma^1 \, dots.h \,
  gamma^9$ of size $16$ with

$ { gamma^i \, gamma^j } = 2 delta_(i j) I \, wide gamma^(i j) = 1 / 2 \[ gamma^i \, gamma^j \] . $

For $h in "SU" \( 2 \)$, let $O_h in "SO" \( 3 \)$ be its adjoint action in the basis $T_a$.
  Its action on the real generator label space $bb(R)^3 ⊗ bb(R)^16$ is $O_h ⊗ I_16 in "SO" \( 48 \)$.
  Since $"SU" \( 2 \)$ is simply connected, this homomorphism lifts uniquely to $"Spin" \( 48 \)$.
  Let $V_h$ be the unitary Clifford action of that lift on $cal(F)$,
  using the normalized generators $sqrt(2) thin theta_alpha^a$. The gauge action on functions is

$ \( cal(G)_h Psi \) \( x \) = V_h Psi \( O_h^(- 1) x \) \, $

where $O_h^(- 1)$ acts on the color index of $x$. Define

$ cal(H) = #scale(x: 120%, y: 120%)[\[] L^2 \( bb(R)^27 \; cal(F) \)
  #scale(x: 120%, y: 120%)[\]]^("SU" \( 2 \)) \, wide cal(C) =
  #scale(x: 120%, y: 120%)[\[] C_c^oo \( bb(R)^27 \; cal(F) \) #scale(x: 120%, y: 120%)[\]]^("SU" \( 2 \)) . $

On $cal(C)$, put

#[#set math.equation(numbering: n => "(1.1)")
 $ Q_alpha = - i gamma_(alpha beta)^i theta_beta^a partial_(i a) + 1 /
   2 f_(a b c) x_i^b x_j^c gamma_(alpha beta)^(i j) theta_beta^a \, wide q \( Psi \) = 1 /
   16 sum_(alpha = 1)^16 lr(bar.v.double Q_alpha Psi bar.v.double)_2^2 . $ <eq:supercharges>]

Here $partial_(i a) = partial \/ partial x_i^a$, and repeated indices are summed.
  The tensors $delta_(a b)$ and $f_(a b c)$ are invariant under $O_h$, so $cal(G)_h Q_alpha cal(G)_h^(- 1) =
  Q_alpha$ on $C_c^oo \( bb(R)^27 \; cal(F) \)$. Each $Q_alpha$ is symmetric on $cal(C)$.
  Gauge averaging shows that $cal(C)$ is dense in $cal(H)$.
  Consequently the operator $Psi mapsto \( Q_1 Psi \, dots.h \, Q_16 Psi \)$ is closable:
  convergence of $Psi_n$ to zero and of each $Q_alpha Psi_n$ forces every limit to vanish by symmetry.
  Thus $q$ is closable. Let $H$ be the nonnegative self-adjoint operator associated with its closure,
  still denoted by $q$. This is the relative $"SU" \( 2 \)$ BFSS Hamiltonian considered here.

#thm([Theorem 1.1.])[
  #emph[There are an orthonormal sequence $Psi_j in "Dom" \( H \)$ and real numbers $E_j >
    0$ tending to infinity such that
$ H Psi_j = E_j Psi_j . $

 In particular, $sigma_(upright(p)) \( H \) ∩ \( 0 \, oo \)$ is infinite.]
] <thm:main>

The mechanism is visible in the quartic bosonic potential

$ V \( x \) = sum_(a < b) \| x^a and x^b \|^2 . $

It vanishes when the three spatial vectors are collinear,
  leaving an unbounded set along which confinement can fail.
  Fixing one nonzero vector $u = x^a$ separates each other vector into a component parallel to $u$ and a component
  in $u^perp$. The potential together with the transverse kinetic energy bounds a harmonic oscillator in these
  sixteen coordinates, with frequency proportional to $\| u \|$.

The symmetry determines which oscillator levels are available.
  The stabilizer of $u$ in $"Spin" \( 9 \)$ is $"Spin" \( 8 \)$.
  If a $"Spin" \( 9 \)$ representation has highest weight
  $lambda = \( lambda_1 \, lambda_2 \, lambda_3 \, lambda_4 \)$,
  every constituent of its restriction to this stabilizer has highest weight $nu$ with $nu_1 gt.eq lambda_2$.
  If $n$ is the oscillator level and $M$ is a fixed bound for the contribution from the fermions,
  a stabilizer type $nu$ shared by this restriction and level $n$ tensored with the fermions must satisfy

$ lambda_2 lt.eq nu_1 lt.eq n + M . $

A large $lambda_2$ therefore removes low levels. This is why the second coordinate matters:
  the first coordinate alone does not impose this restriction on stabilizer types.

The resulting oscillator energy grows linearly in $\| u \|$.
  Squaring the supercharges also produces a fermionic multiplication term that is linear in $x$ and may be
  negative. By excluding sufficiently many oscillator levels, the positive linear coefficient dominates this term.
  Averaging the three choices of color then gives a form bound that confines the full variable $x$ within the
  chosen rotation sector. For every sector above a fixed threshold for $lambda_2$,
  the restricted Hamiltonian consequently has compact resolvent and trivial kernel.
  Explicit gauge-invariant polynomials show that infinitely many such physical sectors are infinite dimensional;
  any one of them supplies the unbounded sequence of positive eigenvalues.

The spectral history makes the distinction between the spectral set and normalizable eigenstates essential.
  For the finite matrix Hamiltonians they studied, de Wit, Lüscher,
  and Nicolai proved that the spectral set is $\[ 0 \, oo \)$ and explicitly left open the possibility of
  normalizable eigenstates within that interval [6] Section 1.
  In their discussion of relative motion after removing the free center of mass, Banks, Fischler, Shenker,
  and Susskind stated that, besides the zero-energy threshold states,
  “No other normalizable bound states can occur”  [2] Section 5, after Equation (5.4).
  Theorem 1 refutes this exclusion for the exact relative operator defined here at $N = 2$;
  the large-$N$ Matrix Theory conjecture is a separate question.

Positive-energy binding had appeared in a qualified form in the work of Danielsson, Ferretti, and Sundborg.
  They obtained normalizable excited wavefunctions in a Born–Oppenheimer approximation to the same relative
  $"SU" \( 2 \)$ model, anticipated decay beyond the approximation,
  and described the states as metastable [4] Sections 3.3 and 4–5.
  Smilga later conjectured families of normalized excited states in a large-$N$ thermodynamic analysis [10]
  Section 3. Sethi and Stern’s rotational invariance theorem concerns normalizable zero-energy states [8]
  Sections 3.2 and 4.2, whereas the eigenvalues proved to exist here are positive.

Transverse quantization has classical scalar precedents in Simon’s $x^2
  y^2$ oscillator argument [9] Section 2 and Lüscher’s estimates for bosonic Yang–Mills Hamiltonians [7]
  Appendix D. Davies and Simon used parity to remove the transverse constant mode of a symmetric Neumann horn and
  obtain a reducing sector with compact resolvent [5] Theorem 3.1 and Step 7.
  In a supersymmetric matrix model with two spatial matrices and $"SU" \( 2 \) times "SO" \( 2 \)$ symmetry,
  Aref’eva, Koshelev, and Medvedev decomposed the problem into angular sectors and used a Born–Oppenheimer
  analysis to argue for sectors with purely discrete spectrum,
  deriving asymptotic spectral formulas [1] Sections 5–6. Here the decisive model-specific step is to use
  orthogonal branching and the finite fermionic weight set to exclude any prescribed finite number of transverse
  oscillator levels. More generally, restriction to the stabilizer of an escape direction can identify symmetry
  sectors in which transverse excitation restores confinement.

== 2 The quadratic form and rotations <sec:form>

We first isolate the scalar potential and the fermionic term.
  We then show that rotation types reduce the closed form and its associated operator.
  All differential computations in this section take place on compactly supported smooth functions.

#thm([Lemma 2.1.])[
  #emph[For $Psi in cal(C)$,
#[#set math.equation(numbering: n => "(2.1)")
 $ q \( Psi \) = 1 / 2 lr(bar.v.double nabla Psi bar.v.double)_2^2 +
   integral_(bb(R)^27) V \( x \) lr(bar.v.double Psi \( x \) bar.v.double)^2 thin d x +
   integral_(bb(R)^27) chevron.l Psi \( x \) \, B \( x \) Psi \( x \) chevron.r thin d x \, $ <eq:form>]

 where
#[#set math.equation(numbering: n => "(2.2)")
 $ V \( x \) = sum_(a < b) \| x^a and x^b \|^2 \, wide B \( x \) = i /
   2 f_(a b c) x_i^a gamma_(beta delta)^i theta_beta^b theta_delta^c . $ <eq:potential>]

 The matrix $B \( x \)$ is Hermitian. There is a constant $C < oo$ such that
#[#set math.equation(numbering: n => "(2.3)")
 $ lr(bar.v.double B \( x \) bar.v.double)_(upright("op")) lt.eq
   C \| x \| wide \( x in bb(R)^27 \) . $ <eq:fermion-bound>]

]
] <lem:form>

#proof[
  The calculation also holds on $C_c^oo \( bb(R)^27 \; cal(F) \)$ before taking gauge invariants. Put
  $ y_(i j)^a = f_(a b c) x_i^b x_j^c \, wide A_alpha = - i gamma_(alpha beta)^i theta_beta^a partial_(i a) \,
    wide W_alpha = sum_(j < k \, c) y_(j k)^c gamma_(alpha delta)^(j k) theta_delta^c . $
  The antisymmetry in $j \, k$ makes $Q_alpha = A_alpha + W_alpha$. The gamma relations give
  $ "tr" \( \( gamma^i \)^T gamma^j \) = 16 delta_(i j) \, wide "tr" \( \( gamma^(i j) \)^T gamma^(k l) \) =
    16 delta_(i k) delta_(j l) quad \( i < j \, med k < l \) . $
  Indeed, each indicated matrix has squared Hilbert–Schmidt norm $16$,
    and a product of two or four distinct gamma matrices has trace zero:
    conjugation by one of its factors changes its sign. Clifford anticommutation, followed by these identities,
    gives on the smooth core
  $ 1 / 16 sum_alpha A_alpha^2 = - 1 / 2 Delta \, wide 1 / 16 sum_alpha W_alpha^2 = 1 /
    2 sum_(a \, j < k) \( y_(j k)^a \)^2 I . $
  For the latter identity, the coefficients $y_(j k)^a$ commute,
    so the two orders of each Clifford product combine into an anticommutator.
    Since $f_(a b c) = sqrt(2) thin epsilon_(a b c)$, the last scalar is $sum_(a < b) \| x^a and x^b \|^2$.
  In the cross term, the first-order part is
  $ - i / 16 sum_(i \, a \, j < k) y_(j k)^a "tr" \( \( gamma^i \)^T gamma^(j k) \) partial_(i a) = 0 \, $
  because $gamma^i$ is symmetric and $gamma^(j k)$ is skew-symmetric. The remaining multiplication operator is
  $ - i / 16 sum_(i \, a \, beta \, delta\
j < k \, c) \( partial_(i a) y_(j k)^c \) \( gamma^i gamma^(j k) \)_(beta delta) theta_beta^a theta_delta^c . $
  Here
  $ partial_(i a) y_(j k)^c = f_(c a b) delta_(i j) x_k^b + f_(c b a) x_j^b delta_(i k) \, wide
    gamma^j gamma^(j k) = gamma^k \, quad gamma^k gamma^(j k) = - gamma^j . $
  Each spatial index occurs in eight pairs $j < k$. Substitution gives
  $ - i / 2 f_(c a b) x_i^b gamma_(beta delta)^i theta_beta^a theta_delta^c = i /
    2 f_(a b c) x_i^a gamma_(beta delta)^i theta_beta^b theta_delta^c \, $
  where the last equality uses antisymmetry of $f$ and relabels the indices.
    Integration by parts now proves (2.1) on $cal(C)$.
  Whenever $f_(a b c) eq.not 0$, the generators $theta_beta^b$ and $theta_delta^c$ anticommute.
    Their product is anti-Hermitian, so the displayed $B$ is Hermitian.
    It is a linear function of $x$ with coefficients in the finite-dimensional space $"End" \( cal(F) \)$.
    This proves (2.3). ◻
]

Let $G = "Spin" \( 9 \)$, and write $R_g in "SO" \( 9 \)$ for the vector representation.
  Clifford multiplication gives a real orthogonal spin representation $S_g$ on $bb(R)^16$ satisfying

#[#set math.equation(numbering: n => "(2.4)")
 $ S_g gamma \( v \) S_g^(- 1) = gamma \( R_g v \) \, wide gamma \( v \) = v_i gamma^i . $ <eq:gamma-covariance>]

For $w in bb(R)^16$, write $theta^a \( w \) = w_alpha theta_alpha^a$.

#thm([Lemma 2.2.])[
  #emph[There is a unitary representation $U$ of $G$ on $cal(F)$ such that
$ U_g theta^a \( w \) U_g^(- 1) = theta^a \( S_g w \) . $

 It commutes with the gauge action. The representation
#[#set math.equation(numbering: n => "(2.5)")
 $ \( D_g Psi \) \( x \) = U_g Psi \( R_g^(- 1) x \) $ <eq:rotation-action>]

 on $cal(H)$ preserves $cal(C)$ and the closed form $q$.]
  #emph[For an irreducible $G$ representation of type $lambda$,
    let $cal(H)_lambda$ be its isotypic subspace and $P_lambda$ the orthogonal projection onto that subspace.
    Then $P_lambda cal(C)$ is a form core for $q$ on $cal(H)_lambda$, and $cal(H)_lambda$ reduces $H$.
    The operator associated with the restricted form is the part $H_lambda = H \|_("Dom" \( H \) ∩ cal(H)_lambda)$.]
] <lem:rotations>

#proof[
  The action $S_g$ on each of the three color copies gives a homomorphism $G arrow.r "SO" \( 48 \)$.
    Since $G$ is simply connected, it lifts to $"Spin" \( 48 \)$.
    Acting on $cal(F)$ by the normalized Clifford generators $sqrt(2) thin
    theta_alpha^a$ gives $U$ with the stated property.
  The actions of $G$ and $"SU" \( 2 \)$ on the generator labels commute.
    Their unitary commutator on $cal(F)$ therefore commutes with every Clifford generator and is scalar by
    irreducibility. For fixed $g in G$ this scalar, as a function of the gauge transformation,
    is a continuous character of $"SU" \( 2 \)$. Such a character is trivial.
    Thus the actions commute on $cal(F)$, and (2.5) preserves $cal(H)$.
  The pullback in (2.5) sends the coordinate and derivative vectors to their $R_g^(- 1)$ transforms.
    The column of Clifford generators transforms by $S_g^(- 1)$.
    Applying (2.4), and its consequence for $gamma^(i j)$, to the two terms in (1.1) gives
  $ D_g Q_alpha D_g^(- 1) = \( S_g^(- 1) \)_(alpha beta) Q_beta quad upright("on ") cal(C) . $
  The orthogonality of $S_g$ proves $q \( D_g Psi \) = q \( Psi \)$.
    Rotations preserve smoothness, and the rotated supports of a compact set lie in a common ball,
    so $D_g cal(C) = cal(C)$.
  The action is strongly continuous for the form norm $lr(bar.v.double Psi bar.v.double)_q^2 =
    lr(bar.v.double Psi bar.v.double)_2^2 + q \( Psi \)$. On $cal(C)$ this follows directly from smoothness,
    (1.1), and compact support; it extends to the closure because every $D_g$ is a form-norm isometry.
    For normalized Haar measure and the irreducible character $chi_lambda$,
  $ P_lambda = \( dim V_lambda \) integral_G overline(chi_lambda \( g \)) D_g thin d g . $
  This integral is bounded in form norm. Differentiation under the integral and the common support bound show that
    it maps $cal(C)$ into $cal(C)$. If $Psi in "Dom" \( q \) ∩ cal(H)_lambda$,
    project any core approximation to $Psi$ to obtain a form-norm approximation in $P_lambda cal(C)$.
    This proves the core assertion.
  Invariance of the closed form implies that its resolvent commutes with every $D_g$:
    this follows, for example, from uniqueness of the solution of
  $ q \( u \, v \) + chevron.l u \, v chevron.r = chevron.l f \, v chevron.r wide \( v in "Dom" \( q \) \) $
  defining $u = \( H + 1 \)^(- 1) f$, where $q \( u \, v \)$ denotes the polarization of $q$.
    The resolvent therefore commutes with $P_lambda$. This proves reduction and identifies the restricted operator
    with the stated part of $H$. ◻
]

== 3 Transverse confinement in large rotation types <sec:confinement>

Fix a color $a$, a vector $u in bb(R)^9 \\ { 0 }$, and two real numbers $s_b$ for $b eq.not a$.
  Put $hat(u) = u \/ \| u \|$. For $z = \( z_b \)_(b eq.not a) in \( u^perp \)^2$,
  define $x \( u \, s \, z \)$ by its color components:

#[#set math.equation(numbering: n => "(3.1)")
 $ x \( u \, s \, z \)^a = u \, wide x \( u \, s \, z \)^b = s_b hat(u) + z_b quad \( b eq.not a \) . $ <eq:slice>]

The transverse space $\( u^perp \)^2$ has dimension sixteen. On this slice, the potential satisfies

#[#set math.equation(numbering: n => "(3.2)")
 $ V \( x \( u \, s \, z \) \) gt.eq sum_(b eq.not a) \| u and x \( u \, s \, z \)^b \|^2 = \| u \|^2 \| z \|^2 \,
   wide \| z \|^2 = sum_(b eq.not a) \| z_b \|^2 . $ <eq:slice-potential>]

The subgroup $K_u subset G = "Spin" \( 9 \)$ fixing $u$ acts on the transverse pair and is conjugate to
  $"Spin" \( 8 \)$. We will compare the $K_u$ types on a slice with those in each transverse oscillator level.
  The needed lower bound on slice weights comes from restricting a $G$ type to this stabilizer.

First use the reference stabilizer $K = "Stab"_G \( e_9 \) tilde.eq "Spin" \( 8 \)$.
  Choose weight coordinates $epsilon.alt_1 \, dots.h \, epsilon.alt_4$ for rotations in four orthogonal planes in
  $bb(R)^8 = e_9^perp$. The positive roots of $K$ are $epsilon.alt_j plus.minus epsilon.alt_l$ for $j < l$;
  those of $G$ include these and the $epsilon.alt_j$. Dominant weights have the forms

$ lambda_1 gt.eq lambda_2 gt.eq lambda_3 gt.eq lambda_4 gt.eq 0 quad \( G \) \, wide nu_1 gt.eq nu_2 gt.eq
  nu_3 gt.eq \| nu_4 \| quad \( K \) \, $

with coordinates all integral or all half-integral in each weight.

#thm([Lemma 3.1.])[
  (Orthogonal restriction).  #emph[If the $K$ type of highest weight $nu$ occurs in the restriction of the $G$
    type of highest weight $lambda$, then
#[#set math.equation(numbering: n => "(3.3)")
 $ nu_1 gt.eq lambda_2 . $ <eq:branching>]

]
] <lem:branching>

#proof[
  This is the part of the classical orthogonal interlacing rule needed here; compare [3] Proposition 3.7.
    We give a character proof that includes the half-integral cases.
  Use formal torus monomials $Z^w$, allowing half-integral exponents, and write $Delta_G \,
    Delta_K$ for the Weyl denominators. The half-sums of positive roots are
  $ rho_K = \( 3 \, 2 \, 1 \, 0 \) \, wide rho_G = rho_K + \( 1 / 2 \, 1 / 2 \, 1 / 2 \, 1 / 2 \) . $
  Thus $Delta_G = Delta_K product_i \( Z_i^(1 \/ 2) - Z_i^(- 1 \/ 2) \)$. Set $L_j = lambda_j + 4 - j$.
    The Weyl character formula for type $B_4$ gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ chi_lambda Delta_K =
     det (frac(Z_i^(L_j + 1 \/ 2) - Z_i^(- L_j - 1 \/ 2), Z_i^(1 \/ 2) - Z_i^(- 1 \/ 2)))_(i \, j = 1)^4 =
     det (sum_(s = - L_j)^(L_j) Z_i^s)_(i \, j = 1)^4 \, $ <eq:branch-character>]
  where $s$ increases in steps of one.
  Let $m_eta$ be the multiplicity of the $K$ type $eta$ in the restriction,
    and let $W_K$ be the Weyl group of $K$. The Weyl character formula for $K$ gives the second expression
  $ chi_lambda Delta_K = sum_eta m_eta sum_(w in W_K) det \( w \) thin Z^(w \( eta + rho_K \)) . $
  Put $t = nu + rho_K$. Its coordinates satisfy $t_1 > t_2 > t_3 > \| t_4 \|$,
    so $t$ is regular dominant for type $D_4$, including when $t_4 = 0$.
    The coefficient of $Z^t$ in this expression is therefore $m_nu$:
    only $eta = nu$ and the identity Weyl element contribute.
    In the determinant in (3.4), row $i$ involves only $Z_i$, so coefficient extraction acts row by row.
    If the coordinate lattices of $lambda$ and $nu$ differ, the coefficient is zero. Otherwise it is
  $ det #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ \| t_i \| lt.eq L_j })
    #scale(x: 120%, y: 120%)[\)]_(i \, j = 1)^4 . $
  The $L_j$ strictly decrease, and so do the $\| t_i \|$. Each row is an initial string of ones followed by zeros,
    and the string lengths are nondecreasing down the rows. A nonzero determinant has neither a zero row nor two
    equal rows, so these four lengths must be $1 \, 2 \, 3 \, 4$.
    In particular, $t_1 > L_2$, or $nu_1 > lambda_2 - 1$. The difference $nu_1 -
    lambda_2$ is integral because the lattices agree. Hence $nu_1 gt.eq lambda_2$. ◻
]

For each $u$, choose a rotation carrying $e_9$ to $hat(u)$.
  It conjugates $K$ to $K_u$; transport the torus and positive roots by this conjugation.
  Lemma 4 then holds for $K_u$ in the transported weight coordinates.

#thm([Lemma 3.2.])[
  (Types on a transverse slice).  #emph[Let $Psi in cal(C) ∩ cal(H)_lambda$.
    For the fixed parameters in (3.1), the function
$ Phi \( z \) = Psi \( x \( u \, s \, z \) \) $

 belongs, as a vector in $L^2 \( \( u^perp \)^2 \; cal(F) \)$,
   only to $K_u$ types whose highest weights satisfy $nu_1 gt.eq lambda_2$.
   The $K_u$ action here rotates $z$ and acts by $U$ on $cal(F)$.]
] <lem:slice>

#proof[
  To restrict at fixed parameters, we first use the finite-dimensional span of the smooth translates of $Psi$.
    The isotypic representation has the form $cal(H)_lambda tilde.eq V_lambda hat(⊗) cal(M)_lambda$,
    where $cal(M)_lambda$ is a multiplicity Hilbert space. Writing $d = dim V_lambda$,
    any individual vector has an expansion $sum_(j = 1)^d e_j ⊗ m_j$.
    Its span under $G$ is contained in $V_lambda ⊗ "span" { m_1 \, dots.h \,
    m_d }$ and is therefore finite dimensional. Apply this to $Psi$, and denote its translate span by $W_Psi$.
  Every vector in $W_Psi$ has a smooth compactly supported representative,
    because it is a finite linear combination of translates of $Psi$.
    An equality between these representatives in $L^2$ holds pointwise by continuity.
    Thus restriction at the fixed $u \, s_b$ is a well-defined linear map from $W_Psi$ to
    $C_c^oo \( \( u^perp \)^2 \; cal(F) \)$. It intertwines $K_u$,
    which fixes $u$ and the longitudinal coordinates $s_b$. Its image can have only types occurring in
    $W_Psi \|_(K_u)$. Lemma 4 gives the claimed bound. The $K_u$ action on the fiber $L^2$ space is unitary,
    so distinct isotypic subspaces there are orthogonal. ◻
]

Choose $M gt.eq 0$ so that the first coordinate of every $K$ weight of $cal(F)$ is at most $M$.
  Such an $M$ exists because $cal(F)$ is finite dimensional.
  The same bound holds for $K_u$ in the transported coordinates.

The factor $1 \/ 4$ in the next estimate uses half of the kinetic term in (2.1);
  the remaining quarter will provide the local $H^1$ bound needed for compactness.

#thm([Lemma 3.3.])[
  (Transverse oscillator bound).  #emph[Let $m gt.eq 0$ be an integer and suppose
#[#set math.equation(numbering: n => "(3.5)")
 $ lambda_2 > m + M . $ <eq:large-weight>]

 For every slice $Phi$ in Lemma 5,
#[#set math.equation(numbering: n => "(3.6)")
 $ integral_(\( u^perp \)^2) (1 / 4 \| nabla_z Phi \|^2 + \| u \|^2 \| z \|^2 lr(bar.v.double Phi bar.v.double)^2)
   thin d z med gt.eq med \( m + 9 \) \| u \| integral_(\( u^perp \)^2) lr(bar.v.double Phi bar.v.double)^2 thin d
   z . $ <eq:fiber-oscillator>]

]
] <lem:oscillator>

#proof[
  For $r = \| u \| > 0$, the oscillator
  $ h_r = - 1 / 4 Delta_z + r^2 \| z \|^2 $
  has energies $r \( n + 8 \)$, $n = 0 \, 1 \, dots.h$. Indeed, the change of variables $xi =
    sqrt(2 r) thin z$ gives $h_r = r / 2 \( - Delta_xi + \| xi \|^2 \)$ in sixteen dimensions.
    Each vector at level $n$ is an invariant Gaussian times a polynomial of total degree at most $n$.
    Tensor this level with $cal(F)$.
  The transverse coordinates are two copies of the vector representation of $K_u$,
    whose weights are $plus.minus epsilon.alt_1 \, dots.h \, plus.minus epsilon.alt_4$.
    Every weight in a polynomial of degree at most $n$ has first coordinate at most $n$,
    and every weight in the level tensored with $cal(F)$ consequently has first coordinate at most $n + M$.
    In particular, the first coordinate of the highest weight of any constituent is at most $n + M$.
  Let $Pi_n$ be the projection onto level $n$ tensored with $cal(F)$.
    It commutes with $K_u$ and hence with every $K_u$-isotypic projection on the fiber $L^2$ space.
    By Lemma 5, $Pi_n Phi$ can therefore contain only types with $nu_1 gt.eq lambda_2$.
    Since it lies in level $n$ tensored with $cal(F)$, its types also satisfy $nu_1 lt.eq n + M$.
    For $n lt.eq m$ these bounds are incompatible by (3.5), so $Pi_n Phi = 0$.
    Expanding in the complete Hermite basis, the least remaining energy is $r \( m + 9 \)$, which proves (3.6). ◻
]

#thm([Proposition 3.4.])[
  (Confinement in a rotation sector).  #emph[Let $C$ be as in (2.3), and choose an integer $m gt.eq
    0$ such that $c_m = \( m + 9 \) \/ 3 - C > 0$. If $lambda_2 > m + M$,
    every $Psi in "Dom" \( q \) ∩ cal(H)_lambda$ belongs to $H^1 \( bb(R)^27 \; cal(F) \)$,
    satisfies $\| x \|^(1 \/ 2) Psi in L^2 \( bb(R)^27 \; cal(F) \)$, and obeys
#[#set math.equation(numbering: n => "(3.7)")
 $ q \( Psi \) med gt.eq med 1 / 4 lr(bar.v.double nabla Psi bar.v.double)_2^2 +
   c_m integral_(bb(R)^27) \| x \| lr(bar.v.double Psi \( x \) bar.v.double)^2 thin d x . $ <eq:confinement>]

 The operator $H_lambda$ has compact resolvent and $ker H_lambda = { 0 }$.]
] <prop:confinement>

#proof[
  First take $Psi in cal(C) ∩ cal(H)_lambda$ and fix a color $a$.
    For fixed $u$, the decomposition of the two other color variables into $s_b \,
    z_b$ is an orthogonal linear change of variables with unit Jacobian.
    The transverse gradient uses only derivatives in those two variables,
    so $\| nabla_z Phi \|^2 lt.eq \| nabla Psi \|^2$. No derivative of the decomposition with respect to $u$ is
    taken. Fubini’s theorem, using local orthogonal frames for $u^perp$, therefore applies to (3.6); the set $u =
    0$ has measure zero. Together with (3.2), it gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ 1 / 4 lr(bar.v.double nabla Psi bar.v.double)_2^2 + integral V \( x \)
     lr(bar.v.double Psi \( x \) bar.v.double)^2 thin d x med gt.eq
     med \( m + 9 \) integral \| x^a \| lr(bar.v.double Psi \( x \) bar.v.double)^2 thin d x . $ <eq:one-color>]
  Average (3.8) over the three colors; its left side is unchanged.
    Splitting the kinetic term in (2.1) into two quarters and using (2.3) then gives
  $ q \( Psi \) gt.eq 1 / 4 lr(bar.v.double nabla Psi bar.v.double)_2^2 +
    integral_(bb(R)^27) (frac(m + 9, 3) sum_a \| x^a \| - C \| x \|) lr(bar.v.double Psi \( x \) bar.v.double)^2
    thin d x . $
  Since $sum_a \| x^a \| gt.eq \| x \|$, this proves (3.7) on the core.
  We now pass to the restricted form domain. By Lemma 3, any vector in that domain is a form-norm limit of vectors
    in $cal(C) ∩ cal(H)_lambda$. Applied to differences of these vectors,
    (3.7) shows convergence of their gradients in $L^2$ and of their products with $\| x \|^(1 \/ 2)$ in $L^2$.
    The gradient and multiplication by $\| x \|^(1 \/ 2)$ are closed operators.
    Their limits are therefore the gradient and weighted product of the form limit.
    Passing to the limit proves (3.7) on the full restricted form domain.
  Its form-norm unit ball is bounded in $H^1 \( bb(R)^27 \; cal(F) \)$.
    Moreover, for $R > 0$, (3.7) gives the uniform tail estimate
  $ integral_(\| x \| > R) lr(bar.v.double Psi \( x \) bar.v.double)^2 thin d x lt.eq frac(q \( Psi \), c_m R) . $
  Rellich compactness on bounded balls applies componentwise in the finite-dimensional space $cal(F)$.
    A diagonal subsequence and the tail estimate give compactness in $L^2 \( bb(R)^27 \; cal(F) \)$.
    Hence the inclusion of the restricted form domain into $cal(H)_lambda$ is compact.
    The resolvent $\( H_lambda + 1 \)^(- 1)$ maps the Hilbert space boundedly into that form domain, so it is compact.
  If $Psi in ker H_lambda$, then $q \( Psi \) = 0$. The positive weighted term in (3.7) vanishes, forcing $Psi =
    0$ because $\| x \| > 0$ almost everywhere. This proves the kernel assertion. ◻
]

== 4 Physical rotation sectors and positive eigenvalues <sec:sectors>

It remains to produce an infinite-dimensional physical sector meeting (3.5).
  We first obtain a gauge-invariant fermionic vector, then multiply a rotation highest vector by gauge-invariant
  spatial polynomials.

#thm([Lemma 4.1.])[
  #emph[The subspace $cal(F)^("SU" \( 2 \))$ is nonzero and invariant under $G$.]
] <lem:fermion-invariant>

#proof[
  For $1 lt.eq j lt.eq 8$ and $1 lt.eq a lt.eq 3$, put
  $ c_j^a = frac(theta_(2 j - 1)^a + i theta_(2 j)^a, sqrt(2)) . $
  These twenty-four operators and their adjoints satisfy the canonical anticommutation relations ${ c_j^a \,
    c_k^b } = 0$ and ${ c_j^a \, \( c_k^b \)^(*) } = delta_(j k) delta_(a b)$.
    The occupation operators $N_j^a = \( c_j^a \)^(*) c_j^a$ are commuting projections.
    Start with a nonzero joint eigenvector. Applying an occupied mode’s annihilator removes that occupation and
    preserves all others. The result is nonzero, since $lr(bar.v.double c_j^a v bar.v.double)^2 = chevron.l v \,
    N_j^a v chevron.r = lr(bar.v.double v bar.v.double)^2$. Repeating this gives a nonzero vector annihilated by
    every $c_j^a$. For each subset of modes, apply its creation operators in a fixed order.
    The resulting vectors are nonzero and have distinct occupation patterns, hence are orthogonal.
    Their span is invariant under every creation and annihilation operator,
    so irreducibility makes it all of $cal(F)$. The common kernel of the annihilators is therefore exactly the
    original line.
  Gauge transformations mix the color indices and preserve the span of the annihilators for each $j$.
    They therefore preserve the common kernel line. Their action on that line is a continuous character of
    $"SU" \( 2 \)$ and is trivial. Thus $cal(F)^("SU" \( 2 \)) eq.not 0$.
    Its $G$ invariance follows from the commutation in Lemma 3. ◻
]

#thm([Lemma 4.2.])[
  #emph[There are $G$ types $lambda$ with arbitrarily large $lambda_2$ for which $cal(C) ∩
    cal(H)_lambda$ is infinite dimensional.]
] <lem:large-sectors>

#proof[
  Choose a nonzero highest vector $v$ of some irreducible $G$ type $mu$ in the finite-dimensional representation
    $cal(F)^("SU" \( 2 \))$.
  We construct a gauge-invariant polynomial that raises the first two highest-weight coordinates.
    In the complexified vector representation, set
  $ w_1 = e_1 + i e_2 \, wide w_2 = e_3 + i e_4 \, $
  choosing the torus convention in which their weights are $epsilon.alt_1 \, epsilon.alt_2$.
    Use the complex bilinear extension of the Euclidean dot product, and put
  $ zeta_a = w_1 dot.op x^a \, wide eta_a = w_2 dot.op x^a \, wide P \( x \) =
    sum_(a < b) \( zeta_a eta_b - zeta_b eta_a \)^2 . $
  The identity
  $ P = \( zeta dot.op zeta \) \( eta dot.op eta \) - \( zeta dot.op eta \)^2 $
  uses bilinear dot products on the color space $bb(C)^3$. The real orthogonal adjoint action of $"SU" \( 2 \)$
    preserves these products, so $P$ is gauge invariant. At $x = t \( e_1 \, e_3 \, 0 \)$ with $t > 0$,
    one has $P \( x \) = t^4$ and $\| x \| = sqrt(2) thin t$. Thus $P$ is nonzero on every nonempty radial shell.
  For the action on spatial polynomials by pullback,
  $ \( w dot.op R_g^(- 1) x \) = \( R_g w \) dot.op x . $
  Thus $w mapsto \( w dot.op x^a \)$ intertwines the complexified vector representation with linear polynomials,
    with the same weight sign. The analogous map on exterior squares sends $w_1 and w_2$ to $zeta_a eta_b -
    zeta_b eta_a$. The bivector $w_1 and w_2$ is highest of weight $epsilon.alt_1 + epsilon.alt_2$:
    a positive-root operator either kills both factors or sends $w_2$ to a multiple of $w_1$,
    and in the latter case its action on the wedge also vanishes. Hence each minor is highest of that weight.
    Root operators act as derivations on polynomials, so $P$ is highest of weight
    $2 \( epsilon.alt_1 + epsilon.alt_2 \)$. Its nonzero power $P^k$ is highest of weight $2
    k \( epsilon.alt_1 + epsilon.alt_2 \)$.
  Let $chi in C_c^oo \( \( 0 \, oo \) \)$ be nonzero. The function
  $ Psi_chi \( x \) = chi \( \| x \| \) P \( x \)^k v $
  is in $cal(C)$: it is smooth because its support avoids the origin, and its factors are gauge invariant.
    The preceding ray shows that $Psi_chi eq.not 0$. Multiplication by the radial function is $G$ equivariant.
    The translates of $Psi_chi$ lie in the finite-dimensional representation obtained from homogeneous polynomials
    of degree $4 k$ tensored with $cal(F)$. The vector is highest of the dominant weight
  $ lambda = 2 k \( epsilon.alt_1 + epsilon.alt_2 \) +
    mu = \( 2 k + mu_1 \, thin 2 k + mu_2 \, thin mu_3 \, thin mu_4 \) . $
  In a decomposition of that finite representation into irreducibles,
    each nonzero component of this vector is a weight-$lambda$ vector killed by all positive-root operators.
    It must be a highest vector, so its summand has type $lambda$. Therefore $Psi_chi in cal(H)_lambda$.
  Choosing $chi$ with pairwise disjoint radial supports gives infinitely many linearly independent vectors in the
    same sector. Finally, $lambda_2 = 2 k + mu_2$ tends to infinity with $k$. ◻
]

#proof[
  Choose an integer $m gt.eq 0$ with $c_m = \( m + 9 \) \/ 3 - C > 0$.
    Lemma 9 supplies a type $lambda$ such that $lambda_2 > m + M$ and $cal(H)_lambda$ is infinite dimensional.
    By Proposition 7, $H_lambda$ has compact resolvent and no zero eigenvector.
  Since $H_lambda$ is nonnegative with compact resolvent on an infinite-dimensional Hilbert space,
    the compact-resolvent spectral theorem gives an orthonormal eigenbasis $\( Psi_j \)$ with eigenvalues $E_j
    arrow.r oo$. Its trivial kernel makes every $E_j$ positive.
    By Lemma 3, $H_lambda$ is the part of $H$ on a reducing subspace.
    These vectors therefore belong to $"Dom" \( H \)$ and satisfy $H Psi_j =
    E_j Psi_j$ in the full physical Hilbert space. ◻
]

#heading(level: 1)[References]
#bibitem([1])[I. Ya. Aref'eva, A. S. Koshelev, and P. B. Medvedev,
  #emph[On stable sector in supermembrane matrix model], Nuclear Physics B #strong[579] (2000), 411--436.
  #link("https://doi.org/10.1016/S0550-3213(00)00205-4").]
#bibitem([2])[Tom Banks, Willy Fischler, Stephen H. Shenker, and Leonard Susskind,
  #emph[M theory as a matrix model: A conjecture], Physical Review D #strong[55] (1997), 5112--5128.
  #link("https://doi.org/10.1103/PhysRevD.55.5112").]
#bibitem([3])[Elia Bisi and Nikos Zygouras, #emph[Transition between characters of classical groups,
  decomposition of Gelfand--Tsetlin patterns and last passage percolation], arXiv:1905.09756, version 5, 2022.
  #link("https://arxiv.org/abs/1905.09756").]
#bibitem([4])[Ulf H. Danielsson, Gabriele Ferretti, and Bo Sundborg, #emph[D-particle dynamics and bound states],
  International Journal of Modern Physics A #strong[11] (1996), 5463--5478.
  #link("https://doi.org/10.1142/S0217751X96002492").]
#bibitem([5])[E. B. Davies and Barry Simon, #emph[Spectral properties of Neumann Laplacian of horns],
  Geometric and Functional Analysis #strong[2] (1992), 105--117. #link("https://doi.org/10.1007/BF01895707").]
#bibitem([6])[B. de Wit, M. Lüscher, and H. Nicolai, #emph[The supermembrane is unstable],
  Nuclear Physics B #strong[320] (1989), 135--159. #link("https://doi.org/10.1016/0550-3213(89)90214-9").]
#bibitem([7])[Martin Lüscher, #emph[Some analytic results concerning the mass spectrum of Yang--Mills gauge
  theories on a torus], Nuclear Physics B #strong[219] (1983), 233--261.
  #link("https://doi.org/10.1016/0550-3213(83)90436-4").]
#bibitem([8])[Savdeep Sethi and Mark Stern, #emph[Invariance theorems for supersymmetric Yang--Mills theories],
  Advances in Theoretical and Mathematical Physics #strong[4] (2000), 487--501.
  #link("https://doi.org/10.4310/ATMP.2000.v4.n2.a8").]
#bibitem([9])[Barry Simon, #emph[Some quantum operators with discrete spectrum but classically continuous
  spectrum], Annals of Physics #strong[146] (1983), 209--220. #link("https://doi.org/10.1016/0003-4916(83)90057-X").]
#bibitem([10])[A. V. Smilga, #emph[Comments on thermodynamics of supersymmetric matrix models],
  Nuclear Physics B #strong[818] (2009), 101--114. #link("https://doi.org/10.1016/j.nuclphysb.2009.03.023").]
