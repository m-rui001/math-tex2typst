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

#align(center)[#text(size: 16pt, weight: "bold")[The periodic spin-one Haldane gap]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Haldane predicted that antiferromagnetic Heisenberg chains have different low-energy behavior for integer and half-odd-integer spins. The prediction was first formulated in 1981 and published in 1983 #cite(label("Haldane1981")) #cite(label("Haldane1983PRL")) #cite(label("Haldane1983PLA")). For spin one, the prediction is a positive gap above the ground energy. We prove this prediction for the pure bilinear model on even periodic rings, with explicit bounds uniform in the length.

Let $S^x \, S^y \, S^z in M_3 \( bb(C) \)$ be the self-adjoint irreducible spin-one matrices, normalized by

$ \[ S^alpha \, S^beta \] = i sum_eta epsilon_(alpha beta eta) S^eta \, #h(2em) sum_alpha \( S^alpha \)^2 = 2 I_3 . $

For each even integer $L gt.eq 4$, let $cal(H)_L = \( bb(C)^3 \)^(⊗ L)$ and define

#[#set math.equation(numbering: n => "(1.1)")
 $ H_L = sum_(j = 0)^(L - 1) sum_(alpha = x \, y \, z) S_j^alpha S_(j + 1)^alpha \, #h(2em) S_L^alpha = S_0^alpha . $ <eq:main-H>]

Here $S_j^alpha$ acts on site $j$ and is the identity on the other factors. The coupling constant is one. Write $E_0 \( L \)$ for the least energy and $E_1 \( L \)$ for the next #emph[distinct] energy of $H_L$, and set

#[#set math.equation(numbering: n => "(1.2)")
 $ gamma_L = E_1 \( L \) - E_0 \( L \) \, #h(2em) Delta_1 = liminf_(L arrow.r oo\
L upright(" even")) gamma_L . $ <eq:main-gap>]

These definitions concern the full spectrum, including the multiplicity of the ground energy. The next distinct energy exists: the all-zero and all-$+ 1$ product vectors in the $S^z$ basis have energy expectations $0$ and $L$, respectively, so $H_L$ is not scalar.

#thm([Theorem 1.1.])[
  #emph[For the Hamiltonians (1.1), the ground state is unique for every even $L gt.eq 60$, and 
#[#set math.equation(numbering: n => "(1.3)")
 $ gamma_L & > 4 / 105 log 80 / 79 &  & upright("for every even ") L gt.eq 60 \,\
gamma_L & > frac(log 20, 784) &  & upright("for every even ") L gt.eq 2304 . $ <eq:gap60>]

 Consequently 
$ Delta_1 gt.eq frac(log 20, 784) > 0 . $

 The spectral conclusions also hold for any simultaneously similar spin-one realization satisfying the same commutator and Casimir normalizations.]
] <thm:main>

Theorem 1 resolves the spin-one Haldane gap conjecture positively in the even-periodic finite-volume formulation $Delta_1 > 0$. It also implies $inf_(L gt.eq 4 \, thin L upright(" even")) gamma_L > 0$: each of the finitely many remaining finite-dimensional Hamiltonians has a positive gap above its full ground sector. This observation supplies neither a numerical value nor a simplicity assertion at those small lengths. Corollary 15 also gives the corresponding lower bound for local excitations in every subsequential thermodynamic limit of the periodic ground states of the self-adjoint model.

=== 1.1 Historical context <historical-context>

The half-odd-integer side has a rigorous antecedent in the low-energy excitation bound of Lieb, Schultz and Mattis for the cyclic spin-one-half chain #cite(label("LiebSchultzMattis1961")) Appendix B, Theorem 2. Affleck and Lieb extended this obstruction to the half-odd-integer antiferromagnetic chains they studied #cite(label("AffleckLieb1986")). The possible alternative of degenerate ground states is part of that obstruction. Integer spin permits a unique gapped state, but this distinction alone does not prove a gap for a particular interaction.

The Affleck–Kennedy–Lieb–Tasaki construction established a rigorous gapped spin-one chain with a biquadratic interaction #cite(label("AKLT1987")) #cite(label("AKLT1988")). Its bond interaction is $h + 1 / 3 h^2$, up to a scalar and normalization, where $h = upright(bold(S))_j dot.op upright(bold(S))_(j + 1)$. The Hamiltonian in (1.1) has bond interaction $h$ itself. Yarotsky proved that a unique ground state and a uniform periodic gap persist under sufficiently small translation-invariant finite-range perturbations of the AKLT interaction #cite(label("Yarotsky2006")) arXiv v1, Theorems 1 and 3. This controls a neighborhood of that interaction; it does not establish a gapped path to the pure bilinear point.

For the pure spin-one chain, White and Huse’s density-matrix renormalization-group study estimated a bulk gap of $0.41050 \( 2 \)$ and exhibited effective spin-one-half degrees of freedom at open ends #cite(label("WhiteHuse1993")). Neutron scattering provided experimental evidence in the nearly one-dimensional spin-one antiferromagnet $upright("CsNiCl")_3$ #cite(label("Buyers1986")). These results explain both the strong physical evidence for the prediction and the significance of boundary conditions. The uniform lower bounds below instead follow from the stated finite certificates and an analytic argument valid at every larger even length.

Batista and Ortiz proposed a spin–fermion proof of the Haldane gap #cite(label("BatistaOrtiz2001")). Their gap argument following Equation (8) of the preprint version uses a first-order perturbative identification with an XYZ chain; that step does not supply a uniform remainder estimate or a continuation to the original pairing coefficient. More recently, Tasaki established a nontrivial infinite-chain topological index for the spin-one Heisenberg model under a gap assumption for odd open chains with endpoint fields #cite(label("Tasaki2025")) arXiv v4, Assumption 2 and Theorem 3. The boundary hypotheses of that theorem require a separate argument from the even-periodic estimates proved here.

Finite-volume methods for uniform spectral gaps have a substantial history, including the criteria of Knabe and Nachtergaele for frustration-free chains, whose ground states minimize every local interaction #cite(label("Knabe1988")) #cite(label("Nachtergaele1996")). Gosset and Mozgunov obtained sharper finite-size thresholds within that frustration-free setting #cite(label("GossetMozgunov2016")). Recently, Banerjee, Guo and Chowdhury developed semidefinite bounds for string correlators using an enclosing ground-energy window, including finite periodic spin-one Heisenberg chains #cite(label("BanerjeeGuoChowdhury2026")) Equations (2), (13) and Figure 4. Those observable bounds concern a different quantity from the uniform spectral gap studied here. Our finite inputs are thermal traces of small twisted chains and variational energy estimates from periodic matrix-product vectors, in the tradition of finitely correlated states #cite(label("FNW1992")). The latter use the standard trace-of-matrix-products representation #cite(label("PerezGarcia2007")) Section 2.1; we give the particular integer matrices and all contractions explicitly.

The finite thermal inputs are rigorous enclosures of matrix-exponential traces. Validated matrix exponentiation has a long history, including self-validating Padé methods #cite(label("BochevMarkov1989")) and interval polynomial evaluation #cite(label("GoldsztejnNeumaier2014")). Our particular implementation uses a conditioned Poisson polynomial in a contraction. The factor-two conditioning estimate follows the coefficient argument of Fox and Glynn #cite(label("FoxGlynn1988")) Proposition 1. Explicit bounds for the integer evaluation and the final trace enclosure are supplied in the appendices.

=== 1.2 How the proof works <how-the-proof-works>

Quantum transfer-matrix methods relate partition functions to spatial moments #cite(label("Suzuki1985")). Our construction uses an ordered bond expansion of the type developed by Aizenman and Nachtergaele #cite(label("AizenmanNachtergaele1994")) arXiv v1, Section 2.2, followed by a direct operator construction on bond histories.

A shifted partition function is a sum of positive physical Boltzmann weights. We construct a self-adjoint spatial transfer operator whose $L$th moment is the same partition function. For even $L$, the spatial moment is also a sum of nonnegative weights. This gives two probability distributions associated with one partition function. The #emph[purity] of a distribution $\( p_i \)$ is $sum_i p_i^2$; purity close to one means that a single weight carries almost all of its mass.

Squaring and renormalizing a distribution reduces its purity defect quadratically once the defect is small. Squaring physical weights doubles inverse temperature, while squaring spatial weights doubles length. Exact cancellation identities couple these two improvements. Starting from two finite purity bounds, both defects then decay doubly exponentially as length and inverse temperature double together. Spatial moment inequalities cover every intermediate even length. Finally, purity of the full physical Gibbs distribution bounds each excited-to-ground probability ratio and hence the physical energy gap. Proposition 8 states this coupled argument as a general gap criterion. Its assumptions isolate a reusable criterion for other Hamiltonian families with the same two partition-function representations; positivity of the spatial transfer is not required.

There are two finite initializations. One starts the iteration at length $60$ and inverse temperature $105 \/ 4$. The other reaches length $2304$ and inverse temperature $784$ with a smaller purity defect, giving the stronger eventual bound. They share the transfer construction and the bootstrap, while using different thermal moments and two lengths of one matrix-product trial family. The finite computations involve integer arithmetic, rational interval bounds and explicit truncation errors; no floating-point eigenvalue estimate is a premise.

Section 2 fixes the model and proves its elementary energy bounds. Section 3 constructs the spatial transfer and its rotation sectors. Section 4 proves the common purity theorem, and Section 5 establishes the two finite initializations from explicitly stated thermal and trial inputs. Section 6 combines these results to prove Theorem 1. Appendices 7–9 prove the essential thermal and trial inputs, with exact data and reproducible finite procedures.

== 2 The Hamiltonian and its auxiliary twists <sec:model>

The argument uses the same partition function in two different ways: as a Gibbs trace in the physical Hilbert space and as a moment of a spatial operator. We first choose coordinates that make both descriptions explicit. We also establish an elementary energy bound used to control the finite exponential approximations.

=== 2.1 Spin coordinates <spin-coordinates>

We use the self-adjoint spin-one matrices. This convention does not restrict the spectrum in the formulation where self-adjointness is not assumed.

#thm([Lemma 2.1.])[
  (Choice of representation).  #emph[Let $S^x \, S^y \, S^z in M_3 \( bb(C) \)$ satisfy 
$ \[ S^alpha \, S^beta \] = i sum_gamma epsilon_(alpha beta gamma) S^gamma \, #h(2em) sum_alpha \( S^alpha \)^2 = 2 I . $

 They are simultaneously similar to the standard self-adjoint spin-one matrices. If the original matrices are self-adjoint, the similarity can be chosen unitary. The corresponding tensor-power similarity preserves the complete spectrum of every periodic Hamiltonian $H_n$.]
] <lem:representation>

#proof[
  Put $S^plus.minus = S^x plus.minus i S^y$. The assumptions give
  #[#set math.equation(numbering: n => "(2.1)")
   $ \[ S^z \, S^plus.minus \] = plus.minus S^plus.minus \, #h(2em) S^(-) S^(+) = 2 I - \( S^z \)^2 - S^z \, #h(2em) S^(+) S^(-) = 2 I - \( S^z \)^2 + S^z . $ <eq:ladder-identities>]
  Choose an $S^z$ eigenvector $v$ whose eigenvalue $m$ has maximal real part. Then $S^(+) v = 0$, since otherwise it has eigenvalue $m + 1$. Thus $m = 1$ or $m = - 2$. The latter case would permit indefinite nonzero lowering: a last nonzero lowered vector would have weight $- 2 - k$, whereas $S^(+) S^(-) w = 0$ forces its weight to be $- 1$ or $2$. This contradicts finite dimension. Hence $m = 1$.
  The vectors
  $ v \, #h(2em) frac(S^(-) v, sqrt(2)) \, #h(2em) frac(\( S^(-) \)^2 v, 2) $
  are nonzero by (2.1) and have distinct weights $1 \, 0 \, - 1$. They form a basis. There is no further lowered vector, because the basis has no weight $- 2$. The identities give raising and lowering coefficients $sqrt(2)$, so this is the standard spin-one representation. If the original matrices are self-adjoint and $∥∥ v = 1$, the three vectors are orthonormal. Finally, conjugating each tensor factor conjugates every term of $H_n$. ◻
]

In the weight basis $\| s chevron.r$, $s in { - 1 \, 0 \, 1 }$, the diagonal generator is $S^z \| s chevron.r = s \| s chevron.r$ and the nonzero ladder entries are $sqrt(2)$. We will also use the Cartesian basis, indexed by the three axes, in which

$ \( S^alpha \)_(i j) = - i epsilon_(alpha i j) \, #h(2em) G_alpha = i S^alpha . $

These matrices satisfy the same relations. Each $G_alpha$ is real and has operator norm one. For the two-site interaction $h = sum_alpha S^alpha ⊗ S^alpha$, contraction of the epsilon tensors gives

#[#set math.equation(numbering: n => "(2.2)")
 $ - h = sum_alpha G_alpha ⊗ G_alpha \, #h(2em) h = F - \| Omega chevron.r chevron.l Omega \| \, #h(2em) Omega = sum_(i = 1)^3 \| i i chevron.r \, $ <eq:cartesian-bond>]

where $F \( u ⊗ v \) = v ⊗ u$. In particular, $h$ has eigenvalues $- 2 \, - 1 \, 1$, and $h lt.eq I$.

=== 2.2 Twists and partition functions <twists-and-partition-functions>

