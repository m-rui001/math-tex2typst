#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.5pt, y: 79.5pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[An integral counterexample to Gersten's conjecture]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

#raw("An-Integral-Counterexample-to-Gerstens-Conjecture-September-25-2026")

== 1 Introduction <sec:introduction>

For a Noetherian regular local domain $A$ with fraction field $F$,
  Gersten’s conjecture asserts exactness of the canonical augmented residue complex

#[#set math.equation(numbering: n => "(1.1)")
 $ 0 arrow.r K_n \( A \) arrow.r K_n \( F \) arrow.r xor.big_("ht" frak(p) = 1)
   K_(n - 1) \( kappa \( frak(p) \) \) arrow.r dots.h.c . $ <eq:gersten>]

Here $n gt.eq 0$, the groups are integral Quillen $K$-groups,
  and the residues come from localization and the codimension filtration.
  The first assertion is generic injectivity: a class that vanishes after passage to the fraction field must
  already vanish on $A$. We construct a counterexample to this assertion.

#thm([Theorem 1.1.])[
  #emph[Let $V$ be the ring of integers in the unramified extension of $bb(Q)_5$ of degree eight, and put
$ A = #scale(x: 120%, y: 120%)[\(] V \[ x \, y \] \/ \( 5 + x^4 + y^4 \)
  #scale(x: 120%, y: 120%)[\)]_(\( 5 \, x \, y \)) . $

 Then $A$ is a Noetherian regular local domain of dimension two and
$ ker #scale(x: 120%, y: 120%)[\(] K_5 \( A \) arrow.r K_5 \( "Frac" A \) #scale(x: 120%, y: 120%)[\)] eq.not 0 . $

 Consequently the unrestricted integral Gersten conjecture has a negative answer.]
] <thm:main>

The maximal ideal of $A$ is $\( x \, y \)$, and $5 in \( x \, y \)^4$.
  Its special fiber has dimension one and embedding dimension two at the closed point.
  Thus the regular total ring is ramified and is not smooth over $V$.
  This distinction is central both to the example and to its relation with positive results on Gersten’s conjecture.

===== 1.1 History and related results. <history-and-related-results.>

Gersten’s questions about transfer and local higher $K$-theory #cite(label("Gersten1973Problems")),
  together with his work on exact sequences #cite(label("Gersten1973Exact")),
  place the conjecture in the study of localization and residue maps.
  Quillen formulated it for arbitrary regular local rings and proved it for semilocalizations of finite-type
  algebras over a field at regular primes #cite(label("Quillen1973Higher")) §7, Conjecture 5.10 and Theorem 5.11.
  Panin established the full equicharacteristic case #cite(label("Panin2003")) Theorem A.

In mixed characteristic, Gillet and Levine’s relative theorem reduces the smooth local case to the associated
  discrete valuation ring case #cite(label("GilletLevine1987")).
  Geisser and Levine prove finite-coefficient Gersten exactness for semilocal rings essentially smooth over a
  discrete valuation ring, for every finite coefficient order,
  including powers of the residue characteristic #cite(label("GeisserLevine2000")) Theorem 8.2;
  their text credits B. Kahn for pointing out this consequence.
  Skalit proved finite-coefficient Gersten exactness for arbitrary unramified regular local rings,
  again for every finite coefficient order #cite(label("Skalit2017")) Corollary 5.7.
  In mixed characteristic $\( 0 \, p \)$, unramified means $p in.not frak(m)^2$;
  our ring is excluded since $5 in frak(m)^4$. Version 1 of Druzhinin’s preprint states a result for essentially
  smooth local Henselian schemes over a discrete valuation ring #cite(label("Druzhinin2025")) Theorem 4.5.
  The smoothness hypotheses exclude the structure map $V arrow.r A$ of Theorem 1.

Feld’s finite-coefficient example is a close methodological predecessor #cite(label("Feld2026")) Theorem 1.1 and
  Corollary 5.1. It gives a degree-two augmentation kernel modulo three at a ramified regular local ring whose
  integral $K_2$ map is injective. Its supported pushforward, character averaging, cyclotomic scalar extension,
  conjugate splitting and divisor-class detection also organize our construction.
  In that example, an integral lift of the coefficient kernel has nonzero but three-divisible generic image,
  as follows from integral injectivity and the coefficient exact sequence.
  An integral generic kernel therefore requires an additional argument.
  Here a vanishing result for integral $K_4$ permits a cyclotomic coefficient class to lift to integral $K_5$.
  Two Bott factors contribute the square of the cyclotomic character,
  whose signs are realized by an elliptic quotient of the Fermat quartic.

Our companion paper, #emph[An integral degree-three Gersten counterexample] #cite(label("OpenAIDegreeThree2026"))
  Theorem 1.1, constructs an integral $K_3$ kernel at a different ramified ring:
  the local ring at the special point $\[ 0 : 0 : 1 \]$ of the cyclotomic quintic model $\( X - Z \)^5 - X Y^4 +
  Y^5 + zeta Z^5 = 0$ over the integers of $bb(Q)_5 \( zeta \)$, where $zeta$ is a primitive fifth root of unity.
  Its proof uses a Steinberg relation and a norm valuation test on coherent $K$-theory
  #cite(label("OpenAIDegreeThree2026")) Lemma 4.2, Proposition 3.1, and §5.
  Here the global arithmetic lift, smooth Picard specialization criterion and quartic construction are proved
  directly. Neither proof uses results of the other paper, and neither determines a smallest degree of failure.

Our proof detects the reduction modulo five of an integral class already killed over the fraction field.
  It therefore also gives generic noninjectivity with coefficients $bb(Z) \/ 5$ for the same ring.
  This detection does not determine the order of the integral class or whether its rationalization is nonzero.
  The conclusion concerns the unrestricted integral conjecture and does not settle its rational-coefficient variant.

===== 1.2 Construction and proof guide. <construction-and-proof-guide.>

A class pushed forward from a closed divisor of $"Spec" A$ vanishes over $"Frac" A$.
  We must construct such a class integrally and prove that its pushforward is nonzero.
  These tasks account for the two branches of the proof.

For the integral construction, put $S = bb(Z) \[ zeta \, 1 \/ 5 \]$.
  Section 2 supplies coefficient multiplication and its exact field isomorphisms at the low degrees used here.
  Section 3 chooses $beta in K_2 \( S \; 5 \)$, writes $b$ for left multiplication by $beta$, and constructs

$ c in K_5 \( S \) \, wide c med mod med 5 = b^2 \[ zeta - 1 \]_5 \, $

where $b^2 \( x \) = beta dot.op \( beta dot.op x \)$ and $\[ v \]_5$ is the coefficient $K_1$-class of a unit.
  The obstruction is $K_4 \( S \) \[ 5 \]$, the subgroup killed by five.
  Brauer reciprocity, geometric coefficient detection and finite generation prove that this subgroup vanishes.
  Conjugating the reduction of $c$ multiplies its two Bott factors by the square of the cyclotomic character.

Write $H_0 = "Frac" V$, $L = H_0 \( zeta \)$, and let $cal(O)$ be the valuation ring of $L$.
  Integral localization supplies the following route:

$ c in K_5 \( S \) mapsto c_L in K_5 \( L \) arrow.l tilde(c) in K_5 \( cal(O) \) . $

The leftward arrow is restriction from $cal(O)$, and $tilde(c)$ is a chosen preimage;
  its existence uses integral finite-field $K_4$ vanishing. Section 6 constructs a surjection $A arrow.r cal(O)$.
  Its closed immersion $i$ then gives the integral class $gamma = i_(*) tilde(c) in K_5 \( A \)$,
  with zero generic restriction.

For detection, flat extension from $V$ to $L$ splits this divisor into four rational points on the generic Fermat
  quartic $X^4 + Y^4 = Z^4$. Section 4 proves a general criterion on an arbitrary localization of a smooth affine
  curve. A hypothetical relation among supported coefficient classes untwists, by two Bott operations,
  to ordinary integral tame symbols. On a smooth proper arithmetic surface, the coniveau identity $d_1^2 =
  0$ makes their horizontal specialization a principal divisor.
  A homomorphism from the entire special-fiber Picard group can therefore test the proposed relation.

Section 5 constructs this test. The Fermat quartic maps with degree two to the genus-one curve $w^2 = s^4 + 1$.
  With a branch point as origin, the four chosen specializations map to $Q$ or $- Q$,
  with the same signs as the character square. Their weighted sum is $4 Q eq.not 0$ modulo five.
  Section 7 verifies all hypotheses of the Picard criterion and proves that the coefficient reduction of $gamma$
  remains nonzero after flat pullback. This detects the already integral class $gamma$.

Appendix 8 treats a separate issue in Mochizuki’s version 8 preprint #cite(label("Mochizuki2020")).
  Its Theorem 5 would annihilate the principal-divisor pushforward used here.
  We prove an explicit failure of the strict functor assertion in Lemma 13(III),
  for every nonzero regular parameter. That calculation concerns the supplied proof construction,
  and by itself does not refute its theorem statement. No argument in the kernel construction depends on the appendix.

== 2 Coefficients and Bott multiplication <sec:coefficients>

Our first goal is to control multiplication by a chosen coefficient class,
  including its interaction with localization. These operations have two uses.
  In the arithmetic construction they carry surjectivity of a valuation map to the degree needed to remove the
  integral lifting obstruction. In the geometric argument they translate a relation among supported coefficient
  classes into ordinary tame symbols.

We write $G \( X \)$ for the $K$-theory spectrum of coherent modules on a Noetherian scheme $X$.
  For the regular schemes used below, the canonical resolution equivalence identifies $K \( X \)$ with
  $G \( X \)$: these schemes have finite dimension and are affine or quasiprojective over an affine base.
  We use Quillen localization and dévissage, including localization by a multiplicative set and the resulting
  residue maps #cite(label("Quillen1973Higher")) §4, Theorem 3 and Corollary 2; §5, Theorems 4–5; §7,
  Proposition 3.2 and paragraph 3.4.

Let $M = bb(S) \/ 5$ be the cofiber of multiplication by $5$ on the sphere spectrum. Our coefficient convention is

$ K_i \( X \; 5 \) = pi_i \( K \( X \) and M \) \, wide G_i \( X \; 5 \) = pi_i \( G \( X \) and M \) . $

For $i gt.eq 1$ there is a natural exact sequence

#[#set math.equation(numbering: n => "(2.1)")
 $ 0 arrow.r K_i \( X \) \/ 5 arrow.r K_i \( X \; 5 \) arrow.r^(partial_(upright("coef")))
   K_(i - 1) \( X \) \[ 5 \] arrow.r 0 \, $ <eq:coefficient-sequence>]

and likewise for $G$. Here $A \/ 5 = A \/ 5 A$ and $A \[ 5 \] =
  ker \( 5 : A arrow.r A \)$ for any abelian group $A$. If $H$ is a field, the identities $K_1 \( H \) =
  H^times$ and $K_0 \( H \) = bb(Z)$ give

#[#set math.equation(numbering: n => "(2.2)")
 $ K_1 \( H \; 5 \) = H^times \/ H^(times 5) \, wide K_0 \( H \; 5 \) = bb(Z) \/ 5 . $ <eq:low-coefficients>]

For a unit $v$, the notation $\[ v \]_5$ denotes its image in $K_1 \( - \; 5 \)$.
  We use additive notation in $K$-groups, including groups of unit classes.
  For a scheme $X$, the notation $X^(\( j \))$ denotes its points of codimension $j$.

