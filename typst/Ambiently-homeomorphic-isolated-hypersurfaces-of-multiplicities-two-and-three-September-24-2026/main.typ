#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Ambiently homeomorphic isolated hypersurfaces \
of multiplicities two and three]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 The multiplicity problem <sec:introduction>

For a nonzero convergent power series $f in bb(C) { z_1 \, dots.h \, z_N }$ with $f \( 0 \) = 0$, the order $"ord"_0 f$ is the least total degree of a monomial with nonzero coefficient. When $f$ is reduced, this integer is the multiplicity of the hypersurface germ $V \( f \) = { f = 0 }$. Two such germs are #emph[ambiently homeomorphic] if a homeomorphism between neighborhoods of the origin in $bb(C)^N$ fixes the origin and carries one hypersurface to the other. Zariski’s multiplicity question asks whether this embedded topological equivalence determines multiplicity #cite(label("Zariski1971")). It asks, in particular, whether topology can distinguish a hypersurface with a nonzero quadratic term from one whose first nonzero terms are cubic.

For an irreducible plane curve, the classical relation between embedded topology and the characteristic data of a branch determines its multiplicity #cite(label("Zariski1932")). Summing the branch multiplicities gives the same conclusion for a reduced plane curve. In every ambient dimension, the A’Campo–Lê theorem shows that a reduced hypersurface germ ambiently homeomorphic to a smooth one is itself smooth #cite(label("ACampo1973")) #cite(label("Le1973")); see #cite(label("Sampaio2025Milnor")) Theorem 2.2. Thus multiplicity one cannot occur in an unequal-multiplicity pair. Eyral surveys the multiplicity problem and its further positive cases #cite(label("Eyral2007")). In higher dimensions, the Milnor fibration gives powerful topological invariants of an isolated singularity #cite(label("Milnor1968")). Its integral middle homology carries both a monodromy operator and a Seifert form. The latter records linking of cycles in neighboring fibers and, in a suitable high-dimensional range, classifies the embedded link. Multiplicity, by contrast, is read directly from the lowest-degree terms of an equation. Our construction separates these two kinds of information.

A polynomial is #emph[weighted homogeneous with positive rational weights] if there are positive integers $a_1 \, dots.h \, a_N \, d$ such that $f \( t^(a_1) z_1 \, dots.h \, t^(a_N) z_N \) = t^d f \( z \)$; the normalized weights are $w_i = a_i \/ d$. We prove the following existence statement.

#thm([Theorem 1.1.])[
  #emph[There is a finite integer $N > 3$, divisible by eight, and there are reduced polynomials $f_1 \, f_2 in bb(R) \[ z_1 \, dots.h \, z_N \]$, weighted homogeneous for positive rational weights, such that:]
  + #emph[each $f_j$ has an isolated critical point at the origin;]
  + #emph[$"ord"_0 f_1 = 2$ and $"ord"_0 f_2 = 3$;]
  + #emph[there is a homeomorphism germ of ambient pairs 
$ \( bb(C)^N \, V \( f_1 \) \, 0 \) med tilde.equiv med \( bb(C)^N \, V \( f_2 \) \, 0 \) . $

]
] <thm:main>

Theorem 1 gives a negative answer to the embedded Zariski multiplicity conjecture. A single finite ambient dimension suffices for this purpose. The construction determines such a dimension by exact integer arithmetic; it is not intended to minimize it.

The same examples settle the corresponding questions for topological right equivalence. Holomorphic function germs $f \, g : \( bb(C)^N \, 0 \) arrow.r \( bb(C) \, 0 \)$ are #emph[topologically right equivalent] if $f = g compose phi$ for a homeomorphism germ $phi : \( bb(C)^N \, 0 \) arrow.r \( bb(C)^N \, 0 \)$. The right-topological multiplicity conjecture asks whether reduced germs related in this way have equal multiplicities; its mod-two version asks only for equal multiplicity parity #cite(label("Sampaio2025Milnor")) Conjecture 2 and Conjecture Z mod 2. Corollary 29 gives negative answers to both questions for the pair in Theorem 1. The source homeomorphism there may differ from the ambient map constructed below and is not claimed to be holomorphic or bi-Lipschitz.

A further consequence concerns Arnold’s corank problem. For a holomorphic germ $f : \( bb(C)^N \, 0 \) arrow.r \( bb(C) \, 0 \)$ with a critical point at the origin, write

$ "corank"_0 \( f \) = N - "rank"_(bb(C)) "Hess"_0 \( f \) \, $

where $"Hess"_0 \( f \)$ is the Hessian matrix at the origin. Arnold’s question asks whether this number is preserved when a homeomorphism germ of $\( bb(C)^N \, 0 \)$ carries $V \( f \)$ to $V \( g \)$ for reduced holomorphic germs $f \, g$ with critical points at the origin #cite(label("Sampaio2026")) Problem 1. Corollary 28 gives a negative answer, even for the isolated weighted homogeneous germs with real coefficients in Theorem 1.

The examples also answer a question about the lowest-degree part of a function. For a nonzero holomorphic germ $g$ vanishing at the origin, let $g_(*)$ denote its lowest nonzero homogeneous component for ordinary total degree. Its #emph[initial-form Milnor fibre] has the homotopy type of the global unit fibre $g_(*)^(- 1) \( 1 \)$; the full polynomial $g_(*)$ is retained, even when it is nonreduced #cite(label("BudurEtAl2022ContactLoci")) Proposition 1.6 in arXiv v3. Motivated by the relationship between contact loci and monodromy, Budur, Fernández de Bobadilla, Lê, and Nguyen conjectured that these fibres are homotopy equivalent for embedded topologically equivalent function germs #cite(label("BudurEtAl2022ContactLoci")) Conjecture 1.7 in arXiv v3. Sampaio studies the explicit right-equivalence formulation #cite(label("Sampaio2025Milnor")) Conjecture 4. Corollary 30 disproves both formulations after adding one common square: the germs $f_j \( z \) + t^2$ in $bb(C)^(N + 1)$ remain topologically right equivalent and have isolated critical points, but their initial-form Milnor fibres are connected and have two connected components, respectively. Even their zeroth integral homology groups are therefore different.

=== Families, metric equivalence, and the present question <families-metric-equivalence-and-the-present-question>

The question for an arbitrary pair must be distinguished from multiplicity in a family. Lê and Ramanujam showed that a one-parameter holomorphic deformation of isolated hypersurface singularities with constant Milnor number is topologically constant when the ambient complex dimension differs from three #cite(label("LeRamanujam1976")). In the excluded case $bb(C)^3$, the companion #cite(label("OpenAIMuConstant2026")) Theorem 1.1 proves, after shrinking, topological right-triviality for holomorphic one-parameter families $f_t$ with $f_t \( 0 \) = 0$, an isolated critical point at the origin for every $t$, and constant $mu \( f_t \, 0 \)$. Greuel and O’Shea proved equimultiplicity for the corresponding deformation problem at an isolated quasihomogeneous singularity #cite(label("Greuel1986")) #cite(label("OShea1987")). Fernández de Bobadilla and Pełka subsequently established equimultiplicity for continuous families with finite constant Milnor number, including coefficientwise continuous families of formal power series #cite(label("BobadillaPelka2022")) Theorem 1.1 and Corollary 1.3. Their Example 8.6 gives topologically equivalent germs in $bb(C)^4$, both of multiplicity two, that cannot be joined by a continuous $mu$-constant family. They obtain the embedded equivalence by adding two independent squares to plane-curve germs with the same integral Seifert form, a precedent for the passage from integral forms to embedded topology used here. Thus an arbitrary equivalent pair does not reduce to the family problem. The two different multiplicities in Theorem 1 therefore preclude a connecting $mu$-constant family.

There are also positive results for pairs under additional geometric hypotheses. Yau established multiplicity invariance for pairs of isolated quasihomogeneous surface singularities in $bb(C)^3$ #cite(label("Yau1988")) Theorem C, crediting the detailed proofs jointly with Xu in the article’s added note. Metric and low-dimensional hypotheses give further positive results. Fernandes, Jelonek, and Sampaio proved that multiplicity two is preserved by ambient bi-Lipschitz equivalence, and that Hessian corank is preserved by ambient homeomorphisms in three complex variables #cite(label("FernandesJelonekSampaio2025")) Corollary 3.5 and Theorem 4.4. The homeomorphism in Theorem 1 is topological and its ambient dimension is larger than three. Sampaio’s more recent corank-parity theorem gives an ambient topological invariant in every dimension #cite(label("Sampaio2026")) Theorem 4.1. Corollary 28 is consistent with this theorem: the two Hessian ranks are even, so the unequal coranks have the same parity. These comparisons describe the precise topological setting of the counterexample.

=== The main ideas <the-main-ideas>

The main difficulty is to preserve different ordinary orders while making the #emph[integral Seifert forms] coincide. We compare the spectra, finite multisets of rational exponents whose exponentials give the monodromy eigenvalues. Equality of spectra alone does not accomplish the desired integral identification. For the isolated weighted homogeneous singularities considered here, in a fixed ambient dimension, the spectrum determines the real Seifert form, through the work of Steenbrink and Némethi #cite(label("Steenbrink1977")) #cite(label("Steenbrink1989")) #cite(label("Nemethi1995")) #cite(label("BalnojanHertling2019")). For sums of chain singularities, the integral-monodromy results of Hertling and Mase, building on Orlik and Randell, separately determine the integral module with its monodromy operator #cite(label("Orlik1972")) #cite(label("OrlikRandell1977")) #cite(label("HertlingMase2022")). The two resulting identifications need not be compatible. The arithmetic part of the proof produces a single integral map preserving the whole Seifert form.

===== 1.1 1. Seeds from a finite relation. <seeds-from-a-finite-relation.>

We begin with two multiplicative identities among explicitly specified positive rational numbers. A finite valuation matrix certifies an integer relation whose coefficient sum is positive. A decreasing integer-remainder construction completes each required weight to an isolated chain polynomial. The two collections of chains have different numbers of variables; balancing the difference by squares on one side produces multiplicity two there, while common cubes give multiplicity three on the other. The product identities and a triple-angle identity show that the spectra agree modulo two. The two classical classification results just described then supply a real Seifert-form isometry and an integral monodromy-module isomorphism (Section 3).

===== 1.2 2. Compatible local and rational forms. <compatible-local-and-rational-forms.>

After adding common fifth and seventh powers, the monodromy has finite odd order and no eigenvalue one. In even ambient dimension, this permits an integral symmetrization of each Seifert form that retains the monodromy and recovers the original form. We prove that a first tensor square of these symmetric data has equivariant isometries over every $bb(Z)_ell$. At odd primes, square roots and sums of two squares in a finite operator algebra produce the maps. At two, the operator splits the lattice into dual pairs and unramified hermitian modules. A quadratic-form local–global argument then supplies an equivariant rational isometry (Section 4).

===== 1.3 3. A single integral isometry. <a-single-integral-isometry.>

The rational map and the local maps can still differ by nontrivial eigenspace determinants. Real coefficients provide integral involutions reversing monodromy. A second tensor square pairs each map with its conjugate by these involutions; an exact determinant calculation cancels the discrepancies on every eigenspace. Six common cubic variables make every relevant hermitian form indefinite. Two further common pure powers, of degrees eleven and thirteen, eliminate real eigenvalues. The determinant-one isometry group is now a product of special unitary groups. The strong-approximation method of Eichler, Kneser, and Platonov #cite(label("Platonov1969")) #cite(label("Platonov1970")) #cite(label("Rapinchuk2014")) gives a rational group element meeting all prescribed local lattice conditions, and hence an integral Seifert-form isometry (Section 5).

===== 1.4 4. From forms to ambient germs. <from-forms-to-ambient-germs.>

The Thom–Sebastiani theorem and Sakamoto’s integral Seifert-form formula realize the tensor operations by polynomial sums in disjoint variables #cite(label("SebastianiThom1971")) #cite(label("Sakamoto1974")). The last two pure powers also force $det \( 1 - T \) = 1$ for the final monodromy $T$. The links are thus homotopy spheres, and the Milnor fibration verifies that they are simple knots. Levine’s classification converts the integral Seifert congruence into embedded link equivalence #cite(label("Levine1970")). Weighted radial coordinates extend that equivalence to a homeomorphism of ambient germs (Section 6). Figure 1 collects these stages and their distinct outputs.

Section 6 then applies the results of King and Saeki to obtain topological right equivalence. Real coefficients remove the complex-conjugation alternative in that transfer #cite(label("King1978")) #cite(label("Saeki1989")) #cite(label("Sampaio2025Milnor")). Adding a square in one new variable preserves right equivalence and gives the different connectedness of the initial-form Milnor fibres.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 1,
  align: (center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[#strong[Arithmetic relations and chain polynomials] Equal spectra modulo $2$; ordinary orders $2$ and $3$.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[#strong[Two separate seed identifications] Real Seifert forms and integral monodromy modules.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double quad$ common fifth and seventh powers;
],
  table.cell(rowspan: 1, colspan: 1)[#emph[symmetrize and take one tensor square]
],
  table.cell(rowspan: 1, colspan: 1)[#strong[Equivariant isometries over $bb(Q)$ and every $bb(Z)_ell$] A second tensor square cancels their eigenspace determinant defects.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double quad$ common cubic, eleventh, and thirteenth powers
],
  table.cell(rowspan: 1, colspan: 1)[#strong[One integral Seifert-form isometry] Indefinite special unitary groups and strong approximation.
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double quad$ simple spherical knots and weighted radial coordinates
],
  table.cell(rowspan: 1, colspan: 1)[#strong[Ambiently homeomorphic hypersurface germs] Disjoint sums preserve the two different ordinary orders.
],
)
]],
  caption: [Figure 1: The proof keeps analytic order separate from the successive identifications of topological data. The two seed identifications are independent; the local and global arithmetic makes them compatible. ],
) <fig:proof-route>