Number the sites $0 \, dots.h \, n - 1$, with $n gt.eq 4$. A proper Cartesian rotation $g in S O \( 3 \)$ is unitary on $bb(C)^3$. Define

#[#set math.equation(numbering: n => "(2.3)")
 $ H_n \( g \) = sum_(j = 0)^(n - 2) h_(j \, j + 1) + h_(n - 1 \, 0) \( g \) \, #h(2em) h_(n - 1 \, 0) \( g \) = sum_alpha S_(n - 1)^alpha \( g S^alpha g^(- 1) \)_0 . $ <eq:twisted-hamiltonian>]

Thus only the last bond is conjugated, on its site-$0$ factor. The Hamiltonian is self-adjoint, and $H_n \( I \) = H_n$. Fix

#[#set math.equation(numbering: n => "(2.4)")
 $ a = 700741 / 500000 \, #h(2em) Z_n \( b \, g \) = "Tr" exp \[ - b \( H_n \( g \) + a n I \) \] \, #h(2em) Z_n \( b \) = Z_n \( b \, I \) quad \( b > 0 \) . $ <eq:shift>]

All these partition functions are strictly positive. The scalar shift will cancel from the purity ratios and from the final spectral gap. With this normalization, the trial bounds in Lemma 17 give $E_0 \( n \) + a n < 0$ at $n = 72 \, 120$, and hence $Z_n \( b \) > 1$ for every $b > 0$. These lower bounds are paired with finite thermal upper bounds in Section 5.

We need the diagonal rotations

$ P_x = "diag" \( 1 \, - 1 \, - 1 \) \, quad P_y = "diag" \( - 1 \, 1 \, - 1 \) \, quad P_z = "diag" \( - 1 \, - 1 \, 1 \) \, #h(2em) D_2 = { I \, P_x \, P_y \, P_z } \, $

and the cyclic rotation $C : e_x mapsto e_y mapsto e_z mapsto e_x$. Write $P = P_x$. The three nonidentity elements of $D_2$ have equal partition functions, by a global cyclic rotation of all sites. The rotation $C$ has angle $2 pi \/ 3$ about the diagonal axis. After a global rotation and a change to the weight basis, $P$ and $C$ are respectively represented by $exp \( - i theta S^z \)$ with $theta = pi$ and $theta = 2 pi \/ 3$.

For later comparison with finite matrices, a word $x = \( x_0 \, dots.h \, x_(n - 1) \)$ in the weight basis has diagonal entry $sum_j x_(j - 1) x_j$, with indices modulo $n$. Each permitted step changing two neighboring letters by opposite units has coefficient one. For a seam step from column $y$ to row $x$, this coefficient is

#[#set math.equation(numbering: n => "(2.5)")
 $ exp #scale(x: 120%, y: 120%)[\(] i theta \( y_0 - x_0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:seam-phase>]

Indeed $g S^plus.minus g^(- 1) = e^(minus.plus i theta) S^plus.minus$. These formulas identify the finite matrices used below with the physical Hamiltonians in (2.3).

=== 2.3 A uniform energy bound <a-uniform-energy-bound>

#thm([Lemma 2.2.])[
  (Energy bounds).  #emph[For every $n gt.eq 4$ and every $g in S O \( 3 \)$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ - frac(3 n, 2) I lt.eq H_n \( g \) lt.eq n I . $ <eq:energy-bounds>]

]
] <lem:energy>

#proof[
  The upper bound follows from $h lt.eq I$ and unitary conjugation of the seam. For the lower bound, consider $T = - h_12 - h_23$ on three open sites in Cartesian coordinates. By (2.2), an unequal pair swaps with coefficient $- 1$, and an equal pair changes to either of the other equal pairs with coefficient $1$. There are no diagonal terms.
  Assign a positive weight $q$ to each three-letter word. The following table lists every equality pattern; $a \, b \, c$ denote distinct letters. The last column sums the weights of the neighbors of a row word, with the absolute matrix coefficients.
  #[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[word type
], table.cell(rowspan: 1, colspan: 1)[$q$
], table.cell(rowspan: 1, colspan: 1)[absolute weighted row sum
]),
  table.cell(rowspan: 1, colspan: 1)[$a a a$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$3 + 3 + 3 + 3 = 12$
],
  table.cell(rowspan: 1, colspan: 1)[$a a b$ or $a b b$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$4 + 3 + 2 = 9$
],
  table.cell(rowspan: 1, colspan: 1)[$a b a$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$3 + 3 = 6$
],
  table.cell(rowspan: 1, colspan: 1)[$a b c$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2 + 2 = 4$
],
)
]
  Every row sum is at most $3 q$. If $D$ is the diagonal matrix of these weights, $D^(- 1) T D$ has absolute row sums at most three. Its spectral radius is therefore at most three. Since $T$ is self-adjoint and similar to this matrix, $h_12 + h_23 gt.eq - 3 I$.
  An open triad containing the seam is unitarily equivalent to an untwisted triad: delete the seam bond and rotate all sites in one of the two resulting components. The internal interaction of that component is rotation invariant. Thus the same lower bound holds for every consecutive pair of bonds in $H_n \( g \)$. Summing the $n$ triad inequalities counts each bond twice and proves (2.6). ◻
]

== 3 Partition functions as spatial moments <sec:transfer>

We now construct a self-adjoint spatial operator whose moments are the partition functions (2.4). This identity lets even spatial powers play the same role as positive Gibbs weights. The operator itself need not be positive.

Let $cal(G) subset S O \( 3 \)$ be the group of proper signed permutation matrices. It contains $D_2$ and $C$. For $g in cal(G)$, write

$ g e_alpha = epsilon.alt_g \( alpha \) e_(sigma_g \( alpha \)) \, #h(2em) epsilon.alt_g \( alpha \) in { - 1 \, 1 } . $

Rotation covariance of the Cartesian matrices gives

#[#set math.equation(numbering: n => "(3.1)")
 $ g G_alpha g^(- 1) = epsilon.alt_g \( alpha \) G_(sigma_g \( alpha \)) . $ <eq:rotation-covariance>]

#thm([Proposition 3.1.])[
  (Spatial transfer).  #emph[For each $b > 0$ there are a Hilbert space $cal(K)_b$, a compact self-adjoint operator $X_b$, and a unitary representation $g mapsto U_g$ of $cal(G)$ commuting with $X_b$, such that 
#[#set math.equation(numbering: n => "(3.2)")
 $ Z_n \( b \, g \) = "Tr" \( X_b^n U_g \) #h(2em) \( n gt.eq 4 \, med g in cal(G) \) . $ <eq:spatial-trace>]

 The operator $X_b$ and the representation commute with complex conjugation. Moreover $X_b$ is Hilbert–Schmidt, so $X_b^k$ is trace class for every integer $k gt.eq 2$. If $lambda_i \( b \)$ are its nonzero eigenvalues, counted with multiplicity, then 
#[#set math.equation(numbering: n => "(3.3)")
 $ sum_i \| lambda_i \( b \) \|^k < oo quad \( k gt.eq 2 \) \, #h(2em) Z_n \( b \) = sum_i lambda_i \( b \)^n quad \( n gt.eq 4 \) . $ <eq:spatial-moments>]

]
] <prop:transfer>

#proof[
  #emph[Histories and the kernel.] A bond history is a finite ordered list
  $ x = \( \( t_1 \, alpha_1 \) \, dots.h \, \( t_k \, alpha_k \) \) \, #h(2em) 0 < t_1 < dots.h.c < t_k < b \, quad alpha_j in { x \, y \, z } \, $
  including the empty list when $k = 0$. Let $Omega_b$ be the disjoint union of these labeled simplexes. Give each simplex Lebesgue measure and the empty history mass one. The resulting measure $mu$ is finite:
  #[#set math.equation(numbering: n => "(3.4)")
   $ mu \( Omega_b \) = sum_(k = 0)^oo frac(3^k b^k, k !) = e^(3 b) . $ <eq:history-mass>]
  Set $cal(K)_b = L^2 \( Omega_b \, mu \; bb(C) \)$.
  For two histories $x \, y$, merge their labeled times in increasing order and define $k_b \( x \, y \)$ as the trace of the resulting product of the matrices $G_alpha$, with increasing time from left to right. A nonempty time collision is a null event; set the kernel to zero there. The product for two empty histories is the identity, so its trace is three.
  The kernel is real and has absolute value at most three, since $∥G_alpha∥ = 1$. Exchanging $x$ and $y$ leaves their merged chronological list unchanged. Hence $k_b \( x \, y \) = k_b \( y \, x \)$; no reversal of the matrix product occurs. Its integral operator $K_b$ is therefore self-adjoint and Hilbert–Schmidt, with
  $ ∥K_b∥_(upright("HS"))^2 lt.eq 9 mu \( Omega_b \)^2 = 9 e^(6 b) . $
  Define $X_b = e^(- a b) K_b$. Compact self-adjoint spectral theory gives real, square-summable eigenvalues. Since they are bounded, all their absolute moments of integer order at least two are summable. This proves the operator assertions about $X_b$.
  #emph[Rotations.] The permutation $sigma_g$ acts on the labels of a history, preserving its times and the measure. Put
  $ s_g \( x \) = product_(alpha upright(" in ") x) epsilon.alt_g \( alpha \) \, #h(2em) \( U_g f \) \( x \) = s_g \( sigma_g^(- 1) x \) f \( sigma_g^(- 1) x \) . $
  The rule $s_(g h) \( x \) = s_g \( sigma_h x \) s_h \( x \)$ proves that these real unitaries form a representation. Simultaneously rotating every matrix inside a site trace, using (3.1), gives
  $ k_b \( sigma_g x \, sigma_g y \) = s_g \( x \) s_g \( y \) k_b \( x \, y \) . $
  It follows that $U_g$ commutes with $K_b$ and $X_b$. In particular the kernel of $K_b U_g$ is
  #[#set math.equation(numbering: n => "(3.5)")
   $ \( K_b U_g \) \( x \, y \) = k_b \( x \, sigma_g y \) s_g \( y \) . $ <eq:twisted-kernel>]
  #emph[The cycle trace.] For $n gt.eq 2$, both $K_b^(n - 1)$ and $K_b U_g$ are Hilbert–Schmidt. The kernel of $K_b^(n - 1)$ is the iterated kernel obtained by integration; it is bounded because $k_b$ is bounded and $mu$ is finite. The Hilbert–Schmidt product trace identity
  $ "Tr" \( A B \) = integral a \( x \, y \) b \( y \, x \) thin d mu \( x \) thin d mu \( y \) $
  and (3.5) consequently give
  #[#set math.equation(numbering: n => "(3.6)")
   $ "Tr" \( K_b^n U_g \) = integral_(Omega_b^n) (product_(j = 0)^(n - 2) k_b \( x_j \, x_(j + 1) \)) k_b \( x_(n - 1) \, sigma_g x_0 \) s_g \( x_0 \) thin d mu^n . $ <eq:cycle-integral>]
  The product trace identity follows from the Hilbert–Schmidt inner product formula and Cauchy–Schwarz. All the iterated kernel integrals here are absolutely integrable. Thus (3.6) does not require a diagonal-kernel formula for $K_b$ itself.
  #emph[Identification with the physical partition function.] The ordered bond expansion is a standard representation of spin partition functions #cite(label("AizenmanNachtergaele1994")) arXiv v1, Section 2.2, Equations (2.10)–(2.12). We verify it here with the required seam and normalization. Expand $exp \[ - b H_n \( g \) \]$ in its ordered-time series. By (2.2), each event chooses a bond and one of three labels, and inserts the corresponding two $G$ factors. At the seam the site-$0$ factor is rotated as in (3.1). There are $\( 3 n \)^k$ choices at total degree $k$; each tensor operator has norm at most one. The sum of the absolute traced contributions is bounded by
  #[#set math.equation(numbering: n => "(3.7)")
   $ 3^n sum_(k = 0)^oo frac(\( 3 n b \)^k, k !) = 3^n e^(3 n b) . $ <eq:history-absolute>]
  We may therefore regroup all terms and integrals by bond. The interleavings of the bond histories partition the global time simplex up to null collisions. At each site, the tensor trace is the kernel on the two incident histories, in their original chronological order.
  For an explicit check of the seam, call its history $e_0$ and enumerate the remaining bond histories $e_1 \, dots.h \, e_(n - 1)$ around the ring. The physical integrand is
  $ s_g \( e_0 \) k_b \( sigma_g e_0 \, e_1 \) k_b \( e_1 \, e_2 \) dots.h.c k_b \( e_(n - 1) \, e_0 \) . $
  In (3.6), set $x_0 = e_0 \, x_1 = e_(n - 1) \, dots.h \, x_(n - 1) = e_1$ and use kernel symmetry. This gives exactly the displayed integrand, with $g$ on site $0$. The spatial enumeration has been reversed; the chronological products have not. Thus $"Tr" e^(- b H_n \( g \)) = "Tr" \( K_b^n U_g \)$. Multiplication by $e^(- a b n)$ proves (3.2). The ordinary trace formula for a compact self-adjoint operator now gives (3.3). ◻
]

For an even $n gt.eq 4$, Proposition 4 supplies the probabilities

#[#set math.equation(numbering: n => "(3.8)")
 $ p_i = frac(\| lambda_i \( b \) \|^n, Z_n \( b \)) \, #h(2em) sum_i p_i = 1 \, #h(2em) sum_i p_i^2 = frac(Z_(2 n) \( b \), Z_n \( b \)^2) . $ <eq:spatial-probabilities>]

