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

#align(center)[#text(size: 16pt, weight: "bold")[A Conditional Reduction for Algebraic Kuga--Satake Correspondences]]
#align(center)[OpenAI]
#align(center)[September 10, 2026]

== 1 Introduction and statements <sec:introduction>

The Kuga–Satake construction associates an abelian variety to a polarized Hodge structure of K3 type. Its original purpose was to place the second cohomology of a K3 surface inside a tensor construction on the first cohomology of an abelian variety [12]. The resulting embedding is a Hodge morphism. Its realization by an algebraic correspondence is a further assertion, usually called the algebraicity of the Kuga–Satake correspondence; see [10] Chapter 4 and [6]. This assertion is a particular instance of the rational Hodge conjecture.

We prove two conditional reductions for this algebraicity problem. At a point where the primitive cohomology has full orthogonal Hodge group, an algebraic correspondence inducing any nonzero map from primitive cohomology to the second cohomology of an abelian variety suffices to recover the #emph[specified] map into the #emph[full] even-Clifford target. Very-general existence of such a map then implies algebraicity of the specified correspondence at every point of the same polarized component. These reductions do not establish the existence of the initial map and therefore do not resolve the unrestricted Kuga–Satake conjecture.

The proof uses three devices which may be useful in related algebraicity questions. Independent operations on the two weight-one factors recover every multiplicity, and rational descent handles nonsplit Clifford algebras. Proper Hilbert parameter spaces specialize the #emph[entire prescribed flat class], including its rational coefficients, over an analytic period chart. Finally, signed square roots compare quadratic polarizations through operations on the abelian factors. This last step does not require algebraicity of a Hodge endomorphism of the K3 surface.

=== 1.1 Conventions and the exact target <conventions-and-the-exact-target>

All varieties in the statements are over $bb(C)$, and cohomology is rational Betti cohomology unless a different field is displayed. We write $"CH"^r \( - \)_(bb(Q))$ for codimension-$r$ cycles modulo rational equivalence with rational coefficients. A subscript records dimension, so $"CH"_a$ denotes cycles of dimension $a$. We write $"NS" \( S \)$ for the Néron–Severi group, $"Hg"$ for the Hodge group, $"Hom"_(upright("HS"))$ for rational Hodge maps, and $F^bullet$ for the Hodge filtration. The Tate twist $\( 1 \)$ shifts Hodge bidegrees by $\( - 1 \, - 1 \)$. On a Hodge component of type $\( p \, q \)$ the Hodge circle acts as $e^(i \( p - q \) theta)$. The joint Hodge group of several structures is the smallest rational algebraic group containing their simultaneous Hodge circle. Equal-weight rational maps are Hodge maps exactly when they intertwine this circle.

Let $\( S \, h \)$ be a primitively amply polarized K3 surface, with $h^2 = 2 d$. Put

$ V = h^perp subset H^2 \( S \, bb(Q) \) \, #h(2em) T = T \( S \) = "NS" \( S \)_(bb(Q))^perp subset V . $

Orthogonality here is for the cup form $q$. The space $V$ has dimension $21$ and signature $\( 2 \, 19 \)$, with the positive two-plane determined by $H^(2 \, 0) \( S \)$. The space $T$ has the same period line and dimension at least two.

For the final target, fix a rational quadratic polarization $Q$ of $T$ and all standard Kuga–Satake data: the full even Clifford construction, its parity identification by right multiplication, a rational weight-one polarization, and any chosen isogenous realization. Denote this abelian variety by $A_S$, and set $W_S = H^1 \( A_S \, bb(Q) \)$. The standard map $T \( 1 \) arrow.r "End" \( W_S \)$ and the stipulated identification $W_S^or tilde.eq W_S \( 1 \)$ determine

#[#set math.equation(numbering: n => "(1.1)")
 $ kappa_S : T arrow.r W_S ⊗ W_S arrow.r.hook H^2 \( A_S times A_S \, bb(Q) \) . $ <eq:target>]

The last arrow is the ordered Künneth inclusion. To realize this map means to find

#[#set math.equation(numbering: n => "(1.2)")
 $ Gamma_S in "CH"^2 \( S times A_S times A_S \)_(bb(Q)) \, #h(2em) \( p_(A A) \)_(*) #scale(x: 120%, y: 120%)[\(] "cl" \( Gamma_S \) union p_S^(*) x #scale(x: 120%, y: 120%)[\)] = kappa_S \( x \) quad \( x in T \) . $ <eq:cycle-target>]

Here $"cl"$ is the rational Betti cycle class, and $p_S$ and $p_(A A)$ are the projections to $S$ and $A_S times A_S$. Every normalization in (1.1) is retained. The target is never replaced by a simple spin factor.

=== 1.2 The conditional theorems <the-conditional-theorems>

#thm([Theorem 1.1.])[
  (Recovery at a point with full Hodge group).  #emph[Suppose $"Hg" \( V \) = "SO" \( V \, q \)$. The following conditions are equivalent.]
  + #emph[There are an abelian variety $B$ and a cycle $alpha in "CH"^2 \( S times B \)_(bb(Q))$ such that 
$ alpha_(*) : V arrow.r H^2 \( B \, bb(Q) \) $

 is nonzero.]
  + #emph[There are a smooth connected projective surface $Y$ and a dominant generically finite morphism $f : Y arrow.r S$ such that 
#[#set math.equation(numbering: n => "(1.3)")
 $ f_(*) #h(-0.16667em) ("im" #h(-0.16667em) [and.big^2 H^0 \( Y \, Omega_Y^1 \) arrow.r H^0 \( Y \, Omega_Y^2 \)]) eq.not 0 . $ <eq:wedge-condition>]

]
  + #emph[The prescribed full Kuga–Satake map is realized as in (1.2), for any stipulated standard data on $T$.]
  #emph[In this situation $T = V$. The same input realizes the standard map for the full primitive Clifford construction with the cup form.]
] <main:generic>

In (1.3), $f_(*)$ is the trace on holomorphic two-forms, equivalently the restriction of cohomological pushforward to $H^(2 \, 0)$. There is no genericity condition on $B$. The hypothesis on $V$ holds outside a countable union of proper closed analytic subsets in every full polarized period chart; see Proposition 11.

#thm([Theorem 1.2.])[
  (Specialization in a polarized component).  #emph[Fix a component of the moduli space of primitively amply polarized K3 surfaces of degree $2 d$. Assume that condition (i) or condition (ii) of Theorem 1 holds very generally in that component. Then every $\( S \, h \)$ in the component satisfies (1.2), with all the stipulated standard data on $T \( S \)$.]
  #emph[Here it suffices that, about each desired point, the input holds outside a countable union of proper closed analytic subsets of a full polarized period chart. In particular an input outside countably many proper algebraic subsets of the moduli component suffices. The witness cycles, abelian varieties, or surface covers need not vary in a family.]
] <main:specialization>

#thm([Corollary 1.3.])[
  #emph[If the hypothesis of Theorem 2 holds in the required polarized components in every degree, then (1.2) holds for every projective K3 surface.]
] <main:all-degrees>

#proof[
  Every projective K3 surface has an ample integral class. Divide it to primitivity in $H^2 \( S \, bb(Z) \)$; the resulting integral $\( 1 \, 1 \)$ class is the first Chern class of a line bundle, a positive power of which is ample. Hence it is itself ample, and its square is a positive even integer. Apply Theorem 2 in its component. ◻
]

An input in one polarized component yields the conclusion in that component. Constructing a very-general correspondence or surface cover with the stated property remains the external existence problem. The hypotheses concern actual algebraic cycles; absolute Hodge or motivated classes do not supply this input.

=== 1.3 Proof outline <proof-outline>

Section 2 proves the equivalence of the two inputs and records the available cycle operations. Section 3 fixes the full Clifford target and tensor conventions. Section 4 recovers that target from one nonzero input by identifying the spin constituents and applying independent multiplicity operations. Section 5 specializes the entire prescribed class in a local projective family. Section 6 restricts to $T$ and compares quadratic polarizations; Section 7 assembles the two theorems. Appendix 8 records the established inputs and their roles.

== 2 Cycle operations and the two inputs <sec:cycles>

A correspondence $Z in "CH"^a \( P times Q \)_(bb(Q))$ between smooth projective varieties acts by

#[#set math.equation(numbering: n => "(2.1)")
 $ Z_(*) x = \( p_Q \)_(*) #scale(x: 120%, y: 120%)[\(] "cl" \( Z \) union p_P^(*) x #scale(x: 120%, y: 120%)[\)] : H^j \( P \) arrow.r H^(j + 2 e) \( Q \) \( e \) \, #h(2em) e = a - dim P . $ <eq:degree-convention>]

The twist makes this a map of Hodge structures of weight $j$. Composition through a variety of dimension $r$ adds codimensions and subtracts $r$; the cycle class of the composition acts as the composite [4]. In particular a degree-preserving correspondence from a surface to degree two has codimension two.

#thm([Lemma 2.1.])[
  (Weight-one operations).  #emph[For complex abelian varieties $P \, Q$, pullback identifies 
$ "Hom" \( Q \, P \) ⊗ bb(Q) tilde.eq "Hom"_(upright("HS")) #scale(x: 120%, y: 120%)[\(] H^1 \( P \, bb(Q) \) \, H^1 \( Q \, bb(Q) \) #scale(x: 120%, y: 120%)[\)] . $

 Thus arbitrary rational weight-one Hodge maps can act algebraically and independently on the two factors of an ordered tensor product of first cohomology groups.]
] <cyc:h1>

#proof[
  Dualize a rational Hodge map to a map on first homology. After multiplication by a positive integer it preserves the integral lattices. The Hodge condition says that its real extension commutes with the complex structures on the universal covers. It therefore induces a holomorphic group homomorphism $Q arrow.r P$, which is algebraic by projectivity. Conversely pullback by every such homomorphism is a Hodge map. This is the usual equivalence between abelian varieties up to isogeny and polarizable rational Hodge structures of weight one, written contravariantly [13] Theorem 6.8 and Corollary 6.9. Transpose graphs realize the pullbacks. Products of two such correspondences, and their rational linear combinations, act independently on the two tensor factors. Preservation of the chosen polarizations is not required. ◻
]

#thm([Lemma 2.2.])[
  (Degree projectors).  #emph[Every cohomological Künneth projector on a product of abelian varieties is induced by a rational algebraic correspondence. If $U = H^1 \( B \, bb(Q) \)$ and $m : B times B arrow.r B$ is addition, then the mixed part of $m^(*)$ gives an injection 
$ H^2 \( B \, bb(Q) \) = and.big^2 U arrow.r U ⊗ U \, #h(2em) u and v mapsto u ⊗ v - v ⊗ u . $

]
] <cyc:projectors>

#proof[
  For an abelian variety $B$ of dimension $b$, multiplication by $2$ acts on $H^j \( B \)$ by $2^j$. Thus the rational polynomial
  $ e_j \( T \) = product_(0 lt.eq k lt.eq 2 b\
k eq.not j) frac(T - 2^k, 2^j - 2^k) $
  applied to the correspondence $\[ 2 \]^(*)$ is the projector onto $H^j \( B \)$. Apply these polynomials separately to each factor of a product. Finally $m^(*) u = p_1^(*) u + p_2^(*) u$ on $H^1$; multiplication in the exterior algebra, with its usual signs, gives the displayed formula. ◻
]

#thm([Lemma 2.3.])[
  (Rational descent of a cycle span).  #emph[Let $E$ be a finite-dimensional rational vector space of cohomological maps, and let $E_(upright("alg")) subset E$ be the image of rational algebraic correspondences of a fixed degree. For every field extension $K \/ bb(Q)$, 
$ E ∩ \( E_(upright("alg")) ⊗_(bb(Q)) K \) = E_(upright("alg")) quad upright("inside ") E ⊗_(bb(Q)) K . $

 The same assertion holds if only a specified rational subspace of the source is considered.]
] <cyc:descent>

