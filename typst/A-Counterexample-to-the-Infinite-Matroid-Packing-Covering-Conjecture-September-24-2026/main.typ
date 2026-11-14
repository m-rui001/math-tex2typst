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

#align(center)[#text(size: 16pt, weight: "bold")[A Counterexample to the Infinite Matroid \
Packing/Covering Conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A #emph[packing] of a family of matroids on a common ground set is a choice of pairwise disjoint spanning sets,
  one for each matroid. A #emph[covering] is a choice of independent sets, one for each matroid,
  whose union is the ground set. The infinite matroid packing/covering conjecture asks whether every family admits
  a partition of the ground set on which these two requirements can be satisfied in the following complementary senses.

Throughout, matroids are standard infinite matroids, with the maximal extension axiom recalled in Section 2.
  For a matroid $M$ on $E$ and $X subset.eq E$, write $M #h(-0.16667em) harpoon.tr X$ for restriction and

$ M . X := M \/ \( E \\ X \) = \( M^(*) #h(-0.16667em) harpoon.tr X \)^(*) $

for contraction onto $X$. A set is spanning if its closure is the whole ground set.
  A #emph[packing/covering partition] for $\( M_i : i in Theta \)$ is a partition $E =
  P accent(union C, ̇)$ together with sets $S_i subset.eq P$ and $I_i subset.eq C$ such that

$ S_i ∩ S_j & = diameter &  & \( i eq.not j \) \,\
"cl"_(M_i harpoon.tr P) \( S_i \) & = P &  & \( i in Theta \) \,\
I_i & upright(" is independent in ") M_i . C &  & \( i in Theta \) \,\
union.big_(i in Theta) I_i & = C . $

Bowler and Carmesin formulated the assertion that every set-indexed family has such a partition and established
  its relationship with infinite matroid intersection #cite(label("BowlerCarmesin2015")) Conjecture 1.3 and
  Corollary 3.9. We give a counterexample with two matroids.

#thm([Theorem 1.1.])[
  #emph[In ZFC, there exist a countably infinite set $E$ and two infinite matroids $M_0 \,
    M_1$ on $E$ such that $M_i^(*) = M_i$ on the same labelled ground set for $i = 0 \, 1$, and
$ I_0 union I_1 eq.not E quad upright("for every independent ") I_0 upright(" in ") M_0
  upright(" and independent ") I_1 upright(" in ") M_1 . $

 The pair $\( M_0 \, M_1 \)$ has no packing/covering partition.
   Consequently, the infinite matroid packing/covering conjecture is false.]
] <thm:main>

The last conclusion needs a separate argument: failure of a covering of $E$ alone does not rule out a mixed
  partition. For a self-dual pair, however, the spanning sets on $P$ and the independent sets in the contractions
  onto $C$ give disjoint spanning sets on $E$. Their complements are an independent covering.
  We prove this implication in Section 2 before constructing the counterexample.

=== Context and the local construction <context-and-the-local-construction>

The axioms of Bruhn, Diestel, Kriesell, Pendavingh and Wollan #cite(label("BDKPW2013")) provide an infinite
  matroid theory with restriction, contraction and duality.
  In particular, independent sets must extend to maximal independent sets inside #emph[every] prescribed subset of
  the ground set. This condition is a central part of our construction.

A matroid is #emph[uniform] if replacing any element of any basis by any element outside that basis again gives a
  basis. Bowler and Geschke #cite(label("BowlerGeschke2016")) Theorem 6 and the proof of Theorem 15 developed a
  basis criterion for infinite uniform matroids and constructed countable self-dual examples under Martin’s axiom
  for countable partially ordered sets, and hence under the continuum hypothesis.
  Their criterion combines an antichain of bases, invariance under balanced finite changes,
  and a basis existence condition for intervals of subsets.
  Our assembly also uses the complementary interval-recursion pattern of their Lemma 12,
  while verifying the full independent-set axioms directly.

Bowler and Geschke left open whether an infinite self-dual uniform matroid can be constructed in ZFC.
  Even without self-duality, ZFC existence of a uniform matroid of infinite rank and corank is recorded as open by
  Gollin and Joó #cite(label("GollinJoo2025")) Section 1.

Our local construction gives a self-dual uniform matroid $Q$ on a countable set in ZFC,
  with every basis and its complement infinite. It therefore answers both of these existence questions
  affirmatively. Its bases satisfy an additional ordinal inequality that obstructs independent coverings when
  copies of $Q$ are placed along a doubly infinite path. The two matroids in Theorem 1 are countably infinite
  direct sums of these copies. In Joó’s terminology, a direct sum of uniform matroids is #emph[partitional].
  His definition of uniformity is equivalent to requiring every subset to be independent or spanning
  #cite(label("Joo2021Partitional")) Definition 1.2 and Proposition 2.2, the property proved for $Q$ in Remark 21.
  Thus both matroids in our pair are partitional. This distinction matters:
  Joó proved an intersection theorem for an arbitrary infinite matroid paired with a direct sum of #emph[finitely
  many] uniform matroids, and asked whether intersection holds for two partitional matroids on a common countable
  ground set #cite(label("Joo2021Partitional")) Theorem 1.4 and Question 1.5.

For matroids $M \, N$ on a common ground set $E$, the pair #emph[satisfies intersection] if there is a set $J$
  independent in both matroids and a partition $J = J_M accent(union J, ̇)_N$ such that

$ "cl"_M \( J_M \) union "cl"_N \( J_N \) = E . $

The unrestricted infinite Matroid Intersection Conjecture asserts that every pair of matroids on a common,
  possibly infinite, ground set satisfies this property #cite(label("BowlerCarmesin2015")) Definition 3.5 and Section 7.

#thm([Corollary 1.2.])[
  #emph[The same pair $\( M_0 \, M_1 \)$ constructed in Theorem 1 consists of partitional matroids and does not
    satisfy intersection. More explicitly, for every set $J$ independent in both $M_0$ and $M_1$ and every
    partition $J = J_0 accent(union J, ̇)_1$,
$ "cl"_(M_0) \( J_0 \) union "cl"_(M_1) \( J_1 \) eq.not E . $

 Consequently, the unrestricted infinite Matroid Intersection Conjecture is false in ZFC.
   The pair also gives a negative ZFC answer to Joó’s Question 1.5 for two partitional matroids on a common
   countable ground set.]
] <cor:intersection>

#proof[
  Each $M_i$ is a direct sum of countably infinitely many copies of the uniform matroid $Q$, so it is partitional.
    Bowler and Carmesin #cite(label("BowlerCarmesin2015")) Proposition 3.6 prove that, for any matroids $M \,
    N$ on the same ground set,
  $ \( M \, N \) upright(" satisfies intersection") quad arrow.l.r.double quad \( M \, N^(*) \)
    upright(" has a packing/covering partition") . $
  Apply this equivalence with $M = M_0$ and $N = M_1$. Since $M_1^(*) = M_1$ on the same labelled ground set,
    the right-hand side concerns the identical pair $\( M_0 \, M_1 \)$ and is false by Theorem 1.
    Its common ground set is countable, so it also satisfies the hypotheses of Joó’s question. ◻
]

Bowler and Carmesin also formulated separate Covering and Packing conjectures.
  Their universal equivalences imply that both conjectures are false in ZFC;
  Section 7 gives the precise formulations and deduction. This consequence concerns universal statements about
  matroid families and does not identify their witnessing families with the pair $\( M_0 \, M_1 \)$.

The examples are neither finitary nor cofinitary. Here a matroid is #emph[finitary] if a set is independent
  whenever all its finite subsets are independent, and #emph[cofinitary] if its dual is finitary.
  Nash-Williams’ original intersection conjecture concerned finitary matroids;
  Aharoni and Ziv #cite(label("AharoniZiv1998")) gave an early published formulation.
  Joó proved intersection for two finitary matroids on a countable ground set #cite(label("Joo2021Countable"))
  Theorem 1.3. His subsequent packing/covering theorem allows every set-indexed family on a countable ground set
  whose members are direct sums of finitary and cofinitary matroids #cite(label("Joo2024Packing")) Theorem 1.2.
  The examples here have no nonempty finitary or cofinitary direct summand, as we show in Section 6,
  so they lie outside this mixed direct-sum class. Countability of the ground set is distinct from these
  structural hypotheses; the present result concerns unrestricted infinite matroids and does not refute
  Nash-Williams’ original finitary conjecture.

=== Proof overview <proof-overview>

We first construct an ultrafilter $cal(U)$ on a countable set $D$ and an ordinal-valued function $rho$ on its
  members. Call a subset of $D$ #emph[large] if it belongs to $cal(U)$.
  This auxiliary ordinal rank, distinct from matroid rank, satisfies $rho \( X \) gt.eq
  rho \( Y \)$ whenever $X subset.eq Y$ are large. On two labelled copies $L \, R$ of $D$,
  we construct a self-dual matroid $Q$ with the following property:
  if $B$ is a basis and its slice $B_L subset.eq D$ is large, then $D \\ B_R$ is large and

$ rho \( B_L \) > rho \( D \\ B_R \) . $

This is the property used at the end of the proof. To build the pair,
  join consecutive integer vertices by #emph[bundles], each a labelled copy of $D$,
  and place $Q$ on the two incident bundles at each vertex.
  Its $L$-coordinate points toward the central bundle between $- 1$ and $0$,
  and its $R$-coordinate points outward. The copies at even and odd vertices form $M_0$ and $M_1$, respectively.
  In a putative independent covering, one starts with the large side of a central bundle and follows the path
  outward. Each successive copy of $Q$ strictly decreases the ordinal rank, an impossibility.

