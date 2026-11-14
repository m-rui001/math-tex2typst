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

#align(center)[#text(size: 16pt, weight: "bold")[Finite tensor savings and exact Fourier circuits]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <intro:sec:introduction>

The discrete Fourier transform is a basic test case for arithmetic complexity.
  Its familiar $O \( n log n \)$ algorithms make the corresponding lower-bound question particularly sharp:
  does every exact computation require a constant multiple of $n log n$ operations?
  The answer depends on the computational model. We consider complex linear circuits with arbitrary prechosen
  coefficients and prove that this lower bound is false in its unrestricted nonuniform form.

The argument centers on a finite question about tensor products.
  For integers $q \, b gt.eq 2$, applying a fixed $q times q$ matrix on each axis computes its $b$th tensor power
  with $b q^(b - 1)$ matrix calls. A #emph[monomial matrix] is a permutation matrix times an invertible diagonal
  matrix. We prove that, for at least one invertible nonmonomial matrix, an exact computation improves this count.
  A single such finite saving is enough: tensor amplification turns it into an exponent improvement,
  and a factorization that preserves the number of coordinates transfers the improvement to Fourier matrices.
  The existence proof develops a second set of tools, based on prices of matrix calls and their behavior under
  feedback and changes of boundary conditions.

=== 1.1 The model and the result <the-model-and-the-result>

For $n gt.eq 2$, put $zeta_n = exp \( 2 pi i \/ n \)$ and let

#[#set math.equation(numbering: n => "(1.1)")
 $ F_n = \( zeta_n^(j k) \)_(0 lt.eq j \, k < n) . $ <intro:eq:fourier>]

A linear circuit has inputs $x_0 \, dots.h \, x_(n - 1) \, 0$ and a finite directed acyclic graph of scalar gates.
  Each gate computes $u + v$, $u - v$, or $lambda u$ from previously available values,
  with a fixed $lambda in bb(C)$. Each such gate costs one operation, including every scalar multiplication.
  Previously computed values can be reused arbitrarily, and the outputs are designated available values.
  A fixed combination $alpha u + beta v$ therefore costs at most three gates.

The graph and coefficients may depend on $n$, but not on the input.
  Coefficients have no bound on magnitude, algebraic degree, or description length;
  their generation is not charged. Depth, storage, cancellation, and conditioning are unrestricted.
  All $n$ output coordinates must equal $F_n x$ exactly for every $x in bb(C)^n$.
  Let $L \( n \)$ be the minimum number of gates in such a circuit.

#thm([Theorem 1.1.])[
  #emph[In this model,
$ liminf_(n arrow.r oo) frac(L \( n \), n log_2 n) = 0 . $

 Equivalently, for every $c > 0$ and every integer $N_0 gt.eq 2$, there is an integer $n gt.eq
   N_0$ and an exact circuit for $F_n$ with fewer than $c n log_2 n$ gates.]
] <thm:main>

The $Omega \( n log n \)$ Fourier lower-bound question is discussed in #cite(label("ailon2013"), form: "prose")
  Abstract and #cite(label("almanRao2023"), form: "prose") Section 1.
  In the model above, 1 refutes the assertion that $L \( n \) gt.eq
  c n log_2 n$ for some fixed $c > 0$ and all sufficiently large $n$.
  The proof gives an unbounded sequence of lengths, formed as products of distinct primes,
  with a vanishing normalized gate count. It is an existence theorem in the stated nonuniform model.
  The coefficients are chosen separately for each resulting circuit; their preparation is outside this model.
  The theorem concerns arithmetic operation counts along those lengths and makes no assertion about coefficient
  size, numerical stability, or bit complexity. Neither a uniform construction nor an all-length upper bound is
  needed for this quantified conclusion.

=== 1.2 Historical context <historical-context>

The fast Fourier transform of Cooley and Tukey organizes a composite-length transform into smaller transforms and
  diagonal factors #cite(label("cooleyTukey1965")). Coprime factors have a particularly useful structure:
  Chinese remainder permutations identify the transform with a tensor product without intervening diagonal
  factors. This is the Good–Thomas factorization; Good’s treatment gives the multidimensional and coprime
  formulas, and Cooley, Lewis, and Welch describe Thomas’s construction and its relation to Good’s work
  #cite(label("good1958")) Sections 11–12 #cite(label("cooleyLewisWelch1967")) pp. 1675–1677.
  Convolution supplies another classical route to general lengths.
  The 1969 chirp-transform paper of Rabiner, Schafer, and Rader derives the reduction to diagonal scalings and a
  convolution, crediting Bluestein’s 1968 work for the quadratic-exponent identity
  #cite(label("rabinerSchaferRader1969")) Section II. Bluestein’s journal treatment appeared in 1970
  #cite(label("bluestein1970")). The transfer proved here uses the coprime tensor structure together with a local
  factorization on exactly the original coordinates. Preserving that width is what permits a finite tensor saving
  to survive synchronization.

Lower bounds have been proved under substantial restrictions on the algorithm.
  Morgenstern’s determinant argument establishes a bound of order $n log
  n$ for the unnormalized transform in a bounded-coefficient model #cite(label("morgenstern1973")).
  Ailon proves a lower bound for the normalized transform in a model with exactly $n$ registers and unitary $2
  times 2$ gates #cite(label("ailon2013")) Section 2 and Theorem 2.1 and, in a separate model,
  relates the operation count to the conditioning of every intermediate transformation #cite(label("ailon2014"))
  Definition 2.1 and Theorem 3.1. Those hypotheses are significant here:
  the circuits in 1 are allowed arbitrary coefficients and arbitrary intermediate conditioning.
  An unrestricted scalar circuit can pass between normalized and unnormalized transforms with $O \( n \)$
  additional gates. Such a scaling need not respect a prescribed coefficient bound,
  so the normalization must be retained when comparing the restricted models.

Upper bounds have also improved within the $n log n$ scale.
  In particular, Alman and Rao obtain new leading constants for power-of-two transforms,
  measured in real arithmetic operations #cite(label("almanRao2023")) Theorem 1.2.
  A fixed leading-constant improvement does not settle the quantified question addressed here.
  The essential step in this paper is to turn one strict finite tensor saving into a smaller exponent in the
  tensor order, and then preserve that saving when passing to an unbounded sequence of Fourier transforms.

Tensor amplification and duality also appear in recent work on Kronecker-power circuits.
  Alman and Li use asymptotic-spectrum duality to characterize the asymptotic size of depth-two linear circuits
  #cite(label("almanLi2025")) Sections 1.3 and 4. Their circuits are represented by rank-one decompositions,
  with size measured by the nonzero entries in the two matrix factors.
  Our finite-win question concerns sequential invertible matrix calls on a fixed coordinate set.
  Its price construction must therefore preserve the order of each program while combining different matrix types.

The local Fourier construction uses established ideas from structured linear algebra and reversible computation.
  Kuznetsov gives an $L D L^(sans(T))$ factorization of geometric Vandermonde matrices,
  including Fourier matrices, whose triangular factors are diagonal scalings of triangular Toeplitz matrices
  #cite(label("kuznetsov2018")) Theorem 1. We give a Newton-polynomial derivation of this identity and implement
  its factors on the original coordinates. Low displacement rank supplies the convolution representation used in
  that implementation #cite(label("kailathKungMorf1979")) Lemmas 1–2.
  Computing, reading the output, and reversing a computation is the uncomputation pattern of Bennett
  #cite(label("bennett1973")) pp. 526–529. Restoration from arbitrary workspace contents is achieved by the
  cleanup construction for transparent programs #cite(label("buhrmanEtAl2014")) Section 3.
  We prove the particular linear replay identity, its pair-layer bound, and its fit inside the existing coordinate set.

The companion manuscript #emph[An explicit power saving for the exact discrete Fourier transform] gives a
  quantitative all-length algorithm in a model that also charges scalar preparation and logarithmic-word address
  operations, with a specified root of unity supplied #cite(label("openaiExplicitFourier2026")) Theorem 1.1.
  The present paper develops the general finite-win existence argument:
  comparison packing, the resulting price laws, and the reflection contradiction are proved in full independently
  of that algorithm.

=== 1.3 The mechanism of the proof <the-mechanism-of-the-proof>

For an invertible $q times q$ matrix $A$, the usual computation of $A^(⊗ b)$ uses $b q^(b - 1)$ calls to $A$,
  acting along tensor fibers. Call a strict improvement a #emph[finite win]:
  an exact word on $q^b$ coordinates, using fewer calls, with permutations and invertible diagonal maps allowed
  between them. The matrix $A$ must be nonmonomial. This intermediate convention is confined to matrix words.
  Every scalar multiplication is charged when such a word is implemented as a circuit.

The argument has two parts.

+ #emph[A finite win implies 1.] For any nonmonomial $A$, one fixed positive-call pattern,
  with adjustable monomial factors, realizes every invertible matrix of the same width.
  A finite win then gives circuits for $A^(⊗ k)$ with $O \( q^k \( k + 1 \)^alpha \)$ gates for some fixed
  $alpha < 1$. Each Fourier matrix $F_r$ is factored, on its original $r$ coordinates,
  into $O \( 1 + log^4 r \)$ layers, each monomial or a disjoint union of invertible two-coordinate maps with any
  remaining coordinates fixed. The temporary convolution computations borrow arbitrary existing values and restore
  them by cancellation. Positive generation places the pair maps in fixed-width tuples and replaces them by a
  common call pattern in $A$. Synchronizing this pattern across distinct prime factors makes each call slot a
  direct sum of tensor powers of $A$. The sector widths sum to the Fourier length,
  so the amplified bound controls the entire slot. The Chinese Remainder Theorem then gives the desired sequence.
+ #emph[A finite win must exist.] Suppose that none exists.
  Compare tensor-axis computations with words using a finite collection of matrix types.
  If several comparisons together save calls to every type,
  we can place their programs on disjoint tensor sectors and schedule them as calls to one larger block-diagonal
  matrix. This would give a finite win. Separation and compactness turn the impossibility of such simultaneous
  savings into one price function $p$, positive on nonmonomial matrices, with exact tensor and direct-sum laws.
  We next ask how prices change when coordinates are eliminated.
    Split the coordinates of an invertible matrix into data and state,
    and apply it repeatedly to fresh data while retaining the state. Repeat this construction on many tensor axes.
    The cost of correcting the initial state becomes negligible compared with the number of cell calls.
    This proves that an invertible corner costs no more than its containing matrix.
    Comparing multiplication modulo different scalar polynomials also permits closing the state connection and
    specializing rational matrix families. All these conclusions concern exact matrices;
    they do not assume continuity of the price.
  Finally, normalize a nontrivial elementary shear to have price one.
    A legal exchange of one input basis member with one output basis member preserves price,
    provided both exchanged lists remain bases. Applying these exchanges to signed bit-coordinate matrices gives a
    family of involutions, with integer parameter $d$, width $w = w \( d \)$, and price $d w$.
    The constructed $+ 1$ eigenspace is the graph of an invertible matrix.
    From the orthogonal reflection $R$ in that graph, we can recover the involution’s price at an additional cost
    of only $O \( w \)$. The same subspace is the kernel of a real symmetric matrix with at most $\( d \/ 2 + 1 \)
    w$ supported off-diagonal pairs. A product of diagonal and two-coordinate perturbations has this sparse matrix
    as its derivative at zero. At generic parameter values, each dense pair costs at most $3 \/ 2$.
    Feedback adds only $O \( w \)$, and two algebraic specializations carry the bound to $R$.
    Thus the two descriptions give
  $ d w - O \( w \) lt.eq p \( R \) lt.eq frac(3 d, 4) w + O \( w \) \, $
  with absolute implied constants. They are incompatible for sufficiently large $d$.

These parts meet at one precise interface: the finite word of 2.
  The transfer in 8 works for any word satisfying that definition, while 28 establishes that at least one exists.
  In particular, the proof does not require a finite win for every nonmonomial matrix.

=== 1.4 Conventions and order of the argument <conventions-and-order-of-the-argument>

All matrices and scalar coefficients are over $bb(C)$, except where real symmetry and real orthogonality are
  explicitly used. Tensor products are ordinary Kronecker products.
  For an invertible square matrix $A$, its width is denoted by $\| A \|$.
  A matrix call acts on an ordered tuple of distinct coordinates and fixes every other coordinate.
  Zero-dimensional blocks may be omitted. A superscript $sans(T)$ denotes ordinary transpose, not conjugate transpose.

The price function is introduced only under the assumption that there is no finite win.
  It is an auxiliary real-valued function, not an asserted lower bound for circuit size.
  Every limiting argument proves an inequality for exact finite matrices.
  In particular, specialization never replaces an exact circuit by a limit of approximate computations.

Constants in an $O$ bound may depend on fixed local matrices and their dimensions.
  When a tensor order $k$ and a run length $t$ vary, each polynomial bound in $k$ has a fixed exponent and is
  independent of $t$ unless stated otherwise. Scalar coefficients may depend on these parameters,
  as the model permits. We specify the order of choices at the packing, feedback, and specialization steps.

Section 2, Section 3 prove the transfer from one finite win, through positive generation, amplification,
  and exact-width Fourier layers. 4 constructs the price function from the opposite assumption.
  Section 5, Section 6 establish corner contraction, feedback, and algebraic specialization.
  7 gives scalar-pivot invariance and the dense-pair bound.
  Finally, 8 uses those laws to force the reflection contradiction and prove 28, which closes the proof of 1.

== 2 Positive words and tensor amplification <gen:sec:generation>

For an invertible square matrix $A$, write $\| A \|$ for its width.
  A #emph[monomial matrix] is a permutation matrix times an invertible diagonal matrix.
  A #emph[call to $A$ on $w$ coordinates], where $w gt.eq \| A \|$,
  applies $A$ to an ordered tuple of $\| A \|$ distinct coordinates and fixes the others.
  A #emph[matrix word] is a finite composition of such calls and full-width monomial matrices.
  In a word using one specified matrix $A$, its #emph[call count] counts only occurrences of $A$;
  monomials have zero call count. This convention concerns words alone.
  In the scalar circuit model, a monomial on $w$ coordinates costs at most $w$ scalar multiplications,
  with its permutation realized by designating the appropriate available values.

#prodef([Definition 2.1.])[
  (Finite win).  A finite win consists of an invertible nonmonomial matrix $A in "GL"_q \( bb(C) \)$,
    an integer $b gt.eq 2$, and a word on exactly $q^b$ coordinates implementing $A^(⊗ b)$ with $g$ calls to $A$, where
  #[#set math.equation(numbering: n => "(2.1)")
   $ g < b q^(b - 1) . $ <gen:eq:strict-win>]
] <def:finite-win>

The comparison in (2.1) is with the usual tensor-axis algorithm:
  for each of the $b$ axes, it makes $q^(b - 1)$ calls to $A$. Nonmonomiality implies $q gt.eq 2$.
  It also implies that $A^(⊗ b)$ is nonmonomial: an invertible nonmonomial matrix has a row with at least two
  nonzero entries, and tensoring that row with any nonzero rows preserves this property.
  Thus a winning word necessarily has $g gt.eq 1$.

=== 2.1 One fixed positive pattern generates every target <one-fixed-positive-pattern-generates-every-target>

The following statement supplies both the local substitutions in the Fourier transfer and positive-call identity
  words used later in packing. The positions of all calls are fixed before the target matrix is chosen.

#thm([Lemma 2.2.])[
  (Positive generation).  #emph[Let $A in "GL"_q \( bb(C) \)$ be nonmonomial.
    There is an integer $h > 0$ such that every $H in "GL"_q \( bb(C) \)$ admits a factorization
#[#set math.equation(numbering: n => "(2.2)")
 $ H = M_0 A M_1 A dots.h.c A M_h \, $ <gen:eq:common-pattern>]

 with exactly $h$ occurrences of $A$ and monomial matrices $M_i$.
   In particular, identity admits such a factorization with a positive number of calls.
   More generally, for every fixed $w gt.eq q$, there is a fixed positive pattern on $w$ coordinates realizing
   every element of $"GL"_w \( bb(C) \)$ by embedded calls to $A$ and monomials.]
] <lem:generation>

#proof[
  We build a fixed word whose adjustable diagonal factors give a full-rank differential,
    then show that its actual values contain a nonempty Zariski open subset of $"GL"_q \( bb(C) \)$.
    Every invertible target is a product of two values from this subset, so doubling the word gives the common pattern.
  Let $E_(i j)$ denote the matrix units. Let $frak(d) subset
    "Mat"_q \( bb(C) \)$ be the diagonal subspace and let $cal(S)$ be the semigroup of words in $A$ and monomials,
    including identity. Inverses are not among the specified calls. First we prove
  #[#set math.equation(numbering: n => "(2.3)")
   $ "span"_(s in cal(S)) s frak(d) s^(- 1) = "Mat"_q \( bb(C) \) . $ <gen:eq:tangent-span>]
  If $A frak(d) A^(- 1) subset frak(d)$, each rank-one idempotent $A E_(i i)
    A^(- 1)$ would be a diagonal rank-one idempotent, hence some $E_(pi \( i \) pi \( i \))$.
    Orthogonality of these idempotents forces $pi$ to be a permutation.
    The identity $A E_(i i) = E_(pi \( i \) pi \( i \)) A$ then says that column $i$ of $A$ is supported in row
    $pi \( i \)$; invertibility would make $A$ monomial. Consequently some $X in A frak(d) A^(- 1)$ has $X_(i j)
    eq.not 0$ for $i eq.not j$.
  Write $cal(V)$ for the span on the left of (2.3). For every invertible diagonal $D =
    "diag" \( d_1 \, dots.h \, d_q \)$, the matrix $D X D^(- 1)$ belongs to $cal(V)$.
    If a linear functional $ell$ vanishes on $cal(V)$, then
  $ 0 = ell \( D X D^(- 1) \) = sum_a X_(a a) ell \( E_(a a) \) +
    sum_(a eq.not c) X_(a c) ell \( E_(a c) \) d_a \/ d_c wide \( d_1 \, dots.h \, d_q in bb(C)^(*) \) . $
  The Laurent monomials $1$ and $d_a \/ d_c$ for $a eq.not c$ are distinct and linearly independent.
    Thus $X_(i j) ell \( E_(i j) \) = 0$, and so $ell \( E_(i j) \) = 0$.
    Finite-dimensional linear duality gives $E_(i j) in cal(V)$.
    Conjugation by any permutation preserves $cal(V)$, because left multiplication of a word by that permutation
    is again a word. Hence $cal(V)$ contains every off-diagonal matrix unit.
    It also contains $frak(d)$, using $s = I_q$. This proves (2.3).
  We next arrange the spanning directions along one word. Start with the prefix $h_0 =
    I_q$ and its diagonal directions. If the directions collected so far span a proper subspace and the current
    prefix is $h$, then
  $ "span"_(s in cal(S)) \( h s \) frak(d) \( h s \)^(- 1) = h "Mat"_q \( bb(C) \) h^(- 1) = "Mat"_q \( bb(C) \) . $
  Choose a word $s$ whose directions enlarge the collected span,
    and append it to the right of $h$ in written product order.
    Each choice increases the dimension, so finitely many choices suffice.
    Denote the successive appended words by $s_1 \, dots.h \, s_r$ and their prefixes by $h_i = s_1 dots.h.c s_i$.
    The spaces $h_i frak(d) h_i^(- 1)$, including $i = 0$, now span $"Mat"_q \( bb(C) \)$.
  Insert variable diagonal factors in the product
  $ Phi \( D_0 \, dots.h \, D_r \) = D_0 s_1 D_1 s_2 dots.h.c s_r D_r . $
  At $D_0 = dots.h.c = D_r = I_q$, its value is $h_r$. Varying $D_i$ in the diagonal direction $E_(a a)$ gives the
    right-translated derivative
  $ \( delta Phi \) h_r^(- 1) = h_i E_(a a) h_i^(- 1) . $
  Thus the derivative has rank $a = q^2$. Choose $a$ diagonal entries whose derivative columns are independent,
    and fix all other entries to $1$. Listing matrix entries produces a polynomial map
  $ f : bb(C)^a arrow.r bb(C)^a $
  whose Jacobian determinant is nonzero at $\( 1 \, dots.h \, 1 \)$.
    Parameters in $\( bb(C)^(*) \)^a$ give admissible words. We show next that their image contains an actual
    nonempty Zariski open subset of $"GL"_q \( bb(C) \)$.
  Write $x_1 \, dots.h \, x_a$ for the selected parameters and $f_1 \, dots.h \, f_a$ for the output entries.
    The $f_i$ are algebraically independent. Indeed, a nonzero polynomial relation $P \( f \) =
    0$ of least total degree would, upon differentiation and inversion of the Jacobian over
    $bb(C) \( x_1 \, dots.h \, x_a \)$, imply $\( partial P \/ partial y_i \) \( f \) = 0$ for every $i$.
    In characteristic zero at least one of these is a nonzero polynomial of smaller degree, a contradiction.
    Both fields in the inclusion
  $ bb(C) \( f_1 \, dots.h \, f_a \) subset bb(C) \( x_1 \, dots.h \, x_a \) $
  therefore have transcendence degree $a$. The latter is an algebraic extension generated by the finitely many
    $x_i$, so it is finite. Each of the finitely many elements $x_i \,
    x_i^(- 1)$ satisfies a monic equation over the smaller field.
    Choose a nonzero polynomial $g \( y_1 \, dots.h \, y_a \)$ divisible by the denominators of all coefficients
    of these equations. With
  $ R & = bb(C) \[ f_1 \, dots.h \, f_a \, 1 \/ g \( f \) \] \,\
