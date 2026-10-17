#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 1in, y: 1in), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Zero-Plane Rigidity for Einstein Four-Manifolds]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

An Einstein metric has Ricci tensor equal to a constant multiple of the metric. In dimension four this fixes the sum of the sectional curvatures through each tangent direction, while leaving two independent Weyl curvature blocks. A basic rigidity problem asks how much nonnegative sectional curvature restricts those blocks. The product of two round surfaces illustrates the boundary case: planes tangent to a factor have positive curvature, whereas planes spanned by one direction from each factor have zero curvature. We prove that, for a closed Einstein four-manifold with positive Einstein constant, a single zero-curvature plane already forces this product geometry on the universal cover.

#thm([Theorem 1.1.])[
  (Zero-plane rigidity).  #emph[Let $\( M^4 \, g \)$ be a connected smooth closed Riemannian manifold satisfying 
$ "Ric"_g = 3 g \, #h(2em) K_g \( sigma \) gt.eq 0 $

 for every tangent two-plane $sigma$. If $K_g \( sigma_0 \) = 0$ for at least one tangent two-plane, then the universal Riemannian cover is isometric to 
$ S^2 \( 1 \/ sqrt(3) \) times S^2 \( 1 \/ sqrt(3) \) $

 with its product metric. In particular, the tangent bundle of the universal cover is the orthogonal sum of two parallel rank-two subbundles.]
] <thm:main>

Here $S^2 \( r \)$ denotes the round sphere of radius $r$, and closed means compact without boundary. No orientation, symmetry, or topological condition is assumed on $M$. The Einstein normalization only fixes the scale: for $"Ric" = lambda g$ with $lambda > 0$, the two radii are $1 \/ sqrt(lambda)$.

=== 1.1 Context and the boundary problem <context-and-the-boundary-problem>

The classification of positively curved Einstein four-manifolds has a long history. Berger’s rigidity under strict quarter pinching [1] was followed by quantitative curvature conditions of Yang, Costa, and Cao–Tran [22,7,5]. Gursky–LeBrun obtained the Fubini–Study conclusion under nonnegative sectional curvature and a nonzero positive-definite intersection form [12] Theorem A. Their separate Weyl-norm gaps and analysis of the two Weyl blocks are important antecedents of the argument here. Scalar combinations of the two Weyl norms also appear in Yang’s coupling argument [22] Section 6 and in Cao–Tran [5] Proposition 2.2. Under nonnegative isotropic curvature, which is a different curvature condition, the Einstein local-symmetry theorem in dimension four is due to Micallef–Wang [17] Theorem 4.4; Brendle established the analogous rigidity in higher dimensions [3] Theorem 1.

Recent results treat additional topology or symmetry. Cheng proves the oriented positive-sectional classification when the Euler characteristic is at most three [6] Theorem 1.2; Gursky–Malchiodi obtain it under $2 chi - 3 \| tau \| lt.eq 4$, where $chi$ is the Euler characteristic and $tau$ the signature [13] Theorem 1.1. For nonnegative sectional curvature, Liu proves the classification of closed simply connected manifolds with a $T^2$-invariant Einstein metric [16] Theorem 1.1. Di Cerbo obtains the $S^2 times S^2$ universal cover when equality in a Weyl-norm bound holds at every point [10] Proposition 3.2. The hypothesis of Theorem 1 instead specifies one sectional-curvature plane at one point.

The companion manuscript #emph[Positively curved Einstein four-manifolds] [20] proves the strictly positive classification without additional curvature or topological restrictions. Its coupled Weyl estimates provide the starting point of this paper. We reproduce the tensor calculations, upper volume comparison, moment argument, and polynomial inequalities needed here, with their attribution at the point of use. The extra issue is their behavior at the boundary of the sectional-curvature cone. An estimate proved for a strictly positive metric does not by itself settle that boundary case.

The argument also gives the full classification under nonnegative sectional curvature.

#thm([Corollary 1.2.])[
  #emph[Let $\( M^4 \, g \)$ be connected, smooth, and closed, with $"Ric" = 3 g$ and nonnegative sectional curvature. Its universal Riemannian cover is one of the round $S^4$ of curvature $1$, the complex projective plane with its Fubini–Study metric normalized by $"Ric" = 3 g$, or $S^2 \( 1 \/ sqrt(3) \) times S^2 \( 1 \/ sqrt(3) \)$.]
] <cor:nonnegative-classification>

Its proof is given at the end of Section 7.

=== 1.2 Reduction and proof strategy <reduction-and-proof-strategy>

The universal Riemannian cover is complete and has $"Ric" = 3 g$, so Bonnet–Myers makes it compact [18]. It is simply connected and therefore orientable. We work on this cover from now on and keep the notation $\( M \, g \)$. The zero-curvature plane lifts to it.

Choose an orientation and let $Lambda^(+)$ and $Lambda^(-)$ be the rank-three eigenspaces of the Hodge star on two-forms. The Einstein curvature operator has blocks $"Id" + T$ and $"Id" + U$, where $T \, U$ are symmetric and trace-free. They are the self-dual and anti-self-dual Weyl blocks. Set

$ v = frac(\| T \|, sqrt(6)) \, #h(2em) b = frac(\| U \|, sqrt(6)) \, #h(2em) x = - lambda_min \( T \) \, #h(2em) y = - lambda_min \( U \) . $

All matrix norms are Hilbert–Schmidt norms. As proved in Lemma 3, the smallest sectional curvature is $1 - \( x + y \) \/ 2$, and

$ v lt.eq x lt.eq 2 v \, #h(2em) b lt.eq y lt.eq 2 b \, #h(2em) x + y lt.eq 2 . $

The stronger spectral inequality $x + y lt.eq 2$, not merely $v + b lt.eq 2$, is retained in the tensor estimates.

If one Weyl block vanished identically, the metric would be half-conformally flat. The classical compact positive-scalar Einstein classification of Hitchin [14], with conformal Einstein rigidity [19], would identify our simply connected cover with the standard $S^4$ or $bb(C P)^2$ up to scale; see also [8] Remark 7. Both have strictly positive sectional curvature. We may therefore assume throughout the remaining proof that neither block vanishes identically. The zero-plane hypothesis is used only in this reduction: the remaining estimates assume only nonnegative sectional curvature and that neither block vanishes identically. Individual blocks may still vanish at some points.

Write $upright(bold(E)) f$ for the integral of $f$ divided by the volume of $M$. The proof now has three stages. First, the separate gaps $upright(bold(E)) v^2 \, upright(bold(E)) b^2 gt.eq 1$, a weighted variance inequality, and an upper volume deficit force

$ upright(bold(E)) v^2 = upright(bold(E)) b^2 . $

Second, a weighted Hessian identity and explicit polynomial inequalities couple the two blocks and force $d v = d b = 0$ almost everywhere. Third, the gaps and $v + b lt.eq 2$ give $v = b = 1$. The weak norm equations then imply that both Weyl blocks are parallel, each with spectrum $\( 2 \, - 1 \, - 1 \)$. Their simple eigenlines produce the parallel tangent splitting.

Three features allow these estimates to reach the boundary. The upper volume estimate integrates over the domain before the first conjugate point and needs no lower bound on the injectivity radius. The weighted Hessian identity needs a nonnegative quadratic form, so it remains valid when that form has a kernel. At a zero of one Weyl block, the pointwise algebraic estimates are obtained by introducing a small nonzero block and shrinking the opposite block while keeping its derivative data fixed. The decisive strictness then comes from the fact that the gradient of a Lipschitz function vanishes almost everywhere on a level set. This forces constant Weyl norms without requiring strict sectional positivity.

Section 2 develops the curvature identities, including the weak norm equations at zeros. Sections 3 and 4 establish the scalar estimates and moment balance. Sections 5 and 6 give the Hessian and coupling inequalities. Section 7 resolves their equality case and proves Theorem 1. Appendix 8 supplies the exact polynomial certificates, including all boundary faces.

== 2 Curvature blocks and their covariant derivatives <sec:preliminaries>

Our first task is to express nonnegative sectional curvature and the differential Bianchi identity in a common set of variables. Throughout Sections 2–6, we work on the closed, simply connected, oriented cover obtained in Section 1, with $"Ric" = 3 g$, $sec_g gt.eq 0$, and neither Weyl block identically zero. The curvature decomposition is classical; see Derdziński [8] Section 2. The derivative identities and their normalizations follow the treatment in [20] Lemmas 2.1–2.3 and Proposition 2.4; we reproduce them because their exact constants enter the Hessian inequality. Write

$ d nu = frac(d "vol"_g, "Vol" \( M \)) \, #h(2em) upright(bold(E)) f = integral_M f thin d nu . $

The Laplacian $Delta$ is the trace of the second covariant derivative. Our curvature convention is

$ \[ nabla_i \, nabla_j \] xi_k = R_(i j k a) xi_a $

for a covector, with $R_(i j i j) > 0$ on positively curved orthonormal two-planes. All tensor connections are induced by the Levi–Civita connection. We take covariant derivatives before choosing any pointwise eigenbasis.

=== 2.1 The two Weyl blocks <the-two-weyl-blocks>

The Hodge-star eigenspaces $Lambda^(+)$ and $Lambda^(-)$ have eigenvalues $+ 1$ and $- 1$, respectively. On an oriented Euclidean four-space, choose triples of skew orthogonal complex structures $I_1 \, I_2 \, I_3$ and $J_1 \, J_2 \, J_3$ satisfying

$ I_1 I_2 = I_3 = - I_2 I_1 \, #h(2em) J_1 J_2 = J_3 = - J_2 J_1 \, $

and their cyclic analogues, with every $I_s$ commuting with every $J_t$. The two triples can be constructed from left and right quaternionic multiplication. As two-forms, $I_s \/ sqrt(2)$ and $J_s \/ sqrt(2)$ are orthonormal bases of $Lambda^(+)$ and $Lambda^(-)$, respectively. Vector and covector indices are identified by the metric.

#thm([Lemma 2.1.])[
  (Curvature blocks and nonnegative sectional curvature).  #emph[There are symmetric trace-free endomorphisms $T in "Sym"_0 \( Lambda^(+) \)$ and $U in "Sym"_0 \( Lambda^(-) \)$ such that the curvature operator is 
$ cal(R)_(Lambda^2) = mat(delim: "(", "Id" + T, 0; 0, "Id" + U) . $

 At a point where these endomorphisms are diagonal, with eigenvalues $t_s \, u_s$, the curvature tensor is 
$ R_(i k j l) = 1 / 2 sum_s \( 1 + t_s \) I_(s \, i k) I_(s \, j l) + 1 / 2 sum_s \( 1 + u_s \) J_(s \, i k) J_(s \, j l) . $

 Put 
$ x = - min_s t_s \, #h(2em) y = - min_s u_s \, #h(2em) v = frac(\| T \|, sqrt(6)) \, #h(2em) b = frac(\| U \|, sqrt(6)) \, $

 where the matrix norms are Hilbert–Schmidt norms. Then 
$ sec_g gt.eq 0 quad arrow.l.r.double quad x + y lt.eq 2 \, #h(2em) v lt.eq x lt.eq 2 v \, #h(2em) b lt.eq y lt.eq 2 b . $

 Both Weyl blocks, viewed as curvature four-tensors, have zero divergence. In particular, for $Z = nabla T$, whose matrix entries are one-forms, the differential Bianchi constraint is 
$ sum_s I_s Z_(s r) = 0 #h(2em) \( r = 1 \, 2 \, 3 \) . $

]
] <lem:curvature-blocks>

#proof[
  The first Bianchi identity says that the traces of the two diagonal blocks of the curvature operator agree. Their sum is half the scalar curvature, hence is $6$. Contraction identifies the off-diagonal block with the trace-free Ricci tensor: its nine entries give the coefficients in the independent symmetric trace-free matrices $I_s J_t$. Thus the Einstein condition makes this block zero, and each diagonal block has trace $3$. Expanding in the orthonormal two-form bases gives the displayed curvature tensor.
  A unit simple two-form has self-dual and anti-self-dual parts of norm $1 \/ sqrt(2)$. Conversely, a unit two-form whose two parts have these norms has exterior square zero, and is simple: in its orthogonal normal form $alpha = a thin e^1 and e^2 + b thin e^3 and e^4$, the condition $alpha and alpha = 0$ is $a b = 0$. Therefore all pairs of plus and minus parts of norm $1 \/ sqrt(2)$ occur. The smallest sectional curvature is $1 - \( x + y \) \/ 2$, proving the equivalence.
  For the norm comparison, write the eigenvalues of $T$ as $- x \, a \, x - a$. Minimality of $- x$ gives $- x lt.eq a lt.eq 2 x$, and hence
  $ 3 / 2 x^2 lt.eq x^2 + a^2 + \( x - a \)^2 lt.eq 6 x^2 . $
  Division by $6$ gives $v lt.eq x lt.eq 2 v$. The proof for $U$ is identical.
  Contracting the differential Bianchi identity shows that the curvature tensor is divergence-free when Ricci is parallel. Project its last pair of indices onto $Lambda^(+)$ or $Lambda^(-)$; these projections are parallel. Subtracting the parallel scalar-curvature contribution proves divergence freedom of each Weyl block. In a quaternionic basis, the resulting constraint on $nabla T$ is exactly the stated identity. ◻
]

=== 2.2 Algebra of the derivative representations <algebra-of-the-derivative-representations>

The differential Bianchi identity restricts $nabla T$ to a proper subspace of all matrix-valued one-forms. To derive its Laplacian equation, we first describe this subspace and the curvature operators acting on it. The calculation uses only finite-dimensional tensor representations.

Let $Sigma_s$ denote the infinitesimal action of $I_s$ on the plus indices of a tensor representation. On $Lambda^(+)$ it is rotation about axis $s$ with speed $2$. A complexified irreducible representation has #emph[spin $j$] when

$ sum_(s = 1)^3 Sigma_s^2 = - 4 j \( j + 1 \) "Id" . $

Pairs $\( j \, ell \)$ specify the spins of the two commuting rotation algebras. This notation describes associated tensor bundles of the oriented orthonormal frame bundle; it requires no spin structure.

#thm([Lemma 2.2.])[
  (Representation rules).  #emph[A spin-$j$ representation has weights $- j \, - j + 1 \, dots.h \, j$ for $Sigma_3 \/ \( 2 i \)$, each once, and 
$ H_j ⊗ H_ell tilde.equiv H_(j + ell) xor H_(j + ell - 1) xor dots.h.c xor H_(\| j - ell \|) . $

 In particular, the tangent, plus two-form, and plus trace-free symmetric-matrix representations have types 
$ (1 / 2 \, 1 / 2) \, #h(2em) \( 1 \, 0 \) \, #h(2em) \( 2 \, 0 \) . $

 The Casimir operators and the orthogonal projections onto these irreducible types are parallel bundle endomorphisms.]
] <lem:spin-algebra>

#proof[
  The generators are skew-Hermitian and satisfy $\[ Sigma_1 \, Sigma_2 \] = 2 Sigma_3$, cyclically. Diagonalize $Sigma_3 \/ \( 2 i \)$ and take the usual conjugate raising and lowering operators, which shift its weight by one. If a unit highest vector has weight $j$, commuting the raising and lowering operators gives the squared lowering coefficient at weight $j - r$ as
  $ \( r + 1 \) \( 2 j - r \) . $
  Nonnegativity and termination of the chain imply that $2 j$ is a nonnegative integer and give the listed weights and Casimir. Taking invariant orthogonal complements decomposes an arbitrary representation. Multiplying the weight lists, and successively removing the chain of highest remaining weight, proves the tensor product rule with multiplicity one. Commuting actions operate on the corresponding multiplicity spaces. The same chain description shows that an intertwiner between single irreducible copies is a scalar.
  The actions on the tangent space and on $Lambda^(+)$ give the first two types. The symmetric square of the spin-one representation is spin two plus the scalar trace, giving the third. Finally, these splittings are defined by invariant algebraic operators. The connection induced by the orthonormal frame bundle preserves every such operator. Thus the projections are parallel even though a chosen local frame, or a curvature eigenbasis, need not be parallel. ◻
]

Write $F = "Sym"_0 \( Lambda^(+) \)$. For a symmetric trace-free matrix $A$, define the self-adjoint operator on $F$

$ B_F \( A \) S = frac(A S + S A, 2) - frac("tr" \( A S \), 3) "Id" . $

It is characterized by $chevron.l B_F \( A \) S \, S chevron.r = "tr" \( A S^2 \)$. On any plus spin-$j$ representation with $j gt.eq 1$, define

$ Q_j \( A \) = frac(sum_(r \, s) A_(r s) Sigma_r Sigma_s, 4 j \( 2 j - 1 \)) . $

For diagonal $A$ the numerator is $sum_s a_s Sigma_s^2$.

#thm([Lemma 2.3.])[
  (Curvature-weighted operators).  #emph[If $A$ has smallest eigenvalue $- x$, then 
$ Q_j \( A \) lt.eq frac(x \( j + 1 \), 2 j - 1) "Id" . $

 Moreover, $Q_2 \( A \) = B_F \( A \)$. The compression of $B_F \( A \)$, acting on an $F$ factor, to a highest-spin coupling of total plus spin $j$ is $Q_j \( A \)$, provided the operator acts trivially on any additional irreducible minus factor.]
] <lem:quadratic-curvature-action>

#proof[
  In a diagonal basis, $a_s + x gt.eq 0$ and every $Sigma_s^2$ is nonpositive. Thus
  $ sum_s a_s Sigma_s^2 lt.eq - x sum_s Sigma_s^2 = 4 x j \( j + 1 \) "Id" \, $
  which proves the bound.
  To identify $Q_2$, diagonalize $S = "diag" \( d_1 \, d_2 \, d_3 \)$. The speed-two matrix action gives $\| Sigma_s S \|^2 = 8 \( d_j - d_k \)^2$, with $s \, j \, k$ cyclic; these three derivatives are mutually orthogonal. Consequently, allowing $A$ to be nondiagonal in this basis,
  $ chevron.l Q_2 \( A \) S \, S chevron.r & = - 1 / 3 sum_s A_(s s) \( d_j - d_k \)^2\
 & = - 1 / 3 sum_s A_(s s) #scale(x: 120%, y: 120%)[\(] 2 "tr" \( S^2 \) - 3 d_s^2 #scale(x: 120%, y: 120%)[\)] = "tr" \( A S^2 \) . $
  Here trace-freeness of both matrices gives the middle identity and removes the scalar term. Polarization proves the operator equality.
  By Lemma 4, spin two occurs once in $"End" \( H_j \) tilde.equiv H_j ⊗ H_j$. Hence an equivariant operator family linear in $A$ is unique up to scalar. The same is true with an irreducible minus factor when the operators commute with its action. Test the scalar at $A = "diag" \( - 1 \, - 1 \, 2 \)$ on a highest vector. At weight $m$,
  $ Q_j \( A \) = frac(j \( j + 1 \) - 3 m^2, j \( 2 j - 1 \)) \, $
  so its highest-weight eigenvalue is $- 1$. The $F$ highest vector also has $B_F \( A \)$ eigenvalue $- 1$. A product of highest vectors is the highest vector of the stretched coupling, proving the claimed compression. For the same reason, compression of a single generator from a spin-$ell$ factor to a stretched spin-$j$ product is $ell \/ j$ times the total generator. ◻
]

#thm([Proposition 2.4.])[
  (Differential equations for the Weyl blocks).  #emph[The tensor $Z = nabla T$ belongs to the parallel subbundle $G$ of type $\( 5 \/ 2 \, 1 \/ 2 \)$. On this bundle, put $B_(upright("op")) = Q_(5 \/ 2) \( T \)$. Then 
$ Delta T = 6 \( T - N \) \, #h(2em) N = \( T^2 \)_0 = T^2 - 2 v^2 "Id" \, $

 and 
#[#set math.equation(numbering: n => "(1)")
 $ Delta Z = \( 13 - 20 B_(upright("op")) \) Z . $ <eq:1>]

 Every statement has an exchanged counterpart for $U$.]
] <prop:weyl-derivative-equations>

#proof[
  The derivative space $T^(*) M ⊗ F$ has types $\( 5 \/ 2 \, 1 \/ 2 \)$ and $\( 3 \/ 2 \, 1 \/ 2 \)$. The divergence takes values in $T^(*) M ⊗ Lambda^(+)$, whose plus spins are at most $3 \/ 2$. It is nonzero: a nonzero covector tensored with $"diag" \( 1 \, - 1 \, 0 \)$ has nonzero divergence. It therefore vanishes on the first summand and is injective on the second, by irreducibility. Lemma 3 puts $Z$ in the first summand.
  Let
  $ C = sum_s I_s ⊗ Sigma_s $
  on $T^(*) M ⊗ F$. Expansion of the combined Casimir gives $C = - 4$ on $G$ and $C = 6$ on its complement. In particular $P_G = \( 6 - C \) \/ 10$ is a parallel orthogonal projector. The bundle curvature on $F$ is
  $ F_(i k) = 1 / 2 sum_s \( 1 + t_s \) I_(s \, i k) Sigma_s $
  at a point of diagonalization. Taking the covariant divergence of $C Z = - 4 Z$, using skewness of $I_s$ to take a commutator and $sum_(i k) I_(s \, i k) I_(r \, i k) = 4 delta_(s r)$, gives
  $ - 4 Delta T = sum_s \( 1 + t_s \) Sigma_s^2 T = - 24 T + 24 B_F \( T \) T = - 24 \( T - N \) . $
  To differentiate this equation, note first that $nabla N = 2 B_F \( T \) Z$. For each derivative index $j$, the covariant commutation formula reads
  $ Delta Z_j = nabla_j Delta T + nabla^i \( F_(i j) T \) + F_(i j) nabla^i T + "Ric"_(j a) Z_a . $
  The divergence of $F$ vanishes because it is the induced action of the divergence-free Riemann curvature. Thus the differentiated equation contributes $6 Z - 12 B_F \( T \) Z$, the Ricci term contributes $3 Z$, and the remaining bundle term is $- sum_s \( 1 + t_s \) I_s Sigma_s Z$. Its constant part is $- C Z = 4 Z$.
  The left side already lies in $G$, since $P_G$ is parallel and $P_G Z = Z$. We may therefore compress the right side to $G$, although its individual summands need not preserve $G$. Lemma 5 gives $P_G B_F \( T \) P_G = Q_(5 \/ 2) \( T \)$. On $G$, the total plus generators are $I_s + Sigma_s$, so
  $ 40 Q_(5 \/ 2) \( T \) = P_G sum_s t_s \( I_s + Sigma_s \)^2 P_G . $
  The $I_s^2$ term vanishes by $sum_s t_s = 0$, and the $Sigma_s^2$ term compresses to $24 Q_(5 \/ 2) \( T \)$. Hence
  $ P_G sum_s t_s I_s Sigma_s P_G = 8 Q_(5 \/ 2) \( T \) . $
  The scalar contributions sum to $13$, while the two curvature contributions sum to $- 20 Q_(5 \/ 2) \( T \)$, proving (1). For a nondiagonal $T$ the same calculation uses the symmetric contraction $sum_(r \, s) T_(r s) \( I_r + Sigma_r \) \( I_s + Sigma_s \)$: its $I_r I_s$ part is zero by symmetry and trace-freeness. Thus the computation is tensorial and entails no differentiation of a moving eigenframe. ◻
]

