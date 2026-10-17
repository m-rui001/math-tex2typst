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

#align(center)[#text(size: 16pt, weight: "bold")[An explicit power saving for the exact discrete Fourier transform]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

For $d gt.eq 1$, put $zeta_d = exp \( 2 pi i \/ d \)$ and let

$ F_d = \( zeta_d^(j k) \)_(0 lt.eq j \, k < d) $

be the unnormalized discrete Fourier matrix. Its fast computation is a basic instance of replacing a dense linear map by a short sequence of structured operations. The mixed-radix factorization of Cooley and Tukey #cite(label("cooleytukey")) computes transforms at highly composite lengths in $O \( n log n \)$ arithmetic operations. Good’s coprime-factor construction identifies certain one-dimensional transforms with tensor products, without intervening twiddle factors #cite(label("good1958")) Sections 11–12; Cooley, Lewis, and Welch explain its relationship with Thomas’s construction and the mixed-radix FFT #cite(label("cooleyLewisWelch1967")). Bluestein’s chirp identity reduces an arbitrary Fourier length to convolution and, with an ordinary FFT, yields the $O \( n log n \)$ arithmetic bound at every length #cite(label("bluestein")). Rabiner, Schafer, and Rader give the weighted-convolution derivation, padding, and operation count #cite(label("rabinerSchaferRader1969")) Sections II–III.

Improvements within that scale and improvements of the scale itself are different questions. Alman and Rao use matrix non-rigidity to improve the Walsh–Hadamard transform and then the leading constant for power-of-two discrete Fourier transforms #cite(label("almanrao")) Theorem 1.2 and Section 7. Their Fourier bound has leading term $\( 15 \/ 4 \) n log_2 n$ in a count of real arithmetic operations, with circuit structure and constants precomputed. Here we obtain a power saving in the logarithm at every length, in an exact complex-arithmetic model that also counts scalar preparation and array organization.

Lower bounds at the $n log n$ scale depend on the permitted operations. Morgenstern’s determinant argument applies to the unnormalized Fourier transform with bounded coefficients #cite(label("morgenstern")). Ailon’s entropy bound concerns the normalized transform on $n$ coordinates with unitary two-coordinate gates #cite(label("ailon")) Theorem 2.1; his later bounds also quantify restrictions on intermediate conditioning #cite(label("ailonConditioned")). Our model permits unrestricted coefficients and exact intermediate values. The logarithmic word size below describes integer addresses; it does not limit the precision of complex registers.

The main obstacle is to turn a saving for one fixed finite matrix into a single algorithm for arbitrary Fourier lengths. A finite saving must survive three transitions: using all available coordinates during recursive batching, compiling small Fourier matrices without increasing their widths, and organizing a product of many coordinate sets with linear array work. The complexity of preparing the scalars and constructing the schedules must also be counted. The theorem below handles these transitions explicitly.

Two companion results clarify the starting point. The finite tensor saving and the nonuniform subsequence theorem in #emph[Finite tensor savings and exact Fourier circuits] #cite(label("exactfourier")) have an independent proof through matrix prices and exact finite identities. The complex phase network in #emph[Integer multiplication below $n log n$] #cite(label("motif")) Proposition 8 and Section 3.5 provides a particular two-coordinate kernel with a strict saving. We reproduce the network needed here and supply its uniform array implementation. The integer-multiplication article’s arithmetic model and its later tape and precision arguments are separate from the model used in this paper.

=== 1.1 Arithmetic model and main result <sec:model>

Our model has complex registers and integer address registers. A complex field operation has unit cost. In the computation on the input vector, only addition, subtraction, and multiplication by prepared, input-independent scalars are used. Every such operation is charged. Division is used in scalar preparation only, with a proof that its denominator is nonzero. Integer operations and random access on $O \( log \( n + 2 \) \)$-bit words also have unit cost; a fixed number of such words may represent an address or integer. All constants implicit in these conventions are independent of $n$.

We supply an explicitly specified Fourier root depending on $n$. Equivalently, a root-of-unity operation returns the specified $zeta_d$, at unit cost, for a stated order $d$. The theorem below needs only one such root, of polynomial order. Preparing other scalars from it, constructing the schedule, and organizing the arrays are included in the running time. We do not assume that field operations on rational constants can generate roots of arbitrarily large order. There is no bound on complex coefficients or intermediate magnitudes, and no finite-precision or numerical-stability assertion.

Define the absolute constants

#[#set math.equation(numbering: n => "(1.1)")
 $ m = 10^6 \, #h(2em) W_(*) = 2^71 \, #h(2em) Delta = 6871402692000000 \, #h(2em) lambda = m - Delta / W_(*) \, #h(2em) theta = log_m lambda . $ <eq:main-constants>]

The construction in Section 2 uses blocks of $m$ binary coordinates and $W_(*)$ arrays. The saving $Delta$ gives the recurrence multiplier $lambda$ and hence the exponent $theta$. These constants satisfy $1 < lambda < m$ and

$ theta = 0.99999999999978935615699598 dots.h < 1 . $

The decimal is included only to indicate the size of the saving; the definition in (1.1) is exact.

#thm([Theorem 1.1.])[
  #emph[There is a single deterministic algorithm which, for every positive integer $n$ and every $x in bb(C)^n$, computes $F_n x$ exactly. In the model above, including scalar preparation, schedule construction, and index work, its running time is 
#[#set math.equation(numbering: n => "(1.2)")
 $ O #h(-0.16667em) (n \( log n \)^theta \( log log n \)^(4 - theta)) $ <eq:main-bound>]

 as $n arrow.r oo$. It suffices to supply the specified root $zeta_(D_(*))$ for an explicitly computable integer $D_(*) < 1024 n^3$.]
] <thm:main>

#thm([Corollary 1.2.])[
  #emph[In the same model, the transform is computable at every length in 
$ O #h(-0.16667em) (n \( log n \)^(1 - 10^(- 13))) = o \( n log n \) $

 time.]
] <cor:decimal>

A finite initial range is handled by the direct formula for $F_n$. The constants in the algorithm are enormous, so these are asymptotic existence and explicitness results, with no useful crossover estimate. The hypotheses on coefficients and exact roots are part of the result. In particular, the conclusion does not assert a corresponding improvement for stable floating-point FFTs or for bit complexity.

#thm([Corollary 1.3.])[
  (Exact convolution and polynomial multiplication).  #emph[There is a single deterministic algorithm which, for every positive integer $n$ and every $a \, b in bb(C)^n$, computes the linear convolution 
$ c_k = sum_(0 lt.eq r \, s < n\
r + s = k) a_r b_s \, #h(2em) 0 lt.eq k lt.eq 2 n - 2 . $

 Equivalently, it multiplies two complex polynomials of degree less than $n$. In the exact complex field-operation, specified-root, and address cost model above, with general field multiplication permitted for the pointwise products, the total running time, including scalar preparation, schedule construction, padding, and index work, is 
$ O #h(-0.16667em) (n \( log n \)^theta \( log log n \)^(4 - theta)) #h(2em) \( n arrow.r oo \) \, $

 and hence is eventually $O \( n \( log n \)^(1 - 10^(- 13)) \)$. This is a bilinear arithmetic algorithm, not an input-linear circuit: its pointwise products multiply a value linear in $a$ by a value linear in $b$.]
] <cor:polynomial-multiplication>

The proof in Section 5.5 uses three transforms at length $2 n - 1$, with one specified root reused throughout.

The corollary retains the exact-root and unrestricted-coefficient assumptions. It is not a result about integer bit complexity, bounded-coefficient circuits, numerical stability, finite fields, or formal power-series algorithms.

=== 1.2 The construction and its reusable parts <the-construction-and-its-reusable-parts>

Two constructions feed a common tensor schedule, which then supplies the transform at every length.

+ A fixed network gives a fast algorithm for tensor powers of
  $ C = 1 / 2 mat(delim: "(", 1 + i, 1 - i; 1 - i, 1 + i) . $
  Its binary labels prescribe changes of frame between scalar gates. The completed network transforms every physical role, including roles used as temporary storage. Padding the number of roles to a power of two makes recursive batching exact. The resulting recurrence gives $C^(⊗ k)$ in $O \( 2^k \( k + 1 \)^theta \)$ time.
+ Independently, Newton interpolation factors every Fourier matrix $F_r$ into diagonal factors and a triangular Toeplitz matrix and its transpose. We compile these into a word of $O \( 1 + log^4 r \)$ layers on #emph[exactly] $r$ coordinates. Borrowed coordinates may initially contain arbitrary data and are restored. The compiler chooses chunk sizes by counting the registers required by its own convolution programs; all local compilation and scalar preparation take polynomial time in $r$.
+ Synchronize these words on many coprime axes. Each simultaneous pair layer decomposes into sectors carrying tensor powers of $C$. A concrete sector-address formula packs all sectors in linear array work. Products of small odd primes, supplemented by one power of two, give suitable working lengths within a factor of two of $2 n$. A chirp convolution then gives every requested length.

The role-preserving tensor recurrence, the measured-fit local compiler, and the linear-time sector traversal are useful independently of the final choice of Fourier lengths. Together they prevent three possible losses: allocating fresh zero workspace at every recursive use, silently treating scalar preparation as free, and spending one operation per tensor axis at every array entry. The sharper logarithmic factor in (1.2) comes from the elementary estimate that the number of odd-prime factors is of order $log n \/ log log n$. The appendix supplies two further general constructions: finite rational-algebra extraction from polynomial certificates, and bounded-printer uniformization of effectively generated transform circuits.

Figure 1 records the interfaces between these steps.

#figure(
  [#grid(
    columns: (0.47fr, 0.47fr,),
    column-gutter: 6%,
    [
      Fixed network on arbitrary roles Strict saving and exact batches Theorem 9: $C^(⊗ k)$ in $O \( 2^k \( k + 1 \)^theta \)$
    ],
    [
      Exact-width Fourier words Proposition 11: $O \( 1 + log^4 r \)$ common slots on exactly $r$ coordinates
    ],
  )
    Sector packing and synchronization (Proposition 17) Linear traversal work per tensor slot $arrow.b$ Small-prime working length, CRT and chirp convolution Theorem 1: every input length, with preparation charged],
  caption: [Figure 1: The quantitative proof. The tensor-power algorithm and the exact-width Fourier words are separate inputs to synchronization. Both constructions account for arbitrary data in their auxiliary roles. Appendix Section 6 gives the separate certificate-and-printer route. ],
) <fig:proof-map>

Section 2 develops the fixed network. Section 3 gives the local Fourier compiler, Section 4 handles tensor scheduling and addresses, and Section 5 proves Theorem 1 and its convolution consequence. Appendix Section 6 gives a complementary effective route from finite algebraic certificates: it makes finite-win certificates uniform by exact rational algebra and supplies a local certificate that proves the search terminates. The general finite-win and generation results of #cite(label("exactfourier")) give a second source of the same certificate interface. That route is not needed for the exponent in (1.2).

The finite network is credited at its use to #cite(label("motif")), and the exact-width Fourier mechanism is shared with #cite(label("exactfourier")) Section 3. We prove the interfaces used here, including their preparation and indexing bounds. In particular, we do not import the later tape or precision bounds of #cite(label("motif")), nor infer uniformity from the circuit-existence conclusion of #cite(label("exactfourier")).

== 2 An explicit saving for a fixed two-coordinate transform <net:section>

Put

#[#set math.equation(numbering: n => "(2.1)")
 $ C = mat(delim: "(", a, b; b, a) \, #h(2em) a = frac(1 + i, 2) \, #h(2em) b = frac(1 - i, 2) . $ <net:C>]

The ordinary algorithm applies the $k$ factors of $C^(⊗ k)$ separately, using $O \( k 2^k \)$ operations. We obtain a smaller exponent of $k$ by a fixed network from the complex construction of #cite(label("motif")) Proposition 8 and Section 3.5. The network exchanges two banks and restores arbitrary auxiliary values. Changing the coordinate frame along its wires then transforms #emph[every] bank and auxiliary array. The total dimension of the frame changes is smaller than the cost of transforming the arrays separately. We give the complete finite construction because this strict saving and the treatment of arbitrary auxiliaries are the main inputs to the recursion.

=== 2.1 A scalar network with arbitrary auxiliary values <a-scalar-network-with-arbitrary-auxiliary-values>

Fix

#[#set math.equation(numbering: n => "(2.2)")
 $ h = 100 \, quad cal(T) = { T subset.eq { 1 \, dots.h \, h } : \| T \| = 3 } \, quad v = binom(h, 3) = 161700 \, quad N_0 = v^3 \, quad m = h^3 = 10^6 . $ <net:parameters>]

There are two banks of scalar wires $X_d \, Y_d$, indexed by $d = \( d_1 \, d_2 \, d_3 \) in cal(T)^3$. Two triples are #emph[neighbors] when they have even intersection; neighboring triples are distinct. The network has three stages. At stage $j$, fix the two indices other than $d_j$ and operate on the two lists obtained by varying $d_j$. There are $I_0 = 3 v^2$ such invocations. Each has its own auxiliary wires, distinct from all other invocations: one side wire $A_(S T)$ for each #emph[ordered] neighboring pair $\( S \, T \)$, and $h + 1$ central wires $c_1 \, dots.h \, c_h \, c_(*)$.

For one invocation, call the logical source and target banks $x = \( x_T \)$ and $y = \( y_S \)$. Define the fixed linear maps

