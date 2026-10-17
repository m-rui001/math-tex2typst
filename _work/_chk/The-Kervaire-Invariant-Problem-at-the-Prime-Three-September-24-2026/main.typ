#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 72.3pt, y: 72.3pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true), leading: 0.75em)
#set heading(numbering: none)
#set math.equation(numbering: none)
#show heading: set text(size: 11.5pt)
#show heading.where(level: 1): set text(size: 13pt)
#show link: set text(fill: blue)

#let thm(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let prodef(head, body) = block(above: 0.6em, below: 0.6em, inset: (left: 0.5em), breakable: true)[#strong(head) #body]
#let proof(body) = block(above: 0.6em, below: 0.6em)[#emph([Proof.]) #body]
#let paperabstract(body) = block(inset: (left: 1.6em, right: 1.6em), above: 0.4em, below: 1.2em)[#align(center)[#strong[Abstract]] #body]
#let bibitem(num, body) = grid(columns: (2.6em, 1fr), gutter: 0.4em, num, body)
#let unconverted(lbl) = block(fill: rgb("#fff3cd"), inset: 4pt)[#text(fill: red, weight: "bold")[unconverted: #lbl]]

#align(center)[#text(size: 16pt, weight: "bold")[The Kervaire invariant problem at the prime three]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

The odd-primary Kervaire invariant problem asks which distinguished classes on the Adams two-line represent stable homotopy classes of spheres. Its strong form asks for representatives killed by the prime. These are different questions: permanence determines an associated-graded class, while the order of a representative also depends on an extension in actual homotopy. We solve both questions for the standard family at the prime three.

Write

$ E_2^(s \, t) = "Ext"_(cal(A)_3)^(s \, t) \( upright(bold(F))_3 \, upright(bold(F))_3 \) arrow.r.double \( pi_(t - s)^S \)_3^and \, #h(2em) b_j in E_2^(2 \, thin 4 dot.op 3^(j + 1)) quad \( j gt.eq 0 \) \, $

where $cal(A)_3$ is the mod-three Steenrod algebra and $b_j$ is the standard Kervaire class. The spectral-sequence and family conventions are those of [32] Theorems 2.1.1 and 3.4.4. Define

$ K & = { j gt.eq 0 : b_j upright(" survives nontrivially to ") E_oo } \,\
K_3 & = { j in K : upright("some class detected by ") b_j upright(" has additive order ") 3 } . $

The second definition concerns existence within a detection coset. It does not require every representative of that coset to have the same additive order.

#thm([Theorem 1.1.])[
  #emph[At the prime three, 
$ K = K_3 = { 0 \, 2 \, 3 } . $

 Thus the surviving classes occur in stems $10$, $106$, and $322$, and each admits an additive-order-three representative. The class $b_1$ and every $b_j$ with $j gt.eq 4$ fail to survive.]
] <thm:classification>

Positive stable stems are finite [32] Theorem 1.1.8. Consequently, the assertion is unchanged if the sphere is taken to be $3$-local instead of $3$-complete. We use the local sphere for the Moore-spectrum construction and complete coefficient rings for Morava $E$-theory. The problem here is the standard odd-primary Adams-family problem; the classical prime-two Kervaire invariant one problem has a different family and dimension convention.

=== 1.1 Unstable consequences <unstable-consequences>

Throughout this subsection all spaces, maps, fibres, and homotopy equivalences are localized at three. For $n gt.eq 1$, write $S^(2 n + 1) { 3 }$ for the homotopy fibre of the degree-three self-map of $S^(2 n + 1)$, and write $E^2 : S^(2 n - 1) arrow.r Omega^2 S^(2 n + 1)$ for the double suspension. In Amelotte’s notation, the Anick H-space $T^(2 n + 1) \( 3 \)$ fits into a fibration sequence

$ Omega^2 S^(2 n + 1) arrow.r^phi S^(2 n - 1) arrow.r T^(2 n + 1) \( 3 \) arrow.r Omega S^(2 n + 1) \, $

where $E^2 compose phi$ is homotopic to the third-power map on $Omega^2 S^(2 n + 1)$ [1] Section 1. Let $W_n$ be the homotopy fibre of $E^2$, and let $B W_n$ be Gray’s classifying space, so that $Omega B W_n tilde.eq W_n$.

#thm([Corollary 1.2.])[
  #emph[]
  + #emph[There are homotopy equivalences of H-spaces 
$ Omega S^163 { 3 } tilde.eq T^163 \( 3 \) times Omega T^487 \( 3 \) \, #h(2em) B W_81 tilde.eq Omega T^487 \( 3 \) . $

 Consequently, $W_81 tilde.eq Omega^2 T^487 \( 3 \)$.]
  + #emph[For every integer $n > 1$, the underlying space $Omega S^(2 n + 1) { 3 }$ has a nontrivial product decomposition if and only if $n in { 3 \, 27 \, 81 }$. For every other $n > 1$ it is mod-three atomic, hence indecomposable. Here a product is nontrivial when both factors are noncontractible.]
  + #emph[For every integer $n > 1$, the homotopy type $T^(2 n + 1) \( 3 \)$ admits a homotopy-associative H-space multiplication if and only if $n in { 3 \, 27 \, 81 }$. The multiplication on $T^163 \( 3 \)$ supplied by the displayed product is homotopy associative and homotopy commutative. For this multiplication, the third-power map on $T^163 \( 3 \)$ is null-homotopic, as is the third-power map on the loop H-space $Omega T^487 \( 3 \)$.]
] <intro:unstable-consequences>

#proof[
  For $n = 3^r$ with $r gt.eq 1$, the strong Kervaire condition in stem $4 n - 2$ asks for an order-three representative detected by $b_(r - 1)$; such a representative is Amelotte’s $theta_r$. This is the index change in Lemma 54. Theorem 1 therefore gives this condition exactly for $r = 1 \, 3 \, 4$, or $n = 3 \, 27 \, 81$. Amelotte’s Theorem 1.1 [1] supplies a nontrivial H-space product at each of these indices, with Anick dimensions $2 dot.op 3^r + 1$ and $2 dot.op 3^(r + 1) + 1$. At $r = 4$ these dimensions are $163$ and $487$, and the same theorem gives the displayed $B W_81$ equivalence. Looping that equivalence gives the assertion about $W_81$.
  In the $n > 1$ setting of Selick’s Theorem 3.3, his Corollary 3.4 [35] makes $Omega S^(2 n + 1) { 3 }$ mod-three atomic when the strong Kervaire condition in stem $4 n - 2$ fails; this includes every $n$ that is not a power of three. For the remaining powers, Theorem 1 excludes $r = 2$ and all $r gt.eq 5$. Atomicity excludes any product with two noncontractible factors, not only a product of the displayed Anick form; see [35] Definition 3.1 and its discussion. This proves (ii). Amelotte’s Theorem 1.4 and its proof [1] identify, for every $n > 1$, the existence of a homotopy-associative multiplication with the same order-three strong Kervaire condition in stem $4 n - 2$; its necessity also forces $n = 3^r$. This proves the classification in (iii).
  Finally, the proof of Amelotte’s Corollary 3.3 [1] uses that the loop H-space $Omega S^(2 n + 1) { 3 }$ is homotopy associative and homotopy commutative and has null third-power map. These properties pass to H-space retracts. Repeating that argument for the $r = 4$ product proves the stated commutativity and power-map assertions. The multiplication assertion is existential, and no conclusion about power maps or loop-space structures on other $B W_n$ is asserted at the remaining indices. ◻
]

=== 1.2 Prior work and the prime-three obstruction <prior-work-and-the-prime-three-obstruction>

The name reflects an analogy on the Adams two-line. Browder identified the classical framed Kervaire invariant one problem with the permanence of the squares $h_j^2$ [7] Theorem 7.1; at an odd prime, the distinguished classes $b_j$ are associated with Adem relations among reduced powers [31] Section 1. Toda proved the first exclusion in the odd-primary family: $b_1$ supports a nonzero differential at every odd prime [38].

The Adams–Novikov spectral sequence brings the formal-group structure of complex cobordism into the calculation of stable stems. Quillen identified its universal formal group and the $p$-typical Brown–Peterson summand [29]; the one- and two-line calculations of Miller, Ravenel, and Wilson then described the alpha and beta families and their images under Thom reduction [26]. Ravenel’s proof of odd-primary nonexistence uses Morava’s formal-group viewpoint and restriction to a cyclic subgroup of a stabilizer group. For every odd prime $p gt.eq 5$, it excludes all standard Kervaire classes $b_j$ with $j gt.eq 1$ [31] Theorem 17.

At three, the same conclusion fails. Toda’s classical fifth differential kills $beta_(3 \/ 3)$, but the next candidate encounters a different phenomenon: the fate of one Adams–Novikov beta representative need not determine the fate of its mod-three Adams image. The classical survivor in stem $106$ is detected by a corrected combination of $beta_(9 \/ 9)$ and $beta_7$, although $beta_(9 \/ 9)$ itself supports a differential. This distinction is already present in Ravenel’s discussion of the prime-three case [31]; see also [32] Theorem 3.4.4(c) and the discussion after Proposition 6.4.11. We use the beta-family and Thom-reduction calculations of Miller–Ravenel–Wilson [26] Theorems 2.2, 2.6, and 9.4, together with the classical fifth and ninth differentials in the form recorded by Belmont–Shimomura [5] Lemma 2.5. Our detection argument retains every two-line preimage of the Adams class, including these corrections.

The order refinement has its own geometric meaning. Selick’s strong odd-primary criterion identifies an order-$p$ Kervaire representative with a stable Moore-to-sphere map whose cone has a specified nonzero primary reduced power [35]. Amelotte relates this criterion to product decompositions of looped degree-$p$ sphere fibres and records the order-three representative in stem $106$ [1] Theorem 1.1 and the proof of Corollary 1.2. His class $theta_r$ is detected by $b_(r - 1)$; thus $b_2$ here corresponds to $theta_3$, and the new $b_3$ class corresponds to $theta_4$. In the positive branch of our proof, the Moore cofibre sequence is retained through the final correction, so it supplies the additive order in actual sphere homotopy.

An antecedent for the subgroup calculation appears in Hill’s report on joint work with Hopkins and Ravenel [14] Conjecture 1 and Propositions 2–3. Assuming Hopkins’s coefficient-action conjecture, that report sketches the $C_p$ homotopy fixed point calculation at heights $\( p - 1 \) f$ for $f gt.eq 1$, using formal-module deformations and norm classes. Section 4 establishes the finite-page statements needed here from the completed coefficient model, fixed geometry, and Euler bound proved in the preceding sections.

Hill, Hopkins, and Ravenel proposed using the action of $C_9$ on height-six Morava $E$-theory at three [15]. Their published norm and geometric-fixed-point machinery [16] supplies tools for this approach, separately from its prime-two application. Subsequent odd-primary developments include the $mu_p$ orientations at height $p - 1$ of Hahn–Senger–Wilson [13], and the combination of skeletal Borel and Adams–Novikov filtrations in Angelini-Knoll–Behrens–Belmont–Kong [2]. These provide context for the equivariant and filtered methods; neither gives a height-six prime-three classification.

For the height-six action itself, Belmont–Ray prove detection [4] Proposition 0.2 and, assuming an explicit coefficient-action model, calculate the relevant positive-degree group cohomology [4] Theorem 0.6. Their detection follows the cyclotomic formal-module evaluation in the proposed Hill–Hopkins–Ravenel program. We use that mechanism with an integral target and a finite-layer argument for the image of an actual sphere class. Section 3 proves the specific completed coefficient model proposed in [4] Conjecture 0.3, including the nonreduced fixed geometry needed for the differential constraints.

The proposed route also included $972$-periodicity and a literal vanishing assertion in degree $- 2$ [4] Conjecture 0.1. The latter assertion is false. Proposition 13 proves that an additive semilinear trace lifts through the actual homotopy transfer to an infinite-order element of $pi_(2 n) \( E_6^(h C_9) \)$ for every integer $n$. This refutes the full-gap clause of that conjecture. It leaves the separate periodicity and torsion questions untouched. Theorem 1 instead uses finite-page outgoing differentials and requires neither of those assertions.

=== 1.3 Ideas and proof structure <ideas-and-proof-structure>

The proof has two independent branches beyond the classical endpoints. One excludes all indices at least four by examining their images in the height-six detector. The other constructs the stem-$322$ class, starting from the known order-three class in stem $106$.

For the first branch, let $E = E_6$ be height-six Morava $E$-theory, let $G = C_9$ be its chosen stabilizer subgroup, and let $H = C_3 subset G$. Section 2 first proves that an actual sphere class detected by $b_j$, $j gt.eq 2$, has a nonzero finite-order image in $E^(h G)$. It also uses a coefficient of a strict coordinate change, a genuine equivariant norm, and geometric fixed points to prove finite Euler-class bounds for both groups. These give deadlines by which the unit must be hit in the Euler-localized spectral sequences. No infinite Tate convergence assertion is needed.

The coefficient geometry makes those deadlines effective. Section 3 constructs an actual trace-zero period whose $G$-orbit presents the complete coefficient ring. The fixed deformation problem is a strict formal-module problem. Its Hasse sections, centralizer action, and determinant character constrain equivariant maps between the scalar and exterior parts of coefficient cohomology. These constraints exclude maps that could otherwise occur as differentials. Section 4 combines those restrictions with classical differentials and the finite Euler bound to force the needed $H$-differentials. Section 5 then retains the integral restriction kernels while passing to $G$.

The final exclusion depends on the direction of a differential. An actual sphere class can acquire an incoming differential after passage from ordinary homotopy fixed points to Tate localization. Vanishing of the localized pages alone would therefore not exclude it. We show instead that the detector for every $j gt.eq 4$ must support a nonzero outgoing differential. A finite array of one-dimensional groups records all remaining degree- and character-compatible differentials. Its translation units are proved to survive before they are used. The known $b_2$ survivor fixes an incoming pairing in this array; that pairing forces an outgoing differential on the entire lattice containing the higher detectors.

The positive branch adapts Toda’s cone construction for extended powers [37] Section 1, Theorem 2, within the broader framework of primary operations developed by May [24] Sections 2–3, and uses Selick’s primary-operation criterion. Section 6 forms a truncated extended cube of a Moore-spectrum map representing the order-three stem-$106$ class. The cube maps into a four-cell spectrum $T$ containing the Moore spectrum $M = S \/ 3$, with quotient $Sigma^4 M$, and has a nonzero $cal(P)^81$ in its cone. Vanishing of two obstruction components produces a map of Adams–Novikov filtration at least two with the same image in that quotient. Subtracting it gives a map that lifts to $M$ and preserves the primary operation. The remaining actual Moore boundary is the required sphere element killed by three.

Section 7 supplies precisely the finite Adams–Novikov information needed for those corrections. It proves a cubic boundary, a zero multiplication map on the sixth page, and vanishing on the tenth page in the higher obstruction filtrations. The fifth differential is constrained by affine linear equations, then by linear consequences of its square-zero identity. Universal kernel and image bounds apply to every differential satisfying those necessary conditions; the argument does not select an unproved differential from that family. A weight estimate covers every remaining higher filtration. Appendix 8 gives the integral structure formulas, terminating resolution, cobar comparison, signed products, and elimination procedures defining all finite tables.

=== 1.4 Reduction to the main arguments <reduction-to-the-main-arguments>

We record the classical endpoints, including the order convention, before organizing the remaining proof.

#thm([Lemma 1.3.])[
  #emph[One has $0 \, 2 in K_3$ and $1 in.not K$.]
] <intro:classical>

#proof[
  The class $beta_1 in pi_10^S$ has order three and is detected by $b_0$. The classical stem-$106$ Kervaire element has an order-three representative detected by $b_2$; see [32] Theorem 3.4.4(c), discussion after Proposition 6.4.11, and Table A3.4 and [1] Theorem 1.1 and Corollary 1.2. This is the surviving corrected beta combination, not an assertion of survival for $beta_(9 \/ 9)$ alone.
  If $b_1$ survived, Lemma 4 would give a permanent Adams–Novikov two-line class in internal degree $36$ with that Thom reduction. The Miller–Ravenel–Wilson two-line calculation [26] Theorem 2.6 identifies this group with the order-three group generated by $beta_(3 \/ 3)$; see also [32] Lemma 6.4.12(i). The classical Toda differential
  $ d_5 \( beta_(3 \/ 3) \) = plus.minus alpha_1 beta_1^3 eq.not 0 $
  excludes such a permanent class; see [5] Lemma 2.5. ◻
]

#proof[
  Lemma 3 settles the indices $0$, $1$, and $2$. Theorem 36, proved in Section 5, excludes every index $j gt.eq 4$. Theorem 53, proved in Section 6 using the finite algebra of Section 7, constructs an exact-order-three representative detected by $b_3$. These assertions exhaust all nonnegative indices. Since $K_3 subset.eq K$ by definition, both sets are as stated. ◻
]

=== 1.5 Conventions and organization <conventions-and-organization>

Spectral-sequence degrees are written $\( s \, t \)$, with differentials of degree $\( r \, r - 1 \)$, unless a rescaled weight is explicitly introduced. All homotopy-theoretic constructions are at the prime three. The word “Tate” refers to Euler localization; it does not mean rationalization. We distinguish the algebraic spectral sequences used to calculate group cohomology from the topological spectral sequences whose differentials constrain homotopy.

Sections 2–5 use $G = C_9$ and its subgroup $H = C_3$. Section 6 begins the independent stable Moore-spectrum argument. Section 7 resets the algebraic notation and uses $\( f \, d \) = \( s \, t \/ 4 \)$. Every invocation of a Laurent generator as a translation is restricted to pages on which it and its inverse are cycles.

== 2 The detector and a finite Euler bound <sec:detector>

This section establishes the detection statement needed for the tail argument. Its conclusion concerns actual sphere classes, including their finite additive order. We also prove a bound on the length of the Euler-localized homotopy fixed point spectral sequences. Neither argument requires an explicit presentation of the stabilizer action on the deformation parameters.

=== 2.1 The action and grading conventions <the-action-and-grading-conventions>

Let $k = upright(bold(F))_(3^6)$, and let $E = E_6$ be Morava $E$-theory for the Honda formal group of height six over $k$, with its coherent stabilizer action. We use the standard Lubin–Tate and Goerss–Hopkins–Miller constructions; see [22,11]. Write

$ "(2.1)" quad E_(*) = R \[ u^(plus.minus 1) \] \, #h(2em) R = W \( k \) \[ \[ u_1 \, dots.h \, u_5 \] \] \, #h(2em) \| u \| = - 2 \, #h(2em) frak(m) = \( 3 \, u_1 \, dots.h \, u_5 \) . $ <det:coefficients>

The cotangent line of the universal formal group is $E_2$: it is obtained by restricting the augmentation ideal of $E^0 \( upright(bold(C P))^oo \)$ to $upright(bold(C P))^1$. Its dual, the Lie line, is therefore $E_(- 2)$. The choice of $u$ trivializes this line nonequivariantly.

The height classification and stabilizer description originate in the work of Lazard, Dieudonné, Honda, and Lubin; see [20] Theorem IV and [17] Theorem 1. We use the finite-field presentation in [32] Appendix A2.2.12 and A2.2.17–18. Let $D$ be the central division algebra over $upright(bold(Q))_3$ of invariant $1 \/ 6$, with maximal order

$ cal(O)_D = W \( k \) chevron.l S chevron.r \/ \( S^6 = 3 \, #h(0em) S a = a^phi S \) \, $

where $phi$ is Witt Frobenius. Passing to the opposite algebra, if required by the action convention, changes none of the arguments below. Normalize its valuation by $v_S \( S \) = 1$. The degree-six extension $upright(bold(Q))_3 \( zeta_9 \)$ splits $D$ and embeds as a maximal subfield. Its ring of integers embeds in $cal(O)_D$. For the splitting criterion, centralizer dimensions, and Skolem–Noether conjugacy used here and below, see [27] Chapter IV, Theorems 2.10 and 3.1, Corollary 3.7, and Remark 4.4(c). We fix the resulting subgroups

$ "(2.2)" quad G = chevron.l g chevron.r tilde.equiv C_9 \, #h(2em) H = chevron.l sigma chevron.r tilde.equiv C_3 \, #h(2em) sigma = g^3 . $ <det:groups>

The cyclotomic uniformizer gives

$ "(2.3)" quad v_S \( g - 1 \) = 1 \, #h(2em) v_S \( sigma - 1 \) = 3 . $ <det:valuations>

For example, if $pi = g - 1$, then $sigma - 1 = 3 pi + 3 pi^2 + pi^3$, whose last term has strictly smallest $S$-valuation. These are subgroups of the nonextended stabilizer: their actions on $R$ fix $W \( k \)$.

Choose a homotopy multiplicative, unital $3$-typical complex orientation, normalized to the Honda coordinate on the special fibre. For $1 lt.eq i lt.eq 5$, the elements

$ u_i = v_i u^(3^i - 1) $

give deformation parameters. We use Hazewinkel generators when an integral cobar calculation is required. With right-unit conventions, the first strict coordinate-change coefficients satisfy

$ "(2.4)" quad eta_R \( v_1 \) = v_1 + 3 t_1 \, #h(2em) eta_R \( v_2 \) equiv v_2 + v_1 t_1^3 - v_1^3 t_1 med \( mod med 3 \) . $ <det:right-units>

In particular, $t_1$, of internal degree $4$, is a one-cocycle. Evaluation of the cobar complex on the action uses these strict changes of the chosen graded coordinate.

All cohomological spectral sequences have bidegrees $\( s \, t \)$, with

$ d_r : E_r^(s \, t) arrow.r E_r^(s + r \, t + r - 1) . $

Thus $t - s$ is the homotopy degree. Representation suspensions will be specified separately below.

=== 2.2 Comparison of filtrations <comparison-of-filtrations>

Write

$ cal(N)_2^(s \, t) = "Ext"_(upright(B P)_(*) upright(B P))^(s \, t) \( upright(B P)_(*) \, upright(B P)_(*) \) $

for the ordinary $3$-local Adams–Novikov $E_2$-term. The Thom reduction is denoted

$ Phi : cal(N)_2^(s \, t) arrow.r "Ext"_(cal(A)_3)^(s \, t) \( upright(bold(F))_3 \, upright(bold(F))_3 \) . $

#thm([Lemma 2.1.])[
  (Comparison).  #emph[There are augmented comparisons from the ordinary Adams–Novikov spectral sequence to the mod-$3$ Adams spectral sequence and to the homotopy fixed point spectral sequences for $E^(h G)$ and $E^(h H)$. If a sphere class $alpha$ is detected by $b_j$, then $alpha$ has Adams–Novikov filtration exactly two. It admits a permanent representative 
$ x in cal(N)_2^(2 \, thin 4 dot.op 3^(j + 1)) \, #h(2em) Phi \( x \) in upright(bold(F))_3^times b_j . $

]
] <det:filtration-comparison>

#proof[
  The unit-preserving map $upright(B P) arrow.r H upright(bold(F))_3$ induces a map between the unit fibres and their smash powers. Consequently the filtrations on sphere homotopy satisfy
  $ "(2.5)" quad F_(upright(A N))^s pi_(*) S subset.eq F_(upright(A d a m s))^s pi_(*) S . $ <det:filtration-inclusion>
  In particular, a class of Adams filtration exactly two has Adams–Novikov filtration at most two. The connective Adams–Novikov spectral sequence converges to $3$-local sphere homotopy [32] Theorems 2.2.3 and 2.2.13–14; see also [26] p. 475, after Equation (1.10). These positive stable stems are finite, so their $3$-local and $3$-complete groups agree. Its $E_2$-term has internal degree divisible by $4$. In the stem $4 dot.op 3^(j + 1) - 2$, filtration zero or one is therefore impossible. Thus the filtration is exactly two. The induced map on $E_2$ is Thom reduction. There is no incoming Adams differential in the bidegree of $b_j$: the potential length-two source has filtration zero and positive odd internal degree, and longer sources have negative filtration. The associated-graded image of the chosen class consequently gives the asserted nonzero multiple of $b_j$.
  For completeness, the comparison with group cochains can be constructed without requiring an equivariant chosen orientation. Use the semicosimplicial Amitsur object with level $upright(M U)_(\( 3 \))^(and \( s + 1 \))$. For $K = G$ or $H$, apply the translated orientation to the $ell$-th factor at $g_ell$, and multiply in $E$:
  $ "(2.6)" quad \( a_0 \, dots.h \, a_s \) mapsto #scale(x: 120%, y: 120%)[\[] \( g_0 \, dots.h \, g_s \) mapsto product_(ell = 0)^s g_ell f \( a_ell \) #scale(x: 120%, y: 120%)[\]] . $ <det:homogeneous-comparison>
  The target is the spectrum of equivariant homogeneous group cochains. Deleting a group entry corresponds to inserting the unit in the indicated source factor. The orientation is a map under the unit; its translates form a coherent family under that unit. Their exterior powers, followed by the coherent commutative multiplication in $E$, thus make (2.6) compatible with all cofaces and with the augmentation from the sphere. Only unit insertions occur here, so no $E_oo$ refinement of the orientation is required.
  Forgetting degeneracies gives the unnormalized rather than the normalized cochain complex; the degenerate subcomplex is contractible. It therefore leaves the comparison unchanged from $E_2$ onward. The finite-stage comparison also respects actual filtration-two lifts. The ordinary totalization tower maps under the augmentation to its fat tower. In the target, $s^0 : C^1 arrow.r C^0$ has section $d^0$, and $d^1 - d^0$ lands in $N^1 = ker s^0$. Hence
  $ "Tot"_1^(upright(f a t)) C^bullet tilde.eq "Tot"_1 C^bullet xor Omega C^0 \, $
  with an augmentation-compatible projection onto the first summand. Composing the fat group-cochain comparison with this projection therefore gives an actual ordinary filtration-two lift, whose $H^2$-symbol is the normalized comparison class. Quillen’s $3$-typical splitting [29] Theorems 4–5 identifies the $upright(M U)_(\( 3 \))$ and $upright(B P)$ descriptions of the ordinary Adams–Novikov spectral sequence. On the $upright(B P)$ cobar, the comparison is precisely substitution of the chosen coordinates and their strict coordinate changes. The augmentations ensure that it sends actual filtered sphere classes to the corresponding filtered homotopy fixed point classes. ◻
]

=== 2.3 The Adams–Novikov two-line in the detector degree <the-adamsnovikov-two-line-in-the-detector-degree>

Let $delta_3$ denote the integral connecting homomorphism for multiplication by $3$, and let $delta_(v_1^d)$ denote the connecting homomorphism over $upright(B P)_(*) \/ 3$ for multiplication by $v_1^d$. In the following lemma the prime indicates an uncorrected representative; it does not assert an identification with every conventional choice of a Greek-letter generator.

#thm([Lemma 2.2.])[
  #emph[Fix $j gt.eq 0$. For 
$ n in { j \, j - 2 \, dots.h \, j med mod med 2 } \, #h(2em) d = 3^n \, #h(2em) L = frac(3^(j + 1 - n) + 1, 4) \, $

 the classes 
$ "(2.7)" quad beta'_(L d \/ d) = delta_3 delta_(v_1^d) \( v_2^(L d) \) $ <det:uncorrected-beta>

 form an $upright(bold(F))_3$-basis of $cal(N)_2^(2 \, thin 4 dot.op 3^(j + 1))$. Every member with $L > 1$ has zero Thom image.]
] <det:two-line-basis>

#proof[
  The two-line theorem of Miller–Ravenel–Wilson [26] Theorem 2.6, also stated in [32] Corollary 5.4.5(a), describes a direct sum of cyclic groups with parameters $m = L 3^n$, $3 divides.not L$, denominator $v_1^d$, and order $3^(i + 1)$. The internal degree is $4 \( 4 m - d \)$. Its restrictions include
  $ 0 lt.eq i lt.eq n \, #h(2em) 1 lt.eq d lt.eq a_(n - i) \, #h(2em) a_0 = 1 \, #h(2em) a_r = 3^r + 3^(r - 1) - 1 quad \( r gt.eq 1 \) . $
  In particular $d < 2 dot.op 3^n$. In the desired degree the equation is
  $ 4 L 3^n - d = 3^(j + 1) . $
  If $n gt.eq j + 1$, it gives $d gt.eq 3 dot.op 3^n$, a contradiction. For $n lt.eq j$, division by $3^n$ shows that the positive integer $4 L - 3^(j + 1 - n)$ is less than $2$, hence is $1$. Thus $d = 3^n$, $L$ has the displayed value, and integrality forces $n equiv j med \( mod med 2 \)$. For $n = 0$, the bound $i lt.eq n$ gives $i = 0$; for $n gt.eq 1$, the inequality $a_(n - 1) < 3^n$ again forces $i = 0$. This bounds the dimension by the number of classes in (2.7), and shows that the group has exponent $3$. The remaining index restrictions are satisfied by all these candidates: $3^i divides d$ is automatic, the special bound $d lt.eq 3^n$ when $L = 1$ is an equality, and maximality of $i$ follows from $a_(n - 1) < 3^n$ for $n gt.eq 1$, while $3 divides.not d$ when $n = 0$.
  We next prove independence of these uncorrected classes. Equation (2.4) and the Frobenius identity in characteristic $3$ show that $v_2^(L d)$ is primitive modulo $\( 3 \, v_1^d \)$, so its inner connecting class
  $ c_n = delta_(v_1^d) \( v_2^(L d) \) in "Ext"_(upright(B P)_(*) upright(B P))^(1 \, thin 4 dot.op 3^(j + 1)) \( upright(B P)_(*) \, upright(B P)_(*) \/ 3 \) $
  is defined. Its exact $v_1$-annihilator exponent is $d$. Indeed $v_1^d c_n = 0$, whereas the connecting-sequence comparison gives
  $ v_1^(d - 1) c_n = delta_(v_1) \( v_2^(L d) \) eq.not 0 . $
  For the last assertion, the primitives of $upright(B P)_(*) \/ 3$ are $upright(bold(F))_3 \[ v_1 \]$. One can see this directly: if a primitive polynomial depends on a highest variable $v_s$, $s gt.eq 2$, set all positive $t_i$ except $t_(s - 1)$ to zero. The lower $v_i$ are fixed, while the right unit sends
  $ v_s mapsto v_s + v_1 t_(s - 1)^3 - v_1^(3^(s - 1)) t_(s - 1) . $
  Comparing the highest power of $t_(s - 1)$ in a polynomial depending nontrivially on $v_s$ contradicts invariance. The image of the primitives in $upright(B P)_(*) \/ \( 3 \, v_1 \)$ is therefore constant, and does not contain $v_2^(L d)$. This proves the nonzero connecting class. Since the $d$’s are distinct, multiplication by $v_1^(d_max - 1)$ in a proposed relation isolates its largest-exponent summand. Hence the $c_n$’s are independent.
  It remains to exclude relations created by $delta_3$. Set $N = 3^(j + 1)$. The integral alpha-line calculation [26] Theorem 2.2 says that the image of integral $"Ext"^1$ in this internal degree is spanned, after reduction modulo $3$, by
  $ "(2.8)" quad v_1^(N - 1) t_1 . $ <det:alpha-reduction>
  Explicitly, an integral representative is the differential of $v_1^N$ divided by $3^(1 + nu_3 \( N \))$. Expanding $\( v_1 + 3 t_1 \)^N - v_1^N$, its linear term reduces to (2.8); its $k$-th term for $k gt.eq 2$ has $3$-adic valuation $k - 1 - nu_3 \( k \) > 0$. The class (2.8) is not $v_1$-torsion. Evaluate it on the height-one Honda formal group in characteristic $3$ at the strict automorphism $1 + 3$. The coefficient $v_1$ is then invertible, the coefficient action is trivial, and the first strict coefficient is nonzero. Evaluation of a one-coboundary at that automorphism is zero, whereas every $v_1$-multiple of (2.8) evaluates nontrivially. The kernel of $delta_3$ consequently meets the $v_1$-torsion span of the $c_n$’s trivially. Their images are independent and attain the previously established dimension bound.
  To compute the Thom image, put $I = \( 3 \, v_1 \, v_2 \, dots.h \)$ in the left coefficient ring of the cobar complex. Modulo $3$, write
  $ A_1 = t_1^3 - v_1^2 t_1 \, #h(2em) c_n = frac(\( v_2^d + v_1^d A_1^d \)^L - v_2^(L d), v_1^d) . $
  Every term of this polynomial has at least $\( L - 1 \) d$ positive coefficient factors. It therefore admits an integral lift in $I^(\( L - 1 \) d)$. The ideal $I$ is invariant, so the cobar differential preserves its powers. Moreover, on each free left coefficient module,
  $ \( I^q : 3 \) = I^(q - 1) #h(2em) \( q gt.eq 1 \) \; $
  this follows, for example, because the initial form of $3$ is a non-zero-divisor in the $I$-graded polynomial ring. The integral differential of the lift is divisible by $3$; after division it still lies in $I^(\( L - 1 \) d - 1)$. When $L > 1$, we have $\( L - 1 \) d gt.eq 2$, so reduction of this representative under Thom reduction is zero. ◻
]

#prodef([Remark 2.3.])[
  The degree calculation uses the restrictions in the full two-line theorem, while the independence argument provides the specified uncorrected basis. Thus correction terms in the Miller–Ravenel–Wilson representatives have not been suppressed. For example, the two basis directions in the degree of $b_2$ are the uncorrected classes $beta'_(9 \/ 9)$ and $beta'_7$; a permanent combination need not be the conventional $beta_(9 \/ 9)$ alone.
] <det:corrected-beta>

=== 2.4 Integral CM detection and the actual image <integral-cm-detection-and-the-actual-image>

#thm([Lemma 2.4.])[
  (Integral CM evaluation).  #emph[For $j gt.eq 2$, every 
$ x in cal(N)_2^(2 \, thin 4 dot.op 3^(j + 1)) quad upright("with") quad Phi \( x \) in upright(bold(F))_3^times b_j $

 has nonzero image in $H^2 \( G \; E_(4 dot.op 3^(j + 1)) \)$.]
] <det:cm-evaluation>

#proof[
  We use a fixed Lubin–Tate deformation to evaluate the comparison of Lemma 4. Let $zeta$ be a primitive ninth root of unity, and let $cal(O) = W \( k \) \[ zeta \]$, allowing a residue extension if necessary. The Lubin–Tate construction for $upright(bold(Z))_3 \[ zeta \]$ [21] Theorem 1 gives a height-one formal $upright(bold(Z))_3 \[ zeta \]$-module over $cal(O)$. Its underlying special fibre has height six. After residue extension it can be identified with the chosen Honda formal group. The embedding of $upright(bold(Q))_3 \( zeta \)$ in its rational endomorphism algebra is conjugate to our chosen embedding by Skolem–Noether. The conjugator can be made a unit: multiply it by an element of the centralizing cyclotomic field whose $S$-valuation cancels its own, using $v_S \( zeta - 1 \) = 1$. This gives a framing identifying the ninth-root action with $G$.
  We obtain a $G$-equivariant evaluation of graded coefficient rings
  $ E_(*) arrow.r cal(O) \[ w^(plus.minus 1) \] \, #h(2em) \| w \| = - 2 . $
  The group fixes $cal(O)$, and acts on $w$ by $zeta$ or its inverse, according to the action convention. The elements $v_1 \, v_2$ have zero residue modulo $pi = zeta - 1$. By (2.3), the first strict coefficient $t_1 \( g \)$ has nonzero residue. The latter statement concerns the strict coordinate change after grading: its residual automorphism has linear coefficient $1$, and $g - 1$ first occurs at the third power of the coordinate.
  Put $T = 4 dot.op 3^(j + 1)$. The degree-$T$ line has character $zeta^(plus.minus 2 dot.op 3^(j + 1)) = 1$, hence trivial $G$-action. After trivializing this line, the periodic cyclic cochain complex is
  $ cal(O) arrow.r^0 cal(O) arrow.r^9 cal(O) arrow.r^0 cal(O) arrow.r^9 dots.h.c . $
  Its reduction modulo $3$ has zero differentials. The connecting homomorphism for multiplication by $3$ is therefore
  $ "(2.9)" quad delta_3 : H^1 \( G \; cal(O) \/ 3 \) arrow.r H^2 \( G \; cal(O) \) \, #h(2em) macron(c) mapsto 3 c med \( mod med 9 \) . $ <det:integral-bockstein>
  This formula follows by lifting the one-cochain $c$, taking its differential $9 c$, and dividing by $3$. The inner connecting homomorphism $delta_(v_1^d)$ is formed in the $upright(B P)$ cobar complex before evaluation. We evaluate its already formed polynomial one-cocycle; we do not form a connecting homomorphism for multiplication by the evaluated $v_1^d$ on $cal(O) \/ 3$. The comparison from the bar resolution to the cyclic resolution evaluates a one-cocycle at $g$, so it computes the image of the inner connecting class in (2.7).
  Express $x$ in the basis of Lemma 5. Every summand with $L > 1$ has zero Thom image; therefore the coefficient of the $n = j \, L = 1$ summand is nonzero. The residue of the inner cocycle at $g$ is
  $ L thin v_2^(\( L - 1 \) d) t_1 \( g \)^(3 d) . $
  For $L > 1$ it is zero, whereas for $L = 1$ it is a unit. Thus the inner cocycle of the entire combination evaluates to an element $c in cal(O) \/ 3$ with unit residue. Equation (2.9) sends it to $3 c eq.not 0$ in $cal(O) \/ 9$. The integral coefficient modules and their cochain complexes are $3$-torsion-free, so evaluation commutes with the outer connecting homomorphism $delta_3$. This naturality proves nonvanishing in $H^2 \( G \; E_T \)$. ◻
]

#prodef([Remark 2.5.])[
  This is the CM detection mechanism used in [4] Section 6, with the integral target retained. The further reduction $cal(O) \/ 9 arrow.r cal(O) \/ 3$ kills $3 c$. Consequently one must test nonvanishing in $H^2 \( G \; cal(O) \)$ before making that reduction. No coefficient-action presentation is used in Lemma 7.
] <det:integral-target>

#thm([Lemma 2.6.])[
  (A filtration-two symbol detects its lift).  #emph[Let a finite group $J$ act on an even spectrum $Z$, and put $Y = Z^(h J)$. Let $F^s = "fib" \( Y arrow.r "Tot"_(s - 1) C^bullet \)$ be the decreasing tower of its group-cochain resolution. If a class in $pi_(T - 2) F^2$, with $T$ even, has nonzero symbol in $H^2 \( J \; pi_T Z \)$, its image in $pi_(T - 2) Y$ is nonzero.]
] <det:two-layer>

#proof[
  If the image were zero, the class would lie in the image of $pi_(T - 1) \( Y \/ F^2 \)$, and $Y \/ F^2 tilde.eq "Tot"_1 C^bullet$. In the fibre sequence
  $ Omega N^1 C^bullet arrow.r "Tot"_1 C^bullet arrow.r C^0 \, $
  the degree-$\( T - 1 \)$ group of $C^0$ vanishes by evenness. Every such element therefore comes from $pi_T N^1 C^bullet$. Its boundary in the second layer is the cochain differential from degree one to degree two. The given symbol would thus be a $d_1$-boundary, contrary to its nonzero class in $H^2$. Equivalently, after $E_2$ the only possible ordinary incoming differential has length two and starts in odd internal degree; larger incoming lengths start in negative filtration. The finite two-layer argument proves the assertion directly, without a convergence assertion for any localized tower. ◻
]

#thm([Theorem 2.7.])[
  (Detection of actual sphere classes).  #emph[Let $j gt.eq 2$, and let $alpha in pi_(4 dot.op 3^(j + 1) - 2) S_(\( 3 \))$ be detected by $b_j$ in the mod-$3$ Adams spectral sequence. Its image under the unit 
$ pi_(4 dot.op 3^(j + 1) - 2) S_(\( 3 \)) arrow.r pi_(4 dot.op 3^(j + 1) - 2) \( E^(h G) \) $

 is nonzero and has finite additive order. Its filtration-two symbol is the nonzero image of the Adams–Novikov representative in Lemma 4.]
] <det:actual-detector>

#proof[
  Choose the actual Adams–Novikov filtration-two lift of $alpha$ given by Lemma 4. The augmented comparison sends it to a class in $pi_(4 dot.op 3^(j + 1) - 2) F^2$. Its symbol is nonzero by Lemma 7. Lemma 9 proves that its image in $E^(h G)$ is nonzero. Finally, a positive stable sphere stem is finite, and a homomorphism preserves finite additive order. ◻
]

=== 2.5 The full-gap assertion and its torsion-free repair <the-full-gap-assertion-and-its-torsion-free-repair>

The detection theorem produces a nonzero finite-order image from a sphere class detected by $b_j$, $j gt.eq 2$. The proposed full gap in degree minus two cannot hold: we now construct infinite-order classes in every even degree. Under the proposed $972$-periodicity, however, torsion-freeness in degree minus two would still exclude the higher detectors. We prove the full-gap failure using independence of field automorphisms and the additive transfer, retaining the actual homotopy class supplied by the transfer rather than only an invariant coefficient.

#thm([Lemma 2.8.])[
  (Semilinear trace).  #emph[Let a finite group $J$ act on a characteristic-zero domain $A$ and semilinearly on a free rank-one module $A e$. Suppose the kernel of $J arrow.r "Aut" \( A \)$ acts trivially on $A e$. Then the additive trace 
$ "Tr"_J : A e arrow.r \( A e \)^J \, #h(2em) z mapsto sum_(gamma in J) gamma z $

 is nonzero.]
] <det:semilinear-trace>

#proof[
  Put $F = "Frac" \( A \)$, let $alpha_1 \, dots.h \, alpha_m$ be the distinct automorphisms of $F$ induced by $J$, and choose representatives $gamma_i$. Write $gamma_i \( e \) = c_i e$, where $c_i in A^times$, and let $h$ be the order of the kernel. On $F e$ the trace is
  $ f e mapsto h sum_(i = 1)^m c_i alpha_i \( f \) e . $
  Distinct field automorphisms are linearly independent over $F$. Indeed, from a nonzero relation with the fewest terms, evaluating at $a f$ and subtracting $alpha_m \( a \)$ times the relation at $f$ removes its last term. Choosing $a$ on which another $alpha_i$ differs from $alpha_m$ gives a shorter nonzero relation, a contradiction. Since $h c_i eq.not 0$, the displayed trace is nonzero.
  Choose $f in F$ on which it is nonzero, and write $f = a \/ b$. The nonzero invariant $product_(gamma in J) gamma \( b \)$ clears the denominator of $f$. Multiplication by this invariant commutes with the trace, and therefore gives a nonzero trace of an element of $A e$. ◻
]

#thm([Lemma 2.9.])[
  (Homotopy transfer).  #emph[Let a finite group $J$ act coherently on a spectrum $Z$. For every integer $d$, the additive trace on $pi_d Z$ factors as 
$ pi_d Z arrow.r pi_d \( Z^(h J) \) arrow.r pi_d Z . $

]
] <det:homotopy-transfer>

#proof[
  Work in the category of spectra with coherent $J$-action. Induction and coinduction from the trivial subgroup agree: their underlying objects are the finite coproduct and finite product of $\| J \|$ copies of a spectrum, which agree naturally in a stable category. A map $f : S^d arrow.r Z$ therefore gives a composite
  $ "triv" \( S^d \) arrow.r^(upright(d i a g)) "coInd"_e^J S^d tilde.eq "Ind"_e^J S^d arrow.r Z . $
  The last map is adjoint to $f$; on the summand indexed by $gamma$, it is $gamma f$. The underlying composite is consequently $sum_(gamma in J) gamma f$. Maps from a trivial-action sphere to $Z$ are maps from that sphere to $Z^(h J)$, proving the assertion. For a finite group the continuous cochain construction gives the same homotopy limit. ◻
]

#thm([Proposition 2.10.])[
  #emph[For every $n in upright(bold(Z))$, the group $pi_(- 2 n) \( E^(h G) \)$ contains an element of infinite additive order. In particular, $pi_(- 2) \( E^(h G) \) eq.not 0$.]
] <det:full-gap>

#proof[
  Each $R u^n$ is a semilinear $R$-line. We check the kernel hypothesis in Lemma 11. There is no nontrivial ninth root of unity in $W \( k \)$. To see this first for a cube root, its residue is $1$, so write it as $1 + 3 c$. The equation
  $ \( 1 + 3 c \)^3 - 1 = 9 c \( 1 + 3 c + 3 c^2 \) = 0 $
  forces $c = 0$. Applying this twice handles ninth roots. If $q^9 = 1$ in the power-series domain $R$, its constant term is therefore $1$, and
  $ \( q - 1 \) \( 1 + q + dots.h.c + q^8 \) = 0 $
  forces $q = 1$, since the second factor has nonzero constant term $9$.
  Now suppose $gamma in G$ acts trivially on $R$, and write $gamma \( u \) = q_gamma u$. The group relation gives $q_gamma^9 = 1$, hence $q_gamma = 1$. It acts trivially on every $R u^n$. Lemma 11 gives a nonzero integral trace in $R u^n$, and Lemma 12 lifts it to $pi_(- 2 n) \( E^(h G) \)$. Its restriction has infinite order because $R$ is a characteristic-zero domain. The lifted class has infinite order as well. ◻
]

This proposition uses additive traces, which vanish in $hat(H)^0 \( G \; E_(*) \)$. It asserts neither torsion-freeness of a homotopy group nor periodicity.

#thm([Corollary 2.11.])[
  (The torsion-free repair).  #emph[Suppose that the graded groups $pi_(*) \( E^(h G) \)$ are $972$-periodic and that $pi_(- 2) \( E^(h G) \)$ is torsion-free. Then $b_j$ does not survive for any $j gt.eq 4$.]
] <det:conditional-repair>

#proof[
  For $j gt.eq 4$,
  $ 4 dot.op 3^(j + 1) - 2 = 972 dot.op 3^(j - 4) - 2 . $
  A survivor would give a nonzero finite-order element of the group in this degree by Theorem 10. Periodicity would identify it with a nonzero torsion element in degree $- 2$, a contradiction. ◻
]

The hypotheses of Corollary 14 are not assumed in the sequel. Instead we determine enough outgoing differentials to exclude the detected classes directly.

=== 2.6 Euler localization and finite-page conventions <euler-localization-and-finite-page-conventions>

For $K = G \, H$, let $lambda$ be its faithful complex one-dimensional representation, compatible under restriction. We also write $lambda$ for its underlying real plane. Use the cofree genuine $K$-spectrum associated to the given coherent action on $E$. Representation-suspended group cochains give an $R O \( K \)$-graded homotopy fixed point spectral sequence. If $V in R O \( K \)$, its total homotopy degree is $V - s$, and a differential changes $\( s \, V \)$ by $\( r \, r - 1 \)$.

The orientation of a complex representation sphere has trivial determinant character. It supplies an invertible symbol

$ u_lambda \, #h(2em) \| u_lambda \| = \( 0 \, 2 - lambda \) \, $

on $E_2$. This is an orientation symbol in the layers, not a claimed permanent homotopy orientation. Let $b$ denote cyclic cohomological periodicity, with $\| b \| = \( 2 \, 0 \)$. The Euler symbol is

$ "(2.10)" quad a_lambda = b thin u_lambda \, #h(2em) \| a_lambda \| = \( 2 \, 2 - lambda \) . $ <det:euler-symbol>

It represents the actual representation Euler map, of total degree $- lambda$.

Inverting $a_lambda$ makes the $E_2$-groups the ordinary Tate cohomology groups, with the additional orientation variables. We call the resulting spectral sequence the #emph[Tate pages]. Only their finite pages will be used. The Euler symbol has no outgoing differential as long as it remains present: the actual Euler map has a filtration-two lift, obtained from a nonvanishing section of the associated line bundle on the $1$-skeleton. Its first obstruction cocycle is exactly (2.10). Localization therefore commutes inductively with differentials and passage to the next page; if an Euler power is hit, the localized next page is zero.

Restriction and additive transfer are compatible with these pages. To see this without choosing incompatible filtrations, use the same free $G$-space $E G$ and its skeletons for both groups. Restriction is then levelwise, and transfer is the finite sum over cosets. The cochain maps satisfy the projection formula and commute with the differentials. Cellular comparisons with other free models induce the usual isomorphisms from $E_2$. Since the faithful Euler classes restrict compatibly, the same statements hold after localization.

Only lengths $r equiv 1 med \( mod med 4 \)$ can occur in the computations below. Evenness first excludes even $r$. The commuting central automorphism $- 1$ of the formal group acts trivially on $R$, since it lifts to every deformation, and by $- 1$ on its Lie line. Thus it acts on internal degree $t = dim_(upright(bold(R))) V$ by $\( - 1 \)^(t \/ 2)$, while it fixes the orientation symbols, whose representation shifts have dimension zero. Equivariance of $d_r$ then requires $\( - 1 \)^(\( r - 1 \) \/ 2) = 1$, giving the stated congruence.

#thm([Lemma 2.12.])[
  (A null lift gives a bounded incoming differential).  #emph[Let $F^(s + 1) arrow.r F^s$, $s gt.eq 0$, be a decreasing tower of spectra, or of genuine spectra for a finite group. If $alpha in pi_V F^s$ maps to zero in $pi_V F^0$, its layer symbol is zero by $E_(s + 1)$. If that symbol is initially nonzero, its first disappearance is an incoming differential of length at most $s$.]
] <det:finite-boundary>

#proof[
  Put $C^q = F^q \/ F^(q + 1)$, and let $i \, j \, k$ be the exact-couple maps obtained from the fibre sequences for these layers. The cumulative boundary group on $E_r$ in filtration $s$ is
  $ B_r^s = j_s ker #scale(x: 120%, y: 120%)[\(] pi_V F^s arrow.r pi_V F^(s - r + 1) #scale(x: 120%, y: 120%)[\)] \, #h(2em) 1 lt.eq r lt.eq s + 1 . $
  This is the usual exact-couple formula $B_r = j \( ker i^(r - 1) \)$: for $r = 1$ it is zero, and deriving the exact couple once adds the images of elements killed by the next iterate of $i$. Induction gives the displayed expression. The symbol $j_s alpha$ has zero image under $k$, so it has no outgoing differential on any page where it is nonzero. The hypothesis puts it in $B_(s + 1)^s$, proving the assertion. Equivalently, $alpha$ comes from $pi_(V + 1) \( F^0 \/ F^s \)$; this finite quotient involves exactly the intervening $s$ layers. ◻
]

#thm([Proposition 2.13.])[
  (Finite Euler bound).  #emph[In the cofree genuine spectra associated to $E$, the actual faithful Euler classes satisfy 
$ a_(lambda \| H)^79 = 0 \, #h(2em) a_lambda^235 = 0 . $

 Consequently, the $H$-Tate pages kill the unit by a differential of length at most $157$, and the $G$-Tate pages kill it by a differential of length at most $469$.]
] <det:euler-bound>

#proof[
  We give the construction for $K = H \, G$ simultaneously, retaining $H = chevron.l sigma chevron.r$ and writing $Q = K \/ H$. Let
  $ R_N = N_e^K upright(M U) \, #h(2em) rho_K = upright("the real regular representation of ") K . $
  We use the derived genuine norm and its commutative-ring counit; their indexed multiplication and geometric fixed point formulas are recalled in [16] Section 2 and Appendix B. Nonequivariantly, $R_N$ is a smash of $\| K \|$ copies of $upright(M U)$, labelled by $K$. Let
  $ c in pi_52 "Res"_e R_N $
  be the coefficient of $x^27$ in the strict change between the orientations labelled $e$ and $sigma$. Norming this class and then applying the counit gives
  $ "(2.11)" quad z in pi_(52 rho_K)^K R_N . $ <det:norm-class>
  #emph[Geometric fixed points.] We claim that $Phi^H z = 0$ as a genuine $Q$-class. The geometric fixed points of a free indexed norm descend to the norm indexed by the orbit set, with its residual group action; see [25] Corollary 2.11. After applying $Phi^H$, the factors in the domain of
  $ N_e^K "Res"_e R_N arrow.r R_N $
  are labelled by $Q times K$, the target factors by $Q$, and the multiplication folds them by
  $ Q times K arrow.r Q \, #h(2em) \( a H \, c \) mapsto a c H . $
  This follows equally by viewing the counit on each free norm factor as right translation of its labels. The displayed map factors, equivariantly for $Q$, as
  $ Q times K arrow.r Q times Q arrow.r Q . $
  The first stage is the $Q$-norm of the multiplication $upright(M U)^(and K) arrow.r upright(M U)^(and Q)$ that identifies labels in each $H$-coset. Under that multiplication the $e$ and $sigma$ orientations coincide. Their strict coordinate change is the identity, so $c$ maps to zero before the remaining $Q$-norm. This proves the claim with the residual equivariance retained.
  #emph[An Euler multiple vanishes in the norm spectrum.] Every nontrivial subgroup of $K$ contains $H$. The family of subgroups not containing $H$ is therefore just the trivial subgroup. Isotropy separation gives
  $ E K_(+) and R_N arrow.r R_N arrow.r accent(E K, ̃) and R_N . $
  For a spectrum concentrated over $H$, geometric $H$-fixed points identify its maps from $S^V$ with genuine $Q$-maps from $S^(V^H)$; see [12] Section 2.4. Apply this also after smashing with $S^(- 52 rho_K)$. The obstruction to lifting (2.11) through the first term is precisely its image
  $ Phi^H z in pi_(\( 52 rho_K \)^H)^Q Phi^H R_N \, $
  which is zero. Thus $z$ has such a lift.
  The group
  $ pi_(52 rho_K - d lambda)^K \( E K_(+) and R_N \) $
  vanishes if $52 \| K \| - 2 d < 0$. Indeed, $E K$ has free cells in nonnegative dimensions. A free $q$-cell contributes an induced spectrum, whose group in representation degree $52 rho_K - d lambda$ is the underlying group of $R_N$ in degree $52 \| K \| - 2 d - q$. It is zero because $"Res"_e R_N = upright(M U)^(and \| K \|)$ is connective. Induction over finite skeleta, followed by compactness of a representation sphere, proves the vanishing. Multiplication of the lifted class by $a_lambda^d$ therefore gives
  $ "(2.12)" quad a_lambda^d z = 0 quad upright("when") quad 52 \| K \| - 2 d < 0 . $ <det:euler-times-norm>
  The least such exponents are $d = 79$ for $H$ and $d = 235$ for $G$.
  #emph[The image of $z$ is invertible.] Let $E^(upright(B o r))$ denote the cofree genuine $K$-spectrum associated to the given action. There is a map
  $ R_N arrow.r E^(upright(B o r)) $
  obtained on underlying spectra with action by applying the translated orientation in each factor and multiplying:
  $ \( a_gamma \)_(gamma in K) mapsto product_(gamma in K) gamma f \( a_gamma \) . $
  The coherent action and the $E_oo$-multiplication make this a map with coherent action; cofree adjunction gives the genuine map. Its underlying map is homotopy multiplicative, which is all that will be needed. In particular, an $E_oo$ refinement of the orientation has not been assumed.
  Let $c_E$ be the underlying image of $c$. On the special fibre, $sigma - 1$ has $S$-valuation $3$, so its first nonzero nonlinear strict coefficient occurs at $x^27$. Hence $c_E$ has unit residue and is a homogeneous unit in $E_(*)$. The underlying image of $z$ is the product of its $K$-conjugates, and is again a unit. Multiplication by $z_E$ is thus an underlying equivalence
  $ S^(52 rho_K) and E^(upright(B o r)) arrow.r E^(upright(B o r)) . $
  Both spectra are cofree, since a finite representation sphere preserves cofreeness. An underlying equivalence between cofree spectra is a genuine equivalence. Transport (2.12) along the map of spectra and cancel multiplication by $z_E$. This proves the asserted vanishing of the actual Euler powers.
  #emph[The finite-page bound.] The Tate $E_2$-unit is nonzero: the equivariant residue map $R arrow.r k$ takes every additive trace to zero, since $K$ acts trivially on $k$ and $\| K \| = 0$ there. Cyclic periodicity therefore makes every Euler-power symbol nonzero on the ordinary $E_2$-page. The skeletal filtration-two lift of $a_lambda$ has symbol (2.10). Multiplying these lifts with a cellular diagonal gives a lift of $a_lambda^d$ in filtration $2 d$, with the corresponding power as symbol. It maps to zero in filtration zero by the result just proved. Lemma 15 therefore makes the symbol an incoming boundary by length $2 d$. Its representation internal degree is $d \( 2 - lambda \)$, of underlying dimension zero. An incoming $d_r$ has source internal dimension $1 - r$, so evenness forces $r$ odd. The bounds improve to $2 d - 1$, namely $157$ and $469$. After inverting the Euler symbol, a boundary on its power is a boundary on the unit. This proves the claim entirely on finite pages. ◻
]

== 3 The coefficient action and its fixed geometry <sec:coefficients>

The coefficient ring and its fixed deformation geometry supply two inputs to the topological differential calculation. The ring model gives the coefficient cohomology, while the fixed geometry constrains equivariant maps between its scalar and exterior parts. We first determine the actual action: the model in Theorem 20 below is an isomorphism of completed graded rings with their actual $C_9$-actions. It is the height-six, prime-three case of the model proposed in [4] Conjecture 0.3; that conjecture is not an input to the proof. Related geometric descriptions at height $p - 1$ are given by Ray [33] Theorem C and Section 10.5; at the prime three that height is two. The height-six model and its fixed deformation geometry are established here from the formal-group action.

Retain the Honda formal group, the chosen subgroup $G = chevron.l g chevron.r = C_9$, and $H = chevron.l sigma chevron.r$, where $sigma = g^3$, from Section 2. Put

$ k = upright(bold(F))_(3^6) \, #h(2em) R = W \( k \) \[ \[ u_1 \, dots.h \, u_5 \] \] \, #h(2em) frak(m) = \( 3 \, u_1 \, dots.h \, u_5 \) \, #h(2em) E_(*) = R \[ u^(plus.minus 1) \] \, quad \| u \| = - 2 . $

All completions of graded rings in this section are taken degree by degree. The coefficient line $E_(- 2)$ is the Lie line of the universal formal group: its dual $E_2$ is the cotangent line, identified by restriction from $upright(bold(C P))^oo$ to $upright(bold(C P))^1$. We use the right-unit convention for the strict coordinate-change coefficients $t_i$. Thus $t_1$ represents the usual integral one-cocycle of internal degree four.

Write

$ cal(C) = C_(cal(O)_D^times) \( H \) \, #h(2em) cal(O)_D = W \( k \) chevron.l S chevron.r \/ \( S^6 = 3 \, med S a = a^phi S \) . $

The action of $cal(C)$ considered here fixes $W \( k \)$. The centralizer algebra of $upright(bold(Q))_3 \( zeta_3 \)$ is a division algebra of degree three over that field. It contains its unramified cubic extension. Skolem–Noether, followed by adjustment of the valuation of a conjugator by a normalizing power of $S$, allows us to arrange that

$ T = upright(bold(F))_27^times subset.eq cal(C) $

consists of Teichmüller units. We index its characters modulo $26$, with the residual character on the Lie line assigned weight one. Since $26$ is invertible in $W \( k \)$, character projections may be applied to lifts in all the complete modules below.

=== 3.1 The tangent action <the-tangent-action>

To obtain the cyclic presentation, we will construct a period $x_0 in E_(- 2)$ with $"Tr"_H \( x_0 \) = 0$ and show that its $G$-orbit generates the completed coefficient ring. The tangent calculation gives the required independent coordinates. The following complete-local calculation then lifts the residual period to one with exactly zero trace.

For an element $e$ acting on coefficients, let $D_e = e - 1$. Choose Araki generators temporarily, so that $\[ 3 \] \( x \) = sum_i^F v_i x^(3^i)$, and normalize the period by $v_6 = u^(1 - 3^6)$. This normalization is possible by Hensel’s lemma. The elements $u_i = v_i u^(3^i - 1)$, $1 lt.eq i lt.eq 5$, are regular parameters. Set

$ P_0 = \[ 3 \] \, #h(2em) P_i = \[ u_i \] quad \( 1 lt.eq i lt.eq 5 \) $

in $frak(m) \/ frak(m)^2$.

#thm([Lemma 3.1.])[
  (Tangent action).  #emph[For $1 lt.eq i lt.eq 5$, the operator $D_g$ sends $P_i$ into the span of $P_0 \, dots.h \, P_(i - 1)$, with a nonzero coefficient of $P_(i - 1)$. The operator $D_sigma$ lowers the index by at least three, and its coefficient at $P_(i - 3)$, for $i gt.eq 3$, is $a^(3^(i - 3))$, where 
$ a thin a^27 = - 1 . $

 Moreover, $D_g u \/ u$ has a nonzero $P_5$-term and $D_sigma u \/ u$ has leading term $a^27 P_3$. One may choose a weight-one period $u$ and linear coordinates 
$ y_0 = \[ D_sigma u \/ u \] \, #h(2em) y_1 = P_4 \, #h(2em) y_2 = P_5 \, #h(2em) l_i = D_sigma y_i $

 such that 
$ l_0 = - P_0 \, #h(2em) "gr"_(frak(m)) E_(*) = k \[ u^(plus.minus 1) \, y_0 \, l_0 \, y_1 \, l_1 \, y_2 \, l_2 \] \, #h(2em) sigma y_i = y_i + l_i \, quad sigma l_i = l_i \, quad sigma u = u . $

 The weights of $y_0 \, y_1 \, y_2$ are $0 \, 2 \, 8$, respectively.]
] <coef:tangent>

#proof[
  For $e = g \, sigma$, comparison of the two 3-series under the strict coordinate change gives, through index six,
  $ "(3.1)" quad e v_i equiv v_i + sum_(l < i) v_l thin t_(i - l) \( e \)^(3^l) med \( mod med frak(m)^2 \) . $ <coef:right-unit-linear>
  Here and below an expression involving a graded coefficient is read after multiplication by the appropriate power of the period. To justify the truncation, in $f compose \[ 3 \]_(e F) = \[ 3 \]_F compose f$ all coefficients $v_l \, e v_l$ for $l < 6$ belong to $frak(m)$. Terms containing two such coefficients vanish modulo $frak(m)^2$. Inside a term already multiplied by $v_l$ one may work in characteristic three. The special-fibre Honda law is additive below total degree $3^6$, and terms involving the index-six summand together with a positive nonlinear power exceed the degree under consideration. These observations leave precisely (3.1).
  The $S$-valuations of $g - 1$ and $sigma - 1$ are one and three. Consequently their first residual nonlinear strict coefficients have indices one and three, respectively. The identity $\( sigma - 1 \)^2 = - 3 sigma$ in the endomorphism algebra implies $a thin a^27 = - 1$ for the latter coefficient. Equation (3.1) gives the asserted descending terms. At index six the equation $v_6 = u^(- 728)$, together with $- 728 equiv 1 med \( mod med 3 \)$, gives the period formulas.
  For Teichmüller elements the lower strict coefficients vanish on the special fibre. It follows that $P_i$ has weight $3^i - 1$. Projecting a period to weight one preserves its residual generator and the leading terms just calculated. In particular
  $ D_sigma y_0 = a^27 a P_0 = - P_0 . $
  The six displayed coordinates are independent: the three $y_i$ have leading indices $3 \, 4 \, 5$, and the three $l_i$ have leading indices $0 \, 1 \, 2$. Their asserted action follows either from this triangular calculation or from $D_sigma^2 = 0$ on $frak(m) \/ frak(m)^2$. ◻
]

=== 3.2 A complete-local coefficient calculation <a-complete-local-coefficient-calculation>

For this subsection only, use $cal(E)_r$ for the spectral sequence of the $frak(m)$-adic filtration on the coefficient Tate complex. This auxiliary spectral sequence is distinct from the topological homotopy-fixed-point spectral sequence. On $cal(E)_r$, the differential increases the $frak(m)$-filtration by $r$, increases cohomological degree by one, and preserves internal degree.

The complete cyclic Tate complex in a fixed internal degree alternates $D_sigma$ and $"Tr"_H = 1 + sigma + sigma^2$. Let $b$ denote its periodicity class of cohomological degree two and internal degree zero. Set

$ N_i = y_i^3 - y_i l_i^2 . $

The letters $N_i$ initially denote elements of the associated graded; their multiplicative orbit norms will provide lifts.

#thm([Lemma 3.2.])[
  (The first coefficient page).  #emph[There is an isomorphism of trigraded algebras 
$ "(3.2)" quad cal(E)_1 = k \[ b^(plus.minus 1) \, u^(plus.minus 1) \, N_0 \, N_1 \, N_2 \] ⊗ Lambda \( e \, z_0 \, z_1 \, z_2 \) . $ <coef:first-page>

 Here $e \, z_i$ have cohomological degree one and internal degree zero. Their cyclic cocycle values at $sigma$ are $1 \, y_i$, respectively. Their $frak(m)$-filtrations are $0 \, 1$, and $N_i$ has filtration three. The classes $b^(plus.minus 1)$, $N_i$, and the class denoted $u^3$ lift to cycles of the complete coefficient complex.]
] <coef:graded-tate>

#proof[
  For one pair $k \[ y \, l \]$ with $sigma y = y + l$, the orbit norm is $N = y^3 - y l^2$, and the ring is free over $k \[ N \, l \]$ on $1 \, y \, y^2$. After removing powers of $N$, its homogeneous part of degree $d gt.eq 2$ has basis
  $ l^d \, #h(2em) y l^(d - 1) \, #h(2em) y^2 l^(d - 2) . $
  The action on this three-dimensional space is a single unipotent block of length three; it is a free $k \[ H \]$-module. Degree zero is trivial, and degree one is the two-dimensional indecomposable module, a suspension of the trivial module in the stable category.
  Tensor the three decompositions. Terms having a free factor have zero Tate cohomology. The stable suspension class of each degree-one factor is represented by its value $y_i$, and cup product with that class identifies the corresponding shifted Tate groups. This gives (3.2) as a module, and also identifies products on distinct factors. Odd anticommutation and the vanishing of odd squares give the displayed exterior algebra.
  The elements $N_i$ lift by taking multiplicative orbit norms of lifts of $y_i$; the norm of a period has initial term $u^3$. The periodicity operator $b$ and its inverse act on the actual cyclic complex. These are therefore coefficient cycles. ◻
]

#thm([Proposition 3.3.])[
  (Integral obstruction calculation).  #emph[After compatible nonzero scalar normalizations, the auxiliary coefficient spectral sequence has 
$ d_1 \( u \) = u z_0 \, #h(2em) d_1 \( e \) = e z_0 \, #h(2em) d_1 \( z_i \) = z_i z_0 med \( i = 1 \, 2 \) \, #h(2em) d_1 \( z_0 \) = 0 . $

 Consequently 
$ "(3.3)" quad cal(E)_2 = k \[ b^(plus.minus 1) \, u^(plus.minus 3) \, N_0 \, N_1 \, N_2 \] ⊗ Lambda \( e u \, z_1 u \, z_2 u \, z_0 \) . $ <coef:second-page>

 Its only nonzero differential on these generators is 
$ d_2 \( z_0 \) = c thin b N_0 \, #h(2em) c in k^times . $

 There are no further differentials. In particular the leading cohomology class $e u$ is represented by an actual element $x_0 in E_(- 2)$ satisfying 
$ x_0 \/ u equiv 1 med \( mod med frak(m) \) \, #h(2em) "Tr"_H \( x_0 \) = 0 . $

 The element $x_0$ may be chosen of $T$-weight one.]
] <coef:integral-lift>

#proof[
  The definition of $y_0$ gives $d_1 \( u \) = u z_0$. The linear part of $"Tr"_H \( u \) \/ u$ is $P_0 + l_0 = 0$, so $d_1 \( e u \) = 0$. In the cyclic cup-product convention this is equivalently $d_1 \( e \) = e z_0$.
  We need the same trace assertion to one further order. The trace of the chosen period now lies in $frak(m)^2 E_(- 2)$. It is invariant, so its leading term defines an even Tate class in filtration two. The only classes there with the required internal degree are the shifts of $u z_i z_j$, $i < j$, by powers of $b$. None has $T$-weight one: the added weights are $2 \, 8 \, 10$. The leading trace class is therefore zero. Subtracting the trace of an element of $frak(m)^2 E_(- 2)$ corrects $u$ so that
  $ "Tr"_H \( u \) in frak(m)^3 E_(- 2) . $
  Since $g$ commutes with $H$, the elements $D_g u \, D_g^2 u \, D_sigma u$ satisfy the same trace condition. By Lemma 17 their first terms span $u z_2 \, u z_1 \, u z_0$, in triangular order, modulo $l_i$-terms. Those $l_i$-terms are boundaries in the odd cyclic group. Thus $d_1 \( z_1 u \) = d_1 \( z_2 u \) = 0$. The equation $d_1^2 \( u \) = 0$ also gives $d_1 \( z_0 \) = 0$. Leibniz yields the asserted formulas on $e \, z_1 \, z_2$. Taking cohomology, a monomial survives precisely when its power of $u$ is congruent modulo three to its number of factors among $e \, z_1 \, z_2$; this gives (3.3).
  The three generators $e u \, z_1 u \, z_2 u$ all have period exponent one modulo three. An even target at that exponent must contain exactly one of these generators and also $z_0$. For a $d_2$ from $z_1 u$ or $z_2 u$ this is impossible in filtration three; for a $d_2$ from $e u$, the filtration-two candidates have the wrong weight. For $z_0$, a target has period exponent zero and filtration three. The norms $N_1 \, N_2$ have weights $6 \, 24$, whereas $N_0$ has weight zero. The remaining possible four-exterior-factor target, with its period corrected by $u^(- 3)$, has weight $10$. Thus the only possible differential is $d_2 z_0 = c thin b N_0$.
  To determine $c$, let $L = upright(bold(Q))_3 \( zeta_3 \)$ and take a height-one Lubin–Tate formal module for the unramified cubic extension of $L$. Its underlying formal group has height six. After a residue-field extension, choose a framing identifying the action of $zeta_3$ with the prescribed $H$-action. Skolem–Noether gives such a framing rationally; it can be made integral because the centralizer division algebra contains an element of $S$-valuation one. This construction uses formal-module deformation theory and the given stabilizer embedding, not the coefficient model being proved.
  On this fixed lift the ungraded coefficients have trivial $H$-action and the Lie period has character $zeta_3$, or its inverse if the opposite action convention is chosen. Put $pi = zeta_3 - 1$. Filter the target cyclic complex by powers of $pi$. The class $z_0$ maps to a nonzero multiple of $pi e$. Since $3$ is a unit times $pi^2$, the norm differential on this internal-degree-zero class sends $pi e$ to a nonzero multiple of $pi^3 b$. This is its $d_2$, and $N_0$ maps to $pi^3$ up to a unit. Naturality proves $c eq.not 0$.
  The resulting page is
  $ "(3.4)" quad k \[ b^(plus.minus 1) \, u^(plus.minus 3) \, N_1 \, N_2 \] ⊗ Lambda \( e u \, z_1 u \, z_2 u \) . $ <coef:final-graded>
  Its three odd generators have no even target of period exponent one modulo three. Its even generators already lift to coefficient cycles. Hence all subsequent differentials vanish.
  We finally justify passage to the complete complex. In each fixed internal and cohomological degree its terms are compact: their $frak(m)$-adic quotients are finite because $k$ is finite. Survival to every page means that every prescribed finite accuracy admits a lift with the given leading cohomology class. A boundary correction in the leading quotient permits us to fix a representative of that class. The sets of such lifts whose differentials vanish to accuracy $N$ are nonempty nested closed subsets of a compact module. Their intersection supplies an exact cycle. Images of the differential, and images of deeper filtration pieces, are closed for the same reason. Thus the final page really is the associated graded of the coefficient Tate cohomology; no inverse-limit extension is being suppressed.
  Apply this argument to $e u$. An odd cyclic cocycle is precisely an element in the kernel of $"Tr"_H$, so it gives the claimed $x_0$. Projection to the weight-one character commutes with $"Tr"_H$, preserves the residual period, and gives the last assertion. ◻
]

#thm([Theorem 3.4.])[
  (The exact cyclic coefficient model).  #emph[Set $x_i = g^i x_0$, with indices read modulo nine. Then 
$ "(3.5)" quad (frac(W \( k \) \[ x_0 \, dots.h \, x_8 \, \( x_0 dots.h.c x_8 \)^(- 1) \], \( x_i + x_(i + 3) + x_(i + 6) : 0 lt.eq i < 3 \)))_(\( 3 \, x_i \/ x_0 - 1 \))^and arrow.r^(med tilde.equiv med) E_(*) $ <coef:ring-model>

 is an isomorphism of $W \( k \)$-linear graded $G$-rings, with $\| x_i \| = - 2$ and $g \( x_i \) = x_(i + 1)$.]
] <coef:model>

#proof[
  The actual trace equation of Proposition 19 and its first two $g$-translates give the three relations. All $x_i \/ x_0$ reduce to one, so the product being inverted is a unit.
  Eliminate $x_6 \, x_7 \, x_8$, and use $x_0$ and the five ratios $x_i \/ x_0$, $1 lt.eq i lt.eq 5$, as coordinates. The degree-zero part of the source is a power-series ring in five variables over $W \( k \)$; the remaining variable is an invertible period. The tangent map is invertible. Indeed the first five positive differences $D_g^j x_0 \/ x_0$ have leading terms in $P_(6 - j)$, respectively, with nonzero coefficients. Any first-order correction from $u$ to the weight-one $x_0$, after division by $u$, has weight zero and lies in the span of $P_0 \, P_3$. Its positive $D_g$-differences only change lower terms in this triangular calculation. Together with $3$, the five displayed differences therefore give all six cotangent directions. The passage from these differences to the five ratio coordinates is an invertible triangular binomial change of variables. Formal inversion over $W \( k \)$ proves that the degree-zero map is an isomorphism, and adjoining the period proves (3.5). Its equivariance holds by the definition $x_i = g^i x_0$. ◻
]

=== 3.3 Coefficient cohomology and its scalar classes <coefficient-cohomology-and-its-scalar-classes>

Return now to the bidegree convention $\( s \, t \)$, with group cohomological degree first and internal homotopy degree second. The following is the coefficient algebra that forms the topological $E_2$-page after Euler localization.

#thm([Proposition 3.5.])[
  #emph[Put $q_i = "N"_H \( x_i \)$, $q = q_0$. There are norm parameters $n_1 \, n_2$ such that, with $K = k \[ \[ n_1 \, n_2 \] \]$, 
$ "(3.6)" quad hat(H)^(*) \( H \; E_(*) \) = K \[ q^(plus.minus 1) \, b^(plus.minus 1) \] ⊗_K Lambda_K \( V \) \, #h(2em) \| q \| = \( 0 \, - 6 \) \, quad \| b \| = \( 2 \, 0 \) \, quad \| V \| = \( 1 \, 4 \) . $ <coef:h-tate-ring>

 The module $V$ is free of rank three, with cyclic-cocycle basis 
$ a_i = x_i \/ q_i \, #h(2em) 0 lt.eq i < 3 . $

 The group $g$ cyclically permutes this basis semilinearly over $K$. Equivalently, $q_i \/ q - 1$, $i = 1 \, 2$, are regular parameters of $K$. For $frak(n) = \( n_1 \, n_2 \)$, the weights on $frak(n) \/ frak(n)^2$ are $6 \, - 2$, and $V \/ frak(n) V$ is a single three-term Jordan block for $g$.]
] <coef:h-cohomology>

#proof[
  Lift the norm classes $N_1 \, N_2$ in (3.4), choosing weight $2 \, 8$ lifts before taking norms. Their norms have weights $6 \, 24$. The trace-zero $x_i$ give odd cocycles, and division by $q_i$ places them in internal degree four. The first two $g$-differences yield the $z_2 u \, z_1 u$ terms of (3.4); together with $x_0$, they give the three odd generators. One may first use a common denominator $q$ to verify this associated-graded assertion.
  Tate cohomology is killed by three, so it is a $k$-algebra. All the power series in the positive-filtration norm parameters converge in its complete filtration. The proposed generators account for the entire associated graded. Their only proposed relations are the exterior relations, which hold in cohomology by graded commutativity and invertibility of two. The complete associated-graded comparison therefore proves (3.6).
  For the alternative parameters, the identity
  $ "N"_H \( a + b \) - "N"_H \( a \) - "N"_H \( b \) in "im" \( "Tr"_H \) $
  holds in every commutative $H$-ring: the mixed terms in the triple product are the two complete cyclic orbits. Apply it to $a = 1$, $b = x_i \/ x_0 - 1$. Modulo additive traces, $q_i \/ q - 1$ is the norm of that ratio difference. The first two ratio differences span the $y_1 \, y_2$ directions modulo the $y_0 \, l_i$ directions, by the triangular tangent calculation; the norms of the latter directions vanish on (3.4). Thus these two norm functions are another regular parameter system.
  Finally $q_(i + 3) = q_i$, and $x_(i + 3) - x_i = D_sigma x_i$ is an odd cyclic boundary. Hence $g \( a_2 \) = a_0$ in cohomology. Modulo $frak(n)$, semilinearity disappears and the cyclic permutation of three basis elements is a single Jordan block in characteristic three. ◻
]

#thm([Lemma 3.6.])[
  (Scalar cycles).  #emph[On every nonzero topological Tate page, 
$ A = q b^(- 2) $

 is a permanent-cycle unit, and every element of $K$ is a cycle.]
] <coef:scalar-cycles>

#proof[
  The representation-graded multiplicative norm of $x_0$ is an actual class of degree minus twice the real regular representation of $H$. Its symbol is $q u_lambda^2$. Division by the Euler square, whose symbol is $b^2 u_lambda^2$, gives $A$. Both numerator and Euler class have actual filtered lifts. Their quotient is a unit on each nonzero localized page and has no outgoing differential.
  The ratios
  $ q_i \/ q = "N"_H \( x_i \/ x_0 \) $
  are norms of elements of $pi_0 E$, so they have degree-zero homotopy lifts. The norm parameters used in Proposition 21 have the same property. Constants are cycles: a Teichmüller constant satisfies $c^729 = c$, and Leibniz kills its differential on a characteristic-three page. For an arbitrary series use the finite decomposition
  $ f = sum_(0 lt.eq i \, j < 3) f_(i j)^(thin 3) n_1^i n_2^j \, #h(2em) f_(i j) in K . $
  Leibniz kills each cube and each parameter. This proves the assertion without a continuity assumption on a spectral-sequence derivation. ◻
]

=== 3.4 The fixed formal-module deformation <the-fixed-formal-module-deformation>

We now study the centralizer action on the scalar and exterior modules in (3.6). To constrain equivariant maps between them, we evaluate their classes on deformations fixed by $H$, and then on a one-dimensional locus in that fixed space. This requires identifying the fixed functor on all Artinian tests, including nonreduced ones. We begin with the finite-height rigidity underlying Lubin–Tate deformation theory; compare [22] Proposition 2.4.

#thm([Lemma 3.7.])[
  (Rigidity of endomorphism lifts).  #emph[Let $B$ be an Artinian local ring with residue characteristic three, and let $F_1 \, F_2$ be deformations over $B$ of formal groups of finite height. A homomorphism $F_1 arrow.r F_2$ is determined by its reduction. The same assertion holds over a complete local base by passage to its Artinian quotients.]
] <coef:rigidity>

#proof[
  The formal-group difference of two homomorphisms with the same reduction is a homomorphism $f$ whose coefficients lie in the maximal ideal $frak(b)$ of $B$. Suppose inductively that they lie in $frak(b)^i$, $i gt.eq 1$. In the equality
  $ \[ 3 \]_(F_2) compose f = f compose \[ 3 \]_(F_1) \, $
  the left side is zero modulo $frak(b)^(i + 1)$: its linear term is $3 f$, and every nonlinear term has at least two factors from $frak(b)^i$. On the right, only substitution by the special-fibre 3-series matters. That series has positive finite order, so substitution by it is injective on $\( frak(b)^i \/ frak(b)^(i + 1) \) \[ \[ x \] \]$. Thus $f$ vanishes modulo $frak(b)^(i + 1)$. Induction proves $f = 0$. ◻
]

Write

$ cal(O) = upright(bold(Z))_3 \[ zeta \] \, #h(2em) zeta = zeta_3 \, #h(2em) pi = zeta - 1 . $

A #emph[strict formal $cal(O)$-module] means a formal group with $cal(O)$-action whose induced action on its Lie line is the structural scalar action of $cal(O)$. For formal-module deformation theory we use the Lubin–Tate–Drinfeld theorem: the framed deformation of a one-dimensional formal $cal(O)$-module of relative height $d$ is a formally smooth space of relative dimension $d - 1$ over the completed unramified coefficient extension of $cal(O)$. This is the strict formal-module deformation problem; see [22,9] and [30] Theorem 8.4. The normalization of the uniformizer coefficients will be used separately below, with its own reference and coordinate comparison.

For a coefficient line we shall write $w^i$ for the $i$-th tensor power of the Lie line, retaining its $cal(C)$-equivariant structure. Thus a section written $f w^i$ has scalar coefficient $f$ only after a choice of the displayed period. Put $P_n = K q^n$; after a quotient of $K$, the same notation denotes the corresponding scalar line over that quotient.

#thm([Theorem 3.8.])[
  (Fixed geometry and evaluation).  #emph[The eigenvalue condition 
$ sigma x_i = zeta x_i $

 defines a framed strict formal $cal(O)$-module deformation space of relative height three. Its ungraded base and Lie period are 
$ D_0 = W \( k \) \[ zeta \] \[ \[ r_1 \, r_2 \] \] \, #h(2em) r_i = x_i \/ x_0 - 1 med \( i = 1 \, 2 \) \, #h(2em) w = x_0 . $

 The full ungraded $H$-fixed base is equivalently 
$ "(3.7)" quad W \( k \) \[ \[ s \, r_1 \, r_2 \] \] \/ \( s^2 + 3 s + 3 \) \, #h(2em) 1 + s = sigma x_0 \/ x_0 . $ <coef:nonreduced-fixed>

 In particular its characteristic-three fibre retains the relation $s^2 = 0$.]
  #emph[Set $macron(D) = D_0 \/ \( pi \)$. There is a $cal(C)$-invariant Hasse section $h_1$ in the line $w^(- 2)$, given by the first strict coefficient of $sigma$. On its zero divisor there is a $cal(C)$-invariant Hasse section $h$ in $w^(- 8)$, given by the second strict coefficient. The ring 
$ D' = macron(D) \/ \( h_1 \) $

 is a formal disc with parameter $h w^8$; here ideals generated by line sections are read after a period trivialization.]
  #emph[Evaluation in cyclic cohomology and reduction modulo $pi$ identify 
$ K tilde.equiv macron(D)^(thin 3) \, #h(2em) q mapsto w^3 . $

 The evaluated $V$ is the $macron(D)^3$-span of $1 \, x_1 \/ x_0 \, x_2 \/ x_0$ in the line $w^(- 2)$. There is a $cal(C)$-fixed primitive element $theta in V$, the restriction of the class of $t_1$, which evaluates to $h_1$ up to a nonzero scalar.]
  #emph[One may choose a $T$-basis $v \, theta \, y$ of $V$ with weights $- 2 \, 0 \, 6$, with $v = x_0 \/ q$. Modulo $frak(n)$, 
$ "(3.8)" quad g theta = theta \, #h(2em) g y = y + c_1 theta \, #h(2em) g v = v + c_2 y + c_3 theta \, #h(2em) c_1 c_2 eq.not 0 . $ <coef:jordan>

 Using evaluation to identify cube sections with their unique preimages, put 
$ J = h_1^3 in K q^(- 2) \, #h(2em) F = q^2 J \, #h(2em) S_0 = K \/ \( F \) tilde.equiv \( D' \)^3 \, #h(2em) W = \( V \/ K theta \) ⊗_K S_0 . $

 Then $F$ is a regular parameter of $K$, and there is an injective $cal(C)$-equivariant evaluation 
$ W arrow.r w^(- 2) quad upright("over ") D' . $

 After trivializing the line, the evaluations of $v \, y$ have orders zero and one, respectively.]
] <coef:fixed-geometry>

#proof[
  We first compute the fixed equations, without passing to reduced points. In the model of Theorem 20, put $a_i = x_i \/ x_0$, so $a_0 = 1$, and put $r = a_3$. Fixation of the ungraded base by $sigma$ says
  $ a_(i + 3) = r a_i . $
  It follows that $a_4 = r a_1$, $a_5 = r a_2$, and $a_6 = r^2$. The first trace relation also gives $a_6 = - 1 - r$. Thus $r^2 + r + 1 = 0$. Conversely, this equation and the displayed formulas impose all the base-fixation equations, including the remaining two trace relations. Writing $r = 1 + s$ gives (3.7). Fixing its structural root $r = zeta$ gives precisely $D_0$. The action of $cal(C)$ preserves this locus because it centralizes $sigma$.
  On an Artinian test ring, a fixed deformation carries the lift of the framed automorphism $sigma$. This lift is unique by Lemma 23. Its endomorphism $1 + sigma + sigma^2$ reduces to zero and is therefore zero. It consequently extends the $upright(bold(Z))_3$-action to an $cal(O)$-action. The eigenvalue condition imposes exactly the structural action on the Lie line. Conversely, such a strict formal-module deformation supplies this lifted automorphism and the eigenvalue condition. This proves the claimed identification of deformation functors on all Artinian tests. Since $\[ cal(O) : upright(bold(Z))_3 \] = 2$, its underlying height six is relative height three.
  On $macron(D)$ the structural uniformizer vanishes. The first nonlinear coefficient of the uniformizer endomorphism is $t_1 \( sigma \)$, a section of $w^(1 - 3) = w^(- 2)$. After this coefficient is zero, its next leading coefficient is $t_2 \( sigma \)$, a section of $w^(1 - 9) = w^(- 8)$. Subtracting the identity from $sigma$ gives these statements successively modulo the previous leading coefficients. Leading coefficients of an endomorphism transform in the indicated lines under coordinate change. They are therefore intrinsic $cal(C)$-invariant sections, denoted $h_1 \, h$. Here is the parameter comparison explicitly. After the faithfully flat completed residue extension $k subset.eq macron(k)$, the universal formal-module deformation admits parameters $U_1 \, U_2$ and a formal group coordinate $z$ satisfying
  $ "(3.9)" quad \[ pi \] \( z \) equiv U_i z^(3^i) med \( mod med \( pi \, U_1 \, dots.h \, U_(i - 1) \, z^(3^i + 1) \) \) \, #h(2em) i = 1 \, 2 \; $ <coef:height-coordinates>
  this is [36] arXiv version, Section 1, Equation (1.1), applied to the ramified local field $upright(bold(Q))_3 \( zeta \)$. If $z' = c z + O \( z^2 \)$, with $c$ a unit, conjugation sends a first nonzero coefficient $lambda z^N$ to $c^(1 - N) lambda$. Thus $h_1 w^2$ is a unit times $U_1$, and, on its zero divisor, $h w^8$ is a unit times $U_2$. Nonvanishing of these successive cotangent classes descends along $k subset.eq macron(k)$. The formal inverse function theorem therefore makes $h_1 w^2$ a regular parameter of $macron(D)$, and identifies its zero curve with $k \[ \[ h w^8 \] \]$. This proves the disc assertion over the original finite residue field; no descent of the chosen normal-form coordinate is required.
  At the fixed deformation, $"N"_H \( x_i \) = x_i^3$, since $1 + zeta + zeta^2 = 0$ and $zeta^(0 + 1 + 2) = 1$. Hence
  $ q_i \/ q mapsto \( x_i \/ x_0 \)^3 = \( 1 + r_i \)^3 . $
  The parameter description of Proposition 21, and perfection of $k$, identify $K$ with $k \[ \[ r_1^3 \, r_2^3 \] \] = macron(D)^3$. Using the common denominator $q$, the values of the three odd generators are $w^(- 2)$, $\( 1 + r_1 \) w^(- 2)$, and $\( 1 + r_2 \) w^(- 2)$. The alternative denominators $q_i$ multiply these by units from the cube subring, so give the same span.
  The class of $t_1$ is the restriction of the integral Adams–Novikov one-cocycle and is fixed by the centralizer. Its value is $h_1$, up to the nonzero scalar determined by the cyclic generator convention. Its evaluated first jet is nonzero, so its class $theta$ is primitive in $V$. The residual weights of $V$, from (3.4) after division by the norm period, are $- 2 \, 0 \, 6$. Character projection gives a basis $v \, theta \, y$ of these weights. The tangent chain in Lemma 17 puts $theta$ at the fixed end and gives (3.8), including nonvanishing of $c_1 \, c_2$.
  Under the identification $K = macron(D)^3$, $F = q^2 h_1^3$ is $\( h_1 w^2 \)^3$; it is a parameter. This also gives $S_0 tilde.equiv \( D' \)^3$. The values and first derivatives of $1 \, r_1 \, r_2$ span first jets. The class $theta$ is transverse to the curve, while $v$ has nonzero constant value. The remaining class $y$ has nonzero derivative along the curve. Equivalently its scalar first jet has weight $8$, whereas the transverse parameter has weight $2$. Thus, on the curve, the evaluated $v \, y$ have orders zero and one.
  For completeness, these orders prove the asserted injectivity over the smaller ring. Write $tau = h w^8$, so $D' = k \[ \[ tau \] \]$ and $S_0 = k \[ \[ tau^3 \] \]$. A nonzero cube-series multiple of the value of $v$ has order $0 med \( mod med 3 \)$, and one of the value of $y$ has order $1 med \( mod med 3 \)$. They cannot cancel. Evaluation of $W$ is therefore injective. All constructions used to define it are functorial for the centralizer action, proving equivariance. ◻
]

=== 3.5 Centralizer rigidity on the curve <centralizer-rigidity-on-the-curve>

#thm([Lemma 3.9.])[
  #emph[Every open subgroup of $cal(C)$ has infinite image on $D'$. Its invariant Laurent functions are constants. These assertions remain valid after a finite extension of the residue field, with the group acting trivially on the extended constants.]
] <coef:infinite-action>

#proof[
  Suppose an open subgroup $U$ fixed the curve. Its elements would lift to automorphisms of the formal $cal(O)$-module over $D'$, with their given special fibres. The relative height at the generic point is two: the first height parameter is zero and the second is nonzero. After extending the fraction field to an algebraic closure, the centralizer of $upright(bold(Q))_3 \( zeta \)$ in the rational endomorphism algebra therefore has dimension four over $upright(bold(Q))_3 \( zeta \)$.
  At the closed point the corresponding centralizer is a division algebra of degree three, hence dimension nine over $upright(bold(Q))_3 \( zeta \)$. An open subgroup of its units spans this algebra: differences of elements in a sufficiently small neighborhood of one contain a nonzero multiple of its full integral lattice. Choose nine members of $U$ linearly independent over $upright(bold(Q))_3 \( zeta \)$. Their generic lifts would satisfy a nontrivial linear relation over that field of operators. Clear its denominators using the structural $cal(O)$-action. The resulting sum is an integral formal-module endomorphism; if it vanishes generically, all its power-series coefficients vanish over the domain $D'$. Specialization gives the same forbidden relation at the closed point. This proves that no open subgroup fixes the curve. A finite image would have an open kernel, since distinct automorphisms of a formal disc are distinguished on finite jets. Thus every open subgroup has infinite image.
  If a Laurent function is nonconstant, subtract its constant term when necessary and invert it when it has a pole. Its leading order shows that the Laurent-series field of the disc is finite over the one-variable Laurent-series field it generates. A group of field automorphisms fixing that function is consequently finite. It cannot contain the image of an open subgroup of $cal(C)$. The same argument and the same dimension contradiction apply after a finite extension of constants. ◻
]

#thm([Lemma 3.10.])[
  (Invariant meromorphic sections).  #emph[A nonzero invariant meromorphic section of $w^i$ is a constant multiple of $h^d$, where $8 d = - i$ and $d in upright(bold(Z))$. If it is integral, then $d gt.eq 0$. There is no nonzero invariant meromorphic section of $w^i chi$ for any nontrivial constant sign character $chi : cal(C) arrow.r { plus.minus 1 }$.]
] <coef:hasse-powers>

#proof[
  Let $z$ be such a section. Since $h$ is invariant in $w^(- 8)$, the product $z^8 h^i$ is an invariant Laurent function. It is a nonzero constant by Lemma 25. In a period trivialization, $h$ has order one. Valuation therefore gives $8 "ord" \( z \) + i = 0$. Put $d = "ord" \( z \)$; then $i = - 8 d$, and $z \/ h^d$ has eighth power constant. After a finite extension of constants it is itself constant. This proves the first assertion and its integral variant.
  For a sign twist the same eighth-power calculation applies. The resulting constant $z \/ h^d$ would have to transform by the nontrivial character $chi$, although the group fixes constants. It must therefore vanish, a contradiction. ◻
]

=== 3.6 The determinant character <the-determinant-character>

The next calculation is over the reduced ring $macron(D)$, not over the nonreduced characteristic-three fibre in (3.7). This distinction is needed when dividing the determinant of a crystalline operator. The use of Kodaira–Spencer theory to express an equivariant canonical line in terms of a Lie line and a determinant character has a close antecedent in the Lubin–Tate calculation of Hopkins–Gross [18] Section 1.2 and Corollary 3. Here the strict $cal(O)$-action and the quotient by the invariant Hasse direction require the following calculation on the curve.

#thm([Lemma 3.11.])[
  (The determinant line).  #emph[After a finite extension of constants there is an equivariant isomorphism 
$ "(3.10)" quad det \( D' ⊗_(S_0) W \) tilde.equiv w^(- 9) chi \, $ <coef:determinant-formula>

 where $chi : cal(C) arrow.r { plus.minus 1 }$ is a sign character whose restriction to $T$ has weight $13$, and is therefore nontrivial.]
] <coef:determinant>

#proof[
  Write $A_0 = macron(D)$, and let $cal(X) \/ A_0$ be its universal strict formal $cal(O)$-module. Let $cal(M)$ denote the covariant de Rham Dieudonné module of its underlying $3$-divisible group. Our convention is $cal(M) = bb(D) \( cal(X)^D \)$, where $bb(D)$ is the contravariant crystal and $cal(X)^D$ is the Cartier dual. The crystal and its duality are provided by [6] Section 2.2, Theorem 2, and Section 5.2, Theorem 5(i). It is free of rank six over $A_0$. The uniformizer endomorphism acts on $cal(M)$ by an operator $epsilon.alt$ with $epsilon.alt^2 = - 3 \( 1 + epsilon.alt \) = 0$. We first show that
  $ cal(M) med upright("is free of rank three over ") med B_0 = A_0 \[ epsilon.alt \] \/ \( epsilon.alt^2 \) . $
  At the closed point, the integral Dieudonné lattice is torsion-free over $W \( k \) ⊗_(upright(bold(Z))_3) cal(O) = W \( k \) \[ zeta \]$. Indeed multiplication by three is injective, and the relation $pi^2 = - 3 \( 1 + pi \)$ implies that multiplication by $pi$ is injective as well. This coefficient ring is a discrete valuation ring, so the lattice is free of rank three over it. Reduction modulo three gives a rank-three free module over $k \[ epsilon.alt \] \/ \( epsilon.alt^2 \)$. Lift such a basis to $cal(M)$. The resulting $B_0$-linear map $B_0^3 arrow.r cal(M)$ is a map of free $A_0$-modules of rank six which is an isomorphism at the closed point. Its determinant is a unit, proving the assertion.
  Set $M_0 = cal(M) \/ epsilon.alt cal(M)$, and let $L$ be the Lie line, denoted $w$. The Hodge quotient factors through $M_0$ because the structural uniformizer acts as zero on $L$. Write
  $ "(3.11)" quad 0 arrow.r N arrow.r M_0 arrow.r L arrow.r 0 . $ <coef:hodge-quotient>
  Here $M_0$ has rank three and $N$ has rank two.
  We make the tangent identification on arbitrary Artinian tests. For a continuous map $A_0 arrow.r R_0$ to an Artinian local $k$-algebra and a finite $R_0$-module $I$, use the split square-zero extension $R_0 xor I$. Give $I$ the divided powers $gamma_1 \( x \) = x$ and $gamma_j \( x \) = 0$ for $j gt.eq 2$. Grothendieck–Messing applies to this nilpotent divided-power thickening. The splitting provides a distinguished pullback lift; the crystal evaluated on the thickening is the base change of the de Rham module of that lift. The theorem identifies deformations with lifts of the Hodge quotient, and its full-faithfulness assertion identifies lifted endomorphisms with operators preserving that quotient [8] Remark 2.3(iii), Theorem 2.4(ii),(iv). Thus the strict $cal(O)$-module lifts are exactly the quotient lifts on which $epsilon.alt$ acts by zero, or equivalently lifts of the quotient $M_0 arrow.r L$ in (3.11). Relative to the split lift these are parametrized by $"Hom" \( N \, L ⊗ I \)$. The representing deformation functor parametrizes them by continuous derivations of $A_0$ into $I$. Naturality on all these tests, and passage to the inverse limit, give equivariantly
  $ T_(A_0 \/ k) tilde.equiv "Hom"_(A_0) \( N \, L \) \, #h(2em) Omega_(A_0 \/ k)^1 tilde.equiv N ⊗ L^(- 1) . $
  In particular
  $ "(3.12)" quad det Omega_(A_0 \/ k)^1 tilde.equiv \( det M_0 \) L^(- 3) . $ <coef:canonical-line>
  This is the operator-compatible version of the usual Kodaira–Spencer calculation.
  Let $phi.alt$ be absolute Frobenius of $A_0$. Functoriality and crystalline base change give $A_0$-linear maps between $phi.alt^(*) cal(M)$ and $cal(M)$ induced by relative Frobenius and Verschiebung, with both composites multiplication by three and hence zero [6] Section 2.2, Equation (2.4), pp. 24–25. At the closed point the integral covariant Lie quotient has dimension one, so the corresponding operator has elementary divisors five units and one factor three. The relation $F V = V F = 3$ gives the complementary operator one unit and five factors three; see [8] Theorem 4.33(3) and Remark 4.34(2). Thus one of the reduced maps, say $U$, has rank five, and its complement has rank one. Their corresponding minors remain units. Over the fraction field of $A_0$ the ranks are therefore at least five and one, and their zero composition forces the first rank to be exactly five.
  Both source and target of $U$ are free rank-three modules over $B_0$. On the Frobenius twist the operator is the #emph[pullback of the endomorphism] $epsilon.alt_(cal(M))$. Naturality of the crystalline maps makes $U$ linear for these operators: in one direction the identity is $U phi.alt^(*) \( epsilon.alt_(cal(M)) \) = epsilon.alt_(cal(M)) U$, and in the other direction it is the reversed identity. These identities follow on every Artinian test from functoriality for the endomorphism $\[ pi \]$, and pass to the formal base by compatible inverse limits. This statement does not apply absolute Frobenius to the dual-number algebra, which would send its scalar $epsilon.alt$ to zero.
  In $B_0$-bases write
  $ U = U_0 + epsilon.alt U_1 \, #h(2em) det_(B_0) \( U \) = a + epsilon.alt b . $
  Its underlying $A_0$-linear matrix has block form
  $ mat(delim: "(", U_0, 0; U_1, U_0) . $
  Consequently $0 = det_(A_0) \( U \) = a^2$. The ring $A_0$ is reduced, so $a = 0$. At the closed point, rank five forces elementary divisors $1 \, 1 \, epsilon.alt$ over $k \[ epsilon.alt \] \/ \( epsilon.alt^2 \)$. Thus $b$ is a unit.
  This division of the determinant is intrinsic. For a free rank-one $B_0$-module, multiplication by $epsilon.alt$ identifies its reduction modulo $epsilon.alt$ with its submodule multiplied by $epsilon.alt$. The determinant map just obtained has image in that submodule and kills $epsilon.alt$ times its source. Dividing and reducing therefore gives an isomorphism of the reduced determinant lines. Reversing it if necessary, we obtain a $cal(C)$-equivariant isomorphism
  $ phi.alt^(*) \( det M_0 \) arrow.r^(med tilde.equiv med) det M_0 . $
  Choose a generator $e$, with image of $1 ⊗ e$ equal to $a_0 e$, $a_0 in A_0^times$. After a finite extension of $k$, Hensel’s lemma gives a unit $b_0$ with $b_0^2 = a_0^(- 1)$. Replacing $e$ by $b_0 e$ makes it Frobenius-fixed. For $c in cal(C)$, write $c \( e \) = lambda_c e$. Equivariance gives $lambda_c^3 = lambda_c$, and a unit satisfying this identity in the local ring is $1$ or $- 1$. These scalars define a sign character $chi$. The cotangent weights in (3.12) are $2 \, 8$ and the Lie weight is one. Hence
  $ "wt"_T \( det M_0 \) = 2 + 8 + 3 = 13 med \( mod med 26 \) . $
  It remains to relate $M_0$ to $V$. Use the first principal-parts module of $L^(- 2)$, with its exact sequence
  $ 0 arrow.r Omega_(A_0 \/ k)^1 ⊗ L^(- 2) arrow.r P_(A_0 \/ k)^1 \( L^(- 2) \) arrow.r L^(- 2) arrow.r 0 . $
  The jet map is linear over cubes, since $d \( f^3 \) = 0$. Thus coefficient evaluation induces an $A_0$-linear, $cal(C)$-equivariant map
  $ A_0 ⊗_K V arrow.r P_(A_0 \/ k)^1 \( L^(- 2) \) . $
  Functoriality of principal parts includes simultaneous changes of the base and the line trivialization, so the asserted equivariance is independent of the chosen period. Using the basis whose scalar evaluations are $1 \, r_1 \, r_2$, its matrix of values and derivatives is
  $ mat(delim: "(", 1, r_1, r_2; 0, 1, 0; 0, 0, 1) . $
  It is therefore an isomorphism. Taking determinants and using (3.12) gives
  $ det \( A_0 ⊗_K V \) tilde.equiv L^(- 6) det Omega_(A_0 \/ k)^1 tilde.equiv L^(- 9) chi . $
  Finally restrict to $D'$. The invariant element $theta$ is primitive and gives a trivial subline; in principal parts its transverse derivative is nonzero even though its value on the curve is zero. Taking the quotient by this subline gives $D' ⊗_(S_0) W$. Its determinant is unchanged, proving (3.10). ◻
]

#thm([Theorem 3.12.])[
  (Equivariant vanishing and invariant vectors).  #emph[For every integer $n$, including after meromorphic localization, 
$ "Hom"_(cal(C) \, S_0) \( W \, P_n \) = 0 . $

 Every nonzero invariant integral vector in $W P_n$ evaluates as a constant multiple of $h^d$, where 
$ 8 d = 2 - 3 n \, #h(2em) d gt.eq 0 . $

 If $h$ occurs in $W P_(- 2)$, the corresponding line 
$ ell = h P_2 subset W $

 is primitive and stable. After extension to $D'$, its quotient has character $w^(- 15) chi$. More generally, if $h^(1 + 3 k)$ occurs in $W P_(- 2 - 8 k)$, $k gt.eq 0$, then $h$ already occurs in $W P_(- 2)$.]
] <coef:hom-vanishing>

#proof[
  For a rank-two module,
  $ W^or tilde.equiv W ⊗ \( det W \)^(- 1) . $
  An equivariant homomorphism $W arrow.r P_n$ is an invariant vector in $W^or P_n$. Extend its determinant line to the curve and use Lemma 27, together with the injective evaluation of Theorem 24. The vector then evaluates injectively in
  $ w^(- 2) w^9 chi thin w^(3 n) = w^(7 + 3 n) chi . $
  Tensoring the evaluation by a line over the smaller cube ring preserves this injectivity: after extending and trivializing the line, all values acquire the same nonzero factor. The argument does not assert injectivity after arbitrary extension of coefficients in the two-dimensional source. Lemma 26 rules out the resulting invariant section and proves the vanishing.
  A vector in $W P_n$ evaluates in $w^(3 n - 2)$. Lemma 26 gives exactly $8 d = 2 - 3 n$, and integrality gives $d gt.eq 0$. If $h$ occurs, the generator $q^2 h$ of the indicated submodule of $W$ has scalar valuation one. It cannot be divisible by a nonunit of $S_0 = k \[ \[ tau^3 \] \]$, since such divisibility would raise both coefficients in the valuation-zero/valuation-one basis by at least three. Thus the line is primitive. The section $h$ is invariant and $P_2$ extends to $w^6$. The line is consequently stable with extended character $w^6$; division of $w^(- 9) chi$ by this character gives $w^(- 15) chi$ for the quotient.
  For the final assertion, multiply the vector by $q^(2 + 8 k)$ to regard it as an element of $W$. Its evaluation is
  $ \( q^2 h \) thin \( q^8 h^3 \)^k . $
  Here $q^8 h^3$ is the scalar parameter $tau^3$ of $S_0$. The evaluation has order $1 + 3 k$. In the basis of values of orders zero and one, distinct residue classes modulo three prevent leading-term cancellation. Both coefficients are therefore divisible by $tau^(3 k)$. Dividing within $W$ gives the vector $q^2 h$, or equivalently $h in W P_(- 2)$. ◻
]

== 4 The topological Tate calculation for the subgroup of order three <sec:subgroup>

We now determine the part of the $H$-homotopy fixed point spectral sequence needed for ascent to $G$, where

$ H = chevron.l sigma chevron.r = C_3 subset G = chevron.l g chevron.r = C_9 \, #h(2em) sigma = g^3 . $

Hill’s report on joint work with Hopkins and Ravenel [14] pp. 2699–2700, Propositions 2–3 sketches the $C_p$ calculation at heights $\( p - 1 \) f$, conditional on Hopkins’s coefficient-action conjecture. Here the required finite-page statements follow from the completed coefficient model and fixed geometry of Section 3, together with the finite Euler bound of Section 2.

Throughout this section, $E_r \( H \)$ denotes the #emph[topological] Euler-localized homotopy fixed point spectral sequence. Its differentials have bidegree $\( r \, r - 1 \)$ in cohomological filtration and internal degree. The complete-local coefficient spectral sequence of Section 3 has already been evaluated; none of its differentials is being relabelled as a differential of $E_r \( H \)$.

We recall the notation and consequences of Theorems 20, 24, and 28. We have

$ "(4.1)" quad E_2 \( H \) = K \[ q^(plus.minus 1) \, b^(plus.minus 1) \] ⊗_K Lambda_K \( V \) \, #h(2em) K = k \[ \[ n_1 \, n_2 \] \] \, #h(2em) k = upright(bold(F))_(3^6) \, $ <h:e2>

where

$ \| q \| = \( 0 \, - 6 \) \, #h(2em) \| b \| = \( 2 \, 0 \) \, #h(2em) \| V \| = \( 1 \, 4 \) . $

The free $K$-module $V$ of rank three has a $T = upright(bold(F))_27^times$-weight basis $v \, theta \, y$ of weights $- 2 \, 0 \, 6$, respectively. The class $theta$ is the restriction of the first strict coordinate-change cocycle, with a nonzero scalar normalization permitted. In particular, it is fixed by the centralizer $cal(C) = C_(cal(O)_D^times) \( H \)$. Modulo $frak(n) = \( n_1 \, n_2 \)$, the action of $g$ on $V$ is one Jordan block: $theta$ is fixed, $g \( y \) - y$ is a nonzero multiple of $theta$, and $g \( v \) - v$ has a nonzero $y$-coefficient. The tangent weights of $K$ are $6$ and $- 2$.

The coefficient classes in $K$ and the class

$ "(4.2)" quad A = q b^(- 2) \, #h(2em) \| A \| = \( - 4 \, - 6 \) \, $ <h:a>

are cycles on every page on which they occur, by Lemma 22. Here $A$ is a unit on the nonzero localized pages. This assertion concerns the norm class divided by an Euler square; it does not assert that $q$ or $b$ is separately a permanent cycle.

Let $h_1$ be the first Hasse section on the fixed formal-module deformation. As in Section 3, put

$ "(4.3)" quad J = h_1^3 in K q^(- 2) \, #h(2em) F = q^2 J in K \, #h(2em) S_0 = K \/ \( F \) \, #h(2em) W = \( V \/ K theta \) ⊗_K S_0 . $ <h:curve-data>

The element $F$ is a regular parameter. Write $P_n$ for the scalar line $K q^n$, or its base change to $S_0$ when working on the curve. On the reduced height-two curve, whose ring is denoted by $D'$, the second Hasse section $h$ has Lie line $w^(- 8)$ and is a parameter after trivializing that line. The inclusion $S_0 tilde.eq \( D' \)^3$ and the evaluation of $W$ give the following rules:

+ There is no $cal(C)$-equivariant $S_0$-linear homomorphism $W arrow.r P_n$, even after passing to meromorphic sections.
+ An invariant integral vector in $W P_n$ evaluates, if nonzero, to a constant multiple of $h^d$, where
  $ "(4.4)" quad 8 d = 2 - 3 n \, #h(2em) d gt.eq 0 . $ <h:hasse-rule>
+ If $h$ occurs primitively in $W P_(- 2)$, it defines a stable line $ell = h P_2 subset W$. After extension to $D'$, the quotient $W \/ ell$ has character $w^(- 15) chi$, where $chi$ is a nontrivial sign character. A meromorphic invariant section with this sign twist does not exist.

The two evaluated basis values of $W$, after the common Lie factor is removed, have orders $0$ and $1$. Their coefficients lie in the cube ring, so their possible leading orders have different residues modulo three. We will use this fact when dividing an invariant vector by a power of the curve parameter.

Only differential lengths congruent to $1$ modulo $4$ occur. Indeed, the central stabilizer element $- 1$ acts trivially on the ungraded deformation ring and by $- 1$ on its Lie line. It therefore acts on $E_t$ by $\( - 1 \)^(t \/ 2)$. Evenness first forces $r$ odd, and naturality for this central action then forces $\( - 1 \)^(\( r - 1 \) \/ 2) = 1$ for a nonzero $d_r$. Thus $r equiv 1 med \( mod med 4 \)$. Moreover, Proposition 16 implies that the unit of $E_r \( H \)$ is hit by a differential of length at most $157$. Indeed, the actual Euler class has $79$th power zero, its power symbol has filtration $158$, and the finite skeletal tower then gives an incoming differential of length at most $158$; the congruence on lengths improves this to $157$. All uses of this bound below are statements about finite pages.

=== 4.1 The first two topological differentials <the-first-two-topological-differentials>

#thm([Lemma 4.1.])[
  #emph[With compatible nonzero scalar normalizations, the images of the indicated Greek-letter classes are 
$ alpha_1 = theta \, #h(2em) beta_1 = b J \, #h(2em) beta_(3 \/ 3) = b J^3 \, #h(2em) beta_4 = plus.minus b J^5 . $

 In particular, 
$ "(4.5)" quad d_5 \( b \) = theta b^3 \, #h(2em) d_5 \( theta \) = 0 . $ <h:d5-b>

]
] <h:greek-evaluation>

#proof[
  Evaluate the integral Bockstein representatives on the fixed deformation over $D_0 = W \( k \) \[ zeta_3 \] \[ \[ r_1 \, r_2 \] \]$. The coefficient lines in the three even degrees under consideration have trivial $H$-action. In the cyclic resolution, the connecting map for reduction modulo three is therefore $b$ times the value of the intermediate one-cocycle at $sigma$. This is an integral connecting-map calculation before reduction by the uniformizer $zeta_3 - 1$.
  Modulo that uniformizer, the formal-module relation $\( sigma - 1 \)^2 = - 3 sigma$ gives
  $ v_1 = 0 \, #h(2em) v_2 = - t_1 \( sigma \)^4 . $
  The intermediate $v_1$-Bocksteins for $v_2$, $v_2^3$, and $v_2^4$ therefore have values, respectively,
  $ t_1 \( sigma \)^3 \, #h(2em) t_1 \( sigma \)^9 \, #h(2em) plus.minus t_1 \( sigma \)^15 . $
  For example, the last value is the reduction of $4 v_2^3 t_1 \( sigma \)^3$, and the middle value follows by cubing the right-unit difference before dividing by $v_1^3$. These calculations can use Hazewinkel generators; changing to the Araki parameters of the fixed-geometry calculation leaves these reductions unchanged. The scalar-cohomology evaluation in Theorem 24 is injective, giving the asserted classes in (4.1).
  We use the classical Adams–Novikov differentials
  $ "(4.6)" quad d_5 \( beta_(3 \/ 3) \) = upright("unit") dot.op alpha_1 beta_1^3 \, #h(2em) d_9 \( alpha_1 beta_4 \) = upright("unit") dot.op beta_1^6 \, $ <h:classical-differentials>
  and the permanence of $alpha_1$ and $beta_1$; see [5] Lemma 2.5 and Table 1. The comparison of Section 2 carries these formulas to the present spectral sequence. Since $beta_(3 \/ 3) = b^(- 2) beta_1^3$, the first formula gives $d_5 \( b \) = theta b^3$ after normalizing $theta$. Cancellation by $beta_1^3$ is valid on this page: its scalar factor is nonzero in the domain $K \[ q^(plus.minus 1) \, b^(plus.minus 1) \]$, and the exterior algebra is free over that domain. Permanence of $alpha_1$ gives $d_5 \( theta \) = 0$. ◻
]

We first determine $d_5$ on the remaining exterior classes without assuming its value. Write

$ d_5 \( z \) = b^2 Phi \( z \) \, #h(2em) Phi : V arrow.r Lambda^2 V . $

The map is $K$-linear because $K$ consists of cycles. Modulo $frak(n)$, the $T$-weights allow only $v mapsto lambda_v theta v$ and $y mapsto lambda_y theta y$. Equivariance for the residual Jordan action of $g$ gives $lambda_v = lambda_y$. There are no linear coefficient corrections: comparing the weights of $v \, y$ with those of $theta v \, theta y \, v y$ shows that none of the required additional weights is $6$ or $- 2$. Thus

$ "(4.7)" quad Phi equiv lambda_0 thin theta and \( - \) med \( mod med frak(n)^2 \) \, #h(2em) lambda_0 in k . $ <h:phi-initial>

Set

$ hat(V) = b^(- 1) V \, #h(2em) Theta = b^(- 1) theta \, #h(2em) mu = lambda_0 - 1 . $

On $K \[ A^(plus.minus 1) \, b^(plus.minus 1) \] ⊗ Lambda \( hat(V) \)$, the normalized derivation $d = b^(- 3) d_5$ satisfies

$ "(4.8)" quad d b = b Theta \, #h(2em) d Theta = 0 \, #h(2em) d \|_(hat(V)) = Psi \, #h(2em) Psi equiv mu Theta and \( - \) med \( mod med frak(n)^2 \) . $ <h:normalized-d5>

Here $Psi$ extends as an exterior derivation, and $Psi^2 = 0$. In a fixed $b$-exponent sector $i$, the exterior complex is therefore

$ "(4.9)" quad #scale(x: 120%, y: 120%)[\(] Lambda \( hat(V) \) \, #h(0em) Psi + i Theta and \( - \) #scale(x: 120%, y: 120%)[\)] . $ <h:sector-complex>

#thm([Lemma 4.2.])[
  #emph[On the cohomology of (4.9), the operation $kappa = A^2 d_9$ preserves both the $A$- and $b$-exponents and lowers exterior degree by one. It is a derivation and satisfies 
$ "(4.10)" quad kappa \( Theta \) = c F \, #h(2em) c in k^times . $ <h:kappa-theta>

]
] <h:normalized-d9>

#proof[
  The bidegree of $kappa$ is $\( 1 \, - 4 \)$. A monomial $A^a b^i Lambda^j hat(V)$ has bidegree $\( - 4 a + 2 i - j \, - 6 a + 4 j \)$. If $Delta a \, Delta i \, Delta j$ are the changes under $kappa$, then
  $ - 4 Delta a + 2 Delta i - Delta j = 1 \, #h(2em) - 6 Delta a + 4 Delta j = - 4 . $
  The first equation makes $Delta j$ odd; the second makes $Delta j equiv - 1 med \( mod med 3 \)$. Since $0 lt.eq j lt.eq 3$, the only possibility is $Delta j = - 1$, and then $Delta a = Delta i = 0$. Multiplication by the cycle $A^2$ preserves the derivation rule.
  The scalar cohomology of $d_5$ is $K \[ A^(plus.minus 1) \, B^(plus.minus 1) \]$, where $B = b^3$, and it has no incoming $d_5$ boundaries. In particular,
  $ beta_1 = A^(- 2) B^(- 1) F $
  is a non-zero-divisor on this scalar cohomology. The image of $alpha_1 beta_4$ is, up to scalar, $B^(- 1) Theta beta_1^5$. The second formula of (4.6), and the absence of a $d_9$ target for $B$, therefore give
  $ B^(- 1) d_9 \( Theta \) beta_1^5 = upright("unit") dot.op beta_1^6 . $
  Cancelling the regular scalar factor proves $d_9 \( Theta \) = c A^(- 2) F$. ◻
]

#thm([Lemma 4.3.])[
  #emph[One has $mu in upright(bold(F))_3^times$; in integer exponents we use its representative $1$ or $- 1$. Moreover, 
$ Psi = mu Theta and \( - \) $

 on the complementary two-plane, and 
$ "(4.11)" quad E_6 \( H \) & = K \[ A^(plus.minus 1) \, B^(plus.minus 1) \] ⊗ Lambda #scale(x: 120%, y: 120%)[\(] Theta \, b^(- 1 - mu) \( V \/ K theta \) #scale(x: 120%, y: 120%)[\)] \,\
E_10 \( H \) & = S_0 \[ A^(plus.minus 1) \, B^(plus.minus 1) \] ⊗ Lambda #scale(x: 120%, y: 120%)[\(] b^(- 1 - mu) W #scale(x: 120%, y: 120%)[\)] . $ <h:e6>

 The $d_9$ is the Koszul differential on $Theta \, F$ and is zero on the other displayed generators.]
] <h:mu-and-matrix>

#proof[
  Suppose first that $mu = 0$, and put $z = Theta hat(v) hat(y)$ in exponent sector zero. Every boundary in this sector lies in $frak(n)^2$. Since $Theta z = 0$, the derivation rule and (4.10) give
  $ "(4.12)" quad Theta kappa \( z \) = c F z $ <h:mu-zero-identity>
  in cohomology. Choose a $T$-weight representative for $kappa \( z \)$. Its weight is $10$: $z$ has weight $4$ and multiplication by $A^2$ adds weight $6$. The exterior-two basis weights are
  $ upright("basis vector") & Theta hat(v) & Theta hat(y) & hat(v) hat(y)\
upright("weight") & - 2 & 6 & 4 . $
  There is no constant term of weight $10$, and the only possible linear term is a multiple of $F hat(v) hat(y)$, because the coefficient tangent weights are $6 \, - 2$. Equation (4.12) fixes its coefficient, so
  $ kappa \( z \) equiv c F hat(v) hat(y) med \( mod med frak(n)^2 \) . $
  Both $g A \/ A$ and the determinant of $g$ on $hat(V)$ are $1$ modulo $frak(n)$, and $g F equiv F med \( mod med frak(n)^2 \)$. Equivariance of $d_9$ therefore makes this representative $g$-fixed modulo $frak(n)^2$. On the other hand, the residual Jordan action makes $g \( hat(v) hat(y) \) - hat(v) hat(y)$ have a nonzero $Theta hat(v)$-coefficient. Since $F$ is a parameter, this is a contradiction. Thus $mu eq.not 0$.
  Choose a complement to $K Theta$ and write
  $ Psi \( z' \) = Theta M_0 \( z' \) + c_0 \( z' \) hat(v) hat(y) $
  on that complement, with $M_0 equiv mu I med \( mod med frak(n)^2 \)$. The exterior-three component of $Psi^2 \( z' \) = 0$ is
  $ c_0 #scale(x: 120%, y: 120%)[\(] \( "tr" M_0 - M_0 \) z' #scale(x: 120%, y: 120%)[\)] = 0 . $
  The matrix $"tr" M_0 - M_0$ has invertible reduction $mu I$, so $c_0 = 0$.
  If $mu in.not upright(bold(F))_3$, the complementary exterior-one and exterior-two terms in every sector are paired with their $Theta$-multiples by invertible matrices: their reductions are $i + mu$ and $i + 2 mu$, for $i in upright(bold(F))_3$. Only the scalar and $Theta$ terms in sector zero remain. The differential (4.10) then leaves only the even algebra $S_0 \[ A^(plus.minus 1) \, B^(plus.minus 1) \]$. It has no odd class capable of hitting the unit on a later page, contradicting the Euler bound. Hence $mu in upright(bold(F))_3^times$.
  It remains to remove possible higher coefficient corrections to $M_0$. In sector $i = - mu$ put $N = M_0 - mu I$. The complementary exterior-one and exterior-two cohomology groups are $ker N$ and $"coker" N$, respectively; multiplication by $Theta$ is the natural map $ker N arrow.r "coker" N$. For a class $alpha in "coker" N$, one has $Theta alpha = 0$. Applying $kappa$ shows that $c F alpha$ lies in the image of this natural map. In particular, the two standard cokernel generators have lifts $k_1 \, k_2 in ker N$ such that
  $ k_j equiv c F e_j med \( mod med "im" N \) . $
  Every entry of $N$ lies in $frak(n)^2$, so the matrix with columns $k_1 \, k_2$ is $c F I$ modulo $frak(n)^2$. Its determinant has nonzero initial form $c^2 F^2$. The two columns thus have full rank over $"Frac" K$, and $N = 0$.
  The cohomology of (4.9) now gives (4.11). The quotient notation $V \/ K theta$ is independent of the chosen complement: changing a lift by a multiple of $Theta$ changes the corresponding cycle by a boundary in its nonzero sector. The operation $kappa$ vanishes on the two complementary generators because it preserves their nonzero exponent sector, where no scalar cohomology occurs. It also vanishes on $A$ and $B$. Finally, $F$ is regular, so taking the Koszul cohomology of $d_9 \( Theta \) = c A^(- 2) F$ proves (4.11). ◻
]

=== 4.2 Degree restrictions on the remaining plane <degree-restrictions-on-the-remaining-plane>

For a component of exterior degree $j in { 0 \, 1 \, 2 }$, introduce raw coordinates

$ "(4.13)" quad m = frac(s - j, 2) \, #h(2em) n = frac(4 j - t, 6) . $ <h:raw-coordinates>

Thus its underlying form is $b^m P_n Lambda^j W$. It occurs on (4.11) precisely when

$ "(4.14)" quad 3 p = m + 2 n + \( 1 + mu \) j \, #h(2em) p in upright(bold(Z)) . $ <h:p-coordinate>

Here $p$ is the exponent of $B$ after extracting the indicated $A$ and exterior factors. It is not a prime or a Kervaire index.

An increasing differential must have $Delta j = 1$, and a decreasing one must have $Delta j = - 1$. Solving the two degree equations gives

$ "(4.15)" quad r & Delta j & Delta n & Delta p\
12 l + 5 & 1 & - 2 l & \( 2 l + 3 + mu \) \/ 3\
12 l + 9 & - 1 & - 2 l - 2 & \( 2 l - mu \) \/ 3 . $ <h:degree-rules>

The integrality condition in the first row is $2 l + mu equiv 0 med \( mod med 3 \)$, and in the second it is $2 l - mu equiv 0 med \( mod med 3 \)$. These exhaust the possibilities: an odd filtration change makes $Delta j$ odd, and the exterior degree is between zero and two. In the interval $9 < r lt.eq 157$ the raw lists are

$ "(4.16)" quad mu & upright("increasing") & upright("decreasing")\
1 & 17 \, 53 \, 89 \, 125 & 33 \, 69 \, 105 \, 141\
- 1 & 29 \, 65 \, 101 \, 137 & 21 \, 57 \, 93 \, 129 . $ <h:length-table>

Before the first further change, decreasing maps are excluded by the no-homomorphism rule for $W$. This also excludes a map from the exterior square to the plane, since $"Hom" \( det W \, W P_n \) tilde.eq W^or P_n$. An increasing map from scalars to the plane requires an invariant vector in $W P_(- 2 l)$. The same condition governs maps from the plane to its determinant, by wedge pairing. Equation (4.4) therefore requires

$ "(4.17)" quad 8 d = 2 + 6 l \, #h(2em) l = 1 + 4 k_0 \, #h(2em) d = 1 + 3 k_0 . $ <h:first-hasse-degree>

Combining this with (4.16) and the Euler bound shows that the first nonzero change is $d_17$ for $mu = 1$, or $d_65$ for $mu = - 1$.

In either case a primitive vector representing $h$ exists in $W P_(- 2)$, by Theorem 28. Indeed, the nonzero differential supplies a vector evaluating to $h^(1 + 3 k_0)$. After multiplication by the appropriate power of the unit $q$, express it in the two evaluation basis values of orders zero and one. The coefficients are cube series. Since the two possible leading orders are distinct modulo three, a value of order $1 + 3 k_0$ forces both coefficients to be divisible by the $k_0$th power of the scalar parameter cube. Dividing gives a vector evaluating to $h$, and its order one makes it primitive.

Consequently define

$ "(4.18)" quad ell = h P_2 subset W \, #h(2em) Z = q^8 h^3 in S_0 \, #h(2em) Y = b^(- 1 - mu) q^2 h \, #h(2em) X = b^(- 1 - mu) v . $ <h:xyz>

The scalar $Z$ is a parameter of $S_0$. In this notation $h$ denotes the invariant vector just constructed, whereas $h^3$ denotes the scalar Hasse section in $P_(- 8)$; these are compatible evaluations, not an exterior cube of a vector.

Invariant meromorphic functions on the curve are constant. Therefore the first nonzero differential, with the common factor $A^(- 2 l) B^(Delta p)$ suppressed, has the form

$ "(4.19)" quad frac(d B, B) = epsilon.alt Z^(k_0) Y \, #h(2em) d X = eta Z^(k_0) Y X \, #h(2em) d Y = 0 \, #h(2em) epsilon.alt \, eta in k \, $ <h:first-plane-differential>

with $epsilon.alt \, eta$ not both zero. The exterior-square formula is the wedge pairing with the same invariant line. In exponent $p$, the scalar-to-$Y$ and $X$-to-$Y X$ coefficients are thus

$ "(4.20)" quad p epsilon.alt Z^(k_0) \, #h(2em) \( p epsilon.alt + eta \) Z^(k_0) . $ <h:first-plane-coefficients>

#thm([Lemma 4.4.])[
  #emph[The case $mu = - 1$ is impossible.]
] <h:exclude-minus>

#proof[
  In this case the first change has length $65$ and $k_0 = 1$. The only later possible lengths up to the bound are $93 \, 101 \, 129 \, 137$. The coefficients in (4.20) are constants times $Z$. Hence every $E_66 \( H \)$ component is a direct sum of free $S_0$-modules and modules killed by $Z$, and the scalar components are free. Generically the plane component in a sector is the whole plane $W$, the line $ell$, the quotient $W \/ ell$, or zero.
  At length $93$, the plane-to-scalar map is zero. For the whole plane this follows from the no-homomorphism rule; for the quotient it follows from the sign obstruction. For the line, $l = 7$ in (4.15), so a contraction would require a meromorphic invariant in
  $ "Hom" \( P_2 \, P_(- 16) \) = P_(- 18) . $
  Its Lie exponent is $- 54$, which is not divisible by eight. Thus the map is zero generically, and it is zero integrally because its scalar target is torsion-free.
  Only a decreasing differential can hit the unit, so it would have to be $d_129$. Its source has exterior degree one and $n = 22$. We may choose a $T$-invariant source representative, since $\| T \| = 26$ is invertible in $k$. The two coefficient weights before quotienting are $3 n - 2$ and $3 n + 6$, while $Z$ has weight $- 2$. Consequently the orders of invariant coefficients at $n = 22$ satisfy
  $ 66 - 2 - 2 a equiv 0 med \( mod med 26 \) quad upright("or") quad 66 + 6 - 2 a equiv 0 med \( mod med 26 \) . $
  They are respectively $6$ and $10$ modulo $13$. Thus every such representative on $E_66 \( H \)$ is divisible by $Z^6$ within its component. This statement also holds for subquotient components: averaging lifts an invariant class to an invariant representative, and the displayed orders give the divisibility before passage to the quotient.
  There is no outgoing $d_93$ on a plane component. Therefore the $E_94 \( H \)$ plane is a quotient of the preceding plane, and every potential unit source still has a representative $Z^6 e$. There may be incoming $d_93$ maps from exterior degree two; their images do not affect this conclusion. The exterior-two group, in contrast, is a submodule of its $E_66 \( H \)$ predecessor, since no exterior-three group can map into it. Its torsion is consequently still killed by $Z$.
  Suppose that $Z^6 e$ is a $d_101$-cycle. Then $Z^6 d_101 \( e \) = 0$, and the preceding torsion statement gives $Z d_101 \( e \) = 0$. Hence $Z e$ is also a cycle, and on $E_102 \( H \)$
  $ \[ Z^6 e \] = Z^5 \[ Z e \] . $
  There is no change between this page and $E_129 \( H \)$. The scalar groups have received no $d_93$ and have only been replaced by submodules under $d_101$; their unit is not divisible by $Z$. Since $Z$ is a cycle, a $Z$-divisible source cannot map to that unit. Thus $d_129$ cannot hit it. The increasing length $137$ cannot do so either, contradicting the bound $157$. ◻
]

=== 4.3 The forced contractions and the last differential <the-forced-contractions-and-the-last-differential>

We henceforth have $mu = 1$, so the first change is at length $17$, $k_0 = 0$, and $\| X \| = \| Y \| = \( - 3 \, 4 \)$.

#thm([Lemma 4.5.])[
  #emph[One has $epsilon.alt eq.not 0$ and $eta \/ epsilon.alt = 2$. After rescaling $h$, the $d_17$ coefficients in (4.20) are $p$ and $p - 1$. The next nonzero change is $d_33$, which contracts the surviving $ell$-generator by a unit times $Z$. Its cohomology is 
$ "(4.21)" quad E_34 \( H \) = k \[ A^(plus.minus 1) \, C^(plus.minus 1) \] ⊗ Lambda \( U \) \, #h(2em) C = B^3 = b^9 \, #h(2em) U = B X . $ <h:e34>

]
] <h:d17-d33>

#proof[
  All nonzero coefficients of $d_17$ in (4.20) are units, so its cohomology is torsion-free over $S_0$. If $epsilon.alt = 0$, then $eta eq.not 0$ and the $X \, Y X$ terms disappear, leaving the exterior algebra on $Y$ over $S_0 \[ A^(plus.minus 1) \, B^(plus.minus 1) \]$. If $epsilon.alt eq.not 0$ but $eta \/ epsilon.alt in.not upright(bold(F))_3$, the $X \, Y X$ terms again disappear; the surviving algebra is exterior on $B^2 Y$ over $S_0 \[ A^(plus.minus 1) \, B^(plus.minus 3) \]$.
  In the remaining cases let $p_x in { 0 \, 1 \, 2 }$ represent $- eta \/ epsilon.alt in upright(bold(F))_3$ and set $C = B^3$. The cohomology is
  $ "(4.22)" quad S_0 \[ A^(plus.minus 1) \, C^(plus.minus 1) \] ⊗ Lambda \( B^2 Y \, B^(p_x) X \) . $ <h:e18-algebra>
  Its scalar, line, quotient, and product supports in the $p$ coordinate are respectively
  $ "(4.23)" quad 0 \, #h(2em) 2 \, #h(2em) p_x \, #h(2em) p_x + 2 med \( mod med 3 \) . $ <h:e18-support>
  If $p_x = 2$, the two plane columns align and together carry the corresponding shifted $W$-action. If $p_x eq.not 2$, the second column carries the quotient $W \/ ell$: the $ell$ component of a changed lift lies in a sector killed by the preceding differential.
  We check all further operations before any other change. An increasing map involving the line is the invariant-vector problem for $ell P_(- 2 l)$; after evaluation it has the same condition $l equiv 1 med \( mod med 4 \)$ as (4.17). This also governs maps from the quotient to the determinant. Increasing maps to the quotient, or from the line to the determinant, have the nontrivial sign twist and vanish. The full-plane case has the original invariant-vector condition. None of the remaining increasing lengths $53 \, 89 \, 125$ satisfies it.
  For a decreasing map, contraction on $ell = h P_2$ has coefficient line
  $ "(4.24)" quad "Hom" \( P_2 \, P_(- 2 l - 2) \) = P_(- 2 l - 4) . $ <h:line-contraction>
  The Hasse rule makes $l equiv 2 med \( mod med 4 \)$; among the decreasing lengths in (4.16), only $33$ meets this condition. The same condition governs contraction from the determinant to the quotient. The other two line/quotient possibilities have the sign obstruction, and the aligned full-plane possibilities vanish by the no-homomorphism rule. Thus the aligned case $p_x = 2$ admits no further differential within the bound and is impossible.
  The $d_33$ must therefore occur. Its coefficient is a nonzero constant times $h^3$, by (4.24) with $l = 2$. In the algebra (4.22), this says
  $ "(4.25)" quad d_33 \( B^2 Y \) = a A^(- 6) C Z \, #h(2em) d_33 \( B^(p_x) X \) = 0 \, #h(2em) a in k^times \, $ <h:d33-explicit>
  for $p_x = 0$ or $1$. The map on the product follows by the derivation rule. The factors $A^(- 6)$ and $C$ are surviving units. In the $epsilon.alt = 0$ case the corresponding formula is $d_33 \( Y \) = a A^(- 6) B Z$; in the other one-generator case it is the first formula of (4.25). Either one-generator case would consequently leave only an even scalar algebra, incapable of killing the unit later. This excludes both of those cases and proves $epsilon.alt eq.not 0$ and $p_x in { 0 \, 1 }$.
  Taking cohomology of (4.25) gives
  $ k \[ A^(plus.minus 1) \, C^(plus.minus 1) \] ⊗ Lambda \( B^(p_x) X \) . $
  The remaining odd coefficient has residual $T$-weight $- 2$ in the $W$ line. An increasing map now requires
  $ 3 n equiv 3 \( n - 2 l \) - 2 med \( mod med 26 \) \, quad upright("equivalently") quad 6 l + 2 equiv 0 med \( mod med 26 \) \, $
  and a decreasing map requires
  $ 3 n - 2 equiv 3 \( n - 2 l - 2 \) med \( mod med 26 \) \, quad upright("equivalently") quad 6 l + 4 equiv 0 med \( mod med 26 \) . $
  Within the bound, these leave only lengths $53$ and $105$, respectively. Only the latter can hit the unit. At length $105$ the shift is $Delta p = 5$, so a source in the odd support $p_x$ can land in scalar support zero only if $p_x = 1$. Thus $eta \/ epsilon.alt = 2$, and setting $U = B X$ gives (4.21). Rescale $h$ to absorb $epsilon.alt$ in (4.19); then the two $d_17$ coefficients become $p$ and $p + 2 = p - 1$. ◻
]

#thm([Proposition 4.6.])[
  #emph[The only possible differential between $E_34 \( H \)$ and $E_105 \( H \)$ is 
$ "(4.26)" quad d_53 \( C \) = e_53 A^(- 8) C^2 U \, #h(2em) d_53 \( U \) = 0 \, #h(2em) e_53 in k . $ <h:d53>

 The class $A^18 C^(- 2) U$ survives to $E_105 \( H \)$, and 
$ "(4.27)" quad d_105 \( A^18 C^(- 2) U \) in k^times . $ <h:d105>

 In particular, $E_106 \( H \) = 0$.]
] <h:unit-death>

#proof[
  The possible lengths were determined in the proof of Lemma 33. Since
  $ \| C \| = \( 18 \, 0 \) \, #h(2em) \| U \| = \( 3 \, 4 \) \, #h(2em) \| A \| = \( - 4 \, - 6 \) \, $
  the increasing length $53$, together with the derivation rule, has exactly the form (4.26). Its scalar is an element of $k$, and there is no exterior-two group to receive $d_53 \( U \)$.
  If $e_53 = 0$, the algebra (4.21) persists until length $105$. If $e_53 eq.not 0$, then
  $ d_53 \( C^a \) = a e_53 A^(- 8) C^(a + 1) U . $
  The surviving scalar exponents are $a equiv 0 med \( mod med 3 \)$, and the surviving odd exponents are $a equiv 1 med \( mod med 3 \)$. Thus
  $ "(4.28)" quad E_54 \( H \) = k \[ A^(plus.minus 1) \, C^(plus.minus 3) \] ⊗ Lambda \( C U \) #h(2em) \( e_53 eq.not 0 \) . $ <h:e54-nonzero>
  In particular, the notation $C^(- 2) U$ still denotes a well-defined surviving class: in (4.28) it means $\( C^3 \)^(- 1) \( C U \)$. Only the surviving Laurent unit $C^3$ is inverted in this expression.
  The bidegree of $A^18 C^(- 2) U$ is $\( - 105 \, - 104 \)$, exactly the bidegree of a possible $d_105$ source for the unit. In either case its source group is one-dimensional. There is no other length after $33$ and at most $157$ that can hit the unit. The Euler bound therefore forces (4.27). Since every nonzero scalar is a unit, the derivation rule makes the cohomology after this differential zero. Equivalently, if $e_53 = 0$ it pairs all odd and even Laurent slots, while if $e_53 eq.not 0$ it pairs the odd and even slots of (4.28). ◻
]

=== 4.4 The form used in ascent to the group of order nine <the-form-used-in-ascent-to-the-group-of-order-nine>

We collect the calculation in raw coordinates so that restriction and transfer do not require a new choice of generators. On the initial page allow $j = 0 \, 1 \, 2 \, 3$ and set

$ "(4.29)" quad w_0 = m + 2 n + 2 j . $ <h:w-coordinate>

After $d_5$, the complementary slots have $w_0 = 3 p$ and their $Theta$-multiples have $w_0 = 3 p + 1$. After $d_9$, only the former remain, modulo $F$.

#thm([Theorem 4.7.])[
  #emph[The $H$-Tate calculation has the following properties.]
  + #emph[The first differential is 
$ d_5 \( b^m q^n xi \) = \( m + 2 n + 2 j \) b^(m + 2) q^n theta and xi \, #h(2em) xi in Lambda^j V \, $

 up to a single nonzero scalar normalization. Its cohomology has generators $A \, B = b^3 \, Theta = b^(- 1) theta$ and $b^(- 2) \( V \/ K theta \)$ as in (4.11), with $mu = 1$. For a fixed $c in k^times$, the next differential is 
$ d_9 \( Theta \) = c A^(- 2) F = c b^4 J . $

 Equivalently, on surviving $Theta$-containing representatives, 
$ d_9 #scale(x: 120%, y: 120%)[\(] \[ b^m q^n theta and xi \] #scale(x: 120%, y: 120%)[\)] = c \[ b^(m + 5) q^n J xi \] \, $

 where $xi$ is a complementary exterior monomial. These raw products are interpreted in the $A \, B$ normal form: $A^(- 2)$ is a surviving unit, while $b^4$ and $J$ need not survive separately. Its cohomology is (4.11).]
  + #emph[The $d_17$ is wedge multiplication by the invariant Hasse vector $h$, with common unit shifts and coefficients $p$ on exterior degree zero and $p - 1$ on exterior degree one. Its survivors have supports 
$ upright("component") & p med \( mod med 3 \)\
upright("scalars") & 0\
ell & 2\
W \/ ell & 1\
det W & 0 . $

]
  + #emph[The nonzero $d_33$ contracts $ell$ to scalars and $det W$ to $W \/ ell$. Under the identifications by $h$ and $h and \( - \)$, respectively, these maps are multiplication by $h^3$, up to nonzero scalar units and the prescribed degree shifts. Only scalars at $p equiv 0$ and quotient classes at $p equiv 1$ remain, now over $S_0 \/ \( Z \) = k$.]
  + #emph[The remaining algebra and differentials are (4.21), (4.26), and (4.27). The coefficient $e_53$ has not been asserted nonzero in this subgroup calculation.]
] <h:differentials>

#proof[
  The preceding lemmas show that the exact normalized $d_5$ has $mu = 1$. Thus $d_5 \( z \) = 2 b^2 theta and z$ for $z in V$. Since $A = q b^(- 2)$ is a cycle, $d_5 \( q \) = 2 q b^2 theta$. The derivation rule gives the coefficient $m + 2 n + 2 j$ in part (1). In raw coordinates, the contraction $d_9 \( Theta \) = c A^(- 2) F$ is multiplication by $J = q^(- 2) F$ after restoring the corresponding $b$-shifts.
  Parts (2) and (3) are Lemma 33, with the supports read from (4.23) at $p_x = 1$. For the product-to-quotient map, apply the derivation rule to the nonzero line contraction; it becomes multiplication by the same scalar Hasse cube after using $h and \( - \)$ to identify the quotient with the determinant. Part (4) is Proposition 34. ◻
]

Two consequences specify the interface with the next section. First, for a Kervaire index $nu gt.eq 2$, a scalar class in the detector bidegree has $m = 1$ and $n = - 2 dot.op 3^nu$. Its $d_5$ coefficient is $1 - 4 dot.op 3^nu equiv 1 med \( mod med 3 \)$. A nonzero such scalar cannot be the restriction of a permanent detector. Second, the unit source in (4.27) has raw coordinates

$ "(4.30)" quad \( j \, m \, n \, w_0 \) = \( 1 \, - 53 \, 18 \, - 15 \) . $ <h:unit-source-raw>

The index $n$ is divisible by three. These coordinates will locate its transfer in the $G$ calculation, where the extra integral restriction kernels must be retained.

== 5 Ascent to the group of order nine <sec:ascent>

We now use the subgroup calculation to determine the fate of the height-six detectors. The argument takes place on finitely many pages of the Euler-localized spectral sequence. Its translation classes are units on those pages; no integer-graded periodicity assertion about the abutment is required.

#thm([Theorem 5.1.])[
  #emph[For every $dotless.j gt.eq 4$, the class $b_dotless.j in "Ext"_(cal(A)_3)^(2 \, 4 dot.op 3^(dotless.j + 1)) \( upright(bold(F))_3 \, upright(bold(F))_3 \)$ does not survive the classical Adams spectral sequence.]
] <g:tail-exclusion>

The proof will occupy this section. The classical survivor $b_2$, recalled in [1] Corollary 1.2, will be used to force an outgoing differential on an entire lattice of scalar classes. All the detectors with $dotless.j gt.eq 4$ belong to that lattice, whereas the detector for $b_3$ does not.

=== 5.1 Coordinates, twists, and translation classes <coordinates-twists-and-translation-classes>

Retain $G = chevron.l g chevron.r = C_9$, $H = chevron.l g^3 chevron.r = C_3$, and the coefficient notation of Sections 3 and 4. Put $Q = G \/ H$. On $Q$-modules write

$ D = g - 1 \, #h(2em) N = 1 + g + g^2 . $

Thus $D$ here is a difference operator, not a deformation ring. The coefficient-field notation is $k = upright(bold(F))_(3^6)$. Restriction and additive transfer between the localized spectral sequences will be denoted $"res"$ and $"tr"$.

Keep the initial $H$ exterior-degree coordinate $j in { 0 \, 1 \, 2 \, 3 }$. The other coordinates are determined by

$ "(5.1)" quad s = 2 m + j \, #h(2em) t_(upright(i n t)) = 4 j - 6 n \, #h(2em) w_0 = m + 2 n + 2 j \, #h(2em) r_0 = w_0 - j med \( mod med 3 \) . $ <g:coordinates>

Here $s$ is cohomological filtration and $t_(upright(i n t))$ is internal degree. The parity of $s$ and the residue of $t_(upright(i n t))$ modulo six determine $j$ uniquely among $0 \, 1 \, 2 \, 3$. Consequently the coordinates distinguish all the types that occur. We reserve $dotless.j$ for a Kervaire index.

Besides faithful Euler localization, include all powers of $u' = u_(lambda')$, where $lambda' = lambda^3$ and $lambda$ is the faithful complex $G$-character used earlier. The variable $u'$ is the orientation symbol for the dimension-zero shift $2 - lambda'$. Its restriction to $H$ is the trivial orientation. We write $i in upright(bold(Z))$ for the total exponent of $u'$ in a homogeneous symbol. Write

$ B = b^3 \, #h(2em) C = b^9 \, #h(2em) Delta = product_(a = 0)^8 x_a . $

In particular $"res" \( Delta \) = q_0 q_1 q_2$ on cohomology.

#thm([Lemma 5.2.])[
  #emph[On every nonzero page the class 
$ "(5.2)" quad cal(D) = Delta b^(- 6) u' ""^2 $ <g:Delta-unit>

 is a cycle and a unit. Constants from $W \( k \)$ act by cycles. There is also a semilinear symmetry commuting with $G$, inducing Witt Frobenius on $k$ and fixing $b$ and $u'$.]
] <g:translations>

#proof[
  The multiplicative norm of the underlying class $x_0$ is an actual representation-graded homotopy class. In the real regular representation of $G$, three of the nontrivial line pairs are faithful, and the fourth is $lambda'$. A power map of complex lines of degree prime to three gives an equivalence of their one-point compactifications after three-localization. Thus the three faithful line pairs may all be identified with $lambda$, with unit changes of orientation. The norm symbol is consequently $Delta u_lambda^6 u' ""^2$. Division by the sixth power of the faithful Euler symbol $a_lambda = b u_lambda$ gives (5.2). Its norm coefficient is invertible. The derivation rule shows that the inverse of a cycle unit is again a cycle for as long as the page is nonzero.
  All the Tate groups are annihilated by nine. A Teichmüller constant $c$ satisfies $c^(3^6) = c$; applying any differential gives $d c = 3^6 c^(3^6 - 1) d c = 0$. Every Witt constant modulo nine is a sum of a Teichmüller constant and three times one, proving the assertion about constants.
  Finally, Witt Frobenius on the maximal order is inner, implemented by $S$, up to the chosen opposite-group convention. A uniformizer in the maximal subfield $upright(bold(Q))_3 \( zeta_9 \)$ has the same valuation. Multiplying $S$ by a unit therefore makes its conjugation agree with conjugation by an element of that subfield. The resulting extended-stabilizer symmetry commutes with $G$. It induces Witt Frobenius on constants and preserves the ordinary cyclic and representation-orientation symbols $b \, u'$. ◻
]

When two differential coefficients occur in the same residue-field target and their sources are fixed by this symmetry, their ratio, if defined, belongs to $upright(bold(F))_3$. We will use this elementary descent observation repeatedly.

=== 5.2 The integral Mackey calculation <the-integral-mackey-calculation>

Write $P_n = K q^n$ for the scalar line on the initial $H$ page. A cyclic basis $a_i = g^i a_0$ of $V$ can be chosen with

$ theta = a_0 + a_1 + a_2 . $

Indeed $V$ has a semilinearly permuted basis, while $theta$ is invariant and primitive modulo the maximal ideal. An invariant primitive vector in that basis is a trace of a vector whose coefficient is a unit, and its three translates form a basis by Nakayama’s lemma. Set

$ overline(M) = k \[ Q \] \/ \( 1 + g + g^2 \) . $

Thus $V \/ K theta = K ⊗ overline(M)$, with its semilinear action, and $and.big^2 overline(M) tilde.equiv k$.

#thm([Lemma 5.3.])[
  #emph[Suppressing powers of $b$ and the orientation twist $u'$, the scalar and exterior-degree-three groups at $G$ have a common description $tilde(P)_n$. Restriction fits into 
$ 0 arrow.r overline(k)_n arrow.r tilde(P)_n arrow.r^("res") P_n^Q arrow.r 0 \, #h(2em) overline(k)_n = cases(delim: "{", k \, & 3 divides n \,, 0 \, & 3 divides.not n .) $

 Transfer embeds $\( P_n \)_Q$ in $tilde(P)_n$, with cokernel $overline(k)_n$. Moreover 
$ "(5.3)" quad hat(H)^d \( Q \; P_n \) = overline(k)_n #h(2em) \( d in upright(bold(Z)) \) . $ <g:P-tate>

 For $3 divides n$, the exceptional class is represented by $Delta^(n \/ 3)$; its transfer is the nonzero three-multiple in the restriction kernel. There is a class $c_G$ restricting to $a_0 a_1 a_2$, and multiplication by $c_G$ identifies the scalar and volume descriptions, including their exceptional kernels.]
  #emph[In exterior degrees one and two, restriction is injective onto all invariants. These groups are parametrized by transfer of $P_n a_0$ and $P_n a_0 a_1$, respectively.]
] <g:mackey>

#proof[
  We first work in the polynomial coefficient model of Theorem 20, before localization and completion. Group monomials by their three degrees in the trace-zero blocks. A triplet whose entries are not all equal has a three-element orbit; the corresponding module is induced from $H$. The standard restriction and transfer for an induced module give precisely its invariant and coinvariant descriptions.
  Consider an equal triplet $\( d \, d \, d \)$. The module is tensor induction of $"Sym"^d L$, where
  $ L = W \( k \) \[ H \] \/ \( N_H \) \, #h(2em) N_H = 1 + sigma + sigma^2 . $
  To compute its stable type, use the exact multiplication sequence obtained by quotienting the polynomial permutation representation by its invariant linear sum. In degree $d$ the polynomial permutation module has Tate cohomology only from the monomial with three equal exponents, and that occurs precisely when $3 divides d$. The long exact Tate sequence therefore gives one $k$ in even degrees, one $k$ in odd degrees, or zero, according as $d equiv 0 \, 1 \, 2 med \( mod med 3 \)$.
  These Tate patterns determine the nonprojective lattice summands. For completeness, a torsion-free $W \( k \) \[ H \]$-lattice is a sum of trivial, cyclotomic, and free lattices. Map it by $\( N_H \, sigma - 1 \)$ into its invariant and trace-zero lattices. These are free over $W \( k \)$ and $W \( k \) \[ zeta_3 \]$, respectively. Modulo their maximal ideals, the image glues two subspaces by an isomorphism. Choosing bases adapted to those subspaces splits the gluing into paired one-dimensional graphs and unpaired summands. The paired graph is $W \( k \) \[ H \]$, since
  $ W \( k \) \[ H \] = W \( k \) times_k W \( k \) \[ zeta_3 \] . $
  This gives the asserted three lattice types. Accordingly, $"Sym"^d L$ is stably $W \( k \)$, $L$, or zero in the three residue classes of $d$.
  Terms containing a free summand contribute nothing after tensor induction. For a nonconstant choice of factors this follows by induction from $H$. For repeated free factors, the diagonal $H$-action on a tensor permutation basis is free; its $G$-action is then free too, because every nontrivial subgroup of $G$ contains $H$.
  Tensor induction of $L$ is stably the third suspension of the trivial $G$-lattice. To see this without losing the integral extension, tensor the three short exact quotient sequences defining $L$. Every intermediate term is projective by the preceding observation. The cyclic permutation of the three suspended factors has positive sign. The two surviving ends thus give a threefold stable suspension, whose odd Tate group is $W \( k \) \/ 9$. Tensor induction of the trivial lattice gives the corresponding even $W \( k \) \/ 9$. Restriction to $H$ is reduction modulo three, and transfer is multiplication by three. In particular the exceptional transfer is nonzero; replacing these groups by $k$ prematurely would lose the restriction kernel.
  Here is the degree identification. At $H$, degree $3 e + epsilon.alt$ in block $i$, with $epsilon.alt = 0 \, 1$, contributes $q_i^e x_i^epsilon.alt$; the odd case is interpreted as a cyclic one-cocycle value. After allowing $Delta^(- 1)$, use $x_i \/ q_i$ for the odd generator. Then $j$ counts odd factors and $n = sum_i \( e_i + epsilon.alt_i \)$. An equal triplet has $3 divides n$ and $j = 0$ or $3$, giving exactly the exceptional terms above. The odd equal-triplet generator supplies $c_G$. The remaining triplets give all the degree-one and degree-two invariants by transfer. The same monomial calculation, now on the three $q_i$, proves (5.3).
  These calculations survive localization and completion. After inverting $Delta$, the degree-zero coefficient ring is finite over its Noetherian invariant subring, and every graded piece is a finite module there. Completion on the invariant side at the image of the residue point is flat and gives the desired completion, since the primes in the fibre constitute one orbit. The exceptional terms are supported at that point: invariant ratios act on them by their values at $x_i \/ x_0 = 1$ in $k$. Flat completion of the periodic cyclic complexes therefore preserves the computed groups and maps. Finally, multiplication by $c_G$ identifies their scalar and volume parts; on the exceptional kernels this follows from the nonzero transfer pairing, and on induced summands from restriction. ◻
]

=== 5.3 The pages through length nine <the-pages-through-length-nine>

#thm([Lemma 5.4.])[
  #emph[At fixed $r_0 \, n$, the $d_5$ complex in increasing exterior degree is 
$ "(5.4)" quad tilde(P)_n arrow.r^(med r_0 "res" med) P_n arrow.r^(med plus.minus \( r_0 + 1 \) D med) P_n arrow.r^(med \( r_0 + 2 \) "tr" med) tilde(P)_n . $ <g:d5-complex>

 Consequently the $E_6$ page has the following rows: 
$ "(5.5)" quad r_0 & j = 0 & j = 1 & j = 2 & j = 3\
0 & tilde(P)_n & P_n^Q & 0 & overline(k)_n\
2 & overline(k)_n & P_n \/ P_n^Q & D P_n & overline(k)_n\
1 & overline(k)_n & 0 & \( P_n \)_Q & tilde(P)_n . $ <g:E6>

 The orientation $u'$ has zero $d_5$ and $d_9$.]
] <g:early-pages>

#proof[
  Theorem 35 gives the $H$ formula $w_0 theta and \( - \)$. On successive exterior degrees in a row of (5.4), its coefficient is $r_0 + j$. Restriction determines the first arrow. Writing the cyclic basis modulo $theta$ identifies the middle arrow with $D$, up to an invertible translate and sign. Transfer determines the last arrow by the projection formula. Lemma 38 then gives (5.5): in each of the three residue cases one coefficient vanishes and the other two are units. Restriction of $u'$ is the trivial orientation; its possible $d_5$ target has injective restriction. At length nine it has no target. ◻
]

At $H$, the corresponding $E_6$ row has $P_n \, theta P_n$ in row zero, the plane $P_n ⊗ overline(M)$ and its $theta$-multiple in row two, and its determinant and $theta$-multiple in row one. Identify that determinant with $k$ using $a_0 a_1 med mod med theta$, which is fixed by $Q$. The $d_9$ preserves $r_0$, decreases $j$ by one, and replaces $n$ by $n - 2$; its nonzero $H$ maps multiply a $theta$-multiple by $J$.

#thm([Proposition 5.5.])[
  #emph[Put 
$ S_n = P_n \/ J P_(n + 2) \, #h(2em) W_n = S_n ⊗ overline(M) . $

 The main $H$ groups on $E_10$ are $S_n \, W_n \, S_n$ in exterior degrees $0 \, 1 \, 2$, respectively, at $w_0 equiv 0 med \( mod med 3 \)$. Define transfer modules 
$ "(5.6)" quad cal(T)_n & = cases(delim: "{", \( S_n \)_Q \, & n equiv 0 \, 2 med \( mod med 3 \) \,, N S_n \, & n equiv 1 med \( mod med 3 \) \,)\
cal(W)_n & = cases(delim: "{", \( W_n \)_Q \, & n equiv 1 \, 2 med \( mod med 3 \) \,, N W_n \, & n equiv 0 med \( mod med 3 \) .) $ <g:Tn>

 At $G$ the main groups are:]
  + #emph[in degree zero, a scalar group $cal(S)_n$ with transfer part $cal(T)_n$ and one additional restriction generator when $3 divides n$;]
  + #emph[in degree one, the transfer group $cal(W)_n$;]
  + #emph[in degree two, the transfer group $cal(T)_n$.]
  #emph[On these transfer groups restriction is norm and transfer is the displayed projection. The additional groups are one $k$ each, only when $3 divides n$: scalar restriction kernels at $w_0 equiv 1 \, 2 med \( mod med 3 \)$, and volume groups at every $w_0$. The volume is of $3 c_G$ kernel type when $w_0 equiv 1$, and of reduced $c_G$ type when $w_0 equiv 0 \, 2$.]
] <g:E10-description>

#proof[
  In row zero of (5.5), the degree-one $d_9$ is injective by restriction. When its invariant source is a norm, the map is also specified by transfer. In row two both middle groups inject under restriction, so the degree-two map is injective. Its entire source is transferred from $theta$-multiples, represented by $D P_n$; the degree-one outgoing is therefore zero by transfer.
  For row one, choose $L_1$ with $N L_1 = J$. Such an element exists by (5.3), since $J$ has index $- 2$. The top arrow sends the invariant restriction value $f$ to $\[ L_1 f \]$ in $\( P_(n - 2) \)_Q$, up to a common nonzero scalar. Restriction proves this except when the target index is divisible by three. In that case all the sources are transfers, and
  $ \[ L_1 N f' \] = \[ J f' \] $
  in coinvariants gives the same formula. All remaining arrows vanish by degree or by restriction.
  Take the quotients row by row. In degree zero, when $n equiv 0$, every incoming invariant multiplier lifts by a norm, so the transfer still embeds after passage to $\( S_n \)_Q$. When $n equiv 1$, restriction was injective on the whole transfer target; quotienting its invariant $J$-image leaves exactly $N S_n$. The $n equiv 2$ case has no additional Tate quotient and gives $\( S_n \)_Q$. In degree one, restriction was injective before $d_9$; the quotient is $\( W_n \)_Q$ divided by the reduction of $hat(H)^(- 1) \( Q \; P_n ⊗ overline(M) \)$. This removes the norm kernel exactly for $n equiv 0$. In degree two, the additional quotient is by $L_1 P_(n + 2)^Q$; when $n equiv 1$ it removes precisely the newly appearing norm kernel.
  For these assertions, the long exact Tate sequence of multiplication by $J$ gives
  $ hat(H)^d \( Q \; S_n \) tilde.equiv hat(H)^d \( Q \; W_n \) tilde.equiv cases(delim: "{", k \, & n equiv 0 \, 1 med \( mod med 3 \) \,, 0 \, & n equiv 2 med \( mod med 3 \) \,) $
  as statements about dimensions in every degree. The plane statement uses the stable suspension represented by $overline(M)$. The same exact sequences identify the norm kernels just used. Finally, the endpoint kernels and cokernels left in (5.5) give the additional scalar and volume lines stated in the proposition. ◻
]

=== 5.4 Restriction-zero corrections at lengths thirteen and seventeen <restriction-zero-corrections-at-lengths-thirteen-and-seventeen>

Restriction does not determine a differential whose target is a norm kernel. We keep all such coefficients until naturality or multiplication forces them.

#thm([Lemma 5.6.])[
  #emph[Put $T_0 = b^5 c_G$ on $E_13$. After a nonzero normalization, 
$ d_13 B \/ B = epsilon T_0 \, #h(2em) d_13 u' \/ u' = 0 \, #h(2em) epsilon eq.not 0 . $

 There is a residue $rho in { 2 \, 5 \, 8 } med \( mod med 9 \)$ such that the extra scalar families surviving $d_13$ occur in the two families $w_0 equiv 1 med \( mod med 3 \)$ or $w_0 equiv rho med \( mod med 9 \)$. The extra volume families occur in the three residue families 
$ w_0 equiv 0 med \( mod med 3 \) \, #h(2em) 2 med \( mod med 9 \) \, #h(2em) rho + 2 med \( mod med 9 \) . $

 Scalar generators outside the transfer part survive precisely at $w_0 = 9 t$ and $3 divides n$.]
] <g:d13>

#proof[
  At length thirteen only the exterior-degree change $0 arrow.r 3$ can be nonzero. For the reverse change, the target index is $n - 4$, where there is no restriction kernel. The main scalar-to-volume map is necessarily zero on transfers, by its $H$ counterpart. Write its two unit coefficients as
  $ d_13 B \/ B = epsilon T_0 \, #h(2em) d_13 u' \/ u' = epsilon' T_0 . $
  For $w_0 = 3 p$ and $3 divides n$, a scalar lift has symbol
  $ cal(D)^(n \/ 3) B^p u' ""^(thin i - 2 n \/ 3) \, $
  and its logarithmic coefficient is $p epsilon + \( i - 2 n \/ 3 \) epsilon'$. If this vanished with $p equiv.not 0 med \( mod med 3 \)$, the restriction would survive to $d_17$, where Theorem 35 gives a nonzero primitive $h$ term. But the available restriction image in the $G$ target is $N W_(n - 2)$, which is zero modulo the curve parameter $Z$: the residual plane is a two-term Jordan block. Naturality gives a contradiction. Lemma 37 makes the ratio $epsilon' \/ epsilon$ Frobenius-fixed when defined. If $epsilon = 0$, take $p = 1$ and $i - 2 n \/ 3 = 0$; if $epsilon' eq.not 0$, choose $i - 2 n \/ 3$ in $upright(bold(F))_3$ to cancel the coefficient with $p = 1$. Both are impossible. Thus $epsilon eq.not 0$ and $epsilon' = 0$.
  On the two extra scalar families, the actual quotient Euler symbol $3 b u'$ gives $d_13 \( 3 b \) = 0$. The product $3 b^2 T_0$ is nonzero in its $3 c_G$ target. Hence we must allow
  $ d_13 \( 3 b^2 \) = eta epsilon thin 3 b^2 T_0 \, #h(2em) eta in upright(bold(F))_3 . $
  At $w_0 equiv 1 med \( mod med 3 \)$, multiplication by $T_0$ vanishes, so the extra scalar remains. At $w_0 equiv 2 med \( mod med 3 \)$, the derivation rule for $B$ makes the scalar remain exactly when $w_0 equiv rho = 2 - 3 eta med \( mod med 9 \)$. Taking the cokernels in the volume groups gives the three stated families. Finally the scalar lift coefficient is $p epsilon$, so lifts outside transfers remain exactly when $w_0 = 3 p equiv 0 med \( mod med 9 \)$. ◻
]

#thm([Lemma 5.7.])[
  #emph[On transfers, the length-seventeen chain anchored at a scalar with $w_0 = 3 p$ is 
$ "(5.7)" quad 0 arrow.r cal(T)_n arrow.r^(quad h quad) cal(W)_(n - 2) arrow.r^(quad h and quad) cal(T)_(n - 4) arrow.r 0 \, $ <g:d17-exact>

 with its arrows scaled by $p$ and $p + 1$, respectively, up to nonzero units. The degree-two term has zero outgoing.]
  #emph[For a scalar lift at $w_0 = 9 t$, $3 divides n$, the only possible additional coefficient is 
$ "(5.8)" quad V \( t \, i - 2 n \/ 3 \) = t nu + \( i - 2 n \/ 3 \) nu' $ <g:V-form>

 into a one-dimensional restriction kernel in the plane. The ratio of $nu \, nu'$ is Frobenius-fixed whenever defined.]
] <g:d17>

#proof[
  At $H$, the invariant line generated by $h$ and its wedge quotient give
  $ 0 arrow.r S_n arrow.r W_(n - 2) arrow.r S_(n - 4) arrow.r 0 . $
  Apply coinvariants and their long exact Tate sequence. When $n equiv 0$, the last Tate group is zero, giving (5.7) directly. When $n equiv 1$, the middle Tate group is zero and exactness requires dividing the first coinvariant group by its norm kernel, exactly as in (5.6). When $n equiv 2$, the first Tate group is zero, and the corresponding norm kernels in the middle and last coinvariants are both divided out. These are all the cases. Equivalently the obstruction is
  $ ker \( N : M_Q arrow.r M \) = hat(H)^(- 1) \( Q \; M \) \, $
  which has the dimensions already calculated. Transferring the $H$ differentials now gives the two coefficients in (5.7); the shift between the two source coordinates changes $p - 1$ in the $H$ formula to $p + 1$ in this anchored chain. The top outgoing is zero by transfer.
  On scalar unit lifts the restriction of a possible extra map is zero. Its target is the single norm kernel in the first unscaled image of (5.7), occurring when $p equiv 0$ and $3 divides n$. Derivation on $C \, u'$ and translation by $cal(D)$ give exactly (5.8). There is no other kernel target. The Frobenius assertion follows from Lemma 37. ◻
]

For later use we record the full $E_18$ description. The extra scalar and volume families of Lemma 41 are unchanged. The main terms are

$ "(5.9)" quad j & w_0 med mod med 9 & upright("group")\
0 & 0 & cal(T)_n \, t o g e t h e r w i t h t h e e x t r a l i f t w h e n 3 divides n a n d V \( t \, i - 2 n \/ 3 \) = 0 \;\
1 & 6 & cal(T)_(n + 2) \, i d e n t i f i e d b y h \; d i v i d e o u t i t s n o r m k e r n e l i f 3 divides n + 2 a n d V \( t \, i - 2 \( n + 2 \) \/ 3 \) eq.not 0 \;\
1 & 3 & cal(T)_(n - 2) \, i d e n t i f i e d b y h and \;\
2 & 0 & cal(T)_n . $ <g:E18>

Here and below residues are represented by $0 \, dots.h \, 8$, and $t = \( w_0 - \( w_0 med mod med 9 \) \) \/ 9$. This table follows from (5.7): for $p equiv 0$ its scalar and first image remain; for $p equiv 1$ the complex is acyclic; for $p equiv 2$ its quotient and square remain. The correction (5.8) removes exactly the stated norm kernel. The maps called restriction and transfer remain the norm and projection maps in these descriptions.

=== 5.5 Reduction to a finite array <reduction-to-a-finite-array>

The main length-thirty-three contractions remove the curve parameter from the surviving transfer modules. Some restriction-zero arrows of length at most thirty-three remain undetermined. The finite array below therefore retains their possible endpoints, subject to the constraints derived later.

The degree changes needed below follow immediately from (5.1). They are displayed together so that all exclusions can be checked without an implicit chart:

$ "(5.10)" quad Delta j & upright("length") & Delta w_0 & Delta n\
1 & 12 l + 5 & 2 l + 4 & - 2 l\
- 1 & 12 l + 9 & 2 l - 1 & - 2 l - 2\
3 & 12 l + 1 & 2 l + 9 & 2 - 2 l\
- 3 & 12 l + 1 & 2 l - 8 & - 2 - 2 l . $ <g:raw-lengths>

They exhaust the possibilities because a differential changes the parity of exterior degree, and $0 lt.eq j lt.eq 3$.

#thm([Lemma 5.8.])[
  #emph[After the main length-thirty-three maps, the only potential groups are those in Table 1 below, subject to the qualifications following the table.]
] <g:to33>

#proof[
  First consider the possible intervening lengths in (5.9). At length twenty-one, the degree-one sources are transfers and their $H$ differential is zero; the other arrows are excluded by (5.10). At twenty-five the possible volume-to-scalar arrows have source residues
  $ 2 \, quad rho + 4 \, quad rho + 2 $
  and target residues $7 \, rho \, rho - 2$, respectively. The last target occurs only if $rho = 2$. Any degree-compatible scalar-to-volume alternative has transfer source and is zero. At twenty-nine only the extra scalar at residue $4$ can hit a restriction kernel in degree one at residue $3$: the other candidate has target with injective restriction and is zero. At thirty-three the $H$ contractions give the main transfer maps, and there may additionally be a volume arrow from residue $6$ to the restriction kernel in degree two at residue $0$.
  It remains to compute the kernels and cokernels of the main contractions. Set $L = h^3$, an invariant scalar section of index $- 8$ and valuation one in the curve ring $S_0 = k \[ \[ Z \] \]$. The $Q$-action on this disc is nontrivial: otherwise its action on the scalar lines would also be trivial, since a scalar of order three in the unit group of the characteristic-three disc is one. This contradicts their calculated Tate dimensions. Thus its invariant fraction field has degree three, and the complete disc extension is totally ramified. For example the orbit product of a parameter generates an invariant disc over which the original disc has rank three. Valuations of invariant functions are consequently multiples of three.
  The section $L$ shifts index by $- 8 equiv 1 med \( mod med 3 \)$, while $Delta$ shifts it by three and is an invariant unit. These sections realize minimal invariant valuations $0 \, 1 \, 2$ at indices $n equiv 0 \, 1 \, 2$, respectively. Any ratio of two invariant sections of one index is an invariant function, so there can be no smaller nonnegative valuation in that index. The Tate dimensions of Proposition 40 then show that the corresponding norm images begin at valuations $3 \, 4 \, 2$.
  It follows that multiplication by $L$ on $cal(T)_n arrow.r cal(T)_(n - 8)$ has the three effects
  $ "(5.11)" quad n med mod med 3 & upright("effect")\
0 & upright("surjective, with the whole norm kernel as kernel;")\
1 & upright("injective, with cokernel ") k \;\
2 & upright("injective, with cokernel the target norm kernel ") k . $ <g:L-cases>
  Indeed multiplication shifts each free invariant lattice by one valuation, and comparison with the minima $3 \, 4 \, 2$ gives the stated free cokernels; the remaining kernel or cokernel is the explicit norm kernel in (5.6). Dividing a norm kernel out at length seventeen simply removes that kernel or cokernel from this list.
  More precisely, the degree-one line at index $n$ is identified by $h$ with $cal(T)_(n + 2)$, and its contraction is
  $ L : cal(T)_(n + 2) arrow.r cal(T)_(n - 6) . $
  The degree-two group at index $n$ contracts to the degree-one quotient identified by $h and$, by
  $ L : cal(T)_n arrow.r cal(T)_(n - 8) . $
  These formulas are transfers of the nonzero $H$ length-thirty-three maps. Applying (5.11) to each index gives exactly the finite table. The extra volume arrow identified above is the only additional incoming on the residual degree-two kernel. ◻
]

We use sans-serif names for entries of the finite array, to distinguish them from the Laurent classes $A \, B \, C$. Put $n_0 = n med mod med 3$ and $w_(*) = w_0 med mod med 9$.

#figure(
  table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[label
], table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$n_0$
], table.cell(rowspan: 1, colspan: 1)[$w_(*)$
]),
  table.cell(rowspan: 1, colspan: 1)[$sans(A) \, sans(R)$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0,2
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[$sans(p) \, sans(q) \, sans(r)$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1,4,7
],
  table.cell(rowspan: 1, colspan: 1)[$sans(v)$
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$rho$
],
  table.cell(rowspan: 1, colspan: 1)[$sans(x) \, sans(X)$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1,2
], table.cell(rowspan: 1, colspan: 1)[3
],
  table.cell(rowspan: 1, colspan: 1)[$sans(y)$
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[6
],
  table.cell(rowspan: 1, colspan: 1)[$sans(M)$
], table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[$sans(a) \, sans(b) \, sans(c)$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0,3,6
],
  table.cell(rowspan: 1, colspan: 1)[$sans(d) \, sans(f)$
], table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[$2 \, rho + 2$
],
),
  caption: [Table 1: Potential finite groups after the main $d_33$. Paired lists are read entry by entry. The residue $rho + 2$ is reduced modulo nine. ],
)

Here $sans(A)$ contains its transfer kernel unless it was hit at twenty-five, and independently contains a restriction lift when $V = 0$. We do not split that extension. The groups $sans(R) \, sans(x) \, sans(X)$ are one $k$ each, are transfers, and have zero restriction; $sans(X)$ is absent if hit at twenty-nine. The group $sans(y)$ is the residual line kernel just when the indicated $V = 0$; $sans(M)$ is the residual square kernel unless hit at thirty-three. The remaining entries are the extra scalar and volume lines, with the endpoints of any nonzero twenty-five, twenty-nine, or thirty-three arrows removed. Every individual entry except the possible extension $sans(A)$ is one-dimensional over $k$.

Transfers of the $H$ constants generate the transfer parts of $sans(A) \, sans(R) \, sans(x) \, sans(X)$ whenever present. This follows from the cokernels in (5.11), where transfer still surjects from constants modulo $Z$. Restriction is zero because the norm images have positive valuation. The lift in $sans(A)$, when present, restricts to a nonzero constant. For $sans(y) \, sans(M)$, the relevant norm kernel before $d_33$ is represented by a constant in $\( S_e \)_Q$ with $e equiv 0 med \( mod med 3 \)$, using $Delta$ to shift indices. Reduction at $Z = 0$ shows that this coinvariant constant is nonzero.

We shall also use products on the finite array. The extra scalar classes are shifts of three, and the volume classes are shifts of the same odd class $c_G$. Therefore products of two extra scalars or two volumes are zero. Their mixed products retain the nonzero raw three-multiple pairing whenever the factors and the target $3 c_G$ line $sans(f)$ are still present. This follows already on $E_2$ from Lemma 38 and continues to hold on each page on which those classes remain.

Index all copies of a label by

$ "(5.12)" quad t = \( w_0 - w_(*) \) \/ 9 \, #h(2em) u = i - 2 floor.l n \/ 3 floor.r . $ <g:copy-index>

Together with $\( j \, n_0 \, w_(*) \)$, these indices determine its position modulo the permanent translation $cal(D)$.

=== 5.6 The normalizer character and an exhaustive degree rule <the-normalizer-character-and-an-exhaustive-degree-rule>

#thm([Lemma 5.9.])[
  #emph[On every residue-field entry of Table 1, including both subquotients of $sans(A)$, a normalizing symmetry acts by 
$ "(5.13)" quad d_0^(thin 2 m + 3 n + phi.alt) \, #h(2em) d_0^2 = - 1 \, $ <g:character-formula>

 up to the same orientation-twist factor at fixed $i$, where 
$ phi.alt = 0 quad upright("on scalar labels and ") sans(x) \, sans(X) \, #h(2em) phi.alt = 2 quad upright("on all other labels") . $

 Consequently a differential of length $R$ can join a source and target only if 
$ "(5.14)" quad R - Delta j + 3 Delta n + phi.alt_(upright(t a r g e t)) - phi.alt_(upright(s o u r c e)) equiv 0 med \( mod med 4 \) . $ <g:character-test>

]
] <g:character>

#proof[
  By Skolem–Noether choose a stabilizer unit $delta$ conjugating $g$ to $g^(- 1)$; a conjugator is made a unit by adjusting its valuation in the ramified centralizing field. If $d_0$ is its residual Lie scalar, conjugation scales the first strict coefficient of $g$ by $d_0^(- 2)$, whereas inversion negates that coefficient. Thus $d_0^2 = - 1$.
  A cyclic $b$-shift changes sign and contributes exponent two. A scalar $q^n$ has residual Lie exponent $3 n$. Let $overline(V) = V \/ frak(n) V$ and let $N_0 = g - 1$ on $overline(V)$. The quotient $overline(V) \/ N_0 overline(V)$ is represented by $x_0 \/ q_0$. Its coefficient weight $- 2$ and the cyclic one-cocycle inversion sign give total exponent zero. Since
  $ delta N_0 delta^(- 1) = - N_0 + N_0^2 \, $
  $delta$ preserves the canonical Jordan flag and its successive diagonal characters, starting at this quotient, are $1 \, - 1 \, 1$. The last line is $k theta = N_0^2 overline(V)$. Thus on $overline(W) = overline(V) \/ k theta$ the quotient character is $1$ and the invariant-line character is $- 1$. The primitive line generated by $q^2 h$ reduces to this unique invariant line, so its extra exponent is two. The plane and volume determinants likewise have character $- 1 = d_0^2$.
  Restriction and transfer preserve these characters on the finite quotients. In particular the constants representing the norm kernels $sans(y) \, sans(M)$ have the indicated determinant character. Their constant representatives inject into the residue at $Z = 0$, so higher-order semilinear terms do not alter these characters. On $sans(A)$ only its two subquotient characters are needed; no splitting of their extension is asserted. Conjugation identifies the representation spheres with the same orientation factor on source and target at fixed $i$. Finally $2 Delta m = R - Delta j$ by (5.1), giving (5.14). ◻
]

Here is a convenient complete arithmetic procedure for all the arrow tables that follow. For $d_1 = Delta j$, define

$ "(5.15)" quad d_1 & 1 & - 1 & 3 & - 3\
c_(*) & 5 & 9 & 1 & 1\
h_(*) & 4 & - 1 & 9 & - 8\
k_(*) & 0 & - 2 & 2 & - 2 . $ <g:arrow-rule>

Then $R = 12 l + c_(*)$, $Delta w_0 = 2 l + h_(*)$, $Delta n = - 2 l + k_(*)$. For any ordered pair of labels, the necessary and sufficient arithmetic tests are

$ "(5.16)" quad l & equiv 5 \( w_(* \, upright(t a r g e t)) - w_(* \, upright(s o u r c e)) - h_(*) \) med \( mod med 9 \) \,\
n_(0 \, upright(t a r g e t)) & equiv n_(0 \, upright(s o u r c e)) - 2 l + k_(*) med \( mod med 3 \) \,\
2 l + c_(*) - d_1 + 3 k_(*) + phi.alt_(upright(t a r g e t)) - phi.alt_(upright(s o u r c e)) & equiv 0 med \( mod med 4 \) . $ <g:l-congruence>

If they have a solution, they determine $l$ modulo eighteen and therefore $R$ modulo $216$. They determine the exact copy shifts by

$ "(5.17)" quad Delta t = frac(w_(* \, upright(s o u r c e)) + Delta w_0 - w_(* \, upright(t a r g e t)), 9) \, #h(2em) Delta u = - 2 ⌊frac(n_(0 \, upright(s o u r c e)) + Delta n, 3)⌋ . $ <g:copy-shifts>

Adding $216$ to a length adds $\( 4 \, 24 \)$ to these shifts. In all tables an arrow is considered only when both of its entries are still present.

=== 5.7 Forcing the two length-fifty-three coefficients <forcing-the-two-length-fifty-three-coefficients>

#thm([Proposition 5.10.])[
  #emph[The residue in Lemma 41 is $rho = 8$. The coefficient $e_53$ of the $H$ length-fifty-three differential is nonzero. Moreover, in (5.8) one has $nu eq.not 0$ and $nu' = 0$.]
] <g:rho-and-e53>

#proof[
  Apply (5.16)–(5.16) to the scalar entry $sans(A)$. Its only incoming possibilities, modulo $216$, are from $sans(f)$ at length $25 \, 169 \, 97$ when $rho = 2 \, 5 \, 8$, respectively. Its outgoing possibilities are at $13 \, 17 \, 53$, to $sans(d) \, sans(y) \, sans(x)$, respectively. For clarity the complete incoming list within the Euler bound is
  $ "(5.18)" quad rho & upright("incoming lengths on ") sans(A) upright(" through ") 469\
2 & 25 \, 241 \, 457\
5 & 169 \, 385\
8 & 97 \, 313 . $ <g:A-incoming>
  At length twenty-five this is a statement about the residual transfer kernel after the main length-thirty-three quotient, and may equivalently be read on the early page. If $rho = 2$, that arrow is zero. Indeed $sans(f) = sans(v) sans(d)$ up to shifts, $sans(v)$ has no outgoing there, and the possible $sans(d)$ differential lands in $sans(r)$, whose product with $sans(v)$ is zero.
  Now take an $sans(A)$ copy with $e_53 t = 0$. Its transfer-kernel generator is the transfer of an $H$ scalar that survives $d_53$ and is a $d_105$ target, by Proposition 34. The corresponding $H$ source has exterior degree one and index divisible by three. Its transfer is zero in Table 1. Naturality of $d_105$ therefore forces the transferred scalar to vanish #emph[before] the $G$ page $E_105$: on that page its transfer would have to equal $d_105 \( 0 \) = 0$. It cannot have an outgoing earlier, since it is transferred from an $H$ cycle. An incoming is thus necessary before length $105$. The $rho = 5$ row of (5.18) has none, and the $rho = 2$ candidate is zero. Hence $rho = 8$ and the required incoming has length $97$.
  If $e_53 = 0$, this reasoning applies to every copy of the transfer kernel, and every $sans(f)$ is consumed at length $97$. That differential cannot hit a restriction lift of the unit, since $H$ restriction of the target is nonzero. No source then remains for the only later possible unit incoming, at $313$. This contradicts the bound of Proposition 16. Therefore $e_53 eq.not 0$.
  An $sans(A)$ restriction lift with $V \( t \, u \) = 0$ survives to length fifty-three. If $t equiv.not 0 med \( mod med 3 \)$, its restriction has nonzero $H$ differential, while the only $G$ target is $sans(x)$, whose restriction is zero. Thus $V \( t \, u \) = 0$ implies $t = 0$ modulo three. The Frobenius ratio condition in Lemma 42 makes this a linear equation over $upright(bold(F))_3$. Its kernel can be contained in $t = 0$ only if $nu eq.not 0$ and $nu' = 0$. ◻
]

It follows that the entry $sans(y)$ occurs exactly when $t equiv 0 med \( mod med 3 \)$. Through $E_53$, multiplication by $C^3$ and $u'$ gives unit symmetries, so all previous removals are uniform for a fixed residue $t med mod med 3$. Transfer of the $H$ differential at length fifty-three has two more consequences:

+ the transfer kernel in $sans(A)$ maps to $sans(x)$ when $t equiv.not 0 med \( mod med 3 \)$;
+ $sans(X)$ can remain only at $t equiv 1 med \( mod med 3 \)$. Indeed the $H$ scalars with index $n equiv 1$ have zero transfer, while their nonzero length-fifty-three outgoing would otherwise transfer to that entry.

The only earlier possible removal of $sans(X)$ was the length-twenty-nine arrow from $sans(q)$. Accordingly $sans(q)$ and $sans(X)$ have a common survivor flag $Q_0 in { 0 \, 1 }$, at residues $t = 0$ and $t = 1$, respectively.

On scalar lifts with $t = 3 T$, the remaining length-fifty-three coefficient into $sans(x)$ has the form

$ "(5.19)" quad T omega + u omega' \, $ <g:omega-form>

by derivation on $C^3 \, u'$ and translation by $cal(D)$. The ratio is again Frobenius-fixed. The nonvanishing of $omega$ requires a norm argument; restriction alone cannot prove it.

#thm([Lemma 5.11.])[
  #emph[On page $E_R$, ordinary-to-Tate comparison is surjective in filtration $s gt.eq 0$ and injective in filtration $s gt.eq R - 1$, in every representation twist used here. If a specified ordinary filtration-zero symbol is a Tate cycle through length $R - 1$, then it extends as an ordinary class over the $\( R - 1 \)$-skeleton.]
] <g:finite-comparison>

#proof[
  At $E_2$ the comparison is the usual map from group cohomology to Tate cohomology: it is surjective in filtration zero and an isomorphism in positive filtration. Suppose the stated ranges hold on $E_R$. Lift a Tate cycle of filtration $s gt.eq 0$ to an ordinary class. Its differential maps to zero, and the target has filtration $s + R gt.eq R$, where comparison is injective. Thus the lift is an ordinary cycle. For injectivity on the next page, an ordinary cycle in filtration $s gt.eq R$ that is a Tate boundary has a Tate boundary source in filtration $s - R gt.eq 0$. Lift that source by surjectivity and use injectivity on $E_R$ at filtration $s$ to identify its ordinary boundary with the given cycle. This proves the induction.
  Apply it to a specified filtration-zero symbol. At each earlier length its ordinary differential maps to zero, and comparison is injective at that target; thus that very symbol survives. The finite tower description of cycles supplies its lift over the stated skeleton. No identification of an infinite Tate abutment enters this argument. ◻
]

#thm([Lemma 5.12.])[
  #emph[In (5.19), one has $omega eq.not 0$.]
] <g:omega-norm>

#proof[
  Consider at $H$ the ordinary orientation symbol
  $ Y = u_(lambda \| H)^(- 9) . $
  On Tate pages it is $C$ times an inverse faithful Euler power. By Proposition 45 its first nonzero differential has length fifty-three. Lemma 46 supplies an actual $H$-equivariant representative on the $52$-skeleton of the chosen free $G$-model for $E G$. This is a lift of the specified filtration-zero symbol: at each preceding length its ordinary differential vanishes because comparison is injective at that outgoing target. We use this same skeleton for the pointwise norm, restriction, and transfer.
  Take its pointwise multiplicative norm on that same skeleton. Explicitly, tensor-induce its map, precompose with the diagonal of the skeleton, and use indexed multiplication into $E$. Include its virtual sphere factor before taking the norm. This gives induced degree
  $ 9 "Ind"_H^G \( lambda \| H \) - 18 \( 1 + lambda' \) \, $
  whose orientation symbol is
  $ u_lambda^(- 27) u' ""^18 $
  up to a constant unit. Here the three faithful lifts of $lambda \| H$ have been identified by the prime-to-three power equivalences used in Lemma 37.
  We justify the first obstruction of this norm directly. On the boundary of a free $53$-cell the partial maps define a product over a $52$-sphere. Stably, the disjoint-basepoint sphere splits into a constant summand and a reduced sphere. The reduced diagonal into two or more reduced factors maps $S^52$ into $S^104$ or a higher-dimensional sphere, and is zero. Hence only terms with one reduced factor contribute to the first obstruction. The other factors are their filtration-zero point values. Sum these single-factor terms over the three $H$-cells: the result is precisely the additive transfer cochain of the one-factor obstruction, multiplied by the other two translated symbols. All three partial factors extend over the preceding skeleton, so this formula is valid modulo exactly the previous obstruction indeterminacies. It is therefore a formula on $E_53$:
  $ "(5.20)" quad d_53 "Nm"_H^G \( Y \) = "tr"_H^G #scale(x: 120%, y: 120%)[\(] d_53 Y dot.op g Y dot.op g^2 Y #scale(x: 120%, y: 120%)[\)] . $ <g:norm-obstruction>
  This local obstruction calculation is the filtration-zero instance of the general norm-transfer differential construction in [10] Theorem 4.6 and Proposition 5.4. That construction is an antecedent for the argument; its prime-two periodicity applications are not inputs here.
  The translates must in general be retained in (5.20). In this application $Y$ has coefficient one and its $H$ representation extends to $G$. Its cohomology symbol is thus fixed by $Q$, and its successive surviving page classes are fixed as well. Consequently the right side is $"tr" \( Y^2 d_53 Y \)$ here.
  Multiply by the necessary faithful Euler power to remove the $u_lambda$ shift. The source becomes $C^3 u' ""^18$, and the target becomes
  $ "tr" #scale(x: 120%, y: 120%)[\(] C^2 d_53^H \( C \) #scale(x: 120%, y: 120%)[\)] . $
  Before reduction of indices, this target has $n = - 8$ and $w_0 = 39$. It is the $sans(x)$ entry; that entry has no possible removal before length fifty-three and receives the $H$ transfer isomorphically on this page. Explicitly its exterior degree is one, its twist is $i = 18$, and (5.12) gives $\( t \, u \) = \( 4 \, 24 \)$. The complete arrow rule gives no incoming to $sans(x)$ before $53$; the Mackey calculation and the main $d_33$ quotient identify the transferred $H$ constant with its one-dimensional generator. This assertion is on $E_53$, before taking the cohomology of the differential now being computed. The target is therefore nonzero. On the source $C^3 u' ""^18$, formula (5.19) reads $omega + 18 omega' = omega$. This proves the lemma. ◻
]

Put $kappa = omega' \/ omega in upright(bold(F))_3$ and define

$ "(5.21)" quad cal(L) = { \( t \, u \) in upright(bold(Z))^2 : t + 3 kappa u equiv 0 med \( mod med 9 \) } . $ <g:lattice>

The residual $sans(A)$ restriction lifts and the $sans(x)$ support after length fifty-three are, respectively,

$ "(5.22)" quad cal(L) \, #h(2em) \( 1 \, 6 \) + cal(L) . $ <g:A-x-support>

From now on a subscript on a finite label denotes $t med mod med 3$, not a power. A statement about such a residue concerns every copy unless a particular copy is specified. The shift $\( 1 \, 6 \)$ follows from (5.17). For now all transfer kernels of $sans(A)$ at $t equiv 0 med \( mod med 3 \)$ remain independently of those lifts. The length-$105$ argument in Proposition 45 forces every $sans(f)$ at $t equiv 2 med \( mod med 3 \)$ to survive until its nonzero length-$97$ map onto one of these kernels; the shift there is $\( 1 \, 12 \)$. We call these the #emph[required] $sans(f)_2$ copies.

=== 5.8 Products and the first finite pairings <products-and-the-first-finite-pairings>

The complete possible arrows from lengths $25$ through $97$, apart from the main $d_33$ already taken, are

$ "(5.23)" quad 25 & sans(b) arrow.r sans(v) \, quad sans(d) arrow.r sans(r)\
29 & sans(q) arrow.r sans(X)\
33 & sans(c) arrow.r sans(M)\
49 & sans(a) arrow.r sans(R)\
53 & sans(A) arrow.r sans(x)\
57 & sans(x) arrow.r sans(p)\
61 & sans(R) arrow.r sans(f)\
85 & sans(p) arrow.r sans(c) \, quad sans(q) arrow.r sans(a) \, quad sans(r) arrow.r sans(b)\
93 & sans(y) arrow.r sans(p)\
97 & sans(a) arrow.r sans(v) \, quad sans(d) arrow.r sans(p) \, quad sans(f) arrow.r sans(A) . $ <g:early-finite-arrows>

This table is obtained by substituting the fifteen labels of Table 1, with $rho = 8$, in (5.16)–(5.16); thus it lists possibilities, not asserted nonzero maps. The length-fifty-seven arrow is zero by transfer: a remaining $sans(x)$ is transferred from the $H$ slot that survives fifty-three, since its $t$ residue is one.

The mixed products required below are

$ "(5.24)" quad sans(p) sans(a) = sans(f) \, #h(2em) sans(q) sans(c) = sans(f) \, #h(2em) sans(v) sans(d) = sans(f) \, #h(2em) sans(r) sans(b) = sans(f) \, $ <g:finite-products>

up to nonzero units and with aligned degree shifts. The $t$ indices add in the first pairing. In each of the other three pairings they add with an additional one, since the sum of their $w_(*)$ representatives exceeds the target representative by nine. Products of two extra scalars, or of two volumes, are zero.

#thm([Lemma 5.13.])[
  #emph[Both length-twenty-five arrows in (5.23) are nonzero on every copy. Thus $sans(b) \, sans(v) \, sans(d) \, sans(r)$ are all removed at that length.]
] <g:d25-nonzero>

#proof[
  Choose arbitrary copies $z$ of $sans(b)$ and $z'$ of $sans(d)$. Their product is zero, so
  $ 0 = d_25 \( z z' \) = d_25 \( z \) z' - z thin d_25 \( z' \) . $
  Both arrows have shift $\( - 1 \, 4 \)$ by (5.17). The two terms, when nonzero, belong to the same $sans(f)$ copy, at $\( t_z + t_(z') \, u_z + u_(z') + 4 \)$, and the products in (5.24) are nonzero. Thus one coefficient vanishes if and only if the other does. Because the two chosen copies were arbitrary, either both arrows vanish everywhere or both are nonzero everywhere. This proves uniformity even before any smaller unit lattice is used.
  Suppose they vanish. Then all $sans(v) \, sans(d)$ copies persist to page $97$: they have no intervening incoming, $sans(v)$ has no outgoing, and the only remaining possible outgoing of $sans(d)$ is the length-$97$ map to $sans(p)$. Choose their product in a required $sans(f)_2$ copy. On that page,
  $ d_97 \( sans(v) sans(d) \) = sans(v) thin d_97 \( sans(d) \) = 0 \, $
  because its possible value is the product of two extra scalars. This contradicts the required nonzero differential on $sans(f)_2$. Therefore both arrows are everywhere nonzero; their source and target groups are one-dimensional, so all four labels disappear. ◻
]

Two particular $sans(p)$ copies have no outgoing while they remain. The first is the quotient Euler symbol $3 b u'$ at

$ "(5.25)" quad \( t \, u \) = \( 0 \, 1 \) . $ <g:Euler-copy>

The second is the detector for the known surviving $b_2$, at

$ "(5.26)" quad \( t \, u \) = \( - 4 \, 12 \) . $ <g:b2-copy>

We denote them $p^E$ and $p^dagger$, respectively; their $t$ residues are zero and two.

Here is the detector coordinate calculation, including its cycle assertion. By Theorem 10, a survivor $b_dotless.j$, $dotless.j gt.eq 2$, has nonzero ordinary $G$ detection in filtration two. At $H$ its scalar coordinate is $m = 1$, $n = - 2 dot.op 3^dotless.j$, so every nonzero main scalar restriction has a nonzero $d_5$: coefficients in $K$ are cycles and multiplication by the primitive vector $theta$ is injective, even for arbitrary completed coefficients. Since a sphere lift is an ordinary cycle, its restriction must therefore vanish. The $G$ image is the generator of the extra scalar restriction kernel, with $w_0 = 1 - 4 dot.op 3^dotless.j equiv 1 med \( mod med 9 \)$. There is no incoming in ordinary filtration two; its Tate image has zero outgoing on every page where it has not yet been hit. Formula (5.12) now gives

$ "(5.27)" quad \( t \, u \) = #scale(x: 120%, y: 120%)[\(] - 4 dot.op 3^(dotless.j - 2) \, thin 4 dot.op 3^(dotless.j - 1) #scale(x: 120%, y: 120%)[\)] . $ <g:detector-coordinates>

This explains (5.26) and the two cycle assertions. It does not assert that a sphere detector cannot be an incoming Tate boundary.

#thm([Lemma 5.14.])[
  #emph[The entries $sans(a)_0 \, sans(a)_2$ and their paired $sans(R)_0 \, sans(R)_2$ are removed at length forty-nine. Afterwards $sans(a) \, sans(R)$ have a common survivor flag only at residue one.]
  #emph[Let $C_t$ denote the common survivor flag of $sans(c)_t$ and $sans(M)_(t + 1)$, paired at length thirty-three. Then 
$ "(5.28)" quad Q_0 = 1 quad arrow.r.double quad C_1 = 0 . $ <g:Q-C>

]
] <g:a-removal>

#proof[
  Suppose a copy of $sans(a)_2$ survives forty-nine. The only possible subsequent incoming through ninety-seven is the length-eighty-five arrow from $sans(q)$, with shift $\( 3 \, 8 \)$. But $sans(q)$ remains only at residue zero, so it can hit only $sans(a)_0$. The potential length-ninety-seven outgoing has target $sans(v)$, now absent. Thus $sans(a)_2$ is a cycle on page $97$. The Euler copy $p^E$ is also still present: the length-fifty-seven arrow is zero, and the possible length-ninety-three incoming from $sans(y)_0$ has target residue two, not zero. The product $p^E sans(a)_2$ is consequently a required $sans(f)_2$ that is a product of two cycles at ninety-seven, a contradiction.
  Suppose instead that $sans(a)_0$ survives forty-nine. The detector $p^dagger$ is present on page $85$; its only earlier possible incoming was the zero length-fifty-seven map. If the hypothesized $sans(a)_0$ were hit at eighty-five, multiplying by this detector would make its nonzero $sans(f)_2$ product an earlier boundary, contrary to the requirement that every $sans(f)_2$ remain until ninety-seven. Hence $sans(a)_0$ remains to ninety-three. Nor can $p^dagger$ be hit there under this hypothesis: if $d_93 z = p^dagger$, then
  $ d_93 \( z sans(a)_0 \) = p^dagger sans(a)_0 $
  would again make a required $sans(f)_2$ an earlier boundary. Both factors therefore reach ninety-seven as cycles, and their product gives the same contradiction. Thus $sans(a)_0$ and $sans(a)_2$ cannot survive forty-nine. Their one-dimensional targets $sans(R)_0 \, sans(R)_2$ are removed with them. The common remaining flag at residue one follows from the same pairing and the unit symmetries through fifty-three.
  Finally suppose $Q_0 = 1$. A remaining $sans(q)_0$ stays to page $97$: its potential eighty-five target $sans(a)_0$ is absent. If $C_1 = 1$, an incoming on $sans(c)_1$ after thirty-three and before ninety-seven, multiplied by $sans(q)_0$, would make the nonzero product $sans(q)_0 sans(c)_1$ a required $sans(f)_2$ that is an earlier boundary. Thus $sans(c)_1$ must itself remain to ninety-seven; then their product is a product of cycles there, also impossible. This proves (5.28). ◻
]

=== 5.9 The last unit and the complete remaining arrow list <the-last-unit-and-the-complete-remaining-arrow-list>

After removing $sans(r) \, sans(v) \, sans(b) \, sans(d)$, the following table lists all candidate arrows modulo $216$, before testing the $t$ residues of a proposed partner:

$ "(5.29)" quad 13 & sans(q) arrow.r sans(c)\
17 & sans(A) arrow.r sans(y) \, quad sans(X) arrow.r sans(M)\
29 & sans(q) arrow.r sans(X)\
33 & sans(c) arrow.r sans(M)\
49 & sans(a) arrow.r sans(R)\
53 & sans(A) arrow.r sans(x)\
57 & sans(x) arrow.r sans(p)\
61 & sans(R) arrow.r sans(f)\
85 & sans(p) arrow.r sans(c) \, quad sans(q) arrow.r sans(a)\
93 & sans(y) arrow.r sans(p)\
97 & sans(f) arrow.r sans(A)\
101 & sans(p) arrow.r sans(X)\
105 & sans(X) arrow.r sans(R)\
121 & sans(c) arrow.r sans(R)\
129 & sans(x) arrow.r sans(q)\
149 & sans(M) arrow.r sans(f)\
157 & sans(p) arrow.r sans(a)\
165 & sans(y) arrow.r sans(q)\
177 & sans(a) arrow.r sans(M) . $ <g:remaining-mod216>

The table follows from the three explicit congruences (5.16)–(5.16). For subsequent pages one uses the positive representative of the length after the page in question, adding $216$ and $\( 4 \, 24 \)$ as specified in (5.17). Thus the table includes all later repetitions within the bound, rather than only the displayed small lengths.

#thm([Proposition 5.15.])[
  #emph[All translations in $cal(L)$ are unit cycles through page $E_313$. The unit is hit at length $313$ from the $sans(f)$ translate 
$ "(5.30)" quad \( - 5 \, - 36 \) + cal(L) . $ <g:last-f>

 There are no other arrows on the remaining labels at that length, and the next page is zero.]
] <g:unit313>

#proof[
  We first make the units giving the translations explicit. On $E_53$ put
  $ Omega = \( C^3 \)^(- 1) d_53 \( C^3 \) . $
  Equation (5.19) says that the logarithmic differentials of $C^3$ and $u'$ are $Omega$ and $kappa Omega$. Their common target is a residue-field line, so $3 Omega = 0$. Hence the units
  $ "(5.31)" quad U_0 = C^9 \, #h(2em) U_1 = C^(- 3 kappa) u' $ <g:lattice-generators>
  and their inverses are cycles. Choose any integer representative of $kappa$; changing it by three changes $U_1$ by a power of $U_0$. Their shifts $\( 9 \, 0 \)$ and $\( - 3 kappa \, 1 \)$ generate $cal(L)$. Together with $cal(D)$, they realize every required translation by actual multiplication on the page.
  At the end of length ninety-seven, all transfer kernels of $sans(A)$ have disappeared. Only its restriction lifts at $cal(L)$ remain. These are products of surviving units, and their inverses are cycles by derivation. They have no outgoing between fifty-three and ninety-seven; the incoming at ninety-seven lands in their transfer kernel, not in their nonzero restriction quotient. In particular, passing to this quotient preserves the identities $U_i U_i^(- 1) = 1$: restriction sends these units to units on the still nonzero $H$ page, so $1$ is not a length-ninety-seven boundary. No splitting of the earlier $sans(A)$ extension is needed.
  For a remaining $sans(A)$ the only possible outgoing before $313$ are to $sans(d) \, sans(y) \, sans(x)$ at $229 \, 233 \, 269$, respectively. The first target has been removed. The second has $t equiv 1 med \( mod med 3 \)$, whereas $sans(y)$ occurs only at $t equiv 0$. The third has $t equiv 2 med \( mod med 3 \)$, whereas $sans(x)$ occurs only at $t equiv 1$. Thus all those outgoing maps are excluded. Formula (5.18) has no remaining incoming before $313$ and no other one through the bound $469$. The bound in Proposition 16 forces a nonzero $sans(f) arrow.r sans(A)$ at $313$ hitting the unit. Its shift, computed by (5.17), is $\( 5 \, 36 \)$, giving (5.30).
  No other arrow in (5.29) has length $313$. A differential hitting one contracts the differential graded algebra: if $d z = 1$ and $d y = 0$, then $d \( z y \) = y$ up to the usual sign. Its cohomology is therefore zero. This proves the proposition, including the actual page range of the unit symmetries. ◻
]

Work from now on modulo $cal(L)$ and the permanent $cal(D)$ translation. Each fully present label of a fixed residue $t med mod med 3$ has three copies. Apart from the distinguished $sans(f)$ in (5.30), and the already specified $sans(f)_2$ pairings with transfer kernels, every copy must be removed by a nonzero arrow before $313$. Each is one $k$. A nonzero arrow removes both endpoints, so neither can participate on a later page. On the same page, two consecutive nonzero maps between one-dimensional entries are excluded by $d_R^2 = 0$. Consequently the remaining problem is an ordinary matching of these copies, uniform under the now established unit translations.

#thm([Lemma 5.16.])[
  #emph[One has $C_0 = 1$. If $C_1 = 1$, all $sans(c)_0 \, sans(M)_2$ copies pair at length $249$, and all $sans(p)_1 \, sans(c)_1$ copies pair at length $301$. If $C_1 = 0$, all $sans(p)_1 \, sans(c)_0$ copies pair at length $85$, and neither $sans(c)_1$ nor $sans(M)_2$ is present.]
] <g:p1-matching>

#proof[
  There is no incoming to $sans(p)_1$ in the remaining array. For explicit verification, the possible incoming lengths from (5.29) are $57 \, 93 \, 273 \, 309$: their sources have, respectively, residues $sans(x)_0 \, sans(y)_2 \, sans(x)_2 \, sans(y)_1$, all absent. The first arrow is also zero by transfer. The removed label $sans(d)$ would have supplied incoming at $97$ or $313$, and supplies none now. Its possible outgoing partners through $313$ are
  $ 85 & sans(c)_0\
101 & sans(X)_0 upright(" (absent)")\
157 & sans(a)_2 upright(" (absent)")\
301 & sans(c)_1 . $
  The potential removed-label target at $229$ is $sans(b)$, also absent. Thus every $sans(p)_1$ must pair with $sans(c)_0$ at $85$ or $sans(c)_1$ at $301$.
  Similarly the remaining possibilities for $sans(M)_2$ are an outgoing at $149$ to $sans(f)_2$, already consumed at $97$, and incoming at $177 \, 233 \, 249$ from $sans(a)_2 \, sans(X)_0 \, sans(c)_0$, respectively. Only the last is present. The earlier candidate at $105$ came from the removed $sans(b)$ label. This list is exhaustive by the same congruences. Thus $sans(M)_2$, if present, must be hit from $sans(c)_0$ at $249$.
  If $C_1 = 1$, the length-thirty-three pairing left both $sans(c)_1$ and $sans(M)_2$. The unique partner of every $sans(M)_2$ forces $C_0 = 1$ and reserves every $sans(c)_0$ copy for length $249$; the shift $\( 5 \, 28 \)$ is a bijection on the copies. Therefore all $sans(p)_1$ must use $sans(c)_1$ at $301$. If $C_1 = 0$, neither $sans(c)_1$ nor $sans(M)_2$ occurs, and every $sans(p)_1$ must use $sans(c)_0$ at $85$, again forcing $C_0 = 1$. This proves both alternatives. In particular $sans(M)_1$ was present after length thirty-three in either case. ◻
]

=== 5.10 Three rows and one unmatched source <three-rows-and-one-unmatched-source>

We now discard the pairs fixed in Lemma 51, the $sans(A)$ transfer kernels and their required $sans(f)_2$ partners, and the unit targets themselves. Retain a mark on the distinguished $sans(f)$ source that leaves to the unit at $313$. The remaining matching has three rows, indexed by

$ cal(R) = { \( t \, u \) in upright(bold(Z))^2 : 3 divides t } \/ cal(L) . $

For a row $s in cal(R)$, place the remaining copies at the offsets displayed in Table 3. This is a list of their occurrences immediately before processing the candidate pairings of lengths greater than fifty-three. Thus a later pairing is recorded as a pair of entries even when it has already been logically forced.

#figure(
  table(
  columns: 7,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[label
], table.cell(rowspan: 1, colspan: 1)[$sans(y)$
], table.cell(rowspan: 1, colspan: 1)[$sans(p)_2$
], table.cell(rowspan: 1, colspan: 1)[$sans(p)_0$
], table.cell(rowspan: 1, colspan: 1)[$sans(M)_1$
], table.cell(rowspan: 1, colspan: 1)[$sans(f)_0$
], table.cell(rowspan: 1, colspan: 1)[$sans(f)_1$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( t \, u \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 0 \, 0 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 2 \, 10 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 6 \, 34 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 13 \, 70 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 12 \, 62 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 16 \, 86 \)$
],
),
  caption: [Table 2: Offsets from the row index $s$. The first six entries occur in every row. The last six occur in pairs, with flags $Q_0 \, C_2$, and the survivor flag of $sans(a)_1$, respectively. ],
)

#figure(
  table(
  columns: 7,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[label
], table.cell(rowspan: 1, colspan: 1)[$sans(q)_0$
], table.cell(rowspan: 1, colspan: 1)[$sans(X)_1$
], table.cell(rowspan: 1, colspan: 1)[$sans(c)_2$
], table.cell(rowspan: 1, colspan: 1)[$sans(M)_0$
], table.cell(rowspan: 1, colspan: 1)[$sans(a)_1$
], table.cell(rowspan: 1, colspan: 1)[$sans(R)_1$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( t \, u \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 3 \, 18 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 4 \, 22 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 8 \, 42 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 9 \, 46 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 10 \, 50 \)$
], table.cell(rowspan: 1, colspan: 1)[$\( 10 \, 58 \)$
],
),
  caption: [Table 3: Offsets from the row index $s$. The first six entries occur in every row. The last six occur in pairs, with flags $Q_0 \, C_2$, and the survivor flag of $sans(a)_1$, respectively. ],
)

There is also the singleton $sans(x)$ translate class. Assign it offset $\( 1 \, 4 \)$. Its actual support is $\( 1 \, 6 \) + cal(L)$ by (5.22), so it belongs to row

$ "(5.32)" quad s_x = \( 0 \, 2 \) + cal(L) . $ <g:x-row>

The complete arrow list between the entries of Table 3, and $sans(x)$, is

$ "(5.33)" quad 61 & sans(R)_1 arrow.r sans(f)_0\
85 & sans(p)_0 arrow.r sans(c)_2\
93 & sans(y) arrow.r sans(p)_2\
101 & sans(p)_2 arrow.r sans(X)_1\
121 & sans(c)_2 arrow.r sans(R)_1\
129 & sans(x) arrow.r sans(q)_0\
149 & sans(M)_0 arrow.r sans(f)_0 \, quad sans(M)_1 arrow.r sans(f)_1\
157 & sans(p)_0 arrow.r sans(a)_1\
165 & sans(y) arrow.r sans(q)_0\
177 & sans(a)_1 arrow.r sans(M)_1\
229 & sans(q)_0 arrow.r sans(c)_2\
233 & sans(X)_1 arrow.r sans(M)_0\
249 & sans(c)_2 arrow.r sans(M)_1\
273 & sans(x) arrow.r sans(p)_0\
277 & sans(R)_1 arrow.r sans(f)_1\
301 & sans(p)_2 arrow.r sans(c)_2 \, quad sans(q)_0 arrow.r sans(a)_1\
309 & sans(y) arrow.r sans(p)_0 . $ <g:row-arrows>

The length-fifty-seven map has already been proved zero. No other edge is suppressed in (5.33): it is obtained from (5.29) by the residue conditions, removal of the pairs in Lemma 51, and the established absent flags. In particular all repetitions with length less than $313$ are included.

Every displayed arrow preserves the row. This can be checked directly by subtracting the source offset in Table 3 from the target offset and applying (5.17). To make the entire finite calculation explicit, the shifts are

$ "(5.34)" quad R & \( Delta t \, Delta u \) & R & \( Delta t \, Delta u \)\
61 & \( 2 \, 4 \) & 85 & \( 2 \, 8 \)\
93 & \( 2 \, 10 \) & 101 & \( 2 \, 12 \)\
121 & \( 2 \, 16 \) & 129 & \( 2 \, 14 \)\
149 & \( 3 \, 16 \) & 157 & \( 4 \, 16 \)\
165 & \( 3 \, 18 \) & 177 & \( 3 \, 20 \)\
229 & \( 5 \, 24 \) & 233 & \( 5 \, 24 \)\
249 & \( 5 \, 28 \) & 273 & \( 5 \, 30 \)\
277 & \( 6 \, 28 \) & 301 & \( 6 \, 32 \) upright(" or ") \( 7 \, 32 \)\
309 & \( 6 \, 34 \) &  & $ <g:row-shift-table>

At $301$ the shifts are $\( 6 \, 32 \)$ for $sans(p)_2 arrow.r sans(c)_2$ and $\( 7 \, 32 \)$ for $sans(q)_0 arrow.r sans(a)_1$; the two arrows at $149$ have the same shift. For example, $sans(x) arrow.r sans(p)_0$ has difference $\( 6 \, 34 \) - \( 1 \, 4 \) = \( 5 \, 30 \)$, and $sans(R)_1 arrow.r sans(f)_1$ has difference $\( 16 \, 86 \) - \( 10 \, 58 \) = \( 6 \, 28 \)$. Thus there is no possible differential between two distinct rows.

#thm([Proposition 5.17.])[
  #emph[The coefficient in (5.21) is $kappa = - 1 in upright(bold(F))_3$. Equivalently, 
$ cal(L) = { \( t \, u \) : t - 3 u equiv 0 med \( mod med 9 \) } . $

]
] <g:kappa>

#proof[
  Each row of Table 3 begins with six entries and then three optional pairs, so it has even cardinality. The row $s_x$ has one additional entry, the singleton $sans(x)$. By Proposition 50, every entry pairs within its row except the marked $sans(f)$ that leaves to $sans(A)$ at $313$. Removing two endpoints preserves parity. Therefore the marked $sans(f)$ must belong to the same row as $sans(x)$.
  The marked source is $\( - 5 \, - 36 \) + cal(L)$ by (5.30). It is an $sans(f)_1$, whose offset is $\( 16 \, 86 \)$, so its row is
  $ s_f = \( - 21 \, - 122 \) + cal(L) . $
  Equality with (5.32) says $\( - 21 \, - 124 \) in cal(L)$, or
  $ - 21 - 372 kappa equiv 0 med \( mod med 9 \) . $
  Since $kappa in upright(bold(F))_3$, this is equivalent to $kappa = 2 = - 1$. The conclusion follows. ◻
]

=== 5.11 The known survivor and every higher detector <the-known-survivor-and-every-higher-detector>

#proof[
  By Proposition 52, copies are distinguished by the key $t - 3 u$ modulo nine. The three rows have keys $0 \, 3 \, 6$. The exceptional $sans(x)$ row $s_x = \( 0 \, 2 \)$ has key $3$.
  The detector $p^dagger$ for $b_2$ has coordinates $\( - 4 \, 12 \)$ and hence key $5$. Its $sans(p)_2$ offset $\( 2 \, 10 \)$ in Table 3 has key $8$, so this detector lies in row $5 - 8 = 6$. In that row the only available incoming on $sans(p)_2$ is the length-ninety-three arrow from $sans(y)$. The $sans(x)$ arrows belong to row $3$, and all other incoming labels have been removed. Since $b_2$ is known to survive, the detector cannot leave by an outgoing differential while present. It must nevertheless disappear before $313$ by Proposition 50. Consequently the $sans(y)$ of row $6$ hits this $sans(p)_2$ at length $93$.
  Consider now $sans(p)_0$ in that same row. Its potential incoming from $sans(x)$ at $273$ belongs to row $3$ and cannot hit it. Its only other incoming is the length-$309$ map from the row’s $sans(y)$, already consumed at $93$. Thus this $sans(p)_0$ has no incoming. It must disappear by an outgoing differential; the full table permits its outgoing at $85$ to $sans(c)_2$ or at $157$ to $sans(a)_1$. The argument does not require a choice between these two lengths. Figure 1 summarizes this constraint.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((-0.55, -1.95), (10.25, 1.25), stroke: (paint: rgb("#a6a6a6")))
  content((-0.3, 1.25), [Row $6$], fill: rgb("#ffffff"))
  content((0.4, 0), [$y$])
  content((4.2, 0.65), [$p_2$-1pt\] detector for $b_2$])
})],
    caption: [Figure 1: The final constraint in row $6$. The known survivor $b_2$ forces the $d_93$ pairing, so its source $sans(y)$ cannot also hit $sans(p)_0$ at length $309$. The possible $sans(x)$ incoming at length $273$ lies in row $3$. Thus $sans(p)_0$ must support one of the two indicated outgoing differentials; the argument does not choose between them. The diagram records logical constraints, not chronological order: length $85$ precedes length $93$. ],
  ) <g:forcing-figure>
  The $sans(p)_0$ offset $\( 6 \, 34 \)$ has key $6 - 3 dot.op 34 = 3$ modulo nine. In row $6$ it therefore has total key zero. Every detector with $dotless.j gt.eq 4$ in (5.27) has
  $ t equiv 0 med \( mod med 3 \) \, #h(2em) t - 3 u = - 40 dot.op 3^(dotless.j - 2) equiv 0 med \( mod med 9 \) . $
  It is exactly a $sans(p)_0$ copy of this key. The unit translations of Proposition 50 identify all such copies through the relevant pages. In particular none can be an earlier incoming Tate boundary, and each must have the forced outgoing just proved. This contradicts the cycle property of the image of any surviving sphere class. Hence no $b_dotless.j$ with $dotless.j gt.eq 4$ survives.
  For comparison, the $dotless.j = 3$ detector has key $6$, whereas the $dotless.j = 2$ detector has key $5$. Thus the tail exclusion does not decide $b_3$ by the same argument. Its survival and order-three representative will be constructed separately in Section 6. ◻
]

== 6 An order-three element in the 322-stem <sec:cube>

This section constructs the remaining positive class. The construction is independent of the height-six detector. Its geometric input is the known order-three Kervaire element in the 106-stem; its algebraic input is Lemma 65, proved in Section 7. A truncated extended cube first gives a map into a four-cell spectrum $T$ containing the Moore spectrum $M = S \/ 3$, with quotient $Sigma^4 M$. We construct a map of Adams–Novikov filtration at least two with the same image in that quotient; subtracting it gives a map that lifts to $M$. Keeping track of that correction is essential both for the primary Steenrod operation and for the additive order of the resulting sphere element. Extended powers have long connected primary operations with unstable and stable homotopy; see Toda [37] and May [24] Sections 2–3. The construction below specifies the finite lens-space truncation and the two Moore-spectrum corrections needed in this dimension.

#thm([Theorem 6.1.])[
  #emph[There is an element $theta in pi_322 S_(\( 3 \))$ detected by $b_3$ in the mod-three Adams spectral sequence such that $3 theta = 0$. In particular, $theta$ has additive order exactly three.]
] <cube:order-three>

=== 6.1 The strong criterion and the filtration conventions <the-strong-criterion-and-the-filtration-conventions>

All spectra and maps in this section are localized at three. Write $S$ for the localized sphere and let

$ "(6.1)" quad S arrow.r^3 S arrow.r^i M arrow.r^q Sigma S $ <cube:moore-triangle>

be the Moore cofibre sequence. A power of a sphere class always denotes its product in the stable homotopy ring of $S$.

We use the following established form of the strong odd-primary Kervaire criterion. Our statement includes the change of indices and the duality that will be needed below.

#thm([Lemma 6.2.])[
  (Strong Kervaire criterion).  #emph[Let $j gt.eq 0$ and $m = 3^(j + 1)$. The following conditions are equivalent:]
  + #emph[The detection coset of $b_j$ contains an element of additive order three in $pi_(4 m - 2) S$.]
  + #emph[There is a stable map 
$ Sigma^(4 m - 2) M = P^(4 m - 1) \( 3 \) arrow.r S $

 whose cone has nonzero reduced power $cal(P)^m$.]
  + #emph[There is a stable map $a : S^(4 m - 1) arrow.r M$ for which 
$ cal(P)^m : H^0 \( C_a \; upright(bold(F))_3 \) arrow.r H^(4 m) \( C_a \; upright(bold(F))_3 \) $

 is nonzero.]
  #emph[In condition (iii), if $q a = Sigma theta.alt$, then $3 theta.alt = 0$ in actual sphere homotopy. The strong criterion identifies $theta.alt$, up to the usual nonzero scalar normalization, as a nonzero class detected by $b_j$.]
] <cube:strong-criterion>

#proof[
  The equivalence of the first two conditions is Selick’s strong odd-primary criterion, in its stable Moore-space formulation [35] Theorems 1.1 and 3.3; see also the proof of [1] Theorem 1.1. In the notation of that formulation the stem is $2 m \( p - 1 \) - 2$, and the detecting Adams class is $b_(k - 1)$ when $m = p^k$. Thus at $p = 3$ and $k = j + 1$ the stem is $4 m - 2$ and the class is precisely $b_j$.
  For completeness, Spanier–Whitehead duality gives the last equivalence without changing the primary test. If $g : Sigma^(4 m - 2) M arrow.r S$, then $D M tilde.eq Sigma^(- 1) M$ and
  $ a = Sigma^(4 m - 1) D g : S^(4 m - 1) arrow.r M \, #h(2em) C_a tilde.eq Sigma^(4 m) D C_g . $
  The cohomology degrees of $C_g$ and $C_a$ are, respectively, ${ 0 \, 4 m - 1 \, 4 m }$ and ${ 0 \, 1 \, 4 m }$. Conjugation in the Steenrod algebra sends $cal(P)^m$ to $- cal(P)^m$ modulo products of positive reduced powers [28] Section 7, pp. 166–167. Such products vanish on the two cones, because the necessary intermediate degrees are absent. Consequently duality preserves nonvanishing of the indicated operation. Finally, $3 theta.alt = 0$ follows directly from (6.1); the detection and nonvanishing are part of the strong criterion. Thus the criterion concerns an actual order-three representative, rather than an order assertion about an associated-graded group. ◻
]

Put

$ I = "fib" \( S arrow.r upright(B P) \) \, #h(2em) F_f Z = I^(and f) and Z \, #h(2em) L_f Z = F_f Z \/ F_(f + 1) Z . $

The Adams–Novikov filtration of a homotopy group is

$ F^f pi_k Z = "im" #scale(x: 120%, y: 120%)[\(] pi_k F_f Z arrow.r pi_k Z #scale(x: 120%, y: 120%)[\)] . $

We retain the usual indices

$ E_r^(f \, t) \( Z \) arrow.r.double pi_(t - f) Z \, #h(2em) d_r : E_r^(f \, t) \( Z \) arrow.r E_r^(f + r \, t + r - 1) \( Z \) . $

In particular $L_f S tilde.eq upright(B P) and I^(and f)$. Flatness of $upright(B P)_(*) upright(B P)$ identifies its homotopy groups with the desuspended normalized cobar terms: they are torsion-free and supported in degrees $- f med mod med 4$. The groups for $L_f M$ are their reductions modulo three. It follows that

$ "(6.2)" quad E_r^(f \, t) \( M \) = 0 quad upright("unless ") t equiv 0 med \( mod med 4 \) \, #h(2em) E_2 \( M \) = E_5 \( M \) \, quad E_6 \( M \) = E_9 \( M \) . $ <cube:sparseness>

The tower description and its multiplicative pairings agree with the usual Adams–Novikov spectral sequence; the unit-cube comparison and the pairing conventions are recalled in Lemma 64. The orientation $upright(B P) arrow.r H upright(bold(F))_3$ gives the comparison with the ordinary mod-three Adams tower.

These filtrations are finite in each fixed stem of a bounded-below spectrum. Indeed $I$ is at least 3-connective: the unit is an isomorphism on $pi_0$, and the localized sphere has no homotopy in degrees one and two. The connectivity of $F_f Z$ therefore tends to infinity with $f$. We shall use this finiteness when passing from vanishing associated-graded groups to vanishing homotopy classes.

We also recall explicitly the elementary property of the first Adams invariant that is used to control the corrections.

#thm([Lemma 6.3.])[
  #emph[For a map $u : A arrow.r B$ inducing zero in mod-three homology, the short exact sequence of Steenrod comodules 
$ 0 arrow.r H_(*) B arrow.r H_(*) C_u arrow.r Sigma H_(*) A arrow.r 0 $

 is its ordinary Adams filtration-one invariant. This invariant is natural and additive in $u$. It vanishes for a composite of two maps that induce zero in mod-three homology, and hence for a map of Adams–Novikov filtration at least two.]
] <cube:primary-invariant>

#proof[
  The first Adams obstruction measures whether the displayed comodule extension splits. Cone maps give its naturality. To add two maps, first take their direct sum and then use the diagonal on the source and the fold on the target; the corresponding pullback and pushout of extensions give their Baer sum. If $u = v w$ and both $v_(*)$ and $w_(*)$ vanish, the cone comparison from $w$ to $v w$ identifies the extension of $v w$ with the pushout of the extension of $w$ along $v_(*) = 0$. This pushout is split.
  The maps between two successive stages of the mod-three Adams tower are homology-zero maps. Thus a factorization through its second stage has zero invariant. The comparison $upright(B P) arrow.r H upright(bold(F))_3$ supplies this factorization for a map of Adams–Novikov filtration at least two. ◻
]

Whenever the cone has no ambiguity in the bottom and tested top degrees, the coefficient of a primary reduced power between those degrees is a component of this extension invariant. In particular, subtracting a map as in the last assertion of Lemma 55 does not change that coefficient.

=== 6.2 A filtration-ten cube <a-filtration-ten-cube>

Set

$ "(6.3)" quad t = 108 \, #h(2em) n = t - 1 = 107 \, #h(2em) N = 3 t - 2 = 322 . $ <cube:dimensions>

The classical Kervaire detection coset in $pi_106 S$ contains an element of order three detected by $b_2$; see [1] Corollary 1.2 and its proof and [32] Table A3.4. By Lemma 54, choose

$ a_0 : S^n arrow.r M $

with nonzero $cal(P)^27$ from the bottom to the top of its cone, and write $q a_0 = Sigma x$, where $x in pi_106 S$.

#thm([Proposition 6.4.])[
  #emph[The reduction of the cube satisfies 
$ i x^3 in F^10 pi_318 M . $

]
] <cube:cubic-filtration>

#proof[
  The class of $a_0$ has Adams–Novikov filtration one. Filtration zero is excluded by the support of $pi_(*) upright(B P) M$, while filtration at least two is excluded by its nonzero primary test and Lemma 55. Let
  $ z in E_2^(1 \, 108) \( M \) $
  be its permanent leading class.
  We use the notation of Section 7: $v = v_1$, $a = \[ t_1 \]$, $B$ is the reduced integral 3-Bockstein, and
  $ y & = frac(eta_R \( v_2^9 - v_1^8 v_2^7 \) - \( v_2^9 - v_1^8 v_2^7 \), v_1^9) \,\
t'_7 & = frac(eta_R \( v_2^7 \) - v_2^7, v_1) #h(2em) upright("in the mod-three cobar complex") . $
  By the unconditional basis calculation (7.5), write
  $ z = lambda y + nu t'_7 + mu v^26 a \, #h(2em) lambda \, nu \, mu in upright(bold(F))_3 . $
  After setting all positive coefficient generators $v_i$ to zero, these representatives specialize to $lambda t_1^27$. Every one-cobar boundary also specializes to zero, since the positive coefficient ideal is invariant. The Thom comparison sends $t_1$, up to a unit, to the first reduced-power dual generator; its conjugate Milnor convention changes only this unit. Hence $lambda$, up to a unit, is the $cal(P)^27$ coefficient of $C_(a_0)$, and is nonzero. Rescale $a_0$ to make $lambda = 1$. Lemma 65 then gives
  $ "(6.4)" quad z = y + mu v^26 a \, quad mu in upright(bold(F))_3 \, #h(2em) B \( y \)^3 = 0 . $ <cube:leading-class>
  The boundary along $q$ increases Adams–Novikov filtration by one and induces the integral 3-Bockstein; this is the geometric boundary theorem [32] Theorem 2.3.4. Here it can be seen directly on two layers. Put $X = F_2 S$, $Y = F_1 S$, and $Z = Y \/ X$. A lift of $a_0$ to $Y \/ 3$ and an integral lift to $Z$ of its image in $Z \/ 3$ give a class in
  $ Q = \( Y \/ 3 \) times_(Z \/ 3) Z . $
  The integral lift exists because the homotopy of $Z$ is torsion-free. Comparing fibres over $Z$ yields the triangle
  $ X arrow.r^(thin 3 iota thin) Y arrow.r Q arrow.r Sigma X \, $
  where $iota : X arrow.r Y$ is the inclusion: the fibre of $Y arrow.r Q$ identifies with the fibre of $X arrow.r X \/ 3$, and its map into $Y$ is $3 iota$. Projection to $Y \/ 3$ identifies the resulting boundary with a lift of $x$ to $F_2 S$. Projection to $Z$ says that three times its layer symbol is the $d_1$ of the chosen integral lift. Division by three in the torsion-free layer gives exactly the stated Bockstein, with a harmless convention-dependent sign.
  After reducing again by $i$, the filtration-two symbol is $plus.minus B \( z \) = plus.minus B \( y \)$. Indeed the Bockstein is a derivation,
  $ B \( v \) = plus.minus a \, #h(2em) B \( a \) = 0 \, #h(2em) a^2 = 0 \, $
  so $B \( v^26 a \) = 0$. Multiplicativity of the sphere tower and its pairing with the Moore tower puts $i x^3$ in filtration at least six, with filtration-six symbol represented by $plus.minus B \( y \)^3$. This symbol is zero by (6.4). Thus $i x^3$ has filtration greater than six. Its stem is $318 equiv 2 med mod med 4$, so (6.2) makes ten the next possible filtration. ◻
]

=== 6.3 The truncated extended cube <the-truncated-extended-cube>

Write $Sigma_3 = C_3 times.r C_2$, where the generator of $C_2$ acts on $C_3$ by inversion. Let $rho$ be the real permutation representation on three letters and write

$ rho = upright(bold(1)) xor lambda . $

Here $lambda$ is a real two-plane. Restricted to $C_3$ it is the faithful complex character, while $C_2$ acts by conjugation; in particular its orientation character is $upright(s g n)$.

Let $L^(\( 2 \)) = S^1 union_3 D^2$ be the two-skeleton of a lens-space model for $B C_3$. A useful explicit cover is the subspace

$ tilde(L)^(\( 2 \)) = { \( z_1 \, z_2 \) in S \( upright(bold(C))^2 \) : z_2 in union.big_(zeta^3 = 1) zeta upright(bold(R))_(gt.eq 0) } . $

Scalar multiplication by a third root of unity and complex conjugation give the required $C_3 times.r C_2$-action. This cover consists of three disks with their boundary circles identified. The $C_3$-quotient is $L^(\( 2 \))$, with its degree-three attachment.

Take a free contractible $C_2$-space $E C_2$, let $C_3$ act trivially on this extra factor, and put

$ cal(B) = \( L^(\( 2 \)) \)_(h C_2) \, #h(2em) cal(P) = tilde(L)^(\( 2 \)) times E C_2 . $

Thus $cal(P) arrow.r cal(B)$ is a principal $Sigma_3$-bundle. A classifying map to $B Sigma_3$ gives a natural comparison between

$ "(6.5)" quad D^compose \( X \) = cal(P)_(+) and_(Sigma_3) X^(and 3) \, #h(2em) D_3 \( X \) = E Sigma_(3 +) and_(Sigma_3) X^(and 3) . $ <cube:truncated-functor>

The permutation of smash factors is the usual permutation action in spectra, including its signs on odd-dimensional spheres.

#thm([Lemma 6.5.])[
  #emph[The base $cal(B)$ has cohomological dimension at most two for 3-local local coefficient systems, and 
$ tilde(H)^(*) \( cal(B) \; A \) = 0 $

 for every constant 3-local abelian group $A$. Moreover, 
$ "(6.6)" quad D^compose \( S^1 \) tilde.eq Sigma^4 M \, #h(2em) D^compose \( S^n \) tilde.eq Sigma^N M . $ <cube:thom-identifications>

 These identifications can be chosen so that 
$ "(6.7)" quad D^compose \( q a_0 \) = x^3 1_M : Sigma^N M arrow.r Sigma^4 M . $ <cube:quotient-cube>

]
] <cube:lens-thom>

#proof[
  Since two is invertible, the spectral sequence for the homotopy orbits by $C_2$ takes invariants exactly. The cellular complex of $L^(\( 2 \))$ has dimension two, proving the assertion about local coefficients. With constant coefficients its possible reduced cohomology groups are $ker \( 3 : A arrow.r A \)$ in degree one and $A \/ 3 A$ in degree two. Inversion acts by minus one on both, so neither has nonzero $C_2$-invariants. In particular the augmentation $Sigma^oo cal(B)_(+) arrow.r S$ is a 3-local equivalence: its cofibre is bounded below and has zero integral localized homology, hence is zero by the stable Hurewicz theorem.
  The Thom spectrum of $rho$ over $cal(B)$ is $D^compose \( S^1 \)$. Its orientation system is $upright(s g n)$. On the lens skeleton, integral reduced homology is $upright(bold(Z)) \/ 3$ in degree one, and inversion acts by minus one. Twisting by $upright(s g n)$ therefore retains that group and removes the degree-zero group. The Thom homology is consequently just $upright(bold(Z)) \/ 3$ in degree four. To identify the spectrum, realize its lowest homotopy generator by $S^4$; it has order three by the lowest-degree Hurewicz isomorphism and extends to $Sigma^4 M$. The extension is an integral homology equivalence and therefore a 3-local equivalence of bounded-below spectra.
  The difference bundle $\( n - 1 \) rho$ is oriented, since $n - 1 = 106$ is even, and is stably spherically trivial after localization at three. Indeed its spherical classifying map lifts to the classifying space of degree-one stable sphere equivalences. This space is simply connected and its second homotopy group is $pi_1 S_(\( 3 \)) = 0$. The subsequent Postnikov obstructions vanish by the cohomological dimension of $cal(B)$. There is no inverse-limit ambiguity: for a fixed homotopy degree of the mapping space, the fibres of its Postnikov tower have zero homotopy in that degree once their Eilenberg–Mac Lane degree exceeds it by more than two. Thus the required compatible nullhomotopies exist. Trivializing this difference bundle identifies
  $ D^compose \( S^n \) tilde.eq Sigma^(3 \( n - 1 \)) D^compose \( S^1 \) tilde.eq Sigma^(3 n + 1) M = Sigma^N M . $
  Before taking Thom spectra, $D^compose \( q a_0 \)$ is a map from the sphere bundle $S^(n rho)$ to $S^rho$. After the difference bundle is trivialized, its fibrewise mapping spectrum is the constant spectrum $S^(- 3 \( n - 1 \))$: endomorphisms of the remaining invertible sphere line identify canonically with scalars. Sections of this constant spectrum are determined, on homotopy classes, by evaluation at one point, because $Sigma^oo cal(B)_(+) tilde.eq S$. At that point the map is the ordinary smash cube of $q a_0$, namely the suspension of $x^3$ in the indicated degrees. This proves (6.7), up to a 3-local unit which is absorbed in the source identification. ◻
]

The same base calculation supplies the nonzero Euler pairing that will detect a primary reduced power. Namely

$ "(6.8)" quad e \( lambda \) frown - : H_2 \( cal(B) \; upright(bold(F))_3^(upright(s g n)) \) arrow.r H_0 \( cal(B) \; upright(bold(F))_3 \) $ <cube:euler-pairing>

is nonzero. On restricting to the lens skeleton, $e \( lambda \)$ is the mod-three first Chern class of the faithful $C_3$-line. It is the nonzero Bockstein of a fundamental-group character. Its evaluation on the mod-three two-cell is a unit. The orientation twist cancels the inversion sign, so taking $C_2$-invariants preserves this pairing.

#thm([Lemma 6.6.])[
  #emph[There is a triangle 
$ "(6.9)" quad Sigma^3 M arrow.r^g M arrow.r^(j_T) T arrow.r^(pi_T) Sigma^4 M $ <cube:T-triangle>

 and a map $F : Sigma^N M arrow.r T$ such that 
$ pi_T F = x^3 1_M . $

 Both $j_T$ and the natural map $D^compose M arrow.r T$ are isomorphisms on bottom mod-three homology.]
] <cube:attachment>

#proof[
  Filter $D_3 M$ by the number of upper Moore cells in its three input factors. The four successive layers, before simplification, have stabilizers $Sigma_(3 - r) times Sigma_r$, $0 lt.eq r lt.eq 3$. The bottom layer is $Sigma^oo B Sigma_(3 +)$. For one upper cell, the $Sigma_2$-stabilizer acts trivially on its one-dimensional sphere; the layer is therefore $Sigma S$ after localization at three. For two upper cells, interchanging the two odd spheres is the sign action. Its $Sigma_2$-homotopy orbits are zero at three, so this layer disappears. The top layer is $D_3 S^1$.
  The attachment of the one-cell layer to the bottom is degree three. One can compute it in the cellular complex of $M^(and 3)$: a chosen one-upper-cell generator has boundary three times the bottom generator. Passing to $Sigma_3$-coinvariants identifies the three choices of this generator; it does not add their three boundaries. Thus the attachment has degree three, not nine. Since the reduced suspension spectrum of the connected space $B Sigma_3$ has zero $pi_0$, this attachment has no reduced component.
  It follows that the part $K$ below the top layer has a projection $r : K arrow.r M$ inducing an isomorphism on bottom homology; explicitly, $K$ is the cofibre of the bottom degree-three map into $Sigma^oo B Sigma_(3 +)$, and the augmentation gives $r$. Pull back $D_3 M arrow.r D_3 S^1$ along $D^compose S^1 arrow.r D_3 S^1$, obtaining $U$, and push out its fibre along $r$. These constructions give a diagram of triangles
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$K$])
  content((3.2, 0), [$U$])
  content((6.4, 0), [$D^compose S^1$])
  content((9.6, 0), [$Sigma K$])
  content((0, 1.7), [$M$])
  content((3.2, 1.7), [$T$])
  content((6.4, 1.7), [$D^compose S^1$])
  content((9.6, 1.7), [$Sigma M .$])
  line((0.51, 0), (2.69, 0), mark: (end: ">"))
  line((0, 0.4), (0, 1.3), mark: (end: ">"))
  content((-0.45, 0.85), [$r$])
  line((3.71, 0), (5.38, 0), mark: (end: ">"))
  line((3.2, 0.4), (3.2, 1.3), mark: (end: ">"))
  line((6.51, 0.4), (6.51, 1.3))
  line((6.29, 0.4), (6.29, 1.3))
  line((7.42, 0), (9.09, 0), mark: (end: ">"))
  line((9.6, 0.4), (9.6, 1.3), mark: (end: ">"))
  content((10.05, 0.85), [$Sigma r$])
  line((0.51, 1.7), (2.69, 1.7), mark: (end: ">"))
  content((1.6, 2.15), [$j_T$])
  line((3.71, 1.7), (5.38, 1.7), mark: (end: ">"))
  content((4.545, 2.15), [$pi_T$])
  line((7.42, 1.7), (8.92, 1.7), mark: (end: ">"))
})
  Use (6.6) in the lower row and desuspend its boundary to define $g$. The natural comparison square for $D^compose q$ gives $D^compose M arrow.r U arrow.r T$; composing it with $D^compose a_0$ gives $F$. Its quotient is (6.7). The bottom-homology claims follow because the comparisons of base orbits preserve $H_0$, the projection $r$ preserves the bottom generator, and the remaining quotient $Sigma^4 M$ has no homology near degree zero. ◻
]

#thm([Proposition 6.7.])[
  #emph[The cone of $F : Sigma^N M arrow.r T$ has a nonzero operation 
$ cal(P)^81 : H^0 \( C_F \; upright(bold(F))_3 \) arrow.r H^(N + 2) \( C_F \; upright(bold(F))_3 \) . $

]
] <cube:primary-detection>

#proof[
  Throughout this proof homology has coefficients $upright(bold(F))_3$. We adapt Toda’s diagonal cone construction [37] Section 1, Theorem 2 to the truncated functor $D^compose$. Applying the diagonal cone nullhomotopy gives a natural map
  $ C_(D^compose a_0) arrow.r D^compose \( C_(a_0) \) . $
  Compose it with the map $D^compose C_(a_0) arrow.r D^compose S^t$ induced by $C_(a_0) arrow.r S^t$. This composite is zero on $D^compose M$, and therefore factors through $C_(D^compose a_0) \/ D^compose M tilde.eq Sigma D^compose S^n$. The resulting map
  $ "(6.10)" quad Sigma D^compose S^n arrow.r D^compose S^t $ <cube:diagonal-thom>
  comes from the diagonal trivial line in the permutation representation. More explicitly, use the same interval parameter in the three cone factors and then collapse their ends. Its normal representation is $rho - upright(bold(1)) = lambda$. The resulting Thom map is therefore the Euler map for $lambda$. Since $N + 2 = 3 t = 324$, the map on the tested top homology is precisely the cap product (6.8); it is nonzero.
  The spectrum $D^compose M$ has homology only in degrees at most five: its fibre $M^(and 3)$ has homology in degrees zero through three and its base has homological dimension two. Consequently the suspended top class of $D^compose S^n tilde.eq Sigma^N M$ gives a class $c in H_(3 t) \( C_(D^compose a_0) \)$. Let $u in H_t \( C_(a_0) \)$ be the top generator. In the homology spectral sequence over $cal(B)$, the fibre of $D^compose C_(a_0)$ has tensor-product homology with degrees chosen from ${ 0 \, 1 \, t }$. In total degree $3 t$, the sole possible term is
  $ H_0 #scale(x: 120%, y: 120%)[\(] cal(B) \; upright(bold(F))_3 { u^(⊗ 3) } #scale(x: 120%, y: 120%)[\)] \; $
  the action is trivial since $t$ is even. There is no possible differential into or out of this term, nor another term in its total degree. Projection to $D^compose S^t$ identifies it with the fibre generator there. By (6.10), the image of $c$ is a nonzero multiple of $u^(⊗ 3)$.
  The bottom fibre class survives as well. The Cartan formula for reduced powers [28] Section 2, Property 2.5 on the fibre gives
  $ cal(P)_(*)^81 \( u^(⊗ 3) \) = \( cal(P)_(*)^27 u \)^(⊗ 3) eq.not 0 . $
  Indeed, to reach degree zero each tensor factor must be lowered from degree $t = 108$ by $cal(P)_(*)^27$; all other Cartan terms have zero contribution to the bottom. Naturality shows that $cal(P)_(*)^81 c$ is nonzero in $H_0 \( C_(D^compose a_0) \)$.
  Finally, the map $D^compose M arrow.r T$ and the identity on the source induce $C_(D^compose a_0) arrow.r C_F$. It is an isomorphism on the bottom and on the tested top homology. Applying naturality again proves the assertion. ◻
]

=== 6.4 Endomorphisms and the two obstruction components <endomorphisms-and-the-two-obstruction-components>

#thm([Lemma 6.8.])[
  #emph[There is a unital multiplication $mu : M and M arrow.r M$, and evaluation on the bottom cell admits a splitting 
$ "(6.11)" quad cal(E) = F \( M \, M \) tilde.eq M or Sigma^(- 1) M . $ <cube:end-splitting>

 Write $epsilon : cal(E) arrow.r M$ for evaluation, $s : M arrow.r cal(E)$ for its section, and $tau : cal(E) arrow.r Sigma^(- 1) M$ for the other projection. The second summand includes by precomposition with $q : M arrow.r Sigma S$, and $s \( i \) = 1_M$. No associativity of $mu$ is required.]
] <cube:endomorphisms>

#proof[
  The Moore sequence gives $pi_1 M = 0$ and $pi_0 M = upright(bold(F))_3$. Applying $\[ - \, M \]$ to that sequence shows that restriction to the bottom identifies $\[ M \, M \]$ with $pi_0 M$. In particular $3 thin 1_M = 0$. The cofibre sequence
  $ M arrow.r^3 M arrow.r M and M $
  then allows the identity of $M$ to extend to a multiplication $mu$ with one unit law. The other unit composite has the same bottom restriction as the identity, so it is the identity by the same restriction calculation.
  Applying $F \( - \, M \)$ to (6.1) identifies the fibre of $epsilon : F \( M \, M \) arrow.r F \( S \, M \) = M$ with $F \( Sigma S \, M \) = Sigma^(- 1) M$. Adjunction applied to $mu$ gives the section $s$. Its value on $i$ is the identity by the unit law. Splitting this fibre sequence proves the assertions. ◻
]

The correction will be made inside $F_2 T$. It is important to distinguish its tower from the full Adams–Novikov tower.

#thm([Lemma 6.9.])[
  #emph[Let $tilde(E)_r$ be the spectral sequence of 
$ dots.h.c arrow.r F_4 M arrow.r F_3 M arrow.r F_2 M \, $

 with absolute filtration indices retained. Its comparison $c_r : tilde(E)_r^(f \, t) arrow.r E_r^(f \, t) \( M \)$ has the following properties: 
$ upright("page") & upright("surjective") & upright("isomorphic")\
5 & f gt.eq 2 & f > 2\
6 = 9 & f gt.eq 2 & f gt.eq 7\
10 & f gt.eq 2 & f gt.eq 11 . $

 These assertions hold also for maps induced by fixed endomorphisms of $M$, with their appropriate degree shifts.]
] <cube:relative-tower>

#proof[
  The layer complex agrees with the full $E_1$-complex above filtration two. In filtration two it has the same cycles but omits incoming $d_1$-boundaries. This gives the stated comparison on $E_2$, hence on $E_5$ by sparseness.
  For clarity, a full $d_r$-cycle lifts to a cycle whenever comparison is surjective in its slot and injective in its outgoing slot: the differential of any lift maps to zero and must therefore vanish. Comparison on the resulting homology is injective as well if it is injective in the current slot and surjective in the incoming slot, because a full boundary can then be lifted.
  Apply this first to $d_5$. An outgoing slot from filtration $f gt.eq 2$ has filtration at least seven, where $c_5$ is an isomorphism. Thus $c_6$ is surjective for every $f gt.eq 2$. If $f gt.eq 7$, the incoming slot has filtration $f - 5 gt.eq 2$, so the same argument gives an isomorphism. Sparseness identifies this page with $E_9$. For $d_9$, all outgoing slots again compare isomorphically. When $f gt.eq 11$, the incoming filtration $f - 9$ is at least two, proving the last row. Everything is natural in maps of the underlying tower. ◻
]

Write the filtration of the abutment of this restricted tower as

$ cal(F)^f pi_k F_2 M = "im" #scale(x: 120%, y: 120%)[\(] pi_k F_f M arrow.r pi_k F_2 M #scale(x: 120%, y: 120%)[\)] \, #h(2em) f gt.eq 2 . $

It is finite by connectivity, just as the full filtration.

#thm([Proposition 6.10.])[
  #emph[There is a map $F' : Sigma^N M arrow.r F_2 T$ whose composite to $T$ has the same quotient under $pi_T$ as $F$.]
] <cube:correction>

#proof[
  Choose a lift $hat(c) in pi_318 F_10 M$ of $i x^3$ using Proposition 56, and let $c$ be its image in $pi_318 F_2 M$. Smash the section in Lemma 60 with $I^(and 2)$ and put
  $ w = s_(*) \( c \) in pi_318 F_2 cal(E) . $
  After forgetting filtration, $w$ is exactly $x^3 1_M$, because $s \( i \) = 1_M$.
  Postcomposition with $g : Sigma^3 M arrow.r M$ defines
  $ gamma : Sigma^3 cal(E) arrow.r cal(E) . $
  The obstruction to lifting $w$ through the triangle (6.9) smashed with $I^(and 2)$ is
  $ gamma_(*) \( w \) in pi_321 F_2 cal(E) . $
  We show separately that both components of this obstruction under (6.11) vanish.
  #emph[The first component.] Forgetting filtration makes the whole obstruction zero, since $F$ is already an actual lift of $x^3 1_M$. Its first component lies in $pi_321 F_2 M$, and the map
  $ pi_321 F_2 M arrow.r pi_321 M $
  is injective. To see this, the quotient $M \/ F_2 M$ has its two layers $L_0 M$ and $L_1 M$, both with zero $pi_322$: their support degrees are, respectively, $0$ and $3$ modulo four, whereas $322 equiv 2$. Thus $pi_322 \( M \/ F_2 M \) = 0$, and the long exact sequence gives the injection. The first component is therefore zero already in the restricted tower.
  #emph[The second component.] The fixed composite
  $ Sigma^3 M arrow.r^(Sigma^3 s) Sigma^3 cal(E) arrow.r^gamma cal(E) arrow.r^tau Sigma^(- 1) M $
  suspends to a map $h : Sigma^4 M arrow.r M$. Under the splitting, the second obstruction is precisely $h_(*) \( c \) in pi_322 F_2 M$. The map $h$ on $upright(B P)_(*)$-homology is multiplication by a scalar multiple of $v_1$, since a $upright(B P)_(*)$-linear degree-four map $upright(B P)_(*) M arrow.r upright(B P)_(*) M$ is determined by its value in $upright(B P)_4 M = upright(bold(F))_3 { v_1 }$. This is a comodule map: $v_1$ is primitive modulo three, by $eta_R \( v_1 \) = v_1 + 3 t_1$. Functoriality of the normalized cobar complex therefore identifies $E_2 \( h \)$ with that literal coefficient multiplication. The map of Adams towers passes this identification to $E_5$ and $E_6$; the coefficient $v_1$ is permanent by the target-vanishing argument in Section 7. No multiplicativity assumption on $h$ is used. Its action on the full $E_6$-page in the relevant slots is consequently a scalar multiple of
  $ "(6.12)" quad v_1 : E_6^(10 \, 328) \( M \) arrow.r E_6^(10 \, 332) \( M \) \, $ <cube:v-obstruction>
  which is zero by Lemma 65. Lemma 61 is an isomorphism on both these $E_6$-slots. Consequently $h$ induces zero on the filtration-ten associated-graded map of the restricted abutment. Since $c in cal(F)^10 pi_318 F_2 M$, this proves
  $ h_(*) \( c \) in cal(F)^11 pi_322 F_2 M = cal(F)^14 pi_322 F_2 M . $
  The equality follows from sparseness: in stem 322 only filtrations congruent to two modulo four can occur.
  For every such filtration $f gt.eq 14$, Lemma 65, including its high-filtration estimate, gives
  $ E_10^(f \, 322 + f) \( M \) = 0 . $
  The comparison of Lemma 61 is an isomorphism there, so the restricted $E_10$-groups vanish as well. Every associated-graded quotient of $cal(F)^14 pi_322 F_2 M$ is therefore zero. Increasing connectivity makes this filtration finite, and hence $cal(F)^14 pi_322 F_2 M = 0$. This proves that the second component vanishes.
  Notice why the two page arguments were separated: an incoming full $d_9$ at filtration ten may start in filtration one, which the restricted tower omits. No $E_10$-comparison in filtration ten was asserted or used. The zero map (6.12) removes that filtration on $E_6$ before the higher $E_10$-vanishing is applied.
  We have now proved $gamma_(*) \( w \) = 0$. The triangle (6.9) smashed with $I^(and 2)$ supplies the desired lift. More explicitly, $M$ is dualizable, so
  $ F \( M \, I^(and 2) and Z \) tilde.eq I^(and 2) and F \( M \, Z \) . $
  The exact sequence obtained by applying $F \( M \, - \)$ to that triangle therefore identifies the vanishing obstruction just calculated with the existence of $F' : Sigma^N M arrow.r F_2 T$. Its quotient represents $w$, whose underlying map is $x^3 1_M = pi_T F$. ◻
]

=== 6.5 The sphere element and its order <the-sphere-element-and-its-order>

#proof[
  Let $overline(F)'$ be the composite of the map in Proposition 62 with $F_2 T arrow.r T$. Its quotient equals that of $F$, so the difference has a lift
  $ Z : Sigma^N M arrow.r M \, #h(2em) j_T Z = F - overline(F)' . $
  The map $overline(F)'$ has Adams–Novikov filtration at least two. The maps $F$, $overline(F)'$, and $F - overline(F)'$ induce zero on mod-three homology for degree reasons, so Lemma 55 and additivity show that the primary invariant of $F - overline(F)'$ equals that of $F$. Since $j_T$ is an isomorphism on bottom homology, the cone comparison from $Z$ to $j_T Z$ is an isomorphism on the bottom and on the tested top degrees. Proposition 59 thus gives a nonzero
  $ cal(P)^81 : H^0 \( C_Z \; upright(bold(F))_3 \) arrow.r H^324 \( C_Z \; upright(bold(F))_3 \) . $
  Use the splitting of Lemma 60 to write the class of $Z$ as the sum of its section component and its quotient-precomposition component. The section component is $s_(*) \( z_0 \)$ for some $z_0 in pi_N M = pi_322 M$. This class has Adams–Novikov filtration at least two: the degree-322 homotopy of both $L_0 M$ and $L_1 M$ is zero, so it lifts successively through $F_1 M$ and $F_2 M$. Applying the section to that lift shows that the corresponding map $Sigma^N M arrow.r M$ also factors through $F_2 M$. It can therefore be subtracted without altering the primary test.
  The remaining component factors through the upper quotient of its source:
  $ Sigma^N M arrow.r^(Sigma^N q) S^(N + 1) arrow.r^(a_1) M . $
  The cone comparison induced by $Sigma^N q$ preserves the bottom class and the top class in degree $N + 2 = 324$. Hence $C_(a_1)$ has nonzero $cal(P)^81$ from its bottom to its top. Apply Lemma 54 with $m = 81 = 3^4$: the map $a_1 : S^323 arrow.r M$ gives an element $theta in pi_322 S$ detected by $b_3$. The actual Moore boundary satisfies
  $ q a_1 = Sigma theta \, #h(2em) 3 theta = 0 . $
  Nonzero detection implies $theta eq.not 0$; therefore its additive order is exactly three. ◻
]

#prodef([Remark 6.11.])[
  The map into $T$ and its nonzero primary operation are supplied directly by the extended cube. The finite Adams–Novikov lemma is used to produce the correction inside $F_2 T$, thereby obtaining the map into $M$. This is the step that determines the additive order in the sphere, and it does not follow merely from a differential-free associated-graded symbol.
]

== 7 The finite Adams–Novikov calculation <sec:finite>

This section proves the Adams–Novikov assertions used in Section 6. The calculation determines only the kernels, images, and products needed in stem $322$; it does not require a complete description of either adjacent stable stem. All vector spaces in this section are over $upright(bold(F))_3$.

=== 7.1 The product and its algebraic conventions <the-product-and-its-algebraic-conventions>

Let $M = S \/ 3$, put $B = upright(B P)_(*) \/ 3$, and write

$ D_(f \, d) = "Ext"_(\( B \, upright(B P)_(*) upright(B P) \/ 3 \))^(f \, 4 d) \( B \, B \) = E_2^(f \, 4 d) \( M \) . $

Thus $f$ is Adams–Novikov filtration, $d$ is one quarter of internal degree, and the corresponding stable stem is $4 d - f$. These groups vanish unless the internal degree is divisible by four. Consequently

$ E_5 = D \, #h(2em) E_6 = E_9 = H \( D \, d_5 \) \, #h(2em) \| d_5 \| = J = \( 5 \, 1 \) \, quad \| d_9 \| = R = \( 9 \, 2 \) . $

When no confusion is possible, we abbreviate $H \( D \, d_5 \)$ to $H$. The signs in a Leibniz rule are $\( - 1 \)^f$, since $4 d - f$ has parity $f$.

We first give the tower comparison needed for the multiplicative spectral sequence. It also identifies the totalization convention with the Adams stages used in Section 6.

#thm([Lemma 7.1.])[
  (Unit cubes and the pairing).  #emph[Let $I = "fib" \( S arrow.r upright(B P) \)$ and $F_q Z = I^(and q) and Z$. For the augmented Amitsur cosimplicial spectrum 
$ X^n \( Z \) = upright(B P)^(and \( n + 1 \)) and Z $

 there are natural equivalences 
$ "fib" #scale(x: 120%, y: 120%)[\(] Z arrow.r "Tot"_m X^bullet \( Z \) #scale(x: 120%, y: 120%)[\)] tilde.eq F_(m + 1) Z \, $

 compatible with the maps as $m$ varies. A unital binary multiplication $mu : M and M arrow.r M$ induces pairings on its Adams–Novikov spectral sequence with the Leibniz rule on every page. The pairing on $E_2 \( M \)$ is the ordinary graded-commutative Ext product. These statements do not require an associative multiplication on $M$.]
] <finite:pairing>

#proof[
  Let $cal(P)_m$ be the poset of nonempty subsets of $\[ m \] = { 0 \, dots.h \, m }$. The functor
  $ u : cal(P)_m arrow.r Delta_(lt.eq m) \, #h(2em) S mapsto \[ \| S \| - 1 \] $
  sends an inclusion to the induced order-preserving injection. We show that $u$ is homotopy initial. For $0 lt.eq k lt.eq m$, the category $\( u arrow.b \[ k \] \)$ is the face poset of the simplicial complex $K_(m \, k)$ whose nonempty faces are weakly increasing partial maps $\[ m \] arrow.r.dashed \[ k \]$. Indeed, a face consists of a subset $S$ and an order-preserving map from its induced ordinal to $\[ k \]$.
  The complex $K_(m \, k)$ is contractible when $k lt.eq m$. To see this, start with the subcomplex whose last argument is either undefined or has value $k$. This is a cone on $K_(m - 1 \, k)$, with cone vertex $\( m \, k \)$. For each $a < k$, the remaining faces with last value $a$ form the cone with vertex $\( m \, a \)$ on $K_(m - 1 \, a)$. Its intersection with the previously constructed complex is exactly that base. Since $a lt.eq m - 1$, the base is contractible by induction. Attaching a cone on a contractible subcomplex preserves contractibility. The initial case $m = k = 0$ is a point. This proves the assertion, including the case $k = m$, where the first cone is contractible without any assumption on its base. The homotopy-initiality criterion therefore identifies $"Tot"_m X$ with the homotopy limit of the nonempty unit cube indexed by $cal(P)_m$. Including its empty vertex gives the cube with initial value $Z$ and one unit insertion in each of its $m + 1$ directions. Its total fibre is $I^(and \( m + 1 \)) and Z$, because smash products of spectra preserve finite fibres in each variable. This construction is compatible with restriction of cubes and hence with the tower maps.
  Choose the $E_4$ structure on $upright(B P)$ furnished by [3] Theorem 1.1. In particular, its associative algebra structure in associative algebras supplies coherent pointwise pairings of the Amitsur construction. The external pairings, followed by $mu$, give the pairing of totalization spectral sequences, and thus of the identified Adams towers. The boundary formula for a pairing of filtered objects is precisely the Leibniz rule; it uses the binary pairing and its compatibility with the tower, not associativity of $mu$. The required unital $mu$ is provided by Lemma 60.
  Finally, the sphere-input Amitsur levels have even, $3$-torsion-free homotopy groups. Smashing with $M$ reduces these groups modulo $3$. Unitality makes the resulting coefficient pairing $B ⊗_(upright(B P)_(*)) B arrow.r B$ ordinary multiplication. Since $3$ is invariant in the Hopf algebroid, the normalized cobar complex after this reduction computes $D$. Its induced cup product is the ordinary Ext product, proving the last assertion. In particular, associativity and graded commutativity hold on $E_2$ and pass to all subsequent pages by taking homology. ◻
]

We use Hazewinkel generators $v_i$ and coordinates $t_i$, with $\| v_i \| = \| t_i \| = 2 \( 3^i - 1 \)$ in internal degree. Thus their weight is $\( 3^i - 1 \) \/ 2$. The logarithm convention is

$ eta_R \( l_i \) = sum_(j = 0)^i l_j t_(i - j)^(3^j) \, #h(2em) l_0 = t_0 = 1 . $

The integral recursions and their reductions are given in Appendix 8. In characteristic three they give

$ "(7.1)" quad eta_R \( v_1 \) = v_1 \, #h(2em) eta_R \( v_2 \) = v_2 + v_1 \( t_1^3 - v_1^2 t_1 \) . $ <finite:right-unit>

The primitive coefficient ring is exactly $upright(bold(F))_3 \[ v_1 \]$. For completeness, suppose a primitive polynomial depends on $v_s$, with $s gt.eq 2$ maximal. Set all positive-index $t_i$ except $t_(s - 1)$ to zero. The recursion fixes $v_1 \, dots.h \, v_(s - 1)$ and sends

$ v_s mapsto v_s + v_1 t_(s - 1)^3 - v_1^(3^(s - 1)) t_(s - 1) . $

If the degree of the polynomial in $v_s$ is $N > 0$, its transformed expression has a nonzero coefficient on $t_(s - 1)^(3 N)$: this coefficient is its leading coefficient in $v_s$, multiplied by $v_1^N$. The coefficient ring is a domain. This contradicts primitivity and proves the assertion by descent on $s$.

Put $v = v_1$ and $a = \[ t_1 \]$. For a coefficient $q$ whose right-unit difference is divisible by $v_1^m$ modulo three, write

$ delta_m \( q \) = frac(eta_R \( q \) - q, v_1^m) med \( mod med 3 \) . $

Reduction precedes division. Equation (7.1) and the invariance of $v_1$ show that the following expressions are one-cocycles:

$ h & = delta_1 \( v_2 \) \, & r & = delta_3 \( v_2^3 \) \, & s' & = delta_1 \( v_2^2 \) \,\
y & = delta_9 \( v_2^9 - v_1^8 v_2^7 \) \, &  &  & t'_i & = delta_1 \( v_2^i \) . $

Their bidegrees are respectively

$ \| v \| = \( 0 \, 1 \) \, quad \| a \| = \( 1 \, 1 \) \, quad \| h \| = \( 1 \, 3 \) \, quad \| r \| = \( 1 \, 9 \) \,\
\| s' \| = \( 1 \, 7 \) \, quad \| y \| = \( 1 \, 27 \) \, quad \| t'_i \| = \( 1 \, 4 i - 1 \) . $

For example, if $w = t_1^3 - v_1^2 t_1$, then $\( v_2 + v_1 w \)^9 - v_2^9 = v_1^9 w^9$; the difference of the seventh powers is divisible by $v_1$. This proves the divisibility defining $y$ and also the useful identity

$ "(7.2)" quad delta_9 \( v_2^9 \) = y + t'_7 . $ <finite:corrected-y>

The notation $B \( x \)$ denotes a Bockstein; the unadorned $B$ still denotes the coefficient ring. For a one-cocycle $x$ define its algebraic Bockstein class by

$ "(7.3)" quad B \( x \) = frac(Delta tilde(x) - tilde(x) ⊗ 1 - 1 ⊗ tilde(x), 3) med \( mod med 3 \) \, $ <finite:bockstein>

where $tilde(x)$ is an integral lift. Coefficients are written on the left: $Delta$ is left-linear, and moving coefficients in the last term into this convention uses $eta_R$. The numerator is divisible by $3$ because $x$ is a cocycle. Changing the lift changes the result by a coboundary. With the usual normalized-cobar differential, $B$ is the negative of the reduced connecting homomorphism for multiplication by $3$. Set

$ b = B \( h \) \, #h(2em) c' = B \( r \) \, #h(2em) P = a B \( t'_4 \) \, #h(2em) \| b \| = \( 2 \, 3 \) \, med \| c' \| = \( 2 \, 9 \) \, med \| P \| = \( 3 \, 16 \) . $

These classes are, up to units, the reductions of the sphere classes $beta_1$, $beta_(3 \/ 3)$, and $alpha_1 beta_4$. The beta coboundaries defining them come respectively from $v_2$ modulo $\( 3 \, v_1 \)$, $v_2^3$ modulo $\( 3 \, v_1^3 \)$, and $v_2^4$ modulo $\( 3 \, v_1 \)$. The classical Adams–Novikov differentials and naturality therefore give

$ "(7.4)" quad d_5 \( c' \) = epsilon.alt a b^3 \, #h(2em) P in E_9 \( M \) \, #h(2em) d_9 \( P \) = epsilon.alt' b^6 \, #h(2em) epsilon.alt \, epsilon.alt' in upright(bold(F))_3^times . $ <finite:classical-differentials>

We use these classical results in the form recalled in [5] Lemma 2.5; see also [32]. Their natural images in the Moore spectral sequence are allowed to be zero or boundaries. No assertion that such an image is nonzero is needed below. The classes $a$ and $b$ come from the permanent classes $alpha_1$ and $beta_1$.

Here is the conclusion of the section. The coefficient in its hypothesis means the coefficient in a normalized one-cobar representative after setting all positive-degree coefficient generators $v_i$ to zero.

#thm([Lemma 7.2.])[
  (Finite Adams–Novikov lemma).  #emph[Suppose $z in E_2^(1 \, 108) \( M \) = D_(1 \, 27)$ is a permanent cycle whose coefficient on $t_1^27$ is $1$. Then:]
  + #emph[$z equiv y med \( mod med upright(bold(F))_3 v^26 a \)$ and $B \( y \)^3 = 0$ in $D$;]
  + #emph[multiplication by $v$ is zero from $E_6^(10 \, 328) \( M \)$ to $E_6^(10 \, 332) \( M \)$. The same holds on $E_9$ and $E_10$;]
  + #emph[$E_10^(f \, 322 + f) \( M \) = 0$ for every $f equiv 2 med \( mod med 4 \)$ with $f gt.eq 14$.]
] <finite:main>

=== 7.2 The finite affine family of possible differentials <the-finite-affine-family-of-possible-differentials>

The three rank calculations in Table 4 fix the low-dimensional classes and the cubic relation. In the cochain complex of Appendix 8, let $n_(-) \, n \, n_(+)$ be the dimensions of the three terms surrounding the indicated bidegree. Let $r_(-)$ and $r$ be the incoming and outgoing coboundary ranks. For a displayed list $C$ of cocycle representatives, let $r_C$ be the rank obtained by adjoining those columns to the incoming coboundary matrix.

#figure(
  table(
  columns: 9,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$f$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$n_(-)$
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$n_(+)$
], table.cell(rowspan: 1, colspan: 1)[$r_(-)$
], table.cell(rowspan: 1, colspan: 1)[$r$
], table.cell(rowspan: 1, colspan: 1)[$r_C$
], table.cell(rowspan: 1, colspan: 1)[$C$
]),
  table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$27$
], table.cell(rowspan: 1, colspan: 1)[$12$
], table.cell(rowspan: 1, colspan: 1)[$49$
], table.cell(rowspan: 1, colspan: 1)[$94$
], table.cell(rowspan: 1, colspan: 1)[$11$
], table.cell(rowspan: 1, colspan: 1)[$35$
], table.cell(rowspan: 1, colspan: 1)[$14$
], table.cell(rowspan: 1, colspan: 1)[$v^26 a \, med y \, med t'_7$
],
  table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$10$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$0$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$v b^3$
],
  table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$81$
], table.cell(rowspan: 1, colspan: 1)[$9301$
], table.cell(rowspan: 1, colspan: 1)[$11419$
], table.cell(rowspan: 1, colspan: 1)[$12864$
], table.cell(rowspan: 1, colspan: 1)[$5256$
], table.cell(rowspan: 1, colspan: 1)[$6156$
], table.cell(rowspan: 1, colspan: 1)[$5256$
], table.cell(rowspan: 1, colspan: 1)[$B \( y \)^3$
],
),
  caption: [Table 4: Cochain ranks identifying the distinguished classes. ],
)

The construction and correctness of these matrices are proved in Proposition 71; their finite reduction, and those used below, are specified in Proposition 75. In particular, the table is an exact cochain calculation over $upright(bold(F))_3$, rather than a choice of names for classes in a chart. Since cohomology has dimension $n - r_(-) - r$, it proves

$ "(7.5)" quad D_(1 \, 27) = chevron.l v^26 a \, y \, t'_7 chevron.r \, #h(2em) D_(6 \, 10) = chevron.l v b^3 chevron.r tilde.equiv upright(bold(F))_3 \, #h(2em) B \( y \)^3 = 0 . $ <finite:low-classes>

The three basis elements in $D_(1 \, 27)$ have $t_1^27$ coefficients $0 \, 1 \, 0$. The coefficient is unchanged by a one-cobar boundary: specializing the positive coefficient generators to zero makes every right-unit difference zero. Thus the hypothesized $z$ has the form

$ "(7.6)" quad z = y + e thin t'_7 + mu v^26 a \, #h(2em) e \, mu in upright(bold(F))_3 . $ <finite:z-form>

Write $L = epsilon.alt^(- 1) d_5$, in product coordinates normalized by (7.4). It is a square-zero derivation of bidegree $J$. The elementary vanishing bound

$ "(7.7)" quad D_(f \, d) = 0 quad upright("if") quad d < 3 / 2 f - 1 / 2 $ <finite:elementary-vanishing>

follows from the additive-digit cobar filtration proved in Lemma 68 below: the only generator with positive deficit $3 / 2 f - d$ is the exterior class of weight one, with deficit $1 \/ 2$. Applying this bound to the targets, together with permanence of $a$ and $b$, gives

$ L \( v \) = L \( a \) = L \( b \) = L \( h \) = L \( s' \) = 0 \, #h(2em) L \( c' \) = a b^3 . $

Also $D_(0 \, *) = upright(bold(F))_3 \[ v \]$, so $L$ vanishes in filtration zero. In fact $v$ is permanent: each possible outgoing differential has target $\( r \, 1 + \( r - 1 \) \/ 4 \)$, which vanishes by (7.7) for $r gt.eq 2$, and filtration zero admits no incoming differential. Equation (7.5) implies

$ L \( r \) = k thin v b^3 quad \( k in upright(bold(F))_3 \) . $

Since $z$ is permanent and $L \( v^26 a \) = 0$, Equation (7.6) imposes $L \( y + e thin t'_7 \) = 0$.

We now encode only necessary conditions on this actual differential. For a cutoff $N$, use the finite grid

$ "(7.8)" quad cal(G)_N = { \( f \, d \) : 0 lt.eq d lt.eq N \, med 0 lt.eq f lt.eq 32 \, med 2 d - 3 f gt.eq 0 } . $ <finite:grid>

Put independent unknowns in every entry of $L_T : D_T arrow.r D_(T + J)$ for which both slots belong to the grid. Impose its vanishing in filtration zero. For each

$ x in { a \, v \, h \, b \, c' \, r \, s' \, y + e thin t'_7 } \, $

impose, for every $q in D_T$, the Leibniz identity

$ "(7.9)" quad L \( x q \) = L \( x \) q + \( - 1 \)^(f_x) x L \( q \) $ <finite:leibniz-equations>

whenever the four slots $T \, T + J \, T + \| x \| \, T + \| x \| + J$ are present. The known values of $L \( x \)$ enter as constants. For $s'$ and $y + e thin t'_7$, retain only multiplication maps whose output has weight at most $91$. This restriction deliberately permits unused slots and equations; every equation retained still holds for the actual $L$. In particular, classes on the boundary line excluded by (7.8) are not assigned additional unknown maps.

At cutoff $60$, these are affine linear equations for each of the nine choices $\( k \, e \)$. Their coefficient rank is $2667$ in every case. The augmented rank is $2667$ for $\( k \, e \) = \( 1 \, 0 \)$ and $2668$ for each of the other eight choices. Hence

$ "(7.10)" quad k = 1 \, #h(2em) e = 0 . $ <finite:forced-values>

This proves the first assertion about $z$ in Lemma 65; the cubic assertion was already proved in (7.5). Notice that the correction in (7.2) is essential to this statement.

At cutoff $92$ keep $\( k \, e \) = \( 1 \, 0 \)$ and also impose the necessary #emph[linear consequences] of $L^2 = 0$. More precisely, substitute the current affine parametrization in each available equation $L_(T + J) L_T = 0$. Row-reduce the resulting polynomial equations with all quadratic monomials ordered before the linear monomials and the constant. Rows in which every quadratic term vanishes give affine equations satisfied by every square-zero point. Adjoin these rows to the linear system, parametrize again, and repeat until no new linear condition appears. The resulting ranks are listed in Table 5.

#figure(
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$N$
], table.cell(rowspan: 1, colspan: 1)[$upright("unknown entries")$
], table.cell(rowspan: 1, colspan: 1)[$upright("initial affine rank")$
], table.cell(rowspan: 1, colspan: 1)[$upright("new affine constraints")$
], table.cell(rowspan: 1, colspan: 1)[$upright("final affine dimension")$
]),
  table.cell(rowspan: 1, colspan: 1)[$60$
], table.cell(rowspan: 1, colspan: 1)[$2779$
], table.cell(rowspan: 1, colspan: 1)[$2667$
], table.cell(rowspan: 1, colspan: 1)[$upright("not imposed")$
], table.cell(rowspan: 1, colspan: 1)[$112$
],
  table.cell(rowspan: 1, colspan: 1)[$92$
], table.cell(rowspan: 1, colspan: 1)[$23384$
], table.cell(rowspan: 1, colspan: 1)[$23119$
], table.cell(rowspan: 1, colspan: 1)[$38 \, med 1 \, med 0$
], table.cell(rowspan: 1, colspan: 1)[$226$
],
),
  caption: [Table 5: Necessary affine conditions on the normalized fifth differential. ],
)

The cutoff-$92$ affine family may contain nonsquare-zero maps. What has been proved, and all that is needed, is that it contains the restriction of the actual $d_5$ after normalization. Neither uniqueness of $d_5$ nor a choice among the remaining $226$ parameters is assumed.

#prodef([Remark 7.3.])[
  (Product signs).  The products used to obtain these matrices are represented by signed chain lifts $phi.alt$ with $partial phi.alt = \( - 1 \)^f phi.alt partial$ for a class of filtration $f$; the fixed class is lifted first. As explained in Appendix 8, comparison with cobar cup products can use the opposite ordering of the factors, giving the sign twist $\( - 1 \)^(f g)$ in filtrations $f \, g$. The two conventions are identified by rescaling filtration $f$ by $\( - 1 \)^(binom(f, 2))$. Transporting the differential through this identification gives the corresponding row signs, and a further unit normalizes $L \( c' \) = a b^3$. All displayed systems use this consistent convention. Such changes preserve the kernels, images, ranks, and lines of possible $d_9$ values used below.
] <finite:signs>

=== 7.3 Universal bounds for kernels and images <universal-bounds-for-kernels-and-images>

For a projected matrix of the final affine family, write $A \( u \) = A_0 + sum_(i = 1)^r u_i A_i$. Parameters may be correlated across different matrices. Define

$ "(7.11)" quad K^(-) & = ⋂_(i = 0)^r ker A_i \, & K^(+) & = A_0^(- 1) (sum_(i = 1)^r "im" A_i) \,\
I^(-) & = A_0 (⋂_(i = 1)^r ker A_i) \, & I^(+) & = sum_(i = 0)^r "im" A_i . $ <finite:kernel-bounds>

For an empty set of parameter matrices, the intersection is the whole source and the sum is zero.

#thm([Lemma 7.4.])[
  #emph[For every parameter value $u$ one has 
$ K^(-) subset.eq ker A \( u \) subset.eq K^(+) \, #h(2em) I^(-) subset.eq "im" A \( u \) subset.eq I^(+) . $

]
] <finite:bounds-valid>

#proof[
  Every $A_i$ annihilates a vector in $K^(-)$. If $A \( u \) x = 0$, then $A_0 x = - sum_(i > 0) u_i A_i x$, proving the second kernel inclusion. If all $A_i$ for $i > 0$ annihilate $x$, then $A \( u \) x = A_0 x$; this proves the first image inclusion. The last follows directly from the formula for $A \( u \)$. No independence assumption on the parameters is used. ◻
]

At a slot $p$, let $K_p^plus.minus$ denote these bounds for the map out of $p$, and $I_p^plus.minus$ the bounds for the map into $p$. Negative filtration is zero. If an otherwise relevant pair is unavailable, use zero as a lower bound and the whole source or target as the upper bound. Table \[finite:enclosures\] records the resulting dimensions; its column $D$ means $dim D_(f \, d)$.

$f & d & D & I^(-) & I^(+) & K^(-) & K^(+) & f & d & D & I^(-) & I^(+) & K^(-) & K^(+)\
4 & 69 & 7 & 0 & 0 & 4 & 4 & 13 & 71 & 7 & 3 & 3 & 3 & 4\
12 & 76 & 9 & 4 & 5 & 6 & 6 & 21 & 78 & 4 & 2 & 2 & 2 & 2\
5 & 82 & 5 & 0 & 0 & 4 & 4 & 10 & 82 & 8 & 1 & 5 & 6 & 6\
9 & 83 & 6 & 1 & 1 & 2 & 2 & 10 & 83 & 6 & 1 & 1 & 2 & 4\
14 & 84 & 7 & 4 & 4 & 5 & 5 & 7 & 85 & 11 & 0 & 2 & 8 & 9\
18 & 85 & 8 & 3 & 4 & 5 & 5 & 22 & 86 & 4 & 2 & 2 & 2 & 2\
23 & 86 & 7 & 3 & 3 & 3 & 4 & 16 & 87 & 5 & 2 & 2 & 3 & 3\
27 & 87 & 4 & 2 & 2 & 2 & 2 & 15 & 92 & 6 & 2 & 6 & 0 & 6$

The two additional span calculations are

$ "(7.12)" quad dim #scale(x: 120%, y: 120%)[\(] v K_(10 \, 82)^(+) + I_(10 \, 83)^(-) #scale(x: 120%, y: 120%)[\)] = 1 \, #h(2em) dim #scale(x: 120%, y: 120%)[\(] K_(22 \, 86)^(+) + I_(22 \, 86)^(-) #scale(x: 120%, y: 120%)[\)] = 2 . $ <finite:span-dimensions>

As the corresponding $I^(-)$ spaces have dimensions $1$ and $2$, these equations give

$ "(7.13)" quad #scale(x: 120%, y: 120%)[\(] v : H_(10 \, 82) arrow.r H_(10 \, 83) #scale(x: 120%, y: 120%)[\)] = 0 \, #h(2em) H_(22 \, 86) = 0 . $ <finite:first-consequences>

Indeed, $v$ sends every actual cycle in $K_(10 \, 82)^(+)$ into $I_(10 \, 83)^(-)$, an actual boundary; at $\( 22 \, 86 \)$ every actual cycle is already in the indicated lower bound for boundaries. The first identity denotes the zero map, not a claim that $H_(10 \, 83)$ itself vanishes. Since $v$ is permanent, this proves Lemma 65(ii) on all the stated pages.

=== 7.4 A uniform estimate in high filtration <a-uniform-estimate-in-high-filtration>

The next estimate supplies the two product maps that lie beyond the finite affine calculation and handles the rest of the stem.

#thm([Lemma 7.5.])[
  (High-weight product bound).  #emph[For $k gt.eq 1$, multiplication by $b^k$ into $D_(f \, d)$ is surjective if 
$ "(7.14)" quad d < S_k \( f \) := 9 / 2 f + 1 / 2 - 6 k \, $ <finite:surjective-bound>

 and injective if 
$ "(7.15)" quad d < I_k \( f \) := 9 / 2 f - 4 - 6 k = S_k \( f - 1 \) . $ <finite:injective-bound>

]
] <finite:highweight>

#proof[
  Use the ordinary normalized cobar complex. Order its monomials first by increasing number of coefficient factors $v_i$, counted with multiplicity; next by decreasing total coefficient weight; and finally by the decreasing lexicographic order on the total $t_i$ exponent tuple, with the largest index dominant. Filter by tails of this order. At a fixed internal weight this filtration is finite, including across all cobar lengths.
  The ideal generated by the positive-degree coefficients is invariant under the right unit. Thus a right-unit correction cannot decrease the coefficient count. If it preserves that count and introduces a nonconstant $t$ monomial, it decreases the coefficient weight. After setting the coefficients to zero, each nonadditive coproduct term of $t_i$ uses lower-index $t$’s and hence decreases the final tuple. These assertions follow directly from the Hazewinkel recursion of Appendix 8. They show that the associated graded cobar differential is the one for ordinary additive coordinates with primitive coefficients.
  The cohomology of this associated graded complex is
  $ "(7.16)" quad upright(bold(F))_3 \[ v_1 \, v_2 \, dots.h \] ⊗ ⨂_(i gt.eq 1 \, thin j gt.eq 0) #scale(x: 120%, y: 120%)[\(] Lambda \( e_(i \, j) \) ⊗ upright(bold(F))_3 \[ c_(i \, j) \] #scale(x: 120%, y: 120%)[\)] \, $ <finite:additive-page>
  where, for $w_(i \, j) = 3^j \( 3^i - 1 \) \/ 2$,
  $ \| e_(i \, j) \| = \( 1 \, w_(i \, j) \) \, #h(2em) \| c_(i \, j) \| = \( 2 \, 3 w_(i \, j) \) . $
  One obtains this formula by writing each additive coordinate in base-three digits. Its graded dual is a tensor product of truncated polynomial algebras $upright(bold(F))_3 \[ x \] \/ \( x^3 \)$, with $x$ of weight $w_(i \, j)$. The alternating free resolution with maps $x$ and $x^2$ has one exterior Ext generator in degree $\( 1 \, w_(i \, j) \)$ and one polynomial generator in degree $\( 2 \, 3 w_(i \, j) \)$. Tensoring these resolutions gives (7.16); only finitely many factors occur in any fixed weight.
  The leading class of $b$ on this page is $c_(1 \, 0)$. Indeed, $h = t_1^3 - v_1^2 t_1$, and its integral Bockstein has coefficient-free part
  $ t_1^2 divides t_1 + t_1 divides t_1^2 \, $
  the standard polynomial generator for the weight-one digit. All the other terms have positive coefficient count.
  For a monomial on (7.16) define its deficit to be $9 / 2 f - d$. Among exterior generators the only positive deficits occur at weights $1 \, 3 \, 4$, and they are respectively $7 \/ 2 \, 3 \/ 2 \, 1 \/ 2$. As these generators are exterior, their total contribution is at most $11 \/ 2$. The polynomial generator $b$ has deficit $6$; every other polynomial generator and every coefficient factor has nonpositive deficit. Consequently a monomial not divisible by $b^k$ has deficit at most
  $ 11 / 2 + 6 \( k - 1 \) = 6 k - 1 / 2 . $
  It follows that the quotient of (7.16) by $b^k$ vanishes in bidegree $\( f \, d \)$ when $d < S_k \( f \)$. Multiplication by $b^k$ on that page is injective everywhere.
  To transfer these assertions to $D$, take the filtered mapping cone $Q$ of the cochain cup map
  $ b^k : C^(* - 2 k \, d - 3 k) arrow.r C^(* \, d) . $
  Shift the source filtration by the leading monomial of $b^k$. The first cohomology page of the cone is exactly the quotient just described, since its leading cup map is injective. The filtration is finite in fixed weight, so $H^(f \, d) \( Q \) = 0$ for $d < S_k \( f \)$. The long exact sequence contains
  $ H^(f - 1 \, d) \( Q \) arrow.r D_(f - 2 k \, d - 3 k) arrow.r^(med b^k med) D_(f \, d) arrow.r H^(f \, d) \( Q \) . $
  Vanishing of the right term proves surjectivity. Vanishing of the left term uses $d < S_k \( f - 1 \)$ and proves injectivity, including the one-filtration shift in (7.15). ◻
]

We spell out how ranks on $D$ pass to its $L$-homology. Since $b$ has even filtration and $L \( b \) = 0$, every power $q = b^k$ is a map of the complexes defined by $L$.

#thm([Lemma 7.6.])[
  (Lifting cycles and boundaries).  #emph[Let $q = b^k$ and let $t$ be a target slot.]
  + #emph[If multiplication by $q$ is surjective into $D_t$ and injective into $D_(t + J)$, it is surjective into $H_t$.]
  + #emph[If it is injective into $D_t$ and surjective into $D_(t - J)$, it is injective into $H_t$.]
] <finite:homology-transfer>

#proof[
  For (i), lift a cycle $c in D_t$ to $x$ with $q x = c$. Then $q L x = L c = 0$, and injectivity into $D_(t + J)$ gives $L x = 0$. For (ii), suppose $x$ is a cycle and $q x = L y$ in $D_t$. Surjectivity into $D_(t - J)$ gives $y = q z$. Hence $q \( x - L z \) = 0$; injectivity into $D_t$ gives $x = L z$. ◻
]

=== 7.5 Vanishing after the ninth differential <vanishing-after-the-ninth-differential>

We now prove Lemma 65(iii). First, $H_(22 \, 86) = 0$ by (7.13), so its $d_9$-homology vanishes as well.

The remaining low-filtration vanishings will use $d_9 \( P \) = epsilon.alt' b^6$ to turn cycles into boundaries. We seek positive integers $h_0 \, ell$ with $h_0 + ell = 6$ and classes $\[ x \] \, \[ w \]$ in $H$ such that a given $d_9$-cycle $c$ satisfies

$ c = b^(h_0) \[ x \] \, #h(2em) P \[ x \] = b^ell \[ w \] . $

If multiplication by $b^(h_0)$ is injective from the slot of $d_9 \[ x \]$, then $d_9 \[ x \] = 0$. Applying $d_9$ to the second factorization gives $b^ell d_9 \[ w \] = epsilon.alt' b^ell c$. A second injection, this time by $b^ell$ on the slot containing $c$, makes $c$ a boundary. We first encode these factorizations using bounds valid for the actual $L$; the required injection tests follow.

Addition and subtraction of slots always mean bidegree addition and subtraction; an element in a subscript denotes its bidegree. For $m = \( 14 \, 84 \)$ and $\( 18 \, 85 \)$ respectively set

$ h_0 = 5 \, 3 \, #h(2em) ell = 6 - h_0 \, #h(2em) u = m - h_0 \| b \| \, quad p = u + \| P \| \, quad z = p - ell \| b \| . $

Thus the complete degree data are

$ m & h_0 & ell & u & p & z\
\( 14 \, 84 \) & 5 & 1 & \( 4 \, 69 \) & \( 7 \, 85 \) & \( 5 \, 82 \)\
\( 18 \, 85 \) & 3 & 3 & \( 12 \, 76 \) & \( 15 \, 92 \) & \( 9 \, 83 \) . $

For these choices define

$ "(7.17)" quad A = { x in K_u^(-) : P x in I_p^(-) + b^ell K_z^(-) } \, #h(2em) F = I_m^(-) + b^(h_0) A . $ <finite:cancellation-spaces>

The relevant dimensions are recorded in Table 6.

#figure(
  table(
  columns: 4,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$m$
], table.cell(rowspan: 1, colspan: 1)[$dim A$
], table.cell(rowspan: 1, colspan: 1)[$dim F$
], table.cell(rowspan: 1, colspan: 1)[$dim \( F + K_m^(+) \)$
]),
  table.cell(rowspan: 1, colspan: 1)[$\( 14 \, 84 \)$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$5$
],
  table.cell(rowspan: 1, colspan: 1)[$\( 18 \, 85 \)$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$5$
],
),
  caption: [Table 6: Dimensions of the cancellation subspaces. ],
)

For the second row there is a useful simplification of the product calculation. Set $W = I_(15 \, 92)^(-) + b^3 K_(9 \, 83)^(-)$. The same column reductions give

$ "(7.18)" quad dim W = 3 \, quad "rank" #scale(x: 120%, y: 120%)[\(] a : D_(14 \, 91) arrow.r D_(15 \, 92) #scale(x: 120%, y: 120%)[\)] = 3 \, quad dim #scale(x: 120%, y: 120%)[\(] W + a D_(14 \, 91) #scale(x: 120%, y: 120%)[\)] = 3 . $ <finite:factorization-containment>

Thus $a D_(14 \, 91) subset.eq W$. Since $P = a B \( t'_4 \)$, its entire image from $D_(12 \, 76)$ lies in $W$, and $A = K_(12 \, 76)^(-)$. The first row uses the product $P : D_(4 \, 69) arrow.r D_(7 \, 85)$ directly. This proves the second row without requiring a separate matrix for $B \( t'_4 \) : D_(12 \, 76) arrow.r D_(14 \, 91)$.

Table 7 gives three tests for injectivity after taking $L$-homology.

#figure(
  table(
  columns: 5,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$f$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$dim I_(f \, d)^(-)$
], table.cell(rowspan: 1, colspan: 1)[$dim (I_(f \, d)^(-) + { x in K_(f \, d)^(+) : b^n x in I_(\( f \, d \) + n \| b \|)^(+) })$
]),
  table.cell(rowspan: 1, colspan: 1)[$13$
], table.cell(rowspan: 1, colspan: 1)[$71$
], table.cell(rowspan: 1, colspan: 1)[$5$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$3$
],
  table.cell(rowspan: 1, colspan: 1)[$21$
], table.cell(rowspan: 1, colspan: 1)[$78$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$2$
],
  table.cell(rowspan: 1, colspan: 1)[$14$
], table.cell(rowspan: 1, colspan: 1)[$84$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
),
  caption: [Table 7: Enclosure tests for injectivity on fifth-differential homology. ],
)

In each row, an actual cycle whose product by $b^n$ is an actual boundary lies in the displayed preimage. Equality of the two dimensions forces that cycle into $I_(f \, d)^(-)$, so it was already a boundary. Hence the three displayed powers of $b$ are injective on $H$ from their indicated source slots.

Finally, Table 8 gives multiplication ranks on $D$ itself. The slot $\( f \, d \)$ is the #emph[target]; the source is $\( f - 2 n \, d - 3 n \)$.

#figure(
  table(
  columns: 6,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$f$
], table.cell(rowspan: 1, colspan: 1)[$d$
], table.cell(rowspan: 1, colspan: 1)[$n$
], table.cell(rowspan: 1, colspan: 1)[$dim upright(" source")$
], table.cell(rowspan: 1, colspan: 1)[$dim upright(" target")$
], table.cell(rowspan: 1, colspan: 1)[$"rank" \( b^n \)$
]),
  table.cell(rowspan: 1, colspan: 1)[$22$
], table.cell(rowspan: 1, colspan: 1)[$91$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$8$
], table.cell(rowspan: 1, colspan: 1)[$8$
],
  table.cell(rowspan: 1, colspan: 1)[$17$
], table.cell(rowspan: 1, colspan: 1)[$90$
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$7$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$6$
],
  table.cell(rowspan: 1, colspan: 1)[$19$
], table.cell(rowspan: 1, colspan: 1)[$93$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$6$
],
  table.cell(rowspan: 1, colspan: 1)[$26$
], table.cell(rowspan: 1, colspan: 1)[$87$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
  table.cell(rowspan: 1, colspan: 1)[$31$
], table.cell(rowspan: 1, colspan: 1)[$88$
], table.cell(rowspan: 1, colspan: 1)[$6$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
], table.cell(rowspan: 1, colspan: 1)[$4$
],
),
  caption: [Table 8: Ranks of multiplication by powers of $b$ on $D$. ],
)

All the displayed subspace calculations use kernels, images, preimages, and ranks of the specified finite matrices. Proposition 75 gives their construction and reduction over $upright(bold(F))_3$.

Consider $m = \( 14 \, 84 \)$ or $\( 18 \, 85 \)$ with the data in (7.17). We need two injections on $H$. First, $b^(h_0)$ is injective from $H_(u + R)$: these are exactly the first two rows of Table 7, with sources $\( 13 \, 71 \)$ and $\( 21 \, 78 \)$. Second, $b^ell$ is injective from $H_m$. For $m = \( 14 \, 84 \)$ this is the third row of that table. For $m = \( 18 \, 85 \)$, the first two rows of Table 8 and Lemma 69(ii) imply that $b^2$ is injective from $H_(18 \, 85)$ into $H_(22 \, 91)$: it is injective into $D_(22 \, 91)$ and surjective into $D_(17 \, 90)$. Multiplication by one further $b$ is injective from $H_(22 \, 91)$ into $H_(24 \, 94)$. Indeed, it is surjective into $D_(19 \, 93)$ by the third product-rank row and injective into $D_(24 \, 94)$ by Lemma 68, since

$ 94 < I_1 \( 24 \) = 98 . $

Their composite is the required injection by $b^3$ from $H_m$.

Let $c in H_m$ be a $d_9$-cycle. Equality of the last two dimensions in Table 6 gives $K_m^(+) subset.eq F$. Any representative of $c$ is an actual $L$-cycle, hence belongs to $K_m^(+)$; its component in $I_m^(-)$ is an actual boundary. Thus

$ c = b^(h_0) \[ x \] quad upright("for some ") x in A subset.eq K_u^(-) . $

By the definition of $A$ there is $w in K_z^(-)$ with

$ P \[ x \] = b^ell \[ w \] quad upright("in ") H_p . $

Both $x$ and $w$ are actual $L$-cycles because they lie in lower kernel bounds. The first required injection now gives

$ 0 = d_9 c = b^(h_0) d_9 \[ x \] quad arrow.r.double quad d_9 \[ x \] = 0 . $

Apply $d_9$ to the preceding product identity. Using (7.4), permanence of $b$, and the Leibniz rule yields

$ b^ell d_9 \[ w \] = d_9 \( P \[ x \] \) = epsilon.alt' b^6 \[ x \] = epsilon.alt' b^ell c . $

Here $z + R = m$, since $\| P \| + R = 6 \| b \|$. The second required injection therefore implies $d_9 \[ w \] = epsilon.alt' c$. Since $epsilon.alt'$ is a unit, $c$ is a boundary. This proves vanishing at $m = \( 14 \, 84 \)$ and $\( 18 \, 85 \)$.

At $m = \( 26 \, 87 \)$, the last two rows of Table 8 and Lemma 69(i) show that $b^6$ surjects onto $H_m$: it surjects onto $D_(26 \, 87)$ and injects into $D_(31 \, 88)$. To see that $b^6$ is injective on $H$ into $m + R = \( 35 \, 89 \)$, apply Lemma 69(ii) and the strict inequalities

$ 89 < I_6 \( 35 \) = 235 / 2 \, #h(2em) 88 < S_6 \( 30 \) = 199 / 2 . $

Thus a $d_9$-cycle $c in H_m$ can be written $c = b^6 x$; its differential vanishes only if $d_9 x = 0$. Equation (7.4) then gives $d_9 \( P x \) = epsilon.alt' c$, proving vanishing at $\( 26 \, 87 \)$.

It remains to treat $f gt.eq 30$ with $f equiv 2 med \( mod med 4 \)$ and $m = \( f \, d \)$, where $d = \( 322 + f \) \/ 4$. Lemma 68 gives all four maps needed to repeat the same argument:

$ b^6 upright(" surjects into ") D_m & quad upright("if ") 17 f > 464 \,\
b^6 upright(" injects into ") D_(m + J) & quad upright("if ") 17 f > 396 \,\
b^6 upright(" injects into ") D_(m + R) & quad upright("if ") 17 f > 328 \,\
b^6 upright(" surjects into ") D_(m + R - J) & quad upright("if ") 17 f > 396 . $

Each inequality holds for $f gt.eq 30$. Hence $b^6$ is surjective into $H_m$ and injective into $H_(m + R)$ by Lemma 69. For any $d_9$-cycle $c = b^6 x$, injectivity forces $d_9 x = 0$, and then $d_9 \( P x \) = epsilon.alt' c$. This proves the remaining vanishings and completes the proof of Lemma 65.

== 8 A finite recurrence for the algebraic calculations <app:recurrence>

This appendix specifies the finite arithmetic behind the tables in Section 7. Its input is the integral Brown–Peterson Hopf algebroid, and its operations are polynomial multiplication, coefficient extraction, and elimination over $upright(bold(F))_3$. In particular, neither an Ext chart nor a choice of unlisted Adams–Novikov differentials is an input. The distinction between a coboundary in the algebraic complex and a topological spectral-sequence differential will be maintained throughout: we write $partial$ for a resolution differential, $d_C$ for its cochain differential, and $L$ for the normalized possible $d_5$ of Section 7.

=== 8.1 Integral structure constants and the algebra of operators <integral-structure-constants-and-the-algebra-of-operators>

Divide internal degrees by four, and put

$ w_i = frac(3^i - 1, 2) \, #h(2em) \| Q \| = sum_(i gt.eq 1) Q_i w_i \, #h(2em) B = upright(bold(F))_3 \[ v_1 \, v_2 \, dots.h \] \, #h(2em) \| v_i \| = \| t_i \| = w_i . $

All multi-indices have nonnegative integer entries and finite support. The notation $\[ t^T \]$ means coefficient extraction, leaving the coefficient polynomial in the $v_i$. The same convention applies to several successive sets of $t$ variables.

Here is a recursive specification of all structure constants used below. Work first in $upright(bold(Q)) \[ v_1 \, v_2 \, dots.h \, t_1 \, t_2 \, dots.h \]$, put $l_0 = t_0 = 1$, and successively calculate

$ "(8.1)" quad 3 l_n & = sum_(j = 0)^(n - 1) l_j v_(n - j)^(3^j) \, & rho_n & = sum_(j = 0)^n l_j t_(n - j)^(3^j) \,\
R_0 & = 1 \, & R_n & = 3 rho_n - sum_(j = 1)^(n - 1) rho_j R_(n - j)^(3^j) . $ <alg:logarithms>

Then $R_n = eta_R \( v_n \)$ and $rho_n = eta_R \( l_n \)$. Introduce a second set $s_i$ of strict-isomorphism coordinates, with $s_0 = 1$. With $D_0 = 1$, define

$ "(8.2)" quad D_n = sum_(j + k + h = n) l_j t_k^(3^j) s_h^(3^(j + k)) - sum_(j = 1)^n l_j D_(n - j)^(3^j) . $ <alg:coproduct>

Thus $D_n = Delta \( t_n \)$, with $t_i = t_i ⊗ 1$ and $s_i = 1 ⊗ t_i$. These are the standard Hazewinkel coordinates for the integral $upright(B P)$ Hopf algebroid; in particular the rational expressions for $R_n \, D_n$ are integral at three [32] Theorem A2.1.27, Equation (A2.2.1), and Theorem A2.2.3. This use of the standard presentation is the only structure theorem needed for the arithmetic. Formula (8.2) is equivalently the identity obtained by composing two strict isomorphisms and comparing logarithms. Coefficients in a tensor product are always written in the leftmost factor. Moving a coefficient from a later factor to this form uses $eta_R$, not the left unit.

For ordinary calculations reduce $R_n \, D_n$ modulo three after performing the integral divisions. For a Bockstein, retain their values modulo nine until after division by three. Only $1 lt.eq i lt.eq 4$ can occur at any of our cutoffs, because $w_5 = 121 > 93$. For example,

$ eta_R \( v_1 \) & = v_1 \, & eta_R \( v_2 \) & = v_2 + v_1 t_1^3 - v_1^3 t_1 quad med \( mod med 3 \) \,\
eta_R \( v_1 \) & = v_1 + 3 t_1 \, & eta_R \( v_2 \) & = v_2 + 3 t_2 + 5 v_1^3 t_1 + v_1 t_1^3 quad med \( mod med 9 \) . $

Exact rational polynomial arithmetic followed by integral reduction is one way to implement these instructions; no division in $upright(bold(F))_3$ is intended.

Let $P_T$ be the operation dual to $t^T$, and let $P_0 = 1$. The left $B$-module of operations has basis $P_T$, with multiplication and action on $B$ prescribed by

$ "(8.3)" quad P_S v^Q P_T & = sum_(I lt.eq S) med sum_U \[ t^I \] eta_R \( v^Q \) thin \[ t^(S - I) s^T \] Delta \( t^U \) thin P_U \,\
P_S \( v^Q \) & = \[ t^S \] eta_R \( v^Q \) . $ <alg:operator-product>

Denote this algebra by $cal(U)$. Its products are understood in the degreewise completion specified below. Associativity and the module identity for (8.3) follow respectively by extracting coefficients from coassociativity and from the compatibility of $Delta$ with $eta_R$. Alternatively, both identities follow directly by evaluating a composite of three strict isomorphisms in either order. The coefficient subalgebra $B subset cal(U)$ need not be central. The augmentation of its left module resolution is the $cal(U)$-linear map

$ "(8.4)" quad epsilon : cal(U) arrow.r B \, #h(2em) epsilon \( u \) = u \( 1 \) \, #h(2em) epsilon \( v^Q P_T \) = cases(delim: "{", v^Q & T = 0 \,, 0 & T eq.not 0 .) $ <alg:augmentation>

It is not necessary, or correct in general, to treat this augmentation as an algebra homomorphism to $B$.

=== 8.2 The additive complex and its contraction <the-additive-complex-and-its-contraction>

The use of an additive associated graded and a smaller resolution belongs to the filtered bar/cobar method developed by May [23] Sections 4, 6–7; the contraction, coefficient corrections, and cutoff comparison needed here are given below.

A #emph[digit] is a pair $nu = \( i \, j \)$ with $i gt.eq 1$, $j gt.eq 0$. Put $m_nu = 3^j upright(bold(e))_i$, where $upright(bold(e))_i$ is the $i$th unit multi-index. Order digits by decreasing $i$, then decreasing $j$. At cutoff $N$ retain only digits with $\| m_nu \| lt.eq N$. A generator $g = \( e_nu \)$ is a tuple of nonnegative integers; set

$ "(8.5)" quad s \( g \) = sum_nu e_nu \, #h(2em) C \( g \) = sum_nu (3 ⌊e_nu / 2⌋ + \( e_nu med mod med 2 \)) m_nu \, #h(2em) w \( g \) = \| C \( g \) \| . $ <alg:generators>

Write $g_(- nu)$ and $g_(+ nu)$ for decrementing or incrementing $e_nu$. The free module $G_s$ has these generators with $s \( g \) = s$. The generator with all entries zero is denoted $g_0$.

Temporarily replace the Hopf algebroid by the additive one, in which the $t_i$ are primitive and all coefficients are invariant. Its dual multiplication is

$ P_S P_T = product_i binom(S_i + T_i, S_i) P_(S + T) . $

Lucas’s formula, or the coefficient identity $\( 1 + z \)^(3^j) = 1 + z^(3^j)$ in characteristic three, splits this algebra into the tensor product of the algebras $upright(bold(F))_3 \[ x_nu \] \/ \( x_nu^3 \)$, where $x_nu = P_(m_nu)$ and $x_nu^2 = - P_(2 m_nu)$. The periodic resolution for one such factor alternates multiplication by $x_nu$ and $x_nu^2$. Its tensor product has differential

$ "(8.6)" quad partial^0 g = sum_(nu : e_nu > 0) \( - 1 \)^(sum_(mu < nu) e_mu) cases(delim: "{", P_(m_nu) g_(- nu) \, & e_nu upright(" odd") \,, - P_(2 m_nu) g_(- nu) \, & e_nu upright(" even") .) $ <alg:additive-differential>

An explicit $B$-linear contraction, denoted $H$, will be useful; this operator is distinct from the homology $H \( D \, d_5 \)$ used in Section 7. In a term $v^Q P_T g$, let $j_0 in { 0 \, 1 \, 2 }$ be the base-three digit of $T_i$ at the position $nu = \( i \, j \)$. Select the first digit for which either $j_0 eq.not 0$ or $e_nu eq.not 0$. For this digit put $h' = 1 + \( e_nu med mod med 2 \)$, and define

$ "(8.7)" quad H \( v^Q P_T g \) = cases(delim: "{", j_0 ! thin v^Q P_(T - h' m_nu) g_(+ nu) \, & j_0 gt.eq h' \,, 0 \, & j_0 < h' \,) $ <alg:contraction>

with value zero if there is no active digit.

#thm([Lemma 8.1.])[
  #emph[If $iota : B arrow.r G_0$ sends $b$ to $b g_0$, then 
$ partial^0 H + H partial^0 = 1 - iota epsilon . $

 The map $H$ preserves the coefficient $v^Q$, the number $\| T \| + w \( g \)$, and the tuple $T + C \( g \)$.]
] <alg:additive-contraction>

#proof[
  For a single digit, let $e$ be the resolution degree and let $j_0 = 0 \, 1 \, 2$ be the operator digit. If $e$ is even, the next boundary multiplies by $P_m$. On the two terms for which $H$ is nonzero its coefficient is $j_0 ! j_0 = 1$ in $upright(bold(F))_3$. If $e$ is odd, the only nonzero case has $j_0 = 2$; the next boundary is $- P_(2 m)$ and the combined coefficient is $- 2 = 1$. On the other terms $H partial^0$ supplies the identity, except at $e = j_0 = 0$, which is the augmentation summand.
  In the tensor product all factors before the first active one have operator digit and resolution degree zero. Hence no additional tensor sign is required in (8.7). Terms differentiating a later factor cancel between $partial^0 H$ and $H partial^0$, because $H$ changes the degree of the selected factor by one. Finally, the increase of $C \( g \)$ on incrementing this factor is exactly $h' m_nu$. This proves all the assertions. ◻
]

=== 8.3 Triangular deformation, finite cutoffs, and exactness <triangular-deformation-finite-cutoffs-and-exactness>

We now deform $partial^0$ to a differential for the actual operator algebra. We order terms so that correcting the leading error leaves only larger terms; consequently only finitely many corrections affect a fixed weight.

The passage from the additive contraction to a deformed resolution is a homological-perturbation construction; see [19] for this method of constructing resolutions and [34] Section 4.8.3, Theorem 51 for the basic perturbation lemma. The completed, semilinear Brown–Peterson implementation and its finite-cutoff arguments are supplied below, rather than taken from those references.

Give a term $v^Q P_T g$ internal degree

$ "(8.8)" quad \| Q \| - \| T \| - w \( g \) $ <alg:dual-degree>

and #emph[pure weight] $\| T \| + w \( g \)$. Within a fixed homogeneous degree, complete by allowing this pure weight to tend to infinity. There are only finitely many terms at each fixed pure weight. Order terms first by increasing pure weight and then by increasing tuple $T + C \( g \)$, using lexicographic order in which the largest index is most significant. Equal terms, including their coefficient monomials, are always combined before a leading part is selected. At pure weight at most $N$ the set of order values is finite.

Two elementary triangularity properties of the structure constants are needed. Modulo three the ideal $\( v_1 \, v_2 \, dots.h \)$ is invariant under $eta_R$. To check this without interchanging division and reduction, let $a_i = R_i \|_(v_1 = v_2 = dots.h.c = 0)$ in the integral polynomial ring. Equations (8.1) and (8.1) give

$ a_i = 3 t_i - sum_(j = 1)^(i - 1) t_j a_(i - j)^(3^j) . $

Induction gives $a_i in 3 upright(bold(Z))_(\( 3 \)) \[ t_1 \, t_2 \, dots.h \]$, proving the assertion. Multiplicativity then preserves every power of this ideal. Also, after setting the $v_i$ to zero,

$ "(8.9)" quad Delta \( t_i \) = sum_(k = 0)^i t_k ⊗ t_(i - k)^(3^k) . $ <alg:coefficient-free-coproduct>

Its two end terms are the primitive terms. Every other term replaces one occurrence of $t_i$ by variables of strictly smaller index.

It follows that a product of pure operators has the additive product as its leading term. Every further term with a positive-weight coefficient has larger pure weight, by homogeneity. Every coefficient-free further term has larger output tuple: a nonprimitive term in the coproduct lowers the input tuple relative to the tuple of the element whose coproduct is being taken. These assertions continue to hold when correction terms are multiplied from the left. A preexisting left coefficient is unchanged, and a coefficient in the positive-degree coefficient ideal remains in that ideal when moved past a left operator, by invariance of the coefficient ideal. For a coefficient-free correction, adding the left operator tuple preserves a strict lexicographic inequality. Consequently any degree-zero differential whose values on generators have leading part (8.6) acts on arbitrary module terms with leading differential $partial^0$.

Here and below, truncation means deletion of all output terms of pure weight greater than the stated cutoff. Suppose $partial_(r + 1)$ is already defined and is exact onto cycles in degree $r$. Define $"Ant"_r \( z \; N \)$ for a cycle $z in G_r$ by the following successive correction procedure. At $r = 0$, “cycle” means an element of $ker epsilon$.

$ "(8.10)" quad u arrow.l 0 \; quad e arrow.l z \;\
upright("while ") e eq.not 0 :\
quad p arrow.l upright("the sum of terms at the least order occurring in ") e \;\
quad z_1 arrow.l H \( p \) \;\
quad u arrow.l u + z_1 \; #h(2em) e arrow.l e - partial_(r + 1) \( z_1 \) quad upright("(truncate at ") N upright(")") \;\
upright("return ") u . $ <alg:antidifferential>

The reference to exactness in this description is justified by the induction in the following proposition; an implementation only needs the already constructed differential.

#thm([Proposition 8.2.])[
  #emph[Starting with $partial_1 = partial_1^0$ and augmentation (8.4), the recursion 
$ "(8.11)" quad partial_s g = p - "Ant"_(s - 2) \( partial_(s - 1) p \; N \) \, #h(2em) p = partial_s^0 g \, #h(2em) s gt.eq 2 \, $ <alg:deformation>

 defines compatible finite truncations of a completed free resolution of the $cal(U)$-module $B$. Every call to (8.10) terminates. Cochains of internal weight $d lt.eq N$ in this resolution calculate the ordinary normalized-cobar cohomology $D_(s \, d)$.]
] <alg:resolution-correct>

#proof[
  First consider a cycle $e$ whose leading part is $p$. The leading part of its boundary is $partial^0 p$, so $partial^0 p = 0$. In degree zero there is no $P_0 g_0$ term, because $epsilon \( e \) = 0$ and distinct coefficient monomials are independent. Lemma 70 therefore gives $partial^0 H \( p \) = p$ in every relevant degree. Subtracting $partial H \( p \)$ removes precisely the leading part and introduces only larger order values. It preserves the cycle condition. Since only finitely many order values occur below $N$, the procedure terminates and returns a preimage of $e$.
  For the induction on $s$, $epsilon partial_1 = 0$. The preceding argument with $r = 0$ proves exactness at $G_0$. Assume the differentials through $partial_(s - 1)$ have been constructed, their successive composites vanish, and cycles in $G_(s - 2)$ can be lifted. The error $partial_(s - 1) p$ in (8.11) is such a cycle. Its additive leading part vanishes because $\( partial^0 \)^2 = 0$, so all corrections have order strictly larger than that of $g$. Equation (8.11) gives $partial_(s - 1) partial_s g = 0$ and preserves the required leading part. The first paragraph now lifts every cycle in $G_(s - 1)$. This completes the induction and proves exactness at each finite cutoff.
  We give the completion and comparison details to ensure that finite truncation has not changed the invariant being calculated. From (8.3), an output operator $P_U$ in $P_S v^Q P_T$ satisfies
  $ "(8.12)" quad \| U \| gt.eq \| T \| . $ <alg:right-weight-bound>
  To see this, take a contributing coefficient of $Delta \( t^U \)$. If its coefficient has weight $c gt.eq 0$, homogeneity gives $\| U \| = \| S - I \| + \| T \| + c$. Thus an output expansion on a free generator may be truncated before acting on it from the left: discarded output terms cannot return below the cutoff. Input truncation is justified separately. Degree-zero differentials preserve a coefficient already on the far left, and their generator values have nonnegative new coefficient weight, so they do not decrease pure weight. The contraction preserves it. The constructions at successive cutoffs therefore agree under truncation. Taking their compatible limits gives exact lifting in the completed modules, rather than relying on an exactness theorem for an infinite dual.
  For comparison use the normalized relative bar resolution of $B$ over $cal(U)$ relative to $B$. It is left free on the words $\[ P_(T_1) \| dots.h.c \| P_(T_s) \]$, $T_i eq.not 0$. This description remains valid for noncentral $B$: move coefficient factors left by the balancing relation and (8.3). The differential multiplies successive entries with the alternating bar signs, including the first left multiplication and the last action on $1 in B$; an entry in $B$ at a normalized position is discarded. For example its degree-two boundary is
  $ P_S \[ P_T \] - \[ P_S P_T \] + \[ P_S \] P_T \( 1 \) \, $
  with the middle term expanded and normalized. A $B$-linear contracting homotopy inserts the left $P_T$ as the first word entry when $T eq.not 0$ and is zero when $T = 0$, while keeping its coefficient on the far left. The usual adjacent terms in the two composites cancel; the sole uncancelled term is the original word, with the augmentation term removed in degree zero. This verifies the contraction directly. It preserves pure weight, where a word generator has weight $sum \| T_i \|$.
  Construct a chain map from $G$ to this bar resolution by sending $g_0$ to the empty word and, on each further generator, applying the bar contraction to the image of its boundary. Construct the reverse map using (8.10). Their composites are homotopic to the identity: after the homotopy has been defined in lower degrees, its next required value is a cycle, and the corresponding contraction or antidifferential supplies a preimage. This also proves independence of all choices of lifts. Every map and homotopy has the cutoff compatibility just proved.
  Finally a cochain of weight $d$ takes a generator of weight $w \( g \)$ to a polynomial of weight $d - w \( g \)$. Evaluation of $v^Q P_T g$ uses $P_T$ on that polynomial, which is zero if $\| T \| + w \( g \) > d$. Only finitely many terms of any comparison or homotopy can consequently be seen by such a cochain. Cochains on the relative bar identify with the ordinary cobar by coefficient extraction: multiplying adjacent operators is dual to inserting $Delta$, and balancing coefficients is dual to applying $eta_R$. Thus the comparison is a cochain homotopy equivalence in each weight $d lt.eq N$, as asserted. ◻
]

The same argument applies to a free-generator map of internal degree $h$: if the final cochain weight is at most $N$, its output expansion needs only pure weight at most $N - h$. This is the shifted cutoff in the product construction below. A common resolution through weight $93$ and filtration $33$ suffices for all the tables. Smaller cutoffs $60$ and $92$ suffice for their respective affine systems; the cubic check alone needs weight $81$ and filtration $7$.

=== 8.4 Cochain coordinates, Bocksteins, and products <cochain-coordinates-bocksteins-and-products>

At bidegree $\( s \, d \)$ the cochain basis is

$ "(8.13)" quad cal(C)_(s \, d) = { \( Q \, g \) : s \( g \) = s \, med \| Q \| + w \( g \) = d } . $ <alg:cochain-basis>

The basis vector $\( Q \, g \)$ has value $v^Q$ on $g$ and zero on the other generators. If $partial_(s + 1) g' = sum a_(U \, T \, g) v^U P_T g$, the matrix entry of $d_C$ in its column $\( Q \, g \)$ and row $\( Q' \, g' \)$ is

$ "(8.14)" quad sum_(U \, T) a_(U \, T \, g) \[ v^(Q' - U) t^T \] eta_R \( v^Q \) . $ <alg:cochain-matrix>

A coefficient with a negative exponent is zero. This formula is also a direct specification of every scalar in the cochain matrices. The dimensions may be checked before any matrix calculation by

$ "(8.15)" quad sum_(s \, d) \# cal(C)_(s \, d) thin z^s t^d = product_(i gt.eq 1) frac(1, 1 - t^(w_i)) product_nu frac(1 + z t^(\| m_nu \|), 1 - z^2 t^(3 \| m_nu \|)) . $ <alg:dimension-series>

Write $M_(s \, d)$ for the matrix in (8.14). Choose independent incoming columns $B_(s \, d)$ of $M_(s - 1 \, d)$. Extend them, using a kernel basis of $M_(s \, d)$, to a basis $\[ B_(s \, d) divides V_(s \, d) \]$ of $ker M_(s \, d)$. The columns of $V_(s \, d)$ are representatives of the chosen basis of $D_(s \, d)$. For a cycle $z$, solve

$ "(8.16)" quad z = B_(s \, d) lambda + V_(s \, d) mu \; #h(2em) \[ z \] arrow.l.r mu . $ <alg:quotient-coordinates>

This avoids making names for additional Ext generators.

For completeness, the required comparison of named cobar cocycles to these coordinates is especially short. Denote this comparison by $"get"$. In filtrations zero and one,

$ "get" \( q \) \( g_0 \) = q \, #h(2em) "get" \( x \) \( g_nu \) = \[ t^(m_nu) \] x . $

Here $g_nu$ has its single nonzero entry $e_nu = 1$. For a normalized two-cocycle $x$, set

$ "(8.17)" quad "get" \( x \) \( g \) = sum_(v^Q P_T g_nu upright(" in ") partial_2 g) a_(Q \, T \, nu) thin v^Q \[ t^T ⊗ t^(m_nu) \] x . $ <alg:get-two>

This is the degree-two bar comparison in the proof of Proposition 71: its contraction inserts the first operator entry. The term with $T = 0$ has zero coefficient in a normalized two-cocycle. Applying (8.16) gives the class of each named element.

Use the names of Section 7; explicitly, with $v = v_1$,

$ a & = \[ t_1 \] \, & h & = delta_1 \( v_2 \) \, & r & = delta_3 \( v_2^3 \) \,\
s' & = delta_1 \( v_2^2 \) \, & y & = delta_9 \( v_2^9 - v^8 v_2^7 \) \, & t'_i & = delta_1 \( v_2^i \) \, $

where $delta_m \( q \) = \( eta_R \( q \) - q \) \/ v^m$ is calculated after reduction modulo three. For these polynomials divisibility follows directly from $eta_R \( v_2 \) - v_2 = v \( t_1^3 - v^2 t_1 \)$. Their cocycle identities follow by applying the cochain differential to a coefficient coboundary and using invariance of $v$. Notice the exact identity

$ "(8.18)" quad delta_9 \( v_2^9 \) = y + t'_7 . $ <alg:y-convention>

The notation $B \( x \)$ below denotes a Bockstein cochain; the unadorned $B$ still denotes the coefficient ring. If $x$ is a normalized one-cocycle modulo three, lift its coefficients integrally and set

$ "(8.19)" quad B \( x \) = frac(Delta tilde(x) - tilde(x) ⊗ 1 - 1 ⊗ tilde(x), 3) med \( mod med 3 \) . $ <alg:bockstein>

The numerator is divisible by three because $x$ is a cocycle. The last tensor uses the right unit on every coefficient of $tilde(x)$. The identity $d_C^2 = 0$ proves that this is a two-cocycle, and changing the lift changes it by a coboundary. With the convention $d_C x = 1 ⊗ x - Delta x + x ⊗ 1$, it is minus the mod-three reduction of the connecting homomorphism for multiplication by three. In particular

$ "(8.20)" quad b = B \( h \) = t_1^2 ⊗ t_1 + t_1 ⊗ t_1^2 - v thin t_1 ⊗ t_1 . $ <alg:b-sign-check>

Set $c' = B \( r \)$ and $P = a B \( t'_4 \)$. Equations (8.19) and (8.17) also specify $B \( y \)$ without an integral resolution: all integral arithmetic takes place in the ordinary cobar before the comparison.

Here is a complete product rule on the smaller resolution. If a cocycle $p$ has bidegree $\( j \, h \)$, construct $cal(U)$-linear maps $F_s : G_(s + j) arrow.r G_s$ of internal degree $h$ by

$ "(8.21)" quad F_0 \( g \) & = p \( g \) P_0 g_0 \,\
F_s \( g \) & = \( - 1 \)^j "Ant"_(s - 1) #scale(x: 120%, y: 120%)[\(] F_(s - 1) \( partial_(s + j) g \) \; N - h #scale(x: 120%, y: 120%)[\)] \, #h(2em) s gt.eq 1 . $ <alg:lift-base>

Whenever a map is extended to a term $v^Q P_T g$, use (8.3), multiplying the preexisting $v^Q$ on the left last. At $s = 1$ the required augmentation condition is exactly the cocycle condition for $p$. In higher degrees the required cycle condition follows inductively from

$ "(8.22)" quad partial F_s = \( - 1 \)^j F_(s - 1) partial . $ <alg:signed-lift-identity>

Consequently, for a cocycle $x$ of bidegree $\( f \, d \)$, the cochain

$ "(8.23)" quad p star.op x = x F_f $ <alg:product>

is a cocycle of bidegree $\( f + j \, d + h \)$. Reduce it using (8.16). For a slot $T = \( f \, d \)$, write $"mult" \( p \, T \)$ for the matrix whose columns are these coordinates as $x$ ranges over the columns of $V_(f \, d)$. Iterated multiplication, in particular by $b^n$, is composition of these matrices in the indicated successive slots.

There is a useful exact shortcut for a one-cocycle $delta_m \( q \)$. Let $F_q \( g \) = q g$, extended $cal(U)$-linearly. Since $v$ is invariant, it is central in $cal(U)$ modulo three. Thus

$ "(8.24)" quad F_(delta_m \( q \)) = frac(F_q partial - partial F_q, v^m) $ <alg:delta-lift>

is well defined, and its value is obtained by replacing each term $v^Q P_T g'$ in $partial g$ by

$ "(8.25)" quad sum_(0 < I lt.eq T) v^Q \[ t^I \] delta_m \( q \) thin P_(T - I) g' . $ <alg:delta-lift-terms>

Indeed this is precisely (8.3) for the commutator with $q$, with its $I = 0$ term cancelled. Its augmentation in filtration one is the required digit coefficient of $delta_m \( q \)$, and $partial F_(delta_m \( q \)) = - F_(delta_m \( q \)) partial$ follows by expanding the commutator and using $partial^2 = 0$. The shortcut hence computes the same products as (8.21).

#thm([Lemma 8.3.])[
  #emph[The rule (8.23) calculates signed Yoneda products, with the first factor lifted first. It is independent on cohomology of all choices of lifts and representatives. It agrees with the ordinary Ext product with the corresponding ordering convention. If the cobar comparison instead uses the ordinary opposite ordering of the two factors, graded commutativity changes the product formula by $\( - 1 \)^(j f)$ for factors of filtrations $j$ and $f$. This alternative does not alter the use of the affine systems or of their kernel and image bounds.]
] <alg:product-conventions>

#proof[
  The difference of two lifts with the same augmentation is null homotopic: in each successive degree its uncancelled difference is a cycle, which is lifted by (8.10). The same argument applied to a coboundary representative proves independence of that representative. Composition of such lifts is the defining Yoneda composition.
  One may also compare on the relative bar. An unsigned lift applies the cocycle to the last block of entries and retains the first block; move the resulting coefficient left by the balancing relation and discard scalar entries at normalized positions. The interior terms cancel in its chain identity, and the terms crossing the division between blocks cancel by the cocycle equation. Multiplying its component in degree $s$ by $\( - 1 \)^(j s)$ gives (8.22). Evaluation by the other cocycle is the bar, and hence cobar, cup product, with the stated ordering sign.
  To check the final assertion explicitly, suppose an odd-filtration differential $D$ is a left derivation for a product juxtaposed as $x y$, and change to $x star.op y = \( - 1 \)^(f g) x y$, where $x \, y$ have filtrations $f \, g$. Then
  $ D \( x star.op y \) = \( - 1 \)^g D \( x \) star.op y + x star.op D \( y \) . $
  The row rescaling $L \|_(D_(f \, *)) = \( - 1 \)^f D$ therefore obeys the left Leibniz rule for $star.op$, and $L^2 = - D^2 = 0$. Row rescaling preserves every kernel, image, and line of possible cycles. A further common unit puts $L \( c' \) = a b^3$ as in Section 7. The permitted unit in the $d_9$ formula absorbs the analogous convention change there. ◻
]

=== 8.5 Elimination and the literal affine systems <elimination-and-the-literal-affine-systems>

We describe the elimination convention so the recipe specifies finite scalar operations throughout. Choose any fixed total order of the monomials and generators extending their weights; for example order generators by $\( w \( g \) \, C \( g \) \, \( e_nu \) \)$ and then coefficient multi-indices lexicographically. Order slots by $\( d \, f \)$ and matrix entries by row then column. Given a sequence of row vectors, maintain a dictionary of rows with distinct first nonzero positions. For a row $z$, let $i$ be its first nonzero position and $c = z_i$. If a stored row $p_i$ has pivot one at $i$, replace $z$ by $z - c p_i$ and repeat at the new first nonzero position until the row is zero or has an unused pivot. Discard a zero row. At an unused pivot, store $c z$ as $p_i$ and continue with the next input row. The normalization uses $c^(- 1) = c$ for $c = 1 \, 2$ in $upright(bold(F))_3$. The number of stored rows is the rank. Recording the same operations on an identity matrix gives witnesses for dependencies or for solutions.

To solve a homogeneous system, assign independent parameters to the nonpivot variables and substitute the pivot equations in reverse order. For an affine system append a last constant column and put its variable equal to one. A pivot in that last position is an inconsistency certificate; otherwise the same substitution gives a constant solution plus a basis of homogeneous solutions. Kernel, image, intersection, and quotient computations below use only this procedure. The ranks and intrinsic subspaces are independent of the chosen orders and Ext representatives.

For $n = 60$ or $92$, let

$ "(8.26)" quad cal(G)_n = { \( f \, d \) : 0 lt.eq d lt.eq n \, quad 0 lt.eq f lt.eq 32 \, quad 2 d - 3 f gt.eq 0 } . $ <alg:finite-grid>

For every pair $T \, T + J$ in this grid, $J = \( 5 \, 1 \)$, introduce all scalar entries of a matrix $L_T : D_T arrow.r D_(T + J)$ as independent unknowns. Slots of dimension zero contribute no entries. Put $L_T = 0$ at filtration zero. For each $\( k \, e \) in upright(bold(F))_3^2$ use the factors

$ x = a \, v \, h \, b \, c' \, r \, s' \, y + e t'_7 . $

For each complete square $T \, T + J \, T + x \, T + x + J$ in the grid, set

$ "(8.27)" quad L_(T + x) "mult" \( x \, T \) - \( - 1 \)^(f_x) "mult" \( x \, T + J \) L_T = Z_(x \, T) \, $ <alg:leibniz-equations>

where

$ "(8.28)" quad Z_(x \, T) = cases(delim: "{", "mult" \( a \, T + 3 b \) "mult" \( b^3 \, T \) \, & x = c' \,, k "mult" \( v \, T + 3 b \) "mult" \( b^3 \, T \) \, & x = r \,, 0 \, & upright("otherwise") .) $ <alg:leibniz-constants>

For $s'$ and $y + e t'_7$ omit the entire equation if either required factor multiplication has output weight greater than $91$. Include an equation only when every required matrix is available, including intermediate matrices in the displayed successive products. In particular a target lying outside the grid is not silently replaced by a known zero space. This is the literal finite system used in Table 5.

Every matrix equation here is a specified list of scalar affine equations. More explicitly its $\( alpha \, beta \)$ entry is

$ "(8.29)" quad sum_i \( L_(T + x) \)_(alpha i) "mult" \( x \, T \)_(i beta) - \( - 1 \)^(f_x) sum_j "mult" \( x \, T + J \)_(alpha j) \( L_T \)_(j beta) - \( Z_(x \, T) \)_(alpha beta) = 0 . $ <alg:scalar-leibniz>

The named products and coefficients in this formula were fully specified above; in particular the unknown differential is never used to supply an Ext product.

For $n = 60$, solve these systems for all nine $\( k \, e \)$. For $n = 92$, use $\( k \, e \) = \( 1 \, 0 \)$ and refine its affine solution space as follows. Express all entries as affine linear polynomials in its free parameters $u_1 \, dots.h \, u_a$. For every complete triple $T \, T + J \, T + 2 J$ expand every entry of

$ "(8.30)" quad L_(T + J) \( u \) L_T \( u \) $ <alg:square-polynomials>

as a polynomial of degree at most two. Collect the commutative monomials $u_i u_j$ with $i lt.eq j$, then $u_i$, then the constant monomial. Eliminate with all quadratic columns placed first. The rows remaining with no quadratic term are affine linear equations; adjoin them to the system, reparameterize, and repeat until no new restriction is obtained.

#thm([Lemma 8.4.])[
  #emph[Every actual square-zero differential satisfying the imposed Leibniz equations remains in the affine space at every refinement step. The refinement terminates. It makes no assertion that every remaining point is square-zero.]
] <alg:square-soundness>

#proof[
  Each row produced by elimination is an $upright(bold(F))_3$-linear combination of the entries of (8.30). It therefore vanishes at each actual square-zero differential. Rows with no quadratic term are valid affine restrictions on the present parameter space. Substitution of an affine parametrization preserves all such points. Every nontrivial refinement decreases the finite affine dimension, which proves termination. Retaining only the linear consequences uses no claim about all polynomial consequences or about the full set of $upright(bold(F))_3$-points of the quadratic system. ◻
]

=== 8.6 Universal subspaces and the final rank tests <universal-subspaces-and-the-final-rank-tests>

For an outgoing or incoming matrix obtained by projection from the final affine space, write its parametrization as $A \( u \) = A_0 + sum_(i = 1)^a u_i A_i$. Zero or redundant parameter matrices may be discarded. For a column matrix $X$, let $chevron.l X chevron.r$ denote its column span and let $X^perp$ denote a row matrix whose kernel is $chevron.l X chevron.r$. Such a matrix is obtained by computing $ker X^(sans(t))$ and transposing a basis. The following formulas are explicit matrix versions of the enclosures in Section 7:

$ "(8.31)" quad K^(-) & = ker mat(delim: "[", A_0; A_1; dots.v; A_a) \, & K^(+) & = ker #scale(x: 120%, y: 120%)[\(] \[ A_1 \| dots.h.c \| A_a \]^perp A_0 #scale(x: 120%, y: 120%)[\)] \,\
I^(-) & = ⟨A_0 ker mat(delim: "[", A_1; dots.v; A_a)⟩ \, & I^(+) & = chevron.l \[ A_0 \| A_1 \| dots.h.c \| A_a \] chevron.r . $ <alg:kernel-enclosures>

When a space appears as a matrix operand, take any column basis of it. An empty stack of constraints has the full space as its kernel. Negative-filtration groups are zero. At other unavailable incoming or outgoing pairs use the zero space for the lower bound and the entire relevant space for the upper bound.

#thm([Lemma 8.5.])[
  #emph[For every actual matrix $A \( u \)$ in the affine family, 
$ K^(-) subset.eq ker A \( u \) subset.eq K^(+) \, #h(2em) I^(-) subset.eq "im" A \( u \) subset.eq I^(+) . $

 These inclusions remain valid when parameters shared with other matrices are correlated or satisfy further equations.]
] <alg:enclosures-valid>

#proof[
  Every $A_i$ kills $K^(-)$. If $A \( u \) x = 0$, then $A_0 x = - sum_(i > 0) u_i A_i x$ lies in $sum_(i > 0) "im" A_i$, which is the condition defining $K^(+)$. On the common kernel of the $A_i$ with $i > 0$, the map $A \( u \)$ equals $A_0$, proving the lower image inclusion. The upper image inclusion follows by summing the images of its summands. Each argument applies to every single parameter value, so restricting the allowed parameter values cannot invalidate it. ◻
]

Use outgoing matrices at a slot $q$ for $K_q^plus.minus$ and incoming matrices for $I_q^plus.minus$. Here are matrix recipes for every further test; they also fix precisely which preimages and intersections are meant. For the two sum dimensions in Section 7, compute the ranks of

$ \[ "mult" \( v \, \( 10 \, 82 \) \) K_(10 \, 82)^(+) divides I_(10 \, 83)^(-) \] \, #h(2em) \[ K_(22 \, 86)^(+) divides I_(22 \, 86)^(-) \] . $

For the cancellation test with $m \, h_0 \, ell \, u \, p \, z$ as specified there, form

$ "(8.32)" quad W_p & = \[ I_p^(-) divides "mult" \( b^ell \, z \) K_z^(-) \] \,\
A & = K_u^(-) ker #scale(x: 120%, y: 120%)[\(] W_p^perp "mult" \( P \, u \) K_u^(-) #scale(x: 120%, y: 120%)[\)] \,\
F & = \[ I_m^(-) divides "mult" \( b^(h_0) \, u \) A \] . $ <alg:allowed-space>

Take column spans in the second and third lines when computing dimensions. The tested triple is $"rank" A \, "rank" F \, "rank" \[ F divides K_m^(+) \]$. For an injection test at $q = \( f \, d \)$ with exponent $n$, compute

$ "(8.33)" quad "rank" [I_q^(-) med mid(bar.v) quad K_q^(+) ker (\( I_(q + n b)^(+) \)^perp "mult" \( b^n \, q \) K_q^(+))] . $ <alg:injection-test>

Together with $dim I_q^(-)$, this is exactly the pair recorded in Table 7. One can avoid annihilator matrices altogether: the preimage of $chevron.l H chevron.r$ under a matrix $M$ is the projection to the source of $ker \[ M divides - H \]$. This gives an equivalent elimination recipe for all the preimages above.

There is a shorter calculation for the second cancellation triple. Here

$ u = \( 12 \, 76 \) \, quad p = \( 15 \, 92 \) \, quad z = \( 9 \, 83 \) \, quad W_p = I_(15 \, 92)^(-) + b^3 K_(9 \, 83)^(-) . $

Compute the image of $a : D_(14 \, 91) arrow.r D_(15 \, 92)$. The ranks of $W_p$, that image, and their sum are all three. Hence

$ "(8.34)" quad "im" \( a : D_(14 \, 91) arrow.r D_(15 \, 92) \) subset.eq W_p . $ <alg:second-factorization>

Since $P = a B \( t'_4 \)$, every $P x$ in this slot lies in this image. Equation (8.32) therefore has $A = K_(12 \, 76)^(-)$, of dimension six. Only the $a$ matrix and the $b^3$ matrix are required for this containment calculation. The first cancellation triple uses the actual $P$ matrix from $\( 4 \, 69 \)$ to $\( 7 \, 85 \)$.

=== 8.7 Arithmetic checkpoints and reproducibility <arithmetic-checkpoints-and-reproducibility>

#thm([Proposition 8.6.])[
  #emph[The recurrences and elimination instructions in this appendix give the low-cohomology ranks, the affine ranks, the sixteen enclosure rows, the sum dimensions, the two cancellation triples, the three injection tests, and the five ordinary product ranks displayed in Section 7. In particular the weight-$60$ system is consistent exactly for $\( k \, e \) = \( 1 \, 0 \)$, the stable weight-$92$ affine space has dimension $226$, and $B \( y \)^3 = 0$ in $D_(6 \, 81)$.]
] <alg:table-verification>

#proof[
  #emph[Finite calculation.] The following intermediate outputs specify checks on the elimination at each stage, in addition to the final tables. They can be reconstructed without any external list of Ext groups.
  First enumerate (8.5) and (8.13), construct (8.11), and form (8.14). For $\( f \, d \) = \( 1 \, 27 \) \, \( 6 \, 10 \) \, \( 6 \, 81 \)$ the dimensions of the three successive cochain terms are respectively
  $ \( 12 \, 49 \, 94 \) \, #h(2em) \( 3 \, 2 \, 1 \) \, #h(2em) \( 9301 \, 11419 \, 12864 \) . $
  Reducing the incoming and outgoing columns gives ranks
  $ \( 11 \, 35 \) \, #h(2em) \( 1 \, 0 \) \, #h(2em) \( 5256 \, 6156 \) . $
  For the first slot append, in order, the cochains $v^26 a \, y \, t'_7$; the rank becomes $14$. For the second append $v b^3$; the rank becomes $2$. For the third construct $B \( y \)$ by (8.19), apply (8.17), and form its cube using (8.21)–(8.23). Appending this cubic leaves the incoming rank $5256$. Keeping witnesses in column elimination expresses the cubic as a boundary. In these coordinates $B \( y \)$ has eight coefficient terms on six generators, the cubic has $76$ terms, and the resulting preimage can be taken to have $2642$ terms. Substitution in (8.14) verifies its boundary directly. This proves the algebraic zero in the statement.
  For weight $60$, the grid contains $1213$ slots and its complete pairs have $2779$ scalar unknowns. Expanding the zero and Leibniz equations gives $15852$ scalar equations. For each of the nine $\( k \, e \)$ choices, the coefficient rank is $2667$. The augmented rank is $2667$ for $\( 1 \, 0 \)$ and $2668$ for each of the other eight choices. These values are obtained from (8.29), including its constant column; the pivot at the constant position is an explicit linear combination giving $1 = 0$ in each inconsistent case.
  At weight $92$ there are $2269$ slots, of total Ext dimension $6341$, and $1820$ differential pairs with $23384$ entries. The Leibniz assembly uses $15453$ factor multiplication matrices, including successive factors in (8.28). There are $137471$ scalar zero and Leibniz equations, $110060$ of them having nonzero augmented row. Coefficient and augmented ranks are both $23119$. Thus the initial affine dimension is $265$. The successive square eliminations have the following checkpoints:
  $ upright("parameters") & upright("scalar square equations") & upright("polynomial row rank") & upright("new affine restrictions")\
265 & 16412 & 72 & 38\
227 & 16412 & 20 & 1\
226 & 16412 & 19 & 0 $
  In each row quadratic monomials precede linear ones, as specified after (8.30); after the final refinement the affine rank is $23158$. Apply (8.31) and (8.31) to its projected matrices. They give the sixteen rows of Table \[finite:enclosures\]. The two additional stacked ranks are $1$ and $2$. Equations (8.32)–(8.32), using (8.34) in the second case, give $\( 4 \, 5 \, 5 \)$ and $\( 6 \, 5 \, 5 \)$. Equation (8.33) gives the pairs $\( 3 \, 3 \) \, \( 2 \, 2 \) \, \( 4 \, 4 \)$.
  Finally compute the five iterated $b$ maps of Table 8 with cutoff $93$. As a check independent of quotient-coordinate extraction, append the resulting product cochains to the incoming coboundary columns in their target slots. In the order of that table, incoming ranks and ranks after appending are
  $ \( 4491 \, 4499 \) \, quad \( 7540 \, 7546 \) \, quad \( 7589 \, 7595 \) \, quad \( 1868 \, 1872 \) \, quad \( 1000 \, 1004 \) . $
  Their differences are the product ranks $8 \, 6 \, 6 \, 4 \, 4$. All these operations have been reduced to the polynomial recursions, the terminating lifting recursion, and the explicitly stated elimination rules. The equalities used to infer the spectral-sequence conclusions are therefore finite algebra calculations; their use is proved in Section 7. ◻
]

#prodef([Remark 8.7.])[
  (Distinct forms of computational checking).  Reconstructing the larger tables by another implementation of this same recurrence checks its arithmetic, while sharing the mathematical resolution construction. There are also ordinary normalized-cobar calculations which do not use the smaller resolution. For example in weight $27$ their dimensions in filtrations zero and one are $12$ and $470$, and their incoming and outgoing ranks at filtration one are $11$ and $456$. They give the same three-dimensional group with the representatives $v^26 a \, y \, t'_7$. At $\( 6 \, 10 \)$ their middle dimension is $253$, the incoming and outgoing ranks are $162$ and $90$, and appending $v b^3$ increases the incoming rank by one. These different complex sizes distinguish the ordinary-cobar checks from a replay of the smaller-resolution calculation. Verification of the cubic boundary, substitution into the affine equations, and dense elimination for the final subspaces provide further arithmetic checks. None replaces the resolution and comparison proof above or the topological arguments of Section 7.
]

#heading(level: 1)[References]
#bibitem([1])[Steven Amelotte, #emph[The fibre of the degree $3$ map, Anick spaces and the double suspension], Proceedings of the Edinburgh Mathematical Society #strong[63] (2020), 830--843. #link("https://arxiv.org/abs/1908.05302v1")[arXiv:1908.05302v1].]
#bibitem([2])[Gabriel Angelini-Knoll, Mark Behrens, Eva Belmont, and Hana Jia Kong, #emph[A deformation of Borel equivariant homotopy], Advances in Mathematics #strong[484] (2026), 110698. #link("https://doi.org/10.1016/j.aim.2025.110698")[doi:10.1016/j.aim.2025.110698]\; #link("https://arxiv.org/abs/2308.01873v3")[arXiv:2308.01873v3].]
#bibitem([3])[Maria Basterra and Michael A. Mandell, #emph[The multiplication on $B P$], Journal of Topology #strong[6] (2013), 285--310. #link("https://doi.org/10.1112/jtopol/jts032")[doi:10.1112/jtopol/jts032].]
#bibitem([4])[Eva Belmont and Rin Ray, #emph[Towards the $p = 3$ Kervaire Invariant Problem: The $E_2$-page for the homotopy fixed points spectral sequence computing $pi_(*) \( E_6^(h C_9) \)$], preprint, 2025. #link("https://arxiv.org/abs/2507.10157v1")[arXiv:2507.10157v1].]
#bibitem([5])[Eva Belmont and Katsumi Shimomura, #emph[Beta families arising from a $v_2^9$ self map on $S \/ \( 3 \, v_1^8 \)$], Algebraic & Geometric Topology #strong[23] (2023), 4349--4378. #link("https://doi.org/10.2140/agt.2023.23.4349")[doi:10.2140/agt.2023.23.4349]\; #link("https://arxiv.org/abs/2109.01059v2")[arXiv:2109.01059v2].]
#bibitem([6])[Pierre Berthelot and William Messing, #emph[Théorie de Dieudonné cristalline I], Astérisque #strong[63] (1979), 17--37. #link("https://www.numdam.org/item/AST_1979__63__17_0/")[Numdam text].]
#bibitem([7])[William Browder, #emph[The Kervaire invariant of framed manifolds and its generalization], Annals of Mathematics (2) #strong[90] (1969), 157--186. #link("https://doi.org/10.2307/1970686")[doi:10.2307/1970686].]
#bibitem([8])[Ching-Li Chai and Frans Oort, #emph[Moduli of abelian varieties and $p$-divisible groups], in #emph[Arithmetic Geometry], Henri Darmon, David Alexandre Ellwood, Brendan Hassett, and Yuri Tschinkel (eds.), Clay Mathematics Proceedings #strong[8], American Mathematical Society, Providence, RI, 2009, pp.~441--536. #link("https://www.claymath.org/library/proceedings/cmip08c.pdf")[Publisher volume].]
#bibitem([9])[V. G. Drinfeld, #emph[Elliptic modules], Mathematics of the USSR-Sbornik #strong[23] (1974), 561--592. #link("https://doi.org/10.1070/SM1974v023n04ABEH001731")[doi:10.1070/SM1974v023n04ABEH001731].]
#bibitem([10])[Zhipeng Duan, Michael A. Hill, Guchuan Li, Yutao Liu, XiaoLin Danny Shi, Guozhen Wang, and Zhouli Xu, #emph[Periodicity and finite complexity in higher real $K$-theories], preprint, 2025. #link("https://arxiv.org/abs/2512.01161v2")[arXiv:2512.01161v2].]
#bibitem([11])[Paul G. Goerss and Michael J. Hopkins, #emph[Moduli spaces of commutative ring spectra], in #emph[Structured Ring Spectra], Andrew Baker and Birgit Richter (eds.), London Mathematical Society Lecture Note Series #strong[315], Cambridge University Press, Cambridge, 2004, pp.~151--200. #link("https://doi.org/10.1017/CBO9780511529955.009")[doi:10.1017/CBO9780511529955.009]\; #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/sum.pdf")[52-page author preprint].]
#bibitem([12])[J. P. C. Greenlees and Brooke Shipley, #emph[Fixed point adjunctions for equivariant module spectra], Algebraic & Geometric Topology #strong[14] (2014), 1779--1799. #link("https://doi.org/10.2140/agt.2014.14.1779")[doi:10.2140/agt.2014.14.1779].]
#bibitem([13])[Jeremy Hahn, Andrew Senger, and Dylan Wilson, #emph[Odd primary analogs of Real orientations], Geometry & Topology #strong[27] (2023), 87--129. #link("https://doi.org/10.2140/gt.2023.27.87")[doi:10.2140/gt.2023.27.87].]
#bibitem([14])[Michael A. Hill, #emph[Recent computational work on $E O_n$], in #emph[Homotopy Theory], Oberwolfach Reports #strong[4] (2007), 2698--2701, report on joint work with Michael J. Hopkins and Douglas C. Ravenel. #link("https://publications.mfo.de/bitstream/handle/mfo/3031/OWR_2007_45.pdf?isAllowed=y&sequence=1")[Report 45/2007].]
#bibitem([15])[Michael A. Hill, Michael J. Hopkins, and Douglas C. Ravenel, #emph[On the $3$-primary Arf--Kervaire invariant problem], work in progress, 14 September 2011. #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/odd.pdf")[Author manuscript].]
#bibitem([16])[Michael A. Hill, Michael J. Hopkins, and Douglas C. Ravenel, #emph[On the nonexistence of elements of Kervaire invariant one], Annals of Mathematics (2) #strong[184] (2016), 1--262. #link("https://doi.org/10.4007/annals.2016.184.1.1")[doi:10.4007/annals.2016.184.1.1].]
#bibitem([17])[Taira Honda, #emph[Formal groups and zeta-functions], Osaka Journal of Mathematics #strong[5] (1968), 199--213. #link("https://ir.library.osaka-u.ac.jp/repo/ouka/all/8997/ojm05_02_05.pdf")[Publisher text].]
#bibitem([18])[Michael J. Hopkins and Benedict H. Gross, #emph[The rigid analytic period mapping, Lubin--Tate space, and stable homotopy theory], Bulletin of the American Mathematical Society #strong[30] (1994), 76--86. #link("https://doi.org/10.1090/S0273-0979-1994-00438-0")[doi:10.1090/S0273-0979-1994-00438-0]\; #link("https://arxiv.org/abs/math/9401220")[arXiv:math/9401220].]
#bibitem([19])[Larry A. Lambe, #emph[Resolutions via homological perturbation], Journal of Symbolic Computation #strong[12] (1991), 71--87. #link("https://doi.org/10.1016/S0747-7171(08)80140-X")[doi:10.1016/S0747-7171(08)80140-X].]
#bibitem([20])[Michel Lazard, #emph[Sur les groupes de Lie formels à un paramètre], Bulletin de la Société Mathématique de France #strong[83] (1955), 251--274. #link("https://www.numdam.org/article/BSMF_1955__83__251_0.pdf")[Numdam text].]
#bibitem([21])[Jonathan Lubin and John Tate, #emph[Formal complex multiplication in local fields], Annals of Mathematics (2) #strong[81] (1965), 380--387. #link("https://doi.org/10.2307/1970622")[doi:10.2307/1970622].]
#bibitem([22])[Jonathan Lubin and John Tate, #emph[Formal moduli for one-parameter formal Lie groups], Bulletin de la Société Mathématique de France #strong[94] (1966), 49--59. #link("https://doi.org/10.24033/bsmf.1633")[doi:10.24033/bsmf.1633].]
#bibitem([23])[J. Peter May, #emph[The cohomology of restricted Lie algebras and of Hopf algebras], Journal of Algebra #strong[3] (1966), 123--146. #link("https://doi.org/10.1016/0021-8693(66)90009-3")[doi:10.1016/0021-8693(66)90009-3]\; #link("https://www.math.uchicago.edu/~may/PAPERS/3.pdf")[Author text].]
#bibitem([24])[J. Peter May, #emph[A general algebraic approach to Steenrod operations], in #emph[The Steenrod Algebra and its Applications], Lecture Notes in Mathematics #strong[168], Springer, Berlin, 1970, pp.~153--231. #link("https://www.math.uchicago.edu/~may/PAPERS/10.pdf")[Author text].]
#bibitem([25])[Lennart Meier, XiaoLin Danny Shi, and Mingcong Zeng, #emph[The localized slice spectral sequence, norms of Real bordism, and the Segal conjecture], Advances in Mathematics #strong[412] (2023), 108804. #link("https://doi.org/10.1016/j.aim.2022.108804")[doi:10.1016/j.aim.2022.108804]\; #link("https://arxiv.org/abs/2008.04963v4")[arXiv:2008.04963v4].]
#bibitem([26])[Haynes R. Miller, Douglas C. Ravenel, and W. Stephen Wilson, #emph[Periodic phenomena in the Adams--Novikov spectral sequence], Annals of Mathematics (2) #strong[106] (1977), 469--516. #link("https://doi.org/10.2307/1971064")[doi:10.2307/1971064].]
#bibitem([27])[J. S. Milne, #emph[Class Field Theory], version 4.03, 2020. #link("https://www.jmilne.org/math/CourseNotes/CFT.pdf")[Author course notes].]
#bibitem([28])[John Milnor, #emph[The Steenrod algebra and its dual], Annals of Mathematics (2) #strong[67] (1958), 150--171. #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Milnor-A.pdf")[Public text].]
#bibitem([29])[Daniel Quillen, #emph[On the formal group laws of unoriented and complex cobordism theory], Bulletin of the American Mathematical Society #strong[75] (1969), 1293--1298. #link("https://doi.org/10.1090/S0002-9904-1969-12401-8")[doi:10.1090/S0002-9904-1969-12401-8].]
#bibitem([30])[Michael Rapoport and Thomas Zink, #emph[On the Drinfeld moduli problem of $p$-divisible groups], Cambridge Journal of Mathematics #strong[5] (2017), 229--279. #link("https://doi.org/10.4310/CJM.2017.v5.n2.a2")[doi:10.4310/CJM.2017.v5.n2.a2].]
#bibitem([31])[Douglas C. Ravenel, #emph[The non-existence of odd primary Arf invariant elements in stable homotopy], Mathematical Proceedings of the Cambridge Philosophical Society #strong[83] (1978), 429--443. #link("https://doi.org/10.1017/S0305004100054712")[doi:10.1017/S0305004100054712].]
#bibitem([32])[Douglas C. Ravenel, #emph[Complex Cobordism and Stable Homotopy Groups of Spheres], second edition, AMS Chelsea Publishing #strong[347], American Mathematical Society, Providence, RI, 2004. #link("https://www.sas.rochester.edu/mth/sites/doug-ravenel/mybooks/ravenel.pdf")[Author's online edition].]
#bibitem([33])[Rin Ray, #emph[Moduli Stacks of $G$-Curves in Homotopy Theory at Height $p - 1$], preprint, 2026. #link("https://arxiv.org/abs/2509.23428v2")[arXiv:2509.23428v2].]
#bibitem([34])[Julio Rubio and Francis Sergeraert, #emph[Constructive Homological Algebra and Applications], preprint, version 3, 2013. #link("https://arxiv.org/abs/1208.3816v3")[arXiv:1208.3816v3].]
#bibitem([35])[Paul S. Selick, #emph[A reformulation of the Arf invariant one mod $p$ problem and applications to atomic spaces], Pacific Journal of Mathematics #strong[108] (1983), 431--450. #link("https://msp.org/pjm/1983/108-2/pjm-v108-n2-p12-s.pdf")[Publisher text].]
#bibitem([36])[Matthias Strauch, #emph[Galois actions on torsion points of one-dimensional formal modules], Journal of Number Theory #strong[130] (2010), no.~3, 528--533. #link("https://doi.org/10.1016/j.jnt.2009.10.004")[doi:10.1016/j.jnt.2009.10.004]\; #link("https://arxiv.org/abs/0709.3542v1")[arXiv:0709.3542v1 (preprint version)].]
#bibitem([37])[Hirosi Toda, #emph[Extended $p$-th powers of complexes and applications to homotopy theory], Proceedings of the Japan Academy #strong[44] (1968), 198--203. #link("https://doi.org/10.3792/pja/1195521243")[doi:10.3792/pja/1195521243].]
#bibitem([38])[Hirosi Toda, #emph[An important relation in homotopy groups of spheres], Proceedings of the Japan Academy #strong[43] (1967), 839--842. #link("https://doi.org/10.3792/pja/1195521423")[doi:10.3792/pja/1195521423].]


