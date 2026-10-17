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

#align(center)[#text(size: 16pt, weight: "bold")[Modularity of elliptic curves over imaginary quadratic fields]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Let $K$ be an imaginary quadratic number field and let $E \/ K$ be an elliptic curve. The automorphy conjecture for $E$ asks for an automorphic representation of $"GL"_2 \( bb(A)_K \)$ whose local parameters realize the cohomology of $E$. At a place of good reduction this requires the Hecke polynomial to recover the point count of the reduced curve; at a bad place it requires the full local parameter, including its inertia and monodromy. At infinity the parameter is prescribed by the Hodge types $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$.

We prove this conjecture for every $K$ and $E$. We use unitary normalization on the automorphic side and the Tate-normalized local Langlands correspondence on the cohomological side. These conventions are recalled in Section 2.

#thm([Theorem 1.1.])[
  #emph[Let $K$ be an imaginary quadratic number field and $E \/ K$ an elliptic curve. There is an isobaric automorphic representation $pi_E$ of $"GL"_2 \( bb(A)_K \)$ with trivial central character and weight zero such that, for every prime $l$ and every isomorphism $iota : overline(bb(Q))_l arrow.r^tilde.op bb(C)$, 
$ r_iota \( pi_E \) tilde.eq H_(upright(acute(e) t))^1 \( E_(overline(K)) \, overline(bb(Q))_l \) . $

 At every finite place $v divides.not l$ one has 
$ iota "WD" #scale(x: 120%, y: 120%)[\(] H_(upright(acute(e) t))^1 \( E_(overline(K)) \, overline(bb(Q))_l \) \|_(G_(K_v)) #scale(x: 120%, y: 120%)[\)]^(upright(F upright("-") s s)) tilde.eq "rec"_(K_v) #scale(x: 120%, y: 120%)[\(] pi_(E \, v) ⊗ \| det \|_v^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $

 The unitary parameter at the complex place is $z mapsto "diag" \( z \/ \| z \| \, overline(z) \/ \| z \| \)$. In particular every local factor agrees, and 
$ L \( E \/ K \, s \) = L \( pi_E \, s - 1 \/ 2 \) . $

 If $E$ has no complex multiplication, $pi_E$ is cuspidal. In the CM case it is given by automorphic induction of a Hecke character, or by an isobaric sum when the CM field is already $K$.]
] <thm:main>

Here $r_iota$ in the CM isobaric case is the sum of the corresponding character realizations with the same Tate normalization.

=== 1.1 Historical context <historical-context>

The arithmetic groups associated with imaginary quadratic fields and their action on hyperbolic three-space originate in Bianchi’s work #cite(label("Bianchi")). Their presentations and cohomology were developed further by Swan and Harder #cite(label("Swan")) #cite(label("Harder")). The expected relationship with elliptic curves belongs to the Langlands program: in #cite(label("LanglandsProblems")) Section 7, Langlands explicitly discusses the automorphy of local representations attached to elliptic curves over global fields of characteristic zero. Grunewald–Helling–Mennicke, Cremona, and Cremona–Whitley developed substantial computations relating elliptic curves and automorphic forms over imaginary quadratic fields #cite(label("GHM")) #cite(label("Cremona")) #cite(label("CremonaWhitley")).

Over $bb(Q)$, Wiles and Taylor–Wiles proved modularity of semistable elliptic curves #cite(label("Wiles")) #cite(label("TaylorWiles")), and Breuil–Conrad–Diamond–Taylor proved modularity of every elliptic curve #cite(label("BCDT")). A central method is to lift automorphy from a residual Galois representation. Wiles’s $3$–$5$ switch also shows how an auxiliary elliptic curve, chosen with prescribed torsion and local behavior, can replace a residual representation that does not satisfy the initial lifting hypotheses.

For imaginary quadratic fields, the relevant cohomology occurs in more than one degree. The construction of Galois representations and the lifting problem both require additional work. Harris–Soudry–Taylor and Taylor constructed representations attached to Bianchi forms in important cases #cite(label("HST")) #cite(label("Taylor1994")). For conjugation-invariant central character, Berger–Harcos obtained Frobenius compatibility away from finitely many primes #cite(label("BergerHarcos")). Harris–Lan–Taylor–Thorne constructed Galois representations for general regular algebraic cuspidal representations over CM fields #cite(label("HLTT")), and Scholze treated torsion cohomology as well #cite(label("Scholze")). Calegari–Geraghty developed patching for cohomology in several degrees #cite(label("CalegariGeraghty")). The potential automorphy theorem of Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne implies potential modularity of every elliptic curve over a CM field #cite(label("ACC")) Theorem 1.0.1. Boxer–Calegari–Gee–Pilloni also proved potential modularity for genus-one curves over quadratic extensions of totally real fields #cite(label("BCGP")) Theorem 1.1.4. Potential modularity permits an extension of the ground field; automorphy over the original field is a further problem.

Allen–Khare–Thorne proved residual modularity results in small characteristics and deduced modularity for a positive proportion of elliptic curves over each CM field not containing a primitive fifth root of unity #cite(label("AKT")). Caraiani–Newton proved a lifting theorem allowing small coefficient primes and ramified CM fields, together with the local-global compatibility needed for its applications #cite(label("CN")). Their results give modularity under suitable residual-image hypotheses in characteristic $3$ or $5$, modularity for $100 %$ of Weierstrass equations, ordered by height, over each Galois CM field not containing $zeta_5$, and modularity of every elliptic curve over an imaginary quadratic field $K$ for which $X_0 \( 15 \) \( K \)$ has rank zero #cite(label("CN")) Theorem 6.1 and Corollaries 6.1.2 and 7.1.2. Theorem 1 removes the remaining restrictions on the curve and the imaginary quadratic field. Caraiani–Newton’s lifting theorem and residual-image criterion for modularity of elliptic curves remain essential inputs.

=== 1.2 The geometric prime switch <the-geometric-prime-switch>

The difficulty is to reach a residual representation to which the known modularity theorem applies while retaining control at the primes where automorphy will be lifted. We construct the intermediate representations as character pieces of a single family of Jacobians.

Fix a non-CM elliptic curve $E \/ K$. Choose a sufficiently large prime $p$ for which the image on $E \[ p \]$ contains $"SL"_2 \( bb(F)_p \)$, and put $n = 3 p$ and $F = K \( mu_n \)$. For $t$ in a nonempty affine open over $K$, we construct a genus-$n$ cyclic cover $C_n \( t \)$ of a quadratic twist $B_t$ of $E$. It is branched at two points and admits an involution that inverts the rotations. For a character $theta$ of the rotation group $mu_n$, write

$ V_theta = H^1 \( C_n \( t \) \)_theta . $

Each $V_theta$ is a rank-two compatible system with determinant $epsilon.alt_l^(- 1)$, where $epsilon.alt_l$ is the $l$-adic cyclotomic character, and labeled Hodge–Tate weights $0 \, 1$.

Choose characters $eta$ and $psi$ of orders $3$ and $p$, respectively, and set $chi = eta psi$. The order-three system $V_eta$ comes from an elliptic curve $A \/ F$, while $V_1 = H^1 \( B_t \)$. An integral description of the cohomology gives the chain

#[#set math.equation(numbering: n => "(1.1)")
 $ underbrace(V_eta, H^1 \( A \)) med equiv #h(-0.16667em) #h(-0.16667em) med \( mod med p \) med med V_chi med equiv #h(-0.16667em) #h(-0.16667em) med \( mod med 3 \) med med V_psi med equiv #h(-0.16667em) #h(-0.16667em) med \( mod med p \) med med underbrace(V_1, H^1 \( B_t \)) . $ <intro:chain>]

Each congruence means equality of the semisimplified residual Galois representations. The order-$p$ part of a character disappears modulo $p$, and the order-$3$ part disappears modulo $3$. Automorphy will pass from left to right. The prime $5$ is used only to prove the initial modularity of $A$.

There are two useful degenerations of the covers. At one, the Jacobian has compact-type limit $E^n$. This yields a free integral group-ring description of its cohomology and lets us impose the local reduction behavior of all the character pieces at once. At the other, explicit vanishing cycles give opposite unipotent elements on each nontrivial rank-two piece. The latter supply absolute irreducibility and suitable Frobenius elements in residual characteristic $3$, $5$, or $p$. The two degeneration pictures are given in Section 3, and the vanishing-cycle calculation in Section 4.

Two specialization arguments complete the construction. First, finite torsion is locally constant in a family over a local field. Once semistability is secured, the full Frobenius polynomials belong to a finite set. Sufficiently deep torsion comparison with the fiber $E^n$ therefore preserves its toric rank and, in the good-reduction case, its Newton slopes. This provides simultaneous local conditions for every character piece. Second, Hilbert irreducibility is applied to the restriction of scalars of the parameter line from $K$ to $bb(Q)$. The two conjugate families then occur in one finite monodromy quotient. This ensures the required residual genericity at every place above a rational split prime, while retaining the prescribed local conditions on $t$.

The construction has close antecedents. Cyclic covers of elliptic curves with two branch points and dihedral symmetry occur in the real-multiplication constructions of Tautz–Top–Verberkmoes and in Ellenberg’s treatment of Jacobian endomorphism algebras #cite(label("TTV")) #cite(label("Ellenberg")); Mestre’s constructions form part of the same geometric tradition #cite(label("Mestre")). Darmon developed congruences that remove prime-power parts of monodromy and a conditional modularity argument based on successive lifts for rigid local systems #cite(label("Darmon1999")) #cite(label("Darmon2000")). The coefficient $2 - zeta - zeta^(- 1)$ in our monodromy calculation also appears in the rank-two monodromy studied by Darmon–Mestre #cite(label("DarmonMestre")). Taylor’s use of auxiliary abelian varieties with real multiplication is another higher-dimensional form of prime switching #cite(label("Taylor2002")).

The feature developed here is the combination for a #emph[prescribed] elliptic curve: the character orders $1 \, p \, 3 p \, 3$ occur in one integral cohomology lattice, an elliptic curve occurs at each end of the chain, and the compact-type degeneration and simultaneous residual specialization make every step applicable to the CM-field lifting theorem. The local constancy argument and the two-conjugate specialization argument are formulated separately, so they can be used independently of the final automorphy application.

Sections 3 and 4 establish the cover geometry and integral monodromy. Section 5 constructs the rank-two systems and their congruences. Section 6 states the automorphy inputs at the point where their hypotheses become concrete conditions on those systems. Sections 7 and 8 find one parameter satisfying those conditions. Section 9 performs the three lifts, descends from $F$ to $K$, and completes the local comparisons and the CM case.

== 2 Galois and automorphic conventions <sec:conventions>

We use the cohomological realization

$ H^1 \( X \) = H_(upright(acute(e) t))^1 \( X_(overline(L)) \, bb(Q)_l \) $

for a smooth proper variety over a number field $L$; coefficient extensions will always be indicated or understood. We write $G_L = "Gal" \( overline(L) \/ L \)$. The cyclotomic character $epsilon.alt_l$ has Hodge–Tate weight $- 1$ in our convention. Thus an elliptic curve has labeled Hodge–Tate weights $0 \, 1$, and its $H^1$ has determinant $epsilon.alt_l^(- 1)$. The bar on a characteristic-zero representation denotes the semisimplification of the reduction of a stable lattice. This semisimplification is independent of the lattice.

For a regular algebraic cuspidal representation $pi$ of $"GL"_2 \( bb(A)_L \)$ over a CM field, let $r_iota \( pi \)$ denote the associated semisimple $l$-adic representation, where $iota : overline(bb(Q))_l arrow.r^tilde.op bb(C)$. We use the normalization of #cite(label("HLTT")) #cite(label("Scholze")) #cite(label("CN")): the local comparison is with

#[#set math.equation(numbering: n => "(2.1)")
 $ "rec"_(L_v)^T \( pi_v \) := "rec"_(L_v) #scale(x: 120%, y: 120%)[\(] pi_v ⊗ \| det \|_v^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] . $ <eq:tate-normalization>]

Here the reciprocity convention uses geometric Frobenius. The algebraic weight corresponding to trivial coefficients is called #emph[weight zero]. At a complex place the generic weight-zero parameter, in unitary normalization, is

#[#set math.equation(numbering: n => "(2.2)")
 $ z mapsto mat(delim: "(", z \/ \| z \|, 0; 0, overline(z) \/ \| z \|) \, #h(2em) \| z \| = \( z overline(z) \)^(1 \/ 2) . $ <eq:infinity-parameter>]

The corresponding Tate-normalized parameter has Hodge types $\( 1 \, 0 \)$ and $\( 0 \, 1 \)$. In particular, if the Tate-normalized finite parameters realize an elliptic curve $E$, then

#[#set math.equation(numbering: n => "(2.3)")
 $ L \( E \/ L \, s \) = L \( pi \, s - 1 \/ 2 \) . $ <eq:L-shift>]

All geometric cover constructions below are made in characteristic zero. For a local field, a representation is #emph[potentially crystalline] if it becomes crystalline after a finite extension. A two-dimensional representation is #emph[potentially ordinary of weight zero] if, after a finite extension, it admits an invariant line with unramified character and its quotient is $epsilon.alt_l^(- 1)$ times an unramified character. This is the Hodge–Tate ordering $0 \, 1$ in the lifting theorem. Local fields used to check these properties may be enlarged independently at different places.

== 3 Cyclic covers and two degenerations <sec:geometry>

We construct a family of cyclic covers of quadratic twists of a fixed elliptic curve. Two boundary fibers explain the features needed later. At the first, the Jacobian becomes a product of copies of the original elliptic curve; at the second, the cover acquires nodes whose vanishing cycles will give explicit monodromy operators. All degenerations in this section take place over a parameter curve in characteristic zero.

=== 3.1 The family and its dihedral action <the-family-and-its-dihedral-action>

Let $k$ be a number field, let $E \/ k$ be an elliptic curve, and fix an odd integer $n gt.eq 3$. Write

$ E : quad y^2 = h \( x \) \, $

where $h in k \[ x \]$ is a separable cubic and the point at infinity is the origin $O$. For $t$ with $h \( t \) eq.not 0$, put

#[#set math.equation(numbering: n => "(3.1)")
 $ B_t : quad h \( t \) y^2 = h \( x \) \, #h(2em) R_t = \( t \, 1 \) \, #h(2em) S_t = \[ n \] R_t . $ <geo:twist>]