=== 2.3 The gradient parametrization and the norm equation <the-gradient-parametrization-and-the-norm-equation>

Write

$ p = nabla v \, #h(2em) q = nabla b \, #h(2em) e = frac(\| nabla T \|^2, 6) \, #h(2em) macron(e) = frac(\| nabla U \|^2, 6) . $

The norms $v \, b$ are Lipschitz. Their gradients are understood almost everywhere and vanish almost everywhere on the respective zero sets.

Where $v > 0$, diagonalize $T$ and put, cyclically in $i \, j \, k$,

$ t_i = v s_i \, #h(2em) tilde(s)_i = frac(s_j - s_k, sqrt(3)) \, #h(2em) sigma = 1 / 6 sum_i s_i^3 \, #h(2em) rho = 1 / 6 sum_i s_i^2 tilde(s)_i . $

Here $sum s_i = 0$ and $sum s_i^2 = 6$. On the plane of triples with zero sum, the map $s mapsto tilde(s)$ is a skew-adjoint orthogonal quarter-turn. Thus

$ sum_i tilde(s)_i = 0 \, #h(2em) sum_i tilde(s)_i^2 = 6 \, #h(2em) sum_i s_i tilde(s)_i = 0 \, #h(2em) s_i^2 + tilde(s)_i^2 = 4 . $

For later use, these identities imply

$ sigma^2 + rho^2 = 1 \, #h(2em) N / v^2 = "diag" \( sigma s_i + rho tilde(s)_i \) \, #h(2em) 1 / 6 sum_i tilde(s)_i^3 = - rho . $

Indeed, the trace-free triple $n_i = s_i^2 - 2$ has squared norm $6$: use $sum_i s_i^4 = \( sum_i s_i^2 \)^2 \/ 2 = 18$. Its coefficients in the orthogonal basis $s \, tilde(s)$ are $sigma \, rho$, proving the first two assertions. The last follows by factoring the alternating cubic $sum_i s_i^2 \( s_j - s_k \)$. If $r = x \/ v$, the other two eigenvalues besides $- r$ have sum $r$ and product $r^2 - 3$, so

$ 1 lt.eq r lt.eq 2 \, #h(2em) sigma = frac(3 r - r^3, 2) . $

The normalized triples are used only where the corresponding block is nonzero. On ${ v = 0 }$ set $sigma = rho = 0$. Since $\| sigma \| \, \| rho \| lt.eq 1$, their products with any positive power of $v$ have continuous zero extensions; in particular $sigma v^3 = "tr" \( T^3 \) \/ 6$ is smooth everywhere. Bars denote the analogous quantities for $U$.

The next formula gives, in particular, the refined Kato inequality $\| nabla T \|^2 gt.eq \( 5 \/ 3 \) \| nabla \| T \| \|^2$ for a half-Weyl block. Gursky–LeBrun derive this estimate from the same irreducible Bianchi gradient constraint [12] Lemma 4, Equations (10)–(12); Calderbank–Gauduchon–Herzlich give its general representation-theoretic setting [4] Equation (7.1). The explicit parametrization below, and the weak norm equation following it, are those of [20] Lemma 2.5 and Proposition 2.6. We retain all three vector parameters: the excess over the norm-gradient energy will be needed in the coupled estimate.

#thm([Lemma 2.5.])[
  (Parametrization of the Bianchi gradient space).  #emph[There are unique vectors $k \, l$ such that 
#[#set math.equation(numbering: n => "(2)")
 $ Z_(i i) = s_i p - sqrt(3) thin tilde(s)_i k \, #h(2em) Z_(j k) = - I_i (l + s_i k + tilde(s)_i / sqrt(3) p) \, #h(2em) \( i \, j \, k \) med upright("cyclic") \,\
e = 5 / 3 \| p \|^2 + 5 \| k \|^2 + \| l \|^2 . $ <eq:2>]

 More generally, for any fixed normalized trace-free diagonal triple $s$, the same formulas parametrize the entire algebraic space $G$ by three arbitrary real four-vectors.]
] <lem:gradient-parametrization>

#proof[
  Write $D_i = Z_(i i)$ and $a_i = I_i Z_(j k)$. Quaternion multiplication turns the three divergence equations into $D_i + a_j - a_k = 0$. Trace-freeness and the orthogonal basis $s \, tilde(s)$ give uniquely
  $ p = 1 / 6 sum_i s_i D_i \, #h(2em) k = - frac(1, 6 sqrt(3)) sum_i tilde(s)_i D_i \, #h(2em) D_i = s_i p - sqrt(3) thin tilde(s)_i k . $
  Since $s_j - s_k = sqrt(3) thin tilde(s)_i$ and $tilde(s)_j - tilde(s)_k = - sqrt(3) thin s_i$, the vectors $s_i k + tilde(s)_i p \/ sqrt(3)$ have exactly the differences required of the $a_i$. Their difference from $a_i$ is therefore a common vector $l$, proving the formulas and their converse. This also establishes their full algebraic scope.
  Orthogonality of $s \, tilde(s)$ gives
  $ sum_i \| Z_(i i) \|^2 = 6 \| p \|^2 + 18 \| k \|^2 \, #h(2em) 2 sum_(j < k) \| Z_(j k) \|^2 = 4 \| p \|^2 + 12 \| k \|^2 + 6 \| l \|^2 . $
  The factor two in the second sum is the Hilbert–Schmidt multiplicity of off-diagonal entries. Division by six proves the norm identity. For $Z = nabla T$, $nabla \| T \|^2 = 2 v sum_i s_i Z_(i i) = 12 v p$; comparison with $\| T \|^2 = 6 v^2$ identifies the parameter $p$ with $nabla v$. ◻
]

The pointwise norm equation alone is insufficient for integration: a Weyl block may vanish. We next prove that its regularized Laplacians converge to an actual integrable density, so no measure supported on the zero set is lost.

#thm([Proposition 2.6.])[
  (Weak norm equation, including the zero set).  #emph[The function $e \/ v$, defined to be zero on ${ v = 0 }$, belongs to $L^1 \( M \)$, and 
#[#set math.equation(numbering: n => "(3)")
 $ Delta v = 6 v \( 1 - sigma v \) + frac(e - \| p \|^2, v) $ <eq:3>]

 holds as an equality of distributions with an $L^1$ density. The quotient is zero almost everywhere on the zero set. This identity may be tested against bounded Lipschitz functions. The corresponding assertions hold for $b$.]
] <prop:weak-norm-equation>

#proof[
  On ${ v > 0 }$, pair the equation for $Delta T$ with $T$ to obtain
  $ Delta \( v^2 \) = 12 \( v^2 - sigma v^3 \) + 2 e . $
  This is globally an identity of smooth functions. Put $v_epsilon = sqrt(v^2 + epsilon^2)$. Direct differentiation gives
  $ Delta v_epsilon = frac(6 \( v^2 - sigma v^3 \), v_epsilon) + q_epsilon \, #h(2em) q_epsilon = e / v_epsilon - frac(v^2 \| p \|^2, v_epsilon^3) . $
  The refined derivative estimate in (2) yields
  $ 2 / 5 e / v_epsilon lt.eq q_epsilon lt.eq e / v_epsilon . $
  These assertions hold almost everywhere, including the zero set: every smooth component of $T$ has derivative zero almost everywhere on its zero set, hence $Z = 0$ almost everywhere on ${ T = 0 }$. One can see this elementary fact at density points of a level set; a nonzero derivative would instead make that scalar level set a local hypersurface.
  The first term in $Delta v_epsilon$ is uniformly bounded in absolute value by $6 \( v + v^2 \)$. Its integral is the negative of the integral of $q_epsilon$. Consequently $upright(bold(E)) \( e \/ v_epsilon \)$ is uniformly bounded. Monotone convergence proves the asserted $L^1$ bound for $e \/ v$. Off the zero set, $q_epsilon$ is dominated by $e \/ v$ and tends to $\( e - \| p \|^2 \) \/ v$; on the zero set both are zero almost everywhere. Dominated convergence therefore gives an $L^1$ limit, rather than only a weak limit of measures. The zeroth-order term converges in $L^1$ as well. Since $v_epsilon arrow.r v$ uniformly, their Laplacians converge distributionally, proving (3) without a residual singular measure.
  Finally, approximate a bounded Lipschitz test function uniformly and in $H^1$ by smooth functions, using local mollification and a partition of unity. Uniform convergence controls its pairing with the $L^1$ right side, and $H^1$ convergence controls its gradient pairing with $nabla v$. This proves the asserted testing rule. ◻
]

== 3 Scalar estimates and the characteristic identities <sec:analytic>

This section supplies two kinds of global information: analytic bounds for the sizes of the Weyl blocks, and integer identities relating their second moments to volume. The former will control derivatives in the coupled inequality; the latter will restrict the possible imbalance between the two blocks.

Throughout, $M$ is the closed, simply connected, oriented Einstein four-manifold obtained in the introduction, with $"Ric" = 3 g$ and nonnegative sectional curvature. We adapt the scalar estimates of [20] Propositions 3.1–3.4. The weighted variance proof uses the closed bound $x + y lt.eq 2$; the norm-gap proof uses only the Einstein equation and handles zeros directly.

=== 3.1 A strengthened scalar variance estimate <a-strengthened-scalar-variance-estimate>

#thm([Proposition 3.1.])[
  (Weighted variance).  #emph[For every real $a in H^1 \( M \)$, 
#[#set math.equation(numbering: n => "(4)")
 $ "Var" \( a \) := upright(bold(E)) #scale(x: 120%, y: 120%)[\[] \( a - upright(bold(E)) a \)^2 #scale(x: 120%, y: 120%)[\]] lt.eq upright(bold(E)) frac(\| nabla a \|^2, K) \, #h(2em) K = 4 + v^2 + b^2 . $ <eq:4>]

]
] <prop:weighted-variance>

#proof[
  First let $phi.alt$ be smooth and write $S = "Hess"_0 phi.alt$. The integrated Bochner identity and $"Ric" = 3 g$ give
  $ upright(bold(E)) #scale(x: 120%, y: 120%)[\[] \( Delta phi.alt \)^2 #scale(x: 120%, y: 120%)[\]] = upright(bold(E)) (4 \| nabla phi.alt \|^2 + 4 / 3 \| S \|^2) . $
  Define operators on covariant two-tensors by
  $ \( T_D \)_(i k j l) = 1 / 2 sum_s t_s I_(s \, i k) I_(s \, j l) \, #h(2em) \( U_D \)_(i k j l) = 1 / 2 sum_s u_s J_(s \, i k) J_(s \, j l) \, $
  where $i j$ is the row index and $k l$ is the column index. These tensorial definitions may be evaluated after pointwise diagonalization. They annihilate metric trace. On the symmetric trace-free tensors, the nine matrices $I_i J_j$ form an orthogonal basis, with $T_D$ and $U_D$ eigenvalues $t_i$ and $u_j$. For example, $T_D$ acts by $- 1 / 2 sum_s t_s I_s \( thin dot.op thin \) I_s$; the quaternion relations give the eigenvalue $t_i$ on $I_i J_j$. Thus
  $ T_D + U_D lt.eq 2 \( x + y \) "Id" lt.eq 4 "Id" $
  on this space.
  The integrated curvature contraction has a useful sign and a precise coefficient. Since $T_D$ annihilates trace, replace $S$ by $"Hess" phi.alt$ in its quadratic form. Integrate the derivative $k$, use $nabla_k \( T_D \)_(i k j l) = 0$, and use skewness in $i \, k$ to obtain
  $ upright(bold(E)) chevron.l T_D S \, S chevron.r & = - upright(bold(E)) \( T_D \)_(i k j l) phi.alt_l nabla_k nabla_i phi.alt_j\
 & = 1 / 2 upright(bold(E)) \( T_D \)_(i k j l) R_(i k j a) phi.alt_a phi.alt_l . $
  In this contraction the minus curvature block is orthogonal to the plus block. Substituting their expansions gives
  $ 1 / 2 sum_(i k j) \( T_D \)_(i k j l) R_(i k j a) = 1 / 2 sum_s t_s \( 1 + t_s \) sum_j I_(s \, j l) I_(s \, j a) = 3 v^2 delta_(l a) . $
  The final equality uses $sum t_s = 0$ and $sum t_s^2 = 6 v^2$. Consequently
  $ upright(bold(E)) chevron.l \( T_D + U_D \) S \, S chevron.r = 3 upright(bold(E)) #scale(x: 120%, y: 120%)[\[] \( v^2 + b^2 \) \| nabla phi.alt \|^2 #scale(x: 120%, y: 120%)[\]] . $
  The pointwise upper operator bound, inserted into the positive $\| S \|^2$ term of the Bochner identity, now yields
  $ upright(bold(E)) #scale(x: 120%, y: 120%)[\[] \( Delta phi.alt \)^2 #scale(x: 120%, y: 120%)[\]] gt.eq upright(bold(E)) K \| nabla phi.alt \|^2 . $
  For smooth $a$, the Poisson equation on a closed connected manifold gives a unique smooth zero-mean solution of $Delta phi.alt = a - upright(bold(E)) a$. Integration by parts and Cauchy–Schwarz with the pointwise weight $K$ give
  $ "Var" \( a \) & = - upright(bold(E)) chevron.l nabla a \, nabla phi.alt chevron.r\
 & lt.eq (upright(bold(E)) frac(\| nabla a \|^2, K))^(1 \/ 2) (upright(bold(E)) K \| nabla phi.alt \|^2)^(1 \/ 2)\
 & lt.eq (upright(bold(E)) frac(\| nabla a \|^2, K))^(1 \/ 2) "Var" \( a \)^(1 \/ 2) . $
  Division proves the assertion when the variance is nonzero; the zero case is immediate. Smooth approximation in $H^1$ completes the proof: $K$ is bounded above and below by positive constants, so the weighted energy also converges. ◻
]

=== 3.2 The sharp scalar inequality and the Weyl gap <the-sharp-scalar-inequality-and-the-weyl-gap>

The following is the four-dimensional Einstein case of Ilias’s sharp positive-Ricci Sobolev inequality [15] Theorem 3; see also [20] Proposition 3.2 for this normalization. The use of normalized volume makes its constants independent of $"Vol" \( M \)$.

#thm([Proposition 3.2.])[
  (Normalized Sobolev inequality).  #emph[For every real $f in H^1 \( M \)$, 
$ #scale(x: 120%, y: 120%)[\(] upright(bold(E)) \| f \|^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq upright(bold(E)) (f^2 + 1 / 2 \| nabla f \|^2) . $

]
] <prop:sharp-sobolev>

The next proposition is the Weyl-norm gap established in Gursky–LeBrun [12] Theorem 1; we give the derivation in our normalization, following [20] Proposition 3.3. The regularization is included because neither Weyl norm is assumed to be everywhere positive.

#thm([Proposition 3.3.])[
  (Weyl-norm gap).  #emph[For either Weyl block, 
#[#set math.equation(numbering: n => "(5)")
 $ v equiv 0 #h(2em) upright("or") #h(2em) upright(bold(E)) v^2 gt.eq 1 . $ <eq:5>]

 If $T equiv.not 0$ and $upright(bold(E)) v^2 = 1$, then $nabla T = 0$ and $v = sigma = 1$. The corresponding statements hold for $U$.]
] <prop:weyl-gap>

#proof[
  Put $A_epsilon = v^2 + epsilon^2$ and $f_epsilon = A_epsilon^(1 \/ 6)$. These are smooth functions. The equation for $Delta \( v^2 \)$ and (2) give
  $ Delta f_epsilon = A_epsilon^(- 5 \/ 6) [2 \( v^2 - sigma v^3 \) + 1 / 3 e - 5 / 9 v^2 / A_epsilon \| p \|^2] gt.eq 2 A_epsilon^(- 5 \/ 6) \( v^2 - v^3 \) . $
  Indeed, $sigma lt.eq 1$, $v^2 \/ A_epsilon lt.eq 1$, and $e gt.eq 5 \| p \|^2 \/ 3$. Multiply by $f_epsilon$ and integrate:
  $ upright(bold(E)) \| nabla f_epsilon \|^2 lt.eq 2 upright(bold(E)) frac(v^3 - v^2, A_epsilon^(2 \/ 3)) lt.eq 2 upright(bold(E)) v^(5 \/ 3) . $
  Their $L^2$ norms are uniformly bounded as well. Thus $f_epsilon$ is bounded in $H^1$, and its uniform limit $f = v^(1 \/ 3)$ belongs to $H^1$ by weak compactness. This bound is obtained directly from the regularized equation; it requires no positive lower bound on $v$.
  Apply Proposition 10 to $f_epsilon$ and use the preceding energy bound:
  $ #scale(x: 120%, y: 120%)[\(] upright(bold(E)) f_epsilon^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) & lt.eq upright(bold(E)) [A_epsilon^(1 \/ 3) + frac(v^3 - v^2, A_epsilon^(2 \/ 3))]\
 & = upright(bold(E)) frac(epsilon^2 + v^3, A_epsilon^(2 \/ 3)) . $
  The term $epsilon^2 \/ A_epsilon^(2 \/ 3)$ is at most $epsilon^(2 \/ 3)$, while $v^3 \/ A_epsilon^(2 \/ 3) lt.eq v^(5 \/ 3)$. Dominated convergence therefore gives
  $ #scale(x: 120%, y: 120%)[\(] upright(bold(E)) f^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) lt.eq upright(bold(E)) \( f^2 v \) lt.eq #scale(x: 120%, y: 120%)[\(] upright(bold(E)) f^4 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] upright(bold(E)) v^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  When $T equiv.not 0$, the common factor is positive, proving (5).
  If $upright(bold(E)) v^2 = 1$, equality holds in Cauchy–Schwarz. Thus $v = alpha f^2$ almost everywhere for a constant $alpha > 0$. It follows that $v$ takes only the values $0$ and $alpha^3$ almost everywhere, and hence everywhere by continuity. Connectedness and $T equiv.not 0$ force the positive constant value on all of $M$. The moment condition gives $v = 1$. Equation (3) then becomes $0 = 6 \( 1 - sigma \) + e$. Both terms are nonnegative, so $sigma = 1$ and $e = 0$. Smoothness gives $nabla T = 0$ everywhere. ◻
]

=== 3.3 The Euler and signature formulas <the-euler-and-signature-formulas>

#thm([Proposition 3.4.])[
  (Characteristic identities).  #emph[Let $n_(+)$ and $n_(-)$ be the finite nonnegative integer dimensions of the spaces of harmonic self-dual and anti-self-dual two-forms. The Euler characteristic and signature of $M$ are, respectively, 
$ chi = 2 + n_(+) + n_(-) \, #h(2em) tau = n_(+) - n_(-) . $

 Then 
#[#set math.equation(numbering: n => "(6)")
 $ 8 pi^2 chi & = 6 "Vol" \( M \) #scale(x: 120%, y: 120%)[\(] 1 + upright(bold(E)) \( v^2 + b^2 \) #scale(x: 120%, y: 120%)[\)] \,\
12 pi^2 tau & = 6 "Vol" \( M \) thin upright(bold(E)) \( v^2 - b^2 \) . $ <eq:6>]

]
] <prop:characteristic-identities>

#proof[
  Simple connectivity gives $b_1 \( M \) = 0$, and Poincaré duality gives $b_3 \( M \) = 0$. Hodge theory identifies $b_2 = n_(+) + n_(-)$ and the signature with $n_(+) - n_(-)$, proving the first two identities. The Chern–Gauss–Bonnet and signature formulas for an Einstein four-manifold are
  $ 8 pi^2 chi = integral_M (\| T \|^2 + \| U \|^2 + R^2 / 24) thin d "vol" \, #h(2em) 12 pi^2 tau = integral_M \( \| T \|^2 - \| U \|^2 \) thin d "vol" \, $
  where $R = 12$ is the scalar curvature and the Weyl norms are the Hilbert–Schmidt operator norms used here; compare [20] Proposition 3.4 and [11] Theorems 1.7.6 and 4.8.16. Substitution of $\| T \|^2 = 6 v^2$ and $\| U \|^2 = 6 b^2$ proves (6). ◻
]

== 4 Upper volume deficit and balanced Weyl moments <sec:volume>

Write $V_M = "Vol" \( M \, g \)$ and $s_0 = upright(bold(E)) \( v^2 + b^2 \)$. Our goal in this section is to prove that the two second moments agree whenever neither Weyl block vanishes. The characteristic identities turn an upper polar-volume deficit into an integer restriction; a weighted scalar variance estimate then excludes the sole remaining unequal-moment case.

The argument follows [20] Propositions 4.1 and 4.9. Its radial comparison uses a discrete Jacobi determinant, so curvature matrices at different times need not commute. We give the upper comparison in full; its global input is the Bonnet–Myers diameter bound, which depends only on the positive Ricci lower bound.

#thm([Proposition 4.1.])[
  (Upper volume deficit).  #emph[One has 
#[#set math.equation(numbering: n => "(7)")
 $ frac(V_M, 8 pi^2 \/ 3) lt.eq 1 - 3 / 40 s_0 . $ <eq:7>]

]
] <prop:upper-volume-deficit>

Here is how the estimate will be used. If both blocks are nonzero, their gaps and $v + b lt.eq 2$ give $2 lt.eq s_0 < 4$: the strict upper bound will follow from connectedness and nonvanishing of both blocks. Equations (6) and (7) then imply $chi < 7$ and $\| tau \| \/ chi < 4 \/ 15$. The parity and nonnegativity constraints from $n_plus.minus$ leave only $\( chi \, \| tau \| \) = \( 5 \, 1 \)$ when $tau eq.not 0$. The last part of this section rules out that case and proves Proposition 20. We first establish the upper deficit, then prove the scalar moment obstruction that excludes this last integer case.

Along a unit-speed geodesic, choose a parallel orthonormal normal frame and let $cal(R) \( t \)$ be the normal Jacobi curvature matrix. Set

$ A \( t \) = cal(R) \( t \) - upright("Id") \, #h(2em) cal(J)'' + cal(R) cal(J) = 0 \, #h(2em) cal(J) \( 0 \) = 0 \, quad cal(J)' \( 0 \) = upright("Id") \, #h(2em) D \( t \) = det cal(J) \( t \) . $