#proof[
  The cycle class map and restriction of its action are rational linear maps, so $E_(upright("alg"))$ is a rational subspace. If a rational target lies in the scalar-extended span of finitely many rational cycle actions, write these actions as columns in a rational basis of $E$. The linear system with that target as right-hand side is consistent over $K$, and row reduction over $bb(Q)$ gives a rational solution. Only finitely many cycles are used. ◻
]

#thm([Proposition 2.4.])[
  (Correspondences and surface covers).  #emph[Conditions (i) and (ii) of Theorem 1 are equivalent. The implication from the surface condition to a nonzero correspondence on $V$ does not require the full Hodge-group hypothesis.]
] <cyc:equivalence>

#proof[
  Suppose first that $f : Y arrow.r S$ satisfies (1.3). Let $D = "Alb" \( Y \)$, let $a : Y arrow.r D$ be an Albanese map, and put $b = dim D$. Albanese pullback identifies holomorphic one-forms [3] Chapter VI, §9.2, pp. 315–316. Hence there is
  $ beta in H^(2 \, 0) \( D \) = and.big^2 H^(1 \, 0) \( D \) \, #h(2em) y = f_(*) a^(*) beta eq.not 0 . $
  In particular $b gt.eq 2$ and $y in H^(2 \, 0) \( S \) subset V_(bb(C))$. The surface correspondence $\( a \, f \)_(*) \[ Y \]$ has codimension $b$ on $D times S$. Its transpose acts by
  $ a_(*) f^(*) : H^2 \( S \) arrow.r H^(2 b - 2) \( D \) \( b - 2 \) . $
  This action is nonzero on $V$: the projection formula gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ integral_D beta union a_(*) f^(*) overline(y) = integral_Y a^(*) beta union f^(*) overline(y) = integral_S y union overline(y) eq.not 0 . $ <eq:albanese-nonzero>]
  We give an algebraic degree adjustment. For an ample line bundle $L$ on $D$, written additively, set
  $ E = m^(*) L - p_1^(*) L - p_2^(*) L in "CH"^1 \( D times D \) \, $
  where $m$ is addition. The class of $E$ is purely mixed. Put $U = H^1 \( D \, bb(Q) \)$ and write this class as $sum_i u_i ⊗ v_i$, choosing a basis $\( u_i \)$ of $U$. Its matrix
  $ M : U^or arrow.r U \, #h(2em) M \( phi \) = sum_i phi \( u_i \) v_i $
  is invertible: it is the alternating tensor associated with $c_1 \( L \)$, whose top exterior power is nonzero since $L$ is ample. Intrinsically it is a Hodge map $M : U^or arrow.r U \( 1 \)$; in the matrix calculation we use the underlying rational spaces. With the Koszul convention for Künneth products,
  $ "cl" \( E \)^2 = - 2 sum_(i < j) \( u_i and u_j \) ⊗ \( v_i and v_j \) . $
  Poincaré duality identifies $H^(2 b - 2) \( D \)$ with $\( and.big^2 U \)^or$ on underlying rational spaces, by integration against degree-two classes. Consequently $\( E^2 \)_(*)$ is $- 2 and.big^2 M$ after this identification, and is an isomorphism
  #[#set math.equation(numbering: n => "(2.3)")
   $ \( E^2 \)_(*) : H^(2 b - 2) \( D \) \( b - 2 \) arrow.r^(med tilde.op med) H^2 \( D \) . $ <eq:degree-adjustment>]
  The twists can also be checked from $H^(2 b - 2) \( D \) \( b - 2 \) tilde.eq H^2 \( D \)^or \( - 2 \)$ and $and.big^2 M : H^2 \( D \)^or arrow.r H^2 \( D \) \( 2 \)$. Composing with $\( f \, a \)_(*) \[ Y \]$ yields a cycle of codimension $b + 2 - b = 2$ on $S times D$, nonzero on $V$ by (2.2). This uses a square of an explicit divisor; it assumes no algebraic inverse Lefschetz operator for a general variety.
  Conversely suppose that $alpha_(*) : V arrow.r H^2 \( B \)$ is nonzero and $"Hg" \( V \) = "SO" \( V \, q \)$. The standard representation is irreducible, so $alpha_(*) \|_V$ is injective. For $0 eq.not sigma in H^(2 \, 0) \( S \)$, put $eta = alpha_(*) sigma eq.not 0$ in $H^(2 \, 0) \( B \)$. Write $c = dim B gt.eq 2$ and let $ell$ be an ample divisor class on $B$, replaced by a very ample multiple if necessary. The rational surface cycle
  $ C = alpha dot.op p_B^(*) ell^(c - 2) in "CH"_2 \( S times B \)_(bb(Q)) $
  satisfies
  #[#set math.equation(numbering: n => "(2.4)")
   $ integral_(S times B) "cl" \( C \) union p_S^(*) overline(sigma) union p_B^(*) eta = integral_B overline(eta) union eta union ell^(c - 2) eq.not 0 . $ <eq:surface-nonzero>]
  Here rationality gives $alpha_(*) overline(sigma) = overline(eta)$, and the last pairing is definite up to a fixed nonzero sign on $H^(2 \, 0) \( B \)$ by the Hodge–Riemann bilinear relations. An actual representative of $C$ is a finite rational combination of integral surfaces; for example use general hyperplanes to represent the indicated intersections. At least one component has nonzero pairing in (2.4). Resolve that component projectively and call the resulting smooth connected surface $Y$. Its projections give morphisms $f : Y arrow.r S$ and $a' : Y arrow.r B$ with
  $ integral_Y f^(*) overline(sigma) union a' ""^(*) eta eq.not 0 . $
  Thus $f^(*) sigma eq.not 0$, which forces $f$ to have two-dimensional image. It is therefore dominant and generically finite. The projection formula also gives $f_(*) a' ""^(*) eta eq.not 0$. Since $eta$ is a sum of wedges of holomorphic one-forms on $B$, its pullback lies in the wedge image in (1.3). This proves the converse. ◻
]

#prodef([Remark 2.5.])[
  The reverse implication uses injectivity on $V$, not merely nonvanishing on some divisor class. At a Picard jump a correspondence nonzero only on new algebraic classes need not satisfy the surface condition. No such assertion is used below.
]

== 3 Full Clifford structures and their tensor maps <cliff:section>

We fix the conventions needed to identify the final correspondence exactly. The classical construction is reviewed in [10] Chapter 4, §2 and [6] §§5–6; we include the details concerning signs, polarizations, and the two tensor slots. Our Hodge circle acts on a vector of type $\( p \, q \)$ by $e^(i \( p - q \) theta)$. Tate twists leave this circle unchanged.

Let $H$ be a rational Hodge structure of K3 type: it has weight two, $h^(2 \, 0) = h^(0 \, 2) = 1$, and no Hodge types other than $\( 2 \, 0 \)$, $\( 1 \, 1 \)$, and $\( 0 \, 2 \)$. Let $Q$ be a nondegenerate rational quadratic Hodge form. We allow either overall sign: $Q$ has sign $epsilon.alt in { 1 \, - 1 }$ on the real period plane and the opposite sign on its orthogonal. Write

$ C \( H \, Q \) = C^(+) \( H \, Q \) xor C^(-) \( H \, Q \) \, #h(2em) v^2 = Q \( v \, v \) . $

If $H^(2 \, 0) = bb(C) \( e_1 + i e_2 \)$, where $e_1 \, e_2$ are real orthogonal vectors with $Q \( e_j \, e_j \) = epsilon.alt$, set

#[#set math.equation(numbering: n => "(3.1)")
 $ J = epsilon.alt e_1 e_2 \, #h(2em) g_theta = cos theta + J sin theta . $ <cliff:circle>]

The element $J$ depends only on the oriented period plane. Left multiplication by $g_theta$ gives both parity spaces weight-one Hodge structures, denoted $P_H^(+)$ and $P_H^(-)$, with the $i$-eigenspace of $L_J$ as their $\( 1 \, 0 \)$-part. We retain these #emph[full] spaces throughout.

#thm([Proposition 3.1.])[
  #emph[The Hodge structures $P_H^plus.minus$ are polarizable, and 
#[#set math.equation(numbering: n => "(3.2)")
 $ m^Q : H \( 1 \) arrow.r "Hom" \( P_H^(+) \, P_H^(-) \) \, #h(2em) x mapsto L_x $ <cliff:multiplication>]

 is a rational Hodge embedding. The parity spaces are rationally Hodge-isomorphic by right multiplication by any fixed invertible odd Clifford element. On a sufficiently small period chart, their Hodge filtrations vary holomorphically and admit fixed rational polarizations.]
] <cliff:construction>

#proof[
  The Clifford relations give
  $ J^2 = - 1 \, quad \[ J \, e_1 \] = - 2 e_2 \, quad \[ J \, e_2 \] = 2 e_1 \, quad \[ J \, e_1 + i e_2 \] = 2 i \( e_1 + i e_2 \) . $
  Moreover, $J$ commutes with the orthogonal complement of the period plane. Thus $g_theta in "Spin" \( H \, Q \) \( bb(R) \)$, and its conjugation action on $H$ is the prescribed weight-two Hodge circle. Since
  $ L_(g_theta) L_x L_(g_theta)^(- 1) = L_(g_theta x g_theta^(- 1)) \, $
  the map in (3.2) is a Hodge map. It is injective because $L_x \( 1 \) = x$. Choose a rational nonisotropic vector $z in H$. Right multiplication $R_z$ exchanges the parities, has inverse $R_(z \/ Q \( z \, z \))$, and commutes with the left circle. The same observation applies to any invertible odd right multiplier.
  For holomorphic variation, put $omega = e_1 + i e_2$. The relation $J omega = i omega$ shows that the image of $L_omega$ from the opposite parity is contained in the $i$-eigenspace of $L_J$. Conversely $omega J = - i omega$, so this eigenspace is contained in $ker L_omega$. Finally
  $ L_omega L_(macron(omega)) + L_(macron(omega)) L_omega = 4 epsilon.alt "id" $
  shows that $ker L_omega = "im" L_omega$, with the appropriate parities understood. Hence $F^1 P_(H \, bb(C))^plus.minus = "im" L_omega$; this is a holomorphic subbundle as the isotropic line varies.
  Here is a fixed rational polarization. Write $u mapsto u^(*)$ for reversal in the Clifford algebra and $"scal"$ for its scalar part. Choose rational orthogonal vectors $f_1 \, f_2$ of sign $epsilon.alt$ whose oriented plane is sufficiently close to the given period plane. Rational approximation followed by rational orthogonalization supplies them. Put $a = f_1 f_2$ and, on $C^(+) \( H \, Q \)$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ s \( u \, v \) = "scal" \( u a v^(*) \) . $ <cliff:polarizing-form>]
  The scalar part is cyclic and invariant under reversal, as is checked on an orthogonal monomial basis. Since $a^(*) = - a$, the form $s$ is alternating. It is nondegenerate because $a$ is invertible and $\( u \, v \) mapsto "scal" \( u v^(*) \)$ is nondegenerate. Reversal gives $g_theta^(*) g_theta = 1$, so $s$ is invariant under the left circle at every period.
  At the reference plane spanned by $f_1 \, f_2$, write $a = c J$ with $c in bb(R)^times$. Then
  $ s \( u \, J v \) = c "scal" #scale(x: 120%, y: 120%)[\(] "Ad" \( J \) u thin v^(*) #scale(x: 120%, y: 120%)[\)] . $
  To see definiteness, extend a normalized basis of this plane to an orthogonal basis with squared lengths $epsilon.alt \, epsilon.alt \, - epsilon.alt \, dots.h \, - epsilon.alt$. The last pairing is diagonal on even monomials $e_I$. If $r = \| I \|$ and $k$ entries of $I$ belong to the period plane, its diagonal sign is
  $ \( - 1 \)^k epsilon.alt^r \( - 1 \)^(r - k) = 1 \, $
  because $r$ is even. Up to the overall sign required by the weight-one polarization convention, $s$ is therefore a polarization. Circle invariance makes $s \( u \, J v \)$ symmetric and nondegenerate at every period. Its signature is constant on a connected period chart containing both the reference plane and the original period, so the chosen sign of $s$ polarizes throughout that chart. Transport by $R_z$ supplies a fixed polarization on $C^(-) \( H \, Q \)$ as well. ◻
]