We make the coefficient product explicit so that localization acts on classes with nonzero coefficient boundary as
  well as on reductions of integral classes. At the prime five this agrees with the product in
  #cite(label("FriedlanderSuslin2002")) Proposition 16.1 and Theorem 16.2.

#thm([Lemma 2.1.])[
  (Coefficient products).  #emph[The spectrum $M$ has a unique unital pairing $mu : M and M arrow.r
    M$ in the homotopy category. Multiplication by $5$ on $M$ is nullhomotopic,
    so all the coefficient groups above are $bb(F)_5$-vector spaces.
    Tensor product, followed by $mu$, defines natural bilinear products in coefficient $K$-theory and the
    corresponding module actions on coefficient $G$-theory.]
] <lem:moore-product>

#proof[
  The cofiber sequence for $M$, together with $pi_1 bb(S) = pi_2 bb(S) = bb(Z) \/ 2$, gives $pi_1 M = pi_2 M = 0$.
    Applying maps into $M$ to this cofiber sequence shows that restriction along the unit $eta : bb(S) arrow.r
    M$ is injective on
  $ \[ M \, M \] arrow.r \[ bb(S) \, M \] = bb(Z) \/ 5 . $
  Thus $5 "id"_M = 0$. The cofiber sequence
  $ M arrow.r^5 M arrow.r^(eta and 1) M and M arrow.r Sigma M $
  therefore permits an extension of $"id"_M$ to a pairing $mu$.
    Its restriction along $1 and eta$ is also the identity: these endomorphisms of $M$ agree after restriction
    along $eta$. Moreover, $\[ Sigma M \, M \] = 0$, by the same cofiber sequence and the two vanishing homotopy
    groups. The extension is consequently unique. Smashing $5 "id"_M =
    0$ with any spectrum proves the assertion about coefficients.
    The products are induced by the usual tensor pairings of $K$-theory spectra and this fixed pairing on $M$. ◻
]

For a base ring $R$ and a class $beta in K_2 \( R \; 5 \)$, let

$ b : G_i \( X \; 5 \) arrow.r G_(i + 2) \( X \; 5 \) $

be left multiplication by the restriction of $beta$, whenever $X$ is an $R$-scheme.
  We use the same notation for $K$-groups, and write $b^2 = b compose b$.
  In particular $b^2 \( x \) = beta dot.op \( beta dot.op x \)$, with these parentheses.
  We use this fixed two-factor pairing without assuming an associative coefficient ring structure.

#thm([Lemma 2.2.])[
  (Compatibility with localization).  #emph[The operation $b$ commutes with the maps and boundary homomorphisms in
    the $G$-theory localization sequences over $R$, including localization at a generic point and arbitrary
    multiplicative localization in the Noetherian affine situations below.
    Under dévissage its action on a residue-field term is multiplication by the restricted class $beta$.
    It is also compatible with finite coherent pushforward and flat pullback over $R$.]
] <lem:bott-localization>

#proof[
  Tensoring with a finitely generated projective $R$-module is exact on coherent modules and preserves every
    specified support. Tensor product therefore gives compatible pairings by $K \( R \)$ on the supported, whole,
    and localized categories. These pairings respect the null composite in the localization diagram and hence its
    cofiber sequence. On a dévissage category, tensoring is tensoring with the restriction to the residue field.
    The projection formula for a finite map and the usual flat base-change identity are identities of these tensor
    functors. For each term $B$ of this localization triangle, use the pairing
  $ \( K \( R \) and M \) and \( B and M \) arrow.r K \( R \) and B and M and M arrow.r B and M \, $
  where the last arrow uses the integral tensor action and the fixed pairing on $M$.
    These pairings commute with all arrows of the triangle. Precomposing with the representative $beta :
    bb(S)^2 arrow.r K \( R \) and M$ gives the asserted diagrams for $b$; no integral lift of $beta$ is required.
    Its degree is even, so moving it across a boundary contributes no sign.
    Passage to a generic point follows by filtered localization.
    These assertions concern localization boundaries; the coefficient connecting map $partial_(upright("coef"))$
    is a different map. ◻
]

We will use the following precise instances of field Bott periodicity.
  They concern multiplication by the specified coefficient class,
  rather than an unspecified isomorphism between the groups.

#thm([Lemma 2.3.])[
  (The field Bott maps).  #emph[Let $H$ be a perfect field of characteristic different from $5$ containing a
    primitive fifth root $zeta_H$. Suppose that $beta_H in K_2 \( H \; 5 \)$ satisfies $partial_(upright("coef"))
    beta_H = \[ zeta_H \]$, and let $b$ denote its multiplication operation.]
  + #emph[If $"cd"_5 H lt.eq 3$, then
$ b : K_(2 r) \( H \; 5 \) arrow.r^(med tilde.op med) K_(2 r + 2) \( H \; 5 \) wide \( r gt.eq 1 \) . $

]
  + #emph[If $"cd"_5 H lt.eq 2$, then
$ b : K_(2 r + 1) \( H \; 5 \) arrow.r^(med tilde.op med) K_(2 r + 3) \( H \; 5 \) wide \( r gt.eq 0 \) . $

]
  + #emph[If $H$ is finite, then $b : K_i \( H \; 5 \) arrow.r
    K_(i + 2) \( H \; 5 \)$ is an isomorphism for every $i gt.eq 0$.]
  #emph[Over an algebraically closed field of characteristic different from $5$, the group in degree $2 j gt.eq
    0$ is generated by $b^j \( 1 \)$, and the odd-degree groups vanish.
    Here $1 in K_0 \( H \; 5 \)$ is the unit class, $b^0 \( 1 \) = 1$, and $b^j$ denotes iterated left multiplication.]
] <lem:bott>

The arithmetic and geometric arguments use the following instances of the lemma.
  For number fields and finite extensions of $bb(Q)_5$, the $5$-cohomological dimension is two;
  see #cite(label("Weibel2013")) VI.§7 and VI.8.2. For a one-variable function field over a finite extension of
  $bb(Q)_5$, the cohomological-dimension bound #cite(label("StacksProject")) Lemma 59.95.4,
  Tag #raw("0F0T") gives $5$-cohomological dimension at most $2 + 1 = 3$.
  In particular, the actual multiplication maps are

#[#set math.equation(numbering: n => "(2.3)")
 $ b^2 & : K_1 \( H \; 5 \) arrow.r^(med tilde.op med) K_5 \( H \; 5 \) &  &
   upright("for the number and local fields used below") \,\
b^2 & : K_2 \( J \; 5 \) arrow.r^(med tilde.op med) K_6 \( J \; 5 \) &  &
  upright("for the function field of the generic curve") . $ <eq:bott-maps-used>]

In each case the primitive root and the Bott class are obtained by restriction from the indicated base.
  For a finite field $H$ satisfying the lemma’s hypotheses, its finite-field clause also gives $b^2 :
  K_0 \( H \; 5 \) arrow.r^tilde.op K_4 \( H \; 5 \)$. In the arithmetic construction this will raise the target
  of the valuation homomorphism from degree zero to degree four.

#proof[
  We use the corrected, strongly convergent motivic spectral sequence with its finite-coefficient multiplicative
    structure:
  #[#set math.equation(numbering: n => "(2.4)")
   $ E_2^(p \, q) = H^(p - q) \( H \, bb(Z) \/ 5 \( - q \) \) arrow.r.double K_(- p - q) \( H \; 5 \) .
     $ <eq:motivic-ss>]
  This form of the spectral sequence is recorded in #cite(label("Weibel2013")) VI.4.2, Addendum VI.4.2.1,
    and VI.4.4. For the corrected construction, see #cite(label("Suslin2003")) Introduction and Theorem 6.1 (the
    locators use the #emph[Trudy] pagination). The product is the usual $K$-theory product on the abutment and the
    motivic cup product on $E_2$ #cite(label("FriedlanderSuslin2002")) Proposition 16.1 and Theorem 16.2.
    The Moore-space comultiplication used there corresponds by stable duality to a unital pairing on $M$.
    Its coefficient product agrees with ours by the uniqueness in Lemma 2.
  Write an $E_2$-term as $H^s \( H \, bb(Z) \/ 5 \( j \) \)$, of total $K$-degree $2 j - s$.
    Terms of negative weight vanish. For $j gt.eq 0$, the defining motivic complex $C_(*)
    bb(Z)_(upright("tr")) \( bb(G)_m^(and j) \) \[ - j \]$ is concentrated in cohomological degrees at most $j$.
    Global sections on the Nisnevich site of a field are exact,
    since every covering of the field point has a splitting, and derived reduction modulo five does not increase
    this upper degree. Thus the field motivic group vanishes when $s > j$.
    For $s lt.eq j$, the norm-residue and Beilinson–Lichtenbaum comparison theorems identify it with
  #[#set math.equation(numbering: n => "(2.5)")
   $ H_(upright("et"))^s \( H \, mu_5^(⊗ j) \) $ <eq:motivic-etale>]
  #cite(label("Voevodsky2011")) Theorems 6.16–6.17. These are the Rost–Voevodsky norm-residue theorem and its
    motivic comparison consequence, with the completion of the norm-residue argument in
    #cite(label("Weibel2009")); the earlier motivic formulation is #cite(label("SuslinVoevodsky2000")).
    In particular the terms of negative cohomological degree vanish.
    Under the dimension bounds below, only finitely many terms contribute to each total degree,
    so the resulting filtrations are finite. In these coordinates a differential $d_rho$, for $rho gt.eq 2$,
    goes from $\( s \, j \)$ to $\( s + 2 rho - 1 \, j + rho - 1 \)$.
  We first derive the algebraically closed case from this same spectral sequence.
    If $overline(H)$ is an algebraic closure of $H$, only the terms with $s = 0$ survive.
    In each degree $2 j gt.eq 0$ there is exactly one term, $H^0 \( overline(H) \, mu_5^(⊗ j) \) tilde.equiv
    bb(F)_5$, and in odd degree there is none. There are no possible differentials.
    Thus the edge map is an isomorphism in every even degree, and
  $ K_(2 j) \( overline(H) \; 5 \) tilde.equiv bb(F)_5 \, wide K_(2 j + 1) \( overline(H) \; 5 \) =
    0 wide \( j gt.eq 0 \) . $
  The coefficient sequence surjects $K_2 \( overline(H) \; 5 \)$ onto $overline(H)^times \[ 5 \] =
    mu_5 \( overline(H) \)$. Both groups have dimension one, so this boundary is an isomorphism.
    Consequently the restriction of $beta_H$ is nonzero, and so is its edge image.
    Multiplicativity now shows that each $b^j \( 1 \)$ over $overline(H)$,
    computed by iterated left multiplication, has nonzero edge image and generates the corresponding even group.
    This proves the last assertion of the lemma without a separate rigidity input.
  By naturality, the edge image $alpha in H^0 \( H \, mu_5 \)$ of $beta_H$ is nonzero:
    restriction on this $H^0$ group is injective, and its geometric image is the nonzero class just computed.
    The edge image of $b^r \( 1 \)$ is $alpha^(⊗ r)$. Since $H$ contains $mu_5$,
    this generates the one-dimensional group $H^0 \( H \, mu_5^(⊗ r) \)$.
    Hence this whole line consists of permanent cycles for every $r gt.eq 1$.
    Only $alpha eq.not 0$ is needed; no choice of an identification of $alpha$ with the specified primitive root
    is required.
  Suppose first that $"cd"_5 H lt.eq 3$. In total degree $2 r$, the only possible terms are
  $ H^0 \( H \, mu_5^(⊗ r) \) \, wide H^2 \( H \, mu_5^(⊗ \( r + 1 \)) \) . $
  There is no incoming differential to either term. The only possible outgoing differential from the first is
    $d_2$ to an $H^3$-term, and it vanishes by permanence of the Bott power.
    Every outgoing differential from the second has cohomological degree at least $5$ and is zero.
    We obtain a two-step filtration, expressed as
  #[#set math.equation(numbering: n => "(2.6)")
   $ 0 arrow.r H^2 \( H \, mu_5^(⊗ \( r + 1 \)) \) arrow.r K_(2 r) \( H \; 5 \) arrow.r
     H^0 \( H \, mu_5^(⊗ r) \) arrow.r 0 . $ <eq:even-field-filtration>]
  Multiplication by $beta_H$ preserves these filtrations and acts on both graded pieces by tensoring with $alpha$.
    Each such map is an isomorphism, proving (1).
  If $"cd"_5 H lt.eq 2$, the sole term in total degree $2 r + 1$ is $H^1 \( H \, mu_5^(⊗ \( r + 1 \)) \)$,
    with no possible nonzero differential. Multiplication by $beta_H$ again acts by tensoring with $alpha$.
    This proves (2). For a finite field, the same calculation applies in every positive degree since its
    $5$-cohomological dimension is one. In degree zero, the class $1$ generates $K_0 \( H \; 5 \)$ and
    $b \( 1 \) = beta_H$ generates $K_2 \( H \; 5 \) = H^0 \( H \, mu_5 \)$. This proves (3). ◻
]

