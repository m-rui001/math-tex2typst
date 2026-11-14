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

#align(center)[#text(size: 16pt, weight: "bold")[Vanishing of higher bounded Hochschild cohomology]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The continuous Hochschild cohomology of an operator algebra measures the obstruction to solving its bounded
  cocycle equations. The theory also connects these equations with stability of multiplication under small
  perturbations #cite(label("SinclairSmith1995")) Chapter 7.
  For a von Neumann algebra acting on itself by multiplication,
  the degree-one equation is the derivation equation, and its vanishing is the inner-derivation theorem of Kadison
  and Sakai #cite(label("Kadison1966")) #cite(label("Sakai1966")).
  The higher-degree theory was developed by Johnson, Kadison,
  and Ringrose #cite(label("KadisonRingrose1971")) #cite(label("KadisonRingrose1971II")) #cite(label("JKR1972")).
  Throughout, boundedness means ordinary operator-norm boundedness of a multilinear map.
  No complete-boundedness condition is imposed.

For a complex von Neumann algebra $M$, let $C_b^k \( M \, M \)$ be the Banach space of bounded complex $k$-linear
  maps $M^k arrow.r M$, with norm $∥f∥ = sup_(∥a_1∥ \, dots.h \, ∥a_k∥ lt.eq 1) ∥f \( a_1 \, dots.h \, a_k \)∥$,
  and put $C_b^0 \( M \, M \) = M$. For $k gt.eq 1$, the differential is

#[#set math.equation(numbering: n => "(1.1)")
 $ \( d f \) \( a_1 \, dots.h \, a_(k + 1) \) =  & a_1 f \( a_2 \, dots.h \, a_(k + 1) \)\
 & + sum_(j = 1)^k \( - 1 \)^j f \( a_1 \, dots.h \, a_j a_(j + 1) \, dots.h \, a_(k + 1) \)\
 & + \( - 1 \)^(k + 1) f \( a_1 \, dots.h \, a_k \) a_(k + 1) . $ <eq:differential>]

In degree zero, $\( d b \) \( a \) = a b - b a$. As usual, $d^2 = 0$. We use the notation

$ H_b^k \( M \, M \) = ker #scale(x: 120%, y: 120%)[\(] d : C_b^k \( M \, M \) arrow.r
  C_b^(k + 1) \( M \, M \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\/] "im"
  #scale(x: 120%, y: 120%)[\(] d : C_b^(k - 1) \( M \, M \) arrow.r C_b^k \( M \, M \) #scale(x: 120%, y: 120%)[\)] . $

The denominator is the actual image, without a closure.

The Kadison–Ringrose cohomology conjecture asks whether $H_b^k \( M \, M \) =
  0$ for every complex von Neumann algebra $M$ and every positive integer $k$.
  Sinclair and Smith trace this self-coefficient formulation to 1967 #cite(label("SinclairSmith1998")) p. 3376.
  Our main result settles the higher degrees.

#thm([Theorem 1.1.])[
  #emph[Let $M$ be a complex von Neumann algebra and let $k gt.eq 2$.
    Every $f in C_b^k \( M \, M \)$ satisfying $d f = 0$ has the form $f =
    d g$ for some $g in C_b^(k - 1) \( M \, M \)$. Consequently $H_b^k \( M \, M \) = 0$.]
] <thm:main>

Together with the inner-derivation theorem, Theorem 1 resolves the Kadison–Ringrose cohomology conjecture positively.

=== 1.1 Prior work <prior-work>

Kadison and Ringrose proved vanishing for type I and hyperfinite von Neumann
  algebras #cite(label("KadisonRingrose1971")) Theorem 4.4 #cite(label("KadisonRingrose1971II")) Theorem 3.1.
  Their extended-cobounding theorem also gives a primitive for an $M$-valued cocycle on a general concrete von
  Neumann algebra $M subset B \( H \)$ when the primitive may take values in
  $B \( H \)$ #cite(label("KadisonRingrose1971II")) Theorem 2.4;
  keeping the values in the original algebra is the essential self-coefficient problem here.
  Johnson, Kadison, and Ringrose then identified continuous cohomology with separately normal
  cohomology #cite(label("JKR1972")) Theorem 5.6. The completely bounded methods of Christensen, Effros,
  and Sinclair #cite(label("CES1987")) established vanishing whenever the type $upright("II")_1$ central summand
  absorbs the hyperfinite $upright("II")_1$ factor, including all algebras without a type $upright("II")_1$
  summand; see the precise restatement in #cite(label("CPSS2003")) p. 636, equation (1.1).

The remaining finite-algebra problem has several substantial positive cases.
  Sinclair and Smith proved vanishing for algebras with separable predual and a Cartan
  subalgebra #cite(label("SinclairSmith1998Cartan")); Cameron removed the separability hypothesis for
  type $upright("II")_1$ factors with a Cartan maximal abelian subalgebra #cite(label("Cameron2009")) Theorem 3.2.
  Christensen, Pop, Sinclair, and Smith proved vanishing for all type $upright("II")_1$ factors with
  property $Gamma$, including nonseparable ones #cite(label("CPSS2003")) Theorem 7.2.
  Qian and Shen extended this direction to type $upright("II")_1$ algebras with separable predual and their
  generalized property $Gamma$ #cite(label("QianShen2015")) Theorem 6.4.
  In degree two, Pop and Smith proved vanishing for the tensor product of any two type $upright("II")_1$ von
  Neumann algebras, with no separability assumption #cite(label("PopSmith2010")) Theorem 4.5.
  Theorem 1 removes the structural restrictions on the finite algebra in every degree $k gt.eq 2$.

The Cartan argument of Sinclair and Smith also provides a useful methodological comparison.
  They show that complete boundedness in the last cocycle variable suffices.
  They use a projection of Christensen and Sinclair #cite(label("ChristensenSinclair1995")) from completely
  bounded linear maps onto right module maps, in the form recalled in #cite(label("SinclairSmith1998"))
  Theorem 3.4, to obtain a primitive #cite(label("SinclairSmith1998")) Section 4.
  Thus the passage from averaging one variable to a module identity already has a central role in the earlier theory.

=== 1.2 The new ingredients <the-new-ingredients>

We obtain the needed module identity by averaging over a single unitary random walk.
  Averaging one cocycle input first gives only a harmonic map;
  the main new input is a Liouville theorem that makes such a map commute with right multiplication.
  Suppose that $M$ is a type $upright("II")_1$ algebra with separable predual and faithful normal tracial state
  $tau$, and write $∥x∥_2 = tau \( x^(*) x \)^(1 \/ 2)$. Let $cal(U) \( M \)$ denote its unitary group.
  We construct a symmetric, countably supported probability measure $mu$ on $cal(U) \( M \)$,
  with a $2$-dense set of atoms, such that

#[#set math.equation(numbering: n => "(1.2)")
 $ T \( x \) = bb(E)_(U tilde.op mu) #scale(x: 120%, y: 120%)[\[] T \( x U \) U^(*) #scale(x: 120%, y: 120%)[\]]
   quad \( x in M \) wide arrow.r.double wide T \( x \) = T \( 1 \) x . $ <eq:intro-harmonic>]

Here $T : M arrow.r M$ is any bounded linear map that is $2$-norm continuous on each operator-norm ball.
  No positivity or complete-boundedness assumption is imposed. The measure is fixed before the harmonic map is chosen.

For a separately normal cocycle, Akemann’s continuity theorem #cite(label("Akemann1967")) Corollary III.10
  supplies the stated continuity in the last input. A uniform continuity modulus survives the averaging limit,
  even though that limit need not remain normal, and also passes to the tracial ultrapowers used in the Liouville proof.

The proof of (1.2) combines probabilistic and algebraic arguments.
  The finite free configurations come from Popa’s construction of free-independent
  sequences #cite(label("Popa1995")), in the formulation of his later ultraproduct independence
  theorem #cite(label("Popa2014")). These give finite unitary configurations with prescribed small word traces.
  A hierarchy of increasingly rare, increasingly large sets of such unitaries gives a single random walk whose
  long independent products approach free Haar joint moments along a subsequence. Only moment convergence is required.

Second, we use the classical harmonic-martingale construction #cite(label("Furstenberg1963")) p. 415 to obtain an
  $L^2 \( M \, tau \)$-valued martingale. A nonconstant limit would produce free Haar unitaries $g_1 \, g_2 \,
  dots.h$ in a tracial ultrapower and distinct $a \, b in M$.
  The coordinatewise lift of $T$ to that ultrapower sends each nonempty signed word $w$ with pairwise distinct
  unsigned indices to $a w$ or $b w$, according to the sign of its first letter; here $a \,
  b$ are identified with their constant images. We prove that these identities are impossible for a bounded map
  with the stated continuity. The argument averages free generators,
  discards repeated surviving indices using Haagerup’s free-group length estimate #cite(label("Haagerup1979")),
  and passes to a unitary polar part. Positive and negative powers of that unitary would then carry different left
  multipliers. Uniformly bounded sine sums and a spectral partition force the multipliers to agree.
  This rigidity statement, proved in Theorem 11, is independent of the cocycle problem.

Finally, in this tracial type $upright("II")_1$ setting, for a separately normal cocycle $f$ we take a pointwise
  ultraweak cluster point of the Cesàro averages in its last input.
  The Liouville theorem identifies the resulting fixed map as a right module map in that input.
  Averaging the original cocycle equation then gives a primitive $g$ with $∥g∥ lt.eq ∥f∥$.
  Together with compactness, this uniform estimate removes the separability assumption.
  We then partition the type $upright("II")_1$ summand into central pieces admitting faithful normal tracial
  states. Lemma 20 corrects mixed inputs from distinct pieces, and uniform bounds permit their assembly.
  The classical vanishing theorem handles the complementary summand.

=== 1.3 Conventions and classical reductions <conventions-and-classical-reductions>

All von Neumann algebras and maps are complex, and subalgebras are unital unless otherwise stated.
  A finite algebra is called type $upright("II")_1$ here when it has no nonzero type I central summand;
  its center need not be trivial. A map $f : M^k arrow.r M$ is #emph[separately normal] if it is ultraweakly
  continuous in each input with the others fixed. For a finite algebra with faithful normal tracial state,
  the $2$-norm on bounded sets determines the strong-star topology.
  The inherited traces on subalgebras and tracial ultrapowers will usually also be denoted by $tau$.

We use the following established cohomology results.

#thm([Proposition 1.2.])[
  (Classical reductions).  #emph[Let $M$ be a von Neumann algebra and $k gt.eq 2$.]
  + #emph[If $f in C_b^k \( M \, M \)$ is a cocycle, there are a separately normal bounded cocycle $f_0$ and a
    bounded $\( k - 1 \)$-cochain $b$ such that $f = f_0 + d b$.]
  + #emph[If $M$ has no type $upright("II")_1$ central summand, then $H_b^k \( M \, M \) = 0$.]
] <prop:classical>

Part (i) is the Johnson–Kadison–Ringrose normal-reduction theorem #cite(label("JKR1972")) Lemma 5.4 and
  Theorem 5.6; its formulation for self-coefficients is recalled in #cite(label("CPSS2003")) Section 2.
  Part (ii) combines the classical type I and properly infinite vanishing results;
  see #cite(label("KadisonRingrose1971")) Theorem 4.4, #cite(label("CES1987")),
  and #cite(label("CPSS2003")) p. 636, equation (1.1). Both statements concern ordinary continuous cohomology and
  the actual image of $d$. These are the only cohomological inputs in the proof.

Section 2 constructs the walk. Section 3 proves its Liouville property using Theorem 11, proved in Section 4.
  Section 5 constructs bounded primitives and completes the reductions to arbitrary $M$.

== 2 A random walk with asymptotically free products <sec:walk>

Throughout this section, $\( M \, tau \)$ is a finite von Neumann algebra of type $upright("II")_1$ with separable
  predual and faithful normal tracial state. In particular, $M$ may have a nontrivial center.
  We construct a single symmetric probability measure on $cal(U) \( M \)$ whose independent long products approach
  the joint moments of free Haar unitaries along a subsequence.
  The construction combines finite approximation to freeness with increasingly rare increments chosen at
  successive stages.

Recall that unital subalgebras of a tracial von Neumann algebra are #emph[free] if every alternating product of
  centered elements from successively different subalgebras has trace zero. Here centered means having trace zero.
  A unitary $u$ is #emph[Haar] if $tau \( u^k \) = 0$ for every $k in bb(Z) \\ { 0 }$.
  A free Haar family $\( u_i \)$ is equivalently characterized by

$ tau #scale(x: 120%, y: 120%)[\(] w \( u_1 \, dots.h \, u_r \) #scale(x: 120%, y: 120%)[\)] =
  0 wide \( w in bb(F)_r \\ { e } \) \, $

for every finite subfamily, where $bb(F)_r$ denotes the free group on $r$ specified generators.
  The equivalence follows by expanding centered Laurent polynomials and then taking bounded $2$-norm
  approximations. The length $\| w \|$ is its reduced word length.

For a probability measure $mu$ on $cal(U) \( M \)$, let $mu^(* n)$ be the law of the ordered product $U_1 dots.h.c
  U_n$ of independent increments of law $mu$. Symmetry means that $U^(- 1)$ has the same law as $U$.

#thm([Theorem 2.1.])[
  #emph[Let $M$ be a finite type $upright("II")_1$ von Neumann algebra with separable predual and faithful normal
    tracial state $tau$. There exist a symmetric, countably supported probability measure $mu$ on $cal(U) \( M \)$
    and a strictly increasing sequence $n_ell arrow.r oo$ with the following properties.]
  #emph[The positive-mass atoms of $mu$ contain a countable $2$-norm dense subset of $cal(U) \( M \)$,
    and hence generate $M$ as a von Neumann algebra. For every $r in bb(N)$,
    every nonempty finite set $cal(W) subset bb(F)_r \\ { e }$, and every $eta > 0$, if $G_1^(\( ell \)) \,
    dots.h \, G_r^(\( ell \))$ are independent with law $mu^(* n_ell)$, then
$ Pr
  (max_(w in cal(W)) lr(|tau #scale(x: 120%, y: 120%)[\(] w \( G_1^(\( ell \)) \, dots.h \, G_r^(\( ell \)) \)
  #scale(x: 120%, y: 120%)[\)]|) gt.eq eta) arrow.r 0 . $

 Thus these products have joint free Haar moments in probability.]
] <thm:walk>

