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

#align(center)[#text(size: 16pt, weight: "bold")[An integral degree-three Gersten counterexample]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

For a regular local domain $B$ with fraction field $F_B$, the integral Gersten conjecture asks whether, for each $n gt.eq 0$, the augmented complex of Quillen groups

$ 0 arrow.r K_n \( B \) arrow.r K_n \( F_B \) arrow.r xor.big_("ht" frak(p) = 1) K_(n - 1) \( kappa \( frak(p) \) \) arrow.r dots.h.c $

is exact. Here $kappa \( frak(p) \)$ is the residue field at a prime, and the later maps are the codimension-residue maps. In particular, exactness requires the first map $K_n \( B \) arrow.r K_n \( F_B \)$ to be injective. We construct a ring for which this requirement fails in degree three.

Fix a primitive fifth root of unity $zeta$, and define

$ L = bb(Q)_5 \( zeta \) \, #h(2em) V = cal(O)_L \, #h(2em) pi = 1 - zeta . $

Let $cal(X) subset bb(P)_V^2$ be the projective hypersurface

$ \( X - Z \)^5 - X Y^4 + Y^5 + zeta Z^5 = 0 . $

On its special fiber take $m = \[ 0 : 0 : 1 \]$, and set $A = cal(O)_(cal(X) \, m)$. We use $G_i$ for coherent $K$-theory and $G_i \( - \; bb(Z) \/ 5 \)$ for its mod-five coefficient groups.

#thm([Theorem 1.1.])[
  #emph[The ring $A$ is a two-dimensional Noetherian regular local domain of mixed characteristic $\( 0 \, 5 \)$, with $pi in frak(m)_A^2$. There is an integral class $c in K_3 \( A \)$ such that 
$ c \|_("Frac" A) = 0 \, #h(2em) c \|_(A \[ 1 \/ pi \]) med mod med 5 eq.not 0 quad upright("in ") G_3 \( A \[ 1 \/ pi \] \; bb(Z) \/ 5 \) . $

 In particular, $K_3 \( A \) arrow.r K_3 \( "Frac" A \)$ is not injective.]
] <thm:main>

Thus the unrestricted integral Gersten complex can fail already at its initial injection. The class $c$ is not in $5 K_3 \( A \)$: any such multiple would have zero coefficient reduction, and hence zero reduction after restriction to $A \[ 1 \/ pi \]$. This conclusion does not determine the order of $c$ or its image in $K_3 \( A \) ⊗ bb(Q)$.

=== Context and earlier results <context-and-earlier-results>

Gersten asked, among other questions, whether the transfer from the residue field to a discrete valuation ring vanishes #cite(label("GerstenProblems")) Problem 9. Localization connects this question to injectivity of restriction to the fraction field: the image of the residue-field transfer is its kernel. Quillen formulated the general regular-local conjecture and proved it for regular semilocalizations of finite-type algebras over a field #cite(label("QuillenHigher")) §7, Conjecture 5.10 and Theorem 5.11. Sherman established the equicharacteristic DVR case #cite(label("Sherman")) p. 498, and Panin proved the full equicharacteristic case #cite(label("Panin")) Theorem A. These results place the remaining integral question in mixed characteristic.

In mixed characteristic, smoothness over a DVR and the choice of coefficients lead to different positive results. Gillet and Levine’s relative theory reduces the smooth-over-DVR setting to the DVR case #cite(label("GilletLevine")). Geisser and Levine proved finite-coefficient Gersten exactness for semilocal rings essentially smooth over a DVR, including coefficients of residue-characteristic order #cite(label("GeisserLevine")) Theorem 8.2. Druzhinin’s preprint states exactness for essentially smooth local Henselian schemes over a DVR #cite(label("Druzhinin")) Theorem 4.5. A separate result of Skalit gives finite-coefficient exactness for every unramified regular local ring #cite(label("Skalit")) Corollary 5.7; in mixed characteristic $\( 0 \, p \)$, unramified here means $p in frak(m) \\ frak(m)^2$. His integral result is a reduction to DVRs essentially smooth over $bb(Z)$ #cite(label("Skalit")) Theorem 5.4. Our ring satisfies $5 in frak(m)_A^2$, and its special fiber over the chosen $V$ is singular at $m$; it lies outside the unramified and smooth-over-$V$ settings just described.

The distinction between integral and coefficient classes governs the proof. A finite-coefficient kernel class may have a nonzero coefficient boundary and hence fail to lift integrally. Even when it lifts, its integral generic restriction may be nonzero but divisible by the coefficient prime. Feld’s mod-three degree-two example and its integral divisibility corollary illustrate this second issue #cite(label("Feld")) Theorem 1.1 and Corollary 5.1.

Feld’s construction also provides a methodological antecedent: push a Bott-type class from a divisor and detect its image after a flat cyclotomic base change and inversion of three. The symbol sketch in #cite(label("Feld")) Remark 5.3, footnote 3 gives a related use of symbols. Here we arrange the integral lift on the divisor itself, so support proves integral generic vanishing before the norm test is applied. No result from Feld’s or Druzhinin’s preprint is an input to this proof.

