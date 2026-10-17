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

#align(center)[#text(size: 16pt, weight: "bold")[A Cyclic Polytabloid Proof of Saxl's Conjecture]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a partition $alpha tack.r n$, let $S^alpha$ denote the corresponding irreducible complex representation of the symmetric group $S_n$. The Kronecker coefficient

$ g \( alpha \, beta \, lambda \) = dim "Hom"_(S_n) \( S^lambda \, S^alpha ⊗ S^beta \) $

is the multiplicity of $S^lambda$ in the tensor product, with $S_n$ acting diagonally. Put

#[#set math.equation(numbering: n => "(1.1)")
 $ N_m = frac(m \( m + 1 \), 2) \, #h(2em) rho_m = \( m \, m - 1 \, dots.h \, 1 \) . $ <intro:staircase>]

We prove the following statement.

#thm([Theorem 1.1.])[
  (Saxl’s conjecture).  #emph[For every integer $m gt.eq 1$ and every partition $lambda tack.r N_m$, 
$ g \( rho_m \, rho_m \, lambda \) > 0 . $

 Equivalently, $S^(rho_m) ⊗ S^(rho_m)$ contains every irreducible complex representation of $S_(N_m)$.]
] <thm:saxl>

The assertion is uniform in both the staircase size and the constituent. The proof establishes it inside one explicitly generated submodule of the tensor square, a stronger conclusion that retains the vector needed at each induction step.

The companion [14] Theorem 1.1 uses the stronger cyclic statement of 5, together with additional arguments, to construct, for every positive integer $n in.not { 2 \, 4 \, 9 }$, an irreducible complex representation of $S_n$ whose tensor square contains every irreducible representation of $S_n$.

=== 1.1 History and significance <history-and-significance>

Saxl’s conjecture belongs to a broader tensor-square covering problem: can a single irreducible representation have every irreducible as a constituent of its square? A motivating precedent comes from finite simple groups of Lie type. Heide, Saxl, Tiep, and Zalesski proved that the Steinberg square has this property, except for the groups $upright("PSU")_d \( q \)$ with $d gt.eq 3$ and $gcd \( d \, 2 \( q + 1 \) \) = 1$ [8] Theorem 1.2. Saxl proposed the staircase assertion in a UCLA Combinatorics Seminar on 20 March 2012, as recorded by Pak, Panova, and Vallejo [15] Conjecture 1.2 and Footnote 2. Their work places the staircase square among tensor-square covering questions for symmetric groups and proves several families of positive Kronecker coefficients; in particular, their Theorem 1.4 covers hooks and two-row partitions for sufficiently large staircase size. Ikenmeyer proved positivity when $lambda$ and $rho_m$ are comparable in the dominance order [9] Theorem 2.1. We use his triangular arrangement of two alternating tensor layers [9] Section 4; his argument also yields all hook constituents [9] Corollary 6.1.

Character-theoretic and modular methods have supplied further substantial families. The character-value criterion of Pak, Panova, and Vallejo [15] detects constituents using the principal-hook cycle type of a self-conjugate partition. Bessenrodt developed related critical-class and spin-character methods, including the double-hook case [1]. Li proved the triple-hook case using computer-assisted finite reductions [12]. Here double and triple hooks are diagrams whose largest square has side two and three, respectively. Bessenrodt, Bowman, and Sutton connected Kronecker positivity to 2-modular decomposition numbers; their results include all 2-height-zero constituents, hence all odd-degree constituents, and framed staircases [2] Theorems 5.2 and 5.5.

Another line of work addresses the tensor exponent and asymptotic coverage. Luo and Sellke used the semigroup property to prove that a random partition occurs in the staircase square with probability tending to one, for both the uniform and Plancherel measures [13] Theorems 1.5 and 1.6. They also found, in every sufficiently large degree, an irreducible representation whose fourth tensor power contains every irreducible [13] Theorem 1.4. Harman and Ryba proved full coverage for the tensor cube of every staircase, with combinatorial and modular proofs [7] Theorem 1.1. Asymptotic coverage does not exclude exceptional constituents, while a cube or fourth power uses additional tensor factors; neither gives the square assertion in 1.

Recent developments include semigroup constructions of further constituents and generalized-block constraints on support [5], and a full staircase-square theorem for unipotent characters of $"GL"_n \( q \)$ [11] Theorem 1.1. The latter is an analogue in a different character theory: ordinary Kronecker positivity implies the corresponding unipotent positivity, but the converse need not hold.

The band calculation below also has a precise predecessor at the level of ambient representations. Brown, van Willigenburg, and Zabrocki proved that $S^(\( m \, m - 1 \)) ⊗ S^(\( m \, m - 1 \))$ is the multiplicity-free sum of all irreducibles of $S_(2 m - 1)$ indexed by partitions with at most four rows [3] Corollary 4.1. Our induction needs each of these constituents in the cyclic module of one prescribed band vector, rather than merely somewhere in that ambient square. Explicit nonzero pairings supply this additional generator-specific statement. Throughout, the objective is support, or positivity, rather than a formula for Kronecker multiplicities.

=== 1.2 The construction and its reusable steps <the-construction-and-its-reusable-steps>

Place $N_m$ tensor positions in the triangle $B_m = { \( i \, j \) : i \, j gt.eq 1 \, med i + j lt.eq m + 1 }$. Let $R_m$ and $C_m$ be its row and column set partitions, ordered within each row by increasing $j$ and within each column by increasing $i$. Use the ordered basis $e_1 \, dots.h \, e_m$ of $bb(C)^m$. On a block of length $r$, alternate the initial letters $e_1 \, dots.h \, e_r$, taking the signed sum over all permutations. Taking the product over row blocks gives $v_(R_m)$; doing the same over column blocks gives $v_(C_m)$. These are polytabloids of staircase type. Instead of beginning with an arbitrary vector in the tensor square, we work throughout with

$ W_m = bb(C) \[ S_(B_m) \] \( v_(R_m) ⊗ v_(C_m) \) \, $

where $S_(B_m)$ permutes the positions in both layers simultaneously. 5 asserts that this particular cyclic module already contains every irreducible. We first prove that it contains every $S^lambda$ for which $lambda$ is dominated by $rho_m$: each initial sum of the parts of $lambda$ is at most the corresponding staircase sum. A sign twist and a permutation-module quotient give this starting case (6). The following three steps reach the remaining partitions.

+ #strong[A full induced quotient from a coordinate projection.] Separate a smaller triangle $B_(m - s)$ from a band of width $s = 1$ or $2$. Call letters $1 \, dots.h \, s$ low and letters $s + 1 \, dots.h \, m$ high. Each position carries one letter from each tensor layer. Project onto words whose two letters at each position are either both high or both low. The staircase row and column counts force the high positions of the projected generator to be exactly the smaller triangle. The generator then factors into the smaller cyclic generator and a band generator, whose cyclic module is denoted by $U_(m \, s)$. Translates of the high-position set occupy disjoint coordinate sectors, so the quotient is the full induced module
  $ "Ind"_(S_(B_(m - s)) times S_(B_m \\ B_(m - s)))^(S_(B_m)) \( W_(m - s) times.square U_(m \, s) \) . $
  7 isolates the general reason that sector separation gives an induced-module isomorphism, including an explicit inverse. 8 gives the resulting quotient.
+ #strong[Constituents detected in the specified band generator.] A width-two band is an odd path of alternating pairs with fixed endpoint letters. At each position, a covector on the pair-letter space is represented by a two-by-two matrix. Pairing along the path evaluates a word of matrices and adjugates. To test a partition with at most four rows, place its tableau columns on consecutive path segments and alternate the covectors within each column. Each segment has length at most four. A four-element basis of $"Mat"_2 \( bb(C) \)$ makes every such alternated segment matrix invertible. A simultaneous conjugation of the test basis makes the endpoint entry of the product nonzero. The resulting dual-polytabloid pairing proves that every shape with at most four rows occurs in $U_(m \, 2)$ itself (11).
+ #strong[A horizontal-strip reduction with four steps.] If a shape outside this dominance range has a first row of length at least $m$, one horizontal $m$-strip suffices. Otherwise its first four rows contain more than $2 m - 1$ boxes. Successive sweeps of the bottom boxes of columns then remove exactly $2 m - 1$ boxes in at most four horizontal strips (13). In this second case, let $nu$ be the remaining partition. Iterated Pieri supplies a shape $eta tack.r 2 m - 1$ with at most four rows such that $S^lambda$ occurs in the representation induced from $S^nu times.square S^eta$. The band calculation puts $S^eta$ in $U_(m \, 2)$, while induction puts $S^nu$ in $W_(m - 2)$. The full induced quotient then gives the target constituent in $W_m$.