Section 2 fixes the conventions and exact classical inputs. Appendix 7 contains the complete integer program for the finite rank certificate; a separately supplied exact relation can be verified by trial division alone. All construction, local algebra, determinant calculations, and the passage from local lattices to an integral map are proved in the text. The classical singularity-theoretic, arithmetic, and topological classification theorems are invoked after checking their hypotheses.

=== Conventions <conventions>

Every sum combining singularities uses disjoint sets of variables. Superscript $\[ i \]$ marks a fresh copy of a polynomial. An isometry of lattices with operators is required to intertwine those operators. The transpose of a matrix is $M^(sans(t))$. A lattice is a finite-rank free abelian group; a bilinear form is unimodular if its determinant is $plus.minus 1$.

== 2 Classical inputs and conventions <sec:background>

This section records the classical results used below, together with their hypotheses and the conventions needed to apply them.

=== 2.1 Milnor lattices, spectra, and integral monodromy <milnor-lattices-spectra-and-integral-monodromy>

#thm([Theorem 2.1.])[
  (Milnor).  #emph[Let $s gt.eq 2$, and let $f : \( bb(C)^s \, 0 \) arrow.r \( bb(C) \, 0 \)$ be a holomorphic germ with an isolated critical point at $0$, with $f \( 0 \) = 0$. For sufficiently small $epsilon > 0$, the link $K_f = f^(- 1) \( 0 \) ∩ S_epsilon^(2 s - 1)$ is a smooth closed manifold of dimension $2 s - 3$, and 
$ f \/ \| f \| : S_epsilon^(2 s - 1) \\ K_f arrow.r S^1 $

 is a locally trivial fibration. Each fiber is the interior of its closure $F_f$, a compact manifold with boundary $K_f$. Both $F_f$ and its interior are homotopy equivalent to a finite bouquet of $\( s - 1 \)$-spheres. The link is $\( s - 3 \)$-connected.]
] <bg:milnor>

See #cite(label("Milnor1968")) Theorems 4.8, 5.2, and 6.5, and Lemma 6.1. The free group $L_f = tilde(H)_(s - 1) \( F_f \; bb(Z) \)$ is the #emph[Milnor lattice]; for a one-variable power we use the reduced zeroth homology of its finite Milnor fiber. The unimodular integral Seifert form is $S_f \( x \, y \) = "lk" \( x \, y^(+) \)$, where the second cycle is pushed positively to a neighboring page. We use column vectors and fix the monodromy convention

#[#set math.equation(numbering: n => "(2.1)")
 $ M_f = \( - 1 \)^s S_f^(- 1) S_f^(sans(t)) . $ <eq:bg-monodromy>]

This amounts to using the inverse of the monodromy in the convention $S_f \( M x \, y \) = \( - 1 \)^s S_f \( y \, x \)$; see #cite(label("BalnojanHertling2019")) Section 6, Equations (6.1)–(6.2). Inverting monodromy throughout preserves every comparison made below. An isomorphism of Seifert forms means integral congruence unless a different coefficient field or ring is specified.

#thm([Theorem 2.2.])[
  (Thom–Sebastiani–Sakamoto).  #emph[Suppose $f$ and $g$ have isolated critical points in $a$ and $b$ variables, respectively. There is an isomorphism of integral lattices 
$ L_(f + g) tilde.equiv L_f ⊗_(bb(Z)) L_g $

 under which 
$ M_(f + g) tilde.equiv M_f ⊗ M_g \, #h(2em) S_(f + g) tilde.equiv \( - 1 \)^(a b) S_f ⊗ S_g . $

 The assertion includes one-variable powers, with reduced zeroth homology.]
] <bg:ts>

The tensor-product monodromy theorem originates with Sebastiani and Thom #cite(label("SebastianiThom1971")). The integral Seifert-form formula is #cite(label("Sakamoto1974")) Theorem 2, p. 715; the lattice and monodromy formulas are also recorded in #cite(label("BalnojanHertling2019")) Section 6, Equations (6.3)–(6.5). Thus comparisons of sums with the same factor dimensions have the same overall tensor sign.

A polynomial has #emph[normalized positive weights] $w_1 \, dots.h \, w_s in bb(Q)_(> 0)$ if $f \( lambda^(w_1) z_1 \, dots.h \, lambda^(w_s) z_s \) = lambda f \( z \)$, understood after clearing denominators. We use positive spectral exponents $beta in \( 0 \, s \)$, shifted by $1$ from the convention with spectrum in $\( - 1 \, s - 1 \)$.

#thm([Theorem 2.3.])[
  (Weighted homogeneous spectrum).  #emph[If $f$ is weighted homogeneous of normalized degree $1$ and has an isolated critical point, its spectral polynomial is 
#[#set math.equation(numbering: n => "(2.2)")
 $ P_f \( t \) = sum_(beta in "Sp"^(+) \( f \)) t^beta = product_(j = 1)^s frac(t^(w_j) - t, 1 - t^(w_j)) . $ <eq:bg-spectrum>]

 Exponents are counted with multiplicity. Their classes modulo $bb(Z)$ determine the eigenvalues of $M_f$ by exponentiation, with a fixed choice of sign in the exponent. The operator $M_f$ has finite order.]
] <bg:spectrum>

Here is the algebraic conversion from the usual spectrum formula to (2.2). Steenbrink’s monomial formula #cite(label("Steenbrink1989")) Section 1, Examples, p. 165 assigns exponent $sum_j \( k_j + 1 \) w_j$ to a monomial $z^k$ in a homogeneous basis of $bb(C) \[ z_1 \, dots.h \, z_s \] \/ \( partial f \)$. The derivatives have degrees $1 - w_j$ and form a regular sequence: their common zero set is the origin, so the ideal has height $s$ in the Cohen–Macaulay polynomial ring #cite(label("StacksProject")) Tags 00ND and 02JN. The local regular-sequence criterion applies at the homogeneous maximal ideal; positive grading detects regularity there. Successive multiplication exact sequences therefore give

$ "Hilb" #scale(x: 120%, y: 120%)[\(] bb(C) \[ z \] \/ \( partial f \) \, t #scale(x: 120%, y: 120%)[\)] = product_j frac(1 - t^(1 - w_j), 1 - t^(w_j)) . $

Multiplication by $t^(sum_j w_j)$ yields (2.2). Finally, the weighted coordinate rotation $z_j mapsto e^(2 pi i w_j) z_j$ represents geometric monodromy; a common multiple of the weight denominators kills this rotation. Finite-order operators in characteristic zero are semisimple.

#thm([Theorem 2.4.])[
  (Real Seifert forms from the spectrum).  #emph[Let $f$ and $g$ be isolated weighted homogeneous singularities in the same number of variables. If their multisets of positive spectral exponents agree modulo $2 bb(Z)$, their real Seifert forms are isomorphic.]
] <bg:real>

For clarity, this is a consequence of the spectral-pair classification, not an assertion about integral forms. Némethi’s theorem #cite(label("Nemethi1995")) Theorem 6.5 and #cite(label("BalnojanHertling2019")) Theorem 4.4(b) say that spectral pairs modulo $2 bb(Z)$ in the first coordinate, together with the dimension, determine the real Seifert form. In the present semisimple case the nilpotent logarithm is zero. Put $m = s - 1$. The actual cohomological weight is $m$ away from eigenvalue $1$ and $m + 1$ at eigenvalue $1$; the definition of spectral pairs subtracts the latter shift, so every second coordinate is $m$. Thus this coordinate supplies no additional data. Translation $beta mapsto beta - 1$ respects equality modulo $2 bb(Z)$, and the normalization and passage from cohomology to homology depend only on $s$. More explicitly, the singularity construction gives a signed Steenbrink polarized mixed Hodge structure, whose defining replacement of the nilpotent logarithm by its negative leaves the data unchanged when that logarithm is zero #cite(label("BalnojanHertling2019")) Definition 6.1 and Remark 6.2. In that convention the normalized cohomological Seifert form is $\( - 1 \)^(\( m + 1 \) \( m + 2 \) \/ 2)$ times the dual homological Seifert form #cite(label("BalnojanHertling2019")) Equation (6.14). The common sign and duality preserve isomorphism. This proves the stated consequence, including the eigenvalue-$1$ part.

#thm([Theorem 2.5.])[
  (Hertling–Mase).  #emph[Suppose $f$ is a sum of chains 
$ x_1^(a_1) x_2 + dots.h.c + x_(r - 1)^(a_(r - 1)) x_r + x_r^(a_r) \, #h(2em) a_i gt.eq 2 \, $

 including chains with $r = 1$. Write the characteristic polynomial of $M_f$ as $product_d Phi_d \( t \)^(c_d)$, where $Phi_d$ is cyclotomic. Then, as an integral module with operator $t = M_f$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ \( L_f \, M_f \) tilde.equiv xor.big_(j = 1)^(max c_d) bb(Z) \[ t \] \/ #scale(x: 120%, y: 120%)[\(] p_j \( t \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) p_j \( t \) = product_(c_d gt.eq j) Phi_d \( t \) . $ <eq:bg-orlik>]

 In particular, the eigenvalues with multiplicity determine this integral monodromy module within the indicated class of singularities.]
] <bg:orlik>

Orlik formulated the integral-monodromy decomposition #cite(label("Orlik1972")); the chain calculation of Orlik and Randell #cite(label("OrlikRandell1977")) is a predecessor of the standard decomposition proved by Hertling and Mase. The precise result used here is #cite(label("HertlingMase2022")) Theorem 1.3(a), (c), (d), and Definition 2.6. Reversing the variables puts our chains in that paper’s convention. Each standard block has an integral cyclic generator, hence is exactly the companion module displayed in (2.3). Inverting its operator preserves cyclicity and its characteristic polynomial, whose roots are invariant under inversion. Thus (2.1) causes no change to the conclusion. This theorem controls the lattice with monodromy; it does not identify the integral Seifert form.

=== 2.2 Arithmetic inputs <arithmetic-inputs>

For a number field $F$, write $F_v$ for its completion at a place $v$.

#thm([Theorem 2.6.])[
  (Hasse–Minkowski).  #emph[Two nondegenerate quadratic forms over a number field $F$ are isometric over $F$ if and only if they are isometric over $F_v$ for every place $v$, including the archimedean places.]
] <bg:hasse>

We use the number-field form of the theorem; see #cite(label("Milne2022")) Theorem 25.64(c) and the following discussion; see also #cite(label("OMeara1963")) Chapter VI.

#thm([Theorem 2.7.])[
  (Strong approximation).  #emph[Let $G$ be a connected, simply connected, absolutely almost simple algebraic group over a number field $F$. If $product_(v divides oo) G \( F_v \)$ is noncompact, then $G \( F \)$ is dense in $G \( bb(A)_(F \, f) \)$, the group of finite adelic points.]
] <bg:approximation>

See #cite(label("Platonov1969")) Theorem A, p. 1140, with the correction in #cite(label("Platonov1970")), and #cite(label("Rapinchuk2014")) Theorem 2.3, p. 281. Here the finite adelic group is the restricted product of the $G \( F_v \)$ over finite places, with respect to integral compact open subgroups. Consequently the density concerns approximation at finitely many places together with integrality at all remaining places. We apply the theorem to special unitary groups of nondegenerate hermitian forms over a totally imaginary quadratic extension of a totally real number field. In dimension at least two these groups are connected, simply connected, and absolutely almost simple; an indefinite archimedean component makes their archimedean product noncompact. The construction below verifies these hypotheses for every factor used.

=== 2.3 Embedded high-dimensional topology <embedded-high-dimensional-topology>

#thm([Theorem 2.8.])[
  (Smale and Levine).  #emph[A smooth closed manifold of dimension $d gt.eq 5$ that is homotopy equivalent to $S^d$ is homeomorphic to $S^d$.]
  #emph[Let $q gt.eq 3$, and let $K_1 \, K_2 subset S^(2 q + 1)$ be smooth oriented submanifolds homeomorphic to $S^(2 q - 1)$. Suppose the knots are #emph[simple], meaning 
$ pi_1 \( S^(2 q + 1) \\ K_j \) tilde.equiv bb(Z) \, #h(2em) pi_i \( S^(2 q + 1) \\ K_j \) = 0 quad \( 2 lt.eq i lt.eq q - 1 \) . $

 If their integral Seifert matrices are congruent, then they are ambiently isotopic. In particular their embedded sphere pairs are homeomorphic.]
] <bg:classification>

