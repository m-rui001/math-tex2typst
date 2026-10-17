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

#align(center)[#text(size: 16pt, weight: "bold")[Simple $F_oo$ overgroups of groups \
with decidable word problem]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

The word problem asks whether a word in a fixed finite generating set and its inverses represents the identity. A finitely generated group has #emph[decidable word problem] if an algorithm answers this question for every word. Embedding theorems connect this algorithmic condition with the algebraic structure of an overgroup. Higman’s embedding theorem characterizes the finitely generated subgroups of finitely presented groups as the recursively presented groups: those admitting a recursively enumerable set of defining relations #cite(label("Higman1961")). Boone and Higman obtained the finer characterization #cite(label("BH74")) Theorem I: a finitely generated group has decidable word problem if and only if it embeds in a simple group which in turn embeds in a finitely presented group. They asked whether the simple overgroup itself can always be finitely presented #cite(label("BH74")) p. 43. This is the Boone–Higman conjecture. Thompson subsequently showed that the intermediate simple group can be chosen finitely generated with decidable word problem #cite(label("Tho80")).

We consider the strengthening that asks for finiteness in every homotopical dimension. A group $H$ has #emph[type $F_n$] if it admits a classifying space $K \( H \, 1 \)$ with finite $n$-skeleton, and has #emph[type $F_oo$] if it admits such a space with finitely many cells in each dimension. Here a classifying space is a connected CW complex with fundamental group $H$ and contractible universal cover. Type $F_1$ is finite generation and type $F_2$ is finite presentation. The question of a simple overgroup of type $F_oo$ appears in the discussion following Question 5.6 of #cite(label("BBMZsurvey"), form: "prose"); Question 5.6 itself asks about overgroups of type $F_oo$ for arbitrary finitely presented groups.

#thm([Theorem 1.1.])[
  #emph[Every finitely generated group $G$ with decidable word problem admits an injective homomorphism into a nontrivial simple group $H$ of type $F_oo$.]
] <thm:main>

The input need not be finitely presented, and its word-problem algorithm may have arbitrary running time. The classifying space of $H$ may have infinitely many dimensions; type $F_oo$ imposes neither torsion-freeness nor finite cohomological dimension. The theorem answers the higher-finiteness question positively and in particular implies the Boone–Higman conjecture.

The classical converse gives an algebraic characterization here as well #cite(label("BH74")). A nontrivial finitely presented simple group has decidable word problem: in parallel, enumerate consequences of its defining relations and consequences after adding the input word as a relation. A trivial input word is detected by the first search; a nontrivial one normally generates the simple group, so the second search eventually proves all generators trivial. These outcomes are exclusive because the original group is nontrivial. Restricting this algorithm along an embedding solves the word problem in any finitely generated subgroup. Thus the groups in Theorem 1 are exactly the finitely generated subgroups of simple groups of type $F_oo$.

=== 1.1 Earlier embeddings and the higher-finiteness obstacle <earlier-embeddings-and-the-higher-finiteness-obstacle>

Thompson-type groups have long supplied simple groups with strong finiteness properties. Brown established type $F_oo$ for the Thompson–Higman families #cite(label("Brown1987")) Section 4. More recently, Belk and Zaremsky constructed a single simple group of type $F_oo$ containing all finitely generated right-angled Artin groups #cite(label("BelkZaremsky2022")) Corollary E; these are the groups presented by generators indexed by the vertices of a finite graph, with commutation relations for its edges. Belk, Hyde and Matucci constructed a simple group of type $F_oo$ containing every countable abelian group #cite(label("BHMgerms")) Theorems 4.4–4.6. Such results give substantial classes of examples without a general construction from a word-problem algorithm.

Other recent advances concern the finite-presentation conclusion of the Boone–Higman conjecture. Belk, Bleak, Matucci and Zaremsky proved it for hyperbolic groups and contracting self-similar groups #cite(label("BBMZhyperbolic")) Theorem A and Corollary D. Belk, Fournier-Facio, Hyde and Zaremsky proved it for $"Aut" \( F_n \)$ and mapping class groups of orientable punctured surfaces of finite type #cite(label("BFFHZ")) Theorem A and Corollary B. Here $F_n$ denotes the free group of rank $n$. These conclusions do not by themselves give simple overgroups of type $F_oo$. Higher finiteness requires control of additional relations among relations in every dimension.

Our final step uses the twisted Brin–Thompson construction of #cite(label("BelkZaremsky2022"), form: "prose"). Its input is a faithful action of a group $Lambda$ on a countably infinite set $S$. The action must be #emph[oligomorphic], meaning that it has finitely many orbits on finite subsets of each fixed cardinality. If $Lambda$ and all its finite-set stabilizers have type $F_oo$, their theorem gives a simple group $S V_Lambda$ of type $F_oo$ containing $Lambda$. Consequently the problem is to embed $G$ in a group equipped with such an action, including the finiteness properties of its stabilizers. We construct a #emph[highly transitive] action: any two ordered tuples of distinct points of the same finite length lie in the same orbit. This supplies the orbit condition. We prove type $F_oo$ for the pointwise stabilizers; the corresponding setwise stabilizers are finite extensions and inherit the property.

The stabilizer requirement is a genuine restriction on the choice of acting group. Fournier-Facio, Kropholler, Lyman and Zaremsky prove that an oligomorphic action on an infinite set of a group of finite virtual cohomological dimension, or of a countable group linear over a field, always has a finite-set stabilizer which is not of type $F_oo$ #cite(label("FFKLZstabilizers")) Theorem 1.1. The construction below therefore builds the overgroup and its stabilizers together; it does not ask the original group to possess an action with these properties.

=== 1.2 Constructing the action and proving finiteness <constructing-the-action-and-proving-finiteness>

The action begins with a finitely presented ring $B$, the elementary matrix group $Q = upright(E)_7 \( B \)$, and its action on the column set $X = B^7$. Here $upright(E)_r \( B \)$ is generated by the off-diagonal elementary matrices. We construct compatible injections

$ delta : Q arrow.r Q \, #h(2em) sigma : X arrow.r X . $

At each new stage, matrices can permute any finite collection of the compressed columns $sigma \( X \)$. The direct limits of these two systems, with the stage shift adjoined to the group, give the action $Lambda arrow.cw.half S$. This makes high transitivity a local matrix calculation. The same construction embeds $G$ into $Q$.

The ring has to encode more than the given group. Its units must also encode prescribed enlargements of the action of $upright(E)_7 \( B \)$ on $B^7$, so the objects being encoded already involve the ring being constructed. We resolve this self-reference by a length induction. A finite compiler from the companion article #emph[Finite algebraic envelopes and the Boone–Higman conjecture] #cite(label("FoundationsCompanion")) gives equality calculations at each finite bound when its stated hypotheses hold. The encoding ensures that every recursive call uses a strictly smaller bound. Kleene’s recursion theorem first supplies the program, and the length induction then proves its totality and compatibility with multiplication. The companion also supplies a binary corner construction and a Steinberg-kernel annihilation theorem; their exact statements appear where they are used.

Finiteness is supplied by a separate ascending-torus criterion. For an injective endomorphism $f : U arrow.r U$, write

$ T \( U \, f \) = chevron.l U \, t divides t^(- 1) u t = f \( u \) med upright("for ") u in U chevron.r . $

A factorization of $f$ through a finitely presented group gives a finite presentation of $T \( U \, f \)$. To obtain higher finiteness, we use two finite systems of homomorphisms whose images commute in specified pairs. Their product identities come from orthogonal idempotents over $bb(F)_2$ and $bb(F)_3$. After lower-dimensional terms have been killed, commuting products act additively on homology. The two systems then force the same class to be annihilated by both $2$ and $3$.

The essential point is uniformity. We use simplices whose vertices are elements of $U$, and regard two simplices as having the same type when they differ by a simultaneous left translation. One iterate and one finite set of output types work for every cycle using a given finite set of input types. Chain lengths and coefficients may be arbitrarily large. This control allows fillings with coefficients in products of copies of the group ring, and the Bieri–Eckmann finiteness method then gives finite skeleta in every dimension. The result is Theorem 3.

The acting group and each finite-point stabilizer are themselves ascending tori to which this same criterion applies. For stabilizers, the defining endomorphism factors through a finitely presented Steinberg group. The second factor sends the #emph[entire] Steinberg group into the stabilizer, not merely the image of the first factor. The commuting diagrams preserve the fixed points as well. These two properties establish type $F_oo$ for all stabilizers and complete the input to the twisted Brin–Thompson theorem.

=== 1.3 Organization and conventions <organization-and-conventions>

Section 2 proves the ascending-torus criterion. Section 3 constructs the ring and the encoded actions. Section 4 constructs $Lambda arrow.cw.half S$ and proves the stabilizer theorem. Section 5 applies the twisted Brin–Thompson theorem and proves Theorem 1.

All rings used for matrices are unital and associative. Ring embeddings and endomorphisms need not preserve the identity when this is expressly stated. All homology is integral. Group actions are on the left; coefficient modules for group homology are right modules.

== 2 A homological device for ascending tori <sec:homological>

An ascending torus will have type $F_oo$ for two distinct reasons. Factoring its defining endomorphism through a finitely presented group provides finite presentation. Two finite systems of commuting splittings then give the higher-dimensional finiteness: one system annihilates the relevant homology classes by $2$, and the other annihilates the same classes by $3$. The factorization also starts this second argument, by placing the image of the endomorphism in a finitely generated subgroup.

We first construct the finite systems of idempotents that index the splittings. The resulting criterion is Theorem 3. Its proof must control a finite set of simplex types uniformly over all cycles; it will impose no bound on chain lengths or coefficients.

=== 2.1 Two finite systems of idempotents <two-finite-systems-of-idempotents>

For $ell in { 2 \, 3 }$, let $D_ell$ be the unital $bb(F)_ell$-algebra of operators generated by $l_0 \, l_1 \, r_0 \, r_1$ on the free vector space with basis ${ 0 \, 1 }^(bb(N))$. The operator $l_i$ prefixes $i$, whereas $r_i$ deletes an initial $i$ and sends every other basis vector to zero. Thus

#[#set math.equation(numbering: n => "(2.1)")
 $ r_i l_j = delta_(i j) 1 \, #h(2em) l_0 r_0 + l_1 r_1 = 1 . $ <eq:binary-prefix-relations>]

For a finite binary word $v$, write $l_v$ for prefixing $v$, write $r_v$ for deleting $v$, and put $E_v = l_v r_v$.

Every product of these operators is zero or a prefix replacement $l_v r_w$. Equality of finite linear combinations of prefix replacements is decidable. Indeed, choose $m$ at least as large as every domain prefix length and expand each term by

$ l_v r_w = sum_(\| a \| = m - \| w \|) l_(v a) r_(w a) . $

Collect terms with the same domain prefix and the same output prefix. For a fixed domain prefix, distinct output prefixes give distinct outputs on an input whose remaining tail is not eventually periodic. To see this, equality of two such outputs with different prefixes would make the shorter prefix a prefix of the longer and would force the remaining tail to be periodic. The collected coefficients therefore all vanish if and only if the operator vanishes. This is a finite test over $bb(F)_ell$.

Put

$ A = E_00 \, quad B' = E_01 \, quad C' = E_1 \, #h(2em) A_0 = E_000 \, quad A_1 = E_001 . $

For each of the three prefix-free lists

$ \( 00 \, 01 \, 1 \) \, #h(2em) \( 000 \, 01 \, 1 \) \, #h(2em) \( 001 \, 01 \, 1 \) \, $

the operators $l_v r_w$ form matrix units for a copy of $M_3 \( bb(F)_ell \)$ in $D_ell$. Only the first of these copies has identity $1$. Let $cal(P)_ell$ be the union of their sets of idempotents, together with $I = 1$. This is a finite, explicitly specified set. In the following statement, orthogonal means $E P = P E = 0$.

#thm([Lemma 2.1.])[
  #emph[Let $T$ be an abelian group, and suppose that elements $z_E in T$, indexed by $E in cal(P)_ell$, satisfy 
#[#set math.equation(numbering: n => "(2.2)")
 $ z_(E + P) = z_E + z_P $ <eq:idempotent-additivity>]

 whenever $E \, P \, E + P in cal(P)_ell$ and $E \, P$ are orthogonal. Then $ell z_I = 0$.]
] <lem:idempotents>