Let $U subset bb(A)_k^1$ be the open set on which $O \, R_t \, - R_t \, S_t \, - S_t$ are pairwise distinct. This is a nonempty open set: after the double cover $t = x \( R \)$ parametrized by $R in E$, the map

$ B_(x \( R \)) arrow.r E \, #h(2em) \( x \, y \) mapsto \( x \, y \( R \) y \) $

identifies $R_t$ with the moving point $R$. Each excluded equality then imposes a torsion condition on $R$, so excludes only finitely many points. We may remove further finitely many points from $U$ when necessary.

#thm([Lemma 3.1.])[
  #emph[For each divisor $m > 1$ of $n$, there is a smooth proper family of geometrically connected genus-$m$ curves $cal(C)_m arrow.r U$. It is the normalization of the smooth proper elliptic family $B arrow.r U$ in the function-field extension, written fiberwise as 
#[#set math.equation(numbering: n => "(3.2)")
 $ Y^m = f_t \( Z \) \, #h(2em) "div" \( f_t \) = \( S_t \) - \( - S_t \) - n \( R_t \) + n \( - R_t \) \, #h(2em) f_t \( O \) = 1 . $ <geo:kummer>]

 The family has an involution 
#[#set math.equation(numbering: n => "(3.3)")
 $ w : \( Z \, Y \) mapsto \( - Z \, Y^(- 1) \) . $ <geo:reflection>]

 Over a field containing $mu_m$, rotations $u_zeta : \( Z \, Y \) mapsto \( Z \, zeta Y \)$ are defined and satisfy $w u_zeta w = u_(zeta^(- 1))$. If $d divides m$, the map $Y mapsto Y^(m \/ d)$ gives the quotient $C_(m \, t) arrow.r C_(d \, t)$; for $d = 1$ the quotient is $B_t$.]
] <geo:family>

#proof[
  On an elliptic curve, a degree-zero divisor is principal precisely when its sum in the elliptic-curve group is $O$. The divisor in (3.2) has sum
  $ S_t - \( - S_t \) - n R_t + n \( - R_t \) = 2 S_t - 2 n R_t = O . $
  It therefore determines a rational function, uniquely after imposing $f_t \( O \) = 1$. Applying this argument over $k \( U \)$ and spreading out gives a rational function on the family. Its divisor changes sign under $Z mapsto - Z$, and its normalization at $O$ consequently gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ f_t \( - Z \) = f_t \( Z \)^(- 1) . $ <geo:inverse>]
  This also shows that the function has no vertical divisor: every fiber component of the smooth elliptic family is preserved by inversion, so its valuation is its own negative. Thus the prescribed disjoint sections are the entire divisor on $U$.
  The valuation at $S_t$ is $1$, so the Kummer extension has degree $m$ even geometrically. It is totally ramified at $S_t$ and $- S_t$ and unramified elsewhere, since the remaining nonzero valuations are $plus.minus n$, divisible by $m$. Riemann–Hurwitz gives $2 g \( C_(m \, t) \) - 2 = 2 \( m - 1 \)$. The same local description proves that the normalization is smooth over $U$. Indeed, a zero or pole of order divisible by $m$ can be removed from the Kummer equation; at a section of order $1$ or $- 1$, after taking a root of a unit #emph[étale] locally, the equation is the $m$th-root cover of a parameter transverse to that section. Normalization is finite here, so the resulting smooth family is proper. Equation (3.4) gives the involution, and the remaining assertions follow from the Kummer equations. ◻
]

We will study the pullback of this family to the open set of $E$ on which $R$ is a moving point and $O \, plus.minus R \, plus.minus \[ n \] R$ are distinct. There the base elliptic curve is the constant curve $E$. We write $C_(m \, R)$ for the fiber and $f_R$ for its normalized function. The normalization at $O$ ensures that the pullback identification is exact: it introduces no scalar twist into the equation $Y^m = f_R$.

=== 3.2 Separating colliding sections <separating-colliding-sections>

The two boundary points we use are

#[#set math.equation(numbering: n => "(3.5)")
 $ R = O \, #h(2em) upright("and") #h(2em) R = R_(*) \, quad \[ n \] R_(*) in E \[ 2 \] \\ { O } \, quad O \, plus.minus R_(*) \, \[ n \] R_(*) med upright("distinct") . $ <geo:boundary-points>]

The second point may be considered after extending the ground field; we will ultimately use it over $bb(C)$.

#thm([Lemma 3.2.])[
  #emph[In the constant-$E$ family, blow up the surface at the collision point over either boundary parameter in (3.5), and normalize the resulting surface in $Y^m = f_R$. This gives a regular semistable model near that parameter. Its special fiber has $m$ geometric nodes lying over the node of the blown-up elliptic surface. Each node has smoothing parameter of order one in a parameter on the base. The component above the exceptional projective line is a geometrically connected rational curve.]
] <geo:semistable-models>

#proof[
  At $R = O$, choose parameters $r$ on the parameter curve and $z$ on the constant elliptic curve, both at $O$, with the same tangent coordinate. The sections $R \, - R \, \[ n \] R \, - \[ n \] R$ have first-order equations $z = r \, - r \, n r \, - n r$. Their strict transforms meet the exceptional line at four distinct points with coordinates $1 \, - 1 \, n \, - n$; the node joining this line to the main component has coordinate $oo$. At the second boundary parameter, only the sections $\[ n \] R$ and $- \[ n \] R$ collide. Their tangent slopes are distinct, so one blowup again separates them from each other and from the node.
  The involution $Z mapsto - Z$ preserves both components of each blown-up fiber. Equation (3.4) therefore forces the valuation of $f_R$ on each component to be zero. None of its horizontal divisor sections passes through the node. Since the surface is regular, $f_R$ is consequently a unit at that node. Taking its $m$th root is étale there. The node downstairs has local smoothing equation $x y = b$, with $b$ a parameter on the base. Over an algebraic closure, its $m$ lifts have the same local equation. In particular, the smoothing parameter is $b$, rather than a higher power of $b$.
  At the separated sections the normalization has the smooth local description used in Lemma 2. This proves regularity of the total space and semistability of the family. On the exceptional line, only the two sections of multiplicities $1$ and $- 1$ cause ramification. The cyclic cover is connected, is totally ramified at these two points, and has genus zero by Riemann–Hurwitz. ◻
]

#thm([Proposition 3.3.])[
  #emph[Suppose that $k$ contains $mu_m$. At $R = O$, the special fiber of the model in Lemma 3 is a rational curve joined at distinct points to $m$ copies of $E$, all defined over $k$. Rotations cyclically permute the elliptic components. The Jacobian family of $C_(m \, R)$ therefore extends to an abelian scheme on a Zariski neighborhood of $O$ in the parameter curve, with fiber $E^m$ at $O$.]
] <geo:compact-type>

#proof[
  Let $v = z \/ r$ be the coordinate on the exceptional line. Its normalized function is
  #[#set math.equation(numbering: n => "(3.6)")
   $ f_(upright("exc")) \( v \) = frac(v - n, v + n) (frac(v + 1, v - 1))^n . $ <geo:exceptional-function>]
  Indeed, the divisor gives this expression up to a scalar. The section $Z = O$ meets the exceptional line at $v = 0$, where the function is a unit with value $1$. Since $n$ is odd, the displayed expression also has value $1$ at $0$, so the scalar is $1$.
  The restriction of $f_R$ to the main elliptic component has no divisor, and is therefore constant. At its node with the exceptional component this constant is $f_(upright("exc")) \( oo \) = 1$. The cover of the main component is consequently the disjoint union of the $m$ copies of $E$ given by $Y in mu_m$. On the exceptional line the substitution
  $ Y' = Y (frac(v - 1, v + 1))^(n \/ m) $
  gives $Y' ""^m = \( v - n \) \/ \( v + n \)$. Its $m$ points over $v = oo$ are defined over $k$ and attach to the $m$ elliptic components, one each.
  The dual graph is a tree, as illustrated in Figure 1. Thus the fiber is of compact type: its identity-component Picard variety is the product of the Jacobians of its components, namely $E^m$. The marked point $\( O \, 1 \)$ extends to a section through the smooth locus. The relative Picard theorem for a family of nodal curves of compact type then makes the Jacobian family an abelian scheme across this fiber. More precisely, the relative identity-component Picard scheme is semi-abelian, and its torus vanishes when the dual graph is a tree; see #cite(label("BLR")) Section 9.4, Theorem 1, and Section 9.2, Proposition 10. Shrinking the parameter neighborhood removes the other singular fibers and gives the asserted extension. ◻
]

#prodef([Remark 3.4.])[
  Proposition 4 concerns an abelian scheme over an open subset of the characteristic-zero parameter curve $E_k$. After passing to a completion of $k$, it remains a family over that local field. No assertion about extending the Kummer cover over a ring of integers, particularly in residue characteristic dividing $m$, is needed here. The arithmetic reduction types of nearby Jacobians will be established separately.
] <geo:characteristic-zero>

=== 3.3 The second fiber and its nodes <the-second-fiber-and-its-nodes>

For the monodromy computation, choose an oriented period basis $a \, b$ of $E \( bb(C) \)$ and take $R_(*) = a \/ \( 2 n \)$. The next explicit equation records why a simple loop around $R_(*)$ contributes one twist at each node.

#thm([Lemma 3.5.])[
  #emph[For $R_(*) = a \/ \( 2 n \)$, the special fiber in Lemma 3 consists of a connected unramified degree-$m$ cover $E' arrow.r E$ and a rational component, joined at $m$ distinct nodes. In analytic coordinates near each node, the family has equation $X U = - 2 n t$, where $t = R - R_(*)$ is an additive local parameter.]
] <geo:collision>

#proof[
  Write $Q = a \/ 2 = \[ n \] R_(*)$ and use additive analytic coordinates $t = R - R_(*)$ and $z = Z - Q$. The colliding sections have equations $z = n t$ and $z = - n t$, while the other divisor sections avoid this neighborhood. Thus
  $ f_R = g \( z \, t \) frac(z - n t, z + n t) $
  with $g$ a holomorphic unit. Choose a local $m$th root of $g$ and put $V = Y \/ g^(1 \/ m)$. The Kummer equation becomes
  #[#set math.equation(numbering: n => "(3.7)")
   $ \( z + n t \) \( V^m - 1 \) = - 2 n t . $ <geo:node-equation>]
  For each $V = zeta$, $zeta in mu_m$, the function $U = V^m - 1$ is a local coordinate. Taking $X = z + n t$ gives the asserted node equation. It is the local chart of the normalization of the blowup from Lemma 3; the exceptional component has $X = 0$, and the main component has $U = 0$. In particular, the nonzero constant $2 n$ changes no vanishing order.
  On the main component, the divisor of the limiting function is $n \( - R_(*) \) - n \( R_(*) \)$. The associated unramified Kummer cover is determined by the $m$-torsion divisor class
  $ n / m #scale(x: 120%, y: 120%)[\(] \( - R_(*) \) - \( R_(*) \) #scale(x: 120%, y: 120%)[\)] quad arrow.l.r quad - frac(2 n, m) R_(*) = - a / m quad upright("in ") E \( bb(C) \) . $
  This class has exact order $m$, so that cover is connected. It is unramified of degree $m$ over an elliptic curve and hence is itself an elliptic curve $E'$. The exceptional cover is rational by Lemma 3, and its $m$ attachments are the nodes just computed. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2.5, 3.65), [#text(size: 9pt)[\(a\) $R=O$]])
  content((9.25, 3.65), [#text(size: 9pt)[\(b\) $R_*=a"/"(2n)$]])
  line((2.5, 1.8), (0.5, 2.85), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((2.5, 1.8), (0.5, 0.65), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((2.5, 1.8), (4.5, 0.65), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((2.5, 1.8), (3.8, 2.52), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10, dash: "densely-dotted"))
  content((4.22, 2.8), [#text(size: 9pt)[$dots.h$]])
  content((2.182, 1.482), (2.818, 2.118), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$bb(P)^1$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.1818, 2.532), (0.8182, 3.168), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_0$]]], frame: "circle", fill: rgb("#f5f5ff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((0.1818, 0.3318), (0.8182, 0.9682), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_1$]]], frame: "circle", fill: rgb("#f5f5ff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((4.182, 0.3318), (4.818, 0.9682), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E_(m-1)$]]], frame: "circle", fill: rgb("#f5f5ff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((2.5, -0.15), [#text(size: 9pt)[$m$ elliptic leaves#linebreak() $b_1( Gamma )=0$]])
  bezier((7.35, 1.8), (11.15, 1.8), (8.3, 3.15), (10.2, 3.15), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  line((7.35, 1.8), (11.15, 1.8), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  bezier((7.35, 1.8), (11.15, 1.8), (8.3, 0.35), (10.2, 0.35), stroke: (paint: rgb("#404040"), thickness: 0.65pt, miter-limit: 10))
  content((9.25, 1.33), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$dots.v$]]])])
  content((6.996, 1.446), (7.704, 2.154), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$E'$]]], frame: "circle", fill: rgb("#f5f5ff"), stroke: (paint: rgb("#00008c"), thickness: 0.4pt, miter-limit: 10))
  content((10.83, 1.482), (11.47, 2.118), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$bb(P)^1$]]], frame: "circle", fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((9.25, 3.02), [#text(size: 9pt)[$m$ edges]])
  content((9.25, -0.15), [#text(size: 9pt)[$g(E')=1$#linebreak() $b_1( Gamma )=m-1$]])
})],
  caption: [Figure 1: The dual graphs of the two special fibers. Vertex labels indicate component genera and identify the elliptic components; edges are nodes. At $R = O$ the graph is a star with $m$ elliptic leaves, so the Jacobian is $E^m$. At $R = a \/ \( 2 n \)$ two components meet in $m$ nodes, giving graph Betti number $m - 1$. The drawings are schematic for general odd $m$. ],
) <geo:dual-graphs>

The first degeneration has now supplied a split product fiber and a neighborhood in which its homology can be compared with nearby smooth fibers. The second has supplied $m$ nodes, each with smoothing order one. We next identify their vanishing cycles in a single integral basis.

== 4 Integral homology and explicit monodromy <sec:monodromy>