The companion paper #emph[An integral counterexample to Gersten’s conjecture] #cite(label("IntegralDegreeFive")) Theorem 1.1 gives an integral degree-five counterexample at $A_5 = \( V_0 \[ x \, y \] \/ \( 5 + x^4 + y^4 \) \)_(\( 5 \, x \, y \))$, where $V_0$ is the ring of integers of the unramified degree-eight extension of $bb(Q)_5$. Its integral cyclotomic lift and Picard-valued specialization test form a different proof route. Here the quintic model supports a Steinberg lift and a norm valuation test, proved entirely within this paper. The two results concern different rings and do not determine the smallest degree in which integral Gersten injectivity can fail.

=== The route through the proof <the-route-through-the-proof>

Write $C = cal(X)_L$ for the projective generic curve. On the chart $Z eq.not 0$ let $x = X \/ Z$ and $y = Y \/ Z$. The divisor $y = 0$ in $"Spec" A$ has ring $S = A \/ y A$. Section 2 proves that $S$ is a DVR with uniformizer $t = x med mod med y$, and that its fraction field $D$ is a totally ramified degree-five extension of $L$ satisfying

$ N_(D \/ L) \( t \) = pi \, #h(2em) \( 1 - t \)^5 = zeta . $

For a finite extension $E \/ L$, write $k_E$ for the residue field of its valuation ring; its residue degree is $\[ k_E : bb(F)_5 \]$. The corresponding closed point $q_0 in C$ has field $kappa \( q_0 \) = D$ and specializes to $m$, with $\[ D : L \] = 5$ but $\[ k_D : bb(F)_5 \] = 1$. Every closed point $q$ specializing elsewhere satisfies $5 divides \[ k_(kappa \( q \)) : bb(F)_5 \]$. This difference in residue degrees supplies the nonvanishing test.

Write $\[ u \]$ for the integral $K_1$ class of a nonzero field element. Section 3 chooses a class $beta in K_2 \( L \; bb(Z) \/ 5 \)$ whose coefficient boundary in $K_1 \( L \)$ is $\[ zeta \]$ and constructs an integral lift of $a_D = beta_D dot.op \[ t \]$ in two steps, where $beta_D$ is the restriction of $beta$ to $D$. The identity $\( 1 - t \)^5 = zeta$ turns the coefficient boundary of $a_D$ into a multiple of the Steinberg symbol ${ 1 - t \, t } = 0$ in $K_2 \( D \)$ #cite(label("Matsumoto")). Hence $a_D$ lifts to an integral class in $K_3 \( D \)$. Quillen’s finite-field calculation gives $K_2 \( bb(F)_5 \) = 0$ #cite(label("QuillenFinite")), so localization then lifts this integral class to $K_3 \( S \)$. Pushforward from $S$ produces $c in K_3 \( A \)$, and restriction to $"Frac" A$ kills it because its support is the divisor $y = 0$.

To detect this candidate, Section 4 proves that for every finite extension $E \/ L$, multiplication by the restriction $beta_E$ identifies $E^times \/ E^(times 5)$ with $K_3 \( E \; bb(Z) \/ 5 \)$. This calculation combines the multiplicative motivic-to-$K$ spectral sequence of Friedlander and Suslin, Suslin’s product-preserving comparison, and the norm-residue comparison #cite(label("FriedlanderSuslin")) #cite(label("Suslin")) #cite(label("Voevodsky")). The projection formula identifies field transfer with norm. Normalized valuation modulo five consequently kills every transferred coefficient class from a field of residue degree divisible by five, whereas $a_D$ has transferred valuation one because $N_(D \/ L) \( t \) = pi$.

Section 5 proves that this integral class is nonzero. The scheme $T = "Spec" A \[ 1 \/ pi \]$ is an inverse limit of affine opens of $C$ with flat transition maps. These opens contain every closed point specializing to $m$, so their omitted points have residue degree divisible by five. If the coefficient reduction of $c \|_T$ vanished, continuity of coherent $K$-theory would make it vanish on one such open. Localization would then express the supported coefficient class $\( q_0 \)_(*) \( beta_D dot.op \[ t \] \)$ as a sum of classes supported at omitted points. Proper pushforward to $L$ and the norm valuation give zero for every term on that side and one for $q_0$, a contradiction. We work in coherent $G$-theory on $C$, which need not be smooth.

== 2 The model and its distinguished divisor <sec:model>

We verify the local ring in Theorem 1 and construct the divisor on which the integral class will be lifted. The special fiber forces a factor of five in residue degrees away from $m$, while the divisor through $m$ has residue degree one and a uniformizer of norm $pi$. These properties will distinguish its class from classes whose supporting points specialize away from $m$. For a finite extension $E \/ L$, write $cal(O)_E$ for its valuation ring and $k_E$ for its residue field.