#proof[
  Within a rank-three matrix algebra, we will show that the $ell$-multiples attached to its diagonal units agree. The overlapping corners then identify these multiples for $A \, A_0 \, A_1 \, B' \, C'$, and the split $A = A_0 + A_1$ forces their common value to vanish.
  First work in any one of the three matrix algebras. For a column vector $u$ and a row covector $lambda$ with $lambda u = 1$, write $x \( u \, lambda \) = z_(u lambda)$. Fix $v eq.not 0$ in $ker lambda$. We claim that
  $ x \( u + v \, lambda \) - x \( u \, lambda \) $
  is independent of the choice of $u$ with $lambda u = 1$.
  Suppose first that $u' - u$ and $v$ are linearly independent. The vectors $u \, u' - u \, v$ then form a basis, so there is a covector $mu$ with
  $ mu u = mu u' = 0 \, #h(2em) mu v = 1 . $
  The identity
  $ u lambda + v mu = \( u + v \) lambda + v \( mu - lambda \) $
  expresses the same rank-two idempotent in two ways as a sum of orthogonal rank-one idempotents. Applying (2.2) gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ x \( u + v \, lambda \) - x \( u \, lambda \) = x \( v \, mu \) - x \( v \, mu - lambda \) . $ <eq:rank-one-difference>]
  The same calculation for $u'$ gives the same difference. If instead $u' - u$ belongs to the span of $v$, choose $w in ker lambda \\ chevron.l v chevron.r$ and set $u'' = u + w$. Both $u'' - u$ and $u'' - u'$ are independent of $v$, so comparison through $u''$ proves the claim. This argument also applies over $bb(F)_2$.
  Apply the claim successively at $u \, u + v \, dots.h \, u + \( ell - 1 \) v$. The resulting differences are equal, and their sum is zero. Hence
  $ ell x \( u + v \, lambda \) = ell x \( u \, lambda \) . $
  Transposing the argument shows that the $ell$-multiple is also unchanged when the covector is varied with the vector fixed and its value still equal to one. For two different basis vectors $e_i \, e_j$, take $lambda = e_i^(*) + e_j^(*)$. Change the covector at $e_i$, change the vector from $e_i$ to $e_j$, and then change the covector at $e_j$. It follows that the $ell$-multiples of all three diagonal units agree.
  The overlaps among our three matrix algebras now give
  $ ell z_A = ell z_(B') = ell z_(C') = ell z_(A_0) = ell z_(A_1) . $
  Call their common value $q$. Since $A = A_0 + A_1$, relation (2.2) gives $q = 2 q$, and therefore $q = 0$. Finally, $I = \( A + B' \) + C'$, with $A + B'$ an idempotent in the first matrix algebra. Two applications of the same relation yield $ell z_I = 0$. ◻
]

=== 2.2 The ascending-torus theorem <the-ascending-torus-theorem>

For a group $U$ and an endomorphism $f : U arrow.r U$, write

$ T \( U \, f \) = chevron.l U \, t divides t^(- 1) u t = f \( u \) med \( u in U \) chevron.r . $

Here the notation includes all relations already holding in $U$.

#thm([Theorem 2.2.])[
  #emph[Let $f : U arrow.r U$ be an injective endomorphism. Assume the following.]
  + #emph[There are a finitely presented group $P$ and homomorphisms $a : U arrow.r P$, $b : P arrow.r U$ with $f = b a$.]
  + #emph[For each $ell in { 2 \, 3 }$ there are homomorphisms $h_E : U arrow.r U$, indexed by $E in cal(P)_ell$, such that $h_I = f$. Whenever $E \, P' \, E + P' in cal(P)_ell$ and $E P' = P' E = 0$, the subgroups $h_E \( U \)$ and $h_(P') \( U \)$ commute elementwise, and 
$ h_(E + P') \( u \) = h_E \( u \) h_(P') \( u \) #h(2em) \( u in U \) . $

]
  #emph[Then $T \( U \, f \)$ is of type $F_oo$.]
] <thm:torus>

We first establish finite presentation. A product-module criterion then reduces the remaining assertion to a precise homology-vanishing statement. Uniformly controlled fillings will supply that vanishing through the homology sequence of the ascending torus.

#thm([Lemma 2.3.])[
  #emph[Under assumption (i) of Theorem 3, the group $T \( U \, f \)$ is finitely presented. This assertion does not require $f$ to be injective.]
] <lem:torus-presentation>

#proof[
  Set $g = a b : P arrow.r P$, and let $s$ be the stable letter of $T \( P \, g \)$. There is a homomorphism
  $ T \( U \, f \) arrow.r T \( P \, g \) \, #h(2em) u mapsto a \( u \) \, quad t mapsto s . $
  An inverse sends $p in P$ to $t b \( p \) t^(- 1)$ and sends $s$ to $t$. The defining conjugation relations verify that these are homomorphisms; their composites are the identity because $t f \( u \) t^(- 1) = u$ and $s g \( p \) s^(- 1) = p$. This is the algebraic interleaving of the two direct systems. No injectivity of $g$ is needed. Finally, a finite presentation of $P$, together with $s$ and its conjugation relations on a finite generating set of $P$, is a finite presentation of $T \( P \, g \)$. ◻
]

=== 2.3 A product-module criterion <a-product-module-criterion>

The product-module test below is a form of the Bieri–Eckmann finiteness criterion #cite(label("BieriEckmann1974")) Proposition 1.2. For the cellular passage from homological to geometric finiteness, see also Brown #cite(label("Brown1975")) Section 3. We give the argument for the now finitely presented group $J = T \( U \, f \)$: vanishing with products of regular modules will yield finite skeleta of a classifying space.

All group homology below has integral coefficients, and coefficient modules are right modules. For a group $J$ and a set $cal(I)$, the notation $\( bb(Z) J \)^(cal(I))$ means the direct product, not the direct sum, with its coordinatewise right action.

#thm([Lemma 2.4.])[
  #emph[Suppose that $J$ is finitely presented and that 
$ H_n #scale(x: 120%, y: 120%)[\(] J \, \( bb(Z) J \)^(cal(I)) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( n gt.eq 2 \) $

 for every set $cal(I)$. Then $J$ is of type $F_oo$.]
] <lem:product-criterion>

#proof[
  Start with a finite presentation complex and its simply connected universal cover. Inductively, suppose we have a connected CW complex with fundamental group $J$, finite $n$-skeleton, and $\( n - 1 \)$-connected universal cover, where $n gt.eq 2$. Its universal-cover $n$-skeleton will be denoted by $Z$. Attach cells of dimensions at least $n + 1$, without a finiteness requirement, to obtain a contractible free $J$-complex $tilde(Z)$. This can be done successively by killing homotopy groups. Its augmented cellular chain complex is a free resolution over $R = bb(Z) J$, and its modules $C_i$ are finitely generated for $i lt.eq n$.
  Let $cal(I)$ be the set of all cellular $n$-cycles in $Z$, and put $M = R^(cal(I))$. For every finite-rank free left $R$-module $C$, the coordinate map gives an isomorphism
  #[#set math.equation(numbering: n => "(2.4)")
   $ M ⊗_R C med arrow.r med C^(cal(I)) \, #h(2em) \( m_i \)_(i in cal(I)) ⊗ c mapsto \( m_i c \)_(i in cal(I)) . $ <eq:finite-rank-product-tensor>]
  Using this in degrees $n$ and $n - 1$, the family whose coordinate indexed by a cycle $z$ is $z$ itself defines a cycle in $M ⊗_R C_n$. By hypothesis, it is the boundary of some $y in M ⊗_R C_(n + 1)$.
  Choose an $R$-basis for $C_(n + 1)$. Although that basis can be infinite, the tensor $y$ uses only finitely many of its elements, say $c_1 \, dots.h \, c_s$. Taking coordinates of its boundary equation shows that every $n$-cycle is an $R$-linear combination of $partial c_1 \, dots.h \, partial c_s$. Thus the $R$-module of $n$-cycles in $Z$ is finitely generated. This argument does not assume that $C_(n + 1)$ has finite rank.
  Since $Z$ is $\( n - 1 \)$-connected, the natural Hurewicz isomorphism #cite(label("Hatcher2002")) Theorem 4.37 identifies $pi_n \( Z \)$ with $H_n \( Z \; bb(Z) \)$. There are no $\( n + 1 \)$-cells in $Z$, so the latter group is precisely its group of cellular $n$-cycles. Choose spheres representing the finite list of module generators and attach their $J$-translates. Downstairs, this attaches finitely many $\( n + 1 \)$-cells; upstairs, it produces an $n$-connected universal cover. Induction gives a complex with finitely many cells in each dimension whose universal cover is weakly contractible. That cover is a CW complex, so it is contractible by Whitehead’s theorem #cite(label("Hatcher2002")) Theorem 4.5. The resulting complex is the required $K \( J \, 1 \)$. ◻
]

For $J = T \( U \, f \)$, finite presentation is already available. It therefore remains to prove

$ H_n #scale(x: 120%, y: 120%)[\(] J \, \( bb(Z) J \)^(cal(I)) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( n gt.eq 2 \) $

for every set $cal(I)$. A tensor chain with these coefficients may have arbitrarily large supports in its separate coordinates. The next argument retains the finite set of simplex types shared by all coordinates; this is the control needed to fill such chains.

=== 2.4 Uniformly bounded simplex types <uniformly-bounded-simplex-types>

Let $cal(E) \( U \)$ be the simplicial set whose $q$-simplices are tuples $\( u_0 \, dots.h \, u_q \)$ of elements of $U$. Faces delete entries and degeneracies repeat entries. Its normalized integral chain complex is denoted by $C_(*) \( U \)$. Thus tuples with consecutive equal entries are zero, and the boundary is the alternating sum of faces. The augmentation sends each vertex to $1$. Simultaneous left translation gives a free $U$-action. Its augmented chain complex is contractible as a complex of abelian groups: prepending the identity gives a contraction. Consequently its augmented chain complex is a free resolution of the trivial left $bb(Z) U$-module.

For a finite symmetric set $A subset.eq U$ containing $1$, let $cal(E)_A \( U \)$ consist of the tuples satisfying

$ u_i^(- 1) u_j in A #h(2em) upright("for all ") i \, j \, $

and write $C_(*)^A \( U \)$ for its normalized chains. This is a simplicial subset. We call $A$ a #emph[bound]. A chain operator is controlled on a given input bound if all its output chains lie in $C_(*)^(A') \( U \)$ for some finite output bound $A'$ in each of the degrees under consideration. There is no restriction on the number of terms in an individual output chain.

For each fixed degree $q$, $C_q^A \( U \)$ has only finitely many basis elements up to left translation: translate the first vertex to $1$, after which every other vertex belongs to $A$. We refer to these orbits as simplex types. Every homomorphism of groups sends a finite bound to a finite bound. Unions of finitely many bounds may always be replaced by one finite symmetric bound containing $1$.

Coning at $1$ fills every reduced cycle in the full complex $C_(*) \( U \)$. It does not, however, preserve a common finite bound: on a simplex with vertex $u$, it introduces the difference $u$ itself. This becomes an obstruction when the same bound must work for all translates and all cycles of $C_(*)^A \( U \)$. We instead construct fillings after an iterate of $f$, using bounds independent of the individual cycle.

The first step is a controlled additivity calculation in integral chain complexes. Its partial homotopy need not be $U$-equivariant. Later we assemble these ordinary fillings into fillings with product coefficients. We will not tensor the chosen homotopy over $bb(Z) U$.

#thm([Lemma 2.5.])[
  #emph[Fix $n gt.eq 1$ and a bound $A$. Suppose that a power $f^k$ induces a chain map $F : C_(*)^A \( U \) arrow.r C_(*) \( U \)$ admitting a controlled chain homotopy to the constant map at $1$ through degrees less than $n$. Let $h_1 \, h_2 : U arrow.r U$ have elementwise commuting images, and put $h \( u \) = h_1 \( u \) h_2 \( u \)$. There is a finite bound $B$ such that every $n$-cycle $z in C_n^A \( U \)$ satisfies 
$ \[ \( h f^k \)_(*) z \] = \[ \( h_1 f^k \)_(*) z \] + \[ \( h_2 f^k \)_(*) z \] quad upright("in ") H_n \( C_(*)^B \( U \) \) . $

 The same output bound may be chosen for any fixed finite collection of such pairs of maps.]
] <lem:controlled-additivity>

