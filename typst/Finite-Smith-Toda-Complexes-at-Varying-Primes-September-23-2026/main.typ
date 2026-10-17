#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Finite Smith--Toda Complexes at Varying Primes]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The Smith–Toda realization problem asks whether the first chromatic parameters can be killed in a finite spectrum. Algebraically these parameters form a regular sequence in Brown–Peterson homology. Topologically, killing the next parameter requires an actual map of finite spectra that induces its multiplication on homology. Regularity computes the homology of the cofiber once such a map exists; it does not supply the map. At a prime $p$, write

$ upright("BP")_(*) = bb(Z)_(\( p \)) \[ v_1 \, v_2 \, dots.h \] \, #h(2em) \| v_i \| = 2 \( p^i - 1 \) \, $

using Hazewinkel generators. A Smith–Toda complex $V \( n \)$ is a finite $p$-local spectrum $X$ with

$ upright("BP")_(*) X tilde.equiv upright("BP")_(*) \/ \( p \, v_1 \, dots.h \, v_n \) $

as graded $upright("BP")_(*) upright("BP")$-comodules, with the quotient coaction and its generator in degree zero. Here finite $p$-local means a retract of the $p$-localization of a finite CW spectrum. The question concerns first powers. Suitable higher powers can be realized at every finite height by the periodicity methods of Hopkins–Smith #cite(label("HopkinsSmith1998")) Theorem 9 and Proposition 5.14. Those exponents are chosen as part of the construction; the question here prescribes every exponent to be one.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 0$, there exist a prime $p$ and a finite $p$-local spectrum $X$ such that 
$ upright("BP")_(*) X tilde.equiv upright("BP")_(*) \/ \( p \, v_1 \, dots.h \, v_n \) $

 as graded $upright("BP")_(*) upright("BP")$-comodules, with the canonical quotient coaction and generator in degree zero.]
] <thm:main>

Thus the all-height Smith–Toda existence problem has a positive answer when the prime may depend on the height. The construction takes place in ordinary $p$-local spectra, before any chromatic localization. It does not assert that one prime works at every height, provide an explicit bound on the prime, or require a multiplication on the final spectrum.

=== 1.1 Context and earlier methods <context-and-earlier-methods>

The realization problem grew out of the study of complex cobordism modules and periodic phenomena in stable homotopy. Milnor’s work on complex cobordism and Novikov’s coefficient theorem established its polynomial coefficient structure #cite(label("Milnor1960")) #cite(label("Novikov1962")). Brown and Peterson introduced the spectrum $upright("BP")$ #cite(label("BrownPeterson1966")). Quillen identified the formal group law underlying that theory and its $p$-typical projection #cite(label("Quillen1969")); Hazewinkel supplied the integral generators and coefficient formulas used here #cite(label("HazewinkelIII")). These results describe the algebraic quotients whose finite topological realization is at issue.

The low-height constructions are due to Adams, Smith, and Toda: $V \( k \)$ exists for $k = 1 \, 2 \, 3$ when $p > 2 k$, respectively, as summarized in #cite(label("Nave2010")) p. 493. Adams’s periodicity construction is part of his work on the groups $J \( X \)$ #cite(label("Adams1966")). Smith’s work treats the realization of complex bordism modules #cite(label("Smith1970")), while Toda constructs spectra realizing exterior parts of the Steenrod algebra #cite(label("Toda1971")). At height zero the Moore spectrum supplies the quotient by $p$. Each subsequent first-power attachment asks for additional topological information. In the September 2023 version of #cite(label("CulverZhang2024")) Remark 3.29, the existence of $V \( 4 \)$ was recorded as open at every prime. We address arbitrary fixed height by allowing the prime to grow.

Known nonexistence results are consistent with this quantifier order. For $p gt.eq 7$, Nave proves that $V \( \( p + 1 \) \/ 2 \)$ does not exist and that $V \( \( p - 1 \) \/ 2 \)$ cannot be a ring spectrum if it exists #cite(label("Nave2010")) Theorem 1.3. The obstructed height depends on $p$, and the second assertion concerns additional structure. Neither is an obstruction at one fixed height at every prime.

Ultraproducts exploit the distinction between a fixed height and a varying prime. Barthel–Schlank–Stapleton establish asymptotic algebraicity in chromatically localized categories and apply it to generalized Moore objects #cite(label("BSS2020")). Their compactness is in the localized category, whereas Theorem 1 requires an ordinary finite spectrum. Here the ultraproduct is formed from ordinary $p$-local spectra. We retain varying sphere degrees and construct a finite sequence of cofibers there. Only finitely many maps and homotopies must subsequently descend to an individual prime.

The other ingredients have complementary predecessors. Exactness of the fixed-prime Tate tensor power provides a model for the permutation construction #cite(label("NS2018")) Proposition III.1.1; our comparison requires a single Euler exponent for the entire family of tensor cubes as $p$ varies. The normalization uses completion by a perfect algebra, in the setting of the Amitsur methods of Mathew–Naumann–Noel #cite(label("MNN2017")). Power operations in cobordism go back to tom Dieck and Quillen #cite(label("tomDieck1968")) #cite(label("Quillen1971")). For detection, we use the coherent Thom construction and its Euler-product formula #cite(label("May1977")) #cite(label("JohnsonNoel2010")). We retain these powers in complex cobordism throughout the calculation, then apply the ordinary multiplicative projection to Brown–Peterson homology.

A related use of filtrations appears in Randal-Williams’s construction of Smith–Toda analogues in graded algebra modules #cite(label("RandalWilliams2026")) Section 5, Theorem 5.6 and Lemma 5.7. There successive cofibers are controlled through associated-graded generators and vanishing estimates over a field of fixed positive characteristic. The comparison here is methodological: our connectivity bounds vary with the prime and feed the normalization of an Euler layer in ordinary spectra. Recent local realization results of Kato–Shimomura–Shimomura concern quotients with a chromatic generator inverted #cite(label("KatoShimomura2025")) Theorem 1.7. They address a different realization target from the ordinary finite, first-power quotient considered here.

=== 1.2 Construction and Detection <construction-and-detection>

Fix $n gt.eq 1$ and a nonprincipal ultrafilter $cal(U)$ on the odd primes. The central ambient category is

$ cal(C) = product_(cal(U)) upright("Sp")_(\( p \)) . $

Its mapping spectra are rational, although sequences of spheres in degrees growing with $p$ still carry essential information. A formal weight $w_j$ records the varying even degree $2 \( p^j - 1 \)$. Mapping out of these spheres gives a rational graded algebra in which finite Koszul extensions can be formed without discarding that degree data.

In this overview, $S^(2 \( p^j - 1 \))$ denotes the sequence of the indicated primewise spheres, and $upright(bold(1))$ denotes the tensor unit. We construct objects $Y_0 \, dots.h \, Y_(n + 1)$ in $cal(C)$, starting from $Y_0 = upright(bold(1))$, and, for $0 lt.eq j lt.eq n$, maps

$ b_j : S^(2 \( p^j - 1 \)) arrow.r Y_j \, #h(2em) Y_(j + 1) = "cofib" #scale(x: 120%, y: 120%)[\(] S^(2 \( p^j - 1 \)) ⊗ Y_j arrow.r^(med b_j dot.op - med) Y_j #scale(x: 120%, y: 120%)[\)] . $

The first class $b_0$ is represented by primewise multiplication by $p$. The multiplication used in this display exists in $cal(C)$; the proof does not require its full commutative structure to exist at any individual prime.

There are two separate tasks. The first is to construct $b_(j + 1)$ from $b_j$, including the choices of boundaries that permit iteration. The second is to show that these classes kill the intended first powers in homology. Keeping the tasks separate avoids assuming the homology calculation in order to construct the next class.

For the construction, take the $p$-fold permutation power with the affine group $C_p times.r bb(F)_p^times$ acting on the factors. The main difficulty is uniformity: the diagrams comparing powers with cofibers have dimensions that grow with $p$. We prove that one Euler map, associated to twice the reduced permutation representation, annihilates the entire comparison object. In a suitable auxiliary category, inverting that map consequently makes the power exact. Before inversion its Euler parameter $t$ has a quotient that detects the next actual sphere degree. The argument controls the whole comparison object, rather than merely its individual filtration pieces.

The power must be normalized before it can be iterated on a Koszul cycle. We do this on a universal algebra $R$ of cycle coefficients, with a finite-cell Koszul extension $K$. Unlike the constructed $Y_j$, these universal coefficient algebras have actual primewise commutative models to which the power applies. At weights proportional to $p$, a symmetric-group connectivity estimate gives the necessary vanishing only after tensoring over $R$ with $K$. Such a tensor test need not detect equivalences on arbitrary modules. We show that it does detect the comparisons needed by our actual completed targets, using the Amitsur totalization associated to $R arrow.r K$. This permits normalization by powers of $t$ while preserving algebra maps and chosen nullhomotopies, not just operations on homotopy classes. For the attaching cycle, it removes a prescribed Euler factor while retaining a class before inversion, where reduction modulo $t$ is still available.

For detection, let $x_j$ be the coefficient of $Z^(p^j)$ in the $p$-series of complex cobordism, with $x_0 = p$. A primewise Thom-corrected power calculation identifies the leading $t$-term of the powered $x_j$ with a unit times $x_(j + 1)$. Comparison with the normalized construction proves that the Hurewicz image of $b_j$ is a unit times $x_j$ modulo its predecessors. Under the ordinary multiplicative projection to $upright("BP")$, the ideals generated by the $x_j$ become the Hazewinkel ideals. No compatibility of that projection with power operations is needed.

Finally, the attaching maps, unit maps, cofiber sequences, and their specified homotopies descend to a common set of primes, together with the finitely many Hurewicz equalities. At one such prime, regularity computes homology in all degrees at once. The sphere map onto the resulting cyclic $upright("BP")$ module fixes its comodule structure. This last step is what produces an ordinary finite Smith–Toda complex, rather than only an ultraproduct or chromatically localized realization.

Three different forms of finite control enter this proof. Rationality is tested one fixed homotopy degree at a time. The estimate at weights growing with $p$ uses a finite-cell comparison of whole primewise modules. The final realization retains only a finite diagram of attaching maps and homotopies. Each has its own justification; no step requires an intersection of infinitely many large prime sets.

=== 1.3 Organization <organization>

Section 2 constructs the rational graded models and their finite realizations. Sections 3 and 4 establish the uniform permutation power and its Euler quotient. Sections 5 and 6 give universal coefficient algebras and the large-weight estimate. Section 7 normalizes the power and constructs the successive attaching classes. Section 8 proves the coefficient identity needed for detection, and Section 9 completes the Hurewicz induction and finite descent.

== 2 Ultraproducts, gradings, and finite cells <sec:foundations>

Fix the integer $n gt.eq 1$ for which we seek a finite realization. This section provides a rational algebraic description of finite constructions in an ultraproduct of ordinary $p$-local spectra. The description keeps track of sphere degrees that vary with $p$. In particular, it will allow us to interpret a finite sequence of exterior algebra extensions as cofiber sequences of spectra.

All categories, tensor products, limits, and colimits are understood homotopically. The notation $"map"$ denotes a mapping spectrum and $"Map" = Omega^oo "map"$ its mapping space. A commutative algebra is an $E_oo$-algebra unless a strict differential graded model is specified. Chain degrees are homological: the differential, denoted $partial$, lowers degree by one. For a discrete abelian group $Gamma$, a $Gamma$-graded object is a family indexed by $Gamma$; its tensor product is convolution,

$ \( U ⊗ V \)_eta = xor.big_(alpha + beta = eta) U_alpha ⊗ V_beta . $

Formal weights introduce no symmetry signs. In a chain model the symmetry sign is determined only by chain degree.

=== 2.1 The ordinary categorical ultraproduct <the-ordinary-categorical-ultraproduct>

Choose a nonprincipal ultrafilter $cal(U)$ on the set of odd primes. A set belonging to $cal(U)$ will be called #emph[large]. Define

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(C) = product_(cal(U)) upright("Sp")_(\( p \)) \, #h(2em) D = product_(cal(U)) bb(Z)_(\( p \)) \, #h(2em) pi.alt = \[ \( p \)_p \] in D . $ <eq:found-ultraproduct>]

Here the category in Equation (2.1) is

$ cal(C) = "colim"_(U in cal(U)) product_(p in U) upright("Sp")_(\( p \)) \, $

with transition functors given by restriction to smaller large sets. Thus a sequence represents an object up to restriction to a large set. We use successively larger universes when taking this colimit and its Ind-completion. This is a colimit of categories; no presentability or preservation of infinite primewise colimits is part of the definition.

#thm([Proposition 2.1.])[
  #emph[The category $cal(C)$ is stable and symmetric monoidal, with finite stable constructions and tensor products computed primewise. If $X = \[ \( X_p \) \]$ and $Y = \[ \( Y_p \) \]$, then 
#[#set math.equation(numbering: n => "(2.2)")
 $ "map"_(cal(C)) \( X \, Y \) tilde.eq "colim"_(U in cal(U)) product_(p in U) "map"_(upright("Sp")_(\( p \))) \( X_p \, Y_p \) . $ <eq:found-mapping-spectrum>]

 Every mapping spectrum is rational, and the endomorphism algebra of the tensor unit is $H D$. The ring $D$ contains $bb(Q)$, and $pi.alt$ is a nonzerodivisor.]
  #emph[Objects, arrows, and homotopies forming a diagram indexed by a finite simplicial set can be represented simultaneously on a large set of primes. The same holds for specified finite cofiber diagrams. Sequence objects become compact in $upright("Ind") \( cal(C) \)$.]
] <found:ultraproduct>

#proof[
  Products and filtered colimits of stable categories preserve the stable structure. To see the mapping formula and the assertion about finite diagrams directly, use simplicial presentations of the categories. Inner horn fillers and any prescribed finite diagram involve only finitely many simplices. Such data therefore pass through the filtered colimit. Mapping spaces are obtained from finite limit tests on these presentations, and filtered colimits of spaces commute with finite limits. This gives the mapping-space version of Equation (2.2); applying it with every fixed integer suspension gives the assertion for mapping spectra. The same mapping-space tests show that primewise finite limits and colimits have the required universal properties. The tensor product and its coherent finite-arity structure pass through the construction as well. These facts also follow from the general categorical ultraproduct results in the author version of #cite(label("BSS2020")) Proposition 3.12, Corollary 3.16, and Lemma 3.17.
  For every fixed nonzero integer $m$, multiplication by $m$ is an equivalence at every prime not dividing $m$. It is consequently an equivalence on each mapping spectrum in Equation (2.2). These spectra are therefore rational. Homotopy groups commute with products of spectra and with filtered colimits, so their groups are the corresponding group ultraproducts. Each fixed positive stable stem of the sphere is finite; this is the stable consequence of Serre’s finiteness theorem #cite(label("Serre1951")) Chapter V, §3, Proposition 3. Its $p$-localization therefore vanishes for all but finitely many primes. Negative stable stems vanish, and the zeroth stem gives $D$. Hence the endomorphism algebra of the unit is the discrete commutative ring spectrum $H D$.
  The inverse of any fixed nonzero integer exists in $D$, giving the inclusion $bb(Q) subset D$. If $pi.alt a = 0$, choose a sequence representing $a$. On a large set one has $p a_p = 0$ in the domain $bb(Z)_(\( p \))$, so $a_p = 0$ there. Thus $a = 0$. Finally, compactness of the sequence objects in the Ind-completion is part of the defining Yoneda embedding into that completion. ◻
]

The same rationality argument applies to ultraproducts of categories of spectra with naive actions of finite groups that may vary with $p$: multiplication by a fixed integer prime to $p$ is still an equivalence. We often omit $H$ when writing a discrete scalar ring as a ring spectrum. Notice that rationality in Proposition 2 concerns fixed integer degrees. It does not discard homotopy in the prime-dependent degrees used below.

=== 2.2 Rational algebra models and specified nullhomotopies <rational-algebra-models-and-specified-nullhomotopies>

#thm([Lemma 2.2.])[
  #emph[Let $R$ be a discrete commutative ring containing $bb(Q)$, and let $Gamma$ be a discrete abelian group. Commutative algebras in $Gamma$-graded $H R$-module spectra admit strict commutative differential graded $R$-algebra models, with no boundedness requirement on chain degree. This description is compatible with diagrams and with derived base change under specified scalar algebras.]
] <found:rectification>

#proof[
  The symmetric monoidal equivalence between $H R$-module spectra and the derived category of $R$-modules is #cite(label("LurieHA")) Theorem 7.1.2.13. The commutative differential graded algebra model and its comparison with $E_oo$-algebras require $bb(Q) subset R$, precisely our hypothesis #cite(label("LurieHA")) Propositions 7.1.4.10–7.1.4.11. For clarity, the comparison uses a resolution of the commutative operad by an $R$-linear $E_oo$-operad. Since the order of each finite symmetric group is invertible in $R$, its coinvariant functor is exact. Comparison of free algebras is therefore a quasi-isomorphism; the filtration by free cells extends this comparison to cellular resolutions. With the additional $Gamma$-grading the same argument is applied weight by weight, summing the weights of the inputs. Under a prescribed scalar algebra one first chooses a cofibrant model of that algebra and then uses derived base change. All these comparisons are equivalences of categories with their mapping spaces, so they also apply to diagrams and their specified homotopies. ◻
]

We will need more than the equivalence class of an algebra that kills a cycle: its universal nullhomotopy must induce the intended map of underlying cofibers. The following formulation records that choice.

#thm([Lemma 2.3.])[
  #emph[Let $B$ be a $Gamma$-graded commutative differential graded algebra over a discrete ring $R supset bb(Q)$, and let $x in B_eta$ be a cycle of chain degree $r$. The free extension 
$ B \/ \/ x := B \[ z \] \, #h(2em) \| z \|_(upright("chain")) = r + 1 \, quad "wt" \( z \) = eta \, quad partial z = x $

 models the derived algebra pushout universally adjoining a null of $x$. In contrast, write $B \/ x$ for the underlying module cofiber of multiplication by $x$, with its degree and weight shifts.]
  #emph[When $r = 0$, there is an identification of underlying $B$-modules 
#[#set math.equation(numbering: n => "(2.3)")
 $ B \/ \/ x tilde.eq B \/ x . $ <eq:found-null-cofiber>]

 It uses the specified universal null $z$. Consequently, an algebra map from $B \/ \/ x$ defined by a map from $B$ and a specified null of the image of $x$ induces the corresponding map of module cofibers using that null multiplied by the base input.]
] <found:free-null>

#proof[
  Let $F$ be the free commutative $R$-algebra on a cycle $u$ of degree $r$ and weight $eta$, and map $u$ to $x$. The required pushout is $B ⊗_F R$, where $F arrow.r R$ sends $u$ to zero. Resolve this augmentation by the free disk algebra
  $ F \[ z \] \, #h(2em) partial z = u . $
  The complex spanned by $u \, z$ is contractible. Every positive symmetric power of this disk is acyclic, since tensor powers are contractible and symmetric-group coinvariants are exact over $R$. Thus the disk algebra maps by a quasi-isomorphism to $R$. As an $F$-module it has an increasing filtration by the number of copies of $z$, whose successive quotients are free shifted $F$-modules. This filtration computes the derived tensor with $B$. After base change the result is exactly $B \[ z \]$ with $partial z = x$. The argument respects the specified weight throughout.
  If $r = 0$, the variable $z$ is odd, hence exterior. The underlying module is the two-term extension of $B$ by the weight-$eta$, degree-one copy of $B$, with differential given by multiplication by $x$. This is Equation (2.3). To identify the chosen null without an ambiguity, one can first perform this calculation over the polynomial cycle algebra $F = R \[ u \]$. Its augmentation is the cofiber of multiplication by $u$, and its discrete target has no degree-one ambiguity in the null of the generator. Tensoring to $B$ gives the displayed comparison through the universal null. A map out of the disk algebra sends $z$ to the chosen target null; on the underlying two-term module its value on a base multiple of $z$ is therefore that same null multiplied by the image of the base element. ◻
]

#prodef([Remark 2.4.])[
  The free cycle and disk algebras over $R$ are obtained by extension of scalars from those over $bb(Q)$. Thus the cell in Lemma 4 also has its stated universal property when considered merely as an attachment over rational spectra. More generally, a pushout of a span of algebras under common scalars is also the pushout of that span without separately imposing those scalars: the map from the middle algebra already supplies the common scalar map and its compatibility. We will use this observation for power operations that can change the action of $D$. Comparisons involving specified nulls are transported together with their specified homotopies along equivalences.
] <found:scalar-pushouts>

=== 2.3 Coherent sphere gradings <coherent-sphere-gradings>

We next assign varying sphere degrees to a fixed lattice of formal weights. The required multiplicative coherence is imposed in the rational category $cal(C)$.

#thm([Lemma 2.5.])[
  #emph[Let $cal(D)$ be a stable symmetric monoidal category with rational mapping spectra, and let $Gamma$ be a finite free abelian group with a chosen basis. Suppose the desired invertible object for each basis element is a tensor square of an invertible object. These objects extend to a symmetric monoidal grading of $cal(D)$ by the discrete group $Gamma$.]
  #emph[For two such gradings, prescribed equivalences on the basis extend to a monoidal equivalence of gradings. The construction can be made relative to any specified subset of the basis.]
] <found:picard-grading>

#proof[
  The Picard space of $cal(D)$ is a grouplike $E_oo$-space and hence is the infinite loop space of a connective spectrum $U$; the recognition statement is #cite(label("LurieHA")) Remark 5.2.6.26. A monoidal grading by $Gamma$ is equivalently a spectrum map $H Gamma arrow.r U$. For $k gt.eq 2$,
  $ pi_k U tilde.equiv pi_(k - 1) "map"_(cal(D)) \( upright(bold(1)) \, upright(bold(1)) \) \, $
  so $tau_(gt.eq 2) U$ is rational.
  Put $Q_s = "cofib" \( S arrow.r H bb(Z) \)$. The rationalization of $S arrow.r H bb(Z)$ is an equivalence. Moreover $Q_s$ is 2-connective, and $pi_2 Q_s = pi_1^s = bb(Z) \/ 2$ #cite(label("Hatcher2002")) Corollaries 4J.3–4J.4. Since maps from a rationally zero spectrum to a rational spectrum vanish, there is an equivalence
  $ "map" \( Q_s \, U \) tilde.eq "map" \( Q_s \, tau_(lt.eq 1) U \) . $
  Connectivity and truncation imply that its homotopy groups in degrees at least zero vanish. In degree minus one its only possible contribution is
  $ pi_(- 1) "map" \( Q_s \, tau_(lt.eq 1) U \) tilde.equiv "Hom" \( bb(Z) \/ 2 \, pi_1 U \) \, $
  which is killed by two. The fiber sequence
  $ "map" \( Q_s \, U \) arrow.r "map" \( H bb(Z) \, U \) arrow.r "map" \( S \, U \) = U $
  therefore shows that evaluation is an equivalence of spaces onto a union of components of $Omega^oo U$. The obstruction to a component lying in that union takes values in a group killed by two. Every double in $pi_0 U$ lies in the image, so a specified tensor square extends to a grading on $bb(Z)$.
  The equivalence onto a union of components also identifies all path spaces between eligible objects. Hence specified equivalences of the generator objects lift to equivalences of gradings, with their higher compatibilities. Finally, $H Gamma$ is the finite direct sum of copies of $H bb(Z)$ indexed by the basis. The space of its maps to $U$ is the corresponding product. Applying the preceding argument factor by factor proves both the assertion and its relative form. ◻
]

Define the lattices and additive functions

#[#set math.equation(numbering: n => "(2.4)")
 $ Lambda = chevron.l w_0 \, dots.h \, w_(n - 1) chevron.r \, #h(2em) Omega = chevron.l w_0 \, dots.h \, w_n chevron.r \,\
d = d_p : Omega arrow.r bb(Z) \, #h(2em) d \( w_h \) = d_h = 2 \( p^h - 1 \) \, #h(2em) q = d_1 = 2 \( p - 1 \) \,\
nu : Omega arrow.r bb(Z) \, #h(2em) nu \( w_h \) = 1 . $ <eq:found-weights>]

The symbols $w_h$ and their relations are independent of $p$, whereas $d_h$ and $q$ depend on $p$. Each sequence of spheres $\( S^(d_p \( w_h \)) \)_p$ is a tensor square. By Lemma 6 we may choose a monoidal sphere grading $S \( eta \)$ on $Omega$ with