#thm([Lemma 2.1.])[
  #emph[The generic fiber $C = cal(X)_L$ is an integral projective curve. The ring $A = cal(O)_(cal(X) \, m)$ is a two-dimensional Noetherian regular local domain of mixed characteristic $\( 0 \, 5 \)$ with $pi in frak(m)_A^2$. For every closed point $q in C$ with residue field $E = kappa \( q \)$, the $E$-point extends to $"Spec" cal(O)_E arrow.r cal(X)$. If its closed image is not $m$, then $5 divides \[ k_E : bb(F)_5 \]$.]
  #emph[On the chart $Z eq.not 0$, set $x = X \/ Z$, $y = Y \/ Z$, and let $t$ be the image of $x$ in $S = A \/ y A$. Then 
#[#set math.equation(numbering: n => "(1)")
 $ S tilde.equiv V \[ t \] \/ #scale(x: 120%, y: 120%)[\(] \( t - 1 \)^5 + zeta #scale(x: 120%, y: 120%)[\)] $ <eq:divisor>]

 is a DVR with uniformizer $t$. Its fraction field $D$ is totally ramified of degree five over $L$, and 
#[#set math.equation(numbering: n => "(2)")
 $ N_(D \/ L) \( t \) = pi \, #h(2em) eta = 1 - t \, #h(2em) eta^5 = zeta . $ <eq:norm-t>]

 The equation $Y = 0$ cuts out a single closed point $q_0 in C$ with residue field $D$.]
] <lem:model>

#proof[
  The polynomial
  $ Phi_5 \( 1 - T \) = T^4 - 5 T^3 + 10 T^2 - 10 T + 5 $
  is Eisenstein at five. Therefore $pi = 1 - zeta$ is a uniformizer of $V$, its residue field is $bb(F)_5$, and $5 = u pi^4$ for some $u in V^times$. The homogeneous equation $P$ defining $cal(X)$ reduces to
  $ overline(P) = X^5 - X Y^4 + Y^5 . $
  If $alpha$ is a root of $s^5 - s + 1$, then Frobenius sends $alpha$ to $alpha - 1$. Its orbit has length exactly five: the $r$th iterate is $alpha - r$, which first returns at $r = 5$. Thus $s^5 - s + 1$ is irreducible over $bb(F)_5$, and so is its homogenization $overline(P)$. This remains irreducible on adjoining the independent variable $Z$. A factorization of the primitive homogeneous polynomial $P$ over $L$ would, by Gauss’ lemma, give primitive positive-degree homogeneous factors over $V$ and hence a factorization of $overline(P)$. Consequently $C$ is integral. It is a projective plane curve, so it has dimension one.
  Put
  $ F = \( x - 1 \)^5 - x y^4 + y^5 + zeta \, #h(2em) R = V \[ x \, y \] \/ \( F \) \, #h(2em) frak(m) = \( pi \, x \, y \) subset R . $
  In the regular local ring $V \[ x \, y \]_(\( pi \, x \, y \))$ of dimension three, $F equiv - pi$ modulo the square of the maximal ideal. Thus quotienting by $F$ gives the regular local ring $A = R_(frak(m))$ of dimension two. A regular local ring is a domain. Since $F$ is monic in $x$, the ring $R$ is free over $V \[ y \]$ and hence flat over $V$. Its localization $A$ is also $V$-flat, so $V$ embeds into $A$. Together with $A \/ frak(m)_A = bb(F)_5$, this proves mixed characteristic $\( 0 \, 5 \)$. Expanding $F = 0$ gives
  $ pi = x^5 - 5 x^4 + 10 x^3 - 10 x^2 + 5 x - x y^4 + y^5 . $
  In particular, $pi in \( x \, y \) A$ and $frak(m)_A = \( x \, y \) A$. Since $5$ is divisible by $pi$, the term $5 x$ is in $\( x \, y \)^2 A$, as are all remaining terms on the right. Hence $pi in frak(m)_A^2$. Since $5 = u pi^4$, also $5 in frak(m)_A^2$, so $A$ is ramified in the usual mixed-characteristic sense. The reduction of the equation has no linear term at $m$, so the one-dimensional special fiber is singular there; $A$ is not smooth over $V$.
  Modulo $y$, the equation becomes
  $ f \( t \) = \( t - 1 \)^5 + zeta = t^5 - 5 t^4 + 10 t^3 - 10 t^2 + 5 t - pi . $
  This is Eisenstein at $pi$. The finite free $V$-algebra $B = V \[ t \] \/ \( f \)$ is a domain. Every maximal ideal lies over the maximal ideal of $V$, and $B \/ pi B = bb(F)_5 \[ t \] \/ \( t^5 \)$, so $B$ is local. Since $f \( t \) = 0$ implies $pi in \( t \) B$, its maximal ideal is $\( t \)$. Its dimension is one, making it a DVR. The localization defining $A \/ y A$ leaves this local ring unchanged, proving (1). Its fraction field has degree five over $L$ and residue degree one, hence total ramification. The constant term gives
  $ N_(D \/ L) \( t \) = \( - 1 \)^5 f \( 0 \) = pi . $
  The relation $\( 1 - t \)^5 = zeta$ also follows from $f \( t \) = 0$. As $S \[ 1 \/ pi \] = D$, the equation $y = 0$ on the generic affine chart gives a single closed point. There is no additional point with $Y = Z = 0$ on $C$, since substitution in $P$ would force $X = 0$. This proves the assertion about $q_0$ on all of $C$.
  We have constructed the distinguished point with residue degree one. It remains to establish the residue-degree constraint on points that specialize away from $m$. A closed point of $C$ has residue field finite over $L$. Properness of $cal(X) \/ V$ extends its $E$-point to $"Spec" cal(O)_E$. On the special fiber $Y = 0$ forces $X = 0$, so $m$ is the only point with $Y = 0$. If the closed image is elsewhere, $X \/ Y$ in $k_E$ is a root of $s^5 - s + 1$. Thus $k_E$ contains $bb(F)_(5^5)$, and $5 divides \[ k_E : bb(F)_5 \]$. ◻
]