B & = R \[ x_1 \, dots.h \, x_a \, x_1^(- 1) \, dots.h \, x_a^(- 1) \] subset bb(C) \( x_1 \, dots.h \, x_a \) \, $
  all the displayed generators of $B$ are integral over $R$.
    Reducing their powers by their monic equations shows directly that $B$ is a finite $R$-module.
    Both are domains and $R arrow.r.hook B$ is injective. This is the finite-type integral-extension criterion
    #cite(label("stacksProject")) Tag 02JJ, Lemma 10.36.5.
  Fix any target $y in bb(C)^a$ with $g \( y \) eq.not 0$, and let
    $frak(m) = \( f_1 - y_1 \, dots.h \, f_a - y_a \) subset R$.
    Algebraic independence identifies $R \/ frak(m)$ with $bb(C)$.
    Localizing the inclusion above gives $R_(frak(m)) arrow.r.hook
    B_(frak(m))$ inside the field $bb(C) \( x_1 \, dots.h \, x_a \)$,
    so $B_(frak(m))$ is a nonzero finite module over the local ring $R_(frak(m))$. Its residue algebra
  #[#set math.equation(numbering: n => "(2.4)")
   $ B_(frak(m)) \/ frak(m) B_(frak(m)) $ <gen:eq:nonzero-fiber>]
  is nonzero. This is the lying-over step for the integral inclusion #cite(label("stacksProject")) Tag 00GQ,
    Lemma 10.36.17. For completeness, if it were zero, a finite list of module generators $b_1 \, dots.h \,
    b_e$ would satisfy $b_i = sum_j c_(i j) b_j$ with all $c_(i j)$ in the maximal ideal of $R_(frak(m))$.
    The determinant of $I - \( c_(i j) \)$ is a unit in this local ring.
    Multiplication by its adjugate forces every $b_i$ to be zero, contradicting $B_(frak(m)) eq.not 0$.
  The algebra in (2.4) is finite dimensional over $bb(C)$. A quotient by a maximal ideal is a finite field
    extension of $bb(C)$, and hence is $bb(C)$ itself. The resulting homomorphism $B arrow.r
    bb(C)$ sends $x_i$ to some $xi_i eq.not 0$, since $x_i^(- 1)$ is also in $B$.
    The polynomial identities defining the $f_i$ descend to $f_i \( xi \) = y_i$.
    These are actual admissible parameters of the fixed word. In particular its image contains
  $ Omega = { Y in "Mat"_q \( bb(C) \) : g \( Y \) det Y eq.not 0 } \, $
  a nonempty open set, because $g \( Y \) det Y$ is a nonzero polynomial.
  Finally fix $H in "GL"_q \( bb(C) \)$. There is a $V$ for which both $V in Omega$ and $V^(- 1) H in Omega$.
    To see this without any limiting argument, clear powers of $det V$ from $g \( V^(- 1) H \)$.
    Its numerator is a nonzero polynomial: the substitution $V mapsto V^(- 1)
    H$ is a bijection of $"GL"_q \( bb(C) \)$, with inverse $W mapsto H W^(- 1)$,
    so this rational function is not identically zero. Avoid simultaneously the zeros of that numerator,
    $g \( V \)$, and $det V$. A finite product of nonzero polynomials over $bb(C)$ is nonzero and has a point
    where it does not vanish. This supplies the required $V$.
    Setting $W = V^(- 1) H$ gives $H = V W$, with both factors realized by the same fixed word pattern.
    Two copies of that pattern therefore realize every $H$.
  The initial pattern contains at least one occurrence of $A$:
    otherwise its values have one fixed monomial support, a space of dimension $q$,
    contradicting the derivative rank $q^2 > q$. Expanding the fixed words $s_i$ and merging adjacent monomials in
    the doubled pattern gives (2.2) with a fixed $h > 0$. All inverses used in the argument occurred in matrix
    identities or parameter selection; every factor of the constructed words is a forward call to $A$ or a
    monomial. For $w > q$, applying the same result to the nonmonomial matrix $A xor
    I_(w - q)$ proves the wider-width assertion, because each call to this matrix is one embedded call to $A$. ◻
]

=== 2.2 Amplifying a finite saving <amplifying-a-finite-saving>

The next lemma concerns scalar gates, including the cost of every monomial scaling.
  All its constants are allowed to depend on the single fixed finite win.

#thm([Lemma 2.3.])[
  (Tensor amplification).  #emph[If $\( A \, b \, g \)$ and a specified winning word form a finite win,
    then there are constants $C < oo$ and $0 < alpha < 1$ such that $A^(⊗ k)$ has an exact scalar linear circuit
    with at most $C q^k \( k + 1 \)^alpha$ gates for every integer $k gt.eq 0$.]
] <lem:amplification>

#proof[
  Let $L_A \( k \)$ be the minimum scalar gate count for $A^(⊗ k)$, and put $f \( k \) = L_A \( k \) \/ q^k$.
    Here $A^(⊗ 0) = I_1$ and $f \( 0 \) = 0$. These minima exist:
    entrywise multiplication and addition give finite circuits,
    and a nonempty set of nonnegative integer gate counts has a minimum. Set
  $ Q = q^b \, wide p = q \/ Q \, wide j = floor.l k \/ b floor.r . $
  Tensor the winning word with itself over $j$ groups, multiplying the corresponding slots together.
    The product of these slots is $\( A^(⊗ b) \)^(⊗ j) = A^(⊗ b j)$.
  A monomial slot remains monomial after taking this tensor power, and therefore costs at most $Q^j$ scalar gates.
    Each call slot is permutation-conjugate to $A xor I_(Q - q)$.
    Its $j$-fold tensor power, after reordering coordinates, has the following exact direct-sum decomposition:
  #[#set math.equation(numbering: n => "(2.5)")
   $ \( A xor I_(Q - q) \)^(⊗ j) med tilde.equiv med xor.big_(r = 0)^j
     (A^(⊗ r))^(xor binom(j, r) \( Q - q \)^(j - r)) . $ <gen:eq:sector-decomposition>]
  For a chosen subset of $r$ active factors, the inactive factors supply $\( Q - q \)^(j - r)$ independent scalar
    coordinate choices, explaining the multiplicity. The total width is $sum_r binom(j, r)
    q^r \( Q - q \)^(j - r) = Q^j$. Computing the blocks separately with minimum circuits gives normalized cost at most
  #[#set math.equation(numbering: n => "(2.6)")
   $ 1 / Q^j sum_(r = 0)^j binom(j, r) \( Q - q \)^(j - r) L_A \( r \) & =
     sum_(r = 0)^j binom(j, r) p^r \( 1 - p \)^(j - r) f \( r \)\
 & = bb(E) f \( K \) \, wide K tilde.op "Bin" \( j \, p \) . $ <gen:eq:weighted-cost>]
  In particular, this distribution weights sectors by their coordinate dimensions; the sectors have different widths.
  Replicate the resulting circuit over the coordinates of the remaining $k - b j < b$ tensor axes.
    The normalized cost is unchanged by this replication. If a fixed circuit for $A$ has $ell_A$ gates,
    applying $A$ along each remaining axis costs $ell_A q^(k - 1)$ gates per axis.
    Since the number of monomial slots in the winning word is fixed,
    there is a constant $C_0$ independent of $k$ such that
  #[#set math.equation(numbering: n => "(2.7)")
   $ f \( k \) lt.eq C_0 + g thin bb(E) f \( K \) \, wide K tilde.op
     "Bin" \( floor.l k \/ b floor.r \, q \/ Q \) . $ <gen:eq:recurrence>]
  For $j = 0$ the grouped part is identity and the same inequality follows from the bound on the fewer than $b$
    remaining axes. Every permutation used in deriving (2.5) is only a reindexing;
    every diagonal scaling has already been charged.
  Put $rho = q \/ \( Q b \)$. The strict saving gives $g rho < 1$,
    and hence we can choose $0 < alpha < 1$ sufficiently close to $1$ that $g rho^alpha < 1$.
    Choose also a number $gamma$ with $g rho^alpha < gamma < 1$. Since
  $ g (frac(rho k + 1, k + 1))^alpha arrow.r g rho^alpha \, $
  there is $k_0 gt.eq 1$ such that this expression is at most $gamma$ for all $k gt.eq k_0$.
    Choose $C$ at least $C_0 \/ \( 1 - gamma \)$ and large enough that $f \( k \) lt.eq
    C \( k + 1 \)^alpha$ for $k < k_0$. For $k gt.eq k_0$, every value of $K$ satisfies $K lt.eq
    floor.l k \/ b floor.r < k$. Strong induction, concavity of $x mapsto x^alpha$, and $bb(E) K =
    p floor.l k \/ b floor.r lt.eq rho k$ therefore give
  $ f \( k \) lt.eq C_0 + g C thin bb(E) \( K + 1 \)^alpha lt.eq C_0 + g C \( rho k + 1 \)^alpha lt.eq C_0 +
    C gamma \( k + 1 \)^alpha lt.eq C \( k + 1 \)^alpha . $
  All circuits used in this induction compute exact matrices;
    the expectation is merely the finite weighted sum in (2.6). Multiplying by $q^k$ proves the scalar gate bound
  $ L_A \( k \) = O #scale(x: 120%, y: 120%)[\(] q^k \( k + 1 \)^alpha #scale(x: 120%, y: 120%)[\)] \, wide
    0 < alpha < 1 . $
  ◻
]

== 3 From a finite win to exact Fourier circuits <fft:transfer>

The amplification in 4 concerns tensor powers of one fixed matrix.
  To use it for Fourier transforms of different widths, we first construct shallow matrix words without enlarging
  those widths. A #emph[pair layer] is a direct sum, after a coordinate permutation,
  of invertible two-coordinate matrices and one-coordinate identities.
  A #emph[monomial layer] is an invertible monomial matrix on the whole coordinate set.
  During a recursive construction we also permit a #emph[mixed round]:
  on disjoint regions it performs monomial layers or pair layers.
  Such a round splits into at most two layers of the stated types, since the operations on different regions commute.

=== 3.1 Convolutions and borrowed coordinates <convolutions-and-borrowed-coordinates>

We will use the following elementary circuit fact. A convolution with a fixed vector,
  including truncations and reversals of its inputs or outputs, has a linear DAG with

$ O #scale(x: 120%, y: 120%)[\(] v log \( 2 + v \) #scale(x: 120%, y: 120%)[\)] quad upright("gates") \, wide
  O #scale(x: 120%, y: 120%)[\(] log \( 2 + v \) #scale(x: 120%, y: 120%)[\)] quad upright("depth") \, $

where $v$ is the sum of the input and kernel lengths. Moreover its variable inputs and gates have bounded fan-out,
  including uses at the outputs, with an absolute bound. Here and below depth counts scalar arithmetic gates.

For nonempty vectors of lengths $a \, e gt.eq 1$, pad both by zeros to the least power of two $L gt.eq a + e - 1$;
  then $L < 2 \( a + e - 1 \)$. Empty operands give the zero map and may be omitted.
  At $L = 1$ the Fourier maps are identities. At the $L$th roots of unity,
  ordinary convolution becomes pointwise multiplication; the transform of the fixed vector is part of the
  prechosen constants. The binary Fourier recursion transforms even and odd positions separately and combines each
  pair of transformed entries $a \, b$ as $a + omega b \, a - omega b$.
  It uses at most three scalar gates per pair, $O \( L log \( 2 L \) \)$ gates in total,
  and $O \( log \( 2 L \) \)$ depth. Every recursion input feeds one leaf;
  each transformed entry is used in only its own pair of outputs at the next level.
  The inverse uses inverse roots and a final scaling by $L^(- 1)$, with the same bounds.
  Padding zeros require no variable input. The intervening diagonal multiplications and the output selections
  preserve bounded fan-out. This also proves the same estimates for a fixed number of such convolutions,
  compositions, and sums. All scalar multiplications in these estimates are charged.

The padded DAG in this argument need not itself be in place.
  The next lemma explains how its workspace can be supplied by existing coordinates carrying arbitrary values.
  The forward, output, and reverse sweeps follow the uncomputation pattern of Bennett #cite(label("bennett1973")).
  The arbitrary initial values also connect this construction with transparent computation
  #cite(label("buhrmanEtAl2014")) Section 3. The second replay below removes their contribution and supplies the
  precise shear and layer counts used here.

#thm([Lemma 3.1.])[
  (Dirty-coordinate replay).  #emph[Let $M : bb(C)^e arrow.r
    bb(C)^a$ have a linear DAG with $ell$ gates and depth $H$.
    Suppose every variable input and gate has fan-out at most $delta$, counting designated output uses.
    On disjoint source coordinates $x$, target coordinates $y$, and $ell$ further coordinates $z$,
    there is a word of coordinate shears realizing
$ \( x \, y \, z \) mapsto \( x \, y + M x \, z \) . $

 It uses at most $8 ell + 2 a$ shears and $O #scale(x: 120%, y: 120%)[\(] \( delta + 1 \) \( H + 1 \)
   #scale(x: 120%, y: 120%)[\)]$ pair layers. The initial values of $z$ are arbitrary, and may depend on $x \,
   y$ or other data.]
] <fft:dirty-layers>

#proof[
  Assign one distinct coordinate $z_v$ to each gate $v$, ordered topologically.
    To simulate the gate, add its prescribed linear combination of predecessors into $z_v$.
    A scalar gate requires one shear, and an addition or subtraction requires at most two.
    An edge from the literal input zero is omitted. Predecessors are either original source coordinates or earlier
    gate coordinates; in particular none is the coordinate being updated. The forward sweep therefore has the form
  #[#set math.equation(numbering: n => "(3.1)")
   $ z mapsto U z + T x \, $ <fft:dirty-forward>]
  where $U$ is unit lower triangular in the chosen order. Write the designated output reads as $F
    z_(upright("current")) + D x$; this includes outputs that are original inputs,
    and a zero output contributes no read. Each nonzero output is one designated read.
    Starting with zero gate coordinates computes the original DAG, so
  #[#set math.equation(numbering: n => "(3.2)")
   $ F T + D = M . $ <fft:dirty-output>]
  Run the forward sweep, add its outputs into $y$, and undo every shear of that sweep in reverse order.
    The net effect on $y$ is addition of
  $ F \( U z + T x \) + D x = M x + F U z \, $
  and every scratch coordinate returns to its initial value.
    Next run the same forward sweep with #emph[all] edges from original source coordinates omitted.
    Omit the direct-source output term $D x$ as well. This sweep sends $z$ to $U z$.
    Subtract its outputs $F U z$ from $y$ and undo the sweep.
    This leaves exactly $y + M x$ and restores $z$ once more.
    The target coordinates are never read by either sweep. These identities hold for independent formal variables
    $x \, y \, z$, hence remain valid after substituting correlated values for the initial scratch.
  To obtain the layer bound, assign gates their longest-path depth levels.
    Within a level, all destinations are new gate coordinates and all predecessors belong to earlier levels or to
    the sources. The undirected multigraph of shear edges has maximum degree at most $Delta = max { 2 \, delta }$:
    a destination has at most two incoming edges and a predecessor has at most $delta$ uses.
    Repeated edges can be combined, or retained with their bounded multiplicity.
    Greedy edge coloring uses at most $2 Delta - 1$ colors, because an edge meets at most $2 Delta -
    2$ other edges. Each color is a disjoint-pair layer. These shears can be reordered by colors because no
    destination in this level is a predecessor in the same level.
    Output additions have the same bounded-degree property on source or gate coordinates and target coordinates.
    Reversing the colored levels gives the exact inverse sweep.
    Thus four sweeps and two output rounds need at most $4 \( 2 Delta - 1 \) H + 2 \( 2 Delta - 1 \)$ layers.
    Each sweep uses at most $2 ell$ shears and each output round at most $a$, proving the count. ◻
]

=== 3.2 An exact-width factorization <an-exact-width-factorization>

The structured-matrix step uses the displacement-rank method of Kailath, Kung,
  and Morf #cite(label("kailathKungMorf1979")) Lemmas 1–2: a matrix whose difference from a shifted copy has low
  rank can be reconstructed from convolution factors. We give the rectangular reconstruction in the proof,
  then place its workspace inside the original coordinate set.

#thm([Lemma 3.2.])[
  (Triangular Toeplitz layers).  #emph[Every invertible lower triangular Toeplitz matrix of width $r$ has a
    factorization on exactly $r$ coordinates into $O \( 1 + log^4 r \)$ monomial and pair layers.
    The implied constant is absolute and independent of its entries.]
] <fft:toeplitz-layers>

#proof[
  Write $T_r = \( h_(i - j) \)_(0 lt.eq j lt.eq i < r)$, with zero entries above the diagonal and $h_0 eq.not 0$.
    Let $g_0 \, g_1 \, dots.h$ be the coefficients of the inverse formal series to $sum_(j gt.eq 0) h_j z^j$,
    extending the specified $h_j$ arbitrarily beyond those needed. Split at $s = floor.l r \/ 2 floor.r$, and put
  $ T_r = mat(delim: "(", T_s, 0; B, T_(r - s)) . $
  First apply its two diagonal blocks recursively and in parallel.
    To finish, add from the first block into the second by $C = B T_s^(- 1)$.
    With global row and column indices its entries are
  #[#set math.equation(numbering: n => "(3.3)")
   $ C_(i j) = sum_(nu = j)^(s - 1) h_(i - nu) g_(nu - j) \, wide s lt.eq i < r \, quad 0 lt.eq
     j < s . $ <fft:cross-block>]
  Partition the source and target ranges into consecutive chunks, of a size to be specified below,
    and consider a chunk matrix $M$ of size $a times e$. Let $S_a \, S_e$ be lower-shift matrices,
    with ones in positions $\( u \, u - 1 \)$. For entries away from the first row and first column of the chunk,
    (3.3) gives
  $ M_(u v) - \( S_a M S_e^(sans(T)) \)_(u v) = C_(i j) - C_(i - 1 \, j - 1) = - h_(i - s) g_(s - j) . $
  The right side is an outer product on those entries. Extending this outer product to the whole chunk leaves only
    its first row and first column to correct; these have rank at most one each. Consequently
  #[#set math.equation(numbering: n => "(3.4)")
   $ E = M - S_a M S_e^(sans(T)) = sum_(nu = 1)^rho v^(\( nu \)) \( w^(\( nu \)) \)^(sans(T)) \, wide rho lt.eq
     3 . $ <fft:displacement>]
  Nilpotence of the shifts gives the terminating telescoping identity
  $ M = sum_(l gt.eq 0) S_a^l E \( S_e^(sans(T)) \)^l . $
  For one outer product $v w^(sans(T))$ its summand matrix has entries $sum_(l gt.eq 0) v_(u - l) w_(j - l)$,
    with both vectors zero-extended. It applies to $x in bb(C)^e$ by the two maps
  #[#set math.equation(numbering: n => "(3.5)")
   $ b_l = sum_(j = l)^(e - 1) w_(j - l) x_j quad \( 0 lt.eq l < e \) \, wide c_u =
     sum_(l = 0)^(e - 1) v_(u - l) b_l quad \( 0 lt.eq u < a \) . $ <fft:two-convolutions>]
  The first is a convolution after reversing the input and selecting coefficients;
    the second is a truncated convolution. Sum the at most three resulting vectors.
    The preceding binary-FFT construction therefore supplies a DAG for $M x$ satisfying,
    for absolute constants $C_0 \, C_1 \, delta_0$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ ell lt.eq C_0 \( a + e \) log_2 \( 2 + a + e \) \, wide H lt.eq C_1 log_2 \( 2 + a + e \) \, wide delta lt.eq
     delta_0 . $ <fft:chunk-dag>]
  These bounds include the sums of the at most three terms and all output uses.
    In particular, copying the input to these three fixed networks multiplies its fan-out by only a constant.
    The constants do not depend on the Toeplitz entries or the chosen outer products.
  Choose once and for all $D gt.eq 16 C_0 + 16$ and, for sufficiently large $r$, take chunk size
  $ h = ⌊frac(r, D log_2 r)⌋ . $
  Choose a fixed threshold $r_0$ so that, for all $r gt.eq r_0$, $h gt.eq r \/ \( 2 D log_2 r \) gt.eq 1$.
    The final chunk in either range may be shorter. For every chunk pair,
  $ a + e lt.eq frac(2 r, D log_2 r) lt.eq r / 8 \, wide log_2 \( 2 + a + e \) lt.eq 2 log_2 r \, wide ell lt.eq
    frac(4 C_0 r, D) < r / 4 . $
  At least $7 r \/ 8$ coordinates of this very recursion block lie outside the source and target chunks.
    They suffice for the $ell$ scratch coordinates in 5. No extra coordinate is introduced for the padded FFT:
    its zero inputs require no register, and every gate requiring a register is already counted in $ell$.
    The lemma implements addition of this chunk’s contribution in $O \( log r \)$ pair layers and restores every
    other coordinate.
  Process the chunk pairs serially. Source chunks remain unchanged, target additions accumulate,
    and coordinates in other chunks can be borrowed again with their current values, even if already updated.
    There are at most $r \/ h + 2 = O \( log r \)$ chunks in total and hence $O \( log^2 r \)$ pairs.
    The cross-block update needs $O \( log^3 r \)$ layers. For $r < r_0$,
    elimination expresses $T_r$ using scalings and coordinate shears on the same coordinates,
    at a bounded cost depending only on the fixed $r_0$.
  Let $d \( r \)$ denote the worst mixed-round depth of this construction.
    The child recursions use only their own disjoint blocks, so their depths take a maximum, and
  $ d \( r \) lt.eq max { d \( floor.l r \/ 2 floor.r \) \, d \( ceil.l r \/ 2 ceil.r \) } + O \( 1 + log^3 r \) . $
  Summing along the $O \( log r \)$ balanced recursion levels gives $d \( r \) = O \( 1 + log^4 r \)$.
    Splitting mixed rounds into at most two layers finishes the proof, still on exactly $r$ coordinates. ◻
]

The Fourier-to-Toeplitz identity used next is the geometric-Vandermonde $L D
  L^(sans(T))$ factorization of #cite(label("kuznetsov2018"), form: "prose") Theorem 1,
  specialized to a primitive root of unity. For the general Vandermonde factorization through Newton
  interpolation, see also #cite(label("orucPhillips2000"), form: "prose") Theorem 2.1.
  We derive the identity here to fix our conventions, then apply the preceding layer construction to its
  triangular factors.

#thm([Lemma 3.3.])[
  (Exact-width Fourier layers).  #emph[For every integer $r gt.eq 1$,
    the unnormalized Fourier matrix $F_r$ has a factorization on exactly $r$ coordinates into
    $O \( 1 + log^4 r \)$ monomial and pair layers, with an absolute implied constant.]
] <lem:fourier-layers>