Odd moments will also be useful in polynomial estimates, but evenness is essential in (3.8). These spatial eigenvalues are distinct objects from the physical energies of $H_n$.

=== 3.1 Rotation sectors <rotation-sectors>

The small twisted partition functions separate the spatial eigenvalues into a few lists. Their multiplicities will help isolate a dominant weight; no restriction on the physical spectrum is imposed.

#thm([Lemma 3.2.])[
  (Sector moments).  #emph[Fix $b > 0$ and let $X_b \, U_g$ be as in Proposition 4. There are real eigenvalue lists, counted with multiplicity, whose integer moments $I_k \, O_k \, N_k$ converge absolutely for $k gt.eq 2$, with 
#[#set math.equation(numbering: n => "(3.9)")
 $ Z_n \( b \) & = I_n + 2 O_n + 3 N_n \,\
Z_n \( b \, P \) & = I_n + 2 O_n - N_n \,\
Z_n \( b \, C \) & = I_n - O_n #h(2em) \( n gt.eq 4 \) . $ <eq:sector-total>]

 The $I$ list is the restriction to the joint invariant subspace of $D_2$ and $C$. The $O$ list occurs twice and the $N$ list three times in the full eigenvalue list of $X_b$. All three moments are nonnegative at even orders. If $J_n$ denotes the moment on the $D_2$-invariant subspace, then 
$ J_n = I_n + 2 O_n . $

]
] <lem:sectors>

#proof[
  The four characters $chi$ of $D_2$ define orthogonal projections
  $ Pi_chi = 1 / 4 sum_(g in D_2) chi \( g \) U_g . $
  They commute with $X_b$ and sum to the identity. Conjugation by $U_C$ permutes the three nontrivial character spaces cyclically. The restrictions of $X_b$ to these spaces are therefore unitarily equivalent; denote their common moment by $N_k$.
  In the trivial-character space, split further according to the eigenvalues $1 \, omega \, overline(omega)$ of $U_C$, where $omega = e^(2 pi i \/ 3)$. These are reducing subspaces for $X_b$. Complex conjugation exchanges the last two spaces and preserves every real eigenvalue of $X_b$, with multiplicity. Their common moment is $O_k$; the moment on the first space is $I_k$. Absolute convergence follows from (3.3).
  This orthogonal decomposition proves (3.9). On the three nontrivial character spaces, a fixed $U_P$ has signs $+ 1 \, - 1 \, - 1$, while it is the identity on the trivial-character space. This gives (3.9). The operator $U_C$ permutes the nontrivial spaces, so they contribute zero to $"Tr" \( X_b^n U_C \)$. On the remaining three spaces its coefficients are $1 \, omega \, overline(omega)$, and $omega + overline(omega) = - 1$. This proves (3.9). The identity for $J_n$ follows from the decomposition of the trivial-character space; even powers give nonnegativity. ◻
]

The invariant $I$ space need not be one-dimensional. The point of Lemma 5 is that every weight outside it occurs at least twice in the full list. Later moment bounds will identify a unique largest weight without discarding any sector.

== 4 From two purities to a uniform gap <sec:bootstrap>

The spatial and physical descriptions of the same partition function give two ways to concentrate its weights. This section isolates the argument that propagates two initial concentration estimates to all larger even lengths. The initial estimates are established in Section 5.

By Proposition 4, each partition function is both a physical Gibbs trace and, at even lengths, a nonnegative spatial moment. The former counts every physical eigenvector, with multiplicity; the latter counts the absolute powers of every spatial eigenvalue. These two representations give the two probability distributions used below.

For even $n gt.eq 4$, define the spatial and physical purities

#[#set math.equation(numbering: n => "(4.1)")
 $ S \( n \, b \) = frac(Z_(2 n) \( b \), Z_n \( b \)^2) \, #h(2em) T \( n \, b \) = frac(Z_n \( 2 b \), Z_n \( b \)^2) . $ <eq:purities>]

The energy shift $a L$ cancels from both ratios. We first record the elementary inequality responsible for their improvement under squaring.

#thm([Lemma 4.1.])[
  (Squaring probabilities).  #emph[Let $\( w_i \)$ be a finite or countable family of nonnegative numbers with $sum_i w_i = 1$. Its purity $P = sum_i w_i^2$ lies in $\( 0 \, 1 \]$. The normalized squares $w_i^2 \/ P$ have purity $P'$ satisfying 
#[#set math.equation(numbering: n => "(4.2)")
 $ 1 - P' lt.eq f \( 1 - P \) \, #h(2em) f \( u \) = frac(u^2, 2 \( 1 - u \)^2) quad \( 0 lt.eq u < 1 \) . $ <eq:purity-square>]

 The function $f$ is increasing. Consequently 
#[#set math.equation(numbering: n => "(4.3)")
 $ 0 < S \( n \, b \) \, T \( n \, b \) & lt.eq 1 \,\
1 - S \( 2 n \, b \) & lt.eq f \( 1 - S \( n \, b \) \) \,\
1 - T \( n \, 2 b \) & lt.eq f \( 1 - T \( n \, b \) \) . $ <eq:two-squarings>]

]
] <lem:purity>

#proof[
  At least one weight is positive, so $P > 0$, and $w_i^2 lt.eq w_i$ gives $P lt.eq 1$. Nonnegativity permits rearrangement of all countable sums. Thus
  $ 1 - P' = frac(2 sum_(i < j) w_i^2 w_j^2, P^2) lt.eq frac(2 #scale(x: 120%, y: 120%)[\(] sum_(i < j) w_i w_j #scale(x: 120%, y: 120%)[\)]^2, P^2) = frac(\( 1 - P \)^2, 2 P^2) . $
  Also $f' \( u \) = u \/ \( 1 - u \)^3 gt.eq 0$.
  For $S \( n \, b \)$, use the spatial probabilities $\| lambda_i \( b \) \|^n \/ Z_n \( b \)$ from (3.8). Squaring them changes $n$ to $2 n$. For $T \( n \, b \)$, list all physical eigenvalues $epsilon_k \( n \)$ with multiplicity and use
  #[#set math.equation(numbering: n => "(4.4)")
   $ w_k \( n \, b \) = frac(e^(- b \( epsilon_k \( n \) + a n \)), Z_n \( b \)) . $ <eq:gibbs-weights>]
  Their purity is $T \( n \, b \)$, and squaring them changes $b$ to $2 b$. This proves (4.3). ◻
]

=== 4.1 The coupled update <the-coupled-update>

The two purities constrain one another because their definitions use the same partition functions. Direct cancellation gives

#[#set math.equation(numbering: n => "(4.5)")
 $ S \( n \, 2 b \) & = S \( n \, b \)^2 frac(T \( 2 n \, b \), T \( n \, b \)^2) \,\
T \( 4 n \, b \) & = T \( 2 n \, b \)^2 frac(S \( 2 n \, 2 b \), S \( 2 n \, b \)^2) . $ <eq:space-time-cancel>]

Both denominators are at most one. The following form allows the initial bounds to have different sizes and to be rounded upward.

#thm([Lemma 4.2.])[
  (Coupled update).  #emph[Suppose $n gt.eq 4$ is even, $b > 0$, and $p \, q in \[ 0 \, 1 \)$ satisfy 
$ 1 - S \( n \, b \) lt.eq p \, #h(2em) 1 - T \( 2 n \, b \) lt.eq q . $

 If $p_(+) \, q_(+) in \[ 0 \, 1 \)$ obey 
#[#set math.equation(numbering: n => "(4.6)")
 $ p_(+) & gt.eq f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - p \)^2 \( 1 - q \) #scale(x: 120%, y: 120%)[\)] \,\
q_(+) & gt.eq f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - q \)^2 \( 1 - p_(+) \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:rounded-update>]

 then 
$ 1 - S \( 2 n \, 2 b \) lt.eq p_(+) \, #h(2em) 1 - T \( 4 n \, 2 b \) lt.eq q_(+) . $

]
] <lem:rounded-update>

#proof[
  Equation (4.5) gives $S \( n \, 2 b \) gt.eq \( 1 - p \)^2 \( 1 - q \)$. Applying spatial squaring in Lemma 6 and monotonicity of $f$ proves the first bound. Next (4.5) gives $T \( 4 n \, b \) gt.eq \( 1 - q \)^2 \( 1 - p_(+) \)$. Temporal squaring proves the second. Every input of $f$ is in $\[ 0 \, 1 \)$ because the product subtracted from one is positive and at most one. ◻
]

In particular, one may round the first output upward before using it in the second update, then round the second output upward. The pair based at $\( n \, b \)$ becomes a pair based at $\( 2 n \, 2 b \)$: its physical member is at length $4 n$. No decrease of the individual bounds is needed for this step.

=== 4.2 Quadratic decay and intermediate lengths <quadratic-decay-and-intermediate-lengths>

Once both defects are small, one common bound suffices. Put

#[#set math.equation(numbering: n => "(4.7)")
 $ G \( u \) = 1 / 2 (\( 1 - u \)^(- 1) + \( 1 - u \)^(- 2) + \( 1 - u \)^(- 3))^2 . $ <eq:bootstrap-coefficient>]

This function is increasing on $\[ 0 \, 1 \)$, and

#[#set math.equation(numbering: n => "(4.8)")
 $ f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - u \)^3 #scale(x: 120%, y: 120%)[\)] = G \( u \) u^2 . $ <eq:bootstrap-factorization>]

#thm([Proposition 4.3.])[
  (Uniform gap from two initial purities).  #emph[For every even $L gt.eq 4$, let $H_L$ be a non-scalar finite-dimensional self-adjoint Hamiltonian. Suppose that $a in bb(R)$ and, for each $b > 0$, a real finite or countable list $\( lambda_i \( b \) \)$ satisfy 
$ sum_i \| lambda_i \( b \) \|^4 < oo \, #h(2em) Z_L \( b \) := "Tr" e^(- b \( H_L + a L I \)) = sum_i \| lambda_i \( b \) \|^L quad \( L gt.eq 4 upright(" even") \) . $

 Define $S \, T$ by (4.1) and $G$ by (4.7). Let $n_0 gt.eq 4$ be even, $b_0 > 0$, and let $u_0 \, C$ satisfy 
#[#set math.equation(numbering: n => "(4.9)")
 $ 0 < u_0 < 1 / 6 \, #h(2em) G \( u_0 \) lt.eq C \, #h(2em) r := C u_0 < 1 \, #h(2em) C \( 1 - 3 u_0 \) > 3 . $ <eq:bootstrap-hypotheses>]

 Suppose 
#[#set math.equation(numbering: n => "(4.10)")
 $ S \( n_0 \, b_0 \) gt.eq 1 - u_0 \, #h(2em) T \( 2 n_0 \, b_0 \) gt.eq 1 - u_0 . $ <eq:bootstrap-seeds>]

 For $j gt.eq 0$, set 
#[#set math.equation(numbering: n => "(4.11)")
 $ n_j = 2^j n_0 \, #h(2em) b_j = 2^j b_0 \, #h(2em) u_j = C^(- 1) r^(2^j) . $ <eq:dyadic-parameters>]

 Then 
#[#set math.equation(numbering: n => "(4.12)")
 $ S \( n_j \, b_j \) gt.eq 1 - u_j \, #h(2em) T \( 2 n_j \, b_j \) gt.eq 1 - u_j . $ <eq:dyadic-purities>]

 For every even $L gt.eq n_0$, the physical ground state is unique, and the gap above it satisfies 
#[#set math.equation(numbering: n => "(4.13)")
 $ gamma_L > frac(log \( 1 \/ r \), b_0) . $ <eq:bootstrap-gap>]

]
] <prop:bootstrap>

