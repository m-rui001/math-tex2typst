#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Regular trajectories, pruning and quantum parity]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The class $sans(Q A C)^0$ consists of constant-depth quantum circuits with arbitrary one-qubit gates and generalized Toffoli gates of unbounded arity, using polynomially many total qubits. Ancillary qubits are initialized to zero. The supports of gates in a layer are pairwise disjoint. This last condition makes the availability of fanout a substantive question: one cannot simultaneously use a qubit as the control of arbitrarily many two-qubit gates. Moore asked whether the coherent fanout operation can be implemented in this model, and conjectured a negative answer. Its unitary parity counterpart is equivalent by Hadamard conjugation #cite(label("Moore1999")) #cite(label("GreenHomerMoorePollett2002")).

We prove Moore’s parity conjecture in the measured-output model and therefore also exclude coherent fanout. The lower bound holds for bounded-error computation with a single measured output, even when the computation changes the input and leaves arbitrary garbage in the other registers.

=== 1.1 The circuit model and the result <the-circuit-model-and-the-result>

For $x in { 0 \, 1 }^n$, let

$ upright("PARITY")_n \( x \) = x_1 xor dots.h.c xor x_n . $

An allowed circuit acts on $\| x chevron.r \| 0 chevron.r^(⊗ a)$. Its gates are arbitrary one-qubit unitaries and generalized Toffoli gates

$ \| z_1 \, dots.h \, z_t \, b chevron.r mapsto \| z_1 \, dots.h \, z_t \, b xor \( z_1 dots.h.c z_t \) chevron.r \, #h(2em) t gt.eq 1 \, $

on distinct control and target qubits. Each gate has unit cost, regardless of its arity. A depth-$d$ circuit is a product of $d$ layers of gates with pairwise disjoint supports. There is no geometric restriction. At the end, one designated qubit is measured in the computational basis. The other registers may be discarded. Intermediate measurements, postselection, and additional fanout gates are not allowed. All gates and their complex entries may depend arbitrarily on $n$, but not on $x$.

#thm([Theorem 1.1.])[
  #emph[Fix positive integers $d \, k \, C$ and a real $0 < epsilon lt.eq 1 \/ 2$. There is an integer $n_0 = n_0 \( d \, k \, C \, epsilon \)$ such that, for every $n gt.eq n_0$, every allowed circuit of depth at most $d$ on at most $C \( n + 1 \)^k$ total qubits has an input $x in { 0 \, 1 }^n$ on which its answer equals $upright("PARITY")_n \( x \)$ with probability strictly less than $1 \/ 2 + epsilon$.]
] <thm:parity>

Here total qubits means the $n$ inputs together with all ancillary qubits. Disjoint nonempty gate supports imply that a depth-$d$ circuit on $N$ qubits contains at most $d N$ gates. Thus the theorem covers the usual fixed-depth model with polynomially many gates and polynomially many ancillas: the ancillary bound gives a polynomial bound on $N$, and a polynomial bound on $N$ already bounds the number of gates.

In particular, no nonuniform constant-depth family with polynomial resources computes parity with any fixed positive worst-case advantage. The theorem is eventual for each fixed depth, polynomial bound, and advantage; it permits arbitrary finite exceptions at small input lengths.

To make the connection with fanout explicit, let

$ F_n \| y_1 \, dots.h \, y_n \, b chevron.r = \| y_1 xor b \, dots.h \, y_n xor b \, b chevron.r . $

For the Hadamard gate $H$, conjugating a controlled-NOT by $H ⊗ H$ interchanges its control and target; this follows directly from its action on the two-qubit basis. Writing $F_n$ as the product of its commuting controlled-NOT operations gives

$ H^(⊗ \( n + 1 \)) F_n H^(⊗ \( n + 1 \)) \| y \, b chevron.r = \| y \, b xor upright("PARITY")_n \( y \) chevron.r . $

Thus a constant-depth polynomial-resource implementation of $F_n$, together with two layers of one-qubit gates and a zero target, would contradict Theorem 1. This also excludes Moore’s original formulation, in which the ancillary qubits must be restored to zero #cite(label("Moore1999")).

Theorem 1 also has state-preparation consequences corresponding to those of Gretta, Gupta, and Joshi #cite(label("GGJ2026Fourier")) Corollary 4.10 and Theorem 4.14. Let $rho$ be the retained $n$-qubit state of an allowed unitary preparation from all-zero inputs, with arbitrary final ancillas discarded. Its felinity is $2 sum_y p_y p_(macron(y))$, where $p_y = chevron.l y \| rho \| y chevron.r$ and $macron(y)$ is the bitwise complement of $y$. At each fixed depth and fixed polynomial total-qubit bound, for every fixed $A > 0$, eventually every such preparation has felinity less than $n^(- A)$. For every fixed $0 < delta < 1$, eventually every such preparation and every integer $k$ with $n^delta lt.eq k lt.eq n \/ 2$ also satisfy

$ 1 / 2 parallel rho - \| D_k^n chevron.r chevron.l D_k^n \| #scale(x: 120%, y: 120%)[parallel]_1 > frac(1, 80 k) \, #h(2em) \| D_k^n chevron.r = binom(n, k)^(- 1 \/ 2) sum_(\| y \| = k) \| y chevron.r . $

Here trace distance is one half of the trace norm. The companion states the same bounds #cite(label("OpenAILocalization2026")) Corollary 8 (State-preparation obstructions), Section 7.1. The argument after the parity proof in Section 7 justifies the pointwise reductions, including exact promotion with arbitrary final garbage and polynomial total-qubit overhead.

=== 1.2 Previous work <previous-work>

The classical class $sans(A C)^0$ allows unbounded-fan-in AND and OR gates, NOT gates, and unrestricted reuse of wires. Parity was among the first explicit functions shown to require superpolynomial size at constant depth, by Furst, Saxe, and Sipser and independently Ajtai #cite(label("FurstSaxeSipser1984")) #cite(label("Ajtai1983")); Håstad obtained almost optimal exponential bounds through the switching lemma #cite(label("Hastad1986")). The quantum question combines the additional expressive power of one-qubit unitaries with the disjoint-support restriction on each layer. Moore’s formulation and the counting classes studied by Green, Homer, Moore, and Pollett made the role of coherent fanout explicit #cite(label("Moore1999")) #cite(label("GreenHomerMoorePollett2002")). Constant-depth constructions with fanout further demonstrated the computational importance of that operation #cite(label("HoyerSpalek2005")).

Early quantum lower bounds exposed the importance of the ancillary register. Fang, Fenner, Green, Homer, and Zhang proved a depth bound of order $log \( n \/ \( a + 1 \) \)$ for exact parity computation with $a$ ancillas that must be restored to zero #cite(label("FangFennerGreenHomerZhang2006")) Corollary 4.6. Padé, Fenner, Grier, and Thierauf ruled out exact clean simulation at entangling depth two #cite(label("PadeFennerGrierThierauf2020")); Fenner, Grier, Padé, and Thierauf subsequently removed the final-state cleanliness requirement for exact single-output parity at that depth #cite(label("FennerGrierPadeThierauf2025")) Theorem 6.1. Here and in the depth-specific comparisons below, #emph[entangling depth] counts only layers of multiqubit gates; arbitrary one-qubit layers may occur between them. This convention differs from our total layer count by at most a constant factor for fixed depth.

Rosenthal obtained lower bounds for approximate parity and fanout unitaries and related cat-like states, together with constant-depth approximation constructions using superpolynomial resources #cite(label("Rosenthal2021")). Approximation of a parity unitary is a stronger task than computing one measured classical bit: the latter may destroy the input and leave arbitrary garbage. Nadimpalli, Parham, Vasconcelos, and Yuen developed Pauli-spectrum methods with depth-dependent restrictions on the ancillary count #cite(label("NadimpalliParhamVasconcelosYuen2024")). Anshu, Dong, Ou, and Yao obtained lower bounds allowing barely superlinear ancillary counts #cite(label("AnshuDongOuYao2025")); Dong, Ou, and Yao developed further low-degree estimates and applications to quantum channels #cite(label("DongOuYao2025")). These resource restrictions do not cover an arbitrary fixed polynomial ancillary bound.

Joshi, Tal, Vasconcelos, and Wright ruled out exact parity at entangling depth three for sufficiently large input lengths, with no bound on the number of gates or ancillas. They also proved approximate parity lower bounds at entangling depth two for one measured output, without requiring input preservation #cite(label("JoshiTalVasconcelosWright2025")). Kintali’s September 2026 preprint reports exponentially small average parity correlation at entangling depth at most three, independently of the number of gates and ancillas, and an exponential gate lower bound for exact parity at entangling depth at most four #cite(label("Kintali2026ShallowParity")) Theorems 1–2.#footnote[Joshi et al. acknowledge ChatGPT’s contribution to a lemma’s proof idea and other interactions; Kintali discloses assistance from Claude, ChatGPT, and two open-weight models. Neither source specifies model versions.] These depth-specific statements do not cover every fixed depth. Gretta, Gupta, and Joshi characterize the general parity question through Fourier concentration #cite(label("GGJ2026Fourier")), while Xu and Li extend related fanout reductions to symmetric functions #cite(label("XuLi2026Fanout")). Our theorem permits every fixed depth and every polynomial total-qubit bound simultaneously. All structural statements needed for its proof are established below.

The companion article #emph[Product-projection localization and the QAC0 parity lower bound] proves a uniform operator-norm localization theorem and an independent parity lower bound #cite(label("OpenAILocalization2026")) Sections 2 and 6. The present article instead proves state-dependent propagation, projection insertion, and pruning for regular trajectories. Both arguments use product-projection counts and elementary Chebyshev filters; neither structural theorem is used to prove the other.

=== 1.3 The proof and its main tools <the-proof-and-its-main-tools>

A generalized Toffoli gate is a reflection $I - 2 P$, where $P$ is a product of one-qubit rank-one projections. This representation suggests counting how many local factors of a product test fail. A single such gate can couple arbitrarily many qubits, so its conjugation need not preserve small operator support. Moreover, product-projection filters can have large norms away from the count range where they approximate well. Controlling the state on which each approximation is used is therefore essential. Informally, a trajectory sequence is #emph[regular] when, for every sufficiently small collection of reflections in a layer, the combined count of failures of their local factors has a rapidly decaying tail on the state entering that layer. The precise definition is asymptotic and allows arbitrary gates and states at each circuit size.

Polynomial locality and concentration have been related in work of Kuwahara, Arad, Amico, and Vedral and of Anshu and Metger #cite(label("KuwaharaAradAmicoVedral2017")) #cite(label("AnshuMetger2023")). In the circuit setting, Pauli concentration and low-degree approximation are central to the works just discussed. An operator has degree at most $ell$ when it is a sum of operators supported on at most $ell$ sites each. We retain the elementary link between this degree and the number of product-basis coordinates an operator can change. The additional steps here are two-sided tail transport and stability under a product projection, which permit a trajectory to be made regular by a state-dependent pruning rule.

The first tool, Proposition 9, transports operators of low degree along a regular trajectory, with an arbitrarily small fixed loss in the degree exponent. Its conclusion is an approximation on the trajectory vector. The second tool, Proposition 12, shows that regularity survives insertion of an arbitrary product projection followed by reverse evolution. The key step is Lemma 10, which compares two regular trajectories. One polynomial detects a tail at the starting end; another approximates the product projection at the finishing end. They are applied on different sides of an inner product, so their large global norms are paid for by the appropriate tail estimates.

Projection stability then makes regularity available without an initial assumption on the circuit. Starting from a product state, we retain a reflection when its projection has probability at least $m^(- 6)$ on the current state, where $m$ is the number of qubits. The retained layer is regular, and the deleted gates change the state by at most $2 m^(- 2)$ per layer. Iterating this rule yields a regular trajectory close to the original evolution (Proposition 16). The stability and propagation statements concern arbitrary product tests and regular trajectories, rather than parity alone.