== 3 An integral cyclotomic class <sec:arithmetic>

The coefficient exact sequence identifies the obstruction to lifting a degree-five coefficient class:
  it is a class in integral $K_4$ killed by five. We will show that this obstruction vanishes for one cyclotomic
  ring. The proof first uses localization to detect coefficient $K_4$ geometrically,
  then uses finite generation to eliminate all five-primary torsion.
  We finish by recording how the chosen integral lift behaves under the four cyclotomic automorphisms.

Fix a primitive fifth root of unity $zeta$, and put

$ N = bb(Q) \( zeta \) \, wide S = bb(Z) \[ zeta \, 1 \/ 5 \] \, wide u = zeta - 1 \, wide Delta =
  "Gal" \( N \/ bb(Q) \) . $

Let $chi : Delta arrow.r bb(F)_5^times$ be the character defined by $delta \( zeta \) = zeta^(chi \( delta \))$.
  We use the coefficient convention and product of Section 2.

===== 3.1 The cyclotomic ring. <the-cyclotomic-ring.>

We record the arithmetic facts that will control the localization sequence.
  Let $Phi_5 \( X \) = X^4 + X^3 + X^2 + X + 1$ be the fifth cyclotomic polynomial. The polynomial of $u$ is

$ Phi_5 \( 1 + T \) = T^4 + 5 T^3 + 10 T^2 + 10 T + 5 \, $

which is Eisenstein at five. In particular it is irreducible over $bb(Q)_5$,
  so $N$ has exactly one place above five. The ring $bb(Z)_5 \[ u \]$ is finite free over $bb(Z)_5$;
  irreducibility makes it a domain, and integrality gives dimension one.
  Its reduction modulo five is $bb(F)_5 \[ T \] \/ \( T^4 \)$, with unique maximal ideal generated by $T$.
  Thus $bb(Z)_5 \[ u \]$ is a Noetherian local domain with maximal ideal $\( 5 \, u \)$. The defining equation gives

$ u^4 = - 5 \( 1 + 2 u + 2 u^2 + u^3 \) . $

The factor in parentheses is a unit, since its residue modulo $\( 5 \, u \)$ is one.
  Hence $\( 5 \, u \) = \( u \)$, and $bb(Z)_5 \[ u \]$ is a discrete valuation ring.
  Being integrally closed with fraction field $bb(Q)_5 \( u \)$, it is the integer ring of that field,
  with residue field $bb(F)_5$ and ramification index four.

The norm of $u$ is $Phi_5 \( 1 \) = 5$. Since $Phi'_5 \( zeta \) = 5 zeta^4 \/ \( zeta - 1 \)$,
  the discriminant of the power basis $1 \, zeta \, zeta^2 \, zeta^3$ is

$ "N"_(N \/ bb(Q)) #scale(x: 120%, y: 120%)[\(] Phi'_5 \( zeta \) #scale(x: 120%, y: 120%)[\)] =
  frac(5^4, "N"_(N \/ bb(Q)) \( u \)) = 125 . $

Let $cal(O)_N$ be the ring of integers of $N$. The index of $bb(Z) \[ zeta \]$ in $cal(O)_N$ can therefore have no
  prime divisor other than five, by the discriminant-index formula.
  The local calculation above shows that this order is already maximal at five. Thus the index is one:

$ cal(O)_N = bb(Z) \[ zeta \] \, wide "disc" \( N \) = 125 . $

There are two complex places and no real places. Minkowski’s ideal-class bound #cite(label("MilneANT2020"))
  Chapter 4, Theorem 4.3 is consequently

$ frac(4 !, 4^4) (4 / pi)^2 sqrt(125) < 2 . $

Every ideal class has an integral ideal representative of positive integral norm at most this bound,
  hence of norm one. It follows that $"Pic" \( cal(O)_N \) = 0$, and localization gives $"Pic" \( S \) = 0$.

The norm calculation also shows that $u$ and all its conjugates are units in $S$.
  Every closed point $v$ of $"Spec" S$ has a finite residue field $k_v$ of characteristic different from five.
  The image of $zeta$ in $k_v$ has order exactly five: its order divides five,
  and it cannot be one because $u$ is a unit. These are precisely the residue fields to which we will apply the
  finite-field clause of Lemma 4.

===== 3.2 An equivariant coefficient class. <an-equivariant-coefficient-class.>

The determinant splits the unit homomorphism $S^times arrow.r K_1 \( S \)$,
  so $\[ zeta \] in K_1 \( S \)$ has order five. The coefficient exact sequence supplies $beta' in
  K_2 \( S \; 5 \)$ with $partial_(upright("coef")) beta' = \[ zeta \]$.
  This coefficient group is an $bb(F)_5$-vector space by Lemma 2, and $Delta$ acts on it by functoriality. Define

$ e_chi = 1 / 4 sum_(delta in Delta) chi \( delta \)^(- 1) delta in bb(F)_5 \[ Delta \] \, wide beta = e_chi beta' . $

Here $1 \/ 4$ is the inverse of $4$ in $bb(F)_5$. Naturality makes the coefficient boundary $Delta$-equivariant,
  and $delta \[ zeta \] = chi \( delta \) \[ zeta \]$. Hence $partial_(upright("coef")) beta =
  e_chi \[ zeta \] = \[ zeta \]$. Relabeling the sum gives $tau e_chi =
  chi \( tau \) e_chi$ for every $tau in Delta$, so

#[#set math.equation(numbering: n => "(3.1)")
 $ partial_(upright("coef")) beta = \[ zeta \] \, wide delta beta =
   chi \( delta \) beta quad \( delta in Delta \) . $ <eq:equivariant-bott>]

For any $S$-scheme on which the operation is used, let $b$ denote left multiplication by the restriction of
  $beta$, and put $b^2 = b compose b$. Thus $b^2 \( x \) = beta dot.op \( beta dot.op x \)$,
  with the indicated parentheses. The coefficient localization boundaries below are different from
  $partial_(upright("coef"))$; Lemma 3 states that $b$ commutes with the former.

The next lemma is the arithmetic reason that localization will leave only a single coefficient line.
  It concerns reductions of integral $K_2$-classes, not all of $K_2 \( N \; 5 \)$.

#thm([Lemma 3.1.])[
  (Unramified degree-two classes).  #emph[Let $N = bb(Q) \( zeta \)$ and $S =
    bb(Z) \[ zeta \, 1 \/ 5 \]$ as above. If a class in $K_2 \( N \) \/ 5$ has zero tame residue in $k_v^times \/
    k_v^(times 5)$ at every closed point $v$ of $"Spec" S$, then the class is zero.]
] <lem:cyclotomic-unramified>

#proof[
  Matsumoto’s symbol theorem #cite(label("Matsumoto1969")) §5,
    Theorem 5.10 and Corollary 5.11 gives the classical Steinberg-symbol presentation;
    see #cite(label("Weibel2013")) III.6.1 for its modern formulation.
    The classical-to-Quillen comparison #cite(label("Weibel2013")) IV.1.10.1 and IV.7.2 identifies this group with
    $K_2 \( N \)$. The degree-two norm-residue theorem #cite(label("Voevodsky2011")) Theorem 6.16 then gives
  $ K_2 \( N \) \/ 5 tilde.eq H^2 \( N \, mu_5^(⊗ 2) \) . $
  Use $zeta$ to identify one copy of $mu_5$ with the constant module $bb(Z) \/ 5$.
    The Kummer sequence identifies the resulting group $H^2 \( N \, mu_5 \)$ with $"Br" \( N \) \[ 5 \]$.
    Write $a$ for the Brauer class corresponding to the class in the lemma.
  For a closed point $v$ of $"Spec" S$, the residue characteristic is not five.
    The Quillen boundary on $K_2 \( N \)$ is the tame symbol.
    Under norm residue and the chosen twist identification, its reduction modulo five and the Brauer residue agree
    up to an overall sign depending on boundary conventions; in particular, their vanishing is equivalent.
    Indeed, write each field element as a power of a uniformizer times a unit.
    Both residues kill unit–unit symbols, and on a symbol consisting of a unit $epsilon.alt$ and a uniformizer
    they give the class of $macron(epsilon.alt)$, up to the corresponding sign.
    Bilinearity and the Steinberg relations give the general case #cite(label("Weibel2013")) V.6.1.2 and V.(6.6)
    #cite(label("Harari2023Brauer")) Proposition 7.10. Thus $a$ has zero Brauer residue at every finite place $v
    divides.not 5$.
  The completion $N_v$ has finite residue field $k_v$. For its henselian valuation ring,
    the kernel of the Brauer residue is $"Br" \( k_v \) = 0$ #cite(label("Harari2023Brauer")) Proposition 6.7 and
    Example 6.8(a). Consequently $a \|_(N_v) = 0$ at every $v divides.not 5$.
    The infinite completions are complex and have zero Brauer group. Only the single place above five remains.
    In the global Brauer invariant sequence, the sum of all local invariants is zero,
    so the invariant at this last place is zero. The local invariant is injective there,
    and the global restriction map is injective. These are the local and global Brauer statements in
    #cite(label("MilneCFT2020")) IV, Example 2.14(c)–(e), Proposition 4.3 and Remark 4.4(a);
    see also #cite(label("Weibel2013")) III.6 and VI.8.1.1. They imply $a = 0$, hence the original class is zero.
    No tame-residue calculation at the place above five is used. ◻
]

We can now eliminate the obstruction in integral $K_4$. The first part of the proof detects coefficient classes
  after passage to an algebraic closure; the last part explains why this also rules out integral five-primary torsion.

#thm([Lemma 3.2.])[
  (The integral torsion obstruction vanishes).  #emph[For $S = bb(Z) \[ zeta \, 1 \/ 5 \]$,
    one has $K_4 \( S \) \[ 5 \] = 0$.]
] <lem:cyclotomic-k4>