#proof[
  Let $H_q$ be the given homotopy operators for $0 lt.eq q < n$, and set $H_q = 0$ in all other nonnegative degrees. The chain map
  $ F' = F - partial H - H partial $
  is constant at the identity in degree zero and zero in degrees $1 \, dots.h \, n - 1$. Since $H_n = 0$, it satisfies $F' z = F z$ for every $n$-cycle $z$. Choose a common bound for $F$, $F'$, and the finitely many operators $H_q$ used here.
  The diagonal argument below eliminates mixed product terms using lower-degree vanishing. The same mechanism appears in the diagonal-and-Künneth induction for mitotic groups #cite(label("BDH1980")) Proposition 4.1. Here we need an integral chain calculation retaining a common finite bound. We use the classical Alexander–Whitney and shuffle comparison of product and tensor chain complexes #cite(label("EilenbergZilber1953")), recording the formulas and their support control. Define the diagonal tensor-chain map by
  #[#set math.equation(numbering: n => "(2.5)")
   $ D \( u_0 \, dots.h \, u_q \) = sum_(i = 0)^q \( u_0 \, dots.h \, u_i \) ⊗ \( u_i \, dots.h \, u_q \) . $ <eq:aw-diagonal>]
  The tensor differential has the convention $partial \( c ⊗ d \) = partial c ⊗ d + \( - 1 \)^(deg c) c ⊗ partial d$. The terms at the two sides of each interior cut cancel, showing that $D$ is a chain map. Formula (2.5) descends to normalized chains.
  The shuffle map $S$ sends a tensor $\( u_0 \, dots.h \, u_p \) ⊗ \( v_0 \, dots.h \, v_q \)$ to the signed sum of the chains in $U times U$ obtained by following all monotone lattice paths from $\( 0 \, 0 \)$ to $\( p \, q \)$ and replacing a lattice point $\( i \, j \)$ by $\( u_i \, v_j \)$. Its sign is $\( - 1 \)^N$, where $N$ counts pairs in which a vertical step precedes a horizontal step. Deleting a corner of a path cancels with the path traversing that corner in the other order; the remaining faces are exactly the tensor differential. Hence $S$ is a chain map, also on normalized chains. Both $D$ and $S$ preserve the bound in each coordinate.
  Let $Delta$ be the chain map induced by $u mapsto \( u \, u \)$. There is a controlled chain homotopy between $Delta$ and $S D$. Here is a direct construction. For a basis simplex $c$ with vertex set $V$, both maps are supported on the full tuple complex on $V times V$. Construct a homotopy $R$ inductively on degree. In degree zero the two maps agree, so take $R_0 = 0$. Having defined it on faces, the chain
  $ Delta c - S D c - R partial c $
  is a cycle supported on that same tuple complex. It bounds there by prepending the vertex $\( u_0 \, u_0 \)$, where $u_0$ is the first vertex of $c$. Choose this cone for $R \( c \)$ and extend on the normalized basis. Every coordinate vertex used is a vertex of $c$, so $R$ preserves the bound in both coordinates. This proves the needed homotopy without any assumption about chain lengths.
  Write $f^k times f^k : U times U arrow.r U times U$ for the product homomorphism. On the input complex,
  $ Delta F = \( f^k times f^k \)_(*) Delta tilde.eq \( f^k times f^k \)_(*) S D = S \( F ⊗ F \) D . $
  The homotopy is $\( f^k times f^k \)_(*) R$ from the preceding construction; the last equality is naturality of the shuffle. Thus it is controlled on the input bound. Next, the usual signed tensor operator
  $ H ⊗ F + F' ⊗ H $
  is a homotopy between $F ⊗ F$ and $F' ⊗ F'$. In the second summand the value on $c ⊗ d$ includes the sign $\( - 1 \)^(deg c)$. Indeed its homotopy boundary is
  $ \( F - F' \) ⊗ F + F' ⊗ \( F - F' \) = F ⊗ F - F' ⊗ F' . $
  All chains involved have finite bounds separately in the two coordinates, because this calculation uses only the already controlled operators.
  For an $n$-cycle $z$, applying $F' ⊗ F'$ to $D z$ leaves only bidegrees $\( 0 \, n \)$ and $\( n \, 0 \)$. The result is
  $ \( 1 \) ⊗ F' z + F' z ⊗ \( 1 \) = \( 1 \) ⊗ F z + F z ⊗ \( 1 \) . $
  Shuffling a vertex against a chain merely holds that coordinate fixed. Finally apply the homomorphism
  $ U times U arrow.r U \, #h(2em) \( u \, v \) mapsto h_1 \( u \) h_2 \( v \) . $
  It is a homomorphism because the two images commute elementwise. For coordinate bounds $B_1 \, B_2$, a difference in its image belongs to the finite set $h_1 \( B_1 \) h_2 \( B_2 \)$. Thus all preceding homotopies remain controlled after this map. Their two surviving terms give the asserted identity. Taking a union of output bounds proves the last assertion. ◻
]

#thm([Proposition 2.6.])[
  #emph[Under the assumptions of Theorem 3, for every finite bound $A$ and every $n gt.eq 0$ there are an integer $k gt.eq 0$ and a finite bound $B$ such that $f^k$ sends every reduced integral $n$-cycle of $C_(*)^A \( U \)$ to a boundary in $C_(*)^B \( U \)$.]
] <prop:uniform-fillings>

#proof[
  The word “reduced” matters only in degree zero. The subgroup $b \( P \)$ is finitely generated and contains $f \( U \)$. Choose a finite symmetric generating set for $b \( P \)$. Every vertex $f \( u \)$ can be joined to $1$ by a finite edge path whose differences belong to that set. Consequently every reduced zero-cycle is filled after applying $f$, with a bound independent of the cycle. This proves the base case. Notice that the paths need not have uniformly bounded lengths.
  Suppose that the proposition is known in degrees less than $n$, where $n gt.eq 1$. We first obtain the controlled partial homotopy required by Lemma 6. Begin with the map induced by $f$ and choose the vertex paths just described for its degree-zero homotopy to the constant map. Suppose more generally that a power of $f$ and its homotopy have been constructed through degree $q - 1$, with $1 lt.eq q < n$. For every normalized $q$-simplex $c$, the missing boundary equation for its homotopy value has right side
  $ F \( c \) - H \( partial c \) \, $
  where $F$ is the current chain map. For $q gt.eq 1$ this is a cycle: apply the already established homotopy equation to $partial c$. All these cycles, for all basis simplices $c$, have a common finite bound. The inductive assertion in degree $q$ supplies one further power of $f$ that sends all of them to boundaries at a common bound. Apply that power also to the previously constructed map and homotopy, then choose a finite filling for each of these boundary equations. Extending on the normalized basis defines $H_q$ with the required control. For $n = 1$ only the initial vertex homotopy is needed.
  After finitely many such steps, the map induced by some power $f^k$ has a controlled chain homotopy to the constant map through degrees less than $n$. The homotopy is not asserted to be $U$-equivariant. The same exponent works on all basis simplices because at each step the induction assertion applies to every cycle in one bounded complex.
  Apply Lemma 6 to every orthogonal relation in both finite idempotent systems, enlarging the output bound once to cover all of them. For a fixed $n$-cycle $z$, set
  $ z_E = \[ \( h_E f^k \)_(*) z \] $
  in the homology of this single bounded output complex. These classes satisfy all relations of Lemma 2. The identity class is the same in both systems, namely
  $ z_I = \[ \( f^(k + 1) \)_(*) z \] . $
  It is annihilated by both $2$ and $3$, and hence is zero. The bound and exponent were chosen before $z$, so the conclusion is uniform over all cycles of the input bound. This completes the induction. ◻
]

=== 2.5 Products of regular modules and the HNN sequence <products-of-regular-modules-and-the-hnn-sequence>

We now complete the proof of Theorem 3. Put $J = T \( U \, f \)$. Since $f$ is injective, the direct limit of the system $U arrow.r^f U arrow.r^f dots.h.c$ is an increasing union of copies of $U$. Its stage shift is an automorphism, and adjoining that automorphism gives $J$. Explicitly, its $i$th copy maps into $J$ by $u mapsto t^i u t^(- i)$; these maps give the inverse to the direct-limit description. In particular $U$ embeds in $J$, and every element of $J$ has the form $t^p u t^(- q)$ with $p \, q gt.eq 0$.

There is a $J$-tree with vertices the left cosets $j U$ and one edge indexed by $j U$ from $j U$ to $j t U$. The second endpoint is independent of the representative because $u t = t f \( u \)$. Every vertex has one outgoing edge, and its height increases by one. The normal form just given shows that every forward ray eventually meets the ray from $U$. Thus the graph is connected. An undirected cycle would have a vertex of least height with two outgoing edges, which is impossible. It is therefore a tree, with one vertex orbit and one edge orbit, both having stabilizer $U$.

For any right $bb(Z) J$-module $M$, the tree gives the long exact homology sequence containing

#[#set math.equation(numbering: n => "(2.6)")
 $ H_n \( U \, M \) & arrow.r^(thin 1 - F thin) H_n \( U \, M \) arrow.r H_n \( J \, M \)\
 & arrow.r H_(n - 1) \( U \, M \) arrow.r^(thin 1 - F thin) H_(n - 1) \( U \, M \) . $ <eq:ascending-hnn-homology>]

We specify the chain map and a construction of this sequence. Induce the homogeneous resolution to obtain $P_(*) = bb(Z) J ⊗_(bb(Z) U) C_(*) \( U \)$. On it, the second endpoint map is

$ j ⊗ c mapsto j t ⊗ f_(*) \( c \) . $

It is well defined, again because $u t = t f \( u \)$. The mapping cone of the difference of the two endpoint maps resolves $bb(Z)$: first taking homology of the induced resolutions recovers the augmented cellular chains of the tree, which are exact. Tensoring that cone with $M$ gives (2.6). In the resulting complex $M ⊗_(bb(Z) U) C_(*) \( U \)$, its map $F$ is

#[#set math.equation(numbering: n => "(2.7)")
 $ F \( m ⊗ c \) = m t ⊗ f_(*) \( c \) . $ <eq:coefficient-shift>]

Take now $M = \( bb(Z) J \)^(cal(I))$ for an arbitrary set $cal(I)$. We claim that $F$ is locally nilpotent on $H_i \( U \, M \)$ for every $i > 0$. To interpret chains, let $cal(S)_q \( A \)$ be the finite set of normalized $q$-simplex types with bound $A$. The freeness of these types gives

#[#set math.equation(numbering: n => "(2.8)")
 $ M ⊗_(bb(Z) U) C_q^A \( U \) & tilde.equiv xor.big_(s in cal(S)_q \( A \)) M\
 & tilde.equiv product_(alpha in cal(I)) (xor.big_(s in cal(S)_q \( A \)) bb(Z) J) . $ <eq:bounded-product-chains>]

The second isomorphism uses finiteness of $cal(S)_q \( A \)$.

Every tensor chain involves finitely many simplex types, so lies in such a bounded complex. In each coordinate $alpha$, expand its $bb(Z) J$ coefficients. The result is a finite ordinary chain in tuples contained in left cosets $j U$, with all within-coset differences in one bound $A$ independent of $alpha$. Conversely, any family of such chains, finite in each coordinate and sharing one bound, defines a tensor chain by (2.8). The number of terms and the coefficient supports may vary without bound as $alpha$ varies.

Let a positive-degree tensor cycle represent a class in $H_i \( U \, M \)$. In each coordinate its chain splits into finitely many coset chains, and each is a cycle, because the boundary preserves the coset. Choose an origin $j$ for each coset. Formula (2.7) shows that $F^k$ changes that origin to $j t^k$ and applies $f^k$ to the relative vertices in $U$. Proposition 7 provides one exponent $k$ and one output bound for all these cycles. Choose a finite filling in each coordinate and each of its finitely many cosets. Their sum remains finite in that coordinate. Even if several input cosets have the same output coset, their fillings may simply be added. All coordinates still use one common finite set of output simplex types, so their family is a tensor chain by (2.8). It bounds $F^k$ of the original cycle. This proves local nilpotence.

For a locally nilpotent endomorphism, $1 - F$ is invertible: its inverse on any element is the finite geometric sum $1 + F + F^2 + dots.h.c$ evaluated on that element. The sequence (2.6) therefore gives

$ H_n #scale(x: 120%, y: 120%)[\(] J \, \( bb(Z) J \)^(cal(I)) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) \( n gt.eq 2 \) . $

No claim about local nilpotence on $H_0$ is needed. By Lemma 4, $J$ is finitely presented. Lemma 5 now proves that it is of type $F_oo$, completing the proof of Theorem 3.

=== 2.6 Finite extensions <finite-extensions>

The final passage from pointwise to setwise stabilizers will use the following closure property. Its proof reuses the product-module argument above.

#thm([Lemma 2.7.])[
  #emph[If $K$ is a normal subgroup of finite index in $L$ and $K$ has type $F_oo$, then $L$ has type $F_oo$.]
] <lem:finite-extension>

#proof[
  First $L$ is finitely presented. Indeed, choose a finite presentation of $K$ and representatives of the finite quotient $L \/ K$. Add the representatives as generators, their conjugation relations on the generators of $K$, and their multiplication relations modulo $K$. These finitely many relations reduce every word to a word in $K$ followed by one representative, and give a presentation of $L$.
  Put $R = bb(Z) L$ and $A = bb(Z) K$. The finite-type classifying space for $K$ gives a free $A$-resolution of $bb(Z)$ that is finitely generated in each degree. Therefore, for every index set $I$,
  $ H_j (K \, product_I A) = 0 #h(2em) \( j > 0 \) : $
  tensoring that resolution with $product_I A$ gives the product of its underlying integral chain complexes. Products of exact sequences of abelian groups are exact.
  We construct a degreewise finitely generated free $R$-resolution of $bb(Z)$. Start with the finite generating set of $L$, which makes the augmentation ideal finitely generated. Suppose a partial finite free resolution has been constructed through degree $n gt.eq 1$, exact below that degree. Its restriction to $A$ is still finite free, because $\[ L : K \]$ is finite. Complete it arbitrarily to a free $R$-resolution and restrict to $A$. Index a product of copies of $A$ by all cycles in degree $n$. As in Lemma 5, this family is one tensor cycle, and the preceding vanishing supplies a boundary using only finitely many basis elements $c_1 \, dots.h \, c_s$ of the next $A$-chain module. For each cycle $z$, its coordinate equation is $z = sum_(i = 1)^s a_i \( z \) partial c_i$, with $a_i \( z \) in A$. Thus these boundaries generate the cycle module over $A$, hence also over $R$; no Noetherian hypothesis is used. This extends the partial resolution by a finite free $R$-module. Induction completes the construction.
  For any product $product_I R$, tensoring this degreewise finite resolution commutes with the product, so $H_j \( L \, product_I R \) = 0$ for $j > 0$. The finite presentation already proved and Lemma 5 now give type $F_oo$. ◻
]

