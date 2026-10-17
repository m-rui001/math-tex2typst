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

#align(center)[#text(size: 16pt, weight: "bold")[The $E times upright(C M)$ component of Zilber--Pink \
for curves in $cal(A)_2$]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Let $cal(A)_2$ be the coarse moduli variety of principally polarized abelian surfaces. Its dimension is three. The Zilber–Pink conjecture predicts that a Hodge-generic curve has only finitely many intersections with the union of special subvarieties of codimension at least two. Among these special subvarieties are the $E times upright("CM")$ curves: one elliptic factor varies, the other has complex multiplication, and one allows all polarized Hecke translates. Here and below, special subvarieties are Shimura special subvarieties, including their Hecke translates. For $s in cal(A)_2 \( bb(C) \)$, write $A_s$ for a principally polarized abelian surface representing its moduli point. An elliptic curve has CM if its geometric endomorphism algebra is an imaginary quadratic field. In a threefold, a curve and a codimension-two subvariety have negative expected intersection dimension. The conjecture controls the exceptional intersections even as the special subvariety varies. It belongs to the unlikely-intersection framework initiated by Zilber’s atypical-intersection conjectures in semiabelian varieties [24] and formulated for mixed Shimura varieties by Pink [18] Conjecture 1.3.

#thm([Theorem 1.1.])[
  #emph[Let $C subset cal(A)_2$ be a reduced, irreducible, closed algebraic curve defined over $overline(bb(Q))$. Suppose that $C$ is Hodge generic, meaning that it is contained in no proper special subvariety of $cal(A)_2$. Then the set 
$ { s in C \( overline(bb(Q)) \) : A_s upright(" is isogenous to ") E_1 times E_2 upright(" with at least one ") E_i upright(" having CM") #scale(x: 120%, y: 120%)[}] $

 is finite.]
] <thm:main>

The isogenies in Theorem 1 are isogenies of abelian varieties; they are not required to respect the given polarization. All isogeny degrees, imaginary quadratic fields, and endomorphism orders are included, as is the case of two CM factors. There is no assumption on the boundary of $C$, on an integral base point, or on reduction at any finite prime. Thus Theorem 1 resolves positively the $E times upright("CM")$ component of Zilber–Pink for Hodge-generic curves in $cal(A)_2$.

Daw and Orr proved this finiteness statement for curves whose closure meets the zero-dimensional stratum of the Baily–Borel boundary [3] Theorem 1.1. They also proved that, without this boundary hypothesis, a suitable lower bound for Galois orbits suffices [3] Theorem 1.2. Their later work proves full Zilber–Pink for curves in $cal(A)_2$ under the same zero-dimensional-boundary hypothesis [4] Corollary 1.2. Papas obtains height and finiteness results for Hodge-generic families having an interior fiber isogenous to a square of a non-CM elliptic curve or to a product of one CM and one non-CM elliptic curve. That fiber must have potentially good reduction at every finite place, and the finiteness statement imposes a uniform bound on the number of supersingular places of proximity [13] Theorem 1.5 and Corollary 1.6. The both-CM case follows from André–Oort for $cal(A)_2$, proved by Pila and Tsimerman [15] Theorem 1.1 and included in Tsimerman’s general theorem for $cal(A)_g$ [23] Theorem 5.3. Our task is to supply the orbit bound for the entire mixed locus. We call a point #emph[mixed] when its abelian surface is isogenous to a product of one CM and one non-CM elliptic curve.

The passage from Galois orbits to finiteness is an instance of the strategy of Pila and Zannier [17]: compare arithmetic lower bounds for Galois orbits with the subpolynomial bounds in the Pila–Wilkie theorem [16]. Daw–Orr establish the required geometric and counting implication for this locus. The arithmetic estimates here use the theory of periods and minimal abelian subvarieties developed by Masser and Wüstholz [10], in the arbitrary-polarization form of Gaudron and Rémond [6]. The degeneration argument uses the integral compactifications of Faltings–Chai and Lan [5,8], within the reduction and monodromy framework of Grothendieck [7] and Tate’s explicit elliptic uniformization [22].

There are two arithmetic ingredients. First, the product-isogeny description of Daw–Orr [3] Lemmas 2.1 and 3.2 gives a mixed principally polarized surface a canonical graph presentation

$ E times F arrow.r A \, #h(2em) deg \( E times F arrow.r A \) = n^2 \, $

where $E$ is non-CM, $F$ is CM, and the pullback polarization is $n$ times the product polarization. At a finite place where $E$ is a Tate curve, the rank-one degeneration length of $A$ is $log \| j_E \| \/ n$. Combining this reciprocal factor with the height machine on a fixed curve gives

#[#set math.equation(numbering: n => "(1.1)")
 $ h \( j_E \) lt.double_C n \( 1 + sqrt(D) \) \, #h(2em) D = lr(|"disc" "End" \( F \)|) \, $ <eq:intro-height>]

for all sufficiently large $n$. The argument works both when the curve meets the boundary and when it does not.

Second, we use the gluing data to construct an abelian threefold isogenous to $E^2 times F$, with an essential period involving both periods of $E$. A weighted polarization balances their possibly very different lengths. The period theorem of Gaudron and Rémond then produces a factor $n^(4 \/ 3)$, which exceeds the linear dependence on $n$ in (1.1). This construction and the uniform height estimate are the additional inputs beyond the existing unlikely-intersection theorem.

We obtain the following explicit, deliberately coarse form of the arithmetic conclusion. At a mixed point $s$, let $N \( s \)$ be the minimum degree of an isogeny from an elliptic product to $A_s$. The CM factor in a product attaining this minimum is unique up to isomorphism; this will be proved in Lemma 6. Write

$ frak(c) \( s \) = max { N \( s \) \, thin \| "disc" "End" \( F \) \| } . $

#thm([Theorem 1.2.])[
  #emph[Let $C$ be as in Theorem 1, and let $K$ be a number field over which it is defined. There is a constant $c > 0$, depending on $C$ and $K$, such that every mixed point $s in C \( overline(bb(Q)) \)$ satisfies 
$ \# #scale(x: 120%, y: 120%)[\(] "Gal" \( overline(bb(Q)) \/ K \) dot.op s #scale(x: 120%, y: 120%)[\)] gt.eq c thin frak(c) \( s \)^(1 \/ 42) . $

]
] <thm:orbits>

The proof below uses Siegel’s potentially ineffective class-number bound. Remark 5 gives an effective alternative for that input alone; we make no effectivity claim for the constants in Theorem 2. The exponent records the positive power needed by the counting theorem; its optimization is not needed here. Section 2 fixes the height and period normalizations and collects the CM estimates. Section 3 proves the canonical gluing description and its reciprocal degeneration formula. Section 4 turns that formula into the height bound on the fixed curve, treating an empty boundary separately. Section 5 constructs and balances the essential period. Section 6 combines the estimates to prove Theorem 2, and Section 7 applies the corrected Daw–Orr implication and André–Oort.

== 2 Heights, periods, and CM elliptic curves <sec:tools>

=== 2.1 Conventions <conventions>