Fix the complex elliptic curve $E$ and the constant-$E$ family from Section 3. Let $n gt.eq 3$ be odd and let $m > 1$ divide $n$. We write

$ Gamma_m = mu_m \, #h(2em) u : \( Z \, Y \) mapsto \( Z \, e^(2 pi i \/ m) Y \) \, $

so that $u$ is the chosen generator of the deck group. Throughout this section $bb(Z) \[ Gamma_m \]$ denotes the #emph[group ring], not the cyclotomic integer ring. We first construct an integral basis permuted by $u$, and then compute two monodromy operators in that same basis. Their reduction on character spaces will supply the residual irreducibility used later.

=== 4.1 A basis obtained by cutting the torus <a-basis-obtained-by-cutting-the-torus>

Choose an oriented period basis $a \, b$ and identify the underlying oriented torus with $\( bb(R) \/ bb(Z) \)^2$, with $a$ horizontal and $b$ vertical. Consider the path of parameters

#[#set math.equation(numbering: n => "(4.1)")
 $ R_s = s / n a \, #h(2em) 0 < s < 1 / 2 . $ <mon:horizontal-path>]

Its branch points are $- s a$ and $s a$. Let $I_s$ be the horizontal arc from $- s a$ to $s a$ through $O$.

#thm([Lemma 4.1.])[
  #emph[For the parameters in (4.1), the cover $C_(m \, R_s) arrow.r E$ is trivial over $E \\ I_s$. It is obtained by cutting $m$ copies of $E$ along $I_s$ and joining adjacent banks cyclically. Crossing the slit changes the sheet index by $1$ or $- 1$, according to the orientation of crossing and the initial choice of indexing.]
] <mon:slit>

#proof[
  For small $s$, enclose the colliding sections in a small disk about $O$. The model at $R = O$ restricts outside that disk to $m$ disjoint copies of its complement, by Proposition 4. If $D$ is such a disk, the inclusion $E \\ "int" \( D \) arrow.r.hook E \\ I_s$ is a homotopy equivalence. The unramified cover of $E \\ I_s$ is therefore trivial. As $s$ varies in $\( 0 \, 1 \/ 2 \)$, the arcs $I_s$ move by isotopy, and the topological isomorphism class of this unramified cover remains constant. The monodromy around either branch point is a generator of $Gamma_m$, since its valuation in $f_R$ is $1$ or $- 1$. This gives the stated gluing. ◻
]

On each sheet let $a_i$ be the horizontal loop at vertical coordinate $1 \/ 2$ and let $b_i$ be the vertical loop at horizontal coordinate $1 \/ 2$, for $i in bb(Z) \/ m bb(Z)$. These loops avoid the slit, intersect at one point on their common sheet, and may be oriented so that

#[#set math.equation(numbering: n => "(4.2)")
 $ chevron.l a_i \, b_j chevron.r = delta_(i j) \, #h(2em) chevron.l a_i \, a_j chevron.r = chevron.l b_i \, b_j chevron.r = 0 . $ <mon:intersection>]

Index the sheets so that $u$ sends $a_i \, b_i$ to $a_(i + 1) \, b_(i + 1)$.

#thm([Proposition 4.2.])[
  #emph[The cycles $a_i \, b_i$ form an integral symplectic basis of $H_1 \( C_(m \, R_s) \, bb(Z) \)$. Consequently, for every smooth fiber of the family, 
#[#set math.equation(numbering: n => "(4.3)")
 $ H_1 \( C_m \, bb(Z) \) tilde.eq bb(Z) \[ Gamma_m \]^2 \, #h(2em) H^1 \( C_m \, bb(Z) \) tilde.eq bb(Z) \[ Gamma_m \]^2 . $ <mon:free-lattices>]

 In particular, after comparison, $H_(upright("et"))^1 \( C_m \, bb(Z)_ell \)$ is free of rank two over $bb(Z)_ell \[ Gamma_m \]$ for every prime $ell$, including $ell divides m$.]
] <mon:integral-module>

#proof[
  The genus is $m$, so $H_1$ has rank $2 m$. Equation (4.2) shows that the $2 m$ displayed classes are linearly independent and span a sublattice with unimodular intersection pairing. If its index in $H_1$ were $d$, its intersection determinant would be $d^2$ times the determinant on $H_1$. Both determinants are $1$, so $d = 1$. The deck action now gives the first isomorphism in (4.3).
  The dual of the regular integral module is again regular: explicitly, the coefficient-of-identity pairing
  $ bb(Z) \[ Gamma_m \] times bb(Z) \[ Gamma_m \] arrow.r bb(Z) \, #h(2em) \( x \, y \) mapsto \[ 1 \] \( x y \) $
  is perfect. With the pullback action on the dual, it identifies $"Hom"_(bb(Z)) \( bb(Z) \[ Gamma_m \] \, bb(Z) \)$ with $bb(Z) \[ Gamma_m \]$. This proves the cohomological assertion without dividing by $m$. Topological local triviality transports the result through the connected smooth parameter open, and comparison gives the étale assertion. ◻
]

#prodef([Remark 4.3.])[
  The compact-type degeneration gives another explanation of the integral statement. Its Jacobian extends to an abelian scheme with special fiber $E^m$, and $Gamma_m$ permutes the factors regularly. The integral homology of this fiber is the regular module twice. The slit construction makes this description concrete by identifying cycles that can also be followed towards the other degeneration.
]

=== 4.2 Vanishing cycles and a common monodromy basis <vanishing-cycles-and-a-common-monodromy-basis>

Let $s$ approach $1 \/ 2$ in (4.1). The branch points meet at $a \/ 2$, while the slit fills all but a shrinking gap in the horizontal circle. Choose a small disk about $a \/ 2$ containing both branch points, with radius larger than their distance from the collision point. Its boundary has $m$ closed lifts $delta_i$. They are the neck circles at the $m$ nodes of Lemma 6; hence they are the vanishing cycles.

#thm([Lemma 4.4.])[
  #emph[After a cyclic indexing of the lifts, their homology classes are 
#[#set math.equation(numbering: n => "(4.4)")
 $ \[ delta_i \] = plus.minus \( a_i - a_(i + 1) \) \, #h(2em) i in bb(Z) \/ m bb(Z) \, $ <mon:delta>]

 or the same formula with $i - 1$ in place of $i + 1$.]
] <mon:vanishing-classes>