$ S \( eta \) tilde.eq \[ \( S^(d_p \( eta \)) \)_p \] . $

Since $d_p \( w_0 \) = 0$, choose this grading first on $Omega \/ chevron.l w_0 chevron.r$ and then pull it back. The $w_0$ direction is thus the unit direction. Fixed homological suspensions, which may be odd, are kept separate from these even sphere degrees.

=== 2.4 Normalized mapping objects <normalized-mapping-objects>

For $Gamma = Omega$ or $Lambda$ and $X in cal(C)$, define

#[#set math.equation(numbering: n => "(2.5)")
 $ h_Gamma \( X \)_eta = "map"_(cal(C)) \( S \( eta \) \, X \) \, #h(2em) eta in Gamma . $ <eq:found-normalized-maps>]

For a primewise $Gamma$-graded system $\( X_p \( eta \) \)$, the same notation means

$ h_Gamma \( X \)_eta = "map"_(cal(C)) #scale(x: 120%, y: 120%)[\(] S \( eta \) \, \[ \( X_p \( eta \) \)_p \] #scale(x: 120%, y: 120%)[\)] . $

An ungraded algebra can also be regarded as constant in the weights, using its multiplication for the weight-additive pairings.

#thm([Lemma 2.6.])[
  #emph[The constructions $h_Gamma$ are exact componentwise and possess coherent lax symmetric monoidal pairings. On algebraic inputs they give graded $D$-algebras and their modules. The pairings are balanced over $D$ whenever its action is supplied by trivial sphere scalars. They also respect additional diagram indices, including filtrations.]
] <found:mapping-pairings>

#proof[
  Mapping out of a fixed sphere is exact. Given two input maps, tensor them and use the chosen equivalence $S \( alpha \) ⊗ S \( beta \) tilde.eq S \( alpha + beta \)$; then compose with the target pairing. This defines the pairing at the pair of weights $\( alpha \, beta \)$. Monoidality of the sphere grading and separate exactness of tensor make these maps coherent at every finite tuple of weights. Their sums give convolution pairings in the category of graded mapping spectra. This construction requires no infinite coproduct in $cal(C)$ itself. The endomorphism algebra of the unit acts centrally through tensor, so the pairings are $D$-balanced. If the targets carry another diagram index, the same construction commutes with its structure maps and its additive pairings. ◻
]

#prodef([Remark 2.7.])[
  For graded inputs we use an ultraproduct of categories of #emph[whole] primewise graded systems. Evaluation at any fixed index gives a functor into $cal(C)$. Primewise graded pairings then give the diagrams and pairings used in Lemma 7, compatibly with restriction to large sets. One may first pull these systems back along prime-dependent additive maps from a common indexing lattice. This only uses a functor from the ultraproduct of whole systems to systems in $cal(C)$; it does not identify these categories or assert that every diagram in $cal(C)$ has such a lift. The same distinction applies to group actions, filtrations, and module structures. The simultaneous coherent sphere grading was chosen only in $cal(C)$. An individual sphere or cell shift used primewise is simply the sphere of the indicated degree.
] <found:whole-systems>

Put $A = h_Omega \( upright(bold(1)) \)$. By Lemma 3 we may work with a strict commutative differential graded $D$-algebra model of $A$. Choose that model on the smaller grading $Omega \/ chevron.l w_0 chevron.r$ before pulling it back. The resulting model is strictly $w_0$-periodic. Let

$ u_0 in A_(w_0) \, #h(2em) \| u_0 \|_(upright("chain")) = 0 \, $

be the homogeneous periodic unit corresponding to $1 in A_0$. We now show that finite algebraic constructions over $A$ describe actual finite constructions from these sphere objects.

=== 2.5 Finite-cell comparison and the objects $Y_j$ <finite-cell-comparison-and-the-objects-y_j>

For a graded module write $V chevron.l eta chevron.r_theta = V_(theta - eta)$ for weight shift. A #emph[finite-cell] graded $A$-module is obtained from finitely many homological suspensions of the modules $A chevron.l eta chevron.r$ by finite sums and cofibers. We do not include retracts in this terminology. Let $cal(C)_(upright("cell"))$ be the corresponding full stable subcategory of $cal(C)$ generated by the spheres $S \( eta \)$.

#thm([Proposition 2.8.])[
  #emph[The functor $h_Omega$ induces a symmetric monoidal equivalence between $cal(C)_(upright("cell"))$ and the category of finite-cell graded $A$-modules. For $X \, Y in cal(C)$, the natural comparison 
#[#set math.equation(numbering: n => "(2.6)")
 $ h_Omega \( X \) ⊗_A h_Omega \( Y \) arrow.r h_Omega \( X ⊗ Y \) $ <eq:found-tensor-comparison>]

 is an equivalence whenever either input is in $cal(C)_(upright("cell"))$. These comparisons preserve units, compositions, and symmetric multi-input products. In particular, a commutative $A$-algebra whose underlying module is finite-cell determines a commutative algebra in $cal(C)$.]
] <found:finite-cell-morita>

#proof[
  Invertibility gives
  $ h_Omega \( S \( eta \) \)_theta tilde.eq "map"_(cal(C)) \( S \( theta - eta \) \, upright(bold(1)) \) = A_(theta - eta) . $
  Thus a sphere generator maps to $A chevron.l eta chevron.r$. For any $X in cal(C)$, mapping from this free graded module evaluates $h_Omega \( X \)$ at $eta$, and therefore agrees with $"map"_(cal(C)) \( S \( eta \) \, X \)$. Exactness extends this comparison from the generators to every finite-cell source. It follows that $h_Omega$ is fully faithful on $cal(C)_(upright("cell"))$. A finite-cell graded module is realized inductively: lift its attaching maps by full faithfulness and take the corresponding cofibers in $cal(C)$. This gives precisely the stated essential image.
  The pairings of Lemma 7 are balanced over $A$. Their coherent balanced comparison is obtained from the tensor bar construction: use the pairings with an arbitrary finite number of inserted $A$-factors and then take its realization in graded mapping spectra. If $X = S \( eta \)$, Equation (2.6) is the weight-shift equivalence supplied by invertibility. Both sides are exact in $X$, so the comparison remains an equivalence for every finite-cell $X$, with $Y$ arbitrary. Symmetry gives the other case. The same bar pairings for several inputs and iterated relative tensors retain compatibility with composition and symmetry. Hence the equivalence on the full tensor-closed finite-cell subcategories is symmetric monoidal. Commutative algebra objects in those full subcategories transport across it, with all their coherence. ◻
]

The proposition holds with $Lambda$ in place of $Omega$, and with the finite-cell subcategory generated by the spheres indexed by $Lambda$, by exactly the same generator and cofiber tests. Only finite-cell sources are involved; no conservativity assertion on arbitrary objects is being made.

#thm([Proposition 2.9.])[
  #emph[Fix $0 lt.eq r lt.eq n$. Suppose cycles $b_h$ of chain degree zero and weight $w_h$, for $0 lt.eq h lt.eq r$, have been chosen successively in the strict algebras 
#[#set math.equation(numbering: n => "(2.7)")
 $ A \[ e_0 \, dots.h \, e_(j - 1) \] \, #h(2em) \| e_h \|_(upright("chain")) = 1 \, quad "wt" \( e_h \) = w_h \,\
partial e_h = b_h in A \[ e_0 \, dots.h \, e_(h - 1) \] \, #h(2em) b_0 = pi.alt u_0 . $ <eq:found-exterior-tower>]

 For $0 lt.eq j lt.eq r + 1$, these algebras determine commutative algebras $Y_j in cal(C)$, with $Y_0 = upright(bold(1))$. For $0 lt.eq j lt.eq r$, the cycle $b_j$ represents a map $S \( w_j \) arrow.r Y_j$, and there is a cofiber sequence 
#[#set math.equation(numbering: n => "(2.8)")
 $ S \( w_j \) ⊗ Y_j arrow.r^(thin b_j dot.op - thin) Y_j arrow.r Y_(j + 1) \, $ <eq:found-cofiber-tower>]

 whose second map is the algebra map adjoining the null $e_j$. For $M = \[ \( upright("MU")_(\( p \)) \)_p \]$ and $0 lt.eq j lt.eq r + 1$, there are compatible equivalences 
#[#set math.equation(numbering: n => "(2.9)")
 $ h_Omega \( M ⊗ Y_j \) tilde.eq h_Omega \( M \) ⊗_A A \[ e_0 \, dots.h \, e_(j - 1) \] . $ <eq:found-mu-base-change>]

]
] <found:koszul-realization>

#proof[
  Each variable $e_h$ is exterior. The underlying $A$-module has the finite basis of ordered exterior monomials $e_S$ for $S subset.eq { 0 \, dots.h \, j - 1 }$. Order these subsets by the largest entry at which they differ. In the differential of $e_S$, replacing an index $h$ by indices strictly less than $h$ decreases this order; terms with a repeated index vanish. The differential therefore provides a finite-cell filtration on this basis. Proposition 9 transports the algebra and its unit to $Y_j$.
  A degree-zero cycle at weight $w_j$ represents a class in $pi_0 "map"_(cal(C)) \( S \( w_j \) \, Y_j \)$. Its product with the identity of $Y_j$ corresponds to multiplication by $b_j$ on the algebraic module. Lemma 4 identifies the extension by $e_j$, through its specified null, with the cofiber of this multiplication map. This proves Equation (2.8), including its unit and cofiber-map identifications. Finally, $Y_j$ is finite-cell, so Equation (2.6) with the other input $M$ gives Equation (2.9), compatibly with all the algebra maps and specified nulls. ◻
]

In particular, $Y_1$ is the cofiber of $pi.alt$ on the unit. The remaining task is to construct the cycles $b_1 \, dots.h \, b_n$ with the required cobordism images. The algebra structures above are available in $cal(C)$ throughout that construction. At the eventual passage to a prime we will retain only finite diagrams of classes, products, units, and cofiber sequences, as permitted by Proposition 2.

== 3 Uniform localization of permutation powers <sec:power>

The permutation power of a spectrum is multiplicative but is not exact. We construct a localization in which it becomes exact, uniformly as the prime varies. The resulting operation will take values in a graded mapping algebra with an invertible Euler parameter. In Section 4, before inverting that parameter, we will identify its cofiber with ordinary reduction modulo $pi.alt$.

For each odd prime $p$, let

$ G = G_p = C_p times.r bb(F)_p^times $

act on the $p$ elements of $bb(F)_p$ by affine transformations. Let $rho$ be its real permutation representation and let $V = rho - 1$ be the augmentation representation. We use the category of naive actions

$ cal(C)_G = product_(cal(U)) "Fun" \( B G_p \, upright("Sp")_(\( p \)) \) . $

All equivariant spheres and spaces below denote their $p$-locally stabilized sequences in this category. Put

$ T = S^V \, #h(2em) J = S \( V \)_(+) \, #h(2em) J_2 = S \( 2 V \)_(+) . $

Here $S \( V \)$ is the unit sphere, whereas $S^V$ is the one-point compactification. The two Euler cofiber sequences are

#[#set math.equation(numbering: n => "(3.1)")
 $ J arrow.r upright(bold(1)) arrow.r T \, #h(2em) J_2 arrow.r upright(bold(1)) arrow.r^(a_2) T^2 . $ <power:euler-triangles>]

Tensor powers of invertible objects may have negative exponents. We write $"Tr"$ for the functor that gives a spectrum trivial action.

#thm([Lemma 3.1.])[
  (The two localizations).  #emph[Let $cal(E)$ be the symmetric monoidal stable localization of $upright("Ind") \( cal(C)_G \)$ by the localizing tensor ideal generated by $G_(+) ⊗ X$, for all $X in cal(C)_G$. For $b gt.eq 1$, put 
$ E_b = G^(* b) \, #h(2em) tilde(E)_b = "cofib" \( E_(b +) arrow.r upright(bold(1)) \) . $

 The image of every object of $cal(C)_G$ is compact in $cal(E)$, and, for $X \, Y in cal(C)_G$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ "map"_(cal(E)) \( X \, Y \) tilde.eq "colim"_b "map"_(cal(C)_G) \( X \, tilde(E)_b ⊗ Y \) . $ <power:join-formula>]

 There is a further symmetric monoidal localization $cal(E)'$ in which $a_2$ is invertible. Its localization of an object $Y$ is represented in $cal(E)$ by 
$ "colim"_(s gt.eq 0) #scale(x: 120%, y: 120%)[\(] Y arrow.r^(a_2) T^2 Y arrow.r^(a_2) T^4 Y arrow.r dots.h.c #scale(x: 120%, y: 120%)[\)] . $

 Mapping out of a sequence object commutes with this telescope.]
] <power:localizations>

#proof[
  For fixed $b$, the free $G$-space $E_b$ has cells in dimensions $0 \, dots.h \, b - 1$. Their multiplicities can depend on $p$, but a whole prime-dependent wedge of free cells is still an induced sequence object. Thus $E_(b +) ⊗ Y$ belongs to the indicated ideal by a bounded number of stable extensions. The cone of the coaugmentation
  $ Y arrow.r "colim"_b tilde(E)_b ⊗ Y $
  therefore belongs to that ideal.
  After forgetting the action, the transition $tilde(E)_b arrow.r tilde(E)_(b + 1)$ is null: the old join cones to any chosen vertex in the new copy of $G$. Maps out of $G_(+) ⊗ X$ are tested by forgetting the action and using induction adjunction. Since these objects are compact in $upright("Ind") \( cal(C)_G \)$, the telescope is local against all the generators of the ideal. It is consequently the local reflection. The generating objects are compact, so local objects are closed under filtered colimits and the localized images of sequence objects remain compact. This proves Equation (3.2). The ideal is a tensor ideal, which gives the symmetric monoidal localization.
  For the second localization, the cone of the displayed telescope coaugmentation lies in the tensor ideal generated by the cones of $a_2 ⊗ Z$. On the telescope, multiplication by $a_2$ is an equivalence: it translates the telescope by one stage. The interchanges of the $T^2$ factors may be taken coherently trivial by Lemma 6, since $T^2$ is a square. Equivalently, one can verify the translation equivalence on maps from compact objects using this coherent grading. This proves locality and the second assertion. The cones being inverted are again generated by maps between compact objects, so the same compactness argument computes maps by the telescope. ◻
]

We will repeatedly use the following consequence of the invertibility of an isotropy-group order.

#thm([Lemma 3.2.])[
  (Prime-to-$p$ actions).  #emph[If a finite group $H$ has order prime to $p$, every naive $H$-spectrum in $upright("Sp")_(\( p \))$ is a retract of the induction of its underlying spectrum. In particular, homotopy fixed points preserve underlying lower connectivity bounds for such actions.]
] <power:prime-to-p>

#proof[
  For finite groups, induction and coinduction agree. The unit into coinduction, followed by this identification and the counit of induction, has composite multiplication by $\| H \|$. On underlying spectra this is an equivalence. Rescaling supplies the claimed retraction. Homotopy fixed points of an induced object are its underlying inducing spectrum, so the connectivity assertion follows by taking the retract. ◻
]

At each prime, permuting the factors makes $X^(⊗ p)$ a naive $G_p$-spectrum. These functors define a strong symmetric monoidal functor

$ N : cal(C) arrow.r cal(C)_G . $

The next argument is the uniform replacement for the fixed-prime exactness of the cyclic Tate tensor power #cite(label("NS2018")) Proposition III.1.1.

#thm([Lemma 3.3.])[
  (A single Euler map makes the power exact).  #emph[The composite $N : cal(C) arrow.r cal(E)'$ is exact. More precisely, for a map $f : A_0 arrow.r A_1$, form the canonical comparison in $cal(C)_G$ 
$ kappa_f : "cofib" \( N A_0 arrow.r N A_1 \) arrow.r N \( "cofib" f \) . $

 Its fiber is annihilated by one multiplication by $a_2$, simultaneously at all primes.]
] <power:exactness>

#proof[
  At a prime, index the tensor cube by subsets $L$ of the $p$ letters, with value
  $ P \( L \) = A_1^(⊗ L) ⊗ A_0^(⊗ L^c) . $
  The cofiber of the proper-face homotopy colimit mapping to $P \( bb(F)_p \) = N A_1$ is $N \( "cofib" f \)$. For example, choose a cofibration between cofibrant spectra representing $f$ in a monoidal model. The pushout-product axiom identifies the proper-face union with the homotopy colimit and its quotient with the smash of the cofibers. This calculation is compatible with the permutation action and is verified on underlying spectra.
  First quotient by the empty-face value $N A_0$. The fiber of $kappa_f$ is the homotopy colimit of
  $ "cofib" #scale(x: 120%, y: 120%)[\(] N A_0 arrow.r P \( L \) #scale(x: 120%, y: 120%)[\)] $
  over nonempty proper subsets. Indeed, after taking these cofibers, the empty face has value zero and can be omitted.
  Let $cal(P)$ be this nonempty-proper-subset poset, with its $G$-action. Consider the natural transformation on its action category from the constant sphere diagram to the diagram pulled back from $T^2$, given by $a_2$. Its space of transformations is computed by equivariant maps from the plus order complex $\| cal(P) \|_(+)$ to $T^2$: push the constant source diagram forward to $B G$. The order complex has dimension at most $p - 2$. Each simplex stabilizer has order prime to $p$, because a subgroup with $p$-torsion contains the transitive translation subgroup and cannot stabilize a nonempty proper subset. On an orbit cell, the target mapping spectrum is a homotopy fixed point spectrum of a sphere of underlying degree $2 \( p - 1 \)$. Lemma 12 preserves that connectivity. A cell of dimension $k$ shifts the lower bound to $2 \( p - 1 \) - k$. Since $k lt.eq p - 2$, the cellular filtration gives the whole mapping spectrum the lower connectivity bound
  $ 2 \( p - 1 \) - \( p - 2 \) = p > 0 . $
  Its $pi_0$ therefore vanishes, so the Euler transformation has a nullhomotopy.
  Tensor this null transformation with the diagram of cofibers and then push forward to $B G$. Tensoring with an object pulled back from $B G$ commutes with this pushforward, by distribution over colimits. Thus one copy of $a_2$ annihilates the entire intervening homotopy colimit. Although the cube dimensions grow with $p$, the Euler exponent is one at every prime. The chosen primewise nullhomotopies define a null in the germ category. After passage to $cal(E)'$, the comparison of cofibers is consequently an equivalence.
  The functor preserves zero. Preservation of these cofiber sequences implies preservation of finite pushouts in stable categories, and hence exactness. In particular the exact strong symmetric monoidal functor to $cal(E)'$ acts on stable mapping spectra, compatibly with their composition and products. One can also obtain this enrichment by extending the exact functor to a colimit-preserving functor on Ind-categories, where it commutes with tensors by spectra. ◻
]

=== 3.1 The Euler-graded mapping algebra <the-euler-graded-mapping-algebra>

The exact power now gives maps on mapping spectra. To record the Euler filtration before localization, use the index lattice

$ I = Lambda xor Lambda xor bb(Z) \, #h(2em) i = \( lambda \, delta \, m \) \, #h(2em) tau = \( 0 \, 0 \, 1 \) . $

Choose the coherent invertible grading

#[#set math.equation(numbering: n => "(3.3)")
 $ W_i = N \( S \( lambda \) \) ⊗ "Tr" S \( delta \) ⊗ T^(- 2 m) . $ <power:W>]

The first two factors use the sphere gradings already chosen in Section 2; the last uses Lemma 6. At the primes, the corresponding representation sphere has virtual representation

$ d \( lambda \) rho + d \( delta \) - 2 m V . $

Let $\( X_p \)_p$ be a sequence of $Lambda$-graded spectra; an ungraded input is taken constant at all weights. Define

#[#set math.equation(numbering: n => "(3.4)")
 $ B \( X \)_i = "map"_(cal(E)) (W_i \, "Tr" #scale(x: 120%, y: 120%)[\(] X_p \( p lambda + delta \) #scale(x: 120%, y: 120%)[\)]_p) . $ <power:B>]

If the input consists of graded commutative algebras, tensoring maps and then applying their multiplication makes $B \( X \)$ a rational $I$-graded commutative algebra. The unit and the adjoint $T^(- 2) arrow.r upright(bold(1))$ of $a_2$ give a homogeneous class

$ t in pi_0 B \( X \)_tau . $

Multiplication by $t$ is the Euler precomposition $B \( X \)_(i - tau) arrow.r B \( X \)_i$. These polynomial actions are compatible with algebra maps in $X$: take the class first for the graded sphere unit supported at weight zero and then apply the algebra unit.

#thm([Lemma 3.4.])[
  (Euler inversion and ordinary scalars).  #emph[Replacing $cal(E)$ by $cal(E)'$ in Equation (3.4) gives the algebra $B \( X \) \[ t^(- 1) \]$. At $lambda = m = 0$, trivial action gives a natural algebra map on the $delta$-grading 
$ h_Lambda \( X \) arrow.r B \( X \)_(0 \, * \, 0) . $

 We call this the scalar action in the $delta$ direction.]
] <power:graded-localization>

#proof[
  At an index $i$, algebraic inversion of $t$ takes the telescope of $B \( X \)_(i + s tau)$. Moving the factor $T^(- 2 s)$ from the source to the target identifies it with the mapping telescope into $T^(2 s)$ times the target. Lemma 11 and compactness identify this with the mapping spectrum in $cal(E)'$. These identifications respect multiplication by the coherent tensor powers of $T^2$. For the second assertion, at $\( 0 \, delta \, 0 \)$ the source sphere is $"Tr" S \( delta \)$, and the map is simply the one induced by the symmetric monoidal trivial-action functor. ◻
]

#thm([Proposition 3.5.])[
  (The unnormalized power).  #emph[For a sequence of actual primewise $Lambda$-graded commutative algebras, there is a natural map of graded commutative algebras over rational spectra 
#[#set math.equation(numbering: n => "(3.5)")
 $ P_X : h_Lambda \( X \) arrow.r B \( X \) \[ t^(- 1) \]_(* \, 0 \, 0) . $ <power:raw-operation>]

 On a represented degree-zero class, its value is obtained by taking the permuted $p$-fold smash and then multiplying the $p$ factors. In particular, that value has this represented class in $B \( X \)$ before Euler inversion. No $D$-linearity is asserted for $P_X$.]
] <power:operation>

#proof[
  Apply the exact functor of Lemma 13 to mapping spectra out of $S \( lambda \)$, and then use
  $ N #scale(x: 120%, y: 120%)[\(] X_p \( lambda \) #scale(x: 120%, y: 120%)[\)] arrow.r "Tr" X_p \( p lambda \) . $
  The latter map is the $p$-ary multiplication. It is equivariant, coherently permutation invariant, and compatible with multiplying tuples, by the commutative algebra structure at each prime. It can equivalently be read from the algebra codiagonal, since tensor product is the coproduct of commutative algebras. The exact strong monoidal mapping-spectrum construction and these coherent multiplications give the asserted algebra map. Naturality holds for actual primewise algebra maps. The description on represented classes follows before localization from the same construction. Rational linearity follows from stable enrichment and rationality of the mapping spectra; the operation can change the action of the larger scalar ring $D$. ◻
]

Only primewise commutative algebra inputs will be used in Proposition 15. In particular, it does not assert primewise commutative algebra structures on the objects $Y_j$ of the Koszul construction.

== 4 The Euler layer and ordinary reduction <sec:layer>

We identify the cofiber of the Euler parameter in the mapping algebra of Section 3. The comparison will be multiplicative and will respect both ordinary scalar classes and the particular null used to form the cofiber. These compatibilities allow a later algebra attachment to determine an actual class in a Koszul object.

Define the additive map $F : I arrow.r Omega$ by

$ F \( w_h^(\( lambda \)) \) = w_(h + 1) - w_1 \, #h(2em) F \( w_h^(\( delta \)) \) = w_h \, #h(2em) F \( tau \) = - w_1 . $

Recall that $q = d_1 = 2 \( p - 1 \)$. The ordinary degrees satisfy

#[#set math.equation(numbering: n => "(4.1)")
 $ d \( F i \) = p thin d \( lambda \) + d \( delta \) - q m #h(2em) \( i = \( lambda \, delta \, m \) \) . $ <layer:degree>]

Here $lambda$ records the source of the permutation power, $delta$ the ordinary scalar shift, and $m$ the Euler shift. The map $F$ records the resulting ordinary source sphere. In particular, for $0 lt.eq j < n$,

