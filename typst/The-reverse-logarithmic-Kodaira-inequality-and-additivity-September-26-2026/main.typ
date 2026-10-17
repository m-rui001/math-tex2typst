#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[The-reverse-logarithmic-Kodaira-inequality-and-additivity-September-26-2026]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

Let a smooth family be completed to a morphism of projective pairs. How many logarithmic pluricanonical forms can its total space have? Subadditivity gives a lower bound from the base and a general fiber. We prove the complementary upper bound when the total space and all boundary strata are smooth over the open base. The boundary may have horizontal components, and the conclusion includes the case in which the base has no logarithmic pluricanonical forms at all.

Throughout, varieties are over $bb(C)$. Let $f : X arrow.r Y$ be a surjective morphism with connected fibers between smooth connected projective varieties. Let $E$ and $D$ be reduced simple-normal-crossing divisors on $X$ and $Y$, respectively, with

#[#set math.equation(numbering: n => "(1.1)")
 $ "Supp" \( f^(*) D \) subset.eq "Supp" \( E \) . $ <eq:support-inclusion>]

Either divisor may be zero. Set $V = Y \\ "Supp" D$. We assume that $X$ and every irreducible component of every nonempty intersection of components of $E$, restricted to $f^(- 1) \( V \)$, are smooth over $V$. We call this #emph[stratum smoothness over $V$]. For a very general $y in V$, set $F = X_y$ and $E_F = E \|_F$. Write

$ L_X = K_X + E \, #h(2em) L_Y = K_Y + D \, #h(2em) L_F = K_F + E_F . $

We give a point Kodaira dimension zero and use $\( - oo \) + a = - oo$, also when $a = - oo$.

#prodef([Theorem 1.1.])[
  (Reverse logarithmic Kodaira inequality).  #emph[Under these hypotheses, 
#[#set math.equation(numbering: n => "(1.2)")
 $ kappa \( X \, L_X \) lt.eq kappa \( Y \, L_Y \) + kappa \( F \, L_F \) . $ <eq:upper-bound>]

 If either term on the right is $- oo$, then $H^0 \( X \, m L_X \) = 0$ for every $m > 0$.]
] <thm:upper-bound>

There is no abundance, semiampleness, good-minimal-model, or general-type hypothesis. Condition (1.1) is a condition on supports; the multiplicities in $f^(*) D$ remain in the proof. No smoothness is assumed over $D$.

The additional input for equality is the logarithmic subadditivity theorem of the companion article #cite(label("Foundation")) Corollary 6.2. It applies to any connected-fiber surjective morphism of smooth projective reduced-SNC pairs satisfying (1.1), without the stratum-smoothness assumption. Its fiber is the same very general pair $\( F \, E_F \)$, and it gives the opposite inequality. Therefore:

#prodef([Corollary 1.2.])[
  (Logarithmic additivity).  #emph[For the pairs in Theorem 1, 
#[#set math.equation(numbering: n => "(1.3)")
 $ kappa \( X \, K_X + E \) = kappa \( Y \, K_Y + D \) + kappa \( F \, K_F + E_F \) . $ <eq:additivity>]

]
] <cor:additivity>

This gives a positive resolution of Popa’s logarithmic additivity conjecture in its projective reduced-SNC, stratum-smooth formulation #cite(label("PopaSurvey")) Conjecture 3.9 and its defining footnote. The proof of the upper inequality is independent of logarithmic subadditivity; the companion theorem is used only for this corollary.

=== 1.1 The section-construction result <the-section-construction-result>

The difficult case is a base with logarithmic Kodaira dimension zero. The space of logarithmic pluricanonical sections then has dimension at most one in each degree. Choose a very general point outside the zero divisors of all these sections. If a total-space pluriform vanished on its fiber, we would like to produce a base pluriform vanishing at that point. This would be a contradiction, and restriction to the fiber would be injective in every degree.

The following result carries out that construction. It also treats a base of logarithmic Kodaira dimension $- oo$.

#prodef([Proposition 1.3.])[
  #emph[Let $f \, E \, D$ satisfy the hypotheses of Theorem 1, and let $0 eq.not s in H^0 \( X \, m L_X \)$ for some $m > 0$. Then $kappa \( Y \, L_Y \) gt.eq 0$. If $kappa \( Y \, L_Y \) = 0$ and $s$ vanishes identically on $X_y$ for some $y in V$, there are an integer $a > 0$ and a nonzero $tau in H^0 \( Y \, a L_Y \)$ with $tau \( y \) = 0$.]
] <prop:section-construction>

The point $y$ in this statement belongs to the original open base $V$. It need not belong to a smaller open set chosen in constructing a cyclic cover from $s$. This uniformity is what allows the restriction argument to handle all total-space sections at one very general fiber. In particular, if $kappa \( Y \, L_Y \) = 0$, restriction to one very general fiber is injective in every positive degree, so

$ h^0 \( X \, m L_X \) lt.eq h^0 \( F \, m L_F \) #h(2em) upright("for every positive integer ") m . $

2 proves 1 from this proposition, including both negative-infinity cases.

=== 1.2 Two outcomes of the Hodge construction <two-outcomes-of-the-hodge-construction>

A pluriform on the total space first produces a cohomology class: take a root of the pluriform on a finite cover, then project its class to a nonzero pure weight quotient. This gives a vector in the bundle of highest Hodge classes. The chosen vector need not span that bundle. Thus positivity of the determinant of the whole bundle does not yet control the coordinates of this particular vector, or retain its zero on a chosen fiber.

We keep track of these coordinates in the logarithmic differential frames of the original pair $\( Y \, D \)$. The root cover may acquire extra singular fibers inside $V$, but its new discriminant must not enlarge the poles allowed on the base. A local calculation shows both that no new poles occur and that a zero on any original smooth fiber is retained. Homogeneous tensor operations preserve these properties while making the cohomological data descend to a projective parameter space $S$. This space records the varying Hodge structure and the additional vector directions that its period map alone can miss. There are two possibilities.

If $S$ is a point, the resulting cohomology bundle is constant. Its vector has ordinary scalar coordinates, at least one of which is nonzero. The coefficient calculation makes each coordinate an actual base pluriform. The same calculation preserves the prescribed zero. This proves base nonvanishing, excluding a base of logarithmic Kodaira dimension $- oo$. The preserved zero gives the additional conclusion needed when its logarithmic Kodaira dimension is zero.

If $S$ has positive dimension, restrict first to the generic fiber of the map from the base to $S$. The coefficient system is constant there, so a nonzero scalar coordinate permits a relative Iitaka fibration. It produces a divisor on an intermediate variety with the same sufficiently divisible section spaces as $K_Y + D$. Period positivity makes this divisor big after adding a pullback from $S$. The remaining obstacle is to remove that added divisor. We do so by comparing the iterated Higgs images of the chosen vector with the period directions and applying a numerical subtraction argument. The divisor itself is then big, which forces $kappa \( Y \, K_Y + D \) > 0$. Thus this alternative cannot occur when the base has logarithmic Kodaira dimension zero or $- oo$.

=== 1.3 Earlier results and the proof route <earlier-results-and-the-proof-route>

Iitaka’s subadditivity problem asks whether the Kodaira dimension of an algebraic fiber space is at least the sum of those of its base and general fiber. Viehweg proved the relative-dimension-one case #cite(label("Viehweg1977")) Introduction. Logarithmic pluriforms bring open varieties into the same birational framework #cite(label("IitakaLogForms1976")) Introduction.

For smooth families, the stronger question is whether the lower bound becomes equality. Popa’s logarithmic formulation specifies smoothness of the total space and every boundary stratum over the open base #cite(label("PopaSurvey")) Conjecture 3.9 and footnote 5. The reverse inequality constrains the extra pluricanonical growth that variation might otherwise produce. Its negative-base case makes the distinction from subadditivity especially clear: the lower bound is then automatic, whereas the upper bound asserts vanishing of every positive pluricanonical space on the total pair.

Popa–Schnell proved the upper inequality for smooth projective families under the Campana–Peternell conjecture and obtained a degreewise plurigenus bound when the base has rationally trivial canonical bundle #cite(label("PopaSchnellSmooth")) Theorems C and H. Their reduction through the base Iitaka fibration also organizes our argument. The section-construction proposition adds the specific conclusion needed here: an actual base pluriform, with a prescribed zero whenever the original section vanishes on a chosen smooth fiber.

Fujino–Fujisawa’s logarithmic results already allow relatively normal-crossing horizontal boundary. Their upper inequality for a base of nonnegative logarithmic Kodaira dimension assumes generalized abundance for sufficiently general fibers of the base’s logarithmic Iitaka fibration #cite(label("FF")) Theorem 1.12; their Hodge-theoretic construction also descends pseudoeffectivity to the base #cite(label("FF")) Theorems 1.4 and 4.5. Park proves the logarithmic upper inequality, in the reduced inverse-image boundary setting and for a base of nonnegative logarithmic Kodaira dimension, assuming good minimal models for the very general fibers of that base Iitaka fibration #cite(label("Park")) Theorem 1.12. These hypotheses concern fibers of the #emph[base’s] Iitaka fibration, rather than the original fibers of $f$.

A different route is Campana’s logarithmic additivity theorem for smooth projective families over a quasiprojective base with semiample canonical bundles on the original fibers #cite(label("CampanaAdditivity")) Theorem 1. Its proof uses birational isotriviality and the core. The extension to original fibers with good minimal models uses Taji’s birational-isotriviality theorem over a special base #cite(label("Taji")) Theorem 1.1, as explained in #cite(label("CampanaAdditivity")) Remark 2(1). Theorem 1 imposes neither of these minimal-model conditions.

The differential construction has an earlier model in Kovács’s iteration of cohomology maps from logarithmic cotangent sequences #cite(label("KovacsFineModuli")) Section 1, Lemma 1.1. The passage from a pluriform to a cyclic cover and iterated Higgs maps belongs to the Viehweg–Zuo method #cite(label("ViehwegZuoIsotriviality")) Introduction, Lemma 1.1, and Section 3. We use its Hodge-theoretic development in Popa–Schnell and the logarithmic construction of Fujino–Fujisawa, while retaining the chosen vector and its original coefficient lattice. Further inputs are full integral period-image algebraicity #cite(label("BBT")), orbifold cotangent positivity #cite(label("CP")), and b-nefness of the moduli part of an lc-trivial fibration #cite(label("FG")). For the last input we verify the rank condition for an auxiliary subpair which may have negative coefficients. The new task addressed by the section construction is the passage from these positivity statements to actual base sections with the stated control at every point of the original open base.

===== 1.3.1 Organization. <organization.>

2 deduces the upper inequality in all sign cases from 3. The rest of the paper proves that proposition. 3 constructs the geometric vector, its coefficient lattice, and the zero test. 4 constructs the quotient that retains its periods and compact-factor directions. 5 proves the two comparisons that remove the boundary and control the chosen vector by its iterated Higgs images. 6 produces an intermediate base with exactly the original logarithmic section spaces. 7 first proves the constant-parameter case, then removes the period twist in the positive-dimensional case and completes the section construction. Metric and flat-connection estimates appear immediately before their first uses.

== 2 Reduction to the section construction <sec:completion>

The sole input from the remaining sections is 3. We first give the reduction in every sign case. This identifies exactly what the geometric construction must produce, including its assertion at a prescribed point of the original open base.

=== 2.1 Conventions and birational changes <conventions-and-birational-changes>

All varieties are over $bb(C)$, except when a generic fiber is explicitly considered over a characteristic-zero function field. We use additive notation for line bundles and rational Cartier divisors. A statement about sections of a rational divisor is understood after taking a positive Cartier multiple. For numerical divisor classes, $P gt.eq_(upright("pe")) Q$ means that $P - Q$ is pseudoeffective.

We make projective resolutions and resolve rational maps throughout. Resolution may be taken to preserve a specified smooth open set and to be equivariant for a finite group; see #cite(label("KollarResolution")) Theorems 3.35 and 3.36. Here is the boundary convention that accompanies a birational modification. If $mu : Z' arrow.r Z$ is a birational morphism between smooth projective varieties and $Delta$ is reduced SNC, put

$ Delta' = mu_(*)^(- 1) Delta + "Exc" \( mu \)_(upright("red")) \, $

after further resolution when necessary. The log canonicity of the smooth pair $\( Z \, Delta \)$ gives

#[#set math.equation(numbering: n => "(2.1)")
 $ K_(Z') + Delta' = mu^(*) \( K_Z + Delta \) + A_mu \, #h(2em) A_mu gt.eq 0 quad mu upright("-exceptional") . $ <eq:prelim-birational-log>]

Consequently pullback identifies the spaces of logarithmic pluricanonical sections in every degree. Indeed, pullback supplies one inclusion; in the other direction a rational section regular away from a set of codimension at least two on the smooth variety $Z$ extends across that set. Equivalently, $mu_(*) cal(O)_(Z') \( m A_mu \) = cal(O)_Z$. This convention also applies to a generic fiber after a characteristic-zero extension of the ground field.

We use the standard numerical properties of big and nef divisors #cite(label("Lazarsfeld")) Chapters 1–2. In particular, the big cone is the interior of the pseudoeffective cone, and adding a pseudoeffective class to a big class preserves bigness. If $P$ is nef on an $n$-dimensional projective variety, its numerical dimension is

#[#set math.equation(numbering: n => "(2.2)")
 $ nu \( P \) = max { k in { 0 \, dots.h \, n } : P^k A^(n - k) > 0 } \, #h(2em) A med upright("ample") \, $ <eq:prelim-numerical-dimension>]

independently of $A$, and $P$ is big exactly when $nu \( P \) = n$. Bigness is preserved in both directions by a dominant generically finite map. For descent, factor the map through its finite normalization and apply the field norm to an effective multiple of the pulled-back divisor minus a sufficiently small pullback of an ample divisor. Birational invariance then gives the assertion on a resolution. On a point the empty intersection product is $1$, and numerical and Iitaka dimensions of the zero line are both zero.

=== 2.2 The two negative-infinity cases <the-two-negative-infinity-cases>

Suppose first that $kappa \( F \, L_F \) = - oo$. A nonzero section of $m L_X$ cannot vanish identically on every very general fiber of a dominant map: its nonvanishing locus is a nonempty open subset of $X$, whose image contains a dense open subset of $Y$. Restriction and adjunction would therefore give a nonzero section of $m L_F$ on a very general fiber. This is impossible. Hence $kappa \( X \, L_X \) = - oo$.

Suppose next that $kappa \( Y \, L_Y \) = - oo$. A hypothetical nonzero section of $m L_X$ contradicts the first assertion of 3. Thus the total Kodaira dimension is again $- oo$. This is an actual vanishing conclusion, not a consequence of an automatic lower inequality.

=== 2.3 A base of Kodaira dimension zero <a-base-of-kodaira-dimension-zero>

Assume $kappa \( Y \, L_Y \) = 0$. If $Y$ is a point, the conclusion is immediate. Otherwise choose $y in V$ very general so that all fiber pluriform spaces have their very general dimensions and $y$ lies outside the zero divisor of every nonzero base pluriform. This last condition is possible:

#[#set math.equation(numbering: n => "(2.3)")
 $ h^0 \( Y \, a L_Y \) lt.eq 1 #h(2em) \( a > 0 \) . $ <eq:base-one-section>]

Indeed, two linearly independent sections in a common degree have a nonconstant ratio and hence give Iitaka dimension at least one. There are only countably many degrees to consider.

For every $m > 0$, restriction is injective:

#[#set math.equation(numbering: n => "(2.4)")
 $ H^0 \( X \, m L_X \) arrow.r H^0 \( F \, m L_F \) . $ <eq:fiber-injective>]

To prove this, suppose that a nonzero section on the left vanishes on $F$. By 3, this gives a nonzero section of a positive multiple of $L_Y$ vanishing at $y$. That proposition applies at every point of the original $V$, regardless of the auxiliary open sets used for this particular section. This contradicts the choice of $y$. Thus (2.4) holds in every degree.

The usual growth characterization of Iitaka dimension, applied to (2.4), gives

#[#set math.equation(numbering: n => "(2.5)")
 $ kappa \( X \, L_X \) lt.eq kappa \( F \, L_F \) . $ <eq:zero-base-bound>]

One may use sufficiently divisible degrees on both sides; the elementary growth statement does not require finite generation of either section ring, cf. #cite(label("Lazarsfeld")) Section 2.1.

=== 2.4 Positive and intermediate base dimensions <positive-and-intermediate-base-dimensions>

Let $k = kappa \( Y \, L_Y \) > 0$. We use the reduction through the base Iitaka fibration of Popa–Schnell #cite(label("PopaSchnellSmooth")) §2, Step 2, retaining the reduced boundary and its strata. Resolve a logarithmic Iitaka fibration $q : Y' arrow.r T$, with $Y' \, T$ smooth projective and connected fibers, so that $dim T = k$. Put $D'$ equal to the strict transform of $D$ plus the reduced exceptional divisor, with further resolution to SNC. The section spaces of $K_(Y') + D'$ agree with those of $L_Y$.

The very general fiber $G$ of $q$, with $D_G = D' \|_G$, has

#[#set math.equation(numbering: n => "(2.6)")
 $ kappa \( G \, K_G + D_G \) = 0 . $ <eq:iitaka-fiber-zero>]

Here the Iitaka map is taken with the relative algebraic closure of its image field. The standard section-ratio argument proving (2.6) is the same one used in 24: nonzero forms restrict to the general fiber, and an additional independent ratio there would spread after clearing vertical poles with a sufficiently positive twist from the image. The resolved original system dominates that twist, contradicting maximality of the Iitaka image. No abundance statement is being used.

Take the main-component birational base change of $X$ to $Y'$ and resolve it compatibly with the boundary. Denote the resulting morphism by $f' : X' arrow.r Y'$ and its boundary by $E'$, the strict transform of $E$ plus the reduced exceptional divisor. We can preserve the smooth pair over $Y' \\ D'$; the support inclusion holds because over $V$ the pullback of a center of codimension at least two still has codimension at least two, whereas the original inverse image of $D$ already lies in the boundary. Thus all necessary new divisors are exceptional on the source or lie over the old boundary. The morphism has connected fibers: it has geometrically connected generic fiber, and its Stein factor is finite birational over the normal base. These modifications preserve $kappa \( X \, L_X \)$ and $kappa \( Y \, L_Y \)$.

