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

#align(center)[#text(size: 16pt, weight: "bold")[Finite algebraic envelopes and the Boone--Higman conjecture]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The word problem for a group with a specified finite generating set asks whether a given word in the generators
  and their inverses represents the identity. It is #emph[decidable] if an algorithm answers this question for
  every word. A group is #emph[simple] here if it is nontrivial and its only normal subgroups are the identity
  subgroup and the whole group.

#thm([Theorem 1.1.])[
  #emph[For every finitely generated group $G$, the following are equivalent:]
  + #emph[$G$ has decidable word problem.]
  + #emph[$G$ embeds in a finitely presented simple group.]
] <thm:main>

An embedding throughout means an injective group homomorphism.
  In the constructive implication, $G$ is supplied with a finite generating set and a word-problem decider;
  it need not be finitely presented. Theorem 1 resolves the Boone–Higman conjecture positively.

Higman’s embedding theorem characterizes the finitely generated subgroups of finitely presented groups as those
  admitting a recursively enumerable set of defining relations #cite(label("Higman61"));
  see also #cite(label("AanderaaCohen1980")) Theorem A. Decidability of the word problem is stronger:
  it supplies an algorithm for both equality and inequality.
  Boone and Higman characterized this condition by the existence of embeddings

$ G med lt.eq med H med lt.eq med K \, wide H upright(" simple") \, quad K upright(" finitely presented") $

#cite(label("BH74")) Theorem I. They asked whether the simple overgroup $H$ could itself be chosen finitely
  presented #cite(label("BH74")) p. 43. The two properties in their theorem belong to different groups,
  and finite presentation does not in general pass to subgroups.
  Thompson subsequently obtained a finitely generated simple overgroup with decidable word problem
  #cite(label("Tho80")); a later proof appears in #cite(label("DarbinyanSteenbock2022")) Theorem 7.1.
  This strengthens the conclusion to finite generation of the simple overgroup,
  but does not supply its finite presentation.

Positive cases of the conjecture include hyperbolic and contracting self-similar groups
  #cite(label("BBMZhyperbolic")) Theorem A and Corollary D,
  Baumslag–Solitar groups and finite-rank free-by-cyclic groups #cite(label("BuxLlosaWu2025")) Theorem A,
  and automorphism groups of finite-rank free groups and mapping class groups of orientable punctured surfaces of
  finite type #cite(label("BFFHZ")) Theorem A and Corollary B.
  The survey #cite(label("BBMZsurvey")) describes further results and the development of the conjecture.

Our principal intermediate result concerns permutation actions.
  An action on a set $X$ is #emph[faithful] if only the identity acts trivially,
  and #emph[two-transitive] if it is transitive on the ordered pairs of distinct points of $X$.

#thm([Theorem 1.2.])[
  #emph[Every finitely generated group with decidable word problem embeds in a finitely presented group $Gamma$
    admitting a faithful two-transitive action on a countably infinite set.
    Every point stabilizer of this action is finitely generated.]
] <thm:envelope>

The action is designed for the twisted Brin–Thompson construction of Belk and Zaremsky,
  which embeds an acting group in a simple group #cite(label("BelkZaremsky2022")) Section 3 and Theorem 3.4.
  Their original finite-presentation theorem used finitely many orbits on finite subsets of each size and finitely
  presented finite-set stabilizers #cite(label("BelkZaremsky2022")) Theorem D.
  Zaremsky subsequently showed that finite presentation of the acting group,
  finite generation of point stabilizers, and finitely many orbits on unordered pairs suffice
  #cite(label("Zaremsky2024Finite")) Theorem A and Corollary B. Two-transitivity supplies the last condition here.
  We state this criterion precisely in Theorem 5; the construction below provides its faithful action and the
  embedding of the prescribed group.

=== The proof <the-proof>

The action is affine. Translations move the first point of an ordered pair to zero,
  so two-transitivity reduces to transitivity of the linear part on nonzero vectors.
  A simple algebra $A$ provides the required coefficient operations:
  if $0 eq.not m in A$, then its identity belongs to $A m A$,
  and hence is a finite sum of left and right multiples of $m$.
  Elementary row operations can use this identity to move vectors.
  Finite presentation, however, will come from a different algebra.

Over $k = bb(F)_2$, we construct a finitely presented algebra $B$,
  a simple subalgebra $A subset.eq B$ with its own identity, and an injective nonunital map $phi.alt : B arrow.r
  B$ with image in $A$. The additive direct limit $M_oo = "inj lim" \( B \, phi.alt \)$ is the carrier for the
  action on $X = M_oo^6$. Every finite collection of its coordinates lies in one copy of $B$;
  advancing once places them in $A$. Thus simplicity becomes available at a later stage without requiring the
  finitely presented algebra $B$ itself to be simple.

The coefficient ring $R = B ⊗_k B^(upright("op"))$ acts on $B$ by left and right multiplication.
  We give an explicit finite presentation of the affine Steinberg group

$ Gamma_0 = B^6 times.r "St"_6 \( R \) . $

The Steinberg group maps onto the elementary matrix group $"E"_6 \( R \)$,
  but its kernel is an obstruction to the desired faithful affine action.
  We remove that entire kernel by a single application of the coefficient map induced by $phi.alt$.
  The key algebraic input consists of two splitting pairs commuting with the coefficient image.
  Their corner identities give an exact calculation in the Steinberg presentation;
  no centrality hypothesis on the kernel is needed.

The resulting endomorphism of $Gamma_0$ defines a finitely presented mapping torus $Gamma$.
  In its direct-limit description the Steinberg kernel has disappeared,
  leaving elementary matrices acting on $M_oo^6$, together with translations and a stage shift.
  Simplicity of $A$ gives the nonzero-vector orbit required for two-transitivity.
  Faithfulness uses two further properties of the algebra construction:
  a separating vector detects every nonzero coefficient after one advance,
  and the proper support $phi.alt \( 1_B \) eq.not 1_B$ makes the stage shift detectable.
  The stabilizer of zero is the quotient by the translation subgroup, so it is finitely generated.
  To embed the original $G$, we first use an HNN extension to express its elements as controlled commutators;
  balanced elementary diagonals then place this copy of $G$ in the linear part.

It remains to construct the algebras with these simultaneous properties.
  We do so through a finitely presented monoid and a decidable monoid that encode one another.
  A finite presentation is compiled syntactically from a program index,
  before any totality assertion is available. Its partial evaluator controls the length of every call to the
  encoded program. Long codes make the calls needed to normalize a word strictly shorter than that word.
  A fixed-point argument and induction on length then establish totality and compatibility with multiplication.
  Finite-tuple selectors isolate individual basis terms in a contracted monoid algebra, producing $A$;
  a separate separator distinguishes ordered pairs of basis terms, producing the faithful coefficient detector.

The finite-presentation construction follows the machine-encoding tradition of Post and Murskii
  #cite(label("Post1947")) #cite(label("Murskii1967")). Here the bounded evaluator permits the two monoids to be
  constructed together. The selectors strengthen the contextual-collapse property in the semigroup counterpart of
  the Boone–Higman theorem #cite(label("BH74")) pp. 49–52: isolating each term of a finite linear combination
  gives the simplicity needed for the affine action.

Section 2 states the algebraic data and gives the HNN reduction.
  Sections 3–5 construct the action and prove the two theorems from those data.
  Section 6 constructs the algebras from a precise monoid theorem, proved by bounded self-reference in Section 7.
  Appendix 8 gives the full finite compiler and its evaluator proof.

== 2 The group input and the algebraic data <sec:reduction>

We first enlarge the input group so that each of its elements is a commutator in the larger group.
  This will allow us to embed the input group in an elementary matrix group in Section 5.
  We then state the algebraic construction used in the next three sections.
  All rings and algebras have identities; a homomorphism explicitly called nonunital is not required to preserve
  them. Our commutator convention is $\[ a \, b \] = a b a^(- 1) b^(- 1)$.

#thm([Lemma 2.1.])[
  #emph[Let $G$ be finitely generated with decidable word problem.
    There is a finitely generated group $hat(G)$ with decidable word problem containing $G times G$,
    and an element $s in hat(G)$, such that
$ \[ \( g \, g \) \, s \] = \( g \, 1 \) wide \( g in G \) . $

]
] <lem:group-input>

#proof[
  Take the HNN extension
  $ hat(G) = ⟨G times G \, s med mid(bar.v) med s \( g \, g \) s^(- 1) = \( 1 \, g \) quad \( g in G \)⟩ . $
  The associated subgroups are the diagonal and the second factor, with the indicated isomorphism.
    Britton’s Lemma embeds the base #cite(label("Britton63"));
    see also the precise effective HNN formulation in #cite(label("BH74")) p. 44.
  We spell out the decision procedure. Store each base word as a pair of words on the given generators of $G$.
    Membership of $\( a \, b \)$ in the diagonal is decided by testing $a b^(- 1) = 1$,
    and membership in the second factor by testing $a = 1$. Replace each available pinch by
  $ s \( a \, a \) s^(- 1) mapsto \( 1 \, a \) \, wide s^(- 1) \( 1 \, b \) s mapsto \( b \, b \) \, $
  and multiply adjacent base words. Each pinch removes two stable letters.
    When no pinch remains, a word still containing a stable letter is nontrivial by Britton’s Lemma.
    Otherwise decide the resulting base word coordinatewise. Thus the procedure terminates and decides the word
    problem, without requiring a finite presentation of $G$. The two copies of a finite generating set,
    together with $s$, generate $hat(G)$. Finally,
  $ \[ \( g \, g \) \, s \] = \( g \, g \) thin s \( g^(- 1) \, g^(- 1) \)
    s^(- 1) = \( g \, g \) \( 1 \, g^(- 1) \) = \( g \, 1 \) . $
  This includes finite groups and the trivial group; in the latter case $hat(G)$ is infinite cyclic. ◻
]

Here is the algebraic construction. A simple algebra means a nonzero algebra with no proper nonzero two-sided
  ideal. A subalgebra with identity $e$ need not contain the identity of the ambient algebra;
  its units are taken relative to $e$. For an idempotent $q in B$, the subalgebra $q B q = { q b q :
  b in B }$ is called a #emph[corner]; its identity is $q$.

#thm([Theorem 2.2.])[
  #emph[For every finitely generated group $L$ with decidable word problem, there are the following data over $k =
    bb(F)_2$:]
  + #emph[A nonzero finitely presented unital algebra $B$, a simple subalgebra $A subset.eq B$ with identity $e$,
    and an embedding $L arrow.r.hook A^times$.]
  + #emph[An injective nonunital algebra homomorphism $phi.alt : B arrow.r
    B$ with $phi.alt \( B \) subset.eq A$ and $p = phi.alt \( 1_B \) eq.not 1_B$.]
  + #emph[Elements $s_0 \, s_1 \, t_0 \, t_1 in p B p$ commuting with $phi.alt \( B \)$ and satisfying
$ t_i s_j = delta_(i j) p \, wide s_0 t_0 + s_1 t_1 = p quad \( i \, j in { 0 \, 1 } \) . $

]
  + #emph[An element $b_(*) in B$ with the following property. Put
$ R = B ⊗_k B^(upright("op")) \, wide psi = phi.alt ⊗ phi.alt^(upright("op")) \,
  wide \( a ⊗ b^(upright("op")) \) dot.op m = a m b . $

 Then
$ r eq.not 0 med arrow.r.double med psi \( r \) dot.op b_(*) eq.not 0 wide \( r in R \) . $

]
] <thm:algebra-package>

Theorem 4 is proved in Section 6, using the monoid construction of Section 7 and Appendix 8.
  To see how these data produce an action, regard the elements of $R$ as coefficients for row operations on $B^6$.
  Such a coefficient acts on a coordinate by a finite sum of left and right multiplications.
  Simplicity of $A$ will let a nonzero coordinate produce any prescribed element of $A$;
  applying $phi.alt$ places all coordinates in that subalgebra.
  Finite presentation of $B$ supplies a finitely presented Steinberg group acting by row operations.
  The splitting pairs make its matrix kernel disappear under the induced coefficient map,
  while $b_(*)$ detects every remaining nonidentity matrix after that map is applied.
  Finally, the support identity $p eq.not 1_B$ makes successive vector stages strictly larger,
  so that shifting stages gives a nontrivial permutation. Sections 3–5 establish these claims and assemble the action.

In particular, $p phi.alt \( b \) = phi.alt \( b \) p = phi.alt \( b \)$, so $1_B in.not phi.alt \( B \)$.
  The detection condition concerns the action after applying $psi$;
  it does not require the original action of $R$ on $B$ to be faithful.

Apply the theorem with $L = hat(G)$ from Lemma 3. For the remainder of Sections 3–5, fix these data.
  Tensor products are over $k$. Besides $p$, define

$ P = p ⊗ p^(upright("op")) \, wide U_i = s_i ⊗ p^(upright("op")) \, wide V_i = t_i ⊗ p^(upright("op")) . $

Tensoring injective linear maps over a field shows that $psi$ is injective, so $P eq.not 0$.
  Also $P eq.not 1_R$, since the nonzero tensor $\( 1_B - p \) ⊗ 1_B$ annihilates $P$ on the left.
  The elements $U_i \, V_i$ lie in $P R P$, commute with $psi \( R \)$, and satisfy

#[#set math.equation(numbering: n => "(1)")
 $ V_i U_j = delta_(i j) P \, wide U_0 V_0 + U_1 V_1 = P . $ <eq:ring-pairs>]

These identities follow directly from the corresponding identities in $B$;
  the second tensor factor is always the idempotent $p^(upright("op"))$.

The final passage from an action to a simple group uses the following established result,
  in the precise form needed here.

#thm([Theorem 2.3.])[
  (Zaremsky).  #emph[Suppose a finitely presented group $Lambda$ acts faithfully on a nonempty countable set $X$.
    If the point stabilizers are finitely generated and there are finitely many orbits on the unordered
    two-element subsets of $X$, then $Lambda$ embeds in a nontrivial finitely presented simple group.]
] <thm:zaremsky>

These are the hypotheses of a type-(A) action in #cite(label("Zaremsky2024Finite")) Theorem A and Corollary B.
  Finite presentation follows from that theorem; the canonical embedding and simplicity are those of the twisted
  Brin–Thompson construction #cite(label("BelkZaremsky2022")) Section 3 and Theorem 3.4.
  Since $X$ is nonempty, the constructed group contains Thompson’s group $V$ on a coordinate and is nontrivial.
  Our construction will provide a countably infinite $X$ with one orbit on pairs,
  and will prove each of the other hypotheses separately.

== 3 A finitely presented affine group <sec:affine>

We now use the algebraic data in Theorem 4 to construct a finitely presented group of translations and elementary
  operations. The translations form the additive group of $B^6$.
  We first give their finite presentation relative to a Steinberg group,
  and then construct the endomorphism used in the next two sections.

=== 3.1 The coefficient ring and the translation module <the-coefficient-ring-and-the-translation-module>

Put

$ R = B ⊗_k B^(upright("op")) \, wide \( a ⊗ b^(upright("op")) \) dot.op m = a m b quad \( m in B \) . $