$ \( V x \)_(S T) & = x_T \, & \( G x \)_j & = sum_(T in.rev j) x_T \, & \( G x \)_(*) & = sum_T x_T \,\
\( J A \)_S & = - sum_(T : thin T upright(" neighbors ") S) frac(\| S ∩ T \| - 1, 2) A_(S T) \, & \( R c \)_S & = frac(sum_(j in S) c_j - c_(*), 2) . $

The forward invocation consists of the following eight rows, in order:

#[#set math.equation(numbering: n => "(2.3)")
 $ upright("row") & upright("update") & upright("gate grouping")\
0 & y arrow.l y - J A & upright("one gate per target and its side wires")\
1 & y arrow.l y - R c & upright("one gate on the targets and center")\
2 & A arrow.l A + V x & upright("one gate per source and its side wires")\
3 & c arrow.l c + G x & upright("one gate on the sources and center")\
4 & y arrow.l y + R c & upright("one gate on the targets and center")\
5 & y arrow.l y + J A & upright("one gate per target and its side wires")\
6 & c arrow.l c - G x & upright("one gate on the sources and center")\
7 & A arrow.l A - V x & upright("one gate per source and its side wires") . $ <net:schedule>]

A gate is simply the indicated finite linear map on its wires. Its scalar implementation, including all additions and multiplications, has a fixed finite cost.

#thm([Lemma 2.1.])[
  #emph[For arbitrary initial auxiliary values, the forward invocation sends $\( x \, y \, A \, c \)$ to $\( x \, y + x \, A \, c \)$. Forward invocations from $X$ to $Y$ at stages $1$ and $3$, and the inverse forward invocation from $Y$ to $X$ at stage $2$, give 
$ \( X_d \, Y_d \) mapsto \( - Y_d \, X_d \) quad \( d in cal(T)^3 \) $

 and restore every auxiliary value.]
] <net:scalar>

#proof[
  The first two rows subtract $J A + R c$ from $y$. The middle rows add $R \( c + G x \) + J \( A + V x \)$, and the last two restore $c$ and $A$. The net addition is $\( R G + J V \) x$. The coefficient from $x_T$ to $y_S$ in $R G$ is $\( \| S ∩ T \| - 1 \) \/ 2$. It is $1$ for $S = T$, $0$ when the intersection has size $1$, and is canceled by $J V$ when the intersection has size $0$ or $2$. Hence $R G + J V = I$. The three stages therefore send $\( x \, y \)$ to $\( x \, y + x \)$, then $\( - y \, y + x \)$, then $\( - y \, x \)$. The auxiliary values cancel in each invocation separately. ◻
]

A triple has

$ d_(upright("nbr")) = binom(97, 3) + 3 dot.op 97 = 147731 $

neighbors: the two terms count intersections of size $0$ and $2$. Consequently the number of physical wires is

#[#set math.equation(numbering: n => "(2.4)")
 $ W = 2 N_0 + I_0 \( v d_(upright("nbr")) + 101 \) = 1873807244643542670000 . $ <net:wire-count>]

The factor $v d_(upright("nbr"))$ counts ordered pairs, as required by the schedule.

=== 2.2 Frames turn binary dimensions into directional operations <frames-turn-binary-dimensions-into-directional-operations>

We now explain how to turn the scalar exchange into a tensor transform. An edge of the scalar network connects consecutive touches of a physical wire, including its source and sink. We will assign a binary subspace to each gate and terminal, with one common subspace for all wires touched by a gate. This subspace specifies a change of frame on the complex array replacing each wire. The construction below has two useful properties: common frames commute with scalar gates, and moving between suitable nested subspaces costs one directional operation per added or removed binary dimension.

For this purpose use the binary space $cal(D) = bb(F)_2^m$ with its ordinary dot product. A subspace is #emph[nondegenerate] if its restricted bilinear form has zero radical. Its orthogonal complement and all projections below are taken over $bb(F)_2$; these are separate from the complex spaces carrying the data.

For $z in bb(F)_2^m$, write $R_z$ for translation of array addresses: $\( R_z f \) \( x \) = f \( x + z \)$. The normalized Walsh matrix

$ J_m = 2^(- m \/ 2) #scale(x: 120%, y: 120%)[\(] \( - 1 \)^(x dot.op y) #scale(x: 120%, y: 120%)[\)]_(x \, y in bb(F)_2^m) $

satisfies $J_m^2 = I$. Conjugating the diagonal character $\( - 1 \)^(z dot.op x)$ by $J_m$ gives $R_z$, by cancellation of nontrivial binary characters. For a nondegenerate label $U$, let $P_U$ be projection onto $U$ along $U^perp$, and set

#[#set math.equation(numbering: n => "(2.5)")
 $ q_U \( x \) = "wt" \( P_U x \) med \( mod med 4 \) \, #h(2em) Phi_U = J_m "diag"_x \( i^(q_U \( x \)) \) J_m . $ <net:frame>]

Here $"wt"$ is integer Hamming weight. These matrices prove identities; the algorithm does not execute Walsh transforms. In particular $Phi_0 = I$ and $Phi_(cal(D)) = C^(⊗ m)$.

#thm([Lemma 2.2.])[
  #emph[Let $U \, V subset.eq cal(D)$ be nested nondegenerate subspaces. Call the orthogonal complement of the smaller subspace inside the larger their #emph[residual]. Suppose it has an orthonormal binary basis of size $rho$. Then $Phi_V Phi_U^(- 1)$ is a product of exactly $rho$ #emph[directional kernels] of the form $C_z = a I + b R_z$ or $C_z^(- 1)$, where $z eq.not 0$. Each inverse requires one forward kernel and a translation.]
] <net:edge>

#proof[
  For binary vectors $x \, y$,
  $ "wt" \( x + y \) = "wt" \( x \) + "wt" \( y \) - 2 \| "supp" \( x \) ∩ "supp" \( y \) \| . $
  Thus weight is additive modulo four for orthogonal vectors. If $V = U perp E$ and $z_1 \, dots.h \, z_rho$ is an orthonormal basis of $E$, then
  $ q_V \( x \) - q_U \( x \) = sum_(j = 1)^rho "wt" \( z_j \) \[ z_j dot.op x \] med \( mod med 4 \) \, $
  where brackets mean the integer representative $0$ or $1$. Every $"wt" \( z_j \)$ is odd, so its value modulo four is $1$ or $- 1$. For a decreasing edge the entire expression is negated. The identity $i^(\[ z dot.op x \]) = a + b \( - 1 \)^(z dot.op x)$ and Walsh conjugation give the stated kernels. Finally $R_z^2 = I$ and $C_z^2 = R_z$, whence $C_z^(- 1) = R_z C_z$. ◻
]

To apply this calculation to the network, replace each scalar wire by an array indexed by $cal(D)$. Give every gate a nondegenerate label $U$, common to all wires it touches, and give each source and sink its own label. Insert $Phi_V Phi_U^(- 1)$ along an edge from label $U$ to label $V$, and apply the scalar gates pointwise. A scalar gate mixes its touched arrays with scalar coefficients, whereas their common frame acts on the address coordinate. These two operations commute. The intermediate frames therefore cancel, leaving the scalar network between its source and sink frames.

More generally, for an integer $f gt.eq 1$, index every array by $f$ columns of $m$ bits and use $Phi_U^(⊗ f)$ as its frame. The same cancellation gives the complete linear map

#[#set math.equation(numbering: n => "(2.6)")
 $ "diag"_(upright("sinks")) \( Phi_U^(⊗ f) \) thin cal(S) thin "diag"_(upright("sources")) \( \( Phi_U^(- 1) \)^(⊗ f) \) \, $ <net:telescoping>]

where $cal(S)$ is the pointwise signed bank exchange of Lemma 4, acting as the identity on auxiliary roles. This is an identity on arbitrary values in every physical role. The remaining task is to choose labels whose terminal frame ratios give the desired transform and whose total residual dimension is less than $W m$. Lemma 5 will then convert that dimension saving into fewer directional operations.

=== 2.3 Binary labels and the dimension budget <binary-labels-and-the-dimension-budget>

Identify $cal(D)$ with $D^(⊗ 3)$, where $D = bb(F)_2^h$; the tensor dot product is the ordinary dot product on $bb(F)_2^m$. For $T in cal(T)$, let $t_T$ be its indicator. Then $t_T dot.op t_T = 1$, and neighboring indicators are orthogonal. Put

$ u_d = t_(d_1) ⊗ t_(d_2) ⊗ t_(d_3) \, #h(2em) U_d = chevron.l u_d chevron.r . $

Each $u_d$ has norm one, so $U_d$ is nondegenerate.

Start with the terminal labels. Sources have label $0$, except that $X_d$ has label $U_d$; sinks have label $cal(D)$, except that $Y_d$ has label $U_d^perp$. A route with terminal labels $0$ and $cal(D)$ has frame ratio $C^(⊗ m)$. The exceptional route $X_d arrow.r Y_d$ will have the same ratio up to a translation, as we verify below. The total increase of terminal dimensions is $W m - 2 N_0$. Thus the margin below $W m$ is $2 N_0$ before we charge twice the dimensions lost at any internal decreases.

At an invocation in stage $j$, write

$ E = D^(⊗ \( j - 1 \)) \, #h(2em) P = chevron.l ⨂_(l < j) t_(d_l) chevron.r \, #h(2em) B = P^perp subset E \, #h(2em) Q = chevron.l ⨂_(l > j) t_(d_l) chevron.r . $

An empty tensor product is the full one-dimensional binary space. Thus $E = B perp P$, with $B = 0$ in stage $1$, and $Q$ is the full future space in stage $3$. For a physical bank entry $d$, write $t = t_(d_j)$.

The stage expands its current tensor factor from a triple line to all of $D$, while retaining the future line $Q$. More precisely, its incoming labels are $\( E ⊗ chevron.l t chevron.r \) ⊗ Q$ on $X$ and $\( B ⊗ chevron.l t chevron.r \) ⊗ Q$ on $Y$; its outgoing labels are $\( E ⊗ D \) ⊗ Q$ on $X$ and

$ #scale(x: 120%, y: 120%)[\(] \( B ⊗ D \) perp \( P ⊗ t^perp \) #scale(x: 120%, y: 120%)[\)] ⊗ Q = \( P ⊗ chevron.l t chevron.r \)_(E ⊗ D)^perp ⊗ Q $

on $Y$. Separating the next triple from $Q$ makes these exactly the next stage’s incoming labels. At the first and last stages they agree with the specified terminal labels. We may insert these stage boundaries as extra vertices without changing any edge operation.

The following gate labels realize those boundary conditions. In the table each label is further tensored with $Q$, and $t$ is the indicator at the physical bank entry of an entry-specific gate. The $X$ labels increase to $E ⊗ D$, while the $Y$ labels increase through $B ⊗ D$. A central wire must visit both levels: its return from $E ⊗ D$ in row $3$ to $B ⊗ D$ in row $4$ is the only decrease that will consume part of the margin.

#[#set math.equation(numbering: n => "(2.7)")
 $ upright("row") & upright("physical wires touched") & upright("label before tensoring with ") Q\
0 & Y \, med upright("side") & B ⊗ chevron.l t chevron.r\
1 & Y \, med upright("center") & B ⊗ D\
2 & X \, med upright("side") & \( B ⊗ D \) perp \( P ⊗ chevron.l t chevron.r \)\
3 & X \, med upright("center") & E ⊗ D\
4 & Y \, med upright("center") & B ⊗ D\
5 & Y \, med upright("side") & \( B ⊗ D \) perp \( P ⊗ t^perp \)\
6 & X \, med upright("center") & E ⊗ D\
7 & X \, med upright("side") & E ⊗ D . $ <net:labels>]

The row numbers here are chronological, including in stage $2$. At that stage, reverse the eight scalar updates and their signs, with logical source $Y$ and target $X$. The physical touch sequence is $Y$–side, $Y$–center, $X$–side, $X$–center, $Y$–center, $Y$–side, $X$–center, $X$–side, exactly as in the table. Relabeling the ordered side pairs accordingly leaves their two physical triples neighboring. Every displayed label is nondegenerate.

#thm([Lemma 2.3.])[
  #emph[Every edge has nested nondegenerate endpoint labels. Each nonzero orthogonal residual, meaning the complement of the smaller label inside the larger, has an orthonormal binary basis. If $s$ is the sum of the residual dimensions, then 
#[#set math.equation(numbering: n => "(2.8)")
 $ s & = W m - 2 N_0 + 2 I_0 \( 101 \) 100 = 1873807244636671267308000000 \,\
Delta := W m - s & = 6871402692000000 > 0 . $ <net:s>]

]
] <net:residuals>

#proof[
  Here is the full list of nonzero or potentially nonzero residuals. All rows except the last are tensored with $Q$. The vectors $t_X \, t_Y$ on a side wire are its two physical triple indicators. The omitted edges have zero residual.
  $ upright("wire and edge") & upright("orthogonal residual")\