== 3 Encoding the diagrams and their actions <sec:encoding>

The ring needed for the action theorem must encode an action built from its own elementary group $upright(E)_7 \( B \)$ on $B^7$. Starting with one ring and encoding its action in a larger ring would not meet this requirement: the acting group would still come from the original ring. We construct one finitely presented ring $B$ that accommodates this action, the two idempotent diagrams, and a centralizing binary corner.

We first describe the diagrams for an arbitrary acting pair, so the required ring data can be stated precisely. The construction then uses finite codes for ring expressions and action data before their equality algorithms have been proved to terminate. A calculation on a code word of length $n$ will call the prospective normalizer only on words of strictly smaller length. Induction on that length will prove these algorithms total and justify the required ring data.

=== 3.1 Two enlargements of an acting pair <two-enlargements-of-an-acting-pair>

Let a group $V$ act on a set $Z$, and let $ell in { 2 \, 3 }$. Use the prefix algebra $D_ell$ and finite collection $cal(P)_ell$ of Lemma 2. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ j_E \( g \) = \( 1 - E \) ⊗ 1 + E ⊗ g quad \( g in V \, med E in cal(P)_ell \) $ <eq:enlargement-map>]

in $D_ell ⊗_(bb(F)_ell) bb(F)_ell \[ V \]$, and let $cal(W)_ell \( V \)$ be the subgroup of units generated by these elements. It acts on

$ cal(Y)_ell \( Z \) = D_ell^(\( Z \)) \, $

the set of finitely supported arrays with entries in $D_ell$: $d ⊗ g$ multiplies coefficients on the left by $d$ and sends index $z$ to $g z$. Write $upright(bold(e))_z$ for the unit basis entry.

#thm([Lemma 3.1.])[
  #emph[Each $j_E$ is a homomorphism. The map $j_I$ is injective, and together with $z mapsto upright(bold(e))_z$ it embeds the acting pair. For every indicated orthogonal sum $E + P$ in $cal(P)_ell$, the images of $j_E$ and $j_P$ commute elementwise and 
$ j_(E + P) \( g \) = j_E \( g \) j_P \( g \) . $

 If $g z = z$, then $j_E \( g \) upright(bold(e))_z = upright(bold(e))_z$ for every $E$.]
] <lem:enlargement>

#proof[
  Orthogonality of the two summands in Equation (3.1) gives $j_E \( g \) j_E \( h \) = j_E \( g h \)$ and inverse $j_E \( g^(- 1) \)$. If $E P = P E = 0$, direct multiplication gives the claimed commuting product. Since $D_ell$ is nonzero, the elements $1 ⊗ g$ for distinct $g$ are distinct group-basis elements. The action assertions follow from
  $ j_E \( g \) upright(bold(e))_z = \( 1 - E \) upright(bold(e))_z + E upright(bold(e))_(g z) . $
  ◻
]

For a unital $bb(F)_2$-algebra $B$, put $Q = upright(E)_7 \( B \)$ and $X = B^7$, with the usual left action on columns. Apply the enlargement twice:

#[#set math.equation(numbering: n => "(3.2)")
 $ \( W_1 \, Y^(\( 1 \)) \) = #scale(x: 120%, y: 120%)[\(] cal(W)_2 \( Q \) \, cal(Y)_2 \( X \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( W \, Y^(\( 2 \)) \) = #scale(x: 120%, y: 120%)[\(] cal(W)_3 \( W_1 \) \, cal(Y)_3 \( Y^(\( 1 \)) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:two-enlargements>]

Write

$ iota : Q arrow.r W \, #h(2em) iota_X : X arrow.r Y^(\( 2 \)) \, #h(2em) Y = W iota_X \( X \) $

for the full-identity embeddings and the indicated invariant subset. With superscripts indicating the enlargement layer, set

#[#set math.equation(numbering: n => "(3.3)")
 $ j_(2 \, E) = j_I^(\( 3 \)) compose j_E^(\( 2 \)) \, #h(2em) j_(3 \, E) = j_E^(\( 3 \)) compose j_I^(\( 2 \)) . $ <eq:two-diagrams>]

Both full-identity maps are $iota$. Each family satisfies the orthogonal identities, and

#[#set math.equation(numbering: n => "(3.4)")
 $ q x = x quad arrow.r.double quad j_(ell \, E) \( q \) iota_X \( x \) = iota_X \( x \) . $ <eq:diagram-fixed-points>]

The characteristic-three algebra in the second enlargement is used only to define an abstract group. We will embed that group, not its algebra, into the characteristic-two ring.

#thm([Theorem 3.2.])[
  #emph[For every finitely generated group $G$ with decidable word problem, there is a nonzero finitely presented unital $bb(F)_2$-algebra $B$ with the following properties.]
  + #emph[There is an injective nonunital algebra endomorphism $phi.alt : B arrow.r B$. With $p = phi.alt \( 1 \)$ there are $s_0 \, s_1 \, d_0 \, d_1 in p B p$, centralizing $phi.alt \( B \)$, such that 
#[#set math.equation(numbering: n => "(3.5)")
 $ d_i s_j = delta_(i j) p \, #h(2em) s_0 d_0 + s_1 d_1 = p . $ <eq:ring-binary-pairs>]

]
  + #emph[Form $Q \, X \, W \, Y \, iota \, iota_X$ and $j_(ell \, E)$ as above. There is a nonzero idempotent $e in B$ such that $G$ and $W$ embed in $\( e B e \)^times$. There are $S_y \, T_y in e B e$, for all $y in Y$, with 
#[#set math.equation(numbering: n => "(3.6)")
 $ T_y S_z = delta_(y z) e \, #h(2em) w S_y = S_(w y) \, #h(2em) T_y w = T_(w^(- 1) y) . $ <eq:ring-prefix-data>]

 Here $w$ denotes its corner-unit image.]
  #emph[The two diagrams have common full-identity map $iota$ and satisfy Equation (3.4).]
] <thm:ring-data>

The construction has four steps. We first recall the compiler and binary-corner results that we use. We then describe a monoid encoding a group action and give finite codes for the prospective ring and action data. A length induction proves that the resulting self-referential normalizer is total and consistent in contexts. Finally, contracted monoid algebras turn the codes into the required ring embeddings and corner relations.

=== 3.2 The bounded compiler and the auxiliary monoid <the-bounded-compiler-and-the-auxiliary-monoid>

We use the following established form of the finite compiler #cite(label("FoundationsCompanion")) Lemma 7.1, Bounded Compiler Lemma. Its bounded contextual conclusion is essential.

#thm([Lemma 3.3.])[
  (Bounded compiler).  #emph[Fix a sufficiently large finite alphabet $Sigma$ containing the distinguished letters of the compiler. From an index $eta$ for a partial function $f_eta : Sigma^(*) harpoon.rt Sigma^(*)$ one can compute a finite monoid presentation $K_eta$, with alphabet $cal(A)_eta$ and zero letter $Omega$, and an additive nonnegative integral word grade $gamma : cal(A)_eta^(*) arrow.r bb(Z)_(gt.eq 0)$. Letter grades are at most two, and $gamma \( Omega \) = 0$.]
  #emph[There is a partial algorithm $N_eta : cal(A)_eta^(*) harpoon.rt cal(A)_eta^(*)$, independent of any budget, with the following property. Suppose that, for some $m gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ & f_eta \( u \) upright(" is defined and ") \| f_eta \( u \) \| lt.eq \| u \| &  & \( \| u \| lt.eq m \) \,\
 & f_eta \( a f_eta \( u \) b \) = f_eta \( a u b \) &  & \( \| a u b \| lt.eq m \) . $ <eq:compiler-budget-total>]

 Then $N_eta$ terminates through grade $m$. Each such input is connected to its literal output by a defining-equation derivation that never raises grade. A contextual defining-equation step preserves the output if both endpoints have grade at most $m$. Consequently, 
#[#set math.equation(numbering: n => "(3.8)")
 $ N_eta \( u \) = N_eta \( v \) med arrow.r.double med N_eta \( a u b \) = N_eta \( a v b \) quad upright("if ") gamma \( a u b \) \, gamma \( a v b \) lt.eq m . $ <eq:compiler-context>]

 Unconditionally, $N_eta$ fixes the empty word and $Omega$, sends every word containing $Omega$ to $Omega$, and fixes a specified literal word $"raw" \( u \)$ for every $u in Sigma^(*)$. The raw words are mutually distinct and distinct from the empty word and $Omega$. If the hypotheses hold at every $m$, then $N_eta$ decides equality in $K_eta$ and 
#[#set math.equation(numbering: n => "(3.9)")
 $ N_eta #scale(x: 120%, y: 120%)[\(] "raw" \( u \) "raw" \( v \) #scale(x: 120%, y: 120%)[\)] = "raw" #scale(x: 120%, y: 120%)[\(] f_eta \( u v \) #scale(x: 120%, y: 120%)[\)] . $ <eq:compiler-raw-product>]

 The presentation is computed without evaluating $f_eta$. Apart from finite computations, $N_eta$ calls $f_eta$ only on inputs of length at most the grade of its own input.]
] <lem:compiler>

Fix also the monoid $cal(D)$ of partial maps of $bb(Q)$ generated by the full affine maps

$ u \( x \) = x \/ 2 \, #h(2em) v \( x \) = \( x + 1 \) \/ 2 \, $

their inverses, and the partial identities on $\[ 0 \, oo \) ∩ bb(Q)$ and $\[ 1 \, oo \) ∩ bb(Q)$. Composition applies the right factor first. An element has computable data $\( a \, b \, r \)$, denoting $x mapsto a x + b$ on $\[ r \, oo \) ∩ bb(Q)$, with $a = 2^j$ for $j in bb(Z)$, dyadic $b \, r$, and $r = - oo$ for full domain. These data multiply by

#[#set math.equation(numbering: n => "(3.10)")
 $ \( a \, b \, r \) \( c \, d \, s \) = #scale(x: 120%, y: 120%)[\(] a c \, a d + b \, max { s \, \( r - d \) \/ c } #scale(x: 120%, y: 120%)[\)] . $ <eq:partial-affine-data>]

Every domain is infinite, so equality is equality of these data. This gives an unconditional decision algorithm.

We will use the precise conclusion of the Binary Tail Corner Lemma #cite(label("FoundationsCompanion")) Lemma 6.4 for this same monoid:

#[#set math.equation(numbering: n => "(3.11)")
 $ 0 eq.not q = q^2 in bb(F)_2 \[ cal(D) \] \, #h(2em) s'_i \, d'_i in q bb(F)_2 \[ cal(D) \] q \,\
d'_i s'_j = delta_(i j) q \, #h(2em) s'_0 d'_0 + s'_1 d'_1 = q . $ <eq:external-binary-corner>]

Its $q$ is the difference of the two tail identities, split using the affine maps $u$ and $v$.

=== 3.3 A monoid for an action <a-monoid-for-an-action>

For an acting pair $V arrow.cw.half Z$, define $M \( V \, Z \)$ with absorbing zero, generators $V$ and $sans(s)_z \, sans(t)_z$ for $z in Z$, and relations consisting of group multiplication, zero absorption, and

#[#set math.equation(numbering: n => "(3.12)")
 $ sans(t)_y sans(s)_z = delta_(y z) \, #h(2em) g sans(s)_z = sans(s)_(g z) \, #h(2em) sans(t)_z g = sans(t)_(g^(- 1) z) . $ <eq:action-monoid-relations>]

Here $delta_(y z)$ denotes the monoid identity or zero.

#thm([Lemma 3.4.])[
  #emph[Every nonzero element of $M \( V \, Z \)$ has a unique normal form 
$ sans(s)_(z_1) dots.h.c sans(s)_(z_a) thin g thin sans(t)_(w_1) dots.h.c sans(t)_(w_b) \, #h(2em) a \, b gt.eq 0 \, $

 omitting an identity group label. In particular, $V$ embeds as a group of units.]
] <lem:action-monoid-normal-form>

#proof[
  Multiply adjacent group labels, erase identity labels, and orient Equation (3.12) to the right. Each rule shortens the word. Overlapping group products agree by associativity; overlaps of two group labels with a prefix or deletion agree by the action law. The remaining nonzero overlap is $sans(t)_y g sans(s)_z$. Its two reductions agree because $y = g z$ if and only if $g^(- 1) y = z$. Identity and zero overlaps join immediately. The system is therefore terminating and locally confluent, hence confluent. Its irreducibles are exactly the stated words. ◻
]

=== 3.4 Syntax and costs before totality <syntax-and-costs-before-totality>

For a field $k$ and a monoid $M$ with absorbing zero, write $k_0 \[ M \]$ for its #emph[contracted monoid algebra]: its basis consists of the nonzero elements of $M$, and a monoid product equal to zero is interpreted as algebra zero.

Fix provisionally an arbitrary index $eta$ and its compiler presentation. Polynomial expressions over $bb(F)_2$ are finite sums of monoid words in the presentation letters. Their #emph[cost] is the maximum grade of a monomial, with cost zero for the zero expression. A column expression has the maximum cost of its seven entries. These are syntactic expressions: we do not assume global equality in the prospective contracted algebra $\( bb(F)_2 \)_0 \[ K_eta \]$.

