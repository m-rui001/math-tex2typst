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

#align(center)[#text(size: 16pt, weight: "bold")[Polynomial-Time Unitary Synthesis \
from a Boolean Oracle]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

A classical description of a quantum operation can be much longer than the register on which the operation acts.
  Oracle access offers a way to separate the size of that description from the work needed to use it.
  The unitary synthesis problem asks whether every operation on $n$ qubits can be performed in quantum polynomial
  time when a suitable classical description is available through coherent queries to a Boolean function.
  Aaronson and Kuperberg posed this question in 2007 [2] Section 7, Problem (4);
  Aaronson later highlighted it among open problems in quantum query complexity [1] Problem 6.

We give a positive answer to the constant-error formulation.
  One circuit, determined only by $n$, works for every $n$-qubit unitary after an appropriate Boolean oracle is
  chosen. The circuit uses polynomially many gates, qubits, and queries, and each query has polynomial length.
  The error bound holds for arbitrary input states, including states entangled with a reference system.

=== 1.1 Model and main result <model-and-main-result>

We use the fixed elementary gate set

$ H = 1 / sqrt(2) mat(delim: "(", 1, 1; 1, - 1) \, wide T = mat(delim: "(", 1, 0; 0, e^(i pi \/ 4)) \, wide
  T^dagger \, wide upright("CNOT") \, $

where $upright("CNOT") \| a \, b chevron.r = \| a \, a xor b chevron.r$.
  A Boolean oracle $f : { 0 \, 1 }^m arrow.r { 0 \, 1 }$ supplies the gate

#[#set math.equation(numbering: n => "(1.1)")
 $ O_f \| x \, b chevron.r = \| x \, b xor f \( x \) chevron.r . $ <intro:oracle>]

A circuit receives an $n$-qubit input and workspace initialized to zero.
  Its output channel is obtained by retaining $n$ designated qubits and tracing out the remaining qubits.

For a unitary $U$, write $cal(U) \( rho \) = U rho U^dagger$.
  Our convention for channel error is the full diamond norm: if $Phi$ is another channel on $n$ qubits, then

#[#set math.equation(numbering: n => "(1.2)")
 $ lr(bar.v.double Phi - cal(U) bar.v.double)_diamond.stroked.small =
   sup_rho
   lr(bar.v.double #scale(x: 120%, y: 120%)[\(] \( Phi - cal(U) \) ⊗ upright("id")_R
   #scale(x: 120%, y: 120%)[\)] \( rho \) bar.v.double)_1 \, wide lr(bar.v.double X bar.v.double)_1 =
   "Tr" sqrt(X^dagger X) \, $ <intro:diamond>]

where $R$ is an $n$-qubit reference register and $rho$ ranges over density operators on the input and $R$.
  Thus the norm in (1.2) has no factor of $1 \/ 2$.

#thm([Theorem 1.1.])[
  (Polynomial-time unitary synthesis).  #emph[There are a polynomial $p$ and a deterministic classical algorithm
    which, on input $1^n$ for any integer $n gt.eq 1$, outputs in time at most $p \( n \)$ a quantum oracle
    circuit $A_n$ with the following properties. The circuit uses the gates $H \, T \, T^dagger \,
    upright("CNOT")$ and a single Boolean oracle of input length $m \( n \) lt.eq p \( n \)$.
    Its total number of qubits, elementary gates, and oracle calls are each at most $p \( n \)$.
    For every unitary $U in U \( 2^n \)$ there is a function $f : { 0 \, 1 }^(m \( n \)) arrow.r { 0 \,
    1 }$ for which the output channel $Phi_(n \, f)$ of $A_n^(O_f)$ satisfies
$ lr(bar.v.double Phi_(n \, f) - cal(U) bar.v.double)_diamond.stroked.small lt.eq 1 / 2 . $

]
] <thm:main>

The quantifiers are essential. The circuit and its resource bounds depend only on $n$;
  the oracle may depend on $U$. There is no restriction on the truth-table size or classical circuit complexity of
  $f$, and no prescribed encoding of $U$ that the algorithm must use.
  The theorem is an existence statement about such an encoding.
  It does not give an efficient classical procedure for constructing the oracle from a description of $U$.

=== 1.2 Earlier work <earlier-work>

State synthesis provides a useful comparison. It asks for preparation of one specified state from a fixed input,
  whereas unitary synthesis must act coherently on every input.
  Irani, Natarajan, Nirkhe, Rao, and Yuen obtained one- and two-query state-synthesis results with polynomial
  space [11]. Rosenthal subsequently gave uniform polynomial-size state-synthesis circuits using one Boolean query
  when workspace may be discarded, and four queries when it must be returned to zero [15].
  These results do not immediately implement an arbitrary unitary:
  preparing a chosen column while retaining its input label does not erase that label coherently on a
  superposition of inputs.

For unitary synthesis, Rosenthal gave a running-time upper bound of order $2^(n \/ 2)$ up to polynomial factors,
  using an oracle suited to the target unitary [16]. In the other direction, Lombardi, Ma,
  and Wright proved a general one-query lower bound, which also rules out polynomially many parallel queries of
  polynomial length [12]. Dong, Lombardi, and Ma obtained explicit one-query separations for several structured
  families of unitaries [8]. These lower bounds leave open the use of multiple queries interleaved with quantum
  computation, as in the construction here.

Nehoran and Yuen recently showed that every unitary in dimension $N$ admits a constant-query implementation using
  three diagonal-phase queries, or six Boolean queries [14].
  The diagonal-phase version uses $O \( N log log \( N \/ epsilon \) \)$ query qubits for operator-norm error
  $epsilon$. For $N = 2^n$, this is exponential in the number of input qubits.
  Theorem 1 concerns polynomial total resources, including the width of the oracle interface.
  The distinction between query count and query width is therefore indispensable when comparing these results.

=== 1.3 The reduction <the-reduction>

The central construction replaces synthesis of a $d$-dimensional unitary by synthesis of one smaller,
  coherently controlled unitary. Each reduction removes a fraction at least $1 \/
  "poly" \( n \)$ of the dimension, so only polynomially many reductions are needed even when $d = 2^n$.
  The smaller synthesis circuit is used exactly once at each step.
  This last property prevents the recursion from producing an exponentially large circuit.

Here is the mechanism. After changes of basis built from permutations, diagonal signs, and Walsh transforms,
  write the current unitary as

$ V = mat(delim: "(", A, B; C, D) \, wide lr(bar.v.double D bar.v.double) lt.eq 3 / 4 \, $

where $D$ has the dimension to be removed. Random diagonal signs and Walsh transforms supply this contracting
  block. The needed norm estimate is proved by a Gaussian moment argument in Section 3.
  For a diagonal unitary $Z$ on the removed coordinates, close the lower output back into the lower input through
  $Z$. Solving the resulting linear equation gives

$ F = A + B Z \( I - D Z \)^(- 1) C . $

Conservation of norm makes $F$ unitary on the remaining coordinates.
  This is the familiar transfer-function construction for a unitary block matrix [9];
  our task is to turn it into a circuit reduction.

For that purpose we construct two maps, $cal(E)$ and $cal(R)$,
  from the original space into a register holding $Z$ together with a smaller state.
  They satisfy an approximate intertwining relation

$ tilde(F) cal(E) approx cal(R) V \, $

where $tilde(F)$ applies the corresponding $F$ controlled by the $Z$ register. Both maps are nearly isometric.
  They come from truncating the forward and backward geometric series associated with $\( I - D Z \)^(- 1)$.
  Averaging over a common phase cancels unequal degrees, and unitarity makes the remaining Gram-matrix sums
  telescope. The errors decay exponentially with the truncation length.

The implementability of these maps depends on their Fourier coefficients.
  We assign to each removed coordinate $i$ the frequency vector $\( 1 \, i \, dots.h \, i^L \)$,
  where $L$ is the truncation length. The Fourier frequency of a product of at most $L$ phases records a multiset
  of coordinates through its power sums. For an input on a removed coordinate,
  each nonzero coefficient records a multiset containing that coordinate.
  Inputs on the remaining coordinates contribute only at frequency zero,
  with one input column per output coordinate. Consequently every row of either coefficient matrix has at most $L$
  nonzero entries, although a column may be dense. This row bound lets a circuit coherently erase the input index
  after preparing a column. Amplitude amplification then converts the resulting scaled map into an approximation
  to the required encoding. The two encoders surround a single call to the smaller unitary, as shown in Figure 1.

The feedback identity, the matching forward and backward encodings,
  and the multiset argument are developed in Section 4. Section 5 proves the circuit implementation for a general
  nearly isometric matrix with few nonzero entries per row,
  and Section 6 assembles the recursion and bounds its resources.
  These intermediate constructions are stated separately so that their hypotheses and uses remain visible.

We first work with controlled single-qubit gates whose entries may be arbitrary functions of their control bits.
  Section 2 defines these programmable gates and the elementary operations they provide.
  Section 7 replaces every such gate by a polynomial-length word over the fixed gate set,
  read from one Boolean oracle. This compilation preserves relative phases between different control values.
  Throughout the proof, errors are measured on the subspace where the input workspace is zero;
  a final isometry estimate yields the diamond-norm guarantee in Theorem 1.

== 2 Controlled tasks and programmable slots <sec:slots>

We first construct circuits whose one-qubit gates can be selected from arbitrary tables.
  This separates the geometry of the circuit from the information about the target unitary.
  Section 7 will store finite approximations to these tables in one Boolean oracle.

All vector norms are Euclidean, and $lr(bar.v.double A bar.v.double)$ denotes the operator norm of a linear map
  $A$. Both $A^(*)$ and $A^dagger$ denote its adjoint. We never minimize this norm over scalar phases.
  For $1 lt.eq d lt.eq 2^n$, write

$ cal(H)_d = "span" { \| 0 chevron.r \, dots.h \, \| d - 1 chevron.r } subset.eq \( bb(C)^2 \)^(⊗ n) . $

The recursion must synthesize many unitaries coherently. Its input therefore includes a #emph[label register] with
  basis $\| lambda chevron.r$, $lambda in { 0 \, 1 }^t$, and its prescribed action is

$ cal(U) = sum_lambda \| lambda chevron.r chevron.l lambda \| ⊗ U_lambda \, wide U_lambda : cal(H)_d arrow.r
  cal(H)_d upright(" unitary") . $

Let $iota$ append all working qubits in state $\| 0 chevron.r$.
  A circuit $C$ solves this controlled task with error $delta$ if

