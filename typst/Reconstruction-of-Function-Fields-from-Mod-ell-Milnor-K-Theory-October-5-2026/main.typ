#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Reconstruction of Function Fields \
from Mod-$ell$ Milnor $K$-Theory]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Birational anabelian geometry asks how much of a function field can be recovered from its Galois-theoretic invariants. In the Bogomolov program, the field has algebraically closed constants, and the relevant invariants are much smaller than the full absolute Galois group. The present paper proves the reconstruction assertion for the first two Milnor $K$-groups modulo a single prime, with their multiplication. The result includes the isomorphism statement: it identifies every compatible linear isomorphism, as well as the ambiguity in the field isomorphism that induces it.

=== 1.1 The reconstruction theorem <the-reconstruction-theorem>

Fix a prime $ell$ and put $Lambda = bb(F)_ell$. For a field $F$ of characteristic different from $ell$, set

$ V_F = F^times \/ \( F^times \)^ell \, #h(2em) R_F = "span"_Lambda { \[ x \] ⊗ \[ 1 - x \] : x in F \\ { 0 \, 1 } } . $

We write $V_F$ additively, so $\[ x y \] = \[ x \] + \[ y \]$. Let

$ W_F = \( V_F ⊗_Lambda V_F \) \/ R_F \, #h(2em) m_F : V_F ⊗_Lambda V_F arrow.r W_F . $

Thus $V_F = K_1^(upright(M)) \( F \) \/ ell$ and $W_F = K_2^(upright(M)) \( F \) \/ ell$, with $m_F$ the Milnor product. A $Lambda$-linear isomorphism $Theta : V_K arrow.r V_L$ is #emph[compatible] if

$ \( Theta ⊗ Theta \) \( R_K \) = R_L . $

Equivalently, there is a unique linear isomorphism $Theta_2 : W_K arrow.r W_L$ intertwining the products. Write $"Isom"_(upright(M)) \( V_K \, V_L \)$ for the set of compatible isomorphisms. Multiplication by $a in Lambda^times$ acts on this set; the induced degree-two map is then multiplied by $a^2$.

Let $K \/ k$ and $L \/ l$ be finitely generated extensions of algebraically closed fields. Write $F^i$ for the perfect closure of a field $F$: it equals $F$ in characteristic zero and $union.big_(r gt.eq 0) F^(1 \/ p^r)$ in characteristic $p > 0$. Denote by $"Isom"^i \( K \, L \)$ the field isomorphisms $alpha : K^i arrow.r L^i$ satisfying $alpha \( k \) = l$. In positive characteristic, identify two such isomorphisms if they differ by postcomposition with $"Frob"_L^n$, $n in bb(Z)$, where $"Frob"_L \( z \) = z^p$. Denote the resulting set by $"Isom"_(upright(F))^i \( K \, L \)$; in characteristic zero take no quotient, and if the characteristics differ this set is empty.

Purely inseparable extension induces canonical isomorphisms on $V$ and $W$. Indeed, for an extension of exponent at most $r$, inclusion and the $p^r$-power homomorphism compose to the $p^r$-power map on each field. On Milnor groups in degrees one and two this composition is multiplication by $p^r$ and $p^(2 r)$, respectively, both invertible modulo $ell$. Passing to the union proves the assertion for perfect closures. Thus $alpha$ induces a compatible map $alpha_1 : V_K arrow.r V_L$, and postcomposition by $"Frob"_L^n$ multiplies it by $p^n$ in $Lambda^times$. There is consequently a canonical map

#[#set math.equation(numbering: n => "(1.1)")
 $ "Isom"_(upright(F))^i \( K \, L \) arrow.r "Isom"_(upright(M)) \( V_K \, V_L \) \/ Lambda^times . $ <eq:main-map>]

#thm([Theorem 1.1.])[
  #emph[Let $ell$ be any prime. Let $K \/ k$ and $L \/ l$ be finitely generated extensions of arbitrary algebraically closed fields, with $"char" k \, "char" l eq.not ell$ and $"trdeg" \( K \/ k \) \, "trdeg" \( L \/ l \) gt.eq 2$. Then (1.1) is bijective. In particular, a compatible isomorphism $V_K arrow.r V_L$ forces equality of the characteristics and of the relative transcendence degrees.]
] <thm:main>

Only the two vector spaces and their bilinear product enter this statement. The proof recovers the valuations and rational-subfield images needed for reconstruction from this datum. The scalar is one global element of $bb(F)_ell^times$; at $ell = 2$ this ambiguity is trivial.

=== 1.2 Historical context <historical-context>

Bogomolov proposed reconstructing higher-dimensional function fields over algebraically closed constants from the pro-$ell$ quotient in which commutators are central [1]. Bogomolov and Tschinkel proved reconstruction for surfaces over algebraic closures of finite fields [2], and subsequently for higher-dimensional function fields over those constants [4]. Pop independently completed reconstruction in this constant-field setting [7]. These results established that a small part of the Galois group can retain the geometry needed to recover a field. Over more general algebraically closed constants, Pop also obtained reconstruction from pro-$ell$ data endowed with divisorial inertia, in relative transcendence degree greater than two [9] Theorem 1.1.

The finite-coefficient problem requires additional control of the global reconstruction. Topaz proved a Milnor-theoretic isomorphism theorem in relative transcendence degree at least five when the degree-one and degree-two mod-$ell$ groups and their product are supplied together with all rational subgroups [12] Theorem B. Those subgroups are the images of the multiplicative groups of relatively algebraically closed rational one-variable subfields. Theorem 1 obtains the required rational subfields from the product itself, and its point-value argument applies in every relative dimension at least two.

Algebraic dependence has provided another route from multiplicative invariants to field structure. Bogomolov and Tschinkel used Milnor $K$-theory modulo infinitely divisible elements in characteristic zero [3]. Cadoret and Pirutka reconstructed regular function fields over perfect constants from the multiplicative quotient by constants together with algebraic dependence, and derived applications to integral Milnor $K$-theory [5]. Topaz later proved reconstruction from rational Milnor $K$-theory in absolute transcendence degree at least five [15]. These results clarify the role of algebraic dependence, while using invariants different from the single-prime datum considered here.

Our local inputs are the alternating-pair valuation theory recorded in [13] Section 2 and Pop’s density theorem for minimized inertia [8]. We state the precise forms used below. The bounded-support and incidence method is adapted from [6] Sections 4–6. The finite-coefficient bounded-support and incidence arguments are proved here. The support estimate also has an antecedent in the bounded-genus curve sections and Hurwitz argument of Bogomolov and Tschinkel [4] Section 6, Proposition 6.1. The proof uses no pro-$ell$ field-reconstruction theorem as a premise.

=== 1.3 The proof and its main ingredients <the-proof-and-its-main-ingredients>

The argument begins with a compatible map $Theta$ and its dual on the compact character spaces $A_F = "Hom" \( F^times \, Lambda \)$. Two characters $f \, g$ form an #emph[alternating pair] when $f \( x \) g \( 1 - x \) = f \( 1 - x \) g \( x \)$ for every $x eq.not 0 \, 1$. This condition is visible in the Milnor product and is therefore preserved by $Theta$. Established local theory turns alternating subspaces into valuations. Section 2 uses it to recover the transcendence degree and the inertia and decomposition spaces of quasi-divisorial valuations, and the character spaces of their iterated residue fields. These valuations may act nontrivially on the constants; their residue constants can therefore have positive characteristic even when the original field has characteristic zero.

The next task is to recover curve subfields: relatively algebraically closed intermediate fields $k subset E subset K$ of transcendence degree one over $k$. Individual mod-$ell$ classes record only orders modulo $ell$, so a divisor can disappear when its multiplicity is divisible by $ell$. We control this loss by passing to residual curves. Section 3 uses Pop’s density theorem to recognize residual curves whose constants are algebraic closures of finite fields, together with all their point order lines. Section 4 then constructs a residual curve of bounded genus for any finite independent list of classes in $V_L$. It preserves independence and realizes each support degree on a fixed projective model of $L$ as the number of nonzero point orders on the residual curve. For each nonconstant $t in K$, applying Riemann–Hurwitz to five fixed members of its pencil bounds the total degree of the divisor support of every class $Theta \( \[ t - a \] \)$, $a in k$, on that model.

For a curve subfield $E$, choose $t in E \\ k$. The supporting prime divisors of the classes $Theta \( \[ t - a \] \)$ form an infinite set of bounded degree, hence lie in a finite-type family. The valuation correspondence shows that each class in $Theta \( V_E \)$ has an $ell$-th-power residue along all but finitely many of these divisors. Section 5 studies the incidence variety of pairs consisting of a point and a divisor containing it. Restricting its parameter space to a curve produces a finite extension of $L$ containing the curve’s function field. After passage to this extension, the classes come from that one-variable parameter field. The argument then descends them to a curve subfield $P subset L$ and proves $Theta \( V_E \) = V_P$.

Two features are useful specifically for finite coefficients. One parameter curve works for every class. For each class, a finite change of parameter space allows normality to extend a generic $ell$-th root of a representative across the smooth locus where that representative is a unit. This avoids any restriction on the cardinality of the constants. Moreover, the incidence field is the compositum of $L$ and the parameter field. This identity permits exact descent, retaining information that a norm could annihilate modulo $ell$.

Once curve subfields correspond, Section 6 recognizes true divisors, which are trivial on the constants, and a sufficiently large family of rational subfields on which every point is detected. A quotient of two local parameters at a smooth point supplies such a subfield. These quotients generate the function field, and the construction works already in dimension two. Matching their point-order lines gives bijections between the corresponding projective lines of points.

Section 7 recovers field operations from simultaneous values of these rational functions. A blowup at a smooth point detects all coordinates of a finite tuple at once. Additive triples yield rational expressions, allowing $p$-power roots in characteristic $p$, for the transported addition law. Their one-variable slices align all point bijections, outside finite sets, with a single isomorphism of constant fields. An identity of rational functions removes the apparent freedom caused by finite exceptional sets in those slices. The resulting correspondence preserves every algebraic relation among the chosen generators and hence gives an isomorphism of perfect fields.

Finally, Section 8 proves that this isomorphism induces the original map up to one scalar, and that scalar action of a field automorphism forces it to be a Frobenius power. Throughout, the pro-$ell$ density input concerns individual fields. The given mod-$ell$ isomorphism is never lifted to a pro-$ell$ isomorphism.

=== 1.4 Conventions <conventions>

A function field $F \/ kappa$ means a finitely generated field extension. Its constants $kappa$ will be algebraically closed. A curve is a geometrically integral variety of dimension one, and its function field has a unique smooth projective model over algebraically closed constants. A field extension is regular if it is separable and its base is relatively algebraically closed. Points of varieties over an algebraically closed field mean rational points unless a scheme point is specified. The phrase “for general points” means on some dense Zariski open subset. We continue to use $V_F = F^times \/ \( F^times \)^ell$ for residue fields of characteristic $ell$, as a multiplicative quotient, without a Galois-cohomological interpretation.

== 2 Alternating characters and quasi-divisorial valuations <sec:local>

We first recover valuations from the degree-two relations. The local theory is most naturally expressed on the dual of the multiplicative group. Its multiplicative formulation also applies to residue fields of characteristic $ell$, which will occur in the argument.

For any field $F$, put

$ A_F = "Hom" \( F^times \, Lambda \) = "Hom"_Lambda \( V_F \, Lambda \) \, #h(2em) Lambda = bb(F)_ell . $

Here the definition of $V_F$ is used in every characteristic. Give $A_F$ the topology of pointwise convergence, with $Lambda$ discrete. Choosing a basis of $V_F$ identifies $A_F$ with a product of copies of $Lambda$. In particular it is compact, and evaluation identifies $V_F$ with $"Hom"_(upright("cont")) \( A_F \, Lambda \)$: a continuous linear form on that product depends on only finitely many coordinates.

A pair $f \, g in A_F$ is #emph[alternating] if

#[#set math.equation(numbering: n => "(2.1)")
 $ f \( x \) g \( 1 - x \) = f \( 1 - x \) g \( x \) #h(2em) \( x in F \\ { 0 \, 1 } \) . $ <eq:local-alternating>]

A subset is alternating if every pair of its elements is alternating. The determinant functional

$ \[ x \] ⊗ \[ y \] mapsto f \( x \) g \( y \) - f \( y \) g \( x \) $

annihilates $R_F$ exactly when $f \, g$ are alternating. Thus the isomorphism $Theta$ in Theorem 1 induces a continuous linear isomorphism

$ Phi = Theta^(*) : A_L arrow.r^(med tilde.op med) A_K $

that preserves alternating pairs in both directions.

We consider valuations up to equivalence and write $v lt.eq w$ when $v$ is a coarsening of $w$. Write $U_v$ and $U_v^1$ for its units and principal units, $F v$ for its residue field, and $v F$ for its value group. The #emph[minimized inertia and decomposition spaces] are

$ I_v = U_v^perp subset D_v = \( U_v^1 \)^perp subset A_F \, $

where perpendiculars refer to evaluation. A subset of $A_F$ is #emph[valuative] if it is contained in some $I_v$. Restriction to units gives a continuous map

$ rho_v : D_v arrow.r A_(F v) $

with kernel $I_v$. Surjectivity will be established for the valuations we use below.

=== 2.1 The established local input <the-established-local-input>

The following form of alternating-pair valuation theory collects [13] Fact 2.1, Lemma 2.5, Theorem 2.6, and Corollary 2.7. We state it for finite coefficients; the field in this statement need not have characteristic different from $ell$.

#thm([Theorem 2.1.])[
  (Alternating-pair valuation theory).  #emph[Let $F$ be a field and set $A_F^plus.minus = { f in A_F : f \( - 1 \) = 0 }$.]
  + #emph[Every valuative subset $Sigma subset A_F$ has a unique coarsest valuation $v_Sigma$ with $Sigma subset I_(v_Sigma)$. In particular, $v_Sigma$ coarsens every valuation whose inertia contains $Sigma$. For such a valuation $w$, this coarsening is obtained by quotienting $w F$ by its largest convex subgroup contained in $w \( ⋂_(f in Sigma) ker f \)$.]
  + #emph[If $S subset A_F^plus.minus$ is an alternating linear subspace, its valuative elements form a valuative subspace $S_0$ of codimension at most one. Moreover $S subset D_(v_(S_0))$.]
  + #emph[If $Sigma subset A_F^plus.minus$ is valuative and $g in A_F^plus.minus$ is alternating with every element of $Sigma$, then $g in D_(v_Sigma)$.]
] <thm:local-input>

The coefficient convention in [13] Section 2.1 explicitly allows $bb(Z) \/ ell$; its fraction field is then $bb(F)_ell$, so its character space is exactly $A_F$. The case $ell = 2$ is included in the local theorem. For the fields over algebraically closed constants considered here, every character kills the constants and hence $- 1$, so $A_F^plus.minus = A_F$.

=== 2.2 Value groups and residue characters <value-groups-and-residue-characters>

For the remainder of this section, let $F \/ kappa$ be a finitely generated extension of an algebraically closed field, and put $s = "trdeg" \( F \/ kappa \)$. No restriction is imposed on its characteristic. We first record the valuation facts that turn the local theorem into an intrinsic description of codimension-one valuations.

#thm([Lemma 2.2.])[
  #emph[For every valuation $v$ of $F$, the field $kappa v$ is algebraically closed, the group $v F \/ v kappa$ is torsion free, and 
#[#set math.equation(numbering: n => "(2.2)")
 $ "rrank" \( v F \/ v kappa \) + "trdeg" \( F v \/ kappa v \) lt.eq s . $ <eq:local-abhyankar>]

 Here $"rrank" \( G \) = dim_(bb(Q)) \( G ⊗_(bb(Z)) bb(Q) \)$. If equality holds, then $F v \/ kappa v$ is finitely generated and $v F \/ v kappa$ is a finitely generated free abelian group. Equality passes to every coarsening and to the induced residue valuation. Conversely, equality for a valuation and an induced residue valuation gives equality for their composition.]
] <lem:local-abhyankar>

