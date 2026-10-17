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

#align(center)[#text(size: 16pt, weight: "bold")[Abelian covers, Gale correspondences, \
and the Hodge conjecture for powers]]
#align(center)[OpenAI]
#align(center)[September 30, 2026]

== 1 Introduction <introduction>

For a smooth projective complex variety $X$, the rational Hodge conjecture asserts that the cycle class map

$ "CH"^p \( X \)_(bb(Q)) arrow.r H^(2 p) \( X \, bb(Q) \) ∩ H^(p \, p) \( X \, bb(C) \) $

is surjective for every $p$. Its assertion for all self-powers $X^u$ controls classes coupling different copies of $X$ and is stronger than the assertion for $X$ alone. We prove all-self-power results for two families. The first concerns Jacobians of connected abelian covers of curves. The second concerns diagonal complete intersections; their cohomology is supplied by correspondences from the cover Jacobians and CM abelian varieties.

=== 1.1 Abelian covers <abelian-covers>

Fix a compact connected oriented surface $B_(upright("top"))$, a finite labelled set $D$ of branch points, a point $* in.not D$, a finite abelian group $P$, and an epimorphism

$ phi.alt : pi_1 \( B_(upright("top")) \\ D \, * \) arrow.r P $

whose branch meridians have nonidentity image. The associated cover is connected; denote its compact covering surface by $C_(upright("top"))$ and retain a chosen point over $*$. Empty branching and the trivial group are allowed. Vary the full marked complex structure of the pointed base, including all branch positions, and give the cover the induced complex structure. Add labelled unbranched auxiliary points only when needed for stability. Denote the connected marked parameter manifold by $cal(T)_phi.alt$, its fibers by $C_s$, and its marked rational first cohomology by $H_(bb(Q)) = H^1 \( C_(upright("top")) \, bb(Q) \)$.

Let $cal(T)_phi.alt^(upright("Hg"))$ consist of the parameters $s$ with the following property: for every $a gt.eq 0$, any rational tensor in $H_(bb(Q))^(⊗ 2 a)$ of type $\( a \, a \)$ at $s$ has that type throughout $cal(T)_phi.alt$. Lemma 11 proves that this is the complement of a countable union of proper closed analytic tensor Hodge loci. A CM abelian variety here means one whose degree-one Hodge group is a torus; a point is allowed.

#prodef([Theorem 1.1.])[
  (Powers of abelian-cover Jacobians).  #emph[For each fixed connected topological abelian cover as above, every $s in cal(T)_phi.alt^(upright("Hg"))$, every complex CM abelian variety $M$, and every integer $N gt.eq 1$, the rational Hodge conjecture holds in every codimension of 
$ #scale(x: 120%, y: 120%)[\(] "Jac" \( C_s \) times M #scale(x: 120%, y: 120%)[\)]^N . $

 It also holds for $C_s^a times M^b$ for all integers $a \, b gt.eq 0$, where a zeroth power means a point. The point $s$ is chosen before $M$: the same Hodge-generic locus works for every CM companion.]
] <p4:abelian-covers>

The theorem allows every base genus and every branching pattern compatible with the fixed connected cover. Its genericity is taken in the full marked variation. Applying it to a constrained algebraic family requires a comparison with that variation and a check that its exceptional tensor loci pull back properly. The second part of this paper carries out both steps for the curves arising from Gale duality.

=== 1.2 Diagonal complete intersections <diagonal-complete-intersections>

Fix an integer $n gt.eq 2$. For a rank-$c$ matrix $A = \( a_(alpha i) \)$ with $m$ columns, let

$ X_A = {\[ x_1 : dots.h.c : x_m \] in bb(P)^(m - 1) : sum_(i = 1)^m a_(alpha i) x_i^n = 0 quad \( 1 lt.eq alpha lt.eq c \)} . $

Changing the row basis of $A$ does not change $X_A$. We parametrize these intersections by the row space in $"Gr" \( c \, m \)$, retaining the labels of the projective coordinates. Write

$ cal(D)_(c \, m) = { Q in "Gr" \( c \, m \) : upright("every maximal coordinate minor
 of ") Q upright(" is nonzero") } . $

Proposition 26 proves that this is exactly the smooth locus when $1 lt.eq c lt.eq m - 1$. The dimension there is $d = m - c - 1$. For $c = 0$ the parameter space is a point and $X = bb(P)^(m - 1)$.

#prodef([Theorem 1.2.])[
  (Powers of diagonal complete intersections).  #emph[Fix $n gt.eq 2$, $d gt.eq 0$, $c in { 0 \, 1 \, 2 }$, and put $m = d + c + 1$. Outside a countable union of proper closed algebraic subsets of $cal(D)_(c \, m)$, the rational Hodge conjecture holds in every codimension on $X_A^u$ for every $u gt.eq 1$. For $c lt.eq 1$, or for $d = 0$, no exceptional subset is needed.]
] <thm:main>

This is the full smooth family of labelled diagonal presentations of the indicated rank, not the moduli space of the underlying abstract varieties. The Gale construction itself applies at every smooth parameter. The very-general restriction enters only when its dual curve is placed in the locus of Theorem 1.

=== 1.3 Earlier work <earlier-work>

The determinant construction for curves has direct precedent in Schoen’s phase-kernel and permutation quotient [20] Section 1, Lemmas 1.1–1.2. His algebraicity theorem there treats an even-rank setting with a pairable branch tuple [20] Theorem 2.0. His construction also uses the distinguished Abel fiber [20] Section 2, pp. 12–13. We isolate the top exterior character line by this quotient and obtain arbitrary-branch correspondence supply by dominating the distinguished fiber with bundles over Fermat hypersurfaces. The Fermat domination is due to Shioda and Katsura [21]. The supply uses full cohomology of CM sources; an individual unbalanced determinant need not itself be a Hodge class.

The character local systems and their sphere signatures belong to the framework of Deligne and Mostow [6] Corollary 2.21 and Section 2.23. For cyclic covers of the projective line, Rohde proves the full special-unitary connected monodromy of each mixed non-real character eigenspace [19] preprint, Theorem 5.1.1; Moonen records these projections, including the symplectic order-two case, in his study of special subvarieties [16] Proposition 4.7.

The Kodaira–Spencer period differential is classical [12] Theorem 1.27; we give the equivariant calculation needed also when the covering curve has genus one. For mapping-class representations of covers, Landesman, Litt, and Sawin identify connected monodromy with the derived group of the symplectic centralizer in high-genus ranges, including base genus at least four for abelian deck groups [14] Theorem 1.3. Our proof gives the required all-genus character projections and within-cover links directly; the low-genus comparisons do not follow from that theorem. The use of globally Hodge tensors to control monodromy is closely related to André’s argument [1] Section 4, Lemma 4.

The second geometric construction uses classical Gale association: linear orthogonality modulo diagonal rescaling for labelled projective configurations. It is treated systematically by Dolgachev–Ortland [7] and Eisenbud–Popescu [8]; the latter identifies association by complementary linear series [8] preprint, Corollary 3.2. Earlier work on complete intersections of Fermat type includes Aoki [2] and Terasoma [22]. We give the character-level algebraic correspondence argument used here in full, including its support conditions, zero-dimensional endpoints, and Tate shifts. Its evaluation quotient uses the same graded alternating-character mechanism as Schoen’s quotient.

The dual curve in codimension two is a generalized Fermat curve. Its diagonal model, abelian deck group, and normalized branch parameters occur in González-Diez–Hidalgo–Leyton [11] and Hidalgo–Kontogeorgis–Leyton-Álvarez–Paramantzoglou [13]. In our notation, the moduli discussion in [11] author proof, Section 4.2 assumes $\( m - 2 \) \( n - 1 \) > 2$. The Hodge application requires the relative family with a fixed based deck datum, not only its fiberwise model. Section 7 supplies the finite coordinate-root base change, the based lift, and the pathwise comparison with every marked fiber, including the genus-zero and elliptic boundary cases.

The Fermat factors in the Gale correspondence are essential. Classical Hodge results for Fermat varieties include Aoki’s proof of the rational Hodge conjecture for individual Fermat varieties of prime-power degree [3] Corollary 2-3. Our all-powers deduction instead uses full-cohomology source maps from CM abelian varieties, combined with Theorem 1 for mixed powers with one cover Jacobian.

=== 1.4 The proof in outline <the-proof-in-outline>

The common Hodge input is the rational Hodge theorem for every complex CM abelian variety [17] Theorem 1.1. The shared tensor tools from the companion paper on abelian powers reduce balanced degree-one tensors to pairings and top exterior lines. Pairings are algebraic divisor classes. A determinant line is #emph[CM-supplied] when it lies in the span of images of full cohomology groups of CM abelian varieties under rational algebraic correspondences, with the required Tate shifts. A rational Hodge class in that span has a rational Hodge lift to the sources and is therefore algebraic. Section 2 records exactly the definitions and companion statements used here.

Section 3 supplies each character determinant for an abelian cover. A nontrivial character passes to its faithful cyclic quotient; the invariant character uses the polarization. On a finite quotient of a curve power, the relevant character cohomology is the top alternating line. An Abel map concentrates it on one fiber, which is dominated by varieties whose full cohomology is CM-supplied. Deligne’s weight theorem detects the line on these sources, and a correspondence returns it to the curve power. The same section supplies full Fermat cohomology from CM abelian varieties.

Section 4 supplies the other input to the tensor criterion: the derived Hodge action at the marked Hodge-generic points. Disk and handle twists force standard character projections. Comparisons of the full mapping-class actions identify the spaces supported by the same simple Hodge ideal, compatibly with Hodge types at every scalar conjugate. These identifications and the supplied determinants give saturated data, so the tensor criterion remains applicable after adjoining any CM abelian variety.

For the diagonal theorem, assume $c in { 1 \, 2 }$; projective space is handled directly. For a subspace $R subset bb(C)^r$, write

$ X_R = { \[ x_i \] in bb(P)^(r - 1) : \( x_1^n \, dots.h \, x_r^n \) in R } . $

Put $P = ker A$, so $X_P = X_A$. For a character of the phase group $\( mu_n \)^m \/ mu_n$, its support is the set of coordinates with nonzero exponent. Section 5 shows that projection to this support preserves the corresponding nontrivial cohomology.

Write $F_n^a = { z_1^n + dots.h.c + z_(a + 2)^n = 0 } subset bb(P)^(a + 1)$. For the ordinary bilinear pairing, let $Q = P^perp$. Coordinate multiplication defines

$ X_P times X_Q arrow.r F_n^(m - 2) \, #h(2em) \( \[ x_i \] \, \[ y_i \] \) mapsto \[ x_i y_i \] . $

Section 6 proves that a full-support Fermat character line pulls back to a perfect tensor between the two character spaces. At planes obtained by evaluating polynomials at distinct points, it is the exterior coproduct on one curve’s first cohomology; constancy of rank then gives perfectness at every smooth parameter. For a general support $S$, contraction gives a forward rational correspondence from

$ F_n^(\| S \| - 2) times X_(\( "pr"_S P \)^perp) $

whose image contains the corresponding part of $H^d \( X_P \)$. These are maps on whole rational cohomology degrees. If $c = 2$, the only possible positive-dimensional dual source is the connected curve $C = X_(P^perp)$; all other dual sources, and every dual source for $c = 1$, are finite. Each source retains its Fermat factor.

Section 7 identifies the coefficient quotient with the full ordered branch-configuration space. Finite coordinate-root choices identify the algebraic families; configuration paths with transported based lifts reach every marked cover fiber. Tensor Hodge loci then give the algebraic very-general set on which the dual curve satisfies Theorem 1.

Finally, the Fermat correspondences and the Abel map replace all source factors by products $"Jac" \( C \)^v times M$ with $M$ CM; in the one-equation case the Jacobian factor is absent. Section 8 checks the degree shifts and applies the shared correspondence-transfer lemma. The cover locus is independent of $M$, so the same parameter works for every self-power.

== 2 Shared algebraic and tensor tools <sec:shared>

This section fixes the notation needed by the determinant construction and records the precise companion results used in its Hodge-theoretic assembly. Their proofs belong to the companion paper [18] Section 2. No result on split Weil classes is used in this paper.

All varieties are complex, cohomology is singular cohomology, and algebraic correspondences have rational coefficients unless stated otherwise. Put $k = overline(bb(Q)) subset bb(C)$. A scalar automorphism of $k \/ bb(Q)$ acts on coefficients in the cohomology of the fixed complex variety; it does not conjugate the variety. Our Tate convention is $V \( r \)^(p \, q) = V^(p + r \, q + r)$, so $V \( r \)$ has weight $"wt" \( V \) - 2 r$. A class is algebraic over $k$ if it is in the $k$-linear span of rational algebraic cycle classes. For a rational vector space $V$, write $V_k = V ⊗_(bb(Q)) k$.

For a smooth projective variety $X$, define

$ cal(C)^d \( X \) = sum_(B \, j \, Gamma) "im" #h(-0.16667em) (Gamma_(*) : H^(d - 2 j) \( B \, bb(Q) \) arrow.r H^d \( X \, bb(Q) \)) \, #h(2em) Gamma in "CH"^(dim B + j) \( B times X \)_(bb(Q)) \, $

where $B$ ranges over CM abelian varieties, including a point, and $j$ ranges over integers for which the displayed groups and cycles exist. The displayed map is a Hodge map from $H^(d - 2 j) \( B \, bb(Q) \) \( - j \)$. A subspace of $H^d \( X \, k \)$ is #emph[CM-supplied] if it lies in $cal(C)^d \( X \) ⊗_(bb(Q)) k$. Thus the definition uses the full cohomology of the sources. The CM Hodge theorem and the equivalence of this toric CM convention with its convention are [17] Theorem 1.1 and Lemma 2.3.

Let $X$ be an abelian variety or a smooth connected projective curve. A subspace $W subset H^1 \( X \, k \)$ is #emph[admissible] if it is the image of a $k$-linear idempotent whose every scalar conjugate preserves the Hodge decomposition after extension to $bb(C)$. A map between such spaces, or between finite external direct sums of them, is admissible if it preserves the Hodge decomposition after every scalar conjugation. Write $overline(W)$ for scalar complex conjugation. A #emph[pair tensor] between $W \, W'$ is a tensor in $W ⊗ W'$ inducing an isomorphism $W^(*) arrow.r W'$, whose every scalar conjugate has type $\( 1 \, 1 \)$. Symmetry and alternation refer to ordinary tensor interchange, before the cohomological Koszul sign. For $r = dim W$, put

$ D \( W \) = and.big^r W subset W^(⊗ r) subset H^r \( X^r \, k \) \, #h(2em) D \( 0 \) = k $

on separate tensor slots, with $D \( 0 \)$ carried by a point.

For a polarizable rational weight-one Hodge structure $H$ of types $\( 1 \, 0 \) \, \( 0 \, 1 \)$, write $"Hdg" \( H \)$ for the smallest rational algebraic subgroup of $"GL" \( H \)$ containing the Hodge circle. It is connected reductive and lies in the symplectic group of a polarization. A tensor in $H^(⊗ 2 a)$ is #emph[balanced] when it has type $\( a \, a \)$.

#prodef([Companion results 2.1.])[
  #strong[Companion results 3] (Algebraic operations and degree-one tensors).
  + #emph[CM operations.] CM supply is preserved by external products, permutations, cup products, rational algebraic correspondences, $k$-linear combinations of such correspondences, and scalar conjugation. Every rational Hodge class in a CM-supplied subspace is algebraic. [18] Lemma 2.1.
  + #emph[Admissible operations.] Every admissible map is induced on the indicated summands by a $k$-linear combination of rational algebraic correspondences. Pair tensors are algebraic over $k$, and contraction by the inverse pairing is an algebraic cohomological operation. If $W$ is admissible, then $overline(W)$ is admissible and paired with $W$. Alternation and these operations factor determinant lines across admissible direct sums and contract paired determinants nontrivially; an alternating self-pair supplies its top exterior line. [18] Lemma 2.2 and its determinant consequences.
  + #emph[Tensor stabilizer.] Inside the symplectic group of $H$, $"Hdg" \( H \)$ is the pointwise stabilizer of all rational balanced tensors in $H^(⊗ 2 a)$, for all $a gt.eq 0$. [18] Lemma 2.3.
  + #emph[Toric summands.] If $H subset H^1 \( A \, bb(Q) \)$ is a rational Hodge summand of a complex abelian variety and $"Hdg" \( H \)$ is a torus, then $H tilde.eq H^1 \( B \, bb(Q) \)$ for a CM isogeny factor $B$ of $A$. Its scalar extension decomposes into CM embedding lines, with repeated occurrences distinguished. [18] Lemma 2.4.
] <comp:tools>

#prodef([Companion results 2.2.])[
  #strong[Companion results 4] (Saturated determinant criterion).  Let $A$ be a complex abelian variety, $H = H^1 \( A \, bb(Q) \)$, $J = "Hdg" \( H \)$, and $R = J^(upright("der"))$. The following data are called saturated:
  + a rational Hodge summand $H_0 subset H$ with toric Hodge group, together with a decomposition of $H_(0 \, k)$ into CM embedding lines, with repeated occurrences distinguished;
  + a decomposition of the complement of $H_(0 \, k)$ into blocks of nonzero admissible spaces, each admissibly identified with an actual representative $V_i$ carrying an alternating or symmetric self-pair, or, in a linear block with $dim V_i gt.eq 2$, with $V_i$ or $overline(V)_i$, paired with each other; in every block $V_i$ is chosen as an actual summand of that block;
  + containment in the image of $R_k$ of the product
    $ product_(i in I_(upright("Sp"))) "Sp" \( V_i \) times product_(i in I_(upright("SO"))) "SO" \( V_i \) times product_(i in I_(upright("SL"))) "SL" \( V_i \) \, $
    acting standardly on its own copies, dually on the opposite linear copies, and trivially on all other blocks and on $H_(0 \, k)$;
  + CM supply for every singleton $D \( V_i \)$ in an orthogonal or linear block, without a balance condition.
  The symplectic and orthogonal forms in (c) are inverse to the specified pair tensors. The pair in a linear block identifies $overline(V)_i$ with $V_i^(*) \( - 1 \)$ as a Hodge-graded space and with the dual as a group representation. Saturated data imply that every rational balanced tensor is algebraic on its separate $A$-slots and that the rational Hodge conjecture holds on every self-power of $A$. For every CM abelian variety $M$, the induced data on $A times M$ remain saturated and give the same conclusions on all its powers. This is the saturated clause of [18] Theorem 2.5.
] <comp:saturated>

Its separate determinant supply is what makes the cover locus independent of the CM companion. The exact all-period determinant-balance criterion and its proof remain in the companion.

#prodef([Companion results 2.3.])[
  #strong[Companion results 5] (Correspondence transfer).  Let $cal(S)$ be a collection of smooth projective varieties such that the rational Hodge conjecture holds on every finite product of its members. Suppose that, for each smooth projective $Y_i$ in a finite list and each degree $q$, the group $H^q \( Y_i \, bb(Q) \)$ is spanned by maps
  $ Gamma_(*) : H^(q - 2 j) \( S \, bb(Q) \) arrow.r H^q \( Y_i \, bb(Q) \) \, #h(2em) Gamma in "CH"^(dim S + j) \( S times Y_i \)_(bb(Q)) \, quad S in cal(S) . $
  Then the rational Hodge conjecture holds on every finite product of the $Y_i$, with repetitions and with additional members of $cal(S)$. The same holds for restrictions of maps from $k$-linear combinations of rational algebraic correspondences if their images span the full target degree after scalar extension. [18] Lemma 2.6.
] <comp:transfer>

== 3 CM sources for character determinants <p4:sec:determinants>

For an abelian cover, the invariant-tensor theorem will require the top alternating line of each character space in first cohomology. The construction below realizes that line on a finite quotient of a power of the curve. The relevant character cohomology is detected on a distinguished Abel fiber; in the branched case, bundles over Fermat hypersurfaces dominate that fiber, while in the unramified case it is a union of projective spaces. We first give the precise algebraic supply of those hypersurfaces. The same supply will later feed the Gale correspondence in Section 6.

=== 3.1 Fermat cohomology from CM abelian varieties <fermat-cohomology-from-cm-abelian-varieties>

#prodef([Lemma 3.1.])[
  (Finite quotient cohomology).  #emph[If a finite group $G$ acts algebraically on a projective variety $V$, the quotient map $q : V arrow.r V \/ G$ induces 
#[#set math.equation(numbering: n => "(3.1)")
 $ q^(*) : H^i \( V \/ G \, bb(Q) \) arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) H^i \( V \, bb(Q) \)^G . $ <p4:finite-quotient>]

 The assertion remains true after extending coefficients. Pullback is a morphism of mixed Hodge structures; if $V$ is smooth and projective, the cohomology of $V \/ G$ is pure of the indicated degree.]
] <lem:quotient>

#proof[
  The fibers of $q$ are finite, so proper base change gives $R^j q_(*) bb(Q) = 0$ for $j > 0$. Each fiber is one $G$-orbit, hence $\( q_(*) bb(Q) \)^G = bb(Q)$. Averaging makes invariants exact, and Leray gives (3.1), also after extending coefficients. Pullback respects mixed Hodge structures. If $V$ is smooth and projective, strictness of the weight filtration and the displayed injection into $H^i \( V \, bb(Q) \)$ give purity. ◻
]

#prodef([Lemma 3.2.])[
  (Bundle and blowup supply).  #emph[If the full cohomology of a smooth projective variety $S$ is CM-supplied, the same holds for every projective bundle over $S$. If $Z subset X$ is a nonempty smooth closed subvariety of pure codimension $c gt.eq 1$ in a smooth projective variety, and the full cohomologies of $X$ and $Z$ are CM-supplied, the same holds for $"Bl"_Z X$. In both assertions finite correspondence supplies for the inputs give finite supplies for the output in each degree.]
] <p4:bundle-blowup-supply>