#proof[
  #emph[Doubling.] The definition gives $u_(j + 1) = C u_j^2$ and $0 < u_(j + 1) < u_j lt.eq u_0$. Suppose both defects at $\( n_j \, b_j \)$ are at most $u = u_j$. The first bound in Lemma 7 is at most
  $ f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - u \)^3 #scale(x: 120%, y: 120%)[\)] = G \( u \) u^2 lt.eq C u^2 = u_(j + 1) lt.eq u . $
  Use $p_(+) = u_(j + 1)$ in the second update. Its input is at most $1 - \( 1 - u \)^3$, so its output is also at most $C u^2 = u_(j + 1)$. Induction proves (4.12).
  #emph[Intermediate even lengths.] For any nonnegative list $\( a_i \)$ with finite positive $p$th-power sum and $q gt.eq p > 0$, normalization gives
  $ sum_i a_i^q lt.eq (sum_i a_i^p)^(q \/ p) . $
  Indeed the normalized $p$th powers are probabilities, whose $\( q \/ p \)$th powers sum to at most one. Apply this to the absolute spatial eigenvalues at each of the two temperatures. Whenever $n lt.eq L lt.eq 2 n$ and both lengths are even,
  $ Z_L \( b \) lt.eq Z_n \( b \)^(L \/ n) \, #h(2em) Z_L \( 2 b \) gt.eq Z_(2 n) \( 2 b \)^(L \/ \( 2 n \)) . $
  Combining them yields the interpolation inequality
  #[#set math.equation(numbering: n => "(4.14)")
   $ T \( L \, b \) gt.eq [T \( 2 n \, b \) S \( n \, b \)^2]^(L \/ \( 2 n \)) . $ <eq:purity-interpolation>]
  The bracket lies in $\( 0 \, 1 \]$ and the exponent lies in $\[ 1 \/ 2 \, 1 \]$. For $n = n_j$ and $b = b_j$, we therefore have
  #[#set math.equation(numbering: n => "(4.15)")
   $ T \( L \, b_j \) gt.eq \( 1 - u_j \)^3 gt.eq 1 - 3 u_j > 1 / 2 #h(2em) \( n_j lt.eq L lt.eq 2 n_j \, med L upright(" even") \) . $ <eq:intermediate-purity>]
  #emph[The physical spectrum.] The largest weight in (4.4) is at least its purity, since $sum_k w_k^2 lt.eq \( max_k w_k \) sum_k w_k$. It is consequently greater than $1 \/ 2$. These weights count all physical eigenvectors; two ground-state eigenvectors would have two equal maximal weights, which is impossible. Thus the ground state is unique.
  Because $H_L$ is non-scalar and self-adjoint in finite dimension, a next distinct energy exists. Let $w_0$ be the ground-state weight and let $w_1$ be the weight of an eigenvector at that next energy. Then
  #[#set math.equation(numbering: n => "(4.16)")
   $ e^(- b_j gamma_L) & = w_1 / w_0 lt.eq frac(1 - w_0, w_0) lt.eq frac(3 u_j, 1 - 3 u_j)\
 & lt.eq frac(3, C \( 1 - 3 u_0 \)) r^(2^j) < r^(2^j) . $ <eq:gap-ratio>]
  Here the shift $a L$ cancels, and the final strict inequality follows from (4.9). Taking logarithms and using $b_j = 2^j b_0$ proves (4.13) throughout the interval $n_j lt.eq L lt.eq 2 n_j$. These dyadic intervals cover every even $L gt.eq n_0$. ◻
]