#proof[
  The value group of an algebraically closed field is divisible, and its residue field is algebraically closed. If $n gamma in v kappa$ for $gamma in v F$, choose $delta in v kappa$ with $n delta = n gamma$. Ordered abelian groups are torsion free, so $gamma = delta$. This proves torsion-freeness of the relative group.
  Choose elements $x_1 \, dots.h \, x_a in F^times$ whose values are rationally independent modulo $v kappa$, and units $y_1 \, dots.h \, y_b$ whose residues are algebraically independent over $kappa v$. These elements are algebraically independent over $kappa$. Indeed, in a putative polynomial relation, distinct monomials in the $x_i$ have distinct values modulo $v kappa$. Within a coefficient polynomial in the $y_j$, its terms of least value cannot cancel, by algebraic independence of their residues after rescaling by a constant. The nonzero summands obtained by grouping according to monomials in the $x_i$ have distinct values, so their sum cannot vanish. This proves (2.2) by taking maximal such families.
  Suppose equality holds and choose these families with $a + b = s$. Then $F$ is finite over $F' = kappa \( x_1 \, dots.h \, x_a \, y_1 \, dots.h \, y_b \)$. The same least-value calculation gives
  $ v F' \/ v kappa tilde.equiv bb(Z)^a \, #h(2em) F' v = kappa v \( macron(y)_1 \, dots.h \, macron(y)_b \) . $
  The fundamental inequality for the finite extension $F \/ F'$ shows that $\[ v F : v F' \]$ and $\[ F v : F' v \]$ are finite. Thus the residue extension is finitely generated, while the relative value group is finitely generated and torsion free, hence free.
  For the assertion about composition, write $v = w compose u$, meaning that $u$ is a coarsening and $w$ is the induced valuation on $F u$. The value groups fit into the exact sequence
  $ 0 arrow.r w \( F u \) \/ w \( kappa u \) arrow.r v F \/ v kappa arrow.r u F \/ u kappa arrow.r 0 . $
  Apply (2.2) first to $u$, and then to $w$ on $F u \/ kappa u$. The sum of the two inequalities is precisely the inequality for $v$. Consequently equality for $v$ forces equality in both, and equality in both forces equality for $v$. This use of the inequality on $F u \/ kappa u$ is legitimate even before finite generation is known: the algebraic-independence argument proving it applies to arbitrary field extensions of finite transcendence degree. ◻
]

#prodef([Definition 2.3.])[
  A #emph[quasi-divisorial valuation], or #emph[quasi-prime divisor], of $F \/ kappa$ is a valuation minimal under coarsening among those with
  $ v F \/ v kappa tilde.equiv bb(Z) \, #h(2em) "trdeg" \( F v \/ kappa v \) = s - 1 . $
  A quasi-prime divisor trivial on $kappa$ is called a #emph[prime divisor], or a #emph[true prime divisor]. A #emph[quasi-prime $r$-divisor] is a composition of $r$ successive quasi-prime divisors on the resulting residue fields.
]

Lemma 3 shows that for a quasi-prime $r$-divisor $v$, the residue field is a function field of transcendence degree $s - r$ over $kappa v$, and

#[#set math.equation(numbering: n => "(2.3)")
 $ v F \/ v kappa tilde.equiv bb(Z)^r . $ <eq:local-flag-rank>]

The isomorphism concerns abstract abelian groups; no ordering of $bb(Z)^r$ is specified.

#thm([Lemma 2.4.])[
  #emph[Suppose $v F \/ v kappa$ is free abelian of finite rank. Then restriction to units induces a canonical topological isomorphism 
#[#set math.equation(numbering: n => "(2.4)")
 $ D_v \/ I_v arrow.r^(med tilde.op med) A_(F v) . $ <eq:local-residue-duality>]

 Two elements of $D_v$ are alternating if and only if their images in $A_(F v)$ are alternating. If $w$ is a valuation of $F v$, then 
#[#set math.equation(numbering: n => "(2.5)")
 $ I_(w compose v) = rho_v^(- 1) \( I_w \) \, #h(2em) D_(w compose v) = rho_v^(- 1) \( D_w \) \, $ <eq:local-composition>]

 where the inverse images are taken inside $D_v$.]
] <lem:residue-duality>

#proof[
  There is an exact sequence of abelian groups
  $ 1 arrow.r \( F v \)^times \/ \( kappa v \)^times arrow.r F^times \/ \( kappa^times U_v^1 \) arrow.r v F \/ v kappa arrow.r 0 . $
  For the kernel assertion, rescale by a constant an element whose value lies in $v kappa$, and then take its residue. The last group is free, so the sequence splits as a sequence of abstract groups. Dualizing into $Lambda$ is consequently exact. Characters kill the algebraically closed constants on both sides, giving the asserted surjection $rho_v$ with kernel $I_v$. Its induced bijection is a homeomorphism because its source is compact and its target Hausdorff.
  For alternation, if $v \( x \) > 0$, then $1 - x in U_v^1$, and the identity (2.1) holds for any pair in $D_v$. The case $v \( 1 - x \) > 0$ is the same. If $v \( x \) < 0$, then $\( 1 - x \) \/ \( - x \) in U_v^1$, so every character in $D_v$ takes the same value on $x$ and $1 - x$. The remaining case is $v \( x \) = v \( 1 - x \) = 0$, when the identity is exactly its residue-field counterpart. Conversely, lift any residue element different from zero and one to test the residue identity.
  Finally $U_v^1$ is contained in both $U_(w compose v)$ and $U_(w compose v)^1$. Under reduction of $v$-units, these two groups map respectively onto $U_w$ and $U_w^1$. Their annihilators therefore give (2.5). ◻
]

We will also use the following consequence of valuation approximation. It explains why intersections of decomposition spaces yield inertia.

#thm([Lemma 2.5.])[
  #emph[Let $v_1 \, v_2$ be incomparable valuations of a field, and let $u$ be their finest common coarsening. Then 
$ U_(v_1)^1 U_(v_2)^1 = U_u \, #h(2em) D_(v_1) ∩ D_(v_2) = I_u . $

]
] <lem:local-approximation>

#proof[
  The induced valuations $w_1 \, w_2$ on the residue field $F u$ are independent. For $a in \( F u \)^times$, the approximation theorem gives $b in \( F u \)^times$ with
  $ w_1 \( b - 1 \) > 0 \, #h(2em) w_2 \( b - a \) > w_2 \( a \) . $
  Thus $b in U_(w_1)^1$ and $a \/ b in U_(w_2)^1$, proving $U_(w_1)^1 U_(w_2)^1 = \( F u \)^times$. Reduction maps $U_(v_i)^1$ onto $U_(w_i)^1$, and both groups $U_(v_i)^1$ contain $U_u^1$. Lifting the product identity gives the first equality; taking annihilators gives the second. ◻
]

=== 2.3 Recovering dimension and quasi-divisors <recovering-dimension-and-quasi-divisors>

The next argument follows the alternating-space method of [13] Fact 3.2 and Theorem 3.3. We give the details so that the argument remains available in characteristic $ell$.

#thm([Proposition 2.6.])[
  #emph[The maximum dimension of an alternating subspace of $A_F$ is $s$. If $S subset A_F$ is alternating of dimension $s$, and $v$ is the valuation associated to its valuative part $S_0$, then $S_0 = I_v$ and equality holds in (2.2) for $v$.]
] <prop:local-dimension>

#proof[
  For any torsion-free abelian group $G$ of finite rational rank,
  $ dim_Lambda \( G \/ ell G \) lt.eq "rrank" \( G \) . $
  Indeed, representatives of linearly independent classes modulo $ell$ are rationally independent: an integral relation can be divided by the greatest common divisor of its coefficients, using torsion-freeness, and the resulting relation has a coefficient nonzero modulo $ell$. Since characters of $v F$ kill its divisible subgroup $v kappa$, this proves
  $ dim I_v lt.eq "rrank" \( v F \/ v kappa \) . $
  Now let $S$ be alternating. By Theorem 2, its valuative part $S_0$ is a subspace of codimension at most one and, for its associated valuation $v$, $S_0 subset I_v$ and $S subset D_v$. Moreover $S ∩ I_v = S_0$, since every element of $I_v$ is valuative. If $S = S_0$, then
  $ dim S lt.eq dim I_v lt.eq "rrank" \( v F \/ v kappa \) lt.eq s . $
  If $S eq.not S_0$, an element of $S \\ S_0$ has nonzero image under $rho_v$, whose kernel is always $I_v$. Thus $A_(F v) eq.not 0$. Since $kappa v$ is algebraically closed, this implies $"trdeg" \( F v \/ kappa v \) gt.eq 1$, and hence
  $ dim S = dim S_0 + 1 lt.eq "rrank" \( v F \/ v kappa \) + "trdeg" \( F v \/ kappa v \) lt.eq s . $
  If $dim S = s$, equality throughout the applicable chain gives $S_0 = I_v$ and equality in (2.2).
  To attain the bound, choose a transcendence basis of $F \/ kappa$, take a full coordinate flag on its rational function field, and prolong the associated valuation to $F$. It is trivial on $kappa$, and its value group is a finite-index extension of $bb(Z)^s$, hence is abstractly $bb(Z)^s$. Its inertia has dimension $s$ and is alternating by Lemma 5. For $s = 0$, the field is $kappa$, its character space is zero, and the assertion has the same interpretation. ◻
]

We can now identify the one-dimensional inertia spaces solely through maximal alternating subspaces. Once inertia is identified, alternation with it identifies decomposition as well.

#thm([Proposition 2.7.])[
  #emph[Assume $s gt.eq 2$. A line $H subset A_F$ is the inertia of a quasi-divisorial valuation if and only if 
#[#set math.equation(numbering: n => "(2.6)")
 $ H = S_1 ∩ S_2 quad upright("for alternating subspaces ") S_1 \, S_2 subset A_F upright(" of dimension ") s . $ <eq:local-inertia-intersection>]

 The quasi-divisorial valuation $v$ with $I_v = H$ is unique. For any nonzero $h in H$, its decomposition space is 
#[#set math.equation(numbering: n => "(2.7)")
 $ D_v = { g in A_F : \( h \, g \) upright(" is alternating") } . $ <eq:local-decomposition-recognition>]

]
] <prop:quasi-recovery>

#proof[
  Suppose first that $v$ is quasi-divisorial. On $F v \/ kappa v$ choose two independent full discrete flag valuations $w_1 \, w_2$, trivial on $kappa v$. To obtain them, start with coordinate flags on a rational subfield of transcendence degree $s - 1$, with distinct first prime divisors, and prolong to the finite extension $F v$. Independence survives prolongation. Indeed, a valuation on a finite field extension that restricts trivially to the smaller field is trivial, since its value group is then finite and hence zero. Thus a common nontrivial coarsening of $w_1 \, w_2$ would restrict to a common nontrivial coarsening of the original independent flag valuations, which is impossible.
  The inertia spaces $I_(w_1) \, I_(w_2)$ have zero intersection by approximation. Set $v_i = w_i compose v$ and $S_i = I_(v_i)$. Each $v_i$ has relative value group $bb(Z)^s$, so its inertia is alternating of dimension $s$. By (2.5), the intersection $S_1 ∩ S_2$ is $I_v$.
  Conversely, suppose (2.6) holds. Let $S_(i \, 0)$ be the valuative part of $S_i$, with associated valuation $v_i$. Proposition 7 gives
  $ S_(i \, 0) = I_(v_i) \, #h(2em) S_i subset D_(v_i) \, #h(2em) dim I_(v_i) gt.eq s - 1 gt.eq 1 \, $
  and $v_i$ has equality in (2.2). We first show that $H$ is valuative. If, for example, $v_1 lt.eq v_2$, then
  $ 0 eq.not I_(v_1) subset S_1 ∩ S_2 = H \, $
  so $H = I_(v_1)$. The other comparable case is symmetric. If the valuations are incomparable, Lemma 6 puts $H$ inside the inertia of their finest common coarsening. In either case every element of $H$ is valuative. Because it lies in each $S_i$, it then lies in each $S_(i \, 0)$, giving
  $ H = I_(v_1) ∩ I_(v_2) . $
  Let $u = v_H$. By Theorem 2, it coarsens each $v_i$, and therefore
  $ H subset I_u subset I_(v_1) ∩ I_(v_2) = H . $
  Equality in (2.2) passes to $u$. Its relative value group is free, so $dim I_u = 1$ implies $u F \/ u kappa tilde.equiv bb(Z)$ and $"trdeg" \( F u \/ kappa u \) = s - 1$. If a coarsening $u' lt.eq u$ still has relative rank one, its one-dimensional inertia is contained in $I_u$, hence equals $H$. The defining coarseness of $v_H = u$ then gives $u lt.eq u'$, so $u = u'$. Thus $u$ is quasi-divisorial.
  For uniqueness, if $v$ is any quasi-divisor with $I_v = H$, its associated coarsening $v_H$ has the same inertia. Equality in (2.2) passes to that coarsening, so it too has relative rank one and residue transcendence degree $s - 1$. Minimality of $v$ forces $v = v_H$.
  Finally, an element of $D_v$ is alternating with $h$ by Lemma 5, since $h$ has zero residue image. Conversely, an element alternating with $h$ belongs to $D_(v_H) = D_v$ by Theorem 2. ◻
]

#thm([Lemma 2.8.])[
  #emph[If $v$ is a quasi-prime $r$-divisor, with $r gt.eq 1$, then its value group has no nonzero $ell$-divisible convex subgroup. Moreover $v = v_(I_v)$; in particular its inertia determines the valuation.]
] <lem:local-flag-uniqueness>

#proof[
  First suppose $r = 1$. An $ell$-divisible convex subgroup $C$ of $v F$ maps to zero in $v F \/ v kappa tilde.equiv bb(Z)$, and hence lies in $v kappa$. Coarsening by $C$ therefore leaves the relative value group unchanged. Lemma 3 shows that the residue transcendence degree remains $s - 1$, so minimality of $v$ forces $C = 0$.
  For a composite flag, the value group of its final quasi-prime step is a nonzero convex subgroup $B subset v F$ with the property just proved. If $C subset v F$ were a nonzero $ell$-divisible convex subgroup, then $B ∩ C eq.not 0$, since convex subgroups are linearly ordered by inclusion. This intersection is $ell$-divisible: division by $ell$ in $C$ stays in $B$ by convexity. It is also convex in $B$, a contradiction.
  Put $Gamma = v F$. Since $Gamma \/ v kappa tilde.equiv bb(Z)^r$ and $v kappa$ is divisible, the common kernel in $Gamma$ of all characters in $I_v$ is
  $ v kappa + ell Gamma = ell Gamma . $
  Every convex subgroup contained in $ell Gamma$ is itself $ell$-divisible: an $ell$-th part exists in $Gamma$, and convexity places it in the subgroup. The first assertion therefore shows that the largest such convex subgroup is zero. The coarsening description in Theorem 2 now gives $v = v_(I_v)$. ◻
]

#thm([Corollary 2.9.])[
  #emph[For the fields $K \/ k \, L \/ l$ of Theorem 1, a compatible isomorphism $Theta$ forces $"trdeg" \( K \/ k \) = "trdeg" \( L \/ l \) = d$, say. Its dual $Phi$ matches the inertia–decomposition pairs of quasi-prime divisors, and, successively, the pairs of quasi-prime $r$-divisors for $1 lt.eq r lt.eq d - 1$. For a matched pair of valuations $v$ on $K$ and $w$ on $L$, it induces a topological linear isomorphism 
$ A_(L w) arrow.r^(med tilde.op med) A_(K v) $

 preserving alternating pairs in both directions.]
] <cor:flag-matching>

#proof[
  The maximum alternating dimension is preserved by $Phi$, giving equality of transcendence degrees by Proposition 7. Proposition 8 then identifies corresponding quasi-prime inertia and decomposition spaces. Quotienting by inertia and using Lemma 5 gives the indicated isomorphism on residue characters, with its alternating relation.
  As long as the residual transcendence degree is at least two, apply Proposition 8 again there. The inverse-image identities (2.5) identify the resulting pairs with those of compositions on the original fields. Lemma 9 shows that each such inertia determines its composite valuation, so this matching is independent of any choice of a presentation as a flag. At each step Lemma 3 supplies finitely generated residue fields over algebraically closed residue constants. The local results apply even if one of these fields has characteristic $ell$. Iteration ends after $d - 1$ steps, with function fields of curves. ◻
]

== 3 Recognizing points on residual curves <sec:residual-curves>

Corollary 10 identifies the residue character spaces at quasi-prime $\( d - 1 \)$-divisors. These residue fields have transcendence degree one, but their point valuations are not yet distinguished inside their character spaces. We now recognize those terminal residues whose constant fields are algebraic closures of finite fields. For these residues we also recognize every point inertia line. The construction uses Pop’s density theorem for an individual field, followed by reduction of its characters modulo $ell$.

Fix a function field $F \/ kappa$ over an algebraically closed field of characteristic different from $ell$, of transcendence degree $d gt.eq 2$, and let $v$ be a quasi-prime $\( d - 1 \)$-divisor. Put

$ F_0 = F v \, #h(2em) kappa_0 = kappa v . $

By Lemma 5, restriction to units induces a surjective map $rho_v : D_v arrow.r A_(F_0)$ with kernel $I_v$. Define