#proof[
  Arrange the boundary of the disk to cross the slit transversely twice. A lifted boundary circle has its upper arc on one sheet and its lower arc on an adjacent sheet. Index the upper sheet by $i$; the lower one is $i + 1$ or $i - 1$, by Lemma 7. The circle is disjoint from every $a_j$. It crosses the two corresponding vertical loops once each, with opposite intersection signs, and no other $b_j$. These intersections determine its class in the integral symplectic basis of Proposition 8, giving (4.4). See Figure 2. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2, 4.65), [#text(size: 9pt)[\(a\) Slit in the base torus]])
  content((9, 4.65), [#text(size: 9pt)[\(b\) A lifted boundary circle]])
  rect((0, 0), (4, 4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10))
  line((0.55, 0), (1, 0), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  line((0.55, 4), (1, 4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  line((0, 2), (0, 2.4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  line((4, 2), (4, 2.4), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  line((0, 2.1), (0, 2.5), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  line((4, 2.1), (4, 2.5), stroke: (paint: rgb("#8c8c8c"), thickness: 0.5pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#8c8c8c"))))
  content((0, 0), [#text(size: 9pt)[$0$]], anchor: "north", padding: 0.05292cm)
  content((4, 0), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.05292cm)
  content((2, -0.32), [#text(size: 9pt)[horizontal coordinate $x$]], anchor: "north", padding: 0.05292cm)
  line((0, 3), (4, 3), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((0.8, 3), (1.2, 3), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#000099"))))
  content((3.35, 3), [#text(size: 9pt)[$a$]], anchor: "south", padding: 0.05292cm)
  line((2, 0), (2, 4), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  line((2, 3.45), (2, 3.8), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#000099"))))
  content((2, 3.65), [#text(size: 9pt)[$b$]], anchor: "west", padding: 0.05292cm)
  line((0, 1), (1.52, 1), stroke: (paint: rgb("#404040"), thickness: 1.7pt, miter-limit: 10))
  line((2.48, 1), (4, 1), stroke: (paint: rgb("#404040"), thickness: 1.7pt, miter-limit: 10))
  circle((1.52, 1), radius: 0.05997, fill: black, stroke: none)
  circle((2.48, 1), radius: 0.05997, fill: black, stroke: none)
  content((0, 1), [#text(size: 9pt)[$O$]], anchor: "east", padding: 0.05292cm)
  content((0.65, 1), [#text(size: 9pt)[slit]], anchor: "south", padding: 0.05292cm)
  circle((2, 1), radius: 0.72, stroke: (paint: rgb("#666666"), thickness: 0.55pt, miter-limit: 10, dash: "densely-dashed"))
  content((1.52, 1), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$+s$]]])], anchor: "north-east")
  content((2.48, 1), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$-s$]]])], anchor: "north-west")
  content((2.6, 1.58), [#text(size: 8pt)[$partial D$]], anchor: "south-west", padding: 0.05292cm)
  content((2, 1.15), [#text(size: 8pt)[$a"/"2$]], anchor: "west", padding: 0.05292cm)
  line((6.9, 2), (8.58, 2), stroke: (paint: rgb("#404040"), thickness: 1.7pt, miter-limit: 10))
  line((9.42, 2), (11.1, 2), stroke: (paint: rgb("#404040"), thickness: 1.7pt, miter-limit: 10))
  circle((8.58, 2), radius: 0.05997, fill: black, stroke: none)
  circle((9.42, 2), radius: 0.05997, fill: black, stroke: none)
  content((8.58, 2), [#text(size: 9pt)[$+s$]], anchor: "north", padding: 0.05292cm)
  content((9.42, 2), [#text(size: 9pt)[$-s$]], anchor: "north", padding: 0.05292cm)
  arc((7.55, 2), start: 180deg, stop: 0deg, radius: 1.45, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  arc((10.45, 2), start: 0deg, stop: -180deg, radius: 1.45, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  arc((8.168, 3.188), start: 125deg, stop: 105deg, radius: 1.45, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#000099"))))
  arc((10.11, 1.068), start: -40deg, stop: -60deg, radius: 1.45, stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#000099"))))
  content((8.15, 3.2), [#text(size: 9pt)[sheet $i$]], anchor: "south-east", padding: 0.05292cm)
  content((8.15, 0.82), [#text(size: 9pt)[sheet $i+1$]], anchor: "north-east", padding: 0.05292cm)
  content((10.45, 2.7), [#text(size: 9pt)[$delta_i$]], anchor: "west", padding: 0.05292cm)
  line((9, 2.78), (9, 4.03), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#4d4d4d"))))
  line((9, -0.05), (9, 1.22), stroke: (paint: rgb("#4d4d4d"), thickness: 0.65pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.15cm, width: 0.11cm, fill: rgb("#4d4d4d"))))
  content((9, 3.9), [#text(size: 9pt)[$b_i$]], anchor: "west", padding: 0.05292cm)
  content((9, 0.12), [#text(size: 9pt)[$b_(i+1)$]], anchor: "west", padding: 0.05292cm)
  content((8.96, 3.48), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$+$]]])], anchor: "east")
  content((8.96, 0.5), [#box(inset: 0.03528cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$-$]]])], anchor: "east")
  content((9, -0.65), [#text(size: 9pt)[$[ delta_i]=a_i-a_(i+1)$]])
})],
  caption: [Figure 2: The horizontal slit leaves a gap about the collision point $a \/ 2$. A small circle about that gap crosses the slit twice. Its lift has one arc on sheet $i$ and the other on sheet $i + 1$; its two intersections with the lifted vertical cycles have opposite signs. This identifies the vanishing class as $plus.minus \( a_i - a_(i + 1) \)$. Opposite edges of the torus rectangle are identified; its coordinates range over $\[ 0 \, 1 \] times \[ - 1 \/ 4 \, 3 \/ 4 \]$, so $- s$ is plotted at $1 - s$. In the right panel, solid and dashed arcs distinguish the two sheets. ],
) <mon:slit-figure>

#thm([Theorem 4.5.])[
  #emph[In one integral basis $a_i \, b_i$ as above, the geometric monodromy of the constant-$E$ family contains operators $T_a \, T_b$ satisfying 
#[#set math.equation(numbering: n => "(4.5)")
 $ T_a \( a_j \) & = a_j \, & T_a \( b_j \) & = b_j + sigma_a \( 2 a_j - a_(j - 1) - a_(j + 1) \) \,\
T_b \( b_j \) & = b_j \, & T_b \( a_j \) & = a_j + sigma_b \( 2 b_j - b_(j - 1) - b_(j + 1) \) \, $ <mon:Ta>]

 where $sigma_a \, sigma_b in { 1 \, - 1 }$ are independent of $j$. Equivalently, their two off-diagonal entries, in the basis of the free $bb(Z) \[ Gamma_m \]$-module, are $sigma_a \( 2 - u - u^(- 1) \)$ and $sigma_b \( 2 - u - u^(- 1) \)$. The geometric monodromy of the family over $U$ contains these actions as well, under the pullback identification.]
] <mon:transvections>

#proof[
  The Picard–Lefschetz formula for a positively oriented loop about a semistable fiber is the product of the Dehn twists at its nodes; see #cite(label("SGA7II")) Exposé XV. In the present family, every node has smoothing order one by (3.7), so every twist has exponent one. The vanishing cycles are disjoint. Their intersection pairings with one another therefore vanish, and the product acts on a class $gamma$ by
  #[#set math.equation(numbering: n => "(4.6)")
   $ gamma mapsto gamma + sigma sum_i chevron.l gamma \, delta_i chevron.r \[ delta_i \] \, $ <mon:PL>]
  with one sign $sigma$ depending only on the intersection convention. Substituting (4.4) gives zero on the $a_j$ and, up to this one sign,
  $ \( a_j - a_(j + 1) \) - \( a_(j - 1) - a_j \) = 2 a_j - a_(j - 1) - a_(j + 1) $
  on $b_j$. This proves (4.5). Replacing the horizontal path by $R_s = \( s \/ n \) b$ gives (4.5), initially in the basis obtained from the corresponding vertical slit.
  It remains to compare the two bases; this matters because separate triangular matrices in unrelated bases would not give the stated conclusion. Choose the starting parameters of both paths sufficiently close to $O$. The horizontal loop at $y = 1 \/ 2$ and the vertical loop at $x = 1 \/ 2$ avoid one fixed small disk about $O$ and avoid both short slits. Outside this disk the covering extends across $R = O$ as $m$ disjoint sheets. Trivialize it over a small, simply connected parameter disk containing $O$, and use this trivialization to label the lifts of the two fixed loops. Parallel transport between the starting parameters now identifies both sets of $a_i \, b_i$ with the same basis. There is no monodromy ambiguity from circling $O$ on these classes: the sheet trivialization extends over $O$ itself. A different initial labeling makes only a common cyclic shift, which leaves (4.5)–(4.5) unchanged.
  Both loops therefore define the asserted operators in a single geometric monodromy group. Pullback along the open parameter curve in $E arrow.r U$ maps its fundamental group into that of $U$, so these operators occur in the latter image too. Removing additional finitely many points from either smooth parameter open induces a surjection on fundamental groups and does not remove any of the operators. ◻
]

The operator $2 - u - u^(- 1)$ is the cyclic difference operator arising from the adjacent-sheet vanishing classes. The next sections use the integral module in Proposition 8 to specialize rotation characters, and the two matrices above to keep the resulting residual representations irreducible.

== 5 Rank-two systems and integral congruences <sec:systems>

The cyclic covers now supply the Galois representations through which we will transfer automorphy. The involution identifies opposite rotation characters, giving each character space the determinant and Hodge–Tate weights of an elliptic curve. The integral regular-module calculation will then give congruences even at primes dividing the covering degree.

Return to an imaginary quadratic field $K$ and a non-CM elliptic curve $E \/ K$. By Serre’s open image theorem #cite(label("SerreOpenImage")) §4.4, Théorème 3, choose a prime $p > 100$ such that the image of $G_K$ on $E \[ p \]$ contains $"SL"_2 \( bb(F)_p \)$. Set

#[#set math.equation(numbering: n => "(5.1)")
 $ n = 3 p \, #h(2em) F = K \( mu_n \) . $ <sys:standing-fields>]

Both $K \/ bb(Q)$ and $bb(Q) \( mu_n \) \/ bb(Q)$ are abelian, so $F \/ bb(Q)$ is abelian. It is a CM field: complex conjugation is central, its fixed field is totally real, and $F$ has no real embedding because it contains $K$. Moreover,

#[#set math.equation(numbering: n => "(5.2)")
 $ zeta_5 in.not F . $ <sys:no-fifth-roots>]

Indeed, $bb(Q) \( mu_n \)$ is unramified at $5$, and the ramification index of $F$ at $5$ is consequently at most $\[ K : bb(Q) \] = 2$. A field containing $bb(Q) \( zeta_5 \)$ has ramification index divisible by $4$ at $5$.

Apply the construction of Lemma 2 with this $n$. Write $U subset bb(A)_K^1$ for its parameter open and $B_t$ for the quadratic twist of $E$ used there. We may shrink $U$ whenever a smooth proper model of one of the finitely many families is required. Until Section 8, the point $t in U \( K \)$ is arbitrary.

=== 5.1 Character spaces <character-spaces>

Fix an embedding $overline(bb(Q)) arrow.r.hook bb(C)$ and put $M = bb(Q) \( mu_n \) subset overline(bb(Q))$. For each rational prime $ell$, choose an embedding $j_ell : overline(bb(Q)) arrow.r.hook overline(bb(Q))_ell$ and an isomorphism $iota_ell : overline(bb(Q))_ell arrow.r^tilde.op bb(C)$ whose composition with $j_ell$ is the fixed complex embedding. Every rotation character in this section is a homomorphism

$ theta : mu_n \( F \) arrow.r M^times . $

Write $C_m \( t \) = C_(m \, t)$ for a fiber of the family. For the curve $C_n = C_n \( t \)$, define

#[#set math.equation(numbering: n => "(5.3)")
 $ V_(theta \, ell) = { x in H_(upright(acute(e) t))^1 \( C_(n \, overline(F)) \, overline(bb(Q))_ell \) : u^(*) x = j_ell \( theta \( u \) \) x upright(" for all ") u in mu_n \( F \) #scale(x: 120%, y: 120%)[}] . $ <sys:definition>]

Here $u$ denotes the deck transformation with multiplier $u$. All deck transformations are defined over $F$, so these are $G_F$-representations. We write $V_theta$ for the collection of these realizations. In a congruence at $ell$, all characters use the same embedding $j_ell$; this convention is essential when comparing their reductions.

#thm([Proposition 5.1.])[
  #emph[For every $t in U \( K \)$ and every rotation character $theta$, the representations $V_(theta \, ell)$ have the following properties.]
  + #emph[They are semisimple of dimension two, with determinant $epsilon.alt_ell^(- 1)$.]
  + #emph[At every place of $F$ above $ell$, they are potentially semistable with labelled Hodge–Tate weights ${ 0 \, 1 }$.]
  + #emph[There is a finite set of places $S$ of $F$, independent of $ell$, such that $V_(theta \, ell)$ is unramified at every $v in.not S$ of residue characteristic different from $ell$. At such a place its Frobenius characteristic polynomial is the image under $j_ell$ of a polynomial in $M \[ T \]$ independent of $ell$.]
] <sys:properties>

#proof[
  The rank-two regular-module statement of Proposition 8, followed by comparison between singular and $ell$-adic cohomology, gives $dim V_(theta \, ell) = 2$.
  Let $chevron.l med \, med chevron.r$ be the cup-product pairing on $H^1 \( C_n \)$, with values in $overline(bb(Q))_ell \( - 1 \)$. It pairs the $theta$-space perfectly with the $theta^(- 1)$-space. The involution $w$ is defined over $F$, preserves cup product, and exchanges these two spaces. Consequently
  $ \[ x \, y \]_theta = chevron.l x \, w^(*) y chevron.r \, #h(2em) x \, y in V_(theta \, ell) \, $
  is a perfect $G_F$-equivariant pairing into $overline(bb(Q))_ell \( - 1 \)$. It is alternating, because
  $ chevron.l y \, w^(*) x chevron.r = chevron.l w^(*) y \, x chevron.r = - chevron.l x \, w^(*) y chevron.r . $
  A perfect alternating pairing on a two-dimensional space identifies its determinant with the target line. This proves $det V_(theta \, ell) = epsilon.alt_ell^(- 1)$.
  To compute the Hodge numbers, make any embedding of $F$ into $bb(C)$. Let $a_theta$ be the multiplicity of $theta$ in the holomorphic differentials of the resulting complex curve. The holomorphic involution $w$ gives $a_theta = a_(theta^(- 1))$. Hodge decomposition and complex conjugation identify the dimension of the full $theta$-space with $a_theta + a_(theta^(- 1))$. Since this dimension is two, $a_theta = 1$. This argument works for every embedding and every character. The comparison theorems therefore give the labelled weights $0 \, 1$. Potential semistability follows from semistable reduction and the semistable comparison theorem for smooth proper varieties; see #cite(label("Tsuji")). These properties pass to the character summands.
  Outside a finite set, $C_n$ has good reduction and the rotations extend to its smooth proper model. Smooth proper base change gives unramifiedness. The projector onto the $theta$-space is
  $ e_theta = 1 / n sum_(u in mu_n \( F \)) j_ell \( theta \( u \) \)^(- 1) u^(*) . $
  This formula is used only in characteristic zero. The Lefschetz trace formula for a rotation composed with a positive power of Frobenius shows that its trace on $H^1 \( C_n \)$ is independent of $ell$. Applying the displayed projector gives traces in $M$, compatible under the embeddings $j_ell$. Together with the already determined determinant, this gives the asserted common characteristic polynomial.
  Finally, $H^1 \( C_n \)$ is the first cohomology of its Jacobian. Faltings’ semisimplicity theorem #cite(label("Faltings")) §5, Satz 3 makes this a semisimple $G_F$-representation. Extension of scalars and passage to a $G_F$-stable direct summand preserve semisimplicity, proving the remaining assertion. ◻
]

=== 5.2 The two elliptic-curve realizations <the-two-elliptic-curve-realizations>

The characters of orders one and three will connect the new systems to elliptic curves. For the order-three character, the involution produces a genus-one quotient rather than merely an abstract rank-two summand.

#thm([Proposition 5.2.])[
  #emph[If $theta$ has order $m > 1$ dividing $n$, the system $V_theta$ is realized by the corresponding character space in $H^1 \( C_m \)$. For the trivial character, 
$ V_(1 \, ell) tilde.eq H_(upright(acute(e) t))^1 \( B_(t \, overline(F)) \, overline(bb(Q))_ell \) . $

 Let $D_t = C_3 \( t \) \/ chevron.l w chevron.r$ and $A_t = "Jac" \( D_t \)$. Then $D_t$ has genus one, $A_t$ is an elliptic curve over $F$, and for either nontrivial order-three character $eta$ there are $G_F$-equivariant isomorphisms 
$ V_(eta \, ell) tilde.eq H_(upright(acute(e) t))^1 \( A_(t \, overline(F)) \, overline(bb(Q))_ell \) #h(2em) upright("for every ") ell . $

]
] <sys:elliptic>

#proof[
  The quotient map $C_n arrow.r C_m$ sends the covering coordinate $Y$ to $Y^(n \/ m)$. Pullback is injective on rational cohomology, since its composition with trace is multiplication by the degree. Its image is the subspace fixed by the kernel of $mu_n arrow.r mu_m$. The rank-two calculation therefore identifies its order-$m$ character summand with $V_(theta \, ell)$. The same argument for the quotient $C_n arrow.r B_t$ identifies the trivial character space.
  On $H^1 \( C_3 \)$, the trivial rotation space is $H^1 \( B_t \)$, and $w$ acts there by $\[ - 1 \]^(*) = - 1$. It exchanges the two nontrivial rotation spaces, each of dimension two. Their direct sum consequently has a two-dimensional $w$-invariant subspace. Rational cohomology of a finite quotient is the invariant subspace, so
  $ H^1 \( D_t \) tilde.eq H^1 \( C_3 \)^(w = 1) $
  has dimension two. Thus $D_t$ has genus one and its Jacobian is an elliptic curve, whether or not $D_t$ has an $F$-rational point. Projection of a vector $x + w^(*) x$ onto the $eta$-space is $x$; therefore this projection is a $G_F$-equivariant isomorphism from the invariant subspace to $V_(eta \, ell)$. Finally, $H^1 \( D_t \) tilde.eq H^1 \( "Jac" \( D_t \) \)$. The latter identification is independent of the geometric base point used in an Abel–Jacobi map, because translations act trivially on cohomology. ◻
]

=== 5.3 Evaluation of the integral group ring <evaluation-of-the-integral-group-ring>

A character projector contains the denominator $n$ and cannot by itself establish a congruence at $3$ or $p$. Instead, we use the integral freeness proved in Section 4. Evaluation of a free group-ring module gives a lattice before reduction; two characters with the same residual values then give the same residual representation.

#thm([Lemma 5.3.])[
  #emph[Fix $t in U \( K \)$ and a prime $ell$. Let $L \/ bb(Q)_ell$ be a finite extension containing $j_ell \( M \)$, with ring of integers $cal(O)$, maximal ideal $frak(m)$, and residue field $k$. For a rotation character $theta$, the module 
$ cal(T)_theta = H_(upright(acute(e) t))^1 \( C_(n \, overline(F)) \, bb(Z)_ell \) ⊗_(bb(Z)_ell \[ mu_n \] \, thin j_ell theta) cal(O) $

 is a free rank-two $G_F$-stable lattice realizing $V_(theta \, ell)$ after extension to $overline(bb(Q))_ell$. If $j_ell theta$ and $j_ell theta'$ have the same reduction as characters $mu_n arrow.r k^times$, then 
$ cal(T)_theta \/ frak(m) cal(T)_theta tilde.eq cal(T)_(theta') \/ frak(m) cal(T)_(theta') $

 as $k \[ G_F \]$-modules.]
] <sys:integral-evaluation>

#proof[
  By Proposition 8 and comparison,
  $ H_(upright(acute(e) t))^1 \( C_(n \, overline(F)) \, bb(Z)_ell \) tilde.eq bb(Z)_ell \[ mu_n \]^2 $
  as group-ring modules. The Galois action commutes with this group ring because the rotations are defined over $F$. Tensoring by evaluation at $j_ell theta$ therefore gives a free rank-two $cal(O)$-module with continuous Galois action. In characteristic zero the group algebra is semisimple; its quotient by character evaluation is precisely the corresponding character summand. This identifies its rational representation with $V_(theta \, ell)$.
  After reduction, the displayed tensor product becomes
  $ H_(upright(acute(e) t))^1 \( C_(n \, overline(F)) \, bb(Z)_ell \) ⊗_(bb(Z)_ell \[ mu_n \] \, thin overline(theta)) k . $
  It depends only on the residual evaluation map $overline(theta)$. This proves the asserted isomorphism without assuming that $ell$ is prime to $n$. ◻
]

Choose a primitive character $chi$ of order $n = 3 p$ and write its unique primary decomposition as

$ chi = psi eta \, #h(2em) "ord" \( psi \) = p \, #h(2em) "ord" \( eta \) = 3 . $

For a system $V_theta$, write $overline(V)_(theta \, ell)$ for the semisimplified reduction of a stable lattice, with scalars extended to $overline(bb(F))_ell$. This representation is independent of the choice of stable lattice.

#thm([Corollary 5.4.])[
  #emph[For every $t in U \( K \)$ there are isomorphisms 
#[#set math.equation(numbering: n => "(5.4)")
 $ overline(V)_(eta \, p) tilde.eq overline(V)_(chi \, p) \, #h(2em) overline(V)_(chi \, 3) tilde.eq overline(V)_(psi \, 3) \, #h(2em) overline(V)_(psi \, p) tilde.eq overline(V)_(1 \, p) . $ <sys:congruence-chain>]

 These hold with the elliptic-curve realizations of Proposition 13 at the two ends.]
] <sys:congruences>

#proof[
  A root of unity of $ell$-power order reduces to $1$ in residue characteristic $ell$. Thus $chi$ and $eta$ have the same reduction at $p$, $chi$ and $psi$ have the same reduction at $3$, and $psi$ and $1$ have the same reduction at $p$. Lemma 14 gives the three congruences. The rational isomorphisms with the smaller covers and elliptic curves in Proposition 13 preserve semisimplified reduction, even if their natural integral pullbacks have index divisible by $ell$. ◻
]

The direction of propagation is now fixed: automorphy will pass from $V_eta$ to $V_chi$ at $p$, then to $V_psi$ at $3$, and finally to $V_1$ at $p$. The congruences themselves impose no restriction on $t$. The subsequent local and residual arguments will choose one parameter for which all three automorphy-lifting steps apply.

== 6 Automorphy inputs and the remaining specialization conditions <sec:inputs>

The congruences of Corollary 15 connect the cohomology of the auxiliary elliptic curve $A$ to that of the twist $B_t$ of $E$. To turn them into a proof of automorphy, we use two results of Caraiani–Newton. We state the precise forms needed here, and then identify the properties that the parameter $t$ must satisfy. All the results quoted from #cite(label("CN")) use the numbering of its third arXiv version.

#prodef([Definition 6.1.])[
  (Decomposed genericity).  Let $L$ be a number field and let $overline(r) : G_L arrow.r "GL"_2 \( overline(bb(F))_l \)$ be continuous. The representation is #emph[decomposed generic] if there is a rational prime $q eq.not l$ splitting completely in $L$ such that, for every $v divides q$, it is unramified at $v$ and its Frobenius eigenvalues $alpha_v \, beta_v$ satisfy
  $ alpha_v \/ beta_v eq.not q \, #h(2em) beta_v \/ alpha_v eq.not q quad upright("in ") overline(bb(F))_l . $
] <def:decomposed-generic>

This is #cite(label("CN")) Definition 2.1.27. Our construction will give $q equiv 1 med \( mod med l \)$, so it is enough to make the two eigenvalues distinct at #emph[every] place above $q$.

We use potential ordinarity of Galois representations in the convention of Section 2. The corresponding automorphic condition, called #emph[$iota$-ordinarity of weight zero], is the ordinary Hecke condition used in #cite(label("CN")) Theorem 5.2. It is imposed at a sufficiently deep level and therefore allows ramified finite-order characters. We will obtain it only for quadratic twists of Steinberg, using the local calculation in #cite(label("CN")) Lemma 6.1.3(4).

#thm([Theorem 6.2.])[
  (Caraiani–Newton, specialized form).  #emph[Let $L$ be a CM number field and $l$ an odd prime other than $5$. Let $r : G_L arrow.r "GL"_2 \( overline(bb(Q))_l \)$ be continuous, unramified outside finitely many places, with determinant $epsilon.alt_l^(- 1)$. Suppose that $r$ is potentially semistable with labeled Hodge–Tate weights $0 \, 1$ at every $v divides l$, that $overline(r)$ is decomposed generic, and that $overline(r) \|_(G_(L \( zeta_l \)))$ is absolutely irreducible.]
  #emph[Suppose there are a cuspidal weight-zero regular algebraic representation $pi$ of $"PGL"_2 \( bb(A)_L \)$ and an isomorphism $iota : overline(bb(Q))_l arrow.r^tilde.op bb(C)$ for which $overline(r_iota \( pi \)) tilde.eq overline(r)$. At each $v divides l$, assume one of the following:]
  #{ set enum(numbering: "i."); [
  + #emph[Both local Galois representations are potentially crystalline; one is potentially ordinary of weight zero if and only if the other is; and $"rec"_(L_v) \( pi_v \)$ has zero monodromy.]
  + #emph[Neither local Galois representation is potentially crystalline, and $pi$ is $iota$-ordinary of weight zero at $v$.]
] }
  #emph[Then $r tilde.eq r_iota \( Pi \)$ for a cuspidal weight-zero regular algebraic representation $Pi$ of $"PGL"_2 \( bb(A)_L \)$.]
] <aut:lift>

This is a sufficient-hypothesis specialization of #cite(label("CN")) Theorem 5.2. Its inverse-cyclotomic determinant hypothesis permits $l = 3$, including residual image $"SL"_2 \( bb(F)_3 \)$; see #cite(label("CN")) Remark 5.2.2. No additional residual adequacy assumption is being made. All three applications below have $l = 3$ or $l = p > 100$.

#thm([Theorem 6.3.])[
  (Elliptic starting point).  #emph[Let $L$ be a CM number field not containing $zeta_5$, and let $A \/ L$ be a non-CM elliptic curve. If its mod-$5$ representation is decomposed generic and is absolutely irreducible on $G_(L \( zeta_5 \))$, then $H^1 \( A \)$ is realized by a cuspidal weight-zero regular algebraic representation of $"PGL"_2 \( bb(A)_L \)$.]
] <aut:seed>

This is #cite(label("CN")) Theorem 6.1 and Lemma 6.1.3, after dualizing the Tate-module convention there when necessary. Absolute irreducibility and decomposed genericity in dimension two are preserved by duality.

For later use we also record the compatibility available after an elliptic curve itself is known to be modular.

#thm([Theorem 6.4.])[
  (Compatibility for modular elliptic curves).  #emph[Let $D \/ L$ be a non-CM elliptic curve over a CM number field. Suppose that a regular algebraic cuspidal representation $pi$ realizes $H^1 \( D \)$ at one coefficient prime. Then $pi$ has weight zero and trivial central character, realizes $H^1 \( D \)$ at every coefficient prime and every coefficient isomorphism, and satisfies 
$ iota "WD" #scale(x: 120%, y: 120%)[\(] H^1 \( D \, overline(bb(Q))_l \) \|_(G_(L_v)) #scale(x: 120%, y: 120%)[\)]^(upright(F upright("-") s s)) tilde.eq "rec"_(L_v)^T \( pi_v \) #h(2em) \( v divides.not l \) . $

 If $D$ has potentially multiplicative reduction at $v divides l$, then $pi$ is $iota$-ordinary of weight zero there.]
] <aut:elliptic-compat>

This is #cite(label("CN")) Lemma 6.1.3. For the intermediate systems, which need not come from elliptic curves, we use instead the general existence and good-place compatibility of $r_iota \( pi \)$ from #cite(label("HLTT")) #cite(label("Scholze")), and Varma’s equality of the underlying semisimplified Weil representations at $v divides.not l$ #cite(label("Varma")) Theorem 1. The local reduction analysis in Section 7 will supply the additional facts needed in Theorem 17.

Here is what remains to be arranged for a single parameter $t in U \( K \)$. The determinant and Hodge–Tate conditions hold for every parameter by Proposition 12. At places above $3 p$, we will make the Jacobian of $C_n \( t \)$ potentially good ordinary, potentially good with all Newton slopes $1 \/ 2$, or potentially totally toric, according to the reduction type of $E$. This will make all four systems potentially crystalline and potentially ordinary, potentially crystalline but not potentially ordinary, or non-potentially crystalline, respectively. Section 7 obtains these properties from nonempty local open conditions on $t$.

Section 8 then chooses a parameter in those open sets for which the residual hypotheses hold. The pairs $\( m \, l \) = \( 3 \, 5 \) \, \( 3 \, p \) \, \( p \, 3 \)$ provide respectively the elliptic starting point and the first two lifts; the last lift uses the large mod-$p$ image of $E$. The two conjugates of $K$ must be considered together to obtain decomposed genericity. Once these properties have been proved, Section 9 propagates automorphy along the three congruences and descends to $K$.

== 7 Prescribing the local reduction type <sec:local>

The degeneration at the origin allows us to arrange the same local behavior for every character summand of the covering curve. We first explain why the reduction type of an abelian variety is controlled, locally in a characteristic-zero family, by a sufficiently large finite torsion module. We then apply this observation to the Jacobian family and translate its reduction into the local conditions on the two-dimensional representations.

=== 7.1 Finite torsion and reduction in a local family <finite-torsion-and-reduction-in-a-local-family>

Throughout this section, a local field is a finite extension of $bb(Q)_ell$. In this subsection, the auxiliary torsion prime $d$ is different from $ell$. If $A$ is an abelian variety, write $V_d \( A \) = T_d \( A \) ⊗_(bb(Z)_d) bb(Q)_d$ for its rational Tate module.

#thm([Lemma 7.1.])[
  (Local constancy of finite torsion).  #emph[Let $L$ be a local field, let $X$ be a smooth $L$-variety, and let $cal(A) arrow.r X$ be an abelian scheme. For $x_0 in X \( L \)$ and an integer $N gt.eq 1$, there is an analytic neighborhood $cal(N)$ of $x_0$ in $X \( L \)$ such that 
$ cal(A)_x \[ N \] \( overline(L) \) tilde.eq cal(A)_(x_0) \[ N \] \( overline(L) \) #h(2em) \( x in cal(N) \) $

 as $G_L$-modules.]
] <loc:torsion>

#proof[
  The group scheme $cal(A) \[ N \]$ is finite étale over $X$, since the base has characteristic zero. Equivalently, the scheme of full level-$N$ structures is a finite étale torsor over $X$ under the constant group $"GL"_(2 g) \( bb(Z) \/ N bb(Z) \)$, where $g$ is the relative dimension. Choose a finite Galois extension $L' \/ L$ over which the fiber of this torsor at $x_0$ splits. The inverse function theorem for an étale morphism gives a local section through each point of the fiber over a neighborhood of $x_0$ in $X \( L' \)$. Shrinking that neighborhood, these sections enumerate all points in every nearby fiber. Intersecting its finitely many Galois conjugates, and shrinking once more if necessary, makes the neighborhood Galois stable and preserves the Galois permutations of the sections. The right action of the finite level group likewise preserves the same permutations after shrinking. Restricting to $X \( L \)$ therefore identifies the fibers as Galois sets with their level-group action, and hence identifies the underlying torsion modules. ◻
]

The finite torsion module will first ensure semistability and then identify a Frobenius polynomial. For the second step we use the polynomial on the #emph[full] Tate module: this retains both the toric and the lattice pieces of the semistable representation.

#thm([Lemma 7.2.])[
  (Finitely many semistable Frobenius polynomials).  #emph[Fix a local field $L$ with residue field of cardinality $Q$, an integer $g gt.eq 1$, and a prime $d$ different from the residue characteristic. For a semistable abelian variety $A \/ L$ of dimension $g$, let 
$ P_A \( T \) = det #scale(x: 120%, y: 120%)[\(] T - "Frob"_L divides V_d \( A \) #scale(x: 120%, y: 120%)[\)] \, $

 where $"Frob"_L$ is any lift of arithmetic Frobenius. Then $P_A \( T \)$ belongs to $bb(Z) \[ T \]$, is independent of the lift and of $d$, and ranges over a finite set depending only on $g$ and $Q$. Moreover, $P_A$ determines the toric rank of $A$; if that rank is zero, it also determines the Newton polygon of its good reduction.]
] <loc:frobenius>

#proof[
  Let $r$ be the toric rank of $A$. The semistable filtration of Grothendieck identifies the graded pieces of $V_d \( A \)$ with the rational Tate module of a torus of rank $r$, the rational Tate module of an abelian variety of dimension $g - r$ with good reduction, and a lattice of rank $r$ #cite(label("SGA7I")) Exposé IX. The character lattice of the torus and the lattice quotient have finite unramified Galois action. Consequently the arithmetic Frobenius eigenvalues on the toric and lattice graded pieces are respectively $Q$ times roots of unity and roots of unity. The middle piece has the $2 \( g - r \)$ Frobenius eigenvalues of an abelian variety over $bb(F)_Q$, all of complex absolute value $Q^(1 \/ 2)$.
  Each graded piece has an integral characteristic polynomial independent of $d$: for the toric and lattice pieces this follows from the finite-order integral actions just described, together with the toric Tate twist; for the abelian piece it is the usual finite-field Frobenius polynomial. Inertia acts trivially on the graded pieces, so the product of these three polynomials is also independent of the lift of Frobenius. Every root has complex absolute value at most $Q$. Thus the coefficient of $T^(2 g - j)$ has absolute value at most $binom(2 g, j) Q^j$. Integral polynomials of fixed degree with these bounds form a finite set.
  Exactly $r$ roots have absolute value $1$, exactly $r$ have absolute value $Q$, and the others have absolute value $Q^(1 \/ 2)$. Since $Q > 1$, these three absolute values distinguish $r$. If $r = 0$, semistability is good reduction, and the normalized $ell$-adic valuations of the roots of $P_A$ are its Newton slopes. ◻
]

#thm([Proposition 7.3.])[
  (Local constancy of the semistable type).  #emph[Let $L_0$ be a local field, let $X$ be a smooth $L_0$-variety, and let $cal(A) arrow.r X$ be an abelian scheme of relative dimension $g$. For $x_0 in X \( L_0 \)$, there exist a finite extension $L \/ L_0$ and an analytic neighborhood $cal(N) subset X \( L_0 \)$ of $x_0$ with the following properties. For every $x in cal(N)$, the abelian variety $cal(A)_x$ is semistable over $L$ and has the same toric rank as $cal(A)_(x_0)$ over $L$. If $cal(A)_(x_0)$ has good reduction over $L$, then $cal(A)_x$ has the same Newton polygon over $L$.]
  #emph[In particular, if $cal(A)_(x_0) tilde.eq E_0^g$ for an elliptic curve $E_0 \/ L_0$, every sufficiently nearby fiber has, after the same finite extension, the same one of the following three properties as $E_0^g$:]
  + #emph[good ordinary reduction;]
  + #emph[good reduction with all Newton slopes equal to $1 \/ 2$;]
  + #emph[semistable reduction of toric rank $g$.]
] <loc:constancy>

#proof[
  Choose an odd prime $d$ different from the residue characteristic. By semistable reduction, we may choose a finite extension $L \/ L_0$ over which $cal(A)_(x_0)$ is semistable and all its $d$-torsion points are rational. Lemma 20, applied after base change to $L$, shows that, in a neighborhood of $x_0$, all nearby fibers also have rational $d$-torsion over $L$.
  These fibers are semistable over $L$. Indeed, the matrix of any inertia element on their $d$-adic Tate module has the form $1 + d B$ with $B$ integral. Each eigenvalue $lambda$ therefore satisfies $v_d \( lambda - 1 \) gt.eq 1$, where $v_d \( d \) = 1$. The local monodromy theorem makes $lambda$ a root of unity. For odd $d$ the only root of unity satisfying this inequality is $1$: a root with nontrivial prime-to-$d$ part has $v_d \( lambda - 1 \) = 0$, and a primitive $d^a$th root has valuation $1 \/ \( d^(a - 1) \( d - 1 \) \) < 1$. Thus every inertia element acts unipotently, and Grothendieck’s criterion gives semistability #cite(label("SGA7I")) Exposé IX.
  Let $cal(P)$ be the finite set of polynomials in Lemma 21 for dimension $g$ and the residue cardinality of $L$. Choose $j$ so large that reduction modulo $d^j$ is injective on $cal(P)$. A second application of Lemma 20 gives, throughout a smaller neighborhood,
  $ cal(A)_x \[ d^j \] \( overline(L) \) tilde.eq cal(A)_(x_0) \[ d^j \] \( overline(L) \) quad upright("as ") G_L upright("-modules") . $
  Their full Frobenius polynomials are congruent modulo $d^j$, hence equal. Lemma 21 now gives the assertions about toric rank and Newton polygon. The inverse image of this neighborhood under $X \( L_0 \) arrow.r X \( L \)$ is a neighborhood of $x_0$, as required.
  For the final assertion, choose $L$ so that $E_0$ has good or split multiplicative reduction. In the good case an elliptic curve is either ordinary or supersingular; in the latter case both its Newton slopes are $1 \/ 2$. In the multiplicative case $E_0^g$ has toric rank $g$. Enlarging $L$ to rationalize its $d$-torsion preserves these properties, so the preceding argument applies. ◻
]

=== 7.2 Monodromy of a totally toric abelian variety <monodromy-of-a-totally-toric-abelian-variety>

The third possibility in Proposition 22 must force nonzero monodromy on #emph[each] character summand, including when the coefficient prime is the residue characteristic. The rank statement needed for this is a consequence of the valuation pairing in toric uniformization. We give the argument at the residue characteristic as well, in terms of Kummer extensions.

#thm([Lemma 7.4.])[
  #emph[Let $L \/ bb(Q)_ell$ be finite and let $A \/ L$ be an abelian variety of dimension $g$. Suppose that $A$ acquires semistable reduction of toric rank $g$ after a finite extension. For every prime $d$, the monodromy operator on the Weil–Deligne representation of $H_(upright("et"))^1 \( A_(overline(L)) \, bb(Q)_d \)$ has rank $g$. For $d = ell$, the Weil–Deligne representation is the one attached to the potentially semistable representation by $ell$-adic Hodge theory.]
] <loc:toric-monodromy>

#proof[
  Monodromy rank does not change after finite extension. We may therefore assume that $A$ has split toric uniformization
  $ A^(upright("an")) tilde.eq \( bb(G)_m^g \)^(upright("an")) \/ Lambda \, $
  where $Lambda tilde.eq bb(Z)^g$ is rational over $L$. Choosing bases of the torus and lattice writes the periods as a matrix $\( q_(i j) \) in \( L^times \)^(g times g)$. The valuation pairing is nondegenerate, so
  #[#set math.equation(numbering: n => "(7.1)")
   $ #scale(x: 120%, y: 120%)[\(] v_L \( q_(i j) \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq i \, j lt.eq g) quad upright("is nonsingular.") $ <loc:valuation-matrix>]
  This is the toric case of the monodromy pairing for a semistable abelian variety #cite(label("SGA7I")) Exposé IX; its realization on de Rham cohomology is described in #cite(label("ColemanIovita")).
  If $d eq.not ell$, the same pairing describes the monodromy map from the lattice quotient to the toric subspace of the Tate module. Its nondegeneracy gives rank $g$. We now prove this rank assertion for $d = ell$.
  Toric uniformization supplies an exact sequence
  #[#set math.equation(numbering: n => "(7.2)")
   $ 0 arrow.r bb(Q)_ell \( 1 \)^g arrow.r V_ell \( A \) arrow.r bb(Q)_ell^g arrow.r 0 \, $ <loc:tate-extension>]
  whose extension classes are the Kummer classes of the $q_(i j)$. The representation is semistable, by the semistable comparison theorem for abelian varieties #cite(label("ColemanIovita")). Let $L_(upright("ur"))$ be the maximal unramified subfield of $L$, and write $D_(upright("st"))$ for Fontaine’s semistable functor over $L$. On the two outer terms of (7.2), monodromy is zero. Consequently it induces a map
  $ nu : D_(upright("st")) \( bb(Q)_ell^g \) arrow.r D_(upright("st")) \( bb(Q)_ell \( 1 \)^g \) . $
  After the standard identifications, Frobenius on these two spaces is respectively $sigma$ and $ell^(- 1) sigma$, with $sigma$ the Frobenius of $L_(upright("ur")) \/ bb(Q)_ell$. The identity $N phi = ell phi N$ therefore makes $ker nu subset L_(upright("ur"))^g$ stable under $sigma$.
  Suppose that $nu$ has rank less than $g$. Finite Galois descent for $L_(upright("ur")) \/ bb(Q)_ell$ then gives a nonzero vector $a = \( a_j \) in bb(Q)_ell^g ∩ ker nu$. Pull (7.2) back along the line spanned by $a$ in its trivial quotient. The resulting extension of $bb(Q)_ell$ by $bb(Q)_ell \( 1 \)^g$ is semistable and has zero monodromy, hence is crystalline. Under Kummer theory the Bloch–Kato crystalline subspace $H_f^1 \( L \, bb(Q)_ell \( 1 \) \)$ is the kernel of the valuation map #cite(label("BlochKato")) Example 3.9. Applying this to each coordinate of the pulled-back extension gives
  $ sum_(j = 1)^g a_j v_L \( q_(i j) \) = 0 #h(2em) \( 1 lt.eq i lt.eq g \) \, $
  contrary to (7.1). Thus $N$ has rank $g$ on $V_ell \( A \)$. Dualizing gives the same rank on $H_(upright("et"))^1 \( A_(overline(L)) \, bb(Q)_ell \)$. ◻
]

