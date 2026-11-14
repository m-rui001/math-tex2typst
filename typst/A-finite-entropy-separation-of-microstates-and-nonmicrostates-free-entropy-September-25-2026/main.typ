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

#align(center)[#text(size: 16pt, weight: "bold")[A finite-entropy separation of microstates and \
nonmicrostates free entropy]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Free entropy connects the joint moments of noncommuting variables with the geometry of their matrix
  approximations. For a bounded self-adjoint tuple $X = \( X_1 \, dots.h \, X_n \)$ in a tracial von Neumann
  algebra, Voiculescu’s microstates free entropy $chi \( X \)$ measures the asymptotic volumes of matrix tuples
  whose normalized trace moments approximate those of $X$ [12].
  His nonmicrostates free entropy $chi^(*) \( X \)$ instead uses conjugate variables,
  the free analogues of classical scores, and integrates free Fisher information along addition of freely
  independent semicircular noise [13]. We give both definitions, with their normalizations, in Section 2.

The two quantities agree for a single self-adjoint variable,
  and their agreement for general tuples was one of the questions in Voiculescu’s unification problem [14]
  Sections 3.5 and 3.8. The finite-entropy formulation asks whether

$ chi \( X \) > - oo quad arrow.r.double quad chi \( X \) = chi^(*) \( X \) . $

Guionnet stated this formulation explicitly [4] Conjecture 7.1,
  using the equivalent Gaussian-relative normalization. The finiteness hypothesis is substantial:
  as discussed by Jekel and Pi [6] Introduction, there are nonapproximable laws with $chi = - oo < chi^(*)$.
  Here we construct a strict gap with both entropies finite.

Biane, Capitaine, and Guionnet proved the general comparison $chi lt.eq
  chi^(*)$ through large-deviation bounds for matrix Brownian motion [1].
  Jekel and Pi obtained an elementary proof using classical entropy and Fisher information,
  and extended the comparison to conditional free entropy [6].
  Equality is known in significant regular convex settings.
  Dabrowski proved it for a class of strictly convex potentials with Lipschitz derivatives and noncommutative
  polynomial approximations [2] Theorem A; Jekel established entropy and Fisher-information convergence for convex
  matrix potentials with appropriate regularity, concentration,
  and trace-polynomial approximation [5] Theorem 7.1. These results also identify conditions under which the upper
  and lower matrix-size limits agree. Our construction shows that finite entropy alone does not imply equality.

#thm([Theorem 1.1.])[
  #emph[There exist an integer $n gt.eq 2$ and a bounded self-adjoint tuple $X = \( X_1 \, dots.h \, X_n \)$ in a
    von Neumann algebra with faithful normal tracial state such that
$ - oo < chi \( X \) lt.eq chi^(*) \( X \) - 1 / 2 < oo . $

 Here $chi$ is the original microstates entropy using an operator-norm cutoff and a limsup over matrix sizes.]
] <thm:main>

Thus Theorem 1 answers the finite-microstates-entropy equality question negatively.
  The construction uses a large but fixed number of variables.
  It does not address equality for every smaller prescribed number of variables.

The proof compares two noise scales. Start with $C = \( B_1 \, dots.h \, B_p \, Y \)$, where $B_1 \, dots.h \,
  B_p$ are free variance-one semicircular variables and $Y$, in a separate tensor factor,
  is uniformly distributed on $p$ equally spaced points in $\[ - 1 \, 1 \]$. Thus $Y$ commutes with every $B_i$.
  Let $S$ be a standard semicircular $\( p + 1 \)$-tuple free from $C$.
  A small perturbation $X = C + sqrt(h) S$ has finite microstates entropy,
  while its last coordinate still determines spectral blocks containing much of the energy of the first $p$ coordinates.

After an additional noise time $t$, we obtain two different estimates.
  The analytic estimate uses Speicher’s noncrossing cumulant calculus [9,7] and orthogonality of semicircular Wick
  polynomials. Proposition 5 bounds the Fisher deficit by squared $ell^2$ norms of the higher cumulant arrays.
  The sparsity of the signal’s cumulants then makes the nonmicrostates entropy of $C +
  sqrt(h + t) thin S$ close to the entropy of the semicircular family with the same coordinate variances.
  The matrix estimate shows that uniform laws on a selected sequence of increasingly accurate cutoff microstate
  sets of $X$, evolved by independent GUE noise of variance $t$, retain detectable simultaneous block structure.
  This event has probability bounded away from zero uniformly along the selected matrix sizes for those ensembles,
  and probability at most $e^(- c d^2)$ for size-$d$ independent GUE matrices with the coordinate variances of the
  limiting law, for a fixed $c > 0$. Relative-entropy data processing therefore gives a deficit bounded away from
  zero in normalized classical entropy. The use of commutation constraints and projection geometry to control
  microstate volumes has antecedents in Ge’s argument for prime factors [3] Lemma 2 and its proof outline.
  The unitary-net estimate below uses the elementary volumetric covering method discussed by Szarek [10].
  The event estimated here concerns the persistence of block energy after positive Gaussian time.
  The analytic entropy deficit becomes small when $t \/ sqrt(p) arrow.r oo$,
  while the Gaussian block estimate still beats the unitary covering cost when $t log p \/ p arrow.r 0$.
  The choice $t = p^(3 \/ 4)$ satisfies both conditions as $p arrow.r oo$.
  We first choose one sufficiently large finite $p$ and then $h$;
  all matrix limits are taken with these parameters fixed.

The transfer between the scales uses the classical-to-free Fisher comparison of Jekel and Pi [6] Proposition 6.1.
  Lemma 8 proves the needed finite-time statement while retaining the entropies of this same sequence of terminal
  laws. The limsup of those normalized entropies need not equal the microstates entropy of the limiting law.
  Keeping this sequence in the comparison permits the positive-time structural deficit to produce the strict gap
  for $X$.

The companion paper #emph[An isomorphism of the free group factors] [8] Corollary 7.1 proves that each of the four
  free entropy dimensions $delta \, delta_0 \, delta^(*) \, delta^star.op$ attains every integer value $n gt.eq
  2$ on suitable finite self-adjoint $W^(*)$-generating tuples of $L \( bb(F)_2 \)$.
  That statement varies the generating tuple of a fixed algebra;
  Theorem 1 compares $chi$ and $chi^(*)$ on one tuple, with both values finite.

Section 2 fixes the conventions and establishes the matrix convergence facts,
  starting from Gaussian asymptotic freeness [11,7]. Section 3 proves the cumulant/Fisher estimate.
  Section 4 constructs the signal, fixes the two noise scales, and proves $chi \( X \) > - oo$.
  Section 5 proves the specified-ensemble entropy-production lemma.
  Section 6 establishes the block event and combines the estimates to prove Theorem 1.

== 2 Conventions and preliminary facts <sec:conventions>

We fix the entropy normalizations and matrix convergence facts used at both noise scales.
  The matrix inputs may be random tuples supported on bounded microstate sets.

All noncommutative variables below belong to tracial von Neumann algebras with faithful normal tracial state
  $tau$. Write $parallel a parallel_2^2 = tau \( a^(*) a \)$.
  A standard semicircular family has variance one in each coordinate and is free.
  Every noise family is free from the tuple it perturbs.

For a bounded self-adjoint $n$-tuple $X$, let $Gamma_R \( X \; m \, d \, epsilon \)$ consist of self-adjoint $d
  times d$ matrix tuples of coordinate operator norms at most $R$ whose normalized traces of all words of length
  at most $m$ differ from those of $X$ by less than $epsilon$.
  With volume taken in the real Euclidean space defined by unnormalized Hilbert–Schmidt inner product, set

