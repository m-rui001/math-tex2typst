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

#align(center)[#text(size: 16pt, weight: "bold")[Temperedness at ramified places \
for globally generic exceptional groups]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

Let $X$ be a smooth projective geometrically connected curve over $bb(F)_q$, let $F = bb(F)_q \( X \)$, and let $G \/ F$ be a split connected adjoint absolutely simple group. Fix a split Borel subgroup $B = T N$, and write $bb(A)_F$ for the adeles of $F$. A cuspidal automorphic representation $pi$ of $G \( bb(A)_F \)$ is #emph[globally generic] if some vector has a nonzero Whittaker coefficient

$ integral_(N \( F \) without N \( bb(A)_F \)) f \( n g \) psi \( n \)^(- 1) thin d n $

for a character $psi$ nontrivial in every simple-root coordinate. The generalized Ramanujan conjecture predicts tempered local components for such representations. Here temperedness means that the unitary local representation is weakly contained in the regular representation. This is the generic temperedness prediction within the broader framework of Arthur parameters [1,25].

We prove the exceptional-group case, including the places where the representation is ramified. The global input is the unramified Ramanujan theorem of the companion paper [21] Corollary 1.2.

#thm([Theorem 1.1.])[
  #emph[Let $G \/ F$ be split connected adjoint absolutely simple of type $G_2$, $F_4$, $E_6$, $E_7$, or $E_8$. If $pi = ⨂'_v pi_v$ is a complex globally generic cuspidal automorphic representation of $G \( bb(A)_F \)$, then $pi_v$ is tempered for every place $v$. There is no restriction on the characteristic of $F$, the ramification depth, or the local representation type.]
] <thm:main>

The distinction between spherical and ramified components is substantial. An unramified parameter is determined by its Satake class, whereas at a ramified place a Weil–Deligne parameter also contains a nilpotent monodromy operator. The local-global theorem available for general reductive groups identifies only the semisimple Weil parameter. The argument below supplies the additional monodromy comparison needed for temperedness.

=== 1.1 Context and the local problem <context-and-the-local-problem>

Over function fields, Drinfeld proved Ramanujan for $upright("GL")_2$ [10], and Laurent Lafforgue proved it for $upright("GL")_n$ [16] Théorème VI.10(i). For other reductive groups, genericity selects the part of the cuspidal spectrum for which temperedness is expected. The Langlands–Shahidi method relates this condition to local coefficients and automorphic $L$-functions. Lomelí developed this method over function fields and proved generic Ramanujan for split classical groups and quasi-split unitary groups [18,19,20]. In particular, the later split classical results include characteristic $2$ [20] Theorem 7.1(i).

Vincent Lafforgue’s excursion operators attach semisimple global parameters to cuspidal automorphic representations of general reductive groups [17]. Genestier–Lafforgue construct semisimple local parameters and prove local-global compatibility at every place [14]. Gan–Harris–Sawin, with an appendix by Beuzart-Plessis, show that the local parameter of a tempered representation admits an essentially tempered completion [11] Theorem 1.2 and Corollary 1.3. These results make it possible to compare the global and representation-theoretic sources of monodromy without assuming a full local correspondence.

On the unramified side, Sawin–Templier prove temperedness under a monomial geometric supercuspidal hypothesis and a cyclic base-change hypothesis [24]. Ciubotaru–Harris obtain temperedness at unramified places under hypotheses including a generic unramified place and a tempered place [3]. The companion result used here gives the unramified conclusion for split adjoint absolutely simple groups from a generic unramified component alone [21] Corollary 1.2. The present paper proves the local implication that extends this conclusion to the places of level.

Two established principles guide that implication. First, genericity is related to regularity at $1$ of the adjoint $L$-factor, as formulated in the Gross–Prasad/Rallis conjecture [15] Conjecture 2.6; see, for example, the criterion proved by Gan–Ichino under local-correspondence and local-factor hypotheses [12] Appendix B, Proposition B.1. Second, adjoint regularity is equivalent to openness of the monodromy orbit over a fixed semisimple parameter [4] Proposition 3.5 and [6] Proposition 6.10. We give the short Lie-algebra proof of the implication needed here. The broader principle that purity strongly constrains a completion of a semisimple Weil representation also appears in Taylor–Yoshida [26] Section 1.

Our task is to obtain the required adjoint regularity for arbitrary generic inducing data using the semisimple correspondence alone. We compare the #emph[total] local coefficient with a product of Weil–Deligne $L$-factor ratios. Multiplicativity, rank-one Tate factors, the globalization theorem of Gan–Lomelí, and the crude functional equation of Lomelí provide the comparison [13,19]. An elementary cancellation shows that these ratios do not depend on monodromy up to nonvanishing monomials. This is exactly the amount of local-factor compatibility required by the argument. Genestier–Lafforgue also construct local $gamma$-factors from semisimple parameters and characterize them through global functional equations [14] Section 7.

=== 1.2 The proof and its reusable local criterion <the-proof-and-its-reusable-local-criterion>

The proof has a local part and a global source of purity. At a fixed place, let $r$ be the semisimple Weil parameter of a generic local representation. A Weil–Deligne completion is a nilpotent operator $N$ satisfying $"Ad" \( r \( w \) \) N = \| w \| N$. The local result is Theorem 13: if a completion has adjoint representation pure of weight zero, then the representation is tempered. Purity here prescribes Frobenius eigenvalue sizes along monodromy chains, with weights symmetric about zero. This criterion applies to every split adjoint absolutely simple group over a local function field.