#proof[
  For a projective bundle $p : bb(P) \( E \) arrow.r S$ of relative dimension $e - 1$, put $xi = c_1 \( cal(O)_(bb(P) \( E \)) \( 1 \) \)$. The projective-bundle formula is
  $ H^q \( bb(P) \( E \) \, bb(Q) \) = xor.big_(i = 0)^(e - 1) xi^i p^(*) H^(q - 2 i) \( S \, bb(Q) \) . $
  The powers of $xi$ restrict to a basis on each fiber, which proves the formula by Leray–Hirsch. Every displayed map is algebraic.
  For a blowup $b : tilde(X) arrow.r X$ of a center of codimension $c$, let $j : E_Z arrow.r.hook tilde(X)$ be the exceptional divisor and $p : E_Z = bb(P) \( N_(Z \/ X) \) arrow.r Z$. With $xi = c_1 \( cal(O)_(E_Z) \( 1 \) \)$, the blowup formula is
  $ H^q \( tilde(X) \, bb(Q) \) = b^(*) H^q \( X \, bb(Q) \) xor xor.big_(i = 1)^(c - 1) j_(*) #scale(x: 120%, y: 120%)[\(] xi^(i - 1) p^(*) H^(q - 2 i) \( Z \, bb(Q) \) #scale(x: 120%, y: 120%)[\)] . $
  For completeness, the map of relative pairs $\( tilde(X) \, E_Z \) arrow.r \( X \, Z \)$ induces an isomorphism in relative cohomology, since it is an isomorphism off the closed subsets and the quotient spaces obtained by collapsing those subsets agree. On $E_Z$, the projective-bundle formula and $j^(*) j_(*) eta = - xi eta$ show that subtracting the displayed exceptional terms leaves a class whose restriction comes from $Z$. The long exact sequences of the pairs then show that the remaining class comes from $b^(*) H^q \( X \)$. The sum is direct: $b_(*) b^(*) = "id"$, $b_(*)$ kills these exceptional terms, and their restrictions have independent positive powers of $xi$ on $E_Z$. All maps in the formula are algebraic. Companion results 3(i) prove both supply assertions. The formulas contain only finitely many summands, proving the last assertion. ◻
]

#prodef([Proposition 3.3.])[
  (Fermat supply).  #emph[For integers $n gt.eq 2$ and $a gt.eq 0$, let 
$ F_n^a = { x_0^n + dots.h.c + x_(a + 1)^n = 0 } subset bb(P)_(bb(C))^(a + 1) . $

 For every degree $q$, there are finitely many CM abelian varieties $B_nu$, integers $j_nu$, and rational algebraic correspondences $Gamma_nu in "CH"^(dim B_nu + j_nu) \( B_nu times F_n^a \)_(bb(Q))$ such that the sum of their maps 
$ xor.big_nu H^(q - 2 j_nu) \( B_nu \, bb(Q) \) \( - j_nu \) arrow.r^(#h(0.27778em) sum_nu \( Gamma_nu \)_(*) #h(0.27778em)) H^q \( F_n^a \, bb(Q) \) $

 is surjective. One may take every $B_nu$ to be a power of the CM abelian variety $"Jac" \( F_n^1 \)$, allowing its zeroth power, a point. In dimension zero the finite reduced scheme $F_n^0$ is supplied component by component by points.]
] <p4:fermat-supply>

#proof[
  The Fermat hypersurfaces are smooth. The dimension-zero assertion is immediate. The plane curve $F_n^1$ is connected: distinct positive-degree components in $bb(P)^2$ would meet by Bézout’s theorem, making their union singular. For this curve, the coordinate power map is the quotient by $G = \( mu_n \)^3 \/ mu_n$ onto the line $z_0 + z_1 + z_2 = 0$ in $bb(P)^2$, branched only at its three coordinate points. The invariant part of first cohomology vanishes by (3.1). For a nontrivial character $chi$ of $G$, its summand of the finite pushforward of the constant sheaf is a rank-one local system off the branch points where $chi$ is nontrivial on inertia, and has zero stalk at those points. At a point where $chi$ kills inertia it extends across the point, as one sees by passing to the quotient by $ker chi$. If there are $r lt.eq 3$ active points, its Euler characteristic is $2 - r$. The connected curve has no nontrivial character in degrees zero or two, so
  $ dim_k H^1 \( F_n^1 \, k \)_chi = r - 2 lt.eq 1 . $
  Here a character occurring in first cohomology necessarily has $r gt.eq 2$. The Hodge group of the Jacobian commutes with the algebraic deck action. Over $k$ its centralizer on first cohomology is a product of multiplicative groups, since every occurring character has multiplicity one. The connected Hodge group is therefore a torus. Thus $"Jac" \( F_n^1 \)$ is CM. The Abel map supplies the curve’s first cohomology from this Jacobian, and point correspondences supply degrees zero and two.
  We recall the explicit domination associated with Shioda and Katsura [21], including its resolution so that the maps used for supply are algebraic. For $a \, b gt.eq 1$, choose $epsilon in bb(C)$ with $epsilon^n = - 1$. There is a rational map
  #[#set math.equation(numbering: n => "(3.2)")
   $ F_n^a times F_n^b & arrow.r.dashed F_n^(a + b) \,\
\( x \, y \) & mapsto #scale(x: 120%, y: 120%)[\(] \( x_i y_(b + 1) \)_(0 lt.eq i lt.eq a) \, \( epsilon x_(a + 1) y_j \)_(0 lt.eq j lt.eq b) #scale(x: 120%, y: 120%)[\)] . $ <p4:eq:fermat-map>]
  Summing the $n$th powers of the two blocks gives the target equation. To see dominance, take a target point whose first block has nonzero power sum. Rescale its projective coordinates so that this sum is $- 1$; the second block then has power sum $1$. Set $x_(a + 1) = y_(b + 1) = 1$, use the first block for $\( x_0 \, dots.h \, x_a \)$ and $epsilon^(- 1)$ times the second for $\( y_0 \, dots.h \, y_b \)$. These are preimages on the two Fermat hypersurfaces. Source and target have equal dimension, so the map is generically finite.
  The base locus is the smooth codimension-two subvariety
  $ Z = { x_(a + 1) = y_(b + 1) = 0 } tilde.eq F_n^(a - 1) times F_n^(b - 1) . $
  Near each of its points some $x_i$ and some $y_j$ in the displayed blocks are units in projective coordinates. The base ideal of (3.2) is consequently exactly the ideal generated by $x_(a + 1) \, y_(b + 1)$. Blowing up $Z$ removes this ideal and extends the map to a morphism $f : tilde(X) arrow.r F_n^(a + b)$ from a smooth projective variety.
  Induct on the target dimension, using $a = 1$, $b = d - 1$ in dimension $d gt.eq 2$. The product $F_n^1 times F_n^(d - 1)$ and the center $F_n^0 times F_n^(d - 2)$ are supplied by finitely many correspondence maps from powers of $"Jac" \( F_n^1 \)$, by the induction hypothesis and external products. The center may be disconnected; the blowup formula and supply apply to its finitely many smooth components. Lemma 7 gives the same supply for $tilde(X)$. If $e > 0$ is the generic degree of $f$, the projection formula gives $f_(*) f^(*) = e thin "id"$ on rational cohomology. Thus $f_(*)$ is surjective, and composing the supply maps with it supplies the full target cohomology. Every source remains a power of the same Jacobian, and each stage uses finitely many correspondence maps in each degree. ◻
]

=== 3.2 Character determinants on curves <character-determinants-on-curves>

Every nontrivial character of an abelian deck group becomes faithful on the cyclic quotient by its kernel. We first construct the supply for a cyclic cover, then transfer it to the original curve in Corollary 10.

We will use the following elementary vanishing. For a rank-one $k$-local system on a circle with monodromy $a eq.not 1$, the cellular cochain complex is $k arrow.r^(a - 1) k$, hence is acyclic. The cellular complex for a product of circles is the tensor product of the circle complexes. It follows that a rank-one local system with at least one nontrivial monodromy has zero cohomology on $\( bb(C)^times \)^s$, and also on its product with an affine space. Its compactly supported cohomology vanishes as well, by Poincaré duality with the dual local system. The same cellular argument gives ordinary cohomology vanishing for a nontrivial rank-one local system on a compact real torus.

#prodef([Lemma 3.4.])[
  (Faithful cyclic determinants).  #emph[Let $q : C arrow.r B$ be a connected cyclic cover of smooth connected projective complex curves, with group $Delta$ of order $m gt.eq 2$. Let $chi : Delta arrow.r k^times$ be faithful and put $V_chi = H^1 \( C \, k \)_chi$, using inverse pullbacks for the group action. Then $D \( V_chi \)$ is CM-supplied on its product of curve slots. The assertion includes $V_chi = 0$.]
  #emph[More precisely, the CM sources in the defining correspondence span may all be taken to be powers of the fixed CM abelian variety $"Jac" \( F_m^1 \)$, allowing its zeroth power, a point.]
] <p4:cyclic-determinant>

#proof[
  The group-algebra character idempotents and all their scalar conjugates preserve the Hodge decomposition, so $V_chi$ is admissible and its determinant has the meaning fixed in Section 2. We use only the closure assertions of Companion results 3(i), not the Hodge-class conclusion.
  Let $g$ be the genus of $B$ and let $D = t_1 + dots.h.c + t_r$ be its reduced branch divisor. The images of the branch meridians have product one in $Delta$, by the relation in the punctured surface group and commutativity of $Delta$. Thus $r = 0$ or $r gt.eq 2$. The $chi$-part of $q_(*) k_C$ is a rank-one local system on $B \\ D$, with zero stalk at every point of $D$, because $chi$ is faithful on each nontrivial inertia group. Its Euler characteristic is $2 - 2 g - r$. Since $C$ is connected, the nontrivial character does not occur in $H^0 \( C \, k \)$ or $H^2 \( C \, k \)$. Hence
  #[#set math.equation(numbering: n => "(3.3)")
   $ n := dim_k V_chi = 2 g + r - 2 . $ <p4:eq:cyclic-rank>]
  There is no nontrivial connected unramified cover of a genus-zero base, whose fundamental group is trivial. The numerical cases $n = 0$ are therefore $g = 0 \, r = 2$ and $g = 1 \, r = 0$; in either case the determinant is the unit supplied by a point. We assume $n > 0$ from now on.
  ===== 3.2.1 The determinant on a finite quotient. <the-determinant-on-a-finite-quotient.>
  Set $X = C^n$ and $G = Delta^n times.r frak(S)_n$. Multiplication of the cyclic coordinates is a homomorphism $G arrow.r Delta$; let $N$ be its kernel. The finite quotients are
  #[#set math.equation(numbering: n => "(3.4)")
   $ Q : X arrow.r Z = X \/ N \, #h(2em) pi : Z arrow.r Z \/ Delta = B^(\( n \)) := "Sym"^n B . $ <p4:eq:cyclic-quotients>]
  The symmetric power is smooth: in a small disk about each distinct point of a divisor, elementary symmetric functions are coordinates for its cluster of points.
  By (3.1), the pullback of $H^n \( Z \, k \)_chi$ is the subspace of $H^n \( X \, k \)$ on which $\( delta_1 \, dots.h \, delta_n \; tau \)$ acts by $chi \( delta_1 dots.h.c delta_n \)$. On each curve factor this nontrivial character excludes degrees zero and two. The only possible Künneth summand is therefore $V_chi^(⊗ n)$. A geometric permutation of these degree-one factors includes its Koszul sign, so invariance under $frak(S)_n$ means ordinary antisymmetry. Consequently
  #[#set math.equation(numbering: n => "(3.5)")
   $ Q^(*) H^n \( Z \, k \)_chi = D \( V_chi \) . $ <p4:eq:cyclic-determinant-line>]
  In particular $H^n \( Z \, k \)_chi$ is a line.
  Put $U = \( B \\ D \)^(\( n \))$ and $cal(L) = \( pi_(*) k_Z \)_chi$. At a divisor meeting a branch point, the stabilizer of a lifted tuple contains the inertia acting in that coordinate. Its image under the product character is nontrivial. The $chi$-part of the permutation representation on that fiber is therefore zero.
  Over $U$, the map $pi$ is a $Delta$-torsor, including along the diagonals. Indeed, suppose that a deck tuple followed by a permutation fixes a lifted tuple. Around each cycle of the permutation, the product of the deck displacements fixes one point of the unramified cover and hence is the identity. Their total product is therefore the identity, so the residual $Delta$-action is free. To check local triviality at repeated points, choose disjoint disks about the distinct points of the base divisor and label the unramified sheets over each disk. Quotienting the sheet labels by $N$ retains only their total product, while the coordinate permutations give the symmetric powers of the disks. This yields $m$ local copies of the base neighborhood. Thus $cal(L)$ is extension by zero of a rank-one local system on $U$.
  Its monodromy can be read from moving divisors. Follow the $n$ points along a loop and multiply the deck displacements of their lifted paths; their order at the endpoint may be permuted. Closing these paths to a fixed base point cancels the auxiliary paths because $Delta$ is abelian. The product is the original cover monodromy on the sum of the moving paths in $H_1 \( B \\ D \, upright(bold(Z)) \)$, with multiplicities. One may first make this calculation off the diagonals and perturb a loop to avoid them; the local triviality just proved gives the same rule on all of $U$.
  For both cases below, let
  $ u : B^(\( n \)) arrow.r "Pic"^n B $
  be the Abel map, sending an effective divisor to its line bundle. The fiber over $L$ is its complete linear system $\| L \| = bb(P) H^0 \( B \, L \)$, where projective space parametrizes lines. In both cases $deg K_B \( D \) = n$. Put
  $ L_0 = K_B \( D \) \, #h(2em) T = \( pi^(- 1) \( \| L_0 \| \) \)_(upright("red")) . $
  Schoen’s construction also uses this distinguished Abel fiber [20] Section 2, pp. 12–13. We will show that restriction to $T$ detects $H^n \( Z \, k \)_chi$ and construct a proper surjection onto $T$ from smooth projective varieties with CM-supplied cohomology. Detection maps the determinant into source cohomology. After the two geometric cases, purity and Poincaré duality will turn this detection into supply in the required direction, through a correspondence obtained from the fiber product with $C^n arrow.r Z$.
  ===== 3.2.2 Localization in the branched case. <localization-in-the-branched-case.>
  Suppose $r > 0$. Then $n gt.eq 2 g$. For $L eq.not L_0$, the evaluations
  #[#set math.equation(numbering: n => "(3.6)")
   $ H^0 \( B \, L \) arrow.r xor.big_(i = 1)^r L \|_(t_i) $ <p4:eq:cyclic-evaluations>]
  are surjective. In fact, $H^1 \( B \, L \) = 0$ since $deg L = n > 2 g - 2$. By the evaluation sequence and Serre duality, the obstruction is dual to $H^0 \( B \, K_B ⊗ L^(- 1) \( D \) \)$. This is the space of sections of a nontrivial degree-zero line bundle and is zero. Riemann–Roch gives kernel dimension $g - 1$. If an $L eq.not L_0$ exists then $g gt.eq 1$, since $"Pic"^n bb(P)^1$ is a point. Coordinates adapted to the independent evaluations give
  #[#set math.equation(numbering: n => "(3.7)")
   $ \| L \| ∩ U tilde.eq bb(A)^(g - 1) times \( bb(C)^times \)^(r - 1) . $ <p4:eq:cyclic-generic-complement>]
  The restriction of $cal(L)$ to this complement is nontrivial. Choose a section on one evaluation hyperplane and no other, and take a transverse analytic disk through it in $\| L \|$. The chosen evaluation has a simple zero in the disk parameter. Even if the section has a multiple zero at that branch point, Weierstrass preparation says that the product of the nearby root coordinates is that evaluation times a nonvanishing function. On the boundary of the disk the sum of the winding numbers of those roots about the branch point is therefore one. All other roots remain in disks away from the branch set. The moving-divisor rule identifies the monodromy with the nontrivial inertia character there. Collisions away from the branch set can be perturbed apart, by local triviality across the diagonals.
  The torus vanishing above now makes the compactly supported cohomology of (3.7) with these coefficients zero. Because $cal(L)$ is extension by zero and $\| L \|$ is compact, this is $H^(*) \( \| L \| \, cal(L) \|_(\| L \|) \)$. Proper base change shows that each $R^j u_(*) cal(L)$ is supported at $L_0$. A sheaf supported at one closed point has no higher cohomology. The Leray edge map, followed by proper base change for $pi$, therefore gives the restriction isomorphism
  #[#set math.equation(numbering: n => "(3.8)")
   $ H^n \( Z \, k \)_chi arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) H^n \( T \, k \)_chi . $ <p4:eq:cyclic-exceptional-restriction>]
  When $g = 0$ there is no other Picard fiber, so the same conclusion is immediate. Reduction does not change the underlying cohomology.
  ===== 3.2.3 Fermat sources over the exceptional fiber. <fermat-sources-over-the-exceptional-fiber.>
  We next construct a proper surjection onto $T$ from smooth projective varieties whose full cohomology is CM-supplied. The residue sequence and the residue theorem give an exact sequence
  $ 0 arrow.r G_0 := H^0 \( B \, K_B \) arrow.r H^0 \( B \, K_B \( D \) \) arrow.r R := { \( w_1 \, dots.h \, w_r \) in bb(C)^r : sum_i w_i = 0 } arrow.r 0 . $
  The surjectivity on the right also follows by Riemann–Roch. Choose a vector-space splitting, so $\| L_0 \| = bb(P) \( G_0 xor R \)$. Its evaluation hyperplane at $t_i$ is $w_i = 0$: a meromorphic differential with at most a simple pole there vanishes at $t_i$ as a section of $K_B \( D \)$ exactly when its residue is zero. These hyperplanes are distinct for $r gt.eq 3$; the two hyperplanes coincide for $r = 2$.
  The finite reduced map $T arrow.r \| L_0 \|$ is still a quotient by $Delta$. Averaging shows that invariants commute with quotienting the ideal defining $\| L_0 \|$, and taking reductions leaves its reduced quotient unchanged. Every component of $T$ dominates $\| L_0 \|$. At least one does, since the finitely many closed images of the components cover an irreducible base. Its image is then the whole base, so it meets every fiber. Each fiber is a single $Delta$-orbit, and its translates therefore cover $T$. Every component is one of those translates.
  Let $F = bb(C) \( \| L_0 \| \)$. Over $F$ the cover is a possibly disconnected $mu_m$-torsor, after identifying $Delta$ with $mu_m$. Kummer theory writes its algebra as $F \[ z \] \/ \( z^m - f \)$ for some $f in F^times$. It is unramified away from the distinct evaluation hyperplanes. Thus the valuation of $f$ at every other prime divisor is divisible by $m$: a Kummer class extending over that divisor’s discrete valuation ring is represented there by a unit times an $m$th power.
  Write the distinct hyperplanes as $H_i = { ell_i = 0 }$, $1 lt.eq i lt.eq s$, with $ell_i$ chosen among the residue coordinates. For $i gt.eq 2$, choose an integer $a_i$ representing the valuation of $f$ at $H_i$ modulo $m$. The degree of a principal divisor is zero. Since each $H_i$ has degree one and every other valuation is divisible by $m$, the valuation at $H_1$ is $- sum_(i gt.eq 2) a_i$ modulo $m$. Hence
  $ "div" (f #scale(x: 180%, y: 180%)[\/] product_(i = 2)^s \( ell_i \/ ell_1 \)^(a_i)) = m E $
  for an integral divisor $E$ on $\| L_0 \|$. The Picard group of projective space is torsion-free, so $E$ is principal. It follows that
  #[#set math.equation(numbering: n => "(3.9)")
   $ f = c h^m product_(i = 2)^s \( ell_i \/ ell_1 \)^(a_i) \, #h(2em) c in bb(C)^times \, quad h in F^times . $ <p4:eq:cyclic-kummer-class>]
  This includes all prime divisors, not only those in an affine chart. When $r = 2$ we have $s = 1$, so the product is empty and the generic torsor splits.
  The coordinate power map
  $ s_m : F_m^(r - 2) arrow.r bb(P) R \, #h(2em) \[ u_1 : dots.h.c : u_r \] mapsto \[ u_1^m : dots.h.c : u_r^m \] $
  is finite and surjective. Form the smooth projective bundle
  #[#set math.equation(numbering: n => "(3.10)")
   $ Y = bb(P)_(F_m^(r - 2)) (\( G_0 ⊗ cal(O) \) xor s_m^(*) cal(O)_(bb(P) R) \( - 1 \)) . $ <p4:eq:cyclic-fermat-bundle>]
  The tautological subline of $R$ defines a morphism $Y arrow.r bb(P) \( G_0 xor R \) = \| L_0 \|$. On each component this map is dominant and generically finite: away from zero $R$-coordinate its fibers are the finite fibers of $s_m$. The pullbacks of the hyperplane ratios in (3.9) are $\( u_i \/ u_1 \)^m$. The scalar $c$ also has an $m$th root in $bb(C)$. The generic torsor algebra therefore splits over the function field of each component of $Y$. Evaluating at its roots gives rational lifts to every prescribed component of $T$.
  Each rational lift extends to a morphism. Indeed, for a normal integral variety mapping to a base, a rational lift to a scheme finite over that base sends each element of the finite affine algebra to a rational function integral over every local ring of the source. Normality makes it regular; the resulting local lifts glue. The image here is closed by properness and contains the generic point of the prescribed component of $T$, so the lift surjects onto it. Taking disjoint copies of the required components of $Y$ gives a proper surjection
  #[#set math.equation(numbering: n => "(3.11)")
   $ Y' arrow.r T $ <p4:eq:cyclic-smooth-surjection>]
  from smooth projective components of dimension $g + r - 2$. Proposition 8 and Lemma 7 supply their full cohomology. The vector space $G_0$ in (3.10) is constant, so this construction uses no cohomology of $B$. For $r = 2$, $F_m^0$ is a finite set and $Y'$ is a union of projective spaces, as needed.
  ===== 3.2.4 Localization and supply in the unramified case. <localization-and-supply-in-the-unramified-case.>
  Suppose instead that $r = 0$. Since $n > 0$, (3.3) gives $g gt.eq 2$ and $n = 2 g - 2$. The character of the cover factors through $H_1 \( B \, upright(bold(Z)) \)$, the period lattice of $"Jac" \( B \)$. It defines a nontrivial rank-one local system $cal(E)$ on $"Pic"^n B$, after choosing an origin on that torsor. The moving-divisor rule gives $cal(L) = u^(*) cal(E)$.
  Riemann–Roch and Serre duality give
  $ h^0 \( B \, L \) = g - 1 quad \( L eq.not K_B \) \, #h(2em) h^0 \( B \, K_B \) = g . $
  Thus the fibers of $u$ are $bb(P)^(g - 2)$ except for the fiber $bb(P)^(g - 1)$ over $K_B$. Choose an ample line bundle on $B^(\( n \))$. Its $j$th Chern power restricts to a nonzero generator in degree $2 j$ on every fiber for $0 lt.eq j lt.eq g - 2$. It defines, by proper base change, a stalkwise isomorphism $k tilde.eq R^(2 j) u_(*) k$ in each such degree. All odd direct images vanish, and the only remaining one is $R^(2 g - 2) u_(*) k$, a rank-one skyscraper at $K_B$.
  By the projection formula the direct images for $u^(*) cal(E)$ are these sheaves tensored with $cal(E)$. The cohomology of $cal(E)$ on the compact real torus underlying $"Pic"^n B$ vanishes by the calculation at the start of the subsection. Leray leaves only the skyscraper term. Here $L_0 = K_B$, so the Leray edge map and proper base change give the same restriction isomorphism (3.8). The torsor on $\| K_B \| = bb(P)^(g - 1)$ splits, since this projective space is simply connected. Hence $T$ itself is a disjoint union of projective spaces of dimension $g - 1$. We may take $Y' = T$; its full cohomology is supplied by points.
  ===== 3.2.5 Detection on a smooth source and return to the curve product. <detection-on-a-smooth-source-and-return-to-the-curve-product.>
  In either case we have a proper surjection $Y' arrow.r T$ from smooth projective components whose full cohomology is CM-supplied. We use the following precise consequence of proper cohomological descent: if $T$ is proper and $Y' arrow.r T$ is a proper surjection with $Y'$ smooth, then
  #[#set math.equation(numbering: n => "(3.12)")
   $ ker #scale(x: 120%, y: 120%)[\(] H^n \( T \, bb(Q) \) arrow.r H^n \( Y' \, bb(Q) \) #scale(x: 120%, y: 120%)[\)] = W_(n - 1) H^n \( T \, bb(Q) \) . $ <p4:eq:cyclic-weight-kernel>]
  This is Deligne’s Proposition 8.2.5 [5] Proposition 8.2.5, p. 39: its proof injects the weight-$n$ quotient into $H^n \( Y' \, bb(Q) \)$. Properness of $T$ bounds its weights above by $n$, and the proper smooth $Y'$ has pure degree-$n$ cohomology, giving the displayed kernel equality. The proposition requires neither $T$ irreducible nor $Y'$ connected, so applies here.
  By (3.1), $H^n \( Z \, bb(Q) \)$ is pure of weight $n$, since it injects into $H^n \( X \, bb(Q) \)$ and $X = C^n$ is smooth and projective. Restriction to $T$ is a morphism of mixed Hodge structures. Strictness therefore gives
  $ "im" #scale(x: 120%, y: 120%)[\(] H^n \( Z \, bb(Q) \) arrow.r H^n \( T \, bb(Q) \) #scale(x: 120%, y: 120%)[\)] ∩ W_(n - 1) H^n \( T \, bb(Q) \) = 0 . $
  Extend scalars to $k$ and take a nonzero $alpha in H^n \( Z \, k \)_chi$. Its restriction is nonzero by (3.8). It survives on some component $Y_0$ of $Y'$ by (3.12). Write $p : Y_0 arrow.r T arrow.r Z$ and $d = dim Y_0$. Poincaré duality provides
  $ beta in H^(2 d - n) \( Y_0 \, k \) \, #h(2em) integral_(Y_0) p^(*) alpha smile beta eq.not 0 . $
  Here $\( d \, 2 d - n \) = \( g + r - 2 \, r - 2 \)$ in the branched case and $\( d \, 2 d - n \) = \( g - 1 \, 0 \)$ in the unramified case. In particular these are valid degrees. The class $beta$ is CM-supplied because the full cohomology of $Y_0$ is.
  Choose an irreducible component of the finite surjection $Y_0 times_Z X arrow.r Y_0$ which dominates $Y_0$, and resolve it projectively. The resulting smooth projective variety $tilde(Y)$ fits into the commutative square
  $ tilde(Y) & arrow.r^(med l med) & X = C^n\
h arrow.b &  & arrow.b Q\
Y_0 & arrow.r^(med p med) & Z \, $
  where $p$ factors as $Y_0 arrow.r T arrow.r Z$, $h$ has positive generic degree $e$, and $Q l = p h$. The component $Y_0$ has full CM supply and detects $p^(*) alpha$; the resolving variety $tilde(Y)$ is used only to realize the return correspondence $l_(*) h^(*)$. The algebraic correspondence
  $ Gamma = \( h \, l \)_(*) \[ tilde(Y) \] in "CH"^n \( Y_0 times X \)_(bb(Q)) $
  induces $l_(*) h^(*)$. Its cohomological degree shift is $2 \( n - d \)$, so it sends $beta$ to $H^n \( X \, k \)$. This image is CM-supplied by Companion results 3(i). Only the pullback of $beta$ is used; no supply assertion about the cohomology of $tilde(Y)$ is required. Projection formula gives
  #[#set math.equation(numbering: n => "(3.13)")
   $ integral_X Q^(*) alpha smile Gamma_(*) beta = integral_(tilde(Y)) h^(*) \( p^(*) alpha smile beta \) = e integral_(Y_0) p^(*) alpha smile beta eq.not 0 . $ <p4:eq:cyclic-return-pairing>]
  Let $rho : G arrow.r k^times$ be $rho \( delta_1 \, dots.h \, delta_n \; tau \) = chi \( delta_1 dots.h.c delta_n \)$. The inverse-character idempotent is
  $ P_(rho^(- 1)) = frac(1, \| G \|) sum_(a in G) rho \( a \) a . $
  It is a $k$-linear combination of algebraic automorphism graphs. The integration pairing is $G$-invariant, while $Q^(*) alpha$ transforms by $rho$. Averaging (3.13) therefore gives
  $ integral_X Q^(*) alpha smile P_(rho^(- 1)) Gamma_(*) beta = integral_X Q^(*) alpha smile Gamma_(*) beta eq.not 0 . $
  The calculation for (3.5) identifies the image of $P_(rho^(- 1))$ in degree $n$ with $D \( H^1 \( C \, k \)_(chi^(- 1)) \)$; the inverse character has the same rank $n$ by (3.3). This determinant line is thus CM-supplied. Complex conjugation of coefficient scalars sends $chi^(- 1)$ to $chi$, since its values are roots of unity. It preserves the rational correspondence span by Companion results 3(i), proving the assertion for $D \( V_chi \)$.
  Finally, in the branched case Proposition 8 starts the supply in (3.10) from powers of $"Jac" \( F_m^1 \)$. The projective-bundle maps and all subsequent maps merely compose those rational correspondences, and coefficient conjugation preserves their rational image span. The unramified and zero-rank cases use a point. This proves the stated fixed-source refinement. ◻
]