== 3 Lifting on the divisor <sec:integral>

The divisor $"Spec" S subset "Spec" A$ now supplies an integral class with zero generic restriction. We first lift a coefficient class to $K_3 \( D \)$ and then extend that lift across the closed point of $S$. Its coefficient image will be tested for nonvanishing only after this construction.

Let $M_5$ be the mod-five Moore spectrum. We use $K_i \( B \; bb(Z) \/ 5 \) = pi_i \( K \( B \) and M_5 \)$, and the same convention for $G$-theory. The coefficient sequence is

#[#set math.equation(numbering: n => "(3)")
 $ K_i \( B \) arrow.r^5 K_i \( B \) arrow.r^(rho_B) K_i \( B \; bb(Z) \/ 5 \) arrow.r^(partial_(upright("coef"))) K_(i - 1) \( B \) arrow.r^5 K_(i - 1) \( B \) . $ <eq:coeff>]

Here $rho_B$ denotes coefficient reduction, and $partial_(upright("coef"))$ denotes the connecting map. Multiplication of a coefficient class by an integral class uses the natural $K \( B \)$-module structure on $K \( B \) and M_5$.

For an element $u$ of a field’s multiplicative group, write $\[ u \]$ for its integral $K_1$ class. Since $\[ zeta \] in K_1 \( L \) = L^times$ has order five, exactness permits us to fix

$ beta in K_2 \( L \; bb(Z) \/ 5 \) \, #h(2em) partial_(upright("coef")) beta = \[ zeta \] . $

For every finite extension $E \/ L$, write $beta_E$ for its restriction. The class to be lifted is

$ a_D = beta_D dot.op \[ t \] in K_3 \( D \; bb(Z) \/ 5 \) . $

Resolution identifies $K$-theory with coherent $G$-theory for the regular rings $S$ and $A$; closed-immersion pushforward is taken in $G$-theory #cite(label("QuillenHigher")) §7.1 and §7, paragraph 2.7 and the discussion following (2.8).

#thm([Proposition 3.1.])[
  #emph[There exists $b in K_3 \( S \)$ whose restriction to $D$, followed by coefficient reduction, is $a_D$. If $j : "Spec" S arrow.r.hook "Spec" A$ and $c = j_(*) b in G_3 \( A \) = K_3 \( A \)$, then $c \|_("Frac" A) = 0$. Moreover, for $T = "Spec" A \[ 1 \/ pi \]$ and $i : "Spec" D arrow.r.hook T$, 
$ c \|_T med mod med 5 = i_(*) a_D quad upright("in ") G_3 \( T \; bb(Z) \/ 5 \) . $

]
] <prop:integral>