Figure 1 summarizes the two operations in the proof: doubling advances the pair of purity estimates, and interpolation fills the interval of physical lengths controlled at each temperature.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.4, -0.55), (7.2, -0.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.2, -0.55), [#text(size: 9pt)[$L$]], anchor: "west", padding: 0.1176cm)
  line((-0.4, -0.55), (-0.4, 2.65), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-0.4, 2.65), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.5), (0, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.6), [#text(size: 9pt)[$n_0$]], anchor: "north", padding: 0.1176cm)
  line((2.2, -0.5), (2.2, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.2, -0.6), [#text(size: 9pt)[$2n_0$]], anchor: "north", padding: 0.1176cm)
  line((4.4, -0.5), (4.4, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.4, -0.6), [#text(size: 9pt)[$4n_0$]], anchor: "north", padding: 0.1176cm)
  line((6.6, -0.5), (6.6, -0.6), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.6, -0.6), [#text(size: 9pt)[$8n_0$]], anchor: "north", padding: 0.1176cm)
  content((-0.4, 0), [#text(size: 9pt)[$b_0$]], anchor: "east", padding: 0.1176cm)
  content((-0.4, 1), [#text(size: 9pt)[$2b_0$]], anchor: "east", padding: 0.1176cm)
  content((-0.4, 2), [#text(size: 9pt)[$4b_0$]], anchor: "east", padding: 0.1176cm)
  line((0, 0), (2.2, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((2.2, 1), (4.4, 1), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((4.4, 2), (6.6, 2), stroke: (thickness: 1.2pt, miter-limit: 10))
  circle((0, 0), radius: 0.05644, fill: black, stroke: none)
  circle((2.2, 1), radius: 0.05644, fill: black, stroke: none)
  circle((4.4, 2), radius: 0.05644, fill: black, stroke: none)
  line((0.12, 0.08), (2.08, 0.92), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  line((2.32, 1.08), (4.28, 1.92), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((1.1, 0), [#text(size: 9pt)[interpolate]], anchor: "north", padding: 0.1176cm)
  content((3.3, 1), [#text(size: 9pt)[interpolate]], anchor: "north", padding: 0.1176cm)
  content((5.5, 2), [#text(size: 9pt)[interpolate]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The bootstrap, shown schematically at three dyadic scales. Dashed arrows double the starting length and inverse temperature. At each scale, interpolation controls the physical purity for every even length on the solid interval. The intervals cover all larger even lengths. ],
) <fig:bootstrap>

=== 4.3 The two parameter choices <the-two-parameter-choices>

We will establish the initial inequalities (4.10) for the following two rows:

#[#set math.equation(numbering: n => "(4.17)")
 $ n_0 & b_0 & u_0 & C & r = C u_0\
60 & 105 \/ 4 & 1 \/ 8 & 79 \/ 10 & 79 \/ 80\
2304 & 784 & 1 \/ 100 & 5 & 1 \/ 20 $ <eq:bootstrap-parameters>]

The scalar hypotheses of Proposition 8 can already be checked. For the first row,

$ G \( 1 \/ 8 \) = 913952 / 117649 < 79 / 10 \, #h(2em) frac(3, C \( 1 - 3 u_0 \)) = 48 / 79 < 1 . $

For the second, $1 - \( 1 - u \)^3 lt.eq 3 u$ gives, when $0 < u lt.eq 1 \/ 100$,

$ G \( u \) lt.eq frac(9, 2 \( 1 - 3 u \)^2) lt.eq 45000 / 9409 < 5 \, #h(2em) frac(3, C \( 1 - 3 u_0 \)) = 60 / 97 < 1 . $

Thus the two rows give respectively the bounds $\( 4 \/ 105 \) log \( 80 \/ 79 \)$ and $\( log 20 \) \/ 784$ in (4.13), once their initial purities are proved. The second row will follow from six applications of Lemma 7 to bounds based at $\( 36 \, 49 \/ 4 \)$. The remaining task is therefore finite: establish the two sets of initial inequalities without losing the margins needed in these updates.

== 5 Two finite initializations <sec:initialization>

The doubling argument requires a spatial purity at length $n$ and a physical purity at length $2 n$, at the same inverse temperature. We establish two such pairs. The first begins at length $60$; the second begins at length $2304$ and gives the stronger eventual gap. In both cases the inputs are a few short-chain partition functions and one periodic trial vector. This section explains how those finite inputs imply the required purities.

=== 5.1 Thermal data and elementary moment bounds <thermal-data-and-elementary-moment-bounds>

We use the sectors from Lemma 5: $J_n = I_n + 2 O_n$ is the $D_2$-invariant moment, $I_n$ is the moment fixed also by the cyclic rotation, and $N_n$ is the moment in one nontrivial $D_2$ sector. Each $O_n$ occurs twice and each $N_n$ occurs three times in the full trace. In particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ J_n & = frac(Z_n + 3 Z_n \( P \), 4) \, & N_n & = frac(Z_n - Z_n \( P \), 4) \,\
I_n & = frac(Z_n + 3 Z_n \( P \) + 8 Z_n \( C \), 12) \, & O_n & = frac(Z_n + 3 Z_n \( P \) - 4 Z_n \( C \), 12) . $ <eq:sector-inversion>]

The inverse temperature is common to every term of each identity.

#thm([Lemma 5.1.])[
  (Finite thermal inputs).  #emph[For $a = 700741 \/ 500000$, the following tables give centers for the shifted partition functions $Z_n \( b \, g \)$ in units $10^(- 6)$. The absolute errors are less than $10^(- 5)$ at $b = 21 \/ 2$ and less than $30 dot.op 10^(- 6)$ at $b = 49 \/ 4$. 
$ & b = 21 \/ 2 & \
n & g = 1 & g = P & g = C\
6 & 8945303 & 346734 & 939987\
8 & 3741281 & 567167 & 984108\
10 & 2327547 & 721090 & 1002613 #h(2em)  & b = 49 \/ 4 & \
n & g = 1 & g = P\
4 & 124885379 & 65757\
5 & 2925 & 2960742\
6 & 12870614 & 286599\
7 & 54069 & 1920414\
8 & 4639283 & 510140\
9 & 195455 & 1514846\
10 & 2654823 & 675419\
11 & 377629 & 1314544\
12 & 1900547 & 787405 $

]
] <lem:thermal-inputs>

Appendices 7 and 8 prove the respective tables by rational approximations to the physical matrix exponentials, with explicit error bounds. Lemma 17 supplies the other finite input:

#[#set math.equation(numbering: n => "(5.2)")
 $ E_0 \( 72 \) < - 72 a \, #h(2em) E_0 \( 120 \) < - 120 a . $ <eq:trial-thermal-consequence>]

Consequently $Z_72 \( b \) > 1$ and $Z_120 \( b \) > 1$ for every $b > 0$: in each case one Boltzmann factor already exceeds one.

Here are two elementary ways to extract spectral information from the tables.

#thm([Lemma 5.2.])[
  (Capped masses).  #emph[Let $\( t_i \)$ be a finite or countable family with $0 lt.eq t_i lt.eq h$ and $sum_i t_i lt.eq m$, where $h > 0$ and $m gt.eq 0$. For $r gt.eq 1$, put 
#[#set math.equation(numbering: n => "(5.3)")
 $ cal(C) \( m \, h \, r \) = q h^r + \( m - q h \)^r \, #h(2em) q = floor.l m \/ h floor.r . $ <eq:capped-function>]

 Then $sum_i t_i^r lt.eq cal(C) \( m \, h \, r \)$. Without the individual cap, $sum_i t_i^r lt.eq m^r$.]
] <lem:cappedmass>

#proof[
  For a finite family at fixed total mass, transfer mass from the smaller of two coordinates in $\( 0 \, h \)$ to the larger until one reaches $0$ or $h$. Convexity shows that the sum of $r$th powers does not decrease. Repetition leaves at most one coordinate in $\( 0 \, h \)$, giving (5.3) at the actual total mass. That expression is continuous and nondecreasing in the total mass, so it is bounded by its value at $m$. Apply this argument to finite subfamilies and take their increasing union for a countable family. The uncapped assertion follows directly from $t_i^r lt.eq t_i \( sum_j t_j \)^(r - 1)$ when the total mass is positive; the zero case is immediate. ◻
]

#thm([Lemma 5.3.])[
  (Polynomial filter).  #emph[Let $epsilon.alt gt.eq 0$, $v > 0$, and let $\( lambda_i \)$ be a real eigenvalue list with moments $M_j = sum_i lambda_i^j$, and suppose $\| M_j - c_j \| lt.eq epsilon.alt$ for the indices occurring in a polynomial $F \( x \) = sum_j f_j x^j$. Assume these moments converge absolutely and $F gt.eq 0$ on $bb(R)$. If 
$ B = sum_j f_j c_j + epsilon.alt sum_j \| f_j \| quad upright("and") quad F \( x \) > B med upright("for ") \| x \| gt.eq v \, $

 then every $\| lambda_i \| < v$.]
] <lem:polynomial-filter>

#proof[
  Absolute convergence gives $sum_i F \( lambda_i \) lt.eq B$. Since every summand is nonnegative, one eigenvalue with $\| lambda_i \| gt.eq v$ would contradict this bound. ◻
]

All moments used below converge absolutely by Proposition 4. The coefficient sums in (5.1) are at most one in absolute value, so the thermal error bound also bounds each sector-moment error. This observation includes the odd moments used in the second initialization; their signs are retained in the polynomial filter.

=== 5.2 The initialization at length sixty <the-initialization-at-length-sixty>

#thm([Proposition 5.4.])[
  #emph[At inverse temperature $b = 105 \/ 4$, 
$ S \( 60 \, b \) > 7 / 8 \, #h(2em) T \( 120 \, b \) > 7 / 8 . $

]
] <prop:seed60>

#proof[
  We first bound sector moments and then increase the inverse temperature. The trial energy forces a dominant spatial weight, giving the spatial purity; its physical Boltzmann factor will give the physical purity separately.
  Begin at the lower inverse temperature $b_0 = 21 \/ 2$. From the $b_0 = 21 \/ 2$ table in Lemma 9 and (5.1), upper bounds for $I_10 \, O_10 \, N_10$ are, respectively,
  $ m_I = 1042655 / 10^6 \, #h(2em) m_O = 40041 / 10^6 \, #h(2em) m_N = 401625 / 10^6 . $
  For clarity, their margins over the sector centers plus $10^(- 5)$ are $19 \/ \( 12 dot.op 10^6 \)$, $7 \/ \( 12 dot.op 10^6 \)$ and $3 \/ \( 4 dot.op 10^6 \)$.
  Apply Lemma 11 to
  $ F_I \( x \) = x^6 \( - 2 + 10 x^2 \)^2 \, #h(2em) F_N \( x \) = x^6 \( - 25 + 100 x^2 \)^2 . $
  For a filter $x^6 \( c_0 + c_1 x^2 \)^2$, its summed upper bound is the centered combination of moments $6 \, 8 \, 10$ with coefficients $c_0^2 \, 2 c_0 c_1 \, c_1^2$, plus $10^(- 5) \( \| c_0 \| + \| c_1 \| \)^2$. Direct rational evaluation gives
  $ \| lambda \| < U := 100245 / 100000 quad upright("in ") I \, #h(2em) \| lambda \| < V := 88643 / 100000 quad upright("in ") N . $
  Indeed the filter value at the indicated endpoint exceeds its summed upper bound by more than $0.0301$ for $I$ and $0.3463$ for $N$. Each filter is strictly increasing with $\| x \|$ beyond its endpoint: there $c_1 > 0$ and $c_0 + c_1 x^2 > 0$.
  The rational inequalities $U^10 < m_I < 2 U^10$ and $V^10 < m_N < 2 V^10$ allow the two-piece form of Lemma 10. For $k = 30 \, 120$ define
  $ A_k = U^k + \( m_I - U^10 \)^(k \/ 10) \, #h(2em) B_k = m_O^(k \/ 10) \, #h(2em) C_k = V^k + \( m_N - V^10 \)^(k \/ 10) . $
  They bound $I_k \, O_k \, N_k$, respectively. Because these are even moments, all are nonnegative, and hence
  #[#set math.equation(numbering: n => "(5.4)")
   $ Z_k \( b_0 \) lt.eq A_k + 2 B_k + 3 C_k \, #h(2em) Z_k \( b_0 \, P \) \, med Z_k \( b_0 \, C \) lt.eq A_k + 2 B_k . $ <eq:short-moment-upper>]
  Put $m = A_30 + 2 B_30 + 3 C_30$, $p = A_30 + 2 B_30$, and $q = A_120 + 2 B_120 + 3 C_120$. With
  $ D = 1450 / 1000 \, quad E = 1202 / 1000 \, quad tau = 1225 / 1000 \, quad tau_0 = 1264 / 1000 \, quad R_q = 684 / 10000 \, $
  the remaining scalar estimates are
  #[#set math.equation(numbering: n => "(5.5)")
   $ m^5 < D^2 \, #h(2em) p^5 < E^2 \, #h(2em) q gt.eq 1 \, #h(2em) \( q - 1 \)^5 < R_q^2 \,\
frac(D + 11 E, 12) lt.eq tau \, #h(2em) frac(D + 3 E, 4) lt.eq tau_0 . $ <eq:seed60-scalars>]
  For example, the positive margins in the first, second and fourth strict inequalities exceed $0.001068$, $0.000433$ and $0.0000472$, respectively. Every number in these comparisons is rational and is specified above.
  We now increase the inverse temperature from $b_0$ to $b = \( 5 \/ 2 \) b_0$. For positive Boltzmann factors $z_i$, $sum_i z_i^(5 \/ 2) lt.eq \( sum_i z_i \)^(5 \/ 2)$. Thus (5.4)–(5.5) imply
  $ Z_30 \( b \) lt.eq D \, #h(2em) Z_30 \( b \, P \) \, Z_30 \( b \, C \) lt.eq E . $
  By (5.1), the $I$ and $J$ portions of the thirtieth spatial moment are at most $tau$ and $tau_0$.
  Let $w_i = \| lambda_i \( X_b \) \|^30$. Then $sum_i w_i lt.eq D$, whereas (5.2) gives $sum_i w_i^4 = Z_120 \( b \) > 1$. Since $D \( 0.88 \)^3 < 1$, some weight $w_0 > 0.88$ exists. It is unique because $2 \( 0.88 \) > D$. It belongs to $I$: a weight in $O$ would occur at least twice, and one in $N$ at least three times. These statements count all multiplicities, including equal moduli of opposite-sign spatial eigenvalues.
  To sharpen the lower bound on $w_0$, suppose $0 lt.eq t lt.eq 0.998$ and $w_0 gt.eq t$. Denote the remaining $I$ mass by $x$, the full $O$-pair mass by $y$, and the full $N$-triple mass by $z$. Their squared weights sum to at most $x^2 + y^2 \/ 2 + z^2 \/ 3$, and
  $ 0 lt.eq x lt.eq tau - t \, #h(2em) 0 lt.eq y \, #h(2em) x + y lt.eq tau_0 - t \, #h(2em) z lt.eq D - t - x - y . $
  The divisors $2$ and $3$ use the identical weight lists in the repeated sectors. Since $D > tau_0$, the last upper bound is nonnegative on the entire displayed polygon. The convex quadratic $x^2 + y^2 \/ 2 + \( D - t - x - y \)^2 \/ 3$ has its maximum at one of its four vertices. Write
  #[#set math.equation(numbering: n => "(5.6)")
   $ R \( t \) = max_(\( x \, y \) in cal(V)_t) (x^2 + y^2 / 2 + frac(\( D - t - x - y \)^2, 3)) \, $ <eq:residual-R>]
  where
  $ cal(V)_t = { \( 0 \, 0 \) \, \( tau - t \, 0 \) \, \( tau - t \, tau_0 - tau \) \, \( 0 \, tau_0 - t \) } . $
  Thus the remaining squared weights sum to at most $R \( t \)$, and their fourth powers sum to at most $R \( t \)^2$. Exact evaluation gives
  $ t & 0.88 & 0.99 & 0.998\
R \( t \) & 0.1359 & 0.0721 & 0.068404 $
  and
  $ 1 - 0.99^4 - R \( 0.88 \)^2 = 0.02093518 \, #h(2em) 1 - 0.998^4 - R \( 0.99 \)^2 = 0.002777621984 . $
  If $w_0 lt.eq 0.99$, the first equality would contradict $sum_i w_i^4 > 1$; the second then excludes $w_0 lt.eq 0.998$. Keeping the dominant contribution in the fourth moment yields
  $ S \( 60 \, b \) = frac(sum_i w_i^4, \( sum_i w_i^2 \)^2) gt.eq (1 + frac(R \( 0.998 \), 0.998^2))^(- 2) > 0.8756 > 7 / 8 . $
  For the physical purity at length $120$, return briefly to temperature $b_0$. Its largest Boltzmann factor $z_0$ exceeds one by the trial bound, while the sum of all factors is at most $q$. After raising the factors to the power $5 \/ 2$, the ratio of the remaining mass to $z_0^(5 \/ 2)$ is at most $\( q - 1 \)^(5 \/ 2) < R_q$. Therefore
  $ T \( 120 \, b \) gt.eq \( 1 + R_q \)^(- 2) > 0.8760 > 7 / 8 . $
  This last step concerns physical Boltzmann factors, separately from the spatial weights used to bound $S$. ◻
]

=== 5.3 The initialization giving the stronger gap <the-initialization-giving-the-stronger-gap>

#thm([Proposition 5.5.])[
  #emph[At inverse temperature $b = 784$, 
$ 1 - S \( 2304 \, b \) lt.eq 84513 / 10^7 < 1 / 100 \, #h(2em) 1 - T \( 4608 \, b \) lt.eq frac(27493, 5 dot.op 10^6) < 1 / 100 . $

]
] <prop:seed2304>

#proof[
  We isolate one large eigenvalue in $J$ and bound the remaining moments. This gives a pair of initial purity defects at length $36$; six rounded updates then reach length $2304$.
  Begin at $b_0 = 49 \/ 4$. The $b_0 = 49 \/ 4$ table gives centers for $J_n \, N_n$ through (5.1), with error at most $epsilon.alt = 30 dot.op 10^(- 6)$. Use the two filters
  $ F_J \( x \) = x^4 \( 7 + 17 x - 280 x^2 - 185 x^3 + 1000 x^4 \)^2 \, #h(2em) F_N \( x \) = x^4 \( 12 - 394 x^2 + 1000 x^4 \)^2 . $
  Their degree is $12$, so the table supplies every required moment. The summed upper bounds in Lemma 11 are exactly
  $ B_J = 318604.54848175 \, #h(2em) B_N = 48169.880699 . $
  Set $v_J = 100139 \/ 100000$ and $v_N = 872 \/ 1000$. Direct rational comparisons give
  $ F_J \( v_J \) - B_J > 180 \, quad F_J \( - v_J \) - B_J > 496888 \, quad F_N \( plus.minus v_N \) - B_N > 654 . $
  To check the whole exterior rays without further numerical tests, write $Q \( x \) = 7 + 17 x - 280 x^2 - 185 x^3 + 1000 x^4$. For $y gt.eq 0$,
  $ Q \( 1 + y \) & = 559 + 2902 y + 5165 y^2 + 3815 y^3 + 1000 y^4 \,\
Q \( - 1 - y \) & = 895 + 3978 y + 6275 y^2 + 4185 y^3 + 1000 y^4 . $
  Both are positive and increasing. The polynomial $12 - 394 r^2 + 1000 r^4$ is likewise positive and increasing for $r gt.eq v_N$: its value at $v_N$ is positive and its derivative is $4 r \( 1000 r^2 - 197 \) > 0$. Thus the filters increase along the requisite rays, and every eigenvalue has modulus less than $v_J$ in $J$ and less than $v_N$ in $N$.
  The twelfth-moment upper bounds are
  $ m_J = 1.0657205 \, #h(2em) m_N = 0.2783155 . $
  Put $ell = 999 \/ 1000$ and, for $k = 36 \, 72$, define
  #[#set math.equation(numbering: n => "(5.7)")
   $ B \( k \) = 3 cal(C) \( m_N \, v_N^12 \, k \/ 12 \) \, #h(2em) R_A \( k \) = B \( k \) + \( m_J - ell^12 \)^(k \/ 12) . $ <eq:seed72-tail>]
  Here $m_J > ell^12$. If all eigenvalues in $J$ had modulus at most $ell$, Lemma 10 would imply
  $ Z_72 \( b_0 \) lt.eq cal(C) \( m_J \, ell^12 \, 6 \) + B \( 72 \) < 1 \, $
  where the strict margin to one exceeds $0.0693$. The trial inequality contradicts this. Choose an eigenvalue $lambda_0$ in $J$ with $\| lambda_0 \| > ell$. Removing it leaves a twelfth-moment mass at most $m_J - ell^12$ in $J$. The uncapped bound of Lemma 10 and the three $N$ sectors show that $R_A \( k \)$ bounds the remaining full $k$th moment.
  It follows that
  #[#set math.equation(numbering: n => "(5.8)")
   $ 1 - S \( 36 \, b_0 \) & lt.eq p_0 := 1 - (1 + frac(R_A \( 36 \), ell^36))^(- 2) \,\
1 - T \( 72 \, b_0 \) & lt.eq q_0 := 1 - (v_J^72 + R_A \( 72 \))^(- 2) . $ <eq:seed72-pq>]
  For the first estimate retain $lambda_0^72$ in the numerator; for the second use $Z_72 \( 2 b_0 \) > 1$ and $Z_72 \( b_0 \) lt.eq v_J^72 + R_A \( 72 \)$. Numerically $p_0 < 0.047916$ and $q_0 < 0.181521$, but the following updates use their exact rational definitions in (5.7)–(5.8).
  Apply Lemma 7 six times, rounding each new defect upward to a multiple of $10^(- 7)$ and using the rounded spatial defect in the physical update. For completeness, with $f \( u \) = u^2 \/ \[ 2 \( 1 - u \)^2 \]$ and $ceil.l x ceil.r_7 = 10^(- 7) ceil.l 10^7 x ceil.r$, the scalar updates are
  $ p_(j + 1) = ⌈f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - p_j \)^2 \( 1 - q_j \) #scale(x: 120%, y: 120%)[\)]⌉_7 \, #h(2em) q_(j + 1) = ⌈f #scale(x: 120%, y: 120%)[\(] 1 - \( 1 - q_j \)^2 \( 1 - p_(j + 1) \) #scale(x: 120%, y: 120%)[\)]⌉_7 . $
  Exact rational evaluation gives
  $ j & p_j & q_j\
1 & 151249 \/ 2500000 & 433453 \/ 2500000\
2 & 343303 \/ 5000000 & 1632381 \/ 10000000\
3 & 44601 \/ 625000 & 361773 \/ 2500000\
4 & 632939 \/ 10000000 & 1055161 \/ 10000000\
5 & 375793 \/ 10000000 & 445941 \/ 10000000\
6 & 84513 \/ 10000000 & 27493 \/ 5000000 $
  Every update is in $\[ 0 \, 1 \)$, where $f$ is increasing, so the upward rounding preserves valid bounds. Both the length and inverse temperature have multiplied by $2^6$: $36 dot.op 64 = 2304$ and $\( 49 \/ 4 \) dot.op 64 = 784$. The last row proves the proposition. ◻
]

=== 5.4 A periodic interface for boundary estimates <a-periodic-interface-for-boundary-estimates>

The boundary-field companion #cite(label("BoundaryCompanion")) uses the intermediate spatial information in the preceding proof, rather than only the final periodic gap. We state that information separately so that its hypotheses and finite inputs can be invoked together.

#thm([Corollary 5.6.])[
  (Periodic inputs for boundary estimates).  #emph[Let $X_b$ be the spatial transfer operator of Proposition 4, with the shift $a = 700741 \/ 500000$, and put 
$ b_0 = 49 \/ 4 \, #h(2em) b_1 = 49 \/ 2 \,\
ell = 999 \/ 1000 \, #h(2em) U = 100139 \/ 100000 \, #h(2em) V = 872 \/ 1000 \,\
m_J = 1.0657205 \, #h(2em) m_N = .2783155 . $

 At $b = b_0$, the full eigenvalue list, counted with multiplicity, is the $D_2$-invariant list $J$ together with three identical lists $N$. Every eigenvalue in $J$ has modulus less than $U$, and the sum of the twelfth powers of all eigenvalues in $J$ is at most $m_J$. Every eigenvalue in each $N$ list has modulus less than $V$, and that list’s twelfth powers sum to at most $m_N$. There is an eigenvalue in $J$ whose modulus exceeds $ell$. Moreover, 
$ 1 - S \( 72 \, b_1 \) lt.eq 151249 / 2500000 . $

 For $n = 72$ and $n = 120$, one has $E_0 \( n \) + n a < 0$; hence a physical ground Boltzmann factor in $Z_n \( b \)$ exceeds one for every $b > 0$.]
] <cor:boundary-inputs>

#proof[
  The decomposition is Lemma 5, with $J = I + 2 O$. The filters, twelfth-moment bounds and dominant eigenvalue are proved at the start of the proof of Proposition 13. The first row of its rounded update table gives the displayed bound at $\( 72 \, 49 \/ 2 \)$. The variational assertion is Lemma 17. ◻
]