#prodef([Corollary 3.5.])[
  (Determinants for abelian covers).  #emph[Let a finite abelian group $P$ act faithfully on a smooth connected projective complex curve $C$, and put $B = C \/ P$. For every character $chi : P arrow.r k^times$, the line $D \( H^1 \( C \, k \)_chi \)$ is CM-supplied. This includes the zero character spaces. For the trivial character the line is generated by a rational algebraic cycle class.]
  #emph[For $chi eq.not 1$, let $r_chi$ be the number of branch points of $C \/ ker chi arrow.r B$. Then 
$ dim_k H^1 \( C \, k \)_chi = 2 g \( B \) + r_chi - 2 . $

 The number $r_chi$ counts precisely the original branch points whose inertia is not killed by $chi$.]
  #emph[For a fixed $P$, the CM sources for all these lines can be taken to be powers of one fixed product of Fermat-curve Jacobians depending only on $P$, not on the complex structure of $C$.]
] <p4:abelian-determinants>

#proof[
  Suppose first that $chi eq.not 1$ and put $K = ker chi$. The quotient $C_chi = C \/ K$ is a smooth connected projective curve; locally the quotient of a smooth curve by its finite stabilizer has parameter $t^e$. The residual group $P \/ K$ is cyclic and $chi$ is faithful on it. Its action on $C_chi$ is effective. Indeed, choose a point of $C$ with trivial $P$-stabilizer, outside the finitely many fixed points of nonidentity automorphisms. If a coset acted trivially on $C \/ K$, it would send this point into its $K$-orbit, forcing the coset to be the identity.
  Equivariantly for the residual action, (3.1) identifies
  $ H^1 \( C_chi \, k \)_chi arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) H^1 \( C \, k \)_chi $
  by quotient pullback. A point of $B$ is branched in $C_chi arrow.r B$ exactly when its original inertia has nontrivial image in $P \/ K$. Lemma 9 applies to this connected cyclic quotient and gives its determinant supply; (3.3) gives the dimension formula. The tensor power of the rational graph pullback sends that determinant line to $D \( H^1 \( C \, k \)_chi \)$, by Companion results 3(i). If the character space is zero both lines are the unit. This includes a quotient that becomes unramified although the original cover is branched.
  For $chi = 1$, quotient pullback identifies the character space with $H^1 \( B \, k \)$. Choose a point $b in B$. The rational algebraic class
  $ \[ Delta_B \] - \[ b times B \] - \[ B times b \] $
  is the $H^1 \( B \) ⊗ H^1 \( B \)$ component of the diagonal and, up to the cup-pairing convention, is the inverse symplectic tensor. If $g = g \( B \)$, antisymmetrizing its $g$th external power gives a nonzero multiple of the top exterior power of this nondegenerate alternating tensor. It therefore generates $D \( H^1 \( B \, k \) \)$ by a rational algebraic class. For $g = 0$ this is the unit. Pullback on the curve slots proves the assertion.
  For the last assertion, let $cal(O) \( P \)$ be the finite set of orders of nontrivial characters of $P$, and set
  $ M_P = product_(m in cal(O) \( P \)) "Jac" \( F_m^1 \) \, $
  with the empty product interpreted as a point. The faithful lemma uses powers of the indicated factor for a character of order $m$, and the trivial case uses a point. Each such factor power is supplied from the corresponding power of $M_P$ by its algebraic factor inclusion and projection. The product $M_P$ is CM. This proves the uniform choice of sources. ◻
]

== 4 Abelian covers with full marked variation <p4:sec:covers>

We now apply the determinant criterion to Jacobians of abelian covers. The determinant of each nontrivial character space is supplied by its cyclic quotient, and the invariant determinant by the polarization. The remaining task is to describe the derived Hodge action: individual character projections must be standard, and characters on which the same simple ideal acts must be identified by algebraic correspondences. The second point is essential in small base genus.

=== 4.1 The marked family and its Hodge-generic locus <the-marked-family-and-its-hodge-generic-locus>

Fix a compact connected oriented surface $B_(upright("top"))$ of genus $h gt.eq 0$, a finite labelled set $D subset B_(upright("top"))$, a point $* in.not D$, a finite abelian group $P$, and an epimorphism

$ phi.alt : pi_1 \( B_(upright("top")) \\ D \, * \) arrow.r P . $

The meridian of every point in $D$ is required to have nonidentity image. The images of the meridians multiply to one, by the surface relation, and together with the handle images generate $P$. The epimorphism describes a connected unramified $P$-cover off $D$; compactifying at a meridian of order $e$ uses the local map $u mapsto u^e$. Denote the resulting compact surface by $C_(upright("top"))$. The trivial group and the empty branch set are permitted.

Add labelled unbranched auxiliary points if needed so that the marked base, including $*$, is stable. On the additionally punctured surface, extend $phi.alt$ by sending their meridians to the identity element. Let $cal(T)_phi.alt$ be the connected Teichmüller manifold of the resulting labelled surface. We vary its #emph[full] marked complex structure: no branch positions or base-complex-structure directions are held fixed. Lifting the charts off $D$ and filling with the fixed local power maps gives a smooth proper holomorphic family of compact curves $C_s$, locally on $cal(T)_phi.alt$. Its first cohomology is a marked polarized variation on

$ H_(bb(Q)) = H^1 \( C_(upright("top")) \, bb(Q) \) \, #h(2em) H_(bb(Z)) = H^1 \( C_(upright("top")) \, bb(Z) \) . $

As in Section 2, put $k = overline(bb(Q))$ and write $H_K = H_(bb(Q)) ⊗_(bb(Q)) K$ for $K = k \, bb(C)$. Auxiliary points do not alter these curves or their cohomology. They only provide stable marked parameter spaces in the small cases.

Let $Gamma$ be the stabilizer of the exact epimorphism $phi.alt$ in the pure based mapping class group, with all the labels fixed. It has finite index because there are finitely many homomorphisms from the finitely generated surface group to $P$. After choosing a point above $*$, every element of $Gamma$ has a unique lift fixing that point. The lift commutes with $P$ and acts integrally and symplectically on $H_(bb(Q))$. It respects the marked variation. We use inverse pullbacks for left actions; replacing all actions by their opposites would not change the algebraic closures. These are the standard marked-surface and Dehn-twist conventions; see [10] Chapters 2, 3, and 6.

#prodef([Lemma 4.1.])[
  (The Hodge-generic locus of the marked family).  #emph[For $a gt.eq 0$ and $t in H_(bb(Q))^(⊗ 2 a)$, let 
$ Z_t = { s in cal(T)_phi.alt : t_(bb(C)) in F^a \( H_(bb(C))^(⊗ 2 a) \)_s } \, #h(2em) cal(T)_phi.alt^(upright("Hg")) = cal(T)_phi.alt \\ union.big_(a gt.eq 0 \, med t in H_(bb(Q))^(⊗ 2 a)\
Z_t eq.not cal(T)_phi.alt) Z_t . $

 Each $Z_t$ is closed complex analytic. The complement $cal(T)_phi.alt^(upright("Hg"))$ is nonempty and is the complement of a countable union of proper closed analytic subsets. At a point in this complement, every rational balanced tensor is balanced throughout $cal(T)_phi.alt$.]
  #emph[Here $H_s$ denotes $H_(bb(Q))$ with the Hodge structure at $s$. Let $J_s = "Hdg" \( H_s \)$ and let $L$ be the rational Zariski closure of $Gamma$ in the symplectic group of $H_(bb(Q))$. At every $s in cal(T)_phi.alt^(upright("Hg"))$ one has $L^compose subset J_s$, and the whole $Gamma$ normalizes $J_s$.]
] <p4:generic-tensors>

#proof[
  A rational tensor is real. In weight $2 a$, it has type $\( a \, a \)$ exactly when it belongs to $F^a$: reality then also places it in $overline(F^a)$, whose intersection with $F^a$ is the $\( a \, a \)$ part. Membership in the holomorphic subbundle $F^a$ is the vanishing of the induced section of its quotient bundle, so $Z_t$ is closed analytic. There are countably many rational tensors. A proper analytic subset of the connected complex manifold is nowhere dense, and Baire’s theorem proves the nonemptiness assertion. Odd tensor degrees have no balanced vectors, since the circle element $- 1$ acts on them by $- 1$.
  At a point in the displayed complement, the balanced rational tensors are exactly those balanced at every marked parameter. The latter spaces are preserved by $Gamma$, because it acts equivariantly on the whole variation. By Companion results 3(iii), their pointwise stabilizer in the symplectic group is $J_s$. Thus every element of $Gamma$ normalizes $J_s$.
  An individual globally balanced tensor has finite $Gamma$-orbit. We use the finite-action argument of [1] Section 4, Lemma 4. If its denominator is $q$ in the integral tensor lattice, every translate still lies in $q^(- 1) H_(bb(Z))^(⊗ 2 a)$, and its tensor-polarization norm is unchanged by transport. At a fixed fiber all its translates lie in the real balanced subspace. The tensor polarization, with its fixed weight sign, is definite on that subspace. A fixed norm sphere there is compact and contains only finitely many points of this lattice. The orbit is therefore finite. The connected algebraic group $L^compose$ fixes every such tensor, so Companion results 3(iii) give $L^compose subset J_s$. ◻
]

The definition of $cal(T)_phi.alt^(upright("Hg"))$ specifies the entire exceptional locus used below. It is a locus in the full marked family; a proper subfamily inherits the conclusion only after verifying that these tensor loci pull back properly.

#prodef([Proposition 4.2.])[
  (Saturated data for the marked cover family).  #emph[For every connected topological abelian cover and full marked family defined above, and every $s in cal(T)_phi.alt^(upright("Hg"))$, the Jacobian $"Jac" \( C_s \)$ admits saturated data in Companion results 4.]
] <p4:cover-saturation>

This proposition supplies the tensor input for Theorem 1. Write $C arrow.r B$ for a fiber of the fixed marked family. Its character decomposition is

$ H_k = xor.big_chi W_chi \, #h(2em) W_chi = e_chi H_k \, #h(2em) e_chi = frac(1, \| P \|) sum_(g in P) chi \( g \)^(- 1) g in k \[ P \] . $

Every scalar conjugate of $e_chi$ is again a deck-character projector, so it preserves the Hodge decomposition. Thus the $W_chi$ are admissible in the sense of Section 2. The marking identifies these spaces and the mapping-class operators across all fibers.

Corollary 10 already supplies their determinant lines. We must establish two properties of their Hodge-group action. First, every character space with nontrivial derived action has standard special linear or symplectic projection. Second, when one simple Hodge Lie ideal acts on several such spaces, their standard or dual identifications must preserve the Hodge circle at every scalar conjugate. Rank-one twist operators give the projections; the comparison of spaces will depend on whether the base has positive genus or is a sphere.

=== 4.2 A rank-one criterion for standard actions <a-rank-one-criterion-for-standard-actions>

#prodef([Lemma 4.3.])[
  (Rank-one nilpotents).  #emph[Let $V$ be a finite-dimensional vector space over $k = overline(bb(Q))$, and let a connected reductive algebraic subgroup of $"GL" \( V \)$ act irreducibly. If its Lie algebra contains a rank-one nilpotent, its derived image is the standard special linear or standard symplectic group on $V$.]
] <p4:cover-rank-one>

#proof[
  It is enough to prove the Lie algebra assertion, since the groups in the conclusion are connected. Extending scalars from $k$ to $bb(C)$ preserves irreducibility, semisimplicity, and the rank condition, so we work over $bb(C)$. In the symplectic alternative the invariant alternating form descends to $k$: invariant forms are the kernel of linear equations over $k$, and the determinant is nonzero on a suitable alternating form with coefficients in $k$. Equality of the connected group images then descends under scalar extension. The center acts by scalars. The Jordan decomposition in an algebraic Lie algebra shows that a nilpotent element has zero central component and nilpotent components in its simple ideals. Write the irreducible representation of the semisimple image as a tensor product $⨂_i V_i$ of nontrivial irreducibles for its simple ideals.
  Let $N$ be the given rank-one nilpotent. In particular $N^2 = 0$. If two of its simple-ideal components $N_i \, N_j$ were nonzero, choose length-two terminal Jordan strings in $V_i \, V_j$ and kernel vectors in the other factors. On the tensor product of the top vectors of these strings, $N^2$ is $2 N_i ⊗ N_j eq.not 0$. This is impossible. If just $N_i$ is nonzero, its rank on $V$ is $"rank" \( N_i \) product_(j eq.not i) dim V_j$. Rank one therefore forces the semisimple image to be simple.
  Put $N$ in the nilradical of a Borel subalgebra of this simple image. A generic one-parameter subgroup of its maximal torus, together with a scalar rescaling, degenerates $N$ to a nonzero root vector $x_alpha$. The locus of matrices of rank at most one is closed, so $x_alpha$ has rank one. Every root vector for a root of the same length has rank one, by Weyl conjugacy. Restriction to the corresponding root $frak(s l)_2$ consequently consists of one standard doublet and trivial representations: the rank of the raising operator on an irreducible $frak(s l)_2$-module of dimension $a$ is $a - 1$. Thus each reflection in a root of that length exchanges exactly two weights, both of multiplicity one, and fixes every other weight.
  Here is the root-system check that finishes the argument. We use the usual classification and weight lattices of reduced irreducible root systems, as in [9] Sections 23–25 and 30. The roots of a specified length form a full-rank simply laced root system, not necessarily a closed root subsystem of the ambient root system: the whole system in simply laced type; $D_ell$ or $A_1^ell$ in types $B_ell$ and $C_ell$; $D_4$ in type $F_4$; and $A_2$ in type $G_2$. Use the small-rank conventions $D_3 = A_3$ and $D_2 = A_1 union.sq A_1$.
  The simple reflections of this root system act as distinct transpositions on the weights. They are distinct because the weights span the dual Cartan space. Orthogonal simple roots give disjoint transpositions, while adjacent simple roots give transpositions sharing one endpoint. A branching vertex of the Dynkin diagram would require three disjoint transpositions each meeting the same two-element set, which is impossible. A connected full-rank path $A_ell$ therefore acts on precisely $ell + 1$ moved weights as successive transpositions on a path. All other weights, being fixed by this full-rank root system, are zero. The moved weights form its standard regular simplex: their successive differences are the simple roots with a consistent choice of sign, as follows by pairing with adjacent simple coroots. In full type $A_ell$ the highest weight is thus the first or last fundamental weight. Irreducibility gives the standard representation or its dual. If this path arose instead from $G_2$, $B_3$, or $C_3$, the full Weyl group contains negation, whereas this simplex, for $ell gt.eq 2$, is not stable under negation. Those cases are excluded.
  It remains to consider the orthogonal-axis root system $A_1^ell$. Its transpositions are disjoint. A moved weight for one axis is fixed by every other axis reflection, so lies on that axis; the doublet condition makes its two weights $plus.minus alpha \/ 2$. For the long roots $2 e_i$ in $C_ell$, this gives the weights $plus.minus e_i$, and the highest weight is that of the symplectic standard representation. For the short roots $e_i$ in $B_ell$, the vectors $plus.minus e_i \/ 2$ are not weights when $ell gt.eq 2$. In the rank-two $D_2$ root system the half-roots $\( plus.minus e_1 plus.minus e_2 \) \/ 2$ are not weights of $C_2$; in $B_2$ they give its spin representation, which is the standard representation under $B_2 = C_2$. Rank one gives the ordinary $frak(s l)_2$ standard. These are exactly the alternatives in the statement. ◻
]

=== 4.3 Character cohomology and disk twists <character-cohomology-and-disk-twists>

We next construct the rank-one operators to which the preceding lemma will apply. Their formulas also let us compare different characters.

For a character $chi : P arrow.r k^times$, the space $W_chi$ is $H^1 \( C \, k \)_chi$. Inverting all character conventions makes no difference; choose the convention in which $W_chi$ is computed by the rank-one character $t = chi phi.alt$ below. The trivial character gives $W_(upright(bold(1))) = H^1 \( B \, k \)$, by quotient pullback. For a nontrivial character, pass to its cyclic quotient and fill every puncture whose local multiplier is one. Write the remaining multipliers as $t_1 \, dots.h \, t_r eq.not 1$. Then $r = 0$ or $r gt.eq 2$, and

#[#set math.equation(numbering: n => "(4.1)")
 $ dim W_chi = 2 h + r - 2 . $ <p4:character-dimension>]

For a nonzero complex character space, #emph[pure] and #emph[mixed] mean respectively that just one, or both, of its $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$ parts are nonzero.

#prodef([Lemma 4.4.])[
  (Cocycles and twists).  #emph[For a nontrivial $t$, the character space is the space of crossed homomorphisms 