We first obtain finite unitary configurations for which prescribed words in path products have small traces.
  We then place such configurations at increasingly rare levels of a single measure,
  arranging that each finite moment test succeeds with probability tending to one.

=== 2.1 Finite requirements from ultrapower freeness <finite-requirements-from-ultrapower-freeness>

The freeness input originates in Popa’s free-independent sequence construction #cite(label("Popa1995")) Lemma 1.4
  and Theorem 2.1. We use the following special case of its later ultraproduct
  formulation #cite(label("Popa2014")) Theorem 0.1(a).

For a tracial von Neumann algebra $\( P \, tau_P \)$ and a free ultrafilter $omega$ on $bb(N)$,
  its tracial ultrapower is

#[#set math.equation(numbering: n => "(2.1)")
 $ P^omega = ell^oo \( bb(N) \, P \) \/ cal(I)_omega \, wide cal(I)_omega = { \( x_m \) :
   lim_(m arrow.r omega) ∥x_m∥_2 = 0 } . $ <eq:tracial-ultrapower>]

It is a finite von Neumann algebra with faithful normal trace $tau_P^omega \( \( x_m \)^omega \) =
  lim_(m arrow.r omega) tau_P \( x_m \)$. We identify $P$ with its constant sequences.

#thm([Lemma 2.2.])[
  (Popa’s ultrapower freeness).  #emph[Let $P$ be a $upright("II")_1$ factor and let $B subset
    P^omega$ be a unital von Neumann subalgebra with separable predual.
    There is a diffuse abelian von Neumann subalgebra of $P^omega$ free from $B$.
    Consequently, for every $d in bb(N)$, there are Haar unitaries $u_1 \, dots.h \,
    u_d in P^omega$ such that $B \, W^(*) \( u_1 \) \, dots.h \, W^(*) \( u_d \)$ are free.]
] <lem:popa-special>

#proof[
  Apply Theorem 0.1(a) of #cite(label("Popa2014")) with every coordinate algebra and every coordinate subalgebra
    equal to $P$. The required non-intertwining condition holds:
    a nonzero corner of the diffuse factor $P$ cannot embed in the scalar relative commutant,
    or in a finite matrix amplification of it. Moreover, $P^omega$ is a factor,
    so the relative commutant of the full ultraproduct subalgebra is $bb(C) 1$.
    The conclusion for the separable centered subspace $B ⊖ bb(C) 1$ is therefore ordinary scalar-trace freeness.
    This is the case in which every coordinate subalgebra equals its ambient factor,
    discussed after that theorem and in #cite(label("Popa2014")) Sections 1.5–1.6.
  A diffuse abelian tracial algebra contains a Haar unitary. Choose one, adjoin it to $B$, and repeat.
    Finite adjunction preserves separable predual: a countable generating set gives a separable tracial Hilbert
    space by polynomial approximation. Thus all $d$ choices take place in the same ultrapower.
    At each step the new algebra is free from the algebra generated at the preceding steps,
    giving the asserted family. ◻
]

We next record why a single fresh label in each path is sufficient.
  A #emph[path expression] is a finite ordered product of fixed unitary coefficients and formal letters
  $U_j^(plus.minus 1)$. Occurrences and labels in such expressions are counted before any simplification.

#thm([Lemma 2.3.])[
  (Distinguished letters).  #emph[Let $B \, W^(*) \( u_1 \) \, dots.h \,
    W^(*) \( u_d \)$ be free subalgebras of a tracial von Neumann algebra, with each $u_j$ Haar.
    Let $y_1 \, dots.h \, y_r$ be path expressions evaluated at these unitaries,
    with coefficients in $cal(U) \( B \)$. Suppose that for each $i$ there is a label $h_i$ occurring exactly once
    in the entire list of path expressions, and that its occurrence belongs to $y_i$. Then
$ tau #scale(x: 120%, y: 120%)[\(] w \( y_1 \, dots.h \, y_r \) #scale(x: 120%, y: 120%)[\)] =
  0 wide \( w in bb(F)_r \\ { e } \) . $

]
] <lem:distinguished-letters>

#proof[
  The labels $h_1 \, dots.h \, h_r$ are distinct. Put all nondistinguished unitaries into the coefficient algebra:
  $ B_0 = W^(*) #scale(x: 120%, y: 120%)[\(] B \, u_j : j in.not { h_1 \, dots.h \,
    h_r } #scale(x: 120%, y: 120%)[\)] \, wide C = W^(*) \( u_(h_1) \, dots.h \, u_(h_r) \) . $
  Then $B_0$ and $C$ are free. This grouping property follows directly by expanding centered polynomials in a free
    family into alternating centered products; bounded approximation extends it to the generated von Neumann
    algebras. Write
  $ y_i = A_i u_(h_i)^(epsilon.alt_i) B_i \, wide A_i \, B_i in cal(U) \( B_0 \) \, quad epsilon.alt_i in { - 1 \,
    1 } . $
  If $w = x_(i_1)^(sigma_1) dots.h.c x_(i_t)^(sigma_t)$ is nonempty and reduced, its evaluated product has the form
  $ c_0 u_(h_(i_1))^(epsilon.alt_(i_1) sigma_1) c_1 dots.h.c u_(h_(i_t))^(epsilon.alt_(i_t) sigma_t) c_t \, wide
    c_0 \, dots.h \, c_t in cal(U) \( B_0 \) . $
  The displayed distinguished-letter string is itself reduced.
    Indeed, an adjacent inverse pair would require $i_j = i_(j + 1)$ and $sigma_j = - sigma_(j + 1)$,
    contrary to the reduction of $w$.
  Expand every $c_j$, including the two outside coefficients, as its scalar part plus its centered part.
    In each resulting term, removing scalar coefficients joins distinguished letters into nonempty contiguous
    subwords of that reduced string. Every such block is a centered element of $C$.
    The remaining factors alternate between centered elements of $B_0$ and centered elements of $C$,
    and there is at least one $C$ factor. Freeness makes the trace zero.
    If there are no centered coefficient factors, the term is just a scalar multiple of a nonempty reduced Haar
    word and again has trace zero. This proves the assertion, with no condition on the first and last indices of $w$. ◻
]

#thm([Lemma 2.4.])[
  (Simultaneous finite path requirements).  #emph[Fix a finite set $F subset cal(U) \( M \)$, an integer $d gt.eq
    1$, and $epsilon > 0$. Consider a finite collection of tests.
    Each test consists of a finite list of path expressions $y_1 \, dots.h \,
    y_r$ in the alphabet $F union { U_j^(plus.minus 1) : 1 lt.eq j lt.eq
    d }$ and a nonidentity word $w in bb(F)_r$. Assume that each path in each test has a distinguished label
    occurring exactly once in that test’s entire list, as in Lemma 5.
    The distinguished labels may differ between tests. There are $u_1 \, dots.h \,
    u_d in cal(U) \( M \)$ for which all the tests satisfy
$
  lr(|tau #scale(x: 120%, y: 120%)[\(] w \( y_1 \( u \) \, dots.h \, y_r \( u \) \)
  #scale(x: 120%, y: 120%)[\)]|) < epsilon . $

]
] <lem:finite-path-tests>

#proof[
  First suppose that $M = P$ is a factor. The constant coefficient algebra $W^(*) \( F \) subset
    P^omega$ has separable predual. Apply Lemma 4 and then Lemma 5.
    The same free $d$-tuple makes every prescribed trace exactly zero in $P^omega$,
    even though different tests can designate different labels.
  Every unitary of $P^omega$ has unitary representatives. To see this,
    take a bounded self-adjoint logarithm there, lift it to a bounded sequence of self-adjoint elements of $P$,
    and exponentiate coordinatewise. Choose such representatives for the $d$ unitaries.
    Each test trace converges to zero along $omega$. Since the family of tests is finite,
    the coordinate sets on which their absolute values are less than $epsilon$ have a common member.
    Its $d$ coordinate unitaries solve all the requirements in $P$.
  For general $M$, the factor case will give successful tuples in almost every fiber.
    The remaining task is to choose them measurably. Use the central direct integral #cite(label("Blackadar2006"))
    Sections III.1.6 and III.5.1
  $ M = integral_Omega^xor M_s thin d nu \( s \) \, wide tau \( x \) =
    integral_Omega tau_s \( x \( s \) \) thin d nu \( s \) \, $
  where $\( Omega \, nu \)$ is a probability space and, almost everywhere,
    $M_s$ is a $upright("II")_1$ factor with its normalized trace $tau_s$.
    Standard separable direct-integral theory provides countably many bounded measurable sections $a_j$ whose
    values generate $M_s$ for almost every $s$. After removing one null set,
    all these properties and the unitary identities for the finitely many coefficients hold simultaneously.
  There is a countable family $\( v_j \)$ of measurable unitary sections which is dense in each fiber unitary
    group for $∥dot.op∥_(2 \, s)$. Here is an explicit construction. Enumerate the sections
  $ exp \( i q \( a_1 \, a_2 \, dots.h \) \) \, $
  where $q$ ranges over self-adjoint $*$-polynomials in finitely many variables with coefficients in $bb(Q) +
    i bb(Q)$. This includes symmetrizations of arbitrary rational $*$-polynomials.
    In a fixed fiber, any unitary is $exp \( i h \)$ for a bounded self-adjoint $h$.
    Kaplansky density and norm approximation by rational polynomials approximate $h$ in $2$-norm by the indicated
    self-adjoint polynomials. For bounded self-adjoint $a \, b$, the integral identity
  $ e^(i a) - e^(i b) = i integral_0^1 e^(i \( 1 - t \) a) \( a - b \) e^(i t b) thin d t $
  implies $∥e^(i a) - e^(i b)∥_2 lt.eq ∥a - b∥_2$. Thus these sections have the required fiberwise density.
    Each section is globally bounded, and exponentiation makes its norm one.
  Enumerate all ordered $d$-tuples drawn from $\( v_j \)$ as $bold(v)^(\( 1 \)) \, bold(v)^(\( 2 \)) \, dots.h$.
    Let $E_k$ be the set of fibers where candidate $k$ satisfies every test with absolute trace less than
    $epsilon \/ 2$. These sets are measurable, since the traces of products of measurable sections are measurable.
    They cover almost every fiber. Indeed, the factor case gives a successful tuple in each such fiber,
    and the requirements are open in the product $2$-norm topology.
    For this last assertion, telescoping products of unitaries gives
  $ ∥z_1 dots.h.c z_L - z'_1 dots.h.c z'_L∥_2 lt.eq sum_(j = 1)^L ∥z_j - z'_j∥_2 \,
    wide \| tau_s \( x \) \| lt.eq ∥x∥_(2 \, s) \, $
  and inversion is also a $2$-norm isometry on unitaries. The countable dense tuples therefore meet the open set
    of successful choices.
  Take the first successful tuple: on the disjoint measurable sets
  $ E_k \\ union.big_(j < k) E_j $
  use $bold(v)^(\( k \))$, and use the identity tuple on the null complement.
    The resulting sections $u_1 \, dots.h \, u_d$ are measurable and unitary, so belong to $M$.
    Each test has fiber trace of absolute value less than $epsilon \/ 2$ almost everywhere.
    Integrating gives an absolute global trace at most $epsilon \/ 2 < epsilon$, as required. ◻
]

=== 2.2 One measure satisfying all moment tests <one-measure-satisfying-all-moment-tests>

#proof[
  Choose a $2$-norm dense sequence $\( v_j \)_(j gt.eq 1)$ in $cal(U) \( M \)$ and put
  $ mu_0 = sum_(j gt.eq 1) 2^(- j - 1) \( delta_(v_j) + delta_(v_j^(- 1)) \) . $
  For $ell gt.eq 1$, fix the numerical parameters
  $ p_ell & = 2^(- 2^ell) \, & p_0 & = 1 - sum_(ell gt.eq 1) p_ell \,\