Endomorphism rings and homomorphism groups are geometric unless a ground field is indicated. All heights are absolute logarithmic heights. We write $h \( j_P \)$ for the usual height of the $j$-invariant of an elliptic curve $P$, and $h_(upright(F)) \( B \)$ for stable Faltings height. Set $h_(upright(F))^(+) \( B \) = max { 1 \, h_(upright(F)) \( B \) }$. For a line bundle $L$ on a $g$-dimensional abelian variety, $deg_L B = c_1 \( L \)^g \[ B \]$. Thus a principal polarization has degree $g !$ in this convention. The associated period norm is the norm of its positive Hermitian form.

For an elliptic curve with its principal polarization, choose a period basis $e \, e tau$ with $tau$ in the standard closed fundamental region. Writing $y = Im tau$, one has

#[#set math.equation(numbering: n => "(2.1)")
 $ y gt.eq sqrt(3) \/ 2 \, #h(2em) parallel e parallel^2 = 1 \/ y \, #h(2em) parallel e tau parallel^2 = \| tau \|^2 \/ y lt.double y . $ <eq:elliptic-norms>]

The Fourier expansion of $j$, together with compactness away from the cusp, gives

#[#set math.equation(numbering: n => "(2.2)")
 $ lr(|log^(+) \| j \( tau \) \| - 2 pi y|) lt.double 1 . $ <eq:j-y>]

Constants in these two formulas are absolute. Other implicit constants may depend on a fixed curve, family, and ground field, but never on a varying point or its field of definition.

For a number field $k$, absolute values at finite places extend the standard absolute values on $bb(Q)$; they are not renormalized after a field extension. Heights are sums with weights $\[ k_v : bb(Q)_v \] \/ \[ k : bb(Q) \]$. Equivalently, the archimedean contribution is the average over all complex embeddings, with conjugate embeddings counted separately.

=== 2.2 Two established height and period estimates <two-established-height-and-period-estimates>

We use product additivity and the isogeny inequality for stable Faltings height:

#[#set math.equation(numbering: n => "(2.3)")
 $ h_(upright(F)) \( B_1 times B_2 \) = h_(upright(F)) \( B_1 \) + h_(upright(F)) \( B_2 \) \, #h(2em) \| h_(upright(F)) \( B_1 \) - h_(upright(F)) \( B_2 \) \| lt.eq 1 / 2 log deg phi.alt $ <eq:faltings-isogeny>]

for an isogeny $phi.alt : B_1 arrow.r B_2$; see [6] §2.3. For elliptic curves, $h_(upright(F))$ is bounded below and

#[#set math.equation(numbering: n => "(2.4)")
 $ 1 + h \( j_P \) asymp 1 + h_(upright(F))^(+) \( P \) . $ <eq:elliptic-height>]

These are stable-height statements, so passing to a semistable extension does not change the heights. For the comparison with $j$-height, see Silverman [21] Proposition 2.1 and the normalization recorded in [9] Proposition 3.1.

#thm([Lemma 2.1.])[
  #emph[Let $cal(X) arrow.r S$ be a fixed principally polarized abelian scheme over a smooth curve defined over a number field, and let $macron(S)$ be its smooth projective completion. If $H$ is an ample divisor on $macron(S)$, and $h_H$ is shifted to be nonnegative, then 
$ h_(upright(F))^(+) \( cal(X)_t \) lt.double 1 + h_H \( t \) #h(2em) \( t in S \( overline(bb(Q)) \) \) . $

]
] <lem:family-height>

#proof[
  After a fixed finite cover and restriction to a dense open, choose a symmetric ample line bundle representing the polarization and theta data as in [14] §2.3, for one fixed even integer $r gt.eq 2$. This is possible by choosing the data over a finite extension of the function field and spreading out. The theta-null map is an algebraic map to projective space. Pazuki’s theta/Faltings comparison [14] Theorem 1.1 and Corollary 1.3 gives $h_(upright(F))^(+) lt.double 1 + h_Theta$, with constants depending only on the dimension and the fixed theta level.
  The theta-null map extends to the smooth projective covering curve. If $p$ is the covering map and $T$ is the pullback of the hyperplane divisor, choose an integer $a$ such that $a p^(*) H - T$ is ample. Its height is bounded below, so the height machine gives $h_Theta lt.eq a h_H compose p + O \( 1 \)$. This proves the asserted bound after lifting $t$; stable Faltings height is unchanged by the lift. The finite set omitted when choosing the data can be included by enlarging the constant. ◻
]

Call a nonzero period $omega$ of a complex abelian variety #emph[essential] if it belongs to the Lie algebra of no proper abelian subvariety. For a polarized abelian variety $\( B \, L \)$ of dimension $g$ over a number field $k$, and an essential period $omega$ at one complex embedding of $k$, [6] Theorem 1.2 gives

#[#set math.equation(numbering: n => "(2.5)")
 $ frac(\( deg_L B \)^(1 \/ g), parallel omega parallel_L^2) lt.double_g \[ k : bb(Q) \] max { 1 \, h_(upright(F)) \( B \) \, log deg_L B } . $ <eq:period-theorem>]

To explain the field-degree factor, let $delta_0 \( B_sigma \, L_sigma \)$ be the least norm of an essential period at the embedding $sigma$, with value $+ oo$ if there is none. The essential-minimum form of their theorem bounds

$ frac(1, \[ k : bb(Q) \]) sum_(sigma : k arrow.r.hook bb(C)) frac(\( deg_L B \)^(1 \/ g), delta_0 \( B_sigma \, L_sigma \)^2) lt.double_g max { 1 \, h_(upright(F)) \( B \) \, log deg_L B } . $

At the chosen embedding, $delta_0 \( B_sigma \, L_sigma \) lt.eq parallel omega parallel_L$. Keeping this one nonnegative summand proves (2.5). The estimate allows arbitrary polarization degree.

=== 2.3 CM estimates <subsec:cm>

#thm([Lemma 2.2.])[
  #emph[Let $k$ be a number field and $F \/ k$ a CM elliptic curve. Set $cal(O) = "End"_(overline(bb(Q))) \( F \)$, $D = \| "disc" cal(O) \|$, and $d = \[ k : bb(Q) \]$. Then 
#[#set math.equation(numbering: n => "(2.6)")
 $ D lt.double d^4 \, #h(2em) h \( j_F \) lt.double 1 + sqrt(D) . $ <eq:cm-bounds>]

 At any complex embedding, choose a reduced period basis $f \, f tau_F$ and put $y_F = Im tau_F$. Then 
#[#set math.equation(numbering: n => "(2.7)")
 $ b = \[ Lambda_F : cal(O) f \] = frac(sqrt(D), 2 y_F) in bb(Z)_(> 0) \, #h(2em) y_F lt.eq sqrt(D) \/ 2 \, #h(2em) b lt.double sqrt(D) . $ <eq:b-index>]

]
] <lem:cm>