Finally, we copy each basis input into a reference register that the subsequent computation leaves untouched. On the uniform coherent input, worst-case parity success becomes a signed acceptance expectation bounded away from zero. The pruned circuit has almost the same expectation. Write $W$ for that circuit, $psi_0$ for the initial product state, and $P_B$ for the accepting output projection. The copying gates survive pruning, so conjugating the reference sign back through $W$ sends $psi_0$ to a vector with exactly $n$ excitations relative to the initial product state $psi_0$. The signed expectation pairs this vector with $W^dagger P_B W psi_0$, whose tail for that same count is bounded by Corollary 13. Because the total number $m$ of qubits is polynomially bounded in $n$, a sufficiently small fixed $h > 0$ can be chosen with $m^h = o \( n \)$, separating these two scales and giving the contradiction.

Sections 2 and 3 introduce the formalism and the polynomial filters. Section 4 proves low-degree propagation, and Section 5 establishes tail transport. Projection stability and pruning are proved in Section 6; Section 7 completes the parity argument.

== 2 Product tests and regular trajectories <sec:framework>

We work on the Hilbert space $\( bb(C)^2 \)^(⊗ m)$. Vector norms are Euclidean norms, and operator norms are the induced norms. Unless explicitly stated otherwise, every starting vector has norm at most one. Products of orthogonal projections used in the analysis are applied without renormalizing the resulting vectors. All projection insertions below are analytic devices; the permitted circuit operations remain unitary until the final output measurement.

=== 2.1 The gate model and product tests <the-gate-model-and-product-tests>

The physical circuit has $n$ input qubits, $a$ ancillary qubits initialized to $\| 0 chevron.r^(⊗ a)$, and a designated output qubit measured in the computational basis. Its gates are arbitrary one-qubit unitaries and the generalized Toffoli gates of Section 1. Gates in each layer have pairwise disjoint supports, and each gate counts once regardless of its arity. The gates may depend arbitrarily on the input length, including through their complex entries, but are independent of the input string. No input or ancillary register is required to be restored, and the output qubit may be an original input qubit. All other qubits may be discarded after the output is measured. There are no intermediate measurements, postselection operations, geometric restrictions, or extra fanout gates.

For the analysis, we allow a reflection

$ R_g = I - 2 P_g \, #h(2em) P_g = ⨂_(j in J_g) \| v_(g \, j) chevron.r chevron.l v_(g \, j) \| ⊗ I_(J_g^c) \, $

where $J_g$ is a nonempty set of sites and each $v_(g \, j)$ is a unit vector. The tensor factors are understood to occupy their indicated sites. Each $P_g$ is an orthogonal projection, so $R_g = R_g^dagger = R_g^(- 1)$. A generalized Toffoli with $c gt.eq 1$ distinct controls $z_1 \, dots.h \, z_c$ and a distinct target $b$ has this form with

$ P_g = (⨂_(i = 1)^c \| 1 chevron.r chevron.l 1 \|_(z_i)) ⊗ \| - chevron.r chevron.l - \|_b \, #h(2em) \| - chevron.r = frac(\| 0 chevron.r - \| 1 chevron.r, sqrt(2)) \, $

and identities elsewhere. Indeed, it acts trivially unless all controls are one, and on that control subspace its target action is $I - 2 \| - chevron.r chevron.l - \| = X$. This product-reflection viewpoint also appears in #cite(label("Rosenthal2021"), form: "prose").

An #emph[analytic layer] will be either a product of such reflections on pairwise disjoint supports, or a tensor product of one-qubit unitaries. Splitting a physical layer into its two gate types preserves its operation, because its gates have disjoint supports. Thus a physical circuit of depth $d$ gives at most $2 d$ analytic layers. We use $t$ for their number and $m$ for the total number of qubits, including any reference qubits subsequently introduced. Empty layers are permitted. Every reflection layer has at most $m$ gates, since their supports are nonempty and disjoint.

#prodef([Definition 2.1.])[
  (Product test).  A test $A$ consists of a subset $J_A subset.eq { 1 \, dots.h \, m }$ and a specified unit vector $v_(A \, j)$ at each $j in J_A$. Its excitation count and zero projection are
  $ H_A = sum_(j in J_A) #scale(x: 120%, y: 120%)[\(] I - \| v_(A \, j) chevron.r chevron.l v_(A \, j) \| #scale(x: 120%, y: 120%)[\)]_j \, #h(2em) P_A = upright(bold(1))_(H_A = 0) = ⨂_(j in J_A) \| v_(A \, j) chevron.r chevron.l v_(A \, j) \| ⊗ I_(J_A^c) . $
  Here a subscript $j$ extends a one-site operator by identity at all other sites, and $upright(bold(1))_(H_A in E)$ denotes the spectral projection of $H_A$ onto the set $E subset.eq bb(R)$. The empty test has $H_A = 0$ and $P_A = I$.
] <def:test>

The summands of $H_A$ are commuting orthogonal projections. Choosing the basis $\( v_(A \, j) \, v_(A \, j)^perp \)$ at each tested site diagonalizes them simultaneously. Consequently its spectrum is contained in ${ 0 \, 1 \, dots.h \, \| J_A \| }$, and $0 lt.eq H_A lt.eq m I$. We use spectral inequalities such as $H_A gt.eq x$ also when $x$ is not an integer.

For a set $S$ of gates in one reflection layer, disjointness makes their specified local factors a single test. We write $H_S$ for its count and $P_S = product_(g in S) P_g$ for its zero projection. If $F$ is the whole reflection layer, then

$ \[ F \, H_S \] = 0 . $

Indeed, a gate in $S$ commutes with each of its own local factors, while other gates have disjoint supports. Every spectral projection of $H_S$ therefore commutes with $F$ as well. If $H_A$ retains only some sites of this test, then $H_A$ and $H_S$ are diagonal in the same product basis, $H_A lt.eq H_S$, and

$ upright(bold(1))_(H_A gt.eq x) lt.eq upright(bold(1))_(H_S gt.eq x) quad upright("for every real ") x . $

=== 2.2 Asymptotic sequences and uniformity <asymptotic-sequences-and-uniformity>

All asymptotic statements concern an arbitrary sequence indexed by $nu in bb(N)$, with total qubit counts $m_nu arrow.r oo$ and a bounded number of analytic layers. The states, tests, gates, and circuits can all vary with $nu$. We suppress $nu$ and write $m$ for $m_nu$; thus “eventually” means at all sufficiently large sequence indices. Every exponent appearing in an estimate is a fixed real number independent of $nu$. Padding with empty layers gives a common bound on length. When a fixed layer pattern is convenient, one may restrict to a subsequence with fixed length and layer types: there are only finitely many such patterns. An eventual assertion on every such subsequence yields the assertion on the original sequence, since any infinite set of violations has an infinite subsequence with one fixed pattern.

The following elementary observation will also supply uniformity over tests chosen from the current state.

#thm([Lemma 2.2.])[
  (Uniformity from arbitrary choices).  #emph[Fix a sequence of base data, and let $cal(D)_nu$ be the nonempty set of permitted auxiliary choices at index $nu$. Suppose that for every sequence $D_nu in cal(D)_nu$ and every fixed admissible parameter tuple $theta$, an assertion $cal(E) \( nu \, D_nu \, theta \)$ holds eventually. Then, for every fixed $theta$, there is an index $nu_0$ such that 
$ cal(E) \( nu \, D \, theta \) quad upright("holds for all ") nu gt.eq nu_0 upright(" and every ") D in cal(D)_nu . $

 The same conclusion holds if the premise is proved on every subsequence on which the base hypotheses remain valid.]
] <lem:uniformization>

#proof[
  Fix $theta$. If the conclusion fails, there are increasing indices $nu_i$ and choices $D_(nu_i) in cal(D)_(nu_i)$ violating the assertion. Choose arbitrary permitted values at the other indices. The resulting sequence of choices contradicts the premise. In the subsequence version, apply the premise directly to the violating subsequence. ◻
]

The lemma imposes no cardinality or finiteness requirement on $cal(D)_nu$. In particular, a permitted test may depend on the exact state at its index. The eventual threshold may depend on the fixed tuple $theta$; no threshold uniform over all real exponent tuples is asserted.

#prodef([Definition 2.3.])[
  (Regular trajectory).  Write $V = U_t dots.h.c U_1$ for analytic layers and set $xi_j = U_j dots.h.c U_1 xi_0$, where $∥xi_0∥ lt.eq 1$. The sequence of these trajectories is #emph[regular] if the following holds at every reflection layer $U_j$: for #emph[every fixed] triple
  $ 0 lt.eq b < h < 1 \, #h(2em) 0 < p < h \, $
  eventually, simultaneously for every set $S$ of at most $m^b$ gates of that layer,
  #[#set math.equation(numbering: n => "(2.1)")
   $ ∥upright(bold(1))_(H_S gt.eq m^h) xi_(j - 1)∥ lt.eq exp \( - m^p \) . $ <eq:regularity>]
  There is no regularity condition at one-qubit layers. Regularity is a property of an asymptotic sequence, not of a single finite circuit.
] <def:regular>

Commutation with $H_S$ gives

$ ∥upright(bold(1))_(H_S gt.eq m^h) xi_j∥ = ∥U_j upright(bold(1))_(H_S gt.eq m^h) xi_(j - 1)∥ = ∥upright(bold(1))_(H_S gt.eq m^h) xi_(j - 1)∥ $

at a reflection layer, so either endpoint can be used in (2.1). It follows that reversing a regular trajectory is regular for the inverse circuit: inverse reflection layers are the same layers, and inverse one-qubit layers impose no condition. Restricting a regular trajectory to any segment or subsequence preserves regularity. Multiplying each trajectory by a scalar of modulus at most one also preserves it. For any fixed use of regularity, finitely many auxiliary exponents and layers may be handled simultaneously by taking the maximum of their eventual thresholds. This does not require a common threshold for all admissible exponents.

=== 2.3 Operator degree and excitation shifts <operator-degree-and-excitation-shifts>

#prodef([Definition 2.4.])[
  (Operator degree).  An operator is supported on $J subset.eq { 1 \, dots.h \, m }$ if it has the form $E_J ⊗ I_(J^c)$. It has degree at most the nonnegative integer $ell$ if it is a finite sum of operators each supported on at most $ell$ sites. An assertion $deg E lt.eq x$ for real $x gt.eq 0$ means $deg E lt.eq floor.l x floor.r$.
] <def:degree>

Degree bounds survive sums, while products have degree at most the sum of the factors’ degrees: expand into supported terms and take the union of each pair of supports. Taking adjoints preserves degree, as does conjugating by a tensor product of one-qubit unitaries. No bound on the number or norms of terms in a support decomposition is part of the definition.

The following support constraint is the elementary locality principle behind the connection between polynomial approximation and Hamming concentration; compare #cite(label("AnshuMetger2023"), form: "prose") Lemmas 2.10–2.11. We record its exact form for arbitrary product tests.

#thm([Lemma 2.5.])[
  (Degree controls excitation shifts).  #emph[Let $ell$ be a nonnegative integer. If $deg E lt.eq ell$ and $A$ is any test, then 
$ upright(bold(1))_(H_A = f) thin E thin upright(bold(1))_(H_A = e) = 0 #h(2em) upright("whenever ") \| f - e \| > ell . $

 In particular, for every real $x$, 
$ upright(bold(1))_(H_A > x + ell) thin E thin upright(bold(1))_(H_A lt.eq x) = 0 \, #h(2em) upright(bold(1))_(H_A > ell) thin E P_A = 0 . $

 If $Q$ is a polynomial of degree at most $ell$, then $deg Q \( H_A \) lt.eq ell$.]
] <lem:degree-shift>