To see the mechanism, suppose the representation is not tempered. Its Langlands datum consists of a tempered representation $sigma$ of a proper Levi subgroup and a strictly positive real exponent $nu$. A tempered completion for $sigma$, twisted by $nu$, gives a completion $\( r \, N_M \)$. The long intertwiner has generic image, so its scalar on Whittaker coinvariants is nonzero. The local-coefficient comparison then makes the adjoint $L$-factor of $\( r \, N_M \)$ regular at $1$. A completion $\( r \, N_(*) \)$ with pure adjoint has the same regularity. Both operators therefore lie in the unique open orbit of the centralizer of $r$, and are conjugate. Figure 1 displays this comparison.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 6.094cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Completion $(r,N_*)$ with pure adjoint#linebreak()Adjoint $L$-factor regular at $1$]]])])
  content((6.9, 0), [#box(width: 6.094cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Generic quotient of#linebreak()positive Langlands data#linebreak()Completion $(r,N_M)$ with the same regularity]]])])
  content((3.45, -2.1), [#box(width: 9.194cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[A unique open orbit over the fixed Weil parameter $r$#linebreak()$N_* tilde.op N_M$, so adjoint purity passes to $(r,N_M)$]]])])
  line((0, -0.5908), (-1.147, -1.509), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  line((6.9, -0.7849), (8.047, -1.509), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The local comparison uses two independently obtained monodromy operators. Adjoint regularity identifies their orbits over the fixed Weil parameter $r$. ],
) <fig:comparison>

Purity now passes to the positive dual nilradical, a direct summand of the adjoint Weil–Deligne representation. A pure weight-zero representation has Frobenius determinant of absolute value $1$. The positive exponent $nu$ makes that same determinant strictly smaller than $1$. This contradiction proves the local criterion.

Globally, the companion theorem makes every unramified component tempered. The adjoint local system attached to an occurring excursion parameter is consequently pointwise pure of weight zero. Deligne’s theorem on local monodromy for curves [9] Théorème 1.8.4 supplies a pure adjoint completion at each place. Semisimple local-global compatibility identifies its Weil part with the parameter of $pi_v$, and the local criterion applies.

Section 2 fixes conventions and states the parameter inputs. Section 3 proves the monodromy and purity lemmas. Section 4 establishes the local-coefficient comparison, including its behavior under specialization. Section 5 proves the local criterion, and Section 6 applies it to the global representation.

== 2 Local conventions and parameter theorems <sec:parameters>

We record the precise parameter theorems used below and explain how their semisimple Weil parameters relate to monodromy. The distinction is essential: the global theorem and the tempered-completion theorem will produce two potentially different monodromy operators over the same Weil parameter.

=== 2.1 Groups, induction, and Whittaker characters <groups-induction-and-whittaker-characters>

Let $k$ be a nonarchimedean local field of positive characteristic, with residue field of cardinality $Q$. Fix a split adjoint absolutely simple group $G$ over $k$, a split maximal torus $T$, and a Borel subgroup $B = T U$. In the local arguments, $H$ denotes either $G$ or a standard Levi subgroup of $G$; a standard parabolic of $H$ is written $P = M R$. Dual groups have compatible positive systems, so positive coroots of $H$ are positive roots of $hat(H)$. Put $hat(frak(n)) = "Lie" \( hat(R) \)$. All parabolic induction is normalized and is denoted $I_P^H$.

For a split group, a Whittaker character is a smooth unitary character of its maximal unipotent subgroup that is nontrivial on every simple root group. A smooth representation is #emph[generic] if it admits a nonzero equivariant functional for such a character. We use uniqueness of Whittaker functionals for irreducible generic representations, heredity under normalized induction, and exactness of twisted unipotent coinvariants. These statements, and the local-coefficient constructions based on them, are valid over local function fields; see [19] Sections 1–2 and [7] Section 2. Exactness is also [2] Proposition 1.9(a). For the foundational uniqueness and heredity results, see also [23] Théorèmes 2 and 4.

The following elementary observation ensures that Whittaker data can be chosen compatibly throughout the argument, even in small characteristic.

#thm([Lemma 2.1.])[
  #emph[Every standard Levi subgroup $H$ of $G$ has split connected center. Every smooth character of its maximal unipotent subgroup is trivial on the nonsimple positive root groups. Its nondegenerate unitary characters form a single $T \( k \)$-orbit.]
] <lem:whittaker>

#proof[
  Because $G$ is adjoint, its simple roots are a $bb(Z)$-basis of $X^(*) \( T \)$. The center of $H$ is the simultaneous kernel of a subset of these coordinate characters, hence is a split torus. The same basis allows arbitrary independent rescaling of the simple-root coordinates belonging to $H$. Once triviality on nonsimple root groups is known, additive self-duality of $k$ proves the orbit assertion.
  To prove that triviality, a nonsimple positive root may be written as a sum of two positive roots. The full root subsystem in their span reduces the question to $A_2$, $B_2$, or $G_2$, with its induced positive system. In $A_2$ the usual commutator is a parametrization of the nonsimple root group. For $B_2$ or $G_2$, write $a \, b$ for the short and long simple roots. In $G_2$ first kill the highest root group $U_(3 a + 2 b)$ using $\[ U_b \, U_(3 a + b) \]$, whose coefficient is $plus.minus 1$. Modulo that group, the commutator $\[ x_a \( u \) \, x_b \( t \) \]$ has factors
  $ x_(j a + b) \( epsilon.alt_j u^j t \) \, #h(2em) epsilon.alt_j in { 1 \, - 1 } \, $
  with $1 lt.eq j lt.eq 2$ in $B_2$ and $1 lt.eq j lt.eq 3$ in $G_2$. Fix a nontrivial additive character $psi$ of $k$, and write the restriction of the given character to $U_(j a + b)$ as $x_(j a + b) \( t \) mapsto psi \( c_j t \)$. It kills commutators, so
  $ psi (t sum_j epsilon.alt_j c_j u^j) = 1 quad upright("for every ") u \, t in k . $
  Varying $t$ gives $sum_j epsilon.alt_j c_j u^j = 0$ for every $u$. Since $k$ is infinite, all $c_j$ vanish. This polynomial argument uses no division by $2$ or $3$ and remains valid in those characteristics. ◻
]

Write $frak(a)_(M \, bb(C))^(*) = X^(*) \( M \) ⊗_(bb(Z)) bb(C)$. For $z in frak(a)_(M \, bb(C))^(*)$, the notation $sigma_z$ denotes the unramified twist in which $s chi$ acts as $\| chi \|^s$. Via duality, $X^(*) \( M \)$ is the cocharacter lattice of $Z \( hat(M) \)^compose$; a central weight $b$ on a representation of $hat(M)$ therefore pairs with $z$, giving $b \( z \)$. In particular, the weights on $hat(frak(n))$ satisfy $b \( nu \) > 0$ when $nu$ is in the open positive chamber for $P$.

=== 2.2 Weil–Deligne parameters and local factors <weildeligne-parameters-and-local-factors>

Fix $ell eq.not "char" \( k \)$ and an isomorphism $iota : overline(bb(Q))_ell tilde.eq bb(C)$. All absolute values of coefficients below are taken after $iota$. Choose the square roots in normalized induction and in the parameter theorems to correspond to positive real square roots. We use geometric Frobenius $"Fr"$, so $\| "Fr" \| = Q^(- 1)$. Local class field theory sends a uniformizer to geometric Frobenius, and Satake parameters are normalized accordingly. Thus a twist by $\| chi \|^s$ on representations gives the same $\| dot.op \|^s$-twist on parameters.

A Frobenius-semisimple Weil–Deligne parameter for $H$ is a pair $\( r \, N \)$, where $r : W_k arrow.r hat(H) \( bb(C) \)$ has finite inertia image and semisimple Frobenius, and $N in "Lie" \( hat(H) \)$ is nilpotent with

#[#set math.equation(numbering: n => "(2.1)")
 $ "Ad" \( r \( w \) \) N = \| w \| N . $ <eq:wd-relation>]

For an algebraic representation of $hat(H)$ on $V$, use the same symbols for the induced operators and set

#[#set math.equation(numbering: n => "(2.2)")
 $ L \( s \, V \) = det (1 - Q^(- s) r \( "Fr" \) divides \( ker N \)^(r \( I_k \)))^(- 1) . $ <eq:local-factor>]

This is a reciprocal polynomial in $Q^(- s)$, with constant term $1$; in particular, it has no zeros. We often write $L \( s \, a compose \( r \, N \) \)$ when the algebraic representation $a$ needs to be specified.

A tempered $L$-parameter is a homomorphism $phi.alt : W_k times upright("SL")_2 \( bb(C) \) arrow.r hat(H) \( bb(C) \)$, algebraic on $upright("SL")_2$, whose Weil image is bounded. Its associated pair is

#[#set math.equation(numbering: n => "(2.3)")
 $ r \( w \) = phi.alt (w \, mat(delim: "(", \| w \|^(1 \/ 2), 0; 0, \| w \|^(- 1 \/ 2))) \, #h(2em) N = d phi.alt mat(delim: "(", 0, 1; 0, 0) . $ <eq:completion>]

Thus the Weil part $r$ of a tempered completion need not itself be bounded. This familiar distinction is the reason to retain monodromy.

We write $f ≐ g$ for equality up to a nonzero constant times a monomial in the exponential unramified-twist coordinates. Finite covers of twist tori are allowed. In additive coordinates, the omitted factor is a constant times the exponential of a linear form, hence is holomorphic and nowhere zero. In one variable it has the form $c Q^(- a s)$.

=== 2.3 The parameter inputs <the-parameter-inputs>

We use the following forms of the global and local parameter theorems. They specify the precise information carried from representations to parameters; no compatibility of monodromy is included.

#thm([Theorem 2.2.])[
  (Lafforgue; Genestier–Lafforgue).  #emph[For the split groups considered here the following hold.]
  + #emph[An irreducible smooth local representation $sigma$ has a semisimple Weil parameter $rho_sigma$, with finite inertia image. The parametrization is compatible with normalized parabolic induction, tori and local class field theory, group isomorphisms, central characters, and twists through algebraic characters of the group.]
  + #emph[A cuspidal automorphic representation $Pi$ over a function field, with finite-order central character, occurs in an excursion summand with a semisimple global parameter $Sigma_Pi$. This parameter is defined over a finite extension of $bb(Q)_ell$ and matches normalized Satake parameters away from a finite set.]
  + #emph[At every place $v$, the semisimplification of $Sigma_Pi \|_(W_(F_v))$ is conjugate to $rho_(Pi_v)$.]
] <thm:parameters>

The global statement is [17] Théorème 0.1; the local statements, including representations without an integrality condition, are [14] Théorème 0.1 and Remarque 0.2. For compatibility with central characters, apply the functoriality for homomorphisms with normal image to the inclusion of the central split torus.

Here is how to interpret the coefficient and occurrence assertions for complex representations. A finite-order central character allows a cocompact central lattice in its kernel. Fixed-level cusp spaces modulo that lattice are finite-dimensional and commute with coefficient extension. Project an irreducible Hecke module of level invariants to any excursion summand where its projection is nonzero; that projection is injective, so it supplies the required occurrence. Uniqueness of the excursion parameter of $Pi$ is unnecessary. For the adjoint group no central lattice is needed.

Locally, after transport by $iota$, irreducibles may be realized over a finite extension of $bb(Q)_ell$. Indeed a fixed-compact-open Hecke algebra over $bb(Q)_ell$ is of finite type [5] Theorem 1.1, so its finite-dimensional simple module over $overline(bb(Q))_ell$ descends to such an extension. The corresponding irreducible representation also descends: form induction from this Hecke module and quotient by the largest subrepresentation with zero invariants under that compact open subgroup. The latter subrepresentation is characterized by vanishing of every averaged translate, a condition compatible with scalar extension. This permits use of the finite-extension formulations of the parameter theorems.

#thm([Theorem 2.3.])[
  (Gan–Harris–Sawin, with Beuzart-Plessis).  #emph[If $sigma$ is tempered on a standard Levi subgroup $M$ of $G$, then $rho_sigma$ has a tempered completion $\( rho_sigma \, N_M \)$ as in (2.3). This holds in every positive characteristic.]
] <thm:tempered-completion>

#proof[
  #emph[Explanation of the cited form.] The published [11] Theorem 1.2 and Corollary 1.3 give an #emph[essentially] tempered completion for arbitrary connected reductive groups over local function fields. Thus its Weil image is bounded modulo the center. Since $sigma$ is tempered, its central character is unitary. By Theorem 3, the dual morphism $hat(M) arrow.r accent(Z \( M \), ̂)$ has bounded image on the parameter. Root data show that its characters span the rational character space of the abelian quotient of $hat(M)$. Moreover, the $upright("SL")_2$ factor dies in that quotient. Hence the Weil image of the completion is bounded in the abelian quotient as well. The map from $hat(M)$ to the product of its adjoint and abelian quotients has finite kernel; boundedness in these two quotients therefore gives boundedness in $hat(M)$ itself. ◻
]

