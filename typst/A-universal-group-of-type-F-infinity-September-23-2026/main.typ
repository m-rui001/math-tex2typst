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

#align(center)[#text(size: 16pt, weight: "bold")[A universal group of type $F_oo$]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

A group has type $F_n$ if it admits a classifying CW complex with finite $n$-skeleton,
  and type $F_oo$ if it admits one classifying complex with finitely many cells in every dimension.
  Here a classifying complex is a connected CW complex with the given fundamental group and contractible universal
  cover; it may have infinitely many dimensions. Type $F_2$ is equivalent to finite presentability.

#thm([Theorem 1.1.])[
  #emph[There exists a group $H$ of type $F_oo$ such that every finitely presented group admits an injective
    homomorphism into $H$.]
] <thm:main>

The common target gives an exact description of its finitely generated subgroups.
  A finitely generated group is recursively presented if it admits a presentation on finitely many generators with
  a recursively enumerable set of relators.

#thm([Corollary 1.2.])[
  #emph[A finitely generated group embeds in $H$ if and only if it is recursively presented.]
] <cor:recursive>

#proof[
  If $G$ is finitely generated and recursively presented, Higman’s embedding theorem places it in a finitely
    presented group [6], which embeds in $H$ by Theorem 1. Conversely,
    $H$ is finitely presented because it has type $F_oo$. For a finitely generated subgroup $G lt.eq H$,
    represent its generators by words in a finite presentation of $H$.
    Enumerate all words in the chosen generators, and dovetail finite derivations from the ambient relators
    proving that their substituted words are trivial. Recording the successful words enumerates exactly the
    defining relators of $G$. ◻
]

This answers the $F_oo$ form of the higher-dimensional Higman embedding question,
  stated for finitely generated recursively presented groups in [4] Question 1.3.
  The theorem imposes no word-problem hypothesis on the input.

=== Context and construction <context-and-construction>

For a commutative unital coefficient ring $Lambda$, a group $G$ has type $F
  P_n \( Lambda \)$ if the trivial $Lambda G$-module $Lambda$ has a projective resolution with finitely generated
  terms through degree $n$; write $F P_n$ for $Lambda = bb(Z)$.
  For $n = oo$, finite generation is required in every degree.
  Leary proved that every countable group embeds in a group of type $F P_2$ [8].
  Fournier-Facio and Zaremsky show that, for each $n in bb(N) union { oo }$,
  embeddings of all finitely generated recursively presented groups into recursively presented groups of type $F
  P_n$ would imply embeddings of all finitely presented groups into groups of type $F_n$ [4] Theorem A.
  They also prove that the rope-trick groups of their Definition 1.5 fail type $F
  P_3 \( bb(Q) \)$ for infinite inputs with nontrivial free-presentation kernel [4] Definition 1.5 and Theorem B.
  This obstruction is specific to those rope-trick groups.

The proof of their conditional theorem uses a universal finitely presented group,
  an embedding through an intermediate overgroup and back, and an ascending HNN extension.
  They relate this strategy to earlier work of Baumslag–Dyer–Miller and Fournier-Facio–Löh–Moraschini [4] Section 2.

For the universal finitely presented group $U$ of Lemma 4,
  Proposition 6 gives a finite presentation of a group $hat(W)$ equipped with two finite families of homomorphisms
  from $U$, sharing a distinguished map $iota : U arrow.r hat(W)$.
  Faithful models in tensor product algebras verify that $iota$ is injective.
  Finite presentability of $hat(W)$ then lets universality supply an embedding $kappa : hat(W) arrow.r U$:

#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$U$])
  content((2.057, 0), [$hat(W)$])
  content((4.181, 0), [$U .$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  line((0.336, 0), (0.336, 0.3))
  content((1.029, 0.2266), [#text(size: 0.73em)[$iota$]])
  bezier((0.336, 0), (3.779, 0), (1.563, -0.5461), (2.552, -0.5461), mark: (end: ">"))
  line((0.336, 0), (0.336, 0.3))
  content((2.057, -0.1829), [#text(size: 0.73em)[$f = kappa iota$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  line((2.393, 0), (2.393, 0.3))
  content((3.086, 0.2266), [#text(size: 0.73em)[$kappa$]])
})

Postcomposing the two families by $kappa$ gives homomorphisms from $U$ to itself,
  with the injective endomorphism $f$ as their common distinguished map (Corollary 7).
  The group $U$ embeds in the associated ascending HNN extension

$ H = T \( U \, f \) = chevron.l U \, t divides t^(- 1) u t = f \( u \) med \( u in U \) chevron.r \, $

which is finitely presented by Lemma 9. Theorem 8 proves that $H$ has type $F_oo$.

The finite idempotent systems, the group enlargement, and the ascending-torus criterion are shared with the
  companion [9] Sections 2.1, 2.3–2.5, and 3.1. We give local proofs of the algebraic identities and geometric
  criterion.

The geometric step begins with a uniform filling statement for ordinary integral chains.
  In the homogeneous chain model, restricting relative vertex differences to a finite subset of $U$ leaves only
  finitely many simplex types up to common left translation in each degree.
  For each positive degree and finite input set of relative differences,
  Proposition 11 chooses one exponent and one finite output set.
  That iterate of $f$ sends every integral cycle using the input differences to the boundary of a chain using the
  output differences. The filling lengths and coefficients may vary with the cycle.

The finite diagrams supply these fillings by induction. For each $ell in { 2 \, 3 }$,
  the diagram is indexed by idempotents over $bb(F)_ell$. Orthogonal sums correspond to pointwise products of
  homomorphisms with elementwise commuting images. Lemma 5 says that an additive assignment has its value at the
  identity annihilated by $ell$. In degrees $n gt.eq 2$, the chain diagonal includes mixed terms from lower
  degrees, so the corresponding cycle classes are not automatically additive.
  Using lower-degree fillings, the induction constructs, below degree $n$,
  a controlled chain homotopy from the map induced by an iterate of $f$ to the constant map.
  Lemma 10 uses it to remove the mixed terms. For each input cycle,
  both diagrams then give additive assignments into the homology of the same bounded chain complex.
  Their common value at the identity idempotent is represented by the image of the input cycle under an iterate of
  $f$. It is annihilated by both $2$ and $3$, and hence vanishes.

For an arbitrary set $cal(I)$, put $M = \( bb(Z) H \)^(cal(I))$.
  A cycle in the tensor complex computing $H_i \( U \, M \)$, $i > 0$,
  decomposes in each coordinate into finitely many ordinary cycles in left $U$-cosets,
  with one finite set of simplex types common to all coordinates.
  The uniform filling statement supplies one exponent and output set for these cycles,
  so their fillings reassemble into one tensor chain. In the ascending HNN sequence of Section 7,
  the map $F$ combines $f$ on chains with multiplication by the stable letter on coefficients.
  The fillings make $F$ locally nilpotent on $H_i \( U \, M \)$ for $i > 0$:
  every class is killed by some power of $F$. Thus $1 - F$ is invertible there,
  and exactness gives $H_n \( H \, M \) = 0$ for every $n gt.eq 2$.
  Since $H$ is finitely presented, Lemma 12 turns this vanishing into geometric finiteness.
  At each stage, the cellular cycle module is finitely generated; via Hurewicz,
  those generators have sphere representatives. Attaching cells along these spheres stage by stage produces one
  classifying complex with finitely many cells in every dimension.

=== Conventions <conventions>

All groups are discrete. Group homology has integral coefficients unless stated otherwise,
  and coefficient modules are right modules. Products indexed by arbitrary sets always mean direct products,
  not direct sums.

== 2 A universal finitely presented group <sec:universal>

We will place a finite collection of homomorphisms inside one finitely presented overgroup and then embed that
  overgroup back into the original group. For this purpose we need a finitely presented group containing every
  finitely presented group. We recall its construction from Higman’s embedding theorem [6]:
  every finitely generated group with a recursively enumerable presentation embeds in a finitely presented group.
  No decidability assumption on the word problem occurs in this theorem.

The base-group embedding and finite-generation construction below follow the classical embedding methods of
  Higman, B. H. Neumann and Hanna Neumann [7] Theorems I, I’, and IV;
  we include the arguments in the form needed here. We first record an elementary form of base-group injectivity
  for HNN extensions. Here the countable case is sufficient.

#thm([Lemma 2.1.])[
  #emph[Let $D$ be a countable group, let $D_1 \, D_2$ be subgroups of $D$, and let $theta : D_1 arrow.r
    D_2$ be an isomorphism. The natural homomorphism from $D$ to
$ chevron.l D \, t divides t^(- 1) d t = theta \( d \) quad \( d in D_1 \) #scale(x: 120%, y: 120%)[chevron.r] $

 is injective. Here the presentation includes all relations of $D$.]
] <lem:hnn-injection>

#proof[
  Let $D$ act faithfully on $Omega = D times bb(N)$ by left multiplication in the first coordinate.
    The restrictions to $D_1$ and $D_2$ are free actions, each with countably infinitely many orbits.
    Match their orbit sets bijectively. For each matched pair choose a base point $x$ in the $D_2$-orbit and a
    base point $y$ in the $D_1$-orbit, and define
  $ T #scale(x: 120%, y: 120%)[\(] theta \( d \) x #scale(x: 120%, y: 120%)[\)] = d y wide \( d in D_1 \) . $
  Freeness and the orbit matching make $T$ a permutation of $Omega$.
    For every $d in D_1$ it satisfies $T theta \( d \) = d T$, and hence $T^(- 1) d T = theta \( d \)$,
    as permutations of $Omega$. Sending $t$ to $T$ therefore defines an action of the displayed group whose
    restriction to $D$ is faithful. The natural map from $D$ must be injective. ◻
]

#thm([Lemma 2.2.])[
  #emph[There exists a finitely presented group $U$ into which every finitely presented group embeds.]
] <lem:universal>

#proof[
  Effectively list all finite presentations, renaming their generators so that the generating alphabets are
    disjoint. Let $C$ be the group given by the union of these presentations.
    Its generators can be effectively numbered $c_0 \, c_1 \, dots.h$,
    and its relators can be effectively enumerated. Each group on the list embeds in $C$:
    the homomorphism induced by its generators has a left inverse obtained by killing all generators of the other
    presentations.
  It remains to place $C$ inside a finitely generated group with recursively enumerable relators. Form
  $ D = C * chevron.l a \, p chevron.r \, wide v_i = a^i p a^(- i) quad \( i gt.eq 0 \) \, $
  where $chevron.l a \, p chevron.r$ is free of rank two. The elements $v_i$ freely generate their subgroup:
    in any product of nonzero powers of the $v_i$ with consecutive indices distinct,
    consecutive powers of $p$ are separated by nonzero powers of $a$, so free reduction cannot give the identity.
    The elements $c_i v_i$ also freely generate their subgroup, because the projection $D arrow.r chevron.l a \,
    p chevron.r$ killing $C$ sends them to the $v_i$. Consequently $v_i mapsto c_i
    v_i$ extends to an isomorphism between these two free subgroups of $D$.
  By Lemma 3, $D$, and hence $C$, embeds in
  $ V = chevron.l D \, q divides q^(- 1) v_i q = c_i v_i quad \( i gt.eq 0 \) #scale(x: 120%, y: 120%)[chevron.r] . $
  The identities
  $ c_i = q^(- 1) v_i q v_i^(- 1) $
  show that $V$ is generated by $a \, p \, q$. More precisely,
    it has a presentation on these three generators obtained by substituting the displayed word for every $c_i$ in
    the relators of $C$. The substitution turns each HNN relation into an identity.
    Thus it and the natural map into $V$ are mutually inverse homomorphisms,
    so this is indeed a presentation of $V$. Its relators are recursively enumerable.
    Higman’s embedding theorem now embeds $V$ in a finitely presented group $U$.
    Every finitely presented group embeds in $C$, then in $V$, and finally in $U$. ◻
]

Below we use only the existence of the subgroup embeddings supplied by Lemma 4.

== 3 Two finite systems of idempotents <sec:idempotents>

The finite diagrams used in our construction are indexed by idempotent operators over $bb(F)_2$ and $bb(F)_3$.
  Their essential property is elementary: an additive assignment to either diagram forces the value at the
  identity to be annihilated by the corresponding prime. These diagrams and their additivity argument are shared
  with the companion [9] Section 2.1, Lemma 2.1. We give the complete argument before realizing them by
  homomorphisms of groups.

For $ell in { 2 \, 3 }$, let $D_ell$ be the unital $bb(F)_ell$-algebra of operators on the free vector space with
  basis ${ 0 \, 1 }^(bb(N))$ generated by $l_0 \, l_1 \, r_0 \, r_1$.
  Here $l_i$ prefixes the symbol $i$, and $r_i$ deletes an initial $i$,
  sending basis vectors with the other initial symbol to zero. Writing $I$ for the identity operator, we have

#[#set math.equation(numbering: n => "(3.1)")
 $ r_i l_j = delta_(i j) I \, wide l_0 r_0 + l_1 r_1 = I . $ <eq:binary-prefix-relations>]