X : med upright("in") arrow.r 2 & B ⊗ t_X^perp\
X : med 2 arrow.r 3 & P ⊗ t_X^perp\
Y : med 0 arrow.r 1 & B ⊗ t_Y^perp\
Y : med 4 arrow.r 5 & P ⊗ t_Y^perp\
upright("center") : med upright("source") arrow.r 1 & B ⊗ D\
upright("center") : med 1 arrow.r 3 \, med 3 arrow.r 4 \, med 4 arrow.r 6 & P ⊗ D quad upright("(each)")\
upright("side") : med upright("source") arrow.r 0 & B ⊗ chevron.l t_Y chevron.r\
upright("side") : med 0 arrow.r 2 & \( B ⊗ t_Y^perp \) perp \( P ⊗ chevron.l t_X chevron.r \)\
upright("side") : med 2 arrow.r 5 & P ⊗ chevron.l t_X \, t_Y chevron.r^perp\
upright("side") : med 5 arrow.r 7 & P ⊗ chevron.l t_Y chevron.r\
upright("auxiliary") : med upright("last") arrow.r upright("sink") & E ⊗ D ⊗ Q^perp . $
  In the last row $Q^perp$ is taken in the full future tensor space. The side edge $2 arrow.r 5$ explains the use of neighboring triples. Because $t_X dot.op t_Y = 0$ and both vectors have norm one,
  $ t_Y^perp = chevron.l t_X chevron.r perp chevron.l t_X \, t_Y chevron.r^perp . $
  Its row-$2$ label $\( B ⊗ D \) perp \( P ⊗ chevron.l t_X chevron.r \)$ therefore lies in its row-$5$ label $\( B ⊗ D \) perp \( P ⊗ t_Y^perp \)$, with precisely the displayed residual. The other rows follow by $E = B perp P$ and $D = chevron.l t chevron.r perp t^perp$. These decompositions verify all inclusions and show that the only decreases are the central edges $3 arrow.r 4$, each of dimension $h$.
  The signed changes telescope along physical wires. Source dimensions sum to $N_0$ and sink dimensions to $W m - N_0$, so their total is $W m - 2 N_0$. Each of the $I_0 \( 101 \)$ central wires loses $h = 100$ dimensions once. Replacing signed changes by absolute changes adds twice these losses, proving the formula for $s$. In particular,
  $ Delta = 2 N_0 - 2 I_0 \( h + 1 \) h = 2 v^2 #scale(x: 120%, y: 120%)[\(] v - 3 h \( h + 1 \) #scale(x: 120%, y: 120%)[\)] > 0 \, $
  since $v > 3 h \( h + 1 \)$. Substituting $h = 100$ and $v = 161700$ gives the displayed integers.
  Nondegeneracy alone would not guarantee an orthonormal basis in characteristic two: a nondegenerate form may be alternating. Here every nonzero residual contains a vector of norm one. Indeed, $t^perp$ and $chevron.l t_X \, t_Y chevron.r^perp$ contain coordinate units outside supports of size at most $3$ and $6$ respectively. If nonzero, $B$ contains a coordinate unit outside a support of size $3^(j - 1) < h^(j - 1)$, and the same argument applies to nonzero $Q^perp$. Full spaces and the lines $P \, Q \, chevron.l t chevron.r$ also contain norm-one vectors. Taking tensor products and choosing a nonzero summand in an orthogonal sum proves the claim for every residual in the table.
  For completeness, a nondegenerate binary symmetric space with a norm-one vector has an orthonormal basis. Split off unit lines until the remaining space is alternating. A nonzero nondegenerate alternating space splits into orthogonal planes with bases $p \, q$ satisfying $p dot.op p = q dot.op q = 0$ and $p dot.op q = 1$: choose $p eq.not 0$, choose $q$ by nondegeneracy, and split off their plane. Retain a unit vector $w$ from a line already removed. A plane perpendicular to $w$ is absorbed by replacing $\( w \, p \, q \)$ with
  $ w + p \, #h(2em) w + q \, #h(2em) w + p + q . $
  These are pairwise orthogonal unit vectors and span the same three-dimensional space. Repetition absorbs all alternating planes. All choices can be made by finite binary linear algebra with a fixed ordering of coordinates and pivots. ◻
]

=== 2.4 Transforming every physical role <transforming-every-physical-role>

#thm([Proposition 2.4.])[
  (Finite network interface).  #emph[For every integer $f gt.eq 1$, the explicit network applies $C^(⊗ m f)$ to each of $W$ arbitrary arrays indexed by $bb(F)_2^(m f)$. It uses $s$ directional steps, each on one physical array and conjugate by address permutations to copies of $C^(⊗ f)$ on fibers. All other work consists of a fixed number of pointwise linear maps and address permutations. The same assertion holds with any spectator address bits.]
] <net:finite-interface>

#proof[
  Use the gate and terminal labels just constructed in (2.6), with each array address viewed as $f$ columns of $m$ bits. It remains to calculate the terminal frame ratios and implement the edge changes.
  Except for the route $X_d arrow.r Y_d$, a source and its routed sink have labels $0$ and $cal(D)$, so their frame ratio is $C^(⊗ m f)$. For the exceptional route put $u = u_d$. Since $u dot.op u = 1$, $P_(U_d) x = u \[ u dot.op x \]$, and orthogonal weight additivity gives
  $ q_(U_d^perp) \( x \) - q_(U_d) \( x \) = "wt" \( x \) - 2 "wt" \( u \) \[ u dot.op x \] = "wt" \( x \) + 2 \[ u dot.op x \] med \( mod med 4 \) . $
  Here $"wt" \( u \) = 27$ is odd. Hence the exceptional frame ratio is $R_u C^(⊗ m)$ in each column. Correct these translations at the sinks and undo the signed bank exchange. The result is $C^(⊗ m f)$ on each physical role, including every auxiliary array.
  By Lemma 5, an edge with residual dimension $rho$ uses $rho$ products $C_z^(⊗ f)$ or $\( C_z^(- 1) \)^(⊗ f)$. Extend $z$ to a binary basis and apply the corresponding invertible address change in each column. Translation by $z$ becomes a flip of one selected bit, so the forward product is $C^(⊗ f)$ on those $f$ selected bits, for each setting of all other bits. Inverse products add only translations. Summing the residual dimensions gives precisely $s$ directional steps. The network, all its bases, and the number of remaining pointwise operations are fixed independently of $f$. Spectator bits merely index additional copies of these identities. ◻
]

=== 2.5 Linear-time address changes <linear-time-address-changes>

The address permutations in Proposition 7 must not introduce a factor $f$. The following enumeration also explains the uniform construction of the recursive batches.

#thm([Lemma 2.5.])[
  #emph[Let $k = m f + r$ with $0 lt.eq r < m$, and fix an invertible binary map on an $m$-bit column. Applying it in all $f$ columns, translating columns by prescribed fixed vectors, and collecting one chosen output bit from every column into a contiguous $f$-bit address field can be implemented in $O \( 2^k \)$ time. This includes all index preparation and data movement; the constant may depend on $m$ and the fixed maps, but not on $f$ or $k$.]
] <net:indexing>

#proof[
  An $m$-bit column is a digit of radix $2^m$. Since $m$ and the maps are fixed, a finite table gives, for each possible column digit, its old bits, transformed bits, selected output bit, and remaining output bits. This table can be constructed once by the specified binary arithmetic; its cost is an absolute constant. The $r$ spectator bits form one additional digit of radix $2^r$, omitted when $r = 0$.
  For a given $k$, compute the input and output bit-position strides and the displaced table contributions for each column. This costs $O \( f + 1 \)$ operations with a constant depending on $m$. An input address and the desired output address are each sums of the contributions of their column digits and the spectator digit; the output contributions put the selected bits in their common field and all other bits outside it. Traverse the digit prefix tree, retaining these two partial sums. Extending a prefix by a digit adds its two tabulated contributions in constant time. At a leaf, copy the value between the two resulting addresses, using a separate output array to avoid overwriting unread values. Every internal node has at least two children. There are $2^k$ leaves, so fewer than $2^(k + 1)$ nodes, including the root. The preparation cost is also $O \( 2^k \)$. Reversing the source and destination addresses implements the inverse permutation with the same bound.
  Take the selected $f$ bits as the least significant output field. Each fiber is then contiguous, and consecutive groups of $W_(*)$ fibers, for any fixed $W_(*)$, are consecutive blocks of $W_(*) 2^f$ entries. No per-entry scan of the columns is needed to form or undo these groups. Addresses have $k + O \( 1 \)$ bits, with the fixed network sizes included in the constant. ◻
]

=== 2.6 Exact batching and the critical exponent <exact-batching-and-the-critical-exponent>

The least power of two at least $W$ is

#[#set math.equation(numbering: n => "(2.9)")
 $ W_(*) = 2^71 \, #h(2em) S = s + \( W_(*) - W \) m = W_(*) m - Delta \, #h(2em) lambda = S / W_(*) = m - Delta / 2^71 \, #h(2em) theta = log_m lambda . $ <net:padding>]

In particular $1 < lambda < m$, so $0 < theta < 1$. The $W_(*) - W$ extra roles each use the $m$ ordinary coordinate directions, preserving the absolute saving $Delta$.

#thm([Theorem 2.6.])[
  #emph[There is a deterministic exact algorithm applying $C^(⊗ k)$ to an arbitrary complex array of length $2^k$ in 
$ O #scale(x: 120%, y: 120%)[\(] 2^k \( k + 1 \)^theta #scale(x: 120%, y: 120%)[\)] $

 time, for every integer $k gt.eq 0$. The bound includes fixed-table construction, all scalar arithmetic, array initialization, index preparation, and data movement. Only the rational constants and $i$ are required.]
] <net:tensor-bound>

#proof[
  We first transform $W_(*)$ arbitrary arrays simultaneously. Set $K = m \( 71 + 1 \)$. For $k < K$, apply the $k$ factors of $C$ one at a time along their fibers. Because $K$ is fixed, the cost divided by $W_(*) 2^k$ is bounded by an absolute constant throughout this base range, including $k = 0$.
  For $k gt.eq K$, write $k = m f + r$, where $f = floor.l k \/ m floor.r$ and $0 lt.eq r < m$. Apply the $r$ remaining bit factors directly. On $W$ arrays use Proposition 7 with $f$ columns and $r$ spectator bits. On each of the $W_(*) - W$ remaining arrays use one directional step for each of the $m$ coordinate positions, again simultaneously over all $f$ columns. There are $S$ directional steps in total.
  Each such step requires $2^(k - f)$ independent transforms $C^(⊗ f)$. Since $f gt.eq 72$ and $k - f gt.eq \( m - 1 \) f gt.eq 71$, the number $2^(k - f)$ is divisible by $W_(*) = 2^71$. After the permutation of Lemma 8, partition its fibers into exactly $2^(k - f) \/ W_(*)$ batches and use the present $W_(*)$-array algorithm recursively on each batch. No partially filled recursive batch occurs. Its correctness follows by induction on $k$, since $f < k$, and because the network interface applies to arbitrary values on #emph[all] its roles.
  Let $T \( k \)$ be the cost for $W_(*)$ arrays and $t \( k \) = T \( k \) \/ \( W_(*) 2^k \)$. The fixed number of pointwise gates, permutations, terminal corrections, and at most $m - 1$ leftover bit layers cost at most $A W_(*) 2^k$ outside recursive calls, for an absolute constant $A$. Batch setup and returning results are included in this bound: the batches partition a packed array, and their number is at most its length. Thus
  $ T \( k \) & lt.eq A W_(*) 2^k + S 2^(k - f) / W_(*) T \( f \) \,\
t \( k \) & lt.eq A + lambda t \( floor.l k \/ m floor.r \) #h(2em) \( k gt.eq K \) . $
  This exact recurrence permits the critical exponent $theta = log_m lambda$. To see this directly, unroll it for $d$ steps until the argument falls below $K$. Successive arguments are $floor.l k \/ m^j floor.r$, and $d lt.eq ceil.l log_m \( k + 1 \) ceil.r$. If $B$ bounds the normalized base costs, then
  $ t \( k \) lt.eq A sum_(j = 0)^(d - 1) lambda^j + B lambda^d lt.eq (frac(A, lambda - 1) + B) lambda^d = O \( \( k + 1 \)^theta \) . $
  Here $lambda^d lt.eq lambda \( k + 1 \)^theta$. The same estimate holds in the base range by increasing the constant.
  Fixed tables may be generated once and reused; even generating them on the first invocation contributes an absolute constant. The recursive calls can run serially and reuse their working arrays. Their address fields, counters, and strides use $O \( k + 1 \)$ bits: at each active level only a fixed number of arrays of the current length is needed, and the lengths shrink from $2^k$ to $2^(floor.l k \/ m floor.r)$ and so on. The recursion stack has $O \( log \( k + 2 \) \)$ levels. Thus the claimed workspace is bounded by a constant times $sum_(j = 0)^d W_(*) 2^(floor.l k \/ m^j floor.r) + O \( k + 1 \) = O \( W_(*) 2^k \)$; consecutive nonterminal array lengths decrease by at least a factor of two. The claimed index costs therefore use exactly the logarithmic-word model of the paper.
  Finally, initialize $W_(*) - 1$ unused arrays to zero, put the requested array in the remaining role, run the simultaneous procedure, and retain that role’s output. Initialization costs $O \( W_(*) 2^k \) = O \( 2^k \)$, and $W_(*)$ is an absolute constant. This proves the stated single-array bound. ◻
]

#prodef([Remark 2.7.])[
  Restoring arbitrary auxiliary values in Lemma 4 is essential. After the frame changes, those physical roles are required to undergo the same tensor transform as the data banks. A network valid only with zero auxiliary values would not justify using arbitrary transform fibers as all $W_(*)$ roles in the recursive batches. Equation (2.6) establishes the required full linear-map identity.
] <net:role-remark>

== 3 Compiling a Fourier transform on its own coordinates <loc:section>