n_ell & = p_ell^(- 3 \/ 2) = 2^(3 dot.op 2^(ell - 1)) \, & K_ell & = ell n_ell \,\
d_ell & = K_ell^4 . $
  Here $n_ell$ and $d_ell$ are positive integers, and $p_0 > 0$ because $p_ell lt.eq 4^(- ell)$.
    At time $n_ell$ we will sample $ell$ paths, choosing level $j$ with probability $p_j$ at each increment.
    These parameters make level $ell$ appear in every path with high probability while later levels remain
    unlikely. The much larger label count $d_ell$ makes repeated level-$ell$ labels unlikely across the $K_ell$
    increments. We construct finite symmetric measures
  $ mu_ell = frac(1, 2 d_ell) sum_(j = 1)^(d_ell) \( delta_(u_(ell \, j)) + delta_(u_(ell \, j)^(- 1)) \) $
  successively, and finally set
  $ mu = p_0 mu_0 + sum_(ell gt.eq 1) p_ell mu_ell . $
  At stage $ell$, choose a finite symmetric set $F_ell$ of base atoms with $mu_0 \( F_ell \) > 1 - K_ell^(- 2)$.
    The coefficient alphabet consists of $F_ell$ and all $u_(j \, h)^(plus.minus 1)$ from stages $j < ell$;
    it is finite. Introduce $d_ell$ unknown unitary labels. Consider every ordered list of $ell$ paths of length
    $n_ell$ in this alphabet and the signed unknown labels such that:
  + each path contains at least one unknown label;
  + no unknown label occurs twice anywhere in the entire list, irrespective of sign.
  For each such list and every nonempty reduced word of length at most $ell$ on $ell$ generators,
    require its evaluated trace to have absolute value less than $1 \/ ell$.
    There are finitely many lists and finitely many words: all alphabet sizes, path lengths,
    and word lengths have been fixed before making this choice.
    Designating any one unknown occurrence in each path puts every test under Lemma 6.
    Apply that lemma to choose $u_(ell \, 1) \, dots.h \, u_(ell \, d_ell)$ satisfying all these requirements
    simultaneously. This completes the induction.
  We estimate probabilities on a labeled sampling space. An increment first chooses a level $j$ with probability
    $p_j$. At level zero it chooses an atom with law $mu_0$; at level $j gt.eq
    1$ it chooses one of $d_j$ labels uniformly and an independent uniform sign.
    Its value is then the corresponding unitary. This description gives law $mu$ even when distinct labels happen
    to represent the same element of $M$.
  Sample $ell$ independent paths of length $n_ell$, involving $K_ell$ increments in all.
    Let $cal(B)_ell$ be the union of the following four events:
    a level greater than $ell$ appears; a level-zero increment lies outside $F_ell$;
    a level-$ell$ label is repeated; or some path has no level-$ell$ increment. Union bounds give
  #[#set math.equation(numbering: n => "(2.2)")
   $ Pr \( cal(B)_ell \) & lt.eq K_ell sum_(j > ell) p_j + K_ell p_0 mu_0 \( cal(U) \( M \) \\ F_ell \)\
 & quad + binom(K_ell, 2) / d_ell + ell \( 1 - p_ell \)^(n_ell) . $ <eq:walk-bad-events>]
  For the collision term, any specified pair of increments has probability $p_ell^2 \/ d_ell lt.eq
    1 \/ d_ell$ of using the same level-$ell$ label; the signs do not matter.
    For the last term, a specified path misses that level with probability $\( 1 - p_ell \)^(n_ell)$.
  Every term on the right of (2.2) tends to zero. Indeed, $p_(ell + 1) = p_ell^2$ and $p_ell lt.eq 1 \/ 4$, so
  $ sum_(j > ell) p_j lt.eq frac(p_ell^2, 1 - p_ell^2) lt.eq 16 / 15 p_ell^2 . $
  Consequently, the four terms admit the respective bounds
  $ 16 / 15 ell sqrt(p_ell) \, wide K_ell^(- 1) \, wide frac(1, 2 K_ell^2) \, wide ell exp \( - p_ell^(- 1 \/ 2) \) \, $
  all converging to zero.
  Outside $cal(B)_ell$, the sampled paths form exactly one of the lists tested at stage $ell$.
    All their earlier-level factors belong to the coefficient alphabet, each path has a level-$ell$ label,
    and all occurrences of those labels are distinct. Thus, simultaneously for every $w in bb(F)_ell$ with $1
    lt.eq \| w \| lt.eq ell$, the trace of the evaluated word has absolute value less than $1 \/ ell$.
  Now fix $r$, a nonempty finite $cal(W)$, and $eta > 0$. For $ell gt.eq max { r \, max_(w in cal(W)) \| w \| }$,
    append independent paths to the given $r$ paths to obtain $ell$ paths.
    On the preceding good event every word in $cal(W)$ has absolute trace below $1 \/ ell$.
    Once $1 \/ ell < eta$, the probability in the theorem is at most $Pr \( cal(B)_ell \)$ and therefore tends to zero.
  The measure $mu$ is symmetric and countably supported by construction.
    Its base component has positive weight, so each $v_j$ is a positive-mass atom.
    Since bounded $2$-norm convergence implies strong convergence in the tracial representation,
    the von Neumann algebra generated by these atoms contains every unitary and hence is $M$.
    Finally, the identity group word always has trace one, and every $*$-monomial in unitaries reduces to a group
    word. The asserted convergence therefore describes all joint $*$-moments. ◻
]

#prodef([Remark 2.5.])[
  Theorem 3 asserts convergence of scalar moments. It does not assert convergence of operator norms of polynomials
    in the sampled products. Its finite-family formulation permits further conditions whose failure probabilities
    tend to zero to be imposed simultaneously at any fixed stage of a later selection argument.
] <rem:walk-only-moments>

== 3 A Liouville theorem for the walk <sec:liouville>

We show that a bounded harmonic map for the walk of Theorem 3,
  subject to continuity on bounded sets in the tracial $2$-norm, is left multiplication by its value at $1$.
  The probabilistic part of the proof produces free Haar unitaries such that,
  on words with pairwise distinct unsigned indices, a single map acts by one of two left multipliers according to
  the sign of the first letter. Theorem 11, proved in Section 4,
  forces those multipliers to coincide for bounded linear maps with the same continuity in any finite von Neumann
  algebra with a faithful normal tracial state.

=== 3.1 Continuity and tracial ultrapowers <continuity-and-tracial-ultrapowers>

#prodef([Definition 3.1.])[
  Let $\( N \, rho \)$ be a finite von Neumann algebra with a faithful normal tracial state.
    A linear map $R : N arrow.r N$ is #emph[bounded-ball $2$-continuous] if
  #[#set math.equation(numbering: n => "(3.1)")
   $ sup_j ∥x_j∥ < oo \, wide ∥x_j∥_2 arrow.r 0 quad arrow.r.double quad ∥R \( x_j \)∥_2 arrow.r
     0 . $ <eq:ball-sequential>]
  Here and below $∥x∥_2 = rho \( x^(*) x \)^(1 \/ 2)$ when the ambient algebra is $\( N \, rho \)$.
] <def:ball-continuity>

The following lemma records the continuity needed after each of the two ultrapowers in the argument.
  It applies without a separability assumption.

#thm([Lemma 3.2.])[
  #emph[Let $\( N \, rho \)$ be as in Definition 8, and let $R : N arrow.r N$ be bounded and linear.
    Condition (3.1) is equivalent to the following uniform assertion:
    for every $r < oo$ and $epsilon > 0$ there is $delta > 0$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥x∥ lt.eq r \, quad ∥x∥_2 < delta quad arrow.r.double quad ∥R \( x \)∥_2 < epsilon . $ <eq:ball-modulus>]

 If this condition holds and $omega$ is a free ultrafilter on $bb(N)$, then
#[#set math.equation(numbering: n => "(3.3)")
 $ R^omega : N^omega arrow.r N^omega \, wide
   R^omega \( \[ \( x_j \) \]_omega \) = \[ \( R \( x_j \) \) \]_omega \, $ <eq:ultrapower-map>]

 is a well-defined bounded linear map with $∥R^omega∥ lt.eq ∥R∥$.
   It is bounded-ball $2$-continuous for the ultrapower trace.
   In particular, for every free ultrafilter $nu$, the map $\( R^omega \)^nu$ on $\( N^omega \)^nu$ has the same
   properties.]
] <lem:ultrapower>

#proof[
  If (3.2) fails for some $r \, epsilon$, choose $x_j$ with $∥x_j∥ lt.eq r$, $∥x_j∥_2 < 1 \/ j$,
    and $∥R \( x_j \)∥_2 gt.eq epsilon$. This contradicts (3.1); the converse is immediate.
    Applying the uniform assertion to differences gives uniform $2$-norm continuity on each fixed operator norm ball.
  Use the tracial ultrapower and its ideal $cal(I)_omega$ from (2.1), now for $\( N \, rho \)$. Its tracial norm is
  $ ∥\[ \( x_j \) \]_omega∥_2 = lim_(j arrow.r omega) ∥x_j∥_2 . $
  By (3.2), the coordinate map induced by $R$ preserves $cal(I)_omega$.
    Applying this observation to the difference of two bounded representatives proves that (3.3) is well-defined.
    The quotient norm gives
  $ ∥R^omega \( X \)∥ lt.eq ∥R∥ inf_(\[ \( x_j \) \]_omega = X) sup_j ∥x_j∥ = ∥R∥ ∥X∥ . $
  To transfer the modulus, fix $r < oo$ and $epsilon > 0$, and choose $delta$ in (3.2) for the radius $r +
    1$ and the output tolerance $epsilon \/ 2$. If $∥X∥ lt.eq r$,
    the quotient norm allows a representative with $sup_j ∥x_j∥ lt.eq r + 1$. When $∥X∥_2 < delta \/ 2$, the set
  $ { j : ∥x_j∥_2 < delta } $
  belongs to $omega$. Consequently
  $ ∥R^omega \( X \)∥_2 = lim_(j arrow.r omega) ∥R \( x_j \)∥_2 lt.eq epsilon \/ 2 < epsilon . $
  Thus $delta \/ 2$ is a valid input tolerance for $R^omega$ on the radius-$r$ ball.
    The proof used no separability of $N$ and applies again with $N^omega$ in its place, proving the last assertion. ◻
]

=== 3.2 The harmonic map and its martingale <the-harmonic-map-and-its-martingale>

The probabilistic step uses the classical passage from harmonic functions to martingales along random products;
  see #cite(label("Furstenberg1963")) p. 415. Here the function is $D \( g \) =
  T \( g \) g^(*)$ with values in $L^2 \( M \, tau \)$, and the required convergence follows directly from
  orthogonality of Hilbert-space martingale increments.

#thm([Theorem 3.3.])[
  #emph[Let $\( M \, tau \)$ be a type $upright("II")_1$ von Neumann algebra with separable predual and a faithful
    normal tracial state, and let $mu$ be the measure supplied by Theorem 3.
    Suppose that $T : M arrow.r M$ is bounded, linear, and bounded-ball $2$-continuous, and that
#[#set math.equation(numbering: n => "(3.4)")
 $ T \( x \) = bb(E)_(U tilde.op mu) #scale(x: 120%, y: 120%)[\[] T \( x U \) U^(*) #scale(x: 120%, y: 120%)[\]]
   wide \( x in M \) . $ <eq:harmonic-map>]

 Then
#[#set math.equation(numbering: n => "(3.5)")
 $ T \( x \) = T \( 1 \) x wide \( x in M \) . $ <eq:liouville-conclusion>]

]
] <thm:liouville>

#proof[
  Write $C = ∥T∥$ and $H = L^2 \( M \, tau \)$. Expectations in (3.4) are norm-convergent sums,
    since $mu$ is countably supported and $∥T \( x U \) U^(*)∥ lt.eq C ∥x∥$. For $g in cal(U) \( M \)$ put
  $ D \( g \) = T \( g \) g^(*) . $
  Let $U_1 \, U_2 \, dots.h$ be independent with law $mu$, and set $W_0 = 1$, $W_n = U_1 dots.h.c U_n$,
    and $cal(F)_n = sigma \( U_1 \, dots.h \, U_n \)$. The $H$-valued random variables $Z_n =
    D \( W_n \)$ have countable range and satisfy $∥Z_n∥_2 lt.eq ∥Z_n∥ lt.eq C$. Moreover,
  $ bb(E) \[ Z_(n + 1) divides cal(F)_n \] & = bb(E) #scale(x: 120%, y: 120%)[\[] T \( W_n U_(n + 1) \)
    U_(n + 1)^(*) W_n^(*) divides cal(F)_n #scale(x: 120%, y: 120%)[\]]\
 & = T \( W_n \) W_n^(*) = Z_n . $
  Thus $\( Z_n \)$ is a martingale in $L^2 \( Omega \; H \)$. Its increments are orthogonal, and
  $ ∥Z_0∥_2^2 + sum_(j = 0)^(n - 1) bb(E) ∥Z_(j + 1) - Z_j∥_2^2 = bb(E) ∥Z_n∥_2^2 lt.eq C^2 . $
  It follows that $Z_n$ converges in $L^2 \( Omega \; H \)$ to a random variable $Z_oo$,
    and continuity of conditional expectation gives $Z_n = bb(E) \[ Z_oo divides cal(F)_n \]$. In particular, with
  #[#set math.equation(numbering: n => "(3.6)")
   $ e_k = bb(E) ∥Z_oo - Z_k∥_2^2 arrow.r 0 \, $ <eq:martingale-error>]
  orthogonality gives the uniform Cauchy estimate
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(E) ∥Z_n - Z_k∥_2^2 = e_k - e_n lt.eq e_k wide \( n gt.eq k \) . $ <eq:martingale-cauchy>]
  The operator norm ball $K_C = { x in M : ∥x∥ lt.eq C }$ is closed in $H$.
    Indeed, from a $2$-norm-convergent sequence in $K_C$, ultraweak compactness provides an ultraweakly convergent
    subnet with limit in $K_C$. Testing against $tau \( y^(*) thin dot.op \)$, for $y in M$,
    identifies this limit with the $H$-limit, since $M$ is dense in $H$.
    A subsequence of $Z_n$ converges almost surely in $H$, so $Z_oo in K_C$ almost surely.
  If $Z_oo = c$ almost surely, conditional expectation gives $Z_0 = Z_1 = c$ almost surely.
    Hence $c = T \( 1 \)$ and $D \( u \) = c$ at every atom $u$ of $mu$.
    These atoms contain a $2$-norm-dense subset of $cal(U) \( M \)$ by Theorem 3.
    For any $u in cal(U) \( M \)$, choose atoms $u_j$ with $∥u_j - u∥_2 arrow.r 0$.
    Bounded-ball continuity gives $T \( u_j \) arrow.r T \( u \)$ in $2$-norm, while $∥c u_j -
    c u∥_2 lt.eq ∥c∥ ∥u_j - u∥_2 arrow.r 0$. Since $T \( u_j \) = c u_j$, we obtain $T \( u \) = c u$.
    Every element of a unital complex $C^(*)$-algebra is a finite linear combination of unitaries,
    proving (3.5) in this case.
  Suppose, for a contradiction, that $Z_oo$ is not deterministic.
    Its law is a Borel probability measure on the separable Hilbert space $H$,
    so its support contains two distinct points $a \, b$. Because $K_C$ is closed and has full measure, $a \,
    b in K_C subset M$.
  #emph[Forward and reverse endpoints.] We claim that, for every $delta > 0$,
    there are numbers $eta_delta > 0$ and $N_delta$ such that, whenever $n gt.eq N_delta$ and $G$ has law $mu^(* n)$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ Pr #scale(x: 120%, y: 120%)[\(] ∥D \( G \) - a∥_2 < delta \, med ∥D \( G^(- 1) \) -
     b∥_2 < delta #scale(x: 120%, y: 120%)[\)] gt.eq eta_delta . $ <eq:two-endpoints>]
  Realize $G = U_1 dots.h.c U_n$, let $h = floor.l n \/ 2 floor.r$, and put
  $ A_n = D \( U_1 dots.h.c U_h \) \, wide B_n = D \( U_n^(- 1) dots.h.c U_(n - h + 1)^(- 1) \) . $
  The two variables use disjoint sets of increments and are independent.
    Symmetry of $mu$ implies that both have the law of $Z_h$.
    Apply (3.7) to the forward string and separately to the reversed inverse string,
    which is also a string of independent increments with law $mu$. It gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ bb(E) ∥D \( G \) - A_n∥_2^2 lt.eq e_h \, wide bb(E) ∥D \( G^(- 1) \) - B_n∥_2^2 lt.eq
     e_h . $ <eq:endpoint-replacement>]
  For fixed $delta$, the support property gives
  $ p_a = Pr \( ∥Z_oo - a∥_2 < delta \/ 3 \) > 0 \, wide p_b = Pr \( ∥Z_oo - b∥_2 < delta \/ 3 \) > 0 . $
  Mean-square convergence implies, for all sufficiently large $h$,
  $ Pr \( ∥Z_h - a∥_2 < 2 delta \/ 3 \) gt.eq p_a \/ 2 \, wide Pr \( ∥Z_h - b∥_2 < 2 delta \/ 3 \) gt.eq p_b \/ 2 . $
  Independence of $A_n \, B_n$, the triangle inequality, and Markov’s inequality therefore bound the probability
    in (3.8) from below by
  $ frac(p_a p_b, 4) - frac(18 e_h, delta^2) . $
  For large $n$ this is at least $p_a p_b \/ 8$, proving the claim.
    The independence used here is that of the disjoint prefixes $A_n \, B_n$;
    the variables $G$ and $G^(- 1)$ remain dependent.
  #emph[Concatenation of independent blocks.] Let $G_1 \, dots.h \, G_m$ be independent with law $mu^(* n)$,
    and consider
  $ v \( G \) = G_(i_1)^(sigma_1) dots.h.c G_(i_t)^(sigma_t) \, wide sigma_j in { 1 \, - 1 } \, $
  where $i_1 \, dots.h \, i_t$ are pairwise distinct. Each inverse block can be represented by reversing and
    inverting its own increments. By symmetry, concatenating these distinct signed blocks is a length-$t
    n$ walk with independent increments of law $mu$. In particular,
  $ #scale(x: 120%, y: 120%)[\(] D \( v \( G \) \) \, D \( G_(i_1)^(sigma_1) \) #scale(x: 120%, y: 120%)[\)] quad
    upright("has the law of") quad \( Z_(t n) \, Z_n \) . $
  Consequently
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E) ∥D \( v \( G \) \) - D \( G_(i_1)^(sigma_1) \)∥_2^2 lt.eq e_n . $ <eq:independent-blocks>]
  The restriction is on unsigned indices: using both $G_i$ and $G_i^(- 1)$ would reuse a block and would not
    justify this estimate.
  #emph[Finite requirements and diagonal selection.] Fix an integer $m gt.eq 1$ first,
    and use tolerance $1 \/ m$ in (3.8). For $m$ independent length-$n$ products, let $E_(m \, n)$ be the event
  $ ∥D \( G_i \) - a∥_2 < 1 \/ m \, wide ∥D \( G_i^(- 1) \) - b∥_2 < 1 \/ m quad \( 1 lt.eq i lt.eq m \) . $
  Independence between the paths gives numbers $c_m > 0$ and $N_m$ such that
  #[#set math.equation(numbering: n => "(3.11)")
   $ Pr \( E_(m \, n) \) gt.eq c_m wide \( n gt.eq N_m \) . $ <eq:conditioning-mass>]
  For example, one may take $c_m = \( eta_(1 \/ m) \)^m$.
  Let $cal(Q)_m$ be the finite set of nonidentity reduced words of length at most $m$ on the symbols $x_1 \,
    dots.h \, x_m$. Let $cal(V)_m$ be the finite set of all nonempty signed words on these symbols with pairwise
    distinct unsigned indices. Along the times $n_ell$ in Theorem 3, the probability that any of the requirements
  #[#set math.equation(numbering: n => "(3.12)")
   $ \| tau \( q \( G_1 \, dots.h \, G_m \) \) \| & < 1 \/ m &  & \( q in cal(Q)_m \) \,\