The first assertion is the high-dimensional generalized Poincaré theorem #cite(label("Smale1961")) Theorem A, p. 391. The second follows from #cite(label("Levine1970")) Theorem 3, pp. 185–186: integral congruence is a special case of the matrix equivalence in that theorem. Levine’s knots are required to be homeomorphic to spheres, so exotic smooth sphere structures are allowed. Related formulations for Milnor fibered links appear in #cite(label("Durfee1974")), #cite(label("Saeki1999")) pp. 698–699, and #cite(label("Neumann2017")) Section 2. The proof below checks the spherical and simplicity hypotheses directly before applying this theorem.

== 3 Two seeds with different orders <seed:section>

We first construct two sums of chains with the same spectrum modulo $2$, but with ordinary orders $2$ and $3$. The arithmetic ingredient is a finite relation between positive rational numbers.

#thm([Lemma 3.1.])[
  (Finite product relation).  #emph[Set $d = 3^11$ and 
$ cal(B) = { b in bb(Z) : 0 < b < d \/ 2 \, med 3 divides.not b } \, #h(2em) A_b = frac(d - b, b) \, #h(2em) R_b = frac(\( 2 d + b \) \( 2 d - b \), \( 3 d - b \) \( d + b \)) . $

 There are integers $e_b$, $b in cal(B)$, such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ E := sum_(b in cal(B)) e_b > 0 \, #h(2em) product_(b in cal(B)) A_b^(e_b) = product_(b in cal(B)) R_b^(e_b) = 1 . $ <seed:products>]

]
] <seed:product>

#proof[
  Form the integer matrix with column $b$ consisting of $\( v_p \( A_b \) \)_p$ and $\( v_p \( R_b \) \)_p$, with separate rows for the two families of prime valuations. It is enough to find an integer kernel vector whose coordinate sum is nonzero.
  Here is the finite certificate for this assertion. Retain only the columns for which each of
  $ d - b \, med b \, med 2 d + b \, med 2 d - b \, med 3 d - b \, med d + b $
  has no prime factor greater than $4450$. Repeatedly delete any column that is the only column supported on some nonzero row; discard zero rows. The resulting matrix $M$ and its augmentation $tilde(M)$ by a final row of ones satisfy
  #[
  #set par(justify: false)
#table(
  columns: 3,
  align: (left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[], table.cell(rowspan: 1, colspan: 1)[columns
], table.cell(rowspan: 1, colspan: 1)[nonzero valuation rows
]),
  table.cell(rowspan: 1, colspan: 1)[After the prime cutoff
], table.cell(rowspan: 1, colspan: 1)[$1118$
], table.cell(rowspan: 1, colspan: 1)[$1100$
],
  table.cell(rowspan: 1, colspan: 1)[After all deletions
], table.cell(rowspan: 1, colspan: 1)[$896$
], table.cell(rowspan: 1, colspan: 1)[$867$
],
)
]
  and
  #[#set math.equation(numbering: n => "(3.2)")
   $ "rank"_(bb(F)_1009) tilde(M) = 868 . $ <seed:rank-certificate>]
  Appendix 7 gives a complete program, using only integer arithmetic and elimination modulo the prime $1009$, that verifies these counts and (3.2). Its sieve stores a prime divisor of every integer greater than one. Its six signed factor entries are precisely the two valuation columns above. In the elimination, a normalized pivot is stored for each leading row, so the number of stored pivots is the rank. Thus the certificate is a finite check of the displayed integer matrix, without numerical approximation.
  Since $M$ has $867$ rows, (3.2) gives an $868$-column square submatrix $H$ of $tilde(M)$ whose integer determinant is nonzero. The vector
  $ z = "adj" \( H \) \( 0 \, dots.h \, 0 \, 1 \)^(sans(t)) $
  is integral, satisfies the valuation equations on these columns, and has coordinate sum $det H$. Extend $z$ by zeros to all columns $b in cal(B)$, and change its overall sign if necessary. This gives $e_b$ with $E = \| det H \| > 0$. Every omitted valuation row is zero on the retained columns, so all prime valuations of both products in (3.1) vanish. A positive rational number with this property is $1$, proving the Lemma. ◻
]

The adjugate prescription also makes the construction entirely finite: one may select the lexicographically first nonsingular minor, with columns ordered by $b$ and valuation rows ordered by family and prime. No bound on the size of its coefficients is needed.

#thm([Lemma 3.2.])[
  (Completing one weight to a chain).  #emph[Let $D$ be a positive odd integer and let $c in bb(Z)$ satisfy $0 < c < D \/ 2$. There is a chain polynomial 
#[#set math.equation(numbering: n => "(3.3)")
 $ F_c = x_1^(a_1) x_2 + dots.h.c + x_(ell - 1)^(a_(ell - 1)) x_ell + x_ell^(a_ell) $ <seed:chain-polynomial>]

 of weighted degree $1$, whose first weight is $c \/ D$, all of whose weights are positive and less than $1 \/ 2$, and all of whose ordinary monomial degrees are at least $3$. It has an isolated critical point at the origin. Removing its first variable and first monomial gives a chain with exactly the remaining weights, when $ell > 1$.]
] <seed:chain>

#proof[
  Set $c_1 = c$ and successively perform the divisions
  $ a_i = floor.l D \/ c_i floor.r \, #h(2em) c_(i + 1) = D - a_i c_i \, $
  stopping at the first zero remainder. Each nonzero remainder is a positive integer strictly smaller than its predecessor, so this procedure terminates. Give $x_i$ weight $c_i \/ D$. Then $a_i c_i + c_(i + 1) = D$ for each nonterminal term, and $a_ell c_ell = D$ for the terminal term. All $a_i gt.eq 2$. Consequently each nonterminal monomial has ordinary degree $a_i + 1 gt.eq 3$. The terminal exponent divides the odd integer $D$ and exceeds $2$, so it too is at least $3$.
  To prove isolation, suppose a nonzero point is critical and let $j$ be the first index with $x_j eq.not 0$. If $j = ell$, the derivative in $x_j$ is $a_ell x_ell^(a_ell - 1) eq.not 0$. Otherwise that derivative forces $x_(j + 1) = 0$, because the preceding coordinate is zero. The derivative in $x_(j + 1)$ is then $x_j^(a_j) eq.not 0$: its other term vanishes since $a_(j + 1) gt.eq 2$. Both cases contradict criticality. The same reasoning applies to the tail, which has the stated weights. ◻
]

#thm([Proposition 3.3.])[
  (The seeds).  #emph[There are real-coefficient weighted homogeneous polynomials $p_1 \, p_2$, each in an even number $s_0$ of variables, such that:]
  + #emph[both are sums, in disjoint variables, of chains with exponents at least $2$, and both have isolated critical points;]
  + #emph[$"ord"_0 p_1 = 2$ and $"ord"_0 p_2 = 3$;]
  + #emph[their spectral multisets are equal modulo $2$;]
  + #emph[their real Seifert forms are isomorphic, and, separately, their integral monodromy modules are isomorphic;]
  + #emph[both monodromy operators have order dividing $D = 3^12$.]
] <seed:seeds>

#proof[
  Fix the integers in Lemma 10, and put $D = 3 d$. The four weights below are chosen for the triple-angle identity in the spectral comparison; their signed counts will give side $2$ an excess of $4 E$ variables, to be balanced by squares on side $1$. Start with two lists of weights prescribed by the following signed counts; a positive entry means that many variables on side $2$, and a negative entry means its absolute value on side $1$:
  #[#set math.equation(numbering: n => "(3.4)")
   $ w & b \/ d & b \/ \( 3 d \) & \( d - b \) \/ \( 3 d \) & \( d + b \) \/ \( 3 d \)\
upright("count on side ") 2 upright(" minus count on side ") 1 & 2 e_b & - 2 e_b & 2 e_b & 2 e_b . $ <seed:weight-table>]
  All these weights are positive and less than $1 \/ 2$. Their numerators with denominator $D$ are $3 b \, b \, d - b \, d + b$, respectively.
  Realize each occurrence of a starting weight $c \/ D$ by its own copy of the chain in Lemma 11. On the opposite side insert an independent copy of the tail of that chain, doing nothing there if the tail is empty. The added tail weights occur equally on both sides. All variables used for different copies are disjoint. Thus this operation realizes the signed weight counts exactly by sums of isolated chains, and all its monomials have degree at least $3$.
  The variable excess on side $2$ is $4 E$. Add $4 E$ independent squares to side $1$, giving both sides the same number of variables. Every starting multiplicity in (3.4) is even, as is the number of copies of each tail, and $4 E$ is even. Both variable counts are therefore even already. Finally add two independent pure cubes to each side, and call the resulting polynomials $p_1 \, p_2$. They have the same even number $s_0$ of variables. Sums in disjoint variables have critical loci equal to products of the individual critical loci, so both critical points are isolated. All coefficients can be taken to be $1$. Squares occur only in $p_1$, and the common cubes occur in both polynomials, proving the asserted ordinary orders.
  We next compare the spectra. In the convention of Theorem 4, write
  #[#set math.equation(numbering: n => "(3.5)")
   $ P_p \( t \) = sum_(alpha in "Sp"^(+) \( p \)) t^alpha = product_(w upright(" a weight of ") p) frac(t^w - t, 1 - t^w) . $ <seed:spectrum-product>]
  All exponents lie in $\( 2 D \)^(- 1) bb(Z)$. Reduction modulo $2$ puts their multiplicities in the group algebra of the finite cyclic group $\( 2 D \)^(- 1) bb(Z) \/ 2 bb(Z)$. Its characters are $alpha mapsto e^(pi i k alpha)$, for integer $k$. By Fourier inversion, it suffices to prove that $P_(p_1)$ and $P_(p_2)$ take the same value at every such character. When an individual quotient in (3.5) is indeterminate, evaluate along $t^u = exp \( \( pi i k + epsilon \) u \)$ and let $epsilon arrow.r 0$.
  #emph[Case 1: $k = 2 m$ is even.] For a weight $w$, its individual factor has value
  #[#set math.equation(numbering: n => "(3.6)")
   $ frac(t^w - t, 1 - t^w)\|_k = cases(delim: "{", - 1 \, & m w in.not bb(Z) \,, \( 1 - w \) \/ w \, & m w in bb(Z) .) $ <seed:even-factor>]
  The second value follows by taking the ratio of the two first derivatives in $epsilon$. All these values are nonzero, so common weights can be canceled.
  The first column of (3.4) has exact reduced denominator $d$, and the other three have exact reduced denominator $3 d$, since $3 divides.not b$. Within either denominator group, therefore, all factors are exceptional in (3.6), or none are. The exceptional signed product for the first group is $product_b A_b^(2 e_b) = 1$. For the other group it is
  $ product_b (frac(b, 3 d - b) frac(2 d + b, d - b) frac(2 d - b, d + b))^(2 e_b) = product_b \( R_b \/ A_b \)^(2 e_b) = 1 . $
  The nonexceptional signs disappear because all signed counts are even. A square has exceptional value $1$ and nonexceptional value $- 1$; its total contribution is $1$, since there are $4 E$ squares. This proves equality in Case 1, including $k = 0$.
  #emph[Case 2: $k$ is odd and $3 divides.not k$.] Each factor is
  $ frac(t^w - t, 1 - t^w)\|_k = i cot \( pi k w \/ 2 \) . $
  All chain weights have a reduced denominator that is a nontrivial power of $3$. None of their cotangents has a zero or pole in this case: either would imply that this denominator divides $k$. Squares also have finite nonzero factors. Hence common weights may again be canceled.
  Put $C \( u \) = cot \( pi k u \/ 2 \)$. The exact signed identity we need is
  #[#set math.equation(numbering: n => "(3.7)")
   $ C \( b \/ d \) = frac(C \( b \/ \( 3 d \) \), C \( \( d - b \) \/ \( 3 d \) \) C \( \( d + b \) \/ \( 3 d \) \)) . $ <seed:cotangent>]
  Indeed, with $x = pi k b \/ \( 6 d \)$ the usual triple-angle product gives
  $ cot x thin cot \( x + k pi \/ 3 \) thin cot \( x + 2 k pi \/ 3 \) = - cot \( 3 x \) . $
  The shifts by $k pi \/ 3$ give the same three factors modulo $pi$ as the shifts by $pi \/ 3$, because $3 divides.not k$. Since $k$ is odd,
  $ cot \( x + k pi \/ 3 \) = frac(1, C \( \( d - b \) \/ \( 3 d \) \)) \, #h(2em) cot \( x + 2 k pi \/ 3 \) = - frac(1, C \( \( d + b \) \/ \( 3 d \) \)) . $
  Substitution proves (3.7). Its $2 e_b$-th power is exactly the assertion that the signed cotangent product in row $b$ of (3.4) equals $1$. Each square contributes $C \( 1 \/ 2 \) = cot \( pi k \/ 4 \) in { 1 \, - 1 }$, whose $4 E$-th power is $1$. Finally the powers of $i$ are the same because the two complete polynomials have the same number $s_0$ of variables. This proves equality in Case 2.
  #emph[Case 3: $k$ is odd and $3 divides k$.] A pure cube has spectrum $t^(1 \/ 3) + t^(2 \/ 3)$, whose value is $- 1 + 1 = 0$. Before the final common cubes were inserted, both sides were already isolated sums of chains and squares, so their spectra were finite polynomials. Multiplication by a cube spectrum therefore makes both character values zero. This argument uses those finite polynomials, and does not cancel a zero against a pole of an individual weight quotient. It completes the Fourier comparison.
  Weighted homogeneous monodromy has finite order and hence is semisimple. Theorem 5 now converts the equality of spectra modulo $2$ in the common dimension into an isomorphism of real Seifert forms. The same equality gives equal eigenvalue multiplicities. All summands are chains, including the pure powers, so Theorem 6 gives an isomorphism of integral monodromy modules. These are separate isomorphisms; no compatibility between them is asserted here.
  Finally, every nonsquare weight has denominator dividing $D$. Each square has spectrum $t^(1 \/ 2)$, so the $4 E$ squares together contribute $t^(2 E)$. All spectral exponents of either seed therefore belong to $D^(- 1) bb(Z)$. Their monodromy eigenvalues are $D$-th roots of unity. Semisimplicity then gives $M_(p_j)^D = 1$ for $j = 1 \, 2$, as claimed. ◻
]