For a finite binary word $v$, let $l_v$ prefix $v$, let $r_v$ delete $v$ when it occurs as a prefix and give zero
  otherwise, and put $E_v = l_v r_v$. Thus $E_v$ projects onto the span of the sequences beginning with $v$.

If $\( v_1 \, v_2 \, v_3 \)$ is a prefix-free list, then

$ \( l_(v_i) r_(v_j) \) \( l_(v_k) r_(v_m) \) = delta_(j k) l_(v_i) r_(v_m) . $

These operators are nonzero matrix units, so their span is a copy of $M_3 \( bb(F)_ell \)$.
  We use three such algebras, connected by shared diagonal projections. Write

$ A = E_00 \, wide A_0 = E_000 \, wide A_1 = E_001 \, wide B' = E_01 \, wide C' = E_1 . $

Their defining lists, diagonal projections, and identity operators are

#[#set math.equation(numbering: n => "(3.2)")
 $ upright("prefix list") & upright("diagonal projections") & upright("identity")\
\( 00 \, 01 \, 1 \) & A \, B' \, C' & I\
\( 000 \, 01 \, 1 \) & A_0 \, B' \, C' & A_0 + B' + C'\
\( 001 \, 01 \, 1 \) & A_1 \, B' \, C' & A_1 + B' + C' . $ <eq:three-prefix-lists>]

The last two identities are not $I$, while $A = A_0 + A_1$ and $A_0 A_1 = A_1 A_0 = 0$.
  Let $cal(P)_ell$ be the union, as a set of actual operators in $D_ell$,
  of all idempotents in these three matrix algebras. It is finite and contains $I$.
  An operator belonging to two of the algebras has just one index in $cal(P)_ell$.

Two operators $E \, P$ are called #emph[orthogonal] if $E P = P E = 0$.
  The relations below include all orthogonal pairs whose sum belongs to $cal(P)_ell$,
  even when the pair does not belong to a single one of the three matrix algebras.
  In particular, they include $A = A_0 + A_1$, whose summands come from the two smaller support algebras.

#thm([Lemma 3.1.])[
  #emph[Let $ell in { 2 \, 3 }$, let $T$ be an abelian group,
    and let $\( z_E \)_(E in cal(P)_ell)$ be elements of $T$. Suppose that
#[#set math.equation(numbering: n => "(3.3)")
 $ z_(E + P) = z_E + z_P $ <eq:idempotent-additivity>]

 whenever $E \, P \, E + P in cal(P)_ell$ and $E P = P E = 0$. Then $ell z_I = 0$.]
] <lem:idempotents>