∥D \( v \( G \) \) - D \( G_(i_1)^(sigma_1) \)∥_2 & < 1 \/ m &  & #scale(x: 120%, y: 120%)[\(] v =
  x_(i_1)^(sigma_1) dots.h.c x_(i_t)^(sigma_t) in cal(V)_m #scale(x: 120%, y: 120%)[\)] $ <eq:selected-moments>]
  fails tends to zero. For the first line, this is a finite union of the moment convergence statements in
    Theorem 3. For the second line, the union bound and (3.10) give the upper bound $\| cal(V)_m \| m^2 e_(n_ell)$.
  Choose $ell_m > ell_(m - 1)$, after fixing $m$, so large that $n_(ell_m) gt.eq
    N_m$ and this combined failure probability is less than $c_m \/ 2$.
    Then the intersection of $E_(m \, n_(ell_m))$ with all the requirements (3.12)–(3.12) has probability at least
    $c_m \/ 2 > 0$. Choose a deterministic tuple
  $ \( u_1^(\( m \)) \, dots.h \, u_m^(\( m \)) \) in cal(U) \( M \)^m $
  from that intersection. The constants $c_m$ may tend to zero as fast as they please:
    the choice of $ell_m$ is made separately for each fixed $m$, after the positive lower bound has been obtained.
  Write $a_1 = a$ and $a_(- 1) = b$. The endpoint conditions and (3.12) imply, for every $v =
    x_(i_1)^(sigma_1) dots.h.c x_(i_t)^(sigma_t) in cal(V)_m$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ ∥T \( v \( u^(\( m \)) \) \) - a_(sigma_1) v \( u^(\( m \)) \)∥_2 = ∥D \( v \( u^(\( m \)) \) \) -
     a_(sigma_1)∥_2 < 2 \/ m . $ <eq:selected-multipliers>]
  The equality uses $T \( v \) = D \( v \) v$ and the $2$-norm isometry of right multiplication by the unitary $v$.
  #emph[The exact family in the ultrapower.] Fix a free ultrafilter $omega_1$ on the tuple index $m$.
    Set $u_i^(\( m \)) = 1$ when $m < i$, and define
  $ N = M^(omega_1) \, wide g_i = \[ \( u_i^(\( m \)) \)_(m gt.eq 1) \]_(omega_1) quad \( i gt.eq 1 \) \, wide R =
    T^(omega_1) . $
  Lemma 9 makes $R$ a bounded linear map on $N$, with $∥R∥ lt.eq C$, and supplies its bounded-ball $2$-continuity.
    Each $g_i$ is unitary. Every fixed nonidentity reduced word $q$ lies in $cal(Q)_m$ for all sufficiently large
    $m$, so (3.12) gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ tau^(omega_1) \( q \( g_1 \, g_2 \, dots.h \) \) = 0 . $ <eq:exact-haar-family>]
  These are precisely the joint moments of a countable free Haar family:
    powers of one generator are centered, and expansion of alternating centered Laurent polynomials in different
    generators reduces to nonidentity words. The corresponding freeness of their generated von Neumann algebras
    follows by bounded $2$-norm approximation.
  Identify $a \, b in M$ with their constant images in $N$.
    For every nonempty word $w = g_(i_1)^(sigma_1) dots.h.c g_(i_t)^(sigma_t)$ with pairwise distinct unsigned
    indices, (3.13) holds for all sufficiently large tuple indices. Hence it becomes the exact identity
  #[#set math.equation(numbering: n => "(3.15)")
   $ R \( w \) = cases(delim: "{", a w \, & sigma_1 = 1 \,, b w \, & sigma_1 = - 1 .) $ <eq:first-letter-multipliers>]
  These are all the hypotheses of Theorem 11, applied to $\( N \, tau^(omega_1) \)$ and $R$.
    That theorem yields $a = b$ in $N$. The constant embedding preserves the faithful trace,
    so this also means $a = b$ in $M$, contrary to their choice.
    Thus $Z_oo$ is deterministic, and the earlier argument proves (3.5). ◻
]

Only the scalar joint moments of the $g_i$ and the identities (3.15) enter the rigidity theorem.
  Freeness of these unitaries from $a$ or $b$ is not asserted or needed.

== 4 Rigidity of the first-letter identities <sec:rigidity>

The identities furnished by the walk concern words whose unsigned indices are pairwise distinct.
  We prove that their two left multipliers must agree. This rules out the distinct martingale endpoints
  constructed in Section 3.

#thm([Theorem 4.1.])[
  #emph[Let $\( N \, tau \)$ be a finite von Neumann algebra with a faithful normal tracial state.
    Let $R : N arrow.r N$ be bounded and complex linear, and suppose that
#[#set math.equation(numbering: n => "(4.1)")
 $ ∥R \( x_n \)∥_2 arrow.r 0 quad upright("whenever") quad sup_n ∥x_n∥ < oo \, wide ∥x_n∥_2 arrow.r
   0 . $ <eq:rigidity-continuity>]

 Let $\( g_j \)_(j gt.eq 1)$ be a free Haar family in $N$, and let $a \, b in N$.
   Suppose that for every nonempty signed word $w = g_(i_1)^(epsilon_1) dots.h.c
   g_(i_q)^(epsilon_q)$ with $epsilon_j in { 1 \, - 1 }$ and pairwise distinct indices $i_1 \, dots.h \, i_q$,
#[#set math.equation(numbering: n => "(4.2)")
 $ R \( w \) = cases(delim: "{", a w \, & epsilon_1 = 1 \,, b w \, & epsilon_1 = - 1 .) $ <eq:rigidity-first-letter>]

 Then $a = b$.]
] <thm:rigidity>

Here the free Haar condition means that the trace of every nonidentity reduced group word in the $g_j$ is zero.
  In particular, distinct reduced words are orthonormal for the tracial $2$-norm.
  The coefficients $a \, b$ are arbitrary elements of the containing algebra.

The target is a unitary whose positive powers carry the multiplier $a$ and whose negative powers carry the
  multiplier $b$. A spectral argument will show that these identities force $a =
  b$ for a bounded map in a finite tracial algebra. Higher powers of any one $g_j$ repeat its unsigned index,
  so the hypothesis does not give this target directly. Instead, we average many free generators,
  control the repeated indices in suitable polynomial expressions,
  and pass to the polar part of the resulting element in a further tracial ultrapower.

=== 4.1 Norm control for free words <norm-control-for-free-words>

We use the following form of Haagerup’s length estimate #cite(label("Haagerup1979")) Lemma 1.4.
  We give the proof, including the transfer from the regular representation to the containing tracial algebra.

#thm([Lemma 4.2.])[
  #emph[Let $bb(F)_r$ be the free group on $r$ generators and let $lambda$ be its left regular representation.
    For a finitely supported family $\( c_w \)_(\| w \| = q)$ on the reduced words of length $q gt.eq 0$,
#[#set math.equation(numbering: n => "(4.3)")
 $ ∥sum_(\| w \| = q) c_w lambda \( w \)∥ lt.eq \( q + 1 \) (sum_(\| w \| = q) \| c_w \|^2)^(1 \/ 2) .
   $ <eq:rigidity-length>]

 If $g_1 \, dots.h \, g_r$ have free Haar joint moments in a faithfully tracial von Neumann algebra,
   every scalar-coefficient word polynomial in them has the same norm as the corresponding polynomial in the
   regular generators. Consequently, (4.3) also holds with $lambda \( w \)$ replaced by $w \( g \)$,
   and its right-hand side is $\( q + 1 \) ∥sum_(\| w \| = q) c_w w \( g \)∥_2$.]
] <lem:rigidity-length>

#proof[
  Write $L = sum_(\| w \| = q) c_w lambda \( w \)$. On the standard basis of $ell^2 \( bb(F)_r \)$,
    separate each product $w x$ according to its exact number $t in { 0 \, dots.h \,
    q }$ of cancellations at the joining boundary. This gives $L =
    sum_(t = 0)^q L_t$ on finitely supported vectors. Fix $t$. Such a product has the form
  $ w = u v \, wide x = v^(- 1) h \, wide w x = u h \, wide \| u \| = q - t \, quad \| v \| = t \, $
  where all three displayed concatenations $u v$, $v^(- 1) h$, and $u h$ are reduced.
    Conversely, these conditions describe exactly the products with $t$ cancellations, allowing any of $u \, v \,
    h$ to be empty when its required length permits this. In particular, $h$ may be empty when the input is exhausted.
  For this fixed $t$, an input basis word of length at least $t$ has a unique prefix of length $t$ and hence a
    unique suffix $h$. An output basis word of length at least $q -
    t$ likewise determines $h$ uniquely by removing its prefix of length $q - t$.
    Thus the input spaces indexed by different $h$ are orthogonal, as are the corresponding output spaces.
    Relative to these two decompositions, $L_t$ is a direct sum of matrices $B_h$,
    with columns indexed by $v$ and rows by $u$. An entry is $c_(u v)$ when the three reduction conditions hold
    and is zero otherwise. The fixed cutting length makes $\( u \, v \) mapsto u v$ injective within each matrix.
    Therefore
  $ ∥B_h∥ lt.eq ∥B_h∥_(upright("HS")) lt.eq (sum_(\| w \| = q) \| c_w \|^2)^(1 \/ 2) . $
  Taking the direct-sum norm bounds $L_t$ by the same quantity.
    Summing over the $q + 1$ possible values of $t$ proves (4.3).
  For the norm transfer, recall that if $A gt.eq 0$ belongs to a von Neumann algebra with faithful tracial state
    $rho$, then
  #[#set math.equation(numbering: n => "(4.4)")
   $ ∥A∥ = lim_(n arrow.r oo) rho \( A^n \)^(1 \/ n) . $ <eq:rigidity-norm-moments>]
  The upper bound is immediate. If $0 < c < ∥A∥$, the spectral projection $e =
    1_(\( c \, oo \)) \( A \)$ is nonzero and has positive trace, so $rho \( A^n \) gt.eq c^n rho \( e \)$.
    Taking roots and then letting $c arrow.t ∥A∥$ proves the formula.
    For a word polynomial $p$, the free Haar moments give, for every $n gt.eq 1$,
  $ tau #scale(x: 120%, y: 120%)[\(] \( p \( g \)^(*) p \( g \) \)^n #scale(x: 120%, y: 120%)[\)] =
    tau_(bb(F)_r) #scale(x: 120%, y: 120%)[\(] \( p \( lambda \)^(*) p \( lambda \) \)^n
    #scale(x: 120%, y: 120%)[\)] . $
  Both traces are faithful; here $tau_(bb(F)_r)$ is the canonical trace on the free group von Neumann algebra.
    Applying (4.4) gives $∥p \( g \)∥ = ∥p \( lambda \)∥$. The asserted $2$-norm formula follows from
    orthonormality of reduced words. ◻
]

Under the hypotheses of Theorem 11, set

#[#set math.equation(numbering: n => "(4.5)")
 $ s_r = r^(- 1 \/ 2) sum_(j = 1)^r g_j in N . $ <eq:rigidity-normalized-sums>]

Lemma 12 gives $∥s_r∥_2 = 1$ and $∥s_r∥ lt.eq 2$ for every $r$. Fix a free ultrafilter $omega_2$ on $bb(N)$ and put