#proof[
  The degree of $j_F$ over $bb(Q)$ is the class number $h \( cal(O) \)$, and $j_F$ is an algebraic integer [2] Theorem 11.1 and Proposition 13.2. Write $D = f_0^2 D_0$, where $D_0$ is the absolute discriminant of the maximal order. Siegel’s class-number bound gives $h \( cal(O)_(D_0) \) gt.double D_0^(1 \/ 4)$ [20]. The conductor formula [2] Theorem 7.24 multiplies this by
  $ frac(f_0, \[ cal(O)_(D_0)^times : cal(O)^times \]) product_(p divides f_0) (1 - frac(chi_(- D_0) \( p \), p)) \, $
  which is at least $phi \( f_0 \) \/ 3 gt.double sqrt(f_0)$. Here $chi_(- D_0)$ is the quadratic character of the imaginary quadratic field of discriminant $- D_0$, defined by the Kronecker symbol, and $phi$ is Euler’s totient function. The elementary bound $phi \( f_0 \) gt.eq sqrt(f_0 \/ 2)$ suffices. Thus $d gt.eq h \( cal(O) \) gt.double D^(1 \/ 4)$, including every conductor. The constant may be ineffective.
  The covolume of $cal(O)$ in $bb(C)$ is $sqrt(D) \/ 2$, whereas that of $Lambda_F \/ f = bb(Z) + tau_F bb(Z)$ is $y_F$. Since $cal(O) f subset Lambda_F$, their ratio gives (2.7). The lower bound for $y_F$ in (2.1) gives $b lt.double sqrt(D)$. Finally, (2.2) bounds every archimedean conjugate of $j_F$ by $O \( 1 + sqrt(D) \)$; integrality removes all finite-place contributions. ◻
]

#prodef([Remark 2.3.])[
  (An effective alternative for the CM bound).  The Dirichlet assertion of [11] Theorem 1.1 makes the implied constant in $D lt.double d^4$ effective. Indeed, its zero-free half-plane $"Re" s > 7 \/ 8$ supplies the short real zero-free interval used in [1] proof of Theorem 2, pp. 363–364. The resulting estimate is $L \( 1 \, chi_(- D_0) \) gt.double 1 \/ log \( 2 D_0 \)$, with an effective absolute constant, after handling finitely many small conductors. The Dirichlet class-number formula therefore gives $h \( cal(O)_(D_0) \) gt.double sqrt(D_0) \/ log \( 2 D_0 \) gt.double D_0^(1 \/ 4)$ effectively. The conductor estimate in the preceding proof then yields $d gt.eq h \( cal(O) \) gt.double D^(1 \/ 4)$ with an effective constant for every order. This concerns only the CM discriminant estimate: it does not assert effective Galois-orbit constants or effective finiteness in Theorems 2 and 1.
] <rem:effective-cm>

== 3 Canonical gluing and boundary lengths <sec:gluing>

=== 3.1 The canonical product isogeny <the-canonical-product-isogeny>

We first identify the product and gluing integer intrinsically, so that the subsequent height bounds use the same complexity as the Galois-orbit theorem. The description below follows [3] Lemmas 2.1 and 3.2; we include the argument to make the minimality and field of definition explicit.

#thm([Lemma 3.1.])[
  #emph[Let $\( A \, lambda \)$ be a principally polarized abelian surface over a field of characteristic zero, and suppose that $A$ is isogenous geometrically to the product of a non-CM and a CM elliptic curve. There are unique elliptic subvarieties $E \, F subset A$, with $E$ non-CM and $F$ CM. They are defined over the field of $A$. For some positive integer $n$, addition induces an isogeny 
$ phi.alt : E times F arrow.r A $

 of degree $n^2$, whose pullback polarization is $n$ times the product polarization and whose kernel is the graph of an isomorphism $theta : F \[ n \] arrow.r E \[ n \]$. This isomorphism is defined over the field of $A$. The minimum degree of an isogeny from an elliptic product to $A$ is $n^2$, and its factors are then isomorphic to $E \, F$.]
] <lem:gluing>

#proof[
  The two simple isogeny factors are nonisogenous, so there are no homomorphisms between them. Their images in $A$ are therefore unique elliptic subvarieties. Uniqueness gives descent. The pullback of $lambda$ to $E times F$ is diagonal, say with positive elliptic multipliers $n_E \, n_F$. Comparing degrees of polarizations gives $\| ker phi.alt \| = n_E n_F$. Each projection of the kernel is injective, since $E \, F$ are embedded subvarieties, and
  $ ker phi.alt subset E \[ n_E \] times F \[ n_F \] . $
  Consequently $n_E n_F lt.eq n_E^2$ and $n_E n_F lt.eq n_F^2$, which force $n_E = n_F = n$. The projections then identify the kernel with each full $n$-torsion group. This gives the graph, including its descent.
  Any isogeny $P times Q arrow.r A$ from an elliptic product maps the two factors, in some order, onto $E \, F$. It factors through their addition isogeny, so its degree is at least $n^2$. Equality forces both factor maps to have degree one. ◻
]

The Galois action on the endomorphism ring of a CM elliptic curve has image of order at most two: it acts on its imaginary quadratic endomorphism algebra. Thus, when $A$ is defined over a number field $k_1$, all endomorphisms of $F$ are defined after an extension of $k_1$ of degree at most two. Defining the graph itself requires no such extension.

=== 3.2 The degeneration input <subsec:degeneration>

The new local issue is how the integer $n$ changes the degeneration of the non-CM factor. We first compute the resulting length from semiabelian uniformization, then compare it with the boundary of a fixed integral compactification.

Suppose a principally polarized abelian variety over a complete discretely valued field has split semiabelian reduction. Its uniformization consists of an extension of a good-reduction abelian variety by a split torus, modulo a period lattice $Y$. If $X$ is the character lattice of the torus, a polarization gives a map $Y arrow.r X$, an isomorphism for a principal polarization. The degeneration data carry a functorial valuation pairing

$ Y times X arrow.r bb(R) . $

We use the extended absolute value in defining this pairing. In toric rank one, its value on generators identified by the principal polarization is a positive number, denoted $ell \( A \)$.

#thm([Lemma 3.2.])[
  #emph[In the situation of Lemma 6 over a number field, let $v$ be a finite place. If $E$ has potential good reduction, so does $A$. Otherwise, after an extension giving split semiabelian reduction, 
#[#set math.equation(numbering: n => "(3.1)")
 $ ell \( A \) = frac(log \| j_E \|_v, n) . $ <eq:length>]

]
] <lem:length>