=== 2.4 The Weil part of a global restriction <the-weil-part-of-a-global-restriction>

The local monodromy theorem turns a restriction of $Sigma_Pi$ into a Weil–Deligne pair. The next observation verifies that its Frobenius-semisimple Weil part is exactly the parameter in Theorem 3(iii), also as a dual-group-valued parameter.

#thm([Lemma 2.4.])[
  #emph[Let $Sigma$ be a continuous $ell$-adic representation of a local decomposition group into $hat(H)$, defined over a finite extension of $bb(Q)_ell$. If $\( r \, N \)$ is its Frobenius-semisimplified Weil–Deligne pair, then $r$ is conjugate to the semisimplification of $Sigma \|_(W_k)$.]
] <lem:wd-semisimplification>

#proof[
  Before Frobenius semisimplification, write the pair as $\( r_0 \, N \)$, with $r_0 \( I_k \)$ finite. The construction takes place in $hat(H)$: in a faithful linear representation the unipotent logarithm lies in its Lie algebra, and $Sigma$ on the Weil group is obtained from $r_0$ by multiplying by the appropriate exponentials of $N$.
  Write $r_0 \( "Fr" \) = h u$ for its commuting semisimple and unipotent parts. Some positive power of $r_0 \( "Fr" \)$ centralizes the finite inertia image. Jordan decomposition in that centralizer shows that a power of $u$, and hence $u$, centralizes it. The relation $"Ad" \( h u \) N = Q^(- 1) N$ gives $"Ad" \( h \) N = Q^(- 1) N$ and $"Ad" \( u \) N = N$. Replacing $h u$ by $h$ thus defines a Weil parameter $r$ with the same finite inertia. The identity component of the Zariski closure of $r \( W_k \)$ is toral, so $r$ is semisimple.
  Let $S$ be the identity component of the Zariski closure of the cyclic group generated by $h$. It is a torus centralizing $r_0 \( I_k \)$ and $u$. If $N eq.not 0$, its weight on the line $bb(C) N$ is nontrivial, because $Q^(- 1)$ is not a root of unity. A cocharacter of $S$ can therefore contract $N$ to zero while fixing $r_0$. This realizes removal of the monodromy exponentials as a conjugation limit in $hat(H)$. Next, the centralizer of $r$ has reductive identity component and contains the unipotent element $u$. A cocharacter in that centralizer contracts $u$ to the identity. These two limits preserve semisimplification and leave precisely $r$. Finally, density of the Weil group in the decomposition group gives the same Zariski closure for both images. ◻
]

Thus a global restriction and a tempered local completion can have the same $r$ while retaining distinct operators $N$. The next section gives two ways to work with this distinction: an $L$-factor ratio that forgets $N$, and a regularity condition that determines $N$ up to conjugacy.

== 3 Adjoint regularity and monodromy <sec:monodromy>

The semisimple Weil parameter does not determine individual local $L$-factors, since those factors also involve monodromy. We first show that the ratio occurring in a local functional equation is nevertheless determined up to a unit. We then explain how purity controls local $L$-factors and determinants. Finally, we prove that regularity of the adjoint $L$-factor at $1$ determines the monodromy orbit. These statements will allow us to compare two monodromy operators once their semisimple Weil parameters have been identified, without assuming compatibility of the monodromy operators themselves.

=== 3.1 A ratio independent of monodromy <a-ratio-independent-of-monodromy>

#thm([Lemma 3.1.])[
  #emph[Let $r$ be a Frobenius-semisimple Weil representation on a finite-dimensional complex vector space $V$, with finite inertial image. If $N$ and $N'$ are nilpotent operators such that $\( r \, N \)$ and $\( r \, N' \)$ are Weil–Deligne representations, then 
$ frac(L \( 1 - s \, \( r \, N \)^or \), L \( s \, \( r \, N \) \)) ≐ frac(L \( 1 - s \, \( r \, N' \)^or \), L \( s \, \( r \, N' \) \)) . $

 More precisely, put $W = V^(r \( I_k \))$, $K = ker \( N \|_W \)$, and $F = r \( upright("Fr") \)$. If $R_N \( s \)$ denotes the ratio on the left, then 
#[#set math.equation(numbering: n => "(3.1)")
 $ frac(R_0 \( s \), R_N \( s \)) = det #scale(x: 120%, y: 120%)[\(] - Q^(- s) F divides W \/ K #scale(x: 120%, y: 120%)[\)] . $ <eq:monodromy-ratio-unit>]

]
] <lem:monodromy-ratio>

#proof[
  The operator $N$ commutes with inertia and satisfies $F N = Q^(- 1) N F$. Thus $N$ identifies $W \/ K$ with $N W$, multiplying Frobenius eigenvalues by $Q^(- 1)$. Averaging over the finite inertia image identifies $\( V^or \)^(r^or \( I_k \))$ with $W^or$. The dual monodromy operator is $- N^(sans(t))$. On $W^or$ its kernel is the annihilator of $N W$, so restriction of functionals gives the Frobenius-equivariant isomorphism
  $ W^or \/ ker \( - N^(sans(t)) \) tilde.eq \( N W \)^or . $
  Consequently, if $c$ is a Frobenius eigenvalue on $W \/ K$, the corresponding eigenvalue on this dual quotient is $Q c^(- 1)$. Writing $x = Q^(- s)$ and comparing the determinants for $N$ and $0$ gives
  $ frac(R_0 \( s \), R_N \( s \)) = product_c frac(1 - x c, 1 - Q^(- 1) x^(- 1) \( Q c^(- 1) \)) = product_c \( - x c \) \, $
  where the eigenvalues are counted with multiplicity. This proves (3.1), as an identity of rational functions in $x$. Its right-hand side is a nonzero constant times a monomial, and comparison through $N = 0$ proves the assertion for $N$ and $N'$. ◻
]

=== 3.2 Consequences of purity <consequences-of-purity>

Recall that the #emph[monodromy filtration centered at zero] of a nilpotent operator $N$ on $V$ is the unique finite increasing filtration $M_bullet V$, indexed by the integers, satisfying

$ N \( M_j V \) subset M_(j - 2) V \, #h(2em) N^j : "Gr"_j^M V arrow.r^(med tilde.op med) "Gr"_(- j)^M V quad \( j gt.eq 0 \) . $

Here $M_j V = 0$ for sufficiently negative $j$ and $M_j V = V$ for sufficiently positive $j$. On a Jordan chain $v \, N v \, dots.h \, N^d v$, the successive vectors have degrees $d \, d - 2 \, dots.h \, - d$. This description constructs the filtration and shows that it commutes with direct sums. Its uniqueness also shows that the Weil action preserves it, since conjugation by $r \( w \)$ multiplies $N$ by the nonzero scalar $\| w \|$.

We say that $\( r \, N \)$ is #emph[pure of weight zero], with respect to the fixed complex realization of the coefficients, if every Frobenius eigenvalue on $"Gr"_j^M V$ has absolute value $Q^(j \/ 2)$. When $N = 0$, this says that all eigenvalues of $r \( upright("Fr") \)$ have absolute value $1$. Nonzero monodromy allows eigenvalues of different absolute values, arranged in symmetric Jordan chains.

#thm([Lemma 3.2.])[
  #emph[Let $\( r \, N \)$ be a finite-dimensional Frobenius-semisimple Weil–Deligne representation, pure of weight zero. Then $L \( s \, \( r \, N \) \)$ is holomorphic and nonzero for $"Re" \( s \) > 0$, and 
#[#set math.equation(numbering: n => "(3.2)")
 $ lr(|det r \( upright("Fr") \)|) = 1 . $ <eq:pure-determinant>]

 Every Weil–Deligne direct summand of $\( r \, N \)$ is also pure of weight zero and satisfies these conclusions.]
] <lem:pure-determinant>

#proof[
  The bottom vector of a Jordan chain of length $d + 1$ has monodromy degree $- d$. Hence $ker N subset M_0 V$. Purity implies that all Frobenius eigenvalues on $M_0 V$, and therefore on $\( ker N \)^(I_k)$, have absolute value at most $1$. If $"Re" \( s \) > 0$, each factor $1 - Q^(- s) c$ in the defining determinant of the local $L$-factor is nonzero. The asserted holomorphy and nonvanishing follow.
  The defining isomorphisms of the monodromy filtration give $dim "Gr"_j^M V = dim "Gr"_(- j)^M V$. Taking the determinant on the graded spaces therefore gives
  $ lr(|det r \( upright("Fr") \)|) = Q^(1 / 2 sum_j j dim "Gr"_j^M V) = 1 . $
  Finally, the monodromy filtration of a direct sum is the direct sum of its monodromy filtrations. Each graded space of a Weil–Deligne summand is consequently a Frobenius-stable direct summand of the corresponding graded space of $V$, and inherits its purity. ◻
]

For example, take trivial inertia on $V = bb(C) e_1 xor bb(C) e_2$ and set

$ r \( upright("Fr") \) = mat(delim: "(", Q^(- 1 \/ 2), 0; 0, Q^(1 \/ 2)) \, #h(2em) N e_2 = e_1 \, quad N e_1 = 0 . $