=== 7.3 Open conditions on the original parameter <open-conditions-on-the-original-parameter>

Return to the elliptic curve $E \/ K$, the odd integer $n = 3 p$, and $F = K \( mu_n \)$. The Jacobian of the constant-$E$ cover $C_n$ extends over a neighborhood of $O$ in the parameter curve $E$, with fiber $E^n$ at $O$, by Proposition 4. Proposition 22 therefore applies at every finite completion of $F$. The following statement expresses the resulting neighborhoods in the original parameter $t in U subset bb(A)_K^1$, so they can later be combined with Hilbert irreducibility.

#thm([Proposition 7.5.])[
  #emph[For every place $v_0 divides 3 p$ of $K$, there is a nonempty open subset $Omega_(v_0) subset U \( K_(v_0) \)$ with the following property. Suppose that $t in U \( K \)$ belongs to $Omega_(v_0)$ for all $v_0 divides 3 p$, and set $J_t = "Jac" \( C_(n \, t) \)$. At each place $v divides 3 p$ of $F$, $J_t$ has the same one of the following potential reduction types as $E^n$:]
  + #emph[good ordinary reduction;]
  + #emph[good reduction with all Newton slopes $1 \/ 2$;]
  + #emph[semistable reduction of toric rank $n$.]
  #emph[For each $v$, the extensions giving these properties may be chosen in advance, independently of $t$ in the indicated open subsets.]
] <loc:opens>