#thm([Corollary 3.4.])[
  (Removing eigenvalue one).  #emph[In two new variables on each side, put 
#[#set math.equation(numbering: n => "(3.8)")
 $ q_j = p_j + x^5 + y^7 \, #h(2em) j = 1 \, 2 \, #h(2em) s = s_0 + 2 . $ <seed:q-definition>]

 These are real-coefficient isolated sums of chains in the same even number $s$ of variables, with orders $2$ and $3$. Their real Seifert forms are isomorphic, and their integral monodromy modules are isomorphic. Both monodromies have odd order dividing 
$ m = 3^12 dot.op 5 dot.op 7 \, $

 and neither has eigenvalue $1$.]
] <seed:prepared>

#proof[
  The new terms preserve isolation and ordinary orders. Formula (3.5) multiplies each seed spectrum by the same two pure-power spectra, preserving equality modulo $2$. Theorems 5 and 6 consequently apply again. Each new eigenvalue has the form
  $ alpha beta gamma \, #h(2em) alpha^D = 1 \, quad beta^5 = gamma^7 = 1 \, quad beta eq.not 1 \, quad gamma eq.not 1 . $
  Because $D$, $5$, and $7$ are pairwise coprime, its order divides $35 D$ and is divisible by both $5$ and $7$. In particular it is not $1$. Finite-order weighted homogeneous monodromy is semisimple, so the same bound holds for the order of the operators themselves. ◻
]

== 4 Local and rational isometries of tensor squares <local:section>

Let $q_1 \, q_2$ be the polynomials of Corollary 13, in the same even number $s$ of variables. Write $L_j$ for their Milnor lattices and $S_j$ for their integral Seifert forms. The two inputs from that corollary are an isomorphism of the integral monodromy modules and an isomorphism of the real Seifert forms. We now combine these inputs, first locally and then rationally.

Choose an odd integer $m$ divisible by the orders of both monodromies, and choose $r in bb(Z)$ with $2 r equiv 1 med \( mod med m \)$. With $s$ even and the monodromy convention in Equation (2.1), put

#[#set math.equation(numbering: n => "(4.1)")
 $ T_j = S_j^(- 1) S_j^(sans(t)) \, #h(2em) B_j = S_j T_j^r . $ <local:symmetric-data>]

Throughout, an #emph[equivariant isometry] between data $\( L \, T \, B \)$ means an isometry of the forms that intertwines the displayed operators. Tensor products carry both the tensor product form and the tensor product operator.

#thm([Lemma 4.1.])[
  (Symmetrization).  #emph[Each $B_j$ is an integral unimodular symmetric form preserved by $T_j$. The pair $\( B_j \, T_j \)$ recovers $S_j$ by $S_j = B_j T_j^(- r)$. The real Seifert isometry is an equivariant real isometry of the symmetric data. Symmetrization commutes with tensor products of even-variable factors, up to the common signs in Theorem 3.]
] <local:symmetrize>

#proof[
  Suppress the subscript. The defining equality $S^(sans(t)) = S T$ implies
  $ T^(sans(t)) S T = S \, #h(2em) B^(sans(t)) = \( T^r \)^(sans(t)) S^(sans(t)) = S T^(1 - r) = S T^r = B . $
  It also gives $T^(sans(t)) B T = B$. Integrality and unimodularity follow from those of $S$ and $T$. An isometry of $S$ intertwines $S^(- 1) S^(sans(t))$, and therefore preserves $B$ as well. For tensor products, use the same $r$ modulo a common odd exponent and the identity
  $ \( S_1 ⊗ S_2 \) \( T_1 ⊗ T_2 \)^r = \( S_1 T_1^r \) ⊗ \( S_2 T_2^r \) . $
  The overall Seifert signs supplied by the integral Thom–Sebastiani theorem depend only on the factor dimensions #cite(label("Sakamoto1974")); they are thus the same on the two sides of every comparison here. ◻
]

The local comparison will concern the first tensor squares

$ A_j = \( L_j \, T_j \, B_j \)^(⊗ 2) . $

Our goal is an equivariant isometry between $A_1$ and $A_2$ over every $bb(Z)_ell$, together with one over $bb(Q)$. The integral operator-module isomorphism lets us compare the two forms on a common lattice. At odd primes a tensor square makes these forms isometric; at $2$ the prepared operators already give uniqueness before tensoring. The real Seifert isometry then supplies the archimedean input for rational descent.

=== 4.1 Odd primes <odd-primes>

We first give the elementary lifting fact needed for a simultaneous isometry of the form and operator.

#thm([Lemma 4.2.])[
  (Lifting in a finite operator algebra).  #emph[Let $ell$ be an odd prime and let $cal(A)$ be a commutative $bb(Z)_ell$-algebra that is finite as a $bb(Z)_ell$-module. Write $J$ for its Jacobson radical. Then $cal(A) \/ J$ is a product of finite fields, and $cal(A)$ is complete for the $J$-adic topology. For a unit $u in cal(A)$:]
  + #emph[if its image in every residue field is a square, then $u$ is a square in $cal(A)$;]
  + #emph[$u = a^2 + b^2$ for some $a \, b in cal(A)$.]
] <local:lifting>

#proof[
  The algebra is complete for the $ell$-adic topology. For every $c in cal(A)$, the geometric series for $\( 1 - ell c \)^(- 1)$ converges, so $ell cal(A) subset.eq J$. The finite algebra $cal(A) \/ ell cal(A)$ has nilpotent radical and semisimple quotient a product of finite fields. Consequently $J^N subset.eq ell cal(A)$ for some $N$, proving that the two topologies agree and establishing the first assertions.
  For (1), choose a lift $v$ of a square root in $cal(A) \/ J$. Both $v$ and $2 v$ are units. If $e = v^2 - u in J^k$, replace $v$ by $v - e \/ \( 2 v \)$. The new error is $e^2 \/ \( 4 v^2 \) in J^(2 k)$. Iteration converges to a square root of $u$.
  In a finite field $k$ of odd cardinality, the sets of squares and of $macron(u)$ minus the squares each have $\( \| k \| + 1 \) \/ 2$ elements. They intersect, so $macron(u) = macron(a)^2 + macron(b)^2$. For (2), make such a choice in each residue field and lift it to $a_0 \, b_0 in cal(A)$. Then $c = a_0^2 + b_0^2$ is a unit and $u \/ c in 1 + J$. By (1), write $u \/ c = v^2$. Taking $a = v a_0$ and $b = v b_0$ proves the claim. ◻
]

#thm([Proposition 4.3.])[
  (Odd-prime tensor squares).  #emph[Let $L$ be a finite free $bb(Z)_ell$-module, with $ell$ odd, and let $T$ be an automorphism of $L$. If $B_1 \, B_2$ are unimodular symmetric forms preserved by $T$, then 
$ \( L ⊗ L \, T ⊗ T \, B_1 ⊗ B_1 \) tilde.equiv \( L ⊗ L \, T ⊗ T \, B_2 ⊗ B_2 \) $

 by an equivariant integral isometry.]
] <local:odd-primes>

#proof[
  Set $P = B_1^(- 1) B_2$, so $B_2 \( x \, y \) = B_1 \( x \, P y \)$. Unimodularity makes $P$ an integral automorphism. Symmetry of $B_2$ makes it self-adjoint for $B_1$, and invariance of both forms gives $P T = T P$.
  Write the characteristic polynomial of $P$ modulo $ell$ as $product_i f_i^(e_i)$, with distinct monic irreducible $f_i$. Lift this coprime factorization to $det \( X - P \) = product_i F_i$ over $bb(Z)_ell$, where $F_i med mod med ell = f_i^(e_i)$. For completeness, the lift is obtained successively modulo $ell^n$. For two coprime monic residue factors $f \, g$ of degrees $a \, b$, the correction map
  $ \( u \, v \) mapsto u g + f v \, #h(2em) deg u < a \, quad deg v < b \, $
  is an isomorphism onto the polynomials of degree less than $a + b$: its kernel is zero by coprimality and the dimensions agree. It therefore corrects the product by any prescribed error at the next power of $ell$, without changing monicity. Completeness gives the lift, and iteration handles any number of factors. The Chinese remainder idempotents for the $F_i$, evaluated at $P$, give
  $ L = xor.big_i L_i \, #h(2em) F_i \( P_i \) = 0 \, #h(2em) P_i = P \|_(L_i) . $
  These idempotents are polynomials in $P$. They are self-adjoint and commute with $T$, so the sum is orthogonal for $B_1$ and $B_2$ and each $L_i$ is $T$-stable. Each restricted form is unimodular.
  On $L_i ⊗ L_j$, let $cal(A)_(i j)$ be the algebra generated by $P_i ⊗ 1$ and $1 ⊗ P_j$. Cayley–Hamilton bounds the degrees in these two generators, so this is a finite commutative $bb(Z)_ell$-algebra of endomorphisms. Every element is self-adjoint for the restricted form $B_1 ⊗ B_1$ and commutes with $T ⊗ T$. The unit
  $ U_(i j) = P_i ⊗ P_j $
  relates the two restricted tensor forms. Its inverse belongs to $cal(A)_(i j)$, since the inverses of the generators are polynomials in them with integral coefficients.
  If $i = j$, consider a residue field of $cal(A)_(i i)$. The relations $F_i \( P_i \) = 0$ imply that the two generator images $x \, y$ are roots of $f_i$. They are nonzero because the generators are units. In a finite field, two roots of the same irreducible polynomial over $bb(F)_ell$ are Frobenius conjugates. Hence $y = x^(ell^h)$ for some $h gt.eq 0$, and
  $ x y = x^(1 + ell^h) = (x^(\( 1 + ell^h \) \/ 2))^2 . $
  Lemma 15 supplies $a in cal(A)_(i i)$ with $a^2 = U_(i i)$. Because $a$ is self-adjoint,
  $ \( B_1 ⊗ B_1 \) \( a x \, a y \) = \( B_2 ⊗ B_2 \) \( x \, y \) #h(2em) \( x \, y in L_i ⊗ L_i \) . $
  For $i < j$, pair $L_i ⊗ L_j$ with $L_j ⊗ L_i$. The factor swap identifies their operators and both their forms. On the resulting two equal blocks, use Lemma 15 to choose $a \, b in cal(A)_(i j)$ with $a^2 + b^2 = U_(i j)$ and set
  $ M = mat(delim: "(", a, b; - b, a) . $
  Writing $*$ for adjoint with respect to the first tensor form on the two blocks gives
  $ M^(*) M = mat(delim: "(", U_(i j), 0; 0, U_(i j)) . $
  This is invertible, and $M$ commutes with the tensor operator. The diagonal-block maps and these paired-block maps combine to an integral equivariant isometry from the second tensor form to the first. Its inverse has the direction asserted in the proposition. ◻
]

=== 4.2 The prime two <the-prime-two>

Here the odd order and absence of eigenvalue $1$ give a stronger result. The unramified hermitian classification underlying this step belongs to the classical local theory developed by Jacobowitz #cite(label("Jacobowitz1962")). We give the needed argument directly, including residue characteristic two.

#thm([Proposition 4.4.])[
  (Dyadic uniqueness).  #emph[Let $L$ be a finite free $bb(Z)_2$-module, and let $T$ satisfy $T^m = 1$ for an odd $m$. Suppose $1$ is not an eigenvalue of $T$ on $L ⊗ bb(Q)_2$. Any two $T$-invariant unimodular symmetric forms on $L$ are equivariantly isometric over $bb(Z)_2$.]
] <local:dyadic>