$ F \( w_j \, 0 \, - 1 \) = w_(j + 1) \, #h(2em) d #scale(x: 120%, y: 120%)[\(] F \( w_j \, 0 \, - 1 \) #scale(x: 120%, y: 120%)[\)] = p d_j + q = d_(j + 1) . $

This is the sphere degree required for the next attaching class. At this index a graded target is still evaluated at $p w_j$, as in $B \( X \)$; $F$ specifies the source sphere.

For a graded sequence $X$, set

$ Q \( X \)_i & = "map"_(cal(C)) (S \( F i \) \, #scale(x: 120%, y: 120%)[\(] X_p \( p lambda + delta \) #scale(x: 120%, y: 120%)[\)]_p) \,\
Phi \( X \)_i & = "map"_(cal(E)) (W_i \, J^or ⊗ "Tr" #scale(x: 120%, y: 120%)[\(] X_p \( p lambda + delta \) #scale(x: 120%, y: 120%)[\)]_p) . $

The stable dual $J^or$ is a commutative algebra by the diagonal of $S \( V \)$. Thus these are graded algebras when $X$ is. We will compare $B \( X \) \/ \/ t$ with $Phi \( X \)$, and then compute $Phi \( X \)$ as the reduction of $Q \( X \)$ by $pi.alt$.

=== 4.1 The sphere with affine action <the-sphere-with-affine-action>

#thm([Lemma 4.1.])[
  (Acyclicity of the Borel sphere).  #emph[For every odd prime $p$, the space $Z_p^(upright("orb")) = S \( V \)_(h G_p)$ has the $p$-local homology of a point. Its stabilized augmentation to the $p$-local sphere is an equivalence.]
] <layer:acyclic-sphere>

#proof[
  The two-periodic resolution of $C_p$ gives
  $ H^(*) \( B C_p \; bb(F)_p \) = Lambda \( eta \) ⊗ bb(F)_p \[ xi \] \, #h(2em) \| eta \| = 1 \, quad \| xi \| = 2 . $
  The class $xi$ is the Bockstein of $eta$, or equivalently the reduction of a first Chern class. Under an automorphism of $C_p$, both classes transform with multiplier weight one, up to replacing the character by its inverse throughout. As a $C_p$-representation, $V$ is a sum of $\( p - 1 \) \/ 2$ nontrivial complex lines. Its Euler class is a nonzero scalar times $xi^(\( p - 1 \) \/ 2)$. The sphere-bundle sequence therefore gives
  $ H^(*) \( S \( V \)_(h C_p) \; bb(F)_p \) = Lambda \( eta \) ⊗ bb(F)_p \[ xi \] \/ #scale(x: 120%, y: 120%)[\(] xi^(\( p - 1 \) \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  Every positive-degree monomial has multiplier weight strictly between zero and $p - 1$. Passage to $G$ takes invariants under $bb(F)_p^times$, whose order is invertible in $bb(F)_p$, so only the degree-zero class remains.
  The $p$-local homology is finitely generated in every degree, since the group is finite and the sphere is finite dimensional. The universal coefficient sequence and Nakayama’s lemma now imply that its reduced $bb(Z)_(\( p \))$-homology vanishes. The augmentation cofiber is bounded below; the stable Hurewicz theorem applied to its first possible nonzero homotopy group makes it contractible. ◻
]

#thm([Lemma 4.2.])[
  (Even spherical trivializations).  #emph[For every even integer $r$, including negative integers, the local $p$-local sphere of $r V$ over $Z_p^(upright("orb"))$ is trivializable with fiber degree $r \( p - 1 \)$. Consequently there are coherent $J^or$-module equivalences 
#[#set math.equation(numbering: n => "(4.2)")
 $ J^or ⊗ W_i tilde.eq J^or ⊗ "Tr" S \( F i \) #h(2em) \( i in I \) . $ <layer:oriented-W>]

 They may be chosen to agree with the given trivial identifications on the $delta$ summand, and they remain equivalences after localization.]
] <layer:even-trivializations>

#proof[
  For even $r$, the determinant character of $r V$ is trivial. After fixing the fiber degree, its classifying map to the classifying space of sphere automorphisms lifts to the simply connected cover. All higher homotopy groups of this cover are $p$-local abelian groups. By Lemma 16, reduced cohomology of $Z_p^(upright("orb"))$ with every such constant coefficient group vanishes. Induction along the Eilenberg–Mac Lane fibers of the Postnikov tower shows that the corresponding based mapping spaces are contractible. Mapping into the limit gives a based null of the classifying map. Dualization handles virtual negative multiples as well.
  Maps between free twisted rank-one $J^or$-modules are sections of the corresponding sphere mapping local system over $S \( V \)_(h G)$. Indeed, this follows from free-module adjunction and duality for $S \( V \)_(+)$; composition of these maps is pointwise composition of sections. The trivializations just constructed therefore give the required module equivalences primewise on generators. In $W_i$, the twisting exponent of $V$ is $d \( lambda \) - 2 m$, which is even, and its total underlying dimension is Equation (4.1). Apply Lemma 6 in the rational category of $J^or$-modules in $upright("Ind") \( cal(C)_G \)$ to extend the generator equivalences coherently over $I$. All the required generator objects are squares. The relative assertion in that lemma keeps the $delta$ identifications fixed. Finally apply the symmetric monoidal localization. ◻
]

In particular, free-module adjunction allows the coherent replacement of $W_i$ by $"Tr" S \( F i \)$ in the definition of $Phi \( X \)$. It remains to compute maps into $J^or$ with trivial coefficients. We retain a bounded-join orbit term in this computation; replacing it by full homotopy orbits before taking the ultraproduct would lose the required uniform information.

=== 4.2 The partial norm calculation <the-partial-norm-calculation>

For $U = \( U_p \)_p in cal(C)_G$, define spectra

$ "Part" \( U \) & = "colim"_b product_(cal(U)) \( E_(b +) ⊗ U_p \)_(h G_p) \,\
"Full" \( U \) & = product_(cal(U)) U_p^(h G_p) . $

Ultraproducts of spectra in these formulas mean filtered colimits of products. The first construction uses the fixed finite join stages; the second takes the full homotopy fixed points at each prime.

#thm([Lemma 4.3.])[
  (The partial and full norm model).  #emph[There is a natural cofiber sequence 
#[#set math.equation(numbering: n => "(4.3)")
 $ "Part" \( U \) arrow.r "Full" \( U \) arrow.r "map"_(cal(E)) \( upright(bold(1)) \, U \) . $ <eq:norm-triangle>]

 The first map is projection from a join stage followed by the norm. The norm is an equivalence on induced spectra and on their finite stable extensions. On underlying fibers, fiber inclusion followed by norm and evaluation is the sum of the group actions.]
] <layer:norm-model>

#proof[
  For a finite group, the norm is the natural map from homotopy orbits to homotopy fixed points; see #cite(label("NS2018")) Definition I.1.10 and Example I.1.11. One concrete description uses the group ring spectrum $cal(H) = S_(\( p \)) \[ G \]$. To specify its derived construction, regard $cal(H)$ as a $G times G$-spectrum with action $\( g \, h \) dot.op k = g k h^(- 1)$. It is induced from the trivial sphere along the diagonal subgroup $Delta G$. Finite induction agrees with coinduction, so the unit of restriction–coinduction gives a map from the trivial $G times G$-sphere to $cal(H)$. On underlying spectra this is the diagonal into the finite product of spheres. Equivalently, it is the $cal(H)$-bimodule norm-element map that sums all group elements.
  Take its derived tensor over the right $cal(H)$-action with $U_p$. The remaining left action makes the resulting map from the trivially acted-on spectrum $S_(\( p \)) ⊗_(cal(H)) U_p$ to $U_p$ equivariant. Its adjoint is
  $ S_(\( p \)) ⊗_(cal(H)) U_p arrow.r "map"_(cal(H)) \( S_(\( p \)) \, U_p \) . $
  In particular, composing the inclusion of an underlying fiber with this map and then evaluating at a point sums the group actions. On an induced object $cal(H) ⊗ Z$, the orbit and fixed-point adjunctions identify both sides with $Z$; the diagonal entry at the identity element identifies the norm with $"id"_Z$. Both functors are exact, so the same equivalence holds on finite stable extensions of induced objects; compare #cite(label("NS2018")) Lemma I.3.8.
  Apply this to $E_(b +) ⊗ U_p$, whose equivariant cellular filtration consists of free cells. The join triangle, followed by homotopy fixed points, thus identifies its first term with homotopy orbits. Take the ultraproduct and then the colimit in $b$. Equation (3.2) identifies the last term, giving Equation (4.3). ◻
]

#thm([Lemma 4.4.])[
  (Partial Thom spectra with arbitrary coefficients).  #emph[Let $Z = \( Z_p \)_p$ be any sequence of $p$-local spectra, without connectivity or boundedness assumptions. Let $r = \( r_p \)_p$ be a sequence of integers of fixed parity. If $r$ is odd, then 
$ "Part" \( T^r "Tr" Z \) = 0 . $

 If $r$ is even, inclusion of a fiber point at the identity vertex of $E_b$ induces an equivalence 
$ product_(cal(U)) \( T_p^(r_p) ⊗ Z_p \) arrow.r^tilde.eq "Part" \( T^r "Tr" Z \) \, $

 where the source has forgotten the group action.]
] <layer:partial-thom>

#proof[
  First omit $Z_p$. The partial Thom spectrum $\( E_(b +) ⊗ T_p^(r_p) \)_(h G)$ has cells in degrees $0 \, dots.h \, b - 1$ relative to $r_p \( p - 1 \)$. This assertion also applies to a virtual representation, after shifting by its virtual dimension. Since $E_b$ is $\( b - 2 \)$-connected, its Thom homology in relative degrees less than $b - 1$ agrees with group homology with coefficient $bb(F)_p \( det^(r_p) \)$.
  For fixed $b$ and sufficiently large $p$, these group homology groups consist only of degree zero when $r_p$ is even, and vanish in this range when $r_p$ is odd. To see this, use the cyclic-group generators $eta \, xi$ from Lemma 16 and take multiplier invariants; the corresponding homology calculation is its degreewise dual. The sign of the multiplier permutation by $alpha$ is $alpha^(\( p - 1 \) \/ 2)$ modulo $p$, as follows by applying the permutation to the Vandermonde product. Thus the odd determinant twist shifts the required multiplier weight by $\( p - 1 \) \/ 2$. For a fixed degree range this weight, and every positive untwisted invariant weight, eventually lies beyond that range.
  In the even case, choose the identity vertex in the first join factor at every stage. The fiber-point inclusions then commute with the maps from stage $b$ to stage $b + 4$, and hence induce maps of their cofibers. Take these cofibers as remainders; in the odd case, keep the entire partial Thom spectrum. For $b gt.eq 2$ each remainder is a finite $p$-local cell spectrum with relative cells in degrees at most $b - 1$, and it has no $p$-local homology below degree $b - 1$. Here mod-$p$ vanishing gives $p$-local vanishing because the homology groups are finitely generated. Stable Hurewicz after desuspension therefore gives the same lower connectivity bound. The remainder at $b + 4$ is connective in relative degree $b + 3$, so the transition from the remainder at $b$ to the remainder at $b + 4$ is null by comparison with the source cell dimensions. This null holds at almost all primes for each fixed $b$.
  The common virtual dimension shift does not affect the argument, even if $r_p$ varies without bound. Moreover the transition remains null after smashing with any $Z_p$. Since $Z_p$ has trivial action, this smash commutes with the homotopy orbit construction. The remainder telescope is consequently zero after the ultraproduct. The compatible fiber-point maps in the even case give the asserted equivalence. ◻
]

Write $cal(H) \( Z \) = "map"_(cal(C)) \( upright(bold(1)) \, Z \)$ for an ordinary sequence. We next compute the whole $J^or$ coefficient object, with its multiplication rather than only its homotopy groups.

#thm([Lemma 4.5.])[
  (The coefficient algebra of the layer).  #emph[For every ordinary sequence $Z$, external multiplication is an equivalence 
#[#set math.equation(numbering: n => "(4.4)")
 $ "map"_(cal(E)) \( upright(bold(1)) \, J^or \) ⊗_D cal(H) \( Z \) arrow.r^tilde.eq "map"_(cal(E)) \( upright(bold(1)) \, J^or ⊗ "Tr" Z \) . $ <layer:external-product>]

 The unit-input algebra is equivalent, as a commutative $D$-algebra, to $D \/ \/ pi.alt$. Under the point and unit identifications of the partial and full terms, the first map of Equation (4.3) for $J^or ⊗ "Tr" Z$ is multiplication by $\( p \( p - 1 \) \)_p$ on $cal(H) \( Z \)$.]
] <layer:coefficient-algebra>

#proof[
  Dualizing the first Euler triangle gives
  $ T^(- 1) arrow.r upright(bold(1)) arrow.r J^or . $
  Lemma 19 and exactness identify $"Part" \( J^or "Tr" Z \)$ with $cal(H) \( Z \)$, using the fiber point and the unit of $J^or$. On the other hand,
  $ \( J_p^or ⊗ "Tr" Z_p \)^(h G_p) tilde.eq "map" #scale(x: 120%, y: 120%)[\(] S \( V \)_(h G_p +) \, Z_p #scale(x: 120%, y: 120%)[\)] tilde.eq Z_p $
  by Lemma 16. Evaluation at a point is the inverse of the constant-class equivalence. By Lemma 18, norm followed by this evaluation on the constant-unit copy sums all group actions. It is therefore multiplication by $\| G_p \| = p \( p - 1 \)$.
  To check Equation (4.4), pair the norm triangle for $J^or$ with $cal(H) \( Z \)$ by tensoring trivial maps. Do this first on the partial homotopy fixed point terms, before using their norm identifications with homotopy orbits. These pairings are balanced over $D$, acting by trivial sphere scalars, and give a map of the entire join triangles. Passage to the telescope gives the localization pairing on their cofibers.
  The comparisons on the first two terms are equivalences. For the partial term, the point-and-unit class at $Z = upright(bold(1))$, followed by the norm, multiplies a class from $cal(H) \( Z \)$ to the corresponding point-and-unit-norm class for $Z$, by naturality at each prime. Lemma 19, also applied to suspended sphere classes, identifies this generator with the free rank-one $D$-module and identifies its external product with $cal(H) \( Z \)$. For the full term the same assertion follows from the constant generator. Exactness gives the equivalence on cofibers.
  At $Z = upright(bold(1))$, both initial terms are $D$ in degree zero, and their map is multiplication by $pi.alt \( p - 1 \)_p$. The factor $\( p - 1 \)_p$ is a unit and $pi.alt$ is a nonzerodivisor. The cofiber algebra thus has homotopy only in degree zero, equal to $D \/ pi.alt$, and its unit induces the quotient map. Choose a null of $pi.alt$ in this algebra. The resulting algebra map from $D \/ \/ pi.alt$ is an equivalence on underlying modules, hence an algebra equivalence. ◻
]

The coefficient computation identifies the proposed layer after trivializing its source spheres. To compare it with the Euler cofiber, we must still show that the restriction from $S \( 2 V \)$ to $S \( V \)$ loses nothing. The following odd-twist vanishing supplies that step.

#thm([Lemma 4.6.])[
  (Odd twists vanish in the layer).  #emph[For every ordinary sequence $Z$ and every sequence of odd integers $r = \( r_p \)_p$, 
$ "map"_(cal(E)) \( upright(bold(1)) \, T^r J^or "Tr" Z \) = 0 . $

]
] <layer:odd-vanishing>

#proof[
  The dual Euler triangles give $J^or tilde.eq Sigma T^(- 1) J$. It suffices to apply Equation (4.3) to $T^(r - 1) J "Tr" Z$ and show that its first map is an equivalence.
  At each prime, $S \( V \)$ has a finite equivariant cell decomposition with prime-to-$p$ stabilizers. One may use the boundary of the permutation simplex: a subgroup with $p$-torsion has no fixed point in $S \( V \)$. Induction from each such stabilizer is $p$-locally a retract of free induction by Lemma 12. The ordinary full orbit-to-fixed-point norm on $T^(r - 1) J "Tr" Z$ is therefore an equivalence, by its finite equivariant cellular filtration.
  Its full homotopy orbit spectrum is identified with the underlying fiber by inclusion of a fiber point: $r - 1$ is even, so use the trivialization of Lemma 17, followed by the acyclic augmentation of Lemma 16. Its partial orbit spectrum is identified by the same point. Indeed projection $J arrow.r upright(bold(1))$ and the Euler triangle reduce that assertion to the even calculation for $T^(r - 1) "Tr" Z$ and the odd vanishing for $T^r "Tr" Z$ in Lemma 19. The projection from partial to full orbits respects these fiber-point maps, so it is an equivalence. Composing with the full norm proves the assertion. ◻
]

=== 4.3 The multiplicative comparison and completion <the-multiplicative-comparison-and-completion>

#thm([Proposition 4.7.])[
  (The multiplicative Euler layer).  #emph[For every sequence of graded commutative algebras $X$, there are natural product-compatible equivalences 
#[#set math.equation(numbering: n => "(4.5)")
 $ B \( X \) \/ \/ t arrow.r^tilde.eq Phi \( X \) arrow.l^tilde.eq Q \( X \) ⊗_D \( D \/ \/ pi.alt \) . $ <eq:layer>]

 The right-hand comparison applies to arbitrary spectrum inputs as well. The scalar action in the $delta$ direction agrees with ordinary evaluation on $Q \( X \)$ followed by reduction. The comparisons are compatible with algebra units and maps of inputs. The first map uses the tautological Euler null on $S \( 2 V \)$, restricted to $S \( V \)$.]
] <layer:comparison>

#proof[
  For the right-hand equivalence, replace $W_i$ coherently by $"Tr" S \( F i \)$ using Lemma 17 and free-module adjunction. Apply Equation (4.4) with the target shifted by $S \( - F i \)$. Multiplication of the coefficient algebra at index zero with ordinary maps from these spheres gives the comparison in every degree and weight. The same construction respects all products, since the sphere trivializations are coherent and the external pairing is multiplication in the mapping algebra. The chosen agreement on the $delta$ summand makes its scalar action ordinary evaluation. Naturality in targets is built into all of these maps. In particular no algebra structure on the target is needed for the underlying coefficient comparison.
  For the left-hand equivalence, first replace $J^or$ by $J_2^or$ in the definition of $Phi \( X \)$. In that algebra, null $t$ by the tautological Euler null on $S \( 2 V \)$, multiplied by the target unit. Concretely the tautological nonzero vector gives a radial path from the zero section of the disk bundle to its boundary, which becomes the point at infinity in the representation sphere. This is the null in the dual Euler triangle
  $ T^(- 2) arrow.r upright(bold(1)) arrow.r J_2^or . $
  The universal property of the algebra quotient gives an algebra map from $B \( X \) \/ \/ t$ to this $J_2^or$ mapping algebra.
  We verify its underlying map with the null specified, since the existence of some module equivalence would not suffice. By Lemma 4, its source is the cofiber of multiplication by $t$, and the map on the added module cell is the chosen null multiplied by the input from $B \( X \)_(i - tau)$. The coherent identifications of $W_tau$, $W_(i - tau)$, and $W_i$ identify multiplication by $t$ with the map obtained from $T^(- 2) arrow.r upright(bold(1))$ and the target unit. The multiplied null is, by the same unitality, the geometric null in the dual Euler triangle tensored with the target. The original input maps are constant along $S \( 2 V \)$. Exactness consequently identifies this particular map with the cofiber equivalence
  #[#set math.equation(numbering: n => "(4.6)")
   $ "cofib" #scale(x: 120%, y: 120%)[\(] B \( X \)_(i - tau) arrow.r^t B \( X \)_i #scale(x: 120%, y: 120%)[\)] tilde.eq "map"_(cal(E)) (W_i \, J_2^or ⊗ "Tr" #scale(x: 120%, y: 120%)[\(] X_p \( p lambda + delta \) #scale(x: 120%, y: 120%)[\)]_p) . $ <layer:chosen-null-cofiber>]
  Now restrict along the inclusion of the first copy $S \( V \) arrow.r S \( 2 V \)$. Its quotient is stably $T ⊗ J$: the open complement with nonzero second component is an open $V$-ball times $S \( V \)$, and its one-point compactification gives this description. After dualizing, the fiber of restriction therefore has an extra factor $T^(- 1) J^or$. Every $W_i$ has even twisting exponent in $V$, so moving it to the target leaves an odd twist. Lemma 21 makes this fiber zero, including any ordinary sphere shift. Restriction is thus an equivalence. Its composite with Equation (4.6) proves the first map of Equation (4.5). All choices of nulls have been multiplied with units and transported by the stated maps, so the construction has the claimed unit and target compatibilities. ◻
]

#thm([Corollary 4.8.])[
  (The first Koszul layer).  #emph[For constant input $upright(bold(1))$, the comparison identifies 
$ B \( upright(bold(1)) \) \/ \/ t tilde.eq F^(*) h_Omega \( Y_1 \) $

 as graded algebras. For $M = \( upright("MU")_(\( p \)) \)_p$ there is a compatible identification 
$ B \( M \) \/ \/ t tilde.eq F^(*) h_Omega \( M ⊗ Y_1 \) . $

 These identifications preserve the algebra maps induced by the unit and the scalar action in the $delta$ direction.]
] <layer:first-koszul>

#proof[
  For constant input $X$, $Q \( X \) = F^(*) h_Omega \( X \)$. The first Koszul attachment kills $b_0 = pi.alt u_0$. Its quotient is base change by $D \/ \/ pi.alt$: send the null of $b_0$ to $u_0$ times the null of $pi.alt$. The chosen-null cofiber description and Proposition 9 give this identification also after tensoring with $M$. Scalar base change supported in weight zero is componentwise tensor on the other input, so it commutes with the pullback of weights by $F$. Apply Proposition 22 and its unit compatibility. ◻
]

#thm([Lemma 4.9.])[
  (Derived Euler completion).  #emph[For a rational graded commutative algebra $C$ with a homogeneous chain-degree-zero polynomial class $t$, define 
$ hat(C) = lim_(s gt.eq 1) C \/ \/ t^s \, $

 using the natural derived polynomial quotient maps. For every $r gt.eq 1$, the natural map induces an equivalence 
$ hat(C) \/ \/ t^r tilde.eq C \/ \/ t^r . $

 Thus $hat(C)$ is complete for derived reduction by powers of $t$. Any algebra extension whose underlying $hat(C)$-module is perfect is complete as well. In particular these statements apply to $hat(B) \( X \) = lim_s B \( X \) \/ \/ t^s$.]
] <layer:completion>

#proof[
  Derived reduction modulo $t^r$ is tensoring over the polynomial algebra with its two-term perfect quotient. It commutes with limits. After this reduction, the cones of the maps from the initial module $C$ to its quotients modulo $t^s$ form a pro-zero tower: their transitions are multiplications by $t$ on the corresponding shifts, and any $r$ consecutive transitions are null because $t^r$ has its quotient nullhomotopy. Their inverse limit is zero. Taking the limit of the reduced quotient maps therefore gives the asserted equivalence. Applying this for all $r$ proves completeness of $hat(C)$. A perfect $hat(C)$-module is dualizable; tensoring it commutes with this limit and with the finite quotient cofibers. The same calculation proves the final assertion. ◻
]

== 5 Universal coefficients for successive cycles <sec:universal>

The power construction applies to commutative algebras defined at the individual primes. Our successive Koszul algebras, however, need only exist in the rational mapping category. We connect these settings by constructing a universal algebra for the coefficients of finitely many cycles. Its generators have positive formal mass. This permits both a rational comparison at fixed weights and a calculation of the same primewise models at weights that increase with the prime.

Fix $0 lt.eq a < n$, and suppose that cycles $b_j$, for $0 lt.eq j lt.eq a$, have been chosen in the successive strict extensions $A \[ e_0 \, dots.h \, e_(j - 1) \]$ of Section 2. Here $\| e_j \|_(upright("chain")) = 1$, $"wt" \( e_j \) = w_j$, and $partial e_j = b_j$. In particular, $b_0 = pi.alt u_0$. We write $\[ j \) = { 0 \, dots.h \, j - 1 }$ and take every exterior monomial $e_S$ in increasing order of its indices. All signs below are the signs of the homological grading; the formal lattice contributes no additional sign.

=== 5.1 The coefficient algebra and its filtration <the-coefficient-algebra-and-its-filtration>