#proof[
  First let $E$ be supported on a set $J$ of size at most $ell$. Decompose $H_A$ into the counts on $J_A ∩ J$ and on $J_A \\ J$. In the product basis for the test, a matrix element of $E$ can be nonzero only when the states outside $J$ agree, so their excitation count is unchanged. Each count inside $J$ is between zero and $\| J_A ∩ J \|$. The total counts can therefore differ by at most $\| J \| lt.eq ell$. This proves the block assertion for a supported term, hence for their sum. Summing the forbidden blocks gives the two displayed consequences.
  Finally, expanding $H_A^j$ produces sums of products of $j$ one-site operators. Each product is supported on at most $j$ sites, even when a site occurs more than once. Expanding $Q$ into powers of $H_A$ proves the last assertion, including its constant term. ◻
]

== 3 Two polynomial filters <sec:filters>

We need two different polynomials in excitation counts. The first approximates the zero projection on an initial part of the integer spectrum. The second detects a tail while remaining nonnegative on the whole real line. Both may grow outside their effective ranges; explicit bounds on that growth will be essential. The zero filter combines normalized Chebyshev approximation with exact roots at the first positive integers, a classical approximation-and-interpolation construction for symmetric predicates; see #cite(label("Sherstov2009"), form: "prose") Section 3.1 and Lemma 3.9. We give the construction and its estimates explicitly because transport requires control of the polynomial over the entire count interval, as well as accuracy on the initial integer range.

=== 3.1 An elementary Chebyshev construction <an-elementary-chebyshev-construction>

Define real polynomials $C_ell$ by

$ C_0 \( y \) = 1 \, #h(2em) C_1 \( y \) = y \, #h(2em) C_(ell + 1) \( y \) = 2 y C_ell \( y \) - C_(ell - 1) \( y \) . $

The cosine and hyperbolic cosine addition formulas satisfy this same recurrence and initial values, so

$ C_ell \( cos theta \) = cos \( ell theta \) \, #h(2em) C_ell \( cosh tau \) = cosh \( ell tau \) . $

Thus $\| C_ell \( y \) \| lt.eq 1$ for $- 1 lt.eq y lt.eq 1$, and $C_ell$ is positive and nondecreasing on $\[ 1 \, oo \)$. We also have the elementary global bound

#[#set math.equation(numbering: n => "(3.1)")
 $ \| C_ell \( y \) \| lt.eq \( 2 \| y \| + 1 \)^ell quad \( y in bb(R) \) . $ <eq:chebyshev-global>]

Indeed, writing $M = 2 \| y \| + 1 gt.eq 1$, the initial cases hold, and the recurrence gives $2 \| y \| M^ell + M^(ell - 1) lt.eq M^(ell + 1)$ because $2 \| y \| M + 1 lt.eq M^2$.

For $1 lt.eq a < R lt.eq m$, define

$ y \( x \) = 1 + frac(2 \( a - x \), R - a) \, #h(2em) S_ell \( x \) = frac(C_ell \( y \( x \) \), C_ell \( y \( 0 \) \)) . $

The denominator is a positive real constant. As $x$ increases from zero to $a$, $y \( x \)$ decreases from $y \( 0 \) > 1$ to one; as $x$ increases from $a$ to $R$, $y \( x \)$ decreases from one to minus one. The preceding formulas therefore imply

#[#set math.equation(numbering: n => "(3.2)")
 $ S_ell \( 0 \) & = 1 \,\
\| S_ell \( x \) \| & lt.eq 1 &  & \( 0 lt.eq x lt.eq R \) \,\
\| S_ell \( x \) \| & lt.eq C_ell \( y \( 0 \) \)^(- 1) &  & \( a lt.eq x lt.eq R \) . $ <eq:normalized-chebyshev>]

Whenever $a lt.eq R \/ 2$, we have $R - a gt.eq 1$. For every $x in \[ 0 \, m \]$ it follows that $\| y \( x \) \| lt.eq 1 + 2 m lt.eq 3 m$. Since $C_ell \( y \( 0 \) \) gt.eq 1$, (3.1) yields the uniform bound

#[#set math.equation(numbering: n => "(3.3)")
 $ sup_(0 lt.eq x lt.eq m) \| S_ell \( x \) \| lt.eq \( 7 m \)^ell . $ <eq:normalized-global>]

For a useful exact expression for the denominator, put $z = sqrt(a \/ R)$. Defining

$ "artanh" z = 1 / 2 log frac(1 + z, 1 - z) quad \( 0 lt.eq z < 1 \) \, $

direct substitution into the exponential formula for $cosh$ gives

$ y \( 0 \) = frac(1 + z^2, 1 - z^2) = cosh #scale(x: 120%, y: 120%)[\(] 2 "artanh" z #scale(x: 120%, y: 120%)[\)] . $

Moreover, integration of $\( 1 - w^2 \)^(- 1)$ between zero and $z$ gives

#[#set math.equation(numbering: n => "(3.4)")
 $ z lt.eq "artanh" z lt.eq frac(z, 1 - z^2) . $ <eq:artanh-bound>]

Consequently, if $tau_0 = 2 "artanh" sqrt(a \/ R)$, then

$ C_ell \( y \( 0 \) \) = cosh \( ell tau_0 \) \, #h(2em) tau_0 gt.eq 2 sqrt(a \/ R) \, #h(2em) tau_0 = \( 2 + o \( 1 \) \) sqrt(a \/ R) $

as $a \/ R arrow.r 0$. These facts prove all the approximation estimates below.

=== 3.2 Approximating the zero projection <approximating-the-zero-projection>

#thm([Lemma 3.1.])[
  (Integer zero filter).  #emph[Fix $0 < q < L < 1$ and $r > \( q + L \) \/ 2$. For all sufficiently large integers $m$ there is a real polynomial $Q$ such that 
$ deg Q lt.eq m^r \, #h(2em) sup_(0 lt.eq x lt.eq m) \| Q \( x \) \| lt.eq exp \( m^r \) \, $

 and, for every integer $j$ with $0 lt.eq j lt.eq m^L$, 
$ \| Q \( j \) - upright(bold(1))_(j = 0) #scale(x: 120%, y: 120%)[\|] lt.eq exp \( - m^q \) . $

 In fact the construction has $Q \( 0 \) = 1$ exactly.]
] <lem:zero-filter>

#proof[
  Set
  $ a = ceil.l m^q ceil.r \, #h(2em) R = m^L \, #h(2em) ell = ⌈10 sqrt(a R) log \( 2 m \)⌉ . $
  Eventually $a lt.eq R \/ 2$, since $q < L$. The denominator estimate above and $cosh x gt.eq e^x \/ 2$ for $x gt.eq 0$ give
  $ C_ell \( y \( 0 \) \) gt.eq 1 / 2 exp #scale(x: 120%, y: 120%)[\(] 2 ell sqrt(a \/ R) #scale(x: 120%, y: 120%)[\)] gt.eq 1 / 2 \( 2 m \)^(20 a) gt.eq \( 2 m \)^(5 a) . $
  Define
  $ Q \( x \) = S_ell \( x \) product_(i = 1)^a (1 - x / i) . $
  Then $Q \( 0 \) = 1$, and $Q$ vanishes at each integer from one through $a$. For $0 lt.eq x lt.eq m$, the product has absolute value at most $\( m + 1 \)^a$. For $a lt.eq x lt.eq R$, (3.2) therefore gives
  $ \| Q \( x \) \| lt.eq frac(\( m + 1 \)^a, \( 2 m \)^(5 a)) lt.eq \( 2 m \)^(- 4 a) lt.eq exp \( - m^q \) . $
  This proves the required accuracy at all the integer arguments. Accuracy between the integers in $\( 0 \, a \)$ is neither claimed nor needed.
  For the degree and global size, put $beta = \( q + L \) \/ 2$. Since $q < beta$,
  $ deg Q lt.eq ell + a = O #scale(x: 120%, y: 120%)[\(] m^beta log \( 2 m \) #scale(x: 120%, y: 120%)[\)] . $
  The estimate (3.3) holds on the entire real interval $\[ 0 \, m \]$, including between the small integer roots, and gives
  $ sup_(0 lt.eq x lt.eq m) \| Q \( x \) \| lt.eq \( 7 m \)^ell \( m + 1 \)^a . $
  In particular,
  $ log sup_(0 lt.eq x lt.eq m) \| Q \( x \) \| lt.eq ell log \( 7 m \) + a log \( m + 1 \) = O #scale(x: 120%, y: 120%)[\(] m^beta \( log \( 2 m \) \)^2 #scale(x: 120%, y: 120%)[\)] . $
  For any fixed $r > beta$, both the degree and this logarithmic bound are at most $m^r$ eventually. Indeed, every fixed power of $log \( 2 m \)$ is $o \( m^(r - beta) \)$, as is seen by setting $w = log m$ and comparing a polynomial in $w$ with $e^(\( r - beta \) w)$. ◻
]

Since every $H_A$ has integer spectrum, this is a projection approximation in the required sense. More explicitly, with $Pi = upright(bold(1))_(H_A lt.eq m^L)$, the spectral theorem gives

$ ∥#scale(x: 120%, y: 120%)[\(] P_A - Q \( H_A \) #scale(x: 120%, y: 120%)[\)] Pi∥ lt.eq e^(- m^q) \, #h(2em) ∥Q \( H_A \)∥ lt.eq e^(m^r) . $

For every vector $xi$, splitting into the two spectral ranges yields

#[#set math.equation(numbering: n => "(3.5)")
 $ ∥#scale(x: 120%, y: 120%)[\(] P_A - Q \( H_A \) #scale(x: 120%, y: 120%)[\)] xi∥ lt.eq e^(- m^q) ∥xi∥ + \( 1 + e^(m^r) \) ∥upright(bold(1))_(H_A > m^L) xi∥ . $ <eq:zero-filter-vector>]

Its operator degree is at most $m^r$ by Lemma 6.

=== 3.3 A nonnegative tail detector <a-nonnegative-tail-detector>

#thm([Lemma 3.2.])[
  (Tail filter).  #emph[Fix $0 < v < h < u lt.eq 1$ and $s > 0$. Let $k$ be a degree exponent satisfying $k > s + \( u - h \) \/ 2$. For all sufficiently large integers $m$, there is a real polynomial $T$ with 
$ deg T lt.eq m^k \, #h(2em) T \( x \) gt.eq 0 quad \( x in bb(R) \) \, #h(2em) sup_(0 lt.eq x lt.eq m) T \( x \) lt.eq exp \( m^k \) \, $

 and 
$ 0 lt.eq T \( x \) & lt.eq 1 &  & \( 0 lt.eq x lt.eq m^u \) \,\
T \( x \) & lt.eq exp \( - m^s \) &  & \( 0 lt.eq x lt.eq m^v \) \,\
T \( x \) & gt.eq 1 / 4 &  & \( m^h lt.eq x lt.eq m^u \) . $

]
] <lem:tail-filter>