#[#set math.equation(numbering: n => "(4.2)")
 $ z \( u v \) = z \( u \) + t \( u \) z \( v \) \, #h(2em) z \( u \) tilde.op z \( u \) + \( 1 - t \( u \) \) b quad \( b in k \) . $ <p4:cocycles>]

 Use generators $a_j \, b_j$ for the handles and positively based meridians $g_i$, with relation $product_j \[ a_j \, b_j \] product_i g_i = 1$. Values of $z$ on these generators satisfy just the crossed-homomorphism relation on this word, followed by the one-dimensional coboundary quotient.]
  #emph[Let $alpha$ be an embedded arc between two active punctures. A twist about the boundary of its two-puncture disk acts, in adapted coordinates and after choosing one of the two twist conventions, by 
#[#set math.equation(numbering: n => "(4.3)")
 $ T_alpha = 1 + u_alpha ell_alpha \, #h(2em) u_alpha = \( - t_i \, 1 \) \, #h(2em) ell_alpha \( z \) = \( 1 - t_j \) z \( g_i \) + \( t_i - 1 \) z \( g_j \) \, $ <p4:pair-twist>]

 with $u_alpha$ supported on these two meridians. Its exceptional eigenvalue is $t_i t_j$. A different choice of lift can multiply this formula by a finite-order scalar.]
  #emph[For a nontrivial such transformation, its fixed hyperplane is the Hermitian orthogonal complement of its image direction. If a collection of these directions has connected nonorthogonality graph and their fixed hyperplanes have zero intersection, the group they generate acts irreducibly. These statements apply also to ordinary transvections arising from simple closed curves with trivial $t$-monodromy.]
] <p4:twist-model>

#proof[
  The eigenspace on the unbranched cover is the cohomology of the corresponding rank-one local system on the punctured base, by averaging over the finite deck group. Filling an inactive puncture gives ordinary cohomology on the filled base. At an active puncture the local complex is $k arrow.r^(t_i - 1) k$, which is acyclic, so no local term changes the character cohomology. The cellular cochain model, or the standard crossed-homomorphism model of degree-one group cohomology, gives Equation (4.2). Euler characteristic gives Equation (4.1); in the unramified case both degree zero and degree two vanish for a nontrivial rank-one system.
  For the twist, conjugate the two meridians by their product $delta = g_i g_j$ and fix the exterior generators. The identity
  $ z \( f u f^(- 1) \) = \( 1 - t \( u \) \) z \( f \) + t \( f \) z \( u \) $
  gives Equation (4.3) by direct subtraction. In particular $ell_alpha \( u_alpha \) = t_i t_j - 1$. All such disk twists preserve $phi.alt$: they act trivially on the abelianization of the punctured surface group. For other mapping classes preserving $t$, a positive power preserves $phi.alt$, which suffices for all Lie-algebra statements.
  Set $s_i = z \( g_i \) \/ \( 1 - t_i \)$. These are the fixed points of the affine transformations represented by the meridians. The fixed-hyperplane condition is $s_i = s_j$ after transport along $alpha$. More explicitly, if $alpha$ is represented by $p_i^(- 1) x p_j$ in terms of based access paths and a based loop $x$, it is
  #[#set math.equation(numbering: n => "(4.4)")
   $ s_i = z \( x \) + t \( x \) s_j . $ <p4:fixed-points>]
  This description is unchanged by endpoint windings. For $r gt.eq 3$ the image vector in Equation (4.3) is nonzero modulo coboundaries, since another active meridian has zero coordinate in it. When $r = 2$, if that vector is a coboundary, all exterior multipliers are one; the surface relation then also makes $ell_alpha$ zero.
  The polarization pairs opposite character spaces perfectly and gives a nondegenerate Hermitian form on $W_(chi \, bb(C))$, preserved by the monodromy. If $T = 1 + u ell$ is a nontrivial isometry, every fixed vector is orthogonal to $\( T - 1 \) W = k u$. Both spaces have codimension one, proving the fixed-hyperplane assertion. A common zero intersection of fixed hyperplanes makes the directions span by nondegeneracy. A nonzero invariant subspace contains a vector moved by one transformation, hence contains its image direction. Nonorthogonality then propagates this inclusion along the graph and gives the whole space.
  Finally, if a simple closed curve has trivial $t$-monodromy, lift its annulus to the cyclic cover and twist simultaneously about its lifts. The ordinary intersection formula restricts on a character space to rank at most one: the projected lift classes are scalar multiples of each other. If evaluation of the cocycle on one closed lift is nonzero, the intersection-dual projected class is nonzero as well, by the perfect opposite-character pairing. The resulting transformation is a nontrivial rank-one unipotent. Its logarithm, or a nonzero integral multiple obtained by taking a power, belongs to the Lie algebra of connected monodromy. ◻
]

#prodef([Lemma 4.5.])[
  (Connected irreducibility).  #emph[Suppose a subgroup of $"GL" \( V \)$ acts irreducibly and is generated, up to scalars, by rank-one changes of the identity. If the Lie algebra of its Zariski closure contains a rank-one nilpotent, the identity component of that closure acts irreducibly.]
] <p4:connected-irreducibility>

#proof[
  The unipotent radical of the identity component is normal in the full closure. Its common fixed subspace is nonzero and is invariant under the full group, so it is all of $V$; the radical is trivial in the given faithful image. The identity component is therefore reductive. Its isotypic summands are permuted transitively by the full group. A rank-one nilpotent can act nontrivially on only one isotypic summand, and there with multiplicity one; that summand has dimension at least two. Transitivity gives the same two properties for every summand. A scalar multiple of a rank-one change cannot permute two summands of dimension at least two: its difference from that scalar identity would have rank at least two. Thus all the generators preserve every summand. Irreducibility forces a single summand, with multiplicity one, as required. ◻
]

=== 4.4 Positive base genus <positive-base-genus>

We now assume $h gt.eq 1$. The handle character can be concentrated on one generator:

#[#set math.equation(numbering: n => "(4.5)")
 $ t \( a_j \) = t \( b_j \) = 1 quad \( j < h \) \, #h(2em) t \( b_h \) = 1 \, #h(2em) t \( a_h \) = eta . $ <p4:handle-character>]

Indeed lift the character on the handle homology to an integral row, divide by the greatest common divisor of its entries, and complete its primitive part to an integral symplectic basis. The resulting symplectic basis change is realized by a homeomorphism on the handle subsurface, disjoint from the puncture disk; see [10] Chapter 6. If all handle multipliers are one, take $eta = 1$. This changes the marking, not the topological cover.

#prodef([Lemma 4.6.])[
  (Winding arcs).  #emph[Place the active punctures in an ordered disk, away from the handle subsurface. For every simple based handle generator $x$, an embedded arc from puncture $1$ to puncture $2$ can be chosen whose transported fixed-point condition is Equation (4.4) with $x$ or $x^(- 1)$. If $r gt.eq 3$, the arc can avoid the interior of the standard arc from $2$ to $3$. Arcs for different generators are chosen separately; they are not required to be mutually disjoint.]
  #emph[For a winding arc using only the last handle, the simple generators of the first $h - 1$ handles can be represented outside its two-puncture disk.]
] <p4:winding-arcs>

#proof[
  Take the based handle bouquet on the handle side of a small vertex disk, and fan the access paths $p_i$ to the punctures out on its other side. Choose the first two access paths to avoid the interior of the standard $2 \, 3$ arc when that arc is present. Concatenate $p_1^(- 1) x p_2$. Outside the vertex disk its pieces are embedded and disjoint. In the vertex disk there are two germs from the puncture side and two from the handle side. Choose the orientation of $x$ so that the incoming and outgoing germs can be joined in noncrossing pairs. Replacing these joins by small smooth arcs removes the vertex and gives the required embedded arc. Its regular neighborhood with the two endpoint disks is a disk; with the $2 \, 3$ arc added it is a regular neighborhood of an embedded three-vertex tree, also a disk. This explains why the consecutive-meridian formulas apply to the winding and standard arcs together. Auxiliary marks can be avoided by small perturbations.
  Use the standard separated handles for the last assertion. The winding arc and its endpoint disk can be placed in the last-handle and puncture region. The other handle loops lie outside. Carrying all these choices by the homeomorphism used in Equation (4.5) preserves the assertion. A change of their based access paths only conjugates those loops; because their $t$-multipliers are one, zero cocycle displacement on them remains zero after that change. ◻
]

#prodef([Proposition 4.7.])[
  (Positive-genus character projections).  #emph[For $h gt.eq 1$, every nonzero nontrivial character space is mixed in Hodge type at every scalar conjugate. At every $s in cal(T)_phi.alt^(upright("Hg"))$ the image of the derived Hodge group on that space is the full standard special linear or full standard symplectic group. The invariant character space, when nonzero, has Hodge dimensions $\( h \, h \)$ and full standard symplectic derived action.]
] <p4:positive-projections>

#proof[
  We exhibit an irreducible group of twists and a rank-one nilpotent in the Lie algebra of its connected closure. There are three cases.
  #emph[No active punctures.] Here $eta eq.not 1$, since $t$ is nontrivial. The surface relation is $\( eta - 1 \) z \( b_h \) = 0$. Thus $z \( b_h \) = 0$, and a coboundary removes $z \( a_h \)$. The remaining coordinates are precisely the ordinary first cohomology coordinates of the first $h - 1$ handles. The twist character is trivial on this subsurface. Twists along a symplectic handle basis and along connecting band sums give rank-one transvections whose directions span with connected nonorthogonality graph. Their positive powers preserving $phi.alt$ have the same logarithm directions. They act irreducibly already on the identity component. When $h = 1$ the character space is zero, as asserted.
  #emph[At least three active punctures.] Start with consecutive arcs inside the ordered puncture disk. Their common fixed equations make all $s_i$ equal. Adjacent directions pair nontrivially: in a common three-puncture disk this follows by substituting the vector of one pair twist into the functional of its neighbor in Equation (4.3); the factors that occur are nonzero multiples of $t_j$, $1 - t_i$, and $1 - t_k$.
  For each handle generator add the winding arc of Lemma 16 from $1$ to $2$. Its direction is linked to the standard $2 \, 3$ direction by the same calculation in their three-puncture neighborhood. In the common fixed space, use a coboundary to make all $s_i = 0$. The winding equations then force $z \( x \) = 0$ for every handle generator. Thus the common fixed space is zero and the direction graph is connected. Lemma 14 gives irreducibility.
  The twist about $b_h$ supplies a rank-one nilpotent. In compatible generators it replaces $a_h$ by $a_h b_h$ and fixes the other generators, so its cocycle displacement is supported on $a_h$ and is $eta z \( b_h \)$. The coordinate $z \( b_h \)$ can be chosen freely and the single surface relation compensated at an active meridian. The image vector is not a coboundary, since it vanishes on all active meridians. This is a nonzero square-zero rank-one operator. A positive power of the twist preserves $phi.alt$; a further power removes any finite deck scalar. Adjoin this twist to the irreducible disk-and-winding subgroup. The enlarged group is still generated, up to scalars, by rank-one changes of the identity. Lemma 15 now gives connected irreducibility for its closure.
  #emph[Two active punctures.] Write $t_1 = lambda$, $t_2 = lambda^(- 1)$. The cocycle relation is
  #[#set math.equation(numbering: n => "(4.6)")
   $ \( eta - 1 \) z \( b_h \) + \( 1 - lambda \) \( s_1 - s_2 \) = 0 . $ <p4:two-puncture-relation>]
  If $eta = 1$, remove the common value $s_1 = s_2$ by a coboundary. All the handle coordinates are then ordinary symplectic coordinates, and their twists and band sums prove the assertion exactly as in the first case.
  Suppose $eta eq.not 1$ and impose the gauge $s_2 = 0$. The handle coordinates are arbitrary and Equation (4.6) determines $s_1$. Take the standard two-puncture arc and the winding arcs corresponding to $a_h$ and to $a_j \, b_j$ for $j < h$. The standard fixed equation is $s_1 = 0$; the others are $s_1 = z \( x \)$, after reversing $x$ if necessary. Reversing a trivial-multiplier generator merely changes its sign, and for $a_h$ it multiplies its coordinate by the nonzero scalar $- eta^(- 1)$; these changes do not affect the argument. The common kernel is zero: first $s_1 = z \( b_h \) = 0$, then $z \( a_h \) = 0$ and all remaining handle coordinates vanish.
  We verify connectedness of the direction graph. Before the gauge, the standard arc direction has zero handle coordinates and $s_1 = s_2 = - lambda \/ \( 1 - lambda \) eq.not 0$. Adding the coboundary with parameter $lambda \/ \( 1 - lambda \)$ puts it in the gauge $s_2 = 0$ and gives
  $ z \( a_h \) = frac(\( 1 - eta \) lambda, 1 - lambda) eq.not 0 \, #h(2em) z \( b_h \) = s_1 = 0 \, $
  with every other handle coordinate zero. The winding $a_h$ functional is therefore nonzero on this direction, with either orientation of $a_h$. The fixed-hyperplane description and Hermitian symmetry give the reciprocal nonzero pairing, so the $a_h$-winding direction has $s_1 eq.not 0$. That direction has zero coordinates on all $a_j \, b_j$ for $j < h$, by the last assertion of Lemma 16; subtracting its gauge coboundary does not alter these coordinates, whose multipliers are one. Hence every remaining winding functional is nonzero on this direction. The graph is connected. All these pair twists have exceptional eigenvalue $lambda lambda^(- 1) = 1$, so their nontrivial changes are rank-one nilpotents. Lemmas 14 and 15 finish this case.
  In all cases the connected twist closure is irreducible and its Lie algebra contains a rank-one nilpotent. It lies in the projected Hodge group at every $s in cal(T)_phi.alt^(upright("Hg"))$ by Lemma 11. The latter is reductive and irreducible, so Lemma 13 applied to it gives the stated standard special linear or symplectic image.
  The same constructions apply after every scalar conjugation: the active set is unchanged, a multiplier equal to one remains one, and every displayed nonzero factor remains nonzero. Thus every conjugate space has a nontrivial unipotent preserving its polarization Hermitian form. A definite Hermitian space admits no such unipotent isometry. Polarization is definite on a pure character space, so both Hodge types occur on every conjugate.
  For the trivial character use the ordinary handle transvections on $H^1 \( B \)$, again taking powers in the finite-index stabilizer. They give the full symplectic group by the same spanning and connectedness argument and Lemma 13; the polarization rules out the larger special linear alternative in dimension greater than two. ◻
]

=== 4.5 Characters over the sphere <p4:sphere>

In this subsection the base has genus zero. Let $P$ be the finite abelian deck group, let $chi : P arrow.r k^times$, $k = overline(bb(Q))$, be a nontrivial character, and put

$ W_chi = H^1 \( C \, k \)_chi . $

As in Lemma 14, write $t$ for the corresponding rank-one local system, discard its inactive punctures when computing cohomology, and denote its active local multipliers by $t_1 \, dots.h \, t_r$. Thus

#[#set math.equation(numbering: n => "(4.7)")
 $ t_i eq.not 1 \, #h(2em) product_(i = 1)^r t_i = 1 \, #h(2em) n := dim_k W_chi = r - 2 . $ <p4:sphere-dimension>]

Additional marked points can be retained in the parameter space. They do not alter $W_chi$. Let $M_chi subset "GL" \( W_chi \)$ be the Zariski closure of the already defined $Gamma$-action. All the two-puncture twists used below belong to this stabilizer: their substitutions conjugate local meridians, which leaves the homomorphism to the abelian group $P$ unchanged. Changing the local lift used to compute a formula multiplies its character action by a root of unity and has no effect on the projective comparisons or Lie algebras.

Fix $s in cal(T)_phi.alt^(upright("Hg"))$ and write $J = J_s$. A character space is #emph[non-toric] if the image of $J^(upright("der"))$ on it is nontrivial. Statements about all scalar translates refer to all embeddings into $bb(C)$ of a number field over which the indicated spaces and maps are defined, or, equivalently, to all their extensions to $k$.

For rank at least three, finite monodromy forces the Hodge action on the rational scalar orbit to be toric, while infinite monodromy yields a standard derived projection. Ranks at most two are handled directly at the Hodge-group level. Only after these projections have been determined do we compare character spaces on which the same simple ideal acts.

#prodef([Lemma 4.8.])[
  (Finite determinant image and scalar orbits).  #emph[The determinant character of $M_chi$ has finite image. If the monodromy on one scalar character space is finite, the monodromy on the rational sum of its scalar orbit is finite as well. If the Hermitian forms on every member of a scalar orbit are definite, the monodromy on that rational sum is finite.]
] <p4:sphere-determinant-finite>

#proof[
  Choose a cyclotomic number field $E$ containing all character values. The projector for $chi$ and the monodromy representation on its image are defined over $E$. The determinant of an integral monodromy operator on this image is an algebraic integer: its eigenvalues are among those of the operator on integral first cohomology. Applying the same observation to the inverse shows that the determinant is an algebraic unit. At every embedding of $E$ the operator preserves the nondegenerate Hermitian form obtained from the polarization, so the absolute value of its determinant is one. An algebraic integer all of whose conjugates have absolute value one is a root of unity. For example, the monic polynomials whose roots are the conjugates of its positive powers have bounded integral coefficients; their finite number forces two powers of a conjugate, and hence of the original integer, to coincide. The roots of unity in the fixed field $E$ form a finite group. This finite root set is Zariski closed, so the determinant of the closure $M_chi$ has the same finite-image property. This proves the first assertion.
  The matrices at any other embedding are obtained by applying that embedding to the matrices over $E$. A finite set of matrices therefore remains finite after every embedding. Their direct sum is the scalar extension of the rational orbit representation, proving the second assertion. For the last assertion, change the sign of each negative definite Hermitian form and take their direct sum. It gives an invariant positive definite real form on the rational orbit representation, after restricting from its complexification. This representation also has an invariant lattice, its intersection with integral first cohomology. The image of each lattice basis vector has fixed length and hence finitely many possibilities. The monodromy image is finite. ◻
]

The finite case can now be separated from the standard group actions. Its decisive feature is that the full branch variation rules out a mixed character with constant period.

#prodef([Lemma 4.9.])[
  (Finite monodromy and purity).  #emph[Suppose $n gt.eq 2$. If $M_chi$ is finite, every scalar translate of $W_chi$ is pure at every fiber. At every fiber its rational Hodge group acts through scalar operators on each character space in that orbit, and the action on their rational sum is toric.]
] <p4:sphere-finite-pure>

#proof[
  Let $V_(bb(Q))$ be the rational character-orbit summand. The orbit contains the inverse character, so the polarization restricts nondegenerately to $V_(bb(Q))$. It is a polarized subvariation of first cohomology. By Lemma 18 its monodromy is finite. We pass to an algebraic quotient of the full marked family. Since $r gt.eq 4$, the ordered moduli space of the marked points on $bb(P)^1$ is a smooth quasi-projective configuration space modulo projective coordinates; one may fix three labels. Include the labelled base point and the chosen point above it. The finite-index stabilizer of $phi.alt$ gives a finite topological cover of this configuration space, which is algebraic and finite étale by the Riemann existence theorem. The base-point section splits the fundamental-group sequence of the universal punctured curve: in the homotopy sequence of this surface bundle, the section kills the boundary map into the fiber fundamental group and splits the projection on fundamental groups. Since the base subgroup preserves $phi.alt$, sending its loops to the identity and the fiber loops by $phi.alt$ defines a homomorphism from the total fundamental group to $P$. Its finite topological cover is algebraic by the same theorem. Normalize the universal compact curve in this cover. Analytically near a branch section, a small simply connected base neighborhood trivializes the topological data, and the normalization is a disjoint union of charts $\( u \, s \) mapsto \( u^e \, s \)$ with the fixed inertia order. The normalization is finite over the universal compact curve, so these charts make it a smooth proper family of compact covers. Thus this is a quotient of the full marked variation, not a restricted family. Indeed its monodromy on first cohomology is the action of the chosen lifts in $Gamma$: the lifted base-point section fixes the sheet during transport. On pulling back to $cal(T)_phi.alt$, it is the original marked family, since the topological covering epimorphism and the chosen sheet agree and the complex structure is uniquely obtained by lifting the base charts and filling the same power charts. In particular the pulled-back orbit variation is exactly $V_(bb(Q))$ above.
  A finite-index kernel in $Gamma$ kills the finite monodromy of $V_(bb(Q))$. The corresponding finite topological cover of the same configuration quotient is algebraic and finite étale by Riemann existence; the smooth proper family is simply pulled back to it. The period map of $V_(bb(Q))$, now with a constant marking, is a single-valued holomorphic map from this cover to a Siegel period domain. A Cayley transform realizes the domain as a bounded domain in a finite-dimensional complex vector space.
  Each coordinate of the period map is consequently a bounded holomorphic function. Take a smooth projective compactification with normal-crossing boundary. The removable-singularity theorem, in local polydisks along the boundary, extends each coordinate holomorphically over the compactification. Such a function is constant on a connected projective variety. The period map of $V_(bb(Q))$ is therefore constant.
  We show that a mixed character would contradict this constancy. Pass to the cyclic quotient
  $ pi : Y = C \/ ker chi arrow.r bb(P)^1 $
  and let $D_chi$ consist of its $r$ active branch points. The $chi$ and $chi^(- 1)$ spaces in first cohomology are unchanged by this quotient. The map forgetting inactive and auxiliary markings is locally a submersion onto the configuration space of $D_chi$: the active points can be moved independently while the additional points are kept away from them. It thus suffices to show that the character period on the cyclic quotient has nonzero differential whenever it is mixed.
  Here is a deformation calculation which also covers genus one for $Y$. If a branch chart is $x = u^e$, an invariant vector field on $Y$ has the form $u b \( u^e \) partial \/ partial u$; its pushforward is $e x b \( x \) partial \/ partial x$. Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( pi_(*) T_Y \)^(P \/ ker chi) = T_(bb(P)^1) \( - D_chi \) \, #h(2em) H^1 \( Y \, T_Y \)^(P \/ ker chi) = H^1 \( bb(P)^1 \, T_(bb(P)^1) \( - D_chi \) \) . $ <p4:sphere-tangent>]
  The second equality uses finiteness of $pi$ and exactness of invariants in characteristic zero. The tangent map for varying the branch points is this identification. Indeed, on a Čech cover, coordinate changes preserving the branch sections lift to the cyclic cover; differentiation gives precisely the inverse of the displayed pushforward on invariant vector fields. This describes the full tangent space of ordered branch configurations modulo projective coordinate changes. Since $r gt.eq 4$, there are no infinitesimal automorphisms of the pointed base. This argument does not require $H^0 \( Y \, T_Y \) = 0$.
  If the $chi$-space is mixed, there are nonzero forms
  $ alpha in H^0 \( Y \, K_Y \)_chi \, #h(2em) beta in H^0 \( Y \, K_Y \)_(chi^(- 1)) . $
  Their product $alpha beta$ is a nonzero invariant quadratic differential. It pairs nontrivially with some element of $H^1 \( Y \, T_Y \)^(P \/ ker chi)$ by Serre duality and averaging over the finite group. Equivalently, invariant quadratic differentials descend to $H^0 \( bb(P)^1 \, K_(bb(P)^1)^(⊗ 2) \( D_chi \) \)$: in the chart $x = u^e$, invariance permits at most a simple pole at $x = 0$, and its pullback is holomorphic. This is the dual of (4.8).
  For clarity, the period differential here follows directly from the same local deformation. If the transition functions of the deformed curve differ to first order by the vector-field cocycle $theta_(i j)$, Cartan’s formula for the closed holomorphic form $alpha$ shows that its first-order changes differ on overlaps by $cal(L)_(theta_(i j)) alpha = d \( theta_(i j) corner.r.b alpha \)$. Its variation modulo holomorphic forms is therefore the class of $theta_(i j) corner.r.b alpha$ in $H^1 \( Y \, cal(O)_Y \)$, up to an immaterial common sign. Serre duality pairs this class with $beta$ by evaluating $theta$ on $alpha beta$. The chosen tangent direction makes that value nonzero. This calculation also applies in genus one. Thus the period differential is nonzero. The contradiction proves purity, separately at every scalar translate.
  Finally write $F = bb(Q) \( chi \( P \) \)$. The rational orbit summand is an $F$-vector space whose scalar embedding spaces are exactly these character spaces. Since each is pure, the Hodge circle acts by scalars on each of them. It therefore centralizes the entire rational algebra $"End"_F \( V_(bb(Q)) \)$. The definition of the rational Hodge group at each fiber forces it to centralize the same algebra. Its action on $V_(bb(Q))$ lies in the scalar torus $"Res"_(F \/ bb(Q)) bb(G)_m$, as claimed. ◻
]