The degrees of $e_1 \, e_2$ are $- 1 \, 1$, so this representation is pure of weight zero although the image of $r$ is unbounded. It comes from the $L$-parameter trivial on $W_k$ and standard on $upright("SL")_2 \( bb(C) \)$. Replacing $N$ by $0$ destroys purity and introduces a pole at $s = 1 \/ 2$ in the local $L$-factor. This is why boundedness of the Weil part and purity of a completed Weil–Deligne representation must be distinguished.

=== 3.3 Adjoint regularity determines the orbit <adjoint-regularity-determines-the-orbit>

The next proposition is the implication from adjoint regularity to an open monodromy orbit established in [4] Proposition 3.5 and [6] Proposition 6.10. We give the elementary argument in the semisimple case needed here. The Killing form identifies the obstruction to an orbit being open with the space responsible for a pole of the adjoint $L$-factor at $1$.

#thm([Proposition 3.3.])[
  #emph[Let $hat(G)$ be a connected semisimple complex algebraic group, and let $r : W_k arrow.r hat(G)$ be a Frobenius-semisimple Weil parameter with finite inertial image. Write 
$ frak(e) = "Lie" \( hat(G) \)^(r \( I_k \)) \, #h(2em) frak(e)_a = ker #scale(x: 120%, y: 120%)[\(] "Ad" \( r \( upright("Fr") \) \) - a divides frak(e) #scale(x: 120%, y: 120%)[\)] quad \( a in bb(C)^times \) \, $

 and let $C = Z_(hat(G)) \( r \( W_k \) \)$. If $\( r \, N \)$ is a Weil–Deligne parameter and $L \( s \, "Ad" compose \( r \, N \) \)$ is regular at $s = 1$, then the orbit $C dot.op N$ is open in $frak(e)_(Q^(- 1))$. In particular, if $N_1 \, N_2$ are two monodromy operators over $r$ whose adjoint $L$-factors are regular at $1$, then some $c in C$ satisfies $"Ad" \( c \) N_1 = N_2$.]
] <prop:open-orbit>

#proof[
  The Weil–Deligne relation places $N$ in $frak(e)_(Q^(- 1))$. On the adjoint representation its monodromy is $"ad" \( N \)$, so regularity at $1$ is equivalent to
  #[#set math.equation(numbering: n => "(3.3)")
   $ ker \( "ad" N \) ∩ frak(e)_Q = 0 . $ <eq:adjoint-pole-kernel>]
  Indeed, a pole at $1$ means that Frobenius has eigenvalue $Q$ on $\( ker "ad" N \)^(r \( I_k \))$.
  Let $B$ be the Killing form of $"Lie" \( hat(G) \)$. Its restriction to $frak(e)$ is nondegenerate. To see this, average any vector over the finite inertia image: pairing it with an inertia-invariant vector gives the same value before and after averaging. A vector orthogonal to $frak(e)$ inside $frak(e)$ is therefore orthogonal to the entire Lie algebra, and is zero. Frobenius preserves $B$ and acts semisimply, so $B$ pairs $frak(e)_a$ perfectly with $frak(e)_(a^(- 1))$.
  We have $"Lie" \( C \) = frak(e)_1$. The differential of the orbit map at the identity is
  #[#set math.equation(numbering: n => "(3.4)")
   $ frak(e)_1 arrow.r frak(e)_(Q^(- 1)) \, #h(2em) Y mapsto \[ Y \, N \] . $ <eq:monodromy-orbit-tangent>]
  By invariance of $B$, its transpose under the preceding perfect pairings is
  $ frak(e)_Q arrow.r frak(e)_1 \, #h(2em) X mapsto \[ N \, X \] . $
  The kernel of this transpose is zero by (3.3), so (3.4) is surjective. Algebraic group orbits are smooth and locally closed in characteristic zero. Thus $C dot.op N$ has the dimension of $frak(e)_(Q^(- 1))$ and is open in that vector space. Since the vector space is irreducible, it has at most one open $C$-orbit. This proves the last assertion as well. ◻
]

== 4 Local coefficients and semisimple parameters <sec:coefficients>

The comparison in this section expresses the divisor of a Shahidi local coefficient in terms of the semisimple local parameter. It applies to arbitrary generic inducing representations, including ramified supercuspidals. We use multiplicativity to reduce to supercuspidal data, and then isolate the prescribed place in a global functional equation. Only the product of local factors occurring in a local coefficient is needed. Lemma 6 allows this product to be compared without identifying monodromy operators.

Let $H$ be a split adjoint group under consideration, or a standard Levi subgroup of such a group, over the local function field $k$. Fix a split maximal torus $T$, a Borel subgroup $B = T U$, and a nondegenerate character $psi$ of $U \( k \)$. Write $P = M R$ for a proper standard parabolic subgroup of $H$. All induction is normalized, and we write

$ I_P^H \( sigma_z \) = "Ind"_(P \( k \))^(H \( k \)) \( sigma_z \) . $

Here $sigma$ is an irreducible generic representation of $M \( k \)$ and $z in frak(a)_(M \, bb(C))^(*) = X^(*) \( M \) ⊗_(bb(Z)) bb(C)$. Whittaker characters and Weyl representatives are chosen compatibly. Lemma 2 gives a single torus orbit of nondegenerate characters for these groups, so such a choice is possible for every generic $sigma$.

Let $w_H$ and $w_M$ denote the longest Weyl elements of $H$ and $M$, and put $w = w_H w_M$. Let $P'$ be the standard parabolic with Levi $w M w^(- 1)$. The standard intertwining operator

$ A_H \( z \, sigma \; w \) : I_P^H \( sigma_z \) arrow.r I_(P')^H \( \( w sigma \)_(w z) \) $

is defined by its usual unipotent integral and meromorphic continuation. In particular, $A_H$ has no normalization by local $L$-functions. We use the convention

#[#set math.equation(numbering: n => "(4.1)")
 $ lambda_(upright("source")) \( z \) = C_H \( z \, sigma \) thin lambda_(upright("target")) \( w z \) compose A_H \( z \, sigma \; w \) $ <eq:coefficient-definition>]

for the local coefficient. We also use this definition for a Weyl element carrying the simple roots of its source Levi into the ambient simple roots. These are the intertwiners that occur in multiplicativity.

Let $hat(P) = hat(M) hat(R)$ be the corresponding standard parabolic in $hat(H)$. Decompose its unipotent Lie algebra under the connected center of $hat(M)$:

#[#set math.equation(numbering: n => "(4.2)")
 $ hat(frak(n)) := "Lie" \( hat(R) \) = xor.big_b V_b . $ <eq:central-weight-decomposition>]

The index $b$ runs over the weights that occur, $r_b$ is the representation of $hat(M)$ on $V_b$, and $b \( z \)$ is the pairing with the central cocharacter specified by the twist $z$.

#thm([Proposition 4.1.])[
  (Comparison of local coefficients).  #emph[For $H \, P \, M$, and $sigma$ as above, let $\( rho_sigma \, N_sigma \)$ be any Weil–Deligne pair in $hat(M)$ with Weil part the semisimple local parameter of $sigma$. Then 
#[#set math.equation(numbering: n => "(4.3)")
 $ C_H \( z \, sigma \) med ≐ med product_b frac(L #scale(x: 120%, y: 120%)[\(] 1 - b \( z \) \, r_b^or compose \( rho_sigma \, N_sigma \) #scale(x: 120%, y: 120%)[\)], L #scale(x: 120%, y: 120%)[\(] b \( z \) \, r_b compose \( rho_sigma \, N_sigma \) #scale(x: 120%, y: 120%)[\)]) . $ <eq:coefficient-comparison>]

 In particular, one may take $N_sigma = 0$. The equality is an identity of meromorphic functions of the unramified twists, up to a nonzero constant times a monomial in twist coordinates.]
] <prop:comparison>

We first explain how local coefficients behave under specialization and induction in stages. We then prove the rank-one and principal-series cases of the proposition. Globalization supplies the remaining supercuspidal case. The local-coefficient constructions and the crude functional equation are those of Lomelí [19] §§1–2 and Theorem 4.3; the globalization method is that of Gan–Lomelí [13] Theorem 1.1 and §5. For the related construction of $gamma$-factors from semisimple parameters, see also [14] Section 7.

=== 4.1 Whittaker lines in families <whittaker-lines-in-families>

For a smooth representation $V$ of $H \( k \)$, write $V_(U \, psi)$ for its twisted coinvariants. When $V = I_P^H \( sigma_z \)$ with $sigma$ generic, these coinvariants are one-dimensional. The scalar of the standard intertwining operator on this line is the inverse local coefficient. To use this description at a reducibility point, one must choose generators that remain nonzero after specialization.

Choose a finite cover of the torus of unramified twists on which the characters in use are algebraic, and let $cal(A)$ be its Laurent polynomial coordinate ring. The family $sigma_z$ is a smooth $cal(A) \[ M \( k \) \]$-module, and its induced family is a smooth $cal(A) \[ H \( k \) \]$-module. Meromorphic operators are obtained by extending scalars to the fraction field of $cal(A)$.

#thm([Lemma 4.2.])[
  (Whittaker lines and specialization).  #emph[The twisted coinvariants of the induced family $I_P^H \( sigma_z \)$ form a free rank-one $cal(A)$-module, and this description commutes with specialization of $z$. The Jacquet-integral Whittaker functionals give a generator of its dual whose specialization is nonzero at every twist. Consequently, the inverse scalar induced by $A_H$ on these lines is $C_H \( z \, sigma \)$ up to a unit of $cal(A)$.]
] <lem:whittaker-family>

