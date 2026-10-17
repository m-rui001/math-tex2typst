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

#align(center)[#text(size: 16pt, weight: "bold")[The Margulis--Platonov conjecture \
over number fields]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $k$ be a number field and let $G$ be an absolutely almost simple simply connected algebraic $k$-group. For a place $v$ of $k$, write $k_v$ for the completion. The local group $G \( k_v \)$ has its usual topology. Let

$ A = A \( G \, k \) = { v upright(" nonarchimedean") : "rank"_(k_v) G = 0 } \, #h(2em) H_A = product_(v in A) G \( k_v \) \, $

and let $delta_A : G \( k \) arrow.r H_A$ be the diagonal homomorphism. The set $A$ is finite. The product $H_A$ is given its product topology; if $A$ is empty, it is the trivial group.

The Margulis–Platonov conjecture asserts that the noncentral normal subgroups of $G \( k \)$ are accounted for by this finite collection of compact local groups. Normal subgroups in this assertion are abstract: no topology or finite-generation condition is imposed on them. We prove the conjecture in this form.

#thm([Theorem 1.1.])[
  #emph[Let $k$ be a number field and $G$ an absolutely almost simple simply connected algebraic $k$-group. If $N lt.closed G \( k \)$ is not contained in $Z \( G \( k \) \)$, then there is an open normal subgroup $W lt.closed H_A$ such that 
$ N = delta_A^(- 1) \( W \) . $

]
] <thm:main>

Thus the result resolves the Margulis–Platonov conjecture positively over number fields, including globally anisotropic groups. In the case $A = diameter$, the conclusion is $N = G \( k \)$, not merely that $N$ has finite index or is dense in a local topology.

=== 1.1 Background and significance <background-and-significance>

The problem joins two kinds of rigidity. At isotropic completions, generation by unipotent subgroups and simplicity modulo the center leave little room for normal quotients. At anisotropic nonarchimedean completions, compactness allows finite quotients and their open kernels. The assertion is that there is no additional abstract normal-subgroup obstruction invisible to these local factors.

The conjecture grew from Kneser’s quaternionic simplicity question and Platonov’s local-to-global simplicity proposal. Margulis formulated the description by open subgroups of the anisotropic finite local product [20] Russian original, Section 2.4.8. Strong approximation and Margulis’s normal subgroup theorem supply the arithmetic framework and finite-index reduction [25,21]. The isotropic case follows from the Kneser–Tits theorem over global fields; Gille’s account includes the final outer-$E_6$ cases, using work of Garibaldi and Chernousov–Timoshenko [14] Theorem 8.1. For anisotropic groups, Chernousov proved projective simplicity of the rational points when the absolute rank is at least two and the group splits over a quadratic extension [5] Theorem 1. Tomanov and Sury established substantial classical and low-index unitary cases [41,40].

For inner type $A$, the arithmetic work of Platonov–Rapinchuk and Raghunathan [24,28] preceded the reduction of Rapinchuk–Potapchik to finite simple quotients of the multiplicative group of a division algebra [31]. Segev obtained a commuting-graph obstruction, and Segev–Seitz verified the required finite-simple-group properties, completing this case [35,36]. Rapinchuk–Segev–Seitz later proved that every finite quotient of the multiplicative group of a finite-dimensional division algebra is solvable [32]; Rapinchuk gave a shorter proof of the inner-$A$ case using two-generation of finite simple groups [29]. The established cases are surveyed in [27] Sections 3.4–3.5. They include isotropic groups and all inner forms of type $A$, as well as the other types outside the remaining anisotropic outer $A$, trialitarian $D_4$, and $E_6$ cases. We use that reduction in Theorem 3 and supply the remaining arguments here. In particular, the previously established inner-type-$A$ theorem is available over every number field that occurs in a restriction-of-scalars subgroup.

The conjecture also enters the congruence subgroup problem: it is a normal-subgroup input to several descriptions of congruence kernels. That relationship does not justify using a theorem which assumes the conjecture to prove it. Our central-extension argument instead uses the unconditional finite-nonarchimedean injectivity in the metaplectic-kernel computation of Prasad and Rapinchuk [26] Proposition 2.6. The distinction between metaplectic vanishing and congruence-kernel conclusions under the normal-subgroup hypothesis is also explicit in [30] Section 2.

=== 1.2 A positive-density congruence consequence <a-positive-density-congruence-consequence>

Theorem 1 supplies the Margulis–Platonov hypothesis in Rapinchuk’s positive-density theorem, giving the following consequence.

#thm([Corollary 1.2.])[
  (Positive-density congruence subgroup property).  #emph[Let $k$ be a number field and $G$ an absolutely almost simple simply connected algebraic $k$-group. Let $M \/ k$ be the minimal Galois extension over which $G$ becomes an inner form of the split group, and let $"Spl" \( M \/ k \)$ be the set of nonarchimedean places of $k$ that split completely in $M$. Suppose that $S$ is a set of places of $k$ which contains all archimedean places, contains no nonarchimedean place $v$ with $"rank"_(k_v) G = 0$, and satisfies 
$ d_k #scale(x: 120%, y: 120%)[\(] S ∩ "Spl" \( M \/ k \) #scale(x: 120%, y: 120%)[\)] > 0 \, $

 where $d_k$ denotes Dirichlet density and the indicated density is assumed to exist. Then the $S$-congruence kernel is trivial: 
$ C^S \( G \) = { 1 } . $

 Equivalently, for any fixed faithful $k$-defined representation of $G$, the associated group $G \( cal(O) \( S \) \)$ over the ring of $S$-integers has the classical congruence subgroup property: every finite-index normal subgroup contains a principal congruence subgroup of some nonzero ideal level.]
] <cor:positive-density-csp>

#proof[
  Theorem 1 is the Margulis–Platonov statement assumed in [30] Theorem 1.1, for the same group and number field. The other hypotheses are exactly those imposed above, so that theorem gives $C^S \( G \) = { 1 }$. The equivalence with the classical congruence subgroup property is recalled in [30] Section 2. ◻
]

For an inner form of the split group, $M = k$, and the density condition is positive Dirichlet density of the nonarchimedean places in $S$. The corollary is restricted to the stated positive-density range: it does not address Serre’s finite-$S$ conjecture, arbitrary infinite $S$, or centrality or finiteness of congruence kernels outside that range.

=== 1.3 The finite obstruction <the-finite-obstruction>

We first prove that a noncentral normal subgroup $N$ has finite index. Choose a positive integer $e$ that annihilates the finite group $G \( k \) \/ N$, and let

$ R = G \( k \)^e = chevron.l g^e : g in G \( k \) chevron.r \, #h(2em) P_0 = overline(delta_A \( R \)) \, #h(2em) V_0 = delta_A^(- 1) \( P_0 \) . $

Here $G \( k \)^e$ is the subgroup generated by powers, not just the set of powers. The group $P_0$ is open and normal in $H_A$. It remains to show that the finite group $V_0 \/ R$ is trivial. This is the distinction between the desired abstract equality and the closure statement furnished by approximation.

Section 2 develops two tools for this finite obstruction. First, it constructs representatives of a fixed coset modulo $R$ satisfying specified local openings and avoiding a prescribed codimension-two reduction locus at almost all other places. The parameters are products of conjugates of torus powers. Scalar invariance permits an affine sieve while retaining control at the omitted approximation place; possible single poles are treated explicitly. Second, a signed permutation lattice calculation gives the Hasse principle and weak approximation for the norm torus needed to prescribe commuting elements with exact determinants.

=== 1.4 Odd-degree division algebras <odd-degree-division-algebras>

The first unresolved case is a special unitary group $S = "SU" \( D \, * \)$, where $D$ is an odd-degree central division algebra over a quadratic extension $L \/ k$ and $*$ is a unitary involution. Let $U = "U" \( D \, * \)$ be its full unitary group. Section 3 proves that a nontrivial finite defect for $S \( k \)$ yields one of two objects on $U \( k \)$: a finite abelian character nonzero on $S \( k \)$, or a homomorphism to a finite nonabelian simple group which is surjective on the defect preimage $V_0$. The commuting approximation and central-extension arguments are needed to obtain this dichotomy on the full unitary group. The class-preserving extension step adapts the inner-type argument of Rapinchuk–Potapchik [31] Section 2; here the commuting approximation must also prescribe determinants. A quotient of a unitary subgroup need not extend to the multiplicative group of its algebra.

Section 4 rules out the first object. An algebraic difference function on $D$ has enough exact elementary invariances to be constant on the required orbits. The exact additive span of $U \( k \)$ in $D$, together with the known inner-type-$A$ theorem and a real-signature interpolation argument, forces any finite abelian character to vanish on $S \( k \)$.

Sections 5 and 6 rule out the second object. A finite simple quotient assigns a color to each rational unitary element. The distribution of these colors is not assumed continuous. We construct a translation-invariant probability law on their finite patterns whose individual color distributions are uniform. Fractional unitary transformations turn additive recurrence into a centralizer double-coset condition. A finite-simple-group lemma, stated in Section 5 and proved in Section 6, excludes that condition. Elementary transformations then force an impossible invariance under all left color translations.

The construction of the uniform-marginal law is an important part of the proof: additive averaging by itself need not preserve all colors. Conformal weights on rational points of a flag variety use Langlands’s Eisenstein-series convergence theorem [18]. Finite-volume harmonicity and Howe–Moore matrix-coefficient decay [15,6] then provide the required marginals before additive averaging is performed. The later positive-density argument uses the multidimensional theorem of Furstenberg–Katznelson [12]. The uniform-marginal construction, the coset-preserving sieve, and the explicit norm-torus calculation are developed before the final case reductions so that their hypotheses and conclusions remain visible.

=== 1.5 Completion of the proof <completion-of-the-proof>

Section 7 proves the other outer-type-$A$ cases by induction on reduced degree, simultaneously over all number fields. The ternary split-algebra case uses quadratic norm equations on a Châtelet surface. Even degree is reduced by a quaternion factorization and a smaller unitary centralizer, with a separate degree-four determinant correction. The approximation construction controls the finite places of the subgroups as they vary.

Section 8 treats $D_4$ by finding, in each relevant rational coset, a regular element whose torus admits a rational inverter. It is a product of two involutions, each already controlled inside a type-$A_2$ subgroup. Section 9 reduces a generic $E_6$ element to a simply connected $D_4$ subgroup and the cover of a root-involution centralizer of type $A_1 A_5$. The last step is a torsor under a connected simply connected group, so its local factorizations can be globalized. The proof ends by returning to the original abstract subgroup $N$.

== 2 Finite quotients and approximation <sec:foundations>

The first objective is to isolate what local approximation does not already prove. Every noncentral normal subgroup has finite index, but its closure at the anisotropic finite places need not a priori recover the subgroup. We express this possible discrepancy as a finite quotient. We then develop two tools for eliminating it: an approximation procedure that retains the abstract rational coset, and a Hasse principle with weak approximation for a particular norm torus.

=== 2.1 Conventions and established inputs <conventions-and-established-inputs>

Throughout, $k$ is a number field, $V_k$ is its set of places, and $G$ is an absolutely almost simple simply connected $k$-group. Write

$ A = { v in V_k : med v upright(" is nonarchimedean and ") "rank"_(k_v) G = 0 } \, #h(2em) G_A = product_(v in A) G \( k_v \) . $

The diagonal homomorphism to this product is denoted by $delta$. Thus $G_A = H_A$ and $delta = delta_A$ in the notation of the introduction. An empty product is the trivial group. The set $A$ is finite: outside finitely many places the group has a reductive model and is unramified and quasi-split, hence has positive relative rank. At a nonarchimedean place an absolutely simple anisotropic group has type $A$.

For a finite set of places $B$, a subscript $B$ on a rational element denotes its tuple of local images. Products over finitely many places have their ordinary product topology. In an adelic product we use the restricted product with respect to fixed integral compact open subgroups outside a finite set. Weak approximation means density at finitely many completions; strong approximation means density in the specified restricted adelic product.

For an integer $e gt.eq 1$, the notation

$ G \( k \)^e = chevron.l g^e : g in G \( k \) chevron.r $

always denotes the abstract subgroup generated by the powers. No closure is included in this definition. Degrees of central simple algebras are reduced degrees; for example, $"SL"_1 \( M_r \( Delta \) \)$ has type $A_(r deg Delta - 1)$. Restrictions of scalars will be treated over their defining extension fields when applying an induction or an approximation theorem.

We use the strong approximation theorem for simply connected absolutely almost simple groups: if $G \( k_w \)$ is noncompact, then $G \( k \)$ is dense in the adelic product away from $w$ [25] Theorem 7.12. We also use the lattice theorem for semisimple $S$-arithmetic groups [25] Theorem 5.7(1), the normal subgroup theorem for irreducible $S$-arithmetic lattices of total rank at least two, and the local Kneser–Tits and simplicity theorems. In the last assertion, for a nonarchimedean $v$ with positive rank, $G \( k_v \)$ is perfect and $G \( k_v \) \/ Z \( G \( k_v \) \)$ is abstractly simple. These results are used in their number-field forms [25] Chapters VII and IX[21] Chapter VIII, Theorem A.

We refer to the assertion of Theorem 1 for a particular group over a particular number field as #emph[(MP)]. We require the following established cases.

#thm([Theorem 2.1.])[
  (Known cases of (MP)).  #emph[The assertion (MP) holds except possibly for anisotropic groups of outer type $A$, trialitarian type $D_4$, and type $E_6$. In particular it holds for every inner form of $"SL"_n$, over every number field.]
] <thm:known-mp>

The formulation, including the results for multiplicative groups of division algebras that enter the inner type $A$ case, is recalled in [27] Sections 3.4–3.5. For the isotropic completion see [14] Theorem 8.1; for inner type $A$ see [31,35,36], with the subsequent strengthening in [32]. Thus, when we address one of the remaining types, we may assume that the group is anisotropic over its ground field.

We will also use the following form of the Hasse principle. A torsor under a $k$-group $H$ means a principal homogeneous space for $H$ over $k$.

#thm([Theorem 2.2.])[
  (Simply connected Hasse principle).  #emph[Let $H$ be a simply connected semisimple group over a number field $k$. Then $H^1 \( k_v \, H \) = 1$ at every nonarchimedean place. A torsor $X$ under $H$ that has a point over every completion of $k$ has a $k$-point. Moreover, $X \( k \)$ is dense in $product_(v in B) X \( k_v \)$ for every finite set $B$ of places.]
] <thm:foundations-hasse>

The local and global vanishing assertions are the Kneser–Harder–Chernousov Hasse principle; we use the standard number-field statements in [25] Theorems 6.4 and 6.6. For the last assertion, a rational point identifies $X$ with $H$. Decompose $H$ as a product of restrictions of scalars of simply connected absolutely almost simple groups. For each factor, choose an auxiliary split finite place outside the given approximation set and apply strong approximation away from it. This gives the stated weak approximation, also for products and restrictions of scalars.

We use the usual local and global theory of central simple algebras and involutions, including local Brauer invariants, the embedding criterion for fields, the Hasse–Schilling norm theorem, and the classification of hermitian forms [25,33,16]. When an etale algebra is a product of fields, norm and local arguments are understood factor by factor. All fields have characteristic zero unless they are explicitly residue fields. In root computations the roots of a simply laced system have squared length two. A superscript $1$ on a multiplicative group denotes the kernel of the indicated norm.

=== 2.2 The finite quotient not detected by closure <the-finite-quotient-not-detected-by-closure>

#thm([Proposition 2.3.])[
  (Finite-defect reduction).  #emph[Every abstract noncentral normal subgroup of $G \( k \)$ has finite index. Fix $e gt.eq 1$, and put 
$ R = G \( k \)^e \, #h(2em) P_0 = overline(delta \( R \)) subset G_A \, #h(2em) V_0 = delta^(- 1) \( P_0 \) \, #h(2em) V = V_0 \/ R . $

 Then $R$ has finite index, $P_0$ is open and normal in $G_A$, and $V$ is finite. For every positive-rank nonarchimedean place $w$, the closure of $R$ in the adelic product away from $w$ is exactly the inverse image of $P_0$.]
  #emph[To prove (MP) for $G$, it suffices to show $V = 1$ for every $e$. If $gamma in V_0$, representatives of $gamma R$ can be chosen arbitrarily close to $1$ at any prescribed finite set of places. Away from $A$, these near-identity conditions may be replaced by arbitrary nonempty local open conditions. Finitely many nonempty Zariski open conditions may be imposed simultaneously.]
] <prop:finite-defect>

#proof[
  Let $N lt.closed G \( k \)$ be noncentral, and choose a noncentral $n in N$. Take a finite set $T$ containing the archimedean places, $A$, the denominator places of $n$, and auxiliary split finite places whose total local rank is at least two. For fixed integral compact opens outside $T$, set
  $ K^T = product_(v in.not T) G \( cal(O)_v \) \, #h(2em) Gamma = G \( k \) ∩ K^T \, $
  where changing finitely many integral models changes neither argument. The group $Gamma$ is the corresponding $T$-arithmetic group and contains $n$.
  The lattice theorem [25] Theorem 5.7(1) makes $Gamma$ a lattice in the product of the local groups at $T$. Remove its compact factors. This preserves discreteness: the inverse image of a compact subset of the remaining product is compact after the compact factors are restored, and hence meets $Gamma$ in finitely many points. It also preserves finite covolume. The rational embedding remains faithful. Strong approximation away from each noncompact factor supplies the projection density required for irreducibility. The $S$-arithmetic normal subgroup theorem now applies to $Gamma ∩ N$, which is normal and noncentral, and yields
  $ \[ Gamma : Gamma ∩ N \] < oo . $
  If one uses the formulation with a finite-normal-subgroup alternative, that alternative is central: the centralizer of a finite normal subgroup contains a finite-index Zariski-dense subgroup of $Gamma$, and hence is all of the connected group $G$.
  Strong approximation, omitting a positive-rank place in $T$, shows that $Gamma$ is dense in $K^T$. Thus the closure of $Gamma ∩ N$ has finite index in $K^T$. It is closed, so it is open. It follows that the closure $C$ of $N$ in the restricted product away from $T$ is open. It is normal because $N$ is normal and $G \( k \)$ is dense there.
  Every place outside $T$ has positive rank. For such a place $v$, the intersection $C ∩ G \( k_v \)$, with the local group supported at that single place, is an open normal subgroup. It cannot be central, since the center is finite. Local simplicity modulo center and perfectness give $C ∩ G \( k_v \) = G \( k_v \)$. Finite-support products are dense in the restricted product, so $C$ is the whole restricted product. Given $g in G \( k \)$, we can therefore choose $a in N$ with $a g in K^T$, and hence $a g in Gamma$. The map from $Gamma \/ \( Gamma ∩ N \)$ to $G \( k \) \/ N$ is surjective. This proves the finite-index assertion.
  The power map has differential $e$ times the identity at $1$; it is therefore dominant in characteristic zero. Rational points of a connected linear algebraic group over $k$ are Zariski dense. Consequently $R$ is Zariski dense and noncentral, so the preceding assertion applies to $R$. Density of $G \( k \)$ in $G_A$ follows from strong approximation away from an auxiliary positive-rank finite place. Since $R$ has finite index, its closure $P_0$ has finite index in $G_A$, is normal, and is open.
  Now omit any positive-rank finite place $w$. The closure $C_w$ of $R$ in the remaining adelic product is again closed, normal, and of finite index: finitely many translates of it already contain the dense subgroup $G \( k \)$. Thus it is open. The local argument just given shows that $C_w$ contains every positive-rank nonarchimedean factor. It contains every archimedean factor as well: the group of real points of a simply connected semisimple algebraic group is connected, and so is the group of complex points. Their maps into the finite discrete quotient by $C_w$ are therefore trivial. Taking closures of finite-support products proves that $C_w$ contains the kernel of the projection to $G_A$. Its image there is closed, contains $delta R$, and is contained in $P_0$; hence it is exactly $P_0$. This proves the closure description.
  For an original noncentral normal subgroup $N$, the finite quotient $G \( k \) \/ N$ has some exponent $e$, so $R subset N$. If $V = 1$, then $R = delta^(- 1) \( P_0 \)$, and density gives an isomorphism
  $ G \( k \) \/ R tilde.eq G_A \/ P_0 . $
  The normal subgroup $N \/ R$ corresponds to a normal subgroup of this finite quotient. Its inverse image in $G_A$ is an open normal subgroup $W$, and $N = delta^(- 1) \( W \)$.
  Finally, for $gamma in V_0$, the closure of $gamma R$ away from $w$ is the same inverse image of $P_0$, since $gamma_A P_0 = P_0$. It contains the identity at the places in $A$ and all tuples at other places. Choose $w$ outside any prescribed finite approximation set to obtain the asserted local choices. Nonempty local open subsets are Zariski dense in the smooth connected group; intersecting one such opening with any additional nonempty Zariski open subset preserves nonemptiness. This supplies the last assertion. ◻
]

The following consequence records exactly how an already established case of (MP) will be used for subgroups. In particular it does not require a finite homomorphism to be continuous in advance.

#thm([Lemma 2.4.])[
  (Restriction to a group satisfying (MP)).  #emph[Let $psi : G \( k \) arrow.r F_0$ be a homomorphism to a finite group of exponent dividing $e$. Let $f : H arrow.r G$ be a $k$-homomorphism, where $H$ is a product of restrictions of scalars of simply connected absolutely almost simple groups for which (MP) is known over their respective number fields. The homomorphism $psi compose f$ on $H \( k \)$ extends continuously to the product of the anisotropic finite local groups of those factors. Its image still has exponent dividing $e$. Consequently $psi \( f \( h \) \) = 1$ if $h$ is an $e$-th power at every one of these local factors.]
] <lem:restriction-mp>

#proof[
  For one absolutely almost simple factor, the kernel of the restricted finite homomorphism has finite index and is Zariski dense, so it is not central. By (MP) it is the inverse image of an open normal subgroup $W_H$ of the anisotropic local product. Density identifies the rational quotient with the finite quotient by $W_H$. The homomorphism therefore extends through that quotient. For a product, extend the maps factor by factor. Their images commute, as they do on rational points, so the extensions combine. Apply this argument over the extension field for each restriction of scalars. The extended image is unchanged, and every local $e$-th power maps to $1$. ◻
]

=== 2.3 An affine avoidance lemma <an-affine-avoidance-lemma>

The closure calculation permits finitely many local conditions. The next argument supplies an additional condition at almost all finite places. It will be applied to an affine space of parameters, not to integral points of a torus. Codimension-two avoidance in affine space is an instance of arithmetic purity of strong approximation; see [4] Proposition 3.6 and [43] arXiv version, Lemma 1.1. We give the fixed-direction version with an unbounded parameter at the omitted place needed below.

#thm([Lemma 2.5.])[
  (Avoidance along a line).  #emph[Let $E$ be an $N$-dimensional $k$-vector space, and let $Z subset E$ be closed of geometric codimension at least two. Choose $d in E \( k \) \\ { 0 }$ whose point at infinity is outside the projective closure of $Z$, and let $pi : E arrow.r E \/ k d$ be the quotient map. Fix a nonarchimedean place $v_0$, linear coordinates, and a rational linear section of $pi$. Outside a finite set of model exceptions, require that these data give an integral direct sum $E = k d xor E'$, with $d$ an integral basis for the first summand, that $pi \|_Z$ remains finite on reduction, and that every geometric fiber has cardinality at most $D$.]
  #emph[Let $Sigma$ be a finite set containing $v_0$, the archimedean places, those model exceptions, and all places with residue cardinality at most $D$. For every $v in Sigma \\ { v_0 }$, prescribe a nonempty open subset $cal(O)_v subset E \( k_v \)$. There are a vector $y in E \( k \)$ and elements $l in k$ with $\| l \|_(v_0)$ arbitrarily large such that $a = y + l d$ belongs to $cal(O)_v$ at these prescribed places, is integral outside $Sigma$, and its reduction avoids $Z$ at every finite place outside $Sigma$.]
] <lem:foundations-affine-sieve>

#proof[
  The condition on the point at infinity makes $pi \|_Z$ finite. For example, extend the projection to projective space: the only indeterminacy is the chosen point at infinity, which is disjoint from the projective closure of $Z$. Over an affine point of the target, the only possible point at infinity on its fiber line is that same point. Thus the restricted morphism is proper and has finite fibers, and is finite. Its image $Y subset E \/ k d$ is closed and proper, since $dim Z lt.eq N - 2 < dim \( E \/ k d \)$. Use the fixed linear coordinates and integral models; their exceptional places already belong to $Sigma$.
  Linear projection is open at each completion. Additive strong approximation away from $v_0$ gives
  $ q in \( E \/ k d \) \( k \) \\ Y \( k \) $
  that is integral outside $Sigma$ and belongs to $pi \( cal(O)_v \)$ at every prescribed place. To ensure $q in.not Y$, first shrink one of the prescribed nonempty openings in the quotient to miss $Y$; a proper algebraic subset has empty interior. Choose a rational linear lift $y$ of $q$, integral outside $Sigma$.
  Because $q in.not Y$, its reduction belongs to the reduction of $Y$ at only finitely many finite places outside $Sigma$. Indeed a polynomial vanishing on $Y$, but not at $q$, is a nonzero integral value away from finitely many places. At each of the remaining exceptional places, the forbidden points in the fiber line number at most $D$. The residue field has more than $D$ elements, so an integral value of $l$ avoiding them exists. This is a nonempty local congruence condition on $l$. At a prescribed place $v$, the condition $q in pi \( cal(O)_v \)$ likewise gives a nonempty local open set of $l$ with $y + l d in cal(O)_v$.
  Apply additive strong approximation once more, now to $l$, imposing these finitely many conditions and integrality at all other finite places outside $Sigma$. The local openings may be chosen relatively compact away from $v_0$. There are infinitely many such rational $l$, by density in the adeles away from $v_0$. They cannot all remain bounded at $v_0$, since the diagonal copy of $k$ is discrete in its full adele ring. We may therefore choose $\| l \|_(v_0)$ arbitrarily large. This gives all the assertions. ◻
]

=== 2.4 Approximation by abstract power factors <approximation-by-abstract-power-factors>

We now use anisotropy to make the unrestricted direction in Lemma 7 harmless at $v_0$. Assume $G$ is $k$-anisotropic. Fix a maximal $k$-torus $T_0 subset G$, a finite Galois extension $P \/ k$ splitting $T_0$ and any fixed auxiliary data, and a regular cocharacter $lambda : bb(G)_(m \, P) arrow.r T_(0 \, P)$. The map

#[#set math.equation(numbering: n => "(2.1)")
 $ eta : "Res"_(P \/ k) bb(G)_m arrow.r T_0 \, #h(2em) eta \( a \) = N_(P \/ k) #scale(x: 120%, y: 120%)[\(] lambda \( a \) #scale(x: 120%, y: 120%)[\)] $ <eq:foundations-eta>]

is defined over $k$. Its restriction to the diagonal $bb(G)_m$ has cocharacter $sum_(sigma in "Gal" \( P \/ k \)) lambda^sigma$. This is a $k$-cocharacter and hence is zero by anisotropy. In particular

#[#set math.equation(numbering: n => "(2.2)")
 $ eta \( l a \) = eta \( a \) quad \( l in k^times \) . $ <eq:foundations-scalar-invariance>]

For $x in G \( k \)$, or for $x$ in a fixed rational algebraic coset $X = x_(*) G$ inside a larger linear algebraic group, consider

#[#set math.equation(numbering: n => "(2.3)")
 $ Phi \( a_1 \, dots.h \, a_r \) = x product_(j = 1)^r k_j eta \( a_j \)^e k_j^(- 1) \, #h(2em) k_j in G \( k \) \, quad a_j in P^times . $ <eq:foundations-power-map>]

Its values lie in the same right coset $x R$, with $R = G \( k \)^e$. Its parameter domain is the open torus $\( "Res"_(P \/ k) bb(G)_m \)^r$ in the affine $k$-space $E = \( "Res"_(P \/ k) bb(A)^1 \)^r$. Over $P$, its boundary consists of the hyperplanes $a_(j \, sigma) = 0$, one for each absolute coordinate.

We call a reduction a #emph[single-pole reduction] if exactly one of these absolute coordinates vanishes. Away from the other hyperplanes, Equation (2.3) then takes the form

#[#set math.equation(numbering: n => "(2.4)")
 $ Phi = g_L thin lambda^sigma \( t \)^e thin g_R \, #h(2em) t = a_(j \, sigma) \, $ <eq:foundations-single-pole>]

where the side factors are regular group- or coset-valued functions. At a good finite place with this reduction, Frobenius fixes the unique vanishing coordinate. Its action on the embeddings of the Galois extension $P \/ k$ is regular. Thus the place splits completely in $P$, $t$ has positive valuation, and the side factors are integral. The local analysis of Equation (2.4) may therefore be carried out in split coordinates.

Here is the precise criterion used in later sections. Its hypothesis about the single-pole configurations is substantive and will be verified in each application. A consecutive list of factors in Equation (2.3) is called a #emph[basic list] if its product map is dominant and has surjective differential somewhere.

#thm([Proposition 2.6.])[
  (Power-factor approximation).  #emph[Let $G$ be $k$-anisotropic, with $P$, $eta$, $R$, and $X = x_(*) G$ as above. Fix $gamma in G \( k \)$, the rational coset $cal(C) = x_(*) gamma R subset X \( k \)$, a geometrically codimension-at-least-two closed subset $D subset X$, and a finite set $B$ containing the archimedean places, $A$, and the exceptions for fixed integral models and sufficiently small residue fields. Include in $B$ a positive-rank finite place $v_0$. At $B$ prescribe nonempty local open conditions compatible with the closure of $cal(C)$ in Proposition 5.]
  #emph[At each finite place outside $B$, prescribe an allowed set $cal(U)_v subset X \( k_v \)$. Assume:]
  + #emph[every integral point whose reduction avoids $D$ belongs to $cal(U)_v$;]
  + #emph[$cal(U)_v$ contains a nonempty local open set;]
  + #emph[single-pole configurations are tested by finitely many algebraic nonvanishing conditions over $P$, independent of $v$. Their nonemptiness is compatible with the following order of choices. First choose at least two disjoint basic lists, with their conjugator tuple in a nonempty Zariski open subset of its product of copies of $G$. For each such tuple there is a nonempty Zariski open subset of $X$ in which to choose $x$. After $x$ is fixed, for every finite number of additional factors there is a nonempty Zariski open subset of the corresponding product of copies of $G$ in which to choose their conjugators. For every tuple allowed by these successive choices, the tests restrict to a nonempty open subset of each absolute boundary hyperplane away from the others. They guarantee membership in $cal(U)_v$ at a single-pole reduction, outside finitely many model exceptions for the fixed data.]
  #emph[In the third condition the tests are imposed with all their Galois conjugates. Appending additional factors is required to preserve the tests on an existing hyperplane when the new parameters are set to $1$. Thus their insertion does not remove the previously available open subsets. The additional factors permit the local moves required by the second condition.]
  #emph[Then there is $x' in cal(C)$ satisfying the prescribed conditions at $B$ and belonging to $cal(U)_v$ for every finite $v in.not B$. Finitely many nonempty Zariski open conditions on the initial representative and conjugators can be included in their choice, provided they are compatible with the third condition.]
] <prop:power-approximation>

#proof[
  We give the construction in an order that keeps the finite model exceptions separate from the infinitely many avoidance conditions. When the preliminary choices enlarge $B$, use at each newly added place a nonempty opening inside $cal(U)_v$, as supplied by the second hypothesis. Such places lie outside $A$, so these added conditions are compatible with the coset closure. Meeting them preserves the conclusion requested for the original $B$.
  #emph[Dominant parameter lists.] The adjoint translates of the differential of a nonzero cocharacter span $"Lie" \( G \)$: their span is a nonzero adjoint-invariant subspace of the simple Lie algebra. Since $G \( k \)$ is Zariski dense, finitely many rational conjugators make the product of their $eta^e$-maps have surjective differential at some point. Such a product map is dominant. Choose at least two disjoint consecutive lists with this property in the nonempty open set supplied by the third hypothesis. We may intersect that set with any further prescribed nonempty Zariski open conditions. The product of copies of $G$ is geometrically irreducible, so such intersections remain nonempty.
  On the open parameter torus the total product map is smooth whenever one of its basic list maps is smooth. Each list has a proper closed nonsmooth locus. Since the two lists have disjoint parameter sets, their simultaneous nonsmooth locus has codimension at least two. The inverse image of $D$ has codimension at least two on the smooth locus, and any remaining part lies in that same codimension-two nonsmooth locus. Therefore its closure in $E$ has codimension at least two. Adding further independent lists does not change this conclusion.
  We also need a residue-field observation about one fixed basic list. After discarding finitely many model exceptions, its dominance persists on reduction. For any integral translating point $x$, the inverse image of the dense open $X \\ D$ is a nonempty open in its affine parameter space. The equations excluded here, including the norm equations defining the torus boundary, have bounded degree independently of the translating point. The elementary bound for zeros of a nonzero polynomial over a finite field therefore supplies a rational parameter in this open whenever the residue field is sufficiently large. Thus unit parameters in one basic list, all other parameters set to $1$, can give a reduction outside $D$. Put these fixed exceptions and small residue fields into $B$.
  #emph[The initial point and its denominator places.] Choose $x in cal(C)$ satisfying the conditions at $B$, using Proposition 5; to approximate also at $v_0$, omit a different positive-rank place. Any prescribed compatible Zariski open conditions can be included; in particular, take $x$ in the open subset supplied by the third hypothesis after the basic conjugators have been fixed. Let $B_1$ be the finite set of places outside $B$ where $x$ is not integral. At each such place choose a nonempty open subset of $cal(U)_v$.
  The local normal subgroup generated by $eta \( \( P ⊗_k k_v \)^times \)^e$ is all of $G \( k_v \)$. Indeed this image is Zariski noncentral, as can be seen in the independent absolute coordinates, and local simplicity modulo center and perfectness apply. Every element of that generated subgroup is a finite product of conjugates of such powers; inverse factors are again of the same form. Consequently finitely many extra lists can move $x_v$ into the chosen opening at each $v in B_1$. Fix the finite number of factors needed for these moves, padding the local lists by factors with parameter $1$ where necessary. The third hypothesis supplies a nonempty Zariski open subset for this whole tuple of extra conjugators, with the initial $x$ and basic conjugators unchanged. Each product of the required local openings is Zariski dense and hence meets this subset. Choose their conjugators globally by strong approximation away from $v_0$, approximating the required local conjugators and remaining integral outside $B union B_1$. Additional nonempty Zariski open conditions are compatible with this choice. The basic parameters can be taken near $1$ on $B union B_1$; the extra parameters can be taken near $1$ on $B$. We now have nonempty open conditions on the full affine parameter space at every place of $B union B_1$.
  #emph[The closed subset to be avoided.] Fix the constants just chosen. In $E$, let $Z$ be the union of the closure of $Phi^(- 1) \( D \)$, intersections of distinct boundary hyperplanes, and the excluded proper closed subsets of each individual hyperplane from the third hypothesis. Take all Galois conjugates, so $Z$ is defined over $k$. Every component has codimension at least two: this was proved for the first part, is immediate for the intersections, and follows from nonemptiness of the specified open tests for the last part. For parameters integral at a good place and reducing outside $Z$, there are exactly two possibilities. Either every torus coordinate is a unit and $Phi$ is integral with reduction outside $D$, or there is one pole and its prescribed open test holds. In both cases $Phi$ belongs to $cal(U)_v$.
  #emph[The direction and the residual exceptions.] Choose a rational direction $d = \( d_1 \, dots.h \, d_r \) in E \( k \)$ whose point at infinity avoids the projective closure of $Z$. Choose each $d_j$ sufficiently close to $1$ at $v_0$ so that $Phi \( d \)$ still satisfies the prescribed condition there. These requirements are compatible: avoiding a proper algebraic subset is dense in any local open set. The projection along $d$, its linear splitting, the tests defining $Z$, and the fiber bound introduce only finitely many further exceptions. They are fixed before the quotient point in the sieve is chosen.
  At a new exceptional place outside $B union B_1$, the point $x$ and all conjugators are integral. Use the residue-field observation for a basic list to choose unit parameters giving reduction outside $D$, and take the extra parameters near $1$. This provides a nonempty local opening where $Phi in cal(U)_v$, even though the projection or single-pole model might be unusable there. Any additional small residue fields needed for the fiber bound are treated in exactly this way; the smaller fields for which the basic-list observation itself fails already lie in $B$. Let $Sigma$ contain $B union B_1$ and all these residual exceptions.
  We can now apply Lemma 7 with the parameter openings just specified, omitting the condition at $v_0$. It gives parameters $a = y + l d$, integral outside $Sigma$, reducing outside $Z$ there, and meeting all the openings at $Sigma \\ { v_0 }$. As $\| l \|_(v_0) arrow.r oo$, Equation (2.2) gives
  $ eta \( a_j \) = eta \( d_j + l^(- 1) y_j \) arrow.r eta \( d_j \) . $
  For sufficiently large $\| l \|_(v_0)$, every $a_j$ is nonzero and $Phi \( a \)$ satisfies the required condition at $v_0$. It satisfies the conditions at all other exceptional places by construction, and lies in $cal(U)_v$ elsewhere by avoidance of $Z$. Finally $Phi \( a \) in x R = cal(C)$, since every factor in Equation (2.3) is an abstract $e$-th power. This completes the construction. ◻
]