It remains to identify the infinite character monodromy. We first prove connected irreducibility and produce the rank-one Lie element needed by Lemma 13.

#prodef([Lemma 4.10.])[
  (Infinite sphere monodromy and rank-one Lie elements).  #emph[Suppose $n gt.eq 3$. If $M_chi$ is infinite, its identity component acts irreducibly on $W_chi$. Moreover its Lie algebra contains a rank-one nilpotent.]
] <p4:sphere-connected-irreducible>

#proof[
  We first check that the arc family acts irreducibly. When an actual rank-one unipotent is available, its logarithm yields the nilpotent needed to prove connected irreducibility; the remaining pseudoreflection case requires a separate proof of connected irreducibility. In that case an adjoint-eigenspace projection then produces a rank-one nilpotent in the Lie algebra.
  Consecutive two-puncture arcs give an irreducible family on $W_chi$. To check the hypotheses of Lemma 14, use the cocycle coordinates $z_i = z \( g_i \)$ and put $s_i = z_i \/ \( 1 - t_i \)$. Their common fixed hyperplanes say that all $s_i$ are equal; subtracting the resulting coboundary kills the cocycle. Consecutive arc directions have a nonzero mutual pairing by the formula in that lemma. Thus the directions span and their nonorthogonality graph is connected. The full group $M_chi$ acts irreducibly.
  Its identity component is reductive in this representation. Indeed, the unipotent radical is characteristic in the identity component and hence normal in $M_chi$. Its nonzero fixed-vector space is then $M_chi$-stable, and irreducibility makes that space all of $W_chi$. The radical acts trivially. The isotypical summands for $M_chi^compose$ are permuted transitively by $M_chi$.
  First suppose that the Lie algebra already contains a rank-one nilpotent $N$. On an isotypical summand $S ⊗ A$ it acts as $N_S ⊗ 1_A$. A summand on which it is nonzero must therefore have $dim A = 1$ and $dim S gt.eq 2$. Transitivity gives these same properties on every isotypical summand. An operator differing from a scalar by rank one cannot permute two summands of dimension at least two: its displacement on either of the summands would have rank at least two. Every arc pseudoreflection therefore fixes each summand. The irreducibility of the arc family forces there to be just one, proving connected irreducibility in this case.
  There are two immediate sources of such an $N$. If $t_i t_j = 1$ for some active pair, its twist is a nontrivial rank-one unipotent by Lemma 14. Its logarithm belongs to $"Lie" \( M_chi^compose \)$. If all active pair products are $- 1$, then all the $t_i$ are equal to the same primitive fourth root of unity. Equation (4.7) implies $4 divides r$; since $r gt.eq 5$, we have $r gt.eq 8$. Choose a disk containing four active points. If $g$ is the product of their consecutive meridians, then $t \( g \) = 1$. The boundary twist conjugates each inside meridian by $g$, and its cocycle displacement is
  $ z_i mapsto z_i + \( 1 - t_i \) z \( g \) quad \( i upright(" inside") \) \, #h(2em) z_j mapsto z_j quad \( j upright(" outside") \) . $
  This is a rank-one unipotent. Its image is nonzero modulo coboundaries because there are active points outside the disk. Its functional is nonzero: one can prescribe a nonzero value of $z \( g \)$ on the inside and satisfy the global cocycle relation using an outside entry. Its square-zero displacement follows also from $t \( g \) = 1$.
  It remains to treat the case with no pair product equal to $1$ and with some pair product $lambda eq.not plus.minus 1$. All pair twists are then semisimple pseudoreflections. Suppose first that the isotypical summands for $M_chi^compose$ have dimension at least two. The rank argument just given makes every pair twist fix every summand, so there is just one summand $S ⊗ A$. If $dim S = 1$, the connected group acts by scalars; its finite determinant then makes the connected group trivial, contrary to infinitude. Thus $dim S > 1$.
  An operator normalizing this isotypical action has the form $B ⊗ D$, with $B in "GL" \( S \)$ and $D in "GL" \( A \)$. To see this, choose an intertwiner $B$ for the induced automorphism of the irreducible representation on $S$; what remains centralizes that representation and is $1 ⊗ D$ by Schur’s lemma. A nontrivial semisimple pseudoreflection cannot have this form when both factors have dimension at least two. Indeed the factors must themselves be semisimple (a nontrivial unipotent Jordan part would survive on the tensor product). Their eigenvalue products would then form a rectangular grid with just one exceptional entry. A two-by-two subrectangle containing that entry contradicts the equality of the products of its two diagonal pairs. Hence $dim A = 1$, and the connected action is irreducible.
  The only remaining reducible case has distinct one-dimensional isotypical summands. The Hermitian form pairs each such line nondegenerately with exactly one other line: for characters $a \, b$ of the connected group, a nonzero pairing requires $a overline(b) = 1$ on the finite-index monodromy subgroup dense in that group. Distinct characters preclude two choices of $b$. Hermitian symmetry makes this a pairing involution on the set of lines. Each pair twist preserves the involution and permutes the lines by either the identity or one transposition. Indeed, a permutation cycle of length $ell$ contributes rank at least $ell - 1$ to the difference from a scalar identity, and disjoint cycles contribute independently; here that rank is one. The permutation group generated by the twists is transitive, by irreducibility. If the pairing involution had no fixed point, a transposition commuting with it would have an invariant two-element support, so could only exchange the members of one of its pairs. Such transpositions cannot act transitively on at least three lines. Thus there is a fixed point, and transitivity makes every line self-paired. Distinct lines are orthogonal; transitivity also makes their signs equal. The Hermitian form is definite.
  The decomposition into distinct one-dimensional connected isotypicals and the pseudoreflection action are algebraic properties over $k$. They persist at every scalar translate. The same argument therefore makes the Hermitian form definite on every translated character space. By Lemma 18 the rational orbit monodromy is finite, a contradiction. This proves connected irreducibility in the remaining case.
  Use now a pair twist with eigenvalue ratio $lambda eq.not plus.minus 1$. After a scalar normalization it is $R = "diag" \( lambda \, 1 \, dots.h \, 1 \)$ for a decomposition $W_chi = L xor U$, $dim L = 1$. Conjugation by $R$ preserves $frak(m) = "Lie" \( M_chi^compose \)$ and has the three distinct eigenvalues $1 \, lambda \, lambda^(- 1)$ on
  $ "End" \( L \) xor "End" \( U \) \, #h(2em) "Hom" \( U \, L \) \, #h(2em) "Hom" \( L \, U \) \, $
  respectively. Polynomial projection onto these eigenspaces preserves $frak(m)$. Connected irreducibility implies that some off-diagonal component is nonzero, since otherwise $L$ and $U$ would be invariant. A nonzero element of either off-diagonal space has rank one and square zero. It supplies the asserted nilpotent. ◻
]

The preceding lemma determines the infinite projections. The finite case is toric by Lemma 19. For cyclic covers of $bb(P)^1$, the monodromy projections for mixed characters with $chi^2 eq.not 1$ are computed in [19] preprint, Theorem 5.1.1; [16] Proposition 4.7 also includes the symplectic projection for order-two characters. The following statement collects exactly the alternatives needed for the tensor criterion.

#prodef([Proposition 4.11.])[
  (Sphere projections).  #emph[At every $s in cal(T)_phi.alt^(upright("Hg"))$ the following assertions hold.]
  + #emph[If $n gt.eq 3$, then either $M_chi$ is finite and the Hodge action on its rational scalar orbit is toric, or 
$ M_chi^compose = cases(delim: "{", "Sp" \( W_chi \) \, & chi^2 = 1 \,, "SL" \( W_chi \) \, & chi^2 eq.not 1 .) $

 In the infinite case the derived Hodge projection is the same standard group.]
  + #emph[In dimensions at most two every non-toric character space has dimension two and has standard derived Hodge projection $"SL"_2$.]
  #emph[Here the symplectic group is for the restricted polarization on the order-two character space. Each non-toric character space is supported by a single simple ideal of $"Lie" \( J^(upright("der")) \)_k$.]
] <p4:sphere-projections>

#proof[
  For $n gt.eq 3$, Lemmas 20 and 13 give either the full standard special linear or the full standard symplectic derived algebra of connected monodromy. Its determinant is finite, so its connected scalar center is trivial. In the symplectic case all of $M_chi$ normalizes the connected symplectic group and hence preserves its unique invariant alternating form up to scalar.
  In dimension at least four a semisimple pseudoreflection with ratio different from $1$ cannot be such a similitude. Normalize its fixed hyperplane $U$ to have eigenvalue $1$. The alternating form does not vanish identically on $U$, since $dim U = n - 1 > n \/ 2$; thus the similitude multiplier is $1$. Its exceptional eigenline must then be orthogonal to $U$ and to itself, and hence be in the radical, an impossibility. It follows that every active pair product is $1$. With at least three active points this forces all $t_i = - 1$. The sphere meridians generate the deck group, so $chi$ has order two. Conversely an order-two character space has a nondegenerate alternating polarization and monodromy contained in its symplectic group. Its pair twists are nontrivial unipotents, so the symplectic alternative occurs. This proves the stated connected monodromy groups.
  The algebraic image of $L_k$ on $W_chi$ is closed and is the Zariski closure of the character action, hence is $M_chi$. The image of $L_k^compose$ is $M_chi^compose$, by the identity-component property of algebraic group images. By Lemma 11, $L^compose subset J$, so connected character monodromy is contained in the image of $J_k$ on $W_chi$. In the special linear case its action already contains the full traceless algebra. In the order-two case the Hodge group also preserves the restricted alternating polarization. Hence the derived Hodge projections are exactly the groups asserted in (i). Finite monodromy gives the toric conclusion by Lemma 19.
  A connected reductive subgroup of $"GL"_2$ either acts through a torus or, when its derived image is nontrivial, has the full standard $"SL"_2$ as its derived image. Indeed a reducible two-dimensional representation of a reductive group is a sum of characters, while the only nonzero semisimple subalgebra of $frak(s l)_2$ is $frak(s l)_2$ itself. Dimension one is toric, and dimension zero is omitted. This proves (ii). Finally each displayed derived image is simple, and a surjective map from a semisimple Lie algebra to a simple one is supported by exactly one simple ideal. ◻
]

We have identified each projection, but a single simple Hodge ideal may act on several character spaces. To identify those copies by algebraic maps, we must compare the whole mapping-class actions. The only additional numerical calculation occurs for four active points, where the standard spaces have dimension two.

#prodef([Lemma 4.12.])[
  (Four-point signatures).  #emph[Suppose $r = 4$ and write $t_i = exp \( 2 pi i v_i \)$ with $0 < v_i < 1$. Set $S = sum_i v_i in { 1 \, 2 \, 3 }$. In a fixed choice of character convention the two Hodge multiplicities are $S - 1$ and $3 - S$. Thus $S = 2$ means mixed, while $S = 1$ and $S = 3$ give the two opposite pure types.]
] <p4:sphere-four-signatures>

#proof[
  Pass to the cyclic quotient on which the character is faithful, of order $m$, and write $v_i = a_i \/ m$, $0 < a_i < m$. Choose a coordinate with infinity away from the branch points. The quotient has an equation
  $ y^m = product_i \( x - b_i \)^(a_i) \, #h(2em) sum_i a_i = m S . $
  The eigendifferentials for the inverse of the character of $y$ are $f \( x \) thin d x \/ y$. At a branch point with $d_i = gcd \( m \, a_i \)$, a uniformizer has $x - b_i = u^(m \/ d_i)$ and $y$ equal to a unit times $u^(a_i \/ d_i)$. The differential $d x \/ y$ is holomorphic there, whereas a pole of $f$ would destroy holomorphicity. Thus $f$ is a polynomial. At infinity holomorphicity requires $deg f lt.eq S - 2$, giving dimension $S - 1$. Replacing $y$ by $product_i \( x - b_i \) \/ y$ computes the opposite eigenspace with exponents $m - a_i$ and dimension $3 - S$. The choice of whether $t$ labels this character or its inverse exchanges the two dimensions everywhere and does not affect the assertion. ◻
]

#prodef([Proposition 4.13.])[
  (Links within one sphere cover).  #emph[Suppose two non-toric character spaces $W_chi \, W_(chi')$ are supported by the same simple Hodge Lie ideal. They have the same dimension $n$ and standard derived representations equivalent up to duality.]
  + #emph[If $n gt.eq 3$, then $chi' = chi$ or $chi^(- 1)$. The inverse character is identified by the polarization with the polarized dual. If the standard group is symplectic, the character has order two and the space is mixed at every scalar translate.]
  + #emph[If $n = 2$, one can choose either $W_chi$ or its polarized dual as model so that an equivalence of its derived representation with $W_(chi')$ respects the Hodge circle at every scalar translate.]
] <p4:sphere-links>

#proof[
  Write $frak(f)$ for the shared ideal. The standard representations of a simple special linear or symplectic algebra determine their dimension and are preserved, up to duality, by isomorphisms of these algebras. The coincidence $frak(s l)_2 = frak(s p)_2$ has the same standard two-dimensional representation. Invert one character when necessary, so that an $frak(f)$-linear isomorphism
  $ F : W_chi arrow.r W_(chi') $
  exists. At this stage $F$ need not respect the Hodge circle.
  The projective actions of the entire group $Gamma$ are intertwined by $F$. Indeed, $Gamma$ preserves the character spaces and normalizes $J$ by Lemma 11. The kernel of either character projection on $"Lie" \( J^(upright("der")) \)_k$ is preserved, because the character space is preserved. Its unique complementary supporting ideal $frak(f)$ is therefore preserved as well. Each lift induces the same automorphism of this ideal on both spaces. The two implementations of this automorphism differ, after conjugation by $F$, by a scalar, by irreducibility and Schur’s lemma.
  A two-puncture twist is projectively trivial if at least one endpoint is inactive: fill that inactive puncture in the rank-one local system, after which the twist is supported in a disk with at most one puncture. It is projectively nontrivial when both endpoints are active. For the latter assertion use $r = n + 2 gt.eq 4$ and the nonzero rank-one formula of Lemma 14; the global cocycle relation can be satisfied using an active point outside the disk, so its functional is nonzero as well as its direction. The graph of nontrivial pair twists is therefore the complete graph on the active set. Projective equivalence shows that the active sets of $chi$ and $chi'$ coincide. Label them identically and write $t_i \, t'_i$ for their multipliers.
  Suppose first that $n gt.eq 3$. The pair twist has one exceptional eigenvalue and a fixed hyperplane. Its ratio is distinguished projectively by the multiplicities, so
  #[#set math.equation(numbering: n => "(4.9)")
   $ t'_i t'_j = t_i t_j #h(2em) \( i eq.not j \) . $ <p4:sphere-pair-products>]
  If the ratio is $1$, the operator is nontrivial unipotent and the same conclusion holds. These twists also intrinsically identify their image directions: for a semisimple twist this is its exceptional eigenline, and for a unipotent twist it is the image of its normalized displacement.
  Choose three active points in an embedded disk, with consecutive meridians $g_i \, g_j \, g_ell$. Cocycles supported on these entries and with value zero on their product form a two-dimensional subspace $U subset W_chi$. There are active points outside the disk, so passage to the cocycle quotient is injective on this space. The two consecutive pair directions are independent and span $U$. Thus $F$ identifies this space with its primed counterpart. The twist enclosing the three points acts on $U$ by the scalar $t_i t_j t_ell$ and on $W_chi \/ U$ by $1$. Indeed its displacement on a cocycle is supported in the disk and has value zero on the product; on a cocycle with that product value zero, conjugation by the product multiplies every inside value by its multiplier. The quotient has dimension $n - 2 > 0$. Its identity action fixes the projective scalar in the comparison, even when the full operator is a nontrivial unipotent extension of the identity. We obtain
  $ t'_i t'_j t'_ell = t_i t_j t_ell . $
  Equation (4.9) makes every ratio $t'_i \/ t_i$ equal to a common sign; the triple equality makes that sign $1$. All local multipliers are equal. Since sphere meridians generate the deck group, the characters coincide after the permitted inversion. This proves the first part of (i). The symplectic assertion follows from Proposition 21: its character has order two, so complex conjugation acts internally and exchanges its two Hodge parts. Both parts have dimension $n \/ 2$ at every translate.
  Now suppose $n = 2$, so the common active set has four points. The eigenvalue ratio of a projective two-by-two operator is defined up to inversion. Hence
  #[#set math.equation(numbering: n => "(4.10)")
   $ t'_i t'_j in { t_i t_j \, \( t_i t_j \)^(- 1) } . $ <p4:sphere-four-pair-products>]
  Put $A = t_1 t_2$, $B = t_1 t_3$, and $D = t_1 t_4$. The Klein four permutations on the four indices give the following triples of pair products:
  $ pi & \( t_(pi \( 1 \)) t_(pi \( 2 \)) \, t_(pi \( 1 \)) t_(pi \( 3 \)) \, t_(pi \( 1 \)) t_(pi \( 4 \)) \)\
1 & \( A \, B \, D \)\
\( 12 \) \( 34 \) & \( A \, B^(- 1) \, D^(- 1) \)\
\( 13 \) \( 24 \) & \( A^(- 1) \, B \, D^(- 1) \)\
\( 14 \) \( 23 \) & \( A^(- 1) \, B^(- 1) \, D \) $
  Uniformly inverting the four entries supplies the other four inversion patterns. Choose $pi$ in this Klein four group and $epsilon.alt in { 1 \, - 1 }$ realizing the three choices in (4.10) involving index $1$. Since $t_1^2 = A B D$, recovery of the four entries from these three products leaves only a common sign. Thus
  #[#set math.equation(numbering: n => "(4.11)")
   $ t'_i = delta thin t_(pi \( i \))^epsilon.alt quad \( 1 lt.eq i lt.eq 4 \) \, #h(2em) delta in { 1 \, - 1 } . $ <p4:sphere-four-tuple>]
  The choices $delta \, epsilon.alt \, pi$ are made once and are unchanged at every scalar translate of this identity.
  This classifies only the projective twist data. It remains to use the shared ideal to align pure and mixed behavior and to make one fixed choice between the original model and its polarized dual for every scalar translate.
  Mixedness agrees between the two character spaces at each translate. To justify this without any assumption about the pure orientations, split the infinitesimal Hodge-circle action into its central scalar part and its component in the shared simple ideal. On a standard two-dimensional module, the ideal component is zero precisely when the circle is scalar, that is, precisely when the character space is pure. The same ideal component acts on both equivalent modules, and this observation remains valid after every scalar translation.
  We compare the two pure orientations. Permuting the four multipliers has no effect on their signatures; uniformly inverting them reverses the two pure signatures by Lemma 22. Consider therefore the additional common sign $delta = - 1$. At a fixed translate write the four entries before this sign change as $exp \( 2 pi i v_i \)$, $0 < v_i < 1$, and put $S = sum_i v_i$. No $v_i$ equals $1 \/ 2$, since otherwise the sign change would produce an inactive multiplier. If $a$ entries exceed $1 \/ 2$, the sum after the change is
  #[#set math.equation(numbering: n => "(4.12)")
   $ S' = S + 2 - a . $ <p4:sphere-sign-change>]
  For $S = 1$ one has $a in { 0 \, 1 }$; agreement of purity excludes $S' = 2$, so $a = 0$ and $S' = 3$. For $S = 3$ one has $a in { 3 \, 4 }$; the same argument gives $a = 4$ and $S' = 1$. For $S = 2$, agreement of mixedness forces $a = 2$ and $S' = 2$. Thus the common sign reverses pure orientation wherever the spaces are pure. Combining it with $epsilon.alt$, the relative orientation of the two pure spaces is the same fixed sign $delta epsilon.alt$ at every pure scalar translate.
  The standard $frak(s l)_2$ module is self-dual. According to this fixed sign choose either the original model or its polarized dual, whose circle weights are the negatives of the original weights. Its pure type now agrees with that of $W_(chi')$ at every translate. Choose an intertwiner over $k$ of the resulting standard ideal modules. At a mixed translate the two circle weights are $+ 1 \, - 1$; their sum is zero, so the central scalar shift is zero on both modules. The intertwiner respects the common ideal action and hence the whole circle. At a pure translate both circles are the same scalar, so it respects them there as well. The same reasoning applies to every scalar conjugate of the chosen intertwiner. This proves (ii). Notice that polarized duality reverses the weights at every translate; no commutation between an arbitrary scalar automorphism and complex conjugation is being assumed. ◻
]

=== 4.6 Linked character spaces and saturation <linked-character-spaces-and-saturation>