Most of the proof constructs $Q$. Partition $D$ into rapidly growing finite blocks.
  The first ideal consists of subsets whose proportions in these blocks tend to zero.
  Within each equivalence class modulo this ideal, we define real-valued probes of a subset;
  a half-open interval condition on their lower or upper limits selects the bases.
  Finite changes shift these limits by their net cardinality, making basis exchange immediate.
  A separate interpolation argument supplies bases between suitable endpoints,
  including endpoints with infinite limits. This argument is the key to maximal extension.

A second, larger ideal permits the insertion of sets that preserve the ordinal inequalities while separating
  previously chosen classes. Independent binary columns supply these separating sets simultaneously for fewer than
  continuum many requirements. We then address every interval of subsets in a transfinite recursion,
  inserting complementary classes of bases when necessary. At each stage there are fewer than continuum many
  earlier requirements; no regularity assumption on the continuum is used.

Section 3 constructs the two ideals, the ultrafilter, the rank and the simultaneous reservations.
  Section 4 proves the interpolation properties within a single class.
  Section 5 assembles the classes and proves all the matroid axioms, including maximal extension.
  Section 6 places $Q$ along the path and completes the ordinal descent argument.
  Section 7 derives the separate universal Covering and Packing consequences.

== 2 Matroids and the self-dual reduction <sec:matroids>

We first record the infinite-matroid conventions and explain why, for a self-dual pair,
  it suffices to rule out an independent covering of the whole ground set. This reduction is essential:
  a mixed packing/covering partition need not be a packing or a covering on the whole set.

=== 2.1 Independence, closure, and duality <independence-closure-and-duality>

An infinite matroid on a set $F$ is a family $cal(I) subset.eq
  2^F$ satisfying the following axioms #cite(label("BDKPW2013")) Section 1.1:

*(I1)* $diameter in cal(I)$.
*(I2)* Every subset of a member of $cal(I)$ belongs to $cal(I)$.
*(I3)* If $I in cal(I)$ is not inclusion-maximal and $B in cal(I)$ is inclusion-maximal,
  there is an element $e in B \\ I$ such that $I union { e } in cal(I)$.
*(IM)* For every $I in cal(I)$ and $I subset.eq Y subset.eq F$, the family ${ J in cal(I) :
  I subset.eq J subset.eq Y }$ has an inclusion-maximal member.

The inclusion-maximal independent sets are the #emph[bases].
  In particular, (IM) requires maximal extensions inside every subset, not only inside $F$.

For a matroid $N = \( F \, cal(I) \)$ and $X subset.eq F$, its closure is

$ "cl"_N \( X \) = X union { e in F : upright("there is an independent ") I subset.eq X upright(" with ") I union
  { e } upright(" dependent") } . $

This operator is extensive, monotone, and idempotent #cite(label("BDKPW2013")) Theorem 4.2.
  A set $S$ is #emph[spanning] if $"cl"_N \( S \) = F$. Restrictions are matroids,
  and the complements of the bases of $N$ are the bases of its dual $N^(*)$ #cite(label("BDKPW2013")) Theorems 3.1
  and 3.4. We use

$ N . X = N \/ \( F \\ X \) = \( N^(*) #h(-0.16667em) harpoon.tr X \)^(*) $

for contraction onto $X$. Self-duality will always mean the equality $N = N^(*)$ on the same labeled ground set.

#thm([Lemma 2.1.])[
  #emph[Let $N$ be an infinite matroid on $F$.]
  + #emph[If $S subset.eq X subset.eq F$, then
$ "cl"_(N harpoon.tr X) \( S \) = "cl"_N \( S \) ∩ X . $

]
  + #emph[A subset $S subset.eq F$ is spanning if and only if it contains a basis of $N$.]
  + #emph[A subset $S subset.eq F$ is spanning in $N$ if and only if $F \\ S$ is independent in $N^(*)$.]
] <lem:closure-duality>

#proof[
  The first assertion follows directly from the closure definition:
    for $e in X$, independence of sets contained in $S union { e }$ is the same in $N$ and in its restriction to $X$.
  For the second, use (IM) to take a maximal independent subset $B$ of $S$.
    For every $e in S \\ B$, the set $B union { e }$ is dependent, so $S subset.eq "cl"_N \( B \)$.
    Monotonicity and idempotence therefore give
  $ "cl"_N \( B \) = "cl"_N \( S \) . $
  If $S$ is spanning, so is $B$. An independent spanning set is a basis:
    an independent extension by an element of its closure would contradict the defining independent witness for
    closure. Conversely, a basis spans, because adjoining any element outside it gives a dependent set;
    any set containing a basis consequently spans.
  If $S$ contains a basis $B$, then $F \\ S$ is contained in the dual basis $F \\ B$.
    Conversely, extend an independent $F \\ S$ to a basis $B^(*)$ of $N^(*)$ using (IM).
    The primal basis $F \\ B^(*)$ is contained in $S$. ◻
]

=== 2.2 From a mixed partition to an independent covering <from-a-mixed-partition-to-an-independent-covering>

#thm([Lemma 2.2.])[
  #emph[Let $N_0 \, N_1$ be matroids on the same set $F$, with $N_i = N_i^(*)$ on the same labels.
    Suppose there is a partition $F = P dot(union) C$, disjoint sets $S_0 \,
    S_1 subset.eq P$ spanning $N_0 #h(-0.16667em) harpoon.tr P \, N_1 #h(-0.16667em) harpoon.tr P$, respectively,
    and independent sets $I_i$ of $N_i . C$ such that $I_0 union I_1 = C$.
    Then $F$ can be covered by one independent set of each of $N_0 \, N_1$.]
] <lem:selfdual-reduction>

#proof[
  Self-duality gives
  $ N_i . C = \( N_i #h(-0.16667em) harpoon.tr C \)^(*) . $
  Thus $T_i = C \\ I_i$ spans $N_i #h(-0.16667em) harpoon.tr C$ by Lemma 3.
    Also $T_0 ∩ T_1 = C \\ \( I_0 union I_1 \) = diameter$. Consequently the two sets
  $ A_i = S_i union T_i wide \( i = 0 \, 1 \) $
  are disjoint. The restriction-closure identity shows that $P subset.eq "cl"_(N_i) \( S_i \)$ and $C subset.eq
    "cl"_(N_i) \( T_i \)$, so $A_i$ spans the full matroid $N_i$.
    Its complement $F \\ A_i$ is independent in $N_i^(*) = N_i$. Finally,
  $ \( F \\ A_0 \) union \( F \\ A_1 \) = F $
  because $A_0 ∩ A_1 = diameter$. ◻
]

We will construct a self-dual pair with no independent covering.
  Lemma 4 will then exclude every mixed packing/covering partition for that pair.

== 3 An ultrafilter rank and simultaneous reservations <sec:filters>

We construct two tools on a countable set. The first is an ordinal-valued function on an ultrafilter whose value
  can be increased while preserving a prescribed lower bound on the set.
  The second supplies two disjoint sets that meet each of fewer than continuum many prescribed sets in positive
  upper block density. These two tools will allow us to choose bases with an ordinal inequality while also
  separating them from all earlier choices.

=== 3.1 Blocks, columns, and two ideals <blocks-columns-and-two-ideals>

Let $frak(c) = 2^(ℵ_0)$, also regarded as its initial ordinal. For each integer $m gt.eq 0$, let

$ D_m = { m } times { 0 \, 1 }^({ 0 \, 1 }^m) \, wide D = product.co_(m gt.eq 0) D_m \, wide w_m = \| D_m \| =
  2^(2^m) . $

Thus $D$ is countably infinite. The tags $m$ make its finite blocks disjoint. Their sizes satisfy

#[#set math.equation(numbering: n => "(3.1)")
 $ w_m gt.eq 2 sum_(j < m) w_j wide \( m gt.eq 1 \) . $ <eq:block-growth>]

Indeed, equality holds for $m = 1$. If the inequality holds for $m$, then $2 sum_(j < m + 1) w_j lt.eq 3 w_m lt.eq
  w_m^2 = w_(m + 1)$, since $w_m gt.eq 4$.

The density-zero ideal on $D$ is

$ cal(J) = {X subset.eq D : frac(\| X ∩ D_m \|, w_m) arrow.r 0} . $

An ideal is a family closed under taking subsets and finite unions;
  we call a set #emph[positive] for the ideal if it does not belong to it.
  The displayed family is a proper ideal containing all finite sets.

Let $L$ and $R$ be labelled copies of $D$, and write $E_0 = L dot(union) R$.
  For $X subset.eq E_0$, its two slices, viewed as subsets of $D$, are denoted by $X_L$ and $X_R$.
  When writing lifts, we identify $E_0$ with $D times { L \, R }$.
  Write $W_m$ for the union of the two copies of $D_m$. The ideal $cal(J)_0$ on $E_0$ consists of the sets whose
  two slices belong to $cal(J)$. Equivalently,

$ X in cal(J)_0 quad arrow.l.r.double quad frac(\| X ∩ W_m \|, \| W_m \|) arrow.r 0 . $

This equivalence follows because the doubled-block density is the average of the two nonnegative slice densities.
  Complements are always taken in the relevant ground set, $D$ or $E_0$.