#[#set math.equation(numbering: n => "(3.1)")
 $ S_F^(upright("in")) = overline(union.big_(w med upright("quasi") upright("-") p r i m e med d i v i s o r) I_w) subset A_F \, #h(2em) J_v = rho_v \( S_F^(upright("in")) ∩ D_v \) subset A_(F_0) . $ <eq:residual-inertia-set>]

Here the bar denotes the closure of the union, rather than the subgroup generated by that union. In particular $J_v$ is a set of characters, not in general a subspace. It is stable under multiplication by $Lambda$, so it makes sense to consider the family of lines contained in $J_v$. Both sets in (3.1), and this family of lines, are preserved by the isomorphisms already constructed in Section 2.

=== 3.1 The density input and reduction of coefficients <the-density-input-and-reduction-of-coefficients>

A valuation $c$ of a function field $B \/ b$, with $b$ algebraically closed, is a #emph[constant reduction] if $"trdeg" \( B c \/ b c \) = "trdeg" \( B \/ b \)$. The composition of a constant reduction with a prime divisor of $B c \/ b c$ is called a #emph[c.r. quasi-prime divisor]. The trivial constant reduction is allowed, so ordinary prime divisors belong to this class. For a constant reduction, Lemma 3 gives $c B = c b$: the relative value group is torsion free of rational rank zero. After composition with a prime divisor, the relative value group is therefore $bb(Z)$. The final discrete step is an innermost convex subgroup of the composed value group. Every proper coarsening kills this step and has all its remaining values supplied by constants. This proves the minimality required of a quasi-prime divisor and justifies the terminology.

For the density statement, temporarily use $ell$-adic characters:

$ hat(A)_E = "Hom" \( E^times \, bb(Z)_ell \) \, #h(2em) hat(I)_a = "Hom" \( E^times \/ U_a \, bb(Z)_ell \) \, #h(2em) hat(D)_a = "Hom" \( E^times \/ U_a^1 \, bb(Z)_ell \) . $

These groups have the topology of pointwise convergence. Restriction to units and passage to residue give a map $hat(rho)_v : hat(D)_v arrow.r hat(A)_(F_0)$. Define $hat(S)_F^(upright("in"))$ and $hat(J)_v$ by the same formulas as in (3.1), with hats on the character groups and on $rho_v$.

#thm([Theorem 3.1.])[
  (Pop’s residual density input).  #emph[Let $F \/ kappa$ be a function field over an algebraically closed field of characteristic different from $ell$. Suppose that a valuation $v$ of $F$, with $F v \/ kappa v$ a function field, has the following properties:]
  + #emph[$v F$ has no nonzero $ell$-divisible convex subgroup;]
  + #emph[there is a subfield $kappa subset kappa_1 subset F$ such that 
$ kappa_1 v = kappa v \, #h(2em) "trdeg" \( F \/ kappa_1 \) = "trdeg" \( F v \/ kappa_1 v \) = 1 . $

]
  #emph[Then $hat(J)_v$ contains the full minimized inertia group $hat(I)_u$ of every c.r. quasi-prime divisor $u$ of $F v \/ kappa v$.]
] <thm:density-input>

This is the consequence of [8] Theorem 1.2 and the proof of Theorem 4.2, p. 351, item 2 with the notation introduced on p. 348. The auxiliary field $kappa_1$ is not required to be algebraically closed. The minimized interpretation in residue characteristic $ell$ is explained in [8] Remark 4.1 and the appendix, Section A.

We verify the hypotheses for our terminal valuation $v$. Lemma 9 shows that $v F$ has no nonzero $ell$-divisible convex subgroup. It remains to construct the auxiliary field $kappa_1$.

Choose elements $x_1 \, dots.h \, x_(d - 1) in F^times$ whose values are rationally independent modulo $v kappa$, and set $kappa_1 = kappa \( x_1 \, dots.h \, x_(d - 1) \)$. Distinct monomials in the $x_i$ have different values modulo $v kappa$. Thus every nonzero polynomial in these elements has a unique term of least value, proving algebraic independence over $kappa$. If a quotient of two such polynomials has value zero, their least terms have the same monomial. Its residue is the residue of the quotient of their coefficients, and consequently belongs to $kappa v$. This proves $kappa_1 v = kappa v$; the two transcendence degrees required by Theorem 11 are now one.

#thm([Lemma 3.2.])[
  #emph[For a quasi-prime $\( d - 1 \)$-divisor $v$ of $F \/ kappa$, the set $J_v$ contains the inertia line $I_u subset A_(F_0)$ of every c.r. quasi-prime divisor $u$ of $F_0 \/ kappa_0$.]
] <lem:residual-density-mod-ell>

#proof[
  Reduction of character values gives continuous maps
  $ r_E : hat(A)_E arrow.r A_E . $
  They carry $hat(I)_a$ into $I_a$, carry $hat(D)_a$ into $D_a$, and commute with restriction to units. In particular,
  $ r_F \( hat(S)_F^(upright("in")) \) subset S_F^(upright("in")) \, #h(2em) rho_v r_F = r_(F_0) hat(rho)_v quad upright("on ") hat(D)_v . $
  The first inclusion follows from continuity and the definition as a closure of a union.
  Fix a c.r. quasi-prime divisor $u$ of $F_0 \/ kappa_0$. Characters with either coefficient ring annihilate the divisible group $u kappa_0$. Since $u F_0 \/ u kappa_0 tilde.equiv bb(Z)$, reduction $hat(I)_u arrow.r I_u$ is surjective. Given $chi in I_u$, choose a lift $hat(chi) in hat(I)_u$. Theorem 11 supplies $hat(eta) in hat(S)_F^(upright("in")) ∩ hat(D)_v$ with $hat(rho)_v \( hat(eta) \) = hat(chi)$. Then $r_F \( hat(eta) \)$ belongs to $S_F^(upright("in")) ∩ D_v$ and has residual image $chi$. Hence $chi in J_v$. ◻
]

The argument needs only the displayed inclusion between the two closed unions. It does not assert that reduction commutes with their intersection with decomposition groups, and it makes no use of a lift of $Theta$.

=== 3.2 Valuative characters and the relation among point orders <valuative-characters-and-the-relation-among-point-orders>

The density input gives a lower bound for $J_v$. To control its other elements, we use the fact that taking this closed union introduces no nonvaluative characters.

#thm([Lemma 3.3.])[
  #emph[Every element of $S_F^(upright("in"))$ is valuative. Every element of $J_v$ is valuative as a character of $F_0$.]
] <lem:residual-valuative>

#proof[
  Let $cal(V) \( F \)$ be the space of valuation rings of $F$, with its compact patch topology. In $A_F times cal(V) \( F \)$, the condition that a character $chi$ annihilates the unit group of a valuation ring $O$ is closed. Indeed, for each $x in F^times$, failure of this condition is witnessed by the open conditions
  $ x \, x^(- 1) in O \, #h(2em) chi \( x \) eq.not 0 . $
  The projection of the closed incidence set to $A_F$ is compact, hence closed. This projection is precisely the set of valuative characters, which contains every $I_w$ and therefore contains $S_F^(upright("in"))$.
  Now let $chi in I_u ∩ D_v$ for some valuation $u$. If $u lt.eq v$, then $chi in I_v$ and its residual image is zero. If $v lt.eq u$, then restriction to $U_v$ shows that $rho_v \( chi \)$ annihilates the units of the induced valuation $u \/ v$ on $F_0$. In the remaining case let $a$ be the finest common coarsening of $u$ and $v$. Approximation for the independent induced valuations on $F a$ gives
  $ U_a = U_u U_v^1 . $
  For example, a prescribed nonzero residue can be written as an induced $u$-unit times an induced principal $v$-unit by choosing an element close to $1$ at the first valuation and close to that residue at the second. Lifting gives the displayed identity; the remaining factor in $U_a^1$ is already a unit for both refinements. Thus $chi$ annihilates $U_a$, and $chi in I_a subset I_v$. Its residual image is again zero. ◻
]

We next record how the points of a complete curve appear in its character space, in the finite-coefficient form of Topaz’s calculation in [8] appendix, Lemma 5, pp. 354–355. This description will also be used for curve subfields later.

#thm([Lemma 3.4.])[
  (Point orders).  #emph[Let $B \/ b$ be a function field of transcendence degree one over an algebraically closed field, and let $C \/ b$ be its smooth projective curve. For $x in C \( b \)$, let $delta_x = "ord"_x med mod med ell in A_B$. The lines $Lambda delta_x$ are distinct and nonzero. The family $\( delta_x \)_(x in C \( b \))$ tends to zero outside finite subsets, and the continuous summation map 
#[#set math.equation(numbering: n => "(3.2)")
 $ product_(x in C \( b \)) Lambda arrow.r A_B \, #h(2em) \( a_x \)_x mapsto sum_x a_x delta_x $ <eq:curve-summation>]

 has kernel consisting exactly of the constant families. If $"char" \( b \) eq.not ell$, the common kernel in $V_B$ of the $delta_x$ has dimension $2 g \( C \)$.]
] <lem:curve-orders>

#proof[
  Approximation at distinct point valuations proves that each $delta_x$ is nonzero and that their lines are distinct. A function on $C$ has only finitely many zeros and poles. Hence every fixed element of $B^times$ is annihilated by all but finitely many $delta_x$, which proves the asserted convergence and defines (3.2), with continuous evaluation at each function.
  A family $\( a_x \)_x$ defines a homomorphism from the divisor group of $C$ to $Lambda$, sending the point divisor $x$ to $a_x$. It lies in the kernel of (3.2) precisely when this homomorphism vanishes on principal divisors, or equivalently factors through $"Pic" \( C \)$. The group $"Pic"^0 \( C \) \( b \)$ is $ell$-divisible: multiplication by $ell$ on the Jacobian is a surjective isogeny, and $b$ is algebraically closed. This remains true in characteristic $ell$. Every homomorphism $"Pic" \( C \) arrow.r Lambda$ therefore factors through the degree map $"Pic" \( C \) arrow.r bb(Z)$. Since all point divisors have degree one, its coefficient family is constant. Conversely, constant families annihilate principal divisors.
  Finally, if all point orders of $f in B^times$ are divisible by $ell$, write $"div" \( f \) = ell D$ and associate to $\[ f \]$ the class of $D$ in $"Pic" \( C \) \[ ell \]$. This gives an isomorphism from the common kernel to $"Pic" \( C \) \[ ell \]$: surjectivity follows from the definition of torsion in $"Pic" \( C \)$; injectivity follows because $b^times$ is $ell$-divisible. When $"char" \( b \) eq.not ell$, the $ell$-torsion of the Jacobian is isomorphic to $\( bb(Z) \/ ell \)^(2 g \( C \))$. ◻
]

=== 3.3 An intrinsic test for finite-field constants <an-intrinsic-test-for-finite-field-constants>

We now adapt the curve-like relation criterion of [8] Theorem 4.2 and appendix, Main Theorem I, p. 353 to the family of lines in $J_v$. Let $cal(L)_v$ be the family of one-dimensional subspaces of $A_(F_0)$ contained in $J_v$. Choose a nonzero generator $e_H in H$ for each $H in cal(L)_v$. Consider the following conditions:

+ the family $\( e_H \)_(H in cal(L)_v)$ tends to zero outside finite subsets;
+ the resulting summation map
  $ product_(H in cal(L)_v) Lambda arrow.r A_(F_0) \, #h(2em) \( a_H \)_H mapsto sum_H a_H e_H $
  has a one-dimensional kernel generated by a family whose every coordinate is nonzero.

These conditions are independent of the choices of generators. Changing generators rescales the coordinates of the product, and, because $Lambda$ is finite, preserves the convergence in the first condition. They are also preserved by topological linear isomorphisms of the residual character spaces.

#thm([Proposition 3.5.])[
  #emph[For a quasi-prime $\( d - 1 \)$-divisor $v$ of $F \/ kappa$, the family $cal(L)_v$ satisfies the preceding two conditions if and only if $kappa v$ is algebraic over a finite field. When this holds, $cal(L)_v$ consists exactly of the point inertia lines of the smooth projective curve of $F v \/ kappa v$. Consequently the matching in Corollary 10 recognizes these terminal valuations and matches their full point families.]
] <prop:point-recognition>

#proof[
  Suppose first that $kappa_0$ is algebraic over a finite field. Every valuation on $kappa_0$ is trivial. A nontrivial valuation of the one-variable field $F_0$ trivial on $kappa_0$ is a point valuation on its smooth projective curve: properness gives a closed center, and the discrete valuation ring at that smooth point is dominated by the valuation ring. Writing each function as a power of a uniformizer times a local unit identifies the two valuations. Thus Lemma 13 shows that every line in $cal(L)_v$ is a point line. The converse inclusion follows from Lemma 12, using the trivial constant reduction. Lemma 14 now proves the two conditions.
  Suppose instead that $kappa_0$ is not algebraic over a finite field. There is a nontrivial valuation $b$ on $kappa_0$: in characteristic zero extend a nontrivial valuation of the prime field; in positive characteristic use a transcendental element, extend its variable valuation to a rational transcendence basis, and prolong to $kappa_0$. Choose a transcendental $t in F_0$ with $F_0 \/ kappa_0 \( t \)$ finite. The Gauss extension of $b$ to $kappa_0 \( t \)$, followed by a prolongation to $F_0$, gives a constant reduction $c$. Indeed the rational residue field has transcendence degree one, and finite prolongation gives a finite residue extension. The value group of $c$ equals its constant-value subgroup: the Gauss extension has this property, and a finite prolongation has finite value-group index, whereas the constant-value group is divisible.
  Choose a point valuation $q$ on $F_0 c \/ kappa_0 c$, and form $u = q compose c$. This is a c.r. quasi-prime divisor, whose value group contains the final discrete step as an innermost convex subgroup. In particular $u F_0 \/ u kappa_0 tilde.equiv bb(Z)$, so $I_u$ is a nonzero line, and it belongs to $cal(L)_v$. It is different from every true point line. To see this, let $p$ be a point valuation of $F_0 \/ kappa_0$. The valuation $u$ is nontrivial on constants, so cannot coarsen $p$. Conversely, a proper coarsening of $u$ kills its innermost discrete subgroup and retains only values supplied by constants; it cannot equal the nontrivial valuation $p$ that is trivial on constants. Thus $p$ and $u$ are incomparable. Since $p$ has rank one, their finest common coarsening is trivial. Approximation gives $I_p ∩ I_u = 0$, proving the assertion even with $Lambda$-coefficients.
  All point lines already belong to $cal(L)_v$, and their generators have the nonzero relation of Lemma 14, after rescaling to the chosen generators. If the first condition holds for the full family, extend this relation by zero on the additional lines. It is a nonzero kernel vector with a zero coordinate, contradicting the second condition. If the first condition fails, the family also fails the stated test. This proves the equivalence. ◻
]

== 4 A uniform bound for the support of a pencil <sec:support>

Fix a normal integral projective model $X subset bb(P)_l^n$ of $L \/ l$. For $h in V_L$, define

$ "supp"_X \( h \) = { D subset X : med D upright(" is a prime divisor and ") "ord"_D \( h \) eq.not 0 upright(" in ") Lambda } . $

Its degree is

$ s_X \( h \) = sum_(D in "supp"_X \( h \)) deg \( D \) . $

The orders modulo $ell$, and hence this finite set and its degree, depend only on the class $h$. We will prove that, for each $t in K \\ k$, the integers $s_X \( Theta \( \[ t - a \] \) \)$ are bounded independently of $a in k$. The method is to realize any finite selection of these classes on a residual curve of bounded genus. The point correspondence from Section 3 then turns the desired bound into a Riemann–Hurwitz estimate. The bounded-genus and Hurwitz method appears in [4] Section 6, proof of Proposition 6.1; we adapt the bounded-support construction of [6] Sections 4–6 to finite coefficients.

=== 4.1 Finite Kummer tests <finite-kummer-tests>

We first record why only finitely many classes can disappear in a finitely generated extension.

#thm([Lemma 4.1.])[
  #emph[Let $E \/ F$ be a finitely generated field extension, where $"char" F eq.not ell$ and $mu_ell subset F$. The kernel of $V_F arrow.r V_E$ is finite dimensional over $Lambda$.]
] <lem:kummer-kernel>