Use three families of generating symbols.

+ A finite symmetric generating alphabet for $G$, evaluated using its word decider. These symbols have cost zero.
+ The presentation alphabet $cal(A)_eta$ and a fixed finite generating alphabet for $cal(D)$. Their prospective values lie in the zero-product monoid
  #[#set math.equation(numbering: n => "(3.13)")
   $ T_eta = #scale(x: 120%, y: 120%)[\(] \( K_eta \\ { Omega } \) times cal(D) #scale(x: 120%, y: 120%)[\)] union.sq { 0 } . $ <eq:zero-product-monoid>]
  Nonzero pairs multiply coordinatewise, with a product having first coordinate $Omega$ replaced by zero. Presentation letters have their compiler grades as costs; the other symbols have cost zero.
+ Root symbols $I + b upright(bold(e))_(i j)$, for $1 lt.eq i eq.not j lt.eq 7$, where $upright(bold(e))_(i j)$ is the matrix unit and $b$ is an arbitrary polynomial expression, and their formal inverses. Carry each root through $j_F^(\( 3 \)) j_E^(\( 2 \))$, with $E in cal(P)_2$ and $F in cal(P)_3$. Also use $sans(s)_x \, sans(t)_x$ for every column expression $x$, indexed by its twice embedded basis entry, and a zero symbol. Costs are those of the root entry or column; zero has cost zero. The prospective evaluation is in $M \( W \, Y \)$.

These alphabets are effectively enumerable from $eta$ without running $N_eta$. Distinct syntactic descriptions may have the same eventual value. The third alphabet generates $M \( W \, Y \)$ once the prospective objects exist: roots generate $Q$, each $j_E$ is a homomorphism, and translating the supplied column symbols gives those indexed by all of $Y = W iota_X \( X \)$.

Encode these symbols by distinct computably decodable words in a fixed finite alphabet $Sigma$, reserving a letter $zeta$ for zero. The families use disjoint alphabets, and none uses $zeta$. Within each family, fix a start marker and a different end marker. Every code in that family begins and ends with these markers, neither of which occurs internally. Binary syntax descriptions with unary padding allow us to require

#[#set math.equation(numbering: n => "(3.14)")
 $ \| "code" \( a \) \| gt.eq 10 "cost" \( a \) + 2 . $ <eq:code-cost>]

Fix a total order on $Sigma$. The #emph[shortlex] order compares words first by length and then lexicographically. Code membership and enumeration of all code concatenations through any specified length require no call to $N_eta$. The cost of a sequence of symbols is the sum of their costs.

=== 3.5 Calculations in a bounded system <calculations-in-a-bounded-system>

The code normalizer will compare expressions and replace them by shorter codes for the same value. A shorter code can have greater symbolic cost. We therefore need equality to survive substitution whenever each resulting expression separately fits the available budget. The following lemma establishes that property without assuming that the prospective ring or groups have global equality algorithms.

#thm([Lemma 3.5.])[
  #emph[Suppose the hypotheses of Lemma 11 hold through length $3 d$, where $d gt.eq 0$. Within any one of the three families, evaluation of any symbol sequence of cost at most $d$, and equality comparison of two such sequences (each separately of cost at most $d$), terminate using compiler calls of grade at most $3 d$. Tested equality respects replacing a subword in a product whenever both whole symbol sequences have cost at most $d$. Tests agree at different valid budgets.]
] <lem:bounded-action-calculus>

#proof[
  Put $m = 3 d$. We first construct bounded algebra, group, and action operations. We then normalize words in the action monoid and prove that equal normal forms can be substituted even when their original representatives have different costs.
  ===== 3.5.1 Bounded algebra and action operations. <bounded-algebra-and-action-operations.>
  For $0 lt.eq b lt.eq m$, form the classes represented by words of grade at most $b$, where equality is literal equality of $N_eta$ outputs. These sets are nested, since equality does not depend on the budget. Products are defined when the summed grades fit $m$. By Equation (3.8), changing representatives preserves a product whenever both resulting grades fit. The nonincreasing normalization derivation puts the output in the ball of the summed grade. Associativity follows by concatenating three representatives within their total budget. The empty and zero classes are distinct, and zero absorbs.
  A class has a minimum represented grade by well-ordering. We use this minimum only in proofs, never as an algorithmic search. Finite $bb(F)_2$-linear combinations of nonzero classes give nested algebra balls. Addition takes the maximum input bound, multiplication the sum. Equality is comparison of basis coefficients after collecting equal $N_eta$ outputs. Distribution and collection preserve products by bounded contextual compatibility.
  For a word in elementary root matrices of cost at most $b$, store both its forward matrix and the matrix of its formal inverse word. Their entries belong to the algebra ball of level $b$. Compare both components. Operations are
  #[#set math.equation(numbering: n => "(3.15)")
   $ \( A \, A^(-) \) \( C \, C^(-) \) = \( A C \, C^(-) A^(-) \) \, #h(2em) \( A \, A^(-) \)^(- 1) = \( A^(-) \, A \) . $ <eq:bounded-matrix-pairs>]
  They respect equality whenever the summed levels fit $m$. This avoids assuming uniqueness of inverses outside the available budget. A word and its formal inverse cancel when their total cost fits, by successively cancelling adjacent root factors; intermediate calculations stay in that total bound. Forward matrices act on columns, with group bound $b$ and column bound $c$ giving bound $b + c$.
  This construction propagates through an enlargement. Expand a group word into a finite array of $D_ell$-coefficients indexed by preceding-level group labels; separately expand the formal inverse. For a word of cost at most $b$, all indices in both arrays have level at most $b$. Compare arrays after collecting equal indices and performing the unconditional arithmetic in $D_ell$. Multiplication convolves arrays and adds bounds, reversing the order in the inverse component as in Equation (3.15).
  The corresponding set ball of level $c$ consists of finite arrays with preceding-level set indices of level at most $c$. An acting array of level $b$ gives an output of level $b + c$, by multiplying coefficients and acting on indices. Expanding a full triple product gives identical arrays in either association if the total input bound is at most $m$. The same expansion proves the action law. The maps $j_E$ and the basis-entry maps propagate generators and points without increasing cost. Formal inverse cancellation follows from $E^2 = E$ and the preceding inverse identities. Repeating this argument gives both enlargement levels. Their level inclusions are injective because equality is literal equality of recursively collected arrays.
  We have now defined products, inverses, and actions at both enlargement levels whenever the total input costs fit $m$. All identities used to define these operations have been checked within that budget. The algorithm retains the original words and polynomials, multiplies by concatenation and finite expansion, and uses $N_eta$ for comparison and collection. Thus these are finite calculations in truncated systems; no complete group is assumed, and no minimum-cost representative is sought.
  ===== 3.5.2 Normal forms for the action monoid. <normal-forms-for-the-action-monoid.>
  Apply the reductions of Lemma 12 to the third family. Every reduction consumes disjoint input data, so the output labels have representations of jointly bounded total cost no greater than the input cost. Associativity and the action law resolve their usual overlaps. For the exceptional overlap $sans(t)_y w sans(s)_z$, let the costs of $y \, w \, z$ be $c \, b \, e$, with $b + c + e lt.eq d$. The equivalence
  #[#set math.equation(numbering: n => "(3.16)")
   $ y = w z quad arrow.l.r.double quad w^(- 1) y = z $ <eq:bounded-inverse-action>]
  uses at most $2 b + e$ or $2 b + c$ when acting back by the inverse or forward element. Both are at most $2 d$, hence within $m$. For example, equality $y = w z$ allows the action on either representative, and $w^(- 1) \( w z \) = z$ by the bounded inverse identity. The converse is the same calculation. Identity and zero overlaps join immediately. Thus the terminating reductions are confluent on inputs of total cost at most $d$, and their normal forms are computed by the finite operations just described.
  ===== 3.5.3 Substitution with unequal costs. <substitution-with-unequal-costs.>
  It remains to prove the contextual assertion. The difficulty is that tested-equal subwords may have different costs, so one cannot charge both representatives to a single calculation. Give each group or point label its minimum represented cost in the truncated system. At every group level, take this minimum only over genuine words in that level’s generators, stored together with their formal inverses. Point labels may instead use ambient array representatives.
  Consider abstract labeled words whose total minimum cost is at most $d$. Each reduction above does not increase that total: the resulting labels have representatives whose joint cost is no larger than that of the labels consumed. The same overlap calculations therefore prove confluence on these abstract words. In particular, the inverse-action overlap still fits $2 d lt.eq m$.
  By the equality test just constructed, two tested-equal subwords have the same normal form. If it is zero, both contextual products reduce to zero. Otherwise it is a list $R$ of prefix labels, group label, and deletion labels. Its total minimum cost is at most the original cost of either subword, since each reduction supplied jointly bounded representatives for its output. Put the subwords in fixed left and right contexts, with each whole word separately of cost at most $d$. Normalize the middle first. Both routes reach the identical abstract word with middle $R$, and this word fits the budget on each route. Its unique normal form is therefore the answer on both sides. No step adds the costs of the old and new equal representatives.
  Minimum-cost point representatives may be ambient array expressions rather than short orbit words. That is sufficient: $R$ is a semantic proof device, and the algorithm never needs to find a code for it or decide membership in an orbit.
  The second family has contextual compatibility directly from Equation (3.8) and the affine data; the first has it from its group law and word decider. Finally all the comparisons use outputs of the same algorithm $N_eta$, not a budget-dependent normalizer. The recursive array comparisons inherit that independence, proving compatibility of budgets. ◻
]

=== 3.6 The self-referential normalizer <the-self-referential-normalizer>

The bounded calculations are now available conditionally. We next construct the word normalizer whose consistency is the condition they require. Its call bounds will make this apparent circularity into an induction on word length.

For $eta$ and a word $w in Sigma^(*)$ of length $n$, define a partial procedure $F \( eta \, w \)$ as follows. Include $a zeta arrow.r zeta$ and $zeta a arrow.r zeta$ for every $a in Sigma$. For every nonempty concatenation $c$ of whole codes from one family with $\| c \| lt.eq n$, evaluate its prospective product. If the value is zero, include $c arrow.r zeta$. Otherwise search all same-family code concatenations of length at most $\| c \|$, also allowing the empty word for identity, and choose the least tested-equal one in shortlex. Include the replacement unless unchanged. The starting word is itself a candidate, so the search is finite whenever its tests terminate.

Reduce $w$ using a fixed deterministic choice of rule and occurrence. Every nontrivial rule decreases shortlex. A zero-valued code has length at least two, so replacement by $zeta$ also shortens. Thus the reduction terminates once its finite table of tests is available. This is uniformly partial computable, including computation of the compiler presentation from its parameter $eta$.

Effective parameterization gives a total computable index transformation $tau \( eta \)$ for $F \( eta \, - \)$. Kleene’s Recursion Theorem supplies an index such that

#[#set math.equation(numbering: n => "(3.17)")
 $ f_eta \( w \) = F \( eta \, w \) $ <eq:encoding-fixed-point>]

as partial functions #cite(label("Kleene38")) § 2, p. 153. Explicitly, if $U$ is universal evaluation, let $d \( a \)$ be an effectively obtained index for $w mapsto U \( U \( a \, a \) \, w \)$. Choose $b$ computing the total index-valued function $a mapsto tau \( d \( a \) \)$. Then $eta = d \( b \)$ satisfies

$ U \( eta \, w \) = U \( U \( b \, b \) \, w \) = U \( tau \( d \( b \) \) \, w \) = F \( eta \, w \) . $

No termination of $F \( eta \, - \)$ is assumed here. Fix this $eta$.

#thm([Lemma 3.6.])[
  #emph[The function $f_eta$ is total and length-nonincreasing. Its rule tables are stable on bounded-length words and confluent on those words. In particular, 
#[#set math.equation(numbering: n => "(3.18)")
 $ f_eta \( a f_eta \( u \) b \) = f_eta \( a u b \) #h(2em) \( a \, u \, b in Sigma^(*) \) . $ <eq:encoding-context-law>]

]
] <lem:encoding-bootstrap>