For a very general point $t in T$, put $G = q^(- 1) \( t \)$ and $H = \( q compose f' \)^(- 1) \( t \)$. By generic smoothness applied to the finitely many boundary strata, these are smooth projective varieties with their induced reduced SNC boundaries. Locally, surjectivity on the deepest stratum lets the boundary parameters and the parameters pulled back from $T$ be part of one coordinate system; restriction therefore retains distinct reduced normal-crossing boundary branches. The induced map

$ f_t : \( H \, E' \|_H \) arrow.r \( G \, D' \|_G \) $

has connected fibers and satisfies the original stratum-smoothness hypothesis over $G \\ D' \|_G$. The condition over that open is preserved by base change. Adjunction gives the restrictions of the two log canonical divisors. The very general fiber invariant of $f_t$ is $kappa \( F \, L_F \)$: choose $t$ and then the point of $G$ outside the countably many loci governing all section dimensions. Applying (2.5), or the already proved negative-infinity fiber case, yields

$ kappa \( H \, K_H + E' \|_H \) lt.eq kappa \( F \, L_F \) . $

For completeness, take any nonempty total pluriform system, with rational image map $phi.alt$. The image of the combined map $\( q compose f' \, phi.alt \)$ has generic fiber over $T$ equal to the image of the restricted subsystem. Its fiber dimension is at most $kappa \( H \, K_H + E' \|_H \)$. Projection to the image of $phi.alt$ therefore gives $dim "im" phi.alt lt.eq dim T + kappa \( H \, K_H + E' \|_H \)$. Taking the supremum over degrees gives

$ kappa \( X' \, K_(X') + E' \) lt.eq dim T + kappa \( H \, K_H + E' \|_H \) lt.eq k + kappa \( F \, L_F \) . $

If the middle fiber Kodaira dimension is $- oo$, restriction excludes all total sections instead. This proves 1, including the case $k = dim Y$ and hence a point Iitaka fiber.

== 3 A logarithmic Hodge vector and its coefficient lattice <sec:logarithmic-input>

Let $f : \( X \, E \) arrow.r \( Y \, D \)$ satisfy the hypotheses of 1, and put $d = dim X - dim Y$ and $L_Y = K_Y + D$. Fix one total-space logarithmic pluriform

#[#set math.equation(numbering: n => "(3.1)")
 $ 0 eq.not s in H^0 #scale(x: 120%, y: 120%)[\(] X \, cal(O)_X \( m \( K_X + E \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) m > 0 . $ <eq:log-input-section>]

We turn $s$ into a highest Hodge vector whose coefficients retain the original base cotangent lattice. The open set on which a cyclic cover constructed from $s$ is a smooth family will usually be smaller than $V = Y \\ D$. The differential lattice nevertheless remains $Omega_Y^1 \( log D \)$, including at divisors in $V$ where that cover degenerates. Retaining this lattice will later turn the Hodge vector into actual base sections.

=== 3.1 Variations and extension conventions <variations-and-extension-conventions>

A polarized rational variation of pure Hodge structure of weight $w$ on a smooth quasi-projective variety $B^compose$ consists of a rational local system $bb(V)_(bb(Q))$, its flat holomorphic bundle $cal(V) = bb(V)_(bb(Q)) ⊗_(bb(Q)) cal(O)_(B^compose)$ with connection $nabla$, a decreasing holomorphic filtration $F^bullet cal(V)$, and a flat polarization. The filtration defines polarized pure Hodge structures on fibers and satisfies Griffiths transversality

$ nabla \( F^p cal(V) \) subset.eq F^(p - 1) cal(V) ⊗ Omega_(B^compose)^1 . $

The initial variations in this paper have invariant lattices; torsion is discarded when taking such a lattice. A complex variation used below is obtained, after a specified finite level if necessary, as a polarized complex Hodge summand of a tensor construction in these rational variations and their duals. In particular its projector is flat and preserves the Hodge decomposition. Such a summand need not have its own real form. It has the induced positive Hodge metric and a flat Hermitian polarization. Constant changes of the Hodge indices in these constructions do not change the highest Hodge spaces or their differentials.

We record precisely the standard extension results used here. Choose a smooth projective compactification $B$ with SNC boundary $Delta = B \\ B^compose$. The local boundary monodromies of the integral polarized variation are quasi-unipotent, by the monodromy theorem #cite(label("Schmid")) (6.1), pp. 245–246. They become unipotent on a finite normal level. One can choose the kernel of reduction of the lattice modulo an integer $M gt.eq 3$: if a quasi-unipotent integral matrix $T$ is congruent to $1$ modulo $M$, then for every eigenvalue $zeta$ the number $\( zeta - 1 \) \/ M$ is an algebraic integer. All its conjugates have absolute value at most $2 \/ M < 1$, so its algebraic norm forces it to be zero. Thus every eigenvalue of $T$ is $1$. The cover exists algebraically by Riemann existence; normalize its compactification and resolve it. New boundary monodromies are products of powers of commuting unipotent monodromies and remain unipotent. This level construction may be combined with a finite level killing a monodromy component group.

At unipotent level, let $overline(cal(V))$ denote Deligne’s canonical extension, with nilpotent logarithmic residues. The nilpotent orbit theorem extends $F^bullet$ by holomorphic subbundles of $overline(cal(V))$; the induced logarithmic Higgs field is

$ theta : "Gr"_F^p overline(cal(V)) arrow.r "Gr"_F^(p - 1) overline(cal(V)) ⊗ Omega_B^1 \( log Delta \) . $

We use the nilpotent orbit and limiting mixed Hodge structure theorems of #cite(label("Schmid")) (4.9), (4.12), and (6.16).

Here and later, pullback compatibility means compatibility at unipotent level. Suppose $g : \( B' \, Delta' \) arrow.r \( B \, Delta \)$ is a morphism of smooth compactifications whose open part maps to $B^compose$, and that $g^(- 1) Delta$ is supported on the SNC divisor $Delta'$. Locally write

$ g^(*) z_i = v_i product_j t_j^(a_(i j)) \, #h(2em) v_i med upright("a holomorphic unit") . $

If $N_i$ are the commuting nilpotent residue matrices, the residues of the pulled-back logarithmic connection are $sum_i a_(i j) N_i$ and are nilpotent. Uniqueness of the canonical extension therefore identifies it with $g^(*) overline(cal(V))$. The pulled-back Hodge subbundles are subbundles and agree with the Hodge filtration on the open set, so uniqueness of the extending Grassmann maps identifies the extended filtrations as well. The units $v_i$ contribute only invertible holomorphic exponential factors. This proves compatibility also under the modifications and ramified covers used below. Tensor operations and flat Hodge projectors commute with these extensions: the latter commute with the local monodromies and hence with the logarithmic exponentials. Thus all the preceding extension assertions apply to the complex Hodge summands specified above.

The regular-singular Riemann–Hilbert correspondence #cite(label("DeligneRSE")) Chapter II, §§5–6 makes the flat bundles, their tensor morphisms, and their pullbacks algebraic on the open set. On a projective compactification the extending Hodge subbundles are algebraic by GAGA; this gives algebraicity on the original open set as well, using finite descent when a level was introduced. We also use the theorem of the fixed part: the monodromy-invariant subspace of a polarized variation on a smooth quasi-projective base is a constant Hodge substructure, and its inclusion is a morphism of variations. This applies to tensor constructions and finite étale covers #cite(label("DeligneHodgeII")) §4.1 and #cite(label("Schmid")) (7.22). The assertions about connected algebraic monodromy needed for the marked-period construction will be stated at their use.

=== 3.2 The vector and the coefficient statement <the-vector-and-the-coefficient-statement>

We now specify regularity in the logarithmic cotangent lattice on a higher model. Let $beta : Y' arrow.r Y$ be a projective birational morphism with $Y'$ smooth, and let $D'$ be the reduced union of the strict transform of $D$ and all $beta$-exceptional divisors, with simple normal crossings. Set

$ L_(Y') = K_(Y') + D' \, #h(2em) B' = Omega_(Y')^1 \( log D' \) . $

All rational identifications of canonical lines use the canonical pullback of rational differential forms. At the generic point of a prime $A subset Y'$, choose local frames of $cal(O)_(Y') \( - a L_(Y') \)$ and $\( B' \)^(⊗ j)$. After a sufficiently divisible transverse ramification, a variation with quasi-unipotent monodromy has unipotent monodromy. A tensor has #emph[regular coefficients] if, in the Schmid extension of its Hodge factor, its coefficients relative to the #emph[pulled-back chosen frames] are regular. Thus this convention pulls back the vector bundle $\( B' \)^(⊗ j)$; it does not replace that bundle by cotangent tensors on the testing curve.

#prodef([Proposition 3.1.])[
  (Logarithmic Hodge input).  #emph[There are a dense smooth open $Y^compose subset V$, a polarizable pure rational variation $bb(V)$ on $Y^compose$ with an invariant lattice and quasi-unipotent boundary monodromy, and a nonzero algebraic map 
#[#set math.equation(numbering: n => "(3.2)")
 $ u : cal(O)_(Y^compose) \( - L_Y \) arrow.r cal(E)^d \, #h(2em) cal(E)^p = "Gr"_F^p \( bb(V) ⊗ cal(O)_(Y^compose) \) \, #h(2em) F^(d + 1) bb(V) = 0 . $ <eq:log-input-vector>]

 On every model $\( Y' \, D' \)$ just described, the rationally identified map and all its Higgs iterates 
#[#set math.equation(numbering: n => "(3.3)")
 $ theta^j \( u \) : cal(O)_(Y') \( - L_(Y') \) arrow.r.dashed cal(E)^(d - j) ⊗ \( B' \)^(⊗ j) $ <eq:log-input-iterates>]

 have regular coefficients at every prime of $Y'$ in the preceding sense. Here the variation and its Hodge bundles are understood over the common dense open, and a grade outside their range is zero.]
  #emph[The same statement holds for the homogeneous tensor replacement used in 7. More precisely, if $u_(*)$ is obtained from $u$ by homogeneous tensor operations of positive degree $a$ and flat Hodge-compatible projections, then 
#[#set math.equation(numbering: n => "(3.4)")
 $ u_(*) : cal(O) \( - a L_(Y') \) arrow.r.dashed E_0 \, #h(2em) theta^j \( u_(*) \) : cal(O) \( - a L_(Y') \) arrow.r.dashed E_j ⊗ \( B' \)^(⊗ j) $ <eq:log-input-tensor>]

 have the same coefficient property. Here $bb(A)$ is the resulting pure variation, $p_(*)$ is its highest nonzero Hodge index, and $E_j = "Gr"_F^(p_(*) - j) bb(A)$. Finite levels and a common further unipotent ramification may be used in these assertions.]
] <prop:logarithmic-vector>

#proof[
  We give the construction and then prove the assertion for the full coefficient lattice.
  #emph[Step 1: the cyclic root and the pure vector.] The cyclic-cover construction and its Higgs iteration follow the Viehweg–Zuo method #cite(label("ViehwegZuoIsotriviality")) §3; here we must also retain every coefficient in the original base lattice. Put $N = K_X + E$. Normalize the cyclic cover defined by an $m$-th root of $s$, and resolve it to obtain a projective generically finite map $psi : Z arrow.r X$. The source may be disconnected. The tautological root gives a regular pairing
  #[#set math.equation(numbering: n => "(3.5)")
   $ psi^(*) cal(O)_X \( - N \) arrow.r cal(O)_Z . $ <eq:log-root-pairing>]
  Choose a reduced simple-normal-crossing divisor on $Z$ containing the inverse image of $E$ and the exceptional divisors needed for the chosen compactification. Shrink the base to $Y^compose subset V$ so that $Z arrow.r Y$ and every stratum of this divisor are smooth there. Write $H$ for its restriction over $Y^compose$ and $q : Z \\ H arrow.r Y^compose$ for the resulting open family. Properness of the compactification and smoothness of all its strata give local topological triviality of this family.
  The logarithmic mixed Hodge construction gives a variation on $R^d q_(*) bb(Q)$ with weight filtration $W$ and Hodge filtration $F$. We recall the precise ingredients used here. For a smooth projective compactification with a simple-normal-crossing boundary, residues identify the weight quotients of the logarithmic complex with complexes on the closed boundary intersections, shifted and Tate twisted. The associated weight spectral sequence degenerates at $E_2$, the Hodge-to-de Rham sequence degenerates at $E_1$, and the same residue filtration on a fixed form sheaf degenerates at $E_2$; see #cite(label("DeligneHodgeII")) §3.1.5, Theorem 3.2.5 and Corollary 3.2.13. These statements apply relatively on $Y^compose$: cohomology and base change give the Hodge bundles, and the proper smooth boundary strata give the pure Gauss–Manin systems occurring on the residue page. Their Gysin maps, including the Tate twists, are morphisms of pure variations. Their kernels and images split by polarization. Thus the weight quotients are polarizable rational variations, and their integral cohomological constructions give invariant lattices after discarding torsion. Their monodromy is quasi-unipotent. The proper stratum Gauss–Manin connections are algebraic and regular singular by the regularity theorem for Gauss–Manin connections #cite(label("DeligneRSE")) Chapter II, §6.14 and Theorem 7.9; residues and their cohomological maps are algebraic. Consequently all the Hodge and weight maps used below have their usual algebraic structures.
  Over $Y^compose$ there is a canonical identification
  $ Omega_(X \/ Y)^d \( log E \) ⊗ cal(O)_X \( - N \) = f^(*) cal(O)_Y \( - L_Y \) . $
  Pulling back the top relative logarithmic form and applying (3.5) therefore gives
  #[#set math.equation(numbering: n => "(3.6)")
   $ u^(upright("mix")) : cal(O)_(Y^compose) \( - L_Y \) arrow.r F^d \( R^d q_(*) bb(C) ⊗ cal(O)_(Y^compose) \) . $ <eq:log-input-mixed-vector>]
  The form is nonzero: the root is nonzero generically, and pullback of a top relative differential under a generically finite map in characteristic zero is injective at the generic point. A nonzero global top logarithmic form represents a nonzero top Hodge class by Hodge-to-de Rham degeneration. Choose the smallest $w$ for which the image of (3.6) lies generically in $W_w$. Projection to $"Gr"_w^W$ is nonzero. Let $bb(V) = "Gr"_w^W$ and let $u$ be this projection. Since the fibers of $q$ have dimension $d$, $F^(d + 1) = 0$. Thus $u$ is in the highest nonzero Hodge grade of this pure variation, even when it does not span that grade.
  For use with this construction, the Higgs field has the following description. Filter absolute logarithmic forms by the number of base differentials. The short exact sequence consisting of base degrees zero and one induces on relative de Rham cohomology the Gauss–Manin connection. This follows either from the logarithmic de Rham comparison or by lifting a flat class to an absolute class on a topologically trivial base disk. Taking its Hodge symbol gives the connecting map for the corresponding short exact sequence of individual form sheaves. Hodge-to-de Rham degeneration identifies the resulting cohomology sheaves with the Hodge grades. Since $W$ is flat and all the filtrations are strict, these connecting maps preserve weight and induce the pure Higgs field on $"Gr"_w^W$.
  #emph[Step 2: coefficient maps on higher models.] We now work on a higher model $Y'$. Resolve the main component of $X times_Y Y'$ to obtain $f' : X' arrow.r Y'$, and let $E'$ be the strict transform of $E$ together with the reduced divisors exceptional over $X$. Resolve the pair, preserving the smooth relative pair over $Y' \\ D'$. Then
  #[#set math.equation(numbering: n => "(3.7)")
   $ "Supp" f' ""^(*) D' subset "Supp" E' . $ <eq:log-input-support>]
  Indeed, over $D$ this follows from the original support inclusion. Outside $D$, the image in $Y$ of a $beta$-exceptional divisor has codimension at least two. Smoothness of $f$ there implies that its inverse image has codimension at least two in $X$. Every divisor above it is consequently exceptional over $X$ and belongs to $E'$. The logarithmic discrepancy formula gives a pulled-back section
  $ s' in H^0 \( X' \, cal(O)_(X') \( m N' \) \) \, #h(2em) N' = K_(X') + E' \, $
  whose rational identification with $s$ is fixed by pullback. We may dominate both cyclic-root diagrams on a common resolution, preserving the chosen family over a common dense open.
  Fix a prime $A subset Y'$. On the inverse image of a sufficiently small Zariski neighborhood of its generic point, the natural map
  #[#set math.equation(numbering: n => "(3.8)")
   $ f' ""^(*) B' arrow.r Omega_(X')^1 \( log E' \) $ <eq:log-input-subbundle>]
  is an injection of subbundles. If $A subset.not D'$, this is the relative smooth-pair condition. For a component of $D'$, take its parameter $t$ and tangential base coordinates $y_2 \, dots.h \, y_b$. At a point over a general point of $A$, write $f' ""^(*) t = v product z_alpha^(n_alpha)$ in boundary coordinates, with $v$ a unit and at least one $n_alpha > 0$. Its logarithmic differential has the nonzero residue vector $\( n_alpha \)$. On each boundary stratum dominating $A$, generic smoothness gives independent pullbacks of $d y_2 \, dots.h \, d y_b$ in the ordinary tangential directions. Strata not dominating $A$, and the nonsmooth loci on the dominating strata, have images missing a dense open of $A$; properness permits their removal on the base. The residue vector and these tangential differentials are linearly independent. This proves (3.8) at every point over that open of $A$, without any smoothness assumption over the original boundary.
  Let $Omega_(upright("rel"))^i$ denote the exterior powers of the locally free quotient in (3.8). Its top determinant gives
  #[#set math.equation(numbering: n => "(3.9)")
   $ Omega_(upright("rel"))^d ⊗ cal(O)_(X') \( - N' \) = f' ""^(*) cal(O)_(Y') \( - L_(Y') \) . $ <eq:log-input-top-identity>]
  For $i gt.eq 1$, the exterior-power filtration gives the exact sequence
  #[#set math.equation(numbering: n => "(3.10)")
   $ 0 arrow.r f' ""^(*) B' ⊗ Omega_(upright("rel"))^(i - 1) arrow.r Omega_(X')^i \( log E' \) \/ upright("Fil")_(upright("base"))^2 arrow.r Omega_(upright("rel"))^i arrow.r 0 . $ <eq:log-input-absolute-extension>]
  The following connecting-map construction is the logarithmic cotangent procedure of Kovács #cite(label("KovacsFineModuli")) §1, Lemma 1.1, applied before passing to the root family so that the coefficient lattice remains fixed. Tensor this sequence by $cal(O)_(X') \( - N' \)$, apply higher direct images, and use the projection formula. Starting with the unit map into the direct image of (3.9), its successive connecting maps give honest morphisms of coherent sheaves
  #[#set math.equation(numbering: n => "(3.11)")
   $ alpha_j : cal(O)_(Y') \( - L_(Y') \) arrow.r A_j ⊗ \( B' \)^(⊗ j) \, #h(2em) A_j = R^j f'_(*) \( Omega_(upright("rel"))^(d - j) ⊗ cal(O)_(X') \( - N' \) \) . $ <eq:log-input-coherent-iterates>]
  They are defined before passing to the root family. On the good open, differential pullback and root multiplication map each short exact sequence (3.10) to the corresponding sequence on that family. Naturality of connecting homomorphisms identifies the images of $alpha_j$ with $\( theta^(upright("mix")) \)^j \( u^(upright("mix")) \)$. This argument uses morphisms of short exact sequences of $cal(O)$-modules; it does not require root multiplication to commute with the de Rham differential or a connection on $cal(O) \( - N' \)$.
  #emph[Step 3: the semistable coefficient test.] Take a general algebraic curve transverse to $A$ and then a disk about its intersection point. Resolve the root diagram over that disk, keeping its smooth pair over the puncture, and include the special fiber in the resolved boundary. One-parameter semistable reduction, after finite ramification, gives a projective semistable family with smooth total space
  $ g : Z_Delta arrow.r Delta $
  with reduced simple-normal-crossing special fiber $V_0$, and a horizontal divisor $H$ such that $V_0 + H$ has simple normal crossings. We use the toroidal construction with the horizontal divisor included in the boundary #cite(label("KKMS")) Chapter IV, §3; an explicit statement allowing the prescribed boundary is #cite(label("KollarMori")) Theorem 7.17. After resolving the special fiber, its parameter is monomial; the resolution centers over the bad fiber, followed by base change and toroidal subdivisions for the vertical monomial preserve the transverse horizontal coordinate hyperplanes. Thus the local equations on the resulting model are
  #[#set math.equation(numbering: n => "(3.12)")
   $ tau = z_1 dots.h.c z_r \, #h(2em) H : med z_(r + 1) dots.h.c z_(r + h) = 0 . $ <eq:log-input-semistable-coordinates>]
  In particular every closed horizontal intersection is itself a proper semistable family over $Delta$. The model maps to $X'$ and to the chosen root family. Its boundary contains the inverse image of $E'$.
  Let $i : Delta arrow.r Y'$ denote the ramified testing map. Pullback of forms, followed by the root pairing, gives
  $ p^(*) \( Omega_(upright("rel"))^(d - j) ⊗ cal(O)_(X') \( - N' \) \) arrow.r Omega_(Z_Delta \/ Delta)^(d - j) \( log \( V_0 + H \) \) \, $
  where $p : Z_Delta arrow.r X'$ is the diagram map. This descends to relative forms because every pulled-back base logarithmic form from $Y'$ is a form from $Delta$ and vanishes in the relative quotient. Its pole at $0$ is at most logarithmic. The root pairing is regular on this model; alternatively, its monic power equation and normality prove this regularity. The natural coherent-cohomology pullback maps therefore give
  #[#set math.equation(numbering: n => "(3.13)")
   $ i^(*) A_j arrow.r R^j g_(*) Omega_(Z_Delta \/ Delta)^(d - j) \( log \( V_0 + H \) \) . $ <eq:log-input-coefficient-test>]
  No cohomology base-change isomorphism at $0$ is needed.
  To see exactly what (3.13) tests, choose a local source generator $e$ and an entire local frame $\( b_nu \)_nu$ of $\( B' \)^(⊗ j)$, and write
  $ alpha_j \( e \) = sum_nu a_nu ⊗ b_nu . $
  Every $i^(*) a_nu$ maps to a regular relative log-form cohomology class on $Delta$. We keep each $i^(*) b_nu$ as a basis vector of the external bundle $i^(*) \( B' \)^(⊗ j)$. On $Delta^(*)$, smooth-family comparison identifies these classes with the individual coefficients of the original mixed Higgs iterate. Each coefficient belongs to $W_w$ there, because the mixed Higgs field preserves $W_w$.
  5 shows that its weight projection is a regular section of the Schmid-extended pure Hodge grade. This proves the required bound for every coefficient of (3.3). In particular, a tangential factor annihilated by the differential of $i$ is still retained as an external frame vector. At an additional root-cover discriminant outside $D'$, the transverse frame is $d t$. Although $d \( tau^e \) = e tau^e d log tau$, no coefficient is divided by $e tau^e$, since this differential substitution is never made on the external frame. This proves the bound with the original $D'$, without adding that discriminant to it.
  For completeness, these tests detect divisorial regularity. Take a finite level on which the variation is unipotent and a smooth compactification with normal-crossing boundary. Its canonical Hodge extensions are algebraic, and the rational coefficient maps are meromorphic in their frames. A pole at a prime persists on a general transverse disk; the preceding argument excludes it after divisible ramification. Further ramified tests preserve regularity by compatibility of the unipotent canonical extension with pullback. Since $Y'$ and $A$ were arbitrary, this proves the assertion on every stated higher model.
  #emph[Step 4: homogeneous replacements.] Finally, the tensor product Higgs field satisfies the Leibniz rule. Each coefficient of $theta^j \( u^(⊗ a) \)$ is a finite sum of tensor products of coefficients of iterates of $u$, with total iteration degree $j$. Tensor products and flat Hodge-compatible projections commute with unipotent canonical extension. The same applies to the conjugate factors in a finite-orbit tensor construction on a common finite level. Thus every homogeneous tensor construction used in 7 preserves the asserted regularity, with source $cal(O) \( - a L_(Y') \)$. Those constructions use polynomial tensor operations and projections, so no division introduces a pole. This proves (3.4). ◻
]

The preceding construction reduces regularity to one precise extension fact. It is important that the weight steps extend as subbundles: this allows a scalar zero to be divided out before taking its pure projection.

#prodef([Lemma 3.2.])[
  (Extension of a weight projection).  #emph[Suppose $g : Z arrow.r Delta$ is projective and has the local form (3.12), with $Z$ smooth, reduced special fiber $V_0$, and horizontal boundary $H$. For fixed $i \, j$, the relative log-form cohomology 
$ cal(A)^(i \, j) = R^j g_(*) Omega_(Z \/ Delta)^i \( log \( V_0 + H \) \) $

 is locally free and carries a filtration by subbundles extending the weight filtration on its Hodge grade over $Delta^(*)$. Its successive quotients are the Hodge-graded unipotent canonical extensions of the corresponding pure weight variations. In particular, a regular class that belongs generically to a weight step projects regularly to that step’s pure weight quotient.]
] <lem:weight-extension>

#proof[
  Filter $Omega_(Z \/ Delta)^i \( log \( V_0 + H \) \)$ by the number $k$ of horizontal logarithmic factors. In (3.12), taking a horizontal residue commutes with quotienting by $d log tau = sum_(a = 1)^r d log z_a$. Therefore the residue quotient of filtration degree $k$ is
  #[#set math.equation(numbering: n => "(3.14)")
   $ xor.big_(\| I \| = k) \( iota_I \)_(*) Omega_(H_I \/ Delta)^(i - k) \( log \( V_0 \|_(H_I) \) \) \, #h(2em) H_I = ⋂_(alpha in I) H_alpha . $ <eq:log-input-relative-residues>]
  The terms are zero when their form degree is negative. The maps $g_I : H_I arrow.r Delta$ are proper projective semistable families. The semistable logarithmic de Rham comparison #cite(label("Steenbrink77")) §2, Theorem 2.7, Corollaries 2.9–2.10 and Theorem 2.11, in the canonical-extension form explained in #cite(label("FF14")) §4.9 and the proof of Lemma 4.10, Step 1, with its strictness argument completed in #cite(label("FF14Remark")), identifies
  $ R^q \( g_I \)_(*) Omega_(H_I \/ Delta)^p \( log \( V_0 \|_(H_I) \) \) quad upright("with") quad "Gr"_F^p overline(R^(p + q) \( g_I \|_(Delta^(*)) \)_(*) bb(C)) \, $
  where the bar means unipotent canonical extension with its extended Hodge filtration. In particular these are locally free sheaves.
  Consider the spectral sequence of the finite residue filtration of this single relative form sheaf. We use the indexing
  $ E_1^(- k \, j + k) = xor.big_(\| I \| = k) R^j \( g_I \)_(*) Omega_(H_I \/ Delta)^(i - k) \( log \( V_0 \|_(H_I) \) \) . $
  On $Delta^(*)$, $d_1$ is the Hodge grade of the signed Gysin map from the $k$-fold intersections to the $\( k - 1 \)$-fold intersections, with the Tate twists included. Source and target have the same pure weight $i + j + k$. A morphism of polarizable pure variations has a flat Hodge kernel and image and admits flat Hodge complements. Consequently it factors as a projection to a complement, an isomorphism onto its image, and an inclusion. Canonical extension and extension of $F$ preserve this direct-sum factorization. Its extended Hodge-graded map has constant rank at $0$.
  The coherent $d_1$ and that extended Gysin map are holomorphic maps between the same locally free $E_1$ terms and agree on $Delta^(*)$. They therefore agree everywhere. It follows that $E_2$ is locally free and is precisely the canonical Hodge-graded extension of the pure residue cohomology. By the fixed-form version of Deligne’s residue theorem #cite(label("DeligneHodgeII")) Corollary 3.2.13(iii), every $d_r$ for $r gt.eq 2$ vanishes on $Delta^(*)$. Inductively its target is locally free on $Delta$, so a holomorphic map vanishing on the puncture vanishes everywhere. Thus $E_2 = E_oo$ on the disk. This is also the constant-rank extension mechanism in #cite(label("FF14")) Proposition 3.12 and the proof of Lemma 4.10, Step 1; here the residue calculation (3.14) supplies its particular geometric complex.
  The abutment has a finite filtration with these locally free successive quotients. It and every filtration step are therefore locally free, and the filtration steps are subbundles. On $Delta^(*)$ this filtration, with the usual cohomological shift, is the induced weight filtration on $"Gr"_F^i H^(i + j) \( Z_t \\ H_t \)$: this is exactly the compatibility of the two filtrations in the logarithmic mixed Hodge complex, or equivalently the fixed-form assertion in the cited corollary. Its extended quotients were identified on $E_2$ above. Finally, the image of a regular class in the quotient by a weight subbundle is a section of a locally free sheaf. If it is generically zero it is zero. The class hence lies in that subbundle on the entire disk and has a regular image in its successive quotient, as claimed. ◻
]

We now retain a zero on a specified original fiber. The source line in this calculation is the pulled-back original line, whereas the preceding higher-model estimates used the new logarithmic canonical line. Keeping these frames distinct is what detects vanishing at the chosen point.

#prodef([Lemma 3.3.])[
  (Zero test in the original source frame).  #emph[Suppose $dim Y > 0$ and $y in V$, and suppose the section $s$ in (3.1) vanishes identically on $f^(- 1) \( y \)$. Blow up $y$ on the base if $dim Y > 1$, and let $A$ be its exceptional divisor; if $dim Y = 1$, put $A = { y }$. Along a general transverse test at $A$, after ramification of order $e$ divisible by $m$, the coefficients of $u$ in the pulled-back #emph[original] $cal(O)_Y \( - L_Y \)$ frame vanish to order at least $e \/ m$. Every homogeneous replacement $u_(*)$ of degree $a > 0$ vanishes to order at least $a e \/ m$ in the corresponding original $cal(O)_Y \( - a L_Y \)$ frame.]
] <lem:zero-test>

#proof[
  Near $y$ the original morphism is smooth and its boundary is relative simple normal crossing. Its fiber is reduced. Consequently, in any local frame of $cal(O)_X \( m \( K_X + E \) \)$, the coefficient of $s$ belongs to $frak(m)_y cal(O)_X$. On the blowup the ideal $frak(m)_y$ becomes the invertible ideal of $A$. Along a transverse parameter $t$ at its general point the pulled coefficient is therefore divisible by $t$.
  Use throughout the pulled-back old line $cal(O)_X \( K_X + E \)$ and the old relative logarithmic forms. After $t = tau^e$, the tautological root $r$ satisfies, in this old line frame,
  #[#set math.equation(numbering: n => "(3.15)")
   $ (r \/ tau^(e \/ m))^m = s \/ tau^e . $ <eq:log-input-zero-equation>]
  The right-hand side is regular. The left-hand root is a rational section integral over the normal root model and is therefore regular there. It stays regular on the semistable model used above. Thus the map from old relative top logarithmic forms into the semistable relative forms has the factor $tau^(e \/ m)$.
  Passing to coherent cohomology retains that factor. Divide it out first: the resulting regular class still lies generically in $W_w$, since multiplication by a nonzero scalar on the puncture does not change membership in a weight step. By 5, its projection to $"Gr"_w^W$ is regular. Multiplying the projected class back by $tau^(e \/ m)$ proves the claimed order for $u$. Every degree-$a$ homogeneous tensor operation multiplies the order by $a$, and every flat Hodge-compatible projection preserves this divisibility. The result follows for $u_(*)$. This calculation never replaces the old pulled-back source line by $cal(O) \( - L_(Y') \)$ on the blown-up base; the asserted positive order is in the original source frame. ◻
]

== 4 Marked periods of a highest Hodge vector <sec:marked-periods>

The vector supplied by the covering construction need not generate the highest Hodge space. We therefore retain the whole highest space and add flags determined by the vector on certain compact factors. This section constructs the quotient and its line bundles. The boundary and Higgs-tail arguments in 5 complete the positivity statement.

#prodef([Proposition 4.1.])[
  (Marked-period construction).  #emph[Let $B^compose$ be a smooth irreducible complex quasi-projective variety, and let $bb(V)$ be a polarizable rational pure variation with an invariant integral lattice. Suppose that a line bundle $cal(L)$ has a generically nonzero algebraic morphism 
$ u : cal(L) arrow.r F^p bb(V)_(bb(C)) \, #h(2em) F^(p + 1) bb(V)_(bb(C)) = 0 . $

 There are a positive integer $a$, a homogeneous tensor construction followed by flat Hodge-compatible projections, and a generically nonzero morphism 
#[#set math.equation(numbering: n => "(4.1)")
 $ u_(*) : cal(L)^(⊗ a) arrow.r E_0 \, #h(2em) E_0 = F^(p_(*)) bb(A) \, #h(2em) F^(p_(*) + 1) bb(A) = 0 \, $ <eq:marked-vector>]

 where $bb(A)$ is a polarized complex pure variation. The operations may first be performed equivariantly at finite monodromy level. They descend to $B^compose$ after shrinking it. On smooth projective birational models there is a dominant morphism $b : B arrow.r S$ with connected fibers and the following properties.]
  + #emph[#emph[Descent.] On dense smooth opens, $bb(A)$ is the pullback of an actual variation on $S^compose$. Its connected representation is irreducible and factors through a rational semisimple adjoint group $G$. The full monodromy acts through its projected action on $frak(g) = "Lie" G$. In particular, finite scalar monodromy in the kernel of that action has been eliminated.]
  + #emph[#emph[The marks.] There is an algebraic compact-flag section $j_(upright(u))$, possibly empty, determined pointwise and equivariantly by $\[ u_(*) \]$. In flat coordinates the joint marks 
