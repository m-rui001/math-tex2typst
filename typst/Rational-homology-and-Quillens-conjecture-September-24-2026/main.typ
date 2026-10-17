#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 73.7pt, y: 73.7pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Rational homology and Quillen's conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $G$ be a finite group and let $p$ be a prime. The poset $cal(A)_p \( G \)$ consists of its nonidentity elementary abelian $p$-subgroups, ordered by inclusion. Thus each vertex is a subgroup isomorphic to $\( bb(Z) \/ p bb(Z) \)^r$ for some $r gt.eq 1$, and a simplex of its order complex is a strictly increasing chain of such subgroups. Write $O_p \( G \)$ for the largest normal $p$-subgroup of $G$.

Quillen’s conjecture asserts that contractibility of this order complex forces $O_p \( G \) eq.not 1$. It asks whether the topology of the elementary subgroups detects the existence of a normal $p$-subgroup. We prove a stronger statement.

#thm([Theorem 1.1.])[
  #emph[For every finite group $G$ and every prime $p$, if $O_p \( G \) = 1$, then 
$ tilde(H)_(*) \( cal(A)_p \( G \) \; bb(Q) \) eq.not 0 . $

 Here reduced homology is augmented, so that the empty poset has $tilde(H)_(- 1) \( diameter \; bb(Q) \) = bb(Q)$.]
] <thm:main>

A contractible nonempty complex has zero reduced homology, and the empty complex is not contractible. Theorem 1 therefore gives a positive resolution of Quillen’s conjecture, without a restriction on the prime or the composition factors of $G$.

The rational conclusion also determines acyclicity with other coefficients. Since the order complex is finite, a nonzero rational homology group comes from an integral homology group of positive free rank. The universal coefficient theorem therefore gives nonzero reduced homology over every field in the same degree; for the empty poset this follows directly from augmentation. Conversely, a nontrivial $p$-core makes $cal(A)_p \( G \)$ contractible #cite(label("Quillen1978")) Proposition 2.4. Thus acyclicity over any fixed field characterizes the existence of a nontrivial normal $p$-subgroup.

===== 1.1 Background. <background.>

Brown’s work on Euler characteristics introduced the poset $cal(S)_p \( G \)$ of all nonidentity $p$-subgroups and related its Euler characteristic to the order of a Sylow subgroup #cite(label("Brown1975")). Quillen proved that the inclusion $cal(A)_p \( G \) subset.eq cal(S)_p \( G \)$ is a homotopy equivalence #cite(label("Quillen1978")) Proposition 2.1, so the two posets carry the same homological information. He formulated the contractibility conjecture in 1978 and established it for solvable groups, groups of elementary abelian $p$-rank at most two, and groups of Lie type in defining characteristic #cite(label("Quillen1978")) Conjecture 2.9, Proposition 2.10, Theorem 3.1, and Corollary 12.2. For solvable groups with trivial $p$-core, his proof produces nonzero homology in the largest possible degree. This stronger conclusion, subsequently called the #emph[Quillen dimension property], became a central input to the component reductions.

The almost-simple case was established by #cite(label("AschbacherKleidman1990"), form: "prose"). Passing from simple components to an arbitrary finite group requires control of their extensions and of the homology that survives in the ambient group. #cite(label("AschbacherSmith1993"), form: "prose") developed this approach for $p > 5$, reducing the remaining problem to the dimension property for specified elementary extensions of unitary groups. #cite(label("PitermanSmith2025"), form: "prose") Theorems 1.1 and 1.4 extended the reduction to all odd primes. #cite(label("DiazRamos2026"), form: "prose") Theorems B and C proved the required unitary result and deduced the rational homological assertion for every finite group at odd primes. We retain a direct frame proof of the required unitary dimension property. Its local statement, Proposition 23, covers the indicated almost-simple groups with elementary abelian quotient, without assuming a splitting.

At two, successive component eliminations narrowed the remaining families. #cite(label("PitermanSmith2022"), form: "prose") Corollary 1.3 showed that every component of a minimal counterexample must admit an outer automorphism of order two induced by the ambient group. #cite(label("Piterman2024"), form: "prose") Theorem 1.1 and Corollary 1.2 established the dimension property for elementary $2$-extensions of exceptional Lie-type groups in odd characteristic, apart from a finite list in characteristic three. In a minimal counterexample, #cite(label("Piterman2026"), form: "prose") Theorem A then eliminated the remaining Lie-type components in characteristic two. Combining these results with the preceding reductions gives the classical components in characteristic at least five listed in #cite(label("Piterman2026"), form: "prose") Theorem B. We use this reduction in the precise form recalled in Section 2 and prove the remaining cases by our cycle and propagation constructions.

Several of the methods behind these reductions are also central to the present proof. #cite(label("SegevWebb1994"), form: "prose") developed exact-sequence methods relating subgroup posets to a normal subgroup and its centralizers. #cite(label("Piterman2021"), form: "prose") Sections 3–5 developed full-chain homology propagation, maximal faithful elementary extensions, and deletion of overgroups, building on the propagation arguments of #cite(label("AschbacherSmith1993"), form: "prose"). Our propagation proof spells out the coefficient and maximality conditions used by the constructions below. The constructible cycles of #cite(label("DiazRamos2018"), form: "prose") and the admissible collections of #cite(label("DiazRamosMazza2022"), form: "prose") likewise organize subgroup flags by separating nonzero simplex coefficients from vanishing boundary coefficients. The frame and decoration constructions here use this chain-level viewpoint, with quantitative estimates that are uniform as the dimension grows over a fixed field.

===== 1.2 The cycle construction. <the-cycle-construction.>

A frame is a decomposition of a finite-dimensional vector space into lines; when a form is present, the lines are nondegenerate and mutually orthogonal. Independent scalar signs on the lines give an elementary abelian projective subgroup. Its full subgroup flags support familiar apartment chains. We impose relations between frames that differ only inside a plane, so that the boundaries of their apartment chains cancel.

The main quantitative ingredient is a lower bound on the dimension of the resulting coefficient space, uniform as the dimension of the ambient space increases while the field stays fixed. This bound gives room to impose further equations: adjoining commuting elementary automorphisms creates new boundary faces, and their cancellation is a linear condition on the frame coefficients. Counting the possible completions of each partial choice bounds the number of such conditions. The comparison produces a nonzero cycle on full subgroup flags, rather than merely a nonzero collection of parameters describing apartments.

To obtain the dimension bound, we encode merger trees of frame lines by multilinear Lie superbrackets. A Poincaré–Birkhoff–Witt argument and a bound for the actual kernel of the generator–relation complex turn elementary plane counts into the estimate of Theorem 11. The supporting subspace and its isometry type are retained throughout, so the same estimate can be used after the descent imposed by specified commuting automorphisms. In the symmetric case with field parameter at least five, the retained fraction is at least $0.68^h$ in dimension $h$.

The geometric and algebraic ingredients have established precedents. The unitary decomposition poset is studied by #cite(label("PitermanWelker2024"), form: "prose"); the relation between merger trees and multilinear Lie representations appears in #cite(label("Stanley1982"), form: "prose") #cite(label("Robinson2004"), form: "prose"). We identify the precise coefficient space needed here and retain the supporting-subspace grading in the PBW calculation. The generator–relation series method is related to that of #cite(label("GolodShafarevich1964"), form: "prose"); the additional kernel inequality is proved in Section 4 before the logarithmic comparison is used.

===== 1.3 From a coefficient to homology. <from-a-coefficient-to-homology.>

The constructions may first give a cycle in an automorphism group larger than the chosen extension $H$ of a simple component $L$. Intersecting arbitrary subgroup flags with $H$ could collapse them or cancel their coefficients. Lemma 19 avoids this by selecting a supported elementary group with largest intersection index, taking a residue at a fixed complement, and then intersecting the remaining flag with $H$. On that residue the operation is injective, so one nonzero full-flag coefficient survives.

At the prime two we work in a minimal counterexample and choose the last subgroup $A$ of maximal rank in a family of elementary subgroups generating faithful component extensions. Proper-subgroup induction supplies a nonbounding cycle in the centralizer of $H = L A$. Its product with the constructed cycle has a residue at the chosen flag that detects the centralizer class. The deletion argument in Lemma 9 ensures that this residue still detects nonbounding in the ambient group. This proves nonvanishing without requiring $A$ to have the largest possible elementary rank in $G$.

For odd primes the cited reduction requires a different conclusion: nonzero homology in the largest possible degree for certain unitary extensions. We establish the needed rank formula before constructing their cycles. This distinguishes the top-degree argument from the propagation argument used at two.

Two parts of the proof take shorter or different routes through these steps. The symplectic cycles are constructed directly in $H$ and need no restriction from a larger group. In the last branch for $"PSL"_4 \( 5 \)$, an equivalent-poset construction instead retains the join of the component and centralizer homology. Section 9 states the precise conditions that lead to this branch.

===== 1.4 Organization. <organization.>

Section 2 fixes conventions and states the reduction theorems. Section 3 proves the propagation lemma. Sections 4 and 5 develop frame cycles, their dimension bounds, and the decoration and restriction procedures. Sections 6–8 establish the required linear, unitary, symplectic, and orthogonal cases. Section 9 treats the remaining small orthogonal case, realized as $"PSL"_4 \( 5 \)$, and Section 10 assembles the proof of Theorem 1.

== 2 Conventions and the reduction theorems <sec:reductions>

We first specify the homological statement used in induction and the classical groups to which the known reductions apply. Unless coefficients are specified otherwise, homology groups and chains have coefficients in $bb(Q)$.

=== 2.1 Posets, chains, and elementary rank <posets-chains-and-elementary-rank>

For a finite poset $P$, let $Delta \( P \)$ be its order complex and write $tilde(H)_(*) \( P \)$ for its reduced homology. We use the augmented chain complex: there is a one-dimensional group in degree $- 1$, generated by the empty simplex, and the boundary of each vertex is that generator. Consequently $tilde(H)_(- 1) \( diameter \) = bb(Q)$. For a nonempty finite complex, nonvanishing in degree $- 1$ is impossible.

A #emph[full flag] in an elementary abelian group $E$ of rank $r$ is a chain

$ E_1 < E_2 < dots.h.c < E_r = E \, #h(2em) "rk" E_i = i . $

We also call such a flag saturated. A coefficient at a full flag always means its coefficient as an oriented simplex, with the displayed increasing order. Write

$ m_p \( G \) = max { "rk" E : E lt.eq G upright(" an elementary abelian ") p upright("-subgroup") } \, $

allowing $E = 1$ in this maximum. The order complex of $cal(A)_p \( G \)$ has dimension $m_p \( G \) - 1$, including the empty case. We say that $G$ has the #emph[Quillen dimension property] at $p$ if

#[#set math.equation(numbering: n => "(1)")
 $ tilde(H)_(m_p \( G \) - 1) \( cal(A)_p \( G \) \) eq.not 0 . $ <eq:QD>]

A nonzero cycle in that degree cannot be a boundary, because the chain group in the next degree is zero.

The #emph[homological implication] for $\( G \, p \)$ is

#[#set math.equation(numbering: n => "(2)")
 $ O_p \( G \) = 1 quad arrow.r.double quad tilde(H)_(*) \( cal(A)_p \( G \) \) eq.not 0 . $ <eq:HQC>]

When arguing by minimality we fix $p$ and minimize $\| G \|$ among counterexamples to (2). Thus every group of smaller order satisfies (2), with no restriction on its composition factors. If $p divides.not \| G \|$, its elementary poset is empty and it is not a counterexample under our convention.

We use two standard elementary facts about finite posets. Pointwise comparable order-preserving maps induce homotopic maps on order complexes. Also, deleting a vertex whose strict upper interval is contractible preserves homotopy type: its link is the join of its lower and upper intervals and is contractible. These facts also follow from the standard fiber and gluing lemmas for posets; see #cite(label("Quillen1978"), form: "prose") #cite(label("PitermanSmith2025"), form: "prose").

=== 2.2 Components and automorphisms <components-and-automorphisms>

A component of a finite group is a subnormal quasisimple subgroup. The components supplied by the reduction below are simple. Distinct components commute; distinct conjugates of a simple component intersect trivially and generate their direct product. We use these standard component facts and the usual automorphism structure of finite classical simple groups; see #cite(label("GLS1998"), form: "prose").

If $L$ is nonabelian simple, a subgroup containing $L$ and acting faithfully on $L$ by conjugation is identified with a subgroup of $"Aut" \( L \)$. An #emph[elementary $p$-extension] of $L$ means a split extension $L times.r B$ in which $B$ is elementary abelian and induces only outer automorphisms; $B = 1$ is allowed. In particular, an elementary quotient alone is not being taken as a splitting hypothesis. In our configurations, $H = L A$ with $A$ elementary and $H$ faithful on $L$; a vector-space complement to $A ∩ L$ in $A$ supplies the required subgroup $B$.

Every such faithful extension $L lt.eq H lt.eq "Aut" \( L \)$ has $O_p \( H \) = 1$. Indeed, for $Q = O_p \( H \)$ simplicity gives $Q ∩ L = 1$, and normality gives $\[ Q \, L \] lt.eq Q ∩ L$. Hence $Q lt.eq C_H \( L \) = 1$. Thus these extensions meet the trivial-core condition in the conditional dimension-property convention of the cited reductions.

For the linear and unitary groups, the parameter $q$ is the order of the base field: the natural unitary space is over $bb(F)_(q^2)$. In the orthogonal sections, the discriminant means the determinant square class of a Gram matrix. Its relation to the Witt sign includes the usual dimension-dependent factor. These two conventions will not be interchanged.

=== 2.3 The established reductions <the-established-reductions>

#thm([Theorem 2.1.])[
  (Reduction at two).  #emph[Let $G$ be a minimal-order counterexample to (2) for $p = 2$. Then $G$ has a simple component $L$ in the following list, where the field parameter $q$ has characteristic at least five: 
$ "PSL"_n \( q \) \, med "PSU"_n \( q \) & n gt.eq 4 \,\
"PSp"_(2 n) \( q \) & n gt.eq 3 \,\
Omega_(2 n + 1) \( q \) & n gt.eq 2 \,\
upright(P) Omega_(2 n)^plus.minus \( q \) & n gt.eq 4 . $

]
] <thm:reduction-two>

This is the part of #cite(label("Piterman2026"), form: "prose") Theorem B that we require. The theorem there also supplies an extension failing the dimension property; our argument at two will instead use maximal faithful configurations and does not need that additional conclusion.

#thm([Theorem 2.2.])[
  (Odd-prime reduction).  #emph[Suppose that, for every odd prime $p$, every odd prime power $q$ with $p divides q + 1$, and every simple $L = "PSU"_n \( q \)$ with $n gt.eq 5$, each elementary $p$-extension of $L$ inside $"Aut" \( L \)$ has the Quillen dimension property. Then (2) holds for every finite group and every odd prime.]
] <thm:reduction-odd>

#proof[
  #emph[Derivation from the established reduction.] Fix an odd prime and take a minimal counterexample, if one exists. The inductive hypothesis in #cite(label("PitermanSmith2025"), form: "prose") Theorem 1.4 holds by minimality: its proper subgroups and proper quotients by central subgroups of order prime to $p$ have smaller order. The reduction to simple components in its published proof (p. 367) uses #cite(label("PitermanSmith2025"), form: "prose") Theorem 2.22(2) and Lemma 2.3. Theorem 1.4 then reduces the remaining assertion to the dimension property for the indicated unitary extensions occurring in the group. Proving it for all such extensions inside the automorphism group suffices.
  The dimension-property list in #cite(label("PitermanSmith2025"), form: "prose") Theorem 2.16(2), recalled from #cite(label("AschbacherSmith1993"), form: "prose") Theorem 3.1, has possible unitary exceptions in this range only when
  $ n gt.eq q \( q - 1 \) \, #h(2em) upright("or") #h(2em) n gt.eq s \( s - 1 \) \, quad s = q^(1 \/ p) \, $
  where the second possibility requires a field order $s$ and a nontrivial field extension. Since $q$ is odd and $p divides q + 1$, $q gt.eq 5$. In the second case $q = s^p$ gives $s equiv s^p equiv - 1 med \( mod med p \)$, so $s gt.eq 5$ as well. Both thresholds are at least twenty; in particular no missing dimension $n lt.eq 4$ needs a new argument. The rank-one coincidences $"PSU"_2 \( 5 \) tilde.equiv A_5$ and $"PSU"_2 \( 9 \) tilde.equiv A_6$ #cite(label("Taylor1992")) Theorems 10.9 and 4.6(ii),(iv) introduce no exception for the respective odd primes dividing $q + 1$ in the same list. The proposed hypothesis therefore supplies every remaining case required by the reduction. ◻
]

The rest of the paper proves the new assertions needed by these two theorems. We first establish the chain and propagation methods; no dimension property at two is assumed in those methods.

Table 1 records where these local tasks are completed. At two, a supported coefficient is transferred to the ambient group by the propagation lemma; it need not occur in the largest chain degree of the component extension. The final exceptional case also has a branch using an equivalent poset instead of propagation.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Prime
], table.cell(rowspan: 1, colspan: 1)[Local task
], table.cell(rowspan: 1, colspan: 1)[Result
]),
  table.cell(rowspan: 1, colspan: 1)[Odd $p$
], table.cell(rowspan: 1, colspan: 1)[Top-degree homology for the unitary extensions in Theorem 3
], table.cell(rowspan: 1, colspan: 1)[Proposition 23
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[Linear and unitary components of natural dimension at least five
], table.cell(rowspan: 1, colspan: 1)[Proposition 22
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[Symplectic components on the reduction list
], table.cell(rowspan: 1, colspan: 1)[Proposition 24
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[Orthogonal components, including the dimension-four linear and unitary groups through their six-dimensional realizations, apart from the case in the next row
], table.cell(rowspan: 1, colspan: 1)[Proposition 28
],
  table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[The remaining square-determinant six-space over $bb(F)_5$, with simple group $"PSL"_4 \( 5 \)$
], table.cell(rowspan: 1, colspan: 1)[Proposition 36
],
)
]],
  caption: [Table 1: The local tasks exported to the reductions. All prime-two rows have defining characteristic at least five. The propositions in those rows exclude the indicated components of a minimal counterexample; they do not assert a general dimension property. ],
)

== 3 Propagation from a faithful component extension <sec:propagation>

This section explains how a cycle in an extension of a simple component produces nonzero homology for the ambient group. The local cycle need not lie in the largest dimension of the extension. What matters is a nonzero coefficient on a flag that contains every rank below its final subgroup. We first establish the group-theoretic and chain-level facts that make this coefficient survive passage to the ambient group.

The use of shuffles and full chains to propagate homology is developed in #cite(label("Piterman2021"), form: "prose") Section 3, Lemmas 3.12–3.14, following #cite(label("AschbacherSmith1993"), form: "prose") Lemmas 0.24, 0.25, and 0.27. Maximal faithful extensions and deletion of faithful overgroups also occur in #cite(label("Piterman2021"), form: "prose") Section 4, proof of Theorem 1, and Section 5. We give the version needed here, with the supported coefficient, centralizer condition, and permitted elementary enlargements explicit. The full-chain method already permits propagation without the Quillen dimension property; the construction below retains that feature.

=== 3.1 Centralizers and faithful configurations <centralizers-and-faithful-configurations>

We use two standard consequences of the component theorem: distinct components commute, and every component centralizes the Fitting subgroup #cite(label("GLS1998")). In particular, distinct conjugates of a nonabelian simple component have trivial intersection. The following consequence does not require the component to be normal.

#thm([Lemma 3.1.])[
  #emph[Let $G$ be a finite group, let $p$ be a prime, and let $L$ be a nonabelian simple component of $G$. If $O_p \( G \) = 1$, then 
$ O_p \( C_G \( L \) \) = 1 . $

]
] <lem:component-core>

#proof[
  List the distinct $G$-conjugates of $L$ as $L = L_1 \, L_2 \, dots.h \, L_t$. The component theorem gives an internal direct product $N = L_1 dots.h.c L_t$, and conjugation by $G$ permutes its factors. Thus $N lt.closed.eq G$.
  Set $C = C_G \( L \)$ and $Q = O_p \( C \)$. For $i > 1$, the group $L_i$ is contained in $C$. It is also subnormal in $C$: intersect a subnormal chain from $L_i$ to $G$ with $C$. Consequently $L_i$ is a component of $C$. The normal $p$-subgroup $Q$ is nilpotent, so it lies in the Fitting subgroup of $C$, and the component theorem inside $C$ gives $\[ Q \, L_i \] = 1$. By definition $Q$ also centralizes $L_1$. Therefore
  $ Q lt.eq D := C_G \( N \) lt.eq C . $
  Since $Q lt.closed.eq C$, the inclusion $Q lt.eq D$ implies $Q lt.closed.eq D$. Hence $Q lt.eq O_p \( D \)$. Finally, $D lt.closed.eq G$ and $O_p \( D \)$ is characteristic in $D$, so $O_p \( D \) lt.eq O_p \( G \) = 1$. ◻
]

#prodef([Definition 3.2.])[
  Fix a finite group $G$, a prime $p$, and a nonabelian simple component $L$ of $G$. A #emph[faithful configuration for $L$ in $G$] is a subgroup $A in cal(A)_p \( G \)$ such that
  $ A lt.eq N_G \( L \) \, #h(2em) A ∩ L eq.not 1 \, #h(2em) C_(L A) \( L \) = 1 \, #h(2em) O_p \( C_G \( L A \) \) = 1 . $
  We write $H = L A$. The condition $C_H \( L \) = 1$ says that the conjugation homomorphism $H arrow.r "Aut" \( L \)$ is injective. We may therefore identify $L lt.eq H lt.eq "Aut" \( L \)$ using this homomorphism.
] <def:faithful-configuration>

If $O_p \( G \) = 1$, every nonidentity elementary abelian subgroup $A lt.eq L$ gives a faithful configuration: here $L A = L$, the simplicity of $L$ gives $Z \( L \) = 1$, and Lemma 4 gives the last condition. This observation will provide initial members of the families used later.

The next observation separates faithfulness of an elementary subgroup from faithfulness of the extension it generates with $L$.

#thm([Lemma 3.3.])[
  #emph[Let $A$ be a faithful configuration for a nonabelian simple component $L$ of $G$. Suppose every element of order $p$ in $C_L \( A \)$ belongs to $A$. If $D in cal(A)_p \( G \)$ contains $A$, then $D lt.eq N_G \( L \)$. Moreover, 
$ C_D \( L \) = 1 quad arrow.r.double quad C_(L D) \( L \) = 1 . $

]
] <lem:faithfulness-upgrade>

#proof[
  Choose $1 eq.not x in A ∩ L$. For $d in D$, commutativity of $D$ gives $x^d = x$, so $x in L ∩ L^d$. Distinct conjugates of the simple component $L$ have trivial intersection. Therefore $L^d = L$, as required.
  Assume $C_D \( L \) = 1$. It suffices to prove that every $d in D$ inducing an inner automorphism of $L$ already belongs to $L$. Such an element can be written
  $ d = l c \, #h(2em) l in L \, quad c in C_G \( L \) . $
  The factors commute and $L ∩ C_G \( L \) = Z \( L \) = 1$, so this factorization is unique. Since $d^p = 1$, we have $l^p = c^p = 1$. Every $a in A$ normalizes both $L$ and $C_G \( L \)$; comparing the two factorizations of $d^a = d$ gives $l^a = l$ and $c^a = c$. Thus $l in C_L \( A \)$. Either $l = 1$, or $l$ has order $p$, in which case the hypothesis gives $l in A$. In either case $l in D$, and consequently $c = l^(- 1) d in C_D \( L \) = 1$. Hence $d = l in L$.
  Now an element $l d in C_(L D) \( L \)$ makes the action of $d$ inner. The preceding argument gives $d in L$, and then $l d in L ∩ C_G \( L \) = 1$. This proves the asserted faithfulness of $L D$. ◻
]

=== 3.2 Deletion and augmented chains <deletion-and-augmented-chains>

For a finite poset $X$, write $X_(> x)$ and $X_(< x)$ for its strict upper and lower intervals. All chains below use rational coefficients and the augmented simplicial boundary. In particular, the empty chain $\[ thin \]$ has degree $- 1$, and the boundary of a vertex is $\[ thin \]$.

We shall use the following elementary deletion facts. If $X_(> x)$ is nonempty and contractible, then

$ Delta \( X \\ { x } \) arrow.r Delta \( X \) $

is a homotopy equivalence. Indeed, the link of $x$ is $Delta \( X_(< x) \) * Delta \( X_(> x) \)$, which is contractible, also when $X_(< x)$ is empty. The complex $Delta \( X \)$ is obtained by attaching the cone on this link to $Delta \( X \\ { x } \)$ along the link. Attaching a cone along a contractible subcomplex preserves homotopy type, by the homotopy extension property for simplicial complexes.

Also, if a finite group $T$ has $O_p \( T \) eq.not 1$, then $cal(A)_p \( T \)$ is contractible. Here is a verification that includes the elementary subgroup condition. Let $cal(S)_p \( T \)$ be the poset of all nonidentity $p$-subgroups of $T$. Writing $Q = O_p \( T \)$, the order maps

$ P mapsto P \, #h(2em) P mapsto P Q \, #h(2em) P mapsto Q $

on $cal(S)_p \( T \)$ satisfy $P lt.eq P Q gt.eq Q$, so $cal(S)_p \( T \)$ is contractible. For any $R in cal(S)_p \( T \)$, the inverse image of $\( cal(S)_p \( T \) \)_(lt.eq R)$ under the inclusion $cal(A)_p \( T \) arrow.r.hook cal(S)_p \( T \)$ is $cal(A)_p \( R \)$. Choose a central subgroup $Z lt.eq R$ of order $p$. For $E in cal(A)_p \( R \)$, the product $E Z$ is elementary abelian, and the order maps $E lt.eq E Z gt.eq Z$ contract $cal(A)_p \( R \)$. The finite-poset fiber theorem #cite(label("Quillen1978")), in the form asserting that contractible inverse images of all lower principal ideals give a homotopy equivalence, therefore applies to this inclusion. This proves the claim.

The chain operation that will detect the propagated cycle is a residue at an initial flag. Its compatibility with boundaries depends on including every possible rank in that flag.

#thm([Lemma 3.4.])[
  (Saturated residue).  #emph[Let $X$ be a subposet of $cal(A)_p \( G \)$, and suppose $X$ contains the flag 
$ sigma = \[ A_1 < dots.h.c < A_r = A \] \, #h(2em) "rk" \( A_i \) = i . $

 Define a linear map 
$ R_sigma : tilde(C)_n \( Delta X \; bb(Q) \) arrow.r tilde(C)_(n - r) \( Delta X_(> A) \; bb(Q) \) $

 as follows: a chain containing $sigma$ is sent to its strict continuation after $A$, and every other chain is sent to zero. The continuation of $sigma$ itself is $\[ thin \]$. Chain groups in degrees below $- 1$ are zero. Then 
#[#set math.equation(numbering: n => "(3)")
 $ R_sigma partial = \( - 1 \)^r partial R_sigma . $ <eq:residue-boundary>]

 In particular, residues of cycles are cycles, and residues of boundaries are boundaries, including in degree $- 1$.]
] <lem:saturated-residue>

#proof[
  There is no vertex strictly below $A_1$, and no vertex between $A_i$ and $A_(i + 1)$: these would be elementary abelian subgroups of ranks strictly between consecutive integers. Thus every chain containing $sigma$ begins with exactly these $r$ vertices. For such a chain, deleting one of its first $r$ vertices removes part of $sigma$ and contributes zero to the residue. Deleting its $\( r + j + 1 \)$-st vertex, with $j gt.eq 0$, is precisely deletion of the $\( j + 1 \)$-st vertex of its continuation, with boundary sign $\( - 1 \)^(r + j)$ in place of $\( - 1 \)^j$. This proves (3) on chains containing $sigma$. A face of a chain that does not contain $sigma$ cannot contain $sigma$, proving the identity on all remaining chains. If the continuation is a single vertex, its boundary is $\[ thin \]$; if it is empty, its boundary is zero. The same calculation therefore proves the identity in the augmented degrees as well. ◻
]

=== 3.3 Products of cycles <products-of-cycles>

Suppose $H \, K lt.eq G$ commute and $H ∩ K = 1$. Set $X = cal(A)_p \( H \)$, $Y = cal(A)_p \( K \)$, and adjoin an identity subgroup to each, writing $X^(+) = X union { 1 }$ and $Y^(+) = Y union { 1 }$. The poset

$ cal(P) \( H \, K \) = { U V : U in X^(+) \, med V in Y^(+) \, med \( U \, V \) eq.not \( 1 \, 1 \) } $

is identified with $\( X^(+) times Y^(+) \) \\ { \( 1 \, 1 \) }$. Indeed, $U V ∩ H = U$ and $U V ∩ K = V$, so both the subgroup and its inclusion relations recover the two coordinates.

#thm([Lemma 3.5.])[
  (Product shuffle).  #emph[With this notation there is a bilinear operation 
$ times.square : tilde(C)_a \( Delta X \; bb(Q) \) ⊗ tilde(C)_b \( Delta Y \; bb(Q) \) arrow.r tilde(C)_(a + b + 1) \( Delta cal(P) \( H \, K \) \; bb(Q) \) $

 for $a \, b gt.eq - 1$, satisfying 