#proof[
  Let $F'$ be the relative algebraic closure of $F$ in $E$. Choose a transcendence basis $upright(bold(x))$ for $E \/ F$ such that $\[ E : F \( upright(bold(x)) \) \] = N < oo$. For every finite extension $F_1 \/ F$ contained in $F'$, the tuple $upright(bold(x))$ remains algebraically independent over $F_1$, and
  $ \[ F_1 : F \] = \[ F_1 \( upright(bold(x)) \) : F \( upright(bold(x)) \) \] lt.eq N . $
  The finite subextensions of $F' \/ F$ form a directed system with bounded degrees. One of them has maximal degree and contains all the others; thus $F' \/ F$ is finite.
  If $r$ independent classes in $V_F$ vanish in $V_E$, choose representatives $f_1 \, dots.h \, f_r in F^times$ and their $ell$-th roots in $E$. Those roots belong to $F'$, and Kummer theory gives
  $ \[ F \( f_1^(1 \/ ell) \, dots.h \, f_r^(1 \/ ell) \) : F \] = ell^r . $
  Hence $ell^r lt.eq \[ F' : F \]$, which bounds the kernel dimension. ◻
]

The following geometric observation explains why a single smooth curve can preserve any specified finite Kummer extension. Its irreducibility assertion is useful because the cover can have arbitrarily large degree.

#thm([Lemma 4.2.])[
  #emph[Let $U$ be a smooth integral locally closed subvariety of projective space over an algebraically closed field, of dimension at least two. Let $Y arrow.r U$ be a finite étale morphism with $Y$ integral. For general hyperplanes $H$, both $U ∩ H$ and $Y times_U \( U ∩ H \)$ are nonempty, smooth, and integral.]
] <lem:support-bertini>

#proof[
  Smoothness of $U ∩ H$ is Bertini’s smoothness theorem for an embedded smooth variety, valid in every characteristic [11] Lemma 33.47.3, Tag 0FD6. It implies smoothness upstairs because the cover is étale. We give the irreducibility argument, applied to either $Y arrow.r bb(P)^n$ or $U arrow.r bb(P)^n$.
  Write $f : Y arrow.r bb(P)^n$ for the resulting quasi-finite morphism and $a = dim Y gt.eq 2$. Let $cal(H) = \( bb(P)^n \)^or$ be the space of hyperplanes. In the incidence of triples $\( y_1 \, y_2 \, H \)$ with $f \( y_1 \) \, f \( y_2 \) in H$, the locus $f \( y_1 \) eq.not f \( y_2 \)$ is a projective space bundle with fiber $bb(P)^(n - 2)$ over a nonempty open of $Y times Y$. It is therefore irreducible of dimension $2 a + n - 2$. The locus of pairs with equal images has dimension at most $a$, by quasi-finiteness; its hyperplane incidence has dimension at most $a + n - 1 < 2 a + n - 2$.
  For a general hyperplane, $f^(- 1) \( H \)$ is nonempty and has pure dimension $a - 1$. Nonemptiness follows because the image of $f$ contains an open of its $a$-dimensional closure; purity follows from the principal ideal theorem on the integral variety $Y$. Thus every component of the square of the generic hyperplane section has dimension $2 a - 2$ over the function field of $cal(H)$. No such component can be contained in the equal-image incidence, whose total dimension is too small. The square of the generic section is consequently irreducible.
  This implies geometric irreducibility of the generic section. Indeed, if it had more than one geometric component, ordered pairs of points lying on the same component and on different components would give two distinct Galois-invariant unions of components of its square. Its already established generic smoothness excludes nonreducedness. Geometric integrality spreads to a nonempty open of $cal(H)$, which proves the assertion for general hyperplanes. ◻
]

#thm([Proposition 4.3.])[
  (Finite curve test).  #emph[There is an integer $G_X gt.eq 0$, depending only on the embedded model $X$, with the following property. Given $g_1 \, dots.h \, g_m in L^times$ whose classes in $V_L$ are independent, there is a quasi-prime $\( d - 1 \)$-divisor $w$ of $L \/ l$ such that:]
  + #emph[$l w$ is algebraically closed and algebraic over a finite field of characteristic different from $ell$, and $L w$ is the function field of a smooth projective curve $C_w \/ l w$ of genus at most $G_X$;]
  + #emph[the $g_j$ are $w$-units and their residue classes are independent in $V_(L w)$;]
  + #emph[for every $j$, 
$ \# { x in C_w \( l w \) : "ord"_x \( overline(g_j) \) equiv.not 0 med \( mod med ell \) } = s_X \( \[ g_j \] \) . $

]
] <prop:finite-curve-test>

#proof[
  We first construct a curve over $l$, then specialize its finite defining data, and finally realize that specialization by a valuation of $L$.
  #emph[A curve preserving orders and independence.] Let $D_1 \, dots.h \, D_q$ be the prime divisors occurring in the divisors of the $g_j$. There is a closed subset $B subset X$ of codimension at least two such that $X \\ B$ is smooth, the $D_i \\ B$ are smooth pairwise disjoint Cartier divisors, and near each $D_i \\ B$ every $g_j$ is a power of a local equation of $D_i$ times a unit. Outside their union the functions are units. To obtain $B$, remove the singular locus of the normal variety $X$, the singular and non-Cartier loci of the $D_i$, their pairwise intersections, and the exceptional loci of these local expressions. Each has codimension at least two.
  On the smooth open $U = X \\ \( B union D_1 union dots.h.c union D_q \)$, the simultaneous root cover defined by the equations $z_j^ell = g_j$ is finite étale. Kummer theory and independence say that it is integral of degree $ell^m$. Successively choose $d - 1$ general hyperplanes. Apply Lemma 17 to the cover on each successive open section, and Bertini smoothness to the base and its specified divisors. We obtain a smooth integral projective curve $C subset X$ that avoids $B$, meets every $D_i$ transversely in exactly $deg D_i$ distinct points, and has an integral root cover over $C ∩ U$. The latter cover still has degree $ell^m$, so the restricted classes of the $g_j$ are independent. At a point of $C ∩ D_i$ their orders are exactly their orders along $D_i$. These are all their zeros and poles on $C$, proving the required equality of support counts over $l$.
  The genus of this curve is independent of the chosen functions. At each stage we may also require the hyperplane to avoid the associated points of the preceding scheme section. Multiplication by its equation is then injective, so the Hilbert polynomial of a section is the first difference of the preceding Hilbert polynomial. The final scheme section avoids $B$, and on $X \\ B$ the successive sections are smooth by Bertini. Hence the final scheme section is reduced and equals $C$, even if intermediate sections had embedded components supported in $B$. Its Hilbert polynomial, and thus its genus, depend only on the Hilbert polynomial of the embedded $X$. Denote this genus by $G_X$. This argument does not require $X$ to be Cohen–Macaulay.
  #emph[Specialization of the finite data.] Choose a finitely generated subring $R subset l$ in which $ell$ is invertible and over which the preceding data are defined. Enlarge $R$ by finitely many elements and localize it as follows. The smooth open of $X$ containing $C$, the flag sections in that open, and their inclusions descend with their dimensions, smoothness, and geometric integrality preserved in every geometric fiber. The final curve descends as a smooth projective curve of genus $G_X$. Include the coordinates of its finitely many zeros and poles and the local parameter–unit expressions for the functions. After shrinking $"Spec" R$, they give disjoint point sections with the same orders and no other zeros or poles. The root cover over the complement of those sections remains finite étale of degree $ell^m$, with geometrically integral fibers. Thus independence and the support counts persist in every geometric fiber under consideration.
  Here the spreading statements have their usual finite-presentation meaning: finitely many schemes, morphisms, functions, and identities descend after adjoining finitely many coefficients [11] Tags 01ZM, 0C0C, 081F; smoothness and flatness hold after shrinking; and geometric integrality at the generic point persists on an open [11] Tags 0578, 0559. The Hilbert polynomial in the projective flat family of curves is constant; its constant term is the fiberwise Euler characteristic, locally constant in this proper flat family [11] Lemma 36.32.2, Tag 0B9T. For the orders, the identities $g_j = u pi^e$ on finitely many neighborhoods, with $u$ invertible and $pi$ a parameter for the relevant section, preserve the integer $e$. On the complement of these neighborhoods the functions and their inverses are regular. Properness of the curve ensures that these finitely many open conditions still cover every fiber after shrinking.
  We also include a presentation of the function field, so that the specialized variety will be the residue field of a valuation. Choose a separating transcendence basis $x_1 \, dots.h \, x_d$ for $L \/ l$ and a primitive element $y$ for the finite separable extension $L \/ l \( x_1 \, dots.h \, x_d \)$. Write its monic minimal polynomial as $Q \( Y \) in l \( upright(bold(x)) \) \[ Y \]$. After inverting a polynomial in $upright(bold(x))$, this gives a finite integral model over an open of affine $d$-space. Descend that model, a common dense open with the model already chosen, and the rational expressions for all the $g_j$. By geometric integrality and further localization of $R$, the reduced polynomial in every geometric fiber is irreducible of the same degree as $Q$ and gives that fiber’s function field. All denominators in the coefficients and in the expressions being used remain nonzero, and the $g_j$ agree with the specified nonzero functions there.
  #emph[Realization by a valuation.] Choose a closed point $s in "Spec" R$. Its residue field is finite, of characteristic different from $ell$. A valuation of $"Frac" R$ dominating $R_s$ extends to $l$; equivalently, one may directly choose a valuation ring of $l$ dominating $R_s$ [11] Lemma 10.50.2, Tag 00IA. Write its residue field as $lambda_0$. Since $l$ is algebraically closed, so is $lambda_0$. We may arrange that the ultimate residue field is algebraic over the finite field $kappa \( s \)$. Indeed let $b$ be the algebraic closure of $kappa \( s \)$ inside $lambda_0$, and choose a transcendence basis $cal(T)$ for $lambda_0 \/ b$. On $b \( cal(T) \)$ give the basis elements rationally independent values in an ordered free abelian group with basis $cal(T)$ and give $b^times$ value zero. Every polynomial has a unique term of least value, so this defines a valuation with residue $b$. Extend it to the algebraic extension $lambda_0 \/ b \( cal(T) \)$. Its residue extension is algebraic and thus still equals $b$. Composing valuations gives a valuation $u$ of $l$ with residue $lambda = b$. Its center on $R$ remains $s$, since the second valuation is trivial on the finite field $kappa \( s \)$. An ordered free abelian group exists for any cardinality of $cal(T)$, so this construction imposes no cardinality condition on $l$.
  Give $l \( upright(bold(x)) \)$ the Gauss extension of $u$: the values of the $x_i$ are zero and their residues are algebraically independent over $lambda$. Prolong it to $L$, obtaining $w_X$. The coefficients of $Q$ are integral at the Gauss valuation and its reduction is the specified irreducible polynomial over $lambda \( overline(upright(bold(x))) \)$. Since $Q$ is monic, $y$ is integral; its residue therefore has degree $deg Q$. The fundamental inequality for a finite extension of valued fields now forces
  $ w_X L = u l \, #h(2em) L w_X = lambda \( overline(upright(bold(x))) \, overline(y) \) . $
  Thus $w_X$ is a constant reduction with precisely the specialized function field as residue, and each $g_j$ has the prescribed residue.
  On $L w_X$, take the successive true divisor valuations of the specialized smooth flag, ending at its curve. Compose them with $w_X$. Write $w_1$ for the first composition. It is quasi-divisorial: its value group $Gamma$ has a convex kernel $bb(Z)$ over $w_X L$, while the constant values map isomorphically onto $w_X L = u l$. Consequently $Gamma \/ w_1 l tilde.equiv bb(Z)$. Every nonzero convex subgroup of $Gamma$ contains this innermost $bb(Z)$, so any proper coarsening has value group generated by constant values and loses the relative rank-one contribution. This proves the required minimality. The remaining steps are true divisor steps. Their composition $w$ is therefore a quasi-prime $\( d - 1 \)$-divisor with residue the specialized curve field. All $g_j$ are units at the successive generic points. The genus, independence, and support counts already preserved in the specialization give the three conclusions. ◻
]

=== 4.2 Five fibers control the degree <five-fibers-control-the-degree>

We now transfer the finite tests across $Theta$. The curve used for a test is allowed to depend on the tested classes; its genus bound depends only on $X$.

#thm([Proposition 4.4.])[
  #emph[For every $t in K \\ k$, 
$ sup_(a in k) s_X #scale(x: 120%, y: 120%)[\(] Theta \( \[ t - a \] \) #scale(x: 120%, y: 120%)[\)] < oo . $

]
] <prop:uniform-support>

#proof[
  Put $h_a = Theta \( \[ t - a \] \)$. The classes $\[ t - a \]$, $a in k$, are independent in $V_(k \( t \))$, as is seen from their orders at the finite points of the projective line. Lemma 16 shows that the kernel of $V_(k \( t \)) arrow.r V_K$ is finite dimensional. A basis for its intersection with the span of these classes involves only finitely many indices. After removing those indices, we have an infinite set $A subset k$ such that the classes $\[ t - a \]$, $a in A$, are independent in $V_K$.
  Choose five distinct anchors $a_1 \, dots.h \, a_5 in A$ and put $N_i = s_X \( h_(a_i) \)$. If $"char" k = 0$, choose the anchors to include $b_0 \, b_0 + 1 \, b_0 + ell$; this is possible because $k \\ A$ is finite. Fix one further $a in A$ distinct from the anchors and put $a_6 = a$. Choose representatives $g_1 \, dots.h \, g_6 in L^times$ of $h_(a_1) \, dots.h \, h_(a_6)$, and apply Proposition 18 to these representatives. Let $w$ be the resulting valuation and $C_w$ its residual curve. Their residue classes are independent, so their evaluations on $D_w$ are independent by Lemma 5. Let $v$ be the quasi-prime $\( d - 1 \)$-divisor of $K$ corresponding to $w$ under Corollary 10. The evaluations of the six functions $u_j = t - a_j$, $1 lt.eq j lt.eq 6$, on $D_v$ are independent.
  We first normalize these functions so that their residues are a pencil on $K v$. We claim that $v \( k \( t \) \) = v k$. Otherwise the nonzero relative value group of $k \( t \) \/ k$ has rational rank one, and the valuation transcendence-degree inequality forces $k \( t \) v = k v$. Equality in that inequality makes the relative value group cyclic. Any element with value in $v k$ can then be multiplied by a constant to become a unit, and its residue can be removed by a further constant. Its class consequently vanishes on $D_v$. Thus evaluation of $k \( t \)^times$ on $D_v$ factors through the cyclic relative value group and has dimension at most one, a contradiction.
  The values of all six $u_j$ are equal. If $v \( u_i \) > v \( u_j \)$, then $u_j \/ \( a_i - a_j \)$ is a principal unit, contradicting its nonzero evaluation on $D_v$. Write $gamma$ for the common value. For distinct indices, $v \( a_i - a_j \) gt.eq gamma$; a strict inequality would make $u_i \/ u_j$ a principal unit and give equal evaluations. Hence every difference $a_i - a_j$ has value exactly $gamma$. In positive characteristic the residue characteristic equals $"char" k eq.not ell$. In characteristic zero our three specified anchors give $v \( 1 \) = v \( ell \) = gamma = 0$, so again $"char" \( k v \) eq.not ell$.
  Choose $b in k^times$ with $v \( b \) = gamma$ and set
  $ tau_0 = overline(\( t - a_1 \) \/ b) \, #h(2em) beta_j = overline(\( a_j - a_1 \) \/ b) . $
  The $beta_j in k v$ are distinct and $overline(u_j \/ b) = tau_0 - beta_j$. These residue classes remain independent: the functions $u_j \/ b$ are units, their evaluations factor through $D_v \/ I_v$, and multiplication by $b$ changes no class because constants are $ell$-divisible. In particular $tau_0 in.not k v$. More precisely, the dual of the induced isomorphism $D_w \/ I_w arrow.r D_v \/ I_v$ carries $\[ tau_0 - beta_j \] in V_(K v)$ to $\[ overline(g_j) \] in V_(L w)$. Indeed their evaluations on corresponding residual characters are the evaluations of $\[ u_j \]$ and $Theta \( \[ u_j \] \) = \[ g_j \]$ on the original decomposition spaces. This identifies the individual tested classes, as well as preserving their independence.
  Proposition 15 says that $k v$, like $l w$, is algebraic over a finite field, and that the complete point families on the two residual curves correspond. Let $C_v$ be the smooth projective curve with function field $K v$. Both residue characteristics are different from $ell$; by Lemma 14, the dimensions of the common point-order kernels are twice the genera. The residual isomorphism preserves these kernels, so $g \( C_v \) = g \( C_w \) lt.eq G_X$. It also preserves the number of nonzero point orders of each tested class. For the five anchor classes these numbers are $N_1 \, dots.h \, N_5$.
  Write $p = "char" \( k v \) > 0$ and $tau_0 = tau^(p^r)$ with $r$ maximal. Such an $r$ exists because a nonconstant function has a nonzero point order, and $p^r$ must divide that fixed nonzero integer. The function $tau$ defines a separable morphism $C_v arrow.r bb(P)_(k v)^1$; write $n'$ for its degree. Multiplication of orders by $p^r$ does not change their vanishing modulo $ell$.
  Consider the fiber of this morphism over $beta_i^(1 \/ p^r)$. At most $N_i$ points in the fiber have ramification index not divisible by $ell$. The other points have index at least $ell$, so there are at most $n' \/ ell$ of them. If $r_i$ is the total number of points in the fiber, then $r_i lt.eq N_i + n' \/ ell$. Since the sum of the ramification indices in a fiber is $n'$, and the different exponent at a point is at least its index minus one, the fiber contributes at least $n' - r_i gt.eq \( 1 - 1 \/ ell \) n' - N_i$ to the different. The five fibers are disjoint. Riemann–Hurwitz, with its different term in arbitrary characteristic [11] Lemma 53.12.4, Tag 0C1F, therefore yields
  $ 2 g \( C_v \) - 2 + 2 n' gt.eq 5 \( 1 - 1 \/ ell \) n' - sum_(i = 1)^5 N_i \, $
  or
  #[#set math.equation(numbering: n => "(4.1)")
   $ #scale(x: 120%, y: 120%)[\(] 5 \( 1 - 1 \/ ell \) - 2 #scale(x: 120%, y: 120%)[\)] n' lt.eq 2 G_X - 2 + sum_(i = 1)^5 N_i . $ <eq:support-five-fibers>]
  The coefficient on the left is positive for every prime $ell$, including $ell = 2$. Hence $n'$ has a bound depending only on the five anchors and $X$.
  For the additional parameter, the zeros and poles of $tau_0 - beta_6$ lie in two fibers of this same morphism. It has at most $2 n'$ nonzero point orders modulo $ell$. The point correspondence and the finite curve test identify this number with $s_X \( h_a \)$. This proves a uniform bound for all non-anchor members of $A$. Including the anchors and the finitely many parameters outside $A$ completes the proof. ◻
]