Thus $r = sum_nu a_nu ⊗ b_nu^(upright("op"))$ acts on $B$ by the operation $m mapsto sum_nu a_nu m b_nu$.
  The opposite multiplication in the second factor makes composition of these operations agree with multiplication
  in $R$, so $B$ is a left $R$-module. The ring $R$ is finitely presented as a unital associative ring:
  take a finite algebra presentation of $B$, a second copy with products reversed,
  the relations commuting every generator of the first copy with every generator of the second, and $2 dot.op 1 =
  0$. The universal property of the tensor product identifies the resulting ring with $R$.
  The module $B$ is generated by $1_B$; we next show that the relations on this module generator also have a
  finite description.

#thm([Lemma 3.1.])[
  #emph[Let $Y$ be a finite algebra generating set for $B$. For $b in B$ put
$ d_b = b ⊗ 1 - 1 ⊗ b^(upright("op")) \, wide J = sum_(y in Y) R d_y . $

 Evaluation at $1_B$ induces an isomorphism of left $R$-modules $R \/ J tilde.equiv B$.]
] <lem:cyclic-module>

#proof[
  Evaluation is a surjective $R$-module homomorphism, and every $d_y$ annihilates $1_B$. The identity
  #[#set math.equation(numbering: n => "(2)")
   $ d_(b c) = \( b ⊗ 1 \) d_c + \( 1 ⊗ c^(upright("op")) \) d_b $ <eq:module-product>]
  shows, together with additivity and $d_1 = 0$, that $d_b in J$ for all $b in B$.
    Indeed, $B$ is generated by $Y$ over the prime field $k$. Consequently
  $ a ⊗ b^(upright("op")) equiv a b ⊗ 1 med \( mod med J \) wide \( a \, b in B \) . $
  Every element of $R$ is therefore congruent modulo $J$ to its evaluation tensored with $1$.
    The additive map $b mapsto \( b ⊗ 1 \) + J$ is an inverse to the induced evaluation map.
    Thus the kernel is exactly the stated left ideal. ◻
]

For a unital ring $R$ and $n gt.eq 3$, the Steinberg group $"St"_n \( R \)$ has generators $x_(a b) \( r \)$,
  where $1 lt.eq a eq.not b lt.eq n$ and $r in R$, with relations

#[#set math.equation(numbering: n => "(3)")
 $ x_(a b) \( r \) x_(a b) \( s \) & = x_(a b) \( r + s \) \,\
 & = x_(a c) \( r s \) &  & \( a \, b \, c upright(" distinct") \) \,\
 & = 1 &  & \( a eq.not d \, med b eq.not c \) . $ <eq:steinberg-add>]

Let $e_(a b)$ denote the matrix unit. The map $x_(a b) \( r \) mapsto I + r e_(a b)$ gives a surjection

$ pi_n : "St"_n \( R \) arrow.r "E"_n \( R \) \, $

where $"E"_n \( R \)$ is the subgroup of $upright("GL")_n \( R \)$ generated by these elementary matrices.
  Krstić and McCool prove that $"St"_n \( R \)$ is finitely presented whenever $R$ is a finitely presented unital
  associative ring and $n gt.eq 4$ #cite(label("KrsticMcCool1999")) Theorem 3.
  Their theorem permits noncommutative rings, and applies to the ring constructed above.

=== 3.2 A finite relative presentation <a-finite-relative-presentation>

The next lemma supplies the additional relations needed for the translations.
  Finite presentation of the module and of the linear group alone would not establish its conclusion;
  we prove the semidirect-product presentation explicitly.

#thm([Lemma 3.2.])[
  #emph[Let $R$ be a finitely generated unital associative ring, let $J =
    sum_(d in D) R d$ for a finite subset $D subset R$, and let $n gt.eq 4$.
    If $"St"_n \( R \)$ is finitely presented, then
$ \( R \/ J \)^n times.r "St"_n \( R \) $

 is finitely presented, where the action on columns is induced by $pi_n$.
   More precisely, choose a finite ring generating set $F subset R$ containing $1$.
   A finite presentation is obtained from a finite presentation of $"St"_n \( R \)$ by adjoining $p_1 \, dots.h \,
   p_n$ and the relations
#[#set math.equation(numbering: n => "(4)")
 $ \[ p_a \, p_b \] & = 1 \,\
 & = 1 &  & \( s in F \, med c eq.not b \) \,\
 & = p_a \,\
 & = 1 &  & \( d in D \) . $ <eq:affine-p>]

 Here every root has $a eq.not b$, and each root occurring in these finitely many relations is represented by a
   word in the chosen generators of $"St"_n \( R \)$.]
] <lem:affine-presentation>

#proof[
  Let $Q$ be the group given by this presentation. In the intended semidirect product, $p_a$ translates by $1 +
    J$ in row $a$, and $\[ x_(a b) \( r \) \, p_b \]$ translates by $r + J$ in that row.
    We recover these translations and their elementary action from the finite relations,
    working inside $Q$ until the final inverse-homomorphism argument.
  ===== 3.2.1 Coefficients. <coefficients.>
  Relation (4) holds for every $s in R$. To see this, let $C$ be the set of coefficients for which it holds for
    every permitted triple of indices. By (3), $C$ is an additive subgroup containing $F$.
    If $r \, s in C$, choose $h in.not { a \, b \, c }$. There is such an index because $n gt.eq 4$. Then
  $ x_(a b) \( r s \) = \[ x_(a h) \( r \) \, x_(h b) \( s \) \] \, $
  and both factors commute with $p_c$. Thus $C$ is closed under multiplication, so $C = R$.
  ===== 3.2.2 Independence of a column. <independence-of-a-column.>
  For $a eq.not b$, define
  $ w_a^b \( r \) = \[ x_(a b) \( r \) \, p_b \] . $
  If $h$ differs from $a \, b$, then $w_a^b \( r \)$ commutes with $p_h$: both $x_(a b) \( r \)$ and $p_b$ do. Put
  $ X = x_(a h) \( r \) \, wide Y = x_(h b) \( 1 \) \, wide Z = x_(a b) \( r \) . $
  The Steinberg relation $\[ X \, Y \] = Z$ gives $X Y = Z Y X$. Conjugating $p_b$ by these equal products yields
  $ \( X Y \) p_b \( X Y \)^(- 1) & = w_a^h \( r \) p_h p_b \,\
\( Z Y X \) p_b \( Z Y X \)^(- 1) & = p_h w_a^b \( r \) p_b . $
  Here $X$ fixes $p_b$, $Y$ sends $p_b$ to $p_h p_b$, and $Z$ fixes $p_h$.
    Cancelling $p_b$ and using the preceding commutation with $p_h$ proves $w_a^h \( r \) = w_a^b \( r \)$.
    We write this common value as $w_a \( r \)$.
  ===== 3.2.3 Commutations. <commutations.>
  The element $w_a \( r \)$ commutes with every $p_c$: choose its defining column $b in.not { a \, c }$,
    so that both defining factors commute with $p_c$. It also commutes with $x_(c d) \( s \)$ whenever $d eq.not
    a$. For this, choose the defining column $b in.not { a \, c \, d }$.
    Then $x_(a b) \( r \)$ commutes with $x_(c d) \( s \)$ by (3),
    and $p_b$ commutes with $x_(c d) \( s \)$ because $b eq.not d$.
  These facts imply that all the $w$’s commute. Given $w_a \( r \)$ and $w_c \( s \)$, choose $b in.not { a \,
    c }$ and write $w_c \( s \) = \[ x_(c b) \( s \) \, p_b \]$.
    The element $w_a \( r \)$ commutes with both factors, hence with their commutator. This argument includes $a = c$.
  ===== 3.2.4 Additivity. <additivity.>
  Using $\[ u v \, p \] = u \[ v \, p \] u^(- 1) \[ u \, p \]$ and any $b eq.not a$, we obtain
  $ w_a \( r + s \) & = \[ x_(a b) \( r \) x_(a b) \( s \) \, p_b \]\
 & = x_(a b) \( r \) w_a \( s \) x_(a b) \( r \)^(- 1) w_a \( r \)\
 & = w_a \( r \) w_a \( s \) . $
  The last equality uses the commutations just proved. Thus $w_a : \( R \, + \) arrow.r Q$ is a homomorphism.
    Moreover, $w_a \( 1 \) = p_a$ by (4). In particular, any additive torsion of $R$ is already imposed on these
    translations; in characteristic two, $p_a^2 = w_a \( 1 + 1 \) = 1$.
  ===== 3.2.5 Conjugation. <conjugation.>
  It remains to determine the action of roots whose column is $a$.
    For $c eq.not a$, choose $b in.not { a \, c }$ and put
  $ X = x_(c a) \( s \) \, wide Y = x_(a b) \( r \) \, wide Z = x_(c b) \( s r \) . $
  The element $X$ fixes $p_b$, and $X Y X^(- 1) = Z Y$. Consequently
  #[#set math.equation(numbering: n => "(5)")
   $ X w_a \( r \) X^(- 1) & = \[ Z Y \, p_b \] = Z w_a \( r \) Z^(- 1) w_c \( s r \) =
     w_a \( r \) w_c \( s r \) . $ <eq:affine-action>]
  The last equality holds because the column $b$ of $Z$ differs from $a$.
    Together with the commutations already proved, (5) is precisely the elementary action on an additive column
    over the left module $R$.
  ===== 3.2.6 The module relations. <the-module-relations.>
  Relation (4) says $w_a \( d \) = 1$ for every $a$ and $d in D$.
    To kill a left multiple in a prescribed row $c$, choose $a eq.not c$ and conjugate $w_a \( d \) =
    1$ by $x_(c a) \( s \)$. Equation (5) gives $w_c \( s d \) = 1$.
    Additivity now proves that every $w_c$ vanishes on $J$.
  ===== 3.2.7 Inverse homomorphisms. <inverse-homomorphisms.>
  Let $P_0 = \( R \/ J \)^n times.r "St"_n \( R \)$. Sending $p_a$ to translation by $1 +
    J$ in row $a$ and using the identity on $"St"_n \( R \)$ satisfies all the defining relations of $Q$,
    and hence gives a homomorphism $f : Q arrow.r P_0$. Conversely, the commuting additive maps
  $ r + J mapsto w_a \( r \) $
  define a homomorphism $\( R \/ J \)^n arrow.r Q$. Equation (5) and the root commutations give the required
    equivariance, so this map and the canonical map $"St"_n \( R \) arrow.r Q$ induce $g : P_0 arrow.r Q$.
    The composite $g f$ fixes $"St"_n \( R \)$ and each $p_a = w_a \( 1 \)$, so it is the identity on $Q$.
    The composite $f g$ fixes $"St"_n \( R \)$ and every translation:
    in $P_0$, the commutator of $x_(a b) \( r \)$ with translation by $1 + J$ in row $b$ is translation by $r +
    J$ in row $a$. Thus $f$ and $g$ are inverse isomorphisms. ◻
]

#thm([Proposition 3.3.])[
  #emph[For the algebra $B$ in Theorem 4, the group
$ Gamma_0 = B^6 times.r "St"_6 \( R \) \, wide R = B ⊗_k B^(upright("op")) \, $

 is finitely presented.]
] <prop:affine>

#proof[
  The ring $R$ is finitely presented, so the Krstić–McCool theorem applies to $"St"_6 \( R \)$.
    Lemma 6 identifies $B$ with a quotient of $R$ by a finitely generated left ideal.
    Lemma 7, with $n = 6$, gives the result. ◻
]

=== 3.3 The transition endomorphism <the-transition-endomorphism>

Write $"St" = "St"_6 \( R \)$, $"E" = "E"_6 \( R \)$, and $pi = pi_6 : "St" arrow.r "E"$.
  Recall the injective algebra map $phi.alt : B arrow.r B$ from Theorem 4, and set $psi =
  phi.alt ⊗ phi.alt^(upright("op")) : R arrow.r R$. This map is injective because tensoring vector spaces over $k$
  preserves injections. Both maps may be nonunital.

#thm([Lemma 3.4.])[
  #emph[The formulas
$ theta \( x_(a b) \( r \) \) = x_(a b) \( psi \( r \) \) \, wide
  Theta \( m \, h \) = \( phi.alt^(\( 6 \)) \( m \) \, theta \( h \) \) $

 define endomorphisms of $"St"$ and $Gamma_0$, respectively. Here $phi.alt^(\( 6 \))$ acts componentwise on $B^6$.
   The induced map on elementary matrices is the injective homomorphism
#[#set math.equation(numbering: n => "(6)")
 $ F : "E" arrow.r "E" \, wide F \( g \) = I + psi^(\( 6 \)) \( g - I \) \, $ <eq:matrix-transition>]

 where $psi^(\( 6 \))$ means entrywise application on $6 times 6$ matrices. Thus $pi theta = F pi$.]
] <lem:transition>

#proof[
  Additivity and multiplicativity of $psi$ preserve all the Steinberg relations,
    proving that $theta$ is a homomorphism. For an elementary tensor $r = a ⊗ b^(upright("op"))$ and $m in B$,
  $ phi.alt \( r dot.op m \) = phi.alt \( a m b \) = phi.alt \( a \) phi.alt \( m \) phi.alt \( b \) =
    psi \( r \) dot.op phi.alt \( m \) . $
  By additivity this holds for every $r in R$. Consequently, for each elementary root,
  $ phi.alt^(\( 6 \)) #scale(x: 120%, y: 120%)[\(] \( I + r e_(a b) \) m
    #scale(x: 120%, y: 120%)[\)] = \( I + psi \( r \) e_(a b) \) phi.alt^(\( 6 \)) \( m \) . $
  The roots generate $"St"$, so this equivariance proves that $Theta$ is an endomorphism of the semidirect product.
  For the matrix assertion, write $g = I + A$ and $h = I + C$.
    Entrywise application of $psi$ is additive and multiplicative on matrix rings,
    even though it does not preserve their identity. Since $g h - I = A + C + A C$, we have
  $ F \( g h \) & = I + psi^(\( 6 \)) \( A \) + psi^(\( 6 \)) \( C \) + psi^(\( 6 \)) \( A \) psi^(\( 6 \)) \( C \)\
 & = F \( g \) F \( h \) . $
  Also $F \( I \) = I$, and the same calculation shows $F \( g^(- 1) \) = F \( g \)^(- 1)$.
    On elementary matrices, $F \( I + r e_(a b) \) = I + psi \( r \) e_(a b)$,
    proving both that $F$ maps $"E"$ into $"E"$ and that $pi theta = F pi$.
    Finally, $F \( g \) = I$ forces every entry of $g - I$ to vanish because $psi$ is injective.
    Thus $F$ is injective. ◻
]

We have obtained a finite presentation and compatible transition maps. The map $Theta$ need not be injective:
  the remaining obstruction lies in the kernel of $pi$. The next section proves that $theta$ annihilates this
  entire kernel.

== 4 Annihilating the Steinberg kernel <sec:kernel>

The affine group of Section 3 uses a Steinberg group, whose matrix action can have a kernel.
  We now show that the coefficient endomorphism annihilates this entire kernel.
  The argument uses the splitting pairs from Theorem 4, whose elements commute with the coefficient image.
  It is convenient to state it for an arbitrary unital associative ring.

Recall that $"St"_6 \( R \)$ has generators $x_(i j) \( a \)$, where $1 lt.eq i eq.not j lt.eq 6$ and $a in R$,
  with relations