The sphere comparison is now complete. In positive genus every nonzero character is mixed at all scalar conjugates, so the analogous comparison follows from a shorter Hodge-circle argument.

#prodef([Lemma 4.14.])[
  (Links between mixed standard spaces).  #emph[Let two admissible irreducible spaces in the same polarized weight-one structure have equivalent representations of a single supporting simple ideal of the derived Hodge Lie algebra. Suppose both spaces are mixed at every simultaneous scalar conjugate. An intertwiner between them is an admissible Hodge isomorphism. The analogous dual comparison is obtained by replacing one space by its opposite paired space.]
  #emph[If the derived action on one such space is standard symplectic, its invariant alternating tensor is a pair tensor on that space itself.]
] <p4:mixed-links>

#proof[
  The intertwiner line is one-dimensional by Schur’s lemma and is stable under the Hodge group, since its derived group is normal. If the Hodge circle acts on this line by $z^a$, the intertwiner shifts the spectrum of one space by $a$. Both spectra are ${ - 1 \, 1 }$, so ${ - 1 + a \, 1 + a } = { - 1 \, 1 }$ forces $a = 0$. Scalar conjugation gives the identical argument for the conjugated intertwiner and spaces. It is therefore an admissible Hodge isomorphism, and hence algebraic in the sense of Companion results 3(ii).
  An invariant nondegenerate alternating form also spans a Hodge-stable line. Its scalar weight must be zero: nondegeneracy pairs the spectrum ${ - 1 \, 1 }$ with its reflection about half that weight, so the midpoint is zero. The inverse tensor consequently has type $\( 1 \, 1 \)$, and so do all its conjugates. It is the required pair tensor. ◻
]

#proof[
  Fix $s in cal(T)_phi.alt^(upright("Hg"))$ and put $J = J_s$. Set $A = "Jac" \( C_s \)$ and choose an Abel map $a : C_s arrow.r A$. Its pullback $a^(*) : H^1 \( A \, bb(Q) \) arrow.r H_(bb(Q))$ is an isomorphism of rational Hodge structures. Its inverse is an algebraic degree-one operation by Companion results 3(ii). Transport the admissible character projectors $e_chi$ through this isomorphism. Their images are then actual summands of $H^1 \( A \, k \)$, as required by the tensor criterion; we use the same notation for the identified curve and Jacobian spaces.
  Collect the rational Galois orbits of character spaces on which $J^(upright("der"))$ acts trivially into a rational Hodge summand $H_0$. Its Hodge group is a torus: its projections on the orbits are tori, and the group on their direct sum is a subgroup of their product. Companion results 3(iv) realize $H_0$ as the first cohomology of a CM isogeny factor. For $h gt.eq 1$, every remaining nonzero character space has standard special linear or symplectic derived projection by Proposition 17. For $h = 0$ the same assertion, with the toric alternatives accounted for, is Proposition 21.
  Each remaining character space is supported by exactly one simple ideal of $"Lie" \( J^(upright("der")) \)_k$. Indeed its image is a simple standard special linear or symplectic algebra. In a semisimple algebra mapping onto a simple one, exactly one simple ideal has nonzero image; the commuting images of two nonzero ideals could not both be that simple algebra. The supporting ideal maps isomorphically. If two character spaces share it, their standard representations are equivalent or dual. The only coincidence between the two group types is $frak(s l)_2 = frak(s p)_2$, with the same standard module.
  In positive genus, Lemma 24 makes these comparisons admissible Hodge isomorphisms, using the opposite character for a dual comparison. On the sphere, Proposition 23 gives the same conclusion, including the simultaneous alignment of pure scalar translates in dimension two. Group the spaces with the same supporting ideal into one block. Treat a two-dimensional block as linear. A higher-dimensional symplectic block has its alternating pair tensor: it comes from Lemma 24 in positive genus and from the polarization on an order-two character on the sphere. A linear block uses the polarization pairing of a character and its opposite. Since finite character values are roots of unity, the opposite space is its coefficient-conjugate space $overline(W)$.
  The simple-ideal decomposition gives simultaneous independent standard actions on these blocks. More explicitly, each ideal acts on precisely the copies in its own block, with the chosen standard or dual identifications, and acts trivially on the other blocks and on $H_0$. The connected image of $J_k^(upright("der"))$ consequently has the Lie algebra of the product of these standard groups. The connected groups have the same image, so this is the product required in part (c) of Companion results 4. No independence of the central torus is needed.
  A representative of every block is the transported image of an actual character space on $C_s$. Corollary 10 supplies its determinant singleton: a nontrivial character uses the faithful cyclic quotient $C_s \/ ker chi$, and the invariant character uses the polarization. The curve–Jacobian degree-one maps and all the block identifications are algebraic operations by Companion results 3(ii). They transfer these determinant lines to the chosen Jacobian slots. Thus every linear determinant singleton is CM-supplied; there are no orthogonal blocks. The data are saturated.
  Companion results 4 now prove the assertion for every power after adjoining any CM $M$. This is a pointwise application after saturation, so $M$ does not enter the definition of $cal(T)_phi.alt^(upright("Hg"))$. Finally, the algebraic curve–Jacobian correspondences identify their first cohomology, and a point and the fundamental class supply the other two curve degrees. External products of these maps and Companion results 5 transfer the tensor conclusion to every $C_s^a times M^b$. ◻
]

== 5 Coordinate-root covers <sec:roots>

This section determines character ranks from their support and shows that projection to that support preserves the character cohomology used by the Gale correspondence.

All varieties are over $bb(C)$, and character eigenspaces are taken over $overline(bb(Q))$. We use the convention that $bb(Q) \( 1 \)$ has weight $- 2$.

#prodef([Definition 5.1.])[
  Let $m \, n gt.eq 2$ and $0 lt.eq d lt.eq m - 2$. A subspace $P subset bb(C)^m$ of dimension $d + 1$ is #emph[coordinate-general] if every $d + 1$ coordinate functionals restrict to a basis of $P^(*)$. Let $cal(U)_(d \, m) subset "Gr" \( d + 1 \, m \)$ be this open locus. For $P in cal(U)_(d \, m)$, define
  $ X_P = { \[ x_i \] in bb(P)^(m - 1) : \( x_1^n \, dots.h \, x_m^n \) in P } \, #h(2em) G_(m \, n) = \( mu_n \)^m \/ mu_n \, $
  where the denominator is diagonal. The phase action preserves $X_P$, and $q_P : X_P arrow.r bb(P) \( P \)$, $\[ x_i \] mapsto \[ x_i^n \]$, is its coordinate-power map.
] <def:root>

#prodef([Proposition 5.2.])[
  (Exact smooth locus).  #emph[Let $n gt.eq 2$, $1 lt.eq c lt.eq m - 1$, and let $A$ be a rank-$c$ matrix with $m$ columns. Then $X_A$ is a complete intersection of dimension $m - c - 1$. It is smooth if and only if every $c$-column minor of $A$ is nonzero. This condition is equivalent to coordinate generality of $P = ker A$.]
] <prop:smooth-locus>

#proof[
  The ring map $bb(C) \[ t_1 \, dots.h \, t_m \] arrow.r bb(C) \[ x_1 \, dots.h \, x_m \]$, $t_i mapsto x_i^n$, is free with basis the monomials $product_i x_i^(e_i)$, $0 lt.eq e_i < n$. It is flat, so the independent linear equations for $ker A$ remain a regular sequence after pullback. The projective coordinate-power map is finite and surjective. Its inverse image of $bb(P) \( ker A \)$ therefore has dimension $m - c - 1$, proving the first assertion.
  At a point let $I = { i : x_i eq.not 0 }$. The Jacobian has column $n a_i x_i^(n - 1)$ for $i in I$ and zero otherwise. If every $c$-minor is nonzero, every at most $c$ columns are independent. The equation $sum_(i in I) a_i x_i^n = 0$ forces $\| I \| > c$, and the Jacobian has rank $c$. Conversely, a vanishing $c$-minor gives a nonzero dependence on those columns. Taking $n$th roots of its nonzero coefficients and setting the other coordinates to zero gives a point with Jacobian rank below $c$. Here $n gt.eq 2$ makes the zero coordinates give zero Jacobian columns. The Jacobian criterion proves the equivalence.
  Projection $ker A arrow.r bb(C)^S$, for $\| S \| = m - c$, is an isomorphism exactly when no nonzero vector of $ker A$ is supported on the complementary $c$ coordinates. This is the nonvanishing of that complementary minor, proving the coordinate-generality assertion. ◻
]

#prodef([Lemma 5.3.])[
  (Cohomology outside the middle degree).  #emph[Let $X_A$ be a smooth diagonal complete intersection as in Proposition 26, of dimension $d gt.eq 1$, and put $h = c_1 \( cal(O)_(X_A) \( 1 \) \)$. For $0 lt.eq k lt.eq 2 d$ and $k eq.not d$, 
$ H^k \( X_A \, bb(Q) \) = cases(delim: "{", bb(Q) h^(k \/ 2) \, & k upright(" even") \,, 0 \, & k upright(" odd") .) $

 In particular $X_A$ is connected.]
] <lem:ambient>

#proof[
  We first choose a smooth partial-intersection flag. Let $Q$ be the row space of $A$, of dimension $c$. For every $j lt.eq c$ and every $j$-element coordinate set $I$, the projection $Q arrow.r bb(C)^I$ is surjective: a dependent set of $j$ columns could be extended to a dependent set of $c$ columns, contrary to Proposition 26. In the complete flag variety of $Q$, the condition that this projection restricts to an isomorphism on the $j$-plane is a nonempty open condition. It is nonempty by choosing a complement of the projection kernel and extending it to a flag. The flag variety is irreducible, so the intersection of these finitely many nonempty opens is nonempty. Choose such a flag $0 = Q_0 subset Q_1 subset dots.h.c subset Q_c = Q$.
  Let $Y_j$ be the diagonal zero locus of $Q_j$, with $Y_0 = bb(P)^(m - 1)$. Every maximal minor of $Q_j$ is nonzero, so Proposition 26 makes $Y_j$ smooth of dimension $m - j - 1$. Choose an equation basis adapted to the flag. Under the degree-$n$ Veronese embedding of $bb(P)^(m - 1)$, the next degree-$n$ equation is a hyperplane, so $Y_j$ is a hyperplane section of $Y_(j - 1)$ in that embedding.
  The Lefschetz hyperplane theorem in [15] Corollary 7.3, p. 41 says that for a projective variety $V$ of dimension $k$ and a hyperplane containing its singular locus, the inclusion of the section induces homology isomorphisms in degrees below $k - 1$. Here $Y_(j - 1)$ is smooth, so its singular locus is empty. Applying the theorem successively gives
  $ H_i \( X_A \, bb(Z) \) arrow.r^tilde.op H_i \( bb(P)^(m - 1) \, bb(Z) \) quad \( i < d \) . $
  Universal coefficients over $bb(Q)$ give the corresponding cohomology restriction isomorphisms. This gives connectedness at $i = 0$ and the formula below $d$.
  Poincaré duality gives the same dimensions above $d$. In even degree the ambient class is nonzero: the complete intersection has degree $n^c$, so $integral_(X_A) h^d = n^c > 0$; vanishing of any $h^r$, $0 lt.eq r lt.eq d$, would force $h^d = 0$. Thus it spans the one-dimensional even cohomology above the middle as well. ◻
]

#prodef([Lemma 5.4.])[
  (Root-cover geometry).  #emph[For $P in cal(U)_(d \, m)$, $X_P$ is a smooth projective complete intersection of dimension $d$, connected if $d gt.eq 1$. The map $q_P$ is finite and is the quotient by $G_(m \, n)$. The coordinate hyperplanes on $bb(P) \( P \)$ and their reduced inverse images on $X_P$ have simple normal crossings. For $d = 0$, $X_P$ is a $G_(m \, n)$-torsor of reduced points.]
  #emph[The open $cal(U)_(d \, m)$ is nonempty and connected, and the $X_P$ form a smooth projective family over it with its phase action.]
] <lem:geometry>

#proof[
  Any at most $d + 1$ coordinate restrictions to $P$ are independent. Thus at most $d$ coordinates vanish at a point of $bb(P) \( P \)$. If $a$ vanish, their ratios to a nonvanishing coordinate have independent differentials and extend to relative local coordinates $t_1 \, dots.h \, t_d$. After an étale base change taking roots of the remaining units, the cover has equations
  $ z_1^n = t_1 \, dots.h \, z_a^n = t_a $
  and free coordinates $t_(a + 1) \, dots.h \, t_d$. It is smooth, with normal-crossing boundary $z_1 dots.h.c z_a = 0$. The same calculation on the universal projective bundle proves the relative assertions. Proposition 26 gives the complete-intersection description.
  Fibers of the coordinate-power map are exactly phase orbits, giving the finite quotient. In dimension zero the base point has no zero coordinate, so its inverse image is a free transitive phase set. For $d gt.eq 1$, Lemma 27 gives connectedness and ambient cohomology outside the middle degree.
  For distinct $a_1 \, dots.h \, a_m in bb(C)$, the subspace ${ \( f \( a_1 \) \, dots.h \, f \( a_m \) \) : deg f lt.eq d }$ has nonzero maximal minors by the Vandermonde determinant. Thus $cal(U)_(d \, m)$ is a nonempty open in an irreducible Grassmannian, hence connected as a complex manifold. The universal incidence equations are projective over it; the local calculation proves smoothness and respects phases. ◻
]

=== 5.1 Evaluation covers and character ranks <evaluation-covers-and-character-ranks>

Identify a character of $G_(m \, n)$ with

$ b = \( b_1 \, dots.h \, b_m \) in \( bb(Z) \/ n \)^m \, quad sum_i b_i = 0 \, quad chi_b \( \[ zeta_i \] \) = product_i zeta_i^(b_i) . $

Subscripts $b$ mean eigenspaces for pullback $g^(*)$. Put $S \( b \) = { i : b_i eq.not 0 }$, $s \( b \) = \| S \( b \) \|$, and $W_(P \, b) = H^d \( X_P \, overline(bb(Q)) \)_b$. Full support means $s \( b \) = m$.

In positive dimension we first use subspaces obtained by evaluating polynomials at distinct points. Multiplication of linear polynomials realizes the corresponding root cover as a finite quotient of a power of one curve. The phase action and the signs from permuting degree-one factors then identify its nontrivial character cohomology with an exterior power. This is the graded alternating-character mechanism of [20] Lemmas 1.1–1.2; here we identify the quotient explicitly.

#prodef([Lemma 5.5.])[
  (Evaluation quotient).  #emph[Choose distinct $a_1 \, dots.h \, a_m in bb(C)$, $m gt.eq 3$, and put 
$ P_j = { \( f \( a_1 \) \, dots.h \, f \( a_m \) \) : deg f lt.eq j } quad \( 1 lt.eq j lt.eq m - 2 \) \, #h(2em) C = X_(P_1) . $

 Coordinate multiplication defines a finite surjective morphism 
$ mu_j : C^j arrow.r X_(P_j) \, #h(2em) \( x^(\( 1 \)) \, dots.h \, x^(\( j \)) \) mapsto \[ product_(nu = 1)^j x_i^(\( nu \)) \]_(i = 1)^m \, $

 which identifies the target with 
$ C^j #scale(x: 120%, y: 120%)[\/] (ker \( G_(m \, n)^j arrow.r^product G_(m \, n) \) times.r frak(S)_j) . $

 For $b eq.not 0$, pullback identifies 
$ H^j \( X_(P_j) \, overline(bb(Q)) \)_b tilde.eq and.big^j V_b \, #h(2em) V_b = H^1 \( C \, overline(bb(Q)) \)_b \, $

 with the exterior power embedded by antisymmetrization.]
] <lem:evaluation>

#proof[
  Each curve point has at most one zero coordinate. Since $j < m$, the products are never all zero. A product of evaluations of linear polynomials is the evaluation of their product, so the formula gives a morphism to $X_(P_j)$. Its defining sections give
  $ mu_j^(*) cal(O) \( 1 \) = cal(O)_C \( 1 \) times.square dots.h.c times.square cal(O)_C \( 1 \) \, $
  which is ample. A positive-dimensional projective fiber would contain a curve on which this line bundle has degree zero. Thus the proper morphism is finite.
  Homogenization $f \( z \) mapsto v^j f \( u \/ v \)$ identifies polynomials of degree at most $j$ with binary forms of degree $j$. On the bases the map multiplies $j$ binary linear forms. Every degree-$j$ form factors into such forms, including the factor $v$ representing a zero at infinity. Choose roots of the factors’ evaluation vectors; a phase change on one factor then realizes any prescribed root vector above the product. This proves surjectivity. Where the factors are distinct and no evaluation vanishes, the only identifications are their permutations and phase tuples of total product one. The indicated finite quotient therefore maps finitely and birationally to the smooth target. Normality of the target makes this map an isomorphism.
  By Lemma 6, target cohomology is the invariant cohomology of the product. In residual character $b$, product kernel invariance forces character $b$ in every factor. Connectedness of $C$ kills nontrivial characters in $H^0 \, H^2$, leaving $V_b^(⊗ j)$. A geometric interchange of two degree-one factors is minus ordinary tensor interchange. The permutation invariants are exactly the alternating tensors. ◻
]

#prodef([Proposition 5.6.])[
  (Character cohomology and support).  #emph[For $P in cal(U)_(d \, m)$, invariant cohomology is the pullback of $H^(*) \( bb(P) \( P \) \, overline(bb(Q)) \)$ and is spanned by algebraic hyperplane classes. Every nontrivial character occurs only in degree $d$, and 
$ dim_(overline(bb(Q))) W_(P \, b) = binom(s \( b \) - 2, d) quad \( b eq.not 0 \) \, $

 where the value is zero if $s \( b \) - 2 < d$.]
  #emph[If $S = S \( b \)$ has $s gt.eq d + 2$ elements, projection identifies $P$ with a coordinate-general plane $P_S subset bb(C)^S$ and defines a finite quotient $p_S : X_P arrow.r X_(P_S)$. Its pullback is an isomorphism $H^d \( X_(P_S) \, overline(bb(Q)) \)_(b \|_S) tilde.eq W_(P \, b)$. These descriptions commute with smooth parameter pullback.]
] <prop:characters>

#proof[
  The invariant assertion follows from the finite quotient formula. The pullback of a base hyperplane is $n$ times the root hyperplane. For $d gt.eq 1$, Lemma 27 makes all degrees outside $d$ ambient and phase-invariant. For $d = 0$, degree zero is the regular representation of the finite torsor.
  For $d gt.eq 1$, compute the rank at an evaluation plane. The curve $C arrow.r bb(P)^1$ is branched at the zeros of its $m$ coordinate forms. Pass to the effective cyclic quotient for $b$. Exactly the $s = s \( b \)$ points in its support have nontrivial inertia character. Its character summand of the finite pushforward of the constant sheaf is a rank-one local system off those points, extended by zero at them. Its compactly supported Euler characteristic is $2 - s$, the rank-one Euler characteristic of the punctured sphere. The connected cyclic cover has no nontrivial character in degrees zero or two. Hence $dim V_b = s - 2$. The effective quotient makes this valid for nonfaithful characters and nonunit entries as well.
  Lemma 29 gives the binomial rank there. The phase idempotent cuts out a local system on the connected $cal(U)_(d \, m)$, so the rank is constant. In dimension zero every character has rank one in the regular representation, agreeing with the formula since a nonzero sum-zero tuple has $s gt.eq 2$.
  For $s gt.eq d + 2$, any $d + 1$ selected coordinates detect $P$. Its projection is injective with coordinate-general image, and the selected root coordinates cannot all vanish. Forgetting the others defines $p_S$. Its pullback of $cal(O) \( 1 \)$ is $cal(O)_(X_P) \( 1 \)$, so the ample-line-bundle argument proves finiteness. It is surjective by taking roots of the remaining coordinate values of the determined base point.
  The fibers are exactly the orbits of $K_S = ker \( G_(m \, n) arrow.r G_(s \, n) \)$. For $d gt.eq 1$, the induced finite map $X_P \/ K_S arrow.r X_(P_S)$ is birational and its target is smooth, so it is an isomorphism. For $d = 0$, it is directly the quotient of finite torsors. The character $b$ is inflated from $G_(s \, n)$, so Lemma 6 proves the eigenspace assertion. Universal coordinate projections and constant phase actions give the asserted family compatibility. ◻
]

== 6 The perfect Gale correspondence <sec:gale>

The rank formula makes the Fermat source of the Gale tensor a line. We prove that its image pairs the two complementary character spaces perfectly at every coordinate-general parameter. The underlying orthogonal relation is linear Gale association; compare [8] preprint, Definition 1.1 and Proposition 2.2.

#prodef([Theorem 6.1.])[
  (Perfect Gale tensor).  #emph[Let $P in cal(U)_(d \, m)$, set 
$ Q = P^perp quad upright("for ") sum_i u_i v_i \, #h(2em) d' = m - d - 2 . $

 Then $Q in cal(U)_(d' \, m)$, and 
$ f_P : X_P times X_Q arrow.r F_n^(m - 2) \, #h(2em) \( \[ x_i \] \, \[ y_i \] \) mapsto \[ x_i y_i \] $

 is an algebraic morphism. For every full-support character $b$, $L_b = H^(m - 2) \( F_n^(m - 2) \, overline(bb(Q)) \)_b$ is a line, and pullback maps it to $W_(P \, b) ⊗ W_(Q \, b)$. For every $0 eq.not ell in L_b$, the tensor $f_P^(*) ell$ has full pairing rank: the associated map $W_(P \, b)^(*) arrow.r W_(Q \, b)$ is an isomorphism. This includes $d = 0$ and $d' = 0$.]
] <thm:gale>