$ chi_R \( X \) = inf_(m \, epsilon) limsup_(d arrow.r oo)
  [d^(- 2) log "Vol" Gamma_R \( X \; m \, d \, epsilon \) + n / 2 log d] \, wide chi \( X \) = sup_R chi_R \( X \) . $

For a tuple $Z$, its conjugate variables $xi_i in L^2 \( W^(*) \( Z \) \, tau \)$ satisfy

$ tau \( xi_i P \( Z \) \) = \( tau ⊗ tau \) \( \( partial_i P \) \( Z \) \) \, $

where $P$ is a noncommutative polynomial in formal indeterminates $x_1 \, dots.h \, x_n$,
  and the difference quotient satisfies $partial_i x_j = delta_(i j) 1 ⊗ 1$ and obeys the Leibniz rule.
  Put $Phi^(*) \( Z \) = sum_i parallel xi_i parallel_2^2$, or infinity if they do not exist.
  We will use the following form of the conjugate-variable definition.

#thm([Lemma 2.1.])[
  (Polynomial variational formula).  #emph[If a bounded self-adjoint tuple $Z$ has conjugate variables, then
#[#set math.equation(numbering: n => "(1)")
 $ Phi^(*) \( Z \) = sup_(P_1 = P_1^(*) \, dots.h \, P_n = P_n^(*)) sum_(i = 1)^n
   [2 \( tau ⊗ tau \) \( \( partial_i P_i \) \( Z \) \) - tau \( P_i \( Z \)^2 \)] \, $ <eq:fishervariational>]

 where the supremum is over self-adjoint noncommutative polynomials.
   It suffices to take $P_i = \( Q_i + Q_i^(*) \) \/ 2$ with coefficients of $Q_i$ in $bb(Q) + i bb(Q)$.
   Consequently, along a family with continuous moments and existing conjugate variables,
   free Fisher information is a measurable function of the parameter.]
] <lem:variational>

#proof[
  The identity $partial_i \( P^(*) \) = "flip" \( \( partial_i P \)^(*) \)$ and the symmetry of $tau ⊗
    tau$ show that $xi_i^(*)$ is a conjugate variable whenever $xi_i$ is.
    Uniqueness follows from polynomial $L^2$ density, so $xi_i$ is self-adjoint.
    The expression under the supremum in (1) equals
  $ sum_i #scale(x: 120%, y: 120%)[\(] 2 tau \( xi_i P_i \( Z \) \) -
    parallel P_i \( Z \) parallel_2^2 #scale(x: 120%, y: 120%)[\)] =
    sum_i #scale(x: 120%, y: 120%)[\(] parallel xi_i parallel_2^2 - parallel xi_i -
    P_i \( Z \) parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  For completeness, the closed span of polynomial vectors is invariant under each bounded self-adjoint left
    multiplication operator $Z_j$. Its orthogonal projection therefore commutes with these operators and with
    $W^(*) \( Z \)$; since it fixes $1$, it fixes every bounded algebra vector.
    Those vectors are dense in $L^2$, proving polynomial density.
    Symmetrizing the approximants proves the claimed supremum.
    Approximating their finitely many coefficients proves the countable version.
    Each functional in that countable supremum is continuous in the moments, which proves measurability. ◻
]

Our nonmicrostates normalization is

#[#set math.equation(numbering: n => "(2)")
 $ chi^(*) \( Z \) = n / 2 log \( 2 pi e \) + 1 / 2 integral_0^oo [frac(n, 1 + s) - Phi^(*) \( Z + sqrt(s) S \)] d
   s . $ <eq:chistar>]

Write $"tr"_d = d^(- 1) "Tr"$ and $parallel D parallel_(2 \, d)^2 =
  sum_i "tr"_d \( D_i^(*) D_i \)$ for matrix tuples. A standard GUE tuple $G^(\( d \))$ consists of independent
  centered Gaussian matrices whose real Hilbert–Schmidt coordinates have covariance $1 \/ d$.
  For a random matrix tuple with density $f$, its normalized classical entropy is

$ H_d = - 1 / d^2 integral f log f + n / 2 log d . $

Thus independent GUE coordinates of variances $w_i > 0$ have normalized entropy $1 / 2 sum_i log \( 2 pi e w_i \)$.

Voiculescu’s asymptotic-freeness theorem introduced the random-matrix input used here [11].
  We use its arbitrary deterministic-tuple form in [7] Theorem 22.35:
  if deterministic matrix tuples converge in normalized trace moments,
  adjoining independent GUE matrices gives convergence of expected normalized traces to those of freely adjoined
  standard semicirculars. The following lemma supplies the additional probability and expectation statements
  needed in this paper.

#thm([Lemma 2.2.])[
  (Bounded matrix inputs).  #emph[Let $K_d$ be sets of self-adjoint matrix tuples with a common coordinate
    operator-norm bound. Suppose their normalized trace moments converge uniformly over $K_d$ to the moments of a
    bounded tuple $T$. Let $A^(\( d \))$ be any random tuple supported on $K_d$,
    independent of a fixed finite standard GUE tuple $G^(\( d \))$.
    Then every normalized polynomial trace in $\( A^(\( d \)) \, G^(\( d \)) \)$ converges in probability to its
    value at $\( T \, S \)$, where $S$ is a standard semicircular family free from $T$.
    Products of finitely many such traces converge in expectation as well.
    The dimensions may range over any sequence tending to infinity.]
] <lem:matrix-convergence>

#proof[
  We first record bounds independent of the deterministic input.
    A $1 \/ 4$-net of the unit sphere of $bb(C)^d$, viewed in real dimension $2 d$,
    has cardinality at most $9^(2 d)$. For a Hermitian matrix $G$, $parallel G parallel lt.eq
    2 max_v \| v^(*) G v \|$ over this net. For standard GUE,
    each $v^(*) G v$ is a real centered Gaussian of variance $1 \/ d$, since $"Tr" \( \( v v^(*) \)^2 \) = 1$. Hence
  #[#set math.equation(numbering: n => "(3)")
   $ bb(P) \( parallel G parallel > L \) lt.eq 2 exp #scale(x: 120%, y: 120%)[\(] d \( 2 log 9 - L^2 \/ 8 \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:gue-norm-tail>]
  In particular, the coordinate norms of any fixed finite GUE tuple are at most $8$ with probability tending to
    one. For sufficiently large $L$ the right side of (3) is at most $2 exp \( - d L^2 \/ 16 \)$.
    Integrating that tail shows that every fixed moment of the operator norm is bounded uniformly in $d$.
  Now take a deterministic input $a$ with coordinate norms at most $R$, and put $F =
    "tr"_d P \( a \, G \)$ for a fixed polynomial $P$. Let $\( E_alpha \)$ be a Hermitian basis orthonormal for
    the unnormalized Hilbert–Schmidt inner product, and write $G_j = sum_alpha g_(j alpha) E_alpha$.
    The real coordinates $g_(j alpha)$ are independent Gaussians with variance $1 \/ d$. Cyclicity of trace gives
  $ partial_(g_(j alpha)) F = d^(- 1) "Tr" \( E_alpha B_j \) \, wide
    sum_(j \, alpha) \| partial_(g_(j alpha)) F \|^2 = d^(- 1) sum_j "tr"_d \( B_j^(*) B_j \) \, $
  where $B_j$ is the sum of the cyclically ordered products obtained by deleting each occurrence of the $j$th GUE
    letter in $P$. The basis also complexifies to an orthonormal basis of all matrices,
    so the second identity applies to complex polynomials.
  For a polynomial in standard real Gaussian coordinates, expansion in orthonormal Hermite polynomials shows that
    its variance is at most the expected squared gradient: differentiation weights each nonconstant coefficient’s
    squared modulus by its positive total degree. Rescaling the coordinates to variance $1 \/ d$,
    and applying this to real and imaginary parts, gives
  #[#set math.equation(numbering: n => "(4)")
   $ bb(E) \| F - bb(E) F \|^2 lt.eq d^(- 2) sum_j bb(E) "tr"_d \( B_j^(*) B_j \) =
     O_(P \, R) \( d^(- 2) \) . $ <eq:gue-trace-variance>]
  The final bound follows from the norm-moment estimate, since each $B_j$ has fixed degree and the deterministic
    coordinates are uniformly bounded. Thus the cited expected-trace theorem yields convergence in probability for
    each deterministic moment-convergent input sequence.
  This convergence is uniform over the sets $K_d$. Otherwise, for some polynomial and positive error threshold,
    one could choose a subsequence and points $a_d in K_d$ whose error probabilities stay bounded away from zero.
    These points form a bounded deterministic moment-convergent sequence, contradicting the preceding conclusion.
    Conditioning on $A^(\( d \))$ proves convergence in probability for the random input.
  Finally, any fixed product $Q$ of normalized polynomial traces satisfies
  $ \| Q \( A^(\( d \)) \, G^(\( d \)) \) \| lt.eq C \( 1 + max_j parallel G_j^(\( d \)) parallel \)^D $
  for constants $C \, D$ depending only on the polynomials and the common cutoff.
    The same estimate squared has uniformly bounded expectation.
    The products are therefore uniformly integrable, so their convergence in probability implies convergence of
    their expectations. ◻
]