#[#set math.equation(numbering: n => "(4)")
 $ partial \( u times.square v \) = \( partial u \) times.square v + \( - 1 \)^(a + 1) u times.square partial v . $ <eq:product-boundary>]

 It is the chain construction for the subdivision of the join $Delta X * Delta Y$ by the product poset. The empty chain is an identity for this operation.]
] <lem:product-shuffle>

#proof[
  Let $u = \[ U_1 < dots.h.c < U_r \]$ and $v = \[ V_1 < dots.h.c < V_t \]$, where $r = a + 1$ and $t = b + 1$, and set $U_0 = V_0 = 1$. A shuffle is a word with $r$ letters $H$ and $t$ letters $K$. Starting at $\( 0 \, 0 \)$, read the word from left to right, increasing the first coordinate at an $H$ and the second at a $K$. At each of the $r + t$ steps record the subgroup $U_i V_j$. The recorded subgroups form a strict chain. Give this chain the sign $\( - 1 \)^nu$, where $nu$ is the number of pairs in which a $K$ precedes an $H$, and define $u times.square v$ to be the sum over all shuffles with these signs. When either flag is empty this is just the other flag, in its pure coordinate; when both are empty it is $\[ thin \]$.
  For the boundary formula, an omitted intermediate vertex between steps of different types has a second occurrence obtained by interchanging those two steps. Their shuffle signs are opposite, so these occurrences cancel. This includes deletion of the first vertex when the first two steps have different types. The remaining faces are precisely shuffles in which a vertex of one input flag is omitted: either two consecutive steps of that type have been joined, or the final step has been removed. If the $i$-th $H$-vertex is preceded by $b'$ $K$-steps, its face sign is $\( - 1 \)^(i + b' - 1)$, and removing its $H$-step decreases the inversion count by $b'$. Its total sign is therefore $\( - 1 \)^(i - 1)$ relative to the shortened shuffle. If the $j$-th $K$-vertex is preceded by $a'$ $H$-steps, its face sign is $\( - 1 \)^(a' + j - 1)$, and removing its $K$-step decreases the inversion count by $r - a'$. Its total sign is $\( - 1 \)^(r + j - 1)$. Summing these faces gives (4), since $r = a + 1$. The cases of empty or single-vertex inputs use the same rule and the augmented boundary.
  For completeness, the underlying join description follows from the usual staircase triangulation of a product of simplices, applied compatibly to the two cones $Delta X^(+)$ and $Delta Y^(+)$. The resulting triangulation is $Delta \( X^(+) times Y^(+) \)$. Let $s \, t in \[ 0 \, 1 \]$ be the radial coordinates in these cones, with zero at the adjoined identities. Under the product realization, the subcomplex obtained by deleting $\( 1 \, 1 \)$ is exactly the locus $max \( s \, t \) = 1$: in a chain missing the least element, at least one coordinate is nonidentity throughout. Conversely, a point with $max \( s \, t \) = 1$ has zero barycentric coefficient at $\( 1 \, 1 \)$ in every containing product simplex. Radial rescaling replaces this locus by $s + t = 1$, the realization of $Delta X * Delta Y$. This also gives the stated description when one factor is empty; when both are empty, both complexes are empty. ◻
]

=== 3.4 The propagation lemma <the-propagation-lemma>

We can now formulate the precise local input needed from the later classical-group constructions. The two maximality conditions in the statement will ensure that all faithful elementary overgroups can be deleted, while products with the centralizer remain.

#thm([Lemma 3.6.])[
  (Propagation).  #emph[Let $G$ be a finite group and $p$ a prime. Assume that every proper subgroup $T < G$ with $O_p \( T \) = 1$ satisfies 
$ tilde(H)_(*) \( Delta cal(A)_p \( T \) \; bb(Q) \) eq.not 0 . $

 Let $L$ be a nonabelian simple component of $G$ with $p divides \| L \|$, and let $A$ be a faithful configuration for $L$ in $G$. Write $H = L A$ and $r = "rk" \( A \)$. Assume the following three conditions.]
  + #emph[Every element of order $p$ in $C_L \( A \)$ belongs to $A$.]
  + #emph[There is no $D in cal(A)_p \( G \)$ with $D > A$ for which $L D$ acts faithfully on $L$ and $O_p \( C_G \( L D \) \) = 1$.]
  + #emph[There is a cycle $alpha in tilde(C)_(r - 1) \( Delta cal(A)_p \( H \) \; bb(Q) \)$ whose coefficient on some flag $sigma = \[ A_1 < dots.h.c < A_r = A \]$, with $"rk" \( A_i \) = i$, is nonzero.]
  #emph[Then $tilde(H)_(*) \( Delta cal(A)_p \( G \) \; bb(Q) \) eq.not 0$.]
] <lem:propagation>

#proof[
  We first delete certain vertices without changing the homotopy type, then construct a cycle in the remaining poset and detect it by Lemma 7.
  By Lemma 6, every elementary overgroup of $A$ normalizes $L$, and faithfulness of such an overgroup on $L$ implies faithfulness of its extension by $L$. Define
  $ cal(D) = { D in cal(A)_p \( G \) : D > A \, med C_D \( L \) = 1 } . $
  For $D in cal(D)$, condition (ii) therefore gives
  #[#set math.equation(numbering: n => "(5)")
   $ O_p \( C_G \( L D \) \) eq.not 1 . $ <eq:deleted-core>]
  Delete the elements of $cal(D)$ in an order in which every strict overgroup is deleted before its subgroups.
  Consider the moment at which $D in cal(D)$ is deleted, and let $U_D$ be its upper interval in the poset then remaining. Every $E in U_D$ has $C_E \( L \) eq.not 1$, since otherwise $E$ would have already been deleted. Put $K_D = C_G \( L D \)$. There are order maps
  $ q_D : U_D arrow.r cal(A)_p \( K_D \) \, quad E mapsto C_E \( L \) \, #h(2em) j_D : cal(A)_p \( K_D \) arrow.r U_D \, quad P mapsto D P . $
  The first map is well-defined because $E$ is abelian and contains $D$, so $C_E \( L \)$ centralizes both $L$ and $D$. For the second, $P$ centralizes $D$ and $P ∩ D lt.eq C_D \( L \) = 1$; hence $D P$ is elementary abelian and strictly contains $D$. It centralizes $L$ on the nontrivial subgroup $P$, so it has not been deleted. Finally,
  $ q_D j_D \( P \) = P \, #h(2em) j_D q_D \( E \) = D C_E \( L \) lt.eq E . $
  For the equality, an element $d p in D P$ centralizes $L$ exactly when $d$ does, and $C_D \( L \) = 1$. The displayed comparisons give a poset homotopy equivalence between $U_D$ and $cal(A)_p \( K_D \)$. By (5) the latter is contractible. Each deletion therefore preserves homotopy type. Denote the final poset by
  $ X = cal(A)_p \( G \) \\ cal(D) . $
  Set $K = C_G \( H \)$. It is a proper subgroup of $G$: otherwise it would contain $L$, contradicting the noncommutativity of $L lt.eq H$. The configuration gives $O_p \( K \) = 1$, so the inductive assumption provides a cycle
  $ beta in tilde(C)_b \( Delta cal(A)_p \( K \) \; bb(Q) \) \, #h(2em) b gt.eq - 1 \, #h(2em) \[ beta \] eq.not 0 . $
  Moreover $H ∩ K = 1$, since an element of this intersection centralizes $L$ and lies in the faithfully acting group $H$. Thus Lemma 8 gives a cycle
  $ z = alpha times.square beta in tilde(C)_(r + b) \( Delta cal(A)_p \( G \) \; bb(Q) \) . $
  In fact $z$ is supported in $X$. A product vertex $U V$ with $1 eq.not V lt.eq K$ has $C_(U V) \( L \) eq.not 1$ and so is not deleted. A pure vertex $U lt.eq H$ could be deleted only if $U > A$. But such a $U$ would satisfy $L U = H$, making $L U$ faithful with $O_p \( C_G \( L U \) \) = O_p \( K \) = 1$, contrary to condition (ii). This proves the assertion about the support of $z$.
  All elements $E$ of $X_(> A)$ have $C_E \( L \) eq.not 1$. The same maps as above, now with $D = A$, give
  #[#set math.equation(numbering: n => "(6)")
   $ q : X_(> A) arrow.r cal(A)_p \( K \) \, quad E mapsto C_E \( L \) \, #h(2em) j : cal(A)_p \( K \) arrow.r X_(> A) \, quad P mapsto A P . $ <eq:upper-retraction>]
  Indeed, $C_E \( L \)$ also centralizes $A$, while $P ∩ A = 1$ by faithfulness; the identities are $q j = "id"$ and $j q \( E \) lt.eq E$.
  Let $lambda eq.not 0$ be the coefficient of $sigma$ in $alpha$. We claim that the residue of $z$ is
  #[#set math.equation(numbering: n => "(7)")
   $ R_sigma z = lambda j_(*) beta . $ <eq:propagation-residue>]
  Every vertex of $sigma$ lies in $H$. Because the product coordinates are unique, a shuffled flag containing $sigma$ has trivial $K$-coordinate until it reaches $A$. It must therefore take all $r$ of its $H$-steps first, and its $H$-flag must be exactly $sigma$: the homogeneous chain $alpha$ has precisely $r$ vertices in each term. The remaining vertices are $A V_1 < dots.h.c < A V_(b + 1)$ for a term of $beta$. The shuffle taking every $H$-step first has sign $+ 1$, which proves (7).
  If $z = partial w$ in $tilde(C)_(*) \( Delta X \; bb(Q) \)$, then Lemma 7 makes $R_sigma z$ a boundary in $Delta X_(> A)$. Apply the augmented chain map induced by $q$, where a chain with repeated image vertices is sent to zero. Since $q j = "id"$, equation (7) implies that $lambda beta$ is a boundary in $Delta cal(A)_p \( K \)$, contrary to $\[ beta \] eq.not 0$. Thus $\[ z \] eq.not 0$. The homotopy equivalence $Delta X tilde.eq Delta cal(A)_p \( G \)$ proves the conclusion.
  To make the empty case explicit, $b = - 1$ with $\[ beta \] eq.not 0$ is possible only when $cal(A)_p \( K \)$ is empty. The map $q$ in (6) then forces $X_(> A)$ to be empty as well. Equation (7) is a nonzero multiple of $\[ thin \]$ in that empty upper interval, and cannot be a boundary. Hence the same proof applies without requiring a nonidentity elementary abelian subgroup in $K$. ◻
]

=== 3.5 Choosing a configuration of maximal rank <choosing-a-configuration-of-maximal-rank>

In the applications, the cycle may be supported at a different configuration from the one first selected. The following criterion records exactly what must be retained when making that replacement.

#thm([Corollary 3.7.])[
  #emph[Assume the inductive hypothesis on proper subgroups of $G$ in Lemma 9, and let $L$ be a nonabelian simple component with $p divides \| L \|$. Let $cal(F)$ be a nonempty family of faithful configurations for $L$ in $G$ such that 
$ A in cal(F) \, quad D in cal(A)_p \( G \) \, quad D > A \, quad D upright(" a faithful configuration") quad arrow.r.double quad D in cal(F) . $

 Let $r$ be the largest rank of a member of $cal(F)$. If some $A in cal(F)$ of rank $r$ is the final subgroup of a saturated flag having nonzero coefficient in a cycle of degree $r - 1$ in $Delta cal(A)_p \( L A \)$, then $tilde(H)_(*) \( Delta cal(A)_p \( G \) \; bb(Q) \) eq.not 0$.]
] <cor:maximal-family>

#proof[
  If $x in C_L \( A \)$ has order $p$ and $x in.not A$, then $D = chevron.l A \, x chevron.r$ is elementary abelian and strictly contains $A$. It normalizes $L$, has nontrivial intersection with $L$, and satisfies $L D = L A$. Thus it is a faithful configuration, so belongs to $cal(F)$ by the stated closure property. Its larger rank contradicts the choice of $r$. This proves condition (i) of Lemma 9. Every strict elementary overgroup of $A$ normalizes $L$, by the first part of Lemma 6; if it also satisfies the two conditions in (ii), it is a faithful configuration and again belongs to $cal(F)$, contradicting maximal rank. Thus (ii) holds, and the coefficient hypothesis is exactly (iii). ◻
]

For example, fix a nonempty collection of nonidentity elementary abelian subgroups of $L$, and take the configurations containing at least one of them. This family has the required closure property, and Lemma 4 proves its nonemptiness when $O_p \( G \) = 1$. If further restrictions are imposed on a family, its closure under qualifying overgroups must be verified as well. After constructing a cycle in $H = L A$, it is sufficient to find a supported subgroup $A' in cal(F)$ with $"rk" \( A' \) = r$ and $L A' = H$. These conditions ensure that the cycle lies in the required extension and that the maximality argument applies to its actual nonzero coefficient. No assertion that $r$ is the full $p$-rank of $H$ or of $G$ is needed.

== 4 Cycles from frames and a dimension estimate <sec:frames>

This section constructs a space of cycles from decompositions into lines. Its dimension must remain large when the dimension of the underlying space increases while the field stays fixed. The estimate concerns coefficients on subgroup flags, rather than the number of expressions of a chain as a sum of apartments. We first construct these coefficients and then estimate their dimension using a Lie superalgebra.

The proof has three stages. Boundary cancellation produces the cycles, and merger coefficients identify the space whose dimension must be estimated. The supporting-subspace grading then permits a PBW count without forgetting where a coefficient is supported. Finally, the relation kernel and its marked-factor inequality reduce the estimate to explicit plane counts. Each stage retains the actual flag coefficients needed in the later restriction and propagation arguments.

=== 4.1 Frames, sign flags, and the statement <frames-sign-flags-and-the-statement>

Fix one of the following structures:

+ vector spaces over $bb(F)_u$, with all lines allowed;
+ nondegenerate hermitian spaces over $bb(F)_(u^2)$, with all nondegenerate lines allowed;
+ nondegenerate symmetric spaces over $bb(F)_u$, where $u$ is odd, with both square classes of nondegenerate lines allowed;
+ nondegenerate symmetric spaces over $bb(F)_u$, where $u$ is odd, with only one specified square class of nondegenerate lines allowed.

All direct sums in a form space are required to be orthogonal. In the fourth case an admissible space means a space isometric to a sum of allowed lines. In the other cases every space with the indicated structure is admissible. A #emph[frame] of an admissible space $W$ is an unordered decomposition $cal(D) = { L_1 \, dots.h \, L_h }$ into allowed lines, where $h = dim W$. Write $frak(F) \( W \)$ for its set of frames. An ordered frame will also be called a word, and written $L_1 dots.h.c L_h$.

For any prime $p$, attach to a frame its abstract projective sign space

$ S \( cal(D) \) = bb(F)_p^(cal(D)) \/ chevron.l \( 1 \, dots.h \, 1 \) chevron.r . $

It is an elementary abelian group of rank $h - 1$. A partition $pi$ of $cal(D)$ specifies the subgroup on which the coordinates belonging to each block of $pi$ are equal. This subgroup has rank $\| pi \| - 1$. Two partitions give distinct subgroups: two coordinates belong to the same block precisely when their difference vanishes identically on the subgroup. For coordinates in distinct blocks, assign the values $0$ and $1$ to those blocks to distinguish them. This argument works also for $p = 2$ and survives the quotient by simultaneous signs.

We make the identifications between different frames explicit. Let $cal(D) \( W \)$ be the poset of decompositions of $W$ into at least two nonzero admissible subspaces. Put $cal(E) lt.eq cal(E)'$ when $cal(E)'$ refines $cal(E)$. Merging blocks in a frame therefore gives the same vertex whenever it gives the same decomposition of $W$. The flags from two blocks through a full frame have $h - 1$ vertices and dimension $h - 2$. At a fixed frame these are exactly the equal-sign flags just described.

In the hermitian case, this is the proper orthogonal-decomposition poset of #cite(label("PitermanWelker2024"), form: "prose") Sections 2.1 and 7.2, arXiv version 2, with the order reversed. Their Proposition 7.3(i) relates eigenspace decompositions to elementary subgroups and credits the corresponding construction of #cite(label("AschbacherSmith1993"), form: "prose") pp. 514–515. The partial-frame complex is a different object. Here the full coefficient space, and its dimension for each isometry type, are the objects required for the subsequent chain construction.

For an ordered frame $w = L_1 dots.h.c L_h$, let $r = h - 1$ and set $lambda_i = x_i - x_(i + 1)$ for $1 lt.eq i lt.eq r$. These functionals form a basis of $S \( cal(D) \)^(*)$. For $sigma in frak(S)_r$, put

$ K_j \( w \, sigma \) = ⋂_(a = 1)^j ker lambda_(sigma \( a \)) quad \( 0 lt.eq j lt.eq r \) \, #h(2em) K_0 \( w \, sigma \) = S \( cal(D) \) . $

The subgroups $K_j$ are also vertices of $cal(D) \( W \)$ when $j < r$. Define the coned apartment chain

#[#set math.equation(numbering: n => "(8)")
 $ a_w = sum_(sigma in frak(S)_r) "sgn" \( sigma \) \[ K_(r - 1) \( w \, sigma \) < dots.h.c < K_1 \( w \, sigma \) < S \( cal(D) \) \] in tilde(C)_(h - 2) \( cal(D) \( W \) \; bb(Q) \) . $ <eq:frame-apartment>]

In dimension one the same convention gives the empty simplex in degree $- 1$. This convention will occur only when describing a boundary of a two-dimensional frame.

Let $V_(cal(D))$ be the span of the actual flag-coefficient vectors of $a_w$ as $w$ runs over the orderings of $cal(D)$. Thus two linear combinations with identical coefficients define the same member of $V_(cal(D))$. We will prove that

#[#set math.equation(numbering: n => "(9)")
 $ dim V_(cal(D)) = \( h - 1 \) ! . $ <eq:local-frame-dimension>]

An assignment is a member of $xor.big_(cal(D) in frak(F) \( W \)) V_(cal(D))$. Summing its components embeds this direct sum into the chain space, since a full flag determines its top frame.

Here is the subspace of assignments that we use. Let $f$ be a $bb(Q)$-valued function on ordered frames. For every ordered decomposition

$ L_1 xor dots.h.c xor L_(i - 1) xor Q xor L_(i + 2) xor dots.h.c xor L_h = W \, #h(2em) dim Q = 2 \, $

with the other summands allowed lines, require

#[#set math.equation(numbering: n => "(10)")
 $ sum_(\( A \, B \) : thin Q = A xor B) f \( L_1 dots.h.c L_(i - 1) A B L_(i + 2) dots.h.c L_h \) = 0 . $ <eq:frame-plane-relation>]

The sum is over all ordered allowed frames of $Q$, with orthogonality understood in the form cases. Define $cal(Z) \( W \)$ to be the image of all these functions under $f mapsto sum_w f \( w \) a_w$, viewed as an assignment of actual coefficients. The following theorem is uniform in the isometry type of $W$.

#thm([Theorem 4.1.])[
  (Frame coefficient bound).  #emph[Let $W$ have dimension $h gt.eq 2$ and one of the four structures above, and suppose that $W$ admits an allowed frame. The space $cal(Z) \( W \) subset.eq xor.big_(cal(D) in frak(F) \( W \)) V_(cal(D))$ consists of cycles of degree $h - 2$, each supported on full flags ending at sign groups of rank $h - 1$. Moreover, 
#[#set math.equation(numbering: n => "(11)")
 $ dim cal(Z) \( W \) med gt.eq med F_h thin \| frak(F) \( W \) \| \( h - 1 \) ! . $ <eq:frame-bound>]

 The following choices of $F_h$ are valid for each individual isometry type of $W$.]
  + #emph[In the no-form case over $bb(F)_u$, and in the hermitian case over $bb(F)_(u^2)$, set 
$ rho = frac(1, u \( u + 1 \)) quad upright("and") quad rho = frac(1, u \( u - 1 \)) \, quad upright("respectively") \, #h(2em) y = frac(1 + sqrt(1 - 4 rho), 2) . $

 For $u gt.eq 5$ one may take $F_h = y^h + \( 1 - y \)^h gt.eq \( 17 \/ 25 \)^h$.]
  + #emph[For a symmetric space over $bb(F)_u$, with both line types allowed and $u gt.eq 5$ odd, put 
$ x = frac(1 + sqrt(1 - 4 u \/ \( u^2 - 1 \)), 2) . $

 One may take 
#[#set math.equation(numbering: n => "(12)")
 $ F_h = x^h + \( 1 - x \)^h - upright(bold(1))_(2 divides h) thin 2 \( u^2 - 1 \)^(- h \/ 2) med gt.eq med \( 17 \/ 25 \)^h . $ <eq:symmetric-frame-fraction>]

 In particular $F_3 gt.eq 3 \/ 8$.]
  + #emph[For a symmetric space over $bb(F)_u$ with one fixed line type, where $u gt.eq 7$ is odd, write $chi$ for the quadratic character of $bb(F)_u^times$ and set 
$ rho = frac(2, u - chi \( - 1 \)) \, #h(2em) y = frac(1 + sqrt(1 - 4 rho), 2) . $

 One may take $F_h = y^h + \( 1 - y \)^h > 0$.]
  #emph[The same statements hold for any realization by projective sign subgroups in which coarsened decompositions give the indicated subgroup flags and the complete flags ending at the full frames remain distinct.]
] <thm:frame-bound>

The last qualification states precisely what is required to carry the abstract construction into a group. Additional identifications of boundary faces cause no difficulty, because their coefficients already sum to zero. An identification of full flags could decrease the dimension; the applications will verify that this does not occur.

=== 4.2 Boundary cancellation and coefficient detection <boundary-cancellation-and-coefficient-detection>

We first address the cycle assertion, then turn to coefficient detection.

The distinction between simplex coefficients and their boundary sums is central to the constructible cycles of #cite(label("DiazRamos2018"), form: "prose") Proposition 4.2 and Definition 4.3, arXiv version 1 and to #cite(label("DiazRamosMazza2022"), form: "prose") Proposition 3.2 and Theorems 3.3–3.5. The plane relations below impose this distinction on frame flags.

For a word $w$ and a gap $i$, denote by $w \/ i$ the ordered decomposition obtained by replacing $L_i \, L_(i + 1)$ by their sum. The definition (8) applies to this shorter list of blocks as well. Deleting an interior vertex of an apartment flag has two contributions whose permutations differ by transposing the two equations on either side of that deletion. Their signs are opposite. This includes deletion of the bottom vertex: in that case one transposes the last imposed equation and the one omitted equation. Only deletion of the cone vertex $S \( cal(D) \)$ remains. Grouping its contributions according to the first equation imposed gives the exact formula

#[#set math.equation(numbering: n => "(13)")
 $ partial a_w = \( - 1 \)^(r - 1) sum_(i = 1)^r \( - 1 \)^(i - 1) a_(w \/ i) . $ <eq:frame-apartment-boundary>]

Indeed, moving gap $i$ to the first position contributes $\( - 1 \)^(i - 1)$, and deletion of the final vertex of an increasing flag contributes $\( - 1 \)^(r - 1)$. On $ker lambda_i$, the remaining equations are the adjacent-difference equations of $w \/ i$ in their original order. Formula (10) now cancels each term of (13) after summing with the weights $f \( w \)$. If different coarsening descriptions give the same face, this only adds several zero sums. Consequently every member of $cal(Z) \( W \)$ is a cycle, including the augmented degree-zero assertion when $h = 2$.

To determine the rank of the coefficient map, regard a line as a formal letter of odd parity. If homogeneous words or brackets $A \, B$ have parities $\| A \| \, \| B \| in bb(Z) \/ 2$, their supercommutator is

#[#set math.equation(numbering: n => "(14)")
 $ \[ A \, B \] = A B - \( - 1 \)^(\| A \| \| B \|) B A . $ <eq:frame-superbracket>]

In particular $\[ L \, M \] = L M + M L$ for two line letters. A binary merger tree on a frame defines an iterated bracket by choosing an order for the two children of each internal vertex and using (14). The parity of a subtree is its number of leaves modulo two.

This tree description is closely related to the multilinear super-Lie model of #cite(label("Robinson2004"), form: "prose") Proposition 3.4, Corollary 3.5, and Section 3.6; see also #cite(label("Stanley1982"), form: "prose") Theorem 7.3 for the partition representation. We prove the coefficient formula with our coning and orientation conventions. In particular, the chains here have degree $h - 2$, whereas the proper partition complex with both endpoints removed has degree $h - 3$.

#thm([Lemma 4.2.])[
  (Merger coefficients).  #emph[For a full flag in $cal(D) \( W \)$ ending at a frame $cal(D)$, complete its sequence of binary mergers by the final, implicit merger to the one-block partition. Its coefficient in $sum_w f \( w \) a_w$ is, up to one sign depending on the flag and the chosen child orders, the evaluation of $f$ on the associated iterated superbracket. All iterated brackets on the letters of $cal(D)$ occur in this way. Their span has dimension $\( h - 1 \) !$.]
] <lem:merger-coefficients>

#proof[
  The words contributing to a specified flag are exactly the orders of the leaves in which the leaves below every internal vertex form an interval. For each such word there is a unique order of the adjacent gaps giving the specified mergers, including the final omitted gap. Choose one compatible order of the leaves. Every other compatible order is obtained by independently interchanging the two child intervals at internal vertices.
  Suppose those intervals have $a$ and $b$ leaves. There are $a - 1$ gaps internal to the first interval and $b - 1$ internal to the second, besides their separating gap. Interchanging the intervals permutes their internal gaps past each other and moves the separating gap past both sets. The resulting sign is
  $ \( - 1 \)^(\( a - 1 \) \( b - 1 \) + \( a - 1 \) + \( b - 1 \)) = \( - 1 \)^(a b - 1) = - \( - 1 \)^(a b) . $
  This is exactly the change prescribed by the two terms of $\[ A \, B \]$. Expanding the bracket recursively therefore gives the coefficient of the flag, with the sign of the initially chosen word as a common factor. Every binary tree admits an order of its internal vertices in which children precede parents. Such an order gives a full flag of mergers, so every bracket occurs.
  Fix one letter $L_0$. Super skew-symmetry and the super Jacobi identity
  #[#set math.equation(numbering: n => "(15)")
   $ \[ X \, \[ Y \, Z \] \] = \[ \[ X \, Y \] \, Z \] + \( - 1 \)^(\| X \| \| Y \|) \[ Y \, \[ X \, Z \] \] $ <eq:frame-jacobi>]
  span every bracket by left combs
  $ \[ dots.h.c \[ \[ L_0 \, L_(i_2) \] \, L_(i_3) \] \, dots.h \, L_(i_h) \] \, $
  where $\( i_2 \, dots.h \, i_h \)$ orders the other letters. To see the spanning assertion inductively, first use skew-symmetry to place the subtree containing $L_0$ on the left. Expand that subtree by induction. Applying (15) repeatedly to any nontrivial right subtree replaces it by brackets with smaller right subtrees. Continue until only single letters are appended; skew-symmetry puts the term containing $L_0$ on the left whenever necessary. There are $\( h - 1 \) !$ such combs. Each comb has exactly one associative word beginning with $L_0$, namely $L_0 L_(i_2) dots.h.c L_(i_h)$, with coefficient $1$. This follows by induction from (14): the term with the newly appended letter first cannot start with $L_0$. Distinct combs have distinct such words, proving their independence. The coefficient functionals of the full flags span precisely this bracket space. Their rank, and hence $dim V_(cal(D))$, is $\( h - 1 \) !$. ◻
]