#proof[
  We verify the morphism and its character, compute full rank at an evaluation plane, transport that rank across the connected parameter space, and then handle the zero-dimensional endpoints.
  The maximal minors of the bilinear orthogonal complement are, up to a common nonzero scalar and signs, the complementary maximal minors of $P$. This follows by comparing top exterior vectors under the standard volume pairing on $bb(C)^m$. Hence $Q$ is coordinate-general.
  A point of $X_P$ has at most $d$ zero coordinates and a point of $X_Q$ at most $d'$. Their product vector has at most $m - 2$ zeros, so it defines a morphism. Its image is on the Fermat hypersurface since $sum_i \( x_i y_i \)^n = sum_i x_i^n y_i^n = 0$. Equivariance for multiplication $G_(m \, n) times G_(m \, n) arrow.r G_(m \, n)$ sends pullback character $b$ to $\( b \, b \)$. Proposition 30 leaves only the two middle degrees. Applied to the hyperplane $sum_i z_i = 0$, it also gives $dim L_b = binom(m - 2, m - 2) = 1$.
  First suppose $d \, d' > 0$, and put $N = m - 2 = d + d'$. Choose the evaluation planes of Lemma 29, and set
  $ c_i = product_(h eq.not i) \( a_i - a_h \)^(- 1) . $
  Lagrange interpolation gives
  $ sum_i c_i a_i^e = 0 #h(2em) \( 0 lt.eq e lt.eq m - 2 \) \, $
  by comparing the coefficient of $z^(m - 1)$ in the interpolation formula for $z^e$. Products of polynomials of degrees at most $d \, d'$ have degree at most $m - 2$; the identities and dimension give
  $ P_d^perp = "diag" \( c_i \) P_(d') \, #h(2em) { \( z_i \) : sum_i z_i = 0 } = "diag" \( c_i \) P_N . $
  Choose $xi_i^n = c_i$, and let $s_xi \( \[ z_i \] \) = \[ xi_i z_i \]$ be coordinate scaling. It restricts to phase-equivariant isomorphisms
  $ s_xi : X_(P_(d')) arrow.r^tilde.op X_(P_d^perp) \, #h(2em) s_xi : X_(P_N) arrow.r^tilde.op F_n^N . $
  The actual evaluation maps of Lemma 29 give the commutative square
  $ C^N = C^d times C^(d') & arrow.r^(med mu_d times \( s_xi compose mu_(d') \) med) & X_(P_d) times X_(P_d^perp)\
s_xi compose mu_N arrow.b &  & arrow.b f_(P_d)\
F_n^N & arrow.r^(med "id" med) & F_n^N . $
  Indeed, both composites send an ordered tuple $\( x^(\( 1 \)) \, dots.h \, x^(\( N \)) \)$ to $\[ xi_i product_(nu = 1)^N x_i^(\( nu \)) \]_(i = 1)^m$. With $V = H^1 \( C \, overline(bb(Q)) \)_b$, pullback in this square and Lemma 29 identify the three character spaces as
  $ L_b tilde.eq and.big^N V \, #h(2em) W_(P_d \, b) tilde.eq and.big^d V \, #h(2em) W_(P_d^perp \, b) tilde.eq and.big^(d') V . $
  Full support gives $dim V = N$. Use the unnormalized alternating inclusion
  $ iota_j \( v_1 and dots.h.c and v_j \) = sum_(sigma in frak(S)_j) "sgn" \( sigma \) v_(sigma \( 1 \)) ⊗ dots.h.c ⊗ v_(sigma \( j \)) . $
  More precisely, Lemma 29 says that $mu_j^(*)$ identifies its character space with $"im" iota_j$. The exact equality of coordinate-product maps shows that the induced pullback from the Fermat line is the exterior coproduct
  $ and.big^N V arrow.r and.big^d V ⊗ and.big^(d') V : $
  after $iota_d ⊗ iota_(d')$ it is $iota_N$, and these inclusions are injective. For a basis $v_1 \, dots.h \, v_N$, it is
  $ v_1 and dots.h.c and v_N mapsto sum_(I subset { 1 \, dots.h \, N }\
\| I \| = d) "sgn" \( I \, I^c \) thin v_I ⊗ v_(I^c) . $
  Each wedge uses increasing order. Complementary wedge bases are paired bijectively with nonzero coefficients, proving full rank $binom(N, d)$.
  The map $P mapsto P^perp$ is algebraic; the bilinear, not Hermitian, orthogonal complement is essential here. The maps $f_P$ form a morphism from the smooth projective product family over $cal(U)_(d \, m)$ to the fixed Fermat variety. Cohomological pullback is a morphism of local systems. In flat character frames the tensor is constant, so its matrix rank is locally constant. Connectedness extends the computed rank to every $P$.
  If $d = 0$, choose a root point $x$ above $bb(P) \( P \)$. Every $x_i eq.not 0$, and multiplication by $x$ identifies $X_Q$ with $F_n^(m - 2)$. The restriction of $f_P$ to ${ x } times X_Q$ is this isomorphism. Its pullback on $L_b$ is nonzero. A nonzero eigenfunction on the finite torsor $X_P$ is nonzero at every point, so evaluation at $x$ detects a nonzero $\( b \, b \)$ tensor. Both character ranks are one, hence it has full rank. The case $d' = 0$ is symmetric, including $m = 2$ when all the varieties are finite. ◻
]

=== 6.1 A rational correspondence supplying cohomology <a-rational-correspondence-supplying-cohomology>

The next objective is a forward source map to $X_P$. For a support $S$ with $\| S \| gt.eq d + 2$, project to $P_S = "pr"_S P$, then contract the perfect Gale tensor against opposite-character cohomology of $Y_S = X_(P_S^perp)$. The source is $F_n^(\| S \| - 2) times Y_S$. The resulting graph cycle is rational, so the character calculation after scalar extension will prove spanning for the cycle’s action on a whole rational source degree.

For a smooth projective source $T$, a correspondence $Gamma in "CH"^(dim T + j) \( T times X \)_(bb(Q))$ acts by

$ Gamma_(*) alpha = \( "pr"_X \)_(*) \( "pr"_T^(*) alpha smile \[ Gamma \] \) . $

It sends $H^(k - 2 j) \( T \, bb(Q) \) \( - j \)$ to $H^k \( X \, bb(Q) \)$ as a Hodge map. Pullback by a morphism is represented by its transpose graph.

#prodef([Proposition 6.2.])[
  (Gale cohomology supply).  #emph[Let $P in cal(U)_(d \, m)$. For each $S subset { 1 \, dots.h \, m }$ with $s = \| S \| gt.eq d + 2$, put 
$ P_S = "pr"_S P \, quad Q_S = P_S^perp \, quad Y_S = X_(Q_S) \, quad h_S = s - d - 2 . $

 There is a rational algebraic correspondence from $F_n^(s - 2) times Y_S$ to $X_P$, with degree shift $- 2 h_S$, whose image after scalar extension contains $W_(P \, b)$ for every character with support $S$.]
  #emph[Together with hyperplane cycles from a point, these finitely many maps span the full rational cohomology of $X_P$. In the middle degree the source maps may be taken on the entire groups 
$ H^(d + 2 h_S) \( F_n^(s - 2) times Y_S \, bb(Q) \) \( h_S \) . $

]
] <prop:supply>

#proof[
  First target $X = X_(P_S)$. Put $h = h_S$, $F = F_n^(s - 2)$, and $Y = Y_S$. Thus $dim F = d + h$, $dim X = d$, and $dim Y = h$. The graph embedding
  $ X times Y arrow.r \( F times Y \) times X \, #h(2em) \( x \, y \) mapsto \( f_(P_S) \( x \, y \) \, y \, x \) $
  defines $Gamma_S in "CH"^(d + h) \( F times Y times X \)_(bb(Q))$. The source dimension is $d + 2 h$, so the shift is $- 2 h$. On a Künneth tensor its action is
  $ alpha ⊗ beta mapsto \( "pr"_X \)_(*) #scale(x: 120%, y: 120%)[\(] f_(P_S)^(*) alpha smile "pr"_Y^(*) beta #scale(x: 120%, y: 120%)[\)] . $
  For a character $b$ with support $S$, put $b_S = b \|_S$ and $L_(b_S) = H^(s - 2) \( F \, overline(bb(Q)) \)_(b_S)$. The invariant Poincaré pairing on $Y$ pairs only opposite characters and is perfect on each opposite pair, by its full nondegeneracy and the direct character decomposition. This also holds for the sum pairing on a finite torsor. It identifies $H^h \( Y \, overline(bb(Q)) \)_(- b_S) \( h \)$ with the dual of $H^h \( Y \, overline(bb(Q)) \)_(b_S)$. Theorem 31 therefore makes the displayed graph action an isomorphism of Hodge-graded spaces
  $ L_(b_S) ⊗ H^h \( Y \, overline(bb(Q)) \)_(- b_S) \( h \) arrow.r^(#h(0.27778em) tilde.op #h(0.27778em)) H^d \( X \, overline(bb(Q)) \)_(b_S) . $
  Composing with $p_S^(*)$ fills $W_(P \, b)$.
  Both the graph cycle and the transpose graph for $p_S^(*)$ have rational coefficients. Apply them to the entire source degree, without character projectors. After scalar extension their images contain all the character pieces just described. Hyperplane cycles from a point supply the invariant cohomology, including every degree outside the middle. The sum of these finite rational maps is thus surjective after extension to $overline(bb(Q))$; its rational cokernel is already zero. No algebraic Künneth projector is required. ◻
]

#prodef([Lemma 6.3.])[
  (Sources in codimension at most two).  #emph[Let $X_P$ have dimension $d$ and codimension $c = m - d - 1 in { 1 \, 2 }$, and write $S = S \( b \)$ for the support of a character $b$.]
  + #emph[If $c = 1$, every nontrivial character $b$ with $W_(P \, b) eq.not 0$ has full support, and its dual source $Y_S$ in Proposition 32 is finite.]
  + #emph[If $c = 2$, every nontrivial character $b$ with $W_(P \, b) eq.not 0$ has support of size $m$ or $m - 1$. The full-support source is the one connected curve $C = X_(P^perp)$. If $S = { 1 \, dots.h \, m } \\ { i }$, then $Y_S$ is the reduced $i$th boundary fiber of $C$, with the zero coordinate omitted, and consists of $n^(m - 2)$ points.]
] <lem:one-curve>

#proof[
  For $b eq.not 0$, put $S = S \( b \)$ and $s = \| S \|$. If $W_(P \, b) eq.not 0$, then $s gt.eq d + 2$, and $dim Y_S = s - d - 2$. If $c = 1$, $m = d + 2$, so $s = m$ is the only possibility and the source dimension is zero. If $c = 2$, $m = d + 3$, so $s = m$ gives dimension one and $s = m - 1$ gives dimension zero. The full-support source is $X_(P^perp)$, connected by Lemma 28.
  For a missing-one support, zero extension identifies
  $ \( "pr"_S P \)^perp = { q \|_S : q in P^perp \, med q_i = 0 } . $
  This is the coordinate-general line cut from the dual two-plane by its $i$th coordinate hyperplane. Its root torsor is precisely the reduced fiber ${ y_i = 0 }$ on $C$ after forgetting that coordinate. The phase group has size $n^(m - 2)$. Distinct boundary fibers are disjoint because a root-curve point has at most one zero coordinate. ◻
]

Finite dual sources require only point classes. The only possible contributing positive-dimensional dual source is therefore the full-support curve in codimension two. Its Fermat factor remains in the cohomology supply.

== 7 The full branch-configuration family <sec:family>

For the curve of Lemma 33, we compare every marked cover fiber with transport in its normalized root family. This will verify that its tensor-generic parameters belong to $cal(T)_phi.alt^(upright("Hg"))$, as required by Theorem 1. The normalized diagonal curves are the standard generalized Fermat models of [11,13]; the relative roots and based marking needed here are specified below.

=== 7.1 The coefficient space as a product <the-coefficient-space-as-a-product>

Let $m gt.eq 3$. For a frame $A = \( a_1 \, dots.h \, a_m \)$ of $Q in cal(D)_(2 \, m)$, put $Delta_(i j) = det \( a_i \, a_j \)$. The coordinate form on $bb(P) \( Q \)$ is $ell_i \( s \, t \) = a_(1 i) s + a_(2 i) t$, with zero $p_i = \[ - a_(2 i) : a_(1 i) \]$. Let

$ M_m = { \( z_4 \, dots.h \, z_m \) in \( bb(A)^1 \\ { 0 \, 1 } \)^(m - 3) : z_i eq.not z_j } \, $

with $M_3$ a point. Normalizing the first three labelled points to $oo = \[ 1 : 0 \]$, $0 = \[ 0 : 1 \]$, $1 = \[ 1 : 1 \]$ identifies $M_m$ with $M_(0 \, m)$.

#prodef([Proposition 7.1.])[
  (The branch map).  #emph[The normalized branch configuration is the regular morphism 
$ lambda : cal(D)_(2 \, m) arrow.r M_m \, #h(2em) z_i = frac(Delta_(2 i) Delta_13, Delta_(1 i) Delta_23) quad \( i gt.eq 4 \) . $

 There is a global product isomorphism $cal(D)_(2 \, m) tilde.eq M_m times \( bb(G)_m \)^(m - 1)$ under which $lambda$ is projection. It is smooth and surjective, and the quotient by the effective coefficient torus $\( bb(G)_m \)^m \/ bb(G)_m$ is $M_m$.]
] <prop:parameter>

#proof[
  The ratios are row-basis independent and their denominators are units. The Plücker relations give
  $ z_i - 1 = frac(Delta_12 Delta_(3 i), Delta_(1 i) Delta_23) \, #h(2em) z_i - z_j = - frac(Delta_12 Delta_13 Delta_(i j), Delta_23 Delta_(1 i) Delta_(1 j)) \, $
  so the values lie in $M_m$.
  Let $A_0 \( z \)$ have columns
  $ \( 0 \, 1 \)^t \, med \( 1 \, 0 \)^t \, med \( 1 \, - 1 \)^t \, med \( 1 \, - z_4 \)^t \, dots.h \, \( 1 \, - z_m \)^t . $
  Set $t_1 = 1$ and
  $ t_2 = Delta_23 / Delta_13 \, quad t_3 = Delta_23 / Delta_12 \, quad t_i = frac(Delta_(1 i) Delta_23, Delta_12 Delta_13) quad \( i gt.eq 4 \) . $
  All are nonzero regular functions of $Q$. With $B = \( a_1 \, a_2 \)$, left multiplication by
  $ H = mat(delim: "(", 0, t_2; 1, 0) B^(- 1) $
  gives, by Cramer’s rule,
  $ H a_1 = \( 0 \, 1 \)^t \, quad H a_2 = \( t_2 \, 0 \)^t \, quad H a_3 = \( t_3 \, - t_3 \)^t \, quad H a_i = \( t_i \, - t_i z_i \)^t . $
  Hence $Q = "row" \( A_0 \( z \) "diag" \( t_i \) \)$. Conversely, substituting this form into the ratios recovers $z \, t_2 \, dots.h \, t_m$. These are inverse regular maps for the product isomorphism. The effective coefficient torus acts freely and transitively on the second factor, giving the quotient claim. ◻
]

#prodef([Remark 7.2.])[
  On framed coefficient matrices the map to $"Conf"_m \( bb(P)^1 \)$ is a principal $\( bb(G)_m \)^m$-bundle: fixing the zero points leaves one independent nonzero scalar for each coordinate covector. A row change $A mapsto g A$ acts on the points by $g^(- t)$. Thus the framed coefficient space surjects onto $"Conf"_m \( bb(P)^1 \)$. After row changes are removed, the quotient $cal(D)_(2 \, m) \/ \( \( bb(G)_m \)^m \/ bb(G)_m \)$, not $cal(D)_(2 \, m)$ itself, is $M_(0 \, m)$.
]

=== 7.2 Coordinate roots and the fixed cover <coordinate-roots-and-the-fixed-cover>

Put $Q_0 \( z \) = "row" A_0 \( z \)$ and $P_0 \( z \) = Q_0 \( z \)^perp$. The normal form gives

$ Q \( t \, z \) = "diag" \( t_i \) Q_0 \( z \) \, #h(2em) P \( t \, z \) = "diag" \( t_i^(- 1) \) P_0 \( z \) . $

The normalized dual curves form a smooth projective family $cal(Y)_0 arrow.r M_m$ by Lemma 28. Let $iota_z : bb(P)^1 arrow.r^tilde.op bb(P) \( Q_0 \( z \) \)$ be the projective isomorphism induced by the row frame $A_0 \( z \)$. Write

$ q_z := iota_z^(- 1) compose q_(Q_0 \( z \)) : X_(Q_0 \( z \)) arrow.r bb(P)^1 \, #h(2em) D_z := { oo \, 0 \, 1 \, z_4 \, dots.h \, z_m } . $

The points of $D_z$ retain this order and are regarded as a reduced divisor.

#prodef([Proposition 7.3.])[
  (The normalized root family and its fixed deck datum).  #emph[The map 
$ rho : tilde(cal(D))_(2 \, m \, n) := M_m times \( bb(G)_m \)^(m - 1) arrow.r cal(D)_(2 \, m) \, #h(2em) \( z \, h_2 \, dots.h \, h_m \) mapsto \( z \, h_2^n \, dots.h \, h_m^n \) $

 is a connected finite étale cover of degree $n^(m - 1)$. Set $h_1 = 1$. Over it, the algebraic maps $\[ y_i \] mapsto \[ h_i y_i \]$ and $\[ x_i \] mapsto \[ h_i^(- 1) x_i \]$ identify the normalized dual and original root families with the families for $Q \( t \, z \)$ and $P \( t \, z \)$, respectively. They commute with $G_(m \, n)$.]
  #emph[Every $q_z$ is a connected $G_(m \, n)$-cover of $bb(P)^1$, with ordered branch points $\( oo \, 0 \, 1 \, z_4 \, dots.h \, z_m \)$. Identify 
$ G_(m \, n) tilde.eq \( bb(Z) \/ n \)^m \/ chevron.l \( 1 \, dots.h \, 1 \) chevron.r $

 using $zeta_n = exp \( 2 pi i \/ n \)$. Its ordered positive local monodromies are the images $\( macron(e)_1 \, dots.h \, macron(e)_m \)$ of the standard basis. The family runs over all ordered branch configurations with this fixed deck datum.]
] <prop:cover-family>

#proof[
  The map is the $n$-power map on a torus times the identity. It is finite locally free of degree $n^(m - 1)$ and étale because $n h_i^(n - 1)$ is a unit. Its source is irreducible. The coordinate scalings satisfy the root equations by the preceding formulas for $P \, Q$; their inverses and phase equivariance are immediate.
  On the normalized base $\[ s : t \]$, the coordinate forms are
  $ t \, med s \, med s - t \, med s - z_4 t \, dots.h \, s - z_m t . $
  Their ordered zeros are the stated branch points. On $t eq.not 0$, put $v = s \/ t$, $w_i = y_i \/ y_1$. The function field is
  $ w_2^n = v \, #h(2em) w_3^n = v - 1 \, #h(2em) w_i^n = v - z_i quad \( i gt.eq 4 \) . $
  Valuations at the distinct finite points show that these $m - 1$ functions are independent in $bb(C) \( v \)^(*) \/ bb(C) \( v \)^(* n)$. Kummer theory gives degree $n^(m - 1)$. Equivalently, adjoin the roots successively and use an Eisenstein test at the new branch point, where the earlier functions are units with local roots. Thus the cover is connected and its phase group is its full deck group.
  At a finite point indexed by $i gt.eq 2$, a positive meridian multiplies $w_i$ by $zeta_n$ and fixes the other local roots, giving $macron(e)_i$. At infinity all right sides have simple poles, so a meridian multiplies every $w_i$, $i gt.eq 2$, by $zeta_n^(- 1)$. This is $macron(e)_1 = - sum_(i gt.eq 2) macron(e)_i$. The entries have order $n$, sum to zero, and generate the group.
  For $* in bb(P)^1 \\ D_z$, positive meridians generate the punctured-sphere fundamental group with their product as the single relation. The displayed epimorphism is precisely abelianization modulo $n$:
  $ pi_1 \( bb(P)^1 \\ D_z \, * \) arrow.r H_1 \( bb(P)^1 \\ D_z \, bb(Z) \/ n \) tilde.eq \( bb(Z) \/ n \)^m \/ chevron.l \( 1 \, dots.h \, 1 \) chevron.r . $
  A pure orientation-preserving mapping class conjugates each positive peripheral meridian, so it fixes this epimorphism. The standard classification of connected covers by epimorphisms shows that the ordered tuple determines the single fixed cover type here. For each complex structure on the pointed base, pullback charts off the punctures and the local ramification power charts give the unique complex structure on its compact covering surface. The root equations realize it for every configuration in $M_m$. ◻
]

The coefficient normalization and the coordinate-root cover have now realized every normalized unmarked cover with its fixed deck datum. A based topological marking is additional data: it retains an isotopy class relative to the labels. We will reach each such marking by a configuration path with a transported lift. The following sphere-isotopy fact provides the required paths.

#prodef([Lemma 7.4.])[
  (Sphere isotopy).  #emph[Every orientation-preserving self-homeomorphism of $S^2$ is isotopic to the identity through self-homeomorphisms, with no marked points required to stay fixed during the isotopy.]
] <lem:sphere-isotopy>

#proof[
  We use the planar Schoenflies theorem in its annulus form: the region between two nested Jordan curves is an annulus. It gives the following disk extension fact. If $D_0 \, D_1$ are closed disks in the interior of a closed disk $U$, then an orientation-preserving homeomorphism $D_0 arrow.r D_1$ extends to a homeomorphism of $U$ which is the identity on $partial U$. Indeed, the two complementary regions in $U$ are annuli. In annulus coordinates, the prescribed maps on their two boundary circles extend across the annulus: orientation-preserving circle homeomorphisms are isotopic, as is seen by taking increasing lifts to $bb(R)$ and linearly interpolating the lifts. Gluing this annulus map to the given disk map proves the extension fact.
  Let $g$ be the given sphere homeomorphism. Choose $p in S^2$, a point $q$ different from $p$ and $g \( p \)$, and a small closed disk $D$ about $p$ for which both $D$ and $g \( D \)$ avoid $q$. Their compact union lies in the interior of a closed disk $U subset S^2 \\ { q }$. The disk extension fact gives a homeomorphism $f$ of $U$, fixed on its boundary, which agrees with $g$ on $D$. Extend $f$ by the identity outside $U$. The Alexander trick isotopes $f$ to the identity, supported in $U$: in unit-disk coordinates a boundary-fixed map $F$ is deformed by
  $ F_t \( x \) = cases(delim: "{", t F \( x \/ t \) \, & \| x \| lt.eq t \,, x \, & \| x \| gt.eq t \,) #h(2em) F_0 = "id" \, quad 0 < t lt.eq 1 . $
  Now $f^(- 1) g$ fixes $D$ pointwise, so it is a boundary-fixed homeomorphism of the complementary closed disk. A second Alexander trick isotopes it to the identity. Composing the two isotopies proves the assertion. ◻
]

To record a freely moving auxiliary basepoint, set

$ V_m = { \( z \, b \) in M_m times bb(P)^1 : b in.not D_z } tilde.eq M_(0 \, m + 1) . $

Let $B_(m \, n)$ be the complement of the coordinate boundary in the total dual curve family $cal(Y)_0$, and define $beta : B_(m \, n) arrow.r V_m$ by $beta \( z \, y \) = \( z \, q_z \( y \) \)$. The two kinds of parameter maps are