The proposition allows poles, but only in a controlled form at places that split completely in $P$. In particular, it makes no assertion that the torus parameters can be integral units everywhere. The later applications will specify $D$, prove the nonemptiness of every single-pole test, and check its local consequence.

=== 2.5 Cohomology detected on cyclic subgroups <cohomology-detected-on-cyclic-subgroups>

Our final preliminary tool solves simultaneous norm equations with prescribed local approximations. We first separate the arithmetic duality input from the finite-group calculation.

For a discrete Galois module $M$, write

$ "Sha"^i \( k \, M \) = ker (H^i \( k \, M \) arrow.r product_(v in V_k) H^i \( k_v \, M \)) . $

The notation $"Sha"_omega^i \( k \, M \)$ means classes whose localizations vanish at all but finitely many places. For a group $H$, the degree-one notation has its pointed-set meaning. Galois cohomology and its cochains are continuous throughout. A #emph[lattice] is a finitely generated free abelian group with a continuous Galois action, which necessarily has finite image.

#thm([Lemma 2.7.])[
  (Cyclic detection).  #emph[Let $M$ be a $k$-lattice split by a finite Galois extension $P \/ k$, and put $Gamma = "Gal" \( P \/ k \)$. Inflation identifies $"Sha"_omega^2 \( k \, M \)$ with 
$ ker (H^2 \( Gamma \, M \) arrow.r product_(C subset Gamma med upright("cyclic")) H^2 \( C \, M \)) . $

 If this group is zero and $T$ is a $k$-torus with character lattice $M$, every everywhere locally soluble torsor under $T$ has a rational point and satisfies weak approximation.]
] <lem:foundations-cyclic-detection>

#proof[
  Over $P$ the action on $M$ is trivial. The exact sequence with rational coefficients identifies
  $ H^2 \( P \, M \) tilde.eq H^1 \( P \, M ⊗ \( bb(Q) \/ bb(Z) \) \) . $
  The right side consists of continuous finite-image characters. If a class is locally zero almost everywhere, its restriction to $P$ is zero by Chebotarev. Moreover $H^1 \( P \, M \) = 0$, since a continuous homomorphism from a profinite group to a torsion-free discrete abelian group has finite, hence trivial, image. Inflation–restriction therefore identifies such a class with a unique class in $H^2 \( Gamma \, M \)$.
  At a place unramified in $P$, the decomposition group is cyclic. Local inflation is injective by the same vanishing of degree-one cohomology over the splitting field. Chebotarev realizes, up to conjugacy, every element of $Gamma$ as a Frobenius element. Thus local vanishing almost everywhere is equivalent to vanishing on every cyclic subgroup. Conversely, a class with those cyclic restrictions zero is locally zero at every unramified place, which proves the identification.
  Torus duality identifies the Hasse-principle obstruction for torsors under $T$ with the dual of $"Sha"^2 \( k \, M \)$, and controls the weak approximation defect of $T$ by $"Sha"_omega^2 \( k \, M \)$ [34] Proposition 9.8 and Corollary 8.14. The stated vanishing therefore gives a rational point on every locally soluble torsor and weak approximation on $T$. Translation by that rational point gives weak approximation on the torsor. ◻
]

To calculate this kernel, it is convenient to use extensions by lattices. The following lemma will also apply when the finite group is not a direct product.

#thm([Lemma 2.8.])[
  (A central sign element).  #emph[Let $Gamma$ be a finite group and $M$ a torsion-free $Gamma$-lattice. Suppose that $c in Z \( Gamma \)$ has order two and acts on $M$ as multiplication by $- 1$. An extension 
$ 1 arrow.r M arrow.r E arrow.r Gamma arrow.r 1 $

 determines a class $beta \( E \) in H^1 \( Gamma \/ chevron.l c chevron.r \, M \/ 2 M \)$, and this class is zero if and only if the extension splits. If the restriction to the subgroup generated by an involution $r in Gamma$ splits, the value at the image of $r$ of every cocycle representing $beta \( E \)$ lifts to an element $d_r in M$ with $\( 1 + r \) d_r = 0$.]
] <lem:foundations-sign-extension>

#proof[
  Write the subgroup $M$ additively, with translations on the left. Let $z$ lift $c$. Since $z^2 in M$ commutes with $z$, it lies in $M^c = 0$; hence $z$ is an involution. Choose lifts $s_g$ of $g in Gamma$, with $s_1 = 1$, and write
  $ s_g s_h = f \( g \, h \) s_(g h) \, #h(2em) z s_g z^(- 1) = d_g s_g . $
  Comparing the two expressions for the conjugate of $s_g s_h$ gives
  $ d_(g h) = d_g + g d_h + 2 f \( g \, h \) . $
  Thus $g mapsto d_g med mod med 2 M$ is a cocycle. Replacing $s_g$ by $a_g s_g$ replaces $d_g$ by $d_g - 2 a_g$. Replacing $z$ by $a z$ replaces $d_g$ by $d_g + \( 1 - g \) a$, a coboundary change modulo two. Choose $s_c = z$; then $d_c = 0$, and the cocycle descends to $Gamma \/ chevron.l c chevron.r$, whose action on $M \/ 2 M$ is well defined.
  If its class is zero, change $z$ so that all $d_g$ are even, and then replace $s_g$ by $\( d_g \/ 2 \) s_g$. All these lifts commute with $z$. The centralizer $C_E \( z \)$ consequently maps onto $Gamma$, and its kernel is $M^c = 0$. The inverse of this isomorphism is a splitting. A splitting plainly gives the zero class. Finally, if $s_r$ is an involutive lift of $r$, conjugating its square by $z$ gives $\( 1 + r \) d_r = 0$. Changing the cocycle by a coboundary replaces this lift of its value by $d_r + \( 1 - r \) a$ for some $a in M$, and preserves the identity because $\( 1 + r \) \( 1 - r \) a = 0$. ◻
]

=== 2.6 The simultaneous norm torus <the-simultaneous-norm-torus>

#thm([Lemma 2.9.])[
  (Hasse principle and approximation for a norm torus).  #emph[Let $L \/ k$ be quadratic, let $F \/ k$ be separable of degree $m gt.eq 3$, and suppose that the normal closure of $F$, jointly with $L$, has Galois group $S_m times C_2$, with its natural action on the embeddings of $F$. Set 
$ T = ker ("Res"_(F \/ k) #scale(x: 120%, y: 120%)[\(] "Res"_(L F \/ F)^1 bb(G)_m #scale(x: 120%, y: 120%)[\)] arrow.r^(thin N_(L F \/ L) thin) "Res"_(L \/ k)^1 bb(G)_m) . $

 This kernel is a torus. Every torsor under $T$ with points over all completions has a rational point, and its rational points are dense at any prescribed finite set of completions.]
] <lem:norm-torus>

#proof[
  Let $c$ denote the generator of the second factor $C_2$. On character lattices the norm map is the diagonal inclusion
  $ bb(Z)_(upright("sign")) arrow.r bb(Z)^m ⊗ upright("sign")_(C_2) . $
  It is primitive. Thus its cokernel is torsion-free, the kernel of the norm map is connected, and its character lattice is
  #[#set math.equation(numbering: n => "(2.5)")
   $ M = \( bb(Z)^m \/ bb(Z) upright(bold(1)) \) ⊗ upright("sign")_(C_2) . $ <eq:foundations-norm-lattice>]
  Here $S_m$ permutes the coordinates and $c$ acts by $- 1$. By Lemma 9, it suffices to split every extension of $S_m times C_2$ by $M$ that splits over all cyclic subgroups.
  Fix such an extension. Lemma 10 gives a class
  $ beta in H^1 \( S_m \, M \/ 2 M \) . $
  We show that $beta = 0$. Put
  $ V_m = bb(F)_2^m \, #h(2em) Q_m = V_m \/ bb(F)_2 upright(bold(1)) = M \/ 2 M . $
  The permutation-module sequence
  $ 0 arrow.r bb(F)_2 upright(bold(1)) arrow.r V_m arrow.r Q_m arrow.r 0 $
  has a connecting map
  $ H^1 \( S_m \, Q_m \) arrow.r H^2 \( S_m \, bb(F)_2 \) . $
  By Shapiro’s lemma, the preceding map on degree-one cohomology is the restriction
  $ H^1 \( S_m \, bb(F)_2 \) arrow.r H^1 \( S_(m - 1) \, bb(F)_2 \) . $
  It is an isomorphism for $m gt.eq 3$: both sides are generated by the permutation sign character. Therefore the connecting map is injective. Its image consists of classes whose restriction to the point stabilizer $S_(m - 1)$ is zero.
  Let $hat(S)_m$ be the central extension by $bb(F)_2$ corresponding to the image of $beta$, and denote its nonidentity central kernel element by $zeta$. It splits on each point stabilizer, by conjugacy. Consequently every transposition has involutive lifts. For $m gt.eq 5$, two disjoint transpositions fix a common point, so their lifts commute. For $m = 3$ there is no disjoint pair of Coxeter generators to consider.
  In either of these cases, choose involutive lifts $t_i$ of the adjacent transpositions $\( i \, i + 1 \)$. Write
  $ \( t_i t_(i + 1) \)^3 = zeta^(epsilon.alt_i) \, #h(2em) epsilon.alt_i in bb(F)_2 . $
  Multiplying $t_i$ by $zeta^(a_i)$, with $a_1 = 0$ and $a_(i + 1) = a_i + epsilon.alt_i$, makes all these cubes equal to $1$. It does not change the squares or the commutation of distant generators. The Coxeter presentation of $S_m$ therefore gives a splitting of $hat(S)_m$. By injectivity of the connecting map, $beta = 0$.
  It remains to treat $m = 4$, where disjoint transpositions have no common fixed point. The only remaining Coxeter relation is commutation of lifts of $tau = \( 12 \)$ and $nu = \( 34 \)$. Fix the sign lift $z$ in the proof of Lemma 10, and use the cocycle $g mapsto d_g med mod med 2 M$ produced there. Choose representatives $b \( g \) in bb(F)_2^4$ of its values, with $b \( 1 \) = 0$. Its connecting factor set is given by
  $ epsilon.alt \( g \, h \) upright(bold(1)) = b \( g \) + g b \( h \) - b \( g h \) . $
  Since $tau nu = nu tau$, failure of their lifts to commute would give
  #[#set math.equation(numbering: n => "(2.6)")
   $ \( 1 + nu \) b \( tau \) + \( 1 + tau \) b \( nu \) = upright(bold(1)) . $ <eq:foundations-four-obstruction>]
  We now return to the original extension by the lattice $M$, not the central extension $hat(S)_4$. Its restriction to $chevron.l tau chevron.r$ splits by hypothesis. Replace the chosen lift of $tau$ by an involutive lift. This changes its translation parameter by twice an element of $M$, so the fixed cocycle modulo two is unchanged. By Lemma 10, the associated translation parameter $d in M$ satisfies $\( 1 + tau \) d = 0$, and its reduction represents $beta \( tau \)$. Choose an integral representative $tilde(d) in bb(Z)^4$. For some $a in bb(Z)$ we have
  $ tilde(d) + tau tilde(d) = a upright(bold(1)) \, #h(2em) 2 tilde(d)_3 = a = 2 tilde(d)_4 . $
  Hence $tilde(d)_3 = tilde(d)_4$. Every representative $b \( tau \)$ has equal third and fourth coordinates: adding a diagonal vector modulo two preserves that equality. The third and fourth coordinates of $\( 1 + nu \) b \( tau \)$ are therefore zero, while those of $\( 1 + tau \) b \( nu \)$ are zero because $tau$ fixes them. This contradicts Equation (2.6). The disjoint lifts commute after all, and the same Coxeter-generator adjustment splits $hat(S)_4$. Thus $beta = 0$ also for $m = 4$.
  In every degree $m gt.eq 3$, Lemma 10 now splits the original lattice extension. Lemma 9 gives $"Sha"_omega^2 \( k \, M \) = 0$ and the asserted Hasse principle and weak approximation. ◻
]

We have obtained two distinct kinds of control. The approximation procedure chooses a representative inside a fixed abstract coset while controlling its local centralizers. The norm-torus lemma then solves the simultaneous norm equations in those centralizers. The next section uses this combination to construct commuting rational elements with specified determinants.

== 3 Finite quotients of an odd-degree unitary group <sec:colors>

We now consider the first remaining family: special unitary groups defined by division algebras of odd reduced degree. The finite defect constructed in Proposition 5 is a quotient of a finite-index normal subgroup of the special unitary group. The purpose of this section is to use a nontrivial simple quotient of that defect to construct a homomorphism defined on the #emph[full] unitary group. The abelian and nonabelian alternatives will then be excluded separately.

Let $L \/ k$ be a quadratic extension of number fields, let $D$ be a central simple $L$-algebra of reduced degree $n$, and let $*$ be a unitary involution on $D$. Write

$ S = "SU" \( D \, * \) \, #h(2em) U = "U" \( D \, * \) \, #h(2em) L^1 = { a in L^times : a macron(a) = 1 } \, $

where the bar is the nontrivial automorphism of $L \/ k$. The determinant homomorphism on $U$ is the reduced norm:

$ det = "Nrd"_(D \/ L) : U \( k \) arrow.r L^1 \, #h(2em) S \( k \) = ker \( det \) . $

Fix $i in L^times$ with $macron(i) = - i$. On a dense open subset of the $k$-vector space of Hermitian elements, the Cayley map

#[#set math.equation(numbering: n => "(3.1)")
 $ x mapsto \( x + i \) \( x - i \)^(- 1) \, #h(2em) x = x^(*) \, $ <eq:colors-cayley>]

is a birational parametrization of $U$. In particular, $U \( k \)$ satisfies weak approximation: first perturb finitely many local targets into this open chart and then approximate their inverse Cayley coordinates.

We recall the relevant local descriptions of these groups [25,33,16]. At a nonsplit nonarchimedean place of $L \/ k$, the algebra $D$ splits. Indeed, the existence of the unitary involution makes its Brauer corestriction zero [16] Theorem 3.1(2), and corestriction for a local field extension preserves the local Brauer invariant. A Hermitian form of dimension at least three over a quadratic extension of nonarchimedean local fields is isotropic. Thus, when $n gt.eq 3$, the finite places where $S$ has rank zero are split places of $L \/ k$. At each such place $v$, choose one of the two components of $D ⊗_k k_v$ and denote it by $cal(D)_v$. It is a central division algebra of degree $n$ over $k_v$, the involution exchanges the two components, and

#[#set math.equation(numbering: n => "(3.2)")
 $ U \( k_v \) = cal(D)_v^times \, #h(2em) S \( k_v \) = "SL"_1 \( cal(D)_v \) . $ <eq:colors-anisotropic-factors>]

Under this identification, the local determinant is the reduced norm on $cal(D)_v$.

For the rest of this section assume that $D$ is a division algebra and that $n gt.eq 3$ is odd. Then $S$ is $k$-anisotropic. Let $A$ be its finite set of anisotropic nonarchimedean places and use the notation of Proposition 5:

#[#set math.equation(numbering: n => "(3.3)")
 $ R = S \( k \)^e \, #h(2em) P_0 = overline(delta \( R \)) subset S_A \, #h(2em) V_0 = delta^(- 1) \( P_0 \) \, #h(2em) V = V_0 \/ R \, $ <eq:colors-defect>]

where $e gt.eq 1$, $S_A = product_(v in A) S \( k_v \)$, and the power subgroup is abstract. Finally, put $A_0 = det U \( k \) subset L^1$. An empty product over $A$ is the trivial group throughout.

#thm([Proposition 3.1.])[
  (Finite quotient dichotomy).  #emph[Suppose that the finite group $V$ in Equation (3.3) is nontrivial. Then at least one of the following exists:]
  + #emph[a homomorphism $chi : U \( k \) arrow.r C$ to a finite abelian group such that $chi \( S \( k \) \) eq.not 1$;]
  + #emph[a homomorphism $phi.alt : U \( k \) arrow.r cal(F)$ to a finite nonabelian simple group such that 
$ phi.alt \( V_0 \) = cal(F) \, #h(2em) R subset ker phi.alt . $

]
] <prop:color-dichotomy>

The first step is an approximation statement that retains both commutativity and exact determinants. Its second part is also required to retain a specified coset modulo the abstract subgroup $R$.

=== 3.1 Commuting approximation <commuting-approximation>

#thm([Proposition 3.2.])[
  #emph[With the preceding notation, the following statements hold.]
  + #emph[Let $a \, b in A_0$. For every $v in A$, suppose that $x_v \, t_v in U \( k_v \)$ commute and have determinants $a_v \, b_v$. There exist commuting $x' \, t in U \( k \)$ with $det x' = a$ and $det t = b$ whose $A$-components approximate the prescribed pair arbitrarily closely.]
  + #emph[Let $gamma in V_0$ and $h in U \( k \)$. There exist commuting $x' \, t in U \( k \)$ with 
$ x' in gamma R \, #h(2em) det t = det h \, $

 and with $t_A$ arbitrarily close to $h_A$.]
] <prop:commuting-approximation>

#proof[
  For part (ii), set $a = 1$ and $b = det h$, so that $a \, b$ denote the two prescribed determinants in either part. We construct a regular first element $x'$ whose centralizer has enough local determinant norms everywhere. Lemma 11 will then produce the second element in that centralizer with its prescribed determinant and approximations.
  ===== 3.1.1 Local choices at the prescribed places. <local-choices-at-the-prescribed-places.>
  At $v in A$, a commuting pair in $cal(D)_v^times$ lies in a common maximal subfield. This is because the algebra it generates is a commutative domain in a division algebra, and hence a field, which can be extended to a maximal subfield. In the corresponding maximal torus of $U \( k_v \)$, perturb the first element within its fixed-determinant fiber until it is regular. Such regular elements are dense in that fiber: geometrically the fiber is a translate of
  $ { \( z_1 \, dots.h \, z_n \) in bb(G)_m^n : z_1 dots.h.c z_n = 1 } \, $
  and no equality $z_r = z_s$ holds identically on it. These fibers are smooth, so their nonempty Zariski opens are dense in the local topology. The conjugation map around a regular semisimple element is a local submersion. Consequently, sufficiently small changes of this first element have centralizer tori obtained by conjugation with elements arbitrarily close to $1$. Conjugating the second element with the same elements retains its determinant and its prescribed approximation.
  For part (ii), take the first local element sufficiently close to $1$ in a maximal torus containing $h_v$, and with determinant $1$. The choice near $1$ is compatible with the closure of $gamma R$ because $gamma in V_0$. The same regular perturbation applies. Hence in both parts we have nonempty open conditions for the first element such that its local centralizer admits the required second element.
  Enlarge the finite set of prescribed places to include all archimedean places, places of bad reduction or small residue characteristic, places ramified in $L \/ k$, and places where $a$ or $b$ is not a unit. At every additional place choose a maximal torus whose determinant image contains both required determinants. At nonsplit places the algebra splits, and a diagonal unitary torus has determinant image equal to the local norm-one group. At a split finite place outside $A$, write the chosen component of the algebra as $M_l \( Delta \)$. If $Delta$ is nontrivial, then $l gt.eq 2$: use an unramified maximal subfield of $Delta$ in one diagonal block and a totally ramified maximal subfield in another. Their product norm image contains all units and an element of valuation one, and is therefore all of $k_v^times$. Complete these two blocks to a maximal étale subalgebra. If $Delta = k_v$, the usual diagonal torus suffices. At split archimedean places the algebra is split because its degree is odd. In each case we may choose the first element regular with the specified determinant and then take a sufficiently small opening around it.
  We also prescribe finitely many auxiliary split places, outside all exceptions, at which the algebra splits and $a \, b$ are units. Choose unramified maximal tori having every possible permutation cycle type in $S_n$, one type at each such place. Norms from their unramified field factors cover the unit group. These conditions will force the joint Galois group needed by Lemma 11.
  In part (i), the determinant-$a$ slice is a rational translate of $S$ because $a in A_0$. Weak approximation for $S$, followed by Proposition 8 on that translate, permits all the local openings just chosen. In part (ii), apply that proposition in the coset $gamma R$. The openings near $1$ at $A$ are allowed by Equation (3.3) and the closure statement in Proposition 5; the other local openings are unrestricted. We now check the reduction and pole conditions required by Proposition 8.
  ===== 3.1.2 Integral reductions and single poles. <integral-reductions-and-single-poles.>
  At an integral reduction outside the prescribed set, exclude matrices whose characteristic polynomial has no simple root over an algebraic closure of the residue field. This exclusion has geometric codimension at least two in a fixed nonzero determinant slice of $"GL"_n$. Indeed, if every eigenvalue has multiplicity at least two, there are at most $floor.l n \/ 2 floor.r$ distinct eigenvalues. After fixing the determinant, they contribute at most $floor.l n \/ 2 floor.r - 1$ parameters. For each Jordan type with fixed eigenvalues, the orbit dimension is at most $n^2 - n$. Thus the excluded set has dimension at most
  $ n^2 - n + floor.l n \/ 2 floor.r - 1 lt.eq \( n^2 - 1 \) - 2 . $
  There are only finitely many Jordan types, so the same bound holds for their union and its closure. These conditions descend to the unitary determinant slice and spread out after finitely many model exceptions.
  A simple absolute residue root belongs to a residue-field irreducible factor of multiplicity one. Hensel lifting gives an unramified field factor of the algebra generated by the first element. We do not need the simple root itself to lie in the ground residue field.
  At a single pole in Proposition 8, the place splits in the fixed splitting field and the first element has the form
  $ x' = g_L thin "diag" \( t^(e d_1) \, dots.h \, t^(e d_n) \) thin g_R \, #h(2em) d_1 < dots.h.c < d_n \, $
  where $"ord"_v \( t \) > 0$ and the two side factors are integral and invertible. Require every principal minor on the first $j$ indices of $g_R g_L$ to be nonzero modulo the place, for $1 lt.eq j lt.eq n$. This is a nonempty open condition on each pole hyperplane: an undamaged basic parameter list in Proposition 8 is dominant, so its varying side factor can meet the finitely many principal-minor opens. If $c_j$ is the $j$th elementary characteristic coefficient, principal minor expansion gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ "ord"_v \( c_j \) = e \( d_1 + dots.h.c + d_j \) "ord"_v \( t \) . $ <eq:colors-pole-valuations>]
  The term from the first $j$ indices is the unique term of least valuation. The successive Newton slopes are strictly distinct and all segments have horizontal length one. The characteristic polynomial therefore splits into distinct linear factors over $k_v$.
  The additional denominator places in the approximation procedure admit the same determinant-compatible local tori described above. At the later finite model exceptions, integral unit parameters giving regular reduction provide the required openings. This checks all hypotheses of Proposition 8.
  ===== 3.1.3 The global centralizer and its norm torsor. <the-global-centralizer-and-its-norm-torsor.>
  Choose $x'$ by that proposition, also imposing global regularity. Since $D$ is division,
  $ E = L \( x' \) subset D $
  is a maximal field of degree $n$ over $L$. It is stable under $*$ because $\( x' \)^(*) = \( x' \)^(- 1)$. Put $F = { z in E : z^(*) = z }$, the fixed field. Then $E = L F$ and $\[ F : k \] = n$.
  Let $Gamma subset S_n times C_2$ be the Galois group of the normal closure of $F$ together with $L$, acting on the embeddings of $F$ and on $L$. At the auxiliary places split in $L$, the prescribed cycle types show that the kernel of $Gamma arrow.r C_2$ meets every conjugacy class of $S_n$. A proper subgroup of a finite group cannot have this property: the transitive action on its cosets would have a derangement, by averaging the number of fixed cosets, whereas every conjugacy class meeting the subgroup would rule out all derangements. Hence that kernel is $S_n times { 1 }$. The projection to $C_2$ is surjective, so
  $ Gamma = S_n times C_2 . $
  The unitary torus in the centralizer of $x'$ is
  $ T_E = "Res"_(F \/ k) #scale(x: 120%, y: 120%)[\(] "Res"_(E \/ F)^1 bb(G)_m #scale(x: 120%, y: 120%)[\)] \, $
  and its determinant is $N_(E \/ L) : T_E arrow.r "Res"_(L \/ k)^1 bb(G)_m$. At all prescribed places its image contains $b_v$ by construction. At every other integral place, take the full $*$-orbit of the unramified field factor of $E$ found above; all its fields are unramified over $k_v$ since $L \/ k$ is unramified here. Its fixed algebra is an unramified field factor $F_j \/ k_v$ of $F ⊗_k k_v$: it is the fixed field when the factor is stable, and the diagonal fixed algebra when two factors are exchanged. The corresponding $*$-stable algebra is $F_j ⊗_(k_v) \( L ⊗_k k_v \)$, possibly split, so no individual $E$-factor is required to be $*$-stable. Restrict the norm map to this factor. It is a surjective map of unramified tori with connected kernel. To check connectedness, over an algebraic closure the dual map sends a generator to a vector with entries $1$ or $- 1$; this vector is primitive. Lang’s theorem on the residue-field tori and smooth lifting show that the norm map is onto integral points. As $b_v$ is a unit, it is a local determinant norm. At a single pole the torus splits by Equation (3.4), and the same conclusion holds without an integrality restriction.
  Thus the fiber $N_(E \/ L)^(- 1) \( b \)$ has points everywhere locally. Its acting kernel is exactly the torus of Lemma 11, with the joint Galois group just verified. That lemma gives a rational point $t$ in the fiber approximating the chosen local second elements at $A$. It belongs to the centralizer of $x'$, so $x'$ and $t$ commute. The construction retained the required determinant and, in part (ii), the coset $gamma R$. This proves both assertions. ◻
]

=== 3.2 A simple quotient preserved by the full unitary group <a-simple-quotient-preserved-by-the-full-unitary-group>

The passage from class preservation to a quotient of the ambient group follows the inner-type argument of Rapinchuk–Potapchik [31] Corollary 2.3 and Theorem 2.4. Here Proposition 13 supplies the required unitary input. Conjugation by $U \( k \)$ preserves $R$, since $R$ is characteristic in $S \( k \)$. It also preserves $P_0$ and $V_0$ by passage to local closures. In fact the resulting action on $V$ preserves each conjugacy class. To see this, take $gamma in V_0$ and $h in U \( k \)$. By Proposition 13(ii), choose $x' in gamma R$ commuting with $t$, with $det t = det h$ and $t_A$ sufficiently close to $h_A$ that $t h^(- 1) in V_0$. In $V$, conjugation by $t$ fixes the image of $x'$, whereas $t h^(- 1)$ induces an inner automorphism. Conjugation by $h$ consequently carries $gamma R$ to a conjugate of itself.

If $V eq.not 1$, choose a maximal proper normal subgroup of $V$ and denote the resulting simple quotient by $B$. Its kernel is invariant under the $U \( k \)$ action because a normal subgroup is a union of conjugacy classes. The induced automorphisms of $B$ are class-preserving. If $B$ is nonabelian, the theorem of Feit and Seitz [10] Theorem C says that every such automorphism is inner. Since a nonabelian simple group has trivial center, the identification $"Inn" \( B \) = B$ gives

$ phi.alt : U \( k \) arrow.r B . $

Its restriction to $V_0$ is the quotient map to $B$, and $R$ acts trivially. This is alternative (ii) of Proposition 12.

It remains to treat the case that $B$ is cyclic of prime order. Let $R'$ be its kernel upstairs, so that

#[#set math.equation(numbering: n => "(3.5)")
 $ R subset R' subset V_0 \, #h(2em) B = V_0 \/ R' . $ <eq:colors-central-quotient>]

Class preservation on this abelian quotient means that the action is trivial. Thus $R'$ is normal in $U \( k \)$ and $B$ is central in $U \( k \) \/ R'$. The rest of the section uses a nonzero character of this central subgroup to construct a finite character of $U \( k \)$ that is nonzero on $S \( k \)$.

=== 3.3 Local abelianization and the metaplectic input <local-abelianization-and-the-metaplectic-input>

We need two local facts: the continuous characters of the compact groups $S \( k_v \)$, and a splitting theorem for their finite product. The first fact also identifies the closed subgroup generated by commutators of the full local multiplicative group.

#thm([Lemma 3.3.])[
  #emph[Let $F_v$ be a nonarchimedean local field of characteristic zero, with residue field $bb(F)_q$, and let $cal(D)$ be a central division algebra over $F_v$ of odd degree $n gt.eq 3$. Put $S_v = "SL"_1 \( cal(D) \)$. Reduction induces an isomorphism 
$ S_v \/ overline(\[ S_v \, S_v \]) tilde.eq T_v := ker #scale(x: 120%, y: 120%)[\(] N_(bb(F)_(q^n) \/ bb(F)_q) : bb(F)_(q^n)^times arrow.r bb(F)_q^times #scale(x: 120%, y: 120%)[\)] . $

 Moreover, 
$ overline(\[ cal(D)^times \, cal(D)^times \]) = S_v . $

 If an element of $cal(D)^times$ has reduced-norm valuation $r$, its action on $T_v$ is $sigma^r$, where $sigma : z mapsto z^(q^h)$ for some $h$ relatively prime to $n$.]
] <lem:colors-local-abelianization>

#proof[
  Use the cyclic description of a division algebra over a local field [33]. There is an unramified maximal subfield $E_v \/ F_v$ and a prime element $Pi$ such that conjugation by $Pi$ induces a generator $sigma$ of $"Gal" \( E_v \/ F_v \)$. The residue algebra is $bb(F)_(q^n)$ and $sigma$ acts there by $q^h$ with $\( h \, n \) = 1$. Normalize valuations so that $"ord"_v \( "Nrd" Pi \) = 1$. Every element of $S_v$ is integral and its residue lies in $T_v$. The Teichmüller representatives in $E_v$ lift $T_v$ to a subgroup of $S_v$, so reduction onto $T_v$ is surjective.
  Let $frak(P) = \( Pi \)$ be the maximal ideal of the maximal order of $cal(D)$, and set
  $ S_r = S_v ∩ \( 1 + frak(P)^r \) \, #h(2em) r gt.eq 1 . $
  In leading-coefficient coordinates, the quotients of this filtration are
  #[#set math.equation(numbering: n => "(3.6)")
   $ S_r \/ S_(r + 1) tilde.eq cases(delim: "{", \( bb(F)_(q^n) \, + \) \, & n divides.not r \,, ker "Tr"_(bb(F)_(q^n) \/ bb(F)_q) \, & n divides r .) $ <eq:colors-filtration>]
  For completeness, the norm filtration is
  $ "Nrd" \( 1 + frak(P)^r \) = 1 + frak(p)^(ceil.l r \/ n ceil.r) . $
  The inclusion follows from the valuations of the characteristic coefficients; the reverse inclusion follows already from norms of principal units in the unramified maximal subfield. If $n divides.not r$, the norm images for $r$ and $r + 1$ agree, so any leading coefficient can be corrected at the next level to have norm one. If $n divides r$, the first norm coefficient is the residue trace, and the next-level norm image gives exactly the trace-zero restriction in Equation (3.6). The finite-field trace is onto also when the residue characteristic divides $n$.
  For $n divides.not r$, commute an element at level $r$ with a Teichmüller element of $T_v$ not fixed by $sigma^r$. Such an element exists: $T_v$ is cyclic of order $\( q^n - 1 \) \/ \( q - 1 \)$ and is not contained in the multiplicative group of a proper subfield. On the leading coefficient this commutator is multiplication by a nonzero residue scalar. Thus commutators fill $S_r \/ S_(r + 1)$ in this case.
  For $n divides r$, use brackets between levels $1$ and $r - 1$. Both levels have unrestricted leading coefficients because $n gt.eq 3$. Taking the coefficient $1$ in degree $1$ makes the bracket coefficients contain
  $ \( sigma - 1 \) bb(F)_(q^n) = ker "Tr"_(bb(F)_(q^n) \/ bb(F)_q) . $
  Hence commutators again fill the quotient. Successive approximation now puts all of $S_1$ in $overline(\[ S_v \, S_v \])$. The reverse inclusion holds because the residue quotient $T_v$ is abelian. This proves the first assertion.
  Finally, commutators of $Pi$ with unramified units have residues $sigma \( z \) \/ z$, which fill $T_v$ by finite-field Hilbert 90. Together with the already obtained subgroup $S_1$, they generate a dense subgroup of $S_v$. Every commutator in $cal(D)^times$ has reduced norm one, proving the second assertion. A local unit acts trivially on the commutative residue field, while $Pi$ acts by $sigma$. Writing an arbitrary element as a unit times $Pi^r$ gives the last statement. ◻
]

Here is the precise metaplectic consequence we use. Let $I = bb(R) \/ bb(Z)$, written additively. If $G$ is a simply connected absolutely almost simple group over a number field, not of type $A_1$, and $A'$ is a finite set of nonarchimedean places where $G$ is anisotropic, then the restriction map

#[#set math.equation(numbering: n => "(3.7)")
 $ H_(upright(m))^2 #h(-0.16667em) (product_(v in A') G \( k_v \) \, I) arrow.r H^2 #scale(x: 120%, y: 120%)[\(] G \( k \) \, I #scale(x: 120%, y: 120%)[\)] quad upright("is injective") . $ <eq:colors-metaplectic>]

This is the specialization $V_2 = diameter$ of [26] Proposition 2.6, p. 114. If $A'$ is nonempty, the local classification forces the absolute type to be $A$, so the type-$D$ exclusion inherited from Proposition 2.4 there is harmless. If $A'$ is empty, the source is $H_(upright(m))^2 \( 1 \, I \) = 0$. The source uses measurable cohomology for locally compact groups and abstract cohomology on the rational group. In degree two these classify, respectively, topological central circle extensions with Borel sections and abstract central extensions; see [27] Section 3.2. Thus a topological central circle extension of the displayed finite local product that splits over the abstract rational group has a continuous homomorphic section. Indeed, the zero measurable class gives a Borel homomorphic section, and Borel homomorphisms between these locally compact second-countable groups are continuous.

We apply only Equation (3.7) with $G = S$ and $A' = A$. Here $n gt.eq 3$ excludes type $A_1$, and every support place is nonarchimedean and anisotropic. In particular, this invocation involves neither a comparison with real-place metaplectic kernels nor an identification of a congruence kernel requiring the normal-subgroup assertion we are proving.

=== 3.4 A circle extension of the full local determinant group <a-circle-extension-of-the-full-local-determinant-group>

Give $A_0$ the discrete topology and define

#[#set math.equation(numbering: n => "(3.8)")
 $ Q = { \( y \, a \) in U_A times A_0 : det y = a_A } \, #h(2em) U_A = product_(v in A) U \( k_v \) . $ <eq:colors-Q>]

Its determinant kernel is $S_A$. The group $Q$ is locally compact and second countable: each of its countably many determinant fibers is a translate of the compact group $S_A$. There is a natural homomorphism

$ rho : U \( k \) arrow.r Q \, #h(2em) u mapsto \( u_A \, det u \) . $

The subgroup $P_0 subset S_A$ is open and normal in $Q$. Normality follows first under the dense group $rho \( U \( k \) \)$ and then under $Q$. In fact $rho \( U \( k \) \)$ is dense in every determinant fiber by weak approximation for $S$. The same argument, applied modulo the open subgroup $P_0$, gives an isomorphism of discrete groups

#[#set math.equation(numbering: n => "(3.9)")
 $ Q \/ P_0 tilde.eq U \( k \) \/ V_0 . $ <eq:colors-discrete-quotient>]

The central quotient in Equation (3.5) provides the discrete central extension

$ 1 arrow.r B arrow.r U \( k \) \/ R' arrow.r U \( k \) \/ V_0 arrow.r 1 . $

Pull it back along Equation (3.9) and push it out by an injective character $iota : B arrow.r.hook I$. We obtain a locally compact second-countable central extension

#[#set math.equation(numbering: n => "(3.10)")
 $ 1 arrow.r I arrow.r tilde(Q) arrow.r^p Q arrow.r 1 . $ <eq:colors-circle-extension>]

The pullback description gives continuous local sections, and it also gives a specified abstract lift

$ ell : U \( k \) arrow.r tilde(Q) \, #h(2em) p compose ell = rho . $

Over $P_0$ there is a canonical continuous homomorphic section $c : P_0 arrow.r tilde(Q)$, obtained by taking the identity element in the discrete quotient $U \( k \) \/ R'$. For $u in V_0$, these descriptions give

#[#set math.equation(numbering: n => "(3.11)")
 $ ell \( u \) = c \( u_A \) thin iota \( u R' \) \, $ <eq:colors-canonical-lift>]

where the last factor denotes the central element of $tilde(Q)$ corresponding to $iota \( u R' \) in I$.

#thm([Lemma 3.4.])[
  #emph[If two elements of $Q$ commute, any lifts of them to $tilde(Q)$ commute.]
] <lem:colors-commuting-lifts>

#proof[
  The two determinant coordinates are elements $a \, b in A_0$. By Proposition 13(i), their local components are limits of commuting rational pairs with these exact determinants. The specified lifts under $ell$ of each rational pair commute. For a commuting pair in the base of a central extension, the commutator of lifts is independent of the choices of lifts. Use the continuous local sections of Equation (3.10) to pass these commutators to the limit. Their limit is $1$, as required. ◻
]

Restriction of Equation (3.10) to $S_A$ splits abstractly over $S \( k \)$ by $ell$. Equation (3.7) therefore gives a continuous homomorphic section

$ j : S_A arrow.r tilde(Q) . $