The smaller factor in the quotient is the actual cyclic module $W_(m - s)$, and the band factor is generated by the actual projected vector. This is why both parts of the induction track generators instead of using ambient tensor-product support alone. Only one copy of a suitable intermediate irreducible is needed.

2 fixes the tensor conventions and proves the needed form of Young’s rule from Pieri. 3 defines $W_m$ and proves the dominated case. The quotient and band calculations occupy Section 4, Section 5; 6 proves the strip reduction and both main theorems.

== 2 Specht modules and horizontal strips <sec:specht-tools>

We fix the tensor conventions used to identify alternating block vectors with Specht modules. The other input needed by the induction is the Pieri rule: it transfers constituent support across the removal of horizontal strips. We record its dominance consequences with proofs.

All representations and tensor products are over $bb(C)$ and are finite-dimensional. A partition $lambda tack.r n$ is padded with zero parts when necessary; its length is $"len" \( lambda \)$ and its conjugate is $lambda^t$, where $lambda_j^t = \# { i : lambda_i gt.eq j }$. We identify $lambda$ with its diagram ${ \( i \, j \) : 1 lt.eq j lt.eq lambda_i }$. For partitions of the same size, write $lambda gt.closed.eq mu$ if $sum_(i = 1)^k lambda_i gt.eq sum_(i = 1)^k mu_i$ for every $k gt.eq 1$. Conjugation reverses this order:

#[#set math.equation(numbering: n => "(2.1)")
 $ lambda gt.closed.eq mu quad arrow.l.r.double quad mu^t gt.closed.eq lambda^t . $ <tools:conjugate-dominance>]

Indeed, for every integer $q gt.eq 1$,

$ sum_i max \( lambda_i - q \, 0 \) = max_(k gt.eq 0) (sum_(i = 1)^k lambda_i - k q) \, #h(2em) sum_(j = 1)^q lambda_j^t = n - sum_i max \( lambda_i - q \, 0 \) . $

Dominance increases the first expression and therefore decreases the second. Applying the resulting implication to the conjugate partitions proves the converse.

=== 2.1 Position tensors and polytabloids <position-tensors-and-polytabloids>

For a finite set $B$, write $S_B$ for its symmetric group. For $lambda tack.r \| B \|$, write $S_B^lambda$ for the irreducible $S_B$-module of type $lambda$; omit the subscript when the position set is understood. If $E$ has ordered basis $e_1 \, dots.h \, e_d$, the tensor space $E^(⊗ B)$ has word basis $e_a = ⨂_(b in B) e_(a \( b \))$, indexed by maps $a : B arrow.r { 1 \, dots.h \, d }$. The position action is $g e_a = e_(a compose g^(- 1))$. All regroupings of tensor factors are ordinary tensor identifications and introduce no signs.

Let $L$ be a set partition of $B$ whose blocks have size at most $d$. For each block $A = \( b_1 \, dots.h \, b_r \)$ choose an ordering and set

#[#set math.equation(numbering: n => "(2.2)")
 $ v_A = sum_(pi in S_r) "sgn" \( pi \) ⨂_(i = 1)^r e_(pi \( i \)) \, #h(2em) v_L = ⨂_(A in L) v_A \, $ <tools:block-tensor>]

where the $i$th factor of $v_A$ occupies position $b_i$. Changing a block ordering changes $v_L$ only by a sign. Its nonzero word coefficients are $plus.minus 1$: on each block of size $r$, the letters are a bijection with ${ 1 \, dots.h \, r }$.

#thm([Lemma 2.1.])[
  (Alternating blocks as polytabloids).  #emph[Define $theta_i = \# { A in L : \| A \| gt.eq i }$, so that the block sizes are the column lengths of $theta$. Then $bb(C) \[ S_B \] v_L tilde.equiv S^theta$. The same assertion holds for any ordered basis of a dual vector space.]
] <lem:polytabloid>

#proof[
  Arrange the blocks as columns of a tableau $t$ of shape $theta$, in nonincreasing order of their sizes, and place each ordered block from top to bottom. Tableau entries are the distinct elements of $B$. A row tabloid ${ t' }$ records the set of entries in each row. Let $M^theta$ be the permutation module spanned by these row tabloids. Send ${ t' }$ to the word assigning letter $i$ to every entry of row $i$. This is an $S_B$-equivariant bijection from the tabloid basis of $M^theta$ to the word basis of content $theta$. If $C_t$ is the subgroup permuting entries within each column of $t$, the polytabloid
  $ e_t = sum_(c in C_t) "sgn" \( c \) c { t } $
  maps to $v_L$: in a column, the position action replaces a permutation of the letters by its inverse, which has the same sign. In particular this vector is nonzero, since the original row word has coefficient $1$. The span of all translates of $e_t$ is the Specht module $S^theta$, irreducible over $bb(C)$ by the standard polytabloid construction [10] Definitions 4.1 and 4.3, Theorem 4.12. This proves the assertion. The argument applies to a dual space with any chosen basis; alternatively, an invertible basis change on that space induces an invertible map on its position tensor power commuting with $S_B$. ◻
]

We use the usual complex representation-theoretic facts [10] Theorems 4.12 and 6.7: the $S^lambda$, for $lambda tack.r n$, form the complete list of irreducible $S_n$-modules, and

#[#set math.equation(numbering: n => "(2.3)")
 $ \( S^lambda \)^(*) tilde.equiv S^lambda \, #h(2em) S^lambda ⊗ "sgn" tilde.equiv S^(lambda^t) . $ <tools:dual-sign>]

Every complex representation of a finite group is semisimple [6] Proposition 1.5 and Corollary 1.6, so any irreducible quotient is also a constituent. For $H lt.eq G$, Frobenius reciprocity [6] Proposition 3.17 takes the form

#[#set math.equation(numbering: n => "(2.4)")
 $ "Hom"_G \( "Ind"_H^G A \, V \) tilde.equiv "Hom"_H \( A \, "Res"_H^G V \) . $ <tools:frobenius>]

Induction, modeled by $bb(C) \[ G \] ⊗_(bb(C) \[ H \]) A$, is transitive and distributes over direct sums. The symbol $times.square$ denotes the outer tensor product for separate group actions; ordinary tensor products of two $S_B$-modules carry the diagonal action. The natural pairing of $E^(⊗ B)$ and $\( E^(*) \)^(⊗ B)$ satisfies $chevron.l g u \, g t chevron.r = chevron.l u \, t chevron.r$. Thus pairing with an invariant subspace $T$ of the dual tensor space defines an equivariant map $u mapsto \( t mapsto chevron.l u \, t chevron.r \)$ into $T^(*)$.

=== 2.2 Pieri and the needed part of Young’s rule <pieri-and-the-needed-part-of-youngs-rule>

For diagrams $nu subset.eq lambda$, the skew diagram $lambda \/ nu$ is a #emph[horizontal strip] if it has at most one box in each column. We use the empty partition and the trivial group $S_0$ in the following standard identity.

#thm([Lemma 2.2.])[
  (Pieri rule).  #emph[For $nu tack.r a$ and $b gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.5)")
 $ "Ind"_(S_a times S_b)^(S_(a + b)) \( S^nu times.square upright(bold(1)) \) tilde.equiv xor.big_(lambda tack.r a + b \, med lambda supset.eq nu\
lambda \/ nu upright(" a horizontal strip")) S^lambda . $ <tools:pieri>]

 Every summand occurs once.]
] <lem:pieri>

This is the one-row specialization of the Littlewood–Richardson rule [10] Section 16, especially Rule 16.4: all $b$ entries of its skew filling are $1$, so column strictness requires a horizontal strip; the unique such filling satisfies the lattice-word condition. We give the dominance and multiplicity consequences needed here, including the constructive existence argument.

#thm([Lemma 2.3.])[
  (Young’s rule: support and diagonal multiplicity).  #emph[Let $theta = \( theta_1 \, dots.h \, theta_ell \) tack.r n$. The row-tabloid permutation module has the equivalent induced realization 
$ M^theta = "Ind"_(S_(theta_1) times dots.h.c times S_(theta_ell))^(S_n) upright(bold(1)) . $

 Then $S^tau$ occurs in $M^theta$ if and only if $tau gt.closed.eq theta$, and $S^theta$ occurs once. The word module of any content obtained by reordering the parts of $theta$ is also isomorphic to $M^theta$.]
] <lem:young-rule>