== 3 A cumulant bound for the Fisher deficit <sec:fisher>

We first estimate how far the Fisher information of a semicircularly perturbed tuple is from that of a
  semicircular family with the same covariance. The estimate will use the squared sizes of the higher cumulant
  arrays, which will allow us to exploit the sparse cumulants of the signal in the next section.

For a centered bounded self-adjoint $n$-tuple $C$, write $kappa_m \( C \)$ for its order-$m$ free-cumulant array, with

$ parallel kappa_m \( C \) parallel_2^2 = sum_(i_1 \, dots.h \, i_m = 1)^n \|
  kappa_m \( C_(i_1) \, dots.h \, C_(i_m) \) \|^2 . $

We use the moment–cumulant formula and its Möbius inversion on noncrossing partitions,
  the vanishing of mixed cumulants between free algebras, and the fact that a standard semicircular family has
  only second cumulants, given by its covariance [7] Proposition 11.4, Theorem 11.16, and Examples 11.21.

The following testing identity converts the higher-cumulant terms into an orthogonal series.
  For a bounded self-adjoint tuple $Z$, write $E \[ thin dot.op divides W^(*) \( Z \) \]$ for the trace-preserving
  conditional expectation, also viewed as the orthogonal projection onto $L^2 \( W^(*) \( Z \) \, tau \)$ when its
  argument belongs only to $L^2$.

#thm([Lemma 3.1.])[
  (Wick testing).  #emph[Let $C$ be a centered bounded self-adjoint $n$-tuple,
    let $S$ be a standard semicircular family free from $C$, and put $Z = C + sqrt(u) S$, where $u > 0$.
    For a multi-index $upright(bold(j)) = \( j_1 \, dots.h \, j_r \)$, $r gt.eq 1$,
    and a monomial $P$ in the indeterminates $x_1 \, dots.h \, x_n$, define
$ D_(upright(bold(j))) \( P \) = sum_(P = P_0 x_(j_1) P_1 dots.h.c x_(j_r) P_r) product_(a = 0)^r
  tau \( P_a \( Z \) \) . $

 The sum selects increasing positions with the prescribed indices; empty gap words $P_a$ contribute one.
   Extend $D_(upright(bold(j)))$ linearly to polynomials. There is an orthonormal family of semicircular Wick
   polynomials $U_(upright(bold(j))) \( S \)$, indexed by all such multi-indices, with
#[#set math.equation(numbering: n => "(5)")
 $ D_(upright(bold(j))) \( P \) = u^(- r \/ 2) tau \( U_(upright(bold(j))) \( S \)^(*) P \( Z \) \) . $ <eq:wicktest>]

 In particular, the conjugate variables of $Z$ exist and are
$ xi_i = u^(- 1 \/ 2) E \[ S_i divides W^(*) \( Z \) \] . $

]
] <lem:wick>

#proof[
  Define $U_(upright(bold(j)))$ from the word $S_(j_1) dots.h.c
    S_(j_r)$ by summing over sets of disjoint adjacent pairs in the #emph[original] index list:
    delete each chosen pair with factor $- delta_(j_a \, j_(a + 1))$. The empty set gives the original word.
    This definition also gives $U_(upright(bold(j)))^(*) = U_(\( j_r \, dots.h \, j_1 \))$.
  Expand $tau \( U_(upright(bold(j)))^(*) P \( Z \) \)$ by noncrossing cumulants.
    After multilinearly expanding $Z = C + sqrt(u) S$, freeness and semicircularity show that every block meeting
    an initial $S$ position is a pair. Its covariance is $delta_(i j)$ against another initial $S$ and $sqrt(u)
    thin delta_(i j)$ against a selected $S$ term from $Z$.
  To account for the deletion terms, fix a choice of $C$ or $S$ at every $P$-position in the multilinear
    expansion, and a noncrossing partition $pi$ on the original positions.
    Let $A \( pi \)$ be its initial-initial pair blocks whose endpoints are originally adjacent.
    For these fixed choices, contributions correspond exactly to subsets $F subset.eq A \( pi \)$:
    delete the pairs in $F$ and restore them after expanding the remaining word.
    Restoring adjacent pairs preserves noncrossingness and the covariance factors, so their total coefficient is
  $ sum_(F subset.eq A \( pi \)) \( - 1 \)^(\| F \|) = \( 1 - 1 \)^(\| A \( pi \) \|) . $
  If $pi$ has any initial-initial pair, an innermost one is originally adjacent.
    Indeed, its intervening positions are all initial, and each must pair inside that interval to avoid crossing.
    Thus $A \( pi \)$ is nonempty and the partition cancels. This argument includes nested internal pairs and does
    not require deleting newly adjacent positions.
  In each surviving partition all initial positions pair externally with positions of $P$, in reverse order.
    The initial indices in $U_(upright(bold(j)))^(*)$ are $j_r \, dots.h \, j_1$,
    so the selected indices in $P$ occur as $j_1 \, dots.h \, j_r$.
    The external pair arches prevent any remaining block from connecting distinct gaps.
    Summing the unrestricted partitions and the choices of $C$ or $S$ within each gap therefore gives its trace,
    even though the entries of $C$ need not be free. Each external pair contributes $sqrt(u)$, proving (5).
  Apply this calculation with zero signal and $u = 1$. A Wick word tests to zero against a shorter word and gives
    the corresponding Kronecker delta against a word of its own degree.
    Since every other term of a Wick polynomial has smaller degree,
    this proves orthonormality against Wick words of equal or smaller degree;
    conjugate symmetry covers the remaining cases. For $r = 1$,
    $D_i \( P \) = \( tau ⊗ tau \) \( partial_i P \( Z \) \)$,
    so (5) and conditional expectation give the stated conjugate variables. ◻
]

#thm([Proposition 3.2.])[
  (Squared-cumulant Fisher bound).  #emph[Let $C$ be a centered bounded self-adjoint $n$-tuple with diagonal
    covariance $tau \( C_i C_j \) = delta_(i j) c_i$, where $c_i gt.eq 0$,
    and let $S$ be a standard semicircular family free from $C$.
    Put $V_u = C + sqrt(u) S$ and $v_i \( u \) = u + c_i$ for $u > 0$. For every $u > 0$,
$ sum_i frac(1, v_i \( u \)) lt.eq Phi^(*) \( V_u \) lt.eq n / u . $

 Whenever $sum_(r gt.eq 2) u^(- r) parallel kappa_(r + 1) \( C \) parallel_2^2 < oo$,