Figure 1 illustrates a merger flag and its coefficient bracket for four lines.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$[[a,b],[c,d]]$]])
  content((-1.45, -1), [#text(size: 9pt)[$[a,b]$]])
  content((1.45, -1), [#text(size: 9pt)[$[c,d]$]])
  content((-2, -2), [#text(size: 9pt)[$a$]])
  content((-0.9, -2), [#text(size: 9pt)[$b$]])
  content((0.9, -2), [#text(size: 9pt)[$c$]])
  content((2, -2), [#text(size: 9pt)[$d$]])
  line((-0.4109, -0.2834), (-1.039, -0.7166), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.606, -1.283), (-1.894, -1.807), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.894, -1.807), (-1.606, -1.283), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1.294, -1.283), (-1.029, -1.765), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.7943, -1.765), (-0.1275, -0.2834), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.4109, -0.2834), (1.039, -0.7166), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.294, -1.283), (1.006, -1.807), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.006, -1.807), (1.294, -1.283), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.606, -1.283), (1.871, -1.765), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, -1), [#text(size: 9pt)[$a divides b divides c divides d$\(rank $3$\)#linebreak() $"ab" divides c divides d$\(rank $2$\)#linebreak() $"ab" divides "cd"$\(rank $1$\)#linebreak() $"abcd"$\(implicit final merger\)]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A full flag of projective sign groups records binary mergers. The left tree determines its coefficient functional. The two children at the root each have even parity, so interchanging them changes its sign. Interchanging the two leaves of either bottom pair does not. The list is in merger order; the oriented subgroup flag has increasing ranks $1 \, 2 \, 3$, with the implicit one-block merger omitted. ],
) <fig:merger-tree>

The remaining task is quantitative. Plane relations connect different frames, so the local dimension $\( h - 1 \) !$ does not by itself give a lower bound on the space of cycles. We encode all these relations at once, while retaining enough information to distinguish every supporting subspace.

=== 4.3 The supporting-subspace grading and PBW <the-supporting-subspace-grading-and-pbw>

Fix a finite ambient space $W_0$ of one of the permitted structures. Form a commutative monoid with elements $0$, all its nonzero admissible subspaces, and an additional element $tack.t$. For admissible subspaces $A \, B$, their sum in this monoid is the subspace $A xor B$ if they form an allowed direct decomposition, and is $tack.t$ otherwise. Set $tack.t + A = tack.t$, with $0$ an identity. This operation is associative: an iterated product avoids $tack.t$ precisely when all its nonzero subspaces form a direct decomposition, orthogonal when required. Once directness or orthogonality fails, adjoining another summand cannot restore it. We call degrees other than $tack.t$ #emph[good degrees].

Let $V$ be the rational vector space with one odd generator $e_L$ for each allowed line $L lt.eq W_0$, and give $e_L$ degree $L$. Also retain the usual word-length grading. In the tensor algebra $T \( V \)$, a word has good degree $X$ exactly when its letters are an ordered frame of $X$; its length is then $dim X$. For each admissible plane $Q lt.eq W_0$ define

#[#set math.equation(numbering: n => "(16)")
 $ r_Q = sum_(\( A \, B \) : thin Q = A xor B) e_A e_B = sum_({ A \, B } : thin Q = A xor B) \[ e_A \, e_B \] . $ <eq:frame-rq>]

The second sum is over unordered frames and is independent of their ordering, because the two generators are odd. Each $r_Q$ is nonzero, even, and homogeneous of good degree $Q$ and length $2$.

Let $frak(L)$ be the free Lie superalgebra on $V$, and let

$ P = frak(L) \/ \( r_Q : Q upright(" an admissible plane") \)_("Lie") \, #h(2em) U = T \( V \) \/ \( r_Q : Q upright(" an admissible plane") \)_(upright("ass")) . $

The subscripts mean the Lie ideal and the two-sided associative ideal, respectively. The universal properties show that $U$ is the enveloping algebra of $P$: an associative-algebra map out of either presentation is exactly a map on the line generators annihilating every $r_Q$.

We use the characteristic-zero super PBW theorem #cite(label("Scheunert1979")); the positive word-length graded form over $bb(Q)$ is also given by #cite(label("MilnorMoore1965"), form: "prose") discussion following Proposition 5.2 and Theorem 5.16. We use it in the following explicit form. For a homogeneous ordered basis of a Lie superalgebra, its enveloping algebra has as a basis the ordered products of basis elements, with each odd basis element used at most once. Its associated graded algebra for the number-of-factors filtration is $"Sym" \( P_(upright("even")) \) ⊗ and.big \( P_(upright("odd")) \)$. The canonical map from the Lie superalgebra to its enveloping algebra is consequently injective. Recall why the parity qualification is necessary: the relation for homogeneous elements is $x y - \( - 1 \)^(\| x \| \| y \|) y x = \[ x \, y \]$, and for odd $x$ it becomes $2 x^2 = \[ x \, x \]$. Ordering adjacent factors and replacing odd squares therefore gives the stated normal forms. The overlap of three successive factors reduces to

$ \[ x \, \[ y \, z \] \] - \[ \[ x \, y \] \, z \] - \( - 1 \)^(\| x \| \| y \|) \[ y \, \[ x \, z \] \] = 0 \; $

the overlaps with repeated odd factors are its specializations, using $2 x^2 = \[ x \, x \]$ and $\[ x \, \[ x \, x \] \] = 0$. Thus these reductions are consistent by super Jacobi. Induction on factor length and then on the number of out-of-order pairs gives the PBW normal forms. This description also shows that PBW preserves any additional grading for which the bracket is homogeneous, including the supporting-subspace and length gradings above.

Write $P \( X \)$ and $U \( X \)$ for the good components on a subspace $X$. These are finite-dimensional and intrinsic to $X$. Indeed, a product of good degree $X$ uses only supports contained in $X$; an expression of bad degree can never contribute to it. Thus neither generators nor relations supported outside $X$ affect that component. We may therefore form these spaces in any ambient space containing $X$.

In a good PBW monomial, the supports of its nonzero factors are independent admissible subspaces. In particular no basis factor can occur twice, even when it is even. The distinction between symmetric and exterior multiplication changes signs but does not change the number of such monomials. We have proved a vector-space decomposition in good degree:

#[#set math.equation(numbering: n => "(17)")
 $ U \( X \) med tilde.equiv med xor.big_(k gt.eq 0) med xor.big_(X = X_1 xor dots.h.c xor X_k thin \/ thin frak(S)_k) P \( X_1 \) ⊗ dots.h.c ⊗ P \( X_k \) \, $ <eq:frame-pbw-decomposition>]

where all $X_i$ are nonzero, and the tensor factors on the right may be ordered by any fixed order of their supports. The term $k = 0$ occurs only for $X = 0$.

#thm([Lemma 4.3.])[
  (Identification with coefficient assignments).  #emph[For every admissible $W$ of dimension at least two, the coefficient construction has image of dimension $dim P \( W \)$: 
$ dim cal(Z) \( W \) = dim P \( W \) . $

]
] <lem:frame-lie-identification>

#proof[
  The good component $T \( V \) \( W \)$ has the ordered frames as its basis. The component of its defining ideal is spanned by all expressions $a r_Q b$ of good degree $W$, where $a \, b$ are words. Being good forces the outside letters and the plane $Q$ to form a direct decomposition. Consequently their annihilator is exactly the space of functions satisfying (10). That space is $U \( W \)^(*)$.
  The good component of the free Lie superalgebra is spanned by brackets whose letters form a frame: any other support is bad. Its image in $U \( W \)$ is $P \( W \)$, by PBW injectivity. By Lemma 12, the coefficient functionals of all the full flags are precisely, up to signs and possible repetitions, the evaluations on these brackets. They span $P \( W \)$. Restriction of functionals $U \( W \)^(*) arrow.r P \( W \)^(*)$ is surjective, because these spaces are finite-dimensional. The rank of the actual coefficient map is therefore $dim P \( W \)$, as asserted. ◻
]

=== 4.4 Normalized series and the relation kernel <normalized-series-and-the-relation-kernel>

We now use formal series to count the good components in all dimensions. Let $G_X$ be the full linear group of $X$ in the no-form case and the full isometry group in the form cases, with $\| G_0 \| = 1$. For any isometry-invariant collection $M \( X \)$ of finite-dimensional vector spaces, define

$ sans(M) = sum_(\[ X \]) frac(dim M \( X \), \| G_X \|) thin \[ X \] . $

Here $\[ X \]$ is a formal symbol for its isomorphism or isometry type, and $\[ X \] \[ Y \] = \[ X xor Y \]$. Series are completed by dimension, so each coefficient in a product is a finite sum. The coefficientwise order always refers to this type basis. If

$ \( M * N \) \( W \) = xor.big_(W = A xor B) M \( A \) ⊗ N \( B \) \, $

then its series is $sans(M) sans(N)$. To verify this, for specified types $A \, B$ the group $G_W$ acts transitively on the ordered decompositions of these types, with stabilizer $G_A times G_B$. Transitivity follows by taking the direct sum of chosen isomorphisms or isometries on the summands. The number of decompositions is $\| G_W \| \/ \( \| G_A \| \| G_B \| \)$, which is exactly the normalization asserted.

Write $sans(P) \, sans(U)$ for the series of $P \, U$. Dividing the ordered versions of (17) by $k !$ gives

#[#set math.equation(numbering: n => "(18)")
 $ sans(U) = exp \( sans(P) \) . $ <eq:frame-exponential>]

There is no stabilizer correction beyond $k !$: the actual nonzero summands of a direct decomposition are distinct, even if some of their isometry types agree. An ordering of a decomposition therefore has exactly $k !$ possibilities.

Let $R$ be the vector space with one formal even basis element $upright(bold(r))_Q$ for each admissible plane $Q$, of degree $Q$. Denote the series of $V$ and $R$ by $v$ and $w$, respectively. Split each relation just before its last letter to define the left $U$-module map

$ d_2 : U ⊗ R arrow.r U ⊗ V \, #h(2em) d_2 \( u ⊗ upright(bold(r))_Q \) = sum_(\( A \, B \) : Q = A xor B) u e_A ⊗ e_B . $

Let $d_1 : U ⊗ V arrow.r U$ be multiplication and put $C = ker d_2$. We have an exact sequence

#[#set math.equation(numbering: n => "(19)")
 $ 0 arrow.r C arrow.r U ⊗ R arrow.r^(d_2) U ⊗ V arrow.r^(d_1) U arrow.r bb(Q) arrow.r 0 . $ <eq:frame-relation-complex>]

Here is the only exactness assertion needing verification. Write $T = T \( V \)$ and let $I$ be the two-sided ideal generated by the $r_Q$. Splitting the last letter identifies $T_(+)$ with $T ⊗ V$ and $U ⊗ V$ with $T_(+) \/ \( I V \)$. Hence the kernel of $d_1$ identifies with $I \/ \( I V \)$. Every element of $I$ is a sum of terms $a r_Q b$. When $b$ has positive length this term lies in $I V$, by separating the last letter of $b$. The terms with $b = 1$ are exactly the images of $d_2$. This proves exactness; $d_1$ plainly has image the augmentation ideal. These maps preserve the supporting-subspace grading, so exactness holds in every good component.

Taking dimensions of (19) and normalizing as above gives, with $sans(C)$ the series of the good components of $C$,

#[#set math.equation(numbering: n => "(20)")
 $ sans(U) \( 1 - v + w \) = 1 + sans(C) . $ <eq:frame-euler>]

This identity uses no assumption that the relations form a regular sequence. The possible dependencies between relations are recorded by the actual kernel $C$.

Define the degree operator $D$ on series by $D \[ X \] = \( dim X \) \[ X \]$. It is a derivation because dimensions add under direct sum. The next inequality is the step that turns the associative presentation into a bound on its Lie part.

The generator–relation series comparison has its classical antecedent in #cite(label("GolodShafarevich1964"), form: "prose") Section 2, Lemmas 2–3. For the present coefficientwise bound, the actual kernel $C$ must remain in the calculation. The following marked-factor argument is what permits the later logarithmic comparison.

#thm([Lemma 4.4.])[
  (Marked-factor inequality).  #emph[The nonnegative series above satisfy 
#[#set math.equation(numbering: n => "(21)")
 $ D sans(C) med gt.eq med \( D sans(P) \) sans(C) $ <eq:frame-marked-factor>]

 coefficientwise in every isometry type.]
] <lem:frame-marked-factor>

#proof[
  Give $U ⊗ R$ the PBW filtration on its $U$ factor and give $C$ the induced filtration. Since $C$ is a left $U$-submodule, its associated graded space is a submodule
  $ "gr" C med subset.eq med "Sym"_(upright("super")) \( P \) ⊗ R . $
  The injection follows directly from using the induced filtration: if an element of $C$ has lower filtration degree in the larger module, it has that same lower degree in $C$. The total dimension of a good component is unchanged by passage to the associated graded. This uses the induced filtration on $C$; no filteredness or strictness of $d_2$ is required.
  Fix a target space $W_0$. Choose homogeneous bases of $P \( A \)$ for every nonzero admissible $A lt.eq W_0$, and use the fixed labels $upright(bold(r))_Q$ for the relations. There are finitely many such basis vectors. Order the labels and choose one multiplicative monomial order on all the basis vectors just chosen. A module monomial is a supercommutative monomial followed by a relation label. Compare its label first and then its monomial; ignore nonzero scalar signs. Use the induced order in every supporting-subspace component. Row reduction shows that the dimension of $"gr" C \( B \)$ equals the number of distinct leading module monomials of its nonzero elements. Denote this set by $cal(I) \( B \)$.
  Consider a decomposition $W_0 = A xor B$, a basis vector $p in P \( A \)$, and $m in cal(I) \( B \)$. Choose an element with leading monomial $m$. Every term of that element has total supporting subspace $B$. Multiplication by $p$ therefore gives nonzero good monomials, all distinct: no factor supported in $B$ can equal $p$, and the new support $A$ is independent of every support in $B$. In particular, exterior multiplication by an odd $p$ kills none of the terms. Multiplicativity of the monomial order implies that $p m$ is a leading monomial in $cal(I) \( W_0 \)$.
  Mark this appended factor $p$ and attach weight $dim A$ to the mark. The marked output recovers the input: $p$ determines $A$, and removing it recovers $m$; the supports of the remaining factors together with the relation label recover $B$. For a fixed unmarked output, the supports of all its factors are pairwise independent, and the relation label itself occupies another summand of dimension two. The sum of the dimensions of all factors that could have been marked is thus at most $dim W_0$. Counting these weighted marks gives
  $ sum_(W_0 = A xor B) \( dim A \) dim P \( A \) dim C \( B \) lt.eq \( dim W_0 \) dim C \( W_0 \) . $
  Divide by $\| G_(W_0) \|$ and use the transitive-decomposition count. This is (21) for the type of $W_0$. ◻
]

We now return to the dimension bound. The remaining steps are a series comparison and the evaluation of its constants.

Set $J = - log \( 1 - v + w \)$, a well-defined formal series with zero constant term. From (18) and (20), formal differentiation gives

$ \( 1 + sans(C) \) D sans(P) = \( 1 + sans(C) \) D J + D sans(C) . $

Subtract $sans(C) D sans(P)$ and apply Lemma 14. If $D J$ is coefficientwise nonnegative, then

#[#set math.equation(numbering: n => "(22)")
 $ D sans(P) = \( 1 + sans(C) \) D J + #scale(x: 120%, y: 120%)[\(] D sans(C) - sans(C) D sans(P) #scale(x: 120%, y: 120%)[\)] med gt.eq med \( 1 + sans(C) \) D J med gt.eq med D J . $ <eq:frame-log-bound>]

No division by a series with unknown coefficient signs is used here. It remains to compute $D J$ and compare its coefficients with the number of frames.

=== 4.5 Plane counts and constants <plane-counts-and-constants>

Write $"coeff"_(\[ W \]) \( B \)$ for the coefficient of the type $\[ W \]$ in a series $B$. In dimension $h$, the frame count gives

#[#set math.equation(numbering: n => "(23)")
 $ "coeff"_(\[ W \]) \( v^h \) = frac(h ! thin \| frak(F) \( W \) \|, \| G_W \|) . $ <eq:frame-count-normalization>]

Thus, if the degree-$h$ part of $D J$ is at least $F_h v^h$ coefficientwise, (22) yields

$ dim P \( W \) gt.eq frac(\| G_W \|, h) "coeff"_(\[ W \]) \( D J \) gt.eq F_h thin \| frak(F) \( W \) \| \( h - 1 \) ! . $

Lemma 13 will then give the theorem.

First suppose that only one line type is allowed and that there is one resulting admissible type in each dimension. This includes the no-form and hermitian cases. Use a variable $t$ for the line type. Then $v = alpha t$, $w = beta t^2$, where $alpha = \| G_(upright("line")) \|^(- 1)$ and $beta = \| G_(upright("plane")) \|^(- 1)$. The quotient

$ rho = beta / alpha^2 $

is the reciprocal of the number of ordered allowed frames of an admissible plane, by the decomposition count already proved. When $rho lt.eq 1 \/ 4$, set $y = \( 1 + sqrt(1 - 4 rho) \) \/ 2$. Factoring $1 - v + w = \( 1 - y v \) \( 1 - \( 1 - y \) v \)$ gives

#[#set math.equation(numbering: n => "(24)")
 $ D J = sum_(h gt.eq 1) #scale(x: 120%, y: 120%)[\(] y^h + \( 1 - y \)^h #scale(x: 120%, y: 120%)[\)] v^h . $ <eq:frame-two-roots>]

All its coefficients are positive, including the double-root case $y = 1 \/ 2$.

In a two-dimensional space over $bb(F)_u$ without a form there are $u + 1$ possible first lines, and $u$ complementary second lines, so there are $u \( u + 1 \)$ ordered frames. In a hermitian plane over $bb(F)_(u^2)$ there are $u^2 + 1$ lines, of which $u + 1$ are isotropic. For completeness, in an orthonormal basis an isotropic line has a representative $\( a \, 1 \)$ with $a^(u + 1) = - 1$; the norm map has $u + 1$ elements in each nonzero fiber. The other $u \( u - 1 \)$ lines are nondegenerate, each with its unique orthogonal complement. These are therefore the respective ordered frame counts. For $u gt.eq 5$ both reciprocal counts are at most $1 \/ 20$. It follows that $y gt.eq \( 1 + sqrt(4 \/ 5) \) \/ 2 > 17 \/ 25$, proving the asserted uniform bound in these two cases.

We record also the orthogonal plane count with its dependence on determinant. A plane with diagonal form $"diag" \( a \, b \)$ has

#[#set math.equation(numbering: n => "(25)")
 $ \| G_Q \| = 2 #scale(x: 120%, y: 120%)[\(] u - chi \( - a b \) #scale(x: 120%, y: 120%)[\)] . $ <eq:orthogonal-plane-order>]

Indeed, the number of vectors of norm $a$ is the number of solutions of $x^2 + \( b \/ a \) y^2 = 1$, namely $u - chi \( - a b \)$. One way to verify this count is to use $sum_(y in bb(F)_u) chi \( y^2 - c \) = - 1$ for $c eq.not 0$. The latter identity follows by counting $\( y \, z \)$ with $y^2 - z^2 = c$: the invertible change of variables $\( y \, z \) mapsto \( y - z \, y + z \)$ identifies these solutions with the $u - 1$ pairs of nonzero elements having product $c$. For each first vector of norm $a$, its orthogonal line has the square class of $b$, since the determinant of the form changes by a square under a change of basis. There are exactly two vectors of norm $b$ on that line. Ordered orthogonal bases with norms $\( a \, b \)$ are acted on freely and transitively by $G_Q$, giving (25).

For the same fixed norm type on both lines, $a b$ is a square and an ordered line-frame stabilizer has order $2 dot.op 2 = 4$. Hence the number of ordered allowed frames is

$ frac(u - chi \( - 1 \), 2) . $

This is at least $4$ for every odd prime power $u gt.eq 7$: it is $4$ at $u = 7$ and is at least $\( u - 1 \) \/ 2 gt.eq 4$ for $u gt.eq 9$. Formula (24) therefore applies with $rho = 2 \/ \( u - chi \( - 1 \) \) lt.eq 1 \/ 4$, proving the one-type assertion.

Finally allow both symmetric line types. The determinant square class is multiplicative under orthogonal direct sum. Write $z$ for the nonsquare class, with $z^2 = 1$, and let $t$ record dimension. Every nondegenerate symmetric space of positive dimension over an odd finite field is determined by its dimension and determinant square class. Each line has isometry group of order $2$. Formula (25) consequently gives

#[#set math.equation(numbering: n => "(26)")
 $ v = frac(1 + z, 2) thin t \, #h(2em) w = \( a + b z \) t^2 \, #h(2em) { a \, b } = {frac(1, 2 \( u - 1 \)) \, frac(1, 2 \( u + 1 \))} . $ <eq:frame-discriminant-series>]

Which of $a \, b$ occurs at determinant square depends only on $chi \( - 1 \)$; the bound will be valid for either order.

Evaluation at $z = 1$ gives $v = t$ and $w = u t^2 \/ \( u^2 - 1 \)$. Since $u \/ \( u^2 - 1 \) < 1 \/ 4$ for $u gt.eq 5$, the two-root computation gives

$ \[ t^h \] D J \|_(z = 1) = A_h := x^h + \( 1 - x \)^h \, #h(2em) x = frac(1 + sqrt(1 - 4 u \/ \( u^2 - 1 \)), 2) . $

At $z = - 1$ we have $v = 0$ and $w = epsilon t^2 \/ \( u^2 - 1 \)$ for $epsilon in { 1 \, - 1 }$. Expanding $- log \( 1 + w \)$ therefore gives

$ B_h := \[ t^h \] D J \|_(z = - 1) = 0 quad \( h upright(" odd") \) \, #h(2em) \| B_h \| = 2 \( u^2 - 1 \)^(- h \/ 2) quad \( h upright(" even") \) . $

The two actual determinant coefficients of $\[ t^h \] D J$ are $\( A_h + B_h \) \/ 2$ and $\( A_h - B_h \) \/ 2$. On the other hand $v^h = \( 1 + z \) t^h \/ 2$ for every $h gt.eq 1$. Thus each determinant coefficient of $D J$ is at least the corresponding coefficient of $F_h v^h$, where $F_h$ is (12). In particular this calculation keeps both types separately throughout the comparison.

We finish by proving positivity and the uniform numerical assertions. The function $u \/ \( u^2 - 1 \)$ decreases for $u > 1$, so $x$ increases with $u$. For each integer $h gt.eq 1$, the function $s^h + \( 1 - s \)^h$ is nondecreasing on $1 \/ 2 lt.eq s lt.eq 1$; its derivative is $h \( s^(h - 1) - \( 1 - s \)^(h - 1) \) gt.eq 0$. The subtracted even-degree correction also decreases with $u$. It suffices, therefore, to use $u = 5$. Here

$ x = frac(1 + 1 \/ sqrt(6), 2) > 7 / 10 . $

For odd $h$, $F_h gt.eq x^h > \( 17 \/ 25 \)^h$. At $h = 2$ a direct calculation gives $F_2 = 1 \/ 2 > \( 17 \/ 25 \)^2$. For even $h gt.eq 4$,

$ frac(2 dot.op 24^(- h \/ 2), \( 7 \/ 10 \)^h) = 2 (25 / 294)^(h \/ 2) lt.eq 2 (25 / 294)^2 < 1 / 50 . $

Consequently

$ F_h > 49 / 50 (7 / 10)^h > (17 / 25)^h . $

For the last inequality, divide by $\( 7 \/ 10 \)^h$ and use $\( 34 \/ 35 \)^h lt.eq \( 34 \/ 35 \)^4 < 49 \/ 50$. Finally

$ F_3 = x^3 + \( 1 - x \)^3 = 1 - frac(3 u, u^2 - 1) gt.eq 1 - 15 / 24 = 3 / 8 . $

These inequalities also prove that every coefficient of $D J$ used above is nonnegative. Applying (22), (23), and Lemma 13 proves Theorem 11 in all four cases.

#prodef([Remark 4.5.])[
  The coefficient description gives a useful relation at every bottom pair of a merger tree. Fix all other leaves and the surrounding brackets. Replacing the bracket $\[ e_A \, e_B \]$ by the sum of these brackets over the unordered frames of the same plane gives zero in $P$, by (16). Every functional representing a member of $cal(Z) \( W \)$ therefore satisfies this relation on the actual tree coefficients. For example, when $u = 5$, a plane with square determinant has exactly one unordered frame of each homogeneous color, and a plane with nonsquare determinant has three unordered mixed frames. These counts follow from (25): the respective group orders are $8$ and $12$, and an ordered line-frame stabilizer has order $4$. For a homogeneous color one divides its two ordered frames by $2$; for a mixed frame the two possible orders have different color patterns. Thus the bottom-pair relation has respectively two and three unordered terms. This observation will allow coefficients on specified color counts to be detected later.
] <rem:frame-cherry>

== 5 Decorations and restriction of cycles <sec:chains>

The frame construction produces cycles whose terms end at projective sign groups. The applications require two further operations. First, we adjoin commuting elementary generators and cancel the additional boundary faces. Second, we pass from a group of automorphisms to a specified subgroup while retaining a nonzero full-flag coefficient. Both operations concern actual coefficients of simplices. In particular, parameters describing different apartments are not counted as independent unless their images in the chain group are independent.

The use of coefficient equations to cancel faces is shared with the constructible and admissible cycle methods of #cite(label("DiazRamos2018"), form: "prose") #cite(label("DiazRamosMazza2022"), form: "prose"). Here we state the required injectivity separately and verify it in each group application; the decoration counts alone do not provide it.

=== 5.1 Split chains and their boundary <split-chains-and-their-boundary>

Write $tilde(C)_(*) \( P \)$ for the augmented rational chain complex of a finite poset $P$, with increasing order as the orientation of every simplex. Let $S$ and $D$ be commuting elementary abelian $p$-subgroups of a finite group $M$, and suppose $S ∩ D = 1$. Given flags

$ u = \[ U_1 < dots.h.c < U_a \] \, #h(2em) v = \[ V_1 < dots.h.c < V_b \] $

in $S$ and $D$, respectively, put $U_0 = V_0 = 1$. An $\( a \, b \)$-shuffle is a path $gamma$ from $\( 0 \, 0 \)$ to $\( a \, b \)$ whose steps are $\( 1 \, 0 \)$ or $\( 0 \, 1 \)$. Write $\( i_k \, j_k \)$ for its vertex after $k$ steps, and let $nu \( gamma \)$ count pairs consisting of a $D$-step followed later by an $S$-step. Define

#[#set math.equation(numbering: n => "(27)")
 $ u times.square v = sum_gamma \( - 1 \)^(nu \( gamma \)) \[ U_(i_1) V_(j_1) < dots.h.c < U_(i_(a + b)) V_(j_(a + b)) \] . $ <eq:chain-split-shuffle>]

Each displayed inclusion is strict, because the two factors have trivial intersection. The origin is omitted. Empty flags are allowed: if $a = 0$ or $b = 0$, there is one path and this construction is the identity on the other flag. Extend (27) bilinearly to chains. A chain of degree $a - 1$ and a chain of degree $b - 1$ give a chain of degree $a + b - 1$.

This is the product shuffle of Lemma 8, specialized to elementary groups. That lemma gives

#[#set math.equation(numbering: n => "(28)")
 $ partial \( u times.square v \) = \( partial u \) times.square v + \( - 1 \)^a u times.square \( partial v \) . $ <eq:chain-shuffle-boundary>]

Here and below the empty simplex has degree $- 1$ and zero boundary. Iterating the construction gives the sum over paths with any fixed number of kinds of steps. Its sign counts inversions between the ordered kinds, so the iteration is associative.

Suppose that $D = D_1 times dots.h.c times D_t$, where the $D_i$ are labelled subgroups of order $p$. Its coordinate apartment, coned at $D$, is the chain

#[#set math.equation(numbering: n => "(29)")
 $ a \( D_1 \, dots.h \, D_t \) = sum_(pi in frak(S)_t) "sgn" \( pi \) \[ D_(pi \( 1 \)) < D_(pi \( 1 \)) D_(pi \( 2 \)) < dots.h.c < D \] . $ <eq:chain-decoration-apartment>]

Set $a \( diameter \) = \[ thin \]$. Interior faces cancel in pairs, and the remaining faces give the exact formula

#[#set math.equation(numbering: n => "(30)")
 $ partial a \( D_1 \, dots.h \, D_t \) = sum_(i = 1)^t \( - 1 \)^(i - 1) a \( D_1 \, dots.h \, hat(D)_i \, dots.h \, D_t \) . $ <eq:chain-decoration-boundary>]

For example, when $t = 2$ the boundary is $\[ D_2 \] - \[ D_1 \]$. If $x$ is a coned apartment in $S$, then $x times.square a \( D_1 \, dots.h \, D_t \)$ is the apartment for the union of its basis with the decoration basis, up to the fixed choice of orientation of $x$. More generally, (27) defines this operation on the #emph[coefficients] of any chain $x$, without choosing an expression of $x$ as a sum of apartments.

=== 5.2 The coefficient spaces to be counted <the-coefficient-spaces-to-be-counted>

Fix an integer $h gt.eq 2$, and put

$ r = h - 1 \, #h(2em) q_h = \( h - 1 \) ! . $

A frame $cal(F)$ with $h$ summands has a projective sign group $S_(cal(F))$ of rank $r$. Denote by $V_(cal(F))$ the space of actual coned frame-chain coefficients at $S_(cal(F))$ from Section 4. Thus $V_(cal(F))$ is a subspace of the chain group on full flags ending at $S_(cal(F))$, every member has no boundary face retaining $S_(cal(F))$, and

#[#set math.equation(numbering: n => "(31)")
 $ dim V_(cal(F)) lt.eq q_h . $ <eq:chain-local-dimension>]

In the abstract frame model equality holds. The inequality is the only local bound needed here.

The precise output we use from Theorem 11 is the following. For the set $frak(F)$ of all allowed frames of one of the spaces specified there, it provides a subspace

#[#set math.equation(numbering: n => "(32)")
 $ Z med subset.eq med xor.big_(cal(F) in frak(F)) V_(cal(F)) \, #h(2em) dim Z gt.eq F thin \| frak(F) \| q_h \, #h(2em) sum_(cal(F) in frak(F)) partial x_(cal(F)) = 0 quad \( x in Z \) . $ <eq:chain-frame-input>]

The last equality uses the coarsening identifications of that theorem. Whenever the frame model is realized by elementary subgroups, we require these identifications to be valid subgroup identifications. A disjoint union of compatible spaces is also allowed, provided the same lower bound $F$ holds for every space. The direct sum of their spaces $Z$ then satisfies the same estimate. For example, the all-type estimates with field parameter at least five permit $F = \( 17 \/ 25 \)^h$; for symmetric $h = 3$ they permit $F = 3 \/ 8$.

Equation (32) counts the image on coned flag coefficients, not the dimension of the word functions that produce it. It still retains the frame labels in the direct sum. If different full data can give the same subgroup flag after decorations are adjoined, their possible coincidence must be checked separately. The next lemma states this last requirement as an injectivity hypothesis.

#thm([Lemma 5.1.])[
  (Ordinary decorations).  #emph[Let $M$ be a finite group, let $p$ be a prime, and let $h gt.eq 2$ and $t gt.eq 0$. Consider a finite nonempty set $cal(X)$ of data 