#proof[
  The CM factor has potential good reduction [19] Theorem 6(a); for an elliptic curve this also follows from the integrality of its $j$-invariant. After a finite local extension, it has good reduction and $E$ has either good reduction or split Tate reduction [22] Theorem 1 and Applications. Potential good reduction and rational toric rank are isogeny invariants. It remains to determine the length in the Tate case.
  Functoriality of semiabelian uniformization gives maps of tori and period lattices for $phi.alt : E times F arrow.r A$ [8] Corollary 4.5.5.5. The map of one-dimensional tori is an isomorphism. Indeed, a nontrivial kernel would contain nontrivial roots of unity. Torus torsion injects into the Tate elliptic curve, because its period lattice is torsion free. Such a kernel would therefore give a nonzero point of $ker phi.alt$ in $E times { 0 }$, contradicting the graph description. This reasoning takes place on characteristic-zero generic fibers and does not require $v \( n \) = 0$.
  Write $Y' \, X'$ for the source lattices of $E times F$, with its product principal polarization. Pulling back the polarization means that the composite
  $ Y' arrow.r^(phi.alt_Y) Y_A arrow.r^(lambda_A) X_A arrow.r^(phi.alt_X^(*)) X' $
  is $n lambda_(E times F)$. The last map is an isomorphism by the torus calculation, and the two principal-polarization maps are isomorphisms. Hence $phi.alt_Y$ has absolute multiplier $n$. Functoriality of the valuation pairing,
  $ chevron.l phi.alt_Y y \, x chevron.r = chevron.l y \, phi.alt_X^(*) x chevron.r \, $
  now gives $n ell \( A \) = ell \( E times F \)$. For the Tate parameter $q_E$, the latter equals $- log \| q_E \|_v = log \| j_E \|_v$, by the expansion of $j$ [22] Equation (18). All absolute values are extended from the original field; this is why the calculation is unchanged by the local extension. ◻
]

To use this reciprocal length in a height estimate on the curve, we need to measure it by a boundary divisor on the moduli space. The following comparison provides this link uniformly at finite places.

We specify the part of integral toroidal compactification theory used in the proof. At full symplectic level $m gt.eq 3$, choose a smooth projective toroidal compactification of the Siegel moduli scheme over $bb(Z) \[ zeta_m \, 1 \/ m \]$, with reduced boundary divisor $D_m$. The boundary is an effective relative Cartier divisor.

#thm([Lemma 3.3.])[
  (Integral boundary comparison).  #emph[Fix the level $m$ and compactification above. There are constants $c_m \, C_m > 0$, depending only on these choices, with the following property. Let $k_v \/ bb(Q)_p$ be a finite extension with $p divides.not m$, and let $A \/ k_v$ be a principally polarized abelian surface with full level $m$. Write $lambda_(D_m \, v) \( A \)$ for the model local height of the boundary.]
  + #emph[If $A$ has potential good reduction, then $lambda_(D_m \, v) \( A \) = 0$.]
  + #emph[If $A$ has potential split semiabelian reduction of toric rank one, then 
$ c_m ell \( A \) lt.eq lambda_(D_m \, v) \( A \) lt.eq C_m ell \( A \) . $

]
  #emph[Here $ell \( A \)$ is evaluated after an extension giving split semiabelian reduction. With the absolute value extended from the original field, both sides are unchanged by every further local extension.]
] <lem:boundary-comparison>

#proof[
  Here is the precise chart calculation behind these assertions. The integral toroidal construction is developed in [5]; we use [8] Construction 6.3.1.1 and Theorem 6.4.1.1, with projectivity supplied by [8] Theorem 7.3.3.4. By [8] Theorem 6.4.1.1(2), (5), the completed neighborhood of a stratum is the prescribed torus embedding over an abelian-scheme torsor over a finite étale cover of a lower-dimensional moduli space. The boundary is the reduced relative Cartier normal-crossings divisor of that embedding [8] Theorem 6.4.1.1(3). Its strata pull back scheme-theoretically to the toroidal strata, and their normal coordinates are the toric monomials [8] Proposition 6.3.1.6(1). After trivializing the torus torsor on a smooth cone chart, extend the primitive ray generators to a lattice basis. In the resulting coordinates $q_1 \, dots.h \, q_r$, its reduced-boundary ideal is $\( q_1 dots.h.c q_r \)$; this is the relative toric divisor of [8] Theorem 6.1.2.8(5).
  For a rank-one degeneration, the abelian quotient has good reduction. Its moduli point therefore lies in the interior of this lower-dimensional base. The extension coordinates belong to the abelian-scheme torsor; after a local extension they extend over the valuation ring by properness. This applies equally at ordinary and supersingular points of that base. Thus there is no additional boundary coordinate from the base or extension data.
  The valuation form lies on a rank-one ray of the cone. If a rank-one positive semidefinite form is a positive sum of such forms, each summand vanishes on its kernel and lies on the same ray. Consequently the ray is a face of every cone containing the form. In a smooth cone chart only its primitive normal monomial, say $q_c$, has positive valuation; the other normal monomials are units. Locally the reduced-boundary ideal is therefore $\( q_c \)$, up to a unit. There is no vertical factor: this is the scheme-theoretic toric boundary ideal in a relative normal-crossings chart over $bb(Z) \[ zeta_m \, 1 \/ m \]$, not a comparison only on the generic fiber.
  Finally, [8] Propositions 6.2.5.8(3), 6.2.5.11, and 6.3.1.6(4) identify the tautological ideal-valued toric pairing with the pairing of the semiabelian degeneration. This identifies $- log \| q_c \|$ with $ell \( A \)$ times the fixed rational factor comparing the primitive normal character and the rank-one polarized cusp lattice. Those lattices and their indices are part of the fixed level datum. They do not depend on an isogeny presenting $A$, or on the ramification of its field. There are finitely many cusp types at fixed level, giving the stated two fixed comparison constants. For good reduction the point is interior and every boundary monomial is a unit. Computing these values with the extended absolute value preserves them under every local field extension.
  The integral Siegel model here requires only that $m$ be invertible, including at residue characteristic two. This also follows from the good-prime conditions in [8] Definition 1.4.1.1: for the self-dual symplectic datum over $bb(Z)$, the algebra is $bb(Q)$, the order is $bb(Z)$, and there is no type-D or discriminant exclusion. Later we will use levels $3$ and $4$, so every finite prime is handled by an invertible level. ◻
]

== 4 A uniform height estimate on a curve <sec:height>

Fix a smooth curve $S$ over a number field $K_0$, carrying a principally polarized abelian scheme of relative dimension two with full level divisible by $12$. Let $macron(S)$ be its smooth projective completion. The two level-forgetting maps extend, by properness, to morphisms

$ f_m : macron(S) arrow.r overline(cal(A))_(2 \, m) #h(2em) \( m = 3 \, 4 \) . $

Let $Delta$ be the reduced inverse image of the boundary. Its support is the same at the two levels, because it is characterized by nonzero potential toric rank. It may be empty.

#thm([Proposition 4.1.])[
  #emph[There are constants $c \, n_0 > 0$, depending only on this fixed family, such that at every mixed point $t in S \( overline(bb(Q)) \)$, with the notation of Lemma 6 and $D = \| "disc" "End" \( F \) \|$, 
$ n gt.eq n_0 quad arrow.r.double quad h \( j_E \) lt.eq c thin n \( 1 + sqrt(D) \) . $

]
] <prop:height>

No Hodge-genericity hypothesis is needed for this height estimate. When the boundary is nonempty, a height associated with it controls $h \( j_E \)$, with a logarithmic isogeny error. We will obtain a reverse bound in which $h \( j_E \)$ occurs with coefficient $O \( 1 \/ n \)$, allowing absorption for large $n$. When the boundary is empty, the finite-place estimates and compactness at infinity give the bound directly.