#prodef([Definition 5.1.])[
  The graded algebra underlying $R^a$ is the free graded-commutative $D$-algebra on variables
  $ z_(j \, S) \, #h(2em) 0 lt.eq j lt.eq a \, quad S subset.eq \[ j \) \, #h(2em) \| z_(j \, S) \|_(upright("chain")) = - \| S \| \, #h(2em) "wt" \( z_(j \, S) \) = gamma_(j \, S) := w_j - sum_(h in S) w_h . $
  Set
  $ b_j^u = sum_(S subset.eq \[ j \)) z_(j \, S) e_S \, #h(2em) partial e_j = b_j^u . $
  The differential on $R^a$ is determined by $partial b_j^u = 0$, with coefficients compared in the exterior basis. Define
  $ K_(-)^a = R^a \[ e_j : j < a \] \, #h(2em) K^a = R^a \[ e_j : j lt.eq a \] . $
  The superscript $u$ indicates these universal cycles.
] <universal:coefficients>

For example, when $n gt.eq 2$ the stage $a = 1$ has universal cycles

$ b_0^u = z_(0 \, nothing) \, #h(2em) b_1^u = z_(1 \, nothing) + z_(1 \, { 0 }) e_0 . $

The coefficient $z_(1 \, { 0 })$ has chain degree $- 1$, whereas the two empty-subset coefficients have chain degree zero. The cycle equations require

$ partial z_(0 \, nothing) = partial z_(1 \, { 0 }) = 0 \, #h(2em) partial z_(1 \, nothing) = z_(1 \, { 0 }) z_(0 \, nothing) . $

Indeed, differentiating $z_(1 \, { 0 }) e_0$ introduces a minus sign, so these identities give $partial b_1^u = 0$. The differential on the coefficient algebra records the condition that the prescribed expression be a cycle after the earlier null $e_0$ has been adjoined. An actual evaluation may send some of these coefficients to zero.

#thm([Lemma 5.2.])[
  #emph[Definition 25 determines dg algebras $R^a$, $K_(-)^a$, and $K^a$. The differential of each $z_(j \, S)$ is decomposable and uses only earlier generators when the generators are ordered by increasing $j$ and, for a fixed $j$, by decreasing binary order on subsets of $\[ j \)$. There is a dg algebra evaluation 
#[#set math.equation(numbering: n => "(5.1)")
 $ R^a arrow.r A \|_Lambda = h_Lambda \( upright(bold(1)) \) $ <universal:evaluation>]

 that sends $z_(j \, S)$ to the coefficient of $e_S$ in $b_j$. The constructions and evaluations extend those at every earlier stage.]
] <universal:triangular>

#proof[
  Binary order compares two subsets at their largest differing index. In a term of $partial e_S$, one replaces an index $h in S$ by a subset of $\[ h \)$. If the resulting exterior monomial is nonzero, its index set is strictly smaller than $S$ in binary order. Therefore the coefficient equation for $e_U$ in $partial b_j^u$ expresses $partial z_(j \, U)$ in terms of coefficients $z_(j \, S)$ with $S > U$ and coefficients $z_(h \, T)$ with $h < j$. The signs are fixed by
  $ partial \( z_(j \, S) e_S \) = \( partial z_(j \, S) \) e_S + \( - 1 \)^(\| S \|) z_(j \, S) partial e_S . $
  Each nonzero summand in the expression for $partial z_(j \, U)$ contains one coefficient of each of these two kinds. It is thus decomposable, with the required triangular ordering.
  Inductively suppose that $partial^2 e_h = 0$ for $h < j$. The square of an odd derivation is a derivation, since its mixed terms cancel. Applying $partial$ to $partial b_j^u = 0$ consequently gives
  $ 0 = partial^2 b_j^u = sum_(S subset.eq \[ j \)) \( partial^2 z_(j \, S) \) e_S . $
  Independence of the exterior basis gives $partial^2 z_(j \, S) = 0$ for every $S$, and the defining cycle equation gives $partial^2 e_j = 0$. This proves the assertion by induction. The actual coefficients of $b_j$ satisfy precisely these equations, so they define Equation (5.1); in particular $z_(0 \, nothing)$ maps to $pi.alt u_0$. All equations for an earlier stage are retained when a new value of $j$ is added. ◻
]

Define an additive mass function on $Lambda$ by $sigma \( w_i \) = 3^i$. Every displayed generator has strictly positive integral mass, since

#[#set math.equation(numbering: n => "(5.2)")
 $ sigma \( gamma_(j \, S) \) gt.eq 3^j - sum_(h < j) 3^h = frac(3^j + 1, 2) > 0 \, #h(2em) sigma \( w_j \) = 3^j > 0 . $ <universal:positive-mass>]

Give each generator $z_(j \, S)$ and $e_j$ length one. We filter $R^a$, $K_(-)^a$, and $K^a$ decreasingly by length: $cal(F)_s$ is spanned by monomials of length at least $s$. At a fixed weight $gamma$, the filtration vanishes for $s > sigma \( gamma \)$ and is constant for $s lt.eq 0$. In particular it is bounded at each weight.

#thm([Lemma 5.3.])[
  #emph[The length filtrations are dg filtrations. The associated graded algebra $"gr" R^a$ has zero differential, and in $"gr" K^a$ one has 
$ partial e_j = z_(j \, nothing) . $

 As a filtered $R^a$-module, $K^a$ is built by finitely many free cells indexed by the subsets $S subset.eq { 0 \, dots.h \, a }$, in increasing binary order. The cell $e_S$ has chain degree $\| S \|$, weight $sum_(h in S) w_h$, and filtration order $\| S \|$. In particular, $K^a$ and $K_(-)^a$ are perfect $R^a$-modules.]
] <universal:filtered-cells>

#proof[
  The differential of a coefficient generator increases length, by Lemma 26. The summand $z_(j \, S) e_S$ of $partial e_j$ has length $1 + \| S \|$, so only $S = nothing$ contributes at the original length one. For the module cell $e_S$, differentiating one factor $e_h$ and using the term indexed by $T subset.eq \[ h \)$ gives total length $\| S \| + \| T \|$. This is at least $\| S \|$, and the resulting exterior basis vector is earlier in binary order. Thus the differential is a filtered attachment to earlier module cells. There are $2^(a + 1)$ basis vectors, including the initial one indexed by the empty set. ◻
]

=== 5.2 Filtered models at the primes <filtered-models-at-the-primes>

The primewise models have two distinct roles. The coefficient algebras $R_p^a$ will be actual commutative algebras, so their permutation powers are defined. The objects $K_p^a$ will be finite-cell modules over them; their role is to test vanishing at weights growing with $p$. They need no primewise algebra structure. The rational Koszul algebra $K^a$ already has a commutative algebra structure, which will supply the Amitsur construction in Section 7.

We retain the positive-mass filtration in both primewise models. A filtered object is a diagram $cal(F)_s arrow.r cal(F)_(s - 1)$ indexed by $s in bb(Z)$, with convolution tensor product along addition. A step at order $s$ is constant at indices at most $s$ and zero at larger indices. The tensor product of steps at orders $s$ and $t$ is a step at order $s + t$.

We use filtrations supported in the weight monoid generated by the relevant generator weights, constant below order zero, and zero at orders greater than $sigma \( gamma \)$ in weight $gamma$. These conditions are preserved by colimits and tensor products. For tensor products, one may decompose a bounded filtration in each weight into finitely many extensions of steps, starting at its highest nonzero order. On steps the assertion follows from additivity of mass and of filtration order.

#thm([Lemma 5.4.])[
  #emph[On filtered spectra, the functor 
$ \( "gr" cal(F) \)_s = "cofib" \( cal(F)_(s + 1) arrow.r cal(F)_s \) $

 preserves colimits and is symmetric monoidal. It therefore preserves free commutative algebras and algebra pushouts. The comparison 
$ h_Lambda \( "gr" X_p \) tilde.eq "gr" h_Lambda \( X_p \) $

 respects the algebra and module pairings whenever they are present.]
] <universal:associated-graded>

#proof[
  The associated graded pairing is obtained by taking the cofiber of the pushout-product of the filtration arrows. On steps this gives the claimed tensor equivalence. Steps generate the filtered category under colimits, and both constructions preserve colimits, so the equivalence holds in general, with its symmetric monoidal compatibilities. The assertions for free algebras and their pushouts follow.
  For the last assertion, fix a finite tuple of weights and filtration orders. The tensor cube for the filtration arrows maps to the arrow at the sum of those orders: every vertex with at least one order increased maps into filtration at least one higher than that sum. Taking the cube’s pushout-product and cofiber constructs the associated graded pairing. The exact lax pairings defining $h_Lambda$ commute with these finite cofibers and produce the same construction. This verifies the assertion for all finite tuples, together with the compatibility under composition of pairings. It does not require $h_Lambda$ to commute with infinite filtration colimits. ◻
]

#thm([Proposition 5.5.])[
  #emph[For the chosen cycles through $b_a$, there exist the following data as germs along $cal(U)$:]
  + #emph[Filtered $Lambda$-graded commutative ring spectra $R_p^a$, with an equivalence $R^a tilde.eq h_Lambda \( R_p^a \)$ at every filtration order, compatible with the filtered algebra structures.]
  + #emph[Maps of whole unfiltered graded commutative algebras $R_p^a arrow.r S_(\( p \))$, where the sphere is constant in the weight grading, together with a homotopy identifying their normalized evaluation with Equation (5.1).]
  + #emph[Filtered finite-cell $R_p^a$-modules $K_p^a$, with an equivalence $K^a tilde.eq h_Lambda \( K_p^a \)$ of filtered modules.]
  #emph[The algebra models, their comparisons, and the evaluation homotopies may be chosen relative to the preceding stage. Thus the maps $R^(a - 1) arrow.r R^a$ and $R_p^(a - 1) arrow.r R_p^a$ and their evaluations form compatible diagrams of algebras. No algebra structure is required on $K_p^a$.]
] <universal:primewise-models>

#proof[
  We first construct the algebras in the triangular generator order of Lemma 26. Start at the unit, in weight and filtration order zero. Suppose that the preceding generators have been constructed, and let $z = z_(j \, S)$, $r = \| S \|$, and $gamma = gamma_(j \, S)$. Its boundary $partial z$ is a cycle of chain degree $- r - 1$, weight $gamma$, and filtration at least two. The comparison already established at this fixed weight and filtration lifts the boundary to maps
  #[#set math.equation(numbering: n => "(5.3)")
   $ S^(d \( gamma \) - r - 1) arrow.r \( cal(F)_2 R_p^(upright("old")) \) \( gamma \) \, $ <universal:attaching-map>]
  together with a path matching the normalized class with $partial z$. Compose with the map to $cal(F)_1$ and attach a free commutative algebra cell that nulls this map. Explicitly, push out the free algebra on the indicated sphere, placed as a step at order one, along its augmentation to the unit. The support and filtration bounds are preserved.
  After taking associated graded, the attaching map in order one is null by its specified factorization through $cal(F)_2$. Lemma 28 identifies the result with free adjunction of the sphere $S^(d \( gamma \) - r)$ in weight $gamma$ and order one. Repeating this construction gives a primewise free algebra on all the generator spheres as the associated graded of $R_p^a$.
  We verify carefully that the comparison with the filtered dg algebra extends at each step. Over the $bb(Q)$-algebra $D$, free algebras on free step generators are computed by ordinary graded symmetric powers, with their step orders added. For a cycle generator $x$, the free disk algebra with a generator $z$ satisfying $partial z = x$, both placed at order one, resolves the filtered unit over the free cycle algebra. Indeed every component of positive word length is contractible. If the null generator is even, the needed contraction divides by its positive multiplicity, which is invertible in $D$. Moreover, filtering the disk algebra by the number of null generators gives successive free step modules over the cycle algebra. The disk therefore computes the derived relative tensor, and its base change is exactly the extension by $z$ with the specified differential and length filtration.
  These computations use derived tensor products. To see directly that the strict monomial models compute them, order monomials at each weight by their highest differing generator multiplicity in the triangular list. There are finitely many such monomials by positive mass, and their differentials use earlier ones. For $K^a$, place the $e_j$ after all coefficient generators, in increasing $j$. The resulting filtered complexes are built from free $D$-module steps. Their strict tensor pairings thus represent the derived pairings as well.
  The old comparison and the tautological null in the spectral attachment now induce a map from the dg pushout to the normalized spectral pushout. We use the chosen matching path from Equation (5.3) inside $cal(F)_2$. In order one modulo order two, the new generator is the difference of two nulls: the attached null and the null obtained by projecting the boundary from $cal(F)_2$. The matching path respects the latter null. Consequently the comparison sends the new associated graded generator to the spectral generator supplied by the attachment. Taking cofibers and projecting the filtration commute with normalized Hom, so this is also an identification of the chosen generator classes, not merely of the objects.
  At any fixed weight, the associated graded spectral algebra is a finite sum of extended powers of the generator spheres, with arities bounded by the mass of that weight independently of $p$. For sufficiently large $p$, the symmetric groups in these terms have invertible order. An even sphere repeated $k$ times contributes a sphere of the summed degree: the fiber inclusion into its homotopy orbits is an equivalence after $p$-localization. An odd sphere repeated at least twice contributes zero. To justify both assertions, its extended power is the Thom spectrum of the permutation sphere over $B Sigma_k$, and its ordinary homology is the group homology with the permutation orientation character. When $p divides.not k !$, higher group homology vanishes. The degree-zero coinvariants are $bb(Z)_(\( p \))$ in the even case and zero in the odd case, since a transposition acts by $- 1$ and $2$ is a unit. The spectra are bounded below after translating the sphere degree, so the homology statements imply the claimed equivalences by stable Hurewicz.
  Products of distinct generator factors are treated separately. Multiplication of their generator classes uses the fiber inclusions. The coherent sphere grading and $"map"_(cal(C)) \( upright(bold(1)) \, upright(bold(1)) \) = H D$ identify their normalized Hom with the expected free graded-commutative basis over $D$. The extra chain shifts are fixed at each fixed weight, so the fixed-stem calculation applies. Our comparison is therefore an equivalence on associated gradeds, and hence on the bounded filtration at every weight. This completes the induction constructing the filtered algebra comparison.
  It remains to realize the evaluation, including its specified nulls. If $\( X_p \)$ is any sequence of graded commutative algebras, there is a comparison
  #[#set math.equation(numbering: n => "(5.4)")
   $ product_(cal(U)) "Map"_(upright("CAlg")^Lambda) \( R_p^a \, X_p \) arrow.r "Map"_(upright("CAlg")_D^Lambda) \( R^a \, h_Lambda \( X_p \) \) \, $ <universal:algebra-mapping>]
  where the source uses maps of whole graded systems, after forgetting filtration. This is an equivalence by induction over the finite list of free algebra cells. For one cell, extending a map means choosing a null of the image of its attaching map. Its mapping space is the corresponding homotopy pullback of mapping spaces from the generator sphere at its specified weight. Those sphere mapping spaces agree by the definition of $h_Lambda$. The initial unit case agrees as well, and finite homotopy pullbacks commute with the ultraproduct. The comparison constructed above sends attached-null data to the attached-null data in these pullbacks, since it used both the tautological null and the specified matching path.
  Forgetting filtration in this argument does preserve the free-cell pushouts: it is colimit towards decreasing filtration order, a colimit-preserving symmetric monoidal functor, as one sees on steps. Here it takes the constant value at orders at most zero. Apply Equation (5.4) to the constant graded sphere target and the evaluation in Equation (5.1). It supplies the required primewise evaluations and the matching homotopy. The same comparison commutes with restriction to earlier cells. It is therefore an equivalence on the homotopy fibers over already chosen maps, including their comparison paths. The new evaluation can thus extend the preceding evaluation with its chosen compatibility, which proves the assertion about diagrams across stages.
  Finally, construct $K_p^a$ using the finite filtered module cells from Lemma 27. A free module cell over $R_p^a$ with generator of weight $gamma$, order $s$, and ordinary degree $d \( gamma \) + u$, for fixed $u in bb(Z)$, normalizes to the corresponding free module shift over $h_Lambda \( R_p^a \)$ with chain degree $u$. This uses the coherent sphere grading. A boundary is, by adjunction, a map from one sphere into the specified weight and filtration of the preceding module. Lift that map and choose a path matching the boundary. Taking its cofiber extends the module comparison. Exactness proves the comparison at each stage and gives the compatible associated graded comparison. ◻
]

=== 5.3 A comparison of whole primewise modules <a-comparison-of-whole-primewise-modules>

The fixed-weight equivalences just proved do not, by themselves, control a weight that depends on $p$. We now obtain a stronger statement using the finite number of module cells. This is the point at which the whole graded systems in Proposition 29 are essential.

#thm([Proposition 5.6.])[
  #emph[On one $cal(U)$-large set of primes there is an equivalence of whole $\( upright("weight") \, upright("order") \)$-graded $"gr" R_p^a$-modules 
#[#set math.equation(numbering: n => "(5.5)")
 $ "gr" K_p^a tilde.eq ⨂_(j lt.eq a)^("gr" R_p^a) "cofib" #scale(x: 120%, y: 120%)[\(] upright("multiplication by ") z_(j \, nothing) upright(" on ") "gr" R_p^a #scale(x: 120%, y: 120%)[\)] . $ <eq:whole-module>]

 Each multiplication map has source the free module whose generator has weight $w_j$, order one, and ordinary degree $d_j$. On the right, $"gr" R_p^a$ is the free graded algebra of all the generator spheres, with the splittings constructed in Proposition 29.]
] <universal:whole-module>

#proof[
  After applying $h_Lambda$, the right side becomes the tensor of two-term cofibers for the classes $z_(j \, nothing)$ in $"gr" R^a$. The tensor comparison is an equivalence for these finite free module cells: it is the free-shift identification for one cell and extends by finite cofibers. This is the Koszul module with differential $partial e_j = z_(j \, nothing)$, hence agrees with the normalized left side by Lemma 27. A change in a sphere identification can multiply a chosen basis element by a unit and does not change this equivalence.
  To lift that equivalence, consider the ultraproduct of categories of whole $\( upright("weight") \, upright("order") \)$-graded modules over $"gr" R_p^a$. There is a natural comparison from its mapping spectra to mapping spectra of graded modules over $h_Lambda \( "gr" R_p^a \)$. For a free source at one fixed weight, order, and extra integer suspension, both mapping spectra are exactly the same normalized evaluation of the target at that weight and order. Induction through cofiber sequences proves full faithfulness for sources built from finitely many such free shifts, against any whole-system target.
  Both modules in Equation (5.5) satisfy this finiteness condition. For the left side, take associated graded of the finite filtered cell construction. For the right side, expand the tensor of the finitely many two-term cofibers. Their formal weight and order shifts and their extra integer suspensions are fixed independently of $p$. Full faithfulness lifts the normalized equivalence, its inverse, and the two homotopies identifying their composites with the respective identities. These are finitely many maps and homotopies of whole systems. After restricting to one $cal(U)$-large prime set, they are inverse equivalences at each prime as whole graded module maps. Thus the same prime set works for all weights; no intersection over the lattice of weights is taken. ◻
]

Equation (5.5) lets us examine the same modules at $p$-dependent weights. The next section estimates these weights by analyzing the extended powers of each generator sphere and the multiplication cofibers of the empty-subset generators.

== 6 Connectivity at weights growing with the prime <sec:connectivity>

Fix a stage $0 lt.eq a < n$ and the universal coefficient algebra and finite-cell module constructed in Section 5. Equation (5.5) describes $"gr" K_p^a$ as a whole graded module on a set of primes in $cal(U)$. We will use that description at the moving weight $p lambda + delta$, where $lambda \, delta in Lambda$ are fixed. The goal is a lower degree bound with explicit linear dependence on $p$ after subtracting the ordinary sphere degree $d \( p lambda + delta \)$. The resulting vanishing, after tensoring with $K^a$, is the input to the normalization construction in Section 7.

We say that a spectrum belongs to $upright("Sp")_(gt.eq L)$ if its homotopy groups vanish in degrees strictly below $L$. All spectra in the primewise calculations below are $p$-local. Sphere degrees may be negative; the arguments apply to virtual Thom spectra after an ordinary integer suspension.

=== 6.1 Symmetric groups and multiplication cofibers <symmetric-groups-and-multiplication-cofibers>

For an integer $d$, write

$ "Sym"^k \( S^d \) = #scale(x: 120%, y: 120%)[\(] \( S^d \)^(⊗ k) #scale(x: 120%, y: 120%)[\)]_(h Sigma_k) . $

This is the Thom spectrum of the virtual bundle $d rho_k$ over $B Sigma_k$, where $rho_k$ is the real permutation representation. Its virtual rank is $k d$, and its mod-$p$ orientation character is $"sgn"^d$. Thus its mod-$p$ cohomology, with degrees translated by $k d$, is group cohomology with trivial coefficients when $d$ is even and with sign coefficients when $d$ is odd.

#thm([Lemma 6.1.])[
  #emph[Let $p$ be odd, let $0 lt.eq k < p^2$, and write $k = l p + b$ with $0 lt.eq b < p$. Let $H = \( C_p \)^l subset.eq Sigma_k$ act by translations on $l$ disjoint blocks of $p$ letters, and let $N$ be its normalizer. For either the trivial or the sign module $M$ over $bb(F)_p$, restriction identifies 
$ H^(*) \( Sigma_k \; M \) arrow.r^(med tilde.equiv med) H^(*) \( H \; M \)^(N \/ H) . $

 Here the normalizer acts both by conjugation on $H$ and by its given action on $M$. Moreover, 
$ N \/ H tilde.equiv #scale(x: 120%, y: 120%)[\(] \( bb(F)_p^times \)^l times.r Sigma_l #scale(x: 120%, y: 120%)[\)] times Sigma_b . $

]
] <conn:stable-elements>

#proof[
  The exponent of $p$ in $k !$ is $l$, since $k < p^2$. Consequently $H$ is a Sylow subgroup. Its nontrivial orbits are exactly the $p$-element blocks, so a normalizing permutation permutes these blocks and the $b$ remaining letters separately. On each block the normalizer of translations consists of affine maps $x mapsto u x + v$. Dividing out the translations gives the displayed normalizer quotient. Its order is $\( p - 1 \)^l l ! b !$, which is prime to $p$ because $l \, b < p$.
  We recall the transfer identities needed here, including their effect on coefficients. Cohomological transfer is obtained by summing a cochain over representatives of the relevant finite coset set, using the group action to identify the coefficient fibers. It follows that transfer after restriction from a group to a subgroup is multiplication by the subgroup index. For the opposite composite, decomposing that coset set into subgroup orbits gives the double-coset formula: each double coset contributes restriction to the corresponding intersection, conjugation with its coefficient action, and transfer from that intersection. These descriptions also give the projection formula for transfer and cup products.
  Since $\[ Sigma_k : H \]$ is prime to $p$, transfer after restriction proves that restriction to $H$ is injective. Its image is invariant under the normalizer: conjugation together with the coefficient action acts trivially on cohomology of the full group, and restriction respects this action.
  To prove that every invariant is in the image, consider the other transfer composite. The restriction of either $M$ to $H$ is trivial: each $p$-cycle is even. If $L$ is a proper subgroup of $H$, it is a proper linear subspace of the elementary abelian group $H$. A linear retraction $H arrow.r L$ shows that $H^(*) \( H \; bb(F)_p \) arrow.r H^(*) \( L \; bb(F)_p \)$ is surjective. Choose a basis of the one-dimensional, trivial $H$-module $M$. Every class with coefficients in $M$ over $L$ is then the restriction of a class over $H$. The projection formula gives
  $ "tr"_L^H "res"_L^H \( x \) = x thin \[ H : L \] = 0 . $
  Hence transfer from every proper intersection subgroup in the double-coset formula vanishes, in all degrees. An intersection $H ∩ g H g^(- 1)$ equals $H$ exactly when $g$ normalizes $H$. The remaining terms are therefore
  $ "res"_H^(Sigma_k) "tr"_H^(Sigma_k) \( x \) = sum_(macron(g) in N \/ H) macron(g) dot.op x . $
  For an invariant $x$ this is $\| N \/ H \| x$. The scalar is invertible in $bb(F)_p$, proving surjectivity onto the invariants. ◻
]

For even $d$ define the multiplication cofibers