$ j = \( E_0 \, j_(upright(u)) \) $

 take values in a closed product flag orbit $J$ of $G_(bb(C))$. The two kinds of marks use disjoint complex simple factors. Every rational simple factor of $G$ has a complex factor acting nontrivially on $J$. The full Lie-period map together with $j_(upright(u))$ is generically immersive on $S^compose$.]
  + #emph[#emph[The nef lines and adjoint positivity.] If $S$ is a point, $bb(A)$ is constant and we set $cal(H) = cal(H)_(upright(u)) = 0$. Otherwise $S$ has nef rational line bundles $cal(H)$ and $cal(H)_(upright(u))$, with $cal(H) - cal(H)_(upright(u))$ nef. On a smooth unipotent connected-monodromy cover their pullbacks are respectively 
$ det E_0 + cal(H)_(upright(u)) quad upright("and the positive compact-flag line.") $

 The generic curvature rank of $cal(H)$ is the generic rank of $d j$, and equals $nu \( cal(H) \)$. If $D_0$ denotes the reduced union of boundary components with nonidentity local monodromy on $frak(g)$, then 
#[#set math.equation(numbering: n => "(4.2)")
 $ K_S + D_0 + c cal(H)_(upright(u)) quad upright("is big for ") c gt.double 0 . $ <eq:marked-initial-big>]

 Furthermore, 
#[#set math.equation(numbering: n => "(4.3)")
 $ K_S + b_0 cal(H) quad upright("is big for ") b_0 gt.double 0 . $ <eq:marked-final-big>]

]
  #emph[All assertions about extensions are compatible with further smooth projective modifications and pullback at unipotent level. In particular, the iterated Higgs fields of $u_(*)$ are polynomial tensor expressions in those of $u$; the construction introduces no division by a local function.]
] <prop:marked-period>

We prove the construction and (4.2) below. Equation (4.3) is 21. The other comparison needed later concerns a chosen line in a pullback of $E_0$: 22 constructs a nef line $P$ from its iterated Higgs images and proves that adding the pulled-back $cal(H)$ does not increase $nu \( P \)$, provided the chosen line induces the same compact marks. Both comparisons are proved in the next section, after the quotient is constructed.

=== 4.1 Monodromy, representations, and homogeneous replacements <monodromy-representations-and-homogeneous-replacements>

Write $M$ for the full rational algebraic monodromy group of $bb(V)$, and $G_c = M^compose$. A connected monodromy level means a connected finite étale cover on which the monodromy lies in $G_c$; its image is still Zariski dense there.

#prodef([Lemma 4.2.])[
  #emph[The group $G_c$ is semisimple. At connected monodromy level the Hodge circles normalize $G_c$, are locally conjugate by $G_c \( bb(R) \)^(+)$, and have locally constant action on every $G_c$-invariant tensor space. The horizontal period differential therefore has the form 
#[#set math.equation(numbering: n => "(4.4)")
 $ t \( v \) in frak(g)_(c \, bb(C))^(- 1 \, 1) \, #h(2em) theta \( v \) = d rho #scale(x: 120%, y: 120%)[\(] t \( v \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \[ t \( v \) \, t \( w \) \] = 0 . $ <eq:marked-period-tangent>]

 The Lie algebra, and every monodromy-stable sum of its rational simple ideals, is a polarized rational integral variation of weight zero. Its Hodge metric makes $x mapsto - x^(*)$ a compact conjugation, preserving each complex simple ideal.]
] <lem:marked-monodromy>

#proof[
  André’s monodromy normality theorem #cite(label("Andre92")) §5, Theorem 1 applies to this polarizable pure variation over a smooth connected algebraic variety: the connected monodromy is normal in the derived generic Mumford–Tate group. It is therefore semisimple. The same statement applies after a finite étale cover and after restriction to a smooth algebraic subvariety, with its own generic Mumford–Tate group.
  The theorem of the fixed part for polarized variations says that the invariant part of each tensor variation is a constant Hodge structure; see #cite(label("Schmid")) Theorem 7.22 and Corollary 7.23. These tensor invariants determine the reductive group $G_c$. To see the latter assertion in the form needed here, a $G_c$-stable subspace in a tensor representation has a $G_c$-equivariant complementary subspace, so it can be encoded by its invariant projector. The tensor-stabilizer description of an algebraic subgroup then applies #cite(label("Milne")) Theorem 9.2 and §§9.6–9.7. Thus, in a fixed flat frame, the Hodge circles $h_x$ normalize $G_c$, and
  $ h_x \( z \) h_(x_0) \( z \)^(- 1) in G_c \( bb(R) \) . $
  In particular their images in the quotient by $G_c$ are constant. For completeness, local conjugacy follows directly from compactness of the circle. Along a smooth path of these homomorphisms, the logarithmic derivative is a Lie-algebra-valued cocycle for the circle action. Averaging a cocycle over the circle writes it as a coboundary. Integrating the resulting time-dependent element of $"Lie" G_c \( bb(R) \)$ conjugates the circles along the path. One can do this first in the adjoint group and lift through the central isogeny; the remaining central discrepancy is locally constant.
  The tangent to the filtration orbit is obtained from the negative degrees in $frak(g)_(c \, bb(C))$. Griffiths transversality makes its only possible degree equal to $- 1$, giving $t \( v \)$ and its indicated action in every representation. Higgs integrability gives the commutation relation in (4.4).
  The Lie algebra sits as a rational flat subbundle of $"End" bb(V)$. Normalization by the Hodge circles makes it a Hodge subvariation, and restriction of the endomorphism polarization polarizes it. Intersecting its rational fiber with the endomorphism lattice supplies an invariant full lattice. These assertions also hold for the stated rational sums of ideals. Finally, preservation of the polarization and normalization by the Hodge grading imply stability under Hodge-metric adjoint. On the real Lie algebra the negative adjoint is the Cartan involution obtained from the Weil operator. Its complex antilinear extension is the claimed compact conjugation. A compact real form of a semisimple complex algebra is the direct sum of compact real forms of its simple ideals, so this conjugation preserves each ideal. ◻
]

#prodef([Lemma 4.3.])[
  (Homogeneous replacement).  #emph[The replacement (4.1) can be chosen so that its connected representation is irreducible and its full representation factors through the action on the retained rational adjoint Lie factors. Among all such homogeneous replacements, choose one with the fewest retained rational simple factors. Write $G$ for their product as an adjoint group and $frak(g) = "Lie" G$.]
  #emph[Every representation factor used in splitting $bb(A)$ according to a product decomposition of $G$ is a Hodge-compatible summand of tensor constructions on the corresponding Lie variation, up to a constant shift of the Hodge indices. It can be equipped with the metric for which representation adjoints are induced by Lie adjoints. The highest space $E_0$ is the tensor product of the highest spaces of these factors and has a closed projective homogeneous orbit.]
] <lem:marked-replacement>

#proof[
  At connected monodromy level decompose the complex representation into $G_(c \, bb(C))$-isotypical summands. Each is stable under the Hodge circle, since that circle acts on the connected group by inner automorphisms. An isotypical summand is the tensor product of an irreducible representation with its multiplicity space. After a finite covering of the circle, lift its inner action to the first factor; the remaining circle action is on the multiplicity space. Its eigenspace decomposition permits a decomposition into group-irreducible summands stable under the circle. The corresponding flat projectors are Hodge-compatible at a basepoint and, by 8, everywhere. At least one projector has generically nonzero value on $u$.
  Conjugate this projector by the full monodromy group. Its orbit is finite because $G_c$ acts trivially on the projector. Tensor the projected vectors over that finite orbit. On the normal connected level all factors are generically nonzero: the deck transformations carry one projected vector to the others. Permutation of the factors makes the tensor construction equivariant for full monodromy, so it descends. Its source is a positive tensor power of $cal(L)$.
  For the connected group take the Cartan component, the irreducible summand of highest weight equal to the sum of the highest weights of the factors. It has multiplicity one, and its projection is preserved by simultaneous automorphisms and permutations of the factors. This projection never kills a pure tensor of nonzero vectors. Indeed, for a nonzero vector in an irreducible representation its coefficient along an extremal weight line after translation by $g in G_(c \, bb(C))$ is a nonzero regular function of $g$. Finitely many such functions are simultaneously nonzero on a nonempty open set. Their product is the corresponding extremal coefficient in the Cartan component. Since the projection commutes with translation, its value on the original tensor was nonzero as well. The projector preserves the Hodge grading. The projected vector is in the highest Hodge degree of the tensor, which, because its projection is nonzero, is also the highest degree of the retained Cartan component.
  Retain each rational simple adjoint factor having at least one complex simple ideal acting nontrivially on this irreducible representation. This collection is full-monodromy invariant. Let $q : M arrow.r "Aut" \( frak(g) \)$ be the projected adjoint action, and put $K = ker q$. Every element of $K$ commutes with the represented Lie algebra. Schur’s lemma implies that its action on the irreducible representation is scalar. Every ideal in $"Lie" K$ is unrepresented by the definition of the retained collection, so $K^compose$ acts trivially. Consequently the image of $K$, although $K$ itself need not be finite, is a finite group of scalars. Choose a positive integer killing that image and take the Cartan component in the corresponding tensor power. The resulting representation factors through $q \( M \)$, and the preceding nonvanishing argument applies again. In particular its connected representation factors through the adjoint group $G$.
  These constructions, as well as subsequent invariant projections, are homogeneous of positive degree in $u$. The number of retained rational factors is a nonnegative integer, so it has a minimum among these choices. Fix a minimizing choice. Its purpose is to prevent a further nonzero invariant projection from discarding a factor. When a factor fixes the highest space throughout its orbit, this minimality will force the instability that supplies an additional flag.
  Connected irreducibility does not require the highest Hodge step $E_0$ to have rank one; the construction keeps the entire step. The adjoint representation is faithful on $G$. Tensor generation for a reductive group, #cite(label("Milne")) Theorem 4.14, realizes each of its representations as a summand of finite sums of mixed tensors of this faithful representation. For a factor of $G$ the Hodge grading on its Lie algebra is a cocharacter of the adjoint group. Its action in an irreducible representation and the grading inherited from $bb(A)$ induce the same action on the Lie algebra; their quotient is scalar. They thus differ only by a constant Hodge shift. Equivariant projectors on the Lie tensors preserve the grading, and the induced compact-form metrics have the asserted compatibility with adjoints. Applying this separately to the factors gives the tensor decomposition of $E_0$. Finally the parabolic associated with the Hodge grading preserves its maximal-weight subspace. The stabilizer of $E_0$ therefore contains a parabolic, proving that its orbit is closed and projective.
  All projectors used above are flat Hodge morphisms. They and all tensor operations extend on unipotent canonical extensions, by the functoriality recalled in (3.1). The Leibniz rule for the Higgs field proves the last assertion of 7 about iterates. ◻
]

The homogeneous replacement has removed the scalar kernel while retaining a nonzero polynomial expression in the original vector. Full periods can still miss a direction of that vector on a compact factor. We now record those directions as additional algebraic flags. They will allow the joint quotient to retain the vector directions missed by the full period map; a point quotient will give a constant coefficient system.

#prodef([Remark 4.4.])[
  We will use an algebraic monodromy torsor both for the compact-flag construction below and for the later horizontal-germ estimate 17. Here is its construction. Restrict a variation to a smooth algebraic base and pass to a finite étale cover killing the component group of its algebraic monodromy. Suppose its connected algebraic monodromy $H subset.eq "GL" \( V \)$ is semisimple. By the stabilizer-of-a-line theorem for algebraic groups and the tensor realization of representations of $"GL" \( V \)$ #cite(label("Milne")) Theorems 4.27 and 4.14, there is a finite tensor construction containing a line whose stabilizer is exactly $H$. Since a connected semisimple group has no nontrivial character, $H$ fixes a nonzero vector $t$ in that line, and the stabilizer of $t$ is still exactly $H$. This vector defines a global monodromy-invariant flat tensor section. It is algebraic by the full faithfulness of the regular-singular Riemann–Hilbert correspondence #cite(label("DeligneRSE")) Chapter II, §6. Frames carrying $t$ to this section form an algebraic $H$-torsor inside the frame bundle; on a dense open it is a principal bundle, and its connection is algebraic and preserves the reduction. Its monodromy is Zariski dense in $H$ by definition. Thus regular singularity is used to obtain the algebraic reduction, while the dimension estimate itself only needs the flat algebraic connection in its statement.
] <rem:prelim-algebraic-monodromy-torsor>

=== 4.2 Compact flags attached to the vector <compact-flags-attached-to-the-vector>

Call a retained rational simple factor #emph[invisible] if all its complex factors act trivially on the orbit of $E_0$. This condition is invariant under the component group of the full monodromy.

#prodef([Lemma 4.5.])[
  #emph[For the minimizing replacement of 9 there is a generically algebraic section $j_(upright(u))$ with the compact-flag and factor-visibility properties in part (ii) of 7. Its factors have flat positive definite metrics, and their flag varieties carry positive Plücker lines with invariant metrics. The construction is pointwise equivariant in $\[ u_(*) \]$.]
] <lem:marked-flags>

#proof[
  On a nontrivially represented complex ideal in an invisible rational factor the maximal Hodge subspace is invariant under the whole simple group. Irreducibility makes it the whole representation factor. The grading on that representation is scalar, and therefore its induced Lie grading is zero. The Hodge metric on this Lie ideal is consequently flat and positive definite. Monodromy acts isometrically for this compact structure.
  Fix an orbit of invisible rational factors under the full monodromy, and let $U$ be the complexification of their product. Consider the action of $U$ on a general nonzero value of $u_(*)$. If this vector were not unstable for the origin, some homogeneous invariant polynomial of positive degree would be nonzero on it. Equivalently, its tensor power would have a nonzero projection to the $U$-invariant subspace. This elementary invariant-theoretic equivalence follows because invariants separate the disjoint closed sets ${ 0 }$ and a closed orbit in the orbit closure; averaging over a maximal compact subgroup gives the invariant projection. The projection is Hodge-compatible: $U$ is normalized by the Hodge circle. It is also compatible with full monodromy, because the chosen product of rational factors is invariant under it. After repeating 9, the nonzero invariant projection eliminates all factors in this orbit and introduces none. This contradicts minimality. Thus the vector is generically unstable for each such $U$.
  Choose on the cocharacter lattice of $U$ an integral positive length form invariant under its Weyl group and under the finite factor automorphisms in question. One obtains it by summing positive invariant forms over those automorphisms. Kempf’s optimal one-parameter subgroup theorem #cite(label("Kempf78")) §3, in its origin-instability form #cite(label("Kempf76")) Theorem 6, applied to the affine representation and the closed origin, assigns to an unstable vector a unique optimal parabolic. It is equivariant under $U$ and under every automorphism preserving the representation and the length form. It is unchanged by multiplying the vector by a nonzero scalar. It is proper, since $U$ is semisimple and an optimal positive slope requires a noncentral cocharacter.
  We spell out why this pointwise assignment supplies an algebraic section on a dense open. Fix a maximal torus. There are finitely many subsets of the weight set of the representation. For each subset, maximizing the positive normalized minimum pairing is the closest-point problem for its convex hull, with respect to the chosen rational positive form. It determines a rational optimal ray when the minimum is positive. Thus there are only finitely many optimal cocharacter directions and slopes up to conjugacy. The conditions that a translate of a vector have a specified nonzero weight support are constructible. Their images, and the conditions selecting the maximal slope, are constructible by Chevalley’s theorem. The resulting graph of optimal parabolics on the unstable locus is constructible and single valued. Use the algebraic principal monodromy reduction of 10; its associated projective representation and flag bundles are algebraic. Equivariance makes the graph an algebraic constructible subset of their product over the base. Pull this graph back along the actual algebraic section $\[ u_(*) \]$, on the dense open where that section is unstable. The resulting constructible graph has exactly one point over each point of this open base. Over an irreducible base in characteristic zero, its dominant component is birational to the base: after restricting to dense opens, its projection is a generically injective morphism and therefore has degree one. It consequently defines a rational section, regular after shrinking. Applying this argument to the actual section avoids any assumption that it misses the indeterminacy locus of a rational map on the ambient projective representation bundle. The construction uses algebraic associated bundles, not algebraic local trivializations by holomorphic flat frames.
  An optimal cocharacter has zero component on every ineffective factor, since deleting such a component preserves its slope numerator and decreases its length. All nontrivial flags therefore occur on the isometric complex ideals identified above. On the irreducible connected level the generic parabolic types are fixed. The component action permutes these types along with the rational factors. Properness on at least one factor in an orbit implies properness on some complex factor of each rational factor in that orbit. Repeating this for all invisible orbits gives $j_(upright(u))$.
  The highest-space marks already see every other rational factor. Stabilizers of highest spaces and of the new flags are parabolic, and the two constructions use disjoint factors. Thus their joint orbit is the asserted product $J$. A tensor product of highest subspaces determines each factor subspace, so this description is also valid when $E_0$ is presented as a single subspace of $bb(A)$. Embed a parabolic flag by the top exterior power of its parabolic subalgebra. The dual tautological Plücker line is positive, with the metric induced by the flat compact metric. Tensoring these lines gives a positive line invariant also under the relevant factor permutations. ◻
]

The marks now see every retained rational factor. We next construct an algebraic parameter space and descend the actual coefficient variation to it. Descent of the filtration alone would leave a possible finite scalar obstruction, which is why that kernel was removed first.

=== 4.3 An algebraic quotient and actual descent <an-algebraic-quotient-and-actual-descent>

#prodef([Lemma 4.6.])[
  (Generic Lie stabilizer).  #emph[Let a polarized rational Lie variation on a smooth connected complex quasi-projective variety have an invariant integral lattice, semisimple fiber $frak(a)$, and connected algebraic monodromy $"Int" \( frak(a) \)$. At a Hodge-generic lifted period, a rational Lie automorphism preserving the Hodge filtration is the identity.]
] <lem:generic-lie-stabilizer>

#proof[
  A rational endomorphism preserving the filtration of a pure Hodge structure also preserves its conjugate filtration, hence is a Hodge endomorphism. It commutes with the Mumford–Tate group. At a Hodge-generic point this is the generic Mumford–Tate group, which contains the connected monodromy by #cite(label("Andre92")) §5, Theorem 1. If $alpha$ is also a Lie automorphism, then for every $x in frak(a)$,
  $ "ad" \( alpha x \) = alpha "ad" \( x \) alpha^(- 1) = "ad" \( x \) . $
  The Lie algebra has zero center, so $alpha x = x$. Such points may be chosen while imposing finitely many generic differential rank conditions: in a flat chart the proper loci where any one of the countably many rational tensors acquires an additional Hodge condition can be avoided together with those conditions. ◻
]

#prodef([Lemma 4.7.])[
  (Period quotient and descent).  #emph[There is an algebraic quotient with connected generic fibers which remembers the full integral period of $frak(g)$ and the compact marks. Both $frak(g)$ and $bb(A)$ descend as variations on a dense smooth open of the quotient. Its full Lie period and compact marks give a generically immersive joint map in flat coordinates. The same construction is available for any monodromy-stable collection of rational normal factors, at connected level if necessary.]
] <lem:period-descent>

#proof[
  Use the full filtration on the rational integral polarized Lie variation, not only the highest subspace of $bb(A)$. Let $Gamma$ be an arithmetic group of isometries of its polarized lattice containing its monodromy, and let $Omega$ be its period domain, or the associated generic Mumford–Tate domain. The algebraicity theorem for pure integral period maps #cite(label("BBT")) Theorem 1.1 factors the period map through a dominant algebraic map to a quasi-projective algebraic image. Its hypotheses hold here by 8; in particular a lattice has been retained in the full Lie system. Normalize this image in the relative algebraic closure of its function field in $bb(C) \( B \)$. The resulting map $b_0 : B^compose arrow.r.dashed T^compose$ has geometrically connected generic fiber. Shrink to smooth opens where it is a morphism. The dimension of $T^compose$ is the generic rank of the full period map. Indeed, the real period stabilizer is compact, arithmetic orbits are discrete, and the factorization preserves the local analytic image dimension.
  Here is the local-system descent, including possible finite monodromy. Compactify the graph properly over $T^compose$, resolve the complement, and shrink $T^compose$ so that the compactification and all strata of its SNC complement are smooth over it. Lifting vector fields tangent to the strata gives a local differentiable trivialization of this proper smooth pair and hence of its open part. We may thus assume that $b_0$ is a topological fiber bundle with connected fibers. Removing a proper algebraic subset of a smooth complex variety induces a surjection on its fundamental group, so these shrinkings do not decrease the relevant monodromy images.
  Choose a Hodge-generic point of $B^compose$. Along the universal cover of its $b_0$-fiber the lifted Lie-period map has values in one discrete arithmetic orbit; it is therefore constant. Every vertical loop acts by a rational Lie automorphism fixing that lifted period. 12 makes its action trivial. The exact sequence
  $ pi_1 #scale(x: 120%, y: 120%)[\(] b_0^(- 1) \( t \) #scale(x: 120%, y: 120%)[\)] arrow.r pi_1 \( B^compose \) arrow.r pi_1 \( T^compose \) arrow.r 1 $
  now descends the Lie representation. The representation on $bb(A)$ descends as well: by 9 it factors through the full projected Lie action, including its component group. This is where removal of the finite scalar image is necessary.
  The Lie filtration is constant in flat coordinates along each connected fiber. The derivative of the filtration on $bb(A)$ is the action of (4.4); it too vanishes on those fibers. Consequently both filtrations descend. Holomorphicity, Griffiths transversality, and polarization can be checked after the smooth surjective pullback. The descended local systems have quasi-unipotent local monodromy: for a boundary valuation of $T$ choose a valuation above it on a proper model of $B$; a positive power of its monodromy is a monodromy of the original variation. Quasi-unipotence of that power implies quasi-unipotence of the original operator. Canonical extension and GAGA, or regular-singular Riemann–Hilbert, therefore give the algebraic flat bundles and algebraic Hodge bundles on these opens; see #cite(label("DeligneRSE")) Chapter II and (3.1).
  Over $T^compose$ consider the algebraic flag bundle of the descended compact factors. The section $j_(upright(u))$ gives an algebraic map from $B^compose$ into that bundle. Take its image and again normalize in the relative algebraic closure inside $bb(C) \( B \)$. This is the desired $S^compose$. Variations pull back from $T^compose$, and the compact flag descends by its tautological definition. On a dense open the finite map from $S^compose$ to its image is étale, and the period-image factorization preserves tangent rank. Hence the full period and compact marks have joint differential of rank $dim S$. Resolve projective compactifications and the map from $B$ to obtain $b : B arrow.r S$ with connected fibers. The monodromy images on the open source and target agree by the fundamental-group sequence just used.
  For a monodromy-stable collection of rational factors the projected Lie system again has its rational polarization and lattice. The identical argument gives its quotient and descent. At connected level every rational normal factor collection is permitted. ◻
]

If $S$ is a point, the full projected period is constant. Its monodromy lies in a compact period stabilizer and in the discrete integral isometry group, and is thus finite. Its connected algebraic monodromy $G$ is trivial. The representation on $bb(A)$ factors through the projected Lie action, whose kernel has already been removed, so $bb(A)$ is constant. When there are no retained factors the construction simply takes $S$ to be a point.

=== 4.4 The metric comparison used for nefness <the-metric-comparison-used-for-nefness>

The quotient has now been constructed and the coefficient variation descends to it. Two different differentials enter the positivity argument. The full joint differential $\( t \, d j_(upright(u)) \)$ has generic rank $dim S$, by 13; it will control the logarithmic adjoint. The differential of the marks $j = \( E_0 \, j_(upright(u)) \)$ can have smaller rank. It is this second differential that the line $det E_0 + cal(H)_(upright(u))$ measures on the open set. We first compute its curvature and then use the boundary growth estimates to identify curvature rank with numerical dimension on a projective model.

In the smooth Hodge splitting $E = xor.big_p E^p$, write

$ nabla = cal(D) + theta + theta^dagger \, $

where $cal(D)$ is the graded Chern connection and $theta^dagger$ is the Hodge adjoint of the degree-lowering Higgs field. If $theta_p \( v \) : E^p arrow.r E^(p - 1)$, flatness and the polarization give, with positive curvature normalization,

#[#set math.equation(numbering: n => "(4.5)")
 $ R_(E^p) \( v \, macron(v) \) = theta_p \( v \)^(*) theta_p \( v \) - theta_(p + 1) \( v \) theta_(p + 1) \( v \)^(*) . $ <eq:prelim-hodge-curvature>]

The irrelevant common positive normalization factor is suppressed here. For the highest nonzero step $F^p = E^p$, the second term vanishes, and hence

#[#set math.equation(numbering: n => "(4.6)")
 $ c_1 \( det F^p \, h \) \( v \, macron(v) \) = c thin parallel theta_p \( v \) parallel_(upright("HS"))^2 quad \( c > 0 \) . $ <eq:prelim-top-curvature>]