#proof[
  The reduction of $X^m - 1$ modulo $2$ is separable, since its derivative is $X^(m - 1)$ there. Lifting its distinct irreducible factors gives
  $ cal(O) = bb(Z)_2 \[ X \] \/ \( X^m - 1 \) = product_i cal(O)_i \, $
  where each $cal(O)_i$ is the integer ring of an unramified extension of $bb(Q)_2$. The action $X mapsto T$ decomposes $L = xor.big_i M_i$. Every $M_i$ is free over $cal(O)_i$: it is finite and torsion-free over this discrete valuation ring.
  Invariance of a form $B$ says that the adjoint of $X$ is $X^(- 1)$. Let $sigma$ denote this involution of $cal(O)$. If it exchanges the factors indexed by $i$ and $i'$, then $M_i$ and $M_(i')$ are isotropic and pair perfectly with each other; they are orthogonal to all other factors. Such a pairing has a unique equivariant isometry class for the prescribed modules. Indeed, it identifies $M_(i')$ with the $bb(Z)_2$-dual of $M_i$, with its $cal(O)_i$-action transported by $sigma$. An isomorphism on $M_i$ extends uniquely by its inverse dual to an isometry of the pair.
  It remains to treat a nonzero $M_i$ whose factor is preserved by $sigma$. Write $cal(O)_i = cal(D)$ and $cal(D)_0 = cal(D)^sigma$. The involution on $cal(D)$ is nontrivial. Otherwise the image $zeta$ of $X$ would satisfy $zeta = zeta^(- 1)$; its odd order would force $zeta = 1$, contrary to the hypothesis. Thus $cal(D) \/ cal(D)_0$ is an unramified quadratic extension.
  We record explicitly how $B$ becomes an integral hermitian form. The trace pairing of $cal(D)$ over $bb(Z)_2$ is perfect: modulo $2$ it is the nondegenerate trace pairing of a finite separable field extension, and its determinant is therefore a unit. Hence there is a unique $cal(D)$-valued form $h$ such that
  #[#set math.equation(numbering: n => "(4.2)")
   $ "Tr"_(cal(D) \/ bb(Z)_2) #scale(x: 120%, y: 120%)[\(] a h \( x \, y \) #scale(x: 120%, y: 120%)[\)] = B \( a x \, y \) #h(2em) \( a in cal(D) \) . $ <local:trace>]
  The adjoint relation and symmetry of $B$ give
  $ h \( a x \, b y \) = a sigma \( b \) h \( x \, y \) \, #h(2em) h \( y \, x \) = sigma \( h \( x \, y \) \) . $
  Thus $h$ is hermitian, with linear first variable. It is unimodular: after extending to fraction fields, the $B$-dual of $M_i$ equals its $h$-dual. Indeed, if $B \( x \, M_i \) subset.eq bb(Z)_2$, then for every $a in cal(D)$ and $y in M_i$,
  $ B \( a x \, y \) = B \( x \, sigma \( a \) y \) in bb(Z)_2 . $
  Testing all $a$ in (4.2) and using the perfect trace pairing gives $h \( x \, M_i \) subset.eq cal(D)$; the converse is immediate. This argument takes no quotient by $2$.
  Every unimodular hermitian form over $cal(D) \/ cal(D)_0$ is determined by its rank. Here are the details in residue characteristic two. Let $k \/ k_0$ be the quadratic residue extension and let $macron(h)$ be the reduced hermitian form. There is a vector of nonzero length. If all lengths vanished, then for all $x \, y$ and $a in k$,
  $ 0 = macron(h) \( x + a y \, x + a y \) = "Tr"_(k \/ k_0) #scale(x: 120%, y: 120%)[\(] sigma \( a \) macron(h) \( x \, y \) #scale(x: 120%, y: 120%)[\)] . $
  The finite-field trace pairing would force $macron(h) = 0$, contradicting nonsingularity. A lift of a vector of nonzero length has unit length $u in cal(D)_0^times$. Its line splits off integrally, by the projection $x mapsto u^(- 1) h \( x \, v \) v$. Its orthogonal complement is again unimodular. Induction diagonalizes $h$ with all diagonal entries in $cal(D)_0^times$.
  Every such unit is a norm from $cal(D)^times$. The residue norm $k^times arrow.r k_0^times$ is surjective. After lifting a residue preimage, improve a norm congruence modulo $2^n$ to one modulo $2^(n + 1)$ using
  $ N_(cal(D) \/ cal(D)_0) \( 1 + 2^n z \) equiv 1 + 2^n "Tr"_(cal(D) \/ cal(D)_0) \( z \) med \( mod med 2^(n + 1) \) \, #h(2em) n gt.eq 1 . $
  The trace modulo $2$ is surjective, so the needed $z$ always exists. The corrections converge. Rescaling each diagonal vector therefore makes every diagonal entry $1$. The ranks of the $M_i$ depend only on the operator module, so this proves uniqueness on every fixed factor and completes the proof. ◻
]

=== 4.3 Rational descent <rational-descent>

Although neither $T_j$ has eigenvalue $1$, its tensor square can: an eigenvalue and its inverse have product $1$. The rational argument must therefore include an ordinary quadratic-form component at eigenvalue $1$, as well as the hermitian components for nonreal eigenvalues. The odd order still excludes $- 1$.

We shall use Hasse–Minkowski in the form stated in Theorem 7. The passage from quadratic forms to hermitian forms needed here has an elementary proof.

#thm([Lemma 4.5.])[
  (Hermitian forms from their lengths).  #emph[Let $E \/ F$ be a quadratic field extension with $"char" F eq.not 2$, and let $h_1 \, h_2$ be nonsingular hermitian forms. If the quadratic forms 
$ Q_(h_j) \( x \) = h_j \( x \, x \) $

 on the underlying $F$-spaces are isometric, then $h_1 \, h_2$ are $E$-linearly isometric.]
] <local:hermitian-lengths>

#proof[
  The polar pairing of $Q_h$ is $1 / 2 "Tr"_(E \/ F) h \( x \, y \)$. If it annihilates $x$, testing scalar multiples of $y$ and using the nondegenerate trace pairing shows $h \( x \, y \) = 0$ for every $y$. Thus $Q_h$ is nonsingular. In particular a nonzero hermitian space contains a vector of nonzero length, and such a vector splits off an orthogonal hermitian line.
  The quadratic cancellation used below is the reflection argument underlying Witt cancellation #cite(label("Witt1937")); we include the needed form of it. For a quadratic form $Q$ with polar form $b$ and a vector $z$ of nonzero length, the reflection
  $ rho_z \( v \) = v - frac(2 b \( v \, z \), Q \( z \)) z $
  is an isometry, as direct expansion shows. If $Q \( x \) = Q \( e \) = a eq.not 0$, then $Q \( x - e \) + Q \( x + e \) = 4 a$. If $Q \( x - e \) eq.not 0$, the reflection in $x - e$ sends $x$ to $e$. Otherwise reflection in $x + e$ sends $x$ to $- e$, and reflection in $e$ sends $- e$ to $e$. It follows that an isometry $chevron.l a chevron.r perp V tilde.equiv chevron.l a chevron.r perp W$ can be adjusted to match the two displayed vectors, and then restricts to an isometry $V tilde.equiv W$.
  Now write $E = F \( sqrt(d) \)$. Choose $x$ of hermitian length $a eq.not 0$ for $h_1$, and let $y$ be its image under an isometry of the length quadratic forms. The lines $E x$ and $E y$ are hermitian isometric, and their length quadratic forms are both
  $ a N_(E \/ F) = chevron.l a \, - a d chevron.r . $
  Split these hermitian lines off. Cancel the two nonzero quadratic lines $chevron.l a chevron.r$ and $chevron.l - a d chevron.r$ successively by the preceding reflection argument. The complementary hermitian forms again have isometric length forms. Induction on their $E$-dimension proves the lemma. ◻
]

#thm([Lemma 4.6.])[
  (Equivariant rational local–global principle).  #emph[Let $\( V_j \, U_j \, beta_j \)$ be rational vector spaces with nonsingular symmetric forms preserved by operators of finite odd order. If they are equivariantly isometric over $bb(R)$ and over $bb(Q)_ell$ for every prime $ell$, then they are equivariantly isometric over $bb(Q)$.]
] <local:hasse-descent>

#proof[
  Take a common odd exponent for the operators. The cyclotomic decomposition of each $V_j$ is orthogonal: its idempotents are unchanged under $U_j mapsto U_j^(- 1)$, which is the adjoint involution. Each equivariant local isometry respects these decompositions, and corresponding component dimensions agree.
  The eigenvalue-$1$ component carries an ordinary rational symmetric form. Its local isometries give a rational isometry by Theorem 7. Odd order excludes eigenvalue $- 1$. For any remaining cyclotomic component put
  $ E = bb(Q) \( zeta_d \) \, #h(2em) F = bb(Q) \( zeta_d + zeta_d^(- 1) \) \, #h(2em) d > 1 . $
  The component is an $E$-vector space, with $U_j$ acting by $zeta_d$. Complex conjugation $sigma$ is a nontrivial involution of $E$. The same trace construction as (4.2), now over $bb(Q)$, gives a unique nonsingular $E \/ F$-hermitian form $h_j$ satisfying
  $ "Tr"_(E \/ bb(Q)) #scale(x: 120%, y: 120%)[\(] a h_j \( x \, y \) #scale(x: 120%, y: 120%)[\)] = beta_j \( a x \, y \) #h(2em) \( a in E \) . $
  An equivariant isometry over a rational completion is linear over the corresponding algebra $E ⊗_(bb(Q)) bb(Q)_ell$, or over $E ⊗_(bb(Q)) bb(R)$, and preserves the trace identity. Nondegeneracy of the extended trace pairing therefore makes it an isometry of the extended hermitian forms. Decomposing $F ⊗_(bb(Q)) bb(Q)_ell$ into its completion factors supplies an isometry at every place of $F$ above $ell$; decomposing $F ⊗_(bb(Q)) bb(R)$ supplies every archimedean place. This also covers finite places where $E \/ F$ splits, since the trace pairing of the resulting quadratic étale algebra is still nondegenerate.
  Consequently the nonsingular quadratic length forms $Q_(h_1)$ and $Q_(h_2)$ are isometric over every completion of $F$. Hasse–Minkowski over $F$ gives a global quadratic isometry #cite(label("Milne2022")) Theorem 25.64(c). Lemma 18 upgrades its existence to an $E$-linear hermitian isometry. Such an isometry preserves the rational symmetric form and intertwines $U_j$. Combining the cyclotomic components proves the claim. ◻
]

#thm([Proposition 4.7.])[
  (Local and rational square isometries).  #emph[ Set 
$ A_j = \( L_j \, T_j \, B_j \)^(⊗ 2) . $

 There are an equivariant rational isometry $R : A_1 ⊗ bb(Q) arrow.r A_2 ⊗ bb(Q)$ and, for every prime $ell$, an equivariant isometry $D_ell : A_1 ⊗ bb(Z)_ell arrow.r A_2 ⊗ bb(Z)_ell$. These can be chosen so that $D_ell = R$ after extension to $bb(Q)_ell$ for all but finitely many primes.]
] <local:rational>

#proof[
  Use the integral operator-module isomorphism of Corollary 13 to transport the two forms to a common module with a common operator. Proposition 16 gives the required square isometry at each odd prime. Proposition 17 applies at $2$, because the prepared operators have odd order and no eigenvalue $1$; tensor its isometry with itself. Lemma 14 supplies the real isometry, which also tensors. Lemma 19 now gives $R$. Finally, the matrices of $R$ and $R^(- 1)$ in integral lattice bases have denominators supported at finitely many primes. At every other prime $R$ itself is an integral lattice isometry, so choose $D_ell = R$ there. ◻
]

== 5 From local isometries to an integral isometry <global:section>

We now turn the local and rational isometries of Proposition 20 into one integral isometry, after two further operations. A second tensor square removes all eigenspace determinants from the discrepancy between the local and rational maps. Two common polynomial summands then put the relevant isometry groups within the scope of strong approximation.

Write the tensor-square data as

$ A_j = \( M_j \, tau_j \, b_j \) = \( L_j^(⊗ 2) \, T_j^(⊗ 2) \, B_j^(⊗ 2) \) . $

Fix the equivariant rational isometry $R : A_1 arrow.r A_2$ and the equivariant local lattice isometries $D_ell$ supplied by Proposition 20, with $D_ell = R$ for all but finitely many primes $ell$.

=== 5.1 Cancelling the determinant on each eigenspace <cancelling-the-determinant-on-each-eigenspace>

The ratio $R^(- 1) D_ell$ preserves $b_1$ and commutes with $tau_1$ over $bb(Q)_ell$, but need not have determinant one on each eigenspace. To cancel these determinants by a second tensor square, we use complex conjugation on the real-coefficient polynomials $q_j$. Recall that their common ambient dimension $s$ is even and that $B_j = S_j T_j^r$.

#thm([Lemma 5.1.])[
  (Integral reversers).  #emph[There is an integral involution $C_j$ of $L_j$ such that 
$ C_j^(- 1) T_j C_j = T_j^(- 1) \, #h(2em) C_j^(sans(t)) B_j C_j = B_j . $

]
] <local:reverser>