#[#set math.equation(numbering: n => "(6)")
 $ 0 lt.eq Phi^(*) \( V_u \) - sum_i frac(1, v_i \( u \)) lt.eq 1 /
   u^2 sum_(r gt.eq 2) u^(- r) parallel kappa_(r + 1) \( C \) parallel_2^2 . $ <eq:fisherbound>]

]
] <prop:fisher>

#proof[
  Let $Z = V_u$ and let $xi_i$ be supplied by Lemma 4. Contraction of conditional expectation gives
    $Phi^(*) \( Z \) lt.eq n \/ u$. Also $tau \( Z_i xi_i \) = 1$ by testing the conjugate identity with $Z_i$.
    Since $parallel Z_i parallel_2^2 = v_i \( u \)$, Cauchy–Schwarz gives $parallel xi_i parallel_2^2 gt.eq
    v_i \( u \)^(- 1)$ for every $u > 0$.
  For the upper deficit bound, expand the block containing the first position in $tau \( Z_i P \( Z \) \)$.
    Its other positions select the letters in $D_(upright(bold(j))) \( P \)$,
    while its gaps contribute their moments. Thus
  $ tau \( Z_i P \( Z \) \) = sum_(r gt.eq 1 \, upright(bold(j)))
    kappa_(r + 1) \( Z_i \, Z_(j_1) \, dots.h \, Z_(j_r) \) D_(upright(bold(j))) \( P \) . $
  Only $r lt.eq deg P$ contributes. Centering removes the order-one cumulant,
    and diagonal covariance makes the order-two term $v_i \( u \) D_i \( P \)$.
    Adding free semicircular noise leaves all higher cumulants equal to those of $C$.
  Define the ambient $L^2$ series
  $ R_i = sum_(r gt.eq 2 \, upright(bold(j))) u^(- r \/ 2) kappa_(r + 1) \( C_i \, C_(j_1) \, dots.h \, C_(j_r) \)
    U_(upright(bold(j))) \( S \)^(*) . $
  The adjoint Wick family is orthonormal, and the assumed summability gives convergence in $L^2$ with
  $ sum_i parallel R_i parallel_2^2 = sum_(r gt.eq 2) u^(- r) parallel kappa_(r + 1) \( C \) parallel_2^2 . $
  For a fixed polynomial $P$, all terms with $r > deg P$ have zero trace pairing by (5).
    Moreover, $A mapsto tau \( A P \( Z \) \)$ is continuous on $L^2$.
    The finite cumulant expansion above therefore gives
  $ tau #scale(x: 120%, y: 120%)[\(] \( Z_i - v_i \( u \) xi_i \) P \( Z \) #scale(x: 120%, y: 120%)[\)] =
    tau \( R_i P \( Z \) \) . $
  The coefficients in $R_i$ need no complex conjugation: this identity uses the bilinear trace pairing,
    rather than a Hilbert inner product. Testing with adjoint polynomials converts it into Hilbert-space
    orthogonality. Polynomial $L^2$ density then identifies
  $ Z_i - v_i \( u \) xi_i = E \[ R_i divides W^(*) \( Z \) \] . $
  The conjugate variables are self-adjoint by their conditional-expectation formula.
    Expanding the residual norm using $tau \( Z_i xi_i \) = 1$ yields
  $ parallel Z_i - v_i \( u \) xi_i parallel_2^2 = v_i \( u \)^2 #scale(x: 120%, y: 120%)[\(] parallel xi_i
    parallel_2^2 - v_i \( u \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  Summing after division by $v_i \( u \)^2$, using projection contraction and $v_i \( u \) gt.eq u$, proves (6). ◻
]

The proposition reduces the large-noise entropy estimate to control of the cumulant arrays of the signal.
  Its separate bound $Phi^(*) \( V_u \) lt.eq n \/ u$ will also ensure integrability on every compact interval of
  positive noise times.

== 4 The signal and its two noise scales <sec:signal>

The signal must satisfy two competing requirements. Its higher cumulants must be sparse enough for the Fisher
  estimate, while many coordinates must share a block decomposition.
  Tensor independence supplies the latter without spoiling the former.

Fix an integer $p gt.eq 2$ and set $n = p + 1$. Let $B_1 \, dots.h \, B_p$ be free variance-one semicirculars.
  In a separate tensor factor take a variable $Y$ with uniform distribution on $p$ equally spaced points $y_l = -
  1 + 2 \( l - 1 \) \/ \( p - 1 \)$, $1 lt.eq l lt.eq p$. Thus $Y$ commutes with every $B_i$,
  but is not being taken free from them. Set

$ C = \( B_1 \, dots.h \, B_p \, Y \) \, wide V_a = C + sqrt(a) S \, wide L \( a \) = 1 /
  2 sum_(i = 1)^n log \( 2 pi e \( a + c_i \) \) \, $

where $c_i = tau \( C_i^2 \)$. Thus $c_i = 1$ for $i lt.eq p$, and $C$ is centered with diagonal covariance.
  The benchmark $L \( a \)$ is the nonmicrostates entropy of the centered semicircular family with coordinate
  variances $a + c_i$, and also the normalized classical entropy of the corresponding independent GUE law.

The next construction provides a faithful normal tracial realization together with uniformly bounded deterministic
  matrix models for $C$. These models will later give the finite lower bound for $chi \( X \)$.
  Choose uniformly bounded deterministic matrix models $B^(\( q_k \))$ of the free semicircular $p$-tuple,
  using the convergence and norm bounds in Section 2. Tensor them with $I_p$ and take $I_(q_k) ⊗
  "diag" \( y_1 \, dots.h \, y_p \)$ for $Y$. In dimensions $d_k =
  p q_k$ these give models of the required tensor law. Adjoin an independent GUE $n$-tuple and select realizations
  satisfying successively more moment tests and one fixed norm bound.
  Their joint limiting moments give a positive tracial functional in the variables $\( C \, S \)$ with the
  asserted freeness. In its GNS construction, left and right coordinate multiplication are bounded:
  the matrix inequality $"tr"_d \( Q^(*) D_i^2 Q \) lt.eq R_i^2 "tr"_d \( Q^(*) Q \)$ passes to the limit.
  The vacuum is cyclic for right polynomial multiplication,
  which commutes with the weak closure of the left algebra, so the vacuum is separating for that closure.
  Its vector state is therefore faithful and normal; the trace identity extends by separate weak continuity.
  This supplies the required tracial von Neumann algebra. Further independent noise families can be included in
  the same construction. Faithfulness and the semicircular distribution give $parallel B_i parallel =
  parallel S_i parallel = 2$.

#thm([Lemma 4.1.])[
  #emph[For $K = 128$ and every $m gt.eq 1$,
$ parallel kappa_m \( C \) parallel_2 lt.eq K^m p^(m \/ 4) . $

]
] <lem:cumulants>

#proof[
  There are at most $4^m$ noncrossing partitions and their Möbius coefficients have magnitude at most $4^m$,
    by the Catalan product formula and the interval factorization of the noncrossing lattice [7] Proposition 9.4,
    Theorem 9.29, and Propositions 10.14–10.15. Each product of block moments has absolute value at most $2^m$,
    since $parallel B_i parallel = 2$ and $parallel Y parallel lt.eq 1$.
    Thus each cumulant is at most $32^m$ in absolute value.
  Suppose $b$ of the $m$ positions have $B$ indices. A nonzero product of block moments in Möbius inversion
    requires, after deleting the $Y$ positions in each block,
    a semicircular word with a noncrossing pairing matching equal indices.
    Indeed, tensor independence factors each block moment into its $B$-word moment and its $Y$-moment.
    The union of these pairings is still noncrossing: crossing pairs from distinct blocks would cross the
    containing partition. For fixed $b$ positions, at most $4^b p^(b \/ 2)$ labelings can therefore contribute.
    Summing over positions bounds the number of potentially nonzero entries by $\( 1 + 4 sqrt(p) \)^m$. Consequently
  $ parallel kappa_m \( C \) parallel_2 lt.eq 32^m \( 1 + 4 sqrt(p) \)^(m \/ 2) lt.eq \( 32 sqrt(5) \)^m
    p^(m \/ 4) lt.eq K^m p^(m \/ 4) . $
  ◻
]