== 6 Proof of the gap theorem <sec:assembly>

We now assemble the two initializations through the same purity theorem. The thermal and trial inputs used in Section 5 are proved in Appendices 7–9. Those finite proofs are part of the argument.

#proof[
  Proposition 4 identifies the physical partition functions with moments of the self-adjoint spatial transfer operator. They therefore satisfy the hypotheses used to define both purities in Section 4. The Hamiltonians are self-adjoint and non-scalar, as noted after (1.2).
  Proposition 12 supplies
  $ S \( 60 \, 105 \/ 4 \) > 7 \/ 8 \, #h(2em) T \( 120 \, 105 \/ 4 \) > 7 \/ 8 . $
  Apply Proposition 8 with
  $ \( n_0 \, b_0 \, u_0 \, C \) = \( 60 \, 105 \/ 4 \, 1 \/ 8 \, 79 \/ 10 \) . $
  Its parameter inequalities are verified in Section 4, and $C u_0 = 79 \/ 80$. It follows that the ground state is unique and $gamma_L > 4 / 105 log \( 80 \/ 79 \)$ for every even $L gt.eq 60$.
  Proposition 13 supplies both purity defects at most $1 \/ 100$ at the pair based at $\( n_0 \, b_0 \) = \( 2304 \, 784 \)$. Apply the same theorem with $u_0 = 1 \/ 100$ and $C = 5$. Since $C u_0 = 1 \/ 20$, it gives $gamma_L > log \( 20 \) \/ 784$ for every even $L gt.eq 2304$. Taking the limit inferior over even lengths proves the stated bound on $Delta_1$. Finally, Lemma 2 transfers the spectral conclusions to the other spin-one matrix realization by simultaneous similarity and its tensor powers. ◻
]

=== 6.1 An infinite-volume consequence <an-infinite-volume-consequence>

The finite-volume estimate also controls local excitations in a thermodynamic limit. We use the standard limiting argument recalled in #cite(label("Tasaki2025")) arXiv v4, End Matter, Definition 11 and Theorem 12. A local operator on the spin chain $bb(Z)$ acts nontrivially on only finitely many sites. A state $omega$ is a linear functional on these operators with $omega \( I \) = 1$ and $omega \( A^(*) A \) gt.eq 0$ for every local operator $A$. Define the local commutator

$ \[ H \, A \] = sum_(j in bb(Z)) \[ upright(bold(S))_j dot.op upright(bold(S))_(j + 1) \, A \] . $

Only finitely many summands are nonzero.

#thm([Corollary 6.1.])[
  #emph[For the self-adjoint Hamiltonians (1.1), the normalized ground states of the even periodic rings have a subsequence, as $L arrow.r oo$, converging on every local operator to a state $omega$. Every such limit satisfies 
#[#set math.equation(numbering: n => "(6.1)")
 $ omega \( A^(*) \[ H \, A \] \) gt.eq frac(log 20, 784) #scale(x: 120%, y: 120%)[\(] omega \( A^(*) A \) - \| omega \( A \) \|^2 #scale(x: 120%, y: 120%)[\)] $ <eq:local-limit-gap>]

 for every local operator $A$.]
] <cor:local-limit>

#proof[
  Place the ring of even length $L$ on ${ - L \/ 2 \, dots.h \, L \/ 2 - 1 }$, with its closing bond at the endpoints. Compactness of the density matrices on each finite interval and a diagonal subsequence give convergence on all local operators. The compatible limits define a positive normalized functional $omega$. For $L gt.eq 2304$, Theorem 1 gives a unique ground state, with normalized vector $psi_L$, and a gap greater than $delta = log \( 20 \) \/ 784$. Writing $omega_L \( A \) = chevron.l psi_L \, A psi_L chevron.r$, the spectral inequality on the orthogonal complement of $psi_L$ gives
  $ omega_L \( A^(*) \[ H_L \, A \] \) gt.eq delta #scale(x: 120%, y: 120%)[\(] omega_L \( A^(*) A \) - \| omega_L \( A \) \|^2 #scale(x: 120%, y: 120%)[\)] . $
  For fixed local $A$ and sufficiently large $L$, the closing bond commutes with $A$ and $\[ H_L \, A \] = \[ H \, A \]$. Passing to the local limit proves the claim. ◻
]

In particular, $omega$ is a ground state: no local perturbation lowers its energy. For $omega \( A \) = 0$, inequality (6.1) is the locally unique gapped property of #cite(label("Tasaki2025")) arXiv v4, Definition 11, with gap at least $log \( 20 \) \/ 784$. The argument does not identify the limits of different subsequences or establish uniqueness among all infinite-volume ground states.

== 7 Thermal calculation at inverse temperature $21 \/ 2$ <sec:thermal120>

We prove the $b = 21 \/ 2$ table in Lemma 9. The calculation uses the actual physical Hamiltonians at lengths $n = 6 \, 8 \, 10$, with twists $1 \, P \, C$. All arithmetic below is integral or rational; in the cyclic case complex numbers are represented in $bb(Z) \[ omega \]$, where $omega = e^(2 pi i \/ 3)$.

=== 7.1 The finite matrices and their columns <the-finite-matrices-and-their-columns>

Fix $b = 21 \/ 2$ and one of these lengths, and write $H = H_n \( g \)$. After the global rotations in Section 2, the three twists have angles $theta = 0 \, pi \, 2 pi \/ 3$ about the weight-basis axis. Set

#[#set math.equation(numbering: n => "(7.1)")
 $ W = I - frac(H_n \( g \) + \( 3 n \/ 2 \) I, 16) \, #h(2em) B = 16 W . $ <eq:thermal120-matrices>]

Lemma 3 gives $∥∥ W lt.eq 1$ and $∥∥ B lt.eq 16$. In a fixed total-weight sector, the rows and columns are words $x in { - 1 \, 0 \, 1 }^n$ with fixed $sum_j x_j$. The diagonal of $B$ is

$ B_(x \, x) = 16 - frac(3 n, 2) - sum_(j = 0)^(n - 1) x_(j - 1) x_j . $

For each $j$, put $k = j + 1 med \( mod med n \)$. If $y_j = x_j - delta$, $y_k = x_k + delta$, $delta in { - 1 \, 1 }$, and all letters remain in ${ - 1 \, 0 \, 1 }$, the corresponding entry is $- 1$, except at $j = n - 1 \, k = 0$, where it is $- e^(i theta delta)$. This is exactly the physical seam phase in (2.5). For the cyclic twist its action on a coordinate $u + v omega$ uses

#[#set math.equation(numbering: n => "(7.2)")
 $ - omega \( u + v omega \) = v + \( v - u \) omega \, #h(2em) - omega^(- 1) \( u + v omega \) = \( u - v \) + u omega . $ <eq:thermal120-phases>]

Thus matrix-vector multiplication requires only integer additions and multiplications in both coordinates.

Only some columns need to be computed. To justify the reduction, let $s \( x \) = \( x_(n - 1) \, x_0 \, dots.h \, x_(n - 2) \)$. The seam formula gives

$ H_(s \( x \) \, s \( y \)) = e^(i theta \( y_(n - 1) - x_(n - 1) \)) H_(x \, y) . $

Consequently the monomial unitary $\| x chevron.r mapsto e^(- i theta x_(n - 1)) \| s \( x \) chevron.r$ commutes with $H$. Reversal of the word takes $H$ to its complex conjugate, as does negation of every letter. Composing either permutation with complex conjugation gives an antiunitary symmetry. Each of these symmetries preserves the norm of the corresponding column of any real exponential of $H$.

In every sector of nonnegative total weight, select the lexicographically least word in each orbit under rotations and reversal. Give it the orbit size as its multiplicity, doubled for strictly positive total weight to include the opposite sector. The multiplicities then sum to $3^n$ and reproduce the full Frobenius norm of the exact exponential. No symmetry of the rounded columns is required: we compare each computed representative with its own exact column and repeat that comparison with the same multiplicity.

=== 7.2 A rational polynomial and its error <a-rational-polynomial-and-its-error>

Write

$ E = e^(84 \( W - I \)) = e^(- \( b \/ 2 \) \( H_n \( g \) + \( 3 n \/ 2 \) I \)) \, #h(2em) x_n = \( 3 \/ 2 - a \) b n . $

The desired trace is

#[#set math.equation(numbering: n => "(7.3)")
 $ Z_n \( b \, g \) = e^(x_n) ∥E∥_F^2 \, $ <eq:thermal120-frobenius>]

where $∥dot.op∥_F$ is the Frobenius norm. For $0 lt.eq j lt.eq J = 256$, define the rational probabilities

#[#set math.equation(numbering: n => "(7.4)")
 $ p_j = frac(84^j \/ j !, sum_(l = 0)^256 84^l \/ l !) \, #h(2em) P \( W \) = sum_(j = 0)^256 p_j W^j . $ <eq:thermal120-probabilities>]

These are Poisson probabilities of mean $84$, conditioned on values at most $256$. For a Poisson variable $V$ with that mean,

$ Pr \( V > 256 \) lt.eq frac(bb(E) \( 2^V \), 2^257) = e^84 / 2^257 < 27^28 / 2^257 < 2^(- 117) . $

The conditioning estimate is the coefficient argument of Fox–Glynn #cite(label("FoxGlynn1988")) Proposition 1, applied here to powers of a contraction. Since $∥W^j∥ lt.eq 1$, conditioning changes the operator average by at most twice this probability. Hence

#[#set math.equation(numbering: n => "(7.5)")
 $ ∥P \( W \) - E∥ < 2^(- 116) . $ <eq:thermal120-poisson-error>]

Put $Q = 2^56$ and $q_j = floor.l Q p_j floor.r$. For a representative column $r$, start at zero and apply, for $j = 256 \, dots.h \, 0$,

#[#set math.equation(numbering: n => "(7.6)")
 $ z arrow.l "fl" \( B z \/ 16 \) + q_j e_r . $ <eq:thermal120-horner>]

For real coordinates, $"fl"$ is the ordinary floor; for $u + v omega$ it floors $u$ and $v$ separately. The ideal suffix at step $j$ is $Q sum_(l = j)^256 p_l W^(l - j) e_r$, whose norm is at most $Q$. In a sector of dimension $d_0$, the Euclidean norm of the error from a coordinatewise floor is less than $2 sqrt(d_0)$, and the coefficient floor adds at most one. Contraction of $W$ therefore bounds the error at every stage by

#[#set math.equation(numbering: n => "(7.7)")
 $ 257 \( 2 sqrt(3^n) + 1 \) lt.eq 125159 . $ <eq:thermal120-column-error>]

The zero coefficients above $q_172$ may be omitted: the computed vector is still zero there, and (7.7) continues to count all $257$ possible rounding steps.

The norm of the repeated computed-column list, divided by $Q$ and multiplied by $e^(x_n \/ 2)$, differs from $sqrt(Z_n \( b \, g \))$ by at most

#[#set math.equation(numbering: n => "(7.8)")
 $ e^(x_n \/ 2) sqrt(3^n) (frac(257 \( 2 sqrt(3^n) + 1 \), Q) + 2^(- 116)) < 4 dot.op 10^(- 7) . $ <eq:thermal120-scaled-error>]

Indeed $sqrt(3^n) lt.eq 243$, $x_n \/ 2 < 6$, and $e^(x_n \/ 2) < 3^6$. The resulting rational upper bound $3^6 thin 243 \( 125159 \/ 2^56 + 2^(- 116) \)$ is less than $4 dot.op 10^(- 7)$. This comparison includes both polynomial truncation and integer rounding.

=== 7.3 Exact evaluation by packed integers <exact-evaluation-by-packed-integers>

For efficiency, the calculation performs (7.6) on batches of at most $192$ columns. A list of signed integer digits $y_0 \, dots.h \, y_(w - 1)$ is stored as

$ "pack" \( y \) = sum_(t = 0)^(w - 1) y_t 2^(64 t) . $

Integer linear arithmetic preserves this identity before the floor, even if intermediate carries occur. Arbitrary-precision integers are used throughout.

Here is why the floor can also be performed on the packed integer. For either coefficient of $u + v omega$,

$ \| u \| \, \| v \| lt.eq 2 / sqrt(3) \| u + v omega \| lt.eq 2 \| u + v omega \| . $

By (7.7), every computed column has norm at most $Q + 125159$. Thus every coordinate of $B z$, in either integer component, has magnitude at most

#[#set math.equation(numbering: n => "(7.9)")
 $ 32 \( Q + 125159 \) = 2305843009217699040 < 2^63 . $ <eq:thermal120-lane-bound>]

Let $s_w = sum_(t = 0)^(w - 1) 2^(64 t)$ and define

$ upright("bias") = 2^63 s_w \, #h(2em) upright("mask") = \( 2^60 - 1 \) s_w \, #h(2em) upright(b i a s 16) = 2^59 s_w . $

For $Y = "pack" \( y \)$ satisfying (7.9), the operation