#proof[
  The coefficient cofiber sequence is a sequence of $K \( D \)$-modules. Its connecting map is therefore compatible with multiplication by an integral $K \( D \)$ class, up to the suspension sign. By (2), $zeta = eta^5$ and $t = 1 - eta$. Both $eta$ and $1 - eta$ are nonzero: the first has fifth power $zeta eq.not 0$, and the second is the uniformizer $t$ of $S$. Matsumoto’s Steinberg relation #cite(label("Matsumoto")) §5, Lemma 5.6, Theorem 5.10, and Corollary 5.11, with the identification of symbols and products in Quillen $K_2 \( D \)$ #cite(label("Weibel")) III.6.1, IV.1.7.1, IV.1.10.1, and IV.7.2, gives
  #[#set math.equation(numbering: n => "(4)")
   $ partial_(upright("coef")) a_D = plus.minus \[ zeta \] dot.op \[ t \] = plus.minus 5 { eta \, 1 - eta } = 0 . $ <eq:steinberg>]
  The sign does not affect the vanishing. Exactness of (3) yields an integral lift $tilde(a)_D in K_3 \( D \)$ of $a_D$. The boundary $\[ zeta \] in K_1 \( D \) \[ 5 \]$ of $beta_D$ itself is still nonzero, even though $zeta = eta^5$. Being a fifth power makes the class of $zeta$ vanish in $D^times \/ D^(times 5)$, not in the integral group $K_1 \( D \) = D^times$. The Steinberg relation is what kills the boundary of the product $a_D$.
  Localization and dévissage for the DVR $S$ give #cite(label("QuillenHigher")) §7, Proposition 3.2
  $ K_3 \( S \) arrow.r K_3 \( D \) arrow.r K_2 \( bb(F)_5 \) . $
  The last group is zero by Quillen’s finite-field computation #cite(label("QuillenFinite")). We may therefore choose $b in K_3 \( S \)$ restricting to $tilde(a)_D$. This is a second lift, distinct from the coefficient lift to $K_3 \( D \)$.
  Let $c = j_(*) b in G_3 \( A \) = K_3 \( A \)$. Its restriction to $"Spec" A \[ 1 \/ y \]$ is zero because the closed immersion $j$ has empty pullback there. The element $y$ is nonzero in the domain $A$: its quotient $S$ has dimension one, whereas $A$ has dimension two. Hence $y$ becomes invertible in $"Frac" A$, and $c \|_("Frac" A) = 0$ integrally.
  Base change of $j$ along $T arrow.r "Spec" A$ is $i : "Spec" D arrow.r.hook T$, since $S \[ 1 \/ pi \] = D$. Flat base change for coherent pushforward #cite(label("Weibel")) V.3.7.2 here is the natural isomorphism
  $ A \[ 1 \/ pi \] ⊗_A M tilde.equiv D ⊗_S M $
  for a finite $S$-module $M$, with both sides viewed as $A \[ 1 \/ pi \]$-modules. Thus restriction of scalars commutes with localization. Naturality of coefficient reduction gives the commutative diagram
  $ K_3 \( S \) & arrow.r^(med j_(*) med) & G_3 \( A \)\
arrow.b &  & arrow.b\
K_3 \( D \; bb(Z) \/ 5 \) & arrow.r^(med i_(*) med) & G_3 \( T \; bb(Z) \/ 5 \) . $
  Both vertical arrows mean restriction followed by coefficient reduction. The left arrow sends $b$ to $a_D$, which proves the stated identity. ◻
]

== 4 The field comparison and norm detector <sec:field>

Proposition 3 constructs an integral class $c$ with zero generic restriction. To prove it nonzero, we will test its coefficient image by proper pushforward to $L$ and a valuation. Localization on the projective curve will introduce arbitrary classes in $K_3 \( E \; bb(Z) \/ 5 \)$, for finite extensions $E \/ L$ arising as closed-point fields. We therefore need a description of all these groups that identifies field transfer with norm.

Keep the class $beta$ and its restrictions $beta_E$ fixed as in Section 3. For every finite extension $E \/ L$, let $k_E$ be its residue field, and normalize $v_E$ so that a uniformizer has valuation one.

#thm([Lemma 4.1.])[
  (Multiplicative field comparison).  #emph[For $L = bb(Q)_5 \( zeta \)$ and the fixed $beta$ above, every finite extension $E \/ L$ has an isomorphism 
#[#set math.equation(numbering: n => "(5)")
 $ theta_E : E^times \/ E^(times 5) arrow.r^tilde.op K_3 \( E \; bb(Z) \/ 5 \) \, #h(2em) u med mod med E^(times 5) mapsto beta_E dot.op \[ u \] . $ <eq:theta>]

 The degree-three motivic edge identifies the target with $H_(upright("et"))^1 \( E \, mu_5^(⊗ 2) \)$. Under this edge, the displayed map is Kummer reduction followed by cup product with the nonzero weight-one edge image $alpha_E in H^0 \( E \, mu_5 \)$ of $beta_E$.]
] <lem:field>