Our remaining task is to modify $j$ so that this splitting extends from $S_A$ to all of $Q$. We first make $j \( S_A \)$ normal and then eliminate the commutator pairing on the determinant quotient $A_0$.

=== 3.5 Making the splitting equivariant <making-the-splitting-equivariant>

For $q in Q$, choose a lift $tilde(q)$ and define the discrepancy character $d_q : S_A arrow.r I$ by

#[#set math.equation(numbering: n => "(3.12)")
 $ tilde(q) thin j \( s \) thin tilde(q)^(- 1) = j \( q s q^(- 1) \) thin d_q \( s \) . $ <eq:colors-discrepancy>]

We again regard values in $I$ as central factors. This is a continuous character of $s$, independent of the lift of $q$. It is zero for $q in S_A$, since there a lift differs from $j \( q \)$ by a central element. Composition of conjugations shows that the $d_q$ form a cocycle for the conjugation action. More explicitly,

$ d_(q_1 q_2) \( s \) = d_(q_1) \( q_2 s q_2^(- 1) \) + d_(q_2) \( s \) . $

The cocycle and its action factor through $Q \/ S_A = A_0$.

By Lemma 14, its coefficient group is the finite group

$ "Hom"_(upright("cont")) \( S_A \, I \) = product_(v in A) "Hom" \( T_v \, I \) . $

On the $v$-component the action of $a in A_0$ is the power of $sigma_v$ specified by $"ord"_v \( a_v \)$. The corresponding component of the discrepancy is zero whenever $"ord"_v \( a_v \) = 0$. Indeed, choose a representative of $a$ in $Q$ whose $v$-component is an unramified unit of reduced norm $a_v$. Such a unit exists by surjectivity of unramified norms on units. It commutes with every Teichmüller lift of $T_v$, viewed as an element of $S_A$ supported at $v$. Lemma 15 then makes Equation (3.12) zero on these lifts, which determine the character.

It follows that both this component of the cocycle and its action factor through the single valuation map $A_0 arrow.r bb(Z)$. This map is onto: weak approximation in $U \( k \)$ allows its $v$-component to be close to a local element of reduced-norm valuation one. Let $d_v$ be the discrepancy for such a generator. It vanishes on $T_v^(sigma_v)$. Indeed, the Teichmüller lifts of these fixed residue elements are central in $cal(D)_v^times$, so the same commuting-lifts test applies for any representative of the generator.

For a finite abelian group $T$ with automorphism $sigma$, the image of

$ sigma^(*) - 1 : "Hom" \( T \, I \) arrow.r "Hom" \( T \, I \) $

is exactly the characters annihilating $T^sigma$. This follows by duality from the exact sequence for $sigma - 1$ on $T$, or directly by extending a character from its image to $I$. Consequently $d_v$ is a coboundary. Choose a correcting character in each component and replace $j \( s \)$ by $j \( s \) lambda \( s \)$ for the resulting continuous character $lambda : S_A arrow.r I$. Equation (3.12) then has zero discrepancy for every $q$. Thus we may, and do, assume that

#[#set math.equation(numbering: n => "(3.13)")
 $ tilde(q) thin j \( s \) thin tilde(q)^(- 1) = j \( q s q^(- 1) \) quad \( q in Q \, med s in S_A \) \, $ <eq:colors-equivariant-section>]

so that $j \( S_A \)$ is normal in $tilde(Q)$.

=== 3.6 Removing the determinant commutator pairing <removing-the-determinant-commutator-pairing>

The quotient by this normal subgroup is a central extension

#[#set math.equation(numbering: n => "(3.14)")
 $ 1 arrow.r I arrow.r tilde(Q) \/ j \( S_A \) arrow.r A_0 arrow.r 1 . $ <eq:colors-determinant-extension>]

Since $A_0$ is abelian, commutators in this extension give an alternating biadditive pairing, written multiplicatively in its arguments,

$ omega : A_0 times A_0 arrow.r I . $

By Lemma 15, $omega \( a \, b \) = 0$ whenever, at every $v in A$, the two determinants $a_v \, b_v$ are norms of elements of one common commutative subfield of $cal(D)_v$.

In particular, if every $a_v$ is an $n$th power, represent it by a central scalar at each place; it commutes with any representative of $b_v$. Thus $omega$ factors through the finite group

#[#set math.equation(numbering: n => "(3.15)")
 $ K_A = product_(v in A) k_v^times \/ \( k_v^times \)^n . $ <eq:colors-power-quotient>]

The map $A_0 arrow.r K_A$ is onto. Local reduced norms are surjective, and weak approximation in $U \( k \)$ realizes any prescribed classes because the local power subgroups are open. Mixed terms between two distinct factors of Equation (3.15) vanish: use central representatives for each locally trivial power class. We may therefore treat the pairing one place at a time.

Fix $v$, suppress it from the notation, and let $pi$ be a uniformizer. Unit-unit terms vanish because units are norms from the unramified maximal subfield. Alternation kills uniformizer-uniformizer terms, so the local pairing is specified by the character

$ u mapsto omega_v \( pi \, u \) \, #h(2em) u in cal(O)_v^times . $

This character vanishes on $1 + frak(p)_v$. To prove it first take $c in k_v$ of valuation one. The Eisenstein extension defined by $theta^n = c$ has degree $n$, is totally ramified, and embeds in $cal(D)_v$ by the local invariant criterion. Since $n$ is odd,

$ N \( theta \) = c \, #h(2em) N \( 1 + theta \) = 1 + c . $

The common-subfield test gives $omega_v \( c \, 1 + c \) = 0$; writing $c$ as a uniformizer times a unit and using unit-unit vanishing gives $omega_v \( pi \, 1 + c \) = 0$. If $"ord"_v \( d \) gt.eq 2$, choose any such $c$ and write

$ 1 + d = frac(\( 1 + c \) \( 1 + d \), 1 + c) . $

Both numerator and denominator have the form $1 + c'$ with $"ord"_v \( c' \) = 1$. This proves vanishing on all principal units. The remaining parameter is therefore a character of $bb(F)_q^times$ killed by $n$.

We still have freedom to change $j$ by characters of $S_A$ invariant under $Q$. At the fixed place these are the $sigma$-invariant characters of $T_v$. Such a change preserves Equation (3.13). Its effect on the pairing is evaluation, up to the fixed sign convention for commutators, on the residue of the ordinary local commutator of determinant representatives. For a prime element $Pi$ and an unramified unit with residue $r$, that residue is

$ frac(sigma \( r \), r) . $

The residue norm of $r$ is the residue of the unit determinant $u$. Replacing $r$ by another norm preimage changes this expression by an element of $\( sigma - 1 \) T_v$. Hence we have a well-defined map

#[#set math.equation(numbering: n => "(3.16)")
 $ bb(F)_q^times arrow.r T_v \/ \( sigma - 1 \) T_v \, #h(2em) N \( r \) mapsto sigma \( r \) \/ r . $ <eq:colors-residue-commutator>]

This map is onto. To see this explicitly, put

$ M = frac(q^n - 1, q - 1) \, #h(2em) d = gcd \( q - 1 \, n \) \, $

and choose a generator $g$ of $bb(F)_(q^n)^times$. The group $T_v$ is generated by $g^(q - 1)$. Since $\( h \, n \) = 1$,

$ \| T_v \/ \( sigma - 1 \) T_v \| = gcd \( M \, q^h - 1 \) = gcd \( M \, q - 1 \) = d . $

The image of the generator $g^M$ of $bb(F)_q^times$ in Equation (3.16) is represented, in the generator $g^(q - 1)$, by the exponent

$ frac(q^h - 1, q - 1) equiv h med \( mod med d \) . $

It is a generator because $\( h \, d \) = 1$. Dualizing this surjection shows that invariant characters of $T_v$ produce exactly all residue unit characters killed by $n$. They can therefore cancel the remaining parameter $u mapsto omega_v \( pi \, u \)$. A unit adjustment between $"Nrd" \( Pi \)$ and the chosen $pi$ makes no difference, since unit-unit terms already vanish.

Perform this adjustment at every place of $A$. The new section still has normal image, and the commuting-lifts test still holds; in particular, all the preceding reductions of the pairing remain valid. Its only possible parameters have now been cancelled, so $omega = 0$. The extension in Equation (3.14) is therefore abelian. The circle group is divisible and hence injective as an abelian group, so this extension splits. A homomorphism from the discrete group $A_0$ is automatically continuous.

Let $C_0$ be the inverse image in $tilde(Q)$ of the image of such a section of Equation (3.14). Then $C_0 ∩ I = 1$ and $p \( C_0 \) = Q$: for any lift of an element of $Q$, its central coordinate in the quotient can be removed using $I$. Consequently $p : C_0 arrow.r Q$ is a group isomorphism. Locally on each determinant fiber its inverse is a translate of $j$, so the inverse is continuous. We have proved that Equation (3.10) has a continuous homomorphic section

#[#set math.equation(numbering: n => "(3.17)")
 $ s : Q arrow.r tilde(Q) . $ <eq:colors-global-section>]

=== 3.7 Extracting a nonzero finite character <extracting-a-nonzero-finite-character>

Compare the continuous section in Equation (3.17) with the specified abstract lift of rational points. Their difference is a character

#[#set math.equation(numbering: n => "(3.18)")
 $ chi_0 : U \( k \) arrow.r I \, #h(2em) ell \( u \) = s \( rho \( u \) \) thin chi_0 \( u \) . $ <eq:colors-difference-character>]

It has finite image on $S \( k \)$. Indeed, for $u in R'$ the canonical formula in Equation (3.11) reads $ell \( u \) = c \( u_A \)$. The difference of $c$ and $s \|_(P_0)$ is a continuous character of the profinite group $P_0$. Its image in the circle is finite: a quotient of a profinite group is profinite, whereas a closed subgroup of the circle is either finite or the whole circle. Thus $chi_0 \( R' \)$ is finite. Since $R'$ has finite index in $S \( k \)$, the image $chi_0 \( S \( k \) \)$ is a finite union of cosets of that finite subgroup and is finite.

It is also nonzero. Choose $beta eq.not 1$ in $B$ and $u in V_0$ representing it. Because $R$ is dense in $P_0$ and $u_A in P_0$, there is a sequence $r_j in R$ such that

$ \( u r_j \)_A arrow.r 1 . $

All $u r_j$ still represent $beta$ modulo $R'$. If $chi_0$ vanished on $S \( k \)$, Equations (3.11) and (3.18) would give

$ c \( \( u r_j \)_A \) thin iota \( beta \) = s \( rho \( u r_j \) \) . $

Both continuous sections tend to the identity, which would imply $iota \( beta \) = 0$, contrary to injectivity of $iota$.

Finally we make the character finite on all of $U \( k \)$ without changing its restriction to $S \( k \)$. The multiplicative group of a number field is free abelian modulo its finite roots of unity: use the ideal map and the finite generation of the unit group. Therefore its subgroup $A_0$ has the form

$ A_0 = T xor xor.big_(j in J) bb(Z) a_j \, $

where $T$ is finite and $J$ may be infinite. Choose $u_j in U \( k \)$ with $det u_j = a_j$, and choose a character $psi : A_0 arrow.r I$ satisfying $psi \( a_j \) = chi_0 \( u_j \)$ and $psi \|_T = 0$. Then

$ chi = chi_0 - psi compose det $

vanishes on all the chosen $u_j$ and equals $chi_0$ on $S \( k \)$. If $m$ kills the finite group $chi_0 \( S \( k \) \)$ and $t$ kills $T$, then $m t$ kills $chi \( U \( k \) \)$: remove the free determinant part using the $u_j$, and the $t$th power of the remaining element lies in $S \( k \)$. The subgroup of the circle killed by $m t$ is finite. Thus $chi$ is a finite character and remains nonzero on $S \( k \)$.

When $A = diameter$, the same construction has $Q = A_0$ and trivial $S_A$. Commuting approximation makes the circle extension abelian immediately, and all subsequent arguments apply unchanged. We have proved alternative (i) in the remaining case, completing the proof of Proposition 12.

The finite defect can therefore be nontrivial only if the full unitary group admits one of the two homomorphisms in that proposition. The character argument in Section 4 and the color argument in Sections 5–6 exclude these alternatives, retaining the division and odd-degree hypotheses fixed here.

== 4 Excluding finite abelian characters <sec:characters>

Throughout this section, $L \/ k$ is quadratic, $D$ is a central division algebra over $L$ of odd degree $n gt.eq 3$, and $*$ is a unitary involution. We retain $U = "U" \( D \, * \)$ and $S = "SU" \( D \, * \)$ from Section 3. Our aim is the following assertion, which eliminates the abelian alternative of Proposition 12.

#thm([Theorem 4.1.])[
  #emph[Every homomorphism from $U \( k \)$ to a finite abelian group is trivial on $S \( k \)$.]
] <thm:no-characters>

Fix such a homomorphism $chi : U \( k \) arrow.r B$, and write $B$ additively. The proof first converts $chi$ into a difference function on $D$. Exact elementary transformations make this difference independent of its arguments. A real-signature argument then converts that algebraic identity into continuity on $S \( k \)$, after which local commutators finish the proof. No continuity of $chi$ is assumed.

=== 4.1 A noncommutative difference identity <a-noncommutative-difference-identity>

Let $cal(D)$ be the set of nonzero $b in D$ for which $b + b^(*) = a^(*) a$ for some $a in D$. Define

#[#set math.equation(numbering: n => "(4.1)")
 $ m_b = 1 - a b^(- 1) a^(*) \, #h(2em) f \( b \) = chi \( m_b \) . $ <eq:chars-f>]

These definitions also allow $a = 0$, in which case $b$ is skew and $m_b = 1$. Multiplication using $a^(*) a = b + b^(*)$ gives $m_b m_b^(*) = 1$. If $a' zws^(*) a' = a^(*) a eq.not 0$, then $a' = v a$ with $v in U \( k \)$, and the two resulting elements $m_b$ are conjugate by $v$. Thus $f$ is well-defined. Moreover,

#[#set math.equation(numbering: n => "(4.2)")
 $ f \( x^(*) b x \) = f \( b \) #h(2em) \( x in D^times \) \, $ <eq:chars-congruence>]

because $a x$ can be used in the definition on the left.

For the moment fix $d in D^times$ such that the reduced spectra of $d$ and $d^(*)$ are disjoint. For $\( a \, c \) in D^2 \\ { \( 0 \, 0 \) }$, there is a unique $e in D$ satisfying

#[#set math.equation(numbering: n => "(4.3)")
 $ e + e^(*) = c^(*) c \, #h(2em) e d + d^(*) e^(*) = a^(*) a . $ <eq:chars-sylvester>]

Indeed the equation

$ e d - d^(*) e = a^(*) a - d^(*) c^(*) c $

has a unique solution: after splitting the algebra its linear part is the Sylvester operator, whose eigenvalues are the differences of the two disjoint spectra. Taking adjoints shows that $c^(*) c - e^(*)$ is another solution of this same equation, giving the first identity in Equation (4.3) and then the second. The solution is nonzero, for $e = 0$ would imply $a = c = 0$. Consequently

$ F_d \( a \, c \) = f \( e d \) - f \( e \) $

is defined on all nonzero pairs.

#thm([Lemma 4.2.])[
  #emph[The function $F_d$ is invariant under independent left multiplications of its two arguments by elements of $U \( k \)$, and under 
#[#set math.equation(numbering: n => "(4.4)")
 $ \( a \, c \) mapsto \( a - c d \, a - c \) . $ <eq:chars-pair-move>]

]
] <lem:chars-pair-invariance>

#proof[
  The independent unitary multiplications leave Equation (4.3) unchanged. For the second assertion put $b = e d$ and $z = b^(*) + e - a^(*) c$. Expansion, with the order of all factors unchanged, gives
  $ z + z^(*) = \( a - c \)^(*) \( a - c \) \, #h(2em) z d + d^(*) z^(*) = \( a - c d \)^(*) \( a - c d \) . $
  The transformation in Equation (4.4) is invertible: its kernel would give $a = c$ and $c \( 1 - d \) = 0$, whereas $d eq.not 1$ by spectral disjointness. In particular $z eq.not 0$.
  Set $A' = c e^(- 1) - a b^(- 1)$ and $q = b^(- *) z e^(- 1)$, where $b^(- *) = \( b^(*) \)^(- 1)$. A direct expansion gives $A' zws^(*) A' = q + q^(*)$. Also
  $ q = \( b^(- 1) \)^(*) \( z d \) b^(- 1) \, $
  so Equation (4.2) identifies $f \( q \)$ with $f \( z d \)$. For clarity, the multiplicative identity needed here is
  #[#set math.equation(numbering: n => "(4.5)")
   $ 1 - \( A' e \) z^(- 1) \( b^(*) A' zws^(*) \) = m_b m_z m_e^(*) \, $ <eq:chars-three-unitaries>]
  where the defining vectors for $m_b \, m_z \, m_e$ are respectively $a \, c - a \, c$. It follows from the two identities
  $ A' e & = - a b^(- 1) z + m_b \( c - a \) \,\
b^(*) A' zws^(*) & = z e^(- *) c^(*) + \( c - a \)^(*) m_e^(*) . $
  To check the remaining terms after multiplying these identities, use $m_b a = - a b^(- 1) b^(*)$ and $c^(*) c = e + e^(*)$. The part of the left side of Equation (4.5) not containing $- \( m_b \( c - a \) \) z^(- 1) \( \( c - a \)^(*) m_e^(*) \)$ is then $m_b m_e^(*)$. The left side of Equation (4.5) is precisely the unitary element defining $f \( q \)$, because $q^(- 1) = e z^(- 1) b^(*)$. Applying $chi$ proves
  $ f \( z d \) = f \( b \) + f \( z \) - f \( e \) \, $
  which is the required invariance. These computations take place in $D$; no commutativity of their entries is used. ◻
]

=== 4.2 Producing exact elementary transformations <producing-exact-elementary-transformations>

Suppose now that $d$ lies in a $*$-stable maximal subfield $E subset D$ which is Galois over $L$. Write $macron(z) = z^(*)$ for $z in E$, and suppose that the $n$ conjugates $t_1 \, dots.h \, t_n$ of $d$ are distinct and disjoint from $macron(t)_1 \, dots.h \, macron(t)_n$. Skolem–Noether gives a decomposition

$ D = xor.big_(j = 1)^n E w_j \, #h(2em) w_j d = t_j w_j . $

Let $E^1 = { z in E^times : z macron(z) = 1 }$. The pair move in Equation (4.4) and independent left multiplications by elements of $E^1$ preserve the $n$ two-dimensional $E$-blocks in $D xor D$.

In the invariance group take the subgroup $H$ generated by diagonal $E^1$-multiplications on either coordinate and by the simultaneous matrices

#[#set math.equation(numbering: n => "(4.6)")
 $ B_h \( t_j \) = mat(delim: "(", 1, t_j macron(h); h, 1) #h(2em) \( h in E^1 \) . $ <eq:chars-boosts>]

Indeed changing the sign of the second output in Equation (4.4) gives $B_(- 1)$, and conjugating by diagonal phases gives all $B_h$. Each determinant is $1 - t_j eq.not 0$.

#thm([Lemma 4.3.])[
  #emph[For each block $i$, $H$ contains a nonidentity upper elementary unipotent supported only on block $i$, and a nonidentity lower elementary unipotent supported only on block $i$.]
] <lem:chars-pure-shears>

#proof[
  We first separate one block from the others. On a block with parameter $t$, the product $B_h \( t \) B_(h z) \( t \)$ sends the first coordinate axis to the line of slope
  $ h frac(1 + z, 1 + t z) #h(2em) \( z \, h in E^1 \) . $
  At $t = t_j$ the norm of the slope with $h = 1$ is
  #[#set math.equation(numbering: n => "(4.7)")
   $ ell_j \( z \) = frac(\( 1 + z \)^2, \( 1 + t_j z \) \( z + macron(t)_j \)) . $ <eq:chars-slope-norm>]
  This is a degree-two rational function. Apart from finitely many $z$, the other solution $z'$ of $ell_j \( z' \) = ell_j \( z \)$ is distinct from $z$ and lies in $E$. Explicitly, with $a = t_j$ and $b = macron(t)_j$,
  $ z' = frac(\( a - b \) z + 1 + a b - 2 b, \( 1 + a b - 2 a \) z + b - a) . $
  It belongs to $E^1$: conjugate reciprocation preserves the two roots and fixes the first, so fixes the second. If $s_t \( z \) = \( 1 + z \) \/ \( 1 + t z \)$, choose $h' = s_(t_j) \( z \) \/ s_(t_j) \( z' \) in E^1$. Then
  $ g_j \( t \) = #scale(x: 120%, y: 120%)[\(] B_(h') \( t \) B_(h' z') \( t \) #scale(x: 120%, y: 120%)[\)]^(- 1) B_1 \( t \) B_z \( t \) $
  has lower-left entry zero at $t_j$.
  The lower-left numerator of $g_j \( t \)$ is
  $ \( 1 + t z' \) \( 1 + z \) - h' \( 1 + z' \) \( 1 + t z \) . $
  This is a nonzero linear polynomial in $t$: the corresponding two fractional slope functions have distinct poles and nonzero numerators. Its unique root is $t_j$. Thus the lower-left entry of $g_j \( t \)$ is nonzero at every other $t_ell$ and at every $macron(t)_ell$. Matrices of the form
  $ mat(delim: "(", alpha \( t \), t overline(beta) \( t \); beta \( t \), overline(alpha) \( t \)) \, $
  where the bar acts on coefficients and fixes the indeterminate $t$, are closed under multiplication and inversion. The boosts have this form. Consequently the upper-right entry of $g_j \( t \)$ vanishes exactly when its lower-left entry vanishes at $macron(t)$. It is therefore nonzero at all $t_ell$, including $t_j$.
  We may also arrange that all diagonal entries at every $t_ell$ are nonzero. Here is a check that the excluded conditions are proper. At $z = - 1$, Equation (4.7) has a double zero and its degree-two interchange sends $z$ to $z'$ with derivative $- 1$. Thus $h' arrow.r - 1$ as $z arrow.r - 1$, and both boost products tend to $\( 1 - t \) I$. Hence $g_j \( t \) arrow.r I$. These are algebraic limits on the norm-one parameter curve over the fixed field of bar; its rational points $E^1$ are infinite, by Hilbert 90, so avoid the finitely many proper exceptional conditions. We have obtained a triangular, nondiagonal matrix at $j$, and matrices with all four entries nonzero at the other blocks. Repeating the construction with $macron(t)_j$ in place of $t_j$ gives a lower triangular, nondiagonal matrix at $j$.
  Fix a block $i$. For each $j eq.not i$, let $H^(\( j \))$ be the subgroup generated by $g_j$ and the diagonal phases. Its projection at $j$ is upper triangular. Its projection at $i$ is projectively Zariski dense in $"PGL"_2$ over an algebraic closure of $E$: it contains a Zariski-dense subgroup of the diagonal torus and a matrix with all entries nonzero. A proper algebraic subgroup containing the diagonal torus lies in a Borel subgroup or its torus normalizer, neither of which contains that matrix. Since the second derived group of a triangular group is trivial, $\( H^(\( j \)) \)''$ acts trivially at $j$, but remains projectively Zariski dense at $i$. The latter assertion follows by taking the Zariski closures of commutators in the perfect algebraic group $"PGL"_2$.
  Importantly, use the #emph[full] kernels
  $ K_j = ker #scale(x: 120%, y: 120%)[\(] H arrow.r "GL"_2 \( E \) upright(" on block ") j #scale(x: 120%, y: 120%)[\)] . $
  Each $K_j$ is normal in $H$ and contains $\( H^(\( j \)) \)''$, so its image at $i$ is projectively dense. A commutator of two such kernels is trivial on the union of their excluded blocks and remains projectively dense at $i$: the commutators of two dense images are dense in the derived algebraic group $"PGL"_2$. Iterating gives a projectively dense image at $i$ of
  $ K_(eq.not i) = ⋂_(j eq.not i) K_j . $
  Write $H_i$ for the projection of $H$ at $i$, and $P_i$ for the image of $K_(eq.not i)$ there. We have proved that $P_i lt.closed H_i$ and that $P_i$ is projectively Zariski dense.
  We next pass from this density to actual unipotents. Commuting the upper and lower triangular, nondiagonal elements already constructed with diagonal phases shows that $H_i$ contains upper and lower elementary unipotents with some nonzero coefficients. Phase conjugation and addition show that their coefficients contain scalar multiples of the additive group $bb(Z) E^1$. Its rational span is all of $E$. Indeed that span is a finite-dimensional subring of a field, hence a field; the Cayley ratios $\( 1 + x \) \/ \( 1 - x \)$ for $macron(x) = - x$ show that it contains the whole skew subspace, which generates $E$. It follows that the allowable coefficients for both upper and lower unipotents contain a common nonzero integral ideal $I subset cal(O)_E$.
  Choose $p in P_i$ with $p oo = r eq.not oo$ on $bb(P)^1 \( E \)$. Choose an infinite-order unit $u in cal(O)_E^times$ sufficiently close to $1$ modulo an integral ideal that
  $ u = 1 + s t quad \( s \, t in I \) \, #h(2em) \( 1 - u^2 \) r in I . $
  Such units exist by the unit theorem: $\[ E : bb(Q) \] gt.eq 6$, and a congruence subgroup of the unit group has finite index. More explicitly, fix $0 eq.not s in I$, require $u - 1 in s I$, and impose the additional congruence clearing the denominator of $r$. With $U \( x \) = mat(delim: "(", 1, x; 0, 1)$ and $L \( x \) = mat(delim: "(", 1, 0; x, 1)$, the exact identity
  $ U \( s \) L \( t \) U \( - s \/ u \) L \( - t u \) = "diag" \( u \, u^(- 1) \) $
  shows that $H_i$ contains the affine transformation
  $ h : x mapsto u^2 x + \( 1 - u^2 \) r . $
  It fixes $r$ and $oo$. Normality gives $q = h^(- 1) p^(- 1) h p in P_i$. This element fixes $oo$ and has affine slope $u^(- 4)$: in a local coordinate at $oo$ the derivative of $h$ is $u^(- 2)$, whereas at $r$ it is $u^2$. Thus, for any nonzero $x in I$,
  $ q U \( x \) q^(- 1) U \( - x \) = U \( \( u^(- 4) - 1 \) x \) $
  is an actual nonidentity upper unipotent in $P_i$. Scalar factors in a representative of $q$ cancel in this identity. By the definition of $P_i$ it lifts to an element of $H$ which is the identity on every other block. Interchanging the axes proves the lower assertion. ◻
]

To turn a single nonzero shear coefficient into an arbitrary additive change in $D$, we need the following exact statement, not merely local density.

#thm([Lemma 4.4.])[
  #emph[The additive subgroup generated by $U \( k \)$ is all of $D$: 
$ bb(Z) U \( k \) = D . $

]
] <lem:chars-additive-span>

#proof[
  Let $M = bb(Z) U \( k \)$. It is a subring, since $U \( k \)$ is a group. For a rational prime $p$, let $C_p$ be its additive closure in $D_p = D ⊗_(bb(Q)) bb(Q)_p$. Weak approximation for $U$ puts the product of its local groups above $p$ inside $C_p$. The largest $bb(Q)_p$-vector subspace of $C_p$ is
  $ V_p = ⋂_(j gt.eq 0) p^j C_p . $
  It is closed; here closed additivity implies stability under $bb(Z)_p$. Left and right multiplication by every local unitary element preserve $V_p$. Differentiating these actions shows stability under multiplication by every skew element, separately in each local component. The skew elements generate the local algebra: an invertible central skew scalar and its inverse, together with skew multiples of Hermitian elements, generate all Hermitian and skew elements. Hence $V_p$ is a two-sided ideal of $D_p$.
  Every simple factor occurs in this ideal. At a nonsplit finite place of $k$, the algebra over $L$ splits and the unitary group is isotropic because $n gt.eq 3$. Choose an unbounded sequence in that local unitary group, taking the identity in the other local components. Multiplication by suitable positive powers $p^(r_nu)$, with $r_nu arrow.r oo$, gives a subsequence tending to a nonzero vector in this factor and zero in the others. For each fixed $j$, the same sequence multiplied by $p^(r_nu - j)$ lies in $C_p$ eventually, so its limit is divisible by $p^j$ in $C_p$. The nonzero limit belongs to $V_p$. At a split place the two factors are interchanged by $*$; the unitary group contains reciprocal central scalars. Taking $\( p^(- r) \, p^r \)$ and scaling by $p^r$ gives a nonzero limit in one factor alone; reversing the two scalars gives the other. Thus the ideal $V_p$ contains every simple factor, proving $C_p = D_p$.
  This local density implies that the rational span of $M$ is $D$, so $M$ contains a full $bb(Z)$-lattice $Lambda$ in $D$. Fix $x = p^(- j) lambda$, with $lambda in Lambda$. Choose $a in M$ with $a - x in Lambda ⊗ bb(Z)_p$. There is a positive integer $m$ prime to $p$, congruent to $1$ modulo $p^j$, which clears all denominators of $a$ away from $p$ relative to $Lambda$. Then $m a - m x in Lambda$ at every rational prime, and hence globally, while $\( m - 1 \) x in Lambda$. Therefore $x in M$. Inverting all rational primes in $Lambda$ now gives $M = D$. ◻
]

#thm([Proposition 4.5.])[
  #emph[Let $E subset D$ be a $*$-stable maximal subfield, Galois over $L$. Let $d in E^times$ have $n$ distinct $L$-conjugates $t_1 \, dots.h \, t_n$ whose set is disjoint from ${ macron(t)_1 \, dots.h \, macron(t)_n }$, where $macron(z) = z^(*)$ on $E$. Then, whenever $b \, b d in cal(D)$, 
#[#set math.equation(numbering: n => "(4.8)")
 $ f \( b d \) - f \( b \) = chi \( macron(d) \/ d \) . $ <eq:chars-difference>]

]
] <prop:chars-difference>

#proof[
  We show that the invariance group of $F_d$ is transitive on nonzero pairs. If $c eq.not 0$, one of its $E$-block coordinates is nonzero. The corresponding pure upper shear of Lemma 18 changes $a$ by a fixed nonzero element $y in D$, leaving $c$ unchanged. Conjugating this transformation by left multiplication of the first coordinate by $v in U \( k \)$ changes $a$ by $v y$. Products and inverses therefore permit addition of every element of $\( bb(Z) U \( k \) \) y = D$, by Lemma 19 and division. The lower shears likewise permit arbitrary changes of $c$ when $a eq.not 0$. These operations connect every nonzero pair to a pair with both entries nonzero, and then connect any two such pairs. Thus $F_d$ is constant.
  At $e = \( d - macron(d) \)^(- 1)$, Equation (4.3) is solved by $c = 0$, $a = 1$. The unitary elements defining $f \( e \)$ and $f \( e d \)$ are respectively $1$ and $macron(d) \/ d$. This evaluates the constant and proves Equation (4.8). ◻
]

=== 4.3 Scalar normalization and a cyclic maximal field <scalar-normalization-and-a-cyclic-maximal-field>

Let $Omega$ be the nonsplit real places of $k$. At $v in Omega$ write the involution as $x^(*) = H_v^(- 1) macron(x)^(thin t) H_v$ on $M_n \( bb(C) \)$. For a nonzero Hermitian element $h in D$, call its signature admissible when the signature of $H_v h$ is that of $H_v$ up to overall sign, for every $v in Omega$. This does not depend on the matrix realization. Define $cal(D)^(\#)$ to consist of the nonzero skew elements and the $b in D$ for which $h = b + b^(*) eq.not 0$ has admissible signature. Division makes every such $h$ invertible.

#thm([Lemma 4.6.])[
  #emph[If $h = h^(*) eq.not 0$ has admissible signature and $s = "Nrd" \( h \) in k^times$, there is $a in D^times$ with 
#[#set math.equation(numbering: n => "(4.9)")
 $ a^(*) a = s h \, #h(2em) "Nrd" \( a \) = s^(\( n + 1 \) \/ 2) . $ <eq:chars-normalized-norm>]

 Consequently 
$ f^(\#) \( b \) = f \( s b \) #h(2em) \( b in cal(D)^(\#) \) $

 is well-defined using any $s in k^times$ for which $s b in cal(D)$. It is invariant under congruence by $D^times$ and multiplication by $k^times$.]
] <lem:chars-normalization>

#proof[
  At a nonsplit finite place the algebra splits; classification of Hermitian forms says that its dimension and determinant modulo norms determine its isometry class. The determinant ratio for $s h$ is $s^(n + 1)$, which is a norm since $n + 1$ is even. At a nonsplit real place, $"sign" \( s \)$ is positive if $H_v h$ has the signature of $H_v$, and negative if it has the opposite signature, because $n$ is odd. Thus $s H_v h$ has precisely the signature of $H_v$. At split finite places the assertion reduces to surjectivity of the local reduced norm; at split archimedean places the algebra is split, again by odd degree. These facts give local solutions of $a^(*) a = s h$. Their reduced norms can be made exactly $s^(\( n + 1 \) \/ 2)$, since the determinant map of the local full unitary group is onto its norm-one group. The variety in Equation (4.9) is a torsor under the simply connected group $S$, and so has a rational point by its Hasse principle. We use here the local Hermitian classification and the simply connected Hasse principle in their number-field forms [16,25].
  If both $s b$ and $t b$ are in $cal(D)$ and $b$ is not skew, taking reduced norms of the two defining Hermitian equations shows that $\( t \/ s \)^n$ is a norm from $L^times$. The quotient $k^times \/ N_(L \/ k) \( L^times \)$ has exponent two. Since $n$ is odd, $t \/ s$ itself is a norm, say $t \/ s = macron(z) z$. Central congruence by $z$ and Equation (4.2) give $f \( t b \) = f \( s b \)$. For skew $b$ both values are zero. This proves independence. Congruence and scalar invariance follow by applying the same argument to any permissible normalization. ◻
]

#thm([Lemma 4.7.])[
  #emph[There is a $*$-stable maximal subfield $E subset D$ which is cyclic of degree $n$ over $L$. Its norm-one torus $T = ker \( N_(E \/ L) : "Res"_(E \/ L) bb(G)_m arrow.r bb(G)_m \)$ has weak approximation over $L$.]
] <lem:chars-cyclic-field>

#proof[
  By the odd-degree case of Grunwald–Wang, choose a cyclic extension $F \/ k$ of degree $n$ having full local degree at each place below the Brauer support of $D$ [23]; see also [22] Chapter VIII, Theorem 2.4 and Corollary 2.5. It is disjoint from $L$. The local invariant criterion shows that $E_0 = L F$ splits $D$; since $\[ E_0 : L \] = n$, the embedding criterion for central simple algebras gives an embedding $alpha : E_0 arrow.r.hook D$ [33]. Let bar on $E_0$ fix $F$ and restrict to the nonidentity automorphism of $L \/ k$. Skolem–Noether supplies $h in D^times$ with
  $ alpha \( macron(z) \)^(*) = h alpha \( z \) h^(- 1) #h(2em) \( z in E_0 \) . $
  Replacing $z$ by $macron(z)$ and taking adjoints gives
  $ alpha \( z \) = h^(- *) alpha \( macron(z) \)^(*) h^(*) . $
  Thus $h^(*)$ also intertwines the two embeddings, and $c = h^(- 1) h^(*)$ lies in $alpha \( E_0 \)$. On this field the adjoint satisfies $x^(*) = h macron(x) h^(- 1)$, so
  $ macron(c) = h^(- 1) c^(*) h = h^(- *) h = c^(- 1) . $
  Hilbert 90 gives $t \/ macron(t) = c$. The replacement $h mapsto h alpha \( t \)$ preserves the intertwining identity and is Hermitian, because $\( h alpha \( t \) \)^(*) = h alpha \( macron(t) \) c = h alpha \( t \)$.
  At a real place in $Omega$, the odd cyclic extension $F \/ k$ splits completely. For the Hermitian form with matrix $H_v h$, the $n$ eigenlines of $alpha \( E_0 \)$ are orthogonal. Replacing $h$ by $h alpha \( z \)$, with $z in F^times$, scales their Hermitian coefficients independently by the real embeddings of $z$. Weak approximation in $F$ therefore makes its signature admissible at every such place, even equal to that of $H_v$ if desired. Apply Lemma 21 to obtain $a^(*) a = s h$. The embedding $z mapsto a alpha \( z \) a^(- 1)$ is $*$-stable and induces bar, since
  $ \( a alpha \( macron(z) \) a^(- 1) \)^(*) = \( a^(*) \)^(- 1) h alpha \( z \) h^(- 1) a^(*) = a alpha \( z \) a^(- 1) . $
  Its image is the required $E$. Finally, for a cyclic generator $sigma$ of $"Gal" \( E \/ L \)$, Hilbert 90 parametrizes $T \( L \)$ by $y \/ sigma \( y \)$ with $y in E^times$. The same parametrization holds at each completion, and weak approximation in $E$ proves weak approximation for $T$. ◻
]

Fix this field $E$ and an integer $m gt.eq 1$ annihilating $B$. Call $d in T \( L \)^m$ admissible if its conjugates over $L$ are distinct and disjoint from their bars. These conditions specify a nonempty $k$-Zariski open subset of $"Res"_(L \/ k) T$: after extending scalars, the two determinant-one eigenvalue lists can be chosen independently, avoiding equality within or between the lists. In particular admissible elements exist, since the rational points of $T$ are Zariski dense and the power map is dominant. Let $cal(C)$ be their $D^times$-conjugates. This set is closed under inversion.