#[#set math.equation(numbering: n => "(7)")
 $ x_(i j) \( a \) x_(i j) \( b \) & = x_(i j) \( a + b \) \,\
 & = x_(i k) \( a b \) &  & \( i \, j \, k upright(" distinct") \) \,\
 & = 1 &  & \( i eq.not l \, med j eq.not k \) . $ <eq:kernel-additive>]

Here $\[ u \, v \] = u v u^(- 1) v^(- 1)$. Let $pi : "St"_6 \( R \) arrow.r
  "E"_6 \( R \)$ send $x_(i j) \( a \)$ to $I + a e_(i j)$.

#thm([Theorem 4.1.])[
  #emph[Let $R$ be a unital associative ring, let $psi : R arrow.r R$ be an additive multiplicative map,
    and put $P = psi \( 1 \)$. Suppose that $U_0 \, U_1 \, V_0 \, V_1 in P R P$ commute with $psi \( R \)$ and satisfy
$ V_i U_j = delta_(i j) P \, wide U_0 V_0 + U_1 V_1 = P . $

 Then the homomorphism
$ theta : "St"_6 \( R \) arrow.r "St"_6 \( R \) \, wide x_(i j) \( a \) mapsto x_(i j) \( psi \( a \) \) \, $

 satisfies $theta \( ker pi \) = 1$.]
] <thm:kernel>

For the binary Leavitt algebra $L = L_(bb(F)_2) \( 1 \, 2 \)$,
  Khanh proves that the natural map $"St"_r \( L \) arrow.r
  upright("GL")_r \( L \)$ is an isomorphism for $r gt.eq 3$ #cite(label("Khanh2026Leavitt")) Theorem 5.4.
  Theorem 10 concerns an arbitrary ring and annihilation of its matrix kernel under the specified coefficient map.

Additivity and multiplicativity make $theta$ a homomorphism by the defining relations.
  The map $psi$ need not preserve the identity. For any additive multiplicative map $lambda : R arrow.r R$,
  the corresponding image of a root word with matrix $g$ has matrix

#[#set math.equation(numbering: n => "(8)")
 $ I + lambda^(\( 6 \)) \( g - I \) \, $ <eq:kernel-nonunital>]

where $lambda^(\( 6 \))$ acts entrywise. This follows on generators and then on products by expanding $g h -
  I = \( g - I \) + \( h - I \) + \( g - I \) \( h - I \)$.
  In particular, coefficient maps preserve the condition of having identity matrix.
  We shall use this for maps whose images lie in smaller idempotent corners of $R$.

The proof has two parts. First, a word with identity matrix becomes central when all its coefficients are placed
  in a suitable corner. Second, two orthogonal copies of that corner can be interchanged and split.
  Four corners suffice to make the resulting central element equal to its square.

=== 4.1 Conjugation with an unused index <conjugation-with-an-unused-index>

The use of an index outside the support of a root word is the classical Steinberg centrality argument;
  see #cite(label("Weibel2013")) proof of Theorem III.5.2.1.
  We record its row-and-column form to justify the corner conjugations inside the Steinberg group.
  The kernel-annihilation theorem also uses the corner comparisons and four-corner splitting proved below.

#thm([Lemma 4.2.])[
  #emph[Let $J subset.eq { 1 \, dots.h \, 6 }$ and $k in.not J$. For a column $c$ and a row $r$ indexed by $J$, put
$ C_k \( c \) = product_(i in J) x_(i k) \( c_i \) \, wide R_k \( r \) = product_(i in J) x_(k i) \( r_i \) . $

 If $w$ is a root word using only indices in $J$, and $A$ is its matrix on those indices, then
#[#set math.equation(numbering: n => "(9)")
 $ w C_k \( c \) w^(- 1) = C_k \( A c \) \, wide w R_k \( r \) w^(- 1) = R_k \( r A^(- 1) \) . $ <eq:external-action>]

 Consequently, an element represented by a root word omitting index $6$ and having identity matrix is central in
   $"St"_6 \( R \)$.]
] <lem:external-roots>

#proof[
  The factors in each defining product commute. It suffices to check conjugation by $x_(i j) \( a \)$ with $i \,
    j in J$. Its only changed column factor and row factor are, respectively,
  $ x_(i j) \( a \) x_(j k) \( c_j \) x_(i j) \( a \)^(- 1) & = x_(i k) \( a c_j \) x_(j k) \( c_j \) \,\
x_(i j) \( a \) x_(k i) \( r_i \) x_(i j) \( a \)^(- 1) & = x_(k j) \( - r_i a \) x_(k i) \( r_i \) . $
  The first identity is (7). For the second, reverse the relation $\[ x_(k i) \( r_i \) \, x_(i j) \( a \) \] =
    x_(k j) \( r_i a \)$. These operations are multiplication of a column by $I + a e_(i j)$ and of a row by $I -
    a e_(i j)$. Composition proves (9) inside the Steinberg group.
  If $w$ omits $6$ and has identity matrix, it therefore commutes with every $x_(i 6) \( a \)$ and
    $x_(6 i) \( a \)$. It commutes with every remaining root as well, since
  $ x_(i j) \( a \) = \[ x_(i 6) \( a \) \, x_(6 j) \( 1 \) \] wide \( i \, j eq.not 6 \) . $
  These roots generate the group. ◻
]

#thm([Lemma 4.3.])[
  #emph[Let $E \, F in R$ be idempotents with $E F = F E = 0$. Suppose $d \, d^(*) in R$ satisfy
#[#set math.equation(numbering: n => "(10)")
 $ d = F d E \, wide d^(*) = E d^(*) F \, wide d^(*) d = E \, wide d d^(*) = F . $ <eq:corner-equivalence>]

 Every root word whose coefficients lie in $E R E$ and whose matrix is the identity represents a central element
   of $"St"_6 \( R \)$.]
] <lem:corner-centrality>

#proof[
  Here $d^(*)$ denotes the specified element in (10); no involution on $R$ is assumed. Put
  $ W = x_16 \( d \) x_61 \( - d^(*) \) x_16 \( d \) . $
  Its matrix and inverse on the ordered pair $\( 1 \, 6 \)$ are
  #[#set math.equation(numbering: n => "(11)")
   $ H = mat(delim: "(", 1 - F, d; - d^(*), 1 - E) \, wide H^(- 1) =
     mat(delim: "(", 1 - F, - d; d^(*), 1 - E) . $ <eq:corner-compression-matrix>]
  These formulas follow by multiplying the three elementary matrices and using (10).
  Let $y = E y E$ and $k in.not { 1 \, 6 }$. Applying Lemma 11 to the actual word $W$ gives
  #[#set math.equation(numbering: n => "(12)")
   $ W x_(1 k) \( y \) W^(- 1) & = x_(1 k) \( y \) \, & W x_(6 k) \( y \) W^(- 1) & = x_(1 k) \( d y \) \,\
W x_(k 1) \( y \) W^(- 1) & = x_(k 1) \( y \) \, & W x_(k 6) \( y \) W^(- 1) & =
  x_(k 1) \( y d^(*) \) . $ <eq:corner-compression-roots>]
  Indeed $d^(*) y = y d = 0$, since $E$ and $F$ are orthogonal, and $\( 1 - E \) y = y \( 1 - E \) = 0$.
    Roots with both indices outside ${ 1 \, 6 }$ commute with $W$.
  For the two roots internal to this pair, first write
  $ x_16 \( y \) = \[ x_(1 k) \( y \) \, x_(k 6) \( E \) \] \, wide
    x_61 \( y \) = \[ x_(6 k) \( y \) \, x_(k 1) \( E \) \] . $
  Their conjugates under $W$ are, by (12),
  $ \[ x_(1 k) \( y \) \, x_(k 1) \( d^(*) \) \] \, wide \[ x_(1 k) \( d y \) \, x_(k 1) \( E \) \] \, $
  respectively. Both are words omitting index $6$; no relation for opposite roots is needed here.
    Thus $W$ conjugates every word in the statement to a word omitting $6$.
    Its matrix remains the identity, so Lemma 11 makes it central. The original element is central as well. ◻
]

=== 4.2 Interchanging and splitting corners <interchanging-and-splitting-corners>

For a unit $a in R^times$, define

$ w_(i j) \( a \) = x_(i j) \( a \) x_(j i) \( - a^(- 1) \) x_(i j) \( a \) \, wide h_(i j) \( a \) =
  w_(i j) \( a \) w_(i j) \( - 1 \) . $

Direct multiplication gives

#[#set math.equation(numbering: n => "(13)")
 $ pi \( w_(i j) \( a \) \) \|_({ i \, j }) & = mat(delim: "(", 0, a; - a^(- 1), 0) \,\
pi \( h_(i j) \( a \) \) \|_({ i \, j }) & = mat(delim: "(", a, 0; 0, a^(- 1)) \; $ <eq:balanced-diagonal>]

both matrices are the identity on the other indices.

#thm([Lemma 4.4.])[
  #emph[Let $psi : R arrow.r R$ be an additive multiplicative map.
    Let $E \, F \, d \, d^(*)$ satisfy (10), with $E \, F$ orthogonal idempotents,
    and suppose all four elements commute with $psi \( R \)$.
    For $z in ker pi$, denote its images under the coefficient maps $a mapsto psi \( a \) E$ and $a mapsto
    psi \( a \) F$ by $z_E$ and $z_F$. Then $z_E = z_F$, and these elements are central.]
] <lem:corner-comparison>

#proof[
  The two coefficient maps are multiplicative because $E$ and $F$ are idempotent and commute with $psi \( R \)$.
    Their root words have identity matrix by (8), so Lemma 12, in both orders, gives centrality.
  Put $b = d + d^(*) + 1 - E - F$. The squares of $d$ and $d^(*)$ vanish, their cross products are $F$ and $E$,
    and $1 - E - F$ is an idempotent annihilating them on both sides. Thus
  $ b^2 = 1 \, wide b E b^(- 1) = F \, $
  and $b$ commutes with $psi \( R \)$. Consider the element
  $ D = h_12 \( b \) h_34 \( b \) h_56 \( b \) in "St"_6 \( R \) . $
  Its matrix is diagonal with $b$ in all six positions. More particularly, we claim the exact Steinberg identity
  #[#set math.equation(numbering: n => "(14)")
   $ D x_(i j) \( y \) D^(- 1) = x_(i j) \( b y b^(- 1) \) wide \( y in R \) . $ <eq:corner-diagonal-action>]
  If $i$ and $j$ belong to different pairs among $\( 1 \, 2 \) \, \( 3 \, 4 \) \, \( 5 \, 6 \)$,
    apply Lemma 11 to the two relevant factors of $D$. The pair containing $i$ multiplies the coefficient on the
    left by $b$, and the pair containing $j$ multiplies it on the right by $b^(- 1)$;
    the third factor commutes with the root. Here $b = b^(- 1)$ makes the action the same at either position of a
    pair. If $i \, j$ belong to the same pair, choose $k$ in another pair and use
  $ x_(i j) \( y \) = \[ x_(i k) \( y \) \, x_(k j) \( 1 \) \] . $
  The cross-pair case conjugates its factors to $x_(i k) \( b y b^(- 1) \)$ and $x_(k j) \( 1 \)$,
    proving (14) also in this case.
  Since $b$ commutes with $psi \( R \)$ and interchanges $E \, F$, (14) implies $D z_E D^(- 1) = z_F$.
    Centrality gives $z_E = z_F$. ◻
]

#thm([Lemma 4.5.])[
  #emph[If $E \, F in R$ are orthogonal idempotents, then the subgroup of $"St"_6 \( R \)$ generated by roots with
    coefficients in $E R E$ commutes with the subgroup generated by roots with coefficients in $F R F$.]
] <lem:orthogonal-root-images>

#proof[
  For $a in E R E$ and $c in F R F$, one has $a c = c a = 0$.
    Roots with these coefficients commute by the defining relations unless their indices are opposite:
    chain commutators have coefficient $a c$ or $- c a$, and roots in the same position commute by additivity.
    For the remaining pair $x_(i j) \( a \) \, x_(j i) \( c \)$ choose $k$ distinct from $i \, j$ and write
  $ x_(i j) \( a \) = \[ x_(i k) \( a \) \, x_(k j) \( E \) \] . $
  The root $x_(j i) \( c \)$ commutes with the first factor because $c a = 0$, and with the second because $E c =
    0$. It therefore commutes with their commutator. ◻
]

We can now finish the kernel calculation. The preceding lemmas allow us to compare corner images as group
  elements, and to split an image over an orthogonal sum without a residual central factor.

#proof[
  Define four idempotents by
  $ E_i = U_i V_i quad \( i = 0 \, 1 \) \, wide E_(0 i) = U_0 U_i V_i V_0 quad \( i = 0 \, 1 \) . $
  They commute with $psi \( R \)$, and the pair relations give the orthogonal decompositions
  #[#set math.equation(numbering: n => "(15)")
   $ P = E_0 + E_1 \, wide E_0 = E_00 + E_01 . $ <eq:four-corner-splits>]
  Each of $E_0 \, E_00 \, E_01$ is orthogonal to $E_1$ and equivalent to it as in (10). To check this explicitly, put
  $ U_00 & = U_0 U_0 \, & V_00 & = V_0 V_0 \,\
U_01 & = U_0 U_1 \, & V_01 & = V_1 V_0 . $
  and, for $v in { 0 \, 00 \, 01 }$, set
  $ d_v = U_1 V_v \, wide d_v^(*) = U_v V_1 . $
  The relations $V_v U_v = P$ and $U_v V_v = E_v$ imply
  $ d_v = E_1 d_v E_v \, quad d_v^(*) = E_v d_v^(*) E_1 \, wide d_v^(*) d_v = E_v \, quad d_v d_v^(*) = E_1 . $
  All these elements commute with $psi \( R \)$.
  Figure 1 separates the two orthogonal decompositions from the equivalences between their summands.
    Comparing each of $E_0 \, E_00 \, E_01$ with $E_1$ will identify their images of a kernel element.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (6, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2, 0), (2, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4, 0), (4, 0.8), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1, 0.4), [$E_00$])
  content((3, 0.4), [$E_01$])
  content((5, 0.4), [$E_1$])
  line((0, 1), (0, 1.15), (6, 1.15), (6, 1), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3, 1.4), [$P$])
  line((0, -0.2), (0, -0.35), (4, -0.35), (4, -0.2), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2, -0.6), [$E_0$])
  content((3, -1.05), [$E_0 tilde.op E_1, E_00 tilde.op E_1, E_01 tilde.op E_1$])
})],
    caption: [Figure 1: The decompositions $P = E_0 + E_1$ and $E_0 = E_00 + E_01$, shown schematically. The three disjoint cells are orthogonal; the bracketed corner $E_0$ contains its two children. Here $tilde.op$ denotes the equivalence in (10). ],
  ) <fig:kernel-corners>
  Fix $z in ker pi$ and let $z_Q$ denote its image under the coefficient map $a mapsto psi \( a \)
    Q$ for each of these idempotents. Lemma 13, applied three times with the second corner $E_1$, gives
  #[#set math.equation(numbering: n => "(16)")
   $ z_(E_0) = z_(E_1) = z_(E_00) = z_(E_01) . $ <eq:four-corner-equality>]
  By additivity, the second split in (15) splits every root image into its two child images.
    Lemma 14 permits their factors to be collected separately in any word. Hence
  $ z_(E_0) = z_(E_00) z_(E_01) = z_(E_0)^(thin 2) \, $
  so $z_(E_0) = 1$ and then $z_(E_1) = 1$. Finally $psi \( a \) P = psi \( a \)$.
    The first split in (15), with the same commutation argument, therefore gives
  $ theta \( z \) = z_P = z_(E_0) z_(E_1) = 1 . $
  ◻
]