#proof[
  Fix $v_0 divides 3 p$. For each $v divides v_0$, apply Proposition 22 to the extended Jacobian family over $F_v$, at the point $O$ of its parameter curve. This gives a neighborhood of $O$ in $E \( F_v \)$ and a fixed finite extension of $F_v$ on which the asserted reduction type holds. The inverse images of these finitely many neighborhoods in $E \( K_(v_0) \)$ have an intersection that is again a neighborhood of $O$.
  Choose $R_0 eq.not O$ in this intersection, sufficiently close to $O$ and away from the finitely many excluded parameters of the cover family. We may also avoid the ramification points of $x : E arrow.r upright(bold(P))^1$, since these form a finite set. The local inverse function theorem gives a nonempty neighborhood $Omega_(v_0) subset U \( K_(v_0) \)$ of $x \( R_0 \)$ and an analytic lift
  $ R \( t \) = \( t \, y \( t \) \) in E \( K_(v_0) \) \, #h(2em) y \( t \)^2 = h \( t \) \, $
  whose image remains in the chosen intersection. Shrink the neighborhood so that $y \( t \) eq.not 0$ and it avoids all excluded parameters.
  The map
  $ B_t arrow.r E \, #h(2em) \( x \, y \) mapsto \( x \, y \( t \) y \) $
  is an isomorphism over $K_(v_0)$ carrying the marked point $\( t \, 1 \)$ to $R \( t \)$. It carries the defining function for the cover to the function in the constant-$E$ construction: their divisors agree, and both have value $1$ at $O$. Thus it identifies the covers and their Jacobians at every $v divides v_0$. The reduction conclusions follow from the choice of the neighborhoods. Carrying this out independently at the finitely many $v_0 divides 3 p$ proves the proposition. ◻
]

=== 7.4 The local representations of the character summands <the-local-representations-of-the-character-summands>

For a prime $ell$ and a rotation character $theta$, write $V_(theta \, ell)$ for the $ell$-adic realization of the rank-two system in Section 5. Recall from Section 2 that the ordinary filtration of weight zero has an unramified character on its line and $epsilon.alt_ell^(- 1)$ times an unramified character on its quotient, after a finite extension. In the ordinary case below the distinguished line is already preserved before this extension.

#thm([Corollary 7.6.])[
  #emph[Choose $t$ satisfying the open conditions of Proposition 24. Let $v divides 3 p$ be a place of $F$, of residue characteristic $ell$. Then, simultaneously for every rotation character $theta$, the following conclusions hold.]
  + #emph[If $E$ has potentially good ordinary reduction at $v$, then $V_(theta \, ell) \|_(G_(F_v))$ is potentially crystalline and potentially ordinary of weight $0$.]
  + #emph[If $E$ has potentially good supersingular reduction at $v$, then $V_(theta \, ell) \|_(G_(F_v))$ is potentially crystalline and is not potentially ordinary of weight $0$.]
  + #emph[If $E$ has potentially multiplicative reduction at $v$, then the monodromy of $V_(theta \, d) \|_(G_(F_v))$ has rank one for every coefficient prime $d$, including $d = ell$. In particular, $V_(theta \, ell) \|_(G_(F_v))$ is not potentially crystalline.]
] <loc:characters>

#proof[
  Choose a finite extension $L \/ F_v$ on which $J_t$ has the reduction given by Proposition 24. In the two good-reduction cases, crystalline comparison makes $H_(upright("et"))^1 \( J_(t \, overline(L)) \, bb(Q)_ell \)$, and hence each character summand, crystalline over $L$.
  Suppose first that the reduction is ordinary. The connected–étale sequence of the ordinary $ell$-divisible group, dualized to $H^1$, gives a filtration whose subrepresentation is unramified and whose quotient is $epsilon.alt_ell^(- 1)$ times an unramified representation. This filtration is functorial in endomorphisms and therefore stable under the rotations. It restricts to such a filtration on each $V_(theta \, ell)$. By Proposition 12, this summand has dimension two and labeled Hodge–Tate weights $0 \, 1$. Its unramified part contributes only weight $0$, whereas the quotient contributes only weight $1$; thus both parts have dimension one. This is the required ordinary filtration. After replacing $L$ by a finite Galois extension, its weight-zero line is uniquely determined by its inertia action, since $epsilon.alt_ell$ has infinite image on the inertia of every finite extension. Conjugation by $G_(F_v)$ preserves that line, so the line descends to the original decomposition group.
  If the reduction has all slopes $1 \/ 2$, the crystalline module of every summand has the same slope. These normalized slopes remain $1 \/ 2$ after further finite extension. An ordinary filtration of weight $0$ would provide a crystalline rank-one subrepresentation of parallel Hodge–Tate weight zero. For that character weak admissibility forces Newton slope zero, contradicting the slopes of the summand. Thus no such potential ordinary filtration exists.
  Finally, suppose that $J_t$ has potentially toric rank $n$. Lemma 23 gives rank $n$ for monodromy on its $2 n$-dimensional first cohomology, at every coefficient prime. Monodromy commutes with the rotations, so preserves the $n$ character summands. Each summand has dimension two. On first cohomology of a semistable abelian variety one has $N^2 = 0$, so the rank on each summand is at most one. Their ranks sum to $n$ and there are exactly $n$ summands; every rank is therefore one. Nonzero monodromy persists after finite extension and excludes potential crystallinity. ◻
]

== 8 One specialization with all residual properties <sec:residual>

We now choose a single parameter for the congruence chain. The geometric monodromy supplies irreducibility and suitable Frobenius elements, whereas Hilbert irreducibility allows us to retain these elements after imposing the local conditions of Section 7. To obtain decomposed genericity, we must control every place above a split rational prime. We therefore specialize the two conjugate parameter families together.

Throughout this section, $K \, E \, p \, n \, F \, U$ have the meanings fixed in Section 5. In particular, $p > 100$, $n = 3 p$, and $F = K \( mu_n \)$. The pairs of covering degree and residual characteristic that require geometric monodromy are

#[#set math.equation(numbering: n => "(8.1)")
 $ \( m \, ell \) = \( 3 \, p \) \, quad \( 3 \, 5 \) \, quad \( p \, 3 \) . $ <res:pairs>]

In each case $ell divides.not m$, so the residual cohomology decomposes into rotation-character spaces after extending its finite coefficient field.

=== 8.1 Consequences of the two monodromy transformations <consequences-of-the-two-monodromy-transformations>

#thm([Lemma 8.1.])[
  #emph[For each pair in (8.1), the geometric monodromy of $H^1 \( C_m \, overline(bb(F))_ell \)$ on every nontrivial rotation-character space is absolutely irreducible. Its image contains opposite nonidentity root unipotents on that space. Moreover, one element of the geometric monodromy acts regular semisimply on all these nontrivial character spaces simultaneously. These statements also hold for the conjugate family over $K$.]
] <res:geometric>