=== 4.1 Uniform local height comparisons <subsec:model>

We first make explicit the uniformity in the height machine. An $M_(K_0)$-bound means constants $c_v$, zero at all but finitely many finite places of $K_0$, inherited at places above $v$ by extension of its absolute value. Their weighted sum is bounded independently of any finite extension of $K_0$.

If $Delta eq.not diameter$, write $f_m^(*) D_m = Delta + R_m$, where $R_m$ is effective. Local heights of effective divisors on a proper variety are bounded below. Functoriality therefore gives

#[#set math.equation(numbering: n => "(4.1)")
 $ lambda_(Delta \, v) \( t \) lt.eq lambda_(D_m \, v) \( f_m \( t \) \) + O_v \( 1 \) . $ <eq:local-comparison>]

If $Delta = diameter$, the generic pullback divisor is zero, so instead

#[#set math.equation(numbering: n => "(4.2)")
 $ lambda_(D_m \, v) \( f_m \( t \) \) = O_v \( 1 \) . $ <eq:zero-comparison>]

These errors are $M_(K_0)$-bounds. At finite places prime to $m$, we may use exactly the model local height described in Lemma 8.

Here is a model justification that also handles the finitely many bad primes of the curve and of its maps. Over $cal(O)_(K_0) \[ 1 \/ m \]$, take a proper model of $macron(S)$, then the closure of the graph of $f_m$ in its product with the fixed integral toroidal compactification. If needed, pass to a fixed further model on which the relevant divisors are Cartier. Models of the same generic divisor differ by vertical divisors at finitely many primes. An effective vertical Cartier divisor $V$ is bounded above by a fixed multiple of the full special fiber: locally a power of the uniformizer lies in the ideal of $V$, and quasi-compactness supplies a common power. Taking positive and negative bounds for vertical discrepancies shows that changing models introduces an error bounded in the extended absolute value. This proves the asserted uniformity even when the point and the ramification of its field vary.

Combining (4.1) with Lemmas 8 and 7, and choosing $m in { 3 \, 4 }$ prime to the residue characteristic, gives, when $Delta eq.not diameter$,

#[#set math.equation(numbering: n => "(4.3)")
 $ lambda_(Delta \, v) \( t \) lt.eq c thin frac(log^(+) \| j_E \|_v, n) + O_v \( 1 \) \, $ <eq:finite-bound>]

with fixed $c$. If $Delta = diameter$, the two-sided comparison in Lemma 8 and (4.2) instead give

#[#set math.equation(numbering: n => "(4.4)")
 $ frac(log^(+) \| j_E \|_v, n) lt.eq O_v \( 1 \) . $ <eq:finite-empty>]

The bounds include the potential-good-reduction case, where the boundary value and $log^(+) \| j_E \|_v$ both vanish.

=== 4.2 An archimedean boundary estimate <an-archimedean-boundary-estimate>

At a complex point, let $rho \( A \)$ be the length of the shortest nonzero period of $A$ for its principal polarization.

#thm([Lemma 4.2.])[
  #emph[If $Delta eq.not diameter$, then at each archimedean place of $K_0$, 
$ lambda_Delta \( t \) lt.double 1 + rho \( A_t \)^(- 2) . $

]
] <lem:arch-boundary>

#proof[
  Work near one point of $Delta$, with disk parameter $z$. After a fixed ramified base change, monodromy on $H_1$ is unipotent and has logarithm $N$ with $N^2 = 0$; this is the monodromy description for a semistable degeneration of abelian varieties [7]. The image of $N$ is isotropic. Choose a rational Lagrangian containing it and contained in $ker N$, and adapt an integral symplectic basis to its primitive lattice. On the universal cover of the punctured disk, the resulting period matrix $Z$ has monodromy
  $ Z mapsto Z + M \, #h(2em) M in "Sym"_2 \( bb(Z) \) . $
  For every $u in bb(Z)^2$, the holomorphic function $q_u = exp \( 2 pi i thin u^t Z u \)$ is single-valued and bounded in absolute value by one. It extends across $z = 0$; its order there is $u^t M u$, by the monodromy of its logarithm. Thus $M$ is positive semidefinite. Writing $q_u = z^(u^t M u)$ times a holomorphic unit, and using the finitely many vectors $e_i \, e_i + e_j$, shows that
  #[#set math.equation(numbering: n => "(4.5)")
   $ Y := Im Z = frac(- log \| z \|, 2 pi) M + R \( z \) \, $ <eq:period-boundary>]
  where $R$ extends harmonically across zero.
  On $ker M$, the form $R \( 0 \)$ is positive definite. For any nonzero real $v$ in that kernel, $v^t R \( z \) v = v^t Y v > 0$ on the punctured disk. If its value at zero were zero, the minimum principle would force this harmonic function to vanish identically. If $M = 0$, the same argument and the holomorphic extension just constructed would extend $Z$ to the interior of Siegel space. Uniqueness of extension to the separated toroidal compactification would contradict the choice of a boundary point. Hence $M eq.not 0$.
  Choose a nonzero integral $w in "im" M$, possible because $M$ is integral. On the orthogonal decomposition $"im" M xor ker M$, the first block of $Y$ grows as a positive definite matrix times $- log \| z \|$, the off-diagonal blocks are bounded, and the kernel block stays positive definite. The Schur-complement formula gives
  $ w^t Y^(- 1) w = O #scale(x: 120%, y: 120%)[\(] \( - log \| z \| \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  This is the squared norm of the period $w$ in $bb(Z)^2 + Z bb(Z)^2$. Therefore $rho \( A_t \)^2 lt.double \( - log \| z \| \)^(- 1)$, and $- log \| z \| lt.double rho \( A_t \)^(- 2)$. The boundary local height is a fixed multiple of $- log \| z \|$ up to a bounded term, also after the fixed ramification. Finitely many such disks, followed by compactness on their complement, prove the lemma. The argument includes both ranks one and two for $M$. ◻
]

#thm([Lemma 4.3.])[
  #emph[At a mixed point, choose reduced elliptic periods at a complex embedding and write $y_E = Im tau_E$, $y_F = Im tau_F$. Then 
$ rho \( A \)^(- 2) lt.eq n y_F + y_E / n \, #h(2em) rho \( A \)^2 lt.eq n / y_E . $

]
] <lem:rho>

#proof[
  Identify Lie spaces using $E times F arrow.r A$. The period lattice of $A$ is an overlattice of $Lambda_E xor Lambda_F$ contained in its $1 \/ n$ multiple, and its Hermitian form is $n$ times the product form. Its intersection with $"Lie" E$ is exactly $Lambda_E$, because the graph kernel has trivial intersection with $E times { 0 }$.
  A period with nonzero $F$-projection has squared norm at least $n dot.op n^(- 2) \/ y_F = 1 \/ \( n y_F \)$. A nonzero period with zero $F$-projection has squared norm at least $n \/ y_E$, and the first reduced period of $E$ attains this value. The two assertions follow. ◻
]

=== 4.3 Proof of Proposition 9 <proof-of-proposition-propheight>