#proof[
  We first compare the values of rank-one idempotents within any one of the three matrix algebras.
    For a column vector $u in bb(F)_ell^3$ and a row covector $lambda$ with $lambda u = 1$, write
  $ x \( u \, lambda \) = z_(u lambda) . $
  Fix a nonzero vector $v in ker lambda$. We claim that the difference
  #[#set math.equation(numbering: n => "(3.4)")
   $ x \( u + v \, lambda \) - x \( u \, lambda \) $ <eq:fixed-increment>]
  does not depend on the vector $u$ subject to $lambda u = 1$.
  Take another such vector $u'$. Suppose first that $u' - u$ and $v$ are linearly independent.
    They form a basis of $ker lambda$, and hence $u \, u' - u \, v$ form a basis of $bb(F)_ell^3$.
    There is consequently a covector $mu$ satisfying
  $ mu u = mu u' = 0 \, wide mu v = 1 . $
  The identity
  $ u lambda + v mu = \( u + v \) lambda + v \( mu - lambda \) $
  expresses one rank-two idempotent as two orthogonal sums of rank-one idempotents.
    Indeed, $lambda v = mu u = 0$ on the left, while $lambda v = \( mu - lambda \) \( u + v \) = 0$ on the right;
    all four rank-one factors have their defining covector equal to one on their defining vector. Applying (3.3) gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ x \( u + v \, lambda \) - x \( u \, lambda \) = x \( v \, mu \) -
     x \( v \, mu - lambda \) . $ <eq:rank-one-difference>]
  The same covector $mu$ gives the same right-hand side for $u'$, proving the claim in this case.
  If $u' - u$ lies in the span of $v$, choose $w in ker lambda \\ chevron.l v chevron.r$ and put $u'' = u + w$.
    Both $u'' - u$ and $u'' - u'$ are independent of $v$. Comparing first $u$ with $u''$ and then $u'$ with $u''$
    proves the claim in general. The kernel of $lambda$ has dimension two,
    so this argument also works over $bb(F)_2$; no choice of a third nonzero scalar is being used.
  Apply the claim to the successive vectors $u \, u + v \, dots.h \, u + \( ell - 1 \) v$.
    The $ell$ successive differences are equal, and they sum to zero because $ell v = 0$. Therefore
  #[#set math.equation(numbering: n => "(3.6)")
   $ ell x \( u + v \, lambda \) = ell x \( u \, lambda \) . $ <eq:rank-one-prime-invariance>]
  The same conclusion is immediate for $v = 0$, so $ell x \( u \, lambda \)$ is independent of $u$ whenever
    $lambda$ is fixed and $lambda u = 1$. For the covector comparison,
    work within this same matrix algebra and define a new assignment $z'_E = z_(E^(sans(T)))$.
    Transposition preserves idempotence and orthogonal sums, so $z'$ obeys the same additivity relations.
    Apply the invariance just proved to $x' \( v \, mu \) = z'_(v mu) = z_(mu^(sans(T)) v^(sans(T)))$.
    Fixing $mu$ and varying $v$ now shows that $ell x \( u \, lambda \)$ is independent of $lambda$ whenever $u$
    is fixed and $lambda u = 1$. This does not assume that $z_E = z_(E^(sans(T)))$.
  In particular the three diagonal matrix units have equal $ell$-multiples.
    To see the comparison explicitly, for distinct basis vectors $e_i \, e_j$ take $lambda = e_i^(*) + e_j^(*)$.
    First change the covector at $e_i$ from $e_i^(*)$ to $lambda$, then change the vector from $e_i$ to $e_j$,
    and finally change the covector to $e_j^(*)$. Each change preserves the $ell$-multiple, giving
  $ ell z_(e_i e_i^(*)) = ell z_(e_j e_j^(*)) . $
  It remains to use the shared projections displayed above. The comparison of diagonal units in each algebra gives
  $ ell z_A = ell z_(B') = ell z_(C') = ell z_(A_0) = ell z_(A_1) . $
  Call this common value $q in T$. The projection identity $A = A_0 +
    A_1$ is an orthogonal sum across the two smaller support algebras.
    Its three operators belong to $cal(P)_ell$, so (3.3) gives $q = q + q$. Thus $q = 0$.
    Finally, $A + B'$ belongs to the first matrix algebra, and $I = \( A + B' \) + C'$. Applying additivity twice yields
  $ ell z_I = ell z_A + ell z_(B') + ell z_(C') = 0 \, $
  as required. ◻
]

== 4 Faithful finite diagram envelopes <sec:envelopes>

The finite idempotent sets $cal(P)_2$ and $cal(P)_3$ specify only finitely many commutation and multiplication
  identities. We now realize all these identities in a finitely presented overgroup,
  without collapsing the common full-identity copy of the input group.
  A faithful model supplies the injectivity; its own presentation need not be finite.

#thm([Proposition 4.1.])[
  #emph[For every finitely presented group $U$ there are a finitely presented group $hat(W)$ and homomorphisms
$ k_(ell \, E) : U arrow.r hat(W) wide \( ell in { 2 \, 3 } \, med E in cal(P)_ell \) $

 such that $k_(2 \, I) = k_(3 \, I)$ is injective. For each $ell$, whenever $E \, E' \, E +
   E' in cal(P)_ell$ and $E E' = E' E = 0$, the subgroups $k_(ell \, E) \( U \)$ and $k_(ell \, E') \( U \)$
   commute elementwise, and
$ k_(ell \, E + E') \( u \) = k_(ell \, E) \( u \) k_(ell \, E') \( u \) wide \( u in U \) . $

]
] <prop:finite-envelope>

#proof[
  Fix a finite presentation $U = chevron.l X divides cal(R) chevron.r$.
    For every pair $\( ell \, E \)$ take a copy of this presentation, with generators $x_(ell \, E)$ for $x in X$.
    Define $hat(W)$ by these copy presentations and the following additional relations:
  #[#set math.equation(numbering: n => "(4.1)")
   $ x_(2 \, I) & = x_(3 \, I) &  & \( x in X \) \,\
 & = 1 &  & \( x \, y in X \) \,\
x_(ell \, E + E') & = x_(ell \, E) x_(ell \, E') &  & \( x in X \) . $ <eq:envelope-common>]
  The last two families run over both values of $ell$ and every orthogonal pair $E \,
    E'$ whose members and sum lie in $cal(P)_ell$. All three lists are finite.
    The indices are actual idempotents in $D_ell$, not separately tagged copies from its three matrix subalgebras.
    Thus these relations include the orthogonal sums between different subalgebras as well as those within one
    subalgebra. In particular, the zero idempotent is included; its sum relation with itself gives $x_(ell \, 0) =
    x_(ell \, 0)^2$, forcing $x_(ell \, 0) = 1$.
  The copy presentations give homomorphisms $k_(ell \, E) : U arrow.r hat(W)$.
    Equation (4.1) implies that their corresponding image subgroups commute elementwise.
    It follows that $u mapsto k_(ell \, E) \( u \) k_(ell \, E') \( u \)$ is a homomorphism.
    By Equation (4.1), it agrees with $k_(ell \, E + E')$ on $X$, and therefore on all of $U$.
    Similarly, Equation (4.1) gives $k_(2 \, I) = k_(3 \, I)$.
  To prove that this common map is injective, we construct a faithful model.
    The same group-level enlargement is used in the companion [9] Section 3.1;
    we verify all of its needed algebraic properties here. For any group $V$ and $ell in { 2 \, 3 }$,
    work in the unital algebra
  $ A_ell \( V \) = D_ell ⊗_(bb(F)_ell) bb(F)_ell \[ V \] \, $
  where $bb(F)_ell \[ V \]$ is the group algebra with basis indexed by $V$. For $E in cal(P)_ell$ define
  #[#set math.equation(numbering: n => "(4.2)")
   $ j_(ell \, E) \( v \) = \( I - E \) ⊗ 1 + E ⊗ v wide \( v in V \) . $ <eq:envelope-model>]
  Since $E$ and $I - E$ are orthogonal idempotents, multiplication gives
  $ j_(ell \, E) \( v \) j_(ell \, E) \( w \) = j_(ell \, E) \( v w \) \, wide j_(ell \, E) \( 1 \) = 1 . $
  Thus these elements are units, with inverses $j_(ell \, E) \( v^(- 1) \)$, and $j_(ell \, E)$ is a homomorphism.
  For $E \, E' \, E + E' in cal(P)_ell$ with $E E' = E' E = 0$, rewrite Equation (4.2) as $1 + E ⊗ \( v - 1 \)$. Thus
  $ #scale(x: 120%, y: 120%)[\(] 1 + E ⊗ \( v - 1 \) #scale(x: 120%, y: 120%)[\)] #scale(x: 120%, y: 120%)[\(] 1 +
    E' ⊗ \( w - 1 \) #scale(x: 120%, y: 120%)[\)] = 1 + E ⊗ \( v - 1 \) + E' ⊗ \( w - 1 \) \, $
  because $E E' = 0$. Reversing the order gives the same answer since $E' E = 0$.
    Hence the images of $j_(ell \, E)$ and $j_(ell \, E')$ commute elementwise,
    even if $v$ and $w$ do not commute. Setting $w = v$ gives
  $ j_(ell \, E) \( v \) j_(ell \, E') \( v \) = j_(ell \, E + E') \( v \) . $
  Moreover, $j_(ell \, I) \( v \) = I ⊗ v$ is injective: the decomposition $A_ell \( V \) =
    xor.big_(v in V) D_ell ⊗ v$ distinguishes these elements, since $I eq.not 0$.
  Let $W_ell \( V \)$ be the subgroup of $A_ell \( V \)^times$ generated by all images $j_(ell \, E) \( V \)$.
    First form $W_2 \( U \)$, and then form $W_3 \( W_2 \( U \) \)$.
    Write $j_E^(\( 2 \))$ for the first-stage maps and $j_E^(\( 3 \))$ for the second-stage maps.
    The group $W_3 \( W_2 \( U \) \)$ receives the two families
  $ alpha_E = j_I^(\( 3 \)) compose j_E^(\( 2 \)) quad \( E in cal(P)_2 \) \, wide beta_E = j_E^(\( 3 \)) compose
    j_I^(\( 2 \)) quad \( E in cal(P)_3 \) . $
  Postcomposition preserves the first family’s identities, and precomposition preserves the second family’s
    identities. Their full-identity maps coincide with the injection $j_I^(\( 3 \)) compose j_I^(\( 2 \))$.
    Notice that the second group algebra is formed from the abstract group $W_2 \( U \)$;
    no map between algebras of different characteristics is involved.
  These families satisfy every defining relation of $hat(W)$.
    They therefore induce a homomorphism $Phi : hat(W) arrow.r W_3 \( W_2 \( U \) \)$ for which
  $ Phi compose k_(2 \, I) = j_I^(\( 3 \)) compose j_I^(\( 2 \)) . $
  The right-hand side is injective, so $k_(2 \, I)$ is injective as claimed. ◻
]

We can now bring the entire finite diagram back into a universal group.

#thm([Corollary 4.2.])[
  #emph[Let $U$ be a finitely presented group containing an isomorphic copy of every finitely presented group.
    There are an injective endomorphism $f : U arrow.r U$ and homomorphisms $h_(ell \, E) : U arrow.r
    U$ for $ell in { 2 \, 3 }$ and $E in cal(P)_ell$, with $h_(2 \, I) = h_(3 \, I) = f$,
    satisfying all the orthogonal commutation and sum identities of Proposition 6.]
] <prop:self-map>