#proof[
  Complex conjugation preserves the argument-zero Milnor page and exchanges its positive and negative normal directions; let $C_j$ be its action on middle homology. We check the sign directly in the linking definition of the Seifert form #cite(label("Milnor1968")). The ambient sphere has dimension $2 s - 1$, and the cycles have dimension $s - 1$. Complex conjugation has degree $\( - 1 \)^s = 1$ on that sphere, and interchanging the two linking cycles has sign $\( - 1 \)^(s^2) = 1$. If $y^(+)$ and $y^(-)$ denote the two push-offs, then
  $ S_j \( C_j x \, C_j y \) & = "lk" \( x \, y^(-) \) = "lk" \( y^(-) \, x \)\
 & = "lk" \( y \, x^(+) \) = S_j \( y \, x \) . $
  The third equality moves both cycles along the page-normal flow. Thus $C_j^(sans(t)) S_j C_j = S_j^(sans(t))$. Taking the monodromy of this congruence gives $C_j^(- 1) T_j C_j = T_j^(- 1)$, and then
  $ C_j^(sans(t)) B_j C_j = S_j^(sans(t)) T_j^(- r) = S_j T_j^(1 - r) = B_j . $
  The map on oriented cycles already includes conjugation’s effect on page orientation; the calculation uses the orientation of the ambient sphere for linking. ◻
]

Tensoring gives an integral isometry $C_j^(\( 2 \)) = C_j ⊗ C_j$ of $b_j$ that reverses $tau_j$. On the fourth tensor powers of the original data define

#[#set math.equation(numbering: n => "(5.1)")
 $ hat(R) = R ⊗ #scale(x: 120%, y: 120%)[\(] C_2^(\( 2 \)) R \( C_1^(\( 2 \)) \)^(- 1) #scale(x: 120%, y: 120%)[\)] \, #h(2em) hat(D)_ell = D_ell ⊗ #scale(x: 120%, y: 120%)[\(] C_2^(\( 2 \)) D_ell \( C_1^(\( 2 \)) \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <global:corrected-maps>]

Both second factors intertwine the operators: each conjugating map reverses its operator, and $R$ and $D_ell$ intertwine them. They also preserve the forms. Consequently $hat(R)$ is a rational equivariant isometry, and $hat(D)_ell$ is an equivariant isometry of the fourth-power lattices over $bb(Z)_ell$.

#thm([Lemma 5.2.])[
  (Eigenspace determinant cancellation).  #emph[For every prime $ell$, the ratio $hat(R)^(- 1) hat(D)_ell$ has determinant $1$ on every eigenspace of $tau_1 ⊗ tau_1$ over $overline(bb(Q)_ell)$. This remains true after tensoring both maps with identity maps on any common finite-order operator data.]
] <global:determinants>

#proof[
  Put $a = R^(- 1) D_ell$ and $C = C_1^(\( 2 \))$. Multiplying the two maps in (5.1) gives the exact identity
  #[#set math.equation(numbering: n => "(5.2)")
   $ hat(R)^(- 1) hat(D)_ell = a ⊗ C a C^(- 1) . $ <global:ratio>]
  In particular, no compatibility of $R$ with the reversers is required.
  Let $W_gamma$ be the $gamma$-eigenspace of $tau_1$ over $overline(bb(Q)_ell)$, and set
  $ m_gamma = dim W_gamma \, #h(2em) t_gamma = det \( a \|_(W_gamma) \) . $
  Invariance and nondegeneracy of $b_1$ give a perfect pairing between $W_gamma$ and $W_(gamma^(- 1))$. Since $a$ is an isometry,
  #[#set math.equation(numbering: n => "(5.3)")
   $ m_(gamma^(- 1)) = m_gamma \, #h(2em) t_(gamma^(- 1)) = t_gamma^(- 1) . $ <global:inverse-determinants>]
  For $gamma = 1$, this says $t_1^2 = 1$; no choice of its sign is needed. The reverser carries $W_(eta^(- 1))$ onto $W_eta$, so the determinant of $C a C^(- 1)$ on $W_eta$ is $t_(eta^(- 1))$.
  For each $lambda$, its entire eigenspace in the tensor square is
  $ xor.big_(gamma eta = lambda) W_gamma ⊗ W_eta \, $
  where the sum ranges over all ordered pairs of occurring eigenvalues. By the determinant formula for a tensor product, the determinant of (5.2) on this space is
  $ product_(gamma eta = lambda) t_gamma^(m_eta) t_(eta^(- 1))^(m_gamma) & = frac(product_(gamma eta = lambda) t_gamma^(m_eta), product_(gamma eta = lambda) t_eta^(m_gamma)) = 1 . $
  The last equality exchanges $gamma$ and $eta$ in the denominator. It includes diagonal pairs and all coincidences among product eigenvalues. Finally, tensoring with an identity gives, on each new eigenspace, a product of powers of the already unit determinants. ◻
]

=== 5.2 Two common summands <two-common-summands>

Use new disjoint variables to form

#[#set math.equation(numbering: n => "(5.4)")
 $ u = z_1^3 + dots.h.c + z_6^3 \, #h(2em) v = z_7^11 + z_8^13 . $ <global:common-polynomials>]

Both have an even number of variables and odd-order monodromy. Denote their symmetric-form and operator data by $cal(U)$ and $cal(V)$, and put

#[#set math.equation(numbering: n => "(5.5)")
 $ H_j = \( Lambda_j \, Theta_j \, beta_j \) = A_j^(⊗ 2) ⊗ cal(U) ⊗ cal(V) . $ <global:final-data>]

Extend the maps in (5.1) by the identity on these two common factors, keeping the notation $hat(R)$ and $hat(D)_ell$.

The six cubes will make each eigenspace form indefinite. The degrees $11$ and $13$ exclude real eigenvalues from the final operator, even though the preceding tensor squares may have acquired eigenvalue $1$. These two primes also enter the later proof that the links are homotopy spheres in Lemma 27.

#thm([Lemma 5.3.])[
  (Spectral properties of the added factors).  #emph[Every eigenvalue of $Theta_j$ has odd order divisible by both $11$ and $13$. On every complex eigenspace, the hermitian form 
$ \( x \, y \) mapsto beta_j \( x \, overline(y) \) $

 is nondegenerate and indefinite; the complex dimension of that eigenspace is at least $21$.]
] <global:indefinite>

#proof[
  Before adjoining $cal(V)$, the operator order divides $3^a dot.op 5 dot.op 7$ for some $a$. The eigenvalues of $v$ are
  $ zeta_11^b zeta_13^c \, #h(2em) 1 lt.eq b lt.eq 10 \, quad 1 lt.eq c lt.eq 12 . $
  Their nontrivial $11$- and $13$-primary components cannot cancel against an eigenvalue of the earlier tensor factors. Thus every final order contains both primes and remains odd. In particular, neither $1$ nor $- 1$ is a final eigenvalue.
  We calculate the signatures supplied by $u$. Let
  $ A = mat(delim: "(", 1, - 1; 0, 1) . $
  In the convention of Theorem 3, a one-cube Seifert matrix is $S_c = - A$ #cite(label("Sakamoto1974")) Corollary 3. Its chosen monodromy is
  $ t = - A^(- 1) A^(sans(t)) = mat(delim: "(", 0, - 1; 1, - 1) . $
  Here the minus sign is the one-variable convention. The form
  $ J = A t^2 = mat(delim: "(", 0, 1; - 1, 0) $
  is alternating and $t$-invariant. Iterating Theorem 3 gives $S_u = \( - 1 \)^15 \( - A \)^(⊗ 6) = - A^(⊗ 6)$. The sixfold monodromy is $t^(⊗ 6)$, and $2 dot.op 2 equiv 1 med \( mod med 3 \)$, so its symmetric form is
  $ B_u = S_u \( t^(⊗ 6) \)^2 = - J^(⊗ 6) . $
  We compute the signatures of $J^(⊗ 6)$ below; passing to $B_u$ reverses every sign.
  Set $omega = e^(2 pi i \/ 3)$ and $e_(+) = \( 1 \, - omega \)$, $e_(-) = \( 1 \, - omega^2 \)$. These are eigenvectors of $t$ with eigenvalues $omega$ and $omega^2$, respectively, and
  $ J \( e_(+) \, overline(e_(+)) \) = i sqrt(3) \, #h(2em) J \( e_(-) \, overline(e_(-)) \) = - i sqrt(3) \, #h(2em) J \( e_(+) \, overline(e_(-)) \) = 0 . $
  In the resulting orthogonal tensor basis, a vector with $k$ copies of $e_(+)$ has eigenvalue $omega^(- k)$ and length $27 \( - 1 \)^(k + 1)$; there are $binom(6, k)$ such vectors. We obtain the following signatures, up to reversal of every sign:
  $ upright("eigenvalue") & k & upright("signature") & upright("dimension")\
1 & 0 \, 3 \, 6 & \( 20 \, 2 \) & 22\
omega & 2 \, 5 & \( 6 \, 15 \) & 21\
omega^2 & 1 \, 4 & \( 6 \, 15 \) & 21 $
  Every eigenspace of this common factor is therefore indefinite.
  For any real nondegenerate symmetric form $b$ invariant under a finite-order operator, its complex bilinear extension pairs the $gamma$-eigenspace perfectly with the $gamma^(- 1)$-eigenspace. Consequently $b \( x \, overline(y) \)$ restricts to a nondegenerate hermitian form on each eigenspace. Distinct eigenspaces are orthogonal for this hermitian form.
  Apply this observation to each of the three factors in (5.5). A final eigenspace is the orthogonal direct sum of the tensor products of factor eigenspaces whose eigenvalues have the prescribed product. Each nonzero summand contains one of the indefinite spaces in the table. Diagonalizing the other two hermitian forms shows that its tensor form has both signs: multiply any nonzero diagonal entry from the other factors by a positive and a negative entry from the six-cube factor. Every summand is thus indefinite and has dimension at least $21$. The same conclusions hold for their orthogonal direct sum. ◻
]

=== 5.3 The special unitary group and strong approximation <the-special-unitary-group-and-strong-approximation>

#thm([Proposition 5.4.])[
  (Integral equivariant isometry).  #emph[The triples $H_1$ and $H_2$ in (5.5) are isometric over $bb(Z)$: there is a lattice isomorphism $U : Lambda_1 arrow.r Lambda_2$ satisfying 
$ U Theta_1 = Theta_2 U \, #h(2em) U^(sans(t)) beta_2 U = beta_1 . $

]
] <global:integral>

#proof[
  Put $V = Lambda_1 ⊗ bb(Q)$. Since $Theta_1$ has finite order, its minimal polynomial is a product of distinct cyclotomic polynomials. Decompose the rational operator space as
  $ V = xor.big_(d in cal(D)) V_d \, #h(2em) E_d = bb(Q) \( zeta_d \) \, quad F_d = bb(Q) \( zeta_d + zeta_d^(- 1) \) \, quad n_d = dim_(E_d) V_d . $
  The action of $Theta_1$ gives $V_d$ its $E_d$-vector space structure. Distinct $V_d$ are orthogonal for $beta_1$. By Lemma 23, all $d$ are odd and divisible by $11 dot.op 13$, so $E_d \/ F_d$ is quadratic with nontrivial conjugation. The adjoint of multiplication by $a in E_d$ is multiplication by $overline(a)$, because the adjoint of $Theta_1$ is $Theta_1^(- 1)$.
  For completeness, the nondegenerate trace pairing of $E_d \/ bb(Q)$ defines a unique $E_d$-valued form $h_d$ by
  $ "Tr"_(E_d \/ bb(Q)) #scale(x: 120%, y: 120%)[\(] a h_d \( x \, y \) #scale(x: 120%, y: 120%)[\)] = beta_1 \( a x \, y \) quad \( a in E_d \) . $
  This form is linear in its first argument, conjugate-linear in its second, and satisfies $h_d \( y \, x \) = overline(h_d \( x \, y \))$. These identities follow by testing against every $a$ in the displayed trace equation. The same equation proves its nondegeneracy. It also shows that an $E_d$-linear map preserves $beta_1$ exactly when it preserves $h_d$.
  Let $G$ be the algebraic $bb(Q)$-group of equivariant self-isometries of $\( V \, Theta_1 \, beta_1 \)$ with determinant $1$ on every eigenspace over an algebraic closure. These conditions are defined over $bb(Q)$. The preceding description identifies this algebraic group as
  #[#set math.equation(numbering: n => "(5.6)")
   $ G = product_(d in cal(D)) "Res"_(F_d \/ bb(Q)) "SU" \( h_d \) . $ <global:unitary-group>]
  Indeed, commuting with $Theta_1$ is exactly $E_d$-linearity on each $V_d$. Each embedding of $E_d$ into an algebraic closure gives one $Theta_1$-eigenspace, and the determinant on it is the corresponding image of the $E_d$-determinant. Requiring all these determinants to be $1$ gives precisely $"SU" \( h_d \)$. In particular this requirement removes the unitary determinant tori, and the absence of eigenvalues $plus.minus 1$ leaves no orthogonal factor.
  Every embedding $F_d arrow.r.hook bb(R)$ extends to a conjugate pair of embeddings of $E_d$ into $bb(C)$. At this real place the trace identity writes the underlying real form as $2 "Re" h_d$. After complexification, its pairing $\( x \, y \) mapsto beta_1 \( x \, overline(y) \)$ on either corresponding operator eigenspace is the associated complex hermitian form. Lemma 23 therefore makes it indefinite, and $n_d gt.eq 21$. The group $"SU" \( h_d \)$ is connected, simply connected, and absolutely almost simple over $F_d$, since over an algebraic closure it becomes $upright("SL")_(n_d)$ #cite(label("Milne2022")) Theorem 24.44, Remark 24.46, and Summary 24.66. At each real place it is a noncompact group $"SU" \( p \, q \)$ with $p \, q > 0$.
  Theorem 8, applied to $"SU" \( h_d \)$ over $F_d$ with all archimedean places omitted, now gives density of $"SU" \( h_d \) \( F_d \)$ in its finite adelic group #cite(label("Platonov1969")) Theorem A, with #cite(label("Platonov1970")); see also #cite(label("Rapinchuk2014")) Theorem 2.3. Restriction of scalars and the finite product in (5.6) therefore give
  #[#set math.equation(numbering: n => "(5.7)")
   $ overline(G \( bb(Q) \)) = G \( bb(A)_(bb(Q) \, f) \) . $ <global:density>]
  Here finite adeles mean the restricted product over all finite places. No isotropy over the number field itself is being assumed; the required noncompactness is supplied at the real places just checked.
  We spell out how (5.7) gives an integral map. For each prime set
  $ a_ell = hat(R)^(- 1) hat(D)_ell \, #h(2em) Lambda_(j \, ell) = Lambda_j ⊗ bb(Z)_ell . $
  Lemma 22 gives $a_ell in G \( bb(Q)_ell \)$, and $a_ell = 1$ for all but finitely many $ell$. Thus $a = \( a_ell \)$ is a finite adelic point. Define
  $ K_ell = { g in G \( bb(Q)_ell \) : g Lambda_(1 \, ell) = Lambda_(1 \, ell) } \, #h(2em) K = product_ell K_ell . $
  In a basis of the actual lattice $Lambda_1$, the subgroup $K_ell$ is $G \( bb(Q)_ell \) ∩ "GL"_("rank" Lambda_1) \( bb(Z)_ell \)$. It is compact and open in $G \( bb(Q)_ell \)$. To identify their product with an adelic open subgroup, take the schematic closure of $G$ in $"GL" \( Lambda_1 \)$ over $bb(Z)$. After inverting finitely many primes this is an integral model of the same affine group, and its $bb(Z)_ell$-points are exactly $K_ell$. Thus the $K_ell$ agree with the reference integral subgroups defining the restricted product at all but finitely many primes. Their product $K$ is consequently compact and open in $G \( bb(A)_(bb(Q) \, f) \)$. This definition uses the full lattice and requires no integral splitting of its cyclotomic components.
  By (5.7), the nonempty open coset $a K$ contains a point $g in G \( bb(Q) \)$. For every prime we can write $g = a_ell k_ell$ with $k_ell in K_ell$, and hence
  $ \( hat(R) g \) \( Lambda_(1 \, ell) \) = hat(R) a_ell \( Lambda_(1 \, ell) \) = hat(D)_ell \( Lambda_(1 \, ell) \) = Lambda_(2 \, ell) . $
  A full integral lattice satisfies
  $ Lambda_j = { x in Lambda_j ⊗ bb(Q) : x in Lambda_(j \, ell) upright(" for every prime ") ell } : $
  in a lattice basis this is the elementary identity $bb(Q) ∩ ⋂_ell bb(Z)_ell = bb(Z)$. Applying this characterization to $hat(R) g$ and its inverse shows that $U = hat(R) g$ carries $Lambda_1$ onto $Lambda_2$. It is an equivariant isometry because both factors are such isometries, which proves the proposition. ◻
]