#[#set math.equation(numbering: n => "(4.6)")
 $ hat(N) = N^(omega_2) \, wide hat(tau) = tau^(omega_2) \, wide s = \( s_r \)_(omega_2) in hat(N) \, wide S =
   R^(omega_2) . $ <eq:rigidity-second-ultrapower>]

Lemma 9 ensures that $S$ is bounded and retains $2$-norm continuity on operator norm balls.
  We identify $a \, b$ with their constant images in $hat(N)$.

In the application from Section 3, $N = M^(omega_1)$ and $hat(N) = \( M^(omega_1) \)^(omega_2)$.
  The first index $m$ selects increasingly accurate unitary tuples;
  the second index $r$ increases the number of exact free generators being averaged in $N$,
  where the bound $∥s_r∥ lt.eq 2$ is already available. The hypotheses and notation of Theorem 11 remain in force
  through the next two subsections.

Figure 1 locates the two ultrapowers in the Liouville argument and records the remaining passage from these
  bounded sums to a polar unitary and then to $a = b$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 1,
  align: (center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[The fixed walk has asymptotically free moments. A hypothetical nonconstant harmonic-map martingale has distinct support points $a \, b in M$.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b$finite selection and the first ultrapower
],
  table.cell(rowspan: 1, colspan: 1)[In $N = M^(omega_1)$: exact free Haar unitaries $g_1 \, g_2 \, dots.h$ and exact first-letter identities for $R = T^(omega_1)$.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b$free-group length estimate in $N$
],
  table.cell(rowspan: 1, colspan: 1)[$s_r = r^(- 1 \/ 2) sum_(j = 1)^r g_j$ satisfies $∥s_r∥ lt.eq 2$. In each fixed product of blocks $s_r \( s_r^(*) s_r \)^d$, $d gt.eq 0$, terms with repeated surviving indices have total norm tending to zero.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b$the second ultrapower and polar approximation
],
  table.cell(rowspan: 1, colspan: 1)[In $hat(N) = N^(omega_2)$: $s = \( s_r \)_(omega_2)$ has a unitary polar part $V$, and $S = R^(omega_2)$ satisfies $S \( V^k \) = a V^k$, $S \( V^(- k) \) = b V^(- k)$.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b$bounded sine sums and the finite faithful trace
],
  table.cell(rowspan: 1, colspan: 1)[$a = b$, a contradiction. Hence $T \( x \) = T \( 1 \) x$. Last-input averaging then produces the tracial cocycle primitive.
],
)
]],
  caption: [Figure 1: The Liouville contradiction and its use for cocycles. The first ultrapower uses scalar moment convergence; the norm bound is proved for the exact free family before the second ultrapower. The constants $a \, b$ are carried through the trace-preserving constant embeddings, and the power identities hold for every $k gt.eq 1$. ],
) <fig:proof-map>

=== 4.2 From distinct indices to ordered blocks <from-distinct-indices-to-ordered-blocks>

Polynomial expressions in $s_r$ may contain repeated indices,
  so their multiplier identities do not follow directly from the hypothesis.
  For polar approximation we will need powers of $s p \( s^(*) s \)$, where $p$ is a scalar polynomial.
  Expanding these powers without commuting any factors gives products of the blocks $B_d \( z \) =
  z \( z^(*) z \)^d$, $d gt.eq 0$. We establish their identities by showing that repeated surviving indices
  contribute an error tending to zero in operator norm.

#thm([Lemma 4.3.])[
  #emph[For every $k gt.eq 1$ and $d_1 \, dots.h \, d_k gt.eq 0$, let
$ P \( z \) = B_(d_1) \( z \) B_(d_2) \( z \) dots.h.c B_(d_k) \( z \) . $

 Then
#[#set math.equation(numbering: n => "(4.7)")
 $ S \( P \( s \) \) = a P \( s \) \, wide S \( P \( s \)^(*) \) = b P \( s \)^(*) . $ <eq:rigidity-block-identities>]

]
] <lem:rigidity-blocks>

#proof[
  Fix this product, and let $L = sum_(j = 1)^k \( 2 d_j + 1 \)$ be its degree.
    Every term in the expansion of one block $B_d \( s_r \)$ has the odd alternating sign pattern
  $ + \, - \, + \, - \, dots.h \, + . $
  Deleting adjacent inverse letters deletes two consecutive opposite signs.
    The remaining pattern is still alternating, begins and ends positively, and is nonempty:
    the excess of positive over negative signs remains one. Hence the free reduction of each block is a nonempty
    word with positive endpoint signs. After reducing the blocks internally,
    their boundaries join two positive letters and admit no further cancellation.
    Every reduced word in $P \( s_r \)$ is therefore nonempty and begins and ends positively.
    Taking adjoints reverses the block order and all signs, so the corresponding assertion for $P \( s_r \)^(*)$
    has negative endpoint signs.
  We next bound the coefficient of every possible reduced word, including words much shorter than $L$. Write
  $ P \( s_r \) = sum_(q = 1)^L sum_(\| w \| = q) c_w \( r \) w \( g \) . $
  For a fixed reduced word $w$ of length $q$, record a free reduction of an original term by pairing its original
    positions whenever their letters cancel. For definiteness,
    the reduction may be performed by reading from left to right and canceling against the last surviving letter
    whenever possible. The recorded pairs form a noncrossing partial matching of the $L$ positions:
    there are $\( L - q \) \/ 2$ pairs, and the unmatched positions spell $w$ in order.
    All nested and newly adjacent cancellations are included in this record.
  There are at most $3^L$ noncrossing partial matchings of $L$ positions.
    Indeed, mark each position as an opening endpoint, a closing endpoint, or unmatched;
    noncrossing forces a closing endpoint to pair with the last unpaired opening endpoint,
    so this encoding is injective. We may count every such partial matching,
    including ones not realized by a reduction. For a fixed pattern and fixed $w$,
    the labels at the unmatched positions are prescribed. Each canceled pair has equal unsigned labels and
    opposite signs and hence has at most $r$ label choices. Coincidences between different pairs or with unmatched
    positions can only reduce the number of choices. Each original term has coefficient $r^(- L \/ 2)$.
    Consequently, for every $q$ and $w$,
  #[#set math.equation(numbering: n => "(4.8)")
   $ \| c_w \( r \) \| lt.eq C_L r^(\( L - q \) \/ 2) r^(- L \/ 2) = C_L r^(- q \/ 2) \, wide C_L =
     3^L . $ <eq:rigidity-coefficient-bound>]
  An impossible parity or reduction pattern contributes zero. The same bound applies to the adjoint polynomial.
  Let $E_(r \, q)$ be the sum of those length-$q$ terms whose #emph[surviving reduced word] has a repeated
    unsigned index. Original repetitions which disappear in the reduction remain included in the coefficients of
    the retained words. For $q = 1$ this sum is zero. For $q gt.eq 2$ the number of possible words in the sum is at most
  $ 2^q binom(q, 2) r^(q - 1) : $
  choose a pair of equal-index positions, choose their common label and the other $q - 2$ labels,
    and choose all signs. Counting nonreduced strings here only enlarges the bound. By orthonormality and (4.8),
  #[#set math.equation(numbering: n => "(4.9)")
   $ ∥E_(r \, q)∥_2^2 lt.eq C_L^2 2^q binom(q, 2) r^(- 1) wide \( 2 lt.eq q lt.eq L \) . $ <eq:rigidity-discard-ltwo>]
  Lemma 12 now yields the aggregate operator norm estimate
  #[#set math.equation(numbering: n => "(4.10)")
   $ E_r = sum_(q = 1)^L E_(r \, q) \, wide ∥E_r∥ lt.eq sum_(q = 2)^L \( q + 1 \) ∥E_(r \, q)∥_2 =
     O_L \( r^(- 1 \/ 2) \) arrow.r 0 . $ <eq:rigidity-discard-norm>]
  There is no scalar term, by the block reduction argument.
  Put $Q_r = P \( s_r \) - E_r$. Each word in this finite sum has pairwise distinct unsigned indices and begins
    positively. Thus (4.2) and linearity give $R \( Q_r \) = a Q_r$.
    Moreover, $∥P \( s_r \)∥ lt.eq 2^L$, so (4.10) also proves that the sequence $\( Q_r \)$ is bounded. In $N$ we have
  $ ∥R \( P \( s_r \) \) - a P \( s_r \)∥ lt.eq \( ∥R∥ + ∥a∥ \) ∥E_r∥ arrow.r 0 . $
  Passing to $hat(N)$ proves the first identity in (4.7). For the adjoint, the retained sum is $Q_r^(*)$:
    its reduced words have distinct unsigned indices and begin negatively.
    Therefore $R \( Q_r^(*) \) = b Q_r^(*)$, and the identical estimate with $b$ proves the second identity. ◻
]

=== 4.3 A polar unitary and all its powers <a-polar-unitary-and-all-its-powers>

The spectral calculation below is related to the polar decomposition of circular elements in free probability,
  established by Voiculescu and also proved by Banica #cite(label("Voiculescu1990Circular"))
  #cite(label("Banica1996Polar")). We derive the required Catalan moments and spectral distribution directly.
  Only the absence of an atom at zero is needed to obtain the unitary polar part.

#thm([Lemma 4.4.])[
  #emph[The polar part $V$ of $s$ is a unitary in $hat(N)$, and
#[#set math.equation(numbering: n => "(4.11)")
 $ S \( V^k \) = a V^k \, wide S \( V^(- k) \) = b V^(- k) wide \( k gt.eq 1 \) . $ <eq:rigidity-power-identities>]

]
] <lem:rigidity-polar>

#proof[
  We first show that $s$ has zero kernel, which makes its polar part unitary in the finite algebra.
    We then transfer the block identities to powers of that unitary. Set $A = s^(*) s$, so $0 lt.eq A lt.eq 4$.
    To determine its kernel, we compute its moments. For $d gt.eq 1$,
    the quantity $tau \( \( s_r^(*) s_r \)^d \)$ is $r^(- d)$ times the number of assignments of labels in ${ 1 \,
    dots.h \, r }$ to the alternating $2 d$ positions
  $ - \, + \, - \, + \, dots.h \, - \, + $
  whose word reduces to the identity. An identity reduction pairs all positions noncrossingly,
    so it uses at most $d$ unsigned labels. Assignments using at most $d - 1$ labels number $O_d \( r^(d - 1) \)$:
    for each number of labels, choose an ordered list of those labels and then assign a member of that list to
    each of the $2 d$ positions.
  If exactly $d$ labels occur in an identity word, every label occurs twice.
    Its two occurrences must be paired in any cancellation matching,
    so the matching is uniquely determined by the labeling. Conversely, in a noncrossing perfect matching,
    every pair has an even number of positions inside it, since those positions must be matched among themselves.
    The endpoints therefore have opposite parities, and hence opposite signs in our alternating string.
    Assigning distinct labels to its $d$ pairs gives an identity word: erase innermost pairs successively.
    It follows that the number of leading assignments is exactly
  $ C_d \( r \)_d \, wide \( r \)_d = r \( r - 1 \) dots.h.c \( r - d + 1 \) \, $
  where $C_d$ is the number of noncrossing perfect matchings on $2 d$ positions.
    Choosing the partner of the first position gives $C_0 = 1$ and $C_d = sum_(j = 0)^(d - 1) C_j C_(d - 1 - j)$.
    The generating function thus satisfies $C \( z \) = 1 + z C \( z \)^2$; its solution with constant term one gives
  $ C_d = frac(1, d + 1) binom(2 d, d) . $
  Consequently,
  #[#set math.equation(numbering: n => "(4.12)")
   $ hat(tau) \( A^d \) = lim_(r arrow.r omega_2) tau \( \( s_r^(*) s_r \)^d \) =
     lim_(r arrow.r oo) r^(- d) #scale(x: 120%, y: 120%)[\(] C_d \( r \)_d +
     O_d \( r^(d - 1) \) #scale(x: 120%, y: 120%)[\)] = C_d . $ <eq:rigidity-catalan-moments>]
  The zeroth moment is also $C_0 = 1$.
  Consider the measure
  #[#set math.equation(numbering: n => "(4.13)")
   $ d nu \( x \) = frac(1, 2 pi) sqrt(frac(4 - x, x)) thin 1_(\( 0 \, 4 \)) \( x \) thin d x . $ <eq:rigidity-mp-law>]
  For every integer $d gt.eq 0$, substitution $x = 4 t$ and the beta integral give
  $ integral_0^4 x^d thin d nu \( x \) & = frac(4^(d + 1), 2 pi) integral_0^1 t^(d - 1 \/ 2) \( 1 - t \)^(1 \/ 2)
    thin d t\
 & = frac(4^(d + 1), 2 pi) frac(Gamma \( d + 1 / 2 \) Gamma \( 3 / 2 \), Gamma \( d + 2 \)) =
   frac(\( 2 d \) !, d ! \( d + 1 \) !) = C_d . $
  In particular, $nu$ is a probability measure. Both $nu$ and the spectral distribution of $A$ are supported in
    $\[ 0 \, 4 \]$. Equality of all their moments implies equality on polynomials and then on all continuous
    functions by uniform polynomial approximation. They are therefore the same measure.
    Since (4.13) has no atom at zero,
  $ hat(tau) \( 1_({ 0 }) \( A \) \) = 0 \, wide 1_({ 0 }) \( A \) = 0 $
  by faithfulness. In the polar decomposition $s = V A^(1 \/ 2)$ this gives $V^(*) V = 1$.
    Traciality and faithfulness then give
  $ hat(tau) \( 1 - V V^(*) \) = 1 - hat(tau) \( V^(*) V \) = 0 \, wide V V^(*) = 1 . $
  Thus $V$ is a unitary.
  It remains to transfer the identities. For a fixed regularization parameter we will use polynomial approximation
    in operator norm; we will then remove the regularization using bounded-ball $2$-continuity. For $epsilon > 0$ put
  $ x_epsilon = s \( A + epsilon 1 \)^(- 1 \/ 2) = V (frac(A, A + epsilon 1))^(1 \/ 2) . $
  Fix $k gt.eq 1$. A polynomial $p \( t \) = sum_(d = 0)^D c_d t^d$ has the literal ordered expansion
  #[#set math.equation(numbering: n => "(4.14)")
   $ \[ s p \( A \) \]^k = sum_(d_1 \, dots.h \, d_k = 0)^D c_(d_1) dots.h.c c_(d_k) \[ s A^(d_1) \]
     dots.h.c \[ s A^(d_k) \] . $ <eq:rigidity-ordered-expansion>]
  Every summand is a product covered by Lemma 13. That lemma and complex linearity yield
  $ S \( \[ s p \( A \) \]^k \) = a \[ s p \( A \) \]^k \, wide S \( \( \[ s p \( A \) \]^k \)^(*) \) =
    b \( \[ s p \( A \) \]^k \)^(*) . $
  For the second identity one takes the adjoint of the expansion (4.14),
    conjugating its scalar coefficients and reversing the block order,
    and applies the separate adjoint identity in Lemma 13. Choose polynomials converging uniformly on
    $\[ 0 \, 4 \]$ to $\( t + epsilon \)^(- 1 \/ 2)$. Functional calculus and boundedness of $S$ pass the last two
    identities to the norm limit, giving
  #[#set math.equation(numbering: n => "(4.15)")
   $ S \( x_epsilon^k \) = a x_epsilon^k \, wide S \( \( x_epsilon^k \)^(*) \) =
     b \( x_epsilon^k \)^(*) . $ <eq:rigidity-regularized-powers>]
  The $x_epsilon$ are contractions, and their distance to $V$ satisfies
  $ ∥x_epsilon - V∥_2^2 = integral_0^4 (sqrt(frac(x, x + epsilon)) - 1)^2 thin d nu \( x \) arrow.r 0 $
  by dominated convergence and $nu \( { 0 } \) = 0$. Multiplication satisfies $∥x y z∥_2
    lt.eq ∥x∥ ∥y∥_2 ∥z∥$ in a tracial algebra. The noncommutative telescoping identity
  $ x_epsilon^k - V^k = sum_(j = 0)^(k - 1) x_epsilon^j \( x_epsilon - V \) V^(k - 1 - j) $
  therefore shows that $∥x_epsilon^k - V^k∥_2 lt.eq k ∥x_epsilon - V∥_2 arrow.r 0$;
    the same holds for their adjoints. All these powers are contractions.
    Using the bounded-ball $2$-norm continuity of $S$ in (4.15), along for example $epsilon = 1 \/ n$, proves (4.11). ◻
]