For $R = B ⊗_k B^(upright("op"))$ and $psi = phi.alt ⊗ phi.alt^(upright("op"))$, the elements $P \, U_i \,
  V_i$ constructed in Section 2 satisfy the support and commutation hypotheses and the pair identities (1).
  Theorem 10 therefore applies to the Steinberg transition of Section 3: it annihilates the matrix kernel in one step.

== 5 The two-transitive envelope <sec:action>

We now turn the algebraic construction into the required permutation representation.
  Proposition 8 and Lemma 9 give the finitely presented group

$ Gamma_0 = B^6 times.r "St"_6 \( R \) $

and its endomorphism $Theta = \( phi.alt^(\( 6 \)) \, theta \)$.
  Theorem 10 says that $theta$ kills the kernel of the matrix map.
  A mapping torus will remove this kernel while retaining finite presentation.
  We then use the simple subalgebra $A subset.eq B$ to obtain two-transitivity.

=== 5.1 The mapping torus and its linear part <the-mapping-torus-and-its-linear-part>

We first record explicitly why a mapping torus has the needed description even when its defining endomorphism is
  not injective.

#thm([Lemma 5.1.])[
  #emph[Let $Q$ be a group and $f : Q arrow.r Q$ an endomorphism.
    Write $L = "inj lim" \( Q \, f \)$, with classes $\[ q \, j \]$ for $j gt.eq
    0$ and the convention $\[ q \, j \] = \[ f \( q \) \, j + 1 \]$. The map
$ alpha \( \[ q \, j \] \) = \[ q \, j + 1 \] $

 is an automorphism of $L$, and
$ chevron.l Q \, t divides t^(- 1) q t = f \( q \) med \( q in Q \) chevron.r tilde.equiv L times.r_alpha bb(Z) . $

 If $Q$ is finitely presented, so is this group.]
] <lem:mapping-torus>

#proof[
  Equality in the direct limit means equality after sufficiently many forward transitions.
    Thus $alpha$ is well defined, as is $beta \( \[ q \, j \] \) = \[ f \( q \) \, j \]$.
    The defining equivalence gives $alpha beta = beta alpha = upright("id")$. Let $t$ act on $L$ by $alpha$. Then
  $ t^(- 1) \[ q \, 0 \] t = beta \( \[ q \, 0 \] \) = \[ f \( q \) \, 0 \] \, $
  so the displayed presentation maps to $L times.r_alpha bb(Z)$. In the other direction, send
  $ \[ q \, j \] mapsto t^j q t^(- j) . $
  The relation $t^(- 1) q t = f \( q \)$ implies $t^(j + 1) f \( q \) t^(- \( j + 1 \)) = t^j q t^(- j)$,
    proving that this map is well defined. It intertwines $alpha$ with conjugation by $t$,
    and hence extends to a homomorphism from the semidirect product. The two maps are inverse on $Q$ and $t$.
  For a finite presentation $Q = chevron.l X divides cal(R) chevron.r$,
    choose a word representing $f \( x \)$ for each $x in X$.
    Adjoin $t$ and the finitely many relations $t^(- 1) x t = f \( x \)$ for $x in X$.
    These imply the required relations for every element of $Q$, since both conjugation and $f$ are homomorphisms. ◻
]

Apply Lemma 15 to $\( Gamma_0 \, Theta \)$ and denote the resulting finitely presented group by $Gamma$. Put

$ M_oo = "inj lim" \( \( B \, + \) \, phi.alt \) \, wide E_oo = "inj lim" \( "E"_6 \( R \) \, F \) \, wide
  F \( g \) = I + psi^(\( 6 \)) \( g - I \) . $

The transition $F$ is the injective homomorphism of Lemma 9; recall the matrix map $pi : "St"_6 \( R \) arrow.r
  "E"_6 \( R \)$.

#thm([Lemma 5.2.])[
  #emph[There are compatible isomorphisms
$ "inj lim" \( Gamma_0 \, Theta \) tilde.equiv M_oo^6 times.r E_oo \, wide
  Gamma tilde.equiv \( M_oo^6 times.r E_oo \) times.r bb(Z) . $

 In the second isomorphism, conjugation by $t$ shifts the stage index forward by one on both $M_oo$ and $E_oo$.]
] <lem:affine-limit>

#proof[
  The square $pi theta = F pi$ induces a surjection from the Steinberg direct limit to $E_oo$.
    If a class represented by $h in "St"_6 \( R \)$ maps to the identity,
    some iterate of $F$ sends $pi \( h \)$ to $I$. Since $F$ is injective, $pi \( h \) = I$ already.
    Theorem 10 now gives $theta \( h \) = 1$, so that class is trivial.
  The compatibility of the module action is
  #[#set math.equation(numbering: n => "(17)")
   $ phi.alt^(\( 6 \)) \( g v \) = F \( g \) phi.alt^(\( 6 \)) \( v \)
     wide \( g in "E"_6 \( R \) \, med v in B^6 \) . $ <eq:action-transition>]
  Indeed $phi.alt \( r dot.op b \) = psi \( r \) dot.op phi.alt \( b \)$ for $r in R$ and $b in B$,
    and separating $g$ into $I + \( g - I \)$ gives exactly the modified-identity formula for $F$.
    Thus matrices and vectors act on one another after passage to any common stage.
  The stage maps
  $ \( v \, h \) mapsto \( \[ v \, j \] \, \[ pi \( h \) \, j \] \) $
  therefore induce a homomorphism from $"inj lim" \( Gamma_0 \, Theta \)$ to $M_oo^6 times.r E_oo$.
    It is surjective: choose a common stage for a vector and a matrix,
    and then choose a Steinberg preimage of that matrix. If a representative $\( v \, h \)$ maps to the identity,
    injectivity of $phi.alt$ gives $v = 0$, and injectivity of $F$ gives $pi \( h \) = I$.
    Consequently $Theta \( v \, h \) = \( 0 \, 1 \)$ by Theorem 10. The homomorphism is injective.
    The construction respects stage shifts, so Lemma 15 gives the second isomorphism as well. ◻
]

=== 5.2 A faithful action and two-transitivity <a-faithful-action-and-two-transitivity>

Set $X = M_oo^6$. The subgroup $M_oo^6$ acts on $X$ by translations,
  and $E_oo$ acts by matrices after passing to a common stage, as in (17). Let $t$ act by the forward stage shift.
  This shift intertwines the matrix actions, so these formulas define an action of $Gamma$ on $X$.

#thm([Proposition 5.3.])[
  #emph[The set $X$ is countably infinite. The action of $Gamma$ on $X$ is faithful and two-transitive,
    and all its point stabilizers are finitely generated.]
] <prop:two-transitive-action>

#proof[
  #emph[The stage filtration.] Since $phi.alt$ is injective,
    identify the $j$th additive stage with its image $M_j subset.eq M_oo$, and put $X_j = M_j^6$.
    The stages are nested because $\[ b \, j \] = \[ phi.alt \( b \) \, j + 1 \]$. They are strictly nested:
    every $phi.alt \( b \)$ satisfies $p phi.alt \( b \) = phi.alt \( b \)$, where $p =
    phi.alt \( 1_B \) eq.not 1_B$, so $1_B$ cannot belong to $phi.alt \( B \)$.
    Thus $\[ 1_B \, j + 1 \] in.not M_j$, and
  #[#set math.equation(numbering: n => "(18)")
   $ X_0 subset.neq X_1 subset.neq X_2 subset.neq dots.h.c . $ <eq:strict-stages>]
  The algebra $B$ is countable, being a quotient of the free associative algebra over the finite field $k$ on
    finitely many generators. Consequently $X = union.big_(j gt.eq 0) X_j$ is countable;
    the strict inclusions make it infinite.
  #emph[Faithfulness of the affine part.] Take a nonidentity element of $E_oo$,
    represented by a matrix $g eq.not I$ at stage $j$. Choose a nonzero entry $r$ of $g - I$,
    say in row $a$ and column $b$. At stage $j + 1$, let $v$ have $b_(*)$ in coordinate $b$ and zero in the other
    coordinates. The $a$th coordinate of $F \( g \) v - v$ is
  $ psi \( r \) dot.op b_(*) eq.not 0 $
  by Theorem 4. It remains nonzero in the direct limit because $phi.alt$ is injective.
    This proves faithfulness of the linear action. If an affine element acts identically,
    evaluating it at zero first makes its translation zero; linear faithfulness then makes the element trivial.
  #emph[Faithfulness of the whole group.] Every affine limit element and its inverse have representatives at some
    common stage. At every later stage their translation vectors, matrices,
    and inverse matrices act within that stage. Hence, for each affine limit element $a$,
  #[#set math.equation(numbering: n => "(19)")
   $ a \( X_j \) = X_j wide upright("for all sufficiently large ") j . $ <eq:eventual-stage-preservation>]
  In contrast,
  $ t^k \( X_j \) = X_(j + k) wide upright("whenever ") j gt.eq 0 upright(" and ") j + k gt.eq 0 . $
  For $k eq.not 0$, this differs from $X_j$ by (18). Thus no nonzero power of $t$ agrees, as a permutation,
    with an affine limit element. If $a t^k$ acts trivially, then $t^k$ acts as $a^(- 1)$, forcing $k =
    0$ by (19). Affine faithfulness then gives $a = 1$.
  #emph[Two-transitivity.] We show that $E_oo$ is transitive on the nonzero vectors of $X$.
    Given two such vectors, choose a common representing stage and advance once more.
    All their coordinates now lie in $A$, since $phi.alt \( B \) subset.eq A$, and the vectors remain nonzero.
    We work in this one stage, with the same simple algebra $A$ and its identity $e$.
  If a vector has a nonzero coordinate $m_j in A$, simplicity gives $A m_j A = A$:
    the finite sums of elements $a m_j b$ form a nonzero two-sided ideal.
    Thus, for any $d in A$, there are finitely many $a_nu \, b_nu in A$ with
  $ d = sum_nu a_nu m_j b_nu . $
  The coefficient $r = sum_nu a_nu ⊗ b_nu^(upright("op")) in R$ then satisfies $r dot.op m_j = d$.
    For $l eq.not j$, an elementary matrix in row $l$, column $j$,
    with coefficient $r$ adds $d$ to coordinate $l$ and changes no other coordinate.
    It can therefore set that coordinate to any prescribed value in $A$.
  If $j eq.not 6$, set the last coordinate to $e$. If $j = 6$, first set coordinate $1$ to $e$,
    then use it to set the last coordinate to $e$. Use the last coordinate to kill all the others.
    This sends the vector to $\( 0 \, 0 \, 0 \, 0 \, 0 \, e \)$.
    Applying the procedure to both original vectors sends them to the same vector at the same stage,
    proving the asserted linear transitivity. Translations, followed by these linear maps and another translation,
    take any ordered pair of distinct points to any other such pair. The action is two-transitive.
  #emph[Point stabilizers.] Both $E_oo$ and $t$ fix zero, so the semidirect-product description gives
  $ "Stab"_Gamma \( 0 \) = E_oo times.r chevron.l t chevron.r tilde.equiv Gamma \/ X . $
  This is a finitely generated group, since $Gamma$ is finitely presented.
    More explicitly, $t$ and the images of a finite generating set of the base Steinberg group generate it:
    conjugating by positive powers of $t$ reaches every linear stage.
    All other point stabilizers are conjugate to this one, since translations act transitively. ◻
]

=== 5.3 Embedding the input group and finishing the proof <embedding-the-input-group-and-finishing-the-proof>

The last step is to put the original group into the elementary matrix part of $Gamma$.
  Here the commutator property of Lemma 3 is essential.

#proof[
  Let $hat(G)$ be the auxiliary group of Lemma 3. Theorem 4 supplies an injective homomorphism $iota :
    hat(G) arrow.r A^times$, where units in $A$ have identity $e$. Define
  $ nu \( h \) = 1_B - e + iota \( h \) wide \( h in hat(G) \) . $
  The element $1_B - e$ annihilates $A$ on both sides. Consequently
  $ nu \( h \) nu \( h' \) = nu \( h h' \) \, wide nu \( h \)^(- 1) = nu \( h^(- 1) \) . $
  Injectivity of $iota$ proves injectivity of $nu$. Composing with the injective unital map $B arrow.r R$,
    $b mapsto b ⊗ 1_B$, gives a group embedding $macron(nu) : hat(G) arrow.r R^times$.
    The tensor map is injective because $B$ is a nonzero vector space over $k$.
  For $u in R^times$, let $D_(i j) \( u \)$ be the diagonal matrix with entries $u \, u^(- 1)$ in positions $i \,
    j$ and $1$ elsewhere. Equation  (13) shows that $D_(i j) \( u \) in "E"_6 \( R \)$.
    Let $s$ be the stable letter in $hat(G)$ and set
  $ a_g = macron(nu) \( \( g \, g \) \) \, wide b = macron(nu) \( s \) . $
  By Lemma 3, $\[ a_g \, b \] = macron(nu) \( \( g \, 1 \) \)$.
    Taking the commutator of balanced diagonal matrices on two different pairs of coordinates gives
  $ \[ D_12 \( a_g \) \, D_13 \( b \) \] = "diag" #scale(x: 120%, y: 120%)[\(] macron(nu) \( \( g \, 1 \) \) \,
    1 \, 1 \, 1 \, 1 \, 1 #scale(x: 120%, y: 120%)[\)] . $
  Thus the injective homomorphism given by the diagonal on the right has image in $"E"_6 \( R \)$.
    Since the transition $F$ is injective, this embeds $G$ in $E_oo$, and hence in $Gamma$ by Lemma 16.
    Proposition 17 and the finite presentation of $Gamma$ give all the remaining assertions of Theorem 2. ◻
]

#proof[
  Suppose first that $G$ is finitely generated and has decidable word problem.
    Theorem 2 embeds it in a finitely presented group $Gamma$ with a faithful two-transitive action on a countably
    infinite set and finitely generated point stabilizers. There is exactly one orbit on unordered two-element
    subsets. These are all the hypotheses of Theorem 5, which embeds $Gamma$ in a finitely presented simple group
    $S$. The group $S$ is nontrivial, since $Gamma$ acts transitively on an infinite set.
    This proves the required direction, including trivial and finite input groups.
  For the converse, we give the classical decision argument attributed by Boone and Higman to Kuznetsov
    #cite(label("BH74")) p. 52. Let $S = chevron.l Y divides cal(R)
    chevron.r$ be a nontrivial finitely presented simple group.
    On an input word $w$, run the following two searches in parallel:
  + enumerate presentation proofs that $w = 1$ follows from $cal(R)$;
  + enumerate, for every $y in Y$, a presentation proof that $y = 1$ follows from $cal(R) union { w }$,
    stopping when a proof has been found for every generator.
  Consequences of a finite group presentation are recursively enumerable,
    by enumerating finite products of conjugates of relators and their inverses.
    If $w = 1$ in $S$, the first search succeeds, whereas the second cannot succeed for every generator because
    $S$ is nontrivial. If $w eq.not 1$, its normal closure in the simple group $S$ is all of $S$;
    thus the second search succeeds for each of the finitely many generators, whereas the first never succeeds.
    Exactly one search terminates, deciding the word problem in $S$.
  For a finitely generated subgroup of $S$, fix words in $Y$ representing its generators and substitute these
    words into each input. This transfers the decider to that subgroup.
    Finally, the same substitution argument between any two finite generating sets of a group proves that
    decidability of its word problem is independent of the chosen finite generating set. ◻
]