#proof[
  Induct simultaneously on the input length $n$. For $n = 0$ there are no tests or reductions and the empty word is unchanged. For $n > 0$, put $d = floor.l n \/ 10 floor.r$. Every code string in a table entry or representative search has cost at most $d$ by Equation (3.14). Since
  #[#set math.equation(numbering: n => "(3.19)")
   $ 3 floor.l n \/ 10 floor.r < n \, $ <eq:strict-encoding-dependency>]
  the induction hypothesis supplies the compiler hypotheses through length $3 d$. All tests terminate by Lemma 13. Only finitely many code strings have length at most $n$, even though the symbol alphabet is countable and can contain infinitely many zero-cost symbols. The finite table and its shortlex-decreasing reduction therefore terminate.
  A rule on a fixed code string is determined by the same tests and the same search bound at every larger length. Thus rules with left side of length at most $k$ are unchanged once length $k$ is reached; longer rules cannot act on a word of length at most $k$.
  For local confluence in the length-$n$ ball, disjoint occurrences commute, even when a replacement is empty. Every branch from a word containing $zeta$ retains it and can be absorbed to $zeta$, since code strings avoid that letter. Two overlapping code rules have aligned code boundaries and belong to the same family, by the delimiter conditions. Their union is a whole code concatenation of length at most $n$.
  Either replacement preserves its tested class by Lemma 13. A shorter code representative may have higher symbolic cost. We do not assert otherwise: the old and new unions each separately have length at most $n$, hence cost at most $d$. This is the two-endpoint hypothesis of that lemma.
  For a zero-class union, a branch either introduces $zeta$ and absorbs, or leaves a zero-class code string with a whole-word zero rule. It cannot leave the empty string, since zero and identity are distinct. For a nonzero-class union, let $c_(*)$ be its least representative within the original search bound. A branch gives a same-class string $c_b$ of no greater length. This was an original candidate, so $c_(*) lt.eq c_b$ in shortlex, in particular $\| c_(*) \| lt.eq \| c_b \|$. Thus $c_(*)$ is still the least candidate in the branch’s smaller search bound. Each branch reaches it by its whole-word rule, unless already there. This covers an empty $c_(*)$ and containment overlaps as well.
  The joining steps occur inside the old union before any newly adjacent outside letters are used. Erasing identity codes can therefore expose further redexes but creates no missing local peak. In particular, different-family adjacencies after an erasure do not create an overlapping initial peak.
  Termination and local confluence give confluence by Newman’s Lemma #cite(label("Newman42")). Its well-founded proof applies within the ball: proper descendants have unique normal forms, and a common descendant of two first steps equates their normal forms.
  For $\| a u b \| lt.eq n$, normalize $u$ inside its context first. Stability puts all these rules in the length-$n$ table; length never increases. Confluence proves $f_eta \( a f_eta \( u \) b \) = f_eta \( a u b \)$. The compiler hypotheses now hold through length $n$, completing the induction. ◻
]

=== 3.7 The monoids and the ring <the-monoids-and-the-ring>

The length induction has supplied a total normalizer consistent in every context. We now obtain the two algebra embeddings used to construct $B$ and its self-map. One comes directly from the code families. For the other, the compiler’s raw words preserve monoid multiplication but send the absorbing zero to a nonzero algebra basis element. Subtracting that basis element will give an embedding of the contracted monoid algebra.

Let $L$ be the monoid on $Sigma$ with equations the union of the rule tables. Every word is related to its computed normal form. Conversely, a contextual defining equation preserves that form: choose a length bound containing the equation and both endpoints, and use stability and confluence. Thus equality in $L$ is exactly equality of literal $f_eta$ outputs. Its identity and absorbing zero are the distinct irreducibles $epsilon$ and $zeta$.

Lemma 11 now applies at every grade, giving an equality algorithm for $K = K_eta$ with distinct identity and zero. Set

$ k = bb(F)_2 \, #h(2em) B = k_0 \[ K \] \, #h(2em) A_(*) = k_0 \[ L \] . $

The previously prospective $Q \, X \, W \, Y$ now exist, and the bounded calculations are their genuine evaluations. Paired forward/inverse equality agrees with ordinary group equality, since the formal inverse is now a genuine inverse.

#thm([Lemma 3.7.])[
  #emph[The code families embed $G$, $T_eta$, and $M \( W \, Y \)$ unitally into $L$, preserving zeros in the last two cases. There are injective algebra maps 
#[#set math.equation(numbering: n => "(3.20)")
 $ kappa : B ⊗_k k \[ cal(D) \] arrow.r A_(*) \, #h(2em) i : A_(*) arrow.r B \, $ <eq:encoding-algebra-maps>]

 where $kappa$ is unital and $i$ has a nonzero proper support identity $e = i \( 1 \)$.]
] <lem:encoding-embeddings>

#proof[
  In one family, a least shortlex code representative of a nonzero value is irreducible. An internal code reduction would preserve its value and lower shortlex, while zero and other-family rules cannot occur inside it. Every other representative reduces to it by its whole-word rule. Zero values reduce to $zeta$. Hence values remain distinct. Codes concatenate and the empty identity representative is allowed, giving unital multiplicative embeddings. The embedded groups are units, using also Lemma 12.
  For $h in L$ with normal word $overline(h)$, put
  $ c \( h \) = \[ "raw" \( overline(h) \) \] in K . $
  Distinct normal words give distinct literal raw $N_eta$ outputs, hence distinct elements of $K$ avoiding $1_K$ and $Omega$. Equation (3.9) gives $c \( h \) c \( h' \) = c \( h h' \)$. The identity and zero need not be preserved: $c \( 1_L \) eq.not 1_K$ and $c \( zeta \) eq.not Omega$. They are identity and absorbing zero only within $c \( L \)$.
  For a nonzero basis element $h$ of $A_(*)$, set
  #[#set math.equation(numbering: n => "(3.21)")
   $ i \( h \) = c \( h \) - c \( zeta \) . $ <eq:raw-difference-embedding>]
  Since $c \( h \) c \( zeta \) = c \( zeta \) c \( h \) = c \( zeta \)$ and $c \( zeta \)^2 = c \( zeta \)$,
  $ \( c \( h \) - c \( zeta \) \) \( c \( h' \) - c \( zeta \) \) = c \( h h' \) - c \( zeta \) . $
  If $h h' = zeta$, this is zero as required. Distinct $c \( h \)$ are distinct nonzero basis vectors of $B$. The vectors in Equation (3.21) are therefore linearly independent, proving injectivity. The support identity
  $ e = c \( 1_L \) - c \( zeta \) \, #h(2em) e^2 = e \, $
  is nonzero and is not $1_B$, since neither of its basis vectors is $1_K$.
  Finally nonzero basis pairs identify $B ⊗_k k \[ cal(D) \]$ with $k_0 \[ T_eta \]$. The code embedding of $T_eta$ extends linearly to the required unital injection $kappa$. ◻
]

#thm([Lemma 3.8.])[
  #emph[The algebra $B$ is nonzero and finitely presented as a unital associative $bb(F)_2$-algebra, and as a unital ring.]
] <lem:encoding-finite-presentation>

#proof[
  Take the finite generators of $K$ in the free unital associative $bb(F)_2$-algebra. Replace its defining equations $u = v$ by binomials $u - v = 0$, and impose $Omega = 0$. Before the last relation, the binomial ideal is exactly the span of differences of words in the same monoid congruence class. Indeed contextual equation steps lie in the ideal and telescope along a derivation; conversely the linear map sending words to monoid classes annihilates all binomials. The quotient has basis $K$. Killing its absorbing zero class removes exactly that basis element and gives $k_0 \[ K \]$. Identity survives since $1_K eq.not Omega$. Adding $2 dot.op 1 = 0$ gives a presentation as a unital ring. ◻
]

#proof[
  The ring properties follow from Lemma 16. The code embeddings put $G$ and $W$ in $A_(*)^times$. Transporting them through $i$ puts them in $\( e B e \)^times$. Transport the prefix and deletion symbols to $S_y \, T_y in e B e$. Their monoid relations become exactly Equation (3.6), with identity mapped to $e$ and zero mapped to algebra zero.
  Use Equation (3.11) and define
  #[#set math.equation(numbering: n => "(3.22)")
   $ phi.alt \( b \) = i kappa \( b ⊗ q \) \, #h(2em) s_i = i kappa \( 1 ⊗ s'_i \) \, #h(2em) d_i = i kappa \( 1 ⊗ d'_i \) . $ <eq:encoding-phi>]
  The first map is multiplicative because $q^2 = q$ and injective because $q eq.not 0$, the tensor product is over a field, and $i \, kappa$ are injective. With $p = phi.alt \( 1 \)$, the binary identities give $s_i \, d_i in p B p$ and Equation (3.5). Moreover
  $ \( b ⊗ q \) \( 1 ⊗ s'_i \) = b ⊗ s'_i = \( 1 ⊗ s'_i \) \( b ⊗ q \) \, $
  and the same holds for $d'_i$. Thus these elements centralize $phi.alt \( B \)$. Since $p in e B e$ and $e eq.not 1_B$, we have $p eq.not 1_B$, so $phi.alt$ is nonunital. The diagram assertions follow from Lemma 9 and Equations (3.3) and (3.4). ◻
]

== 4 A highly transitive action with finite-type stabilizers <sec:stage>

We strengthen the embedding problem to a statement about an action and all its finite-point stabilizers.

#thm([Theorem 4.1.])[
  #emph[For every finitely generated group $G$ with decidable word problem, there is a group $Lambda$ containing $G$ and acting faithfully on a countably infinite set $S$ such that:]
  + #emph[the action is transitive on ordered tuples of distinct points of every finite length;]
  + #emph[$Lambda$ and every pointwise stabilizer of a finite tuple are of type $F_oo$.]
] <thm:action>

The action will be obtained by iterating an embedding of a group and its set of columns. Finite permutations become available after one transition, giving high transitivity in the limit. We then identify each finite-point stabilizer as an ascending torus and verify the two hypotheses of Theorem 3: commuting splittings and a factorization through a finitely presented group.

=== 4.1 Ring data and compressed diagonal matrices <ring-data-and-compressed-diagonal-matrices>

Apply Theorem 10 to the given finitely generated group $G$ with decidable word problem. Throughout this section, retain its ring $B$, injective additive multiplicative map $phi.alt$, idempotent $p = phi.alt \( 1 \)$, and centralizing binary pairs $s_i \, d_i in p B p$:

#[#set math.equation(numbering: n => "(4.1)")
 $ d_i s_j = delta_(i j) p \, #h(2em) s_0 d_0 + s_1 d_1 = p . $ <eq:stage-binary>]

In particular, $phi.alt$ need not preserve the identity. Also retain the nonzero corner $e B e$, its embedded groups $G$ and $W$, and its elements $S_y \, T_y$ for $y in Y$. Write

$ Q = upright(E)_7 \( B \) \, #h(2em) X = B^7 \, $

and let $iota : Q arrow.r.hook W$ and $iota_X : X arrow.r.hook Y$ be the equivariant embeddings of Theorem 10. For $x in X$ we abbreviate $S_(iota_X \( x \))$ and $T_(iota_X \( x \))$ to $S_x$ and $T_x$.

The first use of the binary corner is to turn a unit of $B$ into an elementary matrix supported in one coordinate. This will let us encode both the action of $W$ and finite permutations of its indexed prefixes inside $Q$.

For a unit $v in B^times$, denote by $D_j \( v \)$ the diagonal matrix with entry $v$ in position $j$ and identity entries elsewhere; its size will always be specified by the surrounding group. Write $e_(i j) \( b \) = I + b upright(bold(e))_(i j)$ for an elementary matrix, where $upright(bold(e))_(i j)$ is a matrix unit.

#thm([Lemma 4.2.])[
  #emph[For every $r gt.eq 2$ and $v in B^times$, 
$ D_1 #scale(x: 120%, y: 120%)[\(] 1 + phi.alt \( v - 1 \) #scale(x: 120%, y: 120%)[\)] in upright(E)_r \( B \) . $

]
] <lem:diagonal>

#proof[
  Let $"GE"_r \( B \)$ be the subgroup of $"GL"_r \( B \)$ generated by elementary matrices and invertible diagonal matrices. Conjugation by a diagonal matrix preserves the elementary subgroup, so $upright(E)_r \( B \)$ is normal in $"GE"_r \( B \)$. The quotient is abelian, even though $B$ need not be commutative. Indeed, in a two-coordinate block,
  $ w \( v \) := e_12 \( v \) e_21 \( - v^(- 1) \) e_12 \( v \) = mat(delim: "(", 0, v; - v^(- 1), 0) \, #h(2em) w \( v \) w \( - 1 \) = mat(delim: "(", v, 0; 0, v^(- 1)) . $
  Thus $D_i \( v \)$ and $D_j \( v \)$ have the same class modulo $upright(E)_r \( B \)$. Classes of one-place diagonals commute because they can be represented in distinct positions. These classes generate the quotient.
  Set
  $ E_i = s_i d_i quad \( i = 0 \, 1 \) \, #h(2em) E_00 = s_0 s_0 d_0 d_0 \, #h(2em) E_01 = s_0 s_1 d_1 d_0 . $
  The binary relations give orthogonal decompositions
  #[#set math.equation(numbering: n => "(4.2)")
   $ p = E_0 + E_1 \, #h(2em) E_0 = E_00 + E_01 . $ <eq:stage-four-corners>]
  All these idempotents commute with $phi.alt \( B \)$.
  Each of $E_0 \, E_00 \, E_01$ is orthogonal to and equivalent to $E_1$, with implementing elements that commute with $phi.alt \( B \)$. Here are explicit implementing elements. Put
  $ s_00 = s_0 s_0 \, quad d_00 = d_0 d_0 \, #h(2em) s_01 = s_0 s_1 \, quad d_01 = d_1 d_0 . $
  For $v in { 0 \, 00 \, 01 }$, define $a_v = s_1 d_v$ and $b_v = s_v d_1$. Then
  $ a_v b_v = E_1 \, #h(2em) b_v a_v = E_v \, #h(2em) tau_v = 1 - E_v - E_1 + a_v + b_v $
  satisfies $tau_v^2 = 1$ and $tau_v E_v tau_v^(- 1) = E_1$. It also commutes with $phi.alt \( B \)$.
  Fix a unit $u in B^times$. For any of these idempotents $E$, the element $1 + phi.alt \( u - 1 \) E$ is a unit, with inverse $1 + phi.alt \( u^(- 1) - 1 \) E$. Conjugating by $tau_v$ shows that the one-place diagonals belonging to $E_v$ and $E_1$ have equal classes in the abelian quotient $"GE"_r \( B \) \/ upright(E)_r \( B \)$. Let $c$ be the common class for $E_0 \, E_1 \, E_00 \, E_01$. The second orthogonal split in Equation (4.2) gives $c = c^2$, hence $c = 1$. The first split then shows that $D_1 \( 1 + phi.alt \( u - 1 \) p \)$ is elementary. Since $phi.alt \( u - 1 \) p = phi.alt \( u - 1 \)$, this is the asserted matrix. ◻
]