#proof[
  The case $r = 1$ is identity. For $r gt.eq 2$ put $u = zeta_r$,
    and let $P$ have as its $k$th column the coefficients of the monic Newton polynomial
    $product_(j = 0)^(k - 1) \( X - u^j \)$, for $0 lt.eq k < r$. Thus $P$ is unit upper triangular.
    Evaluating these polynomials gives $N = F_r P$, a lower triangular matrix, with
  #[#set math.equation(numbering: n => "(3.7)")
   $ N_(i k) = product_(j = 0)^(k - 1) \( u^i - u^j \) = \( - 1 \)^k u^(k \( k - 1 \) \/ 2) H_i /
     H_(i - k) quad \( i gt.eq k \) \, wide H_j = product_(e = 1)^j \( 1 - u^e \) \, quad H_0 = 1 . $ <fft:newton>]
  Only $H_0 \, dots.h \, H_(r - 1)$ occur, all nonzero since $u$ is a primitive $r$th root.
    In particular $N$ is invertible and
  $ N = "diag" \( H_i \) thin T thin "diag" #scale(x: 120%, y: 120%)[\(] \( - 1 \)^k u^(k \( k - 1 \) \/ 2)
    #scale(x: 120%, y: 120%)[\)] \, wide T_(i k) = cases(delim: "{", 1 \/ H_(i - k) \, & i gt.eq k \,, 0 \, & i < k .) $
  The middle matrix is invertible triangular Toeplitz, and the outer factors are invertible diagonal matrices.
  Let $D_N = "diag" \( N_00 \, dots.h \, N_(r - 1 \, r - 1) \)$ and $L = N D_N^(- 1)$.
    Then $F_r = L D_N P^(- 1)$ is a unit-lower/diagonal/unit-upper factorization.
    Such a factorization, when it exists, is unique: on equating two,
    a unit lower triangular matrix equals an upper triangular matrix, hence is identity,
    after which the diagonal and upper factors agree. Since $F_r = F_r^(sans(T))$,
    transposition supplies another such factorization. Uniqueness gives $P^(- 1) = L^(sans(T))$, and therefore
  #[#set math.equation(numbering: n => "(3.8)")
   $ F_r = N D_N^(- 1) N^(sans(T)) . $ <fft:fourier-toeplitz>]
  Apply 6 to $T$ and include its two diagonal factors to factor $N$.
    Transposing a product reverses its factor order; the transpose of each monomial or pair layer is again of that
    type. Thus (3.8) has the asserted factorization. ◻
]

=== 3.3 Prime factors and synchronized generation <prime-factors-and-synchronized-generation>

The Chinese remainder tensor identity used below is the classical coprime-factor Fourier decomposition
  #cite(label("good1958")) Section 12 #cite(label("cooleyLewisWelch1967")) Equations (6)–(10).
  We include the index calculation to specify the root powers and the coordinate permutations needed for
  synchronization.

#thm([Proposition 3.4.])[
  (Transfer of a finite win).  #emph[If a finite win exists, there are integers $n_m arrow.r
    oo$ and exact linear circuits for $F_(n_m)$ whose scalar gate counts satisfy
$ L \( n_m \) = o \( n_m log_2 n_m \) . $

 In particular the conclusion is in the model charging additions, subtractions,
   and multiplication by every prechosen complex scalar.]
] <prop:win-to-fourier>

#proof[
  Fix the winning matrix $A$ of width $q$, the winning tensor exponent, and the entire winning word.
    Since $A$ is nonmonomial, $q gt.eq 2$. By 4, there are fixed constants $C$ and $0 < alpha <
    1$ such that $A^(⊗ k)$ has a scalar circuit of size at most $C q^k \( k + 1 \)^alpha$ for every $k gt.eq 0$.
    All constants depending on this win remain fixed from now on.
  We first obtain enough moderately sized, distinct primes by an elementary estimate.
    If $pi \( v \)$ counts primes at most $v$, then
  $ binom(2 h, h) gt.eq frac(4^h, 2 h + 1) \, wide binom(2 h, h) lt.eq \( 2 h \)^(pi \( 2 h \)) . $
  The first inequality follows because the central binomial coefficient is the largest of the $2 h +
    1$ coefficients whose sum is $4^h$. For the second, the exponent of a prime $p$ in that coefficient is
  $ sum_(j gt.eq 1) (⌊frac(2 h, p^j)⌋ - 2 ⌊h / p^j⌋) lt.eq floor.l log_p \( 2 h \) floor.r . $
  Here each term is zero or one, and the formula itself follows by counting the multiples of $p \, p^2 \,
    dots.h$ in a factorial. The total power contributed by each prime is consequently at most $2 h$. It follows that
  $ pi \( 2 h \) gt.eq frac(h log 4 - log \( 2 h + 1 \), log \( 2 h \)) . $
  With $h = m^2$, this exceeds $m + pi \( 2 q \)$ for all sufficiently large $m$.
    Let $r_1 < r_2 < dots.h.c$ be the primes greater than $2 q$ and put $n_m = product_(i = 1)^m r_i$.
    Thus $r_m lt.eq 2 m^2$ eventually, $n_m arrow.r oo$, and $log n_m gt.eq m log 2$.
  For clarity, the Chinese remainder factorization here involves only permutations.
    Write $n = n_m$ and choose integers $e_i$ whose residue is one modulo $r_i$ and zero modulo every other $r_j$.
    These satisfy $e_i^2 = e_i$, $e_i e_j = 0$ for $i eq.not j$, and $sum_i e_i = 1$, all modulo $n$.
    The bijections $j = sum_i e_i j_i$, $k = sum_i e_i k_i$ yield
  $ zeta_n^(j k) = product_(i = 1)^m \( zeta_n^(e_i) \)^(j_i k_i) . $
  For example, take $e_i = \( n \/ r_i \) d_i$, where $\( n \/ r_i \) d_i equiv 1 med \( mod med r_i \)$;
    then $zeta_n^(e_i) = zeta_(r_i)^(d_i)$ and $d_i$ is a unit modulo $r_i$.
    Permuting $k_i$ by this unit converts the corresponding factor to $F_(r_i)$.
    Hence $F_n$ is $⨂_(i = 1)^m F_(r_i)$ up to input and output permutations.
  By 7, each factor has at most
  $ T = O \( 1 + log^4 m \) $
  layers, uniformly for these $r_i$. Pad the shorter sequences in time by identity layers.
    We next refine a synchronized time step by a bounded number of slots depending only on $A$.
  First reserve a monomial slot: on an axis whose current layer is monomial perform it,
    and on the other axes perform identity. On a pair-layer axis of width $r_i$,
    there are at most $floor.l r_i \/ 2 floor.r$ pairs. Split them into at most $q$ batches of at most $floor.l
    r_i \/ q floor.r$ pairs each. Indeed $floor.l r_i \/ q floor.r gt.eq r_i \/ \( 2 q \)$,
    so the required number of batches is at most $q$. Within a batch with $t$ pairs,
    choose a disjoint $q$-tuple containing each pair: the $2 t$ pair coordinates are already distinct and there
    are enough remaining coordinates because $q t lt.eq r_i$.
    The desired map on that tuple is its prescribed pair operation together with identity on the $q - 2$ spectators.
  By 3, every such map has an implementation using the same fixed sequence of positive $A$-call slots and monomial
    slots; denote its total number of slots by $s_A$. Run these words in parallel on the disjoint tuples.
    At a monomial slot their disjoint union, with identity on unused coordinates, is monomial.
    At an $A$-call slot the layer is a disjoint union of embedded $A$ calls and identity on unused coordinates.
    Use the same slots for every axis, padding to $q$ batches and using identity throughout empty batches or axes.
    The number of refined slots per original time is at most $1 + q s_A$, independently of $m$ and the $r_i$.
  The spectator coordinates may belong to pairs processed in later batches.
    A completed tuple word is exactly the required pair map direct-sum identity,
    so every spectator is restored before the next batch on its axis.
    For simultaneous execution on different axes, the exact product identity
  #[#set math.equation(numbering: n => "(3.9)")
   $ \( ⨂_i W_(i \, s) \) dots.h.c \( ⨂_i W_(i \, 1) \) = ⨂_i \( W_(i \, s) dots.h.c W_(i \, 1) \)
     $ <fft:synchronized-products>]
  proves correctness even though intermediate spectator values change.
    We implement each tensor slot as a complete linear map; no assumption about intermediate values on other axes
    is required. Throughout, the coordinate width remains exactly $n$.
  It remains to charge these refined slots in the scalar model.
    A tensor product of monomial layers is itself monomial and costs at most $n$ scalar multiplications;
    permutations merely reindex available values. At an $A$-call slot,
    decompose each axis into its active $q$-tuples and its unused singleton coordinates.
    Distributing the tensor product over these blocks expresses that slot, up to permutation,
    as a direct sum of matrices $A^(⊗ K)$ with $0 lt.eq K lt.eq m$.
    A sector of width $q^K$ costs at most $C q^K \( K + 1 \)^alpha lt.eq C q^K \( m + 1 \)^alpha$.
    The sector widths sum to $n$, so the whole slot costs at most $C n \( m + 1 \)^alpha$.
    The $K = 0$ sectors are identities and need no gates.
  Thus the complete circuit, including all monomial scalings, has size
  #[#set math.equation(numbering: n => "(3.10)")
   $ O #scale(x: 120%, y: 120%)[\(] n_m \( 1 + log^4 m \) \( m + 1 \)^alpha #scale(x: 120%, y: 120%)[\)] .
     $ <fft:final-size>]
  The constants in tensor monomials, Fourier convolutions, and generation words may all be prechosen,
    as permitted by the nonuniform model. A shear uses at most a scalar multiplication and an addition,
    and each binary fixed-coefficient combination uses at most three charged gates;
    no unbounded-fan-in operation is used. Finally, division of (3.10) by $n_m log_2 n_m$ gives $O
    #scale(x: 120%, y: 120%)[\(] \( 1 + log^4 m \) \( m + 1 \)^alpha \/ m #scale(x: 120%, y: 120%)[\)] arrow.r 0$.
    All matrix identities and all circuits used above are exact. ◻
]

== 4 Packing finite comparisons into global prices <price:section>

Assume throughout this section that no finite win in the sense of 2 exists.
  We construct a function on all invertible complex matrices.
  Its values measure the costs of matrix calls in an auxiliary argument;
  they do not make scalar multiplications free in the circuit model.

#thm([Theorem 4.1.])[
  (Global prices under the no-win assumption).  #emph[There is a function
$ p : union.big_(n gt.eq 1) "GL"_n \( bb(C) \) arrow.r \[ 0 \, oo \) $

 which vanishes exactly on the monomial matrices and has the following properties.
   For invertible matrices of the indicated sizes,
#[#set math.equation(numbering: n => "(4.1)")
 $ p \( L A R \) & = p \( A \) &  & upright("if ") L \, R upright(" are monomial of width ") \| A \| \,\
p \( A B \) & lt.eq p \( A \) + p \( B \) &  & upright("if ") \| A \| = \| B \| \,\
p \( A ⊗ B \) & = \| B \| p \( A \) + \| A \| p \( B \) \,\
p \( A xor B \) & = p \( A \) + p \( B \) \,\
p \( A^(- 1) \) & = p \( A^(sans(T)) \) = p \( A \) . $ <price:monomial-law>]

 Moreover,
#[#set math.equation(numbering: n => "(4.2)")
 $ p \( U \) = 1 \, wide U = mat(delim: "(", 1, 0; 1, 1) . $ <price:normalization>]

]
] <thm:prices>

The proof first constructs prices satisfying every finite tensor-word comparison.
  Symmetrization at the end preserves the laws displayed in the theorem;
  preservation of the entire original comparison family after that averaging will not be needed.

=== 4.1 The comparison inequalities <the-comparison-inequalities>

Take any tensor target $C_1 ⊗ dots.h.c ⊗ C_a$, with $a gt.eq 1$ and each $C_j$ invertible,
  and any word implementing it on exactly $Q = product_j \| C_j \|$ coordinates.
  Include in a finite list $A_1 \, dots.h \, A_m$ every distinct nonmonomial matrix occurring either as a factor
  or as a call; additional nonmonomial types may also be included. Put $q_i = \| A_i \|$.
  If $n_i$ factors equal $A_i$ and the word uses $g_i$ calls to $A_i$, define

#[#set math.equation(numbering: n => "(4.3)")
 $ Delta_i = n_i Q \/ q_i - g_i . $ <price:comparison-vector>]

Here $n_i Q \/ q_i$ is the number of calls in the usual computation along successive tensor axes.
  Monomial factors and operations have no coordinate in this vector. The desired comparison is

#[#set math.equation(numbering: n => "(4.4)")
 $ sum_(i = 1)^m Delta_i p \( A_i \) lt.eq 0 . $ <price:comparison>]

There is no bound on the widths, number of factors, or lengths of words used to define this family of
  inequalities. Each individual inequality involves finitely many types.

#thm([Lemma 4.2.])[
  (Packing comparisons).  #emph[Let $Delta^(\( 1 \)) \, dots.h \,
    Delta^(\( R \)) in bb(R)^m$ be any finite family of comparison vectors, with $m gt.eq
    1$ and the type list containing all their nonmonomial factors and calls.
    Under the no-win assumption there are no numbers $lambda_r gt.eq 0$ such that
$ s_i := sum_(r = 1)^R lambda_r Delta_i^(\( r \)) > 0 quad upright("for every ") 1 lt.eq i lt.eq m . $

]
] <price:packing>