#proof[
  The case $n = 0$ is immediate from the trivial representation of $S_0$. Assume henceforth that $n > 0$. Transitivity of induction and 3 show that the multiplicity of $S^tau$ counts chains
  #[#set math.equation(numbering: n => "(2.6)")
   $ diameter = nu^(\( 0 \)) subset.eq nu^(\( 1 \)) subset.eq dots.h.c subset.eq nu^(\( ell \)) = tau \, #h(2em) \| nu^(\( k \)) \/ nu^(\( k - 1 \)) \| = theta_k \, $ <tools:strip-chain>]
  whose successive differences are horizontal strips. Each strip raises the first column’s height by at most one, so $nu^(\( k \))$ has at most $k$ rows. Since it is contained in $tau$,
  $ sum_(i = 1)^k theta_i = \| nu^(\( k \)) \| lt.eq sum_(i = 1)^k tau_i . $
  For $k > ell$, both initial sums equal $n$, since $tau$ has at most $ell$ rows. This proves necessity of dominance. If $tau = theta$, equality forces $nu^(\( k \))$ to be exactly the first $k$ rows of $theta$. These diagrams do form a chain of the required kind, proving multiplicity one.
  For sufficiency, suppose $tau gt.closed.eq theta$ and induct on $ell$. For $ell = 1$, necessarily $tau = \( n \)$. For $ell > 1$, put $t = theta_ell$. There are at least $t$ columns of $tau$, since $tau_1 gt.eq theta_1 gt.eq t$. Delete a bottom box from each of the $t$ tallest columns, choosing the rightmost columns first among equal heights, and call the remaining diagram $nu$. Its column heights are still nonincreasing: unequal adjacent heights differ by at least one, and within any group of equal heights precisely a suffix is lowered. Thus $nu$ is a partition and $tau \/ nu$ is a horizontal $t$-strip. For every $k gt.eq 1$ its loss in the first $k$ rows is
  #[#set math.equation(numbering: n => "(2.7)")
   $ sum_(i = 1)^k tau_i - sum_(i = 1)^k nu_i = max \( 0 \, t - tau_(k + 1) \) : $ <tools:prefix-loss>]
  there are $tau_(k + 1)$ columns taller than $k$, and the rule selects these before any column whose bottom box belongs to the first $k$ rows. If the loss is zero, the desired dominance inequality for $nu$ follows immediately. If it is positive and $k < ell$, then
  $ sum_(i = 1)^k nu_i = sum_(i = 1)^(k + 1) tau_i - t gt.eq sum_(i = 1)^(k + 1) theta_i - t gt.eq sum_(i = 1)^k theta_i . $
  For completeness, dominance at $ell$ gives $"len" \( tau \) lt.eq ell$, and dominance at $ell - 1$ gives $tau_ell lt.eq t$. All $tau_ell$ columns of height $ell$ are therefore selected, so the last row disappears and $"len" \( nu \) lt.eq ell - 1$. Hence all remaining initial sums equal the total $n - t$, and $nu gt.closed.eq \( theta_1 \, dots.h \, theta_(ell - 1) \)$. Induction gives a chain ending at $nu$; appending the deleted strip gives (2.6) ending at $tau$.
  Finally, the stabilizer of a word with prescribed letter multiplicities is the product of the symmetric groups on its equal-letter position sets. Reordering those multiplicities conjugates this subgroup, giving the asserted isomorphism of permutation modules. ◻
]

== 3 The triangular cyclic module and dominance <sec:dominance>

We now fix the generator from the introduction exactly and state the cyclic support theorem used in the induction. The second task of this section is to detect every constituent dominated by the staircase, using a sign twist and an explicit permutation-module quotient.

Following the triangular arrangement in [9] Section 4, for $m gt.eq 1$ use the position set

#[#set math.equation(numbering: n => "(3.1)")
 $ B_m = { \( i \, j \) in bb(Z)_(gt.eq 1)^2 : i + j lt.eq m + 1 } \, #h(2em) G_m = S_(B_m) . $ <dom:triangle>]

Its row and column set partitions are

$ R_m = { R_(m \, i) : 1 lt.eq i lt.eq m } \, #h(2em) R_(m \, i) = { \( i \, j \) : 1 lt.eq j lt.eq m + 1 - i } \, $

$ C_m = { C_(m \, j) : 1 lt.eq j lt.eq m } \, #h(2em) C_(m \, j) = { \( i \, j \) : 1 lt.eq i lt.eq m + 1 - j } . $

Order each row by increasing $j$ and each column by increasing $i$. With $E_m = bb(C)^m$ and its ordered basis $e_1 \, dots.h \, e_m$, form the alternating block tensors of 2 and set

#[#set math.equation(numbering: n => "(3.2)")
 $ w_m = v_(R_m) ⊗ v_(C_m) \, #h(2em) W_m = bb(C) \[ G_m \] w_m med subset.eq med E_m^(⊗ B_m) ⊗ E_m^(⊗ B_m) . $ <dom:cyclic-module>]

Both set partitions have block sizes $m \, m - 1 \, dots.h \, 1$. Since $rho_m^t = rho_m$, 2 gives

#[#set math.equation(numbering: n => "(3.3)")
 $ V_R := bb(C) \[ G_m \] v_(R_m) tilde.equiv S^(rho_m) \, #h(2em) V_C := bb(C) \[ G_m \] v_(C_m) tilde.equiv S^(rho_m) \, #h(2em) W_m subset.eq V_R ⊗ V_C . $ <dom:square-inclusion>]

Here and throughout, the action on a tensor product of two $G_m$-modules is diagonal. Thus it suffices to prove the following stronger statement.

#thm([Theorem 3.1.])[
  (Cyclic staircase support).  #emph[For every $m gt.eq 1$ and every partition $lambda tack.r N_m$, the irreducible $S^lambda$ occurs in $W_m$.]
] <thm:cyclic-saxl>

We prove 5 by induction in 6. The present section establishes the case supplied by dominance.

#thm([Proposition 3.2.])[
  #emph[If $m gt.eq 1$, $lambda tack.r N_m$, and $rho_m gt.closed.eq lambda$, then $S^lambda$ occurs in $W_m$.]
] <prop:dominated>