Choose abelian varieties realizing the polarizable weight-one spaces in Proposition 9; rational realizations suffice. For a weight-one Hodge structure $P$, fix the rational Hodge isomorphism

$ j_P : P^or \( - 1 \) arrow.r^tilde.op P $

induced by its chosen polarization. A map $f : H \( 1 \) arrow.r "Hom" \( P \, M \)$ then determines the weight-two tensor map

#[#set math.equation(numbering: n => "(3.4)")
 $ H arrow.r "Hom" \( P \, M \) \( - 1 \) = M ⊗ P^or \( - 1 \) arrow.r^(1 ⊗ j_P) M ⊗ P . $ <cliff:tensor>]

When $H subset H^2 \( S \, bb(Q) \)$ for a surface $S$, choose abelian realizations $M = H^1 \( A_M \, bb(Q) \)$ and $P = H^1 \( A_P \, bb(Q) \)$. We call $f$ #emph[algebraically realized] if some cycle in $"CH"^2 \( S times A_M times A_P \)_(bb(Q))$ has, on $H$, exactly the action (3.4) included in the $H^1 ⊗ H^1$ Künneth component. This specifies the restricted action on $H$; the algebraic target projectors may be applied to remove other target components. The terminology always refers to actual algebraic cycles.

#thm([Lemma 3.2.])[
  (Operations on the two slots).  #emph[Suppose $f : H \( 1 \) arrow.r "Hom" \( P \, M \)$ is algebraically realized. For rational weight-one Hodge maps $a : M arrow.r M'$ and $b : P' arrow.r P$, the map $x mapsto a f \( x \) b$ is algebraically realized. The same holds after changing the chosen duality isomorphisms, interchanging the tensor factors, or making rational weight-one Hodge identifications with isogenous abelian models.]
] <cliff:slots>

#proof[
  Under (3.4), the two operations are precisely
  #[#set math.equation(numbering: n => "(3.5)")
   $ a ⊗ #scale(x: 120%, y: 120%)[\(] j_(P') b^or \( - 1 \) j_P^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <cliff:slot-formula>]
  Both factors are rational weight-one Hodge maps, so Lemma 4 realizes them by abelian correspondences. Their product acts independently on the two factors and preserves the codimension of the correspondence from the surface. Changing $j_P$ likewise composes with a weight-one Hodge isomorphism. The factor-switching isomorphism is algebraic; its Künneth sign can be included in the rational coefficient. The projectors of Lemma 5 remove all other Künneth components when necessary. ◻
]

In particular, the standard full even-Clifford model is $W = P_H^(+)$. For a stipulated invertible odd right multiplier $z$, its endomorphism-valued embedding is exactly

#[#set math.equation(numbering: n => "(3.6)")
 $ H \( 1 \) arrow.r "End" \( W \) \, #h(2em) x mapsto #scale(x: 120%, y: 120%)[\[] w mapsto x w z #scale(x: 120%, y: 120%)[\]] = R_z L_x . $ <cliff:standard>]

Applying the stipulated duality $W^or tilde.eq W \( 1 \)$ gives its specified map to $W ⊗ W$. Thus algebraicity of $m^Q$ gives algebraicity of this precise map, with the fixed multiplier, polarization, rational normalization, and identification with $H^1$ of the chosen Kuga–Satake abelian variety. No simple factor replaces the full even-Clifford space.

These conclusions are also independent of the usual equivalent Clifford conventions. Reversal takes left multiplication by a spin element to right multiplication by its inverse, since $\( g u \)^(*) = u^(*) g^(- 1)$. Passing between homology and cohomology uses duality, transpose, and a weight-one polarization. These are exactly the operations in Lemma 10; the source Hodge circle is always the one fixed above. Reversing the period Hodge action independently would be a different construction.

== 4 Recovering the full Clifford correspondence at a general point <gen:section>

The argument in this section uses the equality

#[#set math.equation(numbering: n => "(4.1)")
 $ "Hg" \( V \) = "SO" \( V \, q \) \, #h(2em) V = h^perp subset H^2 \( S \, bb(Q) \) \, #h(2em) dim V = 21 . $ <gen:full-group>]

There is no genericity assumption on the abelian variety that supplies the initial algebraic correspondence. The principal point is to recover every multiplicity in the full Clifford construction from one nonzero map.

=== 4.1 The generic Hodge group <the-generic-hodge-group>

#thm([Proposition 4.1.])[
  #emph[In any sufficiently small, full-dimensional marked polarized period chart, Equation (4.1) holds outside a countable union of proper closed analytic subsets. At every point satisfying Equation (4.1), the Hodge structure $V$ is irreducible and $T \( S \) = V$.]
] <gen:genericity>

#proof[
  Polarized local Torelli identifies such a chart with an open subset of the domain of oriented positive two-planes in the fixed real quadratic space $V_(bb(R))$; see [10] Chapter 6. The infinitesimal generators of the Hodge circles over any such open subset span $frak(s o) \( V_(bb(R)) \, q \)$. Indeed, under the natural identification $frak(s o) \( V_(bb(R)) \, q \) tilde.eq Lambda^2 V_(bb(R))$, each generator is a nonzero multiple of the bivector of its positive plane. A linear functional vanishing on all these bivectors is an alternating bilinear form vanishing on an open set of ordered pairs of vectors. It therefore vanishes identically.
  The Hodge group is a connected rational algebraic subgroup of $"SO" \( V \, q \)$. Connectedness follows because its rational identity component contains the connected Hodge circle and hence, by minimality, is the whole group. If this subgroup is proper, its Lie algebra is a nonzero proper rational subspace $L subset frak(s o) \( V \, q \)$. Set $r = dim L$, and choose a rational generator $tau_L$ of $Lambda^r L$. Conjugation by the circle preserves $L$ and acts trivially on its real determinant line: a continuous character from a compact connected circle to $bb(R)^times$ is trivial. Thus $tau_L$, viewed in $Lambda^r "End" \( V \)$, has Hodge type $\( 0 \, 0 \)$.
  There are only countably many possible rational subspaces $L$. For each one, the condition that $tau_L$ have type $\( 0 \, 0 \)$ is closed analytic in the period chart. In fact the tensor has weight zero and is real, so this condition is equivalent to $tau_L in F^0$, a holomorphic condition. The locus is proper. Otherwise $L_(bb(R))$ would be preserved by every circle in the chart, hence by the adjoint actions of their infinitesimal generators. The spanning assertion above would make $L_(bb(C))$ an ideal of the simple Lie algebra $frak(s o)_21 \( bb(C) \)$, a contradiction.
  Finally, the standard representation of $"SO" \( V \, q \)$ is absolutely irreducible and has no nonzero invariants. Consequently $V$ has no proper nonzero rational Hodge substructure and no nonzero rational vector of type $\( 1 \, 1 \)$. Since the primitive part of $"NS" \( S \)_(bb(Q))$ consists of such vectors, $"NS" \( S \)_(bb(Q)) = bb(Q) h$ and $T \( S \) = V$. ◻
]

=== 4.2 The spin representation forced by weight one <the-spin-representation-forced-by-weight-one>

Assume Equation (4.1). Let $B$ be a complex abelian variety, put $U = H^1 \( B \, bb(Q) \)$, and write

$ W^(+) = C^(+) \( V \, q \) \, #h(2em) W^(-) = C^(-) \( V \, q \) $

for the full Clifford parity spaces with their weight-one Hodge structures. The Hodge circle on these spaces acts by left multiplication by its lift to $"Spin" \( V \, q \)$. Let $cal(H)$ be the joint Hodge group of $V \, U \, W^(+) \, W^(-)$, and let $frak(h)$ be its rational Lie algebra.

#thm([Lemma 4.2.])[
  #emph[There is a decomposition into commuting rational ideals 
$ frak(h) = frak(g) xor frak(k) \, #h(2em) frak(g) tilde.eq frak(s o) \( V \, q \) \, $

 where $frak(k)$ is the kernel of the action on $V$. The ideal $frak(k)$ acts trivially on $W^(+)$ and $W^(-)$, and $frak(g)$ acts on them by the usual left spin action.]
] <gen:joint-group>

#proof[
  The group $cal(H)$ is connected by the same circle argument as in Proposition 11. It is reductive. To see this directly, each of the four pure summands is semisimple as a rational $cal(H)$-module: an invariant rational subspace is a Hodge substructure, and a polarization provides a rational Hodge complement. This is the usual semisimplicity argument for polarizable Hodge structures; compare [2] Proposition 3.6. Their direct sum is a faithful semisimple module. The unipotent radical has nonzero invariants in each irreducible constituent; normality makes those invariants $cal(H)$-stable, so it acts trivially on every constituent. Faithfulness forces the radical to be trivial.
  Projection to $V$ maps $cal(H)$ onto $"Hg" \( V \) = "SO" \( V \, q \)$. Indeed, its closed rational image contains the projected circle and hence contains $"Hg" \( V \)$. Conversely, the preimage of $"Hg" \( V \)$ contains the joint circle, so minimality places $cal(H)$ inside that preimage. The reductive rational Lie algebra $frak(h)$ is the direct sum of its center and its rational simple ideals. Exactly one simple ideal maps nontrivially to the absolutely simple quotient $frak(s o) \( V \, q \)$: its image is the whole quotient, and the commuting images of all other ideals must vanish. The nonzero map from that simple ideal is an isomorphism. This gives the asserted rational decomposition.
  On $V xor W^(+) xor W^(-)$, the image of $cal(H)$ is contained in the rational algebraic image of $"Spin" \( V \, q \)$ acting on $V$ through its orthogonal quotient and on $W^plus.minus$ by left multiplication. That image contains the projected Hodge circle, so the containment again follows by minimality. The differential of $"Spin" \( V \, q \) arrow.r "SO" \( V \, q \)$ is an isomorphism. Its kernel on Lie algebras is therefore zero, proving both remaining assertions. ◻
]

Let $Delta$ denote the complex spin representation of $frak(s o)_21 \( bb(C) \)$, of dimension $2^10$.

#thm([Lemma 4.3.])[
  #emph[There are complex multiplicity spaces $M \, N_(+) \, N_(-)$ and a trivial $frak(g)_(bb(C))$-module $M_0$ such that 
#[#set math.equation(numbering: n => "(4.2)")
 $ U_(bb(C)) = \( Delta ⊗ M \) xor M_0 \, #h(2em) W_(bb(C))^plus.minus = Delta ⊗ N_plus.minus \, #h(2em) dim N_plus.minus = 2^10 . $ <gen:spin-decompositions>]

 Every rational $frak(g)$-equivariant map $U arrow.r W^plus.minus$ is a weight-one Hodge map. Consequently 
#[#set math.equation(numbering: n => "(4.3)")
 $ "Hom"_(upright("HS")) \( U \, W^plus.minus \) ⊗_(bb(Q)) bb(C) = "Hom"_(frak(g)_(bb(C))) \( U_(bb(C)) \, W_(bb(C))^plus.minus \) tilde.eq "Hom"_(bb(C)) \( M \, N_plus.minus \) . $ <gen:hom-base-change>]

]
] <gen:width>