== 5 Recovering curve subfields <sec:curve-fields>

The support bound of Proposition 19 allows us to pass from individual multiplicative classes to subfields. We prove that $Theta$ carries the mod-$ell$ multiplicative group of every relatively algebraically closed one-variable subfield of $K$ onto that of such a subfield of $L$. The geometric step is an incidence construction: infinitely many divisors of bounded degree form a family, and a curve in its parameter space produces the one-variable field. This follows the bounded-support and incidence method of [6] Sections 4–6. We give the construction and the descent argument in the finite-coefficient setting.

A #emph[curve subfield] of a function field $F \/ kappa$ is a subfield $E subset F$ containing $kappa$, relatively algebraically closed in $F$, and of transcendence degree one over $kappa$. It is finitely generated: for any $t in E \\ kappa$, it is the relative algebraic closure of $kappa \( t \)$ in $F$, which is finite over $kappa \( t \)$. The natural map $V_E arrow.r V_F$ is injective, since an $ell$-th root in $F$ of an element of $E$ is algebraic over $E$. We henceforth regard $V_E$ as a subspace of $V_F$.

=== 5.1 Two descent facts <two-descent-facts>

We first record the field-theoretic facts needed to descend the field produced by incidence. Recall that a finitely generated extension $F \/ B$ is #emph[regular] if it is separable and $B$ is relatively algebraically closed in $F$; equivalently, $F$ and an algebraic closure $overline(B)$ are linearly disjoint over $B$.

#thm([Lemma 5.1.])[
  (Descent from algebraically closed constants).  #emph[Let $F \/ B$ be a finitely generated regular extension, where $"char" \( B \) eq.not ell$ and $mu_ell subset B$. If $g in F^times$ has an $ell$-th root in $F overline(B)$, then its class in $V_F$ lies in the image of $V_B$.]
] <lem:constant-descent>

#proof[
  Choose $r in F overline(B)$ with $r^ell = g$. The element $r$ already belongs to $F B'$ for a finite Galois extension $B' \/ B$. Indeed it is separable over $F$, so purely inseparable constant extensions are unnecessary, and we may take a finite Galois closure of the remaining constant extension. By regularity, $"Gal" \( F B' \/ F \) = "Gal" \( B' \/ B \)$. For $gamma$ in this group,
  $ c_gamma = frac(gamma \( r \), r) in mu_ell . $
  These multipliers form a multiplicative cocycle with values in $B' ""^times$. Hilbert’s Theorem 90 gives $b' in B' ""^times$ with $gamma \( b' \) \/ b' = c_gamma$ for every $gamma$. Thus $r \/ b' in F$ and $b' ""^ell in B$. The equality $g = \( r \/ b' \)^ell b' ""^ell$ proves the assertion. ◻
]

#thm([Lemma 5.2.])[
  (Intersections of curve subfields).  #emph[Let $F \/ kappa$ be a finitely generated extension of an algebraically closed field of characteristic different from $ell$. If $P \, Q subset F$ are distinct curve subfields, then 
$ dim_Lambda \( V_P ∩ V_Q \) < oo . $

 Each $V_P$ is infinite dimensional. In particular, an inclusion $V_P subset V_Q$ forces $P = Q$.]
] <lem:curve-intersection>

#proof[
  The compositum $P Q$ has transcendence degree two over $kappa$. Otherwise every element of $Q$ would be algebraic over $P$, so relative algebraic closedness of $P$ in $F$ would give $Q subset P$; reversing their roles would give equality. Let $C_P \, C_Q$ be their smooth projective curves. The natural map to $C_P times C_Q$ is dominant, since its image has dimension two; consequently $P Q$ is the function field of this product.
  Inside $V_(P Q)$, any class coming from both fields has zero order along every divisor ${ x } times C_Q$. Its representative from $P$ therefore lies in the common kernel of all point orders of $C_P$. This kernel has dimension $2 g \( C_P \)$ by Lemma 14, so the intersection inside $V_(P Q)$ is finite dimensional. The maps from $V_P$ and $V_Q$ to $V_(P Q)$ are injective: each factor field is relatively algebraically closed in the function field of the product.
  The kernel of $V_(P Q) arrow.r V_F$ is finite dimensional by Lemma 16. To see that passing to $F$ preserves the finite-intersection conclusion, consider pairs $\( a \, b \) in V_P xor V_Q$ whose images in $V_F$ agree. The difference $a - b$ lies in this finite kernel; the kernel of the difference map on such pairs is the intersection already computed in $V_(P Q)$. The space of these pairs, and hence $V_P ∩ V_Q$ in $V_F$, is finite dimensional.
  Finally, choose $t in P \\ kappa$. The classes $\[ t - a \]$, $a in kappa$, are linearly independent in $V_(kappa \( t \))$, as their orders at the distinct finite points show. Lemma 16 gives only a finite-dimensional kernel on passing to $V_P$, so $V_P$ is infinite dimensional. ◻
]

=== 5.2 A family of divisors and a field of constants <a-family-of-divisors-and-a-field-of-constants>

The next lemma isolates the geometric construction. Its hypothesis says that every class under consideration becomes an $ell$-th power on almost every divisor in one fixed infinite family. The conclusion realizes all these classes as classes from a single curve field after a finite extension of the ambient field.

#thm([Lemma 5.3.])[
  (Incidence descent).  #emph[Let $X subset bb(P)_l^n$ be a normal integral projective variety of dimension $d gt.eq 2$ over an algebraically closed field $l$ of characteristic different from $ell$, and put $L = l \( X \)$. Let $cal(S)$ be an infinite set of prime divisors on $X$ whose degrees are bounded. Suppose that $H subset V_L$ is a subspace with the following property: for every $g in L^times$ with $\[ g \] in H$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ "ord"_D \( g \) = 0 quad upright("and") quad g \|_D in l \( D \)^(times ell) #h(2em) upright("for all but finitely many ") D in cal(S) . $ <eq:curve-residue-trivial>]

 Then there are a finite extension $M \/ L$ and a one-variable field $P_0 \/ l$ contained in $M$ such that $M \/ P_0$ is regular, 
#[#set math.equation(numbering: n => "(5.2)")
 $ M = L P_0 \, $ <eq:curve-compositum>]

 and the image of $H$ in $V_M$ is contained in the image of $V_(P_0)$. In particular, every $g$ as above has an $ell$-th root in $M overline(P_0)$.]
] <lem:curve-incidence>

#proof[
  #emph[A bounded parameter space.] We recall why a degree bound gives a parameter space of finite type. Integral subvarieties of fixed dimension and bounded degree in a fixed projective space have only finitely many Hilbert polynomials; see also [10] Proposition 5.3. One way to establish this boundedness is to cut them out set-theoretically by forms of bounded degree. If an integral subvariety $D subset bb(P)^n$ has dimension $r$ and degree at most $b$, and $x in.not D$, choose a linear projection to $bb(P)^(r + 1)$ whose center avoids the join of $x$ and $D$. When $D$ is already a hypersurface no projection is necessary. The projection is defined on $D$ and is finite there: a positive-dimensional fiber would contradict ampleness of the pulled-back hyperplane bundle. Its image is a hypersurface of degree at most $b$, and its equation pulls back to a form vanishing on $D$ but not at $x$. Multiplication by a form nonzero at $x$ makes the degree exactly $b$ if necessary. It follows that the degree-$b$ forms vanishing on $D$ cut it out as a reduced set.
  A fixed number of such forms, namely the dimension of the space of degree-$b$ forms, therefore places all these reduced subvarieties among the geometric reductions of fibers of one projective family of finite type. Such geometric reductions have finitely many Hilbert polynomials. For completeness, over an integral base descend the reduction of the geometric generic fiber to a finite extension of the base function field, and normalize the base in that extension. On a dense open of this finite base change, spread the reduction as a closed subscheme, with nilpotent defining ideal, flat and with geometrically reduced fibers. These properties follow after shrinking from generic flatness and spreading geometric reducedness in the resulting projective flat family [11] Tag #raw("0578"). Thus it gives exactly the geometric reductions there, with constant Hilbert polynomial. The complement upstairs has image in a proper closed subset of the original base because the normalization is finite. Noetherian induction on that closed subset proves the assertion. Applying this to the divisors in $cal(S)$ gives the required finite union of Hilbert schemes on $X$.
  #emph[The incidence fields.] In that union take a positive-dimensional irreducible component of the closure of the points corresponding to $cal(S)$. After replacing it by an integral locally closed open subset $T$, the tested points are dense in $T$, and its universal family
  $ Z subset X times T arrow.r T $
  is flat with geometrically integral fibers of dimension $d - 1$. The latter condition is available by constructibility of geometric integrality [11] Tags #raw("0579") and #raw("055B"): the tested fibers are integral over the algebraically closed field $l$, and their parameter points are dense. Choose an integral locally closed curve $T' subset T$, once and for all, and put $Z' = Z times_T T'$. Both $Z$ and $Z'$ are integral, by flatness and geometric integrality of their generic fibers. Their maps to $X$ are dominant. Indeed a proper closed subset of $X$ can contain only finitely many distinct prime divisors, whereas the fibers over the infinitely many distinct points of $T$, or of $T'$, are distinct divisors.
  The two projections now give
  $ &  & Z' &  & \
 & arrow.bl &  & arrow.br & \
X &  &  &  & T' #h(2em) #h(2em)  &  & M = l \( Z' \) &  & \
 & arrow.tr &  & arrow.tl & \
L = l \( X \) &  &  &  & P_0 = l \( T' \) . $
  Since $dim Z' = d$, the extension $M \/ L$ is finite. Geometric integrality of the generic fiber of $Z' arrow.r T'$ says precisely that $M \/ P_0$ is regular. The inclusion $Z' subset X times T'$ also shows that its function field is generated by the coordinates from the two factors, proving (5.2).
  #emph[Descent along the fixed curve.] We next show that the chosen fields work for every class in $H$. Fix $g in L^times$ with $\[ g \] in H$. Let $Y$ be the intersection of the relative smooth locus of $Z arrow.r T$ with the inverse image of the open subset of $X$ on which $g$ is a unit. Every nonempty geometric fiber of $Y arrow.r T$ is integral. Its fibers over the generic points of $T$ and $T'$ are nonempty: the corresponding incidence families dominate $X$, and the smooth locus is dense in their geometrically integral fibers. On $Y$ consider the finite étale cover defined by adjoining an $ell$-th root of $g$.
  This cover splits on a dense set of the tested fibers. Indeed (5.1) gives a rational $ell$-th root on each such divisor, and on its smooth unit locus the root and its inverse are regular, by normality. The cover therefore splits on the geometric generic fiber over $T$ as well. Otherwise, since $ell$ is prime and the constants contain $mu_ell$, its generic Kummer polynomial would be irreducible over that geometric function field. The geometric generic cover would then be integral. Geometric integrality spreads to a nonempty open of $T$ [11] Tags #raw("0578") and #raw("0559"), contradicting the dense set of split fibers.
  It remains to pass this splitting to our fixed curve $T'$. Shrinking $T$ separately for each $g$ would not justify this passage: the resulting open could miss $T'$. Instead, descend the geometric generic splitting to a finite extension of $l \( T \)$ and let $tilde(T) arrow.r T$ be the finite surjective normalization in that extension. The pullback $tilde(Y) = Y times_T tilde(T)$ is normal, since it is smooth over the normal scheme $tilde(T)$ [11] Tag #raw("034F"). It is also integral. Its generic fiber is geometrically integral, and every irreducible component dominates $tilde(T)$: on a normal scheme the components are open, and a smooth map has open image. Thus there is only one component.
  The pulled-back finite étale cover of $tilde(Y)$ is generically split, and hence split everywhere. To justify the last implication, each component is finite and birational over the normal integral base; it is therefore isomorphic to that base. Take a geometric point of $tilde(T)$ lying over the generic point of $T'$. The corresponding fiber of $tilde(Y)$ is a base change of the nonempty fiber of $Y$ over that generic point. Its split cover shows
  #[#set math.equation(numbering: n => "(5.3)")
   $ g in \( M overline(P_0) \)^(times ell) . $ <eq:curve-geometric-root>]
  This reasoning applies to each $g$ separately, while $T'$, $M$, and $P_0$ stay fixed. Lemma 20, applied to the regular extension $M \/ P_0$, now gives the asserted containment in $V_M$. ◻
]

=== 5.3 Descent to the original function field <descent-to-the-original-function-field>

We apply incidence to the image of a curve subfield under $Theta$. The last step below uses the equality $M = L P_0$ to descend all the way to $L$, rather than merely finding a curve field after a finite extension.

#thm([Theorem 5.4.])[
  (Correspondence of curve subfields).  #emph[For every curve subfield $E subset K$ there is a unique curve subfield $P subset L$ such that $Theta \( V_E \) = V_P$. This assignment is a bijection between the curve subfields of $K \/ k$ and those of $L \/ l$.]
] <thm:curve-matching>