#proof[
  Fix $m$, abbreviate $G = G_m$, and let $epsilon.alt$ be the one-dimensional sign representation, also denoting its character by $epsilon.alt$. By Young’s rule, conjugation of dominance, and the sign-twist identity in (2.3), it is enough to show that $W_m ⊗ epsilon.alt$ contains every constituent of $M^(rho_m)$. We will find the cyclic module generated by $v_(R_m) ⊗ v_(R_m)$ inside an isomorphic image of $W_m ⊗ epsilon.alt$, then map that module onto $M^(rho_m)$. The row subgroup
  $ H_R = product_(i = 1)^m S_(R_(m \, i)) $
  acts on $v_(R_m)$ by $epsilon.alt \|_(H_R)$. Consequently the unnormalized signed diagonal average is exactly
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(h in H_R) epsilon.alt \( h \) thin h w_m = v_(R_m) ⊗ u \, #h(2em) u = sum_(h in H_R) h v_(C_m) . $ <dom:signed-average>]
  To see that $u eq.not 0$, let $a_0 \( i \, j \) = i$ and consider the corresponding word $e_(a_0)$. It is fixed by $H_R$. Its coefficient in $v_(C_m)$ is $1$: within each increasingly ordered column it is the identity assignment $1 \, 2 \, dots.h \, m + 1 - j$. The coefficient of $e_(a_0)$ in every $h v_(C_m)$ is therefore also $1$, since $h^(- 1) e_(a_0) = e_(a_0)$. Its coefficient in $u$ is $\| H_R \| = product_(r = 1)^m r !$, which is nonzero.
  We next identify the alternating line in $V_R$. Frobenius reciprocity, the induction identity for a sign twist, and 4 give
  #[#set math.equation(numbering: n => "(3.5)")
   $ dim "Hom"_(H_R) \( epsilon.alt \|_(H_R) \, "Res"_(H_R)^G V_R \) & = dim "Hom"_G \( "Ind"_(H_R)^G epsilon.alt \|_(H_R) \, V_R \)\
 & = dim "Hom"_G \( M^(rho_m) ⊗ epsilon.alt \, V_R \)\
 & = dim "Hom"_G \( M^(rho_m) \, V_R ⊗ epsilon.alt \) = 1 . $ <dom:alternating-line>]
  For the last equality, $V_R ⊗ epsilon.alt tilde.equiv S^(rho_m)$ by self-conjugacy of the staircase, and $S^(rho_m)$ has multiplicity one in $M^(rho_m)$. As $v_(R_m)$ is nonzero and alternating under $H_R$, it spans the line in (3.5).
  Twisting the diagonal tensor product can be done in its second factor: the reassociation
  #[#set math.equation(numbering: n => "(3.6)")
   $ \( V_R ⊗ V_C \) ⊗ epsilon.alt arrow.r V_R ⊗ \( V_C ⊗ epsilon.alt \) \, #h(2em) \( x ⊗ y \) ⊗ z mapsto x ⊗ \( y ⊗ z \) $ <dom:twist-one-factor>]
  is a $G$-isomorphism. Choose a $G$-isomorphism $phi.alt : V_C ⊗ epsilon.alt arrow.r V_R$, which exists by (3.3) and $rho_m^t = rho_m$, and choose $0 eq.not z in epsilon.alt$. Since $u$ is $H_R$-fixed, $u ⊗ z$ is alternating under $H_R$. It follows from (3.5) that $phi.alt \( u ⊗ z \) = c thin v_(R_m)$ for some $c eq.not 0$. Tensor (3.4) with $z$ and apply the reassociation in (3.6), followed by $"id" ⊗ phi.alt$. The right-hand side becomes $c \( v_(R_m) ⊗ v_(R_m) \)$. Thus the image of $W_m ⊗ epsilon.alt$ under this isomorphism contains
  #[#set math.equation(numbering: n => "(3.7)")
   $ Z_m = bb(C) \[ G \] \( v_(R_m) ⊗ v_(R_m) \) med subset.eq med V_R ⊗ V_R . $ <dom:repeated-row-cyclic>]
  We construct a surjection from $Z_m$ onto $M^(rho_m)$. Let $E_(upright("out"))$ have basis $f_1 \, dots.h \, f_(2 m - 1)$ and define the linear map
  $ q : E_m ⊗ E_m arrow.r E_(upright("out")) \, #h(2em) q \( e_a ⊗ e_b \) = f_(a + b - 1) . $
  Regroup the two input layers by position, using ordinary tensor reassociation, and apply $q$ at every position. Then project onto the span $cal(M)_alpha$ of words in which letter $r$ occurs exactly $r$ times for $1 lt.eq r lt.eq m$, and no letter greater than $m$ occurs. Thus the content is $alpha = \( 1 \, 2 \, dots.h \, m \, 0 \, dots.h \, 0 \)$ in the output alphabet. Denote the resulting linear map by
  #[#set math.equation(numbering: n => "(3.8)")
   $ Q : E_m^(⊗ B_m) ⊗ E_m^(⊗ B_m) arrow.r cal(M)_alpha . $ <dom:pair-letter-map>]
  Both operations commute with position permutations: the same local map $q$ is used everywhere, and content is unchanged by $G$. Hence $Q$ is $G$-equivariant.
  Consider any summand in the expansion of $v_(R_m) ⊗ v_(R_m)$. On a row of length $r$, write its two assignments as $\( a_1 \, dots.h \, a_r \)$ and $\( b_1 \, dots.h \, b_r \)$, each a permutation of $1 \, dots.h \, r$, and put $c_j = a_j + b_j - 1$. Then
  #[#set math.equation(numbering: n => "(3.9)")
   $ sum_(j = 1)^r c_j = r^2 \, #h(2em) sum_(j = 1)^r c_j^2 - r^3 = sum_(j = 1)^r \( c_j - r \)^2 gt.eq 0 . $ <dom:square-minimum>]
  For a term retained by the content projection, the sum of squared output letters over the whole triangle is $sum_(r = 1)^m r^3$. Summing (3.9) over the rows forces equality on every row. Thus $c_j = r$ at every position in the row of length $r$. There is only one possible retained output word, namely
  $ t_m = ⨂_(\( i \, j \) in B_m) f_(m + 1 - i) . $
  It remains to compute its coefficient. On a row of length $r$, each of the $r !$ assignments $a_j = pi \( j \)$ has the unique compatible assignment $b_j = r + 1 - pi \( j \)$. The latter is the permutation $omega_r pi$, where $omega_r \( j \) = r + 1 - j$, so the product of the two alternating signs is
  $ "sgn" \( pi \) "sgn" \( omega_r pi \) = "sgn" \( omega_r \) = \( - 1 \)^(binom(r, 2)) . $
  The row contributions are independent. In particular, there is no cancellation, and the exact image is
  #[#set math.equation(numbering: n => "(3.10)")
   $ Q \( v_(R_m) ⊗ v_(R_m) \) = (\( - 1 \)^(sum_(r = 1)^m binom(r, 2)) product_(r = 1)^m r !) t_m eq.not 0 . $ <dom:noncancellation>]
  The stabilizer of $t_m$ is exactly $H_R$, since its equal-letter sets are the rows of $B_m$. Its orbit is a basis of $cal(M)_alpha$, and hence
  #[#set math.equation(numbering: n => "(3.11)")
   $ Q \( Z_m \) = bb(C) \[ G \] t_m = cal(M)_alpha tilde.equiv "Ind"_(H_R)^G upright(bold(1)) tilde.equiv M^(rho_m) . $ <dom:permutation-quotient>]
  This also explains why the increasing content $\( 1 \, 2 \, dots.h \, m \)$ gives the usual module indexed by the decreasing partition $rho_m$: reordering the content parts conjugates the standard Young subgroup.
  By 4, every $S^tau$ with $tau gt.closed.eq rho_m$ occurs in the quotient in (3.11). Semisimplicity and (3.7) imply that it occurs in $W_m ⊗ epsilon.alt$. If $rho_m gt.closed.eq lambda$, reversal of dominance under conjugation gives $lambda^t gt.closed.eq rho_m^t = rho_m$. Taking $tau = lambda^t$ and twisting back by $epsilon.alt$ proves that $S^lambda$ occurs in $W_m$. ◻
]

== 4 A quotient obtained by cutting off a band <sec:band-quotient>

The next step transfers support from a smaller cyclic staircase module and a band into $W_m$. The projection must retain their specified generators and realize the full induced module, not just a submodule of it. We first define the two factors and then verify both requirements.

Fix $s in { 1 \, 2 }$ and $h = m - s gt.eq 1$, and put

#[#set math.equation(numbering: n => "(4.1)")
 $ D = B_h \, #h(2em) F = B_m \\ D \, #h(2em) G = G_m = S_(B_m) \, #h(2em) H = S_D times S_F . $ <band:sets>]

Thus $\| F \| = N_m - N_h = s \( 2 m - s + 1 \) \/ 2$. Let $R_F$ and $C_F$ be the partitions of $F$ into its nonempty row and column intersections, with the orders inherited from $R_m$ and $C_m$. Each block has size at most $s$. In two layers with alphabet $1 \, dots.h \, s$, define

#[#set math.equation(numbering: n => "(4.2)")
 $ u_(m \, s) = v_(R_F) ⊗ v_(C_F) \, #h(2em) U_(m \, s) = bb(C) \[ S_F \] u_(m \, s) . $ <band:generator>]

The dependence on $m$ records the length of the band. Our goal is a quotient of $W_m$ induced from $W_h times.square U_(m \, s)$.

In the disjoint-coset model of induction [6] Section 3.3, translates of the inducing module form a direct sum. We record why disjoint coordinate sectors realize this model for the cyclic span of a specified vector, including the inverse map.

#thm([Lemma 4.1.])[
  (Induction from coordinate sectors).  #emph[Let a finite group $G$ act transitively on a finite set $Omega$. Suppose a $G$-module has a direct-sum decomposition $T = xor.big_(A in Omega) T_A$ with $g T_A = T_(g A)$. Fix $D in Omega$, let $H$ be its stabilizer, and take $z in T_D$. If $A_0 = bb(C) \[ H \] z$, then the map 
#[#set math.equation(numbering: n => "(4.3)")
 $ Phi : bb(C) \[ G \] ⊗_(bb(C) \[ H \]) A_0 arrow.r bb(C) \[ G \] z \, #h(2em) g ⊗ a mapsto g a $ <band:induced-map>]

 is an isomorphism of $G$-modules.]
] <lem:sector-induction>

#proof[
  The relation $\( g h \) ⊗ a = g ⊗ h a$, for $h in H$, has the same image on both sides, so $Phi$ is well-defined. It is equivariant and surjective. Choose $g_A in G$ with $g_A D = A$ for every $A in Omega$, and let $pi_A : T arrow.r T_A$ be the coordinate projection. Since
  $ bb(C) \[ G \] z = xor.big_(A in Omega) g_A A_0 \, #h(2em) g_A A_0 subset.eq T_A \, $
  we have $g_A^(- 1) pi_A \( y \) in A_0$ for $y in bb(C) \[ G \] z$. Define
  #[#set math.equation(numbering: n => "(4.4)")
   $ Psi \( y \) = sum_(A in Omega) g_A ⊗ g_A^(- 1) pi_A \( y \) . $ <band:induced-inverse>]
  Replacing $g_A$ by $g_A h$ does not change this expression, because $g_A h ⊗ h^(- 1) a = g_A ⊗ a$ in the balanced tensor product. Clearly $Phi Psi \( y \) = sum_A pi_A \( y \) = y$. For $g ⊗ a$, set $A = g D$ and write $g = g_A h$ with $h in H$. Only its $A$-sector is nonzero, and hence
  $ Psi Phi \( g ⊗ a \) = g_A ⊗ h a = g ⊗ a . $
  Thus the displayed maps are inverse isomorphisms. ◻
]

#thm([Proposition 4.2.])[
  (Band quotient).  #emph[For the parameters in (4.1), there is a surjective $G_m$-equivariant map 