#thm([Corollary 4.8.])[
  #emph[If $t in cal(C)$ and $b \, b t in cal(D)^(\#)$, then 
#[#set math.equation(numbering: n => "(4.10)")
 $ f^(\#) \( b t \) = f^(\#) \( b \) . $ <eq:chars-step-invariance>]

]
] <cor:chars-step-invariance>

#proof[
  Write $t = x d x^(- 1)$. Congruence by $x$ gives $x^(*) \( b t \) x = \( x^(*) b x \) d$. Choose separate scalar normalizations of these two arguments. Their ratio only replaces $d$ in Proposition 20 by a nonzero $k$-multiple, which preserves spectral disjointness and leaves $macron(d) \/ d$ unchanged. If $d = y^m$ with $y in T \( L \)$, then $macron(d) \/ d = \( macron(y) \/ y \)^m$, an $m$-th power in $E^1 subset U \( k \)$. Thus its character is zero, and Equation (4.10) follows. ◻
]

=== 4.4 Keeping products in the real signature domain <keeping-products-in-the-real-signature-domain>

The subgroup $J subset "SL"_1 \( D \) \( L \)$ generated by $cal(C)$ is noncentral and normal. The established inner-type case of the Margulis–Platonov theorem, applied over the number field $L$, gives an open neighborhood $W$ of $1$ in

$ product_(w in A_D) "SL"_1 \( D \) \( L_w \) $

whose rational inverse image is contained in $J$. Here $A_D$ is the set of finite places of $L$ where $D ⊗_L L_w$ is division. This use of the known inner case is independent of the outer case being proved [36] Theorem 2[27] Sections 3.4–3.5. Although every element of $J$ is a word in the allowed steps, an arbitrary word need not preserve the real signature domain at its intermediate products. The next lemma supplies the required control.

#thm([Lemma 4.9.])[
  #emph[Let $b in cal(D)^(\#)$ have nonzero Hermitian part. For every $r in "SL"_1 \( D \) \( L \)$ with $r_(A_D) in W$ and $r_Omega$ sufficiently close to $1$, one has 
#[#set math.equation(numbering: n => "(4.11)")
 $ f^(\#) \( b r \) = f^(\#) \( b \) . $ <eq:chars-local-invariance>]

]
] <lem:chars-local-invariance>

#proof[
  If $Omega$ is empty, the signature condition is absent: every nonzero element of $D$ is in $cal(D)^(\#)$, either with nonzero Hermitian part or skew. A word in $cal(C)$ therefore proves the assertion directly by Corollary 23.
  Suppose $Omega eq.not diameter$ and write $G_Omega = product_(v in Omega) "SL"_n \( bb(C) \)$. Let $cal(O)$ be the open set of $g in G_Omega$ for which $b g$ has nondegenerate Hermitian part with the required signatures. It contains $1$. Restrict $r_Omega$ to a sufficiently small neighborhood of $1$ that it can be joined to $1$ by a path $gamma : \[ 0 \, 1 \] arrow.r cal(O)$. Since $r in J$, write it as a word in elements of $cal(C)$. Join each factor of this word to $1$ in the corresponding conjugate of $T$ at $Omega$; these complex tori are connected. The product of the factor paths is a path $p$ from $1$ to $r_Omega$.
  We explain why the based loop $p^(- 1) gamma$ is a finite product of based loops in rational conjugates of $T$. The Lie algebras of finitely many such conjugates span the real Lie algebra of $G_Omega$. Indeed the full conjugacy span is the whole Lie algebra by simplicity, and rational conjugators in $D^times$ are dense independently at the finitely many places. The multiplication map from finitely many of these tori consequently has a continuous local section near $1$, taking $1$ to the tuple of identities. Applying this section pointwise factors every based loop sufficiently uniformly close to $1$ into based torus loops. The subgroup they generate in the based loop group is therefore open. The based loop group is connected, because every $"SL"_n \( bb(C) \)$ is simply connected; hence that open subgroup is the whole based loop group. This proves the desired finite factorization of $p^(- 1) gamma$.
  Appending these factors to those of $p$ writes $gamma$ pointwise as a finite product of paths in rational conjugates of $T$, each starting at $1$ and with rational prescribed endpoint. Every endpoint belongs to the corresponding rational $m$-th-power group: the original word has this property, and the appended loops end at $1$.
  Take a fine mesh in $\[ 0 \, 1 \]$ with at least one interior point. At its interior nodes approximate each torus factor by rational points in its $m$-th-power group, leaving the endpoints unchanged. These rational powers are dense at $Omega$: use weak approximation for $T$ and surjectivity of the power map on each complex torus. We can further require that every consecutive ratio in every factor is admissible, including the ratios next to the fixed endpoints. To see this precisely, regard all interior nodes as independent variables in products of $"Res"_(L \/ k) T$. Every consecutive-ratio map is dominant; beside a fixed endpoint it is simply translation or inverse translation of the free variable. The complement of admissibility therefore pulls back to a proper closed subset in each case. The finite union of these subsets cannot fill the irreducible parameter variety. One may work in the parameters before taking $m$-th powers, whose power map is dominant: weak approximation then supplies rational parameters arbitrarily close to the chosen local roots while avoiding the finite proper closed exclusions. Thus both endpoint ratios and all interior ratios can be made admissible simultaneously.
  Pass from one mesh product to the next by changing one factor at a time. Each change is right multiplication by a rational $D^times$-conjugate of an admissible increment. All intermediate products remain in $cal(O)$ if the mesh is sufficiently fine and the approximations sufficiently close. To justify the uniform choice, the finitely many factor paths are uniformly continuous, their images are compact, and $gamma \( \[ 0 \, 1 \] \)$ is a compact subset of the open set $cal(O)$; mixed products from two sufficiently nearby mesh nodes are uniformly close to $gamma$. At the rational intermediate points the real nondegeneracy also guarantees nonzero Hermitian part in $D$. Corollary 23 now applies to every move. The initial and final products are exactly $1$ and $r$, so their character differences give Equation (4.11). ◻
]

=== 4.5 Continuity and the final vanishing <continuity-and-the-final-vanishing>

#proof[
  Choose $u in U \( k \)$ with $"Nrd" \( u \) eq.not 1$. Such an element can be chosen central, since the norm-one torus of $L \/ k$ has infinitely many rational points. Division implies that $1 - u$ is invertible. Put $b = \( 1 - u \)^(- 1)$. Direct calculation gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ b + b^(*) = 1 \, #h(2em) b^(*) = - u b \, #h(2em) f^(\#) \( b \) = f \( b \) = chi \( u \) . $ <eq:chars-final-b>]
  If $u' in U \( k \)$ has the same reduced norm as $u$, define $b' = \( 1 - u' \)^(- 1)$; it satisfies the same identities. In particular
  $ q = frac("Nrd" \( b' \), "Nrd" \( b \)) in k^times . $
  Indeed $overline("Nrd" \( b \)) = - "Nrd" \( u \) "Nrd" \( b \)$ by oddness, and the same identity for $b'$ makes the ratio fixed by $L \/ k$.
  Suppose $u'$ is sufficiently close to $u$ at $A_D$ and at $Omega$, using both places of $L$ over every split place of $k$. Choose $a in D^times$ with
  $ "Nrd" \( a \) = q^(\( n - 1 \) \/ 2) \, $
  and with $a$ close to $1$ at all these places. The global reduced norm theorem gives one such element without the approximation conditions: the only possible archimedean sign obstruction occurs at quaternionic real factors, which cannot occur in odd degree. Locally near $1$ the reduced norm is a submersion, so there are local solutions near $1$ for $q$ near $1$. Weak approximation for the simply connected inner group $"SL"_1 \( D \)$ then adjusts the global solution to these local solutions [25,33].
  Set $b'' = q^(- 1) a^(*) b' a$. Congruence and scalar invariance give $f^(\#) \( b'' \) = f^(\#) \( b' \)$, while
  $ "Nrd" \( b'' \) = q^(- n) q^(n - 1) "Nrd" \( b' \) = "Nrd" \( b \) . $
  Thus $r = b^(- 1) b'' in "SL"_1 \( D \) \( L \)$ is close to $1$ at $A_D$ and $Omega$. Lemma 24 gives $f^(\#) \( b'' \) = f^(\#) \( b \)$, and hence $chi \( u' \) = chi \( u \)$. Taking $u' = u s$ shows that $chi \|_(S \( k \))$ is continuous for the topology induced by these finitely many local factors.
  The set $A_D$ consists precisely of the two places over each place in $A$ from Section 3. At nonsplit places the algebra splits, and at a split place its local norm-one group is anisotropic exactly when the component algebra is division. Weak approximation for $S$ therefore extends this finite-valued continuous restriction uniquely to a continuous homomorphism on
  $ product_(v in A) S \( k_v \) med times med product_(v in Omega) S \( k_v \) . $
  For completeness, write $H$ for the dense rational subgroup and $K$ for the kernel of its character. Continuity makes $K$ closed in $H$, so $overline(K) ∩ H = K$. Finitely many cosets $h_i K$ cover $H$; the finite closed union of $h_i overline(K)$ therefore covers the ambient local product. The subgroup $overline(K)$ consequently has finite index and is open, since its complement is a finite union of closed cosets. It is normal by density and continuity of conjugation. The resulting map $H \/ K arrow.r G \/ overline(K)$, where $G$ denotes the local product, is an isomorphism: injectivity is the intersection identity, and surjectivity is the coset cover. This gives the asserted continuous extension. Each real factor is connected and so maps trivially to the finite group $B$.
  Finally fix a split place $v in A$, writing $U \( k_v \) = cal(D)_v^times$ and $S \( k_v \) = "SL"_1 \( cal(D)_v \)$. Weak approximation in $U$ approximates any two local elements at $v$ by rational unitary elements, with the identity prescribed at the other places of $A$ and $Omega$. Their rational commutators belong to $S \( k \)$ and have character zero. Continuity of the extended restriction therefore kills every local commutator of $cal(D)_v^times$. Lemma 14 says that these commutators generate a dense subgroup of $"SL"_1 \( cal(D)_v \)$, so this factor also maps trivially. All factors have been killed, proving $chi \( S \( k \) \) = 0$. This includes $A = diameter$, when only the connected real factors occur, and includes the case where both products are empty. ◻
]

== 5 Excluding nonabelian simple colors <sec:palettes>

We retain the odd-degree division-algebra hypotheses and notation of Section 3. Thus $L \/ k$ is quadratic, $D$ is a central division $L$-algebra of odd degree $n gt.eq 3$, the involution $*$ induces the nontrivial automorphism of $L \/ k$, and $S = "SU" \( D \, * \) subset U = "U" \( D \, * \)$. Fix $i in L^times$ with $macron(i) = - i$. For $R = S \( k \)^e$ let $P_0$ and $V_0$ have the meaning of Proposition 5. We now eliminate the nonabelian alternative in Proposition 12.

#thm([Theorem 5.1.])[
  #emph[There is no homomorphism 
$ phi.alt : U \( k \) arrow.r cal(F) quad upright("with") quad R subset ker phi.alt \, #h(2em) phi.alt \( V_0 \) = cal(F) \, $

 where $cal(F)$ is a finite nonabelian simple group.]
] <thm:no-simple-colors>

Suppose, for a contradiction, that such a homomorphism exists. We call its values #emph[colors]. It is surjective, so central scalars in $U \( k \)$ have color $1$: their images centralize $cal(F)$. The finite-group input is the following assertion. Its statement is independent of the arithmetic constructions below.

#thm([Lemma 5.2.])[
  #emph[For every finite nonabelian simple group $cal(F)$ there is a nonempty proper conjugacy-invariant subset $cal(S) subset cal(F)$ with the following property. If $W in cal(S)$, $Z in.not cal(S)$, and $W Z = Z W$, then it is impossible that 
#[#set math.equation(numbering: n => "(5.1)")
 $ Z W in C \( B \) \( Z W^(- 1) \) C \( B Z^2 \) #h(2em) upright("for every ") B in cal(F) \, $ <eq:palette-obstruction>]

 where $C \( B \) = C_(cal(F)) \( B \)$ denotes the centralizer of $B$ in $cal(F)$.]
] <lem:finite-obstruction>

The proof of Lemma 26 occupies Section 6. We use exactly its displayed double-coset condition. Our task in this section is to force that condition from sufficiently many additive returns of colors, and then to show that avoiding it would make membership in $cal(S)$ constant on $cal(F)$.

=== 5.1 The compact space of color configurations <the-compact-space-of-color-configurations>

Let $tilde(G)$ be the simply connected special unitary group of the hyperbolic binary hermitian form over $\( D \, * \)$ with coefficients $1 \, - 1$. Let $X$ be its projective variety of isotropic right $D$-lines. Since $D$ is division, the form has relative rank one, and the stabilizer of such a line is a minimal $k$-parabolic of $tilde(G)$. Every rational isotropic line has a unique representative $\( u \, 1 \)$ with $u in U \( k \)$: the second entry cannot vanish, and division makes it invertible. This identifies $X \( k \)$ with $U \( k \)$.

There is also an additive parametrization. Put

$ J = { x in D : x = x^(*) } \, #h(2em) q \( x \) = \( x + i \) \( x - i \)^(- 1) . $

Here $J$ is a $k$-vector space, and

#[#set math.equation(numbering: n => "(5.2)")
 $ X \( k \) = J \( k \) union.sq { oo } \, #h(2em) q \( oo \) = 1 . $ <eq:palette-cayley>]

Indeed $x - i$ is nonzero for $x = x^(*)$, and $u - 1$ is invertible for every $u eq.not 1$ in $U \( k \)$. The corresponding column on the additive chart is $\( x + i \, x - i \)$. At a completion $k_v$, these two parametrizations give open charts isomorphic to $U \( k_v \)$ and $J \( k_v \)$, respectively. Their complements are proper algebraic subvarieties and therefore have measure zero for any smooth measure on $X \( k_v \)$. We shall use this assertion at finitely many completions at a time.

Let $cal(H)$ be the countable group of rational transformations of $X$ induced by rational form similitudes. It contains $tilde(G) \( k \)$, the left and right rotations

$ L_a \( u \) = a u \, #h(2em) R_a \( u \) = u a quad \( a in U \( k \) \) \, $

and the additive translations $T_b \( x \) = x + b$ for $b in J \( k \)$. Write $tau_s = T_s$ when $s in k subset J \( k \)$. For $p in X \( k \)$ define a configuration

$ c \( p \) = \( c_h \( p \) \)_(h in cal(H)) \, #h(2em) c_h \( p \) = phi.alt \( u \( h p \) \) in cal(F) . $

We call this configuration a #emph[palette], and let $cal(C) subset cal(F)^(cal(H))$ be the closure of the rational palettes. The product topology makes $cal(C)$ compact and metrizable. The action is

$ \( h c \)_j = c_(j h) \; #h(2em) c \( h p \) = h c \( p \) . $

Every pattern on finitely many coordinates of a palette in $cal(C)$ occurs at a rational point, because the colors form a finite discrete space. In particular, all finite-coordinate identities satisfied by rational palettes hold throughout $cal(C)$.

=== 5.2 A translation-invariant law with uniform marginals <a-translation-invariant-law-with-uniform-marginals>

The next proposition supplies additive recurrence without losing any color. Arbitrary additive averages of rational palettes need not have uniform marginals, so we first construct a measure with controlled conditional laws over the local flag varieties.

#thm([Proposition 5.3.])[
  #emph[There is a probability measure $mu$ on $cal(C)$ invariant under $T_b$ for every $b in J \( k \)$ such that 
$ mu { c : c_h = a } = frac(1, \| cal(F) \|) #h(2em) \( h in cal(H) \, med a in cal(F) \) . $

]
] <prop:palette-measure>

#proof[
  We construct a conformal joint law, identify its local projection, prove that its conditional color marginals are uniform, and only then average additively.
  ===== 5.2.1 A joint law over all completions. <a-joint-law-over-all-completions.>
  For every place $v$, choose an Iwasawa maximal compact subgroup $K_v subset tilde(G) \( k_v \)$ and its invariant probability $m_v$ on $X \( k_v \)$. The compact group is transitive on this flag variety. Choose the good integral compacts at almost all finite places, and set
  $ Y = product_v X \( k_v \) \, #h(2em) m = product_v m_v . $
  Each $m_v$ is smooth and has full support. A fixed $h in cal(H)$ has smooth positive Jacobians on all local factors and preserves $m_v$ outside finitely many places. For the latter assertion, discard the finitely many denominators and nonunit similitude multipliers of a representative of $h$. At every remaining place it normalizes the good integral compact of $tilde(G)$; its pushforward of $m_v$ is consequently the same compact-invariant probability. Thus
  $ rho \( h \, y \) = frac(d \( h_(*) m \), d m) \( y \) $
  is a continuous positive function on $Y$, given by a finite product, and
  #[#set math.equation(numbering: n => "(5.3)")
   $ rho \( a g \, y \) = rho \( a \, y \) rho \( g \, a^(- 1) y \) . $ <eq:palette-cocycle>]
  Assign positive weights $w \( p \)$ to rational points by requiring the ratio $w \( h p \) \/ w \( p \)$ to be the product of the forward local volume Jacobians of $h$ at $p$. To construct them, normalize the weight at one rational base point and transport by $tilde(G) \( k \)$. Rational conjugacy of parabolics of the given type gives transitivity [2] Theorem 4.13(a,c). If two transporters give the same point, their quotient fixes the base point; the product of its tangent determinants is $1$ by the product formula in $k$. This proves independence of the transporter. The same reasoning at rational fixed points proves the weight-ratio rule for every $h in cal(H)$, not just for $tilde(G) \( k \)$.
  We shall use
  #[#set math.equation(numbering: n => "(5.4)")
   $ sum_(p in X \( k \)) w \( p \)^s < oo #h(2em) \( s > 1 \) . $ <eq:palette-weight-sum>]
  Here is the convergence theorem and normalization involved. Let $P$ be the stabilizing minimal $k$-parabolic. For a local decomposition $g = k_0 p_0$ with $k_0 in K_v$ and $p_0 in P \( k_v \)$, the forward tangent Jacobian at the base point is $delta_P \( p_0 \)^(- 1)$, where $delta_P$ is the modular character of $P$. After replacing $g$ by $g^(- 1)$, the sum in Equation (5.4) is the spherical minimal-parabolic Eisenstein sum with inducing character $delta_P^s$. The derived Levi is $k$-anisotropic, since $P$ is minimal and $tilde(G)$ has relative rank one. More precisely, its Levi subgroup $M$ is $k$-anisotropic modulo its maximal $k$-split central torus, so $M \( k \) without M \( bb(A)_k \)^1$ is compact, where the superscript $1$ imposes adelic norm one for every $k$-rational character of $M$ [25] Theorem 5.6. The constant inducing function is therefore square-integrable modulo the split center and cuspidal, since $M$ has no proper $k$-parabolics. The usual absolute-convergence theorem applies in the Godement domain $"Re" lambda > rho_P$ for normalized parameter $rho_P + lambda$, where $2 rho_P$ is the sum of the positive relative roots with multiplicities; see [18] Chapter 4, Lemma 4.1, and Appendix II. For $delta_P^s$ this parameter is $lambda = \( 2 s - 1 \) rho_P$, and the domain is exactly $s > 1$. We use the number-field adelic formulation, equivalently the arithmetic formulation after restriction of scalars and finite adelic double-coset decomposition.
  Give $\( p \, c \( p \) \) in Y times cal(C)$ mass proportional to $w \( p \)^s$, and denote this probability by $mu_s$. Its transformation rule is
  $ frac(d \( h_(*) mu_s \), d mu_s) \( y \, c \) = rho \( h \, y \)^s . $
  The reciprocal in this formula is worth noting: the mass at $h p$ after pushforward is the old mass at $p$, so the forward Jacobian is inverted. Take a weak limit $mu^0$ as $s arrow.b 1$. Compactness gives such a limit, and uniform convergence of $rho \( h \, dot.op \)^s$ for each fixed $h$ gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ h_(*) mu^0 = rho \( h \, dot.op \) mu^0 . $ <eq:palette-joint-conformal>]
  ===== 5.2.2 The base projection is the product measure. <the-base-projection-is-the-product-measure.>
  Let $nu$ be the projection of $mu^0$ to $Y$. We prove $nu = m$. Fix a sufficiently large finite set $T$ of places containing the archimedean and model-exceptional places. Use subscripts $T$ for products over $T$, and superscripts $T$ for products over its complement. An arithmetic lattice $Gamma subset tilde(G)_T$, integral outside $T$, preserves the tail probability. Equation (5.5) therefore gives
  $ gamma_(*) nu_T = rho_T \( gamma \, dot.op \) nu_T #h(2em) \( gamma in Gamma \) . $
  Define the continuous positive function
  $ f \( g \) = integral_(Y_T) rho_T \( g \, y \) thin d nu_T \( y \) #h(2em) \( g in tilde(G)_T \) . $
  The cocycle identity and the preceding transformation rule give $f \( gamma g \) = f \( g \)$.
  Choose a full-support probability $eta$ on $tilde(G)_T$ that is left invariant by $K_T = product_(v in T) K_v$. Compact transitivity and $integral rho_T \( h \, y \) thin d m_T \( y \) = 1$ imply
  $ integral rho_T \( h \, z \) thin d eta \( h \) = 1 quad \( z in Y_T \) . $
  Indeed average first over left multiplication of $h$ by $K_T$; the result averages $rho_T \( h \, dot.op \)$ over $m_T$. Equation (5.3) now gives
  $ f \( g \) = integral f \( g h \) thin d eta \( h \) . $
  This is a positive harmonic function on the finite-volume space $Gamma without tilde(G)_T$. To see it is constant without an unproved integrability assertion, apply Jensen’s inequality to the bounded strictly concave function $q \( t \) = t \/ \( 1 + t \)$ for $t > 0$. Its nonnegative Jensen discrepancy has integral zero over the quotient, by right invariance of the quotient volume. Equality in strict Jensen makes $f \( g h \)$ constant for $eta$-almost all $h$, for almost every coset $g$. Full support of $eta$ and continuity then make $f$ constant everywhere. Its value is $f \( 1 \) = 1$.
  We still have to show that these integrals determine $nu_T$. Choose a sequence $a_j in tilde(G)_T$ contracting the big cell of $Y_T$ to a point $x_0$, using a split cocharacter for the parabolic at each place. The complement of that cell has $m_T$-measure zero, so $\( a_j \)_(*) m_T arrow.r delta_(x_0)$. For $b in C \( Y_T \)$ put
  $ B_j \( y \) = integral_(K_T) b \( k_0 x_0 \) rho_T \( k_0 a_j \, y \) thin d k_0 . $
  Under the probability density $rho_T \( k_0 a_j \, y \) thin d k_0$, the variable $k_0^(- 1) y$ has distribution $\( a_j \)_(*) m_T$: use compact invariance and push Haar measure on $K_T$ onto $Y_T$. Compact equicontinuity shows that $B_j \( y \) arrow.r b \( y \)$ uniformly in $y$. On the other hand, $f \( k_0 a_j \) = 1$ gives
  $ integral B_j thin d nu_T = integral_(K_T) b \( k_0 x_0 \) thin d k_0 = integral b thin d m_T . $
  It follows that $nu_T = m_T$. Exhausting the places proves $nu = m$.
  Disintegrate the joint law as
  #[#set math.equation(numbering: n => "(5.6)")
   $ d mu^0 \( y \, c \) = d Q_y \( c \) thin d m \( y \) . $ <eq:palette-disintegration>]
  The spaces are compact metrizable, so regular conditional probabilities $Q_y$ exist. Equation (5.5) gives $Q_(h y) = h_(*) Q_y$ almost everywhere for each $h$. Since $cal(H)$ is countable, all these equalities may be imposed on a common conull set.
  ===== 5.2.3 Uniform conditional color marginals. <uniform-conditional-color-marginals.>
  Write $P \( y \)$ for the probability vector on $cal(F)$ which is the $c_1$-marginal of $Q_y$, and put $N = ker phi.alt ∩ S \( k \)$. The exact palette identities
  $ c_(L_a h) = phi.alt \( a \) c_h \, #h(2em) c_(R_a h) = c_h phi.alt \( a \) $
  imply that $P$ is invariant under the separate left and right rotations by every $a in N$. We first upgrade this invariance at one completion, using a finite-volume unitary representation, and then use approximation away from that completion. No topology is placed on the abstract map $phi.alt$.
  Enlarge $T$ so that it contains a finite place $v_0$ where $S$ has positive rank. On the $u_T$-chart, $m_T$ is in the Haar measure class of $U_T$. Disintegrate this class along the determinant map. On a fiber of determinant $lambda$ choose a measurable representative $d_lambda in U_T$ and write
  $ u_T = g d_lambda \, #h(2em) g in S_T . $
  The determinant map is a smooth group map onto its image, so the conditional measure class along its fibers is Haar measure on $S_T$. For almost every $lambda$, the function $P \( g d_lambda \, y^T \)$ is invariant under the diagonal left action of
  $ Gamma' = N ∩ { a in S \( k \) : a_v upright(" is integral for ") v in.not T } . $
  This is a finite-index subgroup of an arithmetic lattice. Consequently each component of $P$ defines a bounded function on
  #[#set math.equation(numbering: n => "(5.7)")
   $ Gamma' without \( S_T times Y^T \) . $ <eq:palette-lattice-space>]
  The space has finite invariant measure, obtained from Haar measure on the group factor and $m^T$ on the tail. For example, a measurable fundamental domain for $Gamma'$ in $S_T$, together with the tail, constructs this measure. Left integrality ensures that the tail action preserves $m^T$.
  Right invariance by $a in Gamma'$ acts on Equation (5.7) by
  $ \( g \, y^T \) mapsto \( g d_lambda a_T d_lambda^(- 1) \, med R_a y^T \) . $
  These actions commute with the diagonal left action. The right tail rotations lie in a compact group of measure-preserving transformations, since all their local coordinates are integral outside $T$.
  There is a sequence $a_j in Gamma'$ escaping every compact set at $v_0$ and bounded in the other factors of $S_T$. To obtain it, use the finite-index closure of $N$ and strong approximation off $v_0$ to find infinitely many elements in a fixed compact cylinder at all the other places. The full arithmetic diagonal is discrete, so a subsequence must escape at $v_0$. Pass to a subsequence on which the bounded factors and the compact tail rotations converge. The fixed conjugations by $d_lambda$ preserve these escape and convergence properties.
  Let $cal(L)$ be the $L^2$ space of Equation (5.7), and decompose it into the $S \( k_(v_0) \)$-invariant vectors and their orthogonal complement. Howe–Moore decay applies on the latter: $S \( k_(v_0) \)$ is an isotropic simple local group, and local Kneser–Tits identifies it with the group generated by its root groups; see [15] or [6] Theorem 4.19 and Definition 4.23. For completeness, let $v$ be the projection of a component of $P$ to this complement. The simultaneous right actions fixing $P$ also fix $v$. They are products $pi \( g_j \) A_j$, where $g_j arrow.r oo$ in $S \( k_(v_0) \)$ and the commuting unitary operators $A_j$ converge strongly to a unitary operator $A$. Therefore
  $ parallel v parallel^2 = chevron.l pi \( g_j \) A_j v \, v chevron.r = chevron.l pi \( g_j \) A v \, v chevron.r + o \( 1 \) arrow.r 0 . $
  Thus $P$ is invariant under the full right $S \( k_(v_0) \)$ action. All descent and invariance statements above hold on almost every determinant fiber by ordinary measure disintegration and countability of the rational groups. Strong continuity of the local and compact actions follows first on continuous compactly supported functions and then on $L^2$.
  Full right $S \( k_(v_0) \)$-invariance makes $P \( y \)$ depend on $u_(v_0)$ only through its determinant, up to null sets. We now return to the left invariance under $N$. Take $a in V_0$. By Proposition 5, there are $r_j in R subset N$ converging to $a$ in the restricted adelic product away from $v_0$. On the space obtained by forgetting the determinant-one variable at $v_0$, the left rotations $L_(r_j)$ converge to $L_a$. This convergence passes to bounded measurable functions in the required measure class: restricted adelic convergence places all sufficiently late $r_j$ and $a$ in the same integral compacts outside one fixed finite set; those tail actions preserve measure. At the finitely many remaining local factors, the smooth actions converge and their Radon–Nikodym densities are uniformly bounded. Approximate a bounded function in $L^1$ by continuous cylinder functions to pass invariance to the limit. The determinant at $v_0$ is unchanged by every element of $S$, so it causes no additional action on this reduced space. Since $P$ is invariant under each $L_(r_j)$, it follows that $P \( L_a y \) = P \( y \)$ almost everywhere for every $a in V_0$.
  Conditional equivariance and the left-rotation palette identity also give $P \( L_a y \) = phi.alt \( a \) P \( y \)$. The image of $V_0$ is all of $cal(F)$, so $P \( y \)$ is the uniform probability almost everywhere. For arbitrary $h$, the equality $Q_(h y) = h_(*) Q_y$ identifies the $c_h$-marginal at $y$ with the $c_1$-marginal at $h y$. Nonsingularity therefore makes every conditional coordinate marginal uniform.
  ===== 5.2.4 Additive averaging. <additive-averaging.>
  We have obtained all colors with equal conditional probability, but the joint law is still conformal rather than translation invariant. On the additive chart over a finite set $T$, replace $m_T$ in Equation (5.6) by additive Haar measure on $J_T$, keeping $Q_y$ and the tail base $m^T$. The resulting $sigma$-finite joint measure is invariant under every rational translation $T_b$ integral outside $T$: Haar measure is translation invariant on $J_T$, the good integral translations preserve $m^T$, and the conditional laws are equivariant. Restrict to expanding Folner windows in $J_T$, divide by their Haar volumes, and project to $cal(C)$. Any weak limit is invariant under all these translations. Every averaging measure already has uniform coordinate marginals, because the conditional marginals were uniform. Finally exhaust the places by such finite sets $T$ and take another weak limit. Every $b in J \( k \)$ is integral off a sufficiently large $T$, so this limit has all the asserted invariances and marginals. ◻
]

=== 5.3 Fractional transformations and simultaneous color returns <fractional-transformations-and-simultaneous-color-returns>

Fix the conjugacy-invariant subset $cal(S)$ supplied by Lemma 26. We shall relate the colors of $w$ and $tau_s w$ to returns under a quadratic additive translation. For $w in U \( k \)$ and $s in k$, put

#[#set math.equation(numbering: n => "(5.8)")
 $ t = frac(s, s - 2 i) \, #h(2em) C = t w \, #h(2em) R_C = \( 1 - C^(*) \) \( 1 - C \)^(- 1) \, #h(2em) z = w R_C . $ <eq:palette-boost-data>]

These expressions are defined for every $s$: $i in.not k$, and

$ d := 1 - t macron(t) = frac(- 4 i^2, s^2 - 4 i^2) eq.not 0 . $

The elements $C$ and $C^(*)$ commute, and $C C^(*) = t macron(t)$ is central. Division and $d eq.not 0$ imply that $1 - C$ and $1 - C^(*)$ are invertible. It follows that $R_C$ is unitary and commutes with $w$. Hence $z$ is unitary and commutes with $w$. Direct Cayley substitution gives

#[#set math.equation(numbering: n => "(5.9)")
 $ z = \( w - macron(t) \) \( 1 - t w \)^(- 1) = frac(2 i - s, 2 i + s) thin tau_s \( w \) . $ <eq:palette-z-color>]

The scalar factor is central and has norm one, so $phi.alt \( z \) = phi.alt \( tau_s \( w \) \)$.

For such a $C$, the fractional transformation

$ D_C \( u \) = \( u + C \) \( C^(*) u + 1 \)^(- 1) $

is induced by a form similitude: its matrix $mat(delim: "(", 1, C; C^(*), 1)$ has multiplier $1 - t macron(t)$. The denominator is invertible for unitary $u$; otherwise it vanishes, which would force $t macron(t) = 1$. Writing $u = w a$ shows that

#[#set math.equation(numbering: n => "(5.10)")
 $ w^(- 1) D_C \( u \) = \( a + t \) \( macron(t) a + 1 \)^(- 1) quad upright("commutes with ") a = w^(- 1) u . $ <eq:palette-boost-commutes>]

This calculation does not commute $u$ with $w$.

Starting from a variable $u in U \( k \)$, define

$ v = D_(C^(*)) \( u R_C \) \, #h(2em) u' = R_C D_(- C) \( v \) . $

Apply Equation (5.10) first with unitary parameter $w^(- 1)$ and scalar $macron(t)$. It gives $\[ w v \, w u R_C \] = 1$; conjugating by $w^(- 1)$ gives $\[ v w \, u z \] = 1$. Applying the same equation with scalar $- t$ gives $\[ w^(- 1) v \, z^(- 1) u' \] = 1$. Thus, writing

$ W = phi.alt \( w \) \, quad Z = phi.alt \( z \) \, quad X_1 = phi.alt \( u \) \, quad Y_1 = phi.alt \( v \) \, quad X'_1 = phi.alt \( u' \) \, $

we have

#[#set math.equation(numbering: n => "(5.11)")
 $ \[ Y_1 W \, X_1 Z \] = 1 \, #h(2em) \[ W^(- 1) Y_1 \, Z^(- 1) X'_1 \] = 1 . $ <eq:palette-two-commutators>]

The transformation $u mapsto u'$ is an additive translation. Indeed its fractional matrix is

$ & "diag" \( R_C \, 1 \) mat(delim: "(", 1, - C; - C^(*), 1) mat(delim: "(", 1, C^(*); C, 1) "diag" \( 1 \, R_C^(- 1) \)\
 & #h(35mm)  = mat(delim: "(", d + C - C^(*), - \( C - C^(*) \); C - C^(*), d - \( C - C^(*) \)) . $

After dividing by $d$ and applying it to the column $\( x + i \, x - i \)$, the result is translation by $2 i \( C - C^(*) \) \/ d$. Expanding the latter gives

#[#set math.equation(numbering: n => "(5.12)")
 $ b_w \( s \) = - \( w + w^(*) \) s - frac(w - w^(*), 2 i) s^2 in J \( k \) . $ <eq:palette-quadratic-translation>]

The matrix calculation includes the point $oo$ of the additive chart. Neither $w$ nor the variable point is required to have a finite Cayley coordinate.

Suppose that, for this fixed translation $T_(b_w \( s \))$, every color occurs as $X_1 = X'_1$ at some rational point; different colors may use different points. Put $B = Z^(- 1) X_1$. Equations (5.11) then imply

$ A := W^(- 1) Y_1 in C \( B \) \, #h(2em) D_0 := Z^(- 1) Y_1 W Z in C \( B Z^2 \) . $

Since $W Z = Z W$, direct multiplication gives

$ A^(- 1) \( Z W^(- 1) \) D_0 = Z W . $

As $X_1$ ranges over $cal(F)$, so does $B$, and this is exactly Equation (5.1). Consequently

#[#set math.equation(numbering: n => "(5.13)")
 $ phi.alt \( w \) in cal(S) \, quad phi.alt \( tau_s w \) in.not cal(S) quad arrow.r.double\
upright("not every color can recur under ") T_(b_w \( s \)) . $ <eq:palette-return-obstruction>]

When $s = 0$, the translation is the identity and $Z = W$, so this implication has no degenerate exception.

=== 5.4 Uniform finite witnesses for recurrence <uniform-finite-witnesses-for-recurrence>

The translation-invariant law of Proposition 27 will now force simultaneous returns. Uniformity is essential: it lets us pass the resulting restrictions from rational palettes to their closure. A subset $D_0$ of the additive group $k$ is called #emph[thick] if it contains a translate of every finite subset of $k$.

#thm([Lemma 5.4.])[
  #emph[Let $0 < delta lt.eq 1$.]
  + #emph[There is an integer $r = r \( delta \) gt.eq 2$ such that, for every probability-preserving action $T$ of $bb(Z)^2$ and every event $E$ of probability $delta$, some $1 lt.eq j lt.eq r$ satisfies 
$ bb(P) \( E ∩ T_(\( j \, j^2 \))^(- 1) E \) > 0 . $

]
  + #emph[For every thick set $D_0 subset k$, there is a finite subset $F_0 subset D_0$, depending only on $D_0 \, k \, delta$, such that for every probability-preserving action $T$ of the discrete group $k^2$ and every event $E$ of probability $delta$, some $s in F_0$ satisfies 
$ bb(P) \( E ∩ T_(\( s \, s^2 \))^(- 1) E \) > 0 . $

]
] <lem:palette-uniform-recurrence>