#proof[
  We first work with homology; duality will give the cohomological statements. On the character space with generator eigenvalue $lambda in overline(bb(F))_ell^times$, the transformations of Theorem 11 have the form
  $ T_a = mat(delim: "(", 1, sigma c_lambda; 0, 1) \, #h(2em) T_b = mat(delim: "(", 1, 0; tau c_lambda, 1) \, #h(2em) c_lambda = 2 - lambda - lambda^(- 1) \, $
  where $sigma \, tau in { 1 \, - 1 }$. Since $c_lambda = - \( lambda - 1 \)^2 \/ lambda$, it is nonzero when $lambda eq.not 1$. The two matrices have different unique invariant lines, even over the algebraic closure. Hence their common representation is absolutely irreducible.
  The product $T_a T_b^k$ has determinant one and trace
  #[#set math.equation(numbering: n => "(8.2)")
   $ 2 + sigma tau k c_lambda^2 . $ <res:trace-product>]
  In odd characteristic, a determinant-one matrix is regular semisimple exactly when its trace is different from $2$ and $- 2$. If $m = 3$, then $lambda + lambda^(- 1) = - 1$, so $c_lambda = 3$ for both nontrivial characters. Take $k = 2$. The two possible traces in (8.2) are $20$ and $- 16$. Modulo $5$ these are $0$ and $4$, and neither equals $2$ or $- 2$; modulo $p > 100$ they again avoid $2$ and $- 2$.
  For $m = p$ and $ell = 3$, take $k = 1$. Failure of regular semisimplicity would force $c_lambda^2 = 4$ or $- 4$, since $c_lambda eq.not 0$. Multiplying either equation by $lambda^2$ gives a polynomial of degree four over $bb(F)_3$ satisfied by $lambda$. Its degree over $bb(F)_3$ is therefore some $d lt.eq 4$, and its order divides $3^d - 1 lt.eq 80$. This contradicts the fact that its order is the prime $p > 100$. Thus the same product works for every nontrivial character in this case as well.
  The transformations come from loops in the constant-elliptic-curve parameter space. As explained in Theorem 11, that family is a pullback of the family over $U$. Its monodromy image is therefore contained in the geometric monodromy image over $U$. Duality preserves absolute irreducibility, nonidentity unipotents, and regular semisimplicity. This proves the assertions for cohomology. The geometric argument applies to every complex elliptic curve, so it applies equally to the conjugate of $E$. ◻
]

=== 8.2 The original elliptic curve and its conjugate <the-original-elliptic-curve-and-its-conjugate>

The trivial character requires a different argument, since the geometric family varies only a quadratic twist of $E$. Its large residual image was built into the choice of $p$. The following count shows that no independence assumption between $E$ and its conjugate is necessary.

#thm([Lemma 8.2.])[
  #emph[For every $t in U \( K \)$, the representation $overline(V)_(1 \, p)$ is absolutely irreducible on $G_(F \( zeta_p \))$ and is decomposed generic over $F$.]
] <res:trivial-character>

#proof[
  Let $Gamma$ be the image of $G_K$ on $E \[ p \]$. The abelian extension $F \/ K$ implies that the image of $G_F$ contains $\[ Gamma \, Gamma \]$. Since $Gamma$ contains $"SL"_2 \( bb(F)_p \)$ and this group is perfect for $p > 3$, its commutator subgroup is $"SL"_2 \( bb(F)_p \)$: one inclusion follows from perfectness, and the other from the determinant map. Moreover, the determinant is trivial on $G_F$ because $mu_p subset F$. We have therefore proved
  #[#set math.equation(numbering: n => "(8.3)")
   $ rho_(E \, p) \( G_F \) = "SL"_2 \( bb(F)_p \) . $ <res:SL2-image>]
  The same equality holds for the conjugate curve $E^c$, where $c$ is the nontrivial automorphism of $K \/ bb(Q)$, because $F \/ bb(Q)$ is normal.
  Consider the joint image
  $ J subset "SL"_2 \( bb(F)_p \) times "SL"_2 \( bb(F)_p \) $
  of $G_F$ on $E \[ p \]$ and $E^c \[ p \]$. Both projections are surjective. In $"SL"_2 \( bb(F)_p \)$ there are exactly $p^2$ matrices of trace $2$. Indeed, writing a matrix as $mat(delim: "(", a, b; c, d)$, the trace and determinant conditions give $d = 2 - a$ and $b c = - \( a - 1 \)^2$. The value $a = 1$ gives $2 p - 1$ choices for $\( b \, c \)$; the other $p - 1$ values of $a$ each give $p - 1$ choices. Their sum is $p^2$. Replacing a matrix by its negative gives the same count for trace $- 2$.
  The order of $"SL"_2 \( bb(F)_p \)$ is $p \( p^2 - 1 \)$. Since each projection of $J$ has equal-sized fibers, the proportion of elements of $J$ whose image in at least one factor has trace $2$ or $- 2$ is at most
  $ 2 frac(2 p^2, p \( p^2 - 1 \)) = frac(4 p, p^2 - 1) < 1 . $
  Thus some element of $G_F$ acts regular semisimply on both $E \[ p \]$ and $E^c \[ p \]$.
  Take a finite Galois extension of $bb(Q)$ containing $F$ and the fields needed for these two residual actions. Conjugation by $G_(bb(Q))$ either preserves the two curves or exchanges them, and conjugates their residual matrices. The selected element and all its conjugates therefore act regular semisimply on the representation of $E$. Chebotarev supplies rational primes $q$ splitting completely in $F$ with this property at every $v divides q$ of $F$. We exclude $p$ and the finitely many primes of bad reduction. Since $mu_p subset F$, these primes satisfy $q equiv 1 med \( mod med p \)$. Distinct Frobenius eigenvalues then give the ratio condition in the definition of decomposed genericity.
  The curve $B_t$ is a quadratic twist of $E$. Twisting multiplies residual matrices by scalar signs and hence preserves absolute irreducibility and eigenvalue ratios. Excluding the finitely many ramified primes of this twist leaves the same Chebotarev argument available. Finally, $zeta_p in F$, and taking the dual of $E \[ p \]$ gives the residual $H^1$ realization. Proposition 13 now proves both assertions for $overline(V)_(1 \, p)$. ◻
]

=== 8.3 Simultaneous specialization <simultaneous-specialization>

We have obtained the requisite geometric elements and dealt with the trivial character. It remains to retain the geometric elements at one parameter and arrange that their Frobenius properties hold at all places above a rational prime. Restriction of scalars makes the two conjugate parameter families visible in the same finite Galois cover.

We next record precisely the specialization theorem needed to preserve these finite monodromy images. Allowing a constant field in the cover is essential: the Frobenius primes used below must split in a prescribed field.

#thm([Lemma 8.3.])[
  #emph[Let $W$ be a nonempty open subset of $bb(A)_(bb(Q))^d$, let $D \/ bb(Q)$ be a finite Galois extension, and let $H$ be a finite quotient of $pi_1 \( W \)$ through which the constant-field map factors as 
$ pi_1 \( W \) arrow.r.twohead H arrow.r.twohead "Gal" \( D \/ bb(Q) \) . $

 Prescribe nonempty open subsets of $W \( bb(Q)_r \)$ for finitely many rational primes $r$. There is a point $x in W \( bb(Q) \)$ in all the prescribed opens for which the specialization map $s_x : G_(bb(Q)) arrow.r H$ is surjective. For this point, 
#[#set math.equation(numbering: n => "(8.4)")
 $ s_x \( G_D \) = ker #scale(x: 120%, y: 120%)[\(] H arrow.r "Gal" \( D \/ bb(Q) \) #scale(x: 120%, y: 120%)[\)] . $ <res:constant-kernel>]

]
] <res:finite-specialization>

#proof[
  The quotient $H$ defines a connected finite $acute(e) t a l e$ Galois cover of $W$. Hilbert irreducibility with weak approximation gives a rational point in the prescribed local opens for which its fiber is connected; see #cite(label("SerreHilbert")) Proposition 3.3.1 and Theorem 3.5.3. Connectedness of this Galois fiber is equivalent to surjectivity of $s_x$. Geometric connectedness of the cover is not required. The composition of $s_x$ with $H arrow.r "Gal" \( D \/ bb(Q) \)$ is the usual restriction map of absolute Galois groups. Consequently, an element of $H$ in the displayed kernel has a preimage in $G_D$, which proves (8.4). ◻
]

#thm([Proposition 8.4.])[
  #emph[Let $S_K$ be a finite set of finite places of $K$ containing all places above $3 p$. For each $v_0 in S_K$, prescribe a nonempty open subset $Omega_(v_0) subset U \( K_(v_0) \)$. There exists a single $t in U \( K \)$ lying in every $Omega_(v_0)$ such that the following assertions hold over $F = K \( mu_(3 p) \)$.]
  + #emph[For each $\( m \, ell \)$ in (8.1) and each character $theta$ of order $m$, the representation $overline(V)_(theta \, ell)$ is absolutely irreducible on $G_(F \( zeta_ell \))$ and is decomposed generic.]
  + #emph[The representation $overline(V)_(1 \, p)$ has these same two properties at $p$.]
  + #emph[The elliptic curve $A_t = "Jac" \( C_3 \( t \) \/ chevron.l w chevron.r \)$ is non-CM.]
  #emph[In particular, when the opens above $3 p$ are those of Proposition 24, this same parameter also satisfies all the local conclusions of Corollary 25.]
] <res:specialization>

#proof[
  Put
  $ W = "Res"_(K \/ bb(Q)) U . $
  Since $U$ is an open subset of $bb(A)_K^1$, the scheme $W$ is an open subset of $bb(A)_(bb(Q))^2$. Choose a finite Galois extension $D \/ bb(Q)$ containing $F$ and $zeta_ell$ for every residual characteristic in (8.1). Let $c$ be the nontrivial automorphism of $K \/ bb(Q)$, and write $U^c$ and $cal(C)_m^c$ for the conjugate parameter open and curve family. Then
  $ W_D tilde.eq U_D times \( U^c \)_D . $
  For all three pairs, pull back the finite local system $H^1 \( C_m \, bb(F)_ell \)$ from the first factor and $H^1 \( C_m^c \, bb(F)_ell \)$ from the second.
  Their joint monodromy has finite image on $pi_1 \( W_D \)$. Take the normal core, in $pi_1 \( W \)$, of the common kernel of these actions. It is an open normal subgroup contained in $pi_1 \( W_D \)$. The resulting finite quotient $H$ of $pi_1 \( W \)$ records every listed action and has a quotient $"Gal" \( D \/ bb(Q) \)$.
  Over $bb(C)$, a loop in either parameter factor acts trivially on local systems pulled back from the other factor. Thus the geometric monodromy transformations of Lemma 26 are available independently in both factors. In particular, for each fixed pair $\( m \, ell \)$ we can choose an element $h_(m \, ell)$ of the image of geometric monodromy that is regular semisimple on every nontrivial character space in both factors. To obtain it, take a product of the two factor loops furnished by that lemma. Every such element maps trivially to $"Gal" \( D \/ bb(Q) \)$. The quotient also contains the individual opposite unipotents on every character space.
  The prescribed local conditions are compatible with this restriction of scalars. For a rational prime $r$ one has
  $ W \( bb(Q)_r \) = product_(v_0 divides r) U \( K_(v_0) \) . $
  The sets $Omega_(v_0)$ therefore specify nonempty open subsets of $W \( bb(Q)_r \)$ for the finitely many relevant $r$; at unprescribed factors impose no additional condition. Apply Lemma 28. It gives a point $x in W \( bb(Q) \)$, equivalently $t in U \( K \)$, satisfying all these local conditions and inducing a surjection $G_(bb(Q)) arrow.r H$. Over $D$, this point has coordinates $\( t \, t^c \)$ in the displayed product. Smooth proper base change identifies the specialized local systems with the residual cohomology of $C_m \( t \)$ and $C_m^c \( t^c \)$.
  By (8.4), every geometric monodromy element used above is the image of an element of $G_D$. The opposite unipotents therefore survive on each specialized character space already over $G_D$, and prove its absolute irreducibility. Since $G_D subset G_(F \( zeta_ell \))$, this also proves absolute irreducibility on the latter group. Because $ell divides.not m$, taking rotation eigenspaces in integral cohomology of $C_m$ commutes with reduction after adjoining the character values. These specialized character spaces are thus reductions of $V_(theta \, ell)$. The rational identifications and independence of semisimplified reduction in Section 5 show that they give precisely $overline(V)_(theta \, ell)$, including when this system is defined using $C_n$.
  To establish decomposed genericity, fix a pair $\( m \, ell \)$ and choose a preimage $g in G_D$ of $h_(m \, ell)$. An element $sigma in G_(bb(Q))$ preserves or exchanges the two specialized covers $C_m \( t \)$ and $C_m^c \( t^c \)$, according to its restriction to $K$; it also permutes the rotation characters through its action on the roots of unity. The action of $sigma g sigma^(- 1)$ on a character space of the first cover is therefore conjugate to the action of $g$ on some character space of one of the two covers. The construction imposed regular semisimplicity on all these spaces, so the property holds for every such conjugate.
  The kernel of the surjective specialization $G_(bb(Q)) arrow.r H$ defines a finite Galois extension of $bb(Q)$. It contains $D$. Chebotarev applied to the conjugacy class of $h_(m \, ell)$ in this extension gives rational primes $q$ whose Frobenius class is that class. They split completely in $D$, since $h_(m \, ell)$ is trivial on $D$. Discard $q = ell$ and the finitely many primes where the curves or residual representations are ramified. For every $v divides q$ of $F$, its Frobenius is represented by a conjugate of the selected element, and acts regular semisimply on each required character space. Here the residue degree is one because $q$ splits in $F$. Moreover, $q equiv 1 med \( mod med ell \)$ because $zeta_ell in D$. Thus the ratio of the two Frobenius eigenvalues is different from $q$ in characteristic $ell$, at every $v divides q$. This is exactly decomposed genericity. A different $q$ may be used for each pair, as the definition permits. Assertion (2) follows from Lemma 27.
  It remains to exclude CM for $A_t$. For $\( m \, ell \) = \( 3 \, p \)$ the preceding specialization places two opposite nonidentity unipotents in the residual image of $V_(eta \, p)$. Proposition 13 identifies this with the residual cohomology of $A_t$: both are irreducible, so their common semisimplification is the representation itself. If $A_t$ had CM, all its endomorphisms would be defined over an extension of $F$ of degree at most two. Over that extension, the characteristic-zero Galois image lies in the commutative centralizer of the CM algebra. Its reduction is abelian as well. Consequently the full residual image would have an abelian normal subgroup of index at most two.
  Each of the two unipotents has the odd prime order $p$, so both would belong to that abelian subgroup. But
  $ mat(delim: "(", 1, a; 0, 1) mat(delim: "(", 1, 0; b, 1) eq.not mat(delim: "(", 1, 0; b, 1) mat(delim: "(", 1, a; 0, 1) #h(2em) \( a b eq.not 0 \) . $
  This contradiction proves (3). Finally, the local assertions follow by choosing the prescribed opens as in Proposition 24; the Hilbert specialization was made inside all those opens. ◻
]