#thm([Lemma 3.1.])[
  (Independent columns).  #emph[There are subsets $A_t \, B_t \, G_t$ of $D$, indexed by $t < frak(c)$,
    with the following property. For any $r$ distinct columns from these three families and any prescribed
    membership pattern on them, the proportion of that pattern in $D_m$ is exactly $2^(- r)$ for all sufficiently
    large $m$.]
] <lem:columns>

#proof[
  Assign distinct infinite binary strings to all the columns; this is possible because $3 frak(c) = frak(c)$.
    For a column with string $h$, put $\( m \, f \)$ in that column precisely when $f \( h harpoon.tr m \) = 1$.
    The prefixes of any fixed finite list of distinct strings are distinct for all sufficiently large $m$.
    Prescribing the values of $f$ at these $r$ arguments leaves $2^(2^m - r)$ functions among the $2^(2^m)$
    choices in $D_m$, proving the assertion. ◻
]

We need a larger ideal in addition to $cal(J)$. Define

#[#set math.equation(numbering: n => "(3.2)")
 $ cal(K) = {X subset.eq D : X ∩ ⋂_(t in F) A_t in cal(J) upright(" for some finite ") F subset.eq frak(c)} \,
   $ <eq:larger-ideal>]

where an empty intersection is $D$. This is the ideal generated by $cal(J)$ and the complements $A_t^c$.
  To see the equivalence, split $X$ into its intersection with the positive $A$-columns in (3.2) and its remaining
  part, which is covered by their complements. In particular $cal(J) subset.eq cal(K)$.
  Lemma 5 shows that $D in.not cal(K)$, so this ideal is proper.

We will repeatedly use the following consequence. A consistent finite pattern prescribing positive membership in
  $A$-columns and arbitrary signs in $G$-columns is $cal(K)$-positive.
  Intersecting such a pattern with any further finitely many positive $A$-columns still gives a pattern with a
  fixed positive eventual density, so (3.2) excludes membership in $cal(K)$.

Write $X subset.eq_(cal(K)) Y$ if $X \\ Y in cal(K)$. On $E_0$,
  let $cal(K)_0$ be the ideal of sets whose two slices belong to $cal(K)$. Thus $cal(J)_0 subset.eq cal(K)_0$.
  The distinction between these ideals matters: changes in $cal(K)_0$ will preserve an ordinal condition,
  whereas differences positive for $cal(J)_0$ will keep the resulting bases incomparable.

=== 3.2 The ultrafilter and its ordinal rank <the-ultrafilter-and-its-ordinal-rank>

An ultrafilter $cal(U)$ on $D$ is a proper filter that contains exactly one of $X$ and $D \\ X$ for every $X
  subset.eq D$.

#thm([Lemma 3.2.])[
  #emph[There is an ultrafilter $cal(U)$ on $D$ disjoint from $cal(K)$, containing every $G_t$, and satisfying
#[#set math.equation(numbering: n => "(3.3)")
 $ X in cal(U) quad arrow.r.double quad { t < frak(c) : X subset.eq_(cal(K)) G_t } upright(" is finite") .
   $ <eq:finitely-many-columns>]

]
] <lem:ultrafilter>

#proof[
  Call $Z subset.eq D$ forbidden if it is contained modulo $cal(K)$ in infinitely many of the $G_t$.
    Require a filter to contain all complements of members of $cal(K)$, all $G_t$,
    and all complements of forbidden sets. We verify the finite-intersection property.
  Combine the finitely many $cal(K)$-small exclusions into one set $N in cal(K)$.
    Let $F$ be the finite set of required positive $G$-indices, and let $Z_1 \, dots.h \,
    Z_q$ be the forbidden sets to exclude. For each $j$, choose an index $t_j$ such that $Z_j \\ G_(t_j) in
    cal(K)$, with the $t_j$ distinct and outside $F$. Each $Z_j$ has infinitely many witnessing indices,
    so these choices are possible. The pattern
  $ P = ⋂_(t in F) G_t ∩ ⋂_(j = 1)^q G_(t_j)^c $
  is $cal(K)$-positive. Moreover $P ∩ Z_j subset.eq Z_j \\ G_(t_j) in cal(K)$. It follows that
  $ P \\ (N union union.big_(j = 1)^q Z_j) $
  is still $cal(K)$-positive: otherwise $P$ would be a finite union of members of $cal(K)$.
    This nonempty set lies in the required finite intersection.
    Extend the resulting proper filter to an ultrafilter by the ultrafilter lemma.
    It contains no member of $cal(K)$ and no forbidden set, as required. ◻
]

Fix such an ultrafilter. Call its members #emph[large] and its nonmembers #emph[small].
  Small in this sense does not mean membership in either ideal.
  Every large set is $cal(J)$-positive, and every complement of a $cal(K)$-set is large.

List all large subsets of $D$ as $\( F_xi \)_(xi < frak(c))$, allowing repetitions if needed.
  For a large set $X$, define

#[#set math.equation(numbering: n => "(3.4)")
 $ rho \( X \) = min { xi < frak(c) : F_xi subset.eq_(cal(K)) X } . $ <eq:ordinal-rank>]

The set of indices is nonempty because $X$ occurs in the list.
  This is an auxiliary ordinal rank, distinct from matroid rank.

#thm([Lemma 3.3.])[
  (Rank invariance and monotonicity).  #emph[If $X triangle.stroked.t Y in cal(K)$,
    then $X$ is large if and only if $Y$ is large, and in that case $rho \( X \) = rho \( Y \)$.
    If $X \, Y$ are large and $X subset.eq_(cal(K)) Y$, then $rho \( X \) gt.eq rho \( Y \)$.]
] <lem:rank>

#proof[
  The complement of $X triangle.stroked.t Y$ belongs to $cal(U)$.
    Intersecting it with either large set gives a large subset of the other, proving invariance of largeness.
    The two sets have exactly the same candidate indices in (3.4), proving rank invariance.
    Finally, $F_xi subset.eq_(cal(K)) X$ and $X subset.eq_(cal(K)) Y$ imply $F_xi subset.eq_(cal(K))
    Y$ by closure of the ideal under finite unions. Taking minima proves the last assertion. ◻
]

The next property supplies large sets of arbitrarily high rank inside any interval whose lower endpoint is small
  and upper endpoint is large.

#thm([Lemma 3.4.])[
  (Rank-raising thinning).  #emph[Let $s subset.eq X subset.eq D$, with $s$ small and $X$ large,
    and let $gamma < frak(c)$. There is a large set $u$ such that
$ s subset.eq u subset.eq X \, wide rho \( u \) > gamma . $

]
] <lem:thinning>

#proof[
  For every $xi lt.eq gamma$, the set $Y_xi = F_xi ∩ \( X \\ s \)$ is large.
    By (3.3), it is contained modulo $cal(K)$ in only finitely many $G_t$.
    The union of these finite sets of indices has cardinal at most $max \( ℵ_0 \, \| gamma + 1 \| \) < frak(c)$.
    Choose $t$ outside that union and put
  $ u = s union \( X ∩ G_t \) . $
  Then $u$ is large and lies between $s$ and $X$. If $F_xi subset.eq_(cal(K)) u$ for some $xi lt.eq gamma$, then
  $ Y_xi \\ G_t = F_xi ∩ X ∩ s^c ∩ G_t^c subset.eq F_xi \\ u in cal(K) \, $
  contrary to the choice of $t$. Thus $rho \( u \) > gamma$. ◻
]

This counting argument does not require regularity of $frak(c)$.
  For any fixed cardinal $lambda < frak(c)$, a union of $lambda$ finite sets has cardinal at most
  $max \( lambda \, ℵ_0 \) < frak(c)$. We will use this same estimate at each stage of a recursion of length $frak(c)$.

=== 3.3 Two simultaneous reservations <two-simultaneous-reservations>

The ordinal rank is unchanged by $cal(K)$-small changes. We now show that such changes can nevertheless meet many
  prescribed sets in a way that remains positive for the smaller ideal $cal(J)$.
  For $t < frak(c)$, define the following subsets of $E_0$, using the same labels in both copies:

$ H_(t \, 0) = \( A_t^c ∩ B_t^c \) times { L \, R } \, wide H_(t \, 1) = \( A_t^c ∩ B_t \) times { L \, R } . $

They are disjoint, and both belong to $cal(K)_0$ because their slices lie in $A_t^c$.

#thm([Lemma 3.5.])[
  (Simultaneous reservations).  #emph[Let $cal(S)$ be a family of fewer than $frak(c)$ subsets of $E_0$,
    each positive for $cal(J)_0$. There is an index $t < frak(c)$ such that
$ S ∩ H_(t \, 0) in.not cal(J)_0 quad upright("and") quad S ∩ H_(t \, 1) in.not cal(J)_0 wide \( S in cal(S) \) . $

]
] <lem:reservations>