#proof[
  The twisted Jacquet functor is exact over $cal(A)$. Indeed, the unipotent group $U \( k \)$ is an increasing union of compact open subgroups. On each such subgroup, twisted averaging is an idempotent, since $cal(A)$ is a complex algebra. Taking the resulting filtered colimit proves exactness. The same description shows that twisted coinvariants commute with scalar extension, including specialization.
  Apply this functor to the Bruhat filtration of parabolic induction. For a representative $x$ of $W_M without W_H$, the corresponding subquotient consists of sections with compact support modulo $P \( k \)$ on the cell $P \( k \) dot(x) U \( k \)$. As a $U \( k \)$-representation, it is compact induction from
  $ U \( k \) ∩ dot(x)^(- 1) P \( k \) dot(x) \, $
  with the fiber action obtained from the inducing representation. Its twisted coinvariants are therefore computed on the fiber. All unramified twists and modulus characters are trivial on the unipotent groups in this calculation, so the calculation is unchanged over $cal(A)$.
  Every cell other than the open one has a simple root subgroup of $U$ whose conjugate lies in $R$. It acts trivially on the fiber and nontrivially through $psi$, so that cell contributes no twisted coinvariants. For completeness, take $x$ minimal on the left modulo $W_M$. If no simple root is sent to a positive root outside $M$, every $x alpha$ for $alpha$ simple is either negative or a positive Levi root. Thus the coefficients outside the Levi simple system of every $x beta$, $beta$ positive, are nonpositive. In particular, $x beta$ cannot be a positive root outside $M$. It follows that $x^(- 1)$ sends all positive roots outside $M$ to negative roots, which characterizes the representative of the open cell.
  On the open cell, the remaining coinvariant calculation is precisely the Whittaker coinvariant space of $sigma$, with the character transported by the chosen representative. This space is one-dimensional by Whittaker uniqueness. Hence the induced family’s coinvariants are its tensor product with $cal(A)$, as asserted. This is the usual open-cell proof of Whittaker heredity, now carried out over the coefficient ring.
  The open-cell submodule therefore induces an isomorphism on twisted coinvariants. Its unipotent integral, applied to a fixed Whittaker functional of $sigma$, extends uniquely through this isomorphism to an $cal(A)$-linear Whittaker functional on the entire induced family. In a convergence chamber this functional and the usual Jacquet integral agree on the open-cell submodule, and hence agree everywhere. Meromorphic continuation consequently identifies the Jacquet functional with this algebraic functional. In particular, its evaluations on algebraic sections are Laurent polynomials, as also recalled in [19] §1.2.
  To see that specialization is nonzero, choose a vector on which the fixed Whittaker functional of $sigma$ is $1$ and a compactly supported function in the open-cell unipotent coordinates whose $psi$-weighted integral is $1$. The resulting algebraic section has Whittaker value $1$ at every twist. Thus the regular functional just constructed never specializes to zero and generates the dual coinvariant line.
  Equation (4.1) now identifies the local coefficient with the inverse scalar on these free lines. Two generators of a free rank-one Laurent polynomial module differ by a unit, hence by a nonzero constant times a monomial. Haar measures and compatible Weyl representatives change the formula only by such units. Torus conjugation of the Whittaker character also identifies these lines over $cal(A)$ and commutes with the intertwining calculation, with the same consequence. ◻
]

=== 4.2 Elementary intertwiners and reduction of the inducing data <elementary-intertwiners-and-reduction-of-the-inducing-data>

We record the root decomposition that governs both sides of (4.3). For a Weyl element $v$, set

$ "Inv" \( v \) = { beta in Phi_H^(+) : v beta in - Phi_H^(+) } . $

For a standard Levi $L$, write $Delta_L$ for its simple roots.

#thm([Lemma 4.3.])[
  (Elementary factorization).  #emph[Let $L$ be a standard Levi of $H$, and suppose $v Delta_L subset.eq Delta_H$. There is a length-additive factorization 
$ v = v_t dots.h.c v_1 $

 with the following properties. Put $v_(< j) = v_(j - 1) dots.h.c v_1$ and $L_j = v_(< j) L v_(< j)^(- 1)$. Then $L_j$ is standard, it is a maximal proper Levi in a standard Levi subgroup $H_j$, and 
$ Delta_(H_j) = Delta_(L_j) union { alpha_j } \, #h(2em) v_j = w_(H_j) w_(L_j) . $

 Moreover, 
#[#set math.equation(numbering: n => "(4.4)")
 $ "Inv" \( v \) = union.sq.big_(j = 1)^t v_(< j)^(- 1) "Inv" \( v_j \) . $ <eq:inversion-partition>]

 The analogous partition holds for coroots.]
] <lem:elementary-moves>

#proof[
  If $v eq.not 1$, choose a simple root $alpha$ with $v alpha < 0$. Such a root is outside $Delta_L$, since $v Delta_L subset.eq Delta_H$. Let $H_1$ be the standard Levi obtained by adjoining $alpha$ to $Delta_L$, and set $v_1 = w_(H_1) w_L$.
  Every positive root of $H_1$ outside $L$ has a strictly positive $alpha$-coefficient. Its image under $v$ is a positive linear combination of $v alpha$ and roots in $v Delta_L$. The negative root $v alpha$ has a strictly negative coefficient outside $v Delta_L$: otherwise it would belong to the span of $v Delta_L$, contradicting $alpha in.not "span" \( Delta_L \)$. This coefficient cannot be canceled by the other summands. The image root is therefore negative. It follows that
  $ "Inv" \( v_1 \) = Phi_(H_1)^(+) \\ Phi_L^(+) subset.eq "Inv" \( v \) . $
  Consequently $v_1$ is a right factor with additive length.
  The element $v_1$ carries $Delta_L$ into the simple roots of $H_1$. Replace $L$ by $v_1 L v_1^(- 1)$ and $v$ by $v v_1^(- 1)$, which still carries the new Levi simple system into $Delta_H$. The length has strictly decreased, so iteration terminates. The usual inversion-set identity for a product with additive lengths gives (4.4). Applying the same argument to the dual root system gives its coroot version. ◻
]

The standard intertwining integrals factor according to Lemma 11. First one uses Fubini’s theorem in a convergence chamber, and then meromorphic continuation. At each step, normalized induction in stages identifies the elementary operator with the maximal-parabolic operator in $H_j$. Taking Whittaker scalars and using Lemma 10 therefore gives multiplicativity of local coefficients, up to the allowed units. This is the multiplicativity of [19] Proposition 2.3.

We explain more precisely how it reduces the inducing representation. Suppose for the moment that $P$ is maximal in $H$, with omitted simple root $alpha$. Let $tilde(alpha) in frak(a)_(M \, bb(R))^(*)$ be proportional to the character giving the determinant on $"Lie" \( R \)$ and normalized by

$ chevron.l tilde(alpha) \, alpha^or chevron.r = 1 . $

Its pairing with every simple coroot of $M$ is zero. The decomposition (4.2) is then conventionally written

$ hat(frak(n)) = xor.big_(i gt.eq 1) V_i \, #h(2em) V_i = xor.big_(chevron.l tilde(alpha) \, beta^or chevron.r = i) hat(frak(h))_(beta^or) \, $

where $hat(frak(h))_(beta^or)$ is the corresponding root space in $"Lie" \( hat(H) \)$ and $i$ ranges over the positive integers that occur. Along $z = s tilde(alpha)$, the arguments in (4.3) are $i s$ and $1 - i s$.

Every other twist direction is a sum of this relative direction and a direction in $X^(*) \( H \) ⊗ bb(C)$. A twist from $H$ twists both sides of the intertwiner and changes its Whittaker scalar by at most a unit. On the dual side it acts through $Z \( hat(H) \)^compose$ and acts trivially on $hat(frak(n))$. Thus it suffices to prove the maximal-parabolic comparison on the relative line.

By the subrepresentation theorem, $sigma$ embeds in normalized induction in $M$ from a supercuspidal representation $sigma_0$ of a standard Levi $M_0 subset.eq M$. Exactness and heredity of Whittaker coinvariants show that $sigma_0$ is generic. They also show that the embedding induces an isomorphism on Whittaker lines, since both lines are one-dimensional. The same holds after every unramified twist.

The element $w = w_H w_M$ carries the simple roots of $M_0$ into those of $H$. In the induced realization from $M_0$, its intertwining integral still uses exactly the roots outside $M$ turned negative by $w$: $w$ preserves the positive system of $M$ in its target Levi. Thus induction in stages identifies the intertwiner on $sigma$ with the restriction of this intertwiner on the smaller inducing data. The isomorphisms of Whittaker lines just established identify their local coefficients, up to units.

Apply Lemma 11 with $L = M_0$, and write $M_j = w_(< j) M_0 w_(< j)^(- 1)$ for the successive Levi subgroups. At step $j$, the inducing representation is the transport of $sigma_0$ to $M_j$, and the twist is $w_(< j) \( s tilde(alpha) \)$. Its relative coordinate in $H_j$ is $c_j s$, where

#[#set math.equation(numbering: n => "(4.5)")
 $ c_j = chevron.l w_(< j) tilde(alpha) \, alpha_j^or chevron.r > 0 . $ <eq:relative-slope>]