#proof[
  Apply Proposition 6 to $U$. Since $hat(W)$ is finitely presented, universality supplies an embedding $kappa :
    hat(W) arrow.r U$. Set
  $ h_(ell \, E) = kappa compose k_(ell \, E) \, wide f = kappa compose k_(2 \, I) = kappa compose k_(3 \, I) . $
  The map $f$ is injective, and postcomposition by $kappa$ preserves every required identity and commutation relation. ◻
]

== 5 The ascending-torus theorem <sec:torus>

The finite diagrams constructed above will supply all the higher finiteness properties at once.
  We now state the theorem that makes this possible and give its proof,
  including the passage from homology to a classifying space with finite skeleta.
  This ascending-torus criterion and its homological construction are shared with the companion [9] Theorem 2.2
  and Sections 2.4–2.5.

For a group $U$ and an endomorphism $f : U arrow.r U$, define

$ T \( U \, f \) = chevron.l U \, t divides t^(- 1) u t = f \( u \) upright(" for all ") u in U chevron.r . $

This presentation includes all the relations of $U$. When $f$ is injective,
  it is the ascending HNN extension associated to $f$.

#thm([Theorem 5.1.])[
  (Ascending-torus theorem).  #emph[Let $U$ be a group and $f : U arrow.r U$ an injective endomorphism.
    Suppose that the following conditions hold.]
  + #emph[There are a finitely presented group $P$ and homomorphisms $a : U arrow.r P$ and $b : P arrow.r
    U$ such that $f = b a$.]
  + #emph[For each $ell in { 2 \, 3 }$ there are homomorphisms $h_(ell \, E) : U arrow.r U$,
    indexed by the finite set $E in cal(P)_ell$ defined above, with $h_(ell \, I) = f$.
    Whenever $E \, E' \, E + E' in cal(P)_ell$ and $E E' = E' E = 0$,
    the subgroups $h_(ell \, E) \( U \)$ and $h_(ell \, E') \( U \)$ commute elementwise, and
$ h_(ell \, E + E') \( u \) = h_(ell \, E) \( u \) h_(ell \, E') \( u \) wide \( u in U \) . $

]
  #emph[Then $U$ embeds naturally in $T \( U \, f \)$, and $T \( U \, f \)$ is of type $F_oo$.]
] <thm:torus>

The proof has three parts. First, factoring through a finitely presented group gives a finite presentation of the
  ascending torus. Second, the two idempotent diagrams give uniformly controlled fillings of ordinary integral
  cycles after applying an iterate of $f$. Finally, these fillings imply vanishing of homology with products of
  regular coefficient modules. A cellular argument then constructs one classifying space with finitely many cells
  in every dimension. No word-problem hypothesis is used in any of these steps.

#thm([Lemma 5.2.])[
  #emph[Suppose that $f = b a$ for homomorphisms $a : U arrow.r P$ and $b : P arrow.r U$,
    where $P$ is finitely presented. Then $T \( U \, f \)$ is finitely presented.
    This assertion does not require $f$ to be injective.]
] <lem:torus-presentation>

#proof[
  Put $g = a b : P arrow.r P$, and write $s$ for the stable letter of $T \( P \, g \)$.
    Define maps on the respective generating groups and stable letters by
  $ Phi : T \( U \, f \) & arrow.r T \( P \, g \) \, & u & mapsto a \( u \) \, & t & mapsto s \,\
Psi : T \( P \, g \) & arrow.r T \( U \, f \) \, & p & mapsto t b \( p \) t^(- 1) \, & s & mapsto t . $
  For the first map, $a f = g a$ verifies the defining conjugation relations.
    For the second, the image of $s^(- 1) p s$ is $b \( p \)$, whereas the image of $g \( p \)$ is
  $ t b \( g \( p \) \) t^(- 1) = t f \( b \( p \) \) t^(- 1) = b \( p \) . $
  Thus both are homomorphisms. Their composites fix the stable letters and satisfy
  $ Psi Phi \( u \) = t f \( u \) t^(- 1) = u \, wide Phi Psi \( p \) = s g \( p \) s^(- 1) = p . $
  Consequently $T \( U \, f \) tilde.equiv T \( P \, g \)$.
    If $P = chevron.l y_1 \, dots.h \, y_r divides R_1 \, dots.h \, R_m chevron.r$,
    choose a word $w_i$ representing $g \( y_i \)$ for each $i$. The finite presentation
  $ chevron.l y_1 \, dots.h \, y_r \, s divides R_1 \, dots.h \, R_m \, med s^(- 1) y_i s =
    w_i med \( 1 lt.eq i lt.eq r \) chevron.r $
  presents $T \( P \, g \)$. No injectivity of $g$ is required. ◻
]

The remaining task is therefore higher finiteness. The next section proves the uniform filling assertion;
  Section 7 uses it to complete the proof of Theorem 8.

== 6 Uniform fillings with finitely many simplex types <sec:fillings>

We now prove the chain-level part of Theorem 8. Its purpose is to obtain one iterate of $f$ and one finite set of
  allowable simplex types that fill every cycle of a specified dimension and input bound.
  The companion [9] Lemma 2.5 and Proposition 2.6 uses the same homological device.
  It requires neither uniformly short fillings nor an algorithm for finding them.

=== 6.1 The homogeneous complex and its bounds <the-homogeneous-complex-and-its-bounds>

Let $cal(E) \( U \)$ be the simplicial set whose $q$-simplices are all tuples $\( u_0 \, dots.h \, u_q \)$ of
  elements of $U$. Faces delete entries, and degeneracies repeat entries.
  Write $C_(*) \( U \)$ for its normalized integral chain complex.
  Thus its basis in degree $q$ consists of tuples with no two consecutive entries equal;
  a tuple with consecutive equal entries represents zero. The differential is zero in degree zero, and,
  for $q gt.eq 1$, it is

$ partial \( u_0 \, dots.h \, u_q \) = sum_(i = 0)^q \( - 1 \)^i \( u_0 \, dots.h \, hat(u_i) \, dots.h \, u_q \) . $

The augmentation $epsilon.alt : C_0 \( U \) arrow.r bb(Z)$ sends every vertex to one.
  Prepending the identity vertex contracts the augmented complex as a complex of abelian groups.
  Simultaneous left translation gives a free $U$-action on the normalized basis,
  so the augmented complex is also a free resolution of the trivial left $bb(Z) U$-module.
  The contraction need not be $U$-equivariant.

A #emph[bound] is a finite symmetric subset $A subset.eq U$ containing $1$.
  Let $cal(E)_A \( U \)$ be the simplicial subset of tuples with

$ u_i^(- 1) u_j in A wide upright("for all ") i \, j \, $

and denote its normalized chains by $C_(*)^A \( U \)$. The condition is preserved by deleting or repeating
  vertices, so this is a chain subcomplex. A reduced zero-cycle means an element of the kernel of $epsilon.alt$;
  in positive degree, “reduced cycle” means an ordinary cycle.

In each fixed degree, $C_(*)^A \( U \)$ has only finitely many basis elements up to left translation.
  Indeed, translating the first vertex to $1$ puts every remaining vertex in $A$.
  These orbits are the #emph[simplex types] of bound $A$. Notice the distinction:
  a bound restricts each simplex’s relative vertices, not the locations of its vertices in $U$,
  the number of simplices in a chain, or its integer coefficients.

A homomorphism of groups sends a finite bound to a finite bound.
  We say that a chain operator on $C_(*)^A \( U \)$ is #emph[controlled] through specified degrees if there is a
  finite bound containing every simplex in all of its output chains in those degrees.
  For finitely many operators and degrees, separate output bounds may be replaced by their union,
  with inverses and $1$ adjoined. For chains in $cal(E) \( U times U \)$,
  we will also use separate finite bounds in the two coordinates.