#proof[
  Fix first one $cal(J)_0$-positive set $S$. Choose $epsilon.alt >
    0$ such that the proportion of $S$ in $W_m$ is at least $epsilon.alt$ for infinitely many $m$.
    Call an index $t$ bad for $S$ if at least one of $S ∩ H_(t \, 0)$ and $S ∩ H_(t \, 1)$ belongs to $cal(J)_0$.
    We prove that only finitely many indices are bad.
  Choose any finite list of distinct bad indices $t_1 \, dots.h \, t_q$, and for each $i$ choose $k_i in { 0 \,
    1 }$ with $S ∩ H_(t_i \, k_i) in cal(J)_0$. Put $H_i = H_(t_i \, k_i)$.
    These cells use $2 q$ distinct $A$- and $B$-columns. Avoiding $H_i$ allows three of the four membership
    patterns on its two columns. Lemma 5 therefore gives $3^q$ avoiding patterns out of $4^q$ equally frequent
    patterns in every sufficiently late block. Duplicating the cells on the two copies does not change these
    proportions. In particular,
  $ frac(\| W_m \\ union.big_(i = 1)^q H_i \|, \| W_m \|) = (3 / 4)^q $
  for all sufficiently large $m$. Every point of $S ∩ W_m$ either avoids all these cells or lies in one of the
    failing intersections, so
  $ frac(\| S ∩ W_m \|, \| W_m \|) lt.eq (3 / 4)^q + sum_(i = 1)^q frac(\| S ∩ H_i ∩ W_m \|, \| W_m \|) . $
  Each summand tends to zero. Along the infinite subsequence on which $S$ has density at least $epsilon.alt$,
    this gives $epsilon.alt lt.eq \( 3 \/ 4 \)^q$. Since $\( 3 \/ 4 \)^q arrow.r 0$,
    the size of any finite list of bad indices is bounded. Hence only finitely many indices are bad.
  For the family $cal(S)$, take the union of these finite sets of bad indices.
    Its cardinal is less than $frak(c)$ by the estimate following Lemma 8.
    Any index outside that union works simultaneously for every $S in cal(S)$.
    If the family is empty, any index works. ◻
]

== 4 Bases within a density-zero class <sec:local-bases>

We now construct families of candidate bases within one equivalence class modulo $cal(J)_0$.
  The purpose is twofold: balanced finite changes must preserve the family,
  and intervals of subsets must contain or lie on one side of a member of the family.
  The latter property will supply maximal independent extensions in the eventual matroid.

Fix $T subset.eq E_0$ such that $T$ and $T^c$ are $cal(J)_0$-positive, and put

$ cal(C) \( T \) = { X subset.eq E_0 : X triangle.stroked.t T in cal(J)_0 } . $

We use $T$ as the chosen representative, or #emph[prototype], of this class.
  Every member of $cal(C) \( T \)$ and its complement are $cal(J)_0$-positive.
  Indeed, an ideal-small member, together with its ideal-small symmetric difference from $T$,
  would make $T$ ideal-small; the same argument applies to complements.

For $n gt.eq 1$ and $m gt.eq 0$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ V_n & = union.big_(m < n) W_m \, wide c_n = \| V_n \| \,\
p_n^T \( X \) & = \| X ∩ V_n \| - \| T ∩ V_n \| \,\
d_m^T \( X \) & = frac(\| X ∩ W_m \| - \| T ∩ W_m \|, \| W_m \|) \,\
f_n^T \( X \) & = p_n^T \( X \) + c_n (sup_(m gt.eq n) d_m^T \( X \) + inf_(m gt.eq n) d_m^T \( X \)) . $ <eq:probes>]

These quantities are defined for $X in cal(C) \( T \)$. The prefix count records a finite modification exactly
  once its affected blocks lie in $V_n$. The tail extrema allow later-block changes to influence earlier probes,
  and their sum changes sign when both $X$ and $T$ are complemented. Write

$ ell_T \( X \) = liminf_(n arrow.r oo) f_n^T \( X \) \, wide h_T \( X \) = limsup_(n arrow.r oo) f_n^T \( X \) \, $

allowing infinite values, and define two families

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(B)^(-) \( T \) & = { X in cal(C) \( T \) : - 1 < ell_T \( X \) lt.eq 0 } \,\
cal(B)^(+) \( T \) & = { X in cal(C) \( T \) : 0 lt.eq h_T \( X \) < 1 } . $ <eq:local-bases>]

We call these the lower-limit and upper-limit rules, respectively.
  In this section, a basis for a rule means a member of the indicated family; no matroid is asserted yet.

=== 4.1 Probe estimates and continuity <probe-estimates-and-continuity>

#thm([Lemma 4.1.])[
  (Probe properties).  #emph[For $X \, Y in cal(C) \( T \)$ the following statements hold.]
  + #emph[$d_m^T \( X \) arrow.r 0$ and $p_n^T \( X \) \/ c_n arrow.r 0$.]
  + #emph[If $X subset.eq Y$, then
#[#set math.equation(numbering: n => "(4.3)")
 $ f_n^T \( Y \) - f_n^T \( X \) gt.eq \| \( Y \\ X \) ∩ V_n \| . $ <eq:probe-monotone>]

]
  + #emph[Adding or deleting one element changes every probe by at most one.
    A finite modification with net change $b$ in cardinality satisfies $f_n^T \( Y \) = f_n^T \( X \) +
    b$ for all sufficiently large $n$.]
  + #emph[Complementation gives
$ f_n^(T^c) \( X^c \) = - f_n^T \( X \) \, wide cal(B)^(+) \( T^c \) = { B^c : B in cal(B)^(-) \( T \) } . $

]
] <lem:probe-properties>

#proof[
  The first density limit follows from $X triangle.stroked.t T in cal(J)_0$.
    Also $p_n^T \( X \) = sum_(m < n) \| W_m \| d_m^T \( X \)$.
    For any $epsilon > 0$, the terms after a fixed index have absolute density at most $epsilon$;
    their contribution divided by $c_n$ is at most $epsilon$,
    and the finite initial contribution divided by $c_n$ tends to zero.
  Inclusion increases each block count, hence both tail extrema;
    the prefix increases by $\| \( Y \\ X \) ∩ V_n \|$. This proves the second assertion.
    If an element changes in a block $W_k$ with $k < n$, only the prefix changes.
    If $k gt.eq n$, each tail extremum changes by at most $1 \/ \| W_k \|$. By (3.1),
  $ \| W_k \| gt.eq 2 sum_(m < k) \| W_m \| gt.eq 2 c_n \, $
  so the total change is at most one. After every block affected by a finite modification is in the prefix,
    the tails agree and the prefix changes by exactly $b$.
  Finally, complementing both $X$ and $T$ negates every prefix and block density.
    The supremum of the negatives is the negative infimum, and vice versa.
    This proves the last assertion, including its half-open endpoint conventions. ◻
]

The next continuity statement is needed both to stop finite deletion procedures and to pass to their decreasing
  limit. Its common density-zero bound is essential to controlling the tail extrema.

#thm([Lemma 4.2.])[
  (Continuity within a fixed interval).  #emph[Suppose $I subset.eq X_k subset.eq Y$ for $k gt.eq 1$, where $I \,
    Y in cal(C) \( T \)$, and membership of every element in $X_k$ eventually agrees with its membership in a set
    $X$. Then $X in cal(C) \( T \)$ and, for every fixed $n gt.eq 1$,
$ f_n^T \( X_k \) arrow.r f_n^T \( X \) . $

]
] <lem:block-continuity>

#proof[
  We have $I subset.eq X subset.eq Y$ and $Y \\ I in cal(J)_0$, so $X in cal(C) \( T \)$.
    On every fixed finite union of blocks, $X_k$ eventually agrees with $X$. On the remaining blocks,
  $ \| d_m^T \( X_k \) - d_m^T \( X \) \| lt.eq frac(\| \( Y \\ I \) ∩ W_m \|, \| W_m \|) \, $
  uniformly in $k$, and the right-hand side tends to zero. Thus the sequences of block densities converge
    uniformly in $m$. Supremum and infimum over a fixed tail change by at most the uniform difference,
    while the fixed prefix eventually stabilizes. Formula (4.1) gives the result. ◻
]

#thm([Lemma 4.3.])[
  (Antichains and finite changes).  #emph[Each family $cal(B)^(-) \( T \)$ and $cal(B)^(+) \( T \)$ contains $T$,
    is an antichain under inclusion, and is preserved by finite modifications that add and delete equally many
    elements.]
] <lem:local-antichain>

#proof[
  The probes of $T$ vanish. Balanced finite changes preserve the class and eventually preserve every probe,
    so they preserve either rule.
  Suppose $X subset.neq Y$ both satisfy the lower-limit rule.
    A finite difference of cardinality $k gt.eq 1$ gives $ell_T \( Y \) = ell_T \( X \) + k > 0$, a contradiction.
    For an infinite difference, $\| \( Y \\ X \) ∩ V_n \| arrow.r oo$.
    The probes of $X$ are eventually bounded below because their lower limit is finite,
    so Lemma 10 implies $f_n^T \( Y \) arrow.r oo$, again a contradiction.
    The upper-limit case follows by complementing and using the lower-limit rule for $T^c$. ◻
]

=== 4.2 Modifications from a positive pool <modifications-from-a-positive-pool>

To interpolate between subsets, we need to move the limiting probes in either direction while remaining in
  $cal(C) \( T \)$. A positive pool of available elements suffices, even though we use only a density-zero subset of it.

#thm([Lemma 4.4.])[
  (Small modifications with divergent probes).  #emph[Let $X in cal(C) \( T \)$.
    If $G subset.eq X^c$ is $cal(J)_0$-positive, there is $P subset.eq
    G$ in $cal(J)_0$ such that $f_n^T \( X union P \) arrow.r + oo$.
    If $G subset.eq X$ is $cal(J)_0$-positive, there is $P subset.eq
    G$ in $cal(J)_0$ such that $f_n^T \( X \\ P \) arrow.r - oo$.]
] <lem:positive-pool>