$ mono("(((Y+bias)>")  mono(">4)&mask)-bias16") $

equals $"pack" \( \( floor.l y_t \/ 16 floor.r \)_(t = 0)^(w - 1) \)$. To see this, adding the bias makes every base-$2^64$ digit lie in $\[ 0 \, 2^64 \)$. The global right shift moves four low bits from each higher lane into the four high bits of the preceding lane. The mask deletes precisely those crossing bits, retaining $floor.l \( y_t + 2^63 \) \/ 16 floor.r$ in lane $t$. Subtracting $2^59$ then gives $floor.l y_t \/ 16 floor.r$, also for negative $y_t$. This proves by induction that the packed recurrence is exactly (7.6).

The final coordinates satisfy the smaller bound $2 \( Q + 125159 \) < 2^63$, so biasing and unpacking recovers every integer coordinate exactly. If a final coordinate is $u + v omega$, its squared modulus is $u^2 - u v + v^2$. Summing these integers with the representative multiplicities gives an integer $t_(n \, g)$, the squared norm of the full repeated-column list in $Q$-units.

=== 7.4 The exact totals and trace enclosures <the-exact-totals-and-trace-enclosures>

Integer evaluation of the recurrence gives the following totals. The accompanying computation implements the matrix entries, representatives and packed operations specified above.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (center, center, left,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$g$
], table.cell(rowspan: 1, colspan: 1)[$t_(n \, g)$
]),
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[93637037510293158533967385845216
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$P$
], table.cell(rowspan: 1, colspan: 1)[3629519998654831111446492683663
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[$C$
], table.cell(rowspan: 1, colspan: 1)[9839536903588146388838689926305
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[4947327904487991279560670127283
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$P$
], table.cell(rowspan: 1, colspan: 1)[749999795795292705866802820621
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$C$
], table.cell(rowspan: 1, colspan: 1)[1301346729026243689610427021457
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[388818111664728958208623998490
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$P$
], table.cell(rowspan: 1, colspan: 1)[120458568770462253326886628639
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$C$
], table.cell(rowspan: 1, colspan: 1)[167487042402286114495695779656
],
)
]

To enclose the scalar factor, put

$ L_n = sum_(j = 0)^100 frac(x_n^j, j !) \, #h(2em) U_n = L_n + 2 frac(x_n^101, 101 !) . $

Since $0 < x_n < 12$ and successive terms after the first omitted term have ratio at most $x_n \/ 102 < 1 \/ 2$, we have $L_n < e^(x_n) < U_n$. For each center $c_(n \, g)$ in the $b = 21 \/ 2$ table of Lemma 9, exact rational comparison gives

#[#set math.equation(numbering: n => "(7.10)")
 $ c_(n \, g) - 2 dot.op 10^(- 6) < frac(L_n t_(n \, g), Q^2) < frac(U_n t_(n \, g), Q^2) < c_(n \, g) + 2 dot.op 10^(- 6) . $ <eq:thermal120-rational-enclosure>]

Here the centers are interpreted as real numbers, including their $10^(- 6)$ scale. These inequalities in particular put every computed scaled norm below $4$. By (7.8), replacing its square by the true trace incurs error less than $\( 8 + 4 dot.op 10^(- 7) \) 4 dot.op 10^(- 7)$. Together with (7.10), this yields

$ \| Z_n \( 21 \/ 2 \, g \) - c_(n \, g) \| < 2 dot.op 10^(- 6) + \( 8 + 4 dot.op 10^(- 7) \) 4 dot.op 10^(- 7) < 10^(- 5) . $

This proves the $b = 21 \/ 2$ table in Lemma 9.

== 8 Thermal calculation at inverse temperature $49 \/ 4$ <sec:thermal72>

We prove the $b = 49 \/ 4$ table in Lemma 9. The computation uses integer approximations to columns of a physical matrix exponential. We specify the integer algorithm, bound its error, and give its exact outputs. Throughout this section,

$ b = 49 / 4 \, #h(2em) J = 280 \, #h(2em) Q = 2^55 \, #h(2em) 4 lt.eq n lt.eq 12 . $

The twists are the identity and a rotation by $pi$ about the $z$ axis. The latter has the same partition function as $P$, by the global rotation described in Section 2.

=== 8.1 The physical matrix and its rational approximation <the-physical-matrix-and-its-rational-approximation>

In the weight basis, write a word as $w = \( w_0 \, dots.h \, w_(n - 1) \)$, with $w_i in { - 1 \, 0 \, 1 }$. The total weight $sum_i w_i$ is conserved. In each weight block let $H$ be the restriction of $H_n \( g \)$, and set

#[#set math.equation(numbering: n => "(8.1)")
 $ R = I - frac(3 / 2 n I + H, 16) \, #h(2em) D = 32 R . $ <eq:thermal72-matrix>]

By (2.5), $D$ is an integer matrix with diagonal

$ D_(w \, w) = 32 - 3 n - 2 sum_(i = 0)^(n - 1) w_(i - 1) w_i . $

An allowed opposite unit step on the letters at $i - 1 \, i$ has entry $- 2$, except that the entry is $+ 2$ on the twisted seam $i = 0$. These formulas specify every matrix entry; indices on words are modulo $n$. The unit step coefficient follows also directly from the two ladder factors $sqrt(2)$ and the transverse prefactor $1 \/ 2$.

Lemma 3 gives

$ 0 lt.eq 3 / 2 n I + H lt.eq 5 / 2 n I \, #h(2em) "spec" \( R \) subset.eq \[ 1 - 5 n \/ 32 \, 1 \] subset.eq \[ - 7 \/ 8 \, 1 \] . $

Thus $R$ is a self-adjoint contraction. Put

$ F = exp #h(-0.16667em) [- b / 2 (3 / 2 n I + H)] = exp \[ 98 \( R - I \) \] . $

We use the same symbols for the direct sums over all weight blocks. On the full physical space,

#[#set math.equation(numbering: n => "(8.2)")
 $ Z_n \( b \, g \) = e^(x_n) ∥F∥_F^2 \, #h(2em) x_n = b n (3 / 2 - a) \, $ <eq:thermal72-trace>]

where $∥dot.op∥_F$ denotes the Frobenius norm and the squared norms of the weight blocks are summed.

Define the rational probabilities

#[#set math.equation(numbering: n => "(8.3)")
 $ p_j = frac(v_j, sum_(ell = 0)^J v_ell) \, #h(2em) v_j = 98^j frac(J !, j !) \, #h(2em) 0 lt.eq j lt.eq J . $ <eq:thermal72-coefficients>]

They are Poisson weights of mean $98$, conditioned to indices at most $J$. Since $∥R∥ lt.eq 1$, discarding the Poisson tail and renormalizing changes the exponential by at most twice the tail probability, by the same coefficient estimate as in Fox–Glynn #cite(label("FoxGlynn1988")) Proposition 1:

$ ∥F - sum_(j = 0)^J p_j R^j∥ lt.eq 2 e^(- 98) sum_(j = 281)^oo frac(98^j, j !) lt.eq 2^(- 280) e^98 < 2^(- 84) < Q^(- 1) . $

For the second inequality, use $2^j gt.eq 2^281$ in the tail and $e^(- 98) sum_(j gt.eq 0) 196^j \/ j ! = e^98$; the next uses $e < 4$. The estimate includes the change of normalization.

=== 8.2 Integer columns and their error <integer-columns-and-their-error>

For a selected unit basis column $e_r$, start with $X = 0$ and perform, in the order $j = J \, J - 1 \, dots.h \, 0$,

#[#set math.equation(numbering: n => "(8.4)")
 $ X med arrow.l med ⌊frac(D X, 32)⌋ + c_j e_r \, #h(2em) c_j = floor.l Q p_j floor.r . $ <eq:thermal72-horner>]

The vector floor is coordinatewise. All quantities in this recursion are integers. The coefficients $c_j$ vanish for $j > 191$, so those initial zero steps may be omitted without changing $X$.

To bound rounding, compare with the ideal suffix

$ Y_j = Q sum_(ell = j)^J p_ell R^(ell - j) e_r \, #h(2em) ∥Y_j∥_2 lt.eq Q . $

In a block of dimension $d_0$, one vector floor introduces Euclidean error less than $sqrt(d_0)$, and one coefficient floor error less than one. The contraction property therefore bounds the accumulated error by $281 \( sqrt(d_0) + 1 \)$. Set

#[#set math.equation(numbering: n => "(8.5)")
 $ d_n = floor.l sqrt(3^n) floor.r + 1 \, #h(2em) E_n = 281 \( d_n + 1 \) + 1 \, #h(2em) cal(E)_n = d_n E_n . $ <eq:thermal72-errors>]

Including the preceding exponential-approximation error, every computed column satisfies

#[#set math.equation(numbering: n => "(8.6)")
 $ ∥X - Q F e_r∥_2 lt.eq E_n . $ <eq:thermal72-column-error>]

The bound charges all $281$ ideal steps, including the omitted steps whose rational coefficients are nonzero but whose integer floors vanish.

The recursion can be evaluated exactly with signed $64$-bit integers. Indeed every intermediate coordinate has absolute value at most

$ Q + 281 \( d_n + 1 \) < 2 Q \, #h(2em) d_n lt.eq 730 . $

The absolute sum of any row of $D$ is at most

$ \| 32 - 3 n \| + 2 n + 4 n lt.eq 76 . $

The first two terms bound the diagonal, and at most two hops per bond give the last term. Consequently every product and every partial sum in a sparse matrix multiplication has absolute value less than

$ 76 dot.op 2 Q = 5476377146882523136 < 2^63 - 1 . $

Division by $32$ and addition of $c_j lt.eq Q$ also fit; even their conservative absolute bound is

$ frac(76 dot.op 2 Q, 32) + Q = 207165582859042816 < 2^63 - 1 . $

Starting with $X = 0$, these bounds first establish exactness of the next integer operation; the contraction estimate then establishes the next coordinate bound. Thus the induction does not assume the absence of overflow that it is proving. All final squares and sums below use arbitrary-precision integers.

=== 8.3 Representative columns <representative-columns>

Only one column from each of the following word orbits is needed. For positive total weight, use the orbit under cyclic shifts and reversal, and give its representative twice the orbit size. This includes the uncomputed negative-weight block. In the zero-weight block, include digit negation in the orbit itself and use its size without an extra factor two. Choose the lexicographically least word as representative. Set cardinalities handle periodic words and all other nontrivial stabilizers. The multiplicities $nu_r$ satisfy

$ sum_r nu_r = 3^n . $

Here are the exact symmetries underlying this reduction. Reversal $w mapsto \( w_(n - 1) \, dots.h \, w_0 \)$ fixes the seam as an unordered bond, and global negation preserves every Hamiltonian entry. For the twisted chain, a bare shift moves the seam. Left rotation by $q$ moves it to $\( k - 1 \, k \)$, where $k = - q med mod med n$. The diagonal unitary

$ G_k \| w chevron.r = \( - 1 \)^(sum_(j = 0)^(k - 1) w_j) \| w chevron.r \, #h(2em) G_0 = I \, $

flips the hopping signs exactly at the two boundary bonds of this arc. It restores the original seam. The resulting signed shift commutes with $H$, so exact exponential columns at rotated words have equal norms. For the untwisted chain no sign correction is needed.

Let $X_r$ be the output of (8.4) at representative $r$, and define the integer

#[#set math.equation(numbering: n => "(8.7)")
 $ W_(n \, g) = sum_r nu_r sum_w X_r \( w \)^2 . $ <eq:thermal72-total>]

Rounding need not preserve the signed symmetries. To compare norms, form abstract direct sums repeating each exact representative column $nu_r$ times, and do the same for each computed column. The first direct sum has squared norm $Q^2 ∥F∥_F^2$, and the second has squared norm $W_(n \, g)$. By (8.6),

#[#set math.equation(numbering: n => "(8.8)")
 $ lr(|sqrt(W_(n \, g)) - Q ∥F∥_F|) lt.eq sqrt(3^n) thin E_n < cal(E)_n . $ <eq:thermal72-frobenius>]

This proves the full trace estimate using representatives, without requiring their rounded columns to transform equivariantly.

=== 8.4 Exact totals and rational enclosures <exact-totals-and-rational-enclosures>

The integer algorithm (8.3), (8.4), and (8.7) gives the following totals. The second column uses no twist; the third uses the $pi$ twist.

#[
  #set par(justify: false)