We next express a Fourier matrix using shallow layers on exactly its given coordinates. Preserving the width is essential: later, the coordinate sets will be tensor factors, so padding them separately would multiply the total dimension. We first factor the Fourier matrix into diagonal and triangular Toeplitz matrices. We then implement those Toeplitz factors on their own coordinates, using the exact-width mechanism of #cite(label("exactfourier")) Section 3 with an effective choice of workspace. Finally, we compile every two-coordinate operation to the particular matrix $C$ used above.

A #emph[shear] adds a scalar multiple of one coordinate to a distinct coordinate and leaves all other coordinates unchanged. A #emph[shear layer] consists of shears on disjoint pairs. A #emph[monomial layer] is an invertible monomial matrix. We also use #emph[mixed rounds]: on disjoint coordinate regions, such a round performs monomial layers or shear layers. It splits into a monomial layer followed by a shear layer. This convention lets independent recursive calls run in parallel.

#thm([Proposition 3.1.])[
  (Uniform local compiler).  #emph[Let $r gt.eq 1$ and let $u$ be any primitive $r$th root of unity. The matrix $F_r \( u \) = \( u^(i j) \)_(0 lt.eq i \, j < r)$ has a word on exactly $r$ coordinates with $O \( 1 + log^4 r \)$ slots, each of which is either]
  + #emph[a monomial layer, or]
  + #emph[disjoint copies of $C$ on ordered pairs, with identity on every remaining singleton.]
  #emph[There is one fixed repeating pattern of slot types into which all these words can be padded. For any finite collection of widths at most $R$, the words can therefore be synchronized in $O \( 1 + log^4 R \)$ slots.]
  #emph[Their schedules and scalar coefficients can be prepared in time $r^(O \( 1 \))$, with an absolute exponent, counting both exact scalar arithmetic and integer bookkeeping. Besides $u$ and the fixed constant $i$, this preparation needs only power-of-two roots of orders at most $8 r$. Coefficients are specified by shared arithmetic programs over these roots and rational numbers. Every division is by a proved nonzero scalar; every structural choice uses integers alone. Neither a test for zero of a complex number nor conjugation of input data is required.]
] <loc:compiler>

=== 3.1 Reducing Fourier matrices to triangular Toeplitz matrices <reducing-fourier-matrices-to-triangular-toeplitz-matrices>

The Fourier matrix evaluates a polynomial at the powers of $u$. Writing that polynomial in the Newton basis makes evaluation triangular. Symmetry then removes the need to compile the change of basis separately.

#thm([Lemma 3.2.])[
  (Newton reduction).  #emph[For every primitive $r$th root $u$, with $r gt.eq 1$, there is an invertible lower triangular matrix $N$ such that 
$ F_r \( u \) = N D_N^(- 1) N^(sans(T)) \, #h(2em) D_N = "diag" \( N_00 \, dots.h \, N_(r - 1 \, r - 1) \) . $

 The matrix $N$ is a product of two invertible diagonal matrices and one invertible lower triangular Toeplitz matrix of width $r$. All these factors can be prepared in polynomial time as rational expressions in $u$, with every denominator nonzero.]
] <loc:newton-reduction>

#proof[
  For $r = 1$ take $N = D_N = T = \( 1 \)$. Otherwise let the $k$th column of $P$ be the coefficient vector of the monic Newton polynomial $product_(j = 0)^(k - 1) \( Z - u^j \)$, for $0 lt.eq k < r$. Then $P$ is unit upper triangular and $N = F_r \( u \) P$ is lower triangular. For $i gt.eq k$,
  #[#set math.equation(numbering: n => "(3.1)")
   $ N_(i k) = product_(j = 0)^(k - 1) \( u^i - u^j \) = \( - 1 \)^k u^(k \( k - 1 \) \/ 2) H_i / H_(i - k) \, #h(2em) H_j = product_(s = 1)^j \( 1 - u^s \) \, quad H_0 = 1 . $ <loc:newton>]
  The required $H_j$, $0 lt.eq j < r$, are nonzero because $u$ is primitive. Consequently
  $ N = "diag" \( H_i \) thin T thin "diag" #scale(x: 120%, y: 120%)[\(] \( - 1 \)^k u^(k \( k - 1 \) \/ 2) #scale(x: 120%, y: 120%)[\)] \, #h(2em) T_(i k) = cases(delim: "{", H_(i - k)^(- 1) \, & i gt.eq k \,, 0 \, & i < k .) $
  Here $T$ is invertible lower triangular Toeplitz, with diagonal one and coefficient sequence $h_j = H_j^(- 1)$.
  Let $D_N = "diag" \( N_00 \, dots.h \, N_(r - 1 \, r - 1) \)$ and $L = N D_N^(- 1)$. The identity $F_r \( u \) = L D_N P^(- 1)$ is a unit-lower/diagonal/unit-upper factorization. Such a factorization is unique: comparing two makes a unit lower triangular matrix equal an upper triangular matrix, forcing both to be identity, and then identifies their diagonal factors. Since $F_r \( u \) = F_r \( u \)^(sans(T))$, transposition gives another such factorization. Uniqueness yields $P^(- 1) = L^(sans(T))$, hence
  #[#set math.equation(numbering: n => "(3.2)")
   $ F_r \( u \) = N D_N^(- 1) N^(sans(T)) . $ <loc:fourier-factorization>]
  Computing the powers of $u$, the $H_j$, and all diagonal entries has polynomial cost. Every division above is by a product of nonzero $H_j$ and powers of $u$. In particular, the argument applies to composite $r$ and to every primitive root of order $r$. ◻
]

Thus it suffices to compile an invertible triangular Toeplitz matrix on its own coordinates. Its transpose will require the same number of layers: transposition reverses the factor order and preserves monomial and shear layers. The next two subsections establish this Toeplitz compiler, including the workspace needed by its convolutions.

=== 3.2 Convolution and arbitrary borrowed coordinates <convolution-and-arbitrary-borrowed-coordinates>

We use linear arithmetic directed acyclic graphs (DAGs) in which each gate forms a linear combination of at most two sources or earlier gate values. Each output is one designated source or gate read, or zero; any output sum or scaling is included among the gates. Fan-out counts these designated output uses as well as uses by later gates.

The elementary convolution circuits will supply the local operations. A convolution of variable data with a fixed vector, whose operand lengths have sum $v$, has a linear arithmetic DAG with

#[#set math.equation(numbering: n => "(3.3)")
 $ O #scale(x: 120%, y: 120%)[\(] v log \( 2 + v \) #scale(x: 120%, y: 120%)[\)] upright(" gates") \, #h(2em) O #scale(x: 120%, y: 120%)[\(] log \( 2 + v \) #scale(x: 120%, y: 120%)[\)] upright(" depth") \, $ <loc:convolution-bounds>]

and absolute bounded fan-out, counting designated output uses. Gates have at most two predecessors. Reversals and truncations preserve these bounds.

Indeed, pad to the least power of two $L$ at least the full product length. At $L$th roots of unity, convolution is pointwise multiplication. The transform of the fixed vector supplies scalar coefficients. The binary Fourier recursion separates even and odd coefficients and combines transformed entries $a \, b$ into $a + omega b \, a - omega b$. Each entry is used a bounded number of times at the next level. The inverse uses inverse roots and multiplication by $L^(- 1)$, as follows from the geometric sum of the roots. This proves (3.3), including all multiplications by fixed scalars. Literal zero inputs need no variable registers. Selections have no repeated output indices; a fixed number of these circuits, their compositions, and their sums still have absolute bounded fan-out. Their topology can be printed before any scalar coefficients are evaluated, retaining even gates with a coefficient that might happen to vanish.

The DAG may have extra wires. The following identity implements its effect using coordinates that already carry other data. Its first replay has the compute–copy–reverse pattern of Bennett’s reversible simulation #cite(label("bennett1973")). Restoring storage with arbitrary initial contents is also the principle of clean transparent computation in catalytic space #cite(label("buhrmanEtAl2014")) Section 3. The source-suppressed second replay below proves the exact cancellation and layer bounds needed here.

#thm([Lemma 3.3.])[
  (Replay with arbitrary borrowed coordinates).  #emph[Suppose $M : bb(C)^e arrow.r bb(C)^a$ has a linear DAG with $g$ gates, depth $H$, fan-in at most two, and fan-out at most $delta$, including output uses. Each output is a source or gate read, or zero. On disjoint coordinate sets $x \, y \, z$ of sizes $e \, a \, g$, respectively, a word of $O \( \( delta + 1 \) \( H + 1 \) \)$ shear layers implements 
$ \( x \, y \, z \) mapsto \( x \, y + M x \, z \) . $

 It uses at most $8 g + 2 a$ shears. The initial contents of $z$ are arbitrary, including values correlated with $x$, $y$, or other data.]
] <loc:replay>

#proof[
  Assign one coordinate $z_v$ to each gate, in topological order. Instead of assigning the gate value, add its prescribed linear combination of predecessors into $z_v$. This takes at most two shears. The resulting forward sweep has the form
  $ z mapsto U z + T x \, $
  where $U$ is unit lower triangular. Write the output reads as $F z + D x$, allowing outputs that read a source directly; each nonzero output is one designated read. Starting with zero gate coordinates computes the original DAG, so $F T + D = M$.
  Run the forward sweep, add its output reads into $y$, and undo the sweep. This restores $z$ and adds $M x + F U z$ to $y$. Next run the same sweep with all direct-source edges omitted, omit $D x$ at the readout, subtract the resulting output $F U z$, and undo the sweep again. The net effect is the stated map. The target coordinates are never predecessors in either sweep. The calculation is an identity in independent variables $x \, y \, z$, so it remains valid for correlated initial contents.
  To arrange a sweep into layers, assign gates their longest-path depth levels. Within one level, destinations are new gate coordinates and predecessors are earlier gate coordinates or sources. The undirected multigraph of shear edges has maximum degree $Delta lt.eq max { 2 \, delta }$. Greedy edge coloring uses at most $2 Delta - 1$ colors, since each edge meets at most $2 Delta - 2$ others. The operations in one color have disjoint pairs. Reordering by color is valid because no destination is a predecessor at the same level. The output additions have the same property: their sources have bounded output fan-out and each target has one read. Reverse sweeps use the reversed layers and negated coefficients. Four sweeps and two output rounds give the depth bound and the count $8 g + 2 a$. ◻
]

=== 3.3 Toeplitz layers and a measured workspace rule <toeplitz-layers-and-a-measured-workspace-rule>

The matrix representation in the next proof is the displacement-rank construction of Kailath, Kung, and Morf #cite(label("kailathKungMorf1979")) Lemmas 1–2: low-rank shift differences reconstruct a matrix through Toeplitz convolution factors. We give the rectangular-chunk formulas and then fit their computation into the available coordinates.

#thm([Lemma 3.4.])[
  (Effective exact-width Toeplitz layers).  #emph[An invertible lower triangular Toeplitz matrix of width $r$ has a word on exactly $r$ coordinates in $O \( 1 + log^4 r \)$ mixed rounds. A fixed algorithm prepares the word and its coefficients in $r^(O \( 1 \))$ time from the Toeplitz entries and power-of-two roots of orders at most $8 r$. The topology depends only on $r$; all divisions by Toeplitz parameters are justified by the nonzero diagonal entry.]
] <loc:toeplitz>