$ \( cal(F) \, delta \) \, #h(2em) delta = \( D_1 \, dots.h \, D_t \) \, $

 where $S_(cal(F)) lt.eq M$ is a projective sign group of rank $r = h - 1$, the labelled $D_i lt.eq M$ have order $p$, and 
$ E_(cal(F) \, delta) = S_(cal(F)) times D_1 times dots.h.c times D_t $

 is an internal direct product. Suppose the following hold.]
  + #emph[The local coefficient space $V_(cal(F))$ satisfies (31) and is the same whenever the same frame occurs with different decorations. For each fixed tuple $delta$, its compatible frames form a set $frak(F)_delta$ with a subspace $Z_delta$ satisfying (32), with a common real number $F > 0$. The boundary equality remains valid in the subgroup poset of $M$.]
  + #emph[Put $cal(Z) = xor.big_delta Z_delta$. The linear map 
#[#set math.equation(numbering: n => "(33)")
 $ Phi : cal(Z) arrow.r tilde(C)_(r + t - 1) \( cal(A)_p \( M \) \) \, #h(2em) Phi \( x \) = sum_(\( cal(F) \, delta \) in cal(X)) x_(cal(F) \, delta) times.square a \( delta \) $ <eq:chain-detection-map>]

 is injective.]
  + #emph[For every $i in { 1 \, dots.h \, t }$, each partial datum $\( cal(F) \, D_1 \, dots.h \, hat(D)_i \, dots.h \, D_t \)$ that occurs has at least $k_i > 0$ completions in $cal(X)$.]
  #emph[Write $N = \| cal(X) \|$. Then the image of $Phi$ contains a space of cycles of dimension at least 
#[#set math.equation(numbering: n => "(34)")
 $ N q_h (F - sum_(i = 1)^t 1 / k_i) . $ <eq:chain-decoration-dimension>]

 In particular, if $F > sum_i 1 \/ k_i$, there is a nonzero cycle of degree $r + t - 1$, supported on full flags ending at the rank-$r + t$ groups $E_(cal(F) \, delta)$. At least one such full flag has a nonzero actual coefficient. When $t = 0$, the sum is zero and there are no completion conditions.]
] <lem:decorations>

#proof[
  The fixed-tuple spaces give
  $ dim cal(Z) gt.eq F q_h sum_delta \| frak(F)_delta \| = F N q_h . $
  Use (28) on (33). For fixed $delta$, the terms $\( partial x_(cal(F) \, delta) \) times.square a \( delta \)$ sum to zero by (32). This use of that equality is legitimate: multiplication by subgroups of the fixed decoration group is a well-defined operation on each common coarsening face.
  It remains to cancel the terms obtained from (30). For each partial datum
  $ y = \( cal(F) \, D_1 \, dots.h \, hat(D)_i \, dots.h \, D_t \) $
  impose the vector equation
  #[#set math.equation(numbering: n => "(35)")
   $ sum_(\( cal(F) \, delta \) in cal(X)\
delta upright(" completes ") y) x_(cal(F) \, delta) = 0 quad upright("in ") V_(cal(F)) . $ <eq:chain-partial-equation>]
  The boundary sign $\( - 1 \)^(r + i - 1)$ is common to this entire sum. The remaining decoration apartment is also common, so (35) cancels its contribution. These equations are sufficient even if different partial data have further coincident faces.
  The following dimension count is the vector-valued analogue of the scalar constructible-cycle count in #cite(label("DiazRamos2018"), form: "prose") equation (17), arXiv version 1. Each full datum has exactly one partial datum of kind $i$. Since each such partial datum has at least $k_i$ completions, there are at most $N \/ k_i$ of them. Each vector equation has rank at most $q_h$ by (31). Their common kernel in $cal(Z)$ consequently has dimension at least (34). Its image consists of cycles, and injectivity of $Phi$ preserves this dimension. Every summand in (33) is a full flag of the asserted rank, so a nonzero image has the stated coefficient. ◻
]

Here is a useful way to check the injectivity assumption in Lemma 16. Suppose a full group $E$ determines $S_(cal(F))$ and its frame $cal(F)$. Suppose also that $D = D_1 dots.h.c D_t$ determines the labelled axes, for instance because they lift a fixed ordered basis of a quotient on which $D$ maps isomorphically. Inspect a split full flag which first grows through $D_1 < D_1 D_2 < dots.h.c < D$ and then through

$ D U_1 < dots.h.c < D U_r = E $

for a sign flag $\[ U_1 < dots.h.c < U_r = S_(cal(F)) \]$. If another datum contributes to this flag, its full group gives the same sign group and frame. At the vertex $D$, its split form is $U V$ with $U lt.eq S_(cal(F))$ and $V$ contained in its decoration complement. Since $D ∩ S_(cal(F)) = 1$, necessarily $U = 1$. The rank of $D$ then forces the whole alternative complement to equal $D$. The labelled axes agree by hypothesis. The coefficient of the inspected flag is therefore the original sign coefficient, up to the nonzero sign of the unique shuffle taking all decoration steps first. These flags detect every coordinate in the direct sum. The applications will verify the recovery of $S_(cal(F))$, $cal(F)$, and the labelled axes in their particular groups.

=== 5.3 A rank-two decoration with three lines <a-rank-two-decoration-with-three-lines>

For the symplectic construction the additional elementary group is $T tilde.equiv C_2^2$. Its three order-two subgroups are not supplied with a preferred pair of coordinate axes. Instead we use its full two-dimensional coefficient space

#[#set math.equation(numbering: n => "(36)")
 $ Q_T = {sum_(ell < T \, med \| ell \| = 2) c_ell \[ ell < T \] : sum_ell c_ell = 0} . $ <eq:chain-quaternion-space>]

For $q = sum c_ell \[ ell < T \] in Q_T$, direct calculation gives

#[#set math.equation(numbering: n => "(37)")
 $ partial q = - sum_ell c_ell \[ ell \] . $ <eq:chain-quaternion-boundary>]

The two-dimensional space in (36) is spanned by differences of its three flags, equivalently by the apartments from pairs of independent lines. The name in the next lemma refers to its later realization by a projective quaternion group; the chain statement needs only $T tilde.equiv C_2^2$.

#thm([Lemma 5.2.])[
  (Quaternion decoration).  #emph[Let $M$ be a finite group, $h gt.eq 2$, $r = h - 1$, and $epsilon in { 0 \, 1 }$. Consider a finite nonempty set $cal(X)$ of data $\( cal(F) \, T \)$ if $epsilon = 0$, or $\( cal(F) \, T \, B \)$ if $epsilon = 1$, where 
$ E = S_(cal(F)) times T times B \, #h(2em) "rk" S_(cal(F)) = r \, quad T tilde.equiv C_2^2 \, quad "rk" B = epsilon . $

 For $epsilon = 0$, set $B = 1$ and omit it from the data. For each fixed $\( T \, B \)$, assume its compatible frames have a space $Z_(T \, B)$ satisfying (32), with a uniform lower bound $F > 0$ and local bound $q_h = \( h - 1 \) !$. Assume that the map 
#[#set math.equation(numbering: n => "(38)")
 $ xor.big_(\( T \, B \)) Z_(T \, B) ⊗ Q_T arrow.r tilde(C)_(r + 1 + epsilon) \( cal(A)_2 \( M \) \) $ <eq:chain-quaternion-detection>]

 which sends a simple tensor to the sum of the split chains $x_(cal(F) \, T \, B) times.square q times.square \[ B \]$ is injective. When $B = 1$, replace $\[ B \]$ here by the empty simplex.]
  #emph[For every occurring partial datum consisting of a frame, a retained line $ell < T$, and $B$ when present, assume there are at least $k_T > 0$ completions to full data. If $epsilon = 1$, assume also that every occurring $\( cal(F) \, T \)$ has at least $k_B > 0$ completions to a datum $\( cal(F) \, T \, B \)$. Then the image in (38) contains a cycle space of dimension at least 
#[#set math.equation(numbering: n => "(39)")
 $ 2 \| cal(X) \| q_h (F - frac(3, 2 k_T) - epsilon / k_B) \, $ <eq:chain-quaternion-dimension>]

 where the last term is omitted if $epsilon = 0$. If the expression in parentheses is positive, there is a nonzero cycle on full flags ending at groups of rank $r + 2 + epsilon = h + 1 + epsilon$.]
] <lem:quaternion-decoration>

#proof[
  Put $N = \| cal(X) \|$. The domain of (38) has dimension at least $2 F N q_h$. Its sign-direction boundaries cancel for each fixed $\( T \, B \)$ and each coefficient in $Q_T$, by (32) and (28).
  For a retained-line partial datum $\( cal(F) \, ell \, B \)$, take the coefficient $c_ell$ in (36) from each of its completions and sum the resulting vectors in $V_(cal(F))$. Impose that this sum be zero. This is a linear condition of rank at most $q_h$. By (37), these conditions cancel all boundary terms in which the $T$-part is reduced to a line. There are exactly $3 N$ incidences between full data and their retained-line partial data. Thus at most $3 N \/ k_T$ such partial data occur, costing at most $3 N q_h \/ k_T$ dimensions.
  If $B$ is present, its boundary is the empty simplex. For each partial datum $\( cal(F) \, T \)$ impose zero sum of the full vectors in $V_(cal(F)) ⊗ Q_T$ over its $B$-completions. Each such condition has rank at most $2 q_h$, and there are at most $N \/ k_B$ such data. This costs at most $2 N q_h \/ k_B$ further dimensions. The common kernel therefore has dimension at least (39). Its image consists of cycles, and the assumed injectivity preserves its dimension. The split construction shows the asserted ranks and flag lengths. ◻
]

The use of two parameters at $T$ is essential to this count. There are three retained-line boundary conditions but only one sign coefficient vector at each such partial datum. Dividing the resulting loss by the initial factor two gives $3 \/ \( 2 k_T \)$. To verify the detection hypothesis, the applications inspect split flags through $T$ and each of its three lines; when $B$ is present they begin at $B$ and then pass through $B ell < B T$. These flags recover the coefficients in $Q_T$ as well as the sign-chain coefficients, once the full data are recovered from the corresponding subgroups.

=== 5.4 Opposite chambers and a nonzero restricted coefficient <opposite-chambers-and-a-nonzero-restricted-coefficient>

We now prove the restriction statement. Its input is a homogeneous cycle on full flags of one fixed rank. This condition will let us take a local building cycle at a specified top group. The following elementary building fact supplies a complement on a supported flag.

Its conclusion has the classical apartment-basis interpretation of #cite(label("Solomon1969"), form: "prose") Theorem 1 and #cite(label("Bjorner1984"), form: "prose") Proposition 4.5 and equation (4.6): coefficients on opposite chambers detect a top cycle. We retain a direct panel argument, including the augmented low-rank cases, before proving the restriction statement that uses the resulting complement.

#thm([Lemma 5.3.])[
  (A supported opposite chamber).  #emph[Let $V$ be an $m$-dimensional vector space over $bb(F)_p$, with $m gt.eq 1$, and let $cal(B) \( V \)$ be its poset of proper nonzero subspaces. Let 
$ 0 = F_0 < F_1 < dots.h.c < F_m = V \, #h(2em) dim F_j = j \, $

 be a fixed full flag with its endpoints adjoined. Every nonzero cycle $z in tilde(C)_(m - 2) \( cal(B) \( V \) \)$ has a supported chamber $W_1 < dots.h.c < W_(m - 1)$ such that, on putting $W_0 = 0$ and $W_m = V$, 
#[#set math.equation(numbering: n => "(40)")
 $ dim \( W_i ∩ F_j \) = max { 0 \, i + j - m } quad \( 0 lt.eq i \, j lt.eq m \) . $ <eq:chain-opposition>]

 In particular, if $0 < c < m$ and $F_(m - c) = K$, then $W_c$ is a complement to $K$ in $V$.]
] <lem:opposite-chamber>

#proof[
  When $m = 1$, the building is empty and its unique augmented chamber is the empty simplex; the assertion holds directly. Suppose $m gt.eq 2$. Write $a_W$ for the coefficient of a chamber $W = \( W_1 < dots.h.c < W_(m - 1) \)$ in $z$. If all its vertices except the rank-$i$ vertex are fixed, the cycle equation is
  #[#set math.equation(numbering: n => "(41)")
   $ sum_(W_(i - 1) < X < W_(i + 1) \, med dim X = i) a_(\( W_1 \, dots.h \, W_(i - 1) \, X \, W_(i + 1) \, dots.h \, W_(m - 1) \)) = 0 . $ <eq:chain-panel>]
  The common boundary sign $\( - 1 \)^(i - 1)$ has been omitted. For $m = 2$ this is the augmentation equation at the empty simplex. A supported completion of any such panel therefore has another supported completion.
  For a chamber $W$, set $r_(i j) = dim \( W_i ∩ F_j \)$. There is a permutation $w in frak(S)_m$ with
  #[#set math.equation(numbering: n => "(42)")
   $ r_(i j) = \| { k lt.eq i : w \( k \) lt.eq j } \| . $ <eq:chain-relative-permutation>]
  Indeed, $r_(i j) - r_(i - 1 \, j)$ is the dimension of the image of $W_i ∩ F_j$ in the one-dimensional space $W_i \/ W_(i - 1)$. As $j$ increases these images are nested, so the difference changes from zero to one at a unique threshold $w \( i \)$. Since $sum_i \( r_(i j) - r_(i - 1 \, j) \) = j$, exactly $j$ thresholds are at most $j$, proving that the thresholds form a permutation.
  Choose a supported chamber maximizing the inversion number of $w$. If $w$ is not the decreasing permutation, some adjacent entries satisfy $a = w \( i \) < w \( i + 1 \) = b$. Keep its panel fixed, and put $A = W_(i - 1)$ and $C = W_(i + 1)$. On the two-dimensional quotient $C \/ A$ the fixed flag induces
  $ H_j = #scale(x: 120%, y: 120%)[\(] A + \( C ∩ F_j \) #scale(x: 120%, y: 120%)[\)] \/ A . $
  Its dimension is $r_(i + 1 \, j) - r_(i - 1 \, j)$. Hence it is zero for $j < a$, one fixed line $ell$ for $a lt.eq j < b$, and all of $C \/ A$ for $j gt.eq b$. For an intermediate subspace $A < X < C$,
  $ dim \( X ∩ F_j \) - dim \( A ∩ F_j \) = dim #scale(x: 120%, y: 120%)[\(] \( X \/ A \) ∩ H_j #scale(x: 120%, y: 120%)[\)] . $
  Thus $X \/ A = ell$ is the unique panel completion with the two thresholds in the order $\( a \, b \)$. Every other completion has them in the order $\( b \, a \)$, with all other thresholds unchanged. Such a completion has one more inversion. Equation (41) supplies another supported completion, contradicting maximality. Therefore $w$ is decreasing, and (42) gives (40). The case $i = c$, $j = m - c$ gives $W_c ∩ K = 0$, and their dimensions sum to $m$. ◻
]

#thm([Lemma 5.4.])[
  (Restriction at a maximal index).  #emph[Let $M$ be a finite group, $H lt.eq M$, and $p$ a prime. Let $m gt.eq 1$ and let $alpha in tilde(C)_(m - 1) \( cal(A)_p \( M \) \)$ be a cycle supported on full flags ending at rank-$m$ elementary abelian groups. Denote by $cal(E) \( alpha \)$ the set of top groups of flags with nonzero coefficient in $alpha$. Suppose that an integer $c$ satisfies 
$ 0 lt.eq c < m \, #h(2em) \[ E' : E' ∩ H \] lt.eq p^c quad \( E' in cal(E) \( alpha \) \) \, $

 and that a specified $E in cal(E) \( alpha \)$ satisfies $\[ E : E ∩ H \] = p^c$. Then there is a nonzero cycle 
$ beta in tilde(C)_(m - c - 1) \( cal(A)_p \( H \) \) $

 supported on full flags of rank $m - c$, with a nonzero coefficient at a full flag ending at $E ∩ H$. If $m - c = m_p \( H \)$, this cycle represents a nonzero homology class.]
] <lem:restriction>

#proof[
  If $c = 0$, every supported top group lies in $H$, so take $beta = alpha$. Suppose henceforth $0 < c < m$, and put $K = E ∩ H$.
  Collect the terms of $alpha$ ending at $E$ and delete their last vertex. This gives a nonzero chain $z_E in tilde(C)_(m - 2) \( cal(B) \( E \) \)$, identifying $E$ with an $m$-dimensional $bb(F)_p$-space. It is a cycle: each face retaining the rank-$m$ vertex $E$ can receive a contribution only from terms of $alpha$ whose top is $E$. Its coefficient equation in $partial alpha = 0$ is exactly the corresponding equation in $partial z_E = 0$. This includes the augmentation equation when $m = 2$.
  Choose a full reference flag of $E$ through $K$, which has dimension $m - c$. By Lemma 18, a full flag with nonzero coefficient in $alpha$ passes through a rank-$c$ subgroup $R$ with
  #[#set math.equation(numbering: n => "(43)")
   $ E = R times K . $ <eq:chain-chosen-complement>]
  Fix the initial segment $sigma = \[ R_1 < dots.h.c < R_c = R \]$ of that flag, where $"rk" R_i = i$.
  Apply the saturated residue $R_sigma$ of Lemma 7: retain the simplices whose initial segment is $sigma$ and delete those $c$ vertices, with their original coefficients. The result is a chain in the strict upper interval of $R$, and that lemma gives
  #[#set math.equation(numbering: n => "(44)")
   $ R_sigma partial = \( - 1 \)^c partial R_sigma . $ <eq:chain-restriction-residue>]
  Its hypotheses hold because $"rk" R_i = i$; no subgroup can be inserted below $R_1$ or between consecutive vertices. Consequently $R_sigma alpha$ is a cycle of degree $m - c - 1$.
  Every vertex $B$ in its support contains $R$ strictly and lies in some supported top group $E' in cal(E) \( alpha \)$. Since $R ∩ H = 1$, the subgroup indices satisfy
  #[#set math.equation(numbering: n => "(45)")
   $ p^c = \| R \| lt.eq \[ B : B ∩ H \] lt.eq \[ E' : E' ∩ H \] lt.eq p^c . $ <eq:chain-index-sandwich>]
  All groups under consideration are subgroups of the elementary abelian group $E'$, so these are ordinary vector-space index inequalities. Equality throughout gives
  #[#set math.equation(numbering: n => "(46)")
   $ B = R times \( B ∩ H \) . $ <eq:chain-fixed-complement-split>]
  In particular $B ∩ H eq.not 1$. Formula (46) holds for every continuation vertex, with the #emph[same] fixed subgroup $R$. It follows that
  $ B mapsto B ∩ H $
  is injective on these vertices, with inverse $T mapsto R T$ on its image. It preserves and reflects strict inclusions.
  Apply this map to $R_sigma alpha$, and call the image $beta$. Since it is an injective simplicial map on the subcomplex generated by the support, $beta$ is a cycle and no two distinct suffixes have been identified. The chosen nonzero coefficient therefore survives, with its top vertex changed from $E$ to $E ∩ H$. Moreover a vertex of rank $c + j$ becomes one of rank $j$ by (46); hence every resulting flag is full of rank $m - c$. This proves all chain assertions. If that rank equals $m_p \( H \)$, there are no chains in the next degree, so the nonzero cycle cannot be a boundary. ◻
]

The maximal-index hypothesis is used only in (45). A constant index over all supported top groups is therefore sufficient, but is not required. Neither $m$ nor $m - c$ needs to be the maximum elementary rank of its ambient group unless the final top-degree conclusion is invoked. In the applications at two, the nonzero saturated coefficient supplied by Lemma 19 is instead used in Lemma 9.

Figure 2 illustrates the fixed-complement step when $0 < c < m$. Its middle and bottom rows are two descriptions of the same suffix flag, which is why the intersection operation preserves the chosen coefficient.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 12.99cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$[R_1< dots.h <R_c=R<"RT"_1< dots.h <"RT"_(m-c)=E]$]]])])
  content((0, -1.45), [#box(width: 12.99cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$["RT"_1< dots.h <"RT"_(m-c)=E]$]]])])
  content((0, -2.9), [#box(width: 12.99cm, inset: 0.2469cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$[T_1< dots.h <T_(m-c)=K]$]]])])
  line((0, -0.4057), (0, -1.044), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((0, -0.725), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[residue at $[R_1< dots.h <R_c]$]]])], anchor: "west")
  line((0, -1.856), (0, -2.494), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  content((0, -2.175), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[intersection with $H$]]])], anchor: "west")
})],
  caption: [Figure 2: The chosen supported flag in Lemma 19, with $E = R times K$, $K = E ∩ H$, and $0 < c = "rk" R < m$. Here $T_1 < dots.h.c < T_(m - c) = K$ is a full flag of subgroups of $K$. The maximal-index hypothesis forces every continuation vertex $B$ in the residue support to equal $R times \( B ∩ H \)$ with this same $R$. Thus intersection with $H$ is injective on those suffix flags and preserves the selected nonzero coefficient. The diagram depicts a flag in that support, not an arbitrary flag in the ambient poset. When $c = 0$, the initial flag is empty, $R = 1$, and the lemma uses the original cycle in $H$. ],
) <fig:fixed-complement>

== 6 Linear and unitary components <sec:linear>

This section applies the frame construction to linear and unitary groups. At two we construct a coefficient to which Lemma 9 applies. At odd primes we need the stronger conclusion that the coefficient lies in the largest possible degree. Projective commutation is the main issue in both arguments: commuting projective transformations need not have commuting matrix representatives. The dimension-four cases at two are treated through their orthogonal realizations in Propositions 28 and 36.

=== 6.1 Weights, signs, and projective commutators <weights-signs-and-projective-commutators>

We first record two elementary observations about weights. If $Lambda$ is a finite subset of an affine space over $bb(F)_p$, and translation by a nonzero vector $a$ preserves $Lambda$, then

#[#set math.equation(numbering: n => "(47)")
 $ dim "aff" \( Lambda \) lt.eq frac(\| Lambda \|, p) . $ <eq:linear-translation>]

Indeed, the translation has orbits of length $p$. If there are $t$ orbits, choose representatives $lambda_1 \, dots.h \, lambda_t$; the affine span is generated by $a$ and the $t - 1$ differences $lambda_i - lambda_1$.

For the second observation, let an elementary abelian $p$-group $D$ act faithfully projectively on a vector space in characteristic different from $p$. Suppose that its matrix representatives commute. Over an algebraic closure, rescale representatives of a basis of $D$ to have order $p$. They give a linear representation of $D$ with a set of characters $Lambda subset.eq D^(*)$. The differences of these characters span $D^(*)$: an element annihilated by every difference acts by a scalar and is therefore trivial in $D$. Thus

#[#set math.equation(numbering: n => "(48)")
 $ dim "aff" \( Lambda \) = "rk" D . $ <eq:linear-affine-rank>]

A transformation centralizing the projective action, and acting trivially on the $p$th roots of unity, permutes these characters by a common translation. To see this, conjugating each chosen representative changes it by a scalar; the scalars, which are $p$th roots of unity after normalization, form a character of $D$.

Here is the complementary estimate when the representatives do not commute. It will also be useful in the exceptional case of Section 9.

#thm([Lemma 6.1.])[
  #emph[Let $D$ be an elementary abelian $p$-subgroup of $"PGL" \( V \)$, where $dim V = n$ and the characteristic of the field is different from $p$. The scalar commutators of representatives define an alternating bilinear pairing on $D$ with values in the $p$th roots of unity. If this pairing has rank $2 a$, then 
$ p^a divides n \, #h(2em) "rk" D lt.eq 2 a + n / p^a - 1 . $

 In particular, for odd $p$, $n gt.eq 5$, and $a > 0$, 
#[#set math.equation(numbering: n => "(49)")
 $ "rk" D < n - 2 . $ <eq:odd-pairing-strict>]

]
] <lem:projective-rank>

#proof[
  We may extend the field to its algebraic closure. If $X \, Y$ represent elements of $D$, then $\[ X \, Y \]$ is scalar, and $X^p$ is scalar. Consequently $\[ X \, Y \]^p = \[ X^p \, Y \] = 1$. The commutator identities for central commutators give the asserted alternating bilinear pairing.
  Let $R$ be its radical. Choose representatives of generators of $R$ and rescale them to order $p$. They commute with all the representatives in question. Let $t$ be the number of their distinct simultaneous weights. Their weight ratios separate $R$ projectively, so $"rk" R lt.eq t - 1$. Choose a symplectic basis $x_1 \, y_1 \, dots.h \, x_a \, y_a$ for a complement of $R$ in $D$, with representatives normalized to order $p$. On each radical weight space, the commuting $x_i$ have simultaneous eigenspaces. The $y_i$ translate their $a$ eigenvalue coordinates independently through all $p$ possibilities. They therefore permute these eigenspaces freely in orbits of size $p^a$, with equal dimensions within an orbit. Every radical weight space has positive dimension divisible by $p^a$. It follows that $p^a divides n$, $t lt.eq n \/ p^a$, and $"rk" D = 2 a + "rk" R lt.eq 2 a + n \/ p^a - 1$.
  For the final assertion put $u = p^a$. Except when $\( p \, a \) = \( 3 \, 1 \)$, we have $u > 2 a + 2$: for $a = 1$ this follows from $p gt.eq 5$, and for $a gt.eq 2$ it follows from $3^a > 2 a + 2$. Since $n gt.eq u$,
  $ n - 2 - (2 a + n / u - 1) = n (1 - 1 / u) - 2 a - 1 gt.eq u - 2 a - 2 > 0 . $
  In the remaining case $3 divides n$ and $n gt.eq 5$, so $n gt.eq 6$, and the same difference is $2 n \/ 3 - 3 gt.eq 1$. ◻
]

Let $L = "PSL"_n \( q \)$ or $"PSU"_n \( q \)$, and put $M = "PGL"_n \( q \)$ or $"PGU"_n \( q \)$, respectively. In the unitary notation, $"GU"_n \( q \)$ denotes the group of isometries of a nondegenerate hermitian form over $bb(F)_(q^2)$; its projective image also contains every projective similitude, since the norm map onto $bb(F)_q^times$ is surjective. In the linear case set $C = bb(F)_q^times$, and in the unitary case set $C = mu_(q + 1) subset.eq bb(F)_(q^2)^times$. Determinant induces

#[#set math.equation(numbering: n => "(50)")
 $ M \/ L tilde.equiv C \/ C^n . $ <eq:linear-determinant>]

In particular this quotient is cyclic.

A line frame $cal(D)$ is an unordered direct-sum decomposition into $n$ lines; in the unitary case the lines are required to be orthogonal and nondegenerate. For a prime $p divides \| C \|$, define $S \( cal(D) \)$ to be the projective images of the diagonal operators with entries in $mu_p$. Thus $S \( cal(D) \) tilde.equiv bb(F)_p^n \/ chevron.l \( 1 \, dots.h \, 1 \) chevron.r$ has rank $n - 1$. For any fixed $L lt.eq H lt.eq "Aut" \( L \)$,

#[#set math.equation(numbering: n => "(51)")
 $ h_0 := "rk" \( S \( cal(D) \) ∩ H \) in { n - 2 \, n - 1 } $ <eq:linear-hzero>]

is independent of $cal(D)$. Indeed all these frames are conjugate under $M$, and their images in the abelian group $M \/ L$ are consequently the same subgroup, of order at most $p$.

We use the standard automorphism description for these groups in dimension $n gt.eq 5$; see #cite(label("Steinberg1960"), form: "prose") Section 2 and statements 3.2–3.6 and #cite(label("GLS1998"), form: "prose"). If $q = r^f$, the quotient $"Aut" \( "PSL"_n \( q \) \) \/ "PGL"_n \( q \)$ is the product of the field group of order $f$ and the diagram group of order two. The diagram operation is $gamma : g mapsto \( g^(- 1) \)^(sans(t))$. The quotient $"Aut" \( "PSU"_n \( q \) \) \/ "PGU"_n \( q \)$ is the cyclic field group of order $2 f$ on $bb(F)_(q^2)$. Semilinear isometries represent the latter automorphisms. Thus an elementary subgroup has at most two external directions at two in the linear case, at most one in the unitary case, and at most one at odd primes in either case.

A #emph[correlation] here is a linear or semilinear identification with the dual space, acting on the group through inverse transpose. A dual frame consists of the lines of linear functionals vanishing on all but one summand of the original frame. A frame is matched with its dual frame when each of its lines is matched with the corresponding dual line under this identification.

#thm([Lemma 6.2.])[
  #emph[Suppose $q$ is odd and $n gt.eq 5$. Set $S = S \( cal(D) \)$ and $S_L = S ∩ L$ for a line frame as above, using $p = 2$. Every automorphism centralizing $S_L$ preserves each line of $cal(D)$, or matches it with the corresponding line of the dual frame when it is a correlation. It centralizes $S$. Every involution in $M$ centralizing $S_L$ belongs to $S$.]
] <lem:linear-sign-centralizer>

#proof[
  The preimage of $S_L$ in $bb(F)_2^n$ is either all of $bb(F)_2^n$ or the kernel of the total-parity functional. This follows directly from the determinant formula; when $n$ is odd the second possibility cannot occur, since the simultaneous sign belongs to that preimage. For $n gt.eq 5$, the coordinate characters on this preimage are distinct: a relation equating two coordinates is neither the zero relation nor the total-parity relation. Their differences factor through $S_L$ and span its dual. After choosing a normalization, the corresponding $n$ weights therefore have affine rank $"rk" S_L gt.eq n - 2$.
  Field operations and inverse-transpose leave binary sign values unchanged. Projective centralization can consequently permute the weights only by a common translation. A nonzero translation would give affine rank at most $n \/ 2$ by (47), contrary to $n - 2 > n \/ 2$. Every weight line is therefore preserved individually, with the indicated dual interpretation for a correlation. Each such operation centralizes all binary diagonal signs. Finally a line-preserving projective involution in $M$ has diagonal entries whose ratios square to one; after removing a common scalar these entries are all $1$ or $- 1$. It belongs to $S$. ◻
]