#[#set math.equation(numbering: n => "(4.5)")
 $ W_m arrow.r.twohead "Ind"_(S_D times S_F)^(S_(B_m)) \( W_h times.square U_(m \, s) \) . $ <band:quotient>]

 In particular, every irreducible constituent of the induced module on the right is a constituent of $W_m$.]
] <prop:band-quotient>

#proof[
  #emph[Projection and the high positions.] Use the ordinary tensor identification
  $ E_m^(⊗ B_m) ⊗ E_m^(⊗ B_m) tilde.equiv \( E_m ⊗ E_m \)^(⊗ B_m) . $
  Put $E_(upright("lo")) = "span" \( e_1 \, dots.h \, e_s \)$ and $E_(upright("hi")) = "span" \( e_(s + 1) \, dots.h \, e_m \)$. On a pair-letter basis vector define
  $ p_s \( e_a ⊗ e_b \) = cases(delim: "{", e_a ⊗ e_b \, & a \, b lt.eq s upright(" or ") a \, b > s \,, 0 \, & upright("otherwise") \,) #h(2em) P_s = p_s^(⊗ B_m) . $
  The same local projection is used at every position, so $P_s$ commutes with $G$. Call a retained position #emph[high] when both letters are greater than $s$.
  In a retained word of $w_m$, let $A$ be the set of high positions. Alternation in the first layer gives row counts $r_i = max \( h + 1 - i \, 0 \)$, and alternation in the second gives column counts $d_j = max \( h + 1 - j \, 0 \)$, for $1 lt.eq i \, j lt.eq m$. For each $1 lt.eq k lt.eq m$, these counts satisfy
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(i = 1)^k r_i = \# { \( i \, j \) in B_h : i lt.eq k } = sum_(j = 1)^m min \( k \, d_j \) . $ <band:margin-equality>]
  Column $j$ can contribute at most $min \( k \, d_j \)$ high positions to the first $k$ rows. Equality of the sums in (4.6) therefore forces equality in every column. For $d_j > 0$, take $k = d_j$: all its $d_j$ high positions occupy the first $d_j$ rows. Columns with $d_j = 0$ have no high positions. Consequently
  #[#set math.equation(numbering: n => "(4.7)")
   $ A = { \( i \, j \) in B_m : i lt.eq h + 1 - j } = B_h = D . $ <band:unique-high-set>]
  For the zero-one matrix recording membership in $A$, this is the equality case of the row and column margin inequalities [16] Section 2. The specific staircase margins in (4.6) make every prefix bound an equality.
  #emph[Factorization with signs.] In a row or column block of length $r$, its intersection with $D$ is its initial segment of length $a = max \( r - s \, 0 \)$; its intersection with $F$ has length $b = min \( r \, s \)$. The retained assignments put the high letters $s + 1 \, dots.h \, r$ on the first segment and the low letters $1 \, dots.h \, b$ on the second. Let $"Alt"$ denote the unnormalized alternation of a displayed list, placed in the indicated segment, with $"Alt" \( diameter \) = 1$. The part of the block tensor with this prescribed high set is exactly
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( - 1 \)^(a b) thin "Alt" \( e_(s + 1) \, dots.h \, e_r \) ⊗ "Alt" \( e_1 \, dots.h \, e_b \) . $ <band:block-factorization>]
  Here the high list is empty when $r lt.eq s$. Indeed, every high letter precedes every low letter in the position order, giving $a b$ inversions; all other inversions are internal to the two independently permuted lists. Every such pair of permutations occurs once. In particular, when $r < s$ the formula is just the original alternation on $e_1 \, dots.h \, e_r$.
  Rows and columns both have the length list $m \, m - 1 \, dots.h \, 1$. Thus their cross signs in (4.8) multiply to
  $ product_(r = 1)^m \( - 1 \)^(2 max \( r - s \, 0 \) min \( r \, s \)) = 1 . $
  Identify $E_h$ with $E_(upright("hi"))$ by $e_a mapsto e_(s + a)$, and write $tilde(w)_h$ and $tilde(W)_h$ for the images of $w_h$ and $W_h$ in the two high-letter layers on $D$. The low portions are precisely the blocks of $R_F \, C_F$. Regrouping the factors over the disjoint sets $D \, F$ introduces no signs, and hence
  #[#set math.equation(numbering: n => "(4.9)")
   $ z := P_s \( w_m \) = tilde(w)_h ⊗ u_(m \, s) eq.not 0 . $ <band:generator-factorization>]
  The nonvanishing follows also directly from the nonzero alternating tensors on each disjoint block.
  The two factors of $H = S_D times S_F$ act independently on this tensor, while each acts diagonally on the two layers over its own position set. Therefore
  #[#set math.equation(numbering: n => "(4.10)")
   $ A_0 := bb(C) \[ H \] z & = "span" { \( sigma tilde(w)_h \) ⊗ \( tau u_(m \, s) \) : sigma in S_D \, med tau in S_F }\
 & = tilde(W)_h times.square U_(m \, s) tilde.equiv W_h times.square U_(m \, s) . $ <band:subgroup-orbit>]
  The second equality follows by expanding tensors of linear combinations of the two separate orbit sets.
  #emph[The coordinate sectors.] Let $Omega$ be the set of subsets $A subset B_m$ of size $\| D \|$. Within the pair-letter space define
  $ T_A = \( E_(upright("hi")) ⊗ E_(upright("hi")) \)^(⊗ A) ⊗ \( E_(upright("lo")) ⊗ E_(upright("lo")) \)^(⊗ \( B_m \\ A \)) . $
  These are the coordinate spans of words high exactly on $A$. They have disjoint word bases, so their sum is direct, and $g T_A = T_(g A)$. By (4.9), $z in T_D$; the stabilizer of $D$ in $G$ is exactly $H$. Apply 7 and (4.10) to obtain
  $ bb(C) \[ G \] z tilde.equiv "Ind"_H^G A_0 tilde.equiv "Ind"_H^G \( W_h times.square U_(m \, s) \) . $
  Since $P_s$ is equivariant, $P_s \( W_m \) = bb(C) \[ G \] P_s \( w_m \) = bb(C) \[ G \] z$. Its restriction to $W_m$, followed by the inverse map $Psi$ in (4.4) and the identification of $A_0$ in (4.10), gives (4.5). The image of this ambient projection need not lie in the two original Specht factors; the composition is still a surjective $G$-equivariant linear map onto the displayed module. Semisimplicity over $bb(C)$ proves the last assertion. ◻
]

== 5 Cyclic support of the bands <sec:path-band>

For the band step of the induction, it remains to determine the support needed in $U_(m \, 1)$ and $U_(m \, 2)$ for 8. The width-one factor is trivial. For width two we will detect every shape with at most four rows directly in the specified generator, using the invariant evaluation pairing.

For width one, the band consists of the $m$ positions with $i + j = m + 1$. Every row and column block is a singleton, and both alphabets consist only of the letter $1$. Thus $u_(m \, 1)$ is a nonzero constant word tensor, fixed by every position permutation, and

#[#set math.equation(numbering: n => "(5.1)")
 $ U_(m \, 1) tilde.equiv S^(\( m \)) #h(2em) \( m gt.eq 2 \) . $ <path:one-band>]

We now determine the support needed from the particular width-two generator.

=== 5.1 The indexed path contraction <the-indexed-path-contraction>

Let $m gt.eq 3$, $K = 2 m - 1$, and $F = B_m \\ B_(m - 2)$. Number its positions along the path by

#[#set math.equation(numbering: n => "(5.2)")
 $ p_(2 j - 1) = \( m + 1 - j \, j \) quad \( 1 lt.eq j lt.eq m \) \, #h(2em) p_(2 j) = \( m - j \, j \) quad \( 1 lt.eq j < m \) . $ <path:positions>]

In this numbering, the row blocks are the singleton $1$ and the pairs $\( 2 \, 3 \) \, \( 4 \, 5 \) \, dots.h \, \( K - 1 \, K \)$; the column blocks are $\( 1 \, 2 \) \, \( 3 \, 4 \) \, dots.h \, \( K - 2 \, K - 1 \)$ and the singleton $K$. Order each pair by increasing path index and let $u$ denote the resulting alternating band tensor. The row orders agree with increasing $j$, while each of the $m - 1$ column pairs reverses increasing $i$. Consequently

#[#set math.equation(numbering: n => "(5.3)")
 $ u = \( - 1 \)^(m - 1) u_(m \, 2) \, #h(2em) U_(m \, 2) = bb(C) \[ S_F \] u . $ <path:generator-sign>]

1 illustrates the numbering and the consecutive segments used in 12.