Nonnegative sectional curvature and $"Ric" = 3 g$ give $0 lt.eq cal(R) lt.eq 3 upright("Id")$ and $"tr" A = 0$. Let $cal(E)$ denote integration over the unit tangent bundle against normalized Riemannian measure on the base and normalized spherical measure in the fibers.

#thm([Lemma 4.2.])[
  (Geodesic averages).  #emph[At every time along the geodesic flow, 
#[#set math.equation(numbering: n => "(8)")
 $ cal(E) \| A \|^2 = 3 / 2 s_0 \, #h(2em) cal(E) \| A' \|^2 lt.eq 3 / 2 thin cal(E) \| A \|^2 . $ <eq:8>]

]
] <lem:geodesic-averages>

#proof[
  The indicated probability measure is invariant under geodesic flow. Indeed, in cotangent coordinates the Hamiltonian flow of kinetic energy preserves canonical volume: its divergence vanishes by equality of the mixed second derivatives of the Hamiltonian. Applying this observation to energy shells gives invariance of the measure on the unit-energy level. In orthonormal fiber coordinates this is precisely Riemannian base volume times spherical measure.
  The plus and minus contributions to $A$ are orthogonal conjugates of $T \/ 2$ and $U \/ 2$, using the normal bases $I_s dot(gamma)$ and $J_s dot(gamma)$. The same description applies to their derivatives in parallel frames. The mixed contractions have zero spherical average: they are invariant bilinear pairings between the inequivalent types $\( 2 \, 0 \)$ and $\( 0 \, 2 \)$, or between $\( 5 \/ 2 \, 1 \/ 2 \)$ and $\( 1 \/ 2 \, 5 \/ 2 \)$. Consequently,
  $ cal(E) \| A \|^2 = 1 / 4 upright(bold(E)) \( \| T \|^2 + \| U \|^2 \) \, #h(2em) cal(E) \| A' \|^2 = 1 / 16 upright(bold(E)) \( \| nabla T \|^2 + \| nabla U \|^2 \) . $
  Here the second factor $1 \/ 4$ in the derivative identity is the spherical average of a squared directional derivative in four dimensions. Integrating the equation for $Delta T$ yields
  $ upright(bold(E)) e = 6 upright(bold(E)) \( sigma v^3 - v^2 \) lt.eq 6 upright(bold(E)) v^2 \, $
  since $sigma lt.eq 1$ and $v lt.eq 2$. The exchanged identity gives the same bound for $macron(e)$. The stated formulas follow. ◻
]

=== 4.1 Minimizing geodesics and upper polar integration <minimizing-geodesics-and-upper-polar-integration>

The Ricci normalization gives $"diam" M lt.eq pi$ by the Bonnet–Myers theorem [18]. To recall the relevant index-form argument, let $gamma$ be a unit-speed minimizing segment of length $L$, and choose three parallel orthonormal normal fields $E_i$. The sum of the index forms of $sin \( pi t \/ L \) E_i$ is

$ sum_(i = 1)^3 I \( sin \( pi t \/ L \) E_i \, sin \( pi t \/ L \) E_i \) = frac(3 L, 2) (pi^2 / L^2 - 1) . $

It must be nonnegative, so $L lt.eq pi$. The second-variation theorem also implies that a minimizing segment has no conjugate point in its interior. A conjugate endpoint is allowed. These are all the global geodesic facts needed below.

Put $D_c \( t \) = D \( t \)$ before the first conjugate time and $D_c \( t \) = 0$ at and after it.

#thm([Lemma 4.3.])[
  (Upper polar bound).  #emph[One has 
$ V_M lt.eq 2 pi^2 integral_0^pi cal(E) D_c \( t \) thin d t . $

]
] <lem:upper-polar>

#proof[
  Fix a center $p$ and take all vectors of length less than $pi$ whose radial geodesics have no conjugate point at or before their endpoints. This is an open set: the Jacobi determinant divided by $t^3$, continued as $1$ at zero, has a positive minimum on each such radial interval. Every point is the exponential image of a minimizing vector of length at most $pi$ by the diameter bound. A minimizing vector is in this open set unless it is critical for $exp_p$, has length $pi$, or is zero.
  The exponential map is smooth with bounded derivative on the closed radius-$pi$ ball. The area formula with multiplicity states that the integral of its absolute Jacobian over a measurable set equals the integral of the number of preimages over its image. In particular, critical vectors and the boundary sphere have images of zero four-dimensional volume: their respective Jacobian integral and domain volume are zero. On the open preconjugate set the determinant is positive. For a vector $t xi$, the Cartesian Jacobian of $exp_p$ is $D \( t \, xi \) \/ t^3$ on this set. The area formula therefore bounds $V_M$ by the integral of this Jacobian, with multiplicities only increasing that integral. Nonconjugate cut vectors are included in the set; no identification of cut points with conjugate points is used. Polar coordinates give the claimed bound at each center, since the area of the unit three-sphere is $2 pi^2$. Average over centers and use Tonelli’s theorem. ◻
]

=== 4.2 Discrete determinant comparisons <discrete-determinant-comparisons>

The upper polar bound reduces the volume problem to estimates for a matrix Jacobi determinant. We approximate the Jacobi equation by a finite Dirichlet matrix. Its Schur complements and sine-mode compressions retain the order of matrix multiplication, without requiring simultaneous diagonalization along the geodesic. The following two lemmas reproduce [20] Lemmas 4.5–4.6; the curvature bounds used in the second lemma are non-strict.

#thm([Lemma 4.4.])[
  (The discrete Jacobi determinant).  #emph[Fix a smooth symmetric normal curvature matrix on $\[ 0 \, t \]$, put $a = t \/ N$, and let $cal(L)_N$ be the block tridiagonal matrix on nodes $1 \, dots.h \, N - 1$ with diagonal blocks $2 upright("Id") - a^2 cal(R) \( i a \)$ and off-diagonal blocks $- upright("Id")$. Then 
$ a^3 det cal(L)_N arrow.r D \( t \) . $

 If $t$ is before the first conjugate time, $cal(L)_N$ is positive definite for all sufficiently large $N$. The Jacobi convergence is uniform over families with uniformly bounded coefficients and first derivatives.]
] <lem:discrete-jacobi>

#proof[
  Define matrices without using inverses by
  $ Y_0 = 0 \, quad Y_1 = upright("Id") \, #h(2em) Y_(i + 1) = \( 2 upright("Id") - a^2 cal(R) \( i a \) \) Y_i - Y_(i - 1) . $
  The position $a Y_i$ and backward velocity $Y_i - Y_(i - 1)$ evolve by first changing velocity by $- a cal(R) \( i a \) \( a Y_i \)$ and then changing position by $a$ times the new velocity. On the exact Jacobi solution one step has error $O \( a^2 \)$, while the update amplifies errors by at most $1 + C a$. Iteration proves convergence of position and velocity, uniformly on the fixed interval. The constants are uniform under the stated coefficient bounds.
  Suppose first that $t$ is preconjugate. Away from zero the exact Jacobi matrix is invertible with uniformly bounded inverse on compact time intervals, so the converging $a Y_i$ are invertible there. Near zero use the identity, still without inverses,
  $ Y_i = i upright("Id") - a^2 sum_(r < i) \( i - r \) cal(R) \( r a \) Y_r . $
  For sufficiently small fixed $i a$ it gives $max_(r lt.eq i) \| Y_r \| lt.eq C i$ by absorbing the error, and then $Y_i \/ i = upright("Id") + O \( \( i a \)^2 \)$. Thus all the early matrices are invertible as well. All inverses needed for elimination have now been obtained independently of that elimination.
  The Schur blocks are
  $ S_i = Y_(i + 1) Y_i^(- 1) = 2 upright("Id") - a^2 cal(R) \( i a \) - S_(i - 1)^(- 1) . $
  They are symmetric, starting with $S_1 = 2 upright("Id") - a^2 cal(R) \( a \)$. Near zero they differ from $\( \( i + 1 \) \/ i \) upright("Id")$ by $O \( \( i a \)^2 + a^2 \)$; away from zero, convergence of position and velocity gives $S_i = upright("Id") + O \( a \)$. Choose the small initial interval first, and then $N$ large. All Schur blocks are positive definite. Block elimination proves positivity of $cal(L)_N$ and gives
  $ det cal(L)_N = product_(i = 1)^(N - 1) det S_i = det Y_N . $
  The desired limit follows. The determinant identity holds for arbitrary coefficients by continuity, since invertible Schur blocks form a dense set; convergence therefore gives the limit without the preconjugacy assumption as well. ◻
]

#thm([Lemma 4.5.])[
  (Upper radial comparison).  #emph[For $0 < t < pi$, set 
$ beta = frac(t^2, pi^2 - t^2) \, #h(2em) B = 2 / t integral_0^t A \( s \) sin^2 \( pi s \/ t \) thin d s . $

 Before conjugacy, 
$ D \( t \) lt.eq sin^3 t thin det \( upright("Id") - beta B \) \, #h(2em) upright("Id") - beta B succ.curly.eq 0 . $

 At every time $0 < t < pi$, 
$ 1 - frac(D_c \( t \), sin^3 t) gt.eq 1 / 6 min { 1 \, beta^2 max \( 1 \, 3 - beta \) } thin \| B \|^2 . $

]
] <lem:upper-radial>

#proof[
  Compare $cal(L)_N$ with the matrix for $cal(R) = upright("Id")$, whose scalar sine-mode eigenvalues are $2 - 2 cos \( k pi \/ N \) - a^2$. They are positive for large $N$ because $t < pi$. Normalize $cal(L)_N$ by the inverse square root of this comparison matrix. The resulting positive matrix has trace $3$ on every diagonal sine-mode block, since $"tr" A \( i a \) = 0$.
  Split off its first three-dimensional mode and write the normalized matrix as $mat(delim: "(", P, C; C^(*), Q)$. Its Schur complement is positive and bounded above by $Q$. Thus
  $ det mat(delim: "(", P, C; C^(*), Q) = det P thin det \( Q - C^(*) P^(- 1) C \) lt.eq det P thin det Q lt.eq det P . $
  The last inequality is arithmetic–geometric mean, since $"tr" Q = dim Q$. The first-mode compression tends to $upright("Id") - beta B$, because its normalized sine vector has entries $sqrt(2 \/ N) sin \( pi i \/ N \)$ and
  $ frac(a^2, 2 - 2 cos \( pi \/ N \) - a^2) arrow.r beta . $
  Lemma 16 gives the determinant ratio limit $D \( t \) \/ sin^3 t$. Positive compressions have a positive semidefinite limit, and no inverse of that limiting compression is used. This proves the first comparison.
  The eigenvalues of $B$ lie in $\[ - 1 \, 2 \]$ and sum to zero, so $\| B \|^2 lt.eq 6$. Before conjugacy the determinant loss is
  $ 1 - det \( upright("Id") - beta B \) = beta^2 / 2 \| B \|^2 + beta^3 det B . $
  Only $det B < 0$ is unfavorable. Write the eigenvalues then as $- r \, a_1 \, a_2$, where $a_1 \, a_2 gt.eq 0$ and $a_1 + a_2 = r$. One has
  $ \| det B \| lt.eq r / 6 \| B \|^2 \, #h(2em) r lt.eq 1 \, #h(2em) beta r lt.eq 2 . $
  The first inequality follows from $\( a_1 - a_2 \)^2 gt.eq 0$; the last follows from $beta a_i lt.eq 1$. These inequalities give the displayed loss bound. If $det B gt.eq 0$ the same bound is immediate. After conjugacy its left side is $1$, so $\| B \|^2 lt.eq 6$ gives it directly. ◻
]

=== 4.3 An exact constant for the upper deficit <an-exact-constant-for-the-upper-deficit>

Define

$ f \( u \) = cases(delim: "{", u^4 \( 3 + 5 u^2 + 6 u^4 \) \, & 0 lt.eq u lt.eq 5 \/ 8 \,, 15 \/ 16 \, & 5 \/ 8 < u lt.eq 1 .) $

The polar and radial comparisons will show that the coefficient of $s_0$ saved from the round volume is at least

$ eta_(+) = frac(9 pi, 48) integral_0^1 f \( u \) \( 1 - u^2 \/ 2 \) sin^3 \( pi u \) thin d u . $

Thus $eta_(+) > 3 \/ 40$ will prove Proposition 13. We first establish an exact lower bound for this integral using a rational sine minorant, then complete the comparison argument. The certificate is the one in [20] Section 4.

#thm([Lemma 4.6.])[
  (A rational sine minorant).  #emph[Put 
$ a_0 = 157 / 50 \, #h(2em) b_0 = 22 / 7 \, #h(2em) S \( z \) = a_0 z - frac(\( b_0 z \)^3, 6) + frac(\( a_0 z \)^5, 120) - frac(\( b_0 z \)^7, 5040) . $

 The constants satisfy $a_0 < pi < b_0$, and $0 lt.eq S \( z \) lt.eq sin \( pi z \)$ for $0 lt.eq z lt.eq 1 \/ 2$. Its coefficients are 
$ S \( z \) = 157 / 50 z - 5324 / 1029 z^3 + 95388992557 / 37500000000 z^5 - 155897368 / 259416045 z^7 . $

]
] <lem:sine-minorant>

#proof[
  The elementary bounds $a_0 < pi < b_0$ and the alternating sine expansion through the negative seventh-degree term give $S \( z \) lt.eq sin \( pi z \)$ on this interval. Also
  $ S \( z \) gt.eq z (a_0 - b_0^3 / 24 - b_0^7 / 322560) gt.eq 9 / 5 z gt.eq 0 . $
  Expanding the four powers gives the displayed rational coefficients. ◻
]

The following strict rational lower bounds include the prefactor. The rows use the indicated polynomial representatives up to their shared endpoints, which do not affect the integrals.

#[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Integrand and prefactor
], table.cell(rowspan: 1, colspan: 1)[Interval
], table.cell(rowspan: 1, colspan: 1)[Degree
], table.cell(rowspan: 1, colspan: 1)[Lower bound
]),
  table.cell(rowspan: 1, colspan: 1)[$frac(9 a_0, 48) f \( u \) \( 1 - u^2 \/ 2 \) S \( min \( u \, 1 - u \) \)^3$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \/ 2 \]$
], table.cell(rowspan: 1, colspan: 1)[31
], table.cell(rowspan: 1, colspan: 1)[$11869 \/ 10^6$
],
  table.cell(rowspan: 1, colspan: 1)[same
], table.cell(rowspan: 1, colspan: 1)[$\[ 1 \/ 2 \, 5 \/ 8 \]$
], table.cell(rowspan: 1, colspan: 1)[31
], table.cell(rowspan: 1, colspan: 1)[$30175 \/ 10^6$
],
  table.cell(rowspan: 1, colspan: 1)[same
], table.cell(rowspan: 1, colspan: 1)[$\[ 5 \/ 8 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[$39518 \/ 10^6$
],
)
]

For a rational polynomial $p \( u \) = sum c_j u^j$ on $\[ r \, s \]$, these values are obtained from $integral_r^s p \( u \) thin d u = sum c_j \( s^(j + 1) - r^(j + 1) \) \/ \( j + 1 \)$. The three rows sum to more than $163 \/ 2000 > 2 \/ 25$; the cubic power $S^3$ is essential in each row.

#proof[
  For the sine-squared probability weight defining $B$, its time variance is $t^2 \( 1 \/ 12 - 1 \/ \( 2 pi^2 \) \)$. The variance identity and (8) give
  $ cal(E) \| B \|^2 gt.eq cal(E) \| A \|^2 (1 - 3 / 2 t^2 (1 / 12 - frac(1, 2 pi^2))) . $
  Indeed, parallel identification along a geodesic and Cauchy–Schwarz show $cal(E) \| A \( s \) - A \( r \) \|^2 lt.eq \( s - r \)^2 cal(E) \| A' \|^2$. With $u = t \/ pi$ the factor in parentheses is at least $1 - u^2 \/ 2$. For $0 lt.eq u < 1$, furthermore,
  $ f \( u \) lt.eq min { 1 \, beta^2 max \( 1 \, 3 - beta \) } \, #h(2em) beta = frac(u^2, 1 - u^2) . $
  At $u = 1$ we give the capped comparison function its continuous value $1$. For $u lt.eq 5 \/ 8$, comparison with $beta^2 \( 3 - beta \)$ reduces to $6 - 13 u^2 + 6 u^4 gt.eq 0$. On this interval $f$ is increasing and $f \( 5 \/ 8 \) = 7511875 \/ 8388608 < 1$, which also verifies the cap by $1$. The comparison function $min { 1 \, beta^2 max \( 1 \, 3 - beta \) }$, as a function of $u$, is nondecreasing and remains $1$ after it first reaches $1$; at $u = 5 \/ 8$ its value is $57500 \/ 59319 > 15 \/ 16$, which handles the rest of the interval. Lemmas 15 and 17 therefore show that the coefficient of $s_0$ saved from the round volume is at least $eta_(+)$. The three rational bounds above give $eta_(+) > 2 \/ 25 > 3 \/ 40$, proving (7). ◻
]

=== 4.4 Balanced moments and the exceptional signature case <balanced-moments-and-the-exceptional-signature-case>

The volume estimate leaves a single possible unequal-moment integer case. The following constrained-moment lemma from [20] Lemma 4.8 will exclude it. We first apply the lemma to the distribution of the smaller Weyl norm, deriving its two moment constraints and the variance inequality that contradicts its conclusion. We then prove the lemma, including both endpoints of $\[ 0 \, 2 \]$.

For $0 lt.eq z lt.eq 2$, define

$ H \( z \) = sqrt(z) (1 + z^2 / 40 - z^4 / 1152) \, #h(2em) Phi \( z \) = 16 H \( z \)^2 + 9 z \( 1 - z \) . $

#thm([Lemma 4.7.])[
  (Two constrained moments).  #emph[Every probability measure $mu$ on $\[ 0 \, 2 \]$ satisfying 
$ integral z^2 thin d mu gt.eq 1 \, #h(2em) integral \( 28 z + 6 z^2 \) thin d mu lt.eq 25 $

 satisfies 
$ 16 (integral H thin d mu)^2 - integral Phi thin d mu < 0 . $

]
] <lem:moment-obstruction>

#thm([Proposition 4.8.])[
  (Balanced Weyl moments).  #emph[If neither Weyl block is identically zero, then $tau = 0$ and $upright(bold(E)) v^2 = upright(bold(E)) b^2$.]
] <prop:balanced-moments>

#proof[
  The two Weyl gaps give $s_0 gt.eq 2$, while $v + b lt.eq 2$ gives $v^2 + b^2 lt.eq 4$. If $s_0 = 4$, continuity forces equality at every point. The only possible norm pairs would then be $\( v \, b \) = \( 2 \, 0 \)$ and $\( 0 \, 2 \)$. Connectedness makes the pair constant, contradicting that neither block vanishes identically. Hence $2 lt.eq s_0 < 4$. Equations (6) and (7) give
  $ chi lt.eq 2 \( 1 - 3 s_0 \/ 40 \) \( 1 + s_0 \) < 7 \, #h(2em) frac(\| tau \|, chi) = 2 / 3 frac(\| upright(bold(E)) v^2 - upright(bold(E)) b^2 \|, 1 + s_0) lt.eq 2 / 3 frac(s_0 - 2, 1 + s_0) < 4 / 15 . $
  Here the first polynomial is increasing on $\[ 2 \, 4 \]$ and equals $7$ at $4$. The integers $chi = 2 + n_(+) + n_(-)$ and $tau = n_(+) - n_(-)$ have the same parity. If $tau eq.not 0$, the only possibility is $chi = 5$, $\| tau \| = 1$. Exchange the blocks so that $P = upright(bold(E)) b^2$ is the smaller moment. The ratio in (6) then gives
  $ upright(bold(E)) v^2 = frac(13 P + 3, 7) . $
  Combining this with $v^2 lt.eq \( 2 - b \)^2$ yields
  $ P gt.eq 1 \, #h(2em) 28 upright(bold(E)) b + 6 P lt.eq 25 . $
  Integrating (3) for $b$, using $macron(sigma) lt.eq 1$ and $macron(e) gt.eq 5 \| nabla b \|^2 \/ 3$, gives
  $ P - upright(bold(E)) b gt.eq 4 / 9 upright(bold(E)) \| nabla sqrt(b) \|^2 . $
  To justify the square root at zeros, put $c_epsilon = sqrt(b + epsilon)$. Then $\| nabla c_epsilon \|^2 = \| q \|^2 \/ \( 4 \( b + epsilon \) \)$ is dominated off ${ b = 0 }$ by the integrable function $\| q \|^2 \/ \( 4 b \) lt.eq 3 macron(e) \/ \( 20 b \)$, and is zero almost everywhere on that set. The gradient vectors converge in $L^2$ by dominated convergence to $q \/ \( 2 sqrt(b) \)$ off the zero set and to zero on it. Together with uniform convergence of $c_epsilon$, this identifies the weak derivative of $c = sqrt(b) in H^1$ and gives $\| nabla c \|^2 = \| q \|^2 \/ \( 4 b \)$ under our zero-set convention. Put
  $ G \( c \) = c + c^5 / 40 - c^9 / 1152 \, #h(2em) H \( b \) = G \( c \) . $
  The range of $c$ is bounded, and $G$ has bounded derivative there, so the Sobolev chain rule applies, including at $c = 0$. On $0 lt.eq b lt.eq 2$,
  $ G' \( c \) = 1 + b^2 / 8 - b^4 / 128 in [0 \, sqrt(4 + b^2) / 2] subset.eq [0 \, sqrt(K) / 2] . $
  For the first upper bound, put $z = b^2 \/ 4 in \[ 0 \, 1 \]$ and square the positive quantity $1 + z \/ 2 - z^2 \/ 8$; its square is $1 + z - z^3 \/ 8 + z^4 \/ 64 lt.eq 1 + z$. The variance inequality (4), extended by Sobolev approximation, therefore gives
  $ "Var" \( H \( b \) \) lt.eq 1 / 4 upright(bold(E)) \| nabla sqrt(b) \|^2 lt.eq 9 / 16 \( P - upright(bold(E)) b \) . $
  Equivalently,
  #[#set math.equation(numbering: n => "(9)")
   $ J := 16 \( upright(bold(E)) H \( b \) \)^2 - upright(bold(E)) Phi \( b \) gt.eq 0 \, #h(2em) Phi \( b \) = 16 H \( b \)^2 + 9 b \( 1 - b \) . $ <eq:9>]
  The distribution of $b$ is a probability measure on $\[ 0 \, 2 \]$ satisfying the two moment constraints. Lemma 19 contradicts (9). Thus $tau = 0$, and (6) gives equality of the two second moments. ◻
]