=== 6.2 Compatible frames for involutory decorations <subsec:linear-compatible>

We next identify the frame spaces to which Theorem 11 will be applied. A decoration is an involution outside $M$. A frame is compatible with it if every line is stable, with matching to the dual frame in the correlation case. For several decorations we require them to commute and require compatibility with each of them. In what follows we consider only tuples having at least one compatible frame.

We use the following fixed-vector form of Galois descent. Let $K \/ k$ be a cyclic finite-field extension of degree $d$, with generator $sigma$, and let $B$ be an additive map on a finite-dimensional $K$-space $V$ satisfying $B \( a v \) = sigma \( a \) B \( v \)$ and $B^d = "id"$. The powers of $B$ define a semilinear Galois action, and #cite(label("MilneDescent2024"), form: "prose") Proposition 5.5 gives

$ K ⊗_k V^B arrow.r V \, #h(2em) a ⊗ v mapsto a v \, $

as an isomorphism. In particular $dim_k V^B = dim_K V$. Every $B$-stable $K$-subspace descends by the same assertion applied to its restriction; see also #cite(label("MilneDescent2024"), form: "prose") Proposition 3.5. Thus a stable line has a fixed nonzero generator.

After a form $f$ has been made $sigma$-equivariant, meaning $f \( B v \, B w \) = sigma \( f \( v \, w \) \)$, its Gram matrix in a fixed-vector basis has entries in $k$. Its restriction consequently extends back to the original form and preserves nondegeneracy. For a hermitian form with field involution $tau$ commuting with $sigma$, the restricted form has involution $tau \|_k$; it is symmetric when that restriction is the identity. All field involutions used here commute. The normalizations giving $B^d = "id"$ and equivariance of the form are checked separately below; scalar Hilbert 90, as in #cite(label("MilneFields2022"), form: "prose") Corollary 5.25, handles only the scalar part of those checks.

In the linear case, an external field involution requires $q = s^2$; write $sigma : x mapsto x^s$. On a compatible frame a representative is $T = "diag" \( a_1 \, dots.h \, a_n \) sigma$, and $T^2 = c I$ implies $a_i a_i^sigma = c$ for every $i$. Multiplying $T$ by $a_1^(- 1)$ makes $T^2 = I$. Semilinear descent gives an $n$-dimensional fixed space $V_0$ over $bb(F)_s$, with $V = V_0 ⊗_(bb(F)_s) bb(F)_q$. A stable line has a fixed generator by the one-dimensional norm-one equation, so compatible frames correspond exactly to line frames of $V_0$.

A correlation without field action is represented by a nonsingular bilinear form. The involutory condition says that its transpose is a scalar multiple of itself. In coordinates from a compatible frame its matrix is diagonal and nonsingular; the scalar is therefore one. The form is symmetric, and the compatible frames are its orthogonal nondegenerate line frames. For a diagram-field involution, the same argument uses a $sigma$-sesquilinear form. Its conjugate transpose is a scalar multiple of itself; scaling the form, using the norm-one scalar equation, makes it hermitian. Its compatible frames are hermitian frames with parameter $s$. Alternating forms have no compatible nondegenerate line frame and do not occur in either assertion.

If there are two independent external involutions, choose their external basis to be field and diagram-field. Descend the first one to $sigma$. Choose generators for the lines of one compatible frame in the descended space. In these coordinates write the other involution as $"Int" \( D \) gamma sigma$, where $D$ is nonsingular diagonal and $"Int" \( D \) \( g \) = D g D^(- 1)$. Projective commutation with $sigma$ gives $D^sigma = c D$. Dividing by any diagonal entry makes every entry of $D$ lie in $bb(F)_s$. The corresponding correlation form on $V_0$ has Gram matrix $D^(- 1)$. Indeed, for $g in "GL" \( V_0 \)$ and $lambda in bb(F)_s^times$,

$ g D g^(sans(T)) = lambda D quad arrow.l.r.double quad g^(sans(T)) D^(- 1) g = lambda D^(- 1) . $

This form is symmetric and nondegenerate over $bb(F)_s$. A frame is compatible with both involutions precisely when it is the scalar extension of an orthogonal frame for this symmetric form: the first condition descends its lines, and the second is orthogonality for that form.

In the unitary case the unique external involution induces $tau : x mapsto x^q$ on $bb(F)_(q^2)$. Take an orthonormal basis along a compatible frame. A unitary semilinear representative has the form

$ T = "diag" \( t_1 \, dots.h \, t_n \) tau \, #h(2em) t_i^(q + 1) = 1 . $

It follows that $T^2 = I$. This conclusion uses compatibility with a #emph[nondegenerate orthogonal] frame. An arbitrary projective unitary semilinear involution can instead have square $- I$, which cannot be removed by multiplying by a norm-one scalar. No such involution is included here. The fixed space of $T$ has dimension $n$ over $bb(F)_q$. The original hermitian form restricts to a nondegenerate symmetric form on this space: its values on fixed vectors are fixed by $tau$, and hermitian symmetry then becomes ordinary symmetry. Compatible unitary frames correspond exactly to orthogonal nondegenerate line frames in this fixed space.

These descriptions also identify all coarsenings of frames. A sum of lines descends to the corresponding sum of fixed lines, and the subgroup requiring equal signs on that sum is unchanged by the description. Adjoining the fixed decorations preserves these identifications. Thus the frame relations in Theorem 11 are actual subgroup face relations for the decorated groups.

=== 6.3 The construction at two <the-construction-at-two>

#thm([Proposition 6.3.])[
  #emph[Let $G$ have least order among finite groups with $O_2 \( G \) = 1$ and $tilde(H)_(*) \( cal(A)_2 \( G \) \; bb(Q) \) = 0$. Then $G$ has no simple component isomorphic to $"PSL"_n \( q \)$ or $"PSU"_n \( q \)$ with $n gt.eq 5$ and $q$ of characteristic at least five.]
] <prop:linear-two>

#proof[
  Suppose $L$ is such a component. Consider all elementary abelian $2$-subgroups $A lt.eq N_G \( L \)$ for which $L A$ acts faithfully on $L$, $O_2 \( C_G \( L A \) \) = 1$, and $A ∩ L$ contains $S \( cal(D) \) ∩ L$ for some line frame $cal(D)$. This family is nonempty: take $A = S \( cal(D) \) ∩ L$ and use Lemma 4. It is closed under elementary overgroups that are faithful configurations, since each such overgroup still contains the same subgroup $S \( cal(D) \) ∩ L$. Choose a member of maximum rank, put $H = L A$, and identify $H$ with its faithful image in $"Aut" \( L \)$.
  For its frame put $S = S \( cal(D) \)$. Lemma 21 shows that $A$ centralizes $S$ and $A ∩ M lt.eq S$. Adjoining $S ∩ H$ would give another member of the same family with the same generated group $H$, so maximality implies
  $ A ∩ M = S ∩ H . $
  Let $J_0$ be the image of $A$ in $"Aut" \( L \) \/ M$ and write $d = "rk" J_0$. Choose a fixed basis $j_1 \, dots.h \, j_d$ of $J_0$, and choose its lifts $b_1 \, dots.h \, b_d$ in a complement $T$ to $A ∩ M$ in $A$. For $d = 2$ use the field and diagram-field basis above. These lifts are commuting involutions compatible with $cal(D)$. Filling out the signs gives
  #[#set math.equation(numbering: n => "(52)")
   $ E = S times T \, #h(2em) "rk" E = n - 1 + d \, #h(2em) E ∩ H = A . $ <eq:linear-E-intersection>]
  For the construction, vary the frame and the ordered decorations subject to the following requirements: $b_i in H$ maps to $j_i$, the $b_i$ are commuting involutions, and the frame is compatible with all of them. The original data show that this set is nonempty. All the resulting groups $E$ have rank $n - 1 + d$. They also have the same intersection index in $H$, and every intersection generates $H$ over $L$. Here is the verification of the latter point. The image $B$ of $S \( cal(D) \)$ in $M \/ L$ is independent of the frame. For the original $A$, its subgroup $A ∩ M$ maps onto $\( H ∩ M \) \/ L$, since $A$ maps onto $H \/ L$. Therefore $B$ contains $\( H ∩ M \) \/ L$. For every new frame, $S \( cal(D) \) ∩ H$ maps onto that same subgroup. Together with the $b_i$ it consequently generates $H \/ L$. If $h_0$ is as in (51), then for every datum
  #[#set math.equation(numbering: n => "(53)")
   $ A' = E ∩ H = \( S \( cal(D) \) ∩ H \) times T \, #h(2em) L A' = H \,\
"rk" A' = h_0 + d \, #h(2em) \| E : A' \| = 2^c \, #h(2em) c = n - 1 - h_0 in { 0 \, 1 } . $ <eq:linear-constant-index>]
  For each fixed decoration tuple, the preceding descent gives all the frames of a linear, symmetric, or hermitian space of dimension $n$. Its field parameter is $q$ or a subfield parameter $s$, and in every case is at least five. In the symmetric cases all line norm types are allowed; the estimate is uniform over the isometry types that arise. By Theorem 11, its space of frame assignments has dimension at least the fraction
  $ F = (17 / 25)^n $
  of the number of compatible frames times $\( n - 1 \) !$. We now count completions after one decoration has been omitted.
  Fix a frame and one existing completion. Multiplying the omitted decoration by a diagonal element $X$ preserves compatibility. The following cyclic choices for each entry of $X$ also preserve its order and its commutation with all retained decorations:
  $ upright("omitted direction") & upright("condition on an entry ") x & k\
upright("linear diagram") & x in bb(F)_q^times & q - 1\
upright("linear field") \, med q = s^2 & x^(s + 1) = 1 & s + 1\
upright("linear diagram-field") \, med q = s^2 & x in bb(F)_s^times & s - 1\
upright("unitary external involution") & x^(q + 1) = 1 & q + 1 $
  In the two-direction case the last two linear prescriptions apply. Indeed the field direction acts on diagonal entries by $x mapsto x^s$, and the diagram-field direction by $x mapsto x^(- s)$. Thus a norm-one modification of the field lift is fixed by the retained diagram-field lift, whereas a fixed-field modification of the diagram-field lift is fixed by the retained field lift. The same formulas show that the square of the modified lift remains projectively trivial. They apply even when the original matrix representatives commute only projectively.
  There are $k^n$ diagonal choices and $k^(n - 1)$ projective choices. We keep those projective modifications that lie in $L$; this ensures that the new decoration remains in $H$ with the required external image. The determinant homomorphism from the modification group to the cyclic group $M \/ L$ has image of exponent dividing $k$, hence order at most $k$. There are therefore at least $k^(n - 2)$ permitted modifications. Distinct projective modifications give distinct decorations. Since $k gt.eq 4$, every partial datum has at least $4^(n - 2)$ completions. The inequality required in Lemma 16 follows from
  #[#set math.equation(numbering: n => "(54)")
   $ (17 / 25)^n > 2 / 4^(n - 2) #h(2em) \( n gt.eq 5 \) . $ <eq:linear-completion-inequality>]
  At $n = 5$ the left side exceeds $\( 2 \/ 3 \)^5 = 32 \/ 243 > 1 \/ 32$, which is the right side; increasing $n$ multiplies their ratio by $68 \/ 25 > 1$. For $d = 0$ there are no decoration equations, and for $d = 1$ the right side can of course be halved.
  It remains to verify that the assignments counted here are detected by actual full-flag coefficients, as required by Lemma 16. The top group $E$ recovers its full signs as $E ∩ M$. The simultaneous eigenspaces of these signs recover the frame. For fixed $E$ and frame, take split flags through the full decoration span $T$ and then through the sign flag. If a second decoration span $T'$ contributes to such a split flag, the vertex $T$ must split with respect to $S xor T'$. Its projection onto $J_0$ is an isomorphism and its rank is $d$. Hence its sign part is zero and $T = T'$. The fixed basis $j_1 \, dots.h \, j_d$ then recovers the individual $b_i$. The coefficients above this vertex are precisely the original sign coefficients, up to the fixed shuffle signs. Thus these flags detect all the counted parameters. When $d = 0$, detection is the undecorated assertion of Theorem 11.
  Lemma 16 now supplies a nonzero homogeneous cycle on full flags with top rank $n - 1 + d$ in the ambient automorphism group. By (53), Lemma 19 applies at any supported top group: $c lt.eq 1 < n - 1 + d$. It produces a cycle in $cal(A)_2 \( H \)$ with a nonzero coefficient on a saturated flag ending at $A' = E ∩ H$, of rank $h_0 + d$.
  We finally apply Corollary 10 at this actual coefficient. The subgroup $A'$ contains $S \( cal(D) \) ∩ L$, has the original maximum rank, and satisfies $L A' = H$; thus $O_2 \( C_G \( L A' \) \) = O_2 \( C_G \( H \) \) = 1$. It therefore belongs to the family that was maximized. The corollary uses the nonzero saturated coefficient just constructed to give $tilde(H)_(*) \( cal(A)_2 \( G \) \; bb(Q) \) eq.not 0$, the desired contradiction. ◻
]

=== 6.4 Odd-prime unitary extensions <odd-prime-unitary-extensions>

#thm([Proposition 6.4.])[
  #emph[Let $p$ be an odd prime, let $q$ be odd with $p divides q + 1$, and let $L = "PSU"_n \( q \)$ with $n gt.eq 5$. If $L lt.eq H lt.eq "Aut" \( L \)$ and $H \/ L$ is elementary abelian of $p$-power order, then 
$ tilde(H)_(m_p \( H \) - 1) \( cal(A)_p \( H \) \; bb(Q) \) eq.not 0 . $

 Here $m_p \( H \)$ denotes the maximum rank of an elementary abelian $p$-subgroup of $H$.]
] <prop:unitary-odd>

#proof[
  Put $K = bb(F)_(q^2)$ and $M = "PGU"_n \( q \)$, and use the $p$-sign group of an orthogonal line frame. Its intersection with $H$ has the constant rank $h_0 in { n - 2 \, n - 1 }$ of (51). We first prove that
  #[#set math.equation(numbering: n => "(55)")
   $ m_p \( H \) in { h_0 \, h_0 + 1 } \, $ <eq:unitary-rank-dichotomy>]
  and that in the second case the larger rank is attained by $\( S \( cal(D) \) ∩ H \) times chevron.l b chevron.r$, where $b$ is a field decoration preserving each line of $cal(D)$.
  Let $B lt.eq H$ be elementary with $"rk" B > h_0$, and set $D = B ∩ M$. There is at most one external direction, so $"rk" D gt.eq n - 2$. By Lemma 20, the scalar commutator pairing of $D$ is zero. Choose commuting unitary representatives $U_1 \, dots.h \, U_r$ of a basis of $D$, where $r = "rk" D$, and write $U_i^p = c_i I$. Over an algebraic closure choose $t_i^p = c_i$ and put $X_i = t_i^(- 1) U_i$. Fix a primitive $p$th root $zeta$. The simultaneous weights of the $X_i$ form a set $Lambda subset.eq bb(F)_p^r$ with $dim "aff" \( Lambda \) = r$ and $\| Lambda \| lt.eq n$; the actual eigenvalue of $U_i$ at $lambda$ is $t_i zeta^(lambda_i)$.
  Unitarity identifies this representation with its conjugate dual, so the multiset of joint eigenvalues is preserved by raising every entry to the power $- q$. Since $- q equiv 1 med \( mod med p \)$, this operation acts on $Lambda$ by the common translation $lambda mapsto lambda + delta$, where
  $ zeta^(delta_i) = t_i^(- \( q + 1 \)) . $
  The right side is a $p$th root of unity because $c_i^(q + 1) = 1$. A nonzero translation would imply
  $ "rk" D lt.eq \| Lambda \| \/ p lt.eq n \/ p < n - 2 \, $
  by (47), which is impossible. The translation is therefore zero. Hence $t_i^(q + 1) = 1$ for every $i$. In particular $t_i in mu_(q + 1) subset.eq K$, so the $X_i$ are unitary matrices over $K$ with eigenvalues in $mu_p$. Their simultaneous eigenspaces are defined over $K$. Distinct weights are orthogonal: if their $i$th eigenvalues differ, invariance of the hermitian form multiplies their pairing by the nonidentity ratio of those eigenvalues. Each eigenspace is nondegenerate since their orthogonal direct sum is the whole space. They therefore admit orthogonal nondegenerate line refinements over $K$. On such a refinement the $X_i$ are diagonal $p$-signs, so their projective images belong to $S \( cal(D) \)$. Thus $D lt.eq S \( cal(D) \) ∩ H$ for some frame.
  If $B = D$, this contradicts $"rk" B > h_0$. Otherwise choose $b in B \\ M$. Its field action has order $p$ and hence fixes the cyclic group $mu_p$, whose automorphism group has order $p - 1$. Projective commutation with $D$ once more permutes its weights by a translation. The same rank inequality excludes a nonzero translation, so $b$ preserves every nondegenerate eigenspace just obtained.
  Write $q = s^p$ and let $sigma$ be the order-$p$ field action of $b$ on $K$; its fixed field is $K_0 = bb(F)_(s^2)$. A unitary semilinear representative $T$ of $b$ satisfies $T^p = c I$, where $c in mu_(q + 1)$ and $c^sigma = c$, so $c in mu_(s + 1)$. The norm
  #[#set math.equation(numbering: n => "(56)")
   $ N : mu_(q + 1) arrow.r mu_(s + 1) $ <eq:unitary-norm>]
  for $K \/ K_0$ is onto. Indeed, writing
  $ k = frac(s^p + 1, s + 1) \, #h(2em) ell = frac(s^p - 1, s - 1) \, $
  its exponent is $\( s^(2 p) - 1 \) \/ \( s^2 - 1 \) = k ell$. Since $p$ is odd, $ell = 1 + s + dots.h.c + s^(p - 1) equiv 1 med \( mod med s + 1 \)$. As $\| mu_(q + 1) \| = k \( s + 1 \)$, the image has order $s + 1$ and the kernel has order $k$. This norm is unchanged if another generator of $"Gal" \( K \/ K_0 \)$ is used. Choose $a in mu_(q + 1)$ with $N \( a \) = c^(- 1)$. Replacing $T$ by $a T$ gives $T^p = I$ while preserving its unitary semilinear action.
  Semilinear descent now gives an $n$-dimensional space $V_0$ over $K_0$. The hermitian form descends: on fixed vectors its values lie in $K_0$, and the involution $x mapsto x^q$ restricts there to $x mapsto x^s$. Each of the $T$-stable nondegenerate eigenspaces descends as well. Choose an orthogonal line frame within each descended eigenspace and extend scalars back to $K$. The resulting frame $cal(D)$ is compatible with $b$, contains $D$ in its signs, and has each line fixed by $b$. Since $sigma$ fixes $mu_p$, $b$ centralizes all of $S \( cal(D) \)$. Hence
  $ B lt.eq \( S \( cal(D) \) ∩ H \) times chevron.l b chevron.r \, $
  an elementary group of rank $h_0 + 1$. This proves (55) with the asserted compatible realization.
  We now construct a cycle in the degree dictated by this calculation. Set $c = n - 1 - h_0 in { 0 \, 1 }$. If $m_p \( H \) = h_0$, use Theorem 11 on all unitary frames with parameter $q$. Here $q gt.eq 5$: the smaller odd possibility $q = 3$ has no odd prime dividing $q + 1$. It gives a nonzero cycle with top rank $n - 1$ in $M$. Its intersection index in $H$ is the constant $p^c$, so Lemma 19 produces a nonzero cycle in degree
  #[#set math.equation(numbering: n => "(57)")
   $ \( n - 1 \) - 1 - c = h_0 - 1 = m_p \( H \) - 1 . $ <eq:unitary-undecorated-degree>]
  Suppose instead that $m_p \( H \) = h_0 + 1$. Fix the nontrivial field image of a compatible element $b$ supplied above. Use all pairs consisting of an order-$p$ lift of this fixed image in $H$ and a compatible orthogonal line frame. For each lift that occurs, the normalization and descent just proved identify its compatible frames with all hermitian frames over the parameter $s = q^(1 \/ p)$. Fermat’s congruence gives $s equiv s^p = q equiv - 1 med \( mod med p \)$, so $p divides s + 1$. As $s$ is odd, it follows that $s gt.eq 5$. The frame fraction is again at least $\( 17 \/ 25 \)^n$.
  At a fixed frame vary a given lift by a diagonal matrix with all entries in the kernel of (56). The kernel has order $k = \( q + 1 \) \/ \( s + 1 \)$, and the norm equation ensures that the modified lift still has projective order $p$. There are $k^(n - 1)$ choices modulo common scalars. As in the determinant calculation at two, restricting the modification to $L$ loses a factor at most $k$, leaving at least $k^(n - 2)$ completions in $H$. To bound $k$, write $p = 2 a + 1$ and note
  $ k = 1 + sum_(j = 1)^a \( s^(2 j) - s^(2 j - 1) \) gt.eq s^2 - s + 1 gt.eq 21 . $
  Consequently
  $ (17 / 25)^n > 1 / 21^(n - 2) #h(2em) \( n gt.eq 5 \) . $
  At $n = 5$ the left side exceeds $1 \/ 32 > 1 \/ 9261$, and increasing $n$ multiplies the ratio of the two sides by $357 \/ 25$. The detection argument used above applies without change: the full group $E = S \( cal(D) \) times chevron.l b chevron.r$ recovers its linear kernel and frame, and the split flags through the line $chevron.l b chevron.r$ recover the lift of the fixed field generator. All the hypotheses of Lemma 16 are therefore satisfied.
  We obtain a nonzero cycle with top rank $n$. For every supporting group $E$, the decoration lies in $H$ and
  $ E ∩ H = \( S \( cal(D) \) ∩ H \) times chevron.l b chevron.r \, #h(2em) \| E : E ∩ H \| = p^c . $
  Lemma 19 gives a nonzero cycle of degree
  #[#set math.equation(numbering: n => "(58)")
   $ n - 1 - c = h_0 = m_p \( H \) - 1 . $ <eq:unitary-decorated-degree>]
  In both cases the resulting cycle has a nonzero coefficient and lies in the largest possible chain degree of $cal(A)_p \( H \)$. There are no chains one degree higher, so this cycle cannot be a boundary. This proves the proposition. ◻
]

== 7 Symplectic components at two <sec:symplectic>

For a symplectic component, signs on a decomposition into planes leave room for a quaternion four-group. Its two-dimensional space of local chain coefficients provides the extra factor needed in the smallest case. We construct the cycle directly inside the selected faithful component extension, then apply Lemma 9 at a supported full flag.

#thm([Proposition 7.1.])[
  #emph[A minimal-order counterexample to (2) at $p = 2$ cannot have a simple component isomorphic to $"PSp"_(2 n) \( q \)$, where $n gt.eq 3$ and $q$ has characteristic at least five.]
] <prop:symplectic>

Throughout this section, $V$ is a $2 n$-dimensional vector space over $bb(F)_q$ with nondegenerate alternating form $omega$, and $L = "PSp" \( V \)$. Write $M = "PGSp" \( V \)$ for the projective group of linear symplectic similitudes. In this range the automorphism theorem #cite(label("Steinberg1960")) Section 2 and statements 3.2–3.6 gives $"Aut" \( L \) = M times.r "Gal" \( bb(F)_q \/ bb(F)_ell \)$, where $ell$ is the characteristic; there is no additional diagram automorphism. Thus $"Aut" \( L \) \/ M$ is cyclic. We use projective classes of semilinear similitudes for the elements of this group, as in Section 2.

=== 7.1 Plane signs and the quaternion action <plane-signs-and-the-quaternion-action>

Let $cal(D) = { V_1 \, dots.h \, V_n }$ be an unordered orthogonal decomposition of $V$ into nondegenerate planes. Its linear sign group and projective sign group are

$ hat(S) \( cal(D) \) = { "diag" \( epsilon.alt_1 "id"_(V_1) \, dots.h \, epsilon.alt_n "id"_(V_n) \) : epsilon.alt_i in { 1 \, - 1 } } \, #h(2em) S \( cal(D) \) = hat(S) \( cal(D) \) \/ chevron.l - "id"_V chevron.r . $

All these signs are symplectic, and $S \( cal(D) \) lt.eq L$ has rank $n - 1$.

A #emph[quaternion four-group compatible with $cal(D)$] is a subgroup $T lt.eq L$ generated by the projective classes of two operators $I \, J in "Sp" \( V \)$ such that

#[#set math.equation(numbering: n => "(59)")
 $ I^2 = J^2 = - "id"_V \, #h(2em) I J = - J I \, $ <eq:symp-quaternion>]

and both operators preserve every $V_i$. On each plane these operators generate its full matrix algebra. Indeed, after extending scalars to an algebraic closure, $I$ has two distinct eigenvalues and $J$ interchanges the two eigenlines. The resulting diagonal and off-diagonal matrix units span the full matrix algebra; its dimension is therefore already four over $bb(F)_q$.

Such pairs exist over every finite field of odd order. On a plane choose

$ I = mat(delim: "(", 0, 1; - 1, 0) \, #h(2em) J = mat(delim: "(", a, b; b, - a) \, #h(2em) a^2 + b^2 = - 1 . $

The equation has a solution: if $- 1$ is a square this follows by factoring the left side over the field, and otherwise it is the surjectivity of the norm from its quadratic extension. These matrices have determinant one and satisfy (59). Repeating the construction on orthogonal planes gives the required operators on $V$. Each of $I \, J \, I J$ is nonscalar on every plane, so $T ∩ S \( cal(D) \) = 1$. Consequently

#[#set math.equation(numbering: n => "(60)")
 $ A_0 \( cal(D) \, T \) = S \( cal(D) \) times T lt.eq L \, #h(2em) "rk" A_0 \( cal(D) \, T \) = n + 1 . $ <eq:symp-seed>]

#thm([Lemma 7.2.])[
  #emph[For $n gt.eq 3$ and a pair $\( cal(D) \, T \)$ as above, 
$ C_M #scale(x: 120%, y: 120%)[\(] A_0 \( cal(D) \, T \) #scale(x: 120%, y: 120%)[\)] = A_0 \( cal(D) \, T \) . $

 Every semilinear projective transformation centralizing $S \( cal(D) \)$ preserves each plane of $cal(D)$ individually.]
] <lem:symp-centralizer>

#proof[
  The weights of $hat(S) \( cal(D) \) tilde.equiv bb(F)_2^n$ on $V$ are its distinct coordinate characters $e_1 \, dots.h \, e_n$, with weight spaces $V_1 \, dots.h \, V_n$. A projective centralizer, represented by $g$, satisfies
  $ g d g^(- 1) = c \( d \) d #h(2em) \( d in hat(S) \( cal(D) \) \) \, $
  where $c$ is a character with values in ${ 1 \, - 1 }$: these values follow by squaring, and multiplicativity follows by taking products. This holds also for semilinear $g$, since field automorphisms fix the signs. The induced permutation of weight spaces must therefore preserve the set ${ e_1 \, dots.h \, e_n }$ by translation by a single character $t$. If $t eq.not 0$ and $e_i + t = e_j$, then $i eq.not j$ and $t = e_i + e_j$. For a third index $k$, the character $e_k + t$ has three nonzero coordinates and is not a coordinate character. This contradiction proves individual preservation of all the planes.
  Now let $g$ be linear and centralize $A_0$ projectively. Projective commutation with $I$ and $J$ gives
  $ g I g^(- 1) = epsilon.alt I \, #h(2em) g J g^(- 1) = eta J \, #h(2em) epsilon.alt \, eta in { 1 \, - 1 } \, $
  because $I^2 = J^2 = - "id"_V$. Conjugation by $I$ changes the sign of $J$, and conjugation by $J$ changes the sign of $I$. Multiplying $g$ by one of $1 \, I \, J \, I J$ therefore makes it commute exactly with both operators. It still preserves every plane. The full matrix-algebra calculation above now shows that its restriction to $V_i$ is $lambda_i "id"_(V_i)$. The similitude multiplier is $lambda_i^2$ on each nondegenerate plane, so all $lambda_i^2$ are equal. After multiplication by the common scalar $lambda_1^(- 1)$, these restrictions are independent signs. Hence the projective class of the original $g$ lies in $S \( cal(D) \) T$. The reverse inclusion holds because $A_0$ is abelian. ◻
]

For fixed $T$, the compatible decompositions have the form required by the symmetric case of Theorem 11. Here are the details of that identification. The algebra generated by $I$ and $J$ is $"End" \( U \) tilde.equiv M_2 \( bb(F)_q \)$, where $U$ is its two-dimensional simple module. Complete reducibility, or the matrix units of this algebra, gives

#[#set math.equation(numbering: n => "(61)")
 $ V tilde.equiv U ⊗_(bb(F)_q) W \, #h(2em) dim W = n . $ <eq:symp-multiplicity>]

Choose a nonzero invariant alternating form $omega_U$ on $U$. Invariant bilinear forms on $U$ form a one-dimensional space: under the identification $U tilde.equiv U^(*)$ supplied by $omega_U$, a second invariant form corresponds to an operator commuting with $I \, J$, and hence to a scalar. It follows that the original form is