#[#set math.equation(numbering: n => "(6.1)")
 $ T_(p \, 0) \( d \) = S^0 \, #h(2em) T_(p \, k) \( d \) = "cofib" (S^d ⊗ "Sym"^(k - 1) \( S^d \) arrow.r "Sym"^k \( S^d \)) quad \( k gt.eq 1 \) . $ <conn:cofiber-definition>]

The arrow is multiplication in the free commutative algebra on $S^d$. In the homotopy-orbit description of its symmetric powers, this multiplication comes from the block inclusion $Sigma_1 times Sigma_(k - 1) subset.eq Sigma_k$. Thus the arrow in Equation (6.1) is induced by $B Sigma_(k - 1) arrow.r B Sigma_k$, with the compatible Thom bundles. In particular its map on cohomology is restriction. This identification specifies the map itself and its bottom-degree normalization; no transfer or factor of $k$ is inserted.

#thm([Proposition 6.2.])[
  #emph[Fix a positive integer $C$. For every odd prime $p > C$, every $0 lt.eq k lt.eq C p$, and every integer $d$, one has 
$ "Sym"^k \( S^d \) in upright("Sp")_(gt.eq k d) . $

 If $d$ is odd, there is the additional bound 
#[#set math.equation(numbering: n => "(6.2)")
 $ "Sym"^k \( S^d \) in upright("Sp")_(gt.eq k d + k - \( 2 C + 1 \)) . $ <conn:odd-bound>]

 If $d$ is even, the objects in Equation (6.1) satisfy 
#[#set math.equation(numbering: n => "(6.3)")
 $ T_(p \, k) \( d \) in upright("Sp")_(gt.eq k d + 2 k - 3 C) . $ <conn:cofiber-bound>]

 More precisely, writing $k = l p + b$ with $0 lt.eq b < p$, an odd-degree extended power is contractible if $b gt.eq 2$, and otherwise its cohomology above its rank begins no earlier than $l \( p - 2 \)$. For even $d$ and $k > 0$, the multiplication cofiber is contractible if $b > 0$, and if $b = 0$ its cohomology above its rank begins no earlier than $l \( 2 p - 3 \)$.]
] <conn:symmetric>

#proof[
  The Thom spectrum has a cellular filtration with its cells in degrees $k d + j$, where $j gt.eq 0$ is a base-cell degree. This proves the first bound, including for virtual bundles. Since $p > C$ and $k lt.eq C p$, we have $k < p^2$ and $l lt.eq C < p$, so Lemma 31 applies.
  The two-periodic cyclic-group resolution, together with its periodicity class and Bockstein, gives
  $ H^(*) \( C_p \; bb(F)_p \) = Lambda \( eta \) ⊗ bb(F)_p \[ xi \] \, #h(2em) \| eta \| = 1 \, quad \| xi \| = 2 . $
  Both $eta$ and $xi$ transform with multiplier weight one under $bb(F)_p^times$, or both with its inverse if the conjugation convention is reversed. The periodic resolution gives the polynomial degree-two class, the Bockstein identifies its multiplier action with that of the degree-one class, and $eta^2 = 0$ follows from graded commutativity since $p$ is odd.
  The sign of multiplication by $u in bb(F)_p^times$ on the $p$ letters of a block is $u^(\( p - 1 \) \/ 2)$, viewed in $bb(F)_p$. Indeed, applying the permutation to the Vandermonde product on the $p$ field elements multiplies that product both by its sign and by $u^(p \( p - 1 \) \/ 2) = u^(\( p - 1 \) \/ 2)$. Translations have sign one. A block transposition has sign $\( - 1 \)^p = - 1$, and permutations of the remaining $b$ letters have their ordinary sign.
  Suppose first that $d$ is odd. If $b gt.eq 2$, a transposition of the remaining letters acts trivially on $H$ and by $- 1$ on the coefficient line. The normalizer invariants are consequently zero in every degree. If $b = 0$ or $1$, invariance under the independent multipliers on each block requires multiplier weight $\( p - 1 \) \/ 2$ modulo $p - 1$ in each factor of $H^(*) \( H \; bb(F)_p \)$. The least degree with this weight is $p - 2$, represented by $eta xi^(\( p - 3 \) \/ 2)$; the least even degree is $p - 1$. Reversing the multiplier convention gives the same condition. Therefore the normalizer invariants have no classes below degree $l \( p - 2 \)$. The further block-permutation condition can only remove classes. Since $b lt.eq 1$ in this case,
  $ l \( p - 2 \) = k - \( 2 l + b \) gt.eq k - \( 2 C + 1 \) . $
  This gives the cohomological vanishing required for Equation (6.2).
  For even $d$, put
  $ U = H^(*) \( C_p \; bb(F)_p \)^(bb(F)_p^times) \, #h(2em) V = ker \( U arrow.r bb(F)_p \) . $
  The least positive degree in $U$ is $2 p - 3$, represented by $eta xi^(p - 2)$. By Lemma 31, trivial coefficients give
  $ H^(*) \( Sigma_k \; bb(F)_p \) tilde.equiv \( U^(⊗ l) \)^(Sigma_l) . $
  The permutations of the tensor factors here include the Koszul signs of their cohomological degrees. The leftover $Sigma_b$ acts trivially and imposes no further condition.
  We now compute restriction to $Sigma_(k - 1)$. If $b > 0$, choose the fixed letter outside the $p$-blocks. Both symmetric groups then have the same Sylow subgroup $H$, and their normalizer invariants are the same: the only change is from $Sigma_b$ to $Sigma_(b - 1)$ on the unused letters. The restriction is an isomorphism, since its further restriction to $H$ is the identity.
  If $b = 0$ and $k > 0$, choose the fixed letter in the last block. A Sylow subgroup of $Sigma_(k - 1)$ consists of the first $l - 1$ blocks. Naturality of restriction and its injectivity on these Sylow subgroups identify the restriction map with
  #[#set math.equation(numbering: n => "(6.4)")
   $ \( U^(⊗ l) \)^(Sigma_l) arrow.r \( U^(⊗ \( l - 1 \)) \)^(Sigma_(l - 1)) \, #h(2em) "id"^(⊗ \( l - 1 \)) ⊗ epsilon.alt \, $ <conn:restriction>]
  where $epsilon.alt : U arrow.r bb(F)_p$ is augmentation. To determine this map without a choice of normalization, decompose $U = bb(F)_p xor V$. A tensor with exactly $r$ entries from $V$ has its nonunit entries in an $r$-element subset of ${ 1 \, dots.h \, l }$. An invariant on all such subsets is uniquely determined by its component on one subset, which belongs to $\( V^(⊗ r) \)^(Sigma_r)$. Conversely, place such a component in each $r$-element subset and sum the resulting tensors, without dividing the sum by its number of terms. This gives all the invariants and respects the graded signs. Applying augmentation to the last factor kills exactly the summands whose subset contains that factor. For $r < l$, the remaining sum is precisely the corresponding sum over the $r$-element subsets of ${ 1 \, dots.h \, l - 1 }$. For $r = l$, every summand is killed. Consequently Equation (6.4) is surjective and its kernel is $\( V^(⊗ l) \)^(Sigma_l)$. Every class in this kernel has degree at least $l \( 2 p - 3 \)$.
  The Thom isomorphism is compatible with the block inclusion defining $T_(p \, k) \( d \)$: on $Sigma_(k - 1)$ the bundle $d rho_k$ restricts to $d rho_(k - 1)$ plus a trivial bundle of rank $d$. Both Thom spectra therefore have rank $k d$. The preceding restriction maps are surjective in every degree. The cohomology long exact sequence of their cofiber identifies its cohomology with the kernel of restriction in the same degree, without an additional degree shift. Thus it vanishes entirely if $b > 0$; if $b = 0$ its least possible degree above $k d$ is
  $ l \( 2 p - 3 \) = 2 k - 3 l gt.eq 2 k - 3 C . $
  The case $k = 0$ of Equation (6.3) follows directly from $T_(p \, 0) \( d \) = S^0$.
  For completeness, these mod-$p$ calculations imply the stated homotopy bounds, not just cohomology bounds. Classifying spaces of the finite groups used above have finitely many cells in each degree, and the virtual Thom spectra are bounded below after suspension. Their $p$-local integral homology groups, and those of the indicated cofibers, are finitely generated in each degree. Cohomology vanishing over the field $bb(F)_p$ gives homology vanishing in the same range. The universal coefficient sequence then shows that each integral homology group in that range has zero quotient modulo $p$. Finite generation over $bb(Z)_(\( p \))$ forces that group to vanish. Finally, for a bounded-below spectrum, the first nonzero homotopy group, if there is one below the claimed bound, maps isomorphically to the first nonzero integral homology group by the stable Hurewicz theorem. This would contradict the integral homology vanishing. The same argument in every degree proves contractibility in the cases where all mod-$p$ cohomology vanishes. ◻
]

=== 6.2 The bound for the universal Koszul module <the-bound-for-the-universal-koszul-module>

The estimates in Proposition 32 now apply factor by factor to Equation (5.5). The crucial point is that the number of variable types is fixed, although their multiplicities may grow with the prime.

#thm([Proposition 6.3.])[
  #emph[Fix $0 lt.eq a < n$ and $lambda \, delta in Lambda$, and set 
#[#set math.equation(numbering: n => "(6.5)")
 $ C = max { 0 \, sigma \( lambda \) } + \| sigma \( delta \) \| + 1 \, #h(2em) N_a = 2^(a + 1) - 1 \, #h(2em) E = N_a \( 5 C + 1 \) . $ <conn:constants>]

 On a set of primes in $cal(U)$, and for all its sufficiently large members, the underlying unfiltered module satisfies 
#[#set math.equation(numbering: n => "(6.6)")
 $ K_p^a \( p lambda + delta \) in upright("Sp")_(gt.eq d \( p lambda + delta \) + 2 nu \( p lambda + delta \) - E) . $ <conn:module-bound>]

 The constants are independent of the individual multiplicities occurring at this weight and of the prime.]
] <conn:estimate>

#proof[
  Write $gamma = p lambda + delta$. Restrict to the set of primes where Equation (5.5) holds for whole graded modules. If $gamma$ is outside the support monoid of the universal model, its component is zero and there is nothing to prove. Otherwise decompose the free algebra $"gr" R_p^a$ as the tensor product of the free algebras on the individual generator spheres. There are $sum_(j = 0)^a 2^j = N_a$ such generators.
  For a nonempty subset $S subset.eq \[ j \)$, set $r = \| S \|$ as before. The factor with multiplicity $k = k_(j \, S)$ is
  $ "Sym"^k #scale(x: 120%, y: 120%)[\(] S^(d \( gamma_(j \, S) \) - r) #scale(x: 120%, y: 120%)[\)] . $
  For $S = diameter$, the corresponding quotient factor in Equation (5.5) has multiplicity-$k$ component $T_(p \, k) \( d_j \)$. Here multiplicity includes the generator in the source of the multiplication map, or equivalently the possible Koszul cell, as well as the ordinary polynomial copies. Its filtration order is $k$ on both sides of that map. Distinct factors tensor together, and the weight-$gamma$ component is the finite sum of the terms satisfying
  #[#set math.equation(numbering: n => "(6.7)")
   $ sum_(j \, S) k_(j \, S) gamma_(j \, S) = gamma . $ <conn:weight-identity>]
  Every generator weight has positive integral mass. Taking mass in Equation (6.7) therefore gives
  $ 0 lt.eq k_(j \, S) lt.eq sigma \( gamma \) = p sigma \( lambda \) + sigma \( delta \) lt.eq C p . $
  This also proves finiteness of the sum at each prime. For $p > C$, Proposition 32 applies to every factor. Since $d \( gamma_(j \, S) \)$ is even, the odd-degree improvement applies exactly when $r$ is odd. For $r = 0$, the multiplication-cofiber improvement applies instead. Tensoring lower degree bounds adds them: after desuspending each factor to a connective spectrum, their tensor product is connective. The bound for each tensor term, relative to $d \( gamma \)$, is consequently at least
  #[#set math.equation(numbering: n => "(6.8)")
   $ - sum_(j \, S) r k_(j \, S) + sum_(r upright(" odd")) k_(j \, S) + 2 sum_(r = 0) k_(j \, S) - E . $ <conn:sum-bound>]
  Indeed the odd factors lose at most $2 C + 1$ each, the multiplication cofibers lose at most $3 C$ each, and there are at most $N_a$ factors; the displayed value of $E$ bounds their total loss, including factors of multiplicity zero.
  The elementary inequality
  $ - r + upright(bold(1))_({ r upright(" odd") }) + 2 upright(bold(1))_({ r = 0 }) gt.eq 2 \( 1 - r \) #h(2em) \( r gt.eq 0 \) $
  and the identity $nu \( gamma_(j \, S) \) = 1 - r$ turn Equation (6.8) into the lower bound $2 nu \( gamma \) - E$. Thus every associated graded piece at weight $gamma$ lies in the range asserted in Equation (6.6).
  At this weight the filtration is zero above $sigma \( gamma \)$ and constant in filtration degrees at most zero. Starting at its zero top term, the cofiber sequences relating successive filtration terms and associated graded pieces prove the same bound for the unfiltered component. This uses only closure of $upright("Sp")_(gt.eq L)$ under extensions. The filtration length is finite at each prime; no uniform bound on that length is required. ◻
]

=== 6.3 Vanishing after the Koszul-module test <vanishing-after-the-koszul-module-test>

Recall that $i = \( lambda \, delta \, m \) in I$, that $q = 2 \( p - 1 \)$, and that the layer comparison uses

$ d \( F i \) = d \( p lambda + delta \) - q m . $

The following consequence retains the strict inequality in $m$ that will determine the normalization range.

#thm([Lemma 6.4.])[
  #emph[For every fixed $i = \( lambda \, delta \, m \)$ with $m > - nu \( lambda \)$, one has 
$ Q \( K_p^a \)_i = 0 \, #h(2em) Phi \( K_p^a \)_i = 0 . $

 Here $Q$ and $Phi$ are applied to the primewise underlying graded modules, as allowed by the arbitrary-object part of the layer comparison.]
] <conn:degree-gap>

#proof[
  Let $s in bb(Z)$ be any fixed homotopy degree. The $s$th homotopy group of $Q \( K_p^a \)_i$ is computed by maps from the sphere of ordinary degree $d \( F i \) + s$ to $K_p^a \( p lambda + delta \)$. Subtracting this requested degree from the lower bound of Proposition 33 gives
  $ & d \( p lambda + delta \) + 2 nu \( p lambda + delta \) - E - #scale(x: 120%, y: 120%)[\(] d \( F i \) + s #scale(x: 120%, y: 120%)[\)]\
 & #h(1cm)  = 2 p #scale(x: 120%, y: 120%)[\(] nu \( lambda \) + m #scale(x: 120%, y: 120%)[\)] + 2 nu \( delta \) - 2 m - E - s . $
  Because $nu \( lambda \) + m$ is a positive integer, this expression tends to $+ oo$ with $p$. The requested primewise homotopy group therefore vanishes on a set in $cal(U)$. It follows that $pi_s Q \( K_p^a \)_i = 0$. This argument applies separately to every fixed $s$, so the mapping spectrum is zero. The arbitrary-object base-change comparison of Equation (4.5) identifies
  $ Phi \( K_p^a \)_i tilde.eq Q \( K_p^a \)_i ⊗_D \( D \/ \/ pi.alt \) \, $
  which proves the second assertion. ◻
]

#thm([Proposition 6.5.])[
  #emph[For every $lambda in Lambda$ and every integer $m > - nu \( lambda \)$, there is a vanishing of $delta$-graded modules 
#[#set math.equation(numbering: n => "(6.9)")
 $ K^a ⊗_(R^a) #scale(x: 120%, y: 120%)[\(] B \( R_p^a \) \/ t #scale(x: 120%, y: 120%)[\)]_(lambda \, * \, m) = 0 . $ <eq:k-test>]

 The tensor product uses the $R^a$-action in the $delta$-grading. The notation $\/ t$ denotes the underlying module cofiber of multiplication by $t$.]
] <conn:k-test>

#proof[
  Fix $lambda$ and $m$. Trivial-action maps in the $delta$-direction, followed by the primewise module action, give the balanced pairing
  #[#set math.equation(numbering: n => "(6.10)")
   $ K^a ⊗_(R^a) Phi \( R_p^a \)_(lambda \, * \, m) arrow.r Phi \( K_p^a \)_(lambda \, * \, m) . $ <conn:module-pairing>]
  In constructing it we use the chosen comparisons $h_Lambda \( R_p^a \) tilde.eq R^a$ and $h_Lambda \( K_p^a \) tilde.eq K^a$ from Section 5. The compatibility of the module action with these comparisons makes the pairing balanced over the indicated $delta$-scalar action.
  We verify that Equation (6.10) is an equivalence using the finite unfiltered module cells of $K_p^a$. For a free cell generated in fixed weight $alpha$ and ordinary sphere degree $d \( alpha \) + u$, with $u in bb(Z)$ fixed, the pairing identifies both sides with the shift of $Phi \( R_p^a \)_(lambda \, * \, m)$ by weight $alpha$ and chain degree $u$. Concretely, the primewise module input at $delta$ on the right is $S^(d \( alpha \) + u) ⊗ R_p^a \( p lambda + delta - alpha \)$. After applying $J^or ⊗ "Tr"$, the Picard grading moves the trivially acting $S \( alpha \)$ into the source, changing its index to $\( lambda \, delta - alpha \, m \)$ and leaving the fixed suspension $u$. This is exactly the free-cell shift on the left. Both sides of Equation (6.10) are exact in the module variable: tensor products preserve finite cofibers, and the mapping constructions are exact componentwise. Induction over the finitely many cells now proves the equivalence for $K_p^a$.
  If $m > - nu \( lambda \)$, Lemma 34 shows that the right side is zero at every fixed $delta$. Finally, Equation (4.5) identifies $B \( R_p^a \) \/ \/ t$ with $Phi \( R_p^a \)$ compatibly with the scalar action. Since $t$ has chain degree zero, its algebra quotient has the multiplication cofiber $B \( R_p^a \) \/ t$ as underlying module, with the identification specified by its universal null. Substituting this comparison into Equation (6.10) proves Equation (6.9). ◻
]

The bounds in this section are asserted separately at each fixed lattice index and each fixed integer suspension. Their prime thresholds may depend on those indices. This is enough to prove the vanishing of the corresponding mapping objects; it does not require intersecting infinitely many large sets of primes. In contrast, the use of Equation (5.5) at the moving weight $p lambda + delta$ was justified by its equivalence of whole primewise modules on one large set.

== 7 Normalization and successive attaching classes <sec:normalization>

We now use the vanishing in Equation (6.9) to construct the cycles $b_1 \, dots.h \, b_n$. The vanishing is obtained only after tensoring with a Koszul algebra. Accordingly, we first pass to a localization in which those tests detect equivalences, and then show that the actual completed targets already belong to that localization. This produces algebra maps, together with the boundary choices needed to attach the next cell. No identification of the cobordism Hurewicz images is used in this construction.

=== 7.1 The inductive data <the-inductive-data>

Retain the lattices $Lambda$, $Omega$, and $I = Lambda xor Lambda xor bb(Z)$, the homomorphism $F : I arrow.r Omega$, and the functions $nu$ and $d$ from the preceding sections. Set

$ i_j = \( w_j \, 0 \, - 1 \) in I #h(2em) \( 0 lt.eq j < n \) \, #h(2em) tau = \( 0 \, 0 \, 1 \) . $

In particular, $F \( i_j \) = w_(j + 1)$. Let $M = \( upright("MU")_(\( p \)) \)_p in cal(C)$ and put

$ L_0 = hat(B) \( upright(bold(1)) \) \, #h(2em) L_0^M = hat(B) \( M \) . $

Here the hats denote derived completion with respect to $t$, as in Lemma 24. Starting with $b_0 = pi.alt u_0$, we have the algebra $h_Omega \( Y_1 \) = A \[ e_0 \]$, with $partial e_0 = b_0$.

At stage $0 lt.eq a lt.eq n$, the inductive data will consist of the strict cycle models through $b_a$ and $Y_(a + 1)$, and a tower of $I$-graded commutative algebras

$ L_a = L_0 \[ e'_0 \, dots.h \, e'_(a - 1) \] \, #h(2em) "wt" \( e'_j \) = i_j \, quad \| e'_j \|_(upright("chain")) = 1 \, quad partial e'_j = g_j . $

This notation means successive algebra attachments with their specified nulls. In particular, it does not require the maps used to construct the $g_j$ to have been prescribed as strict dg maps. Define the parallel tower by base change:

$ L_a^M = L_0^M ⊗_(L_0) L_a . $

Its attached classes and nulls are the images of those in $L_a$. All tensor products of algebras in this section are derived.

The invariant is a pair of equivalences of $I$-graded commutative algebras

#[#set math.equation(numbering: n => "(7.1)")
 $ L_a \/ \/ t & tilde.eq F^(*) h_Omega \( Y_(a + 1) \) \,\
L_a^M \/ \/ t & tilde.eq F^(*) h_Omega \( M ⊗ Y_(a + 1) \) . $ <eq:target-layer>]

These equivalences are compatible with the sphere-to-$M$ unit, with the maps from the initial layers, and with the algebra maps in the $Y$-tower. In the $delta$ direction, their scalar action is ordinary evaluation followed by the indicated algebra unit. The case $a = 0$ is supplied by Corollary 23 and the equality of the finite reductions of $B$ and $hat(B)$.

Each null attachment has a two-term underlying module by Lemma 4. Thus $L_a$ is perfect over $L_0$, and $L_a^M$ is perfect over $L_0^M$. Lemma 24 shows that both towers remain derived $t$-complete.

=== 7.2 Localization by the Koszul algebra <localization-by-the-koszul-algebra>

Fix a stage $a < n$ for which these data have been constructed. At a weight $lambda in Lambda$, the power on the universal coefficients takes values in

$ #scale(x: 120%, y: 120%)[\(] B \( R_p^a \) \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]_(\( lambda \, 0 \, 0 \)) . $

We seek an algebra map from $R^a$ into the components

$ { \( L_a \)_(\( lambda \, 0 \, - nu \( lambda \) \)) #scale(x: 120%, y: 120%)[}]_(lambda in Lambda) . $

These components form a graded algebra because their index map is additive. After inverting $t$ and multiplying its weight-$lambda$ component by $t^(nu \( lambda \))$, the new map must recover the power followed by evaluation $R_p^a arrow.r S_(\( p \))$ and the map $B \( upright(bold(1)) \) arrow.r L_a$. At weight $w_a$, the new target index is $i_a$. Extending this coefficient map across the older Koszul nulls will then let us apply it to $b_a^u$ and reduce modulo $t$ to construct $b_(a + 1)$. Thus the normalization must preserve algebra maps and their specified nulls, rather than only divide individual classes after inversion.

For $m > - nu \( lambda \)$, Equation (6.9) makes multiplication by $t$ into the row $\( lambda \, * \, m \)$ an equivalence after tensoring with $K^a$. The following completion construction makes those comparisons invertible; we will then show that the target $L_a$ is unchanged by it.

For a commutative graded algebra $R$ and a commutative $R$-algebra $K$, call an $R$-module $V$ #emph[$K$-acyclic] if $K ⊗_R V = 0$. An $R$-module $U$ is #emph[$K$-local] if $"map"_R \( V \, U \) = 0$ for every $K$-acyclic $V$. These definitions refer to graded modules and their graded module category; any additional indices can be kept as parameters.

#thm([Lemma 7.1.])[
  (Perfect algebra completion).  #emph[Let $R$ be a commutative graded rational algebra, and let $K$ be a commutative $R$-algebra whose underlying $R$-module is perfect. Define 
$ cal(T) \( U \) = "Tot" #scale(x: 120%, y: 120%)[\(] K^(⊗_R \( bullet + 1 \)) ⊗_R U #scale(x: 120%, y: 120%)[\)] \, #h(2em) c_U : U arrow.r cal(T) \( U \) \, $

 using the Amitsur coaugmentation. Then $cal(T)$ is exact, $cal(T) \( U \)$ is $K$-local, and $c_U$ becomes an equivalence after tensoring with $K$. Consequently $c_U$ is an equivalence whenever $U$ is $K$-local, and $cal(T)$ sends every $K$-acyclic module to zero. On commutative $R$-algebras the construction and its coaugmentation are maps of commutative algebras.]
] <norm:amitsur>