#proof[
  Let $D$ be the infinitesimal Hodge-circle generator divided by $i$; its eigenvalue on type $\( p \, r \)$ is $p - r$. In the decomposition of Lemma 12, write $D = D_(frak(g)) + D'$. On $V_(bb(C))$ the eigenvalues are $2 \, - 2 \, 0 \, dots.h \, 0$. In the standard Cartan coordinates for type $B_10$, in which the vector weights are $plus.minus e_1 \, dots.h \, plus.minus e_10 \, 0$, we may therefore take $D_(frak(g)) = 2 e_1^or$.
  The element $D_(frak(g))$ is semisimple on every finite-dimensional $frak(g)_(bb(C))$-module. It commutes with $D$, so $D' = D - D_(frak(g))$ is also semisimple on $U_(bb(C))$. Each $D'$-eigenspace is $frak(g)_(bb(C))$-stable. Consider an irreducible constituent in such an eigenspace, with highest weight $lambda = \( lambda_1 \, dots.h \, lambda_10 \)$. The highest-weight description for $B_10$ gives
  $ lambda_1 gt.eq dots.h.c gt.eq lambda_10 gt.eq 0 \, #h(2em) lambda_i in bb(Z) med upright("for every ") i \, quad upright("or") quad lambda_i in 1 / 2 + bb(Z) med upright("for every ") i . $
  The largest and smallest eigenvalues of $2 e_1^or$ are respectively $2 lambda_1$ and $- 2 lambda_1$. Indeed $e_1^or$ is dominant, and the Weyl group permits every coordinate sign change. These elementary highest-weight and spin facts may be found in the orthogonal-group chapters of [5].
  Adding the scalar by which $D'$ acts does not change the difference $4 lambda_1$ between the extreme eigenvalues. Since $U$ has Hodge types $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$, the eigenvalues of $D$ on $U_(bb(C))$ belong to ${ 1 \, - 1 }$. Hence $4 lambda_1 lt.eq 2$. The only possibilities are the trivial representation and $lambda = \( 1 / 2 \, dots.h \, 1 / 2 \)$, which is $Delta$. On a spin constituent the extreme eigenvalues already are $1 \, - 1$; the only scalar shift preserving this pair is zero. Thus
  #[#set math.equation(numbering: n => "(4.4)")
   $ D' = 0 quad upright("on ") Delta ⊗ M . $ <gen:kernel-circle-zero>]
  This proves the assertion about $U$. The complex Clifford identity $C^(+) \( V_(bb(C)) \, q \) tilde.eq "End"_(bb(C)) \( Delta \)$, with left multiplication, gives the assertion about $W^(+)$. An invertible odd right multiplier identifies the two parity spaces for the left spin action and gives the assertion about $W^(-)$. Lemma 12 shows that $D' = 0$ on both of them.
  Now a rational $frak(g)$-map $f : U arrow.r W^plus.minus$ vanishes on $M_0$ after complexification. The summand $M_0$ is $D$-stable. On the spin summand, Equation (4.4) shows that $f$ intertwines $D$. It therefore intertwines $D$ on all of $U$, hence the Hodge circle, and is a Hodge map. Conversely, every rational Hodge map intertwines $cal(H)$ and therefore $frak(g)$.
  Finally, rational $frak(g)$-intertwiners are the kernel of the finite system of rational linear equations
  $ f rho_U \( X_a \) = rho_(W^plus.minus) \( X_a \) f \, $
  where ${ X_a }$ is a rational basis of $frak(g)$. Taking that kernel commutes with extension of scalars. Schur’s Lemma over $bb(C)$ and Equation (4.2) now give Equation (4.3). ◻
]

#thm([Lemma 4.4.])[
  #emph[The space $"Hom"_(frak(g)_(bb(C))) \( V_(bb(C)) \, Delta ⊗ Delta \)$ has dimension one. Neither $Delta$ nor the trivial representation contains a vector copy $V_(bb(C))$.]
] <gen:vector-multiplicity>

#proof[
  The spin representation in type $B_10$ is self-dual, since the longest Weyl element is $- 1$. Under the conjugation action, the Clifford antisymmetrization map gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ Delta ⊗ Delta tilde.eq "End" \( Delta \) tilde.eq C^(+) \( V_(bb(C)) \, q \) tilde.eq xor.big_(k med upright("even")) Lambda^k V_(bb(C)) . $ <gen:clifford-exterior>]
  Here the action is conjugation, in contrast to the left action used in Equation (4.2).
  For completeness, the vector multiplicity in Equation (4.5) can be read off without decomposing every exterior power. Choose an orthonormal basis $v_1 \, dots.h \, v_21$. An equivariant map $F : V_(bb(C)) arrow.r Lambda^k V_(bb(C))$ is determined by $F \( v_1 \)$, because the orthogonal orbit of $v_1$ spans $V_(bb(C))$. Its value is fixed by all determinant-one diagonal sign changes on $v_2 \, dots.h \, v_21$. A basis exterior monomial fixed by all these sign changes contains either none or all of these twenty vectors. For even $k$, only $k = 0$ and $k = 20$ can therefore occur. The degree-zero map vanishes, since a determinant-one orthogonal transformation sending $v_1$ to $- v_1$ forces $F \( v_1 \) = F \( - v_1 \) = - F \( v_1 \)$. For $k = 20$ the possible value is a multiple of $v_2 and dots.h.c and v_21$, and volume duality $Lambda^20 V_(bb(C)) tilde.eq V_(bb(C))$ supplies a nonzero equivariant map. The multiplicity is exactly one. The last assertion follows from irreducibility and the distinct dimensions $21$, $2^10$, and $1$. ◻
]

=== 4.3 Independent target operations and rational descent <independent-target-operations-and-rational-descent>

#thm([Theorem 4.5.])[
  #emph[Assume Equation (4.1). Suppose that $alpha in "CH"^2 \( S times B \)_(bb(Q))$ induces a nonzero map $V arrow.r H^2 \( B \, bb(Q) \)$ for some complex abelian variety $B$. Let $epsilon.alt_1 \, epsilon.alt_2 in { + \, - }$, and let $A_1 \, A_2$ be abelian varieties realizing $W^(epsilon.alt_1) \, W^(epsilon.alt_2)$ as their first rational cohomology. Every rational Hodge map 
$ beta : V arrow.r W^(epsilon.alt_1) ⊗ W^(epsilon.alt_2) subset H^2 \( A_1 times A_2 \, bb(Q) \) $

 is the restriction of the action of a cycle $Gamma in "CH"^2 \( S times A_1 times A_2 \)_(bb(Q))$. In particular, this recovers the full primitive Clifford multiplication tensor and its prescribed even-Clifford realization.]
] <gen:generation>

#proof[
  Pull back $alpha$ along addition $B times B arrow.r B$ and apply the algebraic projector to $U ⊗ U subset H^2 \( B times B \, bb(Q) \)$ from Lemma 5. The resulting codimension-two cycle induces
  $ alpha' : V arrow.r U ⊗ U . $
  It is nonzero: on $H^2 \( B \, bb(Q) \) = Lambda^2 U$, the mixed component of addition pullback is the injective map $u and v mapsto u ⊗ v - v ⊗ u$.
  Fix a nonzero $frak(g)_(bb(C))$-equivariant map $gamma : V_(bb(C)) arrow.r Delta ⊗ Delta$. The map $alpha'$ is rational and Hodge, hence $frak(g)$-equivariant. Lemmas 13 and 14 give
  #[#set math.equation(numbering: n => "(4.6)")
   $ alpha'_(bb(C)) = gamma ⊗ t \, #h(2em) 0 eq.not t in M ⊗ M . $ <gen:initial-tensor>]
  In this formula the tensor factors have been regrouped so that the two spin factors come first. The other summands of $U_(bb(C)) ⊗ U_(bb(C))$ contain no vector copy.
  Put $N_j = N_(epsilon.alt_j)$ for $j = 1 \, 2$. The independent operations
  $ a in "Hom"_(bb(C)) \( M \, N_1 \) \, #h(2em) b in "Hom"_(bb(C)) \( M \, N_2 \) $
  send $t$ to $\( a ⊗ b \) t$, and these images span $N_1 ⊗ N_2$. To check this, choose $mu \, nu in M^or$ with $c = \( mu ⊗ nu \) \( t \) eq.not 0$. For arbitrary $n_1 in N_1$ and $n_2 in N_2$, the maps
  $ a \( m \) = mu \( m \) n_1 \, #h(2em) b \( m \) = nu \( m \) n_2 $
  send $t$ to $c thin n_1 ⊗ n_2$. Thus any symmetry imposed on $t$ by the original exterior square causes no restriction: the two operations are chosen independently.
  To implement these operations over $bb(Q)$, choose rational bases
  $ f_1 \, dots.h \, f_r quad upright("of ") "Hom"_(frak(g)) \( U \, W^(epsilon.alt_1) \) \, #h(2em) g_1 \, dots.h \, g_s quad upright("of ") "Hom"_(frak(g)) \( U \, W^(epsilon.alt_2) \) . $
  By Lemma 13, all these maps are Hodge, and their complex spans are the full spaces of the independent operations just used. Lemma 4 realizes each by a rational abelian homomorphism acting contravariantly on $H^1$; this is the classical weight-one equivalence, also stated in [13] Theorem 6.8 and Corollary 6.9. Products of their transpose-graph correspondences, followed by the mixed projector if necessary, therefore realize every map
  #[#set math.equation(numbering: n => "(4.7)")
   $ Phi_(i j) = \( f_i ⊗ g_j \) alpha' $ <gen:rational-generators>]
  by a rational algebraic cycle $Gamma_(i j)$ on $S times A_1 times A_2$. These cycles have codimension two: the target correspondences have degree shift zero, and composition preserves the degree shift of the original surface correspondence.
  Lemma 14, Equation (4.6), and the spanning calculation show that the complex span of the maps in Equation (4.7) is
  $ "Hom"_(frak(g)_(bb(C))) #scale(x: 120%, y: 120%)[\(] V_(bb(C)) \, W_(bb(C))^(epsilon.alt_1) ⊗ W_(bb(C))^(epsilon.alt_2) #scale(x: 120%, y: 120%)[\)] . $
  The prescribed rational Hodge map $beta$ lies in this space. Consequently the finite system
  $ beta = sum_(i = 1)^r sum_(j = 1)^s c_(i j) Phi_(i j) $
  has a solution over $bb(C)$. All its coefficients and its right-hand side are rational, so it has a solution with $c_(i j) in bb(Q)$ by Lemma 6. The cycle $Gamma = sum_(i \, j) c_(i j) Gamma_(i j)$ has precisely the required action.
  Finally, Clifford multiplication is the rational Hodge map
  $ V \( 1 \) arrow.r "Hom" \( W^(+) \, W^(-) \) \, #h(2em) x mapsto L_x . $
  Using a weight-one polarization to identify $\( W^(+) \)^or \( - 1 \)$ with $W^(+)$ makes it a rational Hodge map $V arrow.r W^(-) ⊗ W^(+)$. It is therefore one of the maps just realized. The fixed odd right multiplier and prescribed weight-one duality then give exactly the specified even-Clifford tensor, by Lemma 10. No choice of a single spin copy or undetermined scalar remains. ◻
]

#prodef([Remark 4.6.])[
  The complex decompositions in Equation (4.2) are used only to compute a span. The maps $f_i \, g_j$ and the cycles $Gamma_(i j)$ are rational before that computation. In particular, the argument requires neither a split rational Clifford algebra nor descent of an individual complex spin summand. It proves algebraicity of the prescribed rational tensor on the full Clifford spaces.
] <gen:rationality>

== 5 Specialization of an actual algebraic class <spec:section>

We first establish a specialization statement for projective analytic families. This permits the Kuga–Satake construction to be made on a marked period polydisc, where all its rational data are constant. Throughout this section, “very general” in a connected complex manifold means outside a countable union of proper closed analytic subsets.

=== 5.1 Hilbert parameters over an analytic base <hilbert-parameters-over-an-analytic-base>

#thm([Lemma 5.1.])[
  (An analytic classifying map).  #emph[Let $p : cal(X) arrow.r D$ be a smooth proper holomorphic family of nonempty, pure $n$-dimensional varieties over a connected complex manifold. Suppose that an embedding 