In a local flat frame the differential of the subspace map $b mapsto F_b^p$ is exactly $theta_p$; transversality and $F^(p + 1) = 0$ ensure that its image lies in $F^(p - 1) \/ F^p$. Thus the curvature kernel in (4.6) is exactly the kernel of that subspace differential. This statement concerns the whole highest step, not a chosen line inside it. Adding the positive compact-flag form gives kernel $ker \( d E_0 \, d j_(upright(u)) \)$.

To extend this computation across the boundary, we use the several-variable norm estimates of #cite(label("CKS")) Theorem 5.21, also stated and proved in #cite(label("CK")) Theorem 5.1. Work at unipotent level with the canonical Hodge extensions of (3.1). In a boundary chart $Delta = { z_1 dots.h.c z_ell = 0 }$, shrink so that $\| z_i \| < e^(- 1)$ and put $Lambda = product_(i = 1)^ell \( - log \| z_i \| \)$. Relative to any smooth positive metric $h_0$ on the extending bundle there are constants $C \, N > 0$ such that its Hodge metric satisfies

#[#set math.equation(numbering: n => "(4.7)")
 $ C^(- 1) Lambda^(- N) h_0 med lt.eq med h med lt.eq med C Lambda^N h_0 . $ <eq:prelim-hodge-growth>]

The same assertion holds for the dual, every extending filtration step, and every Hodge graded quotient, with their induced metrics. To pass from the usual sector estimates to (4.7), divide the logarithmic variables into their finitely many order sectors. Each ratio power in the sector estimate is bounded by a power of $Lambda$. The finite logarithmic exponential that converts flat multivalued frames to canonical frames has entries polynomial in the logarithms. Applying the same bounds to the dual gives the lower estimate. Restriction to a subbundle and passage to its quotient preserve a two-sided comparison with a smooth metric, which gives the assertions for $F^p$ and $"Gr"_F^p$. The extension compatibility with flat Hodge projectors proved in (3.1) gives the same estimates for the complex Hodge summands used here.

The induced line metrics therefore have two-sided logarithmic-logarithmic weight bounds. A curvature computation on the open set alone would not identify their intersection numbers. The following full-mass argument makes that comparison.

#prodef([Lemma 4.8.])[
  #emph[Let $Z$ be a smooth projective variety of dimension $n$, let $Delta$ be an SNC divisor, and let $L$ be a rational line bundle. Suppose that on $Z^compose = Z \\ Delta$ it has a smooth Hermitian metric with semipositive curvature form $Theta$, normalized to represent $c_1 \( L \)$. Suppose that in regular nonvanishing local frames of a Cartier multiple of $L$ the metric weights satisfy 
#[#set math.equation(numbering: n => "(4.8)")
 $ \| phi \( z \) \| lt.eq C (1 + sum_(i = 1)^ell log \( - log \| z_i \| \)) $ <eq:prelim-loglog-bound>]

 near every boundary chart $Delta = { z_1 dots.h.c z_ell = 0 }$. Then $L$ is nef. For every Kähler form $eta$ on $Z$ and $0 lt.eq k lt.eq n$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ integral_(Z^compose) Theta^k and eta^(n - k) = c_1 \( L \)^k \[ eta \]^(n - k) . $ <eq:prelim-mass-identity>]

 In particular, 
#[#set math.equation(numbering: n => "(4.10)")
 $ nu \( L \) = max_(z in Z^compose) "rk" Theta_z . $ <eq:prelim-curvature-rank>]

 When the curvature is real analytic, as for the induced Hodge and subspace metrics used below, this maximum is its generic rank.]
] <lem:log-metric>

#proof[
  Taking a Cartier multiple and dividing its weights and curvature by that multiple reduces to a line bundle. We use $d d^c$ normalized so that the curvature of a metric of weight $phi$ is $d d^c phi$.
  First we extend its local plurisubharmonic weights. For $epsilon.alt > 0$, the function
  $ phi_epsilon.alt = phi + epsilon.alt sum_(i = 1)^ell log \| z_i \| $
  is plurisubharmonic off the coordinate divisor and is locally bounded above near it, by (4.8). The removable singularity theorem extends it plurisubharmonically to the polydisk. On a smaller polydisk, the maximum principle, applied successively in the coordinate variables, bounds it above by its values on a fixed distinguished boundary torus disjoint from $Delta$. These bounds are uniform as $epsilon.alt arrow.b 0$. Its increasing limit, with upper semicontinuous regularization, is therefore a plurisubharmonic extension of $phi$. The extensions agree under the pluriharmonic frame changes and give a closed positive current $T in c_1 \( L \)$ on $Z$.
  This current has zero Lelong number at every point. At a boundary point approach along a path on which all the vanishing boundary coordinates have absolute values comparable to a common parameter $r arrow.b 0$. The two-sided bound in (4.8) is then $O \( log log \( 1 \/ r \) \) = o \( \| log r \| \)$. The growth characterization of the Lelong number gives an upper bound of zero; positivity gives the reverse bound. Away from $Delta$ the current is smooth. Demailly’s regularization theorem, in its zero-Lelong-number consequence #cite(label("Demailly92")) Corollary 6.4, now shows that $c_1 \( L \)$ is nef.
  We next prove the mass assertion, since zero Lelong numbers alone would not suffice for it. Fix $epsilon.alt > 0$. Nefness makes $alpha_epsilon.alt = c_1 \( L \) + epsilon.alt \[ eta \]$ a Kähler class. Choose a Kähler representative $omega_epsilon.alt$ and write
  $ T + epsilon.alt eta = omega_epsilon.alt + d d^c phi.alt . $
  Here $phi.alt$ is a global $omega_epsilon.alt$-plurisubharmonic function, smooth on $Z^compose$; changing the smooth background has not changed its logarithmic growth bound. Write the irreducible components of $Delta$ as $Delta_i$, choose their defining sections $s_i$ with smooth metrics, and rescale these metrics so that
  $ u_i = - log parallel s_i parallel^2 gt.eq 1 quad upright("on ") Z^compose . $
  For any fixed $0 < b < 1$ and sufficiently small $delta > 0$, the function
  #[#set math.equation(numbering: n => "(4.11)")
   $ psi = - delta sum_i u_i^b $ <eq:prelim-mass-barrier>]
  is $omega_epsilon.alt$-plurisubharmonic. Indeed, on $Z^compose$ each $d d^c u_i$ is a fixed smooth form and
  $ d d^c \( - delta u_i^b \) = - delta b u_i^(b - 1) d d^c u_i + delta b \( 1 - b \) u_i^(b - 2) d u_i and d^c u_i . $
  The second summand is positive and the first is bounded below by $- delta C omega_epsilon.alt$, because $u_i gt.eq 1$. Decrease $delta$ so that the sum of these lower bounds is at least $- 1 / 2 omega_epsilon.alt$. The same extension argument applies across $Delta$. Since $log u = o \( u^b \)$, the lower growth bound for $phi.alt$ also gives a constant $C_epsilon.alt$ such that
  #[#set math.equation(numbering: n => "(4.12)")
   $ phi.alt gt.eq psi - C_epsilon.alt . $ <eq:prelim-less-singular>]
  We verify directly that $psi$ has full Monge–Ampère mass. Take a smooth decreasing function $chi : \[ 0 \, oo \) arrow.r \[ 0 \, 1 \]$ that is $1$ on $\[ 0 \, 1 \]$ and $0$ on $\[ 2 \, oo \)$. For $R > 1$ set
  $ f_R \( t \) = 1 + integral_1^t b s^(b - 1) chi \( s \/ R \) thin d s #h(2em) \( t gt.eq 1 \) . $
  Then $f_R = t^b$ for $t lt.eq R$, $f_R$ is increasing and concave, and it is constant for $t gt.eq 2 R$. Its derivative bounds, uniformly in $R$, are
  #[#set math.equation(numbering: n => "(4.13)")
   $ 0 lt.eq f'_R \( t \) lt.eq C t^(b - 1) \, #h(2em) 0 lt.eq - f''_R \( t \) lt.eq C t^(b - 2) . $ <eq:prelim-barrier-truncation>]
  Moreover $f_R arrow.t t^b$ as $R arrow.r oo$. The functions $psi_R = - delta sum_i f_R \( u_i \)$ extend smoothly over $Z$, are $omega_epsilon.alt$-plurisubharmonic for the same choice of $delta$, and equal $psi$ locally on $Z^compose$ once $R$ is sufficiently large.
  In a fixed boundary coordinate chart, comparison of $d u_i = - d log \| z_i \|^2 +$ a smooth form and (4.13) gives a bound of positive forms
  #[#set math.equation(numbering: n => "(4.14)")
   $ 0 lt.eq omega_epsilon.alt + d d^c psi_R lt.eq C (eta_0 + sum_(i = 1)^ell frac(sqrt(- 1) thin d z_i and d macron(z)_i, \| z_i \|^2 \( - log \| z_i \| \)^(2 - b))) \, $ <eq:prelim-local-majorant>]
  where $eta_0$ is a smooth positive coordinate form and $C$ is independent of $R$. The right-hand side has an integrable $n$th power. Each singular summand has rank one and its square is zero, and its normal integral is bounded by a constant times
  $ integral_0^(r_0) frac(d r, r \( - log r \)^(2 - b)) < oo . $
  Products involving different normal coordinates are integrable by Fubini. A finite chart covering and dominated convergence now imply
  $ integral_(Z^compose) \( omega_epsilon.alt + d d^c psi \)^n & = lim_(R arrow.r oo) integral_Z \( omega_epsilon.alt + d d^c psi_R \)^n\
 & = integral_Z omega_epsilon.alt^n . $
  The last equality is Stokes’ theorem for the smooth approximants. Since the non-pluripolar Monge–Ampère product does not charge $Delta$, this is exactly full mass for $psi$.
  The full-mass class is preserved on passing to a less singular plurisubharmonic potential. Apply #cite(label("GZ")) Proposition 1.6 to the Kähler form $omega_epsilon.alt$ and (4.12). All the hypotheses are satisfied: $Z$ is compact Kähler, both potentials are $omega_epsilon.alt$-plurisubharmonic, and the lower potential has just been shown to have full mass. It follows that
  #[#set math.equation(numbering: n => "(4.15)")
   $ integral_(Z^compose) \( Theta + epsilon.alt eta \)^n = \( c_1 \( L \) + epsilon.alt \[ eta \] \)^n #h(2em) \( epsilon.alt > 0 \) . $ <eq:prelim-epsilon-mass>]
  All mixed integrands on the left are nonnegative. The identity for one positive $epsilon.alt$ therefore proves that each has finite integral. Expansion of (4.15) and comparison of polynomial coefficients proves (4.9).
  Finally, a smooth semipositive $\( 1 \, 1 \)$-form has $Theta^k and eta^(n - k) > 0$ at a point exactly when its rank there is at least $k$. If this happens at one point it happens on an open neighborhood, so its integral is positive. Combining this observation with (4.9) and (2.2) proves (4.10). For a real-analytic form the nonzero maximal minors cannot vanish on an open set, so the maximal-rank locus is dense. This proves the final assertion. When $n = 0$ the statements follow from the empty-product convention. ◻
]

#prodef([Remark 4.9.])[
  Estimate (4.7) supplies (4.8) for determinants of extending Hodge bundles, their holomorphic subbundles and quotients, and duals and tensor products of these lines. For a subspace given initially only on a dense open set, first resolve its rational Grassmann map; the resulting tautological subbundle is an actual subbundle of the pulled-back extending bundle. Its inclusion is uniformly nondegenerate relative to smooth metrics, so the two-sided estimate applies. Multiplication by a smooth positive metric factor only adds a bounded weight. The semipositivity required by 14 must still be proved for each line by its curvature calculation.
  The rank computation may also be made on a smooth generically finite cover $q : Z' arrow.r Z$. If the lemma applies to $q^(*) L$, it gives nefness of $q^(*) L$, hence of $L$, by testing a curve using a curve lying over it. To compute intersections downstairs, the mass identity upstairs remains valid with $q^(*) eta$ in place of the Kähler form: apply it first to $q^(*) eta + t eta'$ for $t > 0$, where $eta'$ is Kähler, and compare coefficients in $t$. The projection formula gives
  $ \( q^(*) c_1 \( L \) \)^k \( q^(*) \[ eta \] \)^(n - k) = deg \( q \) thin c_1 \( L \)^k \[ eta \]^(n - k) . $
  The form $q^(*) eta$ is positive definite on the étale locus, which is dense. A nonempty open maximal-curvature-rank locus meets it. Thus the same curvature rank computes $nu \( L \)$ downstairs.
] <rem:prelim-metric-operations>

=== 4.5 The nef line and an initial logarithmic adjoint <the-nef-line-and-an-initial-logarithmic-adjoint>

Assume $dim S > 0$. Choose a normal finite monodromy level of $S^compose$ contained in the connected group and in a principal integral congruence subgroup of sufficiently high level, for example a level divisible by $3$. Quasi-unipotent elements at this level are unipotent. One elementary way to see the assertion is that if $A equiv 1 med \( mod med m \)$, then $\( zeta - 1 \) \/ m$ is an algebraic integer for each root-of-unity eigenvalue $zeta$. For $m gt.eq 3$ all its conjugates have absolute value less than one unless it is zero; hence $zeta = 1$.

Take an equivariant smooth projective compactification $tilde(S)$ of this level, with SNC boundary. On the compact complex ideals the now-unipotent local monodromy is unitary and therefore trivial. Their flat bundles extend across the boundary with their smooth positive metrics. Resolve the compact-flag maps in these bundles equivariantly. The line

#[#set math.equation(numbering: n => "(4.16)")
 $ tilde(cal(H)) = det tilde(E)_0 + tilde(cal(H))_(upright(u)) $ <eq:marked-level-line>]

is defined on this model: $tilde(E)_0$ is the highest Schmid extension, and $tilde(cal(H))_(upright(u))$ is the product Plücker line from 11. Both have semipositive curvature. For $det tilde(E)_0$ the curvature is the squared norm of the differential of the highest subspace; for the compact summand it is the pullback of the positive flag form. Their kernels therefore intersect in the kernel of $d j$. The Hodge norm and dual norm have logarithmic growth in canonical-extension frames; the compact metric is smooth. 14 gives nefness and

#[#set math.equation(numbering: n => "(4.17)")
 $ nu \( tilde(cal(H)) \) = max "rank" \( d j \) . $ <eq:marked-nef-rank>]

The construction is linearized for the deck group. A common positive power kills the finite stabilizer actions on the fibers of each line, and that power descends to the finite quotient. For clarity, descent can be checked locally by averaging a local frame after its stabilizer acts trivially; the invariant frame is nonzero after shrinking and supplies the required quotient frame. Let $S$ now be a smooth projective log resolution of that quotient, replacing the earlier compactification, and pull the descended rational lines to $S$. Denote them by $cal(H)$ and $cal(H)_(upright(u))$. Nefness descends under a finite surjection and is preserved by pullback. On the resolution of the corresponding base change upstairs the lines are exactly the pullbacks of (4.16), by functoriality of unipotent extensions and of the resolved flag maps. In particular

#[#set math.equation(numbering: n => "(4.18)")
 $ nu \( cal(H) \) = max "rank" \( d j \) \, #h(2em) cal(H)_(upright(u)) upright(" and ") cal(H) - cal(H)_(upright(u)) upright(" are nef") . $ <eq:marked-downstairs-rank>]

We record compatibility with rational normal factors, used in the next section. At connected level, write $G = H times Q$. Then $bb(A) = A_H ⊗ A_Q$ and $E_0 = E_H ⊗ E_Q$. Splitting the compact marks accordingly gives

#[#set math.equation(numbering: n => "(4.19)")
 $ cal(H)_H & = \( "rk" E_Q \) det E_H + cal(H)_(upright(u) \, H) \, & cal(H)_Q & = \( "rk" E_H \) det E_Q + cal(H)_(upright(u) \, Q) \, & cal(H) & = cal(H)_H + cal(H)_Q . $ <eq:marked-factor-lines>]

These are nef lines on suitable smooth models. Apply 13 to the full $Q$-period and its compact marks, obtaining $q : S arrow.r S_Q$ after modification. The $Q$-line is $q^(*) underline(cal(H))_Q$ for the same construction on $S_Q$. The restricted congruence condition holds on the lattice intersected with each rational ideal, so the descended $Q$-system has unipotent boundary monodromy. Consequently its extensions, flag lines, and these identities remain compatible on a common resolution.

Mark the reduced SNC union $D_0$ of those boundary prime divisors of $S$ whose local monodromy on $frak(g)$ is not the identity.

#prodef([Lemma 4.10.])[
  (Initial adjoint bigness).  #emph[For the marked-period quotient just constructed, 
$ K_S + D_0 + c cal(H)_(upright(u)) quad upright("is big for all sufficiently large ") c . $

]
] <lem:initial-adjoint>

#proof[
  Let $d = dim S$ and work first on a smooth unipotent level $p : tilde(S) arrow.r S$, resolving further when necessary. On its open part the joint differential has image
  $ cal(J) subset.eq "Gr"_F^(- 1) frak(g)_(bb(C)) xor j_(upright(u))^(*) T_(J_(upright(u))) . $
  The differential here is $\( t \, d j_(upright(u)) \)$, where the second component is the vertical derivative in flat flag charts. It is globally defined because the transition maps are flat. Its rank is $d$ by 13. Resolve the map to the corresponding relative Grassmannian so that $cal(J)$ extends as a subbundle of the indicated extended ambient bundle.
  Equip it with the subbundle metric. We give the curvature calculation because it uses the full period differential, whereas the nef line $cal(H)$ only uses the marks $j$. Fix a tangent vector $v$, and choose an orthonormal frame $\( a_mu \, b_mu \)$ of $cal(J)$ at the point. Each $a_mu$ lies in the image of $t$, so integrability gives $\[ t \( v \) \, a_mu \] = 0$. The Hodge curvature formula on the degree $- 1$ Lie space consequently gives
  $ sum_mu chevron.l Theta_("Gr"_F^(- 1) frak(g)) \( v \, macron(v) \) a_mu \, a_mu #scale(x: 120%, y: 120%)[chevron.r] = - sum_mu parallel \[ t \( v \)^(*) \, a_mu \] #scale(x: 120%, y: 120%)[parallel]^2 . $
  The convention is the curvature normalization of (4.5). The flag tangent curvature is bounded above by $C omega_(upright(u)) \( v \, macron(v) \)$ times the identity, where $omega_(upright(u))$ is the positive compact-flag form pulled back along the section. Such a uniform $C$ exists because the flag variety is compact and the flat transition actions are isometric. Subbundle curvature subtracts a squared second fundamental form. After increasing $C$ by the fixed rank $d$, this proves
  #[#set math.equation(numbering: n => "(4.20)")
   $ Theta_(- det cal(J) + c tilde(cal(H))_(upright(u))) \( v \, macron(v) \) gt.eq sum_mu parallel \[ t \( v \)^(*) \, a_mu \] #scale(x: 120%, y: 120%)[parallel]^2 + \( c - C \) omega_(upright(u)) \( v \, macron(v) \) . $ <eq:marked-curvature-estimate>]
  The right side is positive whenever the joint differential is nonzero. Indeed, if its compact component is nonzero, the last term is positive for $c > C$. Otherwise $t \( v \) eq.not 0$. Since $\( t \( v \) \, d j_(upright(u)) \( v \) \)$ belongs to $cal(J)$, vanishing of all the commutators in the first term would imply $\[ t \( v \)^(*) \, t \( v \) \] = 0$. But $t \( v \)$ acts as a nonzero lowering nilpotent in the faithful adjoint representation. A normal nilpotent endomorphism is zero, a contradiction. Thus the line
  $ R = - det cal(J) + c tilde(cal(H))_(upright(u)) $
  has semipositive curvature and full generic curvature rank. The extended ambient Hodge metrics and their duals have logarithmic bounds, the compact metric is smooth, and the resolved subbundle metric has the same bounds. By 14, $R$ is nef with numerical dimension $d$, hence big.
  It remains to compare $R$ with the claimed adjoint on $S$. The differential gives a generically invertible map
  #[#set math.equation(numbering: n => "(4.21)")
   $ p^(*) T_S \( - log D_0 \) arrow.r.dashed cal(J) . $ <eq:marked-log-tangent-map>]
  It is regular at every prime upstairs which dominates a prime of $S$. At a marked prime, the finite cover is generically a power substitution $t = z^e$. The lift of $t partial_t$ is $e^(- 1) z partial_z$. The logarithmic Higgs field extends on the unipotent canonical extension, so its Lie component is regular; one recovers the Lie-valued $t$ from the adjoint Higgs field by the split adjoint inclusion into endomorphisms. The resolved compact flag is regular upstairs, so its derivative on $z partial_z$ is regular as well. The tangential generators cause no poles. At an unmarked prime the monodromy level is generically unramified, since it was defined using only the projected adjoint monodromy. The local Lie monodromy is the identity and the extended period has no logarithmic term. The same regularity assertion follows using the ordinary tangent generator there.
  These regular ambient maps land in $cal(J)$ at the primes in question. Indeed, $cal(J)$ is a subbundle, so its quotient in the ambient bundle is torsion-free; a regular ambient section whose generic value lies in $cal(J)$ has zero image in that quotient. Taking determinants in (4.21) and dualizing gives a generically nonzero map
  #[#set math.equation(numbering: n => "(4.22)")
   $ R arrow.r.dashed p^(*) \( K_S + D_0 + c cal(H)_(upright(u)) \) $ <eq:marked-adjoint-comparison>]
  regular above every prime of $S$.
  Possible poles on divisors exceptional over $S$ do not affect the conclusion, as follows. Factor $p$ through the finite normalization $S' arrow.r S$ of this level. Choose an ample line $A_S$ on $S$ and a positive rational $epsilon.alt$ sufficiently small that $R - epsilon.alt p^(*) A_S$ is big. For a sufficiently divisible positive integer $m$, it has a nonzero section. Its image under (4.22) is a rational section of
  $ p^(*) m \( K_S + D_0 + c cal(H)_(upright(u)) - epsilon.alt A_S \) $
  regular at every divisor of the normal variety $S'$. Normality extends it over $S'$. Taking its field norm to $S$ gives a nonzero section of a positive multiple of $K_S + D_0 + c cal(H)_(upright(u)) - epsilon.alt A_S$. Adding the ample term proves bigness. Since $cal(H)_(upright(u))$ is nef, the conclusion persists when $c$ is increased. ◻
]

This proves all construction and descent assertions of 7, as well as its initial adjoint bigness. The next section removes $D_0$ and proves the tail-rank identity without any hypothesis that $u_(*)$ span the whole of $E_0$.

== 5 Boundary rank and Higgs tails <sec:boundary-rank>

This section proves the boundary rank loss and the weighted Higgs-tail comparison that turn the marked-period construction into adjoint bigness and, later, base nonvanishing.

We retain the marked data of 4. In particular, $G$ is the connected rational adjoint monodromy group, $bb(A)$ is an irreducible representation of $G_(bb(C))$ with the compatible polarized Hodge grading, and $E_0$ is its whole highest Hodge step. The marks are $j = \( E_0 \, j_(upright(u)) \)$. Their orbit $J$ is a product of projective flag varieties, and each rational simple factor of $G$ has at least one complex simple factor acting nontrivially on $J$. The compact marks occur on factors with an invariant positive Hermitian metric. On an appropriate smooth connected unipotent level the line $cal(H)$ is $det E_0 + cal(H)_(upright(u))$; it is understood downstairs as a rational line. Its curvature rank is the generic rank of $d j$, whereas the quotient $S$ remembers the full Lie period and the compact marks. These two ranks need not be identified in advance.

=== 5.1 The flat-connection estimate <the-flat-connection-estimate>

To compare numerical ranks, let $T$ be a local fiber of a flag map in flat coordinates and let $Z$ be its algebraic closure. Frames in which the flag has its fixed value form an algebraic incidence over $Z$. Its fiber dimension is the stabilizer dimension, whereas it contains the horizontal lift of $T$. The following estimate bounds the closure of that lift from below. In the orbit calculation these two dimensions will force the differential on $Z$ to fill the monodromy orbit.

The estimate is the semisimple case of the connection Ax–Schanuel framework of #cite(label("BCFN")) Theorem A, Theorem 3.6, and Remark 3.7. We give the argument, following the connection-form proof in #cite(label("BCFN")) §3.1.

#prodef([Lemma 5.1.])[
  #emph[Let $p : cal(P) arrow.r Z$ be an algebraic principal bundle for a connected semisimple complex algebraic group $H$, where $Z$ is smooth and irreducible. Suppose $cal(P)$ carries an algebraic flat principal connection whose monodromy is Zariski dense in $H$. Let $U$ be an irreducible analytic germ contained in a horizontal leaf, and suppose $p \( U \)$ is Zariski dense in $Z$. If $R$ is the Zariski closure of $U$ in $cal(P)$, then 
#[#set math.equation(numbering: n => "(5.1)")
 $ dim R gt.eq dim U + dim H . $ <eq:prelim-horizontal-dimension>]

]
] <lem:connection-dimension>