#proof[
  The cosimplicial structure inserts the unit of $K$ in the coface maps and multiplies adjacent $K$ factors in the codegeneracy maps. Tensoring with $K$ commutes with totalization because a perfect module is dualizable. After that tensor, the augmented cosimplicial object is split: multiplication into the extra, distinguished $K$ factor gives the extra codegeneracy. It follows that
  $ K ⊗_R U med arrow.r^tilde.eq med K ⊗_R cal(T) \( U \) . $
  Every nonaugmented term is a $K$-module. If $W$ is a $K$-module and $V$ is $K$-acyclic, extension and restriction of scalars give
  $ "map"_R \( V \, W \) tilde.eq "map"_K \( K ⊗_R V \, W \) = 0 . $
  Thus those terms are $K$-local. Local objects are closed under limits, so their totalization is local as well. The fiber of $c_U$ is $K$-acyclic by the preceding split calculation. If $U$ is local, that fiber is also local, and hence is zero: its endomorphism spectrum vanishes by applying the definition of locality to the fiber itself. This proves the assertion about local inputs. If $U$ is acyclic, each term in its totalization is zero.
  Tensoring over $R$ is exact in the stable module category, and limits preserve finite limits. Therefore $cal(T)$ is exact. Finally, for algebra input the cosimplicial terms are commutative algebras and all structure maps are algebra maps. Their limit has the asserted algebra structure and coaugmentation. This is the usual dualizable-algebra completion argument; compare #cite(label("MNN2017")) Example 2.18 and Proposition 2.21. ◻
]

Use the universal algebras and primewise models of Proposition 29, and abbreviate

$ R = R^a \, #h(2em) K = K^a \, #h(2em) B = B \( R_p^a \) . $

The small-weight comparison identifies $R$ with $h_Lambda \( R_p^a \)$. It acts on $B$ in the $delta$ direction. Evaluation of the primewise universal algebra gives

$ v : B arrow.r B \( upright(bold(1)) \) arrow.r L_0 arrow.r L_a . $

The $R$-module $K$ is perfect by Lemma 27. We apply Lemma 36 with $R$ and $K$ supported at indices $\( 0 \, delta \, 0 \)$ of $I$. Write the resulting functor as $cal(T)_a$. Its module statements apply separately to each row with fixed $\( lambda \, m \)$, while its algebra construction retains all the $I$-graded products.

#thm([Lemma 7.2.])[
  (Locality of the completed target).  #emph[Every $\( lambda \, m \)$ row of $L_a$ is $K^a$-local for the evaluated $R^a$-action. Thus the coaugmentation $c_(L_a) : L_a arrow.r cal(T)_a L_a$ is an equivalence of $I$-graded algebras.]
] <norm:target-locality>

#proof[
  Under Equation (7.1), restriction of the right-hand algebra to $\( 0 \, delta \, 0 \)$ is
  $ h_Lambda \( Y_(a + 1) \) = #scale(x: 120%, y: 120%)[\(] A \[ e_0 \, dots.h \, e_a \] #scale(x: 120%, y: 120%)[\)] \|_Lambda . $
  There is an algebra map from $K^a$ to this restriction: send the universal coefficients to the chosen coefficients in $A \|_Lambda$, and send each $e_j$ to the actual null cell $e_j$. Its differential identities are exactly the universal-cycle identities after evaluation. The scalar compatibility in Equation (4.5) and the chosen path matching primewise and actual coefficient evaluations identify its restriction to $R^a$ with the $R^a$-action on $L_a \/ \/ t$. Transporting along Equation (7.1) therefore makes every row of that layer a $K^a$-module, and hence a local module.
  The cofiber of a composite of $s$ multiplications by $t$ is a finite extension of shifts of the cofiber of one multiplication by $t$. Applied row by row, this shows that $L_a \/ t^s$ is local for every $s gt.eq 1$. Here $\/$ denotes the module cofiber; its underlying module agrees with that of the corresponding algebra quotient. Local modules are closed under finite extensions and inverse limits. Since $L_a$ is derived $t$-complete, it is the inverse limit of these local finite quotients and is itself local. The conclusion follows from Lemma 36. This proof uses the already attached cells, and makes no assumption about any Hurewicz image. ◻
]

=== 7.3 The normalized algebra map <the-normalized-algebra-map>

For an $I$-graded algebra $U$ equipped with the parameter $t$, write

$ U_lambda^(\#) = U_(\( lambda \, 0 \, - nu \( lambda \) \)) \, #h(2em) U_lambda^flat = U_(\( lambda \, 0 \, 0 \)) . $

Both restrictions are $Lambda$-graded algebras because their index maps are additive. There is a natural algebra map

#[#set math.equation(numbering: n => "(7.2)")
 $ s_U : U^(\#) arrow.r #scale(x: 120%, y: 120%)[\(] U \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat \, #h(2em) \( s_U \)_lambda = t^(nu \( lambda \)) . $ <norm:regrading-map>]

In this formula one first maps to the localization and then multiplies by the indicated Laurent power. The powers, including negative powers, form a coherent multiplicative family: pull back the homogeneous units of the rational Laurent polynomial algebra along $lambda mapsto nu \( lambda \) tau$ and use the specified algebra map into $U \[ t^(- 1) \]$. Additivity of $nu$ and commutativity of multiplication prove that $s_U$ is an algebra map.

#thm([Lemma 7.3.])[
  (The boundary row).  #emph[For $B = B \( R_p^a \)$, the map 
$ s_(cal(T)_a B) : \( cal(T)_a B \)^(\#) arrow.r #scale(x: 120%, y: 120%)[\(] \( cal(T)_a B \) \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat $

 is an equivalence of $Lambda$-graded rational algebras.]
] <norm:normalization>

#proof[
  By Equation (6.9), the cofiber of multiplication by $t$ into a row $\( lambda \, * \, m \)$ is $K$-acyclic whenever $m > - nu \( lambda \)$. Exactness of $cal(T)_a$ sends this cofiber to zero. Multiplication by the coaugmented $t$ on $cal(T)_a B$ is the image under $cal(T)_a$ of multiplication by $t$ on $B$: this holds termwise in its cosimplicial construction and therefore after totalization. Consequently the transitions
  $ \( cal(T)_a B \)_(\( lambda \, delta \, m - 1 \)) arrow.r^t \( cal(T)_a B \)_(\( lambda \, delta \, m \)) $
  are equivalences whenever $m > - nu \( lambda \)$.
  The telescope for localization is thus constant up to equivalence starting at the boundary row $m = - nu \( lambda \)$. In particular, that row maps equivalently to the same row after localization. Multiplication by $t^(nu \( lambda \))$ identifies the latter row with the localized row at $m = 0$. This proves the assertion in every weight. When $nu \( lambda \) < 0$, the last multiplication is simply a negative Laurent power; the telescope still reaches the same invertible tail. Multiplicativity follows from Equation (7.2). ◻
]

We can now define the normalized operation. The power map of Proposition 15, the coaugmentation, and the two equivalences just proved give

#[#set math.equation(numbering: n => "(7.3)")
 $ P^a : R^a tilde.eq h_Lambda \( R_p^a \) & arrow.r^(P_(R_p^a)) #scale(x: 120%, y: 120%)[\(] B \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat arrow.r^(\( c_B \[ t^(- 1) \] \)^flat) #scale(x: 120%, y: 120%)[\(] \( cal(T)_a B \) \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat\
 & arrow.r^(s_(cal(T)_a B)^(- 1)) \( cal(T)_a B \)^(\#) arrow.r^(\( cal(T)_a v \)^(\#)) \( cal(T)_a L_a \)^(\#) arrow.r^(\( c_(L_a)^(\#) \)^(- 1)) L_a^(\#) . $ <norm:normalized-operation>]

This is a map of graded algebras over rational spectra. The power map can change the action of the varying scalar ring $D$, and $P^a$ is not asserted to be $D$-linear.

#thm([Lemma 7.4.])[
  (Recovery and naturality).  #emph[The normalized map recovers the evaluated power after inversion: 
#[#set math.equation(numbering: n => "(7.4)")
 $ s_(L_a) P^a tilde.eq \( v \[ t^(- 1) \] \)^flat P_(R_p^a) . $ <norm:raw-recovery>]

 For $a > 0$, its restriction to $R^(a - 1)$ agrees, as a rational algebra map, with $P^(a - 1)$ followed by the map $L_(a - 1)^(\#) arrow.r L_a^(\#)$.]
] <norm:naturality>

#proof[
  The first assertion says that the following square commutes:
  $ R^a & arrow.r^(med P^a med) & L_a^(\#)\
P_(R_p^a) arrow.b &  & arrow.b s_(L_a)\
\( B \[ t^(- 1) \] \)^flat & arrow.r^(med \( v \[ t^(- 1) \] \)^flat med) & \( L_a \[ t^(- 1) \] \)^flat . $
  To verify it, naturality of $s$ for $c_(L_a)$ and $cal(T)_a v$, followed by naturality of the coaugmentation for $v$, gives
  $ & s_(L_a) \( c_(L_a)^(\#) \)^(- 1) \( cal(T)_a v \)^(\#) s_(cal(T)_a B)^(- 1) \( c_B \[ t^(- 1) \] \)^flat\
 & #h(2em) = #scale(x: 120%, y: 120%)[\(] \( c_(L_a) \[ t^(- 1) \] \)^flat #scale(x: 120%, y: 120%)[\)]^(- 1) #scale(x: 120%, y: 120%)[\(] \( cal(T)_a v \) \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat \( c_B \[ t^(- 1) \] \)^flat tilde.eq \( v \[ t^(- 1) \] \)^flat . $
  The inverse in this display is the localization of an already invertible coaugmentation on $L_a$.
  For the second assertion, the compatible universal models and evaluations give a map from the preceding diagram $K^(a - 1) arrow.l R^(a - 1) arrow.r B \( R_p^(a - 1) \) arrow.r L_(a - 1)$ to the current diagram $K^a arrow.l R^a arrow.r B \( R_p^a \) arrow.r L_a$. In cosimplicial degree $r$, it induces an algebra map
  $ \( K^(a - 1) \)^(⊗_(R^(a - 1)) \( r + 1 \)) ⊗_(R^(a - 1)) B \( R_p^(a - 1) \) arrow.r \( K^a \)^(⊗_(R^a) \( r + 1 \)) ⊗_(R^a) B \( R_p^a \) . $
  The same construction applies with $L_(a - 1)$ and $L_a$ in the last positions. These maps commute with the units and multiplications defining the cosimplicial structure, so they induce maps of coaugmented totalizations. They also preserve $t$.
  The maps $s$ are natural for these maps of totalizations and for their localizations. Both normalization maps being inverted in Equation (7.3) are equivalences, so their inverses respect these naturality squares. The same is true of the two target coaugmentations. Finally, $P_(R_p^a)$ is natural for the map of actual primewise algebras, and the chosen small-weight comparisons and evaluation paths extend those of the preceding stage. Comparing all the arrows in Equation (7.3) therefore proves the claimed homotopy of algebra maps. This comparison uses actual maps between the two Amitsur diagrams. It does not interchange totalization with $t$-inversion or identify a totalization with its extension of scalars. ◻
]

=== 7.4 Extending across nulls and preserving the layer <extending-across-nulls-and-preserving-the-layer>

The map $P^a$ acts on universal coefficients. To apply it to the universal cycle $b_a^u$, we must also specify images of its older Koszul nulls. We construct

$ f^a : K_(-)^a arrow.r L_a^(\#) $

extending $P^a$. For $a = 0$, set $f^0 = P^0$, since $K_(-)^0 = R^0$. For $a > 0$, there is a pushout description

$ K_(-)^a tilde.eq R^a ⊗_(R^(a - 1)) K^(a - 1) . $

By induction, $f^(a - 1)$ gives the map on $K_(-)^(a - 1)$, followed by $L_(a - 1)^(\#) arrow.r L_a^(\#)$. The attached cell $e'_(a - 1)$ in $L_a$ is a specified null of $g_(a - 1) = f^(a - 1) \( b_(a - 1)^u \)$. Its index $\( w_(a - 1) \, 0 \, - 1 \)$ is exactly the index selected by the $\#$ restriction at $w_(a - 1)$. The universal property of the null attachment extends the map to $K^(a - 1)$. Its restriction to $R^(a - 1)$ agrees with the restriction of $P^a$ by Lemma 39. The pushout therefore supplies $f^a$, including the required boundary data. Although the displayed pushout consists of $D$-algebras, it is also the pushout of the same span of rational algebras: the common middle algebra already carries the specified scalar maps. Thus this construction does not impose $D$-linearity on $P^a$.

Define the homogeneous cycle class and the next algebra by

#[#set math.equation(numbering: n => "(7.5)")
 $ g_a = f^a \( b_a^u \) in pi_0 \( L_a \)_(i_a) \, #h(2em) L_(a + 1) = L_a \/ \/ g_a . $ <norm:next-cell>]

Use the attached null as $e'_a$, and put $L_(a + 1)^M = L_0^M ⊗_(L_0) L_(a + 1)$. The first equivalence in Equation (7.1) carries the reduction of $g_a$ to a class of $h_Omega \( Y_(a + 1) \)$ at weight $F \( i_a \) = w_(a + 1)$. Represent this class by a strict cycle $b_(a + 1)$ in $A \[ e_0 \, dots.h \, e_a \]$, choosing a path matching its class with that reduction. Attach the next null $e_(a + 1)$ and realize this finite-module algebra extension as $Y_(a + 2)$ by Proposition 10.

#thm([Lemma 7.5.])[
  (Compatibility of the new attachment).  #emph[The preceding choices extend Equation (7.1) to stage $a + 1$, with its unit, initial-layer, and tower compatibilities. Both new algebras are derived $t$-complete.]
] <norm:attachment>

#proof[
  Algebra pushouts commute with one another, so reducing the first attachment modulo $t$ gives
  $ L_(a + 1) \/ \/ t tilde.eq \( L_a \/ \/ t \) \/ \/ overline(g)_a . $
  The old layer equivalence, the chosen path matching attaching classes, and the actual null $e_(a + 1)$ define an algebra map from this pushout to $F^(*) h_Omega \( Y_(a + 2) \)$. We check this particular map on its underlying module.
  At an index $i in I$, the source module is the cofiber of multiplication by $overline(g)_a$ from $\( L_a \/ \/ t \)_(i - i_a)$ to $\( L_a \/ \/ t \)_i$. Under the old equivalence these terms become
  $ h_Omega \( Y_(a + 1) \)_(F \( i \) - w_(a + 1)) arrow.r^(med b_(a + 1) med) h_Omega \( Y_(a + 1) \)_(F \( i \)) . $
  Their cofiber is $h_Omega \( Y_(a + 2) \)_(F \( i \))$. The map on the new cell is the chosen null $e_(a + 1)$ multiplied by the base input. Lemma 4 therefore identifies the constructed map with this cofiber equivalence. This argument uses only the additivity of $F$ and a two-term cofiber at each index. It does not require $F$ to be injective or its pullback to preserve arbitrary relative algebra tensors.
  For the $M$-tower, base change gives
  $ L_(a + 1)^M \/ \/ t tilde.eq \( L_a^M \/ \/ t \) ⊗_(L_a \/ \/ t) \( L_(a + 1) \/ \/ t \) . $
  Map its first input into $F^(*) h_Omega \( M ⊗ Y_(a + 2) \)$ by the old $M$-comparison followed by the actual $Y$-attachment. Map its second input there by the new sphere comparison followed by the $M$-unit. Their agreement on $L_a \/ \/ t$ is the previous unit compatibility together with the same attaching-class path. The resulting pushout map is again the underlying cofiber comparison: the new null is the image of $e_(a + 1)$ under the $M$-unit, and the finite-module tensor comparison identifies the target with the cofiber of multiplication by this image of $b_(a + 1)$. This proves the second equivalence and its compatibility with the first. The construction uses the canonical maps from the old algebras, so it also preserves the initial-layer and tower maps.
  The new attachment is a finite perfect-module extension of its base. Completeness follows from Lemma 24, for both the sphere tower and its $M$-base change. ◻
]

Figure 1 displays the induction just proved. The auxiliary tower is one attachment ahead after reduction: its $a$th stage records the ordinary object $Y_(a + 1)$. The comparison is compatible with the specified nulls, which is essential for the next cycle to belong to that ordinary object.

#figure(
  [
$ L_a & arrow.r^(med upright("adjoin ") e'_a med) & L_(a + 1)\
arrow.b thin \/ \/ t &  & arrow.b thin \/ \/ t\
F^(*) h_Omega \( Y_(a + 1) \) & arrow.r & F^(*) h_Omega \( Y_(a + 2) \) $

],
  caption: [Figure 1: Reduction of the auxiliary tower constructs the next ordinary attaching class. The upper arrow nulls $g_a$; under the vertical layer equivalences its reduction is $b_(a + 1)$, and the lower arrow adjoins the specified null $e_(a + 1)$. The same square holds after the compatible base change to complex cobordism. ],
) <fig:towers>

#thm([Proposition 7.6.])[
  (The compatible towers).  #emph[There exist cycles $b_0 \, dots.h \, b_n$ and their realizations $Y_0 \, dots.h \, Y_(n + 1)$, together with the algebras $L_a \, L_a^M$ for $0 lt.eq a lt.eq n$, satisfying Equation (7.1) and its sphere-to-$M$, initial-layer, tower-map, and ordinary $delta$-scalar compatibilities. Each $b_j$ has chain degree zero and weight $w_j$. For each $0 lt.eq a < n$ there are rational algebra maps $P^a$ and $f^a$ as constructed above, and $g_a = f^a \( b_a^u \)$ has chain degree zero and weight $i_a$. It defines the next tower attachment and reduces modulo $t$ to $b_(a + 1)$ under Equation (7.1).]
] <norm:construction>

#proof[
  The initial layer was established at the beginning of the section. Given stage $a < n$, Propositions 29 and 35 supply the universal models and Equation (6.9). Lemmas 37 and 38 define $P^a$; Lemma 39 and the older attached nulls extend it to $f^a$. Equation (7.5) defines $g_a$, and Lemma 40 constructs the next cycle and preserves the invariant. There are exactly $n$ such steps. ◻
]

=== 7.5 The comparison used for cobordism detection <the-comparison-used-for-cobordism-detection>

The construction has produced the next cycle before identifying its Hurewicz image. We finish this section with the comparison that will perform that identification. It relates the normalized operation on the universal cycle to the original power on $M$.

#thm([Proposition 7.7.])[
  (Recovery on the preceding Koszul object).  #emph[For $0 lt.eq a < n$ there is a map of $Lambda$-graded rational algebras 
#[#set math.equation(numbering: n => "(7.6)")
 $ h_Lambda \( M ⊗ Y_a \) tilde.eq h_Lambda \( M \) ⊗_(R^a) K_(-)^a arrow.r #scale(x: 120%, y: 120%)[\(] L_a^M \[ t^(- 1) \] #scale(x: 120%, y: 120%)[\)]^flat . $ <eq:recovery>]

 On $h_Lambda \( M \)$ it is the unnormalized power $P_M$ followed by the map to the completed tower and inversion. The $M$-Hurewicz image of $b_a$ maps to $t g_a^M$, where $g_a^M$ is the image of $g_a$ in $L_a^M$.]
] <norm:recovery>

#proof[
  The actual evaluation $R^a arrow.r A \|_Lambda$ sends the universal coefficients to those of the chosen cycles. Consequently
  $ #scale(x: 120%, y: 120%)[\(] A \[ e_0 \, dots.h \, e_(a - 1) \] #scale(x: 120%, y: 120%)[\)] \|_Lambda tilde.eq A \|_Lambda ⊗_(R^a) K_(-)^a \, $
  with each universal null sent to its actual counterpart. Tensoring with $h_Lambda \( M \)$ over $A \|_Lambda$ gives the equivalence on the left of Equation (7.6). Its identification with $h_Lambda \( M ⊗ Y_a \)$ follows from the finite-module tensor comparison of Proposition 9. Only the finite Koszul module is used here, so the same comparison applies after restriction from $Omega$ to $Lambda$.
  Define a map on the first pushout input $h_Lambda \( M \)$ using $P_M$ and the maps $B \( M \) \[ t^(- 1) \] arrow.r L_0^M \[ t^(- 1) \] arrow.r L_a^M \[ t^(- 1) \]$. On the other input use
  $ K_(-)^a arrow.r^(f^a) L_a^(\#) arrow.r \( L_a^M \)^(\#) arrow.r^(s_(L_a^M)) \( L_a^M \[ t^(- 1) \] \)^flat . $
  These maps agree on $R^a$. Indeed, restriction of the second map to $R^a$ recovers the evaluated, unnormalized power by Equation (7.4). Naturality of the primewise power for $R_p^a arrow.r S_(\( p \)) arrow.r upright("MU")_(\( p \))$ identifies this with $P_M$ applied to the evaluated coefficients. The chosen path between spectral evaluation and the actual coefficient evaluation is part of this comparison. It gives agreement as algebra maps, including the scalar action and the boundary data.
  The universal property of the pushout now gives the arrow in Equation (7.6). Although its source was described using $D$-algebras, the same span is a pushout of rational algebras: the common algebra $R^a$ supplies the scalar identifications. No additional $D$-linearity condition on the map into the powered target is required.
  Finally, the Hurewicz image of $b_a$ corresponds in that pushout to the universal cycle $b_a^u in K_(-)^a$. Its image under $f^a$ is $g_a$ by definition. Since $nu \( w_a \) = 1$, the map $s_(L_a^M)$ multiplies this class by $t$, changing its index from $\( w_a \, 0 \, - 1 \)$ to $\( w_a \, 0 \, 0 \)$. This proves the asserted value $t g_a^M$. ◻
]

== 8 The cobordism calculation <sec:cobordism>

The preceding construction gives candidate attaching classes and recovers their unnormalized powers after inverting $t$. To identify their Hurewicz images, we now calculate these powers in complex cobordism. Everything in this section takes place at one fixed odd prime $p$. The relation we obtain will be applied, prime by prime, to the completed towers in Section 9.

Write $M_p = upright("MU")_(\( p \))$, and use cohomological grading for spaces, so that $M_p^(- s) \( upright("pt") \) = \( M_p \)_s$. We use the commutative multiplication on the complex Thom spectrum and its complex orientation, supplied by the coherent Thom construction #cite(label("May1977")) Chapter IV, Section 2, Construction 2.5 and Lemma 2.2. Localization at $p$ carries this structure to $M_p$: the smashing localization $X mapsto S_(\( p \)) ⊗ X$ is idempotent, and its equivalences are preserved by tensoring, so it is symmetric monoidal #cite(label("LurieHA")) Proposition 2.2.1.9. In particular, complex bundles have multiplicative Thom classes, and tensor product of line bundles defines a graded one-dimensional commutative formal group law. The coefficient calculation is

$ \( M_p \)_(*) = bb(Z)_(\( p \)) \[ a_s : s gt.eq 1 \] \, #h(2em) \| a_s \| = 2 s \; $

see #cite(label("Novikov1962")) Chapter 2, Section 2.4, Theorem 4 of the English translation. We also use Quillen’s multiplicative projection

$ M_p arrow.r upright("BP") $

and the standard $p$-typical orientation of $upright("BP")$ #cite(label("Quillen1969")) Section 5, Theorem 4. A map of ring spectra in the homotopy category is sufficient here. We do not require this projection to preserve power operations, and we do not place a commutative ring-spectrum structure on $upright("BP")$.

=== 8.1 Coefficients of the $p$-series <coefficients-of-the-p-series>

Let $Z$ be the Euler coordinate of the universal complex line, of cohomological degree two. Define homogeneous coefficients and ideals by

#[#set math.equation(numbering: n => "(8.1)")
 $ \[ p \] \( Z \) = sum_(u gt.eq 1) k_u Z^u \, #h(2em) k_u in \( M_p \)_(2 \( u - 1 \)) \, #h(2em) x_h = k_(p^h) \, #h(2em) I_h = \( x_0 \, dots.h \, x_(h - 1) \) . $ <cob:p-series>]

Here $I_0 = 0$, $x_0 = p$, and $\| x_h \| = d_h = 2 \( p^h - 1 \)$.

#thm([Lemma 8.1.])[
  #emph[The sequence $x_0 \, x_1 \, dots.h$ is regular in $\( M_p \)_(*)$. Under the multiplicative projection to $upright("BP")_(*)$, the ideal $I_h$ has image $\( p \, v_1 \, dots.h \, v_(h - 1) \)$ for $h gt.eq 1$, and the image of $x_h$ modulo this ideal is a scalar unit times $v_h$. Moreover, 