$ cal(X) arrow.r.hook D times bb(P)^N $

 over $D$ has been given. There are a reduced complex quasi-projective scheme $H$, a smooth projective algebraic family $cal(U) arrow.r H$, and a holomorphic map $eta : D arrow.r H^(upright("an"))$ such that $cal(X)$ is the embedded analytic pullback of $cal(U)$.]
] <spec:hilbert-map>

#proof[
  The embedded fibers have a common Hilbert polynomial $P$. Indeed, Riemann–Roch expresses $chi \( cal(X)_t \, cal(O)_(cal(X)_t) \( k \) \)$ in terms of the fiber integrals of the Chern classes of the relative tangent bundle and the hyperplane bundle. These integrals are locally constant in a smooth proper family, and $D$ is connected.
  Let $"Hilb"^P \( bb(P)^N \)$ be the algebraic Hilbert scheme. Fixed-polynomial boundedness supplies one sufficiently large integer $k$ for which every member $Y$ has
  $ dim "im" #scale(x: 120%, y: 120%)[\(] H^0 \( bb(P)^N \, cal(O) \( k \) \) arrow.r H^0 \( Y \, cal(O)_Y \( k \) \) #scale(x: 120%, y: 120%)[\)] = P \( k \) \, $
  and its degree-$k$ ideal space defines the Hilbert scheme’s closed embedding in the corresponding Grassmannian. These uniform statements precede the construction of $eta$; see [8] Theorem 3.2 and Proposition 3.8.
  We check that $t mapsto H^0 \( bb(P)^N \, cal(I)_(cal(X)_t) \( k \) \)$ is holomorphic. Fix $t_0 in D$. Since $cal(X)_(t_0)$ is reduced, point evaluations separate the restrictions of degree-$k$ polynomials. Choose finitely many points whose evaluations have rank $P \( k \)$, and extend these points to local holomorphic sections of $p$, using its submersion property. After locally trivializing $cal(O) \( k \)$ along these sections, evaluation is a holomorphic matrix. A nonzero $P \( k \)$-minor remains nonzero near $t_0$. Its rank cannot exceed $P \( k \)$, because evaluation factors through restriction to $cal(X)_t$. Consequently its kernel equals the degree-$k$ ideal space, and these kernels give the required holomorphic Grassmannian map.
  Pointwise this map lies in the Hilbert locus. Since $D$ is reduced, the defining equations of that locus vanish on $D$, so the map factors holomorphically through the Hilbert scheme. Take $H$ to be the reduction of the open locus parametrizing smooth pure $n$-dimensional subschemes, and let $cal(U)$ be the restricted universal family. Flatness of the universal family and smoothness of all its fibers imply that $cal(U) arrow.r H$ is smooth. Its pullback to $D$ and $cal(X)$ are reduced closed analytic subspaces of $D times bb(P)^N$ with the same fibers, hence the same underlying set. They therefore coincide. ◻
]

For a closed subscheme $Z$ of dimension at most $a$, write $\[ Z \]_a$ for its $a$-dimensional fundamental cycle, with the lengths at the generic points as multiplicities. Components of smaller dimension do not enter $\[ Z \]_a$.

#thm([Lemma 5.2.])[
  (Classes of flat subschemes).  #emph[Let $f : M arrow.r R$ be a smooth projective algebraic family of relative dimension $n$, with $R$ a smooth irreducible complex variety of dimension $b$. Let $Z subset M$ be a closed subscheme, flat over $R$, whose fibers have dimension $n - 2$. Then 
$ r mapsto "cl" \( \[ Z_r \]_(n - 2) \) in H^4 \( M_r \, bb(Q) \) $

 is a section of the local system $R^4 f_(*)^(upright("an")) bb(Q)$. This includes nonpure and nonreduced fibers.]
] <spec:flat-cycle>

#proof[
  The total space $M$ is smooth. Flatness and the dimension formula give $dim Z = n + b - 2$, so its top cycle has a class
  $ zeta = "cl" \( \[ Z \]_(n + b - 2) \) in H^4 \( M \, bb(Q) \) . $
  Here the usual cycle class on a smooth variety takes values in ordinary cohomology; completeness of $M$ is unnecessary. We claim that, for the inclusion $i_r : M_r arrow.r.hook M$,
  #[#set math.equation(numbering: n => "(5.1)")
   $ i_r^(*) zeta = "cl" \( \[ Z_r \]_(n - 2) \) . $ <spec:restriction>]
  Choose local algebraic coordinates by an #emph[étale] map from a neighborhood $U subset R$ to $bb(A)^b$ taking $r$ to $0$. Shrink $U$ to remove the other points over $0$. The coordinate functions then cut out a smooth flag
  $ U = U_0 supset U_1 supset dots.h.c supset U_b = { r } . $
  Put $Z_j = Z times_R U_j$. It remains flat over $U_j$ and has dimension at most $n + b - 2 - j$. At each step the next coordinate is a nonzerodivisor on $U_j$ and hence on the entire scheme $Z_j$. The Cartier intersection formula therefore gives
  $ \[ Z_j \]_(n + b - 2 - j) mapsto \[ Z_(j + 1) \]_(n + b - 3 - j) \, $
  with the scheme multiplicities [15] Lemma 42.29.5, Tag 02TB. Applying the formula successively yields
  $ i_r^(!) \[ Z \]_(n + b - 2) = \[ Z_r \]_(n - 2) . $
  The formula applies to the whole possibly nonpure or nonreduced scheme at each cut; no componentwise flatness assertion is needed. Compatibility of Betti cycle classes with these regular pullbacks proves (5.1).
  Finally, the restrictions of a single cohomology class on the total space of a smooth proper family form a section of its cohomology local system. This follows directly from local differentiable triviality. Apply it to $zeta$. ◻
]

#thm([Proposition 5.3.])[
  (Specialization from very general algebraicity).  #emph[Let $D$ be a connected polydisc, and let $p : cal(X) arrow.r D$ be a smooth proper holomorphic family of $n$-dimensional varieties, $n gt.eq 2$, with a relative embedding in $D times bb(P)^N$. Let 
$ theta in H^0 \( D \, R^4 p_(*) bb(Q) \) $

 be a flat rational class. If $theta_t$ is the class of a rational codimension-two algebraic cycle for very general $t in D$, then the same holds for every $t in D$.]
] <spec:specialization>

#proof[
  Fix a desired point $0 in D$ and trivialize $R^4 p_(*) bb(Q)$ over $D$. Use Lemma 17 to write the family as the pullback of $cal(U) arrow.r H$ along $eta : D arrow.r H^(upright("an"))$. For each possible Hilbert polynomial $Q$ of degree $n - 2$, consider
  $ T_Q = "Hilb"^Q \( cal(U) \/ H \) . $
  This is projective over $H$ and has a flat universal subscheme. It has finitely many reduced irreducible components. Resolve each component by a projective birational morphism, obtaining a finite collection of smooth irreducible varieties $R arrow.r \( T_Q \)_(upright("red"))$ whose images cover $\( T_Q \)_(upright("red"))$; use [9]. Thus each composite $R arrow.r H$ is proper. Pullback gives a smooth projective ambient family $cal(U)_R arrow.r R$ and a flat closed subscheme $Z_R subset cal(U)_R$. By Lemma 18, the classes of the top cycles of its fibers are sections of $R^4 \( cal(U)_R \/ R \)_(*) bb(Q)$.
  Form the analytic spaces
  $ K_R = D times_(H^(upright("an"))) R^(upright("an")) . $
  They are proper over $D$. Their pulled-back ambient families agree with the pullback of $cal(X)$, so the preceding cycle classes become locally constant functions on $K_R$ with values in the fixed marked space $H^4 \( cal(X)_0 \, bb(Q) \)$. The spaces $K_R$ may be singular or nonreduced: this causes no difficulty, since local constancy was established on the smooth parameter $R$ before base change.
  There are countably many $Q$ and finitely many choices of $R$ for each $Q$. Each $K_R$ is second countable and has a locally finite family of closed irreducible analytic components. It consequently has at most countably many such components. Every component is proper over $D$; Remmert’s Proper Mapping Theorem makes its image a closed analytic subset of $D$ [7] §7, Satz 1. Let $E$ be the union of the images of all components whose image is not all of $D$. Thus $E$ is a countable union of proper closed analytic subsets.
  Choose $t in D$ outside $E$ and outside the exceptional sets in the hypothesis. Such a point exists by the Baire Category Theorem. Choose an actual cycle representing $theta_t$, and write it as a finite sum
  $ gamma_t = sum_(j = 1)^s a_j \[ Y_(j \, t) \] \, #h(2em) a_j in bb(Q) \, $
  where each $Y_(j \, t) subset cal(X)_t$ is an integral subvariety of codimension two. Its Hilbert point lifts to one of the parameters $R$, and hence to a point $u_j in K_R$ above $t$. Choose an irreducible component $C_j$ containing $u_j$. Because $t in.not E$, the map $C_j arrow.r D$ is surjective. In particular, there is a point $v_j in C_j$ above $0$.
  An irreducible complex analytic space is connected. The marked cycle class is therefore constant on $C_j$, and the fiber of the universal subscheme at $v_j$ has top cycle $delta_(j \, 0)$ satisfying
  $ "cl" \( delta_(j \, 0) \) = "cl" \( \[ Y_(j \, t) \] \) quad upright("under the marking.") $
  These are algebraic cycles on $cal(X)_0$: the fibers of the universal subscheme are algebraic in $bb(P)^N$, and the embedded fiber identification is algebraic by GAGA [14]. Consequently
  $ gamma_0 = sum_(j = 1)^s a_j delta_(j \, 0) quad upright("satisfies") quad "cl" \( gamma_0 \) = theta_0 . $
  The argument applies to any chosen point of $D$. ◻
]

The avoidance in this proof is essential: density of fibers with algebraic classes by itself would not ensure that the components parametrizing those cycles reach the desired fiber. Proposition 19 requires actual algebraicity at very general points. It assumes no principle asserting algebraicity from the Hodge property of a flat class.

=== 5.2 A marked family for the primitive Clifford tensor <a-marked-family-for-the-primitive-clifford-tensor>

#thm([Lemma 5.4.])[
  (Local polarized families).  #emph[Fix a primitively amply polarized K3 surface $\( S_0 \, h \)$. After choosing a sufficiently small full-dimensional polarized period polydisc $D$ about its period, there are smooth proper holomorphic families 
$ cal(S) arrow.r D \, #h(2em) cal(A) arrow.r D \, $

 with the following properties. The K3 family has central fiber $\( S_0 \, h \)$, a relative ample line bundle, and a marking of its integral second cohomology. The primitive rational local system is a fixed quadratic space $\( V \, q \)$ of dimension $21$. The abelian family has marked rational first cohomology $W = C^(+) \( V \, q \)$ with the full Clifford Hodge structures. Fixed rational polarization and parity-identification data give a flat family of standard tensor maps 
$ mu_t : V arrow.r H^1 \( cal(A)_t \, bb(Q) \) ⊗ H^1 \( cal(A)_t \, bb(Q) \) . $

 Finally, after shrinking $D$, the product 
$ cal(X) = cal(S) times_D cal(A) times_D cal(A) $

 admits a relative embedding in $D times bb(P)^N$.]
] <spec:local>