Indeed, $w_(< j)^(- 1) alpha_j^or$ belongs to the original inversion set of coroots, all of which are positive and outside $M$. Pairing with $tilde(alpha)$ is strictly positive on this set. Each elementary coefficient consequently has a genuinely varying argument; the reduction does not restrict a meromorphic coefficient to an identically singular locus.

The same factorization decomposes the dual representations. Transport the nilradical Lie algebra for $M_j subset H_j$ back by $w_(< j)^(- 1)$. It is invariant under $hat(M)_0$, because the original algebra is invariant under $hat(M)_j$. The coroot partition (4.4) identifies their direct sum with $hat(frak(n))$ restricted to $hat(M)_0$. A step summand of relative degree $i_j$ has twist exponent $c_j i_j s$. To see this, decompose $w_(< j) tilde(alpha)$ into $c_j tilde(alpha)_j$ and a character direction from $H_j$; the latter pairs to zero with every coroot in $H_j$.

Compatibility of semisimple parameters with normalized induction identifies $rho_sigma$ with the parameter obtained from $rho_(sigma_0)$. Taking monodromy zero, the preceding decomposition therefore makes the right side of (4.3) the product of the right sides for the elementary maximal parabolics. We have proved that comparison for maximal parabolics with supercuspidal inducing data implies comparison for maximal parabolics with arbitrary generic data.

=== 4.3 The principal-series comparison <the-principal-series-comparison>

The rank-one case supplies the local comparisons needed away from the place prescribed in globalization. If a maximal proper Levi $M$ is a torus, the derived root system of $H$ has rank one. The local coefficient is the Tate gamma factor for the character obtained by pulling $sigma$ back along the coroot. Tate’s formula and local class field theory give

#[#set math.equation(numbering: n => "(4.6)")
 $ C_H \( s tilde(alpha) \, sigma \) med ≐ med frac(L \( 1 - s \, r_1^or compose rho_sigma \), L \( s \, r_1 compose rho_sigma \)) . $ <eq:rank-one-comparison>]

This calculation permits an arbitrary smooth inducing character; see [19] §1.3. It also applies to the isogeny types occurring here. Pulling the integral back through the root homomorphism from $"SL"_2$ identifies the root groups and the unipotent integration, and the inducing character pulls back through the stated coroot. Extra central tori have no effect on this calculation.

An irreducible generic constituent of a principal series can be embedded in a principal series, with a possibly Weyl-conjugate inducing character, by the subrepresentation and supercuspidal support theorems. The preceding elementary factorization with $M_0 = T$ reduces its comparison to (4.6). Thus the maximal-parabolic case of (4.3) is already proved whenever the inducing representation is a generic principal-series constituent. In particular it is available for ramified principal series; an Iwahori-fixed hypothesis is not needed.

=== 4.4 Globalization of supercuspidal data <globalization-of-supercuspidal-data>

We now prove the remaining maximal-parabolic comparison. Let $sigma$ be a generic supercuspidal representation of $M \( k \)$. We may first twist it so that its central character has finite order. Indeed, $Z \( M \)$ is a split torus, a smooth character of its maximal compact subgroup has finite image, and restriction

$ X^(*) \( M \) arrow.r X^(*) \( Z \( M \) \) $

has finite cokernel. Unramified twists can therefore adjust the finitely many uniformizer values to roots of unity. Twisting back shifts the relative parameter $s$; the remaining twist direction is from $H$ and has the behavior already described. Twist compatibility of semisimple parameters gives the identical shift on the proposed Galois expression.

Write $k = k_0 \( \( t \) \)$, and put $K = k_0 \( t \)$. Let $v_0$ be the rational place $t = 0$, so $K_(v_0) = k$. Use the constant split models of $H$ and $M$ over $K$. The finite-order central character just obtained extends to a finite-order automorphic character of $Z \( M \) \( bb(A)_K \)$. Here is an explicit extension, to check the central-character hypothesis of globalization.

For one split central factor, the idele-class group of $K$ fits into the split exact sequence

#[#set math.equation(numbering: n => "(4.7)")
 $ 1 arrow.r (product_x cal(O)_x^times) \/ k_0^times arrow.r K^times without bb(A)_K^times arrow.r^deg bb(Z) arrow.r 0 . $ <eq:rational-idele-class-group>]

The degree-zero description follows from the triviality of $"Pic"^0 \( bb(P)^1 \)$, and the uniformizer idele at $v_0$ splits the degree map. Prescribe the given unit character at $v_0$, cancel its restriction to $k_0^times$ using a character of the residue field at infinity, and take trivial characters at the remaining unit groups. This defines a finite-order character of the left group in (4.7). Give the degree generator the prescribed finite-order value of the local character on $t$. The resulting automorphic character has the desired restriction at $v_0$. Repeat for every split central factor.

Choose a nontrivial global additive character and the resulting generic character of the Borel unipotent of $M$. Its local character at $v_0$ is in the torus orbit for which $sigma$ is generic. The globalization theorem of Gan–Lomelí [13] Theorem 1.1 now produces a globally generic cuspidal representation $Pi$ of $M \( bb(A)_K \)$ such that

$ Pi_(v_0) tilde.eq sigma \, #h(2em) Pi_x upright(" is a principal-series constituent for every ") x eq.not v_0 \, $

and whose central character is the finite-order character just constructed. Their theorem preserves the prescribed unipotent period; for the Borel unipotent and a nondegenerate character this is precisely global genericity. It imposes no restriction on the depth of $sigma$ or on the positive characteristic.

Choose a global parameter $Sigma$ occurring for $Pi$, and enlarge a finite set $S$ of places containing $v_0$ so that normalized Satake matching and all unramified conditions for the crude functional equation hold outside $S$. For the maximal parabolic under consideration, Lomelí’s crude functional equation is

#[#set math.equation(numbering: n => "(4.8)")
 $ product_i frac(L^S \( i s \, Pi \, r_i \), L^S \( 1 - i s \, Pi \, r_i^or \)) med ≐ med product_(x in S) C_(H_x) \( s tilde(alpha) \, Pi_x \) . $ <eq:crude-functional-equation>]

In [19] Theorem 4.3, the denominator is written using the contragredient $tilde(Pi)$ and $r_i$. At an unramified place, contragredience inverts the Satake class up to the Levi Weyl group, so those Euler factors are exactly the factors for $Pi$ and $r_i^or$ displayed here.

The same partial Euler products are the partial $L$-functions of $r_i compose Sigma$. Write $Phi_x$ for the local Weil–Deligne parameter obtained from $Sigma$ at $x$. The functional equation for a lisse sheaf on a curve, with ramified factors defined by inertia invariants, gives

#[#set math.equation(numbering: n => "(4.9)")
 $ product_i frac(L^S \( i s \, Pi \, r_i \), L^S \( 1 - i s \, Pi \, r_i^or \)) med ≐ med product_(x in S) product_i frac(L \( 1 - i s \, r_i^or compose Phi_x \), L \( i s \, r_i compose Phi_x \)) . $ <eq:galois-functional-equation>]

This is the usual curve functional equation [8] §§9–10; it follows from the trace formula and duality for middle extensions, and does not require purity. To check the direction of the local ratio, write the complete functional equation as $L \( s \, V \) = epsilon \( s \, V \) L \( 1 - s \, V^or \)$. Removing the Euler factors in $S$ puts $L_x \( 1 - s \, V^or \) \/ L_x \( s \, V \)$ on the right. The global epsilon factor is a nonzero constant times a monomial. After the substitutions $s mapsto i s$, its contribution has exactly the form suppressed by $≐$.

The $ell$-adic functional equation is an identity of rational functions and is transported through the fixed coefficient identification. Its partial $L$-functions agree with the automorphic ones because their Euler factors agree outside $S$. The ramified factors are those of $Phi_x$: the invariant stalk of the lisse sheaf is the inertia-invariant kernel of its monodromy, and Frobenius semisimplification does not change its determinant.

We can now isolate $v_0$. For each $x in S \\ { v_0 }$, the representation $Pi_x$ is generic and is a principal-series constituent. The principal-series comparison identifies its factor in (4.8) with its factor in (4.9), up to a unit. Local-global compatibility, together with Lemma 5, identifies the Weil part of the Frobenius-semisimplified pair $Phi_x$ with $rho_(Pi_x)$. Lemma 6 then permits us to discard its monodromy in comparing the local ratios. Cancellation leaves

$ C_H \( s tilde(alpha) \, sigma \) med ≐ med product_i frac(L \( 1 - i s \, r_i^or compose Phi_(v_0) \), L \( i s \, r_i compose Phi_(v_0) \)) . $

At $v_0$ the same compatibility and Lemma 6 replace $Phi_(v_0)$ by $\( rho_sigma \, 0 \)$, or by any specified completion $\( rho_sigma \, N_sigma \)$. This proves (4.3) for maximal parabolics with supercuspidal data. The reduction above proves it for every generic inducing representation of a maximal Levi.

=== 4.5 Completion of the comparison for an arbitrary parabolic <completion-of-the-comparison-for-an-arbitrary-parabolic>