#proof[
  Because $S$ is a Dedekind ring with $"Pic" \( S \) = 0$, every divisor on $"Spec" S$ is principal.
    Equivalently, the normalized valuation map
  $ N^times arrow.r xor.big_(v in \( "Spec" S \)^(\( 1 \))) bb(Z) \, wide
    f mapsto #scale(x: 120%, y: 120%)[\(] v \( f \) #scale(x: 120%, y: 120%)[\)]_v \, $
  is surjective. The sums here and below have finite support.
    Quillen localization and dévissage for $S$ #cite(label("Quillen1973Higher")) §7,
    Proposition 3.2 and paragraph 3.4 identify the boundary from $K_1 \( N \; 5 \)$ with this valuation map modulo
    five. We use the positive normalized valuation convention #cite(label("Weibel2013")) Example V.6.1.2 and
    (V.6.6). Thus
  $ K_1 \( N \; 5 \) arrow.r xor.big_v K_0 \( k_v \; 5 \) $
  is surjective.
  The number field $N$ has $5$-cohomological dimension two #cite(label("Weibel2013")) VI.§7 and VI.8.2.
    The odd-degree clause of Lemma 4 therefore makes $b^2 : K_1 \( N \; 5 \) arrow.r
    K_5 \( N \; 5 \)$ an isomorphism. For every $v$, the finite field $k_v$ contains the primitive image of
    $zeta$, so the finite-field clause makes $b^2 : K_0 \( k_v \; 5 \) arrow.r
    K_4 \( k_v \; 5 \)$ an isomorphism as well. The same restricted class $beta$ acts on every term.
    Its compatibility with localization in Lemma 3 carries the last surjection to a surjection
  $ K_5 \( N \; 5 \) arrow.r xor.big_v K_4 \( k_v \; 5 \) . $
  In the exact localization segment
  $ K_5 \( N \; 5 \) arrow.r xor.big_v K_4 \( k_v \; 5 \) arrow.r K_4 \( S \; 5 \) arrow.r K_4 \( N \; 5 \) \, $
  the middle arrow is consequently zero. We obtain an injection
  #[#set math.equation(numbering: n => "(3.2)")
   $ K_4 \( S \; 5 \) arrow.r.hook K_4 \( N \; 5 \) . $ <eq:k4-restriction>]
  We next determine where this injected group can lie. Take $x in K_4 \( S \; 5 \)$ and write $x_N$ for its image.
    The even-degree clause of Lemma 4 gives $b : K_2 \( N \; 5 \) arrow.r^tilde.op K_4 \( N \; 5 \)$, so $x_N =
    b \( z \)$ for some $z in K_2 \( N \; 5 \)$. The localization residues of $x_N$ in $K_3 \( k_v \; 5 \)$ vanish
    because $x$ extends over $S$. Write $partial_v$ for the localization boundary at $v$. Compatibility with $b$ gives
  $ 0 = partial_v \( x_N \) = b #scale(x: 120%, y: 120%)[\(] partial_v z #scale(x: 120%, y: 120%)[\)] . $
  Here $partial_v z in K_1 \( k_v \; 5 \)$, and $b : K_1 \( k_v \; 5 \) arrow.r
    K_3 \( k_v \; 5 \)$ is injective by the finite-field clause. Thus every localization residue of $z$ is zero.
  On the other hand, $partial_(upright("coef")) z in K_1 \( N \) \[ 5 \] = N^times \[ 5 \] =
    chevron.l zeta chevron.r$. Choose $m in bb(F)_5$ such that this boundary equals $m \[ zeta \]$,
    and consider the corrected class $z - m beta_N$, where $beta_N$ is the restriction of $beta$.
    Equation (3.1) makes its coefficient boundary zero. Its localization residues are still zero,
    since $beta$ extends over $S$. Exactness of the coefficient sequence identifies this corrected class with an
    element of $K_2 \( N \) \/ 5$. Naturality of reduction with localization identifies its coefficient residues
    with the tame residues of that element. Lemma 5 therefore makes the corrected class zero. We have proved
  $ z = m beta_N \, wide x_N = m thin b \( beta_N \) . $
  Let $overline(N)$ be an algebraic closure of $N$. By the closed-field clause of Lemma 4,
    the restriction of $b \( beta_N \)$ is the nonzero square of a geometric Bott generator in
    $K_4 \( overline(N) \; 5 \)$. Restriction is therefore injective on the $bb(F)_5$-line spanned by
    $b \( beta_N \)$. Together with (3.2), this proves
  #[#set math.equation(numbering: n => "(3.3)")
   $ K_4 \( S \; 5 \) arrow.r.hook K_4 \( overline(N) \; 5 \) . $ <eq:k4-geometric-injection>]
  It remains to pass from coefficient detection to integral torsion.
    The same closed-field clause gives $K_5 \( overline(N) \; 5 \) = 0$.
    The coefficient exact sequence then gives $K_4 \( overline(N) \) \[ 5 \] = 0$.
    In fact $K_4 \( overline(N) \)$ has no nonzero element of any finite five-power order:
    a suitable multiple of such an element would have order five.
  Set $G = K_4 \( S \)$, and write $rho$ for coefficient reduction at each ring. Naturality gives the commutative square
  $ G & arrow.r^rho & K_4 \( S \; 5 \)\
arrow.b &  & arrow.b\
K_4 \( overline(N) \) & arrow.r^rho & K_4 \( overline(N) \; 5 \) . $
  The right vertical arrow is injective by (3.3). If $g in G$ has finite five-power order,
    its integral image in $K_4 \( overline(N) \)$ is zero. The square therefore gives $rho \( g \) = 0$.
    Since $G \/ 5$ injects into $K_4 \( S \; 5 \)$, this says $g in 5 G$.
    This conclusion holds for every element of five-power order, not just for elements killed by five.
  Finite generation now rules out a nonzero divisible primary subgroup.
    Quillen’s theorem makes $K_4 \( cal(O)_N \)$ finitely generated #cite(label("Quillen1973Finite")) §1,
    Theorem 1 and Remark (2); see also #cite(label("Weibel2013")) IV.6.9.
    Integral localization at the single place above five has the segment
  $ 0 = K_4 \( bb(F)_5 \) arrow.r K_4 \( cal(O)_N \) arrow.r G arrow.r K_3 \( bb(F)_5 \) = bb(Z) \/ 24 . $
  The two finite-field values are Quillen’s integral computation #cite(label("Quillen1972FiniteFields"));
    see #cite(label("Weibel2013")) IV.1.13. Thus $G$ is finitely generated.
    Write $G tilde.eq bb(Z)^r xor P xor T$, where $P$ is its finite five-primary torsion subgroup and $T$ is
    finite of order prime to five. We proved $P subset.eq 5 G$.
    If $p = 5 g in P$, the free component of $g$ is zero, and its $T$-component is zero because multiplication by
    five is an automorphism of $T$. Hence $g in P$, and $P subset.eq 5 P$. The reverse inclusion is automatic.
    Iterating $P = 5 P$ to the exponent of the finite group $P$ gives $P = 0$.
    In particular $K_4 \( S \) \[ 5 \] = 0$. ◻
]

The coefficient obstruction has now been removed. We choose the degree-five class whose two Bott factors produce
  the square of the cyclotomic character.

The cyclotomic-unit/Bott pattern has a methodological predecessor in Soulé’s coefficient and tower constructions
  #cite(label("Soule1987")) §§4.2–4.4, pp. 239–240. The fixed integral $K_5 \( S \)$-lift below is a separate
  deduction from $K_4 \( S \) \[ 5 \] = 0$, proved here.

#thm([Proposition 3.3.])[
  (Integral lift and conjugates).  #emph[Let $u = zeta - 1 in S^times$,
    and let $b$ be multiplication by the class $beta$ in (3.1). There exists $c in K_5 \( S \)$ such that
#[#set math.equation(numbering: n => "(3.4)")
 $ c med mod med 5 = b^2 \[ u \]_5 quad upright("in ") K_5 \( S \; 5 \) . $ <eq:integral-c>]

 For every $delta in Delta$,
#[#set math.equation(numbering: n => "(3.5)")
 $ \( delta c \) med mod med 5 = chi \( delta \)^2 b^2 \[ delta u \]_5 quad
   upright("in ") K_5 \( S \; 5 \) . $ <eq:conjugate-c>]

 For any fixed homomorphism $iota : S arrow.r H$ to a field, let $"res"_iota$ denote extension of scalars.
   Restriction of these equalities gives the corresponding identities in $K_5 \( H \; 5 \)$.
   In the second identity this means
$ "res"_iota \( delta c \) med mod med 5 = chi \( delta \)^2 b_iota^2 \[ iota \( delta u \) \]_5 \, $

 where $b_iota$ is multiplication by $"res"_iota \( beta \)$; no action of $delta$ on $H$ is required.]
] <prop:integral-lift>

#proof[
  Lemma 6 and the coefficient exact sequence give
  $ 0 arrow.r K_5 \( S \) \/ 5 arrow.r K_5 \( S \; 5 \) arrow.r K_4 \( S \) \[ 5 \] = 0 . $
  Consequently $K_5 \( S \) arrow.r K_5 \( S \; 5 \)$ is surjective, and $b^2 \[ u \]_5$ has an integral lift $c$.
    Applying $delta$ after reduction, then using naturality and bilinearity of the parenthesized product, gives
  $ \( delta c \) med mod med 5 & = delta #scale(x: 120%, y: 120%)[\(] beta dot.op \( beta dot.op \[ u \]_5 \)
    #scale(x: 120%, y: 120%)[\)]\
 & = \( delta beta \) dot.op #scale(x: 120%, y: 120%)[\(] \( delta beta \) dot.op \[ delta u \]_5
   #scale(x: 120%, y: 120%)[\)]\
 & = chi \( delta \)^2 beta dot.op \( beta dot.op \[ delta u \]_5 \) . $
  This proves (3.5); functoriality gives its restriction along $iota$.
    The construction made no equivariant choice of the integral lift $c$. ◻
]

== 4 A specialization criterion for supported classes <sec:specialization>

Our goal is to detect a sum of coefficient classes pushed forward from closed points of a curve.
  A vanishing sum would be a localization boundary. We first use the two Bott maps of Lemma 4 to express that
  boundary by ordinary tame symbols. The divisor boundary on a smooth model then imposes a relation on the special
  fiber, where a homomorphism from its Picard group can detect the contradiction.

#thm([Proposition 4.1.])[
  (Picard specialization).  #emph[Let $L$ be a finite extension of $bb(Q)_5$ containing $mu_5$,
    with valuation ring $R$ and residue field $k$. Let $cal(X) arrow.r
    "Spec" R$ be a smooth projective morphism of relative dimension one with geometrically integral fibers