#[#set math.equation(numbering: n => "(2.1)")
 $ lr(bar.v.double C iota - iota cal(U) bar.v.double) lt.eq delta . $ <slot:clean-error>]

Thus the estimate includes restoration of the working qubits, and is uniform over superpositions of labels.
  No behavior is prescribed outside the input subspace $"span" { \| lambda chevron.r } ⊗ cal(H)_d$.
  The same estimate holds after tensoring with the identity on any further register,
  because operator norm is unchanged by that operation.

A #emph[programmable slot] specifies one target qubit and an ordered list of other qubits as controls.
  Given a table of matrices $W_y in U \( 2 \)$, its action is

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(y in { 0 \, 1 }^c) \| y chevron.r chevron.l y \| ⊗ W_y \, $ <slot:definition>]

where $c$ is the number of controls. A #emph[circuit skeleton] specifies the registers, targets,
  and control lists of its slots, but leaves their tables unspecified.
  The tables may depend on the target unitaries. Their contents are not part of the skeleton that the uniform
  generator must produce. Reversing a skeleton reverses its slot order and replaces every table by its adjoint
  table. Slots are uniformly controlled one-qubit gates, or quantum multiplexors, in the terminology of [4].

Every diagonal unitary on $u gt.eq 1$ qubits uses a single slot:
  choose one of the qubits as target and put the two diagonal entries for each value of the other $u -
  1$ bits in the corresponding $2 times 2$ diagonal table entry.
  Additional labels can be included among the controls. In particular,
  reflections in subspaces spanned by specified computational basis states take one slot.
  A phase depending only on labels can be applied to a zero working qubit,
  or by scalar matrices on an existing target qubit.

#thm([Lemma 2.1.])[
  (State preparation).  #emph[For every $u gt.eq 1$ there is a skeleton of $u +
    1$ slots that maps $\| lambda chevron.r \| 0^u chevron.r$ to $\| lambda chevron.r \| a_lambda
    chevron.r$ for any prescribed family of unit vectors $a_lambda in bb(C)^(2^u)$.
    Its structure depends only on the register sizes.]
] <slot:preparation>

#proof[
  Fix a label and write $a = sum_x a_x \| x chevron.r$. For a binary prefix $p$, let $P \( p \) =
    sum_(x upright(" extending ") p) \| a_x \|^2$. Process the bits from first to last.
    At the next bit, controlled on the preceding prefix $p$, apply a real rotation whose first column is
  $ vec(sqrt(P \( p 0 \) \/ P \( p \)), sqrt(P \( p 1 \) \/ P \( p \))) quad upright("when ") P \( p \) > 0 . $
  Choose any rotation when $P \( p \) = 0$. After $u$ such slots the amplitude at $x$ is $\| a_x \|$.
    One diagonal slot then supplies the phases of the $a_x$, choosing arbitrary phases at zero entries.
    Including $lambda$ among the controls makes all these choices simultaneously.
    This is the usual conditional rotation construction for state preparation;
    here an entire uniformly controlled rotation is counted as one slot; see [13,4]. ◻
]

#thm([Lemma 2.2.])[
  (Basis permutations).  #emph[Any family of permutations of the $2^u$ computational basis states can be
    implemented with $5 u$ slots and $u$ temporary qubits that start and finish at zero.
    The skeleton is independent of the permutations.]
] <slot:permutation>

#proof[
  For the permutation $pi_lambda$, use $u$ slots to write its image bitwise into a temporary register:
  $ \| lambda chevron.r \| x chevron.r \| 0 chevron.r mapsto \| lambda chevron.r \| x chevron.r \|
    pi_lambda \( x \) chevron.r . $
  Each slot chooses either $I$ or the bit flip, controlled on $lambda$ and $x$.
    Next use $u$ slots to xor $pi_lambda^(- 1) \( y \)$ into the first register,
    controlled on the second register $y$. The two registers become $\| 0 chevron.r \| pi_lambda \( x \)
    chevron.r$. Swap them using three CNOTs per pair of bits. ◻
]

The same convention makes a Fourier transform inexpensive.
  We use the positive-phase transform, so that a frequency basis vector becomes its character in the computational
  basis.

#thm([Lemma 2.3.])[
  (Fourier transforms).  #emph[The unitary
$ \| x chevron.r mapsto 2^(- b \/ 2) sum_(z = 0)^(2^b - 1) e^(2 pi i x z \/ 2^b) \| z chevron.r $

 on $b gt.eq 1$ qubits has a uniformly generated skeleton with $O \( b \)$ slots.
   Products of such transforms have a number of slots linear in their total register width.]
] <slot:fourier>

#proof[
  Write the input integer as $x$. Process its bits in decreasing order of place value.
    At the bit of place value $2^(b - 1 - j)$, apply $H$, then a diagonal slot controlled on the still unprocessed
    lower bits. Give the state $1$ the additional phase that, together with its sign from $H$,
    makes the ratio of its two amplitudes equal to $e^(2 pi i x \/ 2^(b - j))$.
    Bits above the current bit contribute integral multiples of $2 pi$ to this expression,
    and are no longer needed as controls. The resulting bit is the Fourier output bit of place value $2^j$.
    A final reversal of bit order gives the stated transform.
    There are two slots per processed bit and $O \( b \)$ CNOTs for the reversal. ◻
]

These constructions retain the scalar phase of every label branch. This is essential:
  phases that would be irrelevant for one isolated unitary become relative phases when the same operation is
  controlled by a quantum register.

== 3 Producing a contracting block <sec:contraction>

The reduction will remove a small group of indices from the synthesis problem.
  For its geometric series to converge rapidly, the corresponding diagonal block of the unitary must have norm
  bounded away from one. We now obtain such a block using only permutations, diagonal signs,
  and Walsh–Hadamard transforms. All these transformations have short programmable-slot implementations.

We first record the matrix estimate needed to choose the signs.
  A #emph[Rademacher variable] takes the values $1$ and $- 1$ with equal probability.
  The following elementary moment argument is a finite-dimensional form of the noncommutative Khintchine estimate;
  see Tropp [17] Sections 6–7 for the Gaussian integration-by-parts and trace-product method.
  We include the proof with the constants used below.

#thm([Lemma 3.1.])[
  (A matrix sign estimate).  #emph[Let $L_1 \, dots.h \, L_q$ be Hermitian $h times h$ matrices,
    and let $epsilon_1 \, dots.h \, epsilon_q$ be independent Rademacher variables.
    Set $v = lr(bar.v.double sum_i L_i^2 bar.v.double)$. For every integer $a gt.eq 1$,
#[#set math.equation(numbering: n => "(3.1)")
 $ bb(E) lr(bar.v.double sum_(i = 1)^q epsilon_i L_i bar.v.double) lt.eq
   2 h^(1 \/ \( 2 a \)) sqrt(\( 2 a - 1 \) v) . $ <contract:sign-bound>]

]
] <contract:moment>

#proof[
  We first replace the signs by independent standard real Gaussians $g_i$ and write $X = sum_i g_i L_i$.
    Gaussian integration by parts, applied to this matrix polynomial, gives
  #[#set math.equation(numbering: n => "(3.2)")
   $ bb(E) "Tr" X^(2 a) = sum_(i = 1)^q sum_(l = 0)^(2 a - 2) bb(E) "Tr" #scale(x: 120%, y: 120%)[\(] L_i X^l L_i
     X^(2 a - 2 - l) #scale(x: 120%, y: 120%)[\)] . $ <contract:ibp>]
  Indeed, write the first factor of $X^(2 a)$ as $sum_i g_i L_i$, use $bb(E) \[ g_i P \( g \) \] =
    bb(E) \[ partial_i P \( g \) \]$, and differentiate each of the remaining $2 a - 1$ factors in turn.
  Put $m = 2 a - 2$. For a fixed Hermitian $X$, diagonalize it with real eigenvalues $lambda_j$.
    In this basis, for $m > 0$,
  $ "Tr" \( L_i X^l L_i X^(m - l) \) & = sum_(j \, k) \| \( L_i \)_(j k) \|^2 lambda_k^l lambda_j^(m - l)\
 & lt.eq sum_(j \, k) \| \( L_i \)_(j k) \|^2 (l / m \| lambda_k \|^m + frac(m - l, m) \| lambda_j \|^m) =
   "Tr" \( L_i^2 X^m \) . $
  The inequality is the weighted arithmetic–geometric mean inequality after taking absolute values.
    The last equality uses the symmetry $\| \( L_i \)_(j k) \|^2 = \| \( L_i \)_(k j) \|^2$ and the evenness of
    $m$. For $m = 0$ the same assertion is equality. Since $X^m$ is positive semidefinite and $sum_i L_i^2
    prec.curly.eq v I$, equation (3.2) implies
  $ bb(E) "Tr" X^(2 a) lt.eq \( 2 a - 1 \) v thin bb(E) "Tr" X^(2 a - 2) . $
  Iterating from $"Tr" I = h$ yields
  $ bb(E) "Tr" X^(2 a) lt.eq h \( 2 a - 1 \) ! ! thin v^a lt.eq h \( 2 a - 1 \)^a v^a . $
  Here $\( 2 a - 1 \) ! ! = 1 dot.op 3 dots.h.c \( 2 a - 1 \)$. Therefore
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E) lr(bar.v.double  bar.v.double) X lt.eq #scale(x: 120%, y: 120%)[\(] bb(E)
     lr(bar.v.double  bar.v.double) X^(2 a) #scale(x: 120%, y: 120%)[\)]^(1 \/ \( 2 a \)) lt.eq
     h^(1 \/ \( 2 a \)) sqrt(\( 2 a - 1 \) v) . $ <contract:gaussian-bound>]
  To return to signs, write $g_i = epsilon_i t_i$, where the $t_i = \|
    g_i \|$ are independent of the signs and have common mean $mu = sqrt(2 \/ pi)$. Conditional Jensen gives
  $ mu thin lr(bar.v.double sum_i epsilon_i L_i bar.v.double) lt.eq
    bb(E)_t lr(bar.v.double sum_i epsilon_i t_i L_i bar.v.double) . $
  Average over the signs, apply (3.3), and use $mu^(- 1) < 2$. ◻
]

Fix throughout the construction

#[#set math.equation(numbering: n => "(3.4)")
 $ M = 4096 \( n + 1 \)^2 \, wide r = 3 / 4 . $ <contract:parameters>]

For an integer $2 lt.eq d lt.eq 2^n$, let $q$ be the largest power of two not exceeding $d$, and define

