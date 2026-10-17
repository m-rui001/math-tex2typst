#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Donovan's Conjecture over Algebraically Closed Fields]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $p$ be a prime and let $K$ be an algebraically closed field of characteristic $p$. A block of a finite group algebra $K G$ is a summand $K G b$ defined by a primitive central idempotent $b$. Its defect group is a $p$-subgroup of $G$, determined up to conjugacy, that measures how far the block is from being semisimple. Two blocks are $K$-linearly Morita equivalent when their module categories are equivalent by a $K$-linear functor. Donovan’s conjecture asks whether a fixed finite $p$-group can occur as the defect group of only finitely many blocks up to this equivalence. The question constrains an entire representation category by local group data: neither the order of $G$ nor the dimensions of its simple modules are fixed, and the block need not be principal. We prove the conjecture in the following bounded-order form.

#thm([Theorem 1.1.])[
  (Donovan’s conjecture).  #emph[Fix a prime $p$, an algebraically closed field $K$ of characteristic $p$, and a positive integer $M$. As $G$ ranges over finite groups and $b$ over block idempotents of $K G$ with defect groups of order at most $M$, only finitely many $K$-linear Morita equivalence classes of $K G b$ occur. In particular, over this field $K$, Donovan’s conjecture holds for every finite $p$-group, including nonabelian groups.]
] <thm:donovan>

The bounded-order formulation is equivalent to the formulation with one fixed defect group: there are only finitely many isomorphism types of groups of bounded order. The field $K$ is fixed while the finite group and block vary; the theorem concerns equivalences of module categories over that field. The resulting finite list also bounds Cartan entries, Loewy lengths of basic algebras, and, in each fixed degree, dimensions of extension groups between simple modules.

The proof first treats $k = overline(bb(F))_p$, which is the coefficient field used in the main argument below. After choosing an embedding $k arrow.r.hook K$, every block over $K$ descends to a unique block over $k$ with the same defect groups, by the coefficient comparison of [58] Section 2.1. Extending the Morita bimodules then transfers the finite list from $k$ to $K$; this final step is given in Section 9.6.

=== 1.1 Previous work <previous-work>

The conjecture is attributed to Peter Donovan and appears as Conjecture M in Alperin’s account of problems in group representation theory [1]. Its Cartan-boundedness component grows out of a question of Brauer; Hiss emphasized the additional rationality obstruction [39]. Kessar proved that field-valued Donovan finiteness separates into Cartan boundedness and bounded Morita–Frobenius numbers [46].

Scopes proved finiteness for symmetric-group blocks, and Kessar treated their double-cover families [61,45]. For unipotent blocks of general linear groups, Jost’s Morita reductions bound the rank in terms of the defect [44]. Combined with rationality, this gives finiteness across both ranks and field sizes; see [39] Example 5.3(2)–(3) for these results and their relationship. Thus uniformity in these two parameters already has an important type-A precedent. Hiss–Kessar developed Scopes reductions for unipotent blocks of classical groups, including orthogonal blocks with degenerate-symbol characters in the sequel [40,41].

Eaton–Livesey proved the field-valued conjecture for abelian $2$-groups [29]. Eaton–Eisele–Livesey established an integral finiteness criterion and an abelian-defect reduction to quasisimple blocks; together with Farrell–Kessar’s rationality bounds, this leaves Cartan boundedness as the remaining condition in that reduction [28,34]. An–Eaton treated extraspecial groups of order $p^3$ and exponent $p$ for $p gt.eq 5$, and reduced the corresponding case at $p = 3$ to a quasisimple Cartan bound [2]. Eaton treated blocks with Suzuki $2$-group defects [26]. The August 2026 preprint [27] Theorem 1.1 and Corollary 1.2 proves integral finiteness for quaternion defect groups and deduces finiteness for all tame blocks over $k$.

For extensions, Külshammer introduced crossed products and algebraic-group actions into the reduction of Donovan’s conjecture [48]. Eisele developed integral crossed-product reductions and proved finiteness of integral block Picard groups [30,31]. Their prime-to-$p$ crossed-product finiteness is an antecedent of the extension method below; the additional comparison here retains Sylow $p$-actions and their specified inner multiplication factors.

=== 1.2 The two uniformity problems <the-two-uniformity-problems>

The general theorem requires both multiplicity control and control of field of definition. Bounds on Cartan entries alone do not supply the latter. A Cartan entry records a composition multiplicity in a projective cover. Their sum is the dimension of a basic algebra, which represents the Morita class with all simple modules one-dimensional. Bounded dimensions do not by themselves confine its structure constants to one finite field. The Brauer–Feit bound on ordinary characters also bounds the number of simple modules in a block of bounded defect [11]; thus a Cartan-entry bound gives the required dimension bound. If both the dimension and the size of a finite field of definition are bounded, only finitely many multiplication tables can occur.

The multiplicity problem must also be uniform in parameters that the defect does not bound. In a group of Lie type, finite tori can grow even when the chosen block has small defect; a bound for a principal block with small Sylow subgroup does not address this case. The geometric construction below counts indecomposable projective factors rather than their vector-space dimensions, and estimates characters after projection to the chosen block. Classical rank requires a separate reduction to bounded rank or to a cuspidal series whose Harish–Chandra weight is bounded in terms of the defect order.

Likewise, passing from quasisimple groups to arbitrary groups needs more than a non-equivariant Morita–Frobenius bound on each component. Here coefficient Frobenius raises scalars to their $p$th powers, and a Morita–Frobenius bound controls how many iterations are needed to return to the Morita class. A group extension also specifies how its homogeneous components multiply: choices of coset representatives have products differing by elements of the normal subgroup. These inner factors remain part of the crossed algebra throughout the proof. We construct Frobenius comparisons compatible with the actions of Sylow $p$-subgroups in the crossed extensions and with those factors. Scalar discrepancies can then be removed; arbitrary central-unit discrepancies would not permit this normalization.

=== 1.3 The proof and its new ingredients <the-proof-and-its-new-ingredients>

The proof first establishes a uniform Cartan bound for quasisimple blocks of bounded defect. It then reduces a general block to crossed extensions of finitely many integral base orders and proves finiteness of the remaining crossed data. The Cartan estimate bounds the sizes of the basic algebras; the comparison controls their multiplication and descent data. Four constructions address the parameters that can still be unbounded. The two main outputs are Theorem 15, which supplies the Cartan bound, and Proposition 65, which supplies the equivariant comparison. Figure 1 shows their distinct roles in the final extension argument.

===== 1.3.1 Projective multiplicities in fixed root data. <projective-multiplicities-in-fixed-root-data.>

Section 3 constructs projective characters from tilting objects on the two-flag space, following Eteve’s construction [33]. The essential estimate bounds the sum of projective multiplicities in extraordinary stalks. Regular Lang local systems and a Kummer-cohomology calculation remove dependence on the size of the finite torus $p$-part. An ordinary-coordinate projection then bounds the character norms of projective indecomposable modules (PIMs). This estimate is uniform in the field size and monodromy parameter, but its root data remain fixed.

===== 1.3.2 Classical rank and projective cones. <classical-rank-and-projective-cones.>

Sections 4–6 deal with classical groups of unbounded rank. A single-cycle Jordan-label calculation makes the required ordinary induction rules available beyond uniform class functions. Harish–Chandra moves then act on projected cones of projective characters. Most moves are exact permutations after normalization. Here the cones are the nonnegative spans of PIM characters in selected ordinary-character coordinates. The remaining moves have summable errors, including a two-edge detour for the exceptional cohook configuration. Determinant and cone-volume estimates convert this control into bounds on the PIM columns. These moves need not be Morita equivalences. The runner language belongs to the lineage of Scopes’s abacus methods, Jost’s general-linear reductions, and Hiss–Kessar’s classical reductions [61,44,40,41]. Here the transported object is a cone of projective characters; its positivity and determinant bounds carry a numerical estimate through all classical families.

===== 1.3.3 The cuspidal endpoint. <the-cuspidal-endpoint.>

Runner reductions can leave a cuspidal label of unbounded rank: a staircase partition in the unitary case, or a two-row symbol with each row an initial interval of nonnegative integers in the other classical types. We call these labels cuspidal triangles. Section 7 treats this endpoint directly by modular Harish–Chandra induction. We construct the intertwiners, remove their extension obstruction, count the resulting Hecke-algebra simple types, and prove that their heads cover the required simple modules. The bound depends on the Harish–Chandra weight above the triangle, not on the triangle’s rank.

===== 1.3.4 Equivariant descent of crossed extensions. <equivariant-descent-of-crossed-extensions.>

Sections 8 and 9 address arbitrary finite groups. The generalized Fitting reduction leads to base blocks equipped with an actual inner factor system. We construct integral Morita comparisons with bounded Frobenius period whose reductions respect the Sylow actions and the specified inner factors. Their multiplication error is scalar, which can be removed over $k$; an arbitrary central-unit error would not suffice. Finite integral Picard groups then turn these comparisons into Frobenius descent retaining the chosen base algebra. Lang’s theorem and a Sylow restriction argument leave only finitely many crossed systems.

The role of the integral theory is confined to the base orders and their comparisons. The final removal of the large $p'$-kernel and the final crossed-product finiteness are over $k$. The finite lists of integral identity-component orders and the integral Morita bimodules with compatible projective transports also serve the subsequent integral companion over $W \( k \)$ [57]. The field proof given here is independent of that companion. The proof invokes established structural, block-theoretic and finite-reductive-group theorems with their hypotheses specified where they are used. The new uniformity, runner, endpoint and equivariance arguments are proved below.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (center, center,),
  inset: 4pt,
  table.cell(rowspan: 1, colspan: 1)[Fixed-root geometry; classical labels,

runner cones and triangle endpoints

Sections 3–7
], table.cell(rowspan: 1, colspan: 1)[Frobenius comparisons compatible

with Sylow actions and inner factors

Section 9
],
  table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
], table.cell(rowspan: 1, colspan: 1)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 1)[Bounded quasisimple Cartan entries

Theorem 15
], table.cell(rowspan: 1, colspan: 1)[Bounded equivariant Frobenius period

Proposition 65
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$arrow.br #h(2em) #h(2em) arrow.bl$
],
  table.cell(rowspan: 1, colspan: 2, align: center)[Generalized Fitting reduction and integral base finiteness

Comparison with trivial action: finitely many integral base orders

Full Sylow comparison: finitely many Sylow crossed systems

with the base algebra fixed

Section 8
],
  table.cell(rowspan: 1, colspan: 2, align: center)[$arrow.b.double$
],
  table.cell(rowspan: 1, colspan: 2, align: center)[Removal of the large $p'$-kernel and Sylow restriction

Finitely many $k$-linear Morita classes for bounded defect order

Theorem 64
],
)
]],
  caption: [Figure 1: The two controls used in the proof. Arrows indicate uses of the displayed outputs together with the structural and finiteness inputs stated in Section 8. The trivial-subgroup case of the comparison supplies integral base finiteness; its full Sylow form controls the multiplication in crossed extensions while keeping the specified base algebra fixed. Here $k = overline(bb(F))_p$; Section 9.6 extends the resulting finite list to each fixed algebraically closed field $K$ of characteristic $p$, completing Theorem 1. ],
) <fig:proof-interfaces>

Section 2 fixes the coefficient conventions and proves the transfer estimates used throughout. The first milestone is assembled in Section 4, using the fixed-root estimate of Section 3 and the classical arguments developed in Sections 5–7. Section 8 states the precise comparison property and proves that it suffices for finiteness. Section 9 constructs that comparison with the specified multiplication factors and proves finiteness over $k = overline(bb(F))_p$. Section 9.6 then transfers the finite list to the fixed algebraically closed field $K$, completing the proof of Theorem 1.

== 2 Block-theoretic bounds and transfer <sec:preliminaries>

We first isolate the block-theoretic transfers used in the two parts of the proof. The ordinary-coordinate estimate recovers full projective-character bounds from selected rows. The central, restriction and abelian-extension estimates then carry those bounds between the groups in the quasisimple reduction.

Fix a prime $p$, put $k = overline(bb(F))_p$, and let $cal(O) = W \( k \)$ be its Witt ring. The letter $M$ denotes an upper bound on defect-group order. Unless a further parameter is displayed, a uniform bound may depend on $p$ and $M$, but not on the ambient finite group. When ordinary characters are used, we extend scalars to a splitting characteristic-zero field. This leaves the decomposition numbers unchanged and extends each chosen integral Morita equivalence. We do not infer descent of an arbitrary equivalence from a splitting extension.

For a finite group $G$, a block is a nonzero primitive central idempotent $b$ of $k G$, or the corresponding summand $k G b$. The idempotent lifts uniquely to a block of $cal(O) G$, denoted by the same letter. A defect group is a maximal $p$-subgroup $D$ for which $"Br"_D \( b \) eq.not 0$. Here

$ "Br"_D : \( k G \)^D arrow.r k C_G \( D \) $

deletes coefficients of group elements outside $C_G \( D \)$. Morita equivalences throughout are linear over the indicated coefficient ring.

Write $"Irr" \( b \)$ for the ordinary irreducible characters in $b$, $"IBr" \( b \)$ for its irreducible Brauer characters, and $k \( b \) = \| "Irr" \( b \) \|$, $l \( b \) = \| "IBr" \( b \) \|$. If $chi^0$ is the restriction of $chi$ to $p$-regular elements, then

$ chi^0 = sum_(phi in "IBr" \( b \)) d_(chi phi) phi . $

The nonnegative integral matrix $D_b = \( d_(chi phi) \)$ is the decomposition matrix. Brauer reciprocity identifies its columns with the ordinary characters $Phi_phi$ of projective indecomposable modules (PIMs). Thus the Cartan matrix is

$ C_b = D_b^(sans(T)) D_b \, #h(2em) \( C_b \)_(phi psi) = chevron.l Phi_phi \, Phi_psi chevron.r_G . $

In particular, a bound on PIM norms bounds every Cartan entry by Cauchy–Schwarz.

We use the following standard facts of block theory [53,11]. The Brauer–Feit theorem bounds $k \( b \)$ in terms of defect-group order, and $l \( b \) lt.eq k \( b \)$. The elementary divisors of $C_b$ divide $\| D \|$; in particular

$ 0 < det C_b lt.eq \| D \|^(l \( b \)) . $

There is an ordinary character of height zero in every block. If $N lt.closed G$ and $B$ covers a block $b$ of $N$, defect groups can be chosen so that $D_b = D_B ∩ N$. Fong–Reynolds reduction replaces the covering problem by the inertia group of $b$, preserving Morita type and defect. If $b$ is invariant and $G \/ N$ is a $p$-group, then $b$ remains a block of $G$ and

$ D_B N = G . $

These assertions will only be used in these stated forms. We also use Clifford theory for restriction to a normal subgroup, including its projective multiplicity-space formulation.

=== 2.1 Central quotients and ordinary coordinates <central-quotients-and-ordinary-coordinates>

#thm([Lemma 2.1.])[
  (Central transfer).  #emph[Let $Z lt.eq Z \( G \)$ be a $p$-subgroup. Blocks of $G$ correspond to blocks of $G \/ Z$, every defect group contains $Z$, and corresponding defect orders differ by $\| Z \|$. Their simple modules correspond by inflation. With these identifications their Cartan matrices satisfy 
$ C_b = \| Z \| thin C_(macron(b)) . $

 In particular, Cartan bounds transfer in either required direction when $\| Z \|$ is bounded. For a central $p'$-subgroup $Z'$, the summand on which $Z'$ acts trivially is the averaging-idempotent summand and identifies with the group algebra of $G \/ Z'$.]
] <lem:central-transfer>

#proof[
  The block and defect assertions are the central-quotient theorem. For the Cartan assertion put $J = "rad" \( k Z \)$. The ideal $J k G$ is nilpotent and its quotient is $k \( G \/ Z \)$, so primitive projective covers correspond under passage to coinvariants. If $P$ is such a cover, then $P$ is projective, hence free, as a $k Z$-module. The canonical multiplication maps give
  $ \( J^i \/ J^(i + 1) \) ⊗_k \( P \/ J P \) med tilde.eq med J^i P \/ J^(i + 1) P . $
  They are isomorphisms of $G \/ Z$-modules: centrality makes the action on the first factor trivial, and changing a lift in $G$ changes the action only by the next radical layer. The sum of the dimensions of $J^i \/ J^(i + 1)$ is $\| Z \|$. Additivity of composition multiplicities therefore gives the displayed equality. For $Z'$, use $\| Z' \|^(- 1) sum_(z in Z') z$. ◻
]

A set $cal(B) subset.eq "Irr" \( b \)$ is an #emph[ordinary integral basic set] if the characters ${ chi^0 : chi in cal(B) }$ are a $bb(Z)$-basis of the Brauer character lattice. The corresponding square submatrix of $D_b$ then has determinant $plus.minus 1$. We also use basic sets for a direct sum of blocks.

#thm([Lemma 2.2.])[
  (Bounded inverse projection).  #emph[For blocks of defect order at most $M$, including unions of a bounded number of such blocks, let $V$ be the rational span of their PIM columns in ordinary-character coordinates. If a coordinate projection $pi$ is injective on $V$, its inverse 
$ \( pi \|_V \)^(- 1) : pi \( V \) arrow.r V $

 has uniformly bounded Euclidean operator norm. All full-column-size minors of a decomposition matrix, before or after coordinate projection, are uniformly bounded.]
  #emph[If a basic set for a union of blocks has bounded size and the $p$-defects of all its ordinary degrees are bounded, then the number and defect orders of those blocks, and hence the dimensions of their full ordinary-character coordinate spaces, are bounded. This bounds the numbers of ordinary irreducible characters, not their degrees.]
] <lem:row-projection>

#proof[
  Let the PIM columns be $v_1 \, dots.h \, v_l in bb(Z)^n$. Their exterior product is a nonzero integral vector, and Cauchy–Binet gives
  $ parallel v_1 and dots.h.c and v_l parallel^2 = det \( D_b^(sans(T)) D_b \) = sum_(\| I \| = l) det \( D_(b \, I) \)^2 . $
  The preceding standard bounds control $n \, l$ and this determinant. After padding the ambient coordinate spaces to one fixed dimension, only finitely many exterior products occur. Each determines the subspace $V$. There are also only finitely many coordinate projections in that dimension. Restricting to the injective ones, the maximum of their inverse norms is finite. The same identity bounds each displayed minor. For a bounded block union take the orthogonal direct sum.
  A basic set partitions by block. Indeed each ordinary character has Brauer constituents in its own block, and the Brauer lattice is the direct sum of the block lattices. The basis property consequently restricts to each summand, which must have at least one basic row. It remains to recover its defect from those rows. Fix a block $b$ in the union and put $cal(B)_b = cal(B) ∩ "Irr" \( b \)$. Write $\| G \|_p = p^a$, and let $b$ have defect $p^d$. Every ordinary degree in the block has $p$-valuation at least $a - d$. Some degree has valuation exactly $a - d$, by height zero. If every basic-row degree had larger valuation, evaluating its integral spanning expression at $1$ would give the same larger valuation for every ordinary degree, a contradiction. Thus
  $ d = max_(chi in cal(B)_b) v_p #scale(x: 120%, y: 120%)[\(] \| G \| \/ chi \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  The asserted bounds now follow from the bound on basic-set size and the Brauer–Feit theorem. ◻
]

This lemma bounds the projective #emph[subspace], not a selected nonnegative integral basis of it. That distinction lets us first estimate selected ordinary coordinates and only afterwards recover the full PIM norms.

=== 2.2 Crossed algebras and upward Cartan transfer <crossed-algebras-and-upward-cartan-transfer>

We record conventions for crossed algebras that will also be used in Section 8. A crossed algebra on a finite-dimensional $k$-algebra $R$, graded by a finite group $A$, has the form

$ T = xor.big_(x in A) R u_x \, #h(2em) u_x r = alpha_x \( r \) u_x \, #h(2em) u_x u_y = a_(x y) u_(x y) \, $

where each $u_x$ is invertible, $alpha_x in "Aut" \( R \)$, and $a_(x y) in R^times$. Associativity means

$ alpha_x alpha_y = "ad" \( a_(x y) \) alpha_(x y) \, #h(2em) a_(x y) a_(x y \, z) = alpha_x \( a_(y z) \) a_(x \, y z) . $

In the second equality $a_(x y \, z)$ denotes the factor with first index the group product $x y$. Replacing $u_x$ by $v_x u_x$, $v_x in R^times$, is called a change of homogeneous units.

If $e$ is a full basic idempotent of $R$, then $alpha_x \( e \)$ is unit-conjugate to $e$: both select one copy of each indecomposable projective type. Adjusting $u_x$ by such units makes it commute with $e$. Thus $e T e$ is again crossed on $e R e$, and $e$ is full in $T$. In particular

$ dim_k \( e T e \) = \| A \| dim_k \( e R e \) . $

The same argument applies to block orders and integral basic idempotents.

#thm([Lemma 2.3.])[
  (Transfer across an abelian quotient).  #emph[Suppose $N lt.closed G$ and $G \/ N$ is abelian. Among blocks $B$ of $G$ of defect order at most $M$, uniform Cartan bounds for their covered blocks of $N$ imply uniform Cartan bounds for $B$. No bound on the $p'$-part of $\| G \/ N \|$ is required.]
] <lem:abelian-transfer>

#proof[
  Apply Fong–Reynolds and assume the covered block $b$ is invariant. Let $G_p \/ N$ be the Sylow $p$-subgroup of $G \/ N$. The unique block of $G_p$ above $b$ has a defect group surjecting onto $G_p \/ N$; its order is bounded by a defect group of $B$. Consequently $\| G_p \/ N \| lt.eq M$. A basic corner of the crossed extension by this bounded group has bounded dimension, by the preceding observation. Its Cartan entries are therefore bounded. We may replace $N$ by $G_p$, leaving a $p'$-quotient $A$. The identity block is invariant; alternatively one may take its inertia group again.
  Pass to a full basic corner, and write $R$ for the identity algebra and $T$ for the resulting crossed algebra. The dimension of $R$ is bounded: for a basic algebra it is the sum of its Cartan entries, and its number $n$ of simple modules is bounded by defect. Put
  $ d = max_(i \, j) dim_k "Ext"_R^1 \( S_i \, S_j \) \, #h(2em) \( "rad" R \)^L = 0 . $
  Both $d$ and $L$ are bounded. Since $"rad" \( R \)$ is invariant, $"rad" \( R \) T$ is nilpotent. Maschke’s theorem for the crossed algebra on the semisimple quotient gives
  $ "rad" \( T \) = "rad" \( R \) T \, #h(2em) \( "rad" T \)^L = 0 . $
  The radical length is now controlled. To bound the basic algebra of the chosen block, it remains to bound the numbers of arrows in its quiver, that is, first extensions between its simple modules. Let $X \, Y$ be simple modules in the block of $T$ under consideration. Their restrictions are semisimple over $R$: the nilpotent ideal $"rad" \( R \) T$ annihilates both modules. Clifford theory describes the support of each restriction as one $A$-orbit of simple $R$-types. At each type its multiplicity space is an irreducible projective representation of the stabilizer. The scalar factor system accounts for the chosen intertwiners and the inner factors $a_(x y)$. Simplicity makes that projective representation irreducible.
  A $T$-projective resolution restricts to an $R$-projective resolution. The group action on its $R$-linear Hom complex is genuine, since the inner crossed factors cancel by $R$-linearity. As $\| A \|$ is invertible in $k$, taking invariants is exact. Thus $"Ext"_T^1 \( X \, Y \)$ is computed by invariant parts of the extension spaces between these semisimple restrictions. Decompose those spaces into orbits of pairs of simple types. For a representative pair $i \, j$, write the corresponding isotypic summands of $X \, Y$ as $S_i ⊗ V$ and $S_j ⊗ W$, respectively. Put $H = A_i ∩ A_j$ and $E = "Ext"_R^1 \( S_i \, S_j \)$, with the induced projective $H$-action. Restrict $V \, W$ from their stabilizers to $H$. The corresponding summand has dimension
  $ dim "Hom"_H \( V \, W ⊗ E \) \, #h(2em) dim E lt.eq d \, $
  with the compatible projective factors understood.
  For completeness, these multiplicity spaces need not have bounded dimensions. Instead their normalized character norms give
  #[#set math.equation(numbering: n => "(2.1)")
   $ dim "Hom"_H \( V \, W ⊗ E \) lt.eq dim \( E \) sqrt(\[ A_i : H \] \[ A_j : H \]) . $ <eq:ext-stabilizer-bound>]
  To see this, normalize the scalar factors to roots of unity of $p'$-order and realize the projective representations on compatible finite central $p'$-extensions. Such normalization is possible because scalar cohomology is killed by the group order. These semisimple representations lift to characteristic zero. On the common scalar-character summands, the character formula, $\| chi_E \( h \) \| lt.eq dim E$, and Cauchy–Schwarz reduce the estimate to
  $ frac(1, \| H \|) sum_(h in H) \| chi_V \( h \) \|^2 lt.eq \[ A_i : H \] \, #h(2em) frac(1, \| H \|) sum_(h in H) \| chi_W \( h \) \|^2 lt.eq \[ A_j : H \] . $
  These follow by enlarging the sums to the respective stabilizers, where the normalized squared norms are $1$. This proves (2.1).
  The two indices are at most $n$, since they count orbits of simple types under a subgroup of $A$; there are at most $n^2$ pair-orbit contributions. Hence the coarse uniform estimate
  $ dim "Ext"_T^1 \( X \, Y \) lt.eq d n^3 $
  suffices. The block of $T$ corresponding to $B$ has a bounded number $m$ of simple modules by its defect bound. Its basic algebra has $m$ vertices and at most $m^2 d n^3$ arrows. Lifts of a basis of its radical modulo its square generate the radical, so paths of length less than $L$ span that algebra. Its dimension, and therefore its Cartan entries, are bounded. ◻
]

=== 2.3 Restriction and decomposition rows <restriction-and-decomposition-rows>

The preceding lemma transfers Cartan bounds upwards even across an abelian quotient of unbounded $p'$-order. The next lemma supplies the complementary downward estimate: it controls decomposition numbers through restriction multiplicities, without requiring a bound on the index itself.

#thm([Lemma 2.4.])[
  (Restriction of rows).  #emph[Let $N lt.closed G$, and fix a block $b$ of $N$. Suppose that every block of $G$ covering $b$ has at most $L$ simple modules and decomposition numbers at most $c$. Suppose also that every simple module in these blocks restricts to $N$ with constituent multiplicities at most $u$. Then $b$ has decomposition numbers at most $L c u$. If $G \/ N$ is cyclic, one may take $u = 1$. If $C lt.eq Z \( G \)$, one may instead take $u = \[ G : N C \]$.]
] <lem:restriction-rows>

#proof[
  Choose an ordinary irreducible character upstairs whose restriction contains a given ordinary irreducible $chi$ downstairs. Decomposition commutes with restriction. On a fixed Brauer constituent $phi$ downstairs, the restriction of the decomposition upstairs has multiplicity at most $L c u$. Its other expression contains $chi^0$ with positive integral multiplicity. Nonnegativity therefore bounds every $d_(chi phi)$ by $L c u$.
  For the cyclic assertion, a simple $N$-type extends to its inertia group when the quotient is cyclic. Choose an intertwiner for a cyclic generator; its power differs from the required action by a scalar. Rescale it using a root of that scalar in $k$. The remaining multiplicity space is a simple module for a cyclic quotient, hence is one-dimensional even when $p$ divides its order. Clifford theory now gives multiplicity-free restriction.
  For the central-factor assertion, let $X$ be a simple $G$-module and $S$ a constituent of its restriction to $N$. The scalar character by which $C$ acts on $X$ extends $S$ to $N C$: its restriction to $N ∩ C$ agrees with the action on $S$. This extension is invariant under the inertia group $I$ of $S$. The Clifford multiplicity space is therefore simple for a twisted group algebra of $I \/ N C$. Its dimension is at most $\[ I : N C \] lt.eq \[ G : N C \]$, giving the claimed restriction bound. ◻
]

== 3 A Cartan bound for fixed root data <sec:geometry>

In this section the characteristic of the algebraic group is denoted by $r$, and the coefficient characteristic is the fixed prime $p eq.not r$. A root datum includes its character and cocharacter lattices, and hence the central torus as well as the semisimple roots.

#thm([Theorem 3.1.])[
  (Fixed-root Cartan bound).  #emph[Fix a finite collection $cal(R)$ of root data and a finite collection of the usual pinned diagram automorphisms and exceptional diagram isogenies on these data. There is a constant $C = C \( cal(R) \, p \, M \)$, also depending on this fixed collection of maps, with the following property. Let $upright(bold(G))$ be a connected reductive group over $overline(bb(F))_r$, with root datum in $cal(R)$, and let $F$ be a Steinberg endomorphism which, after an isomorphism of rational structures, has the form 
$ F = theta "Fr"_Q . $

 Here $Q$ is a power of $r$, $"Fr"_Q$ is split Frobenius, and $theta$ belongs to the specified finite collection; exceptional isogenies are allowed only in their prescribed defining characteristics. Put $Gamma = upright(bold(G))^F$. For every subgroup $Z lt.eq Z \( Gamma \)$ and every block $b$ of $k \[ Gamma \/ Z \]$ with defect groups of order at most $M$, all entries of the Cartan matrix of $b$ are at most $C$.]
] <thm:geometric-cartan>

The assertion places no bound on a Sylow $p$-subgroup of $Gamma$ or on the $p$-part of a rational maximal torus. We will construct projective modules using the horocycle correspondence, and bound their characters only after projection to the prescribed quotient block. The horocycle category and the passage from tilting sheaves to projective representations follow Eteve’s construction [33] Lemma 2.1.1 and Theorems 2.3.2, 3.1.1(ii), 3.2.4. Degree-zero projectivity of the corresponding tilting images was also obtained independently by Zhu [65] Theorem 4.91. The uniform estimates needed here are proved below: they must be independent of the rational torus and its monodromy parameter.

We use the following standard parts of Deligne–Lusztig theory for connected reductive groups with a Steinberg endomorphism, including its isogeny form, in the large-parameter range used below: torus duality, the partition into geometric Lusztig series, the character formula, orthogonality, and the uniform Steinberg formula. Their relevant forms are recalled when used; see [19] Theorems 4.2, 6.2 and 6.8, Proposition 5.22, Corollaries 6.3 and 7.14, and Section 11. All constructible sheaves have coefficient characteristic different from the geometric characteristic. Calculations with $k$-coefficients may be descended to a sufficiently large finite subfield of $k$, and integral calculations to a finite extension of a complete splitting discrete valuation ring. Tate twists do not affect any dimension below.

We use constructible descent and the six operations with finite coefficients, and their adic counterparts, as in [51,52]. For the finite local coefficient algebras below, the assertions needed in Lemma 7 are obtained after forgetting to a finite coefficient field, as in its proof; no self-duality assertion for an arbitrary finite local algebra is used.

=== 3.1 Strata and perfect extraordinary restrictions <strata-and-perfect-extraordinary-restrictions>

The first task is qualitative: the restrictions needed to glue standard objects must be perfect complexes over their stabilizer algebras. Once this is established, a separate estimate will bound the number of their indecomposable projective terms independently of the stabilizer orders.

Work with one root datum. Choose an $F$-stable Borel pair $upright(bold(T)) subset upright(bold(B)) = upright(bold(T)) upright(bold(U))$, write $W$ for the Weyl group, and let $ell$ be its length function. A bounded range of $Q$ gives only finitely many groups for the specified data. It may therefore be omitted until the end. In particular, assume $d F = 0$. For $x in W$, choose $dot(x) in N_(upright(bold(G))) \( upright(bold(T)) \)$, and put

$ upright(bold(G))_x = upright(bold(B)) dot(x) upright(bold(B)) \, #h(2em) C_x = upright(bold(G))_x \/ upright(bold(B)) \, #h(2em) A_x = upright(bold(T))^(x F) . $

The torus Lang map is an étale isogeny, so $A_x$ is a finite abelian group of order prime to $r$. It identifies with the rational points of a corresponding $F$-stable maximal torus $T_x$ of $upright(bold(G))$.

Define

$ cal(H) = { \( u t \, u' F \( t \) \) : u \, u' in upright(bold(U)) \, med t in upright(bold(T)) } \, #h(2em) cal(X) = \[ upright(bold(G)) \/ cal(H) \] \, $

where $\( b \, b' \)$ sends $g$ to $b g \( b' \)^(- 1)$. Its strata are $j_x : cal(X)_x = \[ upright(bold(G))_x \/ cal(H) \] arrow.r.hook cal(X)$. The torus Lang isogeny makes this action transitive on each stratum. The stabilizer of $dot(x)$ is

$ \( upright(bold(U)) ∩ zws^(dot(x)) upright(bold(U)) \) times.r A_x . $

Indeed its torus equation is $t = x F \( t \)$, and its unipotent equation is $u = zws^(dot(x)) u'$. The section of the torus quotient is $t mapsto \( t \, F \( t \) \)$.

Consequently ordinary inflation, without a shift, identifies

#[#set math.equation(numbering: n => "(3.1)")
 $ D_c^b \( cal(X)_x \, k \) tilde.eq D^b \( k A_x upright("-mod") \) . $ <geom:stratum-category>]

Here and throughout, constructibility includes finite-dimensional cohomology. To verify the identification, cohomology sheaves on the classifying stack are representations of the component group $A_x$. The components in the nerve of the stabilizer are affine spaces, since its connected unipotent radical is split. Their positive ordinary étale cohomology vanishes. Descent therefore computes Ext by the ordinary group-cohomology complex of $A_x$. Truncation proves the bounded derived assertion. This also explains why the equivalence retains modular extensions even when $p divides \| A_x \|$; compare [33] Lemma 2.1.1.

For a character $phi.alt : A_x arrow.r k^times$, let $L_(x \, phi.alt)$ be its one-dimensional module and let $E_(x \, phi.alt)$ be its projective cover. Writing $A_x = \( A_x \)_p times \( A_x \)_(p')$, we have

$ E_(x \, phi.alt) = k \[ \( A_x \)_p \] ⊗_k L_(x \, phi.alt) . $

Set

$ Delta_(x \, phi.alt) = j_(x \, !) E_(x \, phi.alt) \[ ell \( x \) \] \, #h(2em) nabla_(x \, phi.alt) = R j_(x \, *) E_(x \, phi.alt) \[ ell \( x \) \] . $

A standard, respectively costandard, flag is a finite filtration by extensions with factors of the displayed standard, respectively costandard, objects, without additional shifts.

Pullback to $upright(bold(G))$, followed by $\[ dim upright(bold(B)) \]$, makes both objects perverse. The cell has dimension $dim upright(bold(B)) + ell \( x \)$, its coefficient is lisse, and its inclusion is affine and quasi-finite: both $upright(bold(G))_x$ and $upright(bold(G))$ are affine. Apply affine quasi-finite perverse exactness [6] Corollary 4.1.3. These assertions hold on invariant open unions of cells as well, by base change.

We first prove the coefficient lemma that supplies perfection.

#thm([Lemma 3.2.])[
  #emph[Let $R$ be a finite-dimensional commutative local algebra over a finite field of characteristic $p$, with residue field $k_0$. Let $Y$ be a variety over an algebraically closed field of characteristic different from $p$, and let $cal(D)$ be a constructible sheaf of $R$-modules with projective geometric stalks. For a locally closed immersion $i : Z arrow.r.hook Y$ and a geometric point $z in Z$, the complex $\( R i^(!) cal(D) \)_z$ is perfect over $R$. The same statement holds after extension to algebraic coefficient fields when the data descend to finite coefficients.]
] <geom:flat-costalk>

#proof[
  Put $P = \( R i^(!) cal(D) \)_z$. Forgetting the coefficient action commutes with extraordinary restriction: the forgetful functor preserves injectives because its left adjoint is exact. Constructible finiteness therefore gives bounded finite $R$-cohomology for $P$. Projectivity on stalks says that $cal(D)$ is flat over $R$.
  For any bounded complex $B$ of finite free $R$-modules, adjunction with extension by zero gives the projection comparison
  $ P ⊗_R B arrow.r^tilde.op #scale(x: 120%, y: 120%)[\(] R i^(!) \( cal(D) ⊗_R B \) #scale(x: 120%, y: 120%)[\)]_z . $
  It is an isomorphism for $B = R$, hence for finite sums, shifts and cones. To extend this comparison to the residue field, take a bounded-above finite free resolution of $k_0$, and let $B_n$ be its brutal truncation in degrees $\[ - n \, 0 \]$. There is a finite module $N_n$ such that $"Cone" \( B_n arrow.r k_0 \) tilde.eq N_n \[ n + 1 \]$. Choose $b$ with $P in D^(lt.eq b) \( R \)$. Right $t$-exactness of derived tensor gives
  $ P ⊗_R^L N_n \[ n + 1 \] in D^(lt.eq b - n - 1) \( R \) . $
  Choose also an upper cohomological bound $d$ for $\( R i^(!) \( cal(D) ⊗_R k_0 \) \)_z$. Every finite $R$-module has a finite filtration by $k_0$. Flatness and the long exact cohomology sequence show that $\( R i^(!) \( cal(D) ⊗_R N \) \)_z in D^(lt.eq d) \( R \)$ for every finite module $N$, independently of the filtration length. Thus the error on the geometric side lies in $D^(lt.eq d - n - 1) \( R \)$. In every fixed degree both errors disappear for large $n$, giving
  #[#set math.equation(numbering: n => "(3.2)")
   $ P ⊗_R^L k_0 tilde.eq #scale(x: 120%, y: 120%)[\(] R i^(!) \( cal(D) ⊗_R k_0 \) #scale(x: 120%, y: 120%)[\)]_z . $ <geom:coefficient-change>]
  The right-hand side is bounded. A minimal bounded-above free resolution of $P$ has differentials in $"rad" R$; tensoring with $k_0$ kills them. Boundedness in (3.2) forces all but finitely many terms of that resolution to vanish. Hence $P$ is perfect. Extension of coefficients preserves the resulting finite projective complex. ◻
]

#thm([Lemma 3.3.])[
  #emph[For all $v \, x in W$ and $phi.alt$, the complex $j_v^(!) Delta_(x \, phi.alt)$ is perfect over $k A_v$. This remains true when the calculation is performed in an invariant open containing the two strata.]
] <geom:cross-perfect>

#proof[
  Suppress shifts and put $S = \( A_v \)_p$, embedded in $cal(H)$ as above; it fixes $dot(v)$. It suffices to restrict to $S$: since $\[ A_v : S \]$ is prime to $p$, a complex of $k A_v$-modules is a retract of the induction of its restriction to $S$. Changing equivariance from $cal(H)$ to $S$ is smooth pullback.
  Form the finite affine quotient $pi : upright(bold(G)) arrow.r Y = upright(bold(G)) \/ S$. The maps to the quotient and to the classifying stack give a representable finite morphism
  $ Pi : \[ upright(bold(G)) \/ S \] arrow.r Y times B S . $
  Indeed its pullback along the trivial-torsor atlas $Y arrow.r Y times B S$ is $pi$. Bruhat strata descend to locally closed subsets $Y_x$. Give them reduced structure, which has no effect on étale sheaves. Regard the finite pushforward $cal(D) = Pi_(*) \( j_(x \, !) E_(x \, phi.alt) \)$ as a sheaf on $Y$ of modules over $R = k S$. This is an ordinary sheaf: extension by zero is exact and finite pushforward has no higher ordinary cohomology. The identification with ring-valued sheaves follows from the finite étale nerve $Y times S^bullet$ of the displayed atlas.
  Every geometric stalk of $cal(D)$ is projective over $k S$. Over $Y_x$, a stalk is induced from the stabilizer in $S$ of one point of the corresponding orbit in $upright(bold(G))_x$. Such a stabilizer injects into $A_x$: torus projection is unchanged by conjugation in $cal(H)$, and its unipotent kernel has no nontrivial finite $p$-subgroup since $r eq.not p$. The stalk coefficient is consequently the restriction of $E_(x \, phi.alt)$ to a subgroup of $A_x$, which is projective; induction to $S$ preserves projectivity. Stalks outside $Y_x$ are zero.
  For $i : Y_v arrow.r.hook Y$, proper base change and localization commute $R i^(!)$ with $Pi_(*)$. At $pi \( dot(v) \)$ the reduced fiber is the single fixed point $dot(v)$, so the resulting stalk, with its $S$-action, is exactly the restriction to $S$ of the desired cross-costalk. The algebra $k S$ is commutative local. Lemma 7 applies after finite descent and proves perfection. All steps commute with restriction to an invariant open. ◻
]

=== 3.2 Uniformity without a bound on the finite torus <uniformity-without-a-bound-on-the-finite-torus>

We next bound the number of indecomposable projectives needed in the cross-costalks. Their vector-space dimensions are not suitable for this purpose, because $dim E_(x \, phi.alt) = \| \( A_x \)_p \|$ can grow.

A rank-one multiplicative Kummer sheaf on a torus means a rank-one summand of the direct image under an isogeny of degree prime to $p r$, with its multiplicative structure. For a fixed $x$, pullback of the stratum coefficients to $upright(bold(G))_x$ has the following description. Let

$ r_x : upright(bold(G))_x arrow.r upright(bold(T)) \, #h(2em) u dot(x) b mapsto t_b \, $

where $u in upright(bold(U)) ∩ zws^(dot(x)) upright(bold(U))^(-)$ and $t_b$ is the torus component of $b$. There are pairwise distinct multiplicative Kummer sheaves $cal(L)_phi.alt^x$ on $upright(bold(T))$, as $phi.alt$ varies, such that

#[#set math.equation(numbering: n => "(3.3)")
 $ L_(x \, phi.alt) \|_(upright(bold(G))_x) = r_x^(*) cal(L)_phi.alt^x \, #h(2em) E_(x \, phi.alt) \|_(upright(bold(G))_x) = r_x^(*) \( cal(L)_phi.alt^x ⊗ cal(P)_x \) . $ <geom:torus-coefficients>]

Here $cal(P)_x$ is the direct image of the constant sheaf under a torus isogeny with kernel $\( A_x \)_p$. Indeed the torus-coordinate equation in the orbit map is a torus Lang isogeny with kernel $A_x$. Factoring it into its $p$- and $p'$-parts proves (3.3). A character of the kernel gives a trivial local system only when it is trivial, because the covering torus is connected. This proves the asserted distinctness.

We record explicitly the geometric estimate for the rank-one part.

#thm([Lemma 3.4.])[
  #emph[Fix the root datum and $v \, x in W$. Let $V_v subset upright(bold(G)) \/ upright(bold(B))$ be the translated opposite big cell through $dot(v) upright(bold(B))$, with its natural section $s : V_v arrow.r upright(bold(G))$, and put $f = r_x compose s$ on $C_x ∩ V_v$. For every rank-one multiplicative Kummer sheaf $cal(L)$ on $upright(bold(T))$ of order prime to $p r$, the sum of the dimensions of the stalk cohomology of 
$ R j_(*) \( f^(*) cal(L) \) \, #h(2em) j : C_x ∩ V_v arrow.r.hook V_v \, $

 at any point of $C_v$ is bounded by a constant depending only on the root datum. Its restriction cohomology sheaves on $C_v$ are constant.]
] <geom:kummer-stalk>

#proof[
  The group $upright(bold(U))_v = upright(bold(U)) ∩ zws^(dot(v)) upright(bold(U))^(-)$ acts simply transitively on $C_v$. It preserves $V_v$, the section satisfies $s \( u z \) = u s \( z \)$, and the right torus coordinate is invariant under left $upright(bold(U))$. Thus the entire construction is $upright(bold(U))_v$-equivariant. Its restriction cohomology on $C_v$ is constant, and it suffices to work at $dot(v) upright(bold(B))$.
  Choose a reduced expression $x = s_1 dots.h.c s_d$. The associated Bott–Samelson variety $tilde(Z)_x$ is smooth and proper over the Schubert closure $overline(C)_x$, is an isomorphism over $C_x$, and has a simple normal-crossing boundary with $d$ distinguished divisors. In the gallery description these divisors are the conditions that successive flags are equal. Restrict this proper morphism over $V_v$. Its open complement is $C_x ∩ V_v$; write $tilde(j)$ for this open immersion and $pi$ for the restricted proper morphism. Then
  $ R j_(*) f^(*) cal(L) = R pi_(*) R tilde(j)_(*) f^(*) cal(L) . $
  We describe the cohomology sheaves of the star-extension on a boundary stratum. A character of a split torus modulo an integer $n$ prime to $p r$ defines its Kummer sheaf by taking an $n$-th root of a torus monomial. The pullback monomial is a unit on the open complement. In étale coordinates near a crossing it has the form
  $ u thin z_1^(a_1) dots.h.c z_t^(a_t) \, $
  where $u$ is a unit and the $z_i$ are parameters for the boundary divisors. Take $n$-th roots of the parameters and of $u$. The constant-coefficient cohomology of the punctured crossing is the exterior algebra on its $t$ parameter loops. Coordinate deck translations act trivially on this cohomology. Taking a character summand is exact because $p divides.not n$. It follows that the star-extension vanishes on this stratum if any of its local monodromy characters is nontrivial. Otherwise its cohomology sheaves are the extending rank-one Kummer sheaf tensored with exterior powers of $k \( - 1 \)^t$: trivial local monodromy makes the relevant boundary powers divisible by $n$, so the finite Kummer system extends across these divisors after removing the other boundary components. The loop lines are constant on the stratum: their residues are indexed by the globally distinguished divisors. In particular the sum of their ranks is at most $2^d$, independently of $n$.
  This bounds the ranks contributed by the boundary crossings. We now bound the cohomology of these coefficients over the proper fiber, using a filtration with uniformly boundedly many pieces of the form $bb(A)^a times bb(G)_m^b$. For proper base change, consider the fiber of $pi$ at $dot(v) upright(bold(B))$. Write $D_1 \, dots.h \, D_d$ for the equality divisors. Filter the fiber by the closed conditions that at least $m$ equalities hold, in descending order of $m$. Each layer is a finite disjoint union of its intersections with the exact strata
  $ D_I^compose = #scale(x: 180%, y: 180%)[\(] ⋂_(i in I) D_i #scale(x: 180%, y: 180%)[\)] without #scale(x: 180%, y: 180%)[\(] union.big_(j in.not I) D_j #scale(x: 180%, y: 180%)[\)] . $
  Deleting the steps in $I$ identifies an exact stratum in the fiber with the fiber of the uncompactified convolution for the remaining, possibly nonreduced, simple-reflection word, with every remaining step unequal. Subdivide further by recording the Bruhat position of every intermediate flag. Each nonempty piece is a product $bb(A)^a times bb(G)_m^b$, with the number of pieces and $a + b$ bounded in terms of $d$ and $\| W \|$. Here is the elementary gallery verification. Starting with the prescribed final flag, choose predecessors backwards in the relevant minimal-parabolic projective line. Its two Bruhat cells have dimensions differing by one. For an endpoint in the shorter cell, the equal predecessor is a point and the predecessors in the longer cell form $bb(A)^1$. For an endpoint in the longer cell, the equal predecessor is a point, the unequal predecessors in that cell form $bb(G)_m$, and the predecessor in the shorter cell is a point. The unipotent section of each Bruhat cell trivializes these alternatives algebraically as the endpoint varies. Induction gives the displayed products. Recording the initial position as the singleton cell $C_1$ enforces the initial flag without a further equation. To obtain a filtration on each exact equality stratum, use the morphism recording intermediate flags into a product of flag varieties. A linear ordering refining the product Bruhat order has closed lower ideals. Their inverse images give a filtration with the fixed-position records as its successive differences. Combining it with the equality filtration makes localization applicable, compatibly with the boundary strata. This is the simple-reflection construction in [38] Theorem 1.1, Proposition 5.3, Lemma 6.2, and Sections 6.2–6.3.
  On $bb(A)^a times bb(G)_m^b$, the Picard group is zero and every invertible regular function is a constant times a Laurent monomial. The Kummer exact sequence therefore expresses every rank-one local system of order dividing $n$ as a torus Kummer system. A nontrivial such system has zero torus cohomology: pull back to its finite prime-to-$p$ torus cover and use the fact that torus translations act trivially on cohomology. The constant system has total compact Betti number $2^b$, by Künneth and duality. Thus all the extending rank-one systems on the pieces have total compact Betti number at most $2^b$.
  Apply the cohomology-sheaf spectral sequence on each piece, followed by the finite localization filtration of the proper fiber. The local rank bound $2^d$, the number of pieces, and their dimensions give a bound depending only on the root datum. Proper base change proves the claimed stalk bound, uniformly in $r$, $n$, and $cal(L)$. More explicitly, there are at most $3^d$ backward records and each piece has $a + b lt.eq d$, so $12^d$ is a sufficient bound. ◻
]

Lemma 9 bounds the geometric contribution of one rank-one coefficient. We now sum over the possible characters on the receiving stratum. Character matching and the cohomology of a covering torus will prevent the degree of the Lang cover from entering this sum.

#thm([Proposition 3.5.])[
  #emph[For every integer $J gt.eq 0$, there is a constant $D_J$, depending only on the fixed root data and $J$, such that for all $v \, x \, phi.alt$ and $0 lt.eq j lt.eq J$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ sum_(psi in "Hom" \( A_v \, k^times \)) dim_k "Ext"_(cal(X))^j \( j_(v \, !) L_(v \, psi) \, j_(x \, !) E_(x \, phi.alt) \) lt.eq D_J . $ <geom:ext-bound>]

 The same bound holds, after increasing the constant if necessary, in invariant open unions containing the relevant strata. Bounded shifts of the two arguments are allowed by increasing $J$.]
] <geom:summed-ext>

#proof[
  First forget equivariance and compute on $upright(bold(G))$. The chart $V_v$ contains the whole cell $C_v$. Its section satisfies $r_v \( s \) = 1$ on $C_v$, and it gives a trivialization $upright(bold(G)) \|_(V_v) tilde.eq V_v times upright(bold(B))$. Since the first argument is extended by zero from this open, restriction to it computes the same Ext. Write $rho : V_v times upright(bold(B)) arrow.r V_v$ for projection, and $t_b$ for the torus coordinate of $b$. On $\( C_x ∩ V_v \) times upright(bold(B))$,
  $ r_x \( s \( z \) b \) = f \( z \) t_b . $
  By (3.3), the first coefficient is $cal(L)_psi^v \( t_b \)$. Tensor both arguments by its inverse and use adjunction for $rho^(*)$ and $R rho_(*)$.
  The module $E_(x \, phi.alt)$ has a filtration by copies of $L_(x \, phi.alt)$. The corresponding rank-one graded terms, after this twist, are external products with fiber coefficient
  $ cal(L)_phi.alt^x ⊗ \( cal(L)_psi^v \)^(- 1) . $
  Their ordinary direct images are extensions by zero from $C_x ∩ V_v$ of their fiber cohomology. To justify this assertion for the nonproper projection, use Verdier duality on the smooth fiber and compact-support Künneth for external products. This proves both restriction base change and vanishing outside the immersed base piece. The filtration transfers these two properties to the full coefficient. Its possibly large length is used only for these properties, not for a dimension estimate.
  A nontrivial multiplicative rank-one torus system has zero ordinary cohomology, by the torus-cover argument in the preceding proof. Consequently all Ext groups vanish unless
  #[#set math.equation(numbering: n => "(3.5)")
   $ cal(L)_psi^v tilde.eq cal(L)_phi.alt^x . $ <geom:character-match>]
  There is at most one such $psi$, by the distinctness in (3.3).
  In the matching case the coefficient on the immersed product is
  $ f^(*) cal(L)_phi.alt^x ⊗ cal(P)_x \( f \( z \) t_b \) . $
  The algebraic change of variable $t'_b = f \( z \) t_b$ identifies its ordinary fiber integral with
  $ f^(*) cal(L)_phi.alt^x ⊗ R Gamma \( upright(bold(T))'_x \, k \) \, $
  where $upright(bold(T))'_x arrow.r upright(bold(T))$ is the torus isogeny defining $cal(P)_x$; the unipotent part of $upright(bold(B))$ is acyclic. More explicitly, write this isogeny as $h$. The total cover $h \( t' \) = f \( z \) t_b$ is the product of the immersed base with $upright(bold(T))'_x$, by $\( z \, t' \) mapsto \( z \, f \( z \)^(- 1) h \( t' \) \, t' \)$. Thus the fiber integral is constant as a derived complex, without choosing a lift of $f$ through the isogeny. The covering torus has the same dimension as $upright(bold(T))$. Therefore the total dimension of this constant complex is $2^("rk" upright(bold(T)))$, independent of $\| \( A_x \)_p \|$. The direct image on all of $V_v$ is its extension by zero, by the base-change and vanishing just proved.
  It remains to bound
  $ R "Hom"_(V_v) \( a_(!) k \, j_(!) f^(*) cal(L)_phi.alt^x \) \, #h(2em) a : C_v arrow.r.hook V_v . $
  By adjunction this is $R Gamma \( C_v \, a^(!) j_(!) f^(*) cal(L)_phi.alt^x \)$. Verdier duality expresses its coefficient cohomology in terms of the restriction to $C_v$ of $R j_(*) \( f^(*) cal(L)_phi.alt^x \)^or$, with only the fixed smooth dimension shifts. Lemma 9 bounds these stalks and makes their cohomology constant on $C_v$. Since $C_v$ is affine space, ordinary cohomology of a constant sheaf is concentrated in degree zero. The resulting spectral sequence bounds the total Ext dimension by a root-datum constant. This proves the summed estimate on $upright(bold(G))$.
  The estimate on $upright(bold(G))$ is independent of the degree of the Lang cover. It remains to restore equivariance, retaining only the bounded range of cohomological degrees in the statement. Use the smooth atlas $upright(bold(G)) arrow.r cal(X)$. Cohomological descent for Hom gives a spectral sequence whose term in simplicial degree $a$ is an Ext group on $upright(bold(G)) times cal(H)^a$. Equivariance identifies the pulled back arguments with projection pullbacks from $upright(bold(G))$. Künneth and smooth base change multiply the preceding Ext groups by $H^(*) \( cal(H)^a \, k \)$. The inputs before shifts are ordinary sheaves, so these Ext degrees and the simplicial degrees are nonnegative. Only $a lt.eq J$ can contribute to total degree at most $J$. As a variety, $cal(H)$ is a product of a fixed-dimensional torus and affine space; its relevant Betti numbers, and hence those of these finitely many powers, depend only on the root datum and $J$. Taking dimensions in the spectral sequence proves (3.4). For invariant opens the first argument is extended by zero to the ambient space, so open adjunction and base change give the same calculation. Negative Ext degrees of ordinary sheaves are zero, which also proves the assertion about bounded shifts. For example, writing $t = "rk" upright(bold(T))$ and $d = max_(w in W) ell \( w \)$, the generous choice
  $ D_J = 2^t 12^d sum_(a = 0)^J 2^(a t) $
  bounds the sum in every degree at most $J$. ◻
]

=== 3.3 Gluing with a bounded number of standard factors <gluing-with-a-bounded-number-of-standard-factors>

We now combine perfection with the summed Ext estimate. Perfection reduces each gluing obstruction to two projective terms; the estimate bounds their multiplicities and hence the length of the standard flag constructed at the next stratum.

#thm([Proposition 3.6.])[
  #emph[There is a constant $L$, depending only on the fixed root data, such that for every $\( x \, phi.alt \)$ there is an object $cal(T)_(x \, phi.alt)$ with both a standard and a costandard flag. A specified standard flag has length at most $L$, contains $Delta_(x \, phi.alt)$ once, and has all remaining factors on strictly smaller Bruhat strata. Thus the standard multiplicity matrix is triangular, with identity diagonal blocks.]
] <geom:bounded-tiltings>

#proof[
  Choose a total ordering refining descending Bruhat order. Its initial unions are invariant opens. When the cell $x$ is added, start with the closed pushforward of $E_(x \, phi.alt) \[ ell \( x \) \]$, zero on the previous cells. This has both flags. Suppose the object $cal(M)$ has been constructed on an old open and $v$ is the next stratum, closed in the enlarged open. Write $j$ for the old open immersion and $i$ for the closed stratum immersion, and put
  $ K = i^(!) j_(!) cal(M) \[ - ell \( v \) \] . $
  The standard flag of $cal(M)$ and Lemma 8 make $K$ perfect over $k A_v$. The object $j_(!) cal(M)$ is perverse after atlas pullback and the fixed $\[ dim upright(bold(B)) \]$ shift, because it has a standard flag. Perverse cosupport on the smooth stratum gives $K in D^(gt.eq 0)$. Likewise $R j_(*) cal(M)$ is perverse because it has a costandard flag. The localization triangle and $i^(!) R j_(*) = 0$ give
  $ i^(*) R j_(*) cal(M) \[ - ell \( v \) \] tilde.eq K \[ 1 \] . $
  Perverse support puts the left-hand side in $D^(lt.eq 0)$. Thus $K$ has cohomology only in degrees $0 \, 1$.
  The algebra $k A_v$ is split symmetric, hence self-injective. Choose a minimal bounded complex of projectives representing $K$. If its first nonzero term were below degree zero, vanishing of that cohomology would make its differential injective; self-injectivity would split this injection, contradicting minimality. If its last term were above degree one, the preceding differential would be a surjection and would split by projectivity. Consequently
  $ K tilde.eq \[ P^0 arrow.r^delta P^1 \] \, $
  with the terms in degrees zero and one. Let $m_psi^q$ be the multiplicity of $E_(v \, psi)$ in $P^q$. The terms are also injective, so this complex computes $R "Hom"_(k A_v) \( L_(v \, psi) \, K \)$. Its differential is zero on the socle of every indecomposable injective summand: a map nonzero on that essential simple socle would be injective, and hence split, again contradicting minimality. Since the socle of $E_(v \, psi)$ is $L_(v \, psi)$, it follows that
  #[#set math.equation(numbering: n => "(3.6)")
   $ m_psi^q = dim_k "Ext"_(k A_v)^q \( L_(v \, psi) \, K \) \, #h(2em) q = 0 \, 1 . $ <geom:multiplicity-ext>]
  Let $N$ be the old standard-flag length. Adjunction turns the right-hand side of (3.6) into
  $ dim_k "Ext"^(q - ell \( v \)) \( j_(v \, !) L_(v \, psi) \, j_(!) cal(M) \) . $
  For a standard factor indexed by $\( y \, eta \)$, this is the Ext group between unshifted ordinary sheaves in degree $q + ell \( y \) - ell \( v \)$. If $d = max_(w in W) ell \( w \)$, these degrees lie between $- d$ and $d + 1$. Negative Ext degrees of ordinary sheaves vanish, so we may use $J = d + 1$ in Proposition 10. Taking long exact sequences along the standard flag gives a constant $D$ such that
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_psi m_psi^q lt.eq D N #h(2em) \( q = 0 \, 1 \) . $ <geom:glue-size>]
  Computations inside the enlarged open agree with the previous estimates by open extension adjunction.
  We have bounded the two projective terms of the obstruction. The next extension uses $P^1$ to add standard factors and $P^0$ to supply the matching costandard restriction. The triangle $K arrow.r P^0 arrow.r P^1 arrow.r K \[ 1 \]$ gives by adjunction a map $i_(*) P^1 \[ ell \( v \) \] arrow.r j_(!) cal(M) \[ 1 \]$. Let $cal(M)'$ be the corresponding extension, so that
  $ j_(!) cal(M) arrow.r cal(M)' arrow.r i_(*) P^1 \[ ell \( v \) \] arrow.r j_(!) cal(M) \[ 1 \] . $
  Its restrictions satisfy $j^(*) cal(M)' = cal(M)$ and $i^(*) cal(M)' = P^1 \[ ell \( v \) \]$, whereas $i^(!) cal(M)' = P^0 \[ ell \( v \) \]$. The displayed triangle gives a standard flag; the localization triangle
  $ i_(*) P^0 \[ ell \( v \) \] arrow.r cal(M)' arrow.r R j_(*) cal(M) $
  gives a costandard flag. By (3.7), the new standard length is at most $\( 1 + D \) N$.
  There are at most $\| W \| - 1$ extension steps, so $L = \( 1 + D \)^(\| W \| - 1)$ suffices. If the newly added stratum is outside $overline(cal(X)_x)$, its obstruction complex is zero and nothing is added. Thus the support stays in $overline(cal(X)_x)$, and the original factor on $x$ occurs exactly once. Taking a maximum over the finite collection of root data proves the proposition. ◻
]

=== 3.4 Projective representations from the correspondence <projective-representations-from-the-correspondence>

The objects just constructed have bounded flags. The next step turns them into projective group representations: the two flags force their character-functor images into degree zero, while Rickard’s cohomology complex supplies projectivity. For the degree bounds we first need affineness in a range uniform over the fixed data.

The ample-boundary method goes back to Deligne–Lusztig [19] Sections 9.5–9.7. For ordinary Frobenius, an affineness result for all field sizes is given in [12] Corollary 3.12; the argument here includes the specified exceptional diagram isogenies and only needs a uniform large-parameter range.

#thm([Lemma 3.7.])[
  #emph[For all sufficiently large $Q$, uniformly over the specified root data, maps $theta$, and $x in W$, the Deligne–Lusztig variety 
$ X \( x \) = { g upright(bold(B)) : g^(- 1) F \( g \) in upright(bold(G))_x } $

 is smooth affine of dimension $ell \( x \)$.]
] <geom:affineness>

#proof[
  Since $d F = 0$, the Lang map is étale. Its inverse image of $upright(bold(G))_x$ is a $upright(bold(B))$-bundle over $X \( x \)$, which proves smoothness and the dimension formula.
  Here is the ample-line-bundle argument for affineness, including the exceptional diagram isogenies. On $cal(B) = upright(bold(G)) \/ upright(bold(B))$ use the convention
  $ cal(L)_lambda = upright(bold(G)) times^(upright(bold(B))) overline(bb(F))_r zws_(- lambda) \; $
  strictly dominant characters define ample bundles. Choose such an integral $lambda$, which exists for every root datum. On $overline(C)_x$, the extremal-coordinate functional of weight $x lambda$ in a highest-weight representation gives a $upright(bold(B))$-semi-invariant section of $cal(L)_lambda$, of weight $- x lambda$, nonzero precisely on $C_x$. To check its vanishing on the boundary, along a saturated Bruhat step $y < y s_alpha$ one has
  $ y lambda - y s_alpha lambda = chevron.l lambda \, alpha^or chevron.r y alpha \, $
  a positive multiple of a positive root. Thus for $y < x$, $y lambda - x lambda$ is a nonzero sum of positive roots. Positive unipotents raise weights, so the coordinate of weight $x lambda$ vanishes on $C_y$ and is nonzero on $C_x$. The same calculation gives the claimed semi-invariance.
  The closure of the diagonal relative-position orbit of $x$ in $cal(B) times cal(B)$ is $upright(bold(G)) times^(upright(bold(B))) overline(C)_x$. Twisting the preceding section by the first-factor line of weight $x lambda$ makes it descend to a section of $cal(L)_(- x lambda) times.square cal(L)_lambda$ whose nonzero locus is the relative-position orbit itself. Pull back along the graph $u mapsto \( u \, F \( u \) \)$. On the projective inverse image of the orbit closure its line bundle is the restriction of
  $ cal(L)_(F^(*) lambda - x lambda) \, #h(2em) F^(*) lambda = Q theta^(*) lambda . $
  The pullback $theta^(*) lambda$ is strictly dominant: the induced map on flag varieties is finite, and finite pullback preserves ampleness. This includes inseparable exceptional isogenies. Therefore $Q theta^(*) lambda - x lambda$ is strictly dominant for all sufficiently large $Q$, with one threshold for the finitely many possibilities. The nonzero locus of a section of an ample line bundle on a projective scheme is affine, by passing to a very ample power. Here it is $X \( x \)$. For a torus the flag variety is a point. Compare [19] Sections 9.5–9.7. ◻
]

Let $upright(bold(B))_F^(upright("gr"))$ and $upright(bold(G))_F^(upright("gr"))$ denote the graphs of $F$, and use

$ cal(X) arrow.l^(med beta med) \[ upright(bold(G)) \/ upright(bold(B))_F^(upright("gr")) \] arrow.r^(med alpha med) \[ upright(bold(G)) \/ upright(bold(G))_F^(upright("gr")) \] tilde.eq B Gamma . $

The equivalence on the right is Lang’s theorem. The map $beta$ is smooth, with unipotent fiber $cal(H) \/ upright(bold(B))_F^(upright("gr")) tilde.eq upright(bold(U))$, and $alpha$ is proper with flag-variety fiber. With our ordinary stratum inflation, put $sans(C h) = R alpha_(!) beta^(*)$, without an additional shift. Pullback to a point of $B Gamma$ gives directly

#[#set math.equation(numbering: n => "(3.8)")
 $ sans(C h) \( Delta_(x \, phi.alt) \) & = R Gamma_c \( X \( x \) \, cal(E)_(x \, phi.alt) \) \[ ell \( x \) \] \,\
sans(C h) \( nabla_(x \, phi.alt) \) & = R Gamma \( X \( x \) \, cal(E)_(x \, phi.alt) \) \[ ell \( x \) \] . $ <geom:character-functor>]

Here $cal(E)_(x \, phi.alt)$ is the local system associated to $E_(x \, phi.alt)$ on the finite étale $A_x$-torsor

$ Y \( dot(x) \) = { g upright(bold(U)) : g^(- 1) F \( g \) in upright(bold(U)) dot(x) upright(bold(U)) } arrow.r X \( x \) . $

For clarity, the flag fiber is stratified by the condition $g^(- 1) F \( g \) in upright(bold(G))_x$. Write $g^(- 1) F \( g \) = c dot(x) \( c' \)^(- 1)$ with $\( c \, c' \) in cal(H)$. The stabilizer-component torsor maps to $g c upright(bold(U))$, and $\( c' \)^(- 1) F \( c \) in upright(bold(U))$ gives the defining equation of $Y \( dot(x) \)$. This identifies the coefficients and their left $Gamma$-action. Smooth base change for $beta$ handles star extensions, and properness of $alpha$ gives both formulas in (3.8). Thus their normalization follows from the fiber calculation itself.

By Lemma 12 and Artin vanishing,

$ sans(C h) \( Delta_(x \, phi.alt) \) in D^(gt.eq 0) \( k Gamma \) \, #h(2em) sans(C h) \( nabla_(x \, phi.alt) \) in D^(lt.eq 0) \( k Gamma \) . $

Indeed a lisse coefficient shifted by $ell \( x \)$ is perverse on the smooth affine $X \( x \)$. Affine Artin vanishing gives the ordinary cohomology bound, and duality gives the compact-support bound; the modular coefficient form follows from the same theorem after finite descent, as in [6] Section 4.0, Theorem 4.1.1 and Corollary 4.1.2. Both flags therefore put $sans(C h) \( cal(T)_(x \, phi.alt) \)$ in degree zero. Denote this module by $P_(x \, phi.alt)$.

#thm([Proposition 3.8.])[
  #emph[The modules $P_(x \, phi.alt)$ are projective. Let $hat(A)_x$ be the ordinary linear characters of $A_x$, with $xi mapsto macron(xi)$ their modular reductions, and set 
#[#set math.equation(numbering: n => "(3.9)")
 $ Psi_(x \, phi.alt) = \( - 1 \)^(ell \( x \)) sum_(xi in hat(A)_x\
macron(xi) = phi.alt) R_(T_x)^(upright(bold(G))) \( xi \) . $ <geom:torus-sum>]

 If $n_(x \, phi.alt \; y \, eta)$ are the multiplicities in the specified standard flag, the ordinary lift character of $P_(x \, phi.alt)$ is 
#[#set math.equation(numbering: n => "(3.10)")
 $ chi_(P_(x \, phi.alt)) = sum_(y \, eta) n_(x \, phi.alt \; y \, eta) Psi_(y \, eta) \, #h(2em) sum_(y \, eta) n_(x \, phi.alt \; y \, eta) lt.eq L . $ <geom:projective-character>]

 These projective characters and the $Psi_(x \, phi.alt)$ have the same linear span in characteristic zero, and that span contains the regular character of $Gamma$.]
] <geom:projective-images>

#proof[
  At a geometric point $g upright(bold(U))$ of $Y \( dot(x) \)$, the stabilizer for left translation by $Gamma$ lies in $Gamma ∩ g upright(bold(U)) g^(- 1)$, an $r$-group, and hence has order prime to $p$. Rickard’s equivariant cohomology theorem [59] Theorems 3.2 and 3.5 applies to this quasi-projective variety with the action of $Gamma times A_x$. Restricting the resulting complex to $Gamma$, Mackey decomposition gives summands of permutation terms induced from the intersections of point stabilizers with $Gamma$. These intersections are the $r$-groups just described. Thus the bounded complex is termwise projective over $Gamma$, compatibly with integral, residue, and characteristic-zero coefficients. The commuting right action of $A_x$ selects $cal(E)_(x \, phi.alt)$ by the idempotent for the specified character of $\( A_x \)_(p')$. This idempotent is integral over a splitting extension because its denominator is prime to $p$, and its direct summand remains perfect over $k Gamma$. Its ordinary Euler character is exactly $Psi_(x \, phi.alt)$: all ordinary characters lifting $phi.alt$ are selected, and the shift in (3.8) supplies $\( - 1 \)^(ell \( x \))$.
  Thus every standard image is perfect, and a standard flag makes $P_(x \, phi.alt)$ perfect. A finite module of finite projective dimension over the self-injective algebra $k Gamma$ is projective. Lifting projectives over a complete splitting discrete valuation ring identifies the projective Grothendieck groups before and after reduction. Taking the Euler classes of the standard flag proves (3.10); lifting the extension maps is unnecessary. Proposition 11 makes its multiplicity matrix triangular with identity diagonal blocks, so the two collections have the same span.
  Summing (3.9) over $phi.alt$ puts $R_(T_x)^(upright(bold(G))) \( "Reg"_(A_x) \)$ in this span for every $x$. In a uniform Steinberg formula [19] Corollary 7.14, formula (7.14.2), and Section 11, replace each trivial torus character by $"Reg"_(A_x) \/ \| A_x \|$. The Deligne–Lusztig character formula [19] Theorem 4.2 and Section 11 shows that the resulting class function agrees with $"St"_Gamma$ on unipotents, since the values of a torus-induced character there are independent of the linear torus character. It vanishes on every element with nonidentity semisimple part, since every corresponding torus evaluation is at a nonidentity element. The Steinberg character vanishes on nonidentity unipotents and has nonzero value at the identity. The resulting function is therefore
  $ frac("St"_Gamma \( 1 \), \| Gamma \|) "Reg"_Gamma . $
  This proves the final span assertion. ◻
]

=== 3.5 Projection to a block and the Cartan estimate <projection-to-a-block-and-the-cartan-estimate>

The projective characters now span the regular character, so they detect every projective indecomposable summand. Their full norms can still grow with the tori. The remaining estimate therefore uses only the ordinary coordinates in the chosen bounded-defect block, including after a central quotient.

For a finite group, write $chevron.l med \, med chevron.r$ for the ordinary character inner product and $parallel chi parallel^2 = chevron.l chi \, chi chevron.r$. Let $K \( M \)$ be a Brauer–Feit bound for the number of ordinary irreducible characters in any block with defect groups of order at most $M$.

#thm([Lemma 3.9.])[
  #emph[Let $cal(I)$ be any set of at most $K$ ordinary irreducible characters of $Gamma$, and let $"pr"_(cal(I))$ be their orthogonal coordinate projection. Then 
$ parallel "pr"_(cal(I)) Psi_(x \, phi.alt) parallel^2 lt.eq K \| W \|^3 \, #h(2em) parallel "pr"_(cal(I)) chi_(P_(x \, phi.alt)) parallel^2 lt.eq K L^2 \| W \|^3 . $

]
] <geom:projected-norm>

#proof[
  Deligne–Lusztig orthogonality gives $parallel R_(T_x)^(upright(bold(G))) \( xi \) parallel^2 lt.eq \| W \|$ for every linear torus character $xi$; see [19] Theorem 6.8 and Section 11. Hence every individual irreducible coefficient has absolute value at most $sqrt(\| W \|)$. Fix an irreducible character $rho$. By geometric-series disjointness and torus duality, the parameters $xi$ from a fixed torus whose Deligne–Lusztig characters contain $rho$ have dual semisimple elements in one geometric conjugacy class. The intersection of that class with the fixed dual maximal torus is one Weyl orbit. It has at most $\| W \|$ elements. Thus at most $\| W \|$ summands in (3.9) can contribute to the $rho$-coordinate, irrespective of how many ordinary characters lift $phi.alt$. Consequently
  $ \| chevron.l Psi_(x \, phi.alt) \, rho chevron.r \| lt.eq \| W \|^(3 \/ 2) . $
  Summing squares over $cal(I)$ proves the first inequality. Equation (3.10) and its bound $L$ on the number of factors prove the second. ◻
]

#proof[
  First assume $Q$ exceeds the uniform threshold used above. Take central coinvariants
  $ overline(P)_(x \, phi.alt) = k \[ Gamma \/ Z \] ⊗_(k Gamma) P_(x \, phi.alt) . $
  These are projective $k \[ Gamma \/ Z \]$-modules, since tensoring an exhibited summand of a free module gives a summand of a free quotient module. The same construction on integral projective lifts commutes with reduction. In characteristic zero its character is the coordinate projection onto irreducibles trivial on $Z$. This observation applies also when $p divides \| Z \|$. Project further to $b$, obtaining actual projective modules $Q_(x \, phi.alt) = b overline(P)_(x \, phi.alt)$.
  The regular-character span in Proposition 13 projects to the regular character of $b$: the coordinates of $"Reg"_Gamma$ on characters inflated from $Gamma \/ Z$ are exactly their degrees, as in $"Reg"_(Gamma \/ Z)$. Characters of projective indecomposable modules are linearly independent, and every such module in $b$ occurs with positive multiplicity in its regular module. Hence every projective indecomposable module of $b$ occurs as a summand of some $Q_(x \, phi.alt)$. Otherwise its coordinate would vanish in the span of all their projective characters, contradicting the regular-character assertion.
  Inflate the set $"Irr" \( b \)$ to $Gamma$. It has at most $K \( M \)$ members, so Lemma 14 gives
  $ parallel chi_(Q_(x \, phi.alt)) parallel^2 lt.eq K \( M \) L^2 \| W \|^3 . $
  If $Phi_i$ is an indecomposable projective character occurring in $chi_(Q_(x \, phi.alt))$, nonnegativity of ordinary multiplicities gives $parallel Phi_i parallel lt.eq parallel chi_(Q_(x \, phi.alt)) parallel$. The Cartan entries are $c_(i j) \( b \) = chevron.l Phi_i \, Phi_j chevron.r$, so Cauchy–Schwarz yields
  $ c_(i j) \( b \) lt.eq K \( M \) L^2 \| W \|^3 . $
  The root data are fixed throughout this estimate; both $\| W \|$ and $L$ depend only on their specified finite collection. Finally, the omitted bounded range of $Q$ contains only finitely many finite groups and central quotients. Increase the constant by the maximum of their relevant Cartan entries. This proves the theorem. ◻
]

== 4 Cartan bounds for quasisimple groups <sec:families>

We now reduce the quasisimple Cartan problem to the odd-prime classical calculations of the next three sections. Throughout this section, the coefficient prime is $p$, the defining characteristic of a finite reductive group is $r$, and $q$ is its defining field parameter. For a positive integer $a$, write $a_p$ for its $p$-part. For an ordinary irreducible character $chi$ of a finite group $H$, put

$ "def"_p \( chi \) = frac(\| H \|_p, chi \( 1 \)_p) . $

This is the degree defect, expressed as an order rather than an exponent. If $chi$ belongs to a block with defect group $D$, then $"def"_p \( chi \) lt.eq \| D \|$.

#thm([Theorem 4.1.])[
  (Quasisimple Cartan bound).  #emph[For every prime $p$ and positive integer $M$, there is a constant $C_(upright("qs")) \( p \, M \)$ such that every Cartan entry of every block of $k S$, where $S$ is quasisimple and its defect groups have order at most $M$, is at most $C_(upright("qs")) \( p \, M \)$.]
] <thm:quasisimple-cartan>

The proof uses Theorem 6 for bounded root data. For unbounded rank its inputs are Proposition 33 and Proposition 45, with the character and block identifications proved in Propositions 24, 28, and 32. Those propositions concern explicit reductive groups and do not use Theorem 15.

=== 4.1 Restriction and reductive-group conventions <restriction-and-reductive-group-conventions>

We record the consequence of restriction that will be used when a covering block can have large defect.

#thm([Corollary 4.2.])[
  #emph[Let $N lt.closed H$ with cyclic quotient, and let $b$ be a block of $N$. Suppose that every block of $H$ covering $b$ has one simple module and all its decomposition numbers are one. Then every decomposition number of $b$ is at most one. No defect bound on the covering blocks is required. If the original block $b$ has bounded defect, its Cartan entries are therefore bounded.]
] <fam:restriction>

#proof[
  Apply Lemma 5 with $L = c = u = 1$. The Cartan assertion uses only the Brauer–Feit bound for the number of ordinary rows of $b$. ◻
]

Write $J = upright(bold(J))^F$, where $upright(bold(J))$ is a connected reductive group over $overline(bb(F))_r$, and write $upright(bold(J))^(*)$ for its dual group with its dual endomorphism. We suppress the star on the latter endomorphism. If $s in upright(bold(J))^(* F)$ is semisimple, then $cal(E) \( J \, s \)$ denotes its ordinary Lusztig series. When $s$ has order prime to $p$, set

$ cal(E)_p \( J \, s \) = union.big_t cal(E) \( J \, s t \) \, $

where $t$ runs over the $p$-elements of $C_(upright(bold(J))^(*)) \( s \)^F$, with the usual conjugacy identifications. Here and in the reductive reductions below $r eq.not p$; defining characteristic is treated at the end of the section. The Broué–Michel theorem states that this is a union of blocks [15,18].

We use the following forms of standard reductive-group character theory. They also specify the hypotheses at every later application. If $Z \( upright(bold(J)) \)$ and $C_(upright(bold(J))^(*)) \( s \)$ are connected, Jordan decomposition identifies $cal(E) \( J \, s \)$ with the unipotent characters of $C_(upright(bold(J))^(*)) \( s \)^F$. Its degree formula is

#[#set math.equation(numbering: n => "(4.1)")
 $ chi \( 1 \) = \| upright(bold(J))^(* F) : C_(upright(bold(J))^(*)) \( s \)^F \|_(r') thin psi \( 1 \) \, #h(2em) "def"_p \( chi \) = frac(\| C_(upright(bold(J))^(*)) \( s \)^F \|_p, psi \( 1 \)_p) . $ <fam:jordan-degree>]

The torus-pairing rule identifies the pairings with corresponding unipotent Deligne–Lusztig characters, multiplied by $epsilon_(upright(bold(J))) epsilon_(C_(upright(bold(J))^(*)) \( s \))$, where $epsilon_(upright(bold(H))) = \( - 1 \)^("rk"_(bb(F)_q) \( upright(bold(H)) \))$. We use these two rules from [55]; see also [20] Equation (3.1) and Theorem 7.1. A compatibility statement for arbitrary nonuniform Levi induction is neither part of these rules nor assumed here. The particular induction matrices needed below are established in Proposition 28.

Unipotent character degrees and unipotent induction calculations are unchanged by central isogenies, with the standard identifications. Connected isogenous reductive groups have the same rational order. For a product of factors permuted by $F$, the calculation on one factor uses the composite endomorphism around its orbit. A #emph[packet] is a Frobenius orbit of classical factors of a connected centralizer, calculated on one factor with this composite endomorphism.

For the ordinary classical Frobenius structures used below, we make the unipotent identifications through connected kernels. Choose an $F$-equivariant regular embedding $upright(bold(H)) arrow.r.hook tilde(upright(bold(H)))$ with connected center and the same derived group. Put $H = upright(bold(H))^F$, $tilde(H) = tilde(upright(bold(H)))^F$, and $A = tilde(H) \/ H$, an abelian group. Twisting an upstairs unipotent character $tilde(chi)$ by a nontrivial linear character of $A$ changes its dual parameter from $1$ to a nontrivial central element. Series disjointness and Clifford theory therefore give

$ chevron.l "Res"_H tilde(chi) \, "Res"_H tilde(chi) chevron.r = sum_(nu in "Irr" \( A \)) chevron.l tilde(chi) \, tilde(chi) nu chevron.r = 1 . $

Restriction is thus irreducible. Every unipotent character of $H$ occurs in some $R_T^(upright(bold(H))) \( 1 \)$; the torus restriction formula lifts it to an upstairs unipotent character. Two upstairs unipotent characters with the same restriction differ by a quotient twist, so series disjointness makes them equal. This gives a bijection preserving degrees. Next, $tilde(upright(bold(H))) arrow.r upright(bold(H))_(upright("ad"))$ has connected central kernel. Lang’s theorem makes it surjective on rational points, and unipotent characters are trivial on that kernel. These two morphisms compare the forms through their common adjoint group; the relevant character and Levi diagrams are compatible by [20] Proposition 2.5(i), Theorem 9.1 and Corollary 9.2, with corresponding Levi preimages. Both identifications are bijections, so individual split type-$D$ labels remain distinct. Rationally permuted factors again use the composite Frobenius on one factor. This argument does not apply the connected-kernel statement to a finite disconnected central kernel; exceptional diagram isogenies remain in the separate bounded-root-data case.

Restriction through a regular embedding, and restriction to a connected derived subgroup, sends a Lusztig parameter to its dual projection. Geometric series suffice for these restriction statements; all later Jordan matrix calculations are made in groups with connected centers and connected semisimple centralizers.

For a good prime $p$ and connected $Z \( upright(bold(J)) \)$, the integral basic-set theorem [36] says that $cal(E) \( J \, s \)$ is an ordinary basic set for $cal(E)_p \( J \, s \)$. Thus its restrictions to $p$-regular elements form an integral basis of the Brauer character lattice of that block union. Its intersection with each block is nonempty and is a basic set for that block. We use this theorem for all primes in type A, and for odd primes in types B, C, and D. We do not apply it to type B, C, or D at $p = 2$.

#thm([Lemma 4.3.])[
  (Central quotients in the Levi equivalence).  #emph[Let $s in upright(bold(J))^(* F)$ be a semisimple $p'$-element, and let $upright(bold(L))^(*)$ be an $F$-stable Levi subgroup containing the full algebraic centralizer $C_(upright(bold(J))^(*)) \( s \)$. The Bonnafé–Rouquier equivalence matches the blocks in $cal(E)_p \( J \, s \)$ with those in the corresponding summand of $L = upright(bold(L))^F$, preserving their Cartan matrices. If $Z lt.eq Z \( upright(bold(J)) \)^F$ is contained in $L$, this equivalence restricts to the categories on which $Z$ acts trivially. In particular, it gives the corresponding equivalences after taking a common central quotient, including a quotient by a central $p$-subgroup.]
] <fam:br-central>

#proof[
  The full-centralizer containment allows us to apply the integral theorem [10] Theorem B$'$, Section 11.4. Its Deligne–Lusztig cohomology bimodule gives the asserted Morita equivalence. On the defining variety, left multiplication by a common rational central element agrees with right multiplication by that element. Hence $z m = m z$ on the equivalence bimodule, for every $z in Z$. The equivalence and its inverse consequently carry the full subcategory annihilated by all $z - 1$ to the corresponding full subcategory on the other side. These are exactly the module categories for the quotient algebras. This argument uses equality of the central actions; it does not use exactness of ordinary coinvariants on arbitrary modules. It applies over a splitting modular system and over $k$. When $Z$ has a $p'$-part, only blocks in its trivial central-character sector survive this quotient. The Cartan matrices of surviving matched blocks agree under Morita equivalence, and their largest elementary divisors give the equality of defect orders. ◻
]

=== 4.2 Linear and unitary groups <linear-and-unitary-groups>

Use the notation $"GL"_n^(+) \( q \) = "GL"_n \( q \)$, $"GL"_n^(-) \( q \) = "GU"_n \( q \)$, and similarly $"SL"_n^(+) \( q \) = "SL"_n \( q \)$, $"SL"_n^(-) \( q \) = "SU"_n \( q \)$. A block in $cal(E)_p \( J \, 1 \)$ will be called a unipotent block; its ordinary characters need not all be unipotent.

#thm([Proposition 4.4.])[
  #emph[Fix $p$ and $M$. To bound Cartan entries for blocks of defect order at most $M$ of all central quotients of $"SL"_n^epsilon.alt \( q \)$, with $r eq.not p$, it suffices to bound Cartan entries for unipotent blocks of $"GL"_m^eta \( Q \)$ of bounded defect order, where the new bound depends only on $p \, M$. At $p = 2$, these latter blocks have bounded rank.]
] <fam:type-a>

#proof[
  Let $b$ be the original block and put
  $ b_q = \( q - epsilon.alt \)_p \, #h(2em) h = \( gcd \( n \, q - epsilon.alt \) \)_p . $
  We use $b_q$ to distinguish this integer from the block $b$. Lift $b$ to $S = "SL"_n^epsilon.alt \( q \)$, and cover the lifted block in $J = "GL"_n^epsilon.alt \( q \)$. A central $p'$-kernel merely selects an averaging summand; a central $p$-kernel increases the defect order by its order, at most $h$. Since $J \/ S$ is cyclic of order $q - epsilon.alt$, every covering block $B$ satisfies
  #[#set math.equation(numbering: n => "(4.2)")
   $ \| D_B \| lt.eq M h b_q lt.eq M b_q^2 . $ <fam:a-cover-defect>]
  We first allow $b_q$ to be unbounded.
  Let $s$ be the $p'$-parameter of $B$. Its algebraic centralizer is a rational Levi with fixed points
  #[#set math.equation(numbering: n => "(4.3)")
   $ C_(upright(bold(J))^(*)) \( s \)^F tilde.equiv product_i "GL"_(m_i)^(epsilon.alt^(d_i)) \( q^(d_i) \) \, #h(2em) n = sum_i d_i m_i . $ <fam:a-centralizer>]
  Here $d_i$ is the length of the relevant eigenvalue orbit. The basic-set theorem supplies a character of $B ∩ cal(E) \( J \, s \)$. If its Jordan labels are partitions $lambda_i tack.r m_i$, the partition degree formula and (4.1) give
  #[#set math.equation(numbering: n => "(4.4)")
   $ "def"_p \( chi \) = product_i product_(u in sans(H) \( lambda_i \)) \( q^(d_i u) - epsilon.alt^(d_i u) \)_p \, $ <fam:a-hook-defect>]
  where $sans(H) \( lambda_i \)$ is the multiset of hook lengths, one for each box.
  If $b_q > 1$, lifting the exponent, applied to $x = epsilon.alt q$, yields
  #[#set math.equation(numbering: n => "(4.5)")
   $ \( x^j - 1 \)_p gt.eq \( x - 1 \)_p \( j \)_p = b_q \( j \)_p . $ <fam:a-lte>]
  For odd $p$ this is the usual equality. For $p = 2$ and odd $j$ it is also an equality. For even $j$, the formula
  $ v_2 \( x^j - 1 \) = v_2 \( x - 1 \) + v_2 \( x + 1 \) + v_2 \( j \) - 1 $
  implies the inequality, including the case $v_2 \( x - 1 \) = 1$. Absolute values are understood when $x < 0$. Consequently, if $t = sum_i m_i$, then
  #[#set math.equation(numbering: n => "(4.6)")
   $ b_q^t product_i \( d_i \)_p^(m_i) lt.eq "def"_p \( chi \) lt.eq M h b_q lt.eq M b_q^2 . $ <fam:a-multiplicity>]
  For $b_q > 2 M$, this forces $t lt.eq 2$. If some $m_i = 2$, it is the only factor and $n = 2 d_i$. Hence $h lt.eq \( 2 d_i \)_p lt.eq 2 \( d_i \)_p$, so the same inequality gives
  $ b_q^2 \( d_i \)_p^2 lt.eq 2 M \( d_i \)_p b_q \, #h(2em) b_q \( d_i \)_p lt.eq 2 M \, $
  a contradiction. Thus every $m_i = 1$: the centralizer is a torus.
  Lemma 17 now identifies $B$ with a block of a finite torus. Such a block has one simple module, and all its decomposition numbers are one. The integral equivalence gives the same decomposition matrix, up to labels, for $B$. This argument applies to every covering block, so Corollary 16 bounds all decomposition numbers of the lifted block of $S$ by one. Passing to the original central quotient only selects inflated ordinary rows and the corresponding simple modules: the central $p$-kernel acts trivially on every simple module. The original block still has defect order at most $M$, so its number of ordinary rows is bounded by the Brauer–Feit bound. Its Cartan entries, which are sums of products of entries in those rows, are bounded. No bound on the row count of $B$, or on its defect in this case, has been used.
  We may therefore assume $b_q lt.eq 2 M$. Then (4.2) bounds $\| D_B \|$ by $4 M^3$. Apply Lemma 17 to (4.3). In this Levi the parameter $s$ is central. Tensoring with its associated linear character identifies its $s$-summand with its unipotent summand. A block of the product is a tensor product of blocks, and its defect order is the product of their defect orders. At most $log_p \( 4 M^3 \)$ factors can have positive defect. Factors of defect zero have Cartan matrix $\( 1 \)$ and have no effect on a Cartan bound. This proves the stated reduction, followed by cyclic restriction and central descent.
  Finally suppose $p = 2$. Here every defining parameter $Q$ is odd, and every hook factor $\( Q^u - eta^u \)_2$ is at least two. Every basic row of a unipotent block of $"GL"_m^eta \( Q \)$ therefore has degree defect at least $2^m$. Bounded block defect bounds $m$, and Theorem 6 applies. ◻
]

=== 4.3 Regular classical root data <regular-classical-root-data>

The linear and unitary reduction has isolated unipotent blocks. For the other classical families we must retain both a central quotient and actual product decompositions of the Levis used later. The next construction supplies those groups before any character or runner calculation is made.

The regular embedding must supply three kinds of structure. The connectedness assertions are used in Jordan decomposition and, at odd $p$, in the basic-set theorem. Integral Levi splittings identify the actual product group algebras used in Harish–Chandra induction. Control of the residual central tori then keeps track of their contributions to degree defects, including after repeated extractions. We begin with the ordinary irreducible root systems, in particular $D_n$ with $n gt.eq 4$; smaller ranks already fall under Theorem 6. Rank-one orthogonal tori are nevertheless retained as residual factors and centralizer packets.

#thm([Lemma 4.5.])[
  #emph[For simply connected groups of types B, C, and D there are regular embeddings $upright(bold(S)) = \[ upright(bold(J)) \, upright(bold(J)) \] lt.eq upright(bold(J))$ with central torus rank at most three with the following properties.]
  + #emph[The groups $upright(bold(J))$, its dual, and all their Levi subgroups have connected centers and simply connected derived groups.]
  + #emph[Every extraction of linear blocks on split hyperbolic coordinates gives an actual direct product of these general linear groups with a residual reductive group. This holds for nested extractions and in graph-twisted type D.]
  + #emph[Every residual factor $upright(bold(R))$ has an inherited central torus $upright(bold(T))_R$, the image of the original connected center under the Levi product projection, of rank at most three. Its full connected center has rank at most four. The two tori agree except for the rootless orthogonal datum $D_1$, whose additional torus direction is retained as an $upright("SO")_2^plus.minus$ packet. With bounded residual semisimple rank, only finitely many residual root data and normalized Frobenius actions occur.]
] <fam:regular-datum>

#proof[
  We first construct the ambient lattice and its Frobenius action. We then split off the extracted general linear factors integrally. The remaining calculations identify the inherited central torus and show that bounded residual rank gives only finitely many residual root data.
  Let $V = bb(Q)^n$ with orthogonal coordinate vectors $e_i$. Denote the coroot lattice and coweight lattice of the chosen classical root system by $Q^or subset P^or$. Explicitly,
  $ & Q^or & P^or\
B_n & { a in bb(Z)^n : sum a_i upright(" is even") } & bb(Z)^n\
C_n & bb(Z)^n & bb(Z)^n union \( \( 1 / 2 \, dots.h \, 1 / 2 \) + bb(Z)^n \)\
D_n & { a in bb(Z)^n : sum a_i upright(" is even") } & bb(Z)^n union \( \( 1 / 2 \, dots.h \, 1 / 2 \) + bb(Z)^n \) . $
  Introduce a central space $bb(Q)^h$, with $h = 1 \, 1 \, 3$, respectively, and define an injective homomorphism $gamma : P^or \/ Q^or arrow.r bb(Q)^h \/ bb(Z)^h$ by the following table. Put $omega = \( 1 / 2 \, dots.h \, 1 / 2 \)$.
  #[#set math.equation(numbering: n => "(4.7)")
   $ & gamma \( e_i \) & gamma \( omega \)\
B_n & 1 / 2 & upright("not needed")\
C_n & 0 & 1 / 2\
D_n \, med n upright(" even") & \( 1 / 2 \, 1 / 2 \, 0 \) & \( 1 / 2 \, 0 \, 1 / 2 \)\
D_n \, med n upright(" odd") & \( 1 / 2 \, 1 / 2 \, 0 \) & \( 1 / 4 \, - 1 / 4 \, 1 / 2 \) . $ <fam:lattice-glue>]
  All central entries are read modulo $bb(Z)^h$. In odd rank D, $2 gamma \( omega \) = gamma \( e_i \)$; in even rank the two displayed classes of order two are independent. Thus these prescriptions respect exactly the relations in $P^or \/ Q^or$. Set
  #[#set math.equation(numbering: n => "(4.8)")
   $ Y = { \( a \, z \) in P^or xor bb(Q)^h : z + bb(Z)^h = gamma \( a + Q^or \) } \, #h(2em) X = "Hom" \( Y \, bb(Z) \) . $ <fam:Y>]
  Take the usual roots on $a$, extended by zero on $z$, and the usual coroots with zero central coordinate. They define a root datum on $\( X \, Y \)$. Indeed roots take integral values on $P^or$, coroots belong to $Y$, and the classical reflection formulas preserve the congruence because they change $a$ by a coroot.
  Injectivity of $gamma$ gives $Y ∩ \( V xor 0 \) = Q^or$. Since $Y arrow.r P^or$ is onto, $X ∩ V^(*) = Q$, the root lattice. These are the two saturation conditions for simply connected derived group and connected center; they remain true on dualizing. For a Levi subsystem, its simple roots form a subset of a simple-root basis, and likewise for coroots. Intersecting with their rational spans preserves these saturation conditions. This proves the assertions about every Levi and its dual. In particular their semisimple centralizers are connected, by the connected-centralizer theorem for simply connected derived groups.
  In type D the nontrivial diagram automorphism changes the sign of the last coordinate of $a$. Extend it on $z$ by exchanging $z_1 \, z_2$. For even $n$, it sends $gamma \( omega \)$ to $gamma \( omega \) - gamma \( e_n \)$; the same calculation holds for odd $n$. It fixes $gamma \( e_i \)$. Thus it preserves $Y$, and defines the graph-twisted Frobenius on this datum. The action on the central space, after the scalar $q$ is removed, has order at most two.
  #emph[Integral Levi products.] For the splitting assertion, orient the extracted hyperbolic coordinates by signs $sigma_i in { 1 \, - 1 }$. Let $c$ be the entry $gamma \( e_i \)$ in the table, with the displayed representative, and set
  $ f_i = \( sigma_i e_i \, c \) \, #h(2em) x_i \( a \, z \) = sigma_i a_i + ell \( z \) \, #h(2em) ell \( z \) = cases(delim: "{", 0 & upright("in type B") \,, z_1 & upright("in type C") \,, z_3 & upright("in type D") .) $
  Then $f_i in Y$, and $x_i in X$: the possible half-integral part of $a_i$ is canceled by the indicated central coordinate. Moreover $ell \( c \) = 0$, so
  #[#set math.equation(numbering: n => "(4.9)")
   $ x_i \( f_j \) = delta_(i j) \, #h(2em) Y = xor.big_(i in I) bb(Z) f_i med xor med ⋂_(i in I) ker x_i . $ <fam:split-lattice>]
  Within an extracted block, its roots are $x_i - x_j$ and its coroots are $f_i - f_j$. They are exactly the root datum of the corresponding general linear group. The residual roots and coroots lie on the complementary summand. Thus (4.9) is a product decomposition of root data, not merely of rational root spaces.
  For a rational split hyperbolic extraction, conjugate its split cocharacters into standard position on a maximal split torus. The construction is then $F$-compatible. In nonsplit type D, the extracted directions are in split hyperbolic planes; the remaining diagram involution acts on the residual coordinates and on $z$ as above. The same construction applies after each extraction, proving the nested assertion.
  #emph[Residual center and root data.] The general linear factors have now been split off. We retain the image of the original center separately from any extra torus direction in the residual group. To identify this inherited center, let $m = \| I \|$. The projection of an original central vector $\( 0 \, z \)$ to the residual summand is $\( 0 \, z \) - sum_(i in I) x_i \( 0 \, z \) f_i$. Its remaining $a$-coordinates are zero, its discarded coordinates are $a_i = - sigma_i ell \( z \)$, and its central coordinate is
  $ z' = \( "id" - m c ell \) z . $
  Since $ell \( c \) = 0$, the central map has inverse $"id" + m c ell$ and determinant one. It is $F$-equivariant, so its image $upright(bold(T))_R$ is a torus of rank $h$ with the same rational Frobenius representation as the original center. The central lattices are commensurable with the coordinate lattice only at the prime two, by the graph congruences. Together with the determinant-one map this shows that the isogeny onto $upright(bold(T))_R$ has kernel of 2-power order. For odd $p$ it therefore identifies the Sylow $p$-subgroups on rational points. The original center may also project to the general linear centers; it need not lie solely in the residual factor.
  If the residual root system spans the remaining coordinate space, then $upright(bold(T))_R = Z^compose \( upright(bold(R)) \)$. In the rootless datum $D_1$, the remaining coordinate instead adds one central torus dimension with Frobenius eigenvalue $q$ or $- q$. Thus the full residual central rank is at most $h + 1 lt.eq 4$. This extra torus is the rank-one orthogonal packet, separate from the inherited central contribution.
  Finally, on the residual summand the equations $x_i = 0$ express every discarded coordinate as $a_i = - sigma_i ell \( z \)$. Substitution into (4.8) leaves congruences with uniformly bounded denominators, dividing four. Independently of how many coordinates were discarded, the resulting lattice lies in a fixed small-denominator coordinate lattice and contains a fixed power-of-two multiple of the integral coordinate lattice. In bounded remaining dimension there are only finitely many intermediate lattices. The residual signed-coordinate and diagram actions are also drawn from a finite set in that dimension. This proves the last assertion, including the rank-one orthogonal residual tori. ◻
]

=== 4.4 Reduction to the two sign eigenspaces <reduction-to-the-two-sign-eigenspaces>

For an original regular ambient group of Lemma 19, before any split extraction, put

$ T_0 = Z^compose \( upright(bold(J)) \)^F \, #h(2em) Z_p = O_p \( T_0 \) . $

Here $O_p \( T_0 \)$ denotes its unique Sylow $p$-subgroup. A block of $J \/ Z_p$ with defect order at most $M$ lifts to a block of $J$ with defect order at most $M \| Z_p \|$. We call this a relative defect bound. It will always be accompanied by the requirement that the final Cartan bound is for the block of $J \/ Z_p$. For odd $p$, the basic rows at a semisimple $p'$-parameter $s$ descend to this quotient. Indeed each such row occurs in a Deligne–Lusztig character $R_T^(upright(bold(J))) \( theta \)$ for a torus character $theta$ dual to $s$. Torus duality gives $\| theta \| = \| s \|$, and $Z \( upright(bold(J)) \)^F$ acts on every constituent by the restriction of $theta$ to $Z \( upright(bold(J)) \)^F$ [19] Corollary 1.22 and Section 5.21. Their central characters therefore have $p'$-order and are trivial on $Z_p$. Simple modules also factor through $J \/ Z_p$, by Lemma 2. Thus the descended rows form the same integral basic set on the corresponding quotient block union, and their degree defects there are $"def"_p \( chi \) \/ \| Z_p \|$.

For a later residual factor, the central contribution in its packet degree formula will be $upright(bold(T))_R$, rather than its possibly larger full connected center.

We also fix the spectral convention in the following reduction. Project a semisimple $p'$-parameter $s$ to the adjoint dual group and represent it in natural symplectic or orthogonal eigenvalue coordinates. The passage to a natural isometry group requires at most a central 2-isogeny. We call this eigenvalue multiset the #emph[normalized natural spectrum]; its ambiguity, and the ambiguity in its rational Frobenius action, is at most a common sign. In particular, containment in ${ 1 \, - 1 }$ is independent of this choice.

#thm([Proposition 4.6.])[
  #emph[To prove Theorem 15 for the cross-characteristic families of types B, C, and D, it suffices to prove the following assertion, together with the type A bounds: for the groups of Lemma 19, blocks of $J \/ Z_p$ of bounded defect have bounded Cartan entries whenever their $p'$-parameter has normalized natural spectrum contained in ${ 1 \, - 1 }$.]
] <fam:central-classical>

#proof[
  The centers on points of the simply connected covers of types B, C, and D have order at most four. By Lemma 2, it suffices to treat these covers and their quotients by central $p$-subgroups, with defect bounds changed by a factor at most four. Embed $S = upright(bold(S))^F$ into $J$ as in Lemma 19, and put $K = S ∩ Z_p$. The central isogeny $upright(bold(S)) times Z^compose \( upright(bold(J)) \) arrow.r upright(bold(J))$, followed by Lang’s theorem, gives
  $ \[ J : S T_0 \] lt.eq 4 \, #h(2em) \[ J \/ Z_p : S \/ K \]_p lt.eq 4 . $
  Thus every block of $J \/ Z_p$ covering a given block of $S \/ K$ has bounded defect. A simple module of $J \/ Z_p$ restricts to $S \/ K$ with bounded multiplicity: the central group $T_0 \/ Z_p$ acts by scalars on an inertia type, and the remaining inertia quotient has order at most four. Lemma 5 therefore transfers a Cartan bound for these covering blocks down to $S \/ K$. Central transfer then recovers $S$ and its required central quotients.
  Consider one such covering block, with $p'$-parameter $s$. Eigenvalues different from $1 \, - 1$ occur in reciprocal pairs and give linear root subsystems in the connected centralizer.
  There is an $F$-stable Levi $upright(bold(M))^(*)$ containing this full centralizer and retaining the full ambient classical subsystem on the ${ 1 \, - 1 }$-coordinates. To construct it, take independent torus directions with a scalar on each non-sign eigenvalue space, its inverse on the reciprocal space, and zero direction on the remaining coordinates, and centralize this torus. The span of these directions is stable under Frobenius, which permutes the pairs and may invert them or multiply all normalized eigenvalues by a common sign. The full centralizer is contained because its roots do not join different reciprocal packets. The centralizer is connected by Lemma 19.
  Apply Lemma 17, also modulo $Z_p$, and let $upright(bold(M))$ be the corresponding primal Levi. Its connected derived subgroup has simply connected factors. The normal subgroup
  $ N = \[ upright(bold(M)) \, upright(bold(M)) \]^F \/ \( \[ upright(bold(M)) \, upright(bold(M)) \]^F ∩ Z_p \) med lt.closed med M \/ Z_p $
  has abelian quotient. The intersection removed here lies in $S$, so has order at most four. Restrict a block of $M \/ Z_p$ to $N$, and lift across that bounded central intersection. The covered blocks on $\[ upright(bold(M)) \, upright(bold(M)) \]^F$ have bounded defect. This group is a direct product of simply connected linear or unitary groups and possibly one residual group of type B, C, or D. Only boundedly many of its block factors can have positive defect.
  On the residual factor, dual projection keeps precisely the roots on the sign coordinates. Projection commutes with taking the prime-to-$p$ part of a semisimple element. The residual block therefore has a geometric $p'$-parameter with normalized spectrum in ${ 1 \, - 1 }$. Embed this factor regularly again as above; all lifted parameters retain this adjoint-spectrum property. The stated special assertion bounds its blocks. The type A bounds handle the other positive-defect factors. Tensor products, central transfer, and Lemma 4 then bound the blocks of $M \/ Z_p$, and hence the original block. If no non-sign eigenvalue is present, no Levi reduction is made. Otherwise the residual classical rank is strictly smaller. In either case this argument invokes only the stated special assertion, not the general quasisimple conclusion. ◻
]

=== 4.5 The prime two <the-prime-two>

#thm([Proposition 4.7.])[
  #emph[At $p = 2$, the blocks in the special assertion of Proposition 20 have bounded ambient semisimple rank. They consequently have bounded Cartan entries.]
] <fam:two>

#proof[
  Here $q$ is odd. The adjoint projection of the odd-order element $s$ has a natural lift with spectrum in ${ 1 \, - 1 }$. Choose the lift of odd order. Its spectrum is then ${ 1 }$, so $s$ is central. Tensoring by the corresponding central linear character removes $s$ from the calculation.
  Let $B$ be the lifted block of $J$, whose defect order is at most $M \| Z_2 \|$, and choose any $chi in "Irr" \( B \)$. Its semisimple parameter is $s t$, where $t$ is a 2-element. Put $upright(bold(C)) = C_(upright(bold(J))^(*)) \( t \)$, which is connected. The degree formula identifies $"def"_2 \( chi \)$ with the degree defect of its unipotent correspondent $psi$ in $upright(bold(C))^F$. Unipotent characters are trivial on the center: they occur in Deligne–Lusztig characters induced from trivial torus characters, on which that center acts trivially. In particular the central subgroup
  $ A = chevron.l t \, O_2 \( Z^compose \( upright(bold(J))^(*) \)^F \) chevron.r $
  lies in the kernel of $psi$, and hence
  $ \| A \| lt.eq "def"_2 \( chi \) lt.eq M \| Z_2 \| . $
  The two ambient central tori have the same rational Frobenius eigenvalues under duality and isogeny, so $\| O_2 \( Z^compose \( upright(bold(J))^(*) \)^F \) \| = \| Z_2 \|$. It follows that the order of $t$ modulo the ambient central torus is at most $M$.
  Its adjoint image therefore has bounded order. A lift to the natural isometry group has order at most twice this bound. Its normalized eigenvalues belong to a set of roots of unity of bounded order. Both the number of distinct eigenvalues and the lengths of their Frobenius orbits are consequently bounded; the possible common-sign ambiguity only enlarges these bounds by a factor of two.
  Up to central isogeny, the rational root datum of $upright(bold(C))$ is the product of its ambient central torus and its eigenvalue packets. A reciprocal non-sign packet gives a linear or unitary factor, and a sign packet gives a factor of type B, C, or D. Factors permuted by Frobenius use their composite field parameter. Rank-one orthogonal tori $upright("SO")_2^plus.minus$ are included as rank-one type D packets. Thus rational orders and unipotent degrees give
  #[#set math.equation(numbering: n => "(4.10)")
   $ frac("def"_2 \( chi \), \| Z_2 \|) = product_i frac(\| H_i \|_2, psi_i \( 1 \)_2) lt.eq M \, $ <fam:two-product>]
  where $psi_i$ is unipotent and $H_i$ is the corresponding packet group. This equality is an order and degree calculation; no direct-product assertion about the finite centralizer is needed.
  A linear or unitary packet of dimension $n$ contributes at least $2^n$, by the hook formula. For completeness, the symbol formula gives a similarly explicit estimate for every packet of type B, C, or D and positive rank $n$. Write its two strictly increasing beta rows as $X \, Y$, let $u = \| X \| + \| Y \|$, and let $c = \| X ∩ Y \|$. The rank formula is
  $ n = sum_(a in X) a + sum_(a in Y) a - ⌊frac(\( u - 1 \)^2, 4)⌋ . $
  Count all hooks and cohooks of positive length: these are pairs of a bead and a strictly lower vacant position in its own row or the opposite row. Before vacancies are imposed there are $2 sum a$ possible pairs. The number ending at occupied positions is $binom(u, 2) - c$. Therefore their number is
  $ H & = 2 (n + ⌊frac(\( u - 1 \)^2, 4)⌋) - binom(u, 2) + c\
 & = 2 n - floor.l u \/ 2 floor.r + c . $
  The unipotent symbol degree formula [50] Section 3.3 expresses the 2-defect as the product of $\( q_i^j - 1 \)_2$ over hooks and $\( q_i^j + 1 \)_2$ over cohooks, times a power of two whose exponent is at least $floor.l \( u - 1 \) \/ 2 floor.r - c$. For unequal rows this exponent is exactly the displayed one; for equal rows in degenerate type D the exponent is zero, which is larger. Every positive-length hook or cohook contributes at least two, whence
  $ v_2 #h(-0.16667em) (frac(\| H_i \|, psi_i \( 1 \))) gt.eq 2 n - floor.l u \/ 2 floor.r + floor.l \( u - 1 \) \/ 2 floor.r gt.eq 2 n - 1 . $
  This argument allows a negative displayed prefactor exponent; it is the total exponent that is estimated. The degenerate case gives at least $2 n$. For rank-one orthogonal tori the defect is directly $\( q_i - 1 \)_2$ or $\( q_i + 1 \)_2$, and is at least two. Empty packets contribute one.
  Equation (4.10) now bounds the effective rank of every packet and the number of nonempty packets: each positive-rank packet contributes at least $2^(n_i)$, so $sum_i n_i lt.eq log_2 M$. Their Frobenius orbit lengths were already bounded, so it also bounds the actual ambient semisimple rank. The central rank is at most three. Lemma 19 gives finitely many root data, and Theorem 6, applied after the central quotient, proves the result. ◻
]

=== 4.6 Odd-prime packets and the classical reduction <odd-prime-packets-and-the-classical-reduction>

The prime-two case is now reduced to fixed root data. At an odd prime the rank can remain unbounded; we instead express the degree defect as a product of contributions from at most two classical packets and a controlled central torus. These are the inputs for the label, runner and endpoint arguments that follow.

The next lemma describes the sign packets and their split Levi factors, on which the subsequent label, runner, and endpoint arguments operate.

#thm([Lemma 4.8.])[
  #emph[Suppose that $p$ is odd and the normalized spectrum of the $p'$-parameter $s$ is contained in ${ 1 \, - 1 }$, in a regular group of Lemma 19. Apart from the ambient central torus, its connected dual centralizer has at most two classical factors. In natural dual type C they are of types C and C; in natural dual type B they are of types B and D; in natural dual type D they are of types D and D. Empty factors are omitted and rank-one type D is toral. The factors have parameters $q_i = q$, unless two like factors are exchanged by Frobenius, in which case there is one packet with parameter $q_i = q^2$.]
  #emph[If split hyperbolic blocks of sizes $b_j$ are extracted in one packet with parameter $q^delta$, $delta in { 1 \, 2 }$, the corresponding primal split Levi has actual factors $"GL"_(delta b_j) \( q \)$. On each such factor the parameter has a single eigenvalue orbit of degree $delta$ and multiplicity $b_j$. The residual parameter retains the same sign-packet description. These assertions persist under nested extractions with earlier factors held fixed.]
] <fam:packets>

#proof[
  Inspect the classical roots on the natural coordinate spaces. In symplectic type, the roots evaluating trivially on $s$ are the type C roots within its two sign eigenspaces. In odd orthogonal type, the positive eigenspace contains the distinguished odd coordinate, giving a B factor, and the negative eigenspace gives a D factor. In even orthogonal type both eigenspaces have even dimension, giving two D factors. Their form signs determine their split or graph-twisted rational structures and must be retained. In defining characteristic two the two signs coincide, leaving a single packet. Frobenius can exchange only like factors; hence its orbit lengths here are at most two.
  On a chosen split hyperbolic block, take a cocharacter that is constant on its polarized half and on the Frobenius translates of that half, has the opposite value on the reciprocal halves, and is zero elsewhere. Independent choices for the extracted blocks define a split torus. Its centralizer in the ambient dual group is a split Levi, and its intersection with $C_(upright(bold(J))^(*)) \( s \)$ is exactly the desired split Levi of the packet. A packet coordinate has $delta$ ambient coordinates in its Frobenius orbit, so the ambient linear block has size $delta b_j$.
  By Lemma 19, dualizing this construction gives an actual product with $"GL"_(delta b_j) \( q \)$ on the primal side. The centralizer roots on such a block form one linear system of rank $b_j - 1$ on each of its $delta$ Frobenius translates. Equivalently its eigenvalues have one orbit of degree $delta$ and multiplicity $b_j$. On the unextracted coordinates the original root evaluations are unchanged, proving the residual assertion. The independent cocharacters can be chosen with all earlier extracted coordinates fixed, which proves the assertion for a chain of extractions. ◻
]

The order and degree calculation used at $p = 2$ also gives, for a basic row $chi in cal(E) \( J \, s \)$,

#[#set math.equation(numbering: n => "(4.11)")
 $ frac("def"_p \( chi \), \| Z_p \|) = product_i frac(\| H_i \|_p, psi_i \( 1 \)_p) . $ <fam:packet-defect>]

Here the groups $H_i$ are the packets of Lemma 22; their orthogonal signs are part of the data. This identity follows by decomposing the rational reflection space into the packet spaces and the ambient central space, then using central-isogeny invariance of orders and unipotent degrees. The partition and symbol formulas for its right-hand side are made explicit in Proposition 24. For a residual factor $upright(bold(R))$, the corresponding identity is

$ "def"_p \( chi_R \) = \| upright(bold(T))_R^F \|_p product_i frac(\| H_i \|_p, psi_i \( 1 \)_p) . $

The product includes its toral $D_1$ packet if present; using the inherited torus ensures that this packet is counted once.

#thm([Lemma 4.9.])[
  #emph[For odd $p$, the original central subgroup and every inherited residual central torus satisfy 
$ \| Z_p \| \, med \| upright(bold(T))_R^F \|_p lt.eq #scale(x: 120%, y: 120%)[\(] \( q - 1 \)_p \( q + 1 \)_p #scale(x: 120%, y: 120%)[\)]^3 . $

 The full residual connected center satisfies the analogous bound with exponent four. Let $q_i = q^delta$, $delta in { 1 \, 2 }$, be an original packet parameter, $e_i = "ord"_p \( q_i \)$, and put 
$ \( d_i \, eta_i \) = cases(delim: "{", \( e_i \, 1 \) & e_i upright(" odd") \,, \( e_i \/ 2 \, - 1 \) & e_i upright(" even") .) #h(2em) alpha_i = \( q_i^(d_i) - eta_i \)_p . $

 Then $\| Z_p \|$ and $\| upright(bold(T))_R^F \|_p$ are at most $alpha_i^3$, while $\| Z^compose \( upright(bold(R)) \)^F \|_p$ is at most $alpha_i^4$. Thus a bound on $alpha_i$ bounds both inherited and full residual central $p$-orders.]
] <fam:central-order>

#proof[
  On the inherited central rational space Frobenius is $q theta$, where $theta^2 = 1$, and the dimension is at most three. The full residual center adds at most one coordinate with eigenvalue $q$ or $- q$. Its rational order is therefore $\( q - 1 \)^a \( q + 1 \)^b$, with $a + b lt.eq 3$ for the inherited torus and $a + b lt.eq 4$ for the full center. These orders are unchanged by isogeny of their integral lattices. If either $p$-part is nontrivial, then $p divides q - 1$ or $p divides q + 1$, and for odd $p$ at most one occurs. For $delta = 1$, the relevant $alpha_i$ is exactly the nontrivial one of these two $p$-parts. For $delta = 2$, we have $e_i = 1$ and $alpha_i = \( q^2 - 1 \)_p = \( q - 1 \)_p \( q + 1 \)_p$. If both $p$-parts are trivial the estimates are immediate; otherwise the preceding calculation proves them. ◻
]

We now identify precisely how the later results finish this section. For a block of relative defect at most $M$, (4.11) and Proposition 24 bound the total relevant hook or cohook weight. A positive weight bounds the corresponding cyclotomic $p$-part $alpha_i$, so Lemma 23 bounds the ambient central $p$-part whenever it is needed. At weight zero, the core arguments handle the central quotient directly. The parameter on each Levi is the specified rational parameter, rather than a sum over its several possible preimages from the ambient group. Propositions 28 and 32 establish, respectively, the required ordinary matrices on these labels and the fact that the projectors used are projectors to unions of blocks.

Proposition 33 then transfers Cartan bounds from two kinds of endpoints. The first has bounded active rank. Its extracted factors are of order prime to $p$, split off by Lemma 19, and contribute only defect-zero blocks. Its residual root data form a finite set by that lemma, so Theorem 6 applies. The second endpoint has bounded ordinary Harish–Chandra rank above a possibly arbitrarily large cuspidal triangle. Proposition 45 gives the required bound there. The same two endpoint arguments cover unipotent $"GL"$ and $"GU"$ blocks in Proposition 18. Thus these later propositions prove both of the assertions left open by Propositions 18 and 20 for every odd $p$.

=== 4.7 Completion over all quasisimple families <completion-over-all-quasisimple-families>

#proof[
  We use the classification of finite simple groups and the standard Schur multiplier descriptions [64,56]. Sporadic groups and the finitely many exceptional multiplier stems form a bounded collection of finite groups; all their blocks may be included in the bound.
  For alternating groups, Scopes’ theorem [61] gives finitely many Morita classes of symmetric-group blocks of each fixed weight. Bounded defect order bounds this weight, since the defect group is a Sylow $p$-subgroup of the symmetric group on $p w$ letters for a block of weight $w$. For the double covers, Kessar’s finiteness theorem [45] supplies the same bounded-defect conclusion for spin blocks at odd primes; the nonspin blocks factor through the symmetric group. At $p = 2$, quotient by the central involution and use central transfer. Every block of a double cover of an alternating group is covered in the corresponding double cover of the symmetric group. Its covering defect increases by at most a factor two, and restriction across this cyclic quotient has multiplicity one. Lemma 5 therefore bounds its decomposition numbers and Cartan entries. The same argument without the central cover treats the alternating group itself.
  Consider groups of Lie type in defining characteristic $p = r$. For their standard simply connected covers, the defining-characteristic block theorem [43] says that every positive-defect block has full defect. The standard central kernels on rational points have order prime to $r$ [13] Proposition 3.8. Consequently a positive-defect block on a central quotient has defect equal in order to a Sylow $r$-subgroup of the cover. Bounded Sylow $r$-order bounds both its defining field parameter and its rank, and hence its group order. The bounded list of small exceptions is already harmless. Defect-zero blocks have Cartan matrix $\( 1 \)$.
  For $r eq.not p$, every bounded-rank Lie-type family, including all exceptional types, Suzuki and Ree groups, and triality, is covered by Theorem 6. Its hypotheses allow the finitely many root data, diagram actions, and exceptional diagram isogenies that occur, as well as their central quotients. Thus only the ordinary unbounded-rank classical families remain.
  For these, Proposition 18 gives the type A reduction and handles the large central lift without imposing a bounded defect upstairs. The bounded-lift case at $p = 2$ has bounded rank. Proposition 20 reduces types B, C, and D to the regular sign-spectrum case, which Proposition 21 handles at $p = 2$. For odd $p$, Propositions 33 and 45, combined with the packet estimates above, supply the remaining bounds for general linear, unitary, and regular groups of types B, C, and D. The restriction, central-quotient, product, and abelian-extension arguments already proved then return these bounds to every quasisimple group in the corresponding families. All changes in the defect bound depend only on $p \, M$, completing the proof. ◻
]

== 5 Ordinary labels, single cycles, and block cores <sec:labels>

Throughout this section $p$ is odd and different from the defining characteristic. We work with the remaining groups of Section 4: unipotent series of general linear or unitary groups, and the regular classical groups of Lemma 19, with the sign packets of Lemma 22. The letter $upright(bold(H))$ also allows their successive split Levis. Previously extracted linear factors can be retained as fixed factors; their ordinary parameters and labels are fixed throughout an extraction. In the runner applications those factors have order prime to $p$.

We first specify the ordinary character theory being used. We then prove the compatibility with ordinary Jordan labels that is needed below. Finally we show that the core projections in the runner argument are projections by block idempotents. All three statements concern a fixed rational semisimple parameter in each Levi: we do not sum over different Levi classes that fuse in the ambient group.

For a finite group $H$ and $chi in "Irr" \( H \)$ put

$ "def"_p \( chi \) = frac(\| H \|_p, chi \( 1 \)_p) . $

This is the degree defect, expressed as an order. If a central $p$-subgroup $Z$ is in the kernel of $chi$, its degree defect as a character of $H \/ Z$ is $"def"_p \( chi \) \/ \| Z \|$.

#thm([Proposition 5.1.])[
  (Labels and ordinary branching).  #emph[The following conventions and formulas apply to the unipotent factors of the ordinary Jordan labels in the groups just specified.]
  + #emph[For $"GL"_n^epsilon.alt \( q \)$, where $epsilon.alt = 1$ or $- 1$, unipotent characters are indexed by partitions $nu$ of $n$, and 
$ "def"_p \( chi_nu \) = product_(h in "Hook" \( nu \)) #scale(x: 120%, y: 120%)[\(] \( epsilon.alt q \)^h - 1 #scale(x: 120%, y: 120%)[\)]_p . $

 Here the $p$-part of a negative integer means the $p$-part of its absolute value.]
  + #emph[In types $B \, C \, D$ a symbol is a pair $\( A \, B \)$ of strictly increasing finite sets of nonnegative integers. Simultaneously replacing both rows $A \, B$ by ${ 0 } union \( A + 1 \) \, { 0 } union \( B + 1 \)$ does not change the symbol. The rows are unordered, subject to the usual two separate labels for equal rows in split type $D$ of positive rank. If $u = \| A \| + \| B \|$, the rank is 
$ sum_(a in A) a + sum_(b in B) b - ⌊frac(\( u - 1 \)^2, 4)⌋ . $

 The difference $\| A \| - \| B \|$ is odd in $B \, C$, is $0$ modulo $4$ in split $D$, and is $2$ modulo $4$ in nonsplit $D$. We use one empty-group label in rank zero, and the toral convention for $upright("SO")_2^plus.minus$.]
    #emph[A hook is a bead $a$ and a smaller gap $b$ in the same row; a cohook uses a gap in the other row. Their lengths are $a - b > 0$. For a packet with field parameter $q_i$, its degree defect at the odd prime $p$ is the product of $\( q_i^h - 1 \)_p$ over hooks and $\( q_i^c + 1 \)_p$ over cohooks. The inherited central torus contribution must also be included. For an original regular group this is its full connected center; for a residual factor $upright(bold(R))$, it is the torus $upright(bold(T))_R$ of Lemma 19. The product over packets, including a toral $D_1$ packet, multiplied by $\| upright(bold(T))_R^F \|_p$, is the degree defect of the ordinary Jordan correspondent. Thus the toral packet is counted exactly once.]
  + #emph[Lusztig induction from a single positive cycle torus of odd length $d$ and a residual classical group adds $d$-hooks to symbols; a negative cycle adds $d$-cohooks. The coefficients have the usual leg signs, including the common extra minus sign for a cohook in type $D$. Each removal contributes absolute value one before the type-$D$ identifications. The individual split labels are retained. Removing all cycles of the relevant length packs the runners and gives a core. Every unipotent label with that core occurs with nonzero coefficient in induction from the core and its cycle tori, with the appropriate residual orthogonal sign and, when necessary, the appropriate choice of split label.]
  + #emph[Ordinary split Harish–Chandra restriction removes $1$-hooks for $"GL"$, $2$-hooks for $"GU"$ with a $"GL"_1 \( q^2 \)$ extraction, and same-row $1$-hooks for symbols. On an ordinary Harish–Chandra series this is Young branching on partitions or bipartitions. In the unitary case the $2$-core stays fixed; for symbols the row-length difference stays fixed up to exchange. The relative Weyl group is $W \( B_b \)$, except for the zero-difference series in type $D$, where it is $W \( D_b \)$ and the branching keeps the two labels attached to equal bipartitions.]
    #emph[At the first sign wall over a cuspidal symbol, the ratio of the two ordinary rank-one degrees is a power of $q_i$, up to inversion. Over the unitary cuspidal staircase of size $t \( t + 1 \) \/ 2$ the ratio is $q^(2 t + 1)$, up to inversion.]
] <prop:label-degrees>

#proof[
  These are the ordinary partition and symbol parametrizations, degree formulas, and Harish–Chandra theory of Lusztig [55]. In the degree formulas the factors that have been omitted are powers of the defining characteristic, signs, and, for symbols, powers of $2$; none changes the asserted odd $p$-part. The degree rule for Jordan decomposition cancels the ambient-to-centralizer index, leaving exactly the centralizer degree defect. Central isogenies preserve the rational order and unipotent degrees, so these calculations apply to our regular forms and to Frobenius orbits of factors, using $q_i = q^delta$.
  The single-cycle formulas are Asai’s hook and cohook formulas [4]; see also [54] Theorem 3.2, where a degenerate symbol initially denotes the sum of its two characters. The individual normalization needed here is spelled out in Lemma 27 below. The assertion about a full packed core is the ordinary unipotent cyclotomic Harish–Chandra series rule [14] Theorem 3.2 and Section 3.A. This is a statement about ordinary unipotent characters. For split Harish–Chandra series the ordinary endomorphism algebras give the indicated Weyl-group branching. The rank-one degree ratios are the ordinary rank-one parameters, equivalently the ratios in the same partition and symbol degree formulas. ◻
]

Here and below the $e$-part of a torus means its connected $Phi_e$-subtorus, defined by the $Phi_e$-isotypic subspace of its rational cocharacter space. Taking the full lattice in that subspace defines the actual subtorus. Set

$ e = "ord"_p \( q \) \, #h(2em) e_i = "ord"_p \( q_i \) \, #h(2em) \( d \, eta \) = cases(delim: "{", \( e_i \, + 1 \) \, & e_i upright(" odd") \,, \( e_i \/ 2 \, - 1 \) \, & e_i upright(" even") .) $

The core operation on a packet removes positive $d$-cycles when $eta = + 1$ and negative $d$-cycles when $eta = - 1$. The ambient cyclotomic index remains $e$, including when $q_i = q^2$.

=== 5.1 Uniform tests and a minimum principle <uniform-tests-and-a-minimum-principle>

For a fixed target character, the coefficients of an induction matrix form an integral vector on the source characters. Torus pairings need not determine this vector. For the unipotent single-cycle formulas of Proposition 24, we will show that the hook or cohook coefficient vector is the unique integral vector of minimum norm with its prescribed pairings. The transport proof in the next subsection will then identify the ordinary induction rows by comparing the sums of their squared norms.

A uniform function is a linear combination of Deligne–Lusztig torus characters. The torus almost characters provide convenient tests for its scalar products with irreducible unipotent characters. We record precisely the portion of the classical Fourier formula that will be used. Within a symbol family, the entries occurring twice are fixed, as is the set $Omega$ of entries occurring once. Write $h = \| Omega \|$. A row of the Fourier matrix is indexed by a permitted distribution $B subset.eq Omega$ between the symbol rows. For types $B \, C$ we orient the symbol to have row-length difference $1$ modulo $4$; the resulting subsets have one fixed parity. For type $D$ the permitted differences are even, and complementary subsets represent row exchange. The uniform columns are balanced distributions $U$, of cardinality $floor.l h \/ 2 floor.r$ or the complementary cardinality. In type $D$ complementary columns are identified. For graph-twisted $D$ the columns use extensions of the nondegenerate, equal-row-length Weyl labels to the twisted coset. Equal row lengths here refer to symbol defect, not to block defect.

Write $f_B \( U \)$ for the scalar product in this rectangle. The classical Fourier formula [55], in the subset conventions of [20] Section 6.1 and Proposition 6.3, says that pairings between different families vanish, that all entries in one rectangle have the same nonzero absolute value, and that

#[#set math.equation(numbering: n => "(5.1)")
 $ frac(f_B \( U \) f_(B') \( U' \), f_B \( U' \) f_(B') \( U \)) = \( - 1 \)^(\| \( B triangle.stroked.t B' \) ∩ \( U triangle.stroked.t U' \) \|) . $ <lab:fourier-ratio>]

Phases attached to entire test columns have no effect on this identity. Degenerate split symbols have singleton families and are separately uniform, with their own degenerate Weyl tests. Type $A$ is uniform. Products of packets use tensor products of these test matrices.

The classical formulas hold over every finite field by [3] Corollary 4.3. The following separation assertion is the classical case of Digne–Michel [20] Proposition 6.3. It concerns ordinary characters only and is independent of the coefficient prime $p$. In particular, it will also apply at $p = 2$ in Section 9. We recall the subset argument to fix the conventions used below; the marked-diagram consequence is then applied to our Levi data.

#thm([Lemma 5.2.])[
  (Separation by uniform tests).  #emph[The uniform pairing vectors of two ordinary unipotent labels in these groups are proportional only when the labels coincide. Consequently ordinary Jordan labels are functorial under rational conjugacies of marked torus and Levi diagrams.]
] <lab:fingerprints>

#proof[
  Different families have disjoint nonzero test supports. In one nondegenerate family, the differences $U triangle.stroked.t U'$ of all balanced subsets span the even-weight subspace of $bb(F)_2^Omega$: for any distinct $i \, j$, choose a balanced subset containing $i$ and not $j$, and replace $i$ by $j$. These differences generate all ${ i \, j }$. Thus proportionality and (5.1) imply that $B triangle.stroked.t B'$ is either empty or all of $Omega$. In types $B \, C$, $h$ is odd and the fixed parity convention excludes the latter possibility. In type $D$ it is precisely row exchange. The cases $h = 1$, or $h = 2$ in type $D$, have only one relevant row; degenerate labels have their separate tests. Tensor factors may be varied separately, proving the product assertion.
  The ordinary Jordan torus-pairing rule is invariant under transport of the full marked dual torus diagram. Such transport therefore preserves every uniform pairing of the prospective label. The first assertion removes the only possible character permutation ambiguity. ◻
]

#thm([Lemma 5.3.])[
  (The separated slice).  #emph[Fix a nondegenerate Fourier rectangle and two positions $P = { x \, y } subset Omega$. Suppose an integral vector $v$ on its rows has two nonzero entries, both of absolute value one, at the distinct labels $B$ and $B triangle.stroked.t P$. Suppose its uniform pairing vector vanishes when $\| U ∩ P \| eq.not 1$ and has twice the single-entry absolute value when $\| U ∩ P \| = 1$. Among integral vectors with this pairing vector, $v$ is the unique one of minimum squared Euclidean norm, namely two. The same conclusion holds after tensoring with fixed rows on other packets.]
] <lab:slice>

#proof[
  Let $c > 0$ be the common absolute value in the rectangle and put $cal(S) = { U : \| U ∩ P \| = 1 }$. This set is nonempty. A vector of squared norm at most one is zero or one signed unit vector, so its pairings have absolute value at most $c$. It cannot give the required value $2 c$ on $cal(S)$. An integral vector of squared norm two has exactly two distinct signed unit entries. On every column in $cal(S)$, equality in the triangle inequality forces each of these entries to give the same value as each summand of $v$.
  We determine which signed row can agree with a given signed row on $cal(S)$. Regard subsets as vectors over $bb(F)_2$ and let $E \( P^c \)$ denote the even-weight subspace supported on $P^c = Omega \\ P$. If $h gt.eq 3$, then
  #[#set math.equation(numbering: n => "(5.2)")
   $ ⟨U triangle.stroked.t U' : U \, U' in cal(S)⟩ = chevron.l upright(bold(1))_P chevron.r xor E \( P^c \) . $ <lab:slice-span>]
  Indeed one may switch the chosen element of $P$. In $P^c$ the chosen subsets have size one less than the balanced size. For $h gt.eq 4$ that size lies strictly between zero and $\| P^c \|$, so the same single exchange argument as above generates $E \( P^c \)$. For $h = 3$ the complement has one element and its even subspace is zero, giving the same formula. In type $D$, lift balanced columns to both complementary representatives before making this calculation. Even row differences ensure that their pairing ratios agree on the two representatives.
  The annihilator of the space in (5.2) consists of vectors constant on $P$ and constant on $P^c$. In odd type, the fixed row parity excludes toggling $P^c$, whose size is odd. In type $D$, toggling $P^c$ is the same as toggling $P$ modulo full complement. Thus the only possible rows are $B$ and $B triangle.stroked.t P$. Their signs are fixed by a single column in $cal(S)$; the two distinct entries are consequently exactly those of $v$. The case of two distinct rows does not occur for $h lt.eq 2$. Varying test columns independently in every other packet and applying Lemma 25 fixes the inactive rows and proves the tensor-product assertion. ◻
]

#thm([Lemma 5.4.])[
  (Sparse single-cycle rows).  #emph[Fix a target unipotent label and a source family for one of the single-cycle inductions of Proposition 24. The list of coefficients on that family is zero, one signed unit entry, or two distinct signed unit entries. In the last case it satisfies Lemma 26, with $P$ the two moved positions. In all cases this list is the unique integral list of minimum squared norm having its uniform pairings.]
] <lab:sparse>

#proof[
  Pad the two beta rows by simultaneous shifts so that the row-length conventions agree in all symbols being compared. The two family multisets determine the starting and finishing positions $a \, a - d$ of a removal. Away from split degeneracy there is at most one removal in each of the two rows. Two removals occur only when the target has two beads at $a$ and no bead at $a - d$. Their source distributions differ by toggling $P = { a \, a - d }$. If these two removals gave the same unordered source label, the target rows would agree away from these two positions and also at them; that is exactly a degenerate target. Thus, in the present case, the two source labels are distinct.
  We verify their uniform support; this also fixes their relative sign. On Weyl-group tests, restriction at either a positive or a negative signed cycle is same-row hook removal on bipartitions. This follows from the induced-character description of signed permutation characters and the symmetric-group Murnaghan–Nakayama rule: the sign of the cycle changes the sign of one bipartition contribution, but does not change which row loses the hook. A balanced source distribution can reach the target duplicate at $a$ and vacancy at $a - d$ only when it separates those two positions. Hence torus transitivity forces the two-entry pairing to vanish off $cal(S)$. Formula (5.1) says that the two row ratios are constant on each slice and opposite on the two slices. The two rows are not proportional by Lemma 25. Consequently their signed sum has absolute value $2 c$ on $cal(S)$. Both slices occur in every relevant two-removal family. Lemma 26 applies.
  Here is the normalization at the type-$D$ boundary. A degenerate active character is uniform, and a contributing family on the other side has two singles: deleting one bead from equal rows, and inserting it at a previously vacant position, leaves just these two single positions. There is one ordinary row and one uniform column in that nondegenerate rectangle. The relevant cycle classes do not split under restriction from $W \( B \)$ to $W \( D \)$. A positive cycle here has odd length, so flipping all its coordinate signs is an odd-sign element of its centralizer; a negative cycle itself supplies such an element. Thus either half of an equal-bipartition Weyl character has half the $W \( B \)$ value on the cycle classes in question. Its two row removals combine to give absolute value at most one on the residual unordered Weyl label. Conversely, from a fixed orientation of a nondegenerate bipartition, only one hook reaches the equal rows, and its coefficient on each split label has absolute value one. On the twisted coset the same calculation uses the extensions of the nondegenerate Weyl characters; switching the extension changes an overall sign, not the absolute value. It therefore never identifies the two split labels.
  For completeness, these checks also cover the ends of the rank range. A toral $D$ packet has its single unipotent character. For a rank-zero residual packet, evaluate the Weyl character at the full signed cycle. In type $D$ only the single-hook bipartitions just considered contribute. In types $B \, C$ their symbol families have one or three singles. In the three-single case the full hook can leave either packed empty row; there are at most two balanced contributions, each of Fourier absolute value $1 \/ 2$, so again an individual coefficient has absolute value at most one. The one-single case has one test. These computations are also the individual-character interpretation of the hook/cohook formulas when the degenerate-symbol notation in [54] Theorem 3.2 is used.
  Finally, a zero list is the unique vector of norm zero. For one signed entry, any integral competitor of norm at most one must itself be one signed entry, and Lemma 25 identifies it. Inactive factors are fixed and tensor with the active calculation. This proves the assertion in every case. ◻
]

=== 5.2 Transport of a single cycle <transport-of-a-single-cycle>

The minimum-norm statements now reduce single-cycle transport to an equality of total norms. We prove that equality by Mackey’s formula, retaining the specified rational parameter. We adapt the norm-comparison and minimum-norm argument of Enguehard [32] Section 5.3, equations (5.3.3)–(5.3.8) and Lemma 5.3.9. We give the single-cycle argument explicitly, retaining the rational Levi parameter, individual split labels, toral and empty packets, and fixed inactive factors.

Let $s in upright(bold(H))^(* F)$ be the fixed semisimple parameter and put $upright(bold(C)) = C_(upright(bold(H))^(*)) \( s \)$. This centralizer is connected. We allow any fixed additional linear packets, including parameters with nontrivial $p$-parts on those inactive packets. The active packet is one of the classical packets just described. For this subsection we also allow ambient Levis obtained by earlier removals of disjoint cycles of the indicated kind. The removed cycles are fixed torus packets in their semisimple centralizers; on the ambient side they may lie in linear factors. These groups are still Levis of the original regular group, so both centers remain connected and both derived groups remain simply connected. Their active centralizer is the smaller residual classical packet. Thus this enlarged class is closed under removing another disjoint cycle and under the intersection diagrams used in the proof below.

In a rational maximal torus of $upright(bold(C))$ choose $upright(bold(V))$ supported on one cycle only: either a split hyperbolic coordinate, or the primitive $Phi_e$-part of one of the signed $d$-cycles. Put

#[#set math.equation(numbering: n => "(5.3)")
 $ upright(bold(M))^(*) = C_(upright(bold(H))^(*)) \( upright(bold(V)) \) \, #h(2em) upright(bold(C))_M = C_(upright(bold(M))^(*)) \( s \) = C_(upright(bold(C))) \( upright(bold(V)) \) . $ <lab:cycle-levi>]

The second group is, up to central isogeny, the residual classical factor times the cycle torus and the inactive factors. To see this on the root datum, in each absolute component the nonzero coordinate characters on $upright(bold(V))$ are distinct up to sign. On the primitive part they are the successive powers of a primitive $e_i$th root, with the prescribed signed closing. All other coordinates vanish on $upright(bold(V))$. Precisely the desired residual roots vanish. For a packet with $q_i = q^delta$, its full signed orbit has length $delta d$ before folding. The split-coordinate construction gives an ordinary split Levi and a split parabolic.

Write $J_(H \, s)$ and $J_(M \, s)$ for the ordinary Jordan bijections to the unipotent characters of $upright(bold(C))^F$ and $upright(bold(C))_M^F$. Let $epsilon_(upright(bold(K)))$ denote the usual split-rank sign of an $F$-group $upright(bold(K))$.

#thm([Proposition 5.5.])[
  (Single-cycle Jordan transport).  #emph[With the fixed markings in (5.3), the matrix of $R_(upright(bold(M)))^(upright(bold(H)))$ on $cal(E) \( upright(bold(M))^F \, s \)$, in ordinary Jordan labels, is 
#[#set math.equation(numbering: n => "(5.4)")
 $ A = epsilon.alt B \, #h(2em) B = [R_(upright(bold(C))_M)^(upright(bold(C)))]_(upright("unip")) \, #h(2em) epsilon.alt = epsilon_(upright(bold(H))) epsilon_(upright(bold(M))) epsilon_(upright(bold(C))) epsilon_(upright(bold(C))_M) . $ <lab:single-cycle-matrix>]

 For the split hyperbolic extraction the sign is positive. This includes individual split labels, toral and empty residual packets, and products with fixed inactive packets. Successive split extractions consequently give ordinary partition, bipartition, and folded type-$D$ Harish–Chandra branching on these Jordan labels.]
] <prop:single-cycle>

#proof[
  All matrix entries in $A$ are integers, since Lusztig induction is the alternating character of a cohomology complex. Series disjunction puts its image in the stated ambient series. On uniform inputs, the equality (5.4) already follows from transitivity of torus induction and the ordinary Jordan torus-pairing rule. More explicitly, apply transitivity to each torus character in $upright(bold(M))$ with parameter $s$ and pair with a fixed target character. The Jordan torus pairings on the two sides give its predicted uniform pairing against every source family. By Lemma 27, that target row of $epsilon.alt B$ has the unique minimum norm among integral rows with these pairings. Summing over source families and then target rows gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ parallel A parallel_(upright("HS"))^2 gt.eq parallel B parallel_(upright("HS"))^2 \, $ <lab:norm-min>]
  and equality forces $A = epsilon.alt B$. Here the square of the Hilbert–Schmidt norm is the sum of the squares of all matrix entries. It remains to prove equality of these total norms.
  #emph[Matching the rational terms.] We use the Lusztig-induction Mackey formula, which holds for these classical components for every $q$ [9] Theorem 3.8(4). The argument is by induction on the rank of the active packet. Apply Mackey to $\( R_(upright(bold(M)))^(upright(bold(H))) \)^(*) R_(upright(bold(M)))^(upright(bold(H)))$ and take its trace on $cal(E) \( upright(bold(M))^F \, s \)$. We describe the rational terms and their markings, since an unmarked Weyl-double-coset count would not suffice. The object to match is an intersection together with its two rational embeddings into the Levi. Both embeddings are needed to impose the chosen $s$-series at both ends of each term.
  Fix dual $F$-stable maximal tori $upright(bold(T)) subset.eq upright(bold(M))$ and $upright(bold(T))^(*) subset.eq upright(bold(M))^(*)$, and retain their full character and cocharacter lattices. Put $W = W \( upright(bold(H)) \, upright(bold(T)) \)$ and $W_M = W \( upright(bold(M)) \, upright(bold(T)) \)$. The algebraic double positions in the Mackey formula are indexed by $W_M without W \/ W_M$. If $n in N_(upright(bold(H))) \( upright(bold(T)) \)$ represents $w in W$, their intersection is $upright(bold(K)) = upright(bold(M)) ∩ zws^n upright(bold(M))$; it is the centralizer of the torus generated by $Z^compose \( upright(bold(M)) \)$ and $zws^n Z^compose \( upright(bold(M)) \)$, and hence is connected. Its roots are $Phi_M ∩ w Phi_M$. The stabilizer for the double action of $upright(bold(M)) times upright(bold(M))$ is the graph of this connected intersection. Lang’s theorem therefore gives exactly one rational double orbit for each $F$-stable algebraic double orbit. This assertion does not identify the different rational conjugacy classes of maximal tori in an intersection.
  We record the descent of both embeddings, since an $F$-stable Weyl double coset need not have an $F$-fixed representative. Choose $u \, v in W_M$ with $F \( w \) = u w v^(- 1)$, lift $u$ to $a in N_(upright(bold(M))) \( upright(bold(T)) \)$, and set $b = F \( n \)^(- 1) a n in N_(upright(bold(M))) \( upright(bold(T)) \)$. Thus $F \( n \) = a n b^(- 1)$ and $b$ lifts $v$. The maps
  $ j_1 : upright(bold(K)) arrow.r.hook upright(bold(M)) \, #h(2em) j_2 = "Ad" \( n^(- 1) \) : upright(bold(K)) arrow.r upright(bold(M)) $
  commute with the respective Frobenius maps
  $ F_1 = "Ad" \( a^(- 1) \) F \, #h(2em) F_2 = "Ad" \( b^(- 1) \) F \, #h(2em) F_K = F_1 \|_(upright(bold(K))) . $
  Choose $x \, y in upright(bold(M))$ with $F \( x \) = x a^(- 1)$ and $F \( y \) = y b^(- 1)$. Then $g = x n y^(- 1) in upright(bold(H))^F$. Conjugating $upright(bold(K))$ by $x$ gives $upright(bold(M)) ∩ zws^g upright(bold(M))$ with its two rational embeddings, inclusion and $"Ad" \( g^(- 1) \)$.
  Here is the dual Frobenius check on the full lattices. Choose dual bases of $X \( upright(bold(T)) \)$ and $X \( upright(bold(T))^(*) \) = Y \( upright(bold(T)) \)$. Write $Q$ for the pullback of $F$ on $X = X \( upright(bold(T)) \)$, with Weyl elements acting on $X$ in the usual root-datum convention. Then
  $ F \( w \) = Q^(- 1) w Q \, #h(2em) F_1^(*) = Q u \, quad F_2^(*) = Q v \, #h(2em) w Q v = Q u w . $
  Write $F^or$ for the Frobenius on the dual group, also denoted by $F$ elsewhere. On its character lattice $Y = X \( upright(bold(T))^(*) \)$ put $Q^or = Q^t$ and $w^or = w^(- t)$. Transposing gives
  $ w^or v^t Q^or = u^t Q^or w^or . $
  Consequently, for $U = \( Q^or \)^(- 1) u^t Q^or$ and $V = \( Q^or \)^(- 1) v^t Q^or$,
  $ F^or \( w^or \) = U w^or V^(- 1) . $
  Apply the same normalizer-lift and Lang construction on the dual side. Its two twisted Frobenius pullbacks are $Q^or U = \( Q u \)^t$ and $Q^or V = \( Q v \)^t$, and its second embedding has pullback $w^or$. Its intersection roots are $Phi_M^or ∩ w^or Phi_M^or$. Thus the construction dualizes both embeddings and their Frobenius maps, including the central lattices.
  For completeness, fix $n$ and compare two choices $\( a \, b \)$ and $\( a' \, b' \)$. There is $k in N_(upright(bold(K))) \( upright(bold(T)) \)$ with
  $ a' = a k \, #h(2em) b' = b \( n^(- 1) k n \) . $
  The new intersection Frobenius is $F'_K = "Ad" \( k^(- 1) \) F_K$. Choose $z in upright(bold(K))$ with $F_K \( z \) = z k^(- 1)$. Conjugation by $z$ on the first endpoint and by $n^(- 1) z n$ on the second identifies the two twisted diagrams, and hence their descents. Indeed, one may take $x' = x z$ and $y' = y \( n^(- 1) z n \)$, which gives $x' n y' ""^(- 1) = x n y^(- 1)$. Replacing $n$ by $l n r^(- 1)$ for $l \, r in N_(upright(bold(M))) \( upright(bold(T)) \)$ changes only the two endpoint markings: take $a' = F \( l \) a l^(- 1)$ and $b' = F \( r \) b r^(- 1)$. Different Lang solutions $x \, y$ differ on the left by elements of $upright(bold(M))^F$, so the resulting rational double orbit is unchanged. The same argument applies in the connected dual intersection. Lattice duality makes the construction reversible. We have therefore matched the rational Levi-intersection diagrams with both embeddings. The auxiliary torus used for the lattice calculation is discarded after descent; no rational conjugacy of arbitrary choices of common maximal torus is asserted.
  For a dual rational representative $g in upright(bold(H))^(* F)$, refine its term by rational semisimple classes in the intersection that map to the class of $s$ on both sides. Series disjunction is exactly this refinement of the projected primal Mackey term. Every such matching class can be written
  $ zws^(m_1) s = zws^(g m_2) s \, #h(2em) m_1 \, m_2 in upright(bold(M))^(* F) . $
  Changing the two markings gives $h = m_1^(- 1) g m_2 in upright(bold(C))^F$. The remaining changes are the left and right actions of $upright(bold(C))_M^F$. Conversely a double coset with a representative $h in upright(bold(C))^F$ gives this matching class. Changing $g$ while returning to the same double position conjugates the parameter by the intersection, exactly as in the refinement. Thus the refined terms are in bijection with the Mackey terms for $\( upright(bold(C)) \, upright(bold(C))_M \)$. All centralizers involved are connected, since the relevant derived groups on the dual side are simply connected. Lemma 25, applied to the transported torus diagrams, identifies the Jordan labels under every conjugation in this correspondence.
  #emph[Comparing the contributions.] The rational Mackey terms and their parameter markings have now been matched. We next compare their contributions: equal supports give the identity terms, whereas disjoint supports reduce to a single-cycle calculation on a smaller active packet. There is an explicit description of the intersections in this bijection. For $h in upright(bold(C))^F$, the intersection of $C_(upright(bold(H))^(*)) \( upright(bold(V)) \)$ and $C_(upright(bold(H))^(*)) \( zws^h upright(bold(V)) \)$ contains a maximal torus if and only if $upright(bold(V))$ and $zws^h upright(bold(V))$ commute. For the forward implication, both tori belong to the connected centers of their respective Levis and hence to every maximal torus in them. The converse follows by placing the commuting tori in a maximal torus. The same condition in $upright(bold(C))$ gives its Mackey intersection $C_(upright(bold(C))) \( upright(bold(V)) \, zws^h upright(bold(V)) \)$.
  Take a rational common maximal torus in this connected intersection. The full signed-cycle torus containing $upright(bold(V))$ belongs to the connected center of $C_(upright(bold(C))) \( upright(bold(V)) \)$: within each absolute component the restricted coordinate characters are nonzero and distinct up to sign, so no root involving a cycle coordinate vanishes except the roots of the inactive factors. Every maximal torus of this centralizer therefore contains that full cycle torus. Its active support is consequently preserved when we pass to the common maximal torus, and the same holds for $zws^h upright(bold(V))$.
  On a packet of $delta$ components, $F$ permutes the components transitively and $F^delta$ cyclically permutes the distinct within-component restricted characters with the prescribed signed closing. The support is one signed $F$-orbit, even though restrictions on different components can coincide. The two supports are therefore equal or disjoint. For a cyclotomic cycle the characteristic polynomial on the full orbit is $X^(delta d) - eta$, so $Phi_e$ occurs with multiplicity one. For a split extraction it is $X^delta - 1$, with $Phi_1$ occurring once. Thus the indicated primitive or split subspace is unique on its support. Equal supports thus mean equal subtori. Conjugation in $upright(bold(C))$ cannot add central coordinates or move a support to a different eigenvalue packet.
  If the subtori are equal, the maps in the corresponding intersection term are identities followed by the matched conjugation. If they are disjoint, both induction maps in that term remove a single cycle of the same kind from a strictly smaller residual packet. The cycle already removed is now an inactive torus factor. This remains true if coincident coordinates from distinct sign packets formed an ambient linear factor in $upright(bold(M))^(*)$: its intersection with $upright(bold(C))$ is the indicated cycle torus. By induction on active rank, both maps in the term agree in Jordan labels with the centralizer maps. To check the signs, write $upright(bold(K))^(*) = C_(upright(bold(H))^(*)) \( upright(bold(V)) \, zws^h upright(bold(V)) \)$ and $upright(bold(D)) = C_(upright(bold(C))) \( upright(bold(V)) \, zws^h upright(bold(V)) \)$. Each smaller map has relative sign $epsilon_(upright(bold(M))) epsilon_(upright(bold(K))) epsilon_(upright(bold(C))_M) epsilon_(upright(bold(D)))$; conjugating the marking preserves these split ranks. The two signs therefore multiply to one. The equal-support terms start the induction, including rank zero and the toral $D$ case; an ambient identity extraction needs no induction.
  The trace of the projected ambient Mackey formula is therefore the trace of the unipotent Mackey formula for $\( upright(bold(C)) \, upright(bold(C))_M \)$. These traces are respectively $parallel A parallel_(upright("HS"))^2$ and $parallel B parallel_(upright("HS"))^2$. Equality in (5.5) proves (5.4). For split extraction both sides are ordinary Harish–Chandra induction matrices, with nonnegative entries and a nonzero entry, so the relative sign is positive. Transitivity proves the last assertion. ◻
]

#thm([Corollary 5.6.])[
  (Projected split induction).  #emph[Let $s$ be a $p'$-parameter and fix its rational class in a split Levi $upright(bold(M))$ as above. On characters in $cal(E)_p \( upright(bold(M))^F \, s \)$, the coordinates in $cal(E) \( upright(bold(H))^F \, s \)$ after split induction depend only on the coordinates in $cal(E) \( upright(bold(M))^F \, s \)$. On these coordinates the matrix is the nonnegative branching matrix of Proposition 28, iterated when several size-one factors are extracted. The assertion remains valid after a common central $p$-quotient.]
] <lab:projected-hc>

#proof[
  A row with parameter $s t$, where $t eq.not 1$ is a commuting $p$-element, can induce only to that geometric parameter. It cannot induce to the $p'$-parameter $s$, because its $p$-part stays nontrivial under conjugacy. Thus its projection onto $cal(E) \( upright(bold(H))^F \, s \)$ is zero. For $t = 1$ use Proposition 28 and transitivity, always retaining the chosen Levi class. The assertion for a common central quotient follows because its left and right actions on the induction variety agree. Ordinary split induction and restriction are exact and preserve projectives, so the same coordinate rule applies to projective characters and to their block summands. ◻
]

=== 5.3 Core collections are block collections <core-collections-are-block-collections>

We have determined the ordinary matrices, including the nonuniform rows. To use them on projective modules, the core projections must also be realized by block idempotents. This is the separate modular assertion proved in this subsection.

We use a restricted form of the good-prime block theorem of Cabanes–Enguehard. The relevant statements are [17] Theorems 2.5 and 4.1. For the connected reductive groups at hand, ordinary $e$-cuspidal pairs in $p'$-series have assigned blocks; all constituents of their Lusztig induction lie in the assigned block, and rationally nonconjugate pairs give different blocks. An $e$-split Levi is a centralizer of a $Phi_e$-torus; ordinary $e$-cuspidality means vanishing of adjoint Lusztig induction to every proper $e$-split Levi. This is the general connected reductive statement of the theorem; a central torus need not be split. In our application the semisimple components are classical of type $B \, C \, D$ or $A_1$, $p$ is odd and good, both ambient centers are connected, and the relevant center and fundamental-group orders have no $p$-part. There is no triality component. This includes $p = 3$; see also the classical small-prime discussion in [17] Remark 5.2 and [47] proof of Theorem 3.14(e). We apply this theorem directly to these connected groups. For the connected reductive form used here, including its possibly nonsplit central torus, see also [32] Assumption 2.1.2 and Propositions 2.1.6–2.1.7.

#thm([Lemma 5.7.])[
  (The packed inducing pair).  #emph[Fix target Jordan labels on the active classical packets, and let $kappa$ be their collection of packed cores. Take the signed cycles removed in packing these labels to $kappa$; their number in each packet is determined by its target rank and core rank. Centralize their independent primitive $Phi_e$-subtori in $upright(bold(H))^(*)$, obtaining $upright(bold(L))^(*)$. Then $s$ belongs to $upright(bold(L))^(* F)$, and its dual Levi $upright(bold(L))$ is $e$-split. The ordinary character $lambda$ of $upright(bold(L))^F$ whose Jordan label is $kappa$, trivial on the removed cycle tori and with the fixed inert torus data, has central $p$-defect and is ordinary $e$-cuspidal. If there are separate split core labels the assertion applies to the corresponding choices individually.]
] <lab:packed-pair>

#proof[
  Independent subtori are obtained by giving each of these removed signed cycles its own coordinates and making its cocharacters zero elsewhere. Their centralizer is an $e$-split Levi and contains $s$. The permitted torus positions and the residual orthogonal sign are exactly those of the unipotent core rule; a negative cycle switches the type-$D$ defect congruence. That rule also supplies the inducing label when the residual rank is zero. We check the degree and cuspidality assertions on this actual Levi.
  A packed core has no hook or cohook divisible by the relevant cyclotomic step, so its degree defect contributes no $p$-part beyond its torus data. The $p$-part of every removed cycle torus is already contained in its primitive $Phi_e$-part. Indeed a factor $Phi_j \( q \)$ can be divisible by $p$ only for $j = e p^a$ with $a gt.eq 0$ (with the usual $e = 1$ convention). The signed absolute cycle length is $delta d$, with $delta lt.eq 2$ and $d divides \( p - 1 \)$ or $2 d divides \( p - 1 \)$. It has no $p$-factor, so $a > 0$ cannot occur. These primitive tori and the ambient central torus are central in $upright(bold(L))^(*)$ by construction. No residual core torus has an additional noncentral $Phi_e$-part: such a toral $D$ remainder would still admit a removable cycle. Frozen extracts have order prime to $p$.
  Explicitly, a split $D_1$ packet has order $q_i - 1$. If its $p$-part is nontrivial, then $e_i = 1$, and its label admits a removable $1$-hook. A nonsplit $D_1$ packet has order $q_i + 1$; a nontrivial $p$-part forces $e_i = 2$ and a removable $1$-cohook. Neither can remain in a packed core. Thus every residual $D_1$ core torus has order prime to $p$, even when it enlarges the full residual center. The $p$-part of the full center in (5.6) is consequently the inherited central contribution together with the removed primitive-cycle torus contributions.
  There is no odd-prime isogeny loss in this calculation. Within each absolute packet the primitive-cycle coordinate characters are distinct up to sign. Equalities between different sign packets can therefore tie at most two coordinates and create at most $A_1$ systems. The residual semisimple systems are $B \, C \, D$, and frozen extractions add only the stated rank-one systems. Their standard center orders are powers of $2$. The signed equality lattices and the regular central dressing likewise have at worst $2$-primary indices on both root-data sides. Thus rational torus orders, computed on the rational spaces, give the correct $p$-parts also for the actual centers. Dual centers have the same rational order. The degree rule of Proposition 24 consequently gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ "def"_p \( lambda \) = \| Z \( upright(bold(L)) \)^F \|_p . $ <lab:central-defect>]
  One may also see the lower bound in this equality directly: a character in a $p'$-series is trivial on the central $p$-subgroup.
  We have established the actual-center degree identity. To prove ordinary $e$-cuspidality, we now combine projectivity modulo that center with the larger central $p$-subgroup in every proper $e$-split Levi. Put $Z = O_p \( Z \( upright(bold(L)) \)^F \)$. Equation (5.6) says that $lambda$, viewed on $upright(bold(L))^F \/ Z$, is an ordinary defect-zero character, hence the character of a projective module. Let $upright(bold(K))$ be a proper $e$-split Levi of $upright(bold(L))$. Its adjoint Lusztig restriction $psi = zws^(*) R_(upright(bold(K)))^(upright(bold(L))) lambda$ is a virtual projective character of $upright(bold(K))^F \/ Z$. Here is the quotient justification. In a Deligne–Lusztig induction variety the left and right actions of the common finite central subgroup agree, and these translations are free. After division by $Z$, stabilizers for either group action have prime-to-$p$ order: they come from unipotent stabilizers, with the harmless prime-to-$p$ central kernels. The projective-complex theorem for Rickard cohomology [59] therefore sends projectives to virtual projectives. Over characteristic zero, taking the quotient variety selects precisely the $Z$-invariant summand. This proves the assertion about $psi$ without imposing modular compatibility on Jordan decomposition.
  Every parameter occurring in $psi$ is conjugate to the $p'$-element $s$. Thus $psi$ is trivial on $O_p \( Z \( upright(bold(K)) \)^F \)$. This group is strictly larger than $Z$. Indeed the centers of these Levis are connected, and proper $e$-split centralization adds a nonzero $Phi_e$-subspace to the center. The quotient of the centers is a torus whose order has a factor $Phi_e \( q \)$. Lang’s theorem on the connected kernel $Z \( upright(bold(L)) \)$ makes the sequence on rational centers surjective, so the quotient adds a nontrivial $p$-part. Choose a central element of order $p$ in its image in $upright(bold(K))^F \/ Z$.
  A virtual projective character vanishes on $p$-singular elements. For any $p$-regular element $x$ of $upright(bold(K))^F \/ Z$, multiplying $x$ by this central element gives a $p$-singular element, with the same value of $psi$ because the central element is in its kernel. Hence $psi \( x \) = 0$ as well, and $psi = 0$. Since $upright(bold(K))$ was arbitrary, $lambda$ is ordinary $e$-cuspidal. ◻
]

#prodef([Remark 5.8.])[
  The same pairs also have the centralizer description often called $e$-Jordan cuspidality. The $Phi_e$-center of $C_(upright(bold(L))^(*)) \( s \)$ is central in $upright(bold(L))^(*)$, and the unipotent core is cuspidal for the corresponding cyclotomic index. If a packet is represented over $q^2$, projection of an ambient $Phi_e$-subtorus gives its cyclotomic subtorus for $"ord"_p \( q^2 \)$; thus folding does not change which cuspidality test is made. Moreover $upright(bold(L))^F \/ \( Z \( upright(bold(L)) \)^F \[ upright(bold(L)) \, upright(bold(L)) \]^F \)$ and the intersection in this central product have prime-to-$p$ order. Clifford restriction across this abelian quotient preserves degree $p$-parts: inertia multiplicities are degrees of projective representations of a $p'$-group, realized over a finite $p'$-central extension. Equation (5.6) therefore gives defect zero on the derived group after the central part is removed, which is the quasi-central defect condition. The direct ordinary cuspidality proof above is what is needed for the stated theorem of Cabanes–Enguehard.
] <lab:jordan-cuspidal>

#thm([Proposition 5.9.])[
  (Core block projections).  #emph[In each remaining type-$A$ unipotent target, and in each regular classical target with fixed $p'$-parameter $s$, the following holds. Partition the basic rows in $cal(E) \( upright(bold(H))^F \, s \)$ by their packed core collections, using the actual unordered-symbol and type-$D$ identifications. Each part is the intersection of that basic set with a union of blocks in $cal(E)_p \( upright(bold(H))^F \, s \)$. Distinct core collections cannot occur in the same block. Split sign choices within one underlying core may be merged.]
  #emph[This remains true in every intermediate split Levi with the specified frozen extractions, and after the common central $p$-quotient. Consequently all these core projections are projections by sums of block idempotents on projective modules.]
] <prop:core-blocks>

#proof[
  For the general linear and unitary unipotent targets this is the ordinary block/core rule of Fong–Srinivasan [35], with partition step $"ord"_p \( epsilon.alt q \)$.
  Consider a regular classical target. Choose a basic row with a given core collection and apply Lemma 30 to its labels. The resulting pair is ordinary $e$-cuspidal, belongs to a $p'$-series, and has central defect. The preceding root-lattice calculation verifies all the stated classical hypotheses of the Cabanes–Enguehard theorem on $upright(bold(H))$ and on the intermediate Levis: no exceptional or triality component occurs, all relevant odd primes are good, both centers are connected, and the extra equality components are at most $A_1$. Thus the theorem assigns a block to this pair. By Proposition 28, transitivity, and the ordinary unipotent core rule, every basic row with the given core occurs in the induction of one of its packed inducing characters. Constituent inclusion puts it in the corresponding assigned block.
  We must distinguish the pairs for different cores under rational conjugacy. Suppose two such primal pairs are rationally conjugate. Transport a rational torus in their Levis, with its full ambient marking. Duality and the descent of the marked diagram used in the proof of Proposition 28 transport the dual Levi diagram, and the series rule transports its parameter. Adjusting inside the target dual Levi then makes this parameter exactly $s$. The resulting transport lies in $upright(bold(C))^F$. Its action on the residual unipotent labels is determined by the torus pairings, hence by Lemma 25.
  Inside $upright(bold(C))^F$ these are the ordinary cycle-Levi and core data on the fixed eigenvalue packets. The central primitive-cycle factors record the number of removed cycles in each nontoral packet; a residual toral core has no additional noncentral $Phi_e$-part. A conjugation matching the cycle data acts on the residual packed label by its actual symbol identifications. It cannot change it to a different row pair, nor can inner conjugation in the connected centralizer exchange different eigenvalue packets. A wholly toral packet has only its single unipotent label. The allowed type-$D$ graph and sign identifications give exactly the already stated core equivalence. Equivalently, this is the rational nonconjugacy assertion for the packed data in the ordinary unipotent core rule. Therefore different core collections give nonconjugate inducing pairs. Uniqueness up to conjugacy in the Cabanes–Enguehard theorem puts their rows in different blocks.
  Every block in $cal(E)_p \( upright(bold(H))^F \, s \)$ meets $cal(E) \( upright(bold(H))^F \, s \)$, and that intersection is an integral basic set for the block. Since the basic rows have just been partitioned by disjoint assigned block collections, each core collection is exactly the basic-row intersection of its union of blocks. No assertion about modular Jordan decomposition is involved. The argument applies verbatim with the frozen factors and their markings. Finally a central $p$-quotient gives the usual bijection of blocks, preserving their basic rows with trivial central action. Sums of the resulting block idempotents preserve projectives, proving the last assertion. ◻
]

== 6 Runner reductions and projective cones <sec:runners>

We now reduce the unbounded ranks in the odd-prime classical problem. The operations will be split Harish–Chandra induction and restriction, followed by projections onto unions of blocks. Their matrices on the basic rows are particularly simple. It is these matrices, together with positivity on projectives, that will transfer bounds.

Runner rearrangements connect this argument with the abacus reductions of Scopes and Jost and the classical unipotent equivalences of Hiss–Kessar [61,44,40,41]. Here the transported objects are cones of projective characters; the moves need only transfer numerical bounds, without providing Morita equivalences.

Throughout this section $p$ is odd and does not divide $q$. We use the ordinary labels and degree formulas of Proposition 24, the branching rule of Proposition 28, and the block projections of Proposition 32. The type $A$ series considered here is unipotent. In the regular classical groups of Lemma 19, a #emph[packet] means a Frobenius orbit of classical factors of the connected centralizer of the fixed semisimple $p'$-parameter whose normalized spectrum is contained in ${ 1 \, - 1 }$. We calculate on one representative factor with the composite endomorphism around the orbit. There are boundedly many packets, with field parameters $q_i = q^delta$, $delta lt.eq 2$, as in Lemma 22. The parameter is retained on every Levi: induction always starts in its prescribed rational Levi conjugacy class.

#thm([Proposition 6.1.])[
  #emph[Fix $p$ and a defect-order bound $M$. Consider either a unipotent block of $"GL"_n \( q \)$ or $"GU"_n \( q \)$ of defect order at most $M$, or a block in a sign-parameter series of an original regular classical group above, before extraction, whose defect order modulo its central $p$-subgroup is at most $M$. There are constants depending only on $p \, M$ with the following properties.]
  #emph[The required Cartan bound reduces to Cartan bounds for groups with root data in a finite set, and for the following block-union projections: labels in a fixed ordinary cuspidal triangle series, with a bounded number of split Harish–Chandra rank-one steps above the triangle. The latter projections have boundedly many basic rows and bounded block defects, although the triangle rank can be unbounded. The transfer constants are uniform.]
  #emph[Consequently Theorem 6 and Proposition 45 give the required Cartan bounds for all these blocks.]
] <prop:runner-reduction>

We first bound the runner weights and calculate the move matrices, including their type-D foldings. We then control the complete reduction in two stages: a map of bounded condition number on the full coordinate space, followed by the symmetric stage. Bounds return through these stages in reverse order, using the two forms of the cone lemma below. All dimensions and norms below are ordinary Euclidean ones; changing to a coordinate $ell^1$-norm changes constants only by the bounded dimension.

=== 6.1 Charged runners and bounded weight <charged-runners-and-bounded-weight>

A charged bead set is a subset $B subset bb(Z)$ containing every sufficiently negative integer and no sufficiently positive integer. Its charge is

$ c \( B \) = \| B ∩ bb(Z)_(gt.eq 0) \| - \| bb(Z)_(< 0) \\ B \| . $

List its elements in decreasing order as $b_1 > b_2 > dots.h.c$. There is a unique partition $lambda$ such that

$ b_a = c \( B \) - a + lambda_a . $

Its weight $w \( B \) = \| lambda \|$ is also the number of pairs $\( b \, g \)$ with $b in B$, $g in.not B$, and $g < b$. Indeed the bead $b_a$ has exactly $lambda_a$ gaps below it. The packed set of charge $c$ is $B \( c \) = { k in bb(Z) : k < c }$.

#thm([Lemma 6.2.])[
  #emph[If $w \( B \) lt.eq W$, then $B$ agrees with $B \( c \( B \) \)$ outside $\[ c \( B \) - W \, c \( B \) + W \)$. For charged sets $B \, B'$ of total weight at most $W$, put $m = c \( B \) - c \( B' \)$. If $m > 2 W$, then $B' subset B$ and $\| B \\ B' \| = m$. In general 
#[#set math.equation(numbering: n => "(6.1)")
 $ \| B \\ B' \| lt.eq max \( m \, 0 \) + 2 W . $ <run:availability>]

 There are at most as many charged sets of fixed charge and weight $w$ as partitions of $w$.]
] <run:localization>

#proof[
  For $a > W$ we have $lambda_a = 0$, and $b_1 lt.eq c \( B \) - 1 + W$. This proves the asserted strip. One can obtain $B$ from its packed set by $w \( B \)$ unit bead moves; consequently each of the numbers of added beads and removed beads is at most $w \( B \)$. When $m > 2 W$, every gap of $B$ is above every possible bead of $B'$ not already in the common filled negative part, giving the inclusion. The difference of charges is then the size of the set difference. Comparing both sets with their packed sets proves (6.1). The partition description proves the last assertion. ◻
]

To pass from the finite labels to charged bead sets, use ${ lambda_a - a : a gt.eq 1 }$ for a partition $lambda$; this set has charge zero. For a symbol $\( A \, B \)$, first extend its rows to $A union bb(Z)_(< 0)$ and $B union bb(Z)_(< 0)$, of charges $\| A \|$ and $\| B \|$. Translate both sets by $- floor.l \( \| A \| + \| B \| \) \/ 2 floor.r$. Their charge sum is then zero or one. A simultaneous symbol shift translates both extended sets by one and increases this floor by one, so the normalized charged rows are independent of the finite representative.

Here are the runner conventions, including the offsets at their ends. Each runner records the integers $k$ for which the displayed position is occupied in these charged sets. Write $epsilon.alt = 1$ in the linear case and $epsilon.alt = - 1$ in the unitary case, and set $e = "ord"_p \( epsilon.alt q \)$. Partition positions $j + e k$ form runner $j$, with bead set $B_j$ in the coordinate $k$ and packed threshold $C_j = c \( B_j \)$. Extend the indices by

#[#set math.equation(numbering: n => "(6.2)")
 $ B_(j + e) = B_j - 1 \, #h(2em) C_(j + e) = C_j - 1 . $ <run:a-offset>]

A split rank-one extraction moves $j$ to $j - 1$ for $"GL"$, and $j$ to $j - 2$ for $"GU"$, at unchanged $k$. Thus the unitary move is a $2$-hook removal.

For a symbol, put $Q = q_i$. If $"ord"_p \( Q \) = d$ is odd, use in each row the runners $j + d k$, with $C_(j + d) = C_j - 1$. This is the #emph[hook case]. If $"ord"_p \( Q \) = 2 d$, use positions $j + d k$ in the first row when $k$ is even and in the second row when $k$ is odd. Taking $0 lt.eq j < 2 d$ lists every position in the two rows once. Now

#[#set math.equation(numbering: n => "(6.3)")
 $ B_(j + 2 d) = B_j - 2 \, #h(2em) C_(j + 2 d) = C_j - 2 \, #h(2em)\
\( tau B \)_j = B_(j + d) + 1 \, quad \( tau C \)_j = C_(j + d) + 1 \, $ <run:cohook-offset>]

where $tau$ exchanges the two symbol rows. This is the #emph[cohook case]. In both symbol cases a split rank-one extraction is $j arrow.r j - 1$. All translations in these formulas translate the whole bead set.

Thus partitions have total charge zero, and the two physical symbol rows have charge sum zero or one. In types $B \, C$ orient the rows so that their length difference is $1$ modulo $4$. Packing cohook runners can change this difference by $2$ modulo $4$ at each removal. The oriented packed core is therefore determined by the core class and the weight. Type $D$ cores are instead taken up to $tau$. A core is called #emph[symmetric] if it is fixed by $tau$, with the offsets in (6.3) included.

The sum $W = sum_j w \( B_j \)$, over all the relevant runners and packets, is the cycle weight. Packing gives exactly the cores in Proposition 32. A hook or cohook at a contributing distance is an inversion on one of these runners.

#thm([Lemma 6.3.])[
  #emph[For the starting blocks in Proposition 33, the cycle weights are bounded in terms of $p \, M$. If all weights vanish, the block is of defect zero after the indicated central quotient. Otherwise the relevant basic cyclotomic $p$-parts, and in the regular classical case the actual central $p$-order, are bounded.]
  #emph[In the positive-total-weight case, every endpoint core collection retaining these weights has boundedly many basic rows and bounded block defects upstairs. These bounds also hold for a union of a bounded number of such collections.]
] <run:defect-bounds>

#proof[
  Every contributing inversion supplies a factor divisible by $p$ in the degree-defect formula of Proposition 24. In the regular classical case divide first by the original central $p$-order $\| Z_p \|$. Hence $p^W lt.eq M$. If $W = 0$, every basic-row degree has relative defect one; the integral-basic-set degree criterion of Lemma 3 gives defect zero in the quotient. This case is completed before any runner extraction. The toral $D_1$ core boundary contributes no hidden $p$-factor, by the explicit packed-core check in Section 5.
  If a packet has positive weight, its degree defect is divisible by the basic factor
  $ alpha = cases(delim: "{", \( \( epsilon.alt q \)^e - 1 \)_p \, & upright("type ") A \,, \( Q^d - 1 \)_p \, & upright("hook case") \,, \( Q^d + 1 \)_p \, & upright("cohook case") .) $
  Thus the relevant $alpha$ is bounded. All classical packets have the same $Q$. Lemma 23 then bounds the central $p$-order, so that from now on we can work upstairs. Subsequent residual degree calculations use the inherited torus and retain any $D_1$ packet separately, as in Proposition 24. Lemma 23 also bounds the full residual centers, with exponent at most four. All further steps are performed upstairs; they do not require a product decomposition of a quotient by a diagonally acting central subgroup. Packets of weight zero contribute no such factor.
  If an inversion has runner distance $h$, it accounts for at least $h$ inversions: between its gap $g$ and bead $b = g + h$, each intermediate position is either a bead paired with $g$ or a gap paired with $b$. Therefore $h lt.eq W$. Lifting the exponent, for odd $p$, bounds its factor by $alpha h_p$; the same statement for a negative cycle follows by applying it to odd powers in $Q^d + 1$, with the even powers recorded as hooks on the same alternating runner. There are at most $W$ factors. Thus every basic-row degree defect is bounded at a retained-weight endpoint. The integral-basic-set criterion bounds the block defects of the whole collection, not just the defects of its displayed rows.
  There are boundedly many runners, because $e \, d lt.eq p - 1$, and boundedly many packets. Lemma 34 bounds the number of labels of total weight $W$, including the at most two split signs on a type $D$ label. The number of blocks is no greater than the number of basic rows. The block-union version of Lemma 3 now gives all the stated bounds. ◻
]

The zero-total-weight case is now complete, so henceforth $W > 0$. For a retained-weight core collection $cal(C)$, let $D_(cal(C))$ be the matrix whose columns are its PIM characters projected onto its ordinary basic rows. The lemma makes this a square, full-rank nonnegative integral matrix of bounded size and bounded determinant. Its column cone is

$ cal(P)_(cal(C)) = D_(cal(C)) bb(R)_(gt.eq 0)^(thin l \( cal(C) \)) \, $

where $l \( cal(C) \)$ is the number of simple modules in the block collection. We will use induction to compare these cones and thereby bound the entries of $D_(cal(C))$. Lemma 3 then bounds the full projective characters and their Cartan inner products.

=== 6.2 Ordered moves and their realization <ordered-moves-and-their-realization>

An edge means one of the allowed moves $j arrow.r j'$. Its positive difference is $C_j - C_(j')$, using the displayed offsets if an index passes an end. If this difference is $m > 2 W$, the corresponding bead sets are nested. Transfer the $m$ beads in $B_j \\ B_(j')$ across the edge. This interchanges the two bead sets, with their coordinate offsets.

#thm([Lemma 6.4.])[
  #emph[Suppose the ordered core convention is allowed at both ends. The projection of $m$ successive rank-one extractions onto the swapped core has matrix $m ! P$, where $P$ is the bijection interchanging the runner bead sets. The reversed induction matrix is its transpose. The same conclusion holds for two disjoint edges, each with difference $m$, with coefficient $\( 2 m \) !$ and the simultaneous-swap bijection.]
] <run:ordered-swap>

#proof[
  Let $v_j$ count the moves across the edge from $j$. Their effect on the charges is the incidence vector $partial v$; on a step-one cycle,
  $ \( partial v \)_j = v_(j + 1) - v_j . $
  Changes of charges have no offset. The kernel of this incidence map consists precisely of vectors constant on each directed cycle. The prescribed charge change is $partial \( m e_j \)$. The difference between any other flow and $m e_j$ is therefore constant on each cycle. Each cycle has an unused edge, so nonnegativity forces every such constant to be nonnegative. The total number $m$ of extractions forces every constant to be zero. For two disjoint opposite edges use $m e_j + m e_(j^(*))$ instead. In the cases where we use this argument each cycle again has an unused edge.
  Thus a bead can move only across the prescribed edge or edges. It can cross each edge at most once. Every surplus bead must cross, and any order of the $m$, respectively $2 m$, distinct transfers is legal. This gives the factorial and the unique output. The total runner weight is unchanged by permuting the bead sets. Conversely every target label has the same bounded weight, so Lemma 34 supplies the reverse nesting and reconstructs its unique source. Path reversal proves the assertion for induction. ◻
]

The cycles omitted by the unused-edge assertion cannot have a large positive difference: for a length-one cycle the difference is the negative period offset. In particular this covers $e = 1$ in $"GL"$, $e in { 1 \, 2 }$ in $"GU"$, and $d = 1$ in hook symbols.

Each individual transfer is an actual hook removal on a partition or a same-row hook removal on a symbol, and therefore an actual split Harish–Chandra step. By Lemma 22, a classical packet step extracts a factor $"GL"_delta \( q \)$; the type $A$ extracts are $"GL"_1 \( q \)$ and $"GL"_1 \( q^2 \)$. All these factors have order prime to $p$ whenever a large move occurs. In the hook case a large move requires $d > 1$; in the cohook case $p divides.not Q - 1$. If $delta = 2$, the former condition also excludes $p divides q^2 - 1$, and the latter does so directly. The type $A$ exclusions above likewise give the claim. These extracted factors can be retained as independent frozen factors in the Levi, each in its fixed defect-zero block.

There is no additional rank or sign constraint to impose after a legal path has been specified. Ordinary Harish–Chandra branching realizes each of its labels in the appropriate residual classical group. The physical row lengths, and thus the symbol defect congruence, are preserved by each symbol step. A nonsplit orthogonal residual group cannot reach a rank-zero label. The independent hyperbolic coordinates in Lemma 22 realize the whole chain of extractions, including the fixed other packets.

Induction and restriction are exact and preserve projectives: the unipotent radical has order prime to $p$, so its averaging idempotent defines an exact direct summand. Projection onto a union of blocks also preserves projectives. All resulting projective maps are therefore nonnegative in PIM bases. By the ordinary parameter rule in Proposition 28, rows with a nontrivial semisimple $p$-part cannot contribute to the basic rows with trivial $p$-part. Consequently their projected coordinate maps depend only on the displayed basic coordinates. This remains true with intermediate core projections. Possible other Levi parameter classes inducing to the same ambient class are irrelevant, since the source has been projected onto the prescribed class.

For an unnormalized composite functor $F$ between retained-weight core collections $cal(C)$ and $cal(C)'$, let $A_F$ be this map on basic coordinates. Let $N_F$ record the multiplicities of target PIMs in the images of source PIMs. The two descriptions of each image give

$ A_F D_(cal(C)) = D_(cal(C)') N_F \, #h(2em) N_F gt.eq 0 \, #h(2em) A_F cal(P)_(cal(C)) subset.eq cal(P)_(cal(C)') . $

The entries of $N_F$ are integers, but no bound on them is assumed. Dividing $A_F$ by a positive scalar preserves the cone inclusion, with the same division applied to $N_F$. The bounded sizes and determinants concern the retained-weight endpoints; no bound on intermediate projection dimensions is needed.

=== 6.3 The type D folding <the-type-d-folding>

The ordered swap calculation is now available as an actual projective-preserving operation. In type $D$ its ordinary matrix must still be checked after row exchange, because an unordered target can receive extra paths and an equal-row label has two distinct characters.

#thm([Lemma 6.5.])[
  #emph[In a type $D$ ordinary Harish–Chandra series with equal row lengths, folding ordered bipartitions sends a nonsymmetric bipartition to its unordered character and an equal bipartition to the sum of its two split characters. With twice the single character as the folding convention at relative rank zero, this map intertwines induction through any positive number of marked rank-one extractions and every underlying-core projection. Such induction annihilates the difference of two split source characters.]
] <run:folding>

#proof[
  Write $B_b = C_2 wreath S_b$ and let $D_b$ be its subgroup of even signed permutations. The asserted folding at positive rank is $"Res"_(D_b)^(B_b)$, by the elementary index-two character description of these groups. If $1 lt.eq j < b$, embed $B_j$ on the old indices and fix every new index. An odd sign change on an old index belongs to $B_j$, so
  $ D_b B_j = B_b \, #h(2em) D_b ∩ B_j = D_j . $
  The Mackey formula, with its single double coset, gives
  $ "Res"_(D_b)^(B_b) "Ind"_(B_j)^(B_b) = "Ind"_(D_j)^(D_b) "Res"_(D_j)^(B_j) . $
  At $j = 0$ there are two double cosets instead, and the left side is twice $"Ind"_(D_0)^(D_b)$; this proves the stated rank-zero convention.
  An odd sign change on an old index interchanges the two split characters. Multiplying it by a sign change on a new index gives an element of $D_b$ inducing the same conjugation on $D_j$. Their induced characters are thus equal, proving the assertion about their difference. Core projectors retain precisely a row-exchange orbit and both split signs if present. They commute with folding. Iteration proves the assertion with intermediate projectors. ◻
]

For nonzero row-length difference orient by the length and use ordinary ordered branching. For zero difference Lemma 37 shows that, between nonsymmetric cores, the coefficient is the count of ordered paths from one fixed orientation to either orientation of the target. There are no equal-row labels above a nonsymmetric core. Reversing paths and exchanging both orientations gives the identical rule for induction.

#thm([Lemma 6.6.])[
  #emph[Suppose $d > 1$, and let $j^(*)$ be the edge paired with $j$ by row exchange. They are disjoint. A sufficiently large swap from a nonsymmetric core to a nonsymmetric core has exactly the matrix of Lemma 36, also on unordered labels. If $d gt.eq 3$ and a sufficiently large swap would give a symmetric core, there is a different large edge whose swap stays nonsymmetric.]
] <run:nonsymmetric>

#proof[
  Let $m = C_j - C_(j')$, and put $m_1 = C_(j^(*)) - C_(\( j' \)^(*))$. If $v$ is a flow to the exchanged target, applying row exchange to its charge equation and adding gives
  $ partial \( v + tau v \) = partial \( m e_j + m e_(j^(*)) \) . $
  Every relevant cycle has a missing edge because $d > 1$ (in the hook case $d$ is odd, hence at least three). Nonnegativity and the total length $2 m$ therefore give $v + tau v = m e_j + m e_(j^(*))$. In particular $v$ is supported on these two disjoint edges. Their charge equations give
  #[#set math.equation(numbering: n => "(6.4)")
   $ v_j = frac(m - m_1, 2) \, #h(2em) v_(j^(*)) = frac(m + m_1, 2) . $ <run:exchanged-flow>]
  If $\| m_1 \| lt.eq 2 W$, the second expression is larger than the availability bound (6.1) for sufficiently large $m$. If $m_1 > 2 W$, nesting gives $v_(j^(*)) lt.eq m_1$, whereas $v_j gt.eq 0$ gives $m_1 lt.eq m$. Equality $m_1 = m$ is forced, so $v_j = 0$; the full charge equation then says that the source is symmetric. If $m_1 < - 2 W$, no move at $j^(*)$ is available, so $v_(j^(*)) = 0$; the target is symmetric. Both possibilities are excluded.
  Now suppose that the intended target is symmetric. The source and its exchange then differ exactly on the two pairs of vertices incident to the edge and its opposite. In the hook case, put the thresholds on one edge equal to $L \, H$, with $m = H - L$. The other row has $H \, L$ at these vertices. Along the remaining $d - 1$ edges of that other row, the threshold rises sum to $m - 1$, the subtraction of one coming from the period offset. One of these other edges consequently has positive difference at least $\( m - 1 \) \/ \( d - 1 \)$.
  In the cohook case number the vertices so that the four exceptional thresholds are
  $ C_0 = L \, quad C_1 = H \, quad C_d = H - 1 \, quad C_(d + 1) = L - 1 . $
  At every other pair, $C_(i + d) = C_i - 1$. Put $Delta_i = C_i - C_(i - 1)$. For $d gt.eq 3$, the identity
  $ Delta_(d + 2) + sum_(i = 3)^d Delta_i = m - 1 $
  again supplies a different positive difference at least $\( m - 1 \) \/ \( d - 1 \)$. Choose the original threshold large enough that this exceeds the inclusion threshold. The new edge is incident to a different pair of row-exchange vertex pairs. Its charge change cannot cancel the original asymmetry, which is supported on exactly the original two pairs. Its target is therefore nonsymmetric. ◻
]

#thm([Lemma 6.7.])[
  #emph[For a symmetric core and $d > 1$, simultaneous swaps on two opposite large edges have coefficient $\( 2 m \) !$ on ordered labels. The output bijection commutes with row exchange and preserves equal-row labels. After factorial normalization, the composite of any sequence of these inductions has bounded rational entries and bounded denominators. Its image is the subspace in which coordinates on each affected split pair agree, with the full coordinates retained on unaffected packets.]
] <run:symmetric>

#proof[
  Symmetry makes the two edge differences equal. The flow proof of Lemma 36 gives the unique simultaneous flow and the $\( 2 m \) !$ possible orders. Both the operation and its inverse commute with row exchange, so they preserve fixed points as well as two-element orbits.
  Use a basis consisting of the nonsplit labels and the sums of split pairs. Lemma 37 says that normalized induction is the resulting bijection on this basis, except for its factor of two at rank zero. For an individual split source its image is half the image of the sum, because the difference is annihilated as soon as a new index is added. At each subsequent step the sum, rather than either individual label, is transported bijectively. Thus the factor $1 \/ 2$ occurs only once. Rank zero is passed at most once in an induction chain. These observations also prove that the image is the entire indicated subspace. Tensoring over the bounded number of packets preserves the bounded-entry and bounded-denominator assertions. Packets on which no such induction occurs retain their full space. ◻
]

=== 6.4 The two exceptional cohook moves <the-two-exceptional-cohook-moves>

Only cohook $d = 1 \, 2$ remain. Their normalized matrices need not be permutations, but the errors form convergent series. For $d = 1$, repeated moves of the same bead give an exponentially small extra contribution. For $d = 2$, a two-edge path avoids the symmetric core and gives a quadratic error bound. Both estimates will control products of arbitrarily many moves.

#thm([Lemma 6.8.])[
  #emph[For cohook $d = 1$ and sufficiently large positive difference $m$, both endpoints of the swap are nonsymmetric. After division by $m !$, its unordered matrix is $P + E_m$, where $P$ is the ordered-swap permutation and, for constants depending only on the weight, 
$ parallel E_m parallel lt.eq K thin 2^(- m \/ 2) . $

 The next positive difference is $m - 2$.]
] <run:d-one>

#proof[
  Write $C_0 = L \, C_1 = H \, C_2 = L - 2$, with $m = H - L$. The ordered target is $\( H \, L \)$, whereas its exchange is $\( L + 1 \, H - 1 \)$. A path of length $m$ to the latter has exactly $\( m + 1 \) \/ 2$ moves on $1 arrow.r 0$ and $\( m - 1 \) \/ 2$ on the other edge, by its charge equations. If these are not integers, there is no such path.
  Below $L - W - 2$ both runners are full. No bead in this region can ever move, since a move goes downwards and would require a gap below it. There are at most $K_0 = K_0 \( W \)$ beads originally on the low runner above this region. Every move on the other edge is therefore a repeated move of a bead already moved earlier, except possibly for these $K_0$ beads. At least $\( m - 1 \) \/ 2 - K_0$ moves repeat a bead.
  Fix the two oriented endpoint labels. Within each physical row beads cannot pass each other: all these moves have physical length one. Matching them in their order fixes each bead’s number $a_t$ of moves. The number of possible paths is at most
  $ frac(m !, product_t a_t !) . $
  For $a gt.eq 1$, $a ! gt.eq 2^(a - 1)$. Hence $product_t a_t ! gt.eq 2^(\( m - 1 \) \/ 2 - K_0)$. This bounds every extra normalized entry exponentially. The endpoint dimensions are bounded by Lemma 35, giving the claimed operator bound.
  The source is symmetric only for $m = - 1$, and the swapped target only for $m = 1$, so neither large endpoint is symmetric. After the swap the other edge has positive difference $H - \( L + 2 \) = m - 2$, as claimed. ◻
]

#thm([Lemma 6.9.])[
  #emph[In cohook $d = 2$, suppose a large swap from a nonsymmetric core would give a symmetric core. Number its thresholds as 
$ \[ C_0 \, C_1 \, C_2 \, C_3 \] = \[ L \, H \, H - 1 \, L - 1 \] \, #h(2em) m = H - L . $

 There is a projected extraction of length $2 m - 1$ to the nonsymmetric core $\[ H \, H - 1 \, L \, L - 1 \]$. After division by $m ! \( m - 1 \) !$, its matrix has the form 
$ \( 1 - 1 \/ m \) P + E_m \, #h(2em) parallel E_m parallel lt.eq frac(K \( W \), m \( m - 1 \)) \, $

 where $P$ is a bijection preserving total runner weight. Reindexing the target from the old vertex $3$ gives the same exceptional pattern with parameter $m - 1$.]
] <run:d-two>

#proof[
  Use the ordered edge sequence
  #[#set math.equation(numbering: n => "(6.5)")
   $ \( 1 arrow.r 0 \)^(m - 1) \, quad \( 2 arrow.r 1 \) \, quad \( 1 arrow.r 0 \) \, quad \( 2 arrow.r 1 \)^(m - 2) \, $ <run:detour>]
  projecting onto its core after every individual step. After $u \, v$ steps on the two edges the thresholds are
  $ \[ L + u \, H - u + v \, H - 1 - v \, L - 1 \] . $
  The symmetry equations are $u + v = m$ and $u - v = m$; thus symmetry occurs exactly at $\( u \, v \) = \( m \, 0 \)$. The path (6.5) avoids it.
  A single step between these nonsymmetric cores cannot reach the opposite orientation. Indeed adding its flow to its row exchange leaves total length two, supported on that edge and its opposite by the missing-edge argument. Choosing the same edge for the exchanged target would make the target symmetric; choosing the opposite edge would make the source symmetric. Both are excluded. Thus the actual unordered projections force exactly the ordered trajectory, even when a particular label has equal row lengths.
  The initial nesting gives $B_0 subset B_1 \, B_2$. Set
  $ A = B_1 \\ B_0 \, #h(2em) C = B_2 \\ B_0 \, #h(2em) \| A \| = m \, quad \| C \| = m - 1 \, quad rho = \| C \\ A \| . $
  Here $rho lt.eq W$: every bead of $B_2 \\ B_1$ is either a hole below the threshold of $B_1$ or an extra bead above the threshold of $B_2$, and these holes and extra beads are bounded by the two runner weights.
  The first segment transfers all of $A$ except one choice $a$. The next step transfers a choice $b in C \\ { a }$. If the following step transfers $a$, the last segment must transfer all remaining elements of $C$. Its output is the rotation
  $ \[ B_0 \, B_1 \, B_2 \] mapsto \[ B_1 \, B_2 \, B_0 \] . $
  For each such pair $\( a \, b \)$, the first and last long segments can be ordered in $\( m - 1 \) ! \( m - 2 \) !$ ways. The number of pairs is $m \( m - 1 \) - \| A ∩ C \|$. The exact rotation coefficient is therefore
  #[#set math.equation(numbering: n => "(6.6)")
   $ m ! \( m - 1 \) ! (1 - frac(\| A ∩ C \|, m \( m - 1 \))) . $ <run:rotation-count>]
  The only alternative is to transfer $b$ at the third segment. It can enter runner $0$ only if $b in.not A$. Completing all $m - 2$ final transfers is then possible only if $a in.not C$; otherwise one fewer bead can enter runner $1$. Conversely these two conditions suffice, and give exactly the same number $\( m - 1 \) ! \( m - 2 \) !$ of paths. There are $rho \( rho + 1 \)$ such pairs, since $\| A \\ C \| = rho + 1$. Also $\| A ∩ C \| = m - 1 - rho$. Thus the column $ell^1$-error from $\( 1 - 1 \/ m \) P$, after normalization, is exactly
  $ frac(rho + rho \( rho + 1 \), m \( m - 1 \)) = frac(rho \( rho + 2 \), m \( m - 1 \)) lt.eq frac(W \( W + 2 \), m \( m - 1 \)) . $
  The bounded endpoint dimension gives the operator estimate.
  The rotation is a bijection: at the target its low runner is still nested in both high runners, so the inverse rotation recovers every endpoint label. It permutes runner partitions and hence preserves their total weight. Each transfer uses the same physical row at its source and target; physical row lengths are preserved. Finally the period offset gives, on reindexing from $3$,
  $ \[ L - 1 \, H - 2 \, H - 3 \, L - 2 \] \, $
  which has parameter $m - 1$. No bound on the dimensions of the intermediate projections was used. ◻
]

=== 6.5 Termination and transfer of bounds <termination-and-transfer-of-bounds>

All individual move matrices have now been calculated. We must choose a terminating sequence and control its cumulative effect: bounded condition number handles the invertible stage, while a separate argument handles the split-pair identifications.

Choose all large-difference thresholds in terms of $p \, W$, larger than the inclusion thresholds above. At a nonsymmetric type $D$ core use an exact swap when its target is nonsymmetric. For $d gt.eq 3$, Lemma 38 replaces a forbidden swap by a different large swap. Stop once every positive difference is below the resulting fixed threshold. For cohook $d = 1$ use Lemma 40; for cohook $d = 2$, use exact swaps until stopping or first reaching the exceptional pattern, then use Lemma 41 repeatedly. All other ordered packets use Lemma 36. Perform these full-space reductions before reducing symmetric packets by the paired moves of Lemma 39.

Every move removes positive actual rank, so the process terminates. This also proves termination when replacing a forbidden edge by a different one. The special cohook sequences have strictly decreasing parameters $m$, by two or by one, respectively. There is at most one such sequence of each kind per packet: once the exceptional pattern is reached its own rule continues to the stopping threshold. Exact moves between any other stages have permutation matrices after normalization.

Number the basic-coordinate spaces at the starting collection, the end of the full-space stage, and the final endpoint by $0 \, 1 \, 2$, and write $n_j$ for their respective dimensions. Reversing the extractions gives the normalized induction maps

$ bb(R)^(n_2) arrow.r^(med A med) bb(R)^(n_1) arrow.r^(med T med) bb(R)^(n_0) . $

Bounds will return along these arrows. The full-space map $T$ will be controlled by its condition number. The map $A$ can annihilate split-pair differences. Its bounded entries and denominators, together with its image containing the vector of ordinary character degrees, will instead control the PIM columns at stage $1$.

#thm([Lemma 6.10.])[
  #emph[The normalized ordinary-coordinate induction from the endpoint of the full-space stage to its starting point is invertible, with uniformly bounded condition number.]
] <run:condition>

#proof[
  Normalize an exact move by its factorial. Normalize a cohook-$1$ move in the same way, and a cohook-$2$ move by $m ! \( m - 1 \) ! \( 1 - 1 \/ m \)$. Every matrix is then a permutation plus an error of norm $epsilon_m$, where the sums of all errors are bounded uniformly: they are bounded by a constant times $sum_(m gt.eq m_(*)) 2^(- m \/ 2)$ or $sum_(m gt.eq m_(*)) m^(- 2)$, where $m_(*)$ is the stopping cutoff. Take $m_(*)$ large enough that every $epsilon_m < 1 \/ 2$. The singular values of a permutation plus that error lie between $1 - epsilon_m$ and $1 + epsilon_m$. Consequently the condition number of the product is at most
  $ product_m frac(1 + epsilon_m, 1 - epsilon_m) lt.eq exp #h(-0.16667em) (4 sum_m epsilon_m) . $
  The bounded number of packets gives a uniform bound. ◻
]

Here is the precise linear algebra that converts these maps to bounds on projective characters. It is useful that a scalar normalization, however small, preserves projective positivity.

#thm([Lemma 6.11.])[
  #emph[Let $V_(-) \, V_(+)$ be nonnegative integral square invertible matrices of bounded size, with $\| det V_(+) \| lt.eq Delta$, and suppose the entries of $V_(-)$ are bounded.]
  #emph[If an invertible map $T$ of bounded condition number sends the cone generated by the columns of $V_(-)$ into the cone generated by those of $V_(+)$, the entries of $V_(+)$ are bounded.]
  #emph[Alternatively let $A$, possibly rectangular, have bounded rational entries with a common bounded denominator. Suppose 
$ V_(+)^(- 1) A V_(-) gt.eq 0 $

 entrywise, and the image of $A$ contains a vector $V_(+) d$ with every coordinate of $d$ strictly positive. Then the entries of $V_(+)$ are bounded.]
] <run:cone-transfer>

#proof[
  Write $cal(C)_plus.minus$ for the two cones. There are only finitely many possible bounded integral matrices $V_(-)$ in each of the bounded dimensions. Thus the volume of $cal(C)_(-)$ in the unit ball has a positive uniform lower bound. Rescale $T$ so its largest singular value is one. If its condition number is at most $kappa$, its determinant in absolute value is at least $kappa^(- n)$. Its image of this part of $cal(C)_(-)$ lies in $cal(C)_(+)$ and in the unit ball. The corresponding volume for $cal(C)_(+)$ therefore also has a positive uniform lower bound. Since all coordinates in the latter cone are nonnegative, its cut by $sum x_i lt.eq 1$ has a positive uniform volume lower bound as well.
  If $s_j$ is the coordinate sum of column $j$ of $V_(+)$, the linear change of variables $x = V_(+) t$ gives exactly
  $ "vol" { x in cal(C)_(+) : sum_i x_i lt.eq 1 } = frac(\| det V_(+) \|, n ! product_j s_j) . $
  Every $s_j$ is a positive integer. The upper bound $Delta$ for the numerator bounds their product and hence each $s_j$, proving the first assertion.
  For the second, put $M_0 = V_(+)^(- 1) A V_(-)$. Because $V_(-)$ is invertible, its image is $V_(+)^(- 1) "im" A$, which contains $d$. No row of $M_0$ can therefore be zero. Nonnegativity makes every entry of $lambda = M_0 upright(bold(1))$ positive. If $Q$ is a common denominator for $A$, Cramer’s rule shows that the denominator of each entry of $lambda$ divides $Q det V_(+)$. In particular $lambda_j gt.eq 1 \/ \( Q Delta \)$. The vector $y = A V_(-) upright(bold(1))$ has bounded entries, and
  $ y = V_(+) lambda $
  is a nonnegative combination of every column of $V_(+)$ with these uniformly positive coefficients. It bounds each column entry, proving the claim. ◻
]

Apply the second assertion first, to transfer a bound from the end of the symmetric stage to its beginning. Its matrix $A$ is the one in Lemma 39. Its image contains the vector of ordinary degrees on the basic rows, since those degrees agree on split signs by Proposition 24. This vector is the projection of the regular character and equals $V_(+) d$, where $d$ lists the positive dimensions of the simple modules. Thus all hypotheses of the second assertion hold. The bounded determinant is supplied by Lemma 35; no bound on $V_(+)^(- 1)$ is assumed.

Next apply the first assertion to the full-space stage, using Lemma 42. Projective positivity gives the required inclusion of cones. Thus a bound at the final endpoint gives a bound at the original core collection. Lemma 3 then gives the full projective-character and Cartan bounds. These arguments require no equivalence of module categories associated to a runner move.

=== 6.6 The endpoint and its triangle series <the-endpoint-and-its-triangle-series>

At the stopping point, every positive edge difference is bounded. On each directed cycle the sum of differences is its fixed period offset, with a minus sign. A lower bound for each difference follows by summing the upper bounds for the others. Thus all thresholds in a cycle have bounded spread.

If the runner graph has a single cycle, fixed total charge then bounds every threshold. The packed configurations have bounded rank, and the bounded runner weights give bounded rank for every endpoint label. This applies to $"GL"$, to $"GU"$ with $e$ odd, and to cohook symbols. In the regular classical case the packets are all of the same hook or cohook kind, because their $q_i$’s agree. The accumulated frozen factors split off by Lemma 22. The remaining root data belong to a finite set by Lemma 19: restricting the regular lattice after extraction retains its uniform bounded-denominator coordinate description, now in bounded dimension. The geometric theorem applies to that finite set, while every frozen block is of defect zero.

There are two remaining graphs. If $e = 2 d$ in $"GU"$, the step-two graph has separate parity cycles. In the hook symbol case there is one cycle in each physical row. Their mean thresholds can differ without bound. This difference records precisely the ordinary cuspidal triangle: the $2$-core staircase of a unitary partition, or the symbol obtained by packing its two rows separately at step one, taken up to row exchange in type $D$.

#thm([Lemma 6.12.])[
  #emph[At these two-cycle endpoints the number $m_i$ of ordinary split Harish–Chandra rank-one steps above the triangle in each packet is uniformly bounded. The complete collection at this triangle and this $m_i$ is a union of the core block projections of Proposition 32. It has boundedly many basic rows and bounded block defects, independently of the triangle ranks.]
] <run:triangle-endpoint>

#proof[
  Consider one physical row in the hook case, or one parity of positions in the unitary case. Translate all its runner thresholds by a common integer until one is zero. This translation does not affect the number of inversions for the ordinary step, which is one or two respectively. Bounded spread and Lemma 34 put every deviation from a fully packed row or parity inside an interval of bounded length. Outside that interval all lower positions are occupied and all upper positions empty. Every inversion has both ends in the interval, so their number is bounded by the square of its length. Summing over the two rows or parities bounds $m_i$. Packing at the ordinary step is exactly removal to the ordinary cuspidal triangle, so this inversion count is its ordinary Harish–Chandra weight.
  A same-row $d$-hook preserves the row lengths of a symbol and hence its triangle. An $e$-hook in the unitary case has even length and preserves its $2$-core. Thus a whole relevant core class lies in one triangle series. At the fixed ambient packet rank, $m_i$ is determined by that triangle; enlarging to all labels with these data merges complete core classes and is therefore still a projection onto a union of blocks.
  The ordinary branching parametrizes these labels by partitions or bipartitions of the bounded integers $m_i$, with the stated split signs in type $D$. Their number is bounded independently of the triangle. Every contributing relevant inversion is an ordinary-step inversion, so there are at most $m_i$, and its distance in units of the relevant step is at most $m_i$. The already bounded basic cyclotomic $p$-part and lifting the exponent bound all their degree defects. The central $p$-order is bounded as in Lemma 35. Applying the integral-basic-set criterion once more bounds the defects of every block in this enlarged collection. ◻
]

#proof[
  Choose the core collection containing the basic rows of the starting block. It is a union of blocks by Proposition 32. Lemma 35 handles total weight zero directly and supplies all uniform defect and dimension bounds otherwise. The terminating runner process and the two forms of Lemma 43 reduce the problem to the endpoints just described. A single-cycle endpoint is covered by Theorem 6 and the finite-root-data argument above.
  The remaining endpoint in Lemma 44 is exactly the endpoint of Proposition 45. In the unitary case its notation is $Q_i = q^2$, $d = "ord"_p \( Q_i \)$, $e = "ord"_p \( - q \) = 2 d$; in the hook classical case it is $Q_i = q_i$, $d = "ord"_p \( Q_i \)$ odd. The frozen factors can either be retained in their defect-zero blocks or removed using the Levi product. The endpoint proposition supplies the remaining uniform bound. A Cartan bound bounds every projected decomposition entry, since a Cartan diagonal entry is the sum of the squares of the corresponding full column. The two transfers proved above carry it back through all runner moves, and Lemma 3 supplies the Cartan bound. For a central quotient we finally use Lemma 2; the weight-zero case was already treated directly in the quotient. This proves Proposition 33. ◻
]

== 7 The cuspidal triangle endpoint <sec:endpoint>

We complete the Cartan estimate at the endpoints of Proposition 33. The ordinary cuspidal rank may still be arbitrarily large there. The number of split Harish–Chandra steps above the cuspidal label is bounded, and this is the rank that will enter the endomorphism algebras below. We construct enough modular cuspidal pairs to exhaust the simple modules of the endpoint blocks, and then cover their projective indecomposable modules by bounded projective inductions.

The use of intertwining operators and Hecke endomorphism algebras follows the Harish–Chandra theory of Howlett–Lehrer [42] and its modular developments [22,21]. We give the particular cuspidal, extension and exhaustion arguments required here.

Throughout this section, $p$ is odd and different from the defining characteristic $r$, and $k = overline(bb(F))_p$. We retain the regular ambient groups, marked semisimple $p'$-parameter $s$, and actual Levi product decompositions of the preceding sections. Write $G = upright(bold(G))^F$ and $upright(bold(C)) = C_(upright(bold(G))^(*)) \( s \)$. A packet means a Frobenius orbit of classical factors of this connected centralizer on which the labels vary. We calculate on one representative factor with the composite endomorphism around the orbit. Index the packets by $i$. Their parameters satisfy one of the following two conditions:

#[#set math.equation(numbering: n => "(7.1)")
 $ upright("orthogonal or symplectic:") & Q_i = q_i \, quad d_i = "ord"_p \( Q_i \) upright(" is odd") \;\
upright("unitary:") & Q_i = q^2 \, quad d_i = "ord"_p \( Q_i \) \, quad "ord"_p \( - q \) = 2 d_i . $ <end:linear-primes>]

There is no assertion that $d_i$ is odd in the unitary case. On each packet fix an ordinary cuspidal triangle: a separately packed symbol in types $B \, C \, D$, or the staircase $t \( t + 1 \) \/ 2$ in unitary type. Let $m_i$ be the number of ordinary split Harish–Chandra steps above it. The collection $cal(T)$ consists of all the ordinary rows at $s$ with these triangle data and these $m_i$. Frozen factors carry their prescribed single cuspidal row and are left implicit.

For a type $D$ packet, zero difference between the two row lengths means split type and an empty residual triangle. We call this the #emph[even-sign case]. A nonempty type $D$ triangle has its unique cuspidal label, also when its rank is one and its form is nonsplit. At rank zero there is one label; in particular, the empty equal pair is not doubled. Equal nonempty pairs in split type $D$ retain their two distinct labels.

#thm([Proposition 7.1.])[
  (Triangle Cartan bound).  #emph[In the endpoint situation of Proposition 33, the Cartan entries of the blocks whose basic rows belong to $cal(T)$ are bounded in terms of $p$ and the original defect-order bound $M$. More explicitly, the conclusion is uniform whenever the number of packets, $sum_i m_i$, the orders of the central $p$-subgroups retained in the residual factors, and $p^(v_p \( Q_i^(d_i) - 1 \))$ for the packets with $m_i > 0$ are bounded. The bound is independent of the ranks of the triangles and of $q$.]
] <prop:triangle-cartan>

The hypotheses listed in the second sentence are provided by Proposition 33. That proposition and Proposition 32 also show that $cal(T)$ is the restriction of an integral basic set to a union of blocks of bounded defect orders. Both its cardinality and the number of ordinary rows in this block union are bounded. We will use these facts only at the exhaustion and norm steps. The modular Harish–Chandra calculation is proved directly below.

=== 7.1 Residual and general linear cuspidal modules <residual-and-general-linear-cuspidal-modules>

For each packet set

#[#set math.equation(numbering: n => "(7.2)")
 $ cal(B)_i = { 1 } union { d_i p^a : a gt.eq 0 } . $ <end:sizes>]

The sizes $d_i p^a$ arise as Frobenius orbit degrees of regular $p$-power eigenvalues over $bb(F)_(Q_i)$. They will give ordinary cuspidal lifts on the linear factors; size $1$ also allows the original $p'$-parameter with no added $p$-part. This is a set: when $d_i = 1$, size $1$ occurs only once. Choose nonnegative integers $r_(i \, b)$ such that

#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(b in cal(B)_i) b r_(i \, b) = m_i . $ <end:size-sum>]

Partition the $m_i$ hyperbolic coordinates into these chunks. In $upright(bold(C))$ they define a split Levi with the residual triangle factors and linear factors $"GL"_b \( Q_i \)$. Centralizing the same split torus directions in $upright(bold(G))^(*)$ gives a rational split Levi $upright(bold(L))^(*)$ with

$ C_(upright(bold(L))^(*)) \( s \) = upright(bold(C))_L . $

Write $L = upright(bold(L))^F$ for its dual Levi. The actual product description from Section 4 identifies its varying factors with a residual group $H_0$ and general linear groups $"GL"_(delta_i b) \( q \)$ in the orthogonal and symplectic cases, where $delta_i in { 1 \, 2 }$ and $Q_i = q^(delta_i)$, or $"GL"_b \( q^2 \)$ in the unitary case. On the former factor $s$ has one $p'$-eigenvalue orbit $f_i$ of degree $delta_i$, repeated $b$ times. On the latter factor it is the identity.

We record the split-center observation needed for these Levis. The connected centralizer of the residual parameter has no split central direction outside the ambient center. A nonempty classical triangle retains its full sign root system; the rank-one type $D$ exception is a nonsplit torus and has no such split direction either. On a frozen linear factor with a regular torus parameter, the split center of its centralizer is the split center of that ambient factor. Consequently the split center of $upright(bold(C))_L$, modulo ambient central directions, consists exactly of the chunk directions. It has the same centralizer as the split center of $upright(bold(L))^(*)$. These assertions are statements about the rational cocharacter spaces, so they are unaffected by the bounded central lattice dressing. All ensuing Levi conjugacies and Weyl positions are rational.

#thm([Lemma 7.2.])[
  (The residual module).  #emph[Let $chi_0 in "Irr" \( H_0 \)$ have parameter $s$ and the indicated cuspidal unipotent Jordan labels. It is ordinary Harish–Chandra cuspidal. It is trivial on $Z_0 = O_p \( Z \( H_0 \) \)$, and its character of $H_0 \/ Z_0$ has defect zero. Its reduction $X_0$ is therefore simple and Harish–Chandra cuspidal. The block containing $X_0$ has bounded Cartan data, and its only basic row at the residual parameter is $chi_0$.]
] <end:residual>

#proof[
  Consider a proper rational split Levi of $H_0$ whose dual contains a conjugate of the parameter. Its intersection with the connected centralizer is proper: otherwise its extra split central direction would contradict the split-center observation. Torus transitivity and the ordinary Jordan torus pairing used in Proposition 28 identify the uniform projection of the adjoint character there with the adjoint of the unipotent cuspidal label. The latter is zero. Apply this separately to every Levi parameter mapping to $s$. In each such series the degree vector belongs to the span of the torus tests, by the regular-character formula. The adjoint split Harish–Chandra character is an actual character with nonnegative multiplicities; zero pairing with its degree vector forces it to vanish. This proves ordinary cuspidality. No bound on the number or lengths of the torus tests is needed here.
  The hook and cohook degree formula of Proposition 24 gives the defect assertion. A separately packed triangle has no positive hooks. Its cohook factors have the form $Q_i^j + 1$, whose $p$-parts are trivial because $Q_i$ has odd order modulo the odd prime $p$. The nonsplit rank-one type $D$ torus contributes $Q_i + 1$, also of order prime to $p$. This accounts for the possible extra direction in the full residual center: a rank-one orthogonal residual triangle is nonsplit, so adjoining its torus does not enlarge the inherited central $p$-subgroup. The inherited-torus degree formula therefore leaves the order of the full group $Z_0 = O_p \( Z \( H_0 \) \)$. Every hook length of a staircase is odd, whereas $p divides \( \( - q \)^j - 1 \)$ requires $2 d_i divides j$. Thus no noncentral $p$-part remains in the character defect. The order and degree formulas for the regular ambient group leave precisely $\| Z_0 \|$. The central character attached to the $p'$-parameter is trivial on $Z_0$, so passage to $H_0 \/ Z_0$ is literal and gives defect zero.
  A defect-zero ordinary character reduces to a simple projective module. Inflation from the central $p$-quotient gives the simple module $X_0$, and the central transfer of Lemma 2 bounds its block’s Cartan data in terms of $\| Z_0 \|$. Exactness of split Harish–Chandra restriction, which is averaging over groups of order prime to $p$, proves the cuspidality of $X_0$. Finally, every basic row in this block at the specified $p'$-parameter is trivial on $Z_0$. Downstairs it must lie in the same one-row defect-zero block, and hence equals $chi_0$. ◻
]

#thm([Lemma 7.3.])[
  (Cuspidal modules on the chunks).  #emph[For every $b in cal(B)_i$ there is a simple cuspidal module $Y_(i \, b)$ on the corresponding actual general linear factor with the following properties.]
  + #emph[It is the reduction of an ordinary cuspidal character whose semisimple parameter is the product of the prescribed $p'$-orbit and a $p$-element regular of degree $b$ over $bb(F)_(Q_i)$; for $b = 1$ the added $p$-part may be trivial.]
  + #emph[In the integral basic set of partition rows of the original $p'$-series, its Brauer character is the signed power sum of degree $b$. In particular, it is independent of the choice of regular $p$-part.]
  + #emph[The ordinary partition row corresponding to the Steinberg character on the unipotent side, called the regular extreme, contains $Y_(i \, b)$ with multiplicity one in its reduction. This extreme is stable under the packet transports and orientation reversals.]
] <end:linear-cuspidals>

#proof[
  Put $d = d_i$, $Q = Q_i$, and $c = v_p \( Q^d - 1 \)$. Since $p$ is odd, lifting the exponent gives
  $ "ord"_(p^(c + a)) \( Q \) = d p^a #h(2em) \( a gt.eq 0 \) . $
  For $b = d p^a > 1$, an element $mu$ of order $p^(c + a)$ therefore has Frobenius orbit of length $b$ over $bb(F)_Q$. If the original orbit has degree $delta = 2$, its product with $mu$ has degree $2 b$ over $bb(F)_q$. Indeed its $p'$- and $p$-parts can be recovered separately, so its orbit length is the least common multiple of their orbit lengths. The orbit length of $mu$ over $bb(F)_q$ is either $2 b$, or $b$ with $b$ odd, and either possibility gives least common multiple $2 b$ with $2$. The case $delta = 1$ is immediate. The resulting torus parameter is in general position, so Green’s ordinary general linear theory gives its irreducible cuspidal character. For $b = 1$ use the ordinary cuspidal character of the original orbit.
  Write $s_lambda$ for the partition row with label $lambda$, and $p_b$ for the degree-$b$ power sum under Green’s characteristic map. The general linear torus rule and equality of torus characters on $p$-regular elements give
  #[#set math.equation(numbering: n => "(7.4)")
   $ \[ overline(psi)_(i \, b) \] = epsilon_b p_b = epsilon_b sum_(lambda tack.r b) chi^lambda \( \( b \) \) \[ overline(s_lambda) \] \, #h(2em) epsilon_b in { 1 \, - 1 } . $ <end:power-sum>]
  Here $epsilon_b$ is the sign making the degree positive; in degree one this is the single partition row. The statements used from Green’s theory are the ordinary Coxeter-torus cuspidality, this torus-character formula, and the identification of split restriction with the symmetric-function coproduct [37]. For precise forms over the actual general linear factors, see [16] Property (2.3a) and Lemma 2.3c for the power-sum identity on all $p$-regular classes, and [16] Equations (2.2a), (2.3f) and Lemma 2.2d for induction and its adjoint restriction coproduct.
  We give the irreducibility argument, since it avoids a modular cuspidal classification. Every composition factor $Y$ of $overline(psi)_(i \, b)$ has zero proper split restriction, by exactness and ordinary cuspidality. Express $\[ Y \]$ integrally in the partition basic set. Its coproduct in every positive splitting $b = b_1 + b_2$ is zero, using the corresponding orbit-preserving Levi and Green’s restriction rule. The primitive subspace of degree $b$ in the rational symmetric-function Hopf algebra is $bb(Q) p_b$: indeed that algebra is the polynomial algebra on the primitive generators $p_j$, and the reduced coproduct of a polynomial of polynomial degree at least two is nonzero in characteristic zero. The coefficient of an extreme Schur function in $p_b$ is $1$ or $- 1$, so $p_b$ is indivisible in the integral Schur lattice. Thus $\[ Y \] = n_Y epsilon_b p_b$ for an integer $n_Y$. Evaluation at the identity shows $n_Y > 0$. Formula (7.4), including composition multiplicities, now gives $sum_Y \[ overline(psi)_(i \, b) : Y \] n_Y = 1$. There is exactly one factor, with multiplicity one.
  For the extreme row, use the ordinary multiplicity-free Gelfand–Graev formula for a general linear group [16] Theorem 2.5d(ii), (iv), (v). Its Gelfand–Graev character $Gamma$ contains the regular Coxeter-torus row $psi_(i \, b)$ once; among the partition rows at the original parameter it contains only the regular extreme, namely the row corresponding to Steinberg on the unipotent side, also once. The Gelfand–Graev module is projective in characteristic $p$, since it is induced from a linear character of a defining-characteristic unipotent subgroup. Let $P_Y$ be the projective cover of $Y_(i \, b)$. Brauer reciprocity and the irreducible reduction of $psi_(i \, b)$ show that $P_Y$ occurs once in this projective module. Some basic partition row has a nonzero decomposition number for $Y_(i \, b)$, because those rows span the Brauer lattice. Nonnegativity then forces that row to be the regular extreme and forces its decomposition number to be one. The extreme partition is carried to the same extreme under all the relevant duality and field transports. This proves the last assertion. ◻
]

Form the simple cuspidal $L$-module

#[#set math.equation(numbering: n => "(7.5)")
 $ rho = X_0 ⊗ ⨂_(i \, b) Y_(i \, b)^(⊗ r_(i \, b)) \, $ <end:rho>]

with the fixed cuspidal factors understood. It has ordinary cuspidal lifts $psi^u$ with parameter $s u$. We may prescribe the $p$-parts independently on the hyperbolic chunk coordinates of $upright(bold(C))_L$. In the orthogonal and symplectic ambient groups the central and coordinate lattice gluing has only powers of $2$ as denominators and indices, hence is an isomorphism on $p$-power torus data. These prescriptions therefore give genuine rational torus points. Their projection to the residual factor can only give a central $p$-power twist of $chi_0$, which does not change $X_0$. The same construction in the unitary case is direct.

In normalizer notation below we always retain the algebraic Levi: $N_G \( upright(bold(L)) \, rho \)$ denotes the stabilizer of $rho$ in $N_(upright(bold(G))) \( upright(bold(L)) \)^F$. This convention is relevant in small fields, where the abstract normalizer of the finite group $L$ need not determine the algebraic Levi.

#thm([Lemma 7.4.])[
  (Inertia).  #emph[The stabilizer quotient $W_rho = N_G \( upright(bold(L)) \, rho \) \/ L$ is the relative rational Weyl group of $upright(bold(C))_L$ in $upright(bold(C))$. On a packet outside the even-sign case its factor is $product_b W \( B_(r_(i \, b)) \)$. On an even-sign packet it is 
#[#set math.equation(numbering: n => "(7.6)")
 $ {\( w_b \)_b in product_b W \( B_(r_(i \, b)) \) : sum_b "flip" \( w_b \) = 0 med \( mod med 2 \)} \, $ <end:total-parity>]

 where $"flip"$ is the parity of the number of changed coordinate signs. Different choices of the size multiplicities $r_(i \, b)$ give nonconjugate cuspidal pairs.]
] <end:inertia>

#proof[
  Relative normalizers on the group and dual group are identified by their rational Weyl positions; Lang’s theorem supplies rational representatives. An element preserving $rho$ must preserve its marked $p'$-series in $L$. After adjustment by $upright(bold(L))^(* F)$, its dual representative centralizes $s$ and hence belongs to $upright(bold(C))^F$. Conversely a rational normalizer of $upright(bold(C))_L$ in $upright(bold(C))$ preserves $upright(bold(L))^(*)$ by the split-center description. It preserves the residual cusp label and the power sums in (7.4); hence it fixes the Brauer character of $rho$. The ordinary label transports here are exactly the uniform and single-cycle transports of Proposition 28.
  In the hyperbolic coordinates, the resulting operations permute chunks of equal size and reverse their orientations. In an even orthogonal factor a reversal of a chunk of size $b$ has coordinate sign parity $b$. All permitted sizes on that packet are odd, since $d_i$ and $p$ are odd. If the residual triangle is empty, the condition is therefore the total parity in (7.6). It is a condition across all sizes, not one condition for each size. If the residual triangle is nonempty, a single reversal can be compensated on it. Its unique cusp label is unchanged, including in the nonsplit rank-one case. These coordinate operations are Frobenius invariant and admit the rational representatives just described. No inner transporter in the connected centralizer exchanges different eigenvalue packets. Finally, the same transporter test preserves the multiset of chunk sizes, proving nonconjugacy of the different displayed pairs. ◻
]

=== 7.2 Cuspidal induction and its heads <cuspidal-induction-and-its-heads>

The inducing modules and their inertia quotients are now explicit. Before calculating the induction endomorphism algebras, we explain what their simple types count. Cuspidal Mackey theory identifies them with the distinct simple modules in the heads of the induced modules. It also separates the heads attached to our nonconjugate cuspidal pairs.

The Mackey calculation applies over $k$ or over a splitting field of characteristic zero. Write $R_L^G$ and $zws^(*) R_L^G$ for split Harish–Chandra induction and restriction. They are exact biadjoint functors. In the split Mackey formula, a double-parabolic coset contributes restriction to an intersection Levi followed by induction from it. One obtains this formula by projecting the parabolic intersection to its two Levi quotients and averaging over the intersection unipotent groups. Their orders are powers of $r$ and hence invertible in either coefficient field. With cuspidal coefficients, proper intersection-Levi terms vanish. Consequently

#[#set math.equation(numbering: n => "(7.7)")
 $ zws^(*) R_L^G R_L^G \( rho \) upright(" is a direct sum of conjugate simple ") L upright("-modules") \, #h(2em) dim "End"_G \( R_L^G rho \) = \| W_rho \| . $ <end:mackey>]

Each normalizing Mackey position supplies a one-dimensional intertwiner space.

#thm([Lemma 7.5.])[
  (The head of cuspidal induction).  #emph[Let $rho$ be a cuspidal simple $L$-module and put $V = R_L^G rho$, $H = V \/ "rad" V$. Under the cuspidal Mackey formula (7.7), the map 
$ "End"_G \( V \) arrow.r "End"_G \( H \) $

 is surjective with nilpotent kernel. Its simple algebra types therefore correspond to the distinct simple modules in $H$. Every simple quotient of $V$ is also a submodule of $V$. Heads arising from nonconjugate cuspidal pairs have no common simple constituent.]
] <end:head>

#proof[
  Write $E = zws^(*) R_L^G$, and let $pi : V arrow.r H$ be the quotient. Exactness gives a surjection $E pi : E V arrow.r E H$. The source is semisimple by (7.7), so this surjection splits. Given $f in "End"_G \( H \)$, adjunction converts $f pi : V arrow.r H$ into a map $rho arrow.r E H$, which lifts to $rho arrow.r E V$. Adjunction back supplies $g in "End"_G \( V \)$ with $pi g = f pi$. This proves surjectivity.
  Put $J = "rad" \( k G \)$ and let $I$ be the kernel. For $g in I$, $g \( V \) subset.eq J V$. Since $g$ is $k G$-linear, $g \( J^a V \) subset.eq J^(a + 1) V$. Thus a product of $n$ elements of $I$ maps $V$ into $J^n V$, which is zero for large $n$. The kernel is nilpotent. Since $H$ is semisimple, its endomorphism algebra is a product of full matrix algebras, one per distinct simple constituent, giving the first conclusion.
  If $S$ is a simple quotient of $V$, then $E S$ is a semisimple quotient of $E V$. Adjunction provides $rho arrow.r.hook E S$, hence also $E S arrow.r.twohead rho$ by semisimplicity. The other adjunction gives a nonzero map $S arrow.r V$, which is an embedding. If $S$ belongs to two such heads, composing a surjection from one induced module with its embedding into the other gives a nonzero homomorphism between the inductions. The split Mackey formula and cuspidality force the two pairs to be conjugate. This proves disjointness. ◻
]

The pairs of Lemma 48 therefore give disjoint heads. To prove that these heads exhaust the endpoint simples, we will count their endomorphism-algebra types and show that the induced modules are supported on the block union of $cal(T)$. The latter support assertion will be checked when the count is complete. We now determine the algebras whose simple types must be counted.

=== 7.3 Chamber operators and removal of the scalar cocycle <chamber-operators-and-removal-of-the-scalar-cocycle>

We calculate chamber operators and then extend the inducing module to its inertia group to remove the scalar ambiguity in their coefficient transports. The operator calculation works over either $k$ or a splitting field of characteristic zero.

Parabolics with Levi $upright(bold(L))$ are chambers on its split central cocharacter space. On the chunk coordinates their walls are among $x_j = x_h$, $x_j = - x_h$, and $x_j = 0$. Add missing walls as dummy walls so that the full signed-permutation arrangement is available. Ambient central coordinates play no role. If $U$ is the group of rational points of a chamber’s unipotent radical, put

$ e_U = \| U \|^(- 1) sum_(u in U) u \, #h(2em) cal(M)_U = k G e_U ⊗_(k L) rho . $

Choose a square root of $r$ and use its powers for all the following normalizations. Right multiplication by $e_V$ defines the normalized change map

#[#set math.equation(numbering: n => "(7.8)")
 $ I_(U \, V) : cal(M)_U arrow.r cal(M)_V \, #h(2em) x e_U ⊗ v mapsto (frac(\| V \|, \| V ∩ U \|))^(1 \/ 2) x e_U e_V ⊗ v . $ <end:average>]

It is well defined because $L$ normalizes both radicals. The same formula is used in characteristic zero.

#thm([Lemma 7.6.])[
  (Averaging relations).  #emph[Normalized changes along a minimal full gallery compose to the direct map (7.8). At an adjacent wall the reverse composition is invertible. If no inertial reflection fixes that wall it is the identity. Otherwise, after completing the change by an involutively normalized coefficient transport for the reflection $a$, the resulting endomorphism satisfies 
#[#set math.equation(numbering: n => "(7.9)")
 $ T_a^2 = 1 + alpha_a T_a . $ <end:quadratic>]

 In particular $T_a^(- 1) = T_a - alpha_a$.]
] <end:averaging>

#proof[
  Let $V$ be an intermediate radical on a minimal gallery from $U$ to $U'$. A root cannot cross its hyperplane twice on that gallery. Thus the roots positive in $V$ are covered by those positive also in $U$ or also in $U'$. Set $A = V ∩ U$ and $B = V ∩ U'$. Root group order counting, including the overlap, gives $\| A \| \| B \| \/ \| A ∩ B \| = \| V \|$. Since $A \, B lt.eq V$, this proves $A B = V$ as sets and $e_V = e_A e_B$. It follows that
  $ e_U e_V e_(U') = e_U e_A e_B e_(U') = e_U e_(U') . $
  This uses absorption of $e_A$ on the left and of $e_B$ on the right, not commutation of arbitrary averaging idempotents. The separating root sets are disjoint along a minimal gallery, so the exponents in the square-root normalizations add. This proves the first assertion.
  At a wall, first remove the common outer radical by transitivity. Inside the Levi centralizing a generic point of the wall, the two remaining radicals are opposite. The coefficient of the identity Mackey position in their reverse composition is $1$: an element of the opposite radical contributes back to the identity parabolic coset only if it is the identity, and the reciprocal radical order is cancelled by the two normalizing factors. If the wall has no inertial reflection, the identity is the only surviving Mackey position and gives the asserted inverse.
  In the other case choose a representative $n_a$ and a coefficient intertwiner whose square is the action of $n_a^2 in L$. Such a normalization is possible over a splitting algebraically closed field by rescaling the intertwiner. It is chosen for each reflection separately and does not assume an extension to the full inertia group. The square of the coefficient transport cancels right translation by $n_a^(- 2)$. Right translation together with that intertwiner completes the change to $T_a$. Coefficient transports commute covariantly with uncompleted averages. Its square is therefore the reverse composition. Rank-one Mackey has only the identity and reflection positions. The reflection position is nonzero: at its representative, the contributing terms are precisely the intersection unipotents and carry the same intertwiner. The identity $U ∩ zws^(n_a) \( L U \) = U ∩ zws^(n_a) U$, obtained from the root groups of the common Levi, verifies this directly. The normalized identity coefficient is $1$, proving (7.9). ◻
]

Let $W_(upright(r))$ be the reflection subgroup of $W_rho$. It is a product of the indicated type $B$ groups, with $product_b W \( D_(r_(i \, b)) \)$ on an even-sign packet. Use $W \( D_1 \) = 1$, $W \( D_2 \) = C_2 times C_2$, and $W \( D_0 \) = 1$. The subgroup $W_(upright(c))$ preserving a chosen chamber of $W_(upright(r))$ is a complement. On an even-sign packet it consists of even products of the extra single-coordinate flips for the nonempty size factors. In particular $W_rho = W_(upright(r)) times.r W_(upright(c))$.

#thm([Lemma 7.7.])[
  (The presentation with strict transports).  #emph[Suppose the inducing simple module extends to its inertia group. Then $"End"_G \( R_L^G rho \)$, or its opposite according to the action convention, has the Hecke presentation of $W_(upright(r))$ with the quadratic relations (7.9), together with the ordinary complement $W_(upright(c))$ acting on those generators by conjugation. It has a basis indexed by $W_rho$. The scalars $alpha_a$ agree for simple reflections joined by an odd Coxeter bond and for generators conjugate under $W_(upright(c))$.]
] <end:presentation>

#proof[
  The extension supplies coefficient transports satisfying the group law, with the prescribed Levi action on inner representatives. For a gallery which crosses each reflecting hyperplane of $W_(upright(r))$ at most once, use the gallery word theorem in the full signed arrangement. Braid moves preserve the change operator by the minimal-gallery identity in Lemma 50. A deletion cannot concern a repeated reflecting hyperplane, so it is a pair of inverse changes at a noninertial wall. Thus the completed operator for a reduced gallery in the reflection arrangement is its direct completed average, with no scalar ambiguity. This proves the braid and length-additive relations. To compute a simple reflection at the base chamber, move through noninertial walls to a chamber adjacent to its reflected chamber. The changes used are invertible; conjugating the rank-one calculation back gives (7.9).
  The direct averages also give the conjugation action of an element preserving the chamber. The operators so obtained have single, distinct nonzero Mackey supports indexed by $W_rho$. They are linearly independent and, by (7.7), span the endomorphism algebra. Finally the braid relations and invertibility identify the quadratics on conjugate simple generators, proving the parameter assertions. ◻
]

#thm([Lemma 7.8.])[
  (Extension of the inducing module).  #emph[Every module $rho$ in (7.5) extends to $N_G \( upright(bold(L)) \, rho \)$.]
] <end:extension>

#proof[
  We construct the extension in three stages. At the fine Levi, an ordinary multiplicity-one constituent removes the scalar cocycle. We then obtain an invariant ordinary constituent for the coarse Levi, whose multiplicity-one reduction supplies the required modular extension.
  Refine $upright(bold(L))$ to a Levi $upright(bold(L))'$ in which every chunk has size one. Let $psi'$ be the ordinary cuspidal row at $s$ there, using $chi_0$ and the size-one orbit rows. Its inertia quotient is a product of type $B$ groups and, on even-sign packets, one type $D$ group; it is a reflection group without the extra complement between sizes. Iterating the positive split single-cycle rule of Proposition 28 identifies its ordinary induction matrix with that of the ordinary unipotent triangle series in $upright(bold(C))$. The constituent corresponding to the trivial relative Weyl character has multiplicity one. This is an ordinary character assertion, prior to any modular endomorphism calculation.
  Work first over an algebraically closed characteristic-zero splitting field. The coefficient intertwiners of $psi'$ define a scalar central extension of its inertia quotient: pairs consisting of a normalizer element and an intertwiner are divided by the natural pairs supplied by $L'$. Normalize the lift of each simple reflection to be an involution in this extension. For two such lifts $tilde(a) \, tilde(b)$ with Coxeter bond $h$, the scalar
  $ c_(a b) = \( tilde(a) tilde(b) \)^h $
  is conjugate to its inverse by $tilde(a)$. Hence $c_(a b) = c_(a b)^(- 1)$ and $c_(a b) in { 1 \, - 1 }$. It is also, up to inversion, the multiplier between the two completed braid words. Indeed their underlying averages agree by Lemma 50; moving the coefficient transports to the end leaves precisely the two words in these lifts.
  On the multiplicity-one constituent of $R_(L')^G psi'$, every completed operator acts by a nonzero scalar. For an even bond the two braid words have the same number of each generator, so their scalar values coincide and $c_(a b) = 1$. For an odd bond, changing the sign of either generator changes the multiplier. The graph consisting of odd bonds in a classical Coxeter diagram is a forest. Choose signs successively along each tree to make all its multipliers $1$. This does not affect even bonds. The Coxeter presentation now gives a section of the scalar extension and therefore an ordinary extension of $psi'$ to its full inertia group. Empty factors and $D_1$ require no generators; $D_2$ has just the even commutation bond.
  We transfer this extension to the coarse Levi. Choose an $F$-stable parabolic $upright(bold(P))'_L$ of $upright(bold(L))$ with Levi $upright(bold(L))'$ by ordering the size-one subchunks inside each chunk, and put $P'_L = \( upright(bold(P))'_L \)^F$. Every element of $W_rho$ can be lifted to preserve $upright(bold(L))'$, $psi'$, and $upright(bold(P))'_L$: match subchunks in order for a positive transport and in reverse order with all signs changed for an orientation reversal. For $j < h$ the latter operation sends the positive linear root $e_j - e_h$ to $e_(b + 1 - h) - e_(b + 1 - j)$, still positive. The total type $D$ parity is preserved, or the same residual sign compensation is used. These are rational Weyl operations in $upright(bold(C))$ and give the primal normalizer operations through the corresponding split cocharacter positions.
  Let $A$ be the subgroup of $N_G \( upright(bold(L)) \, rho \)$ consisting of elements that normalize $upright(bold(L))'$ and $upright(bold(P))'_L$ and stabilize $psi'$. The preceding lifts show that $A$ maps onto $W_rho$, and the algebraic normalizer identities give
  $ A ∩ L lt.eq #scale(x: 120%, y: 120%)[\(] N_(upright(bold(L))) \( upright(bold(P))'_L \) ∩ N_(upright(bold(L))) \( upright(bold(L))' \) #scale(x: 120%, y: 120%)[\)]^F = L' . $
  The strict action of $A$ on $psi'$ and conjugation on the group-algebra factor extend $R_(L')^L psi'$ to $L A = N_G \( upright(bold(L)) \, rho \)$. On $A ∩ L$ this action is the natural inner action, so it agrees with the $L$-module structure. The ordinary constituent $theta$ obtained by choosing the regular extreme of Lemma 47 in every chunk and $chi_0$ on the residual factor occurs once, by ordinary general linear branching. It is invariant: matched chunks carry the same extreme and the residual cusp label is fixed. Its entire isotypic summand consequently inherits the extension.
  #emph[Passage to the modular module.] The extension of the ordinary constituent is now available. Its reduction contains $rho$ once, by Lemma 47 and the tensor product description. Reduce a stable lattice of the extended ordinary module and choose a simple composition factor whose restriction contains $rho$. Restriction of a simple module to a finite normal subgroup is semisimple: the translates of any simple submodule form a semisimple invariant sum, which is the entire module. Modular Clifford theory therefore makes this restriction a sum of conjugates of $rho$ with a common multiplicity. Here $rho$ is invariant, and its total multiplicity in the original reduction is one. The chosen factor restricts to $rho$ itself, and is the required extension. ◻
]

=== 7.4 Rank-one parameters and the number of simple modules <rank-one-parameters-and-the-number-of-simple-modules>

The extension lemma makes the presentation an untwisted one. We now calculate its parameters and count its simple types. The count must retain the single parity condition across all chunk sizes in the even-sign case; imposing parity separately at each size would give the wrong endpoint count.

For $v in k^times$, let $cal(H)_v \( frak(S)_n \)$ denote the type $A$ Hecke algebra with $\( T - v \) \( T + 1 \) = 0$. Its quantum characteristic is the least positive $e$ for which $1 + v + dots.h.c + v^(e - 1) = 0$, or infinity if there is no such $e$. Over $k$ it is $"ord" \( v \)$ when $v eq.not 1$ and $p$ when $v = 1$. Its simple modules are indexed by $e$-regular partitions, namely partitions in which no part occurs $e$ or more times [23]; see also [25] Section 5 and Theorem 5.1.

#thm([Lemma 7.9.])[
  (The necessary parameters).  #emph[After coherent rescaling of generators, the long parameter on chunks of size $b$ in packet $i$ is $v_(i \, b) = Q_i^b in k^times$. On a type $B$ factor the two roots $z_1 \, z_2$ of the short-generator quadratic satisfy 
#[#set math.equation(numbering: n => "(7.10)")
 $ z_1 \/ z_2 in.not chevron.l v_(i \, b) chevron.r . $ <end:separation>]

 For $b > 1$ the unrescaled short generator satisfies $T_0^2 = 1$. On an even-sign packet, adjoining the single-coordinate flips gives type $B$ factors with short generators of square $1$ and the same long parameters.]
] <end:parameters>

#proof[
  Compute in the rank-one enlargement of a reflecting wall. For a transposition of two equal-size chunks, choose the extra $p$-parts in an ordinary lift $psi^u$ to match on these chunks. For a negative transposition orient the two chunks consistently first. The merged actual general linear block then has centralizer $"GL"_2 \( Q_i^b \)$ on the matching full orbit. Its two ordinary induced constituents are the two Green partition rows, each with multiplicity one and with degree ratio $Q_i^b$, up to inversion; see [16] Equation (2.3.7). The remaining factors are unchanged.
  For a short wall with $b = 1$, take trivial added $p$-part on that chunk. The ordinary lift is invariant there. The split single-cycle rule, applied at $s u$ with all other added parts on inactive chunks, identifies the rank-one matrix with the first ordinary unipotent sign step above the residual triangle. By Proposition 24, its two degrees have ratio $Q_i^h$ for an integer $h$ in the orthogonal and symplectic cases, or $q^(2 t + 1)$ at a unitary staircase $t \( t + 1 \) \/ 2$, again up to inversion. Sign compensation on a residual type $D$ triangle fixes the same inducing row.
  The ordinary rank-one coefficient representation extends across the reflection after scalar normalization. Its completed operator has zero trace, since its support is the nonidentity double coset: in the induced-coset decomposition every diagonal block is zero. On the two multiplicity-one constituents, let its roots be $z_1 \, z_2$ and their degrees be $D_1 \, D_2$. Then $D_1 z_1 + D_2 z_2 = 0$, so the ratio of the roots is the negative degree ratio, up to inversion. Relation (7.9) also gives $z_1 z_2 = - 1$.
  Choose a lattice stable under the finite rank-one inertia group, enlarging the coefficient field to contain the square root of $r$ used in (7.8). The averaging denominators and normalization scalars are units, so the completed operator preserves the induced lattice. Its eigenvalues are integral and have product $- 1$, hence are units. Their sum $alpha_a$ is integral, so $T_a^(- 1) = T_a - alpha_a$ also preserves the lattice. The restriction of the coefficient lattice reduces irreducibly to $rho$, and its involutive transport reduces to our chosen one up to sign. Thus the same root ratios give the modular quadratic, even if its two long roots coincide.
  For a short wall with $b > 1$, instead choose the ordinary lift noninvariant at that wall. In the orthogonal and symplectic cases its regular $p$-element cannot be conjugate to its inverse: already modulo $p$, $- 1 in.not chevron.l Q_i chevron.r$, since the latter group has odd order. In the unitary case its paired transform would require $- q in chevron.l q^2 chevron.r$, which is excluded by $"ord"_p \( - q \) = 2 d_i$ and $"ord"_p \( q^2 \) = d_i$. To check the marking, choose the dual wall representative $n in upright(bold(C))^F$, so $n \( s \) = s$. Any conjugacy of $s u$ and $s n \( u \)$ in $upright(bold(L))^(* F)$ must match their $p'$-parts, forcing the conjugator into $upright(bold(C))_L^F$. Its active factor is $"GL"_b \( Q_i \)$; in a degree-two packet this is $"GL"_b \( q^2 \)$, so eigenvalue conjugacy uses $q^2$-powers. The preceding exclusion therefore applies in that case as well. The ordinary reverse composition of uncompleted averages is therefore the identity by rank-one Mackey. Reducing it and using the involutive modular transport gives $T_0^2 = 1$. Different walls may use different ordinary lifts; no simultaneous extension of these lifts is required.
  For $b = 1$ the short-root ratio is $- Q_i^h$ in the orthogonal and symplectic cases. It is outside $chevron.l Q_i chevron.r$ by odd order. In the unitary case the ratio is $- q^(2 t + 1) = \( - q \)^(2 t + 1)$, outside the subgroup of even powers $chevron.l q^2 chevron.r$. For $b > 1$, $d_i divides b$, so $v_(i \, b) = 1$ in $k$; the two short roots are opposite and distinct because $p$ is odd. This proves (7.10).
  The rescalings giving $\( T - v_(i \, b) \) \( T + 1 \) = 0$ can be chosen on conjugacy classes of simple generators by Lemma 51. This includes the two ends of $D_2$ when a complement interchanges them; otherwise they may be rescaled independently. Adjoining a single-coordinate flip to a type $D$ factor gives its standard type $B$ presentation with short generator of square $1$. In the empty-residual case this also follows directly from the coordinate signed permutation presentation. The convention is valid for $D_1 = 1$. ◻
]

We use the following specific separated-parameter theorem. If the cyclotomic Hecke algebra with type $A$ parameter $v$ has two short parameters $z_1 \, z_2$ and $v^a z_1 - z_2$ is a unit for every integer $a$ with $- n < a < n$, then it is Morita equivalent to

#[#set math.equation(numbering: n => "(7.11)")
 $ xor.big_(a = 0)^n cal(H)_v \( frak(S)_a \) ⊗ cal(H)_v \( frak(S)_(n - a) \) . $ <end:dm>]

This is the separated-parameter theorem of Du–Rui [25] Theorem 4.14, also the two-singleton case of [24] Theorem 1.1 and Corollary 1.4; its base ring can be a field of positive characteristic. Our parameters are nonzero, and (7.10) verifies its hypothesis for every integer $a$, uniformly in $n$.

#thm([Lemma 7.10.])[
  (Counting the even subalgebra).  #emph[For one even-sign packet with at least one chunk, the simple modules of its endomorphism algebra are indexed by the following rule. For every size $b$ choose an ordered pair of $e_b$-regular partitions of total size $r_(i \, b)$, where 
#[#set math.equation(numbering: n => "(7.12)")
 $ e_b = cases(delim: "{", d_i \, & b = 1 upright(" and ") d_i > 1 \,, p \, & upright("otherwise") .) $ <end:quantum-e>]

 Identify these choices under simultaneous exchange of the two components for all sizes. Each nonfixed orbit contributes one simple, and each fixed choice contributes two. If there are no chunks, there is one simple.]
] <end:even-algebra>

#proof[
  Let $cal(B)$ be the tensor product, over the nonempty sizes, of the type $B$ Hecke algebras with short generator of square $1$ from Lemma 53. Give every short generator odd degree and every long generator even degree. The algebra of our packet is the total-even subalgebra $cal(B)_0$. Indeed its reflection subgroup is the product of the type $D$ groups; its complement consists of even products of the extra flips, precisely as in (7.6).
  The separated equivalence (7.11) and the type $A$ simple module theorem label the simples of $cal(B)$ by the ordered pairs in the statement. Formula (7.12) follows because $Q_i$ has order $d_i$, while $Q_i^b = 1$ for all the other allowed sizes. In particular parameter $1$ has quantum characteristic $p$, not $1$.
  The grading automorphism $tau$ of $cal(B)$ negates all short generators and fixes all long generators. On the separated labels it exchanges the two components at every size. To check the action on their type $A$ labels as well as on their multiplicities, use the affine presentation
  $ X_1 = T_0 \, #h(2em) X_(j + 1) = v^(- 1) T_j X_j T_j . $
  The $X_j$ commute, and $tau$ negates them while leaving $T_j$ unchanged. Their generalized weights lie in the two disjoint strings $z_1 v^(bb(Z))$ and $z_2 v^(bb(Z))$, here with $z_2 = - z_1$. The corner with all strands of each string grouped together has the two type $A$ factors in (7.11). Negation exchanges its two groups.
  There is no additional involution on either type $A$ factor. For completeness, the Bernstein intertwiners
  $ Phi_j = T_j - frac(v - 1, 1 - X_j \/ X_(j + 1)) $
  interchange the $X_j$ weights and satisfy the braid relations where the indicated differences are invertible. These relations follow by substitution in the affine Hecke relations. Between different strings they are invertible, since both equal-weight and $v$-multiple-weight coincidences are excluded. The product which swaps the two grouped blocks preserves the order inside each block. The intertwiner braid relations show that it conjugates a within-block $Phi_j$ to the corresponding within-block $Phi_h$, and it carries the displayed rational correction to the corresponding correction. It therefore conjugates $T_j$ to $T_h$. This calculation may first be made in the Laurent localization. After the within-block corrections cancel, only differences between the two strings have been inverted; the affine basis theorem therefore gives the same identity in the separated corner. Thus the two type $A$ modules are simply exchanged, with their partition labels unchanged.
  The action on the separated partition labels is now determined. It remains to restrict from the full signed algebra to its total-even subalgebra. We have $cal(B) = cal(B)_0 xor cal(B)_0 u$ for an invertible odd short generator $u$ with $u^2 = 1$. Restriction of a simple $cal(B)$-module to $cal(B)_0$ is semisimple: the sum of a simple submodule and its $u$-translate is a nonzero $cal(B)$-submodule. The usual index-two Clifford argument now applies, since $2$ is invertible in $k$. A simple and its distinct $tau$-twist restrict to the same simple module. A simple fixed by $tau$ has a normalized twisting intertwiner of square $1$; its two eigenspaces give two distinct simple restrictions. These exhaust the simple $cal(B)_0$-modules by induction from $cal(B)_0$. This gives exactly the stated rule. With no chunks there is no odd unit and the algebra is just $k$, explaining the separate convention. ◻
]

#thm([Lemma 7.11.])[
  (Exact total count).  #emph[Sum the numbers of simple endomorphism-algebra types over all size choices (7.3). The result is $\| cal(T) \|$.]
] <end:count>

#proof[
  For an integer $e gt.eq 2$ put
  $ R_e \( x \) = product_(j gt.eq 1) \( 1 + x^j + dots.h.c + x^(\( e - 1 \) j) \) \, #h(2em) P \( x \) = product_(j gt.eq 1) \( 1 - x^j \)^(- 1) . $
  The first series counts $e$-regular partitions, the second all partitions. If $d > 1$, expansion of each part multiplicity first modulo $d$ and then in base $p$ gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ R_d \( x \) product_(a gt.eq 0) R_p \( x^(d p^a) \) = P \( x \) . $ <end:digits>]
  For $d = 1$ the corresponding identity is $product_(a gt.eq 0) R_p \( x^(p^a) \) = P \( x \)$. These are identities of formal series: at each degree only finitely many factors matter, and the products telescope using $R_e \( x \) = P \( x \) \/ P \( x^e \)$. Equivalently, a partition $lambda_b$ chosen at size $b$ contributes $b$ copies of each of its parts to the combined partition. Uniqueness of the digits is precisely uniqueness of this decomposition.
  For an ordinary signed packet, the two partition components are independent. Squaring (7.13) thus counts all ordered bipartitions of $m_i$, exactly the ordinary type $B$ triangle labels. The construction commutes with exchanging the two components. Hence on an even-sign packet the rule of Lemma 54 counts unordered bipartitions, with two labels on equal pairs, exactly the type $D$ rule. For $m > 0$, if $B \( m \)$ is the number of ordered bipartitions and $F \( m \)$ the number of equal pairs, the count is
  $ frac(B \( m \) - F \( m \), 2) + 2 F \( m \) = frac(B \( m \) + 3 F \( m \), 2) \, #h(2em) F \( m \) = cases(delim: "{", P_(m \/ 2) \, & m upright(" even") \,, 0 \, & m upright(" odd") \,) $
  where $P_a$ is the number of partitions of $a$. At $m = 0$ both sides of the representation-theoretic count use one label, instead of applying this positive-rank formula. In particular $D_1$ gives one label and $D_2$ gives four. The latter also follows directly from its two rank-one Hecke factors: their parameter has odd order, or is $1$ in odd characteristic, and is therefore not $- 1$.
  If several sizes each have just one chunk, their reflection groups $D_1$ are trivial but their total-even complement is $C_2^(t - 1)$ for $t$ sizes. The simultaneous exchange rule gives $2^(t - 1)$ labels as required. Thus the complement has not been lost in any small-rank case. Finally the packet counts multiply, proving the lemma. ◻
]

=== 7.5 Exhaustion and the projective norm estimate <exhaustion-and-the-projective-norm-estimate>

The total endomorphism-algebra count is now $\| cal(T) \|$. By Lemma 49, this is the number of distinct simple modules in our disjoint heads. We finish the exhaustion argument by placing all these heads in the endpoint block union. We then bound their projective covers by inducing projectives from the bounded chunks and the central-defect residual block.

#thm([Corollary 7.12.])[
  (Exhaustion of the endpoint simples).  #emph[Every simple module in the block union of $cal(T)$ is a quotient of $R_L^G rho$ for one of the pairs constructed in (7.5).]
] <end:exhaustion>

#proof[
  The Brauer class of $rho$ is an integral combination of partition rows at the marked parameter of $L$, with residual row $chi_0$. Every one of these ordinary rows occurs in $R_(L')^L psi'$, by ordinary linear branching. Transitivity and Proposition 28 therefore show that their inductions use only rows of $cal(T)$. Thus $R_L^G rho$ has all its composition factors in the block union in question; the integral combination is enough for this support assertion.
  Lemmas 51–55 count the simple types of all the relevant endomorphism algebras. Lemma 49 identifies this with the count for their heads. These heads are disjoint for different size choices, by Lemmas 48 and 49. The resulting total is $\| cal(T) \|$. Because $cal(T)$ is an integral basic set of the entire block union, this is exactly its number of simple modules. The supported heads therefore exhaust all of them. ◻
]

#proof[
  Let $S$ be one of the endpoint simples. By Corollary 56 it is a quotient of $R_L^G rho$. Let $P_rho$ be the projective cover of $rho$. Exactness and preservation of projectives give a projective module $R_L^G P_rho$ mapping onto $S$. After projection to the endpoint block union, it has the projective cover $P_S$ as a direct summand.
  We bound the ordinary coordinates of $P_rho$ before inducing. There are at most $sum_i m_i$ new chunks, each of size at most this sum, so each actual new linear factor has rank at most $2 sum_i m_i$. Their Sylow $p$-orders are bounded as well. Explicitly, for $e_q = "ord"_p \( q \)$ and $c_q = v_p \( q^(e_q) - 1 \)$, lifting the exponent gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ v_p \( \| "GL"_N \( q \) \| \) = c_q ⌊N / e_q⌋ + v_p #h(-0.16667em) (⌊N / e_q⌋ !) . $ <end:gl-order>]
  For $Q_i = q$ or $q^2$, $c_q$ is controlled by $v_p \( Q_i^(d_i) - 1 \)$; the possible factor $2$ does not change the valuation since $p$ is odd. For unitary chunks apply the same formula over $Q_i = q^2$. The geometric bound of Theorem 6 therefore bounds their Cartan entries, since both rank and defect order are bounded. Lemma 46 bounds the residual block; frozen factors have defect zero. The actual product decomposition and central transfer consequently give a bound $C_0$ for the diagonal Cartan entry of $P_rho$. Thus its ordinary projective-character coefficients are at most $sqrt(C_0)$, and its squared ordinary norm is at most $C_0$. The number $N_0$ of its nonzero ordinary coordinates is bounded, either by this integral norm bound or by the bounded-defect row bound.
  Only ordinary coordinates at the marked $p'$-parameter of $L$ contribute to the $s$-projection of its induction. Indeed an ordinary coordinate with nontrivial extra $p$-part retains that nontrivial part under induction and cannot belong to the series at $s$. The selected Levi block union fixes the marked $p'$-parameter class, so other Levi classes fusing to $s$ are not included. The residual coordinate is $chi_0$ by Lemma 46.
  Every remaining row $theta$ of $L$ occurs with positive integer multiplicity in $R_(L')^L psi'$. Positivity of ordinary split induction and transitivity give the coefficientwise inequality
  $ R_L^G theta med lt.eq med R_(L')^G psi' . $
  The ordinary positive transfer of Proposition 28 identifies the latter multiplicities with ordinary relative Weyl multiplicities in the triangle series. They are bounded, for example, by
  $ W_0 = product_i 2^(m_i) m_i ! . $
  This estimate concerns coordinate multiplicities; it does not bound ordinary character degrees. It follows that every $cal(T)$-coordinate of the projective character of $R_L^G P_rho$ is at most $N_0 sqrt(C_0) W_0$. Since $P_S$ is its projective summand and all ordinary projective coefficients are nonnegative, the same coordinate bound holds for $P_S$.
  Both the number of basic coordinates in $cal(T)$ and the number of ordinary irreducible characters in its block union are bounded, as are the block defect orders, by Proposition 33. Apply Lemma 3 to recover a uniform bound for the full ordinary norm of $P_S$ from this projected bound. Its squared norm is its diagonal Cartan entry, and Cauchy–Schwarz bounds every off-diagonal entry by the corresponding diagonal bounds. This proves the proposition, including the all-zero-rank case, in which the residual central-defect argument alone applies. ◻
]

== 8 Extensions and field Morita finiteness <sec:extensions>

Throughout this section, a bound is allowed to depend on the fixed prime $p$ and the defect-order bound $M$, but on no ambient group order. Put $k = overline(bb(F))_p$ and $cal(O) = W \( k \)$, and let $sigma$ denote coefficient Frobenius. We use integral blocks at intermediate stages. The conclusion for arbitrary finite groups will be a conclusion over $k$.

The input from the preceding sections is the quasisimple Cartan bound. We first reduce a general block to a crossed extension whose identity component has bounded defect and Cartan entries. We then specify an equivariant Frobenius comparison and prove that it makes these extensions finite up to Morita equivalence. Section 9 will construct that comparison without using the finite lists obtained here.

=== 8.1 Reduction to controlled crossed extensions <reduction-to-controlled-crossed-extensions>

Crossed products and algebraic-group actions enter Donovan’s conjecture through Külshammer’s reduction [48]; Eisele developed its integral form [30]. We retain both the outer action and the unit-valued multiplication factors. The additional issue here is comparison through Sylow $p$-actions, beyond the prime-to-$p$ crossed-product finiteness of those reductions.

#thm([Lemma 8.1.])[
  (Structure of a reduced pair).  #emph[Every block of a finite group with defect order at most $M$ is $k$-linearly Morita equivalent to a block $B$ of a finite group $H$ with the following properties.]
  + #emph[Every block of a normal subgroup covered by $B$ is $H$-stable. If $B$ covers a nilpotent block of $H_0 lt.closed.eq H$, then $H_0 lt.eq Z \( H \) O_p \( H \)$.]
  + #emph[Write 
$ N = F^(*) \( H \) = P Z E \( H \) \, #h(2em) E \( H \) = K_1 dots.h.c K_j \,\
P = O_p \( H \) \, #h(2em) Z = O_(p') \( H \) \, $

 where the $K_i$ are the components, that is, the subnormal quasisimple subgroups. Then $Z lt.eq Z \( H \)$, $\| P \| lt.eq M$, and $j$ is bounded. The block $b$ of $N$ covered by $B$ has bounded defect and bounded Cartan entries.]
  + #emph[For $X = H \/ N$, the index $\[ X : O_(p') \( X \) \]$ is bounded. The same index bound holds, with a possibly different constant, for every subgroup of every extension of $X$ by a $p'$-group.]
] <lem:ext:reduced-structure>

#proof[
  The general reduction in An–Eaton, Proposition 6.1 [2], gives the first assertion and preserves the defect group. Its statement has no restriction on the defect group. Only this preliminary reduction is used here. If necessary it can be performed over a sufficiently large modular system and then reduced to $k$. All subsequent integral blocks are the canonical lifts of blocks of the resulting finite groups to $cal(O)$.
  A block of the normal $p'$-subgroup $O_(p') \( H \)$ is nilpotent, so the first assertion makes that subgroup central. Also $P$ is contained in a defect group of $B$. The displayed description of $N$ follows from the definition of the generalized Fitting subgroup. Its factors commute except for their central intersections.
  Let $b_i$ be a block of $K_i$ covered by $b$, with defect group $D_i$. Normal block theory, applied also along a subnormal chain, gives $\| D_i \| lt.eq M$. No $D_i$ is central in $K_i$. Indeed, all components in the $H$-orbit of such a component would have central-defect blocks. Their central product is normal in $H$, and its covered block has central defect and is therefore nilpotent. The first assertion would put this nontrivial perfect group inside the soluble group $Z \( H \) P$, which is impossible.
  The multiplication map
  $ P times Z times product_(i = 1)^j K_i arrow.r N $
  has central kernel. Lift $b$ along this map, taking the trivial character on the $p'$-part of the kernel. Its lift is a tensor product of the block of $P$, a linear-character block of $Z$, and the $b_i$. The kernel identifies only central elements. Consequently the noncentral quotients $D_i \/ \( D_i ∩ Z \( K_i \) \)$ contribute independently to a defect group of $b$. Each has order at least $p$, and hence $p^j lt.eq M$. The lifted tensor block has defect order at most $M^(j + 1)$. Theorem 15, the bound on $\| P \|$, and the tensor-product formula bound its Cartan entries. Descent through the central kernel, using Lemma 2, then bounds the Cartan entries of $b$.
  We next bound the quotient. The generalized Fitting centralizer theorem [5] (31.13) says that $C_H \( F^(*) \( H \) \) lt.eq F^(*) \( H \)$. It embeds $X$ into the group of outer actions on $P$ and the permuting outer actions on the components. To check the kernel, inner actions on $P$ and on each component can be removed simultaneously by elements of their commuting factors in $N$. An element left in the kernel centralizes $N$, since it also centralizes $Z$, and therefore belongs to $N$. The standard outer automorphism descriptions of finite simple groups give a normal soluble subgroup $X_0$ of bounded index and bounded derived length in $X$: the component permutation group and $"Out" \( P \)$ have bounded order. For Lie types, the diagonal group is abelian, the field group is cyclic, and the diagram group has bounded derived length [13] Theorem 3.4; for alternating groups the outer group is of order at most two outside the single degree-six exception [64] Theorem 2.3 and Section 2.4.2; and the sporadic list is finite. Thus the outer groups have uniformly bounded derived length. The same statements hold for their perfect central covers, since an automorphism trivial on the simple quotient and on inner automorphisms is trivial on the perfect cover.
  Consider an abelian derived section $X_0^(\( i \)) \/ X_0^(\( i + 1 \))$. Its $p$-primary subgroup lifts to a normal section $H_2 \/ H_1$ of $H$, above $N$, of $p$-power order. All the relevant covered blocks are stable. The defect group of the covered block of $H_2$ surjects onto $H_2 \/ H_1$, by the normal block theorem for a $p$-power extension. It has order at most $M$. Thus the $p$-part of each derived section has order at most $M$, and $\| X \|_p$ is bounded.
  Set $Q = X \/ O_(p') \( X \)$. Then $O_(p') \( Q \) = 1$, so $F \( Q \) = O_p \( Q \)$ has bounded order. All nonabelian composition factors of $Q$, counted with multiplicity, occur in a quotient of bounded order, namely $X \/ X_0$; their number and orders are bounded. Components of $Q$ are quotients of the universal central covers of these finitely many simple groups. Therefore $F^(*) \( Q \)$ has bounded order. Applying the generalized Fitting centralizer theorem to $Q$ shows that $Q$ has bounded order as well: its conjugation homomorphism into $"Aut" \( F^(*) \( Q \) \)$ has kernel contained in $F^(*) \( Q \)$.
  Finally, if $tilde(X) arrow.r.twohead X$ has $p'$-kernel, the inverse image of $O_(p') \( X \)$ is a normal $p'$-subgroup of bounded index. Its intersection with any subgroup of $tilde(X)$ proves the last assertion. ◻
]

We next enlarge the components in a way which preserves both the defect bound downstairs and the actual multiplication of the outer actions. The second requirement is essential for the later crossed products.

#thm([Lemma 8.2.])[
  (Compatible partial regular extensions).  #emph[In the notation of Lemma 57, there is an extension $N lt.closed.eq macron(N)$ with abelian $p'$-quotient $A = macron(N) \/ N$ having the following properties.]
  + #emph[Choose $h_1 = 1$ and representatives $h_x$ for $x in X$, and put 
#[#set math.equation(numbering: n => "(8.1)")
 $ h_x h_y = n_(x y) h_(x y) \, #h(2em) n_(x y) in N . $ <eq:ext:actual-factors>]

 Conjugation by $h_x$ on $N$ extends to an automorphism $alpha_x$ of $macron(N)$, and 
#[#set math.equation(numbering: n => "(8.2)")
 $ alpha_x alpha_y & = "ad" \( n_(x y) \) alpha_(x y) \,\
n_(x y) n_(x y \, z) & = alpha_x \( n_(y z) \) n_(x \, y z) . $ <eq:ext:action-law>]

 Here $"ad" \( g \)$ means conjugation by $g$; the factors are the actual elements in (8.1).]
  + #emph[Every block $macron(b)$ of $macron(N)$ covering $b$ has bounded defect and Cartan entries.]
  + #emph[There is a central presentation 
$ macron(N) = #scale(x: 120%, y: 120%)[\(] P times Z times product_i V_i #scale(x: 120%, y: 120%)[\)] \/ D_0 \, #h(2em) N = #scale(x: 120%, y: 120%)[\(] P times Z times product_i U_i #scale(x: 120%, y: 120%)[\)] \/ D_0 \, $

 where $U_i$ is the universal cover of the simple quotient of $K_i$. Outside alternating types and a finite list, $U_i = upright(bold(U))_i^(F_i)$ is a standard simply connected group in characteristic different from $p$. It has a reductive enlargement with fixed-point group 
$ J_i = V_i times C_i \, $

 where $C_i$ is central of $p$-power order, $V_i \/ U_i$ is abelian of $p'$-order, the derived algebraic group is simply connected, and all dual semisimple $p'$-centralizers are connected. The constructions respect the component permutations and the actions in the first assertion. No bound on $\| D_0 \|$ or $\| C_i \|$ is asserted.]
] <lem:ext:partial-extension>

#proof[
  The universal central extension is functorial for perfect groups. It therefore lifts the actions on the components and gives a central surjection $P times Z times product_i U_i arrow.r N$ with kernel $D_0$. In defining characteristic, a component block with noncentral defect has a Sylow defect group, apart from the bounded exceptional groups; see the defining-characteristic block theorem [43]. A bound on this Sylow order bounds both field degree and rank. Thus these components, the sporadic components, and the exceptional multiplier and automorphism cases form a finite list. The remaining nonalternating factors are the standard simply connected finite groups in cross characteristic.
  For one such factor write $U = upright(bold(U))^F$, with a pinned simply connected simple algebraic group $upright(bold(U))$. First suppose the Frobenius has the usual form $F = gamma "Fr"_r^f$, with $gamma$ a diagram automorphism and $r eq.not p$. Let $Z_(p') = Z \( upright(bold(U)) \)_(p')$ be the prime-to-$p$ part of its finite diagonalizable center, interpreted as a group scheme. Take a split torus $upright(bold(T))_0$ with one coordinate for each fundamental weight. Restriction of these weights to $Z_(p')$ embeds $Z_(p')$ into $upright(bold(T))_0$. This embedding is equivariant for diagram permutations and split Frobenius. Define
  #[#set math.equation(numbering: n => "(8.3)")
   $ upright(bold(J)) = \( upright(bold(U)) times upright(bold(T))_0 \) \/ { \( z \, z^(- 1) \) : z in Z_(p') } . $ <eq:ext:partial-regular>]
  The construction includes nonreduced diagonalizable parts when the defining characteristic divides the center order. In particular it is a construction on the pinned root datum, rather than merely on abstract finite centers.
  The original $upright(bold(U))$ embeds as $\[ upright(bold(J)) \, upright(bold(J)) \]$, and is still simply connected. As group schemes its center satisfies
  $ Z \( upright(bold(J)) \) tilde.eq Z \( upright(bold(U)) \)_p times upright(bold(T))_0 . $
  The center component group is therefore $p$-primary. The obstruction in the fundamental group to connected semisimple centralizers on the dual side is $p$-primary. The semisimple centralizer component theorem embeds the component group in that obstruction and makes its exponent divide the order of the semisimple element; see [7] Corollary 2.9 for connected reductive groups and [56] Proposition 14.20. It follows that a semisimple $p'$-element of $upright(bold(J))^(*)$ has connected centralizer.
  Put $J = upright(bold(J))^F$. Lang–Steinberg’s theorem [56] Theorem 21.7 applied to the connected kernel $upright(bold(U))$ identifies
  $ J \/ U = \( upright(bold(T))_0 \/ Z_(p') \)^F . $
  The isogeny $upright(bold(T))_0 arrow.r upright(bold(T))_0 \/ Z_(p')$ has degree prime to $p$. On fixed points its kernel and cokernel have $p'$-order; for the cokernel use the fixed-point exact sequence and $H^1 \( F \, Z_(p') \)$. It therefore induces an isomorphism on $p$-primary subgroups. The $p$-primary subgroup of $upright(bold(T))_0^F$ gives a central subgroup $C lt.eq J$ mapping isomorphically onto $\( J \/ U \)_p$ and disjoint from $U$. Let $V$ be the inverse image of $\( J \/ U \)_(p')$. Then $J = V times C$ and $V \/ U$ is abelian of $p'$-order. These definitions are invariant under every automorphism of the pinned construction.
  For exceptional graph isogenies in types $B_2 \, F_4$ in characteristic $2$, and $G_2$ in characteristic $3$, use the original group on points and put $V = U$, $C = 1$. This includes the Suzuki and Ree endomorphisms. The center and the relevant fundamental obstruction have trivial groups of geometric points in the only nontrivial isogeny case, or are trivial; the same connected-centralizer conclusion holds for semisimple elements. For the finite-list and alternating factors also put $V_i = U_i$.
  We spell out compatibility of automorphisms. For a standard universal Lie group, the automorphism theorem [13] Definition 3.3 and Theorem 3.4 gives the semidirect product of the rational inner-diagonal group and the concrete field-and-graph subgroup. In the ordinary diagram case, write $cal(E) = chevron.l "Fr"_r \, upright("pinned diagrams") chevron.r$ on geometric points. The restriction of $C_(cal(E)) \( F \)$ to $U$ has kernel $chevron.l F chevron.r$; see [62] Section 2.2. Thus its image is exactly the pinned field-and-diagram group with that relation imposed. The inner-diagonal group is represented faithfully by $upright(bold(U))_(upright("ad"))^F$. It acts on (8.3) by conjugation on $upright(bold(U))$ and trivially on the torus. The pinned operations act on $upright(bold(U))$ and on the fundamental-weight coordinates of $upright(bold(T))_0$ with the same relations and the same conjugation action on the inner-diagonal group. The sole additional relation $F = gamma "Fr"_r^f = 1$ holds on $J$. Consequently the semidirect product action factors through the actual automorphism group of $U$. An inner automorphism implemented by $u in U$ is extended by conjugation by that same element. Use identical pinned models on isomorphic permuted components. In the exceptional graph-isogeny case no enlargement is made, so the existing actions already have the required property.
  Apply this construction factor by factor. The old kernel $D_0$ remains central and is preserved, since the extended operations agree with the old operations on all its elements. Taking its quotient gives $macron(N)$ and an abelian $p'$-quotient $A$ over $N$. The compatibility just proved makes the products of the extended actions differ by conjugation by exactly $n_(x y)$, proving (8.2). Equation (8.2) already holds as an equality in $N$, by associativity in $H$, and therefore still holds in $macron(N)$.
  Finally, $N lt.closed.eq macron(N)$ has $p'$-index, so a block covering $b$ has the same defect order. Lemma 4 bounds its Cartan entries. This argument takes place after quotienting by $D_0$; it does not require bounded defect for a block lifted to the universal covers or to the groups $J_i$. ◻
]

#thm([Lemma 8.3.])[
  (Recovery by a dual action).  #emph[Let $Xi = "Hom" \( A \, k^times \)$ and $Y = Xi times.r X$. There is an integral crossed algebra with identity component $cal(O) macron(N)$ and grading group $Y$ such that $cal(O) H$ is a full idempotent corner. After taking the summand relevant to $B$, and then a further full corner, one obtains a crossed algebra with identity component $macron(B) = cal(O) macron(N) macron(b)$ and grading group $Y_0 = "Stab"_Y \( macron(b) \)$. Every such $macron(b)$ covers $b$. The groups $Y_0 \/ O_(p') \( Y_0 \)$, and hence their Sylow $p$-subgroups, have bounded order.]
] <lem:ext:dual-recovery>

#proof[
  For $chi in Xi$, let its action on a group element $g in macron(N)$ be multiplication by $chi \( g N \)$. Lift these characters by Teichmüller representatives over $cal(O)$. Combine these actions with the $alpha_x$ of Lemma 58; use $n_(x y)$ as the factor for the $X$-coordinates and ordinary semidirect transport on $Xi$. Equations (8.2) and (8.2) give a crossed system, since every character in $Xi$ is trivial on all $n_(x y) in N$.
  Write $u_chi$ for the homogeneous units corresponding to $Xi$. The element
  $ e_Xi = frac(1, \| Xi \|) sum_(chi in Xi) u_chi $
  is an idempotent. A group element in the $a$-component of the $A$-grading of $cal(O) macron(N)$ conjugates $e_Xi$ to the character idempotent of $cal(O) Xi$ corresponding to $a$. These idempotents, as $a$ varies, sum to $1$, so $e_Xi$ is full. Moreover $e_Xi \( cal(O) macron(N) times.r Xi \) e_Xi = cal(O) N e_Xi$: the average kills all nonidentity $A$-components. The $X$-units commute with $e_Xi$ and retain their factors $n_(x y)$. Its corner in the entire crossed algebra is consequently $cal(O) H$.
  Decompose the crossed algebra by $Y$-orbits on the blocks of $cal(O) macron(N)$. Each orbit sum is fixed by $Xi$ and so belongs to $cal(O) N$. The orbit summand meeting $B$ has nonzero product with $b$. At least one of its blocks covers $b$; every member does, since twists are trivial on $N$ and the $H$-actions preserve $b$. Within this orbit summand a single block idempotent $macron(b)$ is full, since its homogeneous conjugates sum to the orbit idempotent. Its corner has precisely the degrees in $Y_0$, with invertible homogeneous units $macron(b) u_y$, and is the asserted crossed algebra. These constructions also hold after reduction to $k$.
  The group $Y$ is an extension of $X$ by the $p'$-group $Xi$. The bound follows from Lemma 57. ◻
]

=== 8.2 The comparison input and integral base orders <the-comparison-input-and-integral-base-orders>

The reduction has bounded the defect and Cartan data of the identity blocks, and bounded the grading groups modulo their normal $p'$-subgroups. The grading itself may still be large. We now state the additional comparison needed to control its actual crossed multiplication.

Here and below a crossed system on an algebra $R$ for a finite group $T$ consists of automorphisms $alpha_t$ and units $a_(s \, t)$ such that

$ alpha_s alpha_t & = "ad" \( a_(s \, t) \) alpha_(s t) \,\
a_(s \, t) a_(s t \, u) & = alpha_s \( a_(t \, u) \) a_(s \, t u) \, $

with the usual identity normalizations. Its algebra is $xor.big_(t in T) R u_t$, with $u_t r = alpha_t \( r \) u_t$ and $u_s u_t = a_(s \, t) u_(s t)$. An isomorphism is called #emph[based] if it is the identity on the specified copy of $R$ and preserves each group-labelled homogeneous component. Such isomorphisms are exactly the changes of homogeneous units. For the crossed-system formalism, see also [30] Definition 4.1 and Lemma 4.3.

#prodef([Definition 8.4.])[
  (The comparison property).  For the data of Lemmas 58 and 59, let $S lt.eq Y_0$ be a $p$-subgroup contained in the pure subgroup $X lt.eq Xi times.r X$. The comparison property is the existence of a positive integer $m$, bounded in terms of $p \, M$, and an integral $\( sigma^m macron(B) \, macron(B) \)$-Morita bimodule $cal(M)$ with the following additional structure on $M_0 = k ⊗_(cal(O)) cal(M)$. There are invertible $k$-linear maps $J_x : M_0 arrow.r M_0$, $x in S$, such that, writing $alpha'_x = sigma^m \( alpha_x \)$ and $a'_(x y) = sigma^m \( a_(x y) \)$, one has
  #[#set math.equation(numbering: n => "(8.4)")
   $ J_x \( a v b \) & = alpha'_x \( a \) J_x \( v \) alpha_x \( b \) \,\
J_x J_y \( v \) & = a'_(x y) J_(x y) \( v \) a_(x y)^(- 1) \, #h(2em) J_1 = "id" . $ <eq:ext:comparison-covariance>]
  Here $a_(x y) = n_(x y) macron(b)$ and the target factor is its coefficient Frobenius image, with the corresponding target block identity. The property is required also for $S = 1$.
] <def:ext:comparison-data>

It is enough to produce these maps with a scalar error in (8.4). Associativity and covariance then make the errors a scalar $2$-cocycle on $S$. Positive cohomology of $S$ with coefficients in $k^times$ vanishes: $\| S \|$ annihilates it, whereas the $\| S \|$-power map of $k^times$ is an automorphism. Rescaling the $J_x$ removes the error. An error in arbitrary units of the center would not give this conclusion.

Every $p$-subgroup of $Y$ is conjugate by an element of $Xi$ to a subgroup of the pure $X$. Indeed its image in $X$ is a $p$-group, and Schur–Zassenhaus conjugates its complement to the standard complement in the inverse image of that image. Conjugating also the block and the corner transports this assertion to every $p$-subgroup of $Y_0$. This conjugation is implemented by an integral homogeneous unit in the algebra of Lemma 59.

#thm([Lemma 8.5.])[
  (Finite integral bases and finite Picard images).  #emph[Assume the comparison property for the trivial subgroup. The integral basic orders of all the blocks $macron(B)$ above belong to a finite list $frak(R)_1 \, dots.h \, frak(R)_t$. Each $frak(R)_i$ is defined over some $W \( bb(F)_(p^(c_i)) \)$ and has finite $"Pic"_(cal(O)) \( frak(R)_i \)$. Consequently the outer actions in the reduced crossed basic corners take their values in a fixed finite subgroup of $"Pic"_k \( R_i \)$, where $R_i = k ⊗_(cal(O)) frak(R)_i$.]
] <lem:ext:integral-bases>

#proof[
  The defect orders and Cartan entries of $macron(B)$ are bounded. The number of simple modules is bounded by the defect bound, so the sum of its Cartan entries is bounded too. For $S = 1$ the comparison property bounds the integral Morita–Frobenius number. Eaton–Eisele–Livesey, Theorem 3.10 [28], says precisely that bounded Cartan sum, bounded numerical defect $d$ (so the defect group has order $p^d$), and bounded integral Morita–Frobenius number give finitely many integral Morita classes. Applying it to the finitely many possible numerical defects gives the claimed finite list of basic orders.
  Choose each representative as a basic corner of one actual integral group block. Its block and primitive idempotents modulo $p$ are defined over a finite field containing their finitely many coefficients and splitting the finitely many simple modules in question. Lift these idempotents over its Witt ring, which is complete. The resulting corner defines $frak(R)_i$ over $W \( bb(F)_(p^(c_i)) \)$ for some $c_i$.
  Eisele’s Theorem B and Corollary 1.2 [31] give the finiteness of the integral Picard group of a block, and hence of its basic order. The hypotheses apply to $cal(O) = W \( k \)$: it is unramified and has algebraically closed residue field, and the generic algebra is separable. The relevant rigidity condition can also be checked directly. The conjugacy-class decomposition of the adjoint group module gives
  $ "HH"^1 \( cal(O) G \) = xor.big_(\[ g \]) H^1 \( C_G \( g \) \, cal(O) \) = 0 \, $
  because each centralizer is finite and $cal(O)$ is torsion-free with trivial action in the displayed cohomology. Vanishing passes to block summands and to basic orders by Morita invariance, as required in Eisele’s theorem.
  Passing to basic corners preserves a crossed structure integrally; see [30] Proposition 4.15 and Corollary 4.16(2). We recall how the homogeneous units and their factors are obtained. If $e$ is a basic idempotent in a block order, then any automorphism sends $e$ to a unit-conjugate idempotent: both associated projectives contain one copy of every indecomposable projective type. Multiplying each homogeneous unit by a suitable identity-component unit makes it commute with $e$. The corner is then crossed over $e macron(B) e$. After identifying this order with $frak(R)_i$, its homogeneous automorphisms give elements of $"Pic"_(cal(O)) \( frak(R)_i \)$. Their reductions lie in the finite image of this group in $"Pic"_k \( R_i \)$. Since $R_i$ is basic, $"Pic"_k \( R_i \)$ is naturally its outer automorphism group: an invertible bimodule is isomorphic to $R_i$ as a one-sided module, and its other action specifies an automorphism up to inner automorphism. ◻
]

=== 8.3 Based descent and the large kernel <based-descent-and-the-large-kernel>

The trivial-subgroup comparison has supplied finitely many integral base orders and finite images of their Picard groups. We next use the full Sylow comparison to retain the chosen base algebra while descending the crossed factors. This stronger form of finiteness is what permits removal of a large $p'$-kernel.

#thm([Lemma 8.6.])[
  (Based Frobenius descent on $p$-subgroups).  #emph[Assume the comparison property of Definition 60. For each fixed integral basic order $frak(R)_i$ and each group of bounded $p$-power order, the restrictions of the reduced crossed basic corners to that group have only finitely many based isomorphism classes. The identification of the identity component with $R_i$ is part of this assertion and may be chosen arbitrarily integrally.]
] <lem:ext:based-sylow>

#proof[
  The argument has three steps. We align the chosen basic corners with their Frobenius images, use the finite integral Picard group to obtain the regular comparison bimodule, and then apply Lang’s theorem to the resulting based unit-change orbit over $k$. Throughout, each group label and the specified identity algebra are retained.
  Fix $frak(R) = frak(R)_i$, $R = R_i$, and a descent degree $c$. First conjugate the subgroup to a pure one as above, transporting the block and the integral corner identification. The comparison property applies to the conjugated data. It passes to the basic corners. Explicitly, if source and target homogeneous units are changed by $t_x$ and $t'_x$, respectively, the transport is changed to $v mapsto t'_x J_x \( v \) t_x^(- 1)$. Covariance shows that its multiplication rule is exactly the rule with the new crossed factors. The maps then restrict to the corresponding bimodule corner. Choose the target corner and its coordinates by applying $sigma^m$ to the source choices. Thus in these fixed coordinates the target crossed data are the actual coefficient Frobenius images, with the same group labels.
  Tensor the comparison with its successive Frobenius twists. Both covariance and (8.4) tensor: the two middle factors in the product law cancel in the balanced tensor product. After at most $c$ repetitions its exponent $n$ is divisible by $c$. The descent model now identifies $sigma^n frak(R) = frak(R)$, so its integral bimodule class is an element $P$ of the finite group $cal(P) = "Pic"_(cal(O)) \( frak(R) \)$. Let $theta$ be the permutation of $cal(P)$ induced by $sigma^n$ and this descent identification. Further tensor repetitions multiply $P \, theta \( P \) \, theta^2 \( P \) \, dots.h$. The element $\( P \, theta \)$ of the finite semidirect product $cal(P) times.r chevron.l theta chevron.r$ has finite order, bounded in terms of $\| cal(P) \|$. After that many repetitions the integral bimodule class is the identity. The resulting total exponent $N$ is bounded in terms of the fixed finite list and the original comparison bound, and remains divisible by $c$.
  Identify the reduced comparison bimodule with the regular $\( R \, R \)$-bimodule. Put $v_x = J_x \( 1 \)$. Covariance gives
  $ J_x \( r \) = alpha'_x \( r \) v_x = v_x alpha_x \( r \) . $
  Since $J_x$ is invertible, multiplication by $v_x$ is invertible, and $v_x in R^times$. The product rule gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ alpha'_x & = "ad" \( v_x \) alpha_x \,\
a'_(x y) & = v_x alpha_x \( v_y \) a_(x y) v_(x y)^(- 1) . $ <eq:ext:gauge-action>]
  Thus the crossed system and its $p^N$-coefficient Frobenius image are in the same orbit under changes of homogeneous units, identically on $R$.
  The comparison has now become a change of homogeneous units, so it fixes the specified copy of $R$ pointwise. To finish, we descend this based orbit to a bounded finite field. For fixed $R$ and $S$, all crossed systems form an affine variety of finite type: take the automorphism matrices of $R$, the coordinates of $a_(x y) in R^times$, and impose the two crossed identities. Invertibility can be expressed by adjoining inverse determinants. This variety is defined over $bb(F)_(p^c)$. The unit-change group is
  $ cal(U) = \( R^times \)^(S \\ { 1 }) \, $
  acting by (8.5)–(8.5). It is connected: $R^times$ is a nonempty open subset of the vector space $R$. Write $F$ for $p^N$-coefficient Frobenius. If $F \( d \) = g dot.op d$, Lang’s theorem [49] supplies $h in cal(U)$ with $h^(- 1) F \( h \) = g^(- 1)$; hence $h dot.op d$ is $F$-fixed. The orbit therefore has a representative over $bb(F)_(p^N)$. There are only finitely many such points for a fixed $N$. There are only finitely many possible bounded $N$ and bounded-order groups $S$. This proves based finiteness. Transport back through the initial conjugation gives the same conclusion for the original restrictions. ◻
]

#thm([Lemma 8.7.])[
  (Removing a large $p'$-kernel).  #emph[Fix an indecomposable finite-dimensional basic $k$-algebra $R$ and a finite subgroup $cal(F) lt.eq "Pic"_k \( R \)$. Consider crossed algebras on $R$ by groups $T$ such that]
  + #emph[$\[ T : O_(p') \( T \) \]$ is bounded;]
  + #emph[their outer actions take values in $cal(F)$; and]
  + #emph[their restrictions to $p$-subgroups have finitely many based isomorphism classes, for each possible abstract subgroup.]
  #emph[Then their block summands have finitely many $k$-linear Morita equivalence classes.]
] <lem:ext:kernel-removal>

#proof[
  Let $cal(T)$ be one of these crossed algebras and set
  $ K = O_(p') \( T \) ∩ ker \( T arrow.r "Pic"_k \( R \) \) . $
  The index $\[ T : K \]$ is bounded. Change homogeneous units in the $K$-degrees so that they centralize $R$; their factors now belong to $Z \( R \)^times$. Since $R$ is indecomposable, its artinian center is local, with residue field $k$, and
  #[#set math.equation(numbering: n => "(8.6)")
   $ Z \( R \)^times = k^times times U_R \, #h(2em) U_R = 1 + "rad" Z \( R \) . $ <eq:ext:center-units>]
  This is a canonical decomposition into scalars and principal units. The abelian group $U_R$ has bounded $p$-power exponent: if $\( "rad" Z \( R \) \)^(p^e) = 0$, then $\( 1 + z \)^(p^e) = 1$ for every $z in "rad" Z \( R \)$. Multiplication by $\| K \|$ is invertible on $U_R$, so $H^a \( K \, U_R \) = 0$ for $a > 0$. A further central change of units therefore makes all $K$-factors scalar.
  Let $v_k$ denote these units. Their $k$-span is a scalar twisted group algebra $E$ of $K$, and the subalgebra on the $K$-degrees is $R ⊗_k E$. The algebra $E$ is semisimple by the twisted Maschke theorem, since $p divides.not \| K \|$. Every homogeneous conjugation normalizes $E$. Indeed it takes $v_k$ to $z_k v_(t k t^(- 1))$, with $z_k in Z \( R \)^times$. Comparing products of these elements shows that the principal-unit components of $z_k$ define a homomorphism $K arrow.r U_R$: all original and conjugated factors are scalar. Such a homomorphism is trivial, because $K$ is a $p'$-group and $U_R$ has $p$-power exponent. Thus all $z_k$ are scalar, as required.
  Write $E = product_j E_j$, with $E_j$ full matrix algebras over $k$, and let $e_j$ be their identity idempotents. Orbit sums under $T$ are central in $cal(T)$. In each such summand a single $e_j$ is full. Let $T_j$ stabilize $E_j$. Coarsening its corner grading by $K$ gives a crossed algebra on $R ⊗ E_j$ with group
  $ Q_j = T_j \/ K \, #h(2em) \| Q_j \| lt.eq \[ T : K \] . $
  Conjugation by each homogeneous unit preserves separately $R$ and $E_j$. By Skolem–Noether its action on $E_j$ is implemented by a unit of $E_j$. Dividing by that unit makes it centralize $E_j$, without changing its action on $R$. Its multiplication factors now belong to the centralizer of $E_j$ in $R ⊗ E_j$, namely $R$. Hence the corner is a matrix algebra over a crossed algebra $cal(C)_j$ on $R$ with grading group $Q_j$ and with the same outer action on $R$.
  The matrix factors have been removed without changing the outer action on $R$. This alone is insufficient for based finiteness: we must also recover the original multiplication factors on a Sylow subgroup. We do so without bounding the matrix size. Choose a Sylow $p$-subgroup $S$ of $Q_j$. Schur–Zassenhaus in its inverse image gives a $p$-subgroup $tilde(S) lt.eq T_j$ mapping isomorphically onto $S$. Use the original homogeneous units $u_s$ for $s in tilde(S)$; their products have factors $a_(s \, t) in R^times$. These factors centralize $E_j$, so their conjugations on $E_j$ form an honest group action. Choose $c_s in E_j^times$ implementing it. Then
  $ c_s c_t c_(s t)^(- 1) = gamma \( s \, t \) in k^times . $
  The corrected units $w_s = c_s^(- 1) e_j u_s$ have the original actions on $R$ and satisfy
  $ w_s w_t = gamma \( s \, t \)^(- 1) a_(s \, t) w_(s t) . $
  Since $H^2 \( S \, k^times \) = 0$, rescaling removes $gamma$. Thus the restriction of $cal(C)_j$ to $S$ is based-isomorphic to one of the restrictions already controlled in the hypothesis.
  It remains to pass from a Sylow subgroup to a group $Q$ of bounded order. There are finitely many outer homomorphisms $Q arrow.r cal(F)$. Fix one and choose action representatives $alpha_q in "Aut"_k \( R \)$. Changing homogeneous units permits these same representatives for every crossed system with that outer homomorphism. If factors satisfying the crossed identities exist, their classes under central changes of homogeneous units form a torsor under
  $ H^2 \( Q \, Z \( R \)^times \) . $
  To see this directly, the ratio of any two factor systems with these fixed actions is central; the associativity identity says that this ratio is a $2$-cocycle. A change which leaves all the chosen actions fixed is necessarily central and gives precisely a coboundary.
  Restriction from this cohomology group to that of a Sylow $p$-subgroup has finite kernel. On the factor $U_R$ of (8.6), restriction followed by corestriction is multiplication by the $p'$-index, which is invertible on this $p$-power-exponent cohomology group. Restriction is therefore injective on $H^2 \( Q \, U_R \)$. On scalars, $H^2 \( Q \, k^times \)$ is finite. Indeed, for $n = \| Q \|$, the $n$-power map on $k^times$ is surjective with finite kernel $mu_n \( k \)$; the long exact cohomology sequence and annihilation by $n$ make $H^2 \( Q \, k^times \)$ a quotient of the finite group $H^2 \( Q \, mu_n \( k \) \)$. The decomposition (8.6) is invariant under all the actions, so these two assertions prove the finite-kernel claim.
  Based Sylow finiteness gives finitely many restricted torsor classes with the fixed actions, and each has finitely many preimages. There are therefore finitely many possibilities for $cal(C)_j$. Each has finitely many block summands, proving the claimed Morita finiteness. The number or the matrix sizes of the factors $E_j$ were never required to be bounded. ◻
]

=== 8.4 The extension criterion <the-extension-criterion>

#thm([Theorem 8.8.])[
  (The conditional extension criterion).  #emph[Fix $p$ and $M$. Suppose that the comparison property of Definition 60 holds uniformly for the data constructed from all reduced blocks of defect order at most $M$. Then the blocks of all finite groups of defect order at most $M$ have finitely many $k$-linear Morita equivalence classes.]
] <thm:extension-finiteness>

#proof[
  Reduce to $B$ and construct the crossed algebra of Lemma 59. Its block summands include, up to Morita equivalence, the original block. By Lemma 61 its identity-component basic orders lie in a finite list; their reductions have a fixed finite set of possible outer actions. Their grading groups have a normal $p'$-subgroup of bounded index by Lemma 57. Lemma 62 supplies the needed based finiteness on $p$-subgroups. Lemma 63 therefore gives finitely many Morita types for all their block summands. Taking the finite union over the integral base orders proves the assertion. ◻
]

Proposition 65, proved in the next section, establishes exactly the comparison property used in Theorem 64. Combining the two results proves the $k = overline(bb(F))_p$ case of Theorem 1; Section 9.6 transfers the resulting finite list to the fixed algebraically closed field $K$. The order of this exposition introduces no extra premise: the proof of that proposition uses the component constructions and character results, and does not use the finite lists deduced here. The integral finiteness theorem has been applied only to the bounded-defect identity-component blocks $macron(B)$; the final arbitrary-group assertion is over $k$.

== 9 Sylow-equivariant Frobenius comparison <sec:periodicity>

We prove the comparison property used in the extension argument. It is important to retain the specified inner factors of the action: a comparison of the underlying block algebras alone would not control the crossed multiplications in Section 8.

#thm([Proposition 9.1.])[
  (Sylow comparison).  #emph[Fix the coefficient prime $p$ and the defect-order bound $M$. For the comparison data of Definition 60, let $S lt.eq Y_0$ be a $p$-subgroup contained in the pure $X$-actions. There is a positive integer $m$, bounded in terms of $p$ and $M$, and a Morita bimodule 
$ cal(M) : quad cal(O) macron(N) sigma^m \( macron(b) \) upright("-") cal(O) macron(N) macron(b) $

 such that its reduction $M_0 = k ⊗_(cal(O)) cal(M)$ has invertible $k$-linear maps $J_x$, for $x in S$, with $J_1 = "id"$, satisfying 
#[#set math.equation(numbering: n => "(9.1)")
 $ J_x \( a v b \) & = alpha'_x \( a \) J_x \( v \) alpha_x \( b \) \,\
J_x J_y \( v \) & = a'_(x y) J_(x y) \( v \) a_(x y)^(- 1) . $ <per:covariance>]

 Here $alpha_x$ is the action of the chosen representative $h_x$, $alpha'_x = sigma^m \( alpha_x \)$, $a_(x y) = n_(x y) macron(b)$, and $a'_(x y) = n_(x y) sigma^m \( macron(b) \) = sigma^m \( a_(x y) \)$. The assertion includes $S = 1$. The bound does not depend on the orders of the universal-cover kernels or of the added central tori.]
] <prop:sylow-comparison>

We use the block idempotent and the corresponding block algebra interchangeably when specifying bimodule sides. Extend Witt Frobenius to an algebraic closure of $"Frac" \( cal(O) \)$ by requiring it to fix all $p$-power roots of unity. Such an extension exists because the cyclotomic extensions generated by these roots are totally ramified, whereas $cal(O)$ is unramified; see [34] Lemma 2.2. On roots of unity of order prime to $p$ it is the $p$th power map. Throughout this section a bound is allowed to depend on $p \, M$.

=== 9.1 Replacing field automorphisms by algebraic permutations <replacing-field-automorphisms-by-algebraic-permutations>

We use the component models of Lemma 58. Lift the block to the central product cover, and on a Lie component adjoin the direct central $p$-factor $C_i$ so that the finite group is the full fixed-point group $upright(bold(J))_i^(F_i)$. These lifted blocks can have unbounded defect. We will descend the equivalences before using any bounded-defect finiteness criterion.

#thm([Lemma 9.2.])[
  (Algebraic realization).  #emph[On each $S$-orbit of cross-characteristic Lie components there is a connected reductive group $upright(bold(J))$ with simply connected derived group and a Steinberg endomorphism $F$, together with an identification of $J = upright(bold(J))^F$ with the product of the full component groups, having the following properties. The operations generated by the $h_x$ and the inner automorphisms of $J$ form a subgroup 
$ I med lt.eq med upright(bold(J))_(upright("ad"))^F times.r Y' \, $

 where $Y'$ is a finite $p$-group of algebraic automorphisms commuting with $F$. Its order and the number of copies of each original absolute component used in $upright(bold(J))$ are bounded. Restriction of these operations to the universal components is faithful modulo precisely the standard inner and pinned relations. In particular the products of the chosen operations have the prescribed inner factors coming from $n_(x y)$.]
] <per:algebraic-action>

#proof[
  We recall the relevant part of Steinberg’s automorphism theorem [63] for finite simple groups of Lie type, in the formulation of Broto–Møller–Oliver [13] Definition 3.3 and Theorem 3.4, omitting the finite exceptional list already separated in Section 8. For an ordinary diagram twist
  $ F_0 = gamma "Fr"_r^f $
  the inner-diagonal group is the adjoint fixed-point group. The pinned part is generated by $"Fr"_r$ and the diagram centralizer of $gamma$, with the relation $gamma "Fr"_r^f = 1$ on fixed points. In the ordinary field–Dynkin presentation the restriction kernel is exactly the cyclic group generated by $F_0$; see [62] §2.2. These operations act on the partial regular extension, including its added torus, with the same relation. The exceptional graph-isogeny cases have instead a generator $tau$, with $tau^2$ a split Frobenius, and defining endomorphism $F_0 = tau^f$ [13] Definition 3.1. Its restriction has order exactly $f$. For untwisted groups, $f = 2 d$, even powers are field operations of order $d$, and odd powers exchange long and short root groups. For the Suzuki and Ree twists, $f$ is odd and $tau^2$ has field order $f$, forcing $tau$ itself to have order $f$. The usual automorphism description is faithful on the universal component after the finite exceptional list has been removed. We now turn its field operations into actual algebraic automorphisms; no field Frobenius is being regarded as an invertible morphism of algebraic groups.
  First consider the stabilizer of one component in the pinned image of $S$. In the ordinary case its projection modulo diagrams to the field cyclic group has order $a$, where $a divides f$ is a $p$-power and $a lt.eq \| S \|$. Put $d = f \/ a$. On $a$ copies of the pinned group define
  $ R \( g_0 \, dots.h \, g_(a - 1) \) & = \( gamma \( g_(a - 1) \) \, g_0 \, dots.h \, g_(a - 2) \) \,\
F_a & = R "Fr"_r^d . $
  The Frobenius in the second formula acts on every coordinate. We have $R^a = gamma$ diagonally. Projection onto coordinate zero identifies $\( upright(bold(J))_0^a \)^(F_a)$ with $upright(bold(J))_0^(F_0)$: a fixed tuple is
  $ \( g \, "Fr"_r^d \( g \) \, dots.h \, "Fr"_r^(\( a - 1 \) d) \( g \) \) \, #h(2em) F_0 \( g \) = g . $
  On these tuples $R$ induces $"Fr"_r^(- d)$. Every diagram $delta$ centralizing $gamma$ acts diagonally and commutes with $R$. Thus the subgroup above the order-$a$ field image is represented with its exact presentation
  $ R^a = gamma \, #h(2em) \[ R \, delta \] = 1 \, $
  as well as the relations among the diagrams. The required pinned $p$-subgroup is the corresponding subgroup of this finite group. One does not replace $R$ by an order-$a$ permutation when $gamma eq.not 1$: the displayed wrap relation is essential. In particular mixed field–graph elements and their relations are retained.
  For $F_0 = tau^f$, the pinned automorphism group is cyclic. If its relevant subgroup has order $a$, use $a$ copies, the pure cyclic permutation $R$, and
  $ F_a = R tau^(f \/ a) . $
  Projection identifies the fixed points with those of $tau^f$, and $R$ induces $tau^(- f \/ a)$. The permutation is an algebraic automorphism even though $tau$ need not be one. Both constructions have a power of $F_a$ equal to a Frobenius endomorphism.
  For completeness, the passage from a component stabilizer to its orbit preserves relations. Choose a base component and, for every component in its orbit, an element of the pinned image transporting the base component to it. Use these transports to choose the identifications. If an element sends component $i$ to component $j$, its map in these identifications is the stabilizer element obtained by composing the inverse chosen transport to $j$, that element, and the chosen transport to $i$. Products of these maps satisfy the stabilizer multiplication law, by cancellation of the middle transports. Thus they act on the product of the copy models by permutations and the algebraic stabilizer operations just constructed. The resulting group is the actual pinned image of $S$, and is a $p$-group. The orbit size and all copy numbers are bounded by $\| S \|$.
  Apply the same construction to the adjoint groups. Their fixed points identify with the original inner-diagonal groups, and the action of the pinned image agrees with its original action. The given representatives consequently define elements of the asserted semidirect product. The standard faithful automorphism description ensures that a relation on the universal components has exactly its indicated inner image in this model. This also applies to the actions extended to the torus in the partial regular extension: the pinned relations hold there by construction. Hence the representative product $h_x h_y = n_(x y) h_(x y)$ still has that inner factor, rather than merely an unspecified inner automorphism. ◻
]

Write $b'$ for the resulting product block of $J$; it is $I$-stable. The number of original components and $\| S \|$ are bounded by Lemma 57. Thus the number of absolute components in the new model is bounded, although their classical ranks and the central torus rank need not be bounded.

=== 9.2 A central twist with an invariant parabolic <a-central-twist-with-an-invariant-parabolic>

Let $s in upright(bold(J))^(* F)$ be a semisimple $p'$-element such that $b'$ belongs to $cal(E)_p \( J \, s \)$. The partial regular extension ensures that

$ upright(bold(C)) = C_(upright(bold(J))^(*)) \( s \) $

is connected. Indeed its possible semisimple-centralizer component obstruction is $p$-primary, since the component group of $Z \( upright(bold(J)) \)$ is $p$-primary; the order of a component arising from $s$ also divides the order of $s$. These orders are coprime. This is the semisimple-centralizer component criterion, applied to the dual root datum; see [7] Corollary 2.9 and [56] Proposition 14.20. In the exceptional-isogeny cases the obstruction has no nontrivial points, as in Lemma 58.

#thm([Lemma 9.3.])[
  (The fixed central torus).  #emph[There exist an $F$-stable torus $upright(bold(V)) subset.eq Z^compose \( upright(bold(C)) \)$, a dual Levi subgroup 
$ upright(bold(L))^(*) = C_(upright(bold(J))^(*)) \( upright(bold(V)) \) \, $

 and a bounded positive integer $m_0$ such that 
$ upright(bold(C)) subset.eq upright(bold(L))^(*) \, #h(2em) z_m = s^(p^m - 1) in upright(bold(V)) quad upright("whenever ") m_0 divides m . $

 The $s$-transporters of the pinned image fix $upright(bold(V))$ pointwise. Each $z_m$ defines canonically a linear character $lambda_m$ of $L = upright(bold(L))^F$ of $p'$-order, through the quotient torus $upright(bold(L)) \/ \[ upright(bold(L)) \, upright(bold(L)) \]$.]
] <per:fixed-torus>

#proof[
  Diagonal automorphisms do not change a geometric series parameter. Since $b'$ is stable, each element of $Y'$ preserves the geometric class of $s$. Connectedness of $upright(bold(C))$ and Lang’s theorem imply that this geometric class contains a unique rational class. Hence
  $ H_s = { \( g \, y \) in upright(bold(J))^(* F) times.r Y' : g thin y \( s \) g^(- 1) = s } arrow.r Y' $
  is onto, with kernel $upright(bold(C))^F$. That kernel acts trivially on $upright(bold(V))_0 = Z^compose \( upright(bold(C)) \)$, so $H_s$ defines an action of $Y'$ on $upright(bold(V))_0$. This action commutes with $F$. Set
  $ upright(bold(V)) = \( upright(bold(V))_0^(Y') \)^compose . $
  In particular the action just defined is independent of all choices of transporters.
  We show that a bounded $p'$-power of $s$ lies in $upright(bold(V))_0$. Choose a maximal torus of $upright(bold(C))$, and let $X$ be its character lattice, $Q$ the ambient root lattice, and $Q_s$ the lattice generated by roots centralizing $s$. Since the primal derived group is simply connected, $Q$ is saturated in $X$. The torsion of $X \/ Q_s$ therefore injects into the torsion of $Q \/ Q_s$. In type A the subsystem is a product of equality packets, and its lattice is primitive in the ambient root lattice. In the classical signed-coordinate systems, orient each inverse-paired eigenvalue packet. A type-A packet then has its integral zero-sum lattice. On each residual B, C, or D packet, the lattice generated by the centralizing roots contains twice every integral coordinate vector in its rational span. Consequently the saturation quotient on each such packet has exponent dividing two; taking products does not enlarge this exponent. This proves a uniform exponent bound for classical components. On the exceptional components there are only finitely many root subsystems of the finitely many bounded root systems, so their saturation quotients also have bounded exponent. The bounded number of absolute components allows one common exponent.
  The character group of the component group of $Z \( upright(bold(C)) \)$ is the torsion just considered. Since $s$ is central in $upright(bold(C))$, there is therefore a bounded integer $l$, prime to $p$, with $s^l in upright(bold(V))_0$. We may discard the $p$-part of the exponent because $s$ has $p'$-order. This element is fixed by $Y'$. For any torus with a $Y'$-action, the norm morphism
  $ t mapsto product_(y in Y') y \( t \) $
  has connected image in the fixed torus. On a fixed element it is the $\| Y' \|$th power. Thus the group of components of the fixed torus on geometric points is killed by $\| Y' \|$, a $p$-power. Its element represented by $s^l$ has $p'$-order, and is trivial. Hence $s^l in upright(bold(V))$.
  Take $m_0$ with $p^(m_0) equiv 1 med \( mod med l \)$; for $l = 1$ take $m_0 = 1$. This is bounded, and proves the assertion about $z_m$. The torus $upright(bold(V))$ is $F$-stable, and its centralizer is an $F$-stable Levi. Since $upright(bold(V)) subset.eq Z \( upright(bold(C)) \)$, the Levi $upright(bold(L))^(*)$ contains $upright(bold(C))$. Moreover $upright(bold(V)) subset.eq Z^compose \( upright(bold(L))^(*) \)$. The natural duality
  $ Z^compose \( upright(bold(L))^(*) \) quad arrow.l.r quad upright(bold(L)) \/ \[ upright(bold(L)) \, upright(bold(L)) \] $
  associates to its rational point $z_m$ a linear character $lambda_m$ of $L$, trivial on the finite points of the algebraic derived subgroup. It has $p'$-order and takes values in $cal(O)$. This construction is functorial for the transporter operations. ◻
]

#thm([Lemma 9.4.])[
  (Common parabolic representatives).  #emph[The primal Levi $upright(bold(L))$ can be placed in a parabolic $upright(bold(Q))$ such that, for the subgroup $A_1$ of $I$ preserving $upright(bold(Q))$, $upright(bold(L))$, the rational $s$-series in $L$, and $lambda_m$, one has 
#[#set math.equation(numbering: n => "(9.2)")
 $ I = "Inn" \( J \) A_1 \, #h(2em) A_1 ∩ "Inn" \( J \) = "Inn" \( L \) . $ <per:parabolic-factorization>]

 Here inner groups mean their images in the algebraic automorphism group. Only $upright(bold(L))$ is required to be $F$-stable.]
] <per:parabolic>

#proof[
  Choose a cocharacter $nu$ of $upright(bold(V))$ outside the finitely many root hyperplanes which do not contain all of $upright(bold(V))$. Then $C_(upright(bold(J))^(*)) \( nu \) = upright(bold(L))^(*)$, and $nu$ specifies a parabolic $upright(bold(Q))^(*)$ with this Levi. Every element of $H_s$ fixes $upright(bold(V))$ pointwise, and hence preserves both this Levi and the positive root set of this parabolic. There is no requirement that $nu$ be $F$-fixed.
  Choose an $F$-stable Borel–torus pair in the connected group $upright(bold(C))$, and denote its torus by $upright(bold(T))^(*)$. The Lang–Steinberg theorem [56] Theorem 21.7 makes the rational Borel–torus pairs a single $upright(bold(C))^F$-orbit. Thus each $s$-transporter can be corrected by an element of $upright(bold(C))^F$ to normalize $upright(bold(T))^(*)$. Such a correction still fixes $upright(bold(V))$ pointwise. On this torus the transporter is a Weyl operation followed by its specified pinned operation, and commutes with the rational root datum endomorphism.
  Choose the matching rational primal torus $upright(bold(T))$. Root–coroot duality transfers the zero and positive root sets to a Levi and a parabolic $upright(bold(L)) subset.eq upright(bold(Q))$ of $upright(bold(J))$. Equivalently, an invariant rational positive definite form transfers the inequalities defined by $nu$ to primal coroot inequalities; a multiple clears denominators. The zero set is $F$-stable and is exactly the dual Levi root system. The transferred transporter preserves these positive and zero sets.
  We spell out why its primal representative can be rational. Its Weyl and pinned operation has a geometric representative in $upright(bold(J))_(upright("ad")) times.r Y'$. Compatibility with the rational torus endomorphism says that its discrepancy with $F$ lies in $upright(bold(T))_(upright("ad"))$. Lang’s theorem for this connected torus corrects that discrepancy without changing the root action or its positive set. This gives an element of $upright(bold(J))_(upright("ad"))^F times.r Y'$ preserving $upright(bold(Q)) \, upright(bold(L))$ and the indicated torus data. In particular it preserves the rational $s$-class and $lambda_m$.
  One may also prescribe its diagonal coset. For any rational maximal torus of $upright(bold(J))$, comparison of the exact sequences for
  $ Z \( upright(bold(J)) \) arrow.r upright(bold(T)) arrow.r upright(bold(T))_(upright("ad")) \, #h(2em) Z \( upright(bold(J)) \) arrow.r upright(bold(J)) arrow.r upright(bold(J))_(upright("ad")) $
  and Lang’s theorem for $upright(bold(T))$ and $upright(bold(J))$ give a surjection
  $ upright(bold(T))_(upright("ad"))^F arrow.r upright(bold(J))_(upright("ad"))^F \/ "im" \( J \) . $
  Multiplying the representative by such a torus element changes its diagonal coset arbitrarily and preserves the parabolic and Levi. Diagonal operations preserve geometric series and quotient-torus characters. Moreover $C_(upright(bold(L))^(*)) \( s \) = upright(bold(C))$ is connected, so preservation of the geometric class here is preservation of its unique rational class. Given an element of $I$, choose the diagonal coset to agree with that element. The resulting representative differs from it by an element of $"Inn" \( J \)$, and therefore belongs to $I$. This proves the first equality.
  Finally, the simultaneous normalizer of a parabolic and its chosen Levi in the connected group is the Levi itself. Therefore an inner operation of $J$ lies in $A_1$ exactly when its implementer lies in $L$. Elements of $L$ also preserve its $s$-class and linear character. This proves the second equality. ◻
]

=== 9.3 The integral comparison and its ordinary characters <the-integral-comparison-and-its-ordinary-characters>

The chosen Levi contains the full dual centralizer, and its parabolic admits the required automorphism representatives. These are the geometric inputs for an equivariant integral Morita equivalence. The remaining character calculation will return the Levi block after a bounded Frobenius power and a central linear twist.

#thm([Lemma 9.5.])[
  (Equivariant integral Levi equivalence).  #emph[There is an $A_1$-stable block $b_L$ of $cal(O) L$ and an integral Morita bimodule $U$ between $cal(O) J b'$ and $cal(O) L b_L$ with a strict $A_1$-action. For $ell in L$, the operator of $"ad" \( ell \) in A_1$ on $U$ is exactly 
#[#set math.equation(numbering: n => "(9.3)")
 $ u mapsto ell u ell^(- 1) . $ <per:br-inner>]

 Every central element of $J$ acts identically from the two sides of $U$.]
] <per:br>

#proof[
  We use the full-centralizer form of the integral Bonnafé–Rouquier theorem [10] Theorem B$'$, §11.4, also stated in [8] §7. Its hypotheses here are that $upright(bold(J))$ is connected reductive in characteristic $r eq.not p$, $F$ has a Frobenius power, $upright(bold(L))$ is an $F$-stable Levi of a parabolic $upright(bold(Q))$, $s$ is a rational semisimple $p'$-element, and $C_(upright(bold(J))^(*)) \( s \) subset.eq upright(bold(L))^(*)$. An $F$-stable parabolic is not required. All these hypotheses were established above. With $upright(bold(Q)) = upright(bold(L)) upright(bold(U))_Q$, the theorem gives the Morita bimodule in the single nonzero degree of the appropriate block cut of compactly supported cohomology of
  $ Y_(upright(bold(U))_Q) = { g upright(bold(U))_Q : g^(- 1) F \( g \) in upright(bold(U))_Q F \( upright(bold(U))_Q \) } . $
  Its degree is $dim upright(bold(U))_Q - dim \( upright(bold(U))_Q ∩ F \( upright(bold(U))_Q \) \)$.
  The construction is valid over the fixed unramified ring $cal(O)$. Indeed the group-algebra block idempotents are defined over some finite unramified Witt subring: lift their finite-residue-field idempotents uniquely. Construct the compactly supported integral cohomology complex and these cuts over that ring. After faithfully flat extension to a splitting discrete valuation ring the cited integral theorem gives concentration, projectivity on both sides, and the Morita evaluation isomorphisms. These properties descend by faithful flatness. Extending the descended construction to $W \( k \)$ gives $U$. Thus extension to splitting coefficients is used to test the equivalence, not as an assumption that the generic field of $W \( k \)$ contains $p$-power roots of unity.
  For $a in A_1$ the map $g upright(bold(U))_Q mapsto a \( g \) upright(bold(U))_Q$ is an actual automorphism of this variety. Using inverse pullback consistently gives a strict action on cohomology. The series cuts are preserved; since $b'$ is stable, equivariance of the block correspondence makes $b_L$ stable too. For $a = "ad" \( ell \)$, $ell in L$, this variety map is precisely the left action of $ell$ followed by the right action of $ell^(- 1)$. This proves the asserted identity. A central element of $J$, which lies in $L$, gives the identity variety map, proving central compatibility. ◻
]

#thm([Lemma 9.6.])[
  (Returning the Levi block).  #emph[After replacing $m_0$ by a bounded multiple $m$, one has 
#[#set math.equation(numbering: n => "(9.4)")
 $ sigma^m \( b_L \) = lambda_m b_L \, $ <per:levi-return>]

 in the convention that multiplication of ordinary characters by $lambda_m$ gives the block on the right. The character $lambda_m$ is still defined by $s^(p^m - 1)$ and is $A_1$-invariant.]
] <per:row-return>

#proof[
  Define an operation on the ordinary characters of $L$ by
  $ T \( chi \) = lambda_(m_0)^(- 1) sigma^(m_0) \( chi \) . $
  Coefficient Frobenius and twisting by a linear character both permute ordinary irreducible characters and their blocks. It therefore suffices to find a bounded positive integer $d$ such that $T^d$ fixes one ordinary irreducible character in $b_L$: its block then returns as well. We first bound row orbits after a regular embedding, then use restriction to return a row of $b_L$. At the end we check that the accumulated twist is precisely $lambda_(d m_0)$.
  For an ordinary character in $cal(E) \( L \, s t \)$, with $t$ a $p$-element of $C_(upright(bold(L))^(*)) \( s \)^F$, coefficient Frobenius sends the torus parameter to $s^(p^(m_0)) t$. The $p$-part is unchanged by our choice of the characteristic-zero extension of $sigma$. The Deligne–Lusztig character formula, whose Green functions are rational, gives the same statement for every uniform pairing. Thus $T$ returns the parameter to $s t$ and fixes its uniform pairings. This argument concerns actual pairings, not just the set of torus characters; compare [34] Lemma 3.6(i).
  #emph[Bounded row orbits after regular embedding.] Use a full regular embedding $upright(bold(L)) arrow.r.hook upright(bold(L))^dagger$ with connected center and compatible Steinberg endomorphism. The derived subgroup stays simply connected. The standard regular embedding construction applies also to Frobenius roots; in the exceptional-isogeny cases at issue the centers on points already have no obstruction. On dual groups the map
  $ pi : upright(bold(L))^(dagger *) arrow.r upright(bold(L))^(*) $
  has central torus kernel. Choose a character above a row of $b_L$, with parameter $s^dagger t^dagger$, where $s^dagger$ is its $p'$-part and $t^dagger$ its $p$-part. After rational conjugacy its $p'$-parameter projects to $s$. This rational adjustment is possible by connectedness of the centralizer and Lang’s theorem. Put
  $ z^dagger = \( s^dagger \)^(p^(m_0) - 1) . $
  Every root of $upright(bold(L))^(dagger *)$ has value one on $z^dagger$, by the root test already established on $upright(bold(L))^(*)$. Thus $z^dagger$ is central. The center of $upright(bold(L))^(dagger *)$ is connected because $\[ upright(bold(L))^dagger \, upright(bold(L))^dagger \]$ is simply connected. The associated linear character $lambda^dagger$ restricts to $lambda_(m_0)$. The operation
  $ T^dagger \( chi \) = \( lambda^dagger \)^(- 1) sigma^(m_0) \( chi \) $
  therefore preserves $cal(E) \( L^dagger \, s^dagger t^dagger \)$ and fixes each of its uniform pairings.
  Ordinary Jordan decomposition on these connected data identifies the pairings with the unipotent uniform pairings of the connected centralizer. Separate the ordinary classical factors from the bounded-rank exceptional factors. The latter include every factor with an exceptional graph-isogeny endomorphism, in particular the Suzuki type $zws^2 B_2$, and every triality factor. On the ordinary classical factors the pairings distinguish the irreducible unipotent characters, even up to scalar: type A is uniform, and for the ordinary types B, C, and D this is the Fourier separation of the symbol labels in Lemma 25. That separation concerns ordinary characters and is independent of the coefficient prime $p$. Every uniform pairing vector here is nonzero. Varying the torus test on one factor while fixing nonzero tests on the others shows that equality of product pairing vectors makes the corresponding factor vectors proportional. Lemma 25 then fixes all ordinary classical labels. Equality uniqueness for a centralizer consisting of such factors is also the ordinary character statement of [34] Lemma 3.7. Consequently there is at most one choice on each ordinary classical factor. Every remaining factor has bounded root system and one of finitely many rational twists, so its number of unipotent labels is bounded. There are boundedly many such factors. Adding central tori introduces no new unipotent labels. It follows that the orbit of $chi$ under $T^dagger$ has bounded length, independently of the ranks of the classical factors and of the field cardinalities. Frobenius-permuted factors are calculated on a representative with the composite endomorphism; the same reasoning applies to them.
  #emph[Restriction to the original Levi.] The upstairs operation $T^dagger$ has bounded row orbits, uniformly in rank and field size. For the chosen $lambda^dagger$, restriction satisfies
  $ "Res"_L #scale(x: 120%, y: 120%)[\(] T^dagger \( chi \) #scale(x: 120%, y: 120%)[\)] = T #scale(x: 120%, y: 120%)[\(] "Res"_L chi #scale(x: 120%, y: 120%)[\)] \, $
  because $lambda^dagger \|_L = lambda_(m_0)$ and coefficient Frobenius commutes with restriction. If $\( T^dagger \)^a$ fixes an upstairs row, then $T^a$ permutes its restriction constituents. We now distinguish the type of the original ambient components, rather than the centralizer factors used in the pairing argument. We are working on one $S$-orbit, so these original components have the same type.
  For a non-type-A orbit the number of distinct restriction constituents is bounded. For a common maximal torus of the primal groups $upright(bold(L)) subset.eq upright(bold(J))$, let $X$ be its character lattice and $Phi_L subset.eq Phi_J$ their root systems. The torsion in $X \/ bb(Z) Phi_L$ injects into the torsion in $X \/ bb(Z) Phi_J$: after making the Levi standard, the kernel $bb(Z) Phi_J \/ bb(Z) Phi_L$ is free on the omitted simple roots. The center component group of the Levi therefore has order bounded by that of the original non-A group, with a bounded product over the copies. The rational quotient
  $ \( upright(bold(L))^dagger \)^F \/ #scale(x: 120%, y: 120%)[\(] Z \( upright(bold(L))^dagger \)^F L #scale(x: 120%, y: 120%)[\)] $
  has bounded order by the central exact sequence and Lang’s theorem. Clifford theory bounds the number of restriction constituents by this order. A bounded power of $T^dagger$ fixes the upstairs row, so the same power of $T$ permutes only this bounded set of downstairs constituents. A further bounded power fixes a constituent belonging to $b_L$.
  For a type-A orbit this center-component bound need not hold. Choose a covering block of $b_L$ in $L^dagger$ and apply the preceding upstairs construction to a row
  $ chi^dagger in cal(E) \( L^dagger \, s^dagger \) $
  in that block. Such a row exists by the integral basic-set theorem for type A with connected center: intersect its basic set with the covering block. Its parameter projects to the prescribed $s$. The resulting $lambda^dagger$ still restricts to $lambda_(m_0)$, so the downstairs operation $T$ is unchanged. We claim that $"Res"_L chi^dagger$ is irreducible. The preimage
  $ pi^(- 1) \( C_(upright(bold(L))^(*)) \( s \) \) $
  is connected, since both its kernel and its quotient are connected. It centralizes $s^dagger$: a maximal torus and its root subgroups generate it, and their roots take value one on $s^dagger$ exactly when they do on $s$. Hence if $s^dagger u$ is conjugate to $s^dagger$, with $u in ker pi$, then any conjugating element is in this preimage and $u = 1$.
  The quotient linear characters of $L^dagger \/ L$ correspond faithfully to rational points of the dual kernel and act by these central multiplications on parameters. Only the trivial quotient character can therefore fix $chi^dagger$. Frobenius reciprocity and induction from a normal subgroup with abelian quotient give
  $ chevron.l "Res"_L chi^dagger \, "Res"_L chi^dagger #scale(x: 120%, y: 120%)[chevron.r] = \| { eta in "Irr" \( L^dagger \/ L \) : eta chi^dagger = chi^dagger } #scale(x: 120%, y: 120%)[\|] = 1 . $
  This proves the claim; equivalently one may use [60] Lemma 4.8. A covering block covers a single orbit of blocks of $L$. Since this restriction is irreducible and $L^dagger$-invariant, its block is the prescribed covered block $b_L$. Its orbit under $T$ is now bounded by the upstairs orbit, with no diagonal-index bound.
  In either case $T^d$ fixes a row of $b_L$ for a bounded positive integer $d$. Iteration has exactly the required twist prescription:
  $ product_(i = 0)^(d - 1) sigma^(i m_0) \( lambda_(m_0) \) = lambda_(d m_0) \, #h(2em) \( p^(m_0) - 1 \) sum_(i = 0)^(d - 1) p^(i m_0) = p^(d m_0) - 1 . $
  Indeed the first identity follows from torus duality and the second. Thus $lambda_(d m_0)^(- 1) sigma^(d m_0)$ fixes that row and hence its block. Taking this bounded multiple proves the assertion. The construction of Lemma 67 continues to make $lambda_m$ invariant under $A_1$. ◻
]

=== 9.4 Scalar overlap and the specified inner factors <scalar-overlap-and-the-specified-inner-factors>

#thm([Lemma 9.7.])[
  (Projective extension of the transports).  #emph[For the Lie-component orbit above there is an integral Morita bimodule $cal(M)_J$ between $sigma^m \( b' \)$ and $b'$ on which $I$ has covariance transports defined up to scalars in $cal(O)^times$. For every $g in J$ its inner transport agrees, modulo scalars, with 
$ E_g \( v \) = g v g^(- 1) . $

 Central $p$-elements act equally from both sides of $cal(M)_J$.]
] <per:scalar-overlap>

#proof[
  Put $A = cal(O) J b'$, $B = cal(O) L b_L$, and use primes for their $sigma^m$-images. By Lemma 70, multiplication of characters by $lambda_m$ identifies $B$ with $B'$. Let $T$ be the associated invertible $\( B' \, B \)$-bimodule. Explicitly its underlying left module is $B'$, and its right action uses the isomorphism
  $ f : B arrow.r B' \, #h(2em) g b_L mapsto lambda_m \( g \)^(- 1) g sigma^m \( b_L \) . $
  Let $U^or$ be a Morita inverse of the bimodule in Lemma 69. Then
  $ cal(M)_J = sigma^m \( U \) ⊗_(B') T ⊗_B U^or $
  is an $\( A' \, A \)$-Morita bimodule. Each factor has a strict $A_1$-action: on the outer factors this is the geometric action and its dual; on $T$ it is the action on its group basis, since $lambda_m$ is $A_1$-invariant. Hence their tensor product has a strict action, which we denote by $D_a$.
  The strict action of $A_1$ has been constructed. To extend it projectively to $I = "Inn" \( J \) A_1$, we must compare it with the actual inner operators on their common subgroup. The comparison on the intersection in Lemma 68 is explicit. If $ell in L$, the outer factors identify the geometric action with the actual left and inverse right action. On the middle factor the right action uses $f \( ell^(- 1) \) = lambda_m \( ell \) ell^(- 1)$, so
  #[#set math.equation(numbering: n => "(9.5)")
   $ D_("ad" \( ell \)) = lambda_m \( ell \)^(- 1) E_ell . $ <per:overlap-scalar>]
  All discrepancies therefore lie in the scalar units; no unit in the non-scalar part of the block center is introduced.
  The actual inner operators satisfy $E_g E_h = E_(g h)$ and $D_a E_g D_a^(- 1) = E_(a \( g \))$. By $I = "Inn" \( J \) A_1$, represent an element of $I$ as $"ad" \( g \) a$ and use $E_g D_a$. Any two such representations differ in the intersection $"Inn" \( L \)$, where the preceding formula shows that the two operators differ by a scalar. A central ambiguity in $g$ is also scalar: a central $p'$-element acts by its central character on each block, while a central $p$-element gives no discrepancy. For the latter assertion apply the displayed overlap formula to a central $p$-element $c$. Its algebraic inner operation is the identity and $lambda_m \( c \) = 1$, whence $E_c = "id"$. Covariance then shows that multiplication of the chosen operators agrees with multiplication in $I$ modulo scalars, as asserted. ◻
]

The adjective scalar in Lemma 71 is necessary. The following elementary observation identifies exactly how it is used, and records the role of the element-wise factor identity.

#thm([Lemma 9.8.])[
  (Removing the scalar defect).  #emph[Let $S$ be a finite $p$-group acting on two block algebras by crossed systems with the same group labels and respective factors $a_(x y) \, a'_(x y)$. Suppose that a nonzero Morita bimodule has invertible covariance maps $D_x$ such that 
$ D_x D_y \( v \) = c \( x \, y \) a'_(x y) D_(x y) \( v \) a_(x y)^(- 1) \, #h(2em) c \( x \, y \) in k^times . $

 If the factors obey their actual crossed-system identities, the maps can be rescaled to satisfy (9.1) exactly.]
] <per:scalar-cocycle>

#proof[
  Normalize $D_1 = "id"$. Compare $\( D_x D_y \) D_z$ and $D_x \( D_y D_z \)$. Covariance and
  $ a_(x y) a_(x y \, z) = alpha_x \( a_(y z) \) a_(x \, y z) \, #h(2em) a'_(x y) a'_(x y \, z) = alpha'_x \( a'_(y z) \) a'_(x \, y z) $
  cancel all the non-scalar factors. Because the $D_x$ are $k$-linear, the remaining equality is
  $ c \( x \, y \) c \( x y \, z \) = c \( y \, z \) c \( x \, y z \) . $
  Thus $c$ is an ordinary scalar $2$-cocycle, with trivial action on $k^times$. Positive-degree cohomology of $S$ is annihilated by $\| S \|$. The $\| S \|$th-power map on $k^times$ is an automorphism, since $k$ is algebraically closed of characteristic $p$. It induces an automorphism on this cohomology, which must therefore vanish. In particular $H^2 \( S \, k^times \) = 0$. Rescale $D_x$ by a scalar $1$-cochain trivializing $c$ to obtain the required maps. ◻
]

=== 9.5 Tensor products and central quotients <tensor-products-and-central-quotients>

The Lie-component comparison now has only scalar multiplication errors. We assemble it with the remaining component families, descend through the original central kernel, and only then remove the scalar error over $k$. Descending before invoking integral finiteness is essential because the lifted blocks may have unbounded defect.

#proof[
  On each cross-characteristic Lie orbit use Lemma 71. Choose a common bounded multiple of its comparison exponents. Passing to a multiple is legitimate: tensor successive Frobenius twists of the comparison bimodule and of its transports. The twist characters multiply according to the identity in Lemma 70; scalar projectivity and the equality of central $p$-actions are preserved. The number of orbits is bounded. Thus this choice still gives a bounded positive integer $m$.
  The other universal components are handled directly. For the finite list of groups, take a common Frobenius period of their block idempotents and use the identity bimodule, with the ordinary group operations as transports. Permuted isomorphic components use matching models, and permutation of tensor factors gives their transports. The finite list includes the bounded exceptional multipliers and automorphisms already removed from the Lie models.
  For the unbounded alternating family the universal cover is $2 . frak(A)_n$, outside a finite list. Every automorphism is induced by $2 . frak(S)_n$: use the automorphisms of $frak(A)_n$ and unique lifting to its universal cover [64] Theorem 2.3 and §§2.7.2–2.7.3. We give a uniform period that also handles the double cover. Let $u$ be an integer coprime to the exponent of $2 . frak(A)_n$. For $g in 2 . frak(A)_n$, its image and the image of $g^u$ have the same cycle type in $frak(S)_n$. For a suitable $t in 2 . frak(S)_n$ and the central involution $z$ this gives
  $ g^u = z^epsilon.alt t g t^(- 1) . $
  Since $u$ is odd,
  $ g^(u^2) = z^(epsilon.alt \( u + 1 \)) t^2 g t^(- 2) = t^2 g t^(- 2) \, #h(2em) t^2 in 2 . frak(A)_n . $
  Thus every square of a cyclotomic powering fixes every conjugacy class. The cyclotomic action of coefficient Frobenius is powering by such a unit $u$ (chosen to be $p$ on the $p'$-part and $1$ on the $p$-part of the exponent). Its square fixes all ordinary characters and hence all block idempotents. After making $m$ even, the identity block bimodule and its ordinary automorphism transports apply also to the alternating orbits. Blocks inflated from the simple quotient cause no change in this argument.
  On the factor $P$ take the identity bimodule for $cal(O) P$, with the given automorphism transports. On the central $p'$-group $Z$ a block is the rank-one character algebra for some character $theta$. Identify it with $cal(O)$ and compare it with the rank-one algebra for $sigma^m theta$. The representatives act trivially on $Z$, so use the identity transport; inner left/right discrepancies on this factor are scalars. These choices are compatible with permutation of the other tensor factors. On Lie orbits compatibility was built into a single product algebraic group and its actual variety actions, so no coherence choice between individual components is needed.
  Tensor all these bimodules over $cal(O)$. We now descend from the product cover, including its added direct central $p$-factors, to $macron(N)$. Here is the precise quotient argument. If a central $p$-element $c$ acts equally from the two sides of a Morita bimodule $V$, then
  $ \( c - 1 \) V = V \( c - 1 \) . $
  For the two-sided ideals generated by any collection of such elements, the Morita correspondence consequently matches the ideals. The quotient of $V$ by their common action is a Morita bimodule between the quotient algebras; this also follows by quotienting the Morita evaluation isomorphisms. Apply this to the added direct central $p$-factors and to the $p$-part of the old central kernel $D_0$. Every factor construction has the required equality, so the tensor product does too. For the $p'$-part of $D_0$, the chosen block lifts have trivial kernel character on both sides, including after Frobenius. This part of the kernel already acts trivially. No bound for $\| D_0 \|$ is required. The quotient is therefore the claimed integral Morita bimodule $cal(M)$.
  We now have the integral comparison on the original quotient group, where the defect bounds apply. It remains to recover the specified representative factors and normalize their scalar error after reduction. The covariance operators preserve the quotient ideals, and descend with it. On the product cover, products of the operators for $h_x$ and $h_y$ differ from that for $h_(x y)$ by the actual inner operator of a lift of $n_(x y)$, up to a scalar. This follows on each Lie orbit from Lemma 66 and Lemma 71, and on the remaining factors from their explicit ordinary transports. Choices of a lift differ by $D_0$; after descent their inner operators agree. Consequently on $cal(M)$ the product law is the specified law for $n_(x y)$ up to a scalar. The factors in $macron(N)$ satisfy the actual equality
  $ n_(x y) n_(x y \, z) = alpha_x \( n_(y z) \) n_(x \, y z) \, $
  by their construction from the chosen representatives. Reduce modulo $p$ and apply Lemma 72. The resulting normalized maps are exactly (9.1) and (9.1).
  All exponents used above depend only on the bounded number of components and copies, the order of $S$, the bounded exceptional root systems, and the finite exceptional group list. These data are bounded in terms of $p \, M$ by the extension reductions. The classical root-lattice exponent, the classical row separation, and the alternating powering argument were uniform in the ranks and field sizes. This proves the asserted uniformity and the proposition, including its trivial-subgroup case. ◻
]

=== 9.6 Extension of the coefficient field <sec:coefficient-extension>

The preceding argument works over $k = overline(bb(F))_p$. We finish by transferring its finite list to an arbitrary algebraically closed field of characteristic $p$. The block comparison is the coefficient-field argument of [58] Section 2.1; we recall the part needed here and combine it with scalar extension of Morita bimodules.

#thm([Lemma 9.9.])[
  (Coefficient extension).  #emph[Let $k = overline(bb(F))_p$, let $K$ be an algebraically closed field of characteristic $p$, and choose an embedding $k arrow.r.hook K$. For every finite group $G$, the map $k G arrow.r K G$ induces a bijection on block idempotents, sending $b$ to $b_K = 1 ⊗ b$. The blocks $k G b$ and $K G b_K = K ⊗_k k G b$ have the same defect groups as $p$-subgroups of $G$.]
  #emph[If finite-dimensional $k$-algebras $A$ and $A'$ are $k$-linearly Morita equivalent, then $K ⊗_k A$ and $K ⊗_k A'$ are $K$-linearly Morita equivalent.]
] <lem:coefficient-extension>

#proof[
  The center commutes with scalar extension:
  $ K ⊗_k Z \( k G \) tilde.eq Z \( K G \) . $
  Indeed, the center is the kernel of the map sending an element to its commutators with the finitely many elements of $G$, and field extension preserves kernels. Write $Z \( k G \) = product_i Z_i$ as a product of local finite-dimensional commutative $k$-algebras. Since $k$ is algebraically closed, each $Z_i$ has residue field $k$ and nilpotent radical. In $K ⊗_k Z_i$ the extended radical is nilpotent and the quotient is $K$, so this algebra is again local. Thus the primitive central idempotents correspond bijectively.
  For a $p$-subgroup $P lt.eq G$, the Brauer map deletes the coefficients outside $C_G \( P \)$, and hence
  $ "Br"_P^K \( 1 ⊗ b \) = 1 ⊗ "Br"_P^k \( b \) . $
  The map $k C_G \( P \) arrow.r K C_G \( P \)$ is injective. The two Brauer images are therefore nonzero for exactly the same $P$. Their maximal such $p$-subgroups, which are the defect groups by the convention in Section 2, are identical.
  For the Morita assertion, choose finite-dimensional inverse Morita bimodules $zws_(A') U_A$ and $zws_A V_(A')$. The $k$-linearity of the equivalence means that the left and right $k$-actions on these bimodules agree. The Morita evaluation isomorphisms are
  $ U ⊗_A V tilde.eq A' \, #h(2em) V ⊗_(A') U tilde.eq A . $
  Tensor them with $K$. The canonical base-change isomorphism
  $ \( K ⊗_k U \) ⊗_(K ⊗_k A) \( K ⊗_k V \) tilde.eq K ⊗_k \( U ⊗_A V \) $
  and its counterpart with $U \, V$ interchanged give the two Morita evaluation isomorphisms for the extended bimodules. Their compatibility with the bimodule actions and with one another is preserved by tensoring. Thus the extended bimodules give inverse $K$-linear tensor equivalences. ◻
]

#proof[
  First take $k = overline(bb(F))_p$. Proposition 65 supplies the hypothesis of Theorem 64. Together with Theorem 15, it proves finiteness over $k$. The integral comparisons in this section serve the finite-list argument for the base blocks; the final scalar normalization, and hence the assertion for arbitrary crossed extensions, is over $k$.
  Now fix an algebraically closed field $K$ of characteristic $p$ and choose an embedding $k arrow.r.hook K$. For the fixed bound $M$, choose blocks $A_1 \, dots.h \, A_t$ representing the finitely many $k$-linear Morita classes of blocks with defect-group order at most $M$. Every block $B$ of a finite group algebra $K G$ is, by Lemma 73, of the form $B = K ⊗_k B_0$ for a unique block $B_0$ of $k G$, and $B_0$ has the same defect groups as $B$. If their order is at most $M$, then $B_0$ is $k$-linearly Morita equivalent to some $A_i$. The same lemma extends this equivalence to a $K$-linear Morita equivalence between $B$ and $K ⊗_k A_i$. For this fixed field $K$, all required blocks are therefore represented by the finite list $K ⊗_k A_1 \, dots.h \, K ⊗_k A_t$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~L. Alperin, #emph[Local representation theory], in #emph[The Santa Cruz Conference on Finite Groups] (Santa Cruz, California, 1979), Proc. Sympos. Pure Math. #strong[37], American Mathematical Society, Providence, RI, 1980, 369--375.]
#bibitem([2])[Jianbei An and Charles W. Eaton, #emph[Morita equivalence classes of blocks with extraspecial defect groups $p_(+)^(1 + 2)$], Math. Z. #strong[311] (2025), article no.~12. #link("https://doi.org/10.1007/s00209-025-03791-x")[doi:10.1007/s00209-025-03791-x].]
#bibitem([3])[Teruaki Asai, #emph[Unipotent characters of $upright(S O)_(2 n)^plus.minus$, $upright(S p)_(2 n)$ and $upright(S O)_(2 n + 1)$ over $bb(F)_q$ with small $q$], Osaka J. Math. #strong[20] (1983), 631--643. #link("https://doi.org/10.18910/7124")[doi:10.18910/7124].]
#bibitem([4])[Teruaki Asai, #emph[Unipotent class functions of split special orthogonal groups $upright(S O)_(2 n)^(+)$ over finite fields], Comm. Algebra #strong[12] (1984), 517--615; #emph[The unipotent class functions on the symplectic groups and the odd orthogonal groups over finite fields], Comm. Algebra #strong[12] (1984), 617--645; #emph[The unipotent class functions of non-split finite special orthogonal groups], Comm. Algebra #strong[13] (1985), 845--924.]
#bibitem([5])[Michael Aschbacher, #emph[Finite Group Theory], second edition, Cambridge Studies in Advanced Mathematics #strong[10], Cambridge University Press, Cambridge, 2000. #link("https://doi.org/10.1017/CBO9781139175319")[doi:10.1017/CBO9781139175319].]
#bibitem([6])[A.~A. Beilinson, J. Bernstein, and P. Deligne, #emph[Faisceaux pervers], in #emph[Analyse et topologie sur les espaces singuliers, I] (Luminy, 1981), Astérisque #strong[100] (1982), 5--171. #link("https://www.numdam.org/item/AST_1982__100__1_0/")[NUMDAM].]
#bibitem([7])[Cédric Bonnafé, #emph[Quasi-isolated elements in reductive groups], preprint, 2004. #link("https://arxiv.org/abs/math/0402276v1")[arXiv:math/0402276v1].]
#bibitem([8])[Cédric Bonnafé, Jean-François Dat, and Raphaël Rouquier, #emph[Derived categories and Deligne--Lusztig varieties II], Ann. of Math. (2) #strong[185] (2017), no.~2, 609--670. #link("https://doi.org/10.4007/annals.2017.185.2.5")[doi:10.4007/annals.2017.185.2.5].]
#bibitem([9])[Cédric Bonnafé and Jean Michel, #emph[Computational proof of the Mackey formula for $q > 2$], J. Algebra #strong[327] (2011), 506--526. #link("https://doi.org/10.1016/j.jalgebra.2010.10.030")[doi:10.1016/j.jalgebra.2010.10.030].]
#bibitem([10])[Cédric Bonnafé and Raphaël Rouquier, #emph[Catégories dérivées et variétés de Deligne--Lusztig], Publ. Math. Inst. Hautes Études Sci. #strong[97] (2003), 1--59. #link("https://doi.org/10.1007/s10240-003-0013-3")[doi:10.1007/s10240-003-0013-3].]
#bibitem([11])[Richard Brauer and Walter Feit, #emph[On the number of irreducible characters of finite groups in a given block], Proc. Natl. Acad. Sci. USA #strong[45] (1959), no.~3, 361--365. #link("https://doi.org/10.1073/pnas.45.3.361")[doi:10.1073/pnas.45.3.361].]
#bibitem([12])[Patrick Brosnan, Jaehyun Hong, and Donggun Lee, #emph[Geometry of regular semisimple Lusztig varieties], preprint, 2025, revised July 15, 2026; to appear in J. Eur. Math. Soc. #link("https://arxiv.org/abs/2504.15868v3")[arXiv:2504.15868v3].]
#bibitem([13])[Carles Broto, Jesper M. Møller, and Bob Oliver, #emph[Automorphisms of fusion systems of finite simple groups of Lie type], Mem. Amer. Math. Soc. #strong[262] (2019), no.~1267. #link("https://doi.org/10.1090/memo/1267")[doi:10.1090/memo/1267].]
#bibitem([14])[Michel Broué, Gunter Malle, and Jean Michel, #emph[Generic blocks of finite reductive groups], Astérisque #strong[212] (1993), 7--92. #link("https://www.numdam.org/item/AST_1993__212__7_0/")[NUMDAM].]
#bibitem([15])[Michel Broué and Jean Michel, #emph[Blocs et séries de Lusztig dans un groupe réductif fini], J. Reine Angew. Math. #strong[395] (1989), 56--67.]
#bibitem([16])[Jonathan Brundan, Richard Dipper, and Alexander Kleshchev, #emph[Quantum linear groups and representations of $"GL"_n \( bb(F)_q \)$], Mem. Amer. Math. Soc. #strong[149] (2001), no.~706. #link("https://pages.uoregon.edu/brundan/papers/gl.pdf")[Author manuscript].]
#bibitem([17])[Marc Cabanes and Michel Enguehard, #emph[On blocks of finite reductive groups and twisted induction], Adv. Math. #strong[145] (1999), no.~2, 189--229. #link("https://doi.org/10.1006/aima.1998.1814")[doi:10.1006/aima.1998.1814].]
#bibitem([18])[Marc Cabanes and Michel Enguehard, #emph[Representation Theory of Finite Reductive Groups], New Mathematical Monographs #strong[1], Cambridge University Press, Cambridge, 2004. #link("https://doi.org/10.1017/CBO9780511542763")[doi:10.1017/CBO9780511542763].]
#bibitem([19])[Pierre Deligne and George Lusztig, #emph[Representations of reductive groups over finite fields], Ann. of Math. (2) #strong[103] (1976), no.~1, 103--161. #link("https://doi.org/10.2307/1971021")[doi:10.2307/1971021].]
#bibitem([20])[François Digne and Jean Michel, #emph[On Lusztig's parametrization of characters of finite groups of Lie type], Astérisque #strong[181--182] (1990), 113--156. #link("https://www.numdam.org/item/AST_1990__181-182__113_0/")[NUMDAM].]
#bibitem([21])[Richard Dipper and Jie Du, #emph[Harish-Chandra vertices], J. Reine Angew. Math. #strong[437] (1993), 101--130. #link("https://doi.org/10.1515/crll.1993.437.101")[doi:10.1515/crll.1993.437.101].]
#bibitem([22])[Richard Dipper and Peter Fleischmann, #emph[Modular Harish-Chandra theory I], Math. Z. #strong[211] (1992), 49--71. #link("https://doi.org/10.1007/BF02571417")[doi:10.1007/BF02571417].]
#bibitem([23])[Richard Dipper and Gordon James, #emph[Representations of Hecke algebras of general linear groups], Proc. London Math. Soc. (3) #strong[52] (1986), no.~1, 20--52. #link("https://doi.org/10.1112/plms/s3-52.1.20")[doi:10.1112/plms/s3-52.1.20].]
#bibitem([24])[Richard Dipper and Andrew Mathas, #emph[Morita equivalences of Ariki--Koike algebras], Math. Z. #strong[240] (2002), no.~3, 579--610. #link("https://doi.org/10.1007/s002090100371")[doi:10.1007/s002090100371].]
#bibitem([25])[Jie Du and Hebing Rui, #emph[Ariki--Koike algebras with semisimple bottoms], Math. Z. #strong[234] (2000), 807--830. #link("https://doi.org/10.1007/s002090050009")[doi:10.1007/s002090050009].]
#bibitem([26])[Charles W. Eaton, #emph[Blocks whose defect groups are Suzuki $2$-groups], J. Algebra #strong[664] (2025), 498--513. #link("https://doi.org/10.1016/j.jalgebra.2024.10.011")[doi:10.1016/j.jalgebra.2024.10.011].]
#bibitem([27])[Charles Eaton, Florian Eisele, Radha Kessar, Markus Linckelmann, and A.~A. Schaeffer Fry, #emph[On $2$-blocks with quaternion defect groups], preprint, 2026. #link("https://arxiv.org/abs/2608.12052v1")[arXiv:2608.12052v1].]
#bibitem([28])[Charles W. Eaton, Florian Eisele, and Michael Livesey, #emph[Donovan's conjecture, blocks with abelian defect groups and discrete valuation rings], Math. Z. #strong[295] (2020), 249--264. #link("https://doi.org/10.1007/s00209-019-02354-1")[doi:10.1007/s00209-019-02354-1].]
#bibitem([29])[Charles W. Eaton and Michael Livesey, #emph[Donovan's conjecture and blocks with abelian defect groups], Proc. Amer. Math. Soc. #strong[147] (2019), 963--970. #link("https://doi.org/10.1090/proc/14316")[doi:10.1090/proc/14316].]
#bibitem([30])[Florian Eisele, #emph[The Picard group of an order and Külshammer reduction], Algebr. Represent. Theory #strong[24] (2021), 505--518. #link("https://doi.org/10.1007/s10468-020-09957-x")[doi:10.1007/s10468-020-09957-x].]
#bibitem([31])[Florian Eisele, #emph[On the geometry of lattices and finiteness of Picard groups], J. Reine Angew. Math. #strong[782] (2022), 219--233. #link("https://doi.org/10.1515/crelle-2021-0064")[doi:10.1515/crelle-2021-0064].]
#bibitem([32])[Michel Enguehard, #emph[Towards a Jordan decomposition of blocks of finite reductive groups], preprint, 2013. #link("https://arxiv.org/abs/1312.0106v1")[arXiv:1312.0106v1].]
#bibitem([33])[Arnaud Eteve, #emph[Tilting representations of finite groups of Lie type], preprint, 2024, revised 2025. #link("https://arxiv.org/abs/2412.13326v2")[arXiv:2412.13326v2].]
#bibitem([34])[Niamh Farrell and Radha Kessar, #emph[Rationality of blocks of quasi-simple finite groups], Represent. Theory #strong[23] (2019), 325--349. #link("https://doi.org/10.1090/ert/530")[doi:10.1090/ert/530].]
#bibitem([35])[Paul Fong and Bhama Srinivasan, #emph[The blocks of finite general linear and unitary groups], Invent. Math. #strong[69] (1982), 109--153. #link("https://doi.org/10.1007/BF01389188")[doi:10.1007/BF01389188].]
#bibitem([36])[Meinolf Geck and Gerhard Hiss, #emph[Basic sets of Brauer characters of finite groups of Lie type], J. Reine Angew. Math. #strong[418] (1991), 173--188. #link("https://doi.org/10.1515/crll.1991.418.173")[doi:10.1515/crll.1991.418.173].]
#bibitem([37])[James A. Green, #emph[The characters of the finite general linear groups], Trans. Amer. Math. Soc. #strong[80] (1955), no.~2, 402--447. #link("https://doi.org/10.1090/S0002-9947-1955-0072878-2")[doi:10.1090/S0002-9947-1955-0072878-2].]
#bibitem([38])[Thomas J. Haines, #emph[Cellular pavings of fibers of convolution morphisms], Épijournal Géom. Algébrique #strong[9] (2025), article no.~9. #link("https://doi.org/10.46298/epiga.2024.12352")[doi:10.46298/epiga.2024.12352].]
#bibitem([39])[Gerhard Hiss, #emph[On a question of Brauer in modular representation theory of finite groups], RIMS Kôkyûroku #strong[1149] (2000), 21--29. #link("https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/1149-3.pdf")[Author article].]
#bibitem([40])[Gerhard Hiss and Radha Kessar, #emph[Scopes reduction and Morita equivalence classes of blocks in finite classical groups], J. Algebra #strong[230] (2000), 378--423. #link("https://doi.org/10.1006/jabr.2000.8319")[doi:10.1006/jabr.2000.8319].]
#bibitem([41])[Gerhard Hiss and Radha Kessar, #emph[Scopes reduction and Morita equivalence classes of blocks in finite classical groups II], J. Algebra #strong[283] (2005), 522--563. #link("https://doi.org/10.1016/j.jalgebra.2004.08.030")[doi:10.1016/j.jalgebra.2004.08.030].]
#bibitem([42])[Robert B. Howlett and Gustav I. Lehrer, #emph[Induced cuspidal representations and generalised Hecke rings], Invent. Math. #strong[58] (1980), 37--64. #link("https://doi.org/10.1007/BF01402273")[doi:10.1007/BF01402273].]
#bibitem([43])[James E. Humphreys, #emph[Defect groups for finite groups of Lie type], Math. Z. #strong[119] (1971), 149--152. #link("https://doi.org/10.1007/BF01109967")[doi:10.1007/BF01109967].]
#bibitem([44])[Thomas Jost, #emph[Morita equivalence for blocks of finite general linear groups], Manuscripta Math. #strong[91] (1996), 121--144. #link("https://doi.org/10.1007/BF02567944")[doi:10.1007/BF02567944].]
#bibitem([45])[Radha Kessar, #emph[Blocks and source algebras for the double covers of the symmetric and alternating groups], J. Algebra #strong[186] (1996), no.~3, 872--933. #link("https://doi.org/10.1006/jabr.1996.0400")[doi:10.1006/jabr.1996.0400].]
#bibitem([46])[Radha Kessar, #emph[A remark on Donovan's conjecture], Arch. Math. #strong[82] (2004), 391--394. #link("https://doi.org/10.1007/s00013-004-4880-8")[doi:10.1007/s00013-004-4880-8].]
#bibitem([47])[Radha Kessar and Gunter Malle, #emph[Lusztig induction and $ell$-blocks of finite reductive groups], Pacific J. Math. #strong[279] (2015), nos.~1--2, 269--298. #link("https://doi.org/10.2140/pjm.2015.279.269")[doi:10.2140/pjm.2015.279.269].]
#bibitem([48])[Burkhard Külshammer, #emph[Donovan's conjecture, crossed products and algebraic group actions], Israel J. Math. #strong[92] (1995), 295--306.]
#bibitem([49])[Serge Lang, #emph[Algebraic groups over finite fields], Amer. J. Math. #strong[78] (1956), 555--563.]
#bibitem([50])[Michael Larsen, Gunter Malle, and Pham Huu Tiep, #emph[The largest irreducible representations of simple groups], Proc. London Math. Soc. (3) #strong[106] (2013), 65--96. #link("https://doi.org/10.1112/plms/pds030")[doi:10.1112/plms/pds030]. #link("https://agag-malle.math.rptu.de/~malle/download/largedegs.pdf")[Revised author manuscript].]
#bibitem([51])[Yves Laszlo and Martin Olsson, #emph[The six operations for sheaves on Artin stacks I: Finite coefficients], Publ. Math. Inst. Hautes Études Sci. #strong[107] (2008), 109--168. #link("https://doi.org/10.1007/s10240-008-0011-6")[doi:10.1007/s10240-008-0011-6].]
#bibitem([52])[Yves Laszlo and Martin Olsson, #emph[The six operations for sheaves on Artin stacks II: Adic coefficients], Publ. Math. Inst. Hautes Études Sci. #strong[107] (2008), 169--210. #link("https://doi.org/10.1007/s10240-008-0012-5")[doi:10.1007/s10240-008-0012-5].]
#bibitem([53])[Markus Linckelmann, #emph[The Block Theory of Finite Group Algebras], Vols.~I and~II, London Mathematical Society Student Texts #strong[91] and #strong[92], Cambridge University Press, Cambridge, 2018. #link("https://doi.org/10.1017/9781108349321")[Vol.~I: doi:10.1017/9781108349321]\; #link("https://doi.org/10.1017/9781108349307")[Vol.~II: doi:10.1017/9781108349307].]
#bibitem([54])[Frank Lübeck and Gunter Malle, #emph[A Murnaghan--Nakayama rule for values of unipotent characters in classical groups], Represent. Theory #strong[20] (2016), 139--161. #link("https://arxiv.org/abs/1508.01627v4")[arXiv:1508.01627v4].]
#bibitem([55])[George Lusztig, #emph[Characters of Reductive Groups over a Finite Field], Annals of Mathematics Studies #strong[107], Princeton University Press, Princeton, NJ, 1984.]
#bibitem([56])[Gunter Malle and Donna Testerman, #emph[Linear Algebraic Groups and Finite Groups of Lie Type], Cambridge Studies in Advanced Mathematics #strong[133], Cambridge University Press, Cambridge, 2011. #link("https://doi.org/10.1017/CBO9780511994777")[doi:10.1017/CBO9780511994777].]
#bibitem([57])[OpenAI, #emph[Integral Donovan Finiteness over Witt Vectors], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Integral-Donovan-Finiteness-over-Witt-Vectors-September-25-2026/main.pdf")[OAI:Integral-Donovan-Finiteness-over-Witt-Vectors-September-25-2026], 2026.]
#bibitem([58])[OpenAI, #emph[The Blockwise Alperin Weight Conjecture], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Blockwise-Alperin-Weight-Conjecture-September-23-2026/paper.pdf")[OAI:The-Blockwise-Alperin-Weight-Conjecture-September-23-2026], 2026.]
#bibitem([59])[Jeremy Rickard, #emph[Finite group actions and étale cohomology], Publ. Math. Inst. Hautes Études Sci. #strong[80] (1994), 81--94. #link("https://doi.org/10.1007/BF02698896")[doi:10.1007/BF02698896].]
#bibitem([60])[A.~A. Schaeffer Fry, Jay Taylor, and C. Ryan Vinroot, #emph[Galois automorphisms and a unique Jordan decomposition in the case of connected centralizer], J. Algebra #strong[664] (2025), part~B, 123--149. #link("https://doi.org/10.1016/j.jalgebra.2024.10.017")[doi:10.1016/j.jalgebra.2024.10.017].]
#bibitem([61])[Joanna Scopes, #emph[Cartan matrices and Morita equivalence for blocks of the symmetric groups], J. Algebra #strong[142] (1991), no.~2, 441--455. #link("https://doi.org/10.1016/0021-8693(91)90319-4")[doi:10.1016/0021-8693(91)90319-4].]
#bibitem([62])[Britta Späth, #emph[Extensions of characters in type D and the inductive McKay condition, II], Invent. Math. #strong[242] (2025), 45--122. #link("https://doi.org/10.1007/s00222-025-01354-9")[doi:10.1007/s00222-025-01354-9].]
#bibitem([63])[Robert Steinberg, #emph[Automorphisms of finite linear groups], Canad. J. Math. #strong[12] (1960), 606--615. #link("https://doi.org/10.4153/CJM-1960-054-6")[doi:10.4153/CJM-1960-054-6].]
#bibitem([64])[Robert A. Wilson, #emph[The Finite Simple Groups], Graduate Texts in Mathematics #strong[251], Springer, London, 2009. #link("https://doi.org/10.1007/978-1-84800-988-2")[doi:10.1007/978-1-84800-988-2].]
#bibitem([65])[Xinwen Zhu, #emph[Tame categorical local Langlands correspondence], preprint, 2025. #link("https://arxiv.org/abs/2504.07482v1")[arXiv:2504.07482v1].]