#prodef([Remark 5.5.])[
  An equivariant isometry of the symmetric data recovers an isometry of the original Seifert data. Choose one integer $r$ satisfying $2 r equiv 1$ modulo a common odd exponent of the final operators. If $S'_j = beta_j Theta_j^(- r)$, then the isomorphism in Proposition 24 satisfies
  $ U^(sans(t)) S'_2 U = U^(sans(t)) beta_2 U Theta_1^(- r) = beta_1 Theta_1^(- r) = S'_1 . $
  The tensor-product convention can multiply both final forms by the same sign, which does not alter this identity.
] <global:recover-seifert>

== 6 From the integral forms to the ambient germs <topo:section>

We now turn the integral isometry of Proposition 24 into an equivalence of hypersurface germs. The two extra prime-power summands introduced there also ensure that the links are homotopy spheres. This permits a direct application of the spherical knot classification in Theorem 9.

=== 6.1 The final polynomials and their Seifert forms <the-final-polynomials-and-their-seifert-forms>

For $j in { 1 \, 2 }$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ f_j = q_j^(\[ 1 \]) + q_j^(\[ 2 \]) + q_j^(\[ 3 \]) + q_j^(\[ 4 \]) + z_1^3 + dots.h.c + z_6^3 + x^11 + y^13 . $ <topo:polynomials>]

Here $q_j^(\[ a \])$ denotes a copy of $q_j$ in its own set of variables; all the displayed summands use disjoint variable sets. Since $q_j$ has $s_0 + 2$ variables and $s_0$ is even, the common number of variables is

#[#set math.equation(numbering: n => "(6.2)")
 $ N = 4 \( s_0 + 2 \) + 6 + 2 = 4 s_0 + 16 equiv 0 med \( mod med 8 \) . $ <topo:dimension>]

In particular, $N > 3$. The weights of the summands, each normalized to weighted degree one, give positive weights for $f_j$.

Write $\( L_j^(upright(f)) \, T_j^(upright(f)) \, S_j^(upright(f)) \)$ for the Milnor lattice, chosen monodromy operator, and integral Seifert form of $f_j$, with $T_j^(upright(f)) = \( S_j^(upright(f)) \)^(- 1) \( S_j^(upright(f)) \)^(sans(t))$. All monodromy orders under consideration are odd. Choose a common odd multiple $m_(upright(f))$ of them and an integer $r$ with $2 r equiv 1 med \( mod med m_(upright(f)) \)$. As $N$ is even, the symmetric form associated with $S_j^(upright(f))$ is

$ B_j^(upright(f)) = S_j^(upright(f)) \( T_j^(upright(f)) \)^r \, #h(2em) S_j^(upright(f)) = B_j^(upright(f)) \( T_j^(upright(f)) \)^(- r) . $

The integral Thom–Sebastiani formula identifies these operator–form data with the data $H_j$ of Proposition 24, up to the same overall sign on the two symmetric forms. Indeed, every factor in (6.1), grouped as four copies of $q_j$, the sum of six cubes, and the sum $x^11 + y^13$, has even ambient complex dimension. Its symmetrization therefore commutes with taking the indicated tensor products, and the Thom–Sebastiani signs depend only on these common dimensions.

Consequently Proposition 24 supplies an integral isomorphism $Psi : L_1^(upright(f)) arrow.r L_2^(upright(f))$ with

$ Psi T_1^(upright(f)) = T_2^(upright(f)) Psi \, #h(2em) Psi^(sans(t)) B_2^(upright(f)) Psi = B_1^(upright(f)) . $

It also preserves the Seifert forms, because

#[#set math.equation(numbering: n => "(6.3)")
 $ Psi^(sans(t)) S_2^(upright(f)) Psi = Psi^(sans(t)) B_2^(upright(f)) \( T_2^(upright(f)) \)^(- r) Psi = B_1^(upright(f)) \( T_1^(upright(f)) \)^(- r) = S_1^(upright(f)) . $ <topo:seifert>]

This is a simultaneous integral isometry, which is precisely the information needed for the topological step.

#thm([Lemma 6.1.])[
  #emph[The polynomials $f_1 \, f_2$ have isolated critical points at the origin, are reduced both as polynomials and as analytic germs, and satisfy ${ "ord"_0 \( f_1 \) \, "ord"_0 \( f_2 \) } = { 2 \, 3 }$.]
] <topo:analytic>

#proof[
  The first nonzero-coordinate argument in Lemma 11 shows that each chain has no critical point anywhere in its affine space except the origin. The gradient equations of a sum in disjoint variables separate into the gradient equations of its summands. The pure powers have the same global property. Consequently the only critical point of each $q_j$, and then of each $f_j$, is the origin. The orders of $q_1 \, q_2$ are two and three. Disjoint copies have no monomials that could cancel one another, and all added terms have degree at least three. The claimed orders follow. More precisely, the $4 E$ balancing squares in each copy of $p_1$ are the only quadratic terms. Four copies give Hessian ranks $16 E$ for $f_1$ and $0$ for $f_2$, so both ranks are even.
  If an irreducible nonunit analytic germ $a$ occurred with multiplicity at least two in $f_j$, we could write $f_j = a^2 b$. Every first derivative of $f_j$ would then vanish on $V \( a \)$. A nonunit hypersurface germ in $bb(C)^N$ has dimension $N - 1 > 0$, contradicting the isolated critical point. Thus $f_j$ is reduced as an analytic germ. The same argument for a repeated nonconstant polynomial factor would force the gradient to vanish on its positive-dimensional affine zero set. The global critical-locus statement just proved excludes this as well, so $f_j$ is reduced as a polynomial. ◻
]

=== 6.2 Spherical links and their embedded equivalence <spherical-links-and-their-embedded-equivalence>

Let

$ K_j = V \( f_j \) ∩ S_epsilon^(2 N - 1) \, #h(2em) X_j = S_epsilon^(2 N - 1) \\ K_j \, #h(2em) n = N - 1 \, $

where $epsilon > 0$ is sufficiently small for both polynomials. The binding $K_j$ is a smooth closed manifold of dimension $2 n - 1$. Let $F_j$ be a compact Milnor page, so the fiber of $X_j arrow.r S^1$ is $"int" F_j$. The inclusion of this interior into $F_j$ is a homotopy equivalence, and both have the homotopy type of a bouquet of $n$-spheres. Moreover $K_j$ is $\( n - 2 \)$-connected by Theorem 2 #cite(label("Milnor1968")).

#thm([Lemma 6.2.])[
  #emph[Each $K_j$ is a homotopy sphere, and each embedding $K_j subset S_epsilon^(2 n + 1)$ is a simple knot.]
] <topo:sphere>

#proof[
  Every eigenvalue of $T_j^(upright(f))$ has the form
  $ xi zeta_11^a zeta_13^b \, #h(2em) 1 lt.eq a lt.eq 10 \, quad 1 lt.eq b lt.eq 12 \, $
  where the order of $xi$ divides $3^A dot.op 5 dot.op 7$ for some integer $A gt.eq 1$. The factors of orders $11$ and $13$ cannot cancel against each other or against $xi$. Thus every eigenvalue has order divisible by both $11$ and $13$.
  Since $T_j^(upright(f))$ is integral and has finite order, its characteristic polynomial is a product of cyclotomic polynomials $Phi_d$, with every occurring index $d$ divisible by $143$. For $d > 1$, the elementary identity
  $ Phi_d \( 1 \) = cases(delim: "{", p \, & d upright(" is a power of the prime ") p \,, 1 \, & d upright(" has at least two distinct prime factors")) $
  follows by induction from $d = product_(e divides d \, med e > 1) Phi_e \( 1 \)$: the prime-power divisors already contribute the full prime factorization of $d$ when $d$ is not a prime power. Hence
  #[#set math.equation(numbering: n => "(6.4)")
   $ det \( 1 - T_j^(upright(f)) \) = 1 . $ <topo:determinant>]
  In particular, $1 - T_j^(upright(f))$ is an automorphism of the integral middle homology of $F_j$.
  The geometric monodromy acts as $\( T_j^(upright(f)) \)^(- 1)$ in our convention. The identity $1 - \( T_j^(upright(f)) \)^(- 1) = - \( T_j^(upright(f)) \)^(- 1) \( 1 - T_j^(upright(f)) \)$ shows that its difference from the identity is also invertible over $bb(Z)$. The Wang exact sequence of the Milnor fibration now gives
  $ H_i \( X_j \; bb(Z) \) = cases(delim: "{", bb(Z) \, & i = 0 \, 1 \,, 0 \, & i gt.eq 2 .) $
  Indeed, the only possible additional groups are, equivalently, the kernel and cokernel of $1 - T_j^(upright(f))$ on $H_n \( F_j \; bb(Z) \)$, and both vanish by (6.4). Alexander duality #cite(label("Hatcher2002")) Corollary 3.45 therefore makes $K_j$ an integral homology $\( 2 n - 1 \)$-sphere. Its $\( n - 2 \)$-connectivity makes it simply connected. The Hurewicz and Whitehead Theorems #cite(label("Hatcher2002")) Theorem 4.32 and Corollary 4.33 show that it is a homotopy sphere. Since $2 n - 1 gt.eq 5$, the high-dimensional Poincaré theorem included in Theorem 9 makes it homeomorphic to $S^(2 n - 1)$.
  Finally, the homotopy exact sequence of $"int" F_j arrow.r X_j arrow.r S^1$, together with the $\( n - 1 \)$-connectivity of $"int" F_j$, gives
  $ pi_1 \( X_j \) tilde.equiv bb(Z) \, #h(2em) pi_i \( X_j \) = 0 quad \( 2 lt.eq i lt.eq n - 1 \) . $
  This is the simplicity condition for a $\( 2 n - 1 \)$-knot. ◻
]

Orient the links and their Seifert surfaces by the Milnor fibration, using the same positive push-off convention on both sides. By (6.3), their integral Seifert matrices are congruent. Since $n gt.eq 3$, Levine’s classification of simple spherical knots #cite(label("Levine1970")) Theorem 3, in the form of Theorem 9, yields an isotopy of the embedded links. Smooth isotopy extension then gives an orientation-preserving diffeomorphism of pairs