#proof[
  For an action of either abelian group, the spectral measure $sigma$ of $1_E$ is a positive measure on the compact character group, of total mass $delta$, with
  #[#set math.equation(numbering: n => "(5.14)")
   $ sigma \( { 1 } \) = parallel "proj"_(upright("inv")) 1_E parallel_2^2 gt.eq delta^2 . $ <eq:palette-spectral-atom>]
  Its Fourier coefficient at $a$ is the return correlation $bb(P) \( E ∩ T_a^(- 1) E \)$, in particular a nonnegative real number. The atom lower bound is preserved under weak limits: for the closed singleton ${ 1 }$ the limit mass is at least the upper limit of the approximating masses.
  For (ii), suppose no finite $F_0$ works. Enumerate $D_0$ and choose a counterexample to each initial finite set. Compactness of the spectral measures gives a limit $sigma$ satisfying Equation (5.14) and having Fourier coefficient zero at $\( s \, s^2 \)$ for every $s in D_0$. Take finite Folner sets $F_j subset \( k \, + \)$ and translates $E_j = t_j + F_j subset D_0$. We show that the average over $E_j$ of
  $ f \( s \) = chi_1 \( s \) chi_2 \( s^2 \) $
  tends to zero for every nontrivial character pair $\( chi_1 \, chi_2 \)$. If $chi_2 = 1$, this is ordinary averaging of a nontrivial linear character. Such averaging is uniform in $t_j$, since a translate only multiplies the average by a scalar of absolute value one. If $chi_2 eq.not 1$, choose $M$ distinct shifts $a_1 \, dots.h \, a_M in k$. Folner invariance allows replacement of the average of $f$ by the average of $M^(- 1) sum_ell f \( s + a_ell \)$, with error tending to zero independently of the translate. Cauchy–Schwarz, followed by expansion, therefore gives
  $ limsup_j lr(|frac(1, \| E_j \|) sum_(s in E_j) f \( s \)|)^2 & lt.eq 1 / M + 1 / M^2 sum_(ell eq.not q) limsup_j lr(|frac(1, \| E_j \|) sum_(s in E_j) chi_2 \( 2 \( a_ell - a_q \) s \)|)\
 & = 1 / M . $
  All off-diagonal characters are nontrivial because multiplication by $2 \( a_ell - a_q \) eq.not 0$ is onto $k$. Letting $M arrow.r oo$ proves the claim. Dominated convergence against $sigma$ now says that the average of its coefficients at $\( s \, s^2 \)$ over $E_j$ tends to $sigma \( { 1 } \) > 0$, contradicting their vanishing.
  For (i), failure of every bound $r$ similarly gives a measure $sigma$ on $bb(R)^2 \/ bb(Z)^2$ satisfying Equation (5.14) and having coefficient zero at every $\( j \, j^2 \)$ with $j gt.eq 1$. Write a character phase as $exp \( 2 pi upright(i) \( alpha j + beta j^2 \) \)$, where here $upright(i)$ is the usual complex imaginary unit. Choose finitely many pairs with both $alpha \, beta$ rational, including the trivial pair, so that the remaining rational-pair mass is less than $epsilon < delta^2$. Choose a positive integer $M$ divisible by their denominators, for example a sufficiently large factorial. Along $j = M ell$, all selected phases are $1$. Every pair with at least one irrational coefficient has average zero by the degree-two form of Weyl’s theorem [44]. For the unselected rational pairs the absolute contribution is bounded by $epsilon$; their individual averages exist by periodicity. Dominated convergence makes the limiting average at least $delta^2 - epsilon > 0$, again a contradiction. Increasing the resulting bound to at least $2$ is harmless. ◻
]

Apply the lemma to independent copies of $\( cal(C) \, mu \)$ indexed by $a in cal(F)$, and to the event

$ E = { \( c^(\( a \)) \)_(a in cal(F)) : c_1^(\( a \)) = a upright(" for every ") a in cal(F) } . $

Its probability is the fixed number $delta = \| cal(F) \|^(- \| cal(F) \|) > 0$. Writing $b_w \( s \) = s A_w + s^2 B_w$ as in Equation (5.12), use the $k^2$-action

$ \( a \, b \) mapsto T_(a A_w + b B_w) $

on this product space. Positive return of $E$ yields every recurrent color in some palette. Each required two-coordinate pattern then occurs rationally, so Equation (5.13) applies. For part (i), and any $u_0 in k$, use instead the $bb(Z)^2$-action

$ \( a \, b \) mapsto T_(a u_0 A_w + b u_0^2 B_w) . $

We have obtained two statements uniform in $w$:

+ for every $u_0 in k$, some $s in { u_0 \, 2 u_0 \, dots.h \, r u_0 }$ gives simultaneous recurrence of all colors;
+ for every fixed thick $D_0 subset k$, a fixed finite subset of $D_0$ contains such an $s$ for every $w$.

The second finite subset is not asserted to be uniform over thick sets.

=== 5.5 Additive invariance of membership in the finite subset <additive-invariance-of-membership-in-the-finite-subset>

Fix $c in cal(C)$ and a prefix $h in cal(H)$, and set

$ C_0 = { x in k : c_(tau_x h) in.not cal(S) } . $

If $x in.not C_0$, then $C_0 - x$ cannot contain ${ u_0 \, 2 u_0 \, dots.h \, r u_0 }$ for any $u_0 in k$. Indeed, match the finitely many relevant coordinates by a rational palette and apply statement (a) to its rational point $w = u \( tau_x h p \)$. This contradicts Equation (5.13). Nor can $C_0 - x$ be thick: apply statement (b) to that particular thick set and match the finitely many witness coordinates by a rational palette. The same contradiction results.

We record explicitly the combinatorial consequence:

#[#set math.equation(numbering: n => "(5.15)")
 $ C_0 = k quad upright("or") quad C_0 upright(" has zero upper Banach density") . $ <eq:palette-density-alternative>]

For this purpose the upper Banach density of $C subset k$ is the supremum of $M \( 1_C \)$ over translation-invariant means $M$ on bounded functions on the discrete additive group $k$. Such means exist because this group is abelian. If this density is zero, the density of $C$ along every Folner sequence tends to zero: a nonzero upper limit would yield an invariant mean with positive value by taking a weak limit of the averaging functionals.

First, a run of $r$ consecutive points of $C_0$ in a direction $u_0$ extends to the adjacent point on either side. Otherwise that adjacent point, lying outside $C_0$, would have the forbidden run immediately ahead in direction $u_0$ or $- u_0$. Iteration fills the entire integer progression.

Suppose now that $C_0$ has positive upper Banach density. To prove it thick, fix any finite list $g_1 \, dots.h \, g_d in k$, and choose an invariant mean $M$ with $M \( 1_(C_0) \) > eta > 0$. The finite multidimensional Szemeredi theorem supplies a box size $N_0$ such that every subset of ${ 1 \, dots.h \, N_0 }^d$ of density at least $eta$ contains an affine homothetic copy of ${ 0 \, dots.h \, r - 1 }^d$, with positive integer dilation $ell lt.eq N_0$. This is the finite-box form of the density theorem of [12] Theorem B. Put $L_0 = "lcm" \( 1 \, dots.h \, N_0 \)$ and average, with respect to $M$, the density of the pullback of $C_0$ under

$ \( m_1 \, dots.h \, m_d \) mapsto x + sum_(j = 1)^d m_j g_j \/ L_0 . $

Translation invariance makes this average $M \( 1_(C_0) \) > eta$, so one translate has pullback density at least $eta$. Injectivity of this box map is not required. The resulting homothetic $r$-box lies in $C_0$, with steps $ell g_j \/ L_0$. Extend progressions successively along each coordinate axis. This fills the whole integer grid with these steps. Because $ell$ divides $L_0$, that grid contains a translate of ${ 0 \, g_1 \, dots.h \, g_d }$. Thus $C_0$ is thick. If any $x$ were outside $C_0$, then $C_0 - x$ would also be thick, contrary to the preceding restriction. This proves Equation (5.15).

Now let the palette be random with law $mu$. For a fixed Folner sequence, Equation (5.15) makes the densities of $C_0$ converge pointwise to $1_({ C_0 = k })$. Uniform coordinate marginals and dominated convergence give

$ bb(P) \( C_0 = k \) = frac(\| cal(F) \\ cal(S) \|, \| cal(F) \|) . $

For each $s$, the event $C_0 = k$ is contained in $s in C_0$, and the latter has exactly this same probability. Therefore

#[#set math.equation(numbering: n => "(5.16)")
 $ 1_(cal(S)) \( c_(tau_s h) \) = 1_(cal(S)) \( c_h \) quad upright("almost surely for every ") s in k \, med h in cal(H) . $ <eq:palette-indicator-translation>]

Countability makes these identities simultaneous for all $s \, h$. The palette rules also give, for every prefix $h$, invariance of this indicator under left rotation by any element of $ker phi.alt$ and under conjugation by any element of $U \( k \)$, since $cal(S)$ is conjugacy-invariant. These are exact finite-coordinate identities, so they hold throughout $cal(C)$.

We have reached a concrete restriction on a common full-measure set of palettes: membership of a color in $cal(S)$ is unchanged under scalar additive translations, kernel left rotations, and all unitary conjugations, at every prefix. It remains to show that these transformations already force invariance under all left colors.

=== 5.6 Generating left rotations by squares <generating-left-rotations-by-squares>

Let $cal(K)$ be the subgroup of $cal(H)$ generated by the three classes of transformations just listed. Equation (5.16) and the simultaneous prefix identities show that

#[#set math.equation(numbering: n => "(5.17)")
 $ 1_(cal(S)) \( c_(a h) \) = 1_(cal(S)) \( c_h \) #h(2em) \( a in cal(K) \, med h in cal(H) \) $ <eq:palette-indicator-generated>]

on one set of full measure. This assertion is obtained by composing finite-coordinate identities; it does not assume that $mu$ is invariant under the whole group $cal(K)$.

Fix $xi in U \( k \)$. The commutative algebra $E = L \( xi \)$ is a field, since $D$ is division, and it is stable under $*$ because $xi^(*) = xi^(- 1)$. Let $E_0$ be its fixed field, so $E = L E_0$ and $\[ E : E_0 \] = 2$. Write $E^1$ for its norm-one group to $E_0$. Choose $n_0 in E^1 ∩ ker phi.alt$ whose finite Cayley coordinate $x_0 in E_0$ generates $E_0$ over $k$. Such a choice is possible: the rational norm-one torus is Zariski dense by its Cayley parametrization, the power map on that torus is dominant, and powers of an exponent killing $cal(F)$ lie in $ker phi.alt$. The requirement that $x_0$ be finite and primitive is a nonempty Zariski-open condition.

Since there are only finitely many colors, choose $t_0 in k$ for which the set

$ I = { s in k : phi.alt \( tau_s n_0 \) = phi.alt \( tau_(t_0) n_0 \) } $

is infinite. For each $s in I$, the word

#[#set math.equation(numbering: n => "(5.18)")
 $ H_s = L_(n_0)^(- 1) tau_s^(- 1) L_(\( tau_s n_0 \) \( tau_(t_0) n_0 \)^(- 1)) tau_(t_0) L_(n_0) $ <eq:palette-affine-word>]

belongs to $cal(K)$. Both indicated left rotations have kernel parameters. The word successively sends $1$ to $n_0$, to $tau_(t_0) n_0$, to $tau_s n_0$, to $n_0$, and back to $1$. It is represented by a fractional matrix over $E$; fixing $1$ in the unitary chart means fixing infinity in the additive chart. Its latter matrix is therefore upper triangular, say

$ mat(delim: "(", alpha, gamma; 0, beta) \, #h(2em) alpha \, beta in E^times . $

On the commutative $E_0$-chart its affine multiplier is

#[#set math.equation(numbering: n => "(5.19)")
 $ a_s = alpha / beta = frac(\( x_0 + t_0 \)^2 - i^2, \( x_0 + s \)^2 - i^2) in E_0^times . $ <eq:palette-affine-multiplier>]

To check the multiplier, use $q' \( x \) \/ q \( x \) = - 2 i \/ \( x^2 - i^2 \)$ in Equation (5.18). The derivative at $u = 1$ is $\( \( x_0 + s \)^2 - i^2 \) \/ \( \( x_0 + t_0 \)^2 - i^2 \)$; the affine multiplier at infinity is its reciprocal. All denominators are nonzero because $x_0 + s in E_0$ whereas $i in.not E_0$.

This commutative calculation produces transformations on the full noncommutative chart, not merely on $E_0$. Conjugating $T_(s')$ by the upper triangular matrix gives the matrix

$ mat(delim: "(", 1, alpha s' beta^(- 1); 0, 1) = mat(delim: "(", 1, s' a_s; 0, 1) #h(2em) \( s' in k \) \, $

since $s'$ is central. Thus $cal(K)$ contains translations by every $k$-multiple of $a_s$, and hence by their $k$-linear span.

That span is all of $E_0$. Indeed suppose a nonzero $k$-linear functional on $E_0$ annihilated all the $a_s$ with $s in I$. Extend scalars to an algebraic closure and write this functional as a linear combination of the distinct embeddings of $E_0$, which may be extended while fixing $L$. Put $x_j$ for the corresponding distinct conjugates of $x_0$. We obtain a linear combination, zero for infinitely many $s$, of the rational functions

#[#set math.equation(numbering: n => "(5.20)")
 $ frac(\( x_j + t_0 \)^2 - i^2, \( x_j + s \)^2 - i^2) . $ <eq:palette-reciprocal-quadratics>]

It must vanish identically. These functions are linearly independent. Their poles are $- x_j + i$ and $- x_j - i$. Poles from distinct denominators can coincide only when the corresponding centers differ by $2 i$ or $- 2 i$. The resulting finite components form chains: each center has at most one successor and predecessor, and characteristic zero excludes cycles. An endpoint pole belongs to just one denominator, so its coefficient in any linear relation is zero. Remove that denominator and repeat along the chain. All numerators in Equation (5.20) are nonzero, so every coefficient vanishes, the required contradiction. Consequently $cal(K)$ contains all $E_0$-translations.

Left rotation by $- 1$ belongs to $cal(K)$, because $- 1$ is a central kernel scalar. In the additive chart it is $x mapsto i^2 \/ x$, represented by an antidiagonal matrix over $k$. It conjugates all upper $E_0$-unipotents to all lower $E_0$-unipotents. These generate $"SL"_2 \( E_0 \)$, so $cal(K)$ contains the corresponding fractional transformations of the full chart. In particular it contains the transformation whose matrix in the unitary chart is $"diag" \( xi \, xi^(- 1) \)$: its conjugate by the Cayley change of basis is

$ 1 / 2 mat(delim: "(", xi + xi^(- 1), i \( xi - xi^(- 1) \); \( xi - xi^(- 1) \) \/ i, xi + xi^(- 1)) in "SL"_2 \( E_0 \) . $

Its action is $u mapsto xi u xi$. Composing with the allowed conjugation $u mapsto xi u xi^(- 1)$ gives $u mapsto xi^2 u$. Hence

#[#set math.equation(numbering: n => "(5.21)")
 $ L_(xi^2) in cal(K) #h(2em) \( xi in U \( k \) \) . $ <eq:palette-left-squares>]

#proof[
  All the preceding constructions were made under the assumption that $phi.alt$ exists. Choose a palette satisfying the simultaneous identities in Equation (5.17). Such palettes have probability one by Proposition 27 and the recurrence argument. Equations (5.17) and (5.21), together with the exact left-rotation palette rule, make membership in $cal(S)$ invariant under left multiplication by every square in $cal(F)$, at all prefixes. The subgroup generated by all squares is characteristic and nontrivial in the nonabelian simple group $cal(F)$: a group in which every square is $1$ is abelian. Thus the squares generate $cal(F)$. Starting at the identity coordinate of the chosen palette, their left multiplications run through every color. The membership indicator would therefore have the same value on all of $cal(F)$, contrary to $cal(S)$ being nonempty and proper. This contradiction proves the theorem, subject to Lemma 26, whose proof follows. ◻
]

== 6 The finite simple-group obstruction <sec:finite-groups>

We prove Lemma 26. The argument uses the classification of finite simple groups [1] Classification Theorem, p. 737. Two elementary tests handle the alternating, linear, and sporadic families. A counting argument in a full unitary group handles the other classical families, and small maximal tori handle the exceptional families.

Throughout this section, $cal(F)$ is a finite nonabelian simple group, $C \( B \) = C_(cal(F)) \( B \)$, and

$ I \( cal(F) \) = { g in cal(F) : g^2 = 1 } \, #h(2em) k \( cal(F) \) = upright("the number of conjugacy classes of ") cal(F) . $

For commuting $W \, Z in cal(F)$, the condition to be excluded is

#[#set math.equation(numbering: n => "(6.1)")
 $ Z W in C \( B \) \( Z W^(- 1) \) C \( B Z^2 \) quad upright("for every ") B in cal(F) . $ <eq:finite-relation>]

The choice of the nonempty proper conjugacy-invariant set $cal(S)$ will be specified in each family. In every case we show that Equation (6.1) is incompatible with $W in cal(S)$ and $Z in.not cal(S)$.

=== 6.1 Two elementary tests <two-elementary-tests>

First take

#[#set math.equation(numbering: n => "(6.2)")
 $ cal(S) = { W in cal(F) : W^2 eq.not 1 } . $ <eq:finite-square-set>]

This set is nonempty, since a group of exponent two is abelian, and it does not contain the identity. For commuting $W in cal(S)$ and $Z in.not cal(S)$, put $v = Z W$. Then $Z^2 = 1$, $v^2 = W^2 eq.not 1$, and Equation (6.1) becomes

#[#set math.equation(numbering: n => "(6.3)")
 $ v in C \( B \) v^(- 1) C \( B \) quad upright("for every ") B in cal(F) . $ <eq:finite-inverse-coset>]

Suppose that $cal(F)$ acts on a set and that some point $p$ satisfies $v^2 p eq.not p$. If $C \( B \)$ fixes $p$ and $v p$ pointwise, writing $v = a v^(- 1) b$ with $a \, b in C \( B \)$ gives $v p = a v^(- 1) p$. Applying $a^(- 1)$ gives $v p = v^(- 1) p$, a contradiction. We call this the point-pair test. We will also use its incidence version: if $C \( B \)$ fixes a line $p$ and preserves a subspace $L$, while $v p subset L$ and $v^(- 1) p subset.not L$, the same equation is impossible.

The second test uses a self-centralizing abelian subgroup.

#thm([Lemma 6.1.])[
  #emph[Suppose that $C subset cal(F)$ is an abelian subgroup of odd order $c > 1$ such that $C_(cal(F)) \( t \) = C$ for every $1 eq.not t in C$. If 
#[#set math.equation(numbering: n => "(6.4)")
 $ \| cal(F) \| > k \( cal(F) \) c^4 \, $ <eq:finite-class-bound>]

 then the union $cal(S)$ of the conjugates of $C \\ { 1 }$ has the property required in Lemma 26.]
] <lem:finite-abelian-test>

#proof[
  The set is nonempty and excludes the identity. If $W in cal(S)$ and $Z$ commutes with $W$, then $Z$ lies in the same conjugate of $C$ as $W$. Consequently $Z in.not cal(S)$ forces $Z = 1$.
  Conjugate $W$ into $C$. Testing Equation (6.3) with every conjugate of a fixed nonidentity element of $C$ shows that every conjugate $v$ of $W$ belongs to $C v^(- 1) C$. If $v = a v^(- 1) b$, $a \, b in C$, then
  $ \( v b^(- 1) \)^2 = a b^(- 1) in C . $
  If this square is nonidentity, $v b^(- 1)$ centralizes a nonidentity element of $C$, so $v in C$. Otherwise $v in I \( cal(F) \) C$. Since $I \( cal(F) \)$ is conjugacy-invariant, $I \( cal(F) \) C = C I \( cal(F) \)$. Thus the whole conjugacy class of $W$ lies in $C I \( cal(F) \)$, and
  $ frac(\| cal(F) \|, c) lt.eq c \| I \( cal(F) \) \| . $
  The Frobenius–Schur formula and Cauchy–Schwarz give
  $ \| I \( cal(F) \) \| = sum_(chi in "Irr" \( cal(F) \)) nu_2 \( chi \) chi \( 1 \) lt.eq sum_chi chi \( 1 \) lt.eq sqrt(k \( cal(F) \) \| cal(F) \|) . $
  These inequalities contradict Equation (6.4). ◻
]

=== 6.2 Alternating, linear, and sporadic groups <alternating-linear-and-sporadic-groups>

For alternating and projective special linear groups we use Equation (6.2). In $A_n$, choose $p$ with $v^2 p eq.not p$. There is an even permutation $B$ fixing exactly $p \, v p$ and having distinct odd cycle lengths greater than one on the remaining points, except when $n = 6$ or $8$. Indeed, for odd $n$ use the single cycle of length $n - 2$, and for even $n gt.eq 10$ use lengths $3 \, n - 5$. Every permutation centralizing these moving cycles is even on their support. Therefore a centralizer element in $A_n$ cannot interchange the two fixed points. The point-pair test applies. The two exceptions are $A_6 tilde.eq "PSL"_2 \( 9 \)$ and $A_8 tilde.eq "PSL"_4 \( 2 \)$.

Now let $cal(F) = "PSL"_l \( q \)$, $l gt.eq 3$. Choose a line $p$ such that $v^2 p eq.not p$. The three lines $p \, v p \, v^(- 1) p$ are distinct. A hyperplane $L$ can be chosen to contain $v p$ and contain neither $p$ nor $v^(- 1) p$: in the quotient by $v p$, choose a linear functional nonzero on both remaining nonzero vectors. The union of two proper hyperplanes in the dual is not the entire dual, also over $bb(F)_2$.

On the direct sum $p xor L$, take $B$ to be the identity on $p$ and an irreducible norm-one field multiplication on $L$. Such an element exists in the cyclic group of order $\( q^(l - 1) - 1 \) \/ \( q - 1 \)$: a generator cannot lie in a proper subfield, since that group’s order exceeds $q^(\( l - 1 \) \/ 2) - 1$ when $l - 1 gt.eq 2$. A projective centralizer of $B$ is an actual centralizer. Indeed, scalar multiplication must preserve its unique base-field eigenvalue, which is $1$, and hence the multiplier is $1$. The centralizer fixes $p$ and preserves $L$, contradicting the incidence version of Equation (6.3).

For simple $"PSL"_2 \( q \)$, the pointwise stabilizer of two points of the projective line is a split torus. It contains an element whose centralizer fixes both points, unless $q = 5$: its order is $q - 1$ for even $q$ and $\( q - 1 \) \/ 2$ for odd $q$, and a noninvolution in it is regular with that torus as centralizer. The case $q = 5$ is $A_5$. Choosing the torus for $p \, v p$ proves the assertion in all these cases.

For the sporadic groups other than $M_12$, and also for the Tits group, Table 1 gives a prime $c$ for which a cyclic subgroup of order $c$ is the centralizer of each of its nonidentity elements. The centralizer orders, class numbers, and group orders are those in the #emph[Atlas] and the online #emph[ATLAS of Finite Group Representations] [9,45]. In each row, an element $x$ in the class labeled $c upright(A)$ in that group’s conjugacy-class table has $C \( x \) = chevron.l x chevron.r$ of order $c$. Since $c$ is prime, every nonidentity power of $x$ has the same centralizer. The displayed $k$ is the exact class number. In every row the group order exceeds $k c^4$, so Lemma 29 applies. For example, the smallest margin is $10 dot.op 5^4 = 6250 < 7920 = \| M_11 \|$. One may also check the other inequalities using $k lt.eq 200$, except that $k lt.eq 25$ suffices for $M_22 \, M_23 \, J_1$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 6,
  align: (left, right, right, left, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Group
], table.cell(rowspan: 1, colspan: 1)[$c$
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[Group
], table.cell(rowspan: 1, colspan: 1)[$c$
], table.cell(rowspan: 1, colspan: 1)[$k$
]),
  table.cell(rowspan: 1, colspan: 1)[$M_11$
], table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[$upright(O' N)$
], table.cell(rowspan: 1, colspan: 1)[31
], table.cell(rowspan: 1, colspan: 1)[30
],
  table.cell(rowspan: 1, colspan: 1)[$M_22$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[$upright("Co")_1$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[101
],
  table.cell(rowspan: 1, colspan: 1)[$M_23$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[$upright("Co")_2$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[60
],
  table.cell(rowspan: 1, colspan: 1)[$M_24$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[$upright("Co")_3$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[42
],
  table.cell(rowspan: 1, colspan: 1)[$J_1$
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[$upright("Fi")_22$
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[65
],
  table.cell(rowspan: 1, colspan: 1)[$J_2$
], table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[$upright("Fi")_23$
], table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[98
],
  table.cell(rowspan: 1, colspan: 1)[$J_3$
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[$upright("Fi")'_24$
], table.cell(rowspan: 1, colspan: 1)[29
], table.cell(rowspan: 1, colspan: 1)[108
],
  table.cell(rowspan: 1, colspan: 1)[$J_4$
], table.cell(rowspan: 1, colspan: 1)[43
], table.cell(rowspan: 1, colspan: 1)[62
], table.cell(rowspan: 1, colspan: 1)[$upright("HN")$
], table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[54
],
  table.cell(rowspan: 1, colspan: 1)[$upright("HS")$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[$upright("Ly")$
], table.cell(rowspan: 1, colspan: 1)[67
], table.cell(rowspan: 1, colspan: 1)[53
],
  table.cell(rowspan: 1, colspan: 1)[$upright("McL")$
], table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[$upright("Th")$
], table.cell(rowspan: 1, colspan: 1)[31
], table.cell(rowspan: 1, colspan: 1)[48
],
  table.cell(rowspan: 1, colspan: 1)[$upright("He")$
], table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[33
], table.cell(rowspan: 1, colspan: 1)[$bb(B)$
], table.cell(rowspan: 1, colspan: 1)[47
], table.cell(rowspan: 1, colspan: 1)[184
],
  table.cell(rowspan: 1, colspan: 1)[$upright("Ru")$
], table.cell(rowspan: 1, colspan: 1)[29
], table.cell(rowspan: 1, colspan: 1)[36
], table.cell(rowspan: 1, colspan: 1)[$bb(M)$
], table.cell(rowspan: 1, colspan: 1)[71
], table.cell(rowspan: 1, colspan: 1)[194
],
  table.cell(rowspan: 1, colspan: 1)[$upright("Suz")$
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[43
], table.cell(rowspan: 1, colspan: 1)[$zws^2 F_4 \( 2 \)'$
], table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[22
],
)
]],
  caption: [Table 1: Self-centralizing prime-order subgroups for the sporadic and Tits groups. ],
)

For $M_12$ use its sharply $5$-transitive action of degree $12$ and the #emph[Atlas] class $8 B$, of cycle shape $1^2 thin 2 thin 8$ [9,45]; in the online database these are the $M_12$ degree-$12$ representation and its class $8 B$. An element centralizing $B in 8 B$ restricts to a cyclic shift on its eight-point orbit. This restriction is injective: its kernel fixes eight points, and an element fixing five points is the identity. The centralizer is therefore exactly $chevron.l B chevron.r$, and fixes the two fixed points individually. Two-transitivity moves this pair to $p \, v p$, so the point-pair test applies with Equation (6.2).

=== 6.3 An auxiliary unitary count <an-auxiliary-unitary-count>

The remaining classical groups need a torus argument on a large irreducible block. The relevant obstruction takes place in the full unitary isometry group, which need not itself be simple.

#thm([Lemma 6.2.])[
  #emph[Let $p gt.eq 3$ be an odd prime, let $H = "U"_p \( q \)$ be the full isometry group of a nondegenerate Hermitian form over $bb(F)_(q^2)$, and let $T subset H$ be an irreducible torus of order $q^p + 1$. If $w in T$ has field degree $p$ over $bb(F)_(q^2)$, then 
$ w in T^h w^(- 1) T^h quad upright("for every ") h in H $

 is impossible.]
] <lem:finite-unitary-count>

#proof[
  Put
  $ overline(H) = H \/ Z \( H \) \, #h(2em) overline(T) = T \/ Z \( H \) \, #h(2em) c = frac(q^p + 1, q + 1) \, #h(2em) d = \( p \, q + 1 \) . $
  The actual centralizer of $w$ is $T$. If $g$ centralizes its projective image, then $g w g^(- 1) = lambda w$ for a scalar $lambda$ of norm one. Taking determinants gives $lambda^p = 1$, so
  #[#set math.equation(numbering: n => "(6.5)")
   $ \| C_(overline(H)) \( overline(w) \) \| lt.eq d c . $ <eq:finite-unitary-centralizer>]
  Suppose the displayed condition in the lemma holds. Every conjugate $v$ of $w$ then lies in $T v^(- 1) T$. The calculation used in Lemma 29 gives an element $u = v b^(- 1)$ whose square lies in $T$. If $u^2$ is nonscalar, it has field degree $p$, because $p$ is prime; its centralizer is $T$, and hence $u in T$. If $u^2$ is scalar, $overline(u)$ has square one. Consequently the entire projective conjugacy class of $overline(w)$ lies in $overline(T) I \( overline(H) \)$.
  The determinant quotient of $overline(H)$ has order $d$, and $overline(T)$ maps onto it. To see this, write $T$ as the norm-one subgroup of $bb(F)_(q^(2 p))^times$ over $bb(F)_(q^p)$. The determinant of a field multiplication is its norm to $bb(F)_(q^2)$. On this torus, that norm takes a generator to a generator of the scalar norm-one group of order $q + 1$; its exponent is congruent to $c$ modulo $q^p + 1$. Modding out by scalar matrices mods the determinant out by $p$th powers, giving the quotient of order $d$.
  All members of the conjugacy class have the same determinant in this quotient. For each fixed $i in I \( overline(H) \)$, at most $c \/ d$ elements $t in overline(T)$ have $t i$ with that determinant. Combining this with Equation (6.5) gives
  $ frac(\| overline(H) \|, d c) lt.eq c / d \| I \( overline(H) \) \| \, #h(2em) upright("and therefore") #h(2em) \| overline(H) \| lt.eq c^2 \| I \( overline(H) \) \| . $
  We show that the reverse strict inequality always holds.
  Every projective involution lifts to an involution in $H$. Indeed, if $g^2 = alpha I$, then $alpha^p = det \( g \)^2$ in the scalar cyclic group of order $q + 1$. As $p$ is odd, $alpha$ is a square in that group, and scalar rescaling gives an involution.
  For odd $q$, an involution is determined up to conjugacy by the dimensions $a \, p - a$ of its two nondegenerate eigenspaces. Projectively the unordered partitions are indexed by $1 lt.eq a < p \/ 2$, and their centralizers have order at least
  #[#set math.equation(numbering: n => "(6.6)")
   $ frac(\| "U"_a \( q \) \| thin \| "U"_(p - a) \( q \) \|, q + 1) . $ <eq:finite-unitary-odd-centralizer>]
  For even $q$, the Jordan type is $2^a 1^b$, where $b = p - 2 a$. Its full unitary centralizer has order
  #[#set math.equation(numbering: n => "(6.7)")
   $ q^(a^2 + 2 a b) \| "U"_a \( q \) \| thin \| "U"_b \( q \) \| . $ <eq:finite-unitary-even-centralizer>]
  Here is the structure behind this formula. In the ambient general linear group the connected matrix centralizer has reductive quotient $"GL"_a times "GL"_b$ and unipotent radical of dimension $a^2 + 2 a b$. The Hermitian Frobenius gives the unitary forms on both multiplicity spaces. Equivalently, for $g = 1 + N$ of order two, $N = N^(*)$; the induced forms on $ker N \/ "im" N$ and, using $N$, on the quotient by $ker N$ are the forms on these two spaces. Nondegenerate Hermitian forms of a given dimension over a finite field are isometric. Connectedness and Lang’s theorem give one full-unitary class for each occurring type and the stated order. Dividing by $q + 1$ gives a lower bound for its projective centralizer.
  The unitary order formula implies
  #[#set math.equation(numbering: n => "(6.8)")
   $ \| "U"_j \( q \) \| = q^(j^2) product_(r = 1)^j \( 1 - \( - q \)^(- r) \) gt.eq q^(j^2) . $ <eq:finite-unitary-order-lower>]
  For completeness, pair consecutive factors: their product is
  $ \( 1 + q^(- \( 2 r - 1 \)) \) \( 1 - q^(- 2 r) \) = 1 + q^(- 2 r) \( q - 1 - q^(- \( 2 r - 1 \)) \) > 1 . $
  An unpaired final factor also exceeds one. Thus every nonidentity projective involution class has centralizer order at least
  $ M = frac(q^(\( p^2 + 1 \) \/ 2), q + 1) . $
  There are at most $\( p - 1 \) \/ 2$ such classes, and including the identity gives
  $ frac(\| I \( overline(H) \) \|, \| overline(H) \|) lt.eq frac(p + 1, 2 M) . $
  When $p gt.eq 5$, we have $c < q^(p - 1)$ and
  $ M / q^(2 p - 2) = frac(q^(\( p^2 - 4 p + 5 \) \/ 2), q + 1) gt.eq 2^p / 3 > frac(p + 1, 2) . $
  The first inequality uses $\( p^2 - 4 p + 5 \) \/ 2 gt.eq p$ and monotonicity in $q gt.eq 2$. This proves $c^2 \| I \( overline(H) \) \| < \| overline(H) \|$.
  It remains to check $p = 3$. Now
  $ c = q^2 - q + 1 \, #h(2em) h = \| overline(H) \| = q^3 \( q^3 + 1 \) \( q^2 - 1 \) . $
  There is one nonidentity involution class. In odd characteristic its centralizer lower bound is $M = q \( q - 1 \) \( q + 1 \)^2$, and $h \/ M = q^2 c$. In even characteristic it is $M = q^3 \( q + 1 \)$, and $h \/ M = \( q^2 - 1 \) c$. In both cases $\| I \( overline(H) \) \| lt.eq 1 + q^2 c$, whereas
  $ h - c^2 \( 1 + q^2 c \) = c #scale(x: 120%, y: 120%)[\(] \( 3 q - 4 \) q^4 + \( q - 2 \) q^2 + q - 1 #scale(x: 120%, y: 120%)[\)] > 0 quad \( q gt.eq 2 \) . $
  This includes $"U"_3 \( 2 \)$ and finishes the proof. ◻
]

=== 6.4 Symplectic and orthogonal groups <symplectic-and-orthogonal-groups>

Let $cal(F)$ be a projective symplectic or orthogonal simple group on its natural space of dimension $2 l$ or $2 l + 1$. We first treat $l gt.eq 3$, using the standard low-rank identifications and treating $"PSp"_4$ separately below. Choose an odd prime

#[#set math.equation(numbering: n => "(6.9)")
 $ l \/ 2 < p lt.eq l \, $ <eq:finite-block-prime>]

requiring $p < l$ in plus orthogonal type. For $l gt.eq 4$, set $m = floor.l l \/ 2 floor.r gt.eq 2$. Bertrand’s postulate gives $m < p < 2 m$, hence $l \/ 2 < p < l$, and this prime is odd. For $l = 3$ take $p = 3$, apart from plus type, which is $"PSL"_4$ and has already been treated. In odd-dimensional orthogonal type we may assume odd characteristic, since in even characteristic the group has the corresponding symplectic realization.

We use a nondegenerate block $E$ of dimension $2 p$ carrying a torus of order $q^p + 1$. In orthogonal type this block has minus type; the complement can be chosen with the sign needed for the ambient form. For minus type $p = l$ the block is the whole space, whereas the requirement $p < l$ in plus type leaves a complement of the necessary sign. The torus is the norm-one subgroup of $bb(F)_(q^(2 p))^times$ over $bb(F)_(q^p)$, acting on $E$ by field multiplication.

Define $cal(S)$ to consist of those projective elements whose square, on the natural space, has an irreducible self-dual block of dimension $2 p$. This condition is independent of the choice of a scalar lift and is conjugacy-invariant. The block is unique, because $4 p > 2 l + 1$, and is nondegenerate: its dual would otherwise require a second block of the same degree. The set excludes identity and is nonempty. Indeed, if $t$ generates the torus of order $q^p + 1$, use $t^2$ on the block and identity on the complement. Squaring meets the orthogonal component and spinor conditions, whose quotients have exponent two. Moreover $t^4$ still has degree $2 p$. To see this, the quotient of the norm-one torus by its intersection with $bb(F)_(q^2)^times$ has odd order

$ frac(q^p + 1, q + 1) > 1 . $

Thus $t^4 in.not bb(F)_(q^2)$. The only other maximal proper subfield is $bb(F)_(q^p)$, where a norm-one element is $plus.minus 1$ and hence already lies in $bb(F)_(q^2)$.

Suppose now that $W in cal(S)$, that $Z in.not cal(S)$ commutes with $W$, and that Equation (6.1) holds. Lift $W \, Z$ to natural isometries, using $Omega$ in orthogonal type. Their possible projective commutation multiplier has order at most two. They therefore commute actually with $W^2$ and preserve its unique marked block $E$. On $E$ they act as field multiplications $w \, z in bb(F)_(q^(2 p))^times$ of norm one. Since $Z in.not cal(S)$, $z^2$ lies in a proper subfield. The norm-one condition puts $z^2$ in $bb(F)_(q^2)$, and then $z$ itself is in $bb(F)_(q^2)$: its degree over that field divides both $p$ and $2$.

There is a full unitary group $H = "U"_p \( q \)$ acting on $E$ and containing its field torus $T$. One way to see this directly is to write the invariant form in field coordinates. Its bilinear form has the shape

$ "Tr"_(bb(F)_(q^(2 p)) \/ bb(F)_q) \( kappa x y^(*) \) \, #h(2em) x^(*) = x^(q^p) . $

Take the trace first to $bb(F)_(q^2)$. If the resulting form is anti-Hermitian and the characteristic is odd, multiply it by $delta in bb(F)_(q^2)^times$ with $delta^q = - delta$; this makes it Hermitian without changing its isometry group. In characteristic two an anti-Hermitian form is already Hermitian. This gives the required unitary structure. In the quadratic case the form is

$ Q \( x \) = "Tr"_(bb(F)_(q^p) \/ bb(F)_q) \( kappa x x^(*) \) \, #h(2em) kappa in bb(F)_(q^p)^times . $