#proof[
  Set
  $ a = m^h \, #h(2em) R = m^u \, #h(2em) ell = ⌈3 sqrt(R \/ a)⌉ \, #h(2em) B \( x \) = 1 - S_ell \( x \)^2 . $
  Eventually $a lt.eq R \/ 2$, and (3.2) gives $0 lt.eq B lt.eq 1$ on $\[ 0 \, R \]$. The denominator satisfies $C_ell \( y \( 0 \) \) gt.eq cosh 6$ by (3.4). Hence, on $\[ a \, R \]$,
  $ B \( x \) gt.eq 1 - \( cosh 6 \)^(- 2) > 7 / 8 . $
  For example, $cosh 6 gt.eq 1 + 6^2 \/ 2 = 19$ proves the last strict inequality.
  We next verify uniformly that $B \( x \) arrow.r 0$ on $\[ 0 \, m^v \]$. Put $z = sqrt(a \/ R)$, which tends to zero, and for this low range put
  $ z_x = sqrt(frac(a - x, R - x)) . $
  These are positive eventually because $m^v \/ a arrow.r 0$. The same hyperbolic identity gives
  $ y \( x \) = cosh #scale(x: 120%, y: 120%)[\(] 2 "artanh" z_x #scale(x: 120%, y: 120%)[\)] \, #h(2em) S_ell \( x \) = frac(cosh \( 2 ell "artanh" z_x \), cosh \( 2 ell "artanh" z \)) . $
  Now
  $ z_x / z = sqrt(frac(1 - x \/ a, 1 - x \/ R)) arrow.r 1 quad upright("uniformly for ") 0 lt.eq x lt.eq m^v \, #h(2em) ell z arrow.r 3 . $
  Also $0 < z_x lt.eq z$ in this range. The inequalities (3.4) show uniformly that $"artanh" z_x \/ z_x arrow.r 1$ and $"artanh" z \/ z arrow.r 1$. Both hyperbolic cosine arguments therefore tend uniformly to six. Their ratio tends uniformly to one, which proves $0 lt.eq B \( x \) lt.eq 1 \/ 8$ on $\[ 0 \, m^v \]$ eventually.
  Choose an odd integer $J$ with $10 m^s lt.eq J < 10 m^s + 2$ and define the majority polynomial
  $ M_J \( z \) = sum_(i = \( J + 1 \) \/ 2)^J binom(J, i) z^i \( 1 - z \)^(J - i) . $
  For $z in \[ 0 \, 1 \]$ its summands are nonnegative and their full binomial sum is one, so $0 lt.eq M_J \( z \) lt.eq 1$. On $0 lt.eq z lt.eq 1 \/ 8$,
  $ M_J \( z \) lt.eq 2^J z^(J \/ 2) lt.eq 2^(- J \/ 2) . $
  Changing the summation index in the complementary binomial sum gives $M_J \( 1 - z \) = 1 - M_J \( z \)$, since $J$ is odd. Therefore $M_J \( z \) gt.eq 1 - 2^(- J \/ 2)$ for $7 \/ 8 lt.eq z lt.eq 1$.
  Take
  $ T \( x \) = #scale(x: 120%, y: 120%)[\(] M_J \( B \( x \) \) #scale(x: 120%, y: 120%)[\)]^2 . $
  This square of a real polynomial is nonnegative at every real argument. It lies in $\[ 0 \, 1 \]$ on $\[ 0 \, R \]$. On $\[ 0 \, m^v \]$ it is at most $2^(- J) lt.eq exp \( - m^s \)$, since $J gt.eq 10 m^s$ and $10 log 2 > 1$. On $\[ a \, R \]$ it is at least $\( 1 - 2^(- J \/ 2) \)^2 gt.eq 1 \/ 4$ eventually.
  It remains to control its degree and its growth on $\[ 0 \, m \]$, where $B$ need not lie in $\[ 0 \, 1 \]$. Write $A = \( 7 m \)^(2 ell) gt.eq 1$. By (3.3), throughout this whole interval,
  $ \| B \( x \) \| lt.eq 1 + A \, #h(2em) \| 1 - B \( x \) \| lt.eq A . $
  Taking absolute values in the binomial formula, and then including all indices in its sum, gives
  $ \| M_J \( B \( x \) \) \| lt.eq #scale(x: 120%, y: 120%)[\(] \| B \( x \) \| + \| 1 - B \( x \) \| #scale(x: 120%, y: 120%)[\)]^J lt.eq \( 1 + 2 A \)^J lt.eq \( 3 A \)^J . $
  Thus the required global estimates, including the final square, are
  $ deg T lt.eq 4 ell J \, #h(2em) sup_(0 lt.eq x lt.eq m) \| T \( x \) \| lt.eq 9^J \( 7 m \)^(4 ell J) . $
  With $beta = s + \( u - h \) \/ 2$, we have $ell J = O \( m^beta \)$, and hence
  $ deg T = O \( m^beta \) \, #h(2em) log sup_(0 lt.eq x lt.eq m) \| T \( x \) \| lt.eq J log 9 + 4 ell J log \( 7 m \) = O #scale(x: 120%, y: 120%)[\(] m^beta log \( 2 m \) #scale(x: 120%, y: 120%)[\)] . $
  The fixed strict inequality $k > beta$ makes each bound at most $m^k$ eventually. This proves the lemma, including the endpoint case $u = 1$. ◻
]

Evaluating $T$ at a count operator gives a positive semidefinite operator of degree at most $m^k$ and norm at most $e^(m^k)$. In particular, its global nonnegativity prevents contributions from outside $\[ m^h \, m^u \]$ from cancelling the detected tail in a quadratic form.

== 4 Propagation of low-degree perturbations <sec:propagation>

Pauli expansions and low-degree approximations have been used to study $sans(Q A C)^0$ #cite(label("NadimpalliParhamVasconcelosYuen2024")) #cite(label("AnshuDongOuYao2025")) #cite(label("DongOuYao2025")). Here regularity lets us replace the large product projections arising from conjugation by polynomials of small degree. The resulting approximation controls a perturbed vector along an exact reference trajectory.

#thm([Proposition 4.1.])[
  (Low-degree propagation).  #emph[Let $V$ be a circuit with a bounded number of analytic layers, and suppose the trajectory from $zeta$, with $∥zeta∥ lt.eq 1$, is regular for $V$. Here $k \, K$ denote degree exponents: fix $0 < k < K < 1$. For every operator $E$ with 
$ deg E lt.eq m^k \, #h(2em) ∥E∥ lt.eq exp \( m^k \) \, $

 there is, eventually, an operator $E'$ such that 
#[#set math.equation(numbering: n => "(4.1)")
 $ ∥V E zeta - E' V zeta∥ lt.eq exp \( - m^k \) \,\
deg E' lt.eq m^K \, #h(2em) ∥E'∥ lt.eq exp \( m^K \) . $ <eq:propagation>]

 The starting vector need not be a product vector.]
] <prop:propagation>

#proof[
  We first prove the one-layer assertion with the stronger error $o \( exp \( - m^k \) \)$. Conjugation by a layer of one-qubit unitaries preserves both degree and operator norm and gives zero error. It remains to consider a layer
  $ F = product_g \( I - 2 P_g \) $
  of reflections on pairwise disjoint supports. Set $xi = F zeta$.
  #emph[A controlled local expansion.] On one qubit use the unitary matrices $I \, X \, Z \, X Z$, where
  $ X = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) Z = mat(delim: "(", 1, 0; 0, - 1) . $
  Their tensor products form an orthonormal basis for the inner product $2^(- m) "Tr" \( A^dagger B \)$. Thus the unique expansion of $E$ is
  $ E = sum_D c_D D \, #h(2em) c_D = 2^(- m) "Tr" \( D^dagger E \) . $
  Put $ell = floor.l m^k floor.r$. Every summand in any degree-$ell$ decomposition of $E$ has zero coefficient against a tensor $D$ whose support is not contained in that summand’s support: a nonidentity factor of $D$ outside the support has trace zero. Consequently $c_D = 0$ whenever $lr(|"supp" D|) > ell$. This conclusion requires no bound on the norms or coefficients of the original decomposition. Also,
  $ lr(|c_D|) lt.eq 2^(- m) thin 2^m ∥D^dagger E∥ = ∥E∥ \, $
  because $lr(|"Tr" M|) lt.eq 2^m ∥M∥$ for every operator on $m$ qubits. There are at most
  $ N_m = sum_(j = 0)^ell binom(m, j) 3^j lt.eq \( ell + 1 \) \( 3 m \)^ell $
  possible nonzero coefficients, and hence $sum_D lr(|c_D|) lt.eq exp \( m^k \) N_m$.
  Fix one such $D$, supported on $J$, and let $cal(T)$ be the gates whose supports meet $J$. Disjointness gives $lr(|cal(T)|) lt.eq lr(||) J lt.eq ell$. All other reflections commute with $D$ and cancel in $F D F^dagger$. With $P_(cal(L)) = product_(g in cal(L)) P_g$ and empty products interpreted as identities, expansion on both sides gives
  $ F D F^dagger = sum_(cal(L) \, cal(R) subset.eq cal(T)) \( - 2 \)^(lr(|cal(L)|) + lr(|cal(R)|)) P_(cal(L)) D P_(cal(R)) . $
  Factor the Hilbert space across $J$ and $J^c$, writing $D = D_J ⊗ I$ and $P_g = A_g ⊗ B_g$. The factors $A_g$ and $B_g$ are the corresponding product projections, possibly identities. If $A_(cal(L)) = product_(g in cal(L)) A_g$, then each term factors as
  $ P_(cal(L)) D P_(cal(R)) = M ⊗ Q \, #h(2em) M = A_(cal(L)) D_J A_(cal(R)) \, #h(2em) Q = product_(g in cal(L) union cal(R)) B_g . $
  Indeed, the exterior factors have disjoint supports for distinct gates, and repeated factors satisfy $B_g^2 = B_g$. The operator $M$ has norm at most one. Its displayed order is retained; no projection on $J$ has been commuted through $D_J$. The sum of the absolute scalar coefficients in this expansion is
  $ sum_(cal(L) \, cal(R) subset.eq cal(T)) 2^(lr(|cal(L)|) + lr(|cal(R)|)) = 9^(lr(|cal(T)|)) lt.eq 9^ell . $
  #emph[Replacing the exterior projections.] Let $H_Q$ count failures of the one-qubit factors of $Q$, extended by identity outside their sites. Thus $Q = upright(bold(1))_(H_Q = 0)$ on $J^c$; when this test is empty its count is zero. The operator $H_Q$ is a partial sum of the commuting site counts in $H_(cal(T))$. In their common eigenbasis, its value is at most that of $H_(cal(T))$.
  Choose fixed exponents
  $ k < p_1 < L < K \, #h(2em) frac(L + p_1, 2) < r < p_2 < L . $
  Such a choice exists since $\( L + p_1 \) \/ 2 < L$; in particular, $k < p_1 < r < p_2 < L < K$. Regularity, used with $\( b \, h \, p \) = \( k \, L \, p_2 \)$, holds uniformly over $cal(T)$ and gives
  $ ∥upright(bold(1))_(H_Q > m^L) xi∥ lt.eq ∥upright(bold(1))_(H_(cal(T)) gt.eq m^L) xi∥ lt.eq exp \( - m^(p_2) \) . $
  Here the reference vector is exactly $F zeta$, before applying $M$.
  By Lemma 7, choose a real polynomial $f$ of degree at most $m^r$, bounded in absolute value by $exp \( m^r \)$ on $\[ 0 \, m \]$, whose error in approximating $upright(bold(1))_(x = 0)$ is at most $exp \( - m^(p_1) \)$ at every integer $0 lt.eq x lt.eq m^L$. The spectrum of $H_Q$ is integral. Splitting $xi$ into counts at most $m^L$ and larger counts therefore yields
  $ ∥\( Q - f \( H_Q \) \) xi∥ & lt.eq exp \( - m^(p_1) \) ∥xi∥ + #scale(x: 120%, y: 120%)[\(] 1 + exp \( m^r \) #scale(x: 120%, y: 120%)[\)] ∥upright(bold(1))_(H_Q > m^L) xi∥\
 & lt.eq exp \( - m^(p_1) \) + #scale(x: 120%, y: 120%)[\(] 1 + exp \( m^r \) #scale(x: 120%, y: 120%)[\)] exp \( - m^(p_2) \) . $
  In this display $Q$ and $f \( H_Q \)$ act as identity on $J$. Applying the contraction $M$ afterwards cannot increase the error.
  Define $E_F$ by replacing each exterior $Q$ in the expansion of $F E F^dagger$ by $f \( H_Q \)$, retaining its coefficient and its factor $M$. The total absolute coefficient mass is at most
  $ Lambda_m = exp \( m^k \) \( ell + 1 \) \( 27 m \)^ell \, #h(2em) log Lambda_m = O \( m^k log m \) . $
  It follows that
  $ ∥F E zeta - E_F F zeta∥ & lt.eq Lambda_m [exp \( - m^(p_1) \) + #scale(x: 120%, y: 120%)[\(] 1 + exp \( m^r \) #scale(x: 120%, y: 120%)[\)] exp \( - m^(p_2) \)]\
 & lt.eq 3 exp #scale(x: 120%, y: 120%)[\(] - 1 / 2 m^(p_1) #scale(x: 120%, y: 120%)[\)] = o #scale(x: 120%, y: 120%)[\(] exp \( - m^k \) #scale(x: 120%, y: 120%)[\)] $
  eventually. To check the second inequality, use $log Lambda_m = o \( m^(p_1) \)$, $r < p_2$, and $p_1 < p_2$; each of the two bracketed contributions, after multiplication by $Lambda_m$, is absorbed by the displayed bound.
  Each new term has degree at most $ell + m^r$: its factor on $J$ has support size at most $ell$, and expanding the polynomial in one-site counts gives degree at most $m^r$ on the remaining sites. Its norm is at most $exp \( m^r \)$. Thus, eventually,
  $ deg E_F lt.eq ell + m^r lt.eq m^K \, #h(2em) ∥E_F∥ lt.eq Lambda_m exp \( m^r \) lt.eq exp \( m^K \) \, $
  because $k < r < K$ and $log Lambda_m = O \( m^k log m \)$. This proves the stronger one-layer assertion, uniformly over the admissible $E$.
  #emph[A bounded number of layers.] Pad by identity layers so that $V = U_t dots.h.c U_1$ has a fixed number $t$ of layers. The case $t = 0$ is immediate with $E' = E$. For $t gt.eq 1$, choose a fixed increasing chain
  $ k = k_0 < k_1 < dots.h.c < k_t = K . $
  Let $zeta_0 = zeta$ and $zeta_i = U_i zeta_(i - 1)$ be the exact regular reference trajectory. Set $E_0 = E$ and apply the one-layer result successively with exponents $\( k_(i - 1) \, k_i \)$ to obtain $E_i$ with degree at most $m^(k_i)$, norm at most $exp \( m^(k_i) \)$, and local residual
  $ delta_i = U_i E_(i - 1) zeta_(i - 1) - E_i zeta_i \, #h(2em) ∥delta_i∥ = o #scale(x: 120%, y: 120%)[\(] exp \( - m^(k_(i - 1)) \) #scale(x: 120%, y: 120%)[\)] . $
  For the exact perturbed evolution $eta_0 = E zeta$, $eta_i = U_i eta_(i - 1)$, put $r_i = eta_i - E_i zeta_i$. Then $r_0 = 0$ and the exact recurrence is
  $ r_i = U_i r_(i - 1) + delta_i . $
  Unitarity implies
  $ ∥r_t∥ lt.eq sum_(i = 1)^t ∥delta_i∥ = o #scale(x: 120%, y: 120%)[\(] exp \( - m^k \) #scale(x: 120%, y: 120%)[\)] lt.eq exp \( - m^k \) $
  eventually. In particular, no later approximating operator acts on an earlier residual. Taking $E' = E_t$ proves (4.1). ◻
]