#[#set math.equation(numbering: n => "(6.5)")
 $ phi.alt : \( S_epsilon^(2 N - 1) \, K_1 \) arrow.r \( S_epsilon^(2 N - 1) \, K_2 \) . $ <topo:link-equivalence>]

Levine’s definition allows smooth homotopy spheres that are not standard smooth spheres. Thus no standard-smooth-sphere assertion is needed here. Nor is an extra framing hypothesis needed: the classification is for these oriented embedded knots with their Seifert forms. The same implication is part of the classification of high-dimensional simple fibered links #cite(label("Durfee1974")) #cite(label("Saeki1999")); see also #cite(label("Neumann2017")).

=== 6.3 An explicit homeomorphism of ambient germs <an-explicit-homeomorphism-of-ambient-germs>

We finish by spelling out the passage from the sphere to an ambient neighborhood of the origin. For a positive weight vector $w = \( w_1 \, dots.h \, w_N \)$, define

$ a_w \( t \, x \) = \( t^(w_1) x_1 \, dots.h \, t^(w_N) x_N \) \, #h(2em) t > 0 . $

For each nonzero $x$, the function $t mapsto parallel a_w \( t \, x \) parallel^2 = sum_i t^(2 w_i) \| x_i \|^2$ is strictly increasing, with limits zero and infinity at the two ends of $\( 0 \, oo \)$. Each nonzero weighted orbit therefore meets $S_epsilon^(2 N - 1)$ in exactly one point. Consequently

#[#set math.equation(numbering: n => "(6.6)")
 $ A_w : C \( S_epsilon^(2 N - 1) \) arrow.r overline(B)_epsilon^(2 N) \, #h(2em) \[ x \, t \] mapsto a_w \( t \, x \) \, quad 0 lt.eq t lt.eq 1 \, $ <topo:weighted-cone>]

is a continuous bijection, where all points $\( x \, 0 \)$ are identified and their image is zero. The uniform bound $parallel a_w \( t \, x \) parallel lt.eq epsilon t^(min_i w_i)$ proves continuity at the cone vertex. The domain is compact and the target Hausdorff, so $A_w$ is a homeomorphism.

Let $w^(\( j \))$ be the weight vector of $f_j$. Weighted homogeneity gives

$ f_j \( a_(w^(\( j \))) \( t \, x \) \) = t f_j \( x \) . $

Thus $A_(w^(\( j \)))$ identifies the cone on $K_j$ with $V \( f_j \) ∩ overline(B)_epsilon^(2 N)$. Extend the map in (6.5) by

#[#set math.equation(numbering: n => "(6.7)")
 $ h \( 0 \) = 0 \, #h(2em) h #scale(x: 120%, y: 120%)[\(] a_(w^(\( 1 \))) \( t \, x \) #scale(x: 120%, y: 120%)[\)] = a_(w^(\( 2 \))) \( t \, phi.alt \( x \) \) quad \( 0 < t lt.eq 1 \) . $ <topo:ambient-map>]

Equivalently, $h = A_(w^(\( 2 \))) compose C \( phi.alt \) compose A_(w^(\( 1 \)))^(- 1)$, so $h$ is an ambient ball homeomorphism carrying the first hypersurface to the second. It preserves the ball boundary; restricting to the ball interiors gives the required homeomorphism germ of ambient pairs.

Together with Lemma 26, this proves Theorem 1: the reduced hypersurface germs in (6.1) are ambiently homeomorphic and have multiplicities two and three.

=== 6.4 Consequences for function germs and initial forms <topo:consequences>

The same pair has unequal Hessian coranks, as the balancing squares already show. Its real coefficients also allow us to strengthen the ambient equivalence to topological right equivalence. We then use that stronger equivalence to compare initial forms after adding one common square in a new variable.

#thm([Corollary 6.3.])[
  (Negative answer to Arnold’s corank problem).  #emph[In the finite ambient dimension $N > 3$ divisible by eight in (6.2), the polynomials $f_1 \, f_2$ in (6.1) have different Hessian coranks, although their reduced complex hypersurface germs are ambiently homeomorphic. Both polynomials have real coefficients, are weighted homogeneous with positive rational weights, and have isolated critical points at the origin.]
] <topo:arnold-corank>

#proof[
  Theorem 1 supplies the ambient homeomorphism and the stated analytic properties. The calculation in the proof of Lemma 26 gives complex Hessian ranks $16 E$ for $f_1$ and $0$ for $f_2$. Since $E > 0$ by Lemma 10, their coranks satisfy
  $ "corank"_0 \( f_1 \) = N - 16 E < N = "corank"_0 \( f_2 \) . $
  ◻
]

#thm([Corollary 6.4.])[
  (Right-topological multiplicity and parity counterexamples).  #emph[For the same polynomials $f_1 \, f_2$ and the single finite ambient dimension $N > 3$ divisible by eight in Theorem 1, there is a homeomorphism germ 
$ phi : \( bb(C)^N \, 0 \) arrow.r \( bb(C)^N \, 0 \) #h(2em) upright("such that") #h(2em) f_1 = f_2 compose phi . $

 Nevertheless, their multiplicities are respectively $2$ and $3$. Thus neither multiplicity nor multiplicity modulo two is invariant under topological right equivalence, even for reduced real-coefficient weighted homogeneous holomorphic germs with positive rational weights and isolated critical points at the origin.]
] <topo:right-equivalence>

#proof[
  For holomorphic germs $f \, g : \( bb(C)^n \, 0 \) arrow.r \( bb(C) \, 0 \)$ with $n gt.eq 2$ and isolated critical points at the origin, Saeki’s topological $V$-equivalence is precisely an ambient homeomorphism of their zero-set germs #cite(label("Saeki1989")) Definition 3. Saeki’s Corollary 2 identifies this with topological right-left equivalence #cite(label("Saeki1989")). King’s corollary #cite(label("King1978")), recalled in #cite(label("Saeki1989")) Section 3, p. 28, then gives right equivalence up to conjugation. In the precise source-homeomorphism formulation recorded by Sampaio #cite(label("Sampaio2025Milnor")) proof of Proposition 2.4, there is a homeomorphism germ $phi : \( bb(C)^n \, 0 \) arrow.r \( bb(C)^n \, 0 \)$ such that
  $ f = g compose phi quad upright("or") quad f = \( c_1 compose g compose c_n \) compose phi \, $
  where $c_k \( z_1 \, dots.h \, z_k \) = \( overline(z)_1 \, dots.h \, overline(z)_k \)$. Theorem 1 supplies these hypotheses for $f = f_1$ and $g = f_2$. Writing $f_2 \( z \) = sum_alpha a_alpha z^alpha$ with $a_alpha in bb(R)$, we have
  $ \( c_1 compose f_2 compose c_N \) \( z \) = overline(f_2 \( overline(z) \)) = sum_alpha overline(a_alpha) z^alpha = f_2 \( z \) . $
  Consequently both alternatives give $f_1 = f_2 compose phi$. The multiplicities are $2$ and $3$ by Theorem 1, and these integers are unequal both in $bb(Z)$ and modulo two. ◻
]

The homeomorphism $phi$ furnished by this argument need not coincide with the constructed ambient homeomorphism $h$ in (6.7). The parity conclusion concerns multiplicity; the unequal Hessian coranks above have the same parity.

We now pass to germs in $N + 1$ variables by adding the same square to each polynomial. The product of $phi$ with the identity preserves right equivalence. Both new germs have order two, but their quadratic initial forms have different Milnor fibers. For a polynomial $g$ vanishing at the origin, write $g_(*)$ for its lowest nonzero homogeneous component for ordinary total degree, not the weighted grading used above. We use the global unit fibre $g_(*)^(- 1) \( 1 \)$ as the initial-form Milnor fibre: it has the homotopy type of the local Milnor fibre of $g_(*)$ #cite(label("BudurEtAl2022ContactLoci")) Proposition 1.6 in arXiv v3. This convention retains the full polynomial $g_(*)$, not its square-free reduction.

#thm([Corollary 6.5.])[
  (Initial-form Milnor-fibre counterexamples).  #emph[In the single ambient dimension $N + 1$, put 
$ tilde(f)_j \( z \, t \) = f_j \( z \) + t^2 \, #h(2em) j = 1 \, 2 . $

 The germs $tilde(f)_1 \, tilde(f)_2 : \( bb(C)^(N + 1) \, 0 \) arrow.r \( bb(C) \, 0 \)$ are topologically right equivalent and have isolated critical points at the origin, but 
$ H_0 #scale(x: 120%, y: 120%)[\(] \( tilde(f)_1 \)_(*)^(- 1) \( 1 \) \; bb(Z) #scale(x: 120%, y: 120%)[\)] tilde.equiv bb(Z) \, #h(2em) H_0 #scale(x: 120%, y: 120%)[\(] \( tilde(f)_2 \)_(*)^(- 1) \( 1 \) \; bb(Z) #scale(x: 120%, y: 120%)[\)] tilde.equiv bb(Z)^2 . $

 Thus integral homology of the initial-form Milnor fibre is not invariant under topological right equivalence, already in degree zero. In particular, the initial-form Milnor-fibre homotopy conjecture of Budur, Fernández de Bobadilla, Lê, and Nguyen #cite(label("BudurEtAl2022ContactLoci")) Conjecture 1.7 in arXiv v3 fails.]
] <topo:tangent-milnor>

#proof[
  Apply the quadratic case of Sampaio’s stabilization #cite(label("Sampaio2025Milnor")) proof of Proposition 2.3. For the homeomorphism germ $phi$ in Corollary 29, the product homeomorphism $tilde(phi) \( z \, t \) = \( phi \( z \) \, t \)$ satisfies
  $ tilde(f)_1 = tilde(f)_2 compose tilde(phi) . $
  It also carries the corresponding zero-set germs to one another. Moreover, $nabla tilde(f)_j \( z \, t \) = \( nabla f_j \( z \) \, 2 t \)$, so the critical point remains isolated on each side.
  By the proof of Lemma 26, the quadratic part of $f_1$ is
  $ Q = sum_(alpha = 1)^(16 E) u_alpha^2 $
  in the independent balancing-square coordinates, with $E > 0$, whereas $f_2$ has order three. Hence
  $ \( tilde(f)_1 \)_(*) = Q + t^2 \, #h(2em) \( tilde(f)_2 \)_(*) = t^2 . $
  Their global unit fibres are respectively
  $ {v in bb(C)^(16 E + 1) : sum_(alpha = 1)^(16 E + 1) v_alpha^2 = 1} times bb(C)^(N - 16 E) \, #h(2em) bb(C)^N times { - 1 \, 1 } . $
  The quadric factor is connected. Indeed, writing $v = x + i y$, its equation becomes $\| x \|^2 - \| y \|^2 = 1$ and $x dot.op y = 0$. The map $\( u \, y \) mapsto sqrt(1 + \| y \|^2) thin u + i y$, with $u in S^(16 E)$ and $y perp u$, identifies this quadric with the tangent bundle of the connected sphere $S^(16 E)$. The first unit fibre is therefore connected, whereas the second has exactly two components. This gives the displayed zeroth homology groups and rules out homotopy equivalence. ◻
]

The isolatedness in Corollary 30 concerns the stabilized germs, not their initial forms. In particular, the nonreduced initial form $t^2$ is retained: replacing it by $t$ would change its unit fibre. No reducedness or isolatedness hypothesis on the initial forms is part of the cited homotopy conjecture.

== 7 The finite arithmetic certificate <app:certificate>

The following complete Python program verifies the finite calculation in Lemma 10. It uses only integer arithmetic and the Python standard library. In the dictionaries representing valuation columns, $\( r \, p \)$ denotes the valuation at the prime $p$ of ratio number $r$. The key $\( - 1 \, 0 \)$ represents the appended row of ones. The rank routine performs Gaussian elimination over $bb(F)_1009$, storing one normalized pivot for each leading row. Thus its return value is exactly the rank of the augmented matrix. Separately, $1009$ is prime: none of $2 \, 3 \, 5 \, 7 \, 11 \, 13 \, 17 \, 19 \, 23 \, 29 \, 31$ divides it, and $32^2 > 1009$.

The sieve stores a prime divisor of every integer greater than one. Repeated division therefore computes its prime valuations exactly. The preliminary cutoff and deletion of singly supported columns give the matrix used in the proof; every deleted column receives coefficient zero in the eventual relation. The final assertion is the sole finite calculation needed for existence of the two product identities.

#raw(block: true, lang: "", "")

An explicit alternative relation is supplied in #raw("verification/support/explicit-relation.json"). It has $849$ nonzero integer coefficients, each with at most $140$ decimal digits, and positive coefficient sum. The standard-library program #raw("verification/validation/explicit_relation.py") verifies both product identities by trial division of all six integers in every row, without using the matrix or its rank. It also checks every decreasing-remainder chain and the variable counts in the polynomial construction. This independent witness is supplementary: the rank computation above and the adjugate argument already prove Lemma 10.


#bibliography("refs.bib", style: "ieee", title: [References])