#proof[
  For additions, choose $delta > 0$ such that $G$ has density at least $delta$ in arbitrarily late blocks.
    Suppress the superscript $T$, put $a_n = sup_(m gt.eq n) \| d_m \( X \) \|$,
    and choose strictly increasing positive integers $N_j$ such that, for $n gt.eq N_j$,
  #[#set math.equation(numbering: n => "(4.4)")
   $ frac(\| p_n \( X \) \|, c_n) + 2 a_n + 1 / sqrt(c_n) lt.eq 2^(- j) . $ <eq:spike-cutoff>]
  This is possible by Lemma 10.
  For each sufficiently large $j$, put $b_j = 2^(1 - j) < delta$ and choose an increasing sequence of blocks $m_j
    gt.eq N_(j + 1)$ in which $G$ has density at least $delta$, also requiring $1 \/ \| W_(m_j) \| lt.eq delta -
    b_j$. From $G ∩ W_(m_j)$ select exactly $ceil.l b_j \| W_(m_j) \| ceil.r$ elements.
    Rounding is possible because this number is at most $delta \| W_(m_j) \|$.
    Let $P$ be the union of these selections. Its nonzero block densities lie between $b_j$ and $b_j +
    1 \/ \| W_(m_j) \|$, and hence tend to zero. Thus $P in cal(J)_0$.
  If $N_j lt.eq n < N_(j + 1)$, the selected block $m_j$ belongs to the tail in (4.1).
    The tail supremum for $X union P$ is at least $b_j - a_n$, and its tail infimum is at least $- a_n$.
    The prefix can only increase. Therefore (4.4) gives
  $ frac(f_n \( X union P \), c_n) gt.eq - frac(\| p_n \( X \) \|, c_n) + b_j - 2 a_n gt.eq 1 / sqrt(c_n) . $
  These intervals contain every sufficiently large $n$, proving divergence to $+ oo$.
    Apply the addition statement to $X^c$ and $T^c$, and use complement symmetry, to obtain the deletion statement. ◻
]

=== 4.3 Interpolation and interval alternatives <interpolation-and-interval-alternatives>

The finite-change rule rounds any finite limiting value into the interval $\( - 1 \, 0 \]$.
  The remaining case has opposite infinite limits at the two endpoints.
  We handle it by finite deletions whose effect on earlier probes is summable.

#thm([Lemma 4.5.])[
  (Interpolation).  #emph[If $I subset.eq Y$ are in $cal(C) \( T \)$, $ell_T \( I \) lt.eq - 1$,
    and $ell_T \( Y \) > 0$, then there is $B in cal(B)^(-) \( T \)$ with $I subset.eq B subset.eq Y$.]
] <lem:local-interpolation>

#proof[
  Suppress $T$ from the notation. If $ell \( I \) = a$ is finite, add $floor.l -
    a floor.r$ elements from $Y \\ I$. There are enough: a smaller finite gap of size $h$ would give
    $ell \( Y \) = a + h lt.eq - 1$. The resulting lower limit belongs to $\( - 1 \, 0 \]$.
    If $ell \( Y \) = b$ is finite, delete $ceil.l b ceil.r$ gap elements from $Y$.
    A smaller finite gap of size $h$ would instead give $ell \( I \) = b - h > 0$.
    Again the resulting lower limit belongs to $\( - 1 \, 0 \]$.
  It remains to consider $ell \( I \) = - oo$ and $ell \( Y \) = + oo$.
    Set $X_0 = Y$ and construct decreasing sets $X_j$ by finite deletions.
    At stage $j gt.eq 1$, do nothing if some $n gt.eq j$ already satisfies $f_n \( X_(j - 1) \) lt.eq 0$.
    Otherwise choose $M_j gt.eq j$ so large that
  #[#set math.equation(numbering: n => "(4.5)")
   $ 2 c_j sup_(m gt.eq M_j) frac(\| \( Y \\ I \) ∩ W_m \|, \| W_m \|) < 2^(- j) . $ <eq:stage-loss>]
  This is possible because $Y \\ I in cal(J)_0$. Delete elements of $X_(j - 1) \\ I$ in blocks $m gt.eq M_j$,
    one at a time in increasing block order, stopping as soon as $f_n lt.eq 0$ for some $n gt.eq j$.
  This stopping time is finite. If every eligible element were deleted,
    the resulting set would differ from $I$ by finitely many elements, so it would have lower limit $- oo$.
    Fix a strictly negative probe with index $n gt.eq j$ for that set.
    By Lemma 11, the same probe is negative after finitely many of the deletions.
    Just before the stopping deletion all probes with index at least $j$ were positive. Each drops by at most one, so
  #[#set math.equation(numbering: n => "(4.6)")
   $ f_n \( X_j \) gt.eq - 1 wide \( n gt.eq j \) $ <eq:stage-reset>]
  at every stage that makes deletions. For $n < j$ the prefix is unchanged during the whole stage,
    and each tail extremum decreases by at most the density supremum in (4.5).
    Since $c_n lt.eq c_j$, the entire stage decreases $f_n$ by less than $2^(- j)$.
  Let $X_oo = ⋂_(j gt.eq 0) X_j$. It lies between $I$ and $Y$ and belongs to $cal(C) \( T \)$;
    Lemma 11 applies to this decreasing sequence. Every stage leaves a witness $f_n lt.eq 0$ with $n gt.eq j$.
    Such a witness persists under later deletions and in the limit, so $ell \( X_oo \) lt.eq 0$.
  There is a first stage $j_0$ that makes deletions. Otherwise the unchanged set $Y$ would have a nonpositive
    probe in every tail, contrary to $ell \( Y \) = + oo$. Fix $n gt.eq j_0$.
    After stage $j_0$ its probe is at least $- 1$. Through stage $n$,
    every later stage either leaves it unchanged or restores this bound by (4.6).
    Stages $j > n$ then cost less than $2^(- j)$ each. Passing to the limit,
  $ f_n \( X_oo \) gt.eq - 1 - sum_(j > n) 2^(- j) = - 1 - 2^(- n) . $
  Consequently $- 1 lt.eq ell \( X_oo \) lt.eq 0$. If the lower limit exceeds $- 1$, take $B = X_oo$.
    If it equals $- 1$, add one point of $Y \\ X_oo$ to obtain lower limit zero.
    There are infinitely many such points: a finite difference from $Y$ would contradict $ell \( Y \) = +
    oo$ by the finite-change rule. This completes the interpolation. ◻
]

The local rules have the following interval property. Unless a basis lies below the lower endpoint,
  between the endpoints, or above the upper endpoint, the prototype has a positive part outside the lower endpoint
  and the upper endpoint has a positive part outside the prototype.
  These are the two differences needed to separate a new prototype class from this one in Section 5.

#thm([Proposition 4.6.])[
  (Interval alternatives for one class).  #emph[Fix $sigma in { - \, + }$ and let $I subset.eq Y subset.eq E_0$. If
$ T \\ I in cal(J)_0 quad upright("or") quad Y \\ T in cal(J)_0 \, $

 there is $B in cal(B)^sigma \( T \)$ satisfying at least one of
#[#set math.equation(numbering: n => "(4.7)")
 $ B subset.eq I \, wide I subset.eq B subset.eq Y \, wide Y subset.eq B . $ <eq:local-alternatives>]

]
] <prop:local-intervals>

#proof[
  We first establish the interval alternatives when one or both endpoints belong to the class.
    For the lower-limit rule, if $X in cal(C) \( T \)$ has $ell_T \( X \) lt.eq - 1$,
    Lemmas 13 and 14 extend it to a basis by additions from any prescribed positive subset of $X^c$.
    If $ell_T \( X \) > 0$, their deletion versions give a basis contained in $X$,
    using any prescribed positive subset of $X$. Both unrestricted corrections are available because $X$ and $X^c$
    are positive.
  If both $I$ and $Y$ belong to $cal(C) \( T \)$, a lower endpoint with positive lower limit supplies a basis
    below $I$, and an upper endpoint with lower limit at most $- 1$ supplies a basis above $Y$.
    An endpoint that is itself a basis also gives an outcome in (4.7).
    The only remaining case is $ell_T \( I \) lt.eq - 1$ and $ell_T \( Y \) > 0$,
    when Lemma 14 gives a basis between them.
  If $I$ belongs to the class and $Y \\ I$ is positive, correcting $I$ downwards,
    leaving it fixed when it is a basis, or correcting it upwards from the pool $Y \\ I$ gives a basis below $I$
    or between $I$ and $Y$. If $Y$ belongs to the class and the gap is positive,
    the corresponding corrections give a basis between $I$ and $Y$ or above $Y$.
    Complementation proves these same three conclusions for the upper-limit rule,
    exchanging the two one-endpoint conclusions.
  Now suppose $T \\ I in cal(J)_0$. If $I in cal(C) \( T \)$, a $cal(J)_0$-small gap puts $Y$ in the same class,
    whereas a positive gap permits the lower-endpoint conclusion just proved. In either case we obtain (4.7).
    If $I in.not cal(C) \( T \)$, then $T ∩ I in cal(C) \( T \)$ and $I \\ T$ is positive.
    Applying the lower-endpoint conclusion to $\[ T ∩ I \, I \]$ gives a basis contained in $I$.
  Finally, if $Y \\ T in cal(J)_0$, apply the result just proved to the prototype $T^c$ and the interval
    $\[ Y^c \, I^c \]$, with the opposite rule. Complementing its basis gives (4.7) for $T$ and the original rule. ◻
]