$ omega = omega_U ⊗ B_W $

for a bilinear form $B_W$ on $W$. Alternation of $omega$ makes $B_W$ symmetric, and nondegeneracy of $omega$ makes $B_W$ nondegenerate. Submodules of $U ⊗ W$ are exactly the spaces $U ⊗ W'$ with $W' lt.eq W$. In particular, the nondegenerate invariant planes are $U ⊗ w$, where $w$ is a nondegenerate line of $W$, and two such planes are orthogonal exactly when their lines are orthogonal for $B_W$. Thus compatible plane decompositions are in bijection with all orthogonal nondegenerate line frames of the symmetric space $\( W \, B_W \)$. Both line norm types are allowed.

=== 7.2 Maximal configurations and field descent <maximal-configurations-and-field-descent>

Suppose, toward Proposition 24, that $G$ is a minimal counterexample with the component $L$. Consider all elementary abelian subgroups $A lt.eq N_G \( L \)$ such that

#[#set math.equation(numbering: n => "(62)")
 $ A upright(" contains some ") A_0 \( cal(D) \, T \) \, #h(2em) L A upright(" acts faithfully on ") L \, #h(2em) O_2 \( C_G \( L A \) \) = 1 . $ <eq:symp-configurations>]

This family is closed under elementary overgroups that are faithful configurations, since such an overgroup still contains the same seed. It is nonempty: take $A = A_0 lt.eq L$ and apply Lemma 4 to obtain $O_2 \( C_G \( L \) \) = 1$. Choose a member $A$ of maximum rank, put $m = "rk" A$, and write $H = L A$. Identify this faithful group with its image in $"Aut" \( L \)$.

Since $A$ centralizes its subgroup $A_0$, Lemma 25 gives $A ∩ M = A_0$. The quotient $"Aut" \( L \) \/ M$ is cyclic, so its elementary abelian subgroups have rank at most one. Therefore

#[#set math.equation(numbering: n => "(63)")
 $ m = n + 1 quad upright("or") quad m = n + 2 . $ <eq:symp-ranks>]

In the first case $A = A_0$ and $H = L$. In the second,

$ A = A_0 times chevron.l b chevron.r \, #h(2em) H \/ L tilde.equiv C_2 \, #h(2em) H ∩ M = L \, $

where $b$ induces the involution $sigma$ of $bb(F)_q \/ bb(F)_s$ and $q = s^2$. The field parameter $s$ is at least five.

The next normalization is essential for the construction. We will require the field axis to commute #emph[exactly] with the quaternion lifts, not merely with their projective classes.

#thm([Lemma 7.3.])[
  #emph[Let $T = chevron.l overline(I) \, overline(J) chevron.r$ satisfy (59), and let the projective semilinear involution $b$ centralize $S \( cal(D) \) T$ and induce $sigma in "Gal" \( bb(F)_q \/ bb(F)_s \)$, where $q = s^2$. Replacing $b$ by $t b$ for some $t in T$ leaves $chevron.l S \( cal(D) \) \, T \, b chevron.r$ unchanged and permits a semilinear representative $B$ with 
$ B^2 = "id"_V \, #h(2em) B I = I B \, #h(2em) B J = J B . $

 After scaling $omega$, its restriction to $V_0 = { v : B v = v }$ is a nondegenerate alternating form over $bb(F)_s$, and $I \, J$ descend to symplectic operators on $V_0$. For fixed $T \, b$ satisfying these exact commutation conditions, the compatible plane decompositions are all orthogonal nondegenerate line frames of a symmetric $n$-dimensional space over $bb(F)_s$.]
] <lem:symp-descent>

#proof[
  For any semilinear representative of $b$, conjugation of $I$ and $J$ differs from the identity by two signs, since their squares are $- "id"_V$ and $sigma$ fixes $- 1$. As in Lemma 25, multiplication by one of $1 \, I \, J \, I J$ removes both signs. Its projective class is still an involution: the classes $b$ and $t$ commute and have order two. Denote the resulting representative temporarily by $B$. Since $B^2 = c "id"_V$, the identity $B B^2 = B^2 B$ implies $sigma \( c \) = c$. The norm $bb(F)_q^times arrow.r bb(F)_s^times$ is surjective, so choose $a$ with $a sigma \( a \) = c^(- 1)$. Replacing $B$ by $a B$ makes its square the identity and preserves exact commutation with $I \, J$.
  Write the semilinear similitude identity as
  $ omega \( B v \, B w \) = mu thin sigma \( omega \( v \, w \) \) . $
  The equality $B^2 = "id"_V$ gives $mu sigma \( mu \) = 1$. Choose $t in bb(F)_q^times$ with $sigma \( t \) \/ t = mu$, by the finite-field form of Hilbert’s Theorem 90 #cite(label("MilneFields2022")) Corollary 5.25. Then $omega' = t omega$ satisfies
  $ omega' \( B v \, B w \) = sigma \( omega' \( v \, w \) \) . $
  The fixed-vector descent statement in Section 6.2 identifies $V$ with $bb(F)_q ⊗_(bb(F)_s) V_0$. The form $omega'$ takes values in $bb(F)_s$ on $V_0$, and its restriction is nondegenerate because its scalar extension is $omega'$. Exact commutation makes $I \, J$ operators on $V_0$ preserving this form and satisfying the same quaternion equations.
  Each original plane is $B$-stable by Lemma 25, and hence descends to a nondegenerate symplectic plane over $bb(F)_s$. Applying (61) over $bb(F)_s$ gives $V_0 tilde.equiv U_0 ⊗ W_0$ with an alternating form on $U_0$ and a nondegenerate symmetric form on $W_0$. The preceding submodule argument identifies all the compatible decompositions with all the orthogonal line frames of $W_0$. Conversely, every such frame extends to a decomposition compatible with $T$ and $B$. This proves the assertion in both directions. ◻
]

We now specify the finite family of data from which the cycle will be formed. If $m = n + 1$, a datum is any pair $\( cal(D) \, T \)$ as in (60); its full elementary group is $E = S \( cal(D) \) T$. If $m = n + 2$, a datum is a triple $\( cal(D) \, T \, b \)$, where $\( cal(D) \, T \)$ has that meaning, $b in H \\ L$ is an involution preserving each plane, and a semilinear representative of $b$ commutes exactly with the lifts $I \, J$. The full elementary group is then

#[#set math.equation(numbering: n => "(64)")
 $ E = S \( cal(D) \) times T times chevron.l b chevron.r . $ <eq:symp-full-data>]

The exact condition is independent of the scalar representative of $b$ and of the choices of the signs of $I \, J$. It also holds for every element of their quaternion group once it holds for $I \, J$. Lemma 26 shows that this family is nonempty, since the original field axis may be shifted inside $T lt.eq L$.

For each fixed decoration $T$, or fixed pair $\( T \, b \)$, we use every compatible frame. The preceding arguments identify these frames with the symmetric spaces in Theorem 11, over

#[#set math.equation(numbering: n => "(65)")
 $ u = q quad upright("if ") m = n + 1 \, #h(2em) u = s quad upright("if ") m = n + 2 . $ <eq:symp-field-parameter>]

We impose no restriction on the isometry type of the multiplicity space as the decorations vary. The frame bound is uniform in that type; this matters because changing a field axis can change the descended symmetric form. Coarsening two lines of the multiplicity space coarsens their two invariant planes, and the equal-sign subgroups are unchanged by the identification. Thus the face identifications required by the frame theorem hold in the actual elementary subgroup poset.

=== 7.3 Completion counts <completion-counts>

To apply Lemma 17, we need lower bounds for two kinds of completions: restoring a quaternion four-group from one of its lines, and restoring a field axis. We keep all the remaining data fixed in each count.

#thm([Lemma 7.4.])[
  #emph[Let $u$ be as in (65), and let $chi_u$ denote the quadratic character of $bb(F)_u^times$. A fixed plane frame and retained line of a compatible quaternion four-group, together with a fixed admissible field axis when present, have at least 
$ k_T = frac(\( u - chi_u \( - 1 \) \)^n, 4) gt.eq 4^(n - 1) $

 completions to admissible full data. In the field case, every retained pair $\( cal(D) \, T \)$ that occurs has at least $k_b = 2^(n - 1)$ admissible field-axis completions in $H \\ L$.]
] <lem:symp-completions>

#proof[
  Choose the symplectic lift $I$ of the retained line with $I^2 = - "id"_V$. In the field case use the descended space from Lemma 26; exact commutation ensures that $I$ is defined over $bb(F)_u$. It suffices to count, on every descended plane, determinant-one partners $J_i$ satisfying $J_i^2 = - "id"$ and $I J_i = - J_i I$.
  If $- 1$ is a square in $bb(F)_u$, choose $r in bb(F)_u$ with $r^2 = - 1$ and write $I = "diag" \( r \, - r \)$. Its anticommuting partners are precisely
  $ J_i = mat(delim: "(", 0, a; - a^(- 1), 0) \, #h(2em) a in bb(F)_u^times \, $
  giving $u - 1$ choices. If $- 1$ is nonsquare, identify the plane with $bb(F)_(u^2)$ so that $I$ is multiplication by a square root of $- 1$. Writing $tau$ for the nontrivial field automorphism, every anticommuting map has the form $x mapsto a tau \( x \)$. Its square is multiplication by $a tau \( a \)$, so the required condition is $N \( a \) = - 1$. There are $u + 1$ choices. Their determinant is $- N \( a \) = 1$, as required.
  The choices on the $n$ planes are independent and give $\( u - chi_u \( - 1 \) \)^n$ global symplectic lifts $J$. For a fixed $I$ and a resulting projective four-group, the possible partners are exactly
  $ J \, quad - J \, quad I J \, quad - I J . $
  Indeed the new projective element is one of the two lines of $T$ different from $chevron.l overline(I) chevron.r$, and each has its two symplectic lifts. Dividing by four gives the stated number of distinct completions in this family. In the field case all these operators were chosen over the descended field, so they commute exactly with $B$ and remain admissible. Their projective classes belong to $L$, so they impose no additional outer-coset condition. Finally, $u gt.eq 5$ gives $u - chi_u \( - 1 \) gt.eq 4$.
  For the second count, fix one admissible $b$ and a representative $B$ with $B^2 = "id"_V$. Every $D in hat(S) \( cal(D) \)$ commutes exactly with $I \, J \, B$; the last assertion follows because $B$ preserves the planes and fixes their signs. Thus $\( D B \)^2 = "id"_V$, and $D B$ still commutes exactly with $I \, J$. Its projective class lies in $H \\ L$ because the class of $D$ lies in $L$. The $2^n$ linear signs give $2^(n - 1)$ distinct projective axes, with only $D$ and $- D$ identified. All of them belong to our family, including when their descended multiplicity forms have different isometry types. ◻
]

=== 7.4 Detection and the strict dimension inequality <detection-and-the-strict-dimension-inequality>

We must check that the parameters counted by the decoration lemma are coefficients of actual subgroup flags. This check precedes the dimension comparison, since different data can have the same full elementary group $E$.

For any linear group $K = S \( cal(D) \) T$, choose symplectic lifts of its elements. Their commutators define an alternating bilinear pairing

$ beta_K : K times K arrow.r { 1 \, - 1 } \, #h(2em) \[ hat(x) \, hat(y) \] = beta_K \( x \, y \) "id"_V . $

The pairing is independent of the lifts. It vanishes on $S \( cal(D) \)$ and is nondegenerate on $T$ by (59); hence its radical is exactly $S \( cal(D) \)$. Thus $K$ intrinsically recovers $S \( cal(D) \)$, whose full symplectic preimage has joint eigenspaces precisely the planes of $cal(D)$. Without a field axis, $E = K$; with one, $K = E ∩ M$ is recovered first. In either case the full group recovers its plane frame and sign group.

Write $cal(L) \( T \)$ for the three lines of $T$. Its local coefficient space is

#[#set math.equation(numbering: n => "(66)")
 $ {\( c_t \)_(t in cal(L) \( T \)) in bb(Q)^3 : sum_(t in cal(L) \( T \)) c_t = 0} . $ <eq:symp-local-two>]

It has dimension two and is represented by the coned chains $sum_t c_t \[ t < T \]$. The sum-zero condition cancels the face $\[ T \]$; dropping the top $T$ leaves one coefficient at each retained line. This is the quaternion input to Lemma 17.

Let $S_1 < dots.h.c < S_(n - 1) = S \( cal(D) \)$ be a full sign flag. Without a field axis, test the split construction on flags

#[#set math.equation(numbering: n => "(67)")
 $ t < T < T S_1 < dots.h.c < T S_(n - 1) = E \, #h(2em) t in cal(L) \( T \) . $ <eq:symp-detection-no-field>]

A second datum with the same full group has the same sign group $S$. Each vertex in its split construction is a product of a subgroup of $S$ and a subgroup of its chosen complement $T'$. Since the rank-two vertex $T$ in (67) is disjoint from $S$, it can occur only if $T' = T$. The flags below $T$ then evaluate the three coordinates in (66), and intersecting the remaining vertices with $S$ recovers the sign flag. The coefficient on the displayed flag is, up to its fixed shuffle sign, the product of those two coefficient evaluations. Such flags therefore detect the full tensor product of the local and frame parameter spaces.

With a field axis, write $B_0 = chevron.l b chevron.r$ and instead test

#[#set math.equation(numbering: n => "(68)")
 $ B_0 < B_0 t < B_0 T < B_0 T S_1 < dots.h.c < B_0 T S_(n - 1) = E . $ <eq:symp-detection-field>]

The first vertex is outside $M$. In a competing split construction, the only rank-one vertex outside $M$ is its selected field axis, so that axis must equal $B_0$. Next, $\( B_0 T \) ∩ M = T$, which is disjoint from $S$ and has rank two. The same argument as before forces its quaternion complement to equal $T$. The choices of $t$ and of the sign flag detect all the remaining parameters. Consequently there is no loss of dimension from coincident cone groups in either construction.

We can now apply the quantitative lemmas. Let $N$ be the number of full data and set $a_n = \( n - 1 \) !$. By Theorem 11, the initial space of actual coefficients, summed over the fixed decorations, has dimension at least

$ 2 F a_n N \, #h(2em) F gt.eq \( 17 \/ 25 \)^n \, #h(2em) F gt.eq 3 \/ 8 upright(" when ") n = 3 . $

Here the same $F$ is a valid lower bound for each multiplicity-space isometry type. There are three retained-line incidences per full datum. Lemma 27 bounds the number of such partial data by $3 N \/ k_T$, and each costs at most $a_n$ equations. In the field case the number of data with the field axis removed is at most $N \/ k_b$, each costing at most $2 a_n$ equations. Thus Lemma 17 yields a nonzero cycle provided

#[#set math.equation(numbering: n => "(69)")
 $ F > frac(3, 2 k_T) + cases(delim: "{", 0 \, & m = n + 1 \,, 2^(1 - n) \, & m = n + 2 .) $ <eq:symp-inequality>]

The factor two in the denominator of the quaternion term comes from the two local parameters in (66); each retained-line face has only one.

For $n = 3$ the worst completion bound occurs at $u = 5$, giving $k_T = 4^3 \/ 4 = 16$. Even with a field axis,

#[#set math.equation(numbering: n => "(70)")
 $ F gt.eq 3 / 8 = 12 / 32 > 3 / 32 + 1 / 4 = 11 / 32 . $ <eq:symp-smallest>]

For $n = 4$ the weaker uniform bound already gives

$ (17 / 25)^4 = 83521 / 390625 > 19 / 128 = frac(3, 2 dot.op 4^3) + 1 / 8 . $

When $n$ increases by one, the first term on the right is multiplied by $1 \/ 4$ and the second by $1 \/ 2$, whereas the left side is multiplied by $17 \/ 25 > 1 \/ 2$. Induction proves (69) for every $n gt.eq 4$, and omitting the field term only strengthens it.

We have therefore obtained a nonzero cycle

$ alpha in tilde(C)_(m - 1) \( cal(A)_2 \( H \) \; bb(Q) \) $

supported on full flags ending at the rank-$m$ groups $E$ in our data family. All its vertices lie in $H$: plane signs and quaternion generators lie in $L$, and every field axis was chosen in $H$. No restriction from a larger automorphism group is needed in this case.

=== 7.5 Propagation from a supported full group <propagation-from-a-supported-full-group>

Choose a full flag with nonzero coefficient in $alpha$, and let $A'$ be its last group. The construction gives $A' ∩ L supset.eq A_0 \( cal(D)' \, T' \) eq.not 1$ for its datum, and

$ L A' = H . $

Indeed this is immediate if $H = L$; otherwise $A'$ contains its chosen field involution in the nontrivial coset of $H \/ L$. Thus $L A'$ acts faithfully on $L$, and $O_2 \( C_G \( L A' \) \) = O_2 \( C_G \( H \) \) = 1$. The group $A'$ belongs to the family (62) and has its maximum rank $m$.

The selected flag is saturated and has nonzero coefficient in the cycle $alpha in tilde(C)_(m - 1) \( cal(A)_2 \( L A' \) \; bb(Q) \)$. Corollary 10 therefore applies to $A'$ and the family (62). It contradicts the assumed minimal counterexample, proving Proposition 24.

== 8 Orthogonal components <sec:orthogonal>

In this section the prime is two. We construct the coefficient required by Lemma 9 for orthogonal components. The main choices are the square classes of the norms in an orthogonal line decomposition. They control both the inner sign subgroup and the index lost on restriction.

#thm([Proposition 8.1.])[
  #emph[Let $G$ be a minimal-order counterexample to rational augmented reduced homology nonvanishing at the prime two. Thus $O_2 \( G \) = 1$ and $tilde(H)_(*) \( cal(A)_2 \( G \) \; bb(Q) \) = 0$, whereas the asserted nonvanishing holds for smaller groups with trivial $2$-core. Then $G$ has no simple component $L = upright(P) Omega \( V \)$, where $V$ is a nondegenerate symmetric space over $bb(F)_q$, the characteristic of $bb(F)_q$ is at least five, and its dimension $N$ is odd with $N gt.eq 5$, even with $N gt.eq 8$, or equal to six, except possibly when $N = 6$, $q = 5$, and the determinant of the form is a square. In odd dimension $upright(P) Omega \( V \) = Omega \( V \)$.]
] <prop:orthogonal>

We use the determinant convention for discriminants: if $B$ is a Gram matrix of the symmetric form, its discriminant is $det B in bb(F)_q^(*) \/ \( bb(F)_q^(*) \)^2$. We do not multiply this determinant by a dimension-dependent sign. In particular, for $N = 2 n$ the usual plus type has determinant class $\( - 1 \)^n$, and minus type has the other class. In odd dimension we scale the form to make its determinant square. This does not change its isometry or similarity group, and it is possible because scaling by $a$ multiplies the determinant by $a^N$.

Write $Q \( v \) = B \( v \, v \)$ and let $"PO" \( V \)$ denote the image of the isometry group in $"PGL" \( V \)$. The spinor norm is normalized so that the reflection in an anisotropic vector $v$ has spinor norm $Q \( v \)$ modulo squares. The common kernel of determinant and spinor norm in the isometry group is $Omega \( V \)$, whose projective image is $L$; see #cite(label("Taylor1992"), form: "prose") Lemma 11.49 and Theorems 11.50–11.51. These statements apply to the present isotropic spaces over odd finite fields, all of dimension at least five. We use the classical automorphism theorem in its natural-module form: automorphisms of these simple groups are induced by semilinear similarities, with the additional diagram automorphisms in split dimension eight discussed below #cite(label("Steinberg1960")) Section 2 and statements 3.2–3.6; see also #cite(label("GLS1998"), form: "prose"). The groups in dimension six include the standard isomorphisms

$ upright(P) Omega_6^(+) \( q \) tilde.equiv "PSL"_4 \( q \) \, #h(2em) upright(P) Omega_6^(-) \( q \) tilde.equiv "PSU"_4 \( q \) . $

These identifications follow from the linear and unitary covers in #cite(label("Taylor1992"), form: "prose") Corollaries 12.21 and 12.36.

=== 8.1 Sign groups, parity, and their centralizers <sign-groups-parity-and-their-centralizers>

An orthogonal line frame is an unordered decomposition $cal(D) = { ell_1 \, dots.h \, ell_N }$ into nondegenerate orthogonal lines. Color a line square or nonsquare according to the square class of its nonzero norms. Let $I$ be the set of nonsquare positions and put $k = \| I \|$. The group of independent signs on these lines, modulo their common sign, is

$ S \( cal(D) \) = bb(F)_2^N \/ chevron.l j chevron.r \, #h(2em) j = \( 1 \, dots.h \, 1 \) \, $

embedded in $"PO" \( V \)$. We abbreviate its inner part to $T \( cal(D) \) = S \( cal(D) \) ∩ L$. On $bb(F)_2^N$ define

$ t \( x \) = sum_(i = 1)^N x_i \, #h(2em) c \( x \) = sum_(i in I) x_i . $

The corresponding diagonal isometry has determinant $\( - 1 \)^(t \( x \))$ and spinor norm of square class $c \( x \)$. Consequently the inverse image of $T \( cal(D) \)$ in $bb(F)_2^N$ is

#[#set math.equation(numbering: n => "(71)")
 $ U = \( ker t ∩ ker c \) + chevron.l j chevron.r \, #h(2em) U^perp = chevron.l t \, c chevron.r ∩ j^perp . $ <eq:orthogonal-inner-preimage>]

The addition of $chevron.l j chevron.r$ accounts for the possibility of replacing an isometry by its negative before testing membership in $Omega \( V \)$.

Here are the sign groups we shall use. The homogeneous rows mean that all lines have the same color; in the odd-dimensional row our determinant normalization makes this the square color. Mixed rows require both colors to occur.

#[#set math.equation(numbering: n => "(72)")
 $ upright("dimension and determinant") & upright("frame") & U^perp & "rk" T \( cal(D) \)\
N upright(" even, nonsquare") & k upright(" odd") & chevron.l t chevron.r & N - 2\
N upright(" odd, square") & upright("homogeneous") & 0 & N - 1\
N upright(" even, square") & upright("homogeneous") & chevron.l t chevron.r & N - 2\
N upright(" odd, square") & k upright(" even, mixed") & chevron.l c chevron.r & N - 2\
N upright(" even, square") & k upright(" even, mixed") & chevron.l t \, c chevron.r & N - 3 $ <eq:orthogonal-rank-table>]

Indeed $t \( j \) = N med mod med 2$ and $c \( j \) = k med mod med 2$, so the annihilators follow directly from (71); the ranks are $dim U - 1$. The discriminant of a frame is the product of its line norm classes, so its being square is equivalent to $k$ being even.

We say that a projective sign subgroup distinguishes the positions if no two coordinate characters agree on its inverse image in $bb(F)_2^N$. Equality at positions $i eq.not j$ would mean $e_i^(*) + e_j^(*) in U^perp$. Thus the first three rows of (72) distinguish all positions for the dimensions under consideration. The fourth row does so when $k gt.eq 4$. The fifth does so when $k gt.eq 4$ and $N - k gt.eq 4$, because its three nonzero annihilator vectors have supports $I$, $I^c$, and the entire set.

#thm([Lemma 8.2.])[
  #emph[Let $T = T \( cal(D) \)$ distinguish all $N$ positions and satisfy $"rk" T > N \/ 2$. Then every natural semilinear similarity centralizing $T$ projectively preserves each line of $cal(D)$. Its linear centralizer is exactly $S \( cal(D) \)$. In dimension eight the same conclusions hold for the full automorphism centralizer if some color class has at least three members. Every elementary abelian subgroup of $"Aut" \( L \)$ containing $T$ therefore lies in the natural semilinear group, centralizes $S \( cal(D) \)$, and has at most one direction beyond its subgroup in $S \( cal(D) \)$.]
] <lem:orthogonal-centralizer>

#proof[
  Let $tilde(T)$ be the inverse image of $T$ in the diagonal sign group. Its $N$ coordinate weights $lambda_i$ are distinct. Their differences vanish on the common scalar sign and span $T^(*)$, so their affine span has dimension $"rk" T$. A projective centralizer element conjugates each sign matrix to itself times a scalar sign. Field automorphisms fix $1$ and $- 1$. Hence its permutation of the weight set is translation by a single character $mu in T^(*)$.
  If $mu eq.not 0$, the $N$ weights fall into $N \/ 2$ pairs ${ lambda \, lambda + mu }$. Choosing one representative of each pair shows that their affine span has dimension at most $\( N \/ 2 - 1 \) + 1 = N \/ 2$, a contradiction. Thus $mu = 0$ and every weight line is preserved. A linear similarity preserving those lines is diagonal, say with entries $a_i$. Its common multiplier satisfies $a_i^2 = eta$ for every $i$, and therefore $a_i \/ a_1 in { 1 \, - 1 }$. Its projective image belongs to $S \( cal(D) \)$.
  In split dimension eight, choose three lines in one color class. The pair flips on the first two and on the last two belong to $T$, since each has determinant one and square spinor norm. Lemma 30 below shows that an automorphism centralizing both is natural; it also gives naturality of all automorphisms in minus dimension eight. In the other dimensions, the natural-module automorphism theorem recalled above already gives this conclusion. Thus the weight argument applies to every automorphism centralizing $T$.
  Finally, a semilinear map preserving every line centralizes all its projective signs. The field automorphism group is cyclic, so the image of an elementary abelian $2$-group in it has rank at most one. Its linear kernel is contained in the sign group by the preceding calculation. ◻
]

All applications below meet this lemma’s rank hypotheses. For the first three rows of (72), the minimum rank is $N - 2 > N \/ 2$ because $N gt.eq 5$. For the last row we use $N gt.eq 8$, when $N - 3 > N \/ 2$. The required color class in dimension eight always exists.

=== 8.2 Naturality in dimension eight <naturality-in-dimension-eight>

The weight argument applies once an automorphism is known to act on the natural space. In split dimension eight, two inner sign changes supply that conclusion; in minus dimension eight all automorphisms have natural realizations.

#thm([Lemma 8.3.])[
  #emph[Let $V$ be a nondegenerate symmetric space of dimension eight over $bb(F)_q$, with defining characteristic at least five, and put $L = upright(P) Omega \( V \)$. If $V$ has minus type, every automorphism of $L$ is induced by a natural semilinear similarity of $V$.]
  #emph[If $V$ has plus type, let $ell_1 \, ell_2 \, ell_3$ be mutually orthogonal nondegenerate lines of the same norm square class. Let $x \, y$ be the projective isometries changing the signs on $ell_1 xor ell_2$ and $ell_2 xor ell_3$, respectively, and fixing their orthogonal complements. Then $x \, y in L$, and every automorphism of $L$ centralizing both is induced by a natural semilinear similarity of $V$.]
] <lem:orthogonal-eight-naturality>