#proof[
  We split the transform into two smaller diagonal blocks and a cross update. For each rectangular part of that update, we will construct a convolution DAG and fit all its gate coordinates inside the parent block. We then count the resulting layers and the preparation work.
  Write $T_v = \( h_(i - j) \)_(0 lt.eq j lt.eq i < v)$, with zero entries above the diagonal and $h_0 eq.not 0$. The same initial sequence $h$ specifies all smaller blocks used below. Its reciprocal-series coefficients are computed by
  #[#set math.equation(numbering: n => "(3.4)")
   $ g_0 = h_0^(- 1) \, #h(2em) g_k = - h_0^(- 1) sum_(j = 1)^k h_j g_(k - j) quad \( 1 lt.eq k < r \) . $ <loc:reciprocal>]
  They give the inverse of every lower triangular Toeplitz block.
  For $v > 1$, put $p = floor.l v \/ 2 floor.r$ and write
  $ T_v = mat(delim: "(", T_p, 0; B, T_(v - p)) . $
  The factorization
  $ T_v = mat(delim: "(", I, 0; E, I) "diag" \( T_p \, T_(v - p) \) \, #h(2em) E = B T_p^(- 1) \, $
  first performs the two diagonal transforms in parallel, then adds to the second block from the transformed first block. In the original indices of this cross block,
  #[#set math.equation(numbering: n => "(3.5)")
   $ E_(i j) = sum_(nu = j)^(p - 1) h_(i - nu) g_(nu - j) \, #h(2em) p lt.eq i < v \, quad 0 lt.eq j < p . $ <loc:cross>]
  Partition both intervals into consecutive chunks. For a target chunk of size $a$ and source chunk of size $e$, let $M$ be the corresponding $a times e$ submatrix of $E$. Let $J_a \, J_e$ denote the lower shifts. Away from the first local row and column, (3.5) telescopes to
  #[#set math.equation(numbering: n => "(3.6)")
   $ E_(i j) - E_(i - 1 \, j - 1) = - h_(i - p) g_(p - j) . $ <loc:displacement-entry>]
  Thus, writing $cal(D) = M - J_a M J_e^(sans(T))$, we can form
  #[#set math.equation(numbering: n => "(3.7)")
   $ cal(D) = sum_(nu = 1)^3 v^(\( nu \)) \( w^(\( nu \)) \)^(sans(T)) $ <loc:displacement>]
  without any rank test. Specifically, extend the outer product on the right of (3.6) to the entire chunk and subtract it from $cal(D)$, obtaining $R$. If $e_0$ is the first unit vector, the two remaining outer products are $e_0 R_(0 \, *)$ and $\( R_(* \, 0) - R_00 e_0 \) e_0^(sans(T))$. They correct its first row and first column. Keep all three terms, even when some coefficients vanish.
  Iterating $M = cal(D) + J_a M J_e^(sans(T))$ gives, by nilpotence, the finite reconstruction
  #[#set math.equation(numbering: n => "(3.8)")
   $ M = sum_(l gt.eq 0) J_a^l cal(D) \( J_e^(sans(T)) \)^l . $ <loc:reconstruction>]
  For one outer product $v w^(sans(T))$, its contribution has entries $sum_(l gt.eq 0) v_(i - l) w_(j - l)$, with zero extension. Apply it to $x$ by
  #[#set math.equation(numbering: n => "(3.9)")
   $ b_l = sum_(j = l)^(e - 1) w_(j - l) x_j quad \( 0 lt.eq l < e \) \, #h(2em) c_i = sum_(l = 0)^(e - 1) v_(i - l) b_l quad \( 0 lt.eq i < a \) . $ <loc:two-convolutions>]
  If $x_j^(upright("rev")) = x_(e - 1 - j)$, the first map selects $b_l = \( w * x^(upright("rev")) \)_(e - 1 - l)$ from an ordinary convolution. The second map is a truncated convolution. Using three branches and summing their outputs gives a specific DAG with absolute constants $K_0 \, K_1 \, delta_0$ such that
  #[#set math.equation(numbering: n => "(3.10)")
   $ g lt.eq K_0 \( a + e \) log_2 \( 2 + a + e \) \, #h(2em) H lt.eq K_1 log_2 \( 2 + a + e \) \, #h(2em) delta lt.eq delta_0 . $ <loc:chunk-bounds>]
  These include output uses: every source is used in only three branches, the branches retain bounded fan-out, and their sum uses a bounded number of gates per output.
  To fit this DAG inside the parent block, reserve the $a + e$ target and source coordinates and one borrowed coordinate for each of its $g$ gates. All $g$ coordinates stay assigned to their gates throughout the replay. Here is an effective choice of chunk size that does not require knowing $K_0$. For every integer $b in { 1 \, dots.h \, v }$, partition each interval into chunks of size $b$, except for its possible last chunk. Print the DAG skeleton for every resulting pair and count its gates. Declare $b$ admissible precisely when, for every pair,
  #[#set math.equation(numbering: n => "(3.11)")
   $ g + a + e lt.eq v . $ <loc:fit>]
  Choose the largest admissible $b$. This is an integer test on printed graphs, independent of the coefficients, made before any data are transformed. If no $b$ is admissible, replace the entire recursive decomposition of $T_v$ by a direct word: process rows in decreasing order, multiply the current coordinate by $h_0$, and add $h_(i - j)$ times each lower-indexed coordinate $j < i$. The lower coordinates still have their original values, so this computes exactly $T_v$. Width one is a scaling.
  To prove the depth bound, fix for analysis a sufficiently large absolute $D$, for example $D gt.eq 16 K_0 + 16$. For all sufficiently large $v$,
  $ b_0 = ⌊frac(v, D log_2 v)⌋ gt.eq frac(v, 2 D log_2 v) gt.eq 1 $
  passes (3.11). Indeed $a + e lt.eq 2 v \/ \( D log_2 v \) lt.eq v \/ 8$, while (3.10) gives $g lt.eq 4 K_0 v \/ D lt.eq v \/ 4$. Consequently the direct fallback occurs only for bounded $v$, and the chosen size $b gt.eq b_0$ leaves $O \( log v \)$ chunks in each interval.
  For a selected pair, borrow $g$ coordinates outside its source and target chunks but inside these same $v$ coordinates; (3.11) guarantees their availability. Lemma 13 implements its update in $O \( 1 + log v \)$ shear layers. Process the $O \( log^2 v \)$ pairs serially. Every borrowed coordinate is restored before the next pair, so it may carry a source value, an already updated target value, or any other current data. The complete cross update takes $O \( 1 + log^3 v \)$ layers. Child calls use disjoint blocks, hence the mixed-round depth satisfies
  $ d \( v \) lt.eq max { d \( floor.l v \/ 2 floor.r \) \, d \( ceil.l v \/ 2 ceil.r \) } + O \( 1 + log^3 v \) . $
  Summing along a balanced recursion path proves $d \( r \) = O \( 1 + log^4 r \)$.
  We finally account for preparation. Formula (3.4), the entries (3.5), and the three explicit outer products use polynomially many scalar operations. Each node of the recursion tests at most $v$ sizes and at most $v^2$ chunk pairs per size; every printed graph has $O \( v log \( 2 + v \) \)$ gates. There are fewer than $2 r$ nodes. Even this deliberately redundant search has polynomial integer cost. Gate-level assignments, bounded-degree edge colorings, and the choice of the first available borrowed coordinates can all be performed by finite scans of these lists. Only the chosen graphs need their scalar coefficients evaluated. Fixed-vector transforms and all other coefficient computations have polynomial cost as well. Store computed scalars and references to them as an arithmetic DAG; there is no expansion into expression trees.
  The first convolution in (3.9) has operand lengths $e \, e$, and the second has lengths $a \, e$. Their padded Fourier lengths are powers of two smaller than $4 r$. Thus a single primitive root of power-of-two order $L_r = 2^(ceil.l log_2 \( 4 r \) ceil.r) < 8 r$ supplies every needed root by taking powers. These powers and their inverses are also prepared with polynomially many operations. Integer indices in the entire compiler have $O \( log \( 2 + r \) \)$ bits. This proves the claimed preparation bound, with no need to determine the finite threshold in the depth argument. ◻
]

=== 3.4 Fourier layers and a fixed word in the kernel <fourier-layers-and-a-fixed-word-in-the-kernel>

#thm([Lemma 3.5.])[
  (Fourier layers at every primitive root).  #emph[For every primitive $r$th root $u$, the matrix $F_r \( u \)$ has a polynomially preparable exact-width word in $O \( 1 + log^4 r \)$ monomial and shear layers. Its coefficients are rational expressions in $u$ and the power-of-two roots from Lemma 14, with all denominators nonzero.]
] <loc:fourier>

#proof[
  Apply Lemma 14 to the Toeplitz factor of $N$ in Lemma 12. The two diagonal factors of $N$ are monomial layers. Equation (3.2) then gives the Fourier word by composing the words for $N^(sans(T))$, $D_N^(- 1)$, and $N$. Transposition preserves the layer types and reverses the factor order. Split mixed rounds into monomial and shear layers. There are $O \( 1 + log^4 r \)$ layers in total, and all preparation bounds and nonzero-denominator guarantees follow from the two lemmas. ◻
]

We complete the proof of Proposition 11. Recall $C = mat(delim: "(", a, b; b, a)$, $a = \( 1 + i \) \/ 2$, $b = \( 1 - i \) \/ 2$. Set

$ H' = mat(delim: "(", 1, 1; 1, - 1) \, #h(2em) S = "diag" \( 1 \, i \) . $

Direct multiplication gives $H' = a^(- 1) S C S$ and

#[#set math.equation(numbering: n => "(3.12)")
 $ K := H' "diag" \( 2 \, 1 \) H' "diag" \( - 3 \, 1 \) H' = mat(delim: "(", - 8, - 10; 0, - 6) . $ <loc:three-kernel>]

Thus every upper shear with nonzero coefficient $t$ has a word with exactly three forward copies of $C$ and invertible diagonal factors:

#[#set math.equation(numbering: n => "(3.13)")
 $ mat(delim: "(", 1, t; 0, 1) = D_t "diag" \( - 1 \/ 8 \, - 1 \/ 6 \) K D_t^(- 1) \, #h(2em) D_t = "diag" \( 4 t \/ 5 \, 1 \) . $ <loc:nonzero-shear>]

An update $y arrow.l y + t x$ is this upper shear on the ordered pair $\( y \, x \)$. The order of a pair is part of the discrete schedule.

A general coefficient $mu$ may vanish, but no test is necessary. Prepare

#[#set math.equation(numbering: n => "(3.14)")
 $ kappa = 1 + mu overline(mu) \, #h(2em) t_1 = kappa \, #h(2em) t_2 = mu - kappa . $ <loc:nonzero-split>]

Both $t_1 \, t_2$ are nonzero, since $1 + \| mu \|^2 > \| mu \|$. The two corresponding shears compose to the desired shear, including when $mu = 0$. Equations (3.12)–(3.14) therefore give the same six-$C$ slot pattern for every coefficient. On disjoint pairs these words run in parallel; every unused coordinate is an identity singleton in every $C$ slot.

The conjugate in (3.14) is a prepared scalar, not an operation on variable data. Every coefficient $mu$ from Lemma 15 is given by an arithmetic DAG over rational numbers and the specified roots. Evaluate a second copy of that DAG with each root replaced by its inverse. Rational constants are real, so the result is precisely $overline(mu)$. The second evaluation has the same size, and its denominators are conjugates of nonzero denominators. This argument also includes the fixed root $i$, whose conjugate is $- i$. Shared subexpressions remain shared, so preparing all conjugates increases polynomial preparation cost by at most a constant factor before the constant-size replacements.

Finally, place each layer from Lemma 15 into a monomial slot followed by a shear slot, using identity for the other slot type, and replace the shear slot by this fixed pattern. Combine adjacent monomial slots if desired. An idle round uses identity monomials and only singleton identities in its $C$ slots. All words now repeat a common constant-size pattern. Padding the shorter words with idle rounds synchronizes any finite collection without increasing the $O \( 1 + log^4 R \)$ bound. This proves Proposition 11.

== 4 Synchronizing tensor factors in linear array work <sec:synchronization>

This section turns the tensor-power algorithm and the local compiler into a transform on a product of small coordinate sets. The indexing estimate is as important as the scalar estimate: scanning all the axes anew at each array entry would lose the saving.

=== 4.1 A linear-time traversal rule <a-linear-time-traversal-rule>

For radices $r_1 \, dots.h \, r_ell gt.eq 2$, let $R = product_j r_j$. We order coordinates by mixed-radix tuples, with the first digit most significant. A recursive traversal of the digit tuples visits fewer than $2 R$ nodes, since

#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(j = 0)^ell product_(i = 1)^j r_i lt.eq R sum_(j = 0)^ell 2^(j - ell) < 2 R . $ <eq:prefix-nodes>]

Any state updated in a fixed number of operations per prefix extension can therefore be computed for all coordinates in $O \( R \)$ time. A depth-first traversal uses a stack; it does not copy the whole prefix at every extension.

For example, a tensor monomial maps each local digit $a_j$ to $pi_j \( a_j \)$ and multiplies by a scalar $c_j \( a_j \)$. Extend the original and permuted mixed-radix addresses by the usual multiply-and-add rule, and extend a running coefficient by multiplication by $c_j \( a_j \)$. At a leaf, move and scale one entry. Equation (4.1) gives $O \( R \)$ operations, including the scalar products.

=== 4.2 Packing sectors <packing-sectors>

A layer of disjoint copies of $C$ on an axis partitions its coordinates into ordered pairs and unused singletons. Choose any order of these blocks. For a selected block on axis $j$, let

$ q_j in { 1 \, 2 } \, #h(2em) p_j = upright("the number of coordinates in preceding blocks") \, $

and let $t_j in { 0 \, dots.h \, q_j - 1 }$ denote position within that block. These local tables are part of the compiled layer. The actual axis digit, denoted $a_j$, need not be consecutive in the original coordinate order.

A #emph[sector] chooses one block on each axis. It has width $Q = product_j q_j = 2^k$, where $k$ is the number of chosen pairs. Order sectors lexicographically by their block choices, and each sector internally by its $t_j$ digits. Put $tau_j = product_(i > j) r_i$.

#thm([Lemma 4.1.])[
  #emph[The start of the selected sector in the packed array is 
#[#set math.equation(numbering: n => "(4.2)")
 $ S = sum_(j = 1)^ell (product_(i < j) q_i) p_j tau_j . $ <eq:sector-start>]

 The packing permutation, its inverse, and the list of sector starts, widths, and pair counts can all be generated in $O \( R \)$ operations after the local tables and suffix products have been prepared.]
] <lem:sector-address>

#proof[
  Classify the earlier sectors by the first axis $j$ at which their block choice differs. The preceding chosen blocks contribute width $product_(i < j) q_i$, the earlier blocks at axis $j$ have total width $p_j$, and all later axes have total width $tau_j$. These disjoint classes give (4.2).
  During digit traversal maintain four states: a sector start $S$, a prefix width $Q$, a within-sector offset $o$, and an original address $I$. Initially they are $0 \, 1 \, 0 \, 0$. On extending by the actual local digit $a_j$, whose table supplies $p_j \, q_j \, t_j$, update
  #[#set math.equation(numbering: n => "(4.3)")
   $ S & arrow.l S + Q p_j tau_j \, #h(2em) Q arrow.l Q q_j \,\