== 5 Transporting excitation tails <sec:transport>

The next lemma compares two regular trajectories joined at their final endpoint by a product projection. Its proof uses the two filters of Section 3 in different directions. A tail filter $T$ is propagated forward along the projected trajectory, producing an effective range on which the final projection can be approximated by a polynomial $D$. That polynomial is then propagated backwards along the original trajectory. The resulting scalar product is small because $T$ suppresses low counts while the original vector has small high-count tails. Positivity of $T$ converts this estimate into a tail bound for the projected vector.

#thm([Lemma 5.1.])[
  (Tail transport).  #emph[Let $V$ have a bounded number of analytic layers, let $A$ and $B$ be tests at its initial and final endpoints, respectively, and put 
$ chi = V^dagger P_B V psi \, #h(2em) ∥psi∥ lt.eq 1 . $

 Assume that both the trajectory from $psi$ and the trajectory from $chi$ are regular for $V$. Fix $0 lt.eq b < 1$. Suppose that, for every fixed $b < h < 1$ and $0 < p < h$, eventually 
#[#set math.equation(numbering: n => "(5.1)")
 $ ∥upright(bold(1))_(H_A gt.eq m^h) psi∥ lt.eq exp \( - m^p \) . $ <eq:input-tail>]

 Then, for every such fixed pair $h \, p$, eventually 
$ ∥upright(bold(1))_(H_A gt.eq m^h) chi∥ lt.eq exp \( - m^p \) . $

 The tests and vectors may vary along the sequence, and $chi$ is not normalized.]
] <lem:tail-transport>