#proof[
  Put $frak(h) = "Lie" H$, and let $xi in H^0 \( cal(P) \, Omega_(cal(P))^1 ⊗ frak(h) \)$ be the absolute connection form. It has kernel the horizontal distribution, is the identity on fundamental vertical vectors, and satisfies
  #[#set math.equation(numbering: n => "(5.2)")
   $ d xi + 1 / 2 \[ xi \, xi \] = 0 \, #h(2em) R_g^(*) xi = "Ad" \( g^(- 1) \) xi quad \( g in H \) . $ <eq:prelim-maurer-cartan>]
  Restrict to a nonempty smooth open subset $R^compose subset R$ on which $xi \|_(T R)$ has constant rank $r$. The germ $U$ meets this subset, because it is Zariski dense in $R$. We may replace $U$ by a small connected smooth germ there without changing its Zariski closure. Set $cal(K) = ker \( xi \|_(T R^compose) \)$, and consider the algebraic Grassmann map
  $ beta : R^compose arrow.r "Gr" \( r \, frak(h) \) \, #h(2em) x mapsto xi \( T_x R \) . $
  For a local holomorphic vector field $V$ in $cal(K)$, Cartan’s formula and (5.2) give
  $ cal(L)_V \( xi \|_(R^compose) \) = iota_V d xi + d \( iota_V xi \) = 0 . $
  The local flow of $V$ consequently preserves both the restricted connection form and its image subspace; hence $d beta \( V \) = 0$. Since $T U subset cal(K) \|_U$, the map $beta$ is constant on $U$. Its algebraicity and the Zariski density of $U$ make it constant on $R^compose$. Denote its value by $frak(b) subset.eq frak(h)$.
  This fixed subspace is a Lie subalgebra. In fact, for $b_1 \, b_2 in frak(b)$, locally choose tangent fields $V_1 \, V_2$ on $R^compose$ with $xi \( V_i \) = b_i$. Such lifts exist because $xi \|_(T R^compose)$ is a surjection onto the constant bundle $frak(b)$. Evaluating (5.2) yields
  $ xi \( \[ V_1 \, V_2 \] \) = \[ b_1 \, b_2 \] \, $
  so $\[ b_1 \, b_2 \] in frak(b)$.
  Suppose $frak(b) eq.not frak(h)$. Let $A$ be the connected analytic subgroup of $H$ with Lie algebra $frak(b)$, and let $B$ be its Zariski closure. Then $B$ is a connected algebraic subgroup and is proper in $H$. To prove the latter point, if $B = H$, the fact that $A$ preserves $frak(b)$ under its adjoint action would imply that $H$ preserves $frak(b)$: the stabilizer of this subspace is algebraic. Thus $frak(b)$ would be an ideal of the semisimple Lie algebra $frak(h)$. Every such ideal is a sum of simple factors and integrates to a closed connected normal algebraic subgroup of $H$. That subgroup is $A$, by uniqueness of a connected analytic subgroup with a given Lie algebra. A proper $frak(b)$ therefore cannot have Zariski-dense $A$, a contradiction.
  Consider the irreducible algebraic subset
  $ R_B = overline(R dot.op B) subset.eq cal(P) . $
  It dominates $Z$, since $p \( U \)$ is dense, and it is invariant under the right action of $B$. The equivariance in (5.2) shows that, at a general smooth point,
  #[#set math.equation(numbering: n => "(5.3)")
   $ xi \( T R_B \) subset.eq "Lie" B . $ <eq:prelim-saturated-tangents>]
  Indeed, on the image of the multiplication map $R^compose times B arrow.r cal(P)$, tangent vectors coming from $R^compose$ have connection values in $"Ad" \( B \) frak(b) subset.eq "Lie" B$, and tangent vectors coming from $B$ have values in $"Lie" B$. Generic smoothness of this dominant map onto $R_B$ proves (5.3).
  The $B$-orbits in a fiber have dimension $dim B$. Domination of $Z$ therefore gives $dim R_B gt.eq dim Z + dim B$. Conversely, (5.3) and $dim ker xi = dim Z$ give the reverse inequality. Equality holds, and at general smooth points
  $ T R_B = xi^(- 1) \( "Lie" B \) . $
  In particular the whole horizontal distribution is tangent to $R_B$. This is an algebraic tangency statement on all of $R_B$: if a local algebraic horizontal vector field differentiates an equation of $R_B$, the result vanishes on its dense smooth locus and hence on $R_B$. Thus the ideal sheaf of $R_B$ is preserved by horizontal vector fields. Their local holomorphic flows preserve $R_B$ in both directions.
  Choose a nonempty smooth open $Z_0 subset.eq Z$ over which the general fiber of $R_B arrow.r Z$ is nonempty of dimension $dim B$. Horizontal transport along a path in $Z_0$ is defined throughout the path: locally it is the fundamental solution of a holomorphic linear system after a faithful representation of $H$. The preceding ideal invariance shows that it preserves $R_B$. In particular the monodromy of $Z_0$ preserves the nonempty closed subset $\( R_B \)_z$ of the $H$-torsor $cal(P)_z$. Deleting a proper algebraic subset of a smooth complex variety does not decrease the original monodromy image: the map $pi_1 \( Z_0 \, z \) arrow.r pi_1 \( Z \, z \)$ is surjective, since loops can be perturbed off a subset of real codimension at least two. This monodromy is therefore Zariski dense in $H$. A closed subset of an $H$-torsor invariant under a Zariski-dense translation subgroup is invariant under $H$, and is either empty or the whole torsor. But $\( R_B \)_z$ is nonempty and has dimension $dim B < dim H$. This contradiction proves $frak(b) = frak(h)$.
  Finally the generic kernel of $xi \|_(T R)$ contains $T U$ and hence has dimension at least $dim U$. Its generic image has dimension $dim H$, so rank–nullity gives (5.1). ◻
]

=== 5.2 The orbit calculation <the-orbit-calculation>

In this subsection, a differential of a period, flag, or projective line is computed in local flat frames. A local fiber is a connected smooth analytic fiber germ on the locus of constant maximal rank. The phrase Hodge-generic refers to the integral rational Lie variation, including its tensor constructions, as in 8.

#prodef([Lemma 5.2.])[
  (Orbit rank).  #emph[Let $B^compose$ be a smooth connected algebraic base carrying the marked data above, with Zariski-dense connected monodromy $G$. The same conclusions hold for their pullback by a dominant algebraic map with connected generic fiber. Consider either the joint flag map $j$, or an algebraic projective line section $ell$ of a flat representation of $G$.]
  #emph[#emph[Local orbit filling.] Let $T$ be a local fiber at a Hodge-generic point and let $Z$ be its irreducible Zariski closure. After passing to a finite level on a smooth open of $Z$, its connected monodromy is a rational normal factor $H$ of $G$. Write $G = H times Q$. The full $Q$ period is constant on the lifted $Z$. In the flag case the $Q$ compact marks are constant there as well. At suitable smooth generic points of $T$, writing $a$ for $j$ or $ell$, one has 
#[#set math.equation(numbering: n => "(5.4)")
 $ dim Z - dim T = dim \( H_(bb(C)) dot.op a \) \, #h(2em) d a \( T_z Z \) = T_(a \( z \)) \( H_(bb(C)) dot.op a \( z \) \) . $ <eq:boundary-orbit-fill>]

 In the flag case write $J = J_H times J_Q$ for the products of its $H$ and $Q$ flag factors, and $j = \( j_H \, j_Q \)$ for the corresponding projections in local flat frames. The orbit in (5.4) is then $J_H$.]
  #emph[#emph[Flag ranks and lines.] For the flag map on a level of $S$, let $q : B arrow.r S_Q$ denote a resolved connected-fiber quotient for the full $Q$ period together with its compact marks, and set $s_Q = dim S_Q$ and $d_H = dim J_H$. If $r = "rk" \( d j \)$, then 
#[#set math.equation(numbering: n => "(5.5)")
 $ "rk" \( d j_Q \) = s_Q \, #h(2em) r = d_H + s_Q . $ <eq:boundary-rank-split>]

 On suitable smooth projective models, with $rho : B arrow.r S$ the level map, the nef lines split as 
#[#set math.equation(numbering: n => "(5.6)")
 $ rho^(*) cal(H) = cal(H)_H + cal(H)_Q \, #h(2em) nu \( cal(H)_H \) = d_H \, #h(2em) cal(H)_Q = q^(*) underline(cal(H))_Q \, #h(2em) nu \( underline(cal(H))_Q \) = s_Q . $ <eq:boundary-line-split>]

 Here all line equalities are rational line-bundle equalities.]
] <lem:orbit-rank>

#proof[
  We may choose the initial point outside the countably many exceptional tensor loci and in the maximum-rank loci of the maps associated with every rational normal-factor subset of $G$. There are only finitely many such subsets. The restriction to $Z$ has the same generic Mumford–Tate group as the ambient variation: a tensor condition holding on $Z$ holds at the chosen Hodge-generic point. The connected monodromy normality theorem, in the pure polarized integral setting specified in 8, makes $H$ normal in that Mumford–Tate group. Since $H subset.eq G$ and $G$ is semisimple adjoint, $H$ is a product of rational simple factors and has the complementary factor $Q$.
  The restricted $Q$ monodromy is finite. Kill it by a finite cover of a smooth open of $Z$. The fixed-part theorem then says that the full $Q$ variation is constant. Its flat frames are algebraic frames: the algebraic connection has regular singularities and its trivial local system is the trivial regular-singular connection. The $Q$ compact marks are algebraic in these frames. They are constant on the lifted $T$, since $j$ was constant there, and hence on the lifted $Z$. Indeed, a lift of a nonempty open subgerm of $T$ is Zariski dense in an irreducible component of this finite cover. Its closure has dimension at least $dim Z$, because its finite image contains a Zariski-dense subset of $Z$; an irreducible component of the cover also has dimension $dim Z$. This proves the required density assertion after finite levels. In the line case we only need the constancy of the $Q$ period.
  Use the algebraic flat $H_(bb(C))$-frame torsor over this smooth open of $Z$. It is the reduction specified by the parallel tensor invariants; its connection has Zariski-dense monodromy $H$. Set $a_0 = a \( T \)$ in a flat trivialization along $T$. Consider the algebraic incidence consisting of frames in which $a$ has value $a_0$. Over a point where it is nonempty its fiber is a coset of the stabilizer of $a_0$ in $H_(bb(C))$. Its image contains $T$ and is constructible, so contains a dense open of $Z$. If $d = dim \( H_(bb(C)) dot.op a_0 \)$, the incidence over that open therefore has dimension
  $ dim Z + dim H - d . $
  It contains the horizontal lift of $T$, whose Zariski closure therefore has at most this dimension. Applying 17 to that horizontal germ gives
  $ dim T + dim H lt.eq dim Z + dim H - d \, quad upright("or equivalently") quad dim Z - dim T gt.eq d . $
  This use of the incidence works equally for a locally closed projective-line orbit; projectivity of the orbit is not needed.
  Move within $T$ to a smooth point of $Z$ lying over the dense open just obtained. Nonempty open subgerms are still Zariski dense in $Z$. In flat frames the values of $a$ on a neighborhood in $Z$ lie in $H_(bb(C)) dot.op a_0$. Moreover
  $ ker \( d a \|_(T_z Z) \) = T_z Z ∩ ker d a = T_z T \, $
  because the ambient map has constant rank near $T$. Thus $dim Z - dim T lt.eq d$. Equality proves (5.4). For the joint marks, the factor-by-factor description of $J$ identifies this orbit with $J_H$.
  We now work with $a = j$ on a level of $S$. The $Q$ joint data is constant on $Z$, so $T_z Z subset.eq ker d q$, while $ker d j = T_z T subset.eq ker d q$ at the chosen points. The orbit calculation gives
  $ d j_H \( ker d q \) = T_(j_H \( z \)) J_H . $
  Since $j_Q$ descends through $q$, one has $ker d q subset.eq ker d j_Q$. Conversely, if $d j_Q \( v \) = 0$, choose $w in ker d q$ with $d j_H \( w \) = d j_H \( v \)$. Then $d j \( v - w \) = 0$, hence $v - w in ker d q$, and therefore $v in ker d q$. It follows that $ker d j_Q = ker d q$. Computing the rank first along $ker d q$ and then on its quotient proves (5.5). Our initial choice in the maximum-rank loci makes these generic rank identities, even though the argument was carried out at points of $T$.
  The representation decomposes at connected level as $bb(A) = A_H ⊗ A_Q$, and its highest step as $E_0 = E_H ⊗ E_Q$. The factors are the compatible Hodge representations constructed from the separate adjoint Lie tensor systems; a constant scalar shift of a grading has no effect on the following determinant calculation. If $e_H = "rk" E_H$ and $e_Q = "rk" E_Q$, then
  $ det E_0 = \( det E_H \)^(⊗ e_Q) ⊗ \( det E_Q \)^(⊗ e_H) . $
  Add the compact-mark line on the appropriate factors to define $cal(H)_H$ and $cal(H)_Q$. Their semipositive curvature forms have kernels $ker d j_H$ and $ker d j_Q$. The first has rank $d_H$, by orbit filling and the upper bound $dim J_H$; the second has rank $s_Q$. 14 gives their numerical dimensions.
  The $Q$ representation and flags descend through $q$ by 13, applied to precisely the rational normal factors in $Q$. Its integral lattice inherits the congruence-level condition, so its quasi-unipotent boundary monodromies are already unipotent. Choose smooth projective models resolving $q$ and all the flag sections. Unipotent canonical extension commutes with this pullback: in a monomial boundary chart the new logarithmic residues are integral sums of the commuting old nilpotent residues, and the untwisted filtration pulls back. Thus the equality of the $Q$ lines on the open set extends as the equality in (5.6). The metric rank on the quotient is $s_Q$, so the same metric lemma gives $nu \( underline(cal(H))_Q \) = s_Q$. ◻
]

=== 5.3 Strict loss of numerical dimension at the boundary <strict-loss-of-numerical-dimension-at-the-boundary>

The reduced divisor $D_0$ on $S$ consists of the boundary components whose monodromy on the retained rational Lie variation $frak(g)$ is not the identity. In particular finite nonidentity monodromy is included.

#prodef([Proposition 5.3.])[
  (Boundary drop).  #emph[For every component $D_i$ of $D_0$, 
#[#set math.equation(numbering: n => "(5.7)")
 $ nu \( cal(H) \|_(D_i) \) < nu \( cal(H) \) . $ <eq:boundary-strict-drop>]

 If $nu \( cal(H) \) = 0$, then $D_0$ is empty.]
] <prop:boundary-drop>

#proof[
  Put $r = nu \( cal(H) \) = "rk" d j$ and use 18. Write $B$ for its smooth unipotent level, and put $n = dim B = dim S$. On $B$ choose a smooth boundary component $D'$ mapping generically finitely onto $D_i$. Further resolutions and restrictions to the strict transform are allowed. For any nef line $L$ on a smooth projective variety, restriction to a divisor cannot increase its numerical dimension: choose an ample $A$ with $m A - D'$ effective and compare the nonnegative intersections $L^k D' A^(n - k - 1)$ and $m L^k A^(n - k)$. Consequently
  $ nu \( cal(H)_H \|_(D') \) lt.eq d_H . $
  If $D'$ does not dominate $S_Q$, then
  $ nu \( cal(H)_Q \|_(D') \) lt.eq dim q \( D' \) < s_Q . $
  The binomial expansion of intersections of nef classes gives $nu \( P + Q \) lt.eq nu \( P \) + nu \( Q \)$ for nef $P \, Q$. Applied on $D'$, this proves the strict inequality in this case. We may therefore assume that $D'$ dominates $S_Q$. At its generic point the $Q$ system is pulled back from the interior of $S_Q$.
  #emph[Infinite local monodromy.] The logarithm $N$ of a sufficiently divisible power of the original monodromy is then nonzero and belongs to the rational Lie algebra of $H$. Its $Q$ component is zero because the $Q$ variation extends from the interior at the generic point of $D'$. It acts nontrivially on the $H$ orbit of $E_H$. To check this last assertion, a nonzero rational element in a rational simple factor has nonzero projection to every Galois-conjugate complex simple factor. A unipotent isometry of a positive Hermitian space is the identity. Thus a rational factor detected only by compact marks cannot support a nonzero component of $N$. Every other retained rational factor has a visible first-kind flag factor, and the action of a complex simple adjoint group on a nontrivial flag variety is faithful. A nonzero component of $N$ therefore moves such a flag.
  Let $p_H$ be the highest Hodge index of $A_H$ and set $p_0 = e_H p_H$. There is no restriction on the rank $e_H$ of $E_H$. Form
  $ bb(B) = and.big^(e_H) A_H \, #h(2em) L_H = det E_H = F^(p_0) bb(B) \, #h(2em) F^(p_0 + 1) bb(B) = 0 . $
  The highest filtration step of $bb(B)$ is exactly the one-dimensional line $L_H$. Denote the weight of $bb(B)$ by $w$. On the open stratum of $D'$, untwist by $exp \( - log \( z \) N \/ \( 2 pi sqrt(- 1) \) \)$ in a local normal coordinate $z$ and let $\[ v \]$ be the limiting highest line. Schmid’s nilpotent-orbit theorem and limiting mixed Hodge theorem #cite(label("Schmid")) Theorems 4.12 and 6.16 apply to the polarized unipotent variation. The same assertions hold in $bb(B)$: it is a Hodge-compatible summand of rational adjoint tensor systems, whose flat projectors commute with $N$ and preserve the two limiting Hodge filtrations and the weight filtration.
  Write $W_bullet = W \( N \)_bullet$, centered at $w$. The line $F^(p_0)$ occupies a single summand $I^(p_0 \, q)$ of the Deligne splitting, since there are no summands of first index greater than $p_0$. Set $p_0 + q = w + k$. The primitive decomposition of the monodromy weight grades shows that $k gt.eq 0$ and that the class of $v$ in $"Gr"_(w + k)^W$ is primitive. Here is the specific reason. A nonprimitive term of first Hodge index $p_0$ has the form $N^j u$ with $j > 0$ and with $u$ of first index $p_0 + j$, which is impossible. Likewise a weight grade below $w$ is entirely obtained from positive powers of $N$ on higher primitive grades, and so cannot contain the highest line. Monodromy Lefschetz gives a nonzero $N^k \[ v \]$ in $"Gr"_(w - k)^W$ and zero $N^(k + 1) \[ v \]$. In fact
  #[#set math.equation(numbering: n => "(5.8)")
   $ N^k v eq.not 0 \, #h(2em) N^(k + 1) v = 0 $ <eq:boundary-actual-primitive>]
  for the actual vector: $N$ has bidegree $\( - 1 \, - 1 \)$ in the Deligne splitting, so each $N^j v$ lies in a single summand; its vanishing on the corresponding weight grade is its vanishing as a vector. The primitive decomposition and Lefschetz isomorphisms used here are those of the monodromy weight filtration, as in #cite(label("Schmid")) Lemma 6.4 and Theorem 6.16.
  Let $O_H$ be the closed orbit of the highest line of $bb(B)$, namely the exterior-power embedding of the $H$ orbit of $E_H$. The untwisting acts through $H_(bb(C))$, so $\[ v \] in O_H$. By (5.8),
  $ lim_(tau arrow.r oo) exp \( tau N \) \[ v \] = \[ N^k v \] in O_H ∩ upright(bold(P)) \( ker N \) . $
  The intersection on the right is a proper closed subset of the irreducible variety $O_H$, because $N$ acts nontrivially on $O_H$. Project $N^k v in W_(w - k)$ to $"Gr"_(w - k)^W$ and then apply the fixed inverse of
  $ N^k : "Gr"_(w + k)^W arrow.r^(med tilde.op med) "Gr"_(w - k)^W . $
  The resulting projective point is the highest graded line $\[ v \]_("Gr")$. These maps are fixed linear maps in local flat limiting coordinates. Projection is taken on the open set where its value is nonzero; this set contains all the points under consideration by Lefschetz. The local variation rank of the highest graded line is therefore at most $dim O_H - 1$. Together with all the $H$ compact marks its rank is at most
  #[#set math.equation(numbering: n => "(5.9)")
   $ dim O_H - 1 + dim J_(upright(u) \, H) = d_H - 1 . $ <eq:boundary-graded-rank>]
  #emph[From limiting rank to numerical dimension.]  We next justify that the graded rank just obtained bounds the numerical dimension of the restricted line, including at crossings. One cannot simply restrict the original singular Hodge metric to $D'$. Instead, the pure weight grades of the limiting mixed Hodge structures give polarized pure variations on the open stratum of $D'$ #cite(label("CK")) Proposition 2.10. Their filtrations are holomorphic and transverse, by the extended filtration and the tangential logarithmic connection. Their primitive parts have the monodromy polarizations, and their remaining parts are polarized through the Lefschetz decomposition.
  There is a canonical extension description on the whole component. In a Deligne frame at a crossing $z_1 dots.h.c z_a = 0$, with $D' = \( z_1 = 0 \)$, the transverse residue is the constant nilpotent $N_1$ and the remaining residues $N_2 \, dots.h \, N_a$ commute with it. The filtration $W \( N_1 \)$ therefore consists of subbundles of the restricted extended flat bundle. Every remaining residue preserves this filtration and induces a nilpotent operator on each weight grade. Changing the normal coordinate or the tangential lift changes the tangential connection by a multiple of $N_1$; this acts trivially on the weight grades. Their flat connections are thus well defined. The remaining logarithmic exponentials are exactly the Deligne extensions of these flat graded variations. Separately, each polarized pure graded variation has its Schmid-extended Hodge subbundles inside that canonical flat bundle. We do not identify a possibly jumping intersection with a weight step with an extended Hodge subbundle. Instead we use the independent Hodge extension, and below map into it by continuation from the open stratum. This distinction proves the needed comparison also at crossings.
  On the stratum, $L_H \|_(D')$ lies in $W_(w + k)$ and maps nontrivially to its highest graded line. Inclusion in the subbundle $W_(w + k)$ extends everywhere because it holds generically. Projection to $"Gr"_(w + k)^W$ is regular. The highest line of the graded variation extends as its independent Schmid Hodge subbundle. The projection lands in it: its image in the locally free quotient of the canonical flat graded bundle vanishes on the dense open stratum and hence vanishes everywhere. The resulting map can have zeros at further boundary strata; these produce an effective difference in the direction needed below. If necessary resolve the additional algebraic filtration-rank loci on $D'$. The loops newly omitted from the interior have trivial monodromy, and all boundary monodromies remain unipotent; the preceding description is preserved on this resolution. We obtain a generically nonzero morphism of line bundles
  #[#set math.equation(numbering: n => "(5.10)")
   $ L_H \|_(D') arrow.r L_(H \, "Gr") \, #h(2em) L_(H \, "Gr") - L_H \|_(D') med upright("effective") . $ <eq:boundary-line-comparison>]
  Here and below restriction notation includes the pullback to that resolution when one was needed.
  Both sides of (5.10) are nef. For the right side this follows from the pure highest-line metric and 14; for the left side it follows by restricting the original nef line. Tensor the comparison by $e_Q$ and add the same compact-mark line on $D'$. If $P \, Q$ are the resulting nef lines, then $Q - P$ is effective, and for an ample $A$ on this $\( n - 1 \)$-dimensional variety,
  $ \( Q^k - P^k \) A^(n - 1 - k) = \( Q - P \) sum_(a = 0)^(k - 1) Q^(k - 1 - a) P^a A^(n - 1 - k) gt.eq 0 . $
  Thus $nu \( P \) lt.eq nu \( Q \)$. The metric lemma and (5.9) now give
  $ nu \( cal(H)_H \|_(D') \) < d_H . $
  Adding $cal(H)_Q \|_(D')$, whose numerical dimension is at most $s_Q$, proves the desired strict drop upstairs.
  #emph[Finite nonidentity local monodromy.] Let $gamma eq.not 1$ denote the original monodromy. On the unipotent level its logarithm is zero, so the pure period extends ordinarily across a general point of $D'$. Its limiting flags and compact marks are fixed by $gamma$. Indeed, the local cover is $t = z^e$; the continuation around $t = 0$ acts on its sheets by $z mapsto e^(2 pi sqrt(- 1) \/ e) z$. Equivariance of the extended period and marks then gives the fixed-point assertion at $z = 0$ in common flat frames. The comparison in (5.10), now with a pure ordinary limit, shows that the numerical dimension on $D'$ is bounded by the differential rank of these limiting marks. That rank is at most $r$: in the ordinary extending flat frame, all $\( r + 1 \)$-minors of the mark differential vanish on the interior and hence on its extension, including after restriction to $D'$.
  Suppose that rank were $r = d_H + s_Q$. Since $D'$ dominates $S_Q$, the limiting $Q$ data comes from the interior of $S_Q$. In particular $d j_Q$ on $D'$ has rank $s_Q$ and kernel $ker \( d q \|_(D') \)$. Equality of the total rank forces the $H$ flags along a local general fiber of $q \|_(D')$ to fill an open subset of $J_H$. The $Q$ flags are fixed on this fiber.
  The rational automorphism $gamma$ normalizes the connected group, and acts on the product $J$ factorwise up to permutation of simple factors. An open subset with all $H$ flag coordinates varying independently cannot be fixed if any visible $H$ coordinate is moved to a different coordinate. If the destination were a $Q$ coordinate it would be constant; if it were another $H$ coordinate the fixed-point equations would impose a relation between two independent coordinates. Thus every visible complex $H$ factor is preserved and $gamma$ acts identically on its whole flag variety. Equivariance and faithfulness of the simple adjoint action imply identity on its Lie algebra. Rationality then implies identity on every Galois-conjugate complex factor, hence on all of $H$. Consequently $gamma$ preserves $Q$. Its action on $Q$ fixes a generic lifted full $Q$ period, because $D'$ dominates $S_Q$. 12 gives identity on $Q$ also, a contradiction. The limiting rank is strictly less than $r$ in this case as well.
  Pullback by the generically finite map $D' arrow.r D_i$ preserves the numerical dimension of a nef line, so the strict drop descends to $D_i$. Finally, if $r = 0$, a local fiber of $j$ is open in the base, so its Zariski closure is the entire base and $H = G$. Orbit filling gives $dim J = 0$. Visibility on every retained rational factor forces $G = 1$; the full projected adjoint action then has no nonidentity boundary monodromy. Thus $D_0$ is empty. ◻
]

=== 5.4 Removing the marked boundary <removing-the-marked-boundary>

#prodef([Lemma 5.4.])[
  (Section estimate).  #emph[Let $M$ be a smooth projective $n$-fold, let $H$ be a nef rational line, and let $T = sum_i T_i$ be a reduced divisor with smooth components. Suppose $r = nu \( H \) > 0$ and $nu \( H \|_(T_i) \) < r$ for every $i$. If $A$ is ample and $e > 0$ is an integer, then 
$ A + t H - e T $

 is big for all sufficiently large divisible integers $t$.]
] <lem:boundary-remove>

#proof[
  Choose fixed ample integral lines $A_i$ on $T_i$ sufficiently positive that all successive restriction terms obtained while imposing order $l e$ along each $T_j$ inject into
  $ H^0 #scale(x: 120%, y: 120%)[\(] T_i \, l \( A \|_(T_i) + t H \|_(T_i) + A_i \) #scale(x: 120%, y: 120%)[\)] . $
  This choice is uniform in $l$ and $t$. Explicitly, choose ample $C_(i j)$ so that $C_(i j)$ and $C_(i j) + T_j \|_(T_i)$ have nonzero sections, and put $A_i = e sum_j C_(i j)$, enlarging it if needed. For $0 lt.eq n_j lt.eq e l$ the line
  $ l A_i + sum_j n_j T_j \|_(T_i) = sum_j #scale(x: 120%, y: 120%)[\(] \( e l - n_j \) C_(i j) + n_j \( C_(i j) + T_j \|_(T_i) \) #scale(x: 120%, y: 120%)[\)] $
  has a nonzero section. Multiplication by it supplies exactly the asserted injections, including the normal twists when $j = i$.
  The restriction exact sequences, applied one copy of a component at a time, give
  $ h^0 #scale(x: 120%, y: 120%)[\(] M \, l \( A + t H - e T \) #scale(x: 120%, y: 120%)[\)] & gt.eq h^0 #scale(x: 120%, y: 120%)[\(] M \, l \( A + t H \) #scale(x: 120%, y: 120%)[\)]\
 & quad - l e sum_i h^0 #scale(x: 120%, y: 120%)[\(] T_i \, l \( A \|_(T_i) + t H \|_(T_i) + A_i \) #scale(x: 120%, y: 120%)[\)] . $
  For each fixed divisible $t$, all the positive lines in this formula are ample. Their Hilbert polynomials give, in the coefficient of $l^n$, a positive supply
  $ frac(\( A + t H \)^n, n !) $
  and a loss at most
  $ frac(e, \( n - 1 \) !) sum_i \( A \|_(T_i) + A_i + t H \|_(T_i) \)^(n - 1) . $
  The supply is a polynomial in $t$ of degree exactly $r$ with positive leading coefficient. Each term in the loss has degree at most $r - 1$. For $n = 1$ the restriction terms are simply section dimensions on points and the same statement holds. Choose $t$ sufficiently large that the difference of these leading coefficients is positive, and then let $l arrow.r oo$. This proves bigness. No asymptotic estimate uniform in both $l$ and $t$ is used. ◻
]

#prodef([Proposition 5.5.])[
  (Adjoint bigness).  #emph[If $dim S > 0$, then $K_S + b cal(H)$ is big for all sufficiently large rational $b$.]
] <prop:adjoint-bigness>

#proof[
  By 16, $K_S + D_0 + c cal(H)_(upright(u))$ is big for sufficiently large $c$. Since $cal(H) - cal(H)_(upright(u))$ is nef, $K_S + D_0 + c cal(H)$ is big. Choose an integer $e > 0$ clearing denominators and an ample integral $A$ with
  $ e \( K_S + c cal(H) + D_0 \) - A $
  effective. Proposition 5.3, Lemma 5.4 show that $A + t cal(H) - e D_0$ is big for large divisible $t$. Adding the displayed effective divisor proves bigness of $e K_S + \( e c + t \) cal(H)$. When $nu \( cal(H) \) = 0$, 19 says $D_0 = 0$, and the initial bigness already gives the conclusion. Finally the sum of a big line and a nef line is big, so every larger rational $b$ works as well. ◻
]