=== 4.4 The spectral conclusion <the-spectral-conclusion>

The final step uses boundedness, the identities for powers, and the finite faithful trace.
  No continuity assumption on the map is needed in Lemma 15.

#thm([Lemma 4.5.])[
  #emph[Let $\( cal(A) \, rho \)$ be a finite von Neumann algebra with faithful normal tracial state,
    let $V in cal(A)$ be unitary, and let $S : cal(A) arrow.r cal(A)$ be bounded and complex linear.
    If $a \, b in cal(A)$ satisfy
$ S \( V^k \) = a V^k \, wide S \( V^(- k) \) = b V^(- k) wide \( k gt.eq 1 \) \, $

 then $a = b$.]
] <lem:rigidity-unitary>

#proof[
  We use analytic polynomials whose imaginary parts remain uniformly bounded on the unit circle while their real
    parts grow near $1$. Rotating these polynomials will bound $a - b$ on each short spectral arc;
    the trace will then combine the compression estimates without a loss depending on the number of arcs.
    Write $bb(T) = { z in bb(C) : \| z \| = 1 }$ and
  $ H_m \( z \) = sum_(k = 1)^m z^k / k \, wide h_m = sum_(k = 1)^m 1 / k . $
  We first verify the uniform sine-sum bound
  #[#set math.equation(numbering: n => "(4.16)")
   $ sup_(m gt.eq 1) sup_(theta in bb(R)) lr(|sum_(k = 1)^m frac(sin \( k theta \), k)|) lt.eq B \, wide B = 1 +
     pi . $ <eq:rigidity-sine-bound>]
  By periodicity and oddness it suffices to use the angular distance $t in \[ 0 \, pi \]$ from $2 pi bb(Z)$.
    At $t = 0$ the sum is zero. For $t > 0$ put $K = floor.l 1 \/ t floor.r$.
    The part with $k lt.eq min \( K \, m \)$ has absolute sum at most $K t lt.eq 1$,
    since $\| sin \( k t \) \| lt.eq k t$. Geometric summation gives, for every interval of integers $p lt.eq q$,
  $ lr(|sum_(k = p)^q sin \( k t \)|) lt.eq lr(|sum_(k = p)^q e^(i k t)|) lt.eq frac(1, sin \( t \/ 2 \)) lt.eq
    pi / t . $
  If $m gt.eq K + 1$, put $p = K + 1$ and $A_j = sum_(k = p)^j sin \( k t \)$. Abel summation gives
  $ sum_(k = p)^m frac(sin \( k t \), k) = A_m / m + sum_(j = p)^(m - 1) A_j (1 / j - frac(1, j + 1)) . $
  Its absolute value is at most $pi \/ \( t p \) lt.eq pi$, including when $K = 0$. This proves (4.16).
  For $lambda in bb(T)$, write
  $ H_m \( lambda V \) = X_(m \, lambda) + i Y_(m \, lambda) \, wide X_(m \, lambda) = X_(m \, lambda)^(*) \, quad
    Y_(m \, lambda) = Y_(m \, lambda)^(*) . $
  Continuous functional calculus and (4.16) give $∥Y_(m \, lambda)∥ lt.eq B$.
    The identities for positive and negative powers imply
  $ S #scale(x: 120%, y: 120%)[\(] H_m \( lambda V \) - H_m \( lambda V \)^(*) #scale(x: 120%, y: 120%)[\)] & =
    a H_m \( lambda V \) - b H_m \( lambda V \)^(*)\
 & = \( a - b \) X_(m \, lambda) + i \( a + b \) Y_(m \, lambda) . $
  Since the argument of $S$ has norm at most $2 B$, we obtain
  #[#set math.equation(numbering: n => "(4.17)")
   $ ∥\( a - b \) X_(m \, lambda)∥ lt.eq C \, wide C = B \( 2 ∥S∥ + ∥a∥ + ∥b∥ \) \, $ <eq:rigidity-real-bound>]
  uniformly in $m$ and $lambda$.
  Fix $m$ and any half-open arc $I subset bb(T)$ of angular length at most $1 \/ m$, and let $e = 1_I \( V \)$.
    Choose $lambda$ to rotate the midpoint of $I$ to $1$. On the rotated arc the argument $theta$ satisfies $\|
    theta \| lt.eq 1 \/ m$, so
  $ "Re" H_m \( e^(i theta) \) = sum_(k = 1)^m frac(cos \( k theta \), k) gt.eq cos \( 1 \) h_m . $
  Thus, for $X = X_(m \, lambda)$, Borel functional calculus gives an element $F in W^(*) \( V \)$ equal to $1 \/
    X$ on $I$ and to zero off $I$, with
  $ X F = e \, wide ∥F∥ lt.eq frac(1, cos \( 1 \) h_m) . $
  Writing $c = a - b$ and multiplying (4.17) on the right by $F$ gives
  #[#set math.equation(numbering: n => "(4.18)")
   $ ∥c e∥ = ∥c X F∥ lt.eq frac(C, cos \( 1 \) h_m) = : delta_m . $ <eq:rigidity-arc-bound>]
  In the corner $e cal(A) e$, this says $e c^(*) c e lt.eq delta_m^2 e$.
  Partition $bb(T)$ into finitely many disjoint half-open arcs of angular length at most $1 \/ m$,
    and denote their spectral projections by $e_1 \, dots.h \, e_(J_m)$. They are orthogonal and sum to $1$.
    Traciality and (4.18) imply
  $ ∥c∥_2^2 & = sum_(j = 1)^(J_m) rho \( c^(*) c e_j \) = sum_(j = 1)^(J_m) rho \( e_j c^(*) c e_j \)\
 & lt.eq delta_m^2 sum_(j = 1)^(J_m) rho \( e_j \) = delta_m^2 arrow.r 0 \, $
  because $h_m gt.eq log \( m + 1 \) arrow.r oo$. Each arc estimate is weighted by the trace of its own
    projection; the number of arcs introduces no factor. Faithfulness gives $c = 0$, as required.
    The right multiplication by $F$ and the tracial compression identity apply to arbitrary $a \, b$;
    the argument imposes no commutation condition and uses no particular spectral distribution of $V$. ◻
]

#proof[
  Construct $s in hat(N)$ and $S = R^(omega_2)$ as in (4.6).
    Lemma 13 propagates the first-letter identities to every ordered block product.
    Lemma 14 then provides a unitary $V$ satisfying the positive and negative power identities.
    Lemma 15 gives equality of the constant images of $a$ and $b$ in $hat(N)$.
    The constant embedding is trace preserving and faithful, so $a = b$ in $N$. ◻
]

#prodef([Remark 4.6.])[
  The finite hypothesis in Lemma 15 is essential. On $H = ell^2 \( bb(Z) \)$ let $V e_n = e_(n + 1)$,
    let $p$ project onto $bb(C) e_0$, and let $q$ project onto the closed span of the $e_n$ with $n < 0$.
    The contraction $S \( X \) = p X q$ on $B \( H \)$ satisfies $S \( V^k \) = p V^k$ and $S \( V^(- k) \) =
    0$ for every $k gt.eq 1$: the only nonzero input coordinate of $p V^k$ is $e_(- k)$,
    whereas that of $p V^(- k)$ is $e_k$. Thus the power identities hold with $a = p eq.not 0 = b$.
] <rem:finite-trace-essential>

== 5 Bounded primitives for Hochschild cocycles <sec:cohomology>

We first apply Theorem 10 to separately normal cocycles on a type $upright("II")_1$ algebra with separable predual
  and a faithful normal tracial state. The resulting uniform bound for a primitive will allow us first to remove
  separability and then to combine central summands. Throughout this section,
  normality of a linear map means ultraweak continuity, and separate normality has the corresponding meaning for
  multilinear maps.

=== 5.1 Normality and continuity on bounded balls <normality-and-continuity-on-bounded-balls>

The continuity needed by Theorem 10 is the tracial form of Akemann’s continuity theorem
  #cite(label("Akemann1967")) Corollary III.10. We include a direct proof that allows a center and does not
  require a separable predual. The stronger joint multilinear continuity result for type $upright("II")_1$ factors
  is #cite(label("CPSS2003")) Theorem 4.4.

#thm([Lemma 5.1.])[
  #emph[Let $M$ be a finite von Neumann algebra with faithful normal tracial state $tau$, and let $B : M arrow.r
    M$ be bounded and normal. For every $R < oo$ and $epsilon > 0$ there is $delta > 0$ such that
$ ∥x∥ lt.eq R \, quad ∥x∥_2 < delta quad arrow.r.double quad ∥B \( x \)∥_2 < epsilon . $

 Consequently $B$ is $2$-norm continuous on every operator norm ball.]
] <lem:normal-two-continuity>

#proof[
  We argue by contradiction. A failure of continuity will give elements with mutually orthogonal two-sided
    supports whose images stay uniformly away from zero in $2$-norm.
    Random signs will then contradict the boundedness of $B$.
  If the first assertion fails, there are $R > 0$, $eta > 0$, and a sequence $\( x_j \)$ such that
  $ ∥x_j∥ lt.eq R \, wide ∥x_j∥_2 arrow.r 0 \, wide ∥B \( x_j \)∥_2 gt.eq eta . $
  Choose $alpha > 0$ with $∥B∥ alpha < eta \/ 4$. In the polar decomposition $x_j = v_j \| x_j \|$, set
  $ r_j = 1_(\( alpha \, oo \)) \( \| x_j \| \) \, wide y_j = v_j \| x_j \| r_j \, wide ell_j = v_j r_j v_j^(*) \,
    wide e_j = r_j or ell_j . $
  Here $r_j$ and $ell_j$ are the right and left support projections of $y_j$. In particular,
  $ y_j = e_j y_j e_j \, quad ∥y_j∥ lt.eq R \, quad ∥x_j - y_j∥ lt.eq alpha \, quad ∥B \( y_j \)∥_2 gt.eq 3 eta \/ 4 . $
  The trace and the spectral truncation give
  $ tau \( e_j \) lt.eq tau \( r_j \) + tau \( ell_j \) = 2 tau \( r_j \) lt.eq 2 alpha^(- 2) ∥x_j∥_2^2 . $
  Pass to a subsequence for which $sum_j tau \( e_j \) < oo$, and put $p_j = or.big_(h gt.eq j) e_h$.
    Then $p_j$ decreases to zero: indeed, $tau \( p_j \) lt.eq sum_(h gt.eq j) tau \( e_h \) arrow.r 0$,
    and $tau$ is faithful and normal.
  For fixed $j$ and $h > j$, the compressions
  $ \( p_j - p_h \) y_j \( p_j - p_h \) $
  converge ultraweakly to $y_j$ as $h arrow.r oo$. Applying $B$ preserves this convergence.
    The $2$-norm is ultraweakly lower semicontinuous, as is seen from
  $ ∥y∥_2 = sup { \| tau \( b^(*) y \) \| : b in M \, med ∥b∥_2 lt.eq 1 } . $
  Starting with $j_1 = 1$, we may therefore choose successively $j_(s + 1) > j_s$ so that
  $ t_s = \( p_(j_s) - p_(j_(s + 1)) \) y_(j_s) \( p_(j_s) - p_(j_(s + 1)) \) \, wide ∥B \( t_s \)∥_2 gt.eq eta \/ 2 . $
  The $t_s$ have pairwise orthogonal two-sided supports and $∥t_s∥ lt.eq R$.
    Hence $∥sum_(s = 1)^N epsilon.alt_s t_s∥ lt.eq R$ for every choice of signs $epsilon.alt_s in { - 1 \, 1 }$.
    Taking independent uniform signs, Hilbert space orthogonality of these scalar random variables yields
  $ frac(N eta^2, 4) lt.eq sum_(s = 1)^N ∥B \( t_s \)∥_2^2 =
    bb(E) ∥B #scale(x: 180%, y: 180%)[\(] sum_(s = 1)^N epsilon.alt_s t_s #scale(x: 180%, y: 180%)[\)]∥_2^2
    lt.eq ∥B∥^2 R^2 \, $
  which is impossible for large $N$. This proves the asserted modulus.
    Applying it to differences, which lie in the ball of radius $2 R$, gives continuity on the ball of radius $R$. ◻
]

=== 5.2 Averaging the last input <averaging-the-last-input>