#proof[
  Suppose such a combination exists. We will choose a block-diagonal matrix $J$ containing many copies of every
    $A_i$ and many identity blocks, and compute $J^(⊗ b)$ in fewer than the usual $b \|
    J \|^(b - 1)$ calls to $J$. Its tensor sectors give disjoint places to run copies of the comparison programs.
    The strict savings in every type leave room to spread these programs over fewer time slots while preserving
    each program’s order.
  For a slot to be one call to $J$, however, it must contain exactly the prescribed number of calls to each $A_i$.
    Random start times will first keep all slot loads below these capacities.
    We then fill every vacancy with a call belonging to an identity word on separate coordinates.
    The construction must therefore provide both slack in each slot and enough unused coordinates for these
    identity words. We first choose block proportions that reserve enough identity space;
    the strict comparison savings will then supply the slot slack.
  ===== 4.1.1 Fixed words, species, and proportions. <fixed-words-species-and-proportions.>
  Discard terms with coefficient zero. A comparison whose target has only monomial factors has
    $Delta_i^(\( r \)) = - g_i lt.eq 0$ for every $i$. Discarding these terms only increases the numbers $s_i$,
    so they may also be discarded. At least one comparison remains.
    Replace every monomial target factor by an identity of the same width.
    To obtain its new implementing word, append the inverse of that monomial along the appropriate tensor axis.
    The appended operation on the full sector is monomial, so all nonmonomial call counts are unchanged.
    Append width-one identity factors to make every target have the same number $b gt.eq 2$ of factors.
    This changes neither its width nor its comparison vector.
    Keep the entire original type list, including types appearing only in some implementing words.
    A type absent from every retained target would have only nonpositive retained differences, contrary to $s_i > 0$.
  There are now finitely many block species: one species for each $A_i$,
    and one identity species $I_d$ for every required identity dimension $d$, including $d = 1$.
    Denote this finite dimension set by $cal(D)$. By 3, for every $i$ there is a fixed word on $q_i$ coordinates
    implementing identity using exactly $h_i > 0$ calls to $A_i$ and monomials.
    Fix all these words and put $H = "lcm" \( h_1 \, dots.h \, h_m \)$.
  Choose positive integers $a_i$, each divisible by $H$, and positive integers $u_d$, $d in cal(D)$.
    By increasing $u_1$, arrange that, for
  $ w_0 = sum_i q_i a_i + sum_(d in cal(D)) d u_d \, wide theta = frac(sum_i q_i a_i, w_0) \, $
  one has
  #[#set math.equation(numbering: n => "(4.5)")
   $ b theta < \( 1 - theta \)^b . $ <price:identity-capacity>]
  This is possible since $theta$ tends to zero as $u_1$ increases. For each positive integer $v$, set
  $ w = v w_0 \, quad k_i = v a_i \, quad ell_d = v u_d \, quad J = xor.big_i A_i^(xor k_i) med
    xor #h(-0.16667em) xor.big_(d in cal(D)) I_d^(xor ell_d) . $
  Thus $\| J \| = w$. The fixed copy ratios $rho_i = k_i \/ w = a_i \/ w_0$ and $gamma_d = ell_d \/ w =
    u_d \/ w_0$ are all strictly positive. We let $w$ tend to infinity only along these multiples of $w_0$.
    In particular every $k_i$ is divisible by $H$, and the active coordinate fraction is exactly $sum_i q_i
    rho_i = theta$.
  The block decomposition of $J^(⊗ b)$ has one sector for every choice of a block copy on each of its $b$ axes.
    A sector with species pattern $sigma = \( sigma_1 \, dots.h \, sigma_b \)$ has width equal to the product of
    those species’ widths. Write $tau_(A_i) = rho_i$ and $tau_(I_d) = gamma_d$.
    The exact number of sectors with that ordered pattern is
  #[#set math.equation(numbering: n => "(4.6)")
   $ product_(j = 1)^b \( w tau_(sigma_j) \) = beta_sigma w^b \, wide beta_sigma =
     product_(j = 1)^b tau_(sigma_j) > 0 . $ <price:sector-count>]
  Repeated species give ordinary powers in this product: choices on distinct tensor axes are independent,
    so the same block-copy label can occur on two different axes.
    Patterns differing in any species have disjoint sector sets.
  ===== 4.1.2 Disjoint replacements and a fixed saving. <disjoint-replacements-and-a-fixed-saving.>
  Let $sigma \( r \)$ be comparison $r$’s ordered target pattern. Choose a fixed $eta > 0$ sufficiently small that
  #[#set math.equation(numbering: n => "(4.7)")
   $ eta sum_(r : thin sigma \( r \) = sigma) lambda_r lt.eq 1 / 2 beta_sigma quad
     upright("for every used pattern ") sigma \, wide eta s_i lt.eq 1 /
     2 b rho_i quad \( 1 lt.eq i lt.eq m \) . $ <price:eta-choice>]
  All quantities on the right have already been fixed and are positive. For comparison $r$, select
  $ m_r \( w \) = H ⌊frac(eta lambda_r w^b, H)⌋ $
  sectors of pattern $sigma \( r \)$. Equation (4.7) ensures that all selections can be disjoint,
    including selections of different comparisons having the same pattern.
    Run the comparison’s word on each selected sector. On every other sector run the standard axis program.
    Sectors containing only identity species require no operation, and no such sector was selected.
  The standard sector programs would use $G_i^0 = b k_i w^(b - 1)$ calls to $A_i$:
    choose the axis, one of its $k_i$ copies of $A_i$, and one coordinate on each remaining axis.
    The programs after replacement use
  #[#set math.equation(numbering: n => "(4.8)")
   $ G_i & = b k_i w^(b - 1) - sum_r m_r \( w \) Delta_i^(\( r \))\
 & = \( b rho_i - xi_i \) w^b + E_i \( w \) \, wide xi_i = eta s_i > 0 \, $ <price:total-load>]
  where $\| E_i \( w \) \| lt.eq H sum_r \| Delta_i^(\( r \)) \|$.
    In particular $G_i$ is a nonnegative integer divisible by $H$.
    There are only finitely many possible standard sector patterns and replacement words.
    Hence there is a fixed integer $L gt.eq 1$ bounding the number of nonmonomial calls in every such program,
    independently of $w$. Monomials before, between, and after these calls are retained as part of the program.
  Choose a fixed $epsilon > 0$ such that
  $ 0 < epsilon < min \( 1 \, b \/ 2 \) \, wide epsilon rho_i < xi_i \/ 4 quad \( 1 lt.eq i lt.eq m \) \, $
  and set
  $ T = floor.l \( b - epsilon \) w^(b - 1) floor.r \, wide F = T - L + 1 . $
  For all sufficiently large $w$, $F > 0$ and
  $ k_i - G_i / F = frac(xi_i - epsilon rho_i, b - epsilon) thin w + O \( w^(2 - b) \) . $
  The constants in the error terms are independent of $w$. Fix a number $kappa >
    0$ smaller than half the minimum of the positive coefficients in this display.
    Increasing the lower threshold on $w$ if necessary gives simultaneously
  #[#set math.equation(numbering: n => "(4.9)")
   $ G_i / F lt.eq k_i - kappa w quad \( 1 lt.eq i lt.eq m \) . $ <price:load-margin>]
  Thus the finite comparisons, their words, $b \, h_i \, H$, the species proportions (and $theta$), $eta \,
    xi_i \, L$, and finally $epsilon \, kappa$ have all been fixed before $w$ is taken large.
  ===== 4.1.3 A schedule respecting all dependencies. <a-schedule-respecting-all-dependencies.>
  Independently for each sector program having at least one nonmonomial call,
    choose a start uniformly from ${ 1 \, dots.h \, F }$. Put its successive nonmonomial calls in consecutive
    slots starting there. Every call lies in ${ 1 \, dots.h \, T }$, and its internal order is preserved.
    For a fixed type $i$ and slot $t$, let $X_(i \, t)$ be the number of scheduled calls of that type.
    A given sector contributes an indicator, even if its program uses $A_i$ repeatedly:
    different positions in that program require different starts to fall at slot $t$,
    and these events are mutually exclusive. Its contribution has mean at most its number of $A_i$ occurrences
    divided by $F$. Different sectors have independent starts.
    Consequently $X_(i \, t)$ is a sum of independent Bernoulli variables with $bb(E) X_(i \, t) lt.eq G_i \/ F$.
  For completeness, write $rho_max = max_i rho_i$, and choose $0 < a lt.eq
    1$ so small that $\( e^a - 1 - a \) rho_max lt.eq a kappa \/ 2$.
    Such a choice follows, for example, from $e^a - 1 - a lt.eq e a^2 \/ 2$ on $\[ 0 \, 1 \]$.
    Independence, $1 + x lt.eq e^x$, and Markov’s inequality give
  $ Pr \( X_(i \, t) > k_i \) & lt.eq e^(- a k_i) bb(E) e^(a X_(i \, t))\
 & lt.eq exp #scale(x: 120%, y: 120%)[\(] - a k_i + \( e^a - 1 \) \( k_i - kappa w \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq exp \( - a kappa w \/ 2 \) . $
  There are $m T = O \( w^(b - 1) \)$ pairs $\( i \, t \)$, with fixed $m \, b$.
    The union bound therefore tends to zero. For a sufficiently large admissible $w$,
    fix one schedule for which $X_(i \, t) lt.eq k_i$ for every type and every slot.
    Independence between different slots is neither claimed nor needed.
  ===== 4.1.4 Completing the vacancies with identities. <completing-the-vacancies-with-identities.>
  For type $i$, the number of unfilled call positions is
  $ D_i = k_i T - G_i . $
  It is divisible by $H$, hence by $h_i$. Moreover, (4.9) gives
  $ D_i gt.eq k_i \( L - 1 \) + kappa w F = Omega \( w^b \) . $
  Let $d_i = D_i \/ h_i$; for sufficiently large $w$, every $d_i > k_i$.
    Allocate $d_i$ disjoint ordered groups of $q_i$ wires to run the fixed $h_i$-call identity word for $A_i$.
    All these groups, for all types together, fit in the union of the all-identity sectors.
    Indeed that region has exactly $\( \( 1 - theta \) w \)^b$ wires, whereas
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_i q_i d_i lt.eq sum_i q_i k_i T = theta w T < b theta w^b < \( 1 - theta \)^b w^b . $ <price:dummy-capacity>]
  We used $h_i gt.eq 1$ and $G_i gt.eq 0$ in the first inequality.
    A dummy group may cross the boundaries of the original identity sectors,
    since the prescribed action on their entire union is identity.
  List the $D_i$ idle positions for type $i$ in chronological order,
    with any fixed order among positions in the same slot. Assign successive positions cyclically to its $d_i$
    dummy groups. Each group receives exactly $h_i$ positions because $D_i = d_i h_i$.
    Two successive positions assigned to the same group are $d_i$ places apart in this list.
    A single time contains at most $k_i < d_i$ positions, so these two positions have strictly increasing times.
    Assign the identity word’s successive calls to these times.
    This argument permits arbitrary clustering of vacancies. We now have exactly $k_i$ calls to every type $i$ in
    every slot, on mutually disjoint tuples.
  ===== 4.1.5 The exact word, including all monomials. <the-exact-word-including-all-monomials.>
  The physical support of each active-sector program is fixed.
    Dummy groups have fixed supports disjoint from each other and from those sectors.
    Write any one of these programs chronologically as
  $ O_(p \, 0) \, med A_(p \, 1) \, med O_(p \, 1) \, dots.h \, A_(p \, l_p) \, med O_(p \, l_p) \, $
  where the $O_(p \, j)$ are monomials on that program’s support.
    Let its strictly increasing call times be $t_(p \, 1) \, dots.h \, t_(p \, l_p)$.
    Place $O_(p \, 0)$ in the gap immediately before $t_(p \, 1)$, and place $O_(p \, j)$, $j gt.eq 1$,
    in the gap immediately after $t_(p \, j)$. This is always before its next call,
    including when the times are consecutive. A program with no calls can place its single monomial in the initial
    gap. Operations in a gap on different program supports combine into one ambient monomial $M_t$,
    where gap $t$ follows slot $t$, and gap zero precedes slot one.
    A sector monomial may permute all values on its support. Subsequent calls still use the fixed tuple indices
    prescribed by that same program, so this causes no change to the program’s meaning.
  Let $B_t$ be the simultaneous calls in slot $t$. There are exactly $k_i$ ordered tuples for each $A_i$.
    Match them bijectively to the corresponding active blocks of $J$.
    Their union has $sum_i q_i k_i = theta w$ wires. Complete this matching to an injection of all $w$ coordinates
    of $J$ by using $\( 1 - theta \) w$ further distinct wires as spectators for its identity blocks.
    There are enough: the ambient width is $w^b gt.eq w$. Extend the matching to a permutation $P_t$ of all
    ambient wires. With the convention that $P_t$ gathers into the canonical first $w$ positions, one has exactly
  #[#set math.equation(numbering: n => "(4.11)")
   $ B_t = P_t^(- 1) #scale(x: 120%, y: 120%)[\(] J xor I_(w^b - w) #scale(x: 120%, y: 120%)[\)] P_t .
     $ <price:gather-scatter>]
  The conjugate acts by the requested $A_i$ on every called tuple and fixes every other physical wire pointwise.
    In particular a spectator can belong to an unfinished sector program or dummy word:
    both its value and its location are preserved by the complete gather–call–scatter operation.
    1 shows the chronological slots and the gather–call–scatter realization of each $B_t$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.35), [#text(size: 9pt)[$M_0$]])
  content((1.3, 1.35), [#box(width: 0.85cm, height: 0.55cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f0f0f0"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_1$]]])])
  content((2.6, 1.35), [#text(size: 9pt)[$M_1$]])
  content((3.9, 1.35), [#box(width: 0.85cm, height: 0.55cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f0f0f0"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_2$]]])])
  content((5.2, 1.35), [#text(size: 9pt)[$dots.h$]])
  content((6.6, 1.35), [#text(size: 9pt)[$M_(t-1)$]])
  content((8, 1.35), [#box(width: 0.85cm, height: 0.55cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f0f0f0"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_t$]]])])
  content((9.35, 1.35), [#text(size: 9pt)[$M_t$]])
  content((10.7, 1.35), [#text(size: 9pt)[$dots.h$]])
  line((0.35, 1.35), (0.82, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((1.78, 1.35), (2.24, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((2.95, 1.35), (3.42, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((4.38, 1.35), (4.88, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.12, 1.35), (7.52, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((8.48, 1.35), (8.89, 1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2.3, -0.05), [#box(width: 2cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[gather $P_t$]]])])
  content((5.5, -0.05), [#box(width: 3.6cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f0f0f0"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$J$: $k_i$ copies of each $A_i$]]])])
  content((8.85, -0.05), [#box(width: 2.2cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[scatter $P_t^(-1)$]]])])
  line((3.3, -0.05), (3.7, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((7.3, -0.05), (7.75, -0.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  line((8, 1.075), (5.5, 0.275), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((5.5, -0.9), [#text(size: 9pt)[Identity spectators may carry arbitrary data.#linebreak()Every wire outside the called tuples is fixed after scattering.]])
})],
    caption: [Figure 1: Chronological gaps preserve each local word. Each simultaneous call slot is one embedded $J$ call with its gather and scatter permutations. ],
  ) <price:packing-diagram>
  Thus the matrix product
  #[#set math.equation(numbering: n => "(4.12)")
   $ M_T B_T M_(T - 1) dots.h.c M_1 B_1 M_0 $ <price:assembled-word>]
  restricts to the prescribed program on every active sector and to identity on every dummy group and unused
    identity wire. It is exactly $J^(⊗ b)$. By (4.11) it uses precisely $T < b w^(b - 1)$ calls to $J$,
    with all remaining operations monomial, on precisely $w^b$ wires.
    Since at least one $A_i$ occurs in $J$, the matrix $J$ is nonmonomial.
    This is a finite win, contrary to the assumption. ◻
]

=== 4.2 Separation, normalization, and compactness <separation-normalization-and-compactness>

For a nonempty finite comparison family on a nonempty finite type list,
  10 says that the convex hull of its difference vectors is disjoint from the open positive orthant
  $\( 0 \, oo \)^m$. Finite-dimensional separation supplies a nonzero vector $v$ and a real number $c$ with

$ v dot.op Delta^(\( r \)) lt.eq c lt.eq v dot.op y quad upright("for all ") r upright(" and all ") y
  in \( 0 \, oo \)^m \; $

see #cite(label("boydVandenberghe2004"), form: "prose") Section 2.5.1, p. 46.
  If a coordinate of $v$ were negative, sending that coordinate of $y$ to infinity would contradict the lower
  bound by $c$. Thus $v gt.eq 0$. The infimum of $v dot.op y$ on the positive orthant is zero, so $c lt.eq 0$.
  We have obtained nonnegative prices, not all zero, satisfying every comparison in the finite family.
  For an empty family any nonzero nonnegative vector suffices.

We next prevent the normalization from escaping along different types.
  Include the fixed shear $U$ of (4.2) in every finite type list.
  For each nonmonomial $A$ of width $q$, fix the following two words once and for all.
  Gaussian elimination implements $A$ by a finite positive number $C_A$ of embedded $U$-calls and monomials.
  Indeed row permutations and nonzero row scalings are monomial,
  and every nonzero row addition is a diagonal conjugate of an ordered $U$-call.
  The comparison with one-factor target $A$ imposes

$ p \( A \) lt.eq C_A p \( U \) . $

On width $2 q$, apply 3 to $A xor I_q$. Its calls are embedded calls to $A$,
  and it generates $U ⊗ I_q$ by some fixed word with $e_A > 0$ such calls and monomials.
  The two-factor target $U ⊗ I_q$ has standard count $q$ for $U$, giving

$ q p \( U \) lt.eq e_A p \( A \) . $

Consequently these two comparisons impose the fixed bounds

#[#set math.equation(numbering: n => "(4.13)")
 $ c_A p \( U \) lt.eq p \( A \) lt.eq C_A p \( U \) \, wide c_A = q \/ e_A > 0 . $ <price:fixed-bounds>]

They introduce no new nonmonomial type other than $A$ and $U$. For $A = U$, take simply $c_U = C_U = 1$.

Augment any finite comparison family by these bounds for all its types.
  Separation gives a nonzero nonnegative solution. If its $U$-price were zero,
  every other coordinate would be zero by the upper bounds, which is impossible.
  Divide by its positive $U$-price to obtain $p \( U \) = 1$.
  Applying this argument just to the bounds for one type also proves that each fixed interval $\[ c_A \, C_A \]$
  is nonempty.

The collection of all finite complex matrices is a set, as it is contained in $union.big_(n gt.eq 1) bb(C)^(n^2)$.
  Form the product over all nonmonomial invertible matrices

$ cal(P) = product_A \[ c_A \, C_A \] . $

Each factor is a nonempty compact interval, so this product is compact in the product topology by Tychonov’s
  Theorem #cite(label("stacksProject")) Tag 08ZU, Theorem 5.14.4.
  Each comparison specifies a closed subset of $cal(P)$, since it is a linear inequality in finitely many
  coordinate projections. Any finite collection of these closed subsets has nonempty intersection:
  apply the preceding finite argument to its types, include $U$, and augment with their fixed bounds;
  all other coordinates can be assigned their lower endpoints.
  Compactness gives a point satisfying every comparison simultaneously.
  Call this preliminary function $p_0$, and set $p_0 \( A \) = 0$ on monomial matrices.
  It is strictly positive on each nonmonomial matrix, and $p_0 \( U \) = 1$.

=== 4.3 Algebraic laws and symmetry <algebraic-laws-and-symmetry>

We derive the laws from the comparisons before symmetrizing.
  A one-factor target $A B$, implemented by consecutive calls to $B$ and $A$, gives $p_0 \( A B \) lt.eq
  p_0 \( A \) + p_0 \( B \)$. This remains true if any of the matrices is monomial,
  since its call is then a monomial operation of price zero.
  Multiplication by monomials on either side cannot increase price.
  Applying the same observation with their inverses shows $p_0 \( L A R \) = p_0 \( A \)$.

The standard axis program for the one-factor target $A ⊗ B$ gives

$ p_0 \( A ⊗ B \) lt.eq \| B \| p_0 \( A \) + \| A \| p_0 \( B \) . $

For the reverse inequality, use the two-factor target $A ⊗
  B$ and the word consisting of one call to that entire matrix. Its comparison gives the opposite inequality.
  Hence the tensor law is exact, including when a factor is an identity or any other monomial.

For direct sums the one-factor target $A xor B$, implemented by disjoint calls to its two blocks,
  gives $p_0 \( A xor B \) lt.eq p_0 \( A \) + p_0 \( B \)$.
  The reverse inequality requires a separate construction. Put $a = \| A \|$, $e = \| B \|$, and

$ X = A^(⊗ a) ⊗ B^(⊗ e) \, wide Q = \| X \| . $

Consider the tensor target $X ⊗ I_2$, with its factors listed as $a$ copies of $A$, $e$ copies of $B$, and $I_2$.
  After a coordinate permutation this is two independent copies of $X$;
  this statement is an identity of matrices and does not use a direct-sum price law.
  In the first copy run all $A$-axes and then all $B$-axes.
  In the second copy run all $B$-axes and then all $A$-axes.
  There are exactly $a Q \/ a = Q$ individual $A$-calls and $e Q \/ e = Q$ individual $B$-calls in each copy.
  Pair the successive $Q$ first-stage $A$-calls of the first copy with the successive $Q$ first-stage $B$-calls of
  the second copy. Each pair acts on disjoint tuples and is one embedded $A xor B$-call,
  after gathering its coordinates. Pair the second stages in the same manner,
  reversing which copy supplies which type. Each copy retains its own required call order.
  We obtain a word with $2 Q$ calls to $A xor B$, with only permutations added.
  The comparison for the displayed tensor target therefore gives

$ 2 Q #scale(x: 120%, y: 120%)[\(] p_0 \( A \) + p_0 \( B \) #scale(x: 120%, y: 120%)[\)] lt.eq
  2 Q p_0 \( A xor B \) . $

The construction also applies when one or both factors are monomial:
  we may keep their individual block operations in the pairing,
  while their contribution to the comparison is zero. Thus direct-sum additivity is established without using it
  to produce the two copies.

Finally define

#[#set math.equation(numbering: n => "(4.14)")
 $ p \( A \) = 1 / 4 #scale(x: 120%, y: 120%)[\(] p_0 \( A \) + p_0 \( A^(- 1) \) + p_0 \( A^(sans(T)) \) +
   p_0 \( A^(- sans(T)) \) #scale(x: 120%, y: 120%)[\)] . $ <price:averaging>]

Inversion and transposition commute and each has order two, so this function has both symmetries.
  Each of the four summands retains product subadditivity: transposition or inversion may reverse the order of $A
  B$, but the scalar upper bound is still $p_0 \( A \) + p_0 \( B \)$ with the corresponding transforms.
  They retain both exact laws because inverse and transpose act componentwise on tensor products and direct sums.
  They retain monomial invariance, and are positive exactly on nonmonomials,
  because these operations preserve the class of monomial matrices.
  Also $U^(- 1)$ is conjugate to $U$ by $"diag" \( 1 \, - 1 \)$,
  and $U^(sans(T))$ is conjugate to $U$ by the two-coordinate swap.
  Thus every summand in (4.14) has value one at $U$. This proves 9.
  All subsequent arguments use this symmetric $p$ and its proved laws,
  without imposing additional comparison constraints on the average.

#thm([Corollary 4.3.])[
  (Shears, pairs, and embedded words).  #emph[Every nontrivial elementary coordinate shear has price one,
    including with any number of untouched coordinates. Every invertible $2 times 2$ matrix has price at most two.
    If a word on $w$ coordinates implements $G$, using nonmonomial calls $A_1 \, dots.h \, A_l$ and monomials, then
$ p \( G \) lt.eq sum_(j = 1)^l p \( A_j \) . $

 If the word instead implements $G xor I_s$, the same bound holds for $p \( G \)$,
   with no restriction on the initial values of the $s$ coordinates restored by the word.]
] <price:word-bounds>

#proof[
  A shear adding a nonzero multiple of one coordinate into another is a monomial conjugate of $U xor I$,
    so its price is one by (4.1), (4.1), (4.2). For an invertible pair matrix,
    first permute rows if needed to make its upper-left entry nonzero.
    With entries $alpha \, beta \, gamma \, delta$ and determinant $D eq.not 0$, it factors as
  $ mat(delim: "(", alpha, beta; gamma, delta) = mat(delim: "(", 1, 0; gamma \/ alpha, 1)
    mat(delim: "(", alpha, 0; 0, D \/ alpha) mat(delim: "(", 1, beta \/ alpha; 0, 1) . $
  This uses at most two nontrivial shears and a monomial. Finally an embedded call to $A$ is a permutation
    conjugate of $A xor I_(w - \| A \|)$, omitting the identity block when it has size zero,
    whose price is $p \( A \)$. Repeated product subadditivity gives the word bound.
    Identity padding has price zero by direct-sum additivity.
    The last assertion is an exact matrix identity on all input coordinates; it does not assume zero scratch values. ◻
]

== 5 Triangular matrices and invertible corners <corner:sec:corners>

Continue under the no-finite-win assumption and fix the symmetric price of 9.
  Our goal is contraction to an invertible submatrix.

#thm([Theorem 5.1.])[
  (Invertible corners).  #emph[If an invertible matrix $K$ has an invertible square submatrix $M$,
    then $p \( M \) lt.eq p \( K \)$.]
] <thm:corner>

Independent row and column permutations move $M$ to a corner without changing the price of $K$.
  To compare their prices, we will run the resulting block matrix along many tensor axes and for many time steps.
  The other coordinates persist as state between successive steps.
  Their initial values affect the output, so the main task is to remove that contribution at a cost small compared
  with the number of calls.

We first obtain price bounds for rectangular shears and scalar convolutions.
  We then prove that a block triangular matrix costs at least the sum of its diagonal blocks.
  These tools allow us to correct the initial state in a long cascade and isolate the repeated tensor powers of
  $M$ that prove the theorem. The one-way price bound for a scalar circuit is a consequence of the corner theorem,
  derived at the end of the section; the preliminary convolution estimate uses circuits in both directions.

=== 5.1 Rectangular shears and scalar convolution <rectangular-shears-and-scalar-convolution>

For $G in "Mat"_(a times b) \( bb(C) \)$ put

$ s \( G \) = p (mat(delim: "(", I_a, G; 0, I_b)) . $

Its action on $\( y \, x \)$ is $\( y + G x \, x \)$. Empty blocks can be omitted.

#thm([Lemma 5.2.])[
  (A rectangular shear from a linear DAG).  #emph[Suppose a permitted linear DAG with $l$ scalar gates computes $G
    x$, with $a$ designated output coordinates. Then
#[#set math.equation(numbering: n => "(5.1)")
 $ s \( G \) lt.eq 8 l + 2 a . $ <corner:eq:shear-dag>]

 If only $a_0$ rows of $G$ are nonzero, $a$ may be replaced by $a_0$.
   The constant is independent of the dimensions and all circuit scalars.]
] <lem:shear-dag>

#proof[
  A finite DAG has finite depth and finite maximum fan-out,
    counting repeated operand edges and designated output uses.
    Apply 5 to this DAG with source coordinates $x$, target coordinates $y$,
    and one additional coordinate per gate, with arbitrary initial values.
    It gives at most $8 l + 2 a$ elementary shears realizing $\( x \, y \, z \) mapsto \( x \, y + G x \, z \)$.
    Although depth and fan-out may vary with the DAG, the shear count is independent of both;
    the layer bound is not needed here. By 11 and identity padding, this proves (5.1).
    If only $a_0$ rows are nonzero, apply the same replay to the submap of those rows,
    retaining all $l$ gate coordinates, and identity-pad the omitted targets.
    This gives $8 l + 2 a_0$ instead; if $a_0 = 0$, the shear is identity. ◻
]

For an invertible $m times m$ matrix $G$, the exact identity

#[#set math.equation(numbering: n => "(5.2)")
 $ mat(delim: "(", I, G; 0, I) mat(delim: "(", I, 0; - G^(- 1), I) mat(delim: "(", I, G; 0, I) =
   mat(delim: "(", 0, G; - G^(- 1), 0) $ <corner:eq:two-way-identity>]

gives

#[#set math.equation(numbering: n => "(5.3)")
 $ 2 p \( G \) lt.eq 2 s \( G \) + s \( G^(- 1) \) . $ <corner:eq:two-way-bound>]

Indeed the right side of (5.2) is monomial-equivalent to $G xor G^(- 1)$,
  while exchanging the two coordinate groups and changing signs identifies the middle shear’s price with
  $s \( G^(- 1) \)$. Consequently circuits for both $G$ and $G^(- 1)$, of sizes $l$ and $l'$, give $p \( G \) =
  O \( l + l' + m \)$ with a universal constant.

For a scalar or matrix formal power series $F \( z \)$, let $cal(T)_t \( F \)$ be multiplication by $F \( z \)$
  modulo $z^t$, in the coefficient basis ordered with time first.
  Thus, if $F \( z \) = sum_(j gt.eq 0) F_j z^j$, its $\( a \, b \)$ block is $F_(a - b)$ for $0 lt.eq b lt.eq
  a < t$, and is zero otherwise. Coefficients with negative indices mean zero. Series multiplication gives

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(T)_t \( F G \) = cal(T)_t \( F \) cal(T)_t \( G \) . $ <corner:eq:truncation-product>]

In particular, invertibility of $F_0$ implies invertibility of $cal(T)_t \( F \)$,
  with inverse $cal(T)_t \( F^(- 1) \)$.

#thm([Lemma 5.3.])[
  (Scalar convolution).  #emph[For every scalar formal series $f$ with $f \( 0 \) eq.not 0$ and every $t gt.eq 1$,
$ p \( cal(T)_t \( f \) \) = O \( t log \( 2 t \) \) \, $

 with an absolute implied constant, independent of the coefficients of $f$ and of their possible dependence on $t$.]
] <lem:scalar-convolution>

#proof[
  Only the first $t$ coefficients of $f$ affect the matrix.
    Pad these coefficients and the input coefficient vector to a power-of-two length $m$ with $2 t lt.eq m < 4 t$.
    A length-$m$ Fourier transform, multiplication by the prechosen Fourier transform of the fixed kernel,
    and an inverse Fourier transform compute their ordinary convolution, since its degree is at most $2 t -
    2 < m$. Selecting the first $t$ coefficients gives $cal(T)_t \( f \)$.
    The binary Fourier recursion splits even and odd indices and combines each pair by one scalar multiplication
    and two additions or subtractions, so it and its inverse use $O \( m log \( 2 m \) \)$ permitted scalar gates.
    The frequency scalings and inverse normalization cost $O \( m \)$ gates,
    even when some kernel frequencies are zero. This is a DAG construction and does not require those intermediate
    scalings to be invertible.
  Exactly the same construction applies to the first $t$ coefficients of $1 \/ f$,
    which exist because $f \( 0 \) eq.not 0$. Apply Lemma 5.2, (5.3) to these two DAGs.
    Every kernel coefficient and Fourier constant is prechosen; there is no charge for generating its description,
    but its multiplication on variable data has been included in the count. ◻
]

=== 5.2 Triangular monotonicity by whole-block compression <triangular-monotonicity-by-whole-block-compression>

#thm([Lemma 5.4.])[
  (Triangular monotonicity).  #emph[If $M in "GL"_n \( bb(C) \)$,
    $D in "GL"_r \( bb(C) \)$ and $C in "Mat"_(n times r) \( bb(C) \)$, then
#[#set math.equation(numbering: n => "(5.5)")
 $ p (mat(delim: "(", M, C; 0, D)) gt.eq p \( M \) + p \( D \) . $ <corner:eq:triangular>]

 The same conclusion holds for the lower triangular orientation,
   and the price of any invertible block triangular matrix is at least the sum of the prices of its invertible
   diagonal blocks.]
] <lem:triangular>

#proof[
  Write $K = mat(delim: "(", M, C; 0, D)$ and fix $k gt.eq 1$.
    The usual computation of $Y = D^(⊗ k)$ on $R = r^k$ bottom coordinates applies $D$ along axes $1 \, dots.h \,
    k$, using $u = k r^(k - 1)$ calls. Replace each call by a $K$ call,
    supplying a fresh group of $n$ data coordinates for its $M$ side.
    Since these groups are used only once and do not affect the bottom coordinates, the resulting matrix is
  $ mat(delim: "(", I_u ⊗ M, E; 0, Y) \, wide p (mat(delim: "(", I_u ⊗ M, E; 0, Y)) lt.eq u p \( K \) . $
  We will compress the $u$ whole $n times R$ row blocks of $E Y^(- 1)$.
    No independent change of its individual scalar rows is used.
  Label a call by its axis $j$ and fiber indices $upright(bold(i)) = \( i_ell \)_(ell eq.not j)$.
    For $1 lt.eq a lt.eq n$ and a bottom multi-index $bold(ell) = \( ell_1 \, dots.h \, ell_k \)$,
    its row block $R_(j \, upright(bold(i)))$ in $E Y^(- 1)$ has entries
  #[#set math.equation(numbering: n => "(5.6)")
   $ \( R_(j \, upright(bold(i))) \)_(a \, bold(ell)) = \( C D^(- 1) \)_(a \, ell_j) product_(h < j)
     delta_(i_h \, ell_h) product_(h > j) \( D^(- 1) \)_(i_h \, ell_h) . $ <corner:eq:actual-row-block>]
  To see this, the call’s contamination uses $C$ at axis $j$,
    with $D$ already applied on axes $h < j$ and identity on axes $h > j$.
    Multiplication by $Y^(- 1)$ cancels the earlier $D$ factors, leaves $C D^(- 1)$ locally,
    and introduces $D^(- 1)$ on the later axes.
  For fixed $j$, insertion of the fixed matrix $C D^(- 1)$ in the $j$th slot defines a linear map from the
    complementary tensor covector space to $"Mat"_(n times R) \( bb(C) \)$.
    The complementary covectors in (5.6) form a basis, because every $D^(- 1)$ is invertible.
    Coordinate covectors form another basis. The images of either basis therefore span the same image space,
    whether or not this linear map is injective. Images of coordinate covectors have at most $n
    r$ nonzero entries. Taking their union over $j$ gives a sparse spanning family for the span $S$ of all actual
    row blocks. Select a basis $B_1 \, dots.h \, B_h$ from this family; then
  $ h lt.eq min \( u \, n R \) \, wide "nnz" \( B_i \) lt.eq n r . $
  Overlaps between axis spans and dependencies among rows of $C$ can only decrease $h$.
  The map $Phi : bb(C)^u arrow.r S$ sending coefficients to their linear combination of the actual row blocks is
    surjective. Choose one lift of each $B_i$ under $Phi$, and append a basis of $ker Phi$.
    These $u$ vectors form a basis of $bb(C)^u$: applying $Phi$ to a relation first kills the coefficients of the
    $B_i$, and then independence in the kernel kills the others.
    Put these vectors as the rows of $V in "GL"_u \( bb(C) \)$. Postapply $V ⊗ I_n$ to the data groups.
    The data block becomes exactly
  $ \( V ⊗ I_n \) \( I_u ⊗ M \) = V ⊗ M \, $
  while its contamination expressed in the final bottom variables is the stack $B_1 \, dots.h \, B_h \, 0 \,
    dots.h \, 0$. Cancel it by at most $h n r$ elementary shears from those bottom variables into the data groups.
    The final map is exactly $\( V ⊗ M \) xor Y$.
  The previously proved price laws now give
  $ n p \( V \) + u p \( M \) + u p \( D \) lt.eq u p \( K \) + n p \( V \) + h n r . $
  The identical $n p \( V \)$ terms cancel, without any estimate on $V$.
    Since $h lt.eq n r^k$, division by $u = k r^(k - 1)$ yields
  $ p \( M \) + p \( D \) lt.eq p \( K \) + frac(n^2 r^2, k) . $
  Let $k$ tend to infinity with $K \, n \, r$ fixed. This proves (5.5).
    If $r = 1$, the same construction has $R = 1$, $u = k$ and error at most $n^2 \/ k$.
    If $S = 0$, there are no $B_i$ and a kernel basis alone supplies $V$; no cancellation shears are needed.
    Empty diagonal blocks simply reduce to the other block. Exchanging the two groups proves the lower triangular
    case, and induction on the number of blocks proves the last assertion. ◻
]

=== 5.3 A time cascade and its initial-state correction <a-time-cascade-and-its-initial-state-correction>

Fix an invertible cell

#[#set math.equation(numbering: n => "(5.7)")
 $ K = mat(delim: "(", M, C; B, D) \, wide M in "GL"_n \( bb(C) \) \, quad D in "Mat"_(r times r) \( bb(C) \) \,
   wide H \( z \) = M + z C \( I_r - z D \)^(- 1) B . $ <corner:eq:cell>]

No invertibility of $D$ is required. The transfer matrix $H$ is regular at zero and $H \( 0 \) = M$.
  For one fiber, with incoming state $w_tau$, input $x_tau$ and output $y_tau$, the cell equations are

$ y_tau = M x_tau + C w_tau \, wide w_(tau + 1) = B x_tau + D w_tau . $

Writing series in time and retaining coefficients below $t$ gives

$ w \( z \) = w_0 + z B x \( z \) + z D w \( z \) \, wide y \( z \) = H \( z \) x \( z \) +
  C \( I_r - z D \)^(- 1) w_0 med \( mod med z^t \) . $

These are identities between finite coefficient maps, rather than operations that a circuit is asked to perform
  implicitly.

For $k gt.eq 1$ put $N = n^k$. At each tick, apply the cell along each of the $k$ spatial tensor axes in order,
  using $n^(k - 1)$ disjoint fibers per axis. Axis $j$ has its own persistent state space

$ W_j = \( bb(C)^n \)^(⊗ \( j - 1 \)) ⊗ bb(C)^r ⊗ \( bb(C)^n \)^(⊗ \( k - j \)) . $

States of different axes are distinct, and each $W_j$ is carried from one tick to the next.
  The $t$ data blocks are fresh inputs, one per tick. The entire computation is a word in invertible $K$ calls on
  $t N + k r n^(k - 1)$ coordinates; denote its matrix by $cal(K)_(k \, t)$.
  2 shows two successive ticks and the distinct state spaces carried by the axes from one tick to the next.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_1$]]])])
  content((2.43, 0), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_2$]]])])
  content((3.87, 0), [#text(size: 9pt)[$dots.h$]])
  content((5.4, 0), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_k$]]])])
  content((0, -1.89), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_1$]]])])
  content((2.43, -1.89), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_2$]]])])
  content((3.87, -1.89), [#text(size: 9pt)[$dots.h$]])
  content((5.4, -1.89), [#box(width: 1.15cm, height: 0.65cm, inset: 0.3333em, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$K_k$]]])])
  line((-1.8, 0), (-0.575, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.9, 0), [#text(size: 9pt)[$x_ tau$]], anchor: "east", padding: 0.1176cm)
  line((0.575, 0), (1.855, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.005, 0), (3.666, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.074, 0), (4.825, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.975, 0), (7.2, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.2, 0), [#text(size: 9pt)[$y_ tau$]], anchor: "west", padding: 0.1176cm)
  line((-1.8, -1.89), (-0.575, -1.89), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.9, -1.89), [#text(size: 9pt)[$x_( tau +1)$]], anchor: "east", padding: 0.1176cm)
  line((0.575, -1.89), (1.855, -1.89), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.005, -1.89), (3.666, -1.89), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.074, -1.89), (4.825, -1.89), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.975, -1.89), (7.2, -1.89), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.2, -1.89), [#text(size: 9pt)[$y_( tau +1)$]], anchor: "west", padding: 0.1176cm)
  line((0, 1.035), (0, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.68), [#text(size: 9pt)[$w_(1, tau )$]], anchor: "south", padding: 0.1176cm)
  line((2.43, 1.035), (2.43, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.43, 0.68), [#text(size: 9pt)[$w_(2, tau )$]], anchor: "south", padding: 0.1176cm)
  line((5.4, 1.035), (5.4, 0.325), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.4, 0.68), [#text(size: 9pt)[$w_(k, tau )$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.325), (0, -1.565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, -0.945), [#text(size: 9pt)[$w_(1, tau +1)$]], anchor: "west", padding: 0.1176cm)
  line((2.43, -0.325), (2.43, -1.565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.43, -0.945), [#text(size: 9pt)[$w_(2, tau +1)$]], anchor: "west", padding: 0.1176cm)
  line((5.4, -0.325), (5.4, -1.565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.4, -0.945), [#text(size: 9pt)[$w_(k, tau +1)$]], anchor: "west", padding: 0.1176cm)
  line((0, -2.215), (0, -2.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((2.43, -2.215), (2.43, -2.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.4, -2.215), (5.4, -2.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 2: Two ticks of the cascade. Each $K_j$ represents $n^(k - 1)$ disjoint calls along axis $j$. Horizontal arrows carry $N$ data coordinates; the separate vertical arrows carry each axis’s $r n^(k - 1)$ persistent state coordinates. ],
) <corner:fig:cascade>

With data coordinates listed before all state coordinates, the top-left block of $cal(K)_(k \, t)$ is

$ A_(k \, t) = cal(T)_t \( H_k \) \, wide H_k \( z \) = H \( z \)^(⊗ k) . $

Indeed the direct series response composes the lifts of $H$ on all axes.
  The top-right block $E_t$ consists of the first $t$ coefficients of
  $E \( z \) = \[ E_1 \( z \) med dots.h.c med E_k \( z \) \]$, where

#[#set math.equation(numbering: n => "(5.8)")
 $ E_j \( z \) = I_n^(⊗ \( j - 1 \)) ⊗ #scale(x: 120%, y: 120%)[\(] C \( I_r - z D \)^(- 1)
   #scale(x: 120%, y: 120%)[\)] ⊗ H \( z \)^(⊗ \( k - j \)) . $ <corner:eq:state-response>]

An initial state at axis $j$ passes through that axis’s state-to-data map and then through the later axes;
  the earlier axes do not act on this contribution. This proves (5.8) as well as the direct response,
  including the order of all factors.

#thm([Lemma 5.5.])[
  (Uniform cascade estimate).  #emph[For each fixed cell $K$ as in (5.7), there is a constant $C_K$ such that,
    for every $k \, t gt.eq 1$ and $N = n^k$,
#[#set math.equation(numbering: n => "(5.9)")
 $ p #scale(x: 120%, y: 120%)[\(] cal(T)_t \( H^(⊗ k) \) #scale(x: 120%, y: 120%)[\)] lt.eq
   t k n^(k - 1) p \( K \) + C_K #scale(x: 120%, y: 120%)[\(] N t log \( 2 t \) + \( k + 1 \)^3 N
   #scale(x: 120%, y: 120%)[\)] . $ <corner:eq:cascade-bound>]

 The constant is independent of $t$, $k$, and any scalars used for coefficient interpolation.]
] <corner:lem:cascade>

#proof[
  If $r = 0$, the state is absent and $H = M = K$ is constant.
    The exact tensor and direct-sum laws already give the assertion.
    Suppose $r gt.eq 1$ and introduce polynomial matrices and scalar polynomials
  $ a \( z \) = det \( I_r - z D \) \, wide R \( z \) = "adj" \( I_r - z D \) \,\
F \( z \) = a \( z \) M + z C R \( z \) B \, wide b \( z \) = det F \( z \) \, wide J \( z \) = "adj" F \( z \) . $
  Then $H = F \/ a$, $H^(- 1) = a J \/ b$, $a \( 0 \) = 1$, and $b \( 0 \) = det M eq.not 0$. We have
  $ deg a lt.eq r \, quad deg R lt.eq r - 1 \, quad deg F lt.eq r \, quad deg b lt.eq n r \, quad
    deg J lt.eq \( n - 1 \) r . $
  For $n = 1$ the adjugate $J$ is the constant $1$, as required by these formulas.
    Cancelling the later-axis responses in (5.8) gives
  $ H_k^(- 1) E_j = \( H^(- 1) \)^(⊗ \( j - 1 \)) ⊗ \( J C R \/ b \) ⊗ I_n^(⊗ \( k - j \)) . $
  Thus $q_k = b^k$ clears the entire matrix $H_k^(- 1) E$. Its $j$th cleared block is the following explicit
    polynomial map $W_j arrow.r bb(C)^N$:
  #[#set math.equation(numbering: n => "(5.10)")
   $ Q_(k \, j) \( z \) = a \( z \)^(j - 1) b \( z \)^(k - j) #scale(x: 180%, y: 180%)[\(]
     J \( z \)^(⊗ \( j - 1 \)) ⊗ #scale(x: 120%, y: 120%)[\(] J \( z \) C R \( z \) #scale(x: 120%, y: 120%)[\)] ⊗
     I_n^(⊗ \( k - j \)) #scale(x: 180%, y: 180%)[\)] . $ <corner:eq:cleared-state>]
  Its degree is at most
  $ \( j - 1 \) r + \( k - j \) n r + \( j - 1 \) \( n - 1 \) r + \( n r - 1 \) = k n r - 1 . $
  The scalar $q_k$ has degree at most $k n r$ and has nonzero constant term.
    The identities also hold when any of the displayed matrix polynomials vanish.
  Here is an explicit DAG bound for the nonzero time coordinates of $Q_k \( z \) w =
    sum_(j = 1)^k Q_(k \, j) \( z \) w_j$. Put $m = k n r$, and choose $m$ distinct complex evaluation points.
    Because (5.10) is polynomial, no avoidance of poles is needed.
    At one evaluation point, a rectangular application of $J C R$ on its $r$-axis costs at most $2 r
    N$ scalar gates. Applying $J$ on the preceding $j - 1$ axes costs at most $2 n \( j - 1 \) N$ gates,
    by doing the fixed $n times n$ map on all fibers of each axis. The scalar factor costs at most $N$ gates.
    Adding the $k$ contributions costs at most $\( k - 1 \) N$ more. One evaluation therefore uses at most
  $ #scale(x: 120%, y: 120%)[\(] n k \( k - 1 \) + 2 \( r + 1 \) k - 1 #scale(x: 120%, y: 120%)[\)] N =
    O_K \( k^2 N \) $
  gates. All local entries and scalar powers here are prechosen constants.
    Applying the inverse scalar Vandermonde matrix to the $m$ evaluations,
    separately on each of the $N$ coordinates, recovers all $m$ coefficient vectors using at most $2 m^2
    N$ further scalar gates. The total is $O_K \( \( k + 1 \)^3 N \)$.
    For any run length $t$, keep only the first $min \( t \, m \)$ coefficient vectors;
    all other rows of the truncated response are zero. This bound is consequently uniform in $t$.
  Set $P = cal(T)_t \( 1 \/ q_k \)$ and $A' = A_(k \, t) \( P ⊗ I_N \)$.
    In formal series modulo $z^t$, $A' ""^(- 1) E_t$ is precisely the coefficient map of $q_k H_k^(- 1) E =
    Q_k$ just constructed. Hence 13, with zero output rows omitted, bounds the price of the shear with block $-
    A' ""^(- 1) E_t$ by $O_K \( \( k + 1 \)^3 N \)$. This uses only the rectangular shear law,
    not a price bound for an arbitrary invertible circuit output.
  Now form the exact product
  #[#set math.equation(numbering: n => "(5.11)")
   $ cal(K)_(k \, t) mat(delim: "(", P ⊗ I_N, 0; 0, I) mat(delim: "(", I, - A' ""^(- 1) E_t; 0, I) .
     $ <corner:eq:state-elimination>]
  Its top row of blocks is $\( A' \, 0 \)$. Each factor is invertible, and $A'$ is invertible because $H \( 0 \) =
    M$ and $q_k \( 0 \) eq.not 0$. Therefore the other diagonal block of this lower triangular product is also
    invertible. By 15 its price is at least $p \( A' \)$. There are $t k n^(k - 1)$ cell calls in $cal(K)_(k \, t)$, so
  $ p \( A' \) lt.eq t k n^(k - 1) p \( K \) + N p \( P \) + O_K \( \( k + 1 \)^3 N \) . $
  Here the tensor and direct-sum laws price the scalar preprocessing by $N p \( P \)$,
    including its identity on the state. Finally $A_(k \, t) = A' \( P^(- 1) ⊗ I_N \)$ and inverse symmetry give
  $ p \( A_(k \, t) \) lt.eq t k n^(k - 1) p \( K \) + 2 N p \( P \) + O_K \( \( k + 1 \)^3 N \) . $
  Apply 14 to $P$. Its bound is uniform even though $q_k$ varies with $k$, proving (5.9). ◻
]

=== 5.4 Proof of the corner law and its circuit consequence <proof-of-the-corner-law-and-its-circuit-consequence>

#proof[
  Independent row and column permutations move $M$ to the top-left corner and preserve $p \( K \)$.
    Write the resulting matrix as in (5.7). If the complementary width is zero the claim is equality;
    otherwise apply 16. The matrix $A_(k \, t) = cal(T)_t \( H^(⊗ k) \)$ is lower triangular in time with $t$
    identical diagonal blocks $M^(⊗ k)$. Thus 15 and the tensor law imply
  $ p \( A_(k \, t) \) gt.eq t p \( M^(⊗ k) \) = t k n^(k - 1) p \( M \) . $
  Fix $K \, n \, r$ first and use the bound of (5.9). For example, choose $t = t \( k \) =
    2^(ceil.l 8 log_2 \( k + 1 \) ceil.r)$, so $\( k + 1 \)^8 lt.eq t < 2 \( k + 1 \)^8$.
    Division by $t k n^(k - 1) = t k N \/ n$ gives
  $ p \( M \) lt.eq p \( K \) + C_K n (frac(log \( 2 t \), k) + frac(\( k + 1 \)^3, t k)) . $
  Both errors tend to zero. The matrices $M$ and $K$ in this real inequality are fixed,
    so it proves the exact inequality $p \( M \) lt.eq p \( K \)$.
    No continuity assertion about the price, or limiting circuit for a matrix, has been used.
    A zero-size submatrix, if allowed, can simply be omitted and assigned price zero. ◻
]

#thm([Corollary 5.6.])[
  (A universal one-way DAG price bound).  #emph[If $G in "GL"_m \( bb(C) \)$ has a permitted linear DAG with $l$
    scalar gates, then
$ p \( G \) lt.eq s \( G \) lt.eq 8 l + 2 m . $

 The bound holds with the same constants for all dimensions and all matrix families,
   without requiring a DAG for $G^(- 1)$.]
] <cor:dag-price>

#proof[
  $G$ is an invertible square submatrix of $mat(delim: "(", I_m, G; 0, I_m)$, so 12 gives its first inequality,
    and 13 gives the second. Although the proof of the corner law fixed each individual matrix while taking a
    limit, the resulting inequality is exact for every finite matrix.
    The numerical constants here come entirely from the dirty scratch simulation. ◻
]

== 6 Changing the coefficient boundary and specializing prices <feedback:sec>

The corner law compares the price of an invertible matrix with that of an invertible submatrix.
  We now consider a different operation on the cell from the preceding section. Write

$ K = mat(delim: "(", M, C; B, D) in "GL"_(n + r) \( bb(C) \) \, wide K \( x \, w \) = \( y \, w' \) \, wide
  M in "GL"_n \( bb(C) \) . $

Closing its state connection at a scalar $s$ means imposing $w = s w'$.
  When $I_r - s D$ is invertible, the state equation gives

$ w = s \( I_r - s D \)^(- 1) B x \, wide y = H \( s \) x \, wide H \( z \) = M + z C \( I_r - z D \)^(- 1) B . $

Our first objective is to prove $p \( H \( s \) \) lt.eq p \( K \)$ whenever $H \( s \)$ is invertible.
  We will then prove that a uniform price bound for a rational matrix at generic scalar values remains valid at
  every regular invertible value. Closing the connection serves only to define the finite matrix $H \( s \)$;
  every price inequality concerns ordinary invertible matrices.

Both arguments use a common comparison between coefficient boundary conditions.
  The data-to-data block of the preceding cascade is multiplication by a matrix series modulo $z^t$.
  We compare this with multiplication modulo a different scalar polynomial of degree $t$.
  For a $k$th tensor power, a scalar change of coordinates confines the discrepancy to $O \( k \)$ time indices.
  We must also control the large spatial matrix on those indices:
  an explicit common family of inexpensive generators supplies this second bound.
  The resulting estimate is uniform over the scalar modulus,
  which can therefore be chosen separately at each tensor order.

We retain the time coefficient convention for $cal(T)_t$:
  for a matrix series $F \( z \)$ regular at zero, $cal(T)_t \( F \)$ sends the coefficients of $x \( z \)$,
  of degree less than $t$, to those of $F \( z \) x \( z \)$ modulo $z^t$, with the time index outermost.
  All prices in this section satisfy the laws of 9.

=== 6.1 A uniform comparison for scalar moduli <a-uniform-comparison-for-scalar-moduli>

#thm([Lemma 6.1.])[
  (Coefficient-boundary comparison).  #emph[Fix $G \( z \) in
    "Mat"_n \( bb(C) \[ z \] \)$ with $G \( 0 \)$ invertible.
    There is a constant $C_G$ with the following property. Let $k gt.eq 1$, put $N = n^k$ and $d = k deg G$,
    and let $t > d$ be an integer. Suppose $ell \( z \)$ is monic of degree $t$, $ell \( 0 \) eq.not 0$,
    and multiplication by $G \( z \)^(⊗ k)$ on $\( bb(C) \[ z \] \/ \( ell \) \)^N$ is invertible.
    Denote its matrix in the coefficient basis by $W$, and put
$ A_G = cal(T)_t \( G \( z \)^(⊗ k) \) . $

 Then
#[#set math.equation(numbering: n => "(6.1)")
 $ \| p \( W \) - p \( A_G \) #scale(x: 120%, y: 120%)[\|] lt.eq
   C_G N #scale(x: 120%, y: 120%)[\(] t log \( 2 t \) + \( k + 1 \)^6 #scale(x: 120%, y: 120%)[\)] .
   $ <feedback:eq:boundary-error>]

 The constant is independent of $k \, t \, ell$ and of the magnitudes of the coefficients of $ell$. In particular, for
#[#set math.equation(numbering: n => "(6.2)")
 $ t = t \( k \) = 2^(ceil.l 8 log_2 \( k + 1 \) ceil.r) \, wide \( k + 1 \)^8 lt.eq t < 2 \( k + 1 \)^8 \,
   $ <feedback:eq:common-length>]

 the difference is $o \( t k N \)$, uniformly over every admissible modulus of that degree.]
] <lem:boundary-comparison>

#proof[
  Choose once and for all polynomial $J \( z \)$ and scalar polynomial $u \( z \)$ such that
  $ G \( z \)^(- 1) = J \( z \) \/ u \( z \) \, wide u \( 0 \) eq.not 0 \; $
  for example, take $J = "adj" G$ and $u = det G$. Write
  $ G_k \( z \) = G \( z \)^(⊗ k) = sum_(j = 0)^d G_j z^j \, wide J_k \( z \) = J \( z \)^(⊗ k) =
    sum_(i = 0)^e J_i z^i \, wide e = k deg J . $
  These are degree bounds with zero coefficient matrices permitted.
    The subscript on $G_j$ or $J_i$ in this proof denotes a coefficient of the tensor power,
    rather than of the original fixed matrix. Both $d$ and $e$ are bounded by a fixed multiple of $k$.
    If $d = 0$, multiplication is coefficientwise, so $W = A_G$ and the result holds.
    Assume $d > 0$ and set $T = t - d$.
  Let $L = W - A_G$. An input supported at times less than $T$ has product with $G_k$ of degree less than $t$,
    so $L$ has zero columns at those times. Scalar polynomial division also shows that,
    for every input $x \( z \)$ of degree less than $t$,
  #[#set math.equation(numbering: n => "(6.3)")
   $ L x = ell \( z \) v_x \( z \) med \( mod med z^t \) \, wide deg v_x < d . $ <feedback:eq:boundary-quotient>]
  Here $v_x$ is minus the quotient of $G_k x$ by $ell$, with scalar division applied to every coordinate.
    The degree bound follows from $deg \( G_k x \) < t + d$.
  The invertible relative map and the scalar prefix map are
  $ R = A_G^(- 1) W = I + S \, wide S = A_G^(- 1) L \, wide P = cal(T)_T \( u^k \/ ell \) xor I_d . $
  The series in $P$ is regular and nonzero at zero. Since $S$ has zero prefix columns and $P^(- 1)$ is identity on
    the suffix of length $d$,
  #[#set math.equation(numbering: n => "(6.4)")
   $ S \( P^(- 1) ⊗ I_N \) = S \, wide hat(R) = \( P ⊗ I_N \) R \( P^(- 1) ⊗ I_N \) =
     I + \( P ⊗ I_N \) S . $ <feedback:eq:prefix-conjugation>]
  This identity uses the entire prefix–suffix decomposition;
    a general scalar change of basis on all $t$ times would not have this property.
  On the prefix, the output of the correction in (6.4) is, modulo $z^T$,
  $ u^k / ell J_k / u^k ell v_x = J_k v_x . $
  It therefore vanishes at prefix times greater than or equal to $e + d$. Define the disjoint sets
  $ cal(E) = { 0 \, dots.h \, min \( T \, e + d \) - 1 } \, quad cal(B) = { T \, dots.h \, t - 1 } \, quad
    cal(U) = cal(E) union cal(B) . $
  The correction has columns only in $cal(B)$ and rows only in $cal(U)$, where $\| cal(U) \| lt.eq e + 2 d =
    O \( k \)$. Thus both blocks coupling $cal(U)$ to its complement are zero in the correction.
    A simultaneous permutation of rows and columns gives
  #[#set math.equation(numbering: n => "(6.5)")
   $ hat(R) tilde.eq R_(cal(U)) xor I_(\( t - \| cal(U) \| \) N) \, wide
     R_(cal(U)) in "GL"_(\| cal(U) \| N) \( bb(C) \) . $ <feedback:eq:active-summand>]
  Invertibility of the active block follows from invertibility of $hat(R)$.
    If the coarse early and suffix ranges would overlap, the minimum in $cal(E)$ truncates the former:
    the middle set is then empty and $t lt.eq e + 2 d$. The bound and the direct-sum conclusion still hold.
    3 displays the support of the correction $hat(R) - I$ when the middle set is nonempty.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((4, 2), (6, 3), fill: rgb("#e3e3e3"), stroke: none)
  rect((4, 0), (6, 1), fill: rgb("#e3e3e3"), stroke: none)
  rect((0, 0), (6, 3), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2, 0), (2, 3), (4, 0), (4, 3), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0, 1), (6, 1), (0, 2), (6, 2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1, 3.4), [early $cal(E)$])
  content((3, 3.4), [middle])
  content((5, 3.4), [tail $cal(B)$])
  content((-0.2, 2.5), [early $cal(E)$], anchor: "east", padding: 0.1176cm)
  content((-0.2, 1.5), [middle], anchor: "east", padding: 0.1176cm)
  content((-0.2, 0.5), [tail $cal(B)$], anchor: "east", padding: 0.1176cm)
  content((1, 0.5), [$0$])
  content((1, 1.5), [$0$])
  content((1, 2.5), [$0$])
  content((3, 0.5), [$0$])
  content((3, 1.5), [$0$])
  content((3, 2.5), [$0$])
  content((5, 1.5), [$0$])
  content((5, 2.5), [$*$])
  content((5, 0.5), [$*$])
  content((3, -0.5), [support of $hat(R) -I$])
})],
    caption: [Figure 3: After prefix conjugation, only the shaded blocks can be nonzero in the correction. Restoring the identity leaves the middle coordinates as an identity direct summand. The picture shows the case with a nonempty middle; the definition of $cal(E)$ also covers an empty middle. ],
  ) <feedback:fig:boundary-support>
  The small number of active times alone would not bound the cost of their $N times N$ spatial blocks.
    We next give an indexed formula that controls those blocks uniformly.
    For each integer $m gt.eq 0$ that occurs below, divide the scalar monomial $z^m$ by $ell$ and write
  $ z^m = ell \( z \) q_m \( z \) + r_m \( z \) \, wide deg r_m < t \, wide q_(s \, m) = \[ z^s \] q_m \( z \) . $
  For $m = b + j$ with $0 lt.eq b < t$ and $0 lt.eq j lt.eq d$, we have $deg q_m < d$.
    Set $q_(s \, m) = 0$ when $s < 0$ or $s gt.eq d$; also $q_m = 0$ when $m < t$. Let
  $ eta_h = \[ z^h \] \( ell \/ u^k \) \, wide eta_h = 0 quad \( h < 0 \) . $
  All these scalars may depend on $k \, t \, ell$. For $0 lt.eq a \, b < t$, define
  #[#set math.equation(numbering: n => "(6.6)")
   $ gamma_(a b i j) =
     cases(delim: "{", - q_(a - i \, b + j) \, & a < T \,, - sum_(s = 0)^(d - 1) eta_(a - i - s) q_(s \, b +
     j) \, & a gt.eq T .) $ <feedback:eq:ordered-coefficients>]
  Then the exact block formula is
  #[#set math.equation(numbering: n => "(6.7)")
   $ hat(R)_(a b) = delta_(a b) I_N + sum_(i = 0)^e sum_(j = 0)^d gamma_(a b i j) J_i G_j .
     $ <feedback:eq:ordered-span>]
  Indeed, on an input $z^b x_b$, scalar division gives $v_x = - sum_j q_(b + j) G_j x_b$ in (6.3).
    The prefix correction is $J_k v_x$, which gives the first case of (6.6).
    The suffix is unchanged by the left prefix map, so its correction is $\( ell \/ u^k \) J_k v_x$ modulo $z^t$,
    which gives the second case. Right conjugation has already disappeared by (6.4).
    Every spatial product is ordered as $J_i G_j$: no commutation of coefficient matrices is used.
    Reduction and scalar convolution introduce only the displayed scalar weights,
    irrespective of the length of the underlying coefficient lists.
  Here is a gate count for applying the active block. Applying a fixed $n times
    n$ matrix on each of the $N \/ n$ fibers of one tensor axis uses at most $2 n N$ scalar gates,
    by direct multiplication and addition. Consequently $G \( xi \)^(⊗ k)$ applies in at most $2 n k
    N$ gates for any $xi in bb(C)$, including points where $G \( xi \)$ is singular.
    At $d + 1$ distinct points, interpolation expresses any chosen coefficient $G_j$ as a scalar linear
    combination of these evaluation matrices. Running the $d +
    1$ evaluation circuits on the same input and combining their outputs uses at most
  $ 2 n k N \( d + 1 \) + 2 \( d + 1 \) N = O_G \( \( k + 1 \)^2 N \) $
  gates. The same argument with $e + 1$ points applies to $J_i$,
    so the ordered product $J_i G_j$ has a circuit of this order by composition.
    No inverse of an evaluation matrix is needed; only the scalar Vandermonde interpolation matrix is inverted in
    choosing constants.
  There are $O_G \( \( k + 1 \)^2 \)$ active ordered pairs of time indices and $\( e + 1 \) \( d + 1 \) =
    O_G \( \( k + 1 \)^2 \)$ spatial generators in (6.7). For each active block entry,
    apply each required generator to its input vector, multiply its output by $gamma_(a b i j)$,
    and add the resulting vectors. The generator applications cost $O_G \( \( k + 1 \)^6 N \)$ gates in total.
    The scalar weights and output additions cost only $O_G \( \( k + 1 \)^4 N \)$ additional gates,
    and the identity contribution uses the already available input values.
    The output count is $\| cal(U) \| N = O_G \( \( k + 1 \) N \)$.
    Thus the universal one-way DAG bound, 17, and (6.5) give
  #[#set math.equation(numbering: n => "(6.8)")
   $ p \( hat(R) \) = p \( R_(cal(U)) \) lt.eq C_G \( k + 1 \)^6 N . $ <feedback:eq:active-cost>]
  The potentially complicated coefficients in (6.6) are prechosen circuit scalars.
    Every use of such a scalar has been charged; the model does not charge for producing its description.
    This is precisely why the gate bound is independent of $t$ and $ell$.
  By 14, direct-sum additivity and the tensor law,
  $ p \( P \) = O \( T log \( 2 T \) \) = O \( t log \( 2 t \) \) \, wide p \( P ⊗ I_N \) = N p \( P \) . $
  Undoing the conjugation and using inverse symmetry gives
  $ p \( R \) = p \( R^(- 1) \) lt.eq 2 N p \( P \) + C_G \( k + 1 \)^6 N . $
  Finally $W = A_G R$ and $A_G = W R^(- 1)$ imply $\| p \( W \) - p \( A_G \) \| lt.eq p \( R \)$, proving (6.1).
    Dividing that bound by $t k N$ gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ frac(\| p \( W \) - p \( A_G \) \|, t k N) lt.eq C_G (frac(log \( 2 t \), k) + frac(\( k + 1 \)^6, t k)) .
     $ <feedback:eq:normalized-error>]
  For the choice of $t$ in (6.2), both terms tend to zero. Also $t > d$ eventually,
    since $G$ was fixed before $k$ grows. Every estimate holds uniformly for all admissible $ell$ at that $k \, t$. ◻
]