#proof[
  Polarized deformation theory and local Torelli give the smooth K3 family over a $19$-dimensional polydisc on which the period map is a local isomorphism; see [10] Chapter 6, Section 2. Since $D$ is contractible, its cohomology local systems are marked. The class $h$ remains of type $\( 1 \, 1 \)$. We recall why it is represented by a line bundle on the total family. Local differentiable triviality over the contractible base extends $h$ to $H^2 \( cal(S) \, bb(Z) \)$. The polydisc is Stein, and coherent Leray and Cartan’s Theorem B identify
  $ H^2 \( cal(S) \, cal(O)_(cal(S)) \) = H^0 \( D \, R^2 p_(*) cal(O)_(cal(S)) \) \, #h(2em) p : cal(S) arrow.r D . $
  The direct image on the right is locally free and commutes with base change. The image of $h$ in it vanishes fiberwise, hence vanishes. The exponential sequence now gives a holomorphic line bundle $cal(L)$ with first Chern class $h$.
  A high power of $cal(L)$ is very ample on $S_0$ and has vanishing higher cohomology there. Proper cohomology and base change extend a basis of its sections over a neighborhood of $0$. They give a relative embedding after shrinking: basepoint freeness and immersion persist near the central fiber, and properness excludes pairs of distinct points with the same image. For the latter assertion, any sequence of such pairs approaching the central fiber either limits to distinct points, contrary to its embedding, or to a single point, contrary to the local embedding furnished by the immersion. This proves local relative projectivity, and also that $h$ stays ample. The analytic tools used here are the proper direct-image and base-change theorems and the Stein vanishing theorem; see [7] §6, Hauptsatz I; §7, Sätze 3,5; §2, Satz 3.
  On the fixed Clifford space $W$, the Hodge filtration and rational alternating polarization are those constructed in Proposition 9. To recall the holomorphic dependence, if $omega_t$ spans the period line, then
  $ F^1 W_(bb(C)) = "im" #scale(x: 120%, y: 120%)[\(] L_(omega_t) : C^(-) \( V_(bb(C)) \, q \) arrow.r C^(+) \( V_(bb(C)) \, q \) #scale(x: 120%, y: 120%)[\)] . $
  This has constant half dimension and varies holomorphically. The polarization can be fixed on a sufficiently small chart. Choose a rational symplectic basis and let its integral span be a lattice $Lambda$ in $W$. It is unimodular for the chosen symplectic form and does not change the rational Hodge structure. Since $W$ is cohomology, the associated torus is explicitly
  $ cal(A)_t = \( F^1 W_t \)^or \/ "image" \( Lambda^or \) \, $
  where a lattice functional is restricted to $F^1 W_t$. Thus $H_1 \( cal(A)_t \, bb(Z) \) = Lambda^or$, $H^1 \( cal(A)_t \, bb(Z) \) = Lambda$, and $H^(1 \, 0) \( cal(A)_t \) = F^1 W_t$, compatibly with the markings. The polarization supplies the Riemann form on the dual lattice. Equivalently, the marked filtrations give a holomorphic map to Siegel space and $cal(A) arrow.r D$ is the pullback of its marked torus family. The full markings supply, in particular, level-$3$ data. The spin action is defined on the fixed Clifford space over the polydisc, so there is no monodromy lifting problem on this base.
  For completeness, in symplectic period coordinates this torus family is
  $ bb(C)^g \/ \( bb(Z)^g + tau \( t \) bb(Z)^g \) \, #h(2em) tau \( t \)^(sans(t)) = tau \( t \) \, quad "Im" tau \( t \) > 0 . $
  The factors
  $ exp #scale(x: 120%, y: 120%)[\(] - pi i thin n^(sans(t)) tau \( t \) n - 2 pi i thin n^(sans(t)) z #scale(x: 120%, y: 120%)[\)] \, #h(2em) m + tau \( t \) n in bb(Z)^g + tau \( t \) bb(Z)^g \, $
  define a holomorphic theta line bundle, ample on every fiber. The preceding extension-of-sections argument gives a relative projective embedding after shrinking $D$.
  Fix a rational nonisotropic vector $z_0 in V$ and the polarization identification $j : W^or \( - 1 \) arrow.r^tilde.op W$. The maps
  $ V \( 1 \) arrow.r "End" \( W \) \, #h(2em) x mapsto #scale(x: 120%, y: 120%)[\(] w mapsto x w z_0 #scale(x: 120%, y: 120%)[\)] $
  give $mu_t$ after untwisting and applying $j$ to the dual slot. Clifford multiplication, $z_0$, and $j$ are constant rational data in the markings. Thus $mu_t$ is flat as a rational tensor and is a Hodge map in every fiber. A Segre embedding combines the relative embeddings of $cal(S)$ and the two copies of $cal(A)$. ◻
]

#thm([Corollary 5.5.])[
  (The primitive map at every polarized fiber).  #emph[Fix a polarized moduli component, and assume that at very general points the nonzero algebraic input of Theorem 1 holds. Then at every $\( S_0 \, h \)$ in that component the standard full primitive Clifford tensor is induced by a rational codimension-two algebraic cycle. The same conclusion holds if the hypothesis is made outside countably many proper closed analytic subsets in a full-dimensional polarized period chart about each desired point.]
] <spec:primitive>

#proof[
  Take the families in Lemma 20 about $\( S_0 \, h \)$. Under the markings, extend $mu_t$ by zero on $bb(Q) h$ and on the other degrees of $H^(*) \( cal(S)_t \, bb(Q) \)$. Poincaré duality and the Künneth decomposition give a unique flat class
  $ theta in H^0 \( D \, R^4 \( cal(X) \/ D \)_(*) bb(Q) \) $
  with this action. More explicitly, for a rational basis $\( v_i \)$ of $V$, let $\( q^(i j) \)$ be the inverse cup-pairing matrix. Then
  #[#set math.equation(numbering: n => "(5.2)")
   $ theta_t = sum_(i \, j) q^(i j) v_i ⊗ mu_t \( v_j \) med in med V ⊗ #scale(x: 120%, y: 120%)[\(] H^1 \( cal(A)_t \) ⊗ H^1 \( cal(A)_t \) #scale(x: 120%, y: 120%)[\)] med subset med H^4 \( cal(X)_t \, bb(Q) \) . $ <spec:theta>]
  By Proposition 11, after excluding countably many proper closed analytic subsets we have $"Hg" \( V_t \) = "SO" \( V \, q \)$. At a point satisfying this condition and the assumed input, Theorem 15 produces a cycle inducing $mu_t$ on $V_t$. Its full class can be made exactly $theta_t$. Indeed, on $cal(S)_t$ the algebraic correspondence
  #[#set math.equation(numbering: n => "(5.3)")
   $ pi_(V \, t) = \[ Delta_(cal(S)_t) \] - \[ o_t \] times cal(S)_t - cal(S)_t times \[ o_t \] - frac(h times h, integral_(cal(S)_t) h^2) \, #h(2em) o_t in cal(S)_t \, $ <spec:primitive-projector>]
  acts identically on $V_t$ and kills $H^0$, $H^4$, and $bb(Q) h$. There is no odd K3 cohomology. Precompose the chosen cycle with $pi_(V \, t)$ and postcompose with the algebraic projector onto $H^1 \( cal(A)_t \) ⊗ H^1 \( cal(A)_t \)$, as in Lemma 5. These operations preserve codimension two. The resulting cycle has the prescribed action in every source degree, so Poincaré duality and Künneth identify its entire class with (5.2). The point $o_t$ is needed only on this fiber; its cohomology class, and hence the projector’s cohomological action, is canonical.
  If the hypothesis is stated in algebraic moduli, its exceptional loci pull back to proper closed analytic subsets of $D$. They remain proper because the full-dimensional polarized period chart has open image locally in that component, up to a finite automorphism quotient. Thus $theta_t$ is algebraic very generally on $D$ in either version of the hypothesis. Proposition 19 produces an actual rational codimension-two cycle with class $theta_0$. Its action on $V$ is exactly $mu_0$. Undoing the fixed invertible right multiplier on the output Hom slot, using Lemma 10, also algebraically realizes $m^q$ itself. ◻
]

Neither the original witness abelian varieties nor their cycles have to form a family. Theorem 15 first transfers the input to the fixed local full Clifford family. The specialization argument then uses a finite representative of one sufficiently general cycle, keeping its rational coefficients unchanged.

== 6 Restriction and the prescribed data at a special fiber <data:section>

Let $\( S \, h \)$ now be any fiber under consideration, and put

$ V = h^perp subset H^2 \( S \, bb(Q) \) \, #h(2em) T = "NS" \( S \)_(bb(Q))^perp subset V . $

Suppose that the primitive Clifford multiplication for the cup form $q$ on $V$ has been algebraically realized. We show that this gives the stipulated standard map on $T$, including its chosen rational quadratic polarization. The arguments use no hypothesis on the Hodge group at this fiber.

#thm([Proposition 6.1.])[
  (Restriction to the transcendental part).  #emph[Set $q_0 = q \|_T$. Algebraic realization of $m^q$ on $V$ implies algebraic realization of $m^(q_0)$ on $T$.]
] <data:restriction>

#proof[
  The orthogonal decomposition $V = T xor T^perp$ is a decomposition of rational Hodge structures, and $T$ contains the period plane. By the Clifford Basis Theorem there are inclusions
  $ C^plus.minus \( T \, q_0 \) arrow.r.hook C^plus.minus \( V \, q \) . $
  They are weight-one Hodge inclusions: the element $J$ defining the left Hodge circle already belongs to $C^(+) \( T_(bb(R)) \, q_0 \)$. Let $i : C^(+) \( T \, q_0 \) arrow.r C^(+) \( V \, q \)$ be the inclusion and choose a rational Hodge retraction $p : C^(-) \( V \, q \) arrow.r C^(-) \( T \, q_0 \)$. Such a retraction exists by polarizability: the orthogonal complement for a weight-one polarization is a rational Hodge complement. For every $x in T$,
  #[#set math.equation(numbering: n => "(6.1)")
   $ p thin L_x^V thin i = L_x^T \, $ <data:restriction-identity>]
  because $x C^(+) \( T \, q_0 \) subset C^(-) \( T \, q_0 \)$ and $p$ restricts to the identity there. Lemma 10 realizes the two operations on the abelian factors. Restricting the resulting cycle action to $T$ gives the asserted equality; no operation on the K3 factor is needed. ◻
]

#thm([Proposition 6.2.])[
  (Change of quadratic polarization).  #emph[Let $q_0$ and $q_1$ be rational quadratic Hodge polarizations on the same K3-type Hodge structure $T$, allowing either overall sign as in Section 3. If $T subset H^2 \( S \, bb(Q) \)$ and $m^(q_0)$ is algebraically realized, then so is $m^(q_1)$.]
] <data:polarization>