#[#set math.equation(numbering: n => "(3.5)")
 $ s = max { 1 \, floor.l q \/ M floor.r } \, wide k = d - s . $ <contract:orders>]

We call the first $k$ indices #emph[ports] and the last $s$ indices #emph[internal indices]. Both groups are nonempty.

#thm([Proposition 3.2.])[
  (A block of uniformly small norm).  #emph[For every unitary $U$ on $bb(C)^d$,
    there are unitaries $P_(upright(L))$ and $P_(upright(R))$ on $bb(C)^d$ such that
#[#set math.equation(numbering: n => "(3.6)")
 $ V = P_(upright(L)) U P_(upright(R)) = mat(delim: "(", A, B; C, D) \, wide
   lr(bar.v.double  bar.v.double) D lt.eq r \, $ <contract:block-form>]

 where the block sizes are $k \, s$ from (3.5). The transformations $P_(upright(L)) \,
   P_(upright(R))$ and their inverses have implementations using $O \( n \)$ programmable slots and $O \( n \)$
   clean working qubits, with a structure determined by $n \, d$.
   The same structure works simultaneously for any family $U_lambda$,
   using the label $lambda$ as an additional control.]
] <contract:block>

#proof[
  If $s = 1$, the last column of $U$ has an entry of modulus at most $1 \/ sqrt(d)$.
    A row permutation moves this entry to the last position. The resulting one-dimensional block satisfies
    $lr(bar.v.double  bar.v.double) D lt.eq 1 \/ sqrt(d) < 3 \/ 4$,
    and the permutation has the claimed slot implementation by Lemma 3.
  Suppose $s > 1$. Let $M_0$ be the last-by-last $q times q$ submatrix of $U$; it is a contraction.
    Set $H_q = H^(⊗ log_2 q)$, and let $W$ consist of its last $s$ columns.
    We will choose diagonal sign matrices $E_1 \, E_2$ on $bb(C)^q$ and use $H_q E_1$ on the left and $E_2
    H_q$ on the right, acting as the identity on the remaining $d - q$ indices. The resulting internal block is
  #[#set math.equation(numbering: n => "(3.7)")
   $ D = W^(*) E_1 C' \, wide C' = M_0 E_2 W . $ <contract:D-signs>]
  We choose $E_2$ first to bound the entries of $C'$, then choose $E_1$ to bound the operator norm of $D$.
  For independent signs in $E_2$, each entry of $C'$ is a sign sum $sum_j epsilon_j alpha_j$ with $sum_j \|
    alpha_j \|^2 lt.eq 1 \/ q$. For completeness, a real sign sum with squared coefficient sum at most $1 \/
    q$ satisfies
  $ bb(E) exp (t sum_j epsilon_j a_j) = product_j cosh \( t a_j \) lt.eq exp \( t^2 \/ \( 2 q \) \) . $
  Markov’s inequality, optimized over $t$, bounds its two-sided tail at $u$ by $2 e^(- q u^2 \/ 2)$.
    Applying this to the real and imaginary parts shows
  $ Pr (lr(|sum_j epsilon_j alpha_j|) gt.eq u) lt.eq 4 e^(- q u^2 \/ 4) . $
  There are $q s$ entries. With $u = 4 sqrt(\( n + 1 \) \/ q)$, the union-bound failure probability is at most
  $ 4 q s e^(- 4 \( n + 1 \)) lt.eq 4 dot.op 2^(2 n) e^(- 4 \( n + 1 \)) < 1 . $
  We may therefore fix $E_2$ such that every entry of $C'$ has modulus at most $4 sqrt(\( n + 1 \) \/ q)$.
    Also $lr(bar.v.double C' bar.v.double) lt.eq 1$.
  Let $h_i \, c_i$ be row $i$ of $W \, C'$, respectively, regarded as row vectors. Then
  $ lr(bar.v.double h_i bar.v.double)^2 = s \/ q \, wide lr(bar.v.double c_i bar.v.double)^2 lt.eq v :=
    16 s \( n + 1 \) \/ q . $
  Choosing independent signs $epsilon_i$ for $E_1$, write
  $ D = sum_i epsilon_i h_i^(*) c_i \, wide L_i = mat(delim: "(", 0, h_i^(*) c_i; c_i^(*) h_i, 0) . $
  The two diagonal blocks of $sum_i L_i^2$ satisfy
  $ sum_i lr(bar.v.double c_i bar.v.double)^2 h_i^(*) h_i prec.curly.eq v W^(*) W = v I_s \, wide
    sum_i lr(bar.v.double h_i bar.v.double)^2 c_i^(*) c_i = s / q C' ""^(*) C' prec.curly.eq s /
    q I_s prec.curly.eq v I_s . $
  The norm of $sum_i epsilon_i L_i$ equals $lr(bar.v.double  bar.v.double) D$.
    Apply Lemma 5 with $h = 2 s$ and $a = n + 1$. Since $\( 2 s \)^(1 \/ \( 2 n + 2 \)) lt.eq sqrt(2)$, we obtain
  $ bb(E) lr(bar.v.double  bar.v.double) D lt.eq 2 sqrt(2) sqrt(2 \( n + 1 \) thin 16 s \( n + 1 \) \/ q) =
    16 \( n + 1 \) sqrt(s \/ q) lt.eq 1 / 4 . $
  The last inequality uses $s lt.eq q \/ M$. Some choice of $E_1$ consequently satisfies
    $lr(bar.v.double  bar.v.double) D lt.eq 1 \/ 4$, which is more than required.
  It remains to check the circuit structure. A permutation on the $n$-bit index register moves the last $q$ valid
    indices to the first $q$ valid indices, an aligned $q$-element block.
    On that block, $H_q$ uses at most $n$ Hadamard slots, controlled on the remaining bits;
    each diagonal sign matrix uses one diagonal slot. Undo the permutation afterward.
    Lemma 3 supplies clean $O \( n \)$-slot implementations of the permutations.
    All operations preserve the valid $d$-dimensional subspace and are extended unitarily to unused index states.
    Labels change only the row permutation or diagonal-sign tables,
    so the same slot structure works for every $U_lambda$. ◻
]

The random signs are used only to prove that suitable tables exist.
  Each label may use its own choices; the resulting slot circuit is deterministic.
  The size of the removed block is large enough to make recursion short.

#thm([Lemma 3.3.])[
  (Dimension decrease).  #emph[For the parameters in (3.5), $s gt.eq d \/ \( 4 M \)$.
    Starting at any $d lt.eq 2^n$ and repeatedly replacing $d gt.eq 2$ by $d - s$, one reaches $d = 1$ in fewer than
#[#set math.equation(numbering: n => "(3.8)")
 $ J = 8 M \( n + 1 \) $ <contract:J>]

 steps.]
] <contract:depth>

#proof[
  If $q \/ M gt.eq 2$, then $s = floor.l q \/ M floor.r gt.eq q \/ \( 2 M \) > d \/ \( 4 M \)$, because $d < 2 q$.
    If $q \/ M < 2$, then $s = 1$ and $d < 2 q < 4 M$, with the same conclusion.
    Thus every nontrivial step multiplies the order by at most $1 - 1 \/ \( 4 M \)$.
    If there were $J$ such steps, their final order would be at most
  $ 2^n \( 1 - 1 \/ \( 4 M \) \)^J lt.eq 2^n e^(- J \/ \( 4 M \)) = 2^n e^(- 2 \( n + 1 \)) < 1 \, $
  contrary to its being a positive integer. ◻
]

== 4 Fourier fields for a smaller unitary <sec:fields>

Let $d = k + s lt.eq 2^n$, with $k \, s gt.eq 1$, and suppose that

#[#set math.equation(numbering: n => "(4.1)")
 $ V = mat(delim: "(", A, B; C, D) in U \( d \) \, wide lr(bar.v.double D bar.v.double) lt.eq r < 1 \, quad
   r gt.eq 0 . $ <fields:block>]

The first $k$ coordinates are the ports and the last $s$ coordinates are internal.
  We will associate to $V$ a family of $k$-dimensional unitaries $F \( z \)$ and two nearly isometric maps from
  $bb(C)^d$ into the space of port-valued functions of $z$.
  These maps intertwine $V$ with the controlled application of $F \( z \)$.
  Their Fourier coefficients will have few nonzero entries in each row, which makes the maps implementable by slots.

=== 4.1 Closing the internal coordinates <closing-the-internal-coordinates>

For the moment let $Z$ be any diagonal unitary of order $s$.
  Given a port input $u in bb(C)^k$, feed the internal output $v in
  bb(C)^s$ back into the internal input through $Z$. If $y in bb(C)^k$ is the port output,
  the equation $V \( u \, Z v \) = \( y \, v \)$ becomes

$ y = A u + B Z v \, wide v = C u + D Z v . $

Since $lr(bar.v.double D Z bar.v.double) < 1$, the second equation has the unique solution $v = X u$,
  and the first then gives $y = F u$, where

#[#set math.equation(numbering: n => "(4.2)")
 $ X = \( I - D Z \)^(- 1) C \, wide F = A + B Z X \, wide E = vec(I_k, Z X) \, wide O =
   vec(F, X) . $ <fields:feedback>]

Thus $E u$ and $O u$ collect the full input and output of $V$ after the internal coordinates have been closed.
  For a scalar phase $Z = z I$, this is the standard transfer function of a unitary block matrix;
  see [9] Section 3. The same conservation of norm proves unitarity with independently chosen diagonal phases.

#thm([Lemma 4.1.])[
  #emph[For the unitary block matrix in (4.1) and any diagonal unitary $Z$, the matrix $F$ in (4.2) is unitary. If
#[#set math.equation(numbering: n => "(4.3)")
 $ R = O F^(*) = vec(I_k, Y) \, wide Y = X F^(*) \, $ <fields:R>]

 then
#[#set math.equation(numbering: n => "(4.4)")
 $ F E^(*) = R^(*) V \, wide Y = \( I - Z^(*) D^(*) \)^(- 1) Z^(*) B^(*) . $ <fields:exact>]

]
] <fields:unitary>

#proof[
  The definitions give $V E = O$. Consequently,
  $ I_k + X^(*) X = E^(*) E = O^(*) O = F^(*) F + X^(*) X \, $
  so $F^(*) F = I_k$. Because $F$ is square, it is unitary.
    Thus $O F^(*)$ has the stated top block, and $V^(*) R = E F^(*)$.
    Taking adjoints proves the first identity in (4.4). Comparing the bottom blocks of $V^(*) R = E F^(*)$ gives
  $ B^(*) + D^(*) Y = Z Y . $
  Multiplication by $Z^(*)$ and $lr(bar.v.double Z^(*) D^(*) bar.v.double) lt.eq r < 1$ give the second identity. ◻
]