#thm([Proposition 5.2.])[
  #emph[Let $M$ be of type $upright("II")_1$ with separable predual and faithful normal tracial state $tau$.
    If $k gt.eq 2$ and $f in C_b^k \( M \, M \)$ is a separately normal cocycle,
    then there is $g in C_b^(k - 1) \( M \, M \)$ such that
#[#set math.equation(numbering: n => "(5.1)")
 $ d g = f \, wide ∥g∥ lt.eq ∥f∥ . $ <eq:separable-primitive-bound>]

]
] <prop:separable-primitive>

#proof[
  We first construct an averaged cochain that is a right module map in its last input.
    Evaluation at $1$ will give a $\( k - 1 \)$-cochain, and averaging the original equation $d f =
    0$ will identify its differential.
  Choose the symmetric countably supported measure $mu$ for which Theorem 10 applies, and write $mu =
    sum_(s gt.eq 1) p_s delta_(u_s)$. For a bounded $k$-cochain $Phi$, define
  #[#set math.equation(numbering: n => "(5.2)")
   $ \( P Phi \) \( upright(bold(a)) \, x \) = sum_(s gt.eq 1) p_s Phi \( upright(bold(a)) \, x u_s \) u_s^(*) \,
     wide upright(bold(a)) = \( a_1 \, dots.h \, a_(k - 1) \) . $ <eq:last-input-average>]
  The sum converges in operator norm, and $P$ is a contraction for the cochain norm.
    If $W_j = U_1 dots.h.c U_j$, where the $U_i$ are independent with law $mu$, and $W_0 = 1$, induction gives
  $ \( P^j f \) \( upright(bold(a)) \, x \) = bb(E) #scale(x: 120%, y: 120%)[\[] f \( upright(bold(a)) \, x W_j \)
    W_j^(*) #scale(x: 120%, y: 120%)[\]] . $
  Set
  $ F_n = 1 / n sum_(j = 0)^(n - 1) P^j f . $
  We use compactness for pointwise ultraweak convergence. For each fixed tuple
    $upright(bold(x)) = \( x_1 \, dots.h \, x_k \)$, all values $F_n \( upright(bold(x)) \)$ lie in the
    ultraweakly compact ball of radius $∥f∥ product_i ∥x_i∥$.
    The product of these balls, indexed by all tuples in $M^k$, is compact.
    Multilinearity is closed for this topology, since addition and scalar multiplication are ultraweakly
    continuous. Thus some subnet of $\( F_n \)$ converges at every tuple to a bounded multilinear map $F$ with
    $∥F∥ lt.eq ∥f∥$.
  On any common cochain norm ball, $P$ is continuous for this topology.
    To see this, suppose $Phi_lambda arrow.r Phi$ pointwise ultraweakly and $∥Phi_lambda∥ \, ∥Phi∥ lt.eq C$.
    For a fixed tuple $\( upright(bold(a)) \, x \)$ and a normal functional $rho in M_(*)$,
    truncate (5.2) after $L$ terms. The finite sum passes to the limit,
    and the remaining difference has absolute value at most
  $ 2 C ∥rho∥ ∥x∥ product_(i = 1)^(k - 1) ∥a_i∥ sum_(s > L) p_s . $
  Letting $L arrow.r oo$ proves the claim. Since
  $ P F_n - F_n = frac(P^n f - f, n) \, wide ∥P F_n - F_n∥ lt.eq frac(2 ∥f∥, n) \, $
  the subnet limit satisfies $P F = F$.
  Fix $upright(bold(a))$, and put $B \( x \) = f \( upright(bold(a)) \, x \)$.
    This is a bounded normal linear map. For any $R < oo$ and $epsilon > 0$, Lemma 17 provides $delta > 0$ such that
  $ ∥x∥ lt.eq R \, quad ∥x∥_2 < delta quad arrow.r.double quad ∥B \( x v \) v^(*)∥_2 < epsilon quad
    upright("for every ") v in cal(U) \( M \) . $
  Indeed, right multiplication by a unitary preserves both the operator norm and the $2$-norm.
    The same bound holds after averaging over any $W_j$ and after taking the Cesàro average.
    Ultraweak lower semicontinuity of the $2$-norm then gives $∥F \( upright(bold(a)) \, x \)∥_2 lt.eq
    epsilon$ under these input bounds. Using $epsilon \/ 2$ in place of $epsilon$ proves the required continuity
    modulus for $T \( x \) = F \( upright(bold(a)) \, x \)$. The equality $P F =
    F$ is exactly the harmonicity identity for this map. Consequently Theorem 10 gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ F \( upright(bold(a)) \, x \) = h \( upright(bold(a)) \) x \, wide h \( upright(bold(a)) \) =
     F \( upright(bold(a)) \, 1 \) . $ <eq:averaged-right-module>]
  In particular $h$ is a bounded $\( k - 1 \)$-cochain and $∥h∥ lt.eq ∥f∥$.
  It remains to obtain its coboundary identity. Let $nu_n =
    n^(- 1) sum_(j = 0)^(n - 1) mu^(* j)$ and $h_n \( upright(bold(a)) \) = F_n \( upright(bold(a)) \, 1 \)$.
    Evaluate the original equation $d f = 0$ at $\( a_1 \, dots.h \, a_k \, v \)$,
    multiply the output on the right by $v^(*)$, and average with respect to $v tilde.op nu_n$.
    This gives the exact equality
  #[#set math.equation(numbering: n => "(5.4)")
   $ 0 =  & a_1 h_n \( a_2 \, dots.h \, a_k \) + sum_(j = 1)^(k - 1) \( - 1 \)^j
     h_n \( a_1 \, dots.h \, a_j a_(j + 1) \, dots.h \, a_k \)\
 & + \( - 1 \)^k F_n \( a_1 \, dots.h \, a_(k - 1) \, a_k \) + \( - 1 \)^(k + 1) f \( a_1 \, dots.h \, a_k \) .
   $ <eq:original-cocycle-average>]
  The final term is unchanged because $v v^(*) = 1$. Along the chosen subnet,
    each displayed evaluation converges ultraweakly; multiplication by a fixed $a_i$ preserves that convergence.
    Passing to the limit and using (5.3) therefore yields
  $ 0 = \( d h \) \( a_1 \, dots.h \, a_k \) + \( - 1 \)^(k + 1) f \( a_1 \, dots.h \, a_k \) . $
  Thus $g = \( - 1 \)^k h$ satisfies (5.1). This calculation averages $d f$ at the displayed tuples;
    it requires neither a commutation relation between $P$ and $d$ nor separate normality of the limiting cochain $F$. ◻
]

=== 5.3 Removing the separability assumption <removing-the-separability-assumption>

Uniform primitive bounds and pointwise ultraweak compactness were used to remove separability in
  #cite(label("CPSS2003")) Section 7. As in that argument, conditional expectations allow the approximating
  subalgebras to be chosen independently for each finite set of inputs.

#thm([Proposition 5.3.])[
  #emph[Let $M$ be any type $upright("II")_1$ von Neumann algebra admitting a faithful normal tracial state.
    Every separately normal cocycle $f in C_b^k \( M \, M \)$, $k gt.eq 2$,
    has a bounded primitive $g$ with $∥g∥ lt.eq ∥f∥$.]
] <prop:tracial-primitive>

#proof[
  Order the finite subsets $E subset M$ by inclusion. For each $E$,
    choose a countably generated unital von Neumann subalgebra $N_E$ containing $E$, the finite set $f \( E^k \)$,
    and unital matrix systems of every size $m gt.eq 2$. Such systems exist in a type $upright("II")_1$ algebra:
    the unit can be divided into $m$ equivalent orthogonal projections #cite(label("Blackadar2006"))
    Examples III.2.5.4(iii), and partial isometries between them supply the matrix units.
    Adjoining one system for each $m$ adds only countably many generators.
  The restriction of the trace to $N_E$ is faithful and normal.
    The tracial Hilbert space $L^2 \( N_E \)$ is separable: $*$-polynomials with coefficients in $bb(Q) +
    i bb(Q)$ in a countable set of generators are dense in the generated $C^(*)$-algebra in norm,
    and bounded strong approximation makes that algebra $2$-norm dense in $N_E$.
    The faithful tracial representation thus gives $N_E$ separable predual.
    Moreover $N_E$ has no type I central part. A nonzero homogeneous type $upright(I)_n$ central summand would
    inherit a unital copy of $M_m \( bb(C) \)$ for every $m$,
    whereas its $n$-dimensional fibers cannot admit a unital copy when $m > n$.
    Every finite type I algebra decomposes into its homogeneous type $upright(I)_n$ summands.
    Since $N_E$ is finite, it is therefore of type $upright("II")_1$.
  Let $cal(E)_E : M arrow.r N_E$ be the normal trace-preserving conditional expectation.
    Its existence and bimodularity are classical; see #cite(label("Dixmier1953")) Théorème 8 and
    #cite(label("Umegaki1954")) Theorem 1. Define
  $ f_E = cal(E)_E compose f \|_(N_E^k) . $
  This map is separately normal and has norm at most $∥f∥$.
    For inputs in $N_E$, bimodularity of $cal(E)_E$ gives $d f_E = cal(E)_E \( d f \) = 0$.
    By Proposition 18, choose $g_E in C_b^(k - 1) \( N_E \, N_E \)$ such that $d g_E = f_E$ and $∥g_E∥ lt.eq ∥f∥$.
    Extend it to a cochain on $M$ by
  $ G_E \( x_1 \, dots.h \, x_(k - 1) \) = g_E \( cal(E)_E x_1 \, dots.h \, cal(E)_E x_(k - 1) \) . $
  This extension has the same norm bound. If $\( a_1 \, dots.h \, a_k \) in E^k$,
    all its inputs and adjacent products belong to $N_E$. Expanding the differential consequently gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ \( d G_E \) \( a_1 \, dots.h \, a_k \) = \( d g_E \) \( a_1 \, dots.h \, a_k \) =
     cal(E)_E f \( a_1 \, dots.h \, a_k \) = f \( a_1 \, dots.h \, a_k \) \, $ <eq:finite-set-exactness>]
  where the final equality uses $f \( E^k \) subset N_E$.
  The common norm bound and the same product compactness used above give a pointwise ultraweakly convergent subnet
    of $\( G_E \)$, with limit $g in C_b^(k - 1) \( M \, M \)$ and $∥g∥ lt.eq ∥f∥$.
    For a fixed $k$-tuple $\( a_1 \, dots.h \, a_k \)$, the indices of this subnet eventually contain $E_0 =
    { a_1 \, dots.h \, a_k }$. Equation (5.5) therefore holds eventually along the subnet.
    Passing to the limit in its finitely many coboundary terms gives $d g = f$ at this tuple.
    This holds at every tuple, proving the proposition. The choices of $N_E$ and $cal(E)_E$ can be made
    independently for different $E$; eventual exactness is supplied by the directed finite subsets. ◻
]

=== 5.4 Central cuts and mixed inputs <central-cuts-and-mixed-inputs>

Uniform bounds and central decomposition also enter the tensor-product argument of #cite(label("PopSmith2010"))
  Section 4. In the present setting we use an explicit homotopy to correct all inputs outside a given central
  summand before assembling the primitives.

For a central projection $z in M$, regard $z M$ as an $M$-bimodule under multiplication and put $q = 1 - z$.
  In degree zero we use $C_b^0 \( M \, z M \) = z M$ and $\( d xi \) \( a \) = a xi - xi a$.
  On cochains with values in $z M$, define the central cut by

$ \( "cut"_z psi \) \( a_1 \, dots.h \, a_n \) = psi \( z a_1 \, dots.h \, z a_n \) . $

In degree zero this means $"cut"_z = "id"$ on $z M$. Centrality and the fact that $q$ annihilates this module show
  that $"cut"_z$ commutes with $d$. For a cocycle $psi$ with values in $z M$,
  a primitive for its restriction to $z M$, pulled back to $M$, accounts only for $"cut"_z psi$.
  The following homotopy supplies the remaining difference $psi - "cut"_z psi$ on arbitrary inputs,
  with a bound independent of $z$.

#thm([Lemma 5.4.])[
  #emph[For $n gt.eq 2$ and $psi in C_b^n \( M \, z M \)$, set
#[#set math.equation(numbering: n => "(5.6)")
 $ \( J_z psi \) \( a_1 \, dots.h \, a_(n - 1) \) = sum_(i = 1)^(n - 1) \( - 1 \)^i
   psi \( & z a_1 \, dots.h \, z a_(i - 1) \, q \, q a_i \,\
 & a_(i + 1) \, dots.h \, a_(n - 1) \) . $ <eq:central-homotopy-formula>]

 Set $J_z = 0$ in degrees zero and one. Then, in every degree,
#[#set math.equation(numbering: n => "(5.7)")
 $ d J_z + J_z d = "id" - "cut"_z . $ <eq:central-homotopy-identity>]

 For $n gt.eq 1$ the degree-$n$ operator satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ ∥J_z psi∥ lt.eq \( n - 1 \) ∥psi∥ . $ <eq:central-homotopy-bound>]

]
] <lem:central-homotopy>

#proof[
  The norm estimate follows directly from (5.6). To verify the identity, expand each input as $a_i = z a_i +
    q a_i$. By multilinearity it suffices to use tuples whose entries each belong to $z M$ or to $q M$.
    On such a tuple with first $q M$ entry at position $r$, formula (5.6) consists of the single term inserting
    $q$ immediately before that entry, with sign $\( - 1 \)^r$; on an all-$z M$ tuple it is zero.
  Consider such an $n$-tuple with first $q M$ entry $a_r$. In $\( J_z d \) psi$,
    merging the inserted $q$ with $a_r$ has total sign $\( - 1 \)^r \( - 1 \)^r =
    1$ and contributes $psi \( a_1 \, dots.h \, a_n \)$. A merger strictly before the insertion has the same
    arguments as its counterpart in $\( d J_z \) psi$, but the latter inserts at position $r - 1$,
    so their signs are opposite. A merger strictly after the pair $\( q \, a_r \)$ also has the same arguments as
    its counterpart in $\( d J_z \) psi$, and its merger index is larger by one, again reversing the sign.
    The merger of $a_(r - 1)$ with the inserted $q$, when $r > 1$, vanishes because $z M q M = 0$;
    the corresponding merger across $a_(r - 1) \, a_r$ in $\( d J_z \) psi$ vanishes for the same reason.
  The left outer terms cancel when $r > 1$, with insertion indices $r$ and $r - 1$.
    When $r = 1$, both left outer terms vanish because $q M$ annihilates the output module.
    For the right outer terms, if $r < n$ the same insertion index and the two consecutive differential degrees
    give opposite signs. If $r = n$, the last input is in $q M$, so both right outer terms vanish.
    Thus the only surviving term is $psi \( a_1 \, dots.h \, a_n \)$,
    as required because the cut of this tuple is zero. On an all-$z M$ tuple, both sides of (5.7) vanish.
  For completeness, in degree one the formula reads
  $ \( J_z d psi \) \( a \) = - \( d psi \) \( q \, q a \) = psi \( q a \) = psi \( a \) - psi \( z a \) \, $
  since both outer module actions in $\( d psi \) \( q \, q a \)$ vanish.
    In degree zero both sides are zero by the definitions. This proves the identity in all degrees. ◻
]