#proof[
  The maximal-parabolic case has just been proved. For general $P = M R$, apply Lemma 11 to $w = w_H w_M$, now with $L = M$, and put $M_j = w_(< j) M w_(< j)^(- 1)$. At step $j$, the inducing data are transported from $sigma$ to $M_j$, and the twist is $w_(< j) z$. Its relative coordinate is
  $ s_j \( z \) = chevron.l w_(< j) z \, alpha_j^or chevron.r . $
  This linear function is strictly positive on the positive chamber for $P$, because its transported coroot lies outside $M$ in the inversion partition. In particular it is nonconstant. The maximal-parabolic comparison is available for each step and for every such twist, with directions from $H_j$ contributing only units. Multiplicativity gives the product of these step formulas for $C_H \( z \, sigma \)$.
  Use monodromy zero in these formulas. Transporting the step nilradicals back to $hat(M)$, the inversion partition gives their direct sum as $hat(frak(n))$. On a step summand of degree $i_j$, the twist exponent is $i_j s_j \( z \)$, which is exactly $b \( z \)$ for its connected-central weight in (4.2). Multiplicativity of Artin $L$-factors for direct sums identifies the product of all step expressions with the right side of (4.3) for $N_sigma = 0$. Finally Lemma 6, applied to each $r_b$, allows any Weil–Deligne completion with the same Weil part. ◻
]

== 5 A local criterion for temperedness <sec:local-criterion>

We now apply the local-coefficient comparison to a generic Langlands quotient. It first supplies adjoint regularity for a completion built from the tempered inducing representation. A completion of the same semisimple parameter with pure adjoint will then force the inducing exponent to vanish.

#thm([Proposition 5.1.])[
  #emph[Let $G$ be split adjoint absolutely simple over $k$. Suppose a generic irreducible representation $tau$ is the Langlands quotient of $I_P^G \( sigma_nu \)$, where $P = M R$ is a proper standard parabolic, $sigma$ is tempered, and $nu$ is in the open positive chamber for $P$. Choose a tempered completion $\( rho_sigma \, N_M \)$ from Theorem 4, twist it by $nu$, and include it in $hat(G)$. The resulting pair $\( r \, N_M \)$ has $r tilde.eq rho_tau$ and 
$ L \( s \, "Ad" compose \( r \, N_M \) \) quad upright("is regular at ") s = 1 . $

]
] <prop:generic-regularity>

#proof[
  Exactness and heredity of Whittaker coinvariants imply that $sigma$ is generic. The assertion about $r$ follows from normalized-induction and twist compatibility in Theorem 3.
  Let $A \( z \)$ be the unnormalized long intertwiner on $I_P^G \( sigma_z \)$. For tempered inducing data, $A \( z \)$ is holomorphic at $nu$ and $"im" A \( nu \)$ is the Langlands quotient; see [22] Lemme VII.4.1 and Théorème VII.4.2 and [7] Section 2.2. Since this image is generic, exactness of Whittaker coinvariants shows that the induced map on the two Whittaker lines is nonzero at $nu$. Using the algebraic trivializations with nonvanishing specializations established in Section 4, the local coefficient $C_G \( z \, sigma \)$, the inverse of that scalar, is therefore holomorphic and nonzero at $nu$.
  Decompose $hat(frak(n)) = xor.big_b V_b$ under the connected center of $hat(M)$, and denote its actions by $r_b$. For any algebraic representation of a tempered parameter, the eigenvalues of Frobenius on the kernel of monodromy have absolute value at most $1$. Indeed, a highest weight $m gt.eq 0$ of the $upright("SL")_2$ factor contributes $Q^(- m \/ 2)$ in (2.3), and the commuting Weil action has eigenvalues of absolute value $1$. Consequently its local $L$-factor is regular and nonzero when the argument has positive real part.
  Since $b \( nu \) > 0$, every denominator in the identity of Proposition 9, using $\( rho_sigma \, N_M \)$, is regular and nonzero at $z = nu$. The product is also regular and nonzero there. Local $L$-factors have no zeros, so none of the numerator factors
  $ L #scale(x: 120%, y: 120%)[\(] 1 - b \( nu \) \, r_b^or compose \( rho_sigma \, N_M \) #scale(x: 120%, y: 120%)[\)] $
  can have a pole.
  Finally the decomposition into the Levi algebra and opposite nilradicals is
  $ "Lie" \( hat(G) \) = "Lie" \( hat(M) \) xor hat(frak(n)) xor hat(frak(n))^(-) . $
  The Killing form identifies the last summand with the dual of the second. On the first summand the central twist is trivial, so its factor is regular at $1$ by temperedness. The second contributes arguments $1 + b \( nu \) > 0$. The third contributes the arguments $1 - b \( nu \)$ just controlled by the numerator factors. Multiplication of these factors proves the assertion. ◻
]

#thm([Theorem 5.2.])[
  (Pure completion criterion).  #emph[Let $G$ be split adjoint absolutely simple over a local function field $k$, and let $tau$ be an irreducible generic smooth representation of $G \( k \)$. Suppose $rho_tau$ admits a Weil–Deligne completion $\( rho_tau \, N_(*) \)$ whose adjoint representation is pure of weight zero. Then $tau$ is tempered.]
] <thm:local-criterion>

#proof[
  Assume that $tau$ is not tempered. By the Langlands classification it has the description in Proposition 12, with $P$ proper and $nu$ strictly positive. There is no real central twisting direction for an adjoint group. Let $\( r \, N_M \)$ be the completion in that proposition, retaining its realization in the fixed dual Levi. Transport the assumed completion by conjugacy to a pair $\( r \, N_(*) \)$ over this same Weil parameter; its adjoint representation remains pure.
  By Lemma 7, the adjoint $L$-factor of $\( r \, N_(*) \)$ is regular at $1$, as is that of $\( r \, N_M \)$ by Proposition 12. Proposition 8 therefore conjugates $N_M$ to $N_(*)$ by the centralizer of $r$. In particular, $"Ad" compose \( r \, N_M \)$ is pure of weight zero.
  The Weil image lies in $hat(M)$, and $N_M$ lies in $"Lie" \( hat(M) \)$. Thus $hat(frak(n))$ is a Weil–Deligne direct summand of the adjoint representation. Lemma 7 makes this summand pure of weight zero and gives
  #[#set math.equation(numbering: n => "(5.1)")
   $ lr(|det #scale(x: 120%, y: 120%)[\(] r \( "Fr" \) divides hat(frak(n)) #scale(x: 120%, y: 120%)[\)]|) = 1 . $ <eq:det-pure>]
  We compute the same determinant before and after the twist. On every central-weight summand $V_b$, the untwisted tempered parameter has Weil determinant of absolute value $1$. Its $upright("SL")_2$ factor has determinant $1$, since $upright("SL")_2$ has no nontrivial algebraic characters. Thus the untwisted Weil–Deligne Frobenius determinant has absolute value $1$ on $V_b$. Twisting by $nu$ multiplies each eigenvalue there by $Q^(- b \( nu \))$. It follows that
  #[#set math.equation(numbering: n => "(5.2)")
   $ lr(|det #scale(x: 120%, y: 120%)[\(] r \( "Fr" \) divides hat(frak(n)) #scale(x: 120%, y: 120%)[\)]|) = Q^(- sum_b b \( nu \) dim V_b) < 1 . $ <eq:det-positive>]
  The inequality is strict because $P$ is proper and every $b \( nu \) > 0$. This contradicts (5.1). ◻
]

The criterion separates the local issue from the global source of purity. In particular it requires neither a full local Langlands correspondence nor an identification of the two monodromy operators in advance.

== 6 From unramified Ramanujan to every place <sec:global>

We apply Theorem 13 to a global parameter. The only input specific to the global Ramanujan problem is the following result from the companion manuscript [21] Corollary 1.2.

#thm([Theorem 6.1.])[
  (Unramified generalized Ramanujan).  #emph[Let $F$ be the function field of a smooth projective geometrically connected curve over a finite field. Let $G \/ F$ be split connected adjoint absolutely simple. If a complex cuspidal automorphic representation of $G \( bb(A)_F \)$ has a generic unramified component, then all its unramified components are tempered.]
] <thm:unramified>

#proof[
  Write $F = bb(F)_q \( X \)$ and choose a nonzero global Whittaker functional for $pi$. Every local component of its character is nondegenerate: on a simple root group, an automorphic additive character is indexed under adelic additive duality by a nonzero element of $F$, and is therefore nontrivial at every place. Evaluating the global functional on a pure tensor where it is nonzero, then varying the factor at $v$, gives a nonzero local Whittaker functional on $pi_v$. Thus every $pi_v$ is generic.
  Almost every $pi_v$ is unramified, so Theorem 14 applies. Choose an occurring global parameter $Sigma$ as in Theorem 3; $G$ has trivial center. On a sufficiently small nonempty open subset $X^compose subset X$, the adjoint local system $"Ad" compose Sigma$ is lisse and its Frobenius classes are the adjoints of the normalized Satake parameters. Temperedness at these places says that all these eigenvalues have absolute value $1$. Hence $"Ad" compose Sigma$ is pointwise $iota$-pure of weight zero.
  Fix any place $v$, removing it from $X^compose$ if necessary. Deligne’s theorem on weights of local monodromy for curves [9] Théorème 1.8.4 shows that the local Weil–Deligne representation of this adjoint sheaf is pure of weight zero: on the $j$th monodromy-graded piece, Frobenius eigenvalues have absolute value $Q_v^(j \/ 2)$. This theorem is in the fixed-$iota$ form and applies to pointwise pure lisse sheaves on open curves. Frobenius semisimplification does not change those eigenvalues.
  Let $\( r_v \, N_v \)$ be the dual-group-valued pair of the local restriction of $Sigma$. By Lemma 5 and Theorem 3(iii), $r_v$ is conjugate to $rho_(pi_v)$. Its adjoint completion is pure of weight zero by the preceding paragraph. Theorem 13 now gives temperedness of $pi_v$.
  Finally, the local representations are unitarizable because $pi$ occurs in the cuspidal $L^2$-spectrum of the adjoint group. Temperedness in the nonarchimedean Langlands classification is equivalent to weak containment of this unitary realization in the regular representation; see [27]. This is the meaning asserted in Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~Arthur, #emph[Unipotent automorphic representations: conjectures], Astérisque #strong[171--172] (1989), 13--71.]