o & arrow.l o q_j + t_j \, #h(2em) I arrow.l I r_j + a_j . $ <eq:sector-updates>]
  At the leaf, the packed address is $S + o$. This proves the cost of packing and unpacking by (4.1).
  To enumerate calls, traverse block choices instead of digits, maintaining $S \, Q$, and the number of pairs. If axis $j$ has $b_j$ blocks, then $b_j lt.eq r_j$. Thus the number of block prefixes at every depth is bounded by the number of digit prefixes at that depth, and their total is also $O \( R \)$. This argument includes axes with only one block. Each leaf supplies one contiguous sector, with no additional scan through its axes. ◻
]

#figure(
  [#image("fig/sectors.pdf.png", width: 92.0%)],
  caption: [Figure 2: Two axes, each partitioned into a pair and a singleton. A simultaneous pair layer becomes four independent tensor-power calls. The original pair coordinates can be nonconsecutive; the local tables and (4.3) perform the reordering in linear time. ],
) <fig:sectors>

=== 4.3 The synchronized transform <the-synchronized-transform>

#thm([Proposition 4.2.])[
  #emph[Let $ell gt.eq 1$ and $r_1 \, dots.h \, r_ell gt.eq 2$ be integers, and suppose the required specified roots are given. Put $R = product_j r_j$ and $r_max = max_j r_j$. The map $⨂_j F_(r_j)$ is computable in 
#[#set math.equation(numbering: n => "(4.4)")
 $ O #h(-0.16667em) (R \( ell + 1 \)^theta \( 1 + log r_max \)^4) + "poly" \( ell \, r_max \, log \( R + 2 \) \) $ <eq:tensor-fourier>]

 operations, including compilation, scalar preparation, and array work. The polynomial and the implicit constant are absolute.]
] <prop:tensor-fourier>

#proof[
  Use Proposition 11 on every axis. Its words can be refined and padded to a common sequence of $O \( \( 1 + log r_max \)^4 \)$ slot types: a monomial slot or a slot of disjoint copies of $C$ and singleton identities. Padding a pair slot means using only singleton blocks on that axis.
  At each slot take the tensor product across axes. These slots multiply to the desired tensor transform because
  #[#set math.equation(numbering: n => "(4.5)")
   $ \( ⨂_j A_j \) \( ⨂_j B_j \) = ⨂_j \( A_j B_j \) . $ <eq:tensor-multiply>]
  In particular, a local word’s correctness on arbitrary inputs suffices. Another axis may change coordinates during intermediate slots; one does not require it to preserve the local word’s borrowed coordinates throughout that word.
  Tensor monomials cost $O \( R \)$ by the prefix traversal. A tensor pair slot decomposes into the sectors of Lemma 16. Its width-$2^k$ sector carries precisely $C^(⊗ k)$. Theorem 9 bounds its cost, including invocation and movement, by $O \( 2^k \( k + 1 \)^theta \)$. As $k lt.eq ell$ and the sector widths sum to $R$, their total cost is $O \( R \( ell + 1 \)^theta \)$. Packing, unpacking, and discovering even the width-one sectors cost another $O \( R \)$. This proves the first term of (4.4).
  The local compilers use polynomial work in their widths. Suffix products, local block tables, and the other integer preparation use polynomial work in $ell \, r_max \, log \( R + 2 \)$. All running scalar products have been charged in the traversal, so the polynomial term describes local preparation only. ◻
]

== 5 Working lengths and the transform at every length <sec:all-lengths>

To apply the synchronized transform at a requested length $n$, we first choose a working length $L$ with $2 n lt.eq L < 4 n$. The lower bound permits the chirp convolution below, while the upper bound keeps its array size linear in $n$. We also need small coprime factors: their widths must be polynomial in $log n$ so that local compilation has only polylogarithmic cost. A product of initial odd primes supplies these axes, and one power of two fills the remaining gap to $2 n$.

=== 5.1 Enough small, pairwise coprime factors <enough-small-pairwise-coprime-factors>

Let $r_1 < r_2 < dots.h.c$ be the odd primes and let $R_ell = product_(j = 1)^ell r_j$, with $R_0 = 1$. The modest estimate below suffices; no prime number theorem is used.

#thm([Lemma 5.1.])[
  #emph[One has $r_j = O \( \( j + 1 \)^2 \)$ and 
$ log R_ell = Theta \( ell log \( ell + 2 \) \) . $

 For the largest $ell$ with $R_ell lt.eq 2 n$, as $n arrow.r oo$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ ell = Theta #h(-0.16667em) (frac(log n, log log n)) \, #h(2em) log ell = Theta \( log log n \) . $ <eq:axis-count>]

 The primes and this value of $ell$ can be found with a number of operations polynomial in $log \( n + 2 \)$, using $O \( log \( n + 2 \) \)$-bit integers.]
] <lem:prime-lengths>

#proof[
  Writing $pi \( t \)$ for the number of primes at most $t$, for integer $u gt.eq 1$ we have
  #[#set math.equation(numbering: n => "(5.2)")
   $ frac(4^u, 2 u + 1) lt.eq binom(2 u, u) lt.eq \( 2 u \)^(pi \( 2 u \)) . $ <eq:binomial-primes>]
  The first inequality follows because the central binomial coefficient is largest. In the factorial formula, the exponent of a prime $p$ in $binom(2 u, u)$ is
  $ sum_(a gt.eq 1) #scale(x: 120%, y: 120%)[\(] floor.l 2 u \/ p^a floor.r - 2 floor.l u \/ p^a floor.r #scale(x: 120%, y: 120%)[\)] lt.eq floor.l log_p \( 2 u \) floor.r . $
  Its prime-power contribution is therefore at most $2 u$, proving the second inequality. Taking $u = \( j + 1 \)^2$ shows that $pi \( 2 u \) > j + 1$ for all sufficiently large $j$, so the $j$th odd prime is $O \( \( j + 1 \)^2 \)$.
  The upper bound on $log R_ell$ now follows by summation. For the lower bound, $r_j gt.eq j + 2$, so $R_ell gt.eq \( ell + 2 \) ! \/ 2$. For instance, the last half of these factors alone give a constant times $ell log ell$ in the logarithm. Maximality says
  $ R_ell lt.eq 2 n < R_ell r_(ell + 1) . $
  The extra logarithm is $O \( log \( ell + 2 \) \)$, giving $log n = Theta \( ell log ell \)$ and hence (5.1).
  Primes up to the first unused prime are bounded by a fixed polynomial in $ell + 1 = O \( log \( n + 2 \) \)$. Testing potential divisors of each candidate is already polynomial work in $log \( n + 2 \)$. Maintain the product and stop at the first exceeding $2 n$; the product at stopping is at most $2 n$ times a polynomial in $log \( n + 2 \)$. All these integers have $O \( log \( n + 2 \) \)$ bits. ◻
]

Choose this $ell$, and let $e gt.eq 0$ be the least integer for which

#[#set math.equation(numbering: n => "(5.3)")
 $ L = R_ell 2^e gt.eq 2 n . $ <eq:working-length>]

Then

#[#set math.equation(numbering: n => "(5.4)")
 $ 2 n lt.eq L < 4 n \, #h(2em) 2^e < 2 r_(ell + 1) \, #h(2em) e = O \( log \( ell + 2 \) \) . $ <eq:working-bounds>]

Bounded lengths can be treated directly, so subsequent asymptotic estimates may assume $ell gt.eq 1$.

=== 5.2 CRT permutations and the working transform <crt-permutations-and-the-working-transform>

We use Good’s coprime tensor factorization #cite(label("good1958")) Section 12, with its index permutations included in the cost.

For pairwise coprime factors $q$ of $L$, here the odd primes and the factor $2^e$ when nontrivial, choose $d_q$ with

$ \( L \/ q \) d_q equiv 1 med \( mod med q \) \, #h(2em) E_q = \( L \/ q \) d_q . $

The integers $E_q$ are orthogonal idempotents modulo $L$. The Chinese remainder indexing

$ \( j_q \)_q mapsto sum_q E_q j_q med \( mod med L \) $

is a bijection, and for similarly indexed $k$,

#[#set math.equation(numbering: n => "(5.5)")
 $ zeta_L^(j k) = product_q zeta_q^(d_q j_q k_q) . $ <eq:crt-fourier>]

Thus, after permutations of the input and output indices, $F_L$ is the tensor product of the $F_q$. The local output permutation multiplies a digit by the unit $d_q$ modulo $q$.

These permutations take $O \( L \)$ array operations. Prepare the local tables $E_q a med mod med L$ and $d_q a med mod med q$, then enumerate digit tuples with an accumulated sum and mixed-radix address. The prefix bound (4.1) applies; no division by every factor is performed separately for each array entry. Computing the inverses $d_q$ and local tables is polynomial in the logarithm of $n$.

Apply Proposition 17 on the odd-prime axes, with each digit of the power-of-two axis fixed in turn. Then apply the usual radix-two FFT on the fibers of that remaining axis. The former costs

$ O #h(-0.16667em) (L \( ell + 1 \)^theta \( 1 + log \( ell + 2 \) \)^4) + "poly" \( log \( n + 2 \) \) \, $

because $r_ell = O \( \( ell + 1 \)^2 \)$; the latter costs $O \( L \( 1 + e \) \)$. Local tables are shared among the fibers. The standard binary recursion uses $O \( q log \( q + 1 \) \)$ operations at length $q = 2^e$, with $O \( q \)$ twiddle preparation and ordinary linear-time stage indexing. Here $q$ is only polynomial in $ell + 1$.

Consequently both $F_L$ and its inverse have total cost

#[#set math.equation(numbering: n => "(5.6)")
 $ O #h(-0.16667em) (L #scale(x: 120%, y: 120%)[\[] \( ell + 1 \)^theta \( 1 + log \( ell + 2 \) \)^4 + 1 + e #scale(x: 120%, y: 120%)[\]]) + "poly" \( log \( n + 2 \) \) + O \( 1 \) . $ <eq:working-transform>]

For the inverse, the geometric root sum gives $F_L^2 = L J$, where $J$ negates indices modulo $L$. Thus $F_L^(- 1) = L^(- 1) J F_L$, with only linear additional work. The absolute term includes the fixed network construction.

=== 5.3 Chirp convolution and preparation <chirp-convolution-and-preparation>

The reduction is Bluestein’s chirp convolution #cite(label("bluestein")), in the weighted-convolution form of #cite(label("rabinerSchaferRader1969")) Section II. We charge preparation of the fixed convolution operand explicitly.

Put $eta = zeta_(2 n)$. For $0 lt.eq j \, k < n$,

#[#set math.equation(numbering: n => "(5.7)")
 $ zeta_n^(j k) = eta^(k^2) eta^(- \( k - j \)^2) eta^(j^2) . $ <eq:chirp>]

Prepare two length-$L$ vectors. The input-dependent vector has value $eta^(j^2) x_j$ at $0 lt.eq j < n$ and zero elsewhere. The fixed vector has value $eta^(- u^2)$ at the residues represented by $- \( n - 1 \) lt.eq u lt.eq n - 1$, and zero elsewhere. These residues are distinct by $L gt.eq 2 n$. Cyclic convolution of the vectors therefore gives, at each $0 lt.eq k < n$, the sum in (5.7) before multiplication by $eta^(k^2)$.

The convolution is obtained by applying $F_L$ to both vectors, multiplying pointwise, and applying $F_L^(- 1)$. The transform of the fixed vector is part of scalar preparation and is explicitly charged as one full transform. Its pointwise use multiplies the variable data only by prepared scalars. Chirp tables and the zero-padded vectors take $O \( L \) = O \( n \)$ work: successive ratios of the chirps form a geometric progression, so no separate long exponentiation is needed at every entry. There are only three full transforms.

We now specify the single root promised in Theorem 1. With $L$ as in (5.3), set

#[#set math.equation(numbering: n => "(5.8)")
 $ D_(*) = \( 2 n \) L thin 2^(ceil.l log_2 \( 16 L \) ceil.r) . $ <eq:master-root>]

The chirp root has order $2 n$, and the working factor roots have orders dividing $L$. Proposition 11 needs power-of-two roots of orders at most $8 r$ for a local width $r lt.eq L$; each such order divides the last factor in (5.8). The fixed kernel uses only $i$ and rational constants. Thus every required initial root is an integer power of the supplied, specified $zeta_(D_(*))$. Moreover,

#[#set math.equation(numbering: n => "(5.9)")
 $ D_(*) < 64 n L^2 < 1024 n^3 . $ <eq:root-size>]

Binary powering extracts each local initial root in $O \( log \( n + 2 \) \)$ field operations. There are polynomially many local constants and instructions in $log \( n + 2 \)$, so all local extraction and compilation remain polynomial in that logarithm.

The local scalar programs are arithmetic DAGs with shared subexpressions. As in Proposition 11, a coefficient’s conjugate is prepared by evaluating the same DAG with unchanged rational literals and inverse Fourier roots, including $i^(- 1) = - i$. Thus no conjugation of variable input data or zero decision about complex coefficients is required. Full-array scalar products and the transformed convolution kernel have already been charged in (5.6); only the #emph[local] preparation is polynomial in $log \( n + 2 \)$.

=== 5.4 The final estimates <the-final-estimates>