#figure(
  [(430,155) (90,148)(0,0)Band in $B_3$ (10,139)(1,0)25 (39,139)(0,0)$j$ (10,139)(0,-1)25 (10,108)(0,0)$i$ (45,110) (45,123)(0,0)$D = B_1$ (45,30) (45,70) (90,70) (90,110) (135,110) (45,34)(0,1)32 (90,74)(0,1)32 (49,70)(8,0)4(1,0)4 (81,70)(1,0)5 (94,110)(8,0)4(1,0)4 (126,110)(1,0)5 (45,16)(0,0)$p_1$ (30,70)(0,0)$p_2$ (106,70)(0,0)$p_3$ (90,124)(0,0)$p_4$ (135,124)(0,0)$p_5$ (305,148)(0,0)Dual-test columns for $eta = \( 2 \, 2 \, 1 \)$ (220,90)(40,0)3 (350,90) (390,90) (224,90)(1,0)32 (264,90)(8,0)3(1,0)4 (288,90)(1,0)8 (304,90)(1,0)42 (354,90)(8,0)3(1,0)4 (378,90)(1,0)8 (220,76)(0,0)$p_1$ (260,76)(0,0)$p_2$ (300,76)(0,0)$p_3$ (350,76)(0,0)$p_4$ (390,76)(0,0)$p_5$ (325,70)(0,1)38 (215,55)(1,0)90 (215,55)(0,1)6 (305,55)(0,1)6 (260,43)(0,0)$r_1 = 3$ (335,55)(1,0)60 (335,55)(0,1)6 (395,55)(0,1)6 (365,43)(0,0)$r_2 = 2$],
  caption: [Figure 1: The width-two band for $m = 3$. Solid arrows are column pairs; dashed arrows are row pairs, all directed by increasing path index. Column arrows reverse increasing $i$, as in (5.3). The row singleton is $p_1$ and the column singleton is $p_5$, each carrying the fixed letter $1$ in its layer. On the right, the dual-test tableau of shape $eta = \( 2 \, 2 \, 1 \)$ has column lengths $r_1 = 3$ and $r_2 = 2$, giving the two bracketed consecutive segments. The gray vertical line separates these segments, which differ from the original pair blocks. ],
) <fig:band-path>

Put $E = bb(C)^2$ with basis $e_1 \, e_2$ and $V = E ⊗ E$. Ordinary tensor reassociation identifies the two band layers with $V^(⊗ K)$, using the position order in (5.2). Identify $V^(*)$ with $"Mat"_2 \( bb(C) \)$ by letting a matrix $X$ take the value $X_(a b)$ on $e_a ⊗ e_b$. All pairings below are bilinear evaluation pairings. Write

$ J = mat(delim: "(", 0, 1; - 1, 0) . $

#thm([Lemma 5.1.])[
  (Path contraction).  #emph[For arbitrary $X_1 \, dots.h \, X_K in "Mat"_2 \( bb(C) \)$, 
#[#set math.equation(numbering: n => "(5.4)")
 $ ⟨u \, X_1 ⊗ dots.h.c ⊗ X_K⟩ = \( - 1 \)^(m - 1) [X_1 "adj" \( X_2 \) X_3 "adj" \( X_4 \) dots.h.c X_(K - 2) "adj" \( X_(K - 1) \) X_K]_11 . $ <path:contraction-formula>]

]
] <path:contraction>

#proof[
  The two singleton blocks require the first row-layer index and last column-layer index to be $1$. The coefficient of an alternating pair in path order is $J_(a b)$. Hence the left side of (5.4) is exactly
  #[#set math.equation(numbering: n => "(5.5)")
   $ sum_(a_1 \, dots.h \, a_K \, b_1 \, dots.h \, b_K in { 1 \, 2 }\
a_1 = b_K = 1) (product_(ell = 1)^(m - 1) J_(b_(2 ell - 1) \, b_(2 ell)) J_(a_(2 ell) \, a_(2 ell + 1))) product_(q = 1)^K \( X_q \)_(a_q b_q) . $ <path:index-sum>]
  Reading the contracted indices successively from $a_1$ to $b_K$ gives
  $ [X_1 J X_2^(sans(T)) J X_3 J X_4^(sans(T)) J dots.h.c X_(K - 2) J X_(K - 1)^(sans(T)) J X_K]_11 . $
  The transpose at an even position records that its column index is encountered before its row index. For $X = mat(delim: "(", a, b; c, d)$, direct multiplication gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ "adj" \( X \) = mat(delim: "(", d, - b; - c, a) = "tr" \( X \) I - X \, #h(2em) J X^(sans(T)) J = - "adj" \( X \) . $ <path:adjugate>]
  There are $m - 1$ even positions, yielding the stated sign. In particular, adjugation is a linear operation on $"Mat"_2 \( bb(C) \)$. ◻
]

=== 5.2 Alternating consecutive segments <alternating-consecutive-segments>

For a shape with at most four rows, place its tableau columns on successive disjoint segments of the path. On a segment of length $r$, the dual polytabloid alternates the first $r$ elements of one common basis of $V^(*)$. The contraction formula therefore assigns an alternating matrix sum to each segment; these sums multiply in path order. We now choose the basis so that every such segment matrix, for $1 lt.eq r lt.eq 4$ and either starting parity, is invertible.

Use the following ordered basis of $V^(*)$:

#[#set math.equation(numbering: n => "(5.7)")
 $ M_1 = I \, #h(2em) M_2 = Z = mat(delim: "(", 1, 0; 0, - 1) \, #h(2em) M_3 = T = mat(delim: "(", 0, 1; 1, 0) \, #h(2em) M_4 = J = Z T . $ <path:matrix-basis>]

These matrices are linearly independent: $I \, Z$ span the diagonal matrices and $T \, J$ span the off-diagonal matrices. The last three are traceless and anticommute in pairs; moreover

$ Z^2 = T^2 = I \, #h(2em) J^2 = - I . $

Thus all four are invertible. Alternating evaluations on $Z \, T \, J$ are also used to test polynomial identities for two-by-two matrices with adjugation [4] Section 3; here the adjugations are determined by the path positions.

For a global path position $q$, define the linear operation

$ D_q \( X \) = cases(delim: "{", X \, & q upright(" odd") \,, "adj" \( X \) \, & q upright(" even") .) $

For a segment of length $r lt.eq 4$ beginning at position $p$, define its alternating matrix by the following sum of ordered products:

#[#set math.equation(numbering: n => "(5.8)")
 $ A_(r \, p) = sum_(pi in S_r) "sgn" \( pi \) D_p \( M_(pi \( 1 \)) \) D_(p + 1) \( M_(pi \( 2 \)) \) dots.h.c D_(p + r - 1) \( M_(pi \( r \)) \) . $ <path:segment-definition>]

#thm([Lemma 5.2.])[
  (Segment alternation).  #emph[Let $e$ be the number of even positions among $p \, dots.h \, p + r - 1$, and put $delta = 1$ if $p$ is even and $delta = 0$ otherwise. Then 
#[#set math.equation(numbering: n => "(5.9)")
 $ A_(r \, p) = r ! \( - 1 \)^(e - delta) M_1 dots.h.c M_r . $ <path:segment-formula>]

 In particular, all these matrices are invertible. Their values are 
#[#set math.equation(numbering: n => "(5.10)")
 $ r & p upright(" odd") & p upright(" even")\
1 & I & I\
2 & - 2 Z & 2 Z\
3 & - 6 J & - 6 J\
4 & - 24 I & 24 I $ <path:segment-table>]

]
] <path:segment>

#proof[
  Fix a permutation $pi$ and let $j$ be the local slot occupied by $M_1 = I$. Deleting $I$ leaves a permutation of $M_2 \, dots.h \, M_r$. Its sign is exactly the sign acquired when those pairwise anticommuting matrices are reordered. Moving $I$ from its first canonical slot to slot $j$ contributes $\( - 1 \)^(j - 1)$ to $"sgn" \( pi \)$ and changes no matrix product. It follows that
  $ "sgn" \( pi \) M_(pi \( 1 \)) dots.h.c M_(pi \( r \)) = \( - 1 \)^(j - 1) M_1 dots.h.c M_r . $
  By (5.6), adjugation fixes $I$ and negates each of the other basis matrices. Write $epsilon.alt_j = 1$ if $p + j - 1$ is even, and $0$ otherwise. Adjugation therefore contributes the additional sign $\( - 1 \)^(e - epsilon.alt_j)$. Since $epsilon.alt_j equiv delta + j - 1 med \( mod med 2 \)$, the total sign is $\( - 1 \)^(e - delta)$, independently of $pi$. All $r !$ summands in (5.8) consequently agree, proving (5.9), including $r = 1$. Finally, the canonical products for $r = 1 \, 2 \, 3 \, 4$ are respectively $I \, Z \, J \, - I$, which gives (5.10). ◻
]

=== 5.3 Detection by a dual polytabloid <detection-by-a-dual-polytabloid>