Figure 1 records the two uses of regularity. The forward propagation concerns $T chi$, whereas the reverse propagation concerns $D V psi$. Neither filtered vector is assumed to have a regular trajectory. In the diagram, $K$ is the degree exponent produced by forward propagation. The zero filter $D$ has degree at most $m^r$. Reverse propagation approximates $V^dagger D V psi$ by $G psi$, where $G$ has degree at most $m^(r')$; the proof below constructs these objects and proves the displayed bounds.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.1), [#text(size: 9pt)[Start]])
  content((8.5, 1.1), [#text(size: 9pt)[Finish]])
  content((0, 0), [#box(width: 3.4cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$T chi$#linebreak() $ T chi "rVert" lt.eq 2$]]])])
  content((8.5, 0), [#box(width: 3.4cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"VT" chi$#linebreak() effective $H_B$-count range $m^K$]]])])
  line((1.7, 0), (6.8, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  content((4.25, 0), [#text(size: 9pt)[propagate $T$ along $chi$]], anchor: "north", padding: 0.1176cm)
  content((0, -2.2), [#box(width: 3.4cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fffaf5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$G psi$#linebreak() $deg G lt.eq m^(r')$]]])])
  content((8.5, -2.2), [#box(width: 3.4cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#b25a00"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#fffaf5"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$"DV" psi$#linebreak() $D=D(H_B)$: zero filter]]])])
  line((6.8, -2.2), (1.7, -2.2), stroke: (paint: rgb("#b25a00"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#b25a00"))))
  content((4.25, -2.2), [#text(size: 9pt)[vector error $lt.eq exp (-m^r)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two transports in Lemma 10. The forward step establishes a tail bound for $V T chi$ outside the count range $m^K$; the projection approximation is estimated on this vector. The backward step acts on the unfiltered reference $V psi$. Its error is paired with $T chi$, whose norm is bounded by two. ],
) <fig:transport>

The proof descends from the automatic zero tail above $m$ to the requested threshold. At one step, a known tail bound above $m^u$ controls the tail filter’s global growth while the filter detects the new band $m^h lt.eq H_A lt.eq m^u$. The following lemma supplies compatible exponent gaps for this step. Here $u \, h$ are the exponents for the old and new count thresholds, with tail precision exponents $u - alpha$ and $h - beta$. The tail filter has suppression exponent $s$ and degree and logarithmic norm bounds with exponent $k$, enlarged to $K$ under forward propagation; the zero filter has precision exponent $q$ and degree and logarithmic norm bounds with exponent $r$, enlarged to $r'$ under reverse propagation. Finally, $v_0 < v$ are initial count cutoff exponents, and $theta$ is the precision exponent used for the assumed input tail above $m^(v_0)$.

#thm([Lemma 5.2.])[
  (Exponent budget).  #emph[Suppose 
$ 0 lt.eq b < h < u lt.eq 1 \, #h(2em) 0 < alpha < beta < h \, #h(2em) u - h < alpha . $

 There are fixed exponents $q \, k \, K \, r \, r' \, s \, v_0 \, v \, theta$ satisfying 
$ 0 < h - beta < q < r < r' < s < k < h \, #h(2em) k < K < 1 \, #h(2em) k < u - alpha \,\
frac(K + q, 2) < r \, #h(2em) s + frac(u - h, 2) < k \,\
max { b \, r' } < v_0 < v < h \, #h(2em) r' < theta < v_0 . $

 All these inequalities have strictly positive margins independent of $m$.]
] <lem:exponent-budget>

#proof[
  Write $eta = u - h$ and choose $alpha < lambda < nu < beta$. Set
  $ k = u - lambda \, #h(2em) q = h - nu . $
  Then $q > h - beta > 0$, $k - q = eta + nu - lambda > 0$, and $k < h$ because $lambda > alpha > eta$. In particular $k < 1$. Choose
  $ 0 < e < min { nu - lambda \, 1 - k } \, #h(2em) K = k + e . $
  The interval available for the remaining filter exponents has width
  $ w = (k - eta / 2) - frac(K + q, 2) = frac(nu - lambda - e, 2) > 0 . $
  With $a_0 = \( K + q \) \/ 2$, take
  $ r = a_0 + w / 4 \, #h(2em) r' = a_0 + w / 2 \, #h(2em) s = a_0 + frac(3 w, 4) . $
  Thus
  $ r - a_0 = r' - r = s - r' = k - s - eta / 2 = w / 4 > 0 . $
  These choices give $q < r < r' < s < k < h$, as well as $k < u - alpha$. Since $max { b \, r' } < h$, choose $v_0 \, v$ strictly between these endpoints in the stated order and then choose $r' < theta < v_0$. Each choice is made among fixed real numbers. ◻
]

#proof[
  Fix target exponents $b < h_(*) < 1$ and $0 < p_(*) < h_(*)$. Set
  $ delta = frac(h_(*) - p_(*), 4) \, #h(2em) N = ⌈frac(2 \( 1 - h_(*) \), delta)⌉ \, #h(2em) eta = frac(1 - h_(*), N) . $
  Here $N gt.eq 1$ is fixed and $0 < eta lt.eq delta \/ 2$. Define
  $ h_i = 1 - i eta \, #h(2em) alpha_i = delta + frac(i delta, N) #h(2em) \( 0 lt.eq i lt.eq N \) . $
  We descend from $h_0 = 1$ to $h_N = h_(*)$, proving at step $i gt.eq 1$ that
  $ ∥upright(bold(1))_(H_A gt.eq m^(h_i)) chi∥ lt.eq exp #scale(x: 120%, y: 120%)[\(] - m^(h_i - alpha_i) #scale(x: 120%, y: 120%)[\)] . $
  To start, the tail #emph[strictly above] $m^(h_0) = m$ is zero, since the spectrum of $H_A$ is contained in ${ 0 \, dots.h \, m }$. No estimate on the eigenspace of count $m$, and no regularity condition at exponent one, is needed.
  Fix a step and abbreviate
  $ u = h_(i - 1) \, #h(2em) h = h_i \, #h(2em) alpha = alpha_(i - 1) \, #h(2em) beta = alpha_i . $
  Its induction hypothesis is
  $ ∥upright(bold(1))_(H_A > m^u) chi∥ lt.eq exp #scale(x: 120%, y: 120%)[\(] - m^(u - alpha) #scale(x: 120%, y: 120%)[\)] . $
  For $i > 1$ this follows from the preceding, stronger inclusive bound. The parameters obey the hypotheses of Lemma 11: indeed, $u - h = eta < delta lt.eq alpha$ and $beta lt.eq 2 delta < h_(*) lt.eq h$. Choose its exponents once for this step. All subsequent estimates are for sufficiently large $m$.
  #emph[Forward propagation on the trajectory of $chi$.] Apply Lemma 8 with parameters $v \, h \, u \, s \, k$, and write $T = T \( H_A \)$ for its polynomial evaluated at the initial count. It is self-adjoint and nonnegative. Its degree is at most $m^k$, its global norm is at most $exp \( m^k \)$, and
  $ ∥upright(bold(1))_(H_A lt.eq m^v) T chi∥ lt.eq exp \( - m^s \) \, $
  because $∥chi∥ lt.eq 1$. Splitting at the previous scale gives
  $ ∥T chi∥ & lt.eq ∥upright(bold(1))_(H_A lt.eq m^u) chi∥ + ∥T∥ thin ∥upright(bold(1))_(H_A > m^u) chi∥\
 & lt.eq 1 + exp #scale(x: 120%, y: 120%)[\(] m^k - m^(u - alpha) #scale(x: 120%, y: 120%)[\)] lt.eq 2 . $
  This is the first use of a global polynomial norm; it is paid for by $k < u - alpha$.
  Proposition 9, applied with exponents $k < K$ to the regular reference trajectory from $chi$, gives an operator $E$ such that
  $ ∥V T chi - E V chi∥ lt.eq exp \( - m^k \) \, #h(2em) deg E lt.eq m^K \, #h(2em) ∥E∥ lt.eq exp \( m^K \) . $
  The endpoint $V chi = P_B V psi$ has exactly zero $H_B$ count. By Lemma 6, $upright(bold(1))_(H_B > m^K) E V chi = 0$. Therefore the filtered vector has the effective-range bound
  $ ∥upright(bold(1))_(H_B > m^K) V T chi∥ lt.eq exp \( - m^k \) . $
  #emph[Approximating the final projection on the controlled side.] Use Lemma 7 with precision exponent $q$, range exponent $K$, and degree exponent $r$. These satisfy $0 < q < K < 1$ and $r > \( K + q \) \/ 2$. Write $D = D \( H_B \)$ for the resulting self-adjoint operator. It has degree at most $m^r$, norm at most $exp \( m^r \)$, and error at most $exp \( - m^q \)$ from $P_B$ on every integer count at most $m^K$. The preceding bound and $∥V T chi∥ lt.eq 2$ imply
  $ ∥\( P_B - D \) V T chi∥ & lt.eq 2 exp \( - m^q \) + #scale(x: 120%, y: 120%)[\(] 1 + exp \( m^r \) #scale(x: 120%, y: 120%)[\)] exp \( - m^k \)\
 & = O #scale(x: 120%, y: 120%)[\(] exp \( - m^q \) #scale(x: 120%, y: 120%)[\)] . $
  Here $q < r < k$ absorbs the global norm of $D$ on the remaining tail. Only integer approximation is used, as required for the spectrum of $H_B$.
  Let $a_m = chevron.l chi \, T chi chevron.r gt.eq 0$. Since $T$ is self-adjoint and $V chi = P_B V psi$,
  $ a_m = chevron.l V T chi \, P_B V psi chevron.r . $
  Moving the self-adjoint difference $P_B - D$ to the first argument gives
  $ lr(|a_m - chevron.l V T chi \, D V psi chevron.r|) & = lr(|chevron.l \( P_B - D \) V T chi \, V psi chevron.r|)\
 & lt.eq ∥\( P_B - D \) V T chi∥ thin ∥V psi∥ = O #scale(x: 120%, y: 120%)[\(] exp \( - m^q \) #scale(x: 120%, y: 120%)[\)] . $
  Thus the projection is approximated on $V T chi$, the vector for which an effective count range has just been proved.
  #emph[Reverse propagation on the trajectory of $psi$.] The reversed trajectory starting at $V psi$ is regular for $V^dagger$. Applying Proposition 9 to $D$ with exponents $r < r'$ gives an operator $G$ satisfying
  $ ∥V^dagger D V psi - G psi∥ lt.eq exp \( - m^r \) \, #h(2em) deg G lt.eq m^(r') \, #h(2em) ∥G∥ lt.eq exp \( m^(r') \) . $
  This application uses the unfiltered reference vector $V psi$. In the scalar product its error is multiplied by the vector norm $∥T chi∥ lt.eq 2$, so
  $ lr(|a_m - chevron.l T chi \, G psi chevron.r|) lt.eq O #scale(x: 120%, y: 120%)[\(] exp \( - m^q \) #scale(x: 120%, y: 120%)[\)] + 2 exp \( - m^r \) = O #scale(x: 120%, y: 120%)[\(] exp \( - m^q \) #scale(x: 120%, y: 120%)[\)] . $
  The global operator norm of $T$ introduces no factor here.
  #emph[Splitting the scalar product by the initial count.] Put $Q = upright(bold(1))_(H_A lt.eq m^v)$. Its low-count contribution satisfies
  $ lr(|chevron.l Q T chi \, Q G psi chevron.r|) lt.eq exp \( - m^s \) thin exp \( m^(r') \) . $
  For the high-count contribution, first observe that $m^(v_0) + m^(r') < m^v$ eventually. The degree-shift property implies
  $ \( I - Q \) G upright(bold(1))_(H_A lt.eq m^(v_0)) = 0 . $
  Using (5.1) with threshold exponent $v_0 > b$ and precision exponent $theta < v_0$ gives
  $ ∥\( I - Q \) G psi∥ & lt.eq ∥G∥ thin ∥upright(bold(1))_(H_A > m^(v_0)) psi∥\
 & lt.eq exp #scale(x: 120%, y: 120%)[\(] m^(r') - m^theta #scale(x: 120%, y: 120%)[\)] . $
  Orthogonality of $Q$ and $I - Q$ now yields
  $ lr(|chevron.l T chi \, G psi chevron.r|) & lt.eq exp #scale(x: 120%, y: 120%)[\(] m^(r') - m^s #scale(x: 120%, y: 120%)[\)] + 2 exp #scale(x: 120%, y: 120%)[\(] m^(r') - m^theta #scale(x: 120%, y: 120%)[\)]\
 & = O #scale(x: 120%, y: 120%)[\(] exp \( - m^q \) #scale(x: 120%, y: 120%)[\)] \, $
  since $s > r' > q$ and $theta > r' > q$. These two strict gaps pay for the two uses of the global norm of $G$. In particular there is a constant $C_0$, independent of $m$, with
  $ 0 lt.eq a_m lt.eq C_0 exp \( - m^q \) $
  eventually. No commutation between $G$ and the count projections has been assumed.
  #emph[Positivity and descent.] The tail filter is at least $1 \/ 4$ on $\[ m^h \, m^u \]$ and nonnegative on the entire spectrum. Consequently
  $ ∥upright(bold(1))_(m^h lt.eq H_A lt.eq m^u) chi∥^2 lt.eq 4 a_m lt.eq 4 C_0 exp \( - m^q \) . $
  Combining this band with the previous upper tail gives
  $ ∥upright(bold(1))_(H_A gt.eq m^h) chi∥^2 lt.eq 4 C_0 exp \( - m^q \) + exp #scale(x: 120%, y: 120%)[\(] - 2 m^(u - alpha) #scale(x: 120%, y: 120%)[\)] . $
  Set $a = h - beta > 0$. The exponent budget gives $q > a$, and $u - alpha - a = \( u - h \) + \( beta - alpha \) > 0$. Multiplying the last right-hand side by $exp \( 2 m^a \)$ therefore makes both terms tend to zero. Taking the square root proves
  $ ∥upright(bold(1))_(H_A gt.eq m^h) chi∥ lt.eq exp \( - m^(h - beta) \) $
  eventually, closing the descending step. The strict power gap $q > a$ absorbs the square root and all fixed constants.
  There are only $N$ descending steps. Each uses Proposition 9 over the same bounded number of layers with fixed positive exponent gaps $K - k$ and $r' - r$. These gaps can be subdivided into that fixed number of positive increments as in its proof. Different descending steps retain only the improved tail assertion; their approximating operators are not composed. Thus every choice and every number of steps is independent of $m$, and the finitely many eventual estimates hold simultaneously after increasing the threshold for $m$.
  At the final scale,
  $ h_N - alpha_N = h_(*) - 2 delta = frac(h_(*) + p_(*), 2) > p_(*) . $
  The final induction bound implies the desired estimate at $h_(*) \, p_(*)$. Since these targets were arbitrary, the lemma follows. ◻
]

== 6 Projection insertion and pruning <sec:pruning>

The tail-transport lemma assumes regularity of two trajectories. We first use it on successively longer suffixes to show that inserting a product projection preserves regularity. Two consequences for product starting states will then allow us to construct regular trajectories by deleting reflections with small projection probability. Gate deletion by a telescoping estimate also appears in the Pauli-spectrum approach of #cite(label("NadimpalliParhamVasconcelosYuen2024"), form: "prose") Lemma 23 and Claim 24, where width controls a Frobenius-norm error. Here deletion depends on projection probability in the actual pruned-prefix state; the retained layer must then satisfy the regularity condition for every fixed exponent triple.

#thm([Proposition 6.1.])[
  (Projection insertion).  #emph[Let $W = U_t dots.h.c U_1$ have a bounded number of layers, and suppose the trajectory 
$ psi_j = U_j dots.h.c U_1 psi_0 \, #h(2em) 0 lt.eq j lt.eq t \, $

 is regular, with $∥psi_0∥ lt.eq 1$. For any product test $B$ at the output, set 
$ chi_t = P_B psi_t \, #h(2em) chi_j = U_(j + 1)^dagger dots.h.c U_t^dagger chi_t quad \( 0 lt.eq j < t \) . $

 Then the trajectory $\( chi_j \)_(j = 0)^t$ is regular for $W$.]
] <prop:projection-insertion>

#proof[
  All the vectors $chi_j$ have norm at most one. We prove their regularity at the layers in decreasing order of the layer index. Suppose regularity has already been established at every layer strictly after layer $j$. There is nothing to prove if $U_j$ is a layer of one-qubit unitaries. Otherwise, fix $0 lt.eq b < 1$ and choose, at each member of the circuit sequence, a set $S$ of at most $m^b$ reflections in this layer. Let $H_A = H_S$ be their joint count and put
  $ V = U_t dots.h.c U_(j + 1) . $
  This is the suffix #emph[strictly after] layer $j$, and $chi_j = V^dagger P_B V psi_j$. The trajectory of $psi_j$ on $V$ is regular by hypothesis; that of $chi_j$ on $V$ is regular by the induction hypothesis. Regularity of the original trajectory at layer $j$ also gives, for every fixed $b < h < 1$ and $0 < p < h$,
  $ ∥upright(bold(1))_(H_A gt.eq m^h) psi_j∥ lt.eq exp \( - m^p \) quad upright("eventually") . $
  Lemma 10 therefore gives the same estimate for $chi_j$. The count $H_S$ commutes with every reflection of layer $j$, so this estimate holds on $chi_(j - 1)$ as well.
  The chosen sets $S$ may vary with the circuit sequence. For each fixed triple $\( b \, h \, p \)$, Lemma 3 consequently makes the estimate eventual and uniform over all eligible $S$. This proves regularity at layer $j$ and completes the induction. Its first step uses the empty suffix, whose regularity hypotheses are vacuous. ◻
]

#thm([Corollary 6.2.])[
  (Tail at a product input).  #emph[Suppose $psi_0$ is a normalized product state and its trajectory under $W$ is regular. Let $P_0 = \| psi_0 chevron.r chevron.l psi_0 \|$ be the full product projection and $H_0$ its count. For any product test $B$ at the output and every fixed $0 < p < h < 1$, 
#[#set math.equation(numbering: n => "(6.1)")
 $ ∥upright(bold(1))_(H_0 gt.eq m^h) W^dagger P_B W psi_0∥ lt.eq exp \( - m^p \) quad upright("eventually") . $ <eq:product-tail>]

]
] <cor:product-tail>

#proof[
  The original trajectory is regular by assumption and the projected trajectory is regular by Proposition 12. Since $H_0 psi_0 = 0$, the input-tail hypothesis of Lemma 10 holds with $b = 0$. Applying that lemma to $V = W$ proves the claim. ◻
]

#thm([Corollary 6.3.])[
  (Overlap and output tail).  #emph[Under the hypotheses of Corollary 13, write $psi_t = W psi_0$. For any product test $B$ at the output and every fixed $0 < p < h < 1$, 
#[#set math.equation(numbering: n => "(6.2)")
 $ ∥P_B psi_t∥^2 ∥upright(bold(1))_(H_B gt.eq m^h) psi_t∥ lt.eq exp \( - m^p \) quad upright("eventually") . $ <eq:overlap-tail>]

 For each fixed $\( h \, p \)$, both this estimate and (6.1) hold eventually uniformly over the output test $B$.]
] <cor:overlap-tail>

#proof[
  Put $chi_t = P_B psi_t$ and $q_B = ∥P_B psi_t∥^2$. Apply Lemma 10 to the reverse circuit $V = W^dagger$, starting at $chi_t$, with initial count $H_B$ and final projection $P_0$. The starting vector has zero $H_B$ count. Its trajectory is regular by Proposition 12 and reversal. The projected-and-returned vector is exactly
  $ W P_0 W^dagger chi_t & = psi_t thin chevron.l psi_0 \, W^dagger P_B W psi_0 chevron.r\
 & = q_B psi_t . $
  Its reverse trajectory is the original trajectory multiplied by $q_B in \[ 0 \, 1 \]$, hence is regular too. The lemma, with $b = 0$, now gives (6.2). In particular, the multiplier is the #emph[probability] $q_B$, not its square root: no projected vector has been normalized.
  For uniformity, fix $\( h \, p \)$ and suppose that either estimate fails for some test at arbitrarily large indices. Choose a violating test at those indices and any test at the others. The resulting single sequence of tests contradicts the estimate just proved. Thus tests may be selected using the exact circuit and its output state. The threshold may depend on the fixed exponents; no threshold uniform over all real exponent pairs is asserted. ◻
]

#thm([Lemma 6.4.])[
  (A retained layer is regular).  #emph[Let $W$ have a regular trajectory from a normalized product state, and write $psi = W psi_0$. Consider a proposed next layer of disjoint reflections $I - 2 P_g$. Retain precisely the gates satisfying 
#[#set math.equation(numbering: n => "(6.3)")
 $ q_g := ∥P_g psi∥^2 gt.eq m^(- 6) . $ <eq:retention-rule>]

 The retained layer is regular on $psi$, and hence after its action on $psi$ as well.]
] <lem:retained-layer>

#proof[
  The mean bound and Markov’s inequality put substantial mass on low-weight product-basis outcomes. Counting these outcomes yields one of sufficiently large probability; recentering the test there changes every count by at most the outcome’s weight, so Corollary 14 supplies the required tail estimate.
  We first bound the mean count of each retained gate. Fix $epsilon.alt > 0$ and choose fixed exponents $0 < p_0 < h_0 < min { epsilon.alt \, 1 }$. Applied to the test of a retained gate, (6.2) gives
  $ ∥upright(bold(1))_(H_g gt.eq m^(h_0)) psi∥ lt.eq m^6 exp \( - m^(p_0) \) . $
  Since $0 lt.eq H_g lt.eq m I$ and $∥psi∥ = 1$, spectral decomposition therefore gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ chevron.l psi \, H_g psi chevron.r lt.eq m^(h_0) + m^13 exp \( - 2 m^(p_0) \) lt.eq m^epsilon.alt quad upright("eventually") . $ <eq:retained-mean>]
  Corollary 14 makes this bound uniform over the retained gates.
  Now fix a regularity triple $0 lt.eq b < h < 1$, $0 < p < h$, and choose $epsilon.alt > 0$ so that $b + 2 epsilon.alt < h$. For any set $S$ of at most $m^b$ retained gates, disjointness of the supports gives
  $ H_S = sum_(g in S) H_g \, #h(2em) chevron.l psi \, H_S psi chevron.r lt.eq m^(b + epsilon.alt) . $
  The empty set has zero tail, so we may suppose $S$ is nonempty. Consider the distribution obtained by measuring the tested sites in the product basis consisting of each specified state and its orthogonal complement. Label the outcomes by binary strings, with $0$ for the specified state. The Hamming weight of the resulting string is the measured value of $H_S$. With
  $ R = 2 m^(b + epsilon.alt) \, #h(2em) beta = b + 2 epsilon.alt \, $
  Markov’s inequality puts at least half the probability on strings of weight at most $R$. If $M lt.eq m$ sites are tested, the number $N_R$ of such strings satisfies, eventually,
  $ N_R lt.eq sum_(j = 0)^(floor.l R floor.r) binom(m, j) & lt.eq \( floor.l R floor.r + 1 \) m^(floor.l R floor.r) \,\
log \( 2 N_R \) & = O \( m^(b + epsilon.alt) log m \) = o \( m^beta \) . $
  Consequently one such outcome $z$ has probability
  #[#set math.equation(numbering: n => "(6.5)")
   $ rho gt.eq frac(1, 2 N_R) gt.eq exp \( - m^beta \) quad upright("eventually") . $ <eq:pruning-atom>]
  Only linearity of the mean, Markov’s inequality, and counting have been used; the outcomes need not be independent.
  Let $B$ specify the local states of $z$ on the tested sites and leave all other sites unconstrained. Then $rho = ∥P_B psi∥^2$. The operators $H_B$ and $H_S$ are diagonal in the same product basis. At a site where $z$ is $0$ their count terms agree; at a site where $z$ is $1$ they differ by an operator of norm one. Thus their eigenvalues on every common basis vector differ by at most $\| z \| lt.eq R$. Choose fixed exponents
  $ max { p \, beta } < p' < h' < h . $
  Because $b + epsilon.alt < h' < h$, eventually $m^h - R gt.eq m^(h')$. The common basis then gives the spectral inclusion
  $ upright(bold(1))_(H_S gt.eq m^h) lt.eq upright(bold(1))_(H_B gt.eq m^(h')) . $
  Apply (6.2) to $B$ with exponents $\( h' \, p' \)$, and divide by its probability from (6.5):
  $ ∥upright(bold(1))_(H_S gt.eq m^h) psi∥ & lt.eq ∥upright(bold(1))_(H_B gt.eq m^(h')) psi∥\
 & lt.eq rho^(- 1) exp \( - m^(p') \)\
 & lt.eq exp \( m^beta - m^(p') \) lt.eq exp \( - m^p \) quad upright("eventually") . $
  The last inequality uses both $p' > beta$ and $p' > p$.
  For each fixed target triple, the preceding bounds are uniform over $S$ and its selected outcome $z$. Indeed the endpoint estimate is uniform over all product tests, including those selected from the current state. Equivalently, a sequence of violating choices would contradict Corollary 14 on that subsequence. Only finitely many auxiliary exponent choices were made for this triple. All uses of the corollary concern the already regular prefix $W$; the proposed next layer is not among its hypotheses. We have proved regularity before the retained layer, and commutation of $H_S$ with that layer gives the same property afterward. ◻
]

#thm([Proposition 6.5.])[
  (Pruning from a product state).  #emph[For any sequence of circuits $U = U_t dots.h.c U_1$ on $m$ qubits, with a bounded number $t$ of analytic layers, and any normalized product starting states $psi_0$, the following construction produces a circuit $W$ with a regular trajectory from $psi_0$. Leave all one-qubit layers unchanged. At a reflection layer, use the exact state reached by the pruned prefix and retain exactly the gates in (6.3). The output vectors satisfy 
#[#set math.equation(numbering: n => "(6.6)")
 $ ∥U psi_0 - W psi_0∥ lt.eq 2 t m^(- 2) . $ <eq:pruning-error>]

]
] <prop:pruning>