#proof[
  Suppose first that $V$ has plus type. We keep the two central quotients of the spin group distinct. In split type $D_4$ the center of $"Spin"_8^(+) \( q \)$ has order four. The kernel of its vector representation
  $ "Spin"_8^(+) \( q \) arrow.r Omega_8^(+) \( q \) $
  is the distinguished subgroup ${ 1 \, - 1 }$; the map onto $L = upright(P) Omega_8^(+) \( q \)$ kills the full center. Choose nonzero vectors $v_i in ell_i$ for $1 lt.eq i lt.eq 3$. The pair flips $x \, y$ belong to $L$: each has determinant one and square spinor norm. In the Clifford algebra their spin lifts are scalar multiples of $v_1 v_2$ and $v_2 v_3$. The scalar normalizations can be chosen over $bb(F)_q$ because the products of the two norms are squares. Orthogonality makes the vectors anticommute, and these two lifts have commutator $- 1$.
  We now justify the covering and lifting assertions used in this commutator test. The spin cover is the finite map $tilde(L) = "Spin"_8^(+) \( q \) arrow.r L = upright(P) Omega_8^(+) \( q \)$. Its image and kernel can be checked without asserting surjectivity onto all rational points of the adjoint algebraic group. Reflection generation, the parity of a reflection product, and the spinor kernel theorem #cite(label("Taylor1992")) Theorems 11.39, 11.44, 11.50–11.51 show that $tilde(L) arrow.r "SO"_8^(+) \( q \)$ has image $Omega_8^(+) \( q \)$: an even reflection product with square product of reflecting norms can be multiplied in the Clifford algebra by a scalar in $bb(F)_q$ to obtain norm one. The vector action of an even Clifford normalizer has determinant one, since it fixes the volume element. Conversely, comparison with an even reflection product shows that the vector image of a norm-one spin element has square spinor norm. Choose a hyperbolic basis $e_1 \, dots.h \, e_4 \, f_1 \, dots.h \, f_4$ in which $Q \( sum_i x_i e_i + y_i f_i \) = sum_(i = 1)^4 x_i y_i$, and put
  $ z = product_(i = 1)^4 \( e_i + f_i \) \( e_i - f_i \) . $
  Then $z^2 = 1$, its Clifford norm is one, and its vector action is $- I$. The vector kernel is the scalar subgroup ${ 1 \, - 1 }$, so the projective kernel is $Z = { 1 \, - 1 \, z \, - z }$; this is the full center of $tilde(L)$.
  The group $tilde(L)$ is perfect. For a root $alpha$, write $x_alpha \( t \)$ and $h_alpha \( a \)$ for the unipotent and diagonal elements in its root $"SL"_2$. Root-subgroup generation and the calculation
  $ h_alpha \( a \) x_alpha \( t \) h_alpha \( a \)^(- 1) x_alpha \( - t \) = x_alpha \( \( a^2 - 1 \) t \) $
  put every root subgroup in $\[ tilde(L) \, tilde(L) \]$ once $a in bb(F)_q^times$ satisfies $a^2 eq.not 1$; such an $a$ exists for $q gt.eq 5$ #cite(label("CEKT2013")) §2, p. 416. Consequently an automorphism of $tilde(L)$ inducing the identity on $tilde(L) \/ Z$ has the form $s mapsto s chi \( s \)$ with a homomorphism $chi : tilde(L) arrow.r Z$, and is the identity. Thus any automorphism of $L$ has at most one lift to $tilde(L)$; once the generator lifts below have been constructed, their composites give a well-defined action on $Z$.
  The completeness statement needed here is Steinberg’s inner, diagonal, field and graph decomposition, whose graph quotient in split type $D_4$ is $S_3$ #cite(label("Steinberg1960")) §3, statements 3.2–3.6. The natural factors have lifts to $tilde(L)$. Inner factors lift by conjugation. For a similarity $g$ with multiplier $mu$, the even-Clifford map
  $ C_0 \( g \) \( u v \) = mu^(- 1) g \( u \) g \( v \) $
  lifts its projective conjugation action and fixes the scalar $- 1$ #cite(label("CEKT2013")) (4.1), p. 422. This includes all diagonal factors. Let $epsilon_i$ be the coordinate characters of the diagonal torus in the chosen hyperbolic basis. For simple roots $epsilon_1 - epsilon_2$, $epsilon_2 - epsilon_3$, $epsilon_3 - epsilon_4$, $epsilon_3 + epsilon_4$ and any prescribed factors $h_1 \, h_2 \, h_3 \, h_4 in bb(F)_q^times$, set
  $ \( a_1 \, a_2 \, a_3 \, a_4 \) = \( h_1 h_2 h_3 \, h_2 h_3 \, h_3 \, 1 \) \, #h(2em) mu = h_3 \/ h_4 . $
  The proper similarity $g = "diag" \( a_1 \, dots.h \, a_4 \, mu \/ a_1 \, dots.h \, mu \/ a_4 \)$ has exactly those root factors, since it scales the root parameters for $epsilon_i - epsilon_j$ and $epsilon_i + epsilon_j$ by $a_i \/ a_j$ and $a_i a_j \/ mu$, respectively. Proper similarities fix $z$, as $det \( g \) \/ mu^4 = 1$; coefficient field operations fix both $- 1$ and $z$. The improper isometry interchanging $e_4$ and $f_4$ fixes $- 1$, interchanges $z$ and $- z$, and interchanges the two spin nodes of the diagram while fixing its vector node.
  The remaining graph operation also lifts over $bb(F)_q$. The eight-dimensional para-Zorn algebra, with coordinates $alpha \, beta in bb(F)_q$ and $a \, b in bb(F)_q^3$, has hyperbolic norm $n \( alpha \, a \; b \, beta \) = alpha beta - a dot.op b$ over the ground field #cite(label("CEKT2013")) §5, pp. 425–426. In the rational related-triple description of $tilde(L)$, cyclic permutation of the three entries gives triality and cycles the three nonidentity central sign triples #cite(label("CEKT2013")) Proposition 4.6 and the following center description, p. 424. It preserves $Z$ and therefore descends to the finite quotient $tilde(L) \/ Z = L$. Let $cal(N)$ be the inner–diagonal–field subgroup in Steinberg’s normal sequence. Its lifts fix $Z$ pointwise, whereas the descended triality has order three and lies outside $cal(N)$: otherwise uniqueness of lifts would contradict its nontrivial action on $Z$. The natural improper operation has a transposition action on $Z \\ { 1 }$ and also lies outside $cal(N)$. Their images generate $"Aut" \( L \) \/ cal(N) tilde.equiv S_3$, so they and $cal(N)$ generate $"Aut" \( L \)$ and supply every automorphism with a lift. By uniqueness, the center action is a homomorphism that identifies this quotient with $"Sym" \( Z \\ { 1 } \)$. The stabilizer of $- 1$ is therefore precisely the natural subgroup: it is the inverse image of the order-two subgroup represented by the improper operation. If an automorphism centralizes the two projective pair flips, its lift sends each of their spin lifts to itself times an element of $Z$. It fixes their commutator $- 1$, and hence is natural.
  Now suppose that $V$ has minus type, and write $q = ell^f$, where the defining characteristic satisfies $ell gt.eq 5$. In type $zws^2 D_4$, the full-field factor in Steinberg’s twisted construction already includes the natural graph involution. Explicitly, over $E = bb(F)_(q^2)$ use the split hyperbolic model and let $j$ interchange $e_4 \, f_4$. The fixed space $W = "Fix" \( j compose "Frob"_q \)$ has three hyperbolic planes and the anisotropic plane with coordinates $\( u \, u^q \)$ and norm $u^(q + 1)$, hence is an eight-dimensional minus space over $bb(F)_q$. The restriction $tau = "Frob"_ell \|_W$ is a natural semilinear isometry of order $2 f$, and $tau^f = j \|_W$ is the improper graph operation. Therefore the full field group of $E$ in #cite(label("Steinberg1960")) §2 and statement 3.5 is realized naturally; the absence of an additional graph factor for the twisted group omits no natural graph automorphism.
  The twisted diagonal factors are natural as well. Their simple-root factors have the form $h_1 \, h_2 in bb(F)_q^times$ and $h_3 = h$, $h_4 = h^q$ with $h in E^times$. Set
  $ \( a_1 \, a_2 \, a_3 \, a_4 \) = \( h_1 h_2 \, h_2 \, 1 \, h^(- 1) \) \, #h(2em) mu = \( h h^q \)^(- 1) . $
  The proper similarity $g = "diag" \( a_1 \, dots.h \, a_4 \, mu \/ a_1 \, dots.h \, mu \/ a_4 \)$ has root factors $h_1 \, h_2 \, h \, h^q$ by the same calculation as above. Its first three hyperbolic pairs have coefficients in $bb(F)_q$, and its fourth pair is scaled by $\( h^(- 1) \, h^(- q) \)$. Thus $g$ commutes with $j compose "Frob"_q$ and restricts to a natural similarity of $W$, with multiplier $mu in bb(F)_q^times$. Together with the inner and full-field factors, this realizes all factors in Steinberg’s twisted decomposition naturally. ◻
]

=== 8.3 Descent and the choice of a maximal configuration <descent-and-the-choice-of-a-maximal-configuration>

#thm([Lemma 8.4.])[
  #emph[Suppose an involution $b$ of the natural projective semilinear group has nontrivial field action and preserves every line of a nondegenerate orthogonal frame of $V$. Then $q = s^2$, and after scalar normalization a representative of $b$ is an involutory semilinear map $B$ with fixed space $V_0$ over $bb(F)_s$. A scalar multiple of the form descends to a nondegenerate symmetric form on $V_0$. The compatible frames are exactly the scalar extensions of its nondegenerate orthogonal frames. All their lines have one common norm square class over $bb(F)_q$. In particular, when $N$ is even the determinant over $bb(F)_q$ is square.]
] <lem:orthogonal-descent>

#proof[
  The field action is the unique involution $sigma : a mapsto a^s$ of $bb(F)_q$. A representative $B_1$ has $B_1^2 = lambda "id"$; commuting $B_1$ with its square gives $lambda in bb(F)_s^(*)$. The field norm $bb(F)_q^(*) arrow.r bb(F)_s^(*)$ is surjective, so multiplying $B_1$ by a scalar makes its square one. The fixed-vector descent statement in Section 6.2 then gives $V = V_0 ⊗_(bb(F)_s) bb(F)_q$ for $V_0 = { v : B v = v }$.
  Write $Q \( B v \) = eta Q \( v \)^sigma$. The identity $B^2 = 1$ gives $eta eta^sigma = 1$. Hilbert’s Theorem 90 #cite(label("MilneFields2022")) Corollary 5.25 supplies $a in bb(F)_q^(*)$ with $a^sigma \/ a = eta$. Thus $Q_0 = a Q$ satisfies $Q_0 \( B v \) = Q_0 \( v \)^sigma$, and its restriction to $V_0$ is the descended form. It is nondegenerate because its scalar extension is nondegenerate. A $B$-stable line has a fixed nonzero vector by one-dimensional descent. This establishes the asserted correspondence of frames, including nondegeneracy of their summands.
  Every element of $bb(F)_s^(*)$ is a square in $bb(F)_q^(*)$, since $s + 1$ is even. On a descended line the original form has a nonzero norm $a^(- 1) u$ with $u in bb(F)_s^(*)$; its ambient square class is consequently the fixed class of $a^(- 1)$. Also $det Q = a^(- N) det Q_0$. For even $N$ both factors are squares over $bb(F)_q$, proving the last assertion. ◻
]

We now choose a family for Corollary 10. Choose a nonempty set of allowed frames whose inner signs meet Lemma 29. Consider all elementary abelian $A lt.eq N_G \( L \)$ such that $A ∩ L$ contains $T \( cal(D) \)$ for some allowed frame and

#[#set math.equation(numbering: n => "(73)")
 $ L A upright(" acts faithfully on ") L \, #h(2em) O_2 \( C_G \( L A \) \) = 1 . $ <eq:orthogonal-config>]

This family is nonempty: take $A = T \( cal(D) \) lt.eq L$, and use Lemma 4. It is closed under enlargement to faithful configurations, because an enlargement retains the contained inner seed. Choose $A$ of maximum rank $r$, put $H = L A$, and identify $H$ with its faithful image in $"Aut" \( L \)$.

For its chosen frame, the centralizer lemma shows that $A$ preserves every line and that its linear part is in $S = S \( cal(D) \)$. The group $A$ contains $S ∩ H$. Indeed $S$ centralizes $A$, so adjoining any element of $S ∩ H$ preserves $H$, its centralizer, and the contained inner seed; maximal rank forbids an enlargement. Hence either

#[#set math.equation(numbering: n => "(74)")
 $ A = S ∩ H \, $ <eq:orthogonal-A-no-field>]

or there is an involution $b in A$ with nontrivial field action and

#[#set math.equation(numbering: n => "(75)")
 $ E = S times chevron.l b chevron.r \, #h(2em) A = E ∩ H = \( S ∩ H \) times chevron.l b chevron.r . $ <eq:orthogonal-A-field>]

In the latter case $H ∩ "PO" \( V \)$ is the entire linear part of $H$: $H = L A$ and $A$ has linear kernel in $S lt.eq "PO" \( V \)$.

Our remaining task is to produce a cycle in $cal(A)_2 \( H \)$ with a nonzero full-flag coefficient at some $A'$ of rank $r$ containing an allowed seed and satisfying $L A' = H$. Since $L A' = H$, we have $O_2 \( C_G \( L A' \) \) = O_2 \( C_G \( H \) \) = 1$, and the contained inner seed gives $A' ∩ L eq.not 1$. Thus $A'$ belongs to the same maximizing family. Corollary 10 then applies to this actual supported subgroup.

For subsequent index calculations, let

$ P = "PO" \( V \) \/ L \, #h(2em) pi : "PO" \( V \) arrow.r P . $

Determinant and spinor norm identify this elementary abelian group with

#[#set math.equation(numbering: n => "(76)")
 $ P tilde.equiv bb(F)_2^2 \/ chevron.l \( N med mod med 2 \, k med mod med 2 \) chevron.r . $ <eq:orthogonal-outer-signs>]

Both invariants are attained because in dimension at least five the form represents both nonzero square classes. A reflection in a square line has image $\( 1 \, 0 \)$, and one in a nonsquare line has image $\( 1 \, 1 \)$. Thus every mixed frame has $pi \( S \) = P$. For homogeneous frames of a fixed color the image $pi \( S \)$ is a fixed subgroup of $P$, independent of the frame. These observations will give constant indices except in the small-field argument, where they give a maximum index.

=== 8.4 Nonsquare determinant and homogeneous frames <nonsquare-determinant-and-homogeneous-frames>

First suppose $N$ is even and the determinant is nonsquare. Every orthogonal frame has an odd number of nonsquare lines and is mixed. Use all these frames in the maximizing family. Their inner signs have rank $N - 2$ and distinguish positions. Lemma 31 excludes a field axis, so (74) holds and $H lt.eq "PO" \( V \)$. Put $B = H \/ L lt.eq P$. Every frame sign group surjects onto $P$, whence

$ \[ S \( cal(D) \) : S \( cal(D) \) ∩ H \] = \[ P : B \] \, #h(2em) L \( S \( cal(D) \) ∩ H \) = H . $

The all-color case of Theorem 11 supplies a nonzero cycle of full flags on sign groups of rank $N - 1$. These are actual coefficients: a full sign group recovers its frame as the common eigenspaces of its diagonal lifts. Lemma 19, at the constant index $\[ P : B \]$, gives the required cycle and coefficient at an intersection $A' = S \( cal(D) \) ∩ H$. The index exponent is at most two and is smaller than $N - 1$, as required. All such intersections have the original maximal rank and contain the allowed inner signs. Corollary 10 excludes this case. This argument includes nonsquare determinant in dimension six for every $q$ under consideration.

We may now assume that the determinant is square. Suppose first that $q gt.eq 7$. The classification of nondegenerate symmetric forms over a finite field by dimension and determinant supplies homogeneous square frames: the diagonal form with all entries one has the required determinant. Fix this color and maximize over configurations containing its inner sign groups. These have the second or third rank in (72).

If there is no field axis, use the one-color case of Theorem 11. To see the strict positivity at the smallest parameter, an orthogonal plane generated by two lines of the chosen color has

$ d_q = frac(q - chi_q \( - 1 \), 2) gt.eq 4 $

ordered frames of that color, where $chi_q$ is the quadratic character of $bb(F)_q^(*)$. The one-color estimate has two roots $rho_(+) \, rho_(-)$ of $X^2 - X + d_q^(- 1)$, and its degree-$N$ fraction is $rho_(+)^N + rho_(-)^N > 0$. This also holds when $d_q = 4$, with the repeated root $1 \/ 2$. Thus a nonzero sign cycle exists. If $U = pi \( S \( cal(D) \) \)$, then $U$ is constant over these frames and $B = H \/ L lt.eq U$ by the initial configuration. Each intersection has index $\[ U : B \]$ and surjects onto $B$. The same coefficient detection and constant-index restriction give a supported member of the original maximal rank, so Corollary 10 applies.

It remains in this case to treat a maximizing $A$ with field axis. Fix its group $H$ and consider data $\( cal(D) \, b \)$, where $cal(D)$ is a homogeneous square frame and $b in H$ is an involution with the same nontrivial coset in $H \/ \( H ∩ "PO" \( V \) \)$, preserving its individual lines. The initial configuration supplies at least one such datum. For a fixed $b$ which occurs, Lemma 31 identifies all its compatible frames with the orthogonal frames of a symmetric space over $bb(F)_s$, where $q = s^2$ and $s gt.eq 5$. Every such frame has the original square color over $bb(F)_q$; hence our restriction to that color discards none of the descended frames. We may apply the uniform all-color fraction $\( 17 \/ 25 \)^N$ over $bb(F)_s$, including both determinant types of the descended space.

For a fixed frame, forgetting the axis has at least

#[#set math.equation(numbering: n => "(77)")
 $ \| T \( cal(D) \) \| gt.eq 2^(N - 2) $ <eq:orthogonal-field-completions>]

completions. Indeed all $b t$ with $t in T \( cal(D) \)$ are distinct involutions in $H$ with the stipulated coset, centralize the signs, and preserve the same frame. Compatibility and its color are therefore retained. The needed strict comparison is

#[#set math.equation(numbering: n => "(78)")
 $ (17 / 25)^N > 2^(- \( N - 2 \)) #h(2em) \( N gt.eq 5 \) . $ <eq:orthogonal-field-inequality>]

At $N = 5$ the product of the left side with $2^(N - 2)$ is greater than one, and each increase in $N$ multiplies that product by $34 \/ 25 > 1$.

We verify detection before invoking the decoration count. The group $E = S \( cal(D) \) times chevron.l b chevron.r$ recovers $S \( cal(D) \)$ as its kernel under the field map, and hence recovers $cal(D)$. In the split shuffle construction, flags beginning with $chevron.l b chevron.r$ and continuing with $chevron.l b chevron.r U_i$, for a sign flag $\( U_i \)$, recover the original sign coefficients. A different axis cannot contribute to such a flag with the same cone group: a split rank-one subgroup outside the linear kernel is its own chosen axis. Thus all initial frame parameters are detected in actual chains. Lemma 16, using (77) and (78), gives a nonzero homogeneous cycle with full flags ending at groups $E$ of rank $N$.

Finally put $B = \( H ∩ "PO" \( V \) \) \/ L$ and let $U$ be the fixed image of a homogeneous square sign group in $P$. The initial configuration shows $B lt.eq U$ and that its signs supply all of $B$. For every new datum,

$ E ∩ H = \( S \( cal(D) \) ∩ H \) times chevron.l b chevron.r \, quad \[ E : E ∩ H \] = \[ U : B \] \, quad L \( E ∩ H \) = H . $

Restriction therefore has constant index, loses at most two ranks, and returns an actual nonzero coefficient at a member of the maximizing family of rank $r$. Corollary 10 again contradicts the choice of $G$.

=== 8.5 Forcing the required colors over the field of five elements <forcing-the-required-colors-over-the-field-of-five-elements>

We have reduced the proof of Proposition 28 to $q = 5$ and square determinant. There is no field direction. For odd $N gt.eq 5$ call a frame admissible if its nonsquare count satisfies

#[#set math.equation(numbering: n => "(79)")
 $ k upright(" even") \, #h(2em) 4 lt.eq k lt.eq N - 1 . $ <eq:orthogonal-odd-colors>]

For even $N gt.eq 8$ use

#[#set math.equation(numbering: n => "(80)")
 $ k upright(" even") \, #h(2em) 4 lt.eq k lt.eq N - 4 . $ <eq:orthogonal-even-colors>]

All these norm patterns occur by the classification by determinant. Their inner signs distinguish positions and have rank $N - 2$ in odd dimension and $N - 3$ in even dimension. Consequently they meet Lemma 29. Maximize configurations over these admissible frames. For the resulting $H$, its initial group is $A = S ∩ H$, and every admissible sign group surjects onto $P$.

The all-color frame theorem gives many cycles, but some of their coefficients could be on inadmissible frames. The following argument shows that the produced coefficient space cannot be supported entirely on those frames. This is the remaining reason for the color ranges (79)–(80).

#thm([Lemma 8.5.])[
  #emph[Let $V$ be a square-determinant symmetric space over $bb(F)_5$, of odd dimension $N gt.eq 5$ or even dimension $N gt.eq 8$. The space of actual sign cycle coefficients produced by Theorem 11 contains an assignment with a nonzero full-flag coefficient at an admissible frame as defined above.]
] <lem:orthogonal-five-colors>

#proof[
  Let $cal(F)$ be the set of all orthogonal line frames and put $M = \| cal(F) \|$. The produced coefficient space $cal(C)$ has dimension at least
  #[#set math.equation(numbering: n => "(81)")
   $ (17 / 25)^N M \( N - 1 \) ! . $ <eq:orthogonal-all-lower>]
  We use the description from Section 4: local coefficients are evaluations on binary merger brackets, with every line letter odd. A tree with a pair of leaf children satisfies the plane relation obtained by replacing that pair by every orthogonal frame of its span. The brackets are precisely the evaluations detected by the corresponding full partition flags.
  Over $bb(F)_5$ a square-determinant plane has one unordered frame of two square lines and one of two nonsquare lines. A nonsquare-determinant plane has three unordered frames, each with one line of each color. For completeness, use diagonal models $chevron.l 1 \, 1 chevron.r$ and $chevron.l 1 \, 2 chevron.r$. The projective lines of finite slope $t$ have norms $1 + t^2$ and $1 + 2 t^2$, respectively, and the line of infinite slope has norm $1$ or $2$. The first plane has two isotropic lines, two square lines, and two nonsquare lines; the second has three lines of each nonzero norm type. Orthogonal complementation pairs the lines as asserted. Since two odd letters satisfy $\[ x \, y \] = \[ y \, x \]$, the length-two relation is the sum of one bracket for each unordered replacement, with no cancellation between its two orderings.
  Assume that all assignments in $cal(C)$ vanish at every admissible frame. In odd dimension the remaining nonsquare counts are $0$ and $2$; in even dimension they are $0 \, 2 \, N - 2 \, N$. Call a remaining mixed frame a two-minority frame: it has two lines of one color and $N - 2$ of the other. At such a frame, every coefficient of a bracket tree whose bottom pair consists of two majority lines is zero. Indeed the other replacement in that same-color plane changes the majority pair to the minority color and gives an admissible frame. Its coefficient is zero by assumption, and the two-term plane relation forces the original coefficient to vanish.
  We make the resulting dimension bound explicit. Label the two minority letters $a \, b$ and the majority letters by a set $J$ of size $N - 2$. The local functional factors through the multilinear part of the free Lie superalgebra modulo
  $ \[ u \, v \] = 0 #h(2em) \( u \, v in J \, med u eq.not v \) . $
  Indeed the multilinear ideal generated by these relations is spanned by bracket contexts containing a majority-majority bottom pair, whose evaluations have just been shown to vanish. For $u in J$ set $D_u = "ad" \( u \)$. The super Jacobi identity gives
  $ D_u D_v + D_v D_u = "ad" \[ u \, v \] = 0 . $
  Thus the order of distinct majority adjoints on a branch matters only by sign. Fix a total order on $J$ and, for $I subset.eq J$, let $D_I$ denote their product in that order. The local quotient is spanned by
  #[#set math.equation(numbering: n => "(82)")
   $ \[ D_I \( a \) \, D_(J \\ I) \( b \) \] #h(2em) \( I subset.eq J \) \, $ <eq:orthogonal-combs>]
  so has dimension at most $2^(N - 2)$.
  To verify spanning, a subtree containing only majority letters and at least two leaves is zero. A subtree with exactly one minority letter is therefore a comb rooted at that letter. At the vertex where the two minority branches first join, both branches are of this form. Each majority letter above that vertex is distributed between the branches by the super derivation identity. Repeating and reordering the adjoints gives (82). This also proves the bound when additional local relations are present.
  At a homogeneous frame choose any bottom pair in a merger tree. Its two-term plane relation expresses the coefficient in terms of the coefficient at a two-minority frame. Hence all assignments under our vanishing assumption are determined by at most $2^(N - 2)$ values per two-minority frame.
  We count those frames relative to $M$. Every ordered pattern of norm colors with an even number of nonsquare positions has the same number of ordered frames: the isometry group acts transitively and the stabilizer has order $2^N$, from independent signs on the lines. There are $2^(N - 1)$ such patterns. The fraction of unordered frames having exactly two lines of a specified minority color is therefore $binom(N, 2) \/ 2^(N - 1)$. There is one possible minority color in odd dimension and two in even dimension. Writing $e = 1$ and $e = 2$ in these cases, respectively, we obtain
  #[#set math.equation(numbering: n => "(83)")
   $ frac(dim cal(C), M \( N - 1 \) !) lt.eq e binom(N, 2) / 2^(N - 1) frac(2^(N - 2), \( N - 1 \) !) = frac(e N, 4 \( N - 2 \) !) . $ <eq:orthogonal-excluded-upper>]
  For odd $N gt.eq 7$ and even $N gt.eq 8$ this contradicts (81). At the two initial dimensions the upper bounds are $7 \/ 480 < \( 17 \/ 25 \)^7$ and $1 \/ 180 < \( 17 \/ 25 \)^8$. Increasing $N$ by two multiplies the upper bound by $\( N + 2 \) \/ \( N^2 \( N - 1 \) \)$, which is smaller than $\( 17 \/ 25 \)^2$ throughout these ranges.
  For $N = 5$ we use the mixed-pair plane relations as well. At each two-minority frame fix the numbering of its minority letters and the ordering of its majority letters. Introduce one formal coordinate for each of the eight comb values in (82). Treating these coordinates as independent only enlarges the possible coefficient space. In every comb distribution at least one branch contains a majority letter. Reorder its adjoints so that this letter is adjacent to the minority root. Up to sign the coordinate is therefore represented by a tree with a mixed bottom pair.
  Its plane relation has three terms at three distinct two-minority frames. Each replacement again has a unique majority line and a unique minority line in that plane, so the replaced tree is still one of the two-comb distributions. Reordering the majority adjoints and, if necessary, interchanging the two minority branches converts it to our chosen coordinate convention by a sign. The relation thus has three nonzero coefficients, each $1$ or $- 1$, on three distinct formal coordinates, including the selected coordinate. In particular, there is a relation with support at most three covering each coordinate.
  If the total number of formal coordinates is $D$, select a row basis from these relations. Its row supports still cover all $D$ columns: a column zero on every basis row would be zero on every row. Since each basis row has support at most three, the rank is at least $D \/ 3$. The space of possible coordinate values has dimension at most $2 D \/ 3$. Replacing (83) by this sharper bound gives
  $ frac(dim cal(C), M thin 4 !) lt.eq 2 / 3 5 / 24 = 5 / 36 < (17 / 25)^5 \, $
  the final contradiction. Thus some produced assignment has a nonzero actual coefficient at an admissible frame. ◻
]

We finish the restriction and propagation in this last case. The lemma supplies a cycle on the full sign groups, of rank $m = N - 1$, and a nonzero coefficient at an admissible frame $cal(D)$. With $B = H \/ L lt.eq P$, every such frame has

$ \[ S \( cal(D) \) : S \( cal(D) \) ∩ H \] = \[ P : B \] . $

An arbitrary frame $cal(D)'$ occurring elsewhere in the same cycle has $pi \( S \( cal(D)' \) \) lt.eq P$, and hence

$ \[ S \( cal(D)' \) : S \( cal(D)' \) ∩ H \] = \[ pi \( S \( cal(D)' \) \) : pi \( S \( cal(D)' \) \) ∩ B \] lt.eq \[ P : B \] . $

Our selected coefficient therefore has maximum intersection index among all supported groups, even though the cycle also uses other color counts. Its index exponent is at most two, so it is strictly less than $m$. Lemma 19 applies at this specific coefficient and gives a cycle in $cal(A)_2 \( H \)$ with a nonzero full flag ending at

$ A' = S \( cal(D) \) ∩ H . $

It contains the admissible inner seed, has the original maximal rank, and satisfies $L A' = H$ because its signs supply all of $B$. Restriction has preserved an actual coefficient: in that lemma the fixed complement makes intersection with $H$ injective on the residue’s flags. Corollary 10 now applies to this very supported subgroup $A'$ and gives the contradiction.

This proves Proposition 28. The excluded case has $N = 6$, $q = 5$, and square determinant, hence is plus type because $- 1$ is a square in $bb(F)_5$. Its simple group is $"PSL"_4 \( 5 \)$ and is treated in Section 9.

== 9 The component $"PSL"_4 \( 5 \)$ <sec:exceptional>

The square-discriminant six-dimensional space over $bb(F)_5$ has plus type, and

$ upright(P) Omega_6^(+) \( 5 \) tilde.equiv "PSL"_4 \( 5 \) . $

This is the case excluded from Proposition 28. In a mixed frame the norm colors occur in counts two and four. Its inner sign group has rank three and does not distinguish the two positions of the smaller color class. Thus it meets neither hypothesis of Lemma 29. We shall first use any available outer direction to repair this defect. If no suitable extension is available, an equivalent-poset construction will retain the homology of the component and its centralizer.

=== 9.1 The two natural representations <the-two-natural-representations>

Put $L = "PSL"_4 \( 5 \)$ and $V = bb(F)_5^4$. The determinant identifies $"PGL"_4 \( 5 \) \/ L$ with $bb(F)_5^times$, since fourth powers in $bb(F)_5^times$ are trivial. Let $d$ denote the outer class of $"diag" \( 2 \, 1 \, 1 \, 1 \)$, and let $gamma$ be inverse transpose. The automorphism theorem for $L$ #cite(label("Steinberg1960")) Section 2 and statements 3.2–3.6 gives

#[#set math.equation(numbering: n => "(84)")
 $ "Aut" \( L \) = "PGL"_4 \( 5 \) times.r chevron.l gamma chevron.r \, #h(2em) "Out" \( L \) = chevron.l d \, gamma divides d^4 = gamma^2 = 1 \, med gamma d gamma = d^(- 1) chevron.r . $ <eq:psl45-outer>]

There is no field automorphism because the field is prime. Thus the outer group is dihedral of order eight. We need to identify precisely the subgroup coming from six-dimensional isometries.

Choose a basis $e_1 \, dots.h \, e_4$ of $V$, write $e_(i j) = e_i and e_j$, choose a volume form, and put $W = and.big^2 V$. Define the nondegenerate symmetric form $beta$ by

$ u and v = beta \( u \, v \) thin upright("vol") #h(2em) \( u \, v in W \) . $

The pairs of basis vectors

$ \( e_12 \, e_34 \) \, quad \( e_13 \, e_24 \) \, quad \( e_14 \, e_23 \) $

are hyperbolic pairs, with respective pairings $1 \, - 1 \, 1$. Consequently $W$ has plus type and square discriminant over $bb(F)_5$. For $g in "GL" \( V \)$,

#[#set math.equation(numbering: n => "(85)")
 $ beta \( \( and.big^2 g \) u \, \( and.big^2 g \) v \) = det \( g \) beta \( u \, v \) . $ <eq:psl45-wedge-multiplier>]