== 9 Propagation of automorphy and descent <sec:automorphy>

We now fix a parameter $t in U \( K \)$ supplied by Proposition 29, taking the local open sets of Proposition 24. Write $B = B_t$. The four systems $V_eta \, V_chi \, V_psi \, V_1$ have the congruences of Corollary 15, the local properties of Corollary 25, and the residual properties proved in Section 8. We first explain why automorphy at one coefficient prime supplies the information needed at the next one.

=== 9.1 Coefficient primes and local automorphic conditions <coefficient-primes-and-local-automorphic-conditions>

#thm([Lemma 9.1.])[
  #emph[Suppose a weight-zero regular algebraic cuspidal representation $pi$ of $"GL"_2 \( bb(A)_F \)$ realizes one member of the compatible system $V_theta$. Then it realizes every member, using the compatible coefficient embeddings fixed in Section 5.]
] <aut:transport>

#proof[
  At all places outside a finite set and away from the coefficient prime, the characteristic polynomial of Frobenius on $V_theta$ is independent of that prime, as an algebraic polynomial with the fixed embeddings of the character values. The good-place characteristic polynomials of $r_iota \( pi \)$ have the same compatibility. Equality at the original prime therefore identifies the polynomials at every other prime. Both representations are semisimple: for $V_theta$ this follows from Faltings’ theorem as in Proposition 12, and the automorphic Galois representations are taken semisimple. Chebotarev density and the Brauer–Nesbitt theorem give the asserted isomorphism. ◻
]

The next lift also requires information about the local automorphic components at the new coefficient prime. We recover it by applying Varma’s comparison at a different coefficient prime, where it applies directly to the local Weil representation.

#thm([Lemma 9.2.])[
  #emph[Suppose that a weight-zero regular algebraic cuspidal representation $pi$ of $"PGL"_2 \( bb(A)_F \)$ realizes $V_theta$. Let $l in { 3 \, p }$ and $v divides l$, and write $J_t = "Jac" \( C_n \( t \) \)$.]
  #{ set enum(numbering: "i."); [
  + #emph[If $J_t$ has potentially good reduction at $v$, then $"rec"_(F_v) \( pi_v \)$ has zero monodromy.]
  + #emph[If $J_t$ acquires semistable reduction of toric rank $n$ at $v$, then $pi_v$ is a quadratic or trivial twist of the Steinberg representation, and $pi$ is $iota_l$-ordinary of weight zero at $v$.]
] }
] <aut:automorphic-local>

#proof[
  Choose a coefficient prime $a$ different from the residue characteristic $l$. Lemma 30 identifies $r_(iota_a) \( pi \)$ with $V_(theta \, a)$. Varma’s local-global compatibility theorem identifies the underlying semisimplified Weil representations of its local Weil–Deligne parameter and $"rec"_(F_v)^T \( pi_v \)$ #cite(label("Varma")) Theorem 1. We use this statement about the Weil representations first; equality of the monodromy operators is not assumed.
  In the potentially good case, pass to an extension where the Jacobian has good reduction. All Frobenius eigenvalues on its $H^1$, and hence on the character summand, have complex absolute value the square root of the residue cardinality. Taking a positive power of Frobenius shows that the two eigenvalues before this extension also have the same absolute value. A rank-two Weil–Deligne representation with nonzero monodromy has Frobenius eigenvalues differing by the norm character. They cannot have the same absolute value. Thus the automorphic parameter has zero monodromy. The Tate twist in (2.1) does not change this conclusion.
  In the totally toric case, Corollary 25 gives nonzero monodromy on $V_(theta \, a)$. Its semisimplified Weil representation is therefore a sum of two characters differing by the norm. For this Weil representation, the two possibilities under the local Langlands correspondence for $"GL"_2$ are the special parameter with nonzero monodromy and the zero-monodromy parameter of a one-dimensional local representation. The latter is not generic. Since every local component of a cuspidal automorphic representation of $"GL"_2$ is generic, $pi_v$ is a twist of Steinberg. Its central character is trivial, so the twisting character has square one.
  The local calculation in the proof of #cite(label("CN")) Lemma 6.1.3(4), which invokes the proof of #cite(label("Geraghty")) Lemma 5.6, shows that a quadratic twist of Steinberg is $iota_l$-ordinary of weight zero. This calculation uses only the stated local representation and trivial central character. In particular, it also applies when the quadratic character is ramified: the ordinary condition is imposed at a sufficiently deep level, and a finite-order twist multiplies the relevant normalized Hecke eigenvalues by units. ◻
]

=== 9.2 The three lifts <the-three-lifts>

#thm([Proposition 9.3.])[
  #emph[The elliptic curve $B \/ F$ is modular. More precisely, $H^1 \( B \)$ is realized by a cuspidal weight-zero regular algebraic representation of $"PGL"_2 \( bb(A)_F \)$.]
] <aut:over-F>

#proof[
  The order-three system $V_eta$ is $H^1 \( A \)$ for the elliptic curve $A \/ F$ of Proposition 13. It is non-CM by Proposition 29. Its mod-$5$ representation is decomposed generic and absolutely irreducible over $F \( zeta_5 \)$ by the $\( m \, l \) = \( 3 \, 5 \)$ part of that proposition. Since $zeta_5 in.not F$, Theorem 18 supplies a cuspidal weight-zero representation of $"PGL"_2 \( bb(A)_F \)$ realizing $V_eta$.
  Apply Theorem 17 in the following order:
  #[
  #set par(justify: false)
#table(
  columns: 4,
  align: (center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Automorphic input
], table.cell(rowspan: 1, colspan: 1)[Coefficient prime
], table.cell(rowspan: 1, colspan: 1)[System lifted
], table.cell(rowspan: 1, colspan: 1)[Residual input
]),
  table.cell(rowspan: 1, colspan: 1)[$V_eta$
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$V_chi$
], table.cell(rowspan: 1, colspan: 1)[$\( m \, l \) = \( 3 \, p \)$
],
  table.cell(rowspan: 1, colspan: 1)[$V_chi$
], table.cell(rowspan: 1, colspan: 1)[$3$
], table.cell(rowspan: 1, colspan: 1)[$V_psi$
], table.cell(rowspan: 1, colspan: 1)[$\( m \, l \) = \( p \, 3 \)$
],
  table.cell(rowspan: 1, colspan: 1)[$V_psi$
], table.cell(rowspan: 1, colspan: 1)[$p$
], table.cell(rowspan: 1, colspan: 1)[$V_1$
], table.cell(rowspan: 1, colspan: 1)[$H^1 \( B \) med mod med p$
],
)
]
  In each row Corollary 15 identifies the residual representations, and Proposition 29 gives decomposed genericity and absolute irreducibility over the cyclotomic extension. Proposition 12 supplies the determinant, finite ramification, potential semistability, and labeled Hodge–Tate weights. Lemma 30 makes the previously obtained automorphy available at the coefficient prime of the next row.
  It remains to check the local hypotheses at that prime. At a place of potentially good ordinary type, both systems in the row are potentially crystalline and potentially ordinary of weight zero. At a place of potentially good supersingular type, they are potentially crystalline and neither is potentially ordinary of weight zero. These assertions follow from Corollary 25. In either case Lemma 31(i) gives zero monodromy in the input automorphic parameter. At a place of potentially totally toric type, neither Galois representation is potentially crystalline, and Lemma 31(ii) gives automorphic ordinarity. Thus the relevant alternative of Theorem 17 holds at every place above the coefficient prime.
  The theorem therefore applies in all three rows. Its conclusion preserves cuspidality, weight zero, and trivial central character, so each row provides the input required for the next. The last row gives automorphy of $V_1 = H^1 \( B \)$. ◻
]

=== 9.3 Descending to the original field <descending-to-the-original-field>

We recall why automorphy over the cyclotomic extension suffices here. The character adjustment in the following argument is important: it identifies the descended Galois representation with the prescribed one.

#thm([Lemma 9.4.])[
  #emph[Let $L' \/ L$ be a cyclic extension of prime degree between CM fields. Let $r : G_L arrow.r "GL"_2 \( overline(bb(Q))_l \)$ be a continuous representation whose restriction to $G_(L')$ is absolutely irreducible. Suppose that this restriction is realized by a cuspidal weight-zero regular algebraic representation $Pi$ of $"GL"_2 \( bb(A)_(L') \)$. Then $r$ is realized by a cuspidal weight-zero regular algebraic representation of $"GL"_2 \( bb(A)_L \)$.]
] <aut:descent>

#proof[
  For $sigma in "Gal" \( L' \/ L \)$, the representations $Pi^sigma$ and $Pi$ have the same good-place Hecke polynomials, because the associated Galois representation extends to $G_L$. Strong multiplicity one makes $Pi$ Galois invariant. The cyclic base-change theorem therefore gives a cuspidal automorphic representation $pi$ of $"GL"_2 \( bb(A)_L \)$ whose base change is $Pi$ #cite(label("LanglandsBC")) #cite(label("ArthurClozel")). Every archimedean place is complex, so its local extension is trivial. Consequently $pi$ is regular algebraic of weight zero.
  Good-place compatibility with base change and Chebotarev imply
  $ #scale(x: 120%, y: 120%)[\(] r_iota \( pi \) \|_(G_(L')) #scale(x: 120%, y: 120%)[\)]^(upright("ss")) tilde.eq r \|_(G_(L')) . $
  The right-hand side is absolutely irreducible. The restriction on the left is therefore already irreducible and isomorphic to it, without semisimplification. After choosing this isomorphism, the two representations agree on $G_(L')$. For $g in G_L$, their matrices at $g$ differ by a scalar, since they induce the same conjugation on the absolutely irreducible representation of $G_(L')$. Schur’s lemma shows that these scalars form a character $delta : "Gal" \( L' \/ L \) arrow.r overline(bb(Q))_l^times$ and
  $ r_iota \( pi \) tilde.eq r ⊗ delta . $
  The finite-order Hecke character corresponding to $delta^(- 1)$ removes this discrepancy. Twisting preserves cuspidality and weight zero, and the compatibility with Galois twisting follows at good places and hence everywhere by Chebotarev. ◻
]

Since $F \/ K$ is abelian, choose a tower from $K$ to $F$ with cyclic prime-degree steps. Each intermediate field is abelian over $bb(Q)$ and contains the imaginary quadratic field $K$, hence is CM. The representation $H^1 \( B \, overline(bb(Q))_p \)$ remains absolutely irreducible over $F$: its residual representation is already absolutely irreducible there. Apply Lemma 33 down the tower to Proposition 32. This gives automorphy of $B \/ K$. Finally, $B$ is the quadratic twist of $E$ by $h \( t \)$, so twisting the automorphic representation by the same quadratic Hecke character gives a cuspidal weight-zero representation $pi_E$ realizing $H^1 \( E \)$.

=== 9.4 Local parameters and the CM case <local-parameters-and-the-cm-case>

For non-CM $E$, Theorem 19 shows that $pi_E$ has trivial central character, realizes $H^1 \( E \)$ for every coefficient prime, and has the required Frobenius-semisimplified Weil–Deligne parameter at each finite place, by choosing a coefficient prime different from the residue characteristic. Thus every finite local $L$-factor matches. At infinity a cuspidal representation is generic. The archimedean classification with weight-zero infinitesimal character therefore gives exactly the parameter (2.2); the finite-dimensional alternative is not generic. Equations (2.1) and (2.3) give the stated normalization of the local and global $L$-functions.

Suppose now that $E$ has complex multiplication by an imaginary quadratic field $M$. Its endomorphisms are defined over $K M$. One way to see this is to use their faithful action on invariant differentials: the eigenvalues lie in $M$, and are fixed by $G_(K M)$. The main theorem of complex multiplication expresses the two one-dimensional constituents of $H^1 \( E \) \|_(G_(K M))$ as the realizations of algebraic Hecke characters, with the infinity types prescribed by the CM type #cite(label("ShimuraCM")).

If $M subset.not K$, Galois exchanges the two characters and $H^1 \( E \)$ is induced from either one over the quadratic extension $K M \/ K$. Automorphic induction gives the required representation of $"GL"_2 \( bb(A)_K \)$. If $M = K$, use the isobaric sum of the two characters. In either case normalize the resulting representation by $\| det \|^(1 \/ 2)$ so that its Tate-normalized parameter realizes $H^1 \( E \)$. Complex multiplication and local class field theory, together with local compatibility of quadratic automorphic induction in the first case, give the finite parameters and the prescribed infinity types. These are the CM alternatives allowed in Theorem 1. Their central character is trivial: the determinant of $H^1 \( E \)$ is $epsilon.alt_l^(- 1)$, so undoing the Tate normalization gives determinant one for the local automorphic parameters, and hence trivial central character.

In both the CM and non-CM cases, the finite factors also agree if one uses the Weil–Deligne representation at the residue-characteristic coefficient prime. For good reduction this follows from crystalline comparison. For bad potentially good reduction, the Weil–Deligne inertia action is finite and nontrivial, and monodromy is zero. The inertia action has determinant one. Its invariant subspace cannot have dimension one, since a semisimple two-dimensional determinant-one representation with a nonzero fixed vector would be trivial. It therefore has no invariants, giving local factor one. At the residue-characteristic coefficient prime, nontriviality of inertia follows from the crystalline good-reduction criterion #cite(label("ColemanIovita")). Finally, in the potentially multiplicative case the Tate-curve description, allowing a quadratic twist, gives the same special Weil–Deligne parameter at all coefficient primes. This completes the proof of Theorem 1.


#bibliography("refs.bib", style: "ieee", title: [References])