In particular, if $psi in C_b^k \( M \, z M \)$ is a cocycle, then

#[#set math.equation(numbering: n => "(5.9)")
 $ d \( J_z psi \) = psi - "cut"_z psi \, wide ∥J_z psi∥ lt.eq \( k - 1 \) ∥psi∥ . $ <eq:central-cocycle-correction>]

This bound is independent of the algebra and the central projection.

=== 5.5 Completion of the proof <completion-of-the-proof>

#proof[
  The zero algebra is immediate, so assume $M eq.not 0$. Fix $k gt.eq
    2$ and an arbitrary bounded cocycle $f_(upright("orig")) in C_b^k \( M \, M \)$.
    By the normal reduction in Proposition 2, there are a separately normal cocycle $f$ and a bounded
    $\( k - 1 \)$-cochain $b$ such that
  $ f_(upright("orig")) = f + d b . $
  Let $z_(upright("II")_1)$ be the central projection of the type $upright("II")_1$ summand, and let $z_0 = 1 -
    z_(upright("II")_1)$. We first partition $z_(upright("II")_1)$ into central projections whose algebras admit
    faithful normal tracial states.
  In the abelian algebra $Z \( z_(upright("II")_1) M \)$, choose a maximal orthogonal family $\( z_i \)_(i in I)$
    of nonzero supports of normal states. Its join is $z_(upright("II")_1)$:
    a nonzero complementary projection would support a further normal state, contradicting maximality.
    A state is faithful on its support, so each $z_i Z \( M \)$ has a faithful normal state $phi_i$.
    Composing $phi_i$ with the faithful normal center-valued trace of $z_i
    M$ gives a faithful normal tracial state $tau_i$ on $z_i M$;
    see #cite(label("Blackadar2006")) Theorem III.2.5.7 and Corollary III.2.5.8.
    The family $I$ may be uncountable. Omit $z_0$ if it is zero,
    and otherwise keep the entire complementary summand as one piece.
  For each piece define the restricted cocycle
  $ f_i \( x_1 \, dots.h \, x_k \) = z_i f \( x_1 \, dots.h \, x_k \) \, wide x_j in z_i M . $
  Multiplication by a central projection is a bimodule map,
    so $f_i$ is a separately normal cocycle and $∥f_i∥ lt.eq ∥f∥$.
    For $i in I$, Proposition 19 supplies a primitive $b_i in C_b^(k - 1) \( z_i M \, z_i M \)$ with
  $ d b_i = f_i \, wide ∥b_i∥ lt.eq ∥f∥ . $
  If $z_0 eq.not 0$, the vanishing result for algebras without a type $upright("II")_1$ central summand in
    Proposition 2 supplies a bounded primitive $b_0$ of $f_0$. Its norm is some finite number.
  Pull each primitive back to $M$ through the homomorphism $x mapsto z_i x$:
  $ tilde(b)_i \( x_1 \, dots.h \, x_(k - 1) \) = b_i \( z_i x_1 \, dots.h \, z_i x_(k - 1) \) . $
  The outer module actions also pull back, since the outputs lie in $z_i M$. Thus
  $ d tilde(b)_i \( x_1 \, dots.h \, x_k \) = z_i f \( z_i x_1 \, dots.h \, z_i x_k \) =
    "cut"_(z_i) \( z_i f \) \( x_1 \, dots.h \, x_k \) . $
  Define cochains with values in $z_i M$ on all of $M$ by
  $ H_i = tilde(b)_i + J_(z_i) \( z_i f \) . $
  Equation (5.9) gives
  $ d H_i = z_i f \, wide ∥H_i∥ lt.eq k ∥f∥ quad \( i in I \) \, $
  and, when present,
  $ ∥H_0∥ lt.eq ∥b_0∥ + \( k - 1 \) ∥f∥ . $
  There is consequently a single finite constant $C$ bounding the norms of all these cochains;
    one can take the maximum of the two displayed bounds, omitting the second when $z_0 = 0$.
  For an arbitrary central partition of unity, the map
  $ M arrow.r product_i^(ell^oo) z_i M \, wide x mapsto \( z_i x \)_i \, $
  is an isometric $*$-isomorphism onto the bounded direct product.
    For surjectivity, the finite partial sums of a bounded family $\( x_i \)_i$, $x_i in z_i M$,
    form a net directed by inclusion of the finite index sets.
    This net converges strongly, since the central supports are orthogonal; its limit belongs to $M$.
    For each tuple $\( x_1 \, dots.h \, x_(k - 1) \)$, the family $\( H_i \( x_1 \, dots.h \, x_(k - 1) \) \)_i$
    belongs to this product and has norm at most $C product_j ∥x_j∥$.
    Let $G \( x_1 \, dots.h \, x_(k - 1) \) in M$ be the corresponding element.
    Coordinatewise multilinearity shows that $G$ is a bounded multilinear cochain with $∥G∥ lt.eq C$.
    Central projection commutes with every term of its coboundary, so
  $ z_i \( d G \) = d H_i = z_i f wide upright("for every central piece ") i . $
  Since the projections have join $1$, it follows that $d G = f$. Finally,
  $ d \( G + b \) = f + d b = f_(upright("orig")) . $
  We have obtained an actual bounded $\( k - 1 \)$-cochain whose coboundary is the given cocycle.
    Hence $H_b^k \( M \, M \) = 0$ for every complex von Neumann algebra $M$ and every $k gt.eq 2$,
    with the actual image of $d$ in the definition of cohomology and with no complete-boundedness hypothesis. ◻
]

#heading(level: 1)[References]
#bibitem([1])[C.~A.~Akemann, #emph[The dual space of an operator algebra], Trans. Amer. Math. Soc.
  #strong[126] (1967), no.~2, 286--302.
  #link("https://doi.org/10.1090/S0002-9947-1967-0206732-8")[doi:10.1090/S0002-9947-1967-0206732-8].]
#bibitem([2])[T.~Banica, #emph[On the polar decomposition of circular variables],
  Integral Equations Operator Theory #strong[24] (1996), 372--377.
  #link("https://doi.org/10.1007/BF01204607")[doi:10.1007/BF01204607].]
#bibitem([3])[B.~Blackadar, #emph[Operator Algebras: Theory of $C^(*)$-Algebras and von Neumann Algebras],
  Encyclopaedia of Mathematical Sciences, vol.~122, Springer, Berlin--Heidelberg, 2006.
  #link("https://bruceblackadar.com/Mathematics/Cycr.pdf")[Author's revised online text dated February 8, 2017].
  #link("https://doi.org/10.1007/3-540-28517-2")[doi:10.1007/3-540-28517-2].]
#bibitem([4])[J.~M.~Cameron, #emph[Hochschild cohomology of $upright(I I)_1$ factors with Cartan maximal abelian
  subalgebras], Proc. Edinburgh Math. Soc. #strong[52] (2009), no.~2, 287--295.
  #link("https://doi.org/10.1017/S0013091507000053")[doi:10.1017/S0013091507000053].]
#bibitem([5])[E.~Christensen, E.~G.~Effros, and A.~M.~Sinclair,
  #emph[Completely bounded multilinear maps and $C^(*)$-algebraic cohomology], Invent. Math.
  #strong[90] (1987), no.~2, 279--296. #link("https://doi.org/10.1007/BF01388706")[doi:10.1007/BF01388706].]
#bibitem([6])[E.~Christensen, F.~Pop, A.~M.~Sinclair, and R.~R.~Smith,
  #emph[Hochschild cohomology of factors with property $Gamma$], Ann. of Math.
  #strong[158] (2003), no.~2, 635--659.
  #link("https://doi.org/10.4007/annals.2003.158.635")[doi:10.4007/annals.2003.158.635].]
#bibitem([7])[E.~Christensen and A.~M.~Sinclair, #emph[Module mappings into von Neumann algebras and injectivity],
  Proc. London Math. Soc. (3) #strong[71] (1995), no.~3, 618--640.
  #link("https://doi.org/10.1112/plms/s3-71.3.618")[doi:10.1112/plms/s3-71.3.618].]
#bibitem([8])[J.~Dixmier, #emph[Formes linéaires sur un anneau d'opérateurs], Bull. Soc. Math.
  France #strong[81] (1953), 9--39. #link("https://doi.org/10.24033/bsmf.1436")[doi:10.24033/bsmf.1436].]
#bibitem([9])[H.~Furstenberg, #emph[Noncommuting random products], Trans. Amer. Math. Soc.
  #strong[108] (1963), no.~3, 377--428.
  #link("https://doi.org/10.1090/S0002-9947-1963-0163345-0")[doi:10.1090/S0002-9947-1963-0163345-0].]
#bibitem([10])[U.~Haagerup, #emph[An example of a non nuclear $C^(*)$-algebra,
  which has the metric approximation property], Invent. Math. #strong[50] (1979), 279--293.
  #link("https://doi.org/10.1007/BF01410082")[doi:10.1007/BF01410082].]
#bibitem([11])[B.~E.~Johnson, R.~V.~Kadison, and J.~R.~Ringrose, #emph[Cohomology of operator algebras. III:
  Reduction to normal cohomology], Bull. Soc. Math. France #strong[100] (1972), 73--96.
  #link("https://doi.org/10.24033/bsmf.1731")[doi:10.24033/bsmf.1731].]
#bibitem([12])[R.~V.~Kadison, #emph[Derivations of operator algebras], Ann. of Math.
  (2) #strong[83] (1966), no.~2, 280--293. #link("https://doi.org/10.2307/1970433")[doi:10.2307/1970433].]
#bibitem([13])[R.~V.~Kadison and J.~R.~Ringrose, #emph[Cohomology of operator algebras. I:
  Type I von Neumann algebras], Acta Math. #strong[126] (1971), 227--243.
  #link("https://doi.org/10.1007/BF02392032")[doi:10.1007/BF02392032].]
#bibitem([14])[R.~V.~Kadison and J.~R.~Ringrose, #emph[Cohomology of operator algebras II.
  Extended cobounding and the hyperfinite case], Ark. Mat. #strong[9] (1971), 55--63.
  #link("https://doi.org/10.1007/BF02383637")[doi:10.1007/BF02383637].]
#bibitem([15])[F.~Pop and R.~R.~Smith, #emph[Vanishing of second cohomology for tensor products of type
  $upright(I I)_1$ von Neumann algebras], J. Funct. Anal. #strong[258] (2010), 2695--2707.
  #link("https://doi.org/10.1016/j.jfa.2010.01.013")[doi:10.1016/j.jfa.2010.01.013].]
#bibitem([16])[S.~Popa, #emph[Free-independent sequences in type $upright(I I)_1$ factors and related problems],
  in #emph[Recent advances in operator algebras---Orléans, 1992], Astérisque #strong[232] (1995), 187--202.
  #link("https://doi.org/10.24033/ast.318")[doi:10.24033/ast.318].]
#bibitem([17])[S.~Popa, #emph[Independence properties in subalgebras of ultraproduct $upright(I I)_1$ factors], J.
  Funct. Anal. #strong[266] (2014), no.~9, 5818--5846.
  #link("https://doi.org/10.1016/j.jfa.2014.02.004")[doi:10.1016/j.jfa.2014.02.004].]
#bibitem([18])[W.~Qian and J.~Shen, #emph[Hochschild cohomology of type $upright(I I)_1$ von Neumann algebras with
  Property $Gamma$], Oper. Matrices #strong[9] (2015), no.~3, 507--543.
  #link("https://doi.org/10.7153/oam-09-31")[doi:10.7153/oam-09-31].]
#bibitem([19])[S.~Sakai, #emph[Derivations of $W^(*)$-algebras], Ann. of Math.
  (2) #strong[83] (1966), no.~2, 273--279. #link("https://doi.org/10.2307/1970432")[doi:10.2307/1970432].]
#bibitem([20])[A.~M.~Sinclair and R.~R.~Smith, #emph[Hochschild Cohomology of von Neumann Algebras],
  London Mathematical Society Lecture Note Series, vol.~203, Cambridge University Press, Cambridge, 1995.
  #link("https://doi.org/10.1017/CBO9780511526190")[doi:10.1017/CBO9780511526190].]
#bibitem([21])[A.~M.~Sinclair and R.~R.~Smith, #emph[Hochschild cohomology for von Neumann algebras with Cartan
  subalgebras], Amer. J. Math. #strong[120] (1998), no.~5, 1043--1057.
  #link("https://doi.org/10.1353/ajm.1998.0042")[doi:10.1353/ajm.1998.0042].]
#bibitem([22])[A.~M.~Sinclair and R.~R.~Smith, #emph[The Hochschild cohomology problem for von Neumann algebras],
  Proc. Natl. Acad. Sci. USA #strong[95] (1998), no.~7, 3376--3379.
  #link("https://doi.org/10.1073/pnas.95.7.3376")[doi:10.1073/pnas.95.7.3376].]
#bibitem([23])[H.~Umegaki, #emph[Conditional expectation in an operator algebra], Tohoku Math. J.
  (2) #strong[6] (1954), nos.~2--3, 177--181.
  #link("https://doi.org/10.2748/tmj/1178245177")[doi:10.2748/tmj/1178245177].]
#bibitem([24])[D.~Voiculescu, #emph[Circular and semicircular systems and free product factors],
  in #emph[Operator Algebras, Unitary Representations, Enveloping Algebras, and Invariant Theory],
  Progress in Mathematics, vol.~92, Birkhäuser, Boston, 1990, 45--60.
  #link("https://math.berkeley.edu/~dvv/CircularSemi.pdf")[Author's text].]

#bibliography("refs.bib", style: "ieee", title: [References])