In characteristic two this expression follows from the polarization and $W^2$-invariance: two invariant quadratic forms with the same polarization differ by the square of an invariant linear form, and an irreducible block of degree greater than one has no such nonzero form. These formulas show that $H$ preserves the original form on $E$. The element $z$ is a scalar of this unitary group.

For each $h in H$, choose $B$ acting on $E$ by a square of a generator of $T^h$ and as identity on the complement. This is an allowed ambient element. Even if $h$ is not in $Omega$, conjugation by an isometry preserves $Omega$, so the orthogonal component condition is unchanged. Both $B$ and $B Z^2$ have a unique marked square block $E$: multiplication of a full-degree element by a base-field scalar preserves its degree over $bb(F)_(q^2)$, and the norm-one condition then gives full degree $2 p$ over $bb(F)_q$.

Each projective centralizer of $B$ or $B Z^2$ commutes actually with its square, preserves $E$, and restricts there into $T^h$. This does not require the action on the complement to be semisimple; the complement is too small to have an irreducible factor of degree $2 p$. Restricting Equation (6.1) to $E$ and absorbing its scalar multipliers and the scalar $z$ into $T^h$ therefore gives

$ w in T^h w^(- 1) T^h quad upright("for every ") h in H . $

The element $w$ has degree $p$ over $bb(F)_(q^2)$. This contradicts Lemma 30.

=== 6.5 Projective unitary groups and rank two symplectic groups <projective-unitary-groups-and-rank-two-symplectic-groups>

Let $cal(F) = "PSU"_l \( q \)$, $l gt.eq 3$, excluding the nonsimple pair $\( l \, q \) = \( 3 \, 2 \)$. Choose an odd prime $l \/ 2 < p lt.eq l$. Define $cal(S)$ by requiring the square of a natural lift to have an irreducible block of degree $p$ over $bb(F)_(q^2)$. As above this block is unique and nondegenerate. If $l > p$, the determinant of a chosen torus element on the block can be corrected on its nonzero dimensional orthogonal complement. If $l = p$, use instead the determinant-one torus of order

$ c = frac(q^p + 1, q + 1) . $

Its scalar intersection has order $d = \( p \, q + 1 \)$. Except for $\( p \, q \) = \( 3 \, 2 \)$, $c > d$: for $p gt.eq 5$, $c gt.eq q^(p - 2) \( q - 1 \) + 1 gt.eq 2^(p - 2) + 1 > p$, and for $p = 3 \, q gt.eq 3$, $c gt.eq 7 > 3$. As $c$ is odd, a generator and its square are both nonscalar and hence have degree $p$. This proves that $cal(S)$ is nonempty; it again excludes identity.

We check the projective-centralizer issue before applying the block argument. Suppose $g A g^(- 1) = lambda A$, where $A in "SU"_l \( q \)$ has the marked square block. Multiplication by a base-field scalar preserves irreducible degrees, so $g$ preserves the unique block. The determinant on the block gives $lambda^p = 1$, and the total determinant gives $lambda^l = 1$. If $l > p$, then $p < l < 2 p$, so these conditions force $lambda = 1$. If $l = p$ and $lambda eq.not 1$, multiplication by $lambda$ cycles all $p$ distinct eigenvalues. Their product is $w^p$, since $p$ is odd, and determinant one gives $w^p = 1$. But $lambda$ has order $p$ in the scalar group, so $p divides q + 1$; all $p$th roots of unity then lie in $bb(F)_(q^2)$, contradicting the full degree of $w$. Thus these projective centralizers are actual centralizers on the block.

For commuting $W in cal(S)$ and $Z in.not cal(S)$, the restrictions are consequently field scalars $w \, z$, with $z in bb(F)_(q^2)$ by the same odd-degree argument as before. For every conjugate $T^h$ in the full block unitary group choose $B$ with irreducible square on that torus, correcting its determinant on the complement if necessary. The square of $B Z^2$ retains full degree. Applying the preceding projective-centralizer argument to $B$ and $B Z^2$, Equation (6.1) restricts to the relation prohibited by Lemma 30.

For $"PSp"_4 \( q \)$ take $cal(S)$ to be the set whose square is irreducible on the natural four-dimensional space. It is nonempty by the torus of order $q^2 + 1$ and excludes identity. Lifting a commuting pair $W in cal(S)$, $Z in.not cal(S)$ gives norm-one field scalars $w \, z in bb(F)_(q^4)^times$. Since $z^2 in bb(F)_(q^2)$, the norm-one condition gives $z^2 = plus.minus 1$. Thus $Z^2 = 1$ projectively, and $v = Z W$ still has an irreducible square.

Choose a nonzero vector $x$ such that $x \, v x$ span an isotropic plane $L$. Such an $x$ exists in the field description of the alternating form: the condition $"Tr"_(bb(F)_(q^4) \/ bb(F)_q) \( kappa x \( v x \)^(*) \) = 0$ is one homogeneous $bb(F)_q$-linear condition on $x x^(*) in bb(F)_(q^2)$. It has a nonzero solution, and the field norm $x mapsto x x^(*)$ is surjective. Irreducibility ensures that $x \, v x$ are independent and that $v^(- 1) x in.not L$; otherwise $v$ would satisfy a quadratic polynomial.

Choose a regular unipotent $B$ whose unique line-plane flag is $chevron.l x chevron.r subset L$. Its existence in every characteristic can be seen in a symplectic flag basis from the matrix

$ mat(delim: "(", 1, 1, 0, 0; 0, 1, 1, - 1; 0, 0, 1, - 1; 0, 0, 0, 1) \, $

for the alternating form with nonzero upper anti-diagonal entries $1 \, 1$. This matrix preserves the form and has one Jordan block, also in characteristic two. Its centralizer preserves $ker \( B - 1 \) = chevron.l x chevron.r$ and $ker \( \( B - 1 \)^2 \) = L$. A projective centralizer is actual, since a scalar multiple of a unipotent matrix can have the same eigenvalues only when the scalar is one. The incidence test now contradicts Equation (6.3). The nonsimple group $"Sp"_4 \( 2 \)$ is not needed; its simple derived group is $A_6$.

=== 6.6 Small tori in exceptional groups <small-tori-in-exceptional-groups>

We have proved the obstruction for all classical simple groups. For most exceptional families we apply Lemma 29 to a rational maximal torus. We use the usual simply connected algebraic realization followed by its central quotient. Rational tori are obtained by Weyl-group twisting, and their orders are determinants of the Frobenius action minus one on their character lattices; see [39] and [19] Propositions 25.1–25.3. Semisimple centralizers in a simply connected semisimple group are connected [38] Section 2.10. The tori below and their self-centralizing property in the simple quotient occur in [36] Corollary 8.2 and Lemma 8.7. We verify that property here by a root-lattice estimate before applying Lemma 29. Their orders outside type $G_2$ are also recorded in [13] Section 3; the two $G_2$ orders follow directly from its order-three and order-six Weyl actions.

Write $Phi_j$ for the $j$th cyclotomic polynomial. Use the tori in Table 2, before passing to the central quotient. For $G_2 \( q \)$ choose the sign avoiding a factor $3$, and for $q = 3$ choose the smaller order $7$.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Group
], table.cell(rowspan: 1, colspan: 1)[Torus order
], table.cell(rowspan: 1, colspan: 1)[Weyl action
]),
  table.cell(rowspan: 1, colspan: 1)[$G_2 \( q \)$, $q gt.eq 3$
], table.cell(rowspan: 1, colspan: 1)[$q^2 plus.minus q + 1$
], table.cell(rowspan: 1, colspan: 1)[Order $3$ or $6$
],
  table.cell(rowspan: 1, colspan: 1)[$zws^3 D_4 \( q \) \, F_4 \( q \)$
], table.cell(rowspan: 1, colspan: 1)[$Phi_12 \( q \)$
], table.cell(rowspan: 1, colspan: 1)[Characteristic polynomial $Phi_12$
],
  table.cell(rowspan: 1, colspan: 1)[$zws^epsilon.alt E_6 \( q \)$
], table.cell(rowspan: 1, colspan: 1)[$Phi_9 \( epsilon.alt q \)$
], table.cell(rowspan: 1, colspan: 1)[$Phi_9$, with diagram sign
],
  table.cell(rowspan: 1, colspan: 1)[$E_8 \( q \)$
], table.cell(rowspan: 1, colspan: 1)[$Phi_30 \( q \)$
], table.cell(rowspan: 1, colspan: 1)[Coxeter action
],
)
]],
  caption: [Table 2: Tori used for the exceptional simple groups; $epsilon.alt = 1$ denotes split $E_6$ and $epsilon.alt = - 1$ twisted $E_6$. ],
)

These actions are irreducible over $bb(Q)$. For $G_2 \, F_4 \, E_8$ use a Coxeter element or an appropriate power. In trialitarian $D_4$, let $b$ be the central node, $a$ an outer node, and $gamma$ the diagram cycle of the outer nodes. The action $s_a s_b gamma$ has characteristic polynomial $X^4 - X^2 + 1$. For $E_6$, the regular order-nine Weyl element in Springer’s tables [37] Section 5.4, Table 1 has a primitive ninth-root eigenvalue. Its rational characteristic polynomial, of degree six, is therefore $Phi_9$. Its negative belongs to the nontrivial diagram coset and gives the twisted case.

After passing to the central quotient, dividing by $\( 3 \, q - epsilon.alt \)$ in type $E_6$, every prime divisor of these torus orders is a primitive cyclotomic prime. Their respective lower bounds are

$ 7 \, #h(2em) 13 \, #h(2em) 19 \, #h(2em) 31 . $

Indeed a prime dividing $Phi_m \( q \)$ either has multiplicative order $m$ for $q$ modulo that prime, or is an exceptional prime dividing $m$. The displayed polynomials have no such exceptional factor except for $3$ in $Phi_9 \( epsilon.alt q \)$; when present this factor has valuation one and is exactly removed by the center. All resulting torus orders are odd and greater than one.

We next prove that #emph[every] nonidentity element of each resulting torus has centralizer exactly that torus. It suffices to do so for an element $t$ of prime order $r$ upstairs, with $r$ one of these primitive primes. If a root $alpha$ vanished on $t$, Frobenius invariance would make every root in its twisted Weyl orbit vanish on $t$. By irreducibility that orbit spans the rational character space. Choose a linearly independent subset. The lattice it generates has full rank in the weight lattice, and its index must be divisible by $r$, since evaluation at $t$ is a nontrivial character of order $r$ trivial on this sublattice.

Normalize long roots to have squared length two. Hadamard’s inequality bounds these lattice indices by

#[#set math.equation(numbering: n => "(6.10)")
 $ 2 sqrt(3) \, #h(2em) 8 \, #h(2em) 8 sqrt(3) \, #h(2em) 16 $ <eq:finite-root-index>]

in the respective rows of Table 2. The respective weight-lattice covolumes are

$ 1 \/ sqrt(3) \, #h(2em) 1 \/ 2 \, #h(2em) 1 \/ sqrt(3) \, #h(2em) 1 . $

The second value holds for both $D_4$ and $F_4$. Each bound is smaller than the corresponding $r$. Thus $t$ is regular. Connectedness of its algebraic centralizer makes that centralizer exactly the torus.

Any nonidentity element of a torus in the simple quotient has a nontrivial prime-order power of this kind. The argument survives projective centralization: one can lift that power with order $r$ coprime to the center, and a conjugate differing from it by a central element must have that central factor equal to one, by preservation of its order. Therefore its projective centralizer is precisely the torus in the quotient. The hypotheses on $C$ in Lemma 29 are now verified.

For the numerical inequality, we use

#[#set math.equation(numbering: n => "(6.11)")
 $ k \( cal(F) \) lt.eq 100 q^l \, $ <eq:finite-exceptional-class-bound>]

where $l$ is the absolute rank. This follows, with a smaller constant, from [11] Theorem 1.1, p. 3024 for the simply connected fixed-point groups; taking a quotient cannot increase the number of conjugacy classes. The standard group order formulas [19] Tables 24.1–24.2 give

$ cal(F) & G_2 \( q \) & zws^3 D_4 \( q \) & F_4 \( q \) & zws^epsilon.alt E_6 \( q \) & E_8 \( q \)\
\| cal(F) \| > & 0.7 q^14 & 0.7 q^28 & q^52 \/ 2 & q^78 \/ 6 & q^248 \/ 2 . $

In the two small $G_2$ cases the direct comparisons are

$ \| G_2 \( 3 \) \| & = 4245696 > 100 dot.op 3^2 dot.op 7^4 \,\
\| G_2 \( 4 \) \| & = 251596800 > 100 dot.op 4^2 dot.op 13^4 . $

For $q gt.eq 5$ the chosen $G_2$ torus has order $c lt.eq 1.24 q^2$, and $0.7 q^14 > 100 q^2 \( 1.24 q^2 \)^4$ already at $q = 5$, with increasing ratio thereafter. In trialitarian type $c < q^4$, so it is enough that $0.7 q^8 > 100$, true at $q = 2$. For $F_4 \, E_6 \, E_8$ use respectively $c < q^4 \, c < 2 q^6 \, c < 2 q^8$; the displayed lower bounds exceed $100 q^l c^4$ already at $q = 2$, and thereafter with increasing ratio. This proves the desired inequality in every row, so Lemma 29 completes these families.

=== 6.7 Type $E_7$ and the Suzuki–Ree groups <type-e_7-and-the-suzukiree-groups>

For $E_7$ we transfer the torus obstruction from a suitable $E_6$ subgroup. In the simply connected algebraic group choose a maximal-rank subgroup $M$ geometrically a Levi subgroup with derived group $D_M = \[ M \, M \]$ of type $E_6$ and one-dimensional center. Both rational forms $E_6$ and $zws^2 E_6$ can be obtained: the ambient Weyl group contains $- 1$, which normalizes this subsystem and induces its nontrivial diagram option, so rational Weyl twisting gives the second form. Choose the sign $epsilon.alt$ such that $\( 3 \, q - epsilon.alt \) = 1$.

Conjugation on the derived group gives a map $pi$ from $M \( q \)$ to adjoint $zws^epsilon.alt E_6 \( q \)$. Its image is the simple group of that type. Indeed the simply connected derived subgroup already maps onto it: both the finite center and the Frobenius cohomology of its order-three algebraic center vanish under the chosen coprimality condition. Denote this finite simple image by $cal(F)_0$, and let $C_0 subset cal(F)_0$ be the torus used above. The kernel $K_M = ker pi$ is central, with order dividing a product of $q - epsilon.alt$ and powers of $3$. It has no prime factor in common with $\| C_0 \|$. Since $pi \( D_M \( q \) \) = cal(F)_0$, every element of $M \( q \)$ differs from an element of $D_M \( q \)$ by an element of $K_M$. Thus

$ M \( q \) = D_M \( q \) K_M \, #h(2em) M \( q \) \/ D_M \( q \) tilde.eq K_M \/ \( K_M ∩ D_M \( q \) \) . $

In particular, for every primitive prime $r$ dividing $\| C_0 \|$, this quotient has order prime to $r$, and every element of $r$-power order in $M \( q \)$ belongs to $D_M \( q \)$.

Define $cal(S)$ in projective $E_7 \( q \)$ to be the union of the conjugates of the images of those elements of $M \( q \)$ whose projection belongs to $C_0 \\ { 1 }$. The preimage in $M$ of the algebraic torus containing $C_0$ is a maximal torus of $M$, and also of $E_7$. Thus all these elements are semisimple. The set is nonempty by surjectivity, and it excludes identity: the ambient central elements project trivially to adjoint $E_6$.

We need their primitive-prime powers to be regular not only in $E_6$ but in $E_7$. Such a power lies in $D_M \( q \)$ by the quotient calculation just given. Every $E_7$ root restricts to a nonzero weight on this $E_6$. To check nonvanishing, the fundamental weight perpendicular to the $E_6$ subsystem has squared norm $3 \/ 2$; a root proportional to it would have rational proportionality factor of square $4 \/ 3$, impossible. The restriction has length at most $sqrt(2)$. Its orbit under the irreducible twisted Weyl action spans the six-dimensional weight space. The same index argument as in Equation (6.10) bounds the resulting weight-lattice index by $8 sqrt(3) < 19$, smaller than the primitive prime. Hence these powers are regular in $E_7$ as well.

Now conjugate $W in cal(S)$ into the specified torus in $M \( q \)$. Every element commuting with it projectively belongs to this torus: the center of simply connected $E_7$ has order at most two, so the primitive-prime power is actually centralized, and its connected centralizer is the torus. In particular a commuting $Z in.not cal(S)$ lies in $M \( q \)$ and projects to $1$ in $cal(F)_0$; a nonidentity projection would lie in $C_0$ and put $Z$ in $cal(S)$.

For each conjugate of a nonidentity element of $C_0$ in $cal(F)_0$, choose a lift $B$ in $M \( q \)$. Both $B$ and $B Z^2$ have that nonidentity projection, so the preceding regularity argument applies to each. Their projective centralizers are toral and project into the corresponding conjugate of $C_0$. Projecting Equation (6.1) to $cal(F)_0$ therefore puts the nonidentity projection $w$ of $W$ in

$ C_0^h w^(- 1) C_0^h quad upright("for every ") h in cal(F)_0 . $

The counting proof of Lemma 29, already verified for this $E_6$ group, excludes this. This proves the obstruction in $E_7$.

For the simple Suzuki and rank-one Ree groups, use Equation (6.2) and their doubly transitive rank-one BN-pair action. A pair stabilizer has a torus of order $q - 1$, containing a prime-order element of order greater than three. In Suzuki type $q = 2^(2 a + 1) gt.eq 8$, and $q - 1$ is odd and not divisible by three. In Ree type $q = 3^(2 a + 1) gt.eq 27$, the number $q - 1$ has 2-adic valuation one and an odd factor greater than one, not divisible by three.

Such a prime-order element $t$ is regular. On the standard Frobenius-stable pair torus, the exceptional Frobenius $F$ acts on roots by $F^(*) alpha = ell^j alpha'$, where $ell$ is the characteristic and $alpha'$ is a root of the opposite length; the factor $ell^j$ includes the field-Frobenius part. If $alpha \( t \) = 1$, then $F \( t \) = t$ gives $alpha' \( t \)^(ell^j) = 1$. Since the order of $t$ is prime to $ell$, also $alpha' \( t \) = 1$. The two roots are nonparallel, because a reduced root system has no parallel roots of different lengths. The index of the lattice they span in the weight lattice is at most $2 sqrt(2)$ in $B_2$ and at most $2$ in $G_2$, by the same length and covolume calculation as above. Neither index can be divisible by the chosen prime. Its centralizer is therefore the pair torus, which fixes both points individually. Choose the pair to be $p \, v p$ and apply the point-pair test.

Finally consider $zws^2 F_4 \( q \)$, $q = 2^(2 a + 1) gt.eq 8$. Let $gamma$ be the normalized diagram reversal in $F_4$. The twisted Weyl action $s_1 s_2 gamma$ has square $s_1 s_2 s_4 s_3$, a Coxeter element. The resulting finite torus $C$ is contained in the Frobenius-square torus of order $Phi_12 \( q \)$. Its order is one of the two factors

$ q^2 plus.minus sqrt(2 q^3) + q plus.minus sqrt(2 q) + 1 \, $

with the signs chosen together; these are Malle’s two cyclic tori, as recorded in [13] Theorem 8, and their orders multiply to $Phi_12 \( q \)$. Equivalently, the determinant formula bounds its order between $\( sqrt(q) - 1 \)^4$ and $4 q^2$. It is odd and greater than one. Every prime divisor is at least thirteen, and the $F_4$ root-lattice argument proves that every nonidentity element has centralizer precisely $C$. The standard group order gives $\| zws^2 F_4 \( q \) \| > q^26 \/ 2$. Also $k \( zws^2 F_4 \( q \) \) lt.eq 100 q^4$; the sharper bound $q^2 + 4 q + 17$ is given in [11] Table 1, p. 3049. Thus

$ \| zws^2 F_4 \( q \) \| > 100 q^4 \( 4 q^2 \)^4 gt.eq k \( zws^2 F_4 \( q \) \) \| C \|^4 #h(2em) \( q gt.eq 8 \) \, $

and Lemma 29 applies.

#proof[
  #emph[Completion of the proof of Lemma 26.] The classification consists of the alternating groups, the classical and exceptional groups of Lie type, and the sporadic groups. All families have been covered above. The low-rank orthogonal groups have their usual linear, unitary, or symplectic realizations; in particular plus type $l = 3$ is $"PSL"_4$, and rank two symplectic type was treated separately. The exceptional small derived simple groups are $G_2 \( 2 \)' tilde.eq "PSU"_3 \( 3 \)$, $zws^2 G_2 \( 3 \)' tilde.eq "PSL"_2 \( 8 \)$, and the Tits group, already included in Table 1. Every chosen $cal(S)$ is nonempty, proper, and conjugacy-invariant, and for it Equation (6.1) has been excluded for every commuting pair with $W in cal(S)$, $Z in.not cal(S)$. ◻
]

== 7 The remaining unitary groups <sec:unitary-induction>

We now pass from the odd-degree division case to arbitrary outer forms of type $A$. The induction is on the #emph[reduced degree], simultaneously over all number fields. Thus a special unitary group of an algebra of degree $m$ over a finite extension of $k$ is an admissible induction input whenever $m$ is smaller than the degree currently under consideration. Restriction of scalars does not change this convention.

#thm([Theorem 7.1.])[
  #emph[The Margulis–Platonov assertion holds for every simply connected absolutely almost simple group of outer type $A$ over a number field.]
] <thm:outer-a>

Write $L \/ k$ for a quadratic extension, $D$ for a central simple $L$-algebra of degree $n$, and $*$ for a unitary involution on $D$. Set $S = "SU" \( D \, * \)$ and $U = "U" \( D \, * \)$. We continue to write $i in L^times$ for a fixed element with $i^(*) = - i$. By the established isotropic cases and Proposition 5, it suffices to assume that $S$ is $k$-anisotropic and prove $V_0 \/ R = 1$, where $R = S \( k \)^e$ is an abstract power subgroup. In this section a group element is said to be #emph[killed] when its image in the finite group $S \( k \) \/ R$ is trivial. Lemma 6 will be used for smaller special groups and their restrictions of scalars. Its local power criterion applies to their images in $S$ as well.

The degree-two case is an established inner type $A_1$ case of Theorem 3. For odd division degree, Proposition 12 and Theorems 16 and 25 give $V_0 \/ R = 1$. Three arguments remain: a ternary split-algebra case, the odd matrix-algebra case, and the even-degree induction step.

=== 7.1 Uniform local power roots <uniform-local-power-roots>

Some of the smaller subgroups below vary with the element being factored. The following observation allows their local neighborhoods to be chosen in the fixed ambient algebra before those subgroups are constructed.

#thm([Lemma 7.2.])[
  #emph[Fix a completion $k_v$, a finite-dimensional matrix realization of $D$, and an integer $e gt.eq 1$. There is a neighborhood of $1$ with the following property. An element in that neighborhood which belongs to one of the unitary or special unitary subgroups arising from a $*$-stable subalgebra of $D$, or from an invariant summand of its Hermitian module, has an $e$-th root in the same subgroup. The neighborhood can be chosen uniformly for all such subalgebras and summands of the bounded degrees occurring here.]
] <lem:unitary-uniform-roots>

#proof[
  In a sufficiently small matrix neighborhood, the convergent series $\( 1 + X \)^(1 \/ e)$ defines the root close to $1$. A finite-dimensional local subalgebra is closed, so the series stays in every subalgebra containing $X$. Uniqueness of the root close to $1$ gives $\( a^(1 \/ e) \)^(*) = \( a^(*) \)^(1 \/ e) = \( a^(1 \/ e) \)^(- 1)$ when $a^(*) = a^(- 1)$. The same series is the identity on a summand where $a$ is the identity.
  For a special group, the reduced determinant of the root has $e$-th power $1$. All its reduced eigenvalues occur among the ambient eigenvalues, and all are close to $1$ over the local algebraic closure when the ambient matrix is sufficiently close to $1$. There are at most $n$ eigenvalues in each reduced determinant. Shrinking the fixed neighborhood therefore makes all the relevant determinants lie in a neighborhood containing no $e$-th root of unity other than $1$. This proves the special condition uniformly, including after restriction of scalars. ◻
]

=== 7.2 Ternary Hermitian forms <ternary-hermitian-forms>

#thm([Proposition 7.3.])[
  #emph[If $D = M_3 \( L \)$, then $V_0 \/ R = 1$.]
] <prop:unitary-ternary>

#proof[
  At every finite place a ternary Hermitian space is isotropic, so $A$ is empty and $V_0 = S \( k \)$. We may assume that the global form is anisotropic. Use the convention that its pairing $chevron.l med \, med chevron.r$ is linear in the first variable. Scale the form so that a fixed vector $x$ has norm $1$, and choose $e_2 perp x$ with norm $kappa eq.not 0$. Let $Delta$ be the determinant of the full form in fixed volume coordinates.
  Choose a finite set $B$ containing the archimedean places, all places where $- Delta$ or $- kappa$ is not a local norm from $L$, and the finite rank-zero places of the special stabilizer of $x$. The first two norm conditions exclude only finitely many finite places: outside the ramification and the divisors of the constants, units are norms from an unramified quadratic extension. Enlarge $B$ for fixed models as necessary. We shall factor a representative of a prescribed coset into three binary special transformations, all locally small at $B$.
  For a representative $u$, put
  $ z = u x \, #h(2em) alpha = chevron.l x \, z chevron.r \, #h(2em) delta = 1 - N_(L \/ k) \( alpha \) \, #h(2em) k_0 = 2 - alpha - macron(alpha) . $
  We require $delta k_0 \( delta - k_0 \) eq.not 0$. In the nondegenerate plane spanned by $x \, z$, there is a unique vector $y_(*)$ whose pairing with each of $x \, z$ is $1$; inversion of its two-by-two Gram matrix gives
  $ chevron.l y_(*) \, y_(*) chevron.r = k_0 \/ delta . $
  Choose the vector $v perp x \, z$ with $det \( x \, z \, v \) = 1$. The determinant of the Gram matrix in this basis gives $chevron.l v \, v chevron.r = Delta \/ delta$. Consequently a vector $y = a y_(*) + b v$ has norm $1$, has both marked pairings equal to $a$, and satisfies $1 - N_(L \/ k) \( a \) = kappa N_(L \/ k) \( c \)$ precisely when
  #[#set math.equation(numbering: n => "(7.1)")
   $ t = N_(L \/ k) \( a \) \, #h(2em) frac(delta - k_0 t, Delta) = N_(L \/ k) \( b \) \, #h(2em) frac(1 - t, kappa) = N_(L \/ k) \( c \) . $ <eq:unitary-three-norms>]
  We insist that $a \, b \, c$ be nonzero.
  We first produce local models at the places in $B$. Choose $y = a x + c e_2$ close to $x$, with $a \, c eq.not 0$ and norm $1$; the local norm map is a submersion at $1$, so this is possible with $a$ close to $1$ and $c$ small. The special isometry $w_1$ of the plane $chevron.l x \, y chevron.r$ sending $x$ to $y$, extended by the identity, is close to $1$. Choose $rho$ close to $1$ in the special stabilizer of $y$, and set
  $ z = rho x \, #h(2em) w_2 = rho w_1^(- 1) rho^(- 1) \, #h(2em) u_0 = w_2 w_1 . $
  Then $w_2 y = z$, $u_0 x = z$, and $chevron.l y \, x chevron.r = chevron.l y \, z chevron.r = a$. We can also arrange linear independence of $x \, y \, z$ and the three inequalities imposed above. Indeed the projection of $x$ onto $y^perp$ is nonisotropic, and its generic image under the special stabilizer gives linear independence. The scalar inequalities are nonempty algebraic conditions: taking minus the identity on $y^perp$ gives $alpha = 2 N_(L \/ k) \( a \) - 1$, and a generic choice of $a$ avoids their zeros. Local points near $1$ are Zariski dense, so these nonempty algebraic openings can be met while retaining all the smallness conditions.
  At these models Equation (7.1) has all three norm arguments nonzero. Since a quadratic norm map on nonzero elements is a local submersion, solutions persist for nearby $u$, even with $t$ fixed. Proposition 5 now supplies a representative of the prescribed coset sufficiently close to these models at $B$. At a place outside $B$, choose $c eq.not 0$ small and put $t = 1 - kappa N_(L \/ k) \( c \)$. The first factor is then close to $1$; the second is close to a nonzero norm because
  $ delta - k_0 = - N_(L \/ k) \( 1 - alpha \) quad upright("and") quad - Delta in N_(L \/ k) \( L_v^times \) . $
  Thus Equation (7.1) has the required local solutions everywhere, with the prescribed ones at $B$.
  Here is the global step, including the passage from a product of norms to the three separate norms. Write
  $ f_1 \( t \) = t \, #h(2em) f_2 \( t \) = \( delta - k_0 t \) \/ Delta \, #h(2em) f_3 \( t \) = \( 1 - t \) \/ kappa . $
  Their roots $0 \, delta \/ k_0 \, 1$ are distinct. A smooth projective model of
  #[#set math.equation(numbering: n => "(7.2)")
   $ N_(L \/ k) \( xi \) = f_1 \( t \) f_2 \( t \) f_3 \( t \) $ <eq:unitary-chatelet>]
  is a Châtelet surface. The theorem of Colliot-Thélène–Sansuc–Swinnerton-Dyer identifies the closure of its rational points with its Brauer–Manin set [8]; see also [7] Section 5.2. For a split cubic, its Brauer group modulo constants is generated by the quaternion symbols of the quadratic extension and the linear factors [8]. The local points just constructed are orthogonal to these classes: each $f_j \( t \)$ is individually a norm, so a symbol written with $f_j$ evaluates to zero. Replacing $f_j$ by its monic linear factor only adds a constant Brauer class, and the sum of the local invariants of that constant is zero by reciprocity. These choices give an adelic point; integral choices are available at all but finitely many places.
  Enlarge the finite approximation set to contain $B$, the ramified places of $L \/ k$, and all divisors of the leading coefficients, nonzero roots, and pairwise root differences of the three linear factors. Apply the Châtelet theorem to approximate the chosen local points there, on the affine open where $f_1 f_2 f_3 eq.not 0$. At a remaining nonsplit place the extension is unramified and all these nonzero constants are units. If $t$ is integral, at most one $f_j \( t \)$ has positive valuation. If $t$ is not integral, all three $f_j \( t \)$ have valuation $"ord"_v \( t \)$. Since their product is a norm by Equation (7.2), the nonzero valuation in the first case, or the common valuation in the second case, is even. Units are norms in an unramified quadratic extension. Thus every $f_j \( t \)$ is separately a local norm at every place, including the approximated places. The quadratic Hasse norm theorem [22] Chapter VIII, Theorem 3.1 gives global $a \, b \, c$ in Equation (7.1). Its norm torsors are rational conics once soluble, so weak approximation gives the prescribed approximations to $a \, b \, c$ at $B$.
  For the resulting $y$, both planes $chevron.l x \, y chevron.r$ and $chevron.l z \, y chevron.r$ have Gram determinant $1 - N_(L \/ k) \( a \) = kappa N_(L \/ k) \( c \) eq.not 0$. Their special groups have no finite rank-zero place outside $B$, since $- kappa$ is a local norm there. In a nondegenerate binary Hermitian plane, an isometry between marked norm-one vectors has a unique special extension: extend it to the orthogonal line and adjust the determinant on that line. In local orthogonal coordinates this extension varies smoothly with the plane and marked vectors. Hence the two resulting transformations $w_1 \, w_2$ approximate the prescribed local transformations, and the remaining factor $\( w_2 w_1 \)^(- 1) u$ fixes $x$ and is close to $1$ at $B$. Lemma 32, followed by the established $A_1$ case and Lemma 6, kills all three factors. This kills the prescribed coset. ◻
]

=== 7.3 Odd matrix degree <odd-matrix-degree>

Reduction to Hermitian dimension two is an established strategy in the unitary problem; see Tomanov [42] p. 895. Here the induction parameter is the reduced degree over all number fields. Suppose $n$ is odd and $D = M_l \( Delta_0 \)$, where $Delta_0$ is a division algebra of degree $d$ and $l > 1$. Then $l gt.eq 3$ and $n = l d$. The classification of unitary involutions realizes $S$ as the special group of a Hermitian $l$-space over a unitary division algebra [16] Theorem 4.2(2). Anisotropy implies that every subspace is nondegenerate.

The group is generated by its special transformations on two-dimensional $Delta_0$-subspaces. To see this, choose a nonzero vector $x$ and an isometry $u$. In a plane containing $x \, u x$, Witt’s extension theorem gives an isometry sending $x$ to $u x$. Its determinant can be adjusted on the orthogonal line in that plane. Here the unitary group of a nondegenerate $Delta_0$-line maps onto $L^1$ by reduced determinant. At a nonsplit finite place, the existence of a unitary involution makes the Brauer corestriction of the algebra zero. For a quadratic extension of nonarchimedean local fields, corestriction preserves the local Brauer invariant, so the algebra itself is split. The line therefore becomes an ordinary Hermitian $d$-space, and its unitary determinant is onto by varying one orthogonal coordinate. At a nonsplit real place the extension is $bb(C) \/ bb(R)$, the algebra is again split, and the same argument works for every Hermitian signature. At split finite places use reduced norm surjectivity. At split real places the division degree is odd, so there is no quaternionic sign restriction. Globally, for $d > 1$, each determinant fiber is a torsor under the simply connected special group of that line; Theorem 4 gives its rational point. For $d = 1$ surjectivity is immediate. Dividing by the resulting special plane move fixes $x$, and repetition in its orthogonal complement proves the generation assertion.

If $d > 1$, these plane groups have reduced degree $2 d < n$. They have no finite rank-zero places. At a split place this follows from their two-dimensional module over the local division algebra; at a nonsplit finite place the algebra is split and the Hermitian dimension $2 d gt.eq 6$ is isotropic. The induction hypothesis therefore kills their rational points. If $d = 1$, put each plane move inside a three-dimensional subspace and apply Proposition 33. This proves the odd matrix-algebra case.

=== 7.4 A quadratic Hermitian subfield in even degree <a-quadratic-hermitian-subfield-in-even-degree>

Assume now that $n = 2 m$ with $m gt.eq 2$. We first construct a fixed quadratic subfield $S_0 subset D$, disjoint from $L$, on which $*$ is the identity. The centralizer of $S_0$ will supply the smaller special unitary group in the induction.

#thm([Lemma 7.4.])[
  #emph[There is a quadratic field $S_0 = k \( s \) subset D$, disjoint from $L$, with $s^(*) = s$ and $s^2 = r in k^times$, such that the two geometric eigenspaces of $s$ have dimension $m$.]
] <lem:unitary-hermitian-quadratic>

#proof[
  Choose $r in N_(L \/ k) \( L^times \)$ with the following local conditions. At the finitely many exceptional nonsplit places, require $r$ to be a square. At a place split in $L$ where the local index of $D$ does not divide $m$, require $r$ to be a nonsquare, including the corresponding real sign condition when needed. At one additional finite place split in $L$, require $r$ to be a nonsquare. This last condition ensures that $S_0$ is a field and differs from $L$. The requirements are compatible: at split places the norm map is surjective, and a square can be approximated by norms at nonsplit places. Weak approximation in $L$, followed by the norm, supplies $r$.
  We verify local embeddings of $k_v \[ s \] \/ \( s^2 - r \)$ with the stated multiplicities and involution. At split places, a quadratic field extension reduces the local division index by its factor of two, whenever this is required to make the index divide $m$. This is exactly the local embedding criterion for a degree-two etale algebra in a central simple algebra of degree $2 m$. In the split quadratic case one uses two blocks of degree $m$. The two components over $L$ are paired by the involution.
  At a nonsplit place where $S_0$ splits, decompose the Hermitian space as an orthogonal sum of two $m$-spaces. At every other nonsplit place we may, by the choice of the exceptional set, assume that $L \/ k$ is unramified and the Hermitian form is unimodular. Its determinant is a norm. If $S_0$ locally equals $L$, the form is hyperbolic and dual isotropic $m$-spaces give the embedding. If the two quadratic fields are distinct, use the orthogonal sum of $m$ copies of one half the trace to $L$ of the standard Hermitian line over $L S_0 \/ S_0$. In the basis $1 \, s$ its determinant is $r$, a norm, so the local classification of Hermitian forms identifies this form with the given one. These facts about algebras and local Hermitian forms are the usual local classification and embedding theorems [33,16].
  Let $X$ be the variety of such embeddings, equivalently the images of $s$ with $s^(*) = s$, $s^2 = r$, and the fixed geometric multiplicities. Over the algebraic closure it is a single orbit under $S$, with connected stabilizer
  $ upright(S) \( "GL"_m times "GL"_m \) . $
  The units on $overline(X)$ are constant, and, because the ambient group is simply connected, $"Pic" \( overline(X) \)$ is the character lattice of this stabilizer, of rank one [34] Proposition 6.10, equation (6.10.1). The Hochschild–Serre edge map gives an injection $"Br"_a X arrow.r H^1 \( k \, "Pic" \( overline(X) \) \)$, where $"Br"_a X = "Br"_1 X \/ "Br"_0 X$ and $"Br"_0 X = "im" \( "Br" k arrow.r "Br" X \)$; its kernel before taking this quotient is precisely the image of the constant classes. This map commutes with localization. Define
  $ B \( X \) = ker #h(-0.16667em) ("Br"_a X arrow.r product_v "Br"_a X_(k_v)) . $
  These are the algebraic Brauer classes locally trivial modulo constants. Hence $B \( X \)$ injects into $"Sha"^1 \( k \, "Pic" \( overline(X) \) \)$. This last group vanishes. Indeed a rank-one lattice has trivial or sign Galois action. The trivial case has $H^1 \( k \, bb(Z) \) = 0$; in the sign case any nonzero class factors through the quadratic sign quotient and is detected at an inert unramified place by Chebotarev. Inflation adds no classes since a continuous homomorphism from a profinite group to $bb(Z)$ is zero.
  We have local points everywhere, and integral points at almost all places by Lang’s theorem [17] Theorem 1 and its corollary and smooth lifting. Borovoi’s Hasse-principle theorem for homogeneous spaces with connected stabilizer therefore applies: its obstruction is the pairing with the locally trivial algebraic Brauer group just shown to vanish [3] Theorem 2.2. Thus $X \( k \) eq.not diameter$, as required. ◻
]