#proof[
  #emph[Step 1: square-root isometries.] Write
  #[#set math.equation(numbering: n => "(6.2)")
   $ q_1 \( u \, v \) = q_0 \( P u \, v \) . $ <data:P>]
  The two form isomorphisms from $T$ to its twisted dual show that $P$ is an invertible rational Hodge endomorphism. Symmetry of the forms makes $P$ self-adjoint for $q_0$. Let $K$ be $+ 1$ on the real period plane and $- 1$ on the real $\( 1 \, 1 \)$-part, and let $epsilon.alt_0$ be the sign of $q_0$ on the period plane. Then
  $ \( u \, v \)_0 = epsilon.alt_0 q_0 \( K u \, v \) $
  is positive definite. Since $P$ commutes with $K$, it is also self-adjoint for this positive definite real form. Hence $P$ is semisimple with real nonzero eigenvalues. Its distinct eigenvalues $lambda_1 \, dots.h \, lambda_r$ and spectral projectors $p_1 \, dots.h \, p_r$ are defined over $overline(bb(Q))$, the latter being polynomials in $P$.
  Choose $nu_i in overline(bb(Q))$ with $nu_i^2 = lambda_i$. For each $s = \( s_1 \, dots.h \, s_r \) in { 1 \, - 1 }^r$, put
  #[#set math.equation(numbering: n => "(6.3)")
   $ R_s = sum_(i = 1)^r s_i nu_i p_i . $ <data:roots>]
  These are invertible self-adjoint operators with $R_s^2 = P$. Consequently
  $ q_0 \( R_s u \, R_s v \) = q_0 \( P u \, v \) = q_1 \( u \, v \) . $
  Thus $R_s : \( T \, q_1 \)_(overline(bb(Q))) arrow.r \( T \, q_0 \)_(overline(bb(Q)))$ is an isometry and extends to a parity-preserving Clifford algebra isomorphism
  $ F_s : C \( T \, q_1 \)_(overline(bb(Q))) arrow.r^tilde.op C \( T \, q_0 \)_(overline(bb(Q))) . $
  #emph[Step 2: weight-one Hodge maps.] We show that the parity restrictions of $F_s$ and their inverses lie in the $overline(bb(Q))$-span of rational weight-one Hodge maps.
  Let $cal(J)$ be the joint rational Hodge group of $T$ and the four weight-one spaces $P_j^plus.minus = C^plus.minus \( T \, q_j \)$, $j = 0 \, 1$. Here the joint Hodge group is the smallest rational algebraic subgroup containing their simultaneous real Hodge circle. Its geometric identity component is defined over $bb(Q)$ and already contains that connected circle. Minimality therefore gives $cal(J) = cal(J)^compose$, so $cal(J)$ is geometrically connected. Write $rho_T$ for its action on $T$. Since $P$ is a rational Hodge endomorphism, it commutes with $rho_T \( cal(J) \)$; therefore every $R_s$ does as well after scalar extension.
  For each $j$, the projection of $cal(J)$ to the actions on $\( T \, P_j^(+) \, P_j^(-) \)$ lies in the image of
  $ "Spin" \( T \, q_j \) arrow.r "GL" \( T \) times "GL" \( P_j^(+) \) times "GL" \( P_j^(-) \) \, $
  using the orthogonal action on $T$ and left multiplication on the parity spaces. Indeed, this rational algebraic image contains the projected circle by (3.1). The representation is faithful, since the left action on $C^(+)$ recovers a spin element by evaluation at $1$. Thus it identifies the spin group with its algebraic image, and gives algebraic homomorphisms
  $ rho_j : cal(J) arrow.r "Spin" \( T \, q_j \) $
  covering the same action $rho_T$.
  The isometry $R_s$ induces an isomorphism of spin groups $hat(R)_s : "Spin" \( T \, q_1 \)_(overline(bb(Q))) arrow.r "Spin" \( T \, q_0 \)_(overline(bb(Q)))$. Since $R_s$ commutes with $rho_T$, both $hat(R)_s rho_1$ and $rho_0$ lift the same orthogonal representation of $cal(J)_(overline(bb(Q)))$. Their pointwise quotient therefore takes values in the central kernel $mu_2$ of the spin covering. This quotient is a morphism from a connected group to a finite group, and is the identity at the identity. Hence
  #[#set math.equation(numbering: n => "(6.4)")
   $ hat(R)_s rho_1 = rho_0 . $ <data:lift-agreement>]
  Because $F_s$ is an algebra isomorphism, (6.4) says precisely that $F_s$ intertwines the left $cal(J)$-actions on both parities.
  For finite-dimensional rational representations, equivariant Hom-spaces commute with field extension: equivariance is a set of rational linear equations on the matrix of a map. Rational maps intertwine $cal(J)$ exactly when they intertwine its Hodge circle. Thus
  #[#set math.equation(numbering: n => "(6.5)")
   $ "Hom"_(cal(J)) \( P_1^plus.minus \, P_0^plus.minus \) ⊗_(bb(Q)) overline(bb(Q)) = "Hom"_(cal(J)_(overline(bb(Q)))) \( P_(1 \, overline(bb(Q)))^plus.minus \, P_(0 \, overline(bb(Q)))^plus.minus \) $ <data:hom-descent>]
  expresses $F_s^plus.minus$, and likewise $\( F_s^plus.minus \)^(- 1)$, as finite linear combinations of rational weight-one Hodge maps.
  #emph[Step 3: recovery and rational descent.] Fix abelian realizations and rational dualities for the $q_1$ target, and let $cal(A)$ be the rational subspace of maps
  $ T arrow.r P_1^(-) ⊗ P_1^(+) $
  obtained by restricting rational codimension-two cycle actions from $S$ and projecting to this Künneth component. It is a subspace of a finite-dimensional rational Hom-space. By Lemma 10 and (6.5), conjugating the algebraically realized $q_0$ multiplication on its Hom slots gives elements of $cal(A) ⊗ overline(bb(Q))$. The exact Clifford identity is
  #[#set math.equation(numbering: n => "(6.6)")
   $ \( F_s^(-) \)^(- 1) L_x^(q_0) F_s^(+) = L_(R_s^(- 1) x)^(q_1) #h(2em) \( x in T \) . $ <data:conjugation>]
  Here the conjugation is expanded using rational Hodge maps on the two abelian factors; it does not apply $R_s^(- 1)$ to the cohomology of $S$ by a correspondence.
  An elementary sign average recovers the unmodified source:
  #[#set math.equation(numbering: n => "(6.7)")
   $ p_i = nu_i / 2^r sum_(s in { 1 \, - 1 }^r) s_i R_s^(- 1) \, #h(2em) "id"_T = sum_(i = 1)^r p_i . $ <data:sign-average>]
  Indeed $R_s^(- 1) = sum_j s_j nu_j^(- 1) p_j$ and $sum_s s_i s_j = 2^r delta_(i j)$. Equations (6.6) and (6.7) therefore place the tensor realization of $x mapsto L_x^(q_1)$ in $cal(A) ⊗ overline(bb(Q))$. This map is rational, so Lemma 6 places it in $cal(A)$ itself. A finite rational linear combination of actual cycles realizes it. ◻
]

#prodef([Remark 6.3.])[
  The proof never uses an algebraic correspondence representing $P$, any $p_i$, or any $R_s$ on the K3 surface. They enter only the identities that produce weight-one intertwiners and the finite rational descent. In particular $P$ need not be scalar. The argument applies with additional real multiplication or complex multiplication endomorphisms, and requires no description of the special Hodge group. It applies also in ranks $2$, $3$, and $4$. In rank $2$, the full even-Clifford space is two-dimensional and $"Spin"_2 arrow.r "SO"_2$, over an algebraic closure, is the squaring map on $bb(G)_m$ with kernel $mu_2$. The faithful left Clifford action and the connected-lift argument remain valid. Higher small ranks introduce no exception. We make no assertion that all Hodge embeddings for a smaller special Hodge group are generated by these operations.
  The opposite-sign case is directly visible in rank two. Take $q_0 = "diag" \( 1 \, 1 \)$ and $q_1 = - q_0$ in the same period basis. Then $J_1 = - e_1 e_2$ and the isometry $R = i "id"$ induces $F \( J_1 \) = - \( i e_1 \) \( i e_2 \) = J_0$. Thus the nonreal square root preserves the specified weight-one circle, as the lift argument predicts.
] <data:scope>

For completeness, a rational Hodge automorphism $D$ of $T$ in a prescribed identification can also be incorporated without applying it as a K3 correspondence. First use Proposition 23 for the pullback form $D^(*) q_1$. The rational isometry $D : \( T \, D^(*) q_1 \) arrow.r \( T \, q_1 \)$ induces weight-one Hodge isomorphisms on Clifford spaces: the same connected-lift argument proves this, since $D$ commutes with the joint Hodge action. Transport on the two Hom slots then gives exactly $x mapsto L_(D x)^(q_1)$.

Finally apply Proposition 22, then Proposition 23, and then the prescribed right multiplier and duality of (3.6). Lemma 10 transports the resulting tensor to the actual $H^1 \( A_S \, bb(Q) \)$ model. The target Künneth projectors give a cycle

$ Gamma_S in "CH"^2 \( S times A_S times A_S \)_(bb(Q)) quad upright("with") quad \( Gamma_S \)_(*) x = kappa_S \( x \) quad upright("for every ") x in T . $

This is equality with the prescribed full map, including its rational normalization, and completes the exact-data step in Theorems 1 and 2.

== 7 Completion of the reductions <sec:conclusion>

#proof[
  Proposition 11 gives $T = V$. Proposition 7 proves the equivalence of conditions (i) and (ii). From condition (i), Theorem 15 realizes the full primitive Clifford multiplication. Proposition 23 and Lemma 10 then give condition (iii) with the stipulated data. Conversely, condition (iii) gives condition (i) by taking $B = A_S times A_S$ and $alpha = Gamma_S$. ◻
]

#proof[
  By Proposition 7, either assumed input gives the nonzero correspondence very generally. Corollary 21, followed by the inverse right multiplier in Lemma 10, algebraically realizes $m^q$ on $V$ at the desired point. Proposition 22 gives $m^(q \|_T)$ on $T$. Proposition 23 and Lemma 10 then give the prescribed quadratic form, parity identification, duality, and isogenous realization, hence (1.2). The operations on the abelian factors preserve the degree shift, so the resulting cycle has codimension two. ◻
]

The conclusions include Picard jumps, extra real or complex multiplication, and the smallest possible transcendental ranks. They require the prescribed multiplication tensor at those points; they do not assert generation of every Hodge embedding for a smaller special Hodge group. The mathematical content of the reduction is conditional: producing a very-general nonzero algebraic correspondence, or equivalently the surface cover of Theorem 1, remains the external existence problem.

== 8 Established inputs <app:dependencies>