#bibitem([2])[I.~N. Bernstein and A.~V. Zelevinsky, #emph[Induced representations of reductive $p$-adic groups. I], Ann. Sci. École Norm. Sup. (4) #strong[10] (1977), no.~4, 441--472. #link("https://doi.org/10.24033/asens.1333")[doi:10.24033/asens.1333].]
#bibitem([3])[D.~Ciubotaru and M.~Harris, #emph[On the generalized Ramanujan and Arthur conjectures over function fields], Ann. of Math. (2) #strong[204] (2026), no.~2, 545--601. #link("https://doi.org/10.4007/annals.2026.204.2.3")[doi:10.4007/annals.2026.204.2.3].]
#bibitem([4])[C.~Cunningham, S.~Dijols, A.~Fiori, and Q.~Zhang, #emph[Whittaker normalization of $p$-adic ABV-packets and Vogan's conjecture for tempered representations], Int. Math. Res. Not. IMRN #strong[2025] (2025), no.~20, rnaf316. #link("https://doi.org/10.1093/imrn/rnaf316")[doi:10.1093/imrn/rnaf316].]
#bibitem([5])[J.-F. Dat, D.~Helm, R.~Kurinczuk, and G.~Moss, #emph[Finiteness for Hecke algebras of $p$-adic groups], J. Amer. Math. Soc. #strong[37] (2024), 929--949. #link("https://doi.org/10.1090/jams/1034")[doi:10.1090/jams/1034].]
#bibitem([6])[J.-F. Dat, D.~Helm, R.~Kurinczuk, and G.~Moss, #emph[Local Langlands in families: The banal case], J. Reine Angew. Math., published online 2026. #link("https://doi.org/10.1515/crelle-2026-0034")[doi:10.1515/crelle-2026-0034].]
#bibitem([7])[H.~del Castillo, G.~Henniart, and L.~Lomelí, #emph[On generic representations of quasi-split reductive groups over local fields of positive characteristic], preprint, 2024, #link("https://arxiv.org/abs/2412.00229")[arXiv:2412.00229].]
#bibitem([8])[P.~Deligne, #emph[Les constantes des équations fonctionnelles des fonctions $L$], in #emph[Modular Functions of One Variable II], Lecture Notes in Mathematics #strong[349], Springer, Berlin, 1973, 501--597. #link("https://doi.org/10.1007/978-3-540-37855-6_7")[doi:10.1007/978-3-540-37855-6\_7].]
#bibitem([9])[P.~Deligne, #emph[La conjecture de Weil. II], Publ. Math. Inst. Hautes Études Sci. #strong[52] (1980), 137--252. #link("https://doi.org/10.1007/BF02684780")[doi:10.1007/BF02684780].]
#bibitem([10])[V.~G. Drinfeld, #emph[Proof of the Petersson conjecture for $upright(G L) \( 2 \)$ over a global field of characteristic $p$], Funct. Anal. Appl. #strong[22] (1988), no.~1, 28--43. #link("https://doi.org/10.1007/BF01077720")[doi:10.1007/BF01077720].]
#bibitem([11])[W.~T. Gan, M.~Harris, and W.~Sawin, with an appendix by R.~Beuzart-Plessis, #emph[Local parameters of supercuspidal representations], Forum Math. Pi #strong[12] (2024), e13, 1--41. #link("https://doi.org/10.1017/fmp.2024.10")[doi:10.1017/fmp.2024.10].]
#bibitem([12])[W.~T. Gan and A.~Ichino, #emph[The Gross--Prasad conjecture and local theta correspondence], Invent. Math. #strong[206] (2016), 705--799. #link("https://doi.org/10.1007/s00222-016-0662-8")[doi:10.1007/s00222-016-0662-8].]
#bibitem([13])[W.~T. Gan and L.~Lomelí, #emph[Globalization of supercuspidal representations over function fields and applications], J. Eur. Math. Soc. #strong[20] (2018), no.~11, 2813--2858. #link("https://doi.org/10.4171/JEMS/825")[doi:10.4171/JEMS/825].]
#bibitem([14])[A.~Genestier and V.~Lafforgue, #emph[Chtoucas restreints pour les groupes réductifs et paramétrisation de Langlands locale], preprint, 2017, revised July 30, 2026, #link("https://arxiv.org/abs/1709.00978v3")[arXiv:1709.00978v3].]
#bibitem([15])[B.~H. Gross and D.~Prasad, #emph[On the decomposition of a representation of $upright(S O)_n$ when restricted to $upright(S O)_(n - 1)$], Canad. J. Math. #strong[44] (1992), no.~5, 974--1002. #link("https://doi.org/10.4153/CJM-1992-060-8")[doi:10.4153/CJM-1992-060-8].]
#bibitem([16])[L.~Lafforgue, #emph[Chtoucas de Drinfeld et correspondance de Langlands], Invent. Math. #strong[147] (2002), no.~1, 1--241. #link("https://doi.org/10.1007/s002220100174")[doi:10.1007/s002220100174].]
#bibitem([17])[V.~Lafforgue, #emph[Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale], J. Amer. Math. Soc. #strong[31] (2018), no.~3, 719--891. #link("https://doi.org/10.1090/jams/897")[doi:10.1090/jams/897].]
#bibitem([18])[L.~A. Lomelí, #emph[Functoriality for the classical groups over function fields], Int. Math. Res. Not. IMRN #strong[2009] (2009), no.~22, 4271--4335. #link("https://doi.org/10.1093/imrn/rnp089")[doi:10.1093/imrn/rnp089].]
#bibitem([19])[L.~A. Lomelí, #emph[The Langlands--Shahidi method over function fields: Ramanujan Conjecture and Riemann Hypothesis for the unitary groups], preprint, 2015, #link("https://arxiv.org/abs/1507.03625")[arXiv:1507.03625].]
#bibitem([20])[L.~A. Lomelí, #emph[Rationality and holomorphy of Langlands--Shahidi $L$-functions over function fields], Math. Z. #strong[291] (2019), 711--739. #link("https://doi.org/10.1007/s00209-018-2100-7")[doi:10.1007/s00209-018-2100-7].]
#bibitem([21])[OpenAI, #emph[Ramanujan--Arthur Decompositions of Cuspidal Functions at Full Finite Level], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Ramanujan-Arthur-Decompositions-of-Cuspidal-Functions-at-Full-Finite-Level-September-24-2026/paper.pdf")[OAI:Ramanujan-Arthur-Decompositions-of-Cuspidal-Functions-at-Full-Finite-Level-September-24-2026], 2026.]
#bibitem([22])[D.~Renard, #emph[Représentations des groupes réductifs $p$-adiques], Cours spécialisés #strong[17], Société Mathématique de France, Paris, 2010.]
#bibitem([23])[F.~Rodier, #emph[Modèles de Whittaker des représentations admissibles des groupes réductifs $p$-adiques quasi-déployés], author manuscript, revised 1975. #link("https://www.normalesup.org/~rodier/Whittaker.pdf")[Author's archival manuscript]. The published summary appears in #emph[Harmonic Analysis on Homogeneous Spaces], Proc. Sympos. Pure Math. #strong[26], American Mathematical Society, Providence, RI, 1973, 425--430.]
#bibitem([24])[W.~Sawin and N.~Templier, #emph[On the Ramanujan conjecture for automorphic forms over function fields I. Geometry], J. Amer. Math. Soc. #strong[34] (2021), no.~3, 653--746. #link("https://doi.org/10.1090/jams/968")[doi:10.1090/jams/968].]
#bibitem([25])[F.~Shahidi, #emph[Arthur packets and the Ramanujan conjecture], Kyoto J. Math. #strong[51] (2011), no.~1, 1--23. #link("https://doi.org/10.1215/0023608X-2010-018")[doi:10.1215/0023608X-2010-018].]
#bibitem([26])[R.~Taylor and T.~Yoshida, #emph[Compatibility of local and global Langlands correspondences], J. Amer. Math. Soc. #strong[20] (2007), no.~2, 467--493. #link("https://doi.org/10.1090/S0894-0347-06-00542-X")[doi:10.1090/S0894-0347-06-00542-X].]
#bibitem([27])[J.-L. Waldspurger, #emph[La formule de Plancherel pour les groupes $p$-adiques, d'après Harish-Chandra], J. Inst. Math. Jussieu #strong[2] (2003), no.~2, 235--333. #link("https://doi.org/10.1017/S1474748003000082")[doi:10.1017/S1474748003000082].]