=== 6.2 A controlled additivity calculation <a-controlled-additivity-calculation>

Let $c : C_(*) \( U \) arrow.r C_(*) \( U \)$ denote the chain map of the constant vertex map $u mapsto 1$.
  Thus $c_0$ sends every vertex to $\( 1 \)$, and $c_q = 0$ for $q > 0$.
  The next lemma is an ordinary chain calculation: its homotopies are not required to commute with the $U$-action.

#thm([Lemma 6.1.])[
  #emph[Let $n gt.eq 1$, let $A$ be a bound, and let $f : U arrow.r U$ be an endomorphism.
    Suppose that, for some $k gt.eq 0$, the induced chain map $F = \( f^k \)_(*) : C_(*)^A \( U \) arrow.r
    C_(*) \( U \)$ has homomorphisms
$ H_q : C_q^A \( U \) arrow.r C_(q + 1) \( U \) wide \( 0 lt.eq q < n \) $

 whose output chains have a common finite bound and which satisfy
$ partial H_q + H_(q - 1) partial = F_q - c_q wide \( 0 lt.eq q < n \) \, $

 where $H_(- 1) = 0$ and the differential on $C_0$ is zero in this unaugmented equation.
   Let $h_1 \, h_2 : U arrow.r U$ be homomorphisms with elementwise commuting images, and put $h \( u \) =
   h_1 \( u \) h_2 \( u \)$. Then there is a finite bound $B$ such that every $n$-cycle $z in C_n^A \( U \)$ satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ \[ \( h f^k \)_(*) z \] = \[ \( h_1 f^k \)_(*) z \] + \[ \( h_2 f^k \)_(*) z \] quad
   upright("in ") H_n \( C_(*)^B \( U \) \) . $ <eq:controlled-additivity>]

 One bound $B$ may be chosen for any fixed finite collection of pairs $\( h_1 \, h_2 \)$ satisfying these hypotheses.]
] <lem:controlled-additivity>

#proof[
  Extend $H$ by zero in all degrees $q gt.eq n$, and define the chain map
  $ F' = F - partial H - H partial . $
  Then $F'_0 = c_0$ and $F'_q = 0$ for $1 lt.eq q < n$. The truncation $H_n = 0$ is important:
    if $z$ is an $n$-cycle, it gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ F' z = F z . $ <eq:truncated-homotopy>]
  Although the two maps need not agree on arbitrary $n$-chains, this equality is exactly what will be needed.
    A common finite output bound controls $F \, F'$ and $H$ in every degree used below;
    taking boundaries does not enlarge a bound.
  We use the classical Alexander–Whitney and shuffle comparison in the setting of Eilenberg–Zilber [3].
    We spell out the chain maps and their support control: the later product-module argument requires one finite
    set of simplex types across all coordinates. The Alexander–Whitney diagonal is
  #[#set math.equation(numbering: n => "(6.3)")
   $ D \( u_0 \, dots.h \, u_q \) = sum_(i = 0)^q \( u_0 \, dots.h \, u_i \) ⊗ \( u_i \, dots.h \, u_q \) .
     $ <eq:aw-diagonal>]
  We use the tensor differential
  $ partial \( a ⊗ b \) = partial a ⊗ b + \( - 1 \)^(deg a) a ⊗ partial b . $
  In the boundary of (6.3), terms on the two sides of an interior cut cancel,
    and the remaining terms give $D partial$. Thus $D$ is a chain map. It is well defined on normalized chains:
    if the input has consecutive equal vertices, every summand has a degenerate factor.
    Both tensor factors retain the input bound.
  The shuffle map
  $ S : C_(*) \( U \) ⊗ C_(*) \( U \) arrow.r C_(*) \( U times U \) $
  sends $\( u_0 \, dots.h \, u_p \) ⊗ \( v_0 \, dots.h \, v_q \)$ to the signed sum over monotone lattice paths
    from $\( 0 \, 0 \)$ to $\( p \, q \)$. A path contributes the tuple obtained by replacing each of its vertices
    $\( i \, j \)$ by $\( u_i \, v_j \)$. Its sign is $\( - 1 \)^N$,
    where $N$ counts pairs of steps in which a vertical step precedes a horizontal step.
    In its boundary, deleting a corner pairs two paths that traverse the corner in opposite orders;
    these contributions cancel. The remaining faces are precisely the shuffle of the tensor differential,
    so $S$ is a chain map. If either input is degenerate, every path has a step with identical endpoint pairs and
    hence gives a degenerate output. The map therefore descends to normalized chains and preserves the bound in
    each coordinate.
  Write $Delta$ for the chain map of the diagonal homomorphism $U arrow.r U times U$.
    There is a chain homotopy $R$ satisfying
  #[#set math.equation(numbering: n => "(6.4)")
   $ partial R + R partial = Delta - S D $ <eq:diagonal-homotopy>]
  and preserving the bound in both coordinates. Here is a direct construction that also verifies this control.
    On vertices take $R_0 = 0$, since $Delta$ and $S D$ agree there.
    Suppose $R$ has been defined in lower degrees, and let $a = \( u_0 \, dots.h \, u_q \)$ be a normalized basis
    simplex of positive degree, with vertex set $V$. The chain
  $ Delta a - S D a - R partial a $
  is a cycle: apply the previously established homotopy equation to $partial a$.
    It lies in the full tuple complex on $V times V$. That complex is contracted by prepending any fixed vertex,
    so prepending $\( u_0 \, u_0 \)$ fills the displayed cycle.
    Choose this filling as $R \( a \)$ and extend linearly on the normalized basis.
    Every coordinate vertex in this construction belongs to $V$, which proves the claimed bound.
    This construction takes place on the normalized basis; degenerate faces have already been set to zero.
  Apply (6.4) after $F$. Naturality of $D$ for the vertex map $f^k$ gives a controlled chain homotopy from $Delta
    F$ to $S \( F ⊗ F \) D$. To replace $F$ by $F'$, use the degree-one tensor operator $K$ defined on homogeneous
    tensors by
  #[#set math.equation(numbering: n => "(6.5)")
   $ K \( a ⊗ b \) = H \( a \) ⊗ F \( b \) + \( - 1 \)^(deg a) F' \( a \) ⊗ H \( b \) . $ <eq:tensor-homotopy-signs>]
  The tensor differential and the chain-map identities for $F \, F'$ give
  $ partial K + K partial & = \( F - F' \) ⊗ F + F' ⊗ \( F - F' \)\
 & = F ⊗ F - F' ⊗ F' . $
  In particular the sign in the second term of (6.5) cannot be dropped.
    The operator $S K D$ is controlled separately in both coordinates:
    it uses only the already controlled maps $F \, F' \, H$ and the bound-preserving maps $D \, S$.
    No equivariance of $H$ enters this calculation. Explicitly, the composite homotopy $L = R F + S K D$ satisfies
  $ partial L + L partial = Delta F - S \( F' ⊗ F' \) D . $
  Let $z$ be an $n$-cycle. Since $F'$ vanishes in degrees $1 \, dots.h \, n - 1$,
    only the terms of bidegrees $\( 0 \, n \)$ and $\( n \, 0 \)$ survive in $\( F' ⊗ F' \) D z$.
    The degree-zero factor always maps to $\( 1 \)$. Summing the endpoint terms over the whole cycle first,
    and then using (6.2), gives
  $ \( F' ⊗ F' \) D z & = \( 1 \) ⊗ F' z + F' z ⊗ \( 1 \)\
 & = \( 1 \) ⊗ F z + F z ⊗ \( 1 \) . $
  This also covers $n = 1$, when there are no intermediate bidegrees.
    Shuffling a vertex against a chain simply holds that coordinate fixed.
  Finally, commuting images make
  $ m : U times U arrow.r U \, wide m \( u \, v \) = h_1 \( u \) h_2 \( v \) $
  a homomorphism. If two pairs have coordinate differences in $B_1$ and $B_2$,
    their image difference belongs to $h_1 \( B_1 \) h_2 \( B_2 \)$.
    Indeed, the factors from the two image subgroups commute, allowing the two differences to be grouped.
    This finite set is symmetric and contains $1$. Thus applying $m_(*)$ to all the preceding homotopies retains
    finite control and proves (6.1): the finite chain $m_(*) L
    z$ fills the difference of its left- and right-hand cycle representatives.
    For a finite collection of pairs, take the union of the finitely many resulting output bounds. ◻
]

=== 6.3 One iterate fills every cycle of a fixed bound <one-iterate-fills-every-cycle-of-a-fixed-bound>

We now combine the additivity calculation with the two finite idempotent systems.
  The exponent and the output bound in the next statement are chosen before the input cycle,
  which is the uniformity needed when passing later to products of coefficient modules.

#thm([Proposition 6.2.])[
  #emph[Assume the hypotheses of Theorem 8. For every finite bound $A subset.eq U$ and every integer $n gt.eq 0$,
    there are an integer $k gt.eq 0$ and a finite bound $B subset.eq U$ such that,
    for every reduced integral $n$-cycle $z in C_n^A \( U \)$,
    there is a finite chain $y in C_(n + 1)^B \( U \)$ satisfying
$ partial y = \( f^k \)_(*) z . $

 The chain $y$ may depend on $z$, with no uniform restriction on its length or coefficients.]
] <prop:uniform-fillings>