== 5 Assembling a self-dual matroid <sec:assembly>

We now choose the prototype classes to which the local rules will be applied. There are two requirements:
  every resulting basis must impose the desired strict inequality on ordinal ranks,
  and enough classes must be present to allow maximal independent extensions inside every subset of $E_0$.
  The interval criterion used for the second requirement is due to Bowler and
  Geschke #cite(label("BowlerGeschke2016")) Theorem 6; we include the full verification of the matroid axioms
  after constructing the bases.

=== 5.1 Admissible sets and two monotone zones <admissible-sets-and-two-monotone-zones>

For $X subset.eq E_0 = L accent(union R, ̇)$, put

$ u \( X \) = X_L \, wide y \( X \) = D \\ X_R . $

Call $X$ #emph[admissible] if either

#[#set math.equation(numbering: n => "(5.1)")
 $ & u \( X \) \, y \( X \) in cal(U) &  & upright("and ") rho \( u \( X \) \) > rho \( y \( X \) \) \,\
upright("or ") quad & u \( X \) \, y \( X \) in.not cal(U) &  & upright("and ") rho \( D \\ u \( X \) \) >
  rho \( D \\ y \( X \) \) . $ <eq:admissible>]

All ranks appearing here are evaluated on members of $cal(U)$.
  Define the #emph[Upper zone] to consist of those $X$ for which $u \( X \)$ is large and either $y \( X \)$ is
  small, or $y \( X \)$ is large and $rho \( u \( X \) \) lt.eq rho \( y \( X \) \)$.
  Define the #emph[Lower zone] by requiring $X^c$ to lie in the Upper zone.
  Complements of subsets of $E_0$ are taken in $E_0$.

#thm([Lemma 5.1.])[
  #emph[The Upper zone, Lower zone, and admissible sets partition $2^(E_0)$.
    The Upper zone is upward closed, the Lower zone is downward closed,
    and all three statuses are invariant under symmetric differences in $cal(K)_0$.
    Complementation exchanges the two zones and preserves admissibility.
    Moreover, $diameter$ is Lower, $E_0$ is Upper, and every admissible set and its complement are $cal(J)_0$-positive.]
] <lem:zones>

#proof[
  Write $u = u \( X \)$ and $y = y \( X \)$. When $u$ is large and $y$ small, $X$ is Upper;
    when $u$ is small and $y$ large, it is Lower. If both are large,
    comparison of their ranks partitions the possibilities into Upper and admissible.
    If both are small, comparison of the ranks of their complements partitions the possibilities into Lower and
    admissible. Complementing $X$ replaces both $u$ and $y$ by their complements, proving the asserted symmetries.
  Suppose that $X subset.eq X'$ and $X$ is Upper. Then $u subset.eq u'$ and $y' subset.eq y$, with $u'$ large.
    If $y'$ is small, $X'$ is Upper by definition. Otherwise $y$ is large as well, and Lemma 7 gives
  $ rho \( u' \) lt.eq rho \( u \) lt.eq rho \( y \) lt.eq rho \( y' \) \, $
  so again $X'$ is Upper. Downward closure of the Lower zone follows by complementation.
    The invariance assertion follows from Lemma 7 in the two coordinates.
    The statuses of $diameter$ and $E_0$ follow directly from the definitions.
  If the first line of (5.1) holds, $X_L = u$ and $\( X^c \)_R = y$ are large, hence $cal(J)$-positive.
    If the second line holds, $X_R = D \\ y$ and $\( X^c \)_L = D \\ u$ are large instead.
    In either case $X$ and $X^c$ are $cal(J)_0$-positive. ◻
]

#thm([Lemma 5.2.])[
  (Crossing the zones).  #emph[If $A subset.eq Z subset.eq E_0$, with $A$ Lower and $Z$ Upper,
    then there is an admissible $B$ satisfying $A subset.eq B subset.eq Z$.]
] <lem:zone-crossing>

#proof[
  The sets $s = A_L$ and $X = Z_L$ are respectively small and large, and $s subset.eq X$.
    We keep $B_R = A_R$, so write $y = D \\ A_R$. If $y$ is large,
    Lemma 8 gives a large $u$ between $s$ and $X$ with $rho \( u \) > rho \( y \)$; take $B_L = u$.
    If $y$ is small, apply the same Lemma between the small set $D \\ X$ and the large set $D \\ s$ to obtain a
    large $v$ with $rho \( v \) > rho \( D \\ y \)$. Taking $B_L = D \\ v$ gives the second line of (5.1).
    Both constructions respect the two endpoint inclusions. ◻
]

=== 5.2 Reserving separation from earlier classes <reserving-separation-from-earlier-classes>

Different prototypes must have positive differences in both directions.
  This will ensure that their local bases cannot contain one another.
  The next Lemma arranges these two inequalities while preserving the endpoint statuses needed in Lemma 17.

#thm([Lemma 5.3.])[
  #emph[Let $cal(T)$ be a family of fewer than $frak(c)$ admissible subsets of $E_0$.
    Suppose $A subset.eq Z subset.eq E_0$, that $A$ is not Upper and $Z$ is not Lower, and that,
    for every $T in cal(T)$,
#[#set math.equation(numbering: n => "(5.2)")
 $ T \\ A in.not cal(J)_0 \, wide Z \\ T in.not cal(J)_0 . $ <eq:available-separation>]

 Then there is an admissible $B$ between $A$ and $Z$ such that $B \\ T$ and $T \\ B$ are $cal(J)_0$-positive for
   every $T in cal(T)$.]
] <lem:insert-prototype>

#proof[
  Put $G = Z \\ A$. For every $T in cal(T)$ with $A \\ T in cal(J)_0$, include the trace $G \\ T$ in a list.
    It is positive by (5.2), since $Z \\ T = \( A \\ T \) union \( G \\ T \)$.
    For every $T$ with $T \\ Z in cal(J)_0$, also include the positive trace $T ∩ G$,
    using $T \\ A = \( T \\ Z \) union \( T ∩ G \)$. There are fewer than $frak(c)$ traces.
    Lemma 9 supplies disjoint $cal(K)_0$-small sets $H_0 \, H_1$ that meet every listed trace
    $cal(J)_0$-positively. An empty list presents no restriction on their choice.
  Modify only the gap:
  #[#set math.equation(numbering: n => "(5.3)")
   $ A' = A union \( H_0 ∩ G \) \, wide Z' = Z \\ \( H_1 ∩ G \) . $ <eq:gap-reservations>]
  Because $H_0$ and $H_1$ are disjoint and $G$ is disjoint from $A$, we have $A' subset.eq Z'$.
    The endpoint changes are $cal(K)_0$-small, so $A'$ is not Upper and $Z'$ is not Lower by Lemma 16.
    If an endpoint is admissible, take it for $B$. Otherwise $A'$ is Lower and $Z'$ Upper,
    and Lemma 17 gives an admissible $B$ between them.
  For any $T in cal(T)$, if $A \\ T$ is positive then so is $B \\ T$.
    Otherwise the reserved positive set $H_0 ∩ \( G \\ T \)$ lies in $B \\ T$.
    Likewise, if $T \\ Z$ is positive it is already contained in $T \\ B$;
    otherwise the reserved positive set $H_1 ∩ T ∩ G$ is contained in $T \\ B$. This proves both inequalities. ◻
]

=== 5.3 Meeting every interval <meeting-every-interval>

We choose admissible prototypes in complementary pairs. For each first prototype $T$ we retain the local bases
  $cal(B)^(-) \( T \)$, and for $T^c$ we retain $cal(B)^(+) \( T^c \)$.
  These two families are complements of one another by the local rules.
  Once a pair has been inserted, its rule and all its bases remain fixed.
  The aim is that, for every interval $I subset.eq Y subset.eq E_0$ with infinite gap,
  some basis $B$ satisfies the following alternative:

#[#set math.equation(numbering: n => "(5.4)")
 $ B subset.eq I \, wide I subset.eq B subset.eq Y \, wide upright("or") wide
   Y subset.eq B . $ <eq:interval-alternative>]

#thm([Proposition 5.4.])[
  #emph[There is a nonempty family $cal(B)$ of admissible subsets of $E_0$ with the following properties:]
  + #emph[$cal(B)$ is an antichain and is closed under complements.]
  + #emph[If $B in cal(B)$, $F subset.eq B$ and $H subset.eq E_0 \\ B$ are finite with $\| F \| = \| H \|$,
    then $\( B \\ F \) union H in cal(B)$.]
  + #emph[For every $I subset.eq Y subset.eq E_0$ with $Y \\ I$ infinite, the alternative (5.4) holds.]
] <prop:basis-family>