#table(
  columns: 3,
  align: (right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$W_(n \, I)$
], table.cell(rowspan: 1, colspan: 1)[$W_(n \, P)$
]),
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[1298092848946206529211955779616040
], table.cell(rowspan: 1, colspan: 1)[683496640248050713756440676071
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[9095379218684502088743241789
], table.cell(rowspan: 1, colspan: 1)[9205948219074287936685289758037
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[11971284263768914176431179720622
], table.cell(rowspan: 1, colspan: 1)[266573596119930013833919176645
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[15044150708248976451784593468
], table.cell(rowspan: 1, colspan: 1)[534330762492192297990602166370
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[386135473475360677201628357188
], table.cell(rowspan: 1, colspan: 1)[42459883501386986922766507327
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[4866417737994347551816846903
], table.cell(rowspan: 1, colspan: 1)[37716485750353424806876104310
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[19772960374215472827775892486
], table.cell(rowspan: 1, colspan: 1)[5030484777222468978572235564
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[841347687722481981930750335
], table.cell(rowspan: 1, colspan: 1)[2928767918985354021900689432
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[1266666171463993322695232916
], table.cell(rowspan: 1, colspan: 1)[524785463625387865619045258
],
)
]

We finish with a finite rational enclosure, specifying every bound used to turn these integers into the thermal table at $b = 49 \/ 4$. Let

$ r_(n \, g) = floor.l sqrt(W_(n \, g)) floor.r \, #h(2em) s_n = sum_(j = 0)^100 frac(x_n^j, j !) \, #h(2em) t_n = frac(x_n^100, 100 !) . $

Since $0 lt.eq x_n < 15$, successive omitted terms have ratio at most $15 \/ 101$, and the tail is at most $15 t_n \/ 86 < t_n$. Hence $s_n lt.eq e^(x_n) lt.eq s_n + t_n$. Equations (8.2) and (8.8) give

#[#set math.equation(numbering: n => "(8.9)")
 $ L_(n \, g) = frac(s_n max \( 0 \, r_(n \, g) - cal(E)_n \)^2, Q^2) \, #h(2em) U_(n \, g) = frac(\( s_n + t_n \) \( r_(n \, g) + 1 + cal(E)_n \)^2, Q^2) \,\
L_(n \, g) lt.eq Z_n \( b \, g \) lt.eq U_(n \, g) . $ <eq:thermal72-enclosure>]

All quantities in these endpoints are rational or integer, with the integer square root determined by $r^2 lt.eq W < \( r + 1 \)^2$. Writing $C_(n \, g)$ for the integer centers in the $b = 49 \/ 4$ table of Lemma 9, direct integer and rational evaluation yields

$ L_(n \, g) > frac(C_(n \, g) - 30, 10^6) \, #h(2em) U_(n \, g) < frac(C_(n \, g) + 30, 10^6) #h(2em) \( 4 lt.eq n lt.eq 12 \, med g = I \, P \) . $

Every one of these strict inequalities has margin greater than $13 \/ 10^6$. The displayed algorithm, totals, and enclosures give a reproducible finite verification of all eighteen enclosures, and complete the proof of the thermal table at $b = 49 \/ 4$.

== 9 Two variational inputs <sec:trials>

The finite initializations need a lower bound on the untwisted partition function at lengths $72$ and $120$. One fixed triple of integer matrices defines periodic matrix-product vectors at both lengths, with energy per bond below $- a = - 700741 \/ 500000$. A block decomposition reduces the calculation to powers of integer matrices of order at most $162$.

=== 9.1 Norm and energy contractions <norm-and-energy-contractions>

For $N gt.eq 4$ and three real $D$-by-$D$ matrices $A_s$, indexed by $s = - 1 \, 0 \, 1$, define a vector in the standard orthonormal spin-one weight basis by

#[#set math.equation(numbering: n => "(9.1)")
 $ psi_N \( s_0 \, dots.h \, s_(N - 1) \) = "Tr" \( A_(s_0) dots.h.c A_(s_(N - 1)) \) . $ <eq:trial-vector>]

This is the periodic matrix-product representation of #cite(label("PerezGarcia2007")) Section 2.1, Equations (2)–(3). Write

#[#set math.equation(numbering: n => "(9.2)")
 $ B_(s t) & = A_s A_t \, #h(2em) T = sum_(s = - 1)^1 A_s ⊗ A_s \,\
O & = sum_(s \, t = - 1)^1 s t thin B_(s t) ⊗ B_(s t) + sum_(s = - 1 \, 0\
t = 0 \, 1) #scale(x: 120%, y: 120%)[\(] B_(s t) ⊗ B_(s + 1 \, t - 1) + B_(s + 1 \, t - 1) ⊗ B_(s t) #scale(x: 120%, y: 120%)[\)] . $ <eq:trial-transfer>]

All traces here are ordinary, unnormalized matrix traces.

#thm([Lemma 9.1.])[
  #emph[Let $N gt.eq 4$ and $D gt.eq 1$ be integers, and let $A_(- 1) \, A_0 \, A_1 in M_D \( bb(R) \)$. Define $psi_N \, T \, O$ by Equations (9.1)–(9.2). For the periodic spin-one Heisenberg Hamiltonian $H_N$, set 
$ V_N = "Tr" \( T^N \) \, #h(2em) U_N = "Tr" \( T^(N - 2) O \) . $

 Then 
$ ∥psi_N∥^2 = V_N \, #h(2em) chevron.l psi_N \, H_N psi_N chevron.r = N U_N . $

 In particular, if $V_N > 0$ and $U_N < - a V_N$, then $E_0 \( N \) < - N a$ and $Z_N \( b \) > 1$ for every $b > 0$.]
] <lem:trial-contraction>

#proof[
  Expand $T^N$ and use $"Tr" \( X ⊗ Y \) = "Tr" \( X \) "Tr" \( Y \)$. Since all amplitudes in (9.1) are real, the result is the sum of their squares. This proves the norm formula without assuming that the finite contraction matrix $T$ is self-adjoint or positive.
  In the weight basis, a bond has diagonal entry $s t$ on the pair $\( s \, t \)$. Its off-diagonal entries are $1$ between $\( s \, t \)$ and $\( s + 1 \, t - 1 \)$ for $s = - 1 \, 0$ and $t = 0 \, 1$: each follows from $h = S^z ⊗ S^z + \( S^(+) ⊗ S^(-) + S^(-) ⊗ S^(+) \) \/ 2$ and the ladder entries $sqrt(2)$. Inserting this bond into the two amplitude layers gives exactly $O$ in (9.2). Summing the other physical indices therefore gives $U_N$ for one bond. Cyclicity of the amplitude trace makes $psi_N$ invariant under cyclic site translation, so every bond, including the periodic seam, contributes equally.
  For $V_N > 0$, the variational principle gives $E_0 \( N \) lt.eq N U_N \/ V_N < - N a$. The shifted ground energy is negative, so its term in $"Tr" e^(- b \( H_N + N a I \))$ exceeds $1$ for every $b > 0$. ◻
]

=== 9.2 One integer matrix triple <one-integer-matrix-triple>

Set $D = 26$. Index eight types by $alpha = 1 \, dots.h \, 8$, put

$ \( ell_1 \, dots.h \, ell_8 \) = \( 1 \, 1 \, 1 \, 1 \, 3 \, 3 \, 3 \, 5 \) \, $

and order the virtual labels $\( alpha \, d \)$ first by $alpha$ and then by $d = - ell_alpha \, - ell_alpha + 2 \, dots.h \, ell_alpha$. The matrices $A_s$ use the diagonal parameters $D_alpha$ in Table 1 and the parameters $P_(alpha beta)$ in Table 2, defined only when $ell_beta = ell_alpha + 2$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 9,
  align: (center, right, right, right, right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$alpha$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[8
]),
  table.cell(rowspan: 1, colspan: 1)[$D_alpha$
], table.cell(rowspan: 1, colspan: 1)[$- 289$
], table.cell(rowspan: 1, colspan: 1)[$- 84$
], table.cell(rowspan: 1, colspan: 1)[$- 9$
], table.cell(rowspan: 1, colspan: 1)[33
], table.cell(rowspan: 1, colspan: 1)[$- 22$
], table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[71
], table.cell(rowspan: 1, colspan: 1)[$- 11$
],
)
]],
  caption: [Table 4: Diagonal parameters, common to both lengths. ],
)

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (center, right, center, right, center, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$\( alpha \, beta \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(alpha beta)$
], table.cell(rowspan: 1, colspan: 1)[$\( alpha \, beta \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(alpha beta)$
], table.cell(rowspan: 1, colspan: 1)[$\( alpha \, beta \)$
], table.cell(rowspan: 1, colspan: 1)[$P_(alpha beta)$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 11$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 49$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[9
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 35$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 6$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 32$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 1 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 28$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 25$
], table.cell(rowspan: 1, colspan: 1)[$\( 5 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[1
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 23$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 7 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 20$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[2
],
  table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 6 \)$
], table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 5 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 34$
], table.cell(rowspan: 1, colspan: 1)[$\( 7 \, 8 \)$
], table.cell(rowspan: 1, colspan: 1)[$- 16$
],
)
]],
  caption: [Table 5: Parameters joining virtual types whose labels $ell$ differ by $2$. ],
)

Here are complete entry rules. Consider the row $\( alpha \, d \)$ and column $\( beta \, e \)$, put $ell = ell_alpha$, $k = ell_beta$, and fix $s in { - 1 \, 0 \, 1 }$. The entry is zero unless

#[#set math.equation(numbering: n => "(9.3)")
 $ e = d + 2 s \, #h(2em) \| k - ell \| lt.eq 2 \, #h(2em) \( k = ell arrow.r.double alpha = beta \) . $ <eq:trial-support>]

For an allowed entry define

$ p = cases(delim: "{", D_alpha \, & k = ell \,, P_(alpha beta) \, & k = ell + 2 \,, - P_(beta alpha) \, & k = ell - 2 .) $

Put $r = \( d + ell \) \/ 2$ and set the entry equal to $p f$, where

#[#set math.equation(numbering: n => "(9.4)")
 $ & s = - 1 & s = 0 & s = 1\
k = ell + 2 & 2 \( ell + 1 - r \) \( ell + 2 - r \) & 2 \( r + 1 \) \( ell - r + 1 \) & \( r + 1 \) \( r + 2 \)\
k = ell & 2 \( ell - r + 1 \) & d & - \( r + 1 \)\
k = ell - 2 & 2 & - 2 & 1 $ <eq:trial-entry>]

lists the values of $f$. These entry rules are independent of $N$.

=== 9.3 Finite contractions and variational bounds <finite-contractions-and-variational-bounds>

We now evaluate the contractions in Lemma 16 for this fixed triple at $N = 72$ and $N = 120$. The support rule (9.3) makes this a short block calculation. On paired virtual labels $\( \( alpha \, d \) \, \( beta \, e \) \)$, both $T$ and $O$ preserve $d - e$. For $T$, the two layers shift by the same $2 s$. For $O$, the two layers have the same total physical weight $s + t$, also in each off-diagonal term. Thus the difference blocks are exhaustive and have dimensions

#[#set math.equation(numbering: n => "(9.5)")
 $ d - e & - 10 & - 8 & - 6 & - 4 & - 2 & 0 & 2 & 4 & 6 & 8 & 10\
upright("dimension") & 1 & 8 & 32 & 80 & 136 & 162 & 136 & 80 & 32 & 8 & 1 . $ <eq:trial-blocks>]

They sum to $676 = 26^2$; each block contributes once.

For completeness, the entire integer computation consists of the following operations. Form $A_s$, $B_(s t)$, $T$, and $O$ from Tables 1–2 and Equations (9.2), (9.2), (9.3), and (9.4). Restrict $T \, O$ to each difference block, obtaining $T_delta \, O_delta$. Compute powers by

$ P_0 = I \, #h(2em) P_(2 j) = P_j^2 quad \( j gt.eq 1 \) \, #h(2em) P_(2 j + 1) = P_j^2 T_delta quad \( j gt.eq 0 \) . $

Then accumulate

#[#set math.equation(numbering: n => "(9.6)")
 $ U_N = sum_delta sum_(i \, j) \( P_(N - 2) \)_(i j) \( O_delta \)_(j i) \, #h(2em) V_N = sum_delta sum_(i \, j) \( P_(N - 2) \)_(i j) \( T_delta^2 \)_(j i) . $ <eq:trial-integer-algorithm>]

Only arbitrary-precision integer operations are used. For $N = 72$, the required power is $70$. For $N = 120$, one may use $T^118 = T^64 T^32 T^16 T^4 T^2$ and $T^120 = T^64 T^32 T^16 T^8$ within each block.

The resulting exact integer comparisons are

#[#set math.equation(numbering: n => "(9.7)")
 $ V_N > 0 \, #h(2em) - c_N V_N lt.eq 10^12 U_N < \( - c_N + 1 \) V_N \, #h(2em) N & c_N\
72 & 1401482112601\
120 & 1401482105174 . $ <eq:trial-integer-results>]

The supplied computation files contain the complete matrices and the full integers $U_N \, V_N$, rather than only these shortened intervals. In particular, the files and record the full contractions and positive margins $- 700741 V_N - 500000 U_N$. The common matrices are recorded in . The program , with #raw("--length 72") or #raw("--length 120"), executes the entry rules and block contractions in at the selected length. The integer comparisons in (9.7) also follow directly from their full recorded integers.

#thm([Lemma 9.2.])[
  #emph[For the untwisted periodic spin-one Heisenberg Hamiltonian and $a = 700741 \/ 500000$, 
$ E_0 \( 72 \) < - 72 a \, #h(2em) E_0 \( 120 \) < - 120 a . $

 Consequently $Z_72 \( b \) > 1$ and $Z_120 \( b \) > 1$ for every $b > 0$.]
] <lem:trial-inputs>

#proof[
  For each row of (9.7), $\( - c_N + 1 \) \/ 10^12 < - 700741 \/ 500000$. Thus the corresponding explicit matrices have $V_N > 0$ and $U_N \/ V_N < - a$. Apply Lemma 16. ◻
]

The support rule puts these trial vectors in total weight zero, but the variational bound is for the minimum of the full physical spectrum. Their only symmetry used in the contraction proof is cyclic site translation. The trial inputs hold at every positive inverse temperature, so each finite initialization can use them at its own temperature.


#bibliography("refs.bib", style: "ieee", title: [References])