The segment calculation gives an invertible ordered product. Its fixed endpoint entry can nevertheless vanish. We now choose the dual test basis so that this entry is nonzero, while keeping the band generator and its endpoint letters unchanged.

#thm([Proposition 5.3.])[
  (Four-row support of the width-two band).  #emph[For every $m gt.eq 3$ and every partition $eta tack.r 2 m - 1$ with $"len" \( eta \) lt.eq 4$, the irreducible module $S^eta$ occurs in $U_(m \, 2)$.]
] <prop:two-band>

#proof[
  Let $r_1 \, dots.h \, r_c$ be the column lengths of $eta$ in their usual order, so $1 lt.eq r_j lt.eq 4$ and $sum_j r_j = K$. Partition the path into consecutive segments of these lengths, beginning at $s_j = 1 + sum_(i < j) r_i$. For any ordered basis $N_1 \, dots.h \, N_4$ of $V^(*)$, let $t_N$ be the dual tensor whose factor on segment $j$ is
  $ sum_(pi in S_(r_j)) "sgn" \( pi \) N_(pi \( 1 \)) ⊗ dots.h.c ⊗ N_(pi \( r_j \)) . $
  The segments are the columns of a tableau of shape $eta$ and the initial basis entries label its rows. By 2, their product $t_N$ is a polytabloid, and
  $ cal(T)_N = bb(C) \[ S_F \] t_N med subset.eq med \( V^(*) \)^(⊗ K) quad upright("is irreducible of type ") eta . $
  First take $N_i = M_i$. Multilinearity of (5.4) and the definition of $t_M$ give
  #[#set math.equation(numbering: n => "(5.11)")
   $ chevron.l u \, t_M chevron.r = \( - 1 \)^(m - 1) \[ B \]_11 \, #h(2em) B = A_(r_1 \, s_1) A_(r_2 \, s_2) dots.h.c A_(r_c \, s_c) . $ <path:ordered-factorization>]
  Indeed, summing independently over the permutations within each segment is exactly the distributive expansion of the displayed ordered product. The segments are consecutive, so no matrix factors are interchanged in this factorization. By 10, $B$ is invertible.
  The identity $"adj" \( X \) = "tr" \( X \) I - X$ also shows that, for every $Q in "GL"_2 \( bb(C) \)$,
  $ D_q \( Q X Q^(- 1) \) = Q D_q \( X \) Q^(- 1) . $
  Choose an eigenvector $v$ of $B$ with eigenvalue $beta$; invertibility gives $beta eq.not 0$. Choose $Q$ taking $v$ to the first coordinate vector and set $N_i = Q M_i Q^(- 1)$. Conjugation is an invertible linear operation on $V^(*)$, so these $N_i$ are still an ordered basis. Each alternating segment matrix is now $Q A_(r_j \, s_j) Q^(- 1)$, and their ordered product is $Q B Q^(- 1)$. Since $\( Q B Q^(- 1) \) e_1 = beta e_1$,
  #[#set math.equation(numbering: n => "(5.12)")
   $ chevron.l u \, t_N chevron.r = \( - 1 \)^(m - 1) \[ Q B Q^(- 1) \]_11 = \( - 1 \)^(m - 1) beta eq.not 0 . $ <path:nonzero-pairing>]
  Only the test covectors have changed; $u$ and its endpoint letters remain those fixed in (5.3), (5.5).
  The invariant evaluation pairing defines
  #[#set math.equation(numbering: n => "(5.13)")
   $ Phi : U_(m \, 2) arrow.r cal(T)_N^(*) \, #h(2em) Phi \( x \) \( t \) = chevron.l x \, t chevron.r . $ <path:quotient-map>]
  For $g in S_F$, its equivariance follows explicitly from $Phi \( g x \) \( t \) = chevron.l x \, g^(- 1) t chevron.r = \( g Phi \( x \) \) \( t \)$. By (5.12) this map is nonzero on the particular generator $u$. Its target is irreducible and, by the self-duality in (2.3), has type $eta$. Thus $Phi$ is surjective, and semisimplicity proves the claimed occurrence in $U_(m \, 2)$. ◻
]

#prodef([Example 5.4.])[
  The change of test basis can be essential. For $m = 3$ and $eta = \( 2 \, 2 \, 1 \)$, the column segments have lengths $3 \, 2$, beginning at positions $1 \, 4$. Their product in (5.11) is $\( - 6 J \) \( 2 Z \) = 12 T$, whose $\( 1 \, 1 \)$ entry vanishes. With
  $ Q = mat(delim: "(", 1, 1; 1, 2) \, #h(2em) Q T Q^(- 1) = mat(delim: "(", 1, 0; 3, - 1) \, $
  the resulting pairing is $12$, since $\( - 1 \)^(m - 1) = 1$.
] <path:conjugation-example>

== 6 Completion of the induction <sec:completion>

We now combine the two band quotients with the dominance case. The combinatorial point is that a partition outside the dominance range either has a long enough first row for a width-one cut, or has enough boxes in its first four rows for a width-two cut.

#thm([Lemma 6.1.])[
  (Horizontal-strip reduction).  #emph[Let $m gt.eq 2$ and $lambda tack.r N_m$. If $lambda$ is not dominated by $rho_m$, then at least one of the following holds.]
  + #emph[There is a partition $nu tack.r N_(m - 1)$ such that $lambda \/ nu$ is a horizontal strip of size $m$.]
  + #emph[One has $m gt.eq 5$, and there are partitions 
$ nu = lambda^(\( 0 \)) subset lambda^(\( 1 \)) subset dots.h.c subset lambda^(\( q \)) = lambda \, #h(2em) q lt.eq 4 \, $

 with $nu tack.r N_(m - 2)$ and every $lambda^(\( i \)) \/ lambda^(\( i - 1 \))$ a nonempty horizontal strip. Their total size is $2 m - 1$.]
] <comb:strip-reduction>

#proof[
  Unlike the deletion in 4, this reduction need not preserve a prescribed dominance inequality; a rightmost suffix suffices to preserve the partition. If $lambda_1 gt.eq m$, remove the bottom box in each of the rightmost $m$ nonempty columns. Subtracting one from this suffix of the column-height sequence preserves weak decrease and nonnegativity. The remaining boxes therefore form a partition $nu$, and the deleted boxes form a horizontal strip. Since $N_m - m = N_(m - 1)$, this proves (i).
  Suppose instead that $lambda_1 lt.eq m - 1$. Failure of domination gives an index $k < m$ with
  #[#set math.equation(numbering: n => "(6.1)")
   $ sum_(i = 1)^k lambda_i > k m - frac(k \( k - 1 \), 2) . $ <comb:dominance-failure>]
  The index is less than $m$ because the first $m$ parts of the staircase already have sum $N_m$. For $k lt.eq 3$, however,
  $ sum_(i = 1)^k lambda_i lt.eq k \( m - 1 \) lt.eq k m - frac(k \( k - 1 \), 2) . $
  Thus $4 lt.eq k < m$, and in particular $m gt.eq 5$. Because the parts decrease, the mean of the first four is at least the mean of the first $k$. Hence
  #[#set math.equation(numbering: n => "(6.2)")
   $ sum_(i = 1)^4 lambda_i gt.eq 4 / k sum_(i = 1)^k lambda_i > 4 m - 2 \( k - 1 \) gt.eq 2 m + 4 > 2 m - 1 . $ <comb:four-row-capacity>]
  A full sweep removes the bottom box of every nonempty column. If the current row lengths are $\( alpha_1 \, alpha_2 \, dots.h \)$, subtracting one from all its positive column heights gives row lengths $\( alpha_2 \, alpha_3 \, dots.h \)$. The remaining diagram is nested in the original one, and the removed cells form a horizontal strip of size $alpha_1$. Four full sweeps starting from $lambda$ would therefore remove $lambda_1 + dots.h.c + lambda_4$ boxes.
  Perform full sweeps until the remaining number of boxes to be removed is at most the number of nonempty columns, then remove that number of bottom boxes from the rightmost columns. The suffix argument in the first paragraph shows that this last partial sweep also leaves a partition. By (6.2), at most four nonempty sweeps remove exactly $2 m - 1$ boxes. Their remainder has size $N_m - \( 2 m - 1 \) = N_(m - 2)$. Reversing the sequence gives (ii). ◻
]

Four strips can be necessary. Take $m = 13$ and $lambda = \( 8^11 \, 3 \)$, where the exponent denotes eleven repeated parts equal to $8$. This partition has size $91 = N_13$ and fails domination at $k = 12$, since its first twelve parts sum to $91 > 90$. Every horizontal strip in its eight-column diagram has at most eight boxes, so three strips cannot remove the required $25 = 2 m - 1$ boxes. The sweeps remove $8 + 8 + 8 + 1 = 25$ boxes and leave $nu = \( 8^7 \, 7 \, 3 \)$ of size $66 = N_11$.