$ k_u in I_h #h(2em) \( 1 lt.eq u < p^h \) . $

]
] <cob:regularity>

#proof[
  In the standard $p$-typical coordinate, the logarithm of the Brown–Peterson formal group is
  $ log \( Z \) = sum_(h gt.eq 0) ell_h Z^(p^h) \, #h(2em) ell_0 = 1 \, #h(2em) p ell_h = sum_(0 lt.eq s < h) ell_s v_(h - s)^(p^s) . $
  This is the Hazewinkel recursion #cite(label("HazewinkelIII")) Section 3.1, Equations (3.1.1)–(3.1.3). Over the rationals, the $p$-series is $log^(- 1) \( p log \( Z \) \)$. Its indecomposable term at $Z^(p^h)$ is
  $ \( p - p^(p^h) \) ell_h = \( 1 - p^(p^h - 1) \) v_h med \( mod med upright("lower generators") \) \, #h(2em) h > 0 . $
  By homogeneity no generator $v_j$ with $j > h$ occurs in this coefficient; every term other than the displayed multiple of $v_h$ uses lower generators. The coefficient itself is integral, so these remaining terms lie in $bb(Z)_(\( p \)) \[ v_1 \, dots.h \, v_(h - 1) \]$. The scalar $1 - p^(p^h - 1)$ is a $p$-local unit. Also, modulo $\( p \, v_1 \, dots.h \, v_(h - 1) \)$, degree considerations exclude every coefficient of the $p$-series below $Z^(p^h)$.
  These leading-coefficient assertions are unchanged, up to a scalar unit, by a change of Euler coordinate. Indeed, the projective-space formula identifies a second coordinate with an integral power series in the first, with invertible linear coefficient. Conjugating a series whose terms below order $p^h$ vanish preserves that order and multiplies its leading coefficient by a power of this invertible linear coefficient. For normalized complex orientations the change is strict, and the leading coefficient is unchanged. Induction on $h$ therefore gives the asserted images of the ideals $I_h$ and of their next generators, also for the Euler coordinate induced from $M_p$.
  We next prove regularity in $\( M_p \)_(*)$ itself. For $h gt.eq 1$, homogeneity in the polynomial coefficient ring gives
  $ x_h = c_h a_(p^h - 1) + D_h \( a_1 \, dots.h \, a_(p^h - 2) \) \, #h(2em) c_h in bb(Z)_(\( p \)) \, $
  where $D_h$ is decomposable. Under the projection to $upright("BP")_(*)$, the image of a generator of smaller degree cannot involve $v_h$. Consequently the coefficient of $v_h$ in the image of $x_h$ is the product of $c_h$ and the coefficient of $v_h$ in the image of $a_(p^h - 1)$. The preceding calculation says that this product is a unit modulo $p$. Thus $c_h$ is a $p$-local unit. Replacing $a_(p^h - 1)$ successively by $x_h$ is a triangular change of polynomial generators. Since $p$ is a nonzerodivisor, this proves regularity of $p \, x_1 \, x_2 \, dots.h$.
  Finally, work modulo $I_h$, with $h > 0$. This coefficient ring has characteristic $p$. Suppose that the $p$-series has a first nonzero term $c Z^s$. Since it is a formal group endomorphism, comparison of total degree $s$ in its compatibility with formal addition gives
  $ c \( X + Y \)^s = c X^s + c Y^s . $
  Hence $binom(s, i) c = 0$ for $0 < i < s$. If $s = p^r m$ with $p divides.not m$ and $m > 1$, then $binom(s, p^r) equiv m med \( mod med p \)$, which is a unit in any $bb(F)_p$-algebra. This is impossible for nonzero $c$. Thus $s$ must be a $p$-power. All possible such coefficients below $p^h$ are among $x_0 \, dots.h \, x_(h - 1)$ and have already been killed. This proves $k_u in I_h$ in the stated range. The argument uses no assumption that the quotient ring is a domain. ◻
]

=== 8.2 Borel cohomology and Euler divisibility <borel-cohomology-and-euler-divisibility>

Retain $G = C_p times.r bb(F)_p^times$, its real permutation representation $rho$, and $V = rho - 1$. For a subgroup $K lt.eq G$, set $H_K^(*) = M_p^(*) \( B K \)$. These are ordinary Borel cohomology groups; no Euler inversion or categorical localization is being performed in this section.

#thm([Lemma 8.2.])[
  #emph[For the Euler coordinate $x$ of a faithful complex character of $C_p$, restriction gives 
#[#set math.equation(numbering: n => "(8.2)")
 $ H_(C_p)^(*) = \( M_p \)^(*) \( upright("pt") \) \[ \[ x \] \] \/ \( \[ p \] \( x \) \) \, #h(2em) H_G^(*) arrow.r^(med tilde.eq med) \( H_(C_p)^(*) \)^(bb(F)_p^times) . $ <cob:borel-rings>]

 The projective-space formulas are 
$ M_p^(*) \( B K times bb(C) P^r \) = H_K^(*) \[ Z \] \/ \( Z^(r + 1) \) \, #h(2em) M_p^(*) \( B K times bb(C) P^oo \) = H_K^(*) \[ \[ Z \] \] \, $

 with graded power series in the infinite-dimensional case. Evaluation at a point of $B G$ detects units in $H_G^0$.]
] <cob:cohomology>

#proof[
  The classes $1 \, Z \, dots.h \, Z^r$ form a free basis for $M_p^(*) \( bb(C) P^r \)$. To see this at the module level, the cellular spectral sequence collapses because $M_p$ has even coefficients. The class $Z$ is a generator in filtration two, and its powers generate the successive even filtrations by the ordinary cup-product calculation. The resulting map
  $ xor.big_(j = 0)^r Sigma^(- 2 j) M_p arrow.r "map" \( bb(C) P_(+)^r \, M_p \) $
  of $M_p$-modules is an equivalence. The class $Z^(r + 1)$ vanishes because its filtration exceeds the dimension of $bb(C) P^r$. Applying cochains from $B K$ to this finite splitting proves the product formula at finite $r$. Passage to the inverse limit gives the power-series formula; the truncation maps are surjective, so there is no additional derived-limit term.
  The unit circle bundle of the $p$-th tensor power of the universal line over $bb(C) P^oo$ models $B C_p$. Its sphere-bundle triangle, together with the Thom isomorphism, identifies the relevant cochain map with multiplication by $\[ p \] \( x \)$. This power series is a nonzerodivisor in $\( M_p \)^(*) \( upright("pt") \) \[ \[ x \] \]$, since the coefficient ring is a polynomial domain. The resulting exact sequence gives the first formula in Equation (8.2).
  For the second formula, compute homotopy fixed points first by $C_p$ and then by its complement $bb(F)_p^times$. If a finite group $K$ has order invertible on a spectrum, homotopy fixed points calculate the invariants on homotopy groups without a boundedness hypothesis. Indeed, the map to the coinduction of the underlying spectrum and the sum map back have composite $\| K \|$. Finite induction and coinduction agree, so dividing this composite by $\| K \|$ gives a retraction. After taking homotopy fixed points, the coinduced term is the underlying spectrum, and the opposite composite is the averaging operator. Apply this to $K = bb(F)_p^times$ and to the $C_p$-homotopy fixed points of the constant spectrum $M_p$.
  Finally, a degree-zero Borel class acts as an $M_p$-linear endomorphism of the constant rank-one $M_p$-module over $B G$. If its value at a point is a unit, this endomorphism is a fiberwise equivalence, hence an equivalence of local systems. Its inverse is again such an endomorphism, proving the assertion about units. ◻
]

Define

#[#set math.equation(numbering: n => "(8.3)")
 $ epsilon.alt = e_(M_p) \( V ⊗_(bb(R)) bb(C) \) in H_G^q \, #h(2em) q = 2 \( p - 1 \) . $ <cob:epsilon>]

The restriction of this Euler class to $C_p$ is

$ epsilon.alt \|_(C_p) = product_(alpha = 1)^(p - 1) \[ alpha \] \( x \) = x^(p - 1) dot.op upright("a unit") . $

Here $\[ alpha \] \( x \)$ is the formal multiple for the character indexed by $alpha$, and its linear coefficient $alpha$ is a $p$-local unit.

#thm([Lemma 8.3.])[
  #emph[If a homogeneous class $y in H_G^(*)$ restricts to an element of $\( x^p \) subset H_(C_p)^(*)$, then $y$ is divisible by $epsilon.alt^2$ in $H_G^(*)$.]
] <cob:euler-divisibility>

#proof[
  For every $s > 0$, the quotient $\( x^s \) \/ \( x^(s + 1) \)$ in $H_(C_p)^(*)$ is annihilated by $p$: multiply the relation $\[ p \] \( x \) = 0$ by $x^(s - 1)$. A multiplier $alpha in bb(F)_p^times$ acts on this quotient by $alpha^s$, or its inverse if the opposite action convention is used. For
  $ p lt.eq s < 2 \( p - 1 \) \, $
  this character is nontrivial. An invariant element in $\( x^s \)$ therefore maps to zero in $\( x^s \) \/ \( x^(s + 1) \)$, since some $alpha^s - 1$ is a unit modulo $p$. Iterating over this finite range shows that $y \|_(C_p)$ lies in $\( x^(2 \( p - 1 \)) \)$.
  Since $epsilon.alt \|_(C_p)$ is $x^(p - 1)$ times a unit, there is a homogeneous $z in H_(C_p)^(*)$ with $y \|_(C_p) = epsilon.alt^2 z$. Average $z$ over $bb(F)_p^times$. Both $y \|_(C_p)$ and $epsilon.alt$ are invariant, so the averaged divisor still has product $y \|_(C_p)$ with $epsilon.alt^2$. By Lemma 44, this invariant divisor comes from $H_G^(*)$. Notice that this argument neither asserts that $epsilon.alt$ is a nonzerodivisor nor cancels a factor of $epsilon.alt$. ◻
]

=== 8.3 Thom-corrected permutation powers <thom-corrected-permutation-powers>

We next define the ordinary primewise operation used in the calculation. Its Thom construction belongs to the cobordism power methods of tom Dieck and Quillen #cite(label("tomDieck1968")) #cite(label("Quillen1971")); the Euler factors will be retained explicitly here. For a space $X$ and $f in M_p^(2 d) \( X \)$, represent $f$ by a map

$ S^(- 2 d) and X_(+) arrow.r M_p . $

Apply the permuted $p$-fold smash, pull back along the diagonal of $X^p$, and use the commutative multiplication on $M_p$. This gives a map of spectra with naive $G$-action

$ S^(- 2 d rho) and X_(+) arrow.r "Tr" M_p . $

The virtual real representation $2 d \( rho - p \)$ is complex. Choose its complex Thom trivialization

$ S^(2 d \( rho - p \)) arrow.r "Tr" M_p . $

Tensoring the two maps and multiplying in $M_p$ replaces the source representation by $- 2 p d$. We obtain

#[#set math.equation(numbering: n => "(8.4)")
 $ Pi_p \( f \) in M_p^(2 p d) \( B G times X \) . $ <cob:pi-definition>]

The choices of Thom trivialization depend only on the integer $d$, not on $X$ or $f$. Such a Thom map induces an equivalence after extension to $M_p$-modules because it does so on every fiber. Negative values of $d$ cause no difficulty: the corresponding trivializations are obtained by dualizing those of actual complex bundles. This construction agrees with the even-degree Thom construction of #cite(label("JohnsonNoel2010")) Section 3.2, with allowance for the chosen orientation units.

For a space $X$, let $frak(t)_G \( X \)$ denote the additive subgroup of $M_p^(*) \( B G times X \)$ generated by transfers from the subgroups of $G$ whose orders are prime to $p$. It is a graded ideal by the projection formula. Write $frak(t)_G = frak(t)_G \( upright("pt") \)$.

#thm([Lemma 8.4.])[
  #emph[The operation $Pi_p$ is natural in $X$. For homogeneous even-degree classes $f$ and $g$, its product rule has the form 
$ Pi_p \( f g \) = alpha thin Pi_p \( f \) Pi_p \( g \) \, #h(2em) alpha in \( H_G^0 \)^times \, $

 where $alpha$ depends on their degrees and the Thom choices and is pulled back from $B G$. On any finite sum of classes in the same even degree, $Pi_p$ is additive modulo $frak(t)_G \( X \)$. For $X = bb(C) P^r$, extracting a coefficient of $Z^s$ sends $frak(t)_G \( X \)$ into $frak(t)_G$.]
] <cob:power-rules>

#proof[
  Naturality follows from the diagonal construction. Before the Thom correction, the product rule follows from the symmetric monoidal permuted smash and the commutative multiplication of $M_p$. Compare the product of the two chosen Thom trivializations with the chosen trivialization for the sum of the degrees. Their ratio is an automorphism of a constant suspended rank-one $M_p$-module over $B G$, hence a unit in $H_G^0$. This comparison is made before introducing $X$, so the factor has no dependence on its cohomology classes.
  To examine a finite sum of classes in one degree, factor the sum map through a finite biproduct and distribute the $p$-fold smash over that biproduct. The summands are indexed by label tuples on the $p$ letters. A constant label tuple gives exactly the power of the corresponding summand. The stabilizer of a nonconstant tuple has order prime to $p$: otherwise it contains the unique subgroup $C_p$ of order $p$, whose transitive action on the letters would force the labels to be constant. The other orbits therefore factor through inductions from prime-to-$p$ subgroups.
  A composite between trivially acting endpoints that factors through an induction from a subgroup is the corresponding additive transfer. This follows by the induction–restriction adjunction and the coinduction–restriction adjunction, using equality of finite induction and coinduction; their unit and counit give the transfer of the composite at the subgroup. Tensoring with a Thom trivialization and multiplying do not change the property of factoring through such an induction. This proves additivity modulo $frak(t)_G \( X \)$ and also explains directly its stability under multiplication by classes from the larger group.
  For the last assertion, use the finite $M_p$-module splitting of the cochains of $bb(C) P^r$ from Lemma 44. Coefficient extraction is the projection onto one of its summands. Taking cochains from a space with trivial group action commutes with finite induction, since that induction is a finite sum. Consequently these projections commute with transfers and take a transfer error to a transfer error on the coefficient spectrum. ◻
]

Let $P$ be the universal line bundle on $bb(C) P^oo$, and put $h \( Z \) = Pi_p \( Z \)$. The next formula both identifies its first coefficient and controls the remaining coefficients by the Euler filtration.

#thm([Lemma 8.5.])[
  #emph[There is a unit $U \( Z \) in M_p^0 \( B G times bb(C) P^oo \)^times$ such that 
#[#set math.equation(numbering: n => "(8.5)")
 $ h \( Z \) = U \( Z \) thin e_(M_p) #scale(x: 120%, y: 120%)[\(] P ⊗ \( rho ⊗_(bb(R)) bb(C) \) #scale(x: 120%, y: 120%)[\)] . $ <cob:euler-product>]

 In particular, $h \( Z \)$ has no constant term and 
#[#set math.equation(numbering: n => "(8.6)")
 $ \[ Z \] h \( Z \) = U \( 0 \) epsilon.alt \, #h(2em) h \( Z \) \|_(C_p) = U \( Z \) \|_(C_p) product_(alpha = 0)^(p - 1) #scale(x: 120%, y: 120%)[\(] Z +_(upright("MU")) \[ alpha \] \( x \) #scale(x: 120%, y: 120%)[\)] . $ <cob:linear-coefficient>]

]
] <cob:euler-power>

#proof[
  Represent $Z$ by the zero section of $P$ followed by its Thom map. Fiberwise, the normalized Thom map is a map from the local sphere $S^(P - bb(C))$ to $M_p$ that becomes an equivalence after extending to $M_p$-modules. Thom spectra can be formed as colimits of these sphere local systems. Thus the external permuted smash of the Thom maps, which commutes with their colimits, is the corresponding fiberwise construction on the external sum of the bundles. On pulling back to the diagonal and making the Thom correction in Equation (8.4), the zero section becomes that of $P ⊗ \( rho ⊗_(bb(R)) bb(C) \)$.
  The subsequent map of its sphere local system, normalized by $bb(C)^p$, is an $M_p$-linear equivalence after extension: on each fiber it is the product of the chosen units. Its ratio to the ordinary Thom equivalence of this bundle is therefore a unit over $B G times bb(C) P^oo$. This is the class $U \( Z \)$ in Equation (8.5).
  Restricted to $C_p$, the complex permutation representation splits into the characters indexed by $alpha in bb(F)_p$. Multiplicativity of Euler classes and the formal group law give the product in Equation (8.6). The trivial summand gives the factor $Z$, so the constant term vanishes; evaluating every other factor at $Z = 0$ gives the linear coefficient $U \( 0 \) epsilon.alt$. With compatible canonical Thom choices this is the usual exact Euler-product formula #cite(label("JohnsonNoel2010")) Equations (4.11) and (4.14); the unit-factor version suffices here. ◻
]

=== 8.4 Extraction of the next coefficient <extraction-of-the-next-coefficient>

Fix an integer $a gt.eq 0$. We now compare the power of the $p$-series with the $p$-series substituted into $h$. The relation below has leading terms $Pi_p \( x_a \)$ and $epsilon.alt x_(a + 1)$, each with a unit coefficient. It separates four kinds of error: multiples of $epsilon.alt^2$, products $x_j x_k$ with $j \, k lt.eq a$, earlier powers $Pi_p \( x_j \)$ with $j < a$, and additive transfers. In the Hurewicz induction of Section 9, the first two kinds will become divisible by $t^2$, and the last two will vanish. This leaves the comparison of leading terms from which one factor of $t$ can be canceled before reduction modulo $t$.

#thm([Proposition 8.6.])[
  #emph[For each integer $a gt.eq 0$ there are homogeneous coefficients in $H_G^(*)$ and units $C \, C' in \( H_G^0 \)^times$ such that 
#[#set math.equation(numbering: n => "(8.7)")
 $ C Pi_p \( x_a \) =  & C' epsilon.alt x_(a + 1) + epsilon.alt^2 D_(*) + sum_(0 lt.eq j \, k lt.eq a) D_(j k) x_j x_k\
 & + sum_(0 lt.eq j < a) H_j Pi_p \( x_j \) + T_(*) \, #h(2em) T_(*) in frak(t)_G . $ <eq:cobordism>]

 All terms have cohomological degree $- p d_a$; coefficients in the two sums and $D_(*)$ are in the complementary degrees.]
] <cob:coefficient-relation>

#proof[
  Set $r_(*) = p^(a + 1)$, and work on $bb(C) P^(r_(*))$. Tensoring the universal line $p$ times gives a classifying map to $bb(C) P^oo$ that pulls $Z$ back to $\[ p \] \( Z \)$. Naturality of $Pi_p$ therefore gives $h \( \[ p \] \( Z \) \)$ for the power of this Euler class. All substitutions can be made at finite truncation: by cellular approximation, the classifying map from $bb(C) P^(r_(*))$ factors up to homotopy through its $2 r_(*)$-dimensional skeleton, and $Z^(r_(*) + 1) = 0$ on this space.
  Alternatively, expand $\[ p \] \( Z \)$ as in Equation (8.1). Each summand $k_u Z^u$ has cohomological degree two, so the additivity assertion of Lemma 46 applies. Repeated use of its product rule gives
  #[#set math.equation(numbering: n => "(8.8)")
   $ h \( \[ p \] \( Z \) \) equiv sum_(1 lt.eq u lt.eq r_(*)) alpha_u Pi_p \( k_u \) h \( Z \)^u med \( mod med Z^(r_(*) + 1) \, med frak(t)_G \( bb(C) P^(r_(*)) \) \) \, $ <cob:series-comparison>]
  where every $alpha_u$ is a unit in $H_G^0$ pulled back from $B G$. These factors may depend on $u$ and on the Thom choices; no compatibility between them is required below.
  Extract the coefficient of $Z^(r_(*))$. Since both sides of Equation (8.8) have degree $2 p$, this coefficient has degree
  $ 2 p - 2 r_(*) = - p d_a . $
  The transfer error remains an element of $frak(t)_G$ by Lemma 46.
  First consider the term $u = p^a$ on the right. Put $A_u = \[ Z^(r_(*)) \] h \( Z \)^u$. Its degree at $u = p^a$ is zero. At a point of $B G$, the permutation bundle is trivial and Equation (8.5) becomes $h \( Z \) = U \( Z \) Z^p$. Consequently
  $ A_(p^a) \|_(upright("pt")) = U \( 0 \) \|_(upright("pt"))^(thin p^a) \, $
  a scalar unit. Lemma 44 shows that $A_(p^a)$ is a unit of $H_G^0$. Multiplication by $alpha_(p^a)$ gives the coefficient $C$ of $Pi_p \( x_a \)$.
  If $u > p^a$, restrict to $C_p$. Each of the $p u$ formal-addition factors in the product expression for $h \( Z \)^u$ lies in the ideal $\( Z \, x \)$. The additional factor $U \( Z \)^u$ is an ordinary power series in these variables, and hence cannot decrease this ideal order. Therefore
  $ A_u \|_(C_p) in \( x^(p u - r_(*)) \) \, #h(2em) p u - r_(*) gt.eq p . $
  This assertion can be checked using any power-series lifts before quotienting by $\[ p \] \( x \)$; all exponents of $x$ and $Z$ are nonnegative. Since $A_u$ comes from $B G$, Lemma 45 gives $A_u in epsilon.alt^2 H_G^(*)$. After multiplication by $alpha_u Pi_p \( k_u \)$ and summation, all such terms contribute to $epsilon.alt^2 D_(*)$.
  For $1 lt.eq u < p^a$, Lemma 43 gives a finite homogeneous expression
  $ k_u = sum_(0 lt.eq j < a) c_(u \, j) x_j quad upright("in ") \( M_p \)_(*) . $
  All summands have the same degree as $k_u$. Applying the sum and product rules of Lemma 46 expresses $Pi_p \( k_u \)$, modulo transfers, as a sum of multiples of $Pi_p \( x_j \)$ for $j < a$. Multiplying by $alpha_u A_u$ and collecting terms yields the last ideal sum in Equation (8.7). When $a = 0$ this range is empty.
  It remains to describe the coefficient on the left of Equation (8.8). Write $h \( Z \) = sum_(s gt.eq 1) h_s Z^s$. Its linear term contributes
  $ h_1 \[ Z^(r_(*)) \] \[ p \] \( Z \) = U \( 0 \) epsilon.alt x_(a + 1) . $
  This is the displayed main term, with a unit coefficient. Every contribution from $h_s \[ p \] \( Z \)^s$ for $s gt.eq 2$ is a product of at least two coefficients $k_u$ with $1 lt.eq u < r_(*)$. Each is in $I_(a + 1)$ by Lemma 43. Thus these contributions belong to $I_(a + 1)^2 H_G^(*)$ and can be written as the displayed sum of $x_j x_k$ for $j \, k lt.eq a$.
  Move the other right-hand terms to the left or absorb their signs into their coefficients. The unit multiplying the main term remains a unit, giving Equation (8.7). Every sum used above is finite at this fixed prime. After collection there are only the displayed finitely many ideal factors, although their coefficients and the expression for $T_(*)$ may vary with $p$ without a uniform bound on the number of intermediate terms. ◻
]

== 9 Hurewicz detection and finite realization <sec:realization>

Fix $n gt.eq 1$. Proposition 41 constructed the classes $b_0 \, dots.h \, b_n$, the objects $Y_0 \, dots.h \, Y_(n + 1)$, and the auxiliary algebras $L_a$. We now identify the cobordism Hurewicz image of each $b_j$. This identification will show that the successive cofibers kill the first powers of the coefficients $x_j$, and hence the first powers of the Hazewinkel generators after passage to $upright("BP")$.

Write $M = \( M_p \)_p$, where $M_p = upright("MU")_(\( p \))$, and retain the ideals $I_j = \( x_0 \, dots.h \, x_(j - 1) \) subset.eq \( M_p \)_(*)$ of Section 8. We set $I_0 = 0$. For each prime, let $overline(I)_j subset.eq upright("BP")_(*)$ denote the ideal generated by the images of these coefficients. Lemma 43 identifies $overline(I)_j = \( p \, v_1 \, dots.h \, v_(j - 1) \)$ for $j gt.eq 1$, with $overline(I)_0 = 0$.

=== 9.1 The finite diagram and its effect on homology <the-finite-diagram-and-its-effect-on-homology>