$ C = cal(X)_L \, wide D = cal(X)_k . $

 For a closed point $q$ of $C$, let $r \( q \)$ be its specialization on $D$:
   it is the image of the closed point under the unique extension of $"Spec" kappa \( q \) arrow.r
   cal(X)$ to the valuation ring of $kappa \( q \)$. For a closed point $r$ of $D$,
   write $\[ r \] in "Pic" \( D \)$ for the class of the divisor $\( r \)$.
   Let $m gt.eq 0$ be an integer, and suppose that:]
  + #emph[$U$ is the spectrum of an arbitrary localization of the coordinate ring of a nonempty affine open of
    $C$, and $p_1 \, dots.h \, p_m$ are distinct $L$-rational closed points of $U$;]
  + #emph[$Z$ is a finite set of closed points of $D$, and every closed point $q$ of $C$ with $r \( q \) in.not
    Z$ belongs to $U$;]
  + #emph[$B$ is an abelian group killed by $5$, and $psi : "Pic" \( D \) arrow.r
    B$ is a homomorphism satisfying $psi \( \[ r \] \) = 0$ for every $r in Z$.]
  #emph[Put $r_i = r \( p_i \) in D \( k \)$. Choose $beta_L in K_2 \( L \; 5 \)$ with $partial_(upright("coef"))
    beta_L = \[ zeta \]$ for a primitive fifth root of unity $zeta$,
    and let $b$ be multiplication by its restrictions, with $b^2 = b compose b$.
    Let $v_L$ be the normalized valuation of $L$. For $a_i in L^times$ and $e_i in bb(F)_5$, the condition
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(i = 1)^m e_i v_L \( a_i \) thin psi \( \[ r_i \] \) eq.not 0 quad upright("in ") B $ <eq:specialization-test>]

 implies
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(i = 1)^m \( p_i \)_(*) #scale(x: 120%, y: 120%)[\(] e_i b^2 \[ a_i \]_5 #scale(x: 120%, y: 120%)[\)]
   eq.not 0 quad upright("in ") G_5 \( U \; 5 \) . $ <eq:specialization-conclusion>]

 Here $\[ a_i \]_5$ is the class of $a_i$ in $K_1 \( L \; 5 \) = L^times \/ L^(times 5)$,
   and the scalars in (4.1) act through the natural $bb(F)_5$-module structure on $B$.]
] <prop:specialization>

#proof[
  The sum in (4.1) is zero when $m = 0$, so its nonvanishing implies $m > 0$.
    Suppose, for a contradiction, that the sum in (4.2) is zero.
    We first turn this assumed relation into prescribed ordinary tame symbols on the generic curve.
  #emph[Localization and Bott untwisting.] Put $J = L \( C \)$ and $A_U = Gamma \( U \, cal(O)_U \)$.
    The ring $A_U$ is a localization of the coordinate ring of a smooth affine curve.
    It is therefore a Noetherian regular domain of dimension at most one, with fraction field $J$.
    Since one of the $p_i$ is retained, its dimension is one.
    Every finitely generated torsion $A_U$-module is killed by a nonzero element;
    the corresponding quotient of $A_U$ has dimension at most zero and is Noetherian, hence Artinian.
    Such a module has finite length, with simple factors the residue fields of the retained closed points.
    This argument does not require $U$ to be semilocal or the multiplicative set to be finite.
  Quillen localization for the torsion category, followed by dévissage and the coefficient convention in
    Section 2, gives the exact sequence
  #[#set math.equation(numbering: n => "(4.3)")
   $ K_6 \( J \; 5 \) arrow.r xor.big_(q in U^(\( 1 \))) K_5 \( kappa \( q \) \; 5 \) arrow.r
     G_5 \( U \; 5 \) . $ <eq:curve-localization>]
  The second arrow is the sum of coherent pushforwards from the points;
    the first is the vector of localization residues. These are ordinary localization and dévissage for a
    multiplicative set #cite(label("Quillen1973Higher")) §4, Theorem 3 and Corollary 2; §5, Theorems 4–5; §7,
    Proposition 3.2 and paragraph 3.4. The index set of this direct sum can be infinite,
    but each vector has finite support. Every $q in U^(\( 1 \))$ is a closed point of $C$,
    so $kappa \( q \)$ is a finite extension of $L$.
  Exactness now supplies $xi in K_6 \( J \; 5 \)$ whose residue at $p_i$ is $e_i
    b^2 \[ a_i \]_5$ and whose other residues in $U$ are zero.
    The field $J$ has $"cd"_5 J lt.eq 3$, and each $kappa \( q \)$ has $"cd"_5 kappa \( q \) = 2$.
    All these fields are perfect and contain the same primitive root by restriction from $L$.
    Thus Lemma 4 applies to the actual multiplication operations used here: it makes
  $ b^2 & : K_2 \( J \; 5 \) arrow.r K_6 \( J \; 5 \) &  & upright("surjective") \,\
b^2 & : K_1 \( kappa \( q \) \; 5 \) arrow.r K_5 \( kappa \( q \) \; 5 \) &  & upright("injective") . $
  Choose $xi_0 in K_2 \( J \; 5 \)$ with $xi = b^2 xi_0$. Write $partial_q^(\( 5 \))$ for a coefficient
    localization residue. The compatibility in Lemma 3 gives $partial_q^(\( 5 \)) \( b^2 xi_0 \) =
    b^2 partial_q^(\( 5 \)) xi_0$, with no sign because $b$ has even degree.
    Injectivity on the residue fields then yields
  #[#set math.equation(numbering: n => "(4.4)")
   $ partial_q^(\( 5 \)) xi_0 =
     cases(delim: "{", e_i \[ a_i \]_5 \, & q = p_i \,, 0 \, & q in U^(\( 1 \)) \\ { p_1 \, dots.h \, p_m } .)
     $ <eq:untwisted-residues>]
  There is still a coefficient obstruction to representing $xi_0$ integrally. Its coefficient boundary belongs to
  $ K_1 \( J \) \[ 5 \] = mu_5 \( J \) = chevron.l zeta chevron.r . $
  The last equality holds because $L$ already contains all fifth roots of unity.
    Hence there is $lambda in bb(F)_5$ with $partial_(upright("coef")) xi_0 = lambda \[ zeta \]$.
    Let $beta_U$ and $beta_J$ be the restrictions of $beta_L$.
    Naturality gives $partial_(upright("coef")) beta_J = \[ zeta \]$,
    while all localization residues of $beta_J$ on $U$ vanish because it extends as $beta_U$.
    This uses an extension over the $L$-scheme $U$, not an extension over $R$. The class
  $ eta = xi_0 - lambda beta_J in K_2 \( J \; 5 \) $
  therefore has zero coefficient boundary and the same residues as $xi_0$.
    The coefficient exact sequence in Section 2 supplies an integral representative $z in K_2 \( J \)$ of $eta$.
    Write $partial_q z in K_1 \( kappa \( q \) \) = kappa \( q \)^times$ for its ordinary tame symbol.
    Reduction of localization residues commutes with coefficient reduction, so (4.4) becomes
  #[#set math.equation(numbering: n => "(4.5)")
   $ \[ partial_q z \]_5 =
     cases(delim: "{", e_i \[ a_i \]_5 \, & q = p_i \,, 0 \, & q in U^(\( 1 \)) \\ { p_1 \, dots.h \, p_m } .)
     $ <eq:integral-tame-symbols>]
  In particular, $partial_q z$ is a fifth power in $kappa \( q \)^times$ at every retained point other than the
    $p_i$. We have obtained an ordinary $K_2$-class with the required control of its tame symbols.
    It remains to derive the relation that these symbols must satisfy on $D$.
  #emph[The horizontal divisor.] For each closed point $q$ of $C$,
    let $R_q$ be the valuation ring of the unique extension of the valuation of $L$ to $kappa \( q \)$,
    let $k_q$ be its residue field, and let $v_q$ be its normalized valuation.
    The extension $kappa \( q \) \/ L$ is finite, so $R_q$ is a DVR finite over $R$. Properness gives the extension
  $ j_q : "Spec" R_q arrow.r cal(X) $
  used to define $r \( q \)$. This map is finite. Indeed, its graph in $"Spec" R_q times_R
    cal(X)$ is a closed immersion because $cal(X) \/ R$ is separated,
    and the projection from this fiber product to $cal(X)$ is finite, being the base change of $"Spec" R_q arrow.r
    "Spec" R$. Set
  $ f_q = \[ k_q : kappa \( r \( q \) \) \] . $
  Smoothness over the regular DVR $R$ makes $cal(X)$ a regular surface, and its function field is $J$.
    The codimension filtration for coherent $K$-theory gives the following row of the coniveau complex:
  #[#set math.equation(numbering: n => "(4.6)")
   $ K_2 \( J \) arrow.r xor.big_(s in cal(X)^(\( 1 \))) kappa \( s \)^times arrow.r
     xor.big_(r in cal(X)^(\( 2 \))) bb(Z) . $ <eq:surface-complex>]
  The assertion needed here is only that the composite is zero:
    the first differential $d_1$ of the coniveau spectral sequence satisfies $d_1^2 =
    0$ #cite(label("Quillen1973Higher")) §7, Theorem 5.4 and equation (5.5).
    There is exactly one vertical point in $cal(X)^(\( 1 \))$, the generic point of the integral curve $D$.
    Its residue $partial_D z in k \( D \)^times$ contributes the principal divisor $"div"_D \( partial_D z \)$.
    The other codimension-one points are the closed points $q$ of $C$.
  We compute their contributions without assuming that a horizontal closure is normal.
    On $"Spec" R_q$, the localization boundary
  $ K_1 \( kappa \( q \) \) arrow.r K_0 \( k_q \) = bb(Z) $
  is the normalized valuation $v_q$: a unit has boundary zero,
    and a uniformizer $pi_q$ has boundary $\[ R_q \/ pi_q R_q \] = \[ k_q \]$ #cite(label("Weibel2013")) V.6.1.2
    and V.(6.6). Functoriality of coherent localization for the finite map $j_q$ identifies the horizontal
    boundary on $cal(X)$ with the pushforward of this DVR boundary #cite(label("Quillen1973Higher")) §7,
    paragraphs 2.7–2.8, Proposition 3.2 and paragraph 3.4. At the generic point this pushforward is the identity
    on $kappa \( q \)$. At the closed point it sends $\[ k_q \]$ to $\[ k_q : kappa \( r \( q \) \) \]
    thin \[ kappa \( r \( q \) \) \]$. Thus the contribution at $r \( q \)$ is exactly $f_q
    v_q \( partial_q z \)$. There is no additional ramification factor:
    the boundary already uses the normalized valuation on $kappa \( q \)$,
    and the closed-point pushforward contributes only the residue degree $f_q$.
  Define the horizontal divisor
  #[#set math.equation(numbering: n => "(4.7)")
   $ H \( z \) = sum_(q in C^(\( 1 \))) f_q v_q \( partial_q z \) thin \( r \( q \) \) . $ <eq:horizontal-divisor>]
  The sum is finite because the first arrow of (4.6) takes values in a direct sum.
    All codimension-two points of the proper surface lie on $D$.
    The identity $d_1^2 z = 0$ therefore says, as an equality of divisors on $D$,
  $ H \( z \) + "div"_D \( partial_D z \) = 0 . $
  Consequently
  #[#set math.equation(numbering: n => "(4.8)")
   $ \[ H \( z \) \] = 0 quad upright("in ") "Pic" \( D \) . $ <eq:horizontal-pic-zero>]
  #emph[The Picard test.] Apply $psi$ to (4.8). If $r \( q \) in Z$,
    the corresponding summand vanishes because $psi \( \[ r \( q \) \] \) = 0$.
    If $r \( q \) in.not Z$, the hypothesis on $U$ retains $q$.
    For such a point other than the $p_i$, (4.5) makes $v_q \( partial_q z \)$ divisible by five,
    so its contribution also vanishes in $B$. Finally, $kappa \( p_i \) = L$, $k_(p_i) = k = kappa \( r_i \)$,
    and hence $f_(p_i) = 1$ and $v_(p_i) = v_L$. The remaining congruence in (4.5) gives
  $ v_(p_i) \( partial_(p_i) z \) equiv e_i v_L \( a_i \) med \( mod med 5 \) . $
  The identity $psi \( \[ H \( z \) \] \) = 0$ is therefore
  $ sum_(i = 1)^m e_i v_L \( a_i \) thin psi \( \[ r_i \] \) = 0 quad upright("in ") B \, $
  contrary to (4.1). This proves (4.2). ◻
]