=== 6.2 Closing a state connection <closing-a-state-connection>

#thm([Theorem 6.2.])[
  (Feedback law).  #emph[Let
$ K = mat(delim: "(", M, C; B, D) in "GL"_(n + r) \( bb(C) \) \, wide M in "GL"_n \( bb(C) \) \, wide H \( z \) =
  M + z C \( I_r - z D \)^(- 1) B . $

 If $s_0 in bb(C)$ satisfies
$ det \( I_r - s_0 D \) eq.not 0 \, wide det H \( s_0 \) eq.not 0 \, $

 then
#[#set math.equation(numbering: n => "(6.10)")
 $ p \( H \( s_0 \) \) lt.eq p \( K \) . $ <feedback:eq:feedback-law>]

 No invertibility of $D$ is required.]
] <thm:feedback>

#proof[
  If there is no state block, $H = M = K$. With a state block present, $s_0 = 0$ is the invertible corner law, 12.
    We prove the claim for $s_0 eq.not 0$ by fixing $K \, s_0$ throughout the following estimates. Let
  $ q \( z \) = det \( I_r - z D \) \, wide G \( z \) = q \( z \) M + z C "adj" \( I_r - z D \) B =
    q \( z \) H \( z \) . $
  Then $G$ is polynomial, $q \( 0 \) = 1$, $q \( s_0 \) eq.not 0$ and $G \( 0 \) = M$ is invertible.
    Put $N = n^k$ and choose $t = t \( k \)$ as in (6.2). For sufficiently large $k$,
    this choice meets the degree condition in 18.
  Write $A_H = cal(T)_t \( H \( z \)^(⊗ k) \)$. The cascade estimate in (5.9) gives,
    with constants depending only on the fixed cell,
  #[#set math.equation(numbering: n => "(6.11)")
   $ p \( A_H \) lt.eq t k n^(k - 1) p \( K \) + C_K N #scale(x: 120%, y: 120%)[\(] t
     log \( 2 t \) + \( k + 1 \)^3 #scale(x: 120%, y: 120%)[\)] . $ <feedback:eq:cascade-use>]
  Moreover,
  $ A_G = \( cal(T)_t \( q^k \) ⊗ I_N \) A_H \, $
  and the scalar factor is invertible. The scalar-convolution bound and the product law in both directions show that
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| p \( A_G \) - p \( A_H \) \| lt.eq C N t log \( 2 t \) . $ <feedback:eq:clear-denominator-cost>]
  Its constant is independent of the degree or coefficients of $q^k$.
  Apply the coefficient-boundary comparison with $ell \( z \) = \( z - s_0 \)^t$.
    To verify its remaining invertibility hypothesis, translate a polynomial to its coefficients at $s_0$.
    The scalar translation matrix $V_(s_0)$ has entries
  $ \( V_(s_0) \)_(i j) = cases(delim: "{", binom(j, i) s_0^(j - i) \, & j gt.eq i \,, 0 \, & j < i \,) wide
    0 lt.eq i \, j < t . $
  It is invertible with inverse $V_(- s_0)$. In the translated coordinates,
    multiplication modulo $\( z - s_0 \)^t$ becomes multiplication by $G \( s_0 + w \)^(⊗ k)$ modulo $w^t$. Hence
  #[#set math.equation(numbering: n => "(6.13)")
   $ \( V_(s_0) ⊗ I_N \) W \( V_(s_0)^(- 1) ⊗ I_N \) = cal(T)_t \( G \( s_0 + w \)^(⊗ k) \) .
     $ <feedback:eq:taylor-conjugacy>]
  The right-hand side is lower triangular in time, with repeated invertible diagonal block $G \( s_0 \)^(⊗ k)$.
    Thus $W$ is invertible, as required.
  The price of translation is also small. If $D_(!) = "diag" \( 0 ! \, 1 ! \, dots.h \, \( t - 1 \) ! \)$ and
    $U_(s_0)$ is the upper triangular Toeplitz matrix with entry $s_0^(j - i) \/ \( j - i \) !$ at $j gt.eq i$, then
  $ V_(s_0) = D_(!)^(- 1) U_(s_0) D_(!) . $
  Monomial invariance, transpose symmetry and 14 imply
  #[#set math.equation(numbering: n => "(6.14)")
   $ p \( V_(s_0) \) = O \( t log \( 2 t \) \) . $ <feedback:eq:translation-price>]
  Applying triangular monotonicity, 15, to (6.13), then undoing its two scalar changes of basis, gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ p \( W \) & gt.eq t thin p \( G \( s_0 \)^(⊗ k) \) - 2 N p \( V_(s_0) \)\
 & = t k n^(k - 1) p \( H \( s_0 \) \) - O \( N t log \( 2 t \) \) . $ <feedback:eq:feedback-lower>]
  For the equality, use the tensor law and the nonzero scalar relation $G \( s_0 \) = q \( s_0 \) H \( s_0 \)$,
    which preserves price.
  Combining (6.1), (6.11), (6.12), (6.15) yields
  $ t k n^(k - 1) #scale(x: 120%, y: 120%)[\(] p \( H \( s_0 \) \) - p \( K \) #scale(x: 120%, y: 120%)[\)] lt.eq
    C_(K \, s_0) N #scale(x: 120%, y: 120%)[\(] t log \( 2 t \) + \( k + 1 \)^6 #scale(x: 120%, y: 120%)[\)] . $
  Divide by $t k n^(k - 1) = t k N \/ n$ and let $k$ tend to infinity with the single fixed choice of $t$ in
    (6.2). The error vanishes by (6.9), proving (6.10). ◻
]