#proof[
  As $E_0$ is countable, list all intervals with infinite gap in a sequence of length $frak(c)$.
    Recursively retain complementary pairs of admissible prototypes,
    requiring the two directed differences of any distinct prototypes to be $cal(J)_0$-positive.
    At any stage, call bases in the already retained local families #emph[old bases]. They are closed under complements.
  Consider the current interval $I subset.eq Y$. If (5.4) already holds for an old basis, skip this stage.
    Otherwise Proposition 15 implies that every old prototype $T$ satisfies
  #[#set math.equation(numbering: n => "(5.5)")
   $ T \\ I in.not cal(J)_0 \, wide Y \\ T in.not cal(J)_0 . $ <eq:unmet-interval>]
  Thus an unmet interval has the positive differences needed to reserve separation from every old class.
  An admissible set cannot contain an Upper set or be contained in a Lower set, by Lemma 16.
    Thus if $I$ is Upper, we must seek the allowed basis below $I$; if $Y$ is Lower, we must seek it above $Y$.
    Otherwise we seek a basis between the endpoints. Accordingly choose
  $ \[ A \, Z \] =
    cases(delim: "{", \[ diameter \, I \] \, & I upright(" is Upper") \,, \, & Y upright(" is Lower") \,, \, &
    upright("otherwise") .) $
  The first two cases cannot coincide, by monotonicity of the Upper zone.
    In every case $A$ is not Upper and $Z$ is not Lower. We verify (5.2) for all old prototypes.
    In the third case it is (5.5). In the first case $T \\ A = T$ is positive.
    If $I \\ T$ were $cal(J)_0$-small, $I ∩ T$ would remain Upper and be contained in $T$,
    forcing the admissible $T$ to be Upper. Thus $Z \\ T = I \\ T$ is positive.
    In the second case $Z \\ T = T^c$ is positive. If $T \\ Y$ were $cal(J)_0$-small,
    $T ∩ Y$ would remain admissible and be contained in the Lower set $Y$, a contradiction.
    Thus $T \\ A = T \\ Y$ is positive as well.
  At a stage $alpha < frak(c)$ there are at most two prototypes per earlier stage,
    hence fewer than $frak(c)$ old prototypes. Lemma 18 therefore supplies an admissible $B$ between $A$ and $Z$
    with both positive differences from every old prototype. Insert $B$ with the minus rule and $B^c$ with the
    plus rule. The complement has both positive differences from every old $T$, because $T^c$ is also old and
  $ B^c \\ T = T^c \\ B \, wide T \\ B^c = B \\ T^c . $
  The two new prototypes have positive differences from one another by Lemma 16.
    They therefore define new classes. All probes of $B$ relative to itself vanish, so $B in cal(B)^(-) \( B \)$.
    Its placement in $\[ A \, Z \]$ supplies one of the three outcomes in (5.4) for the original interval.
  This recursion uses no regularity assumption on $frak(c)$.
    For each individual $alpha$ below its initial ordinal, the numbers of predecessors, prototypes,
    and requested traces are all bounded by a fixed cardinal less than $frak(c)$.
    The reservation Lemma applies with that bound. Choices can be made using a fixed well-order of $2^(E_0)$.
  Let $cal(B)$ be the union of all retained local basis families.
    It is nonempty, since the interval $\[ diameter \, E_0 \]$ receives an outcome.
    Every member remains admissible under its $cal(J)_0$-small change from its prototype,
    and the family is closed under complements. Lemma 12 gives the antichain and finite-change properties within
    each class. For different classes, the positive directed differences of their prototypes remain positive after
    $cal(J)_0$-small changes. Thus their bases are incomparable as well.
    Finally every interval outcome persists, because no local family is subsequently altered. ◻
]

=== 5.4 The maximal-extension axiom <the-maximal-extension-axiom>

The interval construction is complete. We now check that it produces a matroid,
  including maximal extension inside arbitrary subsets; finite exchange alone does not supply this last property.

#thm([Theorem 5.5.])[
  #emph[There is a matroid $Q$ on $E_0 = L accent(union R, ̇)$ whose bases are precisely the family $cal(B)$ in
    Proposition 19. It is equal to its dual on the same labels, and all its bases are admissible.
    In particular, for every basis $B$,
#[#set math.equation(numbering: n => "(5.6)")
 $ B_L in cal(U) quad arrow.r.double quad D \\ B_R in cal(U) quad upright("and") quad
   rho \( B_L \) > rho \( D \\ B_R \) . $ <eq:basis-rank-decrease>]

 Every independent set of $Q$ that is not a basis can be extended by any element outside it.]
] <thm:local-matroid>

#proof[
  Define the independent sets to be all subsets of members of $cal(B)$.
    Since $cal(B)$ is nonempty, this gives (I1), and heredity (I2) is immediate.
    The maximal independent sets are exactly $cal(B)$: each independent set is contained in a member,
    and the antichain property prevents any such member from having a proper independent extension.
  Suppose $I$ is independent but not maximal, and choose $B_0 in cal(B)$ properly containing it.
    Let $e in E_0 \\ I$. If $e in B_0$, then $I union { e }$ is independent.
    Otherwise choose $f in B_0 \\ I$; the balanced swap $\( B_0 \\ { f } \) union { e }$ is a basis containing $I
    union { e }$. This proves the final assertion of the theorem.
    For any maximal independent $B_1$, its difference $B_1 \\ I$ is nonempty,
    since $B_1 subset.eq I$ would contradict its maximality. Taking $e$ from this difference proves (I3).
  For (IM), fix an independent $I subset.eq Y subset.eq E_0$.
    If $Y \\ I$ is finite, choose an independent extension of $I$ containing a maximum number of elements of that
    finite gap. It is maximal within $Y$. If the gap is infinite, use (5.4).
    A basis $B subset.eq I$ forces $B = I$: put $I$ inside a basis $B'$ and apply the antichain property to $B
    subset.eq I subset.eq B'$. Thus in this case $I$ itself is maximal within $Y$.
    A basis between $I$ and $Y$ is the required maximal extension.
    A basis containing $Y$ makes $Y$ independent, so $Y$ itself is the required extension.
    This proves all four independent-set axioms.
  The bases of the dual matroid are the complements of the bases of $Q$.
    Since $cal(B)$ is complement-closed, $Q^(*) = Q$ on $E_0$.
    Admissibility was established in Proposition 19, and (5.6) is its first case. ◻
]

#prodef([Remark 5.6.])[
  The matroid $Q$ is uniform in the sense that every subset is independent or
    spanning #cite(label("BowlerGeschke2016")). Indeed, if $X$ is dependent,
    maximize an independent subset $I$ inside $X$ using (IM).
    If $I$ were not a basis of $Q$, the last assertion of Theorem 20 would allow another element of $X$ to be
    added. Thus $X$ contains a basis and is spanning. Every basis and its complement are infinite by
    admissibility, so $Q$ has infinite rank and corank. Every finite $F subset.eq E_0$ is independent:
    starting from any basis, insert the elements of $F$ that are missing and delete equally many elements outside
    $F$, using its infinitude and balanced finite changes. Yet $E_0$ is dependent,
    because every basis has a nonempty complement. Thus $Q$ is not finitary,
    and self-duality shows that it is not cofinitary either.
] <rem:uniform-local>

== 6 Two matroids on a double ray <sec:counterexample>

We now use the local matroid $Q$ from Theorem 20 to construct the required pair.
  Recall that $Q = Q^(*)$ on $E_0 = L dot(union) R$, where each of $L \,
  R$ is a labeled copy of the countable set $D$. The ultrafilter $cal(U)$ and ordinal rank $rho$ have the
  following consequence for every basis $B$ of $Q$:

#[#set math.equation(numbering: n => "(6.1)")
 $ B_L in cal(U) quad arrow.r.double quad D \\ B_R in cal(U) quad upright("and") quad
   rho \( B_L \) > rho \( D \\ B_R \) . $ <eq:outward-rank>]

The rank is antitone under inclusion of members of $cal(U)$.
  An independent covering will propagate a member of $cal(U)$ along a ray, strictly decreasing this rank at every step.

=== 6.1 Direct sums and the common ground set <direct-sums-and-the-common-ground-set>

For completeness, the direct sums we use satisfy all the infinite-matroid axioms.
  Let $\( Q_j : j in J \)$ be matroids on pairwise disjoint sets $F_j$, where $J$ is countable.
  Declare $I subset.eq union.big_(j in J) F_j$ independent if $I ∩ F_j$ is independent in every $Q_j$.
  Axioms (I1) and (I2) follow componentwise. The maximal independent sets are exactly the unions of one basis from
  each component: a nonmaximal component permits an extension of the union,
  and if all components are maximal no element can be adjoined.

For (I3), if $I$ is not maximal, some $I ∩ F_j$ is not maximal in $Q_j$.
  Given a global basis $B$, its part $B ∩ F_j$ is a component basis.
  Apply (I3) there and adjoin the resulting element to $I$.
  For (IM), given independent $I subset.eq Y$, choose in each component a maximal independent extension of $I ∩
  F_j$ inside $Y ∩ F_j$. Their union is a maximal independent extension of $I$ inside $Y$.
  These choices are available in ZFC. This proves that the direct sum is a matroid,
  and also proves its stated description of bases. If every component is self-dual on its own labels,
  then the complement of each global basis is again a global basis, so the direct sum is self-dual on the same labels.

Take vertices $v_n$ indexed by $n in bb(Z)$. Between $v_n$ and $v_(n + 1)$ put the bundle

$ e_n = { n } times D \, wide E = dot(union.big)_(n in bb(Z)) e_n . $

Thus every bundle has the fixed label map $\( n \, d \) mapsto d$ onto $D$.
  The ground set $E$ is countably infinite: $D$ is a countably infinite union of nonempty finite blocks, and $E =
  bb(Z) times D$. Designate $e_(- 1)$, joining $v_(- 1)$ and $v_0$, as the central bundle.
  At every vertex put a copy $Q_n$ of $Q$ on $e_(n - 1) union e_n$.
  The inward bundle is its $L$-coordinate, and the outward bundle its $R$-coordinate; explicitly,

$ & L & R\
n lt.eq - 1 & e_n & e_(n - 1)\
n gt.eq 0 & e_(n - 1) & e_n . $