== 6 The algebra construction <sec:algebra>

We now prove Theorem 4. The construction has two parts. A pair of monoids supplies a simple algebra and an
  embedding into a finitely presented algebra. Partial affine maps then give a corner with two equivalent
  orthogonal subcorners. A separator in the monoid construction will prove the tensor detection property.

=== 6.1 The monoid input <the-monoid-input>

We first define the auxiliary monoid used in the construction.
  Let $cal(P)$ be the monoid of partial maps of $bb(Q)$ generated by the full affine maps

$ u \( x \) = x \/ 2 \, wide v \( x \) = \( x + 1 \) \/ 2 \, $

their inverses, and the partial identities $e_0 \, e_1$ on $\[ 0 \, oo \) ∩ bb(Q)$ and $\[ 1 \, oo \) ∩ bb(Q)$,
  respectively. Composition applies the right-hand factor first. The identity $1_(cal(P))$ is the full identity map.

#thm([Lemma 6.1.])[
  #emph[The monoid $cal(P)$ has decidable word problem. Each of its elements is a map $x mapsto a x +
    b$ on a nonempty rational tail $\[ r \, oo \) ∩ bb(Q)$, or on all of $bb(Q)$, where $a =
    2^m$ for some $m in bb(Z)$, and $b \, r$ are dyadic rationals.]
] <lem:partial-affine>

#proof[
  Represent a full domain by $r = - oo$. The composition of the data $\( a \, b \, r \)$ and $\( c \, d \, s \)$ is
  $ (a c \, a d + b \, max { s \, \( r - d \) \/ c }) . $
  The generators have such data, and the displayed operation preserves them.
    Each domain is infinite, so two represented maps agree precisely when their domains,
    slopes and intercepts agree. The data and their comparison are computable using dyadic arithmetic. ◻
]

For a monoid $K$ with zero $Omega eq.not 1_K$, write

$ T = \( K \\ { Omega } \) times cal(P) med union.sq med { 0_T } . $

The element $0_T$ is absorbing. Nonzero pairs multiply coordinatewise,
  except that a product whose $K$-coordinate is $Omega$ is replaced by $0_T$. Its identity is $\( 1_K \, 1_(cal(P)) \)$.

#thm([Theorem 6.2.])[
  #emph[Let $hat(G)$ be a finitely generated group with decidable word problem.
    There exist a finitely presented monoid $K$ with zero $Omega eq.not 1_K$,
    and a finitely generated monoid $H$ with decidable word problem and zero $zeta eq.not 1_H$,
    with the following properties.]
  + #emph[There is an injective group homomorphism $hat(G) arrow.r H^times$.]
  + #emph[For the monoid $T$ defined above, there is an injective unital monoid homomorphism $kappa : T arrow.r
    H$ with $kappa \( 0_T \) = zeta$.]
  + #emph[For every finite ordered tuple $h_1 \, dots.h \, h_d$ of distinct nonzero elements of $H$, with $d gt.eq
    1$, there are $L \, R in H$ such that
$ L h_1 R = 1_H \, wide L h_i R = zeta quad \( 2 lt.eq i lt.eq d \) . $

]
  + #emph[There is an injective multiplicative map $c : H arrow.r K$ whose image is disjoint from ${ 1_K \,
    Omega }$. We write $c_h = c \( h \)$; this map is not required to preserve identities or zeros.]
  + #emph[There is an element $z in H$ such that the map
$ \( tau \, tau' \) mapsto kappa \( tau \) z kappa \( tau' \) $

 is an injection from $\( T \\ { 0_T } \)^2$ into $H \\ { zeta }$.]
] <thm:monoids>

The proof of Theorem 19 occupies Section 7, using the finite compiler proved in Appendix 8.
  In the construction, $zeta$ is the zero symbol and $z$ is the class of a distinct separator letter $mono(z)$.

=== 6.2 A simple algebra inside a finitely presented algebra <a-simple-algebra-inside-a-finitely-presented-algebra>

Throughout this section $k = bb(F)_2$. For any monoid $D$ with zero $0_D eq.not 1_D$,
  its contracted monoid algebra $k_0 \[ D \]$ has $k$-basis $D \\ { 0_D }$.
  Basis elements multiply as in $D$, with a product equal to $0_D$ interpreted as the zero vector.
  It is a unital algebra, with identity the basis element $1_D$.

To prove Theorem 4 for a given group $L$, apply Theorem 19 with $hat(G) = L$ and set

$ A_0 = k_0 \[ H \] \, wide B = k_0 \[ K \] . $

Both algebras are nonzero. We distinguish the monoid elements $zeta \, Omega$ from algebra zero,
  and distinguish $c_zeta$ from all three: it is a nonzero basis element of $B$.

The monoid requirements now serve distinct purposes. The selectors in Theorem 19(iii) isolate one coefficient of a
  nonzero element of $A_0$, forcing simplicity. The maps in (ii) and (iv) provide algebra embeddings in opposite
  directions, but treat zero differently: $kappa$ preserves it,
  whereas the linear extension of $c$ requires a correction by $c_zeta$.
  Finally, the separator in (v) keeps the ordered pairs indexing a tensor basis distinct,
  which will supply the tensor detector.

#thm([Lemma 6.3.])[
  #emph[The algebra $A_0$ is simple, the algebra $B$ is finitely presented,
    and there are injective algebra homomorphisms
$ i : A_0 arrow.r B \, wide rho : B ⊗_k k \[ cal(P) \] arrow.r A_0 . $

 The map $rho$ is unital. The map $i$ is nonunital and has support identity $e = i \( 1_(A_0) \) eq.not 1_B$.]
] <lem:algebra-embeddings>

#proof[
  Let $a = sum_(j = 1)^d lambda_j h_j$ be a nonzero element of $A_0$,
    with distinct nonzero support elements $h_j$ and nonzero coefficients $lambda_j in k$.
    Choose the selectors from Theorem 19(iii). In the contracted algebra they give $L a R = lambda_1 1_(A_0)$.
    Hence every nonzero two-sided ideal contains the identity, proving simplicity.
    This argument also covers a support element equal to $1_H$.
  The linear extension of $c$ alone would not respect the contraction of the zero class,
    since $c_zeta eq.not Omega$. For $h eq.not zeta$, define
  $ i \( h \) = c_h - c_zeta $
  and extend linearly. Multiplicativity of $c$ gives
  $ c_h c_(h') = c_(h h') \, wide c_h c_zeta = c_zeta c_h = c_zeta \, wide c_zeta^2 = c_zeta . $
  Consequently
  $ \( c_h - c_zeta \) \( c_(h') - c_zeta \) = c_(h h') - c_zeta . $
  When $h h' = zeta$, this is zero, as required. The vectors $c_h$ are distinct nonzero basis elements of $B$.
    In particular, the coefficient of $c_h$, for $h eq.not zeta$,
    in $i \( a \)$ is exactly the coefficient of $h$ in $a$, proving injectivity. Its support identity is
  $ e = c_(1_H) - c_zeta \, wide e^2 = e \, wide e i \( a \) = i \( a \) e = i \( a \) . $
  Neither basis vector in this expression is $1_K$; therefore $e eq.not 1_B$, and indeed $1_B in.not i \( A_0 \)$.
  A finite presentation for $B$ is obtained from the finite monoid presentation for $K$.
    We may adjoin a generator $Omega$ and a relation identifying it with a word representing the zero,
    so that $Omega$ is a presentation letter. Take the same generators in a free associative unital $k$-algebra,
    replace every equation $u = v$ by $u - v = 0$, and impose $Omega = 0$.
    To verify this presentation, first omit the last relation.
    The ideal of binomial relations is precisely the span of all differences of words in the same monoid
    congruence class. One inclusion follows because each contextual use of a defining equation belongs to the
    ideal, and a chain of such uses telescopes. The reverse inclusion follows by mapping each word to its
    congruence class in the free vector space on $K$. The quotient thus has basis $K$; imposing $Omega =
    0$ removes exactly its absorbing zero class. It gives $B$.
    Adding the relation $2 dot.op 1 = 0$ to the same generators and relations also presents $B$ as a unital ring.
  Finally, nonzero basis pairs give a unital algebra isomorphism
  $ B ⊗_k k \[ cal(P) \] tilde.equiv k_0 \[ T \] . $
  It sends $b ⊗ p$, for basis elements $b eq.not Omega$ and $p in cal(P)$, to $\( b \, p \)$;
    products that acquire $K$-coordinate $Omega$ vanish on both sides.
    The linear extension of $kappa$ gives the required injective unital map $rho$. ◻
]

Identify $A = i \( A_0 \) subset.eq B$. It is a simple algebra with its own identity $e$,
  and Theorem 19(i) embeds $L$ in $A^times$: a unit of $H$ and its inverse give inverse basis elements in $A_0$,
  which $i$ sends to units relative to $e$. We next construct an injective nonunital endomorphism of $B$ whose
  image lies in $A$.

=== 6.3 Two equivalent subcorners <two-equivalent-subcorners>

For a dyadic rational $a$, let $e_a$ denote the partial identity on $\[ a \, oo \) ∩ bb(Q)$.
  These maps belong to $cal(P)$: $u^(- 1) v$ is translation by $1$,
  its powers and conjugates by powers of $u$ give all dyadic translations,
  and conjugating $e_0$ by translation by $a$ gives $e_a$. In the monoid itself,

#[#set math.equation(numbering: n => "(20)")
 $ e_a e_b = e_(max { a \, b }) \, wide w e_a w^(- 1) = e_(w \( a \)) $ <eq:tail-identities>]

for every available full increasing affine map $w$. Thus these are equalities of basis elements in the abstract
  algebra $k \[ cal(P) \]$.

We require a nonzero corner that decomposes into two orthogonal copies of itself.
  The identities in the next lemma have the rectangular-inverse form familiar from Leavitt’s module-type
  construction #cite(label("Leavitt1962")) Section 3, with the corner idempotent as identity.
  Here we realize them directly using the partial affine maps above.

#thm([Lemma 6.4.])[
  #emph[There is a nonzero idempotent $q in k \[ cal(P) \]$ and elements $s'_0 \, s'_1 \, t'_0 \,
    t'_1 in q k \[ cal(P) \] q$ such that
$ t'_i s'_j = delta_(i j) q \, wide s'_0 t'_0 + s'_1 t'_1 = q . $

]
] <lem:binary-tail-corner>

#proof[
  Set $q = e_0 - e_1$. Its two basis elements and $1_(cal(P))$ are distinct, so $q eq.not 0 \, 1$;
    Equation (20) gives $q^2 = q$. Put
  $ w_0 = u \, quad w_1 = v \, wide q_0 = w_0 q w_0^(- 1) = e_0 - e_(1 \/ 2) \, quad q_1 = w_1 q w_1^(- 1) =
    e_(1 \/ 2) - e_1 . $
  Using the same tail identities and expanding in the monoid basis gives
  $ q_0^2 = q_0 \, quad q_1^2 = q_1 \, quad q_0 + q_1 = q \, quad q_0 q_1 = q_1 q_0 = 0 . $
  For example, $q_0 q_1 = e_(1 \/ 2) - e_1 - e_(1 \/ 2) + e_1 = 0$. In particular $q q_j = q_j q = q_j$.
  Define $s'_j = w_j q$ and $t'_j = q w_j^(- 1)$. Then $s'_j t'_j = q_j$ and $t'_j s'_j = q$.
    The identities $s'_j = q_j w_j$ and $t'_j = w_j^(- 1) q_j$, together with $q q_j = q_j q = q_j$, show
  $ q s'_j = s'_j q = s'_j \, wide q t'_j = t'_j q = t'_j . $
  Moreover $t'_j q_j = t'_j$ and $q_j s'_j = s'_j$. For $i eq.not j$ we therefore have
  $ t'_i s'_j = t'_i q_i q_j s'_j = 0 . $
  Finally $sum_j s'_j t'_j = q_0 + q_1 = q$. All calculations use Equation (20) and linear operations in
    $k \[ cal(P) \]$. ◻
]

Define

$ j : B arrow.r A_0 \, wide j \( b \) = rho \( b ⊗ q \) \, wide phi.alt = i compose j : B arrow.r B . $

These maps are nonunital algebra homomorphisms. The map $j$ is multiplicative because $q^2 = q$,
  and it is injective because $q eq.not 0$ and tensor products are over the field $k$.
  Hence $phi.alt$ is injective and $phi.alt \( B \) subset.eq A$. Let