=== 4.2 Truncation and averaging <truncation-and-averaging>

Fix an integer truncation length $L gt.eq 1$, and set

#[#set math.equation(numbering: n => "(4.5)")
 $ b = n L + ceil.l log_2 \( L + 1 \) ceil.r \, wide cal(G) = \( bb(Z) \/ \( 2^b \) \)^(L + 1) . $ <fields:parameters>]

For $w \, z in cal(G)$, write

$ chi_w \( z \) = exp \( 2 pi i thin w dot.op z \/ 2^b \) . $

Number the internal coordinates by $i = 1 \, dots.h \, s$ and put

#[#set math.equation(numbering: n => "(4.6)")
 $ v_i = \( 1 \, i \, i^2 \, dots.h \, i^L \) in cal(G) \, wide Z \( z \) =
   "diag" #scale(x: 120%, y: 120%)[\(] chi_(v_1) \( z \) \, dots.h \,
   chi_(v_s) \( z \) #scale(x: 120%, y: 120%)[\)] . $ <fields:phases>]

The constant first coordinate of $v_i$ gives all diagonal entries of $Z \( z \)$ a common phase when the first
  coordinate of $z$ varies. Averaging that phase will separate terms of different lengths in the truncated series.
  The remaining coordinates record power sums: the Fourier frequency of a product of at most $L$ phases will
  determine its multiset of internal indices, as proved in Proposition 10.
  These two properties will give the norm bound and the row bound, respectively.

Apply Lemma 8 at each $z$ to obtain $F \( z \) \, E \( z \) \, R \( z \)$.
  Truncate the two Neumann expansions by defining

#[#set math.equation(numbering: n => "(4.7)")
 $ E_L \( z \) = vec(I_k, sum_(ell = 0)^(L - 1) Z \( D Z \)^ell C) \, wide R_L \( z \) =
   vec(I_k, sum_(ell = 0)^(L - 1) \( Z^(*) D^(*) \)^ell Z^(*) B^(*)) . $ <fields:truncations>]

Here and below, products containing $Z$ are evaluated at the same $z$.
  Since every block of a unitary has norm at most one,

#[#set math.equation(numbering: n => "(4.8)")
 $ lr(bar.v.double E_L \( z \) - E \( z \) bar.v.double) \, med
   lr(bar.v.double R_L \( z \) - R \( z \) bar.v.double) lt.eq tau \, wide tau = frac(r^L, 1 - r) . $ <fields:tails>]

Define the field maps $cal(E)_L \, cal(R)_L : bb(C)^d arrow.r bb(C)^(cal(G)) ⊗ bb(C)^k$ by

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(E)_L x = 1 / sqrt(\| cal(G) \|) sum_(z in cal(G)) \| chevron.r z ⊗ E_L \( z \)^(*) x \, wide cal(R)_L x =
   1 / sqrt(\| cal(G) \|) sum_(z in cal(G)) \| chevron.r z ⊗ R_L \( z \)^(*) x . $ <fields:maps>]

Although a single matrix $E_L \( z \)^(*)$ need not be a contraction,
  averaging its squared norm over $z$ nearly preserves the norm of every input.

#thm([Proposition 4.2.])[
  #emph[For either $cal(T) = cal(E)_L$ or $cal(T) = cal(R)_L$,
#[#set math.equation(numbering: n => "(4.10)")
 $ \( 1 - r^(2 L) \) I_d med lt.eq med cal(T)^(*) cal(T) med lt.eq med I_d . $ <fields:gram-bound>]

 In addition, let $tilde(F)$ apply $F \( z \)$ to the port register, controlled on $z$. Then
#[#set math.equation(numbering: n => "(4.11)")
 $ lr(bar.v.double tilde(F) cal(E)_L - cal(R)_L V bar.v.double) lt.eq 2 tau . $ <fields:intertwine>]

]
] <fields:gram>

#proof[
  The Gram matrix of $cal(E)_L$ is the average of $E_L E_L^(*)$.
    Fix the last $L$ coordinates of $z$ and vary its first coordinate.
    Writing $Z = omega Z'$, the scalar $omega$ ranges uniformly over the $2^b$-th roots of unity,
    while $Z'$ stays fixed. The summand of index $ell$ in the lower block of $E_L$ is
  $ omega^(ell + 1) Z' W^ell C \, wide W = D Z' . $
  The degrees $0 \, 1 \, dots.h \, L$ are distinct modulo $2^b$.
    Their orthogonality under averaging shows that the port block of $bb(E)_omega E_L E_L^(*)$ is $I_k$,
    that its off-diagonal blocks vanish, and that its internal block is
  $ Z' (sum_(ell = 0)^(L - 1) W^ell C C^(*) \( W^(*) \)^ell) \( Z' \)^(*) . $
  Unitarity of $V$ gives $C C^(*) = I - D D^(*) = I - W W^(*)$. Therefore the sum telescopes:
  #[#set math.equation(numbering: n => "(4.12)")
   $ sum_(ell = 0)^(L - 1) W^ell \( I - W W^(*) \) \( W^(*) \)^ell = I - W^L \( W^(*) \)^L . $ <fields:telescope>]
  As $lr(bar.v.double W bar.v.double) lt.eq r$, the internal block lies between $\( 1 - r^(2 L) \) I_s$ and $I_s$.
    Averaging the remaining coordinates of $z$ preserves these inequalities.
  For $R_L$, set $W = \( Z' \)^(*) D^(*)$ and $C_0 = \( Z' \)^(*) B^(*)$.
    Its lower summand is $omega^(- \( ell + 1 \)) W^ell C_0$.
    The negative degrees are again distinct from each other and from zero. Now
  $ C_0 C_0^(*) = \( Z' \)^(*) \( I - D^(*) D \) Z' = I - W W^(*) \, $
  so the internal Gram block is exactly the sum in (4.12), with these choices of $W \, C_0$.
    This proves (4.10) for both maps.
  Finally, Lemma 8 and (4.8) give, pointwise,
  $ lr(bar.v.double F \( z \) E_L \( z \)^(*) - R_L \( z \)^(*) V bar.v.double) lt.eq
    lr(bar.v.double E_L \( z \) - E \( z \) bar.v.double) + lr(bar.v.double R_L \( z \) - R \( z \) bar.v.double)
    lt.eq 2 tau . $
  Apply this bound to a fixed vector and average its squared norm over $z$ to obtain (4.11). ◻
]

=== 4.3 Few possible input indices at each Fourier frequency <few-possible-input-indices-at-each-fourier-frequency>

The norm bounds supply nearly isometric maps. To implement them,
  we also need a restriction on their matrix entries. Use the Fourier basis

$ \| hat(w) chevron.r = 1 / sqrt(\| cal(G) \|) sum_(z in cal(G)) chi_w \( z \) \| chevron.r z \, wide w in cal(G) \, $

for the first output register of either field map. A row of the resulting matrix is indexed by a frequency $w$ and
  a port $a in { 1 \, dots.h \, k }$; its columns are the $d$ input coordinates.

#thm([Proposition 4.3.])[
  #emph[In these Fourier coordinates, every row of $cal(E)_L$ and of $cal(R)_L$ has at most $L$ nonzero entries.]
] <fields:sparsity>

#proof[
  First, the sum of the vectors $v_i$ over any multiset of at most $L$ internal indices determines that multiset
    uniquely. Indeed, every coordinate of such a sum, regarded as an ordinary nonnegative integer,
    is at most $L 2^(n L) < 2^b$, so reduction modulo $2^b$ loses no information.
    Its first coordinate records the length $m$, and the next $m$ coordinates record the power sums $p_j =
    sum_(t = 1)^m i_t^j$. The elementary symmetric polynomials are recovered successively from Newton’s identities
  $ e_0 = 1 \, wide j e_j = sum_(t = 1)^j \( - 1 \)^(t - 1) e_(j - t) p_t quad \( 1 lt.eq j lt.eq m \) . $
  These identities follow by taking the logarithmic derivative of $product_(t = 1)^m \( 1 + i_t x \) =
    sum_(j = 0)^m e_j x^j$ and comparing coefficients. Consequently the monic polynomial $T^m - e_1 T^(m - 1) +
    dots.h.c + \( - 1 \)^m e_m$, and hence its multiset of roots, is determined.
  An input port contributes only to frequency zero and the same output port.
    For an internal input $i$, the lower columns of $E_L^(*)$ are sums of
  $ C^(*) Z^(*) \, quad C^(*) Z^(*) D^(*) Z^(*) \, quad dots.h \, $
  whereas those of $R_L^(*)$ are sums of
  $ B Z \, quad B Z D Z \, quad B Z D Z D Z \, quad dots.h . $
  In both cases the rightmost diagonal factor acts on input $i$.
    Thus every monomial contains the phase belonging to $i$, and its frequency is the signed sum of the $v_j$ over
    a multiset of between $1$ and $L$ internal indices containing $i$.
    The sign is negative for $cal(E)_L$ and positive for $cal(R)_L$.
    For example, the second displayed term on the $R$ side has entry
  $ \( B Z D Z \)_(a i) = sum_j B_(a j) D_(j i) thin chi_(v_j + v_i) \( z \) . $
  Fix a nonzero frequency and an output port. For $cal(E)_L$,
    negate the frequency first to recover the corresponding positive tuple sum.
    By the uniqueness just proved, all its contributing monomials have the same multiset of internal indices.
    Only indices belonging to that multiset can therefore occur as nonzero input columns.
    There are at most $L$ of them. The ordering of indices in a monomial can change its coefficient but cannot
    enlarge this column set. No internal monomial has frequency zero,
    since its first coordinate has absolute value between $1$ and $L$ modulo $2^b$.
    At frequency zero the single port column gives the required bound as well. ◻
]

The role of the power-sum phases is now explicit: a frequency remembers an unordered list of internal visits,
  so it permits only a short list of possible input indices.
  The next section uses exactly this list to erase the input register coherently.

== 5 Implementing the field encodings <sec:encoders>

A matrix with few nonzero entries in each row admits a useful slot construction.
  First prepare each column while retaining its input index.
  Then, conditional on the output row, erase that index with an amplitude determined only by the maximum row size.
  Two reflections amplify the result. When the matrix is nearly isometric,
  all its singular directions require almost the same amplification angle.
  The reflection argument is amplitude amplification [6] Section 2.
  Preparing states to realize a matrix as a block of a larger unitary is also a standard block-encoding method
  [10] Lemmas 47–48. Here arbitrary table-controlled column preparation permits us to use sparsity only in the rows.