#proof[
  Fix a normal integral projective model $X subset bb(P)_l^n$ of $L \/ l$. Let $E subset K$ be a curve subfield, choose $t in E \\ k$, and put $H = Theta \( V_E \)$. For $a in k$, let $h_a = Theta \( \[ t - a \] \)$, and let $cal(S)$ be the union of their mod-$ell$ supports on $X$. Proposition 19 bounds the degrees of these supports, and hence the degree of every prime divisor in $cal(S)$.
  The set $cal(S)$ is infinite. To see this, first observe that the kernel of all divisor-order maps on $X$ is finite dimensional. If it contained more than $2 G_X$ independent classes, apply Proposition 18 to representatives of a finite independent subset of that size. Their independent residues on the testing curve would all have zero point orders, contradicting Lemma 14 and its genus bound. On the other hand, the $\[ t - a \]$ span an infinite-dimensional subspace of $V_E$, and therefore the $h_a$ span an infinite-dimensional subspace of $V_L$. If $cal(S)$ were finite, their order vectors would lie in a finite dimensional space; the finite-dimensional kernel just proved would give a contradiction.
  We verify (5.1). For each $D in cal(S)$, some $h_a$ has nonzero order at $D$. Match the valuation of $D$ to the quasi-divisorial valuation $v$ of $K$ using Proposition 8. Its inertia $I_v$ has nonzero restriction to $E$. Consequently $v E \/ v k eq.not 0$; this group is a subgroup of the cyclic group $v K \/ v k$, and the valuation transcendence-degree inequality gives $E v = k v$. Restriction of $D_v$ to $E$ therefore factors through $v E \/ v k$ and has dimension at most one. Explicitly, an element whose value is in $v k$ can be rescaled by a constant to a unit; its residue is in $k v$, so a further constant rescaling makes it a principal unit. Since inertia already has nonzero restriction, the images of $I_v$ and $D_v$ on $E$ are the same line.
  Now let $g in L^times$ with $\[ g \] in H$. Whenever $"ord"_D \( g \) = 0$, inertia at $D$ annihilates this class. The preceding equality of restriction images, transported through $Phi$, implies that decomposition at $D$ annihilates it too. By Lemma 5, its residue is an $ell$-th power in $l \( D \)$. Since a fixed rational function has nonzero integral order at only finitely many prime divisors, this proves (5.1). Lemma 22 now supplies $M \/ L$ and $P_0 subset M$ with $M = L P_0$, $M \/ P_0$ regular, and the image of $H$ contained in the image of $V_(P_0)$.
  Choose a finite normal extension $N \/ L$ containing $M$, allowing inseparability, and let $P_N$ be the relative algebraic closure of $P_0$ in $N$. It is a curve subfield of $N \/ l$. The image $H_N$ of $H$ in $V_N$ is infinite dimensional, by Lemma 16, and lies in $V_(P_N)$. Every $L$-automorphism $gamma$ of $N$ fixes $H_N$ pointwise. Thus $H_N subset V_(P_N) ∩ V_(gamma \( P_N \))$, and Lemma 21 forces $gamma \( P_N \) = P_N$.
  Put $P_L = P_N ∩ L$. This is relatively algebraically closed in $L$. It also has transcendence degree one over $l$. Indeed the invariant field $P_N^("Aut" \( N \/ L \))$ has transcendence degree one, and it is contained in the fixed field $N^("Aut" \( N \/ L \))$. For a finite normal extension the latter is $L$ in characteristic zero and is a finite purely inseparable extension of $L$ in positive characteristic. In the latter case, a uniform $p$-power of the invariant field lies in $P_N ∩ L$, preserving transcendence degree. Thus $P_L$ is a curve subfield of $L$.
  We now use the compositum identity to obtain containment already in $V_L$. Since $P_L subset L subset M$ and every element of $P_L subset P_N$ is algebraic over $P_0$, relative algebraic closedness of $P_0$ in $M$ gives $P_L subset P_0$. The extension $P_0 \/ P_L$ is therefore finite algebraic. Choose the algebraic closures inside a common algebraically closed overfield. Then
  #[#set math.equation(numbering: n => "(5.4)")
   $ M overline(P_0) = L overline(P_L) . $ <eq:curve-exact-descent>]
  Here we used both $M = L P_0$ and the fact that $P_0$ and $P_L$ have the same algebraic closure in that overfield.
  The extension $L \/ P_L$ is regular. Relative algebraic closedness is already known, and separability is automatic in characteristic zero. In characteristic $p > 0$, choose a separating variable $u$ for $P_L \/ l$. It cannot become a $p$-th power in $L$: a $p$-th root would be algebraic over $P_L$ and hence belong to $P_L$, contrary to the choice of $u$. Over the perfect field $l$, such an element extends to a separating transcendence basis of $L \/ l$, by the usual $p$-basis criterion. Thus $L \/ l \( u \)$, and therefore $L \/ P_L$, is separable.
  For each $\[ g \] in H$, Lemma 22 and (5.4) give an $ell$-th root of $g$ in $L overline(P_L)$. Applying Lemma 20 once more, now to $L \/ P_L$, yields the exact inclusion $Theta \( V_E \) subset V_(P_L)$.
  Apply the same argument to $Theta^(- 1)$ and $P_L$. For a curve subfield $E_1$ of $K$, it gives
  $ Theta \( V_E \) subset V_(P_L) subset Theta \( V_(E_1) \) . $
  Lemma 21 and the infinite dimension of $V_E$ force $E = E_1$. Both inclusions are consequently equalities. The same argument with $K$ and $L$ reversed proves surjectivity of the matching, and Lemma 21 proves its uniqueness. ◻
]

== 6 True divisors and rational subfields <sec:good-functions>

The curve-subfield correspondence lets us distinguish valuations trivial on the constants from the quasi-divisorial valuations recovered in Section 2. Their restrictions to curve subfields will then identify a family of rational functions with enough point information to recover field operations.

A #emph[true prime divisor], or #emph[divisorial valuation], of $F \/ kappa$ is a quasi-prime divisor trivial on $kappa$. Its value group is $bb(Z)$; we use the discrete normalization when writing its order character.

The true-divisor criterion below has as a methodological antecedent Topaz’s rational-character criterion [14] Lemma A.7, via the companion reconstruction manuscript [6] Sections 4–6. Here finite coefficients require the finite-dimensional-kernel argument given below; the rational-coefficient statement is not being invoked as a proof of this proposition.

#thm([Proposition 6.1.])[
  (Recognition of true divisors).  #emph[Let $F \/ kappa$ be one of $K \/ k$ or $L \/ l$. A quasi-divisorial valuation $v$ of $F \/ kappa$ is a true prime divisor if and only if there is a curve subfield $E subset F$ for which 
#[#set math.equation(numbering: n => "(6.1)")
 $ dim_Lambda \( V_E ∩ D_v^perp \) < oo . $ <eq:good-true-test>]

 Consequently $Phi$ matches the inertia and decomposition groups of true prime divisors of $L \/ l$ with those of $K \/ k$.]
] <prop:true-divisors>

#proof[
  Suppose first that $v$ is trivial on $kappa$. Since the residue field has transcendence degree $d - 1 gt.eq 1$, choose a unit $t$ with transcendental residue, and let $E$ be the relative algebraic closure of $kappa \( t \)$ in $F$. The valuation is trivial on $kappa \( t \)$ and therefore on its algebraic extension $E$. Reduction embeds $E$ into $F v$. Its induced map $V_E arrow.r V_(F v)$ has finite-dimensional kernel by Lemma 16. Lemma 5 identifies that kernel with $V_E ∩ D_v^perp$, proving (6.1).
  Conversely, suppose that the restriction of $v$ to $kappa$ is nontrivial, and let $E$ be any curve subfield. Choose $x in E \\ kappa$ with $v \( x \) gt.eq 0$, replacing a nonconstant element by its inverse if necessary. There are infinitely many $c in kappa^times$ with $v \( c \) > 0$, for example the positive powers of one such element. Each $1 + c x$ is a principal unit for $v$. Their classes are independent in $V_(kappa \( x \))$: up to constant factors they are $\[ x + c^(- 1) \]$, with distinct zeros on the rational curve. The map to $V_E$ has only a finite-dimensional kernel by Lemma 16. These principal units therefore span an infinite-dimensional subspace of $V_E ∩ D_v^perp$. This disproves (6.1) for every $E$. The final assertion now follows from Theorem 23 and the already established matching of quasi-divisorial pairs. ◻
]

For a curve subfield $E subset F$, restriction of characters gives a continuous surjection $A_F arrow.r A_E$, dual to the inclusion $V_E subset V_F$. If a true divisor restricts nontrivially as a valuation on $E$, that restriction is a positive integer multiple of a point valuation of the smooth projective curve of $E$. Its inertia image in $A_E$ is either the corresponding point line or zero; the latter occurs when that integer is divisible by $ell$. Thus we retain the nonzero inertia images when discussing which point lines are detected.

#prodef([Definition 6.2.])[
  A curve subfield $E subset F$ is #emph[good] if it is rational over the constants and every point line in $A_E$ is the nonzero image of the inertia of some true divisor of $F$. A #emph[good function] is an element $t in F$ generating a good subfield $kappa \( t \)$.
] <def:good-subfield>

#thm([Proposition 6.3.])[
  (Recognition of good subfields).  #emph[The curve-subfield correspondence of Theorem 23 restricts to a bijection on good subfields. For matched good subfields $E subset K$ and $P subset L$, the induced character isomorphism gives a bijection between the points of their smooth projective rational curves.]
] <prop:good-matching>

#proof[
  For each curve subfield $E$, let $cal(Q)_E$ be the collection of nonzero images of true divisorial inertia in $A_E$. By Proposition 24, these collections correspond under the induced character isomorphisms. They are subfamilies of the point lines of $E$. Choose a nonzero generator of each line. The generators tend to zero outside finite sets, so summation defines a continuous map from a product of copies of $Lambda$ into $A_E$.
  By Lemma 14, when every point occurs, this summation map has one-dimensional kernel, generated by a coefficient family with every coordinate nonzero. A proper subfamily of the point lines has no relation: extending any proposed relation by zero to the missing points would contradict the description of the full relation kernel. Hence the stated kernel property recognizes exactly when $cal(Q)_E$ contains every point line. Once this holds, the common kernel of their orders on $V_E$ has dimension $2 g \( E \)$. Its vanishing recognizes genus zero, equivalently rationality over the algebraically closed constants. Both conditions are preserved by the character isomorphisms. Finally, distinct points have distinct inertia lines, so their matching gives the asserted point bijection. ◻
]

We now construct enough good functions for the later reconstruction. The construction is local on a smooth model: a ratio of two transverse parameters has a multiplicity-one divisor over every value, and the exceptional divisor of the blowup ensures that the resulting rational subfield is relatively algebraically closed.

#thm([Lemma 6.4.])[
  (A supply of good functions).  #emph[Let $F \/ kappa$ be a finitely generated extension of an algebraically closed field with $"trdeg" \( F \/ kappa \) gt.eq 2$ and $"char" \( kappa \) eq.not ell$. On an integral model of $F \/ kappa$, let $q$ be a smooth closed point and let $a \, b$ be rational functions regular at $q$, vanishing there, with independent differentials in the cotangent space at $q$. Then $t = a \/ b$ is a good function. Moreover, for every $f in F^times$ there is a good function $t$ such that $f t$ is good. Consequently good functions generate $F$ over $kappa$, and their classes span $V_F$.]
] <lem:good-functions>

#proof[
  Blow up the smooth point $q$ and let $v$ be the valuation of the exceptional divisor. Write $e = "trdeg" \( F \/ kappa \)$. Its residue field is the rational field of $bb(P)_kappa^(e - 1)$. The leading linear forms of $a$ and $b$ give independent homogeneous coordinates on the exceptional divisor. Their ratio is the residue of $t$ and is a rational coordinate in $F v$. In particular $v$ is trivial on $kappa \( t \)$, and $kappa \( overline(t) \)$ is relatively algebraically closed in $F v$. The relative algebraic closure of $kappa \( t \)$ in $F$ is a finite algebraic extension on which $v$ is still trivial. It therefore embeds by reduction into $F v$, over $kappa \( t \) tilde.equiv kappa \( overline(t) \)$. Relative algebraic closedness in the residue field forces this extension to be $kappa \( t \)$ itself.
  For each $c in kappa$, the function $a - c b$ has nonzero linear term at $q$ and cuts out a prime divisor locally there, with order one. The function $b$ is a unit at its generic point because the linear terms of $a$ and $b$ are independent. The resulting true divisor has $"ord" \( t - c \) = 1$ and detects the point $c$ of $bb(P)_kappa^1$. The divisor locally cut out by $b$ similarly detects infinity: $a$ is a unit at its generic point and $t$ has a simple pole. Every point line is thus detected, proving that $t$ is good.
  Given $f in F^times$, choose the smooth point $q$ in an open set where $f$ is a unit, and choose $a \, b$ as above. The functions $f a \, b$ also vanish at $q$ with independent differentials, since $d \( f a \)_q = f \( q \) thin d a_q$. Hence both $f t = \( f a \) \/ b$ and $t = a \/ b$ are good. The equality $f = \( f t \) \/ t$ proves field generation, and $\[ f \] = \[ f t \] - \[ t \]$ proves the spanning assertion for $V_F$. ◻
]

#thm([Lemma 6.5.])[
  (A common partner).  #emph[For any finite list of good functions $t_1 \, dots.h \, t_m$ of $F \/ kappa$ there is a good function $s$ such that $s$ is algebraically independent of each $t_i$ over $kappa$ and 
$ t_i + c s med upright("is good for every ") i upright(" and every ") c in kappa^times . $

]
] <lem:common-partner>

#proof[
  Choose a smooth closed point $q$ on a model where all the $t_i$ are regular, and choose $a \, b$ vanishing at $q$ with independent differentials. Put $s = a \/ b$. It is good by Lemma 27. For $c eq.not 0$, write
  $ t_i + c s = frac(t_i b + c a, b) . $
  At $q$ the numerator has differential $t_i \( q \) thin d b_q + c thin d a_q$, which is independent of $d b_q$. The same lemma therefore makes every indicated sum good.
  Let $v$ be the exceptional-divisor valuation at $q$ used in the preceding lemma. The residue of $s$ is transcendental over $kappa$. By contrast, the restriction of $v$ to $kappa \( t_i \)$ is centered at the finite point $t_i \( q \)$: the nonzero function $t_i - t_i \( q \)$ has positive order at $q$. Its residue field is consequently $kappa$. If $s$ were algebraic over $kappa \( t_i \)$, relative algebraic closedness of that good subfield in $F$ would imply $s in kappa \( t_i \)$, contradicting its transcendental residue. This proves the required independence. ◻
]

== 7 Recovering the field from simultaneous values <sec:field>

The preceding section recovers the good rational subfields and the points of their projective lines. We now recover the field operations from this information. A single true divisor can detect the values of several good functions at once. The resulting correspondence of algebraic relations will first identify the constant fields and then give an isomorphism of the perfect closures.

For every good function $t in K$, choose a generator $t' in L$ of the good rational subfield matched with $k \( t \)$ by Proposition 26. Its point correspondence, expressed in these coordinates, is a bijection

$ B_t : bb(P)^1 \( k \) arrow.r bb(P)^1 \( l \) . $

Changing $t'$ by a projective linear transformation, we arrange $B_t \( oo \) = oo$. These choices are made independently for the different good functions. At this stage the maps $B_t$ are only bijections of sets.

=== 7.1 Simultaneous values <simultaneous-values>

For a finite tuple $upright(bold(t)) = \( t_1 \, dots.h \, t_m \)$ of good functions, let $X_(upright(bold(t))) subset \( bb(P)_k^1 \)^m$ be the reduced closure of the image of the rational map defined by the $t_i$ on a model of $K \/ k$. Thus $X_(upright(bold(t)))$ is the irreducible variety of algebraic relations among the $t_i$. Define $Y_(upright(bold(t))) subset \( bb(P)_l^1 \)^m$ in the same way from the chosen $t'_i$.

#thm([Lemma 7.1.])[
  (Simultaneous values).  #emph[For every finite tuple $upright(bold(t))$ of good functions there are dense open subsets $U subset X_(upright(bold(t)))$ and $U' subset Y_(upright(bold(t)))$ such that 
#[#set math.equation(numbering: n => "(7.1)")
 $ (product_i B_(t_i)) \( U \( k \) \) subset Y_(upright(bold(t))) \( l \) \, #h(2em) (product_i B_(t_i)^(- 1)) \( U' \( l \) \) subset X_(upright(bold(t))) \( k \) . $ <eq:field-simultaneous>]

]
] <lem:simultaneous-values>

#proof[
  Choose a smooth model open on which all the $t_i$ are regular and all the differentials $d t_i$ are nowhere zero. Such an open exists. In positive characteristic, $t_i$ cannot be a $p$-th power in $K$, since its $p$-th root would be algebraic over the relatively algebraically closed subfield $k \( t_i \)$. As $k$ is perfect, this gives $d t_i eq.not 0$; in characteristic zero the same conclusion is immediate.
  At a closed point $P$ of this open, write $a_i = t_i \( P \)$. The exceptional divisor of the blowup at $P$ defines a true divisorial valuation $v$ with
  $ "ord"_v \( t_i - a_i \) = 1 #h(2em) upright("for every ") i . $
  Indeed $d t_i \( P \) eq.not 0$ says that $t_i - a_i$ has order one in the maximal ideal of the regular local ring at $P$. Thus restriction of $I_v$ to each $k \( t_i \)$ is the nonzero point line at $a_i$.
  By Proposition 24, the matched valuation on $L$ is a true divisor. Restriction of characters commutes with the correspondence of good subfields, so its center in the $t'_i$-line is $B_(t_i) \( a_i \)$ for every $i$. Specializing the target tuple along this valuation shows that $\( B_(t_i) \( a_i \) \)_i$ belongs to $Y_(upright(bold(t))) \( l \)$: the generic tuple lies in that closed subvariety of the product of projective lines, and so does its specialization.
  The image of the chosen model open in $X_(upright(bold(t)))$ is constructible and dense, hence contains a dense open subset $U$. Every $k$-point of $U$ has a closed preimage, since its nonempty fiber is of finite type over the algebraically closed field $k$. This proves the first inclusion in (7.1). The same argument for $Theta^(- 1)$ proves the second. ◻
]

These inclusions provide information in the Zariski topology without asserting that any $B_t$ preserves that topology. We next apply them to the relation $z = t + c s$. This will force the coordinate bijections to have a common field-theoretic form.