$ p = phi.alt \( 1_B \) \, wide s_l = i rho \( 1_B ⊗ s'_l \) \, wide t_l =
  i rho \( 1_B ⊗ t'_l \) quad \( l = 0 \, 1 \) . $

The idempotent $p$ belongs to $A$, so $p eq.not 1_B$. Applying the two algebra maps to Lemma 21 gives

#[#set math.equation(numbering: n => "(21)")
 $ s_l \, t_l in p B p \, wide t_l s_j = delta_(l j) p \, wide s_0 t_0 + s_1 t_1 = p . $ <eq:B-corner-pairs>]

These elements commute with $phi.alt \( B \)$. Indeed,

$ \( b ⊗ q \) \( 1_B ⊗ s'_l \) = b ⊗ s'_l = \( 1_B ⊗ s'_l \) \( b ⊗ q \) \, $

and the identical calculation holds for $t'_l$; now apply $i rho$.
  Thus the required self-embedding and binary pairs centralizing $phi.alt \( B \)$ have been constructed.
  It remains to verify detection for the tensor action.

=== 6.4 A separating tensor vector <a-separating-tensor-vector>

As in Section 3, set $R = B ⊗_k B^(upright("op"))$, acting on $B$ by $\( a ⊗ b^(upright("op")) \) m = a m b$, and define

$ psi = phi.alt ⊗ phi.alt^(upright("op")) . $

We need one vector on which $psi \( r \)$ acts nontrivially for every $r eq.not 0$.
  The separator gives this simultaneously for all $r$, by realizing distinct basis tensors as distinct monoid elements.

Let $W = rho \( B ⊗_k k \[ cal(P) \] \) subset.eq A_0$, with basis ${ kappa \( tau \) : tau in T \\ { 0_T } }$.
  Part (v) of Theorem 19 proves that the linear map

$ D : W ⊗_k W^(upright("op")) arrow.r A_0 \, wide D \( x ⊗ y^(upright("op")) \) = x z y \, $

is injective: it sends distinct basis tensors to distinct nonzero basis elements of $A_0$.
  This includes tensors with an identity factor. Since $j \( B \) subset.eq W$, the composite

$ R arrow.r^(med j ⊗ j^(upright("op")) med) W ⊗_k W^(upright("op")) arrow.r^(med D med) A_0 arrow.r^(med i med) B $

is a sequence of injective linear maps. For $r = sum_nu a_nu ⊗ b_nu^(upright("op"))$, its value is

$ i #scale(x: 120%, y: 120%)[\(] D \( \( j ⊗ j^(upright("op")) \) \( r \) \) #scale(x: 120%, y: 120%)[\)] & =
  sum_nu i \( j \( a_nu \) \) thin i \( z \) thin i \( j \( b_nu \) \)\
 & = psi \( r \) dot.op i \( z \) . $

Thus $b_(*) = i \( z \)$ satisfies

#[#set math.equation(numbering: n => "(22)")
 $ r eq.not 0 quad arrow.r.double quad psi \( r \) dot.op b_(*) eq.not 0 . $ <eq:tensor-detection>]

The assertion concerns the action after $psi$; its proof uses the explicit separator vector.

#proof[
  The algebra $B$ is nonzero and finitely presented by Lemma 20.
    Its subalgebra $A = i \( A_0 \)$ is simple with identity $e$, and contains $L$ in its unit group.
    The map $phi.alt$ is injective, has image in $A$, and has proper support $p$.
    Equation (21) supplies the binary pairs centralizing $phi.alt \( B \)$,
    which give the tensor identities (1) as explained in Section 2.
    Finally, Equation (22) supplies the required vector $b_(*)$. These are all the asserted data. ◻
]

== 7 Coding with a decreasing dependency bound <sec:bootstrap>

We prove Theorem 19. The two monoids in that theorem must contain information about one another:
  the finitely presented monoid will multiply representatives of the decidable monoid,
  while the latter will contain a coded copy of the former.
  We arrange this using a program whose evaluations on words of length $n$ depend only on its values at strictly
  smaller lengths. The other ingredient is a family of separated words that supplies the finite-tuple selectors.

=== 7.1 The bounded compiler <the-bounded-compiler>

Fix a finite alphabet $Sigma$ containing the disjoint triples

$ \( mono(b)_T \, mono(a)_T \, mono(c)_T \) \, wide \( mono(b)_G \, mono(a)_G \, mono(c)_G \) $

and the six further letters $mono(z) \, mono(d) \, mono(l) \, mono(r) \, mono(h) \, zeta$.
  Fix a total order with $mono(a)_T < mono(c)_T$ and $mono(a)_G < mono(c)_G$.
  Words are ordered by #emph[shortlex]: first by length and then lexicographically.
  We use an acceptable programming system for partial functions $Sigma^(*) arrow.r Sigma^(*)$,
  writing $f_eta$ for the function with index $eta$. In particular,
  universal evaluation and effective substitution of parameters are available;
  integers and tuples are represented by fixed computable word encodings.

The following finite construction is proved in Appendix 8. Its conditional statement is essential:
  the program index determines the presentation without running the program.
  The evaluator is also fixed independently of a length bound;
  its termination and compatibility with equations will be proved from the program’s behavior within that bound.

#thm([Lemma 7.1.])[
  (Bounded compiler).  #emph[From a program index $eta$ one can compute a finite monoid presentation $K_eta$ with
    a zero letter $Omega$, a finite presentation alphabet $X_eta$, and an additive grade $gamma$ on words,
    such that $0 lt.eq gamma \( x \) lt.eq M = 2$ for every letter and $gamma \( Omega \) = 0$.
    There is a partial word algorithm $N_eta$, independent of any budget, with the following properties.]
  #emph[The alphabet contains letters $alpha \, sans(Q) \, omega$ and right anchor letters $a_R$ for $a in Sigma$,
    all mutually distinct and different from $Omega$. For a word $u$, let $u_R$ replace each letter $a$ by $a_R$,
    and set
$ "raw" \( u \) = alpha sans(Q) u_R omega wide \( u in Sigma^(*) \) . $

 Unconditionally, the algorithm fixes the empty word, $Omega$, and every literal word $"raw" \( u \)$,
   and sends every word containing $Omega$ to $Omega$. On an input word $a$,
   its only calls to $f_eta$ are on words of length at most $gamma \( a \)$;
   apart from those calls it performs finite computations.]
  #emph[Suppose that, for some integer $m gt.eq 0$,
#[#set math.equation(numbering: n => "(23)")
 $ & f_eta \( w \) upright(" is defined and ") \| f_eta \( w \) \| lt.eq \| w \| &  & \( \| w \| lt.eq m \) \,\
 & f_eta \( x f_eta \( w \) y \) = f_eta \( x w y \) &  & \( \| x w y \| lt.eq m \) . $ <eq:budget-total>]

 Then $N_eta$ terminates on all words of grade at most $m$.
   Each such word is joined to its literal output by a finite derivation in the presentation whose intermediate
   grades do not exceed the input grade. A single presentation equation, used in any context,
   preserves the output whenever both endpoints have grade at most $m$. Consequently
#[#set math.equation(numbering: n => "(24)")
 $ N_eta \( u \) = N_eta \( v \) quad arrow.r.double quad N_eta \( x u y \) = N_eta \( x v y \) quad
   upright("if ") gamma \( x u y \) \, gamma \( x v y \) lt.eq m . $ <eq:bounded-context>]

]
  #emph[If (23)–(23) hold for all $m$, then $N_eta$ decides equality in $K_eta$ and
#[#set math.equation(numbering: n => "(25)")
 $ N_eta #scale(x: 120%, y: 120%)[\(] "raw" \( u \) "raw" \( v \) #scale(x: 120%, y: 120%)[\)] =
   "raw" #scale(x: 120%, y: 120%)[\(] f_eta \( u v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:raw-product>]

 The presentation is computed without evaluating $f_eta$.]
] <lem:compiler>

For clarity, (24) follows from the preceding derivation statement.
  Transplant the paths from $u$ and $v$ to their common output into $x \( - \) y$.
  Neither contextual path leaves the budget, so one-step invariance identifies their outputs.
  A general machine encoding without this bounded conclusion would not suffice below.
  The raw singleton rule has a different role: it will distinguish the elements used for the injection $H arrow.r
  K$. Multiplication of two raw words, rather than evaluation of a singleton,
  will encode the product in $H$ through (25).

=== 7.2 Codes and finite rule tables <codes-and-finite-rule-tables>

First consider any index $eta$. The auxiliary monoid $cal(P)$ has decidable equality by Lemma 18.

Let $Y$ be the disjoint union of $X_eta$ and a fixed finite generating alphabet for $cal(P)$.
  For a $Y$-word $v$, write $v_K \, v_(cal(P))$ for its projections,
  obtained by deleting the letters of the other alphabet. Its #emph[tested class] is zero if $N_eta \( v_K \) =
  Omega$; otherwise it is the pair consisting of $N_eta \( v_K \)$ and the value of $v_(cal(P))$ in $cal(P)$.
  This is at present a partial test. For the second type of code,
  fix a finite monoid generating alphabet $Z$ for $hat(G)$,
  including the inverses of a finite group generating set, and test words by their values in $hat(G)$.
  This second test is total by the hypothesis of Theorem 19.

Choose computably an integer $D_0 > M$ such that $2^(D_0 - 1) gt.eq max { \| Y \| \, \| Z \| }$.
  Encode the letters of $Y$, in their chosen order, by distinct words beginning with $mono(b)_T$ and followed by
  $D_0 - 1$ letters from ${ mono(a)_T \, mono(c)_T }$, in lexicographic order.
  Encode $Z$ in the same way using the other triple. Write $C \( v \)$ for concatenation of the appropriate codes
  and put $C \( epsilon \) = epsilon$. The type of a nonempty code sequence is unambiguous.
  Codes preserve shortlex comparison and have length $D_0$ per generator.

Enumerate all nonempty finite ordered tuples

$ \( w_1^(\( j \)) \, dots.h \, w_(s_j)^(\( j \)) \) wide \( j gt.eq 1 \) $

of distinct $Sigma$-words avoiding $zeta$; the empty word is allowed as a member.
  Choose integers $N_j$ recursively so that

#[#set math.equation(numbering: n => "(26)")
 $ N_j > j \, wide N_j > max_i \| w_i^(\( j \)) \| \, wide N_j > 2 N_h + 2 +
   max_i \| w_i^(\( h \)) \| quad \( h < j \) . $ <eq:envelope-spacing>]

These inequalities concern #emph[all potential] earlier envelopes, regardless of which rules will be selected.
  The increasing sequence $N_j$ is computable without performing any tested-class evaluation.

We now define a partial procedure $F \( eta \, w \)$. Put $n = \|
  w \|$ and form the following finite rule table $cal(R)_n$.

+ Include $zeta a arrow.r zeta$ and $a zeta arrow.r zeta$ for every letter $a in Sigma$.
  For each nonempty $Y$-word $v$ with $D_0 \| v \| lt.eq n$, test its class.
  If it is zero, include $C \( v \) arrow.r zeta$. Otherwise find the shortlex least word $v'$ of the same tested
  class among all words of length at most $\| v \|$, including the empty word; include $C \( v \) arrow.r
  C \( v' \)$ if $v' eq.not v$. Do the same for $Z$-words using equality in $hat(G)$, with no zero case.
  Call these the #emph[static rules].
+ Process the tuples with $N_j lt.eq n$ in order. If every member of tuple $j$ has no reducible occurrence under
  the static rules and previously selected rules, include
  #[#set math.equation(numbering: n => "(27)")
   $ mono(d) mono(l)^(N_j) w_i^(\( j \)) mono(r)^(N_j) mono(h) arrow.r
     cases(delim: "{", epsilon \, & i = 1 \,, zeta \, & i > 1 .) $ <eq:selector-rules>]
  Some of these left sides may be longer than $n$; they simply cannot act on the input.
+ Reduce $w$ until no rule applies, using a fixed deterministic choice of occurrence and rule.

Whenever the tests terminate, the last step terminates: every rule decreases shortlex.
  In particular a nonempty code reduced to $zeta$ shortens, since $D_0 > 2$.
  All other non-code rules shorten as well. Thus $F$ is uniformly partial computable.

=== 7.3 The fixed point and its length induction <the-fixed-point-and-its-length-induction>

Effective substitution of parameters gives a total computable index transformation $tau \( eta \)$ for the
  function $F \( eta \, - \)$. Kleene’s Recursion Theorem #cite(label("Kleene38")) supplies an index with

#[#set math.equation(numbering: n => "(28)")
 $ f_eta \( w \) = F \( eta \, w \) $ <eq:fixed-point>]

as partial functions. Here is the short parameterization argument.
  Let $U$ be universal evaluation and let $d \( a \)$ be an effectively obtained index for the partial function $w
  mapsto U \( U \( a \, a \) \, w \)$. Choose an index $b$ computing the total function $a mapsto
  tau \( d \( a \) \)$. For $eta = d \( b \)$,

$ U \( eta \, w \) = U \( U \( b \, b \) \, w \) = U \( tau \( d \( b \) \) \, w \) = F \( eta \, w \) . $

Only now fix the presentation alphabet and code length belonging to this particular $eta$.
  There is no advance bound on the machine’s size or working space. Write $f = f_eta$ and $K = K_eta$.

#thm([Lemma 7.2.])[
  #emph[The function $f$ is total and length-nonincreasing. The rule tables are stable on bounded-length words:
    for $k lt.eq n$, $cal(R)_k$ and $cal(R)_n$ have the same rules whose left sides have length at most $k$.
    Each $cal(R)_n$ is confluent on words of length at most $n$, and
#[#set math.equation(numbering: n => "(29)")
 $ f \( x f \( w \) y \) = f \( x w y \) wide \( x \, w \, y in Sigma^(*) \) . $ <eq:f-context>]

]
] <lem:bootstrap>

#proof[
  We prove all bounded assertions together by induction on $n$.
    For $n = 0$, there are no tested classes or tuple decisions, and the empty word is unchanged.
    Suppose $n > 0$ and the assertions are known at smaller bounds.
    Every use of $N_eta$ in a static test, including each candidate in a least-representative search,
    uses a $Y$-word of length at most $floor.l n \/ D_0 floor.r$. Its $K$-projection has grade at most
  #[#set math.equation(numbering: n => "(30)")
   $ m = M floor.l n \/ D_0 floor.r < n . $ <eq:strict-dependency>]
  The induction hypothesis supplies (23)–(23) at $m$. Lemma 22 therefore makes all these tests terminate.
    There are only finitely many tests and tuple decisions, and the subsequent shortlex-decreasing reduction terminates.
  We first establish stability. For a fixed generator word $v$,
    its static rule is determined by the same tests and the same candidates of length at most $\|
    v \|$ at every larger bound. Consider a tuple with $N_j lt.eq k lt.eq n$.
    Each tested body has length less than $N_j$, hence less than $k$.
    New static left sides longer than $k$ cannot occur in it.
    Induction over earlier tuple numbers shows that the previously selected rules that can occur in the bodies
    also agree. Hence the decision for tuple $j$ agrees at both bounds.
    A new tuple with $N_j > k$ has every selector side longer than $k$,
    so cannot add a rule on a word of length at most $k$. This proves stability,
    including the decisions for selected rules too long to act at the smaller bound.
  It remains to prove local confluence for $cal(R)_n$. All reductions stay inside the length-at-most-$n$ ball.
    Disjoint occurrences can be reduced in either order. If the word contains $zeta$,
    every branch still contains it: absorption retains $zeta$,
    and no other rule has a left side containing that letter. Absorption joins all branches at $zeta$.
    We check the other overlaps explicitly.
  #emph[Selectors from different stages.] Let the older left side have total length $L$,
    and let the newer one be $mono(d) mono(l)^N w mono(r)^N mono(h)$. By (26), $L < N$ and $\| w \| < N$.
    A nonempty old suffix cannot equal a new prefix: the former ends in $mono(h)$,
    while a prefix of length at most $L$ lies in the initial $mono(d) mono(l)^N$.
    An old prefix cannot equal a new suffix, since their first letters are respectively $mono(d)$ and either
    $mono(r)$ or $mono(h)$. These exclude both orientations of a proper boundary overlap.
    For containment, an old occurrence cannot start at the new initial $mono(d)$,
    because its terminal $mono(h)$ would lie in the initial $mono(l)$-run. Any other start must be in the body.
    It cannot leave the body: it cannot end in the final $mono(r)$-run,
    and reaching the final $mono(h)$ would require crossing a run longer than the entire old side.
    Thus it would lie wholly in the body, contrary to the newer tuple’s irreducibility test.
  #emph[Selectors from one stage.] A second start strictly inside one side must lie in its body.
    There are then fewer than $N$ body letters left before the final $mono(r)$-run,
    so that start cannot be followed by $N$ consecutive $mono(l)$’s.
    If two sides start at the same place and their body lengths differ,
    the terminal $mono(h)$ of the shorter falls in the final $mono(r)$-run of the longer,
    because both body lengths are less than $N$. Equal body lengths force equal bodies, hence the same rule,
    as tuple members are distinct. This also covers an empty body.
  #emph[A code and a selector.] Code letters are disjoint from the envelope markers.
    An overlapping code side would therefore have to lie wholly inside the selector’s body.
    The static irreducibility test excluded this. All static sides short enough to occur there were already
    present when the tuple was processed, because the body’s length is less than $N_j$.
  #emph[Two code sides.] They have the same type and aligned starts:
    within a code sequence, $mono(b)_T$ or $mono(b)_G$ occurs only at a block boundary.
    Their union is therefore an entire code sequence $C \( v \)$, of length at most $n$.
    For group codes, a replacement preserves the value of this union by group multiplication.
    For product codes, replacing a subword by a nonzero tested-equal word preserves the tested class of the union
    by (24) and equality in $cal(P)$. Indeed each old or new union has generator length at most $floor.l n \/ D_0
    floor.r$, and hence its $K$-projection has grade at most $m$. We use this bound separately for both endpoints:
    a shorter generator word need not have smaller actual $K$-grade.
  If a subword tests zero, apply (24) to its $K$-projection and $Omega$, whose grade is zero.
    The contextual word containing $Omega$ has output $Omega$, so the union also tests zero.
    Hence if one branch introduces $zeta$, it reduces the whole union to $zeta$,
    and the other either does the same or retains a zero-class code sequence,
    to which its whole-word zero rule applies. That remaining sequence cannot be empty,
    since $N_eta \( epsilon \) = epsilon eq.not Omega$. The same argument covers a zero-class union when both
    first replacements are code sequences.
  If the union class is nonzero, let $v_(*)$ be its least representative among words of length at most $\| v \|$.
    Either branch yields a word $v_b$ of the same class with $\| v_b \| lt.eq \| v \|$.
    Since $v_b$ is one of the candidates defining $v_(*)$, we have $\| v_(*) \| lt.eq \| v_b \|$,
    and $v_(*)$ is also the least candidate within this smaller bound.
    Each branch therefore reduces by its whole-word rule to $C \( v_(*) \)$, unless it already equals that word.
    The representative $v_(*)$ may be empty; no empty left side is needed.
    These joining reductions can be made on the union before acting on any newly adjacent outside letters.
  This exhausts the local peaks. Termination and local confluence give confluence on the ball by Newman’s
    Lemma #cite(label("Newman42")). Indeed, by well-founded induction,
    assume every proper descendant of a word has a unique normal form.
    Any two first steps have a common descendant by local confluence;
    the induction hypothesis makes their normal forms equal, proving uniqueness for the original word and hence
    confluence. Finally, if $\| x w y \| lt.eq n$, perform inside $x \( - \)
    y$ the normalization of $w$ computed at bound $\| w \|$. By stability every rule used belongs to $cal(R)_n$,
    and length never increases. Confluence gives $f \( x f \( w \) y \) = f \( x w y \)$.
    This establishes the budget hypotheses at $n$ and completes the induction. ◻
]