The following background results are the external dependencies. The representation-width argument, recovery by independent tensor operations, change of quadratic form, and specialization of the prescribed class are proved in the text. No algebraicity theorem for the Kuga–Satake class is an input. Page numbers for [10] refer to the linked draft.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Established statement and hypotheses
], table.cell(rowspan: 1, colspan: 1)[Reference and locator
], table.cell(rowspan: 1, colspan: 1)[Role
]),
  table.cell(rowspan: 1, colspan: 1)[For smooth projective complex varieties, Hodge decomposition, Poincaré duality, the Lefschetz theorem on $\( 1 \, 1 \)$-classes, hard Lefschetz, and the Hodge–Riemann relations hold; pullback, Gysin maps, and products have their usual Hodge types.
], table.cell(rowspan: 1, colspan: 1)[[18], §§6.1–6.3, pp. 139–154; §§7.1–7.3, pp. 157–182.
], table.cell(rowspan: 1, colspan: 1)[Pairings, primitive cohomology, divisor classes, and nonvanishing calculations.
],
  table.cell(rowspan: 1, colspan: 1)[Polarizable rational Hodge structures have Hodge complements, and their rational Hodge group is reductive. The same holds for a finite joint collection.
], table.cell(rowspan: 1, colspan: 1)[[2], Proposition 3.6 and its proof, electronic p. 27; [18], §7.3.1.
], table.cell(rowspan: 1, colspan: 1)[Rational splittings and the joint Hodge-group Lie algebra.
],
  table.cell(rowspan: 1, colspan: 1)[In characteristic zero algebraic group homomorphisms have closed image and surjective differential onto its Lie algebra. A unipotent group has nonzero invariants in every nonzero representation. A reductive Lie algebra is the sum of its center and simple ideals.
], table.cell(rowspan: 1, colspan: 1)[[1], Corollary 1.4, Theorem 4.8, §7, and Proposition 14.2; [5], Lectures 9 and 14.
], table.cell(rowspan: 1, colspan: 1)[The rational simple ideal above the orthogonal quotient and the commuting kernel.
],
  table.cell(rowspan: 1, colspan: 1)[A complex K3 surface has the rank-$22$ cup lattice and Hodge numbers used here. Its universal deformation is smooth of dimension $20$; the local period map is an isomorphism. Fixing a nonzero integral $\( 1 \, 1 \)$-class cuts out the corresponding local period hypersurface and extends its line bundle.
], table.cell(rowspan: 1, colspan: 1)[[10], Chapter 1, §§2–3; Chapter 6, Corollary 2.7 and Proposition 2.8, p. 107; §2.4, p. 108.
], table.cell(rowspan: 1, colspan: 1)[Marked polarized deformation charts and the rank-$21$ primitive space.
],
  table.cell(rowspan: 1, colspan: 1)[The full even Clifford construction of a polarized Hodge structure of K3 type is polarizable of weight one. Clifford multiplication with an invertible right multiplier gives the standard Hodge embedding.
], table.cell(rowspan: 1, colspan: 1)[[10], Chapter 4, Propositions 2.5–2.6 and Remark 2.7, pp. 66–68; [6], Propositions 5.9 and 6.3.
], table.cell(rowspan: 1, colspan: 1)[The prescribed full target, Hodge types, and fixed construction data.
],
  table.cell(rowspan: 1, colspan: 1)[Complex semisimple Lie algebras have completely reducible finite-dimensional representations and highest-weight classification. In type $B_n$ the dominant-weight coordinates and spin weights have the stated forms. The Clifford Basis Theorem and spin double covering hold in characteristic zero.
], table.cell(rowspan: 1, colspan: 1)[[5], Lectures 14 and 18–20; §19.4, pp. 294–296; §§20.1–20.2, pp. 299–312.
], table.cell(rowspan: 1, colspan: 1)[The width bound, spin multiplicity calculation, and finite-kernel lift comparison.
],
  table.cell(rowspan: 1, colspan: 1)[The functor $H^1$ identifies complex abelian varieties up to isogeny contravariantly with polarizable rational weight-one Hodge structures. A polarized complex torus is projective.
], table.cell(rowspan: 1, colspan: 1)[[13], Theorems 6.7–6.8 and Corollary 6.9, pp. 72–73 (stated covariantly for homology).
], table.cell(rowspan: 1, colspan: 1)[Algebraic realization of every rational weight-one slot map and of the Clifford spaces.
],
  table.cell(rowspan: 1, colspan: 1)[For a smooth projective complex variety $Y$, its Albanese is an abelian variety, and its Albanese map induces an isomorphism on holomorphic one-forms.
], table.cell(rowspan: 1, colspan: 1)[[3], Chapter VI, §9.2, pp. 315–316, formulas (9.11)–(9.13).
], table.cell(rowspan: 1, colspan: 1)[Conversion of the surface-cover input into a correspondence involving an abelian variety.
],
  table.cell(rowspan: 1, colspan: 1)[On smooth projective varieties, correspondences compose by pullback, intersection, and proper pushforward, with the indicated codimension. Cycle classes commute with these operations.
], table.cell(rowspan: 1, colspan: 1)[[4], §16.1, pp. 305–315, and §§19.1–19.2, pp. 371–385; [16], Lemmas 45.3.1 and 45.3.6.
], table.cell(rowspan: 1, colspan: 1)[Actual rational cycles throughout, with controlled degrees and graph transposes.
],
  table.cell(rowspan: 1, colspan: 1)[For a projective family over a noetherian base, each fixed-polynomial relative Hilbert scheme is projective and has a flat universal subscheme. One uniform sufficiently high degree gives its Grassmannian realization.
], table.cell(rowspan: 1, colspan: 1)[[8], Theorem 3.2, p. 260; Proposition 3.8, p. 265.
], table.cell(rowspan: 1, colspan: 1)[Countably many proper cycle parameter spaces and the analytic classifying map.
],
  table.cell(rowspan: 1, colspan: 1)[Flat morphisms of finite presentation with smooth fibers are smooth. In a proper flat family the smooth-fiber locus is open: remove the proper image of the closed nonsmooth locus. High powers of an ample line bundle on a projective variety are very ample and have vanishing higher cohomology. Riemann–Roch expresses their Euler characteristics by Chern classes.
], table.cell(rowspan: 1, colspan: 1)[[17], tags 01V4, 01V8, 01VU, 0B5U; [4], §18.3.
], table.cell(rowspan: 1, colspan: 1)[The smooth ambient Hilbert family, projective embeddings, and the fixed Hilbert polynomial.
],
  table.cell(rowspan: 1, colspan: 1)[If a Cartier equation is a nonzerodivisor on a closed subscheme $Z$ of dimension at most $k + 1$, its Cartier pullback takes $\[ Z \]_(k + 1)$ to the $k$-dimensional cycle of the cut, with scheme multiplicities.
], table.cell(rowspan: 1, colspan: 1)[[15], Lemma 42.29.5(1), tag 02TB; [4], Chapters 2 and 6.
], table.cell(rowspan: 1, colspan: 1)[Specialization of top cycles, including nonreduced and nonpure Hilbert fibers.
],
  table.cell(rowspan: 1, colspan: 1)[A proper holomorphic map has coherent higher direct images. For a coherent sheaf flat over a reduced base, fiber cohomology is upper semicontinuous; constant dimensions give local freeness and fiber base change. Coherent sheaves on Stein spaces have vanishing higher cohomology.
], table.cell(rowspan: 1, colspan: 1)[[7], §6, Hauptsatz I, p. 59; §7, Sätze 3 and 5, pp. 62, 64; §2, Satz 3, p. 17, with the 1963 correction.
], table.cell(rowspan: 1, colspan: 1)[Extension of polarizations, local relative projective embeddings, and holomorphic Grassmannian maps.
],
  table.cell(rowspan: 1, colspan: 1)[A proper smooth submersion is locally differentiably trivial. Proper holomorphic images of closed analytic sets are analytic. Irreducible components of a complex analytic set are closed and locally finite; in a second-countable space there are only countably many.
], table.cell(rowspan: 1, colspan: 1)[[11], Lemma 9.2, p. 77; [7], §7, Satz 1, p. 60; [3], Chapter II, Theorem 5.3, pp. 102–103.
], table.cell(rowspan: 1, colspan: 1)[Marked flat cohomology, proper-image avoidance, and transport to the chosen fiber.
],
  table.cell(rowspan: 1, colspan: 1)[Complex quasi-projective varieties admit projective resolutions. Closed analytic subvarieties of projective space and holomorphic maps between projective varieties are algebraic. Projective coherent cohomology agrees with analytic cohomology.
], table.cell(rowspan: 1, colspan: 1)[[9], Part I, Main Theorems I and I$""^(*)$; [14], Theorems 1–3, pp. 19–20, and Propositions 13–15, pp. 29–30.
], table.cell(rowspan: 1, colspan: 1)[Smooth cycle parameters and surfaces; algebraicity of the resulting fiber cycles and weight-one homomorphisms.
],
)
]

#heading(level: 1)[References]
#bibitem([1])[A. Borel, #emph[Linear Algebraic Groups], second edition, Graduate Texts in Mathematics 126, Springer, 1991. Corollary 1.4, Theorem 4.8, §7, and Proposition 14.2. #link("https://doi.org/10.1007/978-1-4612-0941-6").]
#bibitem([2])[P. Deligne, Hodge cycles on abelian varieties (notes by J.~S. Milne), in #emph[Hodge Cycles, Motives, and Shimura Varieties], Lecture Notes in Mathematics 900, Springer, 1982, pp.~9--100. Proposition 3.6; revised electronic text (2003), p.~27: #link("https://www.jmilne.org/math/Documents/Deligne82_2003.pdf").]
#bibitem([3])[J.-P. Demailly, #emph[Complex Analytic and Differential Geometry], online book, version of 21 June 2012. Chapter II, Theorems 5.3 and 8.8; Chapter VI, §9.2. #link("https://people.math.harvard.edu/~demarco/Math274/Demailly_ComplexAnalyticDiffGeom.pdf").]
#bibitem([4])[W. Fulton, #emph[Intersection Theory], second edition, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 2, Springer, 1998. Chapters 2 and 6; §§16.1, 18.3, 19.1--19.2. #link("https://doi.org/10.1007/978-1-4612-1700-8").]
#bibitem([5])[W. Fulton and J. Harris, #emph[Representation Theory: A First Course], Graduate Texts in Mathematics 129, Springer, 1991. Lectures 14, 18--20; in particular §19.4 and §§20.1--20.2. #link("https://doi.org/10.1007/978-1-4612-0979-9").]
#bibitem([6])[B. van Geemen, Kuga--Satake varieties and the Hodge conjecture, in #emph[The Arithmetic and Geometry of Algebraic Cycles] (Banff, 1998), NATO Science Series C 548, Kluwer, 2000, pp.~51--82. Propositions 5.9 and 6.3; preprint version: #link("https://arxiv.org/abs/math/9903146").]
#bibitem([7])[H. Grauert, Ein Theorem der analytischen Garbentheorie und die Modulräume komplexer Strukturen, #emph[Publ. Math. Inst. Hautes Études Sci.] #strong[5] (1960), 5--64; correction, #emph[ibid.] #strong[16] (1963), 35--36. #link("https://www.numdam.org/item/PMIHES_1960__5__5_0/")\; #link("https://www.numdam.org/item/PMIHES_1963__16__35_0/").]
#bibitem([8])[A. Grothendieck, Techniques de construction et théorèmes d'existence en géométrie algébrique IV: les schémas de Hilbert, #emph[Séminaire Bourbaki], exp.~221 (1960/61), collected edition, vol.~6, pp.~249--276. Theorem 3.2, p.~260; Proposition 3.8, p.~265. #link("https://www.numdam.org/item/SB_1960-1961__6__249_0/").]
#bibitem([9])[H. Hironaka, Resolution of singularities of an algebraic variety over a field of characteristic zero, I, II, #emph[Ann. of Math.] (2) #strong[79] (1964), 109--203, 205--326. Part I, Main Theorems I and I$""^(*)$, pp.~132--133. #link("https://doi.org/10.2307/1970486")\; #link("https://doi.org/10.2307/1970547").]
#bibitem([10])[D. Huybrechts, #emph[Lectures on K3 Surfaces], Cambridge Studies in Advanced Mathematics 158, Cambridge University Press, 2016. Chapter and result locators in this paper refer to the author's prepublication draft: #link("https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf").]
#bibitem([11])[I. Kolář, J. Slovák, and P.~W. Michor, #emph[Natural Operations in Differential Geometry], Springer, 1993, Lemma 9.2, p.~77. Corrected electronic edition: #link("https://www.mat.univie.ac.at/~michor/kmsbookh.pdf").]
#bibitem([12])[M. Kuga and I. Satake, Abelian varieties attached to polarized K3-surfaces, #emph[Math. Ann.] #strong[169] (1967), 239--242. #link("https://doi.org/10.1007/BF01399540").]
#bibitem([13])[J.~S. Milne, #emph[Introduction to Shimura Varieties], revised electronic version, 16 September 2017. Theorems 6.7--6.8 and Corollary 6.9, pp.~72--73. #link("https://www.jmilne.org/math/xnotes/svi.pdf").]
#bibitem([14])[J.-P. Serre, Géométrie algébrique et géométrie analytique, #emph[Ann. Inst. Fourier] #strong[6] (1956), 1--42. §12, Theorems 1--3, pp.~19--20; §19, Propositions 13--15, pp.~29--30. #link("https://doi.org/10.5802/aif.59").]
#bibitem([15])[The Stacks Project Authors, #emph[The Stacks Project], Lemma 42.29.5, tag 02TB (Cartier intersection and fundamental cycles). #link("https://stacks.math.columbia.edu/tag/02TB").]
#bibitem([16])[The Stacks Project Authors, #emph[The Stacks Project], §45.3, tag 0FFZ (correspondences), especially Lemma 45.3.1 and Lemma 45.3.6. #link("https://stacks.math.columbia.edu/tag/0FFZ").]
#bibitem([17])[The Stacks Project Authors, #emph[The Stacks Project], tags 01V4 and 01V8 (smoothness and the fiber criterion), 01VU (high powers of ample sheaves), and 0B5U (ampleness and cohomology). #link("https://stacks.math.columbia.edu/tag/01V4")\; #link("https://stacks.math.columbia.edu/tag/01V8")\; #link("https://stacks.math.columbia.edu/tag/01VU")\; #link("https://stacks.math.columbia.edu/tag/0B5U").]
#bibitem([18])[C. Voisin, #emph[Hodge Theory and Complex Algebraic Geometry I], translated by L. Schneps, Cambridge Studies in Advanced Mathematics 76, Cambridge University Press, 2002. §§6.1--6.3 and 7.1--7.3. #link("https://doi.org/10.1017/CBO9780511615344").]