We have proved adjoint bigness on the parameter space. To use it for a chosen vector, we need a nef line generated by its Higgs images whose numerical dimension does not increase on adding the marked line. The next proposition supplies this second input to the removal of the period twist in 7.

=== 5.5 The rank of the Higgs-tail line <the-rank-of-the-higgs-tail-line>

#prodef([Proposition 5.6.])[
  (Higgs tails).  #emph[Let $h : W arrow.r S$ be any dominant morphism of smooth connected projective varieties with connected generic fiber. On a dense algebraic open of $W$, suppose that $ell subset h^(*) E_0$ is an algebraic line subbundle. Require that the pointwise instability-parabolic construction of 11, applied to $ell$, gives exactly the pulled-back compact marks $h^(*) j_(upright(u))$. This compatibility is part of the hypothesis.]
  #emph[Take a smooth connected unipotent level $pi : hat(W) arrow.r W$ dominating the level used to define $cal(H)$, and resolve its boundary and the generated subspace maps. Over the variation locus, let $G_i$ be the span of all contractions of $theta^i \( ell \)$ in $pi^(*) h^(*) "Gr"_F^(p_(*) - i) bb(A)$, with $G_0 = ell$. Use the resulting subbundles of the extended Hodge grades on $hat(W)$. Put 
#[#set math.equation(numbering: n => "(5.11)")
 $ U_j = xor.big_(i gt.eq j) G_i \, #h(2em) P = - sum_(j gt.eq 0) det U_j = - sum_(i gt.eq 0) \( i + 1 \) det G_i . $ <eq:tail-line-definition>]

 Only finitely many summands are nonzero. Then $P$ is nef and 
#[#set math.equation(numbering: n => "(5.12)")
 $ nu #scale(x: 120%, y: 120%)[\(] P + pi^(*) h^(*) cal(H) #scale(x: 120%, y: 120%)[\)] = nu \( P \) . $ <eq:tail-rank-equality>]

 The assertion applies to every such $h$ and every such compatible line; $ell$ need not be the original vector used to construct $S$.]
] <prop:tail-rank>

The curvature argument will show that a null direction for $P$ fixes the chosen line and its compact marks. Passing from that line to the whole highest Hodge space requires the following representation lemma. We state it here, use it in the proof of the proposition, and give its root-theoretic proof afterward.

#prodef([Lemma 5.7.])[
  (Degree-one roots).  #emph[Let $frak(g) = xor.big_k frak(g)_k$ be a complex semisimple Lie algebra with an integral grading and an adjoint operation $*$ carrying $frak(g)_k$ to $frak(g)_(- k)$, arising from a compatible compact form. Let $frak(h)$ be a graded ideal stable under $*$, and let $V$ be an irreducible finite-dimensional representation with compatible grading and highest graded piece $E$. The metric on $V$ is chosen so that representation adjoints are the actions of Lie adjoints. For $0 eq.not s in E$ and $x in frak(h)_1$, suppose 
#[#set math.equation(numbering: n => "(5.13)")
 $ \[ x \, frak(h)_(- 1) \] s = 0 . $ <eq:root-annihilation-hypothesis>]

 Then $x^(*) E = 0$.]
] <lem:degree-one-root>

#proof[
  The connected-fiber hypothesis ensures that, after shrinking to a smooth locally trivial locus, the monodromy image of the pullback is the same as that on $S$. Passing to its connected level therefore leaves Zariski-dense monodromy $G$. The variation and the orbit calculation of 18 apply on $hat(W)$.
  Each $U_j$ is Higgs invariant because $theta G_i subset.eq G_(i + 1) ⊗ Omega^1$; this follows from Higgs integrability and the definition by all contractions. On the open locus the Hodge decomposition is orthogonal. Write $cal(D)$ for its Chern connection. For a tangent vector $v$ put $A = theta \( v \)$, let $Pi_j$ be orthogonal projection onto $U_j$, and set
  $ B_j \( v \) = \( 1 - Pi_j \) cal(D)'_v \|_(U_j) . $
  The Hodge curvature equation and the subbundle curvature formula give, in a common positive normalization,
  #[#set math.equation(numbering: n => "(5.14)")
   $ Theta_(- det U_j) \( v \, macron(v) \) = parallel \( 1 - Pi_j \) A^(*) \|_(U_j) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 + parallel B_j \( v \) parallel_(upright("HS"))^2 . $ <eq:tail-curvature>]
  To see the sign directly, use $A U_j subset.eq U_j$ and write $A$ in upper block-triangular form for $U_j xor U_j^perp$. The traces of the two internal products cancel. The remaining trace is minus the square of the off-diagonal block of $A^(*) \|_(U_j)$ for $det U_j$, and subbundle curvature subtracts the square of $B_j \( v \)$. Negating the determinant gives (5.14).
  The metrics on the extended subbundles have the two-sided logarithmic norm estimates needed in 14. Indeed they are restrictions of the extended Hodge metrics; after resolution their frames have full rank in the extended Hodge grades, so the dual estimates also restrict. Thus every $- det U_j$, and hence $P$, is nef.
  Suppose now that $Theta_P \( v \, macron(v) \) = 0$. Every nonnegative summand in (5.14) vanishes. Applying its first term for $U_i$ to $G_i$, the vector $A^(*) G_i$ belongs to the preceding Hodge grade, which is orthogonal to $U_i$. Hence
  #[#set math.equation(numbering: n => "(5.15)")
   $ A^(*) G_i = 0 quad upright("for every ") i . $ <eq:tail-zero-actions>]
  Since $A G_i subset.eq G_(i + 1)$, for $g in G_i$ one then has $parallel A g parallel^2 = chevron.l g \, A^(*) A g chevron.r = 0$. Thus $A G_i = 0$ as well. Moreover $B_0 \( v \) = 0$ and $cal(D)'$ preserves the Hodge grading, so $cal(D)'_v$ preserves $G_0 = ell$. The flat connection satisfies $nabla^(1 \, 0) = cal(D)' + theta$ in the smooth Hodge splitting. Its projective derivative on $ell$ is consequently zero. In other words,
  #[#set math.equation(numbering: n => "(5.16)")
   $ v in ker d ell . $ <eq:tail-null-line>]
  The compact marks, which by hypothesis are the same pointwise functions of $ell$ as before, are constant on a local $ell$-fiber. At its constant-rank points (5.16) also gives $d j_(upright(u)) \( v \) = 0$.
  It remains to prove $d E_0 \( v \) = 0$. Apply the line version of 18 to a local $ell$-fiber $T$, with Zariski closure $Z$ and decomposition $G = H times Q$. Work at one of the smooth generic points $z$ supplied by that lemma. The preceding calculation places every $v in ker Theta_(P \, z)$ in $T_z T$; fix this same $T$, $Z$, and $H$ for all such vectors. The full $Q$ period is constant on $Z$. Hence the infinitesimal period element of every such $v$ satisfies
  $ t \( v \) in frak(h)^(- 1 \, 1) . $
  Write $ell_z = bb(C) s$. Evaluating the tangent map of $ell$ at $s$ and projecting to the next Hodge grade sends $d ell \( T_z Z \)$ into $G_1$: its flat derivative is $cal(D)'_w s + theta \( w \) s$, and only the second term contributes to that grade. Orbit filling in (5.4) therefore gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ frak(h)^(- 1 \, 1) s subset.eq G_1 . $ <eq:tail-orbit-action>]
  Use the metric supplied by the adjoint tensor construction, so that representation adjoints agree with Lie adjoints. Set $x = t \( v \)^(*)$. By (5.15), $x G_1 = 0$. Also $x s = 0$ because $s$ is in the highest Hodge grade and $x$ raises that grade. It follows from (5.17) that
  $ \[ x \, frak(h)^(- 1 \, 1) \] s = 0 . $
  23, with $frak(g)_k = frak(g)^(k \, - k)$, gives $t \( v \) E_0 = 0$. The flat-chart differential of the whole highest step is precisely Higgs evaluation on $E_0$, so $d E_0 \( v \) = 0$.
  We have proved, at the points where the orbit calculation applies, the kernel inclusion
  #[#set math.equation(numbering: n => "(5.18)")
   $ ker Theta_P subset.eq ker Theta_(pi^(*) h^(*) cal(H)) . $ <eq:tail-kernel-inclusion>]
  For completeness, these points can be chosen to compute the global curvature ranks. The Hodge metrics and subspace data are real analytic on the variation locus. Choose the initial point in the open maximum-rank loci of $Theta_P$ and $Theta_P + Theta_(pi^(*) h^(*) cal(H))$, as well as the finitely many relevant period, flag, and projective-line rank loci and the Hodge-generic locus. Moving slightly within its $ell$-fiber reaches the smooth Zariski-open locus of $Z$ required by 18, while staying in the two curvature-rank opens. Indeed an open subgerm of that fiber is Zariski dense in $Z$. The argument then establishes (5.18) at a point where both curvature ranks are maximal. Semipositivity implies equality of those ranks. Apply 14 to $P$ and $P + pi^(*) h^(*) cal(H)$ to obtain (5.12). ◻
]

#proof[
  Choose a Cartan in the compact form adapted to the grading, and choose positive roots so that each simple root has nonnegative degree. Metric adjoints exchange opposite root spaces. Let $Delta_0$ be the degree-zero simple roots, and let $v_lambda$ be a highest-weight vector for $V$. Write $frak(g)_0^(-)$ for the sum of the negative root spaces of degree zero. The highest graded piece is
  #[#set math.equation(numbering: n => "(5.19)")
   $ E = U \( frak(g)_0^(-) \) v_lambda . $ <eq:root-top-module>]
  In particular it is irreducible for the full degree-zero reductive algebra. Indeed, reaching the extremal grading from the highest weight allows only degree-zero lowerings; the highest-weight theory for that Levi algebra then gives (5.19).
  Every degree-one positive root contains exactly one degree-one simple root $alpha$, with coefficient one, and otherwise only simple roots of degree zero. Let $frak(b)_alpha^(+)$ be the sum of its root spaces and $frak(b)_alpha^(-)$ the sum of the opposite root spaces. These are $frak(g)_0$-modules, and $*$ exchanges them. Roots of degree one in $frak(h)$ are exactly the blocks belonging to its simple factors. For $alpha eq.not beta$,
  #[#set math.equation(numbering: n => "(5.20)")
   $ \[ frak(b)_alpha^(+) \, frak(b)_beta^(-) \] = 0 . $ <eq:root-cross-bracket>]
  Indeed, the difference of the relevant roots has a positive coefficient at $alpha$ and a negative one at $beta$, and hence is neither a root nor zero.
  Write $x = sum_alpha x_alpha$ using these blocks in $frak(h)_1$. For every nonzero $x_alpha$, (5.13) and (5.20) imply $\[ x_alpha \, frak(b)_alpha^(-) \] s = 0$. Hence the incidence
  $ I_alpha = {\( \[ z \] \, \[ u \] \) in upright(bold(P)) \( frak(b)_alpha^(+) \) times upright(bold(P)) \( E \) : \[ z \, y \] u = 0 upright(" for every ") y in frak(b)_alpha^(-)} $
  is nonempty, closed, and projective. It is stable under the full connected degree-zero group. Apply the Borel fixed-point theorem to the Borel of this group determined by the chosen positive roots and containing the full Cartan. The theorem used here says that a connected solvable algebraic group acting on a nonempty complete variety has a fixed point #cite(label("Milne")) Corollary 17.3. A fixed pair in $I_alpha$ has the form $\( \[ e_rho \] \, \[ v_lambda \] \)$: the first coordinate is a root line since the full Cartan acts, and the second is the unique highest line of the irreducible degree-zero module $E$. Irreducibility of $frak(b)_alpha^(+)$ is not required.
  Let $C_alpha$ be the connected component containing $alpha$ in the Dynkin subdiagram on $Delta_0 union { alpha }$. Connectedness of root support gives $"Supp" \( rho \) subset.eq C_alpha$. If the inclusion were strict, there would be a missing zero-degree node $delta$ adjacent to the support. Its coefficient in $rho$ is zero, while some adjacent support coefficient is positive, so $chevron.l rho \, delta^or chevron.r < 0$. The root-string property implies that $rho + delta$ is a root. Thus $e_delta$ does not preserve the line $bb(C) e_rho$, contrary to the Borel-fixed condition. Therefore
  $ "Supp" \( rho \) = C_alpha . $
  Taking $y = e_(- rho)$ in the incidence equation gives $chevron.l lambda \, rho^or chevron.r = 0$. The simple-coroot expansion of $rho^or$ has strictly positive coefficients on its support. Dominance of $lambda$ therefore gives $chevron.l lambda \, delta^or chevron.r = 0$ for every $delta in C_alpha$. Every root indexing $frak(b)_alpha^(+)$ has support in $C_alpha$, so its coroot also pairs trivially with $lambda$. Finite-dimensional root $frak(s l)_2$ theory implies that every vector in $frak(b)_alpha^(-)$ kills $v_lambda$. Since $frak(b)_alpha^(-)$ is a $frak(g)_0$-module, commuting it past the degree-zero lowerings in (5.19) shows that it kills all of $E$. These root-string and highest-weight facts are the usual semisimple representation theory; see #cite(label("Humphreys")) §§9–10,20–21. Finally $x_alpha^(*) in frak(b)_alpha^(-)$ for every nonzero component, and summing proves $x^(*) E = 0$. ◻
]

== 6 The relative Iitaka base and its section lattice <sec:relative-iitaka>

Our goal is to construct an intermediate base $W$ over the marked-period quotient $S$ and a divisor on $W$ whose complete divisible section spaces are those of the original logarithmic base. The rank-one generator on the generic Iitaka fiber will give this exact comparison.

The coefficient estimates are now available, as are the marked quotient and both of its positivity comparisons. We will first obtain a nonzero logarithmic form on the generic period fiber. Only after this nonnegativity has been established will we form its relative Iitaka fibration.

We use the marked quotient of 7. Resolve its compactification and the rational quotient map, obtaining a morphism $q : Y_0 arrow.r S$ of smooth projective varieties. Its geometric generic fiber is connected. Every source model used below is resolved together with its reduced boundary, so that the strict transform of the preceding boundary plus all reduced exceptional divisors is SNC. A higher source model always means such a log resolution. We keep the subscript $0$ for a fixed such source model and denote its reduced log boundary by $D_(Y_0)$; subsequent models are denoted by $Y$. In this section $E_0$ denotes the highest Hodge bundle of the descended tensor system on a dense open subset of $S$. The homogeneous vector of degree $a > 0$ is viewed as a rational tensor

$ u_(*) in a K_(Y_0) ⊗ q^(*) E_0 \, $

with the logarithmic pole and higher-model properties of 4. This notation for a rational tensor allows the poles prescribed by $a D_(Y_0)$.

We first record why these source modifications preserve the spaces of logarithmic pluriforms. If $p : Y' arrow.r Y_0$ is a log resolution and $D'$ is strict transform plus reduced exceptional divisor, then

#[#set math.equation(numbering: n => "(6.1)")
 $ K_(Y') + D' = p^(*) \( K_(Y_0) + D_(Y_0) \) + R_p \, #h(2em) R_p gt.eq 0 quad upright("and") quad p_(*) R_p = 0 . $ <eq:iitaka-log-discrepancy>]

For a blowup of a smooth center of codimension $c$ contained in $e$ boundary branches, the new coefficient in $R_p$ is $c - e gt.eq 0$. For a general log resolution the formula follows from the log canonical discrepancy inequality for the log smooth pair: each exceptional coefficient is one plus its discrepancy and is therefore nonnegative. A rational section of a line bundle on the smooth variety $Y_0$ is regular if it has no pole at any prime divisor. Consequently an effective exceptional divisor introduces no new rational sections, and, for every $l gt.eq 0$,

#[#set math.equation(numbering: n => "(6.2)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] Y' \, l \( K_(Y') + D' \) #scale(x: 120%, y: 120%)[\)] = H^0 #scale(x: 120%, y: 120%)[\(] Y_0 \, l \( K_(Y_0) + D_(Y_0) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:iitaka-log-sections>]

These are identifications of rational pluriforms and therefore preserve their ratios. The same argument applies over the generic point of a base.

=== 6.1 Constructing the relative Iitaka fibration <constructing-the-relative-iitaka-fibration>

Over the generic point of $S$, a nonzero scalar coordinate of $u_(*)$ will supply a logarithmic pluriform. The relative Iitaka map then separates its section ratios, following the classical relative construction of #cite(label("Iitaka1971")) §6, Remark 1. On its generic fiber the nonzero degree-$a$ section space has rank one, so a single generator factors the entire vector. The exact comparison with the original source’s complete section spaces will require the valuation argument that follows this construction.

#prodef([Lemma 6.1.])[
  (The relative Iitaka diagram).  #emph[For $q : \( Y_0 \, D_(Y_0) \) arrow.r S$ and $u_(*)$ as above, there are smooth projective varieties $Y \, W$, a birational morphism $p : Y arrow.r Y_0$, and morphisms $x : Y arrow.r W$ and $h : W arrow.r S$ with geometrically connected generic fibers, such that $h compose x = q compose p$. Put $D = p_(*)^(- 1) D_(Y_0) + "Exc" \( p \)_(upright("red"))$ and $k = kappa \( Y_(0 \, eta_S) \, K_(Y_(0 \, eta_S)) + D_(Y_0 \, eta_S) \)$. Then $k gt.eq 0$, $dim W - dim S = k$, and the geometric generic fiber of $x$ has logarithmic Iitaka dimension zero. Write $J = Y_(eta_W)$ for its generic fiber over $bb(C) \( W \)$.]
  #emph[The degree $a$ used for $u_(*)$ itself has a nonzero generator $omega in H^0 \( J \, a \( K_J + D_J \) \)$. There is a rational tensor $u_W in a K_W ⊗ h^(*) E_0$ for which 
#[#set math.equation(numbering: n => "(6.3)")
 $ u_(*) = omega thin x^(*) u_W . $ <eq:iitaka-vector-factorization>]

]
] <lem:relative-iitaka-construction>

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$Y$])
  content((2.189, 0), [$W$])
  content((4.247, 0), [$S$])
  content((0, -1.585), [$Y_0$])
  line((0.336, 0), (1.853, 0), mark: (end: ">"))
  content((1.095, 0.2266), [#text(size: 0.73em)[$x$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3223, -0.7927), [#text(size: 0.73em)[$p$]])
  line((2.525, 0), (3.911, 0), mark: (end: ">"))
  content((3.218, 0.2266), [#text(size: 0.73em)[$h$]])
  bezier((0.4108, -1.432), (3.952, -0.1101), (1.878, -1.291), (2.751, -0.9655), mark: (end: ">"))
  content((2.175, -0.7553), [#text(size: 0.73em)[$q$]])
})],
  caption: [Figure 1: The relative logarithmic Iitaka diagram over the marked-period quotient $S$, with $p$ birational. The generic $x$-fiber $J$ has $kappa \( J \, K_J + D_J \) = 0$; its degree-$a$ generator $omega$ gives $u_(*) = omega x^(*) u_W$. The generic $h$-fiber has dimension $k = kappa \( Y_(0 \, eta_S) \, K_(Y_(0 \, eta_S)) + D_(Y_0 \, eta_S) \)$. ],
) <fig:intermediate-base>

#proof[
  Over the generic point of $S$ the coefficient bundle of $u_(*)$ is constant. At any divisor horizontal over $S$, its lattice is the ordinary pullback lattice from the interior of $S$. The bounds of 4 consequently give regular logarithmic coefficients on $Y_(0 \, eta_S)$. If the bounds were verified after ramification, regularity descends: the order of a pulled-back ordinary coefficient is the ramification index times its original order. Choosing a basis of $\( E_0 \)_(eta_S)$ and trivializing the base canonical line therefore gives a nonzero element of
  $ H^0 #scale(x: 120%, y: 120%)[\(] Y_(0 \, eta_S) \, a \( K_(Y_(0 \, eta_S)) + D_(Y_0 \, eta_S) \) #scale(x: 120%, y: 120%)[\)] ⊗_(bb(C) \( S \)) \( E_0 \)_(eta_S) . $
  At least one scalar component is nonzero, proving $k gt.eq 0$.
  Work temporarily over $K = bb(C) \( S \)$. Choose a complete logarithmic pluricanonical system whose image has dimension $k$, and resolve its base ideal. If its degree is $b$, its morphism $phi.alt : Z arrow.r Z_b$ satisfies
  #[#set math.equation(numbering: n => "(6.4)")
   $ b \( K_Z + D_Z \) tilde.op phi.alt^(*) H + F_b \, #h(2em) F_b gt.eq 0 \, $ <eq:iitaka-movable-system>]
  where $H$ is the hyperplane divisor on its projective image. The extra logarithmic discrepancy in a source resolution is effective, so the indicated inequality remains valid after further resolution. Take the Stein factor of $phi.alt$, resolve it and the source, and spread the resulting diagram over a dense open subset of $S$. Compactification and resolution give $Y arrow.r^x W arrow.r^h S$. The field $bb(C) \( W \)$ is the relative algebraic closure of the system-image field in $bb(C) \( Y \)$; in particular it is algebraically closed in $bb(C) \( Y \)$. Since $bb(C) \( S \)$ is algebraically closed in $bb(C) \( Y \)$, it is also algebraically closed in $bb(C) \( W \)$. In characteristic zero these facts give geometrically connected generic fibers for both maps.
  Here is the section-ratio argument for $kappa \( J \, K_J + D_J \) = 0$. The restriction of $u_(*)$ still gives a nonzero section in degree $a$, exactly as above. Suppose two independent logarithmic pluriforms existed on $J$ in some common degree $c$. Their ratio $r$ would not lie in $bb(C) \( W \)$, and would be transcendental over that field, by its relative algebraic closure. Spread the two sections to rational sections of $c \( K_Z + D_Z \)$, trivializing the canonical directions from the base rationally. Their pole divisors are vertical over $W_(eta_S)$. There are finitely many such prime divisors; the images of all of them in $Z_b$ are proper, since $W_(eta_S) arrow.r Z_b$ is generically finite. Hypersurfaces on $Z_b$ containing these images, with sufficient multiplicity, give a section of some $n H$ whose pullback cancels all their poles. Multiply also by the effective section of $n F_b$ in (6.4). The two resulting sections belong to $H^0 \( Z \, \( c + n b \) \( K_Z + D_Z \) \)$ and retain ratio $r$. Together with the $k$ independent ratios of the original system, they give $k + 1$ independent ratios of logarithmic pluriforms. All finitely many ratios can be placed in one degree by multiplying numerators and denominators by the other denominators. This contradicts the definition of $k$.
  The same conclusion holds for the geometric generic fiber. In every fixed degree, proper cohomology in degree zero commutes with field extension; two sections over an algebraic closure would therefore already give section-space dimension at least two over $bb(C) \( W \)$. Adjunction and generic smoothness identify the fiber line with $K_J + D_J$, and (6.2) justifies all the log source replacements. This proves the claimed geometric Iitaka dimension without an abundance assumption.
  The degree-$a$ space on $J$ is now one-dimensional and nonzero. Choose its generator $omega$ and extend it as a rational relative canonical tensor. Divide the vector $u_(*)$ by it on the generic fiber. Its scalar coefficients are in $bb(C) \( W \)$, so they define $u_W$ and prove (6.3) in the stated degree $a$. The Higgs operator is $cal(O)$-linear; thus its iterates satisfy the same factorization under differential pullback. There is no derivative of $omega$ in this assertion. In particular the projective direction $\[ u_W \]$ gives precisely the same compact flags as $\[ u_(*) \]$ at general corresponding points. ◻
]

=== 6.2 The exact section lattice <the-exact-section-lattice>

The factorization has so far been obtained over the function field. To recover the complete logarithmic section spaces on $Y_0$, we must determine which rational tensors on $W$ multiply by powers of $omega$ to become regular on the source. We must test divisors on the fixed original source even when their images have codimension at least two on a temporary base. The next lemma extracts precisely those finitely many base valuations; subsequent source modifications add no new sections.

#prodef([Lemma 6.2.])[
  (Extraction of the source valuations).  #emph[Let $x_1 : Y_1 arrow.r W_1$ be a dominant projective morphism of smooth projective varieties with geometrically connected generic fiber, and fix a reduced simple-normal-crossing divisor $D_1$ on $Y_1$. Write $J = Y_(1 \, eta_(W_1))$, and suppose that its geometric logarithmic Iitaka dimension is zero. Choose, over $bb(C) \( W_1 \)$, 
$ 0 eq.not omega in H^0 #scale(x: 120%, y: 120%)[\(] J \, a \( K_J + D_J \) #scale(x: 120%, y: 120%)[\)] $

 for some $a > 0$. Regard $omega$ as a rational section of $a K_(Y_1 \/ W_1)$. There is a smooth projective modification of $W_1$ with the following property. On any further smooth base model $W$, take a smooth resolution $p : Y arrow.r Y_1$ of the main component, with $x : Y arrow.r W$, and set $D = p_(*)^(- 1) D_1 + "Exc" \( p \)_(upright("red"))$. For a prime $A subset W$, put 
#[#set math.equation(numbering: n => "(6.5)")
 $ t_A & = min_(I thin mapsto thin A) frac(a^(- 1) "ord"_I \( omega \) + d_I, m_I) \,\
m_I & = "ord"_I \( x^(*) A \) \, #h(2em) d_I = "coeff"_I D \,\
T_W & = sum_A t_A A \, #h(2em) L_W = K_W + T_W . $ <eq:iitaka-minimum>]

 Here $I$ runs through prime divisors dominating $A$, and the order of $omega$ is its order as a section of $a \( K_Y - x^(*) K_W \)$. The sum defining $T_W$ is finite. For every sufficiently divisible $l > 0$, multiplication gives an isomorphism 
#[#set math.equation(numbering: n => "(6.6)")
 $ H^0 \( W \, l L_W \) & arrow.r^(med tilde.eq med) H^0 #scale(x: 120%, y: 120%)[\(] Y_1 \, l \( K_(Y_1) + D_1 \) #scale(x: 120%, y: 120%)[\)] \,\
sigma & mapsto omega^(l \/ a) x^(*) sigma . $ <eq:iitaka-exact-sections>]

 The right side is interpreted on the fixed model $Y_1$, by rational identification. The isomorphisms respect multiplication in a common Veronese subring and preserve ratios.]
] <lem:valuation-preparation>