Suppose first that $Delta = diameter$. At every embedding of $K_0$, the image of $macron(S)$ is compact in the interior moduli space. The shortest period length has a positive lower bound on this image. Lemma 11 therefore gives $y_E lt.double n$ at every embedding of a field of definition of the point. Equations (2.2) and (4.4), summed with the normalized local weights, show

$ h \( j_E \) lt.double n . $

This proves the proposition in this case.

Now let $Delta eq.not diameter$. Choose $h_Delta$ shifted to be nonnegative. It is an ample height because $Delta$ is a nonzero effective divisor on a projective curve. Lemmas 10 and 11, together with (2.7), give at the archimedean places

$ lambda_Delta \( t \) lt.double 1 + n sqrt(D) + y_E / n . $

Use (2.2) for $y_E$, add (4.3), and sum. The $M_(K_0)$-bounds give a constant independent of the field. We obtain

#[#set math.equation(numbering: n => "(4.6)")
 $ h_Delta \( t \) lt.eq B (1 + n sqrt(D) + frac(h \( j_E \), n)) $ <eq:height-upper>]

for a fixed $B > 0$.

On the other hand, (2.3) gives $h_(upright(F)) \( E \) + h_(upright(F)) \( F \) lt.eq h_(upright(F)) \( A \) + log n$. The lower bound for elliptic Faltings height, (2.4), and Lemma 3 imply

#[#set math.equation(numbering: n => "(4.7)")
 $ h \( j_E \) lt.eq A_0 #scale(x: 120%, y: 120%)[\(] 1 + h_Delta \( t \) + log n #scale(x: 120%, y: 120%)[\)] $ <eq:height-lower>]

for fixed $A_0 > 0$. Combining (4.6) and (4.7), the coefficient of $h \( j_E \)$ on the right is $A_0 B \/ n$. For $n gt.eq 2 A_0 B$ it can be absorbed. Since $log n lt.double n$, this gives $h \( j_E \) lt.double n \( 1 + sqrt(D) \)$, as claimed. 0◻

== 5 An essential period on a threefold <sec:threefold>

We now extract a stronger power of the gluing index by repeating the non-CM factor. This lets one period vector contain both independent periods of $E$, so no nonzero integer row on $E^2$ can annihilate its $E$-coordinates. Repeated elliptic factors and polarizations adapted to reduced period bases are used in [6] §§7.2–7.3; here the gluing data produce a threefold isogenous to $E^2 times F$. All constructions in this section are over a number field $k$ containing the definitions of $E \, F \, theta$, and all endomorphisms of $F$. Put $d = \[ k : bb(Q) \]$, and fix one complex embedding. Take a reduced basis $e_1 \, e_2$ of $Lambda_E$, and a first reduced period $f$ of $F$. Use $b \, y_F$ from Lemma 4, and put $y = y_E$.

The two squared period lengths of $E$ have sizes $1 \/ y$ and $y$. Weighting the first copy of $E$ by approximately $y^2$ makes their contributions comparable. Weighting $F$ by approximately $y$ then makes the cube root of the product polarization degree grow at the same rate as the squared norm. The remaining gain is the power $n^(4 \/ 3)$ contributed by the quotient.

#thm([Proposition 5.1.])[
  #emph[There is a polarized abelian threefold $\( B \, L \) \/ k$, isogenous to $E^2 times F$, such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ n^(4 \/ 3) lt.double \( b^2 + 1 \) d thin max { 1 \, h_(upright(F)) \( B \) \, log deg_L B } \, $ <eq:threefold-estimate>]

 and 
#[#set math.equation(numbering: n => "(5.2)")
 $ h_(upright(F)) \( B \) lt.eq 2 h_(upright(F)) \( E \) + h_(upright(F)) \( F \) + log n \, #h(2em) deg_L B = 6 n^4 u v \, quad u = ⌈y^2⌉ \, quad v = ⌈⌉ y . $ <eq:B-height-degree>]

]
] <prop:threefold>

#proof[
  We use the index $b$ to realize both points $theta^(- 1) \( b e_i \/ n \)$ as endomorphism images of the common torsion point $f \/ n$. For $i = 1 \, 2$, choose $f_i in Lambda_F$ so that the class of $f_i \/ n$ is $theta^(- 1) \( e_i \/ n \)$. Since $b Lambda_F subset "End" \( F \) f$, there is $beta_i in "End" \( F \)$ with
  #[#set math.equation(numbering: n => "(5.3)")
   $ beta_i f = b f_i . $ <eq:beta>]
  There is no need for $beta_i$ to be invertible on $F \[ n \]$.
  Define
  $ Gamma = { \( theta beta_1 \( p \) \, theta beta_2 \( p \) \, p \) : p in F \[ n \] } \, #h(2em) B = \( E^2 times F \) \/ Gamma . $
  All maps in this expression are defined over $k$. Indeed, the analytically selected $beta_i$ belong to $"End" \( F \)$, all of which is defined over $k$. The last-coordinate projection is inverse to the displayed graph embedding as a group-scheme map. It therefore identifies $Gamma$ with $F \[ n \]$, without any coprimality requirement on $n \, b \, beta_1 \, beta_2$; hence the quotient map $pi : E^2 times F arrow.r B$ has degree $n^2$. The quotient and its map are defined over $k$. Since $Gamma$ is killed by $n$, the quotient property factors multiplication by $n$, over the same field, as
  $ E^2 times F arrow.r^pi B arrow.r^psi E^2 times F \, #h(2em) psi pi = \[ n \] . $
  Since $deg \[ n \] = n^6$, one has $deg psi = n^4$.
  Give the product the line bundle
  $ M = cal(O)_E \( u \[ 0 \] \) times.square cal(O)_E \( \[ 0 \] \) times.square cal(O)_F \( v \[ 0 \] \) \, #h(2em) L = psi^(*) M . $
  These ample line bundles are defined over $k$. Although the integers $u \, v$ were chosen using one embedding, they require no extension of the field. Since $deg_M \( E^2 times F \) = 6 u v$, the degree assertion follows. The height assertion follows from $deg pi = n^2$ and (2.3).
  In the product Lie space, the vector
  $ omega = frac(\( b e_1 \, b e_2 \, f \), n) $
  is a period of $B$. Indeed (5.3) gives $theta beta_i \( f \/ n \) = b e_i \/ n$, precisely the membership condition for the quotient lattice.
  This period is essential with respect to every geometric abelian subvariety. If it lay in the Lie algebra of a proper abelian subvariety of $B_(bb(C))$, the identity component of its inverse image under $pi$ would be a proper abelian subvariety of $E^2 times F$ whose Lie algebra contains the displayed vector. By semisimplicity up to isogeny, such a subvariety is annihilated by a nonzero homomorphism to $E$ or $F$. A homomorphism to $E$ is an integer row $\( a_1 \, a_2 \, 0 \)$, since $"End" \( E \) = bb(Z)$ and $"Hom" \( F \, E \) = 0$; its value on the vector cannot vanish, because $e_1 \, e_2$ are independent over $bb(Z)$. A homomorphism to $F$ acts by a nonzero endomorphism on $f$, and again cannot vanish. A rational homomorphism may be made integral by clearing denominators, which does not affect this argument.
  The identity $pi^(*) L = \[ n \]^(*) M$ gives the norm
  $ parallel omega parallel_L^2 = b^2 u parallel e_1 parallel^2 + b^2 parallel e_2 parallel^2 + v parallel f parallel^2 lt.double \( b^2 + 1 \) y . $
  Here (2.1) bounds $u \/ y$ and $\| tau_E \|^2 \/ y$ by $O \( y \)$, and $v \/ y_F lt.double y$. The factor $n^2$ in the pulled-back metric has cancelled the denominator $n^2$ in the squared norm. At the same time, $\( u v \)^(1 \/ 3) gt.eq y$, so
  $ frac(\( deg_L B \)^(1 \/ 3), parallel omega parallel_L^2) gt.double frac(n^(4 \/ 3), b^2 + 1) . $
  Apply (2.5) to this essential period. ◻
]