#proof[
  All maps in the construction are exact and deterministic. The local word compiler and the fixed finite network have specified finite construction procedures. On the input data the algorithm is linear, including the chirp reduction, since the second convolution operand is fixed.
  By (5.4), $e = O \( log \( ell + 2 \) \)$ and $L = Theta \( n \)$. Because $theta > 0$, equation (5.6) and the constant number of transforms give
  $ T \( n \) = O \( n ell^theta \( log ell \)^4 \) + "poly" \( log \( n + 2 \) \) + O \( 1 \) . $
  Every fixed power of $log \( n + 2 \)$ is eventually negligible compared with $n ell^theta$. Substituting (5.1) proves (1.2).
  For an exact bound on the exponent, direct integer arithmetic in (1.1) gives
  $ epsilon := frac(Delta, m W_(*)) = 1717850673 / 590295810358705651712 > 28 / 10^13 . $
  Since $log m < 14$, for $eta_0 = 2 \/ 10^13$ one has $eta_0 log m < epsilon$. Using $exp \( - t \) gt.eq 1 - t$,
  $ lambda = m \( 1 - epsilon \) < m exp \( - eta_0 log m \) = m^(1 - 2 dot.op 10^(- 13)) . $
  Hence $theta < 1 - 2 dot.op 10^(- 13)$. The fixed power of $log log n$ in (1.2) is smaller than $\( log n \)^(10^(- 13))$ for all sufficiently large $n$. This proves Corollary 2.
  Finally, all lengths, root orders, products of indices, and addresses are polynomially bounded in $n$ with absolute constants; (5.9) treats the largest root order explicitly. Fixed network tables contribute absolute constants, and local tables have size polynomial in $log \( n + 2 \)$. Array movement and traversal were counted in Theorem 9 and Lemma 16. Therefore a fixed number of $O \( log \( n + 2 \) \)$-bit words per integer suffices throughout, as required by the model. ◻
]

=== 5.5 Two-input convolution and polynomial multiplication <sec:convolution-consequence>

The chirp reduction above convolves input data with a fixed vector and therefore remains linear. For two variable operands, the same Fourier identity gives Corollary 3, with one product of two input-dependent values at each transform coordinate.

#proof[
  Set $M = 2 n - 1$ and zero-pad $a$ and $b$ to vectors $tilde(a) \, tilde(b)$ of length $M$. Every sum of two indices in their supports lies between zero and $2 n - 2 = M - 1$, so the length-$M$ cyclic convolution has no wraparound and is exactly $\( c_0 \, dots.h \, c_(M - 1) \)$. With the positive-exponent convention for $F_M$, its convolution identity is
  $ \( F_M c \)_j = sum_(r \, s = 0)^(n - 1) a_r b_s zeta_M^(j \( r + s \)) = \( F_M tilde(a) \)_j \( F_M tilde(b) \)_j #h(2em) \( 0 lt.eq j < M \) . $
  Compute the two forward transforms and their $M$ pointwise products, obtaining a vector $p = F_M c$. If $J$ negates indices modulo $M$, the geometric root sum gives $F_M^2 = M J$ and therefore
  $ c = F_M^(- 1) p = M^(- 1) J F_M p . $
  Thus one more forward transform, index reversal, and scaling give the answer.
  Apply Theorem 1 at length $M$ for each of the three transforms, charging its scalar preparation, schedule construction, and index work each time. The single specified root supplied for that length can be reused in all three calls. Its explicitly computable order satisfies $D_(*) < 1024 M^3 < 8192 n^3$; equivalently, the model’s root-of-unity operation returns this one root. Padding, pointwise products, reversal, and output scaling take $O \( M \)$ field and address operations. To prepare $M^(- 1)$, form the complex integer $M$ from $1$ by binary doubling and addition in $O \( log \( M + 2 \) \)$ field operations, then divide $1$ by it; the denominator is nonzero because $M gt.eq 1$. All added indices and addresses fit a fixed number of $O \( log \( n + 2 \) \)$-bit words.
  If $T \( M \)$ denotes the charged running time in Theorem 1, the total is $3 T \( M \) + O \( M + log \( M + 2 \) \)$. Since $M = Theta \( n \)$, this gives the first bound, and Corollary 2 gives the eventual decimal power bound. The same formulas apply when $n = 1$; a finite initial range may also be handled directly. ◻
]

== 6 Effective synthesis and uniform compilation <syn:section>

This appendix gives a general route from a finite tensor saving to a uniform Fourier algorithm. Its purpose is to separate two questions: how to obtain usable coefficients from an existence theorem over $bb(C)$, and how to use effective small circuits when their compilation time has no useful bound. The explicit network in the main argument gives the stronger quantitative conclusion without this search. We first replace a complex certificate by identities in a fixed finite-dimensional rational algebra. Matrix representations of that algebra then give ordinary scalar circuits without choosing a complex embedding. We print those circuits together with their scalar preparation programs, and finally limit the printer’s running time to select a sufficiently small compiled radix for each input length.

The certificate used below consists of two finite words for the same invertible nonmonomial matrix $A in "GL"_q \( bb(C) \)$, with integers $q \, b gt.eq 2$. The first word acts on exactly $q^b$ coordinates as $A^(⊗ b)$ and uses

#[#set math.equation(numbering: n => "(6.1)")
 $ g < b q^(b - 1) $ <syn:win>]

forward calls to $A$, interspersed with invertible monomials. A call acts on an ordered $q$-tuple and fixes every other coordinate. The second word acts on $q$ coordinates as $U = I_q + E_12$, where $E_12$ is a matrix unit, using a positive number of forward calls to that same $A$ and invertible monomials.

The companion paper #cite(label("exactfourier")) Theorem 8.3 and Lemma 2.2 obtains such a pair from a general finite-win theorem and positive generation by an invertible nonmonomial matrix. The following lemma supplies the particular certificate needed here directly from our network. Thus the search-termination proof is also available locally. The extraction and printer constructions that follow use only the two word identities, so they retain their general certificate interface.

#thm([Lemma 6.1.])[
  (A local certificate for the symbolic search).  #emph[For the invertible nonmonomial matrix $C$ in (2.1), there are integers $b gt.eq 2$ and $g gt.eq 0$ and a word on exactly $2^b$ coordinates which implements $C^(⊗ b)$ using $g < b 2^(b - 1)$ forward calls to $C$ and invertible monomials. On two coordinates, $I_2 + E_12$ has a word with exactly three forward calls to the same $C$ and invertible diagonal factors.]
] <syn:local-certificate>

#proof[
  Use Proposition 7 and the padding (2.9) on $W_(*) = 2^71$ arrays of length $2^(m f)$. The $S = W_(*) m - Delta$ directional steps require exactly $S f 2^(m f - 1)$ forward $C$-calls when their tensor factors are applied separately: one step has $2^(\( m - 1 \) f)$ fibers, each requiring $f 2^(f - 1)$ calls. Inverse steps add only translations. Each scalar row of (2.3) is a composition of elementary shears between existing, distinct roles; its source coordinates are unchanged within that row. The coefficients are nonzero rational numbers. Equation (3.13) therefore bounds the pointwise work by $H 2^(m f)$ forward calls for a fixed integer $H$ independent of $f$. All remaining operations are invertible monomials. Every role carries arbitrary data, so this word uses exactly $W_(*) 2^(m f)$ coordinates and acts as $I_(W_(*)) ⊗ C^(⊗ m f)$. Address permutations here are monomial factors on these coordinates; no implementation buffer is added to the word’s width.
  Identify the role index with 71 binary axes and apply $C$ along each of them. This costs $71 W_(*) 2^(m f - 1)$ calls and gives $C^(⊗ b)$ with $b = m f + 71$. Its actual number $g$ of forward calls therefore satisfies
  $ g lt.eq \( S f + 71 W_(*) + 2 H \) 2^(m f - 1) = b 2^(b - 1) - \( Delta f - 2 H \) 2^(m f - 1) < b 2^(b - 1) $
  for any integer $f > 2 H \/ Delta$. Finally, $det C = i$ and both scalar coefficients in (2.1) are nonzero, so $C$ is invertible and nonmonomial. Equation (3.13) with $t = 1$ supplies the claimed three-call word for $I_2 + E_12$. Any embedded call on an ordered pair is a permutation conjugate of $C xor I_(2^b - 2)$; the permutations can be absorbed into adjacent monomial factors. ◻
]

=== 6.1 Obtaining finite rational algebra data <obtaining-finite-rational-algebra-data>

The extraction uses the triangular monic substitution from the standard proof of Noether normalization #cite(label("stacksNormalization")) Tags 051M, 051N, and 00OX and the determinant form of Nakayama’s lemma #cite(label("stacksNakayama")). We give the rational algorithm and its termination proof in full.

#thm([Lemma 6.2.])[
  (Effective finite algebra extraction).  #emph[Given finitely many polynomials $f_i$ in $a$ variables over $bb(Q)$, a deterministic rational algorithm either certifies that $\( f_i \)$ is the unit ideal or produces a nonzero finite-dimensional commutative unital $bb(Q)$-algebra $E$, with a rational multiplication table, and elements $xi_1 \, dots.h \, xi_a in E$ satisfying every $f_i \( xi \) = 0$. In particular, a complex solution guarantees the second outcome. Required units can be imposed by adding inverse-witness equations.]
] <syn:extraction>

#proof[
  Keep a finite generating list for the ideal $I = \( f_i \)$ and an integer $m$, initially $m = a$. Retain polynomial-combination witnesses for derived members of $I$; rational elimination and the monic reductions below can track these witnesses. After invertible polynomial changes of coordinates, maintain, for each $j > m$, a known member of $I$ of the form
  $ x_j^(d_j) + sum_(e < d_j) c_(j e) \( x_1 \, dots.h \, x_(j - 1) \) x_j^e \, #h(2em) d_j gt.eq 1 . $
  Thus $S = bb(Q) \[ x_1 \, dots.h \, x_a \] \/ I$ is finite as a module over $R = bb(Q) \[ x_1 \, dots.h \, x_m \]$.
  First compute the fiber $S \/ \( x_1 \, dots.h \, x_m \) S$. This is effective: set $x_1 = dots.h.c = x_m = 0$ and let $B$ be the quotient by only the displayed monic relations. As a tower of monic extensions, $B$ has a rational basis consisting of the monomials whose $x_j$-exponents are less than $d_j$ for $j > m$. Successive monic reduction gives its multiplication table. If $macron(f)_i$ are the images in $B$ of the generators of $I$, form the rational span of all $b macron(f)_i$ with $b$ in this basis. Since the basis spans $B$, this is exactly the ideal $sum_i B macron(f)_i$. Its quotient is the required fiber, so rational linear algebra computes the fiber and its table. A nonzero fiber is the requested answer, after undoing the coordinate changes. If $m = 0$ and the fiber is zero, then $S = 0$, so $I$ is the unit ideal.
  Suppose the fiber is zero and $m > 0$. We claim $I ∩ R eq.not 0$. Otherwise $R arrow.r.hook S$. Localize at $frak(m) = \( x_1 \, dots.h \, x_m \)$ in $R$. The resulting finite $R_(frak(m))$-module $S_(frak(m))$ is nonzero, since it still contains $R_(frak(m))$. The zero fiber would give $S_(frak(m)) = frak(m) S_(frak(m))$. For a finite generating column $v$ this means $v = M v$ with all entries of $M$ in the maximal ideal. Multiplication by the adjugate of $I - M$ gives $det \( I - M \) v = 0$; its determinant is a unit, a contradiction.
  Find a nonzero member $h in I ∩ R$ by enumerating increasing degree cutoffs for monomial multiples of the generators of $I$. At each cutoff, rational linear algebra tests whether their span has a nonzero element involving only the first $m$ variables. This search terminates by the claim and the definition of an ideal. A nonzero constant certifies $I = \( 1 \)$. Otherwise let $d = deg h gt.eq 1$ and substitute
  $ x_i = y_i + y_m^(\( d + 1 \)^i) quad \( 1 lt.eq i < m \) \, #h(2em) x_m = y_m \, $
  leaving later variables unchanged. This change is invertible. The weights $1 \, \( d + 1 \) \, dots.h \, \( d + 1 \)^(m - 1)$ distinguish all monomials of total degree at most $d$ by base-$\( d + 1 \)$ expansion. Consequently the highest power of $y_m$ in the transformed $h$ has a nonzero rational leading coefficient: it comes from a unique monomial, taking the pure-power term in every substituted factor. Divide by that coefficient to obtain a monic relation in $y_m$. Earlier triangular relations remain monic in their respective later variables. Rename the variables and decrease $m$ by one. At most $a$ such decreases occur, proving termination. Every step uses finite rational arithmetic. Finally, the equation $u v = 1$ forces $u$ to be a unit in every output algebra, including one with zero divisors. ◻
]

Enumerate integer tuples $\( q \, b \, g \, h \)$ with $q \, b gt.eq 2$, $g gt.eq 0$, $h gt.eq 1$ and (6.1). For each tuple form polynomial equations for

#[#set math.equation(numbering: n => "(6.2)")
 $ A^(⊗ b) = M_0 Y M_1 Y dots.h.c Y M_g \, #h(2em) U = N_0 A N_1 A dots.h.c A N_h \, #h(2em) Y = A xor I_(q^b - q) . $ <syn:certificate>]

All embedded placements are absorbed into adjacent monomials. Include a matrix inverse witness for $A$. In a monomial slot write a variable permutation factor $P$ and a variable diagonal factor; impose $p_(i j)^2 = p_(i j)$ and row and column sums equal to $1$ on $P$, and give every diagonal entry an inverse witness. These are finite polynomial systems over $bb(Q)$. Apply Lemma 20 in a fixed enumeration order until one succeeds. Lemma 19 gives a complex solution for a tuple with $q = 2$ and $h = 3$, so success is guaranteed.