=== 7.2 Aligning the constant fields <aligning-the-constant-fields>

An element of $l \( X_1 \, dots.h \, X_r \)^i$ will be called a #emph[perfect rational function]. It has a well-defined value at a general tuple of $l$-points: in positive characteristic one first raises it to a sufficiently large $p$-power and then takes the unique corresponding root in $l$. Here and below, #emph[general] means belonging to a suitable dense open.

Let $cal(H)_l$ be the group of permutations of $bb(P)^1 \( l \)$ generated by $"PGL"_2 \( l \)$, together with $x mapsto x^p$ when $"char" l = p > 0$.

#thm([Lemma 7.2.])[
  #emph[A perfect rational function in one variable that is injective on a cofinite subset of $bb(P)^1 \( l \)$ agrees there with a unique member of $cal(H)_l$. In characteristic zero, $cal(H)_l = "PGL"_2 \( l \)$; in characteristic $p > 0$, every member has a unique expression 
$ M compose "Frob"^n \, #h(2em) M in "PGL"_2 \( l \) \, quad n in bb(Z) . $

 In particular, $cal(H)_l$ embeds in the group of permutations of $bb(P)^1 \( l \)$ modulo agreement outside finite sets.]
] <lem:cofinite-rational>

#proof[
  In characteristic zero, injectivity on a cofinite set implies that a rational map has degree one. In characteristic $p$, choose $N gt.eq 0$ such that the given function $h$ satisfies $h^(p^N) = r in l \( X \)$. Write $r = q^(p^a)$, with $a gt.eq 0$ maximal and $q in l \( X \)$ separating. The map $q$ is also injective on a cofinite set, so its degree is one. Indeed a separating map of degree greater than one has more than one distinct point over a general value, and deleting finitely many points cannot change this. Thus $q$ is projective linear, and $h = "Frob"^(a - N) compose q$ on points.
  Conjugating a projective linear transformation by Frobenius raises its coefficients to $p$-th powers. This proves the asserted normal form. No nonzero power of Frobenius is projective linear: for a positive exponent the corresponding map has inseparable degree greater than one, and a negative exponent reduces to this case by inversion. The normal form is therefore unique. Finally, two perfect rational functions agreeing cofinitely are equal, as is seen after clearing Frobenius powers and comparing ordinary rational functions. ◻
]

Write $T_a \( x \) = x + a$ and $m_c \( x \) = c x$, fixing $oo$; these transformations generate $"Aff" \( k \)$. We compare bijections of projective point sets modulo finite disagreement. Composition is well defined with this convention, because bijections carry finite sets to finite sets. Membership in $cal(H)_l$ in the next lemma means membership after this identification. Lemma 30 ensures that the representing member of $cal(H)_l$ is unique.

#thm([Lemma 7.3.])[
  (Transported addition).  #emph[Let $t \, s$ be algebraically independent good functions such that $z_c = t + c s$ is good for every $c in k^times$. For every $c in k^times$ there is a perfect rational function $R_c in l \( X \, Y \)^i$ such that 
#[#set math.equation(numbering: n => "(7.2)")
 $ R_c \( x \, y \) = B_(z_c) #scale(x: 120%, y: 120%)[\(] B_t^(- 1) \( x \) + c B_s^(- 1) \( y \) #scale(x: 120%, y: 120%)[\)] #h(2em) upright("for general ") \( x \, y \) in l^2 . $ <eq:field-sum>]

 The one-variable slices of these functions give 
#[#set math.equation(numbering: n => "(7.3)")
 $ B_s B_t^(- 1) in cal(H)_l \, #h(2em) B_t "Aff" \( k \) B_t^(- 1) subset cal(H)_l . $ <eq:field-affine>]

 The second inclusion is an embedding of groups.]
] <lem:field-affine>

#proof[
  Consider the relation variety $Y$ for $\( t \, s \, z_c \)$. Its projection to the first two factors is dominant. Indeed $k \( t \)$ and $k \( s \)$ are distinct curve subfields, so their matched subfields $l \( t' \)$ and $l \( s' \)$ are distinct. Any two distinct curve subfields have compositum of transcendence degree two: if their compositum had transcendence degree one, relative algebraic closedness would make them equal.
  On the dense open of $Y$ given by the inverse inclusion in Lemma 29, the third coordinate is forced by the first two to be
  $ B_(z_c) #scale(x: 120%, y: 120%)[\(] B_t^(- 1) \( x \) + c B_s^(- 1) \( y \) #scale(x: 120%, y: 120%)[\)] . $
  We restrict to finite coordinates, which is permitted because all the coordinate functions are nonconstant and the $B$’s fix $oo$. If $dim Y = 3$, then $Y = \( bb(P)_l^1 \)^3$, and a dense open has infinitely many third coordinates above a general pair $\( x \, y \)$, a contradiction. Consequently $dim Y = 2$.
  The projection $Y arrow.r \( bb(P)_l^1 \)^2$ is proper, dominant and generically finite. The complement of the open just used has dimension at most one, so its image is a proper closed subset of the base. After removing that image and restricting to the locus of finite fibers, every closed fiber has precisely one point. Thus the finite extension $l \( Y \) \/ l \( x \, y \)$ has separable degree one. Indeed, in positive characteristic write the minimal polynomial of the third coordinate as $g \( Z^(p^e) \)$, with $g$ separable; in characteristic zero take the minimal polynomial itself. After shrinking the base to preserve the degree and nonzero discriminant of the separable polynomial, the separable degree counts the distinct points of a general fiber, since taking $p^e$-th roots is a bijection on algebraically closed points. The extension is therefore purely inseparable, and the third coordinate gives a perfect rational function $R_c$ satisfying (7.2).
  Fixing a general $y$ in (7.2) gives a perfect rational function of $x$, agreeing cofinitely with a bijection. A dense open in $\( bb(P)_l^1 \)^2$ has cofinite fibers outside finitely many values of $y$. Since $B_s$ is a bijection, Lemma 30 therefore gives
  $ D_b := B_(z_c) T_(c b) B_t^(- 1) in cal(H)_l #h(2em) upright("for cofinitely many ") b in k . $
  For two such parameters,
  $ D_b^(- 1) D_(b') = B_t T_(c \( b' - b \)) B_t^(- 1) . $
  Every element of $k$ is a difference of two members of a cofinite subset: for any prescribed difference, the two required cofinite sets intersect. Hence all translations conjugated by $B_t$ belong to $cal(H)_l$. The products $D_b D_(b')^(- 1)$ give the same assertion for $B_(z_c)$, and then $D_b$ gives $B_(z_c) B_t^(- 1) in cal(H)_l$.
  Fixing a general $x$ instead yields
  $ B_(z_c) T_a m_c B_s^(- 1) in cal(H)_l #h(2em) upright("for cofinitely many ") a in k . $
  Composing on the left successively with
  $ B_(z_c) T_(- a) B_(z_c)^(- 1) quad upright("and") quad B_t B_(z_c)^(- 1) \, $
  both already in $cal(H)_l$, gives
  $ B_t m_c B_s^(- 1) in cal(H)_l #h(2em) \( c eq.not 0 \) . $
  At $c = 1$ this gives $B_s B_t^(- 1) in cal(H)_l$. Composing again gives all conjugated multiplications $B_t m_c B_t^(- 1)$. This proves (7.3). Finally, two distinct affine transformations cannot agree outside a finite set; conjugating by a bijection preserves this property. Thus the resulting homomorphism is injective. ◻
]

We have obtained an affine group action by perfect rational transformations. Its translation subgroup will identify the addition on the constants. The two-variable function $R_1$ is then needed to show that the resulting embedding of constant fields is onto.

#thm([Proposition 7.4.])[
  (Alignment of the constants).  #emph[The fields $k$ and $l$ have the same characteristic. There is a field isomorphism $sigma : k arrow.r l$ such that, for every good function $t$, there is $H_t in cal(H)_l$ with 
#[#set math.equation(numbering: n => "(7.4)")
 $ B_t = H_t compose sigma #h(2em) upright("outside a finite subset of ") bb(P)^1 \( k \) \, $ <eq:field-alignment>]

 where $sigma \( oo \) = oo$.]
] <prop:constant-alignment>

#proof[
  Choose a good function $t$, and use Lemma 28 to choose a good $s$ satisfying the hypotheses of Lemma 31. First consider the embedding $B_t "Aff" \( k \) B_t^(- 1) subset cal(H)_l$, with the finite-agreement convention of that lemma.
  #emph[The affine image is projective linear.] In positive target characteristic the Frobenius exponent defines a homomorphism $cal(H)_l arrow.r bb(Z)$. Its restriction to the affine image is zero: $k^times$ is divisible, while the additive group of $k$ is divisible in characteristic zero and torsion in positive characteristic. Both groups therefore have zero image in $bb(Z)$, and they generate $"Aff" \( k \)$. In characteristic zero for $l$, there is no exponent to consider. We have in either case an embedding into $"PGL"_2 \( l \)$.
  #emph[Translations yield a field embedding.] Let $U$ be the image of the translation subgroup. This is an infinite abelian subgroup of $"PGL"_2 \( l \)$, normalized by the whole affine image. It cannot contain a nonidentity semisimple element. To see this, such an element has two fixed points, and every element of $U$ preserves their pair. The subgroup fixing both points has index at most two in $U$; it is infinite, hence contains an element of order greater than two. The centralizer of that element is the torus fixing the two points, so all of $U$ lies in that torus. Any transformation normalizing $U$ preserves the same pair and acts on $U$ by either identity or inversion. This contradicts the faithful conjugation action of $k^times$ on its additive group in $"Aff" \( k \)$.
  Every nonidentity element of $U$ is consequently unipotent. Conjugate the image in $"PGL"_2 \( l \)$ so that one such element is a translation with unique fixed point $oo$. Its centralizer consists of translations, and hence so does $U$. Write this conjugation as postcomposition $B = M B_t$, with $M in "PGL"_2 \( l \)$. We obtain an injective additive map $chi : k arrow.r l$ for which
  #[#set math.equation(numbering: n => "(7.5)")
   $ B T_b B^(- 1) = T_(chi \( b \)) #h(2em) upright("modulo finite disagreement") . $ <eq:field-translation>]
  After rescaling the target coordinate, assume $chi \( 1 \) = 1$. The image of $m_c$ normalizes $U$, hence fixes $oo$, and is an affine transformation of some slope $lambda_c$. Conjugating translations gives
  $ chi \( c b \) = lambda_c chi \( b \) . $
  Setting $b = 1$ gives $lambda_c = chi \( c \)$. Thus $chi$ is multiplicative as well as additive and is a field embedding. In particular, the characteristics of $k$ and $l$ agree.
  #emph[The field embedding is onto.] Set $z = t + s$. Lemma 31 gives members $M_s \, M_z in cal(H)_l$ such that
  $ B_s = M_s B \, #h(2em) B_z = M_z B #h(2em) upright("modulo finite disagreement") . $
  Using $R_1$ from (7.2), define the perfect rational function
  $ F \( X \, Y \) = M_z^(- 1) #scale(x: 120%, y: 120%)[\(] R_1 \( M^(- 1) X \, M_s Y \) #scale(x: 120%, y: 120%)[\)] . $
  For cofinitely many $b in k$, and for each such $b$ for cofinitely many $X in l$, equations (7.2) and (7.5) give
  #[#set math.equation(numbering: n => "(7.6)")
   $ F \( X \, B \( b \) \) = B #scale(x: 120%, y: 120%)[\(] B^(- 1) \( X \) + b #scale(x: 120%, y: 120%)[\)] = X + chi \( b \) . $ <eq:field-slice>]
  Here is the order of the exclusions. First exclude the finitely many values of $b$ at which $B \( b \)$ is infinite, the equality $B_s = M_s B$ fails, or the corresponding vertical fiber misses the open of (7.2). For each remaining $b$, that open excludes only finitely many $X$; the equality $B_z = M_z B$ excludes finitely many more, since its argument is a bijective function of $X$. Finally (7.5) excludes a finite set of $X$, which may depend on $b$.
  For each fixed remaining $b$, (7.6) is therefore an identity of perfect rational functions in $X$. Choose $X_0 in l$ such that $F \( X_0 \, Y \)$ is defined and finite for general $Y$. This choice is possible by expressing a power of $F$ as a quotient of polynomials and choosing $X_0$ for which its denominator does not vanish identically as a polynomial in $Y$. Define
  $ h \( Y \) = F \( X_0 \, Y \) - X_0 . $
  For all but finitely many of the remaining $b$, the denominator is nonzero at $Y = B \( b \)$; evaluating the rational identity then gives
  $ chi \( b \) = h \( B \( b \) \) . $
  In particular, this evaluation does not require $X_0$ to avoid the original exceptional sets for all $b$ at once.
  The injectivity of $chi$ implies that $h$ is injective on a cofinite subset of $bb(P)^1 \( l \)$. By Lemma 30, it represents a member of $cal(H)_l$, so $chi \( k \)$ contains a cofinite subset of $l$. An infinite proper subfield cannot be cofinite: if $a in.not chi \( k \)$, the infinite coset $a + chi \( k \)$ is disjoint from it. Thus $chi \( k \) = l$. Taking $sigma = chi$, the equality $sigma = h B = h M B_t$ outside a finite set proves (7.4) for our initial $t$.
  #emph[The same constant isomorphism works for every good function.] For any other good function $r$, Lemma 28 supplies one good $s_0$ that is algebraically independent of both $t$ and $r$, with $t + c s_0$ and $r + c s_0$ good for every $c eq.not 0$. Lemma 31 gives $B_(s_0) B_t^(- 1) \, B_(s_0) B_r^(- 1) in cal(H)_l$, hence $B_r B_t^(- 1) in cal(H)_l$. The alignment already obtained for $t$ therefore gives (7.4) for $r$, with the same $sigma$. ◻
]

=== 7.3 The isomorphism of perfect closures <the-isomorphism-of-perfect-closures>

Fix $sigma$ and the $H_t$ given by Proposition 32, and define

$ u_t = H_t^(- 1) \( t' \) in L^i #h(2em) upright("for every good function ") t . $

These are field elements, obtained by projective linear operations and Frobenius powers. They satisfy

#[#set math.equation(numbering: n => "(7.7)")
 $ l \( u_t \)^i = l \( t' \)^i . $ <eq:field-good-perfect>]

We show that the assignments $t mapsto u_t$ preserve every algebraic relation. This is the point where the finite exceptions in the individual coordinate alignments cease to matter.

#thm([Theorem 7.5.])[
  #emph[There is a field isomorphism 
$ alpha : K^i arrow.r^(med tilde.op med) L^i \, #h(2em) alpha \|_k = sigma \, $

 such that $alpha \( t \) = u_t$ for every good function $t$. In particular, if $k \( t \)$ and $l \( t' \)$ are matched good rational subfields, then $alpha \( k \( t \)^i \) = l \( t' \)^i$.]
] <thm:field-isomorphism>