#proof[
  We first identify the degree-three group, then locate the image of $beta_E$ in degree two, and finally compute multiplication by $beta_E$ on integral $K_1$. The strongly convergent motivic-to-$K$ spectral sequence for a characteristic-zero field is
  #[#set math.equation(numbering: n => "(6)")
   $ E_2^(a \, b) = H^(a - b) \( E \, bb(Z) \/ 5 \( - b \) \) quad arrow.r.double quad K_(- a - b) \( E \; bb(Z) \/ 5 \) . $ <eq:motivic>]
  It has a pairing with the integral spectral sequence that induces the integral/coefficient $K$-module product on the abutment #cite(label("FriedlanderSuslin")) Theorem 16.2 and Appendix C.2–C.3. The comparison with motivic complexes preserves products #cite(label("Suslin")) Lemma 3.4 and Theorem 6.1. Write $s = a - b$ and $j = - b$, so a term $H^s \( E \, bb(Z) \/ 5 \( j \) \)$ has total $K$-degree $2 j - s$. Negative weights vanish. For $j gt.eq 0$, the field motivic groups vanish for $s > j$, and the norm-residue and motivic–étale comparison theorems identify them, for every $s lt.eq j$, with
  $ H_(upright("et"))^s \( E \, mu_5^(⊗ j) \) \; $
  see #cite(label("Voevodsky")) Theorems 6.16–6.17 and #cite(label("Weibel")) VI.4.1–4.2. In particular, the groups vanish for $s < 0$. These comparisons apply because $5$ is invertible in $E$.
  The $5$-cohomological dimension of a finite extension of $bb(Q)_5$ is two #cite(label("Weibel")) VI.§7, before Proposition 7.3. Thus the only potentially nonzero terms satisfy $0 lt.eq s lt.eq min \( j \, 2 \)$. For $r gt.eq 2$ a differential changes $\( s \, j \)$ to $\( s + 2 r - 1 \, j + r - 1 \)$, so none can join two nonzero terms. Total degree three has the single term $\( s \, j \) = \( 1 \, 2 \)$, yielding the natural identification
  #[#set math.equation(numbering: n => "(7)")
   $ K_3 \( E \; bb(Z) \/ 5 \) tilde.eq H_(upright("et"))^1 \( E \, mu_5^(⊗ 2) \) . $ <eq:degree-three-edge>]
  In particular, this $K$-group is killed by five. In total degree two the weight-one quotient of the filtration is $H^0 \( E \, mu_5 \)$; the only other possible piece is $H^2 \( E \, mu_5^(⊗ 2) \)$ in weight two.
  Let $alpha_E$ be the weight-one image of $beta_E$. To see that it is nonzero, restrict to an algebraic closure $overline(E)$. The same comparison there has only $s = 0$ terms, so its total degree-two group has just the weight-one piece $H^0 \( overline(E) \, mu_5 \)$. Matsumoto’s presentation of field $K_2$ (#cite(label("Matsumoto")) §5; see also #cite(label("Weibel")) III.6.1) gives $K_2 \( overline(E) \) \/ 5 = 0$: every symbol ${ u \, v }$ equals $5 { r \, v }$ after choosing $r^5 = u$. The coefficient sequence therefore identifies $K_2 \( overline(E) \; bb(Z) \/ 5 \)$ with $K_1 \( overline(E) \) \[ 5 \]$ through $partial_(upright("coef"))$. The restriction of $beta_E$ is nonzero, since its boundary is the primitive root $\[ zeta \]$. Naturality of the filtration shows that $alpha_E$ has nonzero image in $H^0 \( overline(E) \, mu_5 \)$. It is consequently a generator of $H^0 \( E \, mu_5 \)$; only this nonvanishing is needed.
  It remains to determine the actual product from these filtration pieces. Integral $K_1 \( E \) = E^times$ has only the weight-one piece $H^1 \( E \, bb(Z) \( 1 \) \)$: on the diagonal $2 j - s = 1$, weights $j gt.eq 2$ give $s > j$ and vanish, weight zero gives $H^(- 1) \( E \, bb(Z) \( 0 \) \) = 0$, and negative weights vanish. The identification $bb(Z) \( 1 \) tilde.eq bb(G)_m \[ - 1 \]$ identifies reduction of $\[ u \]$ with its Kummer class in $H^1 \( E \, mu_5 \) = E^times \/ E^(times 5)$.
  Write $F^j$ for the decreasing weight filtration. The preceding calculations give
  $ F^1 K_1 \( E \) = K_1 \( E \) \, quad F^2 K_1 \( E \) = 0 \, #h(2em) F^2 K_3 \( E \; bb(Z) \/ 5 \) = K_3 \( E \; bb(Z) \/ 5 \) \, quad F^3 K_3 \( E \; bb(Z) \/ 5 \) = 0 . $
  The class $beta_E$ lies in $F^1 K_2 \( E \; bb(Z) \/ 5 \)$ and has image $alpha_E$ in its quotient by $F^2$. The mixed filtered pairing satisfies
  $ F^2 K_2 \( E \; bb(Z) \/ 5 \) dot.op F^1 K_1 \( E \) subset.eq F^3 K_3 \( E \; bb(Z) \/ 5 \) = 0 . $
  Thus the possible weight-two part of $beta_E$ contributes nothing: the product $beta_E dot.op \[ u \]$ is determined by $alpha_E$ and the weight-one class of $\[ u \]$. Product compatibility identifies it, under (7), with $alpha_E union \[ u \]$. Since $alpha_E$ generates the constant one-dimensional $bb(F)_5$-module $mu_5$, this cup product is an isomorphism. The product factors through fifth powers because its target is killed by five and $\[ u^5 \] = 5 \[ u \]$. This proves (5) with its asserted multiplicative identification. ◻
]

In particular, the coefficient class already constructed on the divisor is $a_D = theta_D \( t \)$. We now relate the comparison maps for different extensions of $L$.