#prodef([Remark 4.2.])[
  (No Gersten exactness assumption).  The exactness in (4.3) comes from the torsion-category localization above,
    valid for the arbitrary localization $U$. On the mixed-characteristic surface we use only $d_1^2 =
    0$ in (4.6); no Gersten injectivity or exactness is assumed.
] <rem:no-gersten>

== 5 An elliptic quotient of the Fermat quartic <sec:finite-geometry>

The specialization criterion asks for a divisor-class homomorphism that kills the omitted points but detects a
  weighted sum of the chosen specializations. We construct it from a degree-two quotient of the Fermat quartic.
  The square of the cyclotomic character takes values $plus.minus 1$;
  the quotient will turn precisely these signs into elliptic negation.

Set

$ k_0 = bb(F)_(5^4) \, wide k = bb(F)_(5^8) . $

Over $bb(F)_5$, let $D$ be the projective plane curve

$ X^4 + Y^4 = Z^4 \, $

and let $E$ be the smooth projective model of

$ w^2 = s^4 + 1 . $

The partial derivatives show that $D$ is smooth, including after any extension of the ground field.
  It is geometrically integral: distinct projective plane components would intersect and produce a singular point.
  The polynomial $s^4 + 1$ has four simple roots. At infinity the coordinates $q = 1 \/ s$ and $r =
  w \/ s^2$ give $r^2 = 1 + q^4$, with two unramified points $r = plus.minus 1$ above $q = 0$.
  Thus the double cover $E arrow.r upright(bold(P))_s^1$ has exactly four branch points;
  the degree-two Hurwitz formula gives genus one.

There is a finite morphism of degree two

#[#set math.equation(numbering: n => "(5.1)")
 $ h : D arrow.r E \, wide s = X / Y \, wide w = Z^2 / Y^2 . $ <eq:elliptic-quotient>]

This is the familiar passage from a diagonal quartic to a genus-one quotient by a sign involution;
  related quotient constructions appear in #cite(label("FlynnWetherell2001")) §1, equations (1.1)–(1.3).
  We verify the particular map needed here. On $Y eq.not 0$, write $v = Z \/ Y$.
  The extension of function fields is obtained by adjoining $v$ with $v^2 = w$;
  the nontrivial involution $v mapsto - v$ proves that its degree is two.
  The resulting rational map extends to the smooth projective curves and is finite.
  It maps the four points of $D$ on $Z = 0$ to the four branch points of $E arrow.r upright(bold(P))^1$.

The eighth roots of unity lie in $k_0$, since $8 divides \( 5^4 - 1 \)$.
  Thus all four branch points are $k_0$-rational. Choose one, denoted by $o$, as the origin of $E_(k_0)$.
  Every fiber of $E arrow.r upright(bold(P))^1$ is linearly equivalent to $2 \( o \)$,
  so the involution $w mapsto - w$ is negation for this group law,
  using the identification of a degree-zero divisor class with its point on a genus-one curve with chosen origin
  #cite(label("Silverman2009")) Proposition III.3.4. In particular,
  every branch point represents a point of $E \[ 2 \] \( k_0 \)$.

We now construct the promised homomorphism on divisor classes.
  Write $D_k$ and $E_k$ for the base changes to $k$, and continue to denote the quotient map by $h : D_k arrow.r
  E_k$. The origin $o in E \( k_0 \)$ defines the group law on $E_k$. Put

$ Z_oo = D_k ∩ { Z = 0 } . $

Define

#[#set math.equation(numbering: n => "(5.2)")
 $ psi : "Pic" \( D_k \) & arrow.r E \( k \) \/ 5 E \( k \) \,\
 & mapsto \[ h_(*) D' - deg \( D' \) thin \( o \) \] med \( mod med 5 E \( k \) \) . $ <eq:elliptic-detector>]

Every line bundle on the smooth curve $D_k$ has a nonzero rational section and hence a representing divisor $D'$.
  On a closed point $r$,
  finite divisor pushforward is $h_(*) \( r \) = \[ kappa \( r \) : kappa \( h \( r \) \) \] \( h \( r \) \)$.
  Its degree is
  $\[ kappa \( r \) : kappa \( h \( r \) \) \] \[ kappa \( h \( r \) \) : k \] = \[ kappa \( r \) : k \]$,
  so it preserves degree over $k$. It takes principal divisors to principal divisors by the norm formula
  #cite(label("StacksProject")) Tag #raw("02RT"). The identification $"Pic"^0 \( E_k \) tilde.equiv
  E \( k \)$ sends $\[ \( R \) - \( o \) \]$ to $R$ #cite(label("Silverman2009")) Proposition III.3.4 and
  Remark III.3.5.1. Thus (5.2) is a well-defined homomorphism on the entire Picard group,
  including classes represented by nonrational closed points.
  For a $k$-rational point $r$ of $D_k$, it gives $psi \( \[ r \] \) = h \( r \)$ modulo $5 E \( k \)$.

Each point of $Z_oo$ is $k$-rational and maps to a branch point of $E_k arrow.r bb(P)_k^1$.
  Its degree-zero class is two-torsion, and hence zero modulo five. We have therefore proved

#[#set math.equation(numbering: n => "(5.3)")
 $ psi \( \[ r \] \) = 0 wide \( r in Z_oo \) . $ <eq:detector-at-infinity>]

It remains to find an orbit whose weighted image under $psi$ is nonzero.

For $a in bb(F)_5^times$, define an automorphism of $D$ by

$ g_a \( X : Y : Z \) = \( a X : a Y : Z \) . $

We will use the following orbit, with coefficients interpreted in the group $E \( k \) \/ 5 E \( k \)$.

#thm([Lemma 5.1.])[
  #emph[There are points $Q in E \( k_0 \)$ and $P in D \( k \)$ such that
$ Q in.not 5 E \( k \) \, wide h \( P \) = Q \, wide Z \( P \) eq.not 0 \, $

 and
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(a in bb(F)_5^times) a^2 psi \( \[ g_a P \] \) & = sum_(a in bb(F)_5^times) a^2 h \( g_a P \)\
 & = 4 Q eq.not 0 quad upright("in ") E \( k \) \/ 5 E \( k \) . $ <eq:weighted-orbit>]

]
] <lem:orbit>

#proof[
  The underlying curve $E$ has four points over $bb(F)_5$. At $s = 0$ there are two affine points,
    while at each nonzero $s$ the value $s^4 + 1 = 2$ is a nonsquare.
    There are also two rational points at infinity, since the leading coefficient of the quartic is a square.
    Choosing any rational point as origin over $bb(F)_5$, the Frobenius polynomial is therefore $T^2 - 2 T + 5$,
    and its roots compute extension-field point counts #cite(label("Silverman2009")) Theorem V.2.3.1.
    If $a_m$ is the sum of the $m$th powers of its roots, then
  $ a_0 = a_1 = 2 \, wide a_m = 2 a_(m - 1) - 5 a_(m - 2) . $
  It follows that $a_4 = - 14$ and
  $ \# E \( k_0 \) = 5^4 + 1 - a_4 = 640 . $
  This count is independent of the choice of origin. Hence, with origin $o$,
    the finite group $E \( k_0 \)$ has a point $Q in.not 5 E \( k_0 \)$.
  Such a point remains nondivisible by $5$ over $k$. In fact, if $Q = 5 R$ with $R in E \( k \)$,
    the trace for the quadratic extension $k \/ k_0$, using the group law defined over $k_0$, would give
  $ 2 Q = 5 #scale(x: 120%, y: 120%)[\(] R + "Frob"_(k_0) \( R \) #scale(x: 120%, y: 120%)[\)] quad
    upright("in ") E \( k_0 \) . $
  Multiplication by $2$ is invertible on $E \( k_0 \) \/ 5 E \( k_0 \)$, a contradiction.
    Every branch point is $2$-torsion and therefore divisible by $5$, so $Q$ is not a branch point.
    A fiber of the degree-two morphism $h$ has a point over an extension of $k_0$ of degree at most two.
    Since $k$ is its quadratic extension, we may choose $P in D \( k \)$ over $Q$.
    The description of $h$ on $Z = 0$ gives $Z \( P \) eq.not 0$.
  Finally, on the dense chart $Y eq.not 0$ the morphism $h compose g_a$ fixes $s$ and multiplies $w$ by $a^(- 2)$.
    It therefore agrees with $h$ when $a^2 = 1$ and with $\[ - 1 \] compose h$ when $a^2 = - 1$.
    These are identities of morphisms on all of $D$: they extend from the dense chart because $D$ is integral and
    the target is separated. This also covers the possibility that $Q$ is a point at infinity. Thus
  $ h \( g_a P \) = cases(delim: "{", Q \, & a^2 = 1 \,, - Q \, & a^2 = - 1 .) $
  Each weighted summand in (5.4) equals $Q$ modulo $5$. Their sum is $4 Q$,
    which is nonzero because multiplication by $4$ is invertible on $E \( k \) \/ 5 E \( k \)$. ◻
]

We fix $Q \, P$ as in the lemma. The homomorphism $psi$ kills $Z_oo$ by (5.3) and detects the weighted orbit of
  $P$ by (5.4). The next section realizes these four specializations as the conjugates of one horizontal divisor.
  Curves and morphisms in residue characteristic will henceforth be viewed over $k$.

== 6 The regular local ring and its split divisor <sec:local-geometry>

We next realize the four-point orbit as the specialization of a split horizontal divisor.
  The construction has three parts: choose a cyclotomic uniformizer with controlled conjugates,
  map the ramified regular local ring onto the cyclotomic valuation ring,
  and split this divisor by a flat scalar extension.

Let $H_0 \/ bb(Q)_5$ be the unramified extension of degree eight, and let $V$ be its ring of integers,
  with residue field identified with $k$. Retain the cyclotomic notation $zeta$, $u = zeta - 1$, $Delta =
  "Gal" \( bb(Q) \( zeta \) \/ bb(Q) \)$, and $chi : Delta arrow.r^tilde.op bb(F)_5^times$.
  Choose an embedding of $bb(Q) \( zeta \)$ into an algebraic closure of $H_0$, and put

$ L = H_0 \( zeta \) \, wide cal(O) = upright("the ring of integers of ") L . $

The translated cyclotomic equation

$ u^4 + 5 u^3 + 10 u^2 + 10 u + 5 = 0 $

is Eisenstein over $V$. Consequently $L \/ H_0$ is totally ramified of degree four,
  $u$ is a uniformizer of $cal(O)$, and the residue field is $k$.
  Restriction identifies $"Gal" \( L \/ H_0 \)$ with $Delta$.

There is a uniformizer $t in cal(O)$ satisfying

#[#set math.equation(numbering: n => "(6.1)")
 $ t^4 = - 5 \, wide t / u equiv 1 med \( mod med u \) \, wide frac(delta \( t \), t) in mu_4 \( V \) \, wide
   overline(frac(delta \( t \), t)) = chi \( delta \) . $ <eq:cyclotomic-uniformizer>]

To construct it, the cyclotomic equation gives

$ frac(u^4, - 5) = 1 + 2 u + 2 u^2 + u^3 . $

The inverse of this unit has a fourth root congruent to $1$ modulo $u$ by Hensel’s lemma;
  multiply $u$ by that root. The quotient $delta \( t \) \/
  t$ is a fourth root of unity and has residue $chi \( delta \)$, because $delta \( u \) \/ u$ has that residue.
  All fourth roots of unity lie in $V$, again by Hensel’s lemma.

We also have

#[#set math.equation(numbering: n => "(6.2)")
 $ V \[ t \] = cal(O) . $ <eq:monogenic-dvr>]