The entries $p_(i j)$ in the resulting $E$ may be nonscalar idempotents. Resolve them one at a time. For a current idempotent $p eq.not 0$, replace $E$ by the nonzero algebra $p E$ with unit $p$ and project every stored element by $z mapsto p z$; if $p = 0$, do nothing. This is a unital homomorphism onto the new algebra and makes the current idempotent equal to its unit. Previously resolved values remain $0$ or $1$. After finitely many rational table operations all permutation entries are $0$ or $1$, and their row and column sums give actual permutations. All identities, inverse witnesses, and diagonal units survive. Choose a rational basis of the final nonzero algebra beginning with $1_E$. We have thus computed fixed, fully specified data (6.2) over $E$.

#prodef([Remark 6.3.])[
  (Faithful scalar simulation).  If $d = dim_(bb(Q)) E$, then $E ⊗_(bb(Q)) bb(C)$ is the vector space $bb(C)^d$ with the computed multiplication table. The embedding $z mapsto z 1_E$ is injective. Addition is coordinatewise and multiplication by any prepared algebra element is a $d times d$ complex matrix, so each linear algebra operation costs $O \( d^2 \)$ ordinary scalar operations. When a circuit acts as $F_r$ times the algebra identity, embed its inputs as multiples of $1_E$ and read the first coordinate of each output. This is a faithful, constant-factor simulation; choosing a complex embedding or extracting algebraic roots is unnecessary. Here $d$ is fixed before the input length is known.
] <syn:simulation>

=== 6.2 A printer for increasingly efficient radices <a-printer-for-increasingly-efficient-radices>

We record why the fixed identities suffice for an effective circuit printer. The tensor amplification of #cite(label("exactfourier")) Lemma 2.3 also works over $E$: its proof uses only the identities and linear operations. Explicitly, put $Q = q^b$, $j = floor.l k \/ b floor.r$ and tensor the first word in (6.2) across $j$ groups. Every call slot decomposes, after reindexing, as

$ \( A xor I_(Q - q) \)^(⊗ j) tilde.equiv xor.big_(r = 0)^j \( A^(⊗ r) \)^(xor binom(j, r) \( Q - q \)^(j - r)) . $

Recurse on these smaller tensor orders and use direct calls on the fewer than $b$ remaining axes. Monomial scalings and copies cost linear size at each level. Let $f \( k \)$ be the size of this recursive construction divided by $q^k$. The total width of the sectors with $r$ active factors, divided by $Q^j$, is

$ frac(binom(j, r) \( Q - q \)^(j - r) q^r, Q^j) = binom(j, r) \( q \/ Q \)^r \( 1 - q \/ Q \)^(j - r) . $

Thus the normalized cost satisfies

$ f \( k \) lt.eq C_0 + g thin bb(E) f \( K \) \, #h(2em) K tilde.op "Bin" \( floor.l k \/ b floor.r \, q \/ Q \) . $

The distribution weights sectors by their dimensions. Since $g q \/ \( b Q \) < 1$, choose $0 < alpha < 1$ with $g \( q \/ \( b Q \) \)^alpha < 1$. Concavity and induction, using $bb(E) \( K + 1 \)^alpha lt.eq \( 1 + k q \/ \( b Q \) \)^alpha$, give

#[#set math.equation(numbering: n => "(6.3)")
 $ f \( k \) = O \( \( k + 1 \)^alpha \) . $ <syn:amplification>]

The strict inequality absorbs $C_0$ for large $k$; enlarge the inductive constant for the finite initial range. Neither $alpha$ nor that constant is needed by the printer.

For successive $t gt.eq 1$, let $r_1 < dots.h.c < r_t$ be the first $t$ primes greater than $2 q$, and put

$ m_t = product_(i = 1)^t r_i \, #h(2em) ell_t = m_t thin 2^(ceil.l log_2 \( 16 r_t \) ceil.r) \, #h(2em) R_t = bb(Q) \[ z \] \/ \( Phi_(ell_t) \( z \) \) . $

Cyclotomic polynomials and arithmetic in this finite algebra are effective: compute $Phi_s$ recursively from $z^s - 1 = product_(d divides s) Phi_d \( z \)$, and use polynomial division and the Euclidean algorithm. A polynomial is a unit modulo $Phi_s$ exactly when their gcd is $1$. The distinct roots of $Phi_s$ are the primitive $s$th roots, so identities in $R_t$ can be checked at all primitive specializations. Roots of orders dividing $ell_t$ are compatible powers of $z$. Carry out the next constructions over $E ⊗_(bb(Q)) R_t$, with the Fourier coefficients in the central factor $R_t$. The two certificate identities and their inverse witnesses persist under extension of scalars; in particular, every certified unit remains a unit.

Use the exact-width Fourier layer construction of Lemma 15 on each width $r_i$. It gives $O \( 1 + log^4 r_t \)$ monomial or disjoint shear layers. Its rational formulas hold in $R_t$: all denominators are nonzero at every primitive specialization, and the convolution root orders divide the indicated power of two. In particular the Newton denominators $product_(a = 1)^j \( 1 - u^a \)$ have $j < r_i$ for a primitive $r_i$th root $u$. The measured workspace test is a test on the integer circuit description and is unchanged by this scalar extension.

To substitute the second word of (6.2), split any shear coefficient $c in R_t$ into two units $d + \( c - d \)$, where $d$ is a positive integer chosen by testing $d = 1 \, 2 \, dots.h$ until $c - d$ is a unit. This terminates: only finitely many complex values of $c$ at the primitive roots can be positive integers. A shear with a unit coefficient $v$ is obtained by conjugating $U$ by $"diag" \( v \, 1 \, dots.h \, 1 \)$, so it has the fixed word pattern from (6.2). The resulting word restores the arbitrary values of its $q - 2$ spectator coordinates. Partition the disjoint pairs of an axis into at most $q$ batches of at most $floor.l r_i \/ q floor.r$ pairs; this is possible because $r_i > 2 q$ gives $q floor.l r_i \/ q floor.r gt.eq floor.l r_i \/ 2 floor.r$. Each batch fits disjoint $q$-tuples inside the same $r_i$ coordinates. Its spectators may belong to other pairs, since they are restored before the next batch.

Synchronize these fixed word patterns across axes, with identities in idle positions. Their product is the tensor of the local products by the tensor multiplication identity. Each monomial slot has linear size. Every other slot is a direct sum of $A^(⊗ k)$ with $k lt.eq t$ and total width $m_t$, so (6.3) bounds its size by $O \( m_t \( t + 1 \)^alpha \)$. Chinese remainder reindexing gives $F_(m_t)$ from the tensor of the local Fourier transforms. Now specialize $R_t$ by $z mapsto zeta_(ell_t)$, obtaining a circuit over $E ⊗_(bb(Q)) bb(C)$ whose output matrix is $F_(m_t)$ times the algebra identity. Expand only the fixed algebra $E$ by Remark 21. Its dimension contributes a constant factor, whereas $R_t$ has supplied polynomial expressions for the complex coefficients. The resulting complex linear circuit has size

#[#set math.equation(numbering: n => "(6.4)")
 $ s_t = O #scale(x: 120%, y: 120%)[\(] m_t \( t + 1 \)^alpha \( 1 + log^4 \( t + 2 \) \) #scale(x: 120%, y: 120%)[\)] = o \( m_t log m_t \) . $ <syn:radix-size>]

Here $r_t = O_q \( \( t + 1 \)^2 \)$, by the elementary prime estimate in Lemma 18, and $log m_t gt.eq t log 2$. The printer computes all tensor coefficients and all wiring explicitly. It may take any finite amount of bit computation to do so. Each coefficient is a polynomial with rational coefficients evaluated at $zeta_(ell_t)$; symbolic inverses have already been reduced in $R_t$. For each polynomial coefficient, print a finite Horner evaluation list, with its rational literals written explicitly; sharing previously computed values is optional. Thus the printed record contains a complete circuit and a fully expanded scalar preparation program, with no unspecified complex constants or hidden loops.

=== 6.3 From a slow printer to a fast uniform algorithm <from-a-slow-printer-to-a-fast-uniform-algorithm>

#thm([Theorem 6.4.])[
  (Bounded-printer uniformization).  #emph[Suppose a fixed bit machine prints a sequence of complete records $\( m_t \, C_t \)$ with strictly increasing $m_t arrow.r oo$, where $C_t$ computes $F_(m_t)$ by $s_t = o \( m_t log m_t \)$ scalar linear gates. Each record must explicitly list the gates, output indices, and a scalar preparation program with every instruction explicitly listed and executed once in order. Its instructions use rational literals, field operations with valid nonzero divisors, and canonical Fourier roots $zeta_a = exp \( 2 pi i \/ a \)$ of positive integer orders whose orders are written literally in binary. Then there is one deterministic algorithm computing every $F_n$ in $o \( n log n \)$ time, including preparation and indexing in the model of this paper. A single specified root of order less than $8 n^3$ suffices.]
] <syn:printer>

#proof[
  The printing budget will control both the circuit description and all literal scalar data, without requiring a bound on when a record appears. Normalize the printer to output at most one bit per machine step. For $n gt.eq 2$, run it from the beginning for $B = floor.l log_2 n floor.r$ bit steps. Select the last completed record with $2 lt.eq m_t lt.eq sqrt(B)$; if there is none, use the ordinary radix $m = 2$ circuit. Every fixed record eventually finishes and satisfies the width bound, so the selected stream index tends to infinity. In particular $m arrow.r oo$ and $s \/ \( m log m \) arrow.r 0$.
  The total visible description has at most $B$ bits. Decode the selected explicit lists to addressable arrays and evaluate its preparation program once. Construct rational literals by their binary expansions and perform each listed operation in the stated arithmetic model. This costs $B^(O \( 1 \))$, including parsing and bit simulation. The gate list then executes on each new input in $O \( m + s \)$ time, including entry and output copies. There is no expansion of a succinct circuit during its invocation.
  Put $X = 2 n - 1$, let $m^H$ be the largest power of $m$ not exceeding $X$, and set
  $ p = ceil.l X \/ m^H ceil.r \, #h(2em) P = m^H p . $
  Then $1 lt.eq p lt.eq m$, $X lt.eq P < 2 X < 4 n$, and $H lt.eq log \( 2 n \) \/ log m$. The mixed-radix Fourier recursion uses $H$ copies of radix $m$ and one radix $p$, the latter computed directly. For clarity, at a split $a b$ use input index $b j_a + j_b$ and output index $k_a + a k_b$. The identity
  $ \( b j_a + j_b \) \( k_a + a k_b \) equiv b j_a k_a + a j_b k_b + j_b k_a med \( mod med a b \) $
  gives the two smaller Fourier transforms and their intervening twiddle. At each level, copying subarrays into the required order, tabulating or reading twiddles, and enumerating the two indices cost linear work. Reuse the decoded radix circuit each time. Tabulate powers of $zeta_P$ in $O \( P \)$ operations; every recursive width divides $P$. Thus one transform, or its inverse by frequency reversal and scaling, costs
  #[#set math.equation(numbering: n => "(6.5)")
   $ O #scale(x: 120%, y: 120%)[\(] P \[ 1 + p + H \( 1 + s \/ m \) \] #scale(x: 120%, y: 120%)[\)] + B^(O \( 1 \)) . $ <syn:uniform-cost>]
  All indices and products of indices have polynomial bounds in $n$, so a constant number of $O \( log \( n + 2 \) \)$-bit words suffices per access.
  Finally reduce $F_n$ to convolution of length $P$. With $eta = zeta_(2 n)$, store $eta^(j^2) x_j$ for $0 lt.eq j < n$ and pad with zeros. The fixed kernel stores $eta^(- h^2)$ at the residues of $- \( n - 1 \) lt.eq h lt.eq n - 1$; these residues are distinct since $P gt.eq 2 n - 1$. Multiply convolution output $k$ by $eta^(k^2)$. The identity $k^2 + j^2 - \( k - j \)^2 = 2 k j$ gives exactly $F_n x$. Computing the fixed kernel’s transform, the variable transform and the inverse uses only a constant number of transforms bounded by (6.5), plus linear preparation and scaling work. The chirp scalars come from an $O \( n \)$-size table of powers of $eta$, indexed by the squared exponents modulo $2 n$.
  For the root accounting, let $R$ be the product of the root orders listed in the selected preparation program, or $1$ if there are none. Their total binary length is at most $B$, whence $R lt.eq 2^B lt.eq n$. The single root $zeta_D$, where $D = 2 n P R < 8 n^3$, supplies every listed root and the two outer roots by integer powering. There are at most $B$ such requests, and powering and forming their exponents cost $B^(O \( 1 \))$. This includes obtaining the required powers of the supplied root in the preparation bound.
  Since $p = O \( 1 + sqrt(log n) \)$, dividing the arithmetic term of (6.5) by $n log n$ gives
  $ O (frac(1 + p, log n) + frac(1, log m) + frac(s, m log m)) = o \( 1 \) . $
  The polynomial logarithmic preparation term is also $o \( n log n \)$. Length $1$ is the identity. This proves the claim, with all choices independent of the input values. ◻
]

Applying Theorem 22 to the printer above yields a uniform all-length $o \( n log n \)$ algorithm directly from the finite certificate interface. The symbolic search, finite algebra, and stored circuits are implementation devices; the only supplied complex primitive is the explicitly specified Fourier root. This conclusion complements the explicit quantitative construction of the main text.


#bibliography("refs.bib", style: "ieee", title: [References])