Both middle vertices therefore use the central bundle as $L$. All copies use the same label maps, ultrafilter, and rank.

Define

$ M_0 = xor.big_(n in 2 bb(Z)) Q_n \, wide M_1 = xor.big_(n in 2 bb(Z) + 1) Q_n . $

For either parity, the component supports partition $E$, since each bundle has exactly one endpoint of that
  parity. Hence these are matroids on the same countably infinite set $E$.
  The preceding direct-sum verification and $Q = Q^(*)$ give $M_i = M_i^(*)$ on the same labels for $i = 0 \, 1$.

The parity placement and inward/outward coordinates are shown in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-5.071, -0.055), (-3.208, -0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-5.071, 0), (-3.208, 0), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-5.071, 0.055), (-3.208, 0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-3.002, -0.055), (-1.138, -0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-3.002, 0), (-1.138, 0), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-3.002, 0.055), (-1.138, 0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((1.138, -0.055), (3.002, -0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((1.138, 0), (3.002, 0), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((1.138, 0.055), (3.002, 0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((3.208, -0.055), (5.071, -0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((3.208, 0), (5.071, 0), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((3.208, 0.055), (5.071, 0.055), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10))
  line((-0.9315, -0.055), (0.9315, -0.055), stroke: (paint: rgb("#333333"), thickness: 1.2pt, miter-limit: 10))
  line((-0.9315, 0), (0.9315, 0), stroke: (paint: rgb("#333333"), thickness: 1.2pt, miter-limit: 10))
  line((-0.9315, 0.055), (0.9315, 0.055), stroke: (paint: rgb("#333333"), thickness: 1.2pt, miter-limit: 10))
  line((-5.807, 0), (-5.301, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((5.301, 0), (5.807, 0), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  circle((-5.175, 0), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-5.175, 0.16), [#text(size: 9pt)[$v_(-3)$]], anchor: "south", padding: 0.1176cm)
  circle((-1.035, 0), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1.035, 0.16), [#text(size: 9pt)[$v_(-1)$]], anchor: "south", padding: 0.1176cm)
  circle((3.105, 0), radius: 0.09701, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.105, 0.16), [#text(size: 9pt)[$v_1$]], anchor: "south", padding: 0.1176cm)
  circle((-3.105, 0), radius: 0.09701, fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3.105, 0.16), [#text(size: 9pt)[$v_(-2)$]], anchor: "south", padding: 0.1176cm)
  circle((1.035, 0), radius: 0.09701, fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.035, 0.16), [#text(size: 9pt)[$v_0$]], anchor: "south", padding: 0.1176cm)
  circle((5.175, 0), radius: 0.09701, fill: rgb("#000000"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.175, 0.16), [#text(size: 9pt)[$v_2$]], anchor: "south", padding: 0.1176cm)
  content((-4.14, -0.13), [#text(size: 9pt)[$e_(-3)$]], anchor: "north", padding: 0.1176cm)
  content((-2.07, -0.13), [#text(size: 9pt)[$e_(-2)$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.13), [#text(size: 9pt)[$e_(-1)$]], anchor: "north", padding: 0.1176cm)
  content((2.07, -0.13), [#text(size: 9pt)[$e_0$]], anchor: "north", padding: 0.1176cm)
  content((4.14, -0.13), [#text(size: 9pt)[$e_1$]], anchor: "north", padding: 0.1176cm)
  line((-1.208, 0.95), (-4.772, 0.95), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((-2.99, 0.95), [#text(size: 9pt)[outward]], anchor: "south", padding: 0.1176cm)
  line((1.208, 0.95), (4.772, 0.95), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((2.99, 0.95), [#text(size: 9pt)[outward]], anchor: "south", padding: 0.1176cm)
  content((0, -0.59), [#text(size: 9pt)[central bundle]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Each segment represents a copy of $D$. A copy of $Q$ uses the two bundles incident with its vertex. Filled vertices contribute to $M_0$, open vertices to $M_1$. The central bundle is $e_(- 1)$; from either endpoint, the $L$-coordinate points toward the center and the $R$-coordinate points outward. ],
) <fig:double-ray>

Every finite subset of $E$ is independent in each $M_i$, because all its component parts are finite and every
  finite subset of $Q$ is independent by Remark 21. But $E$ is dependent in each $M_i$:
  its intersection with any component support is the dependent whole ground set of that copy of $Q$.
  Thus neither $M_i$ is finitary. Since $M_i = M_i^(*)$, neither is cofinitary either.

In fact, neither matroid has a nonempty finitary or cofinitary direct summand.
  Suppose a nonempty set $F$ supports a finitary summand. Every subset of $F$ is independent,
  since all its finite subsets are independent, so $F$ is the summand’s only basis.
  Thus every basis of $M_i$ contains $F$. But complements of bases are also bases of $M_i$, a contradiction.
  Dualizing the direct-sum basis description gives the same contradiction for a cofinitary summand.

=== 6.2 The descending ranks <the-descending-ranks>

Suppose that independent sets $J_i$ of $M_i$ cover $E$. Replacing $J_1$ by $E \\ J_0 subset.eq J_1$,
  we obtain an independent partition $E = J_0 dot(union) J_1$.
  Assign each element of a bundle to the endpoint whose parity agrees with its part in this partition.
  At every vertex, the assigned elements on its two incident bundles form an independent set of its copy of $Q$.

The central bundle is partitioned between $v_(- 1)$ and $v_0$.
  Exactly one of the two label sets belongs to $cal(U)$. Start at that endpoint and move outward forever.
  Write $x_k subset.eq D$ for the labels received by the $k$th vertex on its inward bundle. Thus $x_0 in cal(U)$.
  If the current vertex receives $z_k$ on its outward bundle, the next vertex receives exactly

$ x_(k + 1) = D \\ z_k $

there, because the assignment is a partition and the label maps agree.

Assume inductively that $x_k in cal(U)$. The independent assignment at this vertex is contained in a basis $B_k$
  of its copy of $Q$. Put

$ u_k = \( B_k \)_L \, wide y_k = D \\ \( B_k \)_R . $

We have $x_k subset.eq u_k$, so $u_k in cal(U)$. Equation (6.1) gives $y_k in cal(U)$ and $rho \( u_k \) >
  rho \( y_k \)$. Since $z_k subset.eq \( B_k \)_R$, we have $y_k subset.eq x_(k + 1)$;
  hence $x_(k + 1) in cal(U)$. Antitonicity now yields

#[#set math.equation(numbering: n => "(6.2)")
 $ rho \( x_k \) med gt.eq med rho \( u_k \) med > med rho \( y_k \) med gt.eq med
   rho \( x_(k + 1) \) . $ <eq:ordinal-descent>]

This produces an infinite strictly descending sequence of ordinals, which is impossible:
  its set of values has a least element, and the next value would be smaller.

Thus $M_0 \, M_1$ have no independent covering of $E$. By Lemma 4, they have no packing/covering partition either.
  Their common ground set is countably infinite and both matroids are self-dual on the same labels,
  completing the proof of Theorem 1.

== 7 The separate Covering and Packing conjectures <sec:separate-consequences>

Bowler and Carmesin also formulated separate Covering and Packing conjectures.
  For a set-indexed family $cal(M) = \( M_i : i in Theta \)$ on $E$,
  write $cal(M) #h(-0.16667em) harpoon.tr Y = \( M_i #h(-0.16667em) harpoon.tr Y :
  i in Theta \)$ and $cal(M) . Y = \( M_i . Y : i in Theta \)$.
  Their Covering Conjecture asserts, for every such family, the equivalence

#[#set math.equation(numbering: n => "(7.1)")
 $ & cal(M) upright(" has a covering")\
 & quad arrow.l.r.double quad upright("for every ") Y subset.eq E \,\
 & wide #scale(x: 120%, y: 120%)[\[] cal(M) #h(-0.16667em) harpoon.tr Y upright(" has a packing") arrow.r.double
   cal(M) #h(-0.16667em) harpoon.tr Y upright(" has a covering") #scale(x: 120%, y: 120%)[\]] .
   $ <eq:covering-conjecture>]

Their Packing Conjecture asserts, again for every such family,

#[#set math.equation(numbering: n => "(7.2)")
 $ & cal(M) upright(" has a packing")\
 & quad arrow.l.r.double quad upright("for every ") Y subset.eq E \,\
 & wide #scale(x: 120%, y: 120%)[\[] cal(M) . Y upright(" has a covering") arrow.r.double cal(M) . Y
   upright(" has a packing") #scale(x: 120%, y: 120%)[\]] . $ <eq:packing-conjecture>]

These are the conjectures of #cite(label("BowlerCarmesin2015")) Conjectures 5.2 and 6.3.

#thm([Corollary 7.1.])[
  #emph[The unrestricted separate Covering and Packing Conjectures of Bowler and Carmesin are both false in ZFC.]
] <cor:separate-covering-packing>

#proof[
  Bowler and Carmesin’s universal equivalences identify intersection for every pair,
    packing/covering for every pair, packing/covering for every set-indexed family,
    (7.1) for every set-indexed family, and (7.2) for every set-indexed family #cite(label("BowlerCarmesin2015"))
    Section 7. Theorem 1 falsifies the pairwise packing/covering assertion,
    so both separate universal conjectures are false. These last two failures are consequences of equivalence
    between universal statements; this argument does not identify their witnessing families with the pair
    $\( M_0 \, M_1 \)$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