#thm([Lemma 4.2.])[
  (Norm detector).  #emph[For every finite extension $E \/ L$ and every $u in E^times$, 
#[#set math.equation(numbering: n => "(8)")
 $ "Tr"_(E \/ L) theta_E \( u \) = theta_L \( N_(E \/ L) u \) . $ <eq:transfer>]

 Consequently 
$ lambda_L = \( v_L med mod med 5 \) compose theta_L^(- 1) : K_3 \( L \; bb(Z) \/ 5 \) arrow.r bb(Z) \/ 5 $

 satisfies 
$ lambda_L #scale(x: 120%, y: 120%)[\(] "Tr"_(E \/ L) \( a \) #scale(x: 120%, y: 120%)[\)] = 0 quad upright("for every ") a in K_3 \( E \; bb(Z) \/ 5 \) quad upright("if ") 5 divides \[ k_E : k_L \] . $

]
] <lem:norm-detector>

#proof[
  Restriction of scalars obeys the tensor projection formula at the level of $K$-theory spectra #cite(label("Weibel")) V.3.3.2. Smashing its base-field factor with $M_5$ gives the mixed pairing identity
  $ "Tr"_(E \/ L) \( beta_E dot.op \[ u \] \) = beta dot.op "Tr"_(E \/ L) \[ u \] = beta dot.op \[ N_(E \/ L) u \] . $
  The second equality uses the norm description of field $K_1$ transfer #cite(label("Weibel")) III.1.7.1 and the following paragraph. This proves (8).
  For normalized valuations, the norm of the prime ideal of $E$ is the $\[ k_E : k_L \]$th power of the prime ideal of $L$. Hence
  $ v_L \( N_(E \/ L) u \) = \[ k_E : k_L \] v_E \( u \) . $
  Every $a in K_3 \( E \; bb(Z) \/ 5 \)$ has the form $theta_E \( u \)$ by Lemma 4. Applying the formula to that $u$ proves the assertion for all $a$. The factor is the residue degree, not the total degree $\[ E : L \]$. ◻
]

== 5 Detection on the projective curve <sec:detection>

Proposition 3 has constructed an integral class $c$ with $c \|_("Frac" A) = 0$ and coefficient image $i_(*) a_D$ on

$ T = "Spec" A \[ 1 \/ pi \] . $

By Lemma 4, $a_D = beta_D dot.op \[ t \] = theta_D \( t \)$. To prove its pushforward $i_(*) a_D$ nonzero, we extend the supported class to the projective curve $C$, where proper pushforward permits the norm test. The scheme $T$ is an inverse limit of affine opens of $C$ with flat transition maps, and need not itself be an open subset. The following lemma makes that passage explicit.

#thm([Lemma 5.1.])[
  #emph[Let $Sigma = R \\ frak(m)$, where $R = V \[ x \, y \] \/ \( F \)$ and $frak(m) = \( pi \, x \, y \)$. For $h in Sigma$ put 
$ U_h = "Spec" R \[ 1 \/ pi \, 1 \/ h \] subset C . $

 Then the refinement maps $U_(h k) arrow.r U_h$ are affine and flat, and 
#[#set math.equation(numbering: n => "(9)")
 $ T = "proj lim"_(h in Sigma) U_h \, #h(2em) "inj lim"_(h in Sigma) G_3 \( U_h \; bb(Z) \/ 5 \) arrow.r^(med tilde.op med) G_3 \( T \; bb(Z) \/ 5 \) . $ <eq:continuity>]

 Every $U_h$ contains $q_0$. Its complement in $C$ is a finite set of closed points $q$, and their residue fields $E_q = kappa \( q \)$ satisfy $5 divides \[ k_(E_q) : bb(F)_5 \]$.]
] <lem:opens>

#proof[
  The multiplicative set $Sigma$ is directed by taking products: $h k$ gives a common refinement of $h$ and $k$. Transitivity of localization gives
  $ "inj lim"_(h in Sigma) R \[ 1 \/ pi \, 1 \/ h \] = R_(frak(m)) \[ 1 \/ pi \] = A \[ 1 \/ pi \] . $
  Each refinement is a principal localization, so the corresponding scheme map is affine and flat. The stages and their limit are affine Noetherian schemes, hence separated. Quillen’s continuity theorem, in its coherent $K'$ conclusion #cite(label("QuillenHigher")) §7, Proposition 2.2, therefore applies to their integral $G$-groups.
  To pass to coefficients, use the natural short exact sequence
  $ 0 arrow.r G_3 \( Y \) \/ 5 G_3 \( Y \) arrow.r G_3 \( Y \; bb(Z) \/ 5 \) arrow.r G_2 \( Y \) \[ 5 \] arrow.r 0 $
  for each stage $Y = U_h$ and for $Y = T$. Filtered colimits of abelian groups are exact, and thus commute with the quotient by five and the kernel of multiplication by five. Integral continuity in degrees three and two identifies the outer terms in the resulting comparison of short exact sequences. It consequently identifies the middle terms, proving the coefficient assertion in (9).
  Since $h in.not frak(m)$, its image in the local divisor ring $S$ is a unit. Thus $q_0 = "Spec" D$ belongs to $U_h$. More generally, consider a closed point $q in C$ with residue field $E$ whose extension $"Spec" cal(O)_E arrow.r cal(X)$ specializes to $m$. The inverse image of the chart $Z eq.not 0$ contains the closed point of $"Spec" cal(O)_E$, and hence is all of $"Spec" cal(O)_E$. On that chart the reduction of $h$ at $m$ is nonzero. Its pullback to $cal(O)_E$ is therefore a unit, so $q$ lies in $U_h$. It follows that each point omitted from $U_h$ specializes away from $m$. Lemma 2 then gives $5 divides \[ k_E : bb(F)_5 \]$. Finally, $C$ is an integral projective curve and $U_h$ is nonempty, so its closed complement consists of finitely many closed points. ◻
]