=== 5.1 A construction for a nearly isometric matrix <a-construction-for-a-nearly-isometric-matrix>

Let $cal(U)$ be a set of rows encoded in a $w$-qubit register, and let $T : bb(C)^d arrow.r
  bb(C)^(cal(U))$ have entries $a_(u i)$, where $d lt.eq 2^n$. Fix an integer $L gt.eq 1$.
  Suppose that every row has at most $L$ nonzero entries and

#[#set math.equation(numbering: n => "(5.1)")
 $ \( 1 - epsilon \) I_d lt.eq T^(*) T lt.eq I_d \, wide L gt.eq 1 \, quad 0 lt.eq epsilon < 1 . $ <encode:assumptions>]

All these data may depend on a label register, with the same dimensions and bounds for every label.
  The construction below treats labels as controls.

Extend the $n$-qubit input index by $h = ceil.l log_2 \( L + 1 \) ceil.r$ high bits,
  and add the row register and two one-bit flags. Let $iota$ embed $bb(C)^d$ with all these new qubits zero.
  Let $dotless.j$ embed $bb(C)^(cal(U))$ with the extended index zero and both flags equal to one.
  Write $P_0 = iota iota^(*)$ and $Q = dotless.j dotless.j^(*)$ for the corresponding projections.
  Thus $Q$ allows any valid row, while $P_0$ allows any of the $d$ input indices.
  We call the range of $Q$ the #emph[good subspace].

#thm([Lemma 5.1.])[
  #emph[Under (5.1), an exact-slot unitary $sans(U)_T$ satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ lr(bar.v.double sans(U)_T iota - dotless.j T bar.v.double) lt.eq 5 epsilon . $ <encode:generic-error>]

 It uses $O \( L \( n + w + h \) \)$ slots and $w + h + 2$ fresh qubits.
   Its slot structure depends only on the register sizes, $d$, and $L$,
   and it works coherently for any family of matrices indexed by labels.]
] <encode:row-sparse>

#proof[
  Set
  #[#set math.equation(numbering: n => "(5.3)")
   $ theta = frac(pi, 4 L + 2) \, wide t_0 = sin theta . $ <encode:angle>]
  We first construct a unitary $sans(B)$ with the prescribed block
  #[#set math.equation(numbering: n => "(5.4)")
   $ dotless.j^(*) sans(B) iota = t_0 T . $ <encode:block>]
  For each valid input $i$, the column norm is at most one.
    Conditional on $i$, use Lemma 2 to prepare the row register and first flag in a unit vector whose flag-one part is
  $ sum_(u in cal(U)) a_(u i) \| chevron.r u \| 1 chevron.r . $
  The remaining squared norm is placed in the flag-zero subspace. The input index is unchanged during this preparation.
  For each row $u$, choose a list $I_u$ of exactly $L$ distinct extended indices containing every $i$ with
    $a_(u i) eq.not 0$. Such lists exist because the extended index space has dimension $2^(n + h) gt.eq
    2^n \( L + 1 \) > L$. Padding indices need not be valid inputs.
    Conditional on the row, apply the inverse of a state preparation for
  $ 1 / sqrt(L) sum_(i in I_u) \| chevron.r i $
  on the extended index register. Its matrix element from any $i in I_u$ to zero is $1 \/ sqrt(L)$.
    Finally rotate the second flag so that its amplitude at one is $t_0 sqrt(L)$.
    This is possible because $t_0 sqrt(L) lt.eq theta sqrt(L) lt.eq 1$.
    Prescribe arbitrary unitary extensions for invalid indices and rows.
    Projecting onto index zero and flags one now multiplies each relevant $a_(u i)$ by
    $\( 1 \/ sqrt(L) \) \( t_0 sqrt(L) \) = t_0$, proving (5.4). All three operations together form $sans(B)$.
  Starting with $sans(B)$, perform $L$ rounds of
  #[#set math.equation(numbering: n => "(5.5)")
   $ \( 2 sans(B) P_0 sans(B)^(*) - I \) \( I - 2 Q \) . $ <encode:round>]
  These are implementable with $sans(B)$, its inverse, and diagonal reflections.
    We verify their action on every singular direction of $T$.
    Let $v_j$ be an orthonormal basis of right singular vectors and write
  $ T v_j = sigma_j e_j \, wide sqrt(1 - epsilon) lt.eq sigma_j lt.eq 1 \, $
  where the $e_j$ are orthonormal. In this calculation identify the input and output spaces with their embeddings
    $iota$ and $dotless.j$. By (5.4),
  #[#set math.equation(numbering: n => "(5.6)")
   $ sans(B) v_j = sin beta_j thin e_j + cos beta_j thin e'_j \, wide beta_j = arcsin \( t_0 sigma_j \) \,
     $ <encode:plane>]
  for a unit vector $e'_j$ in the kernel of $Q$. The $e'_j$ are mutually orthogonal:
    this follows by taking pairwise inner products in (5.6), using unitarity of $sans(B)$ and orthogonality of the
    $e_j$. Each $e'_j$ is also orthogonal to every $e_i$.
  For completeness, both reflections preserve the plane spanned by $e_j \, e'_j$.
    The first reflection is about the range of $sans(B) P_0$,
    which is spanned by the mutually orthogonal vectors $sans(B) v_i$.
    Within the $j$th plane it is therefore reflection about $sin beta_j thin e_j + cos beta_j thin e'_j$;
    the second reflection changes the sign of $e_j$ and fixes $e'_j$. Their product in the order (5.5) sends
  $ sin alpha thin e_j + cos alpha thin e'_j quad upright("to") quad sin \( alpha + 2 beta_j \) e_j +
    cos \( alpha + 2 beta_j \) e'_j . $
  After $L$ rounds, the angle is $\( 2 L + 1 \) beta_j$. As $\( 2 L + 1 \) theta = pi \/ 2$,
    the distance of this vector from $sigma_j e_j$ is at most
  $ \( 2 L + 1 \) \( theta - beta_j \) + \( 1 - sigma_j \) & lt.eq \( 2 L + 1 \) thin 2
    t_0 \( 1 - sigma_j \) + \( 1 - sigma_j \)\
 & lt.eq \( pi + 1 \) \( 1 - sigma_j \) lt.eq 5 epsilon . $
  Here $t_0 lt.eq 1 \/ 2$, so the derivative of $arcsin$ is at most $2$ on $\[ 0 \, t_0 \]$, and $1 -
    sigma_j lt.eq 1 - sqrt(1 - epsilon) lt.eq epsilon$. The error vectors lie in mutually orthogonal planes.
    The same bound therefore holds in operator norm on the whole input space, proving (5.2).
  The first preparation uses $O \( w + 1 \)$ slots and the second $O \( n + h \)$,
    so $sans(B)$ uses $O \( n + w + h \)$ slots. The complete circuit contains $2 L +
    1$ occurrences of $sans(B)$ or $sans(B)^(*)$ and $2 L$ diagonal reflections.
    A diagonal reflection is one slot, as explained in Section 2. No additional workspace is needed.
    All prescriptions can be made separately for each label using the same slot positions and controls.
    Since the resulting maps are block diagonal in the labels,
    the bounds hold for coherent superpositions of labels as well. ◻
]

=== 5.2 Applying the construction to the Fourier fields <applying-the-construction-to-the-fourier-fields>

In the preceding section, a row is a frequency and a port. Let

#[#set math.equation(numbering: n => "(5.7)")
 $ K = b \( L + 1 \) \, wide h = ceil.l log_2 \( L + 1 \) ceil.r . $ <encode:register-size>]

Encode the frequency in $K$ qubits and the port in $n$ qubits, using the first $k$ port states.
  The two field maps have the same row space and therefore use the same output embedding $dotless.j$:
  extended input index zero, both flags one, and a valid port.
  This shared layout will allow the second encoding to be reversed after the recursive call.

#thm([Proposition 5.2.])[
  #emph[Under the hypotheses and definitions of Section 4, there are exact-slot unitaries $sans(U)_E \,
    sans(U)_R$ such that
#[#set math.equation(numbering: n => "(5.8)")
 $ lr(bar.v.double sans(U)_E iota - dotless.j cal(E)_L bar.v.double) lt.eq 5 r^(2 L) \, wide
   lr(bar.v.double sans(U)_R iota - dotless.j cal(R)_L bar.v.double) lt.eq 5 r^(2 L) . $ <encode:field-error>]

 Each uses $O #scale(x: 120%, y: 120%)[\(] L \( K + n + h \) + K #scale(x: 120%, y: 120%)[\)]$ slots and $K + n +
   h + 2$ fresh qubits, with slot structure independent of $V$.
   The construction works coherently with any additional label register.]
] <encode:implementation>

#proof[
  Write either field map in Fourier coordinates. Proposition 10 gives at most $L$ nonzero entries in each row,
    and Proposition 9 supplies (5.1) with $epsilon = r^(2 L)$.
    Apply Lemma 11, taking $w = K + n$, to obtain the corresponding coefficient map with error at most $5
    r^(2 L)$. Then apply the positive Fourier transform to each of the $L + 1$ frequency factors,
    so that $\| chevron.r w$ becomes $\| cal(G) \|^(- 1 \/ 2) sum_z chi_w \( z \) \| chevron.r z$.
    The same physical register now holds the phase label $z$, rather than the Fourier frequency $w$.
    Lemma 4 implements these transforms using $O \( K \)$ slots.
    They preserve the range of $Q$, because every frequency is allowed there and the index, flags,
    and port are unchanged. Thus they convert the coefficient map into the field map in the same embedding
    $dotless.j$, while preserving the error norm on the full space.
    Their addition gives (5.8) and the stated resource bounds. ◻
]

== 6 Assembling the recursion <sec:recursion>

The two field encodings now reduce synthesis of $V$ to synthesis of the smaller controlled unitary $F \( z \)$.
  The reduction uses the smaller circuit exactly once. This fact keeps the total circuit size polynomial even
  though the number of recursion levels grows with $n$.

#thm([Lemma 6.1.])[
  (One synthesis step).  #emph[Let $V$ be a unitary on $bb(C)^(k + s)$ in the block form of Proposition 6,
    and let $lr(bar.v.double  bar.v.double) D lt.eq r < 1$. Use the fields and encoders of Sections 4 and 5 with
    truncation length $L$. Suppose a circuit synthesizes the family of $k$-dimensional unitaries $F \( z \)$,
    controlled by $z$, with clean-workspace operator norm error $delta'$.
    Then one use of that circuit, preceded by $sans(U)_E$ and followed by $sans(U)_R^(*)$,
    synthesizes $V$ with clean-workspace error at most