#prodef([Remark 5.2.])[
  The large endomorphisms $beta_i$ do not appear in the bound. Their role is to put a specified vector into the quotient lattice, not to bound the degree of a homomorphism. The projection of $Gamma$ to $F \[ n \]$ fixes its order even if either $beta_i$ has a large kernel on $F \[ n \]$.
]

== 6 The Galois orbit bound <sec:orbits>

We apply the preceding estimates to the curve of Theorem 2. Pass to a component of a full-level cover with level divisible by $12$, and normalize it. After choosing a number field $K_0$, enlarged once and for all, this gives a smooth curve $S \/ K_0$ with a family as in Section 4, and a map $S arrow.r C$ of fixed bounded degree over a dense open. Further fixed covers or restrictions used to describe the family have the same property. Only finitely many points of $C$ are omitted. This passage is permitted for a singular $C$ as well.

If $s$ belongs to that dense open, choose a lift $t$ with

$ \[ K_0 \( t \) : bb(Q) \] lt.double \[ K \( s \) : K \] . $

Such a lift exists because the finite fiber has bounded degree, and $K_0 \/ K$ is fixed. By Lemma 6, $E \, F \, theta$ are defined over the field of the fiber. After an extension of degree at most two, all CM endomorphisms are defined too. For the resulting field $k$, put $d = \[ k : bb(Q) \]$; then

#[#set math.equation(numbering: n => "(6.1)")
 $ d lt.double \[ K \( s \) : K \] . $ <eq:field-cost>]

It remains to bound $max { n^2 \, D }$ by a fixed power of $d$.

For $n gt.eq n_0$, Lemma 4 and Proposition 9 give

#[#set math.equation(numbering: n => "(6.2)")
 $ D lt.double d^4 \, #h(2em) b^2 + 1 lt.double d^4 \, #h(2em) h \( j_E \) lt.double n d^2 \, #h(2em) h \( j_F \) lt.double d^2 . $ <eq:coarse-height>]

Let $\( B \, L \)$ be the threefold from Proposition 12. Its height satisfies

$ h_(upright(F)) \( B \) lt.eq 2 h_(upright(F)) \( E \) + h_(upright(F)) \( F \) + log n lt.double n d^2 . $

To bound its polarization degree, use (2.2) at the chosen embedding. A single archimedean contribution to absolute height is at most $d$ times the total, so

$ y lt.double 1 + d thin h \( j_E \) lt.double n d^3 . $

It follows that $log \( 6 n^4 u v \) lt.double 1 + log n + log d lt.double n d^2$. Thus (5.1) and (6.2) give

$ n^(4 \/ 3) lt.double d^4 dot.op d dot.op n d^2 = n d^7 . $

Dividing by $n$ and cubing proves

#[#set math.equation(numbering: n => "(6.3)")
 $ n lt.double d^21 \, #h(2em) max { n^2 \, D } lt.double d^42 . $ <eq:coarse-orbit>]

For the remaining $n < n_0$, the same final bound follows from $D lt.double d^4$ by increasing the constant.

By Lemma 6, $frak(c) \( s \) = max { n^2 \, D }$. Equations (6.1) and (6.3) therefore imply

$ \[ K \( s \) : K \] gt.double frak(c) \( s \)^(1 \/ 42) . $

The degree on the left is the cardinality of the Galois orbit. The finitely many omitted mixed points can be included by reducing the positive constant. This proves Theorem 2. 0◻

== 7 Finiteness on the original curve <sec:finiteness>

We recall exactly the unlikely-intersection implication being used. Daw–Orr [3] Theorem 1.2 proves that a Hodge-generic curve in $cal(A)_2$ has finitely many mixed $E times upright("CM")$ points if their Galois orbits satisfy a power lower bound in the relevant special curve complexity. Their alternative complexity is the maximum of the minimum product-isogeny degree and the endomorphism-ring discriminant of the CM factor in a product attaining that degree; it is polynomially comparable with their original complexity [3] §3, especially Lemmas 3.1 and 3.6. It is exactly $frak(c) \( s \)$ by Lemma 6. Theorem 2 supplies the required bound. No boundary hypothesis is present in this implication.#footnote[We use the corrected version of [3]. Its Lemma 2.3 verifies the Cartan-stability condition required in the corrected reduction-theory input [12].]

The mixed points occurring in the Daw–Orr formulation are algebraic in our setting. Indeed, a mixed complex point lies on an $E times upright("CM")$ special curve defined over $overline(bb(Q))$: start with the diagonal product locus with a fixed CM elliptic coordinate and use the polarized isogeny of Lemma 6 to pass through a Hecke correspondence. Such a special curve meets $C$ in a zero-dimensional set, because $C$ is Hodge generic. These intersection points are algebraic. The elliptic subvarieties and their homomorphisms are then available over $overline(bb(Q))$, by invariance of homomorphisms of abelian varieties under algebraically closed extension. Thus the complex and algebraic mixed loci required here coincide.

The same orbit bound supplies the finitely-generated-field version of Daw–Orr’s hypothesis for this curve over $overline(bb(Q))$. Given a finitely generated field of definition $L subset bb(C)$, let $K$ be a number field of definition of $C$, set $M = L K$, and put $K' = M ∩ overline(bb(Q))$. Then $K'$ is a number field containing $K$, and $M \/ K'$ is regular. For an algebraic point $s$, linear disjointness shows that its $"Aut" \( bb(C) \/ M \)$-orbit has cardinality $\[ K' \( s \) : K' \]$. Theorem 2 applies over $K'$. Since $"Aut" \( bb(C) \/ M \)$ is a subgroup of $"Aut" \( bb(C) \/ L \)$, the required lower bound holds for the latter orbit too.

We conclude that $C$ has finitely many mixed points. If both elliptic factors have CM, their product, and hence every isogenous abelian surface, is of CM type. Its moduli point is special. André–Oort for $cal(A)_2$ gives only finitely many special points on a Hodge-generic curve. Together these two conclusions prove Theorem 1 on $C$ itself. 0◻