#proof[
  We argue by induction on $n$. By the finite-presentation factorization $f = b a$ in Theorem 8,
    the subgroup $b \( P \)$ is finitely generated and contains $f \( U \)$.
    Choose a finite symmetric generating set $S$ for $b \( P \)$, with $1$ adjoined.
    For every $u in U$, choose a finite edge path from $1$ to $f \( u \)$ whose consecutive differences belong to
    $S$. Its chain $H_0 \( u \)$ satisfies
  $ partial H_0 \( u \) = \( f \( u \) \) - \( 1 \) . $
  Extend $H_0$ linearly. For a reduced zero-cycle $z$, the constant vertex terms cancel, so $partial H_0 \( z \) =
    f_(*) z$. All these paths use the same bound $S$, even though their lengths can be arbitrarily large.
    This proves the assertion for $n = 0$.
  Suppose $n gt.eq 1$ and the assertion holds in all degrees less than $n$, for every finite input bound.
    We first construct the partial controlled homotopy in Lemma 10 on $C_(*)^A \( U \)$.
    Start with $F = f_(*)$ and the vertex paths just chosen, which give its homotopy to the constant map in degree zero.
  Suppose, for some $1 lt.eq q < n$, that $F = \( f^k \)_(*)$ and controlled operators $H_0 \, dots.h \,
    H_(q - 1)$ have already been constructed with
  $ partial H_i + H_(i - 1) partial = F_i - c_i wide \( 0 lt.eq i < q \) . $
  For each normalized basis $q$-simplex $a in C_q^A \( U \)$, the next homotopy equation asks us to fill
  #[#set math.equation(numbering: n => "(6.6)")
   $ F \( a \) - H_(q - 1) \( partial a \) . $ <eq:partial-homotopy-obstruction>]
  This is a $q$-cycle. Its boundary is zero by the preceding homotopy equation applied to $partial a$;
    the remaining constant-map term $c_(q - 1) \( partial a \)$ is zero, also when $q =
    1$ because the augmentation of a boundary is zero. Moreover, all these cycles have one common finite bound,
    independent of the basis simplex $a$: the current $F$ sends $A$ to a finite bound and $H_(q - 1)$ is controlled.
  Apply the induction assertion in degree $q$ to this common bound.
    It supplies an integer $r gt.eq 0$ and another common finite bound such that $\( f^r \)_(*)$ sends every cycle
    (6.6) to a boundary there. Postcompose $F$ and the already chosen $H_i$ by $\( f^r \)_(*)$.
    The existing homotopy equations remain valid, since $f^r \( 1 \) = 1$.
    For each basis simplex choose a finite filling of its newly mapped cycle and use that filling as
    $H_q \( a \)$. Linear extension defines a controlled homomorphism $H_q$, and the next homotopy equation now holds.
  There are only finitely many degrees $q < n$, so this process ends with one power $f^k$ and a controlled
    homotopy to the constant map through degrees less than $n$.
    For $n = 1$ the initial vertex homotopy already suffices.
    None of these choices is required to be equivariant or computable.
    In particular, we do not choose one filling on each orbit and then translate it.
    Uniformity instead comes from the induction assertion applying at each step to #emph[every] cycle in a single
    bounded complex.
  Apply Lemma 10 to every orthogonal relation in both $cal(P)_2$ and $cal(P)_3$.
    There are only finitely many relations, so there is one finite output bound $B$ for all of them;
    enlarge it if necessary to contain the images of the input bound under every $h_(ell \, E) f^k$.
    For a fixed $n$-cycle $z$, write
  $ z_(ell \, E) = \[ \( h_(ell \, E) f^k \)_(*) z \] in H_n \( C_(*)^B \( U \) \) . $
  For each $ell in { 2 \, 3 }$, the commuting-image and orthogonal-sum identities, together with Lemma 10, give
  $ z_(ell \, E + P') = z_(ell \, E) + z_(ell \, P') $
  for every orthogonal triple in that finite system. Here the three maps in each relation are evaluated on the
    common input $f^k \( u \)$. The two full-identity classes agree because both systems have $h_(ell \, I) = f$:
  $ z_I := z_(2 \, I) = z_(3 \, I) = \[ \( f^(k + 1) \)_(*) z \] . $
  By Lemma 5, this single class is annihilated by both $2$ and $3$. Hence it is zero, since $z_I = 3 z_I - 2 z_I$.
    It therefore has a finite filling in $C_(*)^B \( U \)$. The exponent $k +
    1$ and the bound $B$ were chosen independently of $z$, proving the required assertion in degree $n$ and
    completing the induction. ◻
]

Proposition 11 is a statement about ordinary integral chains with uniform finite simplex types.
  Its homotopies need not be equivariant, and it asserts no decision procedure for the word problem of $U$.
  The next step uses precisely this form of control to assemble coordinatewise fillings with product coefficients.

== 7 From controlled fillings to finite skeleta <sec:products>

Proposition 11 concerns ordinary integral chains. We will apply it coordinate by coordinate to products of regular
  modules, keeping the finite set of simplex types common to all coordinates.
  We first explain why the resulting homology vanishing yields geometric, rather than merely homological, finiteness.

All coefficient modules in this section are right modules, and all group homology is integral.
  For a group $J$ and a set $cal(I)$, write $\( bb(Z) J \)^(cal(I))$ for the direct #emph[product] of copies of
  the right regular module, with coordinatewise action.

=== 7.1 A geometric product-module criterion <a-geometric-product-module-criterion>

The following argument combines the product-module finiteness method of Bieri–Eckmann and Brown [1,2] with the
  cellular passage to geometric finiteness. We give the argument in the form needed here,
  including its finite-presentation hypothesis.

#thm([Lemma 7.1.])[
  #emph[Let $J$ be a finitely presented group. If
$ H_n #scale(x: 120%, y: 120%)[\(] J \, \( bb(Z) J \)^(cal(I)) #scale(x: 120%, y: 120%)[\)] = 0 wide
  upright("for every set ") cal(I) upright(" and every ") n gt.eq 2 \, $

 then $J$ is of type $F_oo$.]
] <lem:product-criterion>