#[#set math.equation(numbering: n => "(6.1)")
 $ delta' + frac(2 r^L, 1 - r) + 10 r^(2 L) . $ <rec:step-error>]

 The assertion also holds coherently for a family $V_lambda$,
   with the smaller circuit controlled by both $lambda$ and $z$.]
] <rec:step>

#proof[
  Let $iota$ embed the current index space into the full register layout by initializing all working qubits to
    zero. Include the fresh working qubits of the smaller circuit in this definition.
    Let $dotless.j$ embed the field space $bb(C)^(cal(G)) ⊗ bb(C)^k$ into the encoder’s good subspace,
    again with the smaller circuit’s fresh workspace zero. Write $sans(C)$ for the smaller synthesis circuit
    acting on its target, control, and fresh working registers, and as the identity on the remaining registers.
    Its approximation guarantee implies
  #[#set math.equation(numbering: n => "(6.2)")
   $ lr(bar.v.double sans(C) dotless.j - dotless.j tilde(F) bar.v.double) lt.eq delta' . $ <rec:restricted-error>]
  Indeed, the good subspace has a valid port index, and $tilde(F)$ applies $F \( z \)$ with the phase register as
    control.
  Put $tau = r^L \/ \( 1 - r \)$. Proposition 12 gives
  $ lr(bar.v.double sans(U)_E iota - dotless.j cal(E)_L bar.v.double) lt.eq 5 r^(2 L) \, wide
    lr(bar.v.double sans(U)_R iota - dotless.j cal(R)_L bar.v.double) lt.eq 5 r^(2 L) . $
  The field maps are contractions by Proposition 9, and their intertwining bound is (4.11). Consequently,
  $ & lr(bar.v.double sans(C) sans(U)_E iota - sans(U)_R iota V bar.v.double)\
 & quad lt.eq lr(bar.v.double sans(C) \( sans(U)_E iota - dotless.j cal(E)_L \) bar.v.double) +
   lr(bar.v.double \( sans(C) dotless.j - dotless.j tilde(F) \) cal(E)_L bar.v.double)\
 & wide quad + lr(bar.v.double dotless.j \( tilde(F) cal(E)_L - cal(R)_L V \) bar.v.double) +
   lr(bar.v.double \( dotless.j cal(R)_L - sans(U)_R iota \) V bar.v.double)\
 & quad lt.eq 5 r^(2 L) + delta' + 2 tau + 5 r^(2 L) . $
  Multiplication by $sans(U)_R^(*)$ proves (6.1). This calculation invokes the smaller circuit’s approximation
    only on the ideal field-map output, whose norm is at most one.
    Any component of the actual encoded state outside the good subspace is covered by the first error term and is
    not enlarged by $sans(C)$.
  For additional labels $lambda$, all maps are block diagonal in the label basis and all bounds are uniform over
    the labels. Their operator norms on the full controlled space are the maxima of the block norms.
    The same calculation therefore applies to arbitrary coherent superpositions of labels. ◻
]