By Proposition 5 and a geometric series with ratio $K^2 sqrt(p) \/ u < 1 \/ 2$, for $u > 2 K^2 sqrt(p)$ we have

#[#set math.equation(numbering: n => "(7)")
 $ 0 lt.eq Phi^(*) \( V_u \) - sum_i frac(1, u + c_i) lt.eq 2 K^6 p^(3 \/ 2) u^(- 4) . $ <eq:specialfisher>]

Adding independent free semicircular noise of variance $s$ to $V_a$ gives the law of $V_(a + s)$.
  Equation (2) therefore yields

#[#set math.equation(numbering: n => "(8)")
 $ chi^(*) \( V_a \) = L \( a \) - 1 / 2 integral_a^oo [Phi^(*) \( V_u \) - sum_i frac(1, u + c_i)] d u .
   $ <eq:entropydeficit>]

All terms are finite for $a > 0$: the integrand is measurable by (1), nonnegative, and bounded above by

$ n / u - sum_i frac(1, u + c_i) = sum_i frac(c_i, u \( u + c_i \)) lt.eq frac(sum_i c_i, u^2) \, $

which is integrable on $\[ a \, oo \)$. In deriving (8), the covariance correction is
  $integral_0^oo \[ \( 1 + s \)^(- 1) - \( a + c_i + s \)^(- 1) \] thin d s = log \( a + c_i \)$;
  thus no subtraction of divergent integrals is used. In particular,

#[#set math.equation(numbering: n => "(9)")
 $ chi^(*) \( V_a \) & gt.eq L \( a \) - frac(K^6 p^(3 \/ 2), 3 a^3) > L \( a \) - 1 /
   2 &  & \( a > 2 K^2 sqrt(p) \) \,\
chi^(*) \( V_(h + t) \) - chi^(*) \( V_h \) & = 1 / 2 integral_0^t Phi^(*) \( V_(h + s) \) thin d s .
  $ <eq:largeentropy>]

We now fix $p$ sufficiently large and put $t = p^(3 \/ 4)$ so that

#[#set math.equation(numbering: n => "(10)")
 $ t > 2 K^2 sqrt(p) \, wide frac(32 t, p) < 1 / 8 \,\
frac(p, 256 \( 2 + t \)) > 2 log \( 1 + 128 sqrt(2 + t) \) + log 2 + 8 . $ <eq:parameters>]

These inequalities are compatible because $p \/ t = p^(1 \/ 4)$ grows faster than $log p$.
  An explicit choice is $p = 2^64$ and $t = 2^48$: the first threshold is $2^47$ and $32 t \/ p = 2^(- 11)$.
  For the last inequality, its left side exceeds $128$ since $2 + t < 2^49$,
  whereas its right side is less than $67 log 2 + 8 < 75$ since $1 + 128 sqrt(2 + t) < 2^33$.
  From this point on, $p$ and $t$ are fixed, and only matrix sizes will tend to infinity.

For small $h > 0$, partition the spectrum of $X_n = Y + sqrt(h)
  S_n$ at the midpoints between the $y_l$ and denote its spectral projections by $e_l \( h \)$.
  Let $Delta = 2 \/ \( p - 1 \)$ be the atom spacing. Since $parallel sqrt(h) S_n parallel = 2 sqrt(h)$,
  the condition $h < Delta^2 \/ 64$ places the spectrum inside the disjoint $Delta \/
  4$-neighborhoods of the atoms, with every threshold in a spectral gap.
  Choose continuous functions agreeing with the interval indicators on these common neighborhoods.
  Continuous functional calculus, or uniform polynomial approximation there followed by norm continuity,
  gives $e_l \( h \) arrow.r e_l \( 0 \)$ in norm. At $h = 0$ these projections commute with every $B_i$,
  have trace $1 \/ p$, and satisfy

$ sum_(i = 1)^p sum_(l = 1)^p parallel e_l \( 0 \) B_i e_l \( 0 \) parallel_2^2 =
  sum_(i = 1)^p parallel B_i parallel_2^2 = p . $

We may therefore fix $0 < h < min { 1 \, Delta^2 \/ 64 }$ and abbreviate $e_l = e_l \( h \)$ so that, for $X = V_h$,

#[#set math.equation(numbering: n => "(11)")
 $ tau \( e_l \) < frac(3, 2 p) quad \( 1 lt.eq l lt.eq p \) \, wide
   sum_(i = 1)^p sum_(l = 1)^p parallel e_l X_i e_l parallel_2^2 > frac(3 p, 4) . $ <eq:smallblocks>]

#thm([Lemma 4.2.])[
  #emph[The tuple $X$ has $chi \( X \) > - oo$.]
] <lem:finitechi>

#proof[
  Use the deterministic models for $C$ above, in dimensions $d_k = p q_k$,
    and add independent GUE noise of variance $h$. If $M$ bounds the coordinate norms of those models, take $R_0 =
    M + 8 sqrt(h)$. Lemma 3 and (3) show that these noised models lie in every fixed moment neighborhood of $X$,
    within that cutoff, with probability tending to one. Their density is bounded above by
    $\( d \/ \( 2 pi h \) \)^(n d^2 \/ 2)$. If $q_d$ is the indicated probability, then
  $ "Vol" Gamma_(R_0) \( X \; m \, d \, epsilon \) gt.eq q_d \( 2 pi h \/ d \)^(n d^2 \/ 2) . $
  Since $q_d arrow.r 1$ along the model dimensions, the normalized limsup logarithm is at least $n /
    2 log \( 2 pi h \)$ for each $m \, epsilon$. Take the infimum and then the supremum over cutoffs.
    The limsup definition makes this subsequence of matrix sizes sufficient. ◻
]

== 5 Entropy production for specified matrix ensembles <sec:flow>

We use the classical-to-free Fisher comparison of Jekel and Pi [6] Proposition 6.1,
  keeping the terminal ensemble in the conclusion. The purpose is to transfer a later entropy bound for one
  evolved matrix law back to the initial microstates entropy.
  We prove the comparison for the exact laws that will enter the structural event in the next section.

#thm([Lemma 5.1.])[
  #emph[For the fixed tuple $X = V_h$, fix a cutoff $R > 0$ with $chi_R \( X \) > - oo$.
    There are dimensions tending to infinity and random tuples $A^(\( d \))$,
    uniform on increasingly accurate positive-volume microstate sets at cutoff $R$, such that,
    for independent standard GUE tuples,
#[#set math.equation(numbering: n => "(12)")
 $ limsup_d H_d \( A^(\( d \)) + sqrt(t) G^(\( d \)) \) gt.eq chi_R \( X \) + 1 /
   2 integral_0^t Phi^(*) \( V_(h + s) \) thin d s . $ <eq:flowlower>]

 The left side is the limsup of the normalized entropies of these particular ensembles.]
] <lem:flow>