#proof[
  The empty prefix is regular. Appending a one-qubit layer adds no regularity condition, and Lemma 15 applies at each reflection layer. Induction therefore gives regularity of the whole pruned trajectory. The retention rule itself has no exponent choices: the auxiliary exponents above are used only to verify its regularity for each fixed triple.
  For the error estimate, denote the retained version of layer $U_j$ by $tilde(U)_j$ and the exact pruned-prefix state before it by $psi_(j - 1)$. Each deleted reflection $F_g = I - 2 P_g$ satisfies
  $ ∥\( F_g - I \) psi_(j - 1)∥ = 2 ∥P_g psi_(j - 1)∥ < 2 m^(- 3) . $
  Every other gate in that layer commutes with $P_g$, and is unitary. Hence this norm is unchanged if any other gates of the layer have already acted. Telescoping over the deleted gates, of which there are at most $m$ because their nonempty supports are disjoint, yields
  $ ∥\( U_j - tilde(U)_j \) psi_(j - 1)∥ lt.eq 2 m^(- 2) . $
  This bound is zero for a one-qubit layer. If $phi.alt_j$ and $psi_j$ are the original and pruned states after layer $j$, respectively, then exactly
  $ phi.alt_j - psi_j = U_j \( phi.alt_(j - 1) - psi_(j - 1) \) + \( U_j - tilde(U)_j \) psi_(j - 1) . $
  Unitarity and the triangle inequality give $∥phi.alt_j - psi_j∥ lt.eq ∥phi.alt_(j - 1) - psi_(j - 1)∥ + 2 m^(- 2)$. Starting with $phi.alt_0 = psi_0$ proves (6.6). ◻
]

== 7 The parity contradiction <sec:parity>

We now prove Theorem 1. Reference qubits retain the classical input labels while the computation may freely change all its own registers. Their signed acceptance expectation will be bounded away from zero by correctness and forced to zero by Corollary 13.