=== 4.5 Proof of the constrained-moment inequality <proof-of-the-constrained-moment-inequality>

The geometric argument has reduced the exceptional signature case to Lemma 19. If the functional in that lemma had a nonnegative maximum, we will show that a maximizing measure would have support ${ w \, 2 }$ for some $0 < w < 1$. Explicit polynomial inequalities then exclude every feasible weight on those two points.

#proof[
  The feasible measures form a nonempty weakly compact convex set. Suppose the continuous functional $J \( mu \) = 16 \( integral H thin d mu \)^2 - integral Phi thin d mu$ has a nonnegative maximum, attained at $mu$, and set $d = integral H thin d mu$. First $d gt.eq 11 \/ 20$. Indeed,
  $ 1 + z^2 \/ 40 - z^4 \/ 1152 gt.eq 1 + \( 31 \/ 1440 \) z^2 \, $
  and
  $ 25 + 31 / 45 z^2 - 346 / 25 z gt.eq 17 / 225 > 0 #h(2em) \( 0 lt.eq z lt.eq 2 \) . $
  The last quadratic is decreasing on this interval and has the stated value at $2$. Squaring the first bound in the definition of $H$ gives
  $ Phi \( z \) - 121 / 25 z^2 gt.eq z (25 + 31 / 45 z^2 - 346 / 25 z) gt.eq 17 / 225 z gt.eq 0 . $
  Thus $Phi \( z \) gt.eq 16 \( 11 \/ 20 \)^2 z^2$. The moment constraint and $J \( mu \) gt.eq 0$ give $16 d^2 gt.eq 16 \( 11 \/ 20 \)^2$, and $H gt.eq 0$ gives $d gt.eq 11 \/ 20$.
  For another feasible measure $nu$, direct expansion with $ell = 32 d H - Phi$ gives
  $ J \( \( 1 - t \) mu + t nu \) - J \( mu \) = t (integral ell thin d nu - integral ell thin d mu) + 16 t^2 (integral H thin d nu - d)^2 . $
  For $t arrow.b 0$, maximality shows that $mu$ maximizes the linear functional $integral ell$. This conclusion does not require concavity of $J$.
  Put $g_1 \( z \) = 28 z + 6 z^2 - 25$ and $g_2 \( z \) = 1 - z^2$. The measure with mass $9 \/ 32$ at $2$ and the rest at $0$ has respective constraint expectations $- 5 \/ 2$ and $- 1 \/ 8$, so both constraints are strictly feasible. The compact convex set of triples
  $ {(integral g_1 thin d nu \, integral g_2 thin d nu \, integral ell thin d nu) : nu upright(" a probability measure on ") \[ 0 \, 2 \]} $
  is disjoint from the open set of triples with first two coordinates negative and third coordinate greater than $integral ell thin d mu$. Separation gives coefficients $- alpha \, - gamma \, beta$, with $alpha \, gamma \, beta gt.eq 0$. The last coefficient cannot be zero: otherwise the strictly feasible triple would violate separation. Normalize $beta = 1$. Evaluating on $mu$ and on point masses shows that $mu$ is supported on the global maxima of
  $ F_d \( z \) = 32 d H \( z \) - Phi \( z \) - alpha \( 28 z + 6 z^2 \) - gamma \( 1 - z^2 \) \, #h(2em) alpha \, gamma gt.eq 0 . $
  For completeness, separation bounds $integral \( ell - alpha g_1 - gamma g_2 \) thin d nu$ by $integral ell thin d mu$ for every $nu$; for $mu$ the reverse inequality follows from its nonpositive constraints. Equality and then point masses give precisely the asserted support condition.
  We next verify that $F'''_d \( z \) > 0$ on $\( 0 \, 2 \]$. Set
  $ L \( z \) = 3 / 8 + frac(3 z^2, 64) - frac(35 z^4, 1024) \, #h(2em) V \( z \) = 24 / 5 - frac(16 z^2, 15) - frac(7 z^4, 48) + frac(7 z^6, 1152) . $
  Direct differentiation gives $H''' \( z \) = L \( z \) z^(- 5 \/ 2)$ and $Phi''' \( z \) = V \( z \)$. For $x = sqrt(z \/ 2)$, the polynomial inequalities
  $ L \( 2 x^2 \) > 0 \, #h(2em) D_(*) \( x \) := 88 / 5 L \( 2 x^2 \) - 17 / 3 x^5 V \( 2 x^2 \) > 0 #h(2em) \( 0 lt.eq x lt.eq 1 \) $
  are certified below. Since $32 d gt.eq 88 \/ 5$ and $4 sqrt(2) < 17 \/ 3$, they imply $32 d L \( z \) - z^(5 \/ 2) V \( z \) > 0$ when $V \( z \) gt.eq 0$; when $V \( z \) < 0$ it is immediate. The constraint polynomials have zero third derivative, proving the claim.
  Also $F'_d \( 0 + \) = + oo$. Since $F''_d$ is strictly increasing, $F'_d$ can cross from positive to negative at most once. There is at most one interior local maximum; an interval of maxima is impossible. The endpoint $0$ is not a maximum, so the support contains at most one interior point and the endpoint $2$. A point mass is infeasible: its first constraint would give $z gt.eq 1$, and then $28 z + 6 z^2 gt.eq 34$. Thus the support is ${ w \, 2 }$, with weight $t$ at $2$. Necessarily $0 < w < 1$, and the moment constraints become
  $ t_(-) \( w \) := frac(1 - w^2, 4 - w^2) lt.eq t lt.eq t_(+) \( w \) := frac(25 - 28 w - 6 w^2, 80 - 28 w - 6 w^2) . $
  The denominators are positive. Nonemptiness reduces to $\( 2 - w \) \( 10 - 37 w \) gt.eq 0$, hence $0 < w lt.eq 10 \/ 37$.
  For fixed $w$, $J$ is a convex quadratic in $t$, so it is bounded above by the larger of its two endpoint values. Those values are negative:
  $ 16 t \( 1 - t \) #scale(x: 120%, y: 120%)[\(] H \( 2 \) - H \( w \) #scale(x: 120%, y: 120%)[\)]^2 > 9 #scale(x: 120%, y: 120%)[\(] \( 1 - t \) \( w^2 - w \) + 2 t #scale(x: 120%, y: 120%)[\)] #h(2em) \( t = t_(-) \( w \) \, med t_(+) \( w \) \) . $
  To verify these inequalities exactly, put
  $ x = sqrt(w \/ 2) lt.eq 37 / 100 \, #h(2em) R_(*) \( x \) = 1 + x^4 / 10 - x^8 / 72 . $
  For each of
  $ \( A_(-) \, B_(-) \) = \( 1 - w^2 \, 4 - w^2 \) \, #h(2em) \( A_(+) \, B_(+) \) = \( 25 - 28 w - 6 w^2 \, 80 - 28 w - 6 w^2 \) \, quad w = 2 x^2 \, $
  the required inequality, after multiplication by its positive $B_plus.minus^2$, is $P_plus.minus \( x \) > 0$, where
  $ P_plus.minus \( x \) = 32 A_plus.minus \( B_plus.minus - A_plus.minus \) #scale(x: 120%, y: 120%)[\(] R_(*) \( 1 \) - x R_(*) \( x \) #scale(x: 120%, y: 120%)[\)]^2 - 9 #scale(x: 120%, y: 120%)[\(] \( B_plus.minus - A_plus.minus \) \( w^2 - w \) + 2 A_plus.minus #scale(x: 120%, y: 120%)[\)] B_plus.minus . $
  This uses $H \( 2 \) - H \( w \) = sqrt(2) \( R_(*) \( 1 \) - x R_(*) \( x \) \)$. The endpoint $w = 10 \/ 37$, at which the weight interval can collapse, is included in the following strict certificates.
  Here are all the coefficient bounds used in this proof. If $p \( r + \( s - r \) y \) = sum_(j = 0)^n a_j y^j$, define
  $ h_i = sum_(j = 0)^i a_j binom(i, j) / binom(n, j) quad \( 0 lt.eq i lt.eq n \) . $
  Binomial expansion gives $p \( r + \( s - r \) y \) = sum_i h_i binom(n, i) y^i \( 1 - y \)^(n - i)$; thus positive $h_i$ give positivity on $\[ r \, s \]$. If the original coefficients are $p \( x \) = sum p_k x^k$, they are obtained explicitly from
  $ a_j = \( s - r \)^j sum_(k = j)^n p_k binom(k, j) r^(k - j) . $
  The degrees and strict lower bounds for the resulting coefficients are
  #[
  #set par(justify: false)
#table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Polynomial
], table.cell(rowspan: 1, colspan: 1)[Degree
], table.cell(rowspan: 1, colspan: 1)[Interval
], table.cell(rowspan: 1, colspan: 1)[Lower bound
]),
  table.cell(rowspan: 1, colspan: 1)[$L \( 2 x^2 \)$
], table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 100$
],
  table.cell(rowspan: 1, colspan: 1)[$D_(*) \( x \)$
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[$\[ j \/ 4 \, \( j + 1 \) \/ 4 \]$, $j = 0 \, 1 \, 2 \, 3$
], table.cell(rowspan: 1, colspan: 1)[$2 \/ 5$
],
  table.cell(rowspan: 1, colspan: 1)[$P_(-) \( x \)$
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 37 \/ 100 \]$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
  table.cell(rowspan: 1, colspan: 1)[$P_(+) \( x \)$
], table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 37 \/ 100 \]$
], table.cell(rowspan: 1, colspan: 1)[$1$
],
)
]
  For direct reproduction, the first two polynomial inputs are
  $ L \( 2 x^2 \) = 3 / 8 + 3 / 16 x^4 - 35 / 64 x^8 \, #h(2em) V \( 2 x^2 \) = 24 / 5 - 64 / 15 x^4 - 7 / 3 x^8 + 7 / 18 x^12 . $
  For example the least coefficient of $L \( 2 x^2 \)$ is $1 \/ 64$; the least coefficient of $D_(*)$ over its four intervals is $2459668689 \/ 5793382400 > 2 \/ 5$. For $P_(-)$ and $P_(+)$ the respective least coefficients are
  $ 58454914732902747377800095783827783501884053 / 50000000000000000000000000000000000000000000 & > 1 \,\
132428032291164570287168821949356607977047 / 770000000000000000000000000000000000000 & > 1 . $
  All inputs and endpoints in these coefficient calculations are rational. This proves the derivative and endpoint signs. The strict endpoint inequalities say exactly that $J \( t_(-) \( w \) \) \, J \( t_(+) \( w \) \) < 0$, contradicting its assumed nonnegative maximum. ◻
]

== 5 A weighted Hessian inequality for the Weyl blocks <sec:hessian>

We continue the case in which neither Weyl block vanishes identically. The preceding argument gives $upright(bold(E)) v^2 = upright(bold(E)) b^2$. This equality will enter the coupling in Section 6; the weighted Hessian inequality proved here does not itself require it. Our task is to extract a first-derivative inequality from the Bianchi-constrained second derivatives. Unequal weights on the two blocks will create a useful interaction, but their derivatives have costs that must be retained exactly. Retain the notation $Z = nabla T$, $p = nabla v$, $q = nabla b$, and $e = \| Z \|^2 \/ 6$. The argument is stated for $T$; exchanging the two orientations gives its companion for $U$. All expectations use normalized Riemannian volume. The constrained decomposition and weighted square come from [20] Lemmas 5.1–5.2 and Proposition 5.3. We prove the identities in full and retain their nonnegative form at the sectional boundary. The square will first be proved for an arbitrary global positive Lipschitz weight. We choose the two fixed weights when their derivative costs enter.

=== 5.1 The constrained Hessian and its curvature operator <the-constrained-hessian-and-its-curvature-operator>

Retain $F = "Sym"_0 \( Lambda^(+) \)$ and the Bianchi gradient bundle $G subset T^(*) M ⊗ F$ from Section 2. Their types are $\( 2 \, 0 \)$ and $\( 5 \/ 2 \, 1 \/ 2 \)$. The irreducible gradient constraint and the refined Kato coefficient used below are established in Gursky–LeBrun [12] Lemma 4, Equations (10)–(12); Calderbank–Gauduchon–Herzlich [4] place them in the general generalized-gradient framework. We use the parallel projector $P_G = \( 6 - C \) \/ 10$ and the compression identities already proved in Proposition 6. They are pointwise tensor identities, including at repeated eigenvalues, and do not require a smoothly chosen eigenbasis.

#thm([Lemma 5.1.])[
  (The two Hessian components).  #emph[Let $cal(H) = T^(*) M ⊗ G$, and write $X = nabla Z$, so $X_(i j) = nabla_i nabla_j T$. Then 
$ X = Y + D_0 \, #h(2em) Y upright(" has type ") \( 3 \, 1 \) \, #h(2em) D_0 upright(" has type ") \( 2 \, 0 \) . $

 If $"Tr" : cal(H) arrow.r F$ is contraction of the two derivative slots and $"Tr"^(*)$ its adjoint, then 
$ "Tr" "Tr"^(*) = 12 / 5 upright("Id") \, #h(2em) D_0 = 5 / 12 "Tr"^(*) Delta T \, #h(2em) \| D_0 \|^2 = 5 / 12 \| Delta T \|^2 . $

 All the type projections in this statement are parallel.]
] <lem:hessian-components>

#proof[
  The product rule gives four inequivalent, multiplicity-one summands
  $ cal(H) = \( 3 \, 1 \) xor \( 3 \, 0 \) xor \( 2 \, 1 \) xor \( 2 \, 0 \) . $
  Skewing the derivative slots takes values in
  $ Lambda^2 T^(*) M ⊗ F = \( 3 \, 0 \) xor \( 2 \, 0 \) xor \( 1 \, 0 \) xor \( 2 \, 1 \) . $
  For the actual Hessian $X = nabla nabla T$, its skew difference is $\[ nabla_i \, nabla_j \] T = F_(i j) T$, where $F_(i j)$ is the curvature of the bundle $F$. It is essential that the tensor on which this curvature acts is the same Weyl block $T$ that occurs in $F_(i j)$. The minus rotation algebra acts trivially on $F$, so there is no minus component. The dependence on $T$ is an equivariant linear term and an equivariant term in its symmetric square. The latter has plus spins $4 \, 2 \, 0$; its only common type with $Lambda^(+) ⊗ F = \( 3 \, 0 \) xor \( 2 \, 0 \) xor \( 1 \, 0 \)$ is $\( 2 \, 0 \)$. The linear term has that type as well. Thus the skew commutator has neither a $\( 3 \, 0 \)$ nor a $\( 2 \, 1 \)$ component. This conclusion is specific to the Hessian of $T$, not to the derivative of an arbitrary section of $G$.
  Skewing is injective on each of those two domain summands. The $\( 3 \, 0 \)$ summand is entirely skew: its stretched plus coupling makes the two derivative plus spin halves symmetric, while their minus coupling to spin zero is alternating. To treat $\( 2 \, 1 \)$, suppose that a tensor of this type is symmetric in its full derivative slots. Its derivative minus pair has spin $1$ and is symmetric, so its derivative plus pair must also be symmetric and have spin $1$. The inner Bianchi constraint makes the coupling operator $sum I_s^(\( j \)) Sigma_s$ equal to $- 4$. To see that symmetry gives the same value for the outer coupling, let $S$ interchange the derivative slots. Then $C^(\( i \)) = S C^(\( j \)) S$; hence $S X = X$ and $C^(\( j \)) X = - 4 X$ imply $C^(\( i \)) X = - 4 X$. The total plus Casimir would therefore be
  $ - 8 - 24 + 2 \( - 4 - 4 \) = - 48 \, $
  whereas total spin $2$ requires $- 24$. This contradiction proves injectivity. Moreover, the two images lie in distinct target isotypic components, so they cannot cancel one another. The corresponding components of $X$ must vanish separately.
  For the trace calculation, let $K : F arrow.r T^(*) M ⊗ T^(*) M ⊗ F$ be $K \( S \)_(i j) = delta_(i j) S$. The adjoint of the restricted trace is $"Tr"^(*) = P_G^(\( j \)) K$, where the projector acts on the inner derivative and matrix slots. Now
  $ "Tr" K = 4 upright("Id") \, #h(2em) "Tr" #scale(x: 120%, y: 120%)[\(] C^(\( j \)) K \( S \) #scale(x: 120%, y: 120%)[\)] = sum_(i \, s) \( I_s \)_(i i) Sigma_s S = 0 . $
  Thus $"Tr" "Tr"^(*) = 12 upright("Id") \/ 5$. By equivariance, trace vanishes on $\( 3 \, 1 \)$ and is supported on the unique $\( 2 \, 0 \)$ summand. The displayed nonzero composition makes its restriction to that five-dimensional summand an isomorphism onto $F$. It therefore determines the whole of $D_0$, including its skew part, and gives both the formula and the norm identity. One can also see explicitly that the trace component retains the curvature commutator. At a point, its adjoint is
  $ \( "Tr"^(*) S \)_(i j) = 3 / 5 delta_(i j) S + 1 / 10 sum_s I_(s \, i j) Sigma_s S . $
  Hence
  $ \( D_0 \)_(i j) - \( D_0 \)_(j i) = 1 / 12 sum_s I_(s \, i j) Sigma_s Delta T = 1 / 2 sum_s \( 1 + t_s \) I_(s \, i j) Sigma_s T . $
  For the last equality use $Delta T = 6 \( T - N \)$ and, in a pointwise diagonal frame, $Sigma_s N = - t_s Sigma_s T$. The invariant version is $Sigma_r N = - sum_s T_(r s) Sigma_s T$; no eigenframe has been differentiated. Thus the displayed skew difference is exactly the bundle-curvature action.
  Finally, the type projections are invariant expressions in the combined Casimirs, and trace is a metric contraction. They are parallel and do not depend on any curvature eigenframe. The spin labels describe tensor representations of the oriented frame group; no spin structure is used. ◻
]

The derivative-slot operators $T_D \, U_D$ were defined in the weighted variance proof, and $B_F \( T \)$ acts on the matrix slot. Compress all three orthogonally to $cal(H) = T^(*) M ⊗ G$. The useful combination is visible before the quadratic form is chosen. Let $Sigma_s^(upright("tot"))$ be the total plus generator on $cal(H)$ and put

$ tilde(Q) = 1 / 60 sum_(r \, s) T_(r s) Sigma_r^(upright("tot")) Sigma_s^(upright("tot")) . $

Compressing the inner derivative generator to $G$ gives $I_s^(\( j \)) = Sigma_s^G \/ 5$: equivariance fixes the spin-one family up to a scalar, and the highest weight gives $\( 1 \/ 2 \) \/ \( 5 \/ 2 \) = 1 \/ 5$. At a point where $T$ is diagonal, expansion of the total square therefore gives

$ T_D = 1 / 10 sum_s t_s I_s^(\( i \)) Sigma_s^G = 3 tilde(Q) - 2 Q_(5 \/ 2) \( T \) \, #h(2em) B_F \( T \) = Q_(5 \/ 2) \( T \) $

on the compressed inner factor. The inner square contributes $40 Q_(5 \/ 2) \( T \)$, while the trace-free outer half-spin square is zero. Consequently

$ T_D + 2 B_F \( T \) = 3 tilde(Q) . $

This combined identity cancels the inner curvature action. On the free $\( 3 \, 1 \)$ type, $tilde(Q) = Q_3 \( T \) lt.eq 4 x \/ 5$ and $U_D lt.eq 2 y$. Thus the choice

$ cal(P) = 4 - 5 / 6 #scale(x: 120%, y: 120%)[\(] T_D + 2 B_F \( T \) #scale(x: 120%, y: 120%)[\)] - U_D = 4 - 5 / 2 tilde(Q) - U_D $

has its plus and minus losses bounded by $2 x$ and $2 y$, respectively. The scalar $4$ then meets the sectional boundary $x + y = 2$. This explains the useful coefficients; no uniqueness of the choice is asserted.

#thm([Lemma 5.2.])[
  (Nonnegativity on the highest Hessian type).  #emph[The combined compressed operator $cal(P)$ preserves all four types in $cal(H)$. On $\( 3 \, 1 \)$ it satisfies $cal(P) gt.eq \( 4 - 2 x - 2 y \) "Id" gt.eq 0$, and on the trace type it satisfies 
$ cal(P) "Tr"^(*) = "Tr"^(*) \( 4 - B_F \( T \) \) . $

 The individual derivative-slot and matrix-slot summands need not preserve the four types.]
] <lem:hessian-operator>

#proof[
  The total plus generators preserve each joint type. Similarly, $sum_s u_s \( J_s^(\( i \)) + J_s^(\( j \)) \)^2 = 4 U_D$, so $U_D$ vanishes on minus spin zero and is $Q_1 \( U \)$ on minus spin one. Its latter spectrum is the spectrum of $U$. The displayed combined formula for $cal(P)$ therefore preserves the joint types. On $\( 3 \, 1 \)$,
  $ cal(P) gt.eq 4 - 2 x - 2 y gt.eq 0 . $
  On $\( 2 \, 0 \)$ the denominator in $Q_2$ is $24$, so under the trace identification $tilde(Q) = \( 2 \/ 5 \) Q_2 \( T \) = \( 2 \/ 5 \) B_F \( T \)$ and $U_D = 0$. This proves the stated trace action. ◻
]

=== 5.2 The weighted square and its first-derivative form <the-weighted-square-and-its-first-derivative-form>

The undetermined Hessian component $Y$ is now isolated, and its curvature-weighted quadratic form is nonnegative. We complete its weighted square and integrate by parts to replace the Hessian by first derivatives. The prescribed trace component must be subtracted in full.

Set

$ B = frac(chevron.l B_F \( T \) Z \, Z chevron.r, 6) \, #h(2em) C_N = frac(chevron.l B_F \( N \) Z \, Z chevron.r, 6) \, #h(2em) E_B = frac(\| Q_(5 \/ 2) \( T \) Z \|^2, 6) \, #h(2em) N = \( T^2 \)_0 . $

For a scalar weight $m$, write $L_m = d m ⊗ Z$, with no symmetrization, and let $\( L_m \)_Y$ denote its $\( 3 \, 1 \)$ projection.

#thm([Proposition 5.3.])[
  (Weighted Hessian inequality).  #emph[For every global Lipschitz scalar weight $m gt.eq m_0 > 0$, 
#[#set math.equation(numbering: n => "(10)")
 $ 0 lt.eq upright(bold(E)) [m G_v \( p \, k \, l \) - 5 / 6 sum_i m_i thin frac("tr" #scale(x: 120%, y: 120%)[\(] Z_i sum_j Z_j^2 #scale(x: 120%, y: 120%)[\)], 6) + frac(chevron.l cal(P) \( L_m \)_Y \, \( L_m \)_Y chevron.r, 24 m)] \, $ <eq:10>]

 where $i \, j$ in the middle term are derivative indices and 
$ G_v = (- 42 - 3 b^2 - 10 / 3 v^2) e + 75 B + 25 / 3 C_N - 100 / 3 E_B + 5 v^2 \| p \|^2 . $

 More precisely, if $cal(W)_v \( m \)$ denotes the integrand in (10), then the exact identity is 
#[#set math.equation(numbering: n => "(10a)")
 $ upright(bold(E)) cal(W)_v \( m \) = upright(bold(E)) [m / 6 ⟨cal(P) (Y + frac(\( L_m \)_Y, 2 m)) \, Y + frac(\( L_m \)_Y, 2 m)⟩] . $ <eq:weighted-hessian-square>]

]
] <prop:weighted-hessian>

#proof[
  By Lemma 22,
  $ upright(bold(E)) [m / 6 ⟨cal(P) (Y + frac(\( L_m \)_Y, 2 m)) \, Y + frac(\( L_m \)_Y, 2 m)⟩] gt.eq 0 . $
  The last term in its expansion is the last term of (10). Since $cal(P)$ preserves the type splitting and $X = Y + D_0$, the other terms are
  $ 1 / 6 upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m chevron.l cal(P) X \, X chevron.r + chevron.l cal(P) X \, L_m chevron.r - m chevron.l cal(P) D_0 \, D_0 chevron.r - chevron.l cal(P) D_0 \, L_m chevron.r #scale(x: 120%, y: 120%)[\]] . $
  We compute these terms for smooth $m$ first. Compression may be omitted inside any of the displayed inner products, because both arguments belong to $cal(H)$.
  ===== 5.2.1 The identity term. <the-identity-term.>
  Integration by parts and (1) give
  $ 1 / 6 upright(bold(E)) [m \| nabla Z \|^2 + sum_i m_i chevron.l nabla_i Z \, Z chevron.r] = - 1 / 6 upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m chevron.l Delta Z \, Z chevron.r #scale(x: 120%, y: 120%)[\]] = upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m \( - 13 e + 20 B \) #scale(x: 120%, y: 120%)[\]] . $
  This will be multiplied by the coefficient $4$ in $cal(P)$.
  ===== 5.2.2 The derivative-slot curvature terms. <the-derivative-slot-curvature-terms.>
  Write $A_(i k j l) = \( T_D \)_(i k j l)$. The two terms to integrate are
  $ upright(bold(E)) [m A_(i k j l) chevron.l nabla_i Z_j \, nabla_k Z_l chevron.r + A_(i k j l) chevron.l nabla_i Z_j \, m_k Z_l chevron.r] . $
  Integrate the derivative $k$ on the second paired tensor. The derivative of $m$ cancels the second term exactly. Moreover $nabla_k A_(i k j l) = 0$, by divergence freedom and skewness in $i \, k$. The result is
  $ - upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m A_(i k j l) chevron.l nabla_k nabla_i Z_j \, Z_l chevron.r #scale(x: 120%, y: 120%)[\]] = 1 / 2 upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m A_(i k j l) chevron.l \[ nabla_i \, nabla_k \] Z_j \, Z_l chevron.r #scale(x: 120%, y: 120%)[\]] . $
  This calculation uses neither symmetry of $X$ nor parallelness of $T_D$, and the factor $1 \/ 2$ comes only from skewing the two covariant derivatives.
  The curvature in the derivative slot has the contraction
  $ 1 / 2 \( T_D \)_(i k j l) R_(i k j h) = 3 v^2 delta_(l h) . $
  To see its normalization, substitute the quaternion expansions: the contraction over $i \, k$ removes all mixed plus/minus terms and gives $1 / 2 sum_s t_s \( 1 + t_s \) delta_(l h) = 3 v^2 delta_(l h)$. The matrix-slot curvature gives the quadratic form of
  $ - 1 / 2 sum_s t_s \( 1 + t_s \) I_s Sigma_s . $
  Since $t_s^2 = N_(s s) + 2 v^2$, its compression is
  $ - 1 / 2 #scale(x: 120%, y: 120%)[\(] 8 Q_(5 \/ 2) \( T \) + 8 Q_(5 \/ 2) \( N \) + 2 v^2 C #scale(x: 120%, y: 120%)[\)] = 4 v^2 - 4 Q_(5 \/ 2) \( T \) - 4 Q_(5 \/ 2) \( N \) . $
  After division by $6$, the full $T_D$ contribution is therefore
  $ upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m \( 7 v^2 e - 4 B - 4 C_N \) #scale(x: 120%, y: 120%)[\]] . $
  For $U_D$, the same integration gives $3 upright(bold(E)) \[ m b^2 e \]$. Its matrix-slot curvature contraction is zero, because the minus forms are orthogonal to the plus forms defining the curvature action on $F$.
  ===== 5.2.3 The nonparallel matrix-slot coefficient. <the-nonparallel-matrix-slot-coefficient.>
  Put $A = B_F \( T \)$ temporarily. One integration by parts gives
  $ upright(bold(E)) [m chevron.l A nabla_i Z \, nabla_i Z chevron.r + m_i chevron.l A nabla_i Z \, Z chevron.r] = - upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m chevron.l A Delta Z \, Z chevron.r #scale(x: 120%, y: 120%)[\]] - upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m chevron.l \( nabla_i A \) nabla_i Z \, Z chevron.r #scale(x: 120%, y: 120%)[\]] . $
  The operator $nabla_i A$ is symmetric, so the last term is
  $ 1 / 2 upright(bold(E)) [⟨(m Delta A + sum_i m_i nabla_i A) Z \, Z⟩] . $
  Here $nabla_i A = B_F \( Z_i \)$ and $Delta A = 6 B_F \( T \) - 6 B_F \( N \)$, since $B_F$ is a linear parallel construction. Also, pairing $B_F \( T \) Q_(5 \/ 2) \( T \) Z$ with $Z$ gives $\| Q_(5 \/ 2) \( T \) Z \|^2$, because the latter vector belongs to $G$. After division by $6$, the contribution is
  $ upright(bold(E)) [m \( - 10 B - 3 C_N + 20 E_B \) + 1 / 12 sum_i m_i chevron.l B_F \( Z_i \) Z \, Z chevron.r] . $
  Since $chevron.l B_F \( Z_i \) Z \, Z chevron.r = "tr" \( Z_i sum_j Z_j^2 \)$, multiplication by $- 5 \/ 3$ produces exactly the middle term in (10). In particular, the variation of $B_F \( T \)$ has been retained explicitly; $cal(P)$ is not assumed parallel.
  ===== 5.2.4 The prescribed trace component. <the-prescribed-trace-component.>
  By Lemmas 21 and 22,
  $ cal(P) D_0 = 5 / 12 "Tr"^(*) \( 4 - B_F \( T \) \) Delta T \, #h(2em) "Tr" L_m = sum_i m_i Z_i . $
  The characteristic polynomial of a trace-free $3 times 3$ matrix gives $B_F \( T \) T = N$ and $B_F \( T \) N = v^2 T$. Thus
  $ B_0 = \( 4 - B_F \( T \) \) \( T - N \) = \( 4 + v^2 \) T - 5 N . $
  Using $Delta T = 6 \( T - N \)$, the two trace subtractions, before division by $6$, are
  $ - 5 / 2 upright(bold(E)) [m chevron.l B_0 \, Delta T chevron.r + sum_i m_i chevron.l B_0 \, Z_i chevron.r] = 5 / 2 upright(bold(E)) #scale(x: 120%, y: 120%)[\[] m chevron.l nabla B_0 \, Z chevron.r #scale(x: 120%, y: 120%)[\]] . $
  Since $nabla N = 2 B_F \( T \) Z$ and $chevron.l T \, Z_i chevron.r = 6 v p_i$, their normalized contribution is
  $ upright(bold(E)) [m ((10 + 5 / 2 v^2) e - 25 B + 5 v^2 \| p \|^2)] . $
  Multiplying the preceding contributions by their coefficients in $cal(P)$ and collecting gives $G_v$ as stated.
  Finally, a global Lipschitz weight $m gt.eq m_0 > 0$ can be approximated uniformly and in $H^1$ by smooth positive weights with a common positive lower bound. The first derivatives converge in $L^2$, so their quadratic products in the square cost converge in $L^1$; the uniformly bounded reciprocals of the weights pass to the same limit. All other terms use only the weight and its first derivative. Hence the identity and inequality extend to every weight in the stated class. ◻
]

The next algebraic expansion, as in [20] Lemma 5.4, expresses this invariant inequality in the gradient coordinates needed for the coupling estimate.

#thm([Lemma 5.4.])[
  (The quadratic-form matrices).  #emph[At a point where $v > 0$, use the three vector parameters $p \, k \, l$ in (2). Then $G_v$ is the quadratic form, with scalar entries multiplying vector dot products, whose matrix is 
#[#set math.equation(numbering: n => "(11)")
 $ mat(delim: "(", - 70 - 5 b^2 + 100 sigma v - 25 v^2, - 100 sqrt(3) rho v, - 35 rho v^2 \/ sqrt(3); - 100 sqrt(3) rho v, - 210 - 15 b^2 - 300 sigma v - 190 v^2, - 75 v - 35 sigma v^2; - 35 rho v^2 \/ sqrt(3), - 75 v - 35 sigma v^2, - 42 - 3 b^2 - 10 v^2) . $ <eq:11>]

]
] <lem:hessian-matrices>

#proof[
  Expanding the diagonal and off-diagonal matrix entries in (2) gives
  $ B / v med arrow.l.r med mat(delim: "(", 4 sigma \/ 3, - 4 rho \/ sqrt(3), 0; - 4 rho \/ sqrt(3), - 4 sigma, - 1; 0, - 1, 0) \, #h(2em) C_N / v^2 med arrow.l.r med mat(delim: "(", 4 \/ 3, 0, - rho \/ sqrt(3); 0, - 4, - sigma; - rho \/ sqrt(3), - sigma, 0) . $
  Here one uses $sum s_i tilde(s)_i = 0$, $sum tilde(s)_i^3 = - 6 rho$, and $N \/ v^2 = "diag" \( sigma s_i + rho tilde(s)_i \)$. The energy metric in these coordinates is $H = "diag" \( 5 \/ 3 \, 5 \, 1 \)$. If $sans(B)$ denotes the matrix of $B$, the matrix of $E_B$ is $sans(B) H^(- 1) sans(B)$: $B_F \( T \)$ compressed to $G$ is the self-adjoint operator whose quadratic form is $B$. Using $sigma^2 + rho^2 = 1$, this gives
  $ E_B / v^2 med arrow.l.r med mat(delim: "(", 16 \/ 15, 0, 4 rho \/ \( 5 sqrt(3) \); 0, 21 \/ 5, 4 sigma \/ 5; 4 rho \/ \( 5 sqrt(3) \), 4 sigma \/ 5, 1 \/ 5) . $
  Substitution into the definition of $G_v$ gives (11) by matrix addition. The invariant expression for $G_v$ is defined everywhere; on the zero set of $T$, all its derivative parameters vanish almost everywhere, as established for the norm identity. ◻
]

=== 5.3 The two costs of a variable weight <the-two-costs-of-a-variable-weight>

For the remaining argument choose the fixed positive weights

#[#set math.equation(numbering: n => "(12)")
 $ M = 1 - 3 / 8 \( v - b \) \, #h(2em) m = M^2 \, #h(2em) overline(M) = 1 - 3 / 8 \( b - v \) \, #h(2em) overline(m) = overline(M)^2 . $ <eq:12>]

They are one rational choice for the later coupling argument. Since $v + b lt.eq 2$, both $M$ and $overline(M)$ lie in $\[ 1 \/ 4 \, 7 \/ 4 \]$; in particular $m \, overline(m) gt.eq 1 \/ 16$. Almost everywhere,

$ d m = - 3 / 4 M \( p - q \) \, #h(2em) d overline(m) = - 3 / 4 overline(M) \( q - p \) . $

Proposition 23 applies to these global Lipschitz weights. Their derivatives produce the two costs estimated next.

The Hessian has been eliminated from the integrated inequality. Two terms caused by the weight remain: a cubic contraction multiplied by $d m$, and a projected quadratic form in $d m ⊗ Z$. We now bound both by first-derivative energies, while keeping the sign needed for the later scalar relaxation. The estimates and projection identities are from [20] Lemmas 5.5–5.6 and Proposition 5.7; their proofs below apply directly when $x + y lt.eq 2$.

#thm([Lemma 5.5.])[
  (The cubic contraction).  #emph[For every real tangent vector $a$, with $Z_a = sum_i a_i Z_i$, 
#[#set math.equation(numbering: n => "(13)")
 $ lr(|frac("tr" #scale(x: 120%, y: 120%)[\(] Z_a sum_j Z_j^2 #scale(x: 120%, y: 120%)[\)], 6)|) lt.eq 4 / 5 sqrt(3 / 5) thin \| a \| e^(3 \/ 2) . $ <eq:13>]

]
] <lem:cubic-contraction>

#proof[
  By homogeneity, assume $\| a \| = 1$; the case $Z_a = 0$ is immediate. Put $nu = \| Z_a \| \/ sqrt(6)$, and diagonalize the normalized matrix $s = Z_a \/ nu$. Apply the algebraic parametrization (2) with this $s$, rather than with $T \/ v$, and denote its vector parameters by $hat(p) \, hat(k) \, hat(l)$. The diagonal entries of $Z_a = nu s$ imply $hat(p)_a = nu$ and $hat(k)_a = 0$. The part corresponding to the single component $hat(p)_a a$ has energy $e_1 = 5 nu^2 \/ 3$. It is orthogonal in the energy metric to the remaining parameters. In the displayed matrix for $B \/ v$, it has no cross term with those parameters, because $hat(k)_a = 0$ and the $hat(p) \, hat(l)$ entry is zero. Its contribution to $1 / 6 sum_j "tr" \( s Z_j^2 \)$ has absolute value at most $4 e_1 \/ 5$.
  For any symmetric trace-free $3 times 3$ matrix $S$, its characteristic polynomial gives
  $ \| \( S^2 \)_0 \|^2 = frac(\| S \|^4, 6) . $
  Since $\| s \| = sqrt(6)$, Cauchy–Schwarz yields $\| "tr" \( s S^2 \) \| lt.eq \| S \|^2$. Applied to the remaining tensor, this bounds its contribution by $e - e_1$. Therefore
  $ lr(|frac("tr" \( Z_a sum_j Z_j^2 \), 6)|) lt.eq nu (e - e_1 / 5) = sqrt(3 / 5) thin e^(3 \/ 2) sqrt(e_1 / e) (1 - frac(e_1, 5 e)) . $
  For $0 lt.eq r lt.eq 1$, the function $sqrt(r) \( 1 - r \/ 5 \)$ is increasing and has maximum $4 \/ 5$. This proves (13). ◻
]

#thm([Lemma 5.6.])[
  (Real-vector projection identities).  #emph[Let $P_(+)$ be the projection in $cal(H)$ onto total plus spin $3$, retaining both possible minus spins. For any real tangent vector $a$ and any $Z in G$, 
$ \| P_(+) \( a ⊗ Z \) \|^2 = 7 / 12 \| a \|^2 \| Z \|^2 \, $

 
$ ⟨tilde(Q) P_(+) \( a ⊗ Z \) \, P_(+) \( a ⊗ Z \)⟩ = 1 / 2 \| a \|^2 chevron.l Q_(5 \/ 2) \( T \) Z \, Z chevron.r . $

]
] <lem:real-vector-projections>

#proof[
  Complexify at the point, writing the outer tangent representation as $A ⊗ B$, with $A \, B$ the plus and minus spin halves, and $G_(bb(C)) = H_(5 \/ 2) ⊗ B'$. For a real vector $a$, define the operator $R_a$ on $A$ by $"tr" \( R_a D \) = chevron.l a \, \( D ⊗ "Id"_B \) a chevron.r$ for every operator $D$ on $A$. This is the partial trace over $B$ of the rank-one operator $a a^(*)$. We claim that $R_a = 1 / 2 \| a \|^2 "Id"_A$. Indeed, the three operators $- i I_s$ form a basis of the traceless Hermitian operators on $A$, and each has zero expectation because $a^(sans(T)) I_s a = 0$. The trace of $R_a$ is $\| a \|^2$, which fixes the scalar part.
  The complete vector is $a ⊗ Z$, a product between the outer factor and the entire inner factor. Consequently, for every operator $O$ acting only on $A ⊗ H_(5 \/ 2)$,
  $ chevron.l a ⊗ Z \, O \( a ⊗ Z \) chevron.r = frac(\| a \|^2, 2) chevron.l Z \, \( \( "Tr"_A O \) ⊗ upright("Id")_(B') \) Z chevron.r . $
  This partial trace retains every correlation of the inner plus factor with $B'$; neither $a$ nor $Z$ is assumed to be a product within its own plus and minus factors.
  The operator $"Tr"_A P_(+)$ is scalar on the irreducible space $H_(5 \/ 2)$. Its trace is the dimension $7$ of spin $3$, whereas $H_(5 \/ 2)$ has dimension $6$. Thus it equals $7 upright("Id") \/ 6$, proving the first identity.
  The family $"Tr"_A \( P_(+) tilde(Q) \( T \) P_(+) \)$ is equivariant and linear in the spin-$2$ variable $T$. Since spin $2$ occurs once in $"End" \( H_(5 \/ 2) \)$, it is a scalar multiple of $Q_(5 \/ 2) \( T \)$. To determine the scalar, take $T = "diag" \( - 1 \, - 1 \, 2 \)$ and the inner highest weight $5 \/ 2$. The outer weight $1 \/ 2$ gives total weight $3$ and $Q_3 \( T \)$-eigenvalue $- 1$. The outer weight $- 1 \/ 2$ projects to total weight $2$, where that eigenvalue is $\( 12 - 3 dot.op 2^2 \) \/ 15 = 0$. The normalized outer trace is therefore $- 1 \/ 2$. Since $Q_(5 \/ 2) \( T \)$ has eigenvalue $- 1$ on its highest weight, the second identity has coefficient $1 \/ 2$, as asserted. ◻
]

#thm([Proposition 5.7.])[
  (The projection cost).  #emph[For the weight (12), 
#[#set math.equation(numbering: n => "(14)")
 $ frac(chevron.l cal(P) \( L_m \)_Y \, \( L_m \)_Y chevron.r, 24 m) lt.eq 9 / 64 \| p - q \|^2 [7 / 12 \( 4 + y \) e - 5 / 4 B] . $ <eq:14>]

 The bracket on the right is nonnegative. Both assertions remain valid under the closed inequalities $v + b lt.eq 2$ and $x + y lt.eq 2$.]
] <prop:hessian-projection-cost>

#proof[
  Let $P_(-)$ be the projection onto total minus spin $1$, so the highest Hessian projection is $P_(+) P_(-)$. On that type, $- U_D lt.eq y$, and hence $cal(P) lt.eq A$, where
  $ A = 4 + y - 5 / 2 tilde(Q) . $
  This operator acts only on the plus factors and commutes with $P_(-)$. On the entire high-plus subspace,
  $ A gt.eq 4 + y - 2 x gt.eq 0 \; $
  the last inequality follows from $x + y lt.eq 2$. It follows in operator order that $P_(-) A P_(-) lt.eq A$ there. Thus, for every real $a$,
  $ chevron.l cal(P) \( a ⊗ Z \)_Y \, \( a ⊗ Z \)_Y chevron.r lt.eq chevron.l A P_(+) \( a ⊗ Z \) \, P_(+) \( a ⊗ Z \) chevron.r = 6 \| a \|^2 [7 / 12 \( 4 + y \) e - 5 / 4 B] \, $
  where the last equality is Lemma 26. This operator argument is valid for arbitrary correlations after the plus projection and does not discard a mixed minus-factor term.
  Almost everywhere, $d m = - 3 / 4 M \( p - q \)$. Substituting $a = d m$, dividing by $24 m$, and using $m = M^2$ gives (14). Finally, for any unit real $a$, the same equality and the lower bound for $A$ give
  $ 7 / 12 \( 4 + y \) e - 5 / 4 B gt.eq 7 / 12 \( 4 + y - 2 x \) e gt.eq 0 . $
  In particular, subsequent upper estimates may replace $\| p - q \|^2$ by $\( \| p \| + \| q \| \)^2$ in (14) without reversing the inequality. ◻
]

== 6 Coupling the two Weyl blocks <sec:coupling>

We now combine the balanced second moments with the weighted Hessian inequality. The algebraic construction and its three estimates are due to [20] Proposition 6.1 and Section 7; we reproduce the complete argument, including the polynomial certificates in Appendix 8. The endpoint argument at the end of this section makes the estimates available when a Weyl block vanishes and the opposite block lies on the boundary of the sectional-curvature cone.

Assume that neither Weyl block vanishes identically and that their second moments agree:

$ upright(bold(E)) v^2 = upright(bold(E)) b^2 . $

We retain the notation

$ delta = 2 - v - b \, #h(2em) K = 4 + v^2 + b^2 \, #h(2em) M = 1 - 3 / 8 \( v - b \) \, #h(2em) m = M^2 \, $

and place a bar over an expression to exchange the two blocks. In particular, $macron(M) = 1 - 3 / 8 \( b - v \)$ and $macron(m) = macron(M)^2$. Since $\| v - b \| lt.eq 2$, both weights are at least $1 \/ 16$, as required in the weighted Hessian inequality.

The weights in (12) have opposite slopes along $v + b = 2$. Their derivatives introduce quartic terms in the first derivatives of curvature. We combine the two Hessian inequalities with one identity that controls those costs, the balanced variance defect, and tests of the weak norm equations. This produces a single integrand with nonnegative mean. The task is then to bound its quartic, quadratic, and potential parts by three expressions that complete one square.

=== 6.1 The combined integral inequality <the-combined-integral-inequality>

Start with the sum of the two integrands in (10). The three additions below are written explicitly in (16)–(18). Here $h gt.eq 0$ is a scalar coefficient and $kappa$ is a scalar multiplier, whose rational values are specified below. Their roles and integral signs are as follows; the degrees refer to first derivatives of curvature in the resulting integrand.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Added expression
], table.cell(rowspan: 1, colspan: 1)[Integral and derivative degrees
], table.cell(rowspan: 1, colspan: 1)[Purpose
]),
  table.cell(rowspan: 1, colspan: 1)[$Delta delta$ identity
], table.cell(rowspan: 1, colspan: 1)[$h / 3 upright(bold(E)) \[ delta \( \| Y \|^2 + \| macron(Y) \|^2 \) \] gt.eq 0$; degrees $4 \, 2 \, 0$
], table.cell(rowspan: 1, colspan: 1)[Controls the quartic weight costs
],
  table.cell(rowspan: 1, colspan: 1)[Balanced variance defect
], table.cell(rowspan: 1, colspan: 1)[Nonnegative integral; degrees $2 \, 0$
], table.cell(rowspan: 1, colspan: 1)[Controls $v - b$ using moment balance
],
  table.cell(rowspan: 1, colspan: 1)[$kappa$ norm tests
], table.cell(rowspan: 1, colspan: 1)[Zero integral; degrees $2 \, 0$
], table.cell(rowspan: 1, colspan: 1)[Adjusts the quadratic and potential terms
],
)
]

We use the following rational choice for the constants and multiplier in this combination. It is one sufficient choice; no optimality or uniqueness is asserted. Set

$ D = 158 \, #h(2em) h = 17 / 10 \, #h(2em) a = v - 1 \, #h(2em) s = b - 1 . $

Define

#[#set math.equation(numbering: n => "(15)")
 $ kappa \( v \, b \) =  & - D / 6 \( a - s \) + z_1 a^2 + (60 - frac(2 D, 9) + 2 z_1) a s + z_2 s^2\
 & + sum_(i = 0)^3 z_(3 + i) a^i s^(3 - i) + sum_(i = 0)^4 z_(7 + i) a^i s^(4 - i) \,\
4 \( z_1 \, dots.h \, z_11 \) =  & \( - 43 \, - 45 \, - 63 \, 21 \, 183 \, 208 \, 61 \, 46 \, 101 \, 79 \, - 41 \) . $ <eq:15>]

Here and below an exchanged expression is obtained by exchanging all block variables, and $macron(kappa) = kappa \( b \, v \)$. The multiplier $kappa$ changes the integrand through a zero-integral norm test and is not required to have a sign.

The first addition is

#[#set math.equation(numbering: n => "(16)")
 $ h #scale(x: 240%, y: 240%)[\[] & \( e + macron(e) \) (lambda - frac(e - \| p \|^2, v) - frac(macron(e) - \| q \|^2, b)) + 40 delta \( B + macron(B) \)\
 & #h(24mm)  - 30 delta sum_plus.minus v^2 \( 1 - 2 sigma v + v^2 \) #scale(x: 240%, y: 240%)[\]] \, $ <eq:16>]

where

$ lambda = 6 \( sigma v^2 + accent(sigma b, ‾)^2 - v - b \) - 26 delta . $

The notation $sum_plus.minus$ includes the displayed term and its exchange. To verify its sign, use

$ Delta e = 2 / 6 \| nabla Z \|^2 + 26 e - 40 B $

and (3) in

$ upright(bold(E)) #scale(x: 120%, y: 120%)[\[] \( e + macron(e) \) Delta delta #scale(x: 120%, y: 120%)[\]] = upright(bold(E)) #scale(x: 120%, y: 120%)[\[] delta Delta \( e + macron(e) \) #scale(x: 120%, y: 120%)[\]] . $

The decomposition $nabla Z = Y + D_0$ gives $\| D_0 \|^2 = \( 5 \/ 12 \) \| Delta T \|^2$. Moreover,

$ frac(2 \| D_0 \|^2, 6) = 30 v^2 \( 1 - 2 sigma v + v^2 \) . $

Consequently the integral of (16) equals $h / 3 upright(bold(E)) \[ delta \( \| Y \|^2 + \| macron(Y) \|^2 \) \]$, which is nonnegative.

The second addition is

#[#set math.equation(numbering: n => "(17)")
 $ D [frac(\| p - q \|^2, K) - (1 - delta^2 / 4) \( v - b \)^2] . $ <eq:17>]

Indeed, the equality of the second moments implies

$ upright(bold(E)) \( v - b \) = 1 / 2 upright(bold(E)) \[ delta \( v - b \) \] \, $

and hence

$ \( upright(bold(E)) \( v - b \) \)^2 lt.eq 1 / 4 upright(bold(E)) \[ delta^2 \( v - b \)^2 \] . $

Applying (4) to $v - b$ proves that (17) has nonnegative integral. Finally add the zero-integral expression

#[#set math.equation(numbering: n => "(18)")
 $ sum_plus.minus [kappa \( v \, b \) {6 v \( 1 - sigma v \) + frac(e - \| p \|^2, v)} + nabla kappa \( v \, b \) dot.op p] . $ <eq:18>]

This is the weak identity (3) tested against $kappa \( v \, b \)$.

Let $cal(I)$ denote the resulting total integrand. Thus $upright(bold(E)) cal(I) gt.eq 0$. All these integrals are legitimate without a positive lower bound for either norm: $e \/ v$ and $macron(e) \/ b$ are integrable by the regularization proving (3), while the energies and all scalar coefficients are bounded. Bounded Lipschitz test functions are admissible by smooth approximation, uniformly and in $H^1$.

For the fixed weights in (12), $d m$ is linear in $p \, q$. Thus the cubic contraction multiplied by $d m$ and the quadratic form in $L_m = d m ⊗ Z$ have degree four in first derivatives of curvature. Grouping the exact total integrand by this degree gives $cal(I) = cal(I)_4 + cal(I)_2 + cal(I)_0$, where

$ cal(I)_4 =  & sum_plus.minus [- 5 / 6 sum_i m_i thin frac("tr" #scale(x: 120%, y: 120%)[\(] Z_i sum_j Z_j^2 #scale(x: 120%, y: 120%)[\)], 6) + frac(chevron.l cal(P) \( L_m \)_Y \, \( L_m \)_Y chevron.r, 24 m)]\
 & - h \( e + macron(e) \) (frac(e - \| p \|^2, v) + frac(macron(e) - \| q \|^2, b)) \,\
cal(I)_2 =  & sum_plus.minus [m G_v + h lambda e + 40 h delta B + kappa \( v \, b \) frac(e - \| p \|^2, v) + nabla kappa \( v \, b \) dot.op p] + D / K \| p - q \|^2 \,\
cal(I)_0 =  & - D (1 - delta^2 / 4) \( v - b \)^2\
 & + sum_plus.minus [6 kappa \( v \, b \) v \( 1 - sigma v \) - 30 h delta v^2 \( 1 - 2 sigma v + v^2 \)] . $

Here $lambda$ is the original symmetric expression in (16). The exchange in $sum_plus.minus$ includes the operator, the $Y$-projection, the weight, the multiplier and its arguments, and all derivative labels. On a block’s zero set, only its corresponding derivative summands vanish almost everywhere; the exchanged contributions remain. The quotients use the zero value assigned in (3), and $G_v$ uses the invariant expression following (10). Products such as $sigma v^2$ use their continuous zero value; no continuity is asserted for the singular coefficients.

To state the three bounds, define the comparison functions

$ c & = 2 / 5 - 3 / 10 v b \, #h(2em) n = delta / 2 \, #h(2em) t = frac(v - b, 2) \,\
4 Theta \( v \, b \) & = n^2 \( 1 - n \) \( 105 + 5 n \) + t^2 \( 4 + 360 n - 586 n^2 \) - 4 t^4 \,\
R_v & = frac(4 \( 1 + v \), 1 + 6 v + v^2) \, #h(2em) R_b = frac(4 \( 1 + b \), 1 + 6 b + b^2) . $

Here $c gt.eq 1 \/ 10$ on $v \, b gt.eq 0$, $v + b lt.eq 2$, while $Theta$ need not have a sign. These functions enter the comparison for the final square; they are not additional integrands.

#thm([Proposition 6.1.])[
  (Three bounds for the combined integrand).  #emph[For this decomposition, define 
$ r = R_v \| p \|^2 + R_b \| q \|^2 \, #h(2em) j = \( \| p \|^2 + \| q \|^2 \) (frac(\| p \|^2, v) + frac(\| q \|^2, b)) . $

 Then, almost everywhere, 
$ cal(I)_4 lt.eq - c j \, #h(2em) cal(I)_2 lt.eq 2 Theta r \, #h(2em) cal(I)_0 lt.eq - Theta^2 / c . $

 The corresponding derivative summands are assigned value zero on a zero set, as in (3). The total integrand and the bounds are integrable, and $upright(bold(E)) cal(I) gt.eq 0$.]
] <prop:coupling-estimates>

Section 7 combines these estimates with $r^2 lt.eq j$ to obtain

$ cal(I) lt.eq - frac(\( Theta - c r \)^2, c) - c \( j - r^2 \) . $

The strictness needed for vanishing is proved there. We prove the three estimates in turn. The computations first take place on $v \, b > 0$, $v + b lt.eq 2$, $x + y lt.eq 2$. The polynomial certificates used in the proof are supplied in Appendix 8.

=== 6.2 The quartic terms <the-quartic-terms>

Put

$ e_0 = 5 / 3 \| p \|^2 \, #h(2em) e_d = e - e_0 gt.eq 0 \, #h(2em) z = \| p \| + \| q \| . $

Since $d m = - 3 / 4 M \( p - q \)$, (13) bounds the cubic contraction multiplied by $d m$ in (10) by $1 / 2 sqrt(3 \/ 5) thin M z e^(3 \/ 2)$. The nonnegative bracket in (14) is bounded above by $g e_0 + H_d e_d$, where

$ g = 7 / 12 \( 4 + y \) - sigma v + frac(rho^2 v^2, 4) \, #h(2em) H_d = 7 / 12 \( 4 + y \) + 5 / 4 v + 4 . $

In fact, the pure defect contribution to $- 5 B \/ 4$ is at most $\( 5 \/ 4 \) v e_d$, and its mixed contribution is at most $2 v \| rho \| sqrt(e_0 e_d)$. The latter is at most $\( rho^2 v^2 \/ 4 \) e_0 + 4 e_d$. Nonnegativity of the original bracket permits the replacement $\| p - q \|^2 lt.eq z^2$. We obtain

#[#set math.equation(numbering: n => "(19)")
 $ cal(I)_4 lt.eq  & sum_plus.minus [1 / 2 sqrt(3 / 5) thin z M e^(3 \/ 2) + 9 / 64 z^2 \( g e_0 + H_d e_d \)]\
 & - h \( e + macron(e) \) [frac(\( 2 \/ 5 \) e_0 + e_d, v) + frac(\( 2 \/ 5 \) macron(e)_0 + macron(e)_d, b)] . $ <eq:19>]

We first show that this upper bound decreases when either defect increases, with $p \, q$ fixed. Denote the right-hand side by $cal(Q)$. For $e > 0$, direct differentiation gives

$ partial_(e_d) cal(Q) =  & 3 / 4 sqrt(3 / 5) thin z M sqrt(e) + 9 / 64 z^2 H_d\
 & - h [frac(\( 2 \/ 5 \) e_0 + e_d, v) + frac(\( 2 \/ 5 \) macron(e)_0 + macron(e)_d, b) + frac(e + macron(e), v)] . $

Set $u = sqrt(macron(e) \/ e)$. The bounds

$ z lt.eq sqrt(3 / 5) \( sqrt(e) + sqrt(macron(e)) \) \, #h(2em) M lt.eq 7 / 4 - 3 / 4 v \, #h(2em) H_d lt.eq 15 / 2 + 2 / 3 v \,\
2 / 5 e_0 + e_d gt.eq 2 / 5 e \, #h(2em) 2 / 5 macron(e)_0 + macron(e)_d gt.eq 2 / 5 macron(e) \, #h(2em) v / b gt.eq frac(v, 2 - v) $

therefore imply

$ v / e partial_(e_d) cal(Q) lt.eq A_0 \( 1 + u \)^2 + L_0 \( 1 + u \) - h [7 / 5 + (1 + frac(2 v, 5 \( 2 - v \))) u^2] \, $

where

$ A_0 = 27 / 320 v (15 / 2 + 2 / 3 v) \, #h(2em) L_0 = 9 / 20 v (7 / 4 - 3 / 4 v) . $

All substitutions in the negative bracket use lower bounds; thus they give the required upper bound after multiplication by $- h$.

Write

$ C_0 = 7 / 5 h - A_0 - L_0 \, #h(2em) D_0^(upright("sc")) = h - A_0 + frac(2 h v, 5 \( 2 - v \)) . $

Lemma 32 gives $C_0 > 0$ and

$ 4 C_0 (\( h - A_0 \) \( 2 - v \) + 2 / 5 h v) - \( 2 - v \) \( 2 A_0 + L_0 \)^2 > 0 . $

For $0 < v < 2$ this says $4 C_0 D_0^(upright("sc")) > \( 2 A_0 + L_0 \)^2$; hence the quadratic polynomial

$ - C_0 + \( 2 A_0 + L_0 \) u - D_0^(upright("sc")) u^2 $

is negative for every real $u$. No ordering of the two energies is needed. Before taking an endpoint limit, write the derivative bound as

$ partial_(e_d) cal(Q) lt.eq 1 / v [- C_0 e + \( 2 A_0 + L_0 \) sqrt(e macron(e)) - D_0^(upright("sc")) macron(e)] . $

It extends continuously to $e = 0$, where necessarily $e_0 = e_d = 0$. At $e = macron(e) = 0$ its value is zero; otherwise the derivative remains negative. The exchanged argument applies to $macron(e)_d$. Decreasing the defects one at a time consequently gives

$ cal(Q) \( e_0 + e_d \, macron(e)_0 + macron(e)_d \) lt.eq cal(Q) \( e_0 \, macron(e)_0 + macron(e)_d \) lt.eq cal(Q) \( e_0 \, macron(e)_0 \) . $

We may therefore put both defects equal to zero. Write

$ V = x - v \, #h(2em) W = y - b \, #h(2em) 0 lt.eq V lt.eq v \, quad 0 lt.eq W lt.eq b \, quad V + W lt.eq delta . $

We claim

$ g lt.eq g_v := 7 / 12 \( 4 + b + W \) - v + 2 V \, #h(2em) g_b = 7 / 12 \( 4 + v + V \) - b + 2 W . $

For $r_0 = x \/ v in \[ 1 \, 2 \]$, use

$ sigma = frac(3 r_0 - r_0^3, 2) \, quad 1 - sigma = frac(\( r_0 - 1 \)^2 \( r_0 + 2 \), 2) \, quad 1 + sigma = frac(\( 2 - r_0 \) \( r_0 + 1 \)^2, 2) . $

Since $r_0 v lt.eq 2$,

$ frac(\( r_0 - 1 \) \( r_0 + 2 \), 2) (1 + frac(v \( 1 + sigma \), 4)) lt.eq 2 . $

After substituting $v lt.eq 2 \/ r_0$, the gap in this inequality is

$ & 2 - frac(\( r_0 - 1 \) \( r_0 + 2 \), 2) (1 + frac(1 + sigma, 2 r_0))\
 & quad = frac(2 - r_0, 8 r_0) [4 r_0 \( r_0 + 3 \) - \( r_0 - 1 \) \( r_0 + 2 \) \( r_0 + 1 \)^2] gt.eq 0 . $

The bracket is concave on $\[ 1 \, 2 \]$ and has endpoint values $16$ and $4$. This also covers $r_0 = 2$ without division by $2 - r_0$. Multiplying the preceding bound by $V = v \( r_0 - 1 \)$ proves the claim for $g$, using $rho^2 = 1 - sigma^2$.

Set $P = sqrt(e_0)$ and $Q = sqrt(macron(e)_0)$. We will prove

#[#set math.equation(numbering: n => "(20)")
 $ & (67 / 50 + 27 / 100 v b) \( P^2 + Q^2 \) \( b P^2 + v Q^2 \)\
 & #h(2em) gt.eq 27 / 128 v b \( P + Q \)^2 \( g_v P^2 + g_b Q^2 \) + 3 / 4 v b \( P + Q \) \( M P^3 + macron(M) Q^3 \) . $ <eq:20>]

At zero defects, $z = sqrt(3 \/ 5) \( P + Q \)$. Thus the positive terms of (19) are at most $2 \/ 5$ times the right-hand side of (20), divided by $v b$. Since

$ 10 / 9 (h - 67 / 50 - 27 / 100 v b) = c \, $

(20) gives the first estimate in Proposition 28; the factor $9 \/ 25$ that remains is exactly the conversion from $\( e_0 \, macron(e)_0 \)$ to $\( \| p \|^2 \, \| q \|^2 \)$.

To prove (20), exchange the blocks, if necessary, so that $P > 0$ and $0 lt.eq u = Q \/ P lt.eq 1$; the case $P = Q = 0$ is immediate. In $g_v + g_b u^2$ the coefficients of $V \, W$ are nonnegative, and their difference is $\( 17 \/ 12 \) \( 1 - u^2 \) gt.eq 0$. Replacing $\( V \, W \)$ by $\( delta \, 0 \)$ therefore enlarges this expression. This is a relaxation, not an assertion that the new pair is geometrically attained. The enlarged values are

$ g_v = 19 / 3 - 3 v - 17 / 12 b \, #h(2em) g_b = 7 / 2 - 19 / 12 b . $

Put $omega = 27 \/ 128$, $mu = 9 \/ 32$, and define

$ A & = 67 / 50 \( 1 + u^2 \) \,\
G & = 27 / 100 \( 1 + u^2 \) u^2 + 3 omega \( 1 + u \)^2 + mu \( 1 + u \) \( 1 - u^3 \) \,\
H & = 27 / 100 \( 1 + u^2 \) + omega / 12 \( 17 + 19 u^2 \) \( 1 + u \)^2 - mu \( 1 + u \) \( 1 - u^3 \) \,\
L & = omega \( 1 + u \)^2 (19 / 3 + 7 / 2 u^2) + 3 / 4 \( 1 + u \) \( 1 + u^3 \) . $

Dividing the difference between the left and enlarged right sides of (20) by $v b P^4$ gives exactly

$ A / v + frac(A u^2, b) + G v + H b - L . $

Here $A \, L > 0$, and Lemma 32 gives $G \, H > 0$. For

$ Z_(*) = L^2 - 4 A \( G + u^2 H \) $

the same lemma gives $Z_(*) lt.eq 0$ on $\[ 0 \, 1 \/ 16 \]$ and $Z_(*)^2 lt.eq 64 A^2 u^2 G H$ on $\[ 1 \/ 16 \, 1 \]$. In the latter interval, $Z_(*) lt.eq \| Z_(*) \| lt.eq 8 A u sqrt(G H)$. In both intervals it follows that

$ L lt.eq 2 sqrt(A) \( sqrt(G) + u sqrt(H) \) . $

Taking square roots is legitimate because both sides are nonnegative. The arithmetic–geometric mean inequalities applied to $A \/ v + G v$ and $A u^2 \/ b + H b$ finish the proof of (20).

=== 6.3 The quadratic terms <the-quadratic-terms>

The quartic bound is established. We next bound the quadratic part by its #emph[axial value]: the algebraic comparison with $sigma = macron(sigma) = 1$, $rho = macron(rho) = 0$, and $k = l = macron(k) = macron(l) = 0$, holding $v \, b \, p \, q$ fixed. The corresponding spectral shapes are $\( - v \, - v \, 2 v \)$ and $\( - b \, - b \, 2 b \)$. In the plus contribution, replacing $macron(sigma)$ by $1$ raises the expression by $6 h \( 1 - macron(sigma) \) b^2 e gt.eq 0$. After this replacement, the shape-dependent quadratic expression is

$ m G_v + h lambda_v e + 40 h delta B + kappa / v \( e - \| p \|^2 \) + \( partial_v kappa \) \| p \|^2 + \( partial_b kappa \) p dot.op q \, $

where $lambda_v = 6 \( sigma v^2 + b^2 - v - b \) - 26 delta$. The last two terms and the separate variance term are unchanged by the shape comparison. Define

$ P_0 = 300 m + 30 h v + 160 h delta \, #h(2em) P_k = 300 m + 160 h delta \, #h(2em) P_l = 35 m v . $

On the closed spectral triangle, $m gt.eq 1 \/ 16$ and $h \, delta \, v gt.eq 0$; therefore $P_0 = P_k + 30 h v > 0$. This supplies the positive denominator in the Schur comparison below. By (11) and (16), the loss in the $p p$ entry when $sigma < 1$ is $\( 1 - sigma \) v P_0 \/ 3$, and the mixed entries with $\( k \, l \)$ are $- v rho \( P_k \, P_l \) \/ sqrt(3)$. The negative of the pure $\( k \, l \)$ matrix is exactly

$ sans(D)_sigma = mat(delim: "(", K_1, K_12; K_12, K_2) - kappa / v "diag" \( 5 \, 1 \) \, $

where

$ K_2 & = m \( 42 + 3 b^2 + 10 v^2 \) - h lambda_v \,\
K_1 & = 5 K_2 + m \( 300 v sigma + 140 v^2 \) + 160 h delta v sigma \,\
K_12 & = m \( 75 v + 35 v^2 sigma \) + 40 h delta v . $

Thus the required completion of squares follows from

#[#set math.equation(numbering: n => "(21)")
 $ P_0 [v mat(delim: "(", K_1, K_12; K_12, K_2) - kappa "diag" \( 5 \, 1 \)] - \( 1 + sigma \) v^2 vec(P_k, P_l) mat(delim: "(", P_k, P_l) succ.curly.eq 0 . $ <eq:21>]

Let $sans(A)_sigma$ be this matrix and $w = \( P_k \, P_l \)^T$. The identity $P_0 = P_k + 30 h v$ gives

$ - partial_sigma sans(A)_sigma = v^2 [vec(30 h v, - P_l) mat(delim: "(", 30 h v, - P_l) + "diag" \( 0 \, 6 h v P_0 \)] succ.curly.eq 0 . $

Lemma 33 proves (21) at $sigma = 1$, and this matrix monotonicity proves it for every $- 1 lt.eq sigma lt.eq 1$. When $sigma < 1$, put $ell = \( 1 - sigma \) v P_0 \/ 3 > 0$ and $d = - v rho w \/ sqrt(3)$. The Schur complement is

$ sans(D)_sigma - frac(d d^T, ell) = sans(D)_sigma - frac(\( 1 + sigma \) v, P_0) w w^T = frac(sans(A)_sigma, P_0 v) succ.curly.eq 0 . $

At $sigma = 1$, one has $rho = 0$ and

$ sans(D)_1 = frac(sans(A)_1 + 2 v^2 w w^T, P_0 v) succ.curly.eq 0 \, $

so no division by $1 - sigma$ is needed. No sign of $kappa$ is assumed. Applying the exchanged argument proves the announced axial reduction.

At the axial comparison, (2) and the matrix for $B \/ v$ give $e_(upright("ax")) = 5 \| p \|^2 \/ 3$ and $B_(upright("ax")) = 4 v \| p \|^2 \/ 3$. Put $lambda_(upright("ax")) = 6 \( v^2 + b^2 - v - b \) - 26 delta$. Since $delta = - a - s$,

$ #scale(x: 120%, y: 120%)[\(] h lambda e + 40 h delta B #scale(x: 120%, y: 120%)[\)]_(upright("ax")) & = 5 / 3 h #scale(x: 120%, y: 120%)[\(] lambda_(upright("ax")) + 32 v delta #scale(x: 120%, y: 120%)[\)] \| p \|^2\
 & = 5 / 3 h #scale(x: 120%, y: 120%)[\(] 6 \( a^2 + s^2 \) + 32 a delta #scale(x: 120%, y: 120%)[\)] \| p \|^2 . $

Together with the axial $p p$ entry of (11), this gives $X_v \| p \|^2$ for the axial part of $m G_v + h lambda e + 40 h delta B$, where

$ X_v = m \( - 70 + 100 v - 25 v^2 - 5 b^2 \) + 5 / 3 h #scale(x: 120%, y: 120%)[\(] 6 \( a^2 + s^2 \) + 32 a delta #scale(x: 120%, y: 120%)[\)] \, #h(2em) X_b = X_v \( b \, v \) . $

The full quadratic comparison is invariant under simultaneous exchange of the blocks and of $p \, q$. We may therefore assume $v gt.eq b$ for its pointwise proof. The weights and multipliers have already been differentiated with the fixed global block labels; no selected label is differentiated. Collecting the remaining quadratic terms gives the desired estimate precisely when

#[#set math.equation(numbering: n => "(22)")
 $ mat(delim: "(", cal(Q)_v, J; J, cal(Q)_b) prec.curly.eq 2 Theta "diag" \( R_v \, R_b \) \,\
cal(Q)_v = X_v + D / K + partial_v kappa + frac(2 kappa, 3 v) \, #h(2em) cal(Q)_b = X_b + D / K + partial_b macron(kappa) + frac(2 macron(kappa), 3 b) \,\
J = frac(partial_b kappa + partial_v macron(kappa), 2) - D / K . $ <eq:22>]

The polynomial matrix certificate in Lemma 33 will prove this inequality.

The leading terms of $kappa$ can now be read in their intended role. Along the formal axial boundary $v = 1 + t$, $b = 1 - t$, direct substitution in the displayed formulas gives

$ cal(Q)_v \, cal(Q)_b \, J = O \( t^2 \) quad \( t arrow.r 0 \) \, #h(2em) Theta = t^2 - t^4 . $

Thus the constant and tangential linear terms cancel at the meeting point of the two axial blocks. This explains the local shape of the rational choice; the certificate proves its inequality on the full stated domain.

=== 6.4 The potential and the zero sets <the-potential-and-the-zero-sets>

The quadratic estimate has been reduced to its explicit matrix certificate. It remains to bound the derivative-free potential and to extend the three inequalities across the zero sets. The potential is symmetric under exchanging the two blocks. For its pointwise estimate, suppose $v gt.eq b$ and define

$ E_0 =  & D (1 - delta^2 / 4) \( v - b \)^2 + 30 h delta \( v^2 a^2 + b^2 s^2 \) + 6 \( a v kappa + s b macron(kappa) \) \,\
F =  & c E_0 - Theta^2 \, #h(2em) L_v = 10 h delta v - kappa \, #h(2em) L_b = 10 h delta b - macron(kappa) . $

Direct collection from (16)–(18) gives

$ cal(I)_0 = - E_0 - 6 v^2 \( 1 - sigma \) L_v - 6 b^2 \( 1 - macron(sigma) \) L_b . $

Since $y - b lt.eq delta$ and $r_0 = y \/ b lt.eq 2$,

$ b^2 \( 1 - macron(sigma) \) = 1 / 2 b^2 \( r_0 - 1 \)^2 \( r_0 + 2 \) lt.eq 2 delta^2 . $

It therefore suffices to establish

#[#set math.equation(numbering: n => "(23)")
 $ L_v gt.eq 0 \, #h(2em) F gt.eq 0 \, #h(2em) F + 12 c delta^2 L_b gt.eq 0 #h(2em) \( v gt.eq b \) . $ <eq:23>]

Indeed, if $L_b gt.eq 0$ then $cal(I)_0 lt.eq - E_0 lt.eq - Theta^2 \/ c$. If $L_b < 0$, the displayed spectral bound instead gives

$ cal(I)_0 lt.eq - E_0 - 12 delta^2 L_b lt.eq - Theta^2 \/ c . $

Lemmas 33 and 34 prove all three inequalities in (23).

Finally consider the actual zero set ${ v = 0 \, med b > 0 }$. The tensors $Z$ and $p$ vanish almost everywhere there, whereas $y$ may equal $2$. Fix such a point and its minus derivative tensor $macron(Z)$. For $0 < epsilon < 1$, take auxiliary spectra and derivatives

$ T_epsilon = "diag" \( - epsilon \, - epsilon \, 2 epsilon \) \, #h(2em) U_epsilon = \( 1 - epsilon \) U \, #h(2em) Z_epsilon = 0 \, #h(2em) macron(Z)_epsilon = macron(Z) . $

These are pointwise algebraic data; no metric deformation is involved. Their norms and least-eigenvalue variables satisfy

$ v_epsilon = epsilon \, #h(2em) b_epsilon = \( 1 - epsilon \) b > 0 \, #h(2em) x_epsilon + y_epsilon = epsilon + \( 1 - epsilon \) y lt.eq 2 - epsilon < 2 . $

The norm inequality $v_epsilon + b_epsilon lt.eq x_epsilon + y_epsilon$ gives the other required domain condition. The Bianchi gradient space is independent of the spectra, so the fixed tensor $macron(Z)$ remains admissible. Moreover, the induced minus norm derivative is unchanged:

$ \( q_epsilon \)_i = frac(chevron.l \( 1 - epsilon \) U \, macron(Z)_i chevron.r, 6 \( 1 - epsilon \) b) = q_i . $

Set all plus derivative parameters equal to zero. Then every numerator divided by $v_epsilon$ vanishes identically before passing to the limit. The minus denominators tend to positive values, and every remaining term tends to its prescribed value at the original data. Thus each of the three estimates passes to this zero set. In particular, the quartic target tends to $- c \| q \|^4 \/ b$ and all cross terms with $p$ vanish. The same argument with the labels exchanged treats ${ b = 0 \, med v > 0 }$. On ${ v = b = 0 }$ both derivative tensors vanish almost everywhere; use two small axial spectra and zero derivative tensors. Products such as $sigma v^2$ tend to zero because $\| sigma \| lt.eq 1$.

This proves the pointwise estimates almost everywhere, with the quotient convention of (3). The quartic quotients are bounded in absolute value by a constant times $e \/ v + macron(e) \/ b$, and hence are integrable. Proposition 28 follows once the explicit polynomial inequalities in Appendix 8 are established.

== 7 The equality case and the parallel splitting <sec:classification>

The preceding estimates have nonnegative integral and a nonpositive pointwise upper bound. We now determine what their equality means. The argument first makes the two norms constant; the norm equations then make the Weyl tensors parallel. These are separate steps.

#thm([Proposition 7.1.])[
  (Constancy of the two Weyl norms).  #emph[On a closed, simply connected, oriented four-manifold with $"Ric" = 3 g$, nonnegative sectional curvature, and neither Weyl block identically zero, one has $v = b = 1$ everywhere.]
] <prop:constant-norms>

#proof[
  Proposition 20 gives $upright(bold(E)) v^2 = upright(bold(E)) b^2$, so Proposition 28 supplies an integrable function $cal(I)$ with $upright(bold(E)) cal(I) gt.eq 0$ and
  $ cal(I) lt.eq - c j + 2 Theta r - Theta^2 / c \, #h(2em) c gt.eq 1 / 10 \, $
  where
  $ r = R_v \| p \|^2 + R_b \| q \|^2 \, quad j = \( \| p \|^2 + \| q \|^2 \) (frac(\| p \|^2, v) + frac(\| q \|^2, b)) \, quad p = d v \, quad q = d b . $
  The zero-set conventions of Proposition 8 apply. The gradients are bounded, and the derivative quotients are integrable, so $j$ is integrable as well.
  For $v > 0$ the identity
  $ 1 + 6 v + v^2 - 4 sqrt(v) \( 1 + v \) = \( sqrt(v) - 1 \)^4 $
  gives $R_v lt.eq 1 \/ sqrt(v)$, with equality precisely when $v = 1$. Consequently Cauchy–Schwarz gives
  $ r lt.eq frac(\| p \|^2, sqrt(v)) + frac(\| q \|^2, sqrt(b)) lt.eq sqrt(j) . $
  A summand with zero numerator and zero denominator is read as zero. The first inequality is strict almost everywhere on the set where $p$ or $q$ is nonzero. To see this, recall that a Lipschitz function has zero differential almost everywhere on each of its level sets: at a differentiability and density point of a level set, a nonzero differential would contradict density. Outside a null set, a nonzero $p$ thus has $v > 0$ and $v eq.not 1$, and the analogous statement holds for $q$. At least one summand is then strictly smaller.
  Completing the square now gives
  $ cal(I) lt.eq - frac(\( Theta - c r \)^2, c) - c \( j - r^2 \) lt.eq 0 . $
  The right side is strictly negative almost everywhere where either norm gradient is nonzero. Since $upright(bold(E)) cal(I) gt.eq 0$, that set has measure zero. Both weak gradients vanish; connectedness makes the Lipschitz functions $v \, b$ constant. Neither constant is zero by hypothesis. The gaps in Proposition 11 give $v \, b gt.eq 1$, while $v + b lt.eq 2$. Thus both constants equal $1$. ◻
]

The strictness in this argument uses the level sets of the Weyl norms. It does not require the quadratic form in the Hessian identity to be positive definite. This is why the same coupling estimates determine the boundary geometry.

#thm([Proposition 7.2.])[
  (Parallel Weyl blocks).  #emph[Both $T$ and $U$ are parallel, with eigenvalues $\( 2 \, - 1 \, - 1 \)$.]
] <prop:parallel-blocks>

#proof[
  Since $v = 1$ and $p = 0$, the weak norm Equation (3) becomes
  $ 0 = 6 \( 1 - sigma \) + e . $
  Here $sigma lt.eq 1$ and $e = \| nabla T \|^2 \/ 6 gt.eq 0$. Both terms vanish, so $sigma = 1$ and $nabla T = 0$; smoothness gives these identities everywhere. The exchanged equation gives the same conclusion for $U$. The trace, squared norm, and cubic trace of each block are respectively $0 \, 6 \, 6$. Its characteristic polynomial is therefore $lambda^3 - 3 lambda - 2 = \( lambda - 2 \) \( lambda + 1 \)^2$, as claimed. ◻
]

#proof[
  We have reduced to the complete simply connected oriented cover. By Proposition 30, the simple eigenspaces of $T$ and $U$ are parallel real line subbundles of $Lambda^(+)$ and $Lambda^(-)$. A real line bundle over a simply connected manifold is trivial. Choose global unit sections $omega_(+)$ and $omega_(-)$ of these lines. Their covariant derivatives lie in the respective lines and are orthogonal to the unit sections, so the sections are parallel.
  Viewed as skew endomorphisms, $I = sqrt(2) thin omega_(+)$ and $J = sqrt(2) thin omega_(-)$ are orthogonal complex structures of opposite orientations. The two rotation algebras commute, so $I J = J I$. The product $A = I J$ is parallel and satisfies
  $ A^(*) = A \, #h(2em) A^2 = "Id" \, #h(2em) "tr" A = 0 . $
  The last equality follows from the orthogonality of self-dual and anti-self-dual two-forms. Thus the $+ 1$ and $- 1$ eigenspaces of $A$ are orthogonal parallel rank-two distributions.
  The de Rham decomposition theorem [9] gives a global Riemannian product of complete simply connected surfaces. The Ricci tensor of a product restricts to the Ricci tensor of each factor, so each surface has $"Ric" = 3 g$, equivalently Gaussian curvature $3$. A complete simply connected surface of constant curvature $3$ is the round sphere of radius $1 \/ sqrt(3)$. This identifies the universal Riemannian cover as the asserted product. ◻
]

#proof[
  Pass to the compact, simply connected, oriented universal Riemannian cover, as in Section 1. If one Weyl block vanishes identically, the classical half-conformally-flat classification recalled there gives the standard sphere or complex projective plane. Otherwise Propositions 29 and 30 give parallel Weyl blocks with spectrum $\( 2 \, - 1 \, - 1 \)$. The parallel splitting just proved then gives the product of two round spheres. ◻
]

== 8 Exact polynomial certificates <sec:certificates>

This appendix proves the finite polynomial inequalities used in Section 6. The coefficients are rational throughout. The certificates are those of [20] Section 7. We give the conversion formulas, domains, and coefficient bounds so that each sign follows from a finite polynomial expansion. The method uses the nonnegative Bernstein basis on intervals and simplices; see Boudaoud–Caruso–Roy [2] and Roy [21] Sections 1 and 4. We prove the conversion formulas and their matrix-valued consequence here. Positivity is verified for these specific polynomials, with their boundary zeros retained. The accompanying source package contains a standard-library Python checker at . From the source package’s root, the exact coefficient calculations can be reproduced with

#raw(block: true, lang: "", "python -B verification/verify.py --check")

=== 8.1 Bernstein coefficients on intervals and triangles <bernstein-coefficients-on-intervals-and-triangles>

#thm([Lemma 8.1.])[
  (Bernstein conversion).  #emph[Let $p$ be a polynomial of degree at most $N$ on an interval $\[ r \, s \]$, and write 
$ p \( r + \( s - r \) z \) = sum_(j = 0)^N a_j z^j . $

 Its degree-$N$ Bernstein expansion is 
$ p \( r + \( s - r \) z \) = sum_(i = 0)^N h_i binom(N, i) z^i \( 1 - z \)^(N - i) \, #h(2em) h_i = sum_(j = 0)^i a_j binom(i, j) / binom(N, j) . $

 In particular, $h_i gt.eq eta$ for all $i$ implies $p gt.eq eta$ on $\[ r \, s \]$.]
  #emph[For a polynomial on a triangle with ordered vertices $p_ell = \( r_ell \, s_ell \)$, set 
$ V = r_3 + \( r_1 - r_3 \) z + \( r_2 - r_3 \) w \, #h(2em) W = s_3 + \( s_1 - s_3 \) z + \( s_2 - s_3 \) w . $

 If $P \( z \, w \) = p \( V \, W \) = sum_(d \, e) P_(d e) z^d w^e$ has degree at most $N$, then its normalized degree-$N$ triangular coefficients are 
$ \[ p \]_(i j) = s_(i j) \( P \) := sum_(d = 0)^i sum_(e = 0)^j frac(binom(i, d) binom(j, e), binom(N, d + e) binom(d + e, d)) thin P_(d e) \, #h(2em) i \, j gt.eq 0 \, quad i + j lt.eq N . $

 On $z \, w gt.eq 0$, $z + w lt.eq 1$, the polynomial is the sum of these coefficients times the nonnegative basis functions 
$ frac(N !, i ! j ! \( N - i - j \) !) z^i w^j \( 1 - z - w \)^(N - i - j) . $

 These basis functions sum to one. The same expansion applies entrywise to a symmetric polynomial matrix: positive semidefiniteness of every coefficient matrix implies positive semidefiniteness throughout the triangle.]
] <lem:bernstein-conversion>

#proof[
  For an interval, expand $z^j = z^j \( z + \( 1 - z \) \)^(N - j)$ and compare coefficients in the Bernstein basis. On a triangle, expand
  $ z^d w^e = z^d w^e \( z + w + \( 1 - z - w \) \)^(N - d - e) . $
  This gives the displayed factors after dividing each coefficient by the corresponding multinomial coefficient. Equivalently, substitute
  $ \( v \, b \) = frac(u_1 p_1 + u_2 p_2 + u_3 p_3, u_1 + u_2 + u_3) $
  and multiply by $\( u_1 + u_2 + u_3 \)^N$. The normalized coefficient of $u_1^i u_2^j u_3^(N - i - j)$ is $\[ p \]_(i j)$. The positivity statements follow from the nonnegative partition of unity, also for matrix quadratic forms. ◻
]

=== 8.2 The quartic scalar certificates <the-quartic-scalar-certificates>

#thm([Lemma 8.2.])[
  (Scalar certificates).  #emph[For the polynomials in Section 6, the following bounds hold: 
$ C_0 > 0 \, #h(2em) 4 C_0 (\( h - A_0 \) \( 2 - v \) + 2 / 5 h v) - \( 2 - v \) \( 2 A_0 + L_0 \)^2 > 0 quad \( 0 lt.eq v lt.eq 2 \) \,\
G \, H > 0 quad \( 0 lt.eq u lt.eq 1 \) \, #h(2em) Z_(*) lt.eq 0 quad \( 0 lt.eq u lt.eq 1 \/ 16 \) \,\
Z_(*)^2 lt.eq 64 A^2 u^2 G H quad \( 1 \/ 16 lt.eq u lt.eq 1 \) . $

]
] <lem:scalar-certificates>

#proof[
  Apply the interval formula of Lemma 31 in the degrees and on the intervals indicated below. Every coefficient has at least the displayed positive lower bound. In the first two rows the bound applies on each of the two intervals separately.
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (left, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Polynomial
], table.cell(rowspan: 1, colspan: 1)[Degree
], table.cell(rowspan: 1, colspan: 1)[Interval
], table.cell(rowspan: 1, colspan: 1)[Lower bound
]),
  table.cell(rowspan: 1, colspan: 1)[$C_0$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \] \, med \[ 1 \, 2 \]$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$4 C_0 \( \( h - A_0 \) \( 2 - v \) + 2 / 5 h v \) - \( 2 - v \) \( 2 A_0 + L_0 \)^2$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \] \, med \[ 1 \, 2 \]$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$G$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[$9 \/ 10$
],
  table.cell(rowspan: 1, colspan: 1)[$H$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 4$
],
  table.cell(rowspan: 1, colspan: 1)[$- Z_(*)$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$\[ 0 \, 1 \/ 16 \]$
], table.cell(rowspan: 1, colspan: 1)[$13 \/ 100$
],
  table.cell(rowspan: 1, colspan: 1)[$64 A^2 u^2 G H - Z_(*)^2$
], table.cell(rowspan: 1, colspan: 1)[$16$
], table.cell(rowspan: 1, colspan: 1)[$\[ 1 \/ 16 \, 1 \]$
], table.cell(rowspan: 1, colspan: 1)[$12 \/ 100$
],
)
]
  For the first two rows the coefficients are in fact strictly greater than $1 \/ 2$. For example, their respective minima on the two intervals are
  $ (3971 / 3200 \, 1063 / 1600) \, #h(2em) (101027 / 20000 \, 283729 / 400000) . $
  All entries in this table are obtained by substituting the displayed formulas for $A_0 \, L_0 \, C_0$ and for $A \, G \, H \, L \, Z_(*)$ into the coefficient sum in Lemma 31. Thus each bound is an inequality between rational coefficients. The lemma proves the required signs. ◻
]

=== 8.3 The two matrix certificates <the-two-matrix-certificates>

For the quadratic inequality (22), introduce

$ r_v & = 1 + 6 v + v^2 \, #h(2em) r_b = 1 + 6 b + b^2 \, #h(2em) alpha = 5 / 4 \,\
H_v & = 8 v K Theta \( 1 + v \) - r_v {v D + K [v \( X_v + partial_v kappa \) + frac(2 kappa, 3)]} \,\
H_b & = H_v \( b \, v \) \,\
S_(*) & = 4 \( alpha + alpha^(- 1) \) v b + frac(alpha b \( 1 - v \)^2 + alpha^(- 1) v \( 1 - b \)^2, 2) . $

The diagonal differences in (22) are $H_v \/ \( v K r_v \)$ and $H_b \/ \( b K r_b \)$. Since $r_v = 8 v + \( 1 - v \)^2$ and $r_b = 8 b + \( 1 - b \)^2$, weighted arithmetic–geometric mean gives

$ sqrt(v b r_v r_b) lt.eq frac(alpha b r_v + alpha^(- 1) v r_b, 2) = S_(*) . $

It is therefore sufficient to prove

$ mat(delim: "(", H_v, S_(*) K J; S_(*) K J, H_b) succ.curly.eq 0 . $

Indeed its diagonal entries are nonnegative and its determinant gives $H_v H_b gt.eq S_(*)^2 K^2 J^2 gt.eq v b r_v r_b K^2 J^2$. Dividing by the positive denominators proves that the matrix of differences in (22) is positive semidefinite. This argument uses $J^2$ and imposes no sign condition on $J$.

For a symmetric $2 times 2$ matrix, record its entries in the order $\( 11 \, 22 \, 12 \)$ as a triple $\( r \, h' \, s' \)$. In this notation the two triples to be certified are

$ cal(A) =  & P_0 #scale(x: 120%, y: 120%)[\(] v \( K_1 \, K_2 \, K_12 \) - kappa \( 5 \, 1 \, 0 \) #scale(x: 120%, y: 120%)[\)] - 2 v^2 \( P_k^2 \, P_l^2 \, P_k P_l \) \, #h(2em) sigma = 1 \,\
cal(B) =  & \( H_v \, H_b \, S_(*) K J \) . $

The first triple is precisely the matrix in (21) at $sigma = 1$.

#thm([Lemma 8.3.])[
  (Matrix and boundary certificates).  #emph[The symmetric matrix represented by $cal(A)$ is positive semidefinite on 
$ cal(D) = { \( v \, b \) : v \, b gt.eq 0 \, med v + b lt.eq 2 } . $

 The symmetric matrix represented by $cal(B)$ is positive semidefinite on 
$ cal(D)_(+) = { \( v \, b \) in cal(D) : v gt.eq b } . $

 On $cal(D)_(+)$ one also has 
$ L_v gt.eq 0 \, #h(2em) F + 12 c delta^2 L_b gt.eq 0 . $

]
] <lem:matrix-certificates>

#proof[
  Use the vertices
  $ O = \( 0 \, 0 \) \, quad S = \( 1 \, 0 \) \, quad C = \( 1 \, 1 \) \, quad U = \( 2 \, 0 \) \, quad W_0 = \( 0 \, 2 \) \,\
A = \( 1 \/ 2 \, 1 \/ 2 \) \, quad B = \( 3 \/ 2 \, 1 \/ 2 \) \, quad E = \( 1 \, 1 \/ 2 \) . $
  A three-letter word specifies the vertices of an ordered triangle. The triangles $O S C$, $O C W_0$, and $S C U$ cover $cal(D)$. The triangles $O A S$, $A S E$, $A C E$, $S B E$, $C B E$, and $S U B$ cover $cal(D)_(+)$; the latter is also the single triangle $O C U$, or the union $O S C union S C U$. All edges are included. The two subdivisions are shown in Figure 1.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (3.4, 0), (0, 3.4), close: true, fill: rgb("#f5f5ff"), stroke: none)
  line((0, 0), (3.825, 0), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3.825, 0), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  line((0, 0), (0, 3.825), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((0, 3.825), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (3.4, 0), (0, 3.4), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3.4, 0), (0, 3.4), stroke: none)
  content((0.816, 2.584), [#text(size: 7pt)[$v+b=2$]], anchor: "south", padding: 0.1176cm)
  line((0, 0), (1.7, 1.7), (1.7, 0), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$O$]], anchor: "north-east", padding: 0.1176cm)
  content((1.7, 0), [#text(size: 9pt)[$S$]], anchor: "north", padding: 0.1176cm)
  content((3.4, 0), [#text(size: 9pt)[$U$]], anchor: "north-west", padding: 0.1176cm)
  content((1.7, 1.7), [#text(size: 9pt)[$C$]], anchor: "south-west", padding: 0.1176cm)
  content((0, 3.4), [#text(size: 9pt)[$W_0$]], anchor: "south-east", padding: 0.1176cm)
  content((1.7, -0.816), [#text(size: 9pt)[$cal(D)$: certificate $cal(A)$]])
  line((6.12, 0), (9.52, 0), (7.82, 1.7), close: true, fill: rgb("#f5f5ff"), stroke: none)
  line((6.12, 0), (9.945, 0), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((9.945, 0), [#text(size: 9pt)[$v$]], anchor: "west", padding: 0.1176cm)
  line((6.12, 0), (6.12, 2.21), stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6.12, 2.21), [#text(size: 9pt)[$b$]], anchor: "south", padding: 0.1176cm)
  line((6.12, 0), (9.52, 0), (7.82, 1.7), close: true, stroke: (thickness: 0.8pt, miter-limit: 10))
  line((6.12, 0), (7.82, 1.7), stroke: none)
  content((7.361, 1.241), [#text(size: 7pt)[$v=b$]], anchor: "south", padding: 0.1176cm)
  line((6.97, 0.85), (7.82, 0), (8.67, 0.85), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((7.82, 0), (7.82, 1.7), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.97, 0.85), (8.67, 0.85), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.12, 0), [#text(size: 9pt)[$O$]], anchor: "north-east", padding: 0.1176cm)
  content((7.82, 0), [#text(size: 9pt)[$S$]], anchor: "north", padding: 0.1176cm)
  content((9.52, 0), [#text(size: 9pt)[$U$]], anchor: "north-west", padding: 0.1176cm)
  content((7.82, 1.7), [#text(size: 9pt)[$C$]], anchor: "south", padding: 0.1176cm)
  content((6.97, 0.85), [#text(size: 9pt)[$A$]], anchor: "south-east", padding: 0.1176cm)
  content((8.67, 0.85), [#text(size: 9pt)[$B$]], anchor: "south-west", padding: 0.1176cm)
  content((7.82, 0.85), [#text(size: 9pt)[$E$]], anchor: "south-west", padding: 0.07056cm)
  content((7.82, -0.816), [#text(size: 9pt)[$cal(D)_+$: certificate $cal(B)$]])
})],
    caption: [Figure 1: Subdivisions of the Weyl-norm domains $cal(D) = { \( v \, b \) : v \, b gt.eq 0 \, med v + b lt.eq 2 }$ and $cal(D)_(+) = cal(D) ∩ { v gt.eq b }$ used in the triangular coefficient table. Every edge is included. The norm condition $v + b lt.eq 2$ is a necessary relaxation of the sectional-curvature condition; the tensor estimates retain the stronger constraint $x + y lt.eq 2$. ],
  ) <fig:certificate-domains>
  For a matrix row, the last two columns below bound, respectively,
  $ min \( \[ r \]_(i j) \, \[ h' \]_(i j) \) \, #h(2em) \[ r \]_(i j) \[ h' \]_(i j) - \[ s' \]_(i j)^2 . $
  Thus the last column is the determinant of each coefficient matrix. For a scalar row, the first bound applies directly to its coefficient. The bounds apply to every nonzero coefficient; a zero matrix exception means that all three of its entries vanish.
  #[
  #set par(justify: false)
#table(
  columns: 6,
  align: (left, center, center, center, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Object
], table.cell(rowspan: 1, colspan: 1)[Triangle
], table.cell(rowspan: 1, colspan: 1)[$N$
], table.cell(rowspan: 1, colspan: 1)[Zeros
], table.cell(rowspan: 1, colspan: 1)[Diagonal or scalar bound
], table.cell(rowspan: 1, colspan: 1)[Determinant bound
]),
  table.cell(rowspan: 1, colspan: 1)[$cal(A)$
], table.cell(rowspan: 1, colspan: 1)[$O S C$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$16000$
], table.cell(rowspan: 1, colspan: 1)[$53000000$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$O C W_0$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$890$
], table.cell(rowspan: 1, colspan: 1)[$3900000$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$S C U$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$2400$
], table.cell(rowspan: 1, colspan: 1)[$3500000$
],
  table.cell(rowspan: 1, colspan: 1)[$cal(B)$
], table.cell(rowspan: 1, colspan: 1)[$O A S$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$43$
], table.cell(rowspan: 1, colspan: 1)[$1050$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$A S E$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$43$
], table.cell(rowspan: 1, colspan: 1)[$490$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$A C E$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$21$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$S B E$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$43$
], table.cell(rowspan: 1, colspan: 1)[$1300$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$C B E$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$13 \/ 100$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$S U B$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$290$
],
  table.cell(rowspan: 1, colspan: 1)[$L_v$
], table.cell(rowspan: 1, colspan: 1)[$O C U$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$9 \/ 10$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[$F + 12 c delta^2 L_b$
], table.cell(rowspan: 1, colspan: 1)[$O S C$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$19 \/ 100$
], table.cell(rowspan: 1, colspan: 1)[—
],
  table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[$S C U$
], table.cell(rowspan: 1, colspan: 1)[$9$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$9 \/ 1000$
], table.cell(rowspan: 1, colspan: 1)[—
],
)
]
  Here are explicit expansion instructions for all entries of the table. They also fix the coefficient ordering. Write $a = V - 1$, $s = W - 1$ in (15) and form $kappa \( V \, W \)$ and its two partial derivatives. A partial derivative is obtained by reducing the appropriate exponent of each monomial and multiplying by that exponent. Differentiate before substituting the affine expressions $V \, W$. Put
  $ kappa_(*) = kappa \( V \, W \) \, #h(2em) macron(kappa)_(*) = kappa \( W \, V \) . $
  Thus the partial derivatives of the exchanged function, before affine substitution, are
  $ partial_V macron(kappa)_(*) \( V \, W \) = \( partial_2 kappa \) \( W \, V \) \, #h(2em) partial_W macron(kappa)_(*) \( V \, W \) = \( partial_1 kappa \) \( W \, V \) . $
  Ordinary coefficient arrays are multiplied by convolution:
  $ \( P Q \)_(d e) = sum_(f = 0)^d sum_(g = 0)^e P_(f g) Q_(d - f \, e - g) . $
  Use
  $ m_(*) & = (1 - 3 / 8 \( V - W \))^2 \, & d_0 & = 2 - V - W \,\
P_(k \, *) & = 300 m_(*) + 160 h d_0 \, & P_(l \, *) & = 35 m_(*) V \,\
Y_(*) & = m_(*) \( 42 + 3 W^2 + 10 V^2 \) - h #scale(x: 120%, y: 120%)[\[] 6 \( V^2 + W^2 - V - W \) - 26 d_0 #scale(x: 120%, y: 120%)[\]] . $
  For $cal(A)$, apply $s_(i j)$ from Lemma 31 to the three entries of
  $ & \( P_(k \, *) + 30 h V \) { V \( A_1 \, Y_(*) \, A_12 \) - kappa_(*) \( 5 \, 1 \, 0 \) #scale(x: 120%, y: 120%)[}]\
 & #h(22mm)  - 2 V^2 \( P_(k \, *)^2 \, P_(l \, *)^2 \, P_(k \, *) P_(l \, *) \) \, $
  where
  $ A_1 = 5 Y_(*) + m_(*) \( 300 V + 140 V^2 \) + 160 h d_0 V \, #h(2em) A_12 = m_(*) \( 75 V + 35 V^2 \) + 40 h d_0 V . $
  These are the original entries of (21) at $sigma = 1$, expressed only in the affine polynomials $V \, W$.
  For $cal(B)$, put
  $ K_(*) & = 4 + V^2 + W^2 \, #h(2em) Theta_(*) = Theta \( V \, W \) \,\
X_(*) & = m_(*) \( - 70 + 100 V - 25 V^2 - 5 W^2 \) + 5 / 3 h #scale(x: 120%, y: 120%)[\(] 6 \( a^2 + s^2 \) + 32 a d_0 #scale(x: 120%, y: 120%)[\)] \,\
H_(*) & = 8 V K_(*) Theta_(*) \( 1 + V \)\
 & quad - \( 1 + 6 V + V^2 \) {V D + K_(*) [V #scale(x: 120%, y: 120%)[\(] X_(*) + \( partial_1 kappa \) \( V \, W \) #scale(x: 120%, y: 120%)[\)] + frac(2 kappa_(*), 3)]} . $
  Apply $s_(i j)$ to $H_(*)$, to its exchange in $V \, W$, and to
  $ S_(*) \( V \, W \) {K_(*) / 2 #scale(x: 120%, y: 120%)[\(] \( partial_2 kappa \) \( V \, W \) + \( partial_2 kappa \) \( W \, V \) #scale(x: 120%, y: 120%)[\)] - D} . $
  For example, on $C B E$ the triples at $\( i \, j \) = \( 8 \, 0 \) \, \( 8 \, 1 \) \, \( 8 \, 2 \)$ are
  $ (11041 / 810 \, 4063 / 810 \, 60557 / 16200) \, quad (4328 / 405 \, 839 / 405 \, 3977 / 2700) \, quad (191 / 81 \, 191 / 81 \, - 1189 / 1350) . $
  For the two scalar rows, apply $s_(i j)$ to $10 h d_0 V - kappa_(*)$ and, respectively, to
  $ c \( V \, W \) { & D (1 - d_0^2 / 4) \( V - W \)^2 + 30 h d_0 \( V^2 a^2 + W^2 s^2 \)\
 & + 6 \( V a kappa_(*) + W s macron(kappa)_(*) \) + 12 d_0^2 \( 10 h d_0 W - macron(kappa)_(*) \) } - Theta_(*)^2 . $
  Together with the coefficient-sum formula, these prescriptions produce the displayed rational bounds by addition and multiplication of finite arrays.
  The zero exceptions are as follows, with the third homogeneous index always $N - i - j$. For $cal(B)$, they are the vertex $C$ in $A C E$ and $C B E$, namely $\( 0 \, 10 \, 0 \)$ and $\( 10 \, 0 \, 0 \)$, and also $\( 9 \, 1 \, 0 \)$ in $C B E$. For $L_v$ the only zero is $\( 0 \, 6 \, 0 \)$, the vertex $C$ in $O C U$. For $F + 12 c delta^2 L_b$ on $O S C$, the zeros are exactly $i + j lt.eq 2$. On $S C U$ they are exactly $9 - j lt.eq 2$, together with $\( i \, j \) = \( 0 \, 6 \)$. There are no other exceptions.
  Every nonzero matrix coefficient has positive diagonal entries and positive determinant, and each exceptional matrix is zero. Thus all coefficient matrices are positive semidefinite. The scalar coefficients are all nonnegative. Lemma 31 and the stated domain coverage prove the assertions. ◻
]

=== 8.4 The remaining potential polynomial <the-remaining-potential-polynomial>

#thm([Lemma 8.4.])[
  (The polynomial $F$).  #emph[The polynomial $F = c E_0 - Theta^2$ is nonnegative on $cal(D)$.]
] <lem:potential-certificate>

#proof[
  Use $v = 1 - n + t$, $b = 1 - n - t$. The full domain becomes
  $ 0 lt.eq n lt.eq 1 \, #h(2em) \| t \| lt.eq 1 - n . $
  Write $F_(*) \( n \, t \) = F \( 1 - n + t \, 1 - n - t \)$ for the pullback to these coordinates. It is even in $t$, and direct expansion gives $F_(*) = sum_(j = 0)^4 f_j \( n \) t^(2 j)$, where
  $ 240 f_0 =  & n^3 \( 1 - n \) #scale(x: 120%, y: 120%)[\(] 53511 n^4 - 151593 n^3 + 222537 n^2 - 83607 n + 10256 #scale(x: 120%, y: 120%)[\)] \,\
60 f_1 =  & n #scale(x: 120%, y: 120%)[\(] 19389 n^5 - 418926 n^4 + 523719 n^3 - 289776 n^2 + 67782 n + 10564 #scale(x: 120%, y: 120%)[\)] \,\
60 f_2 =  & - 1260129 n^4 + 1370598 n^3 - 451164 n^2 + 23442 n + 74 \,\
10 f_3 =  & - 12200 n^2 + 2601 n + 75 \, #h(2em) f_4 = - 23 / 5 . $
  For $n < 1$, put $z = t^2 \/ \( 1 - n \)^2 in \[ 0 \, 1 \]$. The degree-four Bernstein coefficients in $z$ are
  $ h_i \( n \) = sum_(j = 0)^i binom(i, j) / binom(4, j) f_j \( n \) \( 1 - n \)^(2 j) \, #h(2em) 0 lt.eq i lt.eq 4 . $
  Define
  $ d_0 \( n \) = n^3 \( 1 - n \) \, #h(2em) d_1 \( n \) = n \( 1 - n \) \, #h(2em) d_2 \( n \) = d_3 \( n \) = d_4 \( n \) = 1 - n . $
  Each quotient $q_i = h_i \/ d_i$ is a polynomial. Applying the interval conversion formula to it on each of the four intervals
  $ \[ 0 \, 1 \/ 4 \] \, quad \[ 1 \/ 4 \, 1 \/ 2 \] \, quad \[ 1 \/ 2 \, 3 \/ 4 \] \, quad \[ 3 \/ 4 \, 1 \] $
  gives the following lower bounds for every coefficient:
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$i$
], table.cell(rowspan: 1, colspan: 1)[Divisor $d_i$
], table.cell(rowspan: 1, colspan: 1)[Degree of $q_i$
], table.cell(rowspan: 1, colspan: 1)[Lower bound
]),
  table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$n^3 \( 1 - n \)$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$3$
],
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$n \( 1 - n \)$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$31$
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$1 - n$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$1 \/ 5$
],
  table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$1 - n$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$12 \/ 5$
],
  table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$1 - n$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$9 \/ 5$
],
)
]
  The complete prescription for each entry is to insert the displayed $f_j$ into $h_i$, cancel the indicated polynomial factor, and apply the coefficient sum in Lemma 31 in the listed degree. In particular, the identities $h_i = d_i q_i$ hold as polynomial identities, including at the endpoints.
  Since every $d_i$ is nonnegative on $\[ 0 \, 1 \]$, every $h_i$ is nonnegative. Therefore
  $ F_(*) = sum_(i = 0)^4 h_i \( n \) binom(4, i) z^i \( 1 - z \)^(4 - i) gt.eq 0 #h(2em) \( n < 1 \) . $
  At $n = 0$, the coordinate $z = t^2$ still covers the entire permitted interval $\| t \| lt.eq 1$; the vanishing of $h_0 \, h_1$ causes no difficulty. At $n = 1$, the domain contains only $t = 0$, and directly $F_(*) \( 1 \, 0 \) = F \( 0 \, 0 \) = f_0 \( 1 \) = 0$. Thus no numerical division by a vanishing factor is required, and all of $cal(D)$ is covered. ◻
]

Lemmas 32, 33, and 34 establish every polynomial inequality used in Section 6. Hence the three estimates of Proposition 28 hold on the stated positive-variable spectral domain. The compatible limit in Section 6 extends them to the zero sets under the nonnegative sectional-curvature hypothesis.

#heading(level: 1)[References]
#bibitem([1])[M.~Berger, #emph[Sur quelques variétés d'Einstein compactes], Ann. Mat. Pura Appl. #strong[53] (1961), 89--95. #link("https://doi.org/10.1007/BF02417787")[doi:10.1007/BF02417787].]
#bibitem([2])[F.~Boudaoud, F.~Caruso, and M.-F.~Roy, #emph[Certificates of Positivity in the Bernstein Basis], Discrete Comput. Geom. #strong[39] (2008), no.~4, 639--655. #link("https://doi.org/10.1007/s00454-007-9042-x")[doi:10.1007/s00454-007-9042-x].]
#bibitem([3])[S.~Brendle, #emph[Einstein manifolds with nonnegative isotropic curvature are locally symmetric], Duke Math. J. #strong[151] (2010), no.~1, 1--21. #link("https://doi.org/10.1215/00127094-2009-061")[doi:10.1215/00127094-2009-061].]
#bibitem([4])[D.~M.~J.~Calderbank, P.~Gauduchon, and M.~Herzlich, #emph[Refined Kato inequalities and conformal weights in Riemannian geometry], J. Funct. Anal. #strong[173] (2000), no.~1, 214--255. #link("https://doi.org/10.1006/jfan.2000.3563")[doi:10.1006/jfan.2000.3563].]
#bibitem([5])[X.~Cao and H.~Tran, #emph[Einstein four-manifolds of pinched sectional curvature], Adv. Math. #strong[335] (2018), 322--342. #link("https://doi.org/10.1016/j.aim.2018.07.003")[doi:10.1016/j.aim.2018.07.003]. Author version: #link("https://arxiv.org/abs/1612.06023v2")[arXiv:1612.06023v2].]
#bibitem([6])[L.~Cheng, #emph[On Positively Curved Einstein Four-Manifolds with Euler Characteristic at Most Three], #link("https://arxiv.org/abs/2609.23337v1")[arXiv:2609.23337v1] \[math.DG\], September 20, 2026.]
#bibitem([7])[E.~Costa, #emph[On Einstein four-manifolds], J. Geom. Phys. #strong[51] (2004), no.~2, 244--255. #link("https://doi.org/10.1016/j.geomphys.2003.10.013")[doi:10.1016/j.geomphys.2003.10.013].]
#bibitem([8])[A.~Derdziński, #emph[Self-dual Kähler manifolds and Einstein manifolds of dimension four], Compositio Math. #strong[49] (1983), no.~3, 405--433. #link("https://www.numdam.org/item/CM_1983__49_3_405_0/")[Journal archive].]
#bibitem([9])[G.~de~Rham, #emph[Sur la réductibilité d'un espace de Riemann], Comment. Math. Helv. #strong[26] (1952), 328--344. #link("https://doi.org/10.1007/BF02564308")[doi:10.1007/BF02564308].]
#bibitem([10])[L.~F.~Di Cerbo, #emph[A rigidity theorem for Einstein 4-manifolds with sectional curvature of a fixed sign, and its consequences], Math. Ann. #strong[396] (2026), article 11. #link("https://doi.org/10.1007/s00208-026-03547-w")[doi:10.1007/s00208-026-03547-w]. Author version: #link("https://arxiv.org/abs/2503.09570v3")[arXiv:2503.09570v3].]
#bibitem([11])[P.~B.~Gilkey, #emph[Invariance Theory, the Heat Equation, and the Atiyah--Singer Index Theorem], Publish or Perish, 1984. #link("https://pages.uoregon.edu/gilkey/dirPDF/InvarianceTheory1Ed.pdf")[Author-hosted electronic reprint, 1996].]
#bibitem([12])[M.~J.~Gursky and C.~LeBrun, #emph[On Einstein manifolds of positive sectional curvature], Ann. Global Anal. Geom. #strong[17] (1999), no.~4, 315--328. #link("https://doi.org/10.1023/A:1006597912184")[doi:10.1023/A:1006597912184].]
#bibitem([13])[M.~J.~Gursky and A.~Malchiodi, #emph[Einstein four-manifolds of positive sectional curvature and ADM mass], #link("https://arxiv.org/abs/2609.30803v1")[arXiv:2609.30803v1] \[math.DG\], submitted September 25, 2026.]
#bibitem([14])[N.~J.~Hitchin, #emph[Kählerian twistor spaces], Proc. London Math. Soc. (3) #strong[43] (1981), no.~1, 133--150. #link("https://doi.org/10.1112/plms/s3-43.1.133")[doi:10.1112/plms/s3-43.1.133].]
#bibitem([15])[S.~Ilias, #emph[Constantes explicites pour les inégalités de Sobolev sur les variétés riemanniennes compactes], Ann. Inst. Fourier (Grenoble) #strong[33] (1983), no.~2, 151--165. #link("https://doi.org/10.5802/aif.921")[doi:10.5802/aif.921].]
#bibitem([16])[T.~Liu, #emph[Toric Einstein 4-manifolds with non-negative sectional curvature], Ann. Global Anal. Geom. #strong[67] (2025), article 14. #link("https://doi.org/10.1007/s10455-025-09990-3")[doi:10.1007/s10455-025-09990-3].]
#bibitem([17])[M.~J.~Micallef and M.~Y.~Wang, #emph[Metrics with nonnegative isotropic curvature], Duke Math. J. #strong[72] (1993), no.~3, 649--672. #link("https://doi.org/10.1215/S0012-7094-93-07224-9")[doi:10.1215/S0012-7094-93-07224-9].]
#bibitem([18])[S.~B.~Myers, #emph[Riemannian manifolds with positive mean curvature], Duke Math. J. #strong[8] (1941), no.~2, 401--404. #link("https://doi.org/10.1215/S0012-7094-41-00832-3")[doi:10.1215/S0012-7094-41-00832-3].]
#bibitem([19])[M.~Obata, #emph[Certain conditions for a Riemannian manifold to be isometric with a sphere], J. Math. Soc. Japan #strong[14] (1962), no.~3, 333--340. #link("https://doi.org/10.2969/jmsj/01430333")[doi:10.2969/jmsj/01430333].]
#bibitem([20])[OpenAI, #emph[Positively curved Einstein four-manifolds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Positively-curved-Einstein-four-manifolds-September-23-2026/paper.pdf")[OAI:Positively-curved-Einstein-four-manifolds-September-23-2026], 2026.]
#bibitem([21])[M.-F.~Roy, #emph[Certificates of Positivity in the Bernstein basis], Oberwolfach Reports, report 14/2007, 800--804. Report on joint work with F.~Boudaoud, F.~Caruso, and R.~Leroy. #link("https://ems.press/content/serial-article-files/46100")[Report].]
#bibitem([22])[D.~Yang, #emph[Rigidity of Einstein 4-manifolds with positive curvature], Invent. Math. #strong[142] (2000), no.~2, 435--450. #link("https://doi.org/10.1007/PL00005792")[doi:10.1007/PL00005792].]