For completeness, $T^4 + 5$ is Eisenstein, so $V \[ t \]$ is finite free over $V$ and has fraction field $L$.
  Reduction modulo $5$ shows that it is local, with maximal ideal $\( 5 \, t \) = \( t \)$.
  Its dimension is one, hence it is a DVR. It is therefore integrally closed in $L$,
  and every element of $cal(O)$, being integral over $V$, belongs to $V \[ t \]$.

Write $P = \( macron(X)_0 : macron(Y)_0 : 1 \)$. Hensel’s lemma supplies lifts $X_0 \, Y_0 in V$ with

#[#set math.equation(numbering: n => "(6.3)")
 $ X_0^4 + Y_0^4 = 1 . $ <eq:lifted-point>]

Indeed, at least one of $macron(X)_0 \, macron(Y)_0$ is nonzero, and the corresponding partial derivative is a unit.

#thm([Lemma 6.1.])[
  #emph[The ring
#[#set math.equation(numbering: n => "(6.4)")
 $ A = #scale(x: 120%, y: 120%)[\(] V \[ x \, y \] \/ \( 5 + x^4 + y^4 \)
   #scale(x: 120%, y: 120%)[\)]_(\( 5 \, x \, y \)) $ <eq:counterexample-ring>]

 is a regular local domain of dimension two. The assignment
#[#set math.equation(numbering: n => "(6.5)")
 $ A arrow.r cal(O) \, wide x mapsto t X_0 \, wide y mapsto t Y_0 $ <eq:closed-divisor-map>]

 is a surjective local homomorphism with nonzero height-one kernel.]
] <lem:local-ring>

#proof[
  The regular local ring $V \[ x \, y \]_(\( 5 \, x \, y \))$ has dimension three.
    The equation $5 + x^4 + y^4$ is congruent to $5$ modulo the square of its maximal ideal,
    so it is part of a regular system of parameters. Its quotient is regular local of dimension two and is a
    domain #cite(label("StacksProject")) Tags #raw("00NQ") and #raw("00NP").
  Equations (6.1) and (6.3) show that the assignment respects the defining equation.
    Every denominator inverted in (6.4) has nonzero constant residue at $x = y = 0$,
    hence maps to a unit of $cal(O)$. Thus the homomorphism is defined and local.
    At least one of $X_0 \, Y_0$ is a unit of $V$, so its image contains $t$. Surjectivity follows from (6.2).
  The element $Y_0 x - X_0 y$ belongs to the kernel and has nonzero image in $frak(m)_A \/ frak(m)_A^2$.
    In particular the kernel is nonzero. It is a nonmaximal prime, since the quotient $cal(O)$ is a DVR,
    and therefore has height one in the two-dimensional local domain $A$.
    Since $Y_0 x - X_0 y$ is a regular parameter, it generates a height-one prime and hence generates this kernel. ◻
]

We have obtained the closed divisor that will support the integral class.
  To detect its pushforward, we now identify the generic curve on which this support separates into conjugate points.

Let

$ cal(D) = "Proj" #scale(x: 120%, y: 120%)[\(] cal(O) \[ X \, Y \, Z \] \/ \( X^4 + Y^4 - Z^4 \)
  #scale(x: 120%, y: 120%)[\)] \, wide C = cal(D)_L \, wide T = "Spec" \( A ⊗_V L \) . $

The model $cal(D)$ is projective. Over an algebraic closure of either $L$ or $k$,
  the three partial derivatives $4 X^3 \, 4 Y^3 \, - 4 Z^3$ cannot vanish at a projective point.
  Thus each geometric fiber is smooth of dimension one. Each is also integral:
  smoothness makes it reduced, while two distinct plane components would intersect and create a singularity.
  The same Jacobian calculation on the relative affine charts, where $4$ is invertible,
  proves smoothness over $cal(O)$ #cite(label("StacksProject")) Tag #raw("00TE"). Hence $cal(D)$ is regular.
  Flatness over the DVR excludes a component supported in the special fiber, and the generic fiber is integral;
  therefore $cal(D)$ is an integral surface with special fiber $D_k$.

#thm([Lemma 6.2.])[
  #emph[The scheme $T$ is regular, integral, Noetherian, and one-dimensional,
    and its morphism to $"Spec" A$ is flat. The substitutions
$ X \/ Z = x \/ t \, wide Y \/ Z = y \/ t $

 identify $T$ with the spectrum of a localization of the coordinate ring of the chart $Z eq.not 0$ in $C$.]
  #emph[The base change to $T$ of the closed immersion $"Spec" cal(O) arrow.r
    "Spec" A$ in (6.5) is the disjoint union of four $L$-rational closed points $p_delta$,
    indexed by $delta in Delta$. Their coordinates are
#[#set math.equation(numbering: n => "(6.6)")
 $ p_delta : quad \( X \/ Z \, Y \/ Z \) = (frac(delta \( t \), t) X_0 \, frac(delta \( t \), t) Y_0) .
   $ <eq:split-points>]

 Their specializations on $cal(D)$ are $g_(chi \( delta \)) P$.
   The factor indexed by $delta$ is obtained from $cal(O)$ by the map $a mapsto delta \( a \)$ into $L$.]
] <lem:splitting>

#proof[
  The $V$-module $L$ is flat, since $V arrow.r H_0$ is a localization and $L$ is a vector space over $H_0$.
    The substitution $x = t X$, $y = t Y$ transforms $5 + x^4 + y^4 = 0$ into $X^4 + Y^4 = 1$.
    Tensoring and localizing therefore give the asserted description of $T$.
    Its coordinate ring is a localization of the coordinate ring of a smooth geometrically integral affine curve
    over $L$; it is regular, integral, and Noetherian, of dimension at most one.
  Since $5$ is invertible in the second tensor factor, the coordinate ring of the base-changed divisor is
  #[#set math.equation(numbering: n => "(6.7)")
   $ cal(O) ⊗_V L = L ⊗_(H_0) L arrow.r^tilde.op product_(delta in Delta) L \, wide
     a ⊗ b mapsto \( delta \( a \) b \)_delta . $ <eq:divisor-tensor-splitting>]
  Here $cal(O) \[ 1 \/ 5 \] = L$, and the last isomorphism is the usual splitting of a finite Galois extension.
    The images of $x$ and $y$ on the $delta$-factor are $delta \( t \) X_0$ and $delta \( t \) Y_0$, giving (6.6).
    Every inverted denominator evaluates to a unit of $cal(O)$, so these factors indeed define points of $T$.
    They are distinct: the ratios $delta \( t \) \/ t$ are the four different fourth roots of unity,
    and at least one of $X_0 \, Y_0$ is a unit. Thus $T$ has closed points and has dimension one.
  The coordinates in (6.6) are integral over $cal(O)$ and satisfy the Fermat equation,
    so they define sections of $cal(D)$. Reducing (6.1) gives their stated specializations.
    The last assertion follows directly from the factor maps in (6.7). ◻
]

== 7 The nonzero integral kernel class <sec:main-proof>

The proof now has all three inputs: the integral cyclotomic class,
  the divisor $"Spec" cal(O) subset "Spec" A$ and its four split points, and the specialization criterion.
  We first push forward integrally to obtain a class killed by generic restriction.
  We then detect its coefficient reduction after flat pullback by the elliptic orbit.

#proof[
  Let $c in K_5 \( S \)$ be the class from Proposition 7, and write $c_L in
    K_5 \( L \)$ for its restriction along $S arrow.r L$. There is no map $S arrow.r cal(O)$ in this construction,
    since $5$ is invertible in $S$. Instead, integral localization for the DVR $cal(O)$ gives
  $ K_5 \( cal(O) \) arrow.r K_5 \( L \) arrow.r K_4 \( k \) = 0 \, $
  where the last equality is Quillen’s computation for finite fields #cite(label("Quillen1972FiniteFields"));
    see also #cite(label("Weibel2013")) IV.1.13. The residue field here has characteristic five;
    the equality is the integral finite-field calculation. Choose an integral lift $tilde(c) in K_5 \( cal(O) \)$.
    The closed immersion $i : "Spec" cal(O) arrow.r.hook "Spec" A$ of Lemma 11 defines
  $ gamma = i_(*) tilde(c) in G_5 \( A \) = K_5 \( A \) . $
  The equality uses the canonical resolution isomorphism for the regular ring $A$.
    Restriction to $"Frac" A$ annihilates every coherent module supported on $"Spec" cal(O)$.
    Thus $gamma$ is in the kernel of the canonical augmentation, integrally.
  To show that it is nonzero, make the flat base change $V arrow.r L$. The square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$product.co_(delta in Delta) "Spec" L$])
  content((3.047, 0), [$T$])
  content((0, -1.585), [$"Spec" cal(O)$])
  content((3.047, -1.585), [$"Spec" A$])
  line((0.996, 0), (2.711, 0), mark: (end: ">"))
  content((1.854, 0.2266), [#text(size: 0.73em)[$product.co p_delta$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  line((3.047, -0.2725), (3.047, -1.313), mark: (end: ">"))
  line((0.732, -1.585), (2.381, -1.585), mark: (end: ">"))
  content((1.557, -1.359), [#text(size: 0.73em)[$i$]])
})
  is Cartesian by Lemma 12. To check flat base change with the point indices, put $B_T = A ⊗_V L$.
    For every finitely generated $cal(O)$-module $M$, scalar extension gives natural isomorphisms of $B_T$-modules
  #[#set math.equation(numbering: n => "(7.1)")
   $ B_T ⊗_A i_(*) M & tilde.eq \( cal(O) ⊗_V L \) ⊗_(cal(O)) M\
 & tilde.eq xor.big_(delta in Delta) L ⊗_(cal(O) \, delta) M . $ <eq:module-base-change>]
  The $delta$-summand is a $B_T$-module through the quotient defining $p_delta$. These are exact functors:
    $B_T$ is flat over $A$, and each map $cal(O) arrow.r L$ is a localization followed by an automorphism.
    Thus (7.1) proves the required identity on integral coherent $K$-theory.
  Write $iota : S arrow.r L$ for the fixed embedding. Since $tilde(c)$ restricts to $c_L = "res"_iota c$,
    its image on the $delta$-factor is
  $ "res"_(delta : cal(O) arrow.r L) tilde(c) = "res"_(iota compose delta) c = "res"_iota \( delta c \) . $
  The equality uses the specified identification $Delta = "Gal" \( L \/ H_0 \)$ and requires no equivariance of
    the chosen DVR preimage. Consequently, still integrally,
  $ gamma \|_T = sum_(delta in Delta) \( p_delta \)_(*) "res"_iota \( delta c \) . $
  Naturality of coefficient reduction and Proposition 7 now give
  #[#set math.equation(numbering: n => "(7.2)")
   $ overline(gamma \|_T) = sum_(delta in Delta) \( p_delta \)_(*) #scale(x: 120%, y: 120%)[\(] chi \( delta \)^2
     b^2 \[ delta u \]_5 #scale(x: 120%, y: 120%)[\)] quad upright("in ") G_5 \( T \; 5 \) . $ <eq:gamma-split>]
  Here $b$ uses the fixed embedding $S arrow.r L$, and the character factors come from Proposition 7.
    No choice of the integral lift $tilde(c)$ affects this formula.
  Apply Proposition 8 to the model $cal(D) \/ cal(O)$, to $U = T$,
    and to the set $Z_oo$ and homomorphism $psi$ constructed in Section 5.
    The required specialization condition follows directly from the definition of $A$:
    let $q$ be any closed point of $C$ and let $cal(O)_q$ be the valuation ring of its finite residue-field
    extension $kappa \( q \) \/ L$. If $q$ specializes in the chart $Z eq.not 0$,
    the proper extension $"Spec" cal(O)_q arrow.r cal(D)$ lies in that chart,
    since an open set containing the closed point of a DVR contains its generic point.
    Hence $X \/ Z$ and $Y \/ Z$ belong to $cal(O)_q$. The original coordinates $x = t X \/ Z$ and $y =
    t Y \/ Z$ have positive valuation. Every denominator inverted outside $\( 5 \, x \, y \)$ has nonzero constant
    residue and hence is a unit at $q$. Thus $q$ belongs to $T$.
  All the hypotheses of Proposition 8 are now verified: the smooth model and localized chart come from Section 6,
    the retained-point condition holds for every closed point,
    and (5.3) says that $psi$ kills the entire set $Z_oo$. The points $p_delta$ specialize to $g_(chi \( delta \))
    P$ and are $L$-rational. Every $delta u$ is a uniformizer, so $v_L \( delta u \) = 1$.
    The sum tested by Proposition 8 for (7.2) is therefore
  $ sum_(delta in Delta) chi \( delta \)^2 psi \( \[ g_(chi \( delta \)) P \] \) = 4 Q eq.not 0 quad
    upright("in ") E \( k \) \/ 5 E \( k \) \, $
  by Lemma 10. It follows that $overline(gamma \|_T) eq.not 0$.
    Hence $gamma eq.not 0$ in the original integral group, as required. ◻
]