=== 6.3 Specialization at any regular invertible value <specialization-at-any-regular-invertible-value>

#thm([Theorem 6.3.])[
  (Algebraic specialization).  #emph[Let $X \( z \) in "Mat"_n \( bb(C) \( z \) \)$ be regular at $z_0 in bb(C)$,
    and assume $X \( z_0 \)$ is invertible. Suppose there are a finite set $E subset
    bb(C)$ and a real constant $C_0$ such that, for every $s in.not E$,
    the matrix $X \( s \)$ is defined and invertible and
$ p \( X \( s \) \) lt.eq C_0 . $

 Then $p \( X \( z_0 \) \) lt.eq C_0$.]
] <thm:specialization>

#proof[
  Replace $X \( z \)$ by $X \( z_0 + z \)$ and $E$ by $E - z_0$, so it suffices to treat $z_0 = 0$.
    By regularity, the entries have polynomial denominator representations nonzero at zero.
    Their product gives a scalar polynomial $q$ with $q \( 0 \) eq.not 0$ for which $G = q X$ is polynomial.
    In particular $G \( 0 \)$ is invertible. Enlarge the finite exceptional set to
  $ E' = E union { s : q \( s \) = 0 } . $
  At every $s in.not E'$, the matrix $G \( s \)$ is invertible and $p \( G \( s \) \) = p \( X \( s \) \) lt.eq C_0$.
  Fix $X \, q \, E'$ before letting $k$ grow, put $N = n^k$,
    and again choose the single run length specified in (6.2).
    For each such finite $t$, let $zeta_t$ be the specified primitive $t$th root of unity. Choose
  #[#set math.equation(numbering: n => "(6.16)")
   $ a = a_k in.not { 0 } union union.big_(h = 0)^(t - 1) zeta_t^(- h) E' . $ <feedback:eq:forbidden-dilations>]
  Only finitely many complex numbers are forbidden, so this choice exists for every $k$.
    No fixed dilation is asserted to work for all $k$, and no bound on $a_k$ is needed. The polynomial
  $ ell \( z \) = z^t - a^t $
  has nonzero constant term and distinct roots $s_h = a zeta_t^h$, all outside $E'$.
    Let $W$ be multiplication by $G_k$ modulo this polynomial. Scalar evaluation at the roots has matrix
  $ V_a = \( s_h^j \)_(0 lt.eq h \, j < t) = F_t "diag" \( 1 \, a \, dots.h \, a^(t - 1) \) . $
  The roots are distinct, so this matrix is invertible, and evaluation gives the exact conjugacy
  #[#set math.equation(numbering: n => "(6.17)")
   $ \( V_a ⊗ I_N \) W \( V_a^(- 1) ⊗ I_N \) = xor.big_(h = 0)^(t - 1) G \( s_h \)^(⊗ k) .
     $ <feedback:eq:root-evaluation>]
  This also proves that $W$ is invertible.
  Since $t$ is a power of two, the binary FFT computes $F_t$ with $O \( t log \( 2 t \) \)$ scalar gates.
    The universal DAG-price bound and monomial invariance therefore give
  $ p \( V_a \) = p \( F_t \) = O \( t log \( 2 t \) \) \, $
  uniformly in $a$. The direct-sum and tensor laws applied to (6.17) imply
  #[#set math.equation(numbering: n => "(6.18)")
   $ p \( W \) & lt.eq sum_(h = 0)^(t - 1) p \( G \( s_h \)^(⊗ k) \) + 2 N p \( V_a \)\
 & lt.eq t k n^(k - 1) C_0 + O \( N t log \( 2 t \) \) . $ <feedback:eq:specialization-upper>]
  On the other hand, $A_G = cal(T)_t \( G_k \)$ is lower triangular with diagonal $G \( 0 \)^(⊗ k)$ repeated $t$
    times. Thus
  #[#set math.equation(numbering: n => "(6.19)")
   $ p \( A_G \) gt.eq t k n^(k - 1) p \( G \( 0 \) \) = t k n^(k - 1) p \( X \( 0 \) \) .
     $ <feedback:eq:specialization-lower>]
  For sufficiently large $k$ the degree condition of 18 holds.
    Its uniform estimate applies to the modulus just chosen, even though $a = a_k$ can vary.
    Combining it with (6.18), (6.19) and dividing by $t k N \/ n$ proves
  $ p \( X \( 0 \) \) lt.eq C_0 + C_X (frac(log \( 2 t \), k) + frac(\( k + 1 \)^6, t k)) . $
  Letting $k$ tend to infinity proves the assertion. ◻
]

The limits in this section concern real inequalities between prices of exact finite matrices.
  Regularity of a rational matrix supplies its value at the specialization point,
  but no continuity of $p$ is assumed or inferred. In particular,
  the exceptional set in a later application may contain the specialization point itself.

== 7 Pivoting and the price of a dense pair <pivot:sec:pivots>

Throughout this Section, $p$ is the price function of 9, under the assumption that no finite win exists.
  By 11, identity padding does not change price, every nontrivial elementary coordinate shear has price one,
  and every invertible two-coordinate matrix has price at most two.

=== 7.1 A general pivot inequality <a-general-pivot-inequality>

#thm([Lemma 7.1.])[
  (Pivot inequality).  #emph[Let
$ K = mat(delim: "(", A, C; B, D) in "GL"_(n + r) \( bb(C) \) \, wide A in "GL"_n \( bb(C) \) \, quad
  D in "GL"_r \( bb(C) \) . $

 Write the action of $K$ as $\( x \, z_(upright("in")) \) mapsto \( x' \, z_(upright("out")) \)$.
   The map $\( x \, z_(upright("out")) \) mapsto \( x' \, z_(upright("in")) \)$ is the invertible matrix
#[#set math.equation(numbering: n => "(7.1)")
 $ tilde(K) = mat(delim: "(", A - C D^(- 1) B, C D^(- 1); - D^(- 1) B, D^(- 1)) \, wide p \( tilde(K) \) lt.eq
   p \( K \) + 4 r . $ <pivot:eq:pivot-matrix>]

]
] <lem:pivot-bound>