#proof[
  Fix positive integers $d \, k \, C$ and $0 < epsilon lt.eq 1 \/ 2$, where $k$ is now the resource exponent in the theorem. Suppose, toward a contradiction, that an unbounded set of input lengths $n$ admits a depth-at-most-$d$ circuit $U$ with at most $C \( n + 1 \)^k$ total qubits, whose success probability is at least $1 \/ 2 + epsilon$ on every input. Choose one such circuit at each member of an increasing sequence of lengths. Write $a$ for its number of ancillary qubits and $I$ for its $n$ input qubits.
  Attach a register $R$ of $n$ reference qubits, initially zero, and let $"COPY"$ be the layer of disjoint CNOTs from input qubit $I_i$ to reference qubit $R_i$. Our normalized product starting state is
  $ psi_0 = \| + chevron.r_I^(⊗ n) ⊗ \| 0 chevron.r^(⊗ a) ⊗ \| 0 chevron.r_R^(⊗ n) \, #h(2em) \| + chevron.r = frac(\| 0 chevron.r + \| 1 chevron.r, sqrt(2)) . $
  The enlarged circuit $\( U ⊗ I_R \) "COPY"$ has $m = 2 n + a$ qubits. Splitting the original layers into the two analytic types of Section 2 gives at most $t = 2 d + 1$ layers, including the copying layer. In particular the layer count is bounded, $m arrow.r oo$, and, since $k gt.eq 1$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ m = 2 n + a lt.eq \( C + 2 \) \( n + 1 \)^k . $ <eq:parity-resources>]
  Apply Proposition 16 to this circuit and $psi_0$, and call the pruned circuit $W$. Every copying gate is retained for all sufficiently large $m$. Indeed its reflection projection is
  $ P_g = \| 1 chevron.r chevron.l 1 \|_(I_i) ⊗ \| - chevron.r chevron.l - \|_(R_i) \, #h(2em) \| - chevron.r = frac(\| 0 chevron.r - \| 1 chevron.r, sqrt(2)) \, $
  and its probability on $psi_0$ is $\| chevron.l 1 \| + chevron.r \|^2 \| chevron.l - \| 0 chevron.r \|^2 = 1 \/ 4 gt.eq m^(- 6)$ eventually. All later gates avoid $R$, so we can write
  $ W = \( tilde(U) ⊗ I_R \) "COPY" $
  for a circuit $tilde(U)$ on the original qubits. Let
  $ Phi = \( U ⊗ I_R \) "COPY" psi_0 \, #h(2em) Omega = W psi_0 . $
  Both states are normalized, the trajectory to $Omega$ is regular, and (6.6) gives $∥Phi - Omega∥ lt.eq 2 t m^(- 2)$.
  Let $P_B$ project the designated answer qubit onto $\| 1 chevron.r$, and let $Z_R = product_(i = 1)^n Z_(R_i)$. The answer qubit belongs to the original circuit and may be one of its input qubits; in either case $P_B$ acts outside $R$ and commutes with $Z_R$. Set $p_x = Pr_U \( 1 divides x \)$. The original coherent output is
  $ Phi = 2^(- n \/ 2) sum_(x in { 0 \, 1 }^n) U #scale(x: 120%, y: 120%)[\(] \| x chevron.r_I ⊗ \| 0 chevron.r^(⊗ a) #scale(x: 120%, y: 120%)[\)] ⊗ \| x chevron.r_R . $
  The reference states are orthogonal, so
  #[#set math.equation(numbering: n => "(7.2)")
   $ chevron.l Phi \, Z_R P_B Phi chevron.r = 2^(- n) sum_x \( - 1 \)^(\| x \|) p_x lt.eq 1 / 2 #h(-0.16667em) ((1 / 2 - epsilon) - (1 / 2 + epsilon)) = - epsilon . $ <eq:parity-correlation>]
  Here $p_x lt.eq 1 \/ 2 - epsilon$ on even-parity inputs and $p_x gt.eq 1 \/ 2 + epsilon$ on odd-parity inputs, and there are equally many of each for $n gt.eq 1$.
  The self-adjoint observable $Z_R P_B$ has norm at most one. For any two unit vectors its expectation changes by at most twice their distance, by expanding the difference in its two arguments. Hence
  #[#set math.equation(numbering: n => "(7.3)")
   $ chevron.l Omega \, Z_R P_B Omega chevron.r lt.eq - epsilon + 4 t m^(- 2) . $ <eq:pruned-correlation>]
  Thus approximating this one coherent state transfers the signed expectation needed below. No success claim for $tilde(U)$ on individual basis inputs is required.
  Because $tilde(U)$ acts trivially on $R$, and a CNOT conjugates $Z$ on its target to the product of $Z$ on control and target,
  #[#set math.equation(numbering: n => "(7.4)")
   $ W^dagger Z_R W = "COPY"^dagger Z_R "COPY" = Z_I Z_R \, #h(2em) Z_I = product_(i = 1)^n Z_(I_i) . $ <eq:reference-conjugation>]
  The one-pair conjugation identity follows directly on a basis vector: the target bit after copying is $r_i xor x_i$, so its $Z$ eigenvalue is $\( - 1 \)^(r_i + x_i)$. Acting on $psi_0$, the last operator in (7.4) gives
  $ psi'_0 = W^dagger Z_R W psi_0 = \| - chevron.r_I^(⊗ n) ⊗ \| 0 chevron.r^(⊗ a) ⊗ \| 0 chevron.r_R^(⊗ n) . $
  Let $H_0$ be the count associated with the full product state $psi_0$. Every input factor of $psi'_0$ is orthogonal to its specified $\| + chevron.r$ state, while all other factors agree with their specified states. Consequently
  $ ∥psi'_0∥ = 1 \, #h(2em) H_0 psi'_0 = n psi'_0 . $
  Moving the unitary and $Z_R$ across the inner product gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ chevron.l Omega \, Z_R P_B Omega chevron.r = chevron.l psi'_0 \, W^dagger P_B W psi_0 chevron.r . $ <eq:parity-pairing>]
  This identity does not require commuting $P_B$ through $W$ or preserving an input register.
  Choose fixed exponents
  $ 0 < p < h < min { 1 \, 1 \/ k } . $
  By (7.1), $m^h = O \( n^(k h) \) = o \( n \)$, so $m^h < n$ eventually. The vector $psi'_0$ then belongs to the range of $upright(bold(1))_(H_0 gt.eq m^h)$. Cauchy–Schwarz and Corollary 13, applied to the regular trajectory of $W$, show that
  $ lr(|chevron.l Omega \, Z_R P_B Omega chevron.r|) lt.eq ∥upright(bold(1))_(H_0 gt.eq m^h) W^dagger P_B W psi_0∥ lt.eq exp \( - m^p \) . $
  This tends to zero, contradicting (7.3).
  For the fixed $d \, k \, C \, epsilon$, let $cal(S)$ be the set of input lengths admitting an admissible circuit with success at least $1 \/ 2 + epsilon$ on every input. The contradiction excludes an unbounded $cal(S)$; hence $cal(S)$ is finite. There is therefore a threshold $n_0 = n_0 \( d \, k \, C \, epsilon \)$ such that at every $n gt.eq n_0$, every circuit meeting the specified depth and total-qubit bounds has an input on which its success probability is strictly less than $1 \/ 2 + epsilon$. In particular, for every positive integer $N$, every $n gt.eq max { N \, n_0 }$ has this failure property. This proves Theorem 1 with the stated strict failure threshold. ◻
]

===== 7.1 Majority and symmetric-function consequences. <majority-and-symmetric-function-consequences.>

Xu and Li’s Theorem 1 and Corollaries 2–3 #cite(label("XuLi2026Fanout")), combined with Theorem 1, also exclude strict majority and broader symmetric families in our circuit model. More precisely, let $f_n : { 0 \, 1 }^n arrow.r { 0 \, 1 }$ be symmetric, let $f_(n \, i)$ be its value at Hamming weight $i$, and set $rho \( f_n \) = max_(0 lt.eq i < n : thin f_(n \, i) eq.not f_(n \, i + 1)) min { i + 1 \, n - i }$, with zero for constant functions. Its pointwise-error-$1 \/ 3$ approximate degree is the least total degree of a real polynomial $p$ satisfying $\| p \( x \) - f_n \( x \) \| lt.eq 1 \/ 3$ for every $x in { 0 \, 1 }^n$. Assume either $rho \( f_n \) gt.eq n^delta$ for all sufficiently large $n$ for some fixed $delta > 0$, or this approximate degree is $Omega \( n^(1 \/ 2 + eta) \)$ for some fixed $eta > 0$. Then no fixed-depth, polynomial-total-qubit family achieves success at least $1 \/ 2 + 1 \/ \( log n \)^gamma$ on every input at every sufficiently large length, for any fixed $gamma > 0$. Strict majority $"MAJ"_n \( x \) = upright(bold(1))_({ \| x \| > n \/ 2 })$ has $rho = ceil.l n \/ 2 ceil.r$.

The full formulation and output-model adjustment are recorded in the companion article #cite(label("OpenAILocalization2026")) Section 7.3, Corollary 10 and its proof. Xu and Li require the measured output to be an initially zero ancilla. Appending one fresh zero qubit and a CNOT from our designated output preserves its measurement distribution even with arbitrary garbage, at a cost of one qubit and one layer. A family with the stated success would, after this adjustment, yield exact clean fanout through the cited reduction. The Hadamard-to-parity argument in Section 1 excludes such fanout using our own Theorem 1. Under the same circuit conventions, adjoining unit-cost primitive reversible unbounded threshold gates therefore strictly enlarges the class computed with worst-case success at least $2 \/ 3$: the reversible gate $\| x \, b chevron.r mapsto \| x \, b xor "MAJ"_n \( x \) chevron.r$ computes majority exactly from a zero target.

===== 7.2 State-preparation consequences. <state-preparation-consequences.>

We justify the bounds stated in Section 1. Keep every register of a preparation when using its unitary and inverse. For felinity $eta > 0$ on $h$ retained qubits of a depth-$d$ preparation on $M$ total qubits, the constructions in the proofs of #cite(label("GGJ2026Fourier"), form: "prose") Lemmas 4.9 and 4.1 give target probabilities $a gt.eq 1 \/ 2$ on $0^h$ and $b gt.eq eta^2 \/ 2$ on $1^h$, in depth $O \( d + 1 \)$ on $O \( M + h \)$ qubits. The square occurs because the top Fourier coefficient has magnitude at least $eta$, so its weight is at least $eta^2$.

The exact step is the one-round case of #cite(label("GrierMorrisWu2026"), form: "prose") Theorem 7. For unit vectors $g \, e$, if a unitary $V$ prepares $V \| 0 chevron.r = \( \| g \, 0 chevron.r + sqrt(3) \| e \, 1 chevron.r \) \/ 2$, where $\| 0 chevron.r$ denotes its entire zero input and the last qubit is a flag, then

$ V \( I - 2 \| 0 chevron.r chevron.l 0 \| \) V^dagger Z_(upright("flag")) V \| 0 chevron.r = \| g \, 0 chevron.r . $

Indeed, $chevron.l 0 \| V^dagger Z_(upright("flag")) V \| 0 chevron.r = - 1 \/ 2$. A flag initialized to one can be given coefficient $c = 1 \/ \( 2 sqrt(a + b) \) lt.eq 1$ on zero separately under the two extreme target tests: use a one-qubit reflection sending $\| 1 chevron.r$ to $c \| 0 chevron.r + sqrt(1 - c^2) \| 1 chevron.r$. Each conditional operation is a product reflection, so the two tests use two sequential Toffoli gates up to local conjugations. The flag-zero component is one half of the normalized union of the extreme branches. The displayed identity prepares that union exactly, with one-branch probability $q = b \/ \( a + b \) in \[ eta^2 \/ 2 \, 1 \/ 2 \]$, since $a + b lt.eq 1$ and $b lt.eq 1 - a lt.eq a$.

Prepare $r = ceil.l \( log 2 \) \/ \( - log \( 1 - q \) \) ceil.r = O \( eta^(- 2) \)$ independent copies on fresh zeros. Disjoint columnwise reversible ORs into $h$ new targets give probabilities $u = \( 1 - q \)^r in \[ 1 \/ 4 \, 1 \/ 2 \]$ on $0^h$ and $v = 1 - u in \[ 1 \/ 2 \, 3 \/ 4 \]$ on $1^h$. Here $\( 1 - q \) \/ 2 lt.eq \( 1 - q \)^r lt.eq 1 \/ 2$ and $r lt.eq \( log 2 \) \/ q + 1$. Giving these two branches flag-zero coefficients $1 \/ \( 2 sqrt(2 u) \)$ and $1 \/ \( 2 sqrt(2 v) \)$, respectively, and applying the same exact round yields

$ 2^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\(] \| 0^h \, alpha_0 chevron.r + \| 1^h \, alpha_1 chevron.r #scale(x: 120%, y: 120%)[\)] \, $

with unit branch states $alpha_0 \, alpha_1$ containing arbitrary garbage. The all-zero reflection is likewise a local conjugate of a Toffoli, and the ORs use Toffoli gates with local $X$ gates. The source-dependent flag coefficients are permitted by nonuniformity. Rosenthal’s exact case #cite(label("Rosenthal2021")) Theorem 3.1 converts this balanced state, using its complete preparation and inverse, to the exact parity unitary on arbitrary states of the $h + 1$ data qubits, with every auxiliary qubit restored to zero, and hence to clean $F_h$ by Hadamard conjugation. All copies run in parallel, and only a constant number of preparation and reflection stages are sequential. The resulting depth is $O \( d + 1 \)$ and the total-qubit bound is $O \( \( M + h \) eta^(- 2) + h \)$.

For the Dicke bound, use the block calculation in the proof of the companion’s state-preparation corollary #cite(label("OpenAILocalization2026")) Section 7.1, Corollary 8 and its proof. Uniformly for $n gt.eq 2 k$ and all sufficiently large $k$, it shows that an input at trace distance at most $1 \/ \( 80 k \)$ from $\| D_k^n chevron.r$ produces, with $ell = floor.l k \/ log k floor.r$ fresh targets and three additional allowed layers, a retained state of felinity greater than $1 \/ \( 40 k \)$. Applying the preceding promotion at arity $ell$ gives exact parity in fixed depth on $O \( \( M + n \) k^2 \)$ total qubits. For fixed $0 < delta < 1$ and $k gt.eq n^delta$, eventually $ell gt.eq sqrt(k)$, so $n lt.eq k^(1 \/ delta) lt.eq ell^(2 \/ delta)$ and $k^2 lt.eq ell^4$ make this one fixed polynomial bound in $ell$. A felinity violation $eta gt.eq n^(- A)$ similarly preserves one fixed polynomial bound at arity $n$. Both parity arities grow along any unbounded sequence of violations, contradicting the eventual pointwise Theorem 1.


#bibliography("refs.bib", style: "ieee", title: [References])