$ tilde(cal(D))_(2 \, m \, n) & arrow.r_(upright("forget roots"))^rho & cal(D)_(2 \, m) & arrow.r_(upright("branches"))^lambda & M_m\
B_(m \, n) & arrow.r_(upright("forget lift"))^beta & V_m & arrow.r_(upright("forget ") b)^("pr"_1) & M_m . $

The first row concerns coefficient normalization and finite coordinate-root choices. In the second, $B_(m \, n)$ records a chosen point above $b$. A marking will be represented by a path in $V_m$ lifted to $B_(m \, n)$, not by a point of $tilde(cal(D))_(2 \, m \, n)$.

#prodef([Lemma 7.5.])[
  (The based marked comparison).  #emph[The map $beta : B_(m \, n) arrow.r V_m$ defined above is a connected finite étale $G_(m \, n)$-torsor. Pullback of the root family to $B_(m \, n)$ has the tautological chosen lift $y$ of the auxiliary basepoint $b = q_z \( y \)$.]
  #emph[Use orientation-preserving homeomorphism markings, up to isotopy relative to the labels. Fix an initial based equivariant identification with a root fiber. For every marked complex sphere with the datum of Proposition 36, there is a path in $V_m$, lifted from the chosen point of $B_(m \, n)$, such that under its induced cohomological identification the endpoint root Hodge filtration is exactly the filtration of the prescribed marked cover. Consequently, a rational tensor which remains Hodge after root-family transport along every path in $M_m$ is Hodge in every marked fiber.]
  #emph[The parameter space making both coordinate-root and based-lift choices is 
$ tilde(cal(D))_(2 \, m \, n) times_(M_m) B_(m \, n) tilde.eq B_(m \, n) times \( bb(G)_m \)^(m - 1) . $

 It is connected and projects smoothly and surjectively to $B_(m \, n)$.]
] <lem:based>

#proof[
  Away from $D_z$, $q_z$ is finite étale with free transitive phase fibers. This proves the torsor assertion except for connectedness. The total $cal(Y)_0$ is irreducible: it is smooth over the irreducible $M_m$, and every fiber is connected. Indeed its irreducible components, being disjoint open components of a smooth variety, would have nonempty open images on the base; two such images meet, contradicting connectedness of that fiber. Removing the boundary leaves a nonempty irreducible open. Thus $B_(m \, n)$ is connected.
  Fix $\( z_0 \, y_0 \) in B_(m \, n)$, put $b_0 = q_(z_0) \( y_0 \)$, and identify the fixed labelled topological sphere with the normalized base at $\( z_0 \, b_0 \)$. Also fix a $G_(m \, n)$-equivariant identification of its topological cover with the root cover, taking the fixed upstairs point to $y_0$. The based epimorphisms agree because both take the ordered positive meridians to $macron(e)_i$. A change of the chosen lift conjugates the epimorphism and hence leaves it unchanged for this abelian group.
  Consider any prescribed marked complex sphere. A complex curve of genus zero is $bb(P)^1$, and its first three branch labels give a unique Möbius normalization to $oo \, 0 \, 1$. The marking is then represented by an orientation-preserving self-homeomorphism $g$ of the reference sphere which carries all reference labels to the normalized target labels. It fixes the first three labels at the endpoint. By Lemma 37, choose an unmarked isotopy $g_t$ from the identity to $g$. For each $t$, let $a_t$ be the unique Möbius transformation taking $g_t \( p_1 \) \, g_t \( p_2 \) \, g_t \( p_3 \)$ to $oo \, 0 \, 1$. The formulas for the transformation of a distinct triple show that $a_t$ is continuous, and $a_0 = a_1 = "id"$. Thus $a_t g_t$ keeps the first three images fixed. Its remaining branch images and its auxiliary-point image give a path $gamma$ in $V_m$, starting at $\( z_0 \, b_0 \)$, whose endpoint marking is the prescribed $g$, not only a marking of the same unmarked fiber.
  Lift $gamma$ uniquely to $B_(m \, n)$ from $\( z_0 \, y_0 \)$; write $y_t$ for its tautological upstairs point. Naturality of oriented labelled meridians under $a_t g_t$ and the abelianization description in Proposition 36 give equality of the exact based epimorphisms at every $t$. The covering-space lifting criterion therefore gives a unique $G_(m \, n)$-equivariant lift of the base marking which sends the fixed upstairs point to $y_t$. Covering homotopy lifting and uniqueness make these lifts continuous along $gamma$. They extend over the compactification through the fixed local ramification power charts, giving a continuous trivialization of the compact root family pulled back to the path interval. They therefore induce exactly its cohomological parallel transport along the projection of $gamma$ to $M_m$.
  At the endpoint, this lifted covering identification is holomorphic for the complex structure of the prescribed marked cover: off the branch points both complex structures are pulled back from the normalized base, and the same statement holds in the local power charts. Hence it identifies the endpoint Hodge filtrations. This proves the asserted tensor consequence. No loop in $V_m$ is required to lift to a loop in $B_(m \, n)$; its endpoint lift may differ by a deck phase, which is precisely retained by the transported point $y_t$.
  Finally $V_m arrow.r M_m$ is smooth and surjective, with fiber the punctured line. Its composite with the finite étale torsor is smooth and surjective. The product description of $tilde(cal(D))_(2 \, m \, n)$ gives the displayed fiber product; it is connected and its projection is the torus projection. ◻
]

#prodef([Remark 7.6.])[
  (Coordinate roots and automorphisms).  The cover $rho$ records coordinate-root choices. It cannot generally be omitted from a global algebraic family isomorphism: a torus coordinate has no regular $n$th root on the original torus. Different choices change the dual isomorphism by a deck phase. More precisely, let $T_(upright("root")) = \( bb(G)_m \)^m \/ bb(G)_m$ act on root coordinates and let $T_(upright("coef")) = \( bb(G)_m \)^m \/ bb(G)_m$ be the effective coefficient torus of Proposition 34. For the dual curve the induced map is $\[ n \] : T_(upright("root")) arrow.r T_(upright("coef"))$; the inverse coordinate convention for the original intersection composes it with inversion. Its kernel is $G_(m \, n)$. Thus $T_(upright("coef"))$ acts freely on the coefficient locus, whereas the $T_(upright("root"))$-action retains exactly the phase stabilizer.
]

=== 7.3 Algebraic very-generality <algebraic-very-generality>

The tensor condition in the marked-cover theorem is phrased on a marked parameter space. For the present algebraic family its exceptional tensor loci are algebraic on $M_m$, which gives the algebraic meaning of #emph[very general] in Theorem 2.

#prodef([Lemma 7.7.])[
  (Tensor-generic points).  #emph[Let $S$ be a smooth connected complex algebraic variety carrying an integral polarized variation $bb(V)$ of weight one. On the universal cover of $S^(upright("an"))$, mark its underlying local system. Outside a countable union of proper closed algebraic subsets of $S$, every rational tensor in $bb(V)_s^(⊗ 2 a)$ of type $\( a \, a \)$ remains of that type after parallel transport along every path starting at $s$, for every $a gt.eq 0$.]
] <lem:tensor-generic>

#proof[
  The tensor variation $bb(V)^(⊗ 2 a) \( a \)$, with the standard tensor/Tate polarization rescaled by a positive integer if needed, is integral, polarized, and of weight zero. Denote its polarization by $Q_a$. Multiplying a denominator makes a rational tensor integral. For an integral flat tensor $u$ on the universal cover, let $H_u subset S$ be the set where some determination of $u$ has type $\( 0 \, 0 \)$. Cattani–Deligne–Kaplan, Corollary 1.3 on p. 2 of the preprint [4], says that $H_u$ is algebraic. Its proof writes $H_u$, for $K = Q_a \( u \, u \)$, as a union of images of connected components of the algebraic variety $S^(\( K \))$ finite over $S$ in their Theorem 1.1. There are finitely many such components, and finite morphisms are closed, so $H_u$ is closed.
  If $u$ is not Hodge throughout the universal cover, $H_u$ is proper. On a simply connected analytic chart, its determinations form a countable set of integral tensors. Each has a closed analytic Hodge locus: for a real weight-zero tensor, type $\( 0 \, 0 \)$ is equivalent to membership in the holomorphic subbundle $F^0$. None contains an open subset, since analytic continuation on the connected universal cover and deck equivariance would then make $u$ globally Hodge. If $H_u = S$, the chart would be covered by countably many nowhere-dense closed analytic subsets, contrary to Baire’s theorem. Hence $H_u$ is proper.
  There are countably many integral tensors in all powers. Remove $H_u$ for the ones which are not globally Hodge. A rational Hodge tensor at a remaining point, after clearing a denominator, must be globally Hodge on the universal cover, equivalently Hodge after parallel transport along every path from that point. ◻
]

#prodef([Corollary 7.8.])[
  #emph[There is a countable union $Z$ of proper closed algebraic subsets of $M_m$ such that for $z in.not Z$, every CM abelian $B$, and every $N gt.eq 1$, the rational Hodge conjecture holds on $\( "Jac" \( X_(Q_0 \( z \)) \) times B \)^N$. The same holds for the dual curve at every point of $cal(D)_(2 \, m) \\ lambda^(- 1) \( Z \)$.]
] <cor:good-curves>

#proof[
  Write $pi : cal(Y)_0 arrow.r M_m$. Its integral polarized variation is $bb(V) = R^1 pi_(*) bb(Z)$. Apply Lemma 40. For a remaining $z$, choose an auxiliary point and one of its lifts, hence a point of $B_(m \, n)$, and fix the initial based identification. A rational tensor Hodge in this marked fiber corresponds to a rational tensor in the root fiber. By the lemma, it remains Hodge under transport along every path in $M_m$. For any prescribed marked fiber, Lemma 38 supplies a path in $V_m$ and its based lift whose endpoint filtration is that of the prescribed cover. Applying root-family globality to the projected path shows that the tensor is Hodge in that marked fiber. The fiber was arbitrary, so this marked parameter belongs to $cal(T)_phi.alt^(upright("Hg"))$. Theorem 1 applies.
  Surjectivity of $lambda$ makes inverse images of the proper algebraic exceptional subsets proper. At a complex point above $z$, roots of its torus coordinates exist, and Proposition  36 identifies its dual curve with $X_(Q_0 \( z \))$. The Hodge conclusion is invariant under this algebraic isomorphism. ◻
]

== 8 Hodge classes on all self-powers <sec:assembly>

Lemma 33 leaves at most one contributing positive-dimensional dual source. Section 7 supplies its cover-Jacobian conclusion; we now combine it with CM sources for the Fermat factors.

#proof[
  For $c = 0$, products of hyperplane classes span every power of projective space. If $d = 0$, the smooth target and all its powers are reduced finite sets, whose point cycles span cohomology. Assume henceforth $d gt.eq 1$ and $c = 1$ or $2$.
  Proposition 32 gives finitely many rational algebraic maps spanning each cohomology degree of $X_P$. For a nontrivial character with support $S$, their source is $F_n^(s - 2) times Y_S$, with shift $- 2 h_S$. Apply Proposition 8 to $H^(s - 2) \( F_n^(s - 2) \, bb(Q) \)$, the cohomology group that witnesses character spanning. Compose its finite CM-source maps with the Gale correspondence. These compositions are rational algebraic: pull the cycles to a triple product, intersect them, and push forward.
  For a finite $Y_S$, use the inclusions of all its points to span its entire degree-zero cohomology. For the full-support curve $C$, choose an Abel map $C arrow.r "Jac" \( C \)$. Its pullback on $H^1$ is an isomorphism induced by the transpose graph, and supplies the factor required in the contraction. Hyperplane cycles from a point supply the ambient target classes.
  Suppose one Fermat-source map from a CM abelian variety $B$ has shift $2 j$, and put $h = h_S$. Let $A_S = "Jac" \( C \)$ when $Y_S = C$, and let $A_S$ be a point for one chosen component when $Y_S$ is finite. The composite with the degree-preserving $A_S$-to-$Y_S$ map and the Gale shift $- 2 h$ has total shift $2 \( j - h \)$:
  $ H^(d + 2 h - 2 j) \( B times A_S \, bb(Q) \) \( h - j \) arrow.r H^d \( X_P \, bb(Q) \) . $
  Its Künneth subspace $H^(d + h - 2 j) \( B \) ⊗ H^h \( A_S \)$ is the part used to witness spanning. The map itself is applied to the whole source degree.
  Put $A_C = "Jac" \( C \)$ in codimension two and let $A_C$ be a point in codimension one. Combining these maps with the ambient point correspondences gives, in every degree $k$, a surjection
  #[#set math.equation(numbering: n => "(*)")
   $ xor.big_nu H^(k - 2 j_nu) #scale(x: 120%, y: 120%)[\(] A_C^(v_nu) times B_nu \, bb(Q) #scale(x: 120%, y: 120%)[\)] \( - j_nu \) arrow.r H^k \( X_P \, bb(Q) \) \, $]
  where $v_nu in { 0 \, 1 }$ and $B_nu$ is CM. In codimension one all $v_nu = 0$. The integers $j_nu$ include the negative Gale shifts and the CM-source shifts. All maps are rational algebraic correspondences. After scalar extension to $overline(bb(Q))$, the specified Künneth character pieces span by Proposition 32. Applying each rational correspondence to the whole source degree only enlarges its image, so the rational cokernel vanishes. No algebraic Künneth projector is used.
  It remains to verify the finite-product Hodge hypothesis for these sources; Companion results 5 will then apply to $\( * \)$ and give all self-powers of $X_P$ at once. For $c = 1$, take as source collection all CM abelian varieties, including a point. Their finite products are CM, so the CM Hodge theorem [17] Theorem 1.1 gives the required hypothesis at every parameter. Equivalently, coordinate scaling identifies each smooth one-equation diagonal hypersurface with a Fermat hypersurface.
  For $c = 2$, choose $P^perp$ outside the union in Corollary 41. For this fixed curve $C$, let
  $ cal(S)_C = { "Jac" \( C \)^a times M : a gt.eq 0 \, med M upright(" a CM abelian variety") } . $
  A finite product of these sources again has the displayed form. If $a gt.eq 1$, it is an algebraic retract of $\( "Jac" \( C \) times M \)^a$: retain every Jacobian factor and one $M$ factor, and set the other $M$ coordinates to zero for the section. Pull a Hodge class on the retract to that power. Corollary 41 makes it algebraic there, and pullback along the section returns an algebraic representative on the retract. The corollary applies to every $M$ at the same parameter. If $a = 0$, the CM Hodge theorem applies. Thus $cal(S)_C$ satisfies the full finite-product hypothesis of Companion results 5 as well. Applying that transfer to $\( * \)$, with target $X_P$, proves the assertion for every self-power in both cases.
  The exceptional union depends only on the tensor variation of the single curve, not on the number of factors or the CM sources. The same parameter therefore works for every self-power. Proposition  26 identifies its ambient open with the full smooth diagonal parameter locus. ◻
]

#prodef([Remark 8.1.])[
  (Low-dimensional checks).  The dual curve has degree $n^(m - 1)$ over the line and $m$ branch points of inertia order $n$. Riemann–Hurwitz gives
  $ 2 g \( C \) - 2 = n^(m - 2) #scale(x: 120%, y: 120%)[\(] m \( n - 1 \) - 2 n #scale(x: 120%, y: 120%)[\)] . $
  For $m = 3$, the original codimension-two target is $n^2$ points and the dual is a three-branch Fermat curve of genus $\( n - 1 \) \( n - 2 \) \/ 2$; $M_3$ is a point. For $m = 4 \, n = 2$, the dual has genus one and still has the full four-point cover variation. If $n = 2$ and $m$ is odd, the only candidate full-support tuple has odd coordinate sum, so only finite sources occur.
]

#heading(level: 1)[References]
#bibitem([1])[Y.~André, #link("https://www.numdam.org/article/CM_1992__82_1_1_0.pdf")[#emph[Mumford--Tate groups of mixed Hodge structures and the theorem of the fixed part]], Compositio Mathematica #strong[82] (1992), no.~1, 1--24.]
#bibitem([2])[N.~Aoki, #emph[A note on complete intersections of Fermat type], Commentarii Mathematici Universitatis Sancti Pauli #strong[35] (1986), 231--245. #link("https://rikkyo.repo.nii.ac.jp/records/10098")[Institutional record].]
#bibitem([3])[N.~Aoki, #emph[Some new algebraic cycles on Fermat varieties], Journal of the Mathematical Society of Japan #strong[39] (1987), 385--396. #link("https://doi.org/10.2969/jmsj/03930385")[doi:10.2969/jmsj/03930385].]
#bibitem([4])[E.~Cattani, P.~Deligne, and A.~Kaplan, #emph[On the locus of Hodge classes], preprint arXiv:alg-geom/9402009v1, 10 February 1994, #link("https://publications.ias.edu/sites/default/files/70_LocusHodgeClasses.pdf")[preprint PDF]. Published in Journal of the American Mathematical Society #strong[8] (1995), 483--506. #link("https://doi.org/10.1090/S0894-0347-1995-1273413-2")[doi:10.1090/S0894-0347-1995-1273413-2].]
#bibitem([5])[P.~Deligne, #link("https://doi.org/10.1007/BF02685881")[#emph[Théorie de Hodge, III]], Publications Mathématiques de l'IHÉS #strong[44] (1974), 5--77.]
#bibitem([6])[P.~Deligne and G.~D.~Mostow, #link("https://doi.org/10.1007/BF02831622")[#emph[Monodromy of hypergeometric functions and non-lattice integral monodromy]], Publications Mathématiques de l'IHÉS #strong[63] (1986), 5--89.]
#bibitem([7])[I.~Dolgachev and D.~Ortland, #emph[Point sets in projective spaces and theta functions], Astérisque #strong[165], Société mathématique de France, 1988. #link("https://www.numdam.org/item/AST_1988__165__1_0/")[Numdam record].]
#bibitem([8])[D.~Eisenbud and S.~Popescu, #emph[The projective geometry of the Gale transform], Journal of Algebra #strong[230] (2000), 127--173. #link("https://doi.org/10.1006/jabr.1999.7940")[doi:10.1006/jabr.1999.7940]\; #link("https://arxiv.org/pdf/math/9807127")[preprint arXiv:math/9807127].]
#bibitem([9])[P.~Etingof, #emph[Lie groups and Lie algebras], #link("https://arxiv.org/abs/2201.09397v4")[arXiv:2201.09397v4] (2024). Section locators refer to this version.]
#bibitem([10])[B.~Farb and D.~Margalit, #link("https://doi.org/10.1515/9781400839049")[#emph[A Primer on Mapping Class Groups]], Princeton Mathematical Series 49, Princeton University Press, 2012.]
#bibitem([11])[G.~González-Diez, R.~A.~Hidalgo, and M.~Leyton, #emph[Generalized Fermat curves], Journal of Algebra #strong[321] (2009), 1643--1660. #link("https://doi.org/10.1016/j.jalgebra.2009.01.002")[doi:10.1016/j.jalgebra.2009.01.002]\; #link("https://verso.mat.uam.es/~gabino.gonzalez/GenFerCurves.pdf")[author proof].]
#bibitem([12])[P.~A.~Griffiths, #link("https://doi.org/10.2307/2373485")[#emph[Periods of integrals on algebraic manifolds, II: Local study of the period mapping]], American Journal of Mathematics #strong[90] (1968), no.~3, 805--865.]
#bibitem([13])[R.~A.~Hidalgo, A.~Kontogeorgis, M.~Leyton-Álvarez, and P.~Paramantzoglou, #emph[Automorphisms of generalized Fermat curves], Journal of Pure and Applied Algebra #strong[221] (2017), 2312--2337. #link("https://doi.org/10.1016/j.jpaa.2016.12.011")[doi:10.1016/j.jpaa.2016.12.011]\; #link("https://arxiv.org/pdf/1409.3063")[preprint arXiv:1409.3063].]
#bibitem([14])[A.~Landesman, D.~Litt, and W.~Sawin, #link("https://doi.org/10.2140/gt.2025.29.2733")[#emph[Big monodromy for higher Prym representations]], Geometry & Topology #strong[29] (2025), no.~5, 2733--2782. Theorem locators refer to #link("https://arxiv.org/abs/2401.13906v2")[arXiv:2401.13906v2].]
#bibitem([15])[J.~Milnor, #emph[Morse Theory], Annals of Mathematics Studies 51, Princeton University Press, 1963. #link("https://math.stanford.edu/~ralph/math215b/Milnor.pdf")[Public scan].]
#bibitem([16])[B.~Moonen, #emph[Special subvarieties arising from families of cyclic covers of the projective line], Documenta Mathematica #strong[15] (2010), 793--819. #link("https://doi.org/10.4171/DM/314")[doi:10.4171/DM/314]. Locators refer to #link("https://arxiv.org/pdf/1006.3400v2")[arXiv:1006.3400v2] (2010).]
#bibitem([17])[OpenAI, #emph[The rational Hodge conjecture for CM abelian varieties], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-rational-Hodge-conjecture-for-CM-abelian-varieties-September-30-2026/paper.pdf")[OAI:The-rational-Hodge-conjecture-for-CM-abelian-varieties-September-30-2026], 2026.]
#bibitem([18])[OpenAI, #emph[Weil classes and Hodge classes on abelian powers], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Weil-classes-and-Hodge-classes-on-abelian-powers-September-30-2026/paper.pdf")[OAI:Weil-classes-and-Hodge-classes-on-abelian-powers-September-30-2026], 2026.]
#bibitem([19])[J.~C.~Rohde, #emph[Cyclic coverings, Calabi--Yau manifolds and complex multiplication], Lecture Notes in Mathematics #strong[1975], Springer, Berlin, 2009. The preprint locator refers to #link("https://arxiv.org/pdf/0711.2195v4")[arXiv:0711.2195v4] (2008).]
#bibitem([20])[C.~Schoen, #emph[Hodge classes on self-products of a variety with an automorphism], Compositio Mathematica #strong[65] (1988), 3--32. #link("https://www.numdam.org/article/CM_1988__65_1_3_0.pdf")[Original article].]
#bibitem([21])[T.~Shioda and T.~Katsura, #emph[On Fermat varieties], Tohoku Mathematical Journal, Second Series #strong[31] (1979), 97--115. #link("https://doi.org/10.2748/tmj/1178229881")[doi:10.2748/tmj/1178229881].]
#bibitem([22])[T.~Terasoma, #emph[Complete intersections of hypersurfaces---the Fermat case and the quadric case], Japanese Journal of Mathematics, New Series #strong[14] (1988), 309--384. #link("https://doi.org/10.4099/math1924.14.309")[doi:10.4099/math1924.14.309].]