#proof[
  Solving $z_(upright("out")) = B x + D z_(upright("in"))$ gives the displayed formula.
    Its determinant is $det A \/ det D$, as follows by taking the Schur complement of $D^(- 1)$,
    so it is invertible. Both pivot hypotheses are relevant: $D$ makes the solve possible,
    whereas $A$ makes its resulting transition invertible.
  We realize this solve as a feedback operation to which 19 applies.
    Use data $\( x \, y \)$ of widths $n \, r$ and state $z$ of width $r$.
    First apply, separately on the $r$ pairs $\( y_i \, z_i \)$, the matrix
  $ P_beta = mat(delim: "(", beta, 1; 1, 1) \, wide \( hat(y) \, z_(upright("in")) \) = \( beta y + z \, y + z \) . $
  Next apply $K$ on $\( x \, z_(upright("in")) \)$, leaving $hat(y)$ fixed. Finally apply
  $ Q_beta = mat(delim: "(", 1, 1 - beta; 1, - beta) quad
    upright("on each pair ") \( hat(y)_i \, z_(upright("out") \, i) \) \, $
  with outputs $\( y' \, z' \)$. The full cell, denoted $cal(K)_beta$,
    sends $\( x \, y \, z \)$ to $\( x' \, y' \, z' \)$. Since $det P_beta = beta - 1$ and $det Q_beta = - 1$,
    it is invertible whenever $beta eq.not 1$, and
  #[#set math.equation(numbering: n => "(7.2)")
   $ p \( cal(K)_beta \) lt.eq p \( K \) + 4 r . $ <pivot:eq:cell-price>]
  The blocks of this cell with respect to its data/state split are
  #[#set math.equation(numbering: n => "(7.3)")
   $ cal(K)_beta =
     mat(delim: "(", A, C, C; \( 1 - beta \) B, beta I_r + \( 1 - beta \) D, I_r + \( 1 - beta \) D; - beta B,
     beta \( I_r - D \), I_r - beta D) . $ <pivot:eq:beta-cell>]
  Its direct data block
  $ M_beta = mat(delim: "(", A, C; \( 1 - beta \) B, beta I_r + \( 1 - beta \) D) $
  has polynomial determinant and satisfies $M_0 = K$. Thus the precise genericity requirement is
  #[#set math.equation(numbering: n => "(7.4)")
   $ beta in.not { 0 \, 1 } union { b in bb(C) : det M_b = 0 } . $ <pivot:eq:beta-exceptions>]
  This excludes only finitely many numbers and hence allows a choice of $beta$.
    At feedback parameter one, the feedback denominator is $I_r - \( I_r - beta D \) = beta D$, which is invertible.
  Indeed, closing the state by $z = z'$ in $z' = beta y + z -
    beta z_(upright("out"))$ forces $z_(upright("out")) = y$. Consequently
  $ y' = beta y + z + \( 1 - beta \) z_(upright("out")) = y + z = z_(upright("in")) . $
  The feedback output map on $\( x \, y \)$ is therefore exactly $tilde(K)$, already proved invertible.
    The full cell, its direct block, its feedback denominator, and its output all meet the hypotheses of 19.
    That Theorem and (7.2) prove the inequality. ◻
]

An empty data block gives $tilde(K) = D^(- 1)$ and the inequality directly from inverse symmetry.
  An empty pivot block makes no change. We use these conventions if either block has width zero.

=== 7.2 One shared coordinate and exact scalar pivots <one-shared-coordinate-and-exact-scalar-pivots>

#thm([Lemma 7.2.])[
  (One-coordinate intersection).  #emph[Suppose a call to $Y_1 in
    "GL"_a \( bb(C) \)$ is followed by a call to $Y_2 in "GL"_b \( bb(C) \)$,
    and their ordered coordinate sets intersect in exactly one coordinate.
    If $P$ is their product on the union of these sets, then
$ p \( P \) = p \( Y_1 \) + p \( Y_2 \) . $

 The same equality holds with any additional identity coordinates.]
] <pivot:lem:one-port>

#proof[
  Let the shared coordinate occupy port $i_0$ of $Y_1$ and port $j_0$ of $Y_2$.
    Index the tensor grid by $\( i \, j \) in { 1 \, dots.h \, a } times { 1 \, dots.h \, b }$.
    The usual word for $Y_1 ⊗ Y_2$ first applies $Y_1$ along each fiber with fixed $j$,
    and then $Y_2$ along each fiber with fixed $i$. Calls within either stage have disjoint coordinate sets,
    so put the $j = j_0$ call last in the first stage and the $i = i_0$ call first in the second stage.
    These two consecutive calls have the prescribed port identification:
    send port $i$ of $Y_1$ to $\( i \, j_0 \)$ and port $j$ of $Y_2$ to $\( i_0 \, j \)$.
    4 shows the selected fibers of this consecutive call pair and their single shared coordinate.
  Their union has $a + b - 1$ coordinates. On all other grid coordinates their product is identity,
    so the consecutive subproduct is a permutation conjugate of
  $ P xor I_(a b - \( a + b - 1 \)) = P xor I_(\( a - 1 \) \( b - 1 \)) . $
  The exact direct-sum law makes its price $p \( P \)$, even when this padding is empty.
    Grouping these two calls in the tensor word yields
  $ b thin p \( Y_1 \) + a thin p \( Y_2 \) = p \( Y_1 ⊗ Y_2 \) lt.eq \( b - 1 \) p \( Y_1 \) + \( a - 1 \)
    p \( Y_2 \) + p \( P \) . $
  Thus $p \( P \) gt.eq p \( Y_1 \) + p \( Y_2 \)$. Product subadditivity applied to the two identity-padded calls
    gives the reverse inequality. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((2.067, 0.507), (2.613, 3.393), fill: rgb("#e8e8e8"), stroke: none)
  rect((0.507, 1.287), (4.173, 1.833), fill: rgb("#d4d4d4"), stroke: none)
  rect((2.067, 0.507), (2.613, 3.393), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  rect((0.507, 1.287), (4.173, 1.833), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.78, 0.78), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((0.78, 0.78), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.56, 0.78), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((1.56, 0.78), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.34, 0.78), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((2.34, 0.78), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.12, 0.78), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.12, 0.78), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.9, 0.78), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.9, 0.78), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.78, 1.56), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((0.78, 1.56), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.56, 1.56), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((1.56, 1.56), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.34, 1.56), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((2.34, 1.56), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.12, 1.56), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.12, 1.56), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.9, 1.56), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.9, 1.56), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.78, 2.34), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((0.78, 2.34), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.56, 2.34), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((1.56, 2.34), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.34, 2.34), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((2.34, 2.34), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.12, 2.34), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.12, 2.34), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.9, 2.34), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.9, 2.34), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.78, 3.12), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((0.78, 3.12), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.56, 3.12), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((1.56, 3.12), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.34, 3.12), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((2.34, 3.12), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.12, 3.12), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.12, 3.12), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.9, 3.12), radius: 0.0585, fill: rgb("#ffffff"), stroke: none)
  circle((3.9, 3.12), radius: 0.0585, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((2.34, 1.56), radius: 0.0858, fill: black, stroke: none)
  content((2.34, 3.744), [$Y_1$ on $j=j_0$])
  content((4.407, 1.56), [$Y_2$ on $i=i_0$], anchor: "west", padding: 0.1176cm)
  content((2.34, 0.078), [shared coordinate $(i_0,j_0)$])
  line((2.34, 0.351), (2.34, 1.404), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
})],
  caption: [Figure 4: The selected tensor fibers share exactly one coordinate. Their two-call product fixes the $\( a - 1 \) \( b - 1 \)$ coordinates outside the cross. Other calls of the tensor word occur before or after this consecutive pair. ],
) <pivot:fig:tensor-grid>

#thm([Lemma 7.3.])[
  (Scalar pivot invariance).  #emph[Under the hypotheses of 21, if $r = 1$, then $p \( tilde(K) \) = p \( K \)$.]
] <lem:scalar-pivot>

#proof[
  Write $D = d eq.not 0$. For each positive integer $ell$, use $ell$ copies of $K$, with fresh data groups $x_1 \,
    dots.h \, x_ell$ of width $n$ and one shared state coordinate. In chronological order the recurrences are
  #[#set math.equation(numbering: n => "(7.5)")
   $ y_j = A x_j + C w_(j - 1) \, wide w_j = B x_j + d w_(j - 1) \, wide 1 lt.eq j lt.eq
     ell . $ <pivot:eq:chain-forward>]
  Let $cal(C)_ell$ send $\( x_1 \, dots.h \, x_ell \, w_0 \)$ to $\( y_1 \, dots.h \, y_ell \, w_ell \)$.
    At every extension the previous chain is regarded as a matrix only on its old data groups and its one state
    coordinate. The next data group is outside this set, so the intersection with the next call is exactly the one
    state coordinate. Coordinates fixed by the old chain remain members of its old set;
    no padding from the tensor-grid proof is added to it. Induction using 22 gives
  #[#set math.equation(numbering: n => "(7.6)")
   $ p \( cal(C)_ell \) = ell p \( K \) . $ <pivot:eq:forward-chain-price>]
  The full chain is invertible as a product of invertible calls.
    Its state-to-state block is $d^ell$, and its direct block on the data is lower block triangular with diagonal
    blocks $A$. In fact its $\( j \, i \)$ block for $i < j$ is $C d^(j - 1 - i) B$,
    and its blocks for $i > j$ vanish. Both blocks required by 21 are therefore invertible for every $ell$.
  Pivoting the boundary state means that $w_ell$ is given and $w_0$ is requested. The exact backward recurrence is
  #[#set math.equation(numbering: n => "(7.7)")
   $ w_(j - 1) = d^(- 1) w_j - d^(- 1) B x_j \, wide y_j = \( A - C d^(- 1) B \) x_j +
     C d^(- 1) w_j . $ <pivot:eq:chain-backward>]
  Thus the pivoted chain $tilde(cal(C))_ell$ consists of copies of $tilde(K)$ in the order $j = ell \, dots.h \,
    1$, again with fresh data groups and one shared state. The same intersection argument gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ p \( tilde(cal(C))_ell \) = ell p \( tilde(K) \) . $ <pivot:eq:reverse-chain-price>]
  Put $S = A - C d^(- 1) B$. Since $det K = d det S$, the matrix $S$ is invertible.
    The reverse chain has state block $d^(- ell)$ and a direct data block upper triangular in chronological order,
    with diagonal blocks $S$; equivalently it is lower triangular in reverse chronological order.
    Its full matrix is invertible too. Hence 21 applies both to the forward chain and to the reverse chain.
    Pivoting the reverse chain returns the forward chain, and therefore
  $ ell p \( tilde(K) \) lt.eq ell p \( K \) + 4 \, wide ell p \( K \) lt.eq ell p \( tilde(K) \) + 4 . $
  Equivalently, $\| p \( tilde(K) \) - p \( K \) \| lt.eq 4 \/ ell$ for every $ell$.
    Letting $ell$ tend to infinity proves equality. The earlier pivot inequality is an exact statement for each
    finite matrix, so this argument requires no estimate uniform in the increasing data width. ◻
]

#thm([Corollary 7.4.])[
  (Exchange of two basis members).  #emph[Let $U = \( u_1 \, dots.h \, u_n \, u_(*) \)$ and
    $V = \( v_1 \, dots.h \, v_n \, v_(*) \)$ be ordered bases of the same space of linear forms,
    viewing each list as a column vector of its forms, and let
$ V = K U \, wide K = mat(delim: "(", A, C; B, d) . $

 The exchanged lists
$ U' = \( u_1 \, dots.h \, u_n \, v_(*) \) \, wide V' = \( v_1 \, dots.h \, v_n \, u_(*) \) $

 are both bases if and only if $d eq.not 0$ and $det A eq.not 0$.
   Whenever this holds, the transitions $U mapsto V$ and $U' mapsto V'$ have equal price.
   The statement applies to any chosen member of each basis after reordering them to the last positions.]
] <pivot:cor:basis-exchange>

#proof[
  Relative to $U$, the coefficient matrices of $U'$ and $V'$ are
  $ mat(delim: "(", I_n, 0; B, d) \, wide mat(delim: "(", A, C; 0, 1) \, $
  with determinants $d$ and $det A$, respectively. These give the asserted criterion exactly.
    When both are nonzero, the transition between them is (7.1) with scalar pivot. Apply 23.
    Reorderings have zero price. ◻
]

=== 7.3 Four forms and the dense-pair bound <four-forms-and-the-dense-pair-bound>

#thm([Lemma 7.5.])[
  (Price of a dense pair).  #emph[Every invertible $2 times
    2$ matrix all of whose entries are nonzero has price at most $3 \/ 2$. In particular,
#[#set math.equation(numbering: n => "(7.9)")
 $ p (mat(delim: "(", 1, 1; 1, u)) lt.eq 3 / 2 wide \( u in bb(C) \\ { 0 \, 1 } \) . $ <pivot:eq:pair-bound>]

]
] <lem:pair-price>

#proof[
  For a pair matrix $H$, the tensor law reads $p \( H ⊗ H \) = 4 p \( H \)$.
    We therefore seek a four-coordinate map of price at most six that becomes a tensor square after monomial
    changes. Two shears and the basis exchanges below put this map into the form of a rank-one perturbation of the
    identity, making the required monomial changes explicit.
  Fix $lambda in bb(C) \\ { 0 \, 1 }$ and four independent linear forms $a \, b \, c \, d$.
    We first bound the transition from
  $ Y^(\( 0 \)) = \( a \, b \, c \, d \) quad upright("to") quad X = \( a + b \, b + c \, c + d \, d + lambda a \) . $
  Its matrix is $I_4 + J$, where
  $ J = mat(delim: "(", 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1; lambda, 0, 0, 0) \, wide J^4 = lambda I_4 . $
  Here $J$ is monomial because $lambda eq.not 0$, and
  $ \( I_4 + J \) \( I_4 - J + J^2 - J^3 \) = \( 1 - lambda \) I_4 $
  shows that $I_4 + J$ is invertible. Apply 19 at parameter one to
  $ cal(L) = mat(delim: "(", I_4, J; I_4, 0) . $
  This full cell is invertible, its direct block and feedback denominator are identities, and its output is $I_4 +
    J$. To implement $cal(L)$, send $\( h \, l \)$ to $\( h \, J l \)$ by a monomial,
    add $h_i$ into the second coordinate of each of the four pairs, and swap the two blocks. Consequently
  #[#set math.equation(numbering: n => "(7.10)")
   $ p \( I_4 + J \) lt.eq p \( cal(L) \) lt.eq 4 . $ <pivot:eq:four-start>]
  We change the first and third members on the $Y$ side using two shears and legal exchanges.
    For clarity, all intermediate lists are displayed below. Put
  $ X_b = \( a + b \, b \, c + d \, d + lambda a \) \, wide X_d = \( a + b \, b + c \, c + d \, d \) . $
  Every determinant in the last two columns is computed from the coefficient rows in the original ordered basis
    $\( a \, b \, c \, d \)$.
  #[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, left, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Stage
], table.cell(rowspan: 1, colspan: 1)[$Y$ list
], table.cell(rowspan: 1, colspan: 1)[$X$ list
], table.cell(rowspan: 1, colspan: 1)[$det Y$
], table.cell(rowspan: 1, colspan: 1)[$det X$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$\( a \, b \, c \, d \)$
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1 - lambda$
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[$\( a \, b + c \, c \, d \)$
], table.cell(rowspan: 1, colspan: 1)[$X_b$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[$\( a + b + c \, b + c \, c \, d \)$
], table.cell(rowspan: 1, colspan: 1)[$X_b$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[$\( a + b + c \, b \, c \, d \)$
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1 - lambda$
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[$\( a + b + c \, b \, c \, d + lambda a \)$
], table.cell(rowspan: 1, colspan: 1)[$X_d$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[$\( a + b + c \, b \, c + d + lambda a \, d + lambda a \)$
], table.cell(rowspan: 1, colspan: 1)[$X_d$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$\( a + b + c \, b \, c + d + lambda a \, d \)$
], table.cell(rowspan: 1, colspan: 1)[$X$
], table.cell(rowspan: 1, colspan: 1)[$1 - lambda$
], table.cell(rowspan: 1, colspan: 1)[$1 - lambda$
],
)
]
  The steps $0 arrow.r 1$ and $2 arrow.r 3$ exchange the second members; the steps $3 arrow.r 4$ and $5 arrow.r
    6$ exchange the fourth members. The step $1 arrow.r 2$ adds the second member of $Y$ into its first,
    and $4 arrow.r 5$ adds its fourth member into its third. These are the only two shears.
    The determinant table proves that every list is a basis, including on both sides of every exchange;
    it follows also by direct elementary row operations. Thus 24 applies at all four exchanges.
    Changing the source basis from $Y$ to $E Y$ by a shear replaces its transition matrix $T$ by $T E^(- 1)$,
    increasing price by at most one. Together with (7.10), this proves that the transition from the last $Y$ list
    to $X$ has price at most six.
  Reorder these final lists as
  $ overline(Y) = \( a + b + c \, b \, d \, c + d + lambda a \) \, wide
    overline(X) = \( b + c \, b + a \, d + lambda a \, c + d \) . $
  Let
  $ k = \( 1 \, - 1 \, 1 \, - 1 \)^(sans(T)) \, wide Delta = \( - 1 \, 1 \, lambda \, - lambda \)^(sans(T)) . $
  Then $k^(sans(T)) overline(Y) = \( 1 - lambda \) a$ and $overline(X) - overline(Y) = Delta a$,
    so the transition matrix is the explicit rank-one perturbation
  #[#set math.equation(numbering: n => "(7.11)")
   $ T = I_4 + frac(Delta k^(sans(T)), 1 - lambda) \, wide p \( T \) lt.eq 6 . $ <pivot:eq:rank-one>]
  We now give the diagonal scalings. All their entries are nonzero under the stated hypotheses on $lambda$.
    Set $u = lambda^(- 1)$ and
  $ L_1 =
    "diag"
    (frac(1 - lambda, Delta_1) \, frac(1 - lambda, Delta_2) \, frac(1 - lambda, Delta_3) \, frac(1 - lambda,
    Delta_4)) \, wide R_1 = "diag" \( 1 \, - 1 \, 1 \, - 1 \) . $
  The rank-one summand of $L_1 T R_1$ has every entry equal to one, and a direct calculation gives
  $ L_1 T R_1 = mat(delim: "(", lambda, 1, 1, 1; 1, lambda, 1, 1; 1, 1, u, 1; 1, 1, 1, u) . $
  With the further scalings
  $ L_2 = "diag" \( u \, u \, u \, 1 \) \, wide R_2 = "diag" \( 1 \, 1 \, 1 \, lambda \) \, $
  we obtain
  #[#set math.equation(numbering: n => "(7.12)")
   $ L_2 L_1 T R_1 R_2 = mat(delim: "(", 1, u, u, 1; u, 1, u, 1; u, u, u^2, 1; 1, 1, 1, 1) .
     $ <pivot:eq:tensor-rescaling>]
  Write $B \( u \) = mat(delim: "(", 1, 1; 1, u)$. The $\( alpha \, gamma \)$ entry of $B \( u \) ⊗ B \( u \)$,
    for bit pairs $alpha \, gamma in { 0 \, 1 }^2$, is $u^(alpha_1 gamma_1 + alpha_2 gamma_2)$.
    Ordering its rows by $10 \, 01 \, 11 \, 00$ and its columns by $01 \, 10 \, 11 \, 00$ gives exactly (7.12).
    All the scalings and permutations preserve price. The tensor law therefore yields
  $ 4 p \( B \( u \) \) = p \( B \( u \) ⊗ B \( u \) \) = p \( T \) lt.eq 6 . $
  Every $u eq.not 0 \, 1$ arises from the permitted choice $lambda = 1 \/ u$, proving (7.9).
  Finally, if $H = mat(delim: "(", a, b; c, d)$ is dense and invertible, then
  $ "diag" \( a^(- 1) \, c^(- 1) \) thin H thin "diag" \( 1 \, a \/ b \) = B (frac(a d, b c)) . $
  Density makes $a d \/ \( b c \) eq.not 0$, and invertibility makes it different from one.
    Monomial invariance completes the proof. ◻
]

== 8 Signed matrices and the reflection contradiction <reflect:section>

We continue under the assumption that there is no finite win.
  Thus the price function of 9, the feedback and specialization laws, and the pivot laws all apply.
  We construct a real involution with a large price and then use the orthogonal reflection in its positive
  eigenspace to obtain incompatible price bounds. All dimensions in the two specializations below are fixed before
  either specialization is made.

=== 8.1 Signed bit operators with an exact price <signed-bit-operators-with-an-exact-price>

On one bit, set

$ C = mat(delim: "(", 0, 0; 1, 0) \, wide Z = mat(delim: "(", 1, 0; 0, - 1) \, wide X = mat(delim: "(", 0, 1; 1, 0) . $

For $m gt.eq 1$, define matrices on $m$ bits by

#[#set math.equation(numbering: n => "(8.1)")
 $ D_1 = C \, wide D_(m + 1) = C ⊗ I_(2^m) + Z ⊗ D_m = mat(delim: "(", D_m, 0; I_(2^m), - D_m) \, wide T_m =
   I_(2^m) + D_m . $ <reflect:signed-recursion>]

The matrices $D_m$ are strictly lower triangular in lexicographic bit order.
  Squaring the displayed block matrix shows inductively that $D_m^2 = 0$.
  In particular, $T_m$ is invertible and $T_m^(- 1) = I_(2^m) - D_m$.

The signed tensor summands in this recursion have the standard Jordan–Wigner creation-operator form,
  with tensor factors in the reverse order of the convention in
  #cite(label("seeleyRichardLove2012"), form: "prose") Section II.B, Equations (10)–(11).
  Here the bits label ordinary matrix coordinates. The recursion above and the price arguments below provide all
  identities needed for the proof.

#thm([Lemma 8.1.])[
  #emph[For every integer $m gt.eq 1$,
$ p \( T_m \) = m 2^(m - 1) . $

]
] <reflect:triangular-price>