#proof[
  Let $upright(bold(t)) = \( t_1 \, dots.h \, t_m \)$ be a finite tuple of good functions, and let $Z_(upright(bold(t))) subset \( bb(P)_l^1 \)^m$ be the relation variety of $\( u_(t_1) \, dots.h \, u_(t_m) \)$. We first prove
  #[#set math.equation(numbering: n => "(7.8)")
   $ sigma #scale(x: 120%, y: 120%)[\(] X_(upright(bold(t))) \( k \) #scale(x: 120%, y: 120%)[\)] = Z_(upright(bold(t))) \( l \) \, $ <eq:field-relations>]
  where $sigma$ acts coordinatewise.
  The point map
  $ cal(H) = product_i H_(t_i)^(- 1) : \( bb(P)^1 \( l \) \)^m arrow.r \( bb(P)^1 \( l \) \)^m $
  is a Zariski homeomorphism. Projective linear maps are isomorphisms; in positive characteristic the coordinate map $\[ X : Y \] mapsto \[ X^p : Y^p \]$ is finite, radicial and surjective, hence a homeomorphism on point spaces, as is its inverse. Products with different powers in different coordinates have the same property. It follows that
  $ cal(H) #scale(x: 120%, y: 120%)[\(] Y_(upright(bold(t))) \( l \) #scale(x: 120%, y: 120%)[\)] = Z_(upright(bold(t))) \( l \) . $
  To justify this last equality at the level of relation varieties, place the finite tuple of $u_(t_i)$ in one finite purely inseparable extension of $L$. On a common model, the tuples $\( t'_i \)_i$ and $\( u_(t_i) \)_i$ are related by $cal(H)$ wherever they are defined. Their images are dense in their respective relation varieties. Taking closures under the homeomorphism gives the equality.
  Apply now the first inclusion of Lemma 29. Delete from its source open the finitely many exceptional values in each coordinate where (7.4) fails. Each deleted coordinate fiber is a proper closed subset, since every $t_i$ is nonconstant. The resulting open is still dense, and on it $cal(H) compose product_i B_(t_i) = sigma$. Consequently a dense subset of $sigma \( X_(upright(bold(t))) \( k \) \)$ lies in $Z_(upright(bold(t))) \( l \)$. The former is the point set of the variety obtained from $X_(upright(bold(t)))$ by applying $sigma$ to coefficients, so taking closures gives
  $ sigma \( X_(upright(bold(t))) \( k \) \) subset Z_(upright(bold(t))) \( l \) . $
  For the reverse inclusion, use the second inclusion of Lemma 29. Delete the finitely many target coordinate values at which $B_(t_i)^(- 1) = sigma^(- 1) H_(t_i)^(- 1)$ fails. Again this leaves a dense open, now in $Y_(upright(bold(t)))$, because each target coordinate is nonconstant. Its image under $cal(H)$ is dense in $Z_(upright(bold(t)))$ and lies in $sigma \( X_(upright(bold(t))) \( k \) \)$. Taking closures proves (7.8).
  Thus, for every polynomial $P in k \[ T_1 \, dots.h \, T_m \]$,
  $ P \( t_1 \, dots.h \, t_m \) = 0 quad arrow.l.r.double quad sigma \( P \) \( u_(t_1) \, dots.h \, u_(t_m) \) = 0 \, $
  where $sigma \( P \)$ is obtained by applying $sigma$ to the coefficients. Good functions generate $K$ by Lemma 27. The displayed equivalence for every finite tuple makes the assignments $a mapsto sigma \( a \)$ for $a in k$ and $t mapsto u_t$ for good $t$ well defined on all polynomial expressions, and preserves their nonzero values. Passing to quotients therefore gives an embedding $alpha_0 : K arrow.r.hook L^i$.
  Because $L^i$ is perfect, this embedding extends uniquely to an embedding $alpha : K^i arrow.r.hook L^i$. Its image contains $l = sigma \( k \)$ and every $u_t$, and is itself perfect; by (7.7) it contains the perfection of every matched good rational subfield of $L$. All good rational subfields are matched, and their generators generate $L$. The image of $alpha$ therefore contains $L^i$, proving surjectivity and the final assertion. ◻
]

== 8 Compatibility and uniqueness <sec:compatibility>

Theorem 33 gives an isomorphism of perfect fields that carries the perfection of every good rational subfield to the perfection of its match under $Theta$. We must prove that its action on all multiplicative classes is $Theta$ up to a single scalar. We then determine which field automorphisms act by scalars.

=== 8.1 Distinguishing divisors by rational subfields <distinguishing-divisors-by-rational-subfields>

For a true prime divisor $v$ and a good rational subfield $E subset K$, consider the restriction $D_v arrow.r A_E$. Its rank here means the dimension of its image as a $Lambda$-vector space.

#thm([Lemma 8.1.])[
  #emph[Let $v$ be a true prime divisor of $K \/ k$ and let $E subset K$ be a curve subfield. The restriction $v \|_E$ is trivial if and only if the image of $D_v arrow.r A_E$ is infinite-dimensional. If $v \|_E$ is nontrivial, this image has dimension at most one.]
] <lem:restriction-rank>

#proof[
  If $v \|_E$ is trivial, reduction embeds $E$ in $K v$. The kernel of $V_E arrow.r V_(K v)$ is finite-dimensional by Lemma 16, whereas $V_E$ is infinite-dimensional. Dualizing and using Lemma 5 shows that the restriction of $D_v$ to $A_E$ has infinite-dimensional image.
  Otherwise $v \|_E$ is a positive multiple of the order at a point $x$ of the smooth projective curve of $E \/ k$. If $f$ is a unit there, its residue is some $c in k^times$, and $f \/ c$ is a principal $v$-unit in $K$. Every character in $D_v$ therefore kills $f$. Its restriction to $E$ factors through the value group of $v \|_E$, which is cyclic. The image has dimension at most one. This argument uses decomposition characters; it remains valid if the ramification multiplicity is divisible by $ell$. ◻
]

#thm([Lemma 8.2.])[
  #emph[For distinct true prime divisors $v_1 \, v_2$ of $K \/ k$, there is a good rational subfield $E subset K$ such that $v_1 \|_E$ is trivial and $v_2 \|_E$ is nontrivial.]
] <lem:separate-divisors>

#proof[
  Choose a normal projective model $X$ on which both valuations have codimension-one centers $D_1 \, D_2$. We recall why this is possible. For each valuation, lifts of a residue transcendence basis, together with a uniformizer, define a rational subfield over which $K$ is finite. Normalization of a suitable projective model of that subfield realizes the valuation as a prime divisor. A common normal projective model dominating the two models retains codimension-one centers: the residue field of each new center contains that of the old center, of transcendence degree $d - 1$ over $k$.
  Choose two distinct closed points $P \, Q$ of $D_1 \\ D_2$, and a smooth closed point $R$ of $X \\ \( D_1 union D_2 \)$. The first choice is possible because $d gt.eq 2$. There is an affine open containing these points and meeting $D_2$; write its coordinate ring as $A$, and let $frak(p)_2$ be the prime ideal of $D_2$ there. Choose two independent cotangent vectors at $R$. The Chinese remainder theorem, applied to $frak(p)_2 \, frak(m)_P \, frak(m)_Q \, frak(m)_R^2$, produces $a \, b in A$ satisfying
  $ & D_2 & P & Q\
a & 0 & 0 & 1\
b & 1 & 1 & 1 $
  and having value zero and the prescribed independent first-order terms at $R$. These ideals are pairwise comaximal, so the prescriptions are independent. By Lemma 27, $t = a \/ b$ is good. Its residue on $D_1$ is nonconstant, since it takes different values at $P \, Q$, and its value along $D_2$ is positive. Thus $v_1$ is trivial on $k \( t \)$ and $v_2$ is nontrivial there. ◻
]

=== 8.2 The scalar is global <the-scalar-is-global>

#thm([Proposition 8.3.])[
  #emph[Let $Psi : V_K arrow.r V_K$ be a compatible $Lambda$-linear automorphism. If $Psi \( V_E \) = V_E$ for every good rational subfield $E subset K$, then $Psi = a thin upright("id")$ for one $a in Lambda^times$.]
] <prop:global-scalar>

#proof[
  By Proposition 24, $Psi^(*)$ permutes the pairs $I_v subset D_v$ for true prime divisors. Since $Psi$ fixes each $V_E$, it preserves the rank of restriction of $D_v$ to $A_E$. Lemmas 34 and 35 therefore force this permutation of true divisors to be the identity.
  Fix a good rational subfield $E$. Every point line of $A_E$ is the nonzero restriction of some $I_v$. The induced dual automorphism $Psi_E^(*) = \( Psi \|_(V_E) \)^(*)$ of $A_E$ therefore fixes every point line. Write
  $ Psi_E^(*) \( "ord"_x \) = a_x "ord"_x \, #h(2em) a_x in Lambda^times \, quad x in C_E \( k \) \, $
  where $C_E$ denotes the smooth projective model of $E$. The sum of these order characters is zero, and its coefficient families have exactly the diagonal kernel by Lemma 14. Continuity permits applying $Psi_E^(*)$ to this sum, so all $a_x$ equal one scalar $a_E$. Since $E$ is rational, its point orders separate $V_E$, and hence $Psi \|_(V_E) = a_E thin upright("id")$.
  Let $E = k \( t \)$ and $F = k \( s \)$ be any two good rational subfields. On a common smooth model open, $t \, s$ are regular and both differentials are nonzero. Blow up a closed point of that open. Its exceptional divisor $v$ has
  $ "ord"_v \( t - t \( P \) \) = "ord"_v \( s - s \( P \) \) = 1 . $
  Thus the inertia line $I_v$ restricts nontrivially to a point line of both $A_E$ and $A_F$. The scalar by which $Psi^(*)$ acts on $I_v$ must be both $a_E$ and $a_F$. All these scalars agree. Good-function classes span $V_K$ by Lemma 27, proving the claim. ◻
]

Apply the proposition to $Psi = alpha_1^(- 1) Theta$, where $alpha : K^i arrow.r L^i$ is supplied by Theorem 33. The canonical identifications under perfection are compatible with Milnor multiplication. Also $alpha \( E^i \)$ is the perfection of the good field matched to $E$, so $Psi$ fixes $V_E$ for every such $E$. Consequently $Theta = a alpha_1$ for a single $a in Lambda^times$.

=== 8.3 Uniqueness up to Frobenius <uniqueness-up-to-frobenius>

#thm([Proposition 8.4.])[
  #emph[Suppose $beta : K^i arrow.r K^i$ is a field automorphism preserving $k$ whose action on $V_K$ is a scalar. Then $beta$ is the identity in characteristic zero and an integral power of Frobenius in positive characteristic.]
] <prop:uniqueness>

#proof[
  Let $E = k \( t \)$ be good. Its perfection is relatively algebraically closed in $K^i$: if an element is algebraic over $E^i$, clearing Frobenius powers puts an algebraic element over $E$ in $K$, and relative algebraic closedness then puts it in $E$. The same applies to $beta \( E^i \)$. Choose a nonconstant element of $beta \( E^i \) ∩ K$ by clearing powers, and let $P$ be the relative algebraic closure of the rational field it generates in $K$. Relative algebraic closedness of $beta \( E^i \)$ gives $P^i subset beta \( E^i \)$. Conversely, every element of $beta \( E^i \)$ is algebraic over this rational field; clearing powers puts it in $P$. Hence $beta \( E^i \) = P^i$. Since $beta_1$ is scalar, $V_P = V_E$ inside $V_K$. Lemma 21 forces $P = E$.
  It follows that $beta \( t \) = h \( t \)$ for a perfect rational function $h$ generating $k \( t \)^i$ over $k$ up to perfection. This implies that $h$ belongs to the group $cal(H)_k$ of projective transformations and Frobenius powers from Section 7. Indeed, after clearing powers, its separable degree must be one; a larger separable degree could not disappear on passing to perfections. In characteristic zero this says simply that $h$ is projective linear.
  Write $rho = beta \|_k$. For any two distinct points $a \, b in bb(P)^1 \( k \)$, choose a rational function $f_(a \, b) \( t \)$ with divisor $\[ a \] - \[ b \]$. The point-order vector of $beta_1 \( \[ f_(a \, b) \] \)$ is supported exactly at
  $ h^(- 1) \( rho \( a \) \) \, #h(2em) h^(- 1) \( rho \( b \) \) . $
  Here $rho$ fixes infinity. For negative Frobenius powers, the order vector is interpreted by clearing powers; multiplication by a power of $p$ is invertible in $Lambda$. Both displayed coordinates therefore have nonzero orders. Scalar action on $V_E$ implies that the permutation $h^(- 1) rho$ fixes every unordered pair of distinct points. On a set with at least three points this forces every point to be fixed: intersect the fixed pairs ${ a \, b }$ and ${ a \, c }$. Thus $h$ and $rho$ agree on all points.
  In particular $h$ fixes $0 \, 1 \, oo$. An element of $cal(H)_k$ with these three fixed points is a pure Frobenius power, or the identity in characteristic zero. In positive characteristic its exponent is determined by $rho$ and therefore is the same for every good $t$. Distinct Frobenius powers act differently on the infinite algebraically closed field $k$: equality of two powers would force every element to satisfy $X^(p^n) - X = 0$ for some $n > 0$. Good functions generate $K$, so $beta$ is this same Frobenius power on $K$ and then on its perfection. ◻
]

#proof[
  A compatible $Theta$ gives equal transcendence degrees by Proposition 7. Theorem 33 produces a field isomorphism $alpha : K^i arrow.r L^i$ respecting constants; in particular, the characteristics agree. Proposition 36 shows that $Theta$ and $alpha_1$ differ by a single scalar, proving surjectivity of the stated map. If two field isomorphisms have the same image modulo scalars, their quotient satisfies Proposition 37, proving injectivity modulo Frobenius. Conversely, every integral Frobenius power acts on $V_L$ by the corresponding nonzero scalar. The map is therefore well-defined and bijective with exactly the stated equivalence relations. ◻
]

#heading(level: 1)[References]
#bibitem([1])[F.~A.~Bogomolov, #emph[On two conjectures in birational algebraic geometry], in Algebraic Geometry and Analytic Geometry (Tokyo, 1990), ICM-90 Satellite Conference Proceedings, Springer, Tokyo, 1991, pp.~26--52. #link("https://doi.org/10.1007/978-4-431-68172-4_2")[doi:10.1007/978-4-431-68172-4\_2].]
#bibitem([2])[F.~Bogomolov and Y.~Tschinkel, #emph[Reconstruction of function fields], Geom. Funct. Anal. #strong[18] (2008), no.~2, 400--462. #link("https://arxiv.org/abs/math/0303075")[arXiv:math/0303075].]
#bibitem([3])[F.~Bogomolov and Y.~Tschinkel, #emph[Milnor $K_2$ and field homomorphisms], in Surveys in Differential Geometry, Vol.~XIII, International Press, Somerville, MA, 2009, pp.~223--244. #link("https://arxiv.org/abs/0902.4875")[arXiv:0902.4875].]
#bibitem([4])[F.~Bogomolov and Y.~Tschinkel, #emph[Reconstruction of higher-dimensional function fields], Mosc. Math. J. #strong[11] (2011), no.~2, 185--204. #link("https://doi.org/10.17323/1609-4514-2011-11-2-185-204")[doi:10.17323/1609-4514-2011-11-2-185-204].]
#bibitem([5])[A.~Cadoret and A.~Pirutka, #emph[Reconstructing function fields from Milnor $K$-theory], Algebra Number Theory #strong[15] (2021), no.~9, 2261--2288. #link("https://doi.org/10.2140/ant.2021.15.2261")[doi:10.2140/ant.2021.15.2261].]
#bibitem([6])[OpenAI, #emph[The Bogomolov--Pop reconstruction theorem], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Bogomolov-Pop-reconstruction-theorem-September-23-2026/paper.pdf")[OAI:The-Bogomolov-Pop-reconstruction-theorem-September-23-2026], 2026, Sections~4--6.]
#bibitem([7])[F.~Pop, #emph[On the birational anabelian program initiated by Bogomolov I], Invent. Math. #strong[187] (2012), no.~3, 511--533. #link("https://doi.org/10.1007/s00222-011-0331-x")[doi:10.1007/s00222-011-0331-x].]
#bibitem([8])[F.~Pop, #emph[On the minimized decomposition theory of valuations], Bull. Math. Soc. Sci. Math. Roumanie #strong[58(106)] (2015), no.~3, 331--357, with the appendix #emph[On the nature of base fields] by A.~Topaz. #link("https://ssmr.ro/bulletin/pdf/58-3/articol_10.pdf").]
#bibitem([9])[F.~Pop, #emph[Reconstruction of function fields from their pro-$ell$ abelian divisorial inertia], preprint, 2018. #link("https://arxiv.org/abs/1810.04768")[arXiv:1810.04768].]
#bibitem([10])[H.~Tanaka, #emph[Boundedness of regular del Pezzo surfaces over imperfect fields], Manuscripta Math. #strong[174] (2024), no.~1--2, 355--379. #link("https://doi.org/10.1007/s00229-023-01517-z")[doi:10.1007/s00229-023-01517-z].]
#bibitem([11])[The Stacks Project Authors, #emph[The Stacks Project], 2026. #link("https://stacks.math.columbia.edu"). Specific tags are cited in the text.]
#bibitem([12])[A.~Topaz, #emph[Reconstructing function fields from rational quotients of mod-$ell$ Galois groups], Math. Ann. #strong[366] (2016), no.~1--2, 337--385. #link("https://doi.org/10.1007/s00208-015-1327-4")[doi:10.1007/s00208-015-1327-4].]
#bibitem([13])[A.~Topaz, #emph[Recovering function fields from their integral $ell$-adic cohomology with the Galois action], preprint, 2019, version~1. #link("https://arxiv.org/abs/1910.03563v1")[arXiv:1910.03563v1].]
#bibitem([14])[A.~Topaz, #emph[A Torelli theorem for higher-dimensional function fields], preprint, 2021, version~3. #link("https://arxiv.org/abs/1705.01084v3")[arXiv:1705.01084v3].]
#bibitem([15])[A.~Topaz, #emph[Algebraic dependence and Milnor $K$-theory], preprint, 2022. #link("https://arxiv.org/abs/2211.14665")[arXiv:2211.14665].]