=== 4.2 The transition of acting pairs <the-transition-of-acting-pairs>

The corner embedding of $W$ defines an injective homomorphism

$ rho : W arrow.r.hook B^times \, #h(2em) rho \( w \) = 1 - e + w . $

Indeed, its inverse-unit formula is $rho \( w \)^(- 1) = 1 - e + w^(- 1)$, and multiplication is the multiplication in $e B e$ together with the identity on $1 - e$. Write $phi.alt^2 = phi.alt compose phi.alt$ and define

#[#set math.equation(numbering: n => "(4.3)")
 $ mu \( w \) & = D_1 #scale(x: 120%, y: 120%)[\(] 1 + phi.alt^2 \( rho \( w \) - 1 \) #scale(x: 120%, y: 120%)[\)] in Q \,\
beta \( y \) & = #scale(x: 120%, y: 120%)[\(] phi.alt^2 \( S_y \) \, 0 \, dots.h \, 0 #scale(x: 120%, y: 120%)[\)]^(sans(T)) in X . $ <eq:stage-mu>]

Membership of $mu \( w \)$ in $Q$ follows from Lemma 18, applied twice. Expanding a product shows that $v mapsto 1 + phi.alt \( v - 1 \)$ is a homomorphism on units, and it is injective because $phi.alt$ is injective. Together with the injectivity of $rho$, this proves that $mu$ is an injective homomorphism.

The prefix relations show that $beta$ is injective. If $y eq.not z$ and $S_y = S_z$, multiplication by $T_y$ would give $e = 0$; injectivity of $phi.alt^2$ preserves the resulting distinction. They also give equivariance, since

$ #scale(x: 120%, y: 120%)[\(] 1 + phi.alt^2 \( w - e \) #scale(x: 120%, y: 120%)[\)] phi.alt^2 \( S_y \) & = phi.alt^2 \( S_y \) + phi.alt^2 #scale(x: 120%, y: 120%)[\(] \( w - e \) S_y #scale(x: 120%, y: 120%)[\)]\
 & = phi.alt^2 \( w S_y \) = phi.alt^2 \( S_(w y) \) . $

We thus obtain an injective transition of acting pairs

#[#set math.equation(numbering: n => "(4.4)")
 $ delta = mu iota : Q arrow.r.hook Q \, #h(2em) sigma = beta iota_X : X arrow.r.hook X . $ <eq:stage-transition>]

The same compressed-diagonal construction, applied to the corner copy of $G$, gives an embedding $G arrow.r.hook Q$.

#thm([Lemma 4.3.])[
  #emph[Every permutation of $sigma \( X \)$ with finite support is induced on that set by an element of $Q$.]
] <lem:stage-permutations>

#proof[
  Let $F subset.eq X$ be finite, and let $eta$ be a permutation of $F$. Put
  $ v = 1 - sum_(x in F) S_x T_x + sum_(x in F) S_(eta \( x \)) T_x . $
  The elements $S_x T_x$ are pairwise orthogonal idempotents. The relations $T_x S_y = delta_(x y) e$ show directly that $v$ is a unit, with inverse obtained by replacing $eta$ by $eta^(- 1)$. Moreover,
  $ v S_x = S_(eta \( x \)) quad \( x in F \) \, #h(2em) v S_x = S_x quad \( x in X \\ F \) . $
  The matrix $D_1 \( 1 + phi.alt^2 \( v - 1 \) \)$ lies in $Q$ by Lemma 18, and acts on $sigma \( X \)$ as required. ◻
]

=== 4.3 The limit group and its action <the-limit-group-and-its-action>

Let

$ N = "inj lim" \( Q \, delta \) \, #h(2em) S = "inj lim" \( X \, sigma \) . $

Write $q_i$ for the element of $N$ represented by $q in Q$ at stage $i$, and $\[ x \, i \]$ for a point of $S$ represented by $x in X$. Thus

$ q_i = delta \( q \)_(i + 1) \, #h(2em) \[ x \, i \] = \[ sigma \( x \) \, i + 1 \] . $

The maps in both direct systems are injective. Hence their stages may be identified with increasing subgroups $Q_i lt.eq N$ and increasing subsets $X_i subset.eq S$. Equivariance in Equation (4.4) defines an action of $N$ on $S$: for $k gt.eq i \, j$,

#[#set math.equation(numbering: n => "(4.5)")
 $ q_i \[ x \, j \] = #scale(x: 120%, y: 120%)[\[] delta^(k - i) \( q \) sigma^(k - j) \( x \) \, k #scale(x: 120%, y: 120%)[\]] . $ <eq:stage-limit-action>]

Passing to a larger common stage leaves this expression unchanged.

The shift $tau \( q_i \) = q_(i + 1)$ is an automorphism of $N$, with inverse $tau^(- 1) \( q_i \) = delta \( q \)_i$. Similarly the bijection

$ t \[ x \, i \] = \[ x \, i + 1 \] $

of $S$ has inverse $\[ x \, i \] mapsto \[ sigma \( x \) \, i \]$. Equation (4.5) implies that this bijection conjugates the action of $n in N$ to that of $tau \( n \)$. It therefore extends the action to

$ Lambda = N times.r_tau chevron.l t chevron.r . $

Identifying $Q$ with $Q_0$, its defining relation is

#[#set math.equation(numbering: n => "(4.6)")
 $ t^(- 1) q t = delta \( q \) #h(2em) \( q in Q \) . $ <eq:stage-torus>]

In particular, $Lambda$ is the ascending torus of $delta$. For completeness, the inverse map from the direct-limit description to the group with this presentation sends $q_i$ to $t^i q t^(- i)$. Equation (4.6) makes this well defined and gives the two inverse homomorphisms.

#thm([Lemma 4.4.])[
  #emph[The set $S$ is countably infinite. The action of $Lambda$ on $S$ is faithful and transitive on ordered tuples of distinct points of every finite length.]
] <lem:stage-faithful-transitive>

#proof[
  The finitely generated ring $B$ is countable, so $X$ and $S$ are countable. The ring is infinite: iterating the binary relations in Equation (4.1) produces, for every $m$, a family of $2^m$ pairwise orthogonal nonzero idempotents in $p B p$. They are nonzero because the corresponding deletion-prefix products are $p eq.not 0$. Thus $X$, and consequently $S$, is infinite.
  The action of $N$ is faithful. Indeed, a nonidentity element of $N$ is represented by a nonidentity matrix in some stage $Q_i$. Such a matrix moves one of the standard basis columns in that stage, and injectivity of the point maps preserves the distinction in $S$.
  Every element of $N$ preserves $X_j$ setwise for all sufficiently large $j$: its action at any such stage is by an invertible matrix. In contrast, $t X_j = X_(j + 1)$, and every stage inclusion is strict. To see strictness, note that $sigma \( X \)$ has zero coordinates outside position 1, whereas the column with identity in position 2 does not. Thus, for $k eq.not 0$ and sufficiently large $j$, $t^k X_j = X_(j + k) eq.not X_j$. No nonzero power of $t$ acts as an element of $N$. If an element $n t^k in Lambda$ acts trivially, this observation forces $k = 0$, and faithfulness for $N$ then forces $n = 1$.
  Given two ordered tuples of distinct points of the same finite length, place them in a common stage $X_i$. Their images in the next stage lie in $sigma \( X \)$. The prescribed bijection between their entries extends to a finitely supported permutation of $sigma \( X \)$. Lemma 19 supplies the required element of $Q_(i + 1)$. This proves the asserted transitivity. ◻
]

=== 4.4 Pointwise stabilizers as ascending tori <pointwise-stabilizers-as-ascending-tori>

Fix a nonnegative integer $m$. By Lemma 20, it suffices to prove the finiteness assertion for one ordered tuple $z = \( z_1 \, dots.h \, z_m \)$ of distinct points with every $z_j in sigma \( X \) subset.eq X$. When $m = 0$ the tuple is empty and its stabilizer is all of $Lambda$. Since both $z$ and $sigma \( z \)$ have entries in $sigma \( X \)$, Lemma 19 gives $a in Q$ such that

#[#set math.equation(numbering: n => "(4.7)")
 $ a sigma \( z \) = z . $ <eq:stage-align>]

For the empty tuple, take $a = 1$. Put

$ U = Q_(\( z \)) \, #h(2em) t' = t a^(- 1) . $

The subscript denotes pointwise stabilization. In our convention for the limit action,

$ t' \[ z \, 0 \] = \[ a^(- 1) z \, 1 \] = \[ sigma \( z \) \, 1 \] = \[ z \, 0 \] \, $

so $t'$ fixes the tuple. Furthermore,

#[#set math.equation(numbering: n => "(4.8)")
 $ \( t' \)^(- 1) q t' = a delta \( q \) a^(- 1) \, #h(2em) f : U arrow.r U \, quad f \( u \) = a delta \( u \) a^(- 1) . $ <eq:stage-stabilizer-map>]

The codomain in this formula follows either from the fact that $t'$ fixes the tuple or directly from equivariance and Equation (4.7). The map $f$ is injective.

#thm([Lemma 4.5.])[
  #emph[The pointwise stabilizer $Lambda_(\( \[ z \, 0 \] \))$ is the ascending torus of $U$ under $f$.]
] <lem:stage-stabilizer-torus>

#proof[
  The height homomorphism $Lambda arrow.r bb(Z)$ sends $Q$ to zero and $t'$ to one. Its kernel is $N$. For every $i gt.eq 0$ there is $b_i in Q$ such that $\( t' \)^i = t^i b_i$: this follows inductively from $q t = t delta \( q \)$. Hence
  $ \( t' \)^i Q \( t' \)^(- i) = t^i Q t^(- i) = Q_i \, #h(2em) N = union.big_(i gt.eq 0) \( t' \)^i Q \( t' \)^(- i) . $
  Since $t'$ fixes the tuple,
  $ N ∩ Lambda_(\( \[ z \, 0 \] \)) = union.big_(i gt.eq 0) \( t' \)^i U \( t' \)^(- i) . $
  An element of the full stabilizer of height $k$, multiplied by $\( t' \)^(- k)$, belongs to this height-zero subgroup. Thus the full stabilizer is its semidirect product with $chevron.l t' chevron.r$. The conjugation formula in Equation (4.8) identifies this group with the ascending torus of $f$. ◻
]

The two diagram systems required by Theorem 3 also restrict to $U$. Let $j_(ell \, E) : Q arrow.r W$ be the maps of Theorem 10, for $ell = 2 \, 3$ and $E in cal(P)_ell$, with common full-identity map $iota$. Define

#[#set math.equation(numbering: n => "(4.9)")
 $ h_(ell \, E) : U arrow.r U \, #h(2em) h_(ell \, E) \( u \) = a mu \( j_(ell \, E) \( u \) \) a^(- 1) . $ <eq:stage-stabilizer-diagrams>]

These maps do have their entire images in $U$. If $u$ fixes $z_j$, the fixed-point property of the enlargement says that $j_(ell \, E) \( u \)$ fixes $iota_X \( z_j \)$. Equivariance of $beta$ then says that $mu \( j_(ell \, E) \( u \) \)$ fixes $sigma \( z_j \)$; conjugation by $a$ gives the claim. The maps are homomorphisms, $h_(ell \, I) = f$, and they preserve each orthogonal-sum identity and each required elementwise commutation relation, since $mu$ and conjugation by $a$ are homomorphisms.

We have now identified the stabilizer as an ascending torus and supplied its commuting splittings. The remaining hypothesis of Theorem 3 is a factorization of $f$ through a finitely presented group. We will use $upright("St")_6 \( B \)$ as that group. A six-coordinate elementary block inside $Q = upright(E)_7 \( B \)$ fixes every vector supported in the first coordinate, so its entire image fixes $sigma \( z \)$. Two steps are needed: lift the compressed units homomorphically to $upright("St")_6 \( B \)$, then move their nonidentity part from coordinate 1 into that block without moving the marked columns.

=== 4.5 A homomorphic Steinberg lift <a-homomorphic-steinberg-lift>

For a unital ring $R$, the Steinberg group $upright("St")_6 \( R \)$ has generators $x_(i j) \( a \)$ for $i eq.not j$ and $a in R$, with the relations

$ x_(i j) \( a \) x_(i j) \( b \) & = x_(i j) \( a + b \) \,\
 & = x_(i k) \( a b \) &  & upright("if ") i \, j \, k upright(" are distinct") \,\
 & = 1 &  & upright("if ") i eq.not l upright(" and ") j eq.not k . $