=== 7.4 The two monoids and their embeddings <the-two-monoids-and-their-embeddings>

Let $H$ be the monoid on $Sigma$ whose equations are the union of all the rule tables.
  Every word is related to its computed normal form, which is irreducible for this union by stability.
  Conversely, a contextual use of any one equation preserves that form:
  choose a bound containing both endpoints and the equation, and apply stability and confluence from Lemma 23.
  Thus two words represent the same element of $H$ if and only if their literal $f$-outputs agree.
  This proves decidability. The empty word and the single letter $zeta$ are distinct irreducibles;
  they represent the identity and the absorbing zero of $H$.

The budget hypotheses now hold at every length, so Lemma 22 gives an equality test for $K$.
  In particular its identity and zero are distinct. The tested product classes are now the actual elements of

$ T = #scale(x: 120%, y: 120%)[\(] \( K \\ { Omega } \) times cal(P) #scale(x: 120%, y: 120%)[\)] union { 0_T } \, $

with coordinatewise multiplication and every pair having first coordinate $Omega$ collapsed to zero.
  Here a letter of $X_eta$ acts in the first coordinate and a generator of $cal(P)$ in the second;
  the letter $Omega$ maps to $0_T$. Thus $Y$ generates $T$.

For a nonzero element of $T$, take its least shortlex $Y$-representative $v$. The code $C \( v \)$ is irreducible:
  a subcode rule would either force the element to be zero or produce a smaller representative;
  no selector or absorption side occurs in a pure code word.
  Every other representative reduces by its whole-word rule to this same code,
  and every zero-class code reduces to $zeta$. Consequently coding defines an injective zero-preserving monoid map

$ kappa : T arrow.r H . $

It is unital because the least representative of the identity is empty,
  and it is multiplicative because codes concatenate. The identical argument for $Z$-words embeds $hat(G)$
  unitally in $H$. Its image consists of units, since the products of mutually inverse group words have the empty
  representative. This includes the trivial group and does not require a nonempty generating set.

Let $z in H$ be represented by the separator $mono(z)$. For least representatives $v \,
  v'$ of nonzero elements of $T$, the words

#[#set math.equation(numbering: n => "(31)")
 $ C \( v \) mono(z) C \( v' \) $ <eq:separator-words>]

are irreducible. No code crosses the separator; each code portion is already irreducible;
  and there are no selector markers or $zeta$. These literal words recover the ordered pair,
  including when one or both representatives are empty. They are nonzero because none equals $zeta$.
  This proves the separator assertion of Theorem 19.

=== 7.5 Selectors and multiplication by raw words <selectors-and-multiplication-by-raw-words>

Take any ordered tuple of distinct nonzero elements $h_1 \, dots.h \, h_s$ of $H$, and let $w_1 \, dots.h \,
  w_s$ be their normal words. These words avoid $zeta$, since any word containing it reduces to the zero word.
  Their tuple occurs in the enumeration, say at stage $j$. A word irreducible for the final rule set is
  irreducible for the static and selected rules present at stage $j$. Hence this tuple passes its test. With

$ L = mono(d) mono(l)^(N_j) \, wide R = mono(r)^(N_j) mono(h) $

as elements of $H$, the selected equations give $L h_1 R = 1$ and $L h_i R = zeta$ for $i > 1$.
  The argument includes a tuple containing the identity, whose normal representative is empty.

Finally define a multiplicative map in the opposite direction by

$ c : H arrow.r K \, wide c \( \[ w \] \) = \[ "raw" \( f \( w \) \) \] . $

The normal-form characterization of $H$ makes this well-defined.
  Every raw singleton is its own literal $N_eta$-output. Distinct normal words therefore give distinct elements of
  $K$, and none of these elements is its identity or its zero. For normal words $u \, v$, (25) gives

$ c \( \[ u \] \) c \( \[ v \] \) = \[ "raw" \( f \( u v \) \) \] = c \( \[ u v \] \) . $

Thus $c$ is injective and multiplicative, as required. It is not unital:
  even $c \( 1 \) = \[ "raw" \( epsilon \) \]$ is distinct from $1_K$.
  Also $c \( zeta \) eq.not Omega$; it is absorbing only within $c \( H \)$.
  The finite presentation of $K$ came from the compiler, while the finite alphabet and normal-form procedure give
  the claimed finite generation and decidability of $H$. All conclusions of Theorem 19 are proved.

== 8 The finite compiler <sec:compiler>

We prove Lemma 22. The input is a program index $eta$ for a partial function $f_eta :
  Sigma^(*) harpoon.rt Sigma^(*)$ on the fixed finite alphabet $Sigma$.
  We construct a finite monoid presentation and its partial evaluator.
  The main issue is to control arbitrary words in that presentation, including malformed machine configurations.

Encoding a finite machine by contextual equations, and checking the consequences of using those equations in
  reverse, are classical ideas #cite(label("Post1947")) pp. 3–6.
  Murskii used finite machine presentations to embed finitely generated recursively presented semigroups in
  finitely presented semigroups #cite(label("Murskii1967")) Theorem 1.2 and Section 1.5;
  his construction also controls malformed initial configurations #cite(label("Murskii1967")) Section 2.4.
  For the present construction we also need a single evaluator on all presentation words,
  normalization paths that never increase grade, and invariance under equations in arbitrary contexts within the
  grade bound. We prove these properties explicitly below.

Fix a deterministic one-tape machine for $f_eta$, with tape cells indexed by the nonnegative integers.
  A left move at cell zero stays there. The input begins at cell zero and is followed by blanks;
  a returned string also begins at zero and ends at its first blank.
  We use an effective compilation of the acceptable programming system into this convention.
  The resulting finite transition table is part of the compiler’s input;
  constructing the presentation never runs the program.

=== 8.1 Cells, paths, and the validator <cells-paths-and-the-validator>

A #emph[cell] consists of an immutable base in $Sigma union.sq { sans(C) \, sans(D) \,
  sans(W) }$ and a finite tag. Bases in $Sigma$ are called anchors.
  The other bases mark two cuts and a workspace cell. A tag has an anchor-read bit, a workspace-filled bit,
  a work symbol from the compiled machine’s finite tape alphabet, an output-reading bit,
  and an output mark in $Sigma union.sq { upright("none") }$.
  The #emph[clean] tag has every bit unset, work symbol blank, and output mark none.
  All these fields may be included on every base; fields not used there are simply left unchanged.
  A bare cell base in a rule means the cell with its entire tag clean.

The presentation has a zero letter $Omega$ and the arrows of the quiver in Figure 2.
  There are arrows $alpha : O arrow.r L$ and $omega : R arrow.r O$, head arrows $L arrow.r R$,
  and two loop copies $b_L \, b_R$ of every tagged cell $b$, at $L \, R$, respectively.
  There are no vertex-identity generators: the empty word is the global identity.
  Add the equations making $Omega$ absorbing and making every incompatible pair of arrows equal to $Omega$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$O$])
  content((3, 0), [$L$])
  content((6, 0), [$R$])
  line((0.2657, 0), (2.734, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((1.5, 0), [$alpha$], anchor: "south", padding: 0.1176cm)
  line((3.266, 0), (5.734, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.5, 0), [heads], anchor: "south", padding: 0.1176cm)
  bezier((6, 0), (0, 0), (4.083, -1.342), (1.917, -1.342), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3, -1.007), [$omega$], anchor: "north", padding: 0.1176cm)
  bezier((2.934, 0.2451), (3.066, 0.2451), (2.805, 0.7281), (3.195, 0.7281), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((3, 0.6073), [$b_L$], anchor: "south", padding: 0.1176cm)
  bezier((5.934, 0.2451), (6.066, 0.2451), (5.805, 0.7281), (6.195, 0.7281), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((6, 0.6073), [$b_R$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: Nonzero words are paths. Cutting at each interior visit $omega alpha$ to $O$ leaves sectors with at most one head. ],
) <fig:compiler-quiver>

A nonempty path is cut at every $omega alpha$ into #emph[sectors].
  Each contains at most one head, since returning from $R$ to $L$ requires such a cut.
  A headed sector has optional $alpha$, left loops, a head, right loops, and optional $omega$.
  Sectors without heads are allowed. Thus the same notation describes complete computations and words with missing
  boundaries.

Assign grade zero to $Omega$ and workspace cells, grade two to cut cells with base $sans(C)$,
  and grade one to all other generators. Tags do not affect grade.
  Extend grade additively to words, writing $gamma$. The maximum generator grade is therefore $M = 2$.
  Workspace can be added without increasing grade, although it increases literal word length.

Use raw and quota heads $sans(Q) \, sans(P)$, validator heads $sans(I) \, sans(J) \, sans(J)' \, sans(N) \,
  sans(V)$, a disjoint set of machine heads, and a cleanup head $sans(Z)$.
  For an anchor word $x$, the notation $x_L$ or $x_R$ means its sequence of clean cell copies.
  A sector is #emph[full raw] if it has the form

$ "raw" \( x \) = alpha sans(Q) x_R omega \, wide x in Sigma^(*) . $

The word $x$ is its payload. To combine two such sectors, first impose

#[#set math.equation(numbering: n => "(32)")
 $ sans(Q) a_R & = a_L sans(Q) &  & \( a in Sigma \) \,\
sans(Q) omega alpha sans(Q) & = sans(C)_L sans(P) sans(D)_R \, & sans(P) sans(D)_R & =
  sans(W)_L sans(P) sans(D)_R \, & sans(P) sans(D)_R & = sans(I) sans(D)_R . $ <eq:compiler-slide>]

In the following validator equations, the arrows specify the forward direction used to analyze the machine;
  the defining relations are equations in both directions:

#[#set math.equation(numbering: n => "(33)")
 $ sans(W)_L sans(I) & arrow.r sans(I) sans(W)_R \, & sans(C)_L sans(I) & arrow.r
   sans(J) sans(C)_R \, & a_L sans(J) & arrow.r sans(J) a_R \,\
alpha sans(J) & arrow.r alpha sans(J)' \, & sans(J)' a_R & arrow.r a_L sans(J)' \, & sans(J)' sans(C)_R & arrow.r
  sans(C)_L sans(N) \,\
sans(N) sans(W)_R & arrow.r sans(W)_L sans(N) \, & sans(N) sans(D)_R & arrow.r
  sans(D)_L sans(V) \, & sans(V) a_R & arrow.r a_L sans(V) \, & sans(V) omega & arrow.r
  q_(upright("start")) omega . $ <eq:compiler-validation>]

The anchor rules range over $a in Sigma$.

An #emph[entry] has head $sans(I)$ immediately before clean $sans(D)_R$.
  The validator reaches $q_(upright("start"))$ from an entry only when that entry has the complete form

#[#set math.equation(numbering: n => "(34)")
 $ alpha x_L sans(C)_L sans(W)_L^s sans(I) sans(D)_R y_R omega \, wide x \, y in Sigma^(*) \, quad s gt.eq
   0 . $ <eq:compiler-clean-entry>]

Indeed the first left sweep checks precisely the clean workspace up to $sans(C)$,
  and the next checks only clean anchors up to $alpha$. The rightward sweeps then check these anchors,
  the first cut, the workspace, the second cut, and only clean anchors up to $omega$.
  Thus both boundaries and every tag are checked. At the handoff all cells are on the left of the head.

These relations prepare a raw product for computation. Slide the first head across $x$,
  merge the two adjacent heads, insert $s$ workspace cells, and enter the validator.
  The simulation and cleanup defined below will complete the following passage whenever $f_eta \( x y \)$ is
  defined and has length at most $\| x y \|$, provided $s$ is sufficiently large:

#[#set math.equation(numbering: n => "(35)")
 $ "raw" \( x \) "raw" \( y \) & med arrow.r.squiggly med alpha x_L sans(C)_L sans(W)_L^s sans(I) sans(D)_R y_R omega\
 & med arrow.r.squiggly med "raw" #scale(x: 120%, y: 120%)[\(] f_eta \( x y \) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:compiler-pipeline>]

The first passage is the preparation just described; the second is validation, simulation on the workspace,
  and cleanup. The two anchor blocks retain the input $x y$ and provide space for its output letters.

Successful computations alone do not control the presented monoid,
  because each equation can also be used in reverse. The validator and simulator will preserve the ordered cell
  bases and have finitely many tags and head states. Consequently their transitions on any fixed sector form a
  finite graph, even if the simulated program never halts. We will search its whole weak component—allowing
  transitions in either direction—to normalize arbitrary configurations.
  The component analysis will distinguish those that contain an entry from those that do not.
  Quota insertion is kept outside this finite graph.

=== 8.2 A finite transition table for the computation <a-finite-transition-table-for-the-computation>

We specify the remaining machine equations explicitly through finite scan instructions.
  This makes the construction uniform in $eta$ while avoiding a separate list of rules for each tape symbol.

Every state has one designated reading side. A right-reading state has, for each tested tagged cell,
  at most one rule of either form