Figure 1 shows the comparison made in this proof. The amplification inside $sans(U)_E$ and $sans(U)_R$ repeats
  only their own state-preparation circuits. It never repeats $sans(C)$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 1.9cm, height: 1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$sans(U)_E$]]])])
  content((4.8, 0), [#box(width: 3.9cm, height: 1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$sans(C)$,: one recursive call]]])])
  content((9.6, 0), [#box(width: 1.9cm, height: 1cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$sans(U)_R^*$]]])])
  line((-1.8, 0), (-0.95, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((0.95, 0), (2.85, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((6.75, 0), (8.65, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((10.55, 0), (11.4, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-1.45, 0.58), [#text(size: 9pt)[$iota x$]])
  content((2.05, 0.58), [#text(size: 9pt)[$dotless.j cal(E)_"Lx"$]])
  content((7.55, 0.58), [#text(size: 9pt)[$dotless.j cal(R)_"LVx"$]])
  content((11.02, 0.58), [#text(size: 9pt)[$iota "Vx"$]])
  content((0, -0.92), [#text(size: 9pt)[local encoding]])
  content((4.8, -0.92), [#text(size: 9pt)[order $k<d$; controlled by $z$#linebreak()fresh workspace starts at zero]])
  content((9.6, -0.92), [#text(size: 9pt)[local decoding]])
  line((1.22, -1.7), (8.38, -1.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.8, -2.12), [#text(size: 9pt)[comparison states lie in the fixed good subspace]])
})],
  caption: [Figure 1: One recursion level. Labels above the arrows are the comparison states used in Lemma 13; the intermediate states are approximate, as quantified there. The phase register supplies the control $z$ to the single smaller synthesis circuit. The local encoders contain their own amplification rounds, while the smaller circuit occurs only once. The map $iota$ initializes all work registers to zero, so the final comparison also records their cleanup. ],
) <fig:recursion>

We can now choose one set of parameters for all recursion levels. Keep $M \, r \, J$ from (3.4) and (3.8), and set

#[#set math.equation(numbering: n => "(6.3)")
 $ L = 10000 J \, wide b = n L + ceil.l log_2 \( L + 1 \) ceil.r \, wide K = b \( L + 1 \) . $ <rec:parameters>]

Thus $K$ is the number of qubits in each field’s phase register.

#thm([Proposition 6.2.])[
  (Uniform programmable synthesis).  #emph[Let $n gt.eq 1$, $1 lt.eq d lt.eq 2^n$, and $t gt.eq 0$.
    There is a programmable-slot circuit structure, determined by $n \, d \, t$, with the following property.
    For every family $\( U_lambda \)_(lambda in { 0 \, 1 }^t)$ of unitaries on $bb(C)^d$,
    its slot tables can be chosen so that the circuit implements the controlled unitary $U_lambda$,
    preserves the labels, and has clean-workspace operator norm error less than $1 \/ 100$ in the sense of (2.1).
    The circuit uses
#[#set math.equation(numbering: n => "(6.4)")
 $ t + O \( \( n + 1 \)^10 \) quad upright("qubits") \, wide O \( \( n + 1 \)^13 \) quad
   upright("slots") . $ <rec:resources>]

 Its structure, including each slot’s ordered control list,
   is generated deterministically in time polynomial in $n + t$ from $n \, d \, t$.]
] <rec:skeleton>

#proof[
  We recurse on the valid order $d$, retaining $n$-bit index and port registers at every level.
    If $d = 1$, each $U_lambda$ is a scalar phase, implemented exactly by one slot on an index bit that is zero
    throughout the valid input subspace.
  For $d gt.eq 2$, Proposition 6 gives $V_lambda = P_(upright(L) \, lambda) U_lambda
    P_(upright(R) \, lambda)$ with internal order $s$ and port order $k = d - s$.
    Apply the one-step construction of Lemma 13, prescribing the recursive family to be $F_lambda \( z \)$ and
    adding $z$ to the existing control labels. Supply fresh working qubits for this recursive circuit.
    To implement $U_lambda$, apply $P_(upright(R) \, lambda)^(*)$ before this construction and
    $P_(upright(L) \, lambda)^(*)$ afterward. These transformations have exact slot implementations,
    so they introduce no further error. Their order is correct because $P_(upright(L) \, lambda)^(*) V_lambda
    P_(upright(R) \, lambda)^(*) = U_lambda$.
  At each step, Lemma 13 adds at most
  $ frac(2 r^L, 1 - r) + 10 r^(2 L) = 8 r^L + 10 r^(2 L) lt.eq 18 r^L $
  to the error of the smaller circuit. There are fewer than $J$ steps by Lemma 7.
    Bernoulli’s inequality gives $\( 4 \/ 3 \)^L gt.eq 1 + L \/ 3$, and hence $r^L lt.eq 3 \/ L$.
    The total error is therefore
  #[#set math.equation(numbering: n => "(6.5)")
   $ 18 J r^L lt.eq frac(54 J, L) = 54 / 10000 < 1 / 100 . $ <rec:total-error>]
  In particular, all working qubits, including those introduced at inner recursion levels,
    return to zero in the ideal comparison map.
  We next count the circuit resources. Write $N = n + 1$ and $h = ceil.l log_2 \( L + 1 \) ceil.r$.
    Our parameters satisfy
  $ J \, L = O \( N^3 \) \, wide b = O \( N^4 \) \, wide K = O \( N^7 \) \, wide h = O \( N \) . $
  Proposition 12 uses $O \( K + n + h \)$ fresh qubits for a pair of encoders and $O \( L \( K + n + h \) + K \)$
    slots for each encoder. The two encoders at one level share the same register layout.
    The pre- and post-conditioning operations require only $O \( n \)$ more clean working qubits and slots.
    All registers from an outer level remain allocated during an inner call,
    so summing over the at most $J$ levels gives
  $ t + O \( J \( K + n + h \) \) = t + O \( N^10 \) $
  total qubits. Summing the slots gives
  $ O #scale(x: 120%, y: 120%)[\(] J \[ L \( K + n + h \) + K + n \] #scale(x: 120%, y: 120%)[\)] = O \( N^13 \) . $
  These sums suffice because there is only one recursive call at a level.
    The local amplification repetitions have already been included in the factor $L$ in the encoder cost.
  Finally, the structure can be generated without computing any of its table contents.
    The successive orders $d \, q \, s \, k$ have $O \( n \)$-bit descriptions and are computed in polynomial
    time. Register allocations, state-preparation bit order, Fourier transforms, reflections,
    and the fixed number $L$ of amplification rounds depend only on these sizes.
    Every operation depending on $U_lambda$—the signs, permutations, state-preparation amplitudes, support lists,
    and recursively prescribed matrices—changes only a slot table.
    At most $t + O \( N^10 \)$ register positions occur in any ordered control list,
    so writing all such lists for $O \( N^13 \)$ slots still takes polynomial time in $n + t$.
    No list of possible label values is generated. This proves both the uniformity assertion and (6.4). ◻
]

== 7 Compilation into one Boolean oracle <sec:compilation>

The skeleton of Proposition 14 specifies only polynomially many slots, although each slot may have a large table.
  We now encode finite gate words for those tables in one Boolean function. Two details require care:
  the words must approximate matrices with their actual phases,
  and the resulting circuit must be generated without finding those words.
  The need to retain scalar phases under coherent control is already present in the general controlled-gate
  decompositions of [3].

=== 7.1 Phase-sensitive one-qubit approximation <phase-sensitive-one-qubit-approximation>

We first prove the approximation fact needed for the compilation.
  The argument combines the irrational-rotation proof of universality for this gate set [5] with the commutator
  refinement underlying the Solovay–Kitaev theorem [7]. The weaker polynomial bound below is sufficient for our purpose.

#thm([Lemma 7.1.])[
  #emph[There is an absolute positive integer $K_(upright(w))$ such that every $S in S U \( 2 \)$ and every $0 <
    xi < 1$ admit a word in $H \, T \, T^dagger$ of length at most $K_(upright(w))
    xi^(- 3)$ whose matrix has determinant one and differs from $S$ by at most $xi$ in operator norm.]
] <compile:words>

#proof[
  Write $X_p \, Y_p \, Z_p$ for the Pauli matrices, with $Y_p = i X_p Z_p$,
    and put $bold(sigma) = \( X_p \, Y_p \, Z_p \)$. We first show that the determinant-one words are dense in $S
    U \( 2 \)$. Up to their scalar factors,
  $ T = e^(i pi \/ 8) e^(- i \( pi \/ 8 \) Z_p) \, wide H T H = e^(i pi \/ 8) e^(- i \( pi \/ 8 \) X_p) . $
  Thus $W = \( H T H \) T = e^(i pi \/ 4) V$, where $V in S U \( 2 \)$ has trace
  $ "Tr" V = 2 cos^2 \( pi \/ 8 \) = 1 + sqrt(2) / 2 . $
  Recall that an algebraic integer is a root of a monic polynomial with integer coefficients; equivalently,
    its monic minimal polynomial over $bb(Q)$ has integer coefficients.
    The displayed trace is not an algebraic integer, because its monic irreducible polynomial is $x^2 - 2 x +
    1 \/ 2$. Consequently the eigenvalues of $V$ cannot be roots of unity:
    roots of unity are algebraic integers, and sums of algebraic integers are algebraic integers.
    Writing its eigenvalues as $e^(plus.minus i theta)$, we have $theta \/ pi in.not bb(Q)$.
    The word $W^4 = - V^4$ has determinant one, and its powers are dense in the one-parameter circle about the
    rotation axis of $V$.
  For completeness, every matrix in $S U \( 2 \)$ has the form $cos t thin I +
    i sin t thin upright(bold(v)) dot.op bold(sigma)$, with $upright(bold(v)) in bb(R)^3$ a unit vector,
    except that the axis can be chosen arbitrarily when $sin t = 0$.
    Multiplying the two rotations defining $V$ shows that its axis is not parallel to the $Z_p$ axis.
    Conjugation by $T$ rotates this axis through $pi \/ 4$ about $Z_p$, giving a nonparallel axis.
    The closure of the determinant-one words contains both corresponding circles:
    conjugation of a determinant-one word by $T$ is again such a word.
    Rotating the second axis slightly about the first moves it out of the plane they span.
    Conjugation by an element of the first circle therefore gives a third circle with a linearly independent axis.
    Let $upright(bold(v))_1 \, upright(bold(v))_2 \, upright(bold(v))_3$ be the three axes. The derivative at zero of
  $ \( t_1 \, t_2 \, t_3 \) mapsto product_(j = 1)^3 exp \( i t_j upright(bold(v))_j dot.op bold(sigma) \) $
  sends $\( t_1 \, t_2 \, t_3 \)$ to $i \( sum_j t_j upright(bold(v))_j \) dot.op bold(sigma)$,
    an isomorphism onto the three-dimensional tangent space of $S U \( 2 \)$ at the identity.
    The inverse function theorem shows that these products contain a neighborhood of the identity.
    The closure of our words is thus an open subgroup. Every other coset is open as well,
    so connectedness of $S U \( 2 \)$ forces this subgroup to be all of $S U \( 2 \)$.
    Here connectedness also follows from the preceding representation of $S U \( 2 \)$ as the unit sphere in $bb(R)^4$.
  We next obtain a uniform length bound. Density and compactness provide a finite $epsilon_0$-net of
    determinant-one words of some fixed maximum length $ell_0$,
    where $epsilon_0 > 0$ will be chosen sufficiently small. Suppose that words of length at most $ell$ form an
    $epsilon$-net, and choose such a word $W_0$ within $epsilon$ of a target $S$.
    The residual $S W_0^dagger$ has the form
  $ S W_0^dagger = exp \( i upright(bold(a)) dot.op bold(sigma) \) \, wide \| upright(bold(a)) \| lt.eq 2 epsilon \, $
  for sufficiently small $epsilon$. The Pauli commutator identity gives skew-Hermitian matrices
  $ P = i upright(bold(u)) dot.op bold(sigma) \, wide Q = i upright(bold(v)) dot.op bold(sigma) \,
    wide \[ P \, Q \] = i upright(bold(a)) dot.op bold(sigma) \, $
  with $lr(bar.v.double P bar.v.double) \, lr(bar.v.double Q bar.v.double) = O \( sqrt(epsilon) \)$:
    take perpendicular vectors with $upright(bold(u)) times upright(bold(v)) = -
    upright(bold(a)) \/ 2$ and equal lengths. For $A = e^P$ and $B = e^Q$,
    expansion of the four exponential series through degree two gives
  $ A B A^dagger B^dagger = I + \[ P \, Q \] + O \( epsilon^(3 \/ 2) \) = S W_0^dagger + O \( epsilon^(3 \/ 2) \) . $
  All errors here are in operator norm with absolute constants;
    the remaining terms of the exponential series are bounded by a constant times
    $\( lr(bar.v.double  bar.v.double) P + lr(bar.v.double  bar.v.double) Q \)^3$.
  Choose net words $tilde(A) \, tilde(B)$ within $epsilon$ of $A \, B$.
    The gain in precision survives this substitution. Indeed,
  $ lr(bar.v.double A B A^dagger B^dagger - tilde(A) B tilde(A)^dagger B^dagger bar.v.double) & lt.eq
    2 epsilon lr(bar.v.double B - I bar.v.double) \,\
lr(bar.v.double tilde(A) B tilde(A)^dagger B^dagger - tilde(A) tilde(B) tilde(A)^dagger tilde(B)^dagger
  bar.v.double) & lt.eq 2 epsilon lr(bar.v.double tilde(A) - I bar.v.double) . $
  The first inequality follows by writing $B = I + \( B - I \)$ and cancelling the identity terms;
    the second is the same calculation with the roles reversed. Both right sides are $O \( epsilon^(3 \/ 2) \)$.
    Therefore the word
  $ tilde(A) tilde(B) tilde(A)^dagger tilde(B)^dagger W_0 $
  approximates $S$ to $C epsilon^(3 \/ 2)$ and has length at most $5 ell$.
    Inverse words are available because $H^dagger = H$ and both $T$ and $T^dagger$ belong to the alphabet.
  Choose the fixed initial net so small that $C sqrt(epsilon_0) lt.eq 1 \/ 2$.
    Repeating the refinement $j$ times gives error at most $2^(- j) epsilon_0$ and length at most $5^j ell_0$.
    Taking $j$ just large enough for the former quantity to be at most $xi$ gives a length bounded by
    $K_(upright(w)) xi^(- 3)$, since $log_2 5 < 3$. ◻
]

Only the existence of the fixed integer $K_(upright(w))$ will be used.
  A generator can hardcode this integer; it does not need the net or a procedure that selects approximating words.
  Those selections will be stored in the oracle.

=== 7.2 Lookup, control, and restoration of scratch space <lookup-control-and-restoration-of-scratch-space>

#thm([Proposition 7.2.])[
  (Compilation of slots).  #emph[Let a skeleton have $S$ slots on $Q$ qubits, and put $eta =
    1 \/ h$ for an integer $h gt.eq 2$. There is a deterministic procedure, polynomial in $Q \, S \, 1 \/ eta$,
    that produces a circuit over $H \, T \, T^dagger \, upright("CNOT")$ and one Boolean oracle,
    with polynomially many qubits, gates, calls, and address bits.
    For every assignment of the slot tables, some contents of that oracle make the circuit differ from the
    prescribed skeleton by at most $S eta$ on inputs with its added scratch qubits zero,
    with the comparison circuit keeping those scratch qubits zero.]
] <compile:slots>

#proof[
  First consider one table entry $W_y in U \( 2 \)$. Choose a real number $gamma_y$ and a matrix $S_y in S
    U \( 2 \)$ such that
  $ W_y = e^(i gamma_y) S_y . $
  By Lemma 15, choose words within $eta \/ 2$ of $S_y$ and of
  $ P_y = "diag" \( e^(i gamma_y) \, e^(- i gamma_y) \) . $
  Pad every word with identities to the common length $ell = ceil.l K_(upright(w)) \( 2 \/ eta \)^3 ceil.r$.
    Apply the first word to the slot target and the second to a fresh scratch qubit initially in $\| 0 chevron.r$.
    Their ideal actions on this input multiply to $W_y$ on the target and return scratch to zero.
    The two approximation errors add to at most $eta$. Since different $y$ occupy orthogonal control blocks,
    this is an operator-norm bound for the entire controlled slot.
    In particular, the scalar factor $e^(i gamma_y)$ has been retained as a relative phase between control values.
  Use two bits to encode each symbol in ${ I \, H \, T \, T^dagger }$.
    A single Boolean function stores all symbol bits at addresses containing
  $ \( upright("slot number") \, med y \, med upright("which word") \, med upright("word position") \, med
    upright("symbol bit") \) . $
  Pad the field for $y$ to $Q$ bits. This makes every address have a common length
    $O \( Q + log \( S + 1 \) + log \( ell + 1 \) \)$. For each word position,
    copy the slot’s controls into the address by CNOTs, set the fixed address bits,
    and query the two symbol bits into zero qubits. Apply the specified symbol conditionally,
    then erase the symbol bits by querying again and reverse the address preparation.
    The original slot controls do not change under any of these target operations,
    so the erasure is exact even in a superposition of control values.
  We verify that symbol selection uses only the allowed elementary gates.
    Bit flips are available as $H T^4 H = X_p$. On bits $a \, b \, c$, the integer identity
  #[#set math.equation(numbering: n => "(7.1)")
   $ 4 a b c = a + b + c - \( a xor b \) - \( a xor c \) - \( b xor c \) + \( a xor b xor c \) $ <compile:parity>]
  implements a doubly controlled $Z_p$ using $T \, T^dagger$:
    compute each parity into clean scratch, apply its indicated phase, and uncompute it.
    Conjugating the target by $H$ gives Toffoli. Thus equality tests on symbol bits and all required reversible
    address operations are exact. To apply $T$ conditionally,
    compute the AND of its control and target into a clean scratch bit, apply $T$ there, and uncompute the AND;
    the same construction applies to $T^dagger$.
  For a controlled $H$, define
  $ D_0 = \( T^2 H \) T \( T^2 H \)^dagger . $
  Because $\( T^2 H \) Z_p \( T^2 H \)^dagger = Y_p$, we have $D_0 = e^(i pi \/ 8) e^(- i \( pi \/ 8 \) Y_p)$ and hence
  $ D_0 Z_p D_0^dagger = \( X_p + Z_p \) \/ sqrt(2) = H . $
  Apply $D_0^dagger$ to the target, then a controlled $Z_p$, then $D_0$.
    When the control is zero the two unconditional gates cancel; when it is one their product is exactly $H$.
    A controlled $Z_p$ itself is a CNOT conjugated on its target by $H$.
    This proves that every selected symbol, including its phase, can be applied exactly.
  It remains to compose the approximate slots. Let $A_j$ denote the actual implementation of slot $j$,
    and let $V_j$ denote the ideal slot acting trivially on all added scratch. The phase scratch may be reused.
    Although its actual state need not be exactly zero after a slot, the identity
  $ A_S dots.h.c A_1 - V_S dots.h.c V_1 = sum_(j = 1)^S A_S dots.h.c A_(j + 1) \( A_j - V_j \) V_(j - 1) dots.h.c V_1 $
  uses the error $A_j - V_j$ only after an ideal prefix. Such a prefix keeps all added scratch at zero,
    precisely where the one-slot bound applies. The unitary suffix preserves its norm.
    The total error is therefore at most $S eta$ on the claimed input subspace.
  There are two words per slot, $O \( ell \)$ symbol positions per word,
    and a polynomial number of elementary operations per lookup.
    The addresses, scratch, and total circuit size are thus polynomial in $Q \, S \, 1 \/ eta$.
    Generating the circuit requires only the skeleton, the fixed length bound, and ordinary integer arithmetic.
    In particular, it never selects a word or computes a table entry.
    Each target merely determines one admissible Boolean function storing all choices.
    Adjoint slots can have their own addresses and approximating words, or can reverse and invert stored words;
    either convention uses the same single oracle. ◻
]

#proof[
  Apply Proposition 14 with $d = 2^n$ and no initial labels.
    Its skeleton has polynomially many qubits and slots, and approximates the target unitary,
    including restoration of its working qubits, to error less than $1 \/ 100$. If it has $S$ slots, compile it using
  $ eta = frac(1, 100 \( S + 1 \)) . $
  Proposition 16 adds error less than $1 \/ 100$. The entire circuit is therefore within $1 \/
    10$ in operator norm, on zero-workspace inputs, of applying $U$ and returning every other qubit to zero.
    The same polynomial bounds its width, number of gates and calls, oracle address length,
    and the running time of its deterministic generator, after increasing fixed coefficients if necessary.
  Take the original index qubits as the designated outputs.
    For a pure input state $\| psi chevron.r$ together with a reference register,
    let $a$ and $b$ be the actual and ideal final unit vectors before discarding workspace.
    The operator-norm estimate gives $lr(bar.v.double a - b bar.v.double) lt.eq 1 \/ 10$.
    Since the trace norm of a rank-one matrix $u v^dagger$ is $lr(bar.v.double  bar.v.double) u
    lr(bar.v.double  bar.v.double) v$,
  $ lr(bar.v.double a a^dagger - b b^dagger bar.v.double)_1 lt.eq
    lr(bar.v.double \( a - b \) a^dagger bar.v.double)_1 + lr(bar.v.double b \( a - b \)^dagger bar.v.double)_1
    lt.eq 2 lr(bar.v.double a - b bar.v.double) lt.eq 1 / 5 . $
  Partial trace cannot increase the trace norm of a Hermitian matrix,
    and convexity gives the same bound for mixed input states.
    In particular the supremum in Theorem 1, with its $n$-qubit reference, is at most $1 \/ 5 < 1 \/ 2$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Scott Aaronson, #emph[Open problems related to quantum query complexity],
  ACM Transactions on Quantum Computing #strong[2] (2021), no.~4, Article~14, 1--9.
  #link("https://doi.org/10.1145/3488559")[doi:10.1145/3488559].]
#bibitem([2])[Scott Aaronson and Greg Kuperberg, #emph[Quantum versus classical proofs and advice],
  Theory of Computing #strong[3] (2007), 129--157.
  #link("https://doi.org/10.4086/toc.2007.v003a007")[doi:10.4086/toc.2007.v003a007].]
#bibitem([3])[Adriano Barenco, Charles H.~Bennett, Richard Cleve, David P.~DiVincenzo, Norman Margolus,
  Peter Shor, Tycho Sleator, John A.~Smolin, and Harald Weinfurter,
  #emph[Elementary gates for quantum computation], Physical Review A #strong[52] (1995), no.~5, 3457--3467.
  #link("https://doi.org/10.1103/PhysRevA.52.3457")[doi:10.1103/PhysRevA.52.3457].]
#bibitem([4])[Ville Bergholm, Juha J.~Vartiainen, Mikko Möttönen, and Martti M.~Salomaa,
  #emph[Quantum circuits with uniformly controlled one-qubit gates], Physical Review A #strong[71] (2005),
  Article~052330. #link("https://doi.org/10.1103/PhysRevA.71.052330")[doi:10.1103/PhysRevA.71.052330].]
#bibitem([5])[P.~Oscar Boykin, Tal Mor, Matthew Pulver, Vwani Roychowdhury, and Farrokh Vatan,
  #emph[A new universal and fault-tolerant quantum basis], Information Processing Letters #strong[75] (2000),
  no.~3, 101--107. #link("https://doi.org/10.1016/S0020-0190(00)00084-3")[doi:10.1016/S0020-0190(00)00084-3].]
#bibitem([6])[Gilles Brassard, Peter Høyer, Michele Mosca, and Alain Tapp,
  #emph[Quantum amplitude amplification and estimation], in #emph[Quantum Computation and Information],
  Contemporary Mathematics #strong[305], American Mathematical Society, 2002, 53--74.
  #link("https://doi.org/10.1090/conm/305/05215")[doi:10.1090/conm/305/05215].]
#bibitem([7])[Christopher M.~Dawson and Michael A.~Nielsen, #emph[The Solovay--Kitaev algorithm],
  Quantum Information & Computation #strong[6] (2006), no.~1, 81--95.
  #link("https://doi.org/10.26421/QIC6.1-6")[doi:10.26421/QIC6.1-6].]
#bibitem([8])[Fangqi Dong, Alex Lombardi, and Fermi Ma, #emph[Explicit separations for one-query unitary
  synthesis], preprint, 2026. #link("https://arxiv.org/abs/2607.26478")[arXiv:2607.26478].]
#bibitem([9])[Bernd Fritzsche, Victor Katsnelson, and Bernd Kirstein,
  #emph[The Schur algorithm in terms of system realizations], in D.~Alpay and V.~Vinnikov (eds.),
  #emph[Characteristic Functions, Scattering Functions and Transfer Functions], Operator Theory:
  Advances and Applications #strong[197], Birkhäuser, 2009, 181--250.
  #link("https://doi.org/10.1007/978-3-0346-0183-2_9")[doi:10.1007/978-3-0346-0183-2\_9].]
#bibitem([10])[András Gilyén, Yuan Su, Guang Hao Low, and Nathan Wiebe,
  #emph[Quantum singular value transformation and beyond: exponential improvements for quantum matrix
  arithmetics], Proceedings of the 51st Annual ACM SIGACT Symposium on Theory of Computing (STOC 2019), ACM, 2019,
  193--204. #link("https://doi.org/10.1145/3313276.3316366")[doi:10.1145/3313276.3316366]. Full version:
  #link("https://arxiv.org/abs/1806.01838")[arXiv:1806.01838].]
#bibitem([11])[Sandy Irani, Anand Natarajan, Chinmay Nirkhe, Sujit Rao, and Henry Yuen,
  #emph[Quantum search-to-decision reductions and the state synthesis problem],
  37th Computational Complexity Conference (CCC 2022), Leibniz International Proceedings in Informatics
  #strong[234] (2022), 5:1--5:19. #link("https://doi.org/10.4230/LIPIcs.CCC.2022.5")[doi:10.4230/LIPIcs.CCC.2022.5].]
#bibitem([12])[Alex Lombardi, Fermi Ma, and John Wright, #emph[A one-query lower bound for unitary synthesis and
  breaking quantum cryptography], Proceedings of the 56th Annual ACM Symposium on Theory of Computing (STOC 2024),
  ACM, 2024, 979--990. #link("https://doi.org/10.1145/3618260.3649650")[doi:10.1145/3618260.3649650].]
#bibitem([13])[Mikko Möttönen, Juha J.~Vartiainen, Ville Bergholm, and Martti M.~Salomaa,
  #emph[Transformation of quantum states using uniformly controlled rotations],
  Quantum Information & Computation #strong[5] (2005), no.~6, 467--473.
  #link("https://doi.org/10.26421/QIC5.6-5")[doi:10.26421/QIC5.6-5].]
#bibitem([14])[Barak Nehoran and Henry Yuen, #emph[All unitaries have constant depth quantum circuits],
  preprint, 2026. #link("https://arxiv.org/abs/2609.40351")[arXiv:2609.40351].]
#bibitem([15])[Gregory Rosenthal, #emph[Efficient quantum state synthesis with one query],
  Proceedings of the 2024 Annual ACM--SIAM Symposium on Discrete Algorithms (SODA), SIAM, 2024, 2508--2534.
  #link("https://doi.org/10.1137/1.9781611977912.89")[doi:10.1137/1.9781611977912.89].]
#bibitem([16])[Gregory Rosenthal, #emph[Query and depth upper bounds for quantum unitaries via Grover search],
  Quantum #strong[10] (2026), Article~2144.
  #link("https://doi.org/10.22331/q-2026-06-30-2144")[doi:10.22331/q-2026-06-30-2144].]
#bibitem([17])[Joel A.~Tropp, #emph[Second-order matrix concentration inequalities],
  Applied and Computational Harmonic Analysis #strong[44] (2018), no.~3, 700--736.
  #link("https://doi.org/10.1016/j.acha.2016.07.005")[doi:10.1016/j.acha.2016.07.005].]