#proof[
  We construct nested, $n$-dimensional CW complexes $X_n$, for $n gt.eq 2$, with fundamental group $J$,
    finite $n$-skeleton, and $\( n - 1 \)$-connected universal cover.
    Each passage from $X_n$ to $X_(n + 1)$ will attach finitely many $\( n + 1 \)$-cells.
    A finite presentation complex supplies $X_2$.
  Suppose that $X_n$ has been constructed, and put $Z = tilde(X)_n$.
    Thus $Z$ is an $n$-dimensional, $\( n - 1 \)$-connected free $J$-complex.
    By successively attaching $J$-orbits of cells of dimensions at least $n + 1$ to kill its homotopy groups,
    extend $Z$ to a contractible free $J$-complex $Y$. There is no finiteness requirement on these auxiliary
    attachments. Put $R = bb(Z) J$. The augmented cellular chain complex $C_(*) \( Y \)$ is a free left
    $R$-resolution of $bb(Z)$, and $C_q \( Y \) = C_q \( Z \)$ is a finite-rank free $R$-module for $q lt.eq n$.
  Let $cal(I)$ be the set of all cellular $n$-cycles of $Z$, and let $M = R^(cal(I))$.
    If $C$ is a finite-rank free left $R$-module, the coordinate map is an isomorphism
  #[#set math.equation(numbering: n => "(7.1)")
   $ M ⊗_R C arrow.r C^(cal(I)) \, wide \( m_z \)_(z in cal(I)) ⊗ c mapsto \( m_z c \)_(z in cal(I)) .
     $ <eq:finite-rank-product-tensor>]
  Using this identification in degrees $n$ and $n - 1$, the family whose $z$-coordinate is the cycle $z$ defines a
    cycle $xi in M ⊗_R C_n \( Y \)$. The hypothesis $H_n \( J \, M \) = 0$ gives
  $ xi = partial y wide upright("for some ") y in M ⊗_R C_(n + 1) \( Y \) . $
  Choose a free $R$-basis of $C_(n + 1) \( Y \)$. A tensor is a finite sum,
    and each chain uses only finitely many basis elements. Consequently we can write
  $ y = sum_(j = 1)^s m_j ⊗ c_j $
  using finitely many basis elements $c_1 \, dots.h \, c_s$,
    even though $C_(n + 1) \( Y \)$ need not have finite rank. Taking the $z$-coordinate of the boundary equation gives
  $ z = sum_(j = 1)^s \( m_j \)_z thin partial c_j . $
  Thus the module of cellular $n$-cycles in $Z$ is generated over $R$ by $partial c_1 \, dots.h \, partial c_s$.
  Because $Z$ is $\( n - 1 \)$-connected and $n gt.eq 2$, the natural Hurewicz map $pi_n \( Z \) arrow.r
    H_n \( Z \; bb(Z) \)$ is an isomorphism [5] Theorem 4.37 and p. 370.
    Naturality with respect to deck transformations makes it an isomorphism of $R$-modules,
    using the canonical change of basepoint in the simply connected space $Z$.
    Since $Z$ has no $\( n + 1 \)$-cells, its $n$th homology is its module of cellular $n$-cycles.
    Choose maps of $n$-spheres representing the displayed finite list of generators,
    and attach their $J$-translates to $Z$. Downstairs this attaches finitely many $\( n + 1 \)$-cells to $X_n$;
    upstairs the resulting complex is $n$-connected. It is the universal cover of the resulting complex
    $X_(n + 1)$, since cells of dimension at least three do not change the fundamental group.
    This completes the induction.
  Let $X = union.big_(n gt.eq 2) X_n$. It has fundamental group $J$ and finitely many cells in every dimension.
    The universal cover of $X$ is weakly contractible. It is connected and simply connected, and for $q gt.eq 2$,
    cellular approximation [5] Theorem 4.8 homotopes any map $S^q arrow.r
    tilde(X)$ into the $q$-skeleton of $tilde(X)$, which is already present in $tilde(X)_q$.
    That class is killed in $tilde(X)_(q + 1)$. A weakly contractible CW complex is contractible by Whitehead’s
    theorem [5] Theorem 4.5, so $X$ is a $K \( J \, 1 \)$. ◻
]

=== 7.2 The ascending HNN sequence <the-ascending-hnn-sequence>

For the rest of the section assume the hypotheses of Theorem 8, and set $J = T \( U \, f \)$.
  We will compute the homology in Lemma 12 using a tree for $J$.
  We give the construction explicitly to fix the direction of the coefficient map.

Form the direct limit

$ L = "inj lim" #scale(x: 120%, y: 120%)[\(] U arrow.r^f U arrow.r^f U arrow.r^f dots.h.c
  #scale(x: 120%, y: 120%)[\)] \, $

and denote its stage maps by $iota_i : U arrow.r L$, for $i gt.eq 0$. They satisfy $iota_i = iota_(i + 1) f$.
  Since $f$ is injective, each $iota_i$ is injective and $L =
  union.big_(i gt.eq 0) iota_i \( U \)$ is an increasing union. The map

$ sigma #scale(x: 120%, y: 120%)[\(] iota_i \( u \) #scale(x: 120%, y: 120%)[\)] = iota_(i + 1) \( u \) $

is an automorphism: its inverse sends $iota_i \( u \)$ to $iota_i \( f \( u \) \)$.
  In the semidirect product adjoining a letter $t$ with $t x t^(- 1) = sigma \( x \)$ for $x in L$, we have

$ t^(- 1) iota_0 \( u \) t = iota_0 \( f \( u \) \) . $

This gives a homomorphism from $J$ to that semidirect product.
  Conversely, the maps $iota_i \( u \) mapsto t^i u t^(- i)$ are compatible with the direct system and with
  $sigma$, and give the inverse homomorphism. Thus $U$ embeds in $J$.
  The same description shows that every element of $J$ can be written

#[#set math.equation(numbering: n => "(7.2)")
 $ t^p u t^(- q) \, wide u in U \, quad p \, q gt.eq 0 . $ <eq:ascending-normal-form>]

Indeed, an element of $L times.r chevron.l t chevron.r$ has the form $iota_p \( u \) t^m$;
  increasing $p$ if necessary makes $q = p - m$ nonnegative.

Consider the graph whose vertices and oriented edges are both indexed by the left cosets $j U$,
  with the edge indexed by $j U$ running from $j U$ to $j t U$. The terminal vertex is well defined because

#[#set math.equation(numbering: n => "(7.3)")
 $ u t = t f \( u \) wide \( u in U \) . $ <eq:ascending-commutation>]

The homomorphism $J arrow.r bb(Z)$ that kills $U$ and sends $t$ to $1$ defines a height on the vertices.
  Each edge increases height by one, and each vertex has exactly one outgoing edge.
  If $j = t^p u t^(- q)$ is as in (7.2), the forward path of length $q$ from $j U$ reaches $t^p U$.
  Every forward ray therefore meets the ray $U \, t U \, t^2 U \, dots.h$, proving connectedness.
  An undirected cycle would have a vertex of least height with two outgoing edges, which is impossible.
  The graph is a tree. Left multiplication gives a $J$-action with one vertex orbit and one edge orbit,
  and both the chosen vertex $U$ and the chosen edge from $U$ to $t U$ have stabilizer $U$.

Let $C_(*) \( U \)$ be the normalized homogeneous resolution introduced in the preceding section.
  Since $bb(Z) J$ is free as a right $bb(Z) U$-module, induction preserves its exactness.
  We obtain the free left $bb(Z) J$-resolution

$ P_(*) = bb(Z) J ⊗_(bb(Z) U) C_(*) \( U \) $

of the permutation module $bb(Z) \[ J \/ U \]$. The two endpoint maps on this resolution are the identity and the map

$ E \( j ⊗ c \) = j t ⊗ f_(*) \( c \) . $

The second is well defined: for $u in U$,

$ j u t ⊗ f_(*) \( c \) = j t f \( u \) ⊗ f_(*) \( c \) = j t ⊗ f_(*) \( u c \) . $

It is a left $bb(Z) J$-linear chain map, lifting the terminal-vertex map $j U mapsto j t U$.

The mapping cone of $1 - E : P_(*) arrow.r P_(*)$, with its natural augmentation,
  is a free left $bb(Z) J$-resolution of $bb(Z)$. To see exactness, first take the homology of $P_(*)$:
  it is concentrated in degree zero and equal to $bb(Z) \[ J \/ U \]$.
  The remaining two-term complex is the augmented cellular chain complex of the tree, which is exact.
  Equivalently, the long exact sequence of the cone identifies its homology with that of this two-term complex.

For an arbitrary right $bb(Z) J$-module $M$, tensoring this free resolution with $M$ yields the long exact sequence

#[#set math.equation(numbering: n => "(7.4)")
 $ H_n \( U \, M \) & arrow.r^(thin 1 - F thin) H_n \( U \, M \) arrow.r H_n \( J \, M \)\
 & arrow.r H_(n - 1) \( U \, M \) arrow.r^(thin 1 - F thin) H_(n - 1) \( U \, M \) \, $ <eq:ascending-hnn-homology>]

where $M$ is restricted to $U$ in the outer terms. On the chain complex $M ⊗_(bb(Z) U) C_(*) \( U \)$, the map $F$ is

#[#set math.equation(numbering: n => "(7.5)")
 $ F \( m ⊗ c \) = m t ⊗ f_(*) \( c \) . $ <eq:coefficient-shift>]

In particular the coefficient multiplier is $t$, not $t^(- 1)$.

=== 7.3 Products of regular modules <products-of-regular-modules>

Fix any set $cal(I)$ and take $M = \( bb(Z) J \)^(cal(I))$.
  We claim that $F$ induces a locally nilpotent endomorphism of $H_i \( U \, M \)$ for every $i > 0$:
  each individual homology class is killed by some power of $F$.

Recall that a bound is a finite symmetric subset $A subset.eq U$ containing $1$,
  and $C_q^A \( U \)$ is generated by the normalized tuples $\( u_0 \, dots.h \, u_q \)$ with $u_i^(- 1) u_j in
  A$ for all $i \, j$. Let $cal(S)_q \( A \)$ be their finite set of types up to left translation.
  The first vertex can be translated to $1$, after which all other vertices lie in $A$, proving finiteness.
  As $C_q^A \( U \)$ is free over $bb(Z) U$ on these types, there are natural identifications