The standard exterior-square covering $"SL"_4 \( 5 \) arrow.r Omega_6^(+) \( 5 \)$ has kernel ${ plus.minus I }$ #cite(label("Taylor1992")) Theorem 12.20 and Corollary 12.21; after projectivization it is the displayed isomorphism with $L$. In particular, the two groups called $L$ in these representations are identified.

Let $tau$ interchange complementary basis vectors with the exterior signs:

$ e_12 arrow.l.r e_34 \, #h(2em) e_13 arrow.l.r - e_24 \, #h(2em) e_14 arrow.l.r e_23 . $

It is an isometry, $tau^2 = 1$, and $det \( tau \) = - 1$. Directly from the wedge pairing,

$ tau \( and.big^2 g \) tau^(- 1) = det \( g \) and.big^2 \( g^(- T) \) . $

Thus $tau$ induces $gamma$ on the projective image of $"SL"_4 \( 5 \)$. The exterior-square image of $"PGL"_4 \( 5 \)$ and $tau$ together give the full projective similarity group of $W$ #cite(label("Taylor1992")) Theorem 12.18: the former has relative determinant $det \( and.big^2 g \) \/ det \( g \)^3 = 1$, whereas $tau$ has relative determinant $- 1$; their order is that of this similarity group. Equivalently, this is the natural $D_3 = A_3$ realization of (84). We write $"PO" \( W \)$ for the projective image of the isometry group, a subgroup of $"Aut" \( L \)$.

A similarity can be rescaled to an isometry exactly when its multiplier is square. Equation (85) and the fact that $tau$ is an isometry therefore show that

#[#set math.equation(numbering: n => "(86)")
 $ T := "PO" \( W \) \/ L = chevron.l d^2 \, gamma chevron.r tilde.equiv C_2^2 . $ <eq:psl45-natural-outer>]

Here $L$ is the joint determinant–spinor-norm kernel in $"PO" \( W \)$. In this dimension $- I$ has determinant and spinor norm one, so both characters descend to the projective group. In particular, there is no ambiguity from changing an isometry representative by $- I$.

There are only two possibilities for an elementary abelian subgroup $B lt.eq "Out" \( L \)$ satisfying $B ∩ T = 1$. Since $T$ has index two, either $B = 1$, or $B$ has order two and is generated by $d gamma$ or $d^3 gamma$. These are precisely the graph cosets whose diagonal determinant class is nonsquare.

The remaining preparatory inputs concern centralizers and homology. They will distinguish the three branches of the final argument.

=== 9.2 An inheritance fact for centralizers <an-inheritance-fact-for-centralizers>

The passage from an extension to one of its outer directions requires the following elementary observation.

#thm([Lemma 9.1.])[
  #emph[Let $J lt.closed.eq H lt.eq G$ be finite groups, and suppose that $H \/ J$ is a $p$-group. If $O_p \( C_G \( H \) \) = 1$, then $O_p \( C_G \( J \) \) = 1$.]
] <lem:psl45-intermediate-core>

#proof[
  Put $Q = O_p \( C_G \( J \) \)$. The group $H$ normalizes $C_G \( J \)$ and its characteristic subgroup $Q$. Since $J$ centralizes $Q$, the action of $H$ on $Q$ factors through the $p$-group $H \/ J$. If $Q eq.not 1$, orbit counting on the underlying set of $Q$ gives
  $ \| C_Q \( H \) \| equiv \| Q \| equiv 0 med \( mod med p \) . $
  The identity is fixed, so $C_Q \( H \) eq.not 1$. Moreover $C_G \( H \)$ is a subgroup of $C_G \( J \)$, normalizes $Q$, and centralizes the action of $H$. Hence $C_Q \( H \) = Q ∩ C_G \( H \)$ is a nontrivial normal $p$-subgroup of $C_G \( H \)$, a contradiction. ◻
]

=== 9.3 Homology of the component <homology-of-the-component>

The final branch will use nonzero homology of $L$ itself. We prove that fact directly, without applying the assertion under induction.

#thm([Lemma 9.2.])[
  #emph[For $L = "PSL"_4 \( 5 \)$, 
$ tilde(chi) \( cal(A)_2 \( L \) \) equiv - 1 med \( mod med 5 \) . $

 In particular $tilde(H)_(*) \( cal(A)_2 \( L \) \; bb(Q) \) eq.not 0$.]
] <lem:psl45-homology>

#proof[
  We first show that every elementary abelian $2$-subgroup $E lt.eq L$ has rank at most four. Apply Lemma 20 to $E lt.eq L lt.eq "PGL"_4 \( 5 \)$, with $p = 2$ and $n = 4$. If $2 a$ is the rank of its scalar-commutator pairing, then $2^a divides 4$ and
  #[#set math.equation(numbering: n => "(87)")
   $ "rk" E lt.eq 2 a + 4 / 2^a - 1 . $ <eq:psl45-rank>]
  The possibilities $a = 0 \, 1 \, 2$ give the bounds $3 \, 3 \, 4$, respectively.
  Next let $x in L$ be an involution and choose a lift $X in "SL"_4 \( 5 \)$, with $X^2 = lambda I$. If $lambda$ were nonsquare, $T^2 - lambda$ would be irreducible over $bb(F)_5$. Its two roots would each have multiplicity two in $X$, giving
  $ det X = lambda^2 = - 1 \, $
  a contradiction. Thus $lambda = a^2$ for some $a in bb(F)_5^times$. Replacing $X$ by $a^(- 1) X$ keeps determinant one, since $a^4 = 1$, and makes $X^2 = I$. The lift is noncentral, and determinant one forces its $1$- and $- 1$-eigenspaces to have dimensions two and two. A projective centralizer of $x$ preserves or exchanges these two spaces: if $Y X Y^(- 1) = c X$, then the eigenvalues force $c = plus.minus 1$. The $5$-part of this block stabilizer has order at most
  $ \| "GL"_2 \( 5 \) \|_5^2 = 5^2 . $
  Passing to a subgroup and then to its projective quotient cannot increase this bound. Hence $\| C_L \( x \) \|_5 lt.eq 5^2$.
  A Sylow $5$-subgroup $P$ of $L$ has order $5^6$. If $P$ normalized a nontrivial elementary abelian $2$-subgroup $E$, its conjugation image would lie in $"GL"_("rk" E) \( 2 \)$. By (87), the $5$-part of that group has order at most five. It would follow that $\| C_P \( E \) \| gt.eq 5^5$, contradicting the bound for $C_L \( x \)$ for any $1 eq.not x in E$.
  Thus $P$ fixes no vertex of $cal(A)_2 \( L \)$. A simplex fixed setwise by $P$ would have each vertex fixed, because an automorphism of a finite chain fixes its ordered vertices. There are therefore no fixed nonempty simplices. Every orbit of nonempty simplices has cardinality divisible by five, so ordinary Euler characteristic is zero modulo five. Reduced Euler characteristic is one less, giving the stated congruence. Euler characteristic is the alternating sum of rational homology dimensions, so the nonvanishing conclusion follows. ◻
]

=== 9.4 The equivalent poset used in the final branch <the-equivalent-poset-used-in-the-final-branch>

We record the precise specialization of the equivalent-poset theorem that will be needed. A product below includes the trivial subgroup in either coordinate, but excludes $\( 1 \, 1 \)$.

#thm([Theorem 9.3.])[
  (Equivalent poset for a centerless component).  #emph[Let $G$ be a finite group, let $p$ be a prime, and let $L$ be a centerless component of $G$ with $p divides \| L \|$. Put $K = C_G \( L \)$ and 
$ cal(Q) = #scale(x: 120%, y: 120%)[\(] \( cal(A)_p \( L \) union { 1 } \) times \( cal(A)_p \( K \) union { 1 } \) #scale(x: 120%, y: 120%)[\)] \\ { \( 1 \, 1 \) } \, #h(2em) cal(F) = { F in cal(A)_p \( G \) : F ∩ L K = 1 } . $

 Give $cal(Q)$ the coordinatewise order and $cal(F)$ the inclusion order. Define 
$ cal(F)_0 = { F in cal(F) : F lt.eq N_G \( L \) \, med O_p \( C_G \( L F \) \) eq.not 1 } . $

 The disjoint union $cal(X) = cal(Q) union.sq cal(F)$ is ordered by these orders and by the following crossed comparisons: 
#[#set math.equation(numbering: n => "(88)")
 $ F < \( U \, V \) quad arrow.l.r.double quad {C_(U V) \( F \) eq.not 1 \,\
C_(U V) \( F \) lt.eq.not L & upright("if ") F in cal(F)_0 . $ <eq:psl45-cross>]

 There are no comparisons directed from $cal(Q)$ to $cal(F)$. These rules define a poset, and $cal(X) tilde.eq cal(A)_p \( G \)$.]
] <thm:psl45-equivalent-poset>

This centerless case is supplied by #cite(label("PitermanSmith2025"), form: "prose") Propositions 4.11–4.12. It is also the specialization of #cite(label("Piterman2026"), form: "prose") Definition 3.2 and Theorem 3.3, together with the equivalence preceding that definition, to $B = 1$ and $cal(P)_L = cal(A)_p \( L \)$. Its component hypothesis is $p divides \| L \|$ and $p divides.not \| Z \( L \) \|$; the centerless hypothesis here supplies the latter. The required condition $B ∩ L C_G \( L \) = 1$ is automatic for $B = 1$. No normality of $L$ in $G$, and no defining-characteristic assumption, is required. Since $Z \( L \) = 1$, the product $L K$ in the statement is the direct product $L times K$, so the products $U V$ used in (88) are unambiguous.

=== 9.5 Exclusion of a minimal counterexample <exclusion-of-a-minimal-counterexample>

The preparatory results are now in place. The first two branches return to frame cycles; the third uses the equivalent poset. We use #emph[configuration] in the sense of Definition 5: $A lt.eq N_G \( L \)$ is elementary abelian, $A ∩ L eq.not 1$, the group $H = L A$ acts faithfully on $L$, and $O_2 \( C_G \( H \) \) = 1$.

The first branch starts from a six-dimensional sign configuration whose rank and distinct weights permit propagation. If none exists, Lemma 33 will exclude every faithful extension with trivial centralizer core whose outer image meets $T$ nontrivially. The only possible remaining nontrivial outer image is then an odd-diagonal graph line, which gives the second branch. If that branch is absent as well, the equivalent-poset theorem and the component homology proved above give the final argument. These transitions are proved inside the proposition; in particular, the graph-line restriction is imposed only after the first branch has been excluded.

#thm([Proposition 9.4.])[
  #emph[A minimal-order counterexample to the rational homological implication at $p = 2$ has no simple component isomorphic to $"PSL"_4 \( 5 \)$.]
] <prop:psl45>

#proof[
  Suppose that $G$ is such a counterexample with component $L$. Faithful extensions of $L$ in $N_G \( L \)$ will be identified with their images in $"Aut" \( L \)$. This identifies the original copy of $L$ with the inner automorphism subgroup and allows us to use either of its two natural representations.
  ===== 9.5.1 First branch: a six-dimensional sign configuration. <first-branch-a-six-dimensional-sign-configuration.>
  Let $cal(D)$ be an orthogonal frame of $W$ with two or four nonsquare-norm lines; call such a frame mixed. Its projective sign group
  $ S \( cal(D) \) tilde.equiv bb(F)_2^6 \/ chevron.l \( 1 \, 1 \, 1 \, 1 \, 1 \, 1 \) chevron.r $
  has rank five. Write $t$ for total sign parity and $c$ for parity on the nonsquare-norm positions. Both descend to the projective sign group, because both color classes have even size. The determinant and spinor-norm conditions give
  #[#set math.equation(numbering: n => "(89)")
   $ S_L \( cal(D) \) := S \( cal(D) \) ∩ L = ker t ∩ ker c \, #h(2em) "rk" S_L \( cal(D) \) = 3 . $ <eq:psl45-inner-signs>]
  The two characters are independent. Consequently the image of $S \( cal(D) \)$ in $T$ is all of $T$.
  Consider configurations $A$ such that, in the six-dimensional representation,
  $ S_L \( cal(D) \) lt.eq A lt.eq S \( cal(D) \) \, #h(2em) "rk" A gt.eq 4 \, $
  for some mixed frame $cal(D)$, and no two coordinate weights are equal on $A$. Suppose first that this family is nonempty, and choose $A$ of maximal rank in it. Put $H = L A$.
  We check the centralizer assertion that makes this a permissible maximizing family. Choose a linear section of the binary sign preimage of $A$, and let $w_1 \, dots.h \, w_6$ be its six coordinate characters. Their differences span $A^(*)$, because the projective sign action is faithful, and they are distinct by assumption. Any projective similarity centralizing $A$ permutes these characters by one common translation $chi$: its scalar commutators with sign lifts are $plus.minus 1$ and form the character $chi$. If $chi eq.not 0$, the six characters form three pairs ${ w \, w + chi }$. The affine span then has dimension at most three, as it is spanned by two differences of pair representatives and $chi$. This contradicts $"rk" A gt.eq 4$.
  It follows that every such centralizer preserves the six lines. If its diagonal entries are $a_i$ and its multiplier is $mu$, then $a_i^2 = mu$ for every $i$. Rescaling by $a_1^(- 1)$ makes all entries $plus.minus 1$. By the full similarity realization of $"Aut" \( L \)$ above, we have proved
  #[#set math.equation(numbering: n => "(90)")
   $ C_("Aut" \( L \)) \( A \) = S \( cal(D) \) . $ <eq:psl45-six-centralizer>]
  In particular maximality gives $A = S \( cal(D) \) ∩ H$. Any elementary overgroup of $A$ centralizes $A$ and normalizes $L$: a nonidentity element of $A ∩ L$ cannot also lie in a distinct conjugate component. If the larger group gives a configuration, its faithful image is therefore contained in the same $S \( cal(D) \)$ by (90); it still contains $S_L \( cal(D) \)$, separates positions, and has rank at least four. It belongs to our family. Adjoining an involution of $C_L \( A \)$ also preserves $H$ and its centralizer and gives a member of the same family. Maximality thus supplies both centralizer and strict-overgroup conditions of Lemma 9.
  It remains to obtain a supported coefficient at another member of this same maximal family. Let $r = "rk" \( H \/ L \)$; then $r = 1$ or $2$, and $"rk" A = 3 + r$. For any mixed frame $cal(D)'$,
  $ \| S \( cal(D)' \) : S \( cal(D)' \) ∩ H \| = 2^(2 - r) \, #h(2em) L \( S \( cal(D)' \) ∩ H \) = H . $
  Indeed its full signs map onto $T$. For an arbitrary frame, the image of its signs is a subgroup of $T$, so this index is at most $2^(2 - r)$. Mixed frames consequently attain the maximum index.
  If $r = 2$, all five sign directions survive and distinguish the positions. If $r = 1$, the intersection imposes one of $t = 0$, $c = 0$, or $t + c = 0$. The first condition distinguishes all six positions. Either of the others is parity on one color class, and distinguishes positions precisely when that class has four positions, rather than two. To see this directly, equality of positions $i \, j$ on the intersection would mean that the two-coordinate functional $x_i + x_j$ is its single defining functional.
  Theorem 11 supplies a nonzero undecorated sign cycle using all frames of $W$. Some mixed frame has a nonzero coefficient. In fact, if all mixed-frame coefficients vanished, take a binary merger tree at a homogeneous frame and choose a bottom pair. Over $bb(F)_5$, the plane on two lines of the same norm type has exactly two unordered orthogonal frames, one of each homogeneous color. The plane relation expresses the given coefficient, up to its nonzero orientation sign, as the coefficient after replacing that pair by its opposite-color frame. The latter frame is mixed. All homogeneous-frame coefficients would therefore vanish as well, contradicting the nonzero cycle.
  If necessary, we can change the color counts of the selected mixed frame before restricting the cycle. There is a similarity of $W$ with nonsquare multiplier: in hyperbolic coordinates, multiply one member of each hyperbolic pair by $2$ and fix the other member. It normalizes $"PO" \( W \)$ and $L$, and exchanges the two norm types on every line. On determinant–spinor coordinates it acts by $\( t \, c \) mapsto \( t \, c + t \)$, since the spinor norm of a reflected line is multiplied by the similarity multiplier. Apply this automorphism to the entire sign cycle while keeping $H$ fixed. We do not need it to normalize $H$: every transformed top group still has image contained in $T = "PO" \( W \) \/ L$, and a mixed frame still has image all of $T$. Its intersection index is consequently at most $\[ T : H \/ L \]$, with equality at the selected mixed frame. The resulting cycle has a nonzero coefficient at a mixed frame for which the parity condition just described, if it is a color condition, uses four positions.
  The maximum-index form of Lemma 19 now applies to this actual coefficient, with cone rank five and $c = 2 - r lt.eq 1$. It produces a cycle in $cal(A)_2 \( H \)$ with a nonzero full-flag coefficient at $A' = S \( cal(D)' \) ∩ H$. This subgroup has rank $3 + r = "rk" A$, separates positions, and generates the same $H$ over $L$. It is therefore in the maximizing family, with the same centralizer $C_G \( H \)$, and satisfies both propagation conditions. Lemma 9 gives the desired contradiction in this branch.
  ===== 9.5.2 Passage to the remaining outer directions. <passage-to-the-remaining-outer-directions.>
  We may now assume that the family in the first branch is empty. This has a stronger consequence than merely excluding the particular sign groups. Suppose $H_1 > L$ is a faithful elementary $2$-extension in $N_G \( L \)$, has $O_2 \( C_G \( H_1 \) \) = 1$, and its outer image is a nontrivial subgroup of $T$. Choose a mixed frame whose larger color class is the one required by the possible single parity condition. Its sign intersection with $H_1$ has rank at least four, separates positions, maps onto $H_1 \/ L$, and contains $S_L \( cal(D) \)$. It would be a configuration in the excluded family.
  More generally, let $H_1$ be any faithful elementary $2$-extension with $O_2 \( C_G \( H_1 \) \) = 1$. If its outer image $B$ met $T$ nontrivially, take the intermediate subgroup $J$ above an order-two subgroup of $B ∩ T$. The elementary complement defining $H_1$ supplies an order-two complement for $J$. Moreover $J lt.closed.eq H_1$ and $H_1 \/ J$ is a $2$-group, so Lemma 33 gives $O_2 \( C_G \( J \) \) = 1$. This contradicts the preceding paragraph. Thus every such extension has
  #[#set math.equation(numbering: n => "(91)")
   $ \( H_1 \/ L \) ∩ T = 1 . $ <eq:psl45-avoid>]
  By (84)–(86), a nontrivial outer image is now a single odd-diagonal graph line.
  ===== 9.5.3 Second branch: an odd-diagonal graph extension. <second-branch-an-odd-diagonal-graph-extension.>
  Suppose that such an extension $H = L chevron.l b chevron.r$ exists, where $b$ is an involution, its outer class is $d gamma$ or $d^3 gamma$, and $O_2 \( C_G \( H \) \) = 1$.
  We describe its compatible frames explicitly in $V$. Write $b = "Int" \( B \) gamma$ with $B in "GL"_4 \( 5 \)$. The condition $b^2 = 1$ says $B B^(- T)$ is scalar, whence $B^T = epsilon B$ with $epsilon = plus.minus 1$. If $epsilon = - 1$, the determinant of $B$ is the square of its Pfaffian. This is impossible in an odd-diagonal graph coset. Thus $M = B^(- 1)$ is a nonsingular symmetric Gram matrix with nonsquare determinant. The linear centralizer of $b$ consists projectively of the similitudes of $M$: the commuting equation is $g B g^T = lambda B$, equivalently $g^T M g = lambda M$. An orthogonal nondegenerate line frame for $M$ has one or three nonsquare-norm lines, since the product of its four line norms is nonsquare.
  For such a frame $cal(D)$, let $S = S \( cal(D) \)$ be the full projective coordinate signs in $"PGL"_4 \( 5 \)$, and put
  $ S_L = S ∩ L \, #h(2em) E = S times chevron.l b chevron.r \, #h(2em) A = E ∩ H = S_L times chevron.l b chevron.r . $
  Here $"rk" S = 3$, and $S_L$ consists of the even signs and has rank two. The image of $S$ in $"Out" \( L \)$ is $chevron.l d^2 chevron.r$, whereas $H \/ L$ is an odd-diagonal graph line. Therefore $"rk" E = 4$, $"rk" A = 3$, $\| E : A \| = 2$, and $L A = H$. These statements hold for every compatible pair $\( cal(D) \, b \)$ with $b$ in this fixed extension.
  There is a special centralizer check in this dimension. In frame coordinates, lifts
  $ "diag" \( - 1 \, - 1 \, 1 \, 1 \) \, #h(2em) "diag" \( - 1 \, 1 \, - 1 \, 1 \) $
  generate $S_L$ projectively. Their four joint weights are exactly the four points of $bb(F)_2^2$. A projective linear centralizer of $S_L$ acts on these weights by a translation. Centralizing $b$ also makes it a similitude of $M$. A nonsquare multiplier would exchange the two line colors, impossible because their cardinalities are one and three. A square multiplier preserves the unique minority-color line. A nonzero translation of $bb(F)_2^2$ fixes no point, so the translation must be zero. The centralizer thus preserves every coordinate line. Its diagonal entries have a common square by the similitude equation, so projectively they are signs. We have proved
  #[#set math.equation(numbering: n => "(92)")
   $ C_("PGL"_4 \( 5 \)) \( A \) = S \, #h(2em) C_L \( A \) = S_L lt.eq A . $ <eq:psl45-four-centralizer>]
  In particular the order-two centralizer condition for propagation holds for every pair under consideration.
  We next construct the cycle, allowing all involutions $b in H$ in its fixed nontrivial outer coset and all their compatible orthogonal frames. For each fixed $b$, these are exactly the frames of the symmetric four-space just described. The fraction in Theorem 11, at $u = 5$ and $h = 4$, is
  $ x^4 + \( 1 - x \)^4 - 2 / 24^2 = 1 / 4 \, #h(2em) x \( 1 - x \) = 5 / 24 . $
  This is uniform in the symmetric form and its compatible frames.
  For a fixed frame and one compatible $b$, there are at least sixteen choices of its graph axis within $H$. Indeed let $t = "diag" \( t_1 \, t_2 \, t_3 \, t_4 \)$ in these coordinates, with $t_i in bb(F)_5^times$ and $product_i t_i = 1$. Modulo scalar matrices these give
  $ 4^3 / 4 = 16 $
  distinct elements of $L$. Since $b$ inverts the diagonal torus, every $t b$ is an involution; it remains in $H$ and preserves compatibility with the frame. Its symmetric form is again diagonal and has nonsquare determinant. The sixteen resulting order-two subgroups $chevron.l t b chevron.r$ are distinct.
  The initial coefficients are detected before imposing the axis-removal equations. The full group $E$ recovers its linear kernel $E ∩ "PGL"_4 \( 5 \) = S$, hence its coordinate frame. In the split chains of Lemma 16, take flags through the decoration line $chevron.l b chevron.r$ and then grow along the sign part. The initial line determines the graph axis, and the remaining flag recovers the original sign coefficient. Different compatible data therefore retain independent coefficient parameters. Since
  $ 1 / 4 > 1 / 16 \, $
  Lemma 16 gives a nonzero cycle with cone groups $E$ of rank four. The intersection index with $H$ is constantly two. Lemma 19, with $c = 1 < 4$, produces a cycle in $cal(A)_2 \( H \)$ having a nonzero full-flag coefficient at one of the groups $A = E ∩ H$ of rank three.
  For completeness, no strict elementary overgroup $D > A$ can give a configuration. Such a $D$ normalizes $L$, as before. If $L D$ is faithful and $O_2 \( C_G \( L D \) \) = 1$, its outer image satisfies (91). It contains the outer image of $A$, so the dihedral-group calculation forces it to equal that same order-two subgroup. Every element of $D$ may therefore be multiplied by either $1$ or $b$ to lie in $L$. The resulting element still centralizes $A$, and hence lies in $S_L$ by (92). Thus $D = A$, a contradiction. The supported subgroup satisfies both propagation conditions, so Lemma 9 excludes this branch.
  ===== 9.5.4 Third branch: nontrivial centralizer cores. <third-branch-nontrivial-centralizer-cores.>
  We are left with the assertion that every faithful elementary $2$-extension $H_1 > L$ in $N_G \( L \)$ satisfies $O_2 \( C_G \( H_1 \) \) eq.not 1$. Put $K = C_G \( L \)$. By Lemma 4, $O_2 \( K \) = 1$. Also $K < G$, since $L$ is nonabelian. Minimality gives
  #[#set math.equation(numbering: n => "(93)")
   $ tilde(H)_(*) \( cal(A)_2 \( K \) \; bb(Q) \) eq.not 0 \, $ <eq:psl45-K-homology>]
  with the augmented convention if this poset is empty.
  Apply Theorem 35 to this centerless component of even order. In its notation, no point of $cal(F)$ is comparable with a pure $L$-point $\( U \, 1 \)$. To prove this, suppose that the first condition in (88) holds for such a pair and choose $1 eq.not x in C_U \( F \)$. Every element of $F$ fixes $x in L$ and therefore normalizes $L$: distinct conjugate simple components have trivial intersection. Since $F ∩ L K = 1$, the group $L F$ acts faithfully on $L$. Indeed an element $l f$ of its kernel would give $f in L K$, forcing $f = 1$ and then $l = 1$. Moreover $F$ is a nontrivial elementary complement to $L$. The branch assumption implies $F in cal(F)_0$. But then $C_U \( F \) lt.eq L$ violates the second condition of (88). This proves the no-comparison assertion.
  Let $Y = Delta \( cal(Q) \)$, and let $Z$ be the full subcomplex of $Delta \( cal(X) \)$ obtained by omitting all pure $L$-points. A simplex containing such a point contains no vertex of $cal(F)$, by the preceding paragraph. Consequently
  $ Delta \( cal(X) \) = Y union Z \, #h(2em) Y ∩ Z = Delta \( cal(Q)' \) \, #h(2em) cal(Q)' = { \( U \, V \) in cal(Q) : V eq.not 1 } . $
  If $cal(A)_2 \( K \)$ is nonempty, the inclusion $cal(Q)' arrow.r.hook cal(Q)$ is nullhomotopic. For any fixed $U_0 in cal(A)_2 \( L \)$, the following pointwise comparisons give the required homotopy to a constant:
  $ \( U \, V \) med gt.eq med \( 1 \, V \) med lt.eq med \( U_0 \, V \) med gt.eq med \( U_0 \, 1 \) . $
  The reduced Mayer–Vietoris sequence now gives an injection
  #[#set math.equation(numbering: n => "(94)")
   $ tilde(H)_n \( Y \; bb(Q) \) arrow.r tilde(H)_n \( Delta \( cal(X) \) \; bb(Q) \) . $ <eq:psl45-MV>]
  Indeed the first coordinate of $tilde(H)_n \( Y ∩ Z \) arrow.r tilde(H)_n \( Y \) xor tilde(H)_n \( Z \)$ is zero, so its image contains no nonzero element of the form $\( y \, 0 \)$.
  The deleted-bottom product poset $cal(Q)$ has the homotopy type of the join $cal(A)_2 \( L \) * cal(A)_2 \( K \)$, by the deleted-bottom product/join description in Lemma 8. Over $bb(Q)$ its augmented join formula is
  $ tilde(H)_n \( Y \; bb(Q) \) tilde.equiv xor.big_(i + j = n - 1) tilde(H)_i \( cal(A)_2 \( L \) \; bb(Q) \) ⊗_(bb(Q)) tilde(H)_j \( cal(A)_2 \( K \) \; bb(Q) \) . $
  Lemma 34 and (93) make this nonzero in some degree. If $cal(A)_2 \( K \)$ is empty, then $cal(Q) = cal(A)_2 \( L \)$ and $cal(Q)' = diameter$. There are no comparisons at all between $cal(Q)$ and $cal(F)$, so its nonzero reduced homology injects directly into that of $cal(X)$; the same join formula uses the degree $- 1$ class of the empty factor. Thus this case also gives the conclusion of (94).
  Finally $cal(X) tilde.eq cal(A)_2 \( G \)$, so the nonzero class contradicts the assumed rational acyclicity of $cal(A)_2 \( G \)$. All three branches have been excluded. ◻
]

== 10 Proof of the main theorem <sec:conclusion>

We assemble the component arguments, retaining the distinction between top-degree homology at odd primes and propagation at two.

#proof[
  For odd $p$, Proposition 23 proves the dimension property for every unitary extension required by Theorem 3. That reduction proves the theorem.
  Suppose now that $p = 2$ and that a counterexample exists. Choose one of minimal order. By Theorem 2 it has a simple component in the displayed classical list. Proposition 22 excludes the linear and unitary groups of natural dimension at least five, and Proposition 24 excludes the symplectic groups on the list. The standard isomorphisms
  $ "PSL"_4 \( q \) tilde.equiv upright(P) Omega_6^(+) \( q \) \, #h(2em) "PSU"_4 \( q \) tilde.equiv upright(P) Omega_6^(-) \( q \) $
  place the remaining linear and unitary groups among the orthogonal cases. Proposition 28 excludes all these orthogonal groups except the square-discriminant six-dimensional case over $bb(F)_5$. That case is $"PSL"_4 \( 5 \)$ and is excluded by Proposition 36. The list is exhausted, a contradiction. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