Fix this $s$ and put

$ J_0 = k \( j \) \, #h(2em) j = i s \, #h(2em) C_s = C_D \( s \) . $

The field $L S_0$ is biquadratic over $k$, with third quadratic field $J_0$. The algebra $C_s$ has degree $m$ over $L S_0$, and its involution is unitary over $S_0$. We shall factor a representative $u$ into a quaternion norm-one element and an element of $"U" \( C_s \)$.

=== 7.5 The factorization and its local norm conditions <the-factorization-and-its-local-norm-conditions>

For $u in S$, define

#[#set math.equation(numbering: n => "(7.3)")
 $ s' & = u s u^(- 1) \, & t & = s' s^(- 1) \, & p & = \( u + s u s^(- 1) \) \/ 2 \,\
z & = \( 1 + t \) \/ 2 = u p^(*) \, & h & = z z^(*) = p p^(*) = \( 2 + t + t^(- 1) \) \/ 4 . $ <eq:unitary-factor-data>]

These are identities in $D$. For example, expanding $4 p p^(*)$ gives $2 + u s u^(- 1) s^(- 1) + s u s^(- 1) u^(- 1)$. We have $p in C_s$, and both $s$ and $s'$ invert $t$ by conjugation. Hence $h$ commutes with both of them.

Over a splitting field, use the two $s$-eigenspaces to write

$ u = mat(delim: "(", A, B'; C, D') . $

The two diagonal blocks of $h$ have the same characteristic polynomial $Psi$. On the open where the blocks are invertible, the first is

#[#set math.equation(numbering: n => "(7.4)")
 $ h_(+) = A \( u^(- 1) \)_(+ +) = \( 1 - B' \( D' \)^(- 1) C A^(- 1) \)^(- 1) . $ <eq:unitary-compression>]

The analogous expression for the second block is conjugate to this one, since the two products of the invertible off-diagonal block maps are conjugate. The equality of characteristic polynomials then holds everywhere by polynomial continuation. Exchange of the $s$-labels preserves $Psi$, and $h = h^(*)$ preserves it under the unitary involution; thus $Psi in k \[ T \]$.

Set $d_0 = "Nrd"_(C_s) \( p^(*) \)$. Then $d_0 in J_0$: conjugation of $L S_0 \/ S_0$ takes it to $"Nrd"_(C_s) \( p \)$, and exchange of the two $s$-labels does the same, by the complementary-minor identities for $u$ and $det u = 1$. Their product therefore fixes $d_0$, which is the condition that it belong to $J_0$.

We will choose $u$ so that $F = k \( h \)$ is a field of degree $m$ and $h \( 1 - h \) eq.not 0$. When $m gt.eq 3$, we also require that its normal closure have group $S_m$ even after adjoining $L S_0$. Taking determinants of $p p^(*) = h$ gives

#[#set math.equation(numbering: n => "(7.5)")
 $ N_(F \/ k) \( h \) = N_(J_0 \/ k) \( d_0 \) . $ <eq:unitary-norm-compatibility>]

In $D$, the elements

$ j = i s \, #h(2em) b = i #scale(x: 120%, y: 120%)[\(] s' - \( 2 h - 1 \) s #scale(x: 120%, y: 120%)[\)] $

anticommute and satisfy

#[#set math.equation(numbering: n => "(7.6)")
 $ j^2 = i^2 r \, #h(2em) b^2 = 4 j^2 h \( 1 - h \) . $ <eq:unitary-quaternion>]

Indeed $s s' + s' s = 2 r \( 2 h - 1 \)$, from which both assertions follow by expansion. Since both squares are nonzero, the quaternion algebra they define over $F$ is central simple, and its homomorphism into $D$ is injective. Denote its image by $Q$. The involution acts on $Q$ as quaternion conjugation. Moreover $t = \( i s' \) j^(- 1)$, so $z in Q$ and its quaternion norm is $h$. Scalar extension gives $L Q = C_D \( F \)$, a central simple algebra of degree two over $L F$. Consequently $"Res"_(F \/ k) "SL"_1 \( Q \)$ maps into $S$.

Suppose that we find $a in J_0 F$ satisfying

#[#set math.equation(numbering: n => "(7.7)")
 $ N_(J_0 F \/ F) \( a \) = h \, #h(2em) N_(J_0 F \/ J_0) \( a \) = d_0 quad upright("if ") m gt.eq 3 . $ <eq:unitary-simultaneous-norms>]

The subfield $J_0 F$ is contained in both $C_s$ and $Q$, and $*$ acts on it as the involution over $F$. We obtain

#[#set math.equation(numbering: n => "(7.8)")
 $ u = w q \, #h(2em) w = z a^(- 1) in "SL"_1 \( Q \) \, #h(2em) q = a \( p^(*) \)^(- 1) in "U" \( C_s \) ∩ S . $ <eq:unitary-factorization>]

The last membership follows because $w q = u$ and $w$ is unitary of ambient determinant one. For $m gt.eq 3$, the second norm condition also gives $"Nrd"_(C_s) \( q \) = 1$, so $q in "SU" \( C_s \)$. We now construct $u \, a$ with the local control needed to kill these factors.

Choose a finite set $B$ containing all archimedean and fixed exceptional places, the places below the rank-zero places of $"SU" \( C_s \)$ over $S_0$, and the anisotropic finite places of $S$. At these places ask that $u$ be close to $1$. Additional places split in $L S_0$ allow us to prescribe all needed Frobenius cycle types of $F$. The block matrices

#[#set math.equation(numbering: n => "(7.9)")
 $ u = mat(delim: "(", I, epsilon I; epsilon X, I + epsilon^2 X) \, #h(2em) h_(+) = I + epsilon^2 X $ <eq:unitary-near-identity-model>]

have determinant one and are arbitrarily close to $1$ for small $epsilon$. Taking $X$ with any prescribed separable residue factorization gives the desired local unramified algebra for $F$. These are open conditions on $u$. Prescribing representatives of every conjugacy class of $S_m$ at places split in $L S_0$ ensures that the Galois subgroup over $L S_0$ is $S_m$: a proper subgroup misses a conjugacy class, by the derangement theorem for its coset action. For $m = 2$ a single irreducible quadratic residue condition gives the required disjointness. Include these auxiliary places in $B$.

Near $1$, the norm equations have local solutions near $1$. Start with the analytic square root $a_0 = h^(1 \/ 2) in F ⊗ k_v$; its norm from $J_0 F$ to $F$ is $h$. For $m gt.eq 3$, the ratio

$ c_0 = d_0 \/ N_(J_0 F \/ J_0) \( a_0 \) $

lies in $J_0^1$, by Equation (7.5), and is close to $1$. Choose its $m$-th root $c in J_0^1$ close to $1$ and replace $a_0$ by $c a_0$. This solves both norm equations. All reduced eigenvalues involved are ambient eigenvalues of matrices near $1$, so $a \, w \, q$ can be made uniformly small in the sense of Lemma 32.

=== 7.6 Controlling every other place <controlling-every-other-place>

It remains to ensure local solvability of Equation (7.7) and splitting of $Q$ away from the finitely many places at which the factors are made small. To apply Proposition 8, we first specify the allowed local conditions.

Let $Omega subset S$ be the fixed Zariski open on which $Psi$ is separable and $h \( 1 - h \)$ is invertible. For each place outside $B$, let $cal(U)_v$ be the union of $S \( k_v \) \\ Omega \( k_v \)$, the locus in $Omega \( k_v \)$ on which $Q$ is split and the required norm equations are soluble, and a sufficiently small generic identity opening $I_v subset Omega \( k_v \)$ on which the analytic-root construction supplies norm solutions with both factors $w \, q$ local $e$-th powers. The preceding analytic construction makes $I_v$ nonempty. Thus a point of $I_v$ is allowed even when its quaternion algebra is not split.

The integral and pole tests below will give the split-$Q$ condition for points in $Omega$. Including the complement of $Omega$ in $cal(U)_v$ lets these tests meet the universal integral-point condition of Proposition 8 without adding a discriminant divisor to its codimension-two exclusion. We will ensure that the final rational representative lies in $Omega$ by one of the auxiliary local openings already prescribed. After the tests, we specify which exceptional places use the small opening $I_v$ and which use the split-$Q$ condition.

At integral reduction, consider the four block-determinant hypersurfaces

$ det A = 0 \, quad det B' = 0 \, quad det C = 0 \, quad det D' = 0 . $

Exclude their pairwise intersections. If all four determinants are nonzero and $m gt.eq 3$, also require that $Psi$ have at least one simple root over the algebraic closure of the residue field. If exactly one block determinant vanishes, require, for $m gt.eq 3$, that $0$ be a simple root of $Psi$ for a diagonal block, or $1$ a simple root for an off-diagonal block. The latter roots follow respectively from the block and complementary-minor determinant identities for $h$ and $1 - h$.

All excluded loci have geometric codimension at least two. This can be checked first on $"GL"_(2 m)$: the four block determinants define distinct irreducible hypersurfaces. On the open where they are all invertible, the map $u mapsto B' \( D' \)^(- 1) C A^(- 1)$ is a submersion, as is seen by varying $B'$ with the other three blocks fixed. The transformation $M mapsto \( 1 - M \)^(- 1)$ in Equation (7.4) preserves eigenvalue multiplicities on this open. For $m gt.eq 3$, the locus of monic degree-$m$ polynomials with no simple root has dimension at most $floor.l m \/ 2 floor.r$ in coefficient space and thus codimension at least two. The characteristic-polynomial map on matrices is flat: each fiber has dimension $m^2 - m$, by the decomposition into finitely many Jordan types and their centralizer dimensions. Thus the same codimension bound holds for its inverse image. On each single block hypersurface the requisite simple root holds on a nonempty open, as one sees from independent two-by-two transformations between paired eigenlines, with only one of the relevant scalar blocks vanishing. Finally, scalar multiplication changes none of the zero or root conditions, so passage from $"GL"_(2 m)$ to $"SL"_(2 m)$ preserves these codimensions. The union is Galois stable and spreads to the chosen integral models after finitely many exceptions.

Consider first an integral place outside the fixed exceptions where $J_0$ is inert. Frobenius interchanges the two diagonal block divisors and also the two off-diagonal block divisors. To check this, exchange of the $s$-labels swaps each pair, and the unitary diagram action does the same: in adapted dual bases it is inverse transpose, and complementary minors swap the paired determinants. Exactly one of these actions occurs when the third quadratic field $J_0$ is inert. A rational residue point therefore cannot lie on exactly one divisor. All four determinants are nonzero. Hence $h$ and $1 - h$ are units in every local component of $F$. The quadratic algebra $J_0 F \/ F$ is unramified or split, so these units are norms. In particular Equation (7.6) shows that $Q$ splits, and one can choose unit preimages of $h$ for the first norm equation.

For $m gt.eq 3$ the simple residue root of $Psi$ supplies an unramified local factor $E \/ k_v$ of $F$. It need not be a degree-one factor. Write $K = k_v$ and $J = J_0 ⊗_k K$, an unramified quadratic field in the case under consideration. If $a_0$ denotes the chosen unit preimages of $h$, the required correction is

$ eta = d_0 \/ N_(J F \/ J) \( a_0 \) in cal(O)_J^1 \, $

by Equation (7.5). Hilbert 90 writes $eta = y \/ macron(y)$ with $y in J^times$. Since $J \/ K$ is unramified, multiplication by a power of a $K$-uniformizer makes $y$ a unit without changing this quotient. The unramified etale algebra $J E \/ J$ has surjective norm on units. Choose a unit $x in J E$ with $N_(J E \/ J) \( x \) = y$, and put $beta = x \/ x^(*)$. Then

$ N_(J E \/ E) \( beta \) = 1 \, #h(2em) N_(J E \/ J) \( beta \) = eta . $

Extend $beta$ by $1$ on the other factors of $J F$ and replace $a_0$ by $a_0 beta$. This corrects the determinant while preserving the norm to $F$, for either parity of $\[ E : K \]$.

If $J_0$ splits, then $Q$ splits automatically. Write $a = \( a_(+) \, a_(-) \)$ and $d_0 = \( d_(+) \, d_(-) \)$. Choose $N_(F \/ K) \( a_(+) \) = d_(+)$ and set $a_(-) = h \/ a_(+)$; compatibility gives $N_(F \/ K) \( a_(-) \) = d_(-)$. Thus one component must have a prescribed norm from $F$. When all block determinants are nonzero, the prescribed value is a unit, so an unramified factor supplies it by ordinary unit norm surjectivity. If one determinant vanishes, the prescribed simple residue root is literally $0$ or $1$, so Hensel’s lemma supplies a degree-one factor of $F$. Its norm map supplies any prescribed value, including a nonunit. This proves all the local assertions at the permitted integral reductions. When $m = 2$, no determinant norm is being imposed, so the splitting and first-norm assertions already suffice.

We must check the single poles permitted by Proposition 8. Enlarge its fixed splitting field to split $L \, S_0 \, D$ and all the fixed data. At a single pole the place splits in this field, and

$ u = g_L "diag" \( t_(upright(p))^(e d_1) \, dots.h \, t_(upright(p))^(e d_(2 m)) \) g_R \, #h(2em) d_1 < dots.h.c < d_(2 m) \, quad "ord"_v \( t_(upright(p)) \) > 0 \, $

with integral side factors. For $m gt.eq 3$ impose total splitting of $Psi$ by requiring finitely many nonzero leading minors. Explicitly, if $c_b$ is its $b$-th elementary coefficient, exterior-power expansion of the compression in Equation (7.4) gives

#[#set math.equation(numbering: n => "(7.10)")
 $ "ord"_v \( c_b \) = e "ord"_v \( t_(upright(p)) \) sum_(a = 1)^b \( d_a - d_(2 m + 1 - a) \) \, #h(2em) 1 lt.eq b lt.eq m . $ <eq:unitary-pole-valuations>]

For completeness, the least exponent uses the first $b$ exponent indices in the positive exterior power and the last $b$ in its inverse. Its coefficient is the product of the corresponding opposite minors in the two rank-$m$ projections

$ g_R P_(+) g_R^(- 1) \, #h(2em) g_L^(- 1) P_(+) g_L \, $

where $P_(+)$ is projection onto one $s$-eigenspace. All other terms have larger valuation. The indicated minors are nonzero for a generic conjugate of a rank-$m$ projection; require them all to be units on the pole hyperplane. These are nonempty simultaneous open conditions. Their choices can be made in the staged order required by Proposition 8. With all other torus parameters equal to $1$, the boundary of the factor with conjugator $k_j$ has $g_L = x k_j$ and $g_R = k_j^(- 1)$. First choose the basic conjugators so that every right-projection minor for $k_j^(- 1)$ is nonzero, along with the basic-list dominance conditions. Then choose $x$ in the intersection of the nonempty left-minor opens for the finitely many $x k_j$. All coordinate conjugates give only finitely many such dense open conditions. For an appended factor, with $x$ already fixed, its conjugator $k$ can be chosen in the intersection of the right-minor open and the inverse translate by $x$ of the left-minor open. This intersection is again dense open and meets the required local approximation openings. Setting each new parameter to $1$ preserves all the old boundary tests. This proves nonemptiness of every single-pole test without changing the earlier choices.

The consecutive slopes in Equation (7.10) are strictly increasing. Every Newton-polygon segment has horizontal length one, so $Psi$ splits completely over $k_v$. Since $J_0$ also splits here, all required norm equations are soluble and $Q$ splits. For $m = 2$, splitting of $J_0$ alone suffices.

The tests establish the required membership in $cal(U)_v$ at permitted integral reductions and single poles. It remains to retain global genericity and to choose the openings at the finite exceptional places. The final rational representative lies in $Omega$ because one of the existing auxiliary local openings is contained in $Omega \( k_v \)$. In Equation (7.9), choose $X$ with separable characteristic polynomial and with both $X$ and $I + epsilon^2 X$ invertible. Then $h_(+) = I + epsilon^2 X$ has distinct eigenvalues different from $0 \, 1$, and these conditions persist in its local opening. This argument uses the local matrix itself, not the reduction of $Psi$, which can have repeated roots when $epsilon$ is small. After the initial representative $x$ is chosen, let $B_1$ be its finite set of denominator places outside $B$. At these places specifically choose the opening $I_v subset cal(U)_v$. This requires no splitting assumption; the block model in Equation (7.9) was needed only to prescribe Frobenius types at the auxiliary split places. The finitely many later model exceptions are assigned unit-parameter reductions with all four block determinants nonzero and separable $Psi$; such opens are nonempty over sufficiently large residue fields, with small fields already included among the fixed exceptions, and thus use the split-$Q$ branch as well. Consequently the small branch is used only at the controlled finite set $B^(+) = B union B_1$. The construction produces a representative of the required coset for which $Q$ is split outside $B^(+)$. At every place Equation (7.7) is soluble with the prescribed near-identity solutions at $B^(+)$.

For $m gt.eq 3$, the simultaneous equations form a torsor under the norm torus of Lemma 11, with quadratic field $J_0$ and degree-$m$ field $F$. The full symmetric action over $L S_0$ implies the joint $S_m times C_2$ hypothesis for $F \, J_0$. That lemma gives a global $a$ with the local approximations. When $m = 2$, the quadratic Hasse norm theorem over $F$ [22] Chapter VIII, Theorem 3.1 and weak approximation on its norm torsor give $a$. In either case the quaternion factor $w$ in Equation (7.8) is killed: all its rank-zero places lie over the controlled set, where it is a local $e$-th power by Lemma 32. If $m gt.eq 3$, the factor $q$ lies in the smaller group $"SU" \( C_s \)$ over $S_0$ and is small at every rank-zero place of that fixed group. Induction and Lemma 6 kill $q$ as well.

=== 7.7 The determinant correction in degree four <the-determinant-correction-in-degree-four>

It remains to treat $m = 2$. The preceding construction has killed $w$ and produced $q in "U" \( C_s \) ∩ S$, small at the fixed set $B$, but its determinant in $C_s$ may not be $1$. Write

$ r_0 = "Nrd"_(C_s) \( q \) . $

Both conjugations of $L S_0$ over $S_0$ and over $L$ invert $r_0$: the first by unitarity, the second by ambient determinant one. Thus $r_0 in J_0^1$. Taking $q$ sufficiently close to $1$ at $B$ ensures $r_0 eq.not - 1$. Put

$ d = \( 1 + r_0 \) \/ 2 in J_0^times \, #h(2em) r_0 = d \/ macron(d) \, $

where the bar is the nontrivial automorphism of $J_0 \/ k$. The element $d$ is close to $1$ at $B$.

We will remove this determinant by two elements in smaller binary special groups. The following construction gives the freedom needed to keep their varying rank-zero places under control. For any finite set of places outside the fixed exceptions, one can choose a quadratic field $F_i = k \( f_i \) subset C_s$, disjoint from $L S_0$, with $f_i^(*) = f_i$, such that $F_i$ splits at these places and the binary group $"SU" \( C_D \( F_i \) \, * \)$ is split over both local components of $F_i$. Here and below $B$ includes all fixed exceptions of the structures defined from $s$.

To prove the construction, let $B_s$ be the quaternion algebra over $S_0$ obtained by descent from $C_s$: its defining semilinear involution is the composition of $*$ and standard quaternion conjugation. These involutions commute, and $B_s ⊗_(S_0) L S_0 = C_s$. For a trace-zero element $y in B_s$, the element $f = i^(- 1) y$ satisfies $f^(*) = f$. Prescribe $f^2 = c in k^times$, so $y^2 = i^2 c$. A quadratic etale algebra embeds into $B_s$ if and only if it is a field at every ramified place of $B_s$, by the local embedding criterion and Brauer invariants. We may impose this by choosing $i^2 c$ nonsquare there. At a finite place of $k$ the kernel of the square-class map to a quadratic component of $S_0$ has at most two elements; in the split case it has one. Thus the forbidden square classes do not exhaust the local square classes. At real places the requirement is simply a sign. These ramified places are above $B$. At the prescribed places outside $B$ require $c$ to be a square, and at one further place split completely in $L S_0$ require it to be a nonsquare. Weak approximation supplies $c$. The last condition ensures that $F_i$ is a field disjoint from $L S_0$.

The embedding of $S_0 \( sqrt(i^2 c) \)$ into $B_s$ can approximate any prescribed local embeddings: they are conjugate, and weak approximation in the open affine variety $B_s^times$ approximates the conjugators. At a specified place split in $L$, ordinary split block embeddings make the two binary centralizers split. At a good unramified nonsplit place where $S_0$ splits, decompose both two-dimensional $s$-blocks into orthogonal lines with unit norm values. Give each $f_i$-eigenspace one line from each block. Its Hermitian determinant is a unit, and hence a norm, so each binary space is hyperbolic. If $S_0$ does not split there, it locally equals $L$; the two $s$-blocks are dual totally isotropic spaces. Choose paired line decompositions and assign one hyperbolic plane to each $f_i$-eigenvalue. In each case $f_i$ is Hermitian and traceless in $C_s$, and the desired local property persists on an open set of embeddings. This proves the construction.

For such a field $F_i$, the compositum $L S_0 F_i$ is a maximal subfield of $C_s$, and there is an inclusion

#[#set math.equation(numbering: n => "(7.11)")
 $ \( J_0 F_i \/ F_i \)^1 med subset med "SU" \( C_D \( F_i \) \, * \) ∩ "U" \( C_s \) . $ <eq:unitary-binary-norm-tori>]

Indeed the determinant in the binary algebra $C_D \( F_i \)$ is the norm from $L S_0 F_i$ to $L F_i$. On $J_0 F_i$ its nontrivial automorphism exchanges the $s$-labels, which is the norm-one condition displayed on the left. The determinant of the same element in $C_s$ is its norm from $J_0 F_i$ to $J_0$.

Choose $F_1$ first. Outside $B$, all but finitely many places have both of the following properties: $d$ is a local norm from $J_0 F_1$ to $J_0$ at every place above the given $k$-place, and the binary group in Equation (7.11) is isotropic at every place of $F_1$ above it. This follows from unramified unit norm surjectivity and good reduction. Call these the places covered by $F_1$. Choose $F_2$ by the preceding construction to split, with split binary groups in both components, at every remaining place outside $B$. Every such remaining place is covered by $F_2$, since the local norm from a split quadratic algebra is surjective.

Solve

#[#set math.equation(numbering: n => "(7.12)")
 $ N_(J_0 F_1 \/ J_0) \( x_1 \) N_(J_0 F_2 \/ J_0) \( x_2 \) = d . $ <eq:unitary-multinorm-correction>]

This equation satisfies the Hasse principle and weak approximation on its locus where the variables are invertible. Indeed putting $y_2 = x_2^(- 1)$ turns it into the nonzero locus of the nonsingular four-variable quadratic equation

$ N_(J_0 F_1 \/ J_0) \( x_1 \) - d N_(J_0 F_2 \/ J_0) \( y_2 \) = 0 . $

Hasse–Minkowski [22] Chapter VIII, Theorem 3.5(b) gives a rational isotropic vector whenever there are local ones. The corresponding projective quadric is rational once it has a point, and its affine cone minus the vertex has weak approximation. Removing the two norm-zero loci preserves the needed approximation to local points in this open set.

The requisite local points can be chosen with additional control. At $B$ take $x_1 = sqrt(d)$ and $x_2 = 1$, near $1$; the square root is in the local $J_0$-algebra. Outside $B$, use one covering field for the entire $k$-place to carry the norm $d$, and take the other variable to be $1$ at every component above that place. In particular, at any rank-zero place of one of the two binary groups, its own variable can be taken to be $1$: that field cannot be the covering field there. These rank-zero places form a finite set. Use weak approximation in Equation (7.12) at their underlying places and at $B$, obtaining global invertible $x_1 \, x_2$ with these local approximations.

Set $b_i = x_i \/ \( x_i^(*) \)$. By Equation (7.11), each $b_i$ belongs to the indicated binary special group, of reduced degree two over $F_i$, and

$ "Nrd"_(C_s) \( b_1 \) "Nrd"_(C_s) \( b_2 \) = d / macron(d) = r_0 . $

At every rank-zero place of its binary group, $b_i$ is as close to $1$ as necessary. The $A_1$ case, local power lifting, and Lemma 6 therefore kill $b_1 \, b_2$. The element $\( b_1 b_2 \)^(- 1) q$ has determinant one in $C_s$ and remains close to $1$ at $B$. Its special group over $S_0$ has degree two and all its rank-zero places lie above $B$, so it too is killed. Together with the already killed factor $w$, this kills $u$.

The even induction step is complete. The degree-two base, the odd-degree division result, the odd matrix argument, and this step prove $V_0 \/ R = 1$ in every reduced degree over every number field. Proposition 5 now proves Theorem 31.

== 8 Groups of type $D_4$ <sec:d4>

For type $D_4$ there are no anisotropic nonarchimedean factors. Our objective is therefore to show that every finite quotient of the rational group is trivial. The argument first kills rational noncentral involutions and then represents every power-subgroup coset by a product of two such involutions. The second step requires a maximal torus on which inversion lifts rationally, not just geometrically.

#thm([Theorem 8.1.])[
  #emph[Let $k$ be a number field and let $G$ be an absolutely almost simple simply connected $k$-group of type $D_4$, including the trialitarian forms. Every noncentral abstract normal subgroup of $G \( k \)$ is $G \( k \)$.]
] <thm:d4>

The isotropic case is among the established cases recalled in Section 2. We may thus assume throughout this section that $G$ is $k$-anisotropic. Fix a positive integer $e$, put $R = G \( k \)^e$, and write $q : G \( k \) arrow.r cal(Q) = G \( k \) \/ R$. By Proposition 5, this is a finite quotient and its cosets have the approximation properties used below. It will suffice to prove that $cal(Q) = 1$.

=== 8.1 Root involutions and a quadratic splitting field <root-involutions-and-a-quadratic-splitting-field>

We record explicitly the lattice calculations used both here and in Section 9. With roots of squared length two, the coroot lattice of the simply connected group is

$ Q_4 = { \( x_1 \, x_2 \, x_3 \, x_4 \) in bb(Z)^4 : x_1 + x_2 + x_3 + x_4 equiv 0 med \( mod med 2 \) } \, #h(2em) Phi_4 = { plus.minus e_i plus.minus e_j : i eq.not j } . $

The two-torsion of a split maximal torus is $Q_4 \/ 2 Q_4$. Its four central elements are the classes having all coordinates of the same parity. The other twelve classes are represented by the twelve pairs of opposite roots. These representatives are distinct: if two roots differ by an element of $2 Q_4$, their coordinate parities agree, and the defining even-sum condition then leaves only equality or opposition. The Weyl group is transitive on the roots, so all noncentral involutions form one geometric conjugacy class.

For $n = alpha^or \( - 1 \)$, the roots of $C_G \( n \)$ are precisely the four orthogonal axes represented, after a Weyl conjugacy, by

$ alpha = e_1 - e_2 \, #h(2em) beta_1 = e_1 + e_2 \, #h(2em) beta_2 = e_3 - e_4 \, #h(2em) beta_3 = e_3 + e_4 . $

The semisimple centralizer is connected, by the connected-centralizer theorem for simply connected groups [38] Section 2.10, p. 53. The lattice spanned by these four roots has index two in $Q_4$, and

$ alpha + beta_1 + beta_2 + beta_3 = 2 \( e_1 + e_3 \) in 2 Q_4 . $

Consequently the centralizer and its simply connected covering have the geometric description

#[#set math.equation(numbering: n => "(8.1)")
 $ C_G \( n \)_(macron(k)) tilde.eq \( "SL"_2^4 \) \/ chevron.l \( - I \, - I \, - I \, - I \) chevron.r . $ <eq:d4-centralizer>]

The product of the four standard reflection representatives acts by $- 1$ on the torus and has square one in this quotient. Every other representative of inversion has the same square: for $a$ in the torus and an inverter $x$, one has $\( a x \)^2 = a thin x a x^(- 1) x^2 = x^2$.

#thm([Lemma 8.2.])[
  #emph[Every noncentral involution in $G \( k \)$ is killed by $q$.]
] <lem:d4-kill-involutions>

#proof[
  Let $n in G \( k \)$ be such an involution. The root pair representing $n$ is unique, so its axis $alpha$ is Galois-stable. The simply connected cover of $C_G \( n \)$ is therefore a product of an inner form of $"SL"_2$ over $k$ and restrictions of inner forms of $"SL"_2$ over a cubic etale $k$-algebra $E$. Equivalently these factors are the norm-one groups of quaternion algebras over $k$ and $E$.
  There is a quadratic field $L' \/ k$ whose scalar extension embeds as a maximal etale quadratic algebra in every one of these quaternion algebras. To see this, impose local conditions only at their ramified places. At a finite ramified place we require $L'_v$ to be a field and to remain a field over each completion of $E$ where the corresponding quaternion algebra is ramified. An odd-degree completion cannot contain $L'_v$. Since $dim_k E = 3$, at most one completion of $E$ has degree two; thus at most one quadratic local field is excluded. There are other quadratic extensions of a nonarchimedean local field. At real ramified places choose $L'_v = bb(C)$. Weak approximation on a defining square class, with a further nonsquare condition if necessary, realizes all these requirements. The local invariant theorem for quaternion algebras then shows that $L'$ splits each algebra after scalar extension, which is equivalent to the asserted quadratic embedding [25,33,16].
  The resulting maximal norm tori give a maximal torus of $G$. Orient the four root axes using their common quadratic field $L'$. Galois then acts by a common sign, together with permutations of $beta_1 \, beta_2 \, beta_3$ fixing $alpha$. In particular the two roots
  $ alpha \, #h(2em) gamma = frac(- alpha + beta_1 + beta_2 + beta_3, 2) $
  span a Galois-stable subsystem of type $A_2$: both have squared length two and $\( alpha \, gamma \) = - 1$. The corresponding connected root subgroup $J$ is defined over $k$ and is split over $L'$, because both roots and coroots of this subsystem are fixed over $L'$. The element $n$ is the image of the rational element $alpha^or \( - 1 \)$ in the simply connected cover $tilde(J)$.
  The group $tilde(J)$ has no anisotropic finite places. In the inner case its degree-three central simple algebra is split by a quadratic extension, so its index divides both three and two. In the outer case the algebra over the quadratic center is split; a ternary Hermitian form over a quadratic extension of a nonarchimedean local field is isotropic. The established inner-type-$A$ result and Theorem 31 now give (MP) for $tilde(J)$. Lemma 6, with an empty anisotropic-place product, makes its image under $q$ trivial. In particular $q \( n \) = 1$. ◻
]

=== 8.2 Local representatives of inversion <local-representatives-of-inversion>

The next two lemmas give the local conditions imposed on a representative of an arbitrary coset of $R$. At a prescribed place we can choose a suitable open set freely. At the other places we will use a uniform condition on integral reduction.

#thm([Lemma 8.3.])[
  #emph[For every completion $F$ of $k$ there is a nonempty open set of regular semisimple elements $u in G \( F \)$ such that inversion on $C_G \( u \)$ has a representative in $G \( F \)$.]
] <lem:d4-local-openings>

#proof[
  We first produce a noncentral involution in $G \( k \)$, which can then be localized at any $F$. The unique geometric class of noncentral involutions is a closed semisimple orbit preserved by Galois, so it descends to a $k$-homogeneous space $X$ under $G$. Its full geometric stabilizer is the connected semisimple centralizer in Equation (8.1). Borovoi’s theorem for a homogeneous space under a simply connected group with connected geometric stabilizer having no torus quotient requires only archimedean local points to conclude $X \( k \) eq.not diameter$ [3] Proposition 3.4(i).
  These points exist over $bb(C)$. Over $bb(R)$, the compact rank of every real form of $D_4$ is at least three, by the real orthogonal classification, including the quaternionic orthogonal form [16,25]. A compact torus of dimension at least three has at least eight rational two-torsion points, whereas the center has order four. It therefore contains a noncentral involution. Borovoi’s theorem now supplies $n in G \( k \)$. This argument applies to all forms, including trialitarian ones; it imposes no finite-place restriction.
  View $n$ in $G \( F \)$. Geometrically it is conjugate to an inversion representative by Equation (8.1) and the preceding lattice calculation. Hence the map $g mapsto g n g^(- 1) n$ takes some geometric values that are regular semisimple: on a torus inverted by $n$, its values include all squares. The regular locus is a nonempty Zariski open condition on $g$, and $G \( F \)$ is Zariski dense. We may therefore choose such a $g$ rationally. Set $u = g n g^(- 1) n$ and $T = C_G \( u \)$. The involution $n$ normalizes $T$ and sends $u$ to $u^(- 1)$. Its Weyl action is inversion. Indeed inversion belongs to the $D_4$ Weyl group; composing the two Weyl actions would fix $u$, whose Weyl stabilizer is trivial by connectedness of its semisimple centralizer and regularity. Finally the conjugation map $G \( F \) times T \( F \) arrow.r G \( F \)$ is a submersion at $\( 1 \, u \)$, since no root takes the value one on $u$. Thus nearby regular elements have conjugate tori, and the required property holds on an open neighborhood of $u$. ◻
]

#thm([Lemma 8.4.])[
  #emph[Outside a fixed finite set of finite places, the following assertion holds. Let $u in G \( k_v \)$ be regular semisimple and integral. If the semisimple part of its reduction lies on at most one pair of opposite root walls, then inversion on $C_G \( u \)$ has a rational representative.]
] <lem:d4-one-wall>

#proof[
  Write $p$ for the residue characteristic and exclude $p = 2$ and the fixed bad-model places. The compact closure of the cyclic group generated by $u$ has a prime-to-$p$ finite-order factor. Its corresponding element $s$ reduces to the semisimple part of the reduction of $u$. This follows also by decomposing the finite-order part and the pro-$p$ part of this procyclic group, whose reduction kernel is pro-$p$. In particular $T = C_G \( u \)$ is contained in $C_G \( s \)$.
  The centralizer $C_G \( s \)$ has an unramified reductive model with the roots specified by the reduction of $s$. One way to check this assertion is to pass to a finite unramified extension splitting the reduced data. A prime-to-$p$ torsion lift is integrally conjugate to the corresponding element of a split torus: at each successive congruence level the conjugacy obstruction is cohomology of a finite cyclic group of order prime to $p$ on a residue Lie algebra, and averaging makes this cohomology vanish. The resulting centralizer has precisely the root groups on which $s$ has value one. Descent gives the asserted unramified model. Equivalently one may use smoothness of fixed points of an automorphism of invertible finite order together with the connected-centralizer theorem.
  If there are no root walls, this centralizer is the unramified torus $T$. Inversion is a rational point of its Weyl-group quotient. It has a representative over the residue field by Lang’s theorem for the torus, and that representative lifts through the smooth unramified normalizer.
  If there is one root pair ${ plus.minus alpha }$, its element $n_0 = alpha^or \( - 1 \)$ is Galois-invariant, even if Galois exchanges $alpha$ and $- alpha$. It is an integral noncentral involution central in $C_G \( s \)$. Thus $T subset C_G \( n_0 \)$. The latter centralizer is again unramified, and its simply connected covering is a product of restrictions of split $"SL"_2$’s over unramified extensions: a semisimple unramified group is quasi-split, and a quasi-split group of type $A_1$ is split. The covering torus above $T$ is a product of maximal tori of these $"SL"_2$’s.
  For each such torus, represent it as the norm-one group of a quadratic etale algebra. Conjugation of that algebra, acting on its underlying two-dimensional vector space, is an inverter in $"GL"_2$ of determinant $- 1$. Multiply all these inverters, over all factors and embeddings, by the same scalar $i$ with $i^2 = - 1$. The resulting tuple lies in $"SL"_2^4$ and inverts the covering torus. A Galois automorphism either preserves $i$ or changes its sign simultaneously in all four factors. The latter discrepancy is exactly the kernel in Equation (8.1). The image of the tuple therefore descends to a $k_v$-rational element of $C_G \( n_0 \)$ inverting $T$. Notice that this argument permits the individual quadratic tori to be ramified. ◻
]

=== 8.3 A torus with no local-to-global obstruction <a-torus-with-no-local-to-global-obstruction>

Write $P_4 = "Hom" \( Q_4 \, bb(Z) \)$ for the weight lattice and $W = W \( D_4 \)$ for its Weyl group. The following calculation explains why forcing the full Weyl group into a torus’s Galois action is sufficient.