#proof[
  Take the integral class $c in K_3 \( A \)$ constructed in Proposition 3, and put
  $ w = \( q_0 \)_(*) theta_D \( t \) in G_3 \( C \; bb(Z) \/ 5 \) . $
  Coherent $G$-theory provides proper pushforward even when $C$ is singular. The point immersion is finite, and the structural map $p : C arrow.r "Spec" L$ is proper with $C$ carrying the ample line bundle $cal(O)_C \( 1 \)$. Coherent pushforward and its composition law therefore apply to both maps #cite(label("QuillenHigher")) §7, paragraph 2.7 and the discussion following (2.8).
  Flat base change for the point immersion on each $U_h$ #cite(label("Weibel")) V.3.7.2, followed by (9), identifies $w \|_T$ with the pushforward of $theta_D \( t \)$ along $"Spec" D arrow.r.hook T$. By Proposition 3, this is precisely the coefficient reduction of $c \|_T$.
  Suppose that $w \|_T = 0$. The element $w \|_(U_1)$ represents this class in the filtered colimit (9). A zero element in that colimit becomes zero at a finite stage, so $w \|_(U_h) = 0$ for some $h in Sigma$. Give $Z_h = C \\ U_h$ its reduced closed structure. Apply Moore coefficients to coherent localization and dévissage at these closed points #cite(label("QuillenHigher")) §7, Proposition 3.2 and paragraph 3.4. The resulting exact segment is
  $ xor.big_(q in Z_h) K_3 \( E_q \; bb(Z) \/ 5 \) arrow.r G_3 \( C \; bb(Z) \/ 5 \) arrow.r G_3 \( U_h \; bb(Z) \/ 5 \) . $
  Consequently there are classes $a_q in K_3 \( E_q \; bb(Z) \/ 5 \)$ such that
  #[#set math.equation(numbering: n => "(10)")
   $ w = sum_(q in Z_h) q_(*) a_q . $ <eq:omitted-relation>]
  These are arbitrary coefficient classes supplied by localization. Lemma 4 applies to every finite extension $E_q \/ L$, so its surjectivity writes each of them as $a_q = theta_(E_q) \( u_q \)$ for some $u_q in E_q^times$.
  Apply the proper pushforward $p_(*) : G_3 \( C \; bb(Z) \/ 5 \) arrow.r K_3 \( L \; bb(Z) \/ 5 \)$ to (10). For every closed point, the composite $p_(*) q_(*)$ is the field transfer. Lemma 6 gives $5 divides \[ k_(E_q) : bb(F)_5 \]$, and Lemma 5 therefore gives
  $ lambda_L #scale(x: 120%, y: 120%)[\(] p_(*) q_(*) a_q #scale(x: 120%, y: 120%)[\)] = v_L #scale(x: 120%, y: 120%)[\(] N_(E_q \/ L) \( u_q \) #scale(x: 120%, y: 120%)[\)] med mod med 5 = \[ k_(E_q) : bb(F)_5 \] v_(E_q) \( u_q \) med mod med 5 = 0 . $
  Thus (10) forces $lambda_L \( p_(*) w \) = 0$. On the other hand, the distinguished point has residue field $D$, and its parameter satisfies $N_(D \/ L) \( t \) = pi$. The same transfer formula yields
  $ lambda_L \( p_(*) w \) = lambda_L #scale(x: 120%, y: 120%)[\(] "Tr"_(D \/ L) theta_D \( t \) #scale(x: 120%, y: 120%)[\)] = v_L #scale(x: 120%, y: 120%)[\(] N_(D \/ L) \( t \) #scale(x: 120%, y: 120%)[\)] med mod med 5 = v_L \( pi \) med mod med 5 = 1 . $
  This contradiction proves $w \|_T eq.not 0$. Hence the coefficient reduction of $c \|_T$ is nonzero, so the integral class $c in K_3 \( A \)$ is itself nonzero. Its image at the fraction field is zero by Proposition 3; together with the properties of $A$ in Lemma 2, this proves the theorem. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