#proof[
  We have $T_1 = U$, so $p \( T_1 \) = 1$. Put $n = 2^m$ and consider the transition from input forms
    $x = \( x_1 \, dots.h \, x_(2 n) \)$ to output forms $y = K_0 x$, where
  $ K_0 = U ⊗ T_m = mat(delim: "(", T_m, 0; T_m, T_m) . $
  We shall exchange each bottom input form with the corresponding bottom output form,
    using only the exact #emph[scalar] pivot law of 23. Here is a determinant check for every intermediate exchange.
  For any subset $H subset.eq { n + 1 \, dots.h \, 2 n }$ of already exchanged positions,
    keep the forms in their original index positions and set
  $ u_i = cases(delim: "{", y_i & i in H \,, x_i & i in.not H \,) wide v_i =
    cases(delim: "{", x_i & i in H \,, y_i & i in.not H .) $
  Let $U_H \, V_H$ be their coefficient matrices relative to $x$.
    Simultaneously permuting rows and columns to put $H$ first gives
  $ U_H tilde.op mat(delim: "(", K_0 \[ H \, H \], K_0 \[ H \, H^c \]; 0, I) \, wide
    V_H tilde.op mat(delim: "(", I, 0; K_0 \[ H^c \, H \], K_0 \[ H^c \, H^c \]) . $
  The row and column permutation signs cancel. Every principal submatrix of the unit lower triangular matrix $K_0$
    is unit lower triangular, so
  #[#set math.equation(numbering: n => "(8.2)")
   $ det U_H = det K_0 \[ H \, H \] = 1 \, wide det V_H = det K_0 \[ H^c \, H^c \] = 1 . $ <reflect:mixed-minors>]
  The empty principal minor, when it occurs, has determinant one.
    Thus both lists are bases and their current transition $Q_H = V_H U_H^(- 1)$ has determinant one.
  For the next index $j in.not H$ in the bottom half, replacing $u_j$ by $v_j$ changes the input determinant by
    the factor $\( Q_H \)_(j j)$. Replacing $v_j$ by $u_j$ changes the output determinant by
    $\( Q_H^(- 1) \)_(j j)$. Applying (8.2) to $H$ and $H union { j }$ therefore gives
  $ \( Q_H \)_(j j) = frac(det U_(H union { j }), det U_H) = 1 \, wide \( Q_H^(- 1) \)_(j j) =
    frac(det V_(H union { j }), det V_H) = 1 . $
  Move position $j$ to the last port in both bases. The scalar diagonal block required for the pivot is
    consequently one; the determinant of its complementary principal block is, by the cofactor identity,
  $ det Q_H thin \( Q_H^(- 1) \)_(j j) = 1 . $
  Both hypotheses of 23 hold at every step, and each exchange preserves the price exactly.
  After all bottom positions have been exchanged, write the original inputs as $\( a \, b \)$ and the bottom
    output as $z = T_m a + T_m b$. Solving gives $b = T_m^(- 1) z - a$.
    Thus the final transition, from $\( a \, z \)$ to $\( T_m a \, b \)$, is
  $ mat(delim: "(", T_m, 0; - I, T_m^(- 1)) . $
  Conjugating by $"diag" \( I \, - I \)$ changes the lower left block to $I$; the result is $T_(m + 1)$ by (8.1).
    Monomial invariance and the tensor law now give
  $ p \( T_(m + 1) \) = p \( U ⊗ T_m \) = 2^m + 2 p \( T_m \) \, $
  which proves the formula by induction. ◻
]

Fix an integer $d gt.eq 1$. On $d + 1$ bits, of width $N = 2^(d + 1)$, put

#[#set math.equation(numbering: n => "(8.3)")
 $ Gamma = X ⊗ I_(2^d) + Z ⊗ D_d = mat(delim: "(", D_d, I; I, - D_d) . $ <reflect:gamma>]

Since $D_d^2 = 0$, this is a real involution. Its price is also exact:

#[#set math.equation(numbering: n => "(8.4)")
 $ p \( Gamma \) = frac(d N, 2) . $ <reflect:gamma-price>]

To verify this, multiplication on the left by the monomial $X ⊗ I$ gives $I + \( X Z \) ⊗ D_d$. The recursion expands as

$ D_d = sum_(i = 1)^d Z^(⊗ \( i - 1 \)) ⊗ C ⊗ I_(2^(d - i)) . $

Each nonzero entry therefore changes exactly one bit from zero to one, increasing Hamming weight by one.
  Define the signed monomial $P$ to act on the first bit by $\( X Z \)^(- \| b \|)$ when the last $d$ bits have
  value $b$ and Hamming weight $\| b \|$. On a transition of these last bits from weight $j$ to weight $j + 1$,
  conjugation by $P$ changes the first-bit factor to

$ \( X Z \)^(- \( j + 1 \)) \( X Z \) \( X Z \)^j = I_2 . $

It leaves the identity term unchanged. Hence

$ P #scale(x: 120%, y: 120%)[\(] I + \( X Z \) ⊗ D_d #scale(x: 120%, y: 120%)[\)] P^(- 1) = I_2 ⊗ T_d \, $

and (8.4) follows from 26 and the tensor law.

We next record a transpose symmetry. Define the signed orthogonal monomial

#[#set math.equation(numbering: n => "(8.5)")
 $ J = ⨂_(i = 1)^(d + 1) \( Z^(i - 1) X \) . $ <reflect:j-definition>]

For its $i$th factor $H_i = Z^(i - 1) X$, direct multiplication gives

$ H_i^(sans(T)) = \( - 1 \)^(i - 1) H_i \, wide H_i Z H_i^(- 1) = - Z \, wide
  H_i C H_i^(- 1) = \( - 1 \)^(i - 1) C^(sans(T)) . $

The first-bit term of $Gamma$ is $X ⊗ I$ and is fixed by this conjugation. Every other term has the form

$ Z^(⊗ \( i - 1 \)) ⊗ C ⊗ I_(2^(d + 1 - i)) \, wide 2 lt.eq i lt.eq d + 1 . $

The $i - 1$ prefix signs and the sign from the $C$ factor cancel. It follows that

#[#set math.equation(numbering: n => "(8.6)")
 $ J Gamma J^(- 1) = Gamma^(sans(T)) \, wide J^(sans(T)) = \( - 1 \)^(d \( d + 1 \) \/ 2) J .
   $ <reflect:transpose-symmetry>]

On width $w = N^2$, set

#[#set math.equation(numbering: n => "(8.7)")
 $ M = Gamma ⊗ Gamma \, wide L = Gamma ⊗ I_N - I_N ⊗ Gamma \, wide S = J ⊗ J \, wide A =
   S L . $ <reflect:large-operators>]

The matrix $S$ is a symmetric orthogonal monomial, so $S^(- 1) = S$.
  Equation (8.6) gives $S L S^(- 1) = L^(sans(T))$, and consequently

$ A^(sans(T)) = L^(sans(T)) S^(sans(T)) = S L = A . $

In particular, $A$ is real symmetric. Moreover,

#[#set math.equation(numbering: n => "(8.8)")
 $ \( Gamma ⊗ I_N \) L = I_w - M \, wide E := ker A = ker L = ker \( I_w - M \) . $ <reflect:kernel>]

Thus $E$ is the positive eigenspace of the involution $M$.

We shall need a count of the supported unordered off-diagonal pairs of $A$.
  The first-bit flip in $Gamma$ has $N$ nonzero entries, and each of its other $d$ bit terms has $N \/
  2$ nonzero entries. Their supports are disjoint, since they change different bits.
  Thus $"nnz" \( Gamma \) = \( 1 + d \/ 2 \) N$. The supports of $Gamma ⊗ I_N$ and $I_N ⊗
  Gamma$ are also disjoint: they change a bit in different tensor factors. Therefore

$ "nnz" \( L \) = \( d + 2 \) w \, wide "nnz" \( A \) = \( d + 2 \) w . $

Symmetry makes every supported off-diagonal pair account for two entries. If $h$ is the number of such pairs, we have

#[#set math.equation(numbering: n => "(8.9)")
 $ h lt.eq \( d \/ 2 + 1 \) w . $ <reflect:pair-count>]

Let $R$ be the orthogonal reflection in $E$. The rest of the argument will establish the bounds

$ \( d - 4 \) w lt.eq p \( R \) lt.eq (frac(3 d, 4) + 7 / 2) w . $

They are incompatible when $d > 30$. The upper bound uses the description $E = ker A$:
  a polynomial perturbation has one dense pair factor of price at most $3 \/ 2$ for each supported pair of $A$,
  at generic parameter values. Two algebraic specializations turn this bound into a price for the reflection.
  The lower bound uses $E$ as the positive eigenspace of $M$, whose tensor price is $d w$.
  Its graph description will recover the full price of $M$ from $R$, at a cost of at most $4 w$.
  Thus the contradiction comes from the different coefficients of $d$,
  while the changes of boundary coordinates cost only a fixed multiple of the width.

=== 8.2 Pricing a reflection by two algebraic specializations <pricing-a-reflection-by-two-algebraic-specializations>

The following statement isolates the use of sparsity. Orthogonality refers to the usual real inner product;
  all real maps and subspaces are then complexified when their prices are taken.

#thm([Lemma 8.2.])[
  #emph[Let $A$ be a real symmetric $w times w$ matrix with $h$ supported unordered off-diagonal pairs.
    Let $R$ act as $+ I$ on $ker A$ and as $- I$ on $\( ker A \)^perp$. Then
$ p \( R \) lt.eq 3 / 2 h + 2 w . $

]
] <reflect:sparse-reflection>

#proof[
  Write $e_(i j)$ for matrix units, and fix any order of the supported pairs. Form the polynomial matrix
  #[#set math.equation(numbering: n => "(8.10)")
   $ K \( epsilon \) = (I + epsilon "diag" \( A_11 \, dots.h \, A_(w w) \)) product_(i < j\
A_(i j) eq.not 0) (I + epsilon A_(i j) \( e_(i j) + e_(j i) \)) . $ <reflect:polynomial-product>]
  Then $K \( 0 \) = I$ and $K' \( 0 \) = A$. Outside a finite set $E_0$,
    the diagonal factor is an invertible monomial and every other factor acts on its two coordinates as the dense
    invertible matrix
  $ mat(delim: "(", 1, epsilon A_(i j); epsilon A_(i j), 1) . $
  For example, $E_0$ may contain zero, the roots of the diagonal-factor determinant, and all roots of $1 -
    epsilon^2 A_(i j)^2$ for the supported pairs. These are finitely many roots of nonzero polynomials.
    By 25, direct sums, and product subadditivity,
  #[#set math.equation(numbering: n => "(8.11)")
   $ p \( K \( epsilon \) \) lt.eq 3 / 2 h wide \( epsilon in.not E_0 \) . $ <reflect:product-price>]
  Put $Q \( epsilon \) = \( K \( epsilon \) - I \) \/ epsilon$, with its polynomial extension $Q \( 0 \) = A$.
    First fix a parameter $t$ outside the single finite set
  #[#set math.equation(numbering: n => "(8.12)")
   $ cal(E) = { 0 } union { lambda^(- 1) \, - lambda^(- 1) : lambda in "spec" \( A \) \, med
     lambda eq.not 0 } . $ <reflect:outer-exceptions>]
  The polynomial matrices
  $ C_(+) \( epsilon \) = I + t Q \( epsilon \) \, wide C_(-) \( epsilon \) = I - t Q \( epsilon \) $
  have nonzero determinants at zero, since $I plus.minus t A$ are invertible. Consequently the rational output
  $ H_t \( epsilon \) = C_(+) \( epsilon \) C_(-) \( epsilon \)^(- 1) $
  is regular and invertible at zero.
  For this fixed $t$, exclude also $epsilon = 0 \, t \, - t$ and the roots of $det C_(+) \( epsilon \) det
    C_(-) \( epsilon \)$, in addition to $E_0$. This defines a finite set $E_t$, which may depend on $t$.
    For $epsilon in.not E_t$ define
  $ m = frac(epsilon - t, epsilon + t) \, wide s = frac(t, epsilon + t) \, wide v =
    frac(2 epsilon t, \( epsilon + t \)^2) \, $
  and consider the data–state cell
  #[#set math.equation(numbering: n => "(8.13)")
   $ F_(t \, epsilon) = mat(delim: "(", m I_w, K \( epsilon \); v I_w, s K \( epsilon \)) =
     mat(delim: "(", m I_w, I_w; v I_w, s I_w) "diag" \( I_w \, K \( epsilon \) \) . $ <reflect:feedback-cell>]
  The first factor is a direct sum, after reordering, of $w$ scalar pair matrices. Their determinants are
  $ m s - v = - frac(t, epsilon + t) eq.not 0 . $
  Hence the cell is invertible. Its direct block $m I_w$ is invertible,
    and its feedback denominator at feedback parameter one satisfies
  #[#set math.equation(numbering: n => "(8.14)")
   $ I_w - s K \( epsilon \) = frac(epsilon, epsilon + t) C_(-) \( epsilon \) \, $ <reflect:feedback-denominator>]
  so that denominator is invertible too. Its feedback output is exactly
  $ m I_w + K \( epsilon \) \( I_w - s K \( epsilon \) \)^(- 1) v & =
    #scale(x: 120%, y: 120%)[\(] m I_w + \( v - m s \) K \( epsilon \)
    #scale(x: 120%, y: 120%)[\)] \( I_w - s K \( epsilon \) \)^(- 1)\
 & = C_(+) \( epsilon \) C_(-) \( epsilon \)^(- 1) = H_t \( epsilon \) . $
  The last equality follows from $m I_w + \( v - m s \) K \( epsilon \) =
    epsilon C_(+) \( epsilon \) \/ \( epsilon + t \)$. The output is invertible by the choice of $E_t$,
    so every hypothesis of 19 is satisfied.
  An invertible scalar pair has price at most two. The factorization (8.13) and (8.11) therefore imply
  $ p \( H_t \( epsilon \) \) lt.eq p \( F_(t \, epsilon) \) lt.eq p \( K \( epsilon \) \) + 2 w lt.eq 3 / 2 h +
    2 w wide \( epsilon in.not E_t \) . $
  Apply 20 to the rational matrix $H_t$ at $epsilon = 0$. This proves
  #[#set math.equation(numbering: n => "(8.15)")
   $ p #scale(x: 120%, y: 120%)[\(] \( I + t A \) \( I - t A \)^(- 1) #scale(x: 120%, y: 120%)[\)] lt.eq C_A \,
     wide C_A = 3 / 2 h + 2 w \, wide t in.not cal(E) . $ <reflect:first-specialization>]
  The quantifiers here are useful: $A \, w \, h$ and $C_A$ were fixed first;
    for #emph[each] $t in.not cal(E)$ there is a finite $E_t$ giving the same bound,
    and specialization is applied separately for that $t$. Thus (8.15) holds for every $t$ outside one finite set,
    with one price bound. Only the rational output is specialized.
    At $epsilon = 0$ the cell itself would have $m = - 1$, $s = 1$, $v = 0$, and $K = I$,
    making its feedback denominator zero; no feedback law is applied to that cell.
  For the second specialization use $z = 1 \/ t$ and the rational matrix
  $ Y \( z \) = \( z I_w + A \) \( z I_w - A \)^(- 1) . $
  By the Real Spectral Theorem, $A = O "diag" \( lambda_1 \, dots.h \, lambda_w \)
    O^(sans(T))$ for a real orthogonal $O$ and real eigenvalues $lambda_i$.
    In this basis, the corresponding rational functions are $\( z + lambda_i \) \/ \( z - lambda_i \)$.
    If $lambda_i = 0$, this function is identically one after cancellation; if $lambda_i eq.not 0$,
    it is regular at zero with value minus one. It follows that $Y$ is regular at zero and $Y \( 0 \) = R$,
    an invertible matrix. In particular, the zero eigenspace is semisimple;
    real symmetry supplies exactly the diagonalizability needed for this removable-singularity assertion.
  For all $z$ outside ${ 0 } union { lambda \, - lambda : lambda in "spec" \( A \) \, lambda eq.not 0 }$,
    we may take $t = 1 \/ z$ in (8.15). Hence $p \( Y \( z \) \) lt.eq C_A$ outside a finite set.
    A second application of 20 yields $p \( R \) lt.eq C_A$. The orthogonal diagonalization was used to identify a
    rational matrix and its value; it was not used as a priced implementation.
    Neither specialization assumes continuity of $p$. ◻
]

Apply 27 to $A = S L$ from (8.7). With $R$ the orthogonal reflection in $E$ from (8.8), (8.9) gives

#[#set math.equation(numbering: n => "(8.16)")
 $ p \( R \) lt.eq 3 / 2 \( d \/ 2 + 1 \) w + 2 w = (frac(3 d, 4) + 7 / 2) w . $ <reflect:upper-bound>]

=== 8.3 The graph of the positive eigenspace <the-graph-of-the-positive-eigenspace>

Every nonzero term of $Gamma$ changes exactly one bit, so $Gamma$ anticommutes with the parity sign $Pi =
  Z^(⊗ \( d + 1 \))$. Consequently $M$ anticommutes with $Pi ⊗ I_N$.
  Order the coordinates according to this first-factor parity.
  The two parts have equal width $r = w \/ 2$, and in this order

#[#set math.equation(numbering: n => "(8.17)")
 $ M = mat(delim: "(", 0, B; B^(- 1), 0) quad upright("for some ") B in "GL"_r \( bb(R) \) .
   $ <reflect:graph-involution>]

Indeed anticommutation forces the diagonal blocks to vanish, and $M^2 =
  I$ forces the two off-diagonal blocks to be mutual inverses. The tensor law and (8.4) give

#[#set math.equation(numbering: n => "(8.18)")
 $ p \( M \) = 2 N p \( Gamma \) = d w = 2 p \( B \) \, $ <reflect:m-price>]

where the last equality follows by multiplying (8.17) by a block-swap permutation and then using direct sums and
  inverse symmetry.

Equation (8.17) identifies

$ E = { \( B v \, v \) : v in bb(R)^r } \, wide E^perp = { \( u \, v \) : B^(sans(T)) u + v = 0 } . $

Let $Q = I_r + B^(sans(T)) B$. For every nonzero real vector $v$, $v^(sans(T)) Q v = parallel v parallel^2 +
  parallel B v parallel^2 > 0$; hence $Q$ is invertible. The columns of $binom(B, I_r)$ form a basis of $E$,
  so its orthogonal projection is

$ P_E = vec(B, I_r) Q^(- 1) mat(delim: "(", B^(sans(T)), I_r) . $

As $R = 2 P_E - I_w$, its off-diagonal blocks in the parity order are

#[#set math.equation(numbering: n => "(8.19)")
 $ R_(+ \, -) = 2 B Q^(- 1) \, wide R_(- \, +) = 2 Q^(- 1) B^(sans(T)) =
   R_(+ \, -)^(sans(T)) . $ <reflect:invertible-offdiagonals>]

Both are invertible. This use of positive definiteness is over $bb(R)$;
  all these invertible real matrices also define invertible complex linear maps.

For $y = R x$, order the input as $\( x_(-) \, x_(+) \)$ and the output as $\( y_(+) \, y_(-) \)$.
  The resulting transition is

$ K_R = mat(delim: "(", R_(+ \, -), R_(+ \, +); R_(- \, -), R_(- \, +)) . $

The two diagonal blocks required by 21 are now precisely the invertible blocks in (8.19).
  Pivot the second group of $r$ ports and then swap the two output groups. The resulting map

$ V : \( x_(-) \, y_(-) \) mapsto \( x_(+) \, y_(+) \) $

therefore satisfies

#[#set math.equation(numbering: n => "(8.20)")
 $ p \( V \) lt.eq p \( R \) + 4 r . $ <reflect:graph-pivot-price>]

Since $R$ is the reflection in $E$, the vectors $x + y$ and $x - y$ belong to $E$ and $E^perp$, respectively.
  Their graph equations are

$ x_(+) + y_(+) = B \( x_(-) + y_(-) \) \, wide x_(+) - y_(+) = - B^(- sans(T)) \( x_(-) - y_(-) \) . $

For the invertible sum-and-difference map

$ F = mat(delim: "(", I_r, I_r; I_r, - I_r) \, wide F^(- 1) = 1 / 2 F \, $

these equations state the exact identity

#[#set math.equation(numbering: n => "(8.21)")
 $ F V F^(- 1) = "diag" \( B \, - B^(- sans(T)) \) . $ <reflect:graph-diagonalization>]

The relation between the coordinates is displayed in 5.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.425), [$(x_-,y_-)$])
  content((5.7, 1.425), [$(x_+,y_+)$])
  content((0, -0.19), [$(x_-+y_-, thin x_--y_-)$])
  content((5.7, -0.19), [$(x_++y_+, thin x_+-y_+)$])
  line((0.742, 1.425), (4.958, 1.425), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.85, 1.425), [$V$], anchor: "south", padding: 0.1176cm)
  line((0, 1.124), (0, 0.111), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, 0.6175), [$F$], anchor: "east", padding: 0.1176cm)
  line((5.7, 1.124), (5.7, 0.111), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((5.7, 0.6175), [$F$], anchor: "west", padding: 0.1176cm)
  line((1.333, -0.19), (4.367, -0.19), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.85, -0.19), [$"diag" (B,-B^(- sans(T) ))$], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 5: Pivoting the reflection exposes its two graph equations. The sums are the parity components of $x + y in E$; the differences are the parity components of $x - y in E^perp$. All four maps are exact invertible linear maps. ],
) <reflect:graph-figure>

After interleaving coordinates, $F$ is a direct sum of $r$ invertible scalar pair maps.
  Thus $p \( F \) = p \( F^(- 1) \) lt.eq 2 r$. Combining (8.18), (8.20), and (8.21),
  and using transpose and inverse symmetry, yields

#[#set math.equation(numbering: n => "(8.22)")
 $ d w = 2 p \( B \) = p #scale(x: 120%, y: 120%)[\(] "diag" \( B \, - B^(- sans(T)) \)
   #scale(x: 120%, y: 120%)[\)] lt.eq p \( V \) + 4 r lt.eq p \( R \) + 8 r = p \( R \) + 4 w . $ <reflect:lower-bound>]

#thm([Theorem 8.3.])[
  (Existence of a finite win).  #emph[There exist an invertible nonmonomial matrix $A$ of a finite width $q$,
    an integer $b gt.eq 2$, and a word on exactly $q^b$ coordinates implementing $A^(⊗ b)$ with monomials and
    fewer than $b q^(b - 1)$ calls to $A$.]
] <thm:finite-win>

#proof[
  If there were no finite win, the preceding construction and all its price bounds would apply for every fixed
    integer $d gt.eq 1$. Equations (8.16) and (8.22) would imply
  $ d w lt.eq (frac(3 d, 4) + 15 / 2) w . $
  Since $w > 0$, this says $d lt.eq 30$, contrary to choosing any fixed integer $d > 30$.
    This contradiction proves the theorem. ◻
]

By 8, the finite win of 28 supplies lengths $n_j arrow.r oo$ and exact circuits in the stated scalar-gate model
  whose sizes $s_j$ satisfy

$ frac(s_j, n_j log_2 n_j) arrow.r 0 . $

For every $c > 0$ and every integer cutoff $n_0 gt.eq 2$, some $j$ therefore has $n_j gt.eq
  n_0$ and $s_j < c n_j log_2 n_j$. This proves the precise negative alternative in 1.
  The conclusion is nonuniform existence along an unbounded sequence;
  the auxiliary price zero of monomials and the two specializations do not alter the scalar gate costs or the
  exactness of those circuits.

#bibliography("refs.bib", style: "ieee", title: [References])