#proof[
  Every uniform law on a positive-volume microstate set at cutoff $R$ has $sum_i bb(E) "tr"_d \( A_i^2 \) lt.eq
    n R^2$. Comparison with independent GUE matrices of variance $R^2$ bounds its normalized entropy above by $n /
    2 log \( 2 pi e R^2 \)$. Thus $chi_R \( X \)$ is a finite real number.
    Choose a new increasing sequence of dimensions $d_k$, $k gt.eq 1$,
    such that the normalized log-volume at parameters $\( m \, epsilon \) = \( k \, 1 \/ k \)$ is at least
    $chi_R \( X \) - 1 \/ k$. Such arbitrarily large dimensions exist by the defining limsup,
    and the selected sets have positive volume. The pairs $\( k \, 1 \/ k \)$ are cofinal among all moment
    accuracies. Their uniform laws satisfy
  #[#set math.equation(numbering: n => "(13)")
   $ liminf_d H_d \( A^(\( d \)) \) gt.eq chi_R \( X \) . $ <eq:initialentropy>]
  Here and below $d$ ranges over the selected dimensions $d_k$.
    Every tuple in the support of $A^(\( d \))$ has the same fixed cutoff and increasingly accurate moments of
    $X$. The selection does not depend on the subsequent noise time or polynomial tests.
  Put $Z^(\( d \)) \( s \) = A^(\( d \)) + sqrt(s) G^(\( d \))$, and let $f_s$ be its density for $s > 0$.
    In the $n d^2$ real Hilbert–Schmidt coordinates, the added Gaussian has covariance $\( s \/ d \) I$.
    Thus $partial_s f_s = \( 1 \/ \( 2 d \) \) Delta f_s$. Differentiating the entropy and integrating by parts
    gives the normalized de Bruijn identity
  #[#set math.equation(numbering: n => "(14)")
   $ frac(d, d s) H_d \( Z^(\( d \)) \( s \) \) = 1 / 2 I_d \( s \) \, wide I_d \( s \) = 1 /
     d^3 integral parallel nabla log f_s parallel^2 f_s = sum_i bb(E) "tr"_d \( F_i^2 \) \, $ <eq:matrix-debruijn>]
  where $F_i = - \( 1 \/ d \) nabla_i log f_s$ evaluated at $Z^(\( d \)) \( s \)$.
    Gaussian convolution of a compactly supported distribution justifies differentiation and integration by parts
    on compact positive-time intervals. Indeed, derivatives have Gaussian decay,
    a Gaussian lower bound on $f_s$ bounds $\| log f_s \( x \) \|$ by $C \( 1 + parallel x parallel^2 \)$, and
  $ nabla log f_s \( x \) = - d / s #scale(x: 120%, y: 120%)[\(] x -
    bb(E) \[ A^(\( d \)) divides Z^(\( d \)) \( s \) = x \] #scale(x: 120%, y: 120%)[\)] $
  has at most linear growth. Here the norm and gradient are Euclidean,
    and the conditional expectation is bounded at each fixed dimension.
    In particular the entropy and Fisher information are finite at positive times.
    Entropy concavity under mixtures of translations gives $H_d \( Z^(\( d \)) \( epsilon \) \) gt.eq
    H_d \( A^(\( d \)) \)$. Integrating first from $epsilon$ to $t$ and then letting $epsilon arrow.b 0$ proves
  #[#set math.equation(numbering: n => "(15)")
   $ H_d \( Z^(\( d \)) \( t \) \) gt.eq H_d \( A^(\( d \)) \) + 1 /
     2 integral_0^t I_d \( s \) thin d s . $ <eq:classgain>]
  No continuity of entropy at zero is needed.
  For fixed $s > 0$, integration by parts against any complex noncommutative polynomial $P$ gives
  #[#set math.equation(numbering: n => "(16)")
   $ bb(E) "tr"_d \( F_i P \( Z^(\( d \)) \( s \) \) \) =
     bb(E) \( "tr"_d ⊗ "tr"_d \) \( \( partial_i P \) \( Z^(\( d \)) \( s \) \) \) . $ <eq:matrixibp>]
  To verify this identity including its normalization, take an orthonormal Hermitian basis $\( E_alpha \)$ for
    unnormalized Hilbert–Schmidt inner product. It satisfies $sum_alpha E_alpha D E_alpha =
    "Tr" \( D \) 1$ for every complex matrix $D$. Scalar integration by parts,
    separately on real and imaginary parts, turns the left side of (16) into
  $ d^(- 2) sum_alpha bb(E) "Tr" \( E_alpha D_i P \( Z^(\( d \)) \( s \) \) \[ E_alpha \] \) . $
  Here $D_i P \( Z \) \[ E_alpha \]$ is the directional derivative in the $i$th matrix coordinate along $E_alpha$.
    At an occurrence $P = L Z_i R$ in a monomial, its contribution is
  $ d^(- 2) sum_alpha "Tr" \( E_alpha L E_alpha R \) = d^(- 2) "Tr" \( L \) "Tr" \( R \) =
    "tr"_d \( L \) "tr"_d \( R \) . $
  Summing over occurrences proves (16) with the prefix and suffix in the same order as the free difference quotient.
  For self-adjoint polynomial tests $P_i$, completion of squares gives
  $ I_d \( s \) gt.eq sum_i bb(E) "tr"_d #scale(x: 120%, y: 120%)[\(] 2 F_i P_i \( Z^(\( d \)) \( s \) \) -
    P_i \( Z^(\( d \)) \( s \) \)^2 #scale(x: 120%, y: 120%)[\)] . $
  First use (16) to replace every term involving the score by a product of normalized polynomial traces.
    Lemma 3 then gives the limit of the right side as
  $ sum_i [2 \( tau ⊗ tau \) \( \( partial_i P_i \) \( V_(h + s) \) \) - tau \( P_i \( V_(h + s) \)^2 \)] . $
  The limiting law is $V_(h + s)$ because the new semicircular noise is free from $X = V_h$.
    Conjugate variables exist by Lemma 4. Taking the supremum over these tests in Lemma 2 gives
  #[#set math.equation(numbering: n => "(17)")
   $ liminf_d I_d \( s \) gt.eq Phi^(*) \( V_(h + s) \) . $ <eq:matrix-free-fisher>]
  This holds for every fixed $s > 0$ along the same selected dimensions.
    The moments of $V_(h + s) = C + sqrt(h + s) S$ are continuous in $s$,
    so Lemma 2 also gives measurability of the free Fisher information.
    Applying Fatou’s lemma to the nonnegative measurable functions $I_d$, and then using (13) and (15), yields
  $ liminf_d H_d \( Z^(\( d \)) \( t \) \) gt.eq chi_R \( X \) + 1 / 2 integral_0^t Phi^(*) \( V_(h + s) \) thin d s . $
  This proves (12), even with liminf in place of limsup. The free Fisher integral is finite since
    $Phi^(*) \( V_(h + s) \) lt.eq n \/ \( h + s \)$ and $h > 0$.
    Throughout the proof the terminal law is that of the same $A^(\( d \)) + sqrt(t) G^(\( d \))$ selected above;
    no entropy-maximizing law at the terminal distribution has been chosen. ◻
]

== 6 A persistent block-structure entropy deficit <sec:blocks>

We now bound the entropy of the particular terminal ensembles retained in Lemma 8.
  Fix its cutoff $R$, dimension subsequence, and uniform microstate ensembles $A^(\( d \))$.
  The parameters $p \, h \, t$ remain fixed as in Section 4.
  For a decomposition of the identity into $p$ orthogonal projections $P = \( P_l \)$, write

$ cal(D)_P D = (sum_l P_l D_i P_l)_i \, wide D_(\[ p \]) = \( D_1 \, dots.h \, D_p \) . $

Use the midpoint spectral partition of the last coordinate of $A^(\( d \))$ to obtain $P$.
  For every tuple in its support and all sufficiently large dimensions,

#[#set math.equation(numbering: n => "(18)")
 $ "rank" \( P_l \) lt.eq frac(2 d, p) \, wide parallel cal(D)_P A_(\[ p \])^(\( d \)) parallel_(2 \, d)^2 > p \/
   2 . $ <eq:matrixblocks>]