#prodef([Remark 7.1.])[
  Although the divisor $i$ is principal, its pushforward need not vanish on all higher $K$-groups.
    The self-intersection formula gives $i^(*) i_(*) = 0$ here; the projection formula gives $i_(*) i^(*) = 0$.
    Neither formula asserts $i_(*) = 0$. In particular, the proof does not assume that $tilde(c)$ is the
    restriction of a class on $A$.
]

The positions in the signed orbit matter for this detector.
  Forgetting them and retaining only the four normalized valuations, all equal to one, gives the scalar sum $1 +
  4 + 4 + 1 = 0$ in $bb(F)_5$. The Picard test retains the points and instead gives $4 Q$.
  This calculation describes that particular scalar forgetting; it makes no assertion about all scalar functionals.

== 8 A claimed vanishing theorem for principal divisors <app:claimed-vanishing>

Mochizuki’s Theorem 5 in version 8 of #cite(label("Mochizuki2020")) asserts that,
  for a commutative Noetherian local ring $B$ and a nonzerodivisor $g$,
  the inclusion from finitely generated projective $B \/ g B$-modules to finitely generated $B$-modules of
  projective dimension at most one induces zero on $K$-theory.
  This statement reaches the exact support in the present paper:
  Lemma 11 gives $B = A$, $g = Y_0 x - X_0 y$, and $A \/ g A = cal(O)$, with $g$ a regular parameter.
  Composing the claimed zero map with the inclusion into coherent $A$-modules would annihilate $i_(*) tilde(c)$.

We give a counterexample to the functor assertion in #cite(label("Mochizuki2020")) Lemma 13(III),
  which is used in that proof. The counterexample already has both $B$ and $B \/ g B$ regular.
  It concerns the supplied proof of the vanishing assertion;
  a failure of this construction alone does not disprove the assertion itself.
  The proof of Theorem 1 above is independent of it.

=== The complexes and the proposed operation <the-complexes-and-the-proposed-operation>

Let $B$ be a regular local ring and let $g$ be a nonzero regular parameter.
  In particular $g$ is a nonzerodivisor in the maximal ideal, and $1 - g$ is a unit.
  The exact category $cal(C)$ used in the cited argument consists of two-term complexes of finite free
  $B$-modules, in homological degrees one and zero, whose differential is injective and whose cokernel is killed
  by $g$. Exact sequences are degreewise exact. We use only the objects

$ \( n \, m \)_B = [B^n xor B^m arrow.r^("diag" \( g I_n \, I_m \)) B^n xor B^m] quad \( n \, m gt.eq 0 \) $

and split exact sequences between them. Thus no classification of other objects of $cal(C)$ is needed for the example.

For $X = \( 1 \, 1 \)_B$, put $D = "diag" \( g \, 1 \)$. Following the block convention in
  #cite(label("Mochizuki2020")) Conventions 11, equations (15)–(16), an encoded endomorphism $M =
  mat(delim: "(", a, b; c, d)$ has actual matrices

#[#set math.equation(numbering: n => "(8.1)")
 $ M_1 = mat(delim: "(", a, b; g c, d) \, wide M_0 = mat(delim: "(", a, g b; c, d) . $ <eq:mochizuki-chain-matrices>]

These satisfy $D M_1 = M_0 D$. Conversely, the chain-map condition,
  together with the fact that $g$ is a nonzerodivisor, gives this presentation.
  Multiplying the actual matrices shows that composition of the encoded matrices is

#[#set math.equation(numbering: n => "(8.2)")
 $ mat(delim: "(", a', b'; c', d') star.op mat(delim: "(", a, b; c, d) =
   mat(delim: "(", a' a + g b' c, a' b + b' d; c' a + d' c, g c' b + d' d) . $ <eq:mochizuki-matrix-composition>]

Thus $M' star.op M$ represents $M' compose M$. Upper triangular means $c = 0$, and lower triangular means $b = 0$;
  these terms refer to the encoded matrices.

Write $"Typ" \( h \) = \[ B arrow.r^h B \]$ for $h in B$.
  The assignments $mu'_1 \, mu'_2$ preceding Definition 12 in #cite(label("Mochizuki2020")) replace
  $\( n \, m \)_B$ by $"Typ" \( g \)^(xor n)$ or $"Typ" \( 1 \)^(xor n)$, respectively.
  On a morphism they retain its upper-left block in both chain degrees.
  On all morphisms this is not a functor, because the upper-left entry of (8.2) contains $g b' c$.
  The cited argument therefore restricts the diagrams and their maps.

Here is the part of that restriction needed below. An $S_2$-object in an exact category is an admissible short
  exact sequence $X_01 arrow.r.tail X_02 arrow.r.twohead X_12$, together with the zero objects on its diagonal;
  morphisms are commuting maps of these sequences. Definition 12 of #cite(label("Mochizuki2020")) requires upper
  triangular structure arrows and allows lower triangular componentwise isomorphisms between the diagrams.
  Lemma 13(III) asserts that $mu'_1 \, mu'_2$ induce functors on this modified $S$-construction.
  The following example violates the naturality required of an image morphism already in degree two.

#thm([Lemma 8.1.])[
  #emph[For every regular local ring $B$ with a nonzero regular parameter $g$,
    the upper-left-block assignments just described fail to send all lower triangular isomorphisms between upper
    triangular $S_2$-objects to morphisms of the target diagrams.]
] <lem:triangular-naturality-failure>

#proof[
  Take the encoded endomorphisms of $X = \( 1 \, 1 \)_B$
  $ U = mat(delim: "(", 1, 1; 0, 1) \, wide U' = mat(delim: "(", 1 - g, 1; 0, 1) \, wide L =
    mat(delim: "(", 1, 0; 1, 1) \, wide L' = mat(delim: "(", 1, 0; 1, 1 - g) . $
  Their actual chain matrices are
  $ U_1 = mat(delim: "(", 1, 1; 0, 1) & U_0 = mat(delim: "(", 1, g; 0, 1)\
U'_1 = mat(delim: "(", 1 - g, 1; 0, 1) & U'_0 = mat(delim: "(", 1 - g, g; 0, 1)\
L_1 = mat(delim: "(", 1, 0; g, 1) & L_0 = mat(delim: "(", 1, 0; 1, 1)\
L'_1 = mat(delim: "(", 1, 0; g, 1 - g) & L'_0 = mat(delim: "(", 1, 0; 1, 1 - g) . $
  In each degree the determinants of $U \, U' \, L \, L'$ are, respectively, $1 \, 1 - g \, 1 \, 1 - g$.
    All are units, so these are chain isomorphisms. The first two are upper triangular and the last two lower
    triangular. A direct calculation with (8.2) gives
  $ L' star.op U = mat(delim: "(", 1, 1; 1, 1) = U' star.op L . $
  Equivalently, both degree-one composites are $mat(delim: "(", 1, 1; g, 1)$ and both degree-zero composites are
    $mat(delim: "(", 1, g; 1, 1)$. Hence the diagram
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X$])
  content((2.057, 0), [$X$])
  content((4.115, 0), [$0$])
  content((0, -1.239), [$X$])
  content((2.057, -1.239), [$X$])
  content((4.115, -1.239), [$0$])
  line((0.336, 0), (1.721, 0), mark: (end: ">"))
  content((1.029, 0.2266), [#text(size: 0.73em)[$U$]])
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  content((-0.3223, -0.6193), [#text(size: 0.73em)[$L$]])
  line((2.393, 0), (3.779, 0), mark: (end: ">"))
  line((2.057, -0.2725), (2.057, -0.9661), mark: (end: ">"))
  content((2.428, -0.6193), [#text(size: 0.73em)[$L'$]])
  line((4.225, -0.2725), (4.225, -0.9661))
  line((4.005, -0.2725), (4.005, -0.9661))
  line((0.336, -1.239), (1.721, -1.239), mark: (end: ">"))
  content((1.029, -1.465), [#text(size: 0.73em)[$U'$]])
  line((2.393, -1.239), (3.779, -1.239), mark: (end: ">"))
})
  commutes. Each row is split exact since its first arrow is an isomorphism.
    Besides that first arrow, all structure arrows of the corresponding $S_2$-object are zero or identity maps and
    are therefore upper triangular. The vertical maps $\( L \, L' \, "id"_0 \)$ are lower triangular isomorphisms.
    Thus the diagram is a morphism in the proposed source category.
  Both upper-left entries of $L \, L'$ are $1$, whereas those of $U \, U'$ are $1 \, 1 - g$.
    Either assignment would therefore send the left square to
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$"Typ" \( h \)$])
  content((2.783, 0), [$"Typ" \( h \)$])
  content((0, -1.585), [$"Typ" \( h \)$])
  content((2.783, -1.585), [$"Typ" \( h \) \,$])
  line((0.666, 0), (2.117, 0), mark: (end: ">"))
  content((1.392, 0.2266), [#text(size: 0.73em)[$1$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.3223, -0.7927), [#text(size: 0.73em)[$1$]])
  line((2.783, -0.2725), (2.783, -1.313), mark: (end: ">"))
  content((3.106, -0.7927), [#text(size: 0.73em)[$1$]])
  line((0.666, -1.585), (2.051, -1.585), mark: (end: ">"))
  content((1.359, -1.812), [#text(size: 0.73em)[$1 - g$]])
})
$wide h = g upright(" or ") h = 1 .$
  Its two composites are $1$ and $1 - g$ in both degrees. They are unequal because $g eq.not 0$.
    The proposed image is therefore not a morphism of $S_2$-diagrams. ◻
]

The calculation identifies the precise missing condition:
  preservation of upper–upper and lower–lower compositions does not imply preservation of mixed upper–lower
  commuting squares. In version 8 the encoded composition and assignments appear on page 9,
  Lemma 13(III) on page 10, and the subsequent additivity argument on page 11.
  That argument uses the asserted functors in Lemma 13(IV) and in the proof of assertion $\( beta \)$.
  Although the two projected composites can be chain homotopic,
  the target category requires strictly commuting natural transformations.
  The later homotopy comparison does not define replacement functors on this square.
  A construction that supplies the required higher compatibilities and additivity would be an additional argument.

#bibliography("refs.bib", style: "ieee", title: [References])