Let $u_j : upright(bold(1)) arrow.r Y_j$ be the unit and let

$ mu_j : S \( w_j \) ⊗ Y_j arrow.r Y_j \, #h(2em) c_j : Y_j arrow.r Y_(j + 1) $

be, respectively, multiplication by $b_j : S \( w_j \) arrow.r Y_j$ and its cofiber map. The construction supplies the homotopies

#[#set math.equation(numbering: n => "(9.1)")
 $ mu_j compose \( "id" ⊗ u_j \) tilde.eq b_j \, #h(2em) c_j compose u_j tilde.eq u_(j + 1) \, #h(2em) "cofib" \( mu_j \) tilde.eq Y_(j + 1) \, $ <real:finite-identities>]

where the last equivalence respects the cofiber map. Only these maps, homotopies, and cofiber identifications, for $0 lt.eq j lt.eq n$, will be needed at individual primes.

They form finite diagram data in $cal(C)$. By the description of $cal(C)$ as a filtered colimit of product categories, they have representatives on a common $cal(U)$-large set of primes. To be explicit, choose representatives of the finitely many objects and maps, then representatives of the finitely many homotopies in Equation (9.1). An equivalence of cofibers is represented together with an inverse and the two inverse homotopies. Shrinking the prime set finitely many times makes all these choices valid together. Calibrate each of the finitely many source spheres $S \( w_j \)$ with $S^(d_j)$ at the primes. We obtain spectra $Y_(j \, p)$, maps $u_(j \, p) \, b_(j \, p) \, mu_(j \, p) \, c_(j \, p)$, and cofiber sequences

#[#set math.equation(numbering: n => "(9.2)")
 $ Sigma^(d_j) Y_(j \, p) arrow.r^(mu_(j \, p)) Y_(j \, p) arrow.r^(c_(j \, p)) Y_(j + 1 \, p) . $ <real:primewise-cofibers>]

No descent of the full commutative algebra structures on the $Y_j$ is involved in this assertion.

The following elementary observation explains why this finite diagram is enough to compute homology in every degree.

#thm([Lemma 9.1.])[
  #emph[Let $E$ be a ring spectrum whose coefficient ring $R = pi_(*) E$ is graded commutative and concentrated in even degrees. Let $J$ be a homogeneous ideal of $R$, and let $u : S arrow.r Y$ induce the quotient identification $E_(*) Y tilde.equiv R \/ J$. Suppose that $b : S^d arrow.r Y$ and $mu : Sigma^d Y arrow.r Y$, with $d$ even, satisfy $mu compose Sigma^d u tilde.eq b$. If the $E$-Hurewicz image of $b$ is $a$ times the image of a homogeneous element $x in R_d$, where $a in R_0^times$ and multiplication by $x$ is injective on $R \/ J$, then the composite $S arrow.r^u Y arrow.r "cofib" \( mu \)$ induces 
$ E_(*) "cofib" \( mu \) tilde.equiv R \/ \( J \, x \) . $

 This is an identification of the entire graded module.]
] <real:cofiber-quotient>

#proof[
  The map on $E$-homology induced by any spectrum map is $R$-linear. Its source here is the shifted cyclic module $Sigma^d R \/ J$, and the given homotopy says that it takes its generator to $a x$. It is therefore multiplication by $a x$ on all homogeneous elements. This map is injective. The cofiber long exact sequence consequently gives, for every integer $k$,
  $ 0 arrow.r \( R \/ J \)_(k - d) arrow.r^(thin a x thin) \( R \/ J \)_k arrow.r E_k "cofib" \( mu \) arrow.r 0 . $
  The quotient map in this sequence is induced by the cofiber map, so the resulting identification is induced by the stated map from the sphere. Since $a$ is a unit, its cokernel is $R \/ \( J \, x \)$. ◻
]

=== 9.2 Detection before Euler inversion <detection-before-euler-inversion>

For $0 lt.eq a < n$, abbreviate

$ s_a = \( w_a \, 0 \, 0 \) \, #h(2em) i_a = \( w_a \, 0 \, - 1 \) = s_a - tau . $

In the arguments below, a quotient by $t$ denotes the underlying cofiber of multiplication by $t$. It agrees with the underlying module of the algebra quotient by $t$. Thus the $M$-version of Equation (7.1) reads

#[#set math.equation(numbering: n => "(9.3)")
 $ \( L_a^M \/ t \)_i tilde.eq h_Omega \( M ⊗ Y_(a + 1) \)_(F \( i \)) #h(2em) \( i in I \) . $ <real:target-layer-M>]

These equivalences respect the unit, the maps from the base layer, and the reduction of $g_a$ used to define $b_(a + 1)$.

#thm([Lemma 9.2.])[
  #emph[Suppose that, on a $cal(U)$-large set of primes, 
$ \( M_p \)_(*) Y_(a + 1 \, p) tilde.equiv \( M_p \)_(*) \/ I_(a + 1) $

 via the unit. Then multiplication by $t$ is injective on $pi_0 L_a^M$ at every index. In particular, 
$ pi_0 \( L_a^M \)_i arrow.r pi_0 \( L_a^M \[ t^(- 1) \] \)_i $

 is injective for every $i in I$.]
] <real:t-injectivity>

#proof[
  The coefficient ring of $M_p$ and its quotient by $I_(a + 1)$ are concentrated in even degrees. Every degree $d \( F \( i \) \)$ is even. Equation (9.3) therefore gives $pi_1 \( L_a^M \/ t \)_i = 0$ for every fixed $i$. In the exact sequence of the cofiber
  $ \( L_a^M \)_(i - tau) arrow.r^t \( L_a^M \)_i arrow.r \( L_a^M \/ t \)_i \, $
  this vanishing proves the asserted injectivity. Localization is the componentwise telescope along multiplication by $t$. Homotopy groups commute with that filtered colimit, and every transition on $pi_0$ is injective, which proves the last assertion. Notice that this argument uses only the evenness of the layer; it makes no evenness assertion about the completed algebra $L_a^M$. ◻
]

For a coefficient $x_j$, let $cal(P) \( x_j \)$ denote its raw powered class in $pi_0 \( L_a^M \)_(s_j)$: represent $x_j$ at each prime by a map $S^(d_j) arrow.r M_p$, take its permuted $p$-fold smash, multiply in $M_p$, and map the resulting class from $B \( M \)$ to $L_a^M$. This definition is made before inverting $t$. For $u in D^times$, define $cal(P) \( u \) in pi_0 \( L_a^M \)_0$ in the same way using scalar maps. We do not assert additivity of these raw classes before localization.

#thm([Lemma 9.3.])[
  #emph[Assume the hypothesis of Lemma 50. Suppose also that $\( M_p \)_(*) Y_(a \, p) tilde.equiv \( M_p \)_(*) \/ I_a$ via the unit on a $cal(U)$-large set, and that the $M$-Hurewicz image of $b_a$ equals $u x_a$ for some $u in D^times$. Then, before inverting $t$, 
#[#set math.equation(numbering: n => "(9.4)")
 $ cal(P) \( x_j \) & = 0 &  & upright("in ") pi_0 \( L_a^M \)_(s_j) quad \( 0 lt.eq j < a \) \,\
t g_a & = cal(P) \( u \) cal(P) \( x_a \) &  & upright("in ") pi_0 \( L_a^M \)_(s_a) . $ <eq:before-inversion>]

 Here $g_a$ also denotes its image under base change to $M$, and $cal(P) \( u \)$ is a unit at index zero.]
] <real:raw-powers>

#proof[
  Apply Proposition 42 and Equation (7.6). The classes $x_j$ for $j < a$ vanish in its source $h_Lambda \( M ⊗ Y_a \)$, and their images in the target are the localizations of $cal(P) \( x_j \)$. The same comparison takes the Hurewicz image of $b_a$ to $t g_a$. Since it is a map of rational graded algebras and that Hurewicz image is $u x_a$, its value is the localization of $cal(P) \( u \) cal(P) \( x_a \)$. Lemma 50 now proves both equalities before inversion. No linearity over $D$ is required of the powered comparison.
  Raw powering is multiplicative on the represented scalar maps: the product of the permuted powers of two maps is the permuted power of their product, followed by the commutative multiplication of $M_p$. Apply this to primewise representatives of $u$ and $u^(- 1)$. It gives $cal(P) \( u \) cal(P) \( u^(- 1) \) = 1$ already in $B \( M \)$, and hence in $L_a^M$. ◻
]

=== 9.3 Putting the cobordism relation at fixed indices <putting-the-cobordism-relation-at-fixed-indices>

Equation (8.7) is an identity of Borel cohomology classes at each prime. Its ordinary degree varies with the prime, whereas $L_a^M$ is indexed by the fixed lattice $I$. We describe the comparison, including its unit ambiguities and its effect on transfers.

For $i = \( lambda \, delta \, m \)$, the representation underlying $W_i$ at the prime $p$ is

$ d \( lambda \) rho + d \( delta \) - 2 m V \, #h(2em) d \( F \( i \) \) = p thin d \( lambda \) + d \( delta \) - q m . $

This is a virtual complex representation: $d \( lambda \)$ and $d \( delta \)$ are even, and $2 V$ is the underlying real representation of $V ⊗_(bb(R)) bb(C)$. Complex Thom equivalences thus identify $W_i ⊗ "Tr" M_p$ with $"Tr" S^(d \( F \( i \) \)) ⊗ "Tr" M_p$, as $M_p$-modules with naive $G$-action. The equivalences for virtual negative summands are obtained by dualizing. For each fixed index these equivalences give additive maps

#[#set math.equation(numbering: n => "(9.5)")
 $ theta_i : product_(cal(U)) M_p^(- d \( F \( i \) \)) \( B G \) arrow.r pi_0 B \( M \)_i arrow.r pi_0 \( L_a^M \)_i . $ <real:borel-comparison>]

At index zero choose the unit identification, so $theta_0$ is a ring map. The other $theta_i$ respect its scalar action.

If two such Thom equivalences are multiplied and compared with the equivalence at the sum of their indices, the discrepancy is an automorphism of a suspended free rank-one $M_p$-module over $B G$. It is therefore multiplication by a unit of $M_p^0 \( B G \)$. Consequently products under the maps $theta_i$ agree up to images of units under $theta_0$. All comparisons we will use involve a fixed finite list of indices. Their representatives and the tensor identifications can be chosen on a common large prime set; a simultaneous primewise realization of the entire Picard grading is unnecessary.

#thm([Lemma 9.4.])[
  #emph[Fix $0 lt.eq a < n$, and suppose that $\( M_p \)_(*) Y_(a + 1 \, p) tilde.equiv \( M_p \)_(*) \/ I_(a + 1)$ via the unit on a $cal(U)$-large set. The maps in Equation (9.5) have the following properties.]
  + #emph[The image $theta_tau \( epsilon.alt \)$ is a unit at index zero times $t$.]
  + #emph[For $j lt.eq a$, the image $theta_(s_j) \( Pi_p \( x_j \) \)$ is a unit at index zero times $cal(P) \( x_j \)$.]
  + #emph[Put $delta_j = \( 0 \, w_j \, 0 \)$. For $j lt.eq a$, the class $theta_(delta_j) \( x_j \)$ lies in the image of 
$ t : pi_0 \( L_a^M \)_(delta_j - tau) arrow.r pi_0 \( L_a^M \)_(delta_j) . $

]
  + #emph[Set $X_(a + 1) = theta_(i_a) \( x_(a + 1) \)$. Under Equation (9.3), its reduction modulo $t$ is a unit at index zero times the image of the ordinary coefficient $x_(a + 1)$ in $\( M_p \)_(*) Y_(a + 1 \, p)$, at weight $w_(a + 1)$.]
  + #emph[Every sequence of finite sums of additive transfers from prime-to-$p$ subgroups, in the degree assigned to any fixed index, has zero image under $theta_i$. The number of summands may depend on $p$.]
] <real:thom-comparisons>

#proof[
  For the first assertion, recall that $epsilon.alt$ is the Euler class of the complex representation $V ⊗_(bb(R)) bb(C)$, whose underlying real representation is $2 V$. Its zero-section map, after the Thom identification, is the map $upright(bold(1)) arrow.r T^2$ defining $t$. Changing the Thom equivalence changes it by a degree-zero unit. The second assertion follows by undoing the Thom conversion in the definition of $Pi_p$: the source $W_(s_j)$ is exactly the permuted sphere $N \( S \( w_j \) \)$. Both constructions then use the same permuted smash of the coefficient map and multiplication in $M_p$.
  At $delta_j$ the source is the untwisted sphere $"Tr" S \( w_j \)$. The scalar compatibility of Equation (4.5), followed by its extension to Equation (7.1), identifies the reduction of $theta_(delta_j) \( x_j \)$ with the usual coefficient action on $M ⊗ Y_(a + 1)$, up to the allowed unit. This action is zero because $x_j in I_(a + 1)$. Exactness of the cofiber sequence for $t$ proves the third assertion.
  For the fourth assertion, first note that
  $ F \( i_a \) = w_(a + 1) \, #h(2em) d \( F \( i_a \) \) = p d_a + q = d_(a + 1) . $
  It remains to check the coefficient, since equality of these degrees alone does not identify the two maps. Recall that Equation (4.5) is constructed through $Phi \( M \)$ using the chosen $J^or$-linear sphere comparison
  $ J^or ⊗ W_i tilde.eq J^or ⊗ "Tr" S \( F \( i \) \) . $
  Extend this comparison to $J^or ⊗ "Tr" M$. Also extend the Borel Thom comparison defining $theta_i$ along the unit of $J^or$. The two are trivializations of the same free twisted rank-one module. Their ratio is an invertible endomorphism, hence a unit in $pi_0 Phi \( M \)_0$. With the first trivialization, the constant coefficient map $S^(d \( F \( i \) \)) arrow.r M_p$, followed by the $J^or$-unit, is precisely the coefficient supplied by the right-hand comparison of Equation (4.5). The second trivialization therefore gives that coefficient times the stated unit. Extending from this base layer to Equation (9.3) uses the actual unit and tower maps, so it preserves this comparison.
  Finally, an additive transfer from $H lt.eq G$ factors through an induced object $"Ind"_H^G Z$. If $\| H \|$ is prime to $p$, then $Z$ is a retract of $"Ind"_({ 1 })^H "Res"_({ 1 })^H Z$: the diagonal and sum maps have composite $\| H \|$, which is invertible $p$-locally. Inducing to $G$ makes the original induction a retract of a free $G$-induction. At each prime, factor a finite sum of transfers through the direct sum of these induced objects. That entire sum is a retract of one free induction on the direct sum of the underlying spectra. Although its size may grow with $p$, these sums form a single sequence object, and their free inductions are among the objects killed by the defining localization to $cal(E)$. Tensoring with a representation sphere preserves induction by the projection formula, and composing with the Thom maps preserves the factorization. Thus the whole transfer error has zero image already in $B \( M \)$, before Euler inversion or completion. ◻
]

=== 9.4 The Hurewicz induction <the-hurewicz-induction>

#thm([Proposition 9.5.])[
  #emph[There is a $cal(U)$-large set of primes on which the unit maps induce, simultaneously for $0 lt.eq j lt.eq n + 1$, 
#[#set math.equation(numbering: n => "(9.6)")
 $ \( M_p \)_(*) Y_(j \, p) tilde.equiv \( M_p \)_(*) \/ I_j \, #h(2em) upright("BP")_(*) Y_(j \, p) tilde.equiv upright("BP")_(*) \/ overline(I)_j . $ <real:homology-quotients>]

 For every $0 lt.eq j lt.eq n$, there is a scalar $u^(\( j \)) in D^times$ such that the $M$-Hurewicz image of $b_j$ equals $u^(\( j \)) x_j$ in $pi_0 h_Omega \( M ⊗ Y_j \)_(w_j)$.]
] <real:hurewicz>

#proof[
  At $j = 0$, the quotient assertions hold because $Y_0 = upright(bold(1))$, and the Hurewicz assertion holds because $b_0 = pi.alt u_0$ represents the sequence $p = x_0$ at weight $w_0$. Lemmas 43 and 49, applied to Equation (9.2), give both quotient assertions for $Y_1$.
  Suppose now that $0 lt.eq a < n$, that the Hurewicz assertions hold through $a$, and that the quotient assertions hold through $a + 1$. Lemmas 50 and 51 apply. We will use Proposition 48 to identify the reduction of $g_a$, which by construction is the Hurewicz image of $b_(a + 1)$.
  Map Equation (8.7) to $L_a^M$ at total index $s_a = i_a + tau$. Its total cohomological degree is $- p d_a$. The index assignments for its factors and error coefficients are
  $ upright("class") & upright("index") & upright("class") & upright("index")\
C \, C' & 0 & Pi_p \( x_j \) & s_j\
epsilon.alt & tau & x_j med \( j lt.eq a \) & delta_j\
x_(a + 1) & i_a & D_(*) & s_a - 2 tau\
D_(j k) & s_a - delta_j - delta_k & H_j & s_a - s_j . $
  These are fixed indices in $I$. They have exactly the required ordinary degrees: for example, $d \( F \( i_a \) \) = d_(a + 1)$, $d \( F \( s_a - 2 tau \) \) = p d_a + 2 q$, and $d \( F \( s_a - delta_j - delta_k \) \) = p d_a - d_j - d_k$. Thus each coefficient in the primewise relation defines a sequence in the source of the appropriate $theta_i$. There is no requirement that these coefficients themselves have formulas independent of $p$.
  Lemma 52 and Equation (9.4) now account for every term. The earlier powered coefficients $cal(P) \( x_j \)$, $j < a$, vanish. The $epsilon.alt^2 D_(*)$ term is divisible by $t^2$. Each $x_j$, $j lt.eq a$, assigned to $delta_j$, is divisible by $t$, so every $D_(j k) x_j x_k$ term is also divisible by $t^2$. The complete transfer error vanishes, including when the number of its primewise summands grows. Products under the Thom comparisons introduce only index-zero units. Since $C \, C'$ and $cal(P) \( u^(\( a \)) \)$ are units, the two remaining leading terms give
  #[#set math.equation(numbering: n => "(9.7)")
   $ t #scale(x: 120%, y: 120%)[\(] U_1 g_a - U_2 X_(a + 1) #scale(x: 120%, y: 120%)[\)] = t^2 z quad upright("in ") pi_0 \( L_a^M \)_(s_a) \, $ <real:cancel-equation>]
  where $U_1 \, U_2 in pi_0 \( L_a^M \)_0^times$ and $z in pi_0 \( L_a^M \)_(s_a - 2 tau)$. After the error coefficients in Equation (8.7) have been collected, the list of terms just used has size bounded in terms of $a$.
  Multiplication by $t$ from index $i_a$ to index $s_a$ is injective by Lemma 50. Canceling it in Equation (9.7) gives
  $ U_1 g_a - U_2 X_(a + 1) = t z . $
  Reduce modulo $t$ and use Equation (9.3). The reduction of $g_a$ is the $M$-Hurewicz image of $b_(a + 1)$, because the construction of the new cycle and its chosen attaching-map path commutes with the unit from the sphere to $M$. Lemma 52 identifies the reduction of $X_(a + 1)$ with a unit times the ordinary coefficient $x_(a + 1)$. We have therefore proved that the Hurewicz image of $b_(a + 1)$ is a unit at index zero times that coefficient, at weight $w_(a + 1)$.
  This unit can be replaced by a scalar in $D^times$. Indeed, at index zero the actual layer has
  #[#set math.equation(numbering: n => "(9.8)")
   $ pi_0 \( L_a^M \/ t \)_0 tilde.equiv product_(cal(U)) \( M_p \)_0 Y_(a + 1 \, p) tilde.equiv product_(cal(U)) bb(F)_p tilde.equiv D \/ pi.alt . $ <real:scalar-layer>]
  The identifications are ring identifications via the unit: the quotient assertion identifies the underlying degree-zero module, and the unit map is already a ring map in the ultraproduct. Here $I_(a + 1)$ contains $p$, and its other generators have positive ordinary degree. A unit in $D \/ pi.alt$ has a representative whose residue at $p$ is nonzero on a $cal(U)$-large set. Lift those residues to elements of $bb(Z)_(\( p \))^times$, and choose arbitrary units at the remaining primes. This gives the required lift in $D^times$. Its action agrees with that of the original layer unit. Denote the resulting scalar by $u^(\( a + 1 \))$.
  The resulting Hurewicz equality is an equality in the one specified mapping group
  $ pi_0 "map"_(cal(C)) \( S \( w_(a + 1) \) \, M ⊗ Y_(a + 1) \) tilde.equiv product_(cal(U)) \( M_p \)_(d_(a + 1)) Y_(a + 1 \, p) . $
  It consequently holds on a $cal(U)$-large set at the actual primes, with scalar representatives in $bb(Z)_(\( p \))^times$. Naturality under the multiplicative projection $M_p arrow.r upright("BP")$ gives the analogous Hurewicz equality in $upright("BP")$-homology. Lemma 43 makes both coefficient classes nonzerodivisors in the current quotients. Applying Lemma 49 gives the two quotient assertions for $Y_(a + 2 \, p)$, in all degrees at once.
  This completes the induction. At each step the Hurewicz equality requires only one new large-set restriction, together with the finitely many comparisons used at that step. The calculation of the entire homology module then holds at every prime of that set by coefficient linearity and the cofiber exact sequence. Since $n$ is fixed, intersecting the finitely many resulting sets proves the simultaneous assertion. In particular, no intersection over all homological degrees, weights, or infinitely many stages is taken. ◻
]

=== 9.5 Finiteness and proof of the main theorem <finiteness-and-proof-of-the-main-theorem>

#thm([Lemma 9.6.])[
  #emph[The $p$-localizations of finite CW spectra are closed under the finite suspensions and cofibers in Equation (9.2).]
] <real:finite-descent>

#proof[
  Suspensions preserve this class. For finite CW spectra $F_0 \, F_1$, compactness of $F_0$, and the expression of localization as a filtered colimit of multiplication maps, give
  $ \[ \( F_0 \)_(\( p \)) \, \( F_1 \)_(\( p \)) \] tilde.equiv \[ F_0 \, F_1 \] ⊗ bb(Z)_(\( p \)) . $
  Thus a map between these localizations has the form $f \/ s$, where $f : F_0 arrow.r F_1$ is a stable map and $p divides.not s$. Precomposing or postcomposing with multiplication by $s$, an equivalence after localization, identifies its cofiber with $"cofib" \( f \)_(\( p \))$. The cofiber of a stable map of finite CW spectra is again a finite CW spectrum: represent the map after a finite suspension by a cellular map between finite CW models and take its finite mapping cone, then desuspend. This proves the claim and applies inductively starting from the sphere. ◻
]

#proof[
  For $n = 0$, choose any prime $p$ and take the cofiber of $p : S_(\( p \)) arrow.r S_(\( p \))$. Multiplication by $p$ is injective on $upright("BP")_(*)$, so the cofiber exact sequence gives $upright("BP")_(*) X tilde.equiv upright("BP")_(*) \/ \( p \)$, via the map from the sphere. This is a finite $p$-local spectrum.
  For $n gt.eq 1$, fix the construction above and choose a prime in the common $cal(U)$-large set of Proposition 53. Set $X = Y_(n + 1 \, p)$. Equations (9.2) and Lemma 54 show that $X$ is the $p$-localization of a finite CW spectrum, and hence is finite $p$-local in the sense of the theorem. By Equation (9.6) and Lemma 43, its actual unit map from the $p$-local sphere induces a surjection
  $ upright("BP")_(*) arrow.r upright("BP")_(*) X quad upright("with kernel ") \( p \, v_1 \, dots.h \, v_n \) . $
  For both cases, the polynomial cooperation algebra $upright("BP")_(*) upright("BP") = upright("BP")_(*) \[ t_1 \, t_2 \, dots.h \]$ is flat over the coefficient ring #cite(label("HazewinkelIII")) Section 4.4. Thus $upright("BP")$-homology of a spectrum carries its natural $upright("BP")_(*) upright("BP")$-coaction, and the map from the sphere is a comodule map. Since it is surjective on homology, naturality determines the coaction on every element of the quotient: it is exactly the coaction induced from the coefficient comodule $upright("BP")_(*)$. Thus the displayed isomorphism has the canonical quotient comodule structure, and its generator is the image of $1 in upright("BP")_0$, in degree zero. This proves the assertion for every $n$, with the prime allowed to depend on $n$. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