#thm([Lemma 8.5.])[
  #emph[Let $Gamma$ be a subgroup of $"Aut" \( Phi_4 \)$ containing $W$, acting on $P_4$. Every class in $H^2 \( Gamma \, P_4 \)$ whose restriction to every cyclic subgroup vanishes is zero. Consequently, if a maximal $k$-torus $T$ of a simply connected group of type $D_4$ has character action containing $W$, then $"Sha"^1 \( k \, T \) = 0$.]
] <lem:d4-cyclic-cohomology>

#proof[
  Let $M = P_4$ and let $xi in H^2 \( Gamma \, M \)$ restrict to zero on every cyclic subgroup. The element $c = - I in W$ is central in $Gamma$ and acts by $- 1$ on $M$. Apply Lemma 10 to an extension representing $xi$. It gives a class
  $ beta in H^1 \( Gamma \/ chevron.l c chevron.r \, M \/ 2 M \) $
  whose vanishing is equivalent to the splitting of the extension. We view a representative of this class as a cocycle on $Gamma$ and show that it is a coboundary.
  For a simple reflection $s_alpha$, cyclic triviality and the last assertion of Lemma 10 give a lift $d_(s_alpha) in M$ of $beta \( s_alpha \)$ with $\( 1 + s_alpha \) d_(s_alpha) = 0$. Therefore
  $ d_(s_alpha) in P_4 ∩ bb(Q) alpha = bb(Z) alpha . $
  The last equality follows by pairing with a neighboring simple coroot. The fundamental weights allow us to prescribe all the coefficients $chevron.l b \, alpha^or chevron.r$ modulo two independently. Adding the coboundary $\( 1 - gamma \) b$ for a single $b in P_4$ therefore makes $beta$ vanish on every simple reflection, and hence on $W$.
  Moreover,
  #[#set math.equation(numbering: n => "(8.2)")
   $ \( P_4 \/ 2 P_4 \)^W = 0 . $ <eq:d4-no-mod-two-invariants>]
  Indeed a root is primitive in $P_4$; for example its pairing with an adjacent simple coroot is $- 1$. If $p$ is fixed modulo $2 P_4$ by every simple reflection, the formula $p - s_alpha p = chevron.l p \, alpha^or chevron.r alpha$ therefore makes every simple-coroot pairing even. Expansion in fundamental weights gives $p in 2 P_4$. Since $W$ is normal in $Gamma$, the cocycle identity and $beta \|_W = 0$ imply that $beta \( gamma \)$ is $W$-invariant for every $gamma$. Equation (8.2) gives $beta = 0$ on all of $Gamma$. The extension consequently splits by Lemma 10, proving the first assertion.
  For the arithmetic conclusion, take the minimal Galois splitting field of $T$ and identify $X^(*) \( T \)$ with $P_4$. The first assertion and Lemma 9 give $"Sha"_omega^2 \( k \, X^(*) \( T \) \) = 0$. The torus-duality conclusion of that lemma then gives $"Sha"^1 \( k \, T \) = 0$, as required. ◻
]

We now construct the torus to which this lemma will apply. Fix a splitting field and a pinning of $G$ there. At finitely many sufficiently large finite places that split completely in this field, prescribe unramified maximal tori with Frobenius in each conjugacy class of $W$. Such tori exist by Weyl twisting over the residue field and smooth lifting. Each has rational inversion by the no-wall argument in Lemma 38. Choose regular elements in them and impose small regular neighborhoods with the same local tori.

The labeling here matters. At each chosen place fix a completion embedding of the splitting field and use the fixed pinning. After a global identification of a new maximal torus with the pinned torus by inner conjugation, these local identifications differ by Weyl elements, not arbitrary diagram automorphisms. The image of the Galois group fixing the chosen splitting field thus meets every $W$-conjugacy class inside $W$. This image is all of $W$. Indeed a proper subgroup of a finite group cannot meet every conjugacy class: its transitive action on cosets would have no element without a fixed point, contradicting the average fixed-point count of one. The full character action $Gamma$ therefore contains $W$.

At each place, define the allowed set as the union of the elements that are not regular semisimple and the regular semisimple elements whose centralizer torus admits rational inversion. The auxiliary regular neighborhoods just chosen force the resulting rational element to be regular semisimple, hence regular semisimple at every completion. For this element, membership in the allowed sets therefore gives local rational inversion everywhere.

Apply Proposition 8 to any prescribed coset of $R$, with these auxiliary conditions and the openings from Lemma 37 at the other fixed exceptional places. We spell out the two uniform conditions needed for that proposition.

At integral good places, exclude the closed set where the semisimple part lies on two independent root walls. In a maximal torus these intersections have codimension at least two, as does their image under the finite quotient by $W$. The conjugacy-quotient map has fibers of dimension $dim G - "rank" G$, so its inverse image still has codimension at least two. To see the fiber dimension directly, a fiber is a union of conjugates of $s u$, where $s$ is fixed semisimple and $u$ ranges over the unipotent variety of $C_G \( s \)$; the latter has dimension $dim C_G \( s \) - "rank" G$. These descriptions and codimension bounds spread to the integral models after excluding finitely many places [38] Theorem 6.11, p. 64. At every remaining integral place, Lemma 38 applies if the element is regular semisimple; otherwise it is in the allowed set by definition.

At a single pole, the place splits in the fixed splitting field used in Proposition 8. Use a split eight-dimensional vector representation. Choose the cocharacter to take distinct values on its eight weights, also after every relevant diagram translate. This requires avoidance of only finitely many hyperplanes in the cocharacter lattice. Order the exponents as $d_1 < dots.h.c < d_8$. In the single-pole normal form $g_L lambda \( t \)^e g_R$, require all initial principal minors of $g_R g_L$ in this order to be nonzero upon reduction. These conditions are nonempty open conditions: they hold at the identity. For each pole factor, at least one of the two disjoint complete basic parameter lists lies entirely before or after that factor. After cyclically combining the side factors as $g_R g_L$, this list occurs between fixed invertible translates. Its product map is dominant, so it meets the simultaneous principal-minor open set. This argument includes poles in the first or last factor; no boundary factor needs parameters on both sides. The $j$th characteristic coefficient then has a unique least-valuation term, of valuation $e \( d_1 + dots.h.c + d_j \) "ord"_v \( t \)$. The Newton polygon has eight segments of horizontal length one with distinct integral slopes. Hensel lifting therefore splits the characteristic polynomial into distinct linear factors over $k_v$. The centralizer torus is split: the vector representation has finite kernel, so its weights span the character space over $bb(Q)$, on which Galois now acts trivially. Split tori have rational inversion representatives by the lattice calculation above. The finitely many extra model or denominator exceptions are treated by the local openings, as provided by Proposition 8.

We have proved that every coset of $R$ has a regular semisimple representative $u$ for which $T = C_G \( u \)$ has everywhere locally rational inversion and character action containing $W$.

#proof[
  For the torus just constructed, the fiber over inversion in $N_G \( T \) arrow.r N_G \( T \) \/ T$ is a $T$-torsor. It has a point over every completion, and Lemma 39 makes its class zero. Choose a rational representative $x$ of inversion. The common-square calculation following Equation (8.1) gives $x^2 = \( u x \)^2 = 1$. Neither involution is central, because each induces nontrivial inversion on the positive-dimensional torus $T$. Thus $u = \( u x \) x$ is killed by Lemma 36. Every coset of $R$ is trivial, so $G \( k \) \/ G \( k \)^e = 1$. By Proposition 5, an arbitrary noncentral abstract normal subgroup has finite index and contains such a power subgroup. It is consequently all of $G \( k \)$. ◻
]

== 9 Groups of type $E_6$ <sec:e6>

The last case reduces a generic rational element to a product from a subgroup of type $D_4$ and the centralizer of a root involution. That centralizer has types $A_1$ and $A_5$. The geometric product decomposition alone is insufficient: we will identify its rational descent obstruction as a torsor under a simply connected semisimple group, and arrange the required local points.

#thm([Theorem 9.1.])[
  #emph[Let $k$ be a number field and let $G$ be an absolutely almost simple simply connected $k$-group of type $E_6$. Every noncentral abstract normal subgroup of $G \( k \)$ is $G \( k \)$.]
] <thm:e6>

Again $A = diameter$, and only the $k$-anisotropic case needs proof. Fix $e gt.eq 1$, set $R = G \( k \)^e$, and write $q : G \( k \) arrow.r cal(Q) = G \( k \) \/ R$. Our goal is to kill each coset of this finite quotient.

=== 9.1 A rational root involution <a-rational-root-involution>

#thm([Lemma 9.2.])[
  #emph[The group $G \( k \)$ contains an involution geometrically conjugate to $alpha^or \( - 1 \)$ for a root $alpha$. Its centralizer $H$ is connected semisimple of type $A_1 A_5$, and its simply connected covering has geometric form 
#[#set math.equation(numbering: n => "(9.1)")
 $ pi : "SL"_2 times "SL"_6 arrow.r H_(macron(k)) \, #h(2em) ker pi = chevron.l \( - I_2 \, - I_6 \) chevron.r . $ <eq:e6-centralizer-cover>]

]
] <lem:e6-root-involution>

#proof[
  First work geometrically. The roots centralizing $alpha^or \( - 1 \)$ are $plus.minus alpha$ and the roots perpendicular to $alpha$. The latter form $A_5$. For example, the identity $sum_(beta in Phi \( E_6 \)) \( alpha \, beta \)^2 = 4 h^or = 48$, with $h^or = 12$, shows that forty of the seventy roots other than $plus.minus alpha$ have pairing $plus.minus 1$, leaving thirty perpendicular roots. The resulting rank-five subsystem is $A_5$. The determinant comparison $det \( A_1 \) det \( A_5 \) \/ det \( E_6 \) = 2 dot.op 6 \/ 3 = 4$ gives index two for its coroot lattice together with $alpha$ in the $E_6$ coroot lattice. Each individual summand is saturated: the square of any nontrivial saturation index would divide two or six, respectively. The kernel is therefore the diagonal subgroup of order two, proving Equation (9.1). Connectedness again follows from the semisimple-centralizer theorem.
  The geometric root-involution class is a closed semisimple orbit preserved by Galois, so it descends to a $k$-homogeneous space $X$ under $G$. Its full geometric stabilizer is the connected semisimple group just described. The ambient group is simply connected, and the stabilizer has no torus quotient. Borovoi’s theorem therefore gives a $k$-point of $X$ as soon as $X$ has points at every archimedean place [3] Proposition 3.4(i). No finite-place existence assertion is needed. We verify the real places explicitly.
  Over $bb(R)$, take a real maximal torus and identify its cocharacter lattice with $Q \( E_6 \)$. Complex conjugation is an involution on the six-dimensional vector space $Q \( E_6 \) \/ 2 Q \( E_6 \)$, so its fixed space has dimension at least three. The quadratic form
  $ overline(x) mapsto \( x \, x \) \/ 2 med \( mod med 2 \) $
  on this space is nondegenerate, since $det \( E_6 \) = 3$ is odd. The thirty-six root pairs give thirty-six distinct vectors of value one. Indeed if $alpha - beta = 2 x$, then $\( x \, x \) = 1 - \( alpha \, beta \) \/ 2$; evenness of the root lattice permits this only for $beta = plus.minus alpha$. A nondegenerate quadratic form in dimension six over $bb(F)_2$ has either twenty-eight or thirty-six vectors of value one. Ours consequently has minus type and Witt index two, with the root pairs exhausting its value-one vectors. A three-dimensional fixed subspace cannot be totally singular. Its value-one vector is a real two-torsion point in the required root-involution class.
  Existence over $bb(C)$ is immediate. All the archimedean hypotheses of Borovoi’s theorem are now satisfied, giving a rational root involution $n in G \( k \)$ and completing the proof. ◻
]

Fix $n$ as in the lemma, put $H = C_G \( n \)$, and denote its simply connected cover over $k$ by $pi : tilde(H) arrow.r H$. Its almost simple factors have types $A_1$ and $A_5$, for which (MP) is now known.

=== 9.2 The generic $D_4$ subgroup <the-generic-d_4-subgroup>

#thm([Lemma 9.3.])[
  #emph[There is a nonempty $k$-open subset $cal(U) subset G$ with the following property. For $u in cal(U) \( k \)$, set $n' = u n u^(- 1)$ and $t = n' n$. Then $t$ is regular semisimple, with maximal torus $T = C_G \( t \)$, and the roots of $T$ that conjugation by $n$ sends to their negatives generate a simply connected $k$-subgroup $D_(*)$ of type $D_4$. The group $D_(*)$ contains $n$ and $n'$ as geometrically conjugate elements, and contains $t$ in its maximal torus $T_(*) = D_(*) ∩ T$, on which $n$ acts by inversion.]
] <lem:e6-generic-d4>

#proof[
  Work first over $macron(k)$. Number the $E_6$ diagram by the chain $1 \, 3 \, 4 \, 5 \, 6$, with node $2$ attached to node $4$, and let $delta$ be its diagram involution, as in Figure 1. The four roots
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  line((2, -0.585), (2, 1.485), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((0, 0), (4, 0), (2, 0), (2, 0.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, -0.03528), [$1$], anchor: "north")
  circle((1, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1, -0.03528), [$3$], anchor: "north")
  circle((2, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, -0.03528), [$4$], anchor: "north")
  circle((3, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, -0.03528), [$5$], anchor: "north")
  circle((4, 0), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4, -0.03528), [$6$], anchor: "north")
  circle((2, 0.9), radius: 0.09978, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, 0.9353), [$2$], anchor: "south")
})],
    caption: [Figure 1: The $E_6$ numbering used in Equation (9.2). Reflection in the dashed axis is $delta$: it exchanges $1$ with $6$ and $3$ with $5$, and fixes $2 \, 4$. ],
  ) <fig:e6-diagram>
  #[#set math.equation(numbering: n => "(9.2)")
   $ alpha_2 \, quad alpha_4 \, quad alpha_3 + alpha_4 + alpha_5 \, quad alpha_1 + alpha_3 + alpha_4 + alpha_5 + alpha_6 $ <eq:e6-fixed-roots>]
  have the $D_4$ Gram matrix: the first has pairing $- 1$ with each of the other three, which are mutually perpendicular. They span the full $delta$-invariant sublattice of $Q \( E_6 \)$. Indeed successive differences give $alpha_3 + alpha_5$ and $alpha_1 + alpha_6$, along with $alpha_2 \, alpha_4$. Their lattice is thus saturated. Its squared-length-two vectors are exactly its $D_4$ roots, so the $delta$-fixed roots form this subsystem. The associated subgroup $D$ is simply connected, since its coroot lattice is saturated in that of $G$.
  Let $T_0$ be the ambient maximal torus and $S$ the rank-four maximal torus of $D$. There is no root perpendicular to $S$. Such a root would belong to the anti-invariant space of $delta$ and satisfy $delta alpha = - alpha$, impossible because a diagram automorphism preserves positive roots. Thus a nonempty open subset $S_(upright("reg"))$ consists of elements regular in $G$, with centralizer $T_0$.
  Inversion in $D$ acts on the full root space as $- 1$ on the $delta$-invariant space and as $1$ on its perpendicular complement. It therefore represents the longest Weyl element $w_0 = - delta$ of $E_6$. By the $D_4$ calculation it has a representative of order two, which is conjugate inside $D$ to a root involution. We may conjugate our chosen $n$ geometrically so that it is this representative. For every $s in S$, the element $s n$ is conjugate to $n$ inside $D$: choose $r in S$ with $r^2 = s$ and use $r n r^(- 1) = s n$.
  Consider the morphism into the $G$-conjugacy class of $n$ given by
  $ H times S_(upright("reg")) arrow.r "Cl"_G \( n \) \, #h(2em) \( h \, s \) mapsto h \( s n \) h^(- 1) . $
  Its fibers have dimension two. In fact equality with the value at $\( h_0 \, s_0 \)$ implies, on multiplying by $n$, that $a = h_0^(- 1) h in H$ satisfies $a s a^(- 1) = s_0$. Regularity forces $a in H ∩ N_G \( T_0 \)$, and $a$ determines $s$. Conversely each such $a$ preserves $S = "im" \( 1 - n : T_0 arrow.r T_0 \)$, since it commutes with $n$; this holds for every component of $H ∩ N_G \( T_0 \)$. It also preserves $S_(upright("reg"))$, so it gives the corresponding input in the same fiber. The identity component of $H ∩ N_G \( T_0 \)$ is the fixed subtorus of $w_0 = - delta$, of dimension two. As $dim H = 3 + 35 = 38$, the image has dimension
  $ 38 + 4 - 2 = 40 = 78 - 38 = dim "Cl"_G \( n \) . $
  It therefore contains an open subset of the class.
  For every point in this image, the asserted subgroup is $h D h^(- 1)$ and its torus is $h S h^(- 1)$: multiplication by $n$ gives the regular element $h s h^(- 1)$. Intrinsically, these are recovered from the roots on which $n$ acts as minus one. This intrinsic description is Galois-invariant. The resulting property holds on a Galois-stable dense constructible subset, which contains a nonempty $k$-open subset. Pulling it back under $u mapsto u n u^(- 1)$ gives $cal(U)$. The same intrinsic description then defines $D_(*)$ and $T_(*)$ over $k$, with all the claimed properties. ◻
]

=== 9.3 The full pullback and the factorization torsor <the-full-pullback-and-the-factorization-torsor>

We next justify the rational descent of the preceding geometric factorization. It is important here to identify the entire pullback subgroup, not just its identity component.

#thm([Lemma 9.4.])[
  #emph[For $u in cal(U) \( k \)$, let $D_(*)$ be as in Lemma 42, and put 
$ J = C_(D_(*)) \( n \) = D_(*) ∩ H \, #h(2em) tilde(J) = pi^(- 1) \( J \) subset tilde(H) . $

 Then $tilde(J)$ is connected semisimple simply connected. The variety 
#[#set math.equation(numbering: n => "(9.3)")
 $ Y_u = { \( w \, tilde(q) \) in D_(*) times tilde(H) : w pi \( tilde(q) \) = u } $ <eq:e6-factorization-torsor>]

 is a torsor under $tilde(J)$ and has points over every nonarchimedean completion of $k$.]
] <lem:e6-pullback>

#proof[
  Over $macron(k)$, conjugate $n$ inside $D_(*)$ to the root representative. The four rank-one factors covering $J$ then map to $tilde(H)_(macron(k)) = "SL"_2 times "SL"_6$ by
  #[#set math.equation(numbering: n => "(9.4)")
   $ \( a \, b \, c \, d \) mapsto #scale(x: 120%, y: 120%)[\(] a \, "diag" \( b \, c \, d \) #scale(x: 120%, y: 120%)[\)] . $ <eq:e6-four-block-map>]
  The distinguished root factor maps to the $A_1$ factor, and the three perpendicular factors map to three disjoint two-dimensional blocks of $A_5$. This is an injective homomorphism. The simultaneous minus one maps to $\( - I_2 \, - I_6 \)$, the full kernel of $pi$, and the resulting quotient is exactly $J$, by Equation (8.1). Hence the image of Equation (9.4) contains the kernel of $pi$ and surjects onto $J$. It is therefore the full inverse image $pi^(- 1) \( J \)$, not merely its connected component. This identifies that inverse image geometrically with $"SL"_2^4$; descent proves that $tilde(J)$ is connected semisimple simply connected over $k$.
  The variety $Y_u$ is geometrically nonempty, since $n'$ is conjugate to $n$ inside $D_(*)$. Indeed if $w n w^(- 1) = n'$, then $w^(- 1) u in H$, and this element lifts through $pi$ over $macron(k)$. The right action
  $ \( w \, tilde(q) \) dot.op y = #scale(x: 120%, y: 120%)[\(] w pi \( y \) \, y^(- 1) tilde(q) #scale(x: 120%, y: 120%)[\)] \, #h(2em) y in tilde(J) \, $
  is simply transitive on geometric points. For two factorizations, the ratio of their $D_(*)$ factors lies in $D_(*) ∩ H = J$, and the ratio of their covering factors is its unique specified lift in $tilde(J)$. Thus Equation (9.3) is a $tilde(J)$-torsor. Local $H^1$-vanishing for simply connected semisimple groups gives its points at every nonarchimedean place [25]. ◻
]

To use this torsor, we must choose local factorizations that are small in the $tilde(H)$ factor. The next elementary observation ensures that the square root used for this purpose remains in the varying torus $T_(*)$.

Fix a faithful representation of $G$. At any completion, sufficiently near the identity, the matrix analytic square root $t mapsto t^(1 \/ 2)$ is defined and commutes with conjugation. For all the tori $T_(*)$ in Lemma 42, one can choose this neighborhood uniformly so that

#[#set math.equation(numbering: n => "(9.5)")
 $ t in T_(*) quad arrow.r.double quad t^(1 \/ 2) in T_(*) . $ <eq:e6-uniform-root>]

Indeed these tori form one geometric conjugacy class of subtori, and $t$ is regular semisimple, so its image in the fixed representation is diagonalizable. In such a diagonalization their character relations are a fixed finitely generated lattice of monomial relations, up to a permutation of the eigenvalues. The square root is defined by a convergent matrix power series and commutes with conjugation. Its eigenvalues are uniformly near one when the original matrix is near one: a bound on the matrix norm bounds the absolute values of all its eigenvalues, without any bound on a diagonalizing matrix. Every defining monomial evaluated on the root eigenvalues has square one, because $t in T_(*)$. After shrinking a single neighborhood using the finite list of relations, each such monomial must be one, proving Equation (9.5). This argument applies also at the places above two, by choosing a smaller analytic neighborhood.

#proof[
  The restriction of $q compose pi$ to $tilde(H) \( k \)$ is controlled by (MP) for its $A_1$ and $A_5$ factors, using Theorem 31 in the outer case. By Lemma 6, it extends to a continuous homomorphism on their finite products of anisotropic finite local groups. Choose a finite set $B$ containing these places and all archimedean places. At each finite place in $B$, a sufficiently small identity neighborhood in $tilde(H) \( k_v \)$ is killed by this local homomorphism.
  Take any coset of $R$. The approximation conclusion of Proposition 5 gives a representative $u in cal(U) \( k \)$ arbitrarily close to one at all places of $B$. Use the notation of Lemma 42. For $v in B$, the element $t = u n u^(- 1) n$ is close to one. Set $w_v = t^(1 \/ 2) in T_(*) \( k_v \)$, using Equation (9.5). Since $n$ inverts $T_(*)$, we have
  $ w_v n w_v^(- 1) = w_v^2 n = t n = n' . $
  Thus $w_v^(- 1) u in H \( k_v \)$ is close to one. The central isogeny $pi$ is an analytic local isomorphism at one, so this element lifts to $tilde(q)_v in tilde(H) \( k_v \)$ close to one. At the finite places in $B$ the lift can be placed in the chosen kernel neighborhoods. At the archimedean places this construction supplies the local point of $Y_u$ that is needed for the Hasse principle.
  Lemma 43 supplies points of $Y_u$ at all other finite places. The Hasse principle for torsors under simply connected semisimple groups gives a rational point. After trivializing the torsor by this point, weak approximation for the same groups gives a rational point $\( w \, tilde(q) \)$ approximating the specified local points at $B$ [25]. Consequently
  $ u = w pi \( tilde(q) \) . $
  Theorem 35 kills $w in D_(*) \( k \)$ under $q$, since a group of type $D_4$ has no anisotropic finite places. The local kernel conditions and Lemma 6 kill $pi \( tilde(q) \)$. Thus $q \( u \) = 1$. Every coset of $R$ has been killed, so $G \( k \) \/ G \( k \)^e = 1$. The finite-index conclusion of Proposition 5 now gives the stated assertion for every noncentral abstract normal subgroup. ◻
]

=== 9.4 Completion of the normal-subgroup theorem <completion-of-the-normal-subgroup-theorem>

#proof[
  The established cases recalled in Section 2, Theorem 31, Theorem 35, and Theorem 40 exhaust the absolutely almost simple simply connected groups over number fields. Their proofs give, in every case, the vanishing of the finite defect for the abstract power subgroup $R = G \( k \)^e$:
  $ R = delta^(- 1) \( P_0 \) \, #h(2em) P_0 = overline(delta \( R \)) lt.closed product_(v in A) G \( k_v \) \, #h(2em) P_0 med upright("open") . $
  For the established cases this equality follows directly from (MP); for the remaining cases it is the conclusion of the preceding arguments.
  Let now $N lt.closed G \( k \)$ be any abstract normal subgroup not contained in the center. Proposition 5 gives $\[ G \( k \) : N \] < oo$. Choose $e$ to be the exponent of the finite group $G \( k \) \/ N$, so that $R subset N$. Density of the diagonal, and openness of $P_0$, identify
  $ G \( k \) \/ R tilde.eq (product_(v in A) G \( k_v \)) \/ P_0 . $
  The normal subgroup $N \/ R$ therefore corresponds to a normal subgroup of this finite local quotient. Its full inverse image $W$ in $product_(v in A) G \( k_v \)$ is open and normal, and $N = delta^(- 1) \( W \)$.
  If $A$ is empty, the local product, its quotient, and $W$ are all the one-element group. The same argument gives $R = G \( k \)$ and hence $N = G \( k \)$. No finite-generation or closedness hypothesis on $N$ has entered the argument. ◻
]

#heading(level: 1)[References]
#bibitem([1])[M.~Aschbacher, #link("https://www.ams.org/notices/200407/fea-aschbacher.pdf")[The status of the classification of the finite simple groups], Notices Amer. Math. Soc. #strong[51] (2004), no.~7, 736--740.]
#bibitem([2])[A.~Borel and J.~Tits, #link("https://doi.org/10.1007/BF02684375")[Groupes réductifs], Publ. Math. Inst. Hautes Études Sci. #strong[27] (1965), 55--150.]
#bibitem([3])[M.~Borovoi, #link("https://doi.org/10.1515/crll.1995.473.181")[The Brauer--Manin obstructions for homogeneous spaces with connected or abelian stabilizer], J. Reine Angew. Math. #strong[473] (1996), 181--194.]
#bibitem([4])[Y.~Cao and F.~Xu, Strong approximation with Brauer--Manin obstruction for toric varieties, Ann. Inst. Fourier (Grenoble) #strong[68] (2018), no.~5, 1879--1908. #link("https://doi.org/10.5802/aif.3199")[doi:10.5802/aif.3199].]
#bibitem([5])[V.~I.~Chernousov, On projective simplicity of certain groups of rational points over algebraic number fields, Math. USSR-Izv. #strong[34] (1990), no.~2, 409--423; Russian original, Izv. Akad. Nauk SSSR Ser. Mat. #strong[53] (1989), no.~2, 398--410. #link("https://doi.org/10.1070/IM1990v034n02ABEH000657")[doi:10.1070/IM1990v034n02ABEH000657].]
#bibitem([6])[C.~Ciobotaru, #link("https://doi.org/10.5802/jolt.828")[A unified proof of the Howe--Moore property], J. Lie Theory #strong[25] (2015), no.~1, 65--89.]
#bibitem([7])[J.-L.~Colliot-Thélène, #link("https://doi.org/10.5802/afst.751")[L'arithmétique des variétés rationnelles], Ann. Fac. Sci. Toulouse Math. (6) #strong[1] (1992), no.~3, 295--336.]
#bibitem([8])[J.-L.~Colliot-Thélène, J.-J.~Sansuc, and P.~Swinnerton-Dyer, #link("https://doi.org/10.1515/crll.1987.374.72")[Intersections of two quadrics and Châtelet surfaces.~II], J. Reine Angew. Math. #strong[374] (1987), 72--168.]
#bibitem([9])[J.~H.~Conway, R.~T.~Curtis, S.~P.~Norton, R.~A.~Parker, and R.~A.~Wilson, #emph[Atlas of Finite Groups: Maximal Subgroups and Ordinary Characters for Simple Groups], Clarendon Press, Oxford, 1985.]
#bibitem([10])[W.~Feit and G.~M.~Seitz, #link("https://doi.org/10.1215/ijm/1255988808")[On finite rational groups and related topics], Illinois J. Math. #strong[33] (1989), no.~1, 103--131.]
#bibitem([11])[J.~Fulman and R.~Guralnick, #link("https://doi.org/10.1090/S0002-9947-2012-05427-4")[Bounds on the number and sizes of conjugacy classes in finite Chevalley groups with applications to derangements], Trans. Amer. Math. Soc. #strong[364] (2012), no.~6, 3023--3070.]
#bibitem([12])[H.~Furstenberg and Y.~Katznelson, #link("https://doi.org/10.1007/BF02790016")[An ergodic Szemerédi theorem for commuting transformations], J. Analyse Math. #strong[34] (1978), 275--291.]
#bibitem([13])[S.~Garion, M.~Larsen, and A.~Lubotzky, #link("https://doi.org/10.1515/CRELLE.2011.117")[Beauville surfaces and finite simple groups], J. Reine Angew. Math. #strong[666] (2012), 225--243.]
#bibitem([14])[P.~Gille, Le problème de Kneser--Tits, Séminaire Bourbaki, 2007/2008, Exp.~983, Astérisque #strong[326] (2009), 39--81.]
#bibitem([15])[R.~E.~Howe and C.~C.~Moore, #link("https://doi.org/10.1016/0022-1236(79)90078-8")[Asymptotic properties of unitary representations], J. Funct. Anal. #strong[32] (1979), no.~1, 72--96.]
#bibitem([16])[M.-A.~Knus, A.~Merkurjev, M.~Rost, and J.-P.~Tignol, #emph[#link("https://doi.org/10.1090/coll/044")[The Book of Involutions]], American Mathematical Society Colloquium Publications, vol.~44, American Mathematical Society, Providence, RI, 1998.]
#bibitem([17])[S.~Lang, #link("https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf")[Algebraic groups over finite fields], Amer. J. Math. #strong[78] (1956), 555--563.]
#bibitem([18])[R.~P.~Langlands, #emph[#link("https://doi.org/10.1007/BFb0079929")[On the Functional Equations Satisfied by Eisenstein Series]], Lecture Notes in Mathematics, vol.~544, Springer-Verlag, Berlin--New York, 1976.]
#bibitem([19])[G.~Malle and D.~Testerman, #emph[#link("https://doi.org/10.1017/CBO9780511994777")[Linear Algebraic Groups and Finite Groups of Lie Type]], Cambridge Studies in Advanced Mathematics, vol.~133, Cambridge University Press, Cambridge, 2011.]
#bibitem([20])[G.~A.~Margulis, Finiteness of quotient groups of discrete subgroups, Funct. Anal. Appl. #strong[13] (1979), no.~3, 178--187; Russian original, Funktsional. Anal. i Prilozhen. #strong[13] (1979), no.~3, 28--39. #link("https://doi.org/10.1007/BF01077485")[doi:10.1007/BF01077485].]
#bibitem([21])[G.~A.~Margulis, #emph[Discrete Subgroups of Semisimple Lie Groups], Ergebnisse der Mathematik und ihrer Grenzgebiete (3), vol.~17, Springer-Verlag, Berlin, 1991.]
#bibitem([22])[J.~S.~Milne, #emph[#link("https://www.jmilne.org/math/CourseNotes/CFT.pdf")[Class Field Theory]], version~4.03, August~6, 2020.]
#bibitem([23])[J.~Neukirch, #emph[#link("https://doi.org/10.1007/978-3-662-03983-0")[Algebraic Number Theory]], translated from the German by N.~Schappacher, Grundlehren der mathematischen Wissenschaften, vol.~322, Springer-Verlag, Berlin, 1999.]
#bibitem([24])[V.~P.~Platonov and A.~S.~Rapinchuk, Multiplicative structure of division algebras over number fields and the Hasse norm principle, Trudy Mat. Inst. Steklov. #strong[165] (1984), 171--187; English translation, Proc. Steklov Inst. Math. #strong[165] (1985), 187--205.]
#bibitem([25])[V.~Platonov and A.~Rapinchuk, #emph[Algebraic Groups and Number Theory], translated by R.~Rowen, Pure and Applied Mathematics, vol.~139, Academic Press, 1994.]
#bibitem([26])[G.~Prasad and A.~S.~Rapinchuk, #link("https://doi.org/10.1007/BF02698836")[Computation of the metaplectic kernel], Publ. Math. Inst. Hautes Études Sci. #strong[84] (1996), 91--187.]
#bibitem([27])[G.~Prasad and A.~S.~Rapinchuk, Developments on the congruence subgroup problem after the work of Bass, Milnor and Serre, in #emph[Collected Papers of John Milnor], vol.~V, #emph[Algebra], American Mathematical Society, Providence, RI, 2010, pp.~307--325.]
#bibitem([28])[M.~S.~Raghunathan, On the group of norm $1$ elements in a division algebra, Math. Ann. #strong[279] (1988), 457--484. #link("https://doi.org/10.1007/BF01456282")[doi:10.1007/BF01456282].]
#bibitem([29])[A.~S.~Rapinchuk, The Margulis--Platonov conjecture for $upright(S L)_(1 \, D)$ and $2$-generation of finite simple groups, Math. Z. #strong[252] (2006), 295--313. #link("https://doi.org/10.1007/s00209-005-0854-1")[doi:10.1007/s00209-005-0854-1].]
#bibitem([30])[A.~S.~Rapinchuk, #link("https://arxiv.org/abs/2603.27472v1")[The congruence subgroup property for $S$-arithmetic subgroups of simple algebraic groups when $S$ has positive Dirichlet density], preprint, arXiv:2603.27472v1, 2026.]
#bibitem([31])[A.~Rapinchuk and A.~Potapchik, Normal subgroups of $upright(S L)_(1 \, D)$ and the classification of finite simple groups, Proc. Indian Acad. Sci. (Math. Sci.) #strong[106] (1996), no.~4, 329--368.]
#bibitem([32])[A.~S.~Rapinchuk, Y.~Segev, and G.~M.~Seitz, Finite quotients of the multiplicative group of a finite dimensional division algebra are solvable, J. Amer. Math. Soc. #strong[15] (2002), no.~4, 929--978. #link("https://doi.org/10.1090/S0894-0347-02-00393-4")[doi:10.1090/S0894-0347-02-00393-4].]
#bibitem([33])[I.~Reiner, #emph[#link("https://doi.org/10.1093/oso/9780198526735.001.0001")[Maximal Orders]], corrected reprint of the 1975 original, London Mathematical Society Monographs, New Series, vol.~28, Clarendon Press, Oxford, 2003.]
#bibitem([34])[J.-J.~Sansuc, #link("https://doi.org/10.1515/crll.1981.327.12")[Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de nombres], J. Reine Angew. Math. #strong[327] (1981), 12--80.]
#bibitem([35])[Y.~Segev, On finite homomorphic images of the multiplicative group of a division algebra, Ann. of Math. (2) #strong[149] (1999), no.~1, 219--251. #link("https://doi.org/10.2307/121024")[doi:10.2307/121024].]
#bibitem([36])[Y.~Segev and G.~M.~Seitz, Anisotropic groups of type $A_n$ and the commuting graph of finite simple groups, Pacific J. Math. #strong[202] (2002), no.~1, 125--225. #link("https://doi.org/10.2140/pjm.2002.202.125")[doi:10.2140/pjm.2002.202.125].]
#bibitem([37])[T.~A.~Springer, #link("https://doi.org/10.1007/BF01390173")[Regular elements of finite reflection groups], Invent. Math. #strong[25] (1974), 159--198.]
#bibitem([38])[R.~Steinberg, #link("https://doi.org/10.1007/BF02684397")[Regular elements of semi-simple algebraic groups], Publ. Math. Inst. Hautes Études Sci. #strong[25] (1965), 49--80.]
#bibitem([39])[R.~Steinberg, #emph[#link("https://doi.org/10.1090/memo/0080")[Endomorphisms of Linear Algebraic Groups]], Memoirs of the American Mathematical Society, no.~80, American Mathematical Society, Providence, RI, 1968.]
#bibitem([40])[B.~Sury, Congruence subgroup problem for anisotropic groups over semilocal rings, Proc. Indian Acad. Sci. (Math. Sci.) #strong[101] (1991), no.~2, 87--110. #link("https://doi.org/10.1007/BF02868019")[doi:10.1007/BF02868019].]
#bibitem([41])[G.~Tomanov, On the structure of algebraic groups over global fields, Math. Ann. #strong[288] (1990), no.~3, 515--526. #link("https://doi.org/10.1007/BF01444546")[doi:10.1007/BF01444546].]
#bibitem([42])[G.~M.~Tomanov, On the reduced norm $1$ group of a division algebra over a global field, Math. USSR-Izv. #strong[39] (1992), no.~1, 895--904.]
#bibitem([43])[D.~Wei, #link("https://doi.org/10.1007/s10114-021-8193-7")[Strong approximation for a toric variety], Acta Math. Sin. (Engl. Ser.) #strong[37] (2021), no.~1, 95--103. Preprint version: #link("https://arxiv.org/abs/1403.1035v3")[arXiv:1403.1035v3], 2019.]
#bibitem([44])[H.~Weyl, #link("https://doi.org/10.1007/BF01475864")[Über die Gleichverteilung von Zahlen mod.~Eins], Math. Ann. #strong[77] (1916), no.~3, 313--352.]
#bibitem([45])[R.~Wilson, P.~Walsh, J.~Tripp, I.~Suleiman, R.~Parker, S.~Norton, S.~Nickerson, S.~Linton, J.~Bray, and R.~Abbott, #emph[#link("https://brauer.maths.qmul.ac.uk/Atlas/v3/")[ATLAS of Finite Group Representations]], version~3.004, online database, accessed September~23, 2026.]