#proof[
  We induct on $m$. The module $W_1$ is the one-dimensional representation of the one-element group, so the assertion holds at $m = 1$.
  Let $m gt.eq 2$, suppose the assertion holds for all smaller positive indices, and fix $lambda tack.r N_m$. If $rho_m gt.closed.eq lambda$, then 6 supplies $S^lambda$ in $W_m$. Otherwise apply 13.
  In case (i), use the band cut with $s = 1$, so $\| D \| = N_(m - 1)$ and $\| F \| = m$. The width-one band module $U_(m \, 1)$ is trivial. By the induction hypothesis, $S_D^nu$ is a constituent of $W_(m - 1)$. By 3, $S_(B_m)^lambda$ occurs in
  $ "Ind"_(S_D times S_F)^(S_(B_m)) #scale(x: 120%, y: 120%)[\(] S_D^nu times.square upright(bold(1)) #scale(x: 120%, y: 120%)[\)] . $
  Consequently it occurs in the quotient from 8 and hence in $W_m$.
  In case (ii), put $K = 2 m - 1$ and use the cut with $s = 2$. Write $b_i = \| lambda^(\( i \)) \| - \| lambda^(\( i - 1 \)) \|$, so that $b_1 + dots.h.c + b_q = K$ and $q lt.eq 4$. Choose disjoint subsets of $F$ of these sizes and form the permutation module
  $ A = "Ind"_(S_(b_1) times dots.h.c times S_(b_q))^(S_F) upright(bold(1)) tilde.equiv xor.big_(eta tack.r K) \( S_F^eta \)^(xor a_eta) . $
  Repeated application of 3, followed by transitivity of induction, shows that $S_(B_m)^lambda$ is a constituent of $"Ind"_(S_D times S_F)^(S_(B_m)) \( S_D^nu times.square A \)$. Equivalently,
  #[#set math.equation(numbering: n => "(6.3)")
   $ sum_(eta tack.r K) a_eta c_(nu \, eta)^lambda > 0 \,\
c_(nu \, eta)^lambda = dim "Hom"_(S_(B_m)) #h(-0.16667em) (S_(B_m)^lambda \, "Ind"_(S_D times S_F)^(S_(B_m)) \( S_D^nu times.square S_F^eta \)) . $ <comb:positive-multiplicity>]
  Here the coefficients are nonnegative integers. Moreover, every constituent of $A$ has at most $q$ rows: starting from the empty diagram, each of the $q$ horizontal-strip additions can introduce at most one new row, because two new rows would both require a new box in the first column. Thus (6.3) provides some $eta$ with at most four rows, $a_eta > 0$, and $c_(nu \, eta)^lambda > 0$.
  By 11, this $S_F^eta$ occurs in $U_(m \, 2)$. By induction, $S_D^nu$ occurs in the specified cyclic module $W_(m - 2)$. One copy of each suffices to give $S_(B_m)^lambda$ in
  $ "Ind"_(S_D times S_F)^(S_(B_m)) \( W_(m - 2) times.square U_(m \, 2) \) \, $
  which is a quotient of $W_m$ by 8. Complete reducibility again gives the constituent in $W_m$ itself. This completes the induction. Notice that case (ii) has $m gt.eq 5$, so every smaller module invoked has a positive index.
  ◻
]

#proof[
  The two factors generating $W_m$ have Specht type $rho_m$. Thus $W_m$ is a submodule of $S^(rho_m) ⊗_(bb(C)) S^(rho_m)$ under the diagonal action. 5 supplies every $S^lambda$ in that submodule, so $g \( rho_m \, rho_m \, lambda \) > 0$ for every permitted $m$ and $lambda$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Christine Bessenrodt, #emph[Critical classes, Kronecker products of spin characters, and the Saxl conjecture], Algebraic Combinatorics #strong[1] (2018), no.~3, 353--369. #link("https://doi.org/10.5802/alco.18")[doi:10.5802/alco.18].]
#bibitem([2])[C.~Bessenrodt, C.~Bowman, and L.~Sutton, #emph[Kronecker positivity and 2-modular representation theory], Transactions of the American Mathematical Society, Series B #strong[8] (2021), 1024--1055. #link("https://doi.org/10.1090/btran/70")[doi:10.1090/btran/70].]
#bibitem([3])[Andrew A.~H. Brown, Stephanie van Willigenburg, and Mike Zabrocki, #emph[Expressions for Catalan Kronecker products], Pacific Journal of Mathematics #strong[248] (2010), no.~1, 31--48. #link("https://doi.org/10.2140/pjm.2010.248.31")[doi:10.2140/pjm.2010.248.31].]
#bibitem([4])[Vesselin Drensky and Antonio Giambruno, #emph[Cocharacters, codimensions and Hilbert series of the polynomial identities for $2 times 2$ matrices with involution], Canadian Journal of Mathematics #strong[46] (1994), no.~4, 718--733. #link("https://doi.org/10.4153/CJM-1994-040-6")[doi:10.4153/CJM-1994-040-6].]
#bibitem([5])[Mahdi Ebrahimi, #emph[The problem of deciding the positivity of Kronecker coefficients and Saxl conjecture], preprint, 2025. #link("https://arxiv.org/abs/2511.03484v3")[arXiv:2511.03484v3].]
#bibitem([6])[William Fulton and Joe Harris, #emph[Representation Theory: A First Course], Graduate Texts in Mathematics, vol.~129, Springer-Verlag, New York, 1991. #link("https://doi.org/10.1007/978-1-4612-0979-9")[doi:10.1007/978-1-4612-0979-9].]
#bibitem([7])[Nate Harman and Christopher Ryba, #emph[A tensor-cube version of the Saxl conjecture], Algebraic Combinatorics #strong[6] (2023), no.~2, 507--511. #link("https://doi.org/10.5802/alco.267")[doi:10.5802/alco.267].]
#bibitem([8])[Gerhard Heide, Jan Saxl, Pham Huu Tiep, and Alexandre E.~Zalesski, #emph[Conjugacy action, induced representations and the Steinberg square for simple groups of Lie type], Proceedings of the London Mathematical Society (3) #strong[106] (2013), no.~4, 908--930. #link("https://doi.org/10.1112/plms/pds062")[doi:10.1112/plms/pds062].]
#bibitem([9])[Christian Ikenmeyer, #emph[The Saxl conjecture and the dominance order], Discrete Mathematics #strong[338] (2015), no.~11, 1970--1975. #link("https://doi.org/10.1016/j.disc.2015.04.027")[doi:10.1016/j.disc.2015.04.027]. #link("https://arxiv.org/abs/1410.6549v2")[arXiv:1410.6549v2].]
#bibitem([10])[G.~D. James, #emph[The Representation Theory of the Symmetric Groups], Lecture Notes in Mathematics, vol.~682, Springer-Verlag, Berlin--Heidelberg, 1978. #link("https://doi.org/10.1007/BFb0067708")[doi:10.1007/BFb0067708].]
#bibitem([11])[Emmanuel Letellier and GyeongHyeon Nam, #emph[The Saxl conjecture and the tensor square of unipotent characters of $"GL"_n \( q \)$], Algebraic Combinatorics #strong[8] (2025), no.~4, 1119--1140. #link("https://doi.org/10.5802/alco.434")[doi:10.5802/alco.434].]
#bibitem([12])[Xin Li, #emph[Saxl Conjecture for triple hooks], Discrete Mathematics #strong[344] (2021), no.~6, article 112340. #link("https://doi.org/10.1016/j.disc.2021.112340")[doi:10.1016/j.disc.2021.112340].]
#bibitem([13])[Sammy Luo and Mark Sellke, #emph[The Saxl conjecture for fourth powers via the semigroup property], Journal of Algebraic Combinatorics #strong[45] (2017), no.~1, 33--80. #link("https://arxiv.org/abs/1511.02387v2")[arXiv:1511.02387v2].]
#bibitem([14])[OpenAI, #emph[Universal Tensor Squares for Symmetric Groups], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026/main.pdf")[OAI:Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026], 2026.]
#bibitem([15])[Igor Pak, Greta Panova, and Ernesto Vallejo, #emph[Kronecker products, characters, partitions, and the tensor square conjectures], Advances in Mathematics #strong[288] (2016), 702--731. #link("https://doi.org/10.1016/j.aim.2015.11.002")[doi:10.1016/j.aim.2015.11.002]. #link("https://arxiv.org/abs/1304.0738v2")[arXiv:1304.0738v2]. Cited numbering follows this version.]
#bibitem([16])[H.~J. Ryser, #emph[Combinatorial properties of matrices of zeros and ones], Canadian Journal of Mathematics #strong[9] (1957), 371--377. #link("https://doi.org/10.4153/CJM-1957-044-3")[doi:10.4153/CJM-1957-044-3].]