#[#set math.equation(numbering: n => "(36)")
 $ q b_R arrow.r b'_L q' quad upright("or") quad q b_R arrow.r q' b'_R \; $ <eq:compiler-instructions>]

a left-reading state uses the mirrored forms. These instructions cross the cell or stay in the same gap,
  respectively. The cells $b \, b'$ always have the same base.
  Boundary tests are stationary rules $alpha q arrow.r alpha q'$ or $q omega arrow.r
  q' omega$ on the designated side. A failed test has no rule.
  A finite cell predicate expands into the list of tagged cells satisfying it; complementary cases are disjoint.
  Finite registers are incorporated into the state set by a finite Cartesian product.

Here are the scan instructions used below, together with their complete expansion convention.

- To rewind, cross every cell on the left unchanged. At $alpha$,
  change state without moving and start the specified right-reading continuation.
  If $alpha$ is absent, the scan gets stuck at the left end of the word.
- To find the first cell satisfying a predicate, test cells on the right. At a failure cross unchanged and repeat.
  At a match use the specified stationary update and continuation.
  At $omega$, use the specified end continuation, or get stuck if failure was prescribed.
- To go to the right boundary, cross all right cells unchanged and use the specified stationary continuation at $omega$.

All invocations are expanded with distinct phase states, apart from explicit repetitions of a loop.
  In particular $q_(upright("start"))$ is fresh: its only incoming rule is the validator handoff,
  and its only outgoing rule is $q_(upright("start")) omega arrow.r q_(upright("rewind")) omega$,
  where $q_(upright("rewind"))$ starts the first rewind. No continuation returns to $q_(upright("start"))$ or to a
  validator state.

The following finite control program supplies all further internal machine equations.

+ #emph[Copy the input.] Rewind, and find the first anchor whose read bit is unset.
  Set that bit, carry its base $a$ in finite state, rewind,
  and find the first workspace cell whose filled bit is unset. Write $a$ on its work track and set its filled bit.
  Failure to find that workspace cell is stuck. Rewind and repeat the anchor search.
  When the anchor search reaches $omega$, rewind and check that an unfilled workspace cell remains;
    otherwise get stuck. Rewind once more and locate the first workspace cell for simulation.
    On (34) this writes exactly $x y$ in anchor order into the initial workspace cells, followed by a blank.
+ #emph[Run the given machine.] The simulated head reads a workspace cell on its right.
  For each machine state and work symbol, expand its single transition using (36).
  A stationary move writes and stays. A right move writes and crosses the current cell,
  and the next simulation state requires another workspace cell on the right.
  A left move first writes without crossing, then enters a left-reading intermediate state.
  That state crosses an immediately left workspace cell unchanged,
  or stays if the immediately left base is $sans(C)$; any other case is stuck.
  It then returns to a right-reading simulation state. This implements the left-end convention.
  A halt is recognized only at a workspace cell in bounds.
+ #emph[Read the output.] After halt, rewind and find the first workspace cell whose output-reading bit is unset.
  A blank work symbol ends the output. For a work symbol $a in Sigma$, set that bit, carry $a$ in finite state,
  rewind, and place output mark $a$ on the first anchor whose output mark is none.
  Failure to find such an anchor is stuck. Rewind and repeat.
  An invalid output symbol, or exhaustion of the workspace without a blank, is stuck.
  When output ends, go to $omega$ and enter a fresh state $q_(upright("ok"))$, with no outgoing internal transition.

Each instruction uses only the finite predicates, finite registers, and updates just specified.
  Expanding all cases gives a finite list of equations computable from the machine table.
  Each state tests only its designated side and has disjoint cases.
  Consequently the internal forward transition relation has outdegree at most one on #emph[every] sector,
  including sectors with missing boundaries and arbitrary tags.
  Every transition preserves the number and ordered bases of the cells.

On a passing entry, simulation success computes $f_eta \( x y \)$ genuinely.
  Conversely, if $f_eta \( x y \)$ is defined and has length at most $\| x y \|$,
  then some finite quota $s$ permits success: take more workspace cells than the input length,
  the largest tape index visited by the halting computation, and the output length.
  The extra cell supplies its blank delimiter. There are $\| x y \|$ anchors for the output marks.
  This includes empty input: at least one workspace cell is supplied, and a length bound forces the output to be empty.

Add the exit equation $q_(upright("ok")) omega arrow.r sans(Z) omega$ and the following cleanup equations.
  An anchor cell $b$ with output mark $a in Sigma$ has

#[#set math.equation(numbering: n => "(37)")
 $ b_L sans(Z) arrow.r sans(Z) a_R . $ <eq:compiler-cleanup>]

For every other tagged cell use $b_L sans(Z) arrow.r sans(Z)$, and add $alpha sans(Z) arrow.r alpha sans(Q)$.
  Cleanup is deterministic and never increases grade, even on dirty data.
  Applied to a successful passing entry, it leaves

#[#set math.equation(numbering: n => "(38)")
 $ alpha sans(Q) f_eta \( x y \)_R omega . $ <eq:compiler-success>]

The leftward sweep places successive output letters on its right in the correct order.
  All unused anchors and all nonanchor cells disappear.

=== 8.3 Finite components on arbitrary sectors <finite-components-on-arbitrary-sectors>

We now analyze sectors with arbitrary tags and optional boundaries.
  For a validator or machine sector, form the graph of internal forward transitions,
  excluding entry from $sans(P)$ and exit to $sans(Z)$. We use its entire weak connected component.
  The ordered bases of its cells and its boundary flags are fixed.
  If there are $k$ cells and $h$ internal head states, with at most $c$ tags per cell,
  there are at most $\( k + 1 \) h c^k$ possible configurations with these data.
  Its weak component can therefore be found by a finite search through elementary compiled steps.
  This search does not call $f_eta$ or wait for a computation to halt.
  In particular, the quota insertion rule is excluded: finite grade alone would not bound the number of grade-zero
  workspace cells.

#thm([Lemma 8.1.])[
  #emph[Every internal weak component has at most one entry and at most one sector whose head is
    $q_(upright("ok"))$ immediately before its final $omega$.
    If both occur, the forward computation from the entry reaches that sector and has the clean form and genuine
    output described in (34) and (38).]
] <lem:compiler-components>

#proof[
  An entry has internal indegree zero: the only possible predecessor of an $sans(I)$-sector is a left sweep,
    whose output has clean $sans(W)$ immediately right of the head, whereas an entry has clean $sans(D)$.
    Every other validator sector has indegree at most one. For head $sans(J)$,
    its possible predecessor types are distinguished by clean $sans(C)$ versus an anchor immediately right.
    For $sans(J)'$ they are distinguished by $alpha$ versus an anchor immediately left;
    for $sans(N)$ by clean $sans(C)$ versus $sans(W)$ immediately left;
    and for $sans(V)$ by clean $sans(D)$ versus an anchor immediately left.
    There are no transitions from machine states to validator states.
  The validator phases progress in their displayed order, and each sweep is finite.
    An entry whose validation fails before handoff therefore belongs to an isolated finite chain:
    its vertices have at most one predecessor and one successor, the entry has no predecessor,
    and the failed end has no successor. It shares its component with no other entry.
    Every passing entry has (34). Its fixed base sequence and boundary flags determine it uniquely,
    including its clean tags and the head gap immediately before the unique $sans(D)$.
    Hence there is at most one entry in any component.
  Finally, a finite directed graph with outdegree at most one has a single eventual cycle or terminal vertex in
    each weak component. Indeed the unique forward trajectories of adjacent vertices have the same eventual
    object, and this propagates along weak paths. A sector ending in $q_(upright("ok")) omega$ is terminal.
    Thus it is the only such sector in its component, and every forward trajectory there reaches it.
    If an entry is present, it therefore passes validation and genuinely succeeds. ◻
]

=== 8.4 The partial evaluator <the-partial-evaluator>

The component lemma leaves a choice when both an entry and a successful terminal occur.
  Returning to the entry, removing its quota, and undoing the merge, then sliding the raw heads left,
  gives $"raw" \( x \) "raw" \( y \)$; cleaning up the terminal gives $"raw" \( f_eta \( x y \) \)$.
  We give the entry priority, so that internal equations have identical preprocessing outputs.
  The final combination of consecutive raw sectors will identify the two routes in (35),
  using the contextual identity assumed in Lemma 22 when other raw sectors are adjacent.

This priority also applies to a failed or malformed entry;
  in that case quota removal need not produce two full raw sectors.
  Conversely, a successful component without an entry need not encode a genuine input computation.
  It can use its unique terminal cleanup directly. The following algorithm includes all these cases.

The algorithm $N_eta$ preserves the empty word. It sends every word containing $Omega$, and every nonpath,
  to $Omega$, using the zero relations. For a nonempty path, first preprocess its sectors as follows.

+ Leave sectors without heads unchanged. Move $sans(Q)$ to its leftmost reachable gap using (32),
  across clean anchors only.
+ If $sans(P)$ has clean $sans(D)_R$ immediately right, remove all immediately preceding clean $sans(W)_L$ by the
  quota equation. If clean $sans(C)_L$ is then immediately left,
  unmerge $sans(C)_L sans(P) sans(D)_R$ into $sans(Q) omega alpha
  sans(Q)$ and normalize the two resulting raw heads as above. Otherwise keep the trimmed sector.
  A $sans(P)$ without immediately right clean $sans(D)_R$ is kept.
+ Run $sans(Z)$ cleanup until it is stuck or becomes $sans(Q)$; in the latter case normalize that raw head.
+ For any validator or machine head, find its finite internal weak component.
  If there is an entry, move to it along a weak path, revert to $sans(P)$, and use the preceding rule.
  If there is no entry but there is a sector ending in $q_(upright("ok")) omega$, move there and use cleanup.
  If neither exists, use the least sector in the component in shortlex order.

Lemma 24 makes the choices in the last rule unambiguous. The ordering is fixed independently of any grade budget.
  All these operations preserve the original outer boundaries;
  only unmerge creates an interior $omega alpha$ and splits a sector.

Replace each maximal run of $t gt.eq 2$ consecutive full raw sectors, with payloads $u_1 \, dots.h \, u_t$, by

#[#set math.equation(numbering: n => "(39)")
 $ alpha sans(Q) f_eta \( u_1 dots.h.c u_t \)_R omega . $ <eq:compiler-run>]

A run of length one is left unchanged, without evaluating $f_eta$. This completes the definition of $N_eta$.
  Its only calls to that function are in (39).

Assume now the budget hypothesis of Lemma 22 at $m$. Every preprocessing operation has a derivation that never
  raises grade. Internal component paths preserve every base and hence grade.
  Raw slides and entry reversal preserve grade. Quota cells have grade zero. Unmerge preserves grade because

$ gamma \( sans(C)_L sans(P) sans(D)_R \) = 2 + 1 + 1 = 1 + 1 + 1 + 1 = gamma \( sans(Q) omega alpha sans(Q) \) . $

Cleanup preserves or decreases it. Each argument in (39) has length at most the original total grade,
  since every anchor contributes one. Thus all required calls terminate for an input of grade at most $m$.

The replacement of two full raw sectors is also derivable without raising grade.
  Move the first head right across its anchors, merge at $sans(Q) omega alpha sans(Q)$,
  insert a sufficient grade-zero workspace quota, enter, simulate successfully, and clean up.
  The result is the raw word for $f_eta \( u_1 u_2 \)$. Repeating this operation gives (39),
  because the budget hypothesis implies

$ f_eta #scale(x: 120%, y: 120%)[\(] f_eta \( u_1 u_2 \) u_3 #scale(x: 120%, y: 120%)[\)] = f_eta \( u_1 u_2 u_3 \) $

and the analogous identities for longer runs. The successive arguments to $f_eta$ have length at most $\| u_1 \| +
  dots.h.c + \| u_t \|$, because $f_eta$ is length-nonincreasing.
  Each elementary derivation step preserves or decreases grade, including the insertion of grade-zero workspace.
  Thus every call and every intermediate word remains within its required budget.
  This proves termination and the asserted grade-nonincreasing normalization path.

=== 8.5 Invariance under equations and contexts <invariance-under-equations-and-contexts>

We verify that one contextual equation step preserves $N_eta$ when both endpoints have grade at most $m$.
  All nonzero equation sides are nonempty paths with the same initial and terminal vertices.
  This includes the deletion $b_L sans(Z) arrow.r sans(Z)$.
  A replacement therefore preserves whether the whole word is a path.
  Zero equations and nonpaths give $Omega$ on both sides, so it remains to compare paths,
  using their sectors in the whole contextualized word.

Raw slides have the same leftmost reachable gap. Quota changes have the same trimmed sector.
  Entry from $sans(P)$ has the same preprocessing on both sides,
  since the internal component gives priority to its entry, even if that entry is malformed and validation fails.
  Internal validator or machine equations leave the weak component unchanged.
  Cleanup equations give the same result by forward determinism, including the last step to $sans(Q)$.
  A merge is immediately undone by quota preprocessing before normalizing its two raw heads.
  This remains true when the two sectors have incomplete outer boundaries or dirty cells.
  In each case the preprocessed sector list is identical, so its subsequent raw-run replacements agree.

The only remaining equation is $q_(upright("ok")) omega arrow.r sans(Z) omega$.
  If its internal component has no entry, both sides use the same unique terminal cleanup.
  If it has an entry, Lemma 24 says that the entry is (34) and its computation returns $f_eta \( x y \)$.
  Entry-priority preprocessing on one side gives two full raw sectors for $x \, y$;
  cleanup on the other gives a single full raw sector for $f_eta \( x y \)$.
  With no full raw neighbors, the pair is replaced by exactly that singleton.
  Otherwise let $a \, b$ be the concatenations of the neighboring raw words on the left and right.
  The final runs have outputs

$ f_eta \( a x y b \) quad upright("and") quad f_eta #scale(x: 120%, y: 120%)[\(] a f_eta \( x y \) b
  #scale(x: 120%, y: 120%)[\)] \, $

which agree by the budget hypothesis. The anchor count $\| a x y
  b \|$ on the entry side is at most the original grade, so this use is legitimate.
  Passing validation forces both $alpha$ and $omega$; an incomplete sector cannot occur in this exceptional
  comparison. This proves equation-step invariance in every context.

If $N_eta \( u \) = N_eta \( v \)$ and both $x u y \, x v y$ have grade at most $m$,
  transplant the nonincreasing normalization paths of $u$ and $v$ into $x \( - \) y$.
  Additivity keeps every intermediate word within budget. Equation-step invariance identifies each input’s answer
  with the answer of its contextualized normal form. Those two middle strings are literally equal,
  proving bounded context compatibility. This argument does not require sector boundaries to survive the
  attachment of context.

If the hypotheses hold at every budget, every finite derivation is covered by some budget.
  Invariance then implies that equal monoid words have equal $N_eta$ answers.
  The converse follows from each word’s derivation to its answer. Thus $N_eta$ is an exact word-problem evaluator.
  Its definition always leaves each raw singleton $alpha sans(Q) u_R omega$ literal,
  distinct from $Omega$ and from the empty word; on two such sectors it gives the raw encoding of
  $f_eta \( u v \)$ whenever the relevant budget hypothesis holds. All parts of Lemma 22 follow.

#bibliography("refs.bib", style: "ieee", title: [References])