We use the convention $\[ u \, v \] = u v u^(- 1) v^(- 1)$. The map sending $x_(i j) \( a \)$ to $e_(i j) \( a \)$ is a surjection $pi : upright("St")_6 \( R \) arrow.r.twohead upright(E)_6 \( R \)$.

We need the following precise form of the kernel-annihilation theorem from #cite(label("FoundationsCompanion"), form: "prose") Theorem 4.1.

#thm([Theorem 4.6.])[
  (Kernel annihilation).  #emph[Let $R$ be a unital associative ring and let $psi : R arrow.r R$ be an additive multiplicative map. Put $P = psi \( 1 \)$. Suppose that $U_0 \, U_1 \, V_0 \, V_1 in P R P$ commute with $psi \( R \)$ and satisfy 
$ V_i U_j = delta_(i j) P \, #h(2em) U_0 V_0 + U_1 V_1 = P . $

 Then the homomorphism 
$ theta : upright("St")_6 \( R \) arrow.r upright("St")_6 \( R \) \, #h(2em) x_(i j) \( a \) mapsto x_(i j) \( psi \( a \) \) \, $

 annihilates the kernel of $pi$.]
] <thm:stage-kernel>

The theorem permits nonunital $psi$ and noncommutative $R$. For such a coefficient map the matrix of the image of a root word with matrix $g$ is

#[#set math.equation(numbering: n => "(4.10)")
 $ I + psi^(\( 6 \)) \( g - I \) \, $ <eq:stage-nonunital-matrix>]

where $psi^(\( 6 \))$ means entrywise application. This follows first on elementary matrices and then on products from $g h - I = \( g - I \) + \( h - I \) + \( g - I \) \( h - I \)$.

#thm([Lemma 4.7.])[
  #emph[There is a homomorphism $L : B^times arrow.r upright("St")_6 \( B \)$ such that 
#[#set math.equation(numbering: n => "(4.11)")
 $ pi L \( v \) = D_1 #scale(x: 120%, y: 120%)[\(] 1 + phi.alt^2 \( v - 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:stage-lift>]

 Moreover, $upright("St")_6 \( B \)$ is finitely presented.]
] <lem:steinberg-lift>

#proof[
  Apply Theorem 22 with
  $ R = B \, quad psi = phi.alt \, quad P = p \, quad U_i = s_i \, quad V_i = d_i . $
  Its hypotheses are precisely the support, commutation, and binary relations in Theorem 10. Consequently its coefficient map factors as a homomorphism
  $ lambda : upright(E)_6 \( B \) arrow.r upright("St")_6 \( B \) \, #h(2em) lambda \( pi \( s \) \) = theta \( s \) . $
  The definition is independent of the choice of $s$ because $theta$ kills $ker pi$. By Equation (4.10),
  $ pi lambda \( g \) = I + phi.alt^(\( 6 \)) \( g - I \) . $
  The homomorphism on units used to define $mu$, together with Lemma 18, supplies a homomorphism
  $ A : B^times arrow.r upright(E)_6 \( B \) \, #h(2em) A \( v \) = D_1 #scale(x: 120%, y: 120%)[\(] 1 + phi.alt \( v - 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Take $L = lambda A$. The displayed formula for $pi lambda$ gives Equation (4.11).
  Finally, Lemma 16 proves that $B$ is finitely presented as a unital associative ring: to its finite $bb(F)_2$-algebra presentation one adds $2 dot.op 1 = 0$ over $bb(Z)$. Theorem 3 of #cite(label("KrsticMcCool1999"), form: "prose") states that $upright("St")_n \( R \)$ is finitely presented for every finitely presented unital associative ring $R$ and every $n gt.eq 4$. It allows noncommutative rings and applies with $R = B$ and $n = 6$. ◻
]

=== 4.6 Factoring the stabilizer endomorphism <factoring-the-stabilizer-endomorphism>

The tuple $sigma \( z \)$ is supported in coordinate 1, as is the nonidentity part of $delta \( U \)$. An ordinary exchange of coordinates 1 and 2 would move the tuple. Instead we exchange only the idempotent part on which those nonidentity increments are supported; this part annihilates the marked columns. The resulting factorization sends the whole intermediate Steinberg group into $U$.

#thm([Lemma 4.8.])[
  #emph[The endomorphism $f$ in Equation (4.8) factors through $upright("St")_6 \( B \)$ by homomorphisms 
$ U arrow.r^alpha upright("St")_6 \( B \) arrow.r^b U . $

]
] <lem:stage-stabilizer-factor>

#proof[
  For the fixed tuple $z$, put
  #[#set math.equation(numbering: n => "(4.12)")
   $ q_j = phi.alt^2 \( S_(z_j) T_(z_j) \) \, #h(2em) d = 1 - sum_(j = 1)^m q_j \, #h(2em) c = 1 - d . $ <eq:stage-d>]
  The prefix relations make the $q_j$ pairwise orthogonal idempotents, so $d$ is an idempotent. It depends only on $z$.
  For $u in U$, write $w = iota \( u \)$ and
  $ r = phi.alt^2 \( rho \( w \) - 1 \) = phi.alt^2 \( w - e \) \, #h(2em) v' = 1 + r . $
  Then $delta \( u \) = D_1 \( v' \)$. The element $w$ fixes each index $iota_X \( z_j \)$, so both prefix equations give
  $ \( w - e \) S_(z_j) = 0 \, #h(2em) T_(z_j) \( w - e \) = 0 . $
  Consequently $r q_j = q_j r = 0$ and
  #[#set math.equation(numbering: n => "(4.13)")
   $ d r = r d = r . $ <eq:stage-support>]
  Also, using $T_(z_i) S_(z_j) = delta_(i j) e$,
  #[#set math.equation(numbering: n => "(4.14)")
   $ d phi.alt^2 \( S_(z_j) \) = phi.alt^2 \( S_(z_j) \) - sum_(i = 1)^m phi.alt^2 \( S_(z_i) T_(z_i) S_(z_j) \) = 0 . $ <eq:stage-fixed-columns>]
  These identities use only additivity and multiplicativity of $phi.alt$; no identity-preservation assumption is needed.
  In coordinates 1 and 2 of $B^7$, let
  $ E = e_12 \( d \) e_21 \( - d \) e_12 \( d \) = mat(delim: "(", c, d; - d, c) \, #h(2em) E^(- 1) = mat(delim: "(", c, - d; d, c) \, $
  with identity entries on all other coordinates. This is an element of $Q$. Equation (4.14) shows that both $E$ and $E^(- 1)$ fix every column $sigma \( z_j \)$. Direct multiplication, using Equation (4.13), gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ E D_1 \( v' \) E^(- 1) = D_2 \( v' \) . $ <eq:stage-exchange>]
  In particular, the signed exchange leaves no sign or inversion on the moved unit.
  Let $L$ be the homomorphism of Lemma 23, and define
  #[#set math.equation(numbering: n => "(4.16)")
   $ alpha \( u \) = L \( rho \( iota \( u \) \) \) . $ <eq:stage-alpha>]
  By Equation (4.11), its matrix projection, placed in coordinates 2 through 7, is $D_2 \( v' \)$. In particular, the argument of $L$ here is the original unit $rho \( w \)$; the two applications of $phi.alt$ are already included in the defining property of $L$.
  For every $s in upright("St")_6 \( B \)$, define
  #[#set math.equation(numbering: n => "(4.17)")
   $ b \( s \) = a E^(- 1) "diag" \( 1 \, pi \( s \) \) E a^(- 1) . $ <eq:stage-b>]
  This is a homomorphism to $Q$, because embedding the elementary six-coordinate block in coordinates 2 through 7 gives an elementary seven-coordinate matrix. Its entire image lies in $U$: the matrix $"diag" \( 1 \, pi \( s \) \)$ fixes every first-coordinate vector $sigma \( z_j \)$, the matrices $E^(plus.minus 1)$ do so as well, and $a sigma \( z \) = z$. Finally,
  $ b \( alpha \( u \) \) = a E^(- 1) D_2 \( v' \) E a^(- 1) = a D_1 \( v' \) a^(- 1) = f \( u \) . $
  This proves the factorization. For $m = 0$, the sums in Equation (4.12) are empty and $d = 1$; all the same formulas apply.
  The codomains can be seen in the commutative diagram
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$U$])
  content((2.519, 0), [$upright("St")_6 \( B \)$])
  content((0, -1.585), [$U$])
  content((2.519, -1.585), [$Q_(\( sigma \( z \) \))$])
  line((0.336, 0), (1.787, 0), mark: (end: ">"))
  content((1.062, 0.2266), [#text(size: 0.73em)[$alpha$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3223, -0.7927), [#text(size: 0.73em)[$f$]])
  line((2.519, -0.2725), (2.519, -1.313), mark: (end: ">"))
  content((3.372, -0.7927), [#text(size: 0.73em)[$"diag" \( 1 \, pi \( - \) \)$]])
  line((1.721, -1.585), (0.336, -1.585), mark: (end: ">"))
  content((1.029, -1.359), [#text(size: 0.73em)[$c_(a E^(- 1))$]])
})
  where $c_g$ denotes conjugation by $g$. The lower right group is the entire pointwise stabilizer of $sigma \( z \)$ in $Q$. The right arrow lands there because it leaves the first coordinate unchanged; the lower arrow lands in $U$ because $E$ fixes $sigma \( z \)$ and $a sigma \( z \) = z$. ◻
]

#proof[
  The embedding $G arrow.r.hook Q arrow.r.hook Lambda$ was constructed above, and Lemma 20 proves the assertions about the action. For a tuple $z$ chosen as above, Lemma 21 identifies its pointwise stabilizer with the ascending torus of the injective endomorphism $f : U arrow.r U$. The diagrams in Equation (4.9) satisfy the two orthogonal-splitting hypotheses of Theorem 3. Lemma 24, together with finite presentation in Lemma 23, supplies its other hypothesis. Thus this stabilizer has type $F_oo$. High transitivity conjugates every tuple of distinct points to one of this form. Repeated entries do not change a pointwise stabilizer, and the empty tuple gives $Lambda$ itself. This proves all the claims. ◻
]

== 5 The simple overgroup <sec:simple>

The action constructed in Theorem 17 provides the input for the twisted Brin–Thompson construction. We describe the group and then apply the simplicity and finiteness theorems of Belk and Zaremsky.

Let $A$ act faithfully on a countably infinite set $S$, and put $cal(C) = { 0 \, 1 }^(bb(N))$. A #emph[brick] in $cal(C)^S$ prescribes a finite binary prefix $alpha \( s \)$ in each coordinate $s$, with all but finitely many prefixes empty. Its chart $h_alpha : cal(C)^S arrow.r B_alpha$ prefixes each coordinate by $alpha \( s \)$. For $a in A$, the coordinate permutation is

$ \( tau_a xi \) \( s \) = xi \( a^(- 1) s \) . $

The #emph[twisted Brin–Thompson group] $S V_A$ consists of the homeomorphisms represented by two finite brick partitions and a bijection between their pieces, with each piece map of the form

$ h_beta tau_a h_alpha^(- 1) : B_alpha arrow.r B_beta . $

Common refinements define composition. The one-piece maps $tau_a$ embed $A$ because its action on $S$ is faithful. This is the construction of #cite(label("BelkZaremsky2022"), form: "prose") Section 1.

An action is #emph[oligomorphic] if it has finitely many orbits on finite subsets of each fixed cardinality. The transfer theorem below combines #cite(label("BelkZaremsky2022"), form: "prose") Theorem D, with $n = oo$, and Theorem 3.4.

#thm([Theorem 5.1.])[
  (Belk–Zaremsky).  #emph[Let $A$ act faithfully and oligomorphically on a countably infinite set $S$. Suppose $A$ and the setwise stabilizer of every finite subset of $S$ have type $F_oo$. Then $S V_A$ is a nontrivial simple group of type $F_oo$ and contains $A$ through its global coordinate action.]
] <thm:twisted-transfer>

#proof[
  Fix the finitely generated group $G$ and its word-problem decider. Theorem 17 supplies an embedding $G arrow.r.hook Lambda$ and a faithful highly transitive action of $Lambda$ on a countably infinite set $S$. In particular the action is oligomorphic: every set of distinct $m$ points can be sent to any other such set.
  The same theorem gives type $F_oo$ for $Lambda$ and for each pointwise stabilizer $Lambda_(\( F \))$, where $F subset S$ is finite. The setwise stabilizer $Lambda_({ F })$ acts on $F$; its kernel is $Lambda_(\( F \))$, and its image lies in the finite symmetric group $"Sym" \( F \)$. Lemma 8 therefore gives type $F_oo$ for $Lambda_({ F })$. All hypotheses of Theorem 25 hold. Taking $H = S V_Lambda$, we obtain the required inclusions
  $ G arrow.r.hook Lambda arrow.r.hook H \, $
  with $H$ nontrivial, simple, and of type $F_oo$. ◻
]

The same overgroup $H$ can be generated by two elements of finite order. Indeed, type $F_oo$ implies finite generation, and the additional conclusion of #cite(label("BelkZaremsky2022"), form: "prose") Theorem 3.4 applies to the twisted Brin–Thompson group $H = S V_Lambda$ constructed above.


#bibliography("refs.bib", style: "ieee", title: [References])