#[#set math.equation(numbering: n => "(7.6)")
 $ M ⊗_(bb(Z) U) C_q^A \( U \) & tilde.equiv xor.big_(s in cal(S)_q \( A \)) M\
 & tilde.equiv product_(alpha in cal(I)) (xor.big_(s in cal(S)_q \( A \)) bb(Z) J) . $ <eq:bounded-product-chains>]

The second equality interchanges a product with a #emph[finite] direct sum;
  no analogous interchange with an infinite direct sum is being used.

Here is a concrete interpretation of (7.6). The free abelian basis of $bb(Z) J ⊗_(bb(Z) U)
  C_q^A \( U \)$ consists of normalized tuples with $u_0 \, dots.h \, u_q in U$ of the form

$ \( j u_0 \, dots.h \, j u_q \) \, wide j in J \, quad u_a^(- 1) u_b in A upright(" for all ") a \, b . $

Each tuple lies in one left coset of $U$. Expanding the group-ring coefficients, a tensor chain therefore gives,
  in each coordinate $alpha$, a finite ordinary integral chain in such coset tuples.
  There is one bound $A$ for every coordinate. Conversely, any family of coordinatewise finite chains with a
  common bound defines a tensor chain by (7.6). Their lengths, coefficients,
  and group-ring supports need not admit any bound independent of $alpha$.

Every chain in $M ⊗_(bb(Z) U) C_q \( U \)$ uses finitely many simplex types and consequently belongs to a bounded
  subcomplex of this form. Indeed, take the union of the finitely many relative vertex differences in its tensor
  factors, then add their inverses and $1$. The inclusion of this bounded complex is injective degree by degree,
  since its types are a subset of the free basis of $C_q \( U \)$.

Now let $z in M ⊗_(bb(Z) U) C_i \( U \)$ be a cycle, where $i > 0$, and choose one input bound $A$ for it.
  In each coordinate $alpha$, split its ordinary chain into its finitely many left-coset components.
  Each component is a cycle, since the boundary preserves the coset and the coset chain groups form a direct sum.
  Choose an origin $j$ in each nonzero component’s coset. Left translation by $j^(- 1)$ identifies the component
  with an ordinary cycle in $C_i^A \( U \)$.

Proposition 11 supplies an exponent $k gt.eq 0$ and a finite output bound $B$ that work for #emph[every] such
  cycle, in every coordinate and every coset. By (7.5), the map $F^k$ changes the origin $j$ to $j
  t^k$ and applies $f^k$ to the relative vertices. Indeed, on tuples the single-step formula is simply

$ \( j u_0 \, dots.h \, j u_i \)
  mapsto \( j t f \( u_0 \) \, dots.h \, j t f \( u_i \) \) = \( j u_0 t \, dots.h \, j u_i t \) . $

This also verifies that the formula is independent of the chosen origin.

For each component, choose an ordinary finite filling of its relative image under $f^k$ in $C_(i + 1)^B \( U \)$,
  and translate this filling by $j t^k$. Sum the fillings within each coordinate.
  The result is still finite in that coordinate because there were only finitely many nonzero coset components.
  Different input cosets may have the same output coset; in that case their fillings are simply added.
  Across all coordinates the bound is still the single finite set $B$.
  Equation (7.6) therefore assembles these fillings into a chain

$ y in M ⊗_(bb(Z) U) C_(i + 1)^B \( U \) . $

The boundary and $F^k z$ lie in the bounded complex for $D = B union f^k \( A \)$,
  a finite symmetric set containing $1$. They agree in every coordinate by construction.
  The coordinate identification (7.6) for $D$ is injective, so $partial y = F^k z$ in the tensor complex.
  Thus $F^k \[ z \] = 0$, proving the claimed local nilpotence.
  This argument uses ordinary fillings chosen separately in each coset;
  it requires no equivariance of the homotopies or fillings in Proposition 11.

=== 7.4 Completion of the torus theorem <completion-of-the-torus-theorem>

If an endomorphism $F$ of an abelian group is locally nilpotent, then $1 - F$ is invertible.
  On an element $x$, its inverse is

$ x + F x + F^2 x + dots.h.c \, $

where only finitely many terms are nonzero. The sum defines a homomorphism,
  and telescoping verifies both inverse identities. It follows that the two maps $1 -
  F$ adjacent to $H_n \( J \, M \)$ in (7.4) are isomorphisms for $n gt.eq 2$. Exactness gives

$ H_n #scale(x: 120%, y: 120%)[\(] J \, \( bb(Z) J \)^(cal(I)) #scale(x: 120%, y: 120%)[\)] = 0 wide \( n gt.eq 2 \) . $

Only positive-degree local nilpotence was needed: no assertion about $H_0 \( U \, M \)$ enters this conclusion.

By Lemma 9, $J$ is finitely presented. The set $cal(I)$ was arbitrary,
  so Lemma 12 proves that $J$ is of type $F_oo$. The direct-limit construction already proved that $U$ embeds in
  $J$. This completes the proof of Theorem 8.

== 8 Proof of the embedding theorem <sec:assembly>

We now combine the finite-presentation construction with the geometric criterion.

#proof[
  Let $U$ be the universal finitely presented group supplied by Lemma 4.
    Corollary 7 gives an injective endomorphism $f : U arrow.r U$ and, for each $ell in { 2 \, 3 }$,
    homomorphisms $h_(ell \, E) : U arrow.r U$ indexed by $E in cal(P)_ell$.
    Their full-identity maps are both $f$, and they satisfy all the elementwise commutation and orthogonal-sum
    identities in Theorem 8.
  The factorization hypothesis of that theorem is automatic here: take $P = U$, $a = "id"_U$, and $b = f$.
    Hence $H = T \( U \, f \)$ has type $F_oo$. Since $f$ is injective, the natural map $U arrow.r
    H$ is injective, as established in Section 7. For every finitely presented group $G$,
    choose an embedding $G arrow.r U$. Its composite with $U arrow.r H$ is the required embedding.
    The construction of $H$ is independent of this last choice and of $G$. ◻
]

The construction isolates a useful distinction: finite presentation is needed for the universal group and its
  diagram envelope, while the faithful models in tensor product algebras are used only to prove injectivity.
  The higher-dimensional finiteness is obtained afterwards, from the two finite systems and one ascending HNN extension.

#heading(level: 1)[References]
#bibitem([1])[Robert Bieri and Beno Eckmann, #emph[Finiteness properties of duality groups],
  Commentarii Mathematici Helvetici #strong[49] (1974), 74--83.
  #link("https://doi.org/10.1007/BF02566720")[doi:10.1007/BF02566720].]
#bibitem([2])[Kenneth S.~Brown, #emph[Homological criteria for finiteness],
  Commentarii Mathematici Helvetici #strong[50] (1975), 129--135.
  #link("https://doi.org/10.1007/BF02565740")[doi:10.1007/BF02565740].]
#bibitem([3])[Samuel Eilenberg and J.~A.~Zilber, #emph[On products of complexes],
  American Journal of Mathematics #strong[75] (1953), no.~1, 200--204.
  #link("https://doi.org/10.2307/2372629")[doi:10.2307/2372629].]
#bibitem([4])[Francesco Fournier-Facio and Matthew C.~B.~Zaremsky,
  #emph[Finiteness properties and Higman's rope trick], preprint, 2026,
  #link("https://arxiv.org/abs/2607.21727v1")[arXiv:2607.21727v1].]
#bibitem([5])[Allen Hatcher, #emph[Algebraic Topology], Cambridge University Press, 2002.
  #link("https://pi.math.cornell.edu/~hatcher/AT/ATpage.html").]
#bibitem([6])[Graham Higman, #emph[Subgroups of finitely presented groups], Proc. Roy. Soc. London Ser.
  A #strong[262] (1961), 455--475. #link("https://doi.org/10.1098/rspa.1961.0132")[doi:10.1098/rspa.1961.0132].]
#bibitem([7])[Graham Higman, B.~H.~Neumann and Hanna Neumann, #emph[Embedding theorems for groups], J.
  London Math. Soc. #strong[24] (1949), no.~4, 247--254.
  #link("https://doi.org/10.1112/jlms/s1-24.4.247")[doi:10.1112/jlms/s1-24.4.247].]
#bibitem([8])[Ian J.~Leary, #emph[Subgroups of almost finitely presented groups], Math. Ann.
  #strong[372] (2018), 1383--1391. #link("https://doi.org/10.1007/s00208-018-1689-5")[doi:10.1007/s00208-018-1689-5].]
#bibitem([9])[OpenAI, #emph[Simple $F_oo$ overgroups of groups with decidable word problem],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Simple-F-infinity-overgroups-of-groups-with-decidable-word-problem-September-23-2026/paper.pdf")[OAI:Simple-F-infinity-overgroups-of-groups-with-decidable-word-problem-September-23-2026],
  2026.]