To prove this uniformly, first consider any deterministic sequence of tuples at cutoff $R$ whose joint moments
  converge to those of $X$. Write $I_l$ for the midpoint intervals, with any fixed convention at their endpoints,
  and let $nu_d$ be the empirical spectral measure of $A_n^(\( d \))$.
  These measures converge weakly to the law of $X_n$. Choose a union $N$ of small closed neighborhoods of the
  midpoint thresholds, disjoint from $sigma \( X_n \)$. On a common compact interval containing $\[ - R \, R \]$
  and $sigma \( X_n \)$, choose continuous functions $0 lt.eq f_l lt.eq 1$ agreeing with $1_(I_l)$ outside $N$.
  Then $f_l \( X_n \) = e_l$, and, with $F_l^(\( d \)) = f_l \( A_n^(\( d \)) \)$,

$ parallel P_l - F_l^(\( d \)) parallel_(2 \, d)^2 lt.eq nu_d \( N \) arrow.r 0 . $

Here weak convergence gives $nu_d \( N \) arrow.r 0$ because $N$ is closed and has zero limiting mass.
  In particular, small spectral outliers and eigenvalues exactly at a threshold are allowed.

The cutoff controls multiplication by every other coordinate:

#[#set math.equation(numbering: n => "(19)")
 $ parallel P_l A_i^(\( d \)) P_l - F_l^(\( d \)) A_i^(\( d \)) F_l^(\( d \)) parallel_(2 \, d) lt.eq
   2 R parallel P_l - F_l^(\( d \)) parallel_(2 \, d) . $ <eq:block-outlier>]

The two compressed norms are at most $R$, so their squared norms also have difference tending to zero.
  Uniform polynomial approximation of $f_l$ and joint moment convergence now imply

$ frac("rank" \( P_l \), d) arrow.r tau \( e_l \) \, wide
  parallel P_l A_i^(\( d \)) P_l parallel_(2 \, d)^2 arrow.r parallel e_l X_i e_l parallel_2^2 . $

The block summands are orthogonal in Hilbert–Schmidt inner product;
  hence their squared norms add to $parallel cal(D)_P A_(\[ p \])^(\( d \)) parallel_(2 \, d)^2$.
  The strict margins in (11) give (18). If uniformity over the selected supports failed,
  a violating tuple in each of a subsequence of dimensions would itself be a bounded moment-convergent sequence,
  contradicting this argument. Closure points of the microstate sets satisfy the same moment bounds with weak
  inequalities, whose errors still tend to zero.

Put $v = 1 + h + t$, and let $cal(E)_d$ be the following event for a matrix tuple $D$:

#[#set math.equation(numbering: n => "(20)")
 $ parallel D_(\[ p \]) parallel_(2 \, d) lt.eq 4 sqrt(v p) \, wide
   upright("there exists a decomposition ") P upright(" with")\
"rank" \( P_l \) lt.eq 2 d \/ p \, quad parallel cal(D)_P D_(\[ p \]) parallel_(2 \, d) gt.eq
  sqrt(p) \/ 4 . $ <eq:event>]

This is a deterministic Borel event. For each admissible rank list,
  the space of projection decompositions is a compact unitary orbit.
  The maximum of $parallel cal(D)_P D_(\[ p \]) parallel_(2 \, d)$ over that orbit is a continuous function of
  $D$: every compression is contractive, so the maximum is even Lipschitz in the tuple $2$-norm.
  The event is therefore a finite union of closed threshold sets intersected with a closed norm ball.
  Its definition does not depend on $A^(\( d \))$; the spectral decomposition of $A_n^(\( d \))$ will serve only
  as a witness for its probability under the evolved ensemble.

#thm([Lemma 6.1.])[
  #emph[Let $mu_d$ be the law of $A^(\( d \)) + sqrt(t) G^(\( d \))$,
    and let $gamma_d$ be the law of independent centered GUE coordinates of variances $v_i \( h + t \) = h + t +
    c_i$. For all sufficiently large $d$,
$ mu_d \( cal(E)_d \) gt.eq 1 / 2 \, wide gamma_d \( cal(E)_d \) lt.eq e^(- 4 d^2) . $

]
] <lem:eventprob>

#proof[
  For the first bound use the witness in (18), before adding the noise.
    Conditionally on $A^(\( d \))$, its projections are fixed and independent of $G^(\( d \))$.
    Put $r_l = "rank" \( P_l \)$. The block-diagonal Hermitian subspace has real dimension $sum_l r_l^2$,
    so the GUE covariance $1 \/ d$ and the normalized trace give
  $ bb(E) #scale(x: 120%, y: 120%)[\[] parallel sqrt(t) cal(D)_P G_(\[ p \])^(\( d \)) parallel_(2 \, d)^2 divides
    A^(\( d \)) #scale(x: 120%, y: 120%)[\]] = t p sum_l \( "rank" \( P_l \) \/ d \)^2 lt.eq 2 t . $
  Markov’s inequality at squared threshold $p \/ 16$ bounds failure by $32 t \/ p < 1 \/ 8$.
    On success the projected total norm exceeds $sqrt(p \/ 2) - sqrt(p) \/ 4 > sqrt(p) \/ 4$.
    Independence and centering of the noise also give
  $ bb(E) parallel A_(\[ p \])^(\( d \)) + sqrt(t) G_(\[ p \])^(\( d \)) parallel_(2 \, d)^2 =
    bb(E) parallel A_(\[ p \])^(\( d \)) parallel_(2 \, d)^2 + t p arrow.r v p . $
  Markov’s inequality at the squared norm $16 v p$ bounds the failure of the norm condition in (20) by $1 \/ 16 +
    o \( 1 \) < 1 \/ 8$. The union bound shows that both conditions hold with probability at least $3 \/ 4$,
    proving the weaker claimed bound.
  For the Gaussian bound enumerate at most $\( d + 1 \)^p$ rank lists and choose an operator-norm $delta$-net of
    the unitary group, with $delta = 1 \/ \( 64 sqrt(v) \)$. A maximal $delta$-separated subset of $U \( d \)$ has
    unitary centers and is a $delta$-net. Its ambient operator-norm balls of radius $delta \/
    2$ are disjoint and lie in the ball of radius $1 + delta \/ 2$ in the real $2
    d^2$-dimensional space $M_d \( bb(C) \)$. Volume comparison gives cardinality at most
    $\( 1 + 2 \/ delta \)^(2 d^2)$. Every decomposition of a fixed rank list is a unitary conjugate of its
    standard coordinate blocks $P^0$, including lists with zero ranks.
    For unitaries $U \, V$ with $parallel U - V parallel lt.eq delta$,
  $ parallel U^(*) D_(\[ p \]) U - V^(*) D_(\[ p \]) V parallel_(2 \, d) lt.eq
    2 delta parallel D_(\[ p \]) parallel_(2 \, d) . $
  Fixed-block compression is contractive. Thus replacing a witnessing unitary by a net point loses at most $2
    delta dot.op 4 sqrt(v p) = sqrt(p) \/ 8$ on (20). Hence some rank list satisfying the bounds and some net
    unitary $U$ must satisfy
  $ parallel cal(D)_(P^0) \( U^(*) D_(\[ p \]) U \) parallel_(2 \, d) gt.eq sqrt(p) \/ 8 . $
  For a fixed list and unitary, unitary invariance preserves the independent variance-$v$ GUE law of the first $p$
    coordinates. Their projected Hilbert–Schmidt vector has $q = p sum_l "rank" \( P_l^0 \)^2 lt.eq
    2 d^2$ real coordinates of variance $v \/ d$. The further division by $d$ in the normalized squared norm gives
    the law $\( v \/ d^2 \) Q$, where $Q$ is chi-squared of degree $q$.
    Since $bb(E) e^(Q \/ 4) = 2^(q \/ 2)$, its probability of reaching the squared-norm threshold $p \/ 64$,
    equivalently $Q gt.eq p d^2 \/ \( 64 v \)$, is at most
  $ exp [d^2 (log 2 - frac(p, 256 v))] . $
  The full union bound consequently has logarithm at most
  $ p log \( d + 1 \) + d^2 [2 log \( 1 + 128 sqrt(v) \) + log 2 - frac(p, 256 v)] . $
  Since $v < 2 + t$, Equation (10) makes the bracket less than $- 8$.
    The first term is $o \( d^2 \)$ because $p$ is fixed. This proves the bound $e^(- 4 d^2)$ for large $d$. ◻
]

