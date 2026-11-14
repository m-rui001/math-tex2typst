#set page(paper: "us-letter", margin: (x: 70.9pt, y: 70.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[The Quasi-Riemann Hypothesis \
A Zero-Free Half-Plane $Re s > 7 \/ 8$]]
#align(center)[OpenAI]
#align(center)[30 September 2026]

==== 1 Introduction <sec:introduction>

Let $F = bb(Q) \( sqrt(- 3) \)$, let $cal(O)$ be its ring of integers,
  and write $N frak(a) = \| cal(O) \/ frak(a) \|$ for the norm of a nonzero integral ideal.
  A finite-order Hecke character $eta$ modulo a nonzero integral ideal $frak(f)$ is a character of the ray class
  group modulo $frak(f)$, extended by zero to ideals not coprime to $frak(f)$.
  This agrees with the usual finite-order idelic definition:
  the complex place contributes no nontrivial finite-order continuous character [22] Chapter VI, Section 1.
  For $Re s > 1$, put

$ L_F \( s \, eta \) = sum_(frak(a) eq.not 0) frac(eta \( frak(a) \), \( N frak(a) \)^s) =
  product_(frak(p)) (1 - eta \( frak(p) \) \( N frak(p) \)^(- s))^(- 1) . $

The same notation denotes its meromorphic continuation. For a Dirichlet character $chi$ modulo $q$,
  extended by zero on nonunits, we likewise write

$ L \( s \, chi \) = sum_(n gt.eq 1) frac(chi \( n \), n^s) wide \( Re s > 1 \) $

and then continue meromorphically; the character modulo $1$ gives the Riemann zeta function $zeta \( s \)$.
  The problem here is uniform exclusion: to find a constant $sigma_0 < 1$, independent of the character,
  its conductor, and the height, such that these functions have no zeros in $Re s > sigma_0$.

For $zeta$ alone, the existence of a fixed $sigma_0 < 1$ for which $zeta \( s \) eq.not 0$ in $Re s >
  sigma_0$ is called the quasi-Riemann hypothesis [3] Section 1.
  It asks for one gap valid at every height, not merely nonvanishing on $Re s = 1$.
  The corresponding uniform formulation over all Dirichlet characters appears in [9] p. 288,
  Equation (1.4) and the following paragraph.

The connection between these functions and prime distribution has a long history.
  Dirichlet’s 1837 proof of infinitude of primes in every reduced arithmetic progression introduced the character
  $L$-series that separate residue classes [7]. Riemann’s 1859 memoir related the zeros of $zeta$ to the
  distribution of primes and formulated the critical-line conjecture [25].
  Hadamard and de la Vallée Poussin independently proved in 1896 that $zeta$ has no zero on $Re s = 1$,
  obtaining the prime number theorem [15,28]. Hecke subsequently developed the character zeta functions and their
  analytic theory over number fields [18].

Classical zero-free regions for Hecke $L$-functions approach the line $Re s =
  1$ as the conductor or height increases and can allow one simple real exceptional zero;
  a precise form for abelian extensions is given by [27] Theorem 3.1.
  Such regions do not give uniform exclusion in a fixed half-plane.
  Zero-density estimates address a different question: they bound the number of zeros to the right of a given
  vertical line. For example, Guth and Maynard’s large-value estimates improve zero-density bounds for $zeta$ [14]
  Theorem 1.2, but these zero-density bounds do not exclude every zero.

#thm([Theorem 1.])[
  #emph[Every finite-order Hecke $L$-function over $F = bb(Q) \( sqrt(- 3) \)$ has no zero in $Re s > 7 \/ 8$.
    The same holds for every Dirichlet $L$-function, including $zeta \( s \)$.
    A pole at $s = 1$ for a principal character is allowed.]
] <thm:main>

In particular, Theorem 1 resolves the quasi-Riemann hypothesis affirmatively:
  the supremum of the real parts of the nontrivial zeros of $zeta$, namely its zeros in $0 < Re s < 1$,
  is at most $7 \/ 8$. The boundary $Re s = 7 \/ 8$ is not included,
  while any exceptional real zero in $\( 7 \/ 8 \, 1 \)$ is excluded.
  The theorem does not establish the Riemann hypothesis or its generalized versions,
  which place nontrivial zeros on $Re s = 1 \/ 2$. The Riemann hypothesis remains open [5].

Kubota’s metaplectic theory and Patterson’s cubic theta series provide the automorphic setting [20,24].
  We use the unconditional explicit cusp expansions recorded by Dunn and Radziwiłł [8] Section 5 and Appendix A;
  their GRH-conditional prime asymptotic is not an input. The corresponding first-moment asymptotic is proved
  unconditionally in an independent manuscript [23] Theorem 1.1; that result is also not used here.
  Proposition 15 derives the reflection used here while retaining the characters’ zero-on-nonunit restrictions.

The character large-sieve arguments build on the quadratic Hecke-family estimate of Goldmakher and Louvel [13]
  Definition 1 and Theorem 1.1, the higher-order norm recursion of Blomer, Goldmakher,
  and Louvel [4] Theorem 1.3 and Section 3, and Heath-Brown’s cubic estimate [17] Theorem 2.
  We prove the precise sextic specialization needed here in Lemma 30,
  using paired residue characters to carry out that recursion in the primary-generator convention.
  An Eisenstein-integer form is also recorded by Gao and Zhao [12] Lemma 2.9.
  The recursive moment arguments are related to the framework of Heath-Brown’s quadratic method [16] Section 2.
  We also use the ordinary Hecke functional equation [11] Equation (1.1) and prime counting in a fixed ray class
  [27] Theorem 1.1.

The planar additive large sieve used in the first stage is classical;
  compare Huxley’s multivariable and number-field inequality [19] and the Poisson proof in [1] Section 3,
  Theorem 3. We include a direct Eisenstein-lattice proof to record the normalization needed for the
  reduced-fraction expansion. David, de Faveri, Dunn, and Stucky combine Patterson’s coefficients,
  the cubic large sieve, and mollified moments to prove nonvanishing at $s =
  1 \/ 2$ for a positive proportion of a cubic Hecke family [6] Theorem 1.1 and Section 1.2.
  The zero detector below uses the classical truncated-inverse mechanism; compare [21] Appendix C,
  and for a higher-order-character density application [4] Corollary 1.6 and Section 5.

The proof has two stages, each comparing two representations of a completed cubic-theta sum but using a different
  normalized sum in the continuation argument. Part Section 1 proves the corresponding $11 \/
  12$ assertion in Theorem 4, already obtaining a fixed zero-free half-plane for both families.
  Part Section 2 starts from that conclusion and introduces prime compensation, asymmetric scales,
  and two additional moment estimates. The contribution developed here is the construction of these compatible
  reflected and Poisson comparisons, including the principal residues,
  with positive exponent margins chosen independently of the target character.

===== Proof overview <proof-overview>

======= 1.1 A common continuation principle. <a-common-continuation-principle.>

The analytic argument begins with the family of primitive finite-order Hecke characters over $F$.
  Let $beta_(*)$ be the supremum of $1 \/ 2$ and the real parts of their zeros in $1 \/ 2 lt.eq Re s lt.eq 1$;
  poles are not included. Imprimitive characters have the same possible zeros in $Re s > 0$,
  because the finitely omitted Euler factors are nonzero there.
  If $beta_(*)$ exceeds a proposed boundary $sigma_0$, the task is to continue every target reciprocal across a
  common positive distance to the left of $beta_(*)$.

Section 2 gives the precise criterion. For each target $eta$ and large real scale $Z$,
  it compares a normalized character sum with a Mellin integral containing $1 \/ L_F \( s \, eta \)$,
  after deletion of finitely many Euler factors and multiplication by a holomorphic factor bounded away from zero.
  A direct bound for the sum and a power-saving bound for its difference from that integral imply the required
  continuation. The two parts use this same principle with different affine powers of $Z$ in the Mellin integral:

$ C_(upright(I)) \( s \) = s - 2 / 3 \, wide C_(upright("II")) \( s \) = s - 11 / 16 . $

Thus the common analytic principle does not identify the two normalized sums.
  Only the positive power margins must be independent of $eta$;
  fixed-character constants and lower thresholds may depend on it.

======= 1.2 The completed sum. <the-completed-sum.>

Section 2 sets up the sextic residue characters over $cal(O)$, always retaining their zero values on nonunits.
  The base sum in Section 4 averages smoothed cubic-theta Fourier coefficients against these characters and a
  fixed target $eta$. After the fixed rescaling in the theta expansion, the completed indices are $c n^3$,
  where $c \, n in cal(O)$ are congruent to $1$ modulo $3$ and $c$ is squarefree.
  The variables $c$ and $n$ may share prime factors. Here completion means retaining the full cubic factor $n^3$,
  rather than restricting the index to its squarefree part.
  The target character and a finite ray-class phase act on the whole product $c n^3$,
  rather than separately on its two factors.

The resulting completed base sum has two exact representations.
  The reflection in Proposition 15 transforms its theta coefficients while retaining the character zeros in the
  resulting formula. Poisson summation transforms the averaging variable.
  Its nonzero frequencies have the form $u a^6$, where $u \, a in cal(O)$ and $u$ is sixth-power-free:
  every prime valuation of $u$ is at most five. Section 5.2 then expresses the contribution of each such row
  through a quotient of Hecke $L$-functions and a controlled Euler product.
  For $u = 1$, this quotient contains the reciprocal of the target function.

======= 1.3 The balanced first stage. <the-balanced-first-stage.>

In Part Section 1, the two averaging scales are both $Z^(1 \/ 2)$.
  On the reflected side, the base sum separates into a completed theta row and an additive polynomial.
  The quadratic large sieve bounds the mean square of the reflected rows.
  Expanding the additive polynomial produces reduced fractions in $bb(C) \/ cal(O)$;
  their separation and coefficient mass give the required planar large-sieve bound.
  The Cauchy–Schwarz inequality combines the two norms in Proposition 25.
  This direct estimate does not use the later inverse-moment recursion.

On the Poisson side, the intermediate rows are grouped by their norm and by the location of zeros in
  bounded-height rectangles for the finite family of Hecke twists that each row determines.
  Section 6 assigns zero-free rectangles to these families.
  When a row has a selected zero above the detector’s fixed floor for the real part,
  it produces two large Dirichlet polynomials: one with ideal Möbius coefficients,
  representing a truncated reciprocal, and one without those coefficients.
  They have one common row character and one common twist height.
  Part Section 1 uses only the inverse polynomial in its row count.
  After the part of the row with prime valuations at least two is fixed,
  the sextic large sieve applies to its squarefree factor; Proposition 31 gives the resulting count.
  Rows at the floor and the remaining small and large norm ranges are bounded directly.

The principal row is treated separately. Its residues, together with the local Euler identity,
  give a nonzero scalar multiple of the target Mellin integral.
  After normalization, the direct estimate and the remaining-row estimate verify the common continuation criterion
  with $C_(upright(I)) \( s \) = s - 2 \/ 3$. This proves Theorem 4.
  The entire family is needed even for the consequence about $zeta$,
  because the Poisson rows introduce finite-order Hecke twists of the target.

======= 1.4 The refined second stage. <the-refined-second-stage.>

Part Section 2 retains the completed support and the shared arithmetic identities, but it modifies the base sum.
  Selected prime factors provide a local compensation that cancels an unwanted Euler contribution,
  and the two averaging scales are no longer equal. After the new residue calculation and scalar normalization,
  the corresponding Mellin signal uses $C_(upright("II")) \( s \) = s - 11 \/ 16$.
  The low estimate for the normalized sum again follows directly from reflected energy and an additive mean-square
  estimate; Section 4 proves it for the modified sum.

The high estimate uses both polynomials supplied by the zero detector.
  For a smooth compactly supported $W$ on $\( 0 \, oo \)$, a scale $D > 0$,
  and a finite-order Hecke character $psi$, their basic forms are

$ D^(- 1 \/ 2) sum_(frak(a) eq.not 0) mu \( frak(a) \) psi \( frak(a) \) W \( N frak(a) \/ D \) \, wide
  D^(- 1 \/ 2) sum_(frak(a) eq.not 0) psi \( frak(a) \) W \( N frak(a) \/ D \) \, $

where $mu$ is the ideal Möbius function. In the specified intermediate norm ranges above the detector floor,
  each retained row has a large inverse polynomial and a large plain polynomial with one common row character and
  twist height. Bounds for their moments limit the number of such rows.
  Section 8 combines the two bounds, using integer powers and selected prime factors in the larger intermediate
  norm ranges. Small and large norm ranges, and the floor class, remain direct estimates.

The two moment bounds require separate inductions. Section 6 proves the second-moment estimate for an inverse
  polynomial multiplied by sums over disjoint prime sets (Lemma 53).
  Its recursive step uses two finite Poisson transformations to shorten the row range,
  with reflected energy providing the terminal bound. Section 7 proves a mean-square estimate for products of two
  plain polynomials, again with permitted prime factors (Lemma 59).
  Ordinary Hecke reflection reduces the length ranges at each stage;
  the recursive step uses two finite Poisson transformations.

The plain estimate retains different row families according to whether prime factors are present.
  With them, it excludes rows whose primitive inducing character belongs to the fixed finite group generated by
  the target and the auxiliary ray characters; without them, it excludes only principal inducing characters.
  Transformed rows in that finite family are treated separately within the induction.
  Direct volume bounds handle uncentered products. For a difference of two products with the same two profiles and
  equal products of scales, the common main terms cancel. This cancellation is used only for that centered
  expression, not for every row in the finite inducing-character family.

Section 9 combines the resulting row counts with the compensated expansion, its local errors, the contour tails,
  and the principal residue. After normalization, their bound verifies the second comparison in the continuation
  criterion at $7 \/ 8$.

======= 1.5 Transfer to Dirichlet $L$-functions. <transfer-to-dirichlet-l-functions.>

The final transfer is the same at both boundaries. Composing a Dirichlet character $chi$ with the ideal norm gives
  a Hecke character over $F$. Away from finitely many Euler factors,
  quadratic factorization writes its $L$-function as the product of the Dirichlet $L$-functions attached to $chi$
  and to $chi chi_(- 3)$, where $chi_(- 3)$ is the quadratic character of $F \/ bb(Q)$.
  The omitted factors are nonzero in $Re s > 0$, and the principal pole is handled separately.
  Thus each Hecke half-plane transfers to all Dirichlet characters, completing the two stages.

===== Least nonresidues and square roots over prime fields <least-nonresidues-and-square-roots-over-prime-fields>

The fixed Dirichlet zero-free half-plane also makes the following classical consequences unconditional.

#thm([Corollary 2.])[
  #emph[There are absolute constants $A \, C > 0$ such that, for every odd prime $p$,
    the least positive quadratic nonresidue $n \( p \)$ satisfies
$ n \( p \) lt.eq C \( log p \)^A . $

 In particular, $n \( p \) lt.double_delta p^delta$ for every $delta > 0$,
   proving Vinogradov’s least quadratic nonresidue conjecture [26] Conjecture 1.1.
   Given an odd prime $p$ and $a in bb(F)_p$ in binary representation, there is a deterministic algorithm,
   with running time polynomial in $log p$, that returns a square root of $a$ or reports that none exists.]
] <cor:nonresidues-square-roots>

#proof[
  By Theorem 1 and the functional equation, the nontrivial zeros of every primitive Dirichlet $L$-function lie in
    $1 \/ 8 lt.eq Re s lt.eq 7 \/ 8$. They therefore lie in the strictly larger strip $1 \/ 16 < Re s < 15 \/ 16$.
    This supplies the weak-GRH hypothesis of Bhargava, Ivanyos, Mittal,
    and Saxena [2] Conjecture 6.3 and Theorem 6.7 with $epsilon.alt = 7 \/ 16$.
    Their bound for the least quadratic nonresidue gives the asserted inequality, for example with $A = 32$;
    no optimization is needed here. The assertion for each $delta > 0$ follows because every fixed power of $log
    p$ is $O_delta \( p^delta \)$.
  For the algorithm, first handle $a = 0$ and test a nonzero $a$ by Euler’s criterion.
    If $a$ is a square, scan $2 \, 3 \, dots.h$ until a quadratic nonresidue is found,
    testing each candidate by its Legendre symbol. The bound just proved makes this a polynomial-time
    deterministic search; its stopping rule does not require knowing $C$.
    Use the resulting nonresidue in the Tonelli–Shanks algorithm [10] Section 2.9, Algorithm 3 and Lemma 2.9.5.
    All remaining steps are deterministic and polynomial in $log p$.
    Writing $p - 1 = 2^e u$ with $u$ odd only requires removing factors of two, not factoring $u$. ◻
]

==== 2 From a common signal to a zero-free half-plane <sec:analytic-reduction>

Both parts of the proof use the same analytic principle. A character sum is bounded directly and is also compared
  with a Mellin integral containing the reciprocal of a target $L$-function.
  A power saving in both comparisons then continues that reciprocal across the rightmost possible zeros.
  We prove this principle for a variable boundary, so that it can be applied at $11 \/ 12$ and at $7 \/
  8$ without repeating the argument.

Throughout the paper, $F = bb(Q) \( sqrt(- 3) \)$. It suffices to consider primitive target characters.
  Indeed, a character induced from a primitive character $eta$ has $L$-function differing from
  $L_F \( s \, eta \)$ by finitely many factors $1 - eta \( frak(p) \) N frak(p)^(- s)$,
  all nonzero for $Re s > 0$. Define

#[#set math.equation(numbering: n => "(1)")
 $ beta_(*) = sup ({ 1 \/ 2 } union {Re rho : 1 \/ 2 lt.eq Re rho lt.eq 1 \, quad L_F \( rho \, eta \) = 0\
upright("for some primitive finite-order Hecke character ") eta}) . $ <old-eq:1.1b>]

Poles are not included. Absolute convergence of the Euler product excludes zeros in $Re s > 1$, so $1 \/ 2 lt.eq
  beta_(*) lt.eq 1$.

For a finite set $cal(S)$ of prime ideals, a superscript $cal(S)$ means that the corresponding Euler factors have
  been deleted:

$ L_F^(cal(S)) \( s \, eta \) =
  L_F \( s \, eta \) product_(frak(p) in cal(S)) \( 1 - eta \( frak(p) \) N frak(p)^(- s) \) . $

The local value is zero at a ramified prime. Each displayed factor is nonzero for $Re s > 0$,
  so deleting finitely many factors neither creates nor removes a zero there.

#thm([Proposition 3.])[
  (Continuation from a common signal).  #emph[Fix $sigma_0 in \( 1 \/ 2 \, 1 \)$ and suppose $Delta_0 = beta_(*) -
    sigma_0 > 0$. Let $C \( s \) = s + c$, where $c in bb(R)$ is fixed. Suppose that numbers $omega \, sigma$ satisfying
$ 0 < omega < Delta_0 \, wide sigma > 0 $

 can be chosen independently of the target character. For every primitive finite-order Hecke character $eta$,
   suppose there exist a finite set $cal(S)$, a holomorphic function $H_eta$ on $Re s > sigma_0$,
   and a function $J_eta \( Z \)$ defined for all sufficiently large real $Z$, such that
#[#set math.equation(numbering: n => "(2)")
 $ sup_(Re s > sigma_0) \| H_eta \( s \) - 1 \| lt.eq 1 / 2 . $ <eq:signal-euler-contract>]

 For $Z > 0$, define
#[#set math.equation(numbering: n => "(3)")
 $ f_eta \( Z \) = frac(1, 2 pi i) integral_(Re s = 2) Z^(C \( s \)) e^(\( s - 5 \/ 6 \)^2)
   frac(H_eta \( s \), L_F^(cal(S)) \( s \, eta \)) thin d s . $ <eq:common-residue>]

 Assume that, as $Z arrow.r oo$,
#[#set math.equation(numbering: n => "(4)")
 $ \| J_eta \( Z \) \| & lt.double_eta Z^(C \( sigma_0 \) + omega) \,\
\| J_eta \( Z \) - f_eta \( Z \) \| & lt.double_eta Z^(C \( beta_(*) \) - sigma) . $ <eq:low-probe-contract>]

 The implied constants, lower thresholds, excluded set, and function $H_eta$ may depend on $eta$.
   Then these assumptions contradict $beta_(*) > sigma_0$.]
] <lem:continuation-criterion>

#proof[
  Put
  $ epsilon.alt_(*) := min { Delta_0 - omega \, sigma } > 0 . $
  Because $C$ has slope one, the triangle inequality gives
  #[#set math.equation(numbering: n => "(5)")
   $ \| f_eta \( Z \) \| lt.double_eta Z^(C \( beta_(*) \) - epsilon.alt_(*)) wide \( Z gt.eq Z_(0 \, eta) \) .
     $ <eq:uniform-saving>]
  Moreover $epsilon.alt_(*) lt.eq Delta_0 - omega < Delta_0$, so $beta_(*) - epsilon.alt_(*) > sigma_0$.
  We also need control as $Z arrow.b 0$. By Equation (2), $H_eta$ is bounded on $Re s > sigma_0$.
    The reciprocal Euler product is absolutely and uniformly bounded on $Re s gt.eq 2$.
    On every fixed strip $2 lt.eq Re s lt.eq B$, the Gaussian in Equation (3) is $O_B \( e^(- \( Im s \)^2) \)$.
    Cauchy’s theorem on rectangles therefore moves the contour to any fixed $B > 2$,
    with horizontal integrals tending to zero. Hence
  $ \| f_eta \( Z \) \| lt.double_(eta \, B) Z^(B + c) wide \( 0 < Z lt.eq 1 \) . $
  Since $B$ is arbitrary, the signal has arbitrarily rapid power decay at zero.
  This bound and Equation (5) show that
  $ F_eta \( s \) := integral_0^oo f_eta \( Z \) Z^(- C \( s \)) thin frac(d Z, Z) $
  converges locally uniformly on $Re s > beta_(*) - epsilon.alt_(*)$.
    On each compact subset, choose $B$ larger than all occurring real parts for the integral near zero,
    and use Equation (5) near infinity. Thus $F_eta$ is holomorphic on that half-plane.
  We identify this Mellin transform without moving a contour across a zero. Set
  $ A_eta \( s \) = e^(\( s - 5 \/ 6 \)^2) frac(H_eta \( s \), L_F^(cal(S)) \( s \, eta \)) wide \( Re s > 1 \) . $
  The function $A_eta \( 2 + i t \)$ is continuous and integrable in $t$. Writing $Z = e^u$, Equation (3) becomes
  $ e^(- \( 2 + c \) u) f_eta \( e^u \) = frac(1, 2 pi) integral_(bb(R)) e^(i t u) A_eta \( 2 + i t \) thin d t . $
  The left side is integrable in $u$ by the two endpoint estimates.
    Ordinary Fourier inversion therefore gives $F_eta \( 2 + i t \) = A_eta \( 2 + i t \)$ for every real $t$.
    Both sides are holomorphic on $Re s > 1$, so the identity theorem gives
  $ F_eta \( s \) = e^(\( s - 5 \/ 6 \)^2) frac(H_eta \( s \), L_F^(cal(S)) \( s \, eta \)) wide \( Re s > 1 \) . $
  Equation (2) implies $\| H_eta \( s \) \| gt.eq 1 \/ 2$ on $Re s > sigma_0$. Consequently
  $ e^(- \( s - 5 \/ 6 \)^2) frac(F_eta \( s \), H_eta \( s \)) wide \( Re s > beta_(*) - epsilon.alt_(*) \) $
  is a holomorphic continuation of $1 \/ L_F^(cal(S)) \( s \, eta \)$.
    The number $epsilon.alt_(*)$ was chosen independently of $eta$.
    By the definition of $beta_(*)$, some target has a zero $rho$ with $Re rho > beta_(*) - epsilon.alt_(*)$.
    Its reciprocal has a pole at $rho$, and the deleted factors are nonzero there. This contradicts the continuation. ◻
]

The high estimate in Proposition 3 is measured relative to $C \( beta_(*) \)$, not to $C \( sigma_0 \)$.
  This distinction matters when a row contribution reaches the low scale but still has a power saving relative to
  the hypothetical rightmost zero. Part Section 1 uses

$ sigma_0 = 11 / 12 \, wide C \( s \) = s - 2 / 3 \, wide C \( sigma_0 \) = 1 / 4 \, $

whereas Part Section 2 uses

$ sigma_0 = 7 / 8 \, wide C \( s \) = s - 11 / 16 \, wide C \( sigma_0 \) = 3 / 16 . $

Only the positive power margins must be uniform in the target.
  Fixed-character constants, excluded sets, and sufficiently large lower thresholds may depend on it in both
  applications.

== 1 The quasi-Riemann hypothesis <part:eleven-twelfths>

==== 1.1 A first zero-free half-plane <sec:first-stage>

We first prove a fixed zero-free half-plane using the basic completed cubic-theta sum.
  This isolates the mechanism that excludes zeros before the additional estimates needed for the sharper boundary
  are introduced.

#thm([Theorem 1.1.])[
  (The $11 \/ 12$ half-plane).  #emph[Every finite-order Hecke $L$-function over $F =
    bb(Q) \( sqrt(- 3) \)$ has no zero in $Re s > 11 \/ 12$. The same holds for every Dirichlet $L$-function,
    including $zeta \( s \)$. A pole at $s = 1$ for a principal character is allowed.]
] <thm:eleven-twelfths>

For the Hecke assertion, suppose for contradiction that

#[#set math.equation(numbering: n => "(1.1)")
 $ Delta_1 := beta_(*) - 11 / 12 > 0 . $ <eq:first-stage-gap>]

The proof will construct one character sum with two exact representations.
  Cubic-theta reflection bounds the sum after an elementary additive large-sieve estimate.
  Poisson summation expresses the same sum as a principal Mellin signal and a family of remaining character rows.
  A zero detector and the sextic large sieve control those rows.
  These estimates verify Proposition 3 with boundary $11 \/ 12$.

The fixed family in Equation (1) is essential even when the desired consequence concerns $zeta$:
  the Poisson representation introduces finite-order Hecke twists of the target.
  Proving the family-wide assertion also supplies the precise input used at the beginning of Part Section 2.

==== 1.2 Arithmetic and analytic preliminaries <sec:arithmetic>

The two parts use the same arithmetic conventions and analytic estimates.
  This section fixes the residue symbols, retaining their zero values even for principal powers,
  and proves the Gauss and reciprocity identities used to transform character sums.
  It then establishes a calculus for smooth norm profiles and uniform bounds for a Hecke $L$-function on a disk
  known to be zero-free. These are the common preliminaries for the balanced argument.

===== 1.2.1 Arithmetic notation and coefficient classes <arithmetic-notation-and-coefficient-classes>

Let $F = bb(Q) \( sqrt(- 3) \)$, let $omega = e^(2 pi i \/ 3)$, and put

$ cal(O) = bb(Z) \[ omega \] \, wide lambda = sqrt(- 3) = omega - omega^2 = 1 + 2 omega . $

For an element $a$ write $q_a = \| a \|^2 = N_(F \/ bb(Q)) \( a \)$, and for $a eq.not 0$ write $alpha \( a \) =
  a \/ \| a \|$. The same notation $q_(frak(a))$ denotes the norm of a nonzero ideal.
  The ring $cal(O)$ is Euclidean for this norm: a point of $bb(C)$ is at distance at most $1 \/ sqrt(3) <
  1$ from the triangular lattice $cal(O)$, which gives Euclidean division. In particular every ideal is principal.
  The six units are ${ plus.minus 1 \, plus.minus omega \, plus.minus omega^2 }$,
  and their images are the six units of $cal(O) \/ 3 cal(O)$.
  Consequently every ideal coprime to $3$ has a unique generator congruent to $1 med \( mod med 3 \)$;
  we call this generator primary. Products of primary generators are primary.

In the character-polynomial estimates below, a row is an outer index for a character polynomial,
  while a column is an ideal index, or a tuple of ideal indices, summed inside it.
  A label is an auxiliary index distinguishing parts of the family.
  Whether a label is averaged or locally frozen refers to the current sum;
  freezing it does not make it part of the fixed arithmetic datum.

For the arithmetic datum in any given invocation, fix from the outset a finite set $S$ of prime ideals containing
  the primes above $6$ and the prime supports of the defining moduli of every finite-order character presentation
  in that datum and of the fixed finite ray group used to present them.
  For a character presentation, its defining-modulus support consists exactly of the primes at which it is
  extended by zero, including any redundant primes of an imprimitive presentation.
  A fixed character includes its entire zero-extended presentation and the finite ray group through which it is
  presented, all fixed independently of $Z$, the current rows, and the averaged labels.
  The fixed datum may depend on a target fixed beforehand. In particular every such character has modulus one at
  every prime outside $S$. We also write $cal(S) = S$. We call primes outside $S$ good,
  and call an ideal good if all its prime divisors lie outside $S$.
  Unless a different support is specified, ideal sums exclude $S$ and use primary generators.
  We write “sf” for squarefree and $mu$ for the ideal Möbius function.
  Element rows, in contrast, may have arbitrary prime powers and unit factors.

For $z in F$ define

$ e \( z \) = exp #scale(x: 120%, y: 120%)[\(] 2 pi i "Tr"_(F \/ bb(Q)) \( z \/ lambda \)
  #scale(x: 120%, y: 120%)[\)] . $

Its extension to $bb(C)$ is $e \( z \) = exp \( 4 pi i "Im" z \/ sqrt(3) \)$.
  The measure $d mu \( z \) = \( 2 \/ sqrt(3) \) thin d x thin d
  y$ makes $cal(O)$ self-dual for the pairing $\( z \, y \) mapsto e \( z y \)$.
  Indeed, writing $y = u + v omega$ with real $u \, v$, the conditions $e \( y \) = e \( omega y \) = 1$ say $v \,
  u - v in bb(Z)$, hence $y in cal(O)$; and the covolume of $cal(O)$ for $d mu$ is one.
  Lattice point counting in a disk, followed by division by the six units, gives the unrestricted ideal count

$ \# { frak(a) : q_(frak(a)) lt.eq H } = frac(pi H, 3 sqrt(3)) + O \( sqrt(H) + 1 \) wide \( H gt.eq 0 \) . $

For example, the error follows by covering the boundary of the disk with $O \( sqrt(H) + 1 \)$ fixed fundamental
  parallelograms.

If $p in.not S$ is prime, its residue field has order $P = q_p equiv 1 med \( mod med 6 \)$:
  the six roots of unity remain distinct in that field. Define the sextic symbol $chi_p \( a \) = \( a \/ p \)_6$
  to be the unique sixth root of unity satisfying

$ chi_p \( a \) equiv a^(\( P - 1 \) \/ 6) med \( mod med p \) quad \( p divides.not a \) \, wide chi_p \( a \) =
  0 quad \( p divides a \) . $

For a primary $c = product p^(v_p \( c \))$ outside $S$, define $chi_c \( a \) =
  product_(p divides c) chi_p \( a \)^(v_p \( c \))$, and put $chi_1 \( a \) = 1$ for every $a$.
  For every integer $j$, including $j = 0$ and negative $j$,
  the notation $chi_c \( a \)^j$ means its usual power when $\( a \, c \) = 1$ and means zero otherwise.
  Thus an exponent divisible by six is the function $1_(\( a \, c \) = 1)$, not the constant function one.
  The square $chi_c^2$ is the cubic symbol. For squarefree $c$ set

$ gamma_j \( c \) = q_c^(- 1 \/ 2) sum_(v med mod med c) chi_c \( v \)^j e \( v \/ c \) \, wide gamma_j \( 1 \) = 1 . $

#thm([Lemma 1.2.])[
  (Fixed numerators give ray characters).  #emph[Fix $0 eq.not a in cal(O)$.
    At a prime ideal $frak(p) divides.not 6 a$, let $\( a \/ frak(p) \)_6$ be the unique sixth root of unity
    congruent to $a^(\( q_(frak(p)) - 1 \) \/ 6) med \( mod med frak(p) \)$;
    at a prime outside $S$ this is $chi_p \( a \)$. The extension $F \( a^(1 \/ 6) \) \/
    F$ is finite abelian and unramified outside the primes dividing $6 a$, and
$ frac("Frob"_(frak(p)) \( a^(1 \/ 6) \), a^(1 \/ 6)) = \( a \/ frak(p) \)_6 \, $

 where $"Frob"_(frak(p))$ is arithmetic Frobenius. Hence the multiplicative extension of this symbol to ideals
   coprime to $6 a$ is a finite-order ray character whose conductor is supported on the primes dividing $6 a$.
   No bound on its conductor exponents at those primes is asserted.
   This identification is only on ideals coprime to $6 a$; it does not erase the prescribed zero of
   $chi_A \( a \)$ when a good ideal $A$ meets $a$.]
  #emph[In particular, choose one generator $pi_(frak(p))$ for each $frak(p) in S$.
    On primary ideals outside $S$, the characters
$ A mapsto chi_A (u product_(frak(p) in S) pi_(frak(p))^(v_(frak(p)))) \, wide u in cal(O)^times \, quad
  v_(frak(p)) gt.eq 0 \, $

 belong to one finite family of ray characters with a common modulus supported on $S$;
   this family is determined by $u$ and the residues $v_(frak(p)) med \( mod med 6 \)$.]
] <lem:fixed-numerator-ray>

#proof[
  Let $xi^6 = a$. Since $F$ contains all sixth roots of unity, all roots of $X^6 - a$ lie in $F \( xi \)$,
    and $sigma mapsto sigma \( xi \) \/ xi$ embeds its Galois group into $mu_6$.
    The extension is therefore abelian. A prime outside $6 a$ is unramified;
    for example this follows from the discriminant of $X^6 - a$, which is supported on $6 a$.
    At such a prime, arithmetic Frobenius is characterized on the residue field by $x mapsto x^(q_(frak(p)))$.
    Consequently its quotient on $xi$ reduces to $a^(\( q_(frak(p)) - 1 \) \/ 6)$.
    Reduction is injective on $mu_6$ outside $6$, proving the displayed identity.
    Multiplicativity of the Artin map gives the assertion for ideals.
    Artin reciprocity makes this map factor through a ray group with modulus supported on the primes dividing $6
    a$; these are the power-residue and ray-group assertions in [22] Chapter VIII, (5.3) and (5.5).
  For the last statement, an ideal $A$ outside $S$ is coprime to every $pi_(frak(p))$ and to every unit.
    Its symbol therefore has no zero there, and the power of each $chi_A \( pi_(frak(p)) \) in
    mu_6$ depends only on $v_(frak(p)) med \( mod med 6 \)$. There are at most $6^(\| S \| + 1)$ possible
    displayed numerators after this reduction. Apply the first assertion to each and take a common multiple of
    their ray moduli. Their prime supports are all contained in $S$ because $S$ contains the primes above $6$. ◻
]

The word fixed in this lemma is essential: a numerator containing a moving good prime does not thereby enter a ray
  group fixed independently of $Z$. Its character and its natural zero support remain moving data.

At a base $Z > 1$, a plain polynomial of real log-length $n$ is

#[#set math.equation(numbering: n => "(1.2)")
 $ S_psi \( n \; W \) = Z^(- n \/ 2) sum_l psi \( l \) W \( q_l \/ Z^n \) \, $ <old-eq:1.1>]

and the centrally normalized inverse polynomial of log-length $r$ is

#[#set math.equation(numbering: n => "(1.3)")
 $ M_psi \( r \; W \) = Z^(- r \/ 2) sum_n mu \( n \) psi \( n \) W \( q_n \/ Z^r \) . $ <old-eq:1.1a>]

Every mask in $psi$ is retained in both definitions. At base $U$, when $psi \( n \) = nu \( n \) chi_n \( u \)$,
  we also denote the latter polynomial by $M_u \( U^r \; W \)$, or by $M_u \( D \; W \)$ when $D = U^r$.

An annular test is a smooth function with support in a fixed compact subinterval of $\( 0 \, oo \)$.
  Families of annular or coupled profiles are used only with fixed logarithmic support and uniform bounds for
  every logarithmic derivative that is invoked. The precise separation norm is given in Lemma 9.
  In a product of two plain factors, both factors have the same row character,
  including the same fixed finite-ray twist. Conjugating a whole factor inside its absolute value permits the
  opposite orientation; conjugating only part of its coefficients does not.

We use the following uniformity convention. Log-lengths range over fixed bounded sets,
  and every estimate allows any specified positive power loss.
  The exponents of the norm scales depend only on those real parameter ranges, the strict margins,
  and the specified losses. Write $cal(A)$ for this fixed arithmetic datum:
  the complete zero-extended presentations of the fixed finite characters,
  their defining moduli and the fixed finite ray group used to present them, the excluded set,
  and any fixed arithmetic normalization. It is chosen independently of $Z$, the current rows,
  and the averaged labels, though it may depend on a previously fixed target.
  Finite seminorm orders, polynomial height orders, implied constants,
  and lower thresholds may depend on $cal(A)$. They are uniform over the declared moving moduli and outer labels
  in their stated ranges, even when an outer label is fixed during one row sum.

For a nonzero ideal $frak(a)$, let $d_(cal(O)) \( frak(a) \) = \# { frak(d) : frak(d) divides frak(a) }$,
  where the count includes all integral ideal divisors, including those meeting $S$,
  and for $0 eq.not f in cal(O)$ put $d_(cal(O)) \( f \) = d_(cal(O)) \( \( f \) \)$.
  A nonnegative multiplicity $w \( f \)$ is called divisor-bounded only if

$ w \( f \) lt.eq C thin d_(cal(O)) \( f \)^C $

for one fixed $C gt.eq 1$, independent of $Z$, the current rows, and the averaged labels.
  The constant $C$ may depend on $cal(A)$. This convention does not relax any separate condition that $w$ depend
  only on $f$. For every $delta > 0$ it implies $w \( f \) lt.double_(C \, delta) q_f^delta$ uniformly.
  Indeed, for prime ideals $frak(p)$ of sufficiently large norm, $\( e + 1 \)^C lt.eq
  q_(frak(p))^(delta e)$ for every integer $e gt.eq 0$, by $e + 1 lt.eq 2^e$ for $e gt.eq 1$.
  For each of the finitely many remaining prime ideals, $sup_(e gt.eq 0) \( e + 1 \)^C q_(frak(p))^(- delta e) <
  oo$; multiplying these bounds over the prime factorization of $f$ proves the assertion.

===== 1.2.2 Gauss sums and the finite reciprocity phase <gauss-sums-and-the-finite-reciprocity-phase>

We first evaluate the prime Gauss sums. This also fixes the orientation of the cubic symbol in all subsequent formulas.

#thm([Lemma 1.3.])[
  (Prime Gauss identities).  #emph[Let $p$ be the primary generator of a prime ideal outside $S$, and put $H =
    chi_p$ and $P = q_p$. Then
$ gamma_2 \( p \)^3 = - alpha \( p \) \, wide gamma_1 \( p \) gamma_2 \( p \) =
  overline(H \( 4 \)) gamma_3 \( p \) gamma_2 \( p \)^3 . $

 For $j equiv.not 0 med \( mod med 6 \)$, one has $\| gamma_j \( p \) \| = 1$.]
] <lem:prime-gauss-identities>

#proof[
  Let $k = cal(O) \/ \( p \)$ and let $psi \( x \) = e \( x \/ p \)$ be its nontrivial additive character.
    For a multiplicative character $A$ of $k^times$, extended by zero, put
  $ tau \( A \) = sum_(x in k) A \( x \) psi \( x \) \, wide J \( A \, B \) = sum_(x in k) A \( x \) B \( 1 - x \) . $
  If $A$ is nonprincipal, the change of variables $x = t y$ gives
  $ \| tau \( A \) \|^2 = sum_(t in k^times) A \( t \) sum_(y in k^times) psi \( \( t - 1 \) y \) = P . $
  The inner sum is $P - 1$ for $t = 1$ and $- 1$ otherwise, and $sum_(t in k^times) A \( t \) = 0$.
    Conjugation also gives $tau \( A \) tau \( overline(A) \) = A \( - 1 \) P$.
    When $A B$ is nonprincipal, grouping the product $tau \( A \) tau \( B \)$ by $x + y$ gives
  $ tau \( A \) tau \( B \) = J \( A \, B \) tau \( A B \) . $
  The group with $x + y = 0$ vanishes because $A B$ is nonprincipal; for a nonzero sum, division by $x +
    y$ gives the displayed Jacobi factor. In particular $\| J \( A \, B \) \| = sqrt(P)$ if $A \, B \,
    A B$ are all nonprincipal.
  The number of solutions of $4 x \( 1 - x \) = y$ is $1 + H^3 \( 1 - y \)$.
    Summing $H \( y \)$ times this identity and using $sum_y H \( y \) = 0$ gives $J \( H \, H^3 \) =
    H \( 4 \) J \( H \, H \)$. Write $tau_j = tau \( H^j \)$. The Gauss–Jacobi identity and $tau_2 tau_4 = P$ now give
  $ frac(tau_1 tau_3, tau_4) = H \( 4 \) tau_1^2 / tau_2 \, wide tau_1 tau_2 =
    overline(H \( 4 \)) frac(tau_3 tau_2^3, P) . $
  Here $H^2 \( - 1 \) = 1$ because $- 1$ is a cube.
  It remains to fix the cubic Jacobi sum, including its unit. Put $m = \( P - 1 \) \/ 3$.
    The definition of $H^2$ gives, in $k$,
  $ J \( H^2 \, H^2 \) equiv sum_(x in k) x^m \( 1 - x \)^m = 0 med \( mod med p \) . $
  Indeed the polynomial has degree $2 m < P - 1$, and the sum over $k$ of each monomial of degree less than $P -
    1$ is zero in $k$ (the constant case is $P = 0$ in $k$). The Jacobi sum belongs to $cal(O)$ and has absolute
    value $sqrt(P)$.
  For $x eq.not 0 \, 1$, choose $j_x in { 0 \, 1 \, 2 }$ such that $H^2 \( x \( 1 - x \) \) = omega^(j_x)$.
    The products of $x$ and of $1 - x$ over these $x$ are both $- 1$,
    so $product_(x eq.not 0 \, 1) x \( 1 - x \) = 1$. Hence $sum_(x eq.not 0 \, 1) j_x equiv
    0 med \( mod med 3 \)$. Since
  $ omega^j equiv 1 + j \( omega - 1 \) med \( mod med \( omega - 1 \)^2 \) \,
    wide \( \( omega - 1 \)^2 \) = \( 3 \) \, $
  we obtain $J \( H^2 \, H^2 \) equiv P - 2 equiv - 1 med \( mod med 3 \)$.
    Divisibility by $p$ and equality of norms imply $J \( H^2 \, H^2 \) = u p$ for a unit $u$.
    As $p$ is primary and the six units have distinct residues modulo $3$, the congruence forces $u = - 1$.
    Finally, $tau_2^3 = J \( H^2 \, H^2 \) tau_2 tau_4 = - p P$.
    Dividing the two Gauss identities by the appropriate powers of $sqrt(P)$ proves the lemma. ◻
]

The remaining phase is quadratic. Its evaluation below is valid even for odd elements that are not squarefree or
  primary.

#thm([Lemma 1.4.])[
  (Quadratic four-term formula).  #emph[For a nonzero odd $c in cal(O)$, define
$ Gamma \( c \) = \| c \|^(- 1) sum_(x med mod med c) e \( x^2 \/ c \) . $

 Then
#[#set math.equation(numbering: n => "(1.4)")
 $ Gamma \( c \) = 1 / 2 sum_(y med mod med 2 cal(O)) e \( - c y^2 \/ 4 \) . $ <eq:quadratic-four-term>]

 For $c = a + b omega$ the right side is $\( 1 + i^(- b) + i^a + i^(b - a) \) \/ 2$.
   In particular $Gamma$ depends only on $c med mod med 4 cal(O)$ and $Gamma \( c v^2 \) =
   Gamma \( c \)$ for every odd $v$. The units modulo $4$ have square subgroup ${ 1 \, omega \,
   omega^2 }$ and square-class representatives $1 \, - 1 \, lambda \, - lambda$.
   The function $Gamma$ never vanishes on these units, and $frak(r) \( a \, b \) =
   Gamma \( a b \) \/ \( Gamma \( a \) Gamma \( b \) \)$ satisfies
#[#set math.equation(numbering: n => "(1.5)")
 $ c & 1 & - 1 & lambda & - lambda\
Gamma \( c \) & 1 & 1 & i & - i\
frak(r) \( \( - 1 \)^e lambda^f \, \( - 1 \)^g lambda^h \) = \( - 1 \)^(e h + f g + f h) \, wide e \, f \, g \,
  h in { 0 \, 1 } . $ <eq:reciprocity-four-class>]

 Thus $\| Gamma \( c \) \| = 1$ and $frak(r)$ is a symmetric ${ plus.minus
   1 }$-valued bicharacter of the square-class group.]
] <lem:quadratic-four-term>

#proof[
  Use the Fourier transform with kernel $e \( - z y \)$ and measure $d mu$.
    For $epsilon > 0$ apply Poisson summation on $cal(O)$ to $f_epsilon \( z \) =
    e \( z^2 \/ c \) e^(- pi epsilon \| z \|^2)$. Direct Gaussian integration gives, with $r_epsilon = 1 +
    3 q_c epsilon^2 \/ 16$,
  $ hat(f)_epsilon \( y \) = frac(\| c \|, 2 sqrt(r_epsilon)) e^(- pi epsilon q_c \| y \|^2 \/ \( 4 r_epsilon \))
    e #scale(x: 120%, y: 120%)[\(] - c y^2 \/ \( 4 r_epsilon \) #scale(x: 120%, y: 120%)[\)] . $
  To check the normalization, rotate $z$ by half the argument of $c$.
    The quadratic matrix of the resulting real two-variable Gaussian is
  $ mat(delim: "(", epsilon, - 4 i \/ \( sqrt(3) \| c \| \); - 4 i \/ \( sqrt(3) \| c \| \), epsilon) \, wide
    det = frac(16 r_epsilon, 3 q_c) . $
  Its eigenvalues are conjugates with positive real part. The positive square root of the determinant,
    the factor $2 \/ sqrt(3)$ in $d mu$, and completion of the square give the formula above.
  Put $I_epsilon = integral_(bb(C)) e^(- pi epsilon \| z \|^2) d mu \( z \) = 2 \/ \( sqrt(3) epsilon \)$.
    For a fixed ideal $\( b \)$, a fixed class $v med mod med b$, and $a > 0$,
    Gaussian Poisson summation on $b cal(O)$ gives
  $ 1 / I_epsilon sum_(z in v + b cal(O)) e^(- pi a epsilon \| z \|^2) arrow.r
    frac(1, a q_b) wide \( epsilon arrow.b 0 \) . $
  The zero dual vector gives the limit and every nonzero dual vector is exponentially small.
    The phase $e \( z^2 \/ c \)$ is periodic modulo $c$. Consequently the normalized left side of Poisson’s
    identity tends to $Gamma \( c \) \/ \| c \|$.
  On the right side one may replace $r_epsilon$ by $1$. For fixed $c$, the total error from the phase is at most
  $ C_c epsilon^2 sum_(y in cal(O)) \| y \|^2 e^(- C_c^(- 1) epsilon \| y \|^2) = O_c \( 1 \) \, $
  because the sum is $O_c \( epsilon^(- 2) \)$. The amplitude error is $O_c \( epsilon \)$,
    as is the damping error, by the same lattice estimate. All three are $o \( I_epsilon \)$.
    The phase $e \( - c y^2 \/ 4 \)$ is periodic modulo $2 cal(O)$.
    In the preceding Gaussian mean take $b = 2$ and $a = q_c \/ 4$;
    each of its four classes has normalized mean $1 \/ q_c$. The normalized right side therefore tends to
    $\( 2 \| c \| \)^(- 1) sum_(y med mod med 2) e \( - c y^2 \/ 4 \)$, which proves Equation (1.4).
  The representatives $0 \, 1 \, omega \, omega^2$ modulo $2$ give the asserted four-term expression.
    Multiplication by an odd $v$ permutes these classes, so the same formula gives $Gamma \( c v^2 \) =
    Gamma \( c \)$. The group of units modulo $4$ has order $12$.
    Squaring a lift modulo $4$ depends only on its class modulo $2$, and its three possible squares are $1 \,
    omega \, omega^2$. The four representatives in the statement are distinct modulo this subgroup;
    also $lambda^2 = - 3 equiv 1 med \( mod med 4 \)$. Evaluating the four-term expression on them gives the
    table. Evaluating $Gamma \( a b \) \/ \( Gamma \( a \) Gamma \( b \) \)$ on the two generators $- 1 \,
    lambda$ gives the displayed exponent, proving the last claims. ◻
]

#thm([Lemma 1.5.])[
  (Sextic reciprocity and the fixed Gauss phase).  #emph[For coprime primary $a \, b$ outside $S$,
$ chi_b \( a \) = cal(R) \( a \, b \) chi_a \( b \) \, wide cal(R) \( a \, b \) = frak(r) \( a \, b \) . $

 On all primary pairs outside $S$, including noncoprime pairs,
   define $cal(R)$ by the bicharacter $frak(r)$ of Equation (1.5). Define, on every primary index outside $S$,
$ G \( c \) = overline(chi_c \( 4 \)) Gamma \( c \) . $

 It has modulus one and factors through a fixed ray group supported at $2 \, 3$. For all such $v \, w$,
#[#set math.equation(numbering: n => "(1.6)")
 $ G \( v w \) = G \( v \) G \( w \) cal(R) \( v \, w \) \, wide G \( 1 \) = 1 . $ <eq:G-quadratic-refinement>]

 Moreover $G \( v^2 \) = chi_v \( 4 \)$, and at good primes
#[#set math.equation(numbering: n => "(1.7)")
 $ G \( p^3 \) = gamma_3 \( p \) \, wide cal(R) \( p \, p \) = gamma_3 \( p \)^2 =
   chi_p \( - 1 \) . $ <eq:fixed-gauss-phases>]

 On every primary $n$ outside $S$, one has $chi_n \( - 1 \) = cal(R) \( n \, n \)$.
   The diagonal $t mapsto cal(R) \( t \, t \)$ is a character of the fixed ray group.
   In the square-class notation of Equation (1.5), it is $frak(r) \( - 1 \, n \)$, where $-
   1$ denotes its residue square class modulo $4$, not the ideal ray class of the unit ideal $\( - 1 \)$.
   For squarefree $c$ the complete Gauss identities are
#[#set math.equation(numbering: n => "(1.8)")
 $ gamma_2 \( c \)^3 = mu \( c \) alpha \( c \) \, wide gamma_1 \( c \) gamma_2 \( c \) =
   mu \( c \) alpha \( c \) G \( c \) \, wide G \( c \) = overline(chi_c \( 4 \)) gamma_3 \( c \) \,
   quad \| G \( c \) \| = 1 . $ <eq:signal>]

 All occurrences of $G$ on nonsquarefree indices mean the finite-ray function just defined,
   not a nonsquarefree Gauss sum.]
] <lem:fixed-gauss-phase>

#proof[
  At a good prime, counting square roots in the residue field gives
  $ sum_(x med mod med p) e \( x^2 \/ p \) = sum_(y med mod med p) \( 1 + chi_p \( y \)^3 \) e \( y \/ p \) =
    sum_(y med mod med p) chi_p \( y \)^3 e \( y \/ p \) . $
  The additive sum without the character is zero. Hence $Gamma \( p \) = gamma_3 \( p \)$,
    and replacing $x^2 \/ p$ by $u x^2 \/ p$ for a unit $u$ multiplies the sum by $chi_p \( u \)^3$.
    For squarefree $c$, representing a residue as $sum_(p divides c) \( c \/ p \) x_p$ gives, in both sums,
  $ Gamma \( c \) = product_(p divides c) chi_p \( c \/ p \)^3 Gamma \( p \) \, wide gamma_3 \( c \) =
    product_(p divides c) chi_p \( c \/ p \)^3 gamma_3 \( p \) . $
  The cross terms in the square are integral in the additive character.
    Thus $Gamma \( c \) = gamma_3 \( c \)$ for squarefree $c$. In particular, for distinct good primes $p \, q$,
  $ frac(Gamma \( p q \), Gamma \( p \) Gamma \( q \)) = chi_p \( q \)^3 chi_q \( p \)^3 . $
  We use cubic reciprocity in the following precise form: for coprime primary $a \,
    b$ one has $\( a \/ b \)_3 = \( b \/ a \)_3$; see [8] Equation (1.4).
    Thus the quotient $chi_b \( a \) \/ chi_a \( b \)$ is a sign.
    At $p \, q$ its cube is $chi_q \( p \)^3 chi_p \( q \)^3$, so this sign equals $frak(r) \( p \, q \)$.
    Multiplicativity in both arguments and the bicharacter property extend the equality to every coprime primary
    pair. The definition by $frak(r)$ on noncoprime pairs involves no division of zero symbols.
  The element $- 2$ is primary and $- 1$ is a cube. Cubic reciprocity therefore gives
  $ chi_c \( 4 \) = \( 2 \/ c \)_3 = \( - 2 \/ c \)_3 = \( c \/ \( - 2 \) \)_3 . $
  This is a character of $c med mod med 2$. Together with the dependence of $Gamma$ on $c med mod med 4$,
    this proves that $G$ is a function on a fixed ray group (for example the ray group modulo $12$ suffices here).
    Indeed, if two primary generators represent the same ray class modulo $12$,
    their quotient differs from an element congruent to one modulo $12$ by a unit;
    reduction modulo $3$ forces that unit to be one. The generators therefore have the same residue modulo $4$.
    Its multiplicative refinement is the definition of $frak(r)$.
    Since $Gamma \( v^2 \) = 1$ and $chi_v \( 4 \)$ has order dividing three, $G \( v^2 \) =
    overline(chi_v \( 4 \))^(thin 2) = chi_v \( 4 \)$. The table also gives
  $ Gamma \( p \)^2 = \( - 1 \)^(\( q_p - 1 \) \/ 2) = chi_p \( - 1 \) . $
  For the last equality use $chi_p \( - 1 \) = \( - 1 \)^(\( q_p - 1 \) \/ 6)$ and the equality of these parities.
    Now $Gamma \( p^3 \) = Gamma \( p \)$, and $overline(chi_p \( 4 \))^(thin 3) = 1$, proving $G \( p^3 \) =
    gamma_3 \( p \)$. Finally $cal(R) \( p \, p \) = 1 \/ Gamma \( p \)^2 = Gamma \( p \)^2$, as this square is a sign.
  For a symmetric sign-valued bicharacter its diagonal is multiplicative:
  $ cal(R) \( v w \, v w \) = cal(R) \( v \, v \) cal(R) \( v \, w \)^2 cal(R) \( w \, w \) =
    cal(R) \( v \, v \) cal(R) \( w \, w \) . $
  The prime identity consequently gives $cal(R) \( n \, n \) = chi_n \( - 1 \)$ for every primary $n$ outside $S$.
    On the square class $\( - 1 \)^e lambda^f$, the table gives both this diagonal and $frak(r) \( - 1 \, n \)$
    the value $\( - 1 \)^f$. This use of $- 1$ is in the residue square-class group;
    the ideal $\( - 1 \)$ is the identity in an ideal ray class group and is not being substituted there.
  For coprime squarefree primary $a \, b$ outside $S$, the Chinese remainder theorem gives
  $ gamma_j \( a b \) = chi_a \( b \)^j chi_b \( a \)^j gamma_j \( a \) gamma_j \( b \) . $
  One obtains this by representing a residue as $b x + a y$ with $x med mod med a$ and $y med mod med b$.
    Cubing the factor for $j = 2$ gives one. The product of the factors for $j = 1$ and $j =
    2$ is $\( chi_a \( b \) chi_b \( a \) \)^3 = cal(R) \( a \, b \)$.
    The prime identities from Lemma 6, followed by Equation (1.6),
    therefore prove Equation (1.8) by induction on the number of prime factors. ◻
]

For later element rows, fix the generators $pi_(frak(p))$ from Lemma 5.
  Every $0 eq.not m in cal(O)$ has a unique expression

$ m = u m_S m_(upright("good")) \, wide m_S = product_(frak(p) in S) pi_(frak(p))^(v_(frak(p)) \( m \)) \, $

where $u$ is a unit and $m_(upright("good"))$ is the primary generator of the part of $\( m \)$ outside $S$.
  On every primary $A$ outside $S$, multiplicativity and sextic reciprocity give the zero-preserving identity

#[#set math.equation(numbering: n => "(1.9)")
 $ chi_A \( m \) = chi_A \( u m_S \) cal(R) \( A \, m_(upright("good")) \) product_(p divides m_(upright("good")))
   chi_p \( A \)^(v_p \( m \)) . $ <eq:row-fixed-ray-reduction>]

For $\( A \, m_(upright("good")) \) = 1$ this is the reciprocity formula just proved; if they meet,
  both sides are zero and $cal(R)$ is evaluated as its separately defined bicharacter.
  Once the good part’s fixed ray class and the $S$-valuations modulo six are fixed,
  the first two factors on the right range over a fixed finite family of characters of $A$.
  The product over good primes retains the moving character factors and all their zeros.

Every function on a fixed finite abelian ray group has a finite Fourier expansion in its characters.
  For example, if $phi.alt : T arrow.r bb(C)$, then

$ phi.alt \( v \) = sum_(theta in hat(T)) a_theta theta \( v \) \, wide a_theta =
  frac(1, \| T \|) sum_(u in T) phi.alt \( u \) overline(theta \( u \)) . $

Parseval and Cauchy–Schwarz bound $sum_theta \| a_theta \|$ by $\| T \|^(1 \/ 2) max_T \| phi.alt \|$.
  Applying the same statement on $T times T$ separates $cal(R) \( a \, b \)$ as a finite sum of products of
  characters. These expansions remain valid at noncoprime primary pairs because $cal(R)$ there is the fixed-ray
  bicharacter, not a symbolic quotient. For example, for a good prime $p$ and every primary $n$ outside $S$,

$ chi_n \( p \) overline(chi_p \( n \)) = cal(R) \( p \, n \) 1_(\( n \, p \) = 1) . $

On coprime pairs this is sextic reciprocity, and on the remaining pairs both sides vanish.
  Thus cancellation of the moving local characters can leave both a coprimality indicator and a fixed-ray phase;
  neither may be discarded.

===== 1.2.3 Smooth norm profiles <smooth-norm-profiles>

The following conventions make the smooth dependence in character-polynomial estimates quantitative.
  They distinguish derivatives of a fixed test from powers of a spectral height.
  This distinction is needed when a Fourier tail is removed only after the height range has been chosen.

For a profile $w$ on $\( 0 \, oo \)^d$ with logarithmic support in a fixed compact set $Omega subset bb(R)^d$, put

$ w_log \( bold(u) \) = w \( e^(u_1) \, dots.h \, e^(u_d) \) \, wide p_j \( w \) =
  sum_(\| alpha \| lt.eq j) sup_(bold(u) in bb(R)^d) \| partial^alpha w_log \( bold(u) \) \| . $

We always understand that $w_log$ is smooth and supported in $Omega$. Define

$ hat(w) \( bold(t) \) = integral_(bb(R)^d) w_log \( bold(u) \) e^(- i bold(t) dot.op bold(u)) thin d bold(u) \,
  wide parallel w parallel_(J \, upright("sep")) = integral_(bb(R)^d) \|
  hat(w) \( bold(t) \) \| \( 1 + \| bold(t) \| \)^J thin d bold(t) . $

For a fixed finite tuple $bold(w) = \( w_1 \, dots.h \, w_r \)$, possibly of different fixed dimensions,
  we use $p_j \( bold(w) \) = 1 + sum_(i = 1)^r p_j \( w_i \)$.

#thm([Lemma 1.6.])[
  (Smooth calculus).  #emph[For integers $J gt.eq 0$,
$ parallel w parallel_(J \, upright("sep")) lt.double_(J \, d \, Omega) p_(J + d + 2) \( w \) . $

 Logarithmic Fourier inversion separates any fixed norm monomial.
   More precisely, if $x_j = c_j product_(ell = 1)^r y_ell^(a_(j ell))$ with $c_j \,
   y_ell > 0$ and fixed real exponents $a_(j ell)$, then
$ w \( x_1 \, dots.h \, x_d \) = frac(1, \( 2 pi \)^d) integral_(bb(R)^d) hat(w) \( bold(t) \) product_j
  c_j^(i t_j) product_ell y_ell^(i sum_j a_(j ell) t_j) thin d bold(t) . $

 If the coefficient measure in this formula is common to a collection of rows,
   Minkowski’s inequality passes any separated row $ell^2$ bound through the integral using $parallel w
   parallel_(J \, upright("sep"))$ whenever the separated bound has height growth at most $\( 1 + \| bold(t) \| \)^J$.]
  #emph[For a unit box $I subset bb(R)^d$ and a smooth scalar function $F$ on $I + \[ - 1 \, 1 \]^d$,
#[#set math.equation(numbering: n => "(1.10)")
 $ sup_I \| F \|^2 lt.double_d sum_(alpha in { 0 \, 1 }^d) integral_(I + \[ - 1 \, 1 \]^d) \| partial^alpha
   F \|^2 . $ <eq:parameter-sobolev>]

 Consequently, under the corresponding derivative bounds, rowwise choices of scales in a polynomial range cost
   powers of $log Z$, and rowwise choices of norm-twist heights of absolute value at most $T_1$ cost a fixed power
   of $1 + T_1$.]
  #emph[For $T_1 gt.eq 1$ and integers $J \, N gt.eq 0$,
#[#set math.equation(numbering: n => "(1.11)")
 $ integral_(\| bold(t) \| > T_1) \| hat(w) \( bold(t) \) \| \( 1 + \| bold(t) \| \)^J thin d bold(t) lt.eq
   T_1^(- N) parallel w parallel_(J + N \, upright("sep")) . $ <eq:late-fourier-tail>]

 With the Mellin convention $cal(M) W \( s \) = integral_0^oo W \( y \) y^s thin d y \/ y$, a pure twist obeys
$ cal(M) \[ W \( y \) y^(i omega) \] \( s \) = cal(M) W \( s + i omega \) . $

 Let $D_y = y partial_y$, let $I subset bb(R)$ be compact, and let $N gt.eq 0$ be an integer.
   Suppose the integrals below are finite and the boundary terms in $N$ logarithmic integrations by parts vanish.
   Then, uniformly for $sigma in I$ and $T in bb(R)$,
#[#set math.equation(numbering: n => "(1.12)")
 $ \| cal(M) W \( sigma + i T \) \| lt.double_(I \, N) \( 1 + \| T \| \)^(- N) sum_(j = 0)^N integral_0^oo
   y^sigma \| D_y^j W \( y \) \| thin frac(d y, y) . $ <eq:pointwise-mellin-tail>]

 These hypotheses hold for annular $W$ on every such $I$. They also hold when $W$ is smooth at zero and Schwartz
   at infinity and $I$ is a compact subset of $\( 0 \, oo \)$.
   In particular a horizontal contour join, whose imaginary coordinate is fixed,
   is estimated by this pointwise bound, not solely by the integrated tail in Equation (1.11).]
  #emph[The following joint version will also be useful. For measurable functions $a \( v \) \,
    b \( w \)$ for which the right side is finite, and integers $J \, N gt.eq 0$,
#[#set math.equation(numbering: n => "(1.13)")
 $ & integral_(bb(R)^2) e^(- \( T + v \)^2) \| a \( v \) b \( w \) \| \( 1 + \| T \| + \| v \| + \| w \| \)^J thin
   d v thin d w\
 & quad lt.double_(J \, N) \( 1 + \| T \| \)^(- N) sup_v \( 1 + \| v \| \)^(J + N) \| a \( v \) \|
   integral_(bb(R)) \( 1 + \| w \| \)^J \| b \( w \) \| thin d w . $ <eq:joint-gaussian-slice>]

 Thus the product of a Gaussian in the sum of two heights and rapidly decreasing Mellin transforms in the other
   two heights has rapid pointwise decay on a fixed-height slice.
   For integrated tails, the linear map $\( t_1 \, t_2 \, t_3 \)
   mapsto \( t_1 + t_2 \, t_2 \, t_3 \)$ is invertible, so all fixed weighted $L^1$ moments of this product also
   control complements of boxes in the original heights. Appending finitely many separating frequencies and fixed
   linear translations of these three arguments gives the same conclusion by a block triangular change of variables.]
  #emph[After translating a pure twist in the Mellin variable,
    a discarded separated integrand bounded by $Z^B \( 1 + \| bold(t) \| \)^J$ has absolute tail at most $Z^B
    T_1^(- N) parallel w parallel_(J + N \, upright("sep"))$. Here $B$ and $J$ must be fixed before $N$ is chosen.
    Further derivatives of a uniformly smooth separating profile change this last seminorm,
    not the previously fixed height order. On a join of bounded real length at height comparable to $T_1$,
    Equation (1.12) with order $N + ceil.l J ceil.r$ gives $Z^B
    T_1^(- N)$ times the corresponding finite weighted derivative norm of the external test,
    provided the other factors have the stated bound there. This is $O \( Z^B T_1^(- N) \)$ when those external
    norms are uniform.]
] <lem:smooth-calculus>

#proof[
  For an integer $m$ with $2 m > J + d$, integration by parts gives
  $ \( 1 + \| bold(t) \|^2 \)^m hat(w) \( bold(t) \) = integral_(bb(R)^d) \( 1 - Delta \)^m w_log \( bold(u) \)
    e^(- i bold(t) dot.op bold(u)) thin d bold(u) . $
  Its absolute value is bounded by the volume of $Omega$ times $C_(m \, d) p_(2 m) \( w \)$.
    The weighted integral is finite because $2 m > J + d$; one can choose $2 m lt.eq J + d + 2$.
    Fourier inversion gives the monomial formula. For row vectors $B \( bold(t) \)$ in $ell^2$,
    the precise inequality used there is
  $ ∥frac(1, \( 2 pi \)^d) integral hat(w) \( bold(t) \) B \( bold(t) \) thin d bold(t)∥_(ell^2) lt.eq
    frac(1, \( 2 pi \)^d) integral \| hat(w) \( bold(t) \) \| parallel B \( bold(t) \) parallel_(ell^2) thin d
    bold(t) . $
  In one dimension, the fundamental theorem of calculus, averaging a base point over the enlarged interval,
    and Cauchy–Schwarz give $sup_I \| F \|^2 lt.double
    integral_(I + \[ - 1 \, 1 \]) \( \| F \|^2 + \| F' \|^2 \)$.
    Applying this successively in each coordinate proves Equation (1.10).
    It can be summed over rows before the derivative integrals, since all terms are nonnegative.
    A logarithmic scale range of length $O \( log Z \)$ needs $O \( log Z \)$ unit intervals;
    a height range $\[ - T_1 \, T_1 \]$ needs $O \( 1 + T_1 \)$ intervals.
    Derivatives with respect to a logarithmic scale insert $y W' \( y \)$,
    together with the constant derivative of a central normalization.
    Derivatives of a normalized twist $y^(i t)$ insert powers of $log y$.
    These are again annular profiles with finite seminorm bounds.
    For example, if a fixed-parameter squared row bound is $O \( \( 1 + \| t \| \)^H \)$ and there are $d_t$
    height parameters, the covering and integration cost at most a fixed multiple of $\( 1 + T_1 \)^(H + d_t)$.
  On $\| bold(t) \| > T_1$ one has $\( 1 + \| bold(t) \| \)^(- N) lt.eq T_1^(- N)$, proving Equation (1.11).
    The Mellin shift is immediate from its definition. To prove Equation (1.12), put $F_sigma \( u \) =
    e^(sigma u) W \( e^u \)$. For $\| T \| gt.eq 1$, integration by parts gives
  $ cal(M) W \( sigma + i T \) = \( - i T \)^(- N) integral_(bb(R)) F_sigma^(\( N \)) \( u \) e^(i T u) thin d
    u \, wide F_sigma^(\( N \)) \( u \) = e^(sigma u) sum_(j = 0)^N binom(N, j) sigma^(N - j) D_y^j W \( e^u \) . $
  Taking absolute values gives the bound on a compact real strip.
    For $\| T \| < 1$, the absolute integral gives it after increasing the constant.
    The two stated classes of $W$ have the required endpoint decay:
    compact support suffices in the first case, while $e^(sigma u)$ at $- oo$ and Schwartz decay at $+
    oo$ suffice in the second.
  For Equation (1.13), use
  $ 1 + \| T \| lt.eq \( 1 + \| T + v \| \) \( 1 + \| v \| \) \, wide 1 + \| T \| + \| v \| + \| w \| lt.eq
    2 \( 1 + \| T + v \| \) \( 1 + \| v \| \) \( 1 + \| w \| \) . $
  Move $\( 1 + \| T \| \)^N$ to the left, bound the weighted $a \( v \)$ pointwise,
    and integrate the remaining polynomial weight against the Gaussian in $T + v$.
    The remaining $w$ integral is the one displayed. This proves the joint bound and also the asserted join
    estimate. For the integrated assertion, both the map $\( t_1 \, t_2 \, t_3 \)
    mapsto \( t_1 + t_2 \, t_2 \, t_3 \)$ and its inverse have fixed operator norm.
    A fixed polynomial weight in the original variables is therefore bounded by a fixed polynomial weight in the
    transformed ones. On a complement of a box one inserts the additional inverse power of that weight and
    integrates the Gaussian and the two Mellin factors separately.
    The appended block triangular map has the same property because all of its coefficients and those of its
    inverse are fixed.
  A kernel depending on a common product, such as $y_1 y_2$,
    gives the same norm power on both variables in the monomial formula;
    this preserves an equal-product-scale difference. A nonsmooth arithmetic mask has no such derivative bound and
    must instead be resolved before this lemma is applied. ◻
]

#thm([Lemma 1.7.])[
  (Gaussian annular decomposition).  #emph[Put
$ W_(upright(G)) \( y \) = frac(1, 2 sqrt(pi)) exp #scale(x: 120%, y: 120%)[\(] - 1 /
  4 \( log y \)^2 #scale(x: 120%, y: 120%)[\)] . $

 This function is not annular. Choose a fixed $chi in C_c^oo \( bb(R) \)$ such that $sum_(k in bb(Z))
   chi \( u - k \) = 1$, and define
$ W_(upright(G) \, k) \( y \) = W_(upright(G)) \( y \) chi \( log y - k \) \, wide w_k \( x \) =
  W_(upright(G)) \( e^k x \) chi \( log x \) . $

 The profiles $w_k$ have one fixed compact logarithmic support and, for every fixed $A gt.eq 0$ and integer $j gt.eq 0$,
#[#set math.equation(numbering: n => "(1.14)")
 $ sum_(k in bb(Z)) e^(A \| k \|) p_j \( w_k \) < oo . $ <eq:gaussian-annular-sum>]

 Consequently Lemma 9 may be applied on each annulus after $y = e^k x$,
   and the resulting weighted separation norms are summable.
   For fixed $kappa > 0$, $A \, B \, C_0 gt.eq 0$, and $M > 0$ one also has
$ Z^B sum_(\| k \| > kappa log Z - C_0) e^(A \| k \|) p_j \( w_k \) lt.double Z^(- M) wide \( Z arrow.r oo \) . $

 Directly, $cal(M) W_(upright(G)) \( s \) = e^(s^2)$, and the weighted logarithmic derivatives in Equation (1.12)
   are finite uniformly on every compact real strip.]
] <lem:gaussian-annular>

#proof[
  Such a partition is obtained by normalizing the integer translates of a nonnegative compactly supported smooth
    function positive on $\[ - 1 \/ 2 \, 1 \/ 2 \]$. Let $"supp" chi subset \[ - C \, C \]$.
    Each logarithmic derivative of $W_(upright(G)) \( e^k x \)$ is a polynomial in $k +
    log x$ times the same Gaussian. The product rule therefore gives
  $ p_j \( w_k \) lt.eq C_j \( 1 + \| k \| \)^j exp #scale(x: 120%, y: 120%)[\(] - 1 /
    4 \( \( \| k \| - C \)_(+) \)^2 #scale(x: 120%, y: 120%)[\)] . $
  This is summable after multiplication by $e^(A \| k \|)$ for every fixed $A$.
    The first assertion follows, and the separation norms follow from Lemma 9.
    In the profile’s logarithmic Fourier transform, rescaling an annulus inserts only the unit phase
    $e^(- i k t)$, so it does not change these norms; any real normalization of a surrounding polynomial remains
    explicit. On the indicated tail, the logarithm of the last bound after multiplication by $Z^B
    e^(A \| k \|)$ is at most $- c kappa^2 \( log Z \)^2 + O \( log Z \)$ for some fixed $c > 0$;
    summing the Gaussian tail proves the stated estimate for every $M$.
    Finally, set $u = log y$ and complete the square in its Gaussian integral to obtain $cal(M)
    W_(upright(G)) \( s \) = e^(s^2)$. The same Gaussian bounds every $e^(sigma u) \( d \/ d u \)^j
    W_(upright(G)) \( e^u \)$ in $L^1 \( bb(R) \)$, uniformly for $sigma$ in a compact interval. ◻
]

We record explicit finite-order continuity statements for the two types of kernels that accompany this separation.
  They make no assertion about an arithmetic transform; that transform must supply the stated kernel and its
  available real lines.

#thm([Lemma 1.8.])[
  (Finite seminorms for Fourier and Mellin kernels).  #emph[For a Schwartz function $f$ on $bb(R)^d$, put
$ s_j \( f \) = sum_(\| alpha \| \, \| beta \| lt.eq j) parallel x^alpha partial^beta f \( x \)
  parallel_(L^1 \( bb(R)^d \)) . $

 For every $A gt.eq 0$ and multi-index $beta$, the ordinary Fourier transform satisfies
$ sup_xi \( 1 + \| xi \| \)^A \| partial^beta hat(f) \( xi \) \| lt.double_(A \, beta \, d)
  s_(ceil.l A ceil.r + \| beta \|) \( f \) . $

 The same conclusion, with a fixed change in the constant,
   holds for any fixed nondegenerate linear Fourier pairing.
   For a radial transform written as $hat(f) \( xi \) = F \( \| xi \|^2 \)$, any prescribed bound
$ sup_(r gt.eq 0) \( 1 + r \)^A \| \( r partial_r \)^j F \( r \) \| $

 is therefore controlled by finitely many Schwartz seminorms of $f$.]
  #emph[For the Mellin assertion, let $m \( s \)$ be holomorphic on a fixed closed vertical strip and suppose,
    uniformly there, $\| m \( sigma + i t \) \| lt.eq C \( 1 + \| t \| \)^h$ for a fixed $h gt.eq 0$.
    On an available line $Re s = sigma$ in that strip define
$ K_W \( x \) = frac(1, 2 pi i) integral_(\( sigma \)) cal(M) W \( - s \) m \( s \) x^(- s) thin d s \, $

 where $W$ has the finite weighted logarithmic derivatives needed to make the integral absolutely convergent,
   with the boundary terms in the logarithmic integrations by parts vanishing. For every integer $j gt.eq 0$,
$ \| \( x partial_x \)^j K_W \( x \) \| lt.double x^(- sigma) integral_(bb(R)) \| cal(M)
  W \( - sigma - i t \) \| \( 1 + \| t \| \)^(h + j) thin d t . $

 The integral on the right is bounded by finitely many integrals of $y^(- sigma) \| \( y partial_y \)^k
   W \( y \) \| thin d y \/ y$, uniformly for $sigma$ in the fixed strip.
   For $W \( y \) y^(i omega)$ the same bound costs at most an additional factor $\( 1 + \| omega \| \)^(h + j)$.
   After multiplication by a fixed annular cutoff, these conclusions also bound every fixed logarithmic seminorm
   of $y mapsto K_W \( R y \)$, with the factor $R^(- sigma)$.]
] <lem:kernel-seminorms>

#proof[
  Differentiating $hat(f)$ inserts $x^beta$, and multiplication by a monomial in $xi$ differentiates $x^beta
    f$ before Fourier transformation. The $L^1$ bound for the Fourier transform, the product rule,
    and the bound of $\( 1 + \| xi \| \)^A$ by a finite sum of monomials of degrees at most $ceil.l A
    ceil.r$ give the first assertion. For a radial function, $r
    partial_r$ corresponds to $\( xi dot.op partial_xi \) \/ 2$.
    Expanding its $j$th power gives finitely many polynomial multiples of Fourier derivatives,
    so the first assertion gives the radial one. A fixed linear change of coordinates changes only its constants.
  For the Mellin assertion, differentiation under the absolutely convergent integral inserts $\( - s \)^j$.
    On the fixed strip this is bounded by a constant times $\( 1 + \| t \| \)^j$.
    Write $y = e^u$ and integrate the Fourier transform of $e^(- sigma u) W \( e^u \)$ by parts more than $h + j +
    1$ times. The product rule bounds the resulting $L^1$ derivatives by the stated weighted logarithmic
    derivatives, because $sigma$ ranges over a fixed set. For a pure twist the Mellin integrand is $cal(M)
    W \( - sigma - i t + i omega \)$. Substitute $v = t - omega$ and use $\( 1 + \| v + omega \| \)^(h + j)
    lt.eq \( 1 + \| v \| \)^(h + j) \( 1 + \| omega \| \)^(h + j)$.
    Finally the product rule for a fixed annular cutoff and the chain rule for $R y$ give the last statement. ◻
]

===== 1.2.4 Growth and logarithmic control for Hecke functions <growth-and-logarithmic-control-for-hecke-functions>

The disk estimate will be applied only after zeros have been excluded from that disk.
  The following elementary growth bound provides the input for the complex-analytic argument and makes clear which
  constants are uniform in the conductor. When $psi$ is a Hecke character,
  $L \( s \, psi \)$ abbreviates $L_F \( s \, psi \)$. In this subsection $Gamma \( s \)$ denotes Euler’s gamma
  function; the finite quadratic function $Gamma \( c \)$ was confined to the arithmetic identities above.

#thm([Lemma 1.9.])[
  (Hecke strip growth).  #emph[Let $psi$ be a primitive nonprincipal finite-order Hecke character of $F$,
    with conductor norm $Q$. Then
#[#set math.equation(numbering: n => "(1.15)")
 $ \| L \( sigma + i t \, psi \) \| lt.double Q^(3 \/ 5) \( 3 + \| t \| \)^2 \, wide - 1 \/ 10 lt.eq sigma lt.eq
   11 \/ 10 . $ <eq:hecke-growth>]

 For the principal character, the same bound with $Q = 1$ holds for $\( s - 1 \) zeta_F \( s \) \/ \( s + 1 \)$,
   with the removable value used at $s = 1$.]
] <lem:hecke-strip-growth>

#proof[
  A finite-order character has trivial infinite type, since $bb(C)^times$ is connected.
    The primitive Hecke functional equation in this case is
  $ Lambda \( s \, psi \) = \( 3 Q \)^(s \/ 2) \( 2 pi \)^(- s) Gamma \( s \) L \( s \, psi \) \, wide
    Lambda \( s \, psi \) = epsilon \( psi \) Lambda \( 1 - s \, overline(psi) \) \,
    quad \| epsilon \( psi \) \| = 1 . $
  This is the functional equation for primitive characters of trivial infinite type stated in [11] Equation (1.1);
    a nonprincipal $L \( s \, psi \)$ is entire. Absolute Euler convergence bounds $L \( 11 \/ 10 + i t \, psi \)$
    uniformly in $Q \, t$. Applying the functional equation and Stirling’s formula on $Re s = - 1 \/ 10$ gives
  $ \| L \( - 1 \/ 10 + i t \, psi \) \| lt.double Q^(3 \/ 5) \( 3 + \| t \| \)^(6 \/ 5) . $
  The estimate for bounded $t$ follows by continuity of the gamma quotient on that line,
    so the constant is uniform there as well.
  For completeness, the growth hypothesis needed to use the strip principle can be obtained directly from a
    lattice theta integral. Let $frak(f) = \( f \)$ be the conductor and define the periodic residue character
    $phi.alt \( a \) = psi \( \( a \) \)$ when $\( a \, frak(f) \) = 1$, with value zero otherwise.
    For the principal conductor $\( 1 \)$ put $phi.alt \( a \) = 1$ for all $a$, including $a = 0$.
    Since the ideal class group is trivial, conductor one has no nonprincipal character.
    Periodicity modulo $frak(f)$ follows from the ray character property;
    $phi.alt$ is trivial on the six units because $\( u \) = \( 1 \)$ for a unit. Thus, for $Re s > 1$,
  $ 6 pi^(- s) Gamma \( s \) L \( s \, psi \) = integral_0^oo #scale(x: 120%, y: 120%)[\(] Theta_phi.alt \( v \) -
    phi.alt \( 0 \) #scale(x: 120%, y: 120%)[\)] v^(s - 1) thin d v \, wide Theta_phi.alt \( v \) =
    sum_(a in cal(O)) phi.alt \( a \) e^(- pi v q_a) . $
  The factor six counts the generators of each ideal. If $hat(phi.alt) \( h \) =
    Q^(- 1) sum_(a med mod med f) phi.alt \( a \) e \( - h a \/ f \)$,
    finite Fourier inversion and Gaussian Poisson summation give
  $ Theta_phi.alt \( v \) = frac(2, sqrt(3) v) sum_(h med mod med f) hat(phi.alt) \( h \) sum_(b in cal(O)) exp
    (- frac(4 pi \| b - h \/ f \|^2, 3 v)) . $
  Changing the generator $f$ only reindexes the finite sum.
    For each fixed conductor, the nonzero dual vectors have a positive minimum length.
    With $A_phi.alt = 2 hat(phi.alt) \( 0 \) \/ sqrt(3)$, this proves
  $ Theta_phi.alt \( v \) = A_phi.alt v^(- 1) + O_phi.alt \( v^(- 1) e^(- c_phi.alt \/ v) \)
    quad \( 0 < v lt.eq 1 \) \, wide Theta_phi.alt \( v \) = phi.alt \( 0 \) +
    O_phi.alt \( e^(- c_phi.alt v) \) quad \( v gt.eq 1 \) $
  for some $c_phi.alt > 0$. Splitting the Mellin integral at one consequently gives
  $ 6 pi^(- s) Gamma \( s \) L \( s \, psi \) =  & frac(A_phi.alt, s - 1) - frac(phi.alt \( 0 \), s) +
    integral_0^1 #scale(x: 120%, y: 120%)[\(] Theta_phi.alt \( v \) -
    A_phi.alt \/ v #scale(x: 120%, y: 120%)[\)] v^(s - 1) thin d v\
 & + integral_1^oo #scale(x: 120%, y: 120%)[\(] Theta_phi.alt \( v \) -
   phi.alt \( 0 \) #scale(x: 120%, y: 120%)[\)] v^(s - 1) thin d v . $
  Both integrals are entire and bounded in height on each bounded real strip,
    with constants that may depend on the fixed conductor. Stirling’s formula for $1 \/
    Gamma \( s \)$ therefore gives at most exponential height growth for $L \( s \, psi \)$ on that strip.
    In the principal case the same conclusion holds after multiplication by $\( s - 1 \) \/ \( s + 1 \)$.
    Only this qualitative growth, for each fixed conductor, is used in the strip principle.
  To see explicitly that the fixed-conductor growth constants do not enter the uniform strip bound, put
  $ H_Q \( s \) = Q^(- 3 \/ 5) frac(L \( s \, psi \), \( s + 2 \)^2) . $
  It is holomorphic in the closed strip and is bounded by one absolute constant $C$ on both vertical boundary
    lines, by the bounds already proved. For $delta > 0$, apply the maximum principle on the rectangle of height
    $T$ to $H_Q \( s \) exp \( delta \( s - 1 \/ 2 \)^2 \)$. On the vertical sides the exponential has modulus at
    most $e^(9 delta \/ 25)$, because $\| Re s - 1 \/ 2 \| lt.eq 3 \/ 5$.
    On the horizontal sides its modulus is at most $e^(delta \( 9 \/ 25 - T^2 \))$,
    which tends to zero faster than the qualitative fixed-$Q$ exponential growth as $T arrow.r oo$.
    First let $T arrow.r oo$ for this fixed $Q \, delta$, and then let $delta arrow.b 0$.
    The result is $\| H_Q \( s \) \| lt.eq C$ throughout the strip, with the same constant for every $Q$.
    Multiplication by $Q^(3 \/ 5) \| s + 2 \|^2$ proves Equation (1.15).
  For the principal function, the factor $\( s - 1 \) \/ \( s + 1 \)$ removes its only pole in the strip and is
    bounded on the boundary. Its functional equation gives the same boundary bounds with $Q = 1$.
    This equation also follows from the preceding Poisson formula with $phi.alt = 1$:
    after writing $v = 2 t \/ sqrt(3)$, the theta relation is $Theta_phi.alt \( 2 t \/ sqrt(3) \) =
    t^(- 1) Theta_phi.alt \( 2 \/ \( sqrt(3) t \) \)$, whose split Mellin integral is invariant under $s mapsto
    1 - s$. Apply the same damped-rectangle argument to $\( s - 1 \)
    zeta_F \( s \) \/ \( \( s + 1 \) \( s + 2 \)^2 \)$. ◻
]

#thm([Lemma 1.10.])[
  (Logarithmic control).  #emph[Let $psi$ be a primitive nonprincipal finite-order Hecke character of conductor
    norm $Q$, and put $cal(L) \( s \) = L \( s \, psi \)$. For the principal character put $Q =
    1$ and $cal(L) \( s \) = \( s - 1 \) zeta_F \( s \) \/ \( s + 1 \)$, with its removable value at one.
    Fix $a in \[ 1 \/ 2 \, 1 \]$ and $0 < e < 10^(- 3)$. Suppose $cal(L)$ has no zero in the open disk of radius
    $2 - a - 2 e$ centered at $2 + i t$. Uniformly on the closed concentric disk of radius $2 - a - 6 e$,
#[#set math.equation(numbering: n => "(1.16)")
 $ \| cal(L) \( s \) \| + \| cal(L) \( s \)^(- 1) \| lt.double_(e \, epsilon.alt) { 2
   Q \( 3 + \| t \| \)^2 }^epsilon.alt . $ <eq:disk-control>]

 On the disk of radius $2 - a - 8 e$ one also has
$ \| cal(L)' \( s \) \/ cal(L) \( s \) \| lt.double_e log { 2 Q \( 3 + \| t \| \)^2 } . $

 In particular, for every fixed $b gt.eq beta_(*)$ and $v > 0$, these bounds hold on $Re s gt.eq b + v$,
   with constants depending on $v \, epsilon.alt$ (and with the height of $s$ in place of $t$).
   In the principal case the reciprocal bound passes to $1 \/ zeta_F$;
   the upper and logarithmic-derivative bounds are for the regularized function $cal(L)$.]
] <lem:logarithmic-control>

#proof[
  Write $R_j = 2 - a - j e$ and $cal(C) = 2 Q \( 3 + \| t \| \)^2$.
    All the disks used here lie in $Re s > 1 \/ 2$, where the principal regularizer is holomorphic.
    On the zero-free disk choose a holomorphic logarithm $g =
    log cal(L)$ whose value near the center is the Euler logarithm,
    together with the logarithm of the regularizing factor in the principal case.
    The value $g \( 2 + i t \)$ is uniformly bounded. Lemma 12 and Euler convergence to the right of $11 \/ 10$ give
  $ Re g \( s \) = log \| cal(L) \( s \) \| lt.double log cal(C) wide \( \| s - \( 2 + i t \) \| lt.eq R_3 \) . $
  The possible heights differ from $t$ by at most $3 \/ 2$, which is included in $cal(C)$.
    Borel–Carathéodory on radii $R_3 \, R_4$, whose difference is $e$,
    now gives $\| g \| lt.double_e log cal(C)$ on the disk of radius $R_4$.
  On the disk of fixed radius $r_0 = 49 \/ 100$, one has $Re s gt.eq 151 \/ 100 > 1$.
    The absolutely convergent Euler logarithm is uniformly bounded there.
    For the principal function the logarithm of $\( s - 1 \) \/ \( s + 1 \)$ is also bounded on this disk,
    using its branch in $Re s > 1$. Since $r_0 < R_6 < R_4$, Hadamard’s three-circles theorem applied to $g$ gives
  $ max_(\| s - \( 2 + i t \) \| lt.eq R_6) \| g \( s \) \| lt.double_e \( log cal(C) \)^theta \, wide theta =
    frac(log \( R_6 \/ r_0 \), log \( R_4 \/ r_0 \)) < 1 . $
  For fixed $e$, continuity on the compact interval $1 \/ 2 lt.eq a lt.eq
    1$ makes $theta$ uniformly smaller than one. For every $epsilon.alt > 0$,
    $exp \( C_e \( log cal(C) \)^theta \) lt.double_(e \, epsilon.alt) cal(C)^epsilon.alt$.
    Applying this to both $e^g$ and $e^(- g)$ proves Equation (1.16).
    Cauchy’s estimate between radii $R_6$ and $R_8$ gives the stated bound for $g' = cal(L)' \/ cal(L)$.
  For the global assertion first suppose $beta_(*) lt.eq b lt.eq 1$.
    Choose $0 < e < min \( 10^(- 3) \, v \/ 8 \)$ and put $a = b$.
    The disk of radius $R_2$ is contained in $Re s > b + 2 e > beta_(*)$,
    so it is zero-free by the definition of $beta_(*)$ and absolute Euler convergence beyond one.
    The disk of radius $R_8$ covers the points $b + v lt.eq Re s lt.eq 2$ at its center’s height;
    Euler convergence covers $Re s gt.eq 2$. The preceding constants are uniform in $b$.
    If $b > 1$, Euler convergence on $Re s gt.eq 1 + v$ suffices. Finally
  $ frac(1, zeta_F \( s \)) = frac(s - 1, s + 1) cal(L) \( s \)^(- 1) \, wide lr(|frac(s - 1, s + 1)|) lt.eq
    1 quad \( Re s gt.eq 0 \) \, $
  which proves the principal reciprocal assertion. ◻
]

#thm([Lemma 1.11.])[
  (Deleted Euler factors).  #emph[Let $R$ be a squarefree ideal and let $\| a_p \| lt.eq 1$ for $p divides R$.
    Put $D_R \( s \) = product_(p divides R) \( 1 - a_p q_p^(- s) \)$.
    For fixed $sigma_0 > 0$ and every $epsilon.alt > 0$,
$ \| D_R \( s \) \| + \| D_R \( s \)^(- 1) \| lt.double_(sigma_0 \, epsilon.alt) q_R^epsilon.alt
  wide \( Re s gt.eq sigma_0 \) . $

 On a bounded real strip one has, uniformly in the height,
$ \| D_R \( s \) \| lt.double_epsilon.alt q_R^(\( - Re s \)_(+) + epsilon.alt) \, wide
  lr(|frac(D'_R \( s \), D_R \( s \))|) lt.double_(sigma_0) log \( 2 q_R \) quad \( Re s gt.eq sigma_0 \) . $

 In particular a support $q_R lt.eq Z^B$ with bounded $B$ costs any prescribed positive power of $Z$ on a fixed
   positive real half-plane. For an imprimitive function $L \( s \, psi^(*) \) D_R \( s \)$,
   both the primitive conductor and the deletion radical $R$ must be included when applying logarithmic control.]
] <lem:deleted-euler-factors>

#proof[
  Every factor is nonzero on $Re s > 0$. For $Re s gt.eq sigma_0$,
    both its absolute value and the absolute value of its inverse are at most $\( 1 - q_p^(- sigma_0) \)^(- 1)$.
    For sufficiently large $q_p$, depending on $sigma_0 \, epsilon.alt$, $- log \( 1 - q_p^(- sigma_0) \) lt.eq
    epsilon.alt log q_p$. The finitely many smaller primes contribute a fixed constant.
    This proves the first estimate. For any real $sigma$,
  $ product_(p divides R) \( 1 + q_p^(- sigma) \) lt.eq q_R^(\( - sigma \)_(+)) 2^(\# { p : p divides R })
    lt.double_epsilon.alt q_R^(\( - sigma \)_(+) + epsilon.alt) . $
  The last inequality follows by separating the finitely many primes with $q_p < 2^(1 \/ epsilon.alt)$.
    Finally, logarithmic differentiation gives
  $ lr(|D'_R / D_R \( s \)|) lt.eq sum_(p divides R) frac(log q_p, q_p^(sigma_0) - 1) lt.double_(sigma_0)
    log \( 2 q_R \) . $
  If $q_R lt.eq Z^B$, choose the exponent in the first estimate smaller than the desired exponent of $Z$ divided
    by the bounded value of $B$; the case $B = 0$ is immediate.
    This proves the stated interpretation for deleted factors. ◻
]

==== 1.3 Completed cubic reflection and unmarked row energy <sec:completed-reflection>

This section first transforms a completed sum of Gauss coefficients while retaining every zero extension in its
  character. It then combines that identity with the quadratic large sieve to bound its mean square over arbitrary
  nonzero element rows. At equal row and completed lengths,
  the result is the bound $Z^(1 + epsilon.alt)$ needed in the balanced argument.

The theta function and its Fourier coefficients at three fixed cusps are the unconditional input from Dunn and
  Radziwiłł [8] Section 5 and Appendix A. The original coefficient and cusp calculations are in Patterson [24]
  Theorem 8.1 and Sections 7–8; the formal input here remains the formulas in [8].
  The finite transform below derives the masked formula, including its local factors and phase.
  The later mean-square argument uses this phase only after fixing its finite cusp sectors.

===== 1.3.1 The completed reflection <the-completed-reflection>

Write

$ caron(e) \( z \) = exp #scale(x: 120%, y: 120%)[\(] 2 pi i \( z + macron(z) \) #scale(x: 120%, y: 120%)[\)] \,
  wide e \( z \) = caron(e) \( z \/ lambda \) wide \( z in bb(C) \) . $

On $F$, the exponent in $caron(e)$ is $2 pi i "Tr"_(F \/ bb(Q)) z$.
  For every integer exponent, a power of a residue character is understood to be zero at a nonunit.
  In particular, $chi_p \( x \)^0 = 1_(p divides.not x)$.

#thm([Proposition 1.12.])[
  (Completed cubic reflection).  #emph[Fix a finite family $cal(X)$ of finite-ray characters whose conductors are
    supported on $S$. Choose one fixed integral modulus $frak(E)$ with prime support exactly $S$,
    divisible by every conductor in this family. On primary elements extend each member of $cal(X)$ by zero away
    from the $frak(E)$-units. Choose a single $L in cal(O) \\ { 0 }$ with prime support $S$,
    with $\( 18 \) divides \( L \)$ and $frak(E) divides \( L \)$, large enough that, for every $Psi_0 in cal(X)$,
    the function on $cal(O)$
$ phi.alt \( x \) =
  cases(delim: "{", chi_x \( lambda \)^2 Psi_0 \( x \) \, & x equiv 1 med \( mod med 3 \) \, med \( x \,
  frak(E) \) = 1 \,, 0 \, & upright("otherwise") \,) wide hat(phi.alt) \( h \) =
  q_L^(- 1) sum_(x med mod med L) phi.alt \( x \) e \( - h x \/ L \) $

 is $L$-periodic. The zero branch is evaluated without evaluating either character.
   Such a choice of $L$ exists by the cubic supplementary law and the ray periodicity, as verified below.
   Both $frak(E)$ and $L$ are fixed for the entire family before any moving prime is chosen.
   Fix a member $Psi_0 in cal(X)$ and put $frak(L) = \( L \)$.
   Let $cal(P)$ be any finite set of distinct primary primes not dividing $L$, choose $j_p in { 0 \, 1 \,
   dots.h \, 5 }$ for each $p in cal(P)$, and set, on primary elements,
$ Psi \( n \) = Psi_0 \( n \) product_(p in cal(P)) chi_p \( n \)^(j_p) . $

 No coprimality between the two variables in the following product is imposed:
$ D \( s \, Psi \) & = sum_(n equiv 1 med \( 3 \)\
\( n \, frak(E) \) = 1)^(upright("sf")) gamma_2 \( n \) macron(alpha) \( n \) Psi \( n \) q_n^(- s) \,\
L_0 \( s \, Psi \) & = sum_(b equiv 1 med \( 3 \)\
\( b \, frak(E) \) = 1) macron(alpha) \( b \)^3 Psi \( b \)^3 q_b^(- 3 s + 1 \/ 2) \, wide T \( s \, Psi \) =
  L_0 \( s \, Psi \) D \( s \, Psi \) . $

 Both series and their product converge absolutely for $Re s > 1$.]
  #emph[Let $X > 0$. Suppose that $V in C^oo \( 0 \, oo \)$ and that, for every $C > 0$ and every integer $j gt.eq
    0$, $\( x partial_x \)^j V \( x \)$ is $O_(C \, j) \( x^C \)$ as $x arrow.r
    0$ and $O_(C \, j) \( x^(- C) \)$ as $x arrow.r oo$. Define
$ hat(V) \( t \) = integral_0^oo V \( x \) x^t thin frac(d x, x) . $

 The smoothed expression to be transformed is the completed sum
$ & frac(1, 2 pi i) integral_(\( a \)) hat(V) \( s - 1 \/ 2 \) X^(s - 1 \/ 2) T \( s \, Psi \) thin d s\
 & quad = sum_(n med upright("sf") \, med b\
n \, b equiv 1 med \( 3 \)\
\( n b \, frak(E) \) = 1) frac(gamma_2 \( n \) overline(alpha \( n b^3 \)) Psi \( n b^3 \), sqrt(q_n) thin q_b) V
  #h(-0.16667em) (frac(q_n q_b^3, X)) \, wide a > 1 . $

 This equality follows by absolute convergence and Mellin inversion.
   The character acts on the whole index $n b^3$, with its zero values retained; $n$ and $b$ may share prime factors.]
  #emph[The reflected test is defined by
$ K = frac(\( 2 pi \)^4, 27) \, wide R \( t \) = product_plus.minus
  frac(Gamma \( 1 + t plus.minus 1 \/ 6 \), Gamma \( 1 - t plus.minus 1 \/ 6 \)) \, $

$ V^sharp \( x \) = frac(1, 2 pi i) integral_(\( sigma \)) hat(V) \( - t \) R \( t \) \( K x \)^(- t) thin d t
  wide \( sigma gt.eq 0 \) . $

 The integral defining $V^sharp$ is absolutely convergent and is independent of $sigma gt.eq 0$.]
  #emph[The product $T$ has an entire continuation. On every fixed vertical strip it has polynomial growth,
    with constants allowed to depend on $L \, Psi_0 \, cal(P) \, \( j_p \)$ and the strip.
    There is one fixed triple of cusp coefficient functions from $lambda^(- 4) cal(O) \\ { 0 }$ to $bb(C)$,
    constructed from the theta expansions in the proof. The same triple is used for all choices of the arithmetic
    data, scale, and test profile. For each fixed arithmetic choice above, there is a finite family of terms,
    indexed as in (1), independent of $X$, $V$, and the contour parameter $a > 1$.
    In each term, $d$ is selected from this triple and $theta.alt$ is an additive character of $cal(O)$ modulo a
    fixed modulus depending only on $L$; their sectorwise dependence is exactly that stated in (3),
    and the remaining data have properties (1)–(3). For these terms and every $a > 1$, the identity is
#[#set math.equation(numbering: n => "(1.17)")
 $ & frac(1, 2 pi i) integral_(\( a \)) hat(V) \( s - 1 \/ 2 \) X^(s - 1 \/ 2) T \( s \, Psi \) thin d s\
 & quad = sum_(upright("terms")) zeta sum_(0 eq.not mu in lambda^(- 4) cal(O))
   frac(d \( mu \) alpha \( mu \) theta.alt \( lambda^4 mu \), sqrt(q_mu)) product_(p med upright("active"))
   B_p \( lambda^4 mu \) V^sharp #h(-0.16667em) (frac(q_mu X, q_c^2)) . $ <eq:reflection>]

 Every inner sum is absolutely convergent. The terms have the following precise properties.]
  + #emph[A term is specified by $h_0 med mod med L$ and a subset of active primes.
    Every $p$ with $j_p eq.not 0$ is active, while a prime with $j_p = 0$ may be active or inactive.
    Write $r = product_(p med upright("active")) p$. Then $c = c_F r$,
    where $c_F$ is the reduced denominator of $lambda^2 h_0 \/ L$, with a normalizing unit.
    Thus $c_F$ ranges over a fixed finite set and its prime divisors divide $L$.
    There are $O_(frak(L)) \( 2^(\| cal(P) \|) \)$ terms, or $O_(frak(L)) \( 4^(\| cal(P) \|) \)$ after splitting
    each Ramanujan factor in the next display into its two summands.]
  + #emph[The local column factors are
$ B_p \( x \) =
  cases(delim: "{", chi_p \( x \)^(- j_p - 2) \, & j_p eq.not 0 \, 4 \,, q_p^(- 1 \/ 2) \( - 1 + q_p 1_(p divides
  x) \) \, & j_p = 4 \,, q_p^(- 1 \/ 2) chi_p \( x \)^(- 2) \, & j_p = 0 upright(" and ") p upright(" is active") .) $

 The function $d$ is one of three fixed cusp coefficient functions.
   Writing $u$ for an Eisenstein unit, their support and size satisfy
#[#set math.equation(numbering: n => "(1.18)")
 $ "supp" d subset { u lambda^k n b^3 : k gt.eq - 4 \, med n \, b equiv 1 med \( mod med 3 \) \, med n med
   upright("sf") } \, wide \| d \( mu \) \| lt.eq 27 thin 3^(k \/ 6) \| b \| . $ <old-eq:4.3>]

 The bound refers to the displayed representation of a supported index.
   It permits common primes of $n$ and $b$, and it imposes no exclusion at the primes of $L$ other than the
   displayed restriction at $lambda$. The character $theta.alt$ is an additive character of a quotient of $cal(O)$
   by a fixed modulus depending only on $L$.]
  + #emph[The scalar $zeta$ is independent of $mu$ and satisfies $\| zeta \| lt.eq 1 \/ 81$.
    Its moving-prime dependence can be specified exactly. For $m equiv.not 0 med \( mod med 6 \)$, put
$ tau_(p \, m)^plus.minus = q_p^(- 1 \/ 2) sum_(y med mod med p) chi_p \( y \)^m e \( plus.minus y \/ p \) \,
  wide \| tau_(p \, m)^plus.minus \| = 1 . $

 For each active $p$, define units modulo $p$ by
$ sigma_p = lambda^2 c \/ p \, wide epsilon.alt_p = - #scale(x: 120%, y: 120%)[\(] \( lambda^3 c \/ p \) sigma_p
  #scale(x: 120%, y: 120%)[\)]^(- 1) \, $

 and put
$ omega_(p \, j) =
  cases(delim: "{", tau_(p \, j)^(-) tau_(p \, j + 2)^(+) chi_p \( epsilon.alt_p \)^(- j - 2) \, & j eq.not 0 \,
  4 \,, tau_(p \, 4)^(-) \, & j = 4 \,, - tau_(p \, 2)^(+) chi_p \( epsilon.alt_p \)^(- 2) \, & j = 0 .) $

 The indices of $tau$ are read modulo six. With $M = lambda^12 L^4$,
   there is a number $kappa_F$ of absolute value one, depending only on $h_0$ and the class of $r$ modulo $M^2$,
   such that
#[#set math.equation(numbering: n => "(1.19)")
 $ zeta = - i / 81 macron(alpha) \( c \)^2 hat(phi.alt) \( h_0 \) macron(kappa)_F
   product_(p med upright("inactive")) \( 1 - q_p^(- 1) \) product_(p med upright("active"))
   chi_p \( sigma_p \)^(- 2) omega_(p \, j_p) . $ <eq:reflection-row-phase>]

 In each of the finitely many classes of $h_0$ and $r med mod med M^2$, both $d$ and $theta.alt$ are fixed.
   Consequently these are common column factors within that sector.
   Apart from the displayed scale $q_c^2$, all other moving-prime dependence outside the $B_p$ is in the scalar
   $zeta$, which may depend on the whole active set.]
    #emph[The branch conventions are simultaneous for all local prime sets with the same $L$ and $Psi_0$.
      In particular, if a good prime $p$ is added to the local set with exponent zero and is declared inactive,
      the resulting branch has the same $c_F \, c \, d \, theta.alt \, kappa_F$,
      the same data at every other active prime, and the same kernel as the branch in which $p$ is absent.
      Its scalar is multiplied by $1 - q_p^(- 1)$. This compatibility includes every $h_0$,
      not only the unit classes modulo $L$.]
  #emph[#emph[Bounds for the transformed test.] For $A gt.eq 0$ and an integer $B gt.eq 0$, put
$ frak(M)_(A \, B) \( V \) = sup_(- A lt.eq eta lt.eq 1 \/ 4) integral_(bb(R)) \( 1 + \| u \| \)^B \|
  hat(V) \( eta + i u \) \| thin d u . $

 For every integer $j gt.eq 0$,
#[#set math.equation(numbering: n => "(1.20)")
 $ \| \( x partial_x \)^j V^sharp \( x \) \| lt.double_(A \, j) min { x^(1 \/ 4) \, \( 1 + x \)^(- A) }
   frak(M)_(A \, ceil.l 4 A ceil.r + j + 2) \( V \) . $ <eq:reflection-kernel>]

 If $chi in C_c^oo \( 0 \, oo \)$ is fixed, $Y > 0$, and $J gt.eq 0$ is an integer, then
#[#set math.equation(numbering: n => "(1.21)")
 $ integral_(bb(R)) \( 1 + \| u \| \)^J lr(|integral_0^oo chi \( y \) V^sharp \( Y y \) y^(- i u) frac(d y, y)|) d
   u lt.double_(A \, J \, chi) min { Y^(1 \/ 4) \, \( 1 + Y \)^(- A) }
   frak(M)_(A \, ceil.l 4 A ceil.r + J + 4) \( V \) . $ <eq:reflection-annular-fourier>]

 These are finite smooth seminorms. More precisely,
#[#set math.equation(numbering: n => "(1.22)")
 $ frak(M)_(A \, B) \( V \) lt.double_(A \, B) integral_0^oo \( 1 + x^(- A) + x^(1 \/ 4) \)
   #scale(x: 120%, y: 120%)[\(] \| V \( x \) \| + \| \( x partial_x \)^(B + 2) V \( x \) \|
   #scale(x: 120%, y: 120%)[\)] frac(d x, x) . $ <eq:reflection-test-seminorm>]

 Replacing $V \( x \)$ by $x^(i u_0) V \( x \)$ multiplies $frak(M)_(A \, B)$ by at most $\( 1 + \| u_0 \| \)^B$.]
] <prop:completed-reflection>

#proof[
  We first express the character masks through finitely many translated theta values.
    We then transform their rational cusps and compute the resulting automorphy multipliers and local Fourier
    factors; the final Mellin comparison gives the reflection identity and the bounds for its transformed test.
  #emph[The fixed theta input.] Let $Gamma = upright("SL")_2 \( cal(O) \)$, $Gamma_1 \( 3 \) = { g in Gamma :
    g equiv I med \( mod med 3 \) }$, and $Gamma_2 = chevron.l upright("SL")_2 \( bb(Z) \) \,
    Gamma_1 \( 3 \) chevron.r$. The unconditional formulas of [8] Equations (5.4), (5.7), (5.9),
    and (5.12)–(5.17) give a smooth cubic theta function $theta$ on $bb(H)^3 = bb(C) times bb(R)_(> 0)$ with
  $ theta \( g w \) = kappa \( g \) theta \( w \) quad \( g in Gamma_2 \) \, wide
    kappa #h(-0.16667em) mat(delim: "(", a, b; c, delta') = (c / a)_3 quad
    (mat(delim: "(", a, b; c, delta') in Gamma_1 \( 3 \) \, med c eq.not 0) . $
  Here $kappa$ is one on $upright("SL")_2 \( bb(Z) \)$ and is one on an element of $Gamma_1 \( 3 \)$ with lower
    left entry zero. The subscript $3$ denotes the ordinary cubic residue symbol; for a good prime $p in.not S$,
    one has $\( x \/ p \)_3 = chi_p \( x \)^2$. These automorphy and coefficient formulas have no hypothesis about
    zeros of $L$-functions.
  Put
  $ sans(L) \( t \) = mat(delim: "(", 1, 0; t, 1) \, wide \( t_0 \, t_1 \, t_2 \) = \( 0 \, omega^2 \, omega \) \,
    wide Theta_b \( w \) = theta \( sans(L) \( t_b \) w \) . $
  If $v in bb(Z) + 3 cal(O)$, then $sans(L) \( v \)$ is a product of an element of $upright("SL")_2 \( bb(Z) \)$
    and a lower translation in $Gamma_1 \( 3 \)$ with multiplier one.
    The analogous assertion holds for upper translations. Therefore
  $ theta \( sans(L) \( lambda \) w \) = Theta_1 \( w \) \, wide theta \( sans(L) \( - lambda \) w \) =
    Theta_2 \( w \) \, $
  because $lambda - omega^2 = 2 + 3 omega$ and $- lambda - omega = - 1 - 3 omega$.
    If $u_0 = s + t omega$ with $0 lt.eq s \, t < 3$, and $E = mat(delim: "(", 0, - 1; 1, 0)$, then
  $ mat(delim: "(", u_0, - 1; 1, 0) = E sans(L) \( - u_0 \) \, wide - u_0 - t_t in bb(Z) + 3 cal(O) \, $
  and hence $theta #scale(x: 120%, y: 120%)[\(] mat(delim: "(", u_0, - 1; 1, 0) w #scale(x: 120%, y: 120%)[\)] =
    Theta_t \( w \)$. These are the only cusp representatives needed below.
  For any of them, define $d_H$ by
  #[#set math.equation(numbering: n => "(1.23)")
   $ macron(theta) \( H \( z \, v \) \) = C_H \( v \) + sum_(mu eq.not 0) d_H \( mu \) v
     K_(1 \/ 3) \( 4 pi \| mu \| v \) caron(e) \( mu z \) . $ <eq:reflection-cusp-expansion>]
  Here $C_H \( v \)$ is independent of $z$. The three functions $Theta_0 \, Theta_1 \,
    Theta_2$ are respectively $F_1 \, F_19 \, F_10$ in [8]. Its Appendix A, rows $1 \, 19 \, 10$,
    expresses their coefficients in terms of $tau \, tau_1 \, tau_2$ in its Equations (5.7), (5.13), and (5.14).
    In their notation the conjugate expansion uses $overline(d_j \( - mu \))$, as in their Equation (5.16).
    Those formulas give the support inclusion in Equation (1.18).
    For completeness, the two possible magnitudes from $tau$ at $mu = u lambda^k n b^3$ are
  $ 3^(k \/ 6 + 8 \/ 3) \| b \| quad upright("and") quad 3^(k \/ 6 + 3) \| b \| \, $
  and $tau_1 \, tau_2$ have magnitude $9 \| b \|$ and $k = - 4$.
    Here the Gauss sums use only the cubic symbol, including at primes in $S$.
    To make their domain explicit, for every primary squarefree $n$ define, as in [8] Equation (1.7),
  #[#set math.equation(numbering: n => "(1.24)")
   $ tilde(g)_3 \( n \) = q_n^(- 1 \/ 2) sum_(v med mod med n) (v / n)_3 caron(e) \( v \/ n \) \, wide
     tilde(g)_3 \( 1 \) = 1 . $ <eq:reflection-cubic-source-gauss>]
  The ordinary cubic symbol is defined at every prime other than $lambda$ and is extended by zero on nonunits and
    multiplicatively in the denominator. Every primary $n$ is prime to $lambda$.
    At each prime divisor of $n$ the cubic character is nontrivial, and $caron(e) \( v \/ n \) =
    e \( lambda v \/ n \)$ is primitive because $lambda$ is a unit there.
    The finite-field Gauss identity and the Chinese remainder theorem therefore give $\| tilde(g)_3 \( n \) \| =
    1$ for every such squarefree $n$. This includes the primary prime $- 2$ of norm $4$;
    no sextic character with that denominator is used. Also, whenever $\( t \, n \) = 1$,
    the change of variable $y = t v$ gives
  $ q_n^(- 1 \/ 2) sum_(v med mod med n) (v / n)_3 caron(e) \( t v \/ n \) = (t / n)_3^(- 1) tilde(g)_3 \( n \) . $
  This covers the twists $t = lambda^2 \, omega lambda^2 \,
    omega^2 lambda^2$ in the other source coefficient families.
    Thus the unnormalized Gauss sums occurring in all three cusp families have magnitude $\| n \|$.
    Consequently each coefficient magnitude displayed above is at most $27 thin 3^(k \/ 6) \| b \|$,
    including $k = - 4$. The formulas require only that $n$ be squarefree and that $n \, b$ be primary;
    they do not require $\( n \, b \) = 1$. Prime valuations of $n
    b^3$ also show that its representation by such $n \, b$, when it exists, is unique.
    In particular the same bound is valid when the variables share primes or contain primes excluded from the
    primal sums.
  At infinity the condition $x = lambda^3 mu equiv 1 med \( mod med 3 \)$ isolates exactly $mu =
    lambda^(- 3) n b^3$ with $n \, b$ primary and $n$ squarefree.
    The infinity support has $lambda^3 mu in cal(O)$; every other ramified exponent in Equation (5.7) of [8] makes
    $x$ divisible by $lambda$, and the negative sign in the remaining pair gives $x equiv -
    1 med \( mod med 3 \)$. At the isolated index the coefficient in $macron(theta)$ is
  #[#set math.equation(numbering: n => "(1.25)")
   $ d_I \( lambda^(- 3) n b^3 \) = 3^(5 \/ 2) \| b \| tilde(g)_3 \( n \) . $ <eq:reflection-infinity-coefficient>]
  This is the unmasked source formula, valid for every primary squarefree $n$ and every primary $b$,
    with no coprimality condition between them. Only when $\( n \, S \) =
    1$ may it be expressed in the global sextic notation: substituting $y = lambda v$ in $gamma_2 \( n \)$ gives
  #[#set math.equation(numbering: n => "(1.26)")
   $ tilde(g)_3 \( n \) = (lambda / n)_3^(- 1) gamma_2 \( n \) =
     chi_n \( lambda \)^(- 2) gamma_2 \( n \) wide \( \( n \, S \) = 1 \) . $ <eq:reflection-cubic-sextic-conversion>]
  The cubic supplementary laws in [8] Equation (1.5) make $\( lambda \/ x \)_3$ periodic on all primary $x$ modulo
    $9$. On primary elements prime to $S$ it equals $chi_x \( lambda \)^2$.
    A character in $cal(X)$ is periodic on primary elements prime to $frak(E)$ modulo its conductor,
    and the zero condition $\( x \, frak(E) \) eq.not 1$ is periodic modulo $frak(E)$.
    Thus a sufficiently divisible $L$ with prime support $S$ works for every member of the fixed finite family.
    This verifies its choice before the moving local primes are selected.
  #emph[Finite Fourier inversion with the zero extensions.] For $j in { 0 \, dots.h \, 5 }$ define
  $ C_(p \, j) \( h \) = q_p^(- 1) sum_(x med mod med p) chi_p \( x \)^j e \( - h x \/ p \) . $
  The character pairing furnished by $e$ is nondegenerate on $cal(O) \/ \( p \)$.
    Changing variables in a Gauss sum, and using the orthogonality of a nontrivial multiplicative character, gives
  #[#set math.equation(numbering: n => "(1.27)")
   $ C_(p \, j) \( h \) =
     cases(delim: "{", q_p^(- 1 \/ 2) tau_(p \, j)^(-) chi_p \( h \)^(- j) \, & j eq.not 0 \, med h eq.not 0 \,,
     0 \, & j eq.not 0 \, med h = 0 \,, - q_p^(- 1) \, & j = 0 \, med h eq.not 0 \,, 1 - q_p^(- 1) \, & j = 0 \,
     med h = 0 .) $ <eq:reflection-local-fourier>]
  Here and below $h = 0$ means $h equiv 0 med \( mod med p \)$.
    Each nontrivial power of $chi_p$ is primitive modulo the prime $p$,
    so the usual finite-field Gauss-sum identity gives $\| tau_(p \, m)^plus.minus \| = 1$.
  Fourier inversion on $cal(O) \/ \( L \)$ and on each $cal(O) \/ \( p \)$ now gives
  $ phi.alt \( x \) product_p chi_p \( x \)^(j_p) = sum_h C \( h \) e #h(-0.16667em)
    (x (h_0 \/ L + sum_p h_p \/ p)) \, wide C \( h \) = hat(phi.alt) \( h_0 \) product_p C_(p \, j_p) \( h_p \) . $
  This uses every additive frequency, including nonunit $h_0$ and zero local frequencies.
    We do not invoke the twisted formula in [8] Lemma 5.2 and Corollary 5.1,
    whose unit-Fourier-support hypothesis need not hold for these masks.
    The theta function with this multiplier on its infinity coefficient $x = lambda^3 mu in cal(O)$ is the finite sum
  #[#set math.equation(numbering: n => "(1.28)")
   $ cal(F) \( z \, v \) = sum_h C \( h \) macron(theta) \( z + z_h \, v \) \, wide z_h =
     lambda^2 (h_0 \/ L + sum_p h_p \/ p) . $ <eq:reflection-translated-theta>]
  For an isolated infinity index $x = n b^3$, the piecewise definition of $phi.alt$ first discards every term for
    which $\( n b \, frak(E) \) eq.not 1$. This is a mask on the whole completed index:
    $\( n b^3 \, frak(E) \) = 1$ if and only if both $n$ and $b$ are $frak(E)$-units.
    Only on that remaining domain do we use complete multiplicativity, including $chi_b \( lambda \)^6 = 1$, to write
  $ phi.alt \( n b^3 \) product_p chi_p \( n b^3 \)^(j_p) =
    chi_n \( lambda \)^2 Psi \( n \) Psi \( b \)^3 wide \( \( n b \, frak(E) \) = 1 \) . $
  It remains true when $n \, b$ share a moving prime, since the corresponding local powers retain their zero
    values, including for $j_p = 0$. For the discarded terms the completed coefficient is defined to be zero
    directly; no value of $chi_n \( lambda \)$ is evaluated there.
    Combining Equations (1.25) and (1.26) on the retained domain now identifies the direct Mellin series with the
    product $T$. The dual coefficient functions $d_H$ keep the full source support in Equation (1.18);
    no $S$-mask is placed on them.
  Fix $h_0$ and declare $p$ active precisely when $h_p eq.not 0$.
    Equation (1.27) forces all primes with $j_p eq.not 0$ to be active.
    Choose once for each $h_0 med mod med L$ a representative and a reduced expression $lambda^2 h_0 \/ L =
    a_F \/ c_F$. Multiplying numerator and denominator by one unit,
    normalize the numerator to be $1 med \( mod med 3 \)$ if $lambda divides c_F$ and the denominator to be $1
    med \( mod med 3 \)$ otherwise. Since every active prime is primary, this unit depends only on $h_0$.
    For $r = product_(p med upright("active")) p$, Equation (1.28) then gives
  #[#set math.equation(numbering: n => "(1.29)")
   $ z_h = a / c \, wide c = c_F r \, wide a = a_F r + lambda^2 c_F sum_(p divides r) \( r \/ p \) h_p .
     $ <eq:reflection-cusp-fraction>]
  At a prime dividing $c_F$, the numerator is congruent to $a_F r$ and is a unit.
    At $p divides r$, it is congruent to $lambda^2 c_F \( r \/ p \) h_p$ and is again a unit.
    Thus this fraction is reduced, even when $h_0$ is a nonunit modulo $L$. The empty product $r = 1$ is allowed.
    Replacing any lift by another changes $z_h$ by an element of $lambda^2 cal(O) = 3 cal(O)$, a period of $theta$.
  #emph[Choice of the cusp matrix and its multiplier.] The next construction determines the automorphy multiplier
    and reflected additive phase for each reduced cusp fraction just obtained. Set $M = lambda^12 L^4$.
    For every active $p$, the Chinese remainder theorem permits the chosen nonzero class $h_p med mod med
    p$ to be lifted with $h_p equiv 0 med \( mod med M^2 \)$. Restrict $r$ to one class modulo $M^2$.
    Equation (1.29) shows that $a$ is then fixed modulo $M c_F$;
    in fact its moving terms are divisible by $M^2 c_F$, and $a_F r$ is fixed modulo $M^2$,
    which is divisible by $M c_F$ because $c_F$ divides $L$ up to a unit.
    It also shows $a equiv 1 med \( mod med 3 \)$ if $lambda divides c$, and $c equiv 1 med \( mod med 3 \)$ otherwise.
  Choose $delta'$ by the following compatible local congruences:
  $ delta' equiv a^(- 1) med \( mod med M c_F \) & upright("at every prime dividing ") c_F \,\
delta' equiv 0 med \( mod med M \) & upright("at every prime dividing ") M upright(" but not ") c_F \,\
delta' equiv a^(- 1) med \( mod med p \) & \( p divides r \) . $
  The first line means the indicated prime-power parts of $M c_F$. All inverses exist because $a \/ c$ is reduced.
    Put $b = \( a delta' - 1 \) \/ c$ and $g = mat(delim: "(", a, b; c, delta')$.
    Then $g in Gamma$, and division of $a delta' - 1$ by $c$ gives
  $ b equiv 0 med \( mod med M \) upright(" at primes of ") c_F \, wide b equiv -
    c^(- 1) med \( mod med M \) upright(" at the other primes of ") M . $
  Consequently $a \, b \, c \, delta'$ have fixed residues at the needed powers of every prime dividing $L$,
    independent of the classes $h_p$. Whenever a zero entry would occur in a residue-symbol calculation,
    one may first translate $z_h$ by $lambda^2 M^2 cal(O)$ and then add a multiple of the combined congruence
    modulus to $delta'$. These changes preserve all displayed congruences and avoid the finitely many values
    making an entry zero. They do not change the translated theta function.
  There are three cases, distinguished by $v_lambda \( c \)$. If $3 divides c$, put $H = I$.
    Then $G = g in Gamma_1 \( 3 \)$, and cubic reciprocity for the primary $a$ and the primary primes of $r$ gives
  #[#set math.equation(numbering: n => "(1.30)")
   $ kappa \( G \) = (c_F / a)_3 (a / r)_3 . $ <eq:reflection-cusp-case-zero>]
  If $v_lambda \( c \) = 1$, take the unique $u_0 in { lambda \, - lambda }$ with $u_0 equiv
    c med \( mod med 3 \)$ and put $H = sans(L) \( u_0 \)$; these are the two possibilities because
    $cal(O) \/ \( lambda \) tilde.eq bb(F)_3$. The congruences above show that $G = g H^(- 1) in Gamma_1 \( 3 \)$.
    Write $A = a - u_0 b$. Both $A$ and $a$ are primary, and they are coprime:
    $\( a \, b \) = 1$ and $\( a \, u_0 \) = 1$. The determinant equation gives
  $ a \( c - u_0 delta' \) = c A - u_0 \, wide b c equiv - 1 med \( mod med a \) . $
  It follows, by cubic reciprocity for $a \, A$, that
  $ kappa \( G \) & = (frac(- u_0, A))_3 (a / A)_3^(- 1)\
 & = (frac(- u_0, A))_3 (frac(c \/ u_0, a))_3 = (frac(- u_0, A))_3 (frac(c_F \/ u_0, a))_3 (a / r)_3 . $
  For the second equality,
    reduce $A$ modulo $a$ and use $\( A \/ a \)_3 = \( - u_0 b \/ a \)_3 = \( u_0 \/ a \)_3 \( c \/ a \)_3^(- 1)$;
    the cubic symbol of $- 1$ is one. Finally suppose $\( lambda \, c \) = 1$.
    Choose $u_0 = s + t omega equiv a med \( mod med 3 \)$ with $0 lt.eq s \, t < 3$ and put $H =
    mat(delim: "(", u_0, - 1; 1, 0)$. Here $c equiv 1$, $delta' equiv 0$, and $b equiv - 1 med \( mod med 3 \)$, so
  $ G = g H^(- 1) = mat(delim: "(", - b, a + b u_0; - delta', c + delta' u_0) in Gamma_1 \( 3 \) . $
  Both $- b$ and $c$ are primary. Moreover $- b c = 1 - a delta' equiv 1 med \( mod med 9 \)$.
    Factor $delta' = u lambda^k delta_0$ with $delta_0$ primary.
    The supplementary laws make $\( u lambda^k \/ \( 1 - a delta' \) \)_3 = 1$;
    cubic reciprocity makes $\( delta_0 \/ \( 1 - a delta' \) \)_3 =
    1$ because the numerator after reciprocity is $1 med \( mod med delta_0 \)$. Thus
  $ (frac(delta', - b c))_3 = 1 \, wide kappa \( G \) = (frac(delta', - b))_3 = (delta' / c)_3^(- 1) = (a / c)_3 =
    (a / c_F)_3 (a / r)_3 . $
  The last inverse uses $a delta' equiv 1 med \( mod med c \)$.
  In all three cases we have proved
  #[#set math.equation(numbering: n => "(1.31)")
   $ kappa \( G \) = kappa_F product_(p divides r) chi_p \( a \)^2 \, wide \| kappa_F \| =
     1 . $ <eq:reflection-multiplier>]
  The factor $kappa_F$ is constant as the active $h_p$ vary in the fixed sector.
    If $3 divides c$, it is $\( c_F \/ a \)_3$: the unit and $lambda$-power factors are determined by $a med
    mod med 9$, and reciprocity determines the remaining fixed-prime factors from the residue of $a$ at the primes
    of $c_F$. In the middle case it is $\( - u_0 \/ A \)_3 \( \( c_F \/ u_0 \) \/ a \)_3$,
    determined in the same way by the fixed residues of $A = a - u_0 b$ and $a$.
    In the last case it is $\( a \/ c_F \)_3$, which is determined directly by the fixed denominator $c_F$ and $a
    med mod med c_F$. The displayed congruences for $a \, b \, c \,
    delta'$ therefore determine $kappa_F$ using only $h_0$ and $r med mod med M^2$.
    They also determine the chosen one of the three functions $Theta_b$.
  #emph[The reflected additive phase.] Write $x = lambda^4 mu$ and $D_F = lambda^3 c_F$.
    At each $p divides r$, Equation (1.29) gives $a equiv sigma_p h_p med \( mod med p \)$.
    Hence $delta' equiv sigma_p^(- 1) h_p^(- 1) med \( mod med p \)$.
    Additive Chinese remaindering for the coprime factors of $D_F r$ gives the exact identity
  #[#set math.equation(numbering: n => "(1.32)")
   $ caron(e) \( - delta' mu \/ c \) & = e \( - delta' x \/ \( D_F r \) \)\
 & = theta.alt \( x \) product_(p divides r) e \( epsilon.alt_p h_p^(- 1) x \/ p \) \, wide theta.alt \( x \) =
   e \( - delta'_F r^(- 1) x \/ D_F \) . $ <eq:reflection-additive-phase>]
  Here $delta'_F$ is the class of $delta'$ modulo $D_F$, and $r^(- 1)$ in the formula for $theta.alt$ is taken
    modulo $D_F$. For example, the local numerator at $p$ is $- delta' \( D_F r \/ p \)^(- 1) =
    epsilon.alt_p h_p^(- 1)$; this verifies the signs and the powers of $lambda$.
    The chosen congruences fix $delta'_F$, since $D_F$ divides the corresponding local moduli,
    and the sector fixes $r^(- 1) med mod med D_F$. A common multiple of the finitely many $D_F$ is therefore a
    fixed modulus for all the characters $theta.alt$.
  Conjugating Equation (1.31) contributes $macron(kappa)_F product_(p divides r) chi_p \( sigma_p \)^(- 2)
    chi_p \( h_p \)^(- 2)$. For $j eq.not 0$, multiplication by Equation (1.27) leaves the local sum
  $ q_p^(- 1 \/ 2) tau_(p \, j)^(-) sum_(h eq.not 0) chi_p \( h \)^(- j - 2) e \( epsilon.alt_p h^(- 1) x \/ p \) . $
  Upon putting $y = h^(- 1)$, the sum is a Gauss sum of exponent $j + 2$.
    If $j eq.not 4$, its value is $q_p^(1 \/ 2) tau_(p \, j + 2)^(+) chi_p \( epsilon.alt_p x \)^(- j - 2)$,
    also at $p divides x$ because both sides then vanish. If $j = 4$, it is the Ramanujan sum
  $ sum_(y eq.not 0) e \( epsilon.alt_p x y \/ p \) = - 1 + q_p 1_(p divides x) . $
  For an active $j = 0$, the same substitution gives
  $ - q_p^(- 1) sum_(h eq.not 0) chi_p \( h \)^(- 2) e \( epsilon.alt_p h^(- 1) x \/ p \) = -
    q_p^(- 1 \/ 2) tau_(p \, 2)^(+) chi_p \( epsilon.alt_p x \)^(- 2) . $
  These are exactly $omega_(p \, j) B_p \( x \)$; an inactive zero exponent contributes $1 - q_p^(- 1)$.
    This proves every local factor, including its zero extension.
    The choices of $h_0$ and the active subset give at most $q_L 2^(\# { p : j_p = 0 })$ terms.
    Splitting the $j_p = 4$ factors multiplies this by at most $2^(\# { p : j_p = 4 })$, proving the stated counts.
  The denominator and the fixed-sector data constructed before these local sums depend on the local prime set only
    through $h_0$ and the active radical $r$; the remaining active-frequency dependence is exactly the local
    dependence just summed. We use the same representatives and normalized fractions for each $h_0$,
    and the same fixed-sector choices of cusp function, fixed additive character,
    and $kappa_F$ whenever those data recur. An absent prime and an inactive zero-exponent prime have the same
    active radical; their other active $sigma_p \, epsilon.alt_p$ are therefore also identical.
    The inactive coefficient $1 - q_p^(- 1)$ is the only change.
    This proves the simultaneous branch compatibility in the statement.
  The marked reflection in Section 3.2 will use the following dependence on pairs of active primes. Since
  $ epsilon.alt_p = - lambda^(- 5) \( c \/ p \)^(- 2) med \( mod med p \) \, $
  there is a scalar $xi_(p \, j)$ of absolute value one, depending on $p \, j$ but on no other active prime such that
  #[#set math.equation(numbering: n => "(1.33)")
   $ chi_p \( sigma_p \)^(- 2) omega_(p \, j) = xi_(p \, j) chi_p \( c \/ p \)^(2 j + 2) .
     $ <eq:reflection-cross-prime-phase>]
  For $j = 4$ this uses $2 j + 2 equiv - 2 med \( mod med 6 \)$;
    for the other exponents it follows immediately by inserting the expression for $epsilon.alt_p$.
    Thus the contribution of another active prime to the phase at $p$ has exponent exactly $2 j + 2$ modulo six.
    In particular an active exponent $j = 1$ has column coupling $chi_p \( x \)^(- 3) = chi_p \( x \)^3$.
  #emph[Mellin normalization and continuation.] Let
  $ J \( s \) = integral_0^oo partial_(macron(z)) cal(F) \( z \, v \)\|_(z = 0) v^(2 s - 1) thin d v . $
  The Bessel identity used in [8] Lemma 5.3 is
  $ integral_0^oo K_(1 \/ 3) \( y \) y^(w - 1) thin d y = 2^(w - 2) Gamma \( \( w - 1 \/ 3 \) \/ 2 \)
    Gamma \( \( w + 1 \/ 3 \) \/ 2 \) wide \( Re w > 1 \/ 3 \) . $
  On $Re s > 1$ the coefficient sums converge absolutely, so we may differentiate and integrate their expansions
    term by term. Since $partial_(macron(z)) caron(e) \( mu z \) = 2 pi i macron(mu) caron(e) \( mu z \)$,
    the identity with $w = 2 s + 1$ gives
  $ J \( s \) = i / 4 \( 2 pi \)^(- 2 s) Gamma \( s + 1 \/ 3 \) Gamma \( s + 2 \/ 3 \)
    sum_(0 eq.not mu in lambda^(- 3) cal(O)) d_I \( mu \) phi.alt \( lambda^3 mu \) product_p
    chi_p \( lambda^3 mu \)^(j_p) macron(alpha) \( mu \) q_mu^(- s) . $
  First use the whole-index mask to restrict to $\( n b \, frak(E) \) = 1$ as above,
    then insert Equations (1.25) and (1.26). Using $q_(lambda^(- 3)) =
    27^(- 1)$ and $macron(alpha) \( lambda^(- 3) \) = - i$ gives
  #[#set math.equation(numbering: n => "(1.34)")
   $ J \( s \) = 3^(5 \/ 2) / 4 (frac(27, \( 2 pi \)^2))^s Gamma \( s + 1 \/ 3 \) Gamma \( s + 2 \/ 3 \)
     T \( s \, Psi \) . $ <eq:reflection-direct-mellin>]
  For one translated term $z_h = a \/ c$, use the matrix $g = G H$ constructed above.
    The coordinate action of $g^(- 1)$ on hyperbolic space, from [8] Equation (5.1), gives
  $ g^(- 1) \( z + a \/ c \, v \) =
    (- delta' / c - frac(macron(z), c^2 \( v^2 + \| z \|^2 \)) \, frac(v, q_c \( v^2 + \| z \|^2 \))) . $
  At $z = 0$, the derivative of its first coordinate with respect to $macron(z)$ is $- \( c v \)^(- 2)$;
    the derivatives of its conjugate coordinate and of its vertical coordinate with respect to $macron(z)$ are
    zero. The chain rule and $macron(theta) \( g w \) = macron(kappa) \( G \) macron(theta) \( H w \)$ therefore give
  $ partial_(macron(z)) macron(theta) \( z + a \/ c \, v \)\|_(z = 0) = -
    frac(macron(kappa) \( G \), c^2 v^2) partial_z
    macron(theta) \( H \( z \, 1 \/ \( q_c v \) \) \)\|_(z = - delta' \/ c) . $
  In particular the derivative removes $C_H \( v \)$ from every cusp expansion in Equation (1.23).
    Substituting that expansion and then $v mapsto 1 \/ \( q_c v \)$ in the integral gives, for $Re s < 0$,
    the contribution
  #[#set math.equation(numbering: n => "(1.35)")
   $ - i / 4 \( 2 pi \)^(2 s - 2) macron(alpha) \( c \)^2 q_c^(1 - 2 s) macron(kappa) \( G \) product_plus.minus
     Gamma \( 3 \/ 2 - s plus.minus 1 \/ 6 \)\
 times sum_(mu eq.not 0) d_H \( mu \) alpha \( mu \) caron(e) \( - delta' mu \/ c \) q_mu^(- \( 1 - s \)) .
   $ <eq:reflection-reflected-mellin>]
  To verify the scalar directly, before applying the Bessel integral the factor is $-
    2 pi i c^(- 2) q_c^(2 - 2 s)$ and the remaining integral is $integral_0^oo u^(2 - 2 s)
    K_(1 \/ 3) \( 4 pi \| mu \| u \) thin d u$. The Bessel identity with $w = 3 - 2 s$, together with $c^(- 2) =
    macron(alpha) \( c \)^2 \/ q_c$, gives exactly the display.
  We justify both the continuation and the contour operations here.
    The coefficient bound in Equation (1.18) implies absolute convergence of the reflected series when
    $Re \( 1 - s \) > 1$: the separate majorants are
  $ sum_n^(upright("sf")) q_n^(- \( 1 - Re s \)) \, wide sum_b q_b^(1 \/ 2 - 3 \( 1 - Re s \)) \, wide
    sum_(k gt.eq - 4) 3^(k \( 1 \/ 6 - \( 1 - Re s \) \)) . $
  Each converges in that region. The fixed support has a positive lower bound for $\| mu \|$.
    The exponential decay of $K_(1 \/ 3)$ and of all its derivatives, the coefficient bound,
    and the direct expansion imply exponential decay at $v arrow.r
    oo$ for every logarithmic derivative of each translated derivative.
    The chain-rule formula just obtained implies exponential decay at $v arrow.r 0$ as well,
    with constants depending on the fixed translated term. Repeated integration by parts in $log
    v$ now shows that $J$ is entire and decreases faster than every power of $\| Im s \|$ on each fixed strip.
  Equation (1.34), with reciprocal gamma functions on its right, continues $T$ to an entire function.
    Its direct series is bounded on any line to the right of $1$.
    Equation (1.35) and Stirling’s formula give a polynomial bound on any line to the left of $0$;
    the exponential parts of the two gamma products cancel. On a strip between such lines,
    the rapid bound for $J$ and the reciprocal gamma factors first give $\| T \( sigma + i t \) \|
    lt.double \( 1 + \| t \| \)^C e^(pi \| t \|)$ for some $C$.
    Divide $T$ by a sufficiently large power of $B + s$, with $B$ chosen so that $B + s$ has no zero on the strip,
    and multiply by $e^(epsilon s^2)$. The horizontal sides of a growing rectangle tend to zero for each
    $epsilon > 0$. The maximum principle, followed by $epsilon arrow.r 0$,
    transfers the polynomial bounds on the two vertical sides to the strip.
    This proves the stated polynomial strip growth.
  Shift the integral on the left of Equation (1.17) from $Re s = a$ to $Re s = 1 \/ 2 -
    sigma < 0$ with $sigma > 1 \/ 2$. The entire continuation, polynomial strip bound,
    and rapid Mellin decay justify the shift: Equation (1.12) applied to the weighted logarithmic derivatives of
    $V$ makes the horizontal joins tend to zero. Inserting Equation (1.35) divided by Equation (1.34),
    and putting $t = 1 \/ 2 - s$, gives the gamma quotient $R \( t \)$ and the factor
  $ - i / 81 macron(alpha) \( c \)^2 q_mu^(- 1 \/ 2) (frac(K q_mu X, q_c^2))^(- t) . $
  Indeed $\( 2 pi \)^(4 s - 2) 27^(- s) 3^(- 5 \/ 2) = 3^(- 4) K^(- t)$ and $q_c^(1 - 2 s) q_mu^(s - 1) =
    q_mu^(- 1 \/ 2) \( q_mu \/ q_c^2 \)^(- t)$. The reflected coefficient series is absolutely convergent on this
    line, so it may be interchanged with the integral. Summing its finite local factors using Equation (1.32) and
    the computed Gauss sums proves Equation (1.17) and Equation (1.19).
    Since $\| phi.alt \| lt.eq 1$, we have $\| hat(phi.alt) \( h_0 \) \| lt.eq 1$;
    every other factor in the scalar has absolute value at most one. This proves $\| zeta \| lt.eq 1 \/ 81$.
  #emph[Uniform estimates for the transformed test.] The first negative pole of the numerator of $R \( t \)$ is $-
    5 \/ 6$. The reciprocal denominator gamma functions are entire.
    Hence the integrand defining $V^sharp$ is holomorphic for $Re t > - 5 \/ 6$.
    On $- 1 \/ 4 lt.eq sigma lt.eq A$, Stirling’s formula gives
  $ \| R \( sigma + i u \) \| lt.double_A \( 1 + \| u \| \)^(4 sigma) . $
  The estimate is uniform also for bounded $u$, since this closed strip has no numerator pole.
    Equation (1.12) makes $hat(V)$ rapidly decreasing pointwise on every vertical strip.
    Rectangular contour shifts are therefore valid within $- 1 \/ 4 lt.eq Re t lt.eq A$,
    including between any two nonnegative lines. Applying $\( x partial_x \)^j$ contributes $\( - t \)^j$.
    The three lines $- 1 \/ 4 \, 0 \, A$ bound the resulting integral respectively by constant multiples of
  $ x^(1 \/ 4) frak(M)_(A \, ceil.l 4 A ceil.r + j + 2) \( V \) \, quad
    frak(M)_(A \, ceil.l 4 A ceil.r + j + 2) \( V \) \, quad x^(- A)
    frak(M)_(A \, ceil.l 4 A ceil.r + j + 2) \( V \) . $
  Combining them proves Equation (1.20). The rapid large-$x$ bound, with $A$ arbitrarily large,
    also makes every dual sum in Equation (1.17) absolutely convergent when $V^sharp$ is represented on the zero
    line. Thus the shift of the kernel contour does not require a termwise shift of a conditionally convergent
    Dirichlet series.
  For Equation (1.21), set $f_Y \( v \) = chi \( e^v \) V^sharp \( Y e^v \)$.
    This is supported on a fixed compact interval. Integrating its Fourier transform by parts $J +
    2$ times and using the trivial bound for $\| u \| lt.eq 1$ gives
  $ integral_(bb(R)) \( 1 + \| u \| \)^J \| hat(f)_Y \( u \) \| thin d u lt.double_J sum_(j = 0)^(J + 2) parallel
    f_Y^(\( j \)) parallel_(L^1 \( bb(R) \)) . $
  Leibniz’s rule and Equation (1.20) bound each norm by the right side of Equation (1.21),
    because $e^v$ stays in a fixed compact subinterval of $\( 0 \, oo \)$.
    Finally, for $\| u \| gt.eq 1$, $B + 2$ integrations by parts give
  $ \| hat(V) \( eta + i u \) \| lt.eq \| eta + i u \|^(- B - 2) integral_0^oo \| \( x partial_x \)^(B + 2)
    V \( x \) \| x^eta frac(d x, x) . $
  For $\| u \| lt.eq 1$ use the corresponding undifferentiated integral.
    On $- A lt.eq eta lt.eq 1 \/ 4$, $x^eta lt.eq 1 + x^(- A) + x^(1 \/ 4)$, proving Equation (1.22).
    The identity $accent(x^(i u_0) V, ̂) \( eta + i u \) = hat(V) \( eta + i \( u + u_0 \) \)$ and $1 + \| u \|
    lt.eq \( 1 + \| u + u_0 \| \) \( 1 + \| u_0 \| \)$ give the asserted norm-twist bound.
    In particular the Gaussian test $V \( x \) = \( 2 sqrt(pi) \)^(- 1) exp \( - \( log x \)^2 \/ 4 \)$,
    whose Mellin transform is $e^(t^2)$, satisfies the hypotheses of this Proposition directly. ◻
]

===== 1.3.2 Element rows and fixed sectors <element-rows-and-fixed-sectors>

To apply the reflection to a character $A mapsto chi_A \( m \)$,
  we separate the fixed supplementary phases from the good prime divisors of the row.
  The separation retains the zero at every shared good prime.

#thm([Lemma 1.13.])[
  (Fixed ray sectors for nonzero rows).  #emph[Let $Psi_(upright("base"))$ range over a fixed finite family of
    finite-ray characters with conductors supported on $S$, extended by zero off the primary elements prime to
    $S$. Use the fixed generators $pi_(frak(l))$ for $frak(l) in S$ from Lemma 5.
    For $0 eq.not m in cal(O)$, write uniquely
$ m = u m_S m_(upright("good")) \, wide m_S = product_(frak(l) in S) pi_(frak(l))^(v_(frak(l)) \( m \)) \, wide
  m_(upright("good")) = product_(p in.not S) p^(v_p \( m \)) \, $

 where the good prime generators are primary and $u$ is a unit. On every primary element $A$ prime to $S$ one has
#[#set math.equation(numbering: n => "(1.36)")
 $ chi_A \( m \) = chi_A \( u m_S \) cal(R) \( A \, m_(upright("good")) \) product_(p divides m_(upright("good")))
   chi_p \( A \)^(v_p \( m \)) . $ <eq:reflection-row-reduction>]

 All powers on the right retain their zero values, including when $v_p \( m \) equiv 0 med \( mod med 6 \)$.
   Fix $u$, the valuations $v_(frak(l)) \( m \)$ modulo six,
   and the class of $m_(upright("good"))$ in the fixed ray group through which $cal(R)$ factors. In such a sector define
#[#set math.equation(numbering: n => "(1.37)")
 $ Psi_0^(\[ m \]) \( A \) =
   cases(delim: "{", Psi_(upright("base")) \( A \) chi_A \( u m_S \) cal(R) \( A \, m_(upright("good")) \) \, & A
   equiv 1 med \( mod med 3 \) \, med \( A \, S \) = 1 \,, 0 \, & upright("otherwise") .)
   $ <eq:reflection-sector-character>]

 The nonzero branch is a member of a fixed finite family of finite-ray characters with conductors supported on
   $S$. Therefore a single $frak(E) \, L$ in Proposition 15 works for all these sectors.
   The local prime set contains every $p divides m_(upright("good"))$, with exponent $v_p \( m \)$ modulo six,
   even when this exponent is zero. No moving good prime is absorbed into $L$.]
] <lem:reflection-row-sectors>

#proof[
  If $\( A \, m_(upright("good")) \) = 1$, multiplicativity and the symmetric reciprocity factor in Lemma 8 give
    Equation (1.36). If a good prime is shared, both sides are zero:
    the left side is the zero extension of $chi_A \( m \)$, and its local factor on the right is zero even for a
    six-divisible exponent. This proves the identity on the entire stated domain.
  On this domain $chi_A \( u m_S \)$ depends only on $u$ and the $S$-valuations modulo six,
    because every numerator factor is a unit modulo $A$. For each of the finitely many representatives $d =
    u product_(frak(l) in S) pi_(frak(l))^(e_(frak(l)))$, $0 lt.eq e_(frak(l)) < 6$,
    Lemma 5 identifies $A mapsto chi_A \( d \)$ with a finite-ray character whose conductor is supported at primes
    over $6 d$, all in $S$. Once the good ray class is fixed,
    $A mapsto cal(R) \( A \, m_(upright("good")) \)$ is one of a fixed finite family of characters supported at
    the primes over $2 \, 3$. Their products with the finite family of base characters give the asserted fixed
    family. Choosing a common multiple of its conductors and the $S$-mask gives the common $frak(E)$ and then $L$.
    Additional good local residue-symbol factors in a completed coefficient are placed in $cal(P)$ and combined at
    a shared prime with the same zero convention; they do not alter this fixed modulus.
    The argument requires $m eq.not 0$ and makes no local-prime assertion for the row $m = 0$. ◻
]

===== 1.3.3 Common profiles and lattice tails <common-profiles-and-lattice-tails>

The reflected series has a scale depending on its row. We keep that dependence inside one joint smooth profile
  until after Fourier inversion; this gives one coefficient measure for the whole row norm.

#thm([Lemma 1.14.])[
  (Common annular kernel profile).  #emph[Let $V$ satisfy the hypotheses of Proposition 15.
    Fix an integer $d gt.eq 1$, a compact set $Omega subset bb(R)^d$, and real exponents $a_1 \, dots.h \, a_d$.
    Let $W$ be one smooth profile with logarithmic support in $Omega$, common to all rows in a given block,
    and let $Y > 0$ be fixed within that block. Put
$ h \( bold(y) \) = product_(i = 1)^d y_i^(a_i) \, wide F_Y \( bold(y) \) =
  W \( bold(y) \) V^sharp \( Y h \( bold(y) \) \) \, wide frak(m)_A \( Y \) =
  min { Y^(1 \/ 4) \, \( 1 + Y \)^(- A) } . $

 For $A gt.eq 0$ and integers $j \, J gt.eq 0$,
#[#set math.equation(numbering: n => "(1.38)")
 $ p_j \( F_Y \) & lt.double_(A \, j \, d \, Omega \, bold(a)) frak(m)_A \( Y \) p_j \( W \)
   frak(M)_(A \, ceil.l 4 A ceil.r + j + 2) \( V \) \,\
parallel F_Y parallel_(J \, upright("sep")) & lt.double_(A \, J \, d \, Omega \, bold(a)) frak(m)_A \( Y \)
  p_(J + d + 2) \( W \) frak(M)_(A \, ceil.l 4 A ceil.r + J + d + 4) \( V \) . $ <eq:reflection-common-profile>]

 Here $p_j$ is the homogeneous seminorm of a single profile, not the inhomogeneous seminorm of a tuple.
   The constants are independent of $Y$ and of the actual norm labels within the block.]
] <lem:reflection-common-profile>

#proof[
  On the support of $W$, the monomial $h$ is bounded above and below by positive constants depending only on
    $Omega$ and the exponents. Each operator $y_i partial_(y_i)$ acting on $V^sharp \( Y h \( bold(y) \) \)$ is
    $a_i$ times the Euler derivative of $V^sharp$ at $Y h \( bold(y) \)$. It produces no additional power of $Y$.
    Leibniz’s rule and Equation (1.20) prove Equation (1.38).
    Applying Lemma 9 with $j = J + d + 2$ gives Equation (1.38). ◻
]

Here is the norm consequence, including its order of operations.
  Let $cal(I)$ be the original row set, and suppose a row vector $cal(U)$ is linear in the whole profile $F_Y$.
  The profile includes the cutoffs for the full fixed logarithmic boxes of its row and column norm variables.
  Assume that simultaneous logarithmic Fourier inversion expresses the vector using one density common to every
  row. After the relevant arithmetic coefficient independences have been verified, write $F_Y =
  frak(m)_A \( Y \) tilde(F)_Y$. Minkowski gives

#[#set math.equation(numbering: n => "(1.39)")
 $ parallel cal(U) parallel_(ell^2 \( cal(I) \)) lt.eq frac(frak(m)_A \( Y \), \( 2 pi \)^d) integral_(bb(R)^d) \|
   hat(tilde(F)_Y) \( bold(t) \) \| parallel B \( bold(t) \) parallel_(ell^2 \( cal(I) \)) thin d bold(t) .
   $ <eq:reflection-common-minkowski>]

Here $B \( bold(t) \)$ is the separated row vector, whose norm powers all have absolute value one.
  The identity underlying this inequality is a Bochner integral in $ell^2 \( cal(I) \)$;
  the finite separation norm above ensures its absolute integrability whenever the separated norm has the stated
  polynomial height growth. Uniform bounds for densities chosen separately for individual rows would not give this
  identity. Only inside the nonnegative norm on the right may the row set subsequently be enlarged,
  using the same separated formula for $B$ on the added rows.
  No comparison of the kernel argument with $Y$ is asserted on the added rows.
  Squaring this inequality gives the factor $frak(m)_A \( Y \)^2$.
  If only the small-argument bound is being used, the same argument permits the weaker scalar $min { 1 \,
  Y^(1 \/ 4) }$, whose square is $min { 1 \, Y^(1 \/ 2) }$.
  The normalized profile has bounded tuple seminorms; they are not claimed to be small,
  since the tuple seminorm includes a constant one. A kernel occurring once in an already expanded quadratic
  expression instead contributes its scalar once, not automatically its square.

The Gaussian test in Proposition 15 is directly admissible there and in Lemma 17:
  only the joint factor $W$ in the latter lemma needs compact logarithmic support.
  If the compact-support calculus is instead applied to the Gaussian itself,
  Lemma 10 supplies the required absolutely summable annular decomposition.

#thm([Lemma 1.15.])[
  (Lattice kernel tails).  #emph[Let $Lambda$ be either $cal(O)$ or $lambda^(- 4) cal(O)$.
    Suppose $K : \( 0 \, oo \) arrow.r bb(C)$ satisfies $\| K \( x \) \| lt.eq C_A x^(- A)$ for $x gt.eq 1$,
    where $A > 1$. Then, for $a > 0$ and $U gt.eq 1$,
#[#set math.equation(numbering: n => "(1.40)")
 $ sum_(0 eq.not mu in Lambda\
a q_mu > U) \| K \( a q_mu \) \| lt.double_A C_A \( 1 + a^(- 1) \) U^(1 - A) . $ <eq:lattice-kernel-tail>]

 For $K = V^sharp$ one may take $C_A lt.double_A frak(M)_(A \, ceil.l 4 A ceil.r + 2) \( V \)$.]
] <lem:lattice-kernel-tail>

#proof[
  The shell $2^j U < a q_mu lt.eq 2^(j + 1) U$ contains $O \( 1 + 2^j U \/ a \)$ points of either fixed lattice.
    Its contribution is at most $C_A \( 1 + 2^j U \/ a \) \( 2^j U \)^(- A)$.
    Summing the two geometric series gives $O_A \( C_A \( U^(- A) + a^(- 1) U^(1 - A) \) \)$,
    which implies the display because $U gt.eq 1$. The last assertion follows from Equation (1.20). ◻
]

===== 1.3.4 A quadratic norm for completed indices <a-quadratic-norm-for-completed-indices>

The next estimate bounds the quadratic character left by reflection on a squarefree factor times a cube.
  We begin with the imported sieve. For squarefree primary ideals outside a fixed set containing the primes over
  $6$, the quadratic kernel $chi_a \( b \)^3$ satisfies

#[#set math.equation(numbering: n => "(1.41)")
 $ sum_(a med upright("sf")\
q_a lt.eq U) lr(|sum_(b med upright("sf")\
q_b lt.eq V) c_b chi_a \( b \)^3|)^2 lt.double_epsilon.alt \( U V \)^epsilon.alt \( U + V \) sum_b \| c_b \|^2 .
  $ <eq:quadratic-large-sieve>]

This is Goldmakher–Louvel’s quadratic large sieve [13] Definition 1 and Theorem 1.1.
  To verify its family hypotheses, let $theta.alt_a \( \( x \) \)$ denote the quadratic residue symbol evaluated
  at the primary generator of $\( x \)$. The adjustment of $x$ to its primary generator contributes
  $epsilon_lambda \( x \)^(e \( a \))$, where $epsilon_lambda$ is the nontrivial character modulo $lambda$ and
  $e \( a \) = \( q_a - 1 \) \/ 2 med mod med 2$. The powers of $omega$ contribute nothing because they are
  squares. CRT therefore gives exact primitive conductor $a lambda^(e \( a \))$ and trivial infinite type.
  We use the primitive inducing character: the displayed formula first specifies its restriction to the
  $lambda$-units, and the factor at $lambda$ is absent when $e \( a \) = 0$.
  This does not change any value on the indices in Equation (1.41).
  In a fixed primary square class modulo $4$, two indices have the same $e \( a \)$;
  for coprime such indices the primitive product has conductor exactly their product.
  The reciprocity factor is the fixed bicharacter $cal(R)$ of Equation (1.5).
  These are precisely the family conditions of the cited theorem.
  A finite ray partition and transpose duality give Equation (1.41) in the displayed orientation.

A fixed restriction on the row set decreases the positive outer sum.
  A fixed restriction on the coefficient support is implemented by setting the omitted coefficients to zero.
  Neither observation permits an arbitrary mask depending simultaneously on a row and a column.
  The next reduction resolves the collision mask produced by square factors of a completed index.

#thm([Lemma 1.16.])[
  (Quadratic reduction for completed indices).  #emph[Let $K \, N \, B gt.eq 1$.
    Let $cal(I)$ be any set of squarefree primary good ideals $k$ with $q_k lt.double K$.
    Let $n$ range over squarefree primary ideals with $q_n asymp N$,
    and let $b$ range over primary ideals with $q_b asymp B$.
    The ideals $n \, b$ may contain primes of $S$ other than $lambda$.
    Let $beta \( n \, b \)$ be arbitrary complex coefficients independent of $k$.
    Fixed restrictions on $cal(I)$ and fixed restrictions on the $\( n \, b \)$-support are allowed.]
  #emph[Write uniquely $b = g t^2$ with $g$ squarefree, and set $c = \( n \, g \)$, $n = c m$, $g = c h$.
    Thus $c \, m \, h$ are pairwise coprime and squarefree. Fix one set of dyadic ranges
$ q_c asymp C \, wide q_g asymp G \, wide q_t asymp T \, wide B asymp G T^2 \, $

 where all comparison constants are fixed. Let $cal(Q)_(C \, G \, T) \( beta \)$ be the sum over $k in
   cal(I)$ of the squared absolute value of the $\( n \, b \)$-sum restricted to this set of ranges,
   with summand $beta \( n \, b \) chi_k \( n b \)^3$. For a squarefree good ideal $r$ and a fixed $t$,
   let $cal(D)_r \( t \)$ be the set of triples $\( c' \, m \, h \)$ for which
$ c = r c' \, wide n = r c' m \, wide b = r c' h t^2 $

 belongs to the original support and to these ranges, with the stated squarefreeness and pairwise coprimality of
   $c \, m \, h$. Then
#[#set math.equation(numbering: n => "(1.42)")
 $ cal(Q)_(C \, G \, T) \( beta \) lt.double_epsilon.alt  & \( K N B \)^epsilon.alt T sum_(q_t asymp T) med
   sum_(r med upright("sf") \, med \( r \, S \) = 1\
q_r lt.double min \( K \, C \)) (K / q_r + frac(N G, C^2)) C /
  q_r sum_(\( c' \, m \, h \) in cal(D)_r \( t \)) \| beta \( r c' m \, r c' h t^2 \) \|^2 .
  $ <eq:completed-quadratic-reduction>]

 Empty quotient ranges contribute zero; all bounded ranges, including the unit ideal,
   are included by the fixed comparison constants. Fixed ray sectors and bounded row scalars are permitted.
   In particular, if $\| beta \( n \, b \) \| lt.eq 1$, then
#[#set math.equation(numbering: n => "(1.43)")
 $ sum_(k in cal(I)) lr(|sum_(n \, b) beta \( n \, b \) chi_k \( n b \)^3|)^2
   lt.double_epsilon.alt \( K N B \)^epsilon.alt \( K + N B \) N B . $ <eq:completed-quadratic-norm>]

 The constants may depend on the fixed support comparisons and on $S$,
   but are uniform in the coefficients and in the permitted support restrictions.]
] <lem:completed-quadratic-reduction>

#proof[
  The factorization $b = g t^2$ permits $g$ and $t$ to share primes.
    Since $n b = c^2 m h t^2$, the zero convention gives the exact identity
  #[#set math.equation(numbering: n => "(1.44)")
   $ chi_k \( n b \)^3 = chi_k \( m h \)^3 thin 1_(\( k \, c t \) = 1) . $ <eq:completed-quadratic-zero-mask>]
  Indeed a square has sixth power under the displayed quadratic character;
    this is one on units and zero at a collision. The identity therefore also holds when $n$ or $g$ shares a prime
    with $t$.
  For the chosen ranges there are $O \( T \)$ possible $t$. Hilbert-space Cauchy gives
  $ ∥sum_(q_t asymp T) F_t∥_2^2 lt.double T sum_(q_t asymp T) parallel F_t parallel_2^2 . $
  Fix $t$ in the positive sum. The condition $\( k \, t \) = 1$ is now a fixed row restriction.
    For the remaining condition use the full identity
  $ 1_(\( k \, c \) = 1) = sum_(r divides \( k \, c \)) mu \( r \) . $
  For each $k$ the number of possible $r$ is at most $d_(cal(O)) \( k \)$.
    Rowwise Cauchy followed by summation over $k$ costs $\( K N B \)^epsilon.alt$ and gives a positive sum over
    fixed squarefree good $r$. Write $k = r k'$ and $c = r c'$.
    Squarefreeness gives the fixed row restriction $\( k' \, r \) =
    1$ and the coefficient restriction $\( c' \, r \) = 1$; terms with $\( r \, t \) > 1$ vanish,
    and otherwise $\( k' \, t \) = 1$ is another fixed row restriction.
    There is no remaining $\( k' \, c' \)$ condition in an individual $r$-summand:
    the full collision mask was already expanded. A fixed ray sector for $k$ becomes a fixed sector for $k'$ once
    $r$ is fixed.
  The factor $chi_r \( m h \)^3$ is a bounded column factor.
    Split the squarefree parts of $m \, h$ supported on $S$ from their good parts:
    $m = m_S m_(upright(g))$ and $h = h_S h_(upright(g))$. There are only finitely many choices of $m_S \, h_S$.
    Their symbols are bounded row factors, while $j = m_(upright(g)) h_(upright(g))$ is squarefree and good,
    of norm $O \( N G \/ C^2 \)$. For fixed $r \, t \, m_S \, h_S$, group the remaining columns by $j$.
    If $C_j$ is the resulting coefficient, the quadratic large sieve gives
  $ sum_(k') lr(|sum_j C_j chi_(k') \( j \)^3|)^2 lt.double_epsilon.alt \( K N B \)^epsilon.alt
    (K / q_r + frac(N G, C^2)) sum_j \| C_j \|^2 . $
  The outer sum may retain all its fixed restrictions. On a nonempty range,
    both quotient lengths in the last display are bounded below by a fixed positive constant;
    replacing them by their maxima with one changes only the comparison constant.
  For each $j$, the number of factorizations into $m_(upright(g)) \, h_(upright(g))$ is divisor-bounded.
    There are $O \( C \/ q_r \)$ possible $c'$ in its range. Cauchy over these two choices therefore gives
  $ sum_j \| C_j \|^2 lt.double_epsilon.alt \( K N B \)^epsilon.alt C /
    q_r sum_(\( c' \, m \, h \) in cal(D)_r \( t \)) \| beta \( r c' m \, r c' h t^2 \) \|^2 . $
  The bounded column factor from $chi_r$ has been discarded only in this positive sum.
    The fixed bad-part symbols were row factors of unit modulus and were removed from the outer modulus before
    applying the sieve. The ideals $m \, h$ here are the original ideals,
    reconstructed from their fixed $S$-parts; the $S$-part of $c'$ is untouched.
    Combining the displays proves Equation (1.42).
  Suppose now $\| beta \| lt.eq 1$. Ideal counting gives
  $ \# cal(D)_r \( t \) lt.double C / q_r N / C G / C . $
  For $q_r asymp r_0$, its product with the preceding factor $C \/ q_r$ is $O \( N G \/ r_0^2 \)$.
    There are $O \( r_0 \)$ possible $r$ in this range and $O \( T \)$ possible $t$.
    Since $B asymp G T^2$, their contribution to Equation (1.42) is at most
  $ \( K N B \)^epsilon.alt frac(N B, r_0) (K / r_0 + frac(N G, C^2)) lt.double \( K N B \)^epsilon.alt N
    B \( K + N B \) . $
  Here $r_0 \, C \, T$ are bounded below on a nonempty range and $G lt.double B$.
    The number of dyadic choices for $C \, G \, T \, r_0$ is logarithmic in the norm ranges.
    Hilbert-space triangle over the $C \, G \, T$ blocks, followed by a rescaling of $epsilon.alt$,
    proves Equation (1.43). ◻
]

===== 1.3.5 The unmarked reflected energy <the-unmarked-reflected-energy>

For a fixed finite-ray character $nu$, extended by zero away from primary elements prime to $S$,
  and for $m eq.not 0$, define the central completed sum

#[#set math.equation(numbering: n => "(1.45)")
 $ cal(C)_V \( X \; m \, nu \) = sum_(c med upright("sf") \, med n\
c \, n equiv 1 med \( 3 \)\
\( c n \, S \) =
  1) frac(gamma_2 \( c \) overline(alpha \( c n^3 \)) nu \( c n^3 \) chi_(c n^3) \( m \), sqrt(q_c) thin q_n) V
  #h(-0.16667em) (frac(q_c q_n^3, X)) . $ <eq:unmarked-central-completion>]

Here $c \, n$ may share primes. The defining series is absolutely convergent for every $X >
  0$ when $V$ satisfies the hypotheses of Proposition 15. Complete multiplicativity, with the zeros retained,
  gives $chi_(c n^3) \( m \) = chi_c \( m \) chi_n \( m \)^3$. Thus for every $a > 1$,

#[#set math.equation(numbering: n => "(1.46)")
 $ cal(C)_V \( X \; m \, nu \) = frac(1, 2 pi i) integral_(\( a \)) hat(V) \( s - 1 \/ 2 \) X^(s - 1 \/ 2)
   T \( s \, nu chi_bullet \( m \) \) thin d s . $ <eq:unmarked-central-mellin>]

Indeed, absolute convergence permits termwise Mellin inversion on that line.

We bound the mean square of this completed sum over nonzero element rows.
  At equal completed and row norm scales, the goal is

$ sum_(0 < q_m lt.eq C_m Z) \| cal(C)_V \( Z \; m \, nu \) \|^2 lt.double Z^(1 + epsilon.alt)
  frak(M)_(A \, J) \( V \)^2 $

for every fixed $C_m gt.eq 1$ and $epsilon.alt > 0$, with suitable finite orders $A \, J$.
  Lemma 22 below gives the more general estimate that tracks the repeated prime factors of the row.

The reason for the quadratic sieve is already visible for squarefree rows.
  Take $m = R$ primary, squarefree and good, with $q_R asymp Z$, and set $X = Z$.
  Fix a row sector, a cusp sector, a dual unit $u$, and one integer $k gt.eq - 4$ in the dual support.
  There are no frozen good local primes in this case. Every prime of $R$ enters reflection with exponent one,
  so for $mu = u lambda^k n b^3$ its column factor gives

$ chi_R \( lambda^4 mu \)^3 = chi_R \( u lambda^(k + 4) \)^3 chi_R \( n b \)^3 . $

This identity retains all zeros, and $n \, b$ may share primes.
  The first factor depends only on $R$; the cusp coefficient and additive character are common throughout the
  sector. Their coefficient bound leaves the column normalization $q_n^(- 1 \/ 2) q_b^(- 1)$,
  up to a constant depending on the fixed $k$. Thus the only arithmetic interaction between the row and the two
  column indices is the kernel of Lemma 19.

On dual dyads $q_n asymp U$, $q_b asymp B$, the reflected kernel has argument comparable to $U B^3 \/ Z$.
  Its rapid decay permits discarding whole blocks with $U B^3 > Z^(1 + tau)$ for any fixed $tau > 0$;
  the tail argument below makes this restriction uniform when the ramified exponent and the other parameters vary.
  On the retained blocks, Lemma 17 separates the kernel with one common coefficient measure while retaining the
  actual row annulus. Write $cal(U)_(U \, B \, k) \( R \)$ for this dyadic piece of the reflected sum.
  For a retained block, the quadratic norm and the squared column normalization give

$ sum_R \| cal(U)_(U \, B \, k) \( R \) \|^2 lt.double_(V \, k \, tau \, epsilon.alt) Z^epsilon.alt
  frac(\( Z + U B \) U B, U B^2) = Z^epsilon.alt frac(Z + U B, B) lt.double_(V \, k \, tau \, epsilon.alt)
  Z^(1 + tau + epsilon.alt) . $

Here $B gt.eq 1$ and $U B^3 lt.eq Z^(1 + tau)$ give the last inequality. This explains the balanced energy scale.
  The general argument must also sum the ramified exponents, retain the kernel saving at unequal scales,
  and treat repeated prime factors of the row. We freeze the prime powers of the row whose exponents are at least
  two and apply the same quadratic norm to its squarefree residual factor.
  The next definition records the resulting local terms; the completed-row lemma then sums them.

#prodef([Definition 1.17.])[
  (An unmarked reflected block).  Fix $Z gt.eq 2$, $X = Z^N$,
    one of the fixed characters $Psi_0$ and its common modulus $L$ from Proposition 15,
    and put $M_(upright("ref")) = lambda^12 L^4$. For the current norm over $R$,
    freeze a finite set $cal(F)$ of good primes with exponents $j_p in { 0 \, dots.h \, 5 }$.
    Let $R$ range over squarefree primary good ideals coprime to every prime of $cal(F)$,
    in one fixed class modulo $M_(upright("ref"))^2$ and with any further fixed row restrictions.
    These restrictions are independent of the dual variables. On primary elements prime to $S$ set
  $ Psi_R \( A \) = Psi_0 \( A \) product_(p in cal(F)) chi_p \( A \)^(j_p) product_(p divides R) chi_p \( A \) . $
  Every local power retains its zero. In the reflection for $Psi_R$, fix $h_0$,
    the active or inactive decision at every $j_p = 0$ prime of $cal(F)$,
    and one of the two summands of every $j_p = 4$ Ramanujan factor.
    All primes of $R$ are active and have exponent one. Let $F_(upright("act"))$ be the product of the active
    primes in $cal(F)$.
  For each chosen divisibility summand at $j_p = 4$, use the exact partition
  $ 1_(p divides n_0 b_0^3) = 1_(p divides n_0) + 1_(p divides.not n_0) 1_(p divides b_0) . $
  Choose one term. Let $N_F$ be the product of the primes assigned to the squarefree ideal $n_0$,
    and let $B_F$ be the product assigned to $b_0$ but not $n_0$. Write $n_0 = N_F n$ and $b_0 = B_F b$.
    In the first assignment only the occurrence in $n_0$ is extracted, even if $b_0$ contains that prime;
    in the second exactly one occurrence is extracted from $b_0$.
    All remaining source restrictions are retained on $n \, b$.
    Let $F_(upright("sm"))$ be the product of the small $j_p = 4$ summands and the active $j_p = 0$ primes, and put
  $ A_0 = log_Z q_(F_(upright("act"))) \, wide S_0 = log_Z q_(F_(upright("sm"))) \, wide N_0 = log_Z q_(N_F) \,
    wide B_0 = log_Z q_(B_F) . $
  Empty products have log-norm zero.
  Fix a unit $u$, an integer $k gt.eq - 4$, and dual ranges
  $ mu = u lambda^k N_F n \( B_F b \)^3 \, wide q_n asymp Z^v \, quad q_b asymp Z^(ell_b) \, quad q_(lambda^k) =
    Z^(e_lambda) \, $
  where $v \, ell_b gt.eq 0$. The squarefree $n$ and the primary $b$ retain the full source support of
    Equation (1.18), including permitted primes of $S$ and shared primes.
    Let $H gt.eq 0$, and choose a common smooth profile $W_1 \( y_R \, y_n \, y_b \)$ on a fixed compact
    logarithmic box, where
  $ y_R = q_R \/ Z^H \, wide y_n = q_n \/ Z^v \, wide y_b = q_b \/ Z^(ell_b) . $
  Choose fixed smooth annular cutoffs $chi_(upright("row")) \, chi_n \, chi_b$ for these three ranges, and put
  $ W_0 \( bold(y) \) = chi_(upright("row")) \( y_R \) chi_n \( y_n \) chi_b \( y_b \) W_1 \( bold(y) \) . $
  The supports and invoked seminorms are fixed uniformly over the block.
    Denote by $cal(U)_(v \, ell_b \, e_lambda) \( R \)$ the specified term of the right side of Equation (1.17),
    restricted to this dual representation and multiplied by $W_0 \( y_R \, y_n \, y_b \)$.
    The original row set $cal(I)_H$ consists of the allowed $R$ for which $chi_(upright("row")) \( q_R \/ Z^H \)
    eq.not 0$. This definition is made separately for every fixed choice above.
] <def:unmarked-reflected-block>

The frozen primes in this definition may vary between invocations;
  they are not added to the fixed arithmetic modulus $L$. The definition fixes them only before taking the current
  norm over $R$.

#thm([Lemma 1.18.])[
  (Unmarked reflected block).  #emph[For an unmarked reflected block, set
$ T_0 = 2 H + 2 A_0 - N - N_0 - 3 B_0 \, wide nu_0 = v / 2 + ell_b + e_lambda / 3 + frac(S_0 + B_0, 2) . $

 Let all these log-lengths range over fixed bounded sets. Put
$ Y = frac(q_(lambda^k N_F B_F^3) X Z^v Z^(3 ell_b), q_(c_F F_(upright("act")))^2 Z^(2 H)) \, wide
  W \( bold(y) \) = y_n^(- 1 \/ 2) y_b^(- 1) W_0 \( bold(y) \) \, wide F_Y \( bold(y) \) =
  W \( bold(y) \) V^sharp \( Y y_n y_b^3 y_R^(- 2) \) . $

 There are functions $rho \( R \)$ and $beta \( n \, b \)$, with absolute values at most one,
   such that $beta$ is independent of $R$ and
#[#set math.equation(numbering: n => "(1.47)")
 $ cal(U)_(v \, ell_b \, e_lambda) \( R \) = 1 / 3 Z^(- nu_0) rho \( R \) sum_(n \, b) beta \( n \, b \)
   chi_R \( n b \)^3 F_Y \( y_R \, y_n \, y_b \) . $ <eq:unmarked-structural-block>]

 The sum retains all the fixed dual restrictions from the definition.
   The only arithmetic factor here that depends simultaneously on $R$ and the dual variables is the displayed
   zero-extended quadratic symbol. Moreover,
#[#set math.equation(numbering: n => "(1.48)")
 $ frac(q_mu X, q_c^2) = Y y_n y_b^3 y_R^(- 2) \, wide c = c_F F_(upright("act")) R . $ <eq:unmarked-actual-annuli>]

 This is an exact identity on the original support, including when $N_F$ shares primes with $b$.]
  #emph[For every $epsilon.alt > 0$ and every fixed $A gt.eq 0$,
#[#set math.equation(numbering: n => "(1.49)")
 $ sum_(R in cal(I)_H) \| cal(U)_(v \, ell_b \, e_lambda) \( R \) \|^2 & lt.double_(epsilon.alt \, A)
   Z^(E_0 + epsilon.alt) p_5 \( W \)^2 frak(M)_(A \, ceil.l 4 A ceil.r + 7) \( V \)^2 \,\
E_0 =  & max \( H \, v + ell_b \) - S_0 - B_0 - ell_b - frac(2 e_lambda, 3) - 1 /
  2 \( T_0 - v - 3 ell_b - e_lambda \)_(+) . $ <eq:unmarked-reflected-energy>]

 The constants may depend on the fixed kernel order $A$, the fixed arithmetic data, the bounded log-length ranges,
   and the fixed support box, but not on the moving frozen local set $cal(F)$.
   Norm twists in $W_0$ have the polynomial cost supplied by its finite seminorms.]
] <lem:unmarked-reflected-block>

#proof[
  For the fixed $h_0$ and the fixed class of $R$ modulo $M_(upright("ref"))^2$,
    the class of $F_(upright("act")) R$ is fixed. Proposition 15 therefore gives one common $d$ and one common
    additive character $theta.alt$ for the whole row set. Write $x_F = u lambda^(k + 4) N_F B_F^3$,
    so that $lambda^4 mu = x_F n b^3$. The residual local factors are exactly
  $ product_(p divides R) B_p \( lambda^4 mu \) = chi_R \( x_F \)^3 chi_R \( n b^3 \)^3 =
    chi_R \( x_F \)^3 chi_R \( n b \)^3 . $
  Both equalities include zeros; no unit symbol has been divided.
    In particular, any collision with $x_F$ is a restriction depending only on $R$.
    Every remaining local factor is fixed and depends only on the dual index.
    The scalar $zeta_R$ of the reflection depends on $R$ but not on $mu$.
  Define on the specified dual support
  $ delta \( n \, b \) = frac(d \( mu \) alpha \( mu \) theta.alt \( lambda^4 mu \), 27 thin 3^(k \/ 6) \| B_F b \|) . $
  The coefficient bound gives $\| delta \( n \, b \) \| lt.eq 1$.
    Its denominator is nonzero, and the definition remains valid when the numerator is zero.
    Using $q_mu = 3^k q_(N_F n) q_(B_F b)^3$ gives the exact factorization
  $ frac(d \( mu \) alpha \( mu \) theta.alt \( lambda^4 mu \), sqrt(q_mu)) =
    27 delta \( n \, b \) q_(lambda^k)^(- 1 \/ 3) q_(N_F n)^(- 1 \/ 2) q_(B_F b)^(- 1) . $
  A small Ramanujan factor or an active zero-mask factor contributes $q_p^(- 1 \/ 2)$.
    A divisibility factor contributes $q_p^(1 \/ 2)$; for a prime assigned to $N_F$ it cancels $q_p^(- 1 \/ 2)$
    from the squarefree denominator, and for a prime assigned to $B_F$ it leaves $q_p^(- 1 \/ 2)$ after
    extraction. When a prime assigned to $N_F$ also divides $b$,
    its entire occurrence in $b$ remains in $q_b^(- 1)$ and in $delta \( n \, b \)$.
    These facts give exactly the common power $Z^(- nu_0) y_n^(- 1 \/ 2) y_b^(- 1)$.
  Absorb $delta$, the signs of small Ramanujan terms, the bounded fixed local characters,
    and the fixed dual indicators into $beta \( n \, b \)$. This function is bounded by one and is independent of
    $R$. Put $rho \( R \) = 81 zeta_R chi_R \( x_F \)^3$; it is bounded by one because $\| zeta_R \| lt.eq
    1 \/ 81$. The factor $27 \/ 81 = 1 \/ 3$ now proves Equation (1.47).
    Multiplicativity of the norm proves Equation (1.48). It does not use any coprimality between $N_F$ and $b$.
  By the definitions of the log-norms,
  $ Y = q_(c_F)^(- 2) Z^(v + 3 ell_b + e_lambda - T_0) . $
  The finite set of possible $c_F$ depends only on $L$. Consequently $frak(m)_A \( Y \) lt.double_L
    Z^(- \( T_0 - v - 3 ell_b - e_lambda \)_(+) \/ 4)$. Apply Lemma 17 in dimension three and Equation (1.39) to
    the structural identity. The single density is common to all $R$ because $W$ uses the row and both dual norms
    as coordinates. At each Fourier mode the norm powers have absolute value one and can be absorbed into the
    bounded row scalar and the common dual coefficient. Only now enlarge the positive row norm from $cal(I)_H$ to
    squarefree good $R$ with $q_R lt.double Z^H$, retaining any fixed restrictions.
    No kernel estimate is used on the added rows.
  Equation (1.43), with $K = Z^H$, $N_(upright("col")) = Z^v$, and $B_(upright("col")) = Z^(ell_b)$,
    bounds the separated squared norm by
  $ Z^(epsilon.alt + max \( H \, v + ell_b \) + v + ell_b) . $
  The squared common coefficient in the structural identity has exponent $- v - 2 ell_b - 2 e_lambda \/ 3 - S_0 -
    B_0$. The square of the extracted profile scalar contributes $- \( T_0 - v - 3 ell_b - e_lambda \)_(+) \/ 2$.
    Combining these exponents and the dimension-three separation norm proves Equation (1.49). ◻
]

For later summation, call a dual block retained when

$ v + 3 ell_b + e_lambda lt.eq T_0 + tau_(upright("ref")) \, wide tau_(upright("ref")) > 0 . $

On the fixed support box, Equation (1.48) places the kernel argument in
  $\[ C_(upright("ker"))^(- 1) \, C_(upright("ker")) \]$ times $Z^(v + 3 ell_b + e_lambda - T_0)$,
  for one fixed $C_(upright("ker"))$. If $log Z gt.eq 2 log C_(upright("ker")) \/ tau_(upright("ref"))$,
  every unretained whole block has actual argument greater than $Z^(tau_(upright("ref")) \/ 2)$ throughout its
  support. These blocks can be removed before Fourier inversion with arbitrary power saving when the other
  log-lengths lie in bounded ranges. Here are the details needed for that uniform assertion.

On the full source support,

$ frac(\| d \( mu \) \|, sqrt(q_mu)) lt.eq 27 q_(lambda^k)^(- 1 \/ 3) q_(n_0)^(- 1 \/ 2) q_(b_0)^(- 1) lt.eq
  27 q_lambda^(4 \/ 3) . $

After its indicator is discarded, each local factor is bounded by $q_p^(1 \/ 2)$, uniformly in $mu$.
  The product of these bounds has a fixed polynomial size when the active log-norm is bounded.
  For a fixed row put $a = X \/ q_c^2$. Its factor $1 + a^(- 1)$ also has a fixed polynomial bound on the stated
  row and conductor ranges. The finite local choices and bounded row counts have a further fixed polynomial cost;
  call the sum of these norm-scale exponents $B_(upright("tail"))$.
  The fixed profile seminorms and their polynomial height costs remain multiplicative factors outside this
  exponent. It is chosen before the kernel order and does not count discarded dual indices.
  The remaining dual sum is the unrestricted lattice sum in Lemma 18, with $U = Z^(tau_(upright("ref")) \/ 2)$.
  For any $D > 0$, choosing

$ A > 1 + frac(2 \( B_(upright("tail")) + D \), tau_(upright("ref"))) $

makes the discarded contribution $O \( Z^(- D) \)$ times a finite seminorm of $V$ and the fixed profile bounds.
  The assertion holds either for the absolute total or, after increasing $B_(upright("tail"))$ to include the
  bounded row count, for the row norm. The dyadic cutoffs have bounded overlap,
  so this lattice estimate controls their whole sum. In particular no bound on the discarded dual lengths has been
  assumed.

We finish by summing the reflected blocks for an element row.
  The following norm observation records the actual support that governs this summation.
  Suppose an element row has an ideal factorization $\( m \) = m_(upright("pow")) m_(upright("sup")) R$,
  with integral factors, and the fixed support constants give

$ q_m lt.eq C_m Z^M \, wide q_(m_(upright("pow"))) gt.eq Z^O \/ C_O \, wide q_R gt.eq Z^H \/ C_H . $

Since $q_(m_(upright("sup"))) gt.eq 1$, multiplicativity gives

#[#set math.equation(numbering: n => "(1.50)")
 $ H lt.eq M - O + frac(log C_(upright("res")), log Z) \, wide C_(upright("res")) =
   C_H C_m C_O . $ <eq:actual-residual-row-dyad>]

This inequality does not require $m_(upright("sup"))$ to have bounded norm, and it need not be an equality.
  We will use it with the three factors on disjoint prime supports and with the unit residual ideal in the bounded
  $H = 0$ dyad.

#thm([Lemma 1.19.])[
  (Unmarked completed-row moment).  #emph[Let $nu$ range over a fixed finite family of multiplicative finite-ray
    characters with conductors supported on $S$, all extended by zero away from the primary elements prime to $S$.
    Fix bounded ranges for $M gt.eq 0$ and $N in bb(R)$, a constant $C_m gt.eq 1$,
    and fixed dyadic support comparisons. For a nonzero element $m$, let
$ m_(upright("pow")) = product_(v_(frak(p)) \( m \) gt.eq 2) frak(p)^(v_(frak(p)) \( m \)) $

 be its maximal powerful ideal factor. Use nonnegative centers $O$ for its dyadic ranges,
   with center zero for the unit range.]
  #emph[For every $epsilon.alt > 0$ there exist a finite $A gt.eq 0$ and an integer $J gt.eq 0$ such that,
    for every test $V$ satisfying Proposition 15, every actual $O$-dyad, and all sufficiently large $Z$,
#[#set math.equation(numbering: n => "(1.51)")
 $ sum_(0 < q_m lt.eq C_m Z^M\
q_(m_(upright("pow"))) asymp Z^O) \| cal(C)_V \( Z^N \; m \, nu \) \|^2 lt.double
  Z^(O \/ 2 + max { M - O \, thin 2 M - O - N } + epsilon.alt) frak(M)_(A \, J) \( V \)^2 .
  $ <eq:unmarked-completed-moment>]

 The finite orders, constant, and lower threshold may depend on the fixed arithmetic data, the parameter ranges,
   $C_m$, the dyadic support comparisons, and $epsilon.alt$.
   They are uniform in the element rows and in $nu$ in the fixed family.
   The estimate directly includes the Gaussian test; no annular support assumption is made on $V$.
   Replacing $V \( x \)$ by $x^(i t_0) V \( x \)$ has at most a fixed polynomial cost in $1 + \| t_0 \|$.]
] <lem:unmarked-completed-moment>

#proof[
  Fix one character $nu$. Lemma 16, with $Psi_(upright("base")) = nu$,
    supplies a fixed finite family of literal characters for the reflection of $nu \( A \) chi_A \( m \)$.
    Choose their common $frak(E) \, L$ before any good row prime varies.
    Partition the rows into the finitely many unit, $S$-valuation residue, and good-ray sectors from that lemma.
    This keeps every good local prime, including those whose row valuation is divisible by six.
  For a row in the prescribed $O$-dyad, split its valuation-one primes into $m_(upright("sup"))$ supported on $S$
    and the squarefree good product $R$. Thus $\( m \) = m_(upright("pow")) m_(upright("sup"))
    R$ on disjoint prime supports. Freeze the unit, the actual ideals $m_(upright("pow")) \, m_(upright("sup"))$,
    and then partition $R$ into actual smooth annuli $q_R asymp Z^H$, with $H gt.eq
    0$ and the unit in the bounded zero dyad. Keep this row cutoff in each reflected vector. Equation (1.50) gives
  #[#set math.equation(numbering: n => "(1.52)")
   $ H lt.eq M - O + O_(upright("fixed")) \( 1 \/ log Z \) . $ <eq:unmarked-row-width>]
  The fixed row restrictions, including coprimality with the frozen factors, are independent of the dual variables.
  After the row-sector conversion, take $cal(F)$ in Definition 20 to be the good primes of $m_(upright("pow"))$,
    with their valuations reduced modulo six. The primes of $R$ have exponent one.
    Fix $h_0$, a class of $R$ modulo $M_(upright("ref"))^2$, and the local active and Ramanujan choices at the
    frozen primes. Every active frozen good prime divides $m_(upright("pow"))$ to exponent at least two. Consequently
  #[#set math.equation(numbering: n => "(1.53)")
   $ q_(F_(upright("act")))^2 lt.eq q_(m_(upright("pow"))) \, wide 2 A_0 lt.eq O +
     O_(upright("fixed")) \( 1 \/ log Z \) . $ <eq:unmarked-powerful-radical>]
  This uses the actual powerful dyad’s upper comparison. The possible $S$-prime factors of $m_(upright("pow"))$
    only increase its norm.
  Apply Equation (1.17) at $X = Z^N$ to the Mellin representation in Equation (1.46).
    Its dual sum is absolutely convergent. Insert fixed smooth dyadic partitions in the residual squarefree and
    cube norms, and fix the unit and ramified exponent of the dual index.
    These operations give the blocks of Definition 20 with uniformly bounded seminorms for $W$.
    No partition of the primal test $V$ is needed: the compact profile here is the product of the dual and row
    cutoffs with the normalized inverse roots, and $V^sharp$ remains the kernel.
  Fix a small $tau_(upright("ref")) > 0$. The row lengths $H \, O$, the active length $A_0$,
    and $N$ lie in fixed bounded ranges. The same is true of $S_0 \, N_0 \, B_0$,
    since their prime products divide $F_(upright("act"))$. The tail argument following Lemma 21 therefore removes
    all unretained whole dual blocks with any prescribed power saving, with a finite seminorm of $V$.
    Its polynomial cost includes the row and local counts below but not the discarded dual indices.
    Choose its kernel order first, and increase $A \, J$ in the statement so that $frak(M)_(A \, J) \( V \)$
    dominates this tail seminorm and the block seminorm. This is possible because increasing $A$ widens the
    supremum defining $frak(M)_(A \, J)$ and increasing $J$ increases its weight.
  Write $e = e_lambda$. The source restriction $k gt.eq - 4$ gives $e gt.eq - 4 log 3 \/ log Z$. For a retained block,
  $ v + 3 ell_b + e lt.eq T_0 + tau_(upright("ref")) . $
  Since $v \, ell_b gt.eq 0$ and $T_0$ is bounded, this also bounds every retained dual length.
    There are only logarithmically many retained choices for the dual annuli and for $k$.
    Choose a nonnegative $epsilon.alt_Z = O_(upright("fixed")) \( 1 \/ log Z \)$ large enough to cover the support
    offsets in Equations (1.52) and (1.53), and to ensure $e gt.eq - epsilon.alt_Z$.
  The exponent in Equation (1.49) satisfies
  $ E_0 lt.eq max { H \, T_0 - S_0 - B_0 } + 5 / 3 epsilon.alt_Z + tau_(upright("ref")) . $
  To see this, use $max \( H \, v + ell_b \) - ell_b = max \( H - ell_b \, v \)$ and discard the nonpositive
    kernel term. The first branch is at most $H + 2 epsilon.alt_Z \/ 3$, since $ell_b \, S_0 \, B_0 gt.eq 0$.
    In the second branch, retention gives $v lt.eq T_0 - 3 ell_b - e + tau_(upright("ref"))$,
    so it is at most $T_0 - S_0 - B_0 + 5 epsilon.alt_Z \/ 3 + tau_(upright("ref"))$. Moreover,
  $ T_0 - S_0 - B_0 & = 2 H + 2 A_0 - N - N_0 - S_0 - 4 B_0\
 & lt.eq 2 M - O - N + O \( epsilon.alt_Z \) \, $
  by Equations (1.52) and (1.53). Thus every retained block, with its frozen row parts fixed, has exponent at most
  $ max { M - O \, 2 M - O - N } + tau_(upright("ref")) + O \( epsilon.alt_Z \) . $
  It remains to count the frozen parts and the finite expansions.
    Every powerful ideal is uniquely $x^2 y^3$ with $y$ squarefree:
    at a prime, the exponent of $y$ is the parity of the powerful exponent,
    and an odd positive exponent is at least three. Ideal counting and $sum_y q_y^(- 3 \/ 2) < oo$ therefore give
  $ \# { m_(upright("pow")) : q_(m_(upright("pow"))) lt.double Z^O } lt.double Z^(O \/ 2) . $
  The squarefree $m_(upright("sup"))$ is a divisor of the fixed radical of $S$ and has only finitely many choices.
    The local branches at the good primes of $m_(upright("pow"))$ have divisor-bounded multiplicity,
    as do their Ramanujan assignments. Rowwise divisor Cauchy and then summation of the local choices cost an
    arbitrarily small power of $Z$. The choices of $h_0$, fixed ray sectors, and units are finite,
    and the actual row and retained dual annuli cost only powers of $log Z$.
    This counts the powerful contribution $O \/ 2$ exactly once.
  Choose $tau_(upright("ref"))$ and the local small-power losses within the prescribed $epsilon.alt$ allowance.
    Then increase the fixed-data threshold for $Z$ so that the $O \( epsilon.alt_Z \)$ terms lie within that
    allowance. The block bound, the preceding counts, and the already chosen tail saving prove Equation (1.51).
    The twist assertion follows from the norm-twist bound for $frak(M)_(A \, J)$ in Proposition 15. ◻
]

For clarity about the test used at equal lengths, put

$ V_(upright(G)) \( y \) = frac(1, 2 sqrt(pi)) exp #h(-0.16667em) (- frac(\( log y \)^2, 4)) . $

It satisfies the hypotheses of Proposition 15 directly, has $hat(V)_(upright(G)) \( t \) = e^(t^2)$,
  and has finite $frak(M)_(A \, J)$ for every finite $A \, J$.
  Thus the preceding lemma applies to it without an additional annular extension. At $X = Z$ its exact Mellin form is

$ cal(C)_(V_(upright(G))) \( Z \; m \, nu \) = frac(1, 2 pi i) integral_(\( 4 \)) Z^t e^(t^2)
  T \( t + 1 \/ 2 \, nu chi_bullet \( m \) \) thin d t . $

In the defining sum the coefficients remain normalized by $q_c^(- 1 \/ 2) q_n^(- 1)$;
  the scale occurs in $V_(upright(G)) \( q_c q_n^3 \/ Z \)$.

Finally take $M = N = 1$. The exponent in an actual $O$-dyad is $1 - O \/ 2 + epsilon.alt$.
  The nonnegative $O$-dyads are logarithmically many, and their unit dyad is included.
  Summing them, with a smaller preliminary loss, gives the equal-length conclusion for every admissible $V$:

#[#set math.equation(numbering: n => "(1.54)")
 $ sum_(0 < q_m lt.eq C_m Z) \| cal(C)_V \( Z \; m \, nu \) \|^2 lt.double Z^(1 + epsilon.alt)
   frak(M)_(A \, J) \( V \)^2 . $ <eq:unmarked-balanced-completed-moment>]

==== 1.4 The base probe and its balanced low estimate <sec:probe>

We now place the completed sums of the preceding section inside one average $I_eta \( X \, Y \, Z \)$.
  Its original representation separates into an additive polynomial and a completed theta row.
  At the balanced scales $X = Y = Z^(1 \/ 2)$, their mean-square estimates give the direct bound $I_eta
  lt.double_eta Z^(1 \/ 4 + epsilon.alt)$. We first define the average for independent positive scales $X \, Y \,
  Z$; only the final proposition in this section specializes them.
  The next section applies Poisson summation to this same average and identifies the reciprocal of the target
  $L$-function in its principal row.

===== 1.4.1 Definition and separation of the two factors <definition-and-separation-of-the-two-factors>

Choose a finite ray group $T$, independently of the target character, through which the functions $cal(R)$, $G$,
  and the fixed primary and supplementary phases supported over $2 \, 3$ in Lemma 8 factor.
  The target-dependent fixed-numerator characters below need not factor through $T$.
  For a finite-order Hecke character $eta$, write

$ Theta = chevron.l eta \, hat(T) chevron.r . $

Use one excluded set $S$ for the finite family ${ eta theta : theta in hat(T) }$.
  It contains the primes over $6$, the prime supports of the defining moduli of the fixed zero-extended
  presentations of $eta$ and the characters in $hat(T)$, and every prime of norm at most a fixed $P_0$.
  These full presentations belong to the fixed arithmetic data.
  They are fixed before $X \, Y \, Z$ and the varying row and prime parameters are chosen.
  Enlarging $S$ will not change $T$.

The finite transform should exclude frequencies meeting $S$, including zero,
  and should leave coefficients that factor prime by prime.
  The following character and phase corrections arrange these two properties.

Let $b_(*)$ generate the squarefree product of the primes in $S$.
  Choose a residue character $xi$ modulo $b_(*)$ whose restriction to each prime factor is nonprincipal and whose
  order divides six. Such a choice exists: at a prime of odd residue characteristic one may use the quadratic
  character, and the residue field at the prime over $2$ has order four and has a character of order three.
  The Chinese remainder theorem makes $xi$ primitive modulo $b_(*)$.
  All residue characters below are extended by zero on nonunits. Put

$ g_psi \( c \, k \) = sum_(d med mod med c) psi \( d \) e \( k d \/ c \) \, wide tau =
  q_(b_(*))^(- 1 \/ 2) g_xi \( b_(*) \, 1 \) \, wide Xi \( a \) = xi \( a \) chi_a \( b_(*) \) \,\
Psi_(m \, s \, eta) \( a \) = eta \( a \) Xi \( a \)^(- 1) cal(R) \( a \, s \) chi_a \( m \)
  wide \( \( a \, S \) = 1 \) . $

Finite character orthogonality at each prime gives $\| tau \| = 1$.
  By Lemma 5, the fixed-numerator symbol $a mapsto chi_a \( b_(*) \)$ is a finite ray character whose conductor is
  supported on $S$. Thus $Xi$ is a fixed finite character for this target, although it need not factor through $T$.

The primitive character $xi$ at the primes in $S$ will force the Poisson frequency to be prime to $S$.
  The accompanying normalizations cancel the unit factors introduced by the auxiliary modulus $b_(*)$.
  For the completed index $A = c n^3$, the factor $cal(R) \( A \, s \)$ cancels the cross-prime reciprocity phases
  between $A$ and $s$, while $overline(G \( A \))$ cancels the remaining pair phases within $A$.
  We verify these cancellations coefficientwise in Section 5.2.

Define the corrected row at spectral parameter $t + 1 \/ 2$ by

$ T_(m \, s \, eta) \( t \) = sum_(c med upright("sf")\
n) gamma_2 \( c \) overline(alpha \( c n^3 \)) Psi_(m \, s \, eta) \( c n^3 \) overline(G \( c n^3 \))
  q_c^(- 1 \/ 2 - t) q_n^(- 1 - 3 t) . $

Here and below the ideal variables avoid $S$. In particular every factor in $Xi \( a \)^(- 1)$ is evaluated on a
  unit. The value $G \( c n^3 \)$ is the finite-ray extension in Equation (1.6), also when $c n^3$ is not squarefree.

Fix nonnegative, nonzero functions $W_0 \, W_1 in C_c^oo \( 0 \, oo \)$ and put $Phi \( t \) = e^(t^2)$. Define

#[#set math.equation(numbering: n => "(1.55)")
 $ I_eta \( X \, Y \, Z \) =  & 1 /
   Y sum_s frac(W_1 \( q_s \/ Y \) chi_s \( b_(*) \), tau xi \( s \) sqrt(q_(b_(*)) q_s X))\
 & quad dot.op sum_(m in cal(O)) xi \( m \) q_s^(- 1 \/ 2) g_(chi_s) \( s \, - m \) W_0 #h(-0.16667em)
   (frac(q_m, q_(b_(*)) q_s X)) frac(1, 2 pi i) integral_(\( 4 \)) Z^t Phi \( t \) T_(m \, s \, eta) \( t \) thin
   d t . $ <eq:general-probe>]

The masks in this definition remove nonunits at $S$. All sums in Equation (1.55) are absolutely convergent on the
  displayed line; the $m$ and $s$ sums are finite because the weights are annular.

The fixed finite Fourier expansion of the correction is

$ overline(G \( A \)) = sum_(theta in hat(T)) a_theta theta \( A \) \, wide a_theta =
  frac(1, \| T \|) sum_(v in T) overline(G \( v \)) thin overline(theta \( v \)) . $

Parseval and Cauchy–Schwarz give $sum_theta \| a_theta \| lt.eq \| T \|^(1 \/ 2)$.
  For a ray class $sigma in T$ choose a representative $s_sigma$ and put

$ nu_sigma \( a \) & = eta \( a \) Xi \( a \)^(- 1) cal(R) \( a \, s_sigma \) quad \( \( a \, S \) = 1 \) \,\
B_(m \, sigma) \( Z \) & = sum_(theta in hat(T)) a_theta frac(1, 2 pi i) integral_(\( 4 \)) Z^t Phi \( t \)
  T \( t + 1 \/ 2 \, nu_sigma theta chi_bullet \( m \) \) thin d t . $

Extend $nu_sigma$ by zero away from the primary elements prime to $S$,
  without evaluating $Xi \( a \)^(- 1)$ there. The function $T$ here is the completed product in Equation (1.17),
  with its original zero masks. Since $cal(R) \( A \, s \) = cal(R) \( A \, s_sigma \)$ for $s in sigma$,
  the displayed Mellin integral of the corrected row equals $B_(m \, sigma) \( Z \)$ throughout that class.

For $m eq.not 0$, the central Mellin identity (1.46) gives the direct specialization

$ B_(m \, sigma) \( Z \) = sum_(theta in hat(T)) a_theta cal(C)_(V_(upright(G))) \( Z \; m \, nu_sigma theta \) . $

The characters $nu_sigma theta$ form one fixed finite family whose conductor and defining-modulus supports are
  contained in $S$. They need not factor through $T$. Their original zero extensions are those in the
  completed-row moment, so that estimate applies directly to this family of row sums.
  The triangle inequality in the row Hilbert space costs only the fixed factor $sum_theta \| a_theta \|$.
  The row-sector conversion used by that estimate retains the zeros at shared good primes,
  including when a row valuation is divisible by six.

Write $Q = q_(b_(*)) X Y$. Choose a smooth compactly supported function $Omega$ on $\( 0 \, oo \)$ equal to one on
  every value of $q_m \/ Q$ that can occur on the support of $W_1 \( q_s \/ Y \)
  W_0 \( q_m \/ \( q_(b_(*)) q_s X \) \)$. For $v in bb(R)$, set

$ A_(m \, sigma \, v) \( Y \) = 1 /
  Y sum_(s in sigma) frac(W_1 \( q_s \/ Y \) chi_s \( b_(*) \), tau xi \( s \)) \( q_s \/ Y \)^(- 1 \/ 2 + i v)
  q_s^(- 1 \/ 2) g_(chi_s) \( s \, - m \) . $

Our Mellin convention for $W_0$ is $hat(W)_0 \( i v \) = integral_0^oo W_0 \( r \) r^(i v) thin d r \/ r$.
  Since $q_m \/ \( q_(b_(*)) q_s X \) = \( q_m \/ Q \) \/ \( q_s \/ Y \)$, Mellin inversion gives the exact identity

#[#set math.equation(numbering: n => "(1.56)")
 $ I_eta \( X \, Y \, Z \) = frac(Q^(- 1 \/ 2), 2 pi) sum_(sigma in T) integral_(bb(R)) hat(W)_0 \( i v \)
   sum_(m eq.not 0) Omega \( q_m \/ Q \) xi \( m \) \( q_m \/ Q \)^(- i v) A_(m \, sigma \, v) \( Y \)
   B_(m \, sigma) \( Z \) thin d v . $ <eq:low-separated>]

The omitted $m = 0$ term vanishes by the annular support of $W_0$.
  The factor $\( q_m \/ Q \)^(- i v)$ has absolute value one.
  In $A$, the arithmetic coefficient is fixed and bounded independently of $m \, v$;
  all dependence on $v$ occurs in a norm power of the annular variable.

The Gaussian $V_(upright(G))$ has Mellin transform $e^(t^2)$ and satisfies the reflection hypotheses directly.
  Thus Lemma 22 applies without an annular decomposition of this test.

===== 1.4.2 The balanced low estimate <the-balanced-low-estimate>

For the balanced estimate, the completed-row moment already bounds the mean square of $B_(m \, sigma) \( Z \)$.
  It remains to bound the additive factor $A_(m \, sigma \, v) \( Y \)$.
  Its Gauss expansion gives distinct reduced fractions in $bb(C) \/ cal(O)$;
  their separation and coefficient mass give the required mean square.
  The planar additive large sieve is classical; compare Huxley’s multivariable and number-field inequality [19]
  and the Poisson proof in [1] Section 3, Theorem 3. We include the lattice proof to record the normalization used here.

#thm([Lemma 1.20.])[
  (Planar additive large sieve).  #emph[Let $0 < delta lt.eq 1$, let $Q gt.eq 1$, and let $z_1 \, dots.h \,
    z_J$ be a finite set of points in $bb(C) \/ cal(O)$ satisfying
$ inf_(n in cal(O)) \| z_j - z_k - n \| gt.eq delta wide \( j eq.not k \) . $

 Then, for arbitrary complex numbers $a_1 \, dots.h \, a_J$,
$ sum_(m in cal(O)\
q_m lt.eq Q) lr(|sum_(j = 1)^J a_j e \( m z_j \)|)^2 lt.double \( Q + delta^(- 2) \) sum_(j = 1)^J \| a_j \|^2 . $

 The implied constant is absolute for the lattice, additive character, and self-dual measure fixed above.
   A fixed multiple of $Q$ in the row ball is allowed by changing this constant.]
] <lem:planar-additive-sieve>

#proof[
  The assertion is immediate when $J = 0$. The characters $e \( m z_j \)$ are well defined on $bb(C) \/
    cal(O)$ by self-duality. Choose representatives in $bb(C)$ for the other cases. We use the Fourier transforms
  $ hat(F) \( y \) = integral_(bb(C)) F \( x \) e \( - x y \) thin d mu \( x \) \, wide caron(phi.alt) \( x \) =
    integral_(bb(C)) phi.alt \( y \) e \( x y \) thin d mu \( y \) . $
  Choose a nonnegative $phi.alt in C_c^oo \( bb(C) \)$ of integral one,
    supported in a sufficiently small disk about zero. Since $\| e \( x y \) -
    1 \| lt.eq \( 4 pi \/ sqrt(3) \) \| x \| \| y \|$, its support can be chosen so that
  $ \| caron(phi.alt) \( x \) - 1 \| lt.eq 1 / 2 wide \( \| x \| lt.eq 1 \) . $
  Thus $F \( x \) = 4 \| caron(phi.alt) \( x \) \|^2$ is a nonnegative Schwartz function and $F \( x \) gt.eq
    1$ on the unit disk. If $tilde(phi.alt) \( y \) = overline(phi.alt \( - y \))$,
    Fourier inversion and the product formula, with convolution taken with respect to $d mu$, give
  $ hat(F) = 4 phi.alt * tilde(phi.alt) . $
  In particular, $hat(F)$ is bounded and supported in a disk of some fixed radius $L$.
    This is the bandlimited majorant we need.
  Put $R = sqrt(Q)$. Positivity of $F$ first gives
  $ sum_(q_m lt.eq Q) lr(|sum_j a_j e \( m z_j \)|)^2 lt.eq
    sum_(m in cal(O)) F \( m \/ R \) lr(|sum_j a_j e \( m z_j \)|)^2 . $
  All sums on the right converge absolutely. For any $z in bb(C)$,
    the Fourier transform of $x mapsto F \( x \/ R \) e \( x z \)$ at $y$ is $R^2 hat(F) \( R \( y - z \) \)$.
    The factor $R^2$ is the Jacobian of the real two-dimensional dilation;
    no lattice-volume factor occurs because $d mu$ has covolume one on $cal(O)$.
    Poisson summation therefore expands the right side as
  $ R^2 sum_(j \, k) a_j overline(a_k) sum_(n in cal(O)) hat(F) #scale(x: 120%, y: 120%)[\(] R \( n - z_j + z_k \)
    #scale(x: 120%, y: 120%)[\)] . $
  For each fixed $j$, a term in the inner sum can be nonzero only if the lift $z_k +
    n$ lies within distance $L \/ R$ of $z_j$. The set of all lifts ${ z_k + n : 1 lt.eq k lt.eq J \, med
    n in cal(O) }$ is $delta$-separated in $bb(C)$. Distinct classes have this property by hypothesis,
    and two distinct lifts of one class differ by a nonzero Eisenstein integer,
    whose absolute value is at least one and hence at least $delta$.
    The disks of radius $delta \/ 3$ about lifts in a disk of radius $L \/
    R$ are disjoint and lie in the concentric disk of radius $L \/ R + delta \/ 3$.
    Comparing their Euclidean areas bounds the number of these lifts by
  $ (1 + frac(3 L, R delta))^2 lt.double 1 + \( R delta \)^(- 2) . $
  The same bound holds with $j$ and $k$ interchanged. Taking absolute values in the Poisson expansion,
    using the fixed bound for $hat(F)$, and then using $2 \| a_j a_k \| lt.eq \| a_j \|^2 + \| a_k \|^2$, we obtain
  $ sum_(q_m lt.eq Q) lr(|sum_j a_j e \( m z_j \)|)^2 lt.double R^2 #scale(x: 120%, y: 120%)[\(]
    1 + \( R delta \)^(- 2) #scale(x: 120%, y: 120%)[\)] sum_j \| a_j \|^2 . $
  Since $R^2 = Q$, this is the asserted estimate. Replacing $Q$ by a fixed multiple proves the final statement. ◻
]

We apply this estimate to the full residue classes in the Gauss sums.
  The zero extension of the character is important here: it makes the fractions reduced with respect to the
  displayed modulus, not merely with respect to an inducing conductor.

#thm([Lemma 1.21.])[
  (The balanced additive norm).  #emph[Fix the arithmetic data of the probe, the annular weight $W_1$,
    a ray class $sigma in T$, and a row-ball constant $C > 0$.
    For $Y \, Q gt.eq 1$ and every real $v$, the polynomial $A_(m \, sigma \, v) \( Y \)$ satisfies
$ sum_(m in cal(O)\
q_m lt.eq C Q) \| A_(m \, sigma \, v) \( Y \) \|^2 lt.double_(cal(A) \, W_1 \, C) frac(Q + Y^2, Y) . $

 The bound is uniform in $v$. In particular, when $Q = q_(b_(*)) Y^2$,
$ sum_(q_m lt.eq C Q) \| A_(m \, sigma \, v) \( Y \) \|^2 lt.double_(cal(A) \, W_1 \, C) Q / Y . $

]
] <lem:balanced-additive-norm>

#proof[
  For a primary $s$ outside $S$, put $r_s = q_s \/ Y$ and
  $ c_sigma \( s \) = 1_(s in sigma) frac(chi_s \( b_(*) \), tau xi \( s \)) . $
  The inverse is evaluated only on these elements prime to $S$.
    Here $\| tau \| = 1$, $\| xi \( s \) \| = 1$, and $\| chi_s \( b_(*) \) \| = 1$,
    because $b_(*)$ is supported on $S$. Thus $\| c_sigma \( s \) \| lt.eq 1$.
    The definition of $A$ and the Gauss expansion give the exact identity
  $ A_(m \, sigma \, v) \( Y \) = Y^(- 3 \/ 2) sum_s c_sigma \( s \) W_1 \( r_s \) r_s^(- 1 + i v)
    sum_(d med mod med s) chi_s \( d \) e \( - m d \/ s \) . $
  The sum is over primary ideals outside $S$. For every such $s$,
    the character $chi_s \( d \)$ is zero exactly when $\( d \, s \) > 1$, and has absolute value one otherwise.
    This includes nonsquarefree $s$: a local exponent divisible by six is the indicator of the units at that
    prime, not the constant function one. For $s = 1$ the single residue class is included and $chi_1 = 1$.
  We verify that the fractions $d \/ s$ for the contributing pairs are distinct modulo $cal(O)$.
    Suppose that $\( d \, s \) = \( d' \, s' \) = 1$ and $d \/ s - d' \/ s' in cal(O)$.
    Then $d s' - d' s$ is divisible by $s s'$. Reducing this divisibility modulo $s$ and using the inverse of $d$
    modulo $s$ gives $s divides s'$. The symmetric argument gives $s' divides s$.
    The primary generator of an ideal outside $S$ is unique, so $s = s'$; the original congruence then gives $d =
    d' med \( mod med s \)$. The same conclusion includes the unit modulus.
    Changing a residue representative only translates its fraction by an element of $cal(O)$.
  Let $0 < r_(-) < r_(+)$ be fixed with $"supp" W_1 subset \[ r_(-) \, r_(+) \]$.
    For two distinct contributing fractions and every $n in cal(O)$, the Eisenstein integer $d s' - d' s -
    n s s'$ is nonzero. Hence
  $ lr(|d / s - d' / s' - n|) = frac(\| d s' - d' s - n s s' \|, \| s s' \|) gt.eq frac(1, \| s s' \|) gt.eq
    frac(1, r_(+) Y) . $
  The last inequality uses $q_s \, q_(s') lt.eq r_(+) Y$. Thus these fractions are $delta_Y$-separated in
    $bb(C) \/ cal(O)$, where $delta_Y = min \( 1 \, r_(+)^(- 1) \) \/ Y lt.eq 1$.
  Writing the expanded polynomial as $sum_(s \, d) a_(s \, d) e \( - m d \/ s \)$,
    with only the unit residue classes retained, its coefficient square mass is exactly
  $ sum_(s \, d) \| a_(s \, d) \|^2 & = Y^(- 3) sum_s \| c_sigma \( s \) W_1 \( r_s \) \|^2 r_s^(- 2)
    phi_(cal(O)) \( s \) \,\
phi_(cal(O)) \( s \) & := \# \( cal(O) \/ s cal(O) \)^times \, wide phi_(cal(O)) \( 1 \) := 1 . $
  There is no dependence on $v$ in this expression. Since $phi_(cal(O)) \( s \) lt.eq q_s lt.eq r_(+) Y$,
    $r_s gt.eq r_(-)$ on the support, and there are $O \( Y \)$ ideals with $q_s lt.eq r_(+) Y$,
    this mass is $O \( Y^(- 1) \)$. Lemma 23, applied to the points $- d \/ s$ with separation $delta_Y$,
    now proves the first bound. Finally $q_(b_(*)) gt.eq 1$, so $Q = q_(b_(*)) Y^2$ implies $Q + Y^2 lt.eq 2 Q$,
    proving the second. ◻
]

The additive norm now has precisely the scale needed to pair with the unmarked completed-row norm.
  The following proposition performs that pairing for the original probe.

#thm([Proposition 1.22.])[
  (Balanced low estimate).  #emph[Fix the arithmetic data and smooth weights used to define $I_eta$.
    For every $epsilon.alt > 0$, as $Z arrow.r oo$,
$ \| I_eta \( Z^(1 \/ 2) \, Z^(1 \/ 2) \, Z \) #scale(x: 120%, y: 120%)[\|] lt.double_(cal(A) \, epsilon.alt)
  Z^(1 \/ 4 + epsilon.alt) . $

 The exponent is independent of the target character; the implied constant and lower threshold may depend on its
   fixed arithmetic data.]
] <prop:balanced-low>

#proof[
  Set $X = Y = Z^(1 \/ 2)$ and $Q = q_(b_(*)) X Y = q_(b_(*)) Z$.
    The function $Omega$ in Equation (1.56) is bounded and supported in a fixed compact subinterval of
    $\( 0 \, oo \)$. Thus all rows in that identity lie in $0 < q_m lt.eq C_Omega Q$ for a fixed constant $C_Omega$.
  The specialization $M = N = 1$ of Lemma 22, followed by the finite ray decomposition defining $B_(m \, sigma)$,
    gives for every $epsilon.alt_1 > 0$
  $ sum_(0 < q_m lt.eq C_Omega Q) \| B_(m \, sigma) \( Z \) \|^2 lt.double_(cal(A) \, epsilon.alt_1)
    Z^(1 + epsilon.alt_1) . $
  Indeed, $q_(b_(*))$ is fixed, so the row ball is a fixed multiple of the $M = 1$ ball.
    The completed scale is $Z$, which is $N = 1$ in that lemma.
    The lemma applies directly to the Gaussian profile in the completed integrals defining $B$;
    the fixed finite Fourier sum over ray characters costs only a fixed factor by the triangle inequality in the
    row Hilbert space. In particular this application retains the original row zero masks.
  Apply Cauchy–Schwarz to the row sum in Equation (1.56). The factor $\( q_m \/ Q \)^(- i v)$ has absolute value
    one, $\| xi \( m \) \| lt.eq 1$ with its zero extension, and $Omega$ is bounded.
    Lemma 24 is uniform in $v$, while $B$ is independent of $v$.
    Since $W_0$ is smooth and annular, $integral_(bb(R)) \| hat(W)_0 \( i v \) \| thin d v < oo$.
    The finite sum over $sigma in T$ therefore gives
  $ \| I_eta \( X \, Y \, Z \) \| & lt.double_(cal(A) \, epsilon.alt_1) Q^(- 1 \/ 2) (Q / Y)^(1 \/ 2)
    Z^(1 \/ 2 + epsilon.alt_1 \/ 2)\
 & = Z^(1 \/ 4 + epsilon.alt_1 \/ 2) . $
  Taking $epsilon.alt_1 = 2 epsilon.alt$ proves the proposition. ◻
]

==== 1.5 The Poisson representation and its Euler factors <sec:poisson-representation>

The direct estimate is now available. To compare the probe with the Mellin signal in Proposition 3,
  we return to independent positive scales $X \, Y \, Z$ and apply Poisson summation in the element variable $m$.
  The resulting rows are indexed by the sixth-power-free part of the frequency.
  We will factor each row into Hecke $L$-functions and a holomorphic Euler product; the row $u =
  1$ will contain the reciprocal of the target function.

===== 1.5.1 The exact Poisson series <the-exact-poisson-series>

The correction $overline(G \( A \))$ is independent of $m$,
  and the varying character in the completed row is precisely $chi_A \( m \)$, including its zeros.
  Consequently Poisson summation uses the full modulus $s b_(*) A$, even if $s$ and $A$ share primes.
  Expand the $s$-Gauss sum and first sum the lifts of a residue modulo $b_(*) A$.
  The lifts impose $H equiv b_(*) A d med \( mod med s \)$ and give the coefficient

#[#set math.equation(numbering: n => "(1.57)")
 $ F \( s \, A \, H \) = sum_(d med mod med s\
H equiv b_(*) A d med \( mod med s \)) chi_s \( d \) g_(xi chi_A) #h(-0.16667em)
  (b_(*) A \, frac(H - b_(*) A d, s)) . $ <eq:local-F>]

Indeed, the finite Fourier transform of $xi \( m \) chi_A \( m \) q_s^(- 1 \/ 2)
  g_(chi_s) \( s \, - m \)$ modulo $s b_(*) A$ is $q_s^(1 \/ 2) F \( s \, A \, H \)$.
  The Poisson prefactor for the row scale $q_(b_(*)) q_s X$ is $X \/ q_A$.
  After the outer square-root normalization in Equation (1.55), leaving its separate $Y^(- 1)$ outside,
  their product is $X^(1 \/ 2) \/ \( q_(b_(*))^(1 \/ 2) q_A \)$.
  This also verifies all factors of $q_s$ in the transformation.

At the primes of $b_(*)$ the primitive Gauss sum vanishes unless $\( H \, S \) = 1$.
  It therefore also removes $H = 0$. Every remaining element has a unique expression $H = u a^6$,
  where $u$ is a sixth-power-free element, including its unit factor,
  and $a$ is the primary generator of an ideal. Write $sum_u^(\( 6 \))$ for the sum over such nonzero $u$ with
  $\( u \, S \) = 1$.

Let $tilde(W)_0 \( \| y \|^2 \)$ be the planar Fourier transform of $W_0 \( \| y \|^2 \)$ for the self-dual
  measure and character fixed in Section 2. The radial Fourier argument after Poisson is $X q_H \/ q_A$. Put

$ M \( z \) = integral_0^oo tilde(W)_0 \( r \) r^(z - 1) thin d r \, wide hat(W)_1 \( w \) =
  integral_0^oo W_1 \( r \) r^(w - 1) thin d r . $

Smoothness at zero and Schwartz decay show that $M$ is holomorphic for $Re z > 0$.
  On every compact positive real strip it has arbitrary polynomial decay in $Im z$:
  every derivative of $e^(\( Re z \) v) tilde(W)_0 \( e^v \)$ is integrable in $v$, uniformly on that strip,
  so repeated integration by parts applies. The same argument gives arbitrary polynomial decay for $hat(W)_1$ on
  every fixed real strip.

We will need the strict positivity

#[#set math.equation(numbering: n => "(1.58)")
 $ M \( 1 \/ 6 \) > 0 . $ <eq:radial-mellin-positive>]

Here is a proof that does not require the Fourier transform itself to be nonnegative. For $0 < sigma < 1$,

$ \| y \|^(2 sigma - 2) = frac(1, Gamma \( 1 - sigma \)) integral_0^oo t^(- sigma) e^(- t \| y \|^2) thin d t . $

The pairing of the left side with $tilde(W)_0 \( \| y \|^2 \)$ is absolutely integrable.
  Fubini and Fourier duality express it as

$ frac(1, Gamma \( 1 - sigma \)) integral_0^oo t^(- sigma) integral_(bb(C)) W_0 \( \| x \|^2 \)
  frac(2 pi, sqrt(3) thin t) exp #h(-0.16667em) (- frac(4 pi^2 \| x \|^2, 3 t)) d mu \( x \) thin d t > 0 . $

The inner integral is strictly positive for every $t > 0$, since $W_0$ is nonnegative and nonzero.
  Absolute integrability follows either from the displayed representation on the Fourier side or from the annular
  support of $W_0$ on this side. Polar integration identifies the original pairing with $\( 2 pi \/ sqrt(3) \)
  M \( sigma \)$, proving Equation (1.58).

Set $x = t + 1 - z$ after Mellin inversion of the two weights.
  For a nonzero sixth-power-free $u$ with $\( u \, S \) = 1$, define

#[#set math.equation(numbering: n => "(1.59)")
 $ cal(F)_(eta \, u) \( x \, w \, z \) = sum_(c med upright("sf")\
n \, s \, a) K_eta \( c \, n \, s \, a \; u \) thin q_c^(- 1 \/ 2 - x) q_n^(- 1 - 3 x) q_s^(- w) q_a^(- 6 z) \,
  $ <eq:local-full-series>]

where $A = c n^3$ and the coefficient, with all normalizations retained, is

#[#set math.equation(numbering: n => "(1.60)")
 $ K_eta \( c \, n \, s \, a \; u \) =
   frac(F \( s \, A \, u a^6 \) chi_s \( b_(*) \), sqrt(q_(b_(*))) tau xi \( s \) overline(xi \( u \)))
   gamma_2 \( c \) overline(alpha \( A \) G \( A \)) eta \( A \) Xi \( A \)^(- 1) cal(R) \( A \, s \) .
   $ <eq:local-full-coefficient>]

For convenience define the common Mellin weight

$ cal(W) \( X \, Y \, Z \; x \, w \, z \) = X^(1 \/ 2 - z) Z^(x + z - 1) Y^(w - 1) Phi \( x + z - 1 \) M \( z \)
  hat(W)_1 \( w \) . $

For example, the lines $Re x = 3$, $Re w = 3$, $Re z = 2$ correspond to the original line $Re t =
  4$ and lie in absolute convergence. The complete high identity is

#[#set math.equation(numbering: n => "(1.61)")
 $ I_eta \( X \, Y \, Z \) = frac(1, \( 2 pi i \)^3) integral_(\( 3 \)) integral_(\( 3 \)) integral_(\( 2 \)) &
   cal(W) \( X \, Y \, Z \; x \, w \, z \)\
 & dot.op sum_u^(\( 6 \)) q_u^(- z) overline(xi \( u \)) cal(F)_(eta \, u) \( x \, w \, z \) thin d z thin d w
   thin d x . $ <eq:probe-poisson-identity>]

One may justify all interchanges on these lines by the elementary bound $\| F \( s \, A \, H \) \| lt.eq
  q_s q_(b_(*) A)$ and by the annular weights. In particular,
  Equations (1.56) and (1.61) are identities for the same probe, not estimates for separately chosen test expressions.

===== 1.5.2 The scalar Euler identity <sec:local-euler>

We next evaluate the coefficient in Equation (1.60). Our objective is to prove that the high series is a scalar
  Euler product for the target $eta$. The calculation also records separately the terms with positive valuation of
  the completed index $A$ at a given prime. We keep every ray phase until it has been cancelled or assigned to a
  local factor.

Fix a nonzero sixth-power-free row $u$ with $\( u \, S \) = 1$ and a prime $p in.not S$. Set

#[#set math.equation(numbering: n => "(1.62)")
 $ Q = q_p \, wide j = v_p \( u \) in { 0 \, dots.h \, 5 } \, wide rho = chi_p \( u \/ p^j \) \, wide omega_p =
   chi_p \( - 1 \) \,\
a_p = overline(alpha \( p \))^3 eta \( p \)^3 \, wide b_p =
  overline(alpha \( p \))^2 eta \( p \)^2 overline(chi_p \( 4 \)) \, wide b_p^3 = a_p^2 \,\
V = Q^(- 6 z) \, wide R = a_p^2 Q^(4 - 6 x - 6 z) \, wide W_(upright("loc")) = rho Q^(- w) . $ <eq:local-parameters>]

The values $rho \, a_p \, b_p$ have absolute value one, and $omega_p in { 1 \, - 1 }$.
  No ray-class restriction on $p$ is imposed.

======= 1.5.2.1 The finite scalar and its unit factors. <the-finite-scalar-and-its-unit-factors.>

Write $G_r = g_(chi_p^r) \( p \, 1 \)$, with $G_0 = - 1$, and $gamma_r = Q^(- 1 \/ 2) G_r$ for $1 lt.eq r lt.eq
  5$. For $t gt.eq 1$ and $j' gt.eq 0$, summing the lifts of a residue modulo $p$ gives

$ g_(chi_p^r) \( p^t \, p^(j') \) =
  cases(delim: "{", Q^(t - 1) G_r 1_(j' = t - 1) \, & 6 divides.not r \,, Q^t 1_(j' gt.eq t) - Q^(t - 1) 1_(j'
  gt.eq t - 1) \, & 6 divides r .) $

The second line is the Ramanujan sum for the principal character extended by zero.
  Orthogonality also gives $G_1 G_(- 1) = omega_p Q$.

Let $e_0 = v_p \( c \) in { 0 \, 1 }$, $l = v_p \( n \)$, $t = e_0 + 3 l$, $k = v_p \( s \)$, and $m =
  v_p \( a \)$, so $v_p \( H \) = j' = j + 6 m$. The part of Equation (1.57) at $p$,
  before its unit factors are restored, is

#[#set math.equation(numbering: n => "(1.63)")
 $ C_p \( t \, k \, j' \) = sum_(d med mod med p^k\
p^(j') equiv p^t d med \( mod med p^k \)) chi_p^k \( d \) g_(chi_p^t) #h(-0.16667em)
  (p^t \, frac(p^(j') - p^t d, p^k)) . $ <eq:local-scalar-definition>]

At modulus one both factors in this formula mean one. Its complete evaluation is

#[#set math.equation(numbering: n => "(1.64)")
 $ C_p \( t \, k \, j' \) =
   cases(delim: "{", 1 \, & t = k = 0 \,, 1_(j' = 0) \, & t = 0 \, med k > 0 \,, g_(chi_p^t) \( p^t \,
   p^(j') \) \, & t > 0 \, med k = 0 \,, omega_p^(- 1) G_1 g_(chi_p^(t - 1)) \( p^t \, p^(j' - 1) \) \, & t > 0 \,
   med k = 1 \, med j' gt.eq 1 \,, 0 \, & upright("otherwise") .) $ <eq:local-scalar-values>]

For $t = 0$ and $k > 0$, the congruence fixes $d = p^(j')$ modulo $p^k$,
  whose zero-extended character is nonzero exactly when $j' = 0$.
  For the fourth line the congruence first forces $j' gt.eq 1$.
  Expanding the inner Gauss sum, the sum over $d med mod med p$ is

$ sum_(d med mod med p) chi_p \( d \) e \( - v d \/ p \) =
  omega_p^(- 1) G_1 chi_p \( v \)^(- 1) wide \( p divides.not v \) \, $

which changes the Gauss character from $chi_p^t$ to $chi_p^(t - 1)$.
  If $t > 0$ and $k gt.eq 2$, the permitted lifts $d = d_0 + p^(k - 1) v$ do not change $chi_p^k \( d \)$,
  but their Gauss phase is $e \( - y v \/ p \)$ with the Gauss variable $y$ a unit. Their sum is zero.
  This proves Equation (1.64), including the cases where the Gauss character is principal and zero-extended.

For the original units write $h_p = H \/ p^(j')$, $s_p = s \/ p^k$, and $A_p^compose = A \/ p^t$.
  Chinese remaindering and the substitution $d = h_p \( b_(*) A_p^compose \)^(- 1) d'$ give the additional unit factor

#[#set math.equation(numbering: n => "(1.65)")
 $ U_p = chi_p^(k - t) \( h_p \) chi_p^t \( s_p \) chi_p^(t - k) \( A_p^compose \) chi_p^(t - k) \( b_(*) \) .
   $ <eq:local-unit-factor>]

More explicitly, the outer residue character gives $chi_p^k \( h_p \) chi_p^(- k) \( b_(*) A_p^compose \)$,
  while the Chinese remainder factor and the rescaling of the Gauss argument give $chi_p^t \( b_(*) A_p^compose \)
  chi_p^(- t) \( h_p \/ s_p \)$. Their product is Equation (1.65).
  Since $h_p = \( u \/ p^j \) \( a \/ p^m \)^6$, one has $chi_p \( h_p \) = rho$.

At the primes of $b_(*)$, one has $\( H - b_(*) A d \) \/ s equiv H \/ s med \( mod med b_(*) \)$.
  The local factor in the complete Gauss sum is $sqrt(q_(b_(*))) tau xi \( A \) overline(xi \( H \/ s \))$.
  Here $overline(xi \( H \/ s \)) = overline(xi \( u \)) xi \( s \)$ because $xi \( a \)^6 = 1$.
  This cancels every displayed $xi$ factor in Equation (1.60).
  The product of the last factors in Equation (1.65) cancels $chi_s \( b_(*) \) chi_A \( b_(*) \)^(- 1)$.
  This cancellation is coefficientwise. For any fixed enlargement of $S$,
  the same calculation uses the same ray group $T$.

======= 1.5.2.2 Cancellation of the remaining pair phases. <cancellation-of-the-remaining-pair-phases.>

With $t_p = v_p \( A \)$ and $k_p = v_p \( s \)$, reciprocity at each pair of distinct primes gives

$ cal(R) \( A \, s \) product_p chi_p^(t_p) \( s_p \) chi_p^(- k_p) \( A_p^compose \) =
  product_p cal(R) \( p \, p \)^(t_p k_p) . $

Indeed, for $p eq.not r$ the two orientations have opposite symbol exponents,
  and their quotient is $cal(R) \( p \, r \)$; this cancels the corresponding pair in the bicharacter
  $cal(R) \( A \, s \)$. Only its diagonal remains.

Equation (1.8) gives $gamma_2 \( c \) = mu \( c \) alpha \( c \) G \( c \) \/ gamma_1 \( c \)$.
  The Chinese remainder formula

$ gamma_1 \( c \) = product_(p divides c) gamma_1 \( p \) product_(p < r \, med p \, r divides c) chi_p \( r \)
  chi_r \( p \) $

removes the squarefree part of the remaining pair product.
  If $e_p = v_p \( c \)$ and $l_p = v_p \( n \)$, its exponent at a pair $p < r$ is $t_p t_r - e_p e_r =
  3 \( e_p l_r + e_r l_p + 3 l_p l_r \)$. The cube of $chi_p \( r \) chi_r \( p \)$ is $cal(R) \( p \, r \)$,
  whose square is one. Thus the pair product left after this division is

$ product_(p < r) cal(R) \( p \, r \)^(e_p l_r + e_r l_p + l_p l_r) =
  cal(R) \( c \, n \) G \( n^3 \) product_p overline(G \( p^3 \))^(thin l_p)
  cal(R) \( p \, p \)^(- e_p l_p - l_p \( l_p - 1 \) \/ 2) . $

The equality follows by expanding the quadratic refinement Equation (1.6) on the prime factors of $n^3$.
  The same refinement gives $G \( c \) cal(R) \( c \, n \) G \( n^3 \) = G \( c n^3 \)$,
  which is cancelled by the inserted $overline(G \( c n^3 \))$.
  Finally Equation (1.7) gives $G \( p^3 \) = gamma_3 \( p \)$ and $cal(R) \( p \, p \) = omega_p$.
  These identities account for all pair phases, with no restriction on the ray class of $p$.

The coefficient in Equation (1.60) has therefore separated into prime factors.
  In absolute convergence, its factor at $p$ is the series

#[#set math.equation(numbering: n => "(1.66)")
 $ P_p =  & sum_(e_0 = 0 \, 1\
l \, k \, m gt.eq 0) \( - 1 \)^(e_0) gamma_1^(- e_0) eta \( p \)^(e_0) \( a_p overline(gamma_3) \)^l rho^(k - t)
  omega_p^(t k - e_0 l - l \( l - 1 \) \/ 2) C_p \( t \, k \, j + 6 m \)\
 & #h(33mm)  dot.op Q^(- \( x + 1 \/ 2 \) e_0 - \( 1 + 3 x \) l - w k - 6 z m) \, wide t = e_0 + 3 l . $ <eq:local-P>]

Let $P_p^(*)$ be the same sum restricted to $t > 0$, equivalently to positive valuation of the completed index $A$.

#thm([Lemma 1.23.])[
  (The complete local identity).  #emph[For every nonzero sixth-power-free $u$ with $\( u \, S \) =
    1$ and every prime $p in.not S$, the factors just defined are
#[#set math.equation(numbering: n => "(1.67)")
 $ P_p^(*) & =
   frac(1, 1 - R) {frac(R \( 1 - Q^(- 1) \) - eta \( p \) \( Q - 1 \) Q^(- x - w) V^(1_(j lt.eq 1)), 1 - V) + J_j} \,\
P_p & = frac(1, 1 - V) + 1_(j = 0) frac(W_(upright("loc")), 1 - W_(upright("loc"))) + P_p^(*) \, $ <old-eq:5.13a>]

 where the six values of $J_j$ are
$ j & J_j\
0 & - eta \( p \) rho^(- 1) Q^(- x) + W_(upright("loc")) R\
1 & eta \( p \) Q^(- x - w)\
2 & a_p rho^(- 3) Q^(3 \/ 2 - 3 x)\
3 & - eta \( p \) b_p rho^(- 2) Q^(2 - 3 x - w) + b_p^2 rho^(- 4) Q^(2 - 4 x)\
4 & - eta \( p \) a_p rho^(- 3) Q^(5 \/ 2 - 4 x - w)\
5 & - a_p^2 Q^(3 - 6 x) . $

 Put $W = chi_p \( u \) Q^(- w)$ and $D = eta \( p \) overline(chi_p \( u \)) Q^(- x)$,
   with the original zero extension at $p divides u$, and define
#[#set math.equation(numbering: n => "(1.68)")
 $ H_p = P_p frac(\( 1 - V \) \( 1 - W \), 1 - D) \, wide cal(H)_(eta \, u) =
   product_(p in.not S) H_p . $ <eq:local-H-definition>]

 Then the series in Equation (1.59) has the scalar factorization
#[#set math.equation(numbering: n => "(1.69)")
 $ cal(F)_(eta \, u) \( x \, w \, z \) =
   frac(zeta_F^S \( 6 z \) L^S \( w \, chi_bullet \( u \) \), L^S \( x \, eta overline(chi_bullet \( u \)) \))
   cal(H)_(eta \, u) \( x \, w \, z \) . $ <eq:probe-high>]

 Write $x_r = Re x$, $w_r = Re w$, and $z_r = Re z$. For every fixed $epsilon.alt_0 > 0$,
   the correction product converges normally on a neighborhood of every point in each of the following regions,
   and hence defines a holomorphic function there:
#[#set math.equation(numbering: n => "(1.70)")
 $ x_r gt.eq 51 \/ 100 \, quad z_r gt.eq 17 \/ 50 \, quad w_r gt.eq - 1 \/ 100 \, quad x_r + w_r gt.eq 1 +
   epsilon.alt_0 \;\
x_r gt.eq 7 \/ 8 \, quad z_r gt.eq 33 \/ 200 \, quad w_r gt.eq 19 \/ 20 . $ <eq:local-region-one>]

 Uniformly in imaginary parts and unit phases, $cal(H)_(eta \, u) lt.double_epsilon.alt q_u^epsilon.alt$,
   with the constant also depending on $epsilon.alt_0$ in the first region.
   For $u = 1$ in the second region, $cal(H)_(eta \, 1) = 1 + O \( P_0^(- c_H) \)$ with, for example, $c_H =
   4 \/ 5$. Equation (1.69) begins in absolute convergence and supplies a meromorphic continuation through these
   regions.]
] <lem:local-euler>

The first region will contain the buffered contours for nonprincipal rows, including the reflected numerator line.
  The second contains the principal residue point $w = 1$, $z = 1 \/ 6$ and the contours used to reach it.

#proof[
  There are four families with $t > 0$:
    $\( e_0 \, l \) = \( 0 \, 2 r + 2 \) \, \( 1 \, 2 r \) \, \( 0 \, 2 r + 1 \) \, \( 1 \, 2 r + 1 \)$,
    where $r gt.eq 0$. In each family, increasing $r$ by one and the first permitted $m$ by one multiplies the
    summand of Equation (1.66) by $R$. In fact the phase ratio is $a_p^2$:
    the remaining ratio is one because $gamma_3^2 = omega_p$, $omega_p^2 = 1$, and $rho^6 = 1$.
    Increasing $m$ further multiplies a summand by $V$.
  For transparency, the following table lists every nonzero summand after division by $R^r$.
    In its first row $j$ is arbitrary; all other conditions are as displayed.
    Every omitted case is zero by Equation (1.64).
  #[#set math.equation(numbering: n => "(1.71)")
   $ \( e_0 \, l \) & k & upright("condition on ") \( j \, m \) & R^(- r) upright(" times summand")\
\( 0 \, 2 r + 2 \) & 0 & m gt.eq r + 1 & R \( 1 - Q^(- 1) \) V^(m - r - 1)\
\( 0 \, 2 r + 2 \) & 0 & j = 5 \, med m = r & - a_p^2 Q^(3 - 6 x)\
\( 0 \, 2 r + 2 \) & 1 & j = 0 \, med m = r + 1 & W_(upright("loc")) R\
\( 1 \, 2 r \) & 0 & j = 0 \, med m = r & - eta \( p \) rho^(- 1) Q^(- x)\
\( 1 \, 2 r \) & 1 & j = 1 \, med m = r & eta \( p \) Q^(- x - w)\
\( 1 \, 2 r \) & 1 & m gt.eq r + 1_(j lt.eq 1) & - eta \( p \) \( Q - 1 \) Q^(- x - w) V^(m - r)\
\( 0 \, 2 r + 1 \) & 0 & j = 2 \, med m = r & a_p rho^(- 3) Q^(3 \/ 2 - 3 x)\
\( 0 \, 2 r + 1 \) & 1 & j = 3 \, med m = r & - eta \( p \) b_p rho^(- 2) Q^(2 - 3 x - w)\
\( 1 \, 2 r + 1 \) & 0 & j = 3 \, med m = r & b_p^2 rho^(- 4) Q^(2 - 4 x)\
\( 1 \, 2 r + 1 \) & 1 & j = 4 \, med m = r & - eta \( p \) a_p rho^(- 3) Q^(5 \/ 2 - 4 x - w) .
  $ <eq:local-family-table>]
  Here is a direct check of its entries. In the first family $t = 6 r + 6$.
    For $k = 0$, the principal Gauss lift is $Q^t \( 1 - Q^(- 1) \)$ for $m gt.eq r + 1$;
    its extra boundary value at $\( j \, m \) = \( 5 \, r \)$ is $- Q^(t - 1)$.
    For $k = 1$, the product $omega_p^(- 1) G_1 G_(- 1) = Q$ allows only $\( j \, m \) = \( 0 \, r + 1 \)$.
    These give the first three rows. In the second family $t = 6 r + 1$.
    For $k = 0$ the nonprincipal equality $j' = t - 1$ gives the fourth row.
    For $k = 1$, the principal Gauss lift has its negative boundary at $j' = t$, giving the fifth row,
    and its value $Q^(t - 1) \( Q - 1 \)$ for $j' > t$, giving the sixth row.
    The latter condition is exactly $m gt.eq r + 1_(j lt.eq 1)$.
  For the two odd families $t = 6 r + 3$ and $t = 6 r + 4$.
    Their $k = 0$ lines require $j' = t - 1$ and their $k = 1$ lines require $j' = t$. The phase reductions are
  $ gamma_1 gamma_2 = - alpha \( p \) overline(chi_p \( 4 \)) gamma_3 \, wide gamma_4 / gamma_1 = -
    frac(overline(alpha \( p \)), G \( p \)) . $
  The first is Equation (1.8) at $p$; the second follows from the first and $gamma_2 gamma_4 = 1$.
    Substitution gives the last four rows, including both $j = 3$ terms.
    Thus the table covers all five ramified valuations as well as $j = 0$.
  Summing $r gt.eq 0$ gives $\( 1 - R \)^(- 1)$, and the two unbounded $m$ ranges give $\( 1 - V \)^(- 1)$.
    These sums are precisely the formula for $P_p^(*)$ in Equation (1.67). If $t = 0$, then $e_0 = l = 0$.
    The $k = 0$ terms give $\( 1 - V \)^(- 1)$, while the $k > 0$ terms require $j = m =
    0$ and give $W_(upright("loc")) \/ \( 1 - W_(upright("loc")) \)$. This proves the formula for $P_p$ as well.
  It remains to justify the analytic assertions, especially where $w_r$ is negative. Put $cal(E)_p = P_p^(*) + D$.
    The contribution from $t = 0$ is $\( 1 - V \)^(- 1) + W \/ \( 1 - W \)$, so an exact simplification gives
  #[#set math.equation(numbering: n => "(1.72)")
   $ H_p - 1 = frac(D \( V + W - V W \) - V W + \( 1 - V \) \( 1 - W \) cal(E)_p, 1 - D) . $ <eq:local-H-defect>]
  This expression has no $1 - W$ denominator. At $p divides u$, where $D = W = 0$,
    it reduces to $\( 1 - V \) cal(E)_p$. In both stated regions $\| R \| < 1$, $\| V \| < 1$, and $\| D \| < 1$,
    uniformly away from one, so these are holomorphic local expressions.
  For $p divides.not u$ and $theta.alt = \( - w_r \)_(+)$, the $j = 0$ row gives
  $ \| cal(E)_p \| lt.double Q^(4 - 6 x_r - 6 z_r + theta.alt) + Q^(1 - x_r - w_r - 6 z_r) . $
  In the first region $4 - 6 x_r - 6 z_r lt.eq - 11 \/ 10$ and $theta.alt lt.eq 1 \/ 100$.
    The extra factor $1 - W$ in Equation (1.72) therefore leaves this contribution at most $Q^(- 27 \/ 25)$.
    The term $D W$ is at most $Q^(- 1 - epsilon.alt_0)$; the other terms in that equation are smaller.
    For $p divides u$, the strict second-family term has exponent $1 - x_r - w_r lt.eq - epsilon.alt_0$.
    The closest other exponents in the table are
  $ 3 \/ 2 - 3 x_r lt.eq - 3 \/ 100 \, wide 2 - 3 x_r - w_r lt.eq - 1 \/ 50 - epsilon.alt_0 \, $
  and all remaining ones are no larger than $- 3 \/ 100$. Consequently, with $epsilon.alt_H =
    min \( epsilon.alt_0 \, 1 \/ 50 \)$,
  $ H_p - 1 = O \( Q^(- 1 - epsilon.alt_H) \) quad \( p divides.not u \) \, wide H_p - 1 =
    O \( Q^(- epsilon.alt_H) \) quad \( p divides u \) . $
  In the second region the same comparison gives the stronger bounds
  $ H_p - 1 = O \( Q^(- 363 \/ 200) \) quad \( p divides.not u \) \, wide H_p - 1 =
    O \( Q^(- 33 \/ 40) \) quad \( p divides u \) . $
  The closest good-prime term here is $Q^(1 - x_r - w_r - 6 z_r)$, and the closest ramified term is $Q^(1 - x_r - w_r)$.
  The sum over primes not dividing $u$ converges normally, and the finite product over primes of $u$ is
    $O_epsilon.alt \( q_u^epsilon.alt \)$ by the divisor-product bound.
    The estimates are uniform in all imaginary parts and unit phases.
    When $u = 1$, the good-prime tail above $P_0$ is $O \( P_0^(- 163 \/ 200) \)$ by the ideal count,
    which implies the asserted $O \( P_0^(- 4 \/ 5) \)$ estimate for the product.
    Finally extracting $\( 1 - V \)^(- 1) \( 1 - W \)^(- 1) \( 1 - D \)$ at every prime gives Equation (1.69).
    The normal convergence of the remaining product proves its claimed continuation. ◻
]

For $u = 1$, Equation (1.69) contains $1 \/ L^S \( x \, eta \)$,
  and its numerator has the two principal factors $zeta_F^S \( 6 z \)$ and $zeta_F^S \( w \)$.
  Their residues will produce the target Mellin signal. For intermediate row norms,
  the next section assigns one zero-free rectangle to the finite family of twists associated with each row and
  produces simultaneous polynomial witnesses from a selected zero.
  The principal and bounded rows, together with the outer norm ranges, are treated in Section 8.

==== 1.6 A zero detector with saturated witnesses <sec:detector>

The high expansion contains a sum over sixth-power-free rows $u$.
  We associate each nonprincipal row with a buffered zero-free rectangle for the finite family of character
  presentations that it determines. Whenever the resulting bin lies above a fixed floor,
  a zero produces an inverse polynomial and a plain polynomial with simultaneous lower bounds.
  These witnesses can then be counted using different mean estimates.
  The analytic inputs here are Lemma 13, the smooth calculus of Lemma 9,
  and the global growth estimate in Equation (1.15), together with the deleted Euler-factor bounds of Lemma 14.

Throughout this section, assume $beta_(*) > 51 \/ 100$, where $beta_(*)$ is the global supremum in Equation (1).
  This setting does not select either of the two boundaries in the continuation criterion.

===== 1.6.1 Buffered rectangles and pointwise bounds <buffered-rectangles-and-pointwise-bounds>

Fix the arithmetic data $cal(A)$ independently of $Z$, as in Section 2. In particular, the finite group

$ Theta = chevron.l eta \, hat(T) chevron.r $

contains the target and the fixed ray twists used in the high-row family,
  and every conductor prime of a member of $Theta$ belongs to $S$.
  For a sixth-power-free element $u$, define the finite collection of presentations

$ cal(X)_u = { psi_(u \, nu \, 𝜍) \( n \) = nu \( n \) chi_n \( u \)^𝜍 : nu in Theta \, med 𝜍 in { - 1 \,
  1 } #scale(x: 120%, y: 120%)[}] . $

At a nonunit the value of $chi_n \( u \)^(- 1)$, like every other power of the symbol, is zero.
  The group property of $Theta$ shows that $cal(X)_u$ is closed under conjugation.
  It contains the numerator character $chi_bullet \( u \)$,
  the denominator character $eta overline(chi_bullet \( u \))$,
  and every zero-extended presentation obtained by multiplying either orientation of the sextic symbol by a member
  of $Theta$.

Let $psi^(*)$ be the primitive character inducing a presentation $psi in cal(X)_u$,
  and let $Q_psi$ be its conductor norm. Reciprocity and the fixed conductor primes give

$ Q_psi lt.double_(cal(A)) q_u \, wide L_(upright("orig")) \( s \, psi \) =
  L \( s \, psi^(*) \) product_(p in E_u) \( 1 - psi^(*) \( p \) q_p^(- s) \) \, wide E_u subset S union { p :
  p divides u } . $

The radical of the deleted product has norm $O_S \( q_u \)$.
  These identities retain the original zero extensions; in particular,
  they do not replace a row-dependent mask by an independently chosen mask.

If $v_p \( u \) = j in { 1 \, dots.h \, 5 }$ at a prime $p in.not S$,
  the local character of $chi_bullet \( u \)$ on units at $p$ has order $6 \/ gcd \( 6 \, j \) > 1$.
  A character in $Theta$ is unramified there, so it cannot cancel this local character.
  Consequently a presentation in $cal(X)_u$ can induce the principal character only when $u$ is supported on $S$.
  There are finitely many such sixth-power-free rows, including unit factors.
  Remove them for the present detector; each application must estimate these bounded physical rows separately.

Fix $0 < d_min < d_max < oo$ and write $U = Z^d$, where $d_min lt.eq d lt.eq d_max$.
  The rows in the present dyad satisfy $q_u asymp U$, with fixed comparison constants. Let

$ 0 < tau lt.eq d_min \/ 100 \, wide T_1 = Z^tau > 2 \, wide 0 < e < 10^(- 3) \, wide I = ceil.l 1 \/ e ceil.r + 2 . $

The value of $tau$ will be chosen after the fixed height orders are known.
  For now it is fixed independently of $Z$. In particular $T_1 lt.eq U^(1 \/ 100)$.

#thm([Lemma 1.24.])[
  (Buffered zero-free bins).  #emph[For every retained row $u$, there are an index $i in { 1 \, dots.h \, I -
    1 }$ and a grid point
$ a in \( 51 \/ 100 + e bb(Z)_(gt.eq 0) \) ∩ \[ 51 \/ 100 \, 1 \] $

 with the following properties. For $j = 1 \, dots.h \, I$, set
$ M_j \( u \) = max ({ 51 \/ 100 } union {Re rho : psi in cal(X)_u \, quad L \( rho \, psi^(*) \) = 0 \,\
Re rho gt.eq 51 \/ 100 \, quad \| Im rho \| lt.eq 3 j T_1}) . $

 Then
$ a lt.eq M_i \( u \) < a + e \, wide M_(i + 1) \( u \) < a + 2 e . $

 If $a > 51 \/ 100$, some $psi in cal(X)_u$ has a zero $rho = sigma + i gamma$ with
$ a lt.eq sigma < a + e \, wide \| gamma \| lt.eq 3 i T_1 . $

 For every $epsilon.alt_1 > 0$, every $psi in cal(X)_u$, and sufficiently large $Z$, uniformly in the retained row,
$ \| L_(upright("orig")) \( s \, psi \) \| + \| L_(upright("orig")) \( s \, psi \)^(- 1) \|
  lt.double_(cal(A) \, e \, epsilon.alt_1) U^(epsilon.alt_1) quad
  (Re s gt.eq a + 6 e \, med \| Im s \| lt.eq \( 3 i + 2 \) T_1) . $

 On the reflected line in the same height range,
$ \| L_(upright("orig")) \( 1 - a - 6 e + i t \, psi \) \| lt.double_(cal(A) \, e \, epsilon.alt_1)
  U^(a - 1 \/ 2 + 12 e + epsilon.alt_1) \( 3 + T_1 \)^C \, $

 where $C$ depends only on the fixed real strip and the field.
   There are $O_e \( 1 \)$ possible pairs $\( i \, a \)$, independently of the row and its conductor.]
] <lem:buffered-bins>

#proof[
  Each maximum exists: the collection is finite, the zeros of each nonprincipal primitive $L$-function are
    discrete in compact rectangles, and absolute Euler convergence excludes zeros with real part greater than one.
    The sequence $M_j \( u \)$ is nondecreasing and lies in $\[ 51 \/ 100 \, 1 \]$.
    If every one of its $I - 1$ increments exceeded $e$, then
  $ M_I \( u \) - M_1 \( u \) > \( I - 1 \) e > 1 \, $
  which is impossible. Choose an index with $M_(i + 1) \( u \) - M_i \( u \) lt.eq e$,
    and round $M_i \( u \)$ down on the stated grid. This gives the two inequalities.
    When $a > 51 \/ 100$, the maximum $M_i \( u \)$ is attained by an actual zero, giving $rho$.
    This reasoning allows a zero on the line one.
  For $\| t \| lt.eq \( 3 i + 2 \) T_1$, the closed disk centered at $2 + i t$ with radius $2 - a -
    2 e$ has real part at least $a + 2 e$. Its radius is less than $3 \/ 2 < T_1$,
    so every point in it has imaginary part of absolute value less than $3 \( i + 1 \) T_1$.
    The bound $M_(i + 1) \( u \) < a + 2 e$ therefore excludes every zero of every primitive function in this
    disk. Lemma 13 controls the concentric disk of radius $2 - a - 6 e$.
    Apply it with center $2 + i Im s$, and use absolute Euler convergence farther right.
    Since $Q_psi lt.double_(cal(A)) U$ and $\( 3 + \| t \| \)^2 lt.double_e U^(1 \/ 50)$,
    the arbitrarily small power in that lemma can be chosen so that its contribution is $U^(epsilon.alt_1 \/ 2)$.
    The estimates for polynomial-size deleted Euler products following that lemma supply the other
    $U^(epsilon.alt_1 \/ 2)$.
  For the last assertion, the primitive functional equation recalled in the proof of Lemma 12 [11] Equation (1.1)
    relates the value at $1 - a - 6 e + i t$ to the conjugate primitive function at $a + 6 e - i t$.
    The conjugate presentation is in $cal(X)_u$. The conductor and gamma quotient contribute at most
  $ Q_psi^(a - 1 \/ 2 + 6 e) \( 3 + \| t \| \)^C . $
  The reflected primitive value has an arbitrarily small $U$-power by the preceding disk bound.
    Finally, $1 - a - 6 e gt.eq - 6 e$, so the upper bound for the deleted product is $U^(6 e + epsilon.alt_1)$,
    after reducing the preliminary losses. This proves the reflected estimate.
    The ranges of $i$ and $a$ give $O_e \( 1 \)$ pairs. ◻
]

We call $\( i \, a \)$ the bin of the row and put

$ delta = 2 a - 1 \, wide 1 \/ 50 lt.eq delta lt.eq 1 . $

Every primitive character inducing a presentation in $cal(X)_u$ is a finite-order Hecke character.
  The definition of $beta_(*)$, together with $beta_(*) > 51 \/ 100$, therefore gives $M_i \( u \) lt.eq
  beta_(*)$. In particular, the bin satisfies the exact inequalities

$ a lt.eq beta_(*) \, wide delta lt.eq 2 beta_(*) - 1 . $

The bin $a = 51 \/ 100$ will be bounded by the trivial row count.
  For $a > 51 \/ 100$, the zero in Lemma 27 produces large polynomials to which the moments can be applied.

#thm([Lemma 1.25.])[
  (Pointwise dyadic estimates).  #emph[Fix bounded nonnegative ranges for $r \, m$, and let
$ M_r = M_psi \( r \; W_M \) \, wide S_m = S_psi \( m \; W_S \) $

 denote the polynomials of Equations (1.3) and (1.2), now at base $U$.
   Suppose $psi in cal(X)_u$, the untwisted profiles have uniformly bounded smooth seminorms on a fixed annulus,
   and any pure norm twist has height at most $\( 3 i + 1 \) T_1$.
   All additional Mellin frequencies entering the same $L$-argument are required to have total absolute value at
   most $T_1 \/ 2$.]
  #emph[For every $epsilon.alt > 0$, there are $e_0 > 0$, depending only on $epsilon.alt$ and the bounded length
    ranges, and a finite height order $A_(cal(A))$, uniform in the moving rows and profiles, such that, when
$ 0 < e < e_0 \, wide \( 1 + T_1 \)^(A_(cal(A))) lt.eq U^(epsilon.alt \/ 10) \, $

 the following estimates hold for sufficiently large $Z$:
#[#set math.equation(numbering: n => "(1.73)")
 $ \| M_r \|^2 lt.double_(cal(A) \, epsilon.alt) U^(delta r + epsilon.alt) \, $ <old-eq:6.2>]

#[#set math.equation(numbering: n => "(1.74)")
 $ \| S_m \|^2 lt.double_(cal(A) \, epsilon.alt) U^(delta min \( m \, 1 - m \) + epsilon.alt) . $ <old-eq:6.3>]

 The external tail order may be chosen after the positive number $tau$. It does not change $A_(cal(A))$.]
] <lem:detector-dyads>

#proof[
  We spell out the height restriction because a full infinite contour shift would not be justified by the bin.
    For a fixed annular $W$, a bounded real number $sigma$, and a pure twist $y^(i omega)$,
    Mellin inversion on a line $c + sigma > 1$ gives
  $ & U^(- r \/ 2) sum_n mu \( n \) psi \( n \) W \( q_n \/ U^r \) \( q_n \/ U^r \)^(- sigma + i omega)\
 & quad = frac(1, 2 pi i) integral_(\( c \)) cal(M) W \( s \) thin U^(r \( s + sigma - i omega - 1 \/ 2 \))
   L_(upright("orig")) \( s + sigma - i omega \, psi \)^(- 1) thin d s . $
  Here $cal(M) W$ is the Mellin transform defined in Lemma 9.
    The twist occurs in the $L$-argument, not in the transform whose tails are estimated.
    Shift only the portion with added frequency at most the assigned fraction of $T_1$ to $Re \( s + sigma \) =
    a + 6 e$. The horizontal joins and the shifted portion remain in the zero-free rectangle of Lemma 27.
    Its bound gives $U^(\( a - 1 \/ 2 + 6 e \) r + epsilon.alt_1)$ for the central portion.
  Leave the remaining tails on the absolute line, which we may take to be $Re \( s + sigma \) = 2$.
    There the reciprocal Euler product is absolutely bounded.
    On the inverse joins the reciprocal remains inside the buffered rectangle.
    Since the real join interval and the length range are bounded,
    the remaining arithmetic and scale factors on a join are $O \( U^B \( 1 + \| Im s \| \)^J \)$ for fixed $B \,
    J$ chosen before the external tail order. The pointwise Mellin bound in Equation (1.12),
    applied on that compact real interval with derivative order $N + ceil.l J ceil.r + 1$,
    bounds each horizontal join by $O \( U^B T_1^(- N) \)$. The separate vertical tails have the same bound by
    Equation (1.11). Both estimates apply to the untwisted profile, uniformly in the stated family.
    Because $T_1 = Z^tau$, $tau > 0$, and all lengths lie in a fixed bounded interval,
    a sufficiently large fixed $N$ makes these errors smaller than the claimed bound.
    Taking $e$ and $epsilon.alt_1$ small in the prescribed $epsilon.alt$ proves Equation (1.73).
  For the plain polynomial the same calculation uses $L_(upright("orig"))$ instead of its reciprocal.
    Shifting to $Re \( s + sigma \) = a + 6 e$ gives
  $ \| S_m \| lt.double U^(\( a - 1 \/ 2 + 6 e \) m + epsilon.alt_1) + O \( U^B T_1^(- N) \) . $
  Alternatively shift its central portion to $Re \( s + sigma \) = 1 - a - 6 e$.
    The function is entire because the row is nonprincipal. The reflected estimate of Lemma 27 gives
  $ \| S_m \| lt.double U^(a - 1 \/ 2 + 12 e + epsilon.alt_1) U^(\( 1 \/ 2 - a - 6 e \) m) \( 3 + T_1 \)^C +
    O \( U^B T_1^(- N) \) . $
  The joins here need only the global upper strip bound and the negative-strip bound for the deleted product,
    since no reciprocal is present. These give fixed $B \, J$ as above,
    so the pointwise Mellin estimate bounds the joins and the integrated Fourier estimate bounds the absolute-line
    tails. Taking the better central bound, choosing $N$ to dominate also the possibly negative exponent when $m >
    1$, and using the displayed height hypothesis proves Equation (1.74).
    A primitive conductor smaller than $U$ reduces the reflected conductor factor.
    The original deleted Euler factors have already been included in Lemma 27.
  There are only finitely many separated variables in any one $L$-argument.
    Assign each a fixed fraction of the single $T_1 \/ 2$ allowance;
    do not assign that allowance anew at successive shifts. The profile windows and the finite height orders used
    in the row estimates are fixed before $N$. Lemma 9 differentiates only the untwisted separating profiles when
    increasing $N$, which proves the last assertion. ◻
]

===== 1.6.2 Simultaneous saturated witnesses <simultaneous-saturated-witnesses>

At a selected zero, the truncated-inverse construction below produces a product with squared size at least
  $U^(delta \( r + m \) - epsilon.alt)$. The pointwise estimates bound the same product by
  $U^(delta \( r + min \( m \, 1 - m \) \) + epsilon.alt)$.
  Since $delta gt.eq 1 \/ 50$, these two bounds force $m lt.eq 1 \/ 2 + O \( epsilon.alt \)$.
  Each factor then attains its own pointwise exponent up to the prescribed loss;
  this is the saturation asserted in the next proposition.

#thm([Proposition 1.26.])[
  (Two saturated witnesses).  #emph[Let $u$ have a bin $\( i \, a \)$ with $a > 51 \/ 100$,
    and assume the loss and height hypotheses of Lemma 28. For every $t in \[ 1 \, 3 \/ 2 \]$,
    and every prescribed $epsilon.alt > 0$, after reducing its preliminary losses, there are $psi in cal(X)_u$,
    a zero $rho = sigma + i gamma$ as in Lemma 27, dyadic lengths $D = U^r$, $N = U^m$,
    and two polynomials $M_r \, S_m$ for the common row character $psi$ such that
#[#set math.equation(numbering: n => "(1.75)")
 $ r lt.eq t + O \( 1 \/ log U \) \, wide r + m gt.eq t - O \( 1 \/ log U \) \,
   wide \| M_r S_m \|^2 gt.double_(cal(A) \, epsilon.alt) U^(delta \( r + m \) - epsilon.alt) . $ <eq:detector-note>]

 Their lengths and individual values also satisfy
#[#set math.equation(numbering: n => "(1.76)")
 $ t - 1 / 2 - O \( epsilon.alt \) lt.eq r lt.eq t + O \( 1 \/ log U \) \, wide 0 lt.eq m lt.eq 1 / 2 +
   O \( epsilon.alt \) \,\
\| M_r \|^2 gt.double_(cal(A) \, epsilon.alt) U^(delta r - epsilon.alt) \,
  wide \| S_m \|^2 gt.double_(cal(A) \, epsilon.alt) U^(delta m - epsilon.alt) . $ <eq:saturated-witness>]

 The constants in the $O \( epsilon.alt \)$ terms are absolute on the stated parameter ranges.
   Both polynomials have the same twist height $gamma - nu$, where $\| nu \| lt.eq
   c T_1$ for a fixed $c > 0$ chosen within the cumulative frequency allowance.
   Their untwisted profiles form a uniformly smooth annular family.
   For each row, both witnesses use one presentation $psi_(u \, theta.alt \, 𝜍)$,
   selected by a label $\( theta.alt \, 𝜍 \)$ in the fixed finite set $Theta times { - 1 \, 1 }$.
   The presentation itself varies with $u$. The dyadic pair can likewise be selected separately for each row from
   $O \( \( log U \)^2 \)$ possibilities.]
] <prop:detector-witness>

#proof[
  The truncated-inverse and Gamma-integral construction is a form of the classical zero detector;
    compare [21] Appendix C and [14] Section 13.1. The buffered row-dependent rectangle and the simultaneous lower
    bounds needed here are established below. Choose the zero $rho$ supplied by the bin and set
  $ D_(*) = U^t \, wide Y_(*) = U^20 . $
  Let $V_lt.eq$ be a fixed smooth function equal to one on $\[ 0 \, 1 \]$ and zero on $\[ 2 \, oo \)$. Define
  $ C_psi \( s \) = sum_l mu \( l \) psi \( l \) V_lt.eq \( q_l \/ D_(*) \) q_l^(- s) \, wide J =
    frac(1, 2 pi i) integral_(\( 2 \)) Y_(*)^z Gamma \( z \) L_(upright("orig")) \( rho + z \, psi \)
    C_psi \( rho + z \) thin d z . $
  The row character is nonprincipal, so $L_(upright("orig"))$ is entire.
    Moving the line to $Re z = - 1 \/ 4$ crosses only the pole of $Gamma \( z \)$ at zero,
    and its residue vanishes because $L_(upright("orig")) \( rho \, psi \) = 0$.
    The global strip bound in Equation (1.15), together with the deleted Euler factors, bounds the new line by
  $ U^(- 5) U^2 D_(*)^(thin 1 - sigma + 1 \/ 4 + o \( 1 \)) T_1^2 . $
  Indeed $Re \( rho - 1 \/ 4 \) gt.eq 26 \/ 100 > 0$, so the deleted product has an arbitrarily small $U$-power;
    the deliberately weaker $U^2$ includes the primitive conductor bound.
    The finite polynomial is bounded by the displayed power of $D_(*)$ using the ideal count.
    Finally, the fixed polynomial in the added height is integrable against $Gamma \( - 1 \/ 4 + i v \)$,
    since $\( 1 + \| gamma + v \| \)^2 lt.eq \( 1 + \| gamma \| \)^2 \( 1 + \| v \| \)^2$.
    Uniformly for $1 lt.eq t lt.eq 3 \/ 2$,
  $ - 3 + t \( 5 \/ 4 - sigma \) lt.eq - 3 + 3 / 2 (5 / 4 - 51 / 100) = - 189 / 100 . $
  Thus $J = o \( 1 \)$. This Gamma integration uses only global upper bounds and consumes no reciprocal height
    allowance.
  On the original line, absolute convergence and the Mellin formula for the exponential give
  $ J = sum_(l \, k) mu \( l \) psi \( l k \) V_lt.eq \( q_l \/ D_(*) \) \( q_l q_k \)^(- rho)
    e^(- q_l q_k \/ Y_(*)) . $
  For $1 < q_n lt.eq D_(*)$, the coefficient of $psi \( n \) q_n^(- rho)$ is $sum_(l divides n) mu \( l \) = 0$.
    For $n = 1$ it is one. When $q_n > D_(*)$, $V_lt.eq \( 2 q_n \/ D_(*) \) = 0$.
    Consequently insertion of $1 - V_lt.eq \( 2 q_l q_k \/ D_(*) \)$ removes exactly the unit contribution
    $e^(- 1 \/ Y_(*)) = 1 + o \( 1 \)$. The resulting tail has absolute value $1 + o \( 1 \)$.
    Multiplying it by a fixed smooth terminal cutoff equal to one for $q_l q_k lt.eq
    U^21$ and zero for $q_l q_k gt.eq 2 U^21$ changes it by $o \( 1 \)$; this follows from $Y_(*) = U^20$,
    exponential decay, and the ideal count.
  Partition $q_l asymp D$, $q_k asymp N$ by a fixed smooth dyadic partition.
    There are $O \( \( log U \)^2 \)$ relevant pairs, and their support satisfies
  $ D lt.double D_(*) \, wide D N gt.double D_(*) \, wide D N lt.double U^21 . $
  With $x = q_l \/ D$, $y = q_k \/ N$, the profile for a pair is
  $ W_1 \( x \) V_lt.eq \( D x \/ D_(*) \) thin W_2 \( y \) thin H_(D \, N) \( x y \) \, $
  where $Omega$ is a fixed annular cutoff equal to one on the product of the supports of $W_1 \, W_2$, and
  $ H_(D \, N) \( s \) = Omega \( s \) \[ 1 - V_lt.eq \( 2 D N s \/ D_(*) \) \] e^(- D N s \/ Y_(*))
    V_(upright("term")) \( D N s \/ U^21 \) . $
  Every fixed logarithmic derivative is bounded uniformly in $D \, N \, U$.
    On a cutoff transition its argument is bounded, and a logarithmic derivative of the exponential is a
    polynomial in its argument times that exponential. Logarithmic Fourier inversion therefore gives
  $ H_(D \, N) \( x y \) & = frac(1, 2 pi) integral_(bb(R)) hat(H)_(D \, N) \( nu \) x^(i nu) y^(i nu) thin d nu \,\
integral_(\| nu \| > c T_1) \| hat(H)_(D \, N) \( nu \) \| \( 1 + \| nu \| \)^J thin d nu &
  lt.double_(J \, N_0 \, c) T_1^(- N_0) $
  for every fixed $J \, N_0$. The coefficient $L^1$-norm on the full line is also uniformly bounded.
    Trivial bounds for the two finite polynomials have a fixed $U$-power because their lengths are bounded by
    $U^(21 + o \( 1 \))$. After $tau > 0$ is fixed, choose $N_0$ so that the discarded Fourier tail is $o \( 1 \)$.
  The absolute value of the remaining sum of integrals is bounded below by a positive constant.
    The number of dyadic pairs and the uniform $L^1$-norm show that, for one pair and one $\| nu \| lt.eq c T_1$,
    the product of the two unnormalized blocks has absolute value $gt.double \( log U \)^(- 2)$.
    Both profiles have the same height $gamma - nu$:
  $ W_M \( x \) & = W_1 \( x \) V_lt.eq \( D x \/ D_(*) \) x^(- sigma - i \( gamma - nu \)) \,\
W_S \( y \) & = W_2 \( y \) y^(- sigma - i \( gamma - nu \)) . $
  The first extra cutoff remains part of the inverse annular profile and creates no second frequency.
    Removing the factors $D^(1 \/ 2 - sigma)$ and $N^(1 \/ 2 - sigma)$ by central normalization gives
  $ \| M_r S_m \|^2 gt.double \( log U \)^(- 4) \( D N \)^(2 sigma - 1) gt.eq U^(delta \( r + m \) - epsilon.alt) $
  for sufficiently large $U$. The support inequalities give the two length bounds in Equation (1.75).
  Apply Lemma 28 to these profiles, choosing its loss smaller than the present $epsilon.alt$.
    Comparison of the product lower bound with the two upper bounds gives
  $ delta { m - min \( m \, 1 - m \) } = 2 delta \( m - 1 \/ 2 \)_(+) lt.double epsilon.alt . $
  Since $delta gt.eq 1 \/ 50$, this implies $m lt.eq 1 \/ 2 + O \( epsilon.alt \)$ with an absolute constant.
    The support inequality then gives $r gt.eq t - 1 \/ 2 - O \( epsilon.alt \)$.
    Dividing the product lower bound in turn by each individual upper bound gives the two individual lower bounds
    in Equation (1.76). Only the dyadic support errors are $O \( 1 \/ log U \)$;
    all other losses are arbitrarily small fixed powers. Lemma 9 permits the stated rowwise choices with a fixed
    polynomial height factor. ◻
]

==== 1.7 A sextic-sieve row count <sec:sextic-row-count>

The zero detector supplies a large inverse polynomial for each row above the floor bin.
  We now turn that lower bound into a count of physical rows.
  We first prove the required squarefree sextic large sieve in the primary convention,
  using the norm-recursion method of Blomer, Goldmakher, and Louvel [4] Section 3.
  We then fix the part of a physical row whose prime valuations are at least two and apply the sieve to its
  squarefree factor. The size of the fixed part also gives an independent upper bound for the number of rows;
  the better of the two bounds produces the required exponent.

===== 1.7.1 The sextic large sieve in the primary convention <the-sextic-large-sieve-in-the-primary-convention>

We continue to use the fixed finite set $S$ of prime ideals,
  containing the primes above $6$ and all fixed conductor primes.
  All ideal indices in the next lemma are prime to $S$ and are represented by their primary generators.
  In particular, “squarefree” refers to ideals of $cal(O) = bb(Z) \[ omega \]$, not to their rational norms.

#thm([Lemma 1.27.])[
  (Sextic large sieve).  #emph[Let $K \, D gt.eq 1$, let $𝜍 in { - 1 \, 1 }$,
    and let $\( c_n \)$ be any sequence of complex numbers indexed by the squarefree ideals outside $S$.
    The sequence is fixed independently of the row $k$. For every $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(1.77)")
 $ sum_(k med upright("sf")\
q_k lt.eq K) lr(|sum_(n med upright("sf")\
q_n lt.eq D) c_n chi_n \( k \)^𝜍|)^2 lt.double_(S \, epsilon.alt) \( K D \)^epsilon.alt { K +
  D + \( K D \)^(2 \/ 3) #scale(x: 120%, y: 120%)[}] sum_(n med upright("sf")\
q_n lt.eq D) \| c_n \|^2 . $ <eq:sextic-large-sieve>]

 Every symbol in this formula has its original zero value on a nonunit.
   A fixed restriction of the row set is allowed. A fixed restriction of the coefficient support is allowed by
   extending that coefficient sequence by zero. Such a restriction may depend on an object fixed before the row
   sum, but the coefficients may not otherwise depend on $k$.]
] <lem:sextic-large-sieve>

#proof[
  We follow the higher-order large-sieve recursion of Blomer, Goldmakher, and Louvel [4] Section 3,
    giving the local verification for the present primary normalization.
    In the finite Fourier calculation the individual residue characters act on elements;
    their unit-trivial quotient is the character on ideals to which we apply Poisson summation.
  For good ideals $a \, b$, represented by their primary generators, put
  $ F_b \( a \) = chi_a \( b \) \, wide J = { 1 \, 2 \, 4 } . $
  This uses the original zero-extended symbol, also when $a$ is not squarefree.
    It is multiplicative in both $a$ and $b$. In every power below, including a multiple of six,
    a nonunit still has value zero. For $M > 0$ let
  $ cal(I)_M = { a upright(" good") : M < q_a lt.eq 2 M } \, wide cal(A)_M = { a in cal(I)_M :
    a upright(" squarefree") } . $
  For a sequence supported on $cal(A)_N$ write $parallel lambda parallel_2^2 =
    sum_(b in cal(A)_N) \| lambda_b \|^2$, and define
  $ D_j \( M \, N \) & = sup_(parallel lambda parallel_2 = 1) sum_(a in cal(A)_M)
    lr(|sum_(b in cal(A)_N) lambda_b F_b \( a \)^j|)^2 \,\
E_j \( M \, N \) & = sup_(parallel lambda parallel_2 = 1) sum_(a in cal(I)_M)
  lr(|sum_(b in cal(A)_N) lambda_b F_b \( a \)^j|)^2 . $
  An empty support gives norm zero. These norms include all finite ray classes.
    We will prove the symmetric bound for $D_1$; the matrix in the lemma is its transpose with the two lengths
    exchanged.
  The squarefree norm $D_j$ is our target. We also need $E_j$,
    since Poisson summation produces arbitrary evaluation ideals.
    Opening the square in its defining sum and pairing the column characters will replace a row length $M$ by a
    dual length of order $N^2 \/ M$. A power decomposition then returns the unrestricted row sum to squarefree
    norms. It selects either the first-power or the second-power factor, so the exponents $j in { 1 \, 2 \,
    4 }$ are kept together: this set is closed under $j mapsto 2 j med \( mod med 6 \)$.
    We will use this cycle to improve a provisional exponent in the bound for $D_j$.
  #emph[The paired summation formula.] Use the fixed finite group
  $ cal(T) = ker #scale(x: 120%, y: 120%)[\(] \( cal(O) \/ 36 cal(O) \)^times
    arrow.r \( cal(O) \/ 3 cal(O) \)^times #scale(x: 120%, y: 120%)[\)] \, wide t \( b \) = b med mod med 36 cal(O) . $
  The primary normalization identifies these with the ray classes modulo $36 cal(O)$:
    each unit orbit has a unique representative equal to one modulo $3$. In particular $t$ is multiplicative.
    This subdivision is fixed, since the primes above $2$ and $3$ belong to $S$.
  For a global unit $u$ and a good prime $p$, reduction modulo $p$ gives $chi_p \( u \) = u^(\( q_p - 1 \) \/ 6)$.
    Since $q_p equiv 1 med \( mod med 6 \)$, multiplication over the prime factors of $b$ gives
  #[#set math.equation(numbering: n => "(1.78)")
   $ chi_b \( u \) = u^(\( q_b - 1 \) \/ 6) . $ <eq:sextic-sieve-unit-class>]
  The exponent is read modulo six: expanding a product of integers $1 + 6 h$ proves the equality of exponents.
    Thus equal $t$-classes have the same restriction to the six global units.
    They also have the same residue modulo $4$, which controls the reciprocity factor $cal(R)$ of Lemma 8.
  Let $b \, c$ be coprime squarefree good ideals with $t \( b \) = t \( c \)$ and let $j in J$.
    The raw character on elements
  $ Theta_(b \, c)^(\( j \)) \( z \) = chi_b \( z \)^j overline(chi_c \( z \)^j) quad \( z med mod med b c \) $
  is trivial on global units by Equation (1.78). It therefore defines a finite-order ray character on ideals by
  $ Psi_(b \, c)^(\( j \)) \( \( z \) \) = Theta_(b \, c)^(\( j \)) \( z \) . $
  For fractional ideals prime to $b c$, the residue symbols are evaluated on local unit fractions;
    the same unit cancellation makes this definition independent of the generator.
    At each good prime the sextic residue character has exact order six,
    since the residue multiplicative group is cyclic. Hence its powers $j$ and $- j$ are nontrivial.
    CRT shows that $Theta_(b \, c)^(\( j \))$ has raw conductor $b c$,
    and the ray character has the same conductor: omitting a prime would contradict this nontriviality by varying
    only its residue. It is extended by zero on ideals meeting $b c$.
    For the pair $b = c = 1$ define $Psi_(1 \, 1)^(\( j \))$ to be principal.
  Sextic reciprocity, with its factor fixed by $t \( b \) = t \( c \)$, gives for every good ideal $a$
  #[#set math.equation(numbering: n => "(1.79)")
   $ Psi_(b \, c)^(\( j \)) \( a \) = F_b \( a \)^j overline(F_c \( a \)^j) . $ <eq:sextic-sieve-pair-values>]
  For coprime inputs the two reciprocity factors cancel; on the other inputs both sides are zero.
    With the Gauss sums already defined in the arithmetic preliminaries, CRT using $z = c v + b w$ gives
  #[#set math.equation(numbering: n => "(1.80)")
   $ Gamma_(b \, c)^(\( j \)) & := q_(b c)^(- 1 \/ 2) sum_(z med mod med b c) Theta_(b \, c)^(\( j \)) \( z \)
     e \( z \/ \( b c \) \)\
 & = chi_b \( c \)^j overline(chi_c \( b \)^j) gamma_j \( b \) gamma_(- j) \( c \) =
   eta_(t \( b \) \, j) gamma_j \( b \) gamma_(- j) \( c \) \, $ <eq:sextic-sieve-pair-gauss>]
  where $eta_(t \( b \) \, j) = cal(R) \( b \, c \)^j$ depends only on the common class.
    Every $gamma_(plus.minus j)$ here has modulus one by prime Gauss orthogonality and CRT.
    Formula (1.80) retains $gamma_(- j)$ itself, including its factor at $- 1$ under conjugation.
  Choose once a nonnegative $W in C_c^oo \( \( 0 \, oo \) \)$ with $W gt.eq 1$ on $\[ 1 \, 2 \]$.
    For the Fourier transform and self-dual measure in the arithmetic preliminaries, put $w \( z \) =
    W \( \| z \|^2 \)$ and define $cal(W)$ by
  $ hat(w) \( y \) = cal(W) \( \| y \|^2 \) . $
  The transform is radial, smooth at zero, and rapidly decreasing. Thus
  #[#set math.equation(numbering: n => "(1.81)")
   $ cal(W) \( x \) lt.double_A \( 1 + x \)^(- A) \, wide integral_(bb(R)) \| cal(M) cal(W) \( sigma + i t \) \|
     thin d t < oo quad \( sigma > 0 \) . $ <eq:sextic-sieve-transform-bounds>]
  Here $cal(M)$ denotes the Mellin transform. The second assertion follows by integration by parts in the Mellin
    integral; all logarithmic derivatives are bounded at zero and rapidly decreasing at infinity.
    Scaling the Fourier transform gives $M cal(W) \( M \| y \|^2 \)$ for $z mapsto W \( \| z \|^2 \/ M \)$.
  For $b c eq.not 1$, finite Fourier inversion for the primitive raw character is
  $ sum_(v med mod med b c) Theta_(b \, c)^(\( j \)) \( v \) e \( v y \/ \( b c \) \) =
    overline(Theta_(b \, c)^(\( j \)) \( y \)) sqrt(q_(b c)) thin Gamma_(b \, c)^(\( j \)) . $
  For a nonunit $y$ the left side vanishes because one nontrivial local character is summed against the trivial
    additive character. For the stated $e$ and $d mu$, the trace pairing on the basis $\( 1 \, omega \)$ has
    matrix $mat(delim: "(", 0, 1; 1, - 1)$, of determinant $- 1$, and the $d mu$-covolume of $cal(O)$ is one.
    Thus the dual of $b c cal(O)$ is $\( b c \)^(- 1) cal(O)$, while the covolume of $b c cal(O)$ is $q_(b c)$.
    Coset Poisson summation, followed by division by the six generators of each ideal, therefore gives
  #[#set math.equation(numbering: n => "(1.82)")
   $ sum_(frak(a) eq.not 0) W \( q_(frak(a)) \/ M \) Psi_(b \, c)^(\( j \)) \( frak(a) \) =
     frac(M Gamma_(b \, c)^(\( j \)), sqrt(q_(b c))) sum_(frak(a) eq.not 0) cal(W) \( M q_(frak(a)) \/ q_(b c) \)
     overline(Psi_(b \, c)^(\( j \)) \( frak(a) \)) . $ <eq:sextic-sieve-pair-poisson>]
  Both sums here are over all nonzero integral ideals. The division by six uses unit-triviality of
    $Theta_(b \, c)^(\( j \))$ and radiality of the weight. The zero frequency vanishes since this character is
    nontrivial.
  #emph[Poisson transformation of the squared norm.] For $lambda$ supported on one $t$-class in $cal(A)_N$, set
  $ Q_j \( M \, N \; lambda \) = sum_(b \, c in cal(A)_N\
\( b \, c \) = 1) lambda_b overline(lambda_c) sum_(frak(a) eq.not 0) W \( q_(frak(a)) \/ M \)
  Psi_(b \, c)^(\( j \)) \( frak(a) \) . $
  We claim, for every $epsilon > 0$,
  #[#set math.equation(numbering: n => "(1.83)")
   $ \| Q_j \( M \, N \; lambda \) \| & lt.double_(S \, epsilon) \( 2 + M N \)^epsilon parallel lambda parallel_2^2\
 & quad times {M + M / N max_(1 lt.eq H\
H lt.double_(S \, epsilon) \( 2 + M N \)^epsilon N^2 \/ M) E_j \( H \, N \)} . $ <eq:sextic-sieve-pair-norm>]
  The maximum runs over dyadic shells and is zero if empty.
    If $N lt.eq 1$, only the unit good ideal can occur and the annular ideal count proves the $M$ term.
    Also $Q_j = 0$ when $M$ is below a fixed positive constant,
    because $W$ has a fixed upper support endpoint and nonzero ideals have norm at least one.
  Suppose $N > 1$ and normalize $parallel lambda parallel_2 = 1$.
    Then every pair in $Q_j$ is nontrivial and $q_(b c) asymp N^2$.
    Apply Equation (1.82) and take the triangle inequality over the dual ideals.
    For a small $delta > 0$ put $Z = \( 2 + M N \)^delta$. Cauchy gives $\( sum_b \| lambda_b \| \)^2 lt.double
    N$. By Equation (1.81), the part with $q_(frak(a)) > Z N^2 \/ M$ is, for any $A > 1$, at most
  $ M sum_(q_(frak(a)) > Z N^2 \/ M) \( M q_(frak(a)) \/ N^2 \)^(- A) lt.double N^2 Z^(1 - A) . $
  The same bound holds if the cutoff is below one. Taking $A$ large makes this an arbitrary negative power error.
  In the remaining sum write $frak(a) = a_0 frak(s)$, with $a_0$ good and $frak(s)$ supported on $S$,
    and choose one generator $s_0$ for each fixed $frak(s)$. Equations (1.79) and (1.80) give the separated factors
  $ overline(Psi_(b \, c)^(\( j \)) \( a_0 frak(s) \)) = overline(F_b \( a_0 \)^j) F_c \( a_0 \)^j
    overline(chi_b \( s_0 \)^j) chi_c \( s_0 \)^j . $
  All $chi_b \( s_0 \)$ have modulus one. Split $a_0$ into shells $a_0 in cal(I)_H$,
    where $H lt.double Z N^2 \/ \( M q_(frak(s)) \)$, and insert Mellin inversion for $cal(W)$ on $Re w = delta$.
    Apart from a bounded factor depending on $M \, q_(a_0) \, q_(frak(s))$, the two coefficient sequences are
  $ A_b = lambda_b gamma_j \( b \) overline(chi_b \( s_0 \)^j) q_b^(- 1 \/ 2 + delta + i t) \, wide B_b =
    overline(lambda_b) gamma_(- j) \( b \) chi_b \( s_0 \)^j q_b^(- 1 \/ 2 + delta + i t) . $
  They are fixed across the $a_0$ sum and have absolute values $lt.double N^(- 1 \/ 2 + delta) \| lambda_b \|$.
    Detecting $\( b \, c \) = 1$ by Möbius inversion and applying Cauchy in $a_0$ gives
  $ & sum_(a_0 in cal(I)_H) lr(|sum_(b \, c in cal(A)_N\
\( b \, c \) = 1) A_b B_c overline(F_b \( a_0 \)^j) F_c \( a_0 \)^j|)\
 & quad lt.eq E_j \( H \, N \) sum_(frak(d)) (sum_(frak(d) divides b) \| A_b \|^2)^(1 \/ 2)
   (sum_(frak(d) divides b) \| B_b \|^2)^(1 \/ 2) lt.double N^(- 1 + 3 delta) E_j \( H \, N \) . $
  Here the divisor bound absorbs the sum over $frak(d)$. Conjugating the entire first polynomial uses the same
    $E_j$ norm. The factors with $H < 1$ have just the unit evaluation ideal and satisfy $E_j \( H \, N \)
    lt.double N$. There are only a fixed power of $log \( 2 + Z N^2 \)$ choices of $frak(s)$ and of the dyadic
    shell, because $S$ is fixed and a nonzero $Q_j$ has $M$ bounded below.
    Equation (1.81) integrates the $t$ variable. Choosing $delta$ sufficiently small in terms of $epsilon$ proves
    Equation (1.83), including the allowed global loss on its $M$ term.
  We now apply this paired estimate to $E_j$. Partition its inner sum by $t$, insert $W$, and open the square.
    Write the two squarefree indices as $d b \, d c$, where $d$ is their gcd, $\( b \, c \) = 1$,
    and $\( d \, b c \) = 1$. Their residual classes agree because $t$ is multiplicative.
    Index multiplicativity and Equation (1.79) give on every good $a$
  $ F_(d b) \( a \)^j overline(F_(d c) \( a \)^j) = 1_(\( a \, d \) = 1) Psi_(b \, c)^(\( j \)) \( a \) . $
  Let $frak(s)_S = product_(frak(p) in S) frak(p)$. Möbius inversion for $\( a \, frak(s)_S d \) = 1$ writes $a =
    frak(r) frak(a)$ with $frak(r) divides frak(s)_S d$. Choose one generator $r_0$ of each fixed $frak(r)$.
    The value of $Psi$ at $frak(r)$ separates as $chi_b \( r_0 \)^j overline(chi_c \( r_0 \)^j)$,
    so the common residual sequence is
  $ lambda'_b = lambda_(d b) 1_(\( b \, d \) = 1) chi_b \( r_0 \)^j \, wide \| lambda'_b \| lt.eq \| lambda_(d b) \| . $
  It is supported on $cal(A)_(N \/ q_d)$ in one class. Apply Equation (1.83) with lengths $M \/
    q_(frak(r))$ and $N \/ q_d$. The summed coefficient mass is at most
  $ sum_d sum_(frak(r) divides frak(s)_S d) sum_b \| lambda_(d b) \|^2 lt.eq
    d_(cal(O)) \( frak(s)_S \) sum_m d_(cal(O)) \( m \)^2 \| lambda_m \|^2
    lt.double_(S \, delta) \( 2 + N \)^delta parallel lambda parallel_2^2 . $
  Writing $Delta_(upright(r)) = q_(frak(r))$ and $Delta_(upright(d)) = q_d$, we have $1 lt.eq
    Delta_(upright(d)) lt.eq 2 N$ and $1 lt.eq Delta_(upright(r)) lt.eq q_(frak(s)_S) Delta_(upright(d))$.
    We obtain the recursive interface
  #[#set math.equation(numbering: n => "(1.84)")
   $ E_j \( M \, N \) & lt.double_(S \, epsilon) \( 2 + M N \)^epsilon max_(1 lt.eq Delta_(upright(d)) lt.eq 2 N\
1 lt.eq Delta_(upright(r)) lt.eq q_(frak(s)_S) Delta_(upright(d))) {M / Delta_(upright(r))\
 & wide + frac(M Delta_(upright(d)), N Delta_(upright(r))) max_(1 lt.eq H\
H lt.double_(S \, epsilon) \( 2 + M N \)^epsilon N^2 Delta_(upright(r)) \/ \( M Delta_(upright(d))^2 \))
  E_j \( H \, N \/ Delta_(upright(d)) \)} . $ <eq:sextic-sieve-norm-reflection>]
  The maxima may be restricted to nonempty ranges. This is the combination of the gcd and Poisson steps in [4]
    Lemmas 3.2–3.3; every sequence used here is common within its norm sum, and $S$ remains fixed.
  #emph[The initial and power bounds.] Row inclusion gives $D_j lt.eq E_j$.
    Hilbert space duality and sextic reciprocity, splitting one matrix variable by its finite $t$-class, give
  #[#set math.equation(numbering: n => "(1.85)")
   $ D_j \( M \, N \) lt.double_S D_j \( N \, M \) . $ <eq:sextic-sieve-norm-symmetry>]
  The phases are unit-valued and the noncoprime entries are zero in both orientations. We also have the initial estimate
  #[#set math.equation(numbering: n => "(1.86)")
   $ D_j \( M \, N \) lt.double_S M^2 + N wide \( M \, N gt.eq 1 \) . $ <eq:sextic-sieve-norm-initial>]
  Indeed, for the squarefree row $a$, finite Fourier inversion gives on every $b$, including nonunits,
  $ chi_a \( b \)^j = frac(1, sqrt(q_a) gamma_(- j) \( a \)) sum_(x med mod med a) overline(chi_a \( x \)^j)
    e \( x b \/ a \) . $
  Cauchy costs at most $\# \( cal(O) \/ \( a \) \)^times \/ q_a lt.eq 1$.
    The reduced fractions $x \/ a$ from $a in cal(A)_M$ are distinct modulo $cal(O)$ and separated by at least
    $1 \/ \( 2 M \)$: a nonzero numerator of $x \/ a - y \/ c - h$ has absolute value at least one,
    while $\| a c \| lt.eq 2 M$; equality modulo $cal(O)$ forces the same primary denominator and residue.
    The dual of Lemma 23, with the coefficient generators in the ball $q_b lt.eq 2 N$, proves Equation (1.86).
  We need the following near-monotonicity, also used in the large-sieve recursions of [13] Lemma 4.4 and Remark 5
    and [4] Lemma 3.1:
  #[#set math.equation(numbering: n => "(1.87)")
   $ D_j \( M_1 \, N \) lt.double_S D_j \( M_2 \, N \) quad upright("if ") M_2 gt.eq C M_1 log \( 2 M_1 N \) \,
     quad M_1 \, M_2 \, N gt.eq 1 . $ <eq:sextic-sieve-norm-monotone>]
  Here is a direct verification. The assertion is immediate for a zero norm.
    Otherwise choose a maximizing unit coefficient vector for $D_j \( M_1 \, N \)$,
    and split the row shell at $3 M_1 \/ 2$; one part carries at least half its mass. Put $L = M_2 \/ M_1$.
    For the first part use good prime ideals of norms in $\( L \, 4 L \/ 3 \]$,
    and for the second use norms in $\( 2 L \/ 3 \, L \]$. Then $a p in cal(A)_(M_2)$ when $p divides.not a$.
    The fixed-field prime ideal theorem supplies $P gt.double_S L \/ log L$ such primes.
    An ideal of norm at most $2 x$ contains at most $d_x = log \( 2 x \) \/ log \( 2 L \/ 3 \)$ of them.
    For $S_a \( v \) = sum_b v_b F_b \( a \)^j$ and $p divides.not a$, multiplicativity gives
  $ S_a \( lambda \) = S_(a p) #scale(x: 120%, y: 120%)[\(] \( lambda_b overline(F_b \( p \)^j) \)_b
    #scale(x: 120%, y: 120%)[\)] + S_a #scale(x: 120%, y: 120%)[\(] \( lambda_b 1_(p divides b) \)_b
    #scale(x: 120%, y: 120%)[\)] . $
  The first coefficient is zero at $p divides b$ and cancels the factor at $p$ otherwise.
    Squaring and summing over the chosen rows and primes gives
  $ frac(P - d_(M_1), 2) D_j \( M_1 \, N \) lt.eq 2 P D_j \( M_2 \, N \) + 2 d_N D_j \( M_1 \, N \) . $
  For the stated threshold with $C$ sufficiently large, $d_(M_1) + 4 d_N lt.eq P \/ 2$, proving Equation (1.87).
  We finish with the power decomposition and recursion of [4] Lemmas 3.4–3.5.
    Suppose, simultaneously for $j in J$, that for every positive loss
  #[#set math.equation(numbering: n => "(1.88)")
   $ D_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon { M^alpha + N + \( M N \)^(2 \/ 3) } \, wide
     alpha > 4 \/ 3 \, $ <eq:sextic-sieve-inductive-bound>]
  for $M \, N gt.eq 1$; the unit shells satisfy the same bound directly.
    The initial estimate gives this with $alpha = 2$. Write a good evaluation ideal uniquely as
  $ a = a_1 a_2^2 a_3^3 a_4^4 a_5^5 a_6^6 \, $
  where $a_1 \, dots.h \, a_5$ are pairwise coprime and squarefree, and $a_6$ is arbitrary.
    Insert $a_i in cal(I)_(X_i)$ and put $X = product_i X_i$; here $X_i gt.eq
    1 \/ 2$ and $product_i X_i^i asymp M$. Choose $ell in { 1 \, 2 }$ with $X_ell = max \( X_1 \, X_2 \)$.
    After the other factors are fixed, the coefficient
  $ lambda'_b = lambda_b product_(i eq.not ell) F_b \( a_i \)^(i j) $
  has absolute value at most $\| lambda_b \|$, and the remaining kernel is exactly that of
    $D_(j ell med mod med 6) \( X_ell \, N \)$. Enlarging its fixed positive row restriction gives this norm
    bound. This includes the zero of the sixth power factor. The set $J$ is closed under $j mapsto j ell med
    mod med 6$. Counting the fixed ideals and forgetting their coprimalities in positive sums gives
  #[#set math.equation(numbering: n => "(1.89)")
   $ E_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon max_(bold(X)) min
     {M^(1 \/ 3) \, \( M \/ X_ell \)^(2 \/ 3)} D_(j ell med mod med 6) \( X_ell \, N \) .
     $ <eq:sextic-sieve-norm-power>]
  To verify the factor, the number of fixed choices is $O \( X \/ X_ell \)$.
    For $ell = 1$ it is at most a constant times both $\( M \/ X_1 \)^(1 \/ 2)
    lt.double \( M \/ X_1 \)^(2 \/ 3)$ and $\( M X_2 \/ X_1 \)^(1 \/ 3) lt.eq M^(1 \/ 3)$; for $ell =
    2$ it is at most a constant times $\( M X_1^2 \/ X_2^2 \)^(1 \/ 3) lt.eq
    M^(1 \/ 3) lt.double \( M \/ X_2 \)^(2 \/ 3)$. The number of boxes is a fixed power of $log \( 2 + M \)$.
  Substituting Equation (1.88) into Equation (1.89) yields
  $ E_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon \( M^alpha + M^(1 \/ 3) N \) . $
  The three terms before simplification are bounded by $M^alpha$, $M^(1 \/ 3) N$, and $\( M N \)^(2 \/ 3)$;
    the last is bounded by one of the first two according as $N lt.eq M$ or $N gt.eq M$.
    Use this estimate in Equation (1.84). All auxiliary nonempty scales are bounded by fixed powers of $2 + M N$:
    here $N \/ Delta_(upright(d)) gt.eq 1 \/ 2$ and $H \( N \/ Delta_(upright(d)) \)
    lt.double_(S \, epsilon) \( 2 + M N \)^(3 + epsilon)$. The unit column shell satisfies the same estimate
    directly. Thus preliminary losses can be chosen smaller to give any specified final loss. The two scale factors are
  $ Delta_(upright(r))^(alpha - 1) Delta_(upright(d))^(1 - 2 alpha) lt.double_S Delta_(upright(d))^(- alpha) lt.eq
    1 \, wide \( Delta_(upright(r)) Delta_(upright(d)) \)^(- 2 \/ 3) lt.eq 1 . $
  Consequently, for $M \, N gt.eq 1$,
  #[#set math.equation(numbering: n => "(1.90)")
   $ D_j \( M \, N \) lt.eq E_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon { M +
     N^(2 alpha - 1) M^(1 - alpha) + \( M N \)^(2 \/ 3) } . $ <eq:sextic-sieve-norm-recurrence>]
  Put $h = 2 - 3 \/ \( 3 alpha - 1 \) = \( 2 alpha - 5 \/ 3 \) \/ \( alpha - 1 \/ 3 \)$ and $beta = 2 -
    2 \/ \( 3 alpha - 1 \)$. If $M gt.eq N^h$, the middle term in Equation (1.90) is at most $\( M N \)^(2 \/ 3)$.
    If $M < N^h$, apply Equation (1.87) with a fixed multiple of $N^h log \( 2 M N \)$ in place of $M$.
    Equation (1.90) there gives $\( M N \)^epsilon N^beta$, since $2 \( h + 1 \) \/ 3 = beta$ and $h < beta$.
    Thus in both cases
  $ D_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon { M + N^beta + \( M N \)^(2 \/ 3) } . $
  Symmetry gives Equation (1.88) with $beta$ in place of $alpha$, simultaneously for every $j in J$.
    Starting from $2$, the map $alpha mapsto 2 - 2 \/ \( 3 alpha - 1 \)$ decreases to $4 \/ 3$.
    For a requested loss take finitely many iterations until the remaining exponent gap is smaller than a fixed
    fraction of that loss, and absorb it into $\( M N \)^epsilon$.
    Combining the bound and its symmetric form, using $M^(4 \/ 3) lt.eq \( M N \)^(2 \/ 3)$ when $M lt.eq
    N$ and the analogous inequality when $N lt.eq M$, proves
  #[#set math.equation(numbering: n => "(1.91)")
   $ D_j \( M \, N \) lt.double_(S \, epsilon) \( M N \)^epsilon { M +
     N + \( M N \)^(2 \/ 3) } wide \( j in J \) . $ <eq:sextic-sieve-norm-shell>]
  Dyadic subdivision of both norm balls, with Cauchy across the column shells,
    converts Equation (1.91) to the same bound for the ball matrix with entries $F_b \( a \) = chi_a \( b \)$.
    The logarithmic factors are absorbed by a smaller preliminary loss, and the unit shells are bounded directly.
    The matrix in Equation (1.77) for $𝜍 = 1$ is the transpose of this matrix at lengths $\( D \, K \)$.
    A complex matrix and its transpose have the same operator norm,
    by the adjoint identity followed by whole-vector conjugation.
    The bound is symmetric in the two lengths, so it gives precisely $K + D + \( K D \)^(2 \/ 3)$.
    Conjugating the entire inner sum gives $𝜍 = - 1$, with unchanged zeros.
    Finally, a fixed row restriction removes nonnegative terms,
    and a fixed coefficient restriction is imposed by zero extension. This proves all assertions of the lemma. ◻
]

===== 1.7.2 Physical rows and their inverse witnesses <physical-rows-and-their-inverse-witnesses>

With the sieve proved, it remains to apply it to the detector witnesses.
  We apply the lemma only to a squarefree factor of the physical row.
  The separation of squarefree and powerful row factors is also used in the proof of Corollary 1.4 of [4];
  here we keep the actual norm of the powerful factor because it controls both the moment and the number of rows.

#thm([Proposition 1.28.])[
  (Sextic-sieve row envelope).  #emph[Fix the arithmetic data $cal(A)$, the bounded physical range $d_min lt.eq
    d lt.eq d_max$, and the height and loss hypotheses of Lemmas 27 and 28.
    Put $U = Z^d$ and retain the notation $T_1$ of those lemmas.
    Let $cal(B)$ be any set of retained sixth-power-free element rows $u$ with $q_u asymp U$,
    all in one bin $\( i \, a \)$ with $a > 51 \/ 100$. Put $delta = 2 a - 1$, so $1 \/ 50 < delta lt.eq 1$.]
  #emph[For every $epsilon.alt > 0$, after reducing the preliminary losses in Proposition 29,
    for all sufficiently large $Z$,
#[#set math.equation(numbering: n => "(1.92)")
 $ \# cal(B) lt.double_(cal(A) \, epsilon.alt) U^(R \( delta \) + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, wide
   R \( delta \) = min {1 \, max (1 - delta / 2 \, 4 / 3 - delta)} . $ <eq:sextic-row-count>]

 The finite order $A_(cal(A))$ is uniform in the physical dyad, the bin, and all moving rows.
   It may be fixed before the positive exponent in $T_1 = Z^tau$ is chosen.
   The estimate is valid for each fixed retained tuple of external parameters and for the original row
   restrictions. The implied constant may depend on the fixed comparison constants and finitely many of the shared
   profile seminorms. The rowwise profile choices are precisely those permitted by Proposition 29 and Lemma 9;
   no arbitrary row-dependent coefficients are allowed.]
  #emph[The floor bin $a = 51 \/ 100$ is excluded from the witness assertion.
    For that bin the elementary bound $\# cal(B) lt.double_(cal(A)) U$ applies;
    it agrees with the numerical value $R \( 1 \/ 50 \) = 1$.]
] <prop:sextic-row-count>

#proof[
  Fix a small preliminary loss $epsilon.alt_0 > 0$. Apply Proposition 29 with $t = 1$ to every row in $cal(B)$.
    Subdivide by its presentation labels in $psi_(u \, nu \, 𝜍) \( n \) =
    nu \( n \) chi_n \( u \)^𝜍$ and its dyadic pair of polynomial lengths.
    There are a fixed finite number of presentation labels and $O_(cal(A)) \( \( log U \)^2 \)$ pairs.
    Within one such subdivision, the inverse length $D = U^r$ and the pair $\( nu \, 𝜍 \)$ are fixed.
    In this subdivision write
  $ M_u \( D \; W \) = D^(- 1 \/ 2) sum_n mu \( n \) nu \( n \) chi_n \( u \)^𝜍 W \( q_n \/ D \) $
  for the inverse polynomial of that presentation. The witness gives
  #[#set math.equation(numbering: n => "(1.93)")
   $ 1 / 2 - O \( epsilon.alt_0 \) lt.eq r lt.eq 1 + O \( 1 \/ log U \) \,
     wide \| M_u \( D \; W_u \) \|^2 gt.double_(cal(A) \, epsilon.alt_0) U^(delta r - epsilon.alt_0) .
     $ <eq:sextic-witness-spike>]
  The notation $W_u$ retains the permitted rowwise norm-profile parameters.
    The polynomial here is the original one for the displayed presentation,
    not the polynomial of its primitive inducing character. We first bound it when those parameters are fixed,
    and then handle their rowwise choice.
  For each sixth-power-free row, factor its ideal uniquely as
  $ \( u \) = frak(s) frak(w) frak(k) \, quad frak(s) = product_(p in S) p^(v_p \( u \)) \, quad frak(w) =
    product_(p in.not S\
2 lt.eq v_p \( u \) lt.eq 5) p^(v_p \( u \)) \, quad frak(k) = product_(p in.not S\
v_p \( u \) = 1) p . $
  Thus $frak(k)$ is squarefree, $\( frak(k) \, frak(w) \) = 1$, and $frak(w)$ is powerful,
    meaning that each of its positive prime valuations is at least two.
    There are only finitely many possibilities for $frak(s)$, because its valuations lie in ${ 0 \, dots.h \,
    5 }$ on the fixed set $S$. Choose one generator $s_(frak(s))$ for each of these ideals.
    Writing $w \, k$ for the primary generators of $frak(w) \, frak(k)$, there is a unique unit $upsilon$ such that
  $ u = upsilon s_(frak(s)) w k . $
  We fix $frak(s)$ and $upsilon$ whenever a row sum is taken.
  Insert dyadic ranges $q_(frak(w)) asymp V$, including the unit ideal in the bounded range $V = 1$.
    Only $1 lt.eq V lt.double_(cal(A)) U$ can occur, and there are $O_(cal(A)) \( log U \)$ such ranges.
    The original annulus $q_u asymp U$ gives the actual residual annulus
  #[#set math.equation(numbering: n => "(1.94)")
   $ q_(frak(k)) = frac(q_u, q_(frak(s)) q_(frak(w))) asymp_(cal(A)) U / V . $ <eq:sextic-actual-row-annulus>]
  We keep this restriction when forming the sum. It will be enlarged to the ball $q_k lt.double_(cal(A)) U \/
    V$ only when applying a positive row bound. Let $cal(U)_V$ denote the rows of the current witness subdivision
    in this powerful-part dyad, with all original physical restrictions retained.
  The number of powerful ideals of norm at most $V$ is $O \( V^(1 \/ 2) \)$.
    Indeed, every powerful ideal has a unique expression $frak(v)^2 frak(y)^3$ with $frak(y)$ squarefree;
    the two factors need not be coprime. The ideal count from the arithmetic preliminaries gives
  $ \# { frak(w) : q_(frak(w)) lt.eq V \, med frak(w) med upright("powerful") } lt.double V^(1 \/ 2) sum_(frak(y))
    q_(frak(y))^(- 3 \/ 2) lt.double V^(1 \/ 2) . $
  The last series converges by the same ideal count. For each fixed $frak(w)$ in its dyad,
    the ball containing Equation (1.94) has $O_(cal(A)) \( U \/ V \)$ ideals.
    A nonempty annulus has $U \/ V$ bounded below by a fixed positive constant,
    which also covers the unit residual ideal. Since the factorization of $\( u \)$ and its unit are unique,
    the number of rows in this powerful-part dyad satisfies
  #[#set math.equation(numbering: n => "(1.95)")
   $ \# cal(U)_V lt.double_(cal(A)) U V^(- 1 \/ 2) . $ <eq:sextic-stratum-cardinality>]
  Discarding any of the restrictions defining $cal(U)_V$ in this upper count can only add rows.
  For fixed $frak(w) \, frak(s) \, upsilon$, put $v = upsilon s_(frak(s)) w$.
    Multiplicativity in the numerator gives the exact identity
  #[#set math.equation(numbering: n => "(1.96)")
   $ chi_n \( u \)^𝜍 = chi_n \( v \)^𝜍 chi_n \( k \)^𝜍 . $ <eq:sextic-frozen-mask>]
  It includes the zero extensions: if $n$ meets either factor, both sides are zero,
    and otherwise it is ordinary multiplicativity. In particular,
    the inverse polynomial for a fixed profile $W$ is the row sum in Lemma 30 with coefficients
  $ c_n = D^(- 1 \/ 2) mu \( n \) nu \( n \) chi_n \( v \)^𝜍 W \( q_n \/ D \) . $
  The factor $mu \( n \)$ keeps the columns squarefree. The factor $chi_n \( v \)^𝜍$ retains every original zero
    at $\( n \, v \) > 1$ and is fixed across the residual row $k$.
    The only remaining zero depending on both $n$ and $k$ is the zero of the displayed sieve kernel itself.
    The restriction $\( k \, w \) = 1$, and any restriction inherited from the physical row set for fixed external
    parameters, is a fixed row restriction in this application.
    We do not enlarge $S$ to contain the primes of $w$. Consequently the constant in the sieve is independent of
    $w$, even though its fixed coefficient mask may have large norm.
  The common annular support and ideal counting give, uniformly for the fixed profile parameters,
  $ sum_n \| c_n \|^2 lt.eq D^(- 1) sum_(q_n asymp D) \| W \( q_n \/ D \) \|^2 lt.double_(cal(A)) 1 . $
  The same statement holds for each of the finitely many profile derivatives used below,
    with the corresponding fixed seminorm. Apply Lemma 30 after enlarging the positive residual row sum from its
    actual annulus to $q_k lt.double_(cal(A)) U \/ V$. A fixed enlargement makes the row bound at least one on
    every nonempty quotient range and includes the annular column support.
    Summing the result over the $O \( V^(1 \/ 2) \)$ choices of $frak(w)$ and the finitely many choices of
    $frak(s) \, upsilon$ yields
  #[#set math.equation(numbering: n => "(1.97)")
   $ sum_(u in cal(U)_V) \| M_u \( D \; W \) \|^2 lt.double_(cal(A) \, epsilon.alt_1) \( U D \)^(epsilon.alt_1)
     V^(1 \/ 2) {U / V + D + (frac(U D, V))^(2 \/ 3)} . $ <eq:sextic-stratum-fixed-moment>]
  All coefficient sequences in this derivation are fixed within the row sum to which the sieve is applied.
    They may differ for different frozen values of $frak(w)$, which are summed only after those positive bounds.
  We now restore the rowwise choice of $W_u$ in Equation (1.93).
    Here the detector was used with $t = 1$, so $D_(*) = U$. After the presentation and dyadic pair are fixed,
    its inverse profiles have the form
  $ W_(upright("dyad")) \( x \) V_lt.eq \( D x \/ U \) x^(- sigma - i omega) \, wide omega = gamma - nu_F \, $
  where $W_(upright("dyad"))$ is the fixed smooth dyadic cutoff and $nu_F$ is the Fourier frequency from the
    detector. The factor $V_lt.eq \( D x \/ U \)$ is common to the row sum;
    the varying parameters are $sigma in \[ 51 \/ 100 \, 1 \]$ and $\| omega \| lt.eq \( 3 i + 1 \) T_1$.
    Differentiating in either parameter inserts a power of $log x$, which is bounded on the fixed annulus.
    Cover these two parameter ranges by unit boxes. There are at most a fixed power of $1 + T_1$ such boxes.
    The parameter Sobolev inequality in Lemma 9 bounds the supremum on a box by a finite sum of integrals of
    squared profile derivatives. Sum over the rows before these integrals.
    At each fixed parameter value, differentiation changes only the fixed profile coefficient,
    inserting the allowed logarithmic weights or profile derivatives.
    Equation (1.97) therefore applies to every such integral. This proves
  #[#set math.equation(numbering: n => "(1.98)")
   $ sum_(u in cal(U)_V) \| M_u \( D \; W_u \) \|^2
     lt.double_(cal(A) \, epsilon.alt_1) \( U D \)^(epsilon.alt_1) \( 1 + T_1 \)^(A_(cal(A))) V^(1 \/ 2) {U / V +
     D + (frac(U D, V))^(2 \/ 3)} . $ <eq:sextic-stratum-moment>]
  The derivative order and hence $A_(cal(A))$ are fixed before choosing $tau$.
    The height intervals and the total allowance for additional frequencies are exactly those in the shared
    detector estimates; the Sobolev step does not assign a new frequency allowance or change a contour.
    It does not permit a coefficient to be selected separately for each $k$.
  It remains to combine this moment with the independent count Equation (1.95). Write
  $ V = U^o \, wide D = U^r \, wide e_o \( r \) = o / 2 + max {1 - o \, r \, frac(2 \( 1 - o + r \), 3)} . $
  These are the parameters of the actual dyads. A nonempty dyad has $0 lt.eq o lt.eq 1 +
    O_(cal(A)) \( 1 \/ log U \)$; the unit dyad has $o = 0$. Since the witness lengths stay bounded,
    the arbitrarily small power of $U D$ in Equation (1.98) can be written as an arbitrarily small power of $U$.
    Dividing that equation by the spike in Equation (1.93), and also using Equation (1.95), gives for this subdivision
  #[#set math.equation(numbering: n => "(1.99)")
   $ \# cal(U)_V lt.double
     U^(min { 1 - o \/ 2 \, e_o \( r \) - delta r } + O \( epsilon.alt_0 \) + epsilon.alt_1) \( 1 +
     T_1 \)^(A_(cal(A))) \, $ <eq:sextic-stratum-envelope>]
  after decreasing the sieve loss denoted by $epsilon.alt_1$ if necessary.
  We compute the largest exponent in this expression first on $0 lt.eq o lt.eq 1$ and $1 \/ 2 lt.eq r lt.eq 1$.
    Put $x = 1 - o$ and $A = \( 1 + x \) \/ 2$. Then
  $ e_o \( r \) - delta r = max {A - delta r \, quad frac(1 - x, 2) + \( 1 - delta \) r \, quad 1 / 2 + x / 6 +
    (2 / 3 - delta) r} . $
  The minimum of $A$ with a maximum of three real numbers is the maximum of its minima with those numbers.
    The first such minimum is $A - delta r lt.eq 1 - delta \/ 2$.
    For fixed $r$, the second is the minimum of an increasing and a decreasing affine function of $x$.
    They cross at $x = \( 1 - delta \) r in \[ 0 \, 1 \]$, so its maximum over $x$ is
  $ frac(1 + \( 1 - delta \) r, 2) lt.eq 1 - delta / 2 . $
  Both functions in the third minimum increase with $x$. Its maximum over $x$ is therefore
  $ min {1 \, 2 / 3 + (2 / 3 - delta) r} . $
  The affine expression in $r$ takes the values $1 - delta \/ 2$ and $4 \/ 3 - delta$ at the two endpoints.
    It follows, and equality is attained at one of those endpoints, that
  #[#set math.equation(numbering: n => "(1.100)")
   $ max_(0 lt.eq o lt.eq 1\
1 \/ 2 lt.eq r lt.eq 1) min { 1 - o \/ 2 \, e_o \( r \) - delta r } = min {1 \,
  max (1 - delta / 2 \, 4 / 3 - delta)} . $ <eq:sextic-envelope-optimization>]
  This computation is uniform for $0 lt.eq delta lt.eq 1$.
  The functions just used are maxima and minima of affine functions whose slopes are uniformly bounded on a fixed
    neighborhood of these compact ranges. Replacing the actual $o$ by its nearest point in $\[ 0 \, 1 \]$,
    and the actual witness $r$ by its nearest point in $\[ 1 \/ 2 \, 1 \]$,
    changes the exponent by at most $O_(cal(A)) \( epsilon.alt_0 + 1 \/ log U \)$,
    by Equation (1.93) and the actual dyad bounds. Thus this replacement is made only in the final optimization,
    not in the row sum or its sieve application. Choose $epsilon.alt_0$ and the preliminary sieve loss small
    enough in terms of the prescribed $epsilon.alt$. The $O \( \( log U \)^2 \)$ witness pairs and $O \( log U \)$
    powerful-part dyads cost only another arbitrarily small power. Summing Equation (1.99) proves Equation (1.92).
  Finally, the bin $a = 51 \/ 100$ need not contain an actual zero, so no use of Proposition 29 is made there.
    Counting all elements in its physical annulus gives $O_(cal(A)) \( U \)$ rows.
    Since $1 \/ 50 < 1 \/ 3$, the displayed formula for $R$ gives $R \( 1 \/ 50 \) = 1$, as claimed. ◻
]

For use in the high estimate, the row envelope has the explicit form

$ R \( delta \) =
  cases(delim: "{", 1 \, & 0 lt.eq delta lt.eq 1 \/ 3 \,, 4 \/ 3 - delta \, & 1 \/ 3 lt.eq delta lt.eq 2 \/ 3 \,,
  1 - delta \/ 2 \, & 2 \/ 3 lt.eq delta lt.eq 1 .) $

The argument uses only the inverse witness. No estimate for a product with the plain witness is needed in this row
  count.

==== 1.8 Analytic estimates for the high expansion <sec:shared-analytic-estimates>

The row envelope now enters the Poisson representation of the base probe.
  For the first-stage application, retain the supposition $Delta_1 = beta_(*) - 11 \/ 12 > 0$ and set $X = Y =
  Z^(1 \/ 2)$. Write $s$ for the first Mellin variable called $x$ in Section 5.2.
  Equations (1.61) and (1.69) give the actual integral to be estimated:

$ I_eta \( Z^(1 \/ 2) \, Z^(1 \/ 2) \, Z \) = frac(1, \( 2 pi i \)^3) integral_(\( 3 \)) integral_(\( 3 \))
  integral_(\( 2 \)) & cal(W) \( Z^(1 \/ 2) \, Z^(1 \/ 2) \, Z \; s \, w \, z \)\
 & dot.op sum_u^(\( 6 \)) q_u^(- z) overline(xi \( u \))
   frac(zeta_F^S \( 6 z \) L^S \( w \, chi_bullet \( u \) \), L^S \( s \, eta overline(chi_bullet \( u \)) \))
   cal(H)_(eta \, u) \( s \, w \, z \) thin d z thin d w thin d s . $

Here

$ cal(W) \( X \, Y \, Z \; s \, w \, z \) = X^(1 \/ 2 - z) Z^(s + z - 1) Y^(w - 1) e^(\( s + z - 1 \)^2) M \( z \)
  hat(W)_1 \( w \) . $

The rows are the nonzero sixth-power-free elements, with their unit factors and the physical restriction
  $\( u \, S \) = 1$. Both character presentations retain their original zeros at primes dividing $u$.
  The coefficientwise calibration of the base probe is already included in this identity.

The row $u = 1$ contains the reciprocal of the target function.
  For the intermediate row norms we will keep one buffered bin fixed, move its integral to

$ Re s = a + 16 e \, wide Re w = 1 - a - 6 e \, wide Re z = 17 \/ 50 \, $

and apply the envelope $R \( 2 a - 1 \)$ there. Apart from small real losses and a fixed height factor,
  the numerator on this contour costs $U^(a - 1 \/ 2)$ for a row norm $q_u asymp U$;
  the row envelope controls how many such terms occur. We first identify the principal signal,
  then carry out this contour move and its concrete first-stage estimate.
  Principal residues and direct bounds for the outer row norms complete the comparison.

===== 1.8.1 The principal row and the normalization <the-principal-row-and-the-normalization>

We identify the row whose numerator is principal. A physical row with a prime factor outside $S$ has nonprincipal
  numerator by the ramification argument in Section 6. Because the physical mask imposes $\( u \, S \) = 1$,
  the remaining rows are units. If a unit $u eq.not 1$ had a sixth root in $F$,
  that root would have valuation zero at every prime, hence would be a unit of $F$;
  every unit of $F$ has sixth power one. Thus $F \( u^(1 \/ 6) \) \/ F$ is nontrivial.
  It is finite Galois because $F$ contains the sixth roots of unity.
  Chebotarev applied to a nonidentity Frobenius class supplies a prime outside the fixed set $S$ where the
  associated sextic character is nontrivial [27] Theorem 1.1.
  By the Kummer description in Lemma 5, this is $chi_bullet \( u \)$.
  Therefore $u = 1$ is the sole principal numerator row. A denominator attached to a bounded unit row may be
  principal; its reciprocal has a zero at one and will be kept on a global line below.

Define

#[#set math.equation(numbering: n => "(1.101)")
 $ H_eta \( s \) = cal(H)_(eta \, 1) \( s \, 1 \, 1 \/ 6 \) \, wide c_S =
   hat(W)_1 \( 1 \) M \( 1 \/ 6 \) ("Res"_(v = 1) zeta_F^S \( v \))^2 \/ 6 . $ <eq:shared-principal-data>]

Lemma 26 makes $H_eta$ holomorphic on $Re s > 7 \/ 8$. Its uniform estimate $H_eta = 1 +
  O \( P_0^(- 4 \/ 5) \)$ permits a choice of $P_0$ before the target,
  because the local bound is uniform in the target unit phases. Fix $P_0$ large enough that

#[#set math.equation(numbering: n => "(1.102)")
 $ sup_(Re s > 7 \/ 8) \| H_eta \( s \) - 1 \| lt.eq 1 / 2 . $ <eq:shared-principal-nonvanishing>]

Enlarging $S$ by these primes leaves the fixed ray group $T$ unchanged,
  as the calibration in the local identity holds coefficientwise.
  The excluded set and hence the particular function $H_eta$ may differ between applications,
  but within one application they are exactly those of the exact high representation being used.

The constant $c_S$ is positive. Indeed $hat(W)_1 \( 1 \) > 0$ because $W_1$ is nonnegative and nonzero,
  and $M \( 1 \/ 6 \) > 0$ by Equation (1.58). The simple pole of $zeta_F^S$ has positive residue:
  deletion multiplies the positive residue of $zeta_F$ by $product_(p in S) \( 1 - q_p^(- 1) \) > 0$.

For the first stage put

$ C_(upright(I)) \( s \) = s - 2 / 3 \, wide J_(upright(I) \, eta) \( Z \) =
  frac(I_eta \( Z^(1 \/ 2) \, Z^(1 \/ 2) \, Z \), c_S) . $

Let $f_(upright(I) \, eta)$ be the integral in Equation (3) with $C = C_(upright(I))$, $cal(S) = S$,
  and the function $H_eta$ just defined. The two scalar poles at $w = 1$ and $z =
  1 \/ 6$ will give $c_S f_(upright(I) \, eta)$; our remaining objective is a common power saving for every other
  term, measured relative to $Z^(C_(upright(I)) \( beta_(*) \))$.

===== 1.8.2 The exact identity used in contour moves <the-exact-identity-used-in-contour-moves>

The contour proof uses the full holomorphic correction in the displayed integral.
  To reuse that proof with the compensated probe, we record the identity and bounds that it requires.
  In the present application the correction is $cal(H)_(eta \, u)$, independent of $Z$,
  and the parameters below are $l_x = l_y = h = 1 \/ 2$ and $ell = 0$.

The scalar quotient in Equation (1.69) is the part of the high expansion that determines both the contour move and
  the principal residues. We keep that quotient fixed and state explicitly what may be changed around it. Put

$ cal(D)_1 \( epsilon.alt_0 \) = { \( s \, w \, z \) :  & Re s gt.eq 51 \/ 100 \, quad Re z gt.eq 17 \/ 50 \, quad
  Re w gt.eq - 1 \/ 100 \,\
 & Re \( s + w \) gt.eq 1 + epsilon.alt_0 } \, wide epsilon.alt_0 > 0 \,\
cal(D)_2 = { \( s \, w \, z \) :  & Re s gt.eq 7 \/ 8 \, quad Re z gt.eq 33 \/ 200 \, quad Re w gt.eq 19 \/ 20 } . $

These are the two regions in Lemma 26. A real box below means a compact rectangular subset of $bb(R)^3$ for
  $\( Re s \, Re w \, Re z \)$.

#prodef([Definition 1.29.])[
  (Data for an exact high representation).  Fix real numbers $l_x \, l_y > 0$ and $ell gt.eq 0$ such that
  #[#set math.equation(numbering: n => "(1.103)")
   $ X = Z^(l_x) \, wide Y = Z^(l_y) \, wide h = 1 - l_x + ell > 0 \, wide C \( s \) = s + l_x / 2 - 1 + h / 6 =
     s - 5 / 6 + l_x / 3 + ell / 6 . $ <eq:stage-mellin-exponent>]
  These real numbers are fixed before the target character.
    For each primitive finite-order target $eta$, fix the data $S \, xi \, W_0 \, W_1$ of Section 4,
    independently of $Z$. Data for an exact high representation consist of the following objects and assertions.
  First, $cal(I)_eta \( Z \)$ is an independently specified complex-valued quantity for every sufficiently large
    real $Z$. In each application it is given by a finite linear combination, for that $Z$,
    of the completed sums in Equation (1.55), allowing specified restrictions on the completed index $A$ and
    specified rescalings of its three positive scales. The number of terms and coefficients in this finite
    combination may depend on $Z$. Any direct estimate for $cal(I)_eta$ refers to this expression,
    not to a separately defined high integral.
  Second, for every nonzero sixth-power-free element $u$ with $\( u \, S \) = 1$ and every such $Z$,
    there is a function $frak(H)_(eta \, u \, Z) \( s \, w \, z \)$.
    It is holomorphic on a neighborhood of each point of $cal(D)_2$ and of every $cal(D)_1 \( epsilon.alt_0 \)$.
    For every $D > 0$ and every real box $cal(K)$ contained in one of these regions,
    there are finite constants $B_(eta \, cal(K) \, D)$ and $J_(eta \, cal(K) \, D)$ such that,
    uniformly for $1 lt.eq q_u lt.eq Z^D$, all imaginary parts, and real parts in $cal(K)$,
  #[#set math.equation(numbering: n => "(1.104)")
   $ \| frak(H)_(eta \, u \, Z) \( s \, w \, z \) \| lt.double_(eta \, cal(K) \, D)
     Z^(B_(eta \, cal(K) \, D)) \( 1 + \| Im s \| + \| Im w \| + \| Im z \| \)^(J_(eta \, cal(K) \, D)) .
     $ <eq:stage-all-height-majorant>]
  The constants and exponents are independent of $Z \, u$ and of any later order of integration by parts.
    No nonvanishing of $frak(H)$ or of any of its local factors is assumed.
  Finally, the following identity is asserted for the independently given $cal(I)_eta \( Z \)$,
    with absolute convergence of the sum and integrals on the displayed lines:
  #[#set math.equation(numbering: n => "(1.105)")
   $ cal(I)_eta \( Z \) = frac(1, \( 2 pi i \)^3) integral_(\( 3 \)) integral_(\( 3 \)) integral_(\( 2 \)) &
     cal(W) \( X \, Y \, Z \; s \, w \, z \) sum_u^(\( 6 \)) q_u^(- z) overline(xi \( u \))\
 & dot.op
   frac(zeta_F^S \( 6 z \) L^S \( w \, chi_bullet \( u \) \), L^S \( s \, eta overline(chi_bullet \( u \)) \))
   frak(H)_(eta \, u \, Z) \( s \, w \, z \) thin d z thin d w thin d s \, $ <eq:stage-high-identity>]
  where the sum has the physical restrictions of Equation (1.61), and
  $ cal(W) \( X \, Y \, Z \; s \, w \, z \) = X^(1 \/ 2 - z) Z^(s + z - 1) Y^(w - 1) e^(\( s + z - 1 \)^2)
    M \( z \) hat(W)_1 \( w \) . $
  Thus Equation (1.105) is a hypothesis to be proved for the physical expression, not its definition.
] <def:stage-high-data>

For the base probe, the physical expression is $I_eta \( Z^(l_x) \, Z^(l_y) \, Z \)$, $ell = 0$,
  and $frak(H)_(eta \, u \, Z) = cal(H)_(eta \, u)$. Equations (1.61) and (1.69) prove the required identity,
  and Lemma 26 gives the holomorphy and Equation (1.104). More generally,
  the function $frak(H)$ in the definition always means the #emph[full correction after the displayed scalar
  quotient is removed]. If that correction is a sum of products of local factors,
  the products themselves must be holomorphic in the stated regions.
  Writing a quotient by an individual local factor at its zeros does not establish this condition.
  The decompositions used only to estimate a retained contour will be stated separately below.

===== 1.8.3 External tails on vertical lines and horizontal joins <external-tails-on-vertical-lines-and-horizontal-joins>

The product of our three Mellin tests decays in three independent height directions.
  The following estimate turns that decay into bounds both off a large box and on the horizontal sides of a
  contour rectangle.

#thm([Lemma 1.30.])[
  (External integrated and trace tails).  #emph[Let $m gt.eq 2$,
    let $cal(K)$ be a compact set of real contour parameters, and, for $bold(r) in cal(K)$ and $Z gt.eq 2$,
    let $K_(bold(r) \, Z)$ be a nonnegative Borel measurable kernel on $bb(R)^m$.
    Suppose it is jointly Borel measurable in $\( bold(r) \, bold(t) \)$ and, for every integer $L gt.eq 0$,
$ K_(bold(r) \, Z) \( bold(t) \) lt.double_L \( 1 + \| bold(t) \| \)^(- L) $

 uniformly in $bold(r) \, Z \, bold(t)$. Let $cal(D) subset.eq bb(R)^m$ be Borel measurable,
   and suppose a Borel measurable factor $F_Z$ satisfies on $cal(D)$
#[#set math.equation(numbering: n => "(1.106)")
 $ \| F_Z \( bold(t) \) \| lt.eq C Z^B \( 1 + \| bold(t) \| \)^J \, $ <eq:external-arithmetic-majorant>]

 where $B \, J \, C$ are fixed independently of $Z$ and of the integer $N$ below.
   Write $hat(bold(t))_j$ for the vector obtained by omitting the $j$th coordinate of $bold(t)$.
   Uniformly for $T gt.eq 1$ and $bold(r) in cal(K)$,
#[#set math.equation(numbering: n => "(1.107)")
 $ integral_(cal(D) ∩ { max_j \| t_j \| > T }) K_(bold(r) \, Z) \( bold(t) \) \| F_Z \( bold(t) \) \| thin d
   bold(t) & lt.double_N Z^B T^(- N) \,\
integral_(cal(D) ∩ { t_j = T }) K_(bold(r) \, Z) \( bold(t) \) \| F_Z \( bold(t) \) \| thin d hat(bold(t))_j &
  lt.double_N Z^B \( 1 + \| T \| \)^(- N) . $ <eq:external-integrated-tail>]

 The second assertion holds for either sign of $T$ and every $j$, using coordinate Lebesgue measure on $t_j = T$.
   Both assertions remain valid after integration over a real contour interval of bounded length when the
   hypotheses are uniform there and the kernels, domain indicators and arithmetic factors are jointly Borel
   measurable in that real parameter and the remaining coordinates.]
] <lem:external-contour-tails>

#proof[
  Multiply the kernel bound by Equation (1.106). Integrating $\( 1 + \| bold(t) \| \)^(J - L)$ outside the box
    proves Equation (1.107) when $L > N + J + m$. On $t_j = T$, integration in the other $m - 1$ coordinates gives
  $ integral_(bb(R)^(m - 1)) \( 1 + \| T \| + \| hat(bold(t))_j \| \)^(J - L) d hat(bold(t))_j
    lt.double \( 1 + \| T \| \)^(J - L + m - 1) . $
  Taking $L > N + J + m - 1$ proves Equation (1.107). Restricting to $cal(D)$ decreases these positive integrals,
    and a bounded real interval contributes only its length. ◻
]

For our triple integral, take

$ \( y_1 \, y_2 \, y_3 \) = \( Im \( s + z \) \, Im z \, Im w \) \, wide K_(bold(r) \, Z) \( bold(t) \) =
  e^(- y_1^2) \| M \( r_z + i y_2 \) \| thin \| hat(W)_1 \( r_w + i y_3 \) \| . $

The change of height variables has determinant one. On a fixed real box with $r_z$ in a compact subinterval of
  $\( 0 \, oo \)$, the Mellin estimates of Section 5 give arbitrary polynomial decay of $M$ and $hat(W)_1$.
  The Gaussian has the same property. Their product is therefore $O_L \( \( 1 + \| bold(y) \| \)^(- L) \)$ for
  every $L$, hence also $O_L \( \( 1 + \| bold(t) \| \)^(- L) \)$.
  The omitted factor $e^(\( Re \( s + z \) - 1 \)^2)$ is bounded on that real box.

After the $w$ residue only $s \, z$ remain. The same proof applies to the kernel

#[#set math.equation(numbering: n => "(1.108)")
 $ K_(bold(r) \, Z)^(\( 2 \)) \( bold(t) \) = e^(- y_1^2) \| M \( r_z + i y_2 \) \| \,
   wide \( y_1 \, y_2 \) = \( Im \( s + z \) \, Im z \) . $ <eq:external-two-dimensional-kernel>]

This supplies the trace bound needed for the subsequent $z$-join.

The same kernel test handles additional external separating variables.
  For $m gt.eq 3$, let $bold(y) = A bold(t)$ with a fixed $A in upright("GL")_m \( bb(R) \)$,
  and multiply the three-factor kernel by a Borel density $\| v_(bold(r) \, Z) \( y_4 \, dots.h \, y_m \) \|$,
  jointly Borel in $\( bold(r) \, bold(v) \)$, satisfying

#[#set math.equation(numbering: n => "(1.109)")
 $ sup_(bold(r) \, Z \, bold(v)) \( 1 + \| bold(v) \| \)^L \| v_(bold(r) \, Z) \( bold(v) \) \| < oo quad
   upright("for every integer ") L gt.eq 0 . $ <eq:external-density-contract>]

For $m = 3$ the density is one on the zero-dimensional space.
  The product is again rapidly decreasing in all $m$ coordinates, since $A$ and its inverse are fixed.
  For the two-factor kernel, the identical argument uses a density on $bb(R)^(m - 2)$ and $m gt.eq 2$,
  with density one when $m = 2$. Thus both product-kernel forms have the integrated and trace bounds above.

Uniform annular profiles separated by logarithmic Fourier inversion satisfy Equation (1.109) by repeated
  integration by parts, as in Lemma 9. Translate every pure norm twist into its Mellin argument first.
  The additional height coordinates then append a block triangular matrix with fixed inverse to the
  three-dimensional change of variables.

An internal coefficient measure known only through a fixed weighted $L^1$ norm is not thereby covered by the
  pointwise density hypothesis or by its trace conclusion. Such a measure remains integrated at its already fixed
  moment order inside the factor $F_Z$. Any additional external coordinate on which a trace estimate is used must
  separately satisfy Equation (1.109).

The domain $cal(D)$ in the lemma is important. Suppose a reciprocal is bounded only while the imaginary part of
  its argument $gamma + sum_j a_j t_j$ lies in a buffered interval.
  A coordinate with $a_j eq.not 0$ may be integrated only over the range that preserves this condition;
  the lemma does not extend the reciprocal bound beyond it.
  Coordinates with $a_j = 0$ may be extended when the other factors satisfy Equation (1.106) there.
  All factors on an extended axis must use their global or absolute estimates,
  not an estimate valid only on a retained interval. In particular,
  an integrated tail alone does not justify a horizontal join: that join uses Equation (1.107).

Increasing $N$ in this lemma increases only the decay orders of the external smooth tests.
  It does not differentiate $F_Z$. Thus a fixed moment-profile order or a fixed arithmetic height exponent in
  $F_Z$ is unchanged when $N$ is chosen later. This is the same order distinction made in Lemma 9.

===== 1.8.4 Moving a fixed bin <moving-a-fixed-bin>

We first move the full row integral. The row envelope will be applied only after this step, on the retained contour.

#thm([Lemma 1.31.])[
  (Contour transformation for a fixed bin).  #emph[Assume Definition 32.
    Fix $sigma_0 in \[ 7 \/ 8 \, 1 \)$ with $beta_(*) > sigma_0$, put $z_0 = 17 \/ 50$, and let $U =
    Z^d$ with $0 < d_min lt.eq d lt.eq d_max < oo$. Let $cal(B)$ be a finite set of retained physical rows $q_u
    asymp U$ in one bin $\( i \, a \)$ of Lemma 27, fixed before any Mellin variable is moved.
    The comparison constants in this annulus are fixed. Take $0 < e < 10^(- 3)$ and $T_1 = Z^tau > 2$,
    where $0 < tau lt.eq d_min \/ 100$. The real ranges and $e$ are independent of the target.]
  #emph[Fix positive constants $c_s \, c_w \, c_z lt.eq 1 \/ 2$, independently of $Z$ and the rows.
    Retain the original heights $\| Im s \| lt.eq c_s T_1$, $\| Im w \| lt.eq c_w T_1$ and $\| Im z \| lt.eq
    c_z T_1$. The contribution of $cal(B)$ on the starting lines in Equation (1.105) equals its integral on these
    retained segments of
#[#set math.equation(numbering: n => "(1.110)")
 $ Re s = a + 16 e \, wide Re w = 1 - a - 6 e \, wide Re z = z_0 \, $ <eq:stage-central-contours>]

 up to $O_(eta \, N) \( Z^(B_eta) T_1^(- N) \)$ for every fixed $N$.
   The finite exponent $B_eta$ is fixed before $N$. An empty row set contributes zero.
   The transformation uses the full holomorphic correction; no decomposition of that correction or subdivision
   depending on a contour point is needed.]
] <lem:fixed-bin-contour>

#proof[
  Section 6 gives $a lt.eq beta_(*)$, including the floor bin.
    Isolate the finite sum over $cal(B)$ on the absolute lines in Equation (1.105).
    Move $z$ from $2$ to $z_0$, keep $w = 3$, and move $s$ from $3$ to $beta_(*) + 20 e$.
    These moves stay in $cal(D)_1 \( epsilon.alt_0 \)$ for a fixed positive $epsilon.alt_0$,
    the two numerator arguments remain to the right of their poles, and the reciprocal stays in $Re s > beta_(*)$.
    Its global bound follows from Lemmas 13 and 14, using the conductor and deletion radical bounds in Section 6.
    The correction obeys Equation (1.104). Lemma 33 with $T arrow.r oo$ therefore justifies these moves.
  Now move $w$ from $3$ to $1 - a - 6 e$ while $s$ stays on that global line. Throughout the move,
  $ Re \( s + w \) gt.eq 1 + \( beta_(*) - a \) + 14 e gt.eq 1 + 14 e . $
  The numerator character of every retained row is nonprincipal, so its $L$-function is entire.
    Also $Re w gt.eq - 6 e > - 1 \/ 100$ and $Re z = z_0$. Thus the correction remains holomorphic in
    $cal(D)_1 \( epsilon.alt_0 \)$, for example with $epsilon.alt_0 = 10 e$, and no pole is crossed.
    On a $w$-join the reciprocal is still global. The global upper strip bound for the numerator,
    the deleted-factor bound and Equation (1.104) give a majorant of the form Equation (1.106) on the axes
    integrated there. The trace estimate makes the joins tend to zero.
  Before moving $s$ farther, restrict the three original Mellin heights to the stated box.
    On the discarded part keep $s$ on $Re s = beta_(*) + 20 e$.
    There the global reciprocal bound, the global numerator bound,
    the deleted factors and the all-height correction bound give $Z^(B_eta)$ times a fixed polynomial in the
    heights: the row range is bounded by $q_u lt.double Z^(d_max)$, and the number of rows is $O \( U \)$.
    The integrated tail in Lemma 33 gives $O_(eta \, N) \( Z^(B_eta) T_1^(- N) \)$.
  Move only the retained $s$ segment to $a + 16 e$. On this rectangle,
  $ Re \( s + w \) gt.eq 1 + 10 e \, $
  and the other inequalities defining $cal(D)_1 \( 10 e \)$ still hold.
    The real part of the reciprocal argument is at least $a + 16 e > a + 6 e$.
    The stated height box places both scalar arguments strictly inside $\| Im v \| lt.eq \( 3 i + 2 \)
    T_1$ for sufficiently large $Z$. Lemma 27 therefore excludes its zeros throughout the retained rectangle.
    Since $6 z_0 > 1$, the scalar zeta factor has no pole on this move. Thus no pole is crossed.
  For an $s$-join, its imaginary coordinate is fixed at a constant multiple of $T_1$.
    The scalar denominator in Equation (1.105) depends only on $s$,
    so its buffered estimate remains valid when the $Im z$ and $Im
    w$ integrations are extended to their whole axes. On those extended axes use the global numerator estimate and
    Equation (1.104). The trace estimate then gives $O_(eta \, N) \( Z^(B_eta) T_1^(- N) \)$.
    No $w$- or $z$-join in this argument extends an $s$-axis that has been moved into a merely buffered region. ◻
]

The exact high representation is a triple integral with a majorant for its full correction.
  We can therefore perform this transformation before introducing any auxiliary separating variable.
  If a central estimate later uses such variables, their retained domains and discarded parts must be justified in
  that estimate; they are not new coordinates of the contour identity just proved.

===== 1.8.5 Applying the row envelope <applying-the-row-envelope>

For the base correction, Lemma 26 verifies the hypotheses of Lemma 34.
  Indeed $\| cal(H)_(eta \, u) \| lt.double_epsilon.alt q_u^epsilon.alt$ uniformly in all three heights in both
  Euler regions; for $q_u lt.eq Z^D$, taking $epsilon.alt = 1$ gives Equation (1.104) with $B =
  D$ and height order zero. We now estimate the retained integral, using $l_x = l_y = h = 1 \/ 2$ and $ell =
  0$ throughout this subsection.

Fix

$ d_min = 1 / 63 \, wide zeta = 1 / 1000 \, wide d_max = h + zeta = 501 / 1000 . $

For a dyad $U = Z^d$ in this range, fix one dynamic bin $\( i \, a \)$ before moving any Mellin variable,
  and put $delta = 2 a - 1$. Proposition 31, with requested loss $epsilon.alt_r > 0$,
  gives its cardinality at most $U^(R \( delta \) + epsilon.alt_r) \( 1 + T_1 \)^(A_eta)$ up to a fixed constant.
  For the floor this is the direct count $O_eta \( U \)$, since $R \( 1 \/ 50 \) = 1$; it uses no witness.

The numerator $L^S \( w \, chi_bullet \( u \) \)$ is precisely the original zero-extended presentation with $nu =
  1$ in Section 6. On the retained line $Re w = 1 - a - 6 e$,
  Lemma 27 bounds it by $U^(delta \/ 2 + 12 e + epsilon.alt_n) \( 3 + T_1 \)^C$ for any $epsilon.alt_n > 0$.
  This also holds in the floor bin. The central point lies in $cal(D)_1 \( 10 e \)$,
  so the stronger local estimate in Lemma 26 gives $\| cal(H)_(eta \, u) \| lt.double_(e \, epsilon.alt_H)
  U^(epsilon.alt_H)$ there, for any $epsilon.alt_H > 0$. Consequently

$ sum_(u in cal(B)) \| L^S \( w \, chi_bullet \( u \) \) cal(H)_(eta \, u) \( s \, w \, z \) \| lt.double_eta
  U^(R \( delta \) + delta \/ 2 + 12 e + epsilon.alt_r + epsilon.alt_n + epsilon.alt_H) \( 1 + T_1 \)^(A'_eta) . $

Here $A'_eta$ is finite and is fixed before the final external tail order.

Put $epsilon_c = 12 e + epsilon.alt_r + epsilon.alt_n + epsilon.alt_H$.
  The buffered reciprocal costs $U^(epsilon_d)$ for any $epsilon_d > 0$,
  and $zeta_F^S \( 6 z_0 \)$ is absolutely bounded. The tests have bounded joint $L^1$ norm in the three
  independent height coordinates above. The outside powers, including $q_u^(- z_0)$, are

$ Z^(a \/ 2 - 3 \/ 4 + z_0 \/ 2 + 13 e) U^(- z_0) . $

Multiplying these bounds gives, for every $epsilon_p > 0$, a retained bin contribution at most

#[#set math.equation(numbering: n => "(1.111)")
 $ lt.double_eta
   Z^(1 \/ 4 + E_(upright(I)) \( d \) + 13 e + \( 1 + d \) epsilon_c + d epsilon_d + epsilon_p) \( 1 +
   T_1 \)^(A'_eta) . $ <eq:balanced-central-contribution>]

Here we have harmlessly enlarged the bound by $Z^(epsilon_c + epsilon_p)$ so that the losses use the same form as
  the later general estimate, and

$ E_(upright(I)) \( d \) = - 3 / 4 + frac(delta + R \( delta \), 2) +
  (d - 1 / 2) (R \( delta \) + delta / 2 - 17 / 50) . $

There is no additional Mellin integral in this application.
  Its scalar buffered arguments have heights $Im s$ and $Im w$.
  The witness frequencies and profile choices in the row count stay within the detector’s existing allowance and
  do not enter either scalar argument.

At $d = h = 1 \/ 2$, the three pieces of the row envelope give, respectively,

$ E_(upright(I)) \( h \) =
  cases(delim: "{", - 1 \/ 4 + delta \/ 2 \, & 0 lt.eq delta lt.eq 1 \/ 3 \,, - 1 \/ 12 \, & 1 \/ 3 lt.eq delta
  lt.eq 2 \/ 3 \,, - \( 1 - delta \) \/ 4 \, & 2 \/ 3 lt.eq delta lt.eq 1 .) $

The first two pieces are at most $- 1 \/ 12$. In the third, the exact bin ceiling from Section 6 is

$ delta lt.eq 2 beta_(*) - 1 = 5 / 6 + 2 Delta_1 . $

It follows in every piece that

$ E_(upright(I)) \( h \) - Delta_1 lt.eq - 1 / 24 - Delta_1 / 2 . $

This is the comparison with $C_(upright(I)) \( beta_(*) \)$ required here;
  $E_(upright(I)) \( h \)$ itself need not be negative. The frequency slope has the three forms

$ R \( delta \) + delta / 2 - 17 / 50 =
  cases(delim: "{", 33 \/ 50 + delta \/ 2 \, & 0 lt.eq delta lt.eq 1 \/ 3 \,, 149 \/ 150 - delta \/ 2 \, & 1 \/ 3
  lt.eq delta lt.eq 2 \/ 3 \,, 33 \/ 50 \, & 2 \/ 3 lt.eq delta lt.eq 1 .) $

It therefore lies in $\[ 33 \/ 50 \, 62 \/ 75 \]$. Positivity controls all $d lt.eq h$,
  and the extension to $d lt.eq h + zeta$ costs at most $\( 62 \/ 75 \) zeta$.
  Thus, before adjustable losses, every central dyad has saving at least

$ m_c = 1 / 24 - 62 / 75 zeta = 1021 / 25000 $

relative to $C_(upright(I)) \( beta_(*) \)$.

===== 1.8.6 Central estimates for a correction split into pieces <central-estimates-for-a-correction-split-into-pieces>

The preceding calculation multiplied one aggregate absolute row bound by the outside Mellin powers.
  We record its form when the full correction is estimated by several pieces and the available bound varies
  between sets of rows. The contour has already been justified for the fixed bin;
  these sets will be used only to estimate its retained integrand.

#thm([Lemma 1.32.])[
  (A retained integral and its exponent).  #emph[Assume the data of Definition 32.
    Fix $sigma_0 in \[ 7 \/ 8 \, 1 \)$ with $beta_(*) > sigma_0$, and put $z_0 = 17 \/ 50$.
    Let $0 < d_min < d_max < oo$, $U = Z^d$ with $d_min lt.eq d lt.eq d_max$,
    and let $cal(B)$ be a finite set of physical rows $u$ with $q_u asymp
    U$ in one retained bin $\( i \, a \)$ of Lemma 27. The comparison constants in $q_u asymp U$ are fixed.
    Put $delta = 2 a - 1$, take $0 < e < 10^(- 3)$ as in that lemma, and let $T_1 = Z^tau > 2$ with $0 < tau lt.eq
    d_min \/ 100$. The real ranges and $e$ are chosen independently of the target.]
  #emph[The bin $cal(B)$ is fixed before any Mellin variable is moved.
    On the retained central contours of Equation (1.110), suppose that there is a decomposition
$ frak(H)_(eta \, u \, Z) \( s \, w \, z \) = sum_(lambda in Lambda)
  frak(H)_(eta \, u \, Z)^(\( lambda \)) \( s \, w \, z \) \, $

 where $Lambda$ is finite, nonempty and fixed before $Z$. This equality is required only on the retained contours;
   the summands need not be holomorphic away from them. For each $lambda$ and each retained $\( s \, w \, z \)$,
   suppose $cal(B)$ is partitioned into at most $C \( 1 + log Z \)^D$ sets
   $cal(B)_(lambda \, nu) \( s \, w \, z \)$, with fixed $C \, D$.
   For each set at each retained point let $R \, g$ be real numbers in a fixed bounded range.
   Assume that, for fixed $epsilon_c gt.eq 0$ and a finite $A_eta gt.eq 0$,
#[#set math.equation(numbering: n => "(1.112)")
 $ sum_(u in cal(B)_(lambda \, nu) \( s \, w \, z \))
   lr(|L^S \( w \, chi_bullet \( u \) \) frak(H)_(eta \, u \, Z)^(\( lambda \)) \( s \, w \, z \)|) lt.double_eta
   U^(R + delta \/ 2 + epsilon_c) Z^(ell \( z_0 - 1 \/ 2 \) + g + epsilon_c) \( 1 + T_1 \)^(A_eta) .
   $ <eq:stage-central-bound>]

 The bound is uniform in the retained point, row set and moving labels.
   The number $epsilon_c$ and the bounded range for $R \, g$ are fixed before the target; $R \,
   g$ may depend on $d \, a$, the pointwise set and the global number $beta_(*)$, but not otherwise on $eta$.
   Let $cal(P)_Z$ be the set of all pairs $\( R \, g \)$ that occur at any retained point in this decomposition.]
  #emph[Here “retained” has the following precise height meaning.
    List once all external coordinates $v_1 \, dots.h \, v_m$ that enter a buffered $L$-value, reciprocal,
    or logarithmic derivative in the verification of Equation (1.112),
    and include all three original Mellin heights, with zero coefficients when they do not occur in an argument.
    After pure-twist translations, every such argument has imaginary part $gamma_j + sum_(k = 1)^m a_(j k) v_k$,
    where the finite matrix $\( a_(j k) \)$ is fixed and $\| gamma_j \| lt.eq \( 3 i + 1 \) T_1$. Restrict
#[#set math.equation(numbering: n => "(1.113)")
 $ \| v_k \| lt.eq c_k T_1 \, wide c_k = frac(1, 2 m \( 1 + max_j \| a_(j k) \| \)) . $ <eq:stage-height-allocation>]

 Coordinates with zero coefficients may be restricted by the same rule.
   Then every added height is at most $T_1 \/ 2$ in total. Fixed bounded enlargements are included by increasing
   the lower threshold for $Z$. If extra Mellin integrals are used to establish Equation (1.112),
   that inequality is required for its full left side after those integrations.
   Any discarded parts must have been left on their global or absolute lines, bounded by Lemma 33 or Lemma 9,
   and included in the displayed bound before the hypothesis is asserted.
   The allowance $T_1 \/ 2$ is not renewed at successive estimates.]
  #emph[The common ideal exponent associated with a pair $\( R \, g \)$ is
#[#set math.equation(numbering: n => "(1.114)")
 $ E_(sigma_0) \( d \; R \, g \) = a - sigma_0 + h \( z_0 - 1 \/ 6 \) - a l_y - ell \/ 2 + g +
   d \( R + delta \/ 2 - z_0 \) . $ <eq:stage-high-exponent>]

 If $cal(B)$ is empty its contribution is zero. Otherwise put
$ E_(sigma_0 \, Z)^max \( d \) = sup_(\( R \, g \) in cal(P)_Z) E_(sigma_0) \( d \; R \, g \) . $

 For every $epsilon_d \, epsilon_p > 0$, the total contribution of $cal(B)$ on the central contours is,
   for sufficiently large $Z$,
#[#set math.equation(numbering: n => "(1.115)")
 $ lt.double_eta  & Z^(C \( sigma_0 \) + E_(sigma_0 \, Z)^max \( d \) + \( 16 - 6 l_y \) e)\
 & dot.op Z^(\( 1 + d \) epsilon_c + d epsilon_d + epsilon_p) \( 1 + T_1 \)^(A_eta) . $ <eq:stage-central-contribution>]

 The supremum is finite because the pairs lie in a fixed bounded range.
   The power $epsilon_p$ absorbs the pointwise logarithmic multiplicity.
   No separate integral for a pointwise piece or row set is asserted.
   All discarded portions and horizontal joins in this contour move are $O_(eta \, N) \( Z^(B_eta) T_1^(- N) \)$
   for every fixed $N$, where $B_eta$ is finite and is fixed before $N$.]
] <lem:bin-contour-accounting>

#proof[
  Apply Lemma 34 to the original triple integral, using for its three box constants the corresponding $c_k$ in
    Equation (1.113). These constants are positive and at most $1 \/ 2$.
    The full correction and the fixed bin therefore give the retained integral and the asserted errors before any
    pointwise pieces are introduced. Any auxiliary integrations used for the central bound are subject to the
    additional hypotheses in the statement.
  Now use the central decomposition and form the pointwise sets $cal(B)_(lambda \, nu)$.
    At each retained point apply the triangle inequality to the original row sum,
    and then apply Equation (1.112) to the sets present at that point.
    There are at most a fixed multiple of $\( 1 + log Z \)^D$ such sets pointwise.
    Bound each of their exponents by the supremum over $cal(P)_Z$ and integrate only the original holomorphic row
    sum. Thus neither measurability of an individual pointwise subdivision nor one common label set across contour
    points is needed. On the retained contours, Lemma 27 bounds the reciprocal by
    $O_(eta \, e \, epsilon_d) \( U^(epsilon_d) \)$. The tests have a uniformly bounded joint $L^1$ norm,
    since the transformation $\( Im s \, Im z \, Im w \) mapsto \( Im \( s + z \) \, Im z \, Im w \)$ is
    invertible. The scalar factor $zeta_F^S \( 6 z_0 \)$ is absolutely bounded.
    It remains to compute the real power of $Z$.
  The outside factor, including $q_u^(- z_0)$ and the real displacements in Equation (1.110), contributes
  $ l_x \( 1 \/ 2 - z_0 \) + a + z_0 - 1 - a l_y - d z_0 + \( 16 - 6 l_y \) e . $
  Equation (1.112) adds $d \( R + delta \/ 2 + epsilon_c \) + ell \( z_0 - 1 \/ 2 \) + g + epsilon_c$.
    The reciprocal adds $d epsilon_d$. Subtracting $C \( sigma_0 \) = sigma_0 + l_x \/ 2 - 1 +
    h \/ 6$ and using $h = 1 - l_x + ell$ gives Equation (1.114) and the remaining terms in Equation (1.115).
    The pointwise logarithmic multiplicity is bounded by $Z^(epsilon_p)$ for sufficiently large $Z$.
    This proves the claim. ◻
]

The lemma separates two uses of the correction. Its holomorphy and all-height majorant justify the contour move
  before the rows are subdivided by their pointwise sizes. The pieces in Equation (1.112) are used only after the
  move; they may be defined using local divisions whose nonvanishing has been proved on that retained region.
  Such a division supplies no continuation or tail bound outside that region.
  For the base correction there is only one piece, and Lemma 27 supplies the reflected numerator factor
  $U^(delta \/ 2 + 12 e + epsilon.alt)$ appearing in the central hypothesis.

===== 1.8.7 Extracting the principal signal <extracting-the-principal-signal>

The intermediate-row estimate leaves the principal row and the two outer norm ranges.
  We first cross the two scalar poles in the principal row.
  The following formulation also records the precise condition under which a different correction has the same
  target signal.

#thm([Lemma 1.33.])[
  (Extraction of the principal signal).  #emph[Assume Definition 32 and Equation (1.102).
    Fix $sigma_0 in \[ 7 \/ 8 \, 1 \)$ with $beta_(*) > sigma_0$ and $0 < e < 10^(- 3)$.
    Suppose that for every $epsilon.alt > 0$, uniformly in all imaginary parts on
$ Re s = beta_(*) + e \, wide 19 \/ 20 lt.eq Re w lt.eq 1 + e \, wide 33 \/ 200 lt.eq Re z lt.eq 1 \/ 6 + e \, $

 one has
#[#set math.equation(numbering: n => "(1.116)")
 $ \| frak(H)_(eta \, 1 \, Z) \( s \, w \, z \) \| lt.double_(eta \, e \, epsilon.alt)
   Z^(ell Re z + epsilon.alt) \( 1 + \| Im s \| + \| Im w \| + \| Im z \| \)^(J_(eta \, e \, epsilon.alt)) \,
   $ <eq:principal-correction-bound>]

 with finite $J_(eta \, e \, epsilon.alt)$ fixed before any external tail order.
   Suppose also that $A_eta \( Z \) eq.not 0$ for every sufficiently large real $Z$,
   that $\| A_eta \( Z \) \|^(- 1) lt.double_(eta \, epsilon.alt) Z^epsilon.alt$ for every $epsilon.alt > 0$,
   and that on $Re s = beta_(*) + e$, uniformly in $Im s$,
#[#set math.equation(numbering: n => "(1.117)")
 $ frak(H)_(eta \, 1 \, Z) \( s \, 1 \, 1 \/ 6 \) = H_eta \( s \) Z^(ell \/ 6)
   A_eta \( Z \) \( 1 + cal(R)_(eta \, Z) \( s \) \) . $ <eq:principal-correction-residue>]

 Here either $cal(R)_(eta \, Z)$ is identically zero, or there is a number $mu > 0$,
   chosen independently of $eta$, such that $\| cal(R)_(eta \, Z) \( s \) \| lt.double_eta
   Z^(- mu)$ on that entire line.]
  #emph[Let $cal(P)_eta \( Z \)$ be the $u = 1$ term of Equation (1.105), and define
$ f_eta \( Z \) = frac(1, 2 pi i) integral_(\( 2 \)) Z^(C \( s \)) e^(\( s - 5 \/ 6 \)^2)
  frac(H_eta \( s \), L_F^S \( s \, eta \)) thin d s . $

 Then $c_S > 0$, and, for every $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(1.118)")
 $ frac(cal(P)_eta \( Z \), c_S A_eta \( Z \)) - f_eta \( Z \) lt.double_(eta \, e \, epsilon.alt)  &
   Z^(C \( beta_(*) \) + \( 1 + h \) e - l_y \/ 20 + epsilon.alt) + Z^(C \( beta_(*) \) + e - h \/ 600 + epsilon.alt)\
 & + Z^(C \( beta_(*) \) + e - mu + epsilon.alt) . $ <eq:principal-remainder-bound>]

 The last term is omitted when $cal(R)_(eta \, Z)$ is identically zero.
   The implied constants and lower thresholds may depend on the target, but the displayed real exponents do not.]
] <lem:principal-residue-interface>

#proof[
  For $u = 1$, the scalar factor in the high identity is
  $ frac(zeta_F^S \( 6 z \) zeta_F^S \( w \), L_F^S \( s \, eta \)) . $
  Isolate this term on the absolute contours. Move to $Re s = beta_(*) + e$, $Re w = 1 + e$ and $Re z = 1 \/ 6 +
    e$. The reciprocal stays in $Re s > beta_(*)$, and both zeta arguments stay to the right of one.
    The paths lie in $cal(D)_2$, so the correction is holomorphic.
    The all-height majorant and Lemma 33 justify the horizontal limits.
  Move $w$ to $19 \/ 20$, crossing its simple pole at $w = 1$.
    In that residue move $z$ to $33 \/ 200 = 1 \/ 6 - 1 \/ 600$, crossing its simple pole at $z = 1 \/ 6$.
    The unresidued $w$ integral keeps $Re z = 1 \/ 6 + e$. All these paths lie in $cal(D)_2$,
    and $M \( z \)$ is holomorphic for $Re z > 0$. Thus the two stated scalar poles are the only poles crossed.
    The reciprocal remains on its global line throughout, even when $eta$ is principal.
    Every extended vertical $w$- or $z$-axis used to bound a tail lies strictly on one side of its scalar pole;
    $w = 1$ and $z = 1 \/ 6$ occur only as residues, and the horizontal joins have large nonzero height.
    On those axes the zeta functions have fixed polynomial bounds.
    Consequently the integrated and trace estimates of Lemma 33 apply without an unremoved pole in their
    majorants. After the $w$ residue, its Mellin factor has become the constant $hat(W)_1 \( 1 \)$.
    The remaining heights use the two-dimensional kernel in Equation (1.108),
    with $\( y_1 \, y_2 \) = \( Im \( s + z \) \, Im z \)$; its trace estimate justifies the subsequent $z$-join.
  On the principal contours, Equation (1.116) and the outside powers give the raw exponent
  $ l_x / 2 + Re s - 1 + h Re z + l_y \( Re w - 1 \) . $
  For the unresidued $w$ integral this is $C \( beta_(*) \) + \( 1 + h \) e - l_y \/ 20$;
    for the leftover $z$ integral in the $w$ residue it is $C \( beta_(*) \) + e - h \/ 600$.
    The reciprocal on $Re s = beta_(*) + e$ has an arbitrarily small power of its fixed target conductor and a
    fixed polynomial in height by Lemmas 13 and 14. The tests integrate those height powers.
    Requesting the small powers in the correction and in $A_eta^(- 1)$ to be sufficiently small gives the first
    two terms of Equation (1.118).
  The product of the scalar residues is $c_S$: the residue of $zeta_F^S \( 6 z \)$ at $1 \/
    6$ is one sixth of the residue of $zeta_F^S \( v \)$ at one.
    Positivity of $c_S$ was proved when the normalization was defined.
  At the double residue the outside power is
  $ X^(1 \/ 3) Z^(s - 5 \/ 6) Z^(ell \/ 6) = Z^(C \( s \)) \, wide Phi \( s + 1 \/ 6 - 1 \) = e^(\( s - 5 \/ 6 \)^2) . $
  Equation (1.117) therefore makes the normalized double residue
  $ frac(1, 2 pi i) integral_(\( beta_(*) + e \)) Z^(C \( s \)) e^(\( s - 5 \/ 6 \)^2)
    frac(H_eta \( s \), L_F^S \( s \, eta \)) \( 1 + cal(R)_(eta \, Z) \( s \) \) thin d s . $
  When present, the error factor is estimated on this line;
    the global reciprocal bound and Gaussian give
    $O_(eta \, e \, epsilon.alt) \( Z^(C \( beta_(*) \) + e - mu + epsilon.alt) \)$.
    No continuation of that error factor is required.
  Move only the main integral right to $Re s = 2$. The reciprocal is holomorphic for $Re s >
    beta_(*)$ by the definition of $beta_(*)$ and absolute Euler convergence beyond one.
    At a principal pole its reciprocal has a zero, so that case adds no residue.
    The function $H_eta$ is holomorphic there by Lemma 26, and is bounded there by Equation (1.102).
    The global reciprocal estimate is polynomial in height uniformly on the fixed real strip,
    while the Gaussian is $O \( e^(- \( Im s \)^2) \)$. Rectangular contours therefore have vanishing horizontal
    sides, and the shifted integral is exactly $f_eta \( Z \)$. This also covers $beta_(*) = 1$.
    The three remainders give the asserted bound. ◻
]

The function $H_eta$ in this lemma is the correction of the unmodified scalar Euler product at the double residue.
  A different full correction is permitted only when it verifies Equation (1.117) with a nonzero normalizer.
  For the base correction that equation holds with $A_eta = 1$ and $cal(R)_(eta \, Z) = 0$.
  The normalized physical quantity in any application is $cal(I)_eta \/ \( c_S A_eta \)$;
  the same normalizer must be used for its direct estimate and for this principal comparison.
  The raw central and outer-row bounds acquire only an arbitrarily small additional power after this division,
  by the hypothesis on $A_eta^(- 1)$.

======= 1.8.7.1 The base correction. <the-base-correction.>

Take $l_x = l_y = h = 1 \/ 2$ and $ell = 0$. On the principal rectangle of Lemma 36,
  the local correction is bounded uniformly in every height because that rectangle lies in $cal(D)_2$.
  Thus Equation (1.116) holds with $ell = 0$ and height order zero. At the double residue it satisfies exactly

$ frak(H)_(eta \, 1 \, Z) \( s \, 1 \, 1 \/ 6 \) = H_eta \( s \) =
  H_eta \( s \) Z^(ell \/ 6) dot.op 1 dot.op \( 1 + 0 \) . $

Hence $A_eta = 1$ and the residue error is identically zero.
  In the row $u = 1$, the outside factor $q_u^(- z) overline(xi \( u \))$ is one;
  the sole factor $1 \/ 6$ is already in $c_S$ from the residue of $zeta_F^S \( 6 z \)$.
  Lemma 36 therefore has just its two remainder terms. Their savings before losses are

$ m_w = l_y / 20 = 1 / 40 \, wide m_z = h / 600 = 1 / 1200 . $

===== 1.8.8 Small and large row norms <small-and-large-row-norms>

The buffered bin estimate is needed only on a bounded interval of positive row exponents.
  The following direct bounds cover its two complements. They ask for explicit absolute estimates on the full
  correction and do not use its central decomposition.

#thm([Lemma 1.34.])[
  (Outer row norms).  #emph[Assume Definition 32. Fix $sigma_0 in \[ 7 \/ 8 \, 1 \)$ with $beta_(*) > sigma_0$,
    $0 < e < 10^(- 3)$, $z_0 = 17 \/ 50$, and $d_min > 0$. For a dyadic number $U gt.eq 1$,
    let $cal(R)_eta \( U \; Z \)$ denote the contribution in Equation (1.105) of physical rows $U lt.eq
    q_u < 2 U$, omitting $u = 1$.]
  #emph[Suppose that for every $epsilon.alt > 0$, for all such rows with $q_u lt.eq 2 Z^(d_min)$,
    and uniformly in all imaginary parts on $\( Re s \, Re w \, Re z \) = \( beta_(*) + e \, 1 \/ 2 \, z_0 \)$,
#[#set math.equation(numbering: n => "(1.119)")
 $ \| frak(H)_(eta \, u \, Z) \( s \, w \, z \) \| lt.double_(eta \, e \, epsilon.alt) Z^(ell z_0 + epsilon.alt)
   q_u^epsilon.alt \( 1 + \| Im s \| + \| Im w \| + \| Im z \| \)^(J_(eta \, e \, epsilon.alt)) .
   $ <eq:small-correction-bound>]

 Then, for every $epsilon.alt > 0$ and $1 lt.eq U lt.eq Z^(d_min)$,
#[#set math.equation(numbering: n => "(1.120)")
 $ \| cal(R)_eta \( U \; Z \) \| lt.double_(eta \, e \, epsilon.alt)
   Z^(C \( beta_(*) \) + h \( z_0 - 1 \/ 6 \) - l_y \/ 2 + e + epsilon.alt) U^(63 \/ 50 + epsilon.alt) .
   $ <eq:small-row-bound>]

 In particular the sum of these dyads is
#[#set math.equation(numbering: n => "(1.121)")
 $ lt.double_(eta \, e \, epsilon.alt)
   Z^(C \( beta_(*) \) + h \( z_0 - 1 \/ 6 \) - l_y \/ 2 + e + \( 63 \/ 50 \) d_min + epsilon.alt) .
   $ <eq:small-row-sum>]

]
  #emph[For the other end, suppose that for every fixed $v > 2$ and $epsilon.alt > 0$, for every physical row,
    uniformly in all imaginary parts on $\( Re s \, Re w \, Re z \) = \( 2 \, 2 \, v \)$,
#[#set math.equation(numbering: n => "(1.122)")
 $ \| frak(H)_(eta \, u \, Z) \( s \, w \, z \) \| lt.double_(eta \, v \, epsilon.alt) Z^(ell v + epsilon.alt)
   q_u^epsilon.alt \( 1 + \| Im s \| + \| Im w \| + \| Im z \| \)^(J_(eta \, v \, epsilon.alt)) .
   $ <eq:large-correction-bound>]

 Write $B_0 = l_x \/ 2 + 1 + l_y$. Then, for every dyad $U$,
#[#set math.equation(numbering: n => "(1.123)")
 $ \| cal(R)_eta \( U \; Z \) \| lt.double_(eta \, v \, epsilon.alt) Z^(B_0 + h v + epsilon.alt)
   U^(1 + epsilon.alt - v) . $ <eq:large-row-bound>]

 For every fixed $zeta > 0$, if $epsilon.alt < v - 1$, its sum over $U > Z^(h + zeta)$ is
#[#set math.equation(numbering: n => "(1.124)")
 $ lt.double_(eta \, v \, epsilon.alt) Z^(B_0 + \( h + zeta \) \( 1 + epsilon.alt \) - zeta v + epsilon.alt) .
   $ <eq:large-row-sum>]

 Thus a fixed sufficiently large $v$ makes this last contribution smaller than any prescribed power of $Z$.]
] <lem:outer-row-tails>

#proof[
  Every row under consideration has nonprincipal numerator by the classification preceding Lemma 36.
    The denominator may be principal for a bounded unit row; its reciprocal is nevertheless holomorphic and
    bounded on $Re s = beta_(*) + e$ by the principal specialization of Lemma 13.
    For all rows, the conductor and deletion radical bounds in Section 6, together with Lemma 14,
    give an arbitrarily small power of $q_u$ and a fixed height polynomial for that reciprocal.
  For a small dyad move its finite sum to $\( Re s \, Re w \, Re z \) = \( beta_(*) + e \, 1 \/ 2 \, z_0 \)$.
    The reciprocal stays global. The numerator is entire, and the scalar zeta argument stays to the right of one.
    These paths may be taken in $cal(D)_1 \( 3 \/ 8 \)$: at the final point $Re \( s + w \) = beta_(*) + e +
    1 \/ 2 > 1 + 3 \/ 8$, and the other inequalities are immediate.
    The all-height correction bound and Lemma 33 justify the moves.
    On the final lines, Equation (1.15) and the deletion bound give $U^(3 \/ 5 + epsilon.alt)$ times a fixed
    height polynomial for the nonprincipal numerator. There are $O \( U \)$ element rows in the dyad,
    including unit factors, and $q_u^(- z_0) lt.double U^(- z_0)$. The correction is bounded by Equation (1.119).
    The tests integrate all fixed height powers. The resulting exponent outside the row power,
    relative to $C \( beta_(*) \)$, is
  $ h \( z_0 - 1 \/ 6 \) - l_y \/ 2 + e \, $
  and the row power is $1 + 3 \/ 5 - z_0 = 63 \/ 50$. Requesting the component small powers to sum to the
    displayed $epsilon.alt$ proves Equation (1.120). The row exponent is positive,
    so dyadic summation up to $Z^(d_min)$ gives Equation (1.121), after decreasing the preliminary losses.
  For each fixed $Z$ and large dyad, move its finite row sum to the absolute lines $\( 2 \, 2 \, v \)$.
    The path from $\( 3 \, 3 \, 2 \)$ remains in $Re s \, Re w gt.eq 2$ and $Re z gt.eq 2$,
    so the scalar factors are holomorphic there. For this fixed dyad choose $D$ large enough to contain its rows
    in $q_u lt.eq Z^D$; Equation (1.104) and the external trace bound make its horizontal limits vanish.
    Constants used only to justify this equality may depend on the fixed dyad.
    The estimate on the final lines is uniform in the dyad by Equation (1.122).
    The scalar $L$-factors are absolutely bounded there, as is $zeta_F^S \( 6 z \)$, and Equation (1.122) applies.
    The outside power, including the correction but not the row count, is
  $ l_x \( 1 \/ 2 - v \) + 1 + v + l_y + ell v = B_0 + h v . $
  The $O \( U \)$ rows and $q_u^(- v)$ give $U^(1 - v)$; the tests integrate the fixed height polynomial.
    This proves Equation (1.123). Because $1 + epsilon.alt - v < 0$,
    summing its geometric dyadic tail gives Equation (1.124).
    For fixed $zeta > 0$, the coefficient of $v$ in that exponent is $- zeta$, proving the last assertion.
    The original row series is absolutely convergent on its starting lines,
    and the displayed bounds give an absolutely summable final tail,
    so the individual dyadic contour identities may be summed.
    The number $v$ and the finite test orders it requires are fixed before $Z$ tends to infinity. ◻
]

======= 1.8.8.1 The first-stage outer ranges. <the-first-stage-outer-ranges.>

Use $l_x = l_y = h = 1 \/ 2$, $ell = 0$, $d_min = 1 \/ 63$ and $zeta = 1 \/ 1000$,
  as in the intermediate-row estimate. For the small rows, the line $\( beta_(*) + e \, 1 \/ 2 \, z_0 \)$ lies in
  $cal(D)_1 \( 3 \/ 8 \)$, since $beta_(*) > 11 \/ 12$. The local bound $cal(H)_(eta \, u) lt.double_epsilon.alt
  q_u^epsilon.alt$, uniform in all heights, verifies Equation (1.119) for all the prescribed rows,
  with height order zero. Equation (1.121) then has the following relative exponent before its losses:

$ h \( z_0 - 1 \/ 6 \) - l_y / 2 + 63 / 50 d_min = 13 / 150 - 1 / 4 + 1 / 50 = - 43 / 300 . $

For the large rows, $\( 2 \, 2 \, v \)$ with $v > 2$ lies in $cal(D)_2$.
  The same all-height local bound verifies Equation (1.122) for every physical row.
  Here $B_0 = l_x \/ 2 + 1 + l_y = 7 \/ 4$, so Equation (1.124) has exponent

$ 7 / 4 + 501 / 1000 \( 1 + epsilon.alt \) - v / 1000 + epsilon.alt . $

It tends to $- oo$ as the fixed number $v$ increases. For example, $v = 4000$ makes it less than $-
  1$ when $epsilon.alt lt.eq 10^(- 6)$, whereas $C_(upright(I)) \( beta_(*) \) gt.eq 1 \/ 4$.
  This more than supplies the saving needed below. The three ranges $U lt.eq Z^(d_min)$, $Z^(d_min) < U lt.eq
  Z^(h + zeta)$, and $U > Z^(h + zeta)$ cover every physical dyad.
  The row $u = 1$ was already assigned to the principal term.

==== 1.9 The $11 \/ 12$ conclusion <sec:eleven-twelfths-conclusion>

For the normalized base probe the central estimate, principal extraction,
  and outer-row estimates now give the following margins before adjustable losses:

$ upright("contribution") & upright("saving relative to ") C_(upright(I)) \( beta_(*) \)\
upright("intermediate rows") & 1021 \/ 25000\
upright("unresidued principal ") w upright(" integral") & 1 \/ 40\
upright("remaining principal ") z upright(" integral") & 1 \/ 1200\
upright("small rows") & 43 \/ 300\
upright("large rows ") \( v = 4000 \) & > 1 $

The smallest margin comes from the principal $z$ remainder.
  We retain a common positive margin after all real losses, then choose the analysis height for each target.
  The physical sum and the signal do not depend on that height.

===== 1.9.1 Choosing the final height <choosing-the-final-height>

The preceding estimates separate real powers from finite powers of the analysis height $T_1$.
  The following elementary step records the order of choices needed to obtain one power saving for every target.

#thm([Lemma 1.35.])[
  (Late choice of height and external order).  #emph[Fix $sigma_0 in \( 1 \/ 2 \, 1 \)$ with $Delta_0 = beta_(*) -
    sigma_0 > 0$ and an affine function $C \( s \) = s + c$. Suppose that all real parameters and finite
    structural choices in an application have been fixed independently of $eta$.
    Suppose there are common numbers $m > 0$ and $0 < omega < Delta_0$ such that,
    for every primitive finite-order target, functions $J_eta \, f_eta$ independent of $T_1$ satisfy
$ \| J_eta \( Z \) \| lt.double_eta Z^(C \( sigma_0 \) + omega) . $

 Assume that after a finite sum of estimates, for every integer $N gt.eq 0$,
#[#set math.equation(numbering: n => "(1.125)")
 $ \| J_eta \( Z \) - f_eta \( Z \) \| lt.double_(eta \, N) Z^(C \( beta_(*) \) - m) \( 1 + T_1 \)^(A_eta) +
   Z^(B_eta) T_1^(- N) \, $ <eq:late-height-hypothesis>]

 where $A_eta gt.eq 0$ and $B_eta$ are finite and independent of $N$.
   Suppose there is a number $tau_(0 \, eta) > 0$, fixed after the real choices and the finite profile orders for
   the target but before $N$ and $Z$, such that the estimate is valid for sufficiently large $Z$ whenever $T_1 =
   Z^tau$ and $0 < tau lt.eq min { d_min \/ 100 \, tau_(0 \, eta) }$, with a fixed $d_min > 0$.
   This additional ceiling may encode a height condition in a preceding estimate, such as the one in Lemma 28.
   The lower threshold may depend on $eta \, N \, tau$. Increasing $N$ is assumed to change only external test
   seminorms, not $A_eta$ or the already fixed real powers in Equation (1.125).]
  #emph[Then $tau$ and $N$ can be chosen after $eta$ so that
$ \| J_eta \( Z \) - f_eta \( Z \) \| lt.double_eta Z^(C \( beta_(*) \) - m \/ 2) . $

 In particular the common saving $sigma = m \/ 2$, together with the displayed low estimate,
   has the target quantifier required by Proposition 3.]
] <lem:late-height-closure>

#proof[
  For the fixed target choose
  $ 0 < tau_eta lt.eq min {d_min / 100 \, tau_(0 \, eta) \, frac(m, 4 \( A_eta + 1 \))} \, wide T_1 = Z^(tau_eta) . $
  Then $\( 1 + T_1 \)^(A_eta) lt.double_eta Z^(m \/ 4)$, so the first term in Equation (1.125) is
    $O_eta \( Z^(C \( beta_(*) \) - 3 m \/ 4) \)$. Next choose a fixed integer $N$ such that
  $ B_eta - N tau_eta < C \( beta_(*) \) - m \/ 2 . $
  This is possible because $tau_eta > 0$ and $B_eta$ is finite.
    The second term is then bounded by the required power. Increase the lower threshold for $Z$ after these
    choices. Both $m$ and $omega$ were fixed before the target, whereas $tau_eta \,
    N$ and the threshold may depend on it. Since $J_eta$ and $f_eta$ do not contain $T_1$,
    this proves the asserted family-wide exponent without changing either function. ◻
]

#thm([Proposition 1.36.])[
  (Balanced high estimate).  #emph[Under the supposition $Delta_1 > 0$,
    for every primitive finite-order target $eta$ and all sufficiently large $Z$,
$ \| J_(upright(I) \, eta) \( Z \) - f_(upright(I) \, eta) \( Z \) \| lt.double_eta
  Z^(C_(upright(I)) \( beta_(*) \) - 1 \/ 4800) . $

 The displayed saving is independent of the target; the implied constant and lower threshold may depend on it.]
] <prop:balanced-high>

#proof[
  Use $l_x = l_y = h = 1 \/ 2$, $ell = 0$ and $C = C_(upright(I))$.
    The exact identity and local correction were verified at the start of Section 8;
    Equation (1.111) estimates its intermediate rows, and the principal and outer specializations there give the
    margins listed above. It remains to choose their losses.
  ======= 1.9.1.1 Order of choices. <order-of-choices.>
  We give a common loss budget. Put
  $ m_0 = 1 / 1200 \, wide epsilon.alt_(*) = 10^(- 6) \, wide m = 1 / 2400 \, wide omega = Delta_1 / 2 . $
  The error-free central, small, principal, and large savings just proved are all at least $m_0$.
    Fix the displayed geometry, row ranges, and $v = 4000$ before the target.
    Request loss $epsilon.alt_(*)$ in the row count, numerator, local correction, buffered reciprocal,
    central multiplicity, and each principal or outer estimate.
    Reserve a further loss $epsilon.alt_(*)$ for the $O \( log Z \)$ physical dyads.
    The witness-pair and powerful-part logarithms are already included in the requested row-count loss;
    the $O_e \( 1 \)$ bins and fixed presentation choices cost constants.
  To obtain the requested row-count loss, first choose its preliminary witness, dyadic,
    and sieve losses sufficiently small in terms of $epsilon.alt_(*)$.
    These choices are independent of the target. Indeed the witness length error has an absolute coefficient,
    and the affine slopes in the optimization of Proposition 31 are uniformly bounded.
    The target-dependent constants in the actual dyadic endpoints multiply only $1 \/ log U$,
    which changes a fixed constant or lower threshold. Apply Lemma 28 on the enclosing pre-saturation ranges $0
    lt.eq r \, m lt.eq 22$: the detector’s terminal product cutoff is $O \( U^21 \)$ before it proves the shorter
    witness lengths. Its number $e_0$ depends only on the requested dyadic loss and these bounded ranges.
    We may thus fix, still before the target,
  $ 0 < e < min { 10^(- 3) \, epsilon.alt_(*) \, e_0 } . $
  With $epsilon.alt_r = epsilon.alt_n = epsilon.alt_H = epsilon.alt_(*)$, this gives $epsilon_c lt.eq
    15 epsilon.alt_(*)$. Since $d lt.eq 501 \/ 1000 < 1$, the explicit central losses in Equation (1.111),
    together with the reserved physical-dyad loss, are at most
  $ 13 epsilon.alt_(*) + 2 \( 15 epsilon.alt_(*) \) + epsilon.alt_(*) + epsilon.alt_(*) + epsilon.alt_(*) =
    46 epsilon.alt_(*) < 1 / 4800 = m_0 / 4 . $
  The two principal losses are at most $\( 3 \/ 2 + 1 \) epsilon.alt_(*)$ and $2 epsilon.alt_(*)$;
    the small-row loss is at most $2 epsilon.alt_(*)$. Each is less than $m_0 \/ 4$.
    The displayed large-row estimate already uses its requested loss.
    Therefore all these terms, after division by the fixed $c_S$, retain at least $3 m_0 \/ 4 =
    1 \/ 1600$ before the height factor. We use only $m = 1 \/ 2400$,
    leaving a further power $1 \/ 4800$ available below.
  It remains to check when the height hypotheses hold. Let $epsilon.alt_(upright("det")) >
    0$ be the fixed dyadic loss chosen above, and, after fixing a target,
    let $A_(upright("det") \, eta)$ dominate the finitely many orders in its uses of Lemma 28. Set
  $ tau_(0 \, eta) = frac(d_min epsilon.alt_(upright("det")), 20 \( A_(upright("det") \, eta) + 1 \)) > 0 . $
  For $0 < tau lt.eq tau_(0 \, eta)$ and sufficiently large $Z$,
  $ \( 1 + Z^tau \)^(A_(upright("det") \, eta)) lt.eq Z^(d_min epsilon.alt_(upright("det")) \/ 10) lt.eq
    U^(epsilon.alt_(upright("det")) \/ 10) wide \( d gt.eq d_min \) . $
  This verifies the detector height condition uniformly over the physical range.
    The fixed factor from $1 + Z^tau lt.eq 2 Z^tau$ is absorbed by the lower threshold.
    We also impose $tau lt.eq d_min \/ 100$ as required by the bins.
    The internal tail orders used to establish the witnesses are chosen after this $tau$ and are separate from the
    final external order $N$ below. Their increase does not change the retained profile or height orders.
    Any fixed constants introduced by those internal choices are absorbed into the unused power $1 \/
    4800$ by increasing the lower threshold, which may depend on $eta$ and $tau$.
  For every final integer $N gt.eq 0$, Lemma 34 bounds the discarded high portions and joins by
    $O_(eta \, N) \( Z^(B_eta) T_1^(- N) \)$, with $B_eta$ fixed before $N$.
    The bounded real and row ranges and the finite set of bins permit one such $B_eta$ for all the central dyads.
    Summing the $O \( log Z \)$ dyads can be absorbed by increasing $B_eta$ by one, again before $N$.
    Combining the preceding estimates gives
  $ \| J_(upright(I) \, eta) \( Z \) - f_(upright(I) \, eta) \( Z \) \| lt.double_(eta \, N)
    Z^(C_(upright(I)) \( beta_(*) \) - m) \( 1 + T_1 \)^(A_eta) + Z^(B_eta) T_1^(- N) $
  for some finite $A_eta \, B_eta$, whenever $0 < tau lt.eq min { d_min \/ 100 \,
    tau_(0 \, eta) }$ and $Z$ is sufficiently large. Both functions are independent of $T_1$.
    Proposition 25, applied with loss $omega$ and divided by the same fixed $c_S$, supplies
  $ \| J_(upright(I) \, eta) \( Z \) \| lt.double_eta Z^(1 \/ 4 + omega) =
    Z^(C_(upright(I)) \( 11 \/ 12 \) + omega) \, wide 0 < omega < Delta_1 . $
  All hypotheses of Lemma 38 are now verified. It gives the saving $m \/ 2 = 1 \/ 4800$ asserted in the proposition. ◻
]

===== 1.9.2 Transfer to Dirichlet $L$-functions <transfer-to-dirichlet-l-functions>

The continuation criterion concerns the Hecke family over $F$.
  We prove once that a strict zero-free half-plane for that family has the corresponding Dirichlet consequence.

#thm([Proposition 1.37.])[
  (Quadratic transfer).  #emph[Let $sigma_0 in \[ 1 \/ 2 \, 1 \)$.
    Suppose every primitive finite-order Hecke $L$-function over $F =
    bb(Q) \( sqrt(- 3) \)$ is zero-free on $Re s > sigma_0$, with its principal pole at one allowed.
    Then every finite-order Hecke $L$-function over $F$ and every Dirichlet $L$-function is zero-free on that same
    strict half-plane, again allowing the principal pole at one.]
] <prop:hecke-dirichlet-transfer>

#proof[
  Passing from a primitive Hecke character to one that it induces changes only finitely many factors $1 -
    eta \( frak(p) \) N frak(p)^(- s)$. They are nonzero for $Re s > 0$,
    so the Hecke assertion extends to all finite-order characters.
    The same observation for factors $1 - chi \( p \) p^(- s)$ reduces the Dirichlet assertion to a primitive
    Dirichlet character $chi$ of conductor $q$.
  Let $chi_(- 3)$ be the quadratic character of conductor three,
    and let $eta$ be the finite-order Hecke character given by $frak(a) mapsto
    chi \( N frak(a) \)$ on ideals coprime to $3 q$. It is a ray character:
    if $alpha equiv 1 med \( mod med q cal(O) \)$, then $N alpha equiv 1 med \( mod med q \)$,
    so the norm character is trivial on the corresponding principal ray subgroup.
    Let $S_(bb(Q))$ be the rational primes dividing $3 q$, and let $cal(S)_(bb(Q))$ be the primes of $F$ above
    them. Superscripts by these sets denote deletion of those Euler factors.
  For $p in.not S_(bb(Q))$, the local factors agree as follows.
    If $p$ splits in $F$, then $chi_(- 3) \( p \) = 1$, the two prime ideals have norm $p$,
    and the Hecke factor is $\( 1 - chi \( p \) p^(- s) \)^(- 2)$.
    This is the product of the Dirichlet factors for $chi$ and $chi chi_(- 3)$.
    If $p$ is inert, then $chi_(- 3) \( p \) = - 1$, the unique prime ideal has norm $p^2$, and its factor is
  $ \( 1 - chi \( p \)^2 p^(- 2 s) \)^(- 1) = \( 1 - chi \( p \) p^(- s) \)^(- 1) \( 1 + chi \( p \) p^(- s) \)^(-
    1) . $
  These exhaust the primes outside $S_(bb(Q))$. Absolute Euler convergence for $Re s > 1$,
    followed by uniqueness of meromorphic continuation, gives
  #[#set math.equation(numbering: n => "(1.126)")
   $ L_F^(cal(S)_(bb(Q))) \( s \, eta \) = L^(S_(bb(Q))) \( s \, chi \) L^(S_(bb(Q))) \( s \, chi chi_(- 3) \) .
     $ <eq:hecke-dirichlet-factorization>]
  The product character on the right may be imprimitive; deletion of $S_(bb(Q))$ makes the identity independent of
    that choice. Every deleted factor is nonzero for $Re s > 0$.
  Both Dirichlet factors are holomorphic in $0 < Re s < 1$.
    A zero of $L \( s \, chi \)$ there would therefore give a zero of the Hecke factor,
    with no cancellation by a pole, and the assumed Hecke half-plane excludes it when $Re s > sigma_0$.
    Absolute Euler convergence handles $Re s > 1$. On $s = 1 + i t$ with $t eq.not 0$,
    neither Dirichlet factor has a pole, so the same product argument applies.
  At $s = 1$, a pole-zero cancellation could occur only if one primitive inducing character among $chi$ and $chi
    chi_(- 3)$ were principal. The other would then be $chi_(- 3)$.
    Its Dirichlet series converges at one by bounded partial sums of the nonprincipal periodic character,
    and grouping consecutive terms gives
  $ L \( 1 \, chi_(- 3) \) & = sum_(n gt.eq 0) (frac(1, 3 n + 1) - frac(1, 3 n + 2))\
 & = integral_0^1 frac(1 - x, 1 - x^3) thin d x = integral_0^1 frac(d x, 1 + x + x^2) = frac(pi, 3 sqrt(3)) > 0 . $
  The first integral follows by monotone convergence of the nonnegative paired integrands.
    Thus there is no zero in this last case either; a principal pole is allowed.
    This proves the strict half-plane assertion with no claim on its boundary. ◻
]

#proof[
  Suppose that $beta_(*) > 11 \/ 12$. Lemma 26 and Equation (1.102) give the required holomorphic,
    nonzero $H_eta$ on $Re s > 11 \/ 12$ for every primitive target.
    The low and high bounds established in Proposition 39 and its proof verify Proposition 3 with
  $ sigma_0 = 11 / 12 \, wide C = C_(upright(I)) \, wide omega = Delta_1 / 2 \, wide sigma = 1 / 4800 . $
  These two positive losses are independent of the target, while the allowed constants, excluded sets,
    and thresholds may depend on it. The continuation criterion contradicts the supposition.
    Therefore $beta_(*) lt.eq 11 \/ 12$. By its definition and absolute Euler convergence in $Re s > 1$,
    every primitive finite-order Hecke $L$-function over $F$ is zero-free in the strict half-plane $Re s > 11 \/
    12$, with the principal pole allowed.
  Proposition 40, applied at the same boundary, extends this assertion to all finite-order Hecke characters and
    all Dirichlet $L$-functions, including $zeta \( s \)$. It preserves the strict half-plane and the allowed
    principal pole. This proves the theorem. ◻
]

== 2 The seven-eighths zero-free half-plane <part:seven-eighths>

==== 2.1 The compensated probe <sec:compensation>

Theorem 4 applies to every primitive character entering the supremum in Equation (1),
  and therefore gives $beta_(*) lt.eq 11 \/ 12$. Suppose for contradiction throughout Part II that $beta_(*) >
  7 \/ 8$, and put

#[#set math.equation(numbering: n => "(2.1)")
 $ Delta := beta_(*) - 7 / 8 \, wide 0 < Delta lt.eq 1 / 24 \, wide kappa := 2 beta_(*) - 1 = 3 / 4 +
   2 Delta lt.eq 5 / 6 . $ <eq:part-II-bootstrap>]

The exact bin ceiling in Section 6 applies, since $beta_(*) > 7 \/ 8 > 51 \/ 100$.
  For every retained nonprincipal row and its bin $\( i \, a \)$ it gives

#[#set math.equation(numbering: n => "(2.2)")
 $ a lt.eq beta_(*) \, wide delta = 2 a - 1 lt.eq kappa lt.eq 5 / 6 . $ <eq:part-II-bin-ceiling>]

Indeed, the finite set defining $M_i \( u \)$ consists of the floor $51 \/ 100$ and real parts of actual zeros,
  all at most $beta_(*)$. This uses only the definition of the supremum, not its attainment.
  The boundary case $delta = 5 \/ 6$ remains part of the argument.

For the second application of Proposition 3, write throughout Part II

#[#set math.equation(numbering: n => "(2.3)")
 $ C \( s \) = C_(upright("II")) \( s \) := s - 11 / 16 \, wide C \( 7 \/ 8 \) = 3 / 16 . $ <eq:part-II-mellin-target>]

Our task is to construct a normalized probe $J_(upright("II") \, eta)$ from the finite expression below.
  It is distinct from the balanced probe $J_(upright(I) \, eta)$.
  Its low-side target is $\| J_(upright("II") \, eta) \( Z \) \| lt.double_eta
  Z^(3 \/ 16 + omega)$ for a common $0 < omega < Delta$; its high side must satisfy the signal estimate in
  Equation (4) with this $C$. The nonzero scalar normalization will be specified after the principal term is evaluated.

For each primitive target $eta$, use an admissible fixed instance of the data $T \, S \, b_(*) \, xi \, tau \,
  Xi \, W_0 \, W_1$ from Section 4. The permitted choice of $P_0$ will be made in the parameter order below.
  These data may differ from those used in Part I, but within this application they are independent of $Z$ and are
  the same in the physical probe and its high representation.

We first define the two-term modification on the original probe, before moving any contour.
  The subsequent low and high estimates will concern this same finite expression.

Use the fixed geometry

#[#set math.equation(numbering: n => "(2.4)")
 $ b = 1 / 8 \, wide h = 13 / 16 \, wide ell = 1 / 6 \,\
l_x = 1 + ell - h = 17 / 48 \, wide l_y = l_x + b = 23 / 48 \,\
X = Z^(l_x) \, wide Y = Z^(l_y) \, wide M = l_x + l_y = 5 / 6 \, wide M + ell = 1 . $ <old-eq:5.1>]

Fix positive slot lengths $ell_1 \, dots.h \, ell_K$ of total length $ell$, and put $P_i = Z^(ell_i)$.
  Each physical slot has a nonnegative, nonzero smooth annular weight $W_i \( q_p \/ P_i \)$. Its allowed prime set is

$ cal(P)_i \( Z \) = { p upright(" prime") : p in.not S \, med p in 1_T \, med q_p \/ P_i in "supp" W_i } . $

The underlying window sets ${ p upright(" prime") : q_p \/ P_i in "supp"
  W_i }$ for distinct slots are required to be disjoint before imposing the ray and $S$ restrictions.
  In particular, the sets $cal(P)_i \( Z \)$ are disjoint, and every tuple in $product_i
  cal(P)_i \( Z \)$ consists of distinct primes. The number and lengths of the slots will be chosen later,
  but they are fixed independently of $Z$. A sum over $p in
  1_T$ for slot $i$ below always retains this same exclusion and annular support.

For a squarefree product $D$ of slot primes, let $I_(eta \; D) \( X \, Y \, Z \)$ denote Equation (1.55) with the
  indicator $1_(D divides c n^3)$ inserted in its completed row. Thus $I_(eta \; 1) = I_eta$.
  For a tuple $\( p_1 \, dots.h \, p_K \) in product_i cal(P)_i \( Z \)$ and $J subset.eq { 1 \, dots.h \,
  K }$ write $p_J = product_(i in J) p_i$, with $p_diameter = 1$.
  The subset $J$ indexes the rescaled slots and $J^c$ the marked slots;
  this subset notation is distinct from the normalized probe $J_(upright("II") \, eta)$.
  Define the modified probe by the finite identity

#[#set math.equation(numbering: n => "(2.5)")
 $ I_(eta \, upright("modified")) \( Z \) = sum_(\( p_i \) in product_i cal(P)_i \( Z \)) product_(i = 1)^K
   W_i \( q_(p_i) \/ P_i \) sum_(J subset.eq { 1 \, dots.h \, K }) & \( - 1 \)^(\| J \|) q_(p_J)^(- 3 \/ 2)
   overline(eta \( p_(J^c) \))\
 & dot.op I_(eta \; p_(J^c)) \( X \/ q_(p_J) \, Y \/ q_(p_J) \, Z q_(p_(J^c)) \) . $ <eq:compensated-probe-definition>]

Equivalently, at each prime $p$ the operation is the marked term $overline(eta \( p \))
  I_(eta \; p) \( X \, Y \, Z q_p \)$ minus the rescaled term $q_p^(- 3 \/ 2)
  I_eta \( X \/ q_p \, Y \/ q_p \, Z \)$. Formula (2.5) specifies their composition:
  every slot window stays at its original scale $P_i$, including when another slot changes the completed scale.
  On $1_T$ one has $theta \( p \) = 1$ for every $theta in hat(T)$.
  Thus marking commutes with the Fourier decomposition of $overline(G)$ and preserves the same excluded set and
  zero masks in every summand. The subtraction is designed to cancel the scalar prime contribution on the high
  side, leaving the sextic-character prime factor used by the moment estimates.
  Section 5 proves the exact identity and bounds the remaining local errors.

==== 2.2 Coefficient conventions and finite correlations <sec:additional-arithmetic>

We record the additional coefficient conventions for the prime factors,
  then prove a fixed-ray prime normalizer and the full finite Fourier correlations needed below.
  The latter retain shared prime powers and will be used in the additive Gram bound as well as the fourth moment.
  The residue-symbol and fixed-data conventions of Part I remain in force.

===== 2.2.1 Additional coefficient conditions <additional-coefficient-conditions>

We use the plain and inverse polynomials, annular profiles, and fixed arithmetic datum $cal(A)$ from Section 2.
  The following conditions specify the extra prime factors and moving zero supports used in this part.

A prime slot of log-length $z_i$ is

#[#set math.equation(numbering: n => "(2.6)")
 $ Q_(psi \, i) = Z^(- z_i \/ 2) sum_(p med upright("prime")) psi \( p \) nu_i \( p \) W_i \( q_p \/ Z^(z_i) \) .
   $ <old-eq:1.2>]

Here $nu_i$ is a fixed finite-ray character or a fixed finite linear combination of such characters.
  It is independent of the row and of the other selected primes.
  Distinct slots have disjoint underlying prime supports before any common mask or row zero extension is imposed.
  For the fourth moment of Section 7, a fixed finite group $Theta$ of ray characters is part of the data,
  and every character component with nonzero coefficient in every positive-length slot must belong to $Theta$.
  The inverse moment of Section 6 also allows a bounded coefficient $a_i \( p \)$ chosen independently for each
  slot and independently of the row and all other columns; the coefficient of a prime tuple is then the product of
  its individual slot coefficients. The $Theta$ restriction does not apply to these separate inverse-moment weights.

For an auxiliary fourth moment the rows are elements $0 < q_k lt.double Z^m$, and

#[#set math.equation(numbering: n => "(2.7)")
 $ psi_k \( n \) = tau \( n \) chi_n \( k \) \, wide M = m + q . $ <old-eq:1.3>]

The twist $tau$ is common to the row sum after its outer labels are fixed,
  and its displayed factorization into fixed finite-ray and moving residue-symbol factors is part of the data.
  Let $D_(upright("mov"))$ be the squarefree product of all good primes at which at least one displayed moving
  factor has its natural zero on nonunits. This includes a prime even when that factor has exponent divisible by
  six, including exponent zero, or when local characters cancel after multiplication.
  We require $q_(D_(upright("mov"))) lt.eq Z^q$, counting an overlapping prime once.

An additional puncture is an indicator $1_(\( n \, R \) = 1)$ with $R$ squarefree, $q_R lt.eq Z^B$,
  and $B$ in a prescribed bounded range. It must be common to the current row sum and to every plain and prime
  factor in that sum; it may depend on previously frozen outer labels.
  A prime may be removed from $D_(upright("mov"))$ and put in $R$ only through an exact factorization of its
  displayed local factor into that coprimality indicator and the local or fixed-ray character phases that remain.
  Those phases must be retained, the refactored zero must be removed from the displayed moving factor,
  and the common puncture is deleted before the natural reflection in Section 7.
  No zero prime may be omitted from both supports. If a moving character still ramified at that prime remains,
  the prime stays in $D_(upright("mov"))$; only a redundant zero may be transferred to $R$.
  A fixed finite-ray character here has its complete zero-extended presentation and ray group fixed in the
  preceding sense; a character with moving conductor cannot be relabeled as fixed.
  A locally frozen moving twist factor or redundant zero mask retains the stated moving-support and puncture
  requirements. In particular a $Z$-varying redundant mask cannot be included in the fixed arithmetic datum.
  The zero extension of $chi_n \( k \)$ is allowed to vary naturally with $k$,
  but cancellation between that varying row factor and a fixed twist may not be recast as a separately chosen
  puncture for each row. Externally chosen row-dependent punctures and row-dependent column coefficients are not
  part of this class. This full-support convention governs every fourth-moment invocation in Section 7.

The common uniformity convention has the following additional clauses for these coefficient classes.
  Any required slot mesh depends only on the fixed real log-length ranges, the strict margins,
  and the specified positive power losses. Finite seminorm orders, polynomial height orders, implied constants,
  and lower thresholds may also depend on a specified fixed number of slots.
  They are uniform over the moving moduli, the radicals included in $M$, the admissible punctures,
  and the outer labels in their stated ranges, even when an outer label is fixed during one row sum.
  The constant $C$ in the definition of a divisor-bounded multiplicity may also depend on this fixed slot count.
  The independence of $C$ from $Z$, the current rows, and the averaged labels,
  and any separate requirement that the multiplicity depend only on $f$, remain as in Section 2.
  The slot count is a separate fixed parameter, and moving labels remain outside $cal(A)$.

===== 2.2.2 Prime counting in a fixed ray class <prime-counting-in-a-fixed-ray-class>

#thm([Lemma 2.1.])[
  (Fixed-ray prime normalizer).  #emph[Let $T$ be a fixed quotient of a ray class group of $F$,
    and write $p in 1_T$ when the image of an unramified prime ideal is the identity.
    For a fixed nonnegative, nonzero smooth annular weight $W$,
#[#set math.equation(numbering: n => "(2.8)")
 $ sum_(p in 1_T) W \( q_p \/ P \) q_p^(- 5 \/ 6) tilde.op frac(P^(1 \/ 6), \| T \| log P) integral_0^oo W \( y \)
   y^(- 5 \/ 6) thin d y . $ <eq:ray-prime-normalizer>]

 Deleting any further fixed finite set of primes does not change this asymptotic.
   Its lower threshold may depend on all the fixed data.]
] <lem:ray-prime-normalizer>

#proof[
  For the fixed abelian extension of $F$ corresponding to $T$, the prime ideal theorem in a fixed Frobenius class gives
  $ pi_(1_T) \( x \) := \# { p in 1_T : q_p lt.eq x } tilde.op frac("Li" \( x \), \| T \|) . $
  This is the fixed-extension consequence of Chebotarev in [27] Theorem 1.1;
    the extension and its conductor are fixed as $x arrow.r oo$.
    If $"supp" W subset \[ a \, b \] subset \( 0 \, oo \)$, the error $o \( x \/ log x \)$ is uniform for $a P
    lt.eq x lt.eq b P$ as $P arrow.r oo$. Stieltjes integration by parts therefore changes the left side of
    Equation (2.8) by $o \( P^(1 \/ 6) \/ log P \)$ when $d pi_(1_T) \( x \)$ is replaced by $d
    x \/ \( \| T \| log x \)$. The resulting integral is
  $ frac(P^(1 \/ 6), \| T \| log P) integral_a^b W \( y \) y^(- 5 \/ 6) frac(log P, log \( P y \)) thin d y . $
  The last ratio tends uniformly to one. This proves the formula and its positivity.
    A fixed finite set is eventually outside the annular window.
    No error exponent uniform in the ray conductor is used. ◻
]

===== 2.2.3 Full finite Fourier correlations <sec:finite-correlations>

We now allow arbitrary prime powers in a modulus. The two-argument notation $G \( a \, k \)$ below is a finite
  Fourier sum; it is distinct from the one-argument finite-ray function $G \( a \)$ of Lemma 8. Define

#[#set math.equation(numbering: n => "(2.9)")
 $ G \( a \, k \) = q_a^(- 1 \/ 2) sum_(x med mod med a) chi_a \( x \) e \( k x \/ a \) \, wide G \( 1 \, k \) =
   1 . $ <old-eq:2.4>]

All characters in this subsection have the zero extensions specified in Section 2, and we put $v_p \( 0 \) = + oo$.

#thm([Lemma 2.2.])[
  (Prime-power Fourier sums).  #emph[For $P = q_p$ and every integer $a gt.eq 1$,
#[#set math.equation(numbering: n => "(2.10)")
 $ \| G \( p^a \, k \) \| & = P^(\( a - 1 \) \/ 2) 1_(v_p \( k \) = a - 1) \, &  & 6 divides.not a \,\
G \( p^a \, k \) & = P^(a \/ 2) 1_(p^a divides k) - P^(a \/ 2 - 1) 1_(p^(a - 1) divides k) \, &  & 6 divides a .
  $ <eq:gauss-local>]

]
] <lem:prime-power-fourier>

#proof[
  Write a residue modulo $p^a$ as $x_0 + p y$, with $x_0 med mod med p$ and $y med mod med p^(a - 1)$.
    The sum over $y$ is zero unless $p^(a - 1) divides k$, and equals $P^(a - 1)$ otherwise.
    In the latter case write $k = p^(a - 1) k_0$. The remaining normalized sum is
  $ P^(a \/ 2 - 1) sum_(x_0 med mod med p) chi_p \( x_0 \)^a e \( k_0 x_0 \/ p \) . $
  If $6 divides.not a$, its inner sum vanishes when $p divides k_0$ and otherwise has absolute value $sqrt(P)$.
    If $6 divides a$, the inner sum is the sum of the additive character over the units,
    namely $P 1_(p divides k_0) - 1$. These are exactly the two cases in the statement. ◻
]

#thm([Lemma 2.3.])[
  (Full correlation and common factors).  #emph[For primary moduli $u \, v$ outside $S$ and $j in cal(O)$, put
#[#set math.equation(numbering: n => "(2.11)")
 $ F \( u \, v \; j \) = sum_(x med mod med u \, med y med mod med v\
v x - u y equiv j med \( mod med u v \)) chi_u \( x \) overline(chi_v \( y \)) . $ <old-eq:2.11>]

 Then
$ F \( u \, v \; j \) = 1 / sqrt(q_u q_v) sum_(h med mod med u v) G \( u \, h \) overline(G \( v \, h \))
  e \( - j h \/ \( u v \) \) . $

 At zero frequency, $F \( u \, v \; 0 \) = 0$ unless $u = v$, and $F \( u \, u \; 0 \) = phi \( u \)$,
   where $phi \( u \)$ is the number of units modulo $u$.]
  #emph[Let $C = \( u \, v \)$ and write $u = C n_1$, $v = C n_2$, where $\( n_1 \, n_2 \) = 1$.
    Then $F \( u \, v \; j \) = 0$ unless $C divides j$. For $j = C k$,
#[#set math.equation(numbering: n => "(2.12)")
 $ F \( C n_1 \, C n_2 \; C k \) & = chi_(n_1) \( k \) overline(chi_(n_2) \( - k \)) cal(R) \( n_1 \, n_2 \)
   L_C \( n_1 \, n_2 \; k \) \,\
L_C \( n_1 \, n_2 \; k \) & = sum_(x \, y med mod med C\
n_2 x - n_1 y equiv k med \( mod med C \)) chi_C \( x \) overline(chi_C \( y \)) =
  product_(p^c parallel C) L_(p^c) . $ <eq:correlation-lift>]

 For $P = q_p$ and $p divides.not n_1 n_2$, the local factor is
#[#set math.equation(numbering: n => "(2.13)")
 $ L_(p^c) =
   P^(c - 1) chi_p \( n_1 \/ n_2 \)^c
   cases(delim: "{", P - 1 \, & p divides k \,, - 1 \, & p divides.not k \, med 6 divides.not c \,, P - 2 \, & p
   divides.not k \, med 6 divides c .) $ <eq:correlation-local>]

 If $p$ divides exactly one of $n_1 \, n_2$, the local factor is $P^(c - 1) \( P - 1 \) 1_(6 divides c)
   1_(p divides.not k)$. On the genuine residual locus $\( n_1 \, n_2 \) = 1$,
   $L_C$ means the congruence sum in Equation (2.12). When $L_C$ is used on all residual pairs,
   it instead denotes the artificial product extension of these local formulas,
   with the local value defined to be zero if $p divides \( n_1 \, n_2 \)$.
   Outside the genuine residual locus this is not the original congruence sum.
   The genuine function and this artificial extension both satisfy $\| L_C \| lt.eq q_C$,
   and the extension is periodic modulo $"rad" C$ in each residual column.]
] <lem:full-correlation>

#proof[
  Expanding both Gauss sums in the displayed Fourier transform leaves
  $ frac(1, q_u q_v) sum_(x med mod med u \, y med mod med v) chi_u \( x \) overline(chi_v \( y \))
    sum_(h med mod med u v) e #scale(x: 120%, y: 120%)[\(] h \( v x - u y - j \) \/ \( u v \)
    #scale(x: 120%, y: 120%)[\)] . $
  Additive orthogonality makes the inner sum $q_u q_v$ when the congruence holds and zero otherwise.
    If $j = 0$ and a summand is nonzero, $x$ and $y$ are units modulo $u$ and $v$.
    Reducing the congruence modulo $u$ gives $u divides v$, and reducing modulo $v$ gives $v divides u$.
    Since the generators are primary, $u = v$. The congruence then says $x = y med mod med
    u$ and gives $phi \( u \)$. This argument uses the zero masks also when a local character power is principal.
  The divisibility by $C$ is immediate. After division by $C$, the congruence for $j = C k$ is
  $ n_2 x - n_1 y equiv k med \( mod med C n_1 n_2 \) . $
  Reduction modulo $n_1$ and $n_2$ gives, with zero values retained,
  $ chi_(n_1) \( x \) = chi_(n_1) \( k \) overline(chi_(n_1) \( n_2 \)) \, wide overline(chi_(n_2) \( y \)) =
    overline(chi_(n_2) \( - k \)) chi_(n_2) \( n_1 \) . $
  The product of the two unit factors is $cal(R) \( n_1 \, n_2 \)$.
    It remains to identify the multiplicity of lifts of the congruence modulo $C$.
    This can be checked at each prime. If $c = v_p \( C \)$ and neither residual modulus contains $p$,
    there is no additional lift. If, say, $d = v_p \( n_1 \) > 0$ and $p divides.not n_2$, then $y med mod med
    p^c$ is free and the congruence uniquely determines $x med mod med p^(c + d)$ from it.
    Reduction modulo $p^c$ is exactly the common congruence in Equation (2.12).
    The case $p divides n_2$ is symmetric, and this argument includes $c = 0$.
    The Chinese remainder theorem thus gives a bijection with the common solutions used in $L_C$,
    even when $C$ meets one residual modulus.
  For the local calculation put $k_p = cal(O) \/ \( p \)$ and $A = chi_p^c$,
    a character of $k_p^times$ extended by zero. Since at least one of $n_1 \, n_2$ is a unit at $p$,
    each solution modulo $p$ has $P^(c - 1)$ lifts modulo $p^c$.
    If both are units and $p divides k$, the unit variables are proportional and the field sum is
    $A \( n_1 \/ n_2 \) \( P - 1 \)$. If $p divides.not n_1 n_2 k$,
    put $y = \( k \/ n_1 \) t$ and $x = \( k \/ n_2 \) \( 1 + t \)$. The field sum becomes
  $ A \( n_1 \/ n_2 \) sum_(t eq.not 0 \, - 1) A \( \( 1 + t \) \/ t \) =
    A \( n_1 \/ n_2 \) sum_(z in k_p^times \\ { 1 }) A \( z \) . $
  It is $- A \( n_1 \/ n_2 \)$ for nonprincipal $A$ and $\( P - 2 \) A \( n_1 \/ n_2 \)$ for principal $A$.
    If $p divides n_1$ and $p divides.not n_2$, the field equation forces $x = k \/ n_2$.
    For $p divides k$ its character is zero. For $p divides.not
    k$ the remaining sum over $y$ is zero unless $A$ is principal, in which case it is $P - 1$.
    The other case is symmetric. This proves all local formulas on the genuine residual locus.
    Extending them by the stipulated zero when both residuals meet $p$ gives functions of the residual columns
    modulo $p$, each of absolute value at most $P^c$. Their product proves the final assertions for the artificial
    extension as well; no congruence-sum identity is asserted at a newly added pair. ◻
]

For some applications it is preferable to remove all primes common to the two full moduli,
  with their entire multiplicities. The next form leaves one common row character on each remaining product.

#thm([Lemma 2.4.])[
  (Complete-common-support correlation).  #emph[Suppose $u = D a$, $v = E b$ are primary and outside $S$,
    with $\( a \, b \) = 1$ and $\( a b \, D E \) = 1$. Then, for every $j in cal(O)$,
#[#set math.equation(numbering: n => "(2.14)")
 $ F \( D a \, E b \; j \) =  & F \( D \, E \; j \) cal(R) \( a \, E \) overline(cal(R) \( b \, D \))
   cal(R) \( a \, b \)\
 & #h(8mm)  dot.op chi_a \( j \) overline(chi_b \( - j \)) . $ <eq:correlation-child-character>]

 The moduli $D \, E$ may contain any prime powers, including shared auxiliary prime factors.]
] <lem:complete-support-correlation>

#proof[
  At primes of $a$ and $b$, solving the congruence in Equation (2.11) gives respectively $chi_a \( j \)
    overline(chi_a \( E b \))$ and $overline(chi_b \( - j \)) chi_b \( D a \)$.
    These statements remain valid when a character of $j$ is zero; only the displayed unit factors are inverted.
    At primes of $D E$ change variables $x' = b x med mod med D$, $y' = a y med mod med E$.
    The congruence becomes $E x' - D y' equiv j med \( mod med D E \)$ and its character factor changes by
    $overline(chi_D \( b \)) chi_E \( a \)$. The remaining unit factor is
  $ frac(chi_E \( a \), chi_a \( E \)) frac(chi_b \( D \), chi_D \( b \)) frac(chi_b \( a \), chi_a \( b \)) =
    cal(R) \( a \, E \) overline(cal(R) \( b \, D \)) cal(R) \( a \, b \) . $
  All denominators here are symbols of units by the hypotheses.
    The Chinese remainder theorem and the definition of $F \( D \, E \; j \)$ complete the proof. ◻
]

The hypotheses of Equation (2.14) are not removed by extending $cal(R)$ as a bicharacter.
  To state exactly the extension used with Möbius inversion, fix $D \, E \,
  j$ and define $tilde(F)_(D \, E) \( a \, b \; j \)$ to be the right side of that equation for all primary $a \,
  b$ outside $S$ with $\( a b \, D E \) = 1$, retaining its zero symbols even when $\( a \, b \) > 1$.
  For any finite coefficient array $c \( a \, b \)$ on this locus,

$ sum_(\( a \, b \) = 1) c \( a \, b \) F \( D a \, E b \; j \) =
  sum_(a \, b) c \( a \, b \) tilde(F)_(D \, E) \( a \, b \; j \) sum_(t divides a \, med t divides b) mu \( t \) . $

Indeed the full inner divisor sum is $1_(\( a \, b \) = 1)$,
  and the two correlation expressions agree on that locus. The value of $tilde(F)_(D \, E)$ elsewhere is
  artificial, not a formula for $F \( D a \, E b \; j \)$. In particular the full divisor sum must be inserted
  before a factorwise estimate separates the two residual columns;
  extra common primes introduced by an individual divisor term do not become primes of the genuine $D \, E$ correlation.

==== 2.3 Marked completion and reflected row energy <sec:marked>

The compensated low estimate and the inverse moment use the same marked completion.
  We establish its reflected mean square here. The low estimate will use the case with no additional squarefree
  label or puncture; the more general form allows the labels and masks introduced by the inverse moment’s Poisson
  transformations.

We retain the notation of Section 2. In particular, ideal variables have their multiplicative primary generators,
  the fixed excluded set $S$ contains the primes over $6$, and every power of a residue symbol is zero on
  nonunits, even when its exponent is divisible by six. Element rows need not be squarefree or prime to $S$.

===== 2.3.1 Completed sums and product-form marks <completed-sums-and-product-form-marks>

Fix a finite index set $I$ and pairwise disjoint lists $cal(P)_i$ of primes outside $S$,
  with $q_p asymp Z^(z_i)$ for $p in cal(P)_i$. The lists and their bounded individual coefficients $a_i \( p \)$
  are independent of the current row and squarefree label. Their nominal lengths $z_i$ lie in fixed bounded ranges.

Here and below a #emph[fixed puncture] means a function

$ rho \( n \) = 1_(\( n \, frak(r)_rho \) = 1) \, $

where $frak(r)_rho$ is squarefree and is required to be fixed only within the indicated current row and label
  sums. A bounded product of such functions has this form with $frak(r)_rho$ equal to the radical of the product
  of their moduli. The norm of this radical will be bounded explicitly.
  It may depend on previously fixed outer ideals, but not on either current averaging variable.

Let $f$ be a squarefree ideal outside $S$, with $q_f asymp Z^V$ for a nonnegative $V$ in a fixed bounded range,
  and let $k in cal(O)$. For a fixed multiplicative finite ray character $nu$ whose full zero-extended defining
  modulus has prime support in $S$, define $a \( n \)$ only for squarefree primary $n$ outside $S$,
  and define $Psi_k \( n \)$ for every primary $n$ outside $S$ by

$ a \( n \) = macron(alpha) \( n \) gamma_2 \( n \) nu \( n \) rho \( n \) \, wide Psi_k \( n \) =
  nu \( n \) rho \( n \) chi_n \( k \) chi_n \( f \)^4 . $

The finite character, puncture, and all slot lists are independent of $k \, f$.
  A fixed function on a finite ray group is always expanded into genuine group characters before this definition
  is used; thus $nu$ is multiplicative even when an earlier step produced a finite linear combination of characters.

For a subcollection $I' subset I$ of disjoint prime lists with bounded coefficients, define its mark by

#[#set math.equation(numbering: n => "(2.15)")
 $ frak(d)_(I') \( A \) = sum_(\( p_i \) in product_(i in I') cal(P)_i) product_(i in I') a_i \( p_i \)
   1_(p_i divides A) . $ <old-eq:4.2>]

We omit $I'$ from the notation when it is understood. Because the lists are disjoint,
  a tuple has a squarefree product. For every fixed $epsilon.alt > 0$,
  the number of tuples dividing $A$ is $O_epsilon.alt \( q_A^epsilon.alt \)$.
  The coefficient in Equation (2.15) is a product of functions of the individual primes; this property,
  not merely the pointwise divisor bound, will be used when some slots are assigned to an extracted factor.

For a smooth annular $W$, put $V_(*) \( y \) = y^(1 \/ 2) W \( y \)$ and define the completed marked sum

#[#set math.equation(numbering: n => "(2.16)")
 $ cal(T)_(frak(d)) \( X \; k \) = sum_(n med upright("sf")\
b)
  frac(macron(alpha) \( n \) gamma_2 \( n \) Psi_k \( n \) thin macron(alpha) \( b \)^3 Psi_k \( b \)^3, sqrt(q_n)
  thin q_b) frak(d) \( n b^3 \) V_(*) \( q_n q_b^3 \/ X \) . $ <eq:marked-completion>]

Both primal ideals avoid $S$; they may share primes. The mark belongs to the whole index $n b^3$.
  With $frak(d) = 1$, this is the Mellin completion on the left of Equation (1.17).
  The Gaussian Mellin test from that Equation is also permitted when only the completed estimate is used.

For the reflection formula we use Lemma 16, only for a nonzero row.
  Write $k = u k_S k_(upright("good"))$ as in that Lemma. After fixing the unit, the $S$-valuations modulo six,
  and the good row ray class, its literal sector character is

$ Psi_0^(\[ k \]) \( A \) =
  cases(delim: "{", nu \( A \) chi_A \( u k_S \) cal(R) \( A \, k_(upright("good")) \) \, & A equiv 1 med \( mod
  med 3 \) \, med \( A \, S \) = 1 \,, 0 \, & upright("otherwise") .) $

The zero branch is evaluated before either character. The Lemma supplies one finite family and hence one common
  $L$, with prime support $S$, before the good primes vary.
  Write $M_(upright("ref")) = lambda^12 L^4$; the full reflection sector modulus is $M_(upright("ref"))^2$.
  All good primes of $k \, f \, frak(r)_rho$ remain in the local prime set,
  with their exponents combined modulo six and every zero retained.
  The fourth power at $f$ has no extra reciprocity sign, since $cal(R) \( A \, f \)^4 = 1$.
  The puncture is the product of the local zero powers at its good primes.
  Thus the local presentation gives exactly $Psi_k \( n \) Psi_k \( b \)^3$ on the stated primal support,
  including at shared good primes; no moving good prime enters $L$.

===== 2.3.2 Whole-index marked reflection <par:reflection-marks>

The next corollary adds the product-form marks to the exact reflection in Part I. Its branch data are important:
  an inactive marked prime is absent from the conductor, so the marked transform is not obtained by multiplying
  one fixed-conductor dual sum by independent local factors.

#thm([Corollary 2.5.])[
  (Completed reflection with whole-index marks).  #emph[Fix an invocation of Proposition 15,
    with base local prime set $cal(P)_0$, powers $j_p$, fixed multiplier $phi.alt$, and test $V$.
    Put $M_(upright("ref")) = lambda^12 L^4$ for this invocation.
    Let $cal(Q)$ be a finite set of distinct good primes disjoint from $cal(P)_0$.
    In the direct completed coefficient sum, insert the factor $product_(q in cal(Q)) 1_(q divides n b^3)$;
    denote this sum by $cal(T)_(cal(Q)) \( X \; Psi \, V \)$.
    It has the same normalization as Equation (2.16), with $Psi_k \, V_(*)$ replaced by $Psi \, V$.
    The primal squarefree and cube ideals may share primes.]
  #emph[There is an exact finite expansion
#[#set math.equation(numbering: n => "(2.17)")
 $ cal(T)_(cal(Q)) \( X \; Psi \, V \) = sum_(cal(B)) zeta_(cal(Q)) sum_(0 eq.not mu in lambda^(- 4) cal(O)) &
   frac(d \( mu \) alpha \( mu \) theta.alt \( lambda^4 mu \), sqrt(q_mu)) product_(p in cal(A)_0)
   B_p \( lambda^4 mu \)\
 & dot.op product_(q in cal(A)_(cal(Q))) q_q^(- 1 \/ 2) chi_q \( lambda^4 mu \)^(- 2) V^sharp #h(-0.16667em)
   (frac(q_mu X, q_c^2)) . $ <eq:marked-reflection>]

 Here a branch $cal(B)$ specifies $h_0 med mod med L$, the base active and inactive sets $cal(A)_0 \, cal(I)_0$,
   and a partition $cal(Q) = cal(A)_(cal(Q)) union.sq cal(I)_(cal(Q))$.
   All base primes with $j_p eq.not 0$ are active. Put
$ r = product_(p in cal(A)_0 union cal(A)_(cal(Q))) p \, wide c = c_F \( h_0 \) r . $

 The base factors $B_p$ and the canonical functions $d \, theta.alt$ are those of Proposition 15 for this active
   radical. With every $sigma_p \, epsilon.alt_p \, omega_(p \, j)$ computed using this branch’s whole $c$,
   the scalar is
#[#set math.equation(numbering: n => "(2.18)")
 $ zeta_(cal(Q)) =  & - i / 81 macron(alpha) \( c \)^2 hat(phi.alt) \( h_0 \) macron(kappa)_F
   product_(p in cal(I)_0) \( 1 - q_p^(- 1) \) product_(q in cal(I)_(cal(Q))) q_q^(- 1)\
 & dot.op product_(p in cal(A)_0) chi_p \( sigma_p \)^(- 2) omega_(p \, j_p) product_(q in cal(A)_(cal(Q)))
   chi_q \( sigma_q \)^(- 2) \( - omega_(q \, 0) \) . $ <eq:marked-reflection-phase>]

 In particular $\| zeta_(cal(Q)) \| lt.eq 1 \/ 81$. The functions $d \,
   theta.alt$ and the scalar $kappa_F$ have the canonical dependence on $h_0$ and $r med mod med
   M_(upright("ref"))^2$ from Part I. Every dual sum is absolutely convergent and has the same full source support
   as there. If a marked prime instead belongs to the base local set,
   the corresponding primal term is identically zero and is removed before this formula is used.]
] <cor:marked-reflection>

#proof[
  For every good prime and every $A in cal(O)$, the zero convention gives the pointwise identity
    $1_(q divides A) = 1 - chi_q \( A \)^0$. Expand its product over $cal(Q)$,
    and apply Proposition 15 to each of the resulting finitely many completed sums.
    For a fixed $h_0$ and active radical, the Proposition uses the same $c_F \, c \, d \, theta.alt \, kappa_F$,
    other local phases, and kernel whether an absent prime is omitted from the local set or included with exponent
    zero in its inactive branch. Thus the two inactive contributions at $q$ combine with coefficient
    $1 - \( 1 - q_q^(- 1) \) = q_q^(- 1)$. The active contribution comes only from the subtracted zero-mask
    transform and has local factor $q_q^(- 1 \/ 2) chi_q \( lambda^4 mu \)^(- 2)$ and scalar $- omega_(q \, 0) =
    tau_(q \, 2)^(+) chi_q \( epsilon.alt_q \)^(- 2)$. Collecting these choices at all marked primes proves
    Equations (2.17) and (2.18). The inactive prime is absent from $r$,
    hence from that branch’s conductor and kernel scale. This is finite inclusion-exclusion between compatible
    branches, not a new theta identity.
  If a marked prime is a base local prime, the mark forces it to divide $n b^3$,
    while the zero-extended base factor at that prime then vanishes, including for exponent zero.
    This proves the last assertion without any division of a zero symbol.
    It also covers the case where the primal squarefree and cube ideals share the marked prime. ◻
]

For the row norm, the phase consequence of this corollary must be stated with its exact scope.
  For distinct active good primes $p \, q$, Equation (1.33) and cubic reciprocity give

#[#set math.equation(numbering: n => "(2.19)")
 $ chi_p \( q \)^(2 j_p + 2) chi_q \( p \)^(2 j_q + 2) = (q / p)_3^(j_p + j_q + 2) . $ <eq:reflection-pair-phase>]

For an active mark the exponent is $j_q = 0$; its changed sign occurs only in its one-prime scalar.
  A residual row prime with $j_p = 1$ and a marked prime therefore have pair factor $\( q \/ p \)_3^3 = 1$.
  A $j_p = 1$ row prime and a moving $j_q = 4$ prime would instead leave $\( q \/ p \)_3$, which need not be one.
  All nonresidual base primes, especially every $j = 4$ prime, are therefore fixed before the inner row norm.

Write $R$ for the product of the residual $j = 1$ row primes and $P$ for the product of active marked primes.
  Primal row-mark collisions are removed first by the last assertion of the corollary,
  and are subsequently represented by $1_(\( P \, R \) = 1)$.
  If the frozen active base product is $F_(upright("act"))$, then $r = F_(upright("act")) R P$.
  Fix separate classes of $R$ and $P$ modulo the full $M_(upright("ref"))^2$,
  not merely their product and not merely their smaller reciprocity classes.
  This fixes the cusp data without adding a pair-dependent restriction.
  Row-row phases are row scalars, mark-mark phases are tuple scalars,
  and their interactions with frozen primes depend on only one of those sets.
  The angular conductor scalar factors in the same way.

After fixing the dual unit, its $lambda$-valuation, and extracted frozen factors,
  write the remaining dual part as $n b^3$. The moving columns are exactly

$ chi_R \( n b^3 \)^3 = chi_R \( n b \)^3 \, wide chi_P \( n b^3 \)^(- 2) = chi_P \( n \)^(- 2) 1_(\( P \, b \) = 1) . $

These identities include every zero. A zero caused by a row or a tuple meeting an extracted frozen factor is a
  fixed restriction on that row or tuple. The source coefficient, fixed additive factor,
  and all frozen local column factors are functions of the full extracted dual index alone.
  Hence, after common smooth separation, the tuple coefficient may be a general bounded function of the tuple
  independent of $R \, n \, b$, while the dual coefficient is independent of $R \, P$.
  The earlier product form of the marks remains required when slots are assigned to extracted factors.

===== 2.3.3 A quadratic–cubic norm estimate <a-quadraticcubic-norm-estimate>

Part I established the required orientation of Goldmakher–Louvel’s quadratic large sieve and proved the
  zero-preserving completed reduction in Lemma 19. We add Heath–Brown’s cubic large sieve:

#[#set math.equation(numbering: n => "(2.20)")
 $ sum_(a equiv 1 med \( 3 \)\
q_a lt.eq U)^(*) lr(|sum_(b equiv 1 med \( 3 \)\
q_b lt.eq V)^(*) c_b (b / a)_3|)^2 lt.double_epsilon.alt \( U V \)^epsilon.alt { U +
  V + \( U V \)^(2 \/ 3) } sum_b^(*) \| c_b \|^2 \, $ <eq:cubic-large-sieve>]

where both stars mean squarefree in $cal(O)$, and the coefficients are arbitrary complex numbers [17] Theorem 2.
  The indices need not have squarefree rational norm, and there is no exclusion of rational prime factors.
  Conjugation and cubic reciprocity allow the opposite orientation.
  In this sieve and Equation (1.41), a fixed restriction on the row set decreases the positive outer sum.
  A fixed restriction on the coefficient support is instead implemented by setting the omitted coefficients to
  zero and applying the same theorem; no column-support monotonicity is claimed.
  This observation does not allow an arbitrary pair-dependent mask;
  the next lemma resolves the two such masks that it uses.

#thm([Lemma 2.6.])[
  (A quadratic–cubic norm bound).  #emph[Let $K \, N \, B \, L gt.eq 1$.
    Let $k \, n \, P$ be squarefree primary ideals with $q_k lt.double K$, $q_n asymp N$, and $q_P asymp L$;
    let $b$ be any primary ideal with $q_b asymp B$. The ideals $k \, P$ avoid the current excluded set $S$;
    additional fixed exclusions are allowed. The source ideals $n \,
    b$ may contain primes of $S$ other than $lambda$. Let $a \( P \)$ and $beta \( n \, b \)$ satisfy
$ \| a \( P \) \| lt.eq 1 \, wide \| beta \( n \, b \) \| lt.eq 1 . $

 Here $a$ is independent of $k \, n \, b$, and $beta$ is independent of $k \, P$. Then
#[#set math.equation(numbering: n => "(2.21)")
 $ & sum_k
   lr(|sum_P frac(a \( P \), sqrt(q_P)) 1_(\( P \, k \) = 1) sum_(n \, b) beta \( n \, b \) chi_k \( n b \)^3
   chi_P \( n \)^(- 2) 1_(\( P \, b \) = 1)|)^2\
 & wide lt.double_epsilon.alt \( K N B L \)^epsilon.alt \( K + N B \) B { N +
   L + \( N L \)^(2 \/ 3) } . $ <old-eq:4.6b>]

 Fixed restrictions on the $k$-set and fixed restrictions on the $\( n \, b \)$- or $P$-supports are allowed,
   as are fixed ray sectors. All such restrictions must preserve the two coefficient-independence conditions
   above. Divisor-bounded multiplicities may be included if they preserve those conditions;
   otherwise they must first be removed by the divisor Cauchy inequalities in the proof.]
] <lem:hybrid-energy>

#proof[
  Write $cal(H)$ for the left side of Equation (2.21). First remove the complete moving row-mark mask:
  $ 1_(\( P \, k \) = 1) = sum_(D divides \( P \, k \)) mu \( D \) . $
  For each row the number of such divisors is at most $d_(cal(O)) \( k \)$.
    Rowwise divisor Cauchy, followed by the positive sum over rows,
    therefore costs a permitted factor $\( K N B L \)^epsilon.alt$.
    In a fixed $D$-summand write $P = D P'$ and $k = D k'$. Squarefreeness gives the fixed restrictions
    $\( D \, P' \) = \( D \, k' \) = 1$. Define
  $ a_D \( P' \) & = a \( D P' \) 1_(\( D \, P' \) = 1) \,\
beta_D \( n \, b \) & = beta \( n \, b \) chi_D \( n b \)^3 chi_D \( n \)^(- 2) 1_(\( D \, b \) = 1) . $
  All these factors retain their zeros and $\| beta_D \| lt.eq 1$.
    Factoring $q_P^(- 1 \/ 2) = q_D^(- 1 \/ 2) q_(P')^(- 1 \/ 2)$ gives
  #[#set math.equation(numbering: n => "(2.22)")
   $ cal(H) lt.double \( K N B L \)^epsilon.alt sum_D 1 / q_D sum_(k')
     lr(|sum_(n \, b) beta_D \( n \, b \) chi_(k') \( n b \)^3 sum_(P') frac(a_D \( P' \), sqrt(q_(P')))
     chi_(P') \( n \)^(- 2) 1_(\( P' \, b \) = 1)|)^2 . $ <eq:hybrid-mark-mask-reduction>]
  Here $q_(k') lt.double K \/ q_D$, $q_(P') asymp L \/ q_D$, and all inherited fixed restrictions are retained.
    The outer $D$’s are the squarefree good divisors allowed by the split, so $q_D lt.double min \( K \, L \)$.
    In particular, no $\( P' \, k' \)$ mask is reinstated inside an individual $D$-summand.
    Its cancellation belongs to the complete Möbius sum already bounded by rowwise Cauchy.
  For fixed $D$, the product of $beta_D \( n \, b \)$ and the inner $P'$-sum is an arbitrary complex coefficient
    independent of $k'$. Apply Equation (1.42) with row length $K \/ q_D$. Use its notation
  $ b = g t^2 \, wide c = \( n \, g \) \, wide n = c m \, wide g = c h \, wide q_c asymp C \, quad q_g asymp G \,
    quad q_t asymp T \, $
  so $B asymp G T^2$, and write $c = r c'$ for its complete $c$-mask divisor.
    The ideals $c \, m \, h$ are pairwise coprime and squarefree; no coprimality between $g$ and $t$ is imposed.
    The cited reduction already includes the natural $k'$-$t$ restriction and the complete Möbius expansion of the
    $k'$-$c$ mask. It does not reinstate a mask between the remaining row and $c'$.
  For one $C \, G \, T$ block its positive output, inserted in Equation (2.22), is at most
  #[#set math.equation(numbering: n => "(2.23)")
   $ \( K N B L \)^epsilon.alt sum_D 1 / q_D T sum_(q_t asymp T) sum_(r med upright("sf") \, med \( r \, S \) = 1\
q_r lt.double min \( K \/ q_D \, C \)) & {frac(K, q_D q_r) + frac(N G, C^2)} C /
  q_r sum_(c' \, m \, h) \| beta_D \( r c' m \, r c' h t^2 \) \|^2\
 & quad
   dot.op
   lr(|sum_(P') frac(a_(D \, r) \( P' \), sqrt(q_(P'))) chi_(P') \( c' m \)^(- 2) 1_(\( P' \, h t \) = 1)|)^2 \,
   $ <eq:hybrid-after-quadratic-reduction>]
  where the positive $c' \, m \, h$-sum keeps the original support and
  $ a_(D \, r) \( P' \) = a_D \( P' \) chi_(P') \( r \)^(- 2) . $
  The factorization used here is, including all zeros,
  $ chi_(P') \( r c' m \)^(- 2) 1_(\( P' \, r c' h t^2 \) = 1) =
    chi_(P') \( r \)^(- 2) chi_(P') \( c' m \)^(- 2) 1_(\( P' \, h t \) = 1) . $
  The character already supplies the missing zeros at $r \, c'$, and $m$.
    Thus the $r$-factor is tuple-only, including its zero when $\( P' \, r \) eq.not 1$.
    The fixed $D$-phases remain inside $beta_D$ until this positive bound.
    The quadratic reduction has already separated the finitely many squarefree $S$-parts of $m \,
    h$ before sieving their good product; $m \, h$ in Equation (2.23) are the original ideals.
  We may now discard $\| beta_D \|^2 lt.eq 1$. For fixed $h \, t \, D \, r$,
    the $P'$-coefficients are independent of $j = c' m$, and ideal counting gives
  $ sum_(P') frac(\| a_(D \, r) \( P' \) \|^2 thin 1_(\( P' \, h t \) = 1), q_(P'))
    lt.double_epsilon.alt \( K N B L \)^epsilon.alt . $
  The product $j = c' m = n \/ r$ is squarefree primary and has norm $O \( N \/ q_r \)$.
    It may contain a permitted prime of $S$ other than $lambda$,
    since only the quadratic column was stripped of its fixed $S$-part.
    Grouping $c' \, m$ by $j$ costs at most a divisor factor. Enlarge only this positive squarefree $j$-range.
    Cubic reciprocity, conjugation, and Equation (2.20), followed by the $O \( G \/ C \)$ choices of $h$, give,
    on $q_D asymp D_0 \, med q_r asymp r_0$,
  #[#set math.equation(numbering: n => "(2.24)")
   $ \( K N B L \)^epsilon.alt G / C {N / r_0 + L / D_0 + (frac(N L, r_0 D_0))^(2 \/ 3)} . $ <old-eq:4.6c>]
  The fixed mask at $h t$ is a coefficient restriction in this cubic sieve, not a row-dependent mask.
  The reduction supplies $T sum_t$, with $O \( T \)$ possible $t$, and the factor $C \/ q_r$.
    Together with the $h$-count, these contribute
  $ T^2 \( C \/ r_0 \) \( G \/ C \) asymp B \/ r_0 . $
  There are $O \( r_0 \)$ possible $r$ in its dyad, while the sum of $q_D^(- 1)$ over its dyad is $O \( 1 \)$,
    up to a permitted small power. Both sieve factors increase when $D_0 \, r_0$ are replaced by $1$,
    and $N G \/ C^2 lt.double N B$. Summing the logarithmically many dyads proves Equation (2.21).
    Subunit quotient ranges are empty, and bounded ranges are included by changing the fixed annular constants.
    This argument has introduced neither a $\( g \, t \) = 1$ condition nor a new pair-dependent mask. ◻
]

===== 2.3.4 The reflected energy bound <the-reflected-energy-bound>

We next quantify the reflection of Equation (2.16). The following description also specifies the dyadic
  contribution used in the statement.

======= 2.3.4.1 Reflected block data. <par:reflected-energy-data>

Fix $f \, rho$ and put $Q = log_Z q_(frak(r)_rho)$. For an element row $0 < q_k lt.double Z^M$,
  define the maximal powerful part of its ideal by

$ k_(upright("pow")) = product_(v_p \( k \) gt.eq 2) p^(v_p \( k \)) . $

Split the valuation-one primes into the squarefree product $k_(upright("sup"))$ supported on $S union
  "supp" \( f frak(r)_rho \)$ and the squarefree product $k_(upright("res"))$ outside that set.
  These three prime supports are pairwise disjoint, and their product is the ideal of $k$.
  A powerful ideal here means that every positive prime valuation is at least two. Fix the unit of $k$.
  Insert smooth dyadic partitions in

$ q_(k_(upright("pow"))) asymp Z^O \, wide q_(k_(upright("res"))) asymp Z^H . $

Choose these ideal centers nonnegative, with center zero for the unit dyad.
  In particular, an actual annular factor $chi_(upright("row")) \( q_(k_(upright("res"))) \/ Z^H \)$ is kept in
  the row sum. The bounded dyad includes $k_(upright("res")) = 1$.
  Choose fixed constants $C_k \, C_O \, C_H gt.eq 1$, from these supports, such that

$ q_k lt.eq C_k Z^M \, wide q_(k_(upright("pow"))) gt.eq Z^O \/ C_O \, wide q_(k_(upright("res"))) gt.eq Z^H \/ C_H . $

Since $q_(k_(upright("sup"))) gt.eq 1$, the general norm inequality Equation (1.50) gives here

$ H lt.eq M - O + frac(log C_(upright("res")), log Z) \, wide C_(upright("res")) = C_H C_k C_O . $

The inequality need not be an equality, because $k_(upright("sup"))$ may have positive norm length.

Freeze the actual ideals $k_(upright("pow")) \, k_(upright("sup"))$.
  At every prime outside $S$, combine the local exponents of $rho \( n \) chi_n \( k \)
  chi_n \( f \)^4$ modulo six, always retaining the zero extension.
  The primes of $k_(upright("res"))$ have exponent $j = 1$.
  All other such primes, including every non-slot prime of exponent $j = 4$, are now fixed.
  In the reflection formula call a prime active when it occurs in $c$.
  For a fixed choice of the active zero-exponent primes and a fixed splitting of each $j = 4$ Ramanujan factor, let:

#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[$A_0$
], table.cell(rowspan: 1, colspan: 1)[be the log-norm of all active non-slot primes outside $k_(upright("res"))$,
],
  table.cell(rowspan: 1, colspan: 1)[$S_0$
], table.cell(rowspan: 1, colspan: 1)[be the log-norm of the small Ramanujan terms and active zero-mask terms
  among them,
],
  table.cell(rowspan: 1, colspan: 1)[$N_0$
], table.cell(rowspan: 1, colspan: 1)[be the log-norm of the $j =
  4$ divisibility terms assigned to the squarefree dual ideal,
],
  table.cell(rowspan: 1, colspan: 1)[$B_0$
], table.cell(rowspan: 1, colspan: 1)[be the log-norm of the $j =
  4$ divisibility terms assigned to the cube ideal but not the squarefree ideal.
],
)
]

Here a log-norm is $log_Z$ of the norm of the indicated product.
  The assignment uses $1_(p divides n b^3) = 1_(p divides n) + 1_(p divides.not n) 1_(p divides b)$.
  Let $z_a = sum_(i med upright("active")) z_i$ be the sum of their nominal slot lengths.
  The product of the active primes has norm divided by $Z^(z_a)$ in a fixed compact interval,
  including for zero nominal lengths or the empty list. After extracting the forced squarefree and cube primes,
  restrict the remaining dual ideals to

$ q_n asymp Z^v \, wide q_b asymp Z^(ell_b) \, wide q_(lambda^(h_lambda)) = Z^(e_lambda) . $

Choose the ideal centers $v \, ell_b$ nonnegative. These are source dual ideals:
  they retain every prime of $S$ permitted by Equation (1.18); no extra $S$-mask is placed on them.
  Only the displayed $lambda$-valuation support is imposed.
  The unit and the integer $h_lambda gt.eq - 4$ are fixed in this dyad.
  For these choices, denote by $cal(U)_(v \, ell_b \, e_lambda) \( k_(upright("res")) \)$ the right side of
  Equation (2.17), summed with the product-form tuple coefficients,
  with the specified local choices and dual restrictions, and the actual factor
  $chi_(upright("row")) \( q_(k_(upright("res"))) \/ Z^H \)$.
  Active slot tuples are still summed in this definition. This definition is made separately for each fixed
  powerful and supported row part and each sector obtained by fixing separate classes of the residual row product
  and active slot product modulo the full reflection modulus $M_(upright("ref"))^2$.

#thm([Lemma 2.7.])[
  (Reflected energy).  #emph[Retain the reflected block data above.
    Let $Z gt.eq 2$, and suppose their log-lengths range over fixed bounded sets.
    In the completed sum of Equation (2.16), the fixed character, puncture,
    and slot coefficients are independent of $k \, f$, the slot supports are disjoint,
    and the slot coefficients are products as in Equation (2.15).
    The fixed row restrictions after freezing $k_(upright("pow")) \,
    k_(upright("sup"))$ must be independent of the active slots and dual variables,
    apart from the explicit zero mask $1_(\( P \, k_(upright("res")) \) = 1)$.
    Fix a small $tau_(upright("ref")) > 0$, put $X = Z^(N_(*))$.
    Define $T_d$ and call a dyad retained by the following formula:
#[#set math.equation(numbering: n => "(2.25)")
 $ T_d = 2 H + 2 A_0 + 2 z_a - N_(*) - N_0 - 3 B_0 \,\
v + 3 ell_b + e_lambda lt.eq T_d + tau_(upright("ref")) quad upright("for a retained dyad") . $ <old-eq:4.4>]

 Terms with
$ v + 3 ell_b + e_lambda > T_d + tau_(upright("ref")) $

 have arbitrarily small total size, with a fixed polynomial height cost,
   after a sufficiently far kernel contour shift and a threshold for $Z$ depending only on the fixed support
   intervals and $tau_(upright("ref"))$. Every retained dyad has coefficient exponent, per active tuple,
#[#set math.equation(numbering: n => "(2.26)")
 $ - v \/ 2 - ell_b - e_lambda \/ 3 - \( S_0 + B_0 + z_a \) \/ 2 . $ <old-eq:4.5>]

 Define
#[#set math.equation(numbering: n => "(2.27)")
 $ u = min { v \, z_a \, \( v + z_a \) \/ 3 } \, $ <old-eq:4.7>]

 and
#[#set math.equation(numbering: n => "(2.28)")
 $ E_(upright("ref")) =  & O \/ 2 + max \( H \, v + ell_b \) - S_0 - B_0 + z_a - u - ell_b - 2 e_lambda \/ 3\
 & - 1 / 2 \( T_d - v - 3 ell_b - e_lambda \)_(+) . $ <old-eq:4.6>]

 For every $epsilon.alt > 0$, the contribution with fixed $k_(upright("pow")) \, k_(upright("sup"))$ satisfies
$ sum_(k_(upright("res")) med upright("sf")) \| cal(U)_(v \, ell_b \, e_lambda) \( k_(upright("res")) \) \|^2
  lt.double Z^(E_(upright("ref")) - O \/ 2 + epsilon.alt) . $

 Summing the fixed parts in their $O$-dyad and the local choices changes this to
   $O \( Z^(E_(upright("ref")) + epsilon.alt) \)$. The bounds are uniform in the moving ideals and punctures in
   the stated ranges, with finitely many smooth seminorms and a fixed polynomial cost for norm-twist heights.
   The negative value of $e_lambda$, when present, is $O \( 1 \/ log Z \)$.
   In particular, the formula is used only on actual residual-row dyads satisfying Equation (1.50).]
] <lem:reflected-energy>

#proof[
  First remove the inactive slots by triangle inequality in the row Hilbert space.
    At such a slot the absolute coefficient mass is
  $ sum_(p in cal(P)_i) q_p^(- 1) lt.double_epsilon.alt Z^epsilon.alt \, $
  uniformly under any fixed restriction, including for a bounded or zero-length list.
    It therefore suffices to prove a uniform bound with those primes fixed.
    Each such branch has its own conductor, cusp sector, and kernel scale,
    with the inactive prime absent from the conductor. Its earlier collision exclusion is now a fixed row restriction.
  Fix $f \, rho \, k_(upright("pow")) \, k_(upright("sup"))$, the non-slot local choices, $h_0$,
    and separate classes of the residual row product and active slot product modulo the full
    $M_(upright("ref"))^2$. Also fix the unit and ramified exponent of the dual index.
    No non-slot $j = 4$ label remains averaged. We use only the algebraic frozen-base extraction in
    Equation (1.47), inside the original sum over active tuples.
    Corollary 45 and the subsequent phase separation make that extraction simultaneous across the tuples:
    the base coefficient is common to the residual rows and tuples after their separate sectors are fixed,
    while the remaining scalar separates into a row factor and a tuple factor.
    We do not apply the numerical unmarked estimate separately to each tuple.
  The structural extraction gives the common central coefficient
  $ Z^(- v \/ 2 - ell_b - e_lambda \/ 3 - \( S_0 + B_0 \) \/ 2) $
  times normalized inverse-root factors and bounded coefficients.
    Its $N_0$-assignment extracts a forced $j = 4$ prime only from the squarefree dual ideal,
    even if the cube ideal shares it; the entire shared cube part remains in its residual norm and coefficient.
    Its $B_0$-assignment extracts one occurrence from the cube ideal and leaves the factor $q_p^(- 1 \/ 2)$.
    These are statements about the full source support, including the permitted primes of $S$.
    Every active marked column in Equation (2.17) contributes $q_p^(- 1 \/ 2)$.
    Since $q_P \/ Z^(z_a)$ lies in a fixed compact interval, this proves the per-tuple coefficient exponent in
    Equation (2.26).
  We now record the precise marked instance of the common profile.
    Let $F_(upright("act")) \, N_F \, B_F$ be the actual frozen products with log-norms $A_0 \, N_0 \, B_0$.
    Put $R = k_(upright("res"))$, $P = product_(i med upright("active")) p_i$.
    The branch denominator and a supported dual index are
  $ c = c_F F_(upright("act")) R P \, wide mu = u lambda^(h_lambda) N_F n \( B_F b \)^3 . $
  With the fixed block centers, define
  $ y_R = q_R \/ Z^H \, quad y_n = q_n \/ Z^v \, quad y_b = q_b \/ Z^(ell_b) \, quad y_i = q_(p_i) \/ Z^(z_i) \,\
Y =
  frac(q_(lambda^(h_lambda) N_F B_F^3) X Z^v Z^(3 ell_b), q_(c_F F_(upright("act")))^2 Z^(2 H) product_(i med
  upright("active")) Z^(2 z_i)) = q_(c_F)^(- 2) Z^(v + 3 ell_b + e_lambda - T_d) . $
  Multiplicativity gives the exact identity
  #[#set math.equation(numbering: n => "(2.29)")
   $ frac(q_mu X, q_c^2) = Y y_n y_b^3 y_R^(- 2) product_(i med upright("active")) y_i^(- 2) .
     $ <eq:reflection-actual-annuli>]
  It remains true if $N_F$ shares primes with $b$. All frozen factors in $Y$ are their actual products,
    and every moving norm remains a coordinate. The actual row cutoff and the individual dual and slot cutoffs
    therefore place the kernel argument in
  $ \[ C_(upright("ker"))^(- 1) \, C_(upright("ker")) \] Z^(v + 3 ell_b + e_lambda - T_d) $
  for one $C_(upright("ker")) gt.eq 1$ depending only on the fixed support intervals and the common fixed modulus.
    In particular this comparison has not used any shorter row added by positivity.
  Put $D_(upright("ker")) = T_d - v - 3 ell_b - e_lambda$. On this full product of actual annuli, Lemma 17 permits
  $ m_(upright("ker")) = Z^(- \( D_(upright("ker")) \)_(+) \/ 4) $
  to be factored from the entire homogeneous linear row vector,
    at a factor at most $C_(upright("ker"))^(1 \/ 4)$ in its fixed seminorm constants.
    The normalized profile has bounded fixed Euler seminorms;
    no inhomogeneous tuple seminorm is claimed to become small.
    The profile includes the normalized inverse roots from the structural extraction and every other common smooth
    norm window.
  The tail is removed on the genuine, unseparated sums. If $log Z gt.eq
    2 log C_(upright("ker")) \/ tau_(upright("ref"))$, every whole dyad with center excess greater than
    $tau_(upright("ref"))$ has actual kernel argument greater than $Z^(tau_(upright("ref")) \/ 2)$.
    Apply Lemma 18 with lattice $lambda^(- 4) cal(O)$, $a = X \/ q_c^2$, and $U = Z^(tau_(upright("ref")) \/ 2)$.
    On the full source support, the coefficient bound used in Part I gives
  $ \| d \( mu \) \| \/ sqrt(q_mu) lt.eq 27 q_lambda^(4 \/ 3) . $
  Each base or marked local factor is at most $q_p^(1 \/ 2)$ after its indicator is discarded.
    The bounded row, tuple, and local log-length ranges, the local branch counts, and $1 +
    a^(- 1)$ have a fixed polynomial cost $Z^(B_(upright("tail")))$,
    with $B_(upright("tail"))$ chosen independently of the kernel order. For any desired saving $D > 0$, the choice
  $ A > 1 + frac(2 \( B_(upright("tail")) + D \), tau_(upright("ref"))) $
  in that shell lemma makes the absolute total of these whole dyads $O \( Z^(- D) \)$ times a finite test
    seminorm. Norm twists have the fixed polynomial height cost of that seminorm.
    The shell sum counts all discarded dual indices, so no count at a retained dual length is used for this tail.
    It is removed before Fourier absolutization.
  For a retained dyad, apply the common-profile lemma and Equation (1.39) to the one joint profile in
    Equation (2.29). Its density is common to the entire current row Hilbert space,
    including the active-tuple sum: the actual row, dual, and individual slot norms are its coordinates,
    not parameters of separately chosen measures. The full fixed support boxes govern every invoked weighted
    Fourier norm and height cost. At a separated mode the norm powers have absolute value one and preserve the
    row, tuple, and dual coefficient independences. Only inside this separated nonnegative row norm may the row
    set be enlarged from the original annulus to $q_R lt.double Z^H$,
    using the same separated formula on the added rows. The kernel is never evaluated there.
  After extracting the common coefficient but before using $m_(upright("ker"))^2$,
    the separated squared norm is bounded by
  $ Z^(- v - 2 ell_b - 2 e_lambda \/ 3 - S_0 - B_0 + epsilon.alt) cal(N) \, $
  where
  #[#set math.equation(numbering: n => "(2.30)")
   $ cal(N) =  & sum_(k_(upright("res")) med upright("sf")\
q_(k_(upright("res"))) lt.double Z^H)
  lr(|sum_(bold(p)) frac(a \( bold(p) \), sqrt(q_P)) 1_(\( P \, k_(upright("res")) \) = 1) sum_(n med upright("sf")\
b) beta \( n \, b \) chi_(k_(upright("res"))) \( n b \)^3 chi_P \( n \)^(- 2) 1_(\( P \, b \) = 1)|)^2 \,\
 & P = product_(i med upright("active")) p_i \, wide q_P asymp Z^(z_a) . $ <old-eq:4.6a>]
  The ideals $n \, b$ retain their stated dyadic norms and fixed coefficient restrictions.
    After extracting common bounds, $\| a \( bold(p) \) \| \, \| beta \( n \, b \) \| lt.eq 1$.
  We verify the two independence hypotheses before invoking the norm bound.
    Every residual prime has exponent $j = 1$, every active slot is a whole-index $j = 0$ mark,
    and all other active primes are frozen. The separate full $M_(upright("ref"))^2$ classes fix the cusp
    coefficient and additive factor. Equation (2.19) cancels every row-slot phase,
    while the preceding marked-reflection discussion assigns all row-row, slot-slot,
    and frozen interactions to a row scalar or a tuple scalar.
    The angular conductor scalar separates in the same fashion.
    The remaining source and frozen local columns depend only on the full extracted dual index;
    their zeros at a frozen factor give fixed row, tuple, or dual restrictions.
    Finally the exact zero-preserving column identities leave only $1_(\( P \, k_(upright("res")) \) = 1)$ and
    $1_(\( P \, b \) = 1)$ in addition to the character zeros.
    Hence $a$ is independent of $k_(upright("res")) \, n \, b$,
    and $beta$ is independent of $k_(upright("res")) \, bold(p)$, exactly as required in Equation (2.30).
    The function $a$ need not retain product form at this norm step.
  Apply Lemma 46 with
  $ K = Z^H \, wide N = Z^v \, wide B = Z^(ell_b) \, wide L = Z^(z_a) . $
  Aggregating tuples with the same $P$ costs only a divisor factor. Since
  $ v + z_a - u = max { v \, z_a \, 2 \( v + z_a \) \/ 3 } \, $
  the hybrid bound and the outside coefficient give exponent
  $ max \( H \, v + ell_b \) - S_0 - B_0 + z_a - u - ell_b - 2 e_lambda \/ 3 . $
  Only now does the squared scalar $m_(upright("ker"))^2$ supply the last term in Equation (2.28).
    This proves the fixed-part assertion.
  Every powerful ideal is uniquely $x^2 y^3$ with $y$ squarefree.
    Ideal counting and $sum_y q_y^(- 3 \/ 2) < oo$ give $O \( Z^(O \/ 2) \)$ such ideals in the $O$-dyad.
    The supported squarefree part divides the radical of $S f frak(r)_rho$,
    so it has $O \( Z^epsilon.alt \)$ choices in the stated ranges; the local choices have the same divisor bound.
    Rowwise divisor Cauchy on the local expansion followed by the positive sum over these fixed parts therefore
    adds $O \/ 2 + epsilon.alt$ once. The active tuples were already inside the hybrid norm and are not counted
    again. This proves the aggregate assertion. ◻
]

The dependence on the original row length can be bounded without identifying $H$ with $M - O$.
  At one active non-slot prime the contribution to $2 A_0 - N_0 - S_0 - 4 B_0$ is as follows:

$ upright("local choice") & upright("coefficient of its log-norm")\
j upright(" odd, or ") j = 2 & 2\
j = 0 upright(" active") & 1\
j = 4 upright(" small or assigned to ") n & 1\
j = 4 upright(" assigned to ") b & - 2\
j = 0 upright(" inactive") & 0 . $

A residual row prime contributes two through $2 H$. Prime by prime, these coefficients are bounded by the valuations in

$ \( q_k^2 \/ q_(k_(upright("pow"))) \) thin q_f q_(frak(r)_rho) . $

Indeed, a powerful prime of row valuation $e gt.eq 2$ has valuation $e$ in the first factor,
  a squarefree row prime has valuation two, and a prime belonging only to the squarefree $f$ or to $frak(r)_rho$
  has valuation one. Intersections only increase the valuation of this upper bound.
  Fixed excluded primes contribute only a fixed factor $C_S gt.eq 1$.
  Equivalently, summing over primes gives the actual norm inequality

$ q_(k_(upright("res")))^2 Z^(2 A_0 - N_0 - S_0 - 4 B_0) lt.eq C_S q_k^2 /
  q_(k_(upright("pow"))) thin q_f q_(frak(r)_rho) . $

Choose a fixed $C_f gt.eq 1$ with $q_f lt.eq C_f Z^V$, and put $C_(upright("width")) = C_H^2 C_S C_k^2 C_O C_f$.
  The preceding inequality and the definition of $T_d$ imply

#[#set math.equation(numbering: n => "(2.31)")
 $ T_d - S_0 - B_0 lt.eq 2 M - O + Q + V - N_(*) + 2 z_a +
   frac(log C_(upright("width")), log Z) . $ <eq:common-width-charge>]

For empty slot lists, $z_a = u = 0$. Choose $eta > 0$ and then take $Z$ so large that the two displayed constant
  errors are at most $eta$ and $e_lambda gt.eq - eta$; the latter follows from $log Z gt.eq
  4 log q_lambda \/ eta$. On a retained dyad, Equation (2.28) and $v + 3 ell_b + e_lambda lt.eq T_d +
  tau_(upright("ref"))$ give

$ E_(upright("ref")) lt.eq O \/ 2 + max { H \, T_d - S_0 - B_0 } + 5 / 3 eta + tau_(upright("ref")) . $

For the first branch, drop the nonpositive terms after using the lower bound for $e_lambda$; for the second,
  use $v lt.eq T_d - 3 ell_b - e_lambda + tau_(upright("ref"))$. The maximum is increasing in each argument.
  We may therefore use Equation (1.50) for its first argument and Equation (2.31) for its second,
  then sum the logarithmically many actual $H$-dyads. Taking $eta \,
  tau_(upright("ref"))$ and the local small-power losses sufficiently small in terms of $epsilon.alt$ proves

#[#set math.equation(numbering: n => "(2.32)")
 $ sum'_(0 < q_k lt.double Z^M) \| cal(T)_1 \( Z^(N_(*)) \; k \) \|^2 lt.double
   Z^(O \/ 2 + max { M - O \, thin 2 M - O + Q + V - N_(*) } + epsilon.alt) . $ <eq:completed-moment>]

The prime on the sum restricts the powerful part to its $O$-dyad.
  A bounded dual range is included in the first term; an empty range is negligible.
  No equality $H = M - O$ has been used.

==== 2.4 The compensated low estimate <sec:compensated-low>

We now bound the finite compensated probe defined in Equation (2.5). Its exact low separation has two factors.
  We first bound the completed row after summing the marked slots by applying Lemma 47 directly.
  We then prove a quantitative Gram bound for the additive polynomial from Section 4.
  Cauchy–Schwarz will combine these estimates to give the exponent $3 \/ 16$.

===== 2.4.1 The marked completed row <the-marked-completed-row>

For a fixed rescaled subset $J$, with marked subset $J^c$, put

#[#set math.equation(numbering: n => "(2.33)")
 $ d = sum_(i in J) ell_i \, wide X' = X \/ q_(p_J) asymp X Z^(- d) \, wide Y' = Y \/ q_(p_J) asymp Y Z^(- d) \,\
M' = M - 2 d \, wide ell' = ell - d \, wide 0 lt.eq d lt.eq ell = 1 \/ 6 . $ <old-eq:5.2>]

For a squarefree product $D$ of slot primes, define the marked completed series

$ T_D \( s_0 \, psi \) = sum_(c med upright("sf")\
n) gamma_2 \( c \) overline(alpha \( c n^3 \)) psi \( c n^3 \) 1_(D divides c n^3) q_c^(- s_0)
  q_n^(- 3 s_0 + 1 \/ 2) . $

The ideals $c \, n$ are the original ideals prime to $S$, represented by their primary generators,
  with $c$ squarefree; they may share primes. All character powers retain their original zero extensions.
  For the empty product $D = 1$ this is the completed $T \( s_0 \, psi \)$. For this fixed $J$, let

$ B_(m \, sigma)^J \( Z \) = sum_(p_i in cal(P)_i \( Z \) \, med i in.not J) product_(i in.not J)
  overline(eta \( p_i \)) W_i \( q_(p_i) \/ P_i \) sum_(theta in hat(T)) a_theta frac(1, 2 pi i)
  integral_(\( 4 \)) & \( Z q_(p_(J^c)) \)^t Phi \( t \)\
 & dot.op T_(p_(J^c)) \( t + 1 \/ 2 \, nu_sigma theta chi_bullet \( m \) \) thin d t . $

Thus $B^J$ is exactly the completed-row factor for the $J$ summand of Equation (2.5) after the marked slots have
  been summed. The fixed tuple $p_J$ affects only $X' \, Y'$ in its low separation.

#thm([Lemma 2.8.])[
  (The compensated completed-row norm).  #emph[For every $epsilon.alt > 0$, every fixed rescaled subset $J$,
    and every $sigma in T$, with $Q = q_(b_(*)) X' Y' asymp Z^(M')$,
#[#set math.equation(numbering: n => "(2.34)")
 $ sum_(0 < q_m lt.double Q) \| B_(m \, sigma)^J \( Z \) \|^2 lt.double
   Z^(M' + \( \( d - 1 \/ 6 \) \/ 4 \)_(+) + epsilon.alt) = Z^(M' + epsilon.alt) . $ <old-eq:5.4>]

 The bound is uniform in the fixed rescaled tuple and has no loss depending on the mesh of the surviving slots.]
] <lem:probe-row-norm>

#proof[
  Put $A = c n^3$ and $𝜚_i = q_(p_i) \/ P_i$ for $i in.not J$.
    Since $q_A = q_c q_n^3$ even when $c \, n$ share primes, and $q_(p_(J^c)) =
    Z^(ell') product_(i in.not J) 𝜚_i$, Mellin inversion of the displayed integral defining $B^J$ gives the
    physical smooth factor
  $ V #h(-0.16667em) (frac(q_A, Z q_(p_(J^c)))) = W_(upright(G)) #h(-0.16667em) (frac(r, product_(i in.not J) 𝜚_i)) \,\
r = q_A / Z^(1 + ell') . $
  Here $V = W_(upright(G))$ is the Gaussian of Lemma 10. Empty products are one.
  Use the fixed translate partition $chi$ from that lemma on $r$.
    On the annulus $r = e^k x$, retain the single joint profile
  $ w_(k \, J) \( x \, bold(𝜚) \) = chi \( log x \) W_(upright(G)) #h(-0.16667em)
    (frac(e^k x, product_(i in.not J) 𝜚_i)) product_(i in.not J) W_i \( 𝜚_i \) . $
  The logarithms of $x$ and of all the $𝜚_i$ lie in fixed compact sets on this support.
    Thus the logarithm of the Gaussian argument is $k + O_(upright("fixed")) \( 1 \)$.
    The derivative estimate in Lemma 10, with this bounded shift and the fixed slot windows,
    gives for every fixed $kappa_(upright(G)) > 0$, $A_(upright("cnt")) \, B_(upright("cnt")) \,
    C_(upright("ann")) gt.eq 0$, $D_(upright("tail")) > 0$, and fixed seminorm order $j$,
  $ sum_(k in bb(Z)) e^(A_(upright("cnt")) \| k \|) p_j \( w_(k \, J) \) < oo \,\
Z^(B_(upright("cnt"))) sum_(\| k \| > kappa_(upright(G)) log Z - C_(upright("ann")))
  e^(A_(upright("cnt")) \| k \|) p_j \( w_(k \, J) \) lt.double Z^(- D_(upright("tail"))) . $
  The constants may depend on the fixed slot system, but not on its moving prime labels.
    On an annulus $log r = k + O \( 1 \)$, an absolute bound for the row $ell^2$ norm is at most
    $Z^(B_(upright("cnt"))) e^(A_(upright("cnt")) \| k \|) p_j \( w_(k \, J) \)$ for some fixed exponents,
    by the elementary row, slot, and ideal counts. Choose $C_(upright("ann"))$ larger than the fixed logarithmic
    radius of $chi$ and discard only whole annuli with $\| k \| > kappa_(upright(G)) log Z + C_(upright("ann"))$.
    Summing their norm bounds and then squaring gives less than any prescribed power of $Z^(- 1)$.
    Every annulus meeting $\| log_Z r \| lt.eq kappa_(upright(G))$ is retained.
  For each remaining annulus, keep fixed individual annular cutoffs equal to one on the support of $w_(k \, J)$
    and apply Lemma 9 to this whole profile. Its logarithmic Fourier inversion uses one coefficient density common
    to every row and every surviving slot tuple. The normalized slot ratios remain variables of the joint profile
    until separation; they do not index separately chosen densities.
    For fixed Fourier variables, each resulting slot coefficient is a product of the original arithmetic
    coefficient $overline(eta \( p_i \))$ and an individual annular cutoff and norm power.
    It remains bounded and independent of the row and of every other slot.
    The completed factor is an annular test at length
  $ N_(*) = 1 + ell' + theta_N \, wide theta_N = frac(k, log Z) \, wide \| theta_N \| lt.eq kappa_(upright(G)) +
    O_(upright("fixed")) \( 1 \/ log Z \) . $
  These retained lengths lie in a fixed bounded range. The weighted Fourier norms have a summable total by the
    displayed Gaussian estimate; the small annular weight stays in this homogeneous single-profile Fourier norm,
    not in an inhomogeneous tuple seminorm. Minkowski’s inequality passes the separated row norm through this
    common density. The existing $q_c^(- 1 \/ 2) q_n^(- 1)$ normalization stays unchanged when the test scale is
    recentered, so no additional power of $e^k$ is introduced.
    Choose $kappa_(upright(G))$ within the final $epsilon.alt$ allowance.
    For each fixed $theta$, Lemma 16 supplies the row-sector reduction of $nu_sigma theta
    chi_bullet \( m \)$ with every original zero mask. It covers all nonzero element rows,
    including those meeting $S$; no factor $xi \( m \)$ is used in this row norm.
    The row ball depends only on the fixed rescaled tuple $p_J$, through $Q = q_(b_(*)) X' Y'$,
    and is independent of the surviving marked slots and dual variables.
    The physical slot sets remain disjoint and their separated coefficients are product-form.
    Finite triangle over $theta$ and Lemma 47 therefore give the exponent in Equation (2.28) at this actual
    $N_(*)$, taking the retention parameter $tau_(upright("ref"))$ and the independently prescribed output and
    separation losses all at most a small $epsilon.alt_0 > 0$.
    We use the exponent $E_(upright("ref"))$ after the fixed row parts are summed;
    their count is already included in $E_(upright("ref")) + epsilon.alt_0$, with principal exponent $O \/ 2$,
    and is not counted again.
  Here $f = 1$ and the puncture is $rho = 1$, so the only moving non-slot primes are those of the row.
    After the finite unit and reflection-sector splits in Lemma 47,
    freeze its powerful part of norm length $O$ and its valuation-one part supported on $S$,
    and split its residual squarefree good product into #emph[actual] dyads of norm $asymp Z^H$.
    Let $epsilon.alt_Z = O_(upright("fixed")) \( 1 \/ log Z \)$ be nonnegative and large enough to contain all
    fixed annular and fixed-conductor logarithmic offsets in this calculation. Then
  $ H lt.eq M' - O + epsilon.alt_Z \, wide Delta_H = M' - O - H gt.eq - epsilon.alt_Z \, wide O gt.eq -
    epsilon.alt_Z . $
  The actual row and dual annular cutoffs are kept in one joint profile while its common Fourier density is
    separated. The small kernel amplitude is extracted from that homogeneous density before the row norm is
    squared, and only then may the positive sieve sum be enlarged, as in Equation (1.39).
    In particular the kernel saving in Equation (2.28) uses this $H$;
    it is not reevaluated on any shorter rows added by the positive enlargement.
  In the notation of that energy estimate, every moving non-slot prime counted in $A_0$ divides the powerful row
    part to exponent at least two. The comparison of its exact norm with the powerful dyad,
    and any fixed-conductor contribution, therefore gives
  $ 2 A_0 lt.eq O + epsilon.alt_Z \, wide N_0 lt.eq A_0 \, wide z_a lt.eq ell' . $
  The available dual length at the actual completed scale is
  $ T_d = 2 H + 2 A_0 + 2 z_a - 1 - ell' - theta_N - N_0 - 3 B_0 . $
  Since $M' + ell' - 1 = - 3 d$, direct subtraction gives
  $ T_d - \( H - 3 d \) = H - M' + 2 A_0 + 2 \( z_a - ell' \) - N_0 - 3 B_0 - theta_N lt.eq
    2 epsilon.alt_Z + \| theta_N \| . $
  As in the proof of the reflected energy, dual ranges below a fixed negative length are negligible after a
    positive Mellin shift, and the bounded boundary range costs an arbitrarily small power.
    The source dual ideals $n \, b$ in these dyads retain the support of Equation (1.18):
    they may share primes and may contain the permitted primes of $S$;
    no additional $S$-mask or coprimality condition between $n$ and $b$ is imposed.
    On each remaining dual dyad, put $y = v + 3 ell_b + e_lambda$.
    Retention gives $y lt.eq T_d + epsilon.alt_0$, while the nonzero unit ranges give $v \, ell_b \,
    e_lambda gt.eq - epsilon.alt_Z$ after increasing its fixed constant. It follows that
  $ max \( H \, v + ell_b \) = H + O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \) . $
  Write $s_(upright("hyb")) = min { v \, z_a \, \( v + z_a \) \/
    3 }$ for the quantity called $u$ in Equation (2.27). If $s_(upright("hyb")) = z_a$, then $- S_0 - B_0 + z_a -
    s_(upright("hyb")) lt.eq 0$, the kernel term is nonpositive, and
  $ - ell_b - frac(2 e_lambda, 3) lt.eq 5 / 3 epsilon.alt_Z . $
  Here the standalone $O$ is the powerful-row logarithmic length. It follows that
  $ E_(upright("ref")) & lt.eq O \/ 2 + H + O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \)\
 & = M' - O \/ 2 - Delta_H + O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \) . $
  Otherwise $s_(upright("hyb")) gt.eq v \/ 2 - O \( epsilon.alt_Z \)$, and the bounded unit ranges imply
  $ s_(upright("hyb")) + ell_b + frac(2 e_lambda, 3) + frac(\( T_d - y \)_(+), 2) gt.eq y / 4 +
    frac(\( T_d - y \)_(+), 2) - O \( epsilon.alt_Z \) gt.eq T_d / 4 - O \( epsilon.alt_Z \) . $
  The last inequality holds separately for $y lt.eq T_d$ and $y gt.eq T_d$.
    Here the squared kernel saving is obtained by first extracting $min { 1 \,
    Z^(\( y - T_d \) \/ 4) }$ from the common Fourier density and only then squaring the row norm.
    Relative to $M'$, the saving before the remaining $+ z_a$ is exactly
  #[#set math.equation(numbering: n => "(2.35)")
   $ O \/ 2 + Delta_H + S_0 + B_0 + T_d \/ 4 =  & frac(2 M' + 2 z_a - 1 - ell' + 2 Delta_H - theta_N, 4)\
 & + frac(2 A_0 - N_0 + B_0 + 4 S_0, 4) . $ <old-eq:5.3>]
  The second numerator is nonnegative. Since $z_a lt.eq ell'$, the energy in this branch is at most
  $ & M' + frac(1 + 3 ell' - 2 M' - 2 Delta_H + theta_N, 4) +
    O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \)\
 & wide = M' + frac(d - 1 \/ 6 - 2 Delta_H + theta_N, 4) +
   O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \) . $
  After using $O gt.eq - epsilon.alt_Z$ and absorbing $theta_N$, the two upper bounds are
  $ M' - Delta_H + O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \) \,\
M' + frac(d - 1 \/ 6 - 2 Delta_H, 4) + O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \) . $
  They are nonincreasing in $Delta_H$. Since $Delta_H gt.eq - epsilon.alt_Z$, their formal $Delta_H =
    0$ values bound every actual dyad up to $O \( epsilon.alt_Z \)$, whether or not an endpoint dyad occurs.
    Their maximum is therefore at most $M' + \( \( d - 1 \/ 6 \) \/ 4 \)_(+) +
    O \( epsilon.alt_0 + kappa_(upright(G)) + epsilon.alt_Z \)$.
    At $d = 1 \/ 6$ one has $ell' = z_a = 0$ and the clipped unit range falls in the first branch;
    bounded negative unit dyads change only $epsilon.alt_Z$. Choose $epsilon.alt_0$ and $kappa_(upright(G))$
    within the prescribed $epsilon.alt$ allowance, and then increase the fixed-data lower threshold so that
    $epsilon.alt_Z$ also lies within it. Summing the logarithmically many row and dual dyads proves the lemma. ◻
]

===== 2.4.2 The additive Gram bound <the-additive-gram-bound>

We next estimate the additive factor in the range $Y' ""^2 \/ Q gt.eq 1$.
  The full correlation of Lemma 43 retains the collision zeros that determine both its cancellation and its
  exceptional frequencies.

#thm([Proposition 2.9.])[
  (A quantitative additive Gram bound).  #emph[Fix the arithmetic data $S \, T \, b_(*) \, xi$,
    the annular weight $W_1$, and a ray class $sigma in T$. Let $Q \, Y' gt.eq
    1$ be in fixed polynomial ranges in $Z$, and suppose
$ P_a = Y' ""^2 \/ Q gt.eq 1 . $

 For a real height $nu$, put $A_m = A_(m \, sigma \, nu) \( Y' \)$ as defined in Section 4.
   For every fixed row ball $q_m lt.double Q$ and every $epsilon.alt > 0$, one has
#[#set math.equation(numbering: n => "(2.36)")
 $ sum_(q_m lt.double Q) \| A_m \|^2 lt.double \( 1 + \| nu \| \)^(J_(upright("Gr"))) Q /
   Y' (1 + P_a^(1 \/ 6) + P_a^2 / Y') Z^epsilon.alt . $ <eq:gram-quantitative>]

 Here $J_(upright("Gr"))$ is a fixed seminorm order, independent of the moving scales and of $nu$.
   The same assertion holds for any fixed finite linear combination of the ray coefficients $1_(s in sigma)
   chi_s \( b_(*) \) \/ xi \( s \)$. No arbitrary row-dependent arithmetic coefficient is asserted.]
] <prop:probe-gram>

#proof[
  Majorize the row ball by a fixed nonnegative radial Schwartz function.
    Put $r_s = q_s \/ Y'$ and, on the primary elements prime to $S$, $c_sigma \( s \) =
    1_(s in sigma) chi_s \( b_(*) \) \/ \( tau xi \( s \) \)$,
    extended by zero elsewhere before the inverse character is evaluated.
    The exact annular rewriting of the polynomial is
  $ A_m = Y' ""^(- 3 \/ 2) sum_s c_sigma \( s \) W_1 \( r_s \) r_s^(- 1 + i nu) g_(chi_s) \( s \, - m \) . $
  Thus the expanded square has the common normalization $Y'
    ""^(- 3)$ and the joint annular profile contains the factors $W_1 \( r_(s_1) \) r_(s_1)^(- 1 + i nu)
    W_1 \( r_(s_2) \) r_(s_2)^(- 1 - i nu)$. Write $s_1 = C n_1$, $s_2 = C n_2$, with $\( n_1 \, n_2 \) = 1$.
    Poisson in the row variable has factor $Q \/ \( q_(s_1) q_(s_2) \)$,
    whereas the complete transform of the two unnormalized Gauss sums is $q_(s_1) q_(s_2)
    F \( s_1 \, s_2 \; j \)$. It therefore gives the exact prefactor $Q \/ Y'
    ""^3$ and the correlation $F \( C n_1 \, C n_2 \; C k \)$ of Equation (2.12).
    Here $F$ again denotes the full correlation of Equation (2.11), not the local coefficient of Equation (1.57).
    The first Fourier kernel has argument comparable to $q_C q_k \/ P_a$.
  On coprime residuals the factor $L_C$ in that correlation has $\| L_C \| lt.eq q_C$.
    For the subsequent signed extension use its specified bounded extension,
    periodic modulo $"rad" C$ in both columns, including when $C$ shares primes with a column.
    Its value is defined to be zero when a prime of $C$ divides both columns;
    this is a definition of the extension, not a claim about the genuine correlation there.
    Before any factorwise estimate, insert the complete Möbius identity
  $ 1_(\( n_1 \, n_2 \) = 1) = sum_(d divides n_1 \, med d divides n_2) mu \( d \) $
  and write $n_i = d m_i$. No coprimality condition on $m_1 \, m_2$ is then imposed.
    Nonzero terms have $\( d \, C k \) = 1$. Throughout this step use the fixed ray extension of
    $cal(R) \( n_1 \, n_2 \)$; a quotient of zero residue symbols would not be defined.
  We specify a common fixed modulus for that coefficient. For $k eq.not 0$ write $k =
    zeta k_S k_(upright("good"))$ using the unit convention and the fixed $S$-prime generators of Lemma 5,
    with $k_S = product_(frak(p) in S) pi_(frak(p))^(e_(frak(p)))$ and $k_(upright("good")) =
    product_(p in.not S) p^(e_p)$. For a primary residual ideal $m$ outside $S$, reciprocity gives
  $ chi_m \( k \) & = kappa_(zeta \, bold(e)) \( m \) cal(R) \( k_(upright("good")) \, m \)
    product_(p divides k_(upright("good"))) chi_p \( m \)^(e_p) \,\
kappa_(zeta \, bold(e)) \( m \) & = chi_m \( zeta \) product_(frak(p) in S)
  chi_m \( pi_(frak(p)) \)^(e_(frak(p)) med mod med 6) . $
  Every displayed good local power retains its zero on a shared prime, including when $6 divides e_p$.
    Lemma 5 places the finitely many $kappa_(zeta \, bold(e))$ in a fixed ray group supported on $S$.
    Also $cal(R) \( k_(upright("good")) \, m \)$ belongs to a fixed finite family in $m$.
  Choose $frak(l)_(upright("fixed"))$ once to contain the primary-class modulus and the $S$ zero masks,
    the moduli of every fixed ray coefficient in $A_m$, a period for $cal(R)$ in each variable,
    and the conductors of all the preceding $kappa_(zeta \, bold(e))$ characters.
    The extended coefficient is zero off the primary class or at a fixed nonunit before any inverse character is
    evaluated. This modulus is independent of $C \, d \, k$, and may have higher powers at $S$ than
    $"rad" \( k \)$. After reciprocity the joint arithmetic coefficient in $m_1 \, m_2$ is periodic modulo
  $ frak(r) = "lcm" \( frak(l)_(upright("fixed")) \, "rad" C \, "rad" \( k \) \) \, wide
    q_(frak(r)) lt.double_(upright("fixed")) q_C q_k . $
  If $k$ has a valuation $e_p$ not divisible by six at a prime outside $C$ and $frak(l)_(upright("fixed"))$,
    call $k$ nonexceptional. At that prime the first residual column has the nonprincipal zero-extended factor
    $chi_p \( m_1 \)^(e_p)$ up to a unit scalar. The lift, the fixed phases,
    and the other prime factors are independent of $m_1$ modulo $p$.
    Its complete mean, and hence the complete joint mean by the Chinese remainder theorem, is zero.
    The substitution by $d$ does not change this conclusion because $\( d \, k \) = 1$.
    Principal zero masks at valuations divisible by six remain present in the exceptional case.
  The frequency $k = 0$ contributes only the diagonal: the correlation forces $n_1 = n_2 =
    1$ and equals $phi \( C \)$. There are $O \( Y' \)$ possible $C$ of norm comparable to $Y'$,
    each with $phi \( C \) lt.eq q_C lt.double Y'$. Its contribution is therefore $O \( Q \/ Y' \)$.
  For $k eq.not 0$, split the Fourier argument into dyadic shells $q_C q_k \/ P_a asymp R$, with $R = 1 \, 2 \,
    4 \, dots.h$ and the first shell including all arguments at most two.
    Choose dyad centers $C_0 \, D_0 in { 1 \, 2 \, 4 \, dots.h }$ for $q_C asymp C_0$ and $q_d asymp D_0$,
    with the first dyads containing the bounded unit ranges. Use the nominal positive residual scale
  $ N = Y' \/ \( C_0 D_0 \) \, wide cal(Q) = q_(frak(r)) lt.double_(upright("fixed")) R P_a . $
  The actual residual norms lie in fixed multiples of $N$; the nominal value $N$ is allowed to be below one.
    Fix arbitrary $A > 2$ and $B > 2$. For each fixed $C \, d \, k$,
    the one joint annular profile $W_R$ for the two columns has the finitely many homogeneous single-profile
    seminorms used below bounded by
    $O_(B \, J_(upright("Gr"))) \( \( 1 + \| nu \| \)^(J_(upright("Gr"))) R^(- B) \)$,
    with one fixed $J_(upright("Gr"))$ chosen after these derivative orders and $A \, B$.
    This follows by differentiating the first Fourier kernel,
    whose Schwartz decay absorbs every resulting power of $R$;
    derivatives of the norm powers cost a fixed power of $1 + \| nu \|$.
    This factor $R^(- B)$ remains in the single-profile Fourier estimate and occurs once in the linear lattice sum
    below; no small inhomogeneous tuple seminorm is used.
  Let $a_(C \, d \, k)$ be this periodic arithmetic coefficient.
    For a nonexceptional frequency its normalized complete Fourier transform,
    with normalization $cal(Q)^(- 2)$ on the two residue variables,
    has absolute value at most $q_C$ and vanishes at $\( 0 \, 0 \)$.
    Since every ideal of $cal(O)$ is principal, the period lattice has linear scale $cal(Q)^(1 \/ 2)$.
    Four-dimensional lattice Poisson therefore gives, for this $A$,
  #[#set math.equation(numbering: n => "(2.37)")
   $
     lr(|sum_(upright(bold(m)) in cal(O)^2) a_(C \, d \, k) \( upright(bold(m)) \) W_R \( upright(bold(m)) \/
     sqrt(N) \)|) lt.double \( 1 + \| nu \| \)^(J_(upright("Gr"))) R^(- B) q_C N^2 min {
     1 \, \( cal(Q) \/ N \)^A } . $ <eq:gram-periodic-poisson>]
  For $N gt.eq cal(Q)$, the zero frequency vanishes and the other dual vectors have linear scale
    $\( N \/ cal(Q) \)^(1 \/ 2)$. Fourier decay of order $2 A > 4$ bounds their sum by $\( cal(Q) \/ N \)^A$.
    For $N < cal(Q)$, use the point count in the two annuli. A nonempty subunit annulus has $N$ bounded below by a
    fixed positive constant, so it still contains $O \( N \)$ lattice points; below that constant it is empty.
    This proves Equation (2.37) without any primitivity or tensor-product assumption on $a_(C \, d \, k)$.
  Put $K_R = R P_a \/ C_0$. The fixed shell comparison constants give $q_k lt.eq
    C_(upright("sh")) K_R$ for a fixed $C_(upright("sh")) > 0$.
    Hence the nonzero frequency range is empty when $K_R < C_(upright("sh"))^(- 1)$.
    On a nonempty range, elementary lattice counting gives
  $ \# { k : 0 < q_k lt.eq C_(upright("sh")) K_R } lt.double_(upright("fixed")) K_R + sqrt(K_R) +
    1 lt.double_(upright("fixed")) K_R . $
  There are therefore $O \( C_0 D_0 K_R \)$ choices of $C \, d \, k$ on these dyads.
    Multiplying Equation (2.37) by this count and by the common prefactor gives at most
  $ \( 1 + \| nu \| \)^(J_(upright("Gr"))) R^(- B) Q / Y' frac(R P_a, C_0 D_0) min {1 \,
    (frac(R P_a C_0 D_0, Y'))^A} . $
  For $Lambda = Y' \/ \( R P_a \)$ the required positive dyadic sum is
  $ sum_(i \, j gt.eq 0) 2^(- i - j) min { 1 \, \( 2^(i + j) \/ Lambda \)^A } =
    sum_(n gt.eq 0) \( n + 1 \) 2^(- n) min { 1 \, \( 2^n \/ Lambda \)^A } lt.double_A
    frac(1 + log \( 2 + Lambda \), Lambda) . $
  For $Lambda gt.eq 1$, split the two geometric tails at $2^n asymp Lambda$; for $Lambda < 1$,
    the left side is bounded and the displayed right side is larger than a positive constant.
    Thus the nonexceptional frequencies contribute
  $ lt.double \( 1 + \| nu \| \)^(J_(upright("Gr"))) Q / Y' P_a^2 / Y' Z^epsilon.alt $
  after the $R$ sum, on choosing a fixed $B > 2$.
  It remains to count the exceptional nonzero frequencies. They have $\( k \) = a_1^6 e$,
    where $e$ is sixth-power-free and supported on the primes of $C$ and the fixed support.
    There are at most $6^(omega \( C \) + O_S \( 1 \)) lt.double_epsilon.alt q_C^epsilon.alt$ possible $e$.
    For each of them the shell bound $q_k lt.eq C_(upright("sh")) K_R$ permits only $q_(a_1)
    lt.eq \( C_(upright("sh")) K_R \/ q_e \)^(1 \/ 6)$. If this range is nonempty,
    its upper bound is at least one, and the ideal count gives $O_(upright("fixed")) \( K_R^(1 \/ 6) \)$ choices;
    if $q_e > C_(upright("sh")) K_R$ it is empty. Unit factors cost only a fixed factor.
    Hence there are $O_epsilon.alt \( K_R^(1 \/ 6) q_C^epsilon.alt \)$ such elements $k$,
    including the bounded subunit range of $K_R$.
  Use $K_R = R P_a \/ C_0$, $\| L_C \| lt.eq q_C$, and the trivial two-column point count.
    Before multiplication by $Q \/ Y' ""^3$, the contribution on these dyads is
  $ lt.double \( 1 + \| nu \| \)^(J_(upright("Gr"))) R^(- B) Z^epsilon.alt Y' ""^2 \( R P_a \)^(1 \/ 6)
    C_0^(- 1 \/ 6) D_0^(- 1) . $
  The sums over $C_0 \, D_0$ converge after reducing the arbitrary small power,
    and the $R$ sum converges for the same fixed $B > 2$. This gives the term $\( Q \/ Y' \) P_a^(1 \/ 6)
    Z^epsilon.alt$. Adding the diagonal and nonexceptional terms proves the proposition. ◻
]

===== 2.4.3 Completion of the low bound <completion-of-the-low-bound>

The two preceding estimates now apply to the two factors of the same rescaled summand in the exact low separation.

#thm([Proposition 2.10.])[
  (The compensated low estimate).  #emph[For the probe in Equation (2.5), the geometry in Equation (2.4),
    and every $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(2.38)")
 $ \| I_(eta \, upright("modified")) \( Z \) \| lt.double Z^(l_x \/ 2 + b \/ 12 + epsilon.alt) =
   Z^(3 \/ 16 + epsilon.alt) . $ <old-eq:5.10>]

 The exponent is independent of the target and the slot mesh;
   the constant and lower threshold may depend on the fixed arithmetic data, slot system, and smooth tests.]
] <prop:probe-low>

#proof[
  For a fixed rescaled subset and tuple, put $Q = q_(b_(*)) X' Y'$.
    Its separation is Equation (1.56) with $A_(m \, sigma \, v) \( Y' \)$ and $B_(m \, sigma)^J \( Z \)$.
    Put $r_J = q_(p_J) \/ Z^d$; the fixed annular supports give $0 < c_J lt.eq r_J lt.eq
    C_J < oo$ uniformly in the tuple. Exactly,
  $ X' = Z^(l_x - d) \/ r_J \, wide Y' = Z^(l_y - d) \/ r_J \,\
Q = q_(b_(*)) Z^(M') \/ r_J^2 \, wide P_a = Y' ""^2 \/ Q = q_(b_(*))^(- 1) Z^(1 \/ 8) . $
  In particular $P_a gt.eq 1$ for $Z gt.eq q_(b_(*))^8$. Enlarge the allowed fixed-data lower threshold so that
    $Q \, Y' gt.eq 1$ uniformly over the tuple ratios as well; this is possible because $M' gt.eq
    1 \/ 2$ and $l_y - d gt.eq 5 \/ 16$. The remaining length inequalities are
  $ l_x - d gt.eq 3 \/ 16 \, wide l_y - d gt.eq 5 \/ 16 \, wide l_y - d - 11 b \/ 6 gt.eq 1 \/ 12 . $
  The last one gives
  $ Y' / P_a^(11 \/ 6) = q_(b_(*))^(11 \/ 6) r_J^(- 1) Z^(l_y - d - 11 b \/ 6) gt.double_(upright("fixed"))
    Z^(1 \/ 12) \, $
  and hence $P_a^2 \/ Y' lt.double P_a^(1 \/ 6)$. Proposition 49 therefore gives
  #[#set math.equation(numbering: n => "(2.39)")
   $ sum_(q_m lt.double Q) \| A_(m \, sigma \, v) \( Y' \) \|^2
     lt.double \( 1 + \| v \| \)^(J_(upright("Gr"))) \( Q \/ Y' \) P_a^(1 \/ 6) Z^epsilon.alt . $ <old-eq:5.6>]
  Cauchy–Schwarz in the row sum, Lemma 48, and the integrability of $\( 1 + \| v \| \)^(J_(upright("Gr")) \/ 2) \|
    hat(W)_0 \( i v \) \|$ now bound this tuple’s unscaled separation by $Z^epsilon.alt$ times
  $ Q^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\[] \( Q \/ Y' \) P_a^(1 \/ 6) #scale(x: 120%, y: 120%)[\]]^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\[] Z^(M') #scale(x: 120%, y: 120%)[\]]^(1 \/ 2) & =
    #scale(x: 120%, y: 120%)[\[] Z^(M') \/ Y' #scale(x: 120%, y: 120%)[\]]^(1 \/ 2) P_a^(1 \/ 12)\
 & = r_J \( X' \)^(1 \/ 2) P_a^(1 \/ 12) . $
  Since $r_J$ is bounded, this is $O \( \( X' \)^(1 \/ 2) P_a^(1 \/ 12) Z^epsilon.alt \)$.
  For $d = sum_(i in J) ell_i$ there are at most $Z^(d + epsilon.alt)$ rescaled tuples,
    the coefficient is $O \( Z^(- 3 d \/ 2) \)$, and $\( X' \)^(1 \/ 2) asymp X^(1 \/ 2) Z^(- d \/ 2)$.
    The total additional exponent is consequently
  #[#set math.equation(numbering: n => "(2.40)")
   $ f \( d \) = d - 3 d \/ 2 - d \/ 2 = - d lt.eq 0 . $ <old-eq:5.5>]
  Choose the small powers in the component estimates so that their sum lies within the prescribed $epsilon.alt$.
    Summing the finitely many subsets proves Equation (2.38).
    For the already defined $C = C_(upright("II"))$ of Equation (2.3),
    the normalization used for the principal signal satisfies
  #[#set math.equation(numbering: n => "(2.41)")
   $ C_(upright("II")) \( s \) = l_x \/ 2 + s - 1 + h \/ 6 = s - 11 \/ 16 \,\
C_(upright("II")) \( 7 \/ 8 \) = 3 \/ 16 = l_x \/ 2 + b \/ 12 . $ <old-eq:5.11>]
  Thus, under the contradiction assumed in Part II, this low bound is smaller than
    $Z^(C_(upright("II")) \( beta_(*) \))$ by the exact power $Delta = beta_(*) - 7 \/ 8$,
    apart from the arbitrarily prescribed $epsilon.alt$. ◻
]

==== 2.5 The local compensation and its errors <sec:local-compensation>

The physical modification in Section 1 has already been estimated from its separated low representation.
  We now identify its full Euler correction and bound the local errors left by the two-term operation.
  Throughout, the local notation $P_p \, P_p^(*) \, H_p \, V \, W \, D \, R$ is that of Lemma 26;
  in the shared analytic estimates its variable $x$ is called $s$.
  Fix a nonzero sixth-power-free physical row $u$ with $\( u \, S \) = 1$.
  All slot primes belong to the sets $cal(P)_i \( Z \)$ of Section 1; for each such prime put $Q = q_p$.
  As in Lemma 26, write $x_r = Re x$, $w_r = Re w$, and $z_r = Re z$.
  The factor $W_(upright("loc")) = rho Q^(- w)$ inside $P_p^(*)$ is distinct from $W = chi_p \( u \) Q^(- w)$:
  at $p divides u$, the latter and $D$ vanish, while the former retains its unit phase.

===== 2.5.1 The full holomorphic correction <the-full-holomorphic-correction>

For a fixed slot prime $p$, restricting the completed index to $p divides
  A$ replaces $P_p$ by $P_p^(*)$ in the high series. Changing $Z$ to $Z
  Q$ multiplies its Mellin weight by $Q^(x + z - 1)$. The marked term of Equation (2.5) therefore has,
  at points where $P_p$ is defined and nonzero, multiplier $overline(eta \( p \)) Q^(x + z - 1) P_p^(*) \/ P_p$.
  The rescaled term has multiplier

$ Q^(- 3 \/ 2) Q^(- \( 1 \/ 2 - z \)) Q^(- \( w - 1 \)) = Q^(z - w - 1) . $

Thus, on the same locus, the exact local multiplier of the two-term operation is

#[#set math.equation(numbering: n => "(2.42)")
 $ Q^(z - 1) cal(B)_p \, wide cal(B)_p = overline(eta \( p \)) Q^x P_p^(*) \/ P_p - Q^(- w) . $ <old-eq:5.13>]

Define the combined local replacement by

#[#set math.equation(numbering: n => "(2.43)")
 $ G_p =
   frac(\( overline(eta \( p \)) Q^x - Q^(- w) \) \( 1 - V \) \( 1 - W \) P_p^(*) - Q^(- w) \( 1 - V W \), 1 -
   D) . $ <old-eq:5.13c>]

At points in the Euler regions where the raw quotient in Equation (2.42) is defined, one has $G_p = H_p cal(B)_p$.
  The displayed formula defines $G_p$ also where that quotient is not defined.
  There is neither a $P_p$ nor a $1 - W$ denominator on the right.
  The bounds $\| R \| \, \| V \| \, \| D \| < 1$ in Lemma 26, together with its formula for $P_p^(*)$,
  show that $G_p$ is holomorphic in both stated Euler regions, including at zeros of $P_p$ or $H_p$.

At points in the Euler regions where the selected quotients are defined, write the full slot multiplier

$ cal(B)_i \( u \; x \, w \, z \) = sum_(p in cal(P)_i \( Z \)) W_i \( q_p \/ P_i \) q_p^(z - 1) cal(B)_p . $

The correction used for contour moves is defined without these quotients:

#[#set math.equation(numbering: n => "(2.44)")
 $ frak(H)_(eta \, u \, Z) \( x \, w \, z \) = sum_(\( p_i \) in product_i cal(P)_i \( Z \)) product_(i = 1)^K
   #scale(x: 120%, y: 120%)[\[] W_i \( q_(p_i) \/ P_i \) q_(p_i)^(z - 1) G_(p_i) #scale(x: 120%, y: 120%)[\]]
   product_(p in.not S\
p in.not { p_1 \, dots.h \, p_K }) H_p . $ <eq:holomorphic-selected-tuple>]

This is the full correction after the scalar quotient in Equation (1.69) has been extracted.
  To verify this assertion, fix an allowed tuple and put $cal(P) = { p_1 \, dots.h \, p_K }$.
  On the absolute starting lines the selected operation replaces $P_p$ by

#[#set math.equation(numbering: n => "(2.45)")
 $ overline(eta \( p \)) Q^(x + z - 1) P_p^(*) - Q^(z - w - 1) P_p =
   frac(1 - D, \( 1 - V \) \( 1 - W \)) Q^(z - 1) G_p . $ <eq:selected-local-operation>]

The equality follows by substituting $P_p - P_p^(*) = \( 1 - V \)^(- 1) + W \/ \( 1 - W \)$ into Equation (2.43).
  It extracts the same scalar local factor $\( 1 - V \)^(- 1) \( 1 - W \)^(- 1) \( 1 - D \)$ as at an unselected
  prime. Each selected prime occurs exactly once, because the slot supports are disjoint.
  The complete factor for this tuple is therefore the scalar quotient in Equation (1.69) times its summand in
  Equation (2.44). This reasoning involves no division by $P_p$ or $H_p$.
  At points in the Euler regions where all raw selected quotients are defined,
  the same finite sum also factors as $cal(H)_(eta \, u) product_i cal(B)_i$.

The unselected product in each summand converges normally in both Euler regions.
  More quantitatively, in any fixed subregion of Equation (1.70), put $epsilon.alt_H =
  min \( epsilon.alt_0 \, 1 \/ 50 \) > 0$. The primewise defect bounds in Lemma 26 give,
  uniformly in the selected tuple,

#[#set math.equation(numbering: n => "(2.46)")
 $ product_(p in.not S\
p in.not cal(P)) \| H_p \| lt.eq product_(p in.not S\
p divides.not u) \( 1 + C q_p^(- 1 - epsilon.alt_H) \) product_(p divides u) \( 1 + C q_p^(- epsilon.alt_H) \)
  lt.double_epsilon.alt q_u^epsilon.alt . $ <eq:unselected-local-product>]

The first positive product converges by the ideal count, and the second satisfies the divisor-product bound.
  Omitting selected factors only removes factors from these positive majorants.
  In the second Euler region the same argument uses the respective defect exponents $- 363 \/ 200$ and $-
  33 \/ 40$. Thus Equation (2.46) holds there as well, with the corresponding positive majorants.
  No nonvanishing of $H_p$ is asserted by these upper bounds.

For each fixed $Z$, Equation (2.44) is a finite sum of products of holomorphic selected factors and normally
  convergent unselected products. It is therefore holomorphic on a neighborhood of every point in both Euler
  regions. It also satisfies the all-height requirement in Definition 32.
  Indeed, on a fixed real box in either region, the formula for $P_p^(*)$ and the denominators bounded away from
  zero give $\| G_p \| lt.double Q^B$ for some fixed $B$, uniformly in all imaginary parts and unit phases.
  There are $O \( P_i \)$ ideals in a slot and $q_p asymp P_i$ there.
  The finite tuple sum and Equation (2.46) consequently give

#[#set math.equation(numbering: n => "(2.47)")
 $ \| frak(H)_(eta \, u \, Z) \( x \, w \, z \) \| lt.double_epsilon.alt q_u^epsilon.alt product_i P_i^(z_r + B)
   lt.double_epsilon.alt q_u^epsilon.alt Z^(B') . $ <eq:compensated-all-height-majorant>]

for a fixed $B'$ on that box. For $q_u lt.eq Z^D$ this is Equation (1.104), even with height exponent zero.
  All constants here are fixed before any later order of integration by parts.

Combining the exact finite operation with Equations (1.61) and (1.69) now gives

#[#set math.equation(numbering: n => "(2.48)")
 $ I_(eta \, upright("modified")) \( Z \) =  & frac(1, \( 2 pi i \)^3) integral_(\( 3 \)) integral_(\( 3 \))
   integral_(\( 2 \)) cal(W) \( X \, Y \, Z \; x \, w \, z \)\
 & quad dot.op sum_u^(\( 6 \)) q_u^(- z) overline(xi \( u \))
   frac(zeta_F^S \( 6 z \) L^S \( w \, chi_bullet \( u \) \), L^S \( x \, eta overline(chi_bullet \( u \)) \))
   frak(H)_(eta \, u \, Z) \( x \, w \, z \) thin d z thin d w thin d x . $ <eq:compensated-poisson-identity>]

This identity is absolutely convergent on the displayed lines,
  because for fixed $Z$ it is obtained from finitely many absolutely convergent rescaled base-probe identities.
  It has no additional outside Euler factor. It verifies the exact high representation of Definition 32 for the
  physical expression $I_(eta \, upright("modified"))$, with the geometry in Equation (2.4).
  In particular, $l_x \/ 2 - 1 + h \/ 6 = 17 \/ 96 - 1 + 13 \/ 96 = - 11 \/ 16$, as required by Equation (2.3).
  It is an identity for the very probe bounded in Proposition 50.
  Every continuation uses the full correction in Equation (2.44),
  not a globally defined product of individual quotients.

===== 2.5.2 Dynamic local errors <dynamic-local-errors>

At an identity-ray prime every fixed phase from $T$ is one, although $eta \( p \)$ may be any unit.
  Suppose first that $p divides.not u$ and put $v = chi_p \( u \)$.
  Then $D = eta \( p \) v^(- 1) Q^(- x)$, and $overline(eta \( p \)) Q^x D = v^(- 1)$.
  Using $v^(- 1) W = Q^(- w)$ and $cal(E)_p = P_p^(*) + D$ gives the exact normalized cancellation

#[#set math.equation(numbering: n => "(2.49)")
 $ G_p + v^(- 1) H_p =  & frac(\( 1 - V \) \( 1 - W \), 1 - D)
   #scale(x: 180%, y: 180%)[\[] \( v^(- 1) - Q^(- w) \) { V \/ \( 1 - V \) - D }\
 & #h(17mm)  + \( overline(eta \( p \)) Q^x + v^(- 1) - Q^(- w) \) cal(E)_p #scale(x: 180%, y: 180%)[\]] .
   $ <old-eq:5.13b>]

This is an identity of holomorphic local expressions in the Euler regions.
  Within these regions, on the raw quotient locus its left side is $H_p \( cal(B)_p + v^(- 1) \)$.
  To see the cancellation directly on that locus, substitute $P_p^(*) = - D +
  cal(E)_p$ and $P_p = \( 1 - V \)^(- 1) + W \/ \( 1 - W \) + P_p^(*)$ into the left side before normalization.
  The constants $- v^(- 1)$, $v^(- 1) - Q^(- w)$, and $\( v^(- 1) - Q^(- w) \) W \/ \( 1 - W \) =
  Q^(- w)$ sum to zero. The resulting rational identity has only the denominators $1 - R$, $1 - V$, and $1 - D$,
  which are nonzero in the Euler regions; hence it gives the displayed holomorphic identity there.
  For $p divides u$, the main term is zero by the original zero extension, and Equation (2.43) instead becomes

$ G_p = overline(eta \( p \)) Q^x \( 1 - V \) cal(E)_p - Q^(- w) H_p . $

We now give the bound on the remaining error slots. Its analytic input is stated explicitly:
  the reflected primitive numerator must be small at the retained height.
  Instantiate Section 6 with the current fixed data and $Theta = chevron.l eta \, hat(T) chevron.r$,
  using its zero-extended presentations $nu \( n \) chi_n \( u \)^𝜍$ for $nu in Theta$ and $𝜍 in { - 1 \, 1 }$.
  The numerator $chi_bullet \( u \)$ and its conjugate belong to $cal(X)_u$ with fixed multiplier $1 in Theta$,
  while the denominator $eta overline(chi_bullet \( u \))$ belongs to $cal(X)_u$ with fixed multiplier $eta in
  Theta$. The buffered estimates there, together with the inverse deleted-factor bound of Lemma 14,
  therefore supply the reflected-numerator hypothesis below at the retained heights:
  for the points used below, $Re \( 1 - w \) = a + 6 e$ and $\| Im \( 1 - w \) \| lt.eq T_1$,
  within the buffered rectangle. The identity-ray restriction makes every fixed $T$ phase equal to one at a slot
  prime, without changing the physical row or any nonunit zero.

#thm([Proposition 2.11.])[
  (Dynamic local errors and conductor allocation).  #emph[Let $51 \/ 100 lt.eq a lt.eq 1$, $0 < e lt.eq 10^(- 3)$,
    and take
$ x_r = a + 16 e \, wide w_r = 1 - a - 6 e \, wide z_r = 17 \/ 50 . $

 Choose $P_0$ sufficiently large in terms of $e$ and the fixed data.
   For $U \, T_1 gt.eq 1$ and a sixth-power-free row $u$ with $\( u \, S \) = 1$ and $q_u asymp U$,
   let $psi_u^(*)$ be the primitive character inducing $chi_bullet \( u \)$.
   Let $cal(W)_u$ be any subset of ${ w : Re w = w_r \, med \| Im w \| lt.eq T_1 }$.
   Suppose $psi_u^(*)$ is nonprincipal and, uniformly for $w in cal(W)_u$,
$ \| L \( 1 - w \, overline(psi_u^(*)) \) \| lt.double U^epsilon.alt $

 with any prescribed small power. For this row on the displayed dynamic region,
   define $cal(B)_i$ by its preceding slot sum, interpreting each $cal(B)_p$ as $G_p \/ H_p$,
   with $G_p$ from Equation (2.43). The stated choice of $P_0$ makes $H_p eq.not 0$ there for every slot prime,
   as proved at the start of the proof. This statement asserts individual continuation only on this dynamic
   region. Define the main and error parts of a slot by
$ cal(Q)_i \( u \; z \) = - sum_(p in cal(P)_i \( Z \)) W_i \( q_p \/ P_i \) q_p^(z - 1)
  overline(chi_p \( u \)) \, wide cal(D)_i \( u \) = cal(B)_i \( u \; x \, w \, z \) - cal(Q)_i \( u \; z \) . $

 Then, for every subset $I$ of the slots and the same points $w in cal(W)_u$,
#[#set math.equation(numbering: n => "(2.50)")
 $ lr(|L^S \( w \, chi_bullet \( u \) \) product_(i in I) cal(D)_i \( u \)|) lt.double
   U^(a - 1 \/ 2 + O \( e \) + epsilon.alt) \( 3 + T_1 \)^C product_(i in I)
   P_i^(z_r - 1 \/ 2 + O \( e \) + epsilon.alt) . $ <old-eq:5.13e>]

 The main parts retain the physical row, all zero masks, and the fixed identity-ray restriction.
   In particular, their central normalization is
$ cal(Q)_i \( u \; z \) = -
  P_i^(z - 1 \/ 2)
  (P_i^(- 1 \/ 2) sum_(p in cal(P)_i \( Z \)) overline(chi_p \( u \)) W_i \( q_p \/ P_i \) \( q_p \/ P_i \)^(z - 1)) . $

 At the same points $w in cal(W)_u$, and on this dynamic region only, the full correction has the finite decomposition
#[#set math.equation(numbering: n => "(2.51)")
 $ frak(H)_(eta \, u \, Z) = cal(H)_(eta \, u) product_(i = 1)^K \( cal(Q)_i + cal(D)_i \) =
   cal(H)_(eta \, u) sum_(I subset.eq { 1 \, dots.h \, K }) product_(i in I) cal(D)_i product_(i in.not I)
   cal(Q)_i . $ <eq:dynamic-compensated-decomposition>]

]
] <prop:probe-errors>

#proof[
  In this region $theta.alt = \( - w_r \)_(+) lt.eq 6 e$. The estimates in the proof of Lemma 26 sharpen to $H_p -
    1 = O \( Q^(- 1 - 10 e) \)$ for $p divides.not u$ and $H_p - 1 = O \( Q^(- 10 e) \)$ for $p divides u$.
    Increase the fixed $P_0$ so that $\| H_p - 1 \| < 1 \/ 2$ for all these primes.
    The holomorphic factor $G_p$ in Equation (2.43), divided by $H_p$,
    now defines $cal(B)_p$ throughout this region. It is $H_p$, not the possibly singular raw factor $P_p$,
    that is bounded away from zero when $w_r < 0$.
  Consequently the tuple sum in Equation (2.44) factors as $cal(H)_(eta \, u) product_i
    cal(B)_i$ on this dynamic region. Substituting $cal(B)_i = cal(Q)_i + cal(D)_i$ proves Equation (2.51).
    This factorization is not used to continue the correction outside the present region.
  For $p divides.not u$, Equation (2.49) and the estimate for $cal(E)_p$ give
  $ \| H_p \( cal(B)_p + overline(chi_p \( u \)) \) \| lt.double Q^(- x_r + 2 theta.alt) +
    Q^(- 6 z_r + 2 theta.alt) + Q^(4 - 5 x_r - 6 z_r + 2 theta.alt) +
    Q^(1 - w_r - 6 z_r + theta.alt) lt.double Q^(- 51 \/ 100) . $
  The four exponents are bounded respectively by $- a - 4 e$, $- 51 \/ 25 + 12 e$, $49 \/ 25 - 5 a - 68 e$,
    and $a - 51 \/ 25 + 12 e$. Division by the bounded $H_p$ preserves this estimate.
    The number of primes in a slot is $O \( P_i \)$ by the ideal count;
    hence its total contribution from $p divides.not u$, including $Q^(z - 1)$,
    is $O \( P_i^(z_r - 51 \/ 100 + epsilon.alt) \)$.
  For $p divides u$ there are only divisor-many possible labels.
    A monomial in $cal(E)_p$ is multiplied by $Q^(z - 1 + x)$ in $Q^(z - 1) cal(B)_p$,
    so after separating $Q^z$ its exponent is $x_r - 1$ plus the exponent of that monomial.
    For the non-tail boundary terms of the six-valuation table, these exponents at $e = 0$ are
  $ j & 1 & 2 & 3 & 4 & 5\
 & a - 2 & 1 \/ 2 - 2 a & - a \, med 1 - 3 a & 1 \/ 2 - 2 a & 2 - 5 a . $
  At positive $e$ their changes are respectively $+ 6 e \, - 32 e \, \( - 26 e \, - 48 e \) \, - 42 e \, - 80 e$.
    They are all strictly below $- 1 \/ 2$ in the stated range. The common $R$ term is smaller still:
    its exponent after separating $Q^z$ is at most $49 \/ 25 - 1 - 5 a - 80 e < - 1 \/ 2$.
    Additional valuation pairs and $m$ values have ratios $\| R \| lt.eq Q^(- 11 \/ 10)$ and $\| V \| =
    Q^(- 51 \/ 25)$, so their geometric sums preserve these bounds.
    The strict second-family term with an additional $V$ is also smaller than $Q^(- 1 \/ 2)$ after this normalization.
  The sole remaining term is the strict $\( e_0 \, l \, k \, m \) = \( 1 \, 0 \, 1 \, 0 \)$ term,
    which occurs for $j gt.eq 2$ and is $- eta \( p \) \( Q - 1 \) Q^(- x - w)$.
    Its exponent after separating $Q^z$ is $- w_r$. The explicit rescaling term $-
    Q^(- w)$ has exponent after separating $Q^z$ $- 1 - w_r < - 1 \/ 2$, so it needs no further estimate.
  Let $frak(f)_u$ be the conductor of $psi_u^(*)$. Write $u = epsilon.alt_u product_(p divides u) p^(j_p)$,
    with $epsilon.alt_u$ a unit. For primary $n$ coprime to $u S$, reciprocity gives
  $ chi_n \( u \) = epsilon.alt_u^(\( q_n - 1 \) \/ 6) product_(p divides u) cal(R) \( p \, n \)^(j_p)
    chi_p \( n \)^(j_p) . $
  The unit exponent is read modulo six. The prime formula extends to composite $n$:
    when $A equiv B equiv 1 med \( mod med 6 \)$,
  $ frac(A B - 1, 6) equiv frac(A - 1, 6) + frac(B - 1, 6) med \( mod med 6 \) . $
  Thus the unit factor depends only on $q_n$ modulo $36$, and the $cal(R)$ product depends only on $n$ modulo $4$.
    Together with the multiplicativity of $cal(R)$ and the local symbols,
    the displayed norm congruence makes the right side multiplicative on integral ideals prime to $6 u$;
    extend it to their fractional ideal group. A generator congruent to one modulo $\( 36 \)
    "rad" \( u \)$ is already primary and makes every displayed factor one.
    This character therefore has a ray presentation with that fixed $2 \, 3$ modulus times $"rad" \( u \)$.
    It agrees with the Kummer character $chi_bullet \( u \)$ of Lemma 5 on ideals avoiding $S$.
    These characters induce the same primitive character: in the principal ideal ring $cal(O)$,
    the Chinese remainder theorem supplies a representative avoiding the additional finite set $S$ in every ray
    class of a common modulus. At a good prime $p divides u$,
    hold the fixed class and all other good residues at one and vary the residue modulo $p$ by the Chinese
    remainder theorem. The remaining local character $chi_p^(j_p)$ has exact order $6 \/ gcd \( 6 \, j_p \) > 1$.
    Its conductor exponent at $p$ is therefore exactly one: the displayed ray modulus has only the first power of
    $p$, and the character cannot descend to a modulus omitting $p$.
    This is a local assertion; the ideal character may still need the fixed normalization modulus at $2 \, 3$.
  It follows that, for any set $J_0$ of distinct selected ramified labels,
  #[#set math.equation(numbering: n => "(2.52)")
   $ q_(frak(f)_u) lt.double_S q_("rad" \( u \)) lt.eq q_u product_(p in J_0) q_p^(- \( j_p - 1 \)) . $ <old-eq:5.13d>]
  The functional equation for the primitive numerator [11] Equation (1.1), the assumed reflected bound,
    and Stirling give a cost $q_(frak(f)_u)^(A_(*)) U^epsilon.alt \( 3 + T_1 \)^C$, where
  $ A_(*) = 1 \/ 2 - w_r = a - 1 \/ 2 + 6 e > 0 . $
  At a selected $p divides u$ the primitive character already has value zero,
    so restoring the original local factor there multiplies by exactly one.
    The remaining deleted Euler factors have radical $O_S \( U \)$ and cost at most $U^(6 e + epsilon.alt)$,
    because $w_r gt.eq - 6 e$.
  Expand a product of error slots into their coprime-prime terms, their already bounded ramified terms,
    and their strict ramified terms. For each fixed tuple in this triangle expansion,
    let $J_0$ be precisely its strict ramified labels. They are distinct because the slot supports are disjoint.
    Apply the single inequality Equation (2.52) to this entire $J_0$ before summing the labels.
    The numerator together with these local factors, including $q_p^(z - 1)$ at each selected prime, is then bounded by
  $ U^(A_(*) + 6 e + epsilon.alt) \( 3 + T_1 \)^C product_(p in J_0) q_p^(z_r - w_r - \( j_p - 1 \) A_(*)) lt.eq
    U^(a - 1 \/ 2 + 12 e + epsilon.alt) \( 3 + T_1 \)^C product_(p in J_0) q_p^(z_r - 1 \/ 2) \, $
  because $j_p gt.eq 2$ and $- w_r - A_(*) = - 1 \/ 2$. Thus different selected labels use different factors of
    the conductor deficit, and the bounds hold simultaneously.
    Summing the divisor-many ramified labels costs $U^epsilon.alt$,
    while the coprime labels have the stronger exponent $z_r - 51 \/ 100$. This proves Equation (2.50).
  This argument uses triangle only on error labels. It never changes the physical row or the coefficients and
    masks in any main slot. The tuple-independent factor $cal(H)_(eta \, u)$ separately costs $U^epsilon.alt$ by
    Lemma 26. Relative to the central scale $P_i^(z_r - 1 \/ 2)$ of a main slot,
    an error slot thus has no positive amplitude exponent in the later row count. ◻
]

======= 2.5.2.1 The principal local factor. <the-principal-local-factor.>

In the second Euler region of Lemma 26, take $u = 1$ and $p in 1_T$.
  Then $v = 1$ in Equation (2.49), and $H_p$ is bounded away from zero after the same fixed enlargement of $P_0$.
  For this principal row on this region, define $cal(B)_p =
  G_p \/ H_p$ and define $cal(B)_i$ by the same slot sum as above.
  The lower bound and the disjoint supports give the separate principal factorization

#[#set math.equation(numbering: n => "(2.53)")
 $ frak(H)_(eta \, 1 \, Z) \( x \, w \, z \) = cal(H)_(eta \, 1) \( x \, w \, z \) product_(i = 1)^K
   cal(B)_i \( 1 \; x \, w \, z \) wide upright("in the second Euler region") . $ <eq:principal-slot-factorization>]

This does not extend the central main/error decomposition beyond its stated dynamic region.
  The four error exponents are now

$ - x_r \, wide - 6 z_r \, wide 4 - 5 x_r - 6 z_r \, wide 1 - w_r - 6 z_r . $

Each is at most $- 7 \/ 8$ in that region. Hence the principal multiplier satisfies

#[#set math.equation(numbering: n => "(2.54)")
 $ cal(B)_p = - 1 + O \( Q^(- 7 \/ 8) \) \, $ <eq:principal-local-approximation>]

uniformly in the imaginary parts and the target unit phase.
  This is the local estimate used to normalize the principal residue.

It also gives the absolute principal correction required by the shared residue estimate.
  Indeed $G_p = H_p cal(B)_p = O \( 1 \)$ here, and the unselected product has a bounded positive majorant by the
  second-region version of Equation (2.46). Ideal counting in each annular slot therefore gives,
  on every fixed real box in the second Euler region and uniformly in all imaginary parts,

#[#set math.equation(numbering: n => "(2.55)")
 $ \| frak(H)_(eta \, 1 \, Z) \( x \, w \, z \) \| lt.eq sum_(\( p_i \) in product_i cal(P)_i \( Z \)) product_i
   #scale(x: 120%, y: 120%)[\[] \| W_i \( q_(p_i) \/ P_i \) \| q_(p_i)^(z_r - 1) \| G_(p_i) \|
   #scale(x: 120%, y: 120%)[\]] product_(p in.not S\
p in.not { p_1 \, dots.h \, p_K }) \| H_p \| lt.double product_i P_i^(z_r) =
  Z^(ell z_r) . $ <eq:principal-local-tuple-bound>]

This uses the separate principal-row lower bound only to obtain the local approximation;
  it asserts no nonvanishing of a general $H_p$.

===== 2.5.3 Absolute bounds for the remaining contour lines <absolute-bounds-for-the-remaining-contour-lines>

The dynamic decomposition is not available on every contour used by the shared analytic estimates.
  The following bounds instead retain each selected factor $G_p$ before taking absolute values.

#thm([Lemma 2.12.])[
  (Absolute local tuple bounds).  #emph[Let $Z gt.eq 2$, and let $u$ be a nonzero sixth-power-free row with
    $\( u \, S \) = 1$ and $q_u asymp U gt.eq 1$, with fixed comparison constants.
    Retain the fixed physical slot system of Section 1. The following bounds are uniform in all imaginary parts
    and unit phases.]
  + #emph[On
$ x_r = beta_(*) + e \, wide w_r = 1 \/ 2 \, wide z_r = 17 \/ 50 \, wide 0 < e lt.eq 10^(- 3) \, $

 one has $G_p = O \( 1 \)$ at selected primes $p divides.not u$ and $G_p lt.double
   Q^(1 \/ 2)$ at selected primes $p divides u$.]
  + #emph[For every fixed $z_oo > 2$, on
$ x_r = w_r = 2 \, wide z_r = z_oo \, $

 one has $G_p = O_(z_oo) \( 1 \)$ at every selected prime.]
  #emph[In either case the positive sum over the full selected tuples satisfies
#[#set math.equation(numbering: n => "(2.56)")
 $ sum_(\( p_i \) in product_i cal(P)_i \( Z \)) product_i #scale(x: 120%, y: 120%)[\[] \|
   W_i \( q_(p_i) \/ P_i \) \| q_(p_i)^(z_r - 1) \| G_(p_i) \| #scale(x: 120%, y: 120%)[\]] product_(p in.not S\
p in.not { p_1 \, dots.h \, p_K }) \| H_p \| lt.double_epsilon.alt U^epsilon.alt product_i P_i^(z_r) .
  $ <eq:absolute-local-tuple-bound>]

 The constants may depend on the fixed data, $e$, and, in the second case, $z_oo$, but not on $Z \,
   u$ or the imaginary parts. These estimates remain valid at zeros of $P_p$ or $H_p$.]
] <lem:compensated-absolute-local-bounds>

#proof[
  Both sets of lines lie in the first Euler region with $epsilon.alt_0 = 3 \/ 8$.
    Its primewise defect estimates give $H_p = O \( 1 \)$, while Equation (2.46) bounds the positive product of
    all unselected factors by $O_epsilon.alt \( U^epsilon.alt \)$.
  Consider first $x_r = beta_(*) + e$, $w_r = 1 \/ 2$, and $z_r = 17 \/ 50$.
    For a selected $p divides.not u$, Equation (2.49) gives
  $ \| G_p + overline(chi_p \( u \)) H_p \| lt.double Q^(- x_r) + Q^(- 6 z_r) + Q^(4 - 5 x_r - 6 z_r) +
    Q^(1 - w_r - 6 z_r) . $
  The four exponents are at most $- 7 \/ 8 - e \, - 51 \/ 25 \, - 483 \/ 200 - 5 e \, - 77 \/ 50$, respectively.
    Consequently $G_p = O \( 1 \)$ off $u$, without division by $H_p$.
  For a selected $p divides u$, one has $W = D = 0$ and $cal(E)_p = P_p^(*)$. Equation (2.43) becomes
  $ G_p = overline(eta \( p \)) Q^x \( 1 - V \) cal(E)_p - Q^(- w) H_p . $
  After multiplication by $Q^(x_r)$, the strict term of the local table has exponent at most $1 - w_r = 1 \/ 2$;
    for $j = 1$ it also contains the factor $V$. The exponents of the boundary terms $J_j$, in order $j = 1 \,
    dots.h \, 5$, are
  $ - 1 / 2 \, quad 3 / 2 - 2 x_r \, quad (3 / 2 - 2 x_r \, thin 2 - 3 x_r) \, quad 2 - 3 x_r \, quad 3 - 5 x_r . $
  They are bounded above by $- 1 \/ 2 \, - 1 \/ 4 - 2 e \, \( - 1 \/ 4 - 2 e \, - 5 \/ 8 - 3 e \) \, - 5 \/ 8 -
    3 e \, - 11 \/ 8 - 5 e$, respectively. The common $R$ term has exponent $4 - 5 x_r - 6 z_r lt.eq -
    483 \/ 200 - 5 e$. All further terms in the geometric families decrease these powers, since $\| R \| lt.eq
    Q^(- 329 \/ 100 - 6 e)$ and $\| V \| = Q^(- 51 \/ 25)$. Finally $Q^(- w) H_p = O \( Q^(- 1 \/ 2) \)$.
    Hence $G_p lt.double Q^(1 \/ 2)$ on $u$, also at a zero of $H_p$.
  The labels dividing $u$ are divisor-many, while a slot contains $O \( P_i \)$ ideals. Its positive sum is therefore
  #[#set math.equation(numbering: n => "(2.57)")
   $ sum_(p in cal(P)_i \( Z \)) \| W_i \( q_p \/ P_i \) \| q_p^(z_r - 1) \| G_p \| lt.double P_i^(z_r) +
     U^epsilon.alt P_i^(z_r - 1 \/ 2) lt.double U^epsilon.alt P_i^(z_r) . $ <eq:small-line-positive-slot>]
  Using the positive majorant for the unselected product and distributing the requested $epsilon.alt$ among the
    fixed number of slots proves Equation (2.56) on the first lines.
  Now fix $x_r = w_r = 2$ and $z_r = z_oo > 2$. For a selected prime off $u$,
    the four exponents in Equation (2.49) are $- 2 \, - 6 z_oo \, - 6 - 6 z_oo \, - 1 - 6 z_oo$, so $G_p =
    O_(z_oo) \( 1 \)$. On $u$, the strict term after multiplication by $Q^(x_r)$ has exponent at most $1 - w_r = -
    1$. The boundary exponents are $- 2 \, - 5 \/ 2 \, \( - 4 \, - 4 \) \, - 11 \/ 2 \, - 7$,
    the common $R$ exponent is $- 6 - 6 z_oo$, and $\| R \| = Q^(- 8 - 6 z_oo)$, $\| V \| = Q^(- 6 z_oo)$.
    The rescaling term is $O \( Q^(- 2) \)$. Thus $G_p = O_(z_oo) \( 1 \)$ on $u$ as well.
    A positive slot sum is consequently $O_(z_oo) \( P_i^(z_oo) \)$.
    Together with Equation (2.46), this proves Equation (2.56) on the second lines. ◻
]

Equation (2.48) supplies the full high representation of the physical function just bounded on the low side.
  Proposition 51 controls the error factors jointly with the numerator,
  and Lemma 52 supplies the bounds on the remaining contour lines.
  The main factors are the prime polynomials displayed in Proposition 51.
  To count rows on which those factors and a detector witness are large,
  we next prove the inverse and fourth-moment estimates used in Section 8.

==== 2.6 The inverse moment with prime factors <sec:inverse>

We now bound an inverse Dirichlet polynomial multiplied by independently weighted prime sums.
  The estimate applies to the inverse witness in Section 6 together with selected main factors from the local
  compensation. Its proof uses the completed row energy of Section 2.3.
  A final amplification gives an unmarked estimate on sixth-power-free rows at longer column lengths.

===== 2.6.1 Statement of the marked estimate <statement-of-the-marked-estimate>

Let $nu$ be a fixed finite-order ray character whose full zero-extended defining modulus has prime support in $S$.
  This entire presentation belongs to the fixed arithmetic datum;
  a locally frozen moving zero support is instead retained as a puncture whose radical is included in the explicit
  norm bound below. Fix one sign $epsilon_chi in { 1 \, - 1 }$, and set

$ psi_u \( n \) = nu \( n \) chi_n \( u \)^(epsilon_chi) . $

The only masks in this definition are the fixed exclusions and the zero extension of $chi_n \( u \)$.
  For a smooth annular function $W$, define

$ M_u \( Z^r \; W \) = Z^(- r \/ 2) sum_n mu \( n \) psi_u \( n \) W \( q_n \/ Z^r \) . $

For a fixed finite set $I$ of slots, let $cal(P)_i$ be disjoint sets of primes outside $S$,
  with $q_p asymp Z^(z_i)$ for $p in cal(P)_i$. The sets and the coefficients $a_i \( p \)$ are independent of
  $u$, and $\| a_i \( p \) \| lt.eq 1$. Given fixed smooth annular functions $W_i$, put

$ Q_u = product_(i in I) Z^(- z_i \/ 2) sum_(p in cal(P)_i) a_i \( p \) psi_u \( p \) W_i \( q_p \/ Z^(z_i) \) \,
  wide z = sum_(i in I) z_i . $

The empty product is one. A fixed finite sum of whole products $M_u Q_u$ is also allowed by triangle inequality,
  provided each summand uses one common $nu$ in its inverse and all of its slots.

#thm([Lemma 2.13.])[
  (Marked inverse moment).  #emph[Fix bounded ranges for the nonnegative parameters $m \, r \, z_i$,
    a bound for $\| I \|$, and positive constants $c_1 \, c_2$. Suppose
$ r + 2 z lt.eq m - c_1 \, wide 2 r + 8 z lt.eq 3 m - c_2 . $

 Then, for every $epsilon.alt > 0$,
#[#set math.equation(numbering: n => "(2.58)")
 $ sum_(u in cal(O)\
0 < q_u lt.double Z^m) \| M_u \( Z^r \; W \) Q_u \|^2 lt.double Z^(m + epsilon.alt) . $ <old-eq:4.1>]

 The implied constant may depend on the fixed arithmetic data, $c_1 \, c_2$, the bounded parameter ranges,
   and finitely many smooth seminorms of the tests, but is uniform in the prime supports and their bounded
   coefficients. The assertion holds for either common sign $epsilon_chi$,
   and for every subcollection of the slots. Norm twists of the tests have a fixed polynomial cost in their
   heights. There is no lower bound on the individual slot lengths other than the existence of their stated prime
   supports, and no mesh condition on those lengths.]
] <lem:marked>

The proof passes through the canonical family defined next,
  in which a fourth-power residue symbol is averaged over an additional squarefree ideal.
  Lemma 54 is proved by a terminal application of Lemma 47 and a recursive step using two masked Poisson
  transformations. After the principal contributions and tails have been handled,
  the retained part is bounded in terms of new admissible sums of that family with a shorter row range.
  A separate initialization using one masked Poisson transformation then deduces Lemma 53,
  and the final subsection gives its longer unmarked consequence for sixth-power-free rows.

===== 2.6.2 The canonical estimate <the-canonical-estimate>

Use the fixed puncture, squarefree coefficient, row character, and product-form mark defined in Section 2.3.
  The additional squarefree label is now averaged, with a divisor-bounded weight depending on that label alone.

The following is the statement closed by the two Poisson transformations.
  Its puncture bound is part of the hypothesis, because a frozen moving modulus cannot be treated as part of the
  fixed arithmetic data. For the recursive Poisson large-sieve framework, compare [16] Section 2, [17] Section 4,
  and [13] Sections 4–7; the present marked recursion is proved below.

#thm([Lemma 2.14.])[
  (Canonical marked estimate).  #emph[Fix bounded nonnegative ranges for $M \, N \, V \, z_0$,
    a bound for the number of slots, and $c_(*) > 0$. Let $f$ range over squarefree ideals outside $S$ with $q_f
    asymp Z^V$. Let $w$ be a nonnegative function of $f$ alone satisfying $w \( f \) lt.eq
    C d_(cal(O)) \( f \)^C$ for one fixed $C gt.eq 1$. Neither $C$ nor the choice of $w$ depends on $Z$,
    the current rows, or any other averaged variable. The implied constant below may depend on $C$,
    but is uniform over all $w$ satisfying this fixed bound. Let $nu$ be a fixed multiplicative finite ray
    character whose full zero-extended defining modulus has prime support in $S$, and let $rho \( n \) =
    1_(\( n \, frak(r)_rho \) = 1)$ be a fixed puncture. Both are independent of $k \, f$.
    Let $frak(d)$ have the product form in Equation (2.15), with disjoint fixed prime lists of total length at
    most $z_0$ and bounded coefficients independent of $k \, f$.
    No other row-dependent column coefficient or puncture is allowed.
    There is no additional residual coefficient $b \( n \)$, even one independent of $k \, f$:
    arbitrary bounded weights are permitted only as the stated product of individual prime-slot coefficients.]
  #emph[Put $F_0 = N + V$. Suppose
#[#set math.equation(numbering: n => "(2.59)")
 $ q_(frak(r)_rho) lt.eq Z^(F_0 - M - z_0 - c_(*)) \,\
3 M + 6 z_0 + c_(*) lt.eq 4 F_0 . $ <eq:invariant>]

 For every smooth annular $W$ and every $epsilon.alt > 0$, define
#[#set math.equation(numbering: n => "(2.60)")
 $ cal(E) =  & Z^(- V) sum_f w \( f \) sum_(k in cal(O)\
0 < q_k lt.double Z^M) \| Z^(- N \/ 2) sum_(n med upright("sf")) macron(alpha) \( n \) gamma_2 \( n \) nu \( n \)
  rho \( n \)\
 & #h(24mm)  times chi_n \( k \) chi_n \( f \)^4 frak(d) \( n \) W \( q_n \/ Z^N \)
   #scale(x: 300%, y: 300%)[\|]^2 . $ <eq:canonical-energy>]

 Then $cal(E) lt.double Z^(F_0 + epsilon.alt)$. The constant is uniform in the moving moduli and the frozen outer
   ideals within the stated ranges. It depends on finitely many smooth seminorms and has a fixed polynomial
   dependence on separated norm-twist heights. The same conclusion holds for all subcollections of the slots with
   the original cap $z_0$, including the empty collection.]
] <lem:canonical-moment>

The reflected energy in Section 2.3 supplies the terminal estimate for this family.
  The remaining ranges will be reduced to the same family with shorter rows.
  Before the two Poisson transformations, we give the common analytic rule for propagating smooth seminorm and
  height orders through the finite induction.

===== 2.6.3 Finite propagation of seminorm and height orders <sec:moment-propagation>

We use the following abstract statement about a finite sequence of estimates.
  It does not assert that any particular arithmetic reduction has its hypotheses.
  Its purpose is to state exactly which uniform bounds on transformed profiles and Fourier coefficient measures
  suffice to choose all internal derivative orders before an external height cutoff.

Write $chevron.l bold(t) chevron.r = 1 + \| bold(t) \|$. Let a finite rooted directed graph have no directed
  cycles, and let every directed path have at most $D$ edges.
  At each vertex $v$ let $cal(N)_v \( Z \, bold(w) \, bold(t) \)$ be a nonnegative quantity, where $Z gt.eq 1$,
  $bold(w)$ is a fixed finite tuple of annular profiles, and $bold(t)$ is a finite-dimensional height vector.
  The profile dimensions, supports, and height dimensions may depend on $v$, but are fixed throughout the graph.
  Additional labels are allowed in these quantities; every bound below is required uniformly in those labels.

#thm([Lemma 2.15.])[
  (Finite seminorm propagation).  #emph[Suppose that at each vertex there is a terminal bound
$ cal(T)_v \( Z \, bold(w) \, bold(t) \) lt.eq C_v Z^(a_v) p_(j_v) \( bold(w) \)^(b_v) chevron.l bold(t)
  chevron.r^(h_v) $

 with fixed real $a_v$ and finite nonnegative $j_v \, b_v \, h_v$. Suppose also that
$ cal(N)_v \( Z \, bold(w) \, bold(t) \) lt.eq  & cal(T)_v \( Z \, bold(w) \, bold(t) \)\
 & + sum_(e : v arrow.r v') Z^(a_e) integral_(bb(R)^(d_e)) \| K_e \( Z \, bold(w) \, bold(t) \; bold(xi) \) \|
   cal(N)_(v') #scale(x: 120%, y: 120%)[\(] Z \, bold(W)_e \, A_e bold(t) +
   B_e bold(xi) #scale(x: 120%, y: 120%)[\)] thin d bold(xi) \, $

 where $A_e \, B_e$ are fixed bounded linear maps and $bold(W)_e =
   bold(W)_e \( Z \, bold(w) \, bold(t) \, bold(xi) \)$ is the child profile tuple. Empty edge sums are allowed.
   Assume the following two bounds for each edge.]
  #emph[For every fixed $j$ there are finite nonnegative numbers $m_e \( j \) \, b'_e \( j \) \,
    c'_e \( j \)$ and a constant $C_(e \, j)$ such that
$ p_j \( bold(W)_e \) lt.eq C_(e \, j) p_(m_e \( j \)) \( bold(w) \)^(b'_e \( j \)) chevron.l bold(t)
  chevron.r^(c'_e \( j \)) chevron.l bold(xi) chevron.r^(c'_e \( j \)) . $

 For every fixed $H gt.eq 0$ there are finite nonnegative numbers $ell_e \( H \) \, b_e \( H \) \,
   c_e \( H \)$ and a constant $C_(e \, H)$ such that
$ integral_(bb(R)^(d_e)) \| K_e \( Z \, bold(w) \, bold(t) \; bold(xi) \) \| chevron.l bold(xi) chevron.r^H thin d
  bold(xi) lt.eq C_(e \, H) p_(ell_e \( H \)) \( bold(w) \)^(b_e \( H \)) chevron.l bold(t) chevron.r^(c_e \( H \)) . $

 The seminorm indices may be rounded up to integers. All these constants and indices are uniform in $Z$ and the
   additional labels; the exponents $a_v \, a_e$ are fixed real numbers independent of the requested seminorm and
   height orders.]
  #emph[Then there are finite $J \, B \, H$ and $C$ such that, at the root $v_0$,
$ cal(N)_(v_0) \( Z \, bold(w) \, bold(t) \) lt.eq C Z^E p_J \( bold(w) \)^B chevron.l bold(t) chevron.r^H \, wide
  E = max_(v_0 arrow.r dots.h.c arrow.r v) (a_v + sum_(e upright(" on the path")) a_e) . $

 The indices $J \, B \, H$ can be selected backward through the at most $D$ stages.
   In particular they are fixed before any restriction $\| bold(t) \| lt.eq T_1 = Z^tau$ is imposed.]
  #emph[The same conclusion holds for a finite product of children in an integral.
    Precisely, an edge term may instead have the form
$ Z^(a_e) integral_(bb(R)^(d_e)) \| K_e \| product_(r = 1)^(r_e) cal(N)_(v_(e \, r)) #scale(x: 120%, y: 120%)[\(]
  Z \, bold(W)_(e \, r) \, A_(e \, r) bold(t) + B_(e \, r) bold(xi) #scale(x: 120%, y: 120%)[\)]^(theta_(e \, r))
  thin d bold(xi) \, $

 where $r_e gt.eq 1$ is a fixed integer and $theta_(e \, r) gt.eq 0$ are fixed,
   all children have smaller remaining depth, and each child profile satisfies its own version of the stated
   profile bound. The joint coefficient measure satisfies the same weighted bound.
   In this case define the norm exponent recursively by
$ E_v = max {a_v \, med max_e (a_e + sum_(r = 1)^(r_e) theta_(e \, r) E_(v_(e \, r)))} . $

 The conclusion holds with $E = E_(v_0)$. This form includes the square roots of two nonnegative child estimates
   arising from Cauchy–Schwarz.]
] <lem:finite-seminorm-propagation>

#proof[
  At a terminal vertex the assertion is its stated bound. Suppose a child has already been bounded by $C Z^(E')
    p_(J') \( bold(W)_e \)^(B') chevron.l A_e bold(t) + B_e bold(xi) chevron.r^(H')$. Since the linear maps are bounded,
  $ chevron.l A_e bold(t) + B_e bold(xi) chevron.r^(H') lt.double_e chevron.l bold(t) chevron.r^(H') chevron.l
    bold(xi) chevron.r^(H') . $
  The child-profile bound adds the power $B' c'_e \( J' \)$ to each of these two height exponents and replaces its
    profile factor by $p_(m_e \( J' \)) \( bold(w) \)^(B' b'_e \( J' \))$.
    Use the coefficient-measure bound with $H_e = H' + B' c'_e \( J' \)$. The contribution of this edge is at most
  $ C_e Z^(a_e + E') p_(max { m_e \( J' \) \, ell_e \( H_e \) }) \( bold(w) \)^(B' b'_e \( J' \) + b_e \( H_e \))
    chevron.l bold(t) chevron.r^(H_e + c_e \( H_e \)) . $
  Every displayed index is finite. Take the maximum of these indices and of the terminal indices over the finitely
    many outgoing edges, increasing the profile exponent when necessary because $p_j \( bold(w) \) gt.eq 1$.
    This proves the parent bound with exponent equal to the maximum path exponent through that vertex.
    Reverse induction on the acyclic graph completes the proof.
    None of these choices mentions an external cutoff or a late derivative order.
  For the product form, insert the already proved bound of each child and raise it to $theta_(e \, r)$.
    The total power of $chevron.l bold(xi) chevron.r$ that the coefficient measure must integrate is
  $ H_e = sum_(r = 1)^(r_e) theta_(e \, r) #scale(x: 120%, y: 120%)[\(] H_r +
    B_r c'_(e \, r) \( J_r \) #scale(x: 120%, y: 120%)[\)] . $
  The powers of the parent profile and of $chevron.l bold(t) chevron.r$ are the corresponding finite sums,
    followed by the single coefficient-measure bound at $H_e$.
    The powers of $Z$ add as in the displayed recurrence for $E_v$.
    Taking maxima over the finitely many terms proves this extension by the same reverse induction. ◻
]

#thm([Corollary 2.16.])[
  (Indexed finite propagation).  #emph[In Lemma 55, let $bold(ell)$ denote any admissible length and outer labels
    at a vertex $v$, and let $Phi_v \( bold(ell) \)$ be its desired norm exponent.
    Suppose the terminal bound, after division by $Z^(Phi_v \( bold(ell) \))$,
    has the form in that lemma with a fixed exponent $delta_v$.
    An edge may be indexed by a $Z$-dependent family $Gamma_e$ with a nonnegative measure $nu_e$, and may have the form
$ integral_(Gamma_e) integral_(bb(R)^(d_e)) Z^(a_e \( bold(ell) \, gamma \)) \| K_(e \, gamma) \|
  product_(r = 1)^(r_e) cal(N)_(v_(e \, r)) #scale(x: 120%, y: 120%)[\(] Z \, bold(ell)_(e \, r) \,
  bold(W)_(e \, r) \, A_(e \, r) bold(t) + B_(e \, r) bold(xi) #scale(x: 120%, y: 120%)[\)]^(theta_(e \, r)) thin
  d bold(xi) thin d nu_e \( gamma \) \, $

 where the child labels $bold(ell)_(e \, r)$ may depend on $bold(ell) \, gamma$. Assume uniformly in those labels that
#[#set math.equation(numbering: n => "(2.61)")
 $ a_e \( bold(ell) \, gamma \) + sum_r theta_(e \, r) Phi_(v_(e \, r)) \( bold(ell)_(e \, r) \) -
   Phi_v \( bold(ell) \) lt.eq delta_e \, $ <eq:indexed-exponent-defect>]

 with fixed $delta_e$, and that the child-profile bounds of the lemma hold.
   Assume also that for every fixed $H gt.eq 0$,
#[#set math.equation(numbering: n => "(2.62)")
 $ integral_(Gamma_e) integral_(bb(R)^(d_e)) \| K_(e \, gamma) \| chevron.l bold(xi) chevron.r^H thin d bold(xi)
   thin d nu_e \( gamma \) lt.eq C_(e \, H) Z^(delta_e^(upright("mass")))
   p_(ell_e \( H \)) \( bold(w) \)^(b_e \( H \)) chevron.l bold(t) chevron.r^(c_e \( H \)) \,
   $ <eq:indexed-coefficient-measure>]

 where $delta_e^(upright("mass"))$ is fixed independently of $H$.
   When the quantities are squared Hilbert-space row norms obtained by separating a profile,
   this hypothesis must use the coefficient measure common to those rows.
   There need only be finitely many edge types at each of the finitely many depths;
   the cardinalities of the $Gamma_e$ may vary with $Z$.]
  #emph[Then $cal(N)_v \/ Z^(Phi_v \( bold(ell) \))$ has the conclusion of Lemma 55, uniformly in $bold(ell)$,
    with terminal exponents $delta_v$ and edge exponents $delta_e + delta_e^(upright("mass"))$.
    In particular all required seminorm and height orders are finite and independent of an external cutoff.]
] <cor:indexed-seminorm-propagation>

#proof[
  Set $overline(cal(N))_v = Z^(- Phi_v \( bold(ell) \)) cal(N)_v$.
    Substitution in an edge and Equation (2.61) bound its norm power by $Z^(delta_e)$ times the product of the
    normalized children. Insert their inductive bounds. As in the product proof of Lemma 55,
    the required coefficient moment is
  $ H_e = sum_r theta_(e \, r) #scale(x: 120%, y: 120%)[\(] H_r +
    B_r c'_(e \, r) \( J_r \) #scale(x: 120%, y: 120%)[\)] \, $
  which is finite and independent of $gamma$. Equation (2.62) at this order contributes
    $Z^(delta_e^(upright("mass")))$ and only finite profile and height orders.
    Backward induction over the finite edge types therefore gives exactly the stated normalized recurrence.
    A label averaged inside a child remains inside that child throughout this argument;
    it is not a second integration variable of $nu_e$. ◻
]

We make explicit how discrete labels are normalized in this corollary.
  After the relevant weighted Cauchy inequality, suppose a nonnegative outer measure satisfies
  $sum_(gamma in Gamma) w_gamma lt.eq C Z^(c + epsilon.alt)$,
  with fixed $c$ and $epsilon.alt$ selected before the height orders.
  For a per-label prefactor $Z^(a_(upright("raw")))$ common on the block, put

$ d nu_Gamma \( gamma \) = Z^(- c) sum_(gamma in Gamma) w_gamma thin delta_gamma \, wide
  nu_Gamma \( Gamma \) lt.eq C Z^epsilon.alt . $

Here $delta_gamma$ denotes unit point mass. For nonnegative $B_gamma$ for which the displayed integrals are
  finite, the exact identity is

#[#set math.equation(numbering: n => "(2.63)")
 $ & Z^(a_(upright("raw"))) sum_(gamma in Gamma) w_gamma integral \| K_gamma \( bold(xi) \) \|
   B_gamma \( bold(xi) \) thin d bold(xi)\
 & wide = Z^(a_(upright("raw")) + c) integral_Gamma integral \| K_gamma \( bold(xi) \) \| B_gamma \( bold(xi) \)
   thin d bold(xi) thin d nu_Gamma \( gamma \) . $ <eq:normalized-label-measure>]

Uniform weighted moments of $K_gamma$ now give Equation (2.62) with only the remaining $Z^epsilon.alt$ mass.
  Thus a displayed exponent that already includes the count $c$ must use this normalized measure;
  retaining the unnormalized sum would count the same labels twice.
  The rule concerns weighted mass, not cardinality in addition to that mass.
  It is applied only after any row-dependent eligibility remains within the child or has been removed by a
  nonnegative inequality. Labels still averaged in a child norm are not included in $Gamma$.

There is a separate normalization for a small kernel amplitude.
  The single-profile seminorm $p_j \( w \)$ is homogeneous, whereas $p_j \( bold(w) \) = 1 +
  sum p_j \( w_i \)$ is not. Suppose a joint annular profile on a fixed block satisfies, for a scalar $0 < m_R lt.eq 1$,

$ p_j \( F_R \) lt.eq m_R C_j p_(ell \( j \)) \( bold(w) \)^(b \( j \)) chevron.l bold(t) chevron.r^(h \( j \))
  wide \( j gt.eq 0 \) . $

One may keep $F_R$ in the Fourier coefficient measure, whose weighted $L^1$ norm then contains the factor $m_R$.
  Alternatively, write $F_R = m_R tilde(F)_R$ and put $m_R$ outside that measure.
  If a polynomial or row vector $cal(P) \( F_R \)$ is linear in this whole profile, then

$ cal(P) \( F_R \) = m_R cal(P) \( tilde(F)_R \) \, wide parallel cal(P) \( F_R \) parallel_2^2 =
  m_R^2 parallel cal(P) \( tilde(F)_R \) parallel_2^2 . $

The tuple containing $tilde(F)_R$ has bounded, not small, seminorms.
  A scalar may be removed from a centered difference only when it multiplies the whole difference.
  A kernel occurring once in an already expanded quadratic expression contributes one factor $m_R$,
  not automatically its square. These conventions use either the small measure or the outside scalar, never both.
  If the positive row range will later be enlarged, the scalar and the common profile are first fixed on the
  actual annuli, and the norm inequality containing that scalar is obtained before the enlargement.

Here are sufficient analytic ways to verify the two edge hypotheses.
  Let $m \( bold(y) \)$ be a fixed norm monomial and let $chi$ be a smooth cutoff with compact logarithmic support
  in a product of fixed annuli. Suppose a normalized kernel has Euler bounds

$ \| \( r partial_r \)^j K \( r \) \| lt.eq C_(A \, j) frak(S)_(m \( A \, j \)) min \( 1 \, r^(- A) \) \, $

where $frak(S)_k$ is an increasing family of specified finite input seminorm and polynomial height bounds,
  and $m \( A \, j \)$ is taken nondecreasing in $j$. The product and chain rules give, uniformly for $R > 0$,

#[#set math.equation(numbering: n => "(2.64)")
 $ p_j #scale(x: 120%, y: 120%)[\(] chi \( bold(y) \) K \( R m \( bold(y) \) \) #scale(x: 120%, y: 120%)[\)] lt.eq
   C'_(A \, j) frak(S)_(m \( A \, j \)) min \( 1 \, R^(- A) \) . $ <eq:normalized-kernel-profile>]

Indeed $y_i partial_(y_i)$ acting on the kernel is the fixed exponent of $y_i$ in $m$ times $r partial_r$,
  and $m$ is bounded above and below on the cutoff support. There is no extra factor $R$ from differentiation.
  The same argument preserves a bound with $min \( R^(1 \/ 4) \, 1 \, R^(- A) \)$,
  when those three kernel estimates are available. The decay order $A$ is the same at every requested $j$;
  only the input order and its finite height degree increase.
  For an old window $w \( c m \( bold(y) \) \)$ with $c > 0$,
  Euler derivatives are bounded by the global logarithmic seminorms of $w$ and introduce no power of $c$ depending
  on the derivative order. Normalized real powers such as $y^(- 1 \/ 2)$ obey the same rule.
  Pure twists of normalized norms insert only fixed powers of their heights.

Ordinary radial Fourier seminorms must be used only after the radial scale has been normalized.
  For a fixed annular $w$ in two real dimensions, $f_R \( x \) = w \( R \| x \|^2 \)$ satisfies

$ parallel partial^j f_R parallel_1 = R^(j \/ 2 - 1) parallel partial^j f_1 parallel_1 $

for any fixed directional derivative of order $j$, by $x mapsto sqrt(R) x$.
  Thus an unnormalized shrinking radial test could introduce a scale power depending on $j$.
  Sufficient hypotheses are a fixed-shape radial Schwartz test at its stated row scale,
  or a radial $C_c^oo$ test constant near zero at that scale.
  After normalization, Lemma 11 applies to its fixed transform,
  and moving scale ratios enter only as in Equation (2.64).
  For example $q_u^(- 1 \/ 2) = U_0^(- 1 \/ 2) y^(- 1 \/ 2)$ on $q_u = U_0 y$;
  the central power belongs to the norm exponent, and the annular factor has order-independent scale bounds.
  Likewise $q_u^(i t) = U_0^(i t) y^(i t)$, and the central unit phase is factored as a scalar before
  differentiating the normalized profile.

Logarithmic Fourier separation uses a joint cutoff in a coordinate list containing every normalized norm occurring
  in a coupled smooth factor. Derived nonsmooth row and label masks remain outside that factor and need no
  coordinate. A nonzero norm used as such a coordinate and initially ranging in a ball down to norm one must first
  be partitioned into common whole annuli fixed for the current sector; the zero frequency is separate.
  In bounded logarithmic ranges there are $O \( \( 1 + log Z \)^d \)$ such blocks for a fixed number $d$ of
  variables, so their count costs a preselected small power.
  The cutoff and its full support depend only on the block centers and fixed data,
  not on the individual values of the labels inside a row norm.
  Provided the coupled smooth factor is this one joint function with no further dependence on the individual
  labels, its Fourier density is common to those rows, as required by Lemma 9;
  separate uniform bounds for row-dependent densities would not imply the same Hilbert-space inequality.
  Nonsmooth masks are retained or resolved by exact arithmetic identities,
  never differentiated or incorporated as label-dependent sharp Fourier selectors.

Finally, suppose an internal dyadic ratio $R > Z^xi$, with fixed $xi > 0$,
  has absolute arithmetic count at most $Z^B R^b$. A coefficient bound with the factor $R^(- A)$ gives, for $A > b$,

$ sum_(R med upright("dyadic")\
R > Z^xi) Z^B R^(b - A) lt.double Z^(B - xi \( A - b \)) . $

Choose $A$ from the fixed $B \, b \, xi$ and the desired internal saving.
  The actual bound may also have finite input seminorm and polynomial height factors;
  these enter the finite propagation graph. This tail estimate is not a height-free assertion uniform in all
  heights. Parameter Sobolev adds only a fixed number of profile derivatives and height dimensions,
  and all these internal orders are chosen before an external cutoff.

Finally suppose the graph and all of its kernel and annular orders have been fixed, giving height degree $H$.
  Suppose an additional, external separation uses annular profiles with $p_j$ bounded uniformly in $Z$ for every
  fixed $j$, or nonannular profiles with the weighted Mellin or annular norms in the preceding lemmas uniformly
  bounded at every fixed order, and its discarded integrand has bound $Z^(B_0) chevron.l bold(t)
  chevron.r^(J_0)$ with fixed $B_0 \, J_0$. The external truncation is required to remain outside the graph:
  it does not replace a profile $bold(w)$ or a kernel $K_e$ by a cutoff-dependent profile.
  Given a retained-height allowance $delta > 0$, first choose $0 < tau < delta \/ \( 1 + H \)$.
  Then $\( 1 + T_1 \)^H lt.eq 2^H Z^delta$ for $T_1 = Z^tau$.
  After this choice, Equation (1.11) with weight $J_0$ and any fixed integer $N > \( B_0 + M \) \/
  tau$ makes an integrated external tail $O \( Z^(- M) \)$ for any prescribed $M > 0$.
  For a horizontal join use Equation (1.12) with the additional fixed height weight,
  or Equation (1.13) for a joint Gaussian slice. When other coordinates on such a slice are extended to the whole
  real line, the accompanying arithmetic factors must have global bounds on those coordinates;
  a coordinate entering a denominator controlled only in a buffered region must remain restricted to that region.
  The external constants may depend on $N$ and on the fixed data.
  This late choice does not alter any internal profile or the internal orders $J \, H$,
  which is the asserted order of dependence.

===== 2.6.4 Finite Poisson summation with a mask <finite-poisson-summation-with-a-mask>

We now prove Lemma 53, using the arithmetic conventions of Section 2 and Lemma 47 for the terminal case.
  The recursive reduction uses two applications of the following form of Poisson summation,
  and the initialization uses one. Its explicit divisor variable retains every zero extension.

#thm([Lemma 2.17.])[
  (Masked primitive Poisson).  #emph[Let $psi$ be a primitive finite character modulo an ideal $m$,
    extended by zero on nonunits, and let $R$ be any ideal. Let $Phi \( q_z \)$ be a radial Schwartz function on
    $bb(C)$, and let $cal(F) Phi \( q_y \)$ denote its Fourier transform for the self-dual measure and the kernel
    $e \( - z y \)$. For $K > 0$,
#[#set math.equation(numbering: n => "(2.65)")
 $ & sum_(k in cal(O)) psi \( k \) 1_(\( k \, R \) = 1) Phi \( q_k \/ K \)\
 & quad = frac(K gamma \( psi \; m \), sqrt(q_m)) sum_(d divides "rad" R) frac(mu \( d \) psi \( d \), q_d)
   sum_(h in cal(O)) macron(psi) \( h \) cal(F) Phi #h(-0.16667em) (frac(K q_h, q_d q_m)) \, $ <eq:masked-poisson>]

 where $gamma \( psi \; m \) = q_m^(- 1 \/ 2) sum_(x med mod med m) psi \( x \) e \( x \/ m \)$.
   For a nonprincipal primitive character, $\| gamma \( psi \; m \) \| = 1$ and the $h = 0$ term is zero.
   For the primitive principal character the conventions are $m = 1 \, med gamma \( 1 \; 1 \) = 1 \, med
   psi \( h \) = 1$, including at $h = 0$.]
] <lem:masked-poisson>

#proof[
  Expand the mask as $sum_(d divides "rad" R \, med d divides k) mu \( d \)$ and write $k = d k'$.
    The scale becomes $K \/ q_d$ and the character contributes $psi \( d \)$.
    Poisson summation in residue classes modulo $m$ has prefactor $K \/ \( q_d q_m \)$. Its finite transform is
  $ sum_(x med mod med m) psi \( x \) e \( h x \/ m \) = sqrt(q_m) gamma \( psi \; m \) macron(psi) \( h \) . $
  For unit $h$ this follows by changing variables. For nonunit $h$ the transform is zero by primitivity; for $m =
    1$ the stated principal convention applies. This proves Equation (2.65).
    For a nonprincipal primitive character, finite Parseval gives $sum_h \| sum_x psi \( x \)
    e \( h x \/ m \) \|^2 = q_m sum_x \| psi \( x \) \|^2$. Writing
    $phi.alt \( m \) = \| \( cal(O) \/ m \)^times \|$, there are $phi.alt \( m \)$ unit $h$’s,
    all with magnitude $sqrt(q_m) \| gamma \( psi \; m \) \|$, and $sum_x \| psi \( x \) \|^2 = phi.alt \( m \)$.
    Thus $\| gamma \( psi \; m \) \| = 1$.
  A fixed ray restriction can first be expanded into finitely many characters.
    Each is then replaced by its primitive inducing character, with the removed local zero extensions kept in $R$;
    the same formula applies term by term. For the principal modulus the absolute sum of the nonzero frequencies
    is $O_Phi \( d_(cal(O)) \( "rad" R \) \)$. Indeed, for all $A > 0$,
  $ A sum_(h eq.not 0) \| cal(F) Phi \( A q_h \) \| lt.double_Phi 1 . $
  Lattice counting proves this when $A lt.eq 1$, and Schwartz decay proves it when $A gt.eq 1$.
    Sum this bound with $A = K \/ q_d$ over $d$. At every use below the relevant nonempty row scale has $K gt.eq
    1$, so this is also $O \( K Z^epsilon.alt \)$. When principal nonzero frequencies are added or removed while
    separating a nonprincipal sum, they will carry the same outer row mask as that sum;
    their absolute contribution is no larger than this full principal bound. ◻
]

===== 2.6.5 The canonical reduction and its induction <the-canonical-reduction-and-its-induction>

We now prove Lemma 54. The reflected energy handles the short completion;
  the remaining blocks undergo two Poisson transformations to produce admissible canonical sums with shorter rows.

#proof[
  The order of the analytic choices is organized by Corollary 56 in Section 6.3.
    Its indexed conclusion will be used on each positive Cauchy-side sum separately;
    the proof below verifies the required common coefficient measures, fixed norm losses, and finite depth.
  At each node, every joint $\( f \, k \)$ Hilbert space uses the current label measure $w \( f \)$,
    and that factor is retained exactly once in every parent $f$-sum until Equation (2.89) removes the old label.
  At each node keep the parameters $N \, V \, M$ fixed, and write
  $ F = N + V \, wide Q = log_Z q_(frak(r)_rho) . $
  Here $F$ is the real length sum $N + V$, so $F = F_0$ at the starting node.
    The two hypotheses at a node with margin $c_(upright("node"))$ are exactly
  #[#set math.equation(numbering: n => "(2.66)")
   $ F - M - Q - z_0 gt.eq c_(upright("node")) \, wide 4 F - 3 M - 6 z_0 gt.eq
     c_(upright("node")) . $ <eq:inverse-fixed-invariant>]
  In particular $M + z_0 + c_(upright("node")) lt.eq F$. The number $Q$ is the actual logarithmic norm of the
    already fixed puncture radical, not a dyadic center. The parameter $M$ is the fixed logarithmic row length;
    the first Poisson test has scale $Z^M$.
  Let $M_max$ bound the starting row lengths. Choose $0 < d lt.eq c_(*) \/ 200$ and put
  $ D = ⌈frac(M_max + 2, d)⌉ + 1 . $
  We use positive parameters $eta \, tau \, pi \, tau_(upright("ref")) \, pi_(upright("ref"))$,
    chosen in the quantified order at the end of the proof. Here $eta$ is a localization tolerance bounding only
    the logarithms of fixed annular ratios, $tau$ is the common tolerance in the two Poisson tail comparisons,
    and $pi$ bounds the aggregate freely chosen local small-power losses. At depth $h$ set
  $ c_h = c_(*) - 7 h eta \, wide c_(upright("node")) = c_h \, $
  and impose the row cap $M lt.eq M_max - h d$. We prove the estimate by backwards induction on $h lt.eq D$.
    Every retained row parameter below is nonnegative. We shall show that a nonterminal passage decreases it by at
    least $d$, loses at most $7 eta$ in either required margin,
    and increases the energy exponent by at most $40 eta + tau + pi$.
    No invariant will be transferred from the fixed $F = N + V$ to an actual column norm.
  ======= 2.6.5.1 The short completion. <the-short-completion.>
  Möbius inversion of the cube factor in Equation (2.16) gives the exact identity
  #[#set math.equation(numbering: n => "(2.67)")
   $ & Z^(- N \/ 2) sum_(n med upright("sf")) a \( n \) chi_n \( k \) chi_n \( f \)^4 frak(d) \( n \)
     W \( q_n \/ Z^N \)\
 & quad = sum_h frac(mu \( h \) macron(alpha) \( h \)^3 Psi_k \( h \)^3, q_h)
   cal(T)_(frak(d)_h) \( Z^N \/ q_h^3 \; k \) \, wide frak(d)_h \( A \) =
   frak(d) \( h^3 A \) . $ <eq:marked-completion-inversion>]
  To check both the mark and the normalization, expand the right side and put $c = h b$.
    The factor $V_(*) \( y \) = y^(1 \/ 2) W \( y \)$ changes the absolute coefficient to
  $ Z^(- N \/ 2) macron(alpha) \( c \)^3 Psi_k \( c \)^3 q_c^(1 \/ 2) sum_(h divides c) mu \( h \) . $
  The mark is $frak(d) \( n c^3 \)$, independent of the divisor $h$.
    The divisor sum vanishes unless $c = 1$, proving the identity.
    Multiplicativity of $Psi_k$, including its punctures, is used here.
  Use one fixed smooth dyadic partition with nonnegative ideal centers, the unit dyad having center zero.
    Suppose $V < d$ and that the center $ell_1$ of the $h$-dyad is less than $d$.
    Freeze $h$, assign to it the slots it divides, and retain the others on the completed index.
    A surviving slot then has the individual coefficient $a_i \( p \) 1_(p divides.not h)$.
    Since $h$ is fixed, this is a bounded coefficient independent of the current $k \, f$,
    on the same nominal annulus and with the same cap. It is not the unrestricted original coefficient;
    the recursive branch below restores its original slot lists separately by the child zeros.
    For an active subcollection define $z_a$ to be the sum of its nominal slot lengths.
    Assignments only delete slots, so $0 lt.eq z_a lt.eq z_0$ exactly;
    an actual tuple norm is never used as this cap. Triangle inequality in the joint $\( f \, k \)$ Hilbert space
    uses $sum_(q_h asymp Z^(ell_1)) q_h^(- 1) lt.double 1$ for the fixed annulus,
    apart from the separately chosen divisor loss for assignments.
    The bounded factor $Psi_k \( h \)^3$ is a contraction in that space.
  Write $hat(h) = log_Z q_h$. The completion is at the actual scale $N_(*) = N - 3 hat(h)$.
    Its fixed support gives $hat(h) lt.eq ell_1 + eta < d + eta$ once the fixed annular threshold specified below
    is imposed. In Lemma 47, keep the actual residual-row dyad and choose the same threshold so that
  #[#set math.equation(numbering: n => "(2.68)")
   $ H lt.eq M - O + eta \, wide T_d - S_0 - B_0 lt.eq 2 M - O + Q + V - N_(*) + 2 z_a +
     eta . $ <eq:inverse-terminal-width>]
  These are Equations (1.50) and (2.31), not estimates for an enlarged row range.
    Substituting $N_(*) = N - 3 hat(h)$ and the first inequality in Equation (2.66) gives
  #[#set math.equation(numbering: n => "(2.69)")
   $ T_d - S_0 - B_0 lt.eq M - O + 2 z_a - z_0 - c_(upright("node")) + 5 d + 4 eta . $ <old-eq:4.9>]
  Indeed, the additional terms are $2 V + 3 hat(h) + eta < 5 d + 4 eta$.
  Take the threshold also to ensure $e_lambda gt.eq - eta$,
    and discard the whole reflected tail dyads as in Lemma 47.
    Thus every retained dyad satisfies $v + 3 ell_b + e_lambda lt.eq T_d + tau_(upright("ref"))$.
    The row branch of Equation (2.28), after dropping its nonpositive terms, obeys
  $ E_(upright("ref")) lt.eq M + z_a + 5 / 3 eta lt.eq F - c_(upright("node")) + 5 / 3 eta . $
  For the column branch with $u = z_a$, the retained dual bound first gives $E_(upright("ref")) lt.eq
    O \/ 2 + \( T_d - S_0 - B_0 \) + 5 eta \/ 3 + tau_(upright("ref"))$.
    Equation (2.69) and the first invariant then give
  #[#set math.equation(numbering: n => "(2.70)")
   $ E_(upright("ref")) lt.eq F - 2 c_(upright("node")) + 5 d + 17 / 3 eta + tau_(upright("ref")) . $ <old-eq:4.10>]
  If $u eq.not z_a$, its definition implies $u gt.eq v \/ 2$. The retained dual bound now first gives
  $ E_(upright("ref")) lt.eq O \/ 2 + \( T_d - S_0 - B_0 \) \/ 2 + z_a + 7 / 6 eta + 1 / 2 tau_(upright("ref")) . $
  Using Equation (2.69), $z_a lt.eq z_0$, and then the second invariant yields
  #[#set math.equation(numbering: n => "(2.71)")
   $ E_(upright("ref")) lt.eq F - M \/ 4 - 3 c_(upright("node")) \/ 4 + \( 5 \/ 2 \) d + 19 / 6 eta + 1 /
     2 tau_(upright("ref")) . $ <old-eq:4.11>]
  Use the reflected estimate with aggregate local loss $pi_(upright("ref"))$,
    including its freely chosen exponent, the label divisor bound, and the finitely many logarithmic sums. If
  $ c_(upright("node")) gt.eq c_(*) \/ 2 \, wide d lt.eq c_(*) \/ 200 \, wide eta \, tau_(upright("ref")) \,
    pi_(upright("ref")) lt.eq c_(*) \/ 1000 \, $
  all three bounds, after adding $pi_(upright("ref"))$, are strictly below $F$. In the last bound $M gt.eq 0$.
    For $z_0 = 0$ only $u = z_a = 0$ occurs. The reflected estimate was applied for each fixed $f$;
    the weighted mass bound $sum_f w \( f \) lt.double Z^(V + pi_(upright("ref")))$ shows that summing its squared
    bounds over $f$ costs at most this amount, already included in the aggregate loss,
    and cancels the outside $Z^(- V)$. Thus no moving fourth-power label entered the hybrid norm,
    and these terminal terms satisfy the canonical estimate.
  ======= 2.6.5.2 The remaining terms and their marks. <the-remaining-terms-and-their-marks.>
  At every factorization, assign a slot first to an extracted factor which its prime divides,
    and otherwise retain it on the residual column. The basic identity for the completion is
  #[#set math.equation(numbering: n => "(2.72)")
   $ 1_(p divides n b^3) = 1_(p divides b) + 1_(p divides.not b) 1_(p divides n) . $ <old-eq:4.12>]
  More generally, for an ordered list of extracted factors $D_1 \, dots.h \, D_h$, the exact priority identity is
  #[#set math.equation(numbering: n => "(2.73)")
   $ 1_(p divides D_1 dots.h.c D_h n) = sum_(j = 1)^h 1_(p divides D_j) product_(a < j) 1_(p divides.not D_a) +
     1_(p divides n) product_(a lt.eq h) 1_(p divides.not D_a) . $ <eq:inverse-slot-priority>]
  It holds even when extracted factors share primes. Applying it to each slot and each copy of a square gives a
    disjoint partition for each tuple of primes; the two copies of one slot have independent prime choices.
    There are at most $2^(\| I \|)$ choices at one single-factor assignment,
    and at most $\( h + 1 \)^(\| I \|)$ for the displayed ordered list.
    The assigned slots have divisor-bounded coefficients on the extracted factor.
    Because the original coefficient is $product_i a_i \( p_i \)$,
    removing assigned slots leaves exactly a subcollection with its original product coefficients.
    An ideal which will remain an averaging variable is not fixed merely because a slot was assigned to it.
  If $V < d$ and $ell_1 gt.eq d$, reopen the completion on the right of Equation (2.67).
    If its cube ideal is $h'$, first isolate its dyad with center $ell_2 gt.eq
    0$ and the $h$-dyad by triangle inequality in the joint Hilbert space, before squaring.
    Put $b = h h'$ and define the fixed centers
  $ ell = ell_1 + ell_2 \, wide r = N - 3 ell . $
  Both copies $b_1 \, b_2$ in the resulting square have this same nominal center $ell$;
    their actual norms need not agree. The mark is $frak(d) \( n b^3 \)$,
    independent of the choice of the divisor $h$ of $b$. Multiplicativity gives a factor $chi_b \( k \)^3$;
    the fourth power in $Psi_k \( b \)^3$ is exactly the mask $1_(\( b \, f \) = 1)$.
    The remaining sum over divisors $h$ of $b$ has absolute value at most a divisor function.
    After dyadic decomposition and separation of $q_n q_b^3 \/ Z^N$,
    each squared block is bounded by a small power times
  #[#set math.equation(numbering: n => "(A)")
   $ & Z^(- r - 2 ell - V) sum_f w \( f \) sum_(k in cal(O)) Phi \( q_k \/ Z^M \) \| sum_(q_b asymp Z^ell)
     beta \( b \, f \) chi_b \( k \)^3\
 & #h(26mm)  times sum_(n med upright("sf")) a \( n \) chi_n \( k \) chi_n \( f \)^4 frak(d) \( n b^3 \)
   W \( q_n \/ Z^r \) #scale(x: 300%, y: 300%)[\|]^2 . $ <eq:canonical-block>]
  Here $Phi$ is a fixed nonnegative radial Schwartz function majorizing the original row ball,
    and $\| beta \( b \, f \) \| lt.double Z^epsilon.alt$ independently of $k \, n$.
    Its $f$-dependence includes the original mask $1_(\( b \, f \) = 1)$;
    all other original cube masks are retained. There is no condition $\( b \, n \) = 1$.
    The exponent in front is correct because the original normalization is $Z^(- N \/ 2) q_b^(1 \/ 2) asymp
    Z^(- r \/ 2 - ell)$. If $V gt.eq d$, use the same block with $ell = 0 \, med b = 1 \, med r = N$.
    Thus every remaining block has exactly $V + ell gt.eq d$, by the center classification and $ell_2 gt.eq 0$.
    The added row $k = 0$ can only contribute in the principal cases counted below.
  ======= 2.6.5.3 The two-transform reduction. <the-two-transform-reduction.>
  We prove the following conditional estimate for every remaining block in Equation (A).
    Let $epsilon.alt_(upright("child")) gt.eq 0$. Suppose every energy $cal(E)'$ of the form (2.60),
    with all coefficient and support hypotheses of Lemma 54, the same fixed slot cap, parameters
  $ 0 lt.eq M' lt.eq M - d \, wide 0 lt.eq N' \, V' \, wide F' = N' + V' lt.eq F + 11 eta \, $
  and both margins at least $c_(upright("node")) - 7 eta$, satisfies $cal(E)' lt.double
    Z^(F' + epsilon.alt_(upright("child")))$. The hypothesis is uniform over the bounded ranges used in this
    induction, with finite-seminorm and fixed polynomial-height dependence as in that lemma.
    For $eta lt.eq d \/ 16$, the remaining block satisfies
  #[#set math.equation(numbering: n => "(2.74)")
   $ upright("block in Equation ") upright("(A)") lt.double
     Z^(F + 40 eta + tau + pi + epsilon.alt_(upright("child"))) \, $ <eq:canonical-reduction-contract>]
  with the same kind of uniform dependence. The freely chosen local losses sum to $pi$;
    the principal terms and discarded tails are included in this estimate.
    Thus the reduction supplies exactly the implication needed for backwards induction.
    Its proof occupies the two transformations below: the first produces a positive inverse-polynomial norm,
    and the second constructs the smaller canonical energies to which the hypothesis applies.
  We next specify the support and localization conventions used in both transformations.
    For an actual ideal or nonzero element $a$, write $hat(a) = log_Z q_a$.
    For a named scalar center, a hat will denote the actual logarithmic norm of its indicated ideal.
    All ideal centers introduced below are nonnegative centers from the fixed dyadic partition.
    The already fixed puncture and the ideal $q_0$ introduced below are used at their actual logarithmic norms,
    without independently rounded centers.
  Every individual dyad introduced in the two transformations has a fixed compact normalized support.
    If $a$ is its ideal and $a_(upright("cen"))$ its named logarithmic center, we use
  #[#set math.equation(numbering: n => "(2.75)")
   $ \| log_Z q_a - a_(upright("cen")) \| lt.eq eta . $ <eq:inverse-ratio-bounds>]
  This convention applies to the original $n_i \, b_i \, f$ windows and to each extracted-ideal dyad when it is
    introduced. Errors for products and quotients are the sums of these individual errors;
    the fresh residual windows below have the explicitly stated bounds $4 eta$, $6 eta$ and $4 eta$.
    These estimates concern fixed compact normalized-ratio intervals, not annuli of ratio $Z^eta$.
  For clarity, the intervals are fixed uniformly through the whole finite depth as follows.
    At each factorization choose fresh individual smooth cutoffs equal to one on the quotient supports,
    and include the full supports of these cutoffs, of the larger cutoffs used in Fourier separation,
    and of the enlarged label windows. Include also the bounded clipping families used below.
    Products and quotients of endpoints locate the initial quotient supports, such as those of $b = h h'$,
    the residual $n$, and the child column and label. Iterating this construction through $D$ levels gives a
    finite collection $cal(I)_D$ of compact normalized-ratio intervals.
    If $L_(upright("win"))$ is the maximum absolute logarithm of their endpoints, the threshold $log Z gt.eq
    L_(upright("win")) \/ eta$ implies Equation (2.75) and all the fresh-support bounds specified below.
    After a positive sum is enlarged, its newly added columns or labels need not satisfy an old parent product
    identity. Their norm bounds at this and the next node come directly from the full independent fresh windows in
    $cal(I)_D$. Separated norm powers do not change these supports.
  We use the following specialization of the common joint Fourier calculus in Lemma 9.
    Every normalized norm occurring in a coupled smooth factor to be separated from the columns is a coordinate
    $y_1 \, dots.h \, y_d$ of one ambient profile. A derived outer mask or label cutoff retained in the weight
    remains outside and needs no profile coordinate. Keep the current individual dyad cutoffs and fresh column
    cutoffs outside the inversion, until the weighted Cauchy inequality where they are used.
    Multiply the coupled profile by larger individual cutoffs $Omega_j$ equal to one on the full supports of those
    retained cutoffs. For the resulting compact profile $frak(H)$, define before summing any current row or label
  #[#set math.equation(numbering: n => "(2.76)")
   $ hat(frak(H)) \( bold(t) \) & = integral_(bb(R)^d) frak(H) \( e^(u_1) \, dots.h \, e^(u_d) \)
     e^(- i bold(t) dot.op bold(u)) thin d bold(u) \,\
frak(H) \( bold(y) \) & = \( 2 pi \)^(- d) integral_(bb(R)^d) hat(frak(H)) \( bold(t) \) product_(j = 1)^d
  y_j^(i t_j) thin d bold(t) . $ <eq:inverse-log-fourier>]
  Arithmetic relations among the norms restrict evaluation points of this identity, not its density.
    Outer modes stay in the outer weight; for two column coordinates the first test receives $y_1^(i t_1)$ and the
    second receives $y_2^(- i t_2)$, whose conjugate supplies $y_2^(i t_2)$.
    All normalized real inverse-root powers are included in the coupled profile,
    so the final column tests contain no second copy.
  This convention also makes the uniformity quantitative. Write $D_j = y_j partial_(y_j)$.
    On a fixed log rectangle, integration by parts with $\( 1 - Delta \)^(m_0)$, for $2 m_0 > J + d$, gives
  #[#set math.equation(numbering: n => "(2.77)")
   $ integral_(bb(R)^d) \| hat(frak(H)) \( bold(t) \) \| \( 1 + \| bold(t) \| \)^J thin d bold(t)
     lt.double_(J \, d \, upright("box")) max_(\| bold(a) \| lt.eq 2 m_0) parallel D^(bold(a)) frak(H)
     parallel_oo . $ <eq:inverse-fourier-moment>]
  For a fixed radial Schwartz Fourier kernel $K$, every $sup_(x gt.eq 0) \| \( x partial_x \)^j
    K \( x \) \|$ is finite, and
  $ D^(bold(a)) K #h(-0.16667em) (A product_j y_j^(e_j)) = (product_j e_j^(a_j)) \( x partial_x \)^(\| bold(a) \|)
    K \( x \) \|_(x = A product_j y_j^(e_j)) . $
  Thus the separating seminorms are uniform for every scalar $A > 0$, with no derivative-order power of $Z$.
    Normalized real powers have bounded Euler derivatives on the fixed boxes,
    and inherited norm twists have only a fixed polynomial height cost.
    No sharp cutoff in a column-dependent kernel ratio is put inside such a profile.
    For the radial Fourier kernels in the Poisson steps, these are the normalized-kernel bounds of Lemma 11 and
    Equation (2.64).
  The raw tail estimate we shall use is, for $Y gt.eq 1$ and $A > 1$,
  #[#set math.equation(numbering: n => "(2.78)")
   $ sum_(h eq.not 0 : thin a q_h > Y) \| K \( a q_h \) \| lt.double_A \( 1 + a^(- 1) \) Y^(1 - A)
     wide \( a > 0 \) . $ <eq:inverse-raw-tail>]
  Indeed, the shell $2^j Y < a q_h lt.eq 2^(j + 1) Y$ contains $O \( 1 + 2^j Y \/ a \)$ lattice points and the
    kernel is $O_A \( \( 2^j Y \)^(- A) \)$ there. Summing the two geometric series proves the display;
    the same argument applies to the fixed lattice $lambda^(- 4) cal(O)$.
    The proof uses only the large-argument bound $\| K \( x \) \| lt.double_A x^(- A)$ for $x gt.eq 1$,
    so it also applies to the reflected kernel on such a tail.
    Below an actual-ratio inequality is used only to show that the complement of a sector-fixed outer row ball is
    contained in this tail for each supported raw column pair.
    That complement is removed before off-coprime extension and before Fourier absolutization.
    The full smooth kernel is retained inside the ball, whose nonsmooth mask is kept outside Fourier inversion
    until the relevant weighted Cauchy inequality. The tail orders and the crude raw counts are fixed at the end.
  ======= 2.6.5.4 The first Poisson transformation. <the-first-poisson-transformation.>
  Expand the square in Equation (A). Put
  $ frak(B) = "rad" \( b_1 b_2 \) \, wide n_i = frak(A)_i C u_i quad \( i = 1 \, 2 \) \, $
  where $frak(A)_i = \( n_i \, frak(B) \)$, and $C$ is the gcd of $n_1 \/ frak(A)_1$ and $n_2 \/ frak(A)_2$.
    Then $frak(A)_i divides frak(B)$, while $u_1 \, u_2$ are squarefree, coprime to one another,
    and prime to $C frak(B)$. Let $A_i \, B$ be the fixed centers of $frak(A)_i \, C$, and write $hat(A)_i =
    log_Z q_(frak(A)_i)$, $hat(B) = log_Z q_C$. For $p divides frak(B)$, define
  $ a_(i p) = 1_(p divides frak(A)_i) \, wide pi_p = v_p \( b_1 b_2 \) med mod med 2 \, wide t_p = a_(1 p) -
    a_(2 p) + 3 pi_p med mod med 6 \, $
  and put $R_1 = product_(t_p eq.not 0) p$. Its center is $R$, and $hat(R) = log_Z q_(R_1)$.
    The row character and its remaining zero mask are exactly
  #[#set math.equation(numbering: n => "(2.79)")
   $ psi_1 = chi_(u_1) macron(chi)_(u_2) product_(t_p eq.not 0) chi_p^(t_p) \, wide m_1 = u_1 u_2 R_1 \, wide
     R_(upright("mask")) = C frak(B) \/ R_1 . $ <eq:first-masked-data>]
  Indeed, the exponents at $u_1 \, u_2$ are $1 \, - 1$; the common off-$frak(B)$ factor $C$ has exponent zero but
    retains its mask; and the exponent at $p divides frak(B)$ is $t_p$.
    Each nonzero local power is nonprincipal and primitive modulo $p$, with disjoint supports.
    Thus $psi_1$ is primitive unless $m_1 = 1$. Every original column mask and the two factors
    $beta \( b_1 \, f \) overline(beta \( b_2 \, f \))$ remain in the expression.
  Apply Lemma 57 with $K = Z^M$, and denote its divisor by $d_k divides C frak(B) \/ R_1$,
    with center $delta$ and $hat(delta) = log_Z q_(d_k)$. On this genuine coprime expression,
    the actual conductor length is
  #[#set math.equation(numbering: n => "(2.80)")
   $ hat(L)_1 = hat(n)_1 + hat(n)_2 - hat(A)_1 - hat(A)_2 - 2 hat(B) + hat(R) . $ <eq:first-poisson-lengths>]
  The actual kernel argument is $Z^M q_h \/ \( q_(d_k) q_(m_1) \)$, and the Poisson prefactor has exponent $M -
    hat(delta) - hat(L)_1 \/ 2$. We have not yet truncated or Fourier-separated this kernel.
  If $m_1 = 1$, then $u_1 = u_2 = 1$ and $t_p = 0$ for every $p divides frak(B)$.
    The latter condition forces $pi_p = 0$ and $a_(1 p) = a_(2 p)$. Hence $n_1 = n_2$ and $b_1 b_2$ is a square.
    Even counting all $O \( Z^(2 ell + epsilon.alt) \)$ pairs $b_1 \, b_2$,
    all $O \( Z^(r + epsilon.alt) \)$ equal columns, all $O \( Z^(V + epsilon.alt) \)$ labels,
    and $O \( Z^M \)$ rows, the normalization in Equation (A) gives $O \( Z^(M + epsilon.alt) \)$.
    If $r < 0$ but its fixed annular column window is nonempty,
    then $Z^(- r)$ is bounded by its fixed upper endpoint, so its ideal count is still $O \( Z^r \)$ with a fixed
    constant. Marks and the retained masks do not increase this bound beyond a small power.
    When the nonzero principal terms are restored below, they will carry the same outer ball mask as the
    nonprincipal terms; the last part of Lemma 57 bounds them at this same cost.
  We next identify its column coefficients. For coprime squarefree primary $a \, b$, CRT and reciprocity give
  $ gamma_2 \( a b \) = gamma_2 \( a \) gamma_2 \( b \) chi_a \( b \)^2 chi_b \( a \)^2 =
    gamma_2 \( a \) gamma_2 \( b \) chi_b \( a \)^4 . $
  In the first Poisson root, the factors involving $u_1$, including the divisor and frequency, are
  $ gamma_1 \( u_1 \) overline(chi_(u_1) \( h \)) chi_(u_1) \( d_k R_1 \) product_(t_p eq.not 0)
    chi_(u_1) \( p^(t_p) \) \, $
  up to a fixed-ray factor. This follows by writing the CRT factors between $u_1$ and $p$ as $chi_(u_1) \( p \)
    chi_p \( u_1 \)^(t_p)$ and using reciprocity. On the conjugated second side $t_p$ is replaced by $- t_p$.
    The cross factor between $u_1 \, u_2$ is the reciprocity factor $cal(R) \( u_1 \, u_2 \)$,
    not a quotient of zero-extended symbols.
  Put $P_T = product_(t_p eq.not 0) p^(t_p)$, regarded in the fixed ray group.
    Equation (1.8) and Equation (1.6) show that the remaining two-column ray factor is
  $ G \( u_1 u_2^(- 1) \) cal(R) \( u_1 u_2^(- 1) \, P_T \) . $
  For example, before placing factors inside the conjugated second polynomial,
    the raw second Gauss-signal factor is $mu \( u_2 \) chi_(u_2) \( - 1 \) overline(G \( u_2 \))$.
    Its corresponding factor written inside that polynomial is $mu \( u_2 \) chi_(u_2) \( - 1 \) G \( u_2 \)$.
    Also $G \( u_2^(- 1) \) = chi_(u_2) \( - 1 \) overline(G \( u_2 \))$.
    These identities give the displayed quotient. Fix the ray class of $P_T$ and Fourier-expand the displayed
    function on the finite ray group. Its factors on each side are genuine multiplicative ray characters,
    denoted by $nu_i$. Their number and coefficient norm depend only on the fixed ray group.
  Define
  $ E = product_(pi_p = 1) p^(a_(1 p) + a_(2 p)) \, wide tilde(h) = h f^2 E . $
  The original fourth power at $f$ equals $overline(chi_(u_i) \( f^2 \))$, including zeros.
    Assign the slots first to $b_i \, frak(A)_i \, C$. The remaining local factor at $p divides
    frak(B)$ on side $i$ has exponent
  $ 4 a_(i p) + 1_(t_p eq.not 0) \( 1 plus.minus t_p \) + pi_p \( a_(1 p) + a_(2 p) \) med \( mod med 6 \) . $
  The plus sign belongs to side one. Direct reduction gives the same answer on both sides:
  $ pi_p & a_(1 p) & a_(2 p) & t_p & upright("exponent on both sides")\
0 & 0 & 0 & 0 & 0\
0 & 1 & 0 & 1 & 0\
0 & 0 & 1 & 5 & 0\
0 & 1 & 1 & 0 & 4\
1 & 0 & 0 & 3 & 4\
1 & 1 & 0 & 4 & 4\
1 & 0 & 1 & 2 & 4\
1 & 1 & 1 & 3 & 4 $
  Define $xi \( n \)$ as the product over $p divides frak(B)$ of $chi_n \( p \)$ raised to the corresponding
    exponent in the last column. An exponent zero still denotes the puncture at $p$.
    The calculation proves that $xi$ is common to both sides and independent of $h \, f \, C$.
    The nonprincipal coefficient on side $i$, after these assignments, is
  #[#set math.equation(numbering: n => "(C)")
   $ mu \( u_i \) nu_i \( u_i \) rho \( u_i \) overline(chi_(u_i) \( tilde(h) \)) chi_(u_i) \( C \)^4
     chi_(u_i) \( d_k \) xi \( u_i \) frak(d)_i \( u_i \) . $ <eq:first-poisson-column>]
  It also shows that every character involving the moving $b_i \, frak(A)_i$ is in either $xi$ or $tilde(h)$;
    their other factors are outer coefficients.
  The first transform has produced the inverse-type column coefficient in Equation (C).
    We next collect its fourth-power factors into one squarefree label before forming the positive row norm for
    the second transform.
  ======= 2.6.5.5 Retaining the fourth-power label from the cubes. <retaining-the-fourth-power-label-from-the-cubes.>
  Write uniquely $b_1 b_2 = q^2 s$ with $s$ squarefree, and define
  $ J_2 = product_(pi_p = 0\
a_(1 p) = a_(2 p) = 1) p \, wide J = s J_2 \, wide q = J_2 q_0 . $
  Every prime of $J_2$ has positive even valuation in $b_1 b_2$, so $J_2 divides q$.
    The ideals $s \, J_2$ are coprime and squarefree; hence $J$ is squarefree.
    Let $j gt.eq 0$ be the center of $J$, and put
  $ hat(s) = log_Z q_s \, quad hat(j)_2 = log_Z q_(J_2) \, quad hat(j) = log_Z q_J = hat(s) + hat(j)_2 \, quad
    hat(ell)_(upright("pair")) = \( hat(b)_1 + hat(b)_2 \) \/ 2 . $
  The ideal identity $b_1 b_2 = q_0^2 J_2^2 s$ gives exactly
  #[#set math.equation(numbering: n => "(2.81)")
   $ hat(c) := log_Z q_(q_0) = hat(ell)_(upright("pair")) - hat(s) \/ 2 - hat(j)_2 gt.eq 0 \, wide
     4 hat(ell)_(upright("pair")) - 2 hat(s) + hat(j)_2 = 4 hat(c) + 5 hat(j)_2 gt.eq 0 . $ <eq:inverse-cube-actual>]
  The table above now proves the exact zero-extended identity
  #[#set math.equation(numbering: n => "(2.82)")
   $ xi \( n \) = chi_n \( J \)^4 thin 1_(\( n \, "rad" q_0 \) = 1) . $ <eq:retained-cube-label>]
  Indeed, the primes with exponent four are exactly those of $s J_2$;
    every other prime of $frak(B)$ divides $q_0$. A prime in both $J$ and $q_0$ only repeats the zero already
    supplied by $chi_n \( J \)^4$. We will fix $q_0$ but keep $J$ in a later average.
    The modulus $q_0$ contributes a puncture and is not part of the fixed ray group.
    For fixed $J \, q_0$, the choices of $s \, J_2$, the factorizations $b_1 b_2 = q_0^2 J_2^2 s$,
    and the ideals $frak(A)_i$ have only divisor multiplicity.
  We now localize the genuine first Poisson expression, before extending its coprime support or taking absolute
    Fourier integrals. The local table gives the exact actual-norm identity
  $ hat(R) - hat(A)_1 - hat(A)_2 + hat(E) = hat(s) - 2 hat(j)_2 . $
  For $y = h f^2 E$, the implication $Z^M q_h \/ \( q_(d_k) q_(m_1) \) lt.eq Z^tau$ and Equation (2.80) give
  $ hat(y) & lt.eq hat(n)_1 + hat(n)_2 - 2 hat(B) - M + hat(s) - 2 hat(j)_2 + hat(delta) + 2 hat(f) + tau\
 & lt.eq hat(n)_1 + hat(n)_2 - 2 hat(B) - M + 4 hat(ell)_(upright("pair")) - hat(j) + hat(delta) + 2 hat(f) + tau . $
  The second inequality is Equation (2.81). Define the formal center and the enclosing outer row scale by
  #[#set math.equation(numbering: n => "(2.83)")
   $ H_c = 2 r - 2 B - M + 4 ell + 2 V + delta - j \, wide H_(upright("use")) = H_c + 12 eta +
     tau . $ <eq:enlarged-first-frequency>]
  Relative to $H_c$, the last actual upper bound has error
  $ \( hat(n)_1 - r \) + \( hat(n)_2 - r \) - 2 \( hat(B) - B \) + 2 \( hat(b)_1 - ell \) +
    2 \( hat(b)_2 - ell \) - \( hat(j) - j \) + \( hat(delta) - delta \) + 2 \( hat(f) - V \) \, $
  whose positive maximum under Equation (2.75) is $12 eta$.
    Thus the actual-ratio inequality implies $q_y lt.eq Z^(H_(upright("use")))$ for every supported raw column pair.
  On that raw expression insert only the outer mask
  $ cal(B)_1 \( h \) = 1_(0 < q_(h f^2 E) lt.eq Z^(H_(upright("use")))) . $
  For each supported pair, its complement is contained in the actual kernel tail $Z^M
    q_h \/ \( q_(d_k) q_(m_1) \) > Z^tau$; apply Equation (2.78) to discard that complement,
    with the raw counts and order fixed below. No indicator of the ratio inequality is inserted.
    Inside $cal(B)_1 = 1$ retain the full smooth kernel, including pairs whose ratio is larger than $Z^tau$.
    The mask depends on $h \, f \, E$ and the fixed sector, but, after the indicated extraction, not on $u_1 \,
    u_2$. If $H_(upright("use")) < 0$, its nonzero ball is empty and the same tail comparison discards every
    nonzero frequency. Any principal nonzero terms now restored to unify the formula carry this identical mask.
    Their absolute contribution is bounded by the full principal restoration already estimated.
  Remove the condition $\( u_1 \, u_2 \) = 1$ by
  $ 1_(\( u_1 \, u_2 \) = 1) = sum_(t' divides \( u_1 \, u_2 \)) mu \( t' \) \, wide u_i = t' x_i \, wide hat(t) =
    log_Z q_(t') . $
  Let $t$ be its fixed nonnegative center. This inversion is made after the cross phases have been replaced by the
    fixed ray functions above. Those functions, the unchanged outer mask $cal(B)_1$,
    all remaining zero-extended local factors, and the formal product $q_(u_1) q_(u_2)
    q_(R_1)$ in the smooth kernel define an expression also for noncoprime $u_1 \, u_2$.
    It agrees with Poisson summation on the coprime support; the displayed divisor identity then recovers exactly
    that support. No primitive Poisson formula is asserted for the newly introduced noncoprime pairs.
    Squarefreeness retains the puncture $\( x_i \, t' \) = 1$.
    Assigned slots at $t'$ are outer coefficients, while the other slots form the mark on $x_i$.
  Insert dyads of $q_h$ from one fixed partition common to all $f \, E$,
    not partitions recentered for those labels. The mask $cal(B)_1$ implies $q_h lt.eq q_(h f^2 E) lt.eq
    Z^(H_(upright("use")))$, so there are only logarithmically many such dyads in the bounded retained scale
    range. Keep $cal(B)_1$ outside every Fourier inversion. Define
  $ s_i = r - A_i - B - t \, wide kappa_i = M - 2 r - 2 ell - V - delta + A_i + B - R \/ 2 . $
  The identity $n_i = frak(A)_i C t' x_i$ on the factorized expression gives $\| hat(x)_i - s_i \| lt.eq 4 eta$.
    The full fresh $x_i$-support is included in $cal(I)_D$, so this same bound holds directly on that support
    after separation, not only on the original product support.
    The reconstructed formal products used in the current prefactor are also included there.
  ======= 2.6.5.6 Separating the first transformed product. <separating-the-first-transformed-product.>
  We record the actual prefactor before applying Cauchy. It splits exactly over the two column sides as
  $ Z^(- r - 2 ell - V) Z^(M - hat(delta) - hat(L)_1 \/ 2) = Z^(hat(kappa)_1 \/ 2) Z^(hat(kappa)_2 \/ 2) \, quad
    hat(kappa)_i = M - r - 2 ell - V - hat(delta) - hat(n)_i + hat(A)_i + hat(B) - hat(R) \/ 2 . $
  Equation (2.75) gives on each side
  #[#set math.equation(numbering: n => "(2.84)")
   $ hat(kappa)_i lt.eq kappa_i + 9 / 2 eta . $ <eq:inverse-first-prefactor-error>]
  The five error weights are $1 \, 1 \, 1 \, 1 \, 1 \/ 2$. We now implement this normalization with all real
    inverse roots in one joint profile. Fix a first dyadic, ray, and slot pattern $sigma$,
    and let $h_1$ be the center of its bare-$h$ dyad. Use the nine independent normalized coordinates
  $ bold(y) = \( y_(A_1) \, y_(A_2) \, y_C \, y_d \, y_R \, y_t \, y_h \, y_(x_1) \, y_(x_2) \) =
    (q_(frak(A)_1) / Z^(A_1) \, q_(frak(A)_2) / Z^(A_2) \, q_C / Z^B \, q_(d_k) / Z^delta \, q_(R_1) / Z^R \,
    q_(t') / Z^t \, q_h / Z^(h_1) \, q_(x_1) / Z^(s_1) \, q_(x_2) / Z^(s_2)) . $
  The exact full root and kernel argument on the formal $u_a = t' x_a$ expression are
  #[#set math.equation(numbering: n => "(2.85)")
   $ frac(Z^(- r - 2 ell - V) Z^M, q_(d_k) sqrt(q_(R_1)) q_(t') sqrt(q_(x_1) q_(x_2))) & =
     Z^(\( kappa_1 + kappa_2 \) \/ 2) y_d^(- 1) y_R^(- 1 \/ 2) y_t^(- 1) \( y_(x_1) y_(x_2) \)^(- 1 \/ 2) \,\
frac(Z^M q_h, q_(d_k) q_(R_1) q_(t')^2 q_(x_1) q_(x_2)) & =
  A_(upright("ker") \, 1) frac(y_h, y_d y_R y_t^2 y_(x_1) y_(x_2)) \,\
A_(upright("ker") \, 1) & = Z^(M + h_1 - delta - R - 2 t - s_1 - s_2) . $ <eq:inverse-first-root-kernel>]
  Choose fresh cutoffs $omega_(x \, a)$ equal to one on the old $W$-support divided by the individual
    $frak(A)_a \, C \, t'$ supports, and retain them in the columns.
    Retain every current outer dyad cutoff outside inversion.
    Let $Omega_(1 \, alpha)$ be larger cutoffs equal to one on the full supports of these retained cutoffs.
    With $cal(K)_1 = cal(F) Phi$, define the single compact profile
  #[#set math.equation(numbering: n => "(2.86)")
   $ frak(H)_(1 \, sigma) \( bold(y) \) =  & Z^(- 9 eta \/ 2) product_alpha Omega_(1 \, alpha) \( y_alpha \)
     y_d^(- 1) y_R^(- 1 \/ 2) y_t^(- 1) \( y_(x_1) y_(x_2) \)^(- 1 \/ 2)\
 & times W \( y_(A_1) y_C y_t y_(x_1) \) overline(W \( y_(A_2) y_C y_t y_(x_2) \)) cal(K)_1 #h(-0.16667em)
   (A_(upright("ker") \, 1) frac(y_h, y_d y_R y_t^2 y_(x_1) y_(x_2))) . $ <eq:inverse-first-profile>]
  The scalar outside this profile is exactly $product_(a = 1)^2 Z^(\( kappa_a + 9 eta \/ 2 \) \/ 2)$.
    In particular, the profile contains each real root once, also when the actual column norms differ.
    Its transform is defined by Equation (2.76) on the ambient nine-dimensional box before any actual $f \,
    h$ or outer ideal is summed. The norms of $b_a \, f \, J \, E \, q_0$ occur only in outer coefficients,
    characters, masks or individual cutoffs after Equation (C); they require no additional coupled-profile coordinate.
  To expose the arithmetic extraction at $t'$, put $y = h f^2 E$ and
  $ B_(1 \, a) \( t' \; y \) = mu \( t' \) nu_a \( t' \) rho \( t' \) overline(chi_(t') \( y \))
    chi_(t') \( C J \)^4 chi_(t') \( d_k \) 1_(\( t' \, "rad" q_0 \) = 1) . $
  Let $epsilon_1 = 1$ and $epsilon_2 = - 1$. For a fixed first Fourier mode $bold(t)$,
    the remaining polynomials are exactly
  #[#set math.equation(numbering: n => "(2.87)")
   $ P_a \( y \) =  & sum_(x med upright("sf")) mu \( x \) nu_a \( x \) rho \( x \) overline(chi_x \( y \))
     chi_x \( C J \)^4 chi_x \( d_k \) 1_(\( x \, "rad" q_0 t' \) = 1)\
 & wide times
   frak(d)_(I_a) \( x \) omega_(x \, a) \( q_x \/ Z^(s_a) \) \( q_x \/ Z^(s_a) \)^(epsilon_a i t_(x_a)) .
   $ <eq:inverse-first-polynomial>]
  Multiplicativity is used on squarefree coprime factors, then through the displayed zero extensions;
    no character is divided at a zero. The one additional $mu \( t' \)$ from the mutual-gcd inversion is outer.
    Apply Equation (2.73) with the ordered list $\( b_a \, frak(A)_a \, C \, t' \; x \)$.
    A surviving prime dividing $x$ is already prime to $b_a \, frak(A)_a \, C \, t'$:
    every prime of $frak(B)$ is in $J "rad" q_0$, and the displayed fourth powers and punctures supply these
    zeros. Thus $frak(d)_(I_a)$ has the original individual coefficients and lists,
    while assigned prime identities and priority masks stay outer.
  Here is the full structure of the first separated component.
    Let $Omega_sigma$ consist of $b_1 \, b_2 \, frak(A)_1 \, frak(A)_2 \, C \, d_k \, t' \, f \,
    h$ and the assigned slot primes, subject to their reconstruction relations and individual supports.
    In particular $frak(A)_a divides frak(B)$, $\( C \, frak(B) \) = 1$, and $d_k divides C frak(B) \/ R_1$,
    while $R_1 \, E \, J \, q_0$ are derived, not free indices.
    Let $cal(A)_(1 \, sigma)$ be the product of the assigned original coefficients and priority masks,
    with conjugation on side two, and let $psi_(1 \, sigma)^(upright("out"))$ be the product of all retained outer
    dyad cutoffs. Let $e_sigma$ be the product obtained in the preceding quotient-free CRT extraction of the old
    multiplicity $w \( f \)$, the two original $beta$ factors, their cube masks including $\( b_a \, f \) = 1$,
    the extracted zero masks, and the finite Gauss, unit, reciprocity,
    and first-ray factors at the old outer ideals, excluding the displayed $mu \( d_k \)$ and $B_(1 \, a)$.
    It is independent of $x_1 \, x_2$; its definition is by that product, not by division by Equation (2.87).
    Writing $cal(O)_1 = { A_1 \, A_2 \, C \, d \, R \, t \, h }$, set
  $ w_(1 \, sigma) \( omega \; bold(t) \) = e_sigma \( omega \) mu \( d_k \) mu \( t' \) B_(1 \, 1) \( t' \; y \)
    overline(B_(1 \, 2) \( t' \; y \)) cal(B)_1 \( h \) cal(A)_(1 \, sigma) \( omega \)
    psi_(1 \, sigma)^(upright("out")) \( omega \) product_(alpha in cal(O)_1) y_alpha^(i t_alpha) . $
  For the masked, principal-restored formal first component, Fourier inversion gives the exact identity
  #[#set math.equation(numbering: n => "(2.88)")
   $ cal(T)_(1 \, sigma) = \( 2 pi \)^(- 9) integral_(bb(R)^9) & hat(frak(H))_(1 \, sigma) \( bold(t) \)
     sum_(omega in Omega_sigma) w_(1 \, sigma) \( omega \; bold(t) \)\
 & times Z^(\( kappa_1 + 9 eta \/ 2 \) \/ 2) P_1 \( y \) overline(Z^(\( kappa_2 + 9 eta \/ 2 \) \/ 2) P_2 \( y \))
   thin d bold(t) . $ <eq:inverse-first-separated>]
  Expanding the two polynomials restores the two column modes;
    the seven outer modes restore the other coordinates of Equation (2.86).
    Its larger cutoffs are one on the retained supports, and the fresh cutoffs are one wherever the old windows
    are nonzero. This verifies the identity term by term. The original $beta$ factors and every outer mask are
    still in the complete sum.
  ======= 2.6.5.7 The first positive majorant. <the-first-positive-majorant.>
  For any finite or absolutely convergent weighted sum we use
  #[#set math.equation(numbering: n => "(D)")
   $ lr(|sum_omega w_omega U_1 \( omega \) overline(U_2 \( omega \))|) lt.eq
     product_(i = 1)^2 (sum_omega \| w_omega \| \| U_i \( omega \) \|^2)^(1 \/ 2) . $ <eq:weighted-cauchy>]
  Apply this first with $U_i = Z^(\( kappa_i + 9 eta \/ 2 \) \/ 2) P_i$ on the whole $Omega_sigma$,
    for each fixed mode. Only now bound the outer factors absolutely.
    Their pure arithmetic magnitudes are at most a separately allocated $Z^(pi_beta)$ times the old multiplicity
    and the absolute assigned-slot product; the retained support gives $cal(B)_1 \( h \) 1_(\( C \, J \) = 1)$.
    In particular no factorization of $beta \( b \, f \)$ has been assumed.
  For each fixed old outer reconstruction and nonzero $y = tilde(h)$, the relation $y =
    h f^2 E$ implies $f^2 E divides \( y \)$. If its multiplicity is at most $C_0 d_(cal(O)) \( f \)^(C_0)$, then
  #[#set math.equation(numbering: n => "(2.89)")
   $ sum_(f^2 E divides \( y \)) w \( f \) lt.eq C_0 d_(cal(O)) \( \( y \) \)^(C_0 + 1) lt.eq
     C_(pi_(upright("old"))) Z^(pi_(upright("old"))) wide \( 0 < q_y lt.eq Z^(H_(upright("use"))) \) .
     $ <eq:inverse-old-label-fibre>]
  The last bound is uniform because $H_(upright("use"))$ stays in a bounded range; $h =
    y \/ \( f^2 E \)$ is then uniquely determined as an element.
    This is an old-label fibre bound, not a multiplicity depending on a later new label.
    The polynomial $P_i \( y \)$ has no remaining dependence on $f$ or on the individual $b_i \,
    frak(A)_i$ beyond $J \, q_0$, the fixed dyadic length $A_i$, and the fixed ray sector:
    this is precisely Equations (C) and (2.82), with the norm profiles separated.
    After the first weighted Cauchy inequality, $cal(B)_1$ is simply $1_(0 < q_y lt.eq Z^(H_(upright("use"))))$.
    At this positive-sum stage, and only now, majorize it by a fixed nonnegative radial Schwartz function
    $Phi_(+) \( q_y \/ Z^(H_(upright("use"))) \)$ which is at least one for arguments at most one.
    A nonempty ball has $H_(upright("use")) gt.eq 0$, so the second Poisson scale is exactly
    $Z^(H_(upright("use"))) gt.eq 1$. The majorant is not substituted as an equality in the original signed
    expression. More precisely, let $frak(O)_sigma$ consist of
  $ o = \( b_1 \, b_2 \, frak(A)_1 \, frak(A)_2 \, C \, d_k \, t' \; upright("old assigned slot primes") \) \, $
  retaining their full individual supports, the source reconstruction relations independent of $f \, h \, x$,
    the assigned priority masks, and $\( C \, J \) = 1$. Let $w_o^(+)$ be the product of the absolute original
    coefficients of its assigned primes, and zero off this set. It is nonnegative and independent of $y$.
    Each first positive side is at most $C Z^(pi_beta + pi_(upright("old")))$,
    times its scalar $Z^(kappa_i + 9 eta \/ 2)$, times the explicit positive majorant
  #[#set math.equation(numbering: n => "(2.90)")
   $ cal(S)_(i \, sigma \, bold(t)) = sum_(o in frak(O)_sigma) w_o^(+) sum_(y in cal(O))
     Phi_(+) \( q_y \/ Z^(H_(upright("use"))) \) \| P_i \( y \) \|^2 . $ <eq:inverse-first-majorant>]
  At this positive step the old $h$ cutoff and mode, and the zeros of $B_(1 \, a)$ depending on $y$,
    may be removed by their upper bounds. The first weighted Cauchy inequality and the old-label fibre bound have
    therefore removed the old $f \, h$ from this positive majorant and every later outer set; their original $-
    V$ normalization remains in $kappa_i$. After the following count,
    we apply the second Poisson transformation to its $y$-sum.
  Let $hat(r)_(upright("diff")) gt.eq 0$ be the actual log-norm of the even-parity primes with $a_(1 p) eq.not
    a_(2 p)$. The table gives $hat(R) = hat(s) + hat(r)_(upright("diff"))$, so
  #[#set math.equation(numbering: n => "(2.91)")
   $ hat(c) = hat(ell)_(upright("pair")) + hat(R) \/ 2 - hat(j) - hat(r)_(upright("diff")) \/ 2 lt.eq ell +
     R \/ 2 - j + 5 / 2 eta . $ <eq:fixed-cube-count>]
  Ideal counting with this actual upper bound counts the fixed $q_0$ while retaining $J$.
    For a diagonal bound which also counts $J$, its full window has exponent at most $j + eta$,
    giving the combined upper count $Z^(ell + R \/ 2 + 7 eta \/ 2 + epsilon.alt)$.
    The choices of the $frak(A)_i$ and of $d_k divides C frak(B) \/ R_1$ add only divisor factors once $b_1 \,
    b_2 \, C$ are specified.
  Combining Equation (2.88), weighted Cauchy, and the old-label fibre bound gives the explicit output of the first
    transformation:
  #[#set math.equation(numbering: n => "(2.92)")
   $ \| cal(T)_(1 \, sigma) \| lt.double  & Z^(pi_beta + pi_(upright("old"))) integral_(bb(R)^9) \|
     hat(frak(H))_(1 \, sigma) \( bold(t) \) \|\
 & quad times product_(i = 1)^2 (Z^(kappa_i + 9 eta \/ 2) cal(S)_(i \, sigma \, bold(t)))^(1 \/ 2) thin d
   bold(t) . $ <eq:inverse-first-transform-output>]
  Each $cal(S)_(i \, sigma \, bold(t))$ is the positive sum in Equation (2.90):
    its row polynomial has the Möbius coefficient in Equation (2.87), the cube-derived label $J$ is retained,
    and the old $f \, h$ no longer occur among the averaged indices.
    The following transformation is applied to these positive row norms.
  ======= 2.6.5.8 The second Poisson transformation. <the-second-poisson-transformation.>
  Fix one of the two positive sums obtained from the first Cauchy inequality. Its polynomial has the form
  $ P_i \( y \) = sum_x c_i \( x \) overline(chi_x \( y \)) . $
  The coefficient $c_i \( x \)$ consists of the other factors of Equation (C), with $u_i = t' x$,
    the puncture at $t'$, and the separated weight. It is independent of $y$. In particular $x$ is squarefree and
  $ c_i \( x \) = 0 quad upright("unless") quad \( x \, C J \) = 1 \, quad \( x \, "rad" q_0 t' \) = 1 . $
  The puncture $rho$ and the zero of $chi_x \( d_k \)$ are retained as well.
    The $y$-sum uses the fixed-shape smooth positive ball at scale $Z^(H_(upright("use")))$.
  In its expanded square put
  $ g' = \( x_1 \, x_2 \) \, wide x_j = g' z_j \, wide hat(g) = log_Z q_(g') . $
  Let $g gt.eq 0$ be its fixed center. Then $z_1 \, z_2$ are squarefree and coprime, and each is prime to $g'$.
    The row data for Lemma 57 are
  #[#set math.equation(numbering: n => "(2.93)")
   $ K = Z^(H_(upright("use"))) \, wide psi_2 = macron(chi)_(z_1) chi_(z_2) \, wide m_2 = z_1 z_2 \, wide
     R_(upright("mask")) = g' . $ <eq:second-masked-data>]
  The common factor $macron(chi)_(g') \( y \) chi_(g') \( y \)$ is exactly this mask.
    The character is primitive away from $m_2 = 1$, because its two nonzero local powers have disjoint supports.
    For $d_2 divides g'$, let $theta gt.eq 0$ be its center and write $hat(theta) = log_Z q_(d_2)$.
    The actual conductor length is
  $ hat(L)_2 = hat(x)_1 + hat(x)_2 - 2 hat(g) \, wide \| hat(L)_2 - 2 \( s_i - g \) \| lt.eq 10 eta . $
  The last inequality uses the full fresh $x$-support bound $\| hat(x)_a - s_i \| lt.eq
    4 eta$ for each copy and $\| hat(g) - g \| lt.eq eta$. For $k_(upright("new")) = d_k d_2 k''$,
    the implication $Z^(H_(upright("use"))) q_(k'') \/ \( q_(d_2) q_(m_2) \) lt.eq Z^tau$ gives
  $ hat(k_(upright("new"))) & lt.eq 2 \( s_i - g \) - H_(upright("use")) + delta + 2 theta + 13 eta + tau\
 & = M_c + eta \, $
  where
  #[#set math.equation(numbering: n => "(2.94)")
   $ M_c & = 2 \( s_i - g \) - H_c + delta + 2 theta\
 & = M - 4 ell - 2 A_i - 2 t - 2 g + 2 theta - 2 V + j \, wide M_(upright("ch")) = M_c +
   eta . $ <eq:second-poisson-lengths>]
  The $13 eta$ consists of $10 eta$ from the conductor, one from $d_k$, and two from $d_2$.
    Subtracting $H_(upright("use")) = H_c + 12 eta + tau$ cancels the same tolerance $tau$ used in this second
    Poisson comparison. Thus no separate row clipping or unrecorded boundary error is needed.
  Separate the original principal contribution for the direct count below.
    Before any off-coprime extension or Fourier absolutization,
    keep on the genuine nonprincipal second Poisson expression only the outer mask
  $ cal(B)_2 \( k'' \) = 1_(0 < q_(d_k d_2 k'') lt.eq Z^(M_(upright("ch")))) . $
  For each supported pair its complement is contained in the actual ratio tail just considered,
    so Equation (2.78) discards it with the order fixed below. Inside the mask retain the full smooth kernel.
    The mask depends on $d_k \, d_2 \, k''$ and the fixed sector, not on the residual $z_1 \, z_2$.
    If $M_(upright("ch")) < 0$, the nonzero ball is empty and the same tail comparison discards every nonzero
    frequency. In a retained nonempty passage $M_(upright("ch")) gt.eq 0$.
  The actual second prefactor has the exact side split
  $ Z^(H_(upright("use")) - hat(theta) - hat(L)_2 \/ 2) = Z^(hat(lambda)_1 \/ 2) Z^(hat(lambda)_2 \/ 2) \, wide
    hat(lambda)_a = H_(upright("use")) - hat(theta) - hat(x)_a + hat(g) . $
  For $lambda_c = H_c - theta - \( s_i - g \)$, the same support bounds give
  #[#set math.equation(numbering: n => "(2.95)")
   $ hat(lambda)_a lt.eq lambda_c + 18 eta + tau . $ <eq:inverse-second-prefactor-error>]
  Here $18 = 12 + 1 + 4 + 1$. As in the first split, all normalized real inverse roots will remain in the joint
    smooth profile until Fourier inversion; they are not also appended to the final child tests.
    All original coefficient masks remain. In particular
  $ \( g' \, C J \) = 1 \, wide \( z_j \, g' C J \) = 1 $
  on their nonzero support.
  The principal case is $z_1 = z_2 = 1$, equivalently $x_1 = x_2$. The nominal identity for its count is
  #[#set math.equation(numbering: n => "(2.96)")
   $ kappa_i + H_c + s_i + B + t + ell + R \/ 2 = F - B - j \, wide F = N + V = r + 3 ell +
     V . $ <eq:second-principal-exponent>]
  The actual upper count adds $9 eta \/ 2$ from the first prefactor, $12 eta +
    tau$ from the row scale $H_(upright("use"))$, $4 eta$ from the diagonal $x$-window, $eta$ each from $C \, t'$,
    and $7 eta \/ 2$ from the combined $q_0 \, J$ count. Their sum is $26 eta + tau$.
    With the aggregate local loss $pi$, this principal contribution is therefore at most
    $Z^(F - B - j + 26 eta + tau + pi) lt.eq Z^(F + 26 eta + tau + pi)$.
    Any nonzero principal frequencies restored to the formal expression carry the same $cal(B)_2$ mask;
    their absolute sum is bounded by the full principal restoration in Lemma 57, since $Z^(H_(upright("use"))) gt.eq 1$.
  For the nonprincipal terms, we now identify the new coefficient class.
    For squarefree $z$, complex conjugation of a primitive Gauss sum and Equation (1.8) give
  $ gamma_(- 1) \( z \) = chi_z \( - 1 \) overline(gamma_1 \( z \)) \, wide mu \( z \) gamma_(- 1) \( z \) =
    macron(alpha) \( z \) gamma_2 \( z \) chi_z \( - 1 \) overline(G \( z \)) . $
  The raw second factor is $mu \( z \) gamma_1 \( z \) = overline(macron(alpha) \( z \) gamma_2 \( z \))
    G \( z \)$; the corresponding factor written inside the conjugated second polynomial has ray factor
    $overline(G \( z \))$. The CRT cross factor of the two primitive roots is $cal(R) \( z_1 \, z_2 \)$.
    Thus their combined ray factor is
  $ frak(G) \( a \, b \) = chi_a \( - 1 \) overline(G \( a \)) G \( b \) cal(R) \( a \, b \) = G \( b a^(- 1) \) . $
  The last equality follows from Equation (1.6) and $cal(R) \( a \, a \) = chi_a \( - 1 \)$,
    first on primes by Equation (1.7) and then multiplicatively.
    All quotients in this display are in the fixed finite ray group. In particular,
  $ frak(G) \( v' n_1 \, v' n_2 \) = frak(G) \( n_1 \, n_2 \) . $
  The common multiplicative character $nu_i \( v' \)$ also cancels between the two sides.
  Insert dyads of $q_(k'')$ from one partition common to all $d_k \, d_2$.
    The mask $cal(B)_2$ implies $q_(k'') lt.eq Z^(M_(upright("ch")))$,
    so their number is logarithmic in the bounded retained range.
    Let $h_2$ be the center of one such bare-frequency dyad. We now record the exact component to be separated.
    Fix the first mode and selected side $i$, write
  $ H_o = C J \, wide r_0 = "rad" q_0 t' \, wide d_0 = d_k \, wide a_0 \( z \) =
    macron(alpha) \( z \) gamma_2 \( z \) \, wide cal(K)_2 = cal(F) Phi_(+) \, $
  and retain $K = Z^(H_(upright("use")))$ from Equation (2.93). For squarefree arguments put
  #[#set math.equation(numbering: n => "(2.97)")
   $ B_o \( g' \) & = mu \( g' \) nu_i \( g' \) rho \( g' \) 1_(\( g' \, r_0 \) = 1) chi_(g') \( H_o \)^4
     chi_(g') \( d_0 \) \,\
L_(o \, d_2 \, k'') \( z \) & = a_0 \( z \) nu_i \( z \) rho \( z \) 1_(\( z \, r_0 \) = 1) chi_z \( H_o \)^4
  chi_z \( d_0 \) overline(chi_z \( d_2 \)) chi_z \( k'' \) . $ <eq:inverse-second-outer-coefficients>]
  The old separated test in $P_i$ is denoted by $W_i$, so $W_i \( x \) =
    omega_(x \, i) \( x \) x^(epsilon_i i t_(x_i))$. Let $psi_g \, psi_(d_2) \,
    psi_(k'')$ denote the retained individual cutoffs on the fixed $g' \, d_2 \, k''$ dyads,
    evaluated at their normalized norms. For this preliminary pattern $sigma_0$,
    the masked principal-restored nonzero component of Equation (2.90) is exactly
  #[#set math.equation(numbering: n => "(2.98)")
   $ cal(T)_(2 \, sigma_0 \, i) =  & sum_(o in frak(O)_sigma \, med g' med upright("sf")\
d_2 divides g' \, med k'' eq.not 0) w_o^(+) psi_g psi_(d_2) psi_(k'') mu \( d_2 \) cal(B)_2 \( k'' \) \|
  B_o \( g' \) \|^2\
 & times sum_(z_1 \, z_2 med upright("sf")\
\( z_1 z_2 \, g' \) = 1) 1_(\( z_1 \, z_2 \) = 1) L_(o \, d_2 \, k'') \( z_1 \)
  overline(L_(o \, d_2 \, k'') \( z_2 \)) G \( \[ z_2 \] \[ z_1 \]^(- 1) \)\
 & times frak(d)_(I_i) \( g' z_1 \) overline(frak(d)_(I_i) \( g' z_2 \)) W_i \( q_(g') q_(z_1) \/ Z^(s_i) \)
   overline(W_i \( q_(g') q_(z_2) \/ Z^(s_i) \))\
 & times frac(K, q_(d_2) sqrt(q_(z_1) q_(z_2))) cal(K)_2 #h(-0.16667em)
   (frac(K q_(k''), q_(d_2) q_(z_1) q_(z_2))) . $ <eq:inverse-second-formal-component>]
  Here brackets denote classes in the fixed finite ray group.
    Indeed the arithmetic part of $c_i \( g' z \)$ factors into $B_o \( g' \)$ and its residual $mu \( z \)$
    coefficient on $\( g' \, z \) = 1$. The common row factor is the mask at $g'$,
    whose Poisson expansion gives the one divisor $d_2$, while the signal calculation above gives the displayed
    two $L$ factors and ray quotient. The restored principal pair $z_1 = z_2 = 1$ agrees by $G \( 1 \) = 1$.
    Its separate cost, and the raw complement removed before this formula, have already been bounded.
    Thus this is an equality for the specified component of the positive majorant, not for the original signed block.
  Define the summand of Equation (2.98) on all individually admissible squarefree $z_1 \,
    z_2$ by its displayed quotient-free $L$ factors, fixed-ray quotient, formal product norms, full kernel,
    and unchanged $cal(B)_2$. It agrees with the genuine formula on coprime pairs. Insert the complete identity
  $ 1_(\( z_1 \, z_2 \) = 1) = sum_(v' divides \( z_1 \, z_2 \)) mu \( v' \) \, wide z_a = v' n_a \, $
  before any factorwise estimate. Let $v gt.eq 0$ be the center of the squarefree $v'$-dyad and $hat(v) =
    log_Z q_(v')$. The $n_a$ are squarefree, with $\( v' \, n_a \) = 1$; they need not be mutually coprime.
    No primitive Poisson formula is used on this extension. For squarefree $v'$ put
  $ D_o \( v' \; d_2 \, k'' \) = a_0 \( v' \) nu_i \( v' \) rho \( v' \) 1_(\( v' \, r_0 \) = 1)
    chi_(v') \( H_o \)^4 chi_(v') \( d_0 \) overline(chi_(v') \( d_2 \)) chi_(v') \( k'' \) . $
  On squarefree coprime $v' \, n$, the exact extraction is
  #[#set math.equation(numbering: n => "(2.99)")
   $ L_(o \, d_2 \, k'') \( v' n \) =  & D_o \( v' \; d_2 \, k'' \) a_0 \( n \) nu_i \( n \) rho \( n \)
     1_(\( n \, r_0 \) = 1)\
 & times chi_n \( H_o \)^4 chi_n \( d_0 \) overline(chi_n \( d_2 \)) chi_n \( k'' \) chi_n \( v' \)^4 .
   $ <eq:inverse-second-extraction>]
  This uses $a_0 \( v' n \) = a_0 \( v' \) a_0 \( n \) chi_n \( v' \)^4$.
    On an overlap the right side defines the extension to be zero by $chi_n \( v' \)^4$,
    without evaluating a nonsquarefree Gauss sum. The two common factors give $\|
    D_o \( v' \; d_2 \, k'' \) \|^2$, including the zero $\( v' \, k'' \) = 1$ and its fixed-puncture, $d_0$,
    and label zeros. They remain in the outer weight through Cauchy.
    The old gcd also leaves $1_(\( v' \, g' \) = 1)$. Since $D_o$ vanishes on $\( v' \, C J \) > 1$,
    we retain equivalently the explicit outer factor $1_(\( v' \, g' C J \) = 1)$, which repeats that label zero.
  Set $r_g = g' \/ d_2$, $k_(upright("new")) = d_k d_2 k''$ and $f_(upright("new")) = J C d_2 v'$.
    All moving factors on $n$ satisfy the complete zero-extended identity
  #[#set math.equation(numbering: n => "(2.100)")
   $ chi_n \( d_k \) chi_n \( k'' \) overline(chi_n \( d_2 \)) chi_n \( C J \)^4 chi_n \( v' \)^4 =
     chi_n \( k_(upright("new")) \) chi_n \( f_(upright("new")) \)^4 . $ <eq:inverse-moving-characters>]
  It uses $overline(chi_n \( d_2 \)) = chi_n \( d_2 \) chi_n \( d_2 \)^4$, also on nonunits.
    The residual gcd with $g' = d_2 r_g$ splits into the repeated zero at $d_2$ and the fixed puncture at $r_g$.
    The old punctures at $q_0 \, t'$ remain. If $cal(C)_(upright("ray"))$ denotes the fixed group through which
    $G$ factors, put
  $ hat(G) \( theta.alt \) = \| cal(C)_(upright("ray")) \|^(- 1) sum_(c in cal(C)_(upright("ray"))) G \( c \)
    overline(theta.alt \( c \)) . $
  Then
  $ G \( \[ n_2 \] \[ n_1 \]^(- 1) \) = sum_(theta.alt in hat(cal(C))_(upright("ray"))) hat(G) \( theta.alt \)
    overline(theta.alt \( n_1 \)) theta.alt \( n_2 \) . $
  Thus both new polynomials in a fixed ray summand use the same $nu_i overline(theta.alt)$,
    and its one bounded coefficient $hat(G) \( theta.alt \)$ remains outer.
  ======= 2.6.5.9 The new canonical data and their admissibility. <the-new-canonical-data-and-their-admissibility.>
  The second transformation has returned the moving characters to canonical form.
    We now identify which data will be fixed and which will remain averaged.
    This distinction also determines the puncture of the child.
    Put $nu'_a = nu_i overline(theta.alt)$ for both sides and define
  #[#set math.equation(numbering: n => "(2.101)")
   $ gamma = \( q_0 \, t' \, r_g \) \, wide r_g = g' \/ d_2 \,\
k_(upright("new")) = d_k d_2 k'' \, wide f_(upright("new")) = J C d_2 v' \,\
rho' \( n \) = rho_gamma \( n \) = rho \( n \) 1_(\( n \, "rad" q_0 t' r_g \) = 1) . $ <eq:canonical-child-data>]
  On the nonzero coefficient support, $J \, C \, d_2 \, v'$ are squarefree and pairwise coprime:
    $\( C \, J \) = 1$ belongs to $frak(O)_sigma$, $\| B_o \( g' \) \|^2$ forces $\( g' \, C J \) = 1$,
    $d_2 divides g'$, and the retained zero of $D_o$, together with the old gcd restriction,
    gives $\( v' \, g' C J \) = 1$. Thus $f_(upright("new"))$ is squarefree on that support.
    These common factors remain in the outer weight through Cauchy.
  The triple $gamma$ will be fixed before the child row and label sums.
    Its puncture $rho_gamma$ is therefore independent of those two averaging variables.
    The ideals $J \, C \, d_2 \, v'$ remain in the new averaged label; they are not counted as additional fixed labels.
  Apply Equation (2.73) on each selected-side copy with the ordered list $\( d_2 \, r_g \, v' \; n_a \)$.
    Let $I'_a$ be the subcollection of the selected side’s slots retained on $n_a$ in copy $a$.
    Assigned primes and their priority masks remain outer. A surviving prime dividing $n$ is already prime to $J C
    d_2 v'$ by the fourth-power zero and to $"rad" q_0 \, t' \, r_g$ by the fixed puncture.
    These also supply every earlier survival exclusion because $"supp" frak(B) subset "supp" \( J q_0 \)$.
    The surviving mark is therefore an original product-form subcollection.
    An old slot described as assigned to $J$ is only a regrouping of an old $b_a \,
    frak(A)_a$ assignment by this derived support, not a new independent prime choice.
  Keep $cal(B)_2$ outside the Fourier separation of the full kernel and old windows.
    Let $I_g \, I_d \, I_v \, I_k$ be the full supports of the current individual dyad cutoffs $psi_g \,
    psi_(d_2) \, psi_v \, psi_(k'')$. Choose fresh cutoffs $omega_(n \, a)$ equal to one on the support of $W_i$
    divided by $I_g I_v$, with fixed full supports in an interval $\[ a \, b \]$, where $b gt.eq 1$.
    Choose a nonnegative $omega_f$ equal to one on $I_J I_C I_d I_v$, with fixed full support $I_f$.
    Include these full supports, and the reconstructed formal product $g' v' n$ on them,
    in the finite window family $cal(I)_D$ specified above. These full fresh child windows give the formal centers
    and support bounds
  #[#set math.equation(numbering: n => "(2.102)")
   $ N_c = r - A_i - B - t - g - v \, wide V_c = B + theta + v + j \, wide F_c = N_c + V_c \,\
\| hat(n)_(upright("child")) - N_c \| lt.eq 6 eta \, wide \| hat(f)_(upright("new")) - V_c \| lt.eq
  4 eta . $ <eq:canonical-child-lengths>]
  On the factorized expression the bounds follow from the exact products $n_i =
    frak(A)_i C t' g' v' n_(upright("child"))$ and $f_(upright("new")) = J C d_2 v'$.
    The full fresh child cutoff and the full enlarged label window are included in $cal(I)_D$,
    so the same bounds hold directly on their supports when independent terms are later added by positivity.
    Those added terms are not asserted to arise from a parent factorization.
    During the current separation, the reconstructed formal product $x =
    g' v' n$ on the full fresh cutoff is also included in $cal(I)_D$;
    thus the $4 eta$ bound used in the second prefactor holds on the whole separated side.
  Keep the nonnegative label center $V_c$ without rounding it upward.
    Proceed to a child only if the retained row component is nonzero;
    then the outer ball has $M_(upright("ch")) gt.eq 0$. This gate is separate from any structural outer index
    set, which may contain zero-weight tuples even when $cal(B)_2$ is identically zero.
    Similarly, if a full fresh child column window contains no squarefree ideal,
    its polynomial is zero and that component is omitted. If $N_c < 0$ and a child column exists,
    its norm is at least one, and Equation (2.102) gives $- 6 eta lt.eq N_c < 0$. For a retained nonempty child define
  #[#set math.equation(numbering: n => "(2.103)")
   $ N_(upright("ch")) = max \( 0 \, N_c \) \, wide delta_N = N_(upright("ch")) - N_c in \[ 0 \, 6 eta \] \, wide
     F_(upright("ch")) = N_(upright("ch")) + V_c = F_c + delta_N . $ <eq:inverse-child-clipping>]
  This is a bounded change of the test, not a $Z^eta$-wide support enlargement.
    Use the fixed enclosing support interval $\[ a \, b \]$ chosen above.
    If $N_c < 0$, nonemptiness gives $Z^(delta_N) lt.eq b$; if $N_c gt.eq 0$, then $delta_N =
    0$ and the same bound follows from $b gt.eq 1$. Thus $1 lt.eq Z^(delta_N) lt.eq b$ in both cases.
    The fresh annular cutoffs $omega_(n \, a) \( Z^(delta_N) y \)$ have support in $\[ a \/ b \, b \]$ and
    uniformly bounded Euler seminorms. Their scale depends only on the fixed sector centers,
    not on a current row or label. The full union of these clipping supports is included in $cal(I)_D$.
  Fix a refinement $sigma$ of $sigma_0$ by its $v'$-dyad, second ray summand and slot branches.
    Let $Xi_sigma$ consist of
  $
    xi = \( o \, g' med upright("sf") \, d_2 divides g' \, v' med upright("sf") \, k'' eq.not 0 \;
    upright("new assigned slot primes") \) $
  with the retained individual supports and slot branches. It contains neither the old $f \,
    h$ nor the current column indices $n_1 \, n_2$. The identities defining $R_1 \, E \, J \,
    q_0$ are inherited from $o$, and $gamma \, k_(upright("new")) \,
    f_(upright("new"))$ are the displayed functions of $xi$. The set may be taken before imposing $cal(B)_2$ and
    $\( v' \, g' C J \) = 1$, retaining those masks in the signed outer weight.
    Let $cal(A)_(2 \, sigma) \( xi \)$ be the product of all newly assigned original slot coefficients and their
    priority masks, conjugated on side two.
  Let $frak(X)_sigma^(upright("src"))$ be the structural outer set of this transformed component,
    before adding any independent child rows or labels. It retains $o in frak(O)_sigma$,
    in particular the exact reconstruction $b_1 b_2 = q_0^2 J_2^2 s$, the derived $J = s J_2 \, q_0$,
    and the full fixed $b_1 \, b_2 \, t'$ dyad supports; it also retains the fixed $g' \, d_2$ supports,
    $d_2 divides g'$, and its other outer arithmetic and slot conditions.
    Zero-weight tuples may be retained, and unit Fourier phases are ignored in defining this structural set.
    Define the set of distinct triples, with no witness multiplicity, by
  #[#set math.equation(numbering: n => "(2.104)")
   $ Gamma_sigma = { \( q_0 \, t' \, r_g = g' \/ d_2 \) : xi in frak(X)_sigma^(upright("src")) } .
     $ <eq:inverse-source-triples>]
  This projection is taken once over all possible current rows and labels,
    before fixing any $k_(upright("new")) \, f_(upright("new"))$ or Fourier mode.
    Every nonzero transformed term maps into it. Every member has a source witness, which gives $hat(c) lt.eq
    ell + eta$, $hat(t) lt.eq t + eta$, and $log_Z q_(r_g) lt.eq g - theta + 2 eta$.
    The first of these bounds will be needed for the child puncture;
    the containing norm balls used for counting do not imply it.
    The nonempty row and child-column gates stated above remain separate from this structural projection.
  Put
  $ D_c = ell + A_i + t + g - theta + V . $
  Since $r = N - 3 ell$ is an exact definition tied to the fixed parent,
    substitution in Equations (2.102) and (2.94) gives the exact formal identities
  #[#set math.equation(numbering: n => "(2.105)")
   $ F_c = F - D_c - 2 ell + j \, wide M_c = M - 2 D_c - 2 ell + j \,\
F_c - M_c = F - M + D_c \,\
4 F_c - 3 M_c = 4 F - 3 M + 2 \( A_i + t + g - theta + V \) + j . $ <eq:canonical-transition>]
  These identities involve the same fixed $F = N + V$ as Equation (2.66), not an actual parent norm.
  For every $gamma in Gamma_sigma$, choose any source witness.
    Its actual divisibility $d_2 divides g'$ and Equation (2.81) give
  $ hat(theta) lt.eq hat(g) \, wide hat(j) lt.eq 2 hat(ell)_(upright("pair")) \, wide hat(c) lt.eq
    hat(ell)_(upright("pair")) . $
  Consequently the only actual-to-center inequalities needed here are
  #[#set math.equation(numbering: n => "(2.106)")
   $ g - theta gt.eq - 2 eta \, wide j lt.eq 2 ell + 3 eta \, wide hat(c) lt.eq ell +
     eta . $ <eq:inverse-center-inequalities>]
  The first two are not asserted with zero error. In particular the third inequality holds for every fixed triple
    because of its source witness, even though it need not hold throughout the containing count ball.
    The new radical in Equation (2.101) has actual logarithmic norm $Q_(upright("new")) = Q_gamma$, satisfying
  #[#set math.equation(numbering: n => "(2.107)")
   $ Q_(upright("new")) & lt.eq Q + hat(c) + hat(t) + hat(g) - hat(theta)\
 & lt.eq Q + ell + t + g - theta + 4 eta lt.eq Q + D_c + 4 eta . $ <eq:inverse-new-puncture>]
  This also holds when its factors share primes with the old puncture,
    because taking the radical only decreases the norm. The last inequality uses $A_i \, V gt.eq 0$.
  Use $F_(upright("ch")) = F_c + delta_N$, $M_(upright("ch")) = M_c + eta$, and $2 \( A_i + t + g - theta + V \) +
    j gt.eq - 4 eta$ in Equation (2.105). The two child margins satisfy
  #[#set math.equation(numbering: n => "(2.108)")
   $ F_(upright("ch")) - M_(upright("ch")) - Q_(upright("new")) - z_0 & gt.eq c_(upright("node")) + delta_N -
     5 eta gt.eq c_(upright("node")) - 5 eta \,\
4 F_(upright("ch")) - 3 M_(upright("ch")) - 6 z_0 & gt.eq c_(upright("node")) + 4 delta_N - 7 eta gt.eq
  c_(upright("node")) - 7 eta . $ <eq:inverse-child-margins>]
  The nominal cap $z_0$ is unchanged because the surviving mark is a subcollection.
    Moreover $D_c gt.eq ell + V - 2 eta$ and $2 ell - j gt.eq - 3 eta$, whence
  #[#set math.equation(numbering: n => "(2.109)")
   $ M - M_(upright("ch")) = 2 D_c + 2 ell - j - eta gt.eq 2 \( ell + V \) - 8 eta gt.eq 2 d -
     8 eta . $ <eq:inverse-row-decrease>]
  For $eta lt.eq d \/ 16$ this is at least $3 d \/ 2$, hence at least $d$.
    The same identities give $F_c lt.eq F - ell - V + 5 eta$, so $F_(upright("ch")) lt.eq F + 11 eta$.
    Because its two summands are nonnegative, this bounds the child $N_(upright("ch")) \, V_c$ through the finite depth.
  The arithmetic construction has thus produced admissible child ranges with a smaller row length.
    We next express the transformed sum in their canonical polynomials.
    The required Fourier density is common to all triples $gamma$, rows and labels;
    only after that identity will we apply Cauchy and dominate the reconstruction multiplicities.
  ======= 2.6.5.10 A common density for the second transformed sum. <a-common-density-for-the-second-transformed-sum.>
  Before any actual outer ideal is summed, use the six independent coordinates
  $ \( y_g \, y_d \, y_v \, y_k \, y_1 \, y_2 \) =
    (q_(g') / Z^g \, q_(d_2) / Z^theta \, q_(v') / Z^v \, q_(k'') / Z^(h_2) \, q_(n_1) / Z^(N_c) \, q_(n_2) /
    Z^(N_c)) . $
  Use the fresh cutoffs $omega_(n \, a) \, omega_f$ already chosen.
    Retain the four current dyad cutoffs and $omega_f$ outside inversion, and $omega_(n \, a)$ in the two columns.
    Let $Omega_(2 \, alpha)$ be larger cutoffs equal to one on the full supports of the corresponding four dyad
    and two column cutoffs. These full supports, $I_f$, and the formal products $g' v'
    n$ on them are the windows already included in $cal(I)_D$.
  The exact second root and kernel argument are
  #[#set math.equation(numbering: n => "(2.110)")
   $ frac(K, q_(d_2) q_(v') sqrt(q_(n_1) q_(n_2))) & = Z^(lambda_c + 12 eta + tau) y_d^(- 1)
     y_v^(- 1) \( y_1 y_2 \)^(- 1 \/ 2) \,\
frac(K q_(k''), q_(d_2) q_(v')^2 q_(n_1) q_(n_2)) & = A_(upright("ker") \, 2) frac(y_k, y_d y_v^2 y_1 y_2) \,\
A_(upright("ker") \, 2) & = Z^(H_(upright("use")) + h_2 - theta - 2 v - 2 N_c) . $ <eq:inverse-second-root-kernel>]
  Indeed $N_c = s_i - g - v$ and $lambda_c = H_c - theta - \( s_i - g \)$. Define the one ambient profile
  #[#set math.equation(numbering: n => "(2.111)")
   $ frak(H)_(2 \, sigma \, bold(t)) \( bold(y) \) =  & Z^(- 6 eta) product_alpha Omega_(2 \, alpha) \( y_alpha \)
     y_d^(- 1) y_v^(- 1) \( y_1 y_2 \)^(- 1 \/ 2)\
 & times W_i \( y_g y_v y_1 \) overline(W_i \( y_g y_v y_2 \)) cal(K)_2 #h(-0.16667em)
   (A_(upright("ker") \, 2) frac(y_k, y_d y_v^2 y_1 y_2)) . $ <eq:inverse-second-profile>]
  The scalar outside it is exactly $Z^(lambda_c + 18 eta + tau)$.
    The full $q_(d_2)$ denominator and both normalized real column roots are in this profile,
    and no such root is appended to the final tests.
  For $bold(zeta) = \( zeta_g \, zeta_d \, zeta_v \, zeta_k \, zeta_1 \, zeta_2 \)$, put $z_n =
    q_n \/ Z^(N_(upright("ch")))$ and define
  $ W'_a \( z \) = omega_(n \, a) \( Z^(delta_N) z \) z^(epsilon_a i zeta_a) \, wide nu'_a =
    nu_i overline(theta.alt) \, wide frak(d)'_a = frak(d)_(I'_a) . $
  The polynomial on either new Cauchy side is then exactly
  #[#set math.equation(numbering: n => "(2.112)")
   $ Q_(a \, gamma \, bold(zeta)) \( k_(upright("new")) \, f_(upright("new")) \) =  & sum_(n med upright("sf"))
     macron(alpha) \( n \) gamma_2 \( n \) nu'_a \( n \) rho' \( n \) chi_n \( k_(upright("new")) \)\
 & times chi_n \( f_(upright("new")) \)^4 frak(d)'_a \( n \) W'_a \( q_n \/ Z^(N_(upright("ch"))) \) .
   $ <eq:canonical-child-polynomial>]
  After $q_0 \, t' \, g' \/ d_2$ and the finite ray sector are fixed, $nu'_a$ and $rho'$ are independent of $J \,
    C \, d_2 \, v'$ and the new row. The only new characters on $n$ are the explicitly displayed row and
    fourth-power factors; all other phases involving the old $b_i \,
    frak(A)_i$ were placed in Equation (2.82) or in the old row $tilde(h)$.
    The separated annular weight $W'_a$ is also independent of the new row and label.
    The complete remaining outer weight is
  #[#set math.equation(numbering: n => "(2.113)")
   $ V_sigma \( xi \; bold(zeta) \) =  & w_o^(+) mu \( d_2 \) mu \( v' \) hat(G) \( theta.alt \) \|
     B_o \( g' \) \|^2 \| D_o \( v' \; d_2 \, k'' \) \|^2 1_(\( v' \, g' C J \) = 1) cal(B)_2 \( k'' \)\
 & times cal(A)_(2 \, sigma) \( xi \) psi_g \( y_g \) psi_(d_2) \( y_d \) psi_v \( y_v \) psi_(k'') \( y_k \)
   omega_f \( q_(f_(upright("new"))) \/ Z^(V_c) \)\
 & times y_g^(i zeta_g) y_d^(i zeta_d) y_v^(i zeta_v) y_k^(i zeta_k) Z^(i delta_N \( zeta_1 + zeta_2 \)) .
   $ <eq:inverse-second-outer-weight>]
  All old pure arithmetic and priority masks are retained in $frak(O)_sigma$,
    with their nonnegative old coefficient weight $w_o^(+)$. The displayed two common magnitudes retain every
    other common coefficient zero, including the one depending on $k''$.
    There is one $mu \( d_2 \)$, one $mu \( v' \)$, and one ray coefficient.
    The label cutoff is inserted as an equality on the original product supports and remains outer.
  Let $cal(T)_(sigma \, i)$ be the fixed $v'$-dyad, ray, and slot summand obtained from Equation (2.98) by the
    complete Möbius and slot expansions above. The exact identity needed for the child is
  #[#set math.equation(numbering: n => "(2.114)")
   $ cal(T)_(sigma \, i) =  & Z^(lambda_c + 18 eta + tau) \( 2 pi \)^(- 6) integral_(bb(R)^6)
     hat(frak(H))_(2 \, sigma \, bold(t)) \( bold(zeta) \)\
 & quad times sum_(xi in Xi_sigma) V_sigma \( xi \; bold(zeta) \)
   Q_(1 \, gamma \, bold(zeta)) \( k_(upright("new")) \, f_(upright("new")) \)
   overline(Q_(2 \, gamma \, bold(zeta)) \( k_(upright("new")) \, f_(upright("new")) \)) thin d bold(zeta) .
   $ <eq:inverse-xi-identity>]
  To check it, expand the two $Q$’s. Since $y_a = Z^(delta_N) z_(n_a)$,
    their modes together with the last factor of Equation (2.113) are exactly $y_1^(i zeta_1) y_2^(i zeta_2)$.
    The other four modes are outer. Equation (2.76) restores the full profile,
    whose larger cutoffs are one on the retained supports. The fresh column cutoffs are one wherever the old $W_i$
    factors are nonzero, and $omega_f = 1$ on every original label product.
    The scalar and profile therefore restore the full root, full kernel, and old windows.
    Equations (2.99), (2.100), and (2.73) restore the arithmetic factors term by term.
    The fixed-box sums are finite and Equation (2.77) justifies the integral.
    Extra combinations in the full fresh windows cancel through the old windows in this complex Fourier identity
    before Cauchy; only later are they kept independently in a positive sum.
  The density in Equation (2.114) depends on the fixed sector, $Z$, the fixed tests and $bold(t)$,
    not on actual $gamma \, k_(upright("new")) \, f_(upright("new"))$.
    The coupled kernel uses the bare $k''$ coordinate, not the derived row;
    the latter appears only in characters and $cal(B)_2$. The derived label appears only in characters and its
    outer cutoff. Relations such as $g' = d_2 r_g$ restrict evaluation points, not the transform.
    For every fixed $B_(upright("ht")) \, J_(upright("ht")) gt.eq 0$,
    the Euler calculation in Equation (2.77) gives some fixed $b$ with
  #[#set math.equation(numbering: n => "(2.115)")
   $ integral_(bb(R)^9) integral_(bb(R)^6) \| hat(frak(H))_(1 \, sigma) \( bold(t) \) \| \|
     hat(frak(H))_(2 \, sigma \, bold(t)) \( bold(zeta) \) \| \( 1 + \| bold(t) \| \)^(B_(upright("ht"))) \(
     1 + \| bold(zeta) \| \)^(J_(upright("ht"))) thin d bold(zeta) thin d bold(t) lt.double p_b \( W \)^2 .
     $ <eq:inverse-joint-fourier-moments>]
  Indeed the inner weighted integral is polynomial in $bold(t)$,
    because $W_i$ is a fixed cutoff times a unit norm mode; apply the first transform’s bound at that polynomial
    order plus $B_(upright("ht"))$. The constants are uniform in every actual ideal and every positive kernel
    scalar, with no height-order power of $Z$.
  ======= 2.6.5.11 The second Cauchy inequality and the outer counts. <the-second-cauchy-inequality-and-the-outer-counts.>
  Apply Equation (D) to the second transformed sum with $U_a =
    Z^(\( lambda_c + 18 eta + tau \) \/ 2) Q_(a \, gamma \, bold(zeta))$ on the complete set $Xi_sigma$,
    for each fixed Fourier mode. In particular $cal(B)_2$, $\| B_o \|^2$, $\| D_o \|^2$,
    and $1_(\( v' \, g' C J \) = 1)$ are still in its weight.
    They retain the squarefreeness of $f_(upright("new"))$ proved above.
    All other factors in the weight are bounded by a fixed constant,
    including the bounded number of original assigned slot coefficients, the fixed ray coefficient,
    the individual cutoffs, and the unit modes. Consequently, only after Cauchy, the absolute weights obey
  $ \| V_sigma \( xi \; bold(zeta) \) \| lt.double cal(B)_2 \( k'' \) mu^2 \( f_(upright("new")) \) . $
  This is the step which permits the new averaged ideal to remain in the squarefree class.
  We first record the exact reconstruction needed to dominate a fibre.
  #[#set math.equation(numbering: n => "(2.116)")
   $ d_k divides C frak(B) \/ R_1 quad arrow.r.double quad d_k divides f_(upright("new")) "rad" q_0 .
     $ <eq:poisson-divisor-reconstruction>]
  To prove this, a prime of $frak(B) \/ R_1$ has $t_p = 0$.
    The local table shows that it has even parity and equal $a_(i p)$.
    If both are one it is in $J_2$, and if both are zero it is in $"rad" q_0$.
    Primes of $C$ are already in $f_(upright("new"))$. This proves the implication.
    Thus $d_k$ also has divisor multiplicity after $f_(upright("new")) \, q_0$ are specified.
    Once these factors are fixed, $k''$ is uniquely determined by the element $k_(upright("new")) = d_k d_2 k''$.
  Let $K_(upright("slot"))$ bound the original number of slots.
    At fixed $gamma = \( q_0 \, t' \, r_g \)$, squarefree $f = f_(upright("new"))$, and element $k =
    k_(upright("new"))$, the number of possible $xi in Xi_sigma$ with nonzero weight is at most a fixed constant
    times $D_(K_(upright("slot"))) \( f \) C_(K_(upright("slot"))) \( gamma \)$, where
  #[#set math.equation(numbering: n => "(2.117)")
   $ D_(K_(upright("slot"))) \( f \) & = d_(cal(O)) \( f \)^(9 + 4 K_(upright("slot"))) \,\
C_(K_(upright("slot"))) \( gamma \) & = d_(cal(O)) \( q_0 \)^(5 + 2 K_(upright("slot")))
  d_(cal(O)) \( t' \)^(2 K_(upright("slot"))) d_(cal(O)) \( r_g \)^(2 K_(upright("slot"))) \, $ <eq:inverse-new-fibre>]
  Here and below $d_(cal(O))$ denotes the ideal divisor count.
    For completeness, the ordered allocation of $f$ into $J \, C \, d_2 \, v'$ costs $4^(omega \( f \)) =
    d_(cal(O)) \( f \)^2$, and splitting $J = s J_2$ costs at most $d_(cal(O)) \( f \)$.
    The choices of $b_1 \, b_2$ with $b_1 b_2 = q_0^2 J_2^2 s$ cost at most $d_(cal(O)) \( q_0 \)^2
    d_(cal(O)) \( f \)^3$; the two choices $frak(A)_a divides
    "rad" \( b_1 b_2 \)$ cost at most $d_(cal(O)) \( q_0 \)^2 d_(cal(O)) \( f \)^2$.
    These estimates use $d_(cal(O)) \( I J \) lt.eq d_(cal(O)) \( I \)
    d_(cal(O)) \( J \)$ and $d_(cal(O)) \( I^2 \) lt.eq d_(cal(O)) \( I \)^2$.
    Equation (2.116) costs at most $d_(cal(O)) \( q_0 \) d_(cal(O)) \( f \)$ choices for $d_k$.
    Then $g' = d_2 r_g$ is fixed, and $k'' = k \/ \( d_k d_2 \)$ is the unique element if it is integral.
    The at most $2 K_(upright("slot"))$ old assigned primes divide $q_0 f t'$,
    so their choices cost at most
    $\[ d_(cal(O)) \( q_0 \) d_(cal(O)) \( f \) d_(cal(O)) \( t' \) \]^(2 K_(upright("slot")))$.
    The at most $2 K_(upright("slot"))$ new assigned primes divide $f r_g$,
    and cost at most $\[ d_(cal(O)) \( f \) d_(cal(O)) \( r_g \) \]^(2 K_(upright("slot")))$.
    The other first side’s surviving slots disappeared on selecting the first positive side;
    the selected surviving slots occur twice in its new square, exactly as counted here.
    Thus the displayed product dominates the fibre even if its actual size depends on $k$.
    There is no count of the old $f \, h$, no independent count of $J \, C \, d_2 \, v'$, and no second frequency count.
  Equation (2.91) and the same source witnesses place $Gamma_sigma$ inside the product of the three norm balls
  $ q_(q_0) lt.eq Z^(ell + R \/ 2 - j + 5 eta \/ 2) \, wide q_(t') lt.eq Z^(t + eta) \, wide q_(r_g) lt.eq
    Z^(g - theta + 2 eta) . $
  We use these balls only to bound the number of distinct triples,
    not as a replacement domain for the child estimate. Ideal counting gives
  #[#set math.equation(numbering: n => "(2.118)")
   $ \# Gamma_sigma lt.eq C Z^(C_c + 11 eta \/ 2 + pi_(upright("count"))) \, wide C_c = ell + R \/ 2 - j + t + g -
     theta . $ <eq:canonical-fixed-count>]
  Here $pi_(upright("count"))$ is part of the separately chosen aggregate $pi$.
    In a nonempty sector each upper exponent of these three balls is nonnegative,
    since it bounds the norm of an existing ideal; the constant term in ideal counting therefore adds no boundary
    power. In particular $J$ is not counted here. The ranges of all three ideals are bounded,
    so the adjustable divisor bound gives $C_(K_(upright("slot"))) \( gamma \) lt.double
    Z^(pi_(upright("fib")))$ uniformly on the containing balls.
    Put $c_sigma = C_c + 11 eta \/ 2$ and introduce the genuinely row- and label-independent measure
  #[#set math.equation(numbering: n => "(2.119)")
   $ d nu_sigma \( gamma \) = Z^(- c_sigma) sum_(gamma in Gamma_sigma) C_(K_(upright("slot"))) \( gamma \)
     delta_gamma \, wide parallel nu_sigma parallel lt.double Z^(pi_(upright("count")) + pi_(upright("fib"))) .
     $ <eq:inverse-normalized-triples>]
  ======= 2.6.5.12 The positive canonical children. <the-positive-canonical-children.>
  For a fixed Fourier mode define the positive child sums
  #[#set math.equation(numbering: n => "(2.120)")
   $ cal(H)_(a \, gamma) =  & sum_(f med upright("sf")\
q_f \/ Z^(V_c) in I_f) D_(K_(upright("slot"))) \( f \) sum_(k in cal(O)\
0 < q_k lt.eq Z^(M_(upright("ch")))) \| Q_(a \, gamma \, bold(zeta)) \( k \, f \) \|^2 =
  Z^(F_(upright("ch"))) cal(E)_(a \, gamma) . $ <eq:inverse-positive-child>]
  The equality is the normalization of Equation (2.60) with this same row ball,
    the label weight $D_(K_(upright("slot")))$, and the test and puncture in Equations (2.112) and (2.101);
    if a larger fixed row ball is used there, this equality is instead an inequality in the needed upper-bound
    direction. The weight depends on $f$ alone. After reindexing, $cal(B)_2$ is exactly the displayed row ball.
    Only the now positive outer row and label sums have been enlarged to their full fixed windows.
    The columns use their full fixed fresh windows, but their puncture, mark,
    and test have not been deleted or changed. The actual fibre domination just proved gives
  $ lr(|sum_(xi in Xi_sigma) V_sigma Q_1 overline(Q_2)|) & lt.eq
    product_(a = 1)^2 (sum_(xi in Xi_sigma) \| V_sigma \| \| Q_a \|^2)^(1 \/ 2)\
 & lt.double Z^(c_sigma) product_(a = 1)^2
   (integral_(Gamma_sigma) cal(H)_(a \, gamma) thin d nu_sigma \( gamma \))^(1 \/ 2) . $
  Here $Q_a = Q_(a \, gamma \, bold(zeta)) \( k_(upright("new")) \, f_(upright("new")) \)$.
    The two square roots each supply $Z^(c_sigma \/ 2)$, hence there is one fixed-count factor.
    A uniform child bound supplies one total mass $parallel nu_sigma parallel$, not its square.
    The child bound will be used only for $gamma in Gamma_sigma$,
    using the hypotheses already verified in Equation (2.108).
  ======= 2.6.5.13 The energy exponent. <the-energy-exponent.>
  The formal centers satisfy the exact identity
  #[#set math.equation(numbering: n => "(2.121)")
   $ kappa_i + lambda_c + C_c + 2 F_c = F . $ <eq:canonical-prefactor>]
  This follows by substituting their definitions and $H_c = 2 r - 2 B - M + 4 ell + 2 V + delta - j$;
    all extracted lengths cancel and the result is $r + 3 ell + V = N + V$.
  We now use the child estimate only for $gamma in Gamma_sigma$,
    for which the preceding margins and row decrease have been proved.
    If it gives $cal(E)_(a \, gamma) lt.double C \( bold(t) \, bold(zeta) \)
    Z^(F_(upright("ch")) + epsilon.alt_(upright("child")))$ uniformly there,
    with its fixed polynomial height dependence, then Equation (2.120) and the final weighted Cauchy bound above give
  $ lr(|sum_(xi in Xi_sigma) V_sigma Q_1 overline(Q_2)|) lt.double C \( bold(t) \, bold(zeta) \)
    Z^(c_sigma + 2 F_(upright("ch")) + epsilon.alt_(upright("child"))) parallel nu_sigma parallel . $
  The normalized mass is the one in Equation (2.119); witness multiplicity is already in its fibre weights.
    The common Fourier density is then integrated once using Equation (2.115).
    It is not part of the discrete measure and is not chosen afresh for any row or label.
    Thus both the genuine outer count and its normalized mass occur once.
    The averaged $J \, C \, d_2 \, v'$ stay inside the positive child sum and are not also counted.
  If a child is bounded by $Z^(F_(upright("ch")) + epsilon.alt_(upright("child")))$, the first prefactor error,
    the second prefactor error, the fixed count, and the restored normalization give on each positive second-Cauchy side
  #[#set math.equation(numbering: n => "(2.122)")
   $ & kappa_i + lambda_c + C_c + 2 F_(upright("ch")) + \( 9 / 2 + 18 + 11 / 2 \) eta + tau + pi +
     epsilon.alt_(upright("child"))\
 & wide = F + 28 eta + 2 delta_N + tau + pi + epsilon.alt_(upright("child"))\
 & wide lt.eq F + 40 eta + tau + pi + epsilon.alt_(upright("child")) . $ <eq:inverse-step-loss>]
  Both copies of $delta_N$ are present: one restores the child column normalization and the other occurs in its
    asserted exponent. Each of the two weighted Cauchy inequalities takes a geometric mean of its positive sides,
    so it does not double this loss. The first principal bound is $Z^(M + pi)$,
    and the second principal bound above is at most $Z^(F + 26 eta + tau + pi)$; both fit the same allowance.
  The parameter $pi$ has an independent quantifier. Let $J_(upright("step"))$ be the maximum number of uses of a
    free divisor or sieve exponent and of logarithmic dyadic-count factors in one fixed two-Poisson,
    two-Cauchy factorization tree, maximized over the finitely many assignments with at most the fixed slot bound.
    Once $L_(upright("pow"))$ bounds the log-length of every scale product in such a use,
    choose each free input exponent at most $pi \/ \( 2 J_(upright("step")) max \( 1 \, L_(upright("pow")) \) \)$.
    For sufficiently large $Z$, the product of the at most $J_(upright("step"))$ logarithmic factors is at most
    $Z^(pi \/ 2)$. These choices make all non-center, non-frequency local losses at most $C Z^pi$.
    They include the retained common frequency dyads and the reconstruction divisor bounds.
    In particular the distinct allocations $pi_beta \, pi_(upright("old")) \, pi_(upright("count")) \,
    pi_(upright("fib"))$ and the finite-union dyadic allocation are parts of this single aggregate,
    not repeated allowances of size $pi$. Fixed ray sums and fixed seminorm constants are constants.
    The same convention defines the aggregate terminal loss $pi_(upright("ref"))$.
    In particular $pi$ hides no multiple of $eta$ or $tau$.
  This proves the conditional reduction estimate (2.74), including its common-measure and finite-order uniformity
    once the choices below are made. It remains to fix those choices uniformly and apply the reduction through the
    finite depth.
  ======= 2.6.5.14 Order of choices and termination. <order-of-choices-and-termination.>
  For the requested canonical exponent $epsilon.alt_c = epsilon.alt$, first fix the starting ranges, tests,
    slot bound, $c_(*)$, and then $d \, D$ as at the beginning of the proof. Choose
  #[#set math.equation(numbering: n => "(2.123)")
   $ eta lt.eq min { d \/ 16 \, c_(*) \/ \( 14 D \) \, epsilon.alt_c \/ \( 160 D \) \, c_(*) \/ 1000 \, 1 \/ 100 } \,\
tau lt.eq min { epsilon.alt_c \/ \( 4 D \) \, c_(*) \/ 1000 \, 1 \/ 100 } \, wide pi lt.eq
  epsilon.alt_c \/ \( 4 D \) \, wide tau_(upright("ref")) \, pi_(upright("ref")) lt.eq
  c_(*) \/ 1000 . $ <eq:inverse-parameter-order>]
  Use this same $tau$ in both Poisson comparisons. At this point $pi$ is a target aggregate loss;
    its subsidiary input exponents are chosen only after the bounded scale range is known.
  Choose the individual cutoffs through depth $D$, including every full larger or fresh support and the bounded
    clipping families described above, and form $cal(I)_D \, L_(upright("win"))$.
    Include the product intervals for the active slots and the terminal constants $C_(upright("res")) \,
    C_(upright("width")) \, C_(upright("ker"))$, maximized through the depth.
    This is finite because there are finitely many factorization types per passage and finitely many passages. Put
  $ F_max = N_max + V_max + 11 D eta \, wide L_(upright("all")) = 100 \( 1 + M_max + F_max + z_(0 \, max) + c_(*) \) . $
  These bound all retained scale lengths. Indeed, Equation (2.109) and the bound following it give $M lt.eq
    M_max$ and $N \, V lt.eq F_max$. A nonempty column window has $r gt.eq - eta$,
    so $ell lt.eq \( F_max + eta \) \/ 3$. The displayed parent products bound every extracted divisor length by
    $2 F_max + 6 eta$. For example $d_k divides C "rad" \( b_1 b_2 \)$ gives $delta lt.eq r + 2 ell + 4 eta$,
    and Equation (2.83) then gives $H_(upright("use")) lt.eq 7 F_max + 18 eta + tau$.
    The terminal active conductor is supported on the row, $f$, the puncture, and slots;
    their total lengths are at most $M_max + 2 F_max + z_(0 \, max)$ plus the already displayed ratio allowances.
    Equations (2.68) and (2.25) bound the retained terminal dual lengths by $4 M_max + 4 F_max + 2 z_(0 \, max) +
    3 d + 12 eta + tau_(upright("ref"))$. Under Equation (2.123),
    all these bounds and the exact conductor product lengths are below $L_(upright("all"))$.
    We may now take $L_(upright("pow")) = L_(upright("all"))$ and choose the subsidiary small exponents that
    realize $pi$ and $pi_(upright("ref"))$.
  Define $B_(upright("crude"))$ to be the maximum exponent obtained by replacing every bounded nonfrequency ideal
    or element sum in either raw Poisson expansion, including both column sums,
    by its lattice count at length $L_(upright("all"))$, and every explicit norm factor, including $1 +
    a^(- 1)$ in Equation (2.78), by its absolute upper bound.
    Replace divisor-bounded coefficients and marks by their trivial polynomial norm bounds as well.
    Exclude only the frequency kernel itself. The expansions contain a fixed finite number of factors,
    so this defines a finite uniform number.
  For the reflected tail define $B_(upright("ref"))$ analogously using its bounded row, local,
    and active-product counts and $1 + a^(- 1)$ with $a = X \/ q_c^2$.
    Do not count discarded dual indices at a retained length. Instead, Equation (1.18) gives on its support
  $ frac(\| d \( mu \) \|, sqrt(q_mu)) lt.eq 27 q_lambda^(- k \/ 3) q_n^(- 1 \/ 2) q_b^(- 1) lt.eq
    27 q_lambda^(4 \/ 3) wide \( k gt.eq - 4 \) . $
  Every other local factor is bounded by the product of $q_p^(1 \/ 2)$ over the bounded active primes,
    independently of $mu$ after its indicators are dropped. Thus $B_(upright("ref"))$ covers all non-kernel
    coefficients and bounded counts, while the remaining $mu$-sum is an unrestricted lattice sum on $lambda^(- 4)
    cal(O)$.
  Fix a tail saving $T > 1 + B_(upright("crude")) + B_(upright("ref"))$. For each Poisson tail, choose a Schwartz order
  $ A > 1 + \( B_(upright("crude")) + T \) \/ tau . $
  Equation (2.78) with $Y = Z^tau$ then makes the discarded raw outer-ball complement $O \( Z^(- T) \)$,
    up to finitely many input seminorms and a fixed polynomial in any twist heights.
    For the reflected whole-dyad tail the actual argument is at least $Z^(tau_(upright("ref")) \/ 2)$;
    use the same lattice-shell bound on $lambda^(- 4) cal(O)$ and choose
  $ A_(upright("ref")) > 1 + 2 \( B_(upright("ref")) + T \) \/ tau_(upright("ref")) . $
  This proves the discarded-tail assertion without presuming any bound on the discarded dual lengths.
  Next choose the finitely many Fourier-height and smooth-seminorm orders backwards through depth $D$,
    above the chosen tail orders and the terminal input orders.
    Normalized inverse roots are fixed real powers on annuli,
    and Euler differentiation of a full kernel at a norm monomial introduces no scale power.
    Equations (2.115) and (2.119) supply the common coefficient measure for each positive indexed Cauchy-side sum.
    Apply Corollary 56 separately to those sums, using the child-profile bounds just proved from Lemma 9,
    and then take the displayed geometric means. The two square roots retain one normalized discrete mass,
    as already shown, so genuine outer labels are counted only once.
    Any external height cutoff in a later application is chosen after this internal finite propagation,
    not inserted into it.
  Finally choose $Z$ large enough for $log Z gt.eq L_(upright("win")) \/ eta$,
    the thresholds for $C_(upright("res")) \, C_(upright("width"))$ in Equation (2.68), $log Z gt.eq
    2 log C_(upright("ker")) \/ tau_(upright("ref"))$, $log Z gt.eq 4 log q_lambda \/ eta$,
    and the fixed $h$-annulus threshold used in the short completion.
    Impose also the logarithmic bounds defining the aggregate local losses and the thresholds of the input lemmas.
    All choices precede this final threshold and depend only on the fixed data.
    Bounded smaller $Z$ are handled by increasing the final constant.
  Now $c_h = c_(*) - 7 h eta gt.eq c_(*) \/ 2$ for $h lt.eq D$.
    Equations (2.108) and (2.109) send every retained nonterminal child to the next depth and its row cap.
    At depth $D$ that cap is negative, whereas every retained row parameter is nonnegative.
    The terminal bounds are at most $Z^F$; principals and recursive terms cost at most $L_(upright("step")) =
    40 eta + tau + pi$ in exponent. Backwards induction gives $Z^(F + \( D - h \) L_(upright("step")))$ at depth
    $h$, and
  $ D L_(upright("step")) lt.eq epsilon.alt_c \/ 4 + epsilon.alt_c \/ 4 + epsilon.alt_c \/ 4 < epsilon.alt_c . $
  This proves $cal(E) lt.double Z^(F_0 + epsilon.alt)$, with the claimed uniform finite-seminorm and
    polynomial-height dependence. ◻
]

===== 2.6.6 Initialization of the marked moment <initialization-of-the-marked-moment>

We now convert the inverse polynomial in Lemma 53 to the canonical family. Only one Poisson transformation is required.

#proof[
  In the product $M_u \( Z^r \; W \) Q_u$, let $P$ be the product of its slot primes and put $j = \( n \, P \)$.
    Both $n$ and $P$ are squarefree. Fix the subset of slots occurring in $j$, and write
  $ n = j n_0 \, wide P = j P_0 \, wide \( n_0 \, P_0 \) = 1 . $
  The product $c = n_0 P_0$ is squarefree. The identities
  $ mu \( n_0 \) = mu \( c \) mu \( P_0 \) \, wide psi_u \( n \) psi_u \( P \) = psi_u \( j \)^2 psi_u \( c \) $
  hold with all zero extensions. The sign $mu \( P_0 \)$ is a product of signs on the surviving slots and can be
    incorporated into their bounded coefficients. The coefficients thus remain of the form in Equation (2.15).
  For this fixed assigned subset define $G$ from its nominal slot centers:
  $ G = sum_(i med upright("assigned")) z_i \, wide z_0 = z - G \, wide D' = r + z - 2 G . $
  Then $G \, z_0 gt.eq 0$, and $z_0$ is exactly the surviving nominal cap. The normalization satisfies
  $ Z^(- \( r + z \) \/ 2) = Z^(- G) Z^(- D' \/ 2) . $
  The actual $j$ is the product of the assigned primes, so $q_j \/ Z^G$ lies in a fixed product interval.
    Ideal counting gives at most $C Z^G$ choices, apart from the separately chosen divisor loss for assignments.
    Triangle inequality in the row Hilbert space uses $Z^(- G)$ to cancel this count.
    The whole factor $psi_u \( j \)^2$ is a bounded row scalar, including its zeros,
    and is a contraction in that space. The residual column is prime to $j$,
    giving the fixed puncture $1_(\( c \, j \) = 1)$.
  Here is the exact identity underlying this overlap reduction.
    Let $I_0$ be the surviving subset and put $y_j = q_j \/ Z^G$, $y_c = q_c \/ Z^(D')$, and $y_i =
    q_(p_i) \/ Z^(z_i)$ for every slot. On the original support,
  $ q_n / Z^r = frac(y_j y_c, product_(i in I_0) y_i) . $
  For a fixed assigned tuple, its contribution $cal(U)_(u \, j)$ to $M_u \( Z^r \; W \) Q_u$ is exactly
  #[#set math.equation(numbering: n => "(2.124)")
   $ cal(U)_(u \, j) =  & mu \( j \) product_(i in.not I_0) a_i \( p_i \) W_i \( y_i \) thin Z^(- G)
     psi_u \( j \)^2 Z^(- D' \/ 2) sum_(c med upright("sf")\
\( c \, j \) = 1) mu \( c \) psi_u \( c \)\
 & quad times sum_(\( p_i \) in product_(i in I_0) cal(P)_i\
P_0 divides c) mu \( P_0 \) product_(i in I_0) a_i \( p_i \) W_i \( y_i \) W #h(-0.16667em)
  (frac(y_j y_c, product_(i in I_0) y_i)) . $ <eq:initial-overlap-polynomial>]
  Indeed a squarefree $c$ prime to $j$, together with a surviving tuple with $P_0 divides c$,
    reconstructs uniquely $n = j \( c \/ P_0 \)$ and the prescribed overlap.
    Squarefreeness of $c$ already gives $\( c \/ P_0 \, P_0 \) = 1$, so no further condition was lost.
    The sign $mu \( P_0 \)$ is a product of the individual prime signs.
    This also shows that the $j$ on both sides of every subsequent square is one fixed ideal:
    the preceding triangle inequality was taken before that square.
  The identity $c = n P \/ j^2$ puts $y_c$ in a fixed compact interval.
    This remains meaningful if $D'$ is slightly negative in a bounded nonempty window;
    $D'$ is not yet a canonical parameter. Choose a fresh individual cutoff $omega_c$ equal to one on this full
    quotient support. For fixed $j$, let $Omega_c$ be one on the full support of $omega_c$,
    and let $Omega_i$ be one on each full surviving individual slot support. The single joint profile
  $ frak(H)_(upright("ov") \, j) \( y_c \, \( y_i \)_(i in I_0) \) =
    Omega_c \( y_c \) product_(i in I_0) Omega_i \( y_i \) W #h(-0.16667em) (frac(y_j y_c, product_(i in I_0) y_i)) $
  is compactly supported in these independent coordinates. The current cutoff $omega_c$ and the individual factors
    $W_i \( y_i \)$ stay outside its transform. Equation (2.76), in dimension $1 + \| I_0 \|$,
    therefore expresses Equation (2.124) exactly as the same assigned scalar and $Z^(- G) psi_u \( j \)^2$, times
  $ \( 2 pi \)^(- 1 - \| I_0 \|) integral_(bb(R)^(1 + \| I_0 \|))
    hat(frak(H))_(upright("ov") \, j) \( bold(upsilon) \) Z^(- D' \/ 2) sum_(c med upright("sf")) mu \( c \)
    psi_u \( c \) 1_(\( c \, j \) = 1) frak(d)_(bold(upsilon)) \( c \) omega_c \( y_c \) y_c^(i upsilon_c) thin d
    bold(upsilon) \, $
  where $frak(d)_(bold(upsilon))$ has the original surviving lists and individual coefficients $mu \( p \)
    a_i \( p \) W_i \( y_i \) y_i^(i upsilon_i)$. Expanding the mark and inverting the joint transform proves this
    equality term by term. No measure is chosen for an actual surviving tuple.
    The measure may depend on the already fixed $j$, but Equation (2.77) is uniform for its $y_j$ in the fixed
    product interval. Minkowski’s inequality is used in the whole row Hilbert space for this one measure.
    Include the full support of $omega_c$, its larger cutoffs, the surviving slot supports,
    and the $j$-product interval in the finite collection $cal(I)_D$ before the final threshold is chosen.
    With the same $eta$ convention as the canonical proof, we then have
  $ \| hat(c) - D' \| lt.eq eta \, wide \| hat(j) - G \| lt.eq eta $
  on the full supports actually used below, where $hat(c) = log_Z q_c$.
    For the sign $epsilon_chi = 1$, conjugate the whole residual polynomial, including its finite character, mark,
    and test; its row norm is unchanged. For the other sign leave it unchanged.
    It therefore suffices to estimate one polynomial of the exact form
  #[#set math.equation(numbering: n => "(2.125)")
   $ cal(R)_0 \( u \) = Z^(- D' \/ 2) sum_(c med upright("sf")) mu \( c \) nu_0 \( c \) 1_(\( c \, j \) = 1)
     overline(chi_c \( u \)) frak(d)_0 \( c \) W_0 \( q_c \/ Z^(D') \) . $ <eq:initial-residual-polynomial>]
  Here $nu_0$ is a fixed finite ray character, $frak(d)_0$ is the product mark of cap $z_0$ with those individual
    coefficients or their conjugates, and $W_0$ is $omega_c \( y \) y^(i upsilon_c)$ or its conjugate.
    All are independent of the row.
  Majorize the original row ball by a fixed nonnegative radial Schwartz function $Phi_(upright("init"))$ at scale
    $Z^m$, and expand its square. Let $C$ be the gcd of the two columns and write $c_i = C z_i$, with $z_1 \,
    z_2$ squarefree and coprime. Put $hat(c)_i = log_Z q_(c_i)$,
    so the preceding support bound applies to each $i = 1 \, 2$.
    Let $B gt.eq 0$ be the center of $C$, and write $hat(B) = log_Z q_C$.
    The row character has primitive modulus $z_1 z_2$ and remaining zero mask $C$.
    Apply Lemma 57, with $d' divides C$. Let $theta gt.eq 0$ be its center and $hat(theta) = log_Z q_(d')$. Set
  $ P_1 = B - theta gt.eq - 2 eta \, $
  where the inequality follows from $hat(theta) lt.eq hat(B)$ and the two $eta$-ratio bounds.
    The actual conductor length is
  $ hat(L)_(upright("init")) = hat(c)_1 + hat(c)_2 - 2 hat(B) \, wide \| hat(L)_(upright("init")) -
    2 \( D' - B \) \| lt.eq 4 eta . $
  For a positive tolerance $tau_(upright("init"))$, the implication $Z^m q_(h') \/ \( q_(d') q_(z_1 z_2) \) lt.eq
    Z^(tau_(upright("init")))$ gives
  $ accent(d' h', ̂) lt.eq 2 D' - m - 2 P_1 + 6 eta + tau_(upright("init")) . $
  Define the fixed formal and enclosing row scales
  #[#set math.equation(numbering: n => "(2.126)")
   $ M_c^(upright("init")) = 2 D' - m - 2 P_1 \, wide M_(upright("init")) = M_c^(upright("init")) + 6 eta +
     tau_(upright("init")) . $ <eq:inverse-initial-row>]
  The $6 eta$ is $4 eta$ from the conductor and $2 eta$ from the two copies of $d'$ in the new row bound.
  Separate the original principal contribution for the direct count below.
    On the genuine nonprincipal coprime Poisson expression, before any off-coprime extension or Fourier
    absolutization, keep only the outer mask
  $ cal(B)_(upright("init")) \( h' \) = 1_(0 < q_(d' h') lt.eq Z^(M_(upright("init")))) . $
  Its complement is contained in the actual ratio tail above for every supported pair.
    Equation (2.78), with the separate initial raw count and order specified below,
    discards precisely that complement. Retain the full smooth kernel inside the mask,
    with no column-dependent ratio selector. The mask depends on $d' \, h'$, the fixed overlap and sector,
    but not on the residual columns. If $M_(upright("init")) < 0$,
    its nonzero ball is empty and the same tail comparison discards every nonzero frequency;
    otherwise the retained row parameter is nonnegative.
  The actual normalization and Poisson prefactor split over the two sides as
  $ Z^(- D') Z^(m - hat(theta) - hat(L)_(upright("init")) \/ 2) =
    Z^(hat(kappa)_1^(upright("init")) \/ 2) Z^(hat(kappa)_2^(upright("init")) \/ 2) \, quad
    hat(kappa)_i^(upright("init")) = m - D' - hat(theta) - hat(c)_i + hat(B) . $
  Thus the actual side exponents obey
  #[#set math.equation(numbering: n => "(2.127)")
   $ hat(kappa)_i^(upright("init")) lt.eq kappa_c^(upright("init")) + 3 eta \, wide kappa_c^(upright("init")) =
     m - 2 D' + P_1 . $ <eq:initial-poisson-prefactor>]
  All normalized real inverse roots will be kept in the single joint profile below,
    not also in the final child tests. Principal columns have the direct diagonal bound
    $O \( Z^(m + epsilon.alt) \)$, also for a bounded nonempty negative $D'$-window.
    Any principal nonzero frequencies restored to the formal formula carry the same $cal(B)_(upright("init"))$
    mask and are bounded by the full principal restoration in Lemma 57, since $Z^m gt.eq 1$.
  Insert frequency dyads of $q_(h')$ from one partition common to all $d'$, not a label-recentered partition.
    The outer mask implies $q_(h') lt.eq Z^(M_(upright("init")))$,
    so there are only logarithmically many dyads in the bounded retained range.
    Let $H$ be the center of one such bare-frequency dyad, and let $psi_C \, psi_(d') \,
    psi_(h')$ be the retained individual cutoffs on the current $C \, d' \, h'$ dyads,
    evaluated at their normalized norms.
  The orientation in Equation (2.125) is now fixed. The calculation in the second canonical Poisson transformation
    replaces $mu \( z \) gamma_(- 1) \( z \)$ by $macron(alpha) \( z \) gamma_2 \( z \) chi_z \( - 1 \)
    overline(G \( z \))$. On the second side the factor inside conjugation has ray factor $overline(G \( z \))$;
    together with the CRT cross phase the relative ray factor is $G \( \[ z_2 \] \[ z_1 \]^(- 1) \)$.
    Expand it by the fixed group formula above, and in a fixed ray summand put
  $ nu_(*) = nu_0 overline(theta.alt) \, wide A_(*) \( z \) =
    macron(alpha) \( z \) gamma_2 \( z \) nu_(*) \( z \) \, wide cal(K)_(upright("init")) =
    cal(F) Phi_(upright("init")) . $
  For a preliminary pattern $Sigma_0$ fixing the overlap, these dyads and the ray summand,
    and with the earlier mode held fixed, the masked principal-restored nonzero component is exactly
  #[#set math.equation(numbering: n => "(2.128)")
   $ cal(T)_(Sigma_0)^(upright("init")) =  & sum_(C med upright("sf") \, med d' divides C\
h' eq.not 0) psi_C psi_(d') psi_(h') mu \( d' \) hat(G) \( theta.alt \) cal(B)_(upright("init")) \( h' \)
  1_(\( C \, j \) = 1)\
 & times sum_(z_1 \, z_2 med upright("sf")\
\( z_1 z_2 \, C j \) = 1) 1_(\( z_1 \, z_2 \) = 1) A_(*) \( z_1 \) overline(A_(*) \( z_2 \))
  overline(chi_(z_1) \( d' \)) chi_(z_1) \( h' \) chi_(z_2) \( d' \) overline(chi_(z_2) \( h' \))\
 & times frak(d)_0 \( C z_1 \) overline(frak(d)_0 \( C z_2 \)) W_0 \( q_C q_(z_1) \/ Z^(D') \)
   overline(W_0 \( q_C q_(z_2) \/ Z^(D') \))\
 & times frac(Z^(- D') Z^m, q_(d') sqrt(q_(z_1) q_(z_2))) cal(K)_(upright("init")) #h(-0.16667em)
   (frac(Z^m q_(h'), q_(d') q_(z_1) q_(z_2))) . $ <eq:initial-formal-component>]
  Indeed $\| mu \( C \) nu_0 \( C \) \|^2 = 1$ for the squarefree $C$ outside $S$,
    the common row factor is exactly $1_(\( u \, C \) = 1)$, and its Poisson expansion contributes the one
    $mu \( d' \)$. The displayed two numerator factors are those of the primitive character $overline(chi_(z_1))
    chi_(z_2)$ and its Fourier transform. The finite ray sum restores the principal pair by $G \( 1 \) = 1$.
    The cost of that restoration and the raw complement removed before this equality were bounded separately above.
  Define the summand in Equation (2.128) on all individually squarefree $z_1 \,
    z_2$ prime to $C j$ by the displayed separate $A_(*)$ factors, characters, formal product norms, full kernel,
    and unchanged outer ball. It agrees on the coprime domain. Insert the complete identity
  $ 1_(\( z_1 \, z_2 \) = 1) = sum_(s divides \( z_1 \, z_2 \)) mu \( s \) \, wide z_a = s n_a \, $
  before any factorwise bound. Let $v gt.eq 0$ be the center of a squarefree $s$-dyad, $hat(v) = log_Z q_s$,
    and $psi_s$ its retained individual cutoff. The $n_a$ are squarefree and prime to $s$,
    but need not be mutually coprime. This formal extension does not apply Poisson summation to a noncoprime
    conductor. For squarefree coprime $s \, n$, CRT and the zero-preserving identity $overline(chi_n \( d' \)) =
    chi_n \( d' \) chi_n \( d' \)^4$ give exactly
  #[#set math.equation(numbering: n => "(2.129)")
   $ A_(*) \( s n \) overline(chi_(s n) \( d' \)) chi_(s n) \( h' \) =  & A_(*) \( s \) overline(chi_s \( d' \))
     chi_s \( h' \)\
 & times A_(*) \( n \) chi_n \( d' h' \) chi_n \( d' s \)^4 . $ <eq:initial-common-extraction>]
  The fourth power includes the CRT factor $chi_n \( s \)^4$.
    On an overlap it defines the residual coefficient to be zero,
    without evaluating $gamma_2$ on a nonsquarefree ideal. Since $\| A_(*) \( s \) \| = 1$ outside $S$,
    the two extracted scalars give
  $ \| A_(*) \( s \) overline(chi_s \( d' \)) chi_s \( h' \) \|^2 = 1_(\( s \, d' h' \) = 1) =
    1_(\( s \, h' \) = 1) quad upright("when ") d' divides C \, med \( s \, C \) = 1 . $
  The original residual and overlap exclusions also give $1_(\( C \, j \) = 1) 1_(\( s \, C j \) = 1)$.
    Thus, apart from the assigned coefficients, individual cutoffs, and unit phases,
    the outer arithmetic weight is precisely
  #[#set math.equation(numbering: n => "(2.130)")
   $ mu \( d' \) mu \( s \) hat(G) \( theta.alt \) cal(B)_(upright("init")) \( h' \) 1_(\( C \, j \) = 1)
     1_(\( s \, C j \) = 1) 1_(\( s \, h' \) = 1) . $ <eq:initial-outer-arithmetic>]
  All these factors remain through weighted Cauchy. Set
  $ t = C \/ d' \, wide k = d' h' \, wide f = d' s \, wide rho_(t \, j) \( n \) = 1_(\( n \, "rad" \( t j \) \) = 1) . $
  The factors on $n$ in Equation (2.129), together with $rho_(t \, j)$,
    supply exactly the original exclusions at $C \, s \, j$ and the numerator zeros at $d' \, h'$.
    On the nonzero support $t \, d' \, s \, n$ are pairwise coprime.
    Apply Equation (2.73) to each mark with this ordered list.
    Assigned primes and their priority masks stay outer. A surviving prime is already prime to $d'
    s$ by $chi_n \( f \)^4$ and to $t j$ by $rho_(t \, j)$, so its original individual list and coefficient can be
    retained. Its mark is an original subcollection of cap $z_0$, not a row- or label-dependent residual coefficient.
  The substitutions $k = d' h'$, $f = d' s$, and the puncture $rho_(t \, j)$ have therefore supplied the canonical
    character and coefficient class. We still need a common separated profile, the outer multiplicity bound,
    and admissibility of the resulting ranges.
  Keep $cal(B)_(upright("init"))$ outside the common Fourier separation of the full kernel and the old windows.
    The exact formal child centers and the full fresh-support bounds are
  #[#set math.equation(numbering: n => "(2.131)")
   $ N_c^(upright("init")) = D' - B - v \, wide V_c^(upright("init")) = theta + v \, wide F_c^(upright("init")) =
     D' - P_1 \,\
\| hat(n) - N_c^(upright("init")) \| lt.eq 3 eta \, wide \| hat(f) - V_c^(upright("init")) \| lt.eq
  2 eta . $ <eq:initial-canonical-lengths>]
  On factorized terms these bounds follow from $c = C s n$ and $f = d' s$.
    The full fresh column cutoff and enlarged label window are also included in $cal(I)_D$,
    so the same bounds hold directly for independent terms later added by positivity.
    The reconstructed formal product $c = C s n$ on the fresh cutoff is included there as well,
    so the initial prefactor bound holds on its entire separated side.
  Fix a refinement $Sigma$ by the $s$-dyad and the slot branches,
    with the earlier mode $bold(upsilon)$ held fixed. Before summing any actual outer ideal,
    use the six independent coordinates
  $ \( x_C \, x_d \, x_s \, x_h \, x_1 \, x_2 \) =
    (q_C / Z^B \, q_(d') / Z^theta \, q_s / Z^v \, q_(h') / Z^H \, q_(n_1) / Z^(N_c^(upright("init"))) \,
    q_(n_2) / Z^(N_c^(upright("init")))) . $
  Let $I_C \, I_d \, I_s \, I_h$ be the full supports of the four current individual cutoffs.
    Choose $omega_(n \, a)$ equal to one on the support of $W_0$ divided by $I_C I_s$,
    with fixed full supports in an enclosing interval $\[ a \, b \]$ whose upper endpoint satisfies $b gt.eq 1$.
    Choose a nonnegative $omega_f$ equal to one on $I_d I_s$, with fixed full support $I_f$.
    The current four dyad cutoffs and $omega_f$ remain outside inversion,
    and $omega_(n \, a)$ remain in the columns. Let $Omega_(upright("init") \, alpha)$ be larger cutoffs equal to
    one on the full supports of the corresponding four current and two fresh cutoffs.
    These full supports, $I_f$, and the formal products $C s n$ on them are the windows already included in
    $cal(I)_D$. None of these supports depends on a current outer tuple or on a Fourier mode.
  Keep $V_c^(upright("init")) gt.eq 0$. Proceed to a child only if the retained row component is nonzero,
    which implies $M_(upright("init")) gt.eq 0$. This is a separate gate from the structural outer set below,
    which may include zero-weight tuples even when the row ball is empty.
    Independently, if a full fresh child column window contains no squarefree ideal,
    its polynomial is zero and that component is omitted. For a retained nonempty child define
  $ N_(upright("init")) = max \( 0 \, N_c^(upright("init")) \) \, wide delta_(upright("init")) =
    N_(upright("init")) - N_c^(upright("init")) in \[ 0 \, 3 eta \] \, wide F_(upright("init")) =
    N_(upright("init")) + V_c^(upright("init")) = F_c^(upright("init")) + delta_(upright("init")) . $
  For a nonempty negative-center window, $q_n gt.eq 1$ and Equation (2.131) give $delta_(upright("init")) lt.eq
    3 eta$, while its upper support endpoint gives $Z^(delta_(upright("init"))) lt.eq b$.
    If $N_c^(upright("init")) gt.eq 0$, then $delta_(upright("init")) =
    0$ and the latter inequality follows from $b gt.eq 1$. Thus $1 lt.eq Z^(delta_(upright("init"))) lt.eq
    b$ in every retained case. The cutoff $omega_(n \, a) \( Z^(delta_(upright("init"))) y \)$ is supported in
    $\[ a \/ b \, b \]$ and has uniformly bounded Euler seminorms.
    Its rescaling depends only on fixed centers, not on a current row or label,
    and its full clipping family is included in $cal(I)_D$.
  On the formal factorization $z_a = s n_a$, the complete root and kernel argument are exactly
  #[#set math.equation(numbering: n => "(2.132)")
   $ frac(Z^(- D') Z^m, q_(d') q_s sqrt(q_(n_1) q_(n_2))) & =
     Z^(kappa_c^(upright("init"))) x_d^(- 1) x_s^(- 1) \( x_1 x_2 \)^(- 1 \/ 2) \,\
frac(Z^m q_(h'), q_(d') q_s^2 q_(n_1) q_(n_2)) & = A_(upright("ker") \, upright("init"))
  frac(x_h, x_d x_s^2 x_1 x_2) \,\
A_(upright("ker") \, upright("init")) & = Z^(m + H - theta - 2 \( D' - B \)) . $ <eq:initial-root-kernel>]
  For the first equality use $N_c^(upright("init")) = D' - B - v$ and $kappa_c^(upright("init")) = m - 2 D' + B -
    theta$. Equivalently its root is $x_d^(- 1) x_C \( x_(c_1) x_(c_2) \)^(- 1 \/ 2)$ with $x_(c_a) =
    x_C x_s x_a$. Define the one joint profile
  #[#set math.equation(numbering: n => "(2.133)")
   $ frak(H)_(upright("init") \, Sigma \, bold(upsilon)) \( bold(x) \) =  & Z^(- 3 eta) product_alpha
     Omega_(upright("init") \, alpha) \( x_alpha \) x_d^(- 1) x_s^(- 1) \( x_1 x_2 \)^(- 1 \/ 2)\
 & times W_0 \( x_C x_s x_1 \) overline(W_0 \( x_C x_s x_2 \)) cal(K)_(upright("init")) #h(-0.16667em)
   (A_(upright("ker") \, upright("init")) frac(x_h, x_d x_s^2 x_1 x_2)) . $ <eq:initial-joint-profile>]
  Its outside scalar is exactly $Z^(kappa_c^(upright("init")) + 3 eta)$.
    The old $c$-windows are coupled and therefore are in this profile,
    as are all normalized real inverse roots and the full kernel. No real root is also put in a child test.
  For $bold(xi) = \( xi_C \, xi_d \, xi_s \, xi_h \, xi_1 \, xi_2 \)$, put $z_n = q_n \/ Z^(N_(upright("init")))$,
    set again $epsilon_1 = 1 \, epsilon_2 = - 1$, and define
  $ W_a^(upright("init")) \( z \) = omega_(n \, a) \( Z^(delta_(upright("init"))) z \) z^(epsilon_a i xi_a) . $
  If $frak(d)'_a$ is the surviving subcollection on side $a$, the precise unnormalized child polynomial is
  #[#set math.equation(numbering: n => "(2.134)")
   $ Q_(a \, t \, j \, bold(xi))^(upright("init")) \( k \, f \) =
     sum_(n med upright("sf")) A_(*) \( n \) rho_(t \, j) \( n \) chi_n \( k \) chi_n \( f \)^4 frak(d)'_a \( n \)
     W_a^(upright("init")) \( q_n \/ Z^(N_(upright("init"))) \) . $ <eq:initial-child-polynomial>]
  Its fixed finite character, puncture, product mark, and test are independent of $k \, f$.
    The two sides can have different tests and subcollections, but both have the same canonical coefficient class.
  Let $Omega_Sigma$ consist of
  $
    omega = \( C med upright("sf") \, d' divides C \, s med upright("sf") \, h' eq.not 0 \;
    upright("assigned slot primes") \) $
  with the retained individual supports and slot branches. It has no current column index.
    The functions $t \, k \, f$ are the products defined above;
    the set may be taken before imposing the displayed outer zero masks, which will be in the weight.
    Let $cal(A)_Sigma^(upright("init")) \( omega \)$ be the product of all assigned coefficients of $frak(d)_0$
    and their priority masks, conjugated on side two. The complete remaining outer weight is
  #[#set math.equation(numbering: n => "(2.135)")
   $ V_Sigma^(upright("init")) \( omega \; bold(xi) \) =  & mu \( d' \) mu \( s \) hat(G) \( theta.alt \)
     cal(B)_(upright("init")) \( h' \) 1_(\( C \, j \) = 1) 1_(\( s \, C j \) = 1) 1_(\( s \, h' \) = 1)
     cal(A)_Sigma^(upright("init")) \( omega \)\
 & times psi_C \( x_C \) psi_(d') \( x_d \) psi_s \( x_s \) psi_(h') \( x_h \)
   omega_f \( q_f \/ Z^(V_c^(upright("init"))) \)\
 & times x_C^(i xi_C) x_d^(i xi_d) x_s^(i xi_s) x_h^(i xi_h) Z^(i delta_(upright("init")) \( xi_1 + xi_2 \)) .
   $ <eq:initial-outer-weight>]
  The cutoff $omega_f$ is one on every original label product, so its insertion is an equality before separation.
    There is one copy of each Möbius factor and one ray coefficient.
    In particular the common zero at $\( s \, h' \)$ is still present.
  Let $cal(T)_Sigma^(upright("init"))$ be the fixed $s$-dyad and slot summand obtained from Equation (2.128) by
    the complete Möbius and priority expansions. Its exact separated identity is
  #[#set math.equation(numbering: n => "(2.136)")
   $ cal(T)_Sigma^(upright("init")) =  & Z^(kappa_c^(upright("init")) + 3 eta) \( 2 pi \)^(- 6) integral_(bb(R)^6)
     hat(frak(H))_(upright("init") \, Sigma \, bold(upsilon)) \( bold(xi) \)\
 & quad times sum_(omega in Omega_Sigma) V_Sigma^(upright("init")) \( omega \; bold(xi) \)
   Q_(1 \, t \, j \, bold(xi))^(upright("init")) \( k \, f \)
   overline(Q_(2 \, t \, j \, bold(xi))^(upright("init")) \( k \, f \)) thin d bold(xi) .
   $ <eq:initial-separated-identity>]
  Indeed $x_a = Z^(delta_(upright("init"))) z_(n_a)$. The two column modes,
    with the last factor of Equation (2.135), are exactly $x_1^(i xi_1) x_2^(i xi_2)$,
    and the other four modes are outer. Fourier inversion restores the full profile;
    its larger cutoffs are one on the retained supports, and the fresh column cutoffs are one wherever the old
    $W_0$ windows are nonzero. Equation (2.132) restores the full prefactor and kernel.
    Equation (2.129) and the priority expansion restore every arithmetic factor term by term.
    Extra combinations in the full fresh windows cancel through the old windows in this complex identity before Cauchy.
  The transform in Equation (2.136) is chosen from the fixed ambient profile before any actual $C \, d' \, s \,
    h'$, and hence before any $t \, k \, f$, is evaluated. It depends on $Sigma \, Z$, the fixed tests,
    and the earlier mode $bold(upsilon)$, and may depend on the already frozen $j$,
    but not on any current outer ideal or reindexed row or label.
    The bare $h'$ norm is a coordinate; the derived row and label occur only in the outer masks or in the
    displayed characters. The relation $C = t d'$ only restricts evaluation points.
    By Equation (2.77), for each fixed $J$ there are fixed $L \, b_0$ such that
  $ integral_(bb(R)^6) \|
    hat(frak(H))_(upright("init") \, Sigma \, bold(upsilon)) \( bold(xi) \) \| \( 1 + \| bold(xi) \| \)^J thin d
    bold(xi) lt.double \( 1 + \| bold(upsilon) \| \)^L \, wide
    integral_(bb(R)^(1 + \| I_0 \|)) \|
    hat(frak(H))_(upright("ov") \, j) \( bold(upsilon) \) \| \( 1 + \| bold(upsilon) \| \)^L thin d bold(upsilon)
    lt.double p_(b_0) \( W \) . $
  The first bound uses the fixed normalized roots and the uniform Euler bounds of the full kernel for every
    positive $A_(upright("ker") \, upright("init"))$; $W_0$ has only polynomial $bold(upsilon)$-dependence.
    The second is uniform over the fixed $j$-product interval.
    Taking larger $L$ if needed also controls the earlier row-space Minkowski inequality.
    No derivative order introduces a power of $Z$.
  Equation (2.136) now expresses the component in polynomials of canonical shape with one common Fourier density
    chosen before the current outer ideals are evaluated. It remains to bound the positive fibres and source
    measure, verify child admissibility from source witnesses, and restore the normalization in Lemma 53.
  Apply Equation (D) on the whole $Omega_Sigma$, including all quotients $t$, before fixing one for the child.
    Only afterward take absolute weights. The retained $\( s \, C \) = 1$ and $d' divides C$ make $f =
    d' s$ squarefree, and all other factors of the weight are bounded by a fixed constant. Thus
  $ \| V_Sigma^(upright("init")) \( omega \; bold(xi) \) \| lt.double cal(B)_(upright("init")) \( h' \) mu^2 \( f \) . $
  For fixed $t \, f \, k$, the identities
  $ d' divides f \, wide s = f \/ d' \, wide C = t d' \, wide h' = k \/ d' quad
    upright("if this quotient is an element") $
  show that the reconstruction has at most $d_(cal(O)) \( f \)$ choices before slots.
    Here $K_(upright("slot"))$ again denotes the fixed bound for the original number of slots.
    The at most $2 K_(upright("slot"))$ assigned residual primes divide $t f$.
    Their choices cost at most $\[ d_(cal(O)) \( t \) d_(cal(O)) \( f \) \]^(2 K_(upright("slot")))$.
    The earlier overlap primes were already frozen and counted in the overlap triangle.
    Hence the fibre, even if its actual size depends on $k$, is bounded by
  #[#set math.equation(numbering: n => "(2.137)")
   $ D_(upright("init")) \( f \) C_(upright("init")) \( t \) \, wide D_(upright("init")) \( f \) =
     d_(cal(O)) \( f \)^(1 + 2 K_(upright("slot"))) \, wide C_(upright("init")) \( t \) =
     d_(cal(O)) \( t \)^(2 K_(upright("slot"))) . $ <eq:initial-fibre>]
  There is no independent $d' \, s$ count and no second frequency count.
  Let $Omega_Sigma^(upright("src"))$ be the structural outer set just used,
    before independent positive row or label additions and ignoring unit Fourier phases,
    and define the set of distinct source quotients
  $ frak(T)_Sigma = { t = C \/ d' : omega in Omega_Sigma^(upright("src")) } . $
  It is projected once over all current rows and labels, not redefined for a fixed $k \, f$.
    Every member has a source witness on the $C \, d'$ dyads, and therefore $log_Z q_t = hat(B) - hat(theta) lt.eq
    P_1 + 2 eta$. The containing norm ball bounds its cardinality by $\# frak(T)_Sigma lt.double
    Z^(P_1 + 2 eta + pi_(upright("count") \, upright("init")))$; it is not used as a replacement child domain.
    In a nonempty sector $P_1 + 2 eta gt.eq 0$, since it bounds the norm of an existing ideal.
    The divisor bound on this bounded range gives the normalized measure
  #[#set math.equation(numbering: n => "(2.138)")
   $ d nu_Sigma^(upright("init")) \( t \) = Z^(- P_1 - 2 eta) sum_(t in frak(T)_Sigma) C_(upright("init")) \( t \)
     delta_t \, wide parallel nu_Sigma^(upright("init")) parallel lt.double
     Z^(pi_(upright("count") \, upright("init")) + pi_(upright("fib") \, upright("init"))) .
     $ <eq:initial-normalized-quotients>]
  This set and measure ignore the unit Fourier phases and are common to the whole current row and label sum.
    The nonempty gates remain separate from this structural projection.
  For a fixed mode let
  #[#set math.equation(numbering: n => "(2.139)")
   $ cal(H)_(a \, t)^(upright("init")) = sum_(f med upright("sf")\
q_f \/ Z^(V_c^(upright("init"))) in I_f) D_(upright("init")) \( f \) sum_(k in cal(O)\
0 < q_k lt.eq Z^(M_(upright("init")))) \| Q_(a \, t \, j \, bold(xi))^(upright("init")) \( k \, f \) \|^2 =
  Z^(F_(upright("init"))) cal(E)_(a \, t)^(upright("init")) . $ <eq:initial-positive-child>]
  This is Equation (2.60) with the same row ball; with a larger fixed canonical ball the equality is replaced by
    the corresponding upper bound. The fibre estimate and weighted Cauchy give
  #[#set math.equation(numbering: n => "(2.140)")
   $ lr(|sum_(omega in Omega_Sigma) V_Sigma^(upright("init")) Q_1 overline(Q_2)|) lt.double Z^(P_1 + 2 eta)
     product_(a = 1)^2
     (integral_(frak(T)_Sigma) cal(H)_(a \, t)^(upright("init")) thin d nu_Sigma^(upright("init")) \( t \))^(1 \/
     2) . $ <eq:initial-weighted-count>]
  Here $Q_a = Q_(a \, t \, j \, bold(xi))^(upright("init")) \( k \, f \)$.
    Only the positive outer $f \, k$ sums were enlarged to their full fixed windows; the inner $rho_(t \, j)$,
    mark, and fresh test are unchanged. The weight $D_(upright("init"))$ depends on $f$ alone.
    The new outer ball is exactly $1_(0 < q_k lt.eq Z^(M_(upright("init"))))$.
    Thus use of the uniform child bound introduces the displayed quotient-count exponent once and the normalized
    mass once.
  The fixed puncture is exactly at $"rad" \( t j \)$. For each $t in frak(T)_Sigma$,
    its source bound and the fixed overlap bound give
  #[#set math.equation(numbering: n => "(2.141)")
   $ Q_(upright("init")) := log_Z q_(frak(r)_rho) lt.eq hat(B) - hat(theta) + hat(j) lt.eq P_1 + G +
     3 eta . $ <old-eq:4.13>]
  Shared puncture primes only decrease this bound. It continues to hold when positive new labels or rows are
    added, because those additions do not change $t \, j$ or delete their inner puncture.
  The fixed formal centers satisfy
  $ F_c^(upright("init")) - M_c^(upright("init")) - \( P_1 + G \) - z_0 & = m - r - 2 z + 2 G \,\
4 F_c^(upright("init")) - 3 M_c^(upright("init")) - 6 z_0 & = 3 m - 2 r - 8 z + 10 G + 2 P_1 . $
  Use the marked premises, $G gt.eq 0$, $P_1 gt.eq - 2 eta$, Equations (2.126) and (2.141),
    and the favorable clipping signs. The actual canonical margins are
  #[#set math.equation(numbering: n => "(2.142)")
   $ F_(upright("init")) - M_(upright("init")) - Q_(upright("init")) - z_0 & gt.eq c_1 + delta_(upright("init")) -
     9 eta - tau_(upright("init")) gt.eq c_1 - 9 eta - tau_(upright("init")) \,\
4 F_(upright("init")) - 3 M_(upright("init")) - 6 z_0 & gt.eq c_2 + 4 delta_(upright("init")) - 22 eta -
  3 tau_(upright("init")) gt.eq c_2 - 22 eta - 3 tau_(upright("init")) . $ <eq:inverse-initial-margins>]
  The $22 eta$ is $4 eta$ from the possible negative $2 P_1$ and $18 eta$ from three copies of the row enclosure.
  There is also an explicit energy calculation. Apply the canonical bound only for $t in frak(T)_Sigma$,
    where the preceding puncture and margin checks hold. Equations (2.139) and (2.140) then bound the unscaled
    signed outer sum by
  $ C \( bold(upsilon) \, bold(xi) \) Z^(P_1 + 2 eta + 2 F_(upright("init")) + epsilon.alt_c) parallel
    nu_Sigma^(upright("init")) parallel . $
  The one mass is that of Equation (2.138); the label $d' s$ remains inside the child average.
    The common Fourier density is integrated separately, once, with the uniform weighted bounds above.
    This counts the distinct frozen quotient once, with its witness multiplicity already in the fibre weights.
    The formal identity
  $ kappa_c^(upright("init")) + P_1 + 2 F_c^(upright("init")) = m $
  then gives, after restoring the child normalization and applying the canonical bound with loss $epsilon.alt_c$,
    the per-side exponent
  #[#set math.equation(numbering: n => "(2.143)")
   $ & m + 3 eta + 2 eta + 2 delta_(upright("init")) + pi_(upright("init")) + epsilon.alt_c\
 & wide lt.eq m + 11 eta + pi_(upright("init")) + epsilon.alt_c . $ <eq:inverse-initial-energy>]
  Here $pi_(upright("init"))$ is the aggregate freely chosen local divisor, dyadic, and separation loss,
    including the assigned-overlap divisor loss and the distinct allocations
    $pi_(upright("count") \, upright("init")) \, pi_(upright("fib") \, upright("init"))$.
    These are parts of one aggregate, not repeated allowances.
    The two clipping copies come from the restored normalization and the child exponent.
    There is no $tau_(upright("init"))$ energy factor: the row enlargement occurs inside the canonical child and
    was accounted for in its margin test. The initial weighted Cauchy takes a geometric mean,
    and the overlap triangle was already canceled by $Z^(- G)$.
  We give the parameter and tail order explicitly. Let $r_max \, z_max \, m_max$ bound the marked ranges,
    let $s_(upright("slot"))$ bound the number of slots, and put $D_max = r_max + z_max$.
    Set $macron(c) = min \( c_1 \, c_2 \)$ and choose the canonical margin $c_(*) = macron(c) \/ 2$.
    For $eta \, tau_(upright("init")) lt.eq 1 \/ 100$, valid a priori starting bounds for that application are
  $ M_max = 2 D_max + 1 \, wide N_max = V_max = D_max + 1 . $
  Indeed, $P_1 gt.eq - 2 eta$ gives $M_(upright("init")) lt.eq 2 D_max + 10 eta + tau_(upright("init"))$,
    and $F_(upright("init")) lt.eq D_max + 5 eta$ bounds both nonnegative child parameters.
    Make the choices in Equation (2.123) with $epsilon.alt_c = epsilon.alt \/ 2$, imposing in addition
  $ eta \, tau_(upright("init")) lt.eq macron(c) \/ 100 \, wide eta lt.eq epsilon.alt \/ 88 \, wide
    pi_(upright("init")) lt.eq epsilon.alt \/ 8 . $
  One may take $tau_(upright("init")) = tau$ after imposing both sets of bounds.
    Equation (2.142) then gives both margins at least $3 macron(c) \/ 4 > c_(*)$, so Lemma 54 applies.
    Equation (2.143) adds at most $epsilon.alt \/ 4$ to its $epsilon.alt_c = epsilon.alt \/ 2$ loss.
  With these bounded initial ranges fixed, choose the subsidiary input exponents realizing the target
    $pi_(upright("init"))$, before choosing the initial tail and Fourier-height orders.
  For the separate initial raw tail, the supported columns satisfy $q_(c_i) lt.eq C Z^(D_max)$,
    while $D' in \[ - z_max \, D_max \]$. On the genuine initial expansion put $a =
    Z^m \/ \( q_(d') q_(z_1 z_2) \)$. Since $m gt.eq 0$, $d' divides C$, and $c_i = C z_i$,
  $ a^(- 1) lt.eq q_(d') q_(z_1 z_2) lt.eq q_(c_1) q_(c_2) \/ q_C lt.eq C Z^(2 D_max) . $
  The explicit crude exponent
  $ B_(upright(c r u d e \, i n i t)) = 10 { 1 + m_max + \( s_(upright("slot")) + 1 \) \( D_max + 1 \) } $
  bounds all raw nonfrequency factors even without cancellation.
    To verify this, the normalization costs at most $z_max$, the two column counts cost $2 D_max$,
    the $d'$-divisor count at most $D_max$, and $1 + a^(- 1)$ at most $2 D_max$.
    The two residual marks cost at most $2 s_(upright("slot")) D_max$,
    using $d_(cal(O)) \( c \)^(s_(upright("slot"))) lt.eq q_c^(s_(upright("slot")))$.
    Even counting overlap pairs and their assigned coefficients without their canceling weights costs at most $2
    z_max + 2 s_(upright("slot")) z_max$. The Poisson prefactor costs at most $m_max$.
    The sum is at most $m_max + \( 8 + 4 s_(upright("slot")) \) D_max < B_(upright(c r u d e \, i n i t))$.
  Choose $T_(upright("init")) > 1 + B_(upright(c r u d e \, i n i t))$ and then
  $ A_(upright("init")) > 1 + \( B_(upright(c r u d e \, i n i t)) + T_(upright("init")) \) \/ tau_(upright("init")) . $
  Equation (2.78) makes the raw $cal(B)_(upright("init")) = 0$ complement $O \( Z^(- T_(upright("init"))) \)$,
    with fixed seminorm and polynomial-height factors. This order is chosen after the marked ranges and
    $tau_(upright("init"))$, but before the initial Fourier-height orders and before the final $Z$ threshold.
    If $tau_(upright("init")) = tau$, take the maximum of the orders required by this separate crude bound and the
    canonical tails. The full kernel retained inside the outer ball has the uniform Euler bounds already used in
    the canonical separation. The final threshold also enforces the full initial support ratios in $cal(I)_D$.
  The principal count has exponent $m$, and every nonprincipal term has now been bounded by $Z^(m + epsilon.alt)$.
    The argument keeps all element rows and every original mask,
    applies to subcollections and either common orientation, and preserves arbitrary bounded row-independent prime
    coefficients. The common separated measures give the stated finite- seminorm and polynomial-height uniformity.
    This proves Equation (2.58). ◻
]

===== 2.6.7 Amplification on sixth-power-free rows <amplification-on-sixth-power-free-rows>

We first extract an unmarked consequence on all element rows.
  In Lemma 53, take $Z = H \, med m = 1$, no slots, and $r = log_H D$.
  If $H gt.eq D^(1 + c)$ for a fixed $c > 0$, then $1 - r gt.eq c \/ \( 1 + c \)$;
  the second required margin is also positive. For $D lt.eq H^(epsilon.alt \/ 4)$,
  the direct bound $\| M_u \( D \; W \) \|^2 lt.double D$ suffices.
  Otherwise the starting lengths are in a fixed bounded range away from zero.
  Bounded $H \, D$ are handled directly. We obtain, for $H \, D gt.eq 1$,

#[#set math.equation(numbering: n => "(2.144)")
 $ sum_(u in cal(O)\
0 < q_u lt.eq H) lr(|D^(- 1 \/ 2) sum_n mu \( n \) nu \( n \) chi_n \( u \)^(epsilon_chi) W \( q_n \/ D \)|)^2
  lt.double_(c \, epsilon.alt \, W) H \( H D \)^epsilon.alt \, wide H gt.eq D^(1 + c) . $ <eq:raw-moment>]

The fixed arithmetic data and the stated seminorms are included in the dependence of the constant.

#thm([Lemma 2.18.])[
  (Sixth-power amplification).  #emph[Let $nu \, W \, epsilon_chi$ and the zero extensions be as in Lemma 53,
    with no prime slots. Let $U \, D gt.eq 1$, and sum over elements $u$ with $q_u asymp
    U$ such that every prime valuation of the ideal $\( u \)$ is at most five.
    For every fixed $c > 0$ and $epsilon.alt > 0$, put
$ H = max \( 2 U \, D^(1 + c) \) \, wide P = \( H \/ U \)^(1 \/ 6) . $

 Then
#[#set math.equation(numbering: n => "(2.145)")
 $ sum_u \| M_u \( D \; W \) \|^2 lt.double H / P \( U D \)^epsilon.alt lt.double max { U \,
   U^(1 \/ 6) D^(5 \( 1 + c \) \/ 6) } \( U D \)^epsilon.alt . $ <eq:amplified-note>]

 The implied constant depends only on $c \, epsilon.alt$, the fixed arithmetic data,
   and finitely many seminorms of $W$. In particular, for $D = U^r$ with $r$ in a fixed bounded nonnegative range,
   for every $epsilon.alt > 0$ the exponent may be written
$ sum_u \| M_u \( U^r \; W \) \|^2 lt.double U^(e \( r \) + epsilon.alt) \, wide e \( r \) =
  max { 1 \, \( 1 + 5 r \) \/ 6 } . $

 Both assertions permit a separate test $W_(sigma_u \, t_u) \( y \) =
   W \( y \) y^(- sigma_u + i t_u)$ in each row, with $sigma_u$ in a fixed compact interval and $\| t_u \| lt.eq
   T_1$, at a cost $\( 1 + T_1 \)^A$ for a fixed $A$.]
] <lem:inverse-amplification>

#proof[
  First, Equation (2.144) and Lemma 9 imply the rowwise scale bound
  #[#set math.equation(numbering: n => "(2.146)")
   $ sum_(v in cal(O)\
0 < q_v lt.eq C H) sup_(0 < D' lt.eq D) \| M_v \( D' \; W \) \|^2 lt.double H \( H D \)^epsilon.alt \, wide
  H gt.eq max \( 2 \, D^(1 + c) \) . $ <eq:inverse-scale-supremum>]
  Indeed, sufficiently small scales have no ideals in the annular support.
    Differentiation with respect to $log D'$ replaces $W \( y \)$ by $- W \( y \) \/ 2 - y W' \( y \)$.
    The one-dimensional Sobolev inequality in Lemma 9, followed by Equation (2.144) for these two tests,
    controls the supremum on a unit logarithmic interval. There are $O \( log \( 2 + D \) \)$ such intervals.
    A fixed enlargement of $H$ handles their endpoints, and the direct small-scale bound handles the initial
    intervals. This proves Equation (2.146).
  Ideal counting outside the fixed set $S$ gives at least $c_S P$ primary ideals $a$ with $q_a lt.eq P$,
    for a fixed $c_S > 0$. For bounded $P$ this follows after reducing $c_S$, since the unit ideal is available;
    for large $P$ it follows from the positive-density ideal count with finitely many primes removed.
  For squarefree $n$, separate the primes dividing $a$ by $n = d m$, where $d divides "rad" a$ and $\( m \, a \) =
    1$. With the zero extensions,
  $ psi_(u a^6) \( m \) = psi_u \( m \) 1_(\( m \, a \) = 1) . $
  This is true also when $u \, a$ share primes: both sides vanish at a prime dividing $m$ and either $u$ or $a$,
    and otherwise the sixth power is one. The separated column therefore gives the exact identity
  #[#set math.equation(numbering: n => "(2.147)")
   $ M_u \( D \; W \) = sum_(d divides "rad" a) mu \( d \) psi_u \( d \) q_d^(- 1 \/ 2)
     M_(u a^6) \( D \/ q_d \; W \) . $ <eq:sixth-power-column-identity>]
  The coefficient mass is at most $d_(cal(O)) \( a \) lt.double_delta P^delta$. It follows that
  $ \| M_u \( D \; W \) \|^2 lt.double_delta P^(2 delta) sup_(0 < D' lt.eq D) \| M_(u a^6) \( D' \; W \) \|^2 . $
  Average this bound over the $a$’s and sum over $u$. The map $\( u \, a \) mapsto u
    a^6$ is injective on these pairs. In fact, at each prime the valuation modulo six recovers the valuation of
    the sixth-power-free ideal $\( u \)$, and its quotient by six recovers the valuation of $a$.
    The primary generator of $a$ then fixes the element $u$, including its unit.
    This argument does not require $\( u \, a \) = 1$. Also $q_(u a^6) lt.double U P^6 lt.double H$.
    Thus Equation (2.146) gives
  $ sum_u \| M_u \( D \; W \) \|^2 lt.double H / P \( U D \)^epsilon.alt =
    U^(1 \/ 6) H^(5 \/ 6) \( U D \)^epsilon.alt \, $
  after choosing the preliminary $delta$ and power losses small enough.
    Since $H = max \( 2 U \, D^(1 + c) \)$, this is Equation (2.145).
    For bounded $r$, choose $c > 0$ sufficiently small in terms of $r$’s bound and the desired power loss;
    the stated formula for $e \( r \)$ follows.
  Finally, on the fixed annular support, derivatives in $sigma \,
    t$ of $W_(sigma \, t)$ insert bounded powers of $log y$. Apply the parameter Sobolev inequality in Lemma 9 on
    a bounded cover in $sigma$ and $O \( 1 + T_1 \)$ unit intervals in $t$,
    summing the row moments before integrating the derivatives.
    The finite-seminorm bound already proved has fixed polynomial height order.
    The cover and these derivatives therefore give a factor $\( 1 + T_1 \)^A$ for a fixed $A$,
    uniformly for a separate $\( sigma_u \, t_u \)$ in every row.
    The same reasoning applies to the marked estimate with any fixed finite number of test parameters,
    while its prime coefficients remain fixed across rows. ◻
]

In the later application, the positive exponent in $T_1 = Z^(tau_eta)$ is chosen after the fixed order $A$.
  It may therefore be chosen small enough to fit the reserved power loss.
  This use of rowwise test parameters does not permit arbitrary row-dependent prime coefficients.

==== 2.7 Fourth moments with short prime factors <sec:plain>

The refined row count requires a fourth-moment estimate for two plain character polynomials and a product of short
  prime polynomials. We prove that estimate here. The two plain polynomials have no length restriction when no
  prime polynomial is present; otherwise the permitted lengths lie in an affine region.
  Two finite Fourier transforms return products of the same kind at a smaller effective width.
  Some transformed rows, however, induce characters in a fixed finite family.
  Their plain products can have volume-sized main terms. For the longer inputs we therefore subtract a comparison
  product with the same product of scales. Preserving its common character, mask,
  and norm power through the transforms makes those main terms cancel.
  The estimate itself concerns the original, uncentered product.

We use the notation of Section 2 and the coefficient conventions of Section 2.
  In particular, the rows are elements $k in cal(O)$ with $0 < q_k lt.double Z^m$, and

$ psi_k \( n \) = tau \( n \) chi_n \( k \) \, wide M = m + q . $

The character $tau$ is fixed within a row sum. The union of the prime supports of all its displayed moving
  residue-symbol factors, before canceling factors or reducing exponents modulo six, has norm at most $Z^q$.
  Every displayed factor retains its zero extension, including a canceled or six-divisible factor.
  A redundant zero may instead be represented by an additional puncture mask only when an exact factorization
  retains every surviving local and fixed-ray phase. This mask is the indicator of coprimality to one squarefree
  ideal of norm at most $Z^B$, for a bounded $B$, fixed within the current row sum;
  the same mask is used in both plain factors and in every prime factor.
  It may depend on previously frozen labels, but not on the varying row.
  All ideals in the polynomials are outside the fixed set $cal(S)$.

Fix a finite group $Theta$ of finite-order ray characters whose conductor primes belong to $cal(S)$.
  It contains the fixed twists and all characters used to separate the fixed reciprocity phases.
  Thus it also contains the supplementary character $n mapsto chi_n \( - 1 \)$:
  by Equation (1.7) and the fixed bicharacter table, this character is the diagonal character $n mapsto
  cal(R) \( n \, n \)$. Membership of an inducing character in $Theta$ means equality with the primitive inducing
  character of some member of $Theta$, not equality of the chosen zero-extended presentations.
  All zeros of those presentations remain in the polynomials.
  Let $cal(R)_0$ be the rows for which $psi_k$ induces a nonprincipal character.
  For $z > 0$, let $cal(R)_z$ be the rows for which the inducing character of $psi_k$ does not belong to $Theta$. Write

#[#set math.equation(numbering: n => "(2.148)")
 $ A = n_1 + n_2 + z . $ <old-eq:3.1>]

#thm([Lemma 2.19.])[
  (Fourth moment with short prime factors).  #emph[Let $3 \/ 4 lt.eq kappa lt.eq 1$.
    Let $n_1 \, n_2 gt.eq 0$, and let $Q = product_(i in cal(I))
    Q_(psi_k \, i)$ be a finite product of the prime polynomials in Equation (2.6), of lengths $z_i gt.eq
    0$ and total length $z = sum_(i in cal(I)) z_i$. Their underlying prime supports are pairwise disjoint before
    common masks and row zero extensions are imposed. Their coefficients are fixed finite linear combinations of
    finite-ray characters. For every positive-length slot the expansion has the form
$ nu_i \( n \) = sum_(j = 1)^(J_i) c_(i j) theta.alt_(i j) \( n \) \, wide theta.alt_(i j) in Theta \, $

 where the finite list and its coefficients are fixed independently of $Z$ and of the row.
   The row and mask hypotheses are those just stated.]
  #emph[For every $epsilon.alt > 0$, there is a slot mesh $eta > 0$ such that, if $z_i lt.eq eta$ for every $i$, then
#[#set math.equation(numbering: n => "(2.149)")
 $ sum_(k in cal(R)_z) lr(|S_(psi_k) \( n_1 \; W_1 \) S_(psi_k) \( n_2 \; W_2 \) Q|)^2 lt.double
   Z^(M + epsilon.alt) $ <old-eq:2.1>]

 in either of the following cases:]
  + #emph[$z = 0$. There is no restriction on the bounded nonnegative lengths $n_1 \, n_2$,
    and no lower bound on the conductor.]
  + #emph[$z > 0$ and
#[#set math.equation(numbering: n => "(2.150)")
 $ n_1 + n_2 + 6 kappa z = A + \( 6 kappa - 1 \) z lt.eq M . $ <old-eq:3.9>]

 If $kappa < 1$, assume in addition that $beta_(*) lt.eq \( 1 + kappa \) \/ 2$.
   If $kappa = 1$, no zero-free hypothesis is required.]
  #emph[For an empty slot list, $Q = 1$. If $z = 0$ and the list contains zero-length slots,
    their scales are bounded and absolute counting absorbs them into the constant;
    the zero-slot assertion therefore has the same strength. All real length parameters range over prescribed
    bounded sets. The mesh depends only on those sets and $epsilon.alt$,
    uniformly for $kappa in \[ 3 \/ 4 \, 1 \]$. For each fixed $Z$-independent arithmetic datum $cal(A)$ and fixed
    slot count, the bound uses finitely many smooth seminorms and a fixed polynomial in the separated norm-twist
    heights. Their orders, and the bound itself, are uniform over all moving moduli, admissible masks,
    and frozen outer labels in the stated ranges.]
] <lem:plain>

The application to the $7 \/ 8$ bound sets $kappa = 2 beta_(*) - 1$,
  so its zero-free hypothesis in this lemma holds by equality.
  We retain this dynamic value rather than replace it by the value $5 \/ 6$ supplied by the $11 \/ 12$ bound,
  since the refined row count uses the resulting affine capacity.
  The proof below uses the finite Gauss identities of Section 2.3, Lemma 9, and Lemma 13.
  Absorb any zero-length slots by absolute counting at their bounded scales; henceforth $z =
  0$ means that no live slot remains. We first make two reductions that preserve the row family.

The later induction is on the effective width $M = m + q$,
  with all zero-slot bands completed before the positive-slot bands.
  Within each band the range $A lt.eq 5 M \/ 6$ is proved first.
  This threshold comes from the transformed rows whose inducing characters lie in $Theta$:
  counting their sixth-power form and bounding their plain products by volume leaves an excess $A - 5 M \/ 6$,
  before the common-support savings. Reflection handles some longer inputs;
  the others are reduced to an equal-product-scale difference, whose cancellation removes that excess.

===== 2.7.1 Fixed masks and reflection <fixed-masks-and-reflection>

Call a character #emph[natural] when its zeros consist exactly of its primitive conductor primes,
  its redundant row and declared moving radical primes, and the fixed primes in $cal(S)$.
  Here a redundant prime is one at which the inducing character is unramified but the displayed zero-extended
  product still vanishes. A displayed six-divisible power still vanishes on nonunits.
  If a redundant factor of the fixed twist is not included in the declared moving radical,
  first factor it exactly into its remaining phase and a coprimality indicator,
  and put that indicator in a squarefree ideal $frak(R)$, with $q_(frak(R)) lt.eq Z^B$,
  fixed throughout the row sum. In particular, a cancellation between the fixed twist and the varying factor
  $chi_n \( k \)$ is not reclassified as a separately chosen extra puncture for each row.

Let $psi_k^0$ be the natural character obtained by deleting these additional punctures,
  and let $T_k \( X \)$ denote its centrally normalized plain sum at scale $X$.
  Write $S_(k \, frak(R)) \( X \)$ for the sum with the extra mask.
  Multiplicativity, including zero extensions, gives the exact identities

#[#set math.equation(numbering: n => "(2.151)")
 $ S_(k \, frak(R)) \( X \) & = sum_(d divides frak(R)) mu \( d \) psi_k^0 \( d \) q_d^(- 1 \/ 2) T_k \( X \/ q_d \) \,\
Q_(k \, i \, frak(R)) & = Q_(k \, i)^(thin 0) - P_i^(- 1 \/ 2) sum_(p divides frak(R)\
p med upright("prime")) psi_k^0 \( p \) nu_i \( p \) W_i^(upright("slot")) \( q_p \/ P_i \) \, wide P_i =
  Z^(z_i) . $ <old-eq:2.1a>]

For example, the first identity follows by inserting $sum_(d divides \( n \, frak(R) \))
  mu \( d \)$ and writing $n = d l$. The quotient $l$ is unrestricted at primes of $d$;
  the original natural zero extension remains on it.

Apply these identities simultaneously to both plain factors and all slots.
  If the frozen slots form $J subset.eq cal(I)$, and the plain divisors are $d_1 \, d_2$,
  the scalar depending on the row has modulus at most one. The remaining coefficient has absolute value at most a
  fixed profile constant times

$ q_(d_1 d_2)^(- 1 \/ 2) product_(i in J) P_i^(- 1 \/ 2) . $

The resulting natural product has lengths

$ A' = A - log_Z q_(d_1 d_2) - sum_(i in J) z_i \, wide z' = z - sum_(i in J) z_i . $

Its inducing character is unchanged. If $z' > 0$, the left side of Equation (2.150) has decreased; if $z' = 0$,
  the zero-slot assertion has no length restriction and $cal(R)_z subset.eq cal(R)_0$.

For every fixed $epsilon.alt_1 > 0$,

#[#set math.equation(numbering: n => "(2.152)")
 $ sum_(d divides frak(R)) q_d^(- 1 \/ 2) lt.eq product_(p divides frak(R)) \( 1 - q_p^(- 1 \/ 2) \)^(- 1)
   lt.double_(epsilon.alt_1 \, B) Z^(epsilon.alt_1) . $ <old-eq:2.1b>]

This follows from Lemma 14. The corresponding mass for a frozen slot is also $Z^(epsilon.alt_1)$:
  on its annular support, $P_i^(- 1 \/ 2) lt.double q_p^(- 1 \/ 2)$,
  and the same product bounds the sum over $p divides frak(R)$. The number of slots is fixed.
  Minkowski’s inequality therefore reduces Equation (2.149) to the natural assertion at the same width,
  with an arbitrarily small power loss. A nonempty annular scale below one is bounded below by a positive
  profile-dependent constant and may be rescaled to one. After this rescaling its new nonnegative length is $max {
  n_i - log_Z q_(d_i) \, 0 } lt.eq n_i$, so the asserted nonincrease of the affine expression remains valid.

We next record precisely the reflection used for natural characters.
  Let $psi_k^(*)$ be the primitive character inducing $psi_k^0$,
  and let $frak(R)_(0 \, k)$ be its redundant natural radical.
  The primes of $frak(R)_(0 \, k)$ are disjoint from the primitive conductor.
  If $Q_k$ is that conductor norm, set $C_k = 3 Q_k \/ \( 2 pi \)^2$,
  the conductor scale in the functional equation. Tameness at primes outside $cal(S)$ gives

#[#set math.equation(numbering: n => "(2.153)")
 $ C_k q_(frak(R)_(0 \, k)) lt.double_(cal(S) \, tau_(upright("fixed"))) Z^M . $ <old-eq:2.1c>]

Indeed, each good prime contributes at most once, either to the primitive conductor or to the redundant radical.
  Their union is contained in the union of the row radical and the declared moving radical,
  whose norm is at most $q_k Z^q$. By Lemma 5, the unit and $cal(S)$-supported parts of a row,
  with valuations reduced modulo six when evaluated on primary elements prime to $cal(S)$,
  range over a fixed finite ray family. Thus all primes in $cal(S)$ contribute only a fixed factor.

Apply the primitive Hecke functional equation recorded in the proof of Lemma 12 to $psi_k^(*)$,
  using the entireness of $L \( s \, psi_k^(*) \)$ stated there.
  Let $epsilon_k$ be its root number, so $\| epsilon_k \| = 1$.
  Mellin inversion and a contour shift show that the normalized plain sum of $psi_k^(*)$ at $X$ equals the root
  number times the conjugate character sum at $C_k \/ X$, with transformed profile $W^sharp$ defined by

$ cal(M) W^sharp \( s \) = cal(M) W \( 1 - s \) frac(Gamma \( s \), Gamma \( 1 - s \)) . $

The Mellin transform convention is the one in Lemma 9. The quotient of gamma functions has poles only at the
  nonpositive integers and zeros at the positive integers. Shifting the inverse Mellin contour to the left gives
  an expansion in nonnegative integral powers at zero; shifting it to the right gives arbitrary decay at infinity.
  Thus $W^sharp$ and its Euler derivatives are bounded at zero and rapidly decreasing at infinity.
  The height assertion is also quantitative. For $W_omega \( y \) = W \( y \) y^(i omega)$,
  the exact identity $cal(M) W_omega \( s \) = cal(M) W \( s + i omega \)$ puts all height dependence in a
  translate of the rapidly decreasing Mellin transform. On each fixed vertical line the gamma quotient and each
  fixed number of Euler derivatives have polynomial growth in the integration height.
  Integrating the translated Mellin decay therefore gives a fixed polynomial in $1 + \| omega \|$,
  with its degree depending only on the fixed contour and derivative orders.
  The pointwise Mellin integration-by-parts estimate on a compact real strip in Lemma 9 justifies the horizontal
  joins in these shifts; an integrated Fourier tail is not used to bound a fixed horizontal trace.
  This proves the required finite-seminorm and polynomial-height bounds for reflection.

Deleting the redundant Euler factors before reflection and restoring them geometrically afterward gives

$ T_k \( X \; W \) = epsilon_k sum_(d_0 divides frak(R)_(0 \, k)\
"rad" \( h_0 \) divides frak(R)_(0 \, k))
  frac(mu \( d_0 \) psi_k^(*) \( d_0 \) overline(psi_k^(*) \( h_0 \)), sqrt(q_(d_0) q_(h_0))) thin
  T_(overline(psi_k^0)) (frac(C_k q_(d_0), X q_(h_0)) \; W^sharp) \, wide \| epsilon_k \| = 1 . $

The geometric series is absolutely bounded by
  $product_(p divides frak(R)_(0 \, k)) \( 1 - q_p^(- 1 \/ 2) \)^(- 1)$.
  Consequently its total coefficient mass, together with the $d_0$ sum, is $Z^(epsilon.alt_1)$. The scales are

#[#set math.equation(numbering: n => "(2.154)")
 $ Y = frac(C_k q_(d_0), X q_(h_0)) \, wide d_0 divides frak(R)_(0 \, k) \, quad
   "rad" \( h_0 \) divides frak(R)_(0 \, k) . $ <old-eq:2.1d>]

By Equation (2.153), there is a fixed $C_(cal(A)) gt.eq 1$ such that

$ C_k q_(frak(R)_(0 \, k)) lt.eq C_(cal(A)) Z^M \, wide Y lt.eq C_(cal(A)) Z^(M - log_Z X) . $

The profile $W^sharp$ can be partitioned into smooth annuli.
  Below its main scale, central normalization gives summable coefficients $O \( 2^(- j \/ 2) \)$ on the annuli of
  relative scale $2^(- j)$. Above that scale, rapid decay gives an arbitrary summable power.
  Fix a small length tolerance $xi > 0$. Truncate the upper annuli after an enlargement $Z^(xi \/ 2)$;
  sufficiently many fixed derivatives make the omitted part negligible by absolute counting.
  A main scale below $Z^(- xi)$ is likewise negligible. If a retained annular profile has fixed upper support
  endpoint $B$, a scale $S$ that can contain a nonzero integral ideal satisfies $S B gt.eq 1$. On such a scale,

$ max \( S \, 1 \) lt.eq max \( 1 \, B \) S . $

Thus replacing a retained subunit scale by scale one costs this fixed multiplicative factor.
  All these assertions are uniform in the moving labels.

The row-dependent choices $d_0 \, h_0$ are handled by their coefficient mass followed by a rowwise supremum in the
  resulting scales. Lemma 9 bounds a supremum over two polynomial-range scales using $O \( \( log Z \)^2 \)$ unit
  boxes and derivatives of the profiles. The row character and its natural zeros remain unchanged:
  after reflection, conjugating that whole factor inside its absolute value replaces the conjugate character by
  the original character and conjugates its profile. This operation is valid because the absolute value of a
  product is unchanged by conjugating one factor.

Let $C_(upright("ref")) gt.eq 1$ include $C_(cal(A))$, the fixed annular endpoint multipliers,
  the logarithmic box multipliers for a reflected factor and any paired unreflected factor,
  and $max \( 1 \, B \)$ for the retained profile types. This constant is fixed after the data and profile types,
  independently of $Z$ and the moving labels. For $n = log_Z X$,
  every retained scale satisfying the preceding support test, after the permitted clipping and box enlargement,
  has declared nonnegative length

#[#set math.equation(numbering: n => "(2.155)")
 $ n_(upright("ref")) lt.eq M - n + xi / 2 + frac(log C_(upright("ref")), log Z) lt.eq M - n + xi wide
   (frac(log C_(upright("ref")), log Z) lt.eq xi / 2) . $ <eq:centered-reflection-length>]

This is a linear bound also when $M - n$ is slightly negative; if its right side is negative,
  no such retained scale exists. The smaller upper-annulus range changes only the fixed decay, seminorm,
  and height orders used for the discarded tail.

For $z = 0$, reflect each original factor whose length exceeds $M \/ 2$ once,
  and leave the other factor unchanged. Equation (2.155) bounds every retained reflected factor;
  the fixed box multiplier for an unreflected factor is included in $C_(upright("ref"))$.
  After the preceding annular truncation and scale-box enlargement, the resulting lengths satisfy

#[#set math.equation(numbering: n => "(2.156)")
 $ n_i^(*) lt.eq M \/ 2 + xi \, wide A^(*) = n_1^(*) + n_2^(*) lt.eq M + 2 xi lt.eq M + delta \, $ <old-eq:2.1h>]

provided $2 xi lt.eq delta$. We call this the padded zero-slot core.
  Here $delta$ is the positive padding parameter chosen below after the width floor and step.
  There is no repeated reflection at the boundary $M \/ 2$.
  Reflection and scale suprema are taken before centering; on a later centered term whose primitive inducing
  character lies outside $Theta$, one first applies the triangle inequality to its two rectangles.
  No such supremum is applied to a centered difference whose primitive inducing character belongs to $Theta$.

===== 2.7.2 Prime estimates and the induction order <sec:weighted>

For $kappa < 1$, put $s_kappa = \( 1 + kappa \) \/ 2$. Under the hypothesis $s_kappa gt.eq beta_(*)$,
  the global part of Lemma 13 gives, for every fixed $e > 0$,

#[#set math.equation(numbering: n => "(2.157)")
 $ L' / L \( s_kappa + e + i t \, psi \) lt.double_e log #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] 2
   Q_psi \( 3 + \| t \| \)^2 #scale(x: 120%, y: 120%)[\)] $ <old-eq:3.4>]

for a primitive nonprincipal inducing character $psi$. To estimate a prime annulus of scale $P$,
  apply Mellin inversion to a smooth von Mangoldt sum and move its contour to $Re s = s_kappa + e$.
  There are no poles in the region of the shift, and the Mellin transform has arbitrary decay,
  so Equation (2.157) bounds the new integral by $P^(s_kappa + e)$ times a logarithm of the conductor and a fixed
  polynomial in the height. Prime powers of exponent at least two contribute $O \( P^(1 \/ 2 + epsilon.alt_1) \)$.
  For large $P$, dividing the annular weight by $log \( P y \)$ replaces the von Mangoldt weight by the prime
  weight; its smooth seminorms are bounded on the annulus. Bounded $P$ are estimated by absolute counting.
  Expand each positive-length coefficient in the characters $theta.alt_(i j)$ from the statement.
  If the primitive inducing row character $psi in.not Theta$ made $psi theta.alt_(i j)$ principal, then $psi =
  theta.alt_(i j)^(- 1) in Theta$, a contradiction. Thus every resulting slot character is nonprincipal on $cal(R)_z$.

After extra-mask erasure, fix a positive slot list and put $bold(W) = \( W_i^(upright("slot")) \)_(i in cal(I))$.
  For normalized twist heights $bold(omega) = \( omega_i \)_(i in cal(I))$, define

$ Q_(bold(omega)) = product_(i in cal(I)) {P_i^(- 1 \/ 2) sum_(p med upright("prime")) psi_k^0 \( p \)
  nu_i \( p \) W_i^(upright("slot")) \( q_p \/ P_i \) \( q_p \/ P_i \)^(i omega_i)} . $

For every $epsilon.alt_1 > 0$, central normalization and multiplication over this fixed list,
  with $e$ and all subsidiary losses sufficiently small, give finite $j \, b \, h gt.eq 0$ and a constant $C$ such that

#[#set math.equation(numbering: n => "(2.158)")
 $ \| Q_(bold(omega)) \|^2 lt.eq C Z^(kappa z + epsilon.alt_1) p_j \( bold(W) \)^b \( 1 + \| bold(omega) \| \)^h
   wide \( k in cal(R)_z \, med z > 0 \) . $ <old-eq:3.5>]

Here $j$ may be rounded up to an integer and $2 s_kappa - 1 = kappa$.
  The orders and $C$ may depend on the fixed data, slot count, loss,
  and any fixed requested internal logarithmic or normalized-twist derivatives, but not on $Z$, moving labels,
  rows, or the numerical heights. The exponent $kappa z + epsilon.alt_1$ is independent of these derivative and
  height orders. Indeed, translate each pure twist in its Mellin variable before integration by parts.
  The weighted integral of the untwisted Mellin transform then contributes a finite seminorm and a fixed
  polynomial in $bold(omega)$, while the contour displacement contributes exactly $2 e z$ to the squared exponent.
  Logarithmic derivatives remain annular, and normalized-twist derivatives insert only powers of the logarithmic
  profile variable. The redundant natural radical contains only $O \( log Z \)$ primes,
  so deleting it changes a normalized slot by $O \( P_i^(- 1 \/ 2) log Z \)$ times its fixed profile factor;
  this is within the stated power loss because $P_i gt.eq 1$.
  For $kappa = 1$, absolute prime counting gives Equation (2.158) without a zero-free assumption and with $h =
  0$ for undifferentiated pure twists, whose modulus is one.
  For $kappa < 1$ the hypothesis remains $beta_(*) lt.eq \( 1 + kappa \) \/ 2$.
  The choice of losses is uniform in $kappa in \[ 3 \/ 4 \, 1 \]$, since the length ranges are bounded.
  In every later use of Equation (2.158), its fixed seminorm and height factor is retained in the weighted Fourier
  estimates; it is not included in the exponent of $Z$.

We now specify the induction, including the estimates at its smallest widths.
  Choose a width floor $rho > 0$, a width step $sigma > 0$, and then $delta > 0$,
  all small in terms of the final $epsilon.alt$, with $delta lt.double min \( rho \, sigma \)$.
  Precise loss choices will be made after the depth is bounded.
  Divide the bounded range of $M$ into consecutive bands of length $sigma \/ 4$.
  Prove all zero-slot bands first, in increasing order of width, and then all positive-slot bands.
  Within a zero-slot band, first prove the uncentered assertion for $A lt.eq 5 M \/ 6$,
  and then the padded core in Equation (2.156). Reflection then supplies all zero-slot lengths in that band.
  Within a positive-slot band, first prove the uncentered assertion for $A lt.eq
  5 M \/ 6$ subject to Equation (2.150), and then the remaining part of that region by centering.
  A completed earlier band therefore includes the unrestricted zero-slot assertion.
  Let $M_max$ bound the initial width range, and define

$ D = 2 + ⌈2 M_max \/ sigma⌉ . $

The strict width decrease proved below will show that at most $D - 2$ nonterminal calls occur on a branch.

At $M lt.eq rho$, the padded zero-slot core follows from absolute counting:
  there are $O \( Z^m \)$ rows and the squared product is $O \( Z^(A + epsilon.alt_1) \)$.
  Its exponent above $M$ is at most $A - q lt.eq rho + delta$.
  For positive slots, combine the completed zero-slot estimate with Equation (2.158).
  In the region of Equation (2.150), $A gt.eq z$, whence

#[#set math.equation(numbering: n => "(2.159)")
 $ z lt.eq frac(M, 6 kappa) lt.eq frac(2 M, 9) \, wide kappa z lt.eq M / 6 . $ <old-eq:3.6>]

Thus the extra terminal exponent for positive slots is at most $rho \/ 6$.
  These terminal exponents can be made smaller than the reserved final loss by choosing $rho \,
  delta$ sufficiently small.

For a width above the floor, the two-transform estimate below will first prove the uncentered range $A lt.eq
  5 M \/ 6$. We explain now why the remaining inputs can be compared with that range. Set

#[#set math.equation(numbering: n => "(2.160)")
 $ L = M \/ 4 . $ <old-eq:2.2>]

For $A > 5 M \/ 6$, the comparison lengths $L \, A - z - L$ are both at least $L$.
  In the positive-slot case, $\( 6 kappa - 1 \) z lt.eq M - A < M \/ 6$, and $6 kappa - 1 gt.eq 7 \/ 2$;
  hence $z < M \/ 21 < M \/ 20$. This also shows $A - z > 2 L$.

If one original plain length is $b < L$, reflect the other factor.
  If both are at least $L$, introduce the comparison with lengths $L \, A - z - L$ and the same two profiles;
  reflect its longer factor only when estimating the comparison separately.
  In both cases the total length after that reflection is at most

$ b + { M - \( A - z - b \) } + z + xi lt.eq 3 M \/ 2 - A + 2 z + xi \, $

where $b lt.eq L$. Equation (2.155) includes the clipped reflected scale and the paired unreflected box multiplier
  in this same $xi$; the discarded tails have the stated fixed-order bounds. Thus

#[#set math.equation(numbering: n => "(2.161)")
 $ A_(upright("comp")) lt.eq 3 M \/ 2 - A + 2 z + xi . $ <old-eq:3.11>]

For $z = 0$, this gives $5 M \/ 6 - A_(upright("comp")) gt.eq M \/ 6 - xi$.
  For $z > 0$, use $\( 6 kappa - 1 \) z lt.eq M - A$, $A > 5 M \/ 6$, and $z < M \/ 20$ to get

#[#set math.equation(numbering: n => "(2.162)")
 $ A_(upright("comp")) & lt.eq 23 / 30 M + xi \,\
A_(upright("comp")) + \( 6 kappa - 1 \) z & lt.eq 5 / 2 M - 2 A + 2 z + xi lt.eq 14 / 15 M +
  xi . $ <eq:comparison-uncentered-margin>]

Each required boundary has a margin of at least $M \/ 15$ before the $xi$ term. Choose $xi lt.eq rho \/ 30$.
  After the threshold in Equation (2.155), the unit-box multipliers are already included in $xi$,
  so every retained reflected comparison calls the previously proved uncentered assertion at this same width.
  This also completes the original case with a factor shorter than $L$.

In the remaining case put $X_i = Z^(n_i)$, $Y_1 = Z^L$, and $Y_2 = X_1 X_2 \/ Y_1$.
  Then $X_1 X_2 = Y_1 Y_2$, and all four plain lengths are at least $L$.
  Subtract the unreflected comparison from the original product, leaving the common product $Q$ of slots;
  call the result $Delta_k$. Multiplicativity and the equal product normalization give the explicit formula

$ Delta_k = Q / sqrt(X_1 X_2) sum_(l_1 \, l_2) psi_k \( l_1 l_2 \) { & W_1 \( q_(l_1) \/ X_1 \)
  W_2 \( q_(l_2) \/ X_2 \)\
-  & W_1 \( q_(l_1) \/ Y_1 \) W_2 \( q_(l_2) \/ Y_2 \) #scale(x: 120%, y: 120%)[}] . $

The comparison is bounded on the original permissible rows.
  The squared norm of the whole $Delta_k$ is nonnegative, so it can then be enlarged to all rows in the smooth row
  ball. In the uncentered case, enlarge the squared norm of the original product instead.
  The Poisson transforms below are therefore never applied to an indicator selecting exceptional or nonexceptional rows.

===== 2.7.3 The centered coefficient and its support <the-centered-coefficient-and-its-support>

We keep the subtraction as one coefficient while transforming its row norm.
  For fixed ideals $upright(bold(b)) = \( frak(b)_1 \, frak(b)_2 \)$, define

#[#set math.equation(numbering: n => "(2.163)")
 $ D_(upright(bold(b))) \( l_1 \, l_2 \) = product_(i = 1)^2 W_i \( q_(frak(b)_i) q_(l_i) \/ X_i \) -
   product_(i = 1)^2 W_i \( q_(frak(b)_i) q_(l_i) \/ Y_i \) \, wide X_1 X_2 = Y_1 Y_2 . $ <old-eq:2.18a>]

An allocation $upright(bold(b))$ records prime powers already extracted from the two plain variables.
  If its conditions are impossible for one rectangle, that rectangle’s profile is zero on the corresponding sum;
  the formal difference in Equation (2.163) is nevertheless retained.

The reason for retaining these common data is already visible in the exceptional case.
  For a fixed $theta.alt in Theta$, a common mask $frak(R)_(*)$, and a common norm power $q_l^(i t)$,
  the lattice estimate proved below has leading term

$ sum_l theta.alt \( l \) 1_(\( l \, frak(R)_(*) \) = 1) q_l^(i t) W_i \( q_l \/ T \) =
  c_(theta.alt \, frak(R)_(*)) T^(1 + i t) I_i \( t \) + upright("error") \, $

where $c_(theta.alt \, frak(R)_(*))$ does not depend on $T$ or $t$.
  Here $I_i \( t \)$ is a fixed measure constant times $integral_0^oo W_i \( y \) y^(i t) thin d y$.
  The product main term is therefore $c_(theta.alt \, frak(R)_(*))^2 T_1^(1 + i t) T_2^(1 + i t) I_1 \( t \)
  I_2 \( t \)$, which agrees for the two rectangles when $T_1 T_2$ agrees.
  Lemma 61 will quantify the remaining error. This cancellation is used only on the transformed rows inducing
  characters in $Theta$; the common coefficient below is retained on all rows until that later division into cases.

For a remaining slot set $cal(I)'$, write $Pi = product_(i in cal(I)') p_i$.
  A coefficient with a common character and mask means a coefficient of the form

#[#set math.equation(numbering: n => "(2.164)")
 $ & (product_(i in cal(I)') nu_i \( p_i \) W_i^(upright("slot")) \( q_(p_i) \/ P_i \))
   D_(upright(bold(b))) \( l_1 \, l_2 \) thin tau_1 \( u \) q_u^(i t) 1_(\( u \, frak(R) \) = 1) 1_(s divides u) \,\
 & #h(40mm)  u = Pi l_1 l_2 . $ <eq:centered-coefficient-form>]

Here $tau_1$ is one zero-extended product of a fixed finite-ray character and moving residue-symbol factors;
  $frak(R)$ is a fixed squarefree extra mask; $s$ is a fixed squarefree ideal; and $t in bb(R)$.
  The condition $s divides u$ is omitted when $s = 1$. The slots retain their original disjoint underlying
  supports. They may share primes with either plain variable.

These common data factor multiplicatively on the #emph[full] product.
  For any ideals $v_1 \, dots.h \, v_r$, even with common primes,

$ chi_(product v_i) \( h \) = product_i chi_(v_i) \( h \) \, quad q_(product v_i)^(i t) =
  product_i q_(v_i)^(i t) \, quad 1_(\( product v_i \, frak(R) \) = 1) = product_i 1_(\( v_i \, frak(R) \) = 1) . $

The first identity includes all zeros: a present prime whose total exponent is divisible by six gives the
  zero-extended principal factor, not the constant one. The same multiplicativity holds for $tau_1$.
  A fixed-ray character evaluated on a full product also factors with the same character on every variable.

We fix a support convention that will also control the slot-mesh quantifier.
  Let $N$ be the original fixed number of slots, and choose fixed intervals $\[ a_i \, b_i \]$ containing the
  support of each $W_i^(upright("slot"))$. Put $h_i = max { \| log a_i \| \, \| log b_i \| }$.
  Choose a fixed number $H_N$ at least $sum_i h_i$, enlarged to include the two plain profile windows,
  $log C_(upright("ref"))$, fixed arithmetic normalizations, the relative dyadic boxes,
  and the finitely many support enlargements through the $D$ operation stages.
  The number $H_N$ may depend on all the fixed data and on $N$, but not on $Z$ or any moving label.
  For every subset $I$ of live or frozen slots,

#[#set math.equation(numbering: n => "(2.165)")
 $ lr(|log product_(i in I) q_(p_i) / P_i|) lt.eq sum_(i in I) h_i lt.eq H_N \, wide theta_N :=
   frac(H_N, log Z) . $ <eq:centered-aggregate-support>]

Every residual full product divided by its nominal product scale lies in $exp \( \[ - H_N \, H_N \] \)$,
  after increasing $H_N$ once for the fixed list of operations. Both rectangles use that same box.
  Extracted plain prime powers use their exact norms, and a frozen slot contributes its ratio $q_p \/
  P_i$ just once. If a nonempty plain scale below one is clipped to one,
  its error is at most the logarithm of that plain window’s fixed endpoint divided by $log Z$,
  once for that plain. Thus a whole subset of slots or a whole divisor extraction contributes one aggregate
  $O \( theta_N \)$ boundary error, not one copy of a preselected tolerance for each slot or prime.

===== 2.7.4 The first Poisson transform and its target bound <sec:plain-first-transform>

We now estimate either the uncentered product or the centered difference selected above.
  Put $H = Z^m$ and $X = Z^A$. Choose a fixed nonnegative smooth radial function that majorizes the row ball.
  The full index product in either rectangle has norm in a fixed multiple of $X$.
  All comparisons of exponents in this subsection are first made on fixed dyadic norm intervals.
  Their bounded relative widths change a logarithmic length by $O \( 1 \/ log Z \)$;
  the final loss discussion includes these changes.

We use the following common localization for both Poisson formulas.
  Fix a nonnegative smooth dyadic partition $sum_lambda omega_lambda \( q \/ T_lambda \) = 1$ for $q > 0$,
  with each weight supported in $C_d^(- 1) lt.eq q \/ T_lambda lt.eq 1$ for one fixed $C_d$.
  A sector fixes dyadic boxes for the finite list of aggregate outer norms, not a separate box for each slot.
  Let $T_(upright("sec"))$ be the supremum in that sector of the nominal frequency scale.
  Its ratio to the scale at any one set of outer labels is at most a fixed $C_(upright("sec"))$.
  Retain exactly the whole weights whose support meets

$ 0 < q lt.eq T_(upright("sec")) Z^(xi \/ 2) . $

Their union is contained in $q lt.eq C_d T_(upright("sec")) Z^(xi \/ 2)$;
  every discarded weight is supported above $T_(upright("sec")) Z^(xi \/ 2)$.
  The selection depends only on the sector, never on a live column.
  After $N$ and the support data are fixed, take $Z$ large enough that

#[#set math.equation(numbering: n => "(2.166)")
 $ 2 theta_N + frac(log \( C_d C_(upright("sec")) \), log Z) < xi / 4 . $ <eq:centered-localization-threshold>]

One fixed enlargement of $C_(upright("sec"))$ covers all the finitely many sector endpoint factors.

Here is a direct tail bound that justifies this operation on the genuine sums.
  In both applications the kernel argument is at least $q \/ \( e^(2 H_N) T_(upright("sec")) \)$.
  On every discarded weight it is therefore at least $Z^(xi \/ 4)$, by Equation (2.166).
  Lemma 11 gives arbitrary decay $\( 1 + upright("argument") \)^(- B)$.
  For the first formula use $\| G \( a \, h \) \| lt.eq q_a^(1 \/ 2)$,
  and for the second use the finite definition $\| F \( u \, v \; j \) \| lt.eq q_u q_v$.
  Absolute ideal counting and the divisor bounds for the fixed number of factors bound all raw columns and
  prefactors in a sector by $C_N Z^(B_0)$ times a fixed polynomial in the retained heights,
  where $B_0$ depends only on the bounded total lengths and chosen subsidiary power shares.
  A lattice norm dyad of scale $T$ has $O \( 1 + T \)$ frequencies.
  Summing the radial decay over discarded dyads consequently gives $C_(N \, B)
  Z^(B_1 - B xi \/ 4)$ times that height polynomial, for a bounded $B_1$ independent of $B$ and $N$,
  and a convergent geometric sum when $B > 1$. Choose $B$ sufficiently large to obtain any prescribed power
  saving, including the polynomial number of frozen outer labels.
  This is an absolute bound for the original terms, before any off-coprime extension or Fourier absolutization.
  It uses neither the later $s$-radical saving nor a factorized off-coprime identity.
  On the retained weights the full smooth kernel is kept; no sharp condition comparing a row norm with the two
  live column norms is inserted. A retained range below the first nonzero lattice norm is empty,
  apart from a bounded boundary dyad covered by the clipping convention below.

At zero frequency in the first row Poisson formula, a character mean can be nonzero only if its exponent at every
  prime is zero modulo six. In particular, no prime occurs to total multiplicity one in the product of the two
  full index products. This product is therefore a powerful ideal.
  There are $O_epsilon.alt \( X^(1 + epsilon.alt) \)$ such products of norm $O \( X^2 \)$:
  each powerful ideal is a square times a cube of a squarefree ideal,
  and summing over the latter gives the usual $O \( Y^(1 \/ 2 + epsilon.alt) \)$ bound up to norm $Y$.
  Allocations to the fixed number of factors are divisor-bounded.
  The central factor is $X^(- 1)$, and the row mean has size at most $H$.
  Thus the zero frequency is $O \( Z^(m + epsilon.alt_1) \)$.

For the nonzero frequencies write the two full products as $C a \, D b$, where $C \,
  D$ contain their complete common prime support and

$ \( a \, b \) = 1 \, wide \( a b \, C D \) = 1 . $

At each common prime, fix its exact valuation in each plain variable and whether it is supplied by a slot.
  Dividing out these valuations adds that prime to the mask of #emph[every] remaining factor on the side.
  A slot that supplied the prime is frozen and removed. This description is valid even when a slot and one or both
  plain variables supplied that prime. The allocation is made once for the coefficient,
  so the same ideals $frak(b)_i$ occur in the two terms of $D_(upright(bold(b)))$.
  An impossible allocation is a zero term. In particular, a scalar forced to vanish by an old moving zero or a
  common mask is not replaced by its absolute upper bound before these support conditions have been imposed.

Let $c \, d$ be the logarithmic norms of $C \, D$, and let $p$ be the logarithmic norm of their common radical.
  Let $frak(r)$ be the product of common primes whose net exponents are nonzero modulo six;
  its logarithmic norm is $R$. The corresponding character $xi_(frak(r))$ is primitive modulo $frak(r)$.
  In the Möbius expansion of the complementary common row mask,
  write $frak(e)$ for the selected divisor and $E$ for its logarithmic norm. In particular

$ R lt.eq p \, wide E lt.eq p - R . $

Let $A_C \( a \)$ and $A_D \( b \)$ be the allocated convolution coefficients,
  with the common character $tau$ omitted. They include all profiles, live slot coefficients, and fixed masks;
  in the centered case each contains the entire allocated difference. Set

$ tau_C \( a \) = tau \( a \) chi_a \( frak(e) frak(r) \) xi_(frak(r)) \( a \) \, wide tau_D \( b \) =
  tau \( b \) chi_b \( frak(e) frak(r) \) overline(xi_(frak(r)) \( b \)) . $

Residue-class Poisson, with the self-dual lattice measure from Section 2,
  gives for this allocation the following nonzero-frequency expression,
  up to a scalar of bounded modulus in the frozen labels:

#[#set math.equation(numbering: n => "(2.167)")
 $ frac(H, X q_(frak(e)) sqrt(q_(frak(r)))) sum_(h eq.not 0) G_(xi_(frak(r))) \( frak(r) \, h \)
   sum_(\( a \, b \) = 1) & frac(A_C \( a \) overline(A_D \( b \)), sqrt(q_a q_b)) thin tau_C \( a \)
   overline(tau_D \( b \)) overline(cal(R) \( a \, b \)) thin G \( a \, h \) overline(G \( b \, - h \))\
 & quad dot.op hat(Phi)_1 (frac(H q_h, q_(frak(e)) q_(frak(r)) q_a q_b)) . $ <eq:first-poisson-bridge>]

Here $G_(xi_(frak(r)))$ is the normalized primitive Gauss sum and has modulus at most one.
  To check the normalization, the substitution $k = frak(e) k'$ and Poisson modulo $frak(r) a
  b$ give $H \/ \( q_(frak(e)) q_(frak(r)) q_a q_b \)$. The three unnormalized Gauss sums restore
  $sqrt(q_(frak(r)) q_a q_b)$. The global squared central normalization is $X^(- 1)$.
  For the phase, CRT for the pairwise coprime moduli $a \, b \, frak(r)$ supplies

$ chi_a \( b frak(r) \) overline(chi_b \( a frak(r) \)) xi_(frak(r)) \( a b \) . $

The substitution $k = frak(e) k'$ supplies $chi_a \( frak(e) \) overline(chi_b \( frak(e) \))$,
  up to a scalar in the frozen labels. Reciprocity changes $chi_a \( b \)
  overline(chi_b \( a \))$ into $overline(cal(R) \( a \, b \))$;
  the remaining factors are precisely $tau_C \( a \) overline(tau_D \( b \))$. This proves Equation (2.167).
  Each new character acts on its whole residual product. Its new moving primes belong to the extracted support and
  puncture every residual factor. Their full displayed union is counted even if the factors at $frak(r)$ cancel on
  units.

The new full displayed moving support has logarithmic norm at most $tilde(q) = q + R + E$,
  including any canceled factors at $frak(r)$. Its nominal frequency scale is exactly

$ T_1 \( C \, D \, frak(e) \, frak(r) \) = frac(q_(frak(e)) q_(frak(r)) X^2, H q_C q_D) = Z^(K_0) \, wide K_0 =
  2 A - c - d + R + E - m . $

The product support convention gives $q_a \/ \( X \/ q_C \) \,
  q_b \/ \( X \/ q_D \) in exp \( \[ - H_N \, H_N \] \)$, so the argument in Equation (2.167) is at least
  $q_h \/ \( e^(2 H_N) T_(upright("sec")) \)$ for the supremum of $T_1$ in the outer sector.
  Apply the preceding whole-dyad localization to this genuine coprime bridge.
  If $K = log_Z T_lambda$ is the upper length of a retained dyad, then

#[#set math.equation(numbering: n => "(2.168)")
 $ tilde(q) = q + R + E \, wide K lt.eq K_0 + delta_(upright("fr") \, 1) \, wide 0 lt.eq
   delta_(upright("fr") \, 1) := xi / 2 + frac(log \( C_d C_(upright("sec")) \), log Z) < xi . $ <old-eq:2.3>]

The zero frequency already estimated above was the zero term of the original common smooth row ball;
  it is not restored on a truncated row domain. The later ledgers retain the possible inequality $K_0 - K gt.eq -
  delta_(upright("fr") \, 1)$.

For each retained dyad and genuine common-support allocation,
  define $cal(C)_1 \( a \, b \; h \)$ to be the full bridge summand also on noncoprime residual pairs individually
  disjoint from $C D$ and allowed by the old masks. Use the fixed bicharacter $cal(R) \( a \, b \)$,
  the full zero-extended $G \( a \, h \) \, G \( b \, - h \)$, the displayed whole-product characters,
  and the same dyad weight, kernel, inverse roots, and formal product norms.
  CRT identifies this definition with the genuine summand only on $\( a \, b \) = 1$.
  On each finite column shell the exact identity is

$ sum_(\( a \, b \) = 1) cal(C)_1 \( a \, b \; h \) = sum_(a \, b) cal(C)_1 \( a \, b \; h \)
  sum_(s divides a \, b) mu \( s \) . $

The full squarefree Möbius sum annihilates the artificial noncoprime pairs.
  Insert it before estimating independent factors, and put $s_0 = log_Z q_s$.
  Separate the fixed-ray phases and all smooth factors in the normalized row norm and the two whole-product norms.
  In these variables the kernel is $hat(Phi)_1 \( R_(upright("sc")) x \/ \( y_1 y_2 \) \)$ on fixed logarithmic
  boxes. If its aggregate scale ratio $R_(upright("sc"))$ varies over the sector,
  include that single normalized outer ratio as another coordinate.
  The cutoffs are chosen on the common product annulus of Equation (2.165), before fixing live slot labels.
  Thus one Fourier coefficient measure is common to the rows and all live labels.
  It supplies a row phase and only one norm power on each whole column,
  together with phases in frozen outer norms. It introduces no separate powers on the two plain variables or the
  two rectangles. The full kernel and inverse roots are kept until this separation;
  taking their absolute supremum inside $D_(upright(bold(b)))$ would not preserve the coefficient.
  Apply Cauchy–Schwarz in $h$ only after this separation, and only then use $\| G_(xi_(frak(r))) \| lt.eq 1$.
  The resulting positive norm on the $C$ side is

$ cal(N)_C =
  sum_(h eq.not 0) omega_K \( q_h \/ Z^K \)
  lr(|Z^(- \( A - c \) \/ 2) sum_(s divides a) A_C \( a \) tau'_C \( a \) q_a^(i t) G \( a \, h \)|)^2 \, wide
  omega_K gt.eq 0 \, $

and there is an analogous $D$ norm. Here $tau'_C$ includes one separated fixed-ray character.
  All fixed masks in $A_C$ remain present. Complete extraction and multiplicativity therefore leave the
  coefficient in Equation (2.164), now multiplied by $G \( a \, h \)$.
  In particular the two rectangles retain the same allocated plain powers, character, puncture, and norm power.

The factors outside these two norms have exponent $m - A - R \/ 2 - E$.
  The absolute number of common-support labels and Möbius labels has exponent $p + s_0 + epsilon.alt_1$.
  To justify the common-support count uniformly, first count its radical, giving $O \( Z^(p + epsilon.alt_1) \)$.
  For a fixed radical $frak(c)$ of polynomial norm and any fixed $T$, Rankin’s bound gives

$ \# { v : "rad" \( v \) divides frak(c) \, med q_v lt.eq Z^T } lt.eq Z^(a T) product_(r divides frak(c)\
r med upright("prime")) \( 1 - q_r^(- a) \)^(- 1) lt.double Z^(a T + epsilon.alt_1) $

for every fixed $a > 0$. Choose $a$ small and use the polynomial-size Euler-product estimate.
  This bounds the choices of the powers in $C \, D$ by an arbitrarily small power.
  Their allocations and the choice of $frak(e)$ have divisor-bounded multiplicity.
  Finally there are $O \( Z^(s_0 + epsilon.alt_1) \)$ possible $s$.

The allowance $epsilon.alt_G$ below denotes the error envelope for the current induction depth,
  together with its local small-power shares. These envelopes will be chosen compatibly when the finite induction
  is completed, using the same slot mesh throughout. We will prove the following sufficient bound for the squared
  $C$ norm:

#[#set math.equation(numbering: n => "(2.169)")
 $ cal(N)_C lt.double Z^(A - c + tilde(q) + cal(B)_c - s_0 + epsilon.alt_G) \, wide cal(B)_c =
   max { 0 \, \( 3 c - 5 d - R \) \/ 6 } . $ <old-eq:2.5>]

The analogous quantity is $cal(B)_d = max { 0 \, \( 3 d - 5 c - R \) \/ 6 }$.
  The complete exponent ledger for this implication is

$ & \( m - A - R \/ 2 - E \) + \( p + s_0 \)\
 & quad + 1 / 2 { A - c + tilde(q) + cal(B)_c - s_0 + A - d + tilde(q) + cal(B)_d - s_0 }\
 & = M + 1 / 2 { cal(B)_c + cal(B)_d - \( c + d - 2 p - R \) } . $

The last brace is nonpositive:

#[#set math.equation(numbering: n => "(2.170)")
 $ cal(B)_c + cal(B)_d lt.eq c + d - 2 p - R . $ <old-eq:2.6>]

Indeed, at a common prime of multiplicities $i gt.eq j gt.eq 1$, put $r = 1_(6 divides.not i - j)$.
  Only the $i$ side can have a positive local numerator. Its contribution is at most $\( 3 i - 5 j - r \)_(+) \/
  6$, whereas the right side contributes $i + j - 2 - r$. The latter is nonnegative.
  If the former is positive, six times their difference is $3 i + 11 j - 12 - 5 r$, which is nonnegative:
  for $r = 0$ it is at least $2$, and for $r = 1$ one has $i gt.eq j + 1$, giving at least $0$.
  The positive part of a sum is at most the sum of positive parts.
  Multiplication by each prime’s logarithmic norm and summation proves Equation (2.170).
  Thus it remains to establish Equation (2.169).

===== 2.7.5 Enlarging the Gauss-row norm <sec:plain-gauss-enlargement>

This subsection describes three possible positive norms to which the second transform will be applied.
  Let $w$ denote a length removed from the $C$ column, and let $w_o lt.eq
  w$ be the additional moving-radical length created by that removal. Put $a_0 = A - c - w$.
  When a squared extraction coefficient of size $Z^(- w_o)$ has been removed,
  Equation (2.169) allows the unweighted remaining norm the exponent

#[#set math.equation(numbering: n => "(2.171)")
 $ Lambda_c = a_0 + tilde(q) + w_o + w + cal(B)_c - s_0 + epsilon.alt_G . $ <old-eq:2.7>]

This is just $A - c + tilde(q) + cal(B)_c - s_0 + epsilon.alt_G + w_o$.

For the initial norm, with $w = w_o = 0$ and $a_0 = A - c$,
  the first transform gives the following conditional summand after fixing $Pi$ and omitting its outer scalar:

#[#set math.equation(numbering: n => "(2.172)")
 $ Z^(- a_0 \/ 2) sum_(l_1 \, l_2) D_(upright(bold(b))) \( l_1 \, l_2 \) tau_1 \( l_1 l_2 \) q_(l_1 l_2)^(i t)
   1_(\( Pi l_1 l_2 \, frak(R) \) = 1) 1_(s divides Pi l_1 l_2) G \( Pi l_1 l_2 \, h \) . $ <old-eq:2.18c>]

The slot sums are restored before this polynomial is squared.
  The same statement with the second rectangle omitted applies to uncentered products.
  The local calculations below will show that the extracted terms retain this form at their shortened length
  $a_0 = A - c - w$.

Define

#[#set math.equation(numbering: n => "(2.173)")
 $ J = d - c + \( K_0 - K \) - 2 w + w_o \, wide J_(+) = max \( J \, 0 \) . $ <old-eq:2.8>]

In the zero-slot proof take $w = w_o = 0$, and set

$ ell = 0 \, wide g = J_(+) + sigma . $

The positive norm $cal(N)_C$ is at most the corresponding norm over a smooth ball of length $K + g$.
  There is no multiplication of rows in this case.

For positive slots, start with $w = w_o = 0$. Set $ell_(*) = sigma \/ 3$, choose the slot mesh $eta < sigma \/ 6$,
  and take the fixed pool

$ cal(P) = { p : Z^(ell_(*)) \/ 2 < q_p lt.eq Z^(ell_(*)) \, med p in.not cal(S) } . $

The prime ideal theorem in the fixed field, equivalently its fixed ray-class form [27] Theorem 1.1,
  gives $\| cal(P) \| = Z^(ell_(*) + o \( 1 \))$. Because the live slot lengths are at most $eta$ and their
  relative annular supports are fixed, the single inequality $Z^(ell_(*) - eta) > 2 max_i
  b_i$ makes this pool disjoint from every live slot window.
  Its exponent gap is at least $sigma \/ 6$, independently of $N$;
  only the threshold depends on the fixed windows. For a row $h eq.not 0$, omit pool primes dividing $h$, $s$,
  or any frozen support. Each such integer or ideal has polynomial norm, so $O \( log Z \)$ primes are omitted.
  The remaining set $cal(P)_h$ has size comparable to $\| cal(P) \|$, uniformly in the row and frozen labels.

To compare the rows $h$ and $h p^6$, write a full modulus as $p^i u$ with $\( p \, u \) = 1$.
  CRT and reciprocity give the exact formula

$ G \( p^i u \, h \) = cal(R) \( p \, u \)^i chi_p \( u \)^(2 i) G \( p^i \, h \) G \( u \, h \) . $

Also $G \( u \, h p^6 \) = G \( u \, h \)$, since $p$ is a unit modulo $u$ and $chi_u \( p^6 \) = 1$.
  For $p divides.not h$, Equation (2.10) shows that replacing $h$ by $h p^6$ changes only $i = 1 \, 6 \, 7$.
  The factors $G \( p^i \, h \)$ that occur are a scalar in the row and $p$;
  the displayed remaining factor is one fixed-ray character times one residue character on the whole $u$.
  Since $p$ is outside every live slot window, $p^i$ is allocated only to the two plain variables.
  The residual product is punctured at $p$, and the same allocation updates $D_(upright(bold(b)))$ in both
  rectangles. Because $p divides.not s$, the condition $s divides u$ remains.

Here is the precise averaging argument. Write the normalized polynomial in $cal(N)_C$ as $cal(H) \( h \)$.
  For each eligible $p$, local Gauss evaluation gives $cal(H) \( h \) =
  cal(H) \( h p^6 \)$ plus the extracted terms with $p$-adic column valuations $1 \, 6 \, 7$.
  There are only boundedly many allocations of each of these valuations to the two plain variables.
  Jensen’s inequality, first in $p$ and then for this fixed finite sum, gives

$ \| cal(H) \( h \) \|^2 lt.double frac(1, \| cal(P)_h \|) sum_(p in cal(P)_h) {\| cal(H) \( h p^6 \) \|^2 +
  sum_(i = 1 \, 6 \, 7) sum_(upright("allocations")) \| c_(p \, i) \( h \) \|^2 \| cal(H)_(p \, i) \( h \) \|^2} . $

The $cal(H)_(p \, i)$ are normalized at their shortened column scales.
  The local identity and allocation just described are applied to the whole centered coefficient,
  so each error retains Equation (2.164).

On the support of the original row weight, the new row $h p^6$ has norm $O \( Z^(K + 6 ell_(*)) \)$.
  A fixed output row has only boundedly many representations as $h p^6$ with $p in cal(P)_h$:
  every such $p$ divides that row, and all such primes have norm at least $Z^(ell_(*)) \/ 2$,
  while the output norm has bounded logarithmic length. Summing the first term over $h$ therefore gives the factor
  $\| cal(P) \|^(- 1) = Z^(- ell_(*) + o \( 1 \))$ times a positive norm on the new rows. For this main term set

$ ell = ell_(*) \, wide g = J_(+) + 2 sigma . $

Since $6 ell_(*) = 2 sigma$, a smooth ball of length $K + g$ contains all the new rows.

For the extracted terms put $P = q_p$. When $p divides.not h$,
  Equation (2.10) gives the following central coefficients.
  At valuation one, the old Gauss sum has modulus one and the new one is zero,
  so extraction gives squared coefficient $P^(- 1)$. At valuation six,
  the new Gauss sum is $P^3 \( 1 - P^(- 1) \)$; its central factor is $P^(- 3)$, giving $\( 1 - P^(- 1) \)^2$.
  At valuation seven, the new Gauss sum has modulus $P^3$, and the central factor $P^(- 7 \/ 2)$ gives $P^(- 1)$.
  The row phase is $overline(chi_p \( h \))$ for valuations one and seven, and is one for valuation six.
  It multiplies both rectangles.

Let $ell_p = log_Z P$. For sufficiently large $Z$, $ell_(*) \/ 2 lt.eq ell_p lt.eq ell_(*)$.
  The removal and new moving-radical lengths for the three terms are

#[#set math.equation(numbering: n => "(2.174)")
 $ \( w \, w_o \) = \( i ell_p \, e_i ell_p \) \, wide i = 1 \, 6 \, 7 \, quad e_1 = e_7 = 1 \, quad e_6 =
   0 . $ <old-eq:2.9>]

The two squared factors $P^(- 1)$ give exactly $Z^(- w_o)$.
  For the valuation-six term, the exact factor $chi_p \( u \)^12 =
  1_(\( u \, p \) = 1)$ is represented by the already common fixed puncture at $p$,
  with its fixed-ray phase $cal(R) \( p \, u \)^6$ retained.
  At valuations one and seven the displayed local factor remains, and its prime is counted in the moving radical.
  In each error, freeze $p$, retain its common column puncture,
  and discard its row eligibility restriction only after taking the positive norm.
  The average remains $\| cal(P) \|^(- 1) sum_(p in cal(P))$,
  so a bound uniform in the frozen $p$ introduces no prime-count factor. For each error set

$ ell = 0 \, wide g = J_(+) + sigma $

and enlarge its original rows directly to a smooth ball of length $K + g$. Errors are not amplified again.
  All three types of norm satisfy

#[#set math.equation(numbering: n => "(2.175)")
 $ 0 lt.eq w_o lt.eq w lt.eq 7 sigma \/ 3 . $ <old-eq:2.10>]

The row zero is added only at the final smooth ball. Put $Y_(upright("col")) = e^(H_N) Z^(a_0) =
  Z^(a_0 + theta_N)$. A nonempty column shell satisfies $Y_(upright("col")) gt.eq 1$, and hence $a_0 gt.eq -
  theta_N$. By Equation (2.10), $G \( u \, 0 \) = 0$ unless $u$ is a sixth power, and $\| G \( u \, 0 \) \| lt.eq
  q_u^(1 \/ 2) lt.eq Y_(upright("col"))^(1 \/ 2)$. There are $O \( Y_(upright("col"))^(1 \/ 6) \)$ sixth powers on
  this support. If $s divides u$, then $q_s^6 lt.eq q_u lt.eq Y_(upright("col"))$,
  so $s_0 lt.eq \( a_0 + theta_N \) \/ 6$. Including the assigned divisor-bounded convolution loss,
  the squared contribution after central normalization is

$ lt.double Z^(- a_0) #scale(x: 120%, y: 120%)[\(] Y_(upright("col"))^(1 \/ 6) Y_(upright("col"))^(1 \/ 2)
  #scale(x: 120%, y: 120%)[\)]^2 Z^(epsilon.alt_1) = Z^(a_0 \/ 3 + 4 theta_N \/ 3 + epsilon.alt_1) lt.eq
  Z^(a_0 - s_0 + 2 theta_N + epsilon.alt_1) . $

The last inequality follows from $a_0 gt.eq - theta_N$ and the displayed bound for $s_0$.
  Thus Equation (2.171) bounds this added row with the numerical $2 theta_N$ correction included in the $C_(*)
  xi$ stage allowance. Here $C_(*) gt.eq 1$ denotes the common constant for aggregate support errors in one stage,
  chosen independently of the slot count $N$. The estimates below establish that one such choice covers all
  operations in a stage. Zero is never multiplied by a pool prime.

===== 2.7.6 The second transform and smaller-width products <sec:plain-second-transform>

Restore all live slot sums before expanding the square. Let $B \( u \)$ denote the full allocated convolution
  coefficient in one of the preceding Gauss polynomials, including its fixed mask and $s$-divisibility condition.
  It contains the whole difference when centering is used. Its moduli satisfy $q_u \/ Z^(a_0) in
  exp \( \[ - H_N \, H_N \] \)$. Let $Phi_2$ be the nonnegative smooth radial function defining the final row
  ball. Apart from the $Z^(o \( 1 \))$ loss in the prime density, the norm to be bounded is

$ Z^(- ell) sum_h Phi_2 \( q_h \/ Z^(K + g) \)
  lr(|Z^(- a_0 \/ 2) sum_u B \( u \) tau_1 \( u \) q_u^(i t) G \( u \, h \)|)^2 . $

The Fourier identity in Lemma 43 gives its exact expansion

$ Z^(K + g - ell - a_0) sum_(u \, v)
  frac(B \( u \) overline(B \( v \)) tau_1 \( u \) overline(tau_1 \( v \)) q_u^(i t) q_v^(- i t), sqrt(q_u q_v))
  sum_j F \( u \, v \; j \) hat(Phi)_2 (frac(Z^(K + g) q_j, q_u q_v)) . $

The kernel that occurs here is

#[#set math.equation(numbering: n => "(2.176)")
 $ hat(Phi)_2 (frac(Z^(K + g) q_j, q_u q_v)) . $ <old-eq:2.18b>]

Both the displayed inverse square roots and this kernel are retained as functions of full $u \,
  v$ until their whole-product separation below. In particular the formula includes every live prime and every
  shared-prime multiplicity.

At $j = 0$, Lemma 43 leaves only $u = v$, with $F \( u \, u \; 0 \) = phi \( u \) lt.eq q_u$.
  The number of supported moduli divisible by $s$, on a nonempty shell, is at most

$ C Y_(upright("col")) / q_s = C Z^(a_0 - s_0 + theta_N) \, $

because writing $u = s v$ gives $Y_(upright("col")) \/ q_s gt.eq 1$ on that shell.
  The divisor-bounded coefficients use their separate $epsilon.alt_1$ share.
  Thus the diagonal exponent is $K + g - ell - s_0 + theta_N$, including when $a_0 - s_0$ is slightly negative.
  Subtracting the allowance in Equation (2.171) from its nominal part, without $epsilon.alt_G$, gives

#[#set math.equation(numbering: n => "(2.177)")
 $ & \( K + g - ell - s_0 \) - \( a_0 + tilde(q) + w_o + w + cal(B)_c - s_0 \)\
 & quad = \( A - M \) - d - \( K_0 - K \) - w_o - cal(B)_c + g - ell\
 & quad lt.eq A - M + 5 sigma \/ 3 + delta_(upright("fr") \, 1) . $ <old-eq:2.12>]

For the inequality, put $D_0 = d + K_0 - K$. The contribution $- D_0 - w_o +
  J_(+)$ is at most $delta_(upright("fr") \, 1)$: it is at most $- c - 2 w$ when $J gt.eq 0$,
  and when $J < 0$ use $D_0 gt.eq - delta_(upright("fr") \, 1)$.
  The largest remaining increment is $2 sigma - ell_(*) = 5 sigma \/ 3$ in the amplified main norm;
  the other norms have increment $sigma$. Thus the diagonal requires only the displayed terminal loss $5 sigma \/
  3$, plus the already reserved frequency perturbation $delta_(upright("fr") \, 1)$ and numerical support
  correction $theta_N$, when $A lt.eq M$, and an additional $delta$ in the padded zero-slot core.
  The $theta_N$ correction is included in the $C_(*) xi$ stage allowance.

For $j eq.not 0$, first perform the whole-dyad localization on this genuine full $\( u \, v \, j \)$ sum,
  before extracting any common support. The nominal scale is $T_2 = Z^(2 a_0 - K - g)$,
  and the kernel argument is at least $q_j \/ \( e^(2 H_N) T_(upright("sec")) \)$ for its supremum in the current
  Gauss sector. The tail estimate above applies using $\| F \( u \, v \; j \) \| lt.eq q_u q_v$,
  with the literal conditions $s divides u \, v$ still present. Write

$ Omega_(upright("ret")) \( q_j \) := sum_(lambda med upright("retained")) omega_lambda \( q_j \/ T_lambda \) . $

This common row weight satisfies $0 lt.eq Omega_(upright("ret")) lt.eq 1$.
  The full kernel in Equation (2.176) remains on every retained term.
  All subsequent signed Fourier separations are performed one retained $lambda$ at a time,
  so the normalized row variable stays on a fixed log box; $Omega_(upright("ret"))$ records their sum and common
  domain. There are $O \( log Z \)$ relevant retained dyads in the bounded polynomial ranges.
  The preceding $j = 0$ term is exactly the diagonal of the same final $Phi_2$ ball,
  including the previously added Gauss row zero; neither zero term is restored on a different domain.

Now write $u = D_2 a \, med v = E_2 b$, extracting the genuine complete common support, so that $\( a \, b \) =
  1$ and $\( a b \, D_2 E_2 \) = 1$. Allocate all extracted powers to the plain variables and slots as at the
  first transform. Lemma 44 applies on this genuine locus and gives

$ F \( D_2 a \, E_2 b \; j \) = F \( D_2 \, E_2 \; j \) cal(R) \( a \, E_2 \) overline(cal(R) \( b \, D_2 \))
  cal(R) \( a \, b \) chi_a \( j \) overline(chi_b \( - j \)) . $

It permits arbitrary prime powers in all four moduli and leaves a row scalar at the common primes.
  Every extracted prime punctures all remaining factors on its side, and every slot supplying that prime is frozen.

This also explains explicitly the cases where a slot shares a prime with a plain variable.
  If $p$ occurs only on one side, with full multiplicity $i$, its residual factor is $chi_p \( j \)^i$.
  Splitting $i$ among the two plain variables and the possible slot gives precisely the same factor by
  multiplicativity, including when $6 divides i$ and $p divides j$.
  For example, a plain $p^5$ and a slot $p$ give the zero-extended factor $chi_p \( j \)^6$.
  If $p$ occurs on both sides, its full powers are removed.
  In the unequal case $i > j_0 gt.eq 1$, the local correlation is zero unless $6 divides
  j_0$ and the frequency is $p^(j_0) k$ with $p divides.not k$; when it is nonzero it equals

$ P^(j_0 - 1) \( P - 1 \) chi_p \( k \)^(i - j_0) \, wide P = q_p . $

This is a row scalar, even if the excess valuation on the first side came partly from a live slot.
  For instance $i = 7 \, j_0 = 6$ with a plain $p^6$ and slot $p$ leaves the scalar $P^5 \( P - 1 \)
  chi_p \( k \)$, freezes that slot, and punctures both remaining plain variables at $p$.
  Equal multiplicities have the scalar factors in Equation (2.13) and the same puncture conclusion.
  Complete rather than gcd-only extraction is what makes these local factors independent of the residual variables.

Define

$ c_2 = log_Z q_(D_2) \, quad d_2 = log_Z q_(E_2) \, quad b_2 = \( c_2 + d_2 \) \/ 2 . $

Let $p_2$ be the logarithmic norm of their common radical, let $G_c = \( D_2 \, E_2 \)$, and put $g_2 =
  log_Z q_(G_c)$. The correlation vanishes unless $G_c divides j$.
  At a common prime with equal multiplicity $i equiv.not 0 med \( mod med 6 \)$,
  call the divided frequency $j \/ G_c$ a unit or nonunit according as that prime does not or does divide it.
  Let $t_2$ be the total radical length of these unit primes.
  Let $V_(upright("id"))$ be the product of these nonunit primes and put $V = log_Z q_(V_(upright("id")))$.

Equation (2.13) gives the following absolute local bounds:

$ upright("common multiplicities and divided frequency") & upright("absolute correlation bound")\
i = i \, med 6 divides.not i \, med upright("unit") & P^(i - 1)\
i = i \, med 6 divides.not i \, med upright("nonunit") & P^i\
i = i \, med 6 divides i \, med upright("either") & P^i\
i > j_0 \, med 6 divides j_0 \, med upright("unit") & P^(j_0) . $

Every unequal case not in the last line is zero. Fix the indicated unit/nonunit partition and write $j =
  G_c V_(upright("id")) h'$. The partitioned scalar

$ 1_(upright("part")) \( h' \) frac(F \( D_2 \, E_2 \; G_c V_(upright("id")) h' \), Z^(g_2 - t_2)) $

is defined to be zero off that partition and has modulus at most one everywhere with this definition.
  We do not assert the unit bound for the unpartitioned correlation on other rows.
  Every frozen allocation forced to be zero by the old masks is still discarded before this absolute bound is used.

The complete-support identity leaves the row factor $chi_n \( G_c V_(upright("id")) h' \)$ on each whole residual
  column. To count its fixed moving support, put $v = G_c V_(upright("id"))$ and $e_p = v_p \( v \) med mod med
  6$. Products of the canonical primary generators of these good ideals are primary, so the exact all-input identity is

$ chi_n \( v \) = product_(p divides v\
e_p eq.not 0) chi_n \( p \)^(e_p) product_(p divides v\
e_p = 0) 1_(\( n \, p \) = 1) \, $

with any unit of the original row retained in $h'$. All primes in this identity already puncture every residual
  factor, because they are in the genuine extracted support.
  The active $e_p eq.not 0$ primes are contained in the unit set counted by $t_2$ and the nonunit set counted by
  $V$. Equal six-divisible and unequal-minimum-six-divisible primes have $e_p =
  0$ and are represented solely by the common puncture in this fixed factor.
  A nonunit prime can also have $e_p = 0$, in which case counting it in $V$ only enlarges the bound.
  This factors only $chi_n \( v \)$: the natural row factor $chi_n \( h' \)$, with all its zeros,
  and all fixed-ray reciprocity phases remain. It does not reclassify a cancellation with the varying row as an
  extra puncture. Thus the full new moving support has length at most $tilde(q) + w_o + t_2 + V$.

Define the nominal row and total widths by

#[#set math.equation(numbering: n => "(2.178)")
 $ m' & = 2 a_0 - K - g - g_2 - V \, & q' & = tilde(q) + w_o + t_2 + V \,\
M' & = m' + q' = M + J - g - g_2 + t_2 lt.eq M - sigma . $ <old-eq:2.13>]

Here $g_2 gt.eq t_2$, and the definitions of $g$ give $g - J gt.eq sigma$.
  The identities follow by substituting $a_0 = A - c - w$ and the definition of $K_0$ preceding Equation (2.168). Put

$ 0 lt.eq delta_(upright("fr") \, 2) := xi / 2 + frac(log \( C_d C_(upright("sec")) \), log Z) < xi . $

The sector constants here are those for the second transform.
  The retained row weight pulls back exactly to $Omega_(upright("ret")) \( q_(G_c V_(upright("id"))) q_(h') \)$.
  On its support,

$ q_(h') lt.eq frac(C_d T_(upright("sec")) Z^(xi \/ 2), q_(G_c V_(upright("id")))) lt.eq
  frac(C_d C_(upright("sec")) Z^(2 a_0 - K - g + xi \/ 2), q_(G_c V_(upright("id")))) =
  Z^(m' + delta_(upright("fr") \, 2)) . $

Thus it lies in that common enclosing row ball. On a nonempty retained range define the declared nonnegative row
  length $m'_(upright("act")) = max { 0 \, m' + delta_(upright("fr") \, 2) }$ and $M'_(upright("act")) =
  m'_(upright("act")) + q'$. Nonemptiness implies $m' + delta_(upright("fr") \, 2) gt.eq 0$, so $0 lt.eq
  M'_(upright("act")) - M' lt.eq delta_(upright("fr") \, 2)$.
  Regard the pulled-back weight as zero on the rest of this enclosing ball throughout the signed calculation,
  and do the same for the partitioned scalar. This is an exact extension by zero.
  They will be replaced by their absolute bounds only after a nonnegative child norm or an exceptional absolute
  product has been formed. Complete extraction only shortens a plain variable or freezes an entire slot,
  so the surviving slot length satisfies $z' lt.eq z$.

We record every other exponent in this second transformation.
  The condition $s divides u \, v$ has not been dropped: it implies that every prime of $s$ is in the second
  complete common radical. Thus after the complete extraction there is no remaining $s$-divisibility condition on
  the residual columns. The number of possible radicals of length $p_2$, for this fixed $s$,
  is $O \( Z^(p_2 - s_0 + epsilon.alt_1) \)$: write that radical as $s frak(r)_2$ with $\( s \, frak(r)_2 \) = 1$,
  and count the squarefree $frak(r)_2$ of the remaining norm.
  If $p_2 < s_0$ outside the fixed shell boundary, there are none.
  The same Rankin argument used for $C \, D$ bounds their power and allocation multiplicities.
  Choosing the unit/nonunit partition costs at most $2^(omega \( "rad" \( D_2 E_2 \) \))$,
  another divisor-bounded factor included in $epsilon.alt_1$. The exponents are

$ upright("factor") & upright("exponent")\
upright("squared central normalization") & - a_0\
upright("row Poisson factor and normalized inverse roots") & K + g - a_0\
upright("prime density, when present") & - ell\
upright("common-support count with fixed ") s & p_2 - s_0\
upright("common correlation") & g_2 - t_2\
upright("conversion to normalized residual products") & a_0 - b_2 $

The last line is ${ \( a_0 - c_2 \) + \( a_0 - d_2 \) } \/ 2$. Their sum is

$ K + g - ell - a_0 + p_2 - s_0 + g_2 - t_2 - b_2 . $

Subtracting this sum from the allowance Equation (2.171) leaves the exponent permitted for the inner plain
  products. This is the bound to be supplied either by smaller-width moments or by the exceptional-row estimate:

#[#set math.equation(numbering: n => "(2.179)")
 $ M' + Delta_(upright("child")) \, wide Delta_(upright("child")) = b_2 - p_2 + w + cal(B)_c + ell gt.eq w +
   ell . $ <old-eq:2.14>]

The inequality uses $b_2 gt.eq p_2$, since both multiplicities at each common prime are at least one.

We now remove the residual coprimality before forming independent children. For the fixed genuine $D_2 \, E_2$, define

$ tilde(F)_(D_2 \, E_2) \( a \, b \; j \) := F \( D_2 \, E_2 \; j \) cal(R) \( a \, E_2 \)
  overline(cal(R) \( b \, D_2 \)) cal(R) \( a \, b \) chi_a \( j \) overline(chi_b \( - j \)) $

on all residual pairs individually coprime to $D_2 E_2$ and allowed by the old masks.
  It equals the genuine correlation only when $\( a \, b \) = 1$.
  Define the remaining $cal(C)_2 \( a \, b \; j \)$ on all individually allowed residual pairs by the allocated
  convolution formulas and the old common masks, including $\( a b \, D_2 E_2 \) = 1$.
  Keep the formal full-product norms $q_(D_2) q_a \, q_(E_2) q_b$, both inverse roots, the full smooth kernel,
  and the same pulled-back row weight extended by zero on its enclosing ball.
  For each retained row the exact identity is

$ sum_(\( a \, b \) = 1) cal(C)_2 \( a \, b \; j \) F \( D_2 a \, E_2 b \; j \) & =
  sum_(frak(t) med upright("squarefree")) mu \( frak(t) \) sum_(frak(t) divides a \, b) cal(C)_2 \( a \, b \; j \)
  tilde(F)_(D_2 \, E_2) \( a \, b \; j \) . $

This is the full Möbius indicator, not a truncation. The individual column shells and the retained row ball are
  finite. Its equality therefore follows by interchanging finite sums and using the genuine correlation identity
  only when $\( a \, b \) = 1$. Extra common primes of $frak(t)$ are not part of the genuine $D_2 \,
  E_2$ support or of its frequency restrictions. Since the residual masks already exclude that support,
  every nonzero $frak(t)$ is disjoint from it and from $s$.

On each retained dyad, separate the full kernel and inverse roots in the normalized $h'$ norm and the two
  whole-product norms, as for the first transform. The frozen factor $G_c
  V_(upright("id"))$ contributes only an outer phase to the row Fourier power.
  The fixed support boxes are chosen before the current live labels,
  so the resulting coefficient measure is common to them, to both rectangles, and to the row. Then fix $frak(t)$.
  For each of its primes $p$, use the exact factor-allocation identity

$ 1_(p divides product_i n_i) = sum_(diameter eq.not J) \( - 1 \)^(\| J \| + 1) product_(i in J) 1_(p divides n_i) \, $

where the factors $n_i$ are the two plain variables and the live slots.
  For a selected plain variable write $n_i = p l_i$, with no restriction on $l_i$.
  This extracts only a row scalar and $q_p^(i t)$, and replaces both $X_i \, Y_i$ by $X_i \/ q_p \, Y_i \/ q_p$.
  It introduces no one-variable puncture. A selected slot is frozen.
  If two distinct divisor primes select the same prime slot, the term is zero.
  The quotients and unselected factors may still contain $p$, and may overlap the opposite side;
  no new coprimality is imposed. Old common masks remain common,
  and the product of the two new plain scales is equal in the two rectangles.
  The extracted row scalars, including zero scalars, are retained in the signed identity.

Only now, for a fixed retained dyad and fixed Fourier parameters,
  is each separated summand a product of two independent residual convolutions,
  where $upright(bold(J))$ records the factor allocations. Their row characters are

$ tau_1 \( n \) rho \( n \) chi_n \( G_c V_(upright("id")) h' \) \, wide
  tau_1 \( n \) rho' \( n \) chi_n \( - G_c V_(upright("id")) h' \) \, quad rho \, rho' in Theta . $

They are understood with the fixed-factor support representation above.
  In particular their inducing-character ratio belongs to $Theta$,
  including the supplementary factor $n mapsto chi_n \( - 1 \)$; this assertion takes no quotient at a zero.
  Their natural row zeros are retained. Extracting the selected factors contributes row scalars,
  not new factors of the residual character and not new support in $q'$.
  These scalars, including zeros, remain in the signed identity.

#thm([Lemma 2.20.])[
  (Common coefficient under complete extraction).  #emph[For a centered input,
    the two transforms and the intervening Gauss-row enlargement just constructed preserve the following
    coefficient data. Each Gauss polynomial and each amplifier error retains Equation (2.164),
    multiplied by $G \( u \, h \)$, apart from bounded frozen scalars and row scalars of modulus at most one.
    For an uncentered input, omit the second rectangle throughout.
    After the second transform and the full Möbius factor allocation,
    each separated child side has that coefficient form without $G$ and without $s divides u$.
    Every surviving slot has the child’s one whole-product character and its original coefficient $nu_i$,
    with no Gauss coefficient. Within a side the plain variables have the same character, puncture mask,
    and norm power in both rectangles. The two sides of one squared Gauss norm may have different norm powers;
    their inducing characters differ by a member of $Theta$.]
  #emph[If the new inducing character belongs to $Theta$, fixing the live slot labels leaves the plain coefficient
$ theta.alt \( l_1 \) theta.alt \( l_2 \) 1_(\( l_1 l_2 \, frak(R)_(*) \) = 1) q_(l_1 l_2)^(i t)
  D_(upright(bold(b))) \( l_1 \, l_2 \) $

 for one $theta.alt in Theta$, one squarefree mask $frak(R)_(*)$ of polynomial norm, and one real $t$.
   The mask may depend on the frozen row, but is common to both variables and both rectangles.
   All coefficients are understood with their retained frozen scalars, including zeros,
   and the exact normalizations recorded below.]
] <lem:centered-coefficient-invariant>

#proof[
  The first-transform calculation proved the Gauss coefficient form;
    the local $p$-power calculation proved it for each amplifier error.
    The genuine complete-support identity and the full Möbius allocation above proved the child form,
    preserving one character and norm power on each whole residual product.
    Thus “common” concerns one separated side; the displayed character ratio is the relation between the two
    sides. When the inducing character belongs to $Theta$, it equals some $theta.alt in Theta$ on units.
    Its redundant natural zeros and the fixed punctures combine into one $frak(R)_(*)$ of polynomial norm.
    For each fixed $Pi$, multiplicativity factors its value, mask,
    and norm power on $Pi l_1 l_2$ into a scalar in $Pi$ times the three factors stated in the conclusion.
    This proves the exceptional assertion. ◻
]

We next record the exact normalization of the two residual convolutions. Put

$ alpha_1 = a_0 - c_2 \, wide alpha_2 = a_0 - d_2 \, wide frac(alpha_1 + alpha_2, 2) = a_0 - b_2 . $

At the entrance to the current two-transform stage, let $cal(I)_(upright("in"))$ be its live slot set and let
  $X_1 \, X_2$ be the formal scales of its first rectangle.
  Their exact convention is $X_1 X_2 product_(i in cal(I)_(upright("in"))) P_i = Z^A$.
  For side $j in { 1 \, 2 }$, let $cal(F)_j$ be the slots from this entrance set frozen by the first and second
  genuine common-support extractions, let $cal(I)_j$ be the slots still live before the final
  $frak(t)$-allocation, and let $Q_(upright("plain") \, j)$ be the product of the exact norms of the plain powers
  extracted at those steps and at the amplifier. Slots removed in an ancestor stage are not included in
  $cal(F)_j$. Let $T_j$ be the common formal pre-$frak(t)$ product of the two plain scales in its rectangles;
  for an uncentered input use its one formal plain product.
  Before using slot ratios, discard a frozen-slot profile-zero term,
  which is identically zero by its frozen data independently of the row and live labels.
  Complete extraction gives the exact identities

$ Z^(A - alpha_j) & = Q_(upright("plain") \, j) product_(i in cal(F)_j) q_(p_i) \,\
T_j product_(i in cal(I)_j) P_i & = frac(Z^A, Q_(upright("plain") \, j) product_(i in cal(F)_j) P_i) =
  Z^(alpha_j + e_j) \,\
e_j & = sum_(i in cal(F)_j) log_Z \( q_(p_i) \/ P_i \) \, wide \| e_j \| lt.eq theta_N . $

The amplifier contributes only exact plain powers to this calculation.
  Each earlier frozen slot occurs once, even if it shared its prime with a plain.
  The already separated inverse roots, kernel, and fixed normalization constants remain outside $e_j$.

For side $j$, let $d_(j \, i)$ be the product of final $frak(t)$-primes selected in plain $i$,
  and let $cal(J)_j subset.eq cal(I)_j$ be the newly frozen slots. Put

$ a_(j \, i) = log_Z q_(d_(j \, i)) \, wide tilde(r)_j = a_(j \, 1) + a_(j \, 2) + sum_(i in cal(J)_j) z_i gt.eq
  0 \, wide omega_j = sum_(i in cal(J)_j) log_Z \( q_(p_i) \/ P_i \) . $

The corresponding formal scale is divided by $q_(d_(j \, i))$ in both rectangles.
  An assignment selecting one prime slot at two distinct $frak(t)$-primes,
  or a newly frozen slot with zero profile value, is identically zero from the frozen data and is discarded before
  these ratio bounds are used. All other extracted zeros remain until the nonnegative or absolute estimate
  described below.

Use lower-endpoint divisor dyads $T lt.eq q_(frak(t)) < 2 T$, $T gt.eq 1$, and put $t_(-) := log_Z T$.
  Each dyad contains $O \( Z^(t_(-)) \)$ ideals. The actual selected product on side $j$ is divisible by $frak(t)$, so

#[#set math.equation(numbering: n => "(2.180)")
 $ tilde(r)_j + omega_j & = log_Z (q_(d_(j \, 1) d_(j \, 2)) product_(i in cal(J)_j) q_(p_i)) gt.eq
   log_Z q_(frak(t)) gt.eq t_(-) \,\
\| omega_j \| & lt.eq theta_N \, wide \| e_j + omega_j \| lt.eq
  theta_N quad \( j = 1 \, 2 \) . $ <eq:centered-divisor-boundary>]

The last inequality uses the disjoint subsets $cal(F)_j$ and $cal(J)_j$ of the current stage entrance slots.
  It does not include ancestor slots or fixed separation constants.

Writing $T'_j = T_j \/ q_(d_(j \, 1) d_(j \, 2))$, the post formal factor product and the nominal raw child scale are

#[#set math.equation(numbering: n => "(2.181)")
 $ T'_j product_(i in cal(I)_j \\ cal(J)_j) P_i = Z^(alpha_j + e_j - tilde(r)_j) \, wide
   N_(upright("post") \, j) = Z^(alpha_j - tilde(r)_j) . $ <eq:centered-raw-normalization>]

Define $P_(C \, frak(t) \, upright(bold(J))) \( h' \)$ and $P_(D \, frak(t) \, upright(bold(J))) \( h' \)$ to be
  their residual convolutions multiplied by $N_(upright("post") \, j)^(- 1 \/ 2)$.
  Relative to the nominal pre-normalizer $Z^(- alpha_j \/ 2)$,
  the exact extraction coefficient on side $j$ is $Z^(- tilde(r)_j \/ 2)$, apart from the frozen slot amplitudes,
  retained extracted row scalars, and already separated outer factors.
  These raw children retain the formal signed rectangles and are not moment-lemma invocations;
  their formal logarithmic lengths may be negative. No clipping has occurred.

The factor assignments are divisor-bounded for fixed $N$;
  their total is bounded using $C_N^(omega \( frak(t) \)) lt.double_(N \, a) q_(frak(t))^a$ for any fixed $a > 0$,
  not by spending a fixed exponent at each prime. The $O \( log Z \)$ divisor dyads in the bounded column range
  use their existing logarithmic share. These discrete losses are separate from the numerical $theta_N$ terms.

For precision, the other common row scalar after extracting $Z^(g_2 - t_2)$ is

$ v_(upright("part") \, lambda) \( h' \) = omega_lambda \( q_(G_c V_(upright("id"))) q_(h') \/ T_lambda \)
  1_(upright("part")) \( h' \) frac(F \( D_2 \, E_2 \; G_c V_(upright("id")) h' \), Z^(g_2 - t_2))
  zeta \( h' \) \, wide \| zeta \( h' \) \| lt.eq 1 \, $

where $zeta$ contains the separated row phases for this dyad and these Fourier parameters.
  It is zero off the retained partition and enclosing ball, and $\| v_(upright("part") \, lambda) \| lt.eq 1$.
  The subsequent estimates are made dyad by dyad and then summed with the already allowed $O \( log Z \)$ mass.
  Split the already factorized row sum according to membership of the inducing character in $Theta$.
  On rows outside $Theta$, Cauchy–Schwarz yields two nonnegative child norms; on rows in $Theta$,
  take a pointwise absolute product. Only at these steps may the absolute values of the common row weight,
  partition scalar, or extracted row scalars be bounded by one and the rows enlarged to the common
  $m'_(upright("act"))$ ball. This can admit extra exceptional rows that violate a former unit restriction,
  but the character-only count below includes them. Both sides use the same eligibility class and compare with
  Equation (2.179).

Consider first rows whose child inducing character is outside $Theta$.
  The two sides have the same eligibility condition because their characters differ by a member of $Theta$.
  On such rows, first bound a centered child norm by the sum of the norms of its two rectangles;
  for an uncentered child there is one rectangle. For one fixed side $j$ and rectangle $𝜚$,
  write its pre and post formal plain scales as $S_(𝜚 \, i)$ and $S'_(𝜚 \, i) = S_(𝜚 \, i) \/ q_(d_(j \, i))$.
  Choose a fixed upper support endpoint $B_i$ for each current plain profile type before the current row, divisor,
  and live labels. Omit a rectangle only when $S'_(𝜚 \, i) B_i < 1$ for some $i$;
  then that plain factor is zero on every nonzero integral ideal.
  Retain equality and every other profile, mask, row-scalar, or arithmetic zero.
  This test is independent of the row and live labels.

For a retained rectangle put $x_i = log_Z S_(𝜚 \, i)$ and $y_i = x_i - a_(j \, i)$.
  The fixed endpoint test and $a_(j \, i) gt.eq 0$, with $H_N$ enlarged to contain the two positive parts of the
  upper endpoint logs, give the exact clipped identities

#[#set math.equation(numbering: n => "(2.182)")
 $ pi_(0 \, j \, 𝜚) & = sum_(i = 1)^2 \( - x_i \)_(+) \, wide pi_(j \, 𝜚) = sum_(i = 1)^2 \( - y_i \)_(+) \, wide
   0 lt.eq pi_(0 \, j \, 𝜚) lt.eq pi_(j \, 𝜚) lt.eq theta_N \,\
r_(upright("clip") \, j \, 𝜚) & = sum_(i in cal(J)_j) z_i +
  sum_(i = 1)^2 #scale(x: 120%, y: 120%)[\(] \( x_i \)_(+) - \( y_i \)_(+) #scale(x: 120%, y: 120%)[\)] =
  tilde(r)_j - \( pi_(j \, 𝜚) - pi_(0 \, j \, 𝜚) \) gt.eq 0 \,\
A_(upright("clip") \, j \, 𝜚) & = sum_(i = 1)^2 \( y_i \)_(+) + sum_(i in cal(I)_j \\ cal(J)_j) z_i = alpha_j +
  e_j - tilde(r)_j + pi_(j \, 𝜚)\
 & = alpha_j + e_j + pi_(0 \, j \, 𝜚) - r_(upright("clip") \, j \, 𝜚) . $ <eq:centered-clipped-rectangle>]

In particular the clipped total decreases by $r_(upright("clip") \, j \, 𝜚)$ from its own pre-clipped total
  $alpha_j + e_j + pi_(0 \, j \, 𝜚)$. Different rectangles can have different clipped totals.
  A retained subunit scale lies in the fixed interval $\[ 1 \/ B_i \, 1 \]$,
  so its dilation to scale one preserves finite seminorm bounds.
  The row character, common mask, and surviving slot weights are unchanged.
  The exact coefficient from the pre-normalizer $Z^(- alpha_j \/ 2)$ to this standard clipped product is

$ Z^(\( A_(upright("clip") \, j \, 𝜚) - alpha_j \) \/ 2) =
  Z^(\( - r_(upright("clip") \, j \, 𝜚) + e_j + pi_(0 \, j \, 𝜚) \) \/ 2) . $

For a fixed pair of retained rectangles, suppress their rectangle indices.
  Equation (2.180) then bounds the paired divisor count and these coefficients by

#[#set math.equation(numbering: n => "(2.183)")
 $ t_(-) - frac(r_(upright("clip") \, 1) + r_(upright("clip") \, 2), 2) +
   frac(e_1 + pi_(0 \, 1) + e_2 + pi_(0 \, 2), 2) & lt.eq
   frac(\( e_1 + omega_1 \) + pi_1 + \( e_2 + omega_2 \) + pi_2, 2)\
 & lt.eq 2 theta_N . $ <eq:centered-clipped-shell>]

There are at most two rectangles per side, hence at most four such pairs; their triangle factor is fixed.
  No common clipped reduction is used for the signed difference.

On the $c_2$ side, before the last coprimality extraction, the nominal total length is $A' = alpha_1 = A - c - w -
  c_2$. For the positive-slot parameters,

#[#set math.equation(numbering: n => "(2.184)")
 $ \( A' - M' \) - \( A - M \) & = g + w - d - c_2 - \( K_0 - K \) - w_o + g_2 - t_2\
 & lt.eq 6 \( w + ell \) + delta_(upright("fr") \, 1) . $ <old-eq:3.14>]

To prove the inequality, first use $g_2 - t_2 lt.eq c_2$. In the amplified main norm, $w = w_o = 0$ and

$ g = J_(+) + 2 sigma lt.eq d + \( K_0 - K \) + 6 ell + delta_(upright("fr") \, 1) . $

For an error, $g lt.eq d + \( K_0 - K \) + sigma + delta_(upright("fr") \, 1)$, so the excess is at most $w -
  w_o + sigma + delta_(upright("fr") \, 1)$. These inequalities use $d + K_0 - K gt.eq -
  delta_(upright("fr") \, 1)$ and the $1$-Lipschitz property of the positive part.
  The three choices in Equation (2.174), together with $ell_p gt.eq sigma \/ 6$, give $w - w_o + sigma lt.eq 6 w$.
  This proves Equation (2.184).

For each retained clipped rectangle, if no slot survives,
  apply the completed unrestricted zero-slot assertion at the declared width $M'_(upright("act"))$.
  If slots survive, first apply the algebraic mask deletion in Equations (2.151)–(2.152).
  It expresses this standard clipped product as natural products and only decreases its nonnegative affine
  expression. For each actual product, after both frequency enclosures, the $frak(t)$-allocation,
  and mask deletion, let $A_(upright("act")) \, z_(upright("act"))$ be its declared total and slot lengths and put

$ F_(upright("act")) = #scale(x: 120%, y: 120%)[\(] A_(upright("act")) -
  M'_(upright("act")) + \( 6 kappa - 1 \) z_(upright("act")) #scale(x: 120%, y: 120%)[\)]_(+) . $

The parent satisfies Equation (2.150). Before this mask deletion, let $z' lt.eq
  z$ be the surviving slot length of the clipped rectangle.
  Equations (2.184) and (2.182), together with $M'_(upright("act")) gt.eq M'$, give

$ A_(upright("clip") \, j \, 𝜚) - M'_(upright("act")) + \( 6 kappa - 1 \) z' & lt.eq alpha_j -
  M' + \( 6 kappa - 1 \) z + e_j + pi_(j \, 𝜚) - tilde(r)_j - \( M'_(upright("act")) - M' \)\
 & lt.eq 6 \( w + ell \) + delta_(upright("fr") \, 1) + e_j + pi_(j \, 𝜚) . $

The same calculation holds on the other side with $c_2 \, d_2$ exchanged.
  Taking the positive part and then deleting the fixed mask therefore gives

$ F_(upright("act")) lt.eq 6 \( w + ell \) + delta_(upright("fr") \, 1) + \( e_j + pi_(j \, 𝜚) \)_(+) lt.eq
  6 \( w + ell \) + delta_(upright("fr") \, 1) + 2 theta_N . $

Here $z_(upright("act")) lt.eq z' lt.eq z$. All the displayed ledgers use the fixed list of aggregate lengths

$ A \, z \, c \, d \, p \, R \, E \, s_0 \, K \, w \, w_o \, g \, ell \, c_2 \, d_2 \, p_2 \, g_2 \, t_2 \, V . $

Their affine coefficients and positive-part Lipschitz constants are numerical and independent of $N$.
  The displayed frequency, raw normalization, and rectangle-clipping bounds are therefore included in $C_(*) xi$,
  for a fixed $C_(*) gt.eq 1$ independent of $N$, once the aggregate threshold has been imposed.
  The existence of this fixed error bound uses the single $theta_N = H_N \/ log Z$ before comparing lengths,
  not $N$ separate copies of $xi$. We enlarge $C_(*)$ below to cover the fixed number of operations in a stage.

If $F_(upright("act")) > 0$, remove whole slots from this product until the remaining product satisfies
  Equation (2.150) or until no slot remains. Removal here means applying the pointwise bound Equation (2.158) to
  the entire selected prime polynomial; no prime label is frozen.
  A removed slot of length $d$ decreases $A_(upright("act")) + \( 6 kappa - 1 \) z_(upright("act"))$ by $6 kappa
  d$ and contributes $kappa d$ to the squared $Z$-exponent,
  with the fixed seminorm and height factor retained separately.
  Since each slot has length at most $eta$, order the positive live lengths and take the first prefix reaching
  $F_(upright("act")) \/ \( 6 kappa \)$. Its preceding prefix is smaller than that threshold and its final slot
  has length at most $eta$. If no prefix reaches the threshold, remove all slots, whose total is smaller.
  Thus exactly one slot can cause an overshoot, and the total removed length $d_z$ satisfies

#[#set math.equation(numbering: n => "(2.185)")
 $ d_z & lt.eq min {z_(upright("act")) \, frac(F_(upright("act")), 6 kappa) + eta} \,\
kappa d_z & lt.eq F_(upright("act")) / 6 + kappa eta lt.eq Delta_(upright("child")) + delta_(upright("fr") \, 1) /
  6 + theta_N / 3 + eta . $ <old-eq:3.16>]

If the slots disappear before the affine boundary is reached, the remaining plain lengths may be arbitrary;
  this is exactly why the completed smaller-width zero-slot assertion includes all lengths.
  Otherwise apply the positive-slot induction to the remaining product.
  Its slots still have their original coefficient class, and its inducing rows remain outside $Theta$.
  Cauchy–Schwarz averages the errors of the two separately clipped children,
  so their possibly different rectangles and slot sets do not double $eta$.
  Combining Equation (2.185) with the paired coefficient bound in Equation (2.183) and $M'_(upright("act")) -
  M' lt.eq delta_(upright("fr") \, 2)$, the strict-edge scale cost beyond the child envelope is at most

#[#set math.equation(numbering: n => "(2.186)")
 $ delta_(upright("fr") \, 2) + delta_(upright("fr") \, 1) / 6 + eta +
   frac(7 theta_N, 3) . $ <eq:centered-child-edge-cost>]

If no slot survives, the same bound holds without needing a greedy cost.
  The numerical $theta_N$ terms and the two frequency corrections give the single $O \( xi + eta \)$ edge loss in
  the $epsilon.alt_G$ reserve inherited from Equation (2.171) when using Equation (2.179);
  the existing local small-power and fixed analytic factors remain separate.
  The pointwise estimate is requested once for the entire removed product;
  its internal small-power shares may depend on $N$. This one greedy operation occurs only after all boundary
  defects of the actual child have been included in $F_(upright("act"))$.
  The argument for the $d_2$ side is the same with $c_2 \, d_2$ exchanged.

We have now bounded all child rows whose inducing characters lie outside $Theta$ using only smaller widths.
  For the remaining rows, the next count and volume bound handle the uncentered range;
  the centered range uses the subtraction retained in the coefficient lemma.

===== 2.7.7 Rows with inducing characters in $Theta$ <rows-with-inducing-characters-in-theta>

For this subsection, call a child row #emph[exceptional] when its inducing character belongs to $Theta$.
  By the coefficient lemma, either both separated sides are exceptional or neither is.
  Every prime in the existing full displayed moving support is a common column zero,
  as is every extra common puncture. This is true initially, remains true for $frak(e) \,
  frak(r)$ in the first transform, and remains true for an amplifier prime.
  For a nonzero genuine second allocation, the factors $tau_1 \( D_2 \) \,
  tau_1 \( E_2 \)$ and the old common masks therefore force its complete radical to be disjoint from all those
  supports. This conclusion is made before replacing any frozen scalar by an upper bound.
  The artificial residual extension keeps $D_2 \, E_2$ and those masks fixed and cannot revive an impossible allocation.

We make explicit the finite-ray reduction for row factors at the fixed primes.
  As in Equation (1.9), write a nonzero row as $h' = epsilon h_(cal(S)) h_(upright("good"))$,
  with $epsilon$ a unit and the two other factors supported on $cal(S)$ and its complement.
  For a primary element $n$ prime to $cal(S)$, reciprocity gives, with every zero retained,

$ chi_n \( h' \) = chi_n \( epsilon h_(cal(S)) \) cal(R) \( n \, h_(upright("good")) \)
  product_(p divides h_(upright("good"))) chi_p \( n \)^(v_p \( h' \)) . $

By Lemma 5, the first factor belongs to a finite family of ray characters supported on $cal(S)$ after the unit and
  the $cal(S)$-valuations modulo six are fixed. The second belongs to the fixed reciprocity family after fixing
  the good ray sector. We do not absorb any moving good prime into this fixed family.
  The family supplied by the first factor need not be contained in $Theta$;
  there are simply finitely many such choices. Every remaining displayed good-prime factor has its actual local
  sextic exponent, with nontrivial exponents ramified at that prime.

Let $v_1$ be the radical length of the primes counted in $V$ whose equal multiplicity is one, and put $f = 2 v_1$.
  At such a prime the fixed factor $G_c V_(upright("id"))$ in the row has valuation two.
  There is no existing moving character at that prime, and every character of $Theta$ is unramified there.
  Sextic reciprocity therefore shows that exceptional induction requires

$ v_p \( h' \) + 2 equiv 0 med \( mod med 6 \) \, wide upright("that is,") wide v_p \( h' \) equiv
  4 med \( mod med 6 \) . $

More generally, at every prime outside $cal(S)$, exceptional induction prescribes a single residue class modulo
  six for $v_p \( h' \)$, determined by the frozen moving character and $G_c V_(upright("id"))$.
  Outside their supports that residue is zero. For each of the finitely many choices at $cal(S)$ and of unit and
  fixed-ray data, the ideal of $h'$ consequently has a unique form

$ \( h' \) = frak(h)_0 frak(v)^6 \, $

where $frak(h)_0$ is fixed and sixth-power-free. The displayed valuation-four conditions give $q_(frak(h)_0) gt.eq
  Z^(4 v_1) = Z^(2 f)$. Ideal counting up to $q_(h') lt.double
  Z^(m'_(upright("act")))$ now gives the stronger bound
  $O \( Z^(\( m'_(upright("act")) - 2 f \) \/ 6 + epsilon.alt_1) \)$ on every nonempty range,
  with the usual bounded-scale convention. We use only the weaker bound

#[#set math.equation(numbering: n => "(2.187)")
 $ \# { h' : q_(h') lt.double Z^(m'_(upright("act"))) \, med
   upright("exceptional") } lt.double Z^(\( m'_(upright("act")) - f \) \/ 6 + epsilon.alt_1) lt.eq
   Z^(\( m' - f \) \/ 6 + delta_(upright("fr") \, 2) \/ 6 + epsilon.alt_1) . $ <eq:exceptional-row-count>]

If the exponent would describe a scale below one, the forced ideal $frak(h)_0$ makes the range empty except at the
  same bounded-scale boundary. This argument includes the principal character and every other member of $Theta$.
  Additional conditions at old moving primes can only reduce the count.
  It also covers rows admitted when the partition scalar was bounded after positivity.
  At a unit prime, such an added row can be exceptional even though it was absent from the original partition;
  no extra forcing saving from the unit set $t_2$ is used.

On exceptional rows take the absolute product for each already allocated pair of children and multiply by
  Equation (2.187). Let $c_(frak(t) \, upright(bold(J))) \( h' \)$ denote its central extraction coefficient and
  bounded extracted scalars. For an allocation with raw reductions $tilde(r)_1 \, tilde(r)_2$,
  $\| c_(frak(t) \, upright(bold(J))) \( h' \) \| lt.double_N
  Z^(- \( tilde(r)_1 + tilde(r)_2 \) \/ 2)$ after taking absolute values.
  Using absolute volume rather than cancellation, the unnormalized plain difference on side $j$ is $O \( T'_j \)$
  at every positive formal scale, including subunit scales,
  and the unnormalized live slots contribute $O_N \( product_(i in cal(I)_j \\ cal(J)_j) P_i \)$.
  Equation (2.181) therefore gives the raw normalized volume

$ \| P_(j \, frak(t) \, upright(bold(J))) \( h' \) \| lt.double_N N_(upright("post") \, j)^(- 1 \/ 2) T'_j
  product_(i in cal(I)_j \\ cal(J)_j) P_i = Z^(\( alpha_j - tilde(r)_j \) \/ 2 + e_j) $

up to the fixed seminorm and height factors, where $j$ denotes its $C$ or $D$ side.
  Thus the exponent for an allocated pair and one lower-endpoint divisor dyad, including its count, is

$ a_0 - b_2 + e_1 + e_2 + t_(-) - tilde(r)_1 - tilde(r)_2 lt.eq a_0 - b_2 + e_1 + \( e_2 + omega_2 \) lt.eq a_0 -
  b_2 + 2 theta_N . $

Here Equation (2.180) gives $t_(-) - tilde(r)_2 lt.eq omega_2$, and $tilde(r)_1 gt.eq 0$. Consequently

$ sum_(frak(t) \, upright(bold(J))) \| c_(frak(t) \, upright(bold(J))) \( h' \) \| \|
  P_(C \, frak(t) \, upright(bold(J))) \( h' \) P_(D \, frak(t) \, upright(bold(J))) \( h' \) \| lt.double
  Z^(a_0 - b_2 + 2 theta_N + epsilon.alt_1) . $

The displayed sum is over a fixed lower-endpoint divisor dyad;
  its allocations have already been included in $epsilon.alt_1$.
  It does not assert an independent product before Möbius allocation.
  Subtracting the inner allowance from the reference volume and the nominal exceptional count gives the exact
  algebraic identity

#[#set math.equation(numbering: n => "(2.188)")
 $ frac(m' - f, 6) + a_0 - b_2 - \( M' + Delta_(upright("child")) \) = A - 5 / 6 M - F_1 - F_2 \, $ <old-eq:2.15>]

where

#[#set math.equation(numbering: n => "(2.189)")
 $ F_1 & = c \/ 6 + 5 { d + \( K_0 - K \) } \/ 6 + w \/ 3 + tilde(q) \/ 6 + w_o + cal(B)_c - 5 g \/ 6 + ell \,\
F_2 & = 2 b_2 - 5 / 6 g_2 - p_2 + t_2 + V \/ 6 + f \/ 6 . $ <old-eq:2.16>]

The actual excess is bounded by the nominal expression in Equation (2.188) plus $delta_(upright("fr") \, 2) \/ 6 +
  2 theta_N + epsilon.alt_1$. For an explicit check, the left side of Equation (2.188) first equals

$ a_0 - 2 b_2 + p_2 - w - cal(B)_c - ell - 5 / 6 m' - q' - f \/ 6 . $

Substitution of Equation (2.178) and $K = 2 A - c - d + R + E - m - \( K_0 - K \)$ gives Equations (2.188)–(2.189).

The following lower bounds are the reason complete common supports do not consume the available exponent:

#[#set math.equation(numbering: n => "(2.190)")
 $ F_1 gt.eq 2 / 3 \( c + w \) - 3 sigma - 5 / 6 delta_(upright("fr") \, 1) \, wide F_2 gt.eq 2 /
   3 b_2 . $ <old-eq:2.17>]

To prove the first, put $D_0 = d + K_0 - K$, initially set $g = J_(+)$ and $ell = 0$, and recall $J = D_0 - c -
  2 w + w_o$. When $J gt.eq 0$, direct simplification gives

$ F_1 = c + 2 w + tilde(q) \/ 6 + w_o \/ 6 + cal(B)_c gt.eq c + 2 w . $

When $J < 0$, use $tilde(q) gt.eq R$ and

$ cal(B)_c + tilde(q) \/ 6 gt.eq \( 3 c - 5 D_0 \)_(+) \/ 6 - 5 / 6 delta_(upright("fr") \, 1) . $

Indeed, the left side is at least ${ \( 3 c - 5 d - R \)_(+) + R } \/ 6$,
  which is at least $\( 3 c - 5 d \)_(+) \/ 6$, while $D_0 gt.eq d - delta_(upright("fr") \, 1)$.
  The positive part is $1$-Lipschitz, giving the displayed correction. It follows that

$ F_1 gt.eq frac(c + 5 D_0 + \( 3 c - 5 D_0 \)_(+), 6) + w / 3 - 5 / 6 delta_(upright("fr") \, 1) gt.eq 2 /
  3 \( c + w \) - w / 3 - 5 / 6 delta_(upright("fr") \, 1) . $

The actual choices have $g lt.eq J_(+) + 2 sigma$ and $ell gt.eq 0$.
  Equation (2.175) therefore bounds the additional loss from $2 \( c + w \) \/ 3$ by

$ w \/ 3 + 5 sigma \/ 3 + 5 / 6 delta_(upright("fr") \, 1) lt.eq 22 sigma \/ 9 + 5 /
  6 delta_(upright("fr") \, 1) < 3 sigma + 5 / 6 delta_(upright("fr") \, 1) . $

For the second inequality in Equation (2.190), compute prime by prime from the definition of $F_2$.
  In units of the prime’s logarithmic norm, the contributions are

$ upright("common case") & F_2 & b_2\
i = i \, med 6 divides.not i \, med upright("unit") & 7 i \/ 6 & i\
i = i \, med 6 divides.not i \, med upright("nonunit") & \( 7 i - 5 \) \/ 6 + 1 / 3 1_(i = 1) & i\
i = i \, med 6 divides i \, med upright("either") & 7 i \/ 6 - 1 & i\
i > j_0 \, med 6 divides j_0 \, med upright("unit") & i + j_0 \/ 6 - 1 & \( i + j_0 \) \/ 2 . $

The extra $1 \/ 3$ in the second line is $f \/ 6$. The first line exceeds $2 b_2 \/ 3$.
  In the second line equality holds at $i = 1$, and for $i gt.eq 2$ the difference is $\( 3 i - 5 \) \/ 6 gt.eq
  0$. In the third line the difference is $\( i - 2 \) \/ 2 gt.eq 0$, because $i gt.eq 6$.
  In the last line it is $\( 4 i - j_0 - 6 \) \/ 6 gt.eq 0$, because $j_0 gt.eq 6$ and $i gt.eq j_0 + 1$.
  Summing proves the claim.

For the uncentered range $A lt.eq 5 M \/ 6$, Equations (2.188)–(2.190) bound the nominal exceptional excess by $3
  sigma + 5 delta_(upright("fr") \, 1) \/ 6$. The actual-count and aggregate support corrections recorded above
  are further $O \( xi \)$ terms in the fixed stage allowance.
  Together with the diagonal estimate and the smaller-width estimates,
  this proves the uncentered stage at the current width with the reserved terminal loss.
  The comparisons constructed earlier may consequently use that stage.
  It remains to estimate the centered exceptional terms when $A > 5 M \/ 6$.

For one separated side of a fixed exceptional row, fix the live slot labels.
  Lemma 60 then gives the same character, puncture, and norm power in the two plain variables and in both
  rectangle terms. The next lemma shows that the coefficient of $X^(1 + i t)$ in each plain sum is independent of
  $X$, so the two product main terms agree at equal products of scales.

#thm([Lemma 2.21.])[
  (Masked rectangle cancellation).  #emph[Let $theta.alt$ range over a fixed finite set of finite-order ray
    characters with conductor primes in $cal(S)$. Let $frak(R)_(*)$ be squarefree with $q_(frak(R)_(*)) lt.eq
    Z^(B_(*))$ for a fixed $B_(*)$, and let $W_1 \, W_2$ be smooth profiles on fixed annuli.
    For $X > 0$ and $t in bb(R)$, define
$ cal(L)_i \( X \, t \) := sum_l theta.alt \( l \) 1_(\( l \, frak(R)_(*) \) = 1) q_l^(i t) W_i \( q_l \/ X \) . $

 Then
#[#set math.equation(numbering: n => "(2.191)")
 $ cal(L)_i \( X \, t \) & = c_(theta.alt \, frak(R)_(*)) X^(1 + i t) I_i \( t \) +
   O (Z^(epsilon.alt_1) \( 1 + \| t \| \)^J) \,\
\| cal(L)_i \( X \, t \) \| & lt.double X . $ <old-eq:2.18d>]

 Here $J$ is fixed, the constants use finitely many seminorms,
   $c_(theta.alt \, frak(R)_(*))$ is independent of $X \, t$,
   and $I_i \( t \)$ is a fixed measure constant times $integral_0^oo W_i \( y \) y^(i t) thin d y$.
   Both estimates are uniform for $X > 0$, for the stated masks, and for the finite character set.]
  #emph[Let $D_(upright(bold(b)))$ be as in Equation (2.163), and put
$ U_i = X_i \/ q_(frak(b)_i) \, wide V_i = Y_i \/ q_(frak(b)_i) \, wide T = U_1 U_2 = V_1 V_2 . $

 If $U_i \, V_i gt.eq Z^r$ for $i = 1 \, 2$ and some $r gt.eq 0$, then
#[#set math.equation(numbering: n => "(2.192)")
 $ T^(- 1 \/ 2)
   lr(|sum_(l_1 \, l_2) theta.alt \( l_1 \) theta.alt \( l_2 \) 1_(\( l_1 l_2 \, frak(R)_(*) \) = 1) q_(l_1
   l_2)^(i t) D_(upright(bold(b))) \( l_1 \, l_2 \)|) lt.double Z^(epsilon.alt_1) \( 1 + \| t \| \)^(2 J)
   T^(1 \/ 2) Z^(- r) . $ <old-eq:2.18f>]

 Without a nonnegative lower length, the same expression is $O \( T^(1 \/ 2) \)$.]
] <lem:centered-lattice-cancellation>

#proof[
  First omit the mask. The primary generators representing ideals outside $cal(S)$,
    with the fixed character weight $theta.alt$, are a finite weighted collection of residue classes in a fixed
    lattice. Apply Poisson on that lattice to
  $ f_(X \, t) \( z \) = q_z^(i t) W_i \( q_z \/ X \) = X^(i t) f_t \( z \/ sqrt(X) \) \, wide f_t \( z \) =
    q_z^(i t) W_i \( q_z \) . $
  The Fourier transform is $X^(1 + i t) hat(f)_t \( sqrt(X) thin xi \)$.
    Because $f_t$ is supported on a fixed annulus, integration by parts for any fixed $J_0 > 2$ gives
  $ \| hat(f)_t \( xi \) \| lt.double_(J_0) \( 1 + \| t \| \)^(J_0) \( 1 + \| xi \| \)^(- J_0) \, $
  using finitely many seminorms of $W_i$. For $X gt.eq 1$, the sum over nonzero points of the fixed dual lattice
    is therefore
  $ lt.double \( 1 + \| t \| \)^(J_0) X sum_(xi eq.not 0) \( 1 + sqrt(X) \| xi \| \)^(- J_0)
    lt.double \( 1 + \| t \| \)^(J_0) $
  after increasing $J_0$ if necessary. For $0 < X < 1$, both the lattice sum and its zero-frequency main term are
    $O \( 1 \)$ by absolute counting on the fixed annulus. The zero frequency is $c_theta.alt X^(1 + i t)
    I_i \( t \)$, where $c_theta.alt$ is the fixed weighted mean of the residue classes.
    This proves the unmasked version of Equation (2.191).
  Now insert the mask by inclusion–exclusion. First remove from $frak(R)_(*)$ its primes in $cal(S)$,
    since every summation ideal already avoids them. Thus all divisors used below are outside $cal(S)$.
    With $cal(L)_i^0$ denoting the unmasked sum, multiplicativity gives
  $ cal(L)_i \( X \, t \) = sum_(d divides frak(R)_(*)) mu \( d \) theta.alt \( d \) q_d^(i t)
    cal(L)_i^0 \( X \/ q_d \, t \) . $
  The main coefficient is
  $ c_(theta.alt \, frak(R)_(*)) = c_theta.alt sum_(d divides frak(R)_(*)) frac(mu \( d \) theta.alt \( d \), q_d) . $
  The $q_d^(i t)$ from extraction has canceled the $q_d^(- i t)$ in the main term at $X \/ q_d$.
    This proves that the coefficient is independent of both $X$ and $t$.
    The errors are multiplied by at most the number of divisors $\# { d :
    d divides frak(R)_(*) } lt.double_(epsilon.alt_1 \, B_(*)) Z^(epsilon.alt_1)$.
    The coefficient itself is also $Z^(epsilon.alt_1)$-bounded by the polynomial-size Euler-product estimate.
    This proves Equation (2.191).
  For Equation (2.191), take absolute values in the original sum.
    It is empty below a fixed positive scale; whenever it is nonempty,
    ideal counting on the fixed annulus gives $O \( X \)$ points. This is uniform in $t$ and in the mask.
  The masked sum in Equation (2.192) is exactly
  $ cal(L)_1 \( U_1 \, t \) cal(L)_2 \( U_2 \, t \) - cal(L)_1 \( V_1 \, t \) cal(L)_2 \( V_2 \, t \) . $
  The two product main terms in Equation (2.191) are both $c_(theta.alt \, frak(R)_(*))^2 T^(1 + i t) I_1 \( t \)
    I_2 \( t \)$. They cancel. Each cross term with one error is bounded by
    $Z^(epsilon.alt_1) \( 1 + \| t \| \)^(2 J)$ times one of $U_1 \, U_2 \, V_1 \, V_2$,
    and the product of errors has the same bound after reducing the subsidiary power loss.
    If all four scales are at least $Z^r$, each is at most $T Z^(- r)$, and $1 lt.eq T Z^(- r)$ because $T gt.eq
    Z^(2 r)$. The difference is therefore $O \( Z^(epsilon.alt_1) \( 1 + \| t \| \)^(2 J) T Z^(- r) \)$.
    Division by $T^(1 \/ 2)$ proves Equation (2.192). When no nonnegative lower length is available,
    Equation (2.191) bounds each product by $O \( T \)$, giving the last assertion. ◻
]

Apply this lemma to each already allocated exceptional child.
  The hypotheses on its coefficient and common mask follow from Lemma 60;
  in particular the main terms cancel for the same row, mask,
  and whole-product norm power before any absolute value. Initially all four plain lengths are at least $L$.
  Before the selected $frak(t)$-factors are removed, the $c_2$ side has lower plain length at least $L - c - w -
  c_2$ and nominal total length $alpha_1 = a_0 - c_2$: no one plain loses more than the total $c + w +
  c_2$ extracted by the two genuine common supports and the amplifier.
  The other side has the analogous bounds with $d_2$. Put

$ r = \( L - c - w - min \( c_2 \, d_2 \) \)_(+) \, $

and call the side with this reference saving the first side, relabeling its associated raw data together.
  If $tilde(r)_1 < r$, each selected plain length satisfies $a_(1 \, i) lt.eq tilde(r)_1$,
  so all four formal post plain scales have logarithmic length at least $r - a_(1 \, i) gt.eq r - tilde(r)_1 > 0$.
  Apply Equation (2.192) on these exact equal-product formal scales.
  If $tilde(r)_1 gt.eq r$, including equality, or if $r = 0$,
  use the all-scale absolute-volume fallback in the same lemma.
  No formal centered scale is clipped in this branch, and an identically zero rectangle remains in the formal
  difference. The resulting saving is $\( r - tilde(r)_1 \)_(+)$.
  With absolute volume on the other side, this gives the aggregate bound on each lower-endpoint divisor dyad,

#[#set math.equation(numbering: n => "(2.193)")
 $ & sum_(frak(t) \, upright(bold(J))) \| c_(frak(t) \, upright(bold(J))) \( h' \) \| \|
   P_(C \, frak(t) \, upright(bold(J))) \( h' \) P_(D \, frak(t) \, upright(bold(J))) \( h' \) \|\
 & #h(15mm)  lt.double Z^(a_0 - b_2 - r + 2 theta_N + epsilon.alt_1) . $ <old-eq:2.18>]

Here and below a fixed polynomial in the separated heights is understood.
  To check the bound, the raw coefficients and volumes give the reference exponent $a_0 - b_2 + e_1 +
  e_2$ and reduction $- tilde(r)_1 - tilde(r)_2$, while the divisor count gives $t_(-)$.
  Equation (2.180) gives the one-line inequality

#[#set math.equation(numbering: n => "(2.194)")
 $ t_(-) - tilde(r)_1 - tilde(r)_2 - \( r - tilde(r)_1 \)_(+) & = \( t_(-) - tilde(r)_2 \) - max \( r \, tilde(r)_1 \)\
 & lt.eq omega_2 - r . $ <old-eq:2.18h>]

Adding $e_1 + e_2$ leaves at most $e_1 + \( e_2 + omega_2 \) - r lt.eq 2 theta_N - r$.
  The divisor-bounded allocations contribute only $epsilon.alt_1$, proving Equation (2.193).
  This applies to the artificial terms even when quotients retain $frak(t)$-primes,
  because the coefficient lemma preserves the common mask, equal product scales,
  and one norm power within each rectangle difference.

The live slots are summed only after the finite transform has removed their Gauss coefficients.
  Their unnormalized absolute sums contribute $O_N \( product_(i med upright("live")) P_i \)$.
  Combining this with the nominal raw normalizer gives the full $e_j$ volume factor in Equation (2.181),
  as included above; it is not replaced by a factor-product normalizer.
  The Fourier measure was fixed before their labels, so conditioning on those labels changes neither the common
  mask nor the centered saving. A zero conditional slot scalar is discarded only in the present absolute bound.

Set $v = c + w + min \( c_2 \, d_2 \)$. By Equation (2.190), $F_1 + F_2$ is at least $2 v \/ 3 - 3 sigma -
  5 delta_(upright("fr") \, 1) \/ 6$, since $b_2 gt.eq min \( c_2 \, d_2 \)$.
  The centered saving in Equation (2.193) now bounds the exceptional deficit,
  apart from $3 sigma$ and the recorded frequency and aggregate support perturbations, by

#[#set math.equation(numbering: n => "(2.195)")
 $ A - 5 / 6 M - 2 / 3 v - \( L - v \)_(+) lt.eq \( A - M \)_(+) . $ <old-eq:2.19>]

Indeed, for $0 lt.eq v lt.eq L$ the left side is $A - 5 M \/ 6 - L + v \/ 3$, which increases with $v$;
  for $v gt.eq L$ it is $A - 5 M \/ 6 - 2 v \/ 3$, which decreases.
  Its maximum is attained at $v = L = M \/ 4$ and equals $A - M$.
  For positive slots, Equation (2.150) implies $A lt.eq M$.
  For the zero-slot core, Equation (2.156) gives $A - M lt.eq delta$.
  Thus the centered exceptional terms require only the terminal loss $3 sigma$, or $delta +
  3 sigma$ in the padded core. The additional $delta_(upright("fr") \, 1)$, $delta_(upright("fr") \, 2)$,
  and $theta_N$ terms are included in the same $C_(*) xi$ stage allowance.
  Together with Equation (2.177), this completes the centered stage at the current width.

===== 2.7.8 Completion of the finite induction <completion-of-the-finite-induction>

We finish by verifying the quantifier order and the finite induction.
  Every nonterminal call is to a child with nominal width $M'$ in Equation (2.178),
  at least $sigma$ below its parent. The declared row width is $M'_(upright("act"))$,
  and all nonexceptional moment-input lengths are taken after the specified support and clipping operations.
  Exceptional raw scales remain formal and are not clipped.
  The two frequency enclosures, the aggregate support errors,
  and these clippings alter the width comparison by at most $C_(*) xi$. Choose this below $sigma \/ 2$.
  Every nonempty child then has nonnegative width and leaves its band of length $sigma \/ 4$.
  An empty nonzero-frequency range is discarded; a nonempty formal range just below scale one has already been
  included by its enclosing length and clipping error.

At each smaller width, Equations (2.151)–(2.152) delete the fixed extra masks before the natural positive-slot
  estimate. The unrestricted zero-slot assertion follows once from the padded core by reflecting at most its two
  plains. A centered comparison calls only the earlier uncentered stage in its band, using its strict margin.
  Each Gauss norm has at most one amplification, whose errors go directly to the second transform.
  Equation (2.185) is invoked once for each actual natural child,
  after all its boundary defects have been included in $F_(upright("act"))$. Thus there is no same-band cycle.
  The integer $D$ defined above bounds the strict calls by $D - 2$,
  because each drops the width by at least $sigma \/ 2$ from an initial width at most $M_max$.

Here is why $C_(*)$ and the mesh can be chosen independently of the fixed slot count.
  Equation (2.165) bounds the entire logarithmic error of any slot subset by $theta_N = H_N \/ log Z$.
  Each extracted plain power is measured exactly, and each of the two possible plain clippings in one
  nonexceptional rectangle, after triangle inequality, has one fixed endpoint error.
  The exceptional calculation uses raw reductions and the disjoint-subset bounds without clipping.
  The first and second frequency enclosures use only their one aggregate outer scale and one common row dyad.
  All the local ledgers are affine or positive parts of affine expressions in the fixed list of aggregate lengths
  displayed above. Their numerical Lipschitz constants do not depend on $N$;
  the local $F_2$ inequalities and the radical counts use exact prime norms.
  In particular the change in the positive-slot affine expression is at most

#[#set math.equation(numbering: n => "(2.196)")
 $ \| Delta M \| + \| Delta A \| + 5 \| Delta z \| \, $ <old-eq:2.1j>]

because $0 lt.eq 6 kappa - 1 lt.eq 5$. The total change of $z$ is aggregated before this inequality is used.
  These observations give one numerical $C_(*)$, enlarged for the fixed number of operations per stage,
  that covers all frequency, normalization, and boundary errors by $C_(*) xi$.
  The single greedy prefix contributes at most $eta$, not one $eta$ per removed slot.

The analytic separations introduce no derivative-order multiple of $xi$.
  On a fixed full-product logarithmic box a radial kernel is
  $hat(Phi)_i \( R_(upright("sc")) exp \( L \( upright(bold(x)) \) \) \)$,
  where $L$ is a fixed linear form in the row and whole-column log norms.
  Every derivative is a fixed combination of Euler derivatives of $hat(Phi)_i$.
  Lemma 11 bounds these uniformly for all $R_(upright("sc")) > 0$,
  with any prescribed radial decay and derivative orders. One does not use the weaker bound $R_(upright("sc"))^J$
  for $R_(upright("sc")) lt.eq Z^xi$. After its displayed central power has been extracted,
  an inverse root is $\( q_u \/ Z^(a_0) \)^(- 1 \/ 2)$ on the fixed box;
  its derivatives cost only fixed constants depending on $H_N$ and their order.
  Lemma 9 uses the full weighted Fourier integral, not a supremum over heights below $Z^xi$.
  A required height degree $J$, which may depend on $N$, raises an input seminorm order and a fixed constant,
  not a $Z^(J xi)$ exponent. Reflection similarly acts on at most two plains with fixed gamma shape;
  larger derivative orders raise finite seminorm and height orders,
  while the upper-annulus subshare $xi \/ 2$ remains fixed.
  The fixed polynomial height factor in Equation (2.158) is integrated by these weighted Fourier measures at its
  required finite order, without changing the previously chosen exponent of $Z$.

The discrete label counts are also used only once. After extracting the displayed exponent for a family of common
  supports, divisors, or allocations, divide its absolute weighted counting measure by that total mass before
  applying a separated tuple seminorm. This leaves a measure of mass at most one;
  its already extracted exponent is not counted again in the smooth norm.
  Each Fourier measure is common to the live labels by the whole-product construction.

======= 2.7.8.1 Choices before specifying the slot count. <choices-before-specifying-the-slot-count.>

Choose the parameters in the following order. First, from the bounded real ranges and $epsilon.alt$,
  choose $rho \, sigma \, delta > 0$, with $delta$ small compared to $rho \, sigma$, so that

$ T_(upright("term")) := rho + delta + rho \/ 6 + 3 sigma + 5 sigma \/ 3 < epsilon.alt \/ 4 . $

This bounds a terminal width-floor, diagonal, or exceptional loss;
  the displayed frequency and numerical support corrections belong instead to the per-stage $xi$ allowance.
  With $D$ and $C_(*) gt.eq 1$ as above, choose, still before specifying $N$ or its fixed profiles,

#[#set math.equation(numbering: n => "(2.197)")
 $ xi & < min {delta / 2 \, rho / 30 \, frac(sigma, 4 C_(*)) \, frac(epsilon.alt, 16 C_(*) D)} \,\
eta & < min {sigma / 6 \, frac(epsilon.alt, 16 C_(*) D)} \, wide
  epsilon.alt_0 < frac(epsilon.alt, 16 C_(*) D) . $ <old-eq:2.1i>]

These choices make the strict drop at least $sigma \/ 2$, preserve the comparison margins and padded core,
  and are uniform for $kappa in \[ 3 \/ 4 \, 1 \]$.

======= 2.7.8.2 Choices for a fixed slot system. <choices-for-a-fixed-slot-system.>

Now fix any $Z$-independent $N$, arithmetic data, and profile windows.
  Form $H_N$ and the finite full support boxes through depth $D$.
  Their fixed factors $exp \( O \( H_N \) \)$ belong to the constants.
  After imposing an eventual threshold $log Z gt.eq C H_N \/ xi$, the threshold in Equation (2.155),
  and Equation (2.166), all occurring column, radical, and mask norms have bounded logarithmic ranges independent
  of moving labels. In those ranges choose every arbitrarily small power estimate with local shares whose sum in a
  stage is at most $epsilon.alt_0$. These shares may depend on $N$.
  For example, the two divisor masses and the at most $N$ frozen-slot masses in mask deletion may each use a share
  $epsilon.alt_0 \/ \( 10 \( N + 2 \) \)$. In the prime estimate,
  the principal squared exponent is exactly $kappa z$, and the contour displacement cost is $2 e z$,
  with bounded total $z$, not $N eta$. Choose $e$ for its assigned share;
  the fixed character expansions and powers of $log Z$ are absorbed after an $N$-dependent threshold.
  The same reasoning applies as individual $z_i$ approach zero, since $P_i gt.eq 1$.
  For divisor allocations use the global bounds $tau_(N + 2) \( v \)^C lt.double_(N \, C \, a)
  q_v^a$ and $C_N^(omega \( v \)) lt.double_(N \, a) q_v^a$ with a sufficiently small $a > 0$,
  not a fixed loss at every prime. Rankin’s fixed-radical bound is treated with the same local shares.
  The one normalized pool average has only its single density loss in a stage.

The induction is simultaneous for every surviving subset of these original $N$ slots, with the same mesh.
  To make this precise, for $0 lt.eq d lt.eq D - 2$, let

$ cal(E)_d := T_(upright("term")) + \( d + 1 \) C_(*) \( eta + xi + epsilon.alt_0 \) $

be the permitted error when at most $d$ strict calls remain.
  A terminal group, including its bounded reflection or comparison preprocessing, has error at most $cal(E)_0$.
  A strict edge and its fixed number of same-band operations use the child envelope $cal(E)_(d - 1)$ plus at most
  $C_(*) \( eta + xi + epsilon.alt_0 \)$, giving $cal(E)_d$.
  The Gauss allowance $epsilon.alt_G$ in Equation (2.169) denotes this appropriate envelope and the current local
  shares; it is not a request to reapply the moment lemma with an $N$-dependent loss and a new mesh.
  Triangle inequalities take the maximum error up to the already counted mass,
  and Cauchy–Schwarz averages the errors of the two children.
  Consequently one terminal loss occurs along a branch, not at every ancestor.
  The largest path error is at most $T_(upright("term")) + C_(*) D \( eta + xi + epsilon.alt_0 \) <
  epsilon.alt$ by Equation (2.197).

Finally choose the required finite kernel, reflection, prime,
  and terminal seminorm and polynomial-height orders backwards through these $D$ stages.
  The full weighted Fourier estimates and uniform Euler-kernel estimates above make every such choice finite.
  Choose one final lower threshold for the aggregate support inequalities, pool separation and density,
  the raw frequency tails, and all fixed logarithmic losses.
  The orders, constants, and threshold may grow with $N$ and the fixed data, but $eta \, xi \, D \,
  C_(*)$ in the exponent comparison do not.

Each new extra mask is supported on frozen columns or a frozen amplifier prime,
  and its logarithmic norm increases by a bounded total length at a stage. It is fixed within every child row sum.
  The only row-dependent zeros there are the natural zeros of the row;
  the declared moving zeros remain in the fixed twist and remain counted.
  Over depth $D$ the masks remain of polynomial norm. On an exceptional row,
  the redundant part of the full moving union and the row radical, together with these extra masks,
  forms the common polynomial-size $frak(R)_(*)$; the lattice cancellation is uniform for it.
  The fixed-numerator ray lemma controls the finite choices at $cal(S)$,
  without absorbing a moving good prime into a fixed modulus.

When this estimate and the inverse moment are applied together, all internal orders in both arguments,
  including the reflection-kernel orders, are fixed first. The later external Fourier-tail order in Lemma 9 lies
  outside this internal propagation: it raises only the external input seminorm and does not change a previously
  fixed internal height order. This proves the asserted finite-order uniformity.
  The finite induction proves the natural assertion, and the initial mask deletion proves Lemma 59 in its full
  stated form.

For the later physical application, $q = 0$ and the row $u$ is sixth-power-free.
  If a prime outside $cal(S)$ has valuation $1 \, dots.h \, 5$ in $u$,
  its local character has order $6 \/ gcd \( 6 \, v_p \( u \) \) > 1$,
  so the inducing character cannot belong to $Theta$. The exceptional physical rows are therefore supported on
  $cal(S)$; sixth-power-freeness makes this a finite set, up to the finite unit group.
  With abstract moving twists, additional exceptional rows can arise by cancellation.
  They were included in Equation (2.187) and the fixed-character volume argument.

==== 2.8 Prime amplitudes and refined row counts <sec:refined-row-counts>

We use the current Part II arithmetic data and the physical slots of Equation (2.5).
  Instantiate the shared zero detector of Section 6 with these same fixed data.
  The main and error factors below belong to the retained dynamic decomposition in Equation (2.51);
  no individual local quotient is asserted outside that region.
  Every retained external coordinate obeys the single height allocation in Equation (1.113).

===== 2.8.1 Prime amplitudes <sec:amplitudes>

For a main physical slot of scale $P_i = Z^(ell_i)$, write its central factor as

$ Q_i \( u \; z \) = P_i^(- 1 \/ 2) sum_(p in 1_T) overline(chi_p \( u \))
  W_i \( q_p \/ P_i \) \( q_p \/ P_i \)^(z - 1) . $

The main part $cal(Q)_i$ in Proposition 51 is exactly

$ cal(Q)_i \( u \; z \) = - sum_(p in 1_T) overline(chi_p \( u \)) q_p^(z - 1) W_i \( q_p \/ P_i \) = -
  P_i^(z - 1 \/ 2) Q_i \( u \; z \) . $

As in Section 1, each sum over $p in 1_T$ retains the same allowed set $cal(P)_i \( Z \)$,
  including its exclusion of $S$. The original zero extension is retained,
  so a prime dividing $u$ does not contribute to this main slot.
  The real part of $z$ is in a fixed bounded range and its imaginary part is one of the external frequencies
  restricted by the common height allowance.

#thm([Lemma 2.22.])[
  (Prime bound in a bin).  #emph[Under the hypotheses of Lemma 28,
    with the prime-annulus Mellin frequency included in its cumulative allowance, for every $epsilon.alt_1 > 0$
$ \| Q_i \( u \; z \) \| lt.double_(cal(A) \, e \, epsilon.alt_1) U^(epsilon.alt_1) P_i^(a - 1 \/ 2 + O \( e \)) . $

 The implied $O \( e \)$ is uniform for $51 \/ 100 lt.eq a lt.eq 1$ and the fixed real ranges.
   It holds for every main slot in the row.]
] <lem:bin-prime-bound>

#proof[
  Expand $1_(p in 1_T) = \| T \|^(- 1) sum_(theta in hat(T)) theta \( p \)$.
    Every resulting prime character belongs to $cal(X)_u$. Lemma 13, applied to the buffered disks,
    bounds its logarithmic derivative on $Re s = a + 8 e$ by $O_(cal(A) \, e) \( log U \)$;
    the logarithmic derivative of the deleted product has the same bound.
    Mellin inversion of the corresponding smooth von Mangoldt annulus, shifted only in the retained central range,
    gives $U^(epsilon.alt_1) P_i^(a - 1 \/ 2 + O \( e \))$ after normalization.
    The pure twist $\( q_p \/ P_i \)^(i Im z)$ is translated into the logarithmic-derivative argument before the
    added Mellin frequency is truncated. The joins have bounded real length.
    On them the logarithmic derivative is $O_(cal(A) \, e) \( log U \)$ inside its allocated buffer,
    while on the starting line $Re s = 2$ it is absolutely bounded.
    Apply the pointwise estimate in Equation (1.12) to the untwisted transform for the joins,
    and Equation (1.11) for the absolute-line tails. Choosing the external order after their fixed polynomial
    scale and height bounds gives the asserted estimate.
  To pass from von Mangoldt coefficients to primes, divide the annular weight by $log \( P_i y \)$.
    On the fixed annulus,
  $ \( y partial_y \)^j frac(1, log \( P_i y \)) = frac(\( - 1 \)^j j !, { log \( P_i y \) }^(j + 1)) \, $
  so this preserves every fixed smooth seminorm for sufficiently large $P_i$,
    without introducing a power of $P_i$ depending on the derivative order.
    Bounded $P_i$ are handled by absolute counting. Prime powers contribute $P_i^(o \( 1 \))$ after central
    normalization, since their number in a norm annulus is $O \( P_i^(1 \/ 2 + o \( 1 \)) \)$.
    The polynomial-size punctures and their zero extensions are already included in the logarithmic derivative.
    This proves the bound. ◻
]

Here is a precise amplitude subdivision. Choose a fixed bin width $theta.alt > 0$.
  First reduce $e$ and $epsilon.alt_1$, after the slot lengths have been fixed,
  so that the preceding bound is at most $P_i^(delta \/ 2 + theta.alt)$ for all sufficiently large $Z$.
  This is possible because $log U \/ log P_i = d \/ ell_i$ stays in a fixed bounded range for each fixed mesh.
  For a main slot with $Q_i eq.not 0$, put

$ g_i = min {delta / 2 \, max (0 \, theta.alt ⌊frac(log \| Q_i \|, theta.alt log P_i)⌋)} . $

Put $g_i = 0$ if $Q_i = 0$, and also put $g_i = 0$ for an error slot from Equation (2.50). Then, for a main slot,

$ \| Q_i \| lt.eq P_i^(g_i + theta.alt) \, wide g_i > 0 med arrow.r.double med \| Q_i \| gt.eq P_i^(g_i) . $

No lower bound is asserted for a slot with $g_i = 0$. The finitely many possible vectors $\( g_i \)$,
  with the possible endpoint value $delta \/ 2$, partition the rows into amplitude bins.
  Define their length-weighted mean by

#[#set math.equation(numbering: n => "(2.198)")
 $ q = frac(sum_i ell_i g_i, ell) \, wide 0 lt.eq q lt.eq delta \/ 2 \, wide ell = sum_i ell_i . $ <old-eq:6.6>]

This $q$ records prime amplitude; it is not the conductor exponent denoted $q$ in the auxiliary fourth moment.

===== 2.8.2 Selected prime slots and the row counts <sec:selection>

Use $Delta$ and $kappa$ from Equation (2.1):

$ 0 < Delta lt.eq 1 / 24 \, wide kappa = 2 beta_(*) - 1 = 3 / 4 + 2 Delta in \( 3 \/ 4 \, 5 \/ 6 \] \, wide
  alpha := 5 / 6 . $

The parameter $kappa$ remains dynamic; $alpha$ is the fixed slope from sixth-power amplification.
  Since $kappa < 1$ and $beta_(*) = \( 1 + kappa \) \/ 2$, the positive-slot hypothesis of Lemma 59 is satisfied
  by equality. Equation (2.2) gives $delta lt.eq kappa lt.eq alpha$ for the current Part II bins,
  including the possible endpoint $delta = alpha$.

Fix a dynamic and amplitude bin and fix the external physical Mellin parameters.
  Write $z_(upright("phys"))$ for the fixed third Mellin parameter,
  so the physical slots are $Q_i \( u \; z_(upright("phys")) \)$.
  All $g_i$, and hence $q$, are now fixed within its row sum.
  At base $U$, the length of slot $i$ is $w_i = ell_i \/ d$, and the total available length is $ell \/ d$.
  For a requested length $0 lt.eq z lt.eq ell \/ d$, order the positive $g_i$ decreasingly and fill $z$
  fractionally in that order. The gained exponent is at least $q z$:
  if positive slots suffice to fill $z$, their initial weighted average is at least the average $q$ of all slots;
  otherwise retaining them all gives gain $q ell \/ d gt.eq q z$.
  Removing the one possibly fractional slot loses at most $\( max_i w_i \) delta \/ 2$.
  Thus a fixed subcollection of whole positive slots of length at most $z$ satisfies

$ lr(|product_(i med upright("selected")) Q_i|)^2 gt.eq U^(2 q z - delta max_i w_i) . $

When a strict moment inequality is needed, we first replace $z$ by $z - nu_0$ for a fixed small $nu_0 > 0$,
  or select no slot if $z lt.eq nu_0$. The resulting loss in this display is at most $2 q nu_0 + delta max_i w_i$,
  except in the stated zero-capacity neighborhood, where an unweighted moment will be used.
  Both losses can be made smaller than any prescribed positive power.

The selected factors have exactly the coefficient class required by the moments.
  Conjugate both witness factors, including their profiles,
  if necessary and write their row character as $psi \( n \) = nu \( n \) overline(chi_n \( u \))$, $nu in Theta$.
  Relative to this row, a physical prime has coefficient

$ overline(nu \( p \)) 1_(p in 1_T) = frac(1, \| T \|) sum_(theta in hat(T)) \( overline(nu) theta \) \( p \) . $

This is a fixed finite combination of members of $Theta$;
  it is independent of the moving row in the fixed row sum. There is no requirement that $eta \( p \) = 1$.
  The factor $\( q_p \/ P_i \)^(z_(upright("phys")) - 1)$ is part of its smooth profile.
  Underlying prime supports remain disjoint before masks. The marked moment permits this negative common row
  orientation. To apply Lemma 59, whose row character has positive orientation,
  conjugate the whole product of both plain witness factors and all selected prime factors.
  Its absolute square is unchanged, and its common row character becomes $overline(psi \( n \)) =
  overline(nu \( n \)) chi_n \( u \)$. Both witness profiles and every selected slot profile are conjugated,
  and each selected slot coefficient becomes $nu \( p \) 1_(p in 1_T)$,
  again a fixed finite combination of members of $Theta$. Conjugation retains all zero extensions and underlying
  prime supports. It also preserves whether the inducing character belongs to $Theta$, since $Theta$ is a group.
  The witness and physical heights need not be equal. Apply Lemma 9 to the rowwise witness parameters after fixing
  the physical parameters and selected indices. Derivatives in those parameters insert only logarithmic profile
  weights. The cost is a fixed power of $1 + T_1$, uniform over moving rows and outer labels.
  Every retained large row induces outside $Theta$, because it ramifies at a prime outside $S$.
  Thus the $z > 0$ family condition of Lemma 59 holds.

For an actual plain length $m lt.eq 1 \/ 2$, its largest zero-loss capacity from Lemma 59,
  at effective row width one, is

#[#set math.equation(numbering: n => "(2.199)")
 $ z_P \( m \) = frac(1 - 2 m, 6 kappa) = frac(1 - 2 m, 9 \/ 2 + 12 Delta) . $ <eq:plain-zero-loss-capacity>]

Indeed the moment is applied to two copies of the plain witness, so its condition is $2 m + 6 kappa z lt.eq 1$.
  For an inverse witness of length $r < 1$, put $z_M \( r \) = \( 1 - r \) \/ 2$.
  We use this capacity only where the second strict inequality in Lemma 53 also has a fixed margin.

#thm([Proposition 2.23.])[
  (Row counts from the witnesses).  #emph[Let $cal(B)$ be a fixed dynamic and amplitude bin of retained
    sixth-power-free physical rows $q_u asymp U = Z^d$, with $a > 51 \/ 100$, $0 < delta = 2 a - 1 lt.eq alpha$,
    and mean amplitude $q in \[ 0 \, delta \/ 2 \]$. Put $x = q \/ delta$, so $0 lt.eq x lt.eq 1 \/ 2$, and define
$ D_x = 3 - frac(17 x, 9) \, wide P_x = (2 - frac(8 x, 9)) \( 1 - x \) . $

 Assume the total available prime length exceeds $7 \/ 37$ by a fixed positive amount.
   For every $t in \[ 1 \, 3 \/ 2 \]$ and every $epsilon.alt > 0$,
   the capacity decrements and slot mesh can be chosen using only $epsilon.alt \,
   Delta$ and the bounded real ranges so that
$ \# cal(B) lt.double_(cal(A) \, epsilon.alt)
  U^(max { R_(upright("short")) \( t \) \, L \( t \) } + Delta \/ 4 + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, $

 where $A_(cal(A)) < oo$ is uniform over moving rows and
$ R_(upright("short")) \( t \) = 1 - delta + frac(delta P_x, D_x) \( 3 \/ 2 - t \) \, wide L \( t \) = 1 -
  delta + \( alpha - delta \) \( t - 1 \) . $

 The estimate is valid for the rowwise witnesses of Proposition 29, with its height condition.
   If no prime slots are selected, then $t = 1$ instead gives
$ \# cal(B) lt.double_(cal(A) \, epsilon.alt) U^(1 - 2 delta \/ 3 + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, $

 without a prime-supply hypothesis. At zero inverse capacity use Lemma 58;
   at zero plain capacity use the zero-slot case of Lemma 59.]
] <prop:detector-counts>

#proof[
  Subdivide by the witness presentation and dyadic pair. The number of choices is
    $O_(cal(A)) \( \( log U \)^2 \)$; the remaining rowwise smooth parameters are handled by the preceding Sobolev
    argument. Work in one subdivision, denoting it again by $cal(B)$, and let $r \,
    m$ be the actual lengths from Proposition 29. Whenever the selected slots satisfy the corresponding moment
    hypotheses and have total requested capacity $z$, their spike and the individual witness spikes imply,
    after reducing preliminary losses,
  $ \# cal(B) lt.double U^(1 - delta r - 2 q z + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, &
    upright("from Lemma ") upright("2.13") \,\
\# cal(B) lt.double U^(1 - 2 delta m - 2 q z + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, & upright("from Lemma ")
  upright("2.19") . $
  In the second line use two copies of $S_m$, so the denominator is $\| S_m \|^4$, not $\| S_m \|^2$.
    The effective width is one because the twist $nu$ is fixed within the row sum and has no moving conductor
    radical. Each formula includes the arbitrarily small capacity, rounding, moment, and witness losses.
  ======= 2.8.2.1 Inverse witnesses without selected primes. <inverse-witnesses-without-selected-primes.>
  Whenever no inverse slot is selected, use instead the sixth-power amplification of Lemma 58.
    It applies to these physical rows because their ideal valuations are at most five and their original zero
    extensions are unchanged. After the present subdivision, $U \, t \, D \, D_(*)$ are common,
    and the inverse base profile is
  $ W_(upright("base")) \( y \) = W_1 \( y \) V_lt.eq \( D y \/ D_(*) \) . $
  Its fixed logarithmic seminorms are uniformly bounded: a derivative of the second factor is supported where its
    scaled argument lies in a fixed compact interval. The remaining rowwise parameters are $sigma$ in a fixed
    compact interval and the pure twist $- \( gamma - nu \)$, of absolute value at most $\( 3 I + 1 \) T_1$.
    The rowwise assertion of Lemma 58 therefore applies with that height range.
    Replacing its factor $\( 1 + \( 3 I + 1 \) T_1 \)^A$ by $\( 3 I + 2 \)^A \( 1 + T_1 \)^A$ changes only a fixed
    constant.
  For clarity, this use is uniform even when $r$ approaches one with $U$.
    If $0 lt.eq r lt.eq R_0$, Equation (2.145) with preliminary loss $epsilon.alt_0$ has exponent
  $ max {1 \, frac(1 + 5 \( 1 + c \) r, 6)} + \( 1 + r \) epsilon.alt_0 lt.eq e \( r \) +
    frac(5 c R_0, 6) + \( 1 + R_0 \) epsilon.alt_0 \, wide e \( r \) = max {1 \, frac(1 + 5 r, 6)} . $
  For a requested loss $epsilon.alt_m > 0$, take, for example, $c =
    3 epsilon.alt_m \/ \( 10 max { R_0 \, 1 } \)$ and $epsilon.alt_0 = epsilon.alt_m \/ \( 4 \( 1 + R_0 \) \)$.
    These are fixed before $U$, and the two extra terms are at most $epsilon.alt_m \/ 2$.
    Thus division by the inverse witness spike gives
  #[#set math.equation(numbering: n => "(2.200)")
   $ \# cal(B) & lt.double U^(e \( r \) - delta r + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \,\
e \( r \) - delta r & =
  cases(delim: "{", 1 - delta r \, & 0 lt.eq r lt.eq 1 \,, 1 - alpha + \( alpha - delta \) r \, & r gt.eq 1 .)
  $ <eq:no-slot-inverse-count>]
  In particular this is not an application of the strict marked moment with the shrinking margin $1 - r$.
  ======= 2.8.2.2 Cases requiring no selected primes. <cases-requiring-no-selected-primes.>
  We first dispose of the cases in which a witness already gives the required count without selecting primes.
    For $r gt.eq 1$, Equation (2.200) uses effective moment exponent $\( 1 + 5 r \) \/ 6 = 1 - alpha + alpha r$.
    Division by the inverse spike gives $1 - alpha + \( alpha - delta \) r$.
    Because $delta lt.eq alpha$ and $r lt.eq t + O \( epsilon.alt \)$, this is at most
  #[#set math.equation(numbering: n => "(2.201)")
   $ L \( t \) = 1 - alpha + \( alpha - delta \) t = 1 - delta + \( alpha - delta \) \( t - 1 \) $ <eq:long-count>]
  up to $O \( epsilon.alt \)$. This includes $r = 1$, where the two branches in Equation (2.200) agree.
    If $m gt.eq 1 \/ 2$, the zero-slot case of Lemma 59 gives count exponent $1 - 2 delta m lt.eq 1 - delta$.
    Since $R_(upright("short")) \( t \) gt.eq 1 - delta$, this also satisfies the stated bound.
    We may therefore assume for the remaining argument that
  $ r < 1 \, wide m < 1 \/ 2 . $
  Both capacities $z_M \( r \)$ and $z_P \( m \)$ are then positive;
    when either is too small for the fixed decrement, we will use its unweighted estimate below.
  ======= 2.8.2.3 Comparing the positive capacities. <comparing-the-positive-capacities.>
  For the inverse capacity $z_M \( r \)$, the resulting ideal exponent is $A_I \( r \)$ below.
    To compare the plain exponent first replace $z_P \( m \)$ by its value at $Delta = 0$,
    namely $2 \( 1 - 2 m \) \/ 9$. Since the actual $m$ is at least $t - r - O \( epsilon.alt \)$,
    the resulting ideal comparison exponent is
  #[#set math.equation(numbering: n => "(2.202)")
   $ A_I \( r \) & = 1 - delta { x + \( 1 - x \) r } \,\
S_t \( r \) & = 1 - delta {frac(4 x, 9) + (2 - frac(8 x, 9)) \( t - r \)} . $ <eq:selected-counts>]
  Both the actual plain exponent $1 - 2 delta m - 2 q \( 1 - 2 m \) \/ \( 9 \/ 2 + 12 Delta \)$ and its baseline
    version decrease with $m$: their derivatives are respectively
  $ - 2 delta + frac(4 q, 9 \/ 2 + 12 Delta) < 0 \, wide - 2 delta + frac(8 q, 9) < 0 . $
  The $O \( epsilon.alt \)$ replacement of $m$ is therefore legitimate.
  The two affine expressions in Equation (2.202) cross at
  $ r_(*) \( t \) = frac(\( 2 - 8 x \/ 9 \) t - 5 x \/ 9, D_x) . $
  Here $D_x gt.eq 37 \/ 18 > 0$. Directly,
  $ r_(*) \( 3 \/ 2 \) = 1 \, wide r_(*) \( 1 \) = frac(2 - 13 x \/ 9, 3 - 17 x \/ 9) gt.eq 23 / 37 \, $
  and
  $ t - r_(*) \( t \) = frac(\( 1 - x \) t + 5 x \/ 9, D_x) . $
  The last expression is increasing in $t$, equals $1 \/ 2$ at $t = 3 \/ 2$, and at $t =
    1$ is $\( 1 - 4 x \/ 9 \) \/ \( 3 - 17 x \/ 9 \) gt.eq 1 \/ 3$. Thus, throughout the stated ranges,
  $ r_(*) \( t \) gt.eq 23 / 37 \, wide 1 / 3 lt.eq t - r_(*) \( t \) lt.eq 1 / 2 \, wide r_(*) \( t \) lt.eq 1 . $
  Use the plain count when $r lt.eq r_(*) \( t \)$, and the inverse count when $r_(*) \( t \) lt.eq r < 1$,
    except within the fixed small zero-capacity neighborhoods. On the inverse side $r gt.eq 23 \/ 37$.
    After decreasing $z_M \( r \)$ by $nu_0$,
  $ 1 - r - 2 z gt.eq 2 nu_0 > 0 \, wide 3 - 2 r - 8 z = 4 \( 1 - r - 2 z \) + \( 2 r - 1 \) > 0 . $
  The second inequality has a margin at least $9 \/ 37$ before its positive first term.
    These are precisely the two strict width conditions of Lemma 53 at row width one.
    The inverse capacity is at most $\( 1 - 23 \/ 37 \) \/ 2 = 7 \/ 37$.
    On the plain side, $m gt.eq 1 \/ 3 - O \( epsilon.alt \)$, so its capacity is at most $2 \/ 27 +
    O \( epsilon.alt \)$. At $d = h$ the available length is
  $ ell / h = 8 / 39 \, wide 8 / 39 - 7 / 37 = 23 / 1443 > 0 . $
  The assumed positive supply margin and a sufficiently fine mesh therefore permit every selection just made.
  On the plain side, replacing the baseline capacity by the actual capacity in Equation (2.199) raises the count
    exponent by
  #[#set math.equation(numbering: n => "(2.203)")
   $ 2 q \( 1 - 2 m \) (2 / 9 - frac(1, 9 \/ 2 + 12 Delta)) & =
     frac(24 q \( 1 - 2 m \) Delta, \( 9 \/ 2 \) \( 9 \/ 2 + 12 Delta \))\
 & lt.eq Delta / 4 + O \( epsilon.alt \) . $ <eq:capacity-comparison>]
  For the inequality use $m gt.eq 1 \/ 3 - O \( epsilon.alt \)$, $2 q lt.eq 1$,
    and the lower bound four for each denominator. The constants in the $O \( epsilon.alt \)$ term are uniform.
  The weighted average
  #[#set math.equation(numbering: n => "(2.204)")
   $ R_(upright("short")) \( t \) & = frac(\( 2 - 8 x \/ 9 \) A_I \( r \) + \( 1 - x \) S_t \( r \), D_x)\
 & = 1 - delta + frac(delta P_x, D_x) \( 3 \/ 2 - t \) $ <eq:short-crossing-count>]
  is independent of $r$: the $r$-coefficients cancel, and the weights sum to $D_x$.
    It is the common value at $r_(*) \( t \)$. Since $S_t$ is increasing in $r$ and $A_I$ is decreasing,
    the chosen short count is at most $R_(upright("short")) \( t \) + Delta \/ 4 + O \( epsilon.alt \)$.
  ======= 2.8.2.4 Small capacities and the conclusion. <small-capacities-and-the-conclusion.>
  If $r < 1$ but $z_M \( r \) lt.eq nu_0$, the same no-slot estimate, using $e \( r \) = 1$, gives
  $ 1 - delta r lt.eq 1 - delta + 2 delta nu_0 . $
  If $z_P \( m \) lt.eq nu_0$, then $1 - 2 m lt.eq 6 kappa nu_0 lt.eq 6 nu_0$, and its count is at most $1 -
    delta + 6 delta nu_0$. Since $R_(upright("short")) \( t \) gt.eq 1 - delta$,
    choosing $nu_0$ within the prescribed $epsilon.alt$ preserves the short bound.
    Finally, $r = 1 \/ 2 - O \( epsilon.alt \)$ and $t gt.eq 1$ force $m gt.eq 1 \/ 2 - O \( epsilon.alt \)$,
    so the same unweighted plain estimate applies. No negative capacity is requested.
    Together with the cases requiring no selected primes, this proves the stated selected count after adding the
    finitely many subdivisions.
  Finally, use no prime slots and take $t = 1$. For the inverse side use Equation (2.200), including $e \( r \) =
    1$ for every $r lt.eq 1$; for the plain side use the zero-slot case of Lemma 59.
    The same short calculation with selection gain zero, that is, with $x = 0$ in the two comparison lines,
    gives $R_(upright("short")) \( 1 \) = 1 - 2 delta \/ 3$; the long bound is $L \( 1 \) = 1 - delta$.
    Neither input has a prime-supply hypothesis, proving the final assertion. ◻
]

#prodef([Remark 2.24.])[
  (Unselected inverse witnesses beyond the Part II bin ceiling).  The derivation of Equation (2.200) uses only the
    inverse spike from Proposition 29 and Lemma 58. It can therefore be repeated for any instance of the shared
    detector satisfying those hypotheses, independently of the current Part II bin ceiling.
    Consequently, for each fixed $t in \[ 1 \, 3 \/ 2 \]$, the bound in Equation (2.200) holds on each fixed
    presentation/dyadic subdivision of a fixed dynamic bin of retained rows with actual witnesses from that
    proposition whenever
  $ a > 51 \/ 100 \, wide 1 \/ 50 < delta = 2 a - 1 lt.eq 1 \, $
  and $r$ lies in the prescribed bounded nonnegative range.
    It uses the common inverse profile $W_(upright("base"))$, rowwise parameter bounds,
    and witness loss and height hypotheses used in the preceding proof, but requires neither $delta lt.eq
    alpha$ nor a prime-supply hypothesis. This conclusion does not include all rows in the floor bin $a =
    51 \/ 100$, which need not have an actual witness.
]

The formulas in Proposition 63 describe the only row exponents needed below.
  The cardinality factor $\( 1 + T_1 \)^(A_(cal(A)))$ is kept explicit here.
  We verify the additional target-dependent height ceiling required by Lemma 38.
  Let $epsilon.alt_(upright("ht")) > 0$ be the minimum of the finitely many detector height allowances already
  chosen with the real losses. For the fixed target, after the internal profile orders are fixed,
  let $A_(upright("ht") \, eta) gt.eq 0$ dominate their finitely many height orders. Set

$ tau_(0 \, eta) := frac(d_min epsilon.alt_(upright("ht")), 20 \( A_(upright("ht") \, eta) + 1 \)) > 0 . $

For $0 < tau lt.eq tau_(0 \, eta)$, $T_1 = Z^tau$, and sufficiently large $Z$, the inequality $U gt.eq Z^(d_min)$ gives

$ \( 1 + T_1 \)^(A_(upright("ht") \, eta)) lt.eq 2^(A_(upright("ht") \, eta))
  Z^(d_min epsilon.alt_(upright("ht")) \/ 20) lt.eq U^(epsilon.alt_(upright("ht")) \/ 10) . $

Thus this ceiling enforces all the preceding detector height hypotheses.
  It is fixed before the external tail order and $Z$; increasing that order changes only external test seminorms,
  not these internal height orders. Lemma 38 then makes the final height choice without changing the positive real
  margins or the slot mesh.

==== 2.9 The seven-eighths bound <sec:conclusion>

We complete the contradiction assumed in Part II. Recall from Equations (2.1) and (2.2) that

$ 0 < Delta = beta_(*) - 7 / 8 lt.eq 1 / 24 \, wide kappa = 3 / 4 + 2 Delta lt.eq 5 / 6 \, wide delta = 2 a -
  1 lt.eq kappa $

for every retained bin. The compensated low estimate is Proposition 50.
  For the same physical probe, we first normalize the principal term of its high expansion,
  then bound the remaining rows and verify the target-independent margins required by Proposition 3.

The geometry and Mellin exponent are

$ h = 13 / 16 \, wide ell = 1 / 6 \, wide l_x = 17 / 48 \, wide l_y = 23 / 48 \, wide h = 1 - l_x + ell \, $

$ C \( s \) = C_(upright("II")) \( s \) = s - 11 / 16 \, wide C \( 7 \/ 8 \) = 3 / 16 . $

These are the values in Equations (2.4) and (2.3). Write $s$ for the local variable called $x$ in Section 5;
  the amplitude ratio $x = q \/ delta$ below is a different real number.

Use Definition 32 with

$ cal(I)_eta \( Z \) = I_(eta \, upright("modified")) \( Z \) \, wide
  frak(H)_(eta \, u \, Z) \( s \, w \, z \) med upright("as in Equation ") upright("(2.44)") . $

In the shared analytic lemmas take $sigma_0 = 7 \/ 8$. Section 5 verifies every part of these data:
  Equation (2.48) is the absolutely convergent high identity for the independently defined finite expression in
  Equation (2.5), and the full correction is holomorphic in the two required Euler regions and satisfies
  Equation (1.104). The excluded set, physical row masks, and calibration are unchanged.
  In particular there is no additional Euler factor outside this full correction.
  Its scalar denominator is $L_F^S \( s \, eta overline(chi_bullet \( u \)) \)$,
  and its Gaussian is $Phi \( s + z - 1 \)$.

In the estimates below, $0 < e < 10^(- 3)$ is an admissible detector width.
  Its final choice, together with the remaining real losses, is made in the concluding order of choices.

===== 2.9.1 The principal normalizer <sec:principal-signal>

We verify the two correction hypotheses of Lemma 36. First, Equation (2.55) gives

$ \| frak(H)_(eta \, 1 \, Z) \( s \, w \, z \) \| lt.double Z^(ell Re z) $

uniformly in all imaginary parts on every fixed real box in the second Euler region.
  In particular this holds on the entire rectangle in Equation (1.116), with height degree zero.
  This is a bound for the full tuple correction.

For the residue value, define

$ S_i \( Z \) = sum_(p in cal(P)_i \( Z \)) W_i \( q_p \/ P_i \) q_p^(- 5 \/ 6) \, wide P_i = Z^(ell_i) . $

Lemma 41, including its assertion about deletion of a fixed finite set, gives

$ S_i \( Z \) tilde.op frac(P_i^(1 \/ 6), \| T \| log P_i) integral_0^oo W_i \( y \) y^(- 5 \/ 6) thin d y . $

Each leading constant is positive. Since the slot count is fixed,
  all $S_i \( Z \)$ are positive for every sufficiently large $Z$,
  with a common lower threshold allowed to depend on the fixed data. Set

#[#set math.equation(numbering: n => "(2.205)")
 $ A_T \( Z \) = \( - 1 \)^K Z^(- ell \/ 6) product_(i = 1)^K S_i \( Z \) . $ <eq:principal-scalar>]

Using $log P_i = ell_i log Z$ and $sum_i ell_i = ell$, we obtain

$ A_T \( Z \) tilde.op frac(\( - 1 \)^K, \| T \|^K \( log Z \)^K) product_(i = 1)^K {1 /
  ell_i integral_0^oo W_i \( y \) y^(- 5 \/ 6) thin d y} . $

Consequently $A_T \( Z \) eq.not 0$ on that range and

$ \| A_T \( Z \) \| asymp_(T \, K \, \( ell_i \, W_i \)) \( log Z \)^(- K) \,
  wide \| A_T \( Z \) \|^(- 1) lt.double_epsilon.alt Z^epsilon.alt $

for every $epsilon.alt > 0$. The lower threshold may depend on the target’s finite excluded set;
  no uniform prime asymptotic in a moving ray conductor is being used.

On the principal second Euler region, Section 5 defines $cal(B)_p = G_p \/ H_p$ with $H_p eq.not 0$,
  and Equation (2.54) gives $cal(B)_p = - 1 + O \( q_p^(- 7 \/ 8) \)$,
  uniformly in all imaginary parts and target unit phases. Apply the principal factorization in Equation (2.53) at
  $w = 1 \, z = 1 \/ 6$, where it remains valid even if the original quotient by $P_p$ was undefined. It gives

$ frak(H)_(eta \, 1 \, Z) \( s \, 1 \, 1 \/ 6 \) = H_eta \( s \) product_(i = 1)^K
  (sum_(p in cal(P)_i \( Z \)) W_i \( q_p \/ P_i \) q_p^(- 5 \/ 6) cal(B)_p) \, $

where $H_eta$ is the function in Equation (1.101) for this same excluded set $S$.
  By nonnegativity of $W_i$, its $i$th slot equals

$ - S_i \( Z \) { 1 + rho_i \( s \) } \, wide \| rho_i \( s \) \| lt.double P_i^(- 7 \/ 8)
  quad \( Re s = beta_(*) + e \, med Im s in bb(R) \) . $

Indeed the sum of the absolute local errors is at most a fixed multiple of $P_i^(- 7 \/ 8) S_i \( Z \)$.
  Choose any pretarget number

$ 0 < kappa_P < 7 / 8 min_i ell_i . $

Since $K$ is fixed, $cal(R)_(eta \, Z) \( s \) := product_i \( 1 + rho_i \( s \) \) -
  1$ satisfies $\| cal(R)_(eta \, Z) \( s \) \| lt.double Z^(- kappa_P)$ on that entire line.
  Thus the exact residue correction is

$ frak(H)_(eta \, 1 \, Z) \( s \, 1 \, 1 \/ 6 \) = H_eta \( s \) Z^(ell \/ 6) A_T \( Z \) { 1 +
  cal(R)_(eta \, Z) \( s \) } \, $

which is Equation (1.117) with $A_eta = A_T$ and $mu = kappa_P$.
  This factorization is asserted only at the principal residue; it is not the correction used for general contour moves.

Let $c_S > 0$ be the scalar in Equation (1.101), whose positivity is part of Lemma 36.
  For sufficiently large $Z$, define the normalized physical probe

$ J_(upright("II") \, eta) \( Z \) = frac(I_(eta \, upright("modified")) \( Z \), c_S A_T \( Z \)) . $

This is distinct from $J_(upright(I) \, eta)$, and both its numerator and normalizer are independent of the
  analysis height $T_1$. Proposition 50 and the subpower bound for $A_T^(- 1)$ give, for every $epsilon.alt > 0$,

#[#set math.equation(numbering: n => "(2.206)")
 $ \| J_(upright("II") \, eta) \( Z \) \| lt.double_(eta \, epsilon.alt) Z^(C \( 7 \/ 8 \) + epsilon.alt) .
   $ <eq:part-II-normalized-low>]

The same scalar is used for the high comparison.

Choose the fixed cutoff as required for Equation (1.102).
  The associated $H_eta$ is holomorphic on $Re s > 7 \/ 8$, satisfies the contraction there,
  and uses this same $S$. Let $cal(P)_(upright("II") \, eta)$ denote the $u = 1$ term of Equation (2.48), and set

$ f_(upright("II") \, eta) \( Z \) = frac(1, 2 pi i) integral_(\( 2 \)) Z^(C \( s \)) e^(\( s - 5 \/ 6 \)^2)
  frac(H_eta \( s \), L_F^S \( s \, eta \)) thin d s . $

All hypotheses of Lemma 36 have now been verified with $sigma_0 = 7 \/ 8$. Its remainder estimate is

$ lr(|frac(cal(P)_(upright("II") \, eta) \( Z \), c_S A_T \( Z \)) - f_(upright("II") \, eta) \( Z \)|)
  lt.double  & Z^(C \( beta_(*) \) + \( 1 + h \) e - m_w + epsilon.alt) + Z^(C \( beta_(*) \) + e - m_z + epsilon.alt)\
 & + Z^(C \( beta_(*) \) + e - kappa_P + epsilon.alt) \, $

where the two geometric margins are

#[#set math.equation(numbering: n => "(2.207)")
 $ m_w := l_y / 20 = 23 / 960 \, wide m_z := h / 600 = 13 / 9600 . $ <old-eq:5.14>]

Lemma 36 includes the residue paths, the scalar Jacobian, and the rightward shift of the main integral.
  In particular the last term is the error estimated on its original global line;
  it is not part of $f_(upright("II") \, eta)$. Both this signal and the physical probe are independent of $T_1$.

===== 2.9.2 The compensated high exponent <the-compensated-high-exponent>

The low estimate and the principal-row comparison now concern the functions $J_(upright("II") \, eta)$ and
  $f_(upright("II") \, eta)$ required by the continuation criterion. It remains to prove, for a common $sigma > 0$,

$ lr(|frac(I_(eta \, upright("modified")) \( Z \) - cal(P)_(upright("II") \, eta) \( Z \), c_S A_T \( Z \))|)
  lt.double_eta Z^(C \( beta_(*) \) - sigma) . $

We estimate these nonprincipal contributions first relative to the raw scale $Z^(C \( 7 \/ 8 \))$.
  Division by $c_S A_T \( Z \)$ costs an arbitrarily small power, reserved once in the final choice of margins.

#thm([Lemma 2.25.])[
  (A high exponent for one row bin).  #emph[Let $0 < d_min < d_max < oo$, let $U = Z^d$ with $d_min lt.eq d lt.eq
    d_max$, and let $cal(B)$ be the finite set of retained nonprincipal physical rows $q_u asymp
    U$ in one fixed dynamic bin $\( i \, a \)$. Put $delta = 2 a - 1$.
    Assume the bin and height hypotheses of Lemmas 27, 28, and 62, with $0 < e < 10^(- 3)$, $T_1 = Z^tau > 2$,
    $0 < tau lt.eq d_min \/ 100$, and the cumulative allocation in Equation (1.113).
    The bounded real ranges, the positive losses $e \, theta.alt \, epsilon.alt$,
    and the slot system are fixed before the target.]
  #emph[For each retained tuple of external parameters and each subset of error slots,
    partition $cal(B)$ pointwise into the amplitude sets of Section 8.1,
    and into the witness subdivisions of Section 8.2 when a witness count is used.
    Suppose each such set $cal(C)$ has main-slot mean $q in \[ 0 \, delta \/ 2 \]$, as in Equation (2.198), and
$ \# cal(C) lt.double_(cal(A) \, epsilon.alt) U^(R + epsilon.alt) \( 1 + T_1 \)^(A_(cal(A))) \, $

 uniformly in the retained tuple and moving labels. The occurring $R \,
   q$ range over a fixed bounded set and may depend on the pointwise set, $d \, a$, and $beta_(*)$,
   but not otherwise on the target. For each occurring pair define
#[#set math.equation(numbering: n => "(2.208)")
 $ E \( d \) & = a - 7 / 8 + h (17 / 50 - 1 / 6) - a l_y - \( 1 - a \) ell - \( delta \/ 2 - q \) ell +
   d (R + delta / 2 - 17 / 50)\
 & = C_0 + 2 / 3 delta + q / 6 - h \( 1 - R \) + \( d - h \) (R + delta / 2 - 17 / 50) \, wide C_0 = - 1 /
   48 . $ <eq:common-high-exponent>]

 If $cal(B) eq.not diameter$, let $E_(max \, Z) \( d \)$ be the supremum of these values over all pointwise sets
   at all retained tuples.]
  #emph[On the central contours
$ Re s = a + 16 e \, wide Re w = 1 - a - 6 e \, wide Re z = 17 / 50 \, $

 the contribution of the original fixed dynamic-bin sum is bounded by
$ Z^(C \( 7 \/ 8 \) + E_(max \, Z) \( d \) + O \( e + theta.alt + epsilon.alt \)) \( 1 + T_1 \)^(A'_(cal(A))) \, $

 where $theta.alt$ is the amplitude-bin width and $A'_(cal(A)) < oo$ is uniform in moving labels.
   An empty bin contributes zero. The constant in the $O \( e + theta.alt + epsilon.alt \)$ term depends only on
   the bounded real ranges and the fixed slot system, not on the target.
   No separate integral of an individual pointwise set is asserted.
   After fixing $tau > 0$, all discarded external pieces and joins are $O_(cal(A) \, N) \( Z^B T_1^(- N) \)$,
   for a fixed $B$ and every fixed $N$.]
] <lem:high-bin>

#proof[
  We verify the central hypothesis of Lemma 35, which supplies the contour move and its tails for the full
    correction just specified. Its bin ceiling holds by Equation (2.2).
    The physical $Im z$ coordinate is included in its height allocation because it enters the prime profiles.
    The other witness, dyadic, and prime-annulus coordinates are the fixed finite list used in the estimates of
    Section 8.2. Their complete pointwise bounds include the discarded auxiliary integrals on global or absolute
    lines. Thus the single cumulative allocation in Equation (1.113) applies,
    without renewing an allowance at a later estimate.
  Only on the retained contours, Proposition 51 gives the decomposition in Equation (2.51).
    For $I subset.eq { 1 \, dots.h \, K }$, its summand is
  $ frak(H)_(eta \, u \, Z)^(\( I \)) = cal(H)_(eta \, u) \( s \, w \, z \) product_(i in I) cal(D)_i \( u \)
    product_(i in.not I) cal(Q)_i \( u \; z \) . $
  The required reflected primitive numerator bound follows from the buffered estimate for the numerator
    presentation and its conjugate, together with Lemma 14, as verified before Proposition 51.
    The retained $w$ heights lie in its allowed set. Every retained numerator is nonprincipal.
  Fix one amplitude set at one retained tuple. For a main slot, $cal(Q)_i = -
    P_i^(z - 1 \/ 2) Q_i$ and $\| Q_i \| lt.eq P_i^(g_i + theta.alt)$. Assign $g_i = 0$ to an error slot.
    Equation (2.50) bounds all error slots in $I$ jointly with the numerator;
    its proof uses the actual conductor deficit in Equation (2.52) simultaneously for the distinct strict ramified
    labels. It is not a separate numerator allowance for each slot.
    Since $cal(H)_(eta \, u) lt.double_epsilon.alt U^epsilon.alt$, multiplication of these estimates gives,
    after choosing the preliminary powers,
  $ lr(|L^S \( w \, chi_bullet \( u \) \) frak(H)_(eta \, u \, Z)^(\( I \)) \( s \, w \, z \)|) lt.double  &
    U^(delta \/ 2 + O \( e \) + epsilon.alt) \( 1 + T_1 \)^(A_1)\
 & dot.op Z^(ell \( 17 \/ 50 - 1 \/ 2 \) + q ell + O \( e + theta.alt + epsilon.alt \)) . $
  Here $A_1 < oo$ is a fixed height order for the target and slot system, and $sum_i ell_i g_i = q ell$,
    including the assigned zeros for the errors. No lower bound on an error slot has been used.
  Multiplying by the assumed cardinality proves Equation (1.112) with $g = q ell$,
    after taking $epsilon_c$ to be a fixed sufficiently large multiple of $e + theta.alt + epsilon.alt$.
    This multiple depends only on the fixed slot system and the bounded real ranges.
    There are $2^K$ error subsets. The number of amplitude vectors is fixed,
    and the witness dyadic choices contribute only a fixed power of $1 + log Z$.
    Thus the required pointwise multiplicity bound holds. These sets are formed only after Lemma 35 has moved the
    original dynamic-bin sum using $frak(H)$. They are not used for continuation and are not integrated separately.
  Apply Lemma 35 with $sigma_0 = 7 \/ 8$ and $g = q ell$. Its exponent in Equation (1.114) is
  $ a - 7 / 8 + h (17 / 50 - 1 / 6) - a l_y - ell / 2 + q ell + d (R + delta / 2 - 17 / 50) . $
  Because $- \( 1 - a \) ell - \( delta \/ 2 - q \) ell = - ell \/ 2 + q ell$,
    this is the first line of Equation (2.208). Substituting the geometry and $a = \( 1 + delta \) \/
    2$ gives its second line. In particular $q ell = q \/ 6$ is a base-$Z$ exponent, not $d q \/ 6$.
    The explicit errors in Equation (1.115) are $O \( e + theta.alt + epsilon.alt \)$ on the bounded $d$-range
    after the remaining preliminary powers are chosen. Its supremum is exactly the one in the statement.
    Lemma 35 also gives the stated external tails with a scale degree fixed before $N$. ◻
]

The floor bin $a = 51 \/ 100$ has $delta_0 = 1 \/ 50$ and requires no zero witness.
  The ideal count $R = 1$, together with $q lt.eq delta_0 \/ 2$, gives

#[#set math.equation(numbering: n => "(2.209)")
 $ E \( h \) lt.eq C_0 + 3 / 4 delta_0 = - 7 / 1200 < 0 . $ <eq:floor-bound>]

Its frequency slope $R + delta_0 \/ 2 - 17 \/ 50$ is positive, so this bounds every $d lt.eq h$.
  A small extension above $h$ will be controlled below.

===== 2.9.3 Small and large row norms <sec:tails>

Set $d_min = 1 \/ 100$. Lemma 52 bounds the positive sum of the full selected tuples,
  with every $G_p$ retained before taking absolute values. On the small-row lines

$ Re s = beta_(*) + e \, wide Re w = 1 \/ 2 \, wide Re z = 17 \/ 50 $

Equation (2.56) gives

$ \| frak(H)_(eta \, u \, Z) \( s \, w \, z \) \| lt.double_epsilon.alt U^epsilon.alt product_i P_i^(17 \/ 50) =
  U^epsilon.alt Z^(17 ell \/ 50) \, $

uniformly in all imaginary parts. This is Equation (1.119), with height degree zero.
  It remains valid at zeros of individual local factors. The data for Lemma 37 were already verified above,
  so it applies to every physical row $u eq.not 1$ in these dyads.
  Its classification includes nontrivial unit numerators and permits a principal denominator;
  no detector witness or selected moment is used here.

The $d$-independent part of the relative exponent is

#[#set math.equation(numbering: n => "(2.210)")
 $ h (17 / 50 - 1 / 6) - l_y / 2 = - 79 / 800 . $ <eq:small-frequency-margin>]

The row exponent in Equation (1.120) is $63 \/ 50 < 2$. Thus the small dyadic sum in Equation (1.121),
  measured relative to $C \( beta_(*) \)$, has exponent at most

$ - 79 / 800 + 2 d_min + O \( e + epsilon.alt \) = - 63 / 800 + O \( e + epsilon.alt \) . $

It is negative after the adjustable real losses are made sufficiently small.
  Write $m_(upright("small")) := 63 \/ 800$ for this fixed error-free saving.

For the large rows, fix $z_oo > 2$. On $\( Re s \, Re w \, Re z \) = \( 2 \, 2 \, z_oo \)$,
  the same Equation (2.56) gives

$ \| frak(H)_(eta \, u \, Z) \( s \, w \, z \) \| lt.double_epsilon.alt U^epsilon.alt Z^(ell z_oo) $

for every physical row and all imaginary parts. This verifies Equation (1.122).
  Lemma 37 therefore gives, with $B_0 = l_x \/ 2 + 1 + l_y = 53 \/ 32$,

$ \| cal(R)_eta \( U \; Z \) \| lt.double Z^(B_0 + h z_oo + epsilon.alt) U^(1 + epsilon.alt - z_oo) \, $

and, for every fixed $zeta > 0$ after choosing $0 < epsilon.alt < z_oo - 1$,

$ sum_(U > Z^(h + zeta)) \| cal(R)_eta \( U \; Z \) \| lt.double
  Z^(B_0 + \( h + zeta \) \( 1 + epsilon.alt \) - zeta z_oo + epsilon.alt) . $

Here $cal(R)_eta$ is the row contribution of Lemma 37 for the present physical expression.
  A fixed sufficiently large $z_oo$ makes the last exponent as negative as required.
  It is chosen after $zeta$ but before the target. These invocations use the quotient-free tuple bounds in
  Section 5, not the central main/error factorization.

===== 2.9.4 The endpoint inequality <sec:adaptive-endpoint>

We next bound $E \( h \)$, first without adjustable losses or height factors.
  They will be restored with a quantified order of choices. Recall

$ kappa = 3 / 4 + 2 Delta \, wide alpha = 5 / 6 . $

At the live upper endpoint $delta = alpha$, take $t = 3 \/ 2$ in Proposition 29.
  Then $r gt.eq 1 - O \( epsilon.alt \)$. Apply the no-slot amplified estimate in Equation (2.200) on both sides
  of $r = 1$. For $r gt.eq 1$, its exponent is

$ 1 - alpha + \( alpha - delta \) r = 1 - delta . $

For $r < 1$ in the stated $O \( epsilon.alt \)$ neighborhood, the same estimate uses $e \( r \) = 1$,
  so its exponent is $1 - delta r lt.eq 1 - delta + O \( epsilon.alt \)$.
  The fixed amplification margin is independent of this neighborhood.
  Thus no selected primes are needed and the ideal row exponent is $R = 1 - delta$.
  Using $q lt.eq delta \/ 2$ in Equation (2.208) gives

#[#set math.equation(numbering: n => "(2.211)")
 $ E \( h \) lt.eq C_0 + (3 / 4 - h) delta + O \( epsilon.alt \) = - 1 / 48 - delta / 16 +
   O \( epsilon.alt \) < 0 . $ <eq:large-delta-endpoint>]

Now assume $1 \/ 50 < delta < alpha$. Put $x = q \/ delta in \[ 0 \, 1 \/ 2 \]$, and use $D_x \, P_x \,
  R_(upright("short")) \, L$ from Proposition 63. The parameter $kappa$ remains the dynamic value $3 \/ 4 +
  2 Delta$, not the upper bound $5 \/ 6$. Thus the actual plain capacity used in that Proposition is

$ z_P \( m \) = frac(1 - 2 m, 6 kappa) = frac(1 - 2 m, 9 \/ 2 + 12 Delta) \, $

as in Equation (2.199). The comparison in Equation (2.203) is for this exact capacity and raises the row exponent
  by at most $Delta \/ 4$, apart from requested small losses. Define

#[#set math.equation(numbering: n => "(2.212)")
 $ cal(J) = \( alpha - delta \) D_x + delta P_x \, wide t = 1 + frac(delta P_x, 2 cal(J)) \, wide R_(*) =
   L \( t \) . $ <eq:target-cutoff>]

The denominator is positive. Indeed

$ 37 / 18 lt.eq D_x lt.eq 3 \, wide 7 / 9 lt.eq P_x lt.eq 2 \, wide D_x - P_x = 1 + x - frac(8 x^2, 9) > 0 \, $

and consequently

$ 35 / 54 lt.eq cal(J) lt.eq 5 / 2 . $

Because $0 < delta < alpha$, one has $cal(J) > delta P_x > 0$, so $1 < t < 3 \/ 2$. Furthermore,

$ D_x { R_(upright("short")) \( t \) - L \( t \) } = delta P_x \( 3 \/ 2 - t \) - \( alpha - delta \)
  D_x \( t - 1 \) = frac(delta P_x, 2) - cal(J) \( t - 1 \) = 0 . $

Thus $R_(*) = R_(upright("short")) \( t \) = L \( t \)$ and this $t$ balances the two counts.
  The formulas also have the stated closed-endpoint values:
  at $delta = alpha$, one has $cal(J) = alpha P_x$, $t = 3 \/ 2$, and $R_(*) = R_(upright("short")) \( 3 \/ 2 \) =
  L \( 3 \/ 2 \) = 1 - delta$. The corresponding crossing has $r_(*) \( 3 \/ 2 \) = 1$,
  so its inverse capacity is zero. The preceding equality argument uses Equation (2.200) at that boundary,
  not a marked estimate with a vanishing margin.

#thm([Lemma 2.26.])[
  (Compensated endpoint certificate).  #emph[For $0 lt.eq delta lt.eq 5 \/ 6$ and $0 lt.eq x lt.eq 1 \/ 2$,
    define $cal(J) \, t \, R_(*)$ by Equation (2.212) where $cal(J) > 0$, and let $E_(*)$ be $E \( h \)$ with $q =
    x delta$ and $R = R_(*)$. Then
$ - E_(*) gt.eq 49 / 440640 > 1 / 10000 . $

 In particular the bound is uniform on the range $1 \/ 50 < delta lt.eq 5 \/ 6$, including the closed endpoint.]
] <lem:balanced-endpoint>

#proof[
  Set $y = 1 \/ 2 - x in \[ 0 \, 1 \/ 2 \]$ and $v = 51 + 41 y$. To verify the calculation, write
  $ p_y = 7 + 18 y + 8 y^2 \, wide j_y = 185 + 170 y + \( - 138 + 12 y + 96 y^2 \) delta . $
  Then
  $ D_x = frac(37 + 34 y, 18) \, wide P_x = p_y / 9 \, wide cal(J) = j_y / 108 . $
  From $R_(*) = 1 - delta + \( alpha - delta \) delta P_x \/ \( 2 cal(J) \)$ and Equation (2.208),
  $ - E_(*) = frac(1 + \( 3 + 8 y \) delta, 48) - 13 / 32 thin frac(\( 5 \/ 6 - delta \) delta P_x, cal(J)) . $
  Multiplying out gives the explicit quadratic
  $ 10368 cal(J) \( - E_(*) \) & = 2 j_y \[ 1 + \( 3 + 8 y \) delta \] - 468 \( 5 \/ 6 - delta \) delta p_y\
 & = 10 \( 37 + 34 y \) - 8 \( 237 + 377 y + 26 y^2 \) delta\
 & #h(12mm)  + 48 \( 51 + 131 y + 94 y^2 + 32 y^3 \) delta^2 . $
  Multiplication by $v$ and completion of the square yields
  #[#set math.equation(numbering: n => "(2.213)")
   $ 10368 v cal(J) \( - E_(*) \) =  & \( 3 + 5 y \) { \( 4 v delta - 79 \)^2 + 49 #scale(x: 120%, y: 120%)[}]\
 & + 4 y { 4 v delta \[ \( 1 + 3 y \) \( 15 + 32 y \) delta + 9 - 13 y \] + 265 +
   3485 y #scale(x: 120%, y: 120%)[}] . $ <eq:balanced-endpoint-certificate>]
  This identity can also be checked by coefficients: expansion of its right side as a polynomial in $delta$ gives
    respectively
  $ & 10 v \( 37 + 34 y \) \,\
 & - 8 v \( 237 + 377 y + 26 y^2 \) \,\
 & 48 v \( 51 + 131 y + 94 y^2 + 32 y^3 \) \, $
  which are the constant, linear, and quadratic coefficients in the preceding display multiplied by $v$.
  Every term on the right of Equation (2.213) is nonnegative: $y \, delta gt.eq 0$ and $9 - 13 y gt.eq 5 \/ 2$.
    The first line is at least $49 \( 3 + 5 y \)$, while $v = 51 + 41 y lt.eq 17 \( 3 + 5 y \)$. Hence
  $ - E_(*) gt.eq frac(49, 176256 cal(J)) gt.eq 49 / 440640 > 1 / 10000 \, $
  using $cal(J) lt.eq 5 \/ 2$. ◻
]

The lower bounds for $D_x$ and $cal(J)$ bound all derivatives of the crossing and cutoff on the compact parameter
  ranges. The saturation losses are uniform because $delta gt.eq 1 \/ 50$,
  and the inverse selection has the explicit supply and width margins proved in Proposition 63.
  At a zero capacity its unweighted bound differs from $1 -
  delta$ by at most a constant times the chosen capacity decrement.
  Since $R_(*) gt.eq 1 - delta$, these cases obey the same comparison.
  Thus all detector, bin, and rounding errors have a total $O \( epsilon.alt \)$ with a target-independent
  constant once their individual requested losses are at most $epsilon.alt$.
  Let $E_(upright("actual")) \( h \)$ denote the scale exponent relative to $C \( 7 \/ 8 \)$ after the observed
  row bound $R lt.eq R_(*) + Delta \/ 4 + epsilon.alt_(upright("row"))$ is inserted.
  For now the explicit height factors remain outside this exponent.
  The coefficient of $R$ in Equation (2.208) is $d$, so at $d =
  h$ the capacity replacement contributes $h Delta \/ 4$. Denote by $epsilon.alt_(upright("total"))$ the sum of $h
  epsilon.alt_(upright("row"))$ and all other adjustable real losses;
  the preceding uniformity makes it arbitrarily small with a target-independent coefficient.
  The certificate gives the comparison actually needed:

#[#set math.equation(numbering: n => "(2.214)")
 $ E_(upright("actual")) \( h \) - Delta & lt.eq - 49 / 440640 - (1 - h / 4) Delta + epsilon.alt_(upright("total"))\
 & = - 49 / 440640 - 51 / 64 Delta + epsilon.alt_(upright("total")) . $ <eq:adaptive-endpoint>]

The subtraction of $Delta = C \( beta_(*) \) - C \( 7 \/ 8 \)$ is essential:
  the certificate is not a claim that $E_(upright("actual")) \( h \) < 0$ for every $Delta$.
  When the height factors are converted to a reserved exponent allowance below,
  that allowance is added to $epsilon.alt_(upright("total"))$.

===== 2.9.5 Frequency ranges <frequency-ranges>

For $1 \/ 2 lt.eq d lt.eq h$, the available length is

$ ell / d gt.eq 8 / 39 > 1 / 5 > 7 / 37 . $

Passing from base $Z$ to base $U$ changes a slot length from $ell_i$ to $ell_i \/ d lt.eq 2 ell_i$,
  so one mesh chosen with this factor of two satisfies the moment requirement throughout the interval. If

$ 0 < zeta < 5 ell - h = 1 / 48 \, $

then for $h < d lt.eq h + zeta$ the supply remains greater than $1 \/ 5$, whose margin above $7 \/ 37$ is $2 \/ 185$.

For $1 \/ 50 < delta < alpha$, use the ideal row upper exponent $R = R_(*) + Delta \/ 4$.
  For $delta = alpha$, use $R = 1 - delta$. Both are at least $1 - delta$, so

$ R + delta \/ 2 - 17 / 50 gt.eq 33 / 50 - delta / 2 gt.eq 4 / 25 > 0 . $

The floor has a positive slope as well. Thus $d = h$ bounds all these exponents for $d lt.eq h$.
  The cost of extending to $h + zeta$ is at most $2 zeta$: indeed

$ R_(*) lt.eq 1 - delta + frac(alpha - delta, 2) lt.eq 17 / 12 \, wide R_(*) + Delta \/ 4 lt.eq 139 / 96 \, $

and $139 \/ 96 + 1 \/ 2 - 17 \/ 50 < 2$. The slopes at $delta = alpha$ and floor cases are smaller than two.

For $d_min lt.eq d lt.eq 1 \/ 2$ and $delta lt.eq alpha$, choose $t = 1$ and use no selected primes.
  Proposition 63 gives the ideal exponent $1 - 2 delta \/ 3$ outside the floor. Use the slightly larger common exponent

$ R = 76 / 75 - 2 / 3 delta . $

At $delta = 1 \/ 50$ it equals one, so it also covers the floor.
  Its slope is $101 \/ 150 - delta \/ 6 > 0$ on this range. Using $q lt.eq delta \/ 2$ in Equation (2.208) yields

#[#set math.equation(numbering: n => "(2.215)")
 $ E \( d \) lt.eq E \( 1 \/ 2 \) + O \( epsilon.alt \) lt.eq - 529 / 2400 + 25 / 96 delta +
   O \( epsilon.alt \) lt.eq - 49 / 14400 + O \( epsilon.alt \) < 0 . $ <eq:adaptive-intermediate>]

The middle expression follows by substituting $d = 1 \/ 2$, $R = 76 \/ 75 - 2 delta \/ 3$, and $q = delta \/ 2$;
  the last inequality uses $delta lt.eq 5 \/ 6$. At $delta = alpha$,
  the count used in Equation (2.211) and its positive slope already control every $d lt.eq h$.
  Together with Section 9.3, these cases cover every physical row norm.
  Only $d gt.eq 1 \/ 2$ uses selected physical prime factors in a row moment;
  every physical slot remains in the high correction in all ranges.

To compare with $C \( beta_(*) \)$, subtract $C \( beta_(*) \) - C \( 7 \/ 8 \) = Delta$ from each ideal exponent.
  In the adaptive range this is precisely the comparison in Equation (2.214);
  its only positive capacity allowance is $h Delta \/ 4$. The other endpoint ranges have nonpositive ideal
  exponents before subtracting $Delta$. Thus all of them retain the target-independent main high margin

$ m_(upright("hi")) := (1 - h / 4) Delta = 51 / 64 Delta . $

The low exponent has margin $m_(upright("lo")) := Delta$.
  The principal contour and approximation margins were established in Section 9.1; we now choose all losses together.

===== 2.9.6 Order of choices and conclusion <order-of-choices-and-conclusion>

We finish by separating the target-independent real choices from the target-dependent height and external test
  orders. The numerical choices remain part of this application; the final height selection is supplied by Lemma 38.

#thm([Proposition 2.27.])[
  (Order of choices).  #emph[Under the contradiction in Equation (2.1), there are numbers
$ 0 < omega < Delta \, wide sigma > 0 $

 and a fixed geometry, moment losses, capacity decrements, slot system, amplitude width, bin width $e > 0$,
   and extension $0 < zeta < 1 \/ 48$, all chosen before the target character, with the following property.
   For every primitive finite-order target $eta$, one can then choose its fixed arithmetic data,
   a positive height exponent $tau_eta$, a finite external tail order $N_eta$,
   and a lower threshold $Z_(0 \, eta)$ such that, for $Z gt.eq Z_(0 \, eta)$,
$ \| J_(upright("II") \, eta) \( Z \) \| lt.double_eta Z^(C \( 7 \/ 8 \) + omega) \,
  wide \| J_(upright("II") \, eta) \( Z \) - f_(upright("II") \, eta) \( Z \) \| lt.double_eta
  Z^(C \( beta_(*) \) - sigma) . $

 The exponents $omega \, sigma$ do not depend on $eta$. The cutoff $T_1 =
   Z^(tau_eta)$ occurs only in the estimates, not in either function.]
] <prop:parameter-order>

#proof[
  The ideal margins are
  $ m_(upright("lo")) = Delta \, wide m_(upright("hi")) = 51 / 64 Delta \, wide m_(upright("high")) :=
    min { m_(upright("hi")) \, m_(upright("small")) } > 0 . $
  The principal contour margins are $m_w \, m_z$ in Equation (2.207).
    Reserve one half of each of $m_(upright("lo")) \, m_(upright("high")) \, m_w \, m_z$.
    On the compact real parameter ranges, the coefficients multiplying all requested detector, moment, capacity,
    and rounding losses are bounded independently of the target.
    Indeed, $delta gt.eq 1 \/ 50$, $D_x gt.eq 37 \/ 18$, and $cal(J) gt.eq 35 \/ 54$;
    the dyadic lengths are bounded, and Proposition 63 gives fixed inverse width and supply margins.
    The equality $delta = alpha$ uses the separate no-slot bound above.
    Choose the moment losses and capacity decrement so that their total cost in the high exponent is less than
    $m_(upright("high")) \/ 8$.
  Let $eta_(upright("mesh")) > 0$ be the mesh supplied by Lemma 59 for these losses and bounded real ranges.
    Its uniform assertion on $\[ 3 \/ 4 \, 1 \]$ applies in particular to the compact closure $kappa
    in \[ 3 \/ 4 \, 5 \/ 6 \]$ used here, and the mesh is independent of the number of slots.
    Only the eventual seminorm and height orders may depend on a fixed slot count.
    Let $b_(upright("round")) > 0$ be small enough that a squared-spike rounding loss below
    $b_(upright("round"))$, after the bounded changes of exponent base,
    costs less than $m_(upright("high")) \/ 8$. Choose a fixed even integer $K$ with
  $ frac(2 ell, K) < min {eta_(upright("mesh")) \, b_(upright("round")) \, 1 / 185} \, wide ell_i = ell /
    K quad \( 1 lt.eq i lt.eq K \) . $
  These positive lengths sum to $ell$ and are independent of the target and $Z$. Put $P_i = P = Z^(ell \/ K)$.
    For $1 lt.eq i lt.eq K$, set
  $ I_i = (1 + frac(2 i - 1, 2 K + 1) \, thin 1 + frac(2 i, 2 K + 1)) subset \( 1 \, 2 \) $
  and choose a nonnegative, nonzero $W_i in C_c^oo \( I_i \)$. The intervals have positive gaps.
    Hence their underlying prime windows are disjoint for every $Z$, before the ray, excluded-set,
    or row masks are imposed. Equation (2.5) keeps each window at its original scale in every summand.
  For each selected row range, $U = Z^d$ has $d gt.eq 1 \/ 2$, so
  $ w_i = ell_i / d lt.eq frac(2 ell, K) < eta_(upright("mesh")) \, wide delta max_i w_i lt.eq
    frac(2 ell, K) < b_(upright("round")) . $
  The second inequality uses $delta lt.eq 5 \/ 6 < 1$. The total available length remains $ell \/ d$.
    For $d lt.eq h$ it is at least $8 \/ 39$, exceeding $7 \/ 37$ by $23 \/ 1443$.
    For $h < d lt.eq h + zeta$ with $zeta < 1 \/ 48$, it exceeds $1 \/ 5$,
    whose excess over $7 \/ 37$ is $2 \/ 185$. Thus every selected inverse capacity and the smaller plain capacity
    are supplied. The extra bound $2 ell \/ K < 1 \/ 185$ is below half the latter gap.
    A zero-capacity neighborhood, including the equality endpoint, uses the no-slot moment.
    Actual annular ratios change nominal lengths by $O_K \( 1 \/ log U \)$,
    absorbed by the fixed strict margins at a sufficiently large threshold.
  The internal centered amplifier also stays separated from these windows.
    Write $sigma_(upright("width"))$ for the width decrement denoted $sigma$ in the proof of Lemma 59.
    That proof uses the pool exponent $ell_(*) = sigma_(upright("width")) \/
    3$ and a mesh below $sigma_(upright("width")) \/ 6$. At base $U$,
    every live physical slot has norm at most $2 U^(eta_(upright("mesh")))$,
    whereas the pool begins at $U^(ell_(*)) \/ 2$. Their fixed exponent gap makes these sets disjoint for all
    sufficiently large $U$, uniformly in the selected $d$-range. The marked inverse moment has no mesh condition.
  The normalizer in Equation (2.205) is nonzero for this actual choice.
    Put $c_i = integral_0^oo W_i \( y \) y^(- 5 \/ 6) thin d y > 0$.
    The asymptotic already proved in Section 9.1 specializes to
  $ S_i \( Z \) tilde.op frac(P^(1 \/ 6) c_i, \| T \| log P) > 0 \, wide
    A_T \( Z \) tilde.op (frac(K, \| T \| ell))^K (product_i c_i) \( log Z \)^(- K) > 0 . $
  The sign uses even $K$. Any later fixed excluded set affects only the common lower threshold,
    since its primes eventually leave all these windows. Choose
  $ kappa_P = 7 / 16 ell / K = frac(7, 96 K) \, wide 0 < kappa_P < 7 / 8 min_i ell_i = frac(7, 48 K) \, wide
    m_P := kappa_P . $
  Thus the principal approximation has a positive margin chosen before the target.
    The number of subsets, the seminorms of the narrow windows,
    and their finite height orders may depend on this fixed $K$.
  Choose the amplitude width, the remaining power losses, and $e$ so that their total high cost is less than
    $m_(upright("high")) \/ 8$, and so that
  $ \( 1 + h \) e + epsilon.alt_(upright("pr")) < m_w \/ 4 \, wide e + epsilon.alt_(upright("pr")) < m_z \/ 4 \,
    wide e + epsilon.alt_(upright("pr")) < m_P \/ 4 . $
  Here $epsilon.alt_(upright("pr")) > 0$ includes the chosen small powers in the principal remainder estimate.
    Also require $e < 10^(- 3)$ and the bounds $e_0$ in Lemma 28.
    The slot lengths have already been fixed, so the small powers needed in the amplitude subdivision can be
    chosen in terms of their positive minimum. All these choices depend only on $Delta$ and the pretarget slot system.
  Choose
  $ 0 < zeta < min { 1 \/ 48 \, m_(upright("high")) \/ 16 } . $
  The frequency extension then costs at most $2 zeta < m_(upright("high")) \/ 8$.
    Now choose the absolute line $z_oo > 2$ in Section 9.3 sufficiently far right that its large-row sum has a
    saving larger than $m_(upright("high"))$ relative to $C \( beta_(*) \)$.
    Its exponent depends only on these real choices, so $z_oo$ also precedes the target.
    Choose the pretarget cutoff needed for Equation (1.102). Any additional fixed excluded primes required by
    Proposition 51 after the target is fixed may be added to $S$:
    the same positive product-tail majorant preserves the shared contraction,
    and neither $T$ nor the slot windows change.
  For clarity, the nonprincipal real comparison is uniform over all pointwise pairs in Lemma 65.
    Let $epsilon.alt_(upright("real")) \( d \) gt.eq 0$ collect the allocated real, mesh,
    and moment losses for the relevant range. The endpoint inequality, the intermediate inequality,
    and the positive slopes give
  #[#set math.equation(numbering: n => "(2.216)")
   $ E \( d \) + epsilon.alt_(upright("real")) \( d \) lt.eq \( beta_(*) - 7 \/ 8 \) - epsilon_(upright("hi")) \,
     wide epsilon_(upright("hi")) > 0 \, $ <eq:saving-criterion>]
  for every occurring $\( R \, q \)$ and every moderate $d$,
    with a fixed fraction of $m_(upright("high"))$ still reserved.
    Therefore the same inequality holds for $E_(max \, Z) \( d \)$, uniformly in $Z$.
    The small and large bounds have their stated separate savings.
    Apply the subpower normalizer estimate once to the nonprincipal and outer-row contributions,
    and absorb the remaining finite dyadic multiplicities using a power below $m_(upright("high")) \/ 8$.
    Lemma 36 already includes its own normalizer allowance $epsilon.alt_(upright("pr"))$.
    The four high real allocations above cost less than $m_(upright("high")) \/ 2$;
    this last allowance leaves more than $3 m_(upright("high")) \/ 8$.
    The principal inequalities leave more than $3 \/ 4$ of each of $m_w \, m_z \, m_P$.
    Thus one may fix, before the target,
  $ m = 1 / 4 min { m_(upright("high")) \, m_w \, m_z \, m_P } > 0 $
  as a common remaining high saving before retained height factors.
    For the low estimate, apply Equation (2.206) with the pretarget loss $Delta \/ 2$, and set $omega =
    Delta \/ 2$. Let $epsilon.alt_(upright("ht")) > 0$ be the minimum of the finitely many detector height
    allowances already chosen with these real losses.
  Now fix a primitive target $eta$. Choose its admissible fixed arithmetic data and the final excluded set $S$,
    including its conductor, the common cutoff, and the further fixed exclusions just described.
    The physical expression, $H_eta$, $c_S$, and the signal all use this same data.
    The group $T$ and the slot system remain independent of the target.
    Fix all internal moment, seminorm, and Sobolev orders supplied by the preceding results for this datum.
    Their uniformity over moving moduli, common masks, and frozen labels gives a finite $A_eta$ dominating the
    product of all retained high factors, including the dyadic, prime, numerator-reflection,
    and row-count height factors. It is independent of any later external test order.
    The all-height correction bounds and the direct global or absolute bounds in the shared analytic lemmas
    likewise give a finite scale degree $B_eta$ for all discarded physical pieces,
    independent of the later order $N$. Normalizing those pieces and summing their finitely many types only
    enlarges this fixed $B_eta$.
  We use the height ceiling verified at the end of Section 8.2.
    Let $A_(upright("ht") \, eta) lt.eq A_eta$ dominate the finitely many detector height orders,
    enlarging $A_eta$ if necessary, and put
  $ tau_(0 \, eta) := frac(d_min epsilon.alt_(upright("ht")), 20 \( 1 + A_(upright("ht") \, eta) \)) > 0 . $
  This number is fixed after the retained orders for the target, but before $N$ and $Z$.
    If $0 < tau lt.eq min { d_min \/ 100 \, tau_(0 \, eta) }$ and $T_1 = Z^tau$, then, for $U gt.eq
    Z^(d_min)$ and sufficiently large $Z$,
  $ T_1 lt.eq U^(1 \/ 100) \, wide \( 1 + T_1 \)^(A_(upright("ht") \, eta)) lt.eq
    2^(A_(upright("ht") \, eta)) Z^(d_min epsilon.alt_(upright("ht")) \/ 20) lt.eq
    U^(epsilon.alt_(upright("ht")) \/ 10) . $
  By the definition of $epsilon.alt_(upright("ht"))$, this proves every literal condition
    $\( 1 + T_1 \)^(A_(cal(A))) lt.eq U^(epsilon.alt \/ 10)$ in Lemma 28 throughout the moderate range.
    The first bound also makes the detector’s crude error $U^(- 189 \/ 100 + o \( 1 \)) T_1^2 lt.eq
    U^(- 187 \/ 100 + o \( 1 \))$ tend to zero. Every buffered moderate range has $d lt.eq h + zeta < 1$;
    small and absolute large rows use no buffered cutoff.
  The fixed finite list of external coordinates, including the physical $Im z$ coordinate,
    uses the single allocation in Equation (1.113). Its matrix is fixed by the slot system and the finite retained
    estimates, and is independent of the external derivative order.
    For each such $tau$, the dyadic, witness, and prime estimates may choose their auxiliary external orders after
    $tau$, as their statements permit, so that their complete pointwise bounds hold.
    Choose a strict power gap when absorbing their discarded parts;
    the resulting external seminorm constants are then absorbed by the $tau$-dependent lower threshold.
    For any requested remaining order $N$, these auxiliary orders may be increased further;
    this changes only external seminorm constants and the lower threshold, not $A_eta$, $B_eta$,
    or $tau_(0 \, eta)$. No internal moment is reapplied to an externally differentiated profile.
  Combining Lemma 65, all the row ranges, and the principal remainder estimate therefore gives,
    for every fixed $N$ and sufficiently large $Z$ in this ceiling range,
  $ \| J_(upright("II") \, eta) \( Z \) - f_(upright("II") \, eta) \( Z \) \| lt.double_(eta \, N)
    Z^(C \( beta_(*) \) - m) \( 1 + T_1 \)^(A_eta) + Z^(B_eta) T_1^(- N) . $
  The lower threshold is allowed to depend on $tau \, N \, eta$. This is Equation (1.125).
    Its low hypothesis is Equation (2.206) with $omega = Delta \/ 2$, and the two functions do not contain $T_1$.
    Apply Lemma 38 with $sigma_0 = 7 \/ 8$, $C = C_(upright("II"))$, this $m$,
    and the verified ceiling $tau_(0 \, eta)$. It chooses $tau_eta$,
    then a common dominating external order $N_eta$, and finally the threshold.
    It gives the asserted high estimate with $sigma = m \/ 2 > 0$.
    Both $omega$ and $sigma$ were fixed before the target. ◻
]

Proposition 67 and Equation (1.102) verify the hypotheses of Proposition 3 with $sigma_0 = 7 \/ 8$, $J_eta =
  J_(upright("II") \, eta)$, and $f_eta = f_(upright("II") \, eta)$.
  This contradicts $beta_(*) > 7 \/ 8$; hence $beta_(*) lt.eq 7 \/ 8$.
  Proposition 40 at $sigma_0 = 7 \/ 8$ extends the primitive Hecke conclusion to all finite-order Hecke and
  Dirichlet $L$-functions, with the principal pole allowed, and proves Theorem 1.

#heading(level: 1)[References]
#bibitem([1])[S. Baier and A. Bansal, #emph[The large sieve with power moduli for $bb(Z) \[ i \]$],
  International Journal of Number Theory #strong[14] (2018), no. 10, 2737--2756.
  #link("https://doi.org/10.1142/S1793042118501658")[doi:10.1142/S1793042118501658]\;
  #link("https://arxiv.org/abs/1802.08964")[arXiv:1802.08964].]
#bibitem([2])[V. Bhargava, G. Ivanyos, R. Mittal, and N. Saxena,
  #emph[Irreducibility and deterministic $r$-th root finding over finite fields],
  Proceedings of the 2017 ACM International Symposium on Symbolic and Algebraic Computation (ISSAC 2017), ACM,
  2017, 37--44. #link("https://doi.org/10.1145/3087604.3087620")[doi:10.1145/3087604.3087620]\;
  #link("https://www.cse.iitk.ac.in/users/nitin/papers/irred-and-rth-root.pdf")[author manuscript].]
#bibitem([3])[K. Billington, M. Cheng, J. Schettler, and A. I.
  Suriajaya, #emph[The average number of Goldbach representations and zero-free regions of the Riemann
  zeta-function], International Journal of Number Theory #strong[21] (2025), no. 2, 289--316.
  #link("https://doi.org/10.1142/S1793042125500150")[doi:10.1142/S1793042125500150]\;
  #link("https://arxiv.org/abs/2306.09102")[arXiv:2306.09102].]
#bibitem([4])[V. Blomer, L. Goldmakher, and B. Louvel, #emph[$L$-functions with $n$-th-order twists],
  International Mathematics Research Notices #strong[2014] (2014), no. 7, 1925--1955.
  #link("https://doi.org/10.1093/imrn/rns257")[doi:10.1093/imrn/rns257]\;
  #link("https://arxiv.org/abs/1112.1650")[arXiv:1112.1650].]
#bibitem([5])[Clay Mathematics Institute, #emph[Riemann Hypothesis], Millennium Prize Problems,
  #link("https://www.claymath.org/millennium/riemann-hypothesis/").]
#bibitem([6])[C. David, A. de Faveri, A. Dunn, and J. Stucky, #emph[Non-vanishing for cubic Hecke $L$-functions],
  preprint, arXiv:2410.03048v2 (2026). #link("https://arxiv.org/abs/2410.03048")[arXiv:2410.03048].]
#bibitem([7])[P. G. L. Dirichlet, #emph[Beweis des Satzes, daß jede unbegrenzte arithmetische Progression,
  deren erstes Glied und Differenz ganze Zahlen ohne gemeinschaftlichen Factor sind,
  unendlich viele Primzahlen enthält], Abhandlungen der Königlichen Preussischen Akademie der Wissenschaften zu
  Berlin (1837), 45--81. English translation by R. Stephan, #link("https://arxiv.org/abs/0808.1408")[arXiv:0808.1408].]
#bibitem([8])[A. Dunn and M. Radziwiłł, #emph[Bias in cubic Gauss sums:
  Patterson's conjecture], Annals of Mathematics #strong[200] (2024), no. 3, 967--1057.
  #link("https://doi.org/10.4007/annals.2024.200.3.3")[doi:10.4007/annals.2024.200.3.3]\;
  #link("https://arxiv.org/abs/2109.07463")[arXiv:2109.07463].]
#bibitem([9])[J. B. Friedlander and D. A. Goldston, #emph[Sums of three or more primes],
  Transactions of the American Mathematical Society #strong[349] (1997), no. 1, 287--310.
  #link("https://doi.org/10.1090/S0002-9947-97-01652-8")[doi:10.1090/S0002-9947-97-01652-8].]
#bibitem([10])[S. D. Galbraith, #emph[Mathematics of Public Key Cryptography], Cambridge University Press, 2012.
  #link("https://doi.org/10.1017/CBO9781139012843")[doi:10.1017/CBO9781139012843].
  Section and algorithm references use the author's extended and corrected version 2.0,
  #link("https://www.math.auckland.ac.nz/~sgal018/crypto-book/ch2.pdf")[Chapter 2].]
#bibitem([11])[P. Gao and L. Zhao, #emph[Moments of quadratic Hecke $L$-functions of imaginary quadratic number
  fields], Journal of Number Theory #strong[209] (2020), 359--377.
  #link("https://doi.org/10.1016/j.jnt.2019.09.002")[doi:10.1016/j.jnt.2019.09.002]\;
  #link("https://arxiv.org/abs/1707.00091")[arXiv:1707.00091].]
#bibitem([12])[P. Gao and L. Zhao, #emph[Moments and one level density of sextic Hecke $L$-functions],
  Functiones et Approximatio Commentarii Mathematici #strong[70] (2024), no. 1, 7--28.
  #link("https://doi.org/10.7169/facm/2057")[doi:10.7169/facm/2057]\;
  #link("https://arxiv.org/abs/2201.01885")[arXiv:2201.01885].]
#bibitem([13])[L. Goldmakher and B. Louvel, #emph[A quadratic large sieve inequality over number fields],
  Mathematical Proceedings of the Cambridge Philosophical Society #strong[154] (2013), no. 2, 193--212.
  #link("https://doi.org/10.1017/S0305004112000370")[doi:10.1017/S0305004112000370]\;
  #link("https://arxiv.org/abs/1112.1642")[arXiv:1112.1642].]
#bibitem([14])[L. Guth and J. Maynard, #emph[New large value estimates for Dirichlet polynomials],
  Annals of Mathematics #strong[203] (2026), no. 2, 623--675.
  #link("https://doi.org/10.4007/annals.2026.203.2.6")[doi:10.4007/annals.2026.203.2.6]\;
  #link("https://arxiv.org/abs/2405.20552")[arXiv:2405.20552].]
#bibitem([15])[J. Hadamard, #emph[Sur la distribution des zéros de la fonction $zeta \( s \)$ et ses conséquences
  arithmétiques], Bulletin de la Société Mathématique de France #strong[24] (1896), 199--220.
  #link("https://doi.org/10.24033/bsmf.545")[doi:10.24033/bsmf.545].]
#bibitem([16])[D. R. Heath-Brown, #emph[A mean value estimate for real character sums],
  Acta Arithmetica #strong[72] (1995), no. 3, 235--275.
  #link("https://doi.org/10.4064/aa-72-3-235-275")[doi:10.4064/aa-72-3-235-275].]
#bibitem([17])[D. R. Heath-Brown, #emph[Kummer's conjecture for cubic Gauss sums],
  Israel Journal of Mathematics #strong[120], part A (2000), 97--124.
  #link("https://doi.org/10.1007/s11856-000-1273-y")[doi:10.1007/s11856-000-1273-y].]
#bibitem([18])[E. Hecke, #emph[Eine neue Art von Zetafunktionen und ihre Beziehungen zur Verteilung der
  Primzahlen. Erste Mitteilung], Mathematische Zeitschrift #strong[1] (1918), 357--376; #emph[Zweite Mitteilung],
  Mathematische Zeitschrift #strong[6] (1920), 11--51.
  #link("https://doi.org/10.1007/BF01465095")[doi:10.1007/BF01465095] (first paper).]
#bibitem([19])[M. N. Huxley, #emph[The large sieve inequality for algebraic number fields],
  Mathematika #strong[15] (1968), no. 2, 178--187.
  #link("https://doi.org/10.1112/S0025579300002540")[doi:10.1112/S0025579300002540].]
#bibitem([20])[T. Kubota, #emph[On automorphic functions and the reciprocity law in a number field],
  Lectures in Mathematics, Department of Mathematics, Kyoto University, no. 2, Kinokuniya Book-Store, Tokyo, 1969.
  #link("http://hdl.handle.net/2433/84907").]
#bibitem([21])[J. Maynard and K. Pratt, #emph[Half-isolated zeros and zero-density estimates],
  International Mathematics Research Notices #strong[2024] (2024), no. 19, 12978--13014.
  #link("https://doi.org/10.1093/imrn/rnae191")[doi:10.1093/imrn/rnae191]\;
  #link("https://arxiv.org/abs/2206.11729")[arXiv:2206.11729].]
#bibitem([22])[J. S. Milne, #emph[Class Field Theory], course notes, version 4.03, 6 August 2020.
  #link("https://www.jmilne.org/math/CourseNotes/CFT.pdf").]
#bibitem([23])[OpenAI, #emph[An unconditional first moment for cubic Gauss sums],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/paper.pdf")[OAI:An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026],
  2026.]
#bibitem([24])[S. J. Patterson, #emph[A cubic analogue of the theta series],
  Journal für die reine und angewandte Mathematik #strong[296] (1977), 125--161.
  #link("https://doi.org/10.1515/crll.1977.296.125")[doi:10.1515/crll.1977.296.125].]
#bibitem([25])[B. Riemann, #emph[Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse],
  Monatsberichte der Königlichen Preussischen Akademie der Wissenschaften zu Berlin (1859), 671--680.
  Manuscript, transcription, and translation at #link("https://www.claymath.org/library/historical/riemann/r.html").]
#bibitem([26])[T. Tao, #emph[The Elliott--Halberstam conjecture implies the Vinogradov least quadratic nonresidue
  conjecture], Algebra & Number Theory #strong[9] (2015), no. 4, 1005--1034.
  #link("https://doi.org/10.2140/ant.2015.9.1005")[doi:10.2140/ant.2015.9.1005]\;
  #link("https://msp.org/ant/2015/9-4/ant-v9-n4-p09-p.pdf")[publisher PDF].]
#bibitem([27])[J. Thorner and A. Zaman, #emph[A unified and improved Chebotarev density theorem],
  Algebra & Number Theory #strong[13] (2019), no. 5, 1039--1068.
  #link("https://doi.org/10.2140/ant.2019.13.1039")[doi:10.2140/ant.2019.13.1039]\;
  #link("https://arxiv.org/abs/1803.02823")[arXiv:1803.02823].]
#bibitem([28])[C.-J. de la Vallée Poussin, #emph[Recherches analytiques sur la théorie des nombres premiers.
  Première partie: La fonction $zeta \( s \)$ de Riemann et les nombres premiers en général],
  Annales de la Société scientifique de Bruxelles #strong[20], deuxième partie (1896), 183--256.
  Reprinted in #emph[Recherches analytiques sur la théorie des nombres premiers], Hayez, Brussels, 1897,
  #link("https://books.google.com/books?id=7e0GAAAAYAAJ").]