#proof[
  Write $n = dim Y_1$, $w = dim W_1$, and $r = n - w$. We explain the valuation assertion needed for the modification. Let $I_1$ be a prime of $Y_1$ whose image has codimension at least two in $W_1$, and let $v = "ord"_(I_1)$. Its restriction to $bb(C) \( W_1 \)$ is nontrivial: a local function vanishing on the image has positive order at $I_1$. The nonzero value subgroup is $m bb(Z)$ for an integer $m > 0$. Let $v_0$ be the normalized restricted valuation and let $kappa \( v \)$ and $kappa \( v_0 \)$ denote their residue fields.
  Residues algebraically independent over $kappa \( v_0 \)$ lift to elements algebraically independent over $bb(C) \( W_1 \)$. Indeed, in a proposed polynomial relation among lifts of value zero, divide all coefficients by a coefficient of smallest valuation. Reduction then gives a nonzero polynomial relation among their residues. It follows that
  $ "trdeg"_(kappa \( v_0 \)) kappa \( v \) lt.eq r \, #h(2em) "trdeg"_(bb(C)) kappa \( v_0 \) gt.eq \( n - 1 \) - r = w - 1 . $
  The reverse inequality is elementary: lifts of independent residues, together with one element of positive valuation, are algebraically independent over $bb(C)$, by examining the term of smallest valuation in a polynomial relation. Thus the residue transcendence degree is exactly $w - 1$.
  Choose $w - 1$ such independent residues and rational-function lifts on $W_1$. Resolve the graph of their map to $\( upright(bold(P))^1 \)^(w - 1)$. The center of $v_0$ on this proper model has dimension at least $w - 1$, since its image contains the generic point of the product; it is proper since the valuation is nontrivial. It is therefore a prime divisor. Resolving further makes the base smooth and does not contract that center. This proves that the restriction of $v$ is a positive integral multiple of a divisorial valuation of the base.
  Only finitely many primes $I_1$ need this treatment. Such a prime lies in the locus where the local fiber dimension of $x_1$ is at least $r + 1$. This is a proper closed subset of $Y_1$, and a prime divisor contained in it must be one of its finitely many divisorial components. Extract all the restricted valuations simultaneously. After any further base modification their centers are still divisors. On a compatible source resolution, the strict transform of each $I_1$ survives and dominates its extracted center. Every prime on the fixed model $Y_1$ now either dominates the base or has strict transform dominating a base prime.
  There are finitely many divisors in $"div"_(a K_(Y \/ W)) \( omega \) + a D$. Outside the images of their vertical components, all the numerators in (6.5) vanish. This proves finiteness of $T_W$. For a nonzero section $s$ on the right of (6.6), pullback and (6.1) first make $s$ a logarithmic pluriform on $\( Y \, D \)$. If $a divides l$, the section space on $J$ in degree $l$ is exactly the line generated by $omega^(l \/ a)$: it contains that element, and two independent sections would have a nonconstant ratio, contradicting $kappa \( J \, K_J + D_J \) = 0$. Hence, at the function-field level, there is a unique rational $l$-canonical tensor $sigma$ on $W$ such that $s = omega^(l \/ a) x^(*) sigma$.
  Fix a base prime $A$, take a regular local frame of $l K_W$ at its generic point, and let $c$ be the coefficient of $sigma$ in that frame. For every $I$ dominating $A$, regularity of $s$ says
  #[#set math.equation(numbering: n => "(6.7)")
   $ m_I "ord"_A \( c \) + l / a "ord"_I \( omega \) + l d_I gt.eq 0 . $ <eq:iitaka-order-test>]
  These inequalities are equivalent to $"ord"_A \( c \) + l t_A gt.eq 0$. After clearing denominators, they say precisely that $sigma in H^0 \( W \, l L_W \)$.
  Conversely, suppose $sigma in H^0 \( W \, l L_W \)$, and form the rational pluriform $s = omega^(l \/ a) x^(*) sigma$. A horizontal prime of the fixed source $Y_1$ satisfies the logarithmic regularity test because $omega^(l \/ a)$ is a logarithmic pluriform on $J$. The strict transform of every other prime of $Y_1$ dominates a prime $A$ of $W$, by the extraction just performed. The minimum rule implies (6.7) there. The boundary coefficient and the order of an absolute rational pluriform at a surviving prime agree with those on $Y_1$. Thus $s$ is regular as a section of $l \( K_(Y_1) + D_1 \)$ at every prime of the fixed model. Smoothness, or equivalently the normality extension criterion for a line bundle, extends it across the remaining codimension-two subset.
  This argument does not discard the primes contracted by $x_1$: their tests are exactly the reason for extracting their restricted valuations. It also explains why no indefinite extraction of all new source exceptional divisors is needed. Once a section is regular on $Y_1$, (6.1) makes its pullback regular on every higher log source. Both maps in (6.6) are inverse rational identifications, which proves the last assertions. ◻
]

#prodef([Proposition 6.3.])[
  (The rank-one base).  #emph[Take the diagram and degree-$a$ generator $omega$ of 24. After further smooth birational preparation, with the reduced source boundary $D = p_(*)^(- 1) D_(Y_0) + "Exc" \( p \)_(upright("red"))$, the divisor $L_W$ defined by (6.5) is big over $S$. In every sufficiently divisible degree it satisfies the exact section comparison 
#[#set math.equation(numbering: n => "(6.8)")
 $ H^0 \( W \, l L_W \) tilde.eq H^0 #scale(x: 120%, y: 120%)[\(] Y_0 \, l \( K_(Y_0) + D_(Y_0) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:iitaka-fixed-source>]

 Moreover, the models can be chosen so that 
#[#set math.equation(numbering: n => "(6.9)")
 $ L_W = K_W + T_W = K_W + B_W + M_W \, #h(2em) 0 lt.eq B_W lt.eq 1 \, #h(2em) M_W med upright("nef") \, $ <eq:iitaka-bundle-formula>]

 where $B_W$ has simple-normal-crossing support and the equality uses compatible representatives of the rational divisor classes. If $I$ attains the minimum at a prime $A$, then 
#[#set math.equation(numbering: n => "(6.10)")
 $ "coeff"_A B_W gt.eq 1 - frac(1 - d_I, m_I) gt.eq 0 . $ <eq:iitaka-discriminant-bound>]

]
  #emph[After any further birational preparation of the diagram, the minimum rule can be recomputed with the higher reduced log boundary. The section comparison with the same fixed $\( Y_0 \, D_(Y_0) \)$ still holds, and the moduli divisor is the trace of the same b-divisor. Once that b-divisor descends to the chosen model, all these higher traces are pullbacks of $M_W$. A further log resolution restores the simple-normal-crossing condition on $B_W$.]
] <prop:rank-one-base>

#proof[
  #emph[The exact lattice and relative bigness.] Fix an initial smooth source model $Y_1 arrow.r Y_0$ on which the just constructed Iitaka map is a morphism. Apply 25 to $Y_1$, and thereafter use only models dominating its extracted base. That lemma, composed with (6.2), proves (6.8) with the original fixed $Y_0$. Its order argument also applies over $eta_S$. The logarithmic systems on $Y_(eta_S)$ have image dimension $k$, and their ratios descend to systems of $L_W \|_(W_(eta_S))$. After replacing a degree by a multiple to clear denominators, those descended ratios still have transcendence degree $k = dim W_(eta_S)$. Thus $L_W$ is big over $S$. This remains true when $k = 0$, with the usual meaning of bigness on a zero-dimensional generic fiber.
  #emph[The auxiliary subpair.] On the current smooth diagram define
  #[#set math.equation(numbering: n => "(6.11)")
   $ Delta = - 1 / a "div"_(a K_(Y \/ W)) \( omega \) + x^(*) T_W . $ <eq:iitaka-auxiliary-pair>]
  Choose compatible rational canonical forms, and write $phi$ for the rational function expressing $omega$ in the corresponding relative frame. Then
  #[#set math.equation(numbering: n => "(6.12)")
   $ K_Y + Delta + 1 / a "div" \( phi \) = x^(*) L_W . $ <eq:iitaka-trivialization>]
  At a horizontal prime the inequality $Delta lt.eq D$ follows from the logarithmic regularity of $omega \|_J$. At every prime dominating a fixed base prime $A$, it is exactly the minimum inequality (6.5). Divisors mapping into codimension two disappear after shrinking around $eta_A$. It follows that $Delta lt.eq D$ near $x^(- 1) \( eta_A \)$ for every $A$, and also over the generic point of $W$. Since the reduced log smooth pair $\( Y \, D \)$ is log canonical, these inequalities imply that $\( Y \, Delta \)$ is sub-log-canonical there. Negative coefficients of $Delta$ cause no difficulty.
  We verify the discrepancy-sheaf rank condition rather than inferring it from generic log canonicity. On a resolved geometric generic fiber $rho : J' arrow.r J$, use the higher reduced boundary $D_(J')$ and put
  $ Z_(J') = "div"_(a K_(J')) \( omega \) + a D_(J') gt.eq 0 . $
  The crepant transform $Delta_(J')$ of the auxiliary subpair is
  $ Delta_(J') = D_(J') - 1 / a Z_(J') . $
  Moreover $Z_(J') tilde.op a \( K_(J') + D_(J') \)$, so $kappa \( J' \, Z_(J') \) = 0$. For the discrepancy b-divisor $upright(bold(A))^(*)$, the coefficient $- 1$ is omitted. On this resolution its rounded trace $R = ceil.l upright(bold(A))_(J')^(*) ceil.r$ is effective and is supported on $"Supp" Z_(J')$: where the logarithmic zero divisor vanishes, the auxiliary coefficient is either $0$ or $1$, and its contribution to $R$ is zero. Therefore $R lt.eq N Z_(J')$ for some integer $N$, and
  $ h^0 \( J' \, cal(O) \( R \) \) lt.eq h^0 \( J' \, cal(O) \( N Z_(J') \) \) = 1 . $
  If $Z_(J') = 0$, this simply says $R = 0$. Sections of the discrepancy sheaf satisfy in particular the order conditions on this resolution, so the displayed bound is also an upper bound for its generic rank. Conversely, on every higher model sub-log-canonicity gives discrepancies at least $- 1$; after omitting $- 1$, their ceilings are nonnegative. The constant function $1$ consequently belongs to the discrepancy sheaf. We have proved
  #[#set math.equation(numbering: n => "(6.13)")
   $ "rank" x_(*) cal(O)_Y #scale(x: 120%, y: 120%)[\(] ceil.l upright(bold(A))^(*) \( Y \, Delta \) ceil.r #scale(x: 120%, y: 120%)[\)] = 1 . $ <eq:iitaka-rank-condition>]
  The morphism $x$ has connected fibers: its Stein factor is finite birational over the normal variety $W$, since its geometric generic fiber is connected. Thus $x$ is projective and surjective with connected fibers, its source and base are normal, $Delta$ is rational, the subpair is sub-log-canonical generically, and (6.12) and (6.13) give its remaining lc-trivial conditions. Thus it is an lc-trivial fibration in the precise sense of #cite(label("FG")) Definition 3.2. By #cite(label("FG")) Theorem 3.6, applied with the structural morphism $W arrow.r "Spec" bb(C)$, its moduli b-divisor is b-nef. This application requires neither effectivity of the auxiliary subpair nor abundance or semiampleness of the moduli part.
  #emph[The discriminant and higher models.] Following #cite(label("FG")) §3.4, define
  $ c_A = sup { c in bb(Q) : \( Y \, Delta + c x^(*) A \) upright(" is sub-log-canonical over ") eta_A } \, #h(2em) b_A = 1 - c_A . $
  The comparison with $D$ already proved gives $c_A gt.eq 0$, hence $b_A lt.eq 1$. If $I$ attains the minimum in (6.5), its coefficient in $Delta$ is exactly $d_I$. The discrepancy condition at that prime forces $d_I + c_A m_I lt.eq 1$. Therefore
  $ 1 gt.eq b_A gt.eq 1 - frac(1 - d_I, m_I) gt.eq 0 \, $
  where the last inequality uses $d_I in { 0 \, 1 }$ and $m_I gt.eq 1$. Put $B_W = sum_A b_A A$ and $M_W = T_W - B_W$, using the normalization (6.12). This is the moduli trace for that normalization.
  It remains to reconcile b-nefness on a higher model with recomputation of our minimum rule. Let $beta : W' arrow.r W$ be a smooth birational base modification, take a compatible source resolution $rho : Y' arrow.r Y$, and use the higher reduced boundary $D'$. Write $L' = K_(W') + T_(W')$ for the recomputed minimum divisor and $Delta'$ for (6.11) on that diagram. Let $Delta^(upright("cr"))$ be the crepant transform, defined by $K_(Y') + Delta^(upright("cr")) = rho^(*) \( K_Y + Delta \)$. Comparing (6.12) on the two models, with the same rational trivialization, gives
  #[#set math.equation(numbering: n => "(6.14)")
   $ Delta' = Delta^(upright("cr")) + x' ""^(*) Q \, #h(2em) Q = L' - beta^(*) L_W . $ <eq:iitaka-normalization-change>]
  This identity includes the change of the relative canonical frame; omitting that change would give an incorrect formula for $T_(W')$.
  Let $B_(W')^(upright("cr"))$ be the discriminant of the crepant induced fibration, as in #cite(label("FG")) §3.3. At a prime of $W'$, adding $x' ""^(*) Q$ decreases its threshold by the local coefficient of $Q$. Thus the recomputed discriminant and moduli divisors satisfy
  #[#set math.equation(numbering: n => "(6.15)")
   $ B_(W') & = B_(W')^(upright("cr")) + Q \,\
M_(W') & = L' - K_(W') - B_(W') = beta^(*) L_W - K_(W') - B_(W')^(upright("cr")) . $ <eq:iitaka-moduli-compatibility>]
  The latter is precisely the old moduli b-divisor’s trace. Hence we may first dominate a model on which it is nef and descends, and then make any necessary further modifications; its new trace is its nef pullback. Repeating the minimum and threshold argument on each new diagram still proves $0 lt.eq B_(W') lt.eq 1$.
  For completeness, at a base prime not exceptional for $beta$ the minimum does not change. Indeed, the crepant transform of the old auxiliary divisor is bounded by $D'$ over its generic point, by (6.1); this gives the old minimum as a lower bound for all new candidates. An old minimizing prime survives strictly and supplies equality. The discriminant is likewise unchanged there. Thus any new discriminant support is contained in the exceptional locus together with the transform of the old support. Resolve that union. Recomputing the minimum on the resulting model therefore gives simple-normal-crossing support and keeps the moduli part nef. The extraction in 25 survives all these operations, so the exact section comparison continues to refer to the same fixed $Y_0$. This proves all the assertions. ◻
]

All arguments in this section use the logarithmic vector constructed above and the published lc-trivial b-nefness theorem. The logarithmic Iitaka lower bound of 34 is not used.

== 7 Base nonvanishing and removal of the period twist <sec:nonvanishing>

It remains to prove the section construction stated in the introduction. The marked quotient gives two cases. A point quotient supplies scalar coordinates directly; for a positive-dimensional quotient the exact section lattice of 6 lets us work on its intermediate base. There we remove the divisor added by period positivity. Every argument here is independent of logarithmic subadditivity.

#prodef([Proposition 7.1.])[
  #emph[Let $f : \( X \, E \) arrow.r \( Y \, D \)$ satisfy the hypotheses of 1, and let 
$ 0 eq.not s in H^0 #scale(x: 120%, y: 120%)[\(] X \, m \( K_X + E \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) m > 0 . $

 Then $kappa \( Y \, L_Y \) gt.eq 0$, where $L_Y = K_Y + D$. More precisely, apply the homogeneous highest-vector and marked-period constructions to $s$, and denote their connected quotient by $S$. If $dim S > 0$, then the relative Iitaka space $W$ of Lemma 6.1, Proposition 6.3 satisfies 
$ kappa \( Y \, L_Y \) gt.eq dim W gt.eq dim S > 0 . $

 If $S$ is a point, there is an integer $a > 0$ and a nonzero section $tau in H^0 \( Y \, a L_Y \)$. Moreover, for every $y in V$ at which $s \|_(X_y) = 0$, this section can be chosen with $tau \( y \) = 0$.]
] <prop:nonvanishing>

The construction is attached to the chosen section $s$; in particular, its quotient $S$ may depend on $s$. We first complete the point-quotient case, using the original coefficient lattice. The rest of the section proves that a positive-dimensional quotient forces positive base Kodaira dimension.

=== 7.1 The point-quotient case <the-point-quotient-case>

#proof[
  For a point base there is a nonzero constant base section and the zero test has no nonzero input satisfying its premise. Assume $dim Y > 0$. Apply 4 and 7 to the chosen $s$, obtaining a homogeneous vector with source $- a L_Y$.
  Since $S$ is a point, the descended coefficient system is constant. In a constant frame its coordinates are rational sections of $a L_Y$. The divisorial lattice bounds make each coordinate regular at every prime of $Y$: this can be tested after finite ramified substitution, since a negative order remains negative after multiplying it by the ramification index. On the smooth variety $Y$, regularity in codimension one gives global regularity. At least one coordinate is nonzero because the homogeneous vector is nonzero; choose it as $tau$.
  If $s \|_(X_y) = 0$ for $y in V$, 6 says that all these coordinates have positive order in the pulled-back original $a L_Y$ frame along the divisor of the blowup of $y$ (along $y$ itself if $Y$ is a curve). Finite ramification multiplies orders by its positive index. Hence each original regular coefficient has positive exceptional order, equal to its vanishing order at $y$. Thus the same nonzero coordinate vanishes at $y$, as asserted. ◻
]

=== 7.2 The numerical target <the-numerical-target>

Assume henceforth that $dim S > 0$. After the birational preparations in Lemma 6.1, Proposition 6.3, write

$ Y arrow.r^x W arrow.r^h S \, #h(2em) u_(*) = omega thin x^(*) u_W \, #h(2em) L_W = K_W + T_W tilde.op_(bb(Q)) K_W + B_W + M_W . $

Here $W \, S$ are smooth and projective, both maps have geometrically connected generic fibers, $0 lt.eq B_W lt.eq 1$ has SNC support, and $M_W$ is nef. The divisor $L_W$ is big over $S$. The highest vector has source $- a L_Y$, and $omega$ is the generator in degree $a$ on the generic $x$-fiber. All references to $Y$ in this diagram use its prepared model; the actual pluriform comparison in 26 returns sections to the original pair.

#prodef([Proposition 7.2.])[
  (Removal of a period twist).  #emph[Let $h : W arrow.r S$ be a surjective morphism of smooth projective varieties, with $dim S > 0$. Let $L$ be a rational divisor on $W$ and $H$ a nef rational divisor on $S$. Suppose:]
  + #emph[$L$ is big on the generic fiber of $h$, and $L - h^(*) K_S$ is pseudoeffective;]
  + #emph[$K_S + b H$ is big for some rational $b gt.eq 0$;]
  + #emph[there are a dominant generically finite morphism $pi : hat(W) arrow.r W$ from a smooth projective variety, a nef rational divisor $P$ on $hat(W)$, and a rational $Q > 0$ such that, with $tilde(H) = pi^(*) h^(*) H$, 
$ nu \( P + tilde(H) \) = nu \( P \) \, #h(2em) Q pi^(*) L gt.eq_(upright("pe")) P . $

]
  #emph[Then $L$ is big.]
] <prop:twist-removal>

The first two hypotheses make $L + b h^(*) H$ big. The numerical-dimension condition in the third says that the added period directions contribute no positivity beyond $P$. Its fixed comparison with $L$ allows us to remove the added divisor. We prove this numerical implication first; the geometric comparisons that follow will establish its hypotheses for $L_W$ and $cal(H)$.

#prodef([Lemma 7.3.])[
  (Nef subtraction).  #emph[Let $Z$ be smooth projective of dimension $n > 0$, let $A$ be an ample rational divisor, and let $P \, H$ be nef rational divisors satisfying $nu \( P + H \) = nu \( P \)$. For every fixed rational $b gt.eq 0$, the divisor $A + t P - b H$ is big for all sufficiently large rational $t$.]
] <lem:nef-morse>

#proof[
  Put $r = nu \( P \)$. The polynomial
  $ \( A + t P \)^n $
  has degree $r$ and strictly positive leading coefficient. In the polynomial $n b \( A + t P \)^(n - 1) H$, all coefficients of $t^i$ for $i gt.eq r$ vanish. Indeed
  $ \( P + H \)^(i + 1) A^(n - 1 - i) = 0 quad \( r lt.eq i lt.eq n - 1 \) \, $
  and each mixed nef intersection in this expansion is nonnegative; in particular $P^i H A^(n - 1 - i) = 0$. When $r = n$, this index range is empty. For $r = 0$ this says that the entire second polynomial is zero. Thus, for large $t$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ \( A + t P \)^n > n \( A + t P \)^(n - 1) b H . $ <eq:nonvanishing-morse>]
  We recall directly why this strict nef Morse inequality implies bigness here. Write $U = A + t P$ and $V = b H$. The first divisor is ample and the second is nef. Replace $V$ by $V + delta A$, with rational $delta > 0$ sufficiently small that the strict inequality persists. After multiplying by a common positive integer, $U$ is integral ample and the new $V$ is very ample. Choose a general member $H_V in \| V \|$. Successive restriction exact sequences give
  $ h^0 #scale(x: 120%, y: 120%)[\(] Z \, l \( U - V \) #scale(x: 120%, y: 120%)[\)] gt.eq h^0 \( Z \, l U \) - sum_(j = 0)^(l - 1) h^0 #scale(x: 120%, y: 120%)[\(] H_V \, \( l U - j V \) \|_(H_V) #scale(x: 120%, y: 120%)[\)] . $
  Multiplication by a nonzero section of $j V \|_(H_V)$ bounds each summand by $h^0 \( H_V \, l U \|_(H_V) \)$. On a curve choose this section nonvanishing at the finitely many points of $H_V$; in higher dimension take $H_V$ smooth and irreducible. Ample Hilbert asymptotics therefore give
  $ h^0 #scale(x: 120%, y: 120%)[\(] Z \, l \( U - V \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(U^n - n U^(n - 1) V, n !) thin l^n + O \( l^(n - 1) \) . $
  The coefficient is positive. Hence $U - V$ is big, and adding back $delta A$ proves bigness before perturbation as well. ◻
]

#proof[
  Choose $b gt.eq 0$ with $K_S + b H$ big and put $D_b = L + b h^(*) H$. By hypothesis (i) and bigness of $K_S + b H$, there are an ample rational $A_S$ and $delta > 0$ rational such that $D_b gt.eq_(upright("pe")) delta h^(*) A_S$. The divisor $D_b$ is also big over $S$. Hence $D_b + c h^(*) A_S$ is big for some rational $c > 0$.
  To justify the latter assertion, fix an ample $A_W$ on $W$. Relative bigness gives a nonzero generic-fiber section of $l D_b - A_W$ for some divisible $l$. Its direct image is nonzero; after twisting by $k A_S$ for large $k$ it has a nonzero global section. Thus $l D_b - A_W + k h^(*) A_S$ is effective. Taking $c = k \/ l$ proves the assertion. Now
  $ D_b = frac(delta, c + delta) \( D_b + c h^(*) A_S \) + frac(c, c + delta) \( D_b - delta h^(*) A_S \) $
  expresses $D_b$ as a positive multiple of a big class plus a pseudoeffective class. Therefore $D_b$ is big.
  Pull back and choose an ample rational $A'$ on $hat(W)$ with $pi^(*) L + b tilde(H) gt.eq_(upright("pe")) A'$. For every $t > 0$, hypothesis (iii) gives
  $ \( 1 + t Q \) pi^(*) L gt.eq_(upright("pe")) A' + t P - b tilde(H) . $
  The right side is big for large rational $t$ by the numerical-dimension equality in (iii) and Lemma 29. Thus $pi^(*) L$, and hence $L$, is big. Bigness descends under a dominant generically finite projective map, for example by the norm of a section after subtracting a small ample class. No equality of numerical and Iitaka dimensions for a general pseudoeffective divisor is being assumed. ◻
]