#proof[
  Retain the same cutoff, dimension subsequence, and ensembles throughout.
    Put $alpha = mu_d \( cal(E)_d \)$ and $beta = gamma_d \( cal(E)_d \)$.
    Binary data processing for relative entropy and the bound on binary entropy give
  $ "KL" \( mu_d bar.v.double gamma_d \) gt.eq alpha log alpha /
    beta + \( 1 - alpha \) log frac(1 - alpha, 1 - beta) gt.eq alpha log 1 / beta - log 2 . $
  Thus Lemma 9 implies $liminf_d d^(- 2) "KL" \( mu_d bar.v.double gamma_d \) gt.eq 2$.
    We retain only one unit of this normalized deficit in the comparison below.
    At positive time the bounded-input Gaussian convolution has finite entropy and finite second moments,
    and its relative entropy with respect to $gamma_d$ is finite. The Gaussian reference has density
  $ g_d \( D \) =
    product_(i = 1)^n
    [(frac(d, 2 pi v_i \( h + t \)))^(d^2 \/ 2) exp (- frac(d^2 "tr"_d \( D_i^2 \), 2 v_i \( h + t \)))] . $
  Using $- integral f log f = - integral f log g_d - "KL" \( f bar.v.double g_d \)$ and the normalization of $H_d$
    gives the exact identity
  $ H_d \( Z^(\( d \)) \( t \) \) & = 1 /
    2 sum_i [log \( 2 pi v_i \( h + t \) \) + frac(bb(E) "tr"_d \( Z_i^(\( d \)) \( t \)^2 \), v_i \( h + t \))] -
    d^(- 2) "KL" \( mu_d bar.v.double gamma_d \) . $
  The expected second moments equal those of $A_i^(\( d \))$ plus $t$, and converge to $v_i \( h + t \)$. In particular,
  $ limsup_d H_d \( Z^(\( d \)) \( t \) \) lt.eq L \( h + t \) - 1 . $
  This upper bound concerns exactly the terminal law $Z^(\( d \)) \( t \) = A^(\( d \)) +
    sqrt(t) G^(\( d \))$ in Lemma 8. Combining the two bounds on its entropy and then (9)–(9) gives
  $ chi_R \( X \) & lt.eq L \( h + t \) - 1 - 1 / 2 integral_0^t Phi^(*) \( V_(h + s) \) thin d s\
 & lt.eq chi^(*) \( V_(h + t) \) - 1 / 2 - 1 / 2 integral_0^t Phi^(*) \( V_(h + s) \) thin d s\
 & = chi^(*) \( V_h \) - 1 / 2 . $
  This holds for every fixed cutoff with $chi_R \( X \) > - oo$; for the remaining cutoffs it is automatic.
    Taking the supremum over cutoffs preserves the bound. Lemma 7 gives $chi \( X \) > - oo$,
    and (8) shows that $chi^(*) \( X \)$ is a finite real number.
    The bounded matrix realization in Section 4 supplies the asserted faithful normal tracial state and bounded
    self-adjoint tuple. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Biane, M.~Capitaine, and A.~Guionnet, #emph[Large deviation bounds for matrix Brownian motion],
  Invent. Math. #strong[152] (2003), no.~2, 433--459.
  #link("https://doi.org/10.1007/s00222-002-0281-4")[doi:10.1007/s00222-002-0281-4].]
#bibitem([2])[Y.~Dabrowski, #emph[A Laplace principle for Hermitian Brownian motion and free entropy I:
  the convex functional case], #link("https://arxiv.org/abs/1604.06420v2")[arXiv:1604.06420v2], October 31, 2017.]
#bibitem([3])[L.~Ge, #emph[Prime factors], Proc. Natl. Acad. Sci. USA #strong[93] (1996), no.~23, 12762--12763.
  #link("https://doi.org/10.1073/pnas.93.23.12762")[doi:10.1073/pnas.93.23.12762].]
#bibitem([4])[A.~Guionnet, #emph[Large deviations and stochastic calculus for large random matrices], Probab.
  Surv. #strong[1] (2004), 72--172.
  #link("https://doi.org/10.1214/154957804100000033")[doi:10.1214/154957804100000033].]
#bibitem([5])[D.~Jekel, #emph[An elementary approach to free entropy theory for convex potentials], Anal.
  PDE #strong[13] (2020), no.~8, 2289--2374.
  #link("https://doi.org/10.2140/apde.2020.13.2289")[doi:10.2140/apde.2020.13.2289].]
#bibitem([6])[D.~Jekel and J.~Pi, #emph[An elementary proof of the inequality $chi lt.eq
  chi^(*)$ for conditional free entropy], Doc. Math. #strong[29] (2024), no.~5, 1085--1124.
  #link("https://doi.org/10.4171/DM/969")[doi:10.4171/DM/969].]
#bibitem([7])[A.~Nica and R.~Speicher, #emph[Lectures on the Combinatorics of Free Probability],
  London Mathematical Society Lecture Note Series, vol.~335, Cambridge University Press, 2006.
  #link("https://doi.org/10.1017/CBO9780511735127")[doi:10.1017/CBO9780511735127].]
#bibitem([8])[OpenAI, #emph[An isomorphism of the free group factors],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-isomorphism-of-the-free-group-factors-September-23-2026/An-isomorphism-of-the-free-group-factors-September-23-2026.pdf")[OAI:An-isomorphism-of-the-free-group-factors-September-23-2026],
  2026.]
#bibitem([9])[R.~Speicher, #emph[Multiplicative functions on the lattice of non-crossing partitions and free
  convolution], Math. Ann. #strong[298] (1994), 611--628.
  #link("https://doi.org/10.1007/BF01459754")[doi:10.1007/BF01459754].]
#bibitem([10])[S.~J.~Szarek, #emph[Metric entropy of homogeneous spaces], Banach Center Publ.
  #strong[43] (1998), 395--410. #link("https://arxiv.org/abs/math/9701213")[arXiv:math/9701213].]
#bibitem([11])[D.~Voiculescu, #emph[Limit laws for random matrices and free products], Invent. Math.
  #strong[104] (1991), 201--220. #link("https://doi.org/10.1007/BF01245072")[doi:10.1007/BF01245072].]
#bibitem([12])[D.~Voiculescu, #emph[The analogues of entropy and of Fisher's information measure in free
  probability theory. II], Invent. Math. #strong[118] (1994), 411--440.
  #link("https://doi.org/10.1007/BF01231539")[doi:10.1007/BF01231539].]
#bibitem([13])[D.~Voiculescu, #emph[The analogues of entropy and of Fisher's information measure in free
  probability theory. V. Noncommutative Hilbert transforms], Invent. Math. #strong[132] (1998), 189--227.
  #link("https://doi.org/10.1007/s002220050222")[doi:10.1007/s002220050222].]
#bibitem([14])[D.~Voiculescu, #emph[Free entropy], Bull. London Math. Soc. #strong[34] (2002), no.~3, 257--278.
  #link("https://doi.org/10.1112/S0024609301008992")[doi:10.1112/S0024609301008992].]