#heading(level: 1)[References]
#bibitem([1])[Y.-G. Chen, #emph[On the Siegel--Tatuzawa--Hoffstein theorem], Acta Arith. #strong[130] (2007), 361--367. #link("https://www.impan.pl/shop/en/publication/transaction/download/product/82398")[Publisher's PDF].]
#bibitem([2])[D. A. Cox, #emph[Primes of the Form $x^2 + n y^2$: Fermat, Class Field Theory, and Complex Multiplication], second ed., John Wiley & Sons, Hoboken, NJ, 2013. #link("https://doi.org/10.1002/9781118400722")[doi:10.1002/9781118400722].]
#bibitem([3])[C. Daw and M. Orr, #emph[Unlikely intersections with $E times upright(C M)$ curves in $cal(A)_2$], Ann. Sc. Norm. Super. Pisa Cl. Sci. (5) #strong[22] (2021), 1705--1745. #link("https://doi.org/10.2422/2036-2145.202006_014")[doi:10.2422/2036-2145.202006\_014]. We use the corrected preprint, #link("https://arxiv.org/abs/1902.10483v4")[arXiv:1902.10483v4] (28 May 2021).]
#bibitem([4])[C. Daw and M. Orr, #emph[The large Galois orbits conjecture under multiplicative degeneration], #link("https://arxiv.org/abs/2306.13463v2")[arXiv:2306.13463v2], revised 15 May 2025.]
#bibitem([5])[G. Faltings and C.-L. Chai, #emph[Degeneration of Abelian Varieties], Ergebnisse der Mathematik und ihrer Grenzgebiete (3), vol.~22, Springer-Verlag, Berlin, 1990.]
#bibitem([6])[É. Gaudron and G. Rémond, #emph[Théorème des périodes et degrés minimaux d'isogénies], Comment. Math. Helv. #strong[89] (2014), 343--403. #link("https://doi.org/10.4171/CMH/322")[doi:10.4171/CMH/322].]
#bibitem([7])[A. Grothendieck, #emph[Modèles de Néron et monodromie], with an appendix by M. Raynaud, Exposé IX in #emph[Groupes de monodromie en géométrie algébrique] (SGA~7~I), Lecture Notes in Mathematics, vol.~288, Springer, Berlin, 1972, 313--523. #link("https://doi.org/10.1007/BFb0068694")[doi:10.1007/BFb0068694].]
#bibitem([8])[K.-W. Lan, #emph[Arithmetic Compactifications of PEL-Type Shimura Varieties], London Mathematical Society Monographs Series, vol.~36, Princeton University Press, Princeton, 2013. Numbered references use the #link("https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf")[revised dissertation version] (14 March 2021).]
#bibitem([9])[S. Löbrich, #emph[A gap in the spectrum of the Faltings height], J. Théor. Nombres Bordeaux #strong[29] (2017), 289--305. #link("https://doi.org/10.5802/jtnb.980")[doi:10.5802/jtnb.980].]
#bibitem([10])[D. W. Masser and G. Wüstholz, #emph[Periods and minimal abelian subvarieties], Ann. of Math. (2) #strong[137] (1993), 407--458. #link("https://doi.org/10.2307/2946542")[doi:10.2307/2946542].]
#bibitem([11])[OpenAI, #emph[The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane $upright(R e) \( s \) > 7 \/ 8$], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/paper.pdf")[OAI:The-Quasi-Riemann-Hypothesis-September-30-2026], 2026.]
#bibitem([12])[M. Orr and C. Schnell, #emph[Correction to the article Height bounds and the Siegel property], Algebra Number Theory #strong[17] (2023), 1231--1237. #link("https://doi.org/10.2140/ant.2023.17.1231")[doi:10.2140/ant.2023.17.1231].]
#bibitem([13])[G. Papas, #emph[On the $v$-adic values of $G$-functions I: Splittings in $cal(A)_2$], #link("https://arxiv.org/abs/2510.11806v1")[arXiv:2510.11806v1], 13 October 2025.]
#bibitem([14])[F. Pazuki, #emph[Theta height and Faltings height], Bull. Soc. Math. France #strong[140] (2012), 19--49. #link("https://doi.org/10.24033/bsmf.2623")[doi:10.24033/bsmf.2623].]
#bibitem([15])[J. Pila and J. Tsimerman, #emph[The André--Oort conjecture for the moduli space of abelian surfaces], Compos. Math. #strong[149] (2013), 204--216. #link("https://doi.org/10.1112/S0010437X12000589")[doi:10.1112/S0010437X12000589].]
#bibitem([16])[J. Pila and A. J. Wilkie, #emph[The rational points of a definable set], Duke Math. J. #strong[133] (2006), 591--616. #link("https://doi.org/10.1215/S0012-7094-06-13336-7")[doi:10.1215/S0012-7094-06-13336-7].]
#bibitem([17])[J. Pila and U. Zannier, #emph[Rational points in periodic analytic sets and the Manin--Mumford conjecture], Rend. Lincei Mat. Appl. (9) #strong[19] (2008), 149--162. #link("https://doi.org/10.4171/RLM/514")[doi:10.4171/RLM/514].]
#bibitem([18])[R. Pink, #emph[A common generalization of the conjectures of André--Oort, Manin--Mumford, and Mordell--Lang], preprint, April 17, 2005. #link("https://people.math.ethz.ch/~pink/ftp/AOMMML.pdf")[Author's manuscript].]
#bibitem([19])[J.-P. Serre and J. Tate, #emph[Good reduction of abelian varieties], Ann. of Math. (2) #strong[88] (1968), 492--517. #link("https://doi.org/10.2307/1970722")[doi:10.2307/1970722].]
#bibitem([20])[C. L. Siegel, #emph[Über die Classenzahl quadratischer Zahlkörper], Acta Arith. #strong[1] (1935), 83--86. #link("https://doi.org/10.4064/aa-1-1-83-86")[doi:10.4064/aa-1-1-83-86].]
#bibitem([21])[J. H. Silverman, #emph[Heights and elliptic curves], in #emph[Arithmetic Geometry] (G. Cornell and J. H. Silverman, eds.), Springer, New York, 1986, 253--265. #link("https://doi.org/10.1007/978-1-4613-8655-1_10")[doi:10.1007/978-1-4613-8655-1\_10].]
#bibitem([22])[J. Tate, #emph[A review of non-Archimedean elliptic functions], in #emph[Elliptic Curves, Modular Forms, & Fermat's Last Theorem] (Hong Kong, 1993), Series in Number Theory, vol.~I, International Press, Cambridge, MA, 1995, 162--184. #link("https://people.math.harvard.edu/~ctm/home/text/others/tate/tate-unif/tate-unif.pdf")[Author's reprint].]
#bibitem([23])[J. Tsimerman, #emph[The André--Oort conjecture for $cal(A)_g$], Ann. of Math. (2) #strong[187] (2018), 379--390. #link("https://doi.org/10.4007/annals.2018.187.2.2")[doi:10.4007/annals.2018.187.2.2].]
#bibitem([24])[B. Zilber, #emph[Exponential sums equations and the Schanuel conjecture], J. London Math. Soc. (2) #strong[65] (2002), 27--44. #link("https://doi.org/10.1112/S0024610701002861")[doi:10.1112/S0024610701002861].]