=== 7.3 The fixed determinant lines and their cotangent maps <the-fixed-determinant-lines-and-their-cotangent-maps>

Choose the connected unipotent level and equivariant resolutions of 22, and write their composite as $pi : hat(W) arrow.r W$. This map is generically finite and Galois at the function-field level. On $hat(W)$ let $G_i$ be the extended subbundles generated by contractions of $theta^i \( u_W \)$, put $r_i = "rk" G_i$, and retain only indices with $r_i > 0$. Set

#[#set math.equation(numbering: n => "(7.2)")
 $ P = - sum_i \( i + 1 \) det G_i \, #h(2em) tilde(cal(H)) = pi^(*) h^(*) cal(H) . $ <eq:nonvanishing-tail>]

Both lines are nef and

#[#set math.equation(numbering: n => "(7.3)")
 $ nu \( P + tilde(cal(H)) \) = nu \( P \) . $ <eq:nonvanishing-rank>]

The projective line $\[ u_W \]$ gives precisely the compact-factor marks required in that proposition, by the factorization $u_(*) = omega x^(*) u_W$.

Fix a rational frame of each $det G_i^or$ over the original function field $bb(C) \( W \)$. Its divisor in the extended line upstairs is denoted by $hat(D)_i^G$. Define rational divisors on $W$ by

#[#set math.equation(numbering: n => "(7.4)")
 $ D_i^G = frac(pi_(*) hat(D)_i^G, deg pi) \, #h(2em) P_W = sum_i \( i + 1 \) D_i^G . $ <eq:nonvanishing-determinants>]

The superscript distinguishes these determinant divisors from the boundary $D$ on $Y$. The rational frames and these divisors are fixed throughout the ample perturbations below.

We define the cotangent lattice before writing the transfer map. For the rational SNC boundary $B_W = sum_A b_A A$, its adapted cotangent lattice $Omega^1 \( W \, B_W \)$ has, at a general point of $A = \( t = 0 \)$, transverse generator $t^(1 - b_A) d t \/ t$ and ordinary tangential generators. These are interpreted on a cover $t = v^e$ with $e b_A$ integral. Thus $b_A = 0$ retains the pullback of $d t$, and $b_A = 1$ retains the pullback of $d t \/ t$. An adapted cover is chosen with these divisible ramification indices along the boundary; any auxiliary branch divisors have boundary coefficient zero and retain the pullback of ordinary forms. Tensor maps into this lattice are statements on such covers, in codimension one. The proof will also verify their extension across the remaining locus.

#prodef([Lemma 7.4.])[
  (Orbifold transfer).  #emph[The divisor $P_W$ is pseudoeffective and 
#[#set math.equation(numbering: n => "(7.5)")
 $ pi^(*) P_W gt.eq_(upright("pe")) P . $ <eq:nonvanishing-pushdown>]

 For each $i$, the determinant of the $i$th Higgs map gives a generically nonzero rational map 
#[#set math.equation(numbering: n => "(7.6)")
 $ cal(O)_W \( D_i^G - a r_i L_W \) arrow.r #scale(x: 120%, y: 120%)[\(] Omega^1 \( W \, B_W \) #scale(x: 120%, y: 120%)[\)]^(⊗ i r_i) . $ <eq:nonvanishing-orbifold-map>]

 This notation means the following precise assertion: after a fixed tensor power clearing the rational source divisor, the pullback map is regular on every sufficiently divisible adapted cover, using the orbifold cotangent lattice in codimension one. The same tensor power works after replacing $B_W$ by any effective SNC boundary $B_W + Lambda$ with coefficients at most one.]
] <lem:orbifold-transfer>

#proof[
  The extending lattices and their determinant divisors are invariant under the Galois group. For every prime $A_0$ of $W$, the orders of the pullback of $D_i^G$ therefore agree with those of $hat(D)_i^G$ at all primes over $A_0$. Indeed, if $e$ is the common ramification index and $v$ their common order, then the coefficient downstairs obtained by pushforward and division by $deg pi$ is $v \/ e$.
  Factor $pi$ through the finite normalization $W^(upright("fin")) arrow.r W$. The difference
  $ Z = pi^(*) P_W - sum_i \( i + 1 \) hat(D)_i^G $
  is exceptional over $W^(upright("fin"))$. Its negative is relatively nef: the pullback term has degree zero on contracted curves, and the remaining term represents the nef line $P$. The negativity lemma #cite(label("KollarMori")) Lemma 3.39 gives $Z gt.eq 0$. This proves (7.5). Pushforward of the pseudoeffective class $P$ gives $deg \( pi \) P_W$, proving the first assertion.
  We prove the lattice assertion at an arbitrary prime $A_0 subset W$. Use the notation of 26:
  $ t_(A_0) = min_(I arrow.r A_0) frac(a^(- 1) "ord"_I \( omega \) + d_I, m_I) \, quad m_I = "ord"_I \( x^(*) A_0 \) \, quad d_I = "coeff"_I \( D \) . $
  Choose a component $I$ achieving this minimum. The discriminant coefficient $b_(A_0) = "coeff"_(A_0) \( B_W \)$ satisfies
  #[#set math.equation(numbering: n => "(7.7)")
   $ t_(A_0) = frac(a^(- 1) "ord"_I \( omega \) + d_I, m_I) \, #h(2em) b_(A_0) gt.eq 1 - frac(1 - d_I, m_I) . $ <eq:nonvanishing-same-minimizer>]
  Both statements use this same $I$.
  At general points of $A_0$ and $I$, choose a parameter $t$ downstairs and a parameter $z$ upstairs. After an etale local change absorbing a unit, $t = z^(m_I)$; the other base coordinates pull back to independent coordinates along $I$. Work on a local cover $t = v^e$ sufficiently divisible to make the Hodge monodromy unipotent and clear all relevant denominators. Write a coefficient $c$ of $theta^i \( u_W \)$ in Schmid frames, using an ordinary frame of $a K_W$ and a cotangent tensor having $j$ factors $d t \/ t$, with the other factors tangential. Define $"ord" \( c \)$ using the parameter $v$.
  The identity $u_(*) = omega x^(*) u_W$ holds for Higgs iterates as well: the Higgs field is linear over functions, so there is no derivative of $omega$. Make a further divisible substitution in $z$ dominating the chosen $t$-cover. The lattice bounds of Proposition 3.1, Lemma 3.2 then apply to each coefficient in the independent pulled-back coordinate tensors. Each transverse factor pulls back as $m_I thin d z \/ z$ and costs $1 - d_I$ units of $I$-order. Consequently
  $ m_I frac("ord" \( c \), e) + "ord"_I \( omega \) + a d_I - j \( 1 - d_I \) gt.eq 0 . $
  The order of $omega$ is measured in $a K_(Y \/ W)$, so the canonical change of variables is already included. Using (7.7), we obtain
  #[#set math.equation(numbering: n => "(7.8)")
   $ frac("ord" \( c \), e) gt.eq - a t_(A_0) + frac(j \( 1 - d_I \), m_I) gt.eq - a t_(A_0) + j \( 1 - b_(A_0) \) . $ <eq:nonvanishing-orbifold-order>]
  This is exactly the required regularity after twisting the source by $- a L_W$: the transverse orbifold cotangent frame is $t^(1 - b_(A_0)) d t \/ t$, interpreted after ramification, and the tangential frames are ordinary differentials. For example, when $b_(A_0) = 0$ this frame is $d t$, and when $b_(A_0) = 1$ it is $d t \/ t$.
  Generically the contractions of this map surject onto $G_i$. On the unipotent resolution $G_i$ has its subbundle lattice inside the Schmid grade, so the regularity just proved holds with this target lattice. Dualize, take the top exterior power of $G_i^or$, and use the natural inclusion of an exterior power in a tensor power. The resulting source is $det G_i^or - a r_i pi^(*) L_W$, which gives (7.6) by the order identification for $D_i^G$ at primes over $W$.
  Here is also a global interpretation of the cover assertion. Fix an integer $N_0 > 0$ clearing all the source divisors $D_i^G - a r_i L_W$. On a smooth adapted cover $rho : W_(upright("ad")) arrow.r W$ for $B_W + Lambda$, the $N_0$th tensor power is a rational map from $rho^(*) cal(O)_W \( N_0 \( D_i^G - a r_i L_W \) \)$ to the tensor power of degree $N_0 i r_i$ of its orbifold cotangent bundle. At each prime it is regular after a further common local ramification that is also unipotent for the Hodge system. Fractional cotangent frames pull back compatibly under that ramification; an inequality of integral orders after such a finite substitution implies the original inequality. Thus the map was already regular on $W_(upright("ad"))$. Regularity in codimension one extends across codimension two because source and target are locally free on its smooth model.
  Increasing the boundary coefficient enlarges the cotangent lattice: the original transverse frame is the new one multiplied by $t^("coeff"_(A_0) \( Lambda \))$. At auxiliary branch divisors with zero boundary coefficient the lattice is the pullback of ordinary cotangent forms. Hence the same argument applies at every prime of any adapted cover for the larger boundary. Only the denominators of this cover change with $Lambda$; the integer $N_0$ is the fixed integer chosen above. ◻
]

=== 7.4 The uniform threshold and relative positivity <the-uniform-threshold-and-relative-positivity>

We next turn these maps into a numerical comparison. We use #cite(label("CP")) Theorem 1.3 in its orbifold tensor form: for a smooth projective SNC pair $\( Z \, Delta \)$ with rational coefficients in $\[ 0 \, 1 \]$ and $K_Z + Delta$ pseudoeffective, every torsion-free quotient of an orbifold cotangent tensor power on an adapted cover has nonnegative degree against the pullback of every movable curve class on $Z$. In particular, if a line injects into such a tensor power, its degree is at most the degree of the determinant of that tensor power. To see the last assertion, saturate the image and apply the theorem to the quotient; the effective divisor introduced by saturation only strengthens the assertion. For a rank-one tensor it follows directly from the effective zero divisor of the map.

The threshold argument below follows the ample-perturbation method in #cite(label("CP")) proof of Theorem 7.6; here the fixed Higgs maps provide constants independent of the varying boundary.

#prodef([Lemma 7.5.])[
  (A uniform pseudoeffective threshold).  #emph[In the notation above, $L_W$ is pseudoeffective. There is a constant $Q > 0$, depending only on the fixed Higgs maps, such that 
#[#set math.equation(numbering: n => "(7.9)")
 $ Q pi^(*) L_W gt.eq_(upright("pe")) P . $ <eq:nonvanishing-domination>]

]
] <lem:pseff-threshold>

#proof[
  Fix an ample rational divisor $A$ on $W$ and write $n = dim W > 0$. For a positive rational $epsilon.alt$ for which $L_W + epsilon.alt A$ is pseudoeffective, the divisor $M_W + epsilon.alt A$ is ample. Choose a sufficiently divisible $k$ and a general smooth member of $\| k \( M_W + epsilon.alt A \) \|$, transverse to every stratum of $B_W$, and divide it by $k$. This gives
  $ Lambda_epsilon.alt tilde.op_(bb(Q)) M_W + epsilon.alt A \, quad 0 lt.eq B_W + Lambda_epsilon.alt lt.eq 1 \, quad K_W + B_W + Lambda_epsilon.alt tilde.op_(bb(Q)) L_W + epsilon.alt A . $
  The support is SNC. Thus the pair is log canonical and has pseudoeffective adjoint, as required in #cite(label("CP")) Theorem 1.3.
  Choose a smooth Galois adapted cover for this pair, as in #cite(label("CP")) Definition 5.1 and Lemma 5.2. Such covers can be obtained by the covering construction: add general transverse auxiliary divisors to make the root divisors divisible in the Picard group, and normalize the resulting finite root covers. Use sufficiently many general auxiliary choices that, at each point and for each prescribed boundary component, one auxiliary equation is a unit. Locally the normalization then extracts roots of independent SNC coordinates and is smooth. The auxiliary ramifications are assigned boundary coefficient zero. On this cover the determinant of the orbifold cotangent bundle is the pullback of $K_W + B_W + Lambda_epsilon.alt$.
  Put $d_i = i r_i$. For $d_i > 0$, the tensor in 30 has rank $n^(N_0 d_i)$ and first Chern class
  $ N_0 d_i thin n^(N_0 d_i - 1) rho^(*) \( L_W + epsilon.alt A \) . $
  Apply the preceding quotient statement to its nonzero source line. Divide the resulting inequality by $N_0 deg rho$. For every movable curve class $alpha$ on $W$ this gives
  $ #scale(x: 120%, y: 120%)[\(] c_i \( L_W + epsilon.alt A \) + a r_i L_W - D_i^G #scale(x: 120%, y: 120%)[\)] dot.op alpha gt.eq 0 \, #h(2em) c_i = d_i n^(N_0 d_i - 1) . $
  For $d_i = 0$, the map is into the trivial line; take $c_i = 0$ and use its effective zero divisor. All $c_i$ are independent of $epsilon.alt$ and of the chosen representative $Lambda_epsilon.alt$.
  The duality between the pseudoeffective divisor cone and the movable curve cone on the smooth projective variety $W$ #cite(label("BDPP")) Theorem 2.2 now gives
  #[#set math.equation(numbering: n => "(7.10)")
   $ C \( L_W + epsilon.alt A \) + R L_W gt.eq_(upright("pe")) P_W \, #h(2em) C = sum_i \( i + 1 \) c_i gt.eq 0 \, quad R = a sum_i \( i + 1 \) r_i > 0 . $ <eq:nonvanishing-uniform-inequality>]
  The strict positivity of $R$ follows from $G_0 eq.not 0$.
  For completeness, consider
  $ tau = inf { t gt.eq 0 : L_W + t A upright(" is pseudoeffective") } . $
  This is finite. Since $P_W$ is pseudoeffective, (7.10) implies, for every rational $epsilon.alt > tau$,
  $ L_W + frac(C, C + R) epsilon.alt A upright(" is pseudoeffective") . $
  If $tau > 0$, closedness of the cone and $epsilon.alt arrow.b tau$ would give $tau lt.eq C tau \/ \( C + R \) < tau$, a contradiction. Thus $tau = 0$ and $L_W$ is pseudoeffective. We may now let $epsilon.alt arrow.b 0$ in (7.10); pullback and (7.5) yield (7.9) with $Q = C + R$. ◻
]

#prodef([Lemma 7.6.])[
  (Relative pseudoeffectivity).  #emph[For the prepared morphism $h : W arrow.r S$ one has 
#[#set math.equation(numbering: n => "(7.11)")
 $ L_W - h^(*) K_S gt.eq_(upright("pe")) 0 . $ <eq:nonvanishing-relative>]

]
] <lem:nonvanishing-relative>

#proof[
  If $h$ has relative dimension zero, it is birational by connectedness of its generic fiber, and the conclusion follows from $K_W - h^(*) K_S gt.eq 0$, $B_W gt.eq 0$, and nefness of $M_W$. Assume henceforth that its relative dimension is positive. Use $A$ and $Lambda_epsilon.alt$ from the preceding proof. We have established pseudoeffectivity of $K_W + B_W + Lambda_epsilon.alt tilde.op_(bb(Q)) L_W + epsilon.alt A$ for every rational $epsilon.alt > 0$. Apply #cite(label("CP")) Theorem 3.4 and Remark 3.3 to the fibration and this smooth SNC log canonical pair. We spell out the model issue because the fixed $W$ need not itself be the good model used in that theorem.
  Take a commutative birational diagram
  $ W' & arrow.r^(h') & S'\
p arrow.b &  & arrow.b q\
W & arrow.r^h & S \, $
  with smooth projective varieties, resolved morphism, SNC discriminant and reduced inverse discriminant, and such that every divisor of $W'$ contracted by $h'$ to codimension at least two is exceptional over $W$. These are the good-model requirements in #cite(label("CP")) Remark 3.3. They may be arranged by extracting on $S$ the restricted valuations of the finitely many divisors of $W$ with exceptional image, as in 25, and then resolving the map and the boundary. Once those original valuations have divisorial center, further base modifications preserve that property for their strict transforms; all remaining offending source divisors are exceptional over $W$.
  One can require the discriminant here to be the actual critical-value locus, rather than merely an SNC divisor containing it. To check this point in the preparation, first take an SNC divisor on the resolved base containing the critical values and all the loci over which the modifications occur; resolve its reduced inverse image, preserving the smooth complement. If a component of this base divisor is not generically a critical-value divisor and the relative dimension is positive, blow up a smooth component of its inverse image intersected with a general very ample hypersurface. Choose a component of this intersection dominating the base divisor, which exists since its generic fiber has positive dimension. The center has normal crossings with the other boundary components. Locally it has equations $t = z = 0$, where $t$ is the base parameter and $z$ a fiber coordinate; after the blowup a chart has $t = u v$. The resulting critical locus therefore dominates that base divisor. Repeating for the finitely many remaining components makes the actual critical-value locus equal to the chosen SNC divisor. All these new source divisors are exceptional over $W$, and the reduced inverse image remains SNC.
  Set $Delta_epsilon.alt = B_W + Lambda_epsilon.alt$ and take on $W'$ the strict transform of $Delta_epsilon.alt$ plus the reduced $p$-exceptional divisor, resolving its support together with the discriminant. Denote this boundary by $Delta'_epsilon.alt$. Log canonicity gives
  $ K_(W') + Delta'_epsilon.alt = p^(*) \( K_W + Delta_epsilon.alt \) + E_epsilon.alt \, #h(2em) E_epsilon.alt gt.eq 0 upright(" exceptional over ") W . $
  Its adjoint is therefore pseudoeffective. Theorem 3.4 of #cite(label("CP")) is applied with the full boundary $Delta'_epsilon.alt$ and gives pseudoeffectivity of
  $ K_(W' \/ S') + \( Delta'_epsilon.alt \)_(upright("hor")) - D \( h' \) \, $
  where $D \( h' \)$ counts ramification along primes dominating divisors of $S'$. Its generic-fiber hypothesis, as used in the proof of that theorem, holds because the restriction of the pseudoeffective total adjoint to a very general fiber is pseudoeffective. The vertical boundary restricts to zero there, so the fiber sees exactly $\( Delta'_epsilon.alt \)_(upright("hor"))$. This does not require $K_(W') + \( Delta'_epsilon.alt \)_(upright("hor"))$ to be pseudoeffective globally; see also #cite(label("CP")) Remark 3.6. Adding the effective vertical boundary and $D \( h' \)$ proves that $T'_epsilon.alt = K_(W' \/ S') + Delta'_epsilon.alt$ is pseudoeffective.
  Write $K_(S') = q^(*) K_S + F$ with $F gt.eq 0$ exceptional; this is the canonical Jacobian divisor of a birational morphism between smooth varieties. Pushforward of the preceding pseudoeffective divisor gives
  $ p_(*) T'_epsilon.alt = K_W + Delta_epsilon.alt - h^(*) K_S - p_(*) h' ""^(*) F . $
  Consequently $L_W + epsilon.alt A - h^(*) K_S$ is the sum of a pseudoeffective class and the effective class $p_(*) h' ""^(*) F$. Letting $epsilon.alt arrow.b 0$ proves (7.11) on the original fixed $W$. ◻
]

=== 7.5 Return to the original base <return-to-the-original-base>

The geometric comparisons now supply all three hypotheses of the numerical removal proposition. Its conclusion gives a big divisor on $W$; the exact section lattice then returns actual pluriforms to the original base.

#prodef([Proposition 7.7.])[
  #emph[For the data attached to a nonzero total-space pluriform, if $dim S > 0$ then $L_W$ is big and 
$ kappa \( Y \, L_Y \) gt.eq dim W > 0 . $

]
] <prop:positive-period>

#proof[
  Apply 28 with $L = L_W$ and $H = cal(H)$. Relative bigness is 26; relative pseudoeffectivity is 32; adjoint bigness is 21. The nef line $P$ and numerical-rank equality are supplied by 22; its fixed comparison with $L_W$ is 31. Thus $L_W$ is big.
  The divisible-degree comparison of 26 sends its complete section spaces to actual sections on the original fixed base and preserves their ratios. The images of sufficiently large divisible systems therefore have dimension $dim W$. Hence $kappa \( Y \, L_Y \) gt.eq dim W gt.eq dim S > 0$. ◻
]

#proof[
  The point-quotient case, including its original-point zero assertion, was proved at the start of the section. For $dim S > 0$, 24 supplies the nonnegative generic-fiber Iitaka dimension and the diagram used above. 33 then gives $kappa \( Y \, L_Y \) gt.eq dim W gt.eq dim S > 0$. These two alternatives prove all the assertions. ◻
]

#proof[
  Apply 27 to the specified nonzero section $s$. It gives $kappa \( Y \, L_Y \) gt.eq 0$. If that dimension is zero, the positive-dimensional quotient case is excluded. The point-quotient case supplies a nonzero original base section vanishing at every chosen $y in V$ for which $s \|_(X_y) = 0$. This is the second assertion. Together with the reduction in 2, it completes the independent upper inequality. ◻
]

=== 7.6 Equality from logarithmic subadditivity <sec:matched-equality>

We finally invoke the only companion input used in this paper. Its statement is recorded here to make the equality’s precise hypothesis match explicit.

#prodef([Theorem 7.8.])[
  (Logarithmic subadditivity, #cite(label("Foundation")) Corollary 6.2).  #emph[Let $g : Z arrow.r T$ be a surjective morphism with connected fibers between smooth connected projective complex varieties. Let $B_Z \, B_T$ be reduced SNC divisors with $"Supp" \( g^(*) B_T \) subset.eq "Supp" \( B_Z \)$, and let $G$ be a very general smooth fiber with $B_G = B_Z \|_G$. Then 
#[#set math.equation(numbering: n => "(7.12)")
 $ kappa \( Z \, K_Z + B_Z \) gt.eq kappa \( T \, K_T + B_T \) + kappa \( G \, K_G + B_G \) . $ <eq:lower-bound>]

 No smoothness outside $B_T$, abundance, or good-minimal-model hypothesis is imposed.]
] <thm:log-iitaka>

To prove 2, apply logarithmic subadditivity #cite(label("Foundation")) Corollary 6.2, stated in 34, with $Z = X$, $T = Y$, $g = f$, $B_Z = E$, and $B_T = D$. The source and base are smooth connected projective complex varieties, the morphism is surjective with connected fibers, the boundaries are reduced SNC, and (1.1) is exactly its boundary hypothesis. The very general smooth fiber and its restricted boundary are precisely $F \, E_F$. This theorem supplies the lower inequality; 1 supplies the upper inequality. Their infinity conventions agree, giving (1.3) in every case.


#bibliography("refs.bib", style: "ieee", title: [References])
