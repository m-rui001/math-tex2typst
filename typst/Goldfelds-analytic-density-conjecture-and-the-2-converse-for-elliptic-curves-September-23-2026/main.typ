#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Goldfeld's analytic density conjecture \
and the $2$-converse for elliptic curves]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $E$ be an elliptic curve over $bb(Q)$. Write

$ a \( E \) = "ord"_(s = 1) L \( E \, s \) \, #h(2em) r \( E \) = "rank"_(bb(Z)) E \( bb(Q) \) \, #h(2em) c_2 \( E \) = "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ bb(Q) \) . $

The Selmer group uses the local Kummer conditions at every place. Its corank includes both the Mordell–Weil rank and any divisible $2$-primary contribution from the Tate–Shafarevich group. Modularity supplies the analytic continuation and functional equation of $L \( E \, s \)$ #cite(label("BreuilConradDiamondTaylor2001")).

#thm([Theorem 1.1.])[
  (The $2$-converse).  #emph[For every elliptic curve $E \/ bb(Q)$ with $c_2 \( E \) in { 0 \, 1 }$, 
$ a \( E \) = r \( E \) = c_2 \( E \) \, #h(2em) "Sha" \( E \/ bb(Q) \) upright(" is finite") . $

]
] <thm:main-converse>

There is no restriction on reduction type, complex multiplication, rational torsion, or rational isogenies. The hypothesis concerns the full $2$-power Selmer corank; a Mordell–Weil rank bound alone does not give it.

For a nonzero squarefree integer $d$, let $E^(\( d \))$ denote the quadratic twist of $E$, and set

$ cal(D) \( X \) = { d in bb(Z) : 0 < \| d \| lt.eq X \, med d upright(" squarefree") } . $

Thus positive and negative parameters are counted together and ordered by absolute value. A residue class can fix the sign of the functional equation; the half-density statement below concerns the full set $cal(D) \( X \)$.

#thm([Theorem 1.2.])[
  (Goldfeld’s analytic density conjecture).  #emph[For every elliptic curve $E \/ bb(Q)$ and each $j in { 0 \, 1 }$, 
$ lim_(X arrow.r oo) frac(\# { d in cal(D) \( X \) : a \( E^(\( d \)) \) = j }, \# cal(D) \( X \)) = 1 / 2 . $

 Consequently the twists of analytic rank at least two have density zero. For a density-one set of signed squarefree parameters $d$, the analytic and Mordell–Weil ranks of $E^(\( d \))$ agree and its whole Tate–Shafarevich group is finite.]
] <thm:main-density>

The theorem follows by combining the pointwise $2$-converse with Smith’s distribution of full $2$-power Selmer coranks #cite(label("Smith2025")) Theorem 1.1. Section 14 gives the deduction, including the passage from integer to squarefree parameters. The main work of this paper is the pointwise converse.

=== 1.1 Consequences and companion results <consequences-and-companion-results>

The converse has a finite-descent consequence. Put

$ d_2 \( E \) = dim_(bb(F)_2) "Sel"_2 \( E \/ bb(Q) \) - dim_(bb(F)_2) E \( bb(Q) \) \[ 2 \] . $

#thm([Corollary 1.3.])[
  (A finite Selmer criterion).  #emph[If $d_2 \( E \) in { 0 \, 1 }$, then 
$ a \( E \) = r \( E \) = c_2 \( E \) = d_2 \( E \) \, #h(2em) "Sha" \( E \/ bb(Q) \) upright(" is finite") \, #h(2em) "Sha" \( E \/ bb(Q) \) \[ 2^oo \] = 0 . $

]
] <cor:finite-descent>

Thus a finite $2$-descent can certify the analytic rank and the vanishing of the entire $2$-primary Tate–Shafarevich group in these two cases. The proof uses the alternating Cassels–Tate pairing to pass from $d_2 \( E \)$ to the full Selmer corank, and is given in Section 14.

The density theorem resolves the frequency assertion for analytic ranks zero and one. The mean analytic-rank assertion requires additional control: a set of density zero can still contribute to the rank-weighted average. The separate companion #cite(label("OpenAIMeanAnalyticRank2026"), form: "prose") Theorems 1.1 and 1.2 proves the required analytic tail estimate and, together with Theorem 2, obtains mean analytic rank $1 \/ 2$ in the same signed squarefree ordering.

A subsequent companion #cite(label("OpenAIAllPrimeSelmer2026")) Theorem 1.1 extends the pointwise converse to every prime $p$: full $p$-power Selmer corank $r in { 0 \, 1 }$ forces analytic and Mordell–Weil ranks $r$ and finiteness of the whole Tate–Shafarevich group. Its proof uses the $2$-converse and analytic twist densities established here.

The rank and finiteness assertions are distinct from the Birch–Swinnerton-Dyer leading-coefficient formula. The pointwise two-primary formula of #cite(label("OpenAITwoPrimaryBSD2026"), form: "prose") Theorem 1.1, combined with the Selmer-corank densities in the proof of Theorem 2, gives the exact two-primary formula on a density-one set of signed squarefree twists. Their common analytic and Mordell–Weil ranks are zero and one with density $1 \/ 2$ each. This consequence is #cite(label("OpenAITwoPrimaryBSD2026"), form: "prose") Corollary 16.1; its leading-coefficient assertion concerns the valuation at $2$.

=== 1.2 Goldfeld’s conjecture and analytic nonvanishing <goldfelds-conjecture-and-analytic-nonvanishing>

Birch and Swinnerton-Dyer’s comparisons of rational points with central $L$-values led to the conjectural equality of algebraic and analytic rank #cite(label("BirchSwinnertonDyer1965")). The conjecture also predicts finiteness of $"Sha" \( E \/ bb(Q) \)$ and a formula for the leading coefficient #cite(label("Tate1966")) §1, pp. 415–421. Goldfeld’s original 1979 formulation asks for the mean analytic order in a family parametrized by quadratic-field discriminants #cite(label("Goldfeld1979")) p. 113, Conjecture (B). The density formulation predicts that analytic ranks zero and one each occur half the time. Our counting convention throughout is the signed squarefree set $cal(D) \( X \)$.

The analytic study of quadratic twists produced both nonzero central values and simple central zeros. Bump–Friedberg–Hoffstein and Murty–Murty supplied auxiliary twists with the nonvanishing needed in Heegner-point arguments; Iwaniec and Perelli–Pomykała developed quantitative estimates for central derivatives #cite(label("BFH1990")) #cite(label("MurtyMurty1991")) #cite(label("Iwaniec1990")) #cite(label("PerelliPomykala1997")). Ono–Skinner obtained a lower bound of order $X \/ log X$ for the number of nonvanishing central values among twists by fundamental discriminants $D$ with $0 < \| D \| lt.eq X$ #cite(label("OnoSkinner1998")) Corollary 3. More recently, Kumar–Mallesham–Sharma–Singh sharpened derivative nonvanishing estimates through second moments, and Kriz–Nordentoft improved central-value lower bounds for curves with no rational two-torsion #cite(label("KumarEtAl2024")) Theorem 1 #cite(label("KrizNordentoft2025")) Theorem 1.1 and Remark 1.2. These quantitative results yield many twists without by themselves giving a positive proportion for every fixed curve.

Positive proportions were obtained in special families. James proved analytic-rank-zero proportions for particular curves, and Vatsal proved positive proportions of both analytic ranks zero and one for $X_0 \( 19 \)$ #cite(label("James1998")) Theorem 1 #cite(label("Vatsal1998")) Theorem II. Kriz–Li proved both positive proportions for every rational elliptic curve admitting a rational $3$-isogeny #cite(label("KrizLi2019")) Theorem 1.5. In the congruent-number family, Tian’s Heegner-point work gives rank one and odd-order Tate–Shafarevich group in specified subfamilies #cite(label("Tian2014")). Genus-period and genus-point congruences, followed by Selmer statistics, give further analytic density results #cite(label("TianYuanZhang2017")) #cite(label("SmithCongruent2016")). These arguments connect coefficient congruences and arithmetic statistics with analytic nonvanishing, a connection also central to the present proof.

The statistical input used here has its own progression. Smith first established higher $2$-power Selmer distributions for curves with full rational two-torsion and no rational cyclic subgroup of order four #cite(label("Smith2017")). His subsequent work treated the irreducible residual case and further rational two-isogeny cases #cite(label("SmithDistributionI")) #cite(label("SmithDistributionII")). The unrestricted theorem gives full Selmer coranks zero and one with density $1 \/ 2$ each for every rational elliptic curve #cite(label("Smith2025")) Theorem 1.1. Its analytic corollary assumes Birch–Swinnerton-Dyer #cite(label("Smith2025")) Corollary 1.2. We use the Selmer theorem itself and supply the pointwise analytic implication through Theorem 1.

=== 1.3 The Selmer converse problem <the-selmer-converse-problem>

Gross–Zagier and Kolyvagin established the forward implication: analytic rank at most one gives equality with the Mordell–Weil rank and finiteness of the whole Tate–Shafarevich group #cite(label("GrossZagier1986")) #cite(label("Kolyvagin1990")); see also the combined formulation in #cite(label("Skinner2020"), form: "prose") §1. The Gross–Zagier formula relates a central derivative to the height of a Heegner point, and Kolyvagin’s derived classes control the Selmer group. A converse must produce analytic nonvanishing from Selmer information.

Cyclotomic Iwasawa theory gave rank-zero converses at good ordinary odd primes in the work of Skinner–Urban, under residual irreducibility and ramification hypotheses #cite(label("SkinnerUrban2014")). Skinner and Wei Zhang proved rank-one converse criteria through Heegner points and derived classes, under their respective reduction, residual-image and local hypotheses #cite(label("Skinner2020")) #cite(label("Zhang2014")). Burungale–Castella–Skinner subsequently removed the auxiliary ramification conditions in the good ordinary, residually irreducible case for $p > 3$ #cite(label("BurungaleCastellaSkinner2025")) Theorem 1.2.2 and the discussion following Remark 1.2.3. At good supersingular primes $p > 3$, Castella–Wan obtained the rank-one Selmer-corank implication for semistable curves #cite(label("CastellaWan2024")) Theorem A.

Reducible residual representations call for a different Iwasawa-theoretic comparison. Castella–Grossi–Lee–Skinner proved the corank-zero and corank-one converses at good ordinary Eisenstein primes $p > 2$, with local isogeny character neither trivial nor cyclotomic #cite(label("CastellaGrossiLeeSkinner2022")) Theorem E. Keller–Yin treated potentially good ordinary reduction at odd Eisenstein primes without that character exclusion #cite(label("KellerYin2024")) Theorem B. These results enlarge the allowed residual representations while retaining conditions on the prime and its reduction type.

The CM theory includes substantial results at the prime two. Burungale–Tian proved the rank-one converse at good ordinary primes $p > 3$ #cite(label("BurungaleTian2020")); Burungale–Castella–Skinner–Tian included the small ordinary primes under an additional conductor hypothesis #cite(label("BurungaleCastellaSkinnerTian2022")) Theorem A. Ressler and Yu obtained the small-prime good-ordinary result without that conductor condition; see Yu’s Theorem 1 and the attribution in Burungale–Castella–Skinner–Tian, Remark C #cite(label("Yu2021")) #cite(label("BurungaleCastellaSkinnerTian2022")). Burungale–Skinner’s combined ordinary formulation includes $p = 2$, and their good supersingular CM theorem also permits $p = 2$ under an additional surjectivity condition on Selmer localization at $p$ #cite(label("BurungaleSkinner2024")) Theorems A.3 and A.1.

In corank zero, Burungale–Tian’s theorem covers every rational CM elliptic curve at every prime, without a reduction restriction #cite(label("BurungaleTian2026")) Theorem 1.1. Combined with Smith’s unrestricted distribution, it therefore already gives the analytic-rank-zero half for every CM twist family. Their Theorem 1.2 gives rank zero for almost all positive squarefree $n equiv 1 \, 2 \, 3 med \( mod med 8 \)$ in the congruent-number family $n y^2 = x^3 - x$. Kriz’s preprint states a converse for curves with CM by the full ring of integers at the unique ramified prime of the CM field, and derives analytic densities for restricted CM families, including congruent-number curves #cite(label("Kriz2022")) Theorems 1.1 and 10.17. Its dyadic pointwise statement concerns the CM fields $bb(Q) \( i \)$ and $bb(Q) \( sqrt(- 2) \)$. Together with Smith’s distribution theorem, the stated dyadic converse would yield both half-density conclusions for quadratic twists of every curve with CM by either of these maximal orders. Theorem 1 treats the full $2$-power Selmer corank for every rational elliptic curve, in both ranks zero and one.

=== 1.4 Proof strategy <proof-strategy>

Fix the curve under consideration. We construct finite binary families of twists

$ h_x = product_(q in cal(Q)) \( q^(*) \)^(lambda_q \( x \)) \, #h(2em) q^(*) = \( - 1 \/ q \) q \, #h(2em) x in bb(F)_2^b \, $

where $cal(Q)$ is a finite set of distinct good odd primes and the $lambda_q$ are linear forms. The parameter at $x = 0$ is $1$. The families have the same local twisting classes at every fixed bad place. Their nonzero vertices have analytic order zero or one, according to the corank of the fixed curve. A scalar determinant coordinate attached to the relevant class and Selmer complex has a nonzero central specialization there, with uniformly bounded $2$-adic valuation. Bounded integral interpolation then recovers nonvanishing at the missing vertex $0$.

At corank zero, the interpolated class is a Beilinson–Kato class and its central specialization detects $L \( E \, 1 \)$ #cite(label("Kato2004")). At corank one, it is a Heegner class over an imaginary quadratic field $K = bb(Q) \( sqrt(k) \)$, whose height detects

$ [L \( E \, s \) L \( E^(\( k \)) \, s \)]'_(s = 1) . $

An analytically nonvanishing companion $E^(\( k \))$ makes the Selmer corank over $K$ equal to one. The argument retains integral Kummer conditions at $2$ and every bad prime. The rational Iwasawa input is used in its stated scope; the uniform integral estimates at $2$ are proved in Sections 13 and 12. The Heegner construction is related to Howard’s Kolyvagin-system framework #cite(label("Howard2012")); the integral bounds required here are established with the local conditions and uniformity stated in this paper.

The finite families are built from modular coefficients. Waldspurger’s formula supplies the even-sign coefficients #cite(label("Waldspurger1981")). In odd sign, reductions of genus Heegner sums give weighted ternary theta coefficients at increasing finite precisions. A uniform lower bound allows a least normalized valuation to be selected. In the even case this is a minimum among the coefficients of one form. In the odd case it is a minimum over bounded-weight sequences as the precision increases; each finite collection of tests is then realized at a sufficiently high actual precision. A test attaining the minimum detects the required analytic order and gives a uniform upper bound. Weight-two Hecke traces turn these coefficient tests into contraction and deletion rules for finite configurations of primes.

There are two exhaustive residual cases. If $E \[ 2 \]$ is reducible, its invariant line is a rational point of order two. Graphs encode prescribed quadratic residue symbols between auxiliary primes. The resulting finite construction makes two separate coefficient tests nonzero together at every nonzero binary vertex. The odd argument fixes one companion field before the dimension grows. In this branch, the even construction first supplies the lower bound needed to normalize the odd coefficient test. If $E \[ 2 \]$ is irreducible, local Selmer equations give matrices over $bb(F)_2$. Subtracting a correction determined by finitely many local types makes these matrices symmetric; their nullities still give a lower bound on the Selmer dimension up to a fixed cost. Removing one selected prime or pair of primes, or retaining it with either of two allowed local choices, gives three configurations. Their coefficient tests satisfy the same sum-zero relation as the corresponding matrix determinants. This relation does not identify the coefficient test with the determinant. We group the configurations into blocks and arrange that the matrix entries between distinct blocks vanish. A nonzero coefficient test bounds the matrix kernel, and hence the number of singular blocks in the finite configuration. Fixing a configuration with a maximal number of such blocks lets us arrange nonzero tests at every nonzero binary vertex. An additional alternating-matrix construction supplies a companion with uniformly bounded prime count and Selmer length.

Two parts of the argument have uses beyond this assembly. The interpolation algebra clears denominators through a bounded complex, so the required congruence precision is independent of the number of new primes. The graph construction treats the coefficient tests as polynomials in prescribed residue symbols and makes separately nonzero tests nonzero together. Its proof retains squared variables until after multiplying their highest-degree parts. Neither construction presupposes the desired nonvanishing at the base.

===== 1.4.1 Organization. <organization.>

Section 2 records the rank implications and local conventions. Section 3 states the two arithmetic transfer criteria, the lower bounds needed to normalize coefficients, and auxiliary nonvanishing with prescribed local conditions. Sections 4 and 5 turn analytic nonvanishing into coefficient tests and prime-substitution identities. Section 6 develops the graph construction used in the rational-torsion converse of Section 7. Section 8 supplies the Selmer matrices for the irreducible converse in Section 9. The remaining main-text sections prove the arithmetic inputs: Section 10 establishes auxiliary nonvanishing, Section 11 develops the common finite-complex and binary transfer arguments, and Sections 12 and 13 construct the cyclotomic and Heegner determinant coordinates and prove their integral bounds. Finally, Section 14 assembles the unrestricted result and its density and finite-descent consequences.

== 2 Selmer ranks and local conventions <sec:preliminaries>

We first record the arithmetic implications used to pass between curves and to interpret the final analytic nonvanishing. They apply to every elliptic curve over $bb(Q)$.

Throughout, we use Mordell–Weil finite generation and the positive definiteness of the canonical height modulo torsion over number fields #cite(label("MilneEC2021")) Chapter IV, finite-basis theorem, Theorem 4.7, Remark 4.12, and Theorem 6.1.

#thm([Lemma 2.1.])[
  (Ranks and the forward implication).  #emph[For an elliptic curve $A \/ bb(Q)$ there is an exact sequence 
$ 0 arrow.r A \( bb(Q) \) ⊗ bb(Q)_2 \/ bb(Z)_2 arrow.r "Sel"_(2^oo) \( A \/ bb(Q) \) arrow.r "Sha" \( A \/ bb(Q) \) \[ 2^oo \] arrow.r 0 . $

 In particular 
$ c_2 \( A \) = r \( A \) + "corank"_(bb(Z)_2) "Sha" \( A \/ bb(Q) \) \[ 2^oo \] . $

 If $a \( A \) lt.eq 1$, then $r \( A \) = a \( A \)$, the whole group $"Sha" \( A \/ bb(Q) \)$ is finite, and $c_2 \( A \) = a \( A \)$.]
] <pr:ranks>

#proof[
  The finite Kummer exact sequences are
  $ 0 arrow.r A \( bb(Q) \) \/ 2^n A \( bb(Q) \) arrow.r "Sel"_(2^n) \( A \/ bb(Q) \) arrow.r "Sha" \( A \/ bb(Q) \) \[ 2^n \] arrow.r 0 . $
  Their direct limit gives the displayed sequence; taking coranks gives the identity. The last assertion is the Gross–Zagier–Kolyvagin forward theorem #cite(label("GrossZagier1986")) #cite(label("Kolyvagin1990")); see also its unrestricted formulation in #cite(label("Skinner2020"), form: "prose") §1. ◻
]

#thm([Lemma 2.2.])[
  (Parity and change of curve).  #emph[ For every elliptic curve $A \/ bb(Q)$ with root number $epsilon \( A \)$, 
$ \( - 1 \)^(c_2 \( A \)) = epsilon \( A \) . $

 A rational isogeny preserves $a \( A \)$, $r \( A \)$ and $c_2 \( A \)$. For a quadratic field $K = bb(Q) \( sqrt(k) \)$, 
$ "corank"_(bb(Z)_2) "Sel"_(2^oo) \( A \/ K \) = c_2 \( A \) + c_2 \( A^(\( k \)) \) . $

]
] <pr:invariance>

#proof[
  The parity statement is the $p = 2$ case of #cite(label("DokchitserDokchitser2010"), form: "prose") Theorem 1.4, equivalently Theorem 4.19. At $p = 2$ this is Monsky’s theorem #cite(label("Monsky1996")). Isogenies and their duals induce maps respecting every local Kummer condition; their composites are multiplication by their fixed degree. After rationalization these maps preserve ranks and coranks. Their $L$-functions agree by isogeny invariance.
  Restriction to $K$ and the two conjugation projections $1 + c$ and $1 - c$ give maps between $"Sel"_(2^oo) \( A \/ K \)$ and the sum of the Selmer groups of $A$ and $A^(\( k \))$ over $bb(Q)$, with composites multiplication by $2$. They respect local Kummer images, so rationalization gives the corank identity. An integral direct sum is not needed. ◻
]

#thm([Lemma 2.3.])[
  (The residual alternatives).  #emph[The representation $E \[ 2 \]$ is reducible over $bb(F)_2$ if and only if $E \( bb(Q) \) \[ 2 \] eq.not 0$. In that case it is an extension of two trivial $bb(F)_2$-representations. Otherwise its image is $C_3$ or $S_3$ in $"GL"_2 \( bb(F)_2 \)$. Quadratic twisting leaves this representation unchanged.]
] <pr:residual-cases>

#proof[
  An invariant line over $bb(F)_2$ has a unique nonzero vector, which must be fixed. Conversely a rational point of order two spans an invariant line. Both that line and the one-dimensional quotient are trivial, since $bb(F)_2^times = { 1 }$. The irreducible subgroups of $"GL"_2 \( bb(F)_2 \) tilde.eq S_3$ are $C_3$ and $S_3$. Finally a quadratic character reduces to $1$ modulo $2$. ◻
]

The distinction here is irreducibility over $bb(F)_2$, rather than absolute irreducibility: the cyclic cubic case is included. In the rational-torsion case we may first replace the curve by a rationally isogenous one with full rational two-torsion, if such a curve exists. Otherwise, for any chosen rational two-isogeny $E arrow.r E'$, both $bb(Q) \( E \[ 2 \] \)$ and $bb(Q) \( E' \[ 2 \] \)$ are quadratic. Lemma 5 justifies this choice before any constructions.

=== 2.1 Finite lengths and twisting data <finite-lengths-and-twisting-data>

All valuations above $2$ are normalized by $v \( 2 \) = 1$, with $v \( 0 \) = + oo$. For a finite $bb(Z)_2$-module $M$, its length is $log_2 \# M$. The corank of a cofinitely generated discrete $bb(Z)_2$-module is the rank of its Pontryagin dual. Its quotient by the maximal divisible subgroup is finite. This finite quotient must be distinguished from finiteness of the original group.

A fixed support $S$ is a finite set of primes containing $2$ and all primes of bad reduction; it is enlarged explicitly when necessary. Write $N$ for the conductor of $E$. A local filter specifies a real sign and unit squareclasses at $S$ for a variable odd fundamental discriminant prime to $S$. The empty discriminant $h = 1$ denotes the untwisted curve. We also write $E^(\( h \))$ for twisting by a rational squareclass. For an odd prime $p$, the signed prime discriminant is $p^(*) = \( - 1 \/ p \) p$. Products of distinct $p^(*)$ are odd fundamental discriminants, with the empty product interpreted as $1$.

For an odd fundamental discriminant $h$ prime to $2 N$, the coprime-twist root-number formula is

$ epsilon \( E^(\( h \)) \) = epsilon \( E \) chi_h \( - N \) $

#cite(label("RadziwillSoundararajan2015")) Section 1. Thus matching unit squareclasses at the primes dividing $2 N$ and opposite real signs give opposite functional signs: the values of $chi_h \( N \)$ agree, whereas $chi_h \( - 1 \) = "sgn" \( h \)$. This verifies the sign condition when choosing the auxiliary partners below.

Put $T = T_2 \( E \)$ and $V = E \[ 2 \]$. Frobenius is arithmetic, and $a_p \( E \) = p + 1 - \# E \( bb(F)_p \)$ at a good prime. For $h$ prime to $S$, set

#[#set math.equation(numbering: n => "(2.1)")
 $ t_p = dim_(bb(F)_2) V^("Fr"_p) \, #h(2em) w \( h \) = 1 / 2 sum_(p divides \| h \|) t_p . $ <eq:h:weights>]

The residual identity, a transposition and a rotation of order three have $t_p = 2 \, 1 \, 0$, respectively. We call these split, simple and root primes; their weights are $1 \, 1 \/ 2 \, 0$. Only types present in the residual image are used. Quadratic residue symbols written additively take the values $0 \, 1 in bb(F)_2$, corresponding to $+ 1 \, - 1$.

Whenever its group is finite, write

$ s \( h \) = "length"_(bb(Z)_2) "Sha" \( E^(\( h \)) \/ bb(Q) \) \[ 2^oo \] . $

This includes every twist already proved to have analytic rank zero or one. It also includes a base of Selmer corank zero, since its full $2$-primary Selmer group is then finite. We make no whole-Sha finiteness assertion at such a base until analytic nonvanishing has been established.

Let $Omega_E^(+)$ be a positive real period and let $Omega_E^(-)$ be the positive magnitude of a nonzero anti-invariant period. Put

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(L) \( h \) = frac(sqrt(\| h \|) thin L \( E^(\( h \)) \, 1 \), Omega_E^("sgn" \( h \))) . $ <eq:h:algebraic-value>]

Valuations refer to this algebraic period-normalized value at a chosen place above $2$. Changes of the fixed period, modular parametrization or isogeny affect valuations by bounded constants. All parametrizations send the cusp $oo$ to the origin. Replacing Equation (2.2) by the central value divided by a Néron real period of $E^(\( h \))$ changes a finite valuation by $O_E \( 1 \)$: the differential changes by the usual twisting factor, and there are only finitely many twisting classes at $2$.

Every uniform bound below specifies its fixed data. Constants may depend on the curve, a chosen fixed twist and finite local preparation; they may not depend on the subsequent cube dimension or the number of new primes. At finite precision, the sizes of primes realizing a specified configuration may depend on that entire configuration. A limiting construction will only be used through its finite realizations.

#thm([Lemma 2.4.])[
  (Finite descent and corank).  #emph[Let $F$ be the quotient of $"Sha" \( E \/ bb(Q) \) \[ 2^oo \]$ by its maximal divisible subgroup. Then 
$ d_2 \( E \) = c_2 \( E \) + dim_(bb(F)_2) F \[ 2 \] \, #h(2em) dim_(bb(F)_2) F \[ 2 \] upright(" is even") . $

 Thus $d_2 \( E \) in { 0 \, 1 }$ implies $c_2 \( E \) = d_2 \( E \)$ and $F = 0$.]
] <pr:finite-descent>

#proof[
  The finite Kummer sequence at $n = 1$ gives $d_2 \( E \) = r \( E \) + dim_(bb(F)_2) "Sha" \( E \/ bb(Q) \) \[ 2 \]$. The divisible subgroup is a direct sum of copies of $bb(Q)_2 \/ bb(Z)_2$ and splits as an abstract abelian subgroup. Its $2$-torsion dimension is its corank. Lemma 4 therefore gives the displayed identity. The Cassels–Tate pairing on $F$ is perfect. For an elliptic curve, the rational divisor $\[ O \]$ defining its principal polarization makes the pairing alternating #cite(label("MilneADT2006")) Chapter I, Remark 6.10(b) and Theorem 6.13(a). A finite abelian $2$-group with such a pairing is an orthogonal sum of pairs of cyclic groups of equal order: choose an element of maximal order, pair it with an element detecting that order, split off their nondegenerate plane, and continue. Hence its $2$-rank is even. A finite $2$-group with zero $2$-rank is zero, proving the last assertion. ◻
]

== 3 Arithmetic estimates for finite twist families <sec:transfer-criteria>

The pointwise converse will follow by placing the given curve at the zero vertex of a large finite family of twists. We arrange analytic nonvanishing at every other vertex, together with an upper bound on a normalized valuation. The estimates in this section explain which normalization is needed and what must be uniform as the family grows. Their proofs occupy Sections 11, 12 and 13.

Fix $E \/ bb(Q)$ of conductor $N$ and retain the local weights $w \( h \)$, finite Sha lengths $s \( h \)$, and period-normalized values $cal(L) \( h \)$ of Section 2. In particular $s \( h \)$ is defined at a corank-zero base and at every twist already known to have analytic rank zero or one. All valuations satisfy $v \( 2 \) = 1$.

A binary family has the form

$ h_x = h_0 product_(q in cal(Q)) \( q^(*) \)^(lambda_q \( x \)) \, #h(2em) x in bb(F)_2^b \, #h(2em) q^(*) = \( - 1 \/ q \) q \, $

where the new primes are distinct and prime to $2 N h_0$, and each $lambda_q$ is linear. The old factors of $h_0$ remain at every vertex; no new factor is present at zero. We will hold the required local squareclasses fixed while $b$ grows. Both the set of primes and their sizes may depend on $b$.

Here is the common transfer mechanism. For families satisfying the hypotheses of the transfer theorems below, the arithmetic proofs attach power series

$ u_x \( t \) in bb(Z)_2 \[ \[ t \] \] \[ 1 \/ 2 \] $

to the vertices, using a common family of cochain models and compatible trivializations of the determinant lines. The differences of these coordinates therefore have a fixed meaning. Their constant terms detect the central value in rank zero or a Heegner point in rank one. If the analytic nonvanishing sought at the base fails, then $u_0 \( 0 \) = 0$. The nonzero vertices instead satisfy $v \( u_x \( 0 \) \) lt.eq B_1$ with $B_1$ independent of $b$. The denominator analysis proves that, for every fixed integer $m$ and sufficiently large $b$, some $x eq.not 0$ satisfies

$ v #scale(x: 120%, y: 120%)[\(] u_x \( 0 \) - u_0 \( 0 \) #scale(x: 120%, y: 120%)[\)] gt.eq m . $

Taking $m > B_1$ contradicts these two assertions. The work is to obtain this congruence with a dimension threshold independent of the number of new primes. Section 11 does so after the new local blocks have been eliminated from the Selmer complex: a clearing factor for the remaining bounded complex makes finitely many coefficient congruences sufficient. Only that clearing factor needs a uniform pole bound; the numerator may involve the whole prime set.

=== 3.1 Transfer of a central value <transfer-of-a-central-value>

For a twist with nonzero central value, put

#[#set math.equation(numbering: n => "(3.1)")
 $ D \( h \) = v \( cal(L) \( h \) \) - 2 w \( h \) - s \( h \) . $ <eq:transfer-normalized-value>]

The subtraction records the local contributions of the ramified primes and the finite Selmer contribution. In the cyclotomic proof, Kato’s class and the invariant line at the real place form the determinant coordinate $u_x$. Its central valuation differs from $D \( h_x \)$ by a fixed bounded amount. Thus an upper bound on $D$ is exactly the arithmetic input to the preceding contradiction.

#thm([Theorem 3.1.])[
  (Cyclotomic missing vertex).  #emph[There is a constant $C_E$, depending only on $E$, with the following property. Fix an odd fundamental discriminant $h_0$, prime to $2 N$, with $c_2 \( E^(\( h_0 \)) \) = 0$. Suppose that for arbitrarily large $b$ there is a family 
#[#set math.equation(numbering: n => "(3.2)")
 $ h_x = h_0 product_(q in cal(Q)) \( q^(*) \)^(lambda_q \( x \)) \, #h(2em) x in bb(F)_2^b \, #h(2em) lambda_q in \( bb(F)_2^b \)^(*) \, $ <eq:cy:cube>]

 where $cal(Q)$ consists of distinct primes outside $2 N h_0$, $q^(*) = \( - 1 \/ q \) q$, and every $h_x$ has the same sign and the same local squareclasses at $2 N$. Assume that a constant $B$, independent of $b$, satisfies 
#[#set math.equation(numbering: n => "(3.3)")
 $ L \( E^(\( h_x \)) \, 1 \) eq.not 0 \, #h(2em) D \( h_x \) lt.eq B #h(2em) \( x eq.not 0 \) . $ <eq:cy:punctured-bound>]

 If $E \[ 2 \]$ is irreducible, assume also that some $L$, independent of $b$, satisfies 
#[#set math.equation(numbering: n => "(3.4)")
 $ v_2 \( q^2 - 1 \) lt.eq L #h(2em) \( q in cal(Q) \) . $ <eq:cy:prime-bound>]

 Then $L \( E^(\( h_0 \)) \, 1 \) eq.not 0$ and 
#[#set math.equation(numbering: n => "(3.5)")
 $ D \( h_0 \) lt.eq B + C_E . $ <eq:cy:transferred-bound>]

 The necessary dimension may depend on $h_0$, its finite Selmer group, and the bound in Equation (3.4); $C_E$ does not.]
] <thm:cyclotomic-interpolation>

The final constant $C_E$ bounds the specialization error. The finite Selmer group of the base and, in the irreducible case, the bound on $v_2 \( q^2 - 1 \)$ affect how large a cube is needed, but not this transferred error. We shall construct the nonzero vertices so that $v \( cal(L) \( h_x \) \) lt.eq 2 w \( h_x \) + C$; since $s \( h_x \) gt.eq 0$, this supplies the hypothesis on $D \( h_x \)$.

=== 3.2 Transfer of a Heegner point <sec:h:statements>

In corank one the coordinate comes from a Heegner point. The family must also carry a companion twist whose central value is nonzero. We first specify the two Heegner constructions whose indices enter the estimates.

Let $K = bb(Q) \( sqrt(k) \)$, where $k < 0$ is an odd fundamental discriminant and every prime dividing $2 N$ splits in $K$. We omit the two fields with extra units and, if $E$ has complex multiplication, its CM field. Fix a nonzero modular parametrization $X_0 \( N \) arrow.r E$, translated so that the cusp $oo$ maps to the origin, and compatible orientations of the Heegner points $y_c in E \( H_c \)$, where $H_c$ is the ring class field of conductor $c$. The Manin–Drinfeld theorem makes the images of cusp differences torsion #cite(label("Drinfeld1973")) Section 1. Since the modular curve and parametrization are fixed, one integer kills all these images and removes cuspidal ambiguities.

If $chi_e \|_(G_K)$ is a primitive ring class character of conductor $c$, write $P_c \( e \)$ for the character #emph[sum] of $y_c$. Equivalently, twist over $H_c$ and trace to $E^(\( e \)) \( K \)$. If this latter group has rank one, $j \( P_c \( e \) \)$ is the valuation of its index on the free rank-one lattice. Passing between this lattice and the rank-one lattice of the contributing curve among $E^(\( e \)) \( bb(Q) \)$ and $E^(\( e k \)) \( bb(Q) \)$ changes the index by a bounded amount: restriction and addition or subtraction of conjugates have composites multiplication by $2$.

We use two choices of data:

$ upright("genus data:") quad & k = h h_(*) \, quad \( h \, h_(*) \) = 1 \, quad e = h_(*) \, quad c = 1 \, quad h_(*) upright(" fixed") \;\
upright("ring data:") quad & \( k \, h \) = 1 \, quad e = h \, quad c = \| h \| . $

The character in genus data is unramified. In ring data, restriction at each $q divides h$ has conductor exponent one: this follows by pulling the quadratic character back under the local norm. Thus these are the asserted primitive ring class conductors.

#thm([Proposition 3.2.])[
  (Comparison of the two Heegner constructions).  #emph[For either set of data, 
#[#set math.equation(numbering: n => "(3.6)")
 $ hat(h) \( P_c \( e \) \) = C_E thin c sqrt(\| k \|) thin [L \( E^(\( e \)) \, s \) L \( E^(\( e k \)) \, s \)]'_(s = 1) \, $ <eq:h:height>]

 with a fixed nonzero constant determined by the parametrization and height conventions. In particular, a simple zero of the product gives total Mordell–Weil rank one and finite Shafarevich–Tate groups.]
  #emph[Suppose $h$ has analytic rank one, and use genus data with a fixed partner $h_(*)$ of analytic rank zero and ring data with a possibly varying $k$, where $L \( E^(\( h k \)) \, 1 \) eq.not 0$. Then 
#[#set math.equation(numbering: n => "(3.7)")
 $ 2 j \( P_(\| h \|) \( h \) \) - 2 j \( P_1 \( h_(*) \) \) = v \( cal(L) \( h k \) \) + O_(E \, h_(*)) \( 1 \) . $ <eq:h:index-comparison>]

 Here the two points are formed in their respective quadratic fields. If instead $h_(*)$ has analytic rank one and $L \( E^(\( h \)) \, 1 \) eq.not 0$, genus data give 
#[#set math.equation(numbering: n => "(3.8)")
 $ 2 j \( P_1 \( h_(*) \) \) = v \( cal(L) \( h \) \) + O_(E \, h_(*)) \( 1 \) . $ <eq:h:reverse-comparison>]

]
] <prop:heegner-comparison>

The genus construction varies the quadratic field $bb(Q) \( sqrt(h h_(*)) \)$ while holding $h_(*)$ fixed. It is the construction detected by the odd coefficients below. Interpolation instead uses the ring construction: within one binary family the field $K$ is common to every vertex. Equation (3.7) converts a genus-index estimate and an even central-value estimate into the ring-index estimate needed for transfer. The field $K$ may change when a new family is chosen.

#thm([Theorem 3.3.])[
  (Heegner interpolation).  #emph[Fix $E$ and an initial discriminant $h_0$. Consider families $h_x$, $x in bb(F)_2^b$, obtained from $h_0$ by adjoining new prime factors with linear activation functions on $bb(F)_2^b$. No old factor is removed; the signed factor belonging to an odd prime $q$ is $q^(*) = \( - 1 \/ q \) q$. Suppose the local twisting classes at $2 N$ are constant. For each family let $k$ define an imaginary field satisfying the standing Heegner conditions, with $\( k \, h_x \) = 1$ for every $x$. Each new prime must either split in $K$ or satisfy $t_q = 0$.]
  #emph[Assume that the following bounds are fixed independently of $b$:]
  + #emph[a bound for $omega \( k \)$;]
  + #emph[a bound for the length of the finite quotient of $"Sel"_(2^oo) \( E^(\( h_0 \)) \/ K \)$ by its divisible subgroup;]
  + #emph[a constant $B$.]
  #emph[Assume this base Selmer group has corank one. Suppose, for every $x eq.not 0$, the product $L \( E^(\( h_x \)) \, s \) L \( E^(\( h_x k \)) \, s \)$ has a simple zero and 
#[#set math.equation(numbering: n => "(3.9)")
 $ 2 j \( P_(\| h_x \|) \( h_x \) \) - 4 w \( h_x \) - s \( h_x \) - s \( h_x k \) lt.eq B . $ <eq:h:interpolation-hypothesis>]

 Then, for sufficiently large $b$, the base product has a simple zero. The dimension threshold depends only on the fixed base and the displayed bounds, not on the number or sizes of the new primes. The field $K$ may vary with the family.]
] <thm:heegner-interpolation>

In these ring data, the relevant normalized quantity is

$ 2 j \( P_(\| h \|) \( h \) \) - 4 w \( h \) - s \( h \) - s \( h k \) . $

We use the theorem to prove nonvanishing at the base. In our applications, the genus-index and even central-value estimates will give $2 j \( P_(\| h_x \|) \( h_x \) \) lt.eq 4 w \( h_x \) + C$ at every nonzero vertex. Subtracting the nonnegative Sha lengths supplies the required upper bound.

The finite-quotient condition allows two uses of the theorem. The rational-two-torsion argument fixes $K$ before increasing $b$. The irreducible argument lets $K$ vary and verifies the following criterion.

#thm([Lemma 3.4.])[
  #emph[The finite-quotient bound in Theorem 10 holds if $K$ belongs to a fixed finite collection. It also holds if $E^(\( h_0 \))$ is fixed with Selmer corank one, the curves $E^(\( h_0 k \))$ have analytic rank zero with bounded $s \( h_0 k \)$, and $omega \( k \)$ is bounded.]
] <lem:h:base-selmer-bound>

=== 3.3 Lower bounds and the coefficient constructions <lower-bounds-and-the-coefficient-constructions>

The transfer criteria ask for upper bounds at a well-chosen set of twists. To find those twists, we first need lower bounds on all the normalized coefficients under consideration. In even sign a least normalized valuation can then be selected, and a coefficient attaining it gives both analytic nonvanishing and an upper bound with a constant independent of the prime support. In odd sign the coefficients come at increasing finite precision: the minimum is defined through bounded-weight sequences, and each use is realized on a finite collection of indices.

For the even coefficient construction, Section 4 relates twice a coefficient valuation to $v \( cal(L) \( h \) \)$ up to a fixed constant. For the odd construction it relates the coefficient valuation to the genus index. The following three lower estimates supply the normalizations, with different roles in the two residual cases.

When $E \[ 2 \]$ is reducible, the cyclotomic argument supplies the even lower estimate directly. By Lemma 6, the representation is then an extension of two trivial modules.

#thm([Theorem 3.5.])[
  (Cyclotomic lower bound).  #emph[Suppose that $E \[ 2 \]$ is an extension of two trivial $bb(F)_2$-modules. There is a constant $C_E$ such that every odd fundamental discriminant $h$ prime to $2 N$ with $L \( E^(\( h \)) \, 1 \) eq.not 0$ satisfies 
#[#set math.equation(numbering: n => "(3.10)")
 $ v \( cal(L) \( h \) \) gt.eq 2 w \( h \) + s \( h \) - C_E . $ <eq:cy:lower-bound>]

 The constant is independent of the number and sizes of the primes that divide $h$.]
] <thm:cyclotomic-bound>

When $E \[ 2 \]$ is irreducible, the genus construction supplies the lower estimate for either sign. With an analytic-rank-zero fixed partner, it bounds the odd genus index. With an analytic-rank-one fixed partner, Equation (3.8) turns it into the even central-value bound.

#thm([Theorem 3.6.])[
  (Genus bound).  #emph[In genus data, suppose the product in Equation (3.6) has a simple zero and $E \[ 2 \]$ is irreducible. Then, uniformly in $h$, 
#[#set math.equation(numbering: n => "(3.11)")
 $ 2 j \( P_1 \( h_(*) \) \) gt.eq 2 w \( h \) + s \( h \) - O_(E \, h_(*)) \( 1 \) . $ <eq:h:genus-bound>]

 In proving the uniform estimate, one may omit the finitely many $h$ for which $K$ meets $bb(Q) \( E \[ 2 \] \)$ nontrivially.]
] <thm:heegner-genus-bound>

The remaining case is the odd coefficient construction with rational two-torsion. Here the genus estimate just stated is unavailable. We use instead the following ring estimate, whose residual representation is unrestricted.

#thm([Theorem 3.7.])[
  (Ring bound).  #emph[In ring data, suppose the product in Equation (3.6) has a simple zero, every $q divides h$ splits in $K$, and $omega \( k \) lt.eq a$, where $omega$ counts distinct prime factors. Then 
#[#set math.equation(numbering: n => "(3.12)")
 $ 2 j \( P_(\| h \|) \( h \) \) gt.eq 4 w \( h \) + s \( h \) + s \( h k \) - O_(E \, a) \( 1 \) . $ <eq:h:ring-bound>]

 There is no irreducibility assumption on $E \[ 2 \]$.]
] <thm:heegner-ring-bound>

The passage from this ring estimate to an odd genus estimate is part of Proposition 7.7. The even coefficient construction first provides, for each already rank-one twist $h$ in the positive filter, a companion parameter $k'$ satisfying the ring-bound hypotheses: it is negative, odd fundamental, coprime to $2 N h$, a local square at every prime of $2 N h$, and defines a nonexceptional imaginary field. Its prime count is bounded, and the companion obeys $L \( E^(\( h k' \)) \, 1 \) eq.not 0$ and

$ v \( cal(L) \( h k' \) \) lt.eq 2 w \( h k' \) + s \( h k' \) + C . $

Substitute this upper bound into Equation (3.7) and the ring lower bound. Since $w \( h k' \) = w \( h \) + w \( k' \)$ and $w \( k' \)$ is bounded, the result is

$ 2 j \( P_1 \( h_(*) \) \) gt.eq 2 w \( h \) + s \( h \) - C' . $

Only then is the odd coefficient system normalized in the reducible branch. Thus the lower-bound dependencies are

$ upright("irreducible genus bound") & upright("even and odd coefficient bounds") \,\
upright("reducible cyclotomic bound") & upright("even coefficients, then bounded companions") \,\
upright("ring bound and those companions") & upright("reducible odd coefficient bound") . $

The reducible odd normalization is therefore available after the even companion construction. The all-split hypothesis belongs to the ring lower bound used here. The Heegner transfer criterion retains its stated alternative for new primes with $t_q = 0$.

=== 3.4 Auxiliary twists in prescribed local classes <auxiliary-twists-in-prescribed-local-classes>

The coefficient constructions also require an auxiliary twist with specified local classes. For even sign the number of its prime factors must remain bounded as the local conditions vary. The following nonvanishing result supplies both kinds of partner; its proof is given in Section 10.

#thm([Proposition 3.8.])[
  (Auxiliary nonvanishing).  #emph[ Let $E \/ bb(Q)$ have conductor $N$, and let $S$ be a finite set of primes containing the prime divisors of $2 N$. Prescribe a real sign $sigma in { 1 \, - 1 }$ and a unit squareclass $c_p in bb(Z)_p^times \/ bb(Z)_p^(times 2)$ for each $p in S$. Suppose that these data are realized by an odd fundamental discriminant, and that twists in this filter have root number $epsilon$. For every finite set $B$ of primes there are odd fundamental discriminants $D$ of arbitrarily large absolute value such that 
$ "sign" \( D \) = sigma \, #h(2em) \[ D \]_p = c_p quad \( p in S \) \, #h(2em) p divides.not D quad \( p in B \) \, $

 Moreover:]
  + #emph[If $epsilon = 1$, they can be chosen with $L \( E^(\( D \)) \, 1 \) eq.not 0$ and $omega \( \| D \| \) lt.eq 5$.]
  + #emph[If $epsilon = - 1$, they can be chosen with $L' \( E^(\( D \)) \, 1 \) eq.not 0$, so the central zero is simple.]
  #emph[The bound five in (i) is independent of $E \, S \, B$ and the prescribed classes. In either case, every prime factor of $D$ can be required to exceed any previously fixed bound.]
] <prop:rough-nonvanishing>

== 4 Coefficients that detect analytic rank <cs:coefficient-systems>

The interpolation theorems require nonvanishing with a uniform valuation bound at the nonzero vertices of a cube. We encode both requirements in one binary coefficient: it is one when a modular coefficient has the least normalized valuation. Waldspurger’s formula supplies the even-sign coefficients; reduction of genus Heegner sums supplies the odd-sign coefficients at finite precision. We prove their modular and arithmetic properties separately before choosing this normalization.

=== 4.1 Filters and prime weights <filters-and-prime-weights>

Fix $E \/ bb(Q)$ and a finite set $S$ containing the primes of $2 N$ and the ramification set of $F = bb(Q) \( E \[ 2 \] \)$. Additional fixed primes may be included. A #emph[filter] consists of a sign $sigma in { 1 \, - 1 }$ and unit squareclasses at the primes in $S$, imposed on positive squarefree integers $D$ prime to $S$, so that

$ h = sigma D $

is an odd fundamental discriminant and the functional sign of $E^(\( h \))$ is constant. Multiplication by squares of units preserves the local conditions. We impose these conditions on all Fourier indices, not only on squarefree ones. Projections onto the required unit squareclasses are finite combinations of quadratic coefficient twists and coprimality projections; they enlarge the level only at $S$.

For $p in.not S$, the action on $V = E \[ 2 \]$ has the following three types:

$ upright("type") & "Fr"_p \|_V & upright("weight")\
upright("split") & 1 & 1\
upright("simple") & upright("an element of order ") 2 & 1 \/ 2\
upright("root") & upright("an element of order ") 3 & 0 . $

Thus $w \( D \) = 1 / 2 sum_(p divides D) dim_(upright(bold(F))_2) V^("Fr"_p) = w \( h \)$. The fractional part of $w \( D \)$ is constant on a filter: it is determined by the quadratic discriminant character of the residual representation. For an arbitrary squarefree set of primes we use the same additive weight. Signs are encoded by $p^(*) = \( - 1 \/ p \) p$, so that $h = product_(p divides D) p^(*)$.

We use the ordinary theta multiplier cubed in weight $3 \/ 2$. A finite idele unit character and its Dirichlet character are related by the reciprocal convention: if a finite Schwartz function obeys $f \( u x \) = alpha \( u \) f \( x \)$, its scalar classical character on the lower-right entry is associated to $alpha^(- 1)$. All valuations satisfy $v \( 2 \) = 1$.

=== 4.2 The even coefficient system <the-even-coefficient-system>

#thm([Proposition 4.1.])[
  (Even coefficients).  #emph[ Fix a nonempty filter with even functional sign. There are a holomorphic weight-$3 \/ 2$ cusp form 
$ g = sum_(n gt.eq 1) a \( n \) q^n $

 of level supported on $S$, after enlarging exponents at those primes, and finite-order characters $psi \, eta$ of $2$-power order, with $psi \/ eta$ quadratic, having the following properties.]
  + #emph[The coefficients vanish off the filter and, for $p in.not S$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ a \( p^2 n \) = #scale(x: 120%, y: 120%)[\(] eta \( p \) a_p \( E \) - psi \( p \) \( - n \/ p \) #scale(x: 120%, y: 120%)[\)] a \( n \) - p eta \( p \)^2 a \( n \/ p^2 \) . $ <cs:hecke-recurrence>]

 As usual a coefficient with a nonintegral index is zero.]
  + #emph[After normalizing at one nonzero squarefree index, every squarefree coefficient in the filter is a rational number times a root of unity of $2$-power order. For a fixed nonzero squarefree index $D_0$, 
#[#set math.equation(numbering: n => "(4.2)")
 $ 2 v (frac(a \( D \), a \( D_0 \))) = v (frac(cal(L) \( sigma D \), cal(L) \( sigma D_0 \))) quad upright("whenever ") a \( D \) eq.not 0 . $ <cs:even-ratio>]

 Equivalently, there is a constant $c_g$, independent of $D$, such that 
#[#set math.equation(numbering: n => "(4.3)")
 $ 2 v \( a \( D \) \) = v #scale(x: 120%, y: 120%)[\(] cal(L) \( h \) #scale(x: 120%, y: 120%)[\)] + c_g . $ <cs:even-value>]

 In particular $a \( D \) eq.not 0$ if and only if $L \( E^(\( h \)) \, 1 \) eq.not 0$.]
  + #emph[After the fixed auxiliary exclusions described below, there is a constant $C_g$ such that, at every nonzero squarefree coefficient, 
#[#set math.equation(numbering: n => "(4.4)")
 $ v \( a \( D \) \) gt.eq w \( D \) + 1 / 2 s \( h \) - C_g . $ <cs:even-lower-bound>]

 The constants depend on the fixed curve, filter and auxiliary choices, and not on $D$ or its number of prime factors.]
] <prop:even-coefficients>

#proof[
  We first choose the packet member and its local characters. We then establish the rationality up to phase needed for valuation comparisons, apply the coefficient-square formula, and deduce the uniform lower bound from the interpolation estimates.
  Use the Shimura packet attached to the integral-weight newform of $E^(\( - sigma \))$. In the classical convention its positive Fourier index $D$ tests the twist by $chi_(- D)$, hence the curve $E^(\( sigma D \))$. The packet and Fourier coefficient results of #cite(label("Waldspurger1980"), form: "prose") #cite(label("Waldspurger1981"), form: "prose") apply to the cuspidal packet orthogonal to unary theta series. Their local uniqueness and global multiplicity assertions are summarized in #cite(label("Waldspurger1983")) Sections 3.1 and 5.1. A nonzero central value in the filter exists by Proposition 15. It selects a globally occurring packet member with nonzero Fourier functional at that index. At good odd primes choose spherical vectors; at infinity choose the holomorphic vector of weight $3 \/ 2$.
  We explain the choices at a prime of $S$. Let $lambda_D$ be a nonzero local Fourier functional and start with a vector on which it is nonzero. Average upper-unipotent translates against the inverse additive character of frequency $D$. If the averaging compact subgroup is sufficiently large, its translate by a unit scale $u$ can contribute only when $u^2$ is sufficiently close to $1$. The surviving scales are consequently small neighborhoods of $1$ and $- 1$. Local constancy then permits projection onto a unit character which matches the forced action of $- 1$, without killing the Fourier value: the contributions of the two neighborhoods add. Such a character may be chosen to have $2$-power order. Indeed only its parity is prescribed, and the $2$-primary quotient of the unit group realizes either possible parity. Upper averaging at integral frequency gives period one, and lower-unipotent invariance holds at sufficiently large depth. These vectors therefore give a classical form at a level supported on $S$. The parity conditions combine correctly by automorphy. The subsequent squareclass projections preserve its character. Write that character as $psi$.
  In the theta-multiplier convention the good eigenvalues of the packet are $psi \( p \)$ times those of $E^(\( - sigma \))$. Set $eta = psi chi_(- sigma)$. Then $psi \/ eta$ is quadratic and the weight-$3 \/ 2$ Hecke formula gives Equation (4.1).
  We need more than algebraicity of the coefficients. After normalization at one squarefree index, their nonzero squarefree valuations must be integers, so that a strict valuation inequality gains a full factor of $2$, even when the character field is ramified. We prove this by showing that every such coefficient is rational up to a phase of $2$-power order. At the fixed level, the weight-$3 \/ 2$ cusp space with character $psi$ has a basis over the field of character values, and coefficient conjugation changes $psi$ to its conjugate #cite(label("Shimura1981CriticalValues")) Section 2, Lemma 4(3)–(4), pp. 658–659. The good Hecke equations and the vanishing of coefficients off the filter are linear equations over $bb(Q) \( psi \, eta \)$. In a finite-dimensional space, finitely many of these equations cut out their full common kernel. The constructed complex vector has a nonzero coefficient at a squarefree index $D_0$ of the filter, so this coefficient functional is nonzero on some algebraic vector in that kernel. Choose such a vector. It remains orthogonal to unary theta series: at good primes their eigenvalues have absolute value $p + 1$, whereas the prescribed eigenvalues have absolute value at most $2 sqrt(p)$ by Hasse’s bound #cite(label("Purkait2012")) Section 2, Lemma 2.1, and Corollary 5.2.
  We use #cite(label("Waldspurger1981"), form: "prose") Corollary 2, pp. 483–484 to compare Fourier coefficients. Its hypothesis (H1) holds for every nonzero classical eigenspace used here, by Proposition 2 of that paper. The final paragraph of the corollary’s proof removes (H2) when the indices lie in the same local squareclass at every level prime. Our filters retain this condition at $2$ as well as at the odd primes.
  Let $u$ be an automorphism of $overline(bb(Q))$ acting by an odd power $e$ on the $2$-power characters, and put $nu = eta^(\( e - 1 \) \/ 2)$. The coefficient conjugate $g^u$ and coefficient twist $g ⊗ nu$ have exactly the same character and good Hecke system, since
  $ psi nu^2 = psi eta^(e - 1) = psi^e \, #h(2em) eta nu^2 = eta^e . $
  They may be compared at a common level supported on $S$, in the same good Hecke eigenspace $W$, and both have a nonzero $D_0$-coefficient. Let $ell_n : W arrow.r bb(C)$ denote the $n$th Fourier-coefficient functional. Waldspurger’s corollary applies to every $f in W$ and gives
  $ ell_D \( f \)^2 = C_D ell_(D_0) \( f \)^2 \, $
  where $C_D$ is independent of $f$. If $C_D = 0$, then $ell_D = 0$. Otherwise choose $c_D in bb(C)$ with $c_D^2 = C_D$ and factor the identity as
  $ \( ell_D - c_D ell_(D_0) \) \( ell_D + c_D ell_(D_0) \) = 0 . $
  The polynomial ring on $W$ is an integral domain, so one factor vanishes identically. Thus the two coefficient functionals are proportional on the whole space, including oldvectors and linear combinations. In particular the two forms have the same ratio of their $D$- and $D_0$-coefficients.
  It follows, for $xi = a \( D \) \/ a \( D_0 \)$, that
  $ u \( xi \) = nu \( D \/ D_0 \) xi . $
  The local squareclass conditions imply $eta \( D \/ D_0 \) = z^2$ for a value $z$ in the group of values of $eta$. Consequently $u \( xi \/ z \) = xi \/ z$ for every $u$, so $xi \/ z in bb(Q)$. This proves the phase assertion.
  With our characters and period normalization, its identity of #emph[coefficient squares] is
  #[#set math.equation(numbering: n => "(4.5)")
   $ (frac(a \( D \), a \( D_0 \)))^2 = psi \( D \/ D_0 \) thin frac(cal(L) \( sigma D \), cal(L) \( sigma D_0 \)) . $ <cs:even-square-ratio>]
  Here $psi \( D \/ D_0 \) = psi \( D \) psi \( D_0 \)^(- 1)$ has valuation zero; the factor $sqrt(D \/ D_0)$ in the classical central-value comparison is incorporated in $cal(L)$. The local unit squareclasses at $S$ agree; at a good prime the spherical squarefree factor is one at both valuations zero and one #cite(label("Waldspurger1981")) Section I.3, pp. 377–378. There is consequently no extra product over the prime factors of $D$. Taking valuations gives Equation (4.2), hence Equation (4.3). The same identity, compared with the nonzero coefficient at $D_0$, gives the asserted equivalence of vanishing. The corresponding rational-square statement for central values is Vignéras’s rationality theorem, recalled in #cite(label("Waldspurger1983"), form: "prose") Section 6.3, Theorem 6.
  If $E \[ 2 \]$ is an extension of trivial modules, combine Equation (4.3) with Theorem 12. If $E \[ 2 \]$ is irreducible, choose a fixed odd fundamental discriminant $h_(*)$ of opposite infinite sign, of analytic rank one, whose local characters agree with those of $h$ at $2 N$. Proposition 15 supplies such a choice. Exclude its prime factors from the filter and choose its support to avoid the finitely many exceptional genus fields. The reverse genus comparison in Proposition 9 and Theorem 13 give the same lower bound. These are fixed exclusions and constants, proving Equation (4.4) in both cases. ◻
]

=== 4.3 Odd coefficients from reduction of Heegner traces <odd-coefficients-from-reduction-of-heegner-traces>

The odd construction combines reduction of Heegner points with the ternary quadratic forms attached to definite quaternion orders. We use Deuring’s reduction correspondence in the oriented form of Cornut–Jetchev, together with the Eichler-order and ternary-form description of Jetchev–Kane #cite(label("Deuring1941")) #cite(label("CornutJetchev2013")) #cite(label("JetchevKane2011")). The weights below retain the genus character and the local orientations, so that the resulting Fourier coefficients recover the reduced genus sum at finite precision.

Fix now a nonempty filter of odd functional sign. Choose an odd fundamental $h_(*)$ of opposite infinite sign, with $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$, whose local characters agree with those of $h$ at $2 N$. Exclude its primes. We may choose $\| h_(*) \| > 3$ and include in its support a prime outside the exceptional imaginary quadratic discriminants. Thus all genus fields below have only the units ${ 1 \, - 1 }$ and avoid the CM field of $E$. Write

$ k = h h_(*) < 0 \, #h(2em) K_D = bb(Q) \( sqrt(k) \) \, #h(2em) P_D = P_1 \( h_(*) \) . $

The point $P_D$ is the character #emph[sum] of the conductor-one Heegner point for $K_D$. We fix the modular parametrization $phi$ with $phi \( oo \) = 0$, so the constants in its Hecke and Atkin–Lehner relations are torsion. At a simple zero of $E^(\( h \))$, its free line is that of $E^(\( h \))$, up to the fixed-degree identifications in Proposition 9. Below, the product derivative means the derivative at $s = 1$ of $L \( E^(\( h \)) \, s \) L \( E^(\( h_(*) \)) \, s \)$.

#thm([Proposition 4.2.])[
  (Odd coefficients under a genus-index bound).  #emph[ Assume that a constant $C_(*)$ satisfies 
#[#set math.equation(numbering: n => "(4.6)")
 $ j \( P_D \) gt.eq w \( D \) + 1 / 2 s \( h \) - C_(*) $ <cs:odd-bound-hypothesis>]

 for every $h$ in the filter with a simple zero. There are arbitrarily large precisions $M$, good odd primes $ell$ outside the fixed support, and holomorphic weight-$3 \/ 2$ forms $g_M = sum a_M \( n \) q^n$, of level supported on $S union { ell }$, with the following properties.]
  + #emph[The additional filter at $ell$ is 
#[#set math.equation(numbering: n => "(4.7)")
 $ \( h_(*) \/ ell \) = - sigma \, #h(2em) \( h \/ ell \) = sigma \, #h(2em) rho_T \( "Fr"_ell \) equiv C med \( mod med 2^M \) \, $ <cs:detecting-prime>]

 where $C$ is the action of a complex conjugation. In particular $ell equiv - 1 med \( mod med 2^M \)$.]
  + #emph[After a fixed harmless decrease in the working precision, the forms satisfy Equation (4.1) modulo that precision, with characters $eta_M \, psi_M$ of $2$-power order and quadratic ratio. Their squarefree coefficients have the form of a $2$-power phase times an integer modulo $2^M$.]
  + #emph[If a coefficient is visible, meaning $v \( a_M \( D \) \) < M$, then $E^(\( h \))$ has a simple zero and 
#[#set math.equation(numbering: n => "(4.8)")
 $ j \( P_D \) lt.eq v \( a_M \( D \) \) + C_1 . $ <cs:odd-detection>]

 For every admissible $D$ the coefficient lower bound is 
#[#set math.equation(numbering: n => "(4.9)")
 $ v \( a_M \( D \) \) gt.eq min { M \, thin w \( D \) + 1 / 2 s \( h \) - C_2 } $ <cs:odd-lower-bound>]

 when the product derivative is nonzero; if it is zero, the coefficient is zero modulo $2^M$. Here $C_1 \, C_2$ are independent of $ell \, M \, D$.]
  + #emph[A fixed squarefree witness $D_w$ in the original filter is admissible at every chosen $ell$ and has $v \( a_M \( D_w \) \)$ bounded as $M arrow.r oo$.]
  #emph[For irreducible $E \[ 2 \]$, the hypothesis is Theorem 13. For rational two-torsion, the positive filters used in the pointwise argument have this bound by Proposition 7.7, using only the even source. An arbitrary twist is first absorbed into the fixed curve, so only these positive filters are needed there.]
] <prop:odd-coefficients>

#proof[
  The proof has three stages. A reduction map detects one fixed nonzero genus point at arbitrarily high precisions. Weighted theta series then supply holomorphic forms with the required Hecke recurrence. Finally, an exact comparison with genus sums transfers point divisibility and the assumed lower bound to their squarefree coefficients.
  ===== 4.3.1 The reduction map and a detecting sequence. <the-reduction-map-and-a-detecting-sequence.>
  Choose a nonzero integral row $b$ with $b C = sigma b$. Under Equation (4.7), finite-field Kummer theory gives
  $ kappa_M : E \( upright(bold(F))_(ell^2) \) arrow.r H^1 \( upright(bold(F))_(ell^2) \, E \[ 2^M \] \) = E \[ 2^M \] \/ \( "Fr"_ell^2 - 1 \) E \[ 2^M \] = E \[ 2^M \] . $
  The last identification is evaluation at arithmetic Frobenius squared. Put $lambda_M = b kappa_M$. This map has Frobenius sign $sigma$.
  Choose $h_w = sigma D_w$ in the original filter with a simple zero, using Proposition 15. A fixed multiple of its genus point is a nonzero point on the rational curve $E^(\( h_w \))$. Its division cocycle has open translation image on the kernel of the Tate action, even after fixed finite auxiliary fields have been adjoined. Here is the relevant argument. The translation image is a Galois-stable $bb(Z)_2$-submodule of the Tate module. Its rational span is nonzero: otherwise the point’s Kummer class would factor through the Tate image; that image has a central nonidentity scalar, which kills its rational first cohomology, contradicting Kummer injectivity. The rational Tate representation is irreducible by #cite(label("Serre1968"), form: "prose") Chapter IV, Section 2.1, pp. IV-9–IV-10, since $"End"_(bb(Q)) \( E \) = bb(Z)$. This includes curves with geometric complex multiplication, whose nonreal endomorphisms are not defined over $bb(Q)$. The scalar Lie-algebra assertion of #cite(label("Bogomolov1981"), form: "prose") Section 2, Theorem 3, p. 62, followed by local logarithm and exponential, supplies the required nonidentity scalar. The nonzero stable span is therefore the whole Tate module. The translation image consequently contains a full lattice. Passing to a finite-index subgroup preserves this fact.
  Take an element acting as $C$ on $T$ and as complex conjugation on the fixed quadratic character fields, and modify it by such a translation. On the twisted module for $h_w$ its action is $sigma C$; at its square the cocycle includes $1 + sigma C$. Projection by $b$ is twice the corresponding nonzero row. We can therefore arrange nonzero detection with a fixed finite valuation. Chebotarev, applied at successive finite precisions to this fixed compatible Galois element and its division data, supplies arbitrarily large primes satisfying Equation (4.7), also with $h = h_w$, and the asserted bounded detection. A congruence on the target curve’s Frobenius is all that is required. The supersingular objects used next are points of the modular curve, not an additional reduction hypothesis on $E$.
  ===== 4.3.2 Supersingular values and local weights. <supersingular-values-and-local-weights.>
  Let $B$ be the quaternion algebra ramified at $ell$ and infinity, and let $R$ be an Eichler order of level $N$. Supersingular pairs on $X_0 \( N \)$ are parametrized by
  $ B^times without hat(B)^times \/ hat(R)^times . $
  They are defined over $upright(bold(F))_(ell^2)$. The reduction and Eichler order description apply to arbitrary $N$ prime to $ell$; see #cite(label("JetchevKane2011")) Sections 1.1–1.2 and 2.5. For a representative $z$ write $R_z = B ∩ z hat(R) z^(- 1)$ and let $P_M \( z \)$ be the reduced modular-parametrization value followed by $lambda_M$. The cusp differences have torsion image by #cite(label("Drinfeld1973"), form: "prose") Section 1. Multiply the parametrization once by a fixed integer $L$ killing the cuspidal constants in its Hecke and Atkin–Lehner relations and the bounded-degree torsion occurring in genus sums. This choice is independent of $D \, ell \, M$.
  The resulting $P_M$ has good Brandt eigenvalues $a_p \( E \)$, level Atkin–Lehner eigenvalues $w_(p^e)$ for $p^e bar.v.double N$, and eigenvalue $sigma$ for the right uniformizer at $ell$. These identities hold modulo $2^M$. Choose integer representatives of its values when making an ordinary characteristic-zero theta series.
  On $B^0$, the trace-zero subspace, use the positive definite quadratic form $Q \( x \) = - x^2 = "Nrd" \( x \)$. Our aim is to make the squarefree coefficient $a_M \( D \)$ equal, modulo $2^M$ and up to a phase of $2$-power order, to a fixed integer multiple of
  $ lambda_M #scale(x: 120%, y: 120%)[\(] "red"_ell \( L P_D \) #scale(x: 120%, y: 120%)[\)] . $
  We will identify its terms with optimal embeddings of $cal(O)_(K_D)$. Their local orientations give several copies of the genus sum. The weights must make those copies contribute equally, while their unit-scaling law must give a scalar modular character. The weighted trace calculation below will determine the exact multiplier.
  Define a finite compactly supported, locally constant weight $f = product f_p$ as follows; a value not satisfying a listed condition is zero.
  + Away from $2 N h_(*) ell$, require order integrality and put $f_p = 1$.
  + At $2$, require $\( 1 + x \) \/ 2$ to be integral and $x^2$ to be a split fundamental unit squareclass. At $p^e bar.v.double N$, require the split fundamental unit type and its order embedding. The cyclic Eichler level line selects one of the two eigenroots $r$ of $x$; weight it by a $2$-power unit character $eta_p \( r \)$ with
    $ eta_p \( - 1 \) = w_(p^e) chi_(h_(*)) \( p \)^e . $
    If $p = 2$, use the selected summand of $\( 1 + x \) \/ 2$, whose eigenvalues $\( 1 + r \) \/ 2$ and $\( 1 - r \) \/ 2$ differ by the odd unit $r$. Scaling by an odd $u$ sends this operator to $u \( 1 + x \) \/ 2 + \( 1 - u \) \/ 2$ and preserves that summand; its selected root for $u x$ is $u r$. Thus the weight changes by $eta_2 \( u \)$, even when the two eigenvalue parities interchange. If $2 divides.not N$, impose only the stated integrality restriction.
  + At $p divides h_(*)$ require integral $x$ with determinant of valuation one. Its reduction is nonzero nilpotent. On that orbit use the sign which transforms by $\( det u \/ p \)$ under conjugation by $u in "GL"_2 \( upright(bold(Z))_p \)$. This sign exists because the stabilizer of a nonzero nilpotent has the form $a I + b X$ and determinant $a^2$. Scaling $x$ by a unit $u$ changes this sign by $\( u \/ p \)$.
  + At $ell$ require integral unit norm and the unramified quadratic type. Choose a basis of the trace-zero line in $upright(bold(F))_(ell^2)$ and weight the nonzero residue on that line by its Legendre symbol relative to the basis.
  All these conditions may be imposed at finite depth. They are stable under unit scaling. Right order-unit conjugation changes $f$ by the inverse of $chi_(h_(*)) compose "Nrd"$, exactly canceling the norm character below. At $ell$, order units commute on the residue field, while a uniformizer negates its trace-zero line. Since $ell equiv - 1 med \( mod med 4 \)$, the latter weight changes by $- 1$.
  Write $alpha_B = product_p alpha_p$ for the finite unit-scaling character, so that $f \( u x \) = alpha_B \( u \) f \( x \)$. Define the classical Dirichlet character $eta_B$ by
  $ eta_B \( d \) = product_p alpha_p \( d \) #h(2em) upright("for integers ") d upright(" prime to the support") . $
  The associated finite idele character restricts to $alpha_B^(- 1)$ on the ramified unit groups, in accordance with our reciprocal convention. Both characters are even. Indeed their value on $- 1$ is
  $ (product_(p^e bar.v.double N) w_(p^e) chi_(h_(*)) \( p \)^e) chi_(h_(*)) \( - 1 \) \( - 1 \) = 1 \, $
  by the even functional sign of $E^(\( h_(*) \))$. The characters have $2$-power order.
  ===== 4.3.3 Transformation and good Hecke relation. <transformation-and-good-hecke-relation.>
  Choose a fixed positive integer $c_0$ divisible by the orders of all unit groups which occur. Such a choice is uniform: a unit group of a rational definite quaternion order has bounded order. Form
  #[#set math.equation(numbering: n => "(4.10)")
   $ H_M \( n \) = c_0 sum_z frac(P_M \( z \) chi_(h_(*)) \( "Nrd" z \), \| R_z^times \|) sum_(x in B^0\
- x^2 = n) f \( z^(- 1) x z \) \, #h(2em) H_M \( tau \) = sum_(n gt.eq 1) H_M \( n \) q^n . $ <cs:weighted-theta>]
  The norm character is trivial on rational $B^times$, since its rational reduced norms are positive. The right transformation just checked makes Equation (4.10) independent of the representatives.
  For scalar modularity, apply the Weil representation of $\( B^0 \, Q \)$ to $f$ and the Gaussian at infinity #cite(label("Weil1964")). At a finite prime, with the additive character of conductor $bb(Z)_p$, the local formulas are #cite(label("PalDeVeraPiquero2019")) Section 4.3, pp. 1965–1966
  $ omega \( n \( b \) \) f_p \( x \) & = upright(bold(e))_p \( b Q \( x \) \) f_p \( x \) \,\
omega \( m \( u \) \) f_p \( x \) & = gamma_p \( u \) \| u \|_p^(3 \/ 2) f_p \( u x \) \, & omega \( w \) f_p & = gamma_p hat(f)_p . $
  Here $n \( b \) = mat(delim: "(", 1, b; 0, 1)$, $m \( u \) = "diag" \( u \, u^(- 1) \)$, and $w$ is the Weyl element. Integral $b$ fixes $f_p$, since $Q$ is integral on its support. Choose a lattice of translation invariance for $f_p$; its dual contains the support of $hat(f)_p$. For sufficiently large $a_p$, the form $p^(a_p) Q$ is integral on that dual lattice. Thus $n \( p^(a_p) b \)$ fixes $hat(f)_p$, and conjugation by $w$ proves invariance under sufficiently deep lower unipotents. This argument also works at $2$ and at arbitrary finite character depth.
  Compare with the threefold ordinary-theta reference line, using the same additive character and lifts. In a presentation $B = \( - a \, - b \)$, the quadratic form is $a X^2 + b Y^2 + a b Z^2$. The ratio of its diagonal Weil factor to the reference factor is
  $ \( a \, u \)_p \( b \, u \)_p \( a b \, u \)_p = \( \( a b \)^2 \, u \)_p = 1 . $
  This calculation holds also over $bb(Q)_2$. The remaining local diagonal scalar is therefore $alpha_p \( u \)$. Upper unipotents, diagonal units, and sufficiently deep lower unipotents generate the required local $Gamma_0$ subgroup: explicitly, for $a$ a unit,
  $ mat(delim: "(", a, b; c, d) = n^(-) \( c \/ a \) m \( a \) n \( b \/ a \) . $
  Choose the depths also to serve the ordinary-theta reference line and the character conductors. The central ambiguity of the metaplectic lifts cancels in the comparison, since both representations have the same odd central action. At the chosen depth, $a$ is congruent to $d^(- 1)$ modulo the character conductor, so the local right eigenvalue is $alpha_p \( d \)^(- 1)$. Classical restriction uses the inverse finite component and consequently gives the character $eta_B \( d \)$. Conjugation by $z$ preserves $Q$ and commutes with the Weil action, so all summands have this same level and scalar character. At good odd primes the lattice is spherical. The Gaussian gives weight $3 \/ 2$, and positive definiteness gives holomorphy at every cusp. Thus $H_M$ is a classical form of level supported on $2 N h_(*) ell$.
  At a prime $p divides.not 2 N h_(*) ell$, the neighbor relation has Hecke eigenvalue
  $ eta_B \( p \) chi_(h_(*)) \( p \) a_p \( E \) . $
  The factor $chi_(h_(*)) \( p \)$ comes from the reduced norm of a Brandt neighbor and $eta_B \( p \)$ from scaling at the other primes.
  The multiplicities can be read directly in a matrix order. Put $y = p x$. If $y$ is primitive and $Q \( y \)$ is divisible by $p^2$, its nonzero nilpotent reduction has a unique invariant line; in a basis adapted to that line the other off-diagonal entry is divisible by $p^2$, so exactly one neighbor makes $y \/ p$ integral. If $y \/ p$ is integral, its reduction has $1 + \( - Q \( y \/ p \) \/ p \)$ invariant lines, except that a zero reduction has a further $p$ lines. These are precisely the middle and last terms of the weight-$3 \/ 2$ Hecke recurrence. The factors $\| R_z^times \|^(- 1)$ are the orbit-stabilizer factors making the Brandt transfer valid. Since the eigenrelation for $P_M$ holds modulo $2^M$, so does this relation for $H_M$.
  Put $d = \| h_(*) \|$. The weights force $Q \( x \)$ to be divisible by $d$. Before the final filter projections, the series with coefficients $a_M \( n \) = H_M \( d n \)$ is the same weighted theta sum for $Q \/ d$. Its ternary determinant changes by $d^(- 3)$, whose squareclass is $d$; hence the scalar character acquires $\( d \/ dot.op \)$. Substitution of $d n$ in the good-prime recurrence leaves $eta_B chi_(h_(*))$ unchanged. Now apply the filter projections. Extraction of these multiples changes the character to $psi_M = eta_B \( \| h_(*) \| \/ dot.op \)$, while $eta_M = eta_B chi_(h_(*))$ is the good eigenvalue character. Their quotient is quadratic. The neighbor relation therefore becomes Equation (4.1). Every operation has level supported on $S union { ell }$.
  ===== 4.3.4 The weighted trace identity. <the-weighted-trace-identity.>
  The form and its recurrence are now constructed. We next identify a squarefree coefficient with the reduction of the original genus sum, keeping the orientation multiplicities and unit stabilizers explicit.
  For a squarefree $D$ in the filter, put $n = \| h_(*) \| D = - k$. An $x$ counted in Equation (4.10) is exactly an optimal embedding of the full order $cal(O)_(K_D)$ into $R_z$, by sending $sqrt(k)$ to $x$. At $2$ the generator is $\( 1 + sqrt(k) \) \/ 2$, which is why the integrality condition above is necessary. At a split level prime there are two choices of cyclic level orientation, and at $ell$ there are two choices of unramified quadratic orientation. There is one local orbit at the remaining primes. The split-level assertion follows by decomposing a stable lattice into its two idempotent summands: a cyclic quotient of order $p^e$ forces all of that quotient into one summand. The division-prime assertion follows from the two reduced-norm parity cosets. At primes outside $2 N h_(*) ell$, stable lattices are the fractional ideals of the quadratic order, giving the single local orbit.
  Fix one orientation tuple and a rational embedding $x_0$. The corresponding global optimal-embedding orbits are parametrized by $"Pic" \( cal(O)_(K_D) \)$. Explicitly, once one adelic representative $z_0$ is fixed, the representatives are $z_(frak(a)) = a z_0$ with $a in hat(K)_D^times$; changing $a$ by $K_D^times$ or $hat(cal(O))_(K_D)^times$ gives exactly the same class. Because $a$ commutes with $x_0$, the Schwartz factor is constant along this class-group orbit. Its remaining relative weight is
  $ chi_(h_(*)) \( "Nrd" a \) = chi_(h_(*)) \( "Norm"_(K_D \/ bb(Q)) a \) \, $
  the unramified genus character. This computation establishes the weighted identity, rather than merely an unweighted correspondence.
  For completeness the stabilizer factor is also exact. Each orbit of embeddings in a given $R_z$ has $\| R_z^times \| \/ \| cal(O)_(K_D)^times \| = \| R_z^times \| \/ 2$ elements. Thus its contribution after division by $\| R_z^times \|$ is one half of the corresponding class-group term. These are oriented embeddings, not conjugate pairs: $x$ and $- x$ have opposite orientations at $ell$ and cannot be conjugate by an order unit, whose residue conjugation on $upright(bold(F))_(ell^2)$ is trivial. CM reduction at the inert prime identifies these terms with the reductions of the Heegner points and commutes with ideal action; the cyclic subgroup carries the selected level orientation. Fixing the residue-field identification at $ell$ retains its orientation in the reduction-to-embedding correspondence of #cite(label("Deuring1941"), form: "prose"); see #cite(label("CornutJetchev2013")) arXiv version 1, Theorem 3.1, Corollary 3.2, and Section 3.6, Remark 1 and #cite(label("JetchevKane2011")) Sections 2.4–2.6 and 4.1. The former remark explains that forgetting this identification identifies conjugate embeddings. Here both orientations remain in the theta sum.
  Choose the initial orientation to agree with the Heegner point defining $P_D$. The constant weight on its orbit is a phase $zeta_M \( D \) in mu_(2^oo)$, since all its local weights are units. Changing orientation at $p^e bar.v.double N$ multiplies the Schwartz factor by $w_(p^e) chi_(h_(*)) \( p \)^e$, and multiplies the norm-character-weighted parametrization value by the same sign. At $ell$ both signs are $- 1$, since $sigma chi_(h_(*)) \( ell \) = - 1$. Hence every one of the $2^(omega \( N \) + 1)$ orientation tuples contributes the same term. With the fixed multiplier $L$ already incorporated into $P_M$, the comparison is consequently
  #[#set math.equation(numbering: n => "(4.11)")
   $ a_M \( D \) = c_0 thin 2^(omega \( N \)) zeta_M \( D \) thin lambda_M #scale(x: 120%, y: 120%)[\(] "red"_ell \( L P_D \) #scale(x: 120%, y: 120%)[\)] med \( mod med 2^M \) . $ <cs:weighted-trace-identity>]
  The initial basis at $ell$ and initial orientation affect only $zeta_M \( D \)$. Formula (4.11) specifies the normalization using a character sum, with no class-number denominator. All rational multipliers are fixed independently of $D$ and $ell$.
  If the product derivative is zero, Gross–Zagier makes $P_D$ torsion. The fixed multiplier kills it: genus sums and their twist comparisons are defined over biquadratic fields. The torsion of a fixed elliptic curve in degree at most four is uniformly bounded, as one sees by reducing its prime-to-residue-characteristic torsion at two fixed good primes of distinct residue characteristic; the residue degrees are at most four. Thus the coefficient is zero at the stated precision. If the derivative is nonzero, write the point against the free twist line. Division by $2^(j \( P_D \))$ on that line implies the same divisibility after reduction and $lambda_M$, up to the fixed-degree comparison and the fixed multiplier. Conversely, a visible image bounds $j \( P_D \)$ above by its visible valuation plus a fixed constant. Equation (4.11) proves Equations (4.8) and (4.9), using Equation (4.6). Gross–Zagier–Kolyvagin then gives the simple zero and finite $"Sha"$ when the coefficient is visible. The detecting construction for $D_w$ supplies the final assertion. Fixed denominators or multipliers only reduce $M$ by a fixed amount; reindexing the precisions gives the formulation stated. ◻
]

=== 4.4 The least normalized depth <the-least-normalized-depth>

We now minimize the coefficient valuation after subtracting the prime weight $w \( D \)$. This normalization is fixed before any prime array is chosen. Attainment of the minimum will detect analytic rank and bound the finite Selmer contribution; for the odd source this is interpreted through the bounded-weight sequences and finite realizations below.

For the even source, first rescale $g$ so that $a \( D_0 \) = 1$ at one nonzero squarefree index. Its nonzero squarefree valuations are then integers by Proposition 16. Set

#[#set math.equation(numbering: n => "(4.12)")
 $ delta = min_D { v \( a \( D \) \) - w \( D \) } \, #h(2em) A \( D \) = cases(delim: "{", 1 \, & v \( a \( D \) \) = delta + w \( D \) \,, 0 \, & upright("otherwise") \,) $ <cs:even-symbol>]

with $A \( D \) = 0$ off the filter. The minimum exists: the lower bound is uniform, visible valuations are integers after normalization, the fractional part of the weight is fixed, and a nonzero witness exists.

For the odd source fix a nonprincipal ultrafilter $cal(U)$ on its sequence of precisions. Consider all sequences $D_M$ of admissible indices for which $w \( D_M \)$ is bounded and $v \( a_M \( D_M \) \)$ is visible on an ultrafilter-large set. For each such sequence, its normalized depth has a lower bound in a discrete set. Let $delta$ be the least depth attainable on an ultrafilter-large set. This least depth exists and is attained: the uniform lower bound bounds it below, discreteness gives a least value, and the fixed witness bounds the possible minimum above. For a bounded-weight admissible sequence $upright(bold(D)) = \( D_M \)$, define

$ A \( upright(bold(D)) \) = 1 quad arrow.l.r.double quad { M : v \( a_M \( D_M \) \) = delta + w \( D_M \) } in cal(U) \, $

and set $A \( upright(bold(D)) \) = 0$ otherwise. We suppress the sequence notation when discussing finite configurations; each application uses their simultaneous finite realizations, as proved below.

For the odd source, a least weight supporting a unit symbol is minimized among the same bounded-weight sequences that attain depth $delta$. After restricting to an ultrafilter-large set, the weight of such a sequence may be held constant, since it lies in a bounded subset of $1 / 2 bb(Z)_(gt.eq 0)$. The set of these constant weights is nonempty and has a least element $m$. If unit symbols of weight below $m$ occurred on an ultrafilter-large set of stages, choosing one such index at each stage would contradict the definition of $m$.

#thm([Lemma 4.3.])[
  (Uniformity at a fixed weight bound).  #emph[For every fixed $W$, on an ultrafilter-large set of sufficiently high precisions, 
$ v \( a_M \( D \) \) gt.eq delta + w \( D \) $

 for every admissible index with $w \( D \) lt.eq W$, with valuations truncated at the working precision. Any finite list of stabilized symbol assertions of bounded weight is realized simultaneously at such precisions. The definition allows arbitrarily many weight-zero root factors.]
] <cs:fixed-weight-uniformity>

#proof[
  If the first assertion failed on an ultrafilter-large set, choose a violating $D_M$ at each of those levels. Their weights are bounded by $W$ and their normalized depths lie in a fixed bounded discrete range. After selecting one depth on an ultrafilter-large set, they contradict the definition of $delta$. For a finite collection of stabilized bits, intersect their ultrafilter-large realization sets. A bound on weight, rather than on the number or size of primes, is all that this argument uses. At weights beyond the chosen bound, the truncated lower estimate of Proposition 17 still supplies any prescribed bounded-depth divisibility test once the weight is sufficiently large. No claim of one finite level valid for all unbounded weights is made. ◻
]

#thm([Proposition 4.4.])[
  (Detection by a unit symbol).  #emph[For either coefficient source, $A \( D \) = 1$ implies the prescribed analytic order: zero in the even case and one in the odd case. At every such index, 
#[#set math.equation(numbering: n => "(4.13)")
 $ v \( cal(L) \( h \) \) & lt.eq 2 w \( D \) + C &  & upright("in the even case") \,\
j \( P_D \) & lt.eq w \( D \) + C &  & upright("in the odd case") \,\
s \( h \) & lt.eq C \, #h(2em) dim_(upright(bold(F))_2) "Sel"_2 \( E^(\( h \)) \/ bb(Q) \) lt.eq C . $ <cs:even-sharp>]

 The constants are fixed after choosing the original curve, filter, coefficient normalization and genus partner. For the odd source they are independent of the detecting prime and the working precision, and of the number and size of active primes. Statements about its symbols are used through finite realizations as in Lemma 18.]
] <prop:unit-symbol-detection>

#proof[
  In the even case substitute $v \( a \( D \) \) = delta + w \( D \)$ into Equations (4.3) and (4.4). In the odd case use a precision greater than the finitely many tested depths and apply Equations (4.8) and (4.9). The constant $delta$ is fixed and the comparison constants are uniform, proving the first inequalities and the bound on $s \( h \)$. At these indices the analytic order is established, so Gross–Zagier–Kolyvagin gives the same algebraic rank and finite $"Sha"$ #cite(label("GrossZagier1986")) #cite(label("Kolyvagin1990")). The exact sequence for $2$-Selmer then bounds its dimension by that rank, the fixed bound on rational $2$-torsion, and the $2$-primary length of $"Sha"$. This proves the final assertion without making any finiteness assumption at an index where the analytic order has not yet been detected. ◻
]

== 5 Trace identities and prime substitutions <sec:trace-calculus>

We now turn the least-depth coefficients into rules for replacing, contracting, and deleting primes. The input is a coefficient system from Section 4, with fixed support $S$, characters $eta \, psi$, expansion $g = sum_(n gt.eq 1) a \( n \) q^n$, minimum depth $delta$, and symbol $A \( D \) in bb(F)_2$, extended by zero off its filter. The coefficient lower bounds and the rational leading units proved there are essential hypotheses. A unit symbol has the analytic interpretation of Proposition 19.

Put $F = bb(Q) \( E \[ 2 \] \)$. A prime outside $S$ is called split, simple, or a root according as its action on $E \[ 2 \]$ is the identity, a transposition, or an element of order three; its weight is respectively $1$, $1 \/ 2$, or $0$. The same terminology will be used for Galois elements, according to their image in $"Gal" \( F \/ bb(Q) \)$. A nonroot is an element of either of the first two types. A finite set of primes and its squarefree product will occasionally be denoted by the same letter. Thus $U \/ p$ means deletion of $p$ from $U$, not deletion of a prime power from an arbitrary integer.

An oriented Frobenius label in an extension $L$ of $F$ means a #emph[rational] arithmetic Frobenius lift in $"Gal" \( L \/ bb(Q) \)$, with a chosen place and its residual image in $"Gal" \( F \/ bb(Q) \)$ retained. At a simple prime this is the lift $g$ of the transposition, not only the Frobenius $g^2$ of the residue-degree-two place of $F$.

For the odd source, fix the finite operator patterns, their weight bounds, and all integer divisions required by the intended tests before choosing an actual stage. The primes realizing those patterns may depend on the stage. The lemma below distinguishes the sharp estimate on a prescribed bounded range of squarefree weights from integrality at every Fourier index. Both are needed to form the integral weight-two trace lattice. At a chosen stage the detecting prime belongs to $S$, and the level, coefficient field, and characteristic-zero lift are fixed. Recurrences hold modulo the working precision before division.

=== 5.1 Normalized coefficient operators <normalized-coefficient-operators>

Let $U$ be a finite set of nonroot primes outside $S$. Write

$ sans(U)_p #h(-0.16667em) (sum_n c \( n \) q^n) = sum_n c \( p n \) q^n \, #h(2em) sans(V)_p #h(-0.16667em) (sum_n c \( n \) q^n) = sum_n c \( n \) q^(p n) \, $

and define

#[#set math.equation(numbering: n => "(5.1)")
 $ B_U = 2^(- ceil.l delta + w \( U \) ceil.r) product_(p in U) \( sans(U)_p - eta \( p \) sans(V)_p \) g \, #h(2em) e_U = ceil.l delta + w \( U \) ceil.r - delta - w \( U \) . $ <tc:normalized-operator>]

The factors commute. We say that $U$ has matching parity if $delta + w \( U \)$ is integral, and opposite parity otherwise. Equivalently, $w \( U \)$ has, or does not have, the fractional part prescribed by the filter. Consequently $e_U = 0$ or $1 \/ 2$, respectively.

These operations increase the level at a newly introduced $p$ only to exponent one. In fact, $sans(V)_p$ changes the character by $\( p \/ dot.op \)$ and raises the level by $p$, while on that raised level $sans(U)_p = sans(U)_(p^2) sans(V)_p$. We denote the resulting character of $B_U$ by $psi_U$. At a good prime $q in.not S union U$ the coefficient recurrence remains

#[#set math.equation(numbering: n => "(5.2)")
 $ B_U \[ q^2 n \] = #scale(x: 120%, y: 120%)[\(] eta \( q \) a_q \( E \) - psi_U \( q \) \( - n \/ q \) #scale(x: 120%, y: 120%)[\)] B_U \[ n \] - q eta \( q \)^2 B_U \[ n \/ q^2 \] . $ <tc:transformed-recurrence>]

For the odd source, Equation (5.2) is read modulo $2^(M - ceil.l delta + w \( U \) ceil.r)$ when $M$ is the working recurrence precision before normalization. As usual, a coefficient with nonintegral index is zero. The equality of the good eigenvalue before and after $sans(V)_p$ can also be seen directly: its new middle character contains $\( p \/ q \)$, which cancels the factor $\( p \/ q \)$ arising from the change of coefficient index.

#thm([Lemma 5.1.])[
  (Coefficient bound and first shell).  #emph[Write an index prime to $S$ uniquely as 
$ n = J r m^2 \, #h(2em) J subset.eq U \, #h(2em) r upright(" squarefree") \, quad \( r \, U \) = 1 \, $

 and put $D = \( U \/ J \) r$.]
  #emph[For the even source, $B_U$ has integral coefficients and satisfies the following assertions at every index. For the odd source, fix bounds on $w \( U \)$ and on the squarefree weights to be tested, and fix an integer $K gt.eq 0$. There is a larger cutoff $W$ and an ultrafilter-large set of arbitrarily high stages at which $B_U$ is integral at every index, the assertions below hold whenever $w \( D \) lt.eq W$, and 
$ v \( B_U \[ n \] \) gt.eq K #h(2em) upright("if ") w \( D \) > W . $

 These choices are uniform over prime realizations with the prescribed weight bounds.]
  #emph[The coefficient $B_U \[ n \]$ is zero unless $D$ belongs to the filter. Within the range just specified, it satisfies 
#[#set math.equation(numbering: n => "(5.3)")
 $ v \( B_U \[ n \] \) gt.eq w \( r \) + frac(\# { p in J : p upright(" simple") }, 2) - e_U . $ <tc:coefficient-bound>]

 At a split prime $p in J$, the factor contributed by the difference operator, after removing its character phase and one factor of $2$, is 
#[#set math.equation(numbering: n => "(5.4)")
 $ c_p \( D \) = frac(a_p \( E \) - \( psi \/ eta \) \( p \) \( - D \/ p \) - 1, 2) med \( mod med 2 \) . $ <tc:shell-factor>]

 This is independent of the exponent of $p$ in $m$. At a simple prime $p in J$, Equation (5.4) holds for the first shell, that is, when $p divides.not m$.]
] <tc:shell-bound>

#proof[
  The good-prime recurrence of Section 4 expresses every relevant coefficient in terms of the squarefree coefficient $a \( D \)$. After removing the factor $eta \( p \)^s$, the multipliers for powers $p^(2 s)$ are determined by
  $ b_0 = 1 \, #h(2em) b_1 = a_p \( E \) - \( psi \/ eta \) \( p \) \( - D \/ p \) \, #h(2em) b_(s + 1) = a_p \( E \) b_s - p b_(s - 1) . $
  If $p divides D$, the Legendre symbol in $b_1$ is zero. The recurrences at different primes commute and their multipliers multiply.
  For $p in U \/ J$ the difference operator contributes $b_s - b_(s - 1)$, with $b_(- 1) = 0$. Here $p divides D$, so $b_1 = a_p \( E \)$ is even. Modulo $2$ the sequence alternates between $1$ and $0$, and every such difference is odd. For $p in J$ we have $p divides.not D$; now $b_0$ and $b_1$ are odd and every $b_s$ is odd. The difference $b_(s + 1) - b_s$ is therefore even.
  For the more precise assertion at a split prime put $a = a_p \( E \)$ and $kappa = \( psi \/ eta \) \( p \) \( - D \/ p \) in { 1 \, - 1 }$. Since $E \[ 2 \]$ is rational over $upright(bold(F))_p$, $a equiv p + 1 med \( mod med 4 \)$. If $Delta_s = b_(s + 1) - b_s$, the recurrence gives
  $ Delta_(s + 1) = a Delta_s - p Delta_(s - 1) quad \( s gt.eq 1 \) . $
  Every $Delta_s$ is even, whence $Delta_(s + 1) equiv Delta_(s - 1) med \( mod med 4 \)$. Directly,
  $ Delta_1 - Delta_0 = a^2 - a kappa - 2 a + 2 kappa + 1 - p equiv 0 med \( mod med 4 \) . $
  Thus $Delta_s \/ 2 equiv \( a - kappa - 1 \) \/ 2 med \( mod med 2 \)$ for every $s$. For a simple prime this last formula is still the defining calculation at $s = 0$, which is all that will be required.
  Put $d_U = ceil.l delta + w \( U \) ceil.r$. Whenever the sharp squarefree bound $v \( a \( D \) \) gt.eq delta + w \( D \)$ is available, the factors just computed give at least one further factor of $2$ for each $p in J$. Hence
  $ v \( B_U \[ n \] \) gt.eq delta + w \( D \) + \# J - d_U = w \( r \) + frac(\# { p in J : p upright(" simple") }, 2) - e_U . $
  For an allowed squarefree class this expression is integral, since $delta + w \( D \)$ is integral. Its only possible negative value before this parity condition is imposed is $- 1 \/ 2$, so it is nonnegative. For the even source the sharp bound holds at every squarefree index, which proves all-index integrality and the displayed estimate.
  For the odd source, let $u_0$ bound $w \( U \)$. Every prime in $U$ is a nonroot, so $\# U lt.eq 2 u_0$ and the normalizing exponents $d_U$ are bounded. Proposition 17 gives a constant $C$ such that at every admissible squarefree index
  $ v \( a_M \( D \) \) gt.eq min { M \, w \( D \) - C } . $
  This includes the case of zero product derivative, when the coefficient vanishes modulo $2^M$. Choose $W$ above the prescribed tested weights and so large that $W - C - d_U > K$ for all permitted $U$. By Lemma 18, on an ultrafilter-large set of stages the sharp squarefree bound holds simultaneously for every $D$ with $w \( D \) lt.eq W$. Take an arbitrarily high stage in this set, with precision exceeding all the fixed normalizations, the first-shell tests, and $delta + W + 2 u_0$, and such that $M - d_U gt.eq K$ for every permitted $U$.
  The recurrences and operator identities for this source hold modulo the working precision. Their multipliers are integral, so iteration through any square exponent leaves errors in the same precision ideal. After dividing by $2^(d_U)$, the possible error has valuation at least $M - d_U$. Thus the sharp calculation above is valid throughout the bounded range. Outside that range the same calculation with the coarse squarefree bound gives
  $ v \( B_U \[ n \] \) gt.eq min { M - d_U \, thin w \( D \) - C + \# J - d_U } gt.eq K . $
  This proves integrality at every index of the actual form, while asserting the sharp estimate only on the specified bounded range. There is no restriction on the number of weight-zero root factors. Coefficients excluded by the filter are zero. Every removed phase is a value of $eta$, hence a unit reducing to $1$ at the chosen prime above $2$. ◻
]

At equality, the normalized leading coefficient is $A \( D \)$ times the displayed shell factors. In particular it is zero when $A \( D \) = 0$. For the odd source this assertion is used for the finite stabilized symbol evaluations realized at the chosen stage. All omitted-prime comparisons use the same source $g$ and minimum $delta$.

In later coefficientwise divisions, choose $K$ to cover the largest additional division and the desired final divisibility. If a least-weight argument also requires all lower-weight symbols to vanish, that condition holds simultaneously on an ultrafilter-large set: a failure would select a bounded-weight sequence contradicting the stabilized minimum. Intersect that set with the one in the lemma. The bounded range then supplies the sharp calculation and any required zero symbols; the coefficients beyond the cutoff already have all the necessary factors of $2$. Consequently all coefficientwise divisions and vanishings used below hold on actual integral forms at one chosen stage for each finite collection of tests. No stage is required to work for every unbounded configuration.

=== 5.2 Removing unary coefficients <removing-unary-coefficients>

The coefficient bound identifies the terms that can survive at the lowest valuation. For matching $U$ in the rational-torsion case, these lie on finitely many square classes. Subtracting the corresponding unary theta series will permit one further integral division by $2$.

Suppose first that $E \( bb(Q) \) \[ 2 \] eq.not 0$. There are then no root primes. For matching $U$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ Theta_J & = sum_(m > 0\
\( m \, product_(s in S) s \) = 1) eta \( m \) chi_(- 4) \( m \)^i m thin q^(J m^2) \,\
H_U & = 1 / 2 (B_U - sum_(J subset.eq U\
J upright(" split only")) B_U \[ J \] Theta_J) \, $ <tc:unary-subtraction>]

where $i in { 0 \, 1 }$ is chosen so that $eta chi_(- 4)^i$ is odd. For opposite $U$, set $H_U = B_U$. Except where a further division is explicitly made in Lemma 28, in the irreducible case we also set $H_U = B_U$.

#thm([Lemma 5.2.])[
  #emph[The form in Equation (5.5) is integral. Each $Theta_J$ is a weight-$3 \/ 2$ unary theta form with character 
$ eta chi_(- 4)^i \( - J \/ dot.op \) \, $

 whose new level primes are the primes of $J$, each to exponent one. Its character differs from $psi_U$ by a quadratic character.]
] <tc:unary-integrality>

#proof[
  In matching parity the right side of Equation (5.3) can be zero only if $r = 1$ and $J$ consists of split primes. At these indices Equation (5.4), together with the odd squared-index multipliers at primes outside $U$, gives
  $ B_U \[ J m^2 \] equiv B_U \[ J \] eta \( m \) med \( mod med 2 \) . $
  The coefficient of $Theta_J$ at $J m^2$ has precisely this residue: the common phase $eta \( m \)$ is retained on both sides, while $chi_(- 4) \( m \)^i m$ is an odd integer. Thus this is divisibility by $2$, not merely by $frak(m)$ in a ramified coefficient ring. Different squarefree $J$ have disjoint such supports. The numerator in Equation (5.5) is consequently divisible by $2$ coefficientwise.
  Put $beta = eta chi_(- 4)^i$, and let $beta_0$ be its primitive inducing character, of conductor $r$ supported on $S$. The unary theta transformation #cite(label("Purkait2012")) Section 2, p. 2 gives
  $ Theta_J^0 = sum_(m > 0) beta_0 \( m \) m q^(J m^2) in S_(3 \/ 2) #scale(x: 120%, y: 120%)[\(] 4 r^2 J \, beta_0 \( - 4 J \/ dot.op \) #scale(x: 120%, y: 120%)[\)] . $
  Removing the terms with $s divides m$ applies $1 - s beta_0 \( s \) sans(V)_(s^2)$, where $sans(V)_(s^2) = sans(V)_s^2$. Thus
  $ Theta_J = product_(s in S) #scale(x: 120%, y: 120%)[\(] 1 - s beta_0 \( s \) sans(V)_(s^2) #scale(x: 120%, y: 120%)[\)] Theta_J^0 . $
  Writing $P_S = product_(s in S) s$, every term in this product has theta parameter $J d^2$ for some $d divides P_S$. The same transformation formula places all terms at level $4 r^2 J P_S^2$, with character $beta_0 \( - 4 J \/ dot.op \)$ on the units of that level. This is the displayed character $eta chi_(- 4)^i \( - J \/ dot.op \)$. Since $J$ is prime to $S$, each fresh prime in $J$ still occurs in the level to exponent one. Finally $psi_U \/ eta$ is quadratic, as is $chi_(- 4)^i \( - J \/ dot.op \)$, proving the last assertion. ◻
]

=== 5.3 Weight-two traces <weight-two-traces>

We next express coefficient tests as traces of Galois representations. The trace identities will give relations among the tests; the level-prime identity will compare a test with the one obtained by omitting a prime.

Multiply the integral half-integral-weight form under consideration by

$ theta = 1 + 2 sum_(m gt.eq 1) q^(m^2) . $

This produces a weight-two modular form with the same reduced expansion. Choose a finite extension of $bb(Q)_2$ containing all coefficient fields and character values needed at the fixed level, and denote its ring of integers and maximal ideal by $cal(O)$ and $frak(m)$.

The characteristic-zero decomposition by the Hecke operators away from the level supplies commuting operators

$ t \( u \) \, med d \( u \) \, #h(2em) u in G_(bb(Q)) \, $

by taking the traces and determinants of the corresponding two-dimensional Galois representations. For cuspidal systems these are the weight-two representations of Deligne; for Eisenstein systems they are the sums of the two defining characters. At a good arithmetic Frobenius, $t \( "Fr"_q \)$ is the ordinary weight-two $T_q$, and the determinant is the cyclotomic character times the diamond character. We use the existence and good-prime compatibility of these representations in their characteristic-zero form #cite(label("Deligne1969")) §3, (3.9)–(3.12), and Theorem 4.9, and local-global compatibility #cite(label("Carayol1986")) Theorem (A), §0.7. We take the contragredients of the cohomological representations in these references, so arithmetic Frobenius has trace $a_q$ and determinant $q$ times the diamond eigenvalue.

Here is a precise integral framework for the reductions that follow. Take the finite-dimensional sum of these characteristic-zero systems, retaining their multiplicity spaces, that contains the vector under consideration and its diamond transforms. Its integral Fourier lattice is finite over $cal(O)$: finitely many coefficients already give an injective map of this space, and the lattice embeds in the corresponding finite free $cal(O)$-module. Good Hecke operators preserve integral expansions. Diamonds do so as well. For the subtracted vector this last claim follows from the formula

$ chevron.l u chevron.r H_U = psi_U \( u \) H_U + 1 / 2 sum_J B_U \[ J \] #scale(x: 120%, y: 120%)[\(] psi_U \( u \) - eta \( u \) chi_(- 4) \( u \)^i \( - J \/ u \) #scale(x: 120%, y: 120%)[\)] Theta_J : $

each parenthesis is zero or twice a unit. The same observation applies after multiplying by $theta$.

Traces at arbitrary Galois elements are limits of good Frobenius traces on this finite lattice. Indeed, continuity gives a common finite quotient at any prescribed accuracy, and Chebotarev gives a good prime in each required conjugacy class. Its size is unrestricted, and it may avoid any specified finite list of indices and primes. This proves integrality of all the traces and determinants used below, not only of the good Hecke operators with which the construction began.

Let $cal(T)$ be the resulting commutative operator algebra on the reduced orbit of the vector. Equality means equality of every Fourier coefficient after any further indicated operator products. We retain this algebra, including its possible nilpotents.

#thm([Lemma 5.3.])[
  (Trace identities and fresh-prime tests).  #emph[ In this reduced operator algebra, 
#[#set math.equation(numbering: n => "(5.6)")
 $ d \( u \) t \( v \) = t \( v \) \, #h(2em) t \( u \) t \( v \) = t \( u v \) + t \( u v^(- 1) \) \, #h(2em) t \( 1 \) = 0 . $ <tc:trace-identities>]

 A coefficient of a product of traces can be tested by replacing its arguments with Frobenius elements at distinct fresh primes avoiding the coefficient index. If the index is $n$ and those primes are $q_1 \, dots.h \, q_a$, the test is the reduced coefficient at $n q_1 dots.h.c q_a$. Determinants may be applied first.]
] <tc:trace-algebra>

#proof[
  For a weight-two form $f$, the good-prime formula is
  $ \( T_q f \) \[ n \] = f \[ q n \] + q \( chevron.l q chevron.r f \) \[ n \/ q \] . $
  When $q divides.not n$ the second term is absent. Choosing the successive test primes distinct and avoiding $n$ proves the coefficient assertion. Chebotarev and continuity, on the finite lattice just described, allow these choices for arbitrary trace arguments at any required accuracy.
  All the diamond characters are of $2$-power order. On a form with one character its determinant therefore reduces to the identity. For a subtracted vector the displayed diamond formula leaves, in addition, only unary contributions $Theta_J theta$. A fresh trace kills each such contribution modulo $frak(m)$: its coefficient test has index $n q$ with $q divides.not n J$, and cannot have the squarefree part $J$. The same argument applies after any further tests. This proves $d \( u \) t \( v \) = t \( v \)$.
  For two invertible $2$-by-$2$ matrices the characteristic-zero identity is
  $ "tr" \( A \) "tr" \( B \) = "tr" \( A B \) + det \( B \) "tr" \( A B^(- 1) \) . $
  Apply it to every characteristic-zero system and use the determinant identity just proved. Finally, $t \( 1 \) = 2$ before reduction. ◻
]

The bounds of Lemma 20 are particularly well suited to these tests: an added prime contributes its nonnegative weight, and additional root primes contribute no weight. A zero established by one of these bounds consequently remains zero after all the further tests used here. In the moving-precision case all the preceding constructions are made at the actual fixed level of the chosen stage. The required divisibility is uniform at the specified weight cutoff; continuity is used only in a finite-dimensional space at that stage.

The only level-prime identity we need is the following. We distinguish the weight-two operator $sans(U)_p^(\( 2 \))$ from the earlier half-integral-weight notation, although both extract $p$-multiples in their respective Fourier expansions.

#thm([Lemma 5.4.])[
  (Inertia and a level operator).  #emph[ For $p in U$, choose a place over $p$, an inertia element $tau_p$ on which the ramified quadratic character is $- 1$, and a corresponding arithmetic Frobenius lift $phi.alt_p$. On the characteristic-zero space under consideration, before reduction, one has 
#[#set math.equation(numbering: n => "(5.7)")
 $ sans(U)_p^(\( 2 \)) #scale(x: 120%, y: 120%)[\(] t \( g tau_p phi.alt_p \) - t \( g phi.alt_p \) #scale(x: 120%, y: 120%)[\)] = d \( phi.alt_p \) #scale(x: 120%, y: 120%)[\(] t \( g tau_p \) - t \( g \) #scale(x: 120%, y: 120%)[\)] . $ <tc:exact-level-identity>]

 The identity commutes with further good traces. After reduction it therefore evaluates a difference at coefficient $1$ by the corresponding difference at coefficient $p$.]
] <tc:inertia-identity>

#proof[
  At $p$ the summands in question are either old from a level omitting $p$, or have conductor exponent one and primitive ramified quadratic diamond character. For the former the representation is unramified, so both trace differences are zero, irrespective of the action of $sans(U)_p^(\( 2 \))$ on the old multiplicity space.
  For the latter, local-global compatibility identifies the local representation with a principal series with one unramified and one ramified character; its monodromy is zero. In a basis of these two lines write
  $ rho \( tau_p \) = mat(delim: "(", 1, 0; 0, - 1) \, #h(2em) rho \( phi.alt_p \) = mat(delim: "(", lambda, 0; 0, mu) . $
  The level eigenvalue is $lambda$, the Frobenius eigenvalue on the unramified line, and $d \( phi.alt_p \) = lambda mu$. If the lower-right entry of $rho \( g \)$ is $z$, the two trace differences are $- 2 z mu$ and $- 2 z$, respectively. Both sides of Equation (5.7) are $- 2 z lambda mu$. The Eisenstein calculation is the identical calculation on its pair of characters. Copies old at other primes do not change it.
  These are all the possibilities: the new level has exponent one at $p$, with ramified quadratic determinant, so the Steinberg case with unramified determinant does not enter. A unary summand with $p in.not J$ is old from a level omitting $p$; with $p in J$ it has the same ramified quadratic local character. Thus the preceding classification also covers Equation (5.5).
  Finally apply Equation (5.6) to remove the determinant from the right side after reduction. Taking coefficient $1$ on the left is taking coefficient $p$ before $sans(U)_p^(\( 2 \))$. ◻
]

=== 5.4 Rules when there is rational two-torsion <rules-when-there-is-rational-two-torsion>

We now apply the common trace identities to the rational-torsion case. The coefficient bounds first restrict the Galois data on which a symbol can depend. The level-prime identity then determines how the symbol changes when one of those data is varied.

An elementary extension of a number field means a compositum of quadratic extensions. Whenever a ramification support is specified, only extensions unramified outside that support are included. For finite support the resulting elementary extension is finite. Labels below are Frobenius specifications in these extensions, with a chosen place when an orientation over $F$ is needed. They always include the fixed rational local conditions that specify the filter.

#thm([Proposition 5.5.])[
  (Rational trace and contraction rules).  #emph[Suppose $E \( bb(Q) \) \[ 2 \] eq.not 0$.]
  + #emph[For matching $U$, on the subtracted vector $H_U$, 
$ t \( g \) t \( u \) = 0 quad \( u upright(" split") \) . $

 The trace on split elements factors through the elementary extension of $F$ supported on $S union U$. For opposite $U$, on $B_U$, every product of two traces is zero, and traces factor through the rational elementary extension supported there.]
  + #emph[If $U union { q }$ has the parity of the filter, its symbol is read at coefficient $1$ by $t \( "Fr"_q \)$ on $H_U$ for split $q$, and on $B_U$ for simple $q$.]
  + #emph[Fix $p in U$ and put $g = "Fr"_q$. Replacing $g$ by $g tau_p$ changes the symbol, additively in $upright(bold(F))_2$, by 
#[#set math.equation(numbering: n => "(5.8)")
 $ A #scale(x: 120%, y: 120%)[\(] \( U \/ p \) union { q' } #scale(x: 120%, y: 120%)[\)] \, #h(2em) "Fr"_(q') tilde.op g phi.alt_p \, $ <tc:rational-contraction>]

 if $p$ and $q$ are not both simple. The label of $q'$ is required only away from the omitted primes and carries their product labels. The replacement uses the original source with level support $S union \( U \/ p \)$: the #emph[whole rational prime] $p$ is omitted, including both places over it if $p$ splits in $F$. If both endpoints are simple, the change is zero.]
  + #emph[A split vertex with trivial label relative to the level with that vertex omitted has symbol zero.]
] <tc:rational-rules>

#proof[
  For matching $U$, two fresh tests, one of them split, add weight at least $3 \/ 2$ to Equation (5.3). The allowed valuation is integral, so the numerator has valuation at least $2$. After the division in Equation (5.5) it still vanishes modulo $frak(m)$; fresh tests kill its unary terms. For opposite $U$, two nonroot tests add weight at least $1$, leaving at least $1 \/ 2$ after subtracting $e_U$, and hence at least $1$ at an allowed coefficient. This proves the two product vanishings on the entire reduced orbit.
  The trace identities show why these vanishings give the stated elementary quotients. If $u$ is split, apply the identity to $t \( g u \) t \( u \)$ to obtain $t \( g u^2 \) = t \( g \)$. The subgroup generated by squares in $G_F$ has elementary quotient, since a group of exponent two is abelian. In the opposite case the same calculation applies to every $u in G_(bb(Q))$. Ramification outside the level is absent from the characteristic-zero representations and remains absent in the quotient.
  For a split $q$, its added weight is $1$: at coefficient $q$ the division by $2$ in $H_U$ places the coefficient exactly at the normalized detection depth. There is no unary term at that index. For simple $q$, $e_U = 1 \/ 2$ already gives that depth on $B_U$. The character phases reduce to $1$, proving (ii).
  For (iii), apply Lemma 23 at coefficient $1$, so that its left side is a coefficient-$p$ test. Replace its trace arguments by fresh primes with Frobenius $g tau_p phi.alt_p$ and $g phi.alt_p$. Put $V = U \/ p$. For $X = U \, V$, set $n_X = ceil.l delta + w \( X \) ceil.r$ and let $m_X$ be one in matching parity and zero otherwise. After a fresh trace kills the unary terms, the shell multiplier relative to the omitted-source test is
  $ 2^(1 + n_V - n_U - m_U + m_V) c_p \( D' \) \, #h(2em) D' = V q' \, quad "Fr"_(q') tilde.op g phi.alt_p . $
  The exponent is zero for split $p$, and also for simple $p$ with matching $U$. It is one for simple $p$ with opposite $U$, precisely the simple–simple case. This checks all integer divisions in the contraction rule. For simple $p$ only the first shell is used. The change $psi_U \/ psi_V = \( p \/ dot.op \)$ is already included in that shell calculation; all remaining phases reduce to one.
  In the first three cases the shell is therefore $c_p \( D' \) A \( D' \)$. Both fresh Frobenius elements have the same image in the omitted source: that source is built from the original modular form, the same $eta \, psi \, delta$, and the operators at $V$, so it is unramified at the entire rational prime $p$. Inertia at either place over $p$ acts trivially on its symbol. The ramified quadratic coordinate of $tau_p$ reverses the Legendre sign in $c_p$, whose additive change is one. The difference of the two shell values is consequently $A \( D' \)$, proving Equation (5.8).
  If both primes are simple, their residual images are the same transposition, so $g phi.alt_p$ is split. The shell now has positive valuation after normalization and contributes zero. Finally (iv) is (ii) with $t \( "Fr"_q \) = t \( 1 \) = 0$ in the relevant elementary quotient. ◻
]

The contraction rules control changes in existing vertices. The next calculation gives a way to add two simple vertices while preserving the symbol.

#thm([Proposition 5.6.])[
  (Insertion of a pair of simple primes).  #emph[Suppose $E \( bb(Q) \) \[ 2 \] eq.not 0$ and $U$ has matching parity. Let a rational elementary label, relative to $S$ and all existing split vertices, be realized by a simple prime $q$ with 
$ \# E \( upright(bold(F))_q \) equiv 2 med \( mod med 4 \) . $

 Inserting two fresh simple primes with this same label leaves $A \( U \)$ unchanged. Their mutual simple-edge label, and their labels against other simple vertices, do not affect this assertion.]
] <tc:simple-twins>

#proof[
  First test $t \( "Fr"_q \)^2$ on matching $H_U$. The weight-two Hecke formula at coefficient $1$ gives, after reduction,
  $ H_U \[ q^2 \] + q \( chevron.l q chevron.r H_U \) \[ 1 \] . $
  Only the $J = 1$ unary term can contribute at $1$ or $q^2$. Write $b = B_U \[ 1 \]$, $epsilon.alt = chi_(- 4) \( q \)$, and $kappa = \( psi_U \/ eta \) \( q \)$. Substituting Equation (5.2) and the two characters in Equation (5.5), the preceding expression is the reduction of
  #[#set math.equation(numbering: n => "(5.9)")
   $ b thin frac(eta \( q \), 2) (a_q \( E \) + kappa \( q - epsilon.alt \) - q epsilon.alt^i \( 1 + epsilon.alt \)) . $ <tc:twin-calculation>]
  For $q equiv 3 med \( mod med 4 \)$ the parenthesis divided by $2$ is $a_q \( E \) \/ 2$ modulo $2$. For $q equiv 1 med \( mod med 4 \)$ it is $a_q \( E \) \/ 2 + 1$. In either case it equals $\( q + 1 - a_q \( E \) \) \/ 2 = \# E \( upright(bold(F))_q \) \/ 2$ modulo $2$. Since $b$ reduces to $A \( U \)$, this proves that the squared trace has coefficient $\( \# E \( upright(bold(F))_q \) \/ 2 \) A \( U \)$.
  By Lemma 22, replace the two copies of this trace by distinct fresh primes realizing the same operator tests. Their product coefficient reads the symbol with the two primes inserted. To pass to any other pair with the labels in the statement, vary one prime at a time. After omitting that simple prime the opposite-parity test of Proposition 24 depends only on rational elementary labels. Its changes against other simple primes are zero by the simple–simple case of the same proposition. Thus only the fixed support and existing split labels need be matched. Fresh intermediate primes can match both old and new finite specifications, so that no collision of vertices is required. The assumed odd value of $\# E \( upright(bold(F))_q \) \/ 2$ completes the proof. ◻
]

=== 5.5 An elementary character on root elements <an-elementary-character-on-root-elements>

Assume now that $E \[ 2 \]$ is irreducible. Its image is either cyclic of order three or $S_3$. The reduced trace algebra need not be a field: the order-two units below can have nontrivial nilpotent parts. We therefore retain the algebra, rather than replacing it by its residue field.

#thm([Lemma 5.7.])[
  (Root character).  #emph[On matching $B_U$ one has $t \( u \) = 0$ for every nonroot $u$. On opposite $B_U$ one has $t \( u \) = 0$ for split $u$ and $t \( g \) t \( u \) = 0$ for two simple elements. In either parity, 
$ t \( u \)^2 = 1 quad \( u upright(" a root") \) . $

 The traces factor through an extension of $"Gal" \( F \/ bb(Q) \)$ by an elementary kernel over $F$. Moreover, there is a multiplicative character $alpha : G_(bb(Q)) arrow.r cal(T)^times$ into the reduced trace algebra, unramified outside $S union U$, such that 
$ alpha \( u \)^2 = 1 quad upright("for all ") u \, #h(2em) t \( u \) = alpha \( u \) quad \( u upright(" a root") \) . $

 In particular $alpha$ factors through a rational elementary extension with that ramification support.]
] <tc:root-character>

#proof[
  The trace vanishings follow from Equation (5.3). In matching parity, one nonroot test adds at least $1 \/ 2$ and hence gives an integral valuation at least $1$. In opposite parity, either a split test or two simple tests add at least $1$, again leaving positive integral valuation after the loss $e_U = 1 \/ 2$.
  For a root test, use the same fresh prime $q$ twice, avoiding the coefficient index, rather than two distinct primes. The weight-two Hecke formula and Equation (5.2) give the identity operator modulo $frak(m)$: $a_q \( E \)$ is odd, and the middle quadratic-character term cancels the diamond term modulo $2$. This proves $t \( u \)^2 = 1$ by continuity for every root $u$. For completeness, it suffices to check indices prime to the chosen $q$; each particular index permits such a choice of $q$ with the prescribed finite trace data.
  Since split traces vanish in both parities, $t \( g u^2 \) = t \( g \)$ for $u in G_F$. Thus the traces factor through the quotient by the squares of $G_F$. At any fixed accuracy the trace action is on a finite lattice modulo $frak(m)$, so we may work in a finite quotient
  $ 1 arrow.r H arrow.r Gamma arrow.r "Gal" \( F \/ bb(Q) \) arrow.r 1 $
  with $H$ elementary abelian. Choose an order-three lift $R$ of a rotation. Such a lift exists because the inverse image of the order-three subgroup is an extension by a finite $2$-group. The trace identity with the identity element gives $t \( R \) = t \( R^(- 1) \) = t \( R^2 \)$. Applying it to $R \, R^2$ gives $t \( R \) t \( R^2 \) = t \( 1 \) + t \( R^(- 1) \) = t \( R \)$; the left side is $1$. Hence
  $ t \( R \) = t \( R^2 \) = 1 . $
  For $a in H$ set
  $ alpha \( a \) = t \( a R \) = t \( a R^2 \) . $
  The equality follows from $t \( a \) = 0$ and the trace identity with $R$. Conjugacy invariance by an element $b in H$ implies that $alpha$ is unchanged on multiplying its argument by $b R \( b \)^(- 1)$. It therefore factors through the coinvariants $H \/ \[ H \, R \]$. Also it is invariant under conjugation by $R$. The trace product now gives
  $ alpha \( a \) alpha \( b \) = t \( a R \) t \( b R \) = t #scale(x: 120%, y: 120%)[\(] a R \( b \) R^2 #scale(x: 120%, y: 120%)[\)] + t \( a b^(- 1) \) = alpha #scale(x: 120%, y: 120%)[\(] a R \( b \) #scale(x: 120%, y: 120%)[\)] = alpha \( a b \) . $
  The last equality uses the coinvariant invariance just proved; the split term is zero. Since $a R$ is a root, $alpha \( a \)^2 = 1$.
  For cyclic residual image, this already extends to $Gamma$ by setting $alpha \( R \) = 1$. For $S_3$, choose a transposition lift $s$ normalizing $chevron.l R chevron.r$. It can be obtained from any transposition lift by conjugating its order-three complement by an element of $H$. Thus $s R s^(- 1) = R^(- 1)$ and $s^2 in H$. Conjugacy of traces shows that $alpha$ on $H$ is invariant under $s$. In both parities we have $t \( s \) t \( s R \) = 0$, either because each factor is zero or by the two-simple product rule. Its trace identity reads
  $ 0 = alpha \( s^2 \) + t \( R \) = alpha \( s^2 \) + 1 . $
  Therefore the extension defined by $alpha \( s \) = 1$ respects the relation for $s^2$, as well as conjugation and the relations in $chevron.l R chevron.r$. It is the required multiplicative order-two character, and agrees with the trace on both root cosets. At the fixed stage, choose one common finite quotient through which the traces and residual representation factor, and pull back the character constructed there. No canonical choice across quotients is needed. Unramifiedness outside the level is preserved. ◻
]

=== 5.6 Irreducible deletion rules and minimal labels <irreducible-deletion-rules-and-minimal-labels>

The root character replaces products of root traces by a single multiplicative value. We now combine that fact with the level-prime identity to compute changes at nonroot vertices. The last lemma applies these rules at the least weight where a symbol is nonzero.

The #emph[total root label] is the product of the rational elementary labels of all root primes being used. It includes the fixed-support conditions and the rational quadratic labels against the active nonroot vertices. Its discriminant coordinate is trivial in the quadratic quotient of $S_3$; for cyclic residual image there is no such coordinate.

#thm([Proposition 5.8.])[
  (Irreducible substitution rules).  #emph[Suppose $E \[ 2 \]$ is irreducible.]
  + #emph[On matching $B_U$, coefficient $1$ of a product of root traces reads $A$ on the union of $U$ and those roots. It depends on the roots only through their total rational elementary label relative to $S union U$. Any finite collection of roots, including the empty collection, may be replaced in this test by one virtual root with that label.]
  + #emph[Changing the Legendre bit of that root against a split vertex $p$ has additive derivative equal to deletion of $p$, with its rational labels away from $p$ transferred to the total root label. Changing the root bit against a simple vertex has derivative zero.]
  + #emph[To vary a simple vertex $q$, omit it and use opposite $B_V$, retaining the other root probes. At another simple vertex $p$, choose Frobenius lifts $g$ and $phi.alt_p$ for $q$ and $p$. If their transposition images are different, the derivative under $g mapsto g tau_p$ deletes both $p$ and $q$ and transfers their rational labels to the root total. If their transposition images are equal, the derivative is zero.]
  + #emph[In the test in (iii), variation at a split $p$ is given by the first-shell factors $c_p$ times symbols of merged configurations whose weight is one less. It consequently vanishes whenever all symbols of that lower weight vanish.]
  #emph[All these assertions preserve every specified label at the other vertices, and use the chosen place for inertia and Frobenius.]
] <tc:irreducible-rules>

#proof[
  Root primes have weight zero. Thus the fresh-prime tests at coefficient $1$ of matching $B_U$ are precisely the normalized coefficients defining $A$. Lemma 26 makes the product of root traces equal to the value of $alpha$ on their total elementary label. A rotation survives every compatible elementary specification: an elementary quotient cannot eliminate the order-three subgroup, and in the $S_3$ case the only compatibility condition is its trivial image in the quadratic quotient. Chebotarev therefore supplies the claimed single virtual root, even for the empty total label.
  For (ii), apply Lemma 23 with $g$ a root. If $p$ is split then $g phi.alt_p$ is a root. The coefficient with $J = { p }$ has zero cost in Equation (5.3); its first shell is $c_p$ times the symbol with $p$ deleted. The latter is unramified at $p$ and is the same in the two tests, while $c_p$ changes by $1$. Multiplication of Frobenius labels by $phi.alt_p$ is exactly the transfer of the deleted vertex’s rational labels to the root. If $p$ is simple, $g phi.alt_p$ is simple, and its weight $1 \/ 2$ plus the $1 \/ 2$ contributed by $J$ puts the shell above the testing depth. The derivative is then zero.
  For (iii), $e_V = 1 \/ 2$. When the two transpositions differ, $g phi.alt_p$ is a rotation, and the $1 \/ 2$ contribution from the simple prime in $J = { p }$ exactly cancels $e_V$. The shell again equals $c_p$ times the omitted-$p$ symbol, now with both simple vertices removed and their product represented by a root. The Legendre flip proves the asserted derivative. For equal transpositions their product is split; its additional weight $1$ forces the shell to vanish.
  Finally, if $p$ is split and $g$ simple, then $g phi.alt_p$ is simple. The $p$-shell is at the first-shell depth and is expressed by Equation (5.4) with $D' = \( V \/ p \) q'$ and the retained root probes. Its nonroot weight is
  $ w \( V \) - 1 + 1 / 2 = (w \( V \) + 1 / 2) - 1 . $
  This is one less than the original weight. In particular both shell terms vanish when symbols of that weight vanish. The comparison omitting $p$ is unramified there. Root probes can be matched on the rational elementary support throughout, which proves the final label assertion as well. ◻
]

At the least nonzero weight, every lower-weight term in the preceding rules vanishes. This removes the dependence on internal edge labels; the remaining assertion keeps both the fixed-support labels and the total root label.

#thm([Lemma 5.9.])[
  (Transfer at the least nonzero weight).  #emph[Suppose $E \[ 2 \]$ is irreducible, and let $m$ be the least weight of an index on the filter with nonzero symbol. At weight $m$, the dependence on each nonroot vertex is only through its oriented rational Frobenius lift in the Galois group over $bb(Q)$ of the maximal elementary extension of $F$ unramified outside $S$, together with the requirement on the total root label. In particular, replacing the nonroot vertices by fresh vertices with those same fixed-support labels preserves the symbol, irrespective of their internal edge labels, provided the root total is matched. The assertion allows simultaneous changes using disjoint intermediate configurations.]
] <tc:minimum-transfer>

#proof[
  Every symbol of weight less than $m$ is zero. For a simple vertex, Proposition 27 therefore makes its inertia derivatives at every other active nonroot vertex zero: different transpositions give a lower-weight deletion, equal transpositions give zero directly, and a split vertex gives a lower-weight merged configuration. Its labels against root vertices are immaterial by the simple case of the root derivative rule. These statements hold for conjugates of inertia too, because the Frobenius and inertia calculation is made at a chosen place and may be conjugated. Starting with the elementary extension over $F$ supported on $S union V$, killing the inertia at the active vertices leaves exactly fixed-support elementary labels. This proves the assertion for a simple vertex.
  For a split vertex $q$, let $V$ be the other nonroot vertices, so $w \( V \) = m - 1$ and $V$ still has matching parity. We first claim that $B_V$ is divisible by $2$ integrally. In Equation (5.3), an entry of cost zero has $r$ consisting only of roots and $J$ consisting only of split primes. Its underlying squarefree class has weight
  $ w \( V \) - \# J < m . $
  Its symbol is zero. The shell formula at every split prime, valid at all exponents, therefore adds one more factor of $2$ to the normalized coefficient. All other allowed entries already have positive integral cost. This proves the claim, including at arbitrarily large coefficient indices.
  Use now $H_V = B_V \/ 2$. Two split traces give zero on $H_V$: their added weight $2$ in Equation (5.3) still leaves one factor of $2$ after this division. The trace restricted to split elements consequently factors through the elementary kernel over $F$, by the same square-invariance argument as before. Coefficient $1$ with the new split trace and the retained root probes reads the symbol at weight $m$.
  Apply Lemma 23 at $p in V$ to this divided vector. The element $g phi.alt_p$ has the type of $p$, because $g$ is split. Its $p$-shell is $c_p$ times a symbol of weight $m - 1$, whether $p$ is split or simple; for a simple $p$ only the first shell is used. For a simple $p$ the normalization can be checked directly: $J = { p }$ and the new simple probe contribute $1 \/ 2 + 1 \/ 2 = 1$ to Equation (5.3). Writing $n_V = delta + w \( V \)$, the divided shell is
  $ frac(2 c_p \( D' \) a \( D' \), 2^(n_V + 1)) = c_p \( D' \) frac(a \( D' \), 2^(n_V)) \, #h(2em) w \( D' \) = w \( V \) = m - 1 . $
  The omitted set $V \/ p$ has opposite parity, but its ceiling normalization is still $n_V$. Thus this is exactly its unit-symbol test, with no fractional loss. Both compared values are zero. Every such inertia derivative therefore vanishes, leaving only the fixed-support elementary label.
  No character $alpha$ on this further divided vector is needed. Use actual matched root probes in both tests. At weight $m$, their changes against a split vertex are already zero by the split root-deletion rule, because its deletion has weight $m - 1$. They can therefore be matched while the nonroot vertex is moved. Moving vertices successively, using fresh intermediate copies when necessary, proves the joint assertion without imposing old internal edge labels.
  For a moving coefficient system, minimality is used on a fixed bounded weight range. A failure of the required lower-weight vanishing on an ultrafilter-large set of stages would give a bounded-weight sequence contradicting the stabilized minimum. Choose the actual stage as in Lemma 20, with the additional division by $2$ included among its fixed division bounds. Its coarse estimate controls all larger weights, and its integral square-index recurrences control every shell. Thus the preceding coefficientwise arguments apply to the actual forms at that stage. The argument does not require $m$ to be integral. ◻
]

=== 5.7 Summary and finite realization <summary-and-finite-realization>

We collect the rules in the form used to construct finite prime arrays. The analytic meaning of a nonzero symbol is unchanged; this section has established which substitutions preserve it or compute its change.

#thm([Theorem 5.10.])[
  (Symbol rules).  #emph[ For either coefficient source of Propositions 16 and 17, assume its stated coefficient lower bound and use its normalized symbol and filter. Then the following rules hold for finite configurations of primes outside the level support.]
  + #emph[With rational two-torsion, the elementary-label factorizations, contraction except in the simple–simple case, and isolation by a trivial split label are those of Proposition 24. A pair of identical simple labels realized with $\# E \( upright(bold(F))_q \) \/ 2$ odd can be inserted without changing the symbol, as in Proposition 25.]
  + #emph[With irreducible $E \[ 2 \]$, all root probes combine into one total rational elementary label. A root-bit derivative at a split vertex deletes that vertex, while at a simple vertex it is zero. The derivative between two simple vertices deletes both when their transposition images are different, and is zero when they are equal. The remaining simple–split shell has weight one less. These are the rules of Proposition 27.]
  + #emph[At the least weight supporting a nonzero symbol in the irreducible case, each nonroot may be moved with only its fixed-support elementary Frobenius label prescribed; internal edges impose no further condition on the value, subject to matching the total root label. This is Lemma 28.]
  #emph[The analytic and finite-Selmer consequences of a nonzero symbol remain those of Proposition 19. In the odd source the rules mean finite tests at arbitrarily high stages chosen in the ultrafilter-large sets of the prescribed stabilization.]
] <thm:symbol-rules>

#proof[
  The preceding propositions prove the assertions. For one application, put the finitely many Galois modules and operator tests in a common finite quotient at the required precision. Chebotarev then gives simultaneously fresh Frobenius representatives. The omitted source is unramified at the whole omitted prime, whereas its ramified rational quadratic coordinate is exactly the Legendre flip in the shell formula. These are therefore substitutions with all other labels held fixed.
  The arithmetic compatibility of an entire array is addressed in the following sections. The present assertions concern each finite array; in the odd case choose a sufficiently high actual stage in the required ultrafilter-large intersection. Arbitrarily many weight-zero roots cause no additional depth loss, because the coefficient bound is uniform at a fixed weight and their traces combine through one total elementary label. ◻
]

== 6 Prime graphs and simultaneous unit coefficients <gr:section>

The coefficient symbols will now be regarded as functions of finitely many quadratic residue bits. We first identify the arithmetic data that those bits record and explain how the trace calculation becomes a finite difference. This gives polynomials whose derivatives contract prime labels. We then adjoin auxiliary vertices so that one or two nonzero coefficient polynomials take the value $1$ at every nonzero address of a binary cube.

The two-polynomial case is needed for the odd converse: the odd symbol tests $h$, while an even symbol tests a quadratic companion $k h$. Separate nonzero polynomials need not have a common unit evaluation; for example, $z$ and $1 + z$ do not. The auxiliary vertices change the polynomials by controlled contraction operators. The arithmetic input is the rational contraction and isolation rules of Theorem 29, including omission of an entire rational prime. The same argument applies to any coefficient test with these rules, such as the restricted even test constructed in Section 7.5.

Encoding quadratic residue symbols by graphs has a precedent in the congruent-number problem: Feng–Xiong express descent conditions through prime graphs and the ranks of their binary Laplacians #cite(label("FengXiong2004")) §2, Definitions 2.1 and 2.3 and Lemma 2.2. Here the graphs record coefficient-symbol rules, and their oriented contractions produce simultaneous unit values.

=== 6.1 Prime labels and their realization <prime-labels-and-their-realization>

Let $F$ be $upright(bold(Q))$ or a quadratic field. The applications use $F = upright(bold(Q)) \( E \[ 2 \] \)$ when this field is quadratic, and also an auxiliary quadratic field when $E \[ 2 \]$ is rational. Fix a finite set $S$ of rational primes containing $2$ and the ramification support of the fixed data. Enlarge $S$ so that prime ideals above it generate the class group of $F$, and let $S_F$ include these places and the infinite places. Set

$ V_S \( F \) = { alpha in F^times \/ F^(times 2) : v_(frak(p)) \( alpha \) equiv 0 med \( mod med 2 \) upright(" for ") frak(p) in.not S_F } . $

The valuation sequence expresses this as an extension of the squareclasses of $S_F$-units by a subgroup of the $2$-torsion of the $S_F$-class group; in particular, it is finite-dimensional over $upright(bold(F))_2$ #cite(label("MilneANT2020")) Theorems 4.4 and 5.11. Write $F_S^(\( 2 \)) = F \( sqrt(V_S \( F \)) \)$.

A #emph[split vertex] is a rational prime $p in.not S$ split in $F$, with an #emph[orientation] $frak(p) divides p$ when $F$ is quadratic. Choose a generator $pi_(frak(p))$ whose divisor outside $S_F$ is $frak(p)$; this is possible by the class-group condition. Use its conjugate for the other orientation. Then

#[#set math.equation(numbering: n => "(6.1)")
 $ N_(F \/ upright(bold(Q))) \( pi_(frak(p)) \) = p u_(frak(p)) \, #h(2em) u_(frak(p)) upright(" a signed rational ") S upright("-unit") . $ <gr:norm>]

For $F = upright(bold(Q))$, use the generator $p$. In the quadratic case an inert rational prime is a #emph[simple vertex], with rational generator $p$. A split vertex has its fixed Frobenius label on $F_S^(\( 2 \))$; a simple vertex has rational fixed-support labels. A #emph[type] may also specify local squareclasses, support valuation parities, real signs, and finite ray conditions on its generator. Prescribed types must be compatible and individually realizable. A #emph[filter] fixes the total rational labels and sign of the signed-prime product, where $p^(*) = \( - 1 \/ p \) p$.

Write quadratic residue symbols additively in $upright(bold(F))_2$. Between two split vertices in the quadratic case there are two independent forward bits: the residues of $pi_(frak(p))$ and $overline(pi_(frak(p)))$ at the chosen place of the other vertex. Hilbert reciprocity and the types determine the reverse bits. Their sum, with the fixed correction in (6.1), gives the rational norm bit. If an endpoint is simple, or if $F = upright(bold(Q))$, there is one rational forward bit. Vertices, types, and these bits form an #emph[arithmetic graph]; there is no self-residue datum.

For the coefficient symbols, the vertices are the prime factors of the Fourier index. Their types fix the support and elementary Frobenius conditions, while the edge bits record the remaining quadratic residue tests. Varying an edge leaves those types and the total filter unchanged. The next calculation explains the resulting contraction rule.

For the standard rational-two-torsion symbol of Proposition 24, take split primes $p \, q$ and let $U$ contain $p$ but not $q$, with matching parity. Write $V = U \/ p$ and $g = "Fr"_q$. By Proposition 24,

$ A \( U q \) = #scale(x: 120%, y: 120%)[\[] t \( g \) H_U #scale(x: 120%, y: 120%)[\]] \[ 1 \] . $

Changing one residue bit from $p$ to $q$ replaces $g$ by $g tau_p$, where $tau_p$ is the corresponding inertia element. The level identity (5.7) moves the difference to the coefficient at $p$. Its two first-shell values are

$ c_p \( D' \) A \( D' \) \, #h(2em) \( c_p \( D' \) + 1 \) A \( D' \) \, #h(2em) D' = V q' \, quad "Fr"_(q') tilde.op g phi.alt_p . $

The omitted source is unramified at the whole prime $p$, so its value $A \( D' \)$ is the same in the two terms. Their sum is $A \( D' \)$. Thus, if $z$ is the changed edge bit,

#[#set math.equation(numbering: n => "(6.2)")
 $ A \|_(z = 0) + A \|_(z = 1) = A \( V q' \) . $ <gr:first-contraction>]

Here $q'$ is a fresh prime carrying the product labels of $p$ and $q$; it replaces two vertices by one. Its integer value is not the product $p q$.

In the quadratic field, the two choices of oriented bit correspond to using $pi_(frak(p)) pi_(frak(q))$ or $pi_(frak(p)) overline(pi_(frak(q)))$ as a product template, up to the choice of output orientation. The template adds the support labels and the external residue bits in the indicated orientations. There is no internal residue attached to the new vertex. Omitting $p$ removes both places above that rational prime from the source, so a second difference in the other oriented bit gives zero. Split–simple contraction has the same interpretation with rational product data; a simple–simple difference is zero.

To use these formulas on arbitrary arrays of bits, we must know that the arrays and the product templates have prime representatives, and that different representatives give the same symbol. The following lemma supplies both facts.

#thm([Lemma 6.1.])[
  (Finite realization and product labels).  #emph[Fix finitely many old vertices and individually realizable new types. Every choice of independent forward bits is realized by distinct fresh primes, avoiding any given finite set. Further fixed local tests may be included in $S$.]
  #emph[A split cluster may be represented by the product of its oriented generators, with conjugations prescribed along a contraction tree; its support types and external bits are the corresponding sums. A cluster containing one simple vertex has the corresponding rational product data. These products may be replaced by fresh prime representatives. For a symbol satisfying the omitted-vertex dependence of Theorem 29, the graph data determine its value, and these replacements preserve the contracted symbol.]
] <gr:realization>

#proof[
  The displayed generators account for every relevant radical. Let $U$ be a finite set of new rational primes and $U_F$ the places above them. From a squareclass with even valuations outside $S_F union U_F$ subtract the generators at the primes of $U_F$ where its valuation is odd. The remainder lies in $V_S \( F \)$. At an inert prime its rational generator has valuation one at the unique place of $F$. Thus the fixed labels and residue bits determine every elementary Frobenius test with this ramification support.
  For a new split vertex, start with a template $pi_0$ of its type, at a prime ideal $frak(p)_0$ away from the old vertices. Weak approximation gives $a in F^times$ sufficiently close to $1$ at $S_F$, positive at the specified real places, and with residues at the old prime ideals chosen so that $a pi_0$ has the prescribed quadratic residues. Use a ray modulus containing deep enough powers of $S_F$, all old prime ideals, and the real places. A prime ideal $frak(q)$ in the ray class of $\( a \) frak(p)_0$ satisfies
  $ frak(q) = \( a b \) frak(p)_0 \, #h(2em) b equiv 1 med \( mod med upright("ray modulus") \) . $
  Then $a b pi_0$ has the desired divisor and type. The prime ideals in this ray class have positive Dirichlet density #cite(label("MilneCFT2020")) Chapter V, Theorem 2.5. For $s > 1$, the sum of $\( N frak(q) \)^(- s)$ over prime ideals of residue degree greater than one is at most $2 sum_p p^(- 2 s)$, which stays bounded as $s arrow.b 1$. The corresponding sum over the ray class diverges. Hence that class contains infinitely many degree-one primes. Outside the fixed ramification support these give split rational primes, and finite exclusions remove finitely many choices.
  At an old inert prime, prescribe instead the norm of the residue in $upright(bold(F))_(p^2)^times$. Its norm onto $upright(bold(F))_p^times$ is surjective. For a new simple vertex all conditions are rational congruences, including the inert class in $F$; the Chinese remainder theorem and Dirichlet’s theorem apply. Successive selection realizes the whole graph. Reciprocity determines reverse bits, since the support Hilbert symbols are fixed and only the two endpoint residues remain. Taking norms gives (6.1), with no extra independent condition.
  The same construction applies to a product template. It preserves its support data and its residues at every remaining vertex; no internal residue is imposed on the replacement. For a simple cluster use rational congruences for the norm labels. To check the rational filter in a split cluster, write $pi = product_i pi_i$ and $pi' = a b pi$ for its replacement. The multiplier $a b$ is a square unit at $S_F$ and positive at real places. Consequently
  $ N pi = \( product_i p_i \) u \, #h(2em) N pi' = q u $
  have the same signed rational $S$-unit $u$: its valuations and sign agree. Thus $q \/ product_i p_i = N \( a b \)$ is locally square at the rational support. The condition at $2$ also identifies $q^(*)$ with $product_i p_i^(*)$ in the fixed tests. This verifies preservation of the norm correction.
  Finally, compare two disjoint realizations of the same graph. Insert fresh bridge vertices with matching bits to both realizations and replace vertices one at a time. The omitted-vertex Frobenius tests agree by the radical description above, so the symbol values agree. A preliminary bridge removes any overlap. This proves both graph dependence and invariance under the product replacements. ◻
]

Consequently, fixing the vertex types gives a well-defined function $A_(cal(G))$ of the independent forward edge bits: choose any prime realization of the graph $cal(G)$ and evaluate its coefficient symbol. Lemma 30 makes the result independent of that choice. We will write its unique multilinear polynomial as $P$. Equation (6.2) says that a derivative of $P$ evaluates the contracted graph.

A split vertex is #emph[primary] if its generator is a square unit at every finite place of $S_F$ and positive at every real place. The principal ray class realizes such types. Reciprocity makes their fixed radical labels trivial, and their signed rational contributions are squares in the fixed tests. Including stationary vertex primes in those tests makes primary incidences to them neutral. Including the support of a quadratic discriminant $k$ ensures that every primary prime splits in $upright(bold(Q)) \( sqrt(k) \)$.

Two symbols may use different fixed-support tests or read only rational norm labels from this same graph. We call these #emph[compatible projections] when they forget fixed-label coordinates or take norm data, preserve primary vertices, and commute with the omitted-vertex product substitution. In the norm projection either oriented-bit toggle changes the rational bit once. Thus one physical edge difference induces the specified difference for each symbol; it need not give the same polynomial for both symbols.

#prodef([Definition 6.2.])[
  (Witnesses and permitted partitions).  A #emph[witness] is a finite graph with symbol $1$. A graph is #emph[partitionable] if it admits a partition into nonempty clusters, each containing at most one simple vertex, and oriented contraction trees whose contracted graph is a witness. The contraction trees are part of the data; this definition makes no assertion about a Selmer group.
] <gr:partitionable>

For a two-isogenous curve with quadratic field $F' = upright(bold(Q)) \( E' \[ 2 \] \)$, a simple vertex is #emph[good] if it is inert in both $F$ and $F'$. A #emph[donor] is split in $F$ and inert in $F'$. Attaching a donor turns a simple vertex split in $F'$ into a good one. These are conditions on finite labels; their supply will be established in the arithmetic application.

=== 6.2 Forests as finite-difference operators <forests-as-finite-difference-operators>

For an edge bit $z$, put $Delta_z f = f \|_(z = 0) + f \|_(z = 1)$. Every function on a finite binary cube has a unique multilinear polynomial over $upright(bold(F))_2$; $Delta_z$ is its formal derivative. Differences therefore commute and satisfy $Delta_z^2 = 0$.

#thm([Lemma 6.3.])[
  (Oriented forests).  #emph[Assume the contraction, isolation, and omitted-prime assertions of Theorem 29. Differentiation along a tree contracts it, adding product labels and external incidences; the result is zero if the tree contains two simple vertices. A collection of edge variables containing a cycle has zero derivative, including when its orientations are incompatible. The two oriented variables on one pair form a cycle of length two.]
] <gr:forest>

#proof[
  The one-edge rule is the symbol contraction identity, with product replacement supplied by Lemma 30. Induction contracts a tree: split–split mergers remain split, split–simple mergers remain simple, and merging two simple components gives zero. A root orientation determines all relative orientations along the tree. Its product template uses support types and external bits, not the differentiated internal bits.
  For the two variables on a split pair $p \, q$, differentiate first in one inertia bit over $p$. The resulting symbol omits the #emph[entire rational prime] $p$, so its elementary extension is unramified at both places over $p$. The derivative in the other oriented bit is zero. Repeated use of the same variable gives zero by $Delta_z^2 = 0$.
  For a longer cycle, contract a spanning path. The closing edge becomes internal to one cluster and changes neither its support label nor an incidence to a remaining vertex. The omitted-endpoint argument just given therefore kills its derivative. Conjugating the product only changes its orientation; it does not restore the omitted endpoint or create a self-residue.
  For example, after contracting aligned edge $12$, the two bits from its product to vertex $3$ are $t_0 = z_13^0 + z_23^0$ and $t_1 = z_13^1 + z_23^1$, up to fixed type corrections. An aligned edge $23$ differentiates $t_0$. The closing edge $31$ differentiates either $t_0$ again, giving zero, or $t_1$, giving the omitted-endpoint zero. Every longer cycle reduces to these cases. Further differences commute with this zero derivative. ◻
]

Call the original vertices #emph[terminals]; any stationary external vertices retain their types and incidences. Fix their vertex types and a realizable baseline graph. Write $z = \( z_e \)$ for the independent toggles of the terminal–terminal bits, and let $P \( z \)$ be the terminal symbol. A #emph[network] adjoins primary vertices and specified incidences involving them. It adds no terminal–terminal edge: the original bits $z$ remain parameters. All unspecified primary incidences are neutral. Within each network fix a consistent orientation at each terminal. Different networks may use different alignments.

Write $y = \( y_e \)$ for the bits on the added incidences, and let $f \( z \, y \)$ be the symbol of the enlarged graph. We shall express $f \( z \, upright(bold(1)) \)$ as a finite-difference operator applied to $P \( z \)$. The differences in $y$ first contract the added graph; the forest rule then expresses each surviving term as differences in the original variables $z$.

For example, join one primary vertex $r$ to two permitted terminals $a \, b$, in a fixed alignment. Expanding in its two added incidences gives four terms. The term with no difference is zero because $r$ is isolated. Each one-edge difference contracts $r$ onto one terminal and leaves the original symbol $P$, so these two terms cancel in $bb(F)_2$. The two-edge tree contracts the terminal pair and gives $Delta_(z_(a b)) P$. Thus this path acts exactly as the terminal difference $Delta_(z_(a b))$. The path has two added edges, but its operator has contraction degree one. In general, a component meeting $t$ terminals has terminal contraction degree $t - 1$.

The lowest two operator degrees can be read from a matrix. Index the internal primary vertices by $I$, let $e_(i j)$ be their internal edge bits, and let $c_a$ be the incidence column from them to terminal $a$. The grounded Laplacian is the symmetric matrix over $bb(F)_2$ with

$ Q_(i j) = e_(i j) quad \( i eq.not j \) \, #h(2em) Q_(i i) = sum_(j eq.not i) e_(i j) + sum_a \( c_a \)_i . $

Equivalently,

#[#set math.equation(numbering: n => "(6.3)")
 $ Q upright(bold(1)) = sum_a c_a . $ <gr:grounding-dictionary>]

Thus prescribed off-diagonal entries and terminal columns realize a given symmetric $Q$ precisely when this row-sum identity holds. For the one-primary-vertex path above, $Q = \( 0 \)$ and $c_a = c_b = \( 1 \)$.

The coefficients below are instances over $bb(F)_2$ of the all-minors matrix-tree theorem #cite(label("Chaiken1982")) §1, Equation (2); we include the incidence-matrix proof needed here.

#thm([Lemma 6.4.])[
  (Network expansion).  #emph[A network satisfies $f \( z \, upright(bold(1)) \) = cal(N) P \( z \)$, where $cal(N)$ is a sum of terminal finite-difference operators indexed by forests. In each surviving forest term, every component containing an internal primary vertex meets a terminal. A component meeting $t$ terminals has contraction degree $t - 1$; a component containing two simple terminals acts as zero. Networks with disjoint internal vertices and no edges between them multiply as operators on the same $P$. In particular, degree greater than $deg P$ annihilates it.]
  #emph[For the grounded Laplacian $Q$ and terminal columns $c_a$ defined above, the constant and the pair-contraction coefficients are 
#[#set math.equation(numbering: n => "(6.4)")
 $ det Q \, #h(2em) c_a^(sans(t)) "adj" \( Q \) c_b quad \( a eq.not b \) . $ <gr:forest-coefficients>]

 The latter multiplies the terminal difference in the selected alignment; a prohibited pair multiplies the zero operator.]
] <gr:network>

#proof[
  For the set $E_0$ of added incidences, keep the terminal variables $z$ fixed and expand in the variables $y$:
  $ f \( z \, upright(bold(1)) \) = sum_(T subset.eq E_0) \( Delta_T^y f \) \( z \, upright(bold(0)) \) . $
  Lemma 32 removes cycles. A component meeting no terminal contracts to an isolated primary vertex, so isolation removes it, including an untouched primary vertex. In a surviving component the primary labels and external primary bits are trivial. Its contracted label and external incidences are thus exactly those obtained by contracting its terminals in the original graph. A terminal tree with the same relative orientations gives that operator, of degree $t - 1$.
  Expanding two disjoint networks gives composition: product labels agree in either order, and any resulting cycle vanishes. Polynomial differentiation then proves the degree bound. This reasoning also verifies compatibility with projections at every degree. Norms commute with oriented products, primary norm corrections are neutral, and either oriented toggle induces its rational toggle on the original terminal polynomial. Repeated projected differences or prohibited simple mergers give zero. Forgetting fixed-label coordinates commutes with the same products.
  For the coefficients, write the Laplacian of the added network as $L = D D^(sans(t))$, where each incidence column has ones at its edge endpoints. Let $I$ and $A$ be the internal and terminal sets. Cauchy–Binet for $Q = L_(I \, I)$ counts edge sets whose incidence matrix becomes invertible after deleting the terminal rows. They are exactly forests with one terminal in each component: cycles give dependent columns, a component with no deleted row gives dependent rows, and a tree with one row deleted is invertible by leaf removal. These are the degree-zero terms.
  Apply Cauchy–Binet instead to row set $I union { a }$ and column set $I union { b }$. Each component must contain one root from each of $A \\ { a }$ and $A \\ { b }$. Thus $a \, b$ lie together and every other terminal lies in its own component. The corresponding minor is
  $ det mat(delim: "(", Q, c_b; c_a^(sans(t)), 0) = c_a^(sans(t)) "adj" \( Q \) c_b . $
  The corner is zero because there is no added terminal–terminal edge. Signs disappear in characteristic two, and the adjugate identity remains valid when $Q$ is singular. ◻
]

=== 6.3 Selecting one address <selecting-one-address>

An #emph[address] is $x in upright(bold(F))_2^b$, where $b gt.eq 1$. A vertex with activation $lambda in \( upright(bold(F))_2^b \)^(*)$ is present when $lambda \( x \) = 1$. Fix a nonzero target $x_(*)$ and an edge bit $z$ joining terminals $a_0 \, a_1$ active there. Either all terminals are always present, or all have nonzero linear activations with at least one terminal for each nonzero linear form. For one symbol we need a derivative as the leading term at $x_(*)$ and a constant term $1$ elsewhere. For two symbols we must also account for a derivative allocated to just one factor; the second network includes a binary parameter for this purpose. We construct these two networks by prescribing their constant and degree-one terms; the final degree count will remove every higher term.

Choose a dual basis $lambda_1 \, dots.h \, lambda_b$ with $lambda_i \( x_(*) \) = 1$ for every $i$. Indeed, start with $lambda_1 \( x_(*) \) = 1$ and add it to a basis of the annihilator of $x_(*)$. Make $b$ groups of three primary vertices, with all three vertices in group $i$ activated by $lambda_i$. The physical coordinate vectors index these actual vertices. In each three-dimensional coordinate space choose a computational basis $\( e_i \, u_i \, v_i \)$ with $e_i = \( 1 \, 1 \, 1 \)$. Prescribe a symmetric form $Q$ by making the $e_i$ orthonormal and orthogonal to all $u_j \, v_j$, and using on the remaining coordinates

#[#set math.equation(numbering: n => "(6.5)")
 $ H \( T \, B \) = mat(delim: "(", 0, T; T^(sans(t)), B) . $ <gr:H>]

Convert this form to its matrix in the physical vertex coordinates, which we also denote by $Q$. Write $Q_J$ for the restriction to the physical coordinates in groups $J$.

The column $h_i = Q e_i$ represents the covector dual to $e_i$. Since the coordinate changes do not mix groups, $h_i$ is supported on group $i$; it is independent of $T \, B$. Attach this incidence column to a terminal of activation $lambda_i$, or to any fixed terminal in the stationary case. When the active groups are $J$, the sum of these anchor columns is

$ sum_(i in J) h_i \|_J = Q_J upright(bold(1))_J \, $

since $upright(bold(1))_J = sum_(i in J) e_i$. Use the off-diagonal physical entries of $Q$ as the internal edge bits. Equation (6.3) then gives the prescribed diagonal as well: the anchors make the actual grounded Laplacian equal to $Q_J$ at every address, even after groups have disappeared.

Also attach the same column $c$ to $a_0 \, a_1$. If their moving activations $alpha \, beta$ differ, attach it to a terminal of activation $alpha + beta$ as well. The additional column sum is always zero:

$ #scale(x: 120%, y: 120%)[\(] alpha \( x \) + beta \( x \) + \( alpha + beta \) \( x \) #scale(x: 120%, y: 120%)[\)] c = 0 . $

The third terminal is absent at $x_(*)$. Equal activations, or two stationary terminals, require only the first two columns. Coincident terminal roles mean addition of columns. Hence these attachments preserve the grounding at every restriction.

Write $O_(gt.eq d)$ for a sum of contraction operators of degrees at least $d$. This denotes a filtration, not a numerical estimate. Figure 1 depicts the group-level cycle and path used in the two programs when $b = 4$.

#figure(
  [(115,36) (15,28)(15,28)(0,0)$1$ (40,28)(40,28)(0,0)$2$ (40,8)(40,8)(0,0)$3$ (15,8)(15,8)(0,0)$4$ (18,28)(1,0)19(40,25)(0,-1)14 (37,8)(-1,0)19(15,11)(0,1)14 (27.5,0)(0,0)Cycle (75,28)(75,28)(0,0)$1$ (100,28)(100,28)(0,0)$2$ (100,8)(100,8)(0,0)$3$ (75,8)(75,8)(0,0)$4$ (78,28)(1,0)19(100,25)(0,-1)14 (97,8)(-1,0)19 (87.5,0)(0,0)Path],
  caption: [Figure 1: The off-diagonal patterns of $T - I$ for the two programs when $b = 4$. The vertices represent groups, not the individual primary vertices of the network. A proper group restriction breaks the cycle; the path from $1$ to $4$ survives only when every group is present. ],
) <gr:selector-figure>

#thm([Lemma 6.5.])[
  (Two address programs).  #emph[With these activations and grounding, there are the following networks:]
  + #emph[A singular program $cal(S)$ such that 
$ cal(S)_(x_(*)) = Delta_z + O_(gt.eq 2) \, #h(2em) cal(S)_x = 1 + O_(gt.eq 1) quad \( x eq.not x_(*) \) . $

]
  + #emph[Two nonsingular programs on the same sites, indexed by $epsilon in upright(bold(F))_2$, such that 
$ cal(N)_x^(\( epsilon \)) = 1 + O_(gt.eq 1) \, #h(2em) cal(N)_x^(\( 1 \)) + cal(N)_x^(\( 0 \)) = cases(delim: "{", Delta_z + O_(gt.eq 2) \, & x = x_(*) \,, O_(gt.eq 2) \, & x eq.not x_(*) .) $

]
  #emph[All new sites have nonzero activation and are absent at $0$. Unspecified incidences, including those to stationary external vertices, may remain neutral.]
] <gr:programs>

#proof[
  For the first program, take $T = I + P$, with $P$ the cyclic permutation matrix, and let $B$ be diagonal with exactly one nonzero entry. Every proper principal restriction of $P$ is a union of directed paths, hence nilpotent. Thus $T_J$ and $H \( T_J \, B_J \)$ are invertible for proper $J$, including the empty restriction, whose determinant is $1$.
  On all groups, $ker T$ and $ker T^(sans(t))$ are spanned by $upright(bold(1))$. A radical vector of $H$ has $v = t upright(bold(1))$; summing $T^(sans(t)) u + B v = 0$ gives $t = 0$, since $upright(bold(1))^(sans(t)) B upright(bold(1)) = 1$. Hence $Q$ has radical generated by $r = sum_i u_i$. Its adjugate is $r r^(sans(t))$: it is nonzero of rank one, symmetry identifies its factors with the kernel, and the only nonzero scalar in $upright(bold(F))_2$ is $1$.
  Take $c$ dual to $u_1$, so $c^(sans(t)) r = 1$. All anchors annihilate $r$. At $x_(*)$ the only terminal columns pairing nontrivially with $r$ are therefore those of $a_0 \, a_1$. Formula (6.4) gives constant zero and precisely $Delta_z$ in degree one. Every other address has a proper group subset and constant $1$, since the activation forms form a basis. For $b = 1$, $T = 0$ and $B = \( 1 \)$ give the same radical.
  For the second program take $T = I + L$, where $L$ is the consecutive lower shift, and $B_epsilon = epsilon E_(b b)$. Every group restriction of $T$ is invertible, and
  #[#set math.equation(numbering: n => "(6.6)")
   $ H \( T \, B \)^(- 1) = mat(delim: "(", T^(- sans(t)) B T^(- 1), T^(- sans(t)); T^(- 1), 0) . $ <gr:inverse>]
  Again take $c$ dual to $u_1$. On groups $J$, the change in $c^(sans(t)) Q_J^(- 1) c$ is $\( \( T_J^(- 1) \)_(b 1) \)^2$, interpreted as zero if an endpoint is absent. The expansion $\( I + L_J \)^(- 1) = I + L_J + L_J^2 + dots.h.c$ shows that this is $1$ exactly when the entire path $1 \, dots.h \, b$ survives, namely at $x_(*)$. Pairings with anchors do not change, since $Q_J^(- 1) h_i = e_i$ and $e_i \, h_i \, c$ are independent of $epsilon$. At the target the balancing terminal is absent, leaving only the changed pair $a_0 \, a_1$. All determinants are $1$. Lemma 33 proves the assertion, also for the single-vertex path $b = 1$. ◻
]

=== 6.4 Simultaneous units on a punctured cube <simultaneous-units-on-a-punctured-cube>

The preceding programs control only two degrees of their operators. To make this sufficient, at each address we spend exactly the degree of a chosen top monomial. Any additional contraction then vanishes. For two symbols, the same accounting uses the ordinary product of their top homogeneous parts. The multiplication is performed before imposing the Boolean relation $z^2 = z$, so one occurrence of $z$ in each factor remains two contraction requirements.

#thm([Theorem 6.6.])[
  (Address lemma).  #emph[Assume the contraction, isolation, and whole-prime omission rules of Proposition 24, or the same rules for another symbol, together with the realization freedoms of Lemma 30. Let $b gt.eq 1$ and consider either of the following terminal arrangements:]
  + #emph[One symbol on a nonempty set of always active terminals, whose polynomial in the independent pair bits is nonzero.]
  + #emph[One or two symbols on terminals with nonzero linear activations, including a terminal for every nonzero linear form. At each $x eq.not 0$, each symbol separately is a nonzero polynomial in the active bits. The symbols may have stationary external data and may read compatible projections of a common graph.]
  #emph[At every $x eq.not 0$, assume that the active terminal data and the stationary external data obey each required filter. Then finitely many primary auxiliaries with nonzero linear activations, and one realizable assignment of graph bits, make all the symbols $1$ at every $x eq.not 0$. No auxiliary is present at $0$. All may satisfy fixed splitting and neutral-incidence conditions included in their primary type.]
  #emph[A nonzero evaluation or a nonzero iterated edge difference suffices for the polynomial hypothesis. In particular, a partition as in Definition 31 suffices in the stationary case.]
] <gr:address>

#proof[
  Fix a common realizable baseline for the terminal bits and regard their toggles as variables; omit variables invisible to a symbol. A nonzero iterated difference implies a nonzero polynomial, while every nonzero polynomial has a top monomial with coefficient $1$. By Lemma 32, this also proves the assertion about partitions.
  For one symbol, let $P_x$ have degree $d_x$ at $x eq.not 0$ and choose a monomial of degree $d_x$ with coefficient $1$. For each of its variables adjoin a separate singular program targeted at $x$, all with disjoint internal vertices. At address $x$, its own $d_x$ programs have zero constant, so they consume at least $d_x$ contraction degrees. Any extra degree from any program kills $P_x$. Only the selected degree-one terms of these programs and the constants of the others survive, giving the chosen coefficient $1$. A nonzero constant polynomial needs no program. Stationary anchors give the same argument for always active terminals.
  For two symbols, write their polynomials at $x$ as $P_x \, R_x$, of degrees $d_x \, e_x$. Multiply their top homogeneous parts in the ordinary ring $upright(bold(F))_2 \[ z_1 \, dots.h \, z_m \]$, before imposing Boolean relations. This ring is a domain, so choose a coefficient $1$ at a monomial
  #[#set math.equation(numbering: n => "(6.7)")
   $ M_x = product_z z^(nu_(x z)) \, #h(2em) nu_(x z) in { 0 \, 1 \, 2 } \, #h(2em) sum_z nu_(x z) = d_x + e_x . $ <gr:chosen-monomial>]
  For each exponent two add one singular program targeted at $x$; for each exponent one add one nonsingular program, with its own parameter $epsilon_(x z) in upright(bold(F))_2$. Keep all internal sets disjoint. Let
  $ Phi \( epsilon \) = product_(x eq.not 0) \( upright("final value of ") P_x \) \( upright("final value of ") R_x \) . $
  We show that $sum_epsilon Phi \( epsilon \) = 1$, which implies that one choice makes every factor $1$.
  Expand the operators by contraction degree. At its target a singular program has zero constant in both factors, so it consumes at least one degree in each. A nonsingular program has constant $1$ independent of its parameter. Summing that parameter cancels a term using only its constants everywhere; a surviving term must consume at least one degree somewhere for that program. The total of these minimum costs is
  #[#set math.equation(numbering: n => "(6.8)")
   $ D = sum_(x eq.not 0) \( d_x + e_x \) . $ <gr:budget>]
  A nonzero term cannot consume more, since some factor would then be differentiated beyond its degree. Every surviving term therefore uses each minimum cost exactly.
  Thus a singular program contributes precisely $Delta_z$ in each factor at its target and constants elsewhere. A nonsingular program contributes degree one in exactly one factor. Summing its parameter kills that contribution away from its target and gives $Delta_z$ at the target; every other occurrence contributes the common constant $1$. In particular, no higher forest coefficient remains.
  At one address put $Z_i = { z : nu_(x z) = i }$ for $i = 1 \, 2$, and write $z_J = product_(z in J) z$. The surviving allocation sum is
  $ sum_(J subset.eq Z_1) \[ z_(Z_2) z_J \] P_x^(upright("top")) thin \[ z_(Z_2) z_(Z_1 \\ J) \] R_x^(upright("top")) = \[ M_x \] \( P_x^(upright("top")) R_x^(upright("top")) \) = 1 . $
  Wrong-degree coefficients are zero. Since the total degree is $D$ and no factor exceeds its degree, each factor receives its full degree; its derivative is exactly the displayed coefficient, independent of the baseline. Allocations at distinct addresses are independent, so their product is $1$. This covers constant factors too. For instance, if both top forms are $z$, their ordinary product is $z^2$: a singular program differentiates each once. Boolean reduction would lose that allocation.
  Choose parameters with $Phi = 1$ and realize the resulting finite graph by Lemma 30. Primary types preserve the filters and the stipulated neutral incidences and splitting conditions. Nonzero linear activations ensure that no new vertex appears at $0$. ◻
]

For a stabilized symbol this is a finite construction at each dimension. First choose $b$, the terminal data, and all networks; their weights and coefficient tests then have a finite bound. Select an actual stage where the numerical bounds and the finitely many stabilized symbol evaluations hold for that range. The required precision may grow with $b$. The unit-valuation constant, however, is the constant of the coefficient construction and must be independent of $b$; the forest argument supplies no additional uniformity assertion.

== 7 The converse with rational two-torsion <pw:section>

We prove the pointwise converse for curves with $E \( bb(Q) \) \[ 2 \] eq.not 0$. The finite graph construction supplies binary families with a unit coefficient at every nonzero address. Cyclotomic interpolation settles the even case. For the odd case we first establish the missing lower bound for the moving coefficient system, then keep one nonvanishing quadratic companion fixed throughout the interpolation.

Fix such a curve $E \/ bb(Q)$. We use the prime weights $w \( h \)$, normalized values $cal(L) \( h \)$, and finite $2$-primary Shafarevich–Tate lengths $s \( h \)$ from the preceding sections. The corank $c_2 \( E^(\( h \)) \)$ is a different quantity: a corank-zero base has finite $s \( h \)$ before analytic nonvanishing is known. All new primes are odd primes of good reduction. A filter fixes the real sign and the local unit squareclasses at a finite support containing $2 N$, and may exclude any further fixed finite set.

For a signed parameter $h$, write $A \( h \)$ for the symbol at the positive index $\| h \|$ on its chosen filter. We will use two bounds attached to a unit coefficient:

#[#set math.equation(numbering: n => "(7.1)")
 $ A \( h \) = 1 upright(" in the even system") quad & arrow.r.double quad L \( E^(\( h \)) \, 1 \) eq.not 0 \, #h(2em) v \( cal(L) \( h \) \) lt.eq 2 w \( h \) + C \,\
A \( h \) = 1 upright(" in the odd system") quad & arrow.r.double quad a \( E^(\( h \)) \) = 1 \, #h(2em) j \( P_h \) lt.eq w \( h \) + C . $ <pw:even-unit-interface>]

Here $P_h$ is the genus Heegner sum with a fixed analytic-rank-zero partner $h_(*)$, and $j \( P_h \)$ is its free-line index valuation. The first bound is available from the even coefficient construction and Theorem 12. We use the second only after Proposition 7.7 has supplied the arithmetic lower bound required to normalize the odd system. The contraction and isolation identities are those of Theorem 29; their finite graph consequences were proved in Section 6.

Write $j_h \( k \) = j \( P_(\| h \|) \( h \) \)$ for the ring-class index over $K = bb(Q) \( sqrt(k) \)$. Theorem 14 states that, if $k < 0$ is an odd fundamental discriminant with $\( k \, 2 N h \) = 1$, has at most $A$ prime factors, is square at $2 N h$, and defines a nonexceptional imaginary field, and the twists $h \, h k$ have analytic orders one and zero, then

#[#set math.equation(numbering: n => "(7.2)")
 $ 2 j_h \( k \) gt.eq 4 w \( h \) + s \( h \) + s \( h k \) - C_(E \, A) . $ <pw:ring-lower-interface>]

All coefficient and interpolation constants depend on the fixed curve, its parametrization, and fixed local data. A bound on $omega \( k \)$ may enter $C_(E \, A)$; the sizes of its primes do not. The finite networks, required coefficient precision, and prime sizes may depend on the binary dimension. The unit bounds in Equations (7.1) and (7.1) may not.

By Lemma 5, an isogeny preserves analytic rank and Selmer corank. If the isogeny class contains a curve with full rational two-torsion, we use that curve. Otherwise choose a rational two-isogeny $E arrow.r E'$ and write $F = bb(Q) \( E \[ 2 \] \)$, $F' = bb(Q) \( E' \[ 2 \] \)$; both fields are quadratic. A prime split in $F$ is called split, and one inert in $F$ is called simple. Their weights are respectively $1$ and $1 \/ 2$. A simple prime is good if it is also inert in $F'$. At such a prime

#[#set math.equation(numbering: n => "(7.3)")
 $ \# E \( bb(F)_p \) equiv 2 med \( mod med 4 \) . $ <pw:good-simple>]

Indeed there is exactly one nonzero rational two-torsion point in the reduction. If the group order were divisible by four, its two-primary subgroup would contain a rational point of order four. Its image under the two-isogeny would supply on $E'$ a rational two-torsion point different from the dual kernel, contradicting inertness in $F'$. Thus the good-twin rule applies. When $F = F'$, every simple prime is good.

=== 7.1 Seeds and finite supplies <pw:seeds-section>

The word “label” below means an individually realizable fixed-support elementary Frobenius label, with orientations when required. It does not include a self-residue of a prime generator. All contractions and comparisons are those of Theorem 29 and Lemma 32.

#thm([Lemma 7.1.])[
  (Minimum seeds).  #emph[]
  + #emph[In an all-split alphabet, suppose a unit symbol has a nonempty witness. At the least positive vertex count $r$ of such a witness, all mutual edge bits are immaterial. The symbol is determined by the individual fixed-support labels. This remains true if the empty configuration is a unit, provided no contraction to the empty configuration is used.]
  + #emph[In the quadratic case, suppose the symbol has a nonzero witness, the alphabet is closed under the allowed contractions, and it contains the good twin operations. There are $r gt.eq 0$ and $s_1 gt.eq 1$ such that for every $s gt.eq s_1$ of the permitted simple parity, the minimum split count of a unit with $s$ simple vertices is $r$. At these counts all edge bits are immaterial. A chosen minimum seed may be padded by arbitrarily many good twin pairs.]
  #emph[The assertions also hold for a stabilized moving odd symbol, with every particular finite list of uses made at a sufficiently advanced stage.]
] <pw:minimum-seeds>

#proof[
  For the first assertion, a derivative in an edge of an $r$-vertex graph is a symbol on $r - 1$ vertices. If $r gt.eq 2$, this graph remains nonempty and has value zero by minimality. If $r = 1$, there is no edge. The omitted-vertex description then leaves exactly the fixed-support labels.
  For the second assertion let $r \( s \)$ be the minimum split count at simple count $s$, with value $+ oo$ when no witness exists. Once a finite value occurs, good-twin insertion gives $r \( s + 2 \) lt.eq r \( s \)$. A nonincreasing sequence of nonnegative integers stabilizes. Choose $s_1 gt.eq 1$ in that range. A derivative of an edge with a split endpoint reduces the split count and preserves the simple count; it is therefore zero at the minimum. A simple–simple derivative is zero by the symbol rule. Twin insertion gives the last assertion.
  For the moving system, take the minimum and the nonincreasing sequence in the stabilized profile. Each comparison just used involves bounded vertex counts. A failure on an ultrafilter-large set of stages at any one such bound would produce a bounded-weight sequence contradicting that minimum. Thus any fixed finite collection holds on an ultrafilter-large intersection of stages, from which an arbitrarily high stage may be chosen. No assertion about every sufficiently high stage, or about all unbounded counts at one stage, is needed. ◻
]

Recall that a list is partitionable when a permitted contraction forest has a unit symbol as its output. Its terminal polynomial is then nonzero, since the indicated iterated finite difference is nonzero.

#thm([Lemma 7.2.])[
  (Finite label reserves).  #emph[Fix a minimum seed and a finite label alphabet.]
  + #emph[In the all-split rational alphabet, a list with the same total label as the seed and sufficiently many copies of its labels is partitionable.]
  + #emph[In the quadratic alphabet, retain $r$ split anchors with the seed labels. Suppose there are sufficiently many simple vertices of the required parity and sufficiently many split reserves of each realizable rational shift. If $F eq.not F'$, also suppose 
#[#set math.equation(numbering: n => "(7.4)")
 $ Delta =  & \# { p : med p upright(" split in ") F upright(" and inert in ") F' }\
 & - \# { p : med p upright(" inert in ") F upright(" and split in ") F' } > C_0 . $ <pw:donor-balance>]

 Here $C_0$ depends only on the anchors and the reserves. Then all other split vertices can be attached to simple vertices so that the result is the minimum seed and good twin pairs. The twins may match a prescribed finite enrichment of the rational labels. The base simple labels may be specified on any projection on which the required total agrees.]
  #emph[All reserve requirements depend only on the finite alphabets, seed, and projection. They do not depend on the original list length.]
] <pw:reserves>

#proof[
  In the first case retain the first $r - 1$ seed labels and merge all other vertices to the last cluster. Sufficient copies ensure that this cluster is nonempty. Its label is forced by the total, hence is the last seed label. Lemma 36 makes its unknown edges immaterial.
  For the second case, the rational labels of split attachments form the subgroup with trivial $F$-coordinate. They act transitively on the simple coset, so every prescribed change of a simple label has a realizable split shift. Reserve sufficiently many representatives of every such shift. Remove these reserves and the anchors from the donor pool. If $F eq.not F'$, (7.4), with $C_0$ exceeding the number removed, leaves a distinct donor for each bad simple vertex. Attach these donors; every simple vertex is now good. If $F = F'$, this operation was unnecessary.
  Pair equal enriched good labels. By withholding a bounded number of pairs, leave between $s_1$ and $s_1 + C_1$ unpaired vertices, with the correct parity; $C_1$ depends only on the number of enriched labels. Use reserved shifts to turn the excess unpaired vertices into good pairs and to set the first $s_1 - 1$ base positions to the desired seed labels. The seed labels themselves need not all be good. Attach every remaining nonanchor split vertex to the last base position. Its projected label is forced by the total, the anchors, the other base positions, and the twin pairs. It is the required last seed label. Each cluster contains one simple vertex, so every contraction is permitted. Only a bounded number of reserve shifts was used.
  When incidences to a retained split anchor are needed only to remove twins, they can be prescribed after the contracted labels are fixed, by the independent terminal-edge realization. Fixed stationary vertices instead enter the finite label enrichment from the outset. These two uses do not increase the number of label types with the original list length. ◻
]

#thm([Lemma 7.3.])[
  (Neutral packets).  #emph[For any of the finite reserve problems above with prescribed rational total zero, one can choose a finite packet of terminal labels with rational total zero such that every nonempty union of copies of the packet has the required supplies. In the quadratic case with $F eq.not F'$, its donor surplus may be made arbitrarily large. Compatible fixed splitting conditions may be included whenever the needed individual labels and shifts remain realizable.]
] <pw:packets>

#proof[
  Choose ample copies of every required label, including anchors and shifts. When the quadratic fields $F \, F'$ are distinct, add enough donors to exceed all the losses from the other labels and the prescribed reserve margin. When $F = F'$, every simple vertex is already good. Duplicate every full label in the resulting list. Duplication gives total zero in every rational elementary coordinate and preserves any strict donor surplus. Choose the margins so that after reserving the finitely many anchors in any one packet, the union of any positive number of packets still meets the reserve requirements. All labels are realized by distinct fresh primes; duplication never means repeating an actual prime factor. ◻
]

=== 7.2 The even converse and its uniform estimate <pw:lower-section>

#thm([Proposition 7.4.])[
  (Even original base).  #emph[If $c_2 \( E \) = 0$, then $a \( E \) = 0$.]
] <pw:even-base>

#proof[
  Parity gives even functional sign. Fix an even symbol on the filter of $1$, including all auxiliary class-group tests. If its value at $1$ is a unit, analytic nonvanishing is already detected. Otherwise use a nonempty minimum seed in the full-torsion case, or a stabilized quadratic seed in the other case.
  For each $b$, assign a neutral packet from Lemma 38 to every nonzero linear form on $bb(F)_2^b$, and activate its primes by that form. At every nonzero address at least one packet is active; their union satisfies the reserve problem and has a nonzero terminal polynomial. At zero no terminal is active. The single-symbol case of Theorem 35 adds primary auxiliaries and makes the symbol a unit at every nonzero address. All local classes remain those of $1$. Equation (7.1) gives the uniform bound at all nonzero vertices. Theorem 8, applied at the original corank-zero base, now gives $a \( E \) = 0$. ◻
]

#thm([Proposition 7.5.])[
  (Partitionable even estimate).  #emph[Fix an even unit symbol on a prescribed filter. For every partitionable parameter $h$ on its filter with $c_2 \( E^(\( h \)) \) = 0$, 
#[#set math.equation(numbering: n => "(7.5)")
 $ cal(L) \( h \) eq.not 0 \, #h(2em) v \( cal(L) \( h \) \) - 2 w \( h \) - s \( h \) lt.eq C . $ <pw:partitionable-bound>]

 The constant depends only on the symbol and fixed local data.]
] <pw:partitionable-even>

#proof[
  If the parameter has no prime factors, the only contraction is the identity, so partitionability means that the empty symbol itself is a unit. Equation (7.1) then proves the assertion directly. Otherwise the stationary terminal set is nonempty. Keep the prime factors of $h$ stationary. The iterated edge difference along the defining contraction forest is $1$, so their terminal polynomial is nonzero. The stationary one-symbol case of Theorem 35 gives arbitrarily large binary cubes based at $h$, with only primary new primes, whose other addresses have unit symbol. Equation (7.1) and $s \( h_x \) gt.eq 0$ give the uniform upper bound required by the cyclotomic transfer. The base corank is zero, so Theorem 8 gives (7.5). A base-dependent dimension threshold does not affect the asserted constant. ◻
]

=== 7.3 The lower bound needed for odd coefficients <the-lower-bound-needed-for-odd-coefficients>

The even estimate also supplies the arithmetic hypothesis of Proposition 17. For an already analytic-rank-one parameter $h$, we choose a companion $k' = k' \( h \)$ with boundedly many prime factors and estimate the central value at $h k'$. Comparing the ring and genus Heegner sums then bounds $j \( P_h \)$ from below. The companion in this argument may vary with $h$; the odd coefficient system has not yet been normalized.

To compare the two fixed isogenous curves $E \, E'$, add subscripts to $s \, w \, cal(L)$. At a parameter $h$ already known to have analytic rank zero, both twists have finite Tate–Shafarevich groups by the forward theorem. Cassels’s isogeny formula for the arithmetic BSD quotient #cite(label("Cassels1965")), as explained in #cite(label("Tate1966"), form: "prose") Theorem 2.1 and the following discussion, gives

#[#set math.equation(numbering: n => "(7.6)")
 $ s_E \( h \) + 2 w_E \( h \) = s_(E') \( h \) + 2 w_(E') \( h \) + O_(E \, E') \( 1 \) . $ <pw:isogeny-weight-comparison>]

Indeed, at an active odd good prime the component-group valuation is $t_p$ for the corresponding curve, so the active Tamagawa valuations sum to twice its weight. At the fixed support only finitely many local twisting classes occur. Differential, period, and torsion ratios are bounded by the fixed isogeny and its reverse, and the rank-zero regulator is $1$. These account for the bounded error in (7.6). The isogeny identity applies to the known finite groups and does not assume the BSD value formula.

The two twists have the same $L$-function. Their fixed normalizing periods therefore give $v \( cal(L)_E \( h \) \) - v \( cal(L)_(E') \( h \) \) = O_(E \, E') \( 1 \)$, uniformly in $h$. Combining this with (7.6) shows that $v \( cal(L) \( h \) \) - 2 w \( h \) - s \( h \)$ changes by a uniformly bounded amount. Consequently (7.5) transfers in either direction with one constant, even when the choice between the two fixed isogeny orientations depends on $h$.

#thm([Lemma 7.6.])[
  (A bounded companion for a varying odd parameter).  #emph[Fix a positive odd-sign filter and a negative genus partner $h_(*)$ with $L \( E^(\( h_(*) \)) \, 1 \) eq.not 0$, chosen using Proposition 15 and then excluded from the variable parameters. There are constants $A \, C$ such that every $h$ on this filter of analytic order one admits a negative odd fundamental discriminant $k'$ for which]
  + #emph[$\( k' \, 2 N h \) = 1$, $k'$ is a square at every place of $2 N h$, and $bb(Q) \( sqrt(k') \)$ is nonexceptional;]
  + #emph[$omega \( k' \) lt.eq A$;]
  + #emph[$L \( E^(\( h k' \)) \, 1 \) eq.not 0$ and 
#[#set math.equation(numbering: n => "(7.7)")
 $ v \( cal(L) \( h k' \) \) lt.eq 2 w \( h k' \) + s \( h k' \) + C . $ <pw:rough-bound>]

]
] <pw:rough-companion>

#proof[
  Choose the class-group support and all other fixed label tests before varying $h$. Prepare an even negative-index symbol for each possible total type at this support, and for both isogeny orientations if needed. There are finitely many such preparations. The positive index $\| h k' \|$ has nonzero total rational type: its negative-discriminant parity is already nontrivial among the tests at $2$. Thus in the full-torsion case a unit seed has positive count. In the quadratic case use the stabilized seed of Lemma 36.
  When $F eq.not F'$, interchanging the isogeny orientation interchanges the two counts in (7.4). Select the orientation with initial balance at least zero. The existing donors can then pay for arbitrarily many existing bad simples. They do not have to be supplied by new primes.
  Let $R$ be the absolute prime-count bound in Proposition 15. Insert in $k'$ a finite dummy supply that meets the anchors, minimum simple count, and reserve requirements for every one of the finitely many prepared symbols. When the quadratic fields $F \, F'$ are distinct, add donor slack paying for every reserved loss, the new dummy bad simples, and a further possible loss of $R$ from the later rough factor. Add a fresh ramified prime if needed to exclude the exceptional imaginary fields. The number of dummy primes is bounded independently of $h$. Their labels and initial incidences may be chosen by Lemma 30.
  Absorb $h$ and the dummy product into the curve. Apply Proposition 15 to complete $k'$ by a squarefree factor coprime to all primes already used. Prescribe its sign and its local unit classes so that the final $k'$ is an odd negative fundamental discriminant, is a square at $2 N h$, and has the required original local classes at $2 N$. These conditions are reduced congruences at the level of the absorbed curve. Additional fixed primes may be excluded. The lemma makes the central value at $h k'$ nonzero with at most $R$ new factors. Its size threshold may depend on $h$ and all these congruences; $R$ does not.
  No particular resulting unit class at the auxiliary class-group support was assumed in advance: dummy supplies were prepared for every possible total there. For the actual total, Lemma 37 makes $h k'$ partitionable. Analytic nonvanishing gives Selmer corank zero by the forward theorem. Proposition 40 therefore gives (7.7), with the isogeny comparison above if the other orientation was used. The finite preparation and the bound on dummy and rough factors give $A \, C$ independent of $h$. ◻
]

Proposition 9 compares the genus sum $P_h$ with the ring-class sum over $K = bb(Q) \( sqrt(k) \)$:

#[#set math.equation(numbering: n => "(7.8)")
 $ 2 j_h \( k \) - 2 j \( P_h \) = v \( cal(L) \( h k \) \) + O \( 1 \) $ <pw:height-ratio>]

whenever the two twists have analytic orders one and zero. The error is uniform in $h$ for fixed $k$, and uniform in $h \, k$ when $omega \( k \)$ is bounded and the prescribed local classes are retained. Thus the same comparison applies to the bounded companions just constructed.

#thm([Proposition 7.7.])[
  (Uniform lower bound for the odd detector).  #emph[ Every analytically rank-one $h$ in the fixed positive filter satisfies 
#[#set math.equation(numbering: n => "(7.9)")
 $ 2 j \( P_h \) gt.eq 2 w \( h \) + s \( h \) - C . $ <pw:odd-lower-bound>]

 In particular $j \( P_h \) gt.eq w \( h \) - C$ uniformly in $h$ and its prime count.]
] <pw:odd-lower>

#proof[
  Choose $k'$ by Lemma 41. Combine (7.2), (7.8), and (7.7). Since the factors are coprime, $w \( h k' \) = w \( h \) + w \( k' \)$, and $w \( k' \) lt.eq omega \( k' \) lt.eq A$. Hence
  $ 2 j \( P_h \) & gt.eq 4 w \( h \) + s \( h \) + s \( h k' \) - v \( cal(L) \( h k' \) \) - C\
 & gt.eq 2 w \( h \) + s \( h \) - 2 w \( k' \) - C\
 & gt.eq 2 w \( h \) + s \( h \) - C' . $
  Only even symbols and independently nonvanishing companions were used. Thus this proof precedes, and does not assume, the odd minimum-depth normalization. ◻
]

=== 7.4 A fixed companion for the odd converse <pw:fixed-companion-section>

Suppose the functional sign is odd. By Proposition 42, the odd coefficient system can now be normalized on the positive filter of $1$. Fix its old support and genus partner $h_(*)$. Its moving detecting prime $ell$ has not become an extra fixed support requirement.

Choose a separate even symbol for negative discriminants square at $2 N$, excluding the fixed odd support, the relevant torsion ramification, and the exceptional imaginary fields. Choose a unit $k$ of that symbol. Then $L \( E^(\( k \)) \, 1 \) eq.not 0$. Fix this $k$ and $K = bb(Q) \( sqrt(k) \)$ for the rest of the construction, before choosing any cube dimension. Its fresh ramification makes it independent of the old fixed label extensions. At sufficiently advanced stages $ell$ avoids $k$. The intrinsic odd label tests continue to omit the primes of $k$. When the odd symbol already detects the base, the converse follows directly. We henceforth consider the remaining case, in which the odd symbol has the nonempty seed described above.

For the moving odd source, fix its stabilized minimum depth and seed profiles before constructing packets. A bounded-weight seed has boundedly many vertices here, since every prime has weight at least $1 \/ 2$. For each fixed field used in the labels, permitting ramification above the one moving prime $ell$ adds only boundedly many dimensions to its elementary squareclass space. Identify these spaces compatibly with their fixed projections and stabilize the finitely many seed and label profiles. The reserve bounds of Lemma 37 are uniform over these profiles, so the packet constructions below have a fixed size. They are finite tables of labels; their prime representatives will be chosen at an actual coefficient stage after the networks and their weight bounds have been specified.

Our remaining task is to construct, for every binary dimension, a family in which the odd test at $h$ and an even test at $h k$ are simultaneously units away from the zero address. Every new prime will split in this single field $K$. For quadratic $F$, the good-twin rule makes the unit at $k$ a nonzero even test on additional prime configurations. With full rational two-torsion, the restriction to $K$-split primes can instead leave only the empty configuration at the original minimum depth. The next construction supplies a nonempty witness in exactly that case; its extra division changes the valuation estimate by a fixed constant.

=== 7.5 A nonempty witness with full rational two-torsion <pw:split-section>

#thm([Lemma 7.8.])[
  (Recurrence congruences).  #emph[Let $p$ be odd, $a equiv p + 1 med \( mod med 4 \)$, and let 
$ b_0 = 1 \, quad b_1 = a - kappa \, quad b_(s + 1) = a b_s - p b_(s - 1) . $

 If $kappa = plus.minus 1$, then $b_(s + 1) - b_s$ is even and 
$ frac(b_(s + 1) - b_s, 2) equiv frac(a - kappa - 1, 2) med \( mod med 2 \) quad \( s gt.eq 0 \) . $

 If $kappa = 0$, put $b_(- 1) = 0$; then $b_s - b_(s - 1)$ is odd for every $s gt.eq 0$. Finally, for $kappa = 1$, if $a equiv p + 1 med \( mod med 2^m \)$ then $b_s equiv p^s med \( mod med 2^m \)$ for every $s gt.eq 0$.]
] <pw:recurrence>

#proof[
  Modulo $2$ the recurrence is $b_(s + 1) = b_(s - 1)$. Its initial values prove the parity assertions. For $d_s = b_(s + 1) - b_s$, the recurrence for $d_s$ is the same. Directly, $d_1 - d_0 equiv \( p - 1 \) \( p - kappa \) equiv 0 med \( mod med 4 \)$ when $kappa = plus.minus 1$. Thus $d_s \/ 2$ is constant modulo $2$. The last assertion follows by substituting the sequence $p^s$ in the recurrence and checking its first two terms. ◻
]

#thm([Lemma 7.9.])[
  (Nonempty $K$-split witness).  #emph[Suppose $E \[ 2 \]$ is rational. Choose a negative unit $k$ of a fixed even symbol for $E$, prime to all previous fixed support and to the ramification support of $E \[ 8 \]$. Put $K = bb(Q) \( sqrt(k) \)$, chosen nonexceptional. Let $S_0$ contain $2 N$, the primes of $k$, and primes generating the class group of $K$. On the positive filter of $1$ square at $S_0$, there is an even unit test on nonempty products of primes split in $K$ with these properties:]
  + #emph[it has a nonempty witness;]
  + #emph[it satisfies the oriented split contraction and primary-isolation rules over $K$, for contractions with nonempty output;]
  + #emph[a unit at $D$ implies 
#[#set math.equation(numbering: n => "(7.10)")
 $ L \( E^(\( k D \)) \, 1 \) eq.not 0 \, #h(2em) v \( cal(L) \( k D \) \) lt.eq 2 omega \( D \) + C_k . $ <pw:split-unit-bound>]

]
  #emph[The proof uses Lemmas 22 and 23 to construct a further divided coefficient test.]
] <pw:split-witness>

#proof[
  Let $a_0 \( n \)$ be the coefficients of the original negative-index form for $E$. Since $k$ attains its least normalized depth, $v \( a_0 \( \| k \| D \) \/ a_0 \( \| k \| \) \) gt.eq omega \( D \)$ whenever $k D$ lies on its filter. Use the ordinary even coefficient form for $E^(\( k \))$, normalized by $a \( 1 \) = 1$, on the positive filter of $1$ square at $S_0$. The two exact comparisons in Equation (4.2) give
  $ 2 v \( a \( D \) \) = v #h(-0.16667em) (frac(sqrt(D) thin L \( E^(\( k D \)) \, 1 \), L \( E^(\( k \)) \, 1 \))) = 2 v #h(-0.16667em) (frac(a_0 \( \| k \| D \), a_0 \( \| k \| \))) . $
  Indeed, the period and the factor $sqrt(\| k \|)$ cancel in the old ratio, and the new period cancels in the new ratio. Enlarging $S_0$ only restricts the allowed $D$, so the original minimum still gives
  #[#set math.equation(numbering: n => "(7.11)")
   $ v \( a \( D \) \) gt.eq omega \( D \) $ <pw:split-basic-depth>]
  at every allowed squarefree $D$.
  If equality holds at a nonempty product of $K$-split primes, use the usual even bit, projected from oriented $K$-labels to rational labels. It has all the required properties by Theorem 29. We therefore assume for the rest of the proof that equality never occurs there. By the rational-phase assertion in Proposition 16, normalization by $a \( 1 \) = 1$ makes each nonzero squarefree coefficient a rational number times a root of unity. Its valuation is an integer, not just an element of the possibly ramified coefficient field’s discrete value group. Thus strict inequality implies
  #[#set math.equation(numbering: n => "(7.12)")
   $ v \( a \( D \) \) gt.eq omega \( D \) + 1 quad upright("for every nonempty allowed all-") K upright("-split ") D . $ <pw:split-extra-depth>]
  Write $g = sum a \( n \) q^n$ for the form. Its characters satisfy $psi \/ eta = chi_(- 4)$; since the scalar character $psi$ is even, $eta$ is odd. For a set $U$ of $K$-split primes put
  $ B_U = 2^(- \| U \|) product_(p in U) \( U_p - eta \( p \) V_p \) g \, #h(2em) Theta_J = sum_(m > 0 \, med \( m \, S_0 \) = 1) eta \( m \) m q^(J m^2) . $
  All expansions retain the prescribed support sieves. The ordinary divided form is
  $ H_U = 1 / 2 (B_U - sum_(J subset.eq U) B_U \[ J \] Theta_J) . $
  Here $B_U \[ J \]$ denotes its coefficient at the squarefree index $J$.
  #emph[The mod-$8$ consequence.] We first prove
  #[#set math.equation(numbering: n => "(7.13)")
   $ a_p \( E^(\( k \)) \) equiv p + 1 med \( mod med 8 \) quad upright("for every allowed good ") p upright(" split in ") K . $ <pw:split-mod8>]
  Put $f = H_({ p }) theta$ and apply its trace at a Frobenius lift $phi.alt_p$, testing coefficient $p^2$. The terms $B_({ p }) theta$ and $Theta_({ p }) theta$ have the same character, whose $p$-part is primitive quadratic. Thus they have no $p$-old constituent. On their conductor-one ramified principal-series constituents the identity is
  $ U_p^2 t \( phi.alt_p \) = U_p^3 + d \( phi.alt_p \) U_p . $
  The remaining term $Theta_diameter theta$ is unraised, and obeys the ordinary good-prime coefficient identity. Consequently
  $ \( t \( phi.alt_p \) f \) \[ p^2 \] = f \[ p^3 \] + \( d \( phi.alt_p \) f \) \[ p \] . $
  Replace the trace by a fresh split prime $p'$ with the same finite data, including every support-unit test. At each rational quadratic character unramified outside $S_0$, a Frobenius lift at $p$ has the character value of $p$. Hence the matched $p'$ has the same value, and $p p'$ has value $1$. Equivalently, $p'$ has the same unit squareclasses as $p$ at all places of $S_0$, so their product is square at all of them, including $2$. Since $phi.alt_p in G_K$, the new prime is also split in $K$. Its coefficient on the left tests $p p'$; by (7.12) it is zero modulo the maximal ideal after the two divisions. To check the determinant term, let $d_1 \, d_0$ be the determinant scalars on the raised and unraised character spaces. Then
  $ d \( phi.alt_p \) f = d_1 f + frac(B_({ p }) \[ 1 \], 2) \( d_1 - d_0 \) Theta_diameter theta . $
  The character difference $\( d_1 - d_0 \) \/ 2$ is integral. Also $f \[ p \] equiv H_({ p }) \[ p \] = 0$ modulo the maximal ideal, since $Theta_({ p }) \[ p \] = 1$, whereas $\( Theta_diameter theta \) \[ p \] equiv Theta_diameter \[ p \] = 0$ because $theta equiv 1$ and $p$ is nonsquare. Thus $\( d \( phi.alt_p \) f \) \[ p \] = 0$ after reduction. This cancellation uses the two character spaces together.
  On the right, the indices $p$ and $p^3$ in $B_({ p })$ have underlying squarefree index $1$; they involve only $a \( 1 \) \, a \( p^2 \) \, a \( p^4 \)$. The $J = diameter$ unary term has no coefficient at either nonsquare index. Thus no other squarefree coefficient contributes there. For $a = a_p \( E^(\( k \)) \)$, the phase-free square coefficients are $1 \, a - 1 \, a \( a - 1 \) - p$. Hence the remaining coefficient is, up to a unit,
  $ H_({ p }) \[ p^3 \] = frac(a^2 - 2 a - p + 1 - p \( a - 2 \), 4) = frac(\( a - 1 \) \( a - p - 1 \), 4) . $
  This quotient is rational. Its vanishing in the residue field therefore gives a positive integral $2$-adic valuation, so it is divisible by $2$. Full rational two-torsion makes $a$ even, so $a - 1$ is odd; this proves (7.13). No individual total filter condition on $p$ was needed: its matched prime $p'$ makes $p p'$ lie on the filter, and the square-index terms on the right come from $1$.
  #emph[One further division by $2$.] Define
  #[#set math.equation(numbering: n => "(7.14)")
   $ tilde(H)_U = 1 / 4 (B_U - sum_(J subset.eq U) B_U \[ J \] Theta_J) . $ <pw:four-divided-form>]
  We verify integrality at every coefficient. Write a test index uniquely as $J r m^2$, where $J subset.eq U$ and $r$ is squarefree and disjoint from $U$. The underlying squarefree coefficient is at $D = \( U \/ J \) r$. Removing the unit phases, a prime of $U \/ J$ contributes an odd factor $b_s - b_(s - 1)$ with $kappa = 0$, and a prime of $J$ contributes $b_(s + 1) - b_s$ with $kappa = \( D \/ p \)$. Thus
  #[#set math.equation(numbering: n => "(7.15)")
   $ v \( B_U \[ J r m^2 \] \) gt.eq omega \( r \) $ <pw:shell-valuation>]
  by (7.11), with one additional unit of valuation when $D$ is nonempty and all its primes split in $K$.
  If $r eq.not 1$ and all primes of $D$ split in $K$, the last inequality is at least $omega \( r \) + 1 gt.eq 2$. If $D$ contains an inert prime, then $r$ contains at least two: the total rational $K$-character is trivial on the filter, and all primes of $U$ split. Then (7.15) is again at least $2$. No unary term has this squarefree part. This proves divisibility by $4$ for $r eq.not 1$.
  Suppose $r = 1$ and $J eq.not U$. Then $D = U \/ J$ is nonempty and all split, so $B_U \[ J \]$ is even. This cancellation can be checked without dividing by a leading multiplier, which may be zero. Factor from both shell coefficients the common phase and the scalar $2^(- \| U \| + \| J \|) a \( U \/ J \)$, whose valuation is at least $1$ by (7.12). The remaining factors are the odd differences at $U \/ J$, the integral divided differences at $J$, and the ordinary square-index factors outside $U$. By Lemma 43, their product is congruent modulo $2$ to the product of their leading values, even when one of those values is zero modulo $2$. Since $m$ is odd, multiplication by $m$ preserves this congruence. The common scalar supplies the second factor $2$. Retaining the phase $eta \( m \)$ therefore gives
  $ B_U \[ J m^2 \] equiv B_U \[ J \] eta \( m \) m med \( mod med 4 \) . $
  This is exactly the cancellation with $B_U \[ J \] Theta_J$.
  Finally let $J = U$, so $D = 1$. At a prime outside $U$ the recurrence gives $b_s equiv p^s med \( mod med 4 \)$. At a prime of $U$, (7.13) gives $b_s equiv p^s med \( mod med 8 \)$, and hence
  $ frac(b_(s + 1) - b_s, 2) equiv frac(a_p - 2, 2) thin p^s med \( mod med 4 \) . $
  Multiplying these congruences, again retaining the phases, gives $B_U \[ U m^2 \] equiv B_U \[ U \] eta \( m \) m med \( mod med 4 \)$. This proves integrality in the last case and establishes (7.14). Diamonds preserve this lattice: when $J eq.not U$, $B_U \[ J \]$ is even and the quadratic character difference supplies another factor $2$; when $J = U$, the characters agree exactly.
  #emph[The new symbol and its witness.] Multiply (7.14) by ordinary theta and use the integral trace operators. Two fresh traces in $G_K$ give zero after reduction at every coefficient. To see this, start with an arbitrary test index $J r m^2$ and choose the two fresh primes outside that index and the level. The filter imposes $chi_K \( D \) = 1$; since $U$ is all split, the number of inert factors in $r$ is either zero or at least two. The fresh traces replace $r$ by $r q_1 q_2$, with both $q_i$ split. In the first case the valuation after division by $4$ is at least $omega \( r \) + 2 + 1 - 2 = omega \( r \) + 1 gt.eq 1$. In the second case it is at least $omega \( r \) + 2 - 2 = omega \( r \) gt.eq 2$. The unary terms disappear under these fresh tests. Additional fresh $G_K$ traces only improve these estimates, so vanishing holds on the entire reduced trace orbit. The trace identity therefore gives
  $ t \( g u^2 \) = t \( g \) #h(2em) \( g \, u in G_K \) $
  on this reduced trace orbit. Thus the tests factor through the elementary extension of $K$ unramified off the level.
  A single fresh $K$-split trace at coefficient $1$ reads the bit
  #[#set math.equation(numbering: n => "(7.16)")
   $ tilde(A) \( D \) = (2^(- omega \( D \) - 1) a \( D \) upright(" with its phase removed")) med mod med 2 $ <pw:deeper-bit>]
  for a nonempty all-split configuration. The contraction rule follows from the same integral local identity as in Lemma 23. For completeness its first shell, with $p in U$ and a fresh trace $q$, has underlying configuration $D' = \( U \/ p \) q$, which is still nonempty, and its reduction is
  $ c_p \( D' \) tilde(A) \( D' \) \, #h(2em) c_p \( D' \) = frac(a_p - \( D' \/ p \) - 1, 2) med mod med 2 . $
  Changing the oriented inertia bit changes $c_p$ once. The omitted-prime identity gives the product label and removes the entire rational prime $p$ from the new ramification support. Consequently its repeated contraction has precisely the forest interpretation of Lemma 32. An omitted-vertex label equal to the identity has trace zero, which is primary isolation. No contraction to the empty configuration has occurred.
  It remains to prove that this deeper test has a witness. Fresh ramification gives $K subset.eq.not bb(Q) \( E \[ 8 \] \)$. By Chebotarev there is a good prime $p$ inert in $K$ and trivial on the original $E \[ 8 \]$. Then
  $ p equiv 1 med \( mod med 8 \) \, #h(2em) a_p \( E^(\( k \)) \) equiv - 2 med \( mod med 8 \) . $
  On $tilde(H)_diameter$, whose coefficient at $1$ is zero, test $t \( u \)^2$ at coefficient $1$, where $u = "Fr"_p$. The square coefficient and matching unary character give, up to a unit,
  $ frac(a_p \( E^(\( k \)) \) - 1 - p, 4) med mod med 2 = 1 . $
  The determinant term at coefficient $1$ cancels. In characteristic two, $t \( u^2 \) = t \( u \)^2$, so a single trace in $G_K$ is nonzero. A fresh prime realizing this finite trace test is split in $K$. Moreover $u^2$ is trivial on every rational quadratic character, so the prime lies on the required total rational filter. It is a nonempty witness for (7.16). Finally the exact coefficient ratio gives (7.10), with the additional depth at most one. ◻
]

#thm([Lemma 7.10.])[
  (Orientation correction).  #emph[Let $K$ be imaginary quadratic, let $S_0$ contain $2$ and its ramification support, and let $V_0$ be the elementary label space over $K$ unramified off $S_0$. Complex conjugation acts on $V_0$ by $c$. If the rational total of an oriented prime configuration is zero on every rational quadratic character unramified off $S_0$, then its oriented total belongs to $\( 1 + c \) V_0$. A reserved supply containing every label allows its orientations to be flipped to realize any prescribed change in $\( 1 + c \) V_0$.]
] <pw:coinvariants>

#proof[
  Complex conjugation has order two outside $G_K$, so $G_(bb(Q)) = G_K times.r chevron.l c chevron.r$. A $c$-invariant quadratic character of $G_K$ extends by giving $c$ value zero. At a rational prime outside $S_0$, inertia lies in $G_K$ and the character is trivial there; thus its extension remains unramified outside $S_0$. The assumed total therefore annihilates $\( V_0^(*) \)^c$.
  For a finite vector space with involution, the annihilator of $ker \( 1 + c^(*) \) = \( V_0^(*) \)^c$ is $"im" \( 1 + c \)$. This proves the first assertion. Flipping a vertex of label $v$ changes its oriented label from $v$ to $c v$, and hence changes the total by $\( 1 + c \) v$. Reserve one representative for every preimage needed to express the desired element of the image. Their independent flips give the second assertion. These flips preserve every rational norm label. ◻
]

=== 7.6 Common packets and rank-one interpolation <pw:assembly-section>

#thm([Proposition 7.11.])[
  (Families with a fixed companion).  #emph[With the fixed odd coefficient system and companion $k$ chosen in Section 7.4, suppose the odd symbol at $1$ is zero. There is a constant $C$ with the following property. For every $b gt.eq 1$ there are distinct primes outside $2 N k$ and the fixed supports of both coefficient tests, with nonzero linear activations, such that their signed products $h_x$, $x in bb(F)_2^b$, satisfy $h_0 = 1$. Every $h_x$ is positive and has the fixed local classes of $1$, and every new prime splits in $K = bb(Q) \( sqrt(k) \)$. The primes also avoid the detecting prime of the actual odd coefficient stage. In particular $\( h_x \, k \) = 1$ for every $x$. For every $x eq.not 0$, 
$ a \( E^(\( h_x \)) \) = 1 \, #h(2em) L \( E^(\( h_x k \)) \, 1 \) eq.not 0 \, $

 and 
$ j \( P_(h_x) \) lt.eq w \( h_x \) + C \, #h(2em) v \( cal(L) \( h_x k \) \) lt.eq 2 w \( h_x \) + C . $

 The constant $C$ and the discriminant $k$ are independent of $b$.]
] <pw:fixed-companion-families>

#proof[
  We construct common terminal packets, individually split in $K$, such that the odd terminal polynomial and an even terminal polynomial testing $h k$ are separately nonzero at each nonzero address.
  First suppose $F \, F'$ are quadratic. Keep the original even symbol evaluated on $h k$, treating the vertices of $k$ as stationary external data. Enrich the rational labels of the $h$-vertices by the primes of $k$. Their total there and at the even support is required to be zero. Let $V$ be the resulting rational elementary label space, including the $F \, F'$ and $K$ coordinates and all relations among these characters. The allowed simple labels form the affine set ${ v in V : chi_F \( v \) = 1 \, med chi_K \( v \) = 0 }$, in additive notation. The difference of any two of its elements belongs to $ker chi_F ∩ ker chi_K$, precisely the realizable rational labels of the permitted split attachments. Translation by this subgroup is therefore transitive. The fields $F \, F'$ are unramified outside the old support, whereas $K$ has a fresh ramified prime; thus $K$ is independent of their compositum. When $F eq.not F'$, this realizes both the good-simple pattern $\( 1 \, 1 \, 0 \)$ and the donor pattern $\( 0 \, 1 \, 0 \)$ in their three coordinates. When $F = F'$, all simple labels are good.
  For the old odd projection, take a normal closure of its finite label extension, including the moving prime $ell$ at any stage realizing the stabilized profile. It is unramified outside the old support and $ell$. Once $ell$ avoids $k$, a prime ramified in $K$ remains outside that set. Hence $K$ has trivial intersection with this normal closure, and every old odd label can be realized together with splitting in $K$. This applies also to oriented split anchors over $F$. The added stationary $k$ coordinates may have relations, but they are already included in $V$; they do not impose extra requirements on the omitted odd projection.
  Use packets with the required simple supply and reserves in this kernel, and with sufficiently large donor slack when $F eq.not F'$. For the even test, take no split anchors. Correct all bad simples to good ones, pair equal enriched labels, and retain a nonempty good base pair. Use reserves to match the pair and the remaining good pairs, and attach every leftover split vertex to the last base position. Its label is forced by total zero. The output is a collection of good twin pairs, each matching also at every split vertex of $k$. Twin insertion into the unit at $k$ proves that this output has even symbol one. Thus the even terminal polynomial is nonzero.
  For the odd test, project away the newly added tests at $k$. The same packets contain enough split anchors, simple vertices and reserve shifts to contract to the stabilized odd seed and good pairs, by Lemma 37. Its total on that projection is the prescribed zero total. Incidences between the retained anchors and the good pairs can be set after contraction, by independent edge choices. The odd polynomial is therefore nonzero as well. This odd test does not include the stationary vertices of $k$.
  Now suppose the curve has full rational two-torsion. Use the even test of Lemma 44, with $K$-oriented labels on its support $S_0$, and let $v_1 \, dots.h \, v_r$ be a minimum nonempty witness. Its oriented total $v_1 + dots.h.c + v_r$ lies in $\( 1 + c \) V_0$, by Lemma 45. Choose packets containing ample copies of every needed even label, all odd seed labels on their rational projection, and orientation-shifting reserves. In the common compositum, restriction to the even label extension is surjective, so each even label has a lift. Each intrinsic odd label also has a lift fixing $K$: fresh ramification gives $K ∩ L_(upright("odd")) = bb(Q)$, and the moving odd prime avoids $k$. Extending these elements to the common compositum gives the required lifts. Take sufficiently many lifts for each projection separately, without prescribing their other projection. Duplicate each full label, so the packet has rational total zero.
  For the even contraction, retain anchors with labels $v_1 \, dots.h \, v_(r - 1)$. After reserving these anchors, use orientation flips to make the total equal to $sum v_i$; this is possible by Lemma 45. Merge all remaining vertices into the last cluster. Its label is $v_r$. The cluster is nonempty, and the minimum nonempty count makes the output a unit independently of its mutual edges. For the odd contraction, use its rational projection. Every odd seed label lifts to a $K$-split prime because $K$ was freshly ramified outside its intrinsic support. Retain all but the last odd seed label and merge the remainder. Total zero gives the last label, so this is also a unit. Orientation correction is conjugation over $bb(Q)$, which preserves every rational quadratic label, including those at the moving odd prime. Adding $k$ to the common support has not added it to the intrinsic odd projection.
  In both cases put a sufficient common packet at every nonzero linear form on $bb(F)_2^b$. Each nonzero address has two separately nonzero terminal polynomials. Theorem 35 supplies primary auxiliaries split in $K$ (and $F$ in the quadratic case), neutral at the stationary primes of $k$, and makes both symbols one at every nonzero address. The auxiliary generators are primary at every support coordinate used by either projection. Thus the odd and even graph identities remain identities on the same common terminal polynomial data. All active products $h$ are positive and square at the fixed tests, and all their primes split in $K$.
  For each fixed $b$, the terminal tables and networks now give a finite list of coefficient tests and a maximum weight. Choose the working precision after these bounds are fixed. Finer ray neighborhoods affect prime realization but do not enlarge the elementary label alphabet. Lemma 18 and Theorem 29 realize the required divisibilities and symbol identities on an ultrafilter-large intersection of stages. At an arbitrarily high actual stage in that intersection, realize the finite graphs by distinct primes. The unit-depth constants and the companion $k$ were fixed before $b$ was chosen, and therefore remain uniform in these realizations.
  At each nonzero address the odd unit detects analytic rank one and gives $j \( P_h \) lt.eq w \( h \) + C$. The even unit detects $L \( E^(\( h k \)) \, 1 \) eq.not 0$ and gives $v \( cal(L) \( h k \) \) lt.eq 2 w \( h k \) + C$, or the bound (7.10) in the full-torsion case. The fixed quantity $2 w \( k \)$ is absorbed into $C$. These are the asserted estimates. ◻
]

#thm([Proposition 7.12.])[
  (Odd original base).  #emph[If $c_2 \( E \) = 1$, then $a \( E \) = 1$.]
] <pw:odd-base>

#proof[
  Parity gives odd functional sign. Proposition 42 therefore permits the odd normalization used above. If its symbol at $1$ is a unit, it already gives $a \( E \) = 1$. Otherwise apply Proposition 46 for arbitrarily large $b$. At every nonzero address its estimates and Proposition 9, with the fixed $k$, give
  $ 2 j_h \( k \) lt.eq 4 w \( h \) + C . $
  The finite Sha lengths there are nonnegative. Hence $2 j_h \( k \) - 4 w \( h \) - s \( h \) - s \( h k \) lt.eq C$, as required for Heegner interpolation.
  At address zero, $L \( E^(\( k \)) \, 1 \) eq.not 0$ gives $c_2 \( E^(\( k \)) \) = 0$ by Lemma 4. Lemma 5 gives
  $ "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ K \) = c_2 \( E \) + c_2 \( E^(\( k \)) \) = 1 . $
  Since $K$ is fixed, the finite quotient of this base Selmer group has a fixed length. Theorem 10 makes $L \( E \, s \) L \( E^(\( k \)) \, s \)$ have a simple zero. Its second factor is nonzero at $1$, so $a \( E \) = 1$. ◻
]

#thm([Theorem 7.13.])[
  (The rational-two-torsion converse).  #emph[Let $E \/ bb(Q)$ satisfy $E \( bb(Q) \) \[ 2 \] eq.not 0$ and $c_2 \( E \) = "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ bb(Q) \) in { 0 \, 1 }$, with the local Kummer conditions at every place. Then 
$ "ord"_(s = 1) L \( E \, s \) = c_2 \( E \) . $

 There is no restriction on the rational isogeny configuration, complex multiplication, or reduction at $2$ or at the bad primes.]
] <thm:rational-converse>

#proof[
  The initial isogeny choice preserves both quantities and covers both rational two-torsion configurations. Proposition 39 proves the corank-zero case. In the corank-one case, Proposition 7.7 supplies the coefficient normalization, and Proposition 47 proves analytic rank one using a companion fixed before the binary dimension grows. ◻
]

== 8 Selmer matrices and three-state relations <sec:lm:local-matrices>

Assume that $V = E \[ 2 \]$ is irreducible, and write $F = bb(Q) \( V \)$ and $G = "Gal" \( F \/ bb(Q) \) in { C_3 \, S_3 }$. The symbol rules will be useful because a unit symbol bounds the $2$-Selmer dimension. We now express local Selmer conditions by a binary matrix and make that bound constrain the number of singular blocks. The second half of the section develops the elementary matrix operations needed to apply this constraint.

Write the Weil pairing additively, and choose a basis of $V$ in which its matrix is

$ J = mat(delim: "(", 0, 1; 1, 0) . $

Fix a finite set $S$ containing $2$, $3$, the bad primes, all auxiliary exclusions, and rational primes whose prime ideals generate the class groups of every subfield of $F$. Local specifications at $S$ will also include the archimedean places. The detecting prime $ell$ for an odd coefficient system is kept separate: all generators below have valuation zero there. This separation keeps the set of support types finite as $ell$ varies. We shall apply the construction to a fixed curve, after absorbing any initial quadratic twist into $E$.

=== 8.1 Global classes and local equations <global-classes-and-local-equations>

At a split prime $p$, choose a place of $F$ and put $H_p = 1$. At a simple prime, choose a place with Frobenius a specified transposition $c$ and put $H_p = chevron.l c chevron.r$. Set

$ F'_p = F^(H_p) \, #h(2em) V_p = V^(H_p) . $

Thus $V_p$ has dimension two or one, respectively. The chosen place lies above a degree-one prime $P_p$ of $F'_p$. By the choice of $S$, there is $pi_p in \( F'_p \)^times$ whose divisor away from $S$ is $P_p$. For $x in V_p$ define

#[#set math.equation(numbering: n => "(8.1)")
 $ C_p \( x \) = "cor"_(F'_p \/ bb(Q)) \( chi_(pi_p) x \) in H^1 \( bb(Q) \, V \) . $ <eq:lm:generator-class>]

Here $chi_(pi_p)$ is the quadratic Kummer character; its product with $x$ is a cocycle because $H_p$ fixes $x$.

The inertia coordinate of $C_p \( x \)$ at $p$ is $x$, and all its other inertia coordinates outside $S$ vanish. Indeed, local restriction–corestriction has exactly one ramified summand, at the degree-one place where $pi_p$ has valuation one. These coordinates therefore make the classes for distinct $p$ independent. A root prime has $V^("Fr"_p) = 0$ and contributes no coordinates.

Let $h$ be a twist containing the active nonroot primes in its discriminant. At a good odd prime $p$ ramified in $h$, inertia identifies the local Kummer condition with $V_p$. To see surjectivity, halve a Frobenius-fixed two-torsion point over the maximal unramified extension. The ramified twisting involution negates its half, so the resulting Kummer inertia is that two-torsion point. The Kummer condition has dimension $dim V_p$ by local duality, giving the asserted isomorphism.

Fix arithmetic Frobenius lifts $phi.alt_p$. A second local coordinate is unramified evaluation at $phi.alt_p$, modulo Frobenius coboundaries. Let $K_p \( x \) \( phi.alt_p \)$ be this coordinate for the Kummer lift of inertia $x$. It is determined by $E \[ 4 \]$ and the local twisting squareclass. Define the block matrix $B$ by

#[#set math.equation(numbering: n => "(8.2)")
 $ B_(q p) \( y \, x \) = chevron.l C_p \( x \) \( phi.alt_q \) \, y chevron.r - upright(bold(1))_(p = q) chevron.l K_p \( x \) \( phi.alt_p \) \, y chevron.r \, #h(2em) x in V_p \, quad y in V_q . $ <eq:lm:raw-matrix>]

Thus $B x = 0$ is exactly the collection of active-prime Selmer equations for $sum_p C_p \( x_p \)$. Changing the unramified unit part of the twist adds $J$ to a split diagonal block. On a simple line it changes nothing, since the Weil pairing restricts to zero on a one-dimensional space.

Record in the #emph[type] $frak(h)_p$ the subgroup $H_p$ and the squareclasses of $pi_p$ at the places over $S$, including signatures. Only finitely many types occur. Finer generator neighborhoods will be used to reproduce self entries, but they are not part of this type alphabet and do not enter its codimension cost. Global reciprocity gives

#[#set math.equation(numbering: n => "(8.3)")
 $ B_(q p) + B_(p q)^t = b \( frak(h)_q \, frak(h)_p \) \, $ <eq:lm:symmetry-defect>]

where $b$ is the sum of the local cup pairings at $S$. Indeed, at an active prime decompose each class into its Kummer lift and its unramified difference. Both planes are isotropic, and the cross pairing is unramified evaluation paired with inertia. The terms at $p$ and $q$ give the left side; the sum over all places is zero. Elsewhere outside $S$ the classes are unramified, so the local pairing vanishes. This includes $ell$, where the generators have unit valuation. The same calculation shows that $b \( frak(h) \, frak(h) \)$ is alternating.

=== 8.2 Prescribing the matrix entries <prescribing-the-matrix-entries>

We next prove that the off-diagonal entries and the rational Legendre bits can be varied independently. The latter bits will control split diagonals without disturbing the other blocks. The class-field inputs are ray-class reciprocity, the Hilbert product formula, and Chebotarev #cite(label("Neukirch1999")) Chapter VI, Sections 7–8, and Chapter VII, Section 13; see also #cite(label("MilneCFT2020"), form: "prose") Chapter V, Theorems 3.23, 5.3 and 5.5, and Example 5.4.

#thm([Lemma 8.1.])[
  (Realization of finite matrix prescriptions).  #emph[Fix finitely many individually admissible oriented prime templates, including generator neighborhoods at $S$, any additional finite places, and oriented Frobenius on $E \[ 4 \]$ and fixed quadratic-radical extensions unramified outside that support. At arbitrarily fresh primes these templates admit the following simultaneous prescriptions.]
  + #emph[Between distinct vertices, one direction of the double-coset residue bits is free and reciprocity determines the reverse direction. The available matrix blocks are all binary matrices for two split vertices in the $S_3$ case, and $J bb(F)_4$ in the $C_3$ case, with the rotation algebra identified with $bb(F)_4$. For split–simple vertices the full vector space is available, and for simple–simple vertices the scalar entry is available.]
  + #emph[The rational Legendre bit between the absolute primes is independent of the matrix block, subject to rational reciprocity in the reverse direction.]
  + #emph[Repeating a template fixes its simple self entry and its split self block modulo a scalar multiple of $J$. A sufficiently primary split template with trivial $E \[ 4 \]$-Frobenius has self block in $bb(F)_2 J$.]
  #emph[Here #emph[primary] means sufficiently close to $1$ at the finite places of $S$ and totally positive at the real places. New cross-bit prescriptions are made outside the support. All assertions concern finite configurations; an additional moving prime $ell$ may be included among the prescribed places.]
] <lem:lm:arithmetic-realization>

#proof[
  #emph[Off-diagonal entries.] Restriction–corestriction in Equation (8.1) gives, for distinct vertices,
  #[#set math.equation(numbering: n => "(8.4)")
   $ B_(q p) \( y \, x \) = sum_(g in H_q without G \/ H_p) e_(p q) \( g \) chevron.l g x \, y chevron.r . $ <eq:lm:double-coset>]
  The bit $e_(p q) \( g \)$ is the quadratic residue of $g pi_p$ at the oriented $q$-place in $F^(H_q ∩ g H_p g^(- 1))$. Indeed, pair local transfer with the $H_q$-invariant vector $y$; the orbit length $\[ H_q : H_q ∩ g H_p g^(- 1) \]$ is precisely the residue degree in the norm calculation. In this intermediate field, each of $pi_q$ and $g pi_p$ has its off-support divisor at a single prime: its oriented Frobenius generates the subgroup fixing the generator. Hilbert reciprocity therefore relates $e_(p q) \( g \)$ to $e_(q p) \( g^(- 1) \)$, with correction only at $S$.
  For a new vertex the independent forward bits are residue conditions at distinct primes of its own field $F'_p$. Move an initial template away from the old primes and choose a degree-one prime in the ray class whose quotient generator has the prescribed neighborhoods at $S$, real signs, and nonzero residues at those old primes. Multiplying the template generator by this quotient gives the required new generator. These conditions also preserve the admissible fixed Frobenius data: changes by local units at old primes are trivial on the intersection with extensions unramified outside the fixed support. Chebotarev thus imposes the ray and fixed-label conditions simultaneously. Prime ideals of degree greater than one over $bb(Q)$ have density zero among prime ideals of $F'_p$, so requiring degree one loses no admissible class. The same argument permits additional finite support, including $ell$. Reverse bits are then determined by reciprocity. Rational norm bits at already chosen root primes may be imposed as additional residue conditions in the ray modulus: finite-field norm maps are surjective, and these primes contribute no matrix coordinates.
  #emph[Matrix span and the norm bit.] The norm to $bb(Q)$ writes the rational absolute-prime Legendre bit as the sum of the double-coset bits, plus a fixed support-unit correction. For two split vertices the matrices in Equation (8.4) are $J g$. They span $"Mat"_2 \( bb(F)_2 \)$ for $S_3$ and $J bb(F)_4$ for $C_3$. A nontrivial rotation satisfies $1 + R + R^2 = 0$: changing these three bits fixes the matrix and changes their sum. For split–simple vertices, the three nonzero vectors or dual vectors likewise span the full space and have the same odd relation. For two simple vertices, the matching double coset has zero pairing and the other has nonzero pairing. The first bit changes the norm bit alone. This proves (i) and (ii).
  #emph[Self entries.] The nonidentity double cosets in self-transfer are unramified at the oriented prime. The identity term is a scalar times the pairing and is therefore zero on a simple line. At a split vertex the two rotation terms have fixed sum by reciprocity; changing both alters the block only by a scalar multiple of $J$. Every other term has an involution representative $tau$ exchanging the oriented place with another one. For a simple vertex this includes a transposition other than $c$ representing the nonmatching self double coset.
  Work in $F^tau$ and put
  $ alpha = pi_p tau pi_p \, #h(2em) beta = pi_p + tau pi_p \, #h(2em) F = F^tau \( sqrt(D_tau) \) . $
  The distinct divisors of $pi_p$ and $tau pi_p$ ensure $beta eq.not 0$. If $v_0$ is the place below the oriented prime, the residue symbol of $tau pi_p$ there is $\( alpha \, beta \)_(v_0)$: $alpha$ has valuation one and $beta$ is a unit with the required residue. Outside $S union { v_0 }$, $alpha$ is a unit. When $beta$ is a unit, both $\( alpha \, beta \)_v$ and $\( - D_tau \, beta \)_v$ vanish. When $beta$ has positive valuation, put $gamma = \( pi_p - tau pi_p \) \/ sqrt(D_tau) in F^tau$. The identity
  $ beta^2 - 4 alpha = D_tau gamma^2 $
  shows that $alpha$ has residue squareclass $- D_tau$; the two symbols are again equal. At $v_0$, $\( - D_tau \, beta \)_(v_0) = 0$. Reciprocity applied to both symbols gives, in additive notation,
  #[#set math.equation(numbering: n => "(8.5)")
   $ \( alpha \, beta \)_(v_0) = sum_(v in S) #scale(x: 120%, y: 120%)[\(] \( alpha \, beta \)_v + \( - D_tau \, beta \)_v #scale(x: 120%, y: 120%)[\)] . $ <eq:lm:self-spin>]
  At finite support places the right side is locally constant in a sufficiently small neighborhood of the template. At a real place where $F \/ F^tau$ is complex, $alpha$ and $- D_tau$ are positive. At a split real place, opposite signs of $pi_p$ and $tau pi_p$ make the two terms cancel; equal signs determine their sum. Thus signatures suffice, without archimedean size restrictions. For a primary template, $alpha$ is a square at the finite support places and $beta$ has the squareclass of $2$. The support sum becomes $sum_(v in S) \( - D_tau \, 2 \)_v = 0$, since the terms outside $S$ vanish. The involution terms are therefore zero. Together with the local Kummer lift determined by $E \[ 4 \]$, this proves (iii). ◻
]

=== 8.3 Symmetrization and the Selmer bound <symmetrization-and-the-selmer-bound>

The realization lemma supplies the allowable matrix blocks. We now remove their fixed-support reciprocity defect and compare the resulting kernels with actual Selmer classes. The fixed support types, stationary environment and additional local conditions will account for the loss in dimension.

Choose a matrix rule $L \( frak(h) \, frak(h)' \)$ in the available block spans such that

#[#set math.equation(numbering: n => "(8.6)")
 $ L \( frak(h) \, frak(h)' \) + L \( frak(h)' \, frak(h) \)^t = b \( frak(h) \, frak(h)' \) . $ <eq:lm:type-correction>]

For distinct types, choose either direction using Equation (8.3). For equal types, the right side is alternating. It is a matrix plus its transpose in the full span; in the rotation span use $R + R^(- 1) = 1$ after multiplication by $J$. On a simple line it is zero. Choose $L = 0$ when one type is primary and trivial at $S$, since then its support pairings vanish. Define, on every pair including the diagonal,

$ M_(q p) = B_(q p) - L \( frak(h)_q \, frak(h)_p \) . $

The matrix $M$ is symmetric. Lemma 49 allows zero cross-$M$ entries between prescribed blocks independently of their internal entries.

A #emph[stationary environment] consists of the fixed coordinates outside the variable blocks; its dimension is the number of those coordinates.

#thm([Proposition 8.2.])[
  (Nullity forces Selmer dimension).  #emph[Fix the curve, support types, a bound for the number of additional constrained places, and a bound for the dimension of a stationary environment. Partition a finite configuration into blocks with zero cross-$M$ entries, and denote their matrices by $M_i$. There is a constant depending only on these fixed data such that 
#[#set math.equation(numbering: n => "(8.7)")
 $ dim_(bb(F)_2) "Sel"_2 \( E^(\( h \)) \/ bb(Q) \) gt.eq sum_i dim_(bb(F)_2) ker M_i - C . $ <eq:lm:selmer-nullity>]

 At a unit coefficient symbol the sum of nullities, and hence the number of singular blocks, is therefore uniformly bounded. The bound works for both coefficient sources and is independent of the moving prime $ell$.]
] <prop:selmer-matrix-bound>

#proof[
  On $xor.big_i ker M_i$, impose
  #[#set math.equation(numbering: n => "(8.8)")
   $ sum_(p : thin frak(h)_p = frak(h)) x_p = 0 quad upright("for each type ") frak(h) \, $ <eq:lm:type-sums>]
  using the fixed orientation and basis to identify coordinates of the same type. These equations have codimension at most $sum_(frak(h)) dim V_(frak(h))$. They kill the correction in every row, since that correction is
  $ sum_(frak(h)) L \( frak(h)_q \, frak(h) \) sum_(p : thin frak(h)_p = frak(h)) x_p . $
  Thus $B x = 0$ at all block positions. Set the environment coordinates to zero and impose its row conditions, losing at most its dimension. The Selmer conditions at $S$ and the additional constrained places have bounded total codimension in local $H^1$. At every remaining good place the classes satisfy the unramified Kummer condition; at a root prime local cohomology is zero. Their sums are therefore Selmer classes, and independent inertia coordinates make the map injective. This proves Equation (8.7).
  At a unit symbol, Proposition 19 bounds the Selmer dimension, giving the remaining assertions. The type constraints use only the fixed $S$; a condition at the single moving prime contributes a uniformly bounded local dimension. ◻
]

=== 8.4 Three states on two coordinates <three-states-on-two-coordinates>

We have obtained two kinds of information from an arithmetic prime configuration: its coefficient symbol and a matrix whose nullity bounds its Selmer dimension from below. To compare configurations, we now vary exactly two coordinates at a time. Both the symbol and the determinant obey one common three-state relation. They remain different functions; the relation gives linearity, not their equality. The bounded number of singular blocks at a unit symbol will be the additional input used in the next section.

A #emph[site] consists of either one split vertex or an ordered pair of simple vertices, and always supplies two matrix coordinates. At a split site use the three states

$ upright("absent") \, #h(2em) upright("present with diagonal ") Q \, #h(2em) upright("present with diagonal ") Q + J . $

The rational Legendre bit of the aggregate root selects the two present diagonals. At a simple-pair site use absence of both vertices and two present variants differing in their nonmatching cross bit. Replace the second prime by a prime with the same template, self data, norm data, and outside cross bits. Its matching bit with the first prime must also change to keep the rational norm bit fixed; that bit has zero matrix contribution. Thus the two present matrices again differ by the symmetric toggle on their coordinate pair. Require all alternatives to agree against alternatives at other sites. These are finite simultaneous prescriptions allowed by Lemma 49.

In comparing states, keep fixed the total parameter label at the fixed support: the product of the labels of the active sites and the aggregate roots. The aggregate-root label itself changes when a site is deleted, absorbing the deleted labels.

#thm([Lemma 8.3.])[
  (The site relations).  #emph[Fix the total parameter label at the fixed support and the diagonal choices at the other present sites. In each state choose aggregate roots restoring this label, compatibly with an order-three residual Frobenius, and preserving those diagonals. For either coefficient symbol, its three values at one site sum to zero. The same holds for $det M$, with empty determinant one. Consequently both functions extend linearly to the tensor product of one copy of $bb(F)_2^2$ per site, whose three nonzero vectors represent the three states. These factors encode evaluations, not vectors of $V$.]
] <lem:lm:site-relations>

#proof[
  For a split site this is the root-deletion rule of Theorem 29. Deletion transfers the removed vertex’s rational labels to the aggregate root. Signed prime discriminants preserve the unit twist, and hence the diagonal, at every remaining prime.
  For a simple-pair site, omit the varied second prime from its opposite-parity trace test. In an extension of $G$ by an elementary kernel, two lifts of its transposition $c$ are conjugate by the kernel exactly when their difference lies in the image of $1 + c$. Dually, this means agreement on the $c$-fixed radical squareclasses. Besides fixed-support radicals, these are generated by products of the orbit generators $g pi_p$ over $c$-orbits: their off-support divisors are independent and conjugation permutes them. Singleton orbits test matching bits. A two-element orbit has product in $F^c$; its symbol at the varying degree-one prime is, by the residue norm, the symbol of one factor in $F$, namely the nonmatching bit.
  The variants agree on support radicals and the orbit tests for every other vertex. At the first prime they change both matching and nonmatching bits. Modulo the image of $1 + c$, their difference is therefore the product of inertia in the matching transposition orientation and inertia in the other orientation. Apply these substitutions successively. The matching-orientation derivative is zero; the different-transposition derivative deletes the pair by Theorem 29. Multiplication by inertia leaves the residual transposition unchanged. The intermediate Frobenius test is realized by Chebotarev; it need not be a site variant. The resulting root has rotation image and transfers the pair’s rational labels to the aggregate. Labels elsewhere are unchanged. At simple vertices root probes are immaterial; at split vertices the common rational labels preserve the diagonals. Matched actual probes, or their aggregate, are available because their discriminant character is trivial. This proves the symbol relation.
  For the determinant, reverse every permutation cycle of length at least three. The resulting terms cancel in characteristic two, leaving only involutions. Toggling the symmetric entries $\( i \, j \) \, \( j \, i \)$ changes exactly the terms containing $\( i j \)$, whose sum is the determinant with coordinates $i \, j$ deleted. This includes the split $J$-shift. Finally, the three-state relation in each factor is precisely linearity on its three nonzero binary vectors. ◻
]

#thm([Lemma 8.4.])[
  (Binary tensor span).  #emph[Let $W = ⨂_(i = 1)^r W_i$, where each $W_i$ has dimension two over $bb(F)_2$, and let $0 eq.not f in W^(*)$. The nonzero pure tensors annihilated by $f$ span $ker f$. Thus if pure tensors $e \, t$ satisfy $f \( e \) = f \( t \) = 1$, then $t$ is $e$ plus a sum of pure zeros of $f$.]
] <lem:binary-tensor-span>

#proof[
  It suffices to show that a functional $g$ vanishing on the pure zeros of $f$ is either $0$ or $f$. Induct on $r$, the case $r = 0$ being immediate. Slice at the three nonzero vectors of the last factor, numbering so that $f_3 = f_1 + f_2$ and $g_3 = g_1 + g_2$. If $f_i = 0$, then $g_i = 0$ because the smaller pure tensors span. Otherwise induction gives $g_i = epsilon.alt_i f_i$ for a binary scalar $epsilon.alt_i$. If all three $f_i$ are nonzero, $f_1 \, f_2$ are independent, so the sum identities force all $epsilon.alt_i$ to agree. If one $f_i$ vanishes, the other two, and their $g_i$, agree. All three cannot vanish. Hence $g = 0$ or $g = f$. ◻
]

Take $f = det M$ and let $e$ be the all-absent state. Every invertible state is the empty state plus a sum of singular pure states. Moreover, on any selected set of active sites, some choice of pair toggles makes $M$ invertible: the iterated determinant difference over all selected pairs is the empty determinant, one. These facts turn the Selmer nullity bound into a constraint on symbol evaluations.

=== 8.5 Making one address singular <making-one-address-singular>

The final construction singles out one nonzero vector of a binary cube. Every position is activated by a linear form, as required for interpolation; auxiliary split sites repair the matrix at all other nonzero vectors.

#thm([Lemma 8.5.])[
  (A block address program).  #emph[Let $M_(*)$ be the singular matrix of a finite site state, and let $D$ be a sum of its pair toggles such that $N_(*) = M_(*) + D$ is invertible. For $b gt.eq 2$ and $0 eq.not x_(*) in bb(F)_2^b$, one can add finitely many primary split sites, each activated by a linear form, so that:]
  - #emph[all sites present in the original state have activation $l_0$, with $l_0 \( x_(*) \) = 1$;]
  - #emph[no site is active at zero, and at $x_(*)$ precisely the original state $M_(*)$ remains;]
  - #emph[the matrix is invertible at every other nonzero address;]
  - #emph[the active auxiliary matrix is always invertible, and its Schur complement contributes $D$ exactly when the original sites are active and $x eq.not x_(*)$.]
  #emph[All entries use the freedoms of Lemma 49.]
] <lem:lm:address-program>

#proof[
  Choose a basis $y = \( y_1 \, dots.h \, y_(b - 1) \)$ for the forms annihilating $x_(*)$ and complete it by $l_0$. Then $y = 0$ exactly at $0 \, x_(*)$. For each required toggle and each nonzero $eta in bb(F)_2^(b - 1)$, choose a basis of forms all equal to one at $eta$. Such a basis is obtained from a form $u$ with $u \( eta \) = 1$ by adding $u$ to a basis of the annihilator of $eta$. Its unique simultaneous all-one solution is $eta$.
  Construct a path with $r = b - 1$ steps, using two new split positions at each step, both activated by the corresponding basis form. In scalar block notation, where a scalar denotes that scalar times $J$, put
  #[#set math.equation(numbering: n => "(8.9)")
   $ P = mat(delim: "(", 0, T; T^t, B_e) \, #h(2em) T = I + upright("lower consecutive shift") . $ <eq:lm:path-matrix>]
  The near and far endpoints are steps $1$ and $r$. The matrix $B_e$ has one nonzero diagonal entry at the far endpoint. Restrict both sides to active steps, retaining only the original consecutive edges. The restricted $T$ is triangular with diagonal one, so $P$ is invertible, with scalar inverse
  $ P^(- 1) = mat(delim: "(", T^(- t) B_e T^(- 1), T^(- t); T^(- 1), 0) . $
  Couple the addressed coordinate pair by $J$ to the first side at the near endpoint. Such a pairing is available also for two simple lines. Solving $T v = e_(upright("near"))$ propagates one to the far endpoint exactly when every step is active; a missing step interrupts the consecutive shift. The Schur contribution is consequently $J$ on a complete path and zero otherwise, including when the near endpoint is absent.
  For each nonzero $y$, exactly one path, the one indexed by $eta = y$, is complete. Their direct sum supplies the toggle when $y eq.not 0$ and supplies zero when $y = 0$. Repeat for each toggle in $D$, with zero mutual cross-$M$ entries. The actual matrices are the scalar matrices tensored with $J$, so the same inverse calculation gives the asserted binary Schur complements. All blocks lie in the permitted spans, and primary diagonals are $0$ or $J$.
  At $x_(*)$ the auxiliary sites are absent and $l_0 = 1$, leaving $M_(*)$. At any other nonzero address with $l_0 = 1$, eliminating the auxiliary sites leaves $M_(*) + D = N_(*)$. If $l_0 = 0$, only the invertible auxiliary matrix remains. Every activation is linear and vanishes at zero. ◻
]

== 9 The converse when $E \[ 2 \]$ is irreducible <sec:sa:saturation>

The local matrices now supply the families needed for interpolation. We shall arrange that a coefficient symbol is a unit at every nonzero vertex of a binary cube, with all added primes absent at zero. The key observation is that a unit evaluation has only boundedly many singular matrix blocks. A maximal list of such blocks will therefore force all the required unit evaluations. In the odd case, a second construction supplies simultaneous nonvanishing for an auxiliary even symbol.

#thm([Theorem 9.1.])[
  (The irreducible converse).  #emph[Let $E \/ bb(Q)$ be an elliptic curve for which $E \[ 2 \]$ is irreducible as a $G_(bb(Q))$-module. If 
$ c_2 \( E \) = "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ bb(Q) \) in { 0 \, 1 } \, $

 then $"ord"_(s = 1) L \( E \, s \) = c_2 \( E \)$.]
] <thm:irreducible-converse>

The curve is fixed throughout. Every constant may depend on it and on the finite choices specified below, all made before the cube dimension grows. The result applies pointwise to any quadratic twist by taking that twist as the initial curve.

=== 9.1 Finite evaluation tables and ordered profiles <finite-evaluation-tables-and-ordered-profiles>

A block is a finite set of the three-state sites of Section 8, together with their prescribed matrix entries. A state chooses one of the three alternatives at each site. Its evaluated matrix $M_s$ deletes the coordinates of absent sites and applies the toggles of the chosen active alternatives. The empty state has determinant $1$. We call a state singular when $det M_s = 0$.

The matrix and the coefficient symbol give different information about such a state. The raw matrix $B$ records the active-prime Selmer equations; $M$ is the symmetric matrix obtained after the fixed-support correction. The symbol still depends on the arithmetic realization, even when those matrix entries have been prescribed. What links them is Proposition 50: a symbol value $1$ permits only boundedly many singular blocks. We shall first stabilize the remaining arithmetic dependence and then use this bound.

Fix a normalized coefficient symbol $A$ on the filter of the parameter $1$. For the odd source retain its condition at the moving detecting prime $ell$. Consider an actual finite array of blocks, numbered in increasing order, with $M = 0$ between different blocks. For chosen indices $i_1 < dots.h.c < i_j$ and states $s_1 \, dots.h \, s_j$, write

$ cal(E) \( i_1 \, dots.h \, i_j \; s_1 \, dots.h \, s_j \) in bb(F)_2 $

for its coefficient-symbol value. Each table entry uses its own aggregate-root probe, which restores the total support label of $1$ and gives the chosen diagonals at active split sites. Root substitution makes its value independent of the probe with these data. The calibration below will realize all entries used by a cube with one common set of linearly activated root primes. The total label, rather than the aggregate root’s own label, is fixed: deleting a site transfers that site’s labels to the root. The substitution rules therefore preserve this value when an unused site or an empty block is deleted. In particular, the empty table entry is $A \( 1 \)$.

There are two independent indices in these tables. Inside each block, site slots specify where a state and its addressing paths can be put. The indices $i_1 < dots.h.c < i_j$ specify ordered copies of the whole block. We will use a common countable library of site slots in every copy, closed under the finite addressing constructions of Lemma 53. A state in this library uses only finitely many sites, with every other site absent. A #emph[word] is an ordered finite list of states from this library, with empty states omitted. An #emph[ordered profile] assigns a value to each such word, consistently with the three-state relations in each block. The next lemma constructs one by stabilizing finite tables: its value depends on the ordered states, but not on which increasing list of block indices carries them. It asserts no invariance under permuting the states.

#thm([Lemma 9.2.])[
  (A finitely realizable ordered profile).  #emph[For the fixed symbol $A$, there is a countable library of site slots in each block and an ordered profile with the following properties.]
  + #emph[Every prescribed finite part is realized by an array of distinct primes with the data of Lemma 49. For the odd symbol, it is realized at arbitrarily advanced stages of the prescribed precision stabilization.]
  + #emph[A word evaluation depends on the states and on their order, and not on the particular distinct block indices used to place them. The tensor relations hold separately in all of its blocks.]
  + #emph[The site library contains a transferred minimal-weight unit witness and the primary split sites needed for every finite collection of requests in Lemma 53.]
  + #emph[For a constant $C$ independent of the finite array, a unit evaluation contains at most $C$ singular blocks.]
  #emph[Couplings to finitely many fixed primes, kept outside the address symbol, may be prescribed in advance. In the even case, all primes may also satisfy a bound on $v_2 \( p^2 - 1 \)$ independent of the finite array.]
] <lem:sa:profile>

We first derive the consequence of this lemma. Its proof follows the saturation argument and explains how the ordered values retain finite arithmetic realizations, including for the moving odd source.

#thm([Lemma 9.3.])[
  (Saturation of a punctured cube).  #emph[For the profile in Lemma 55, either the empty word has value $1$, or there is a fixed finite word $W$ of singular blocks with value $1$ such that, for every sufficiently large $b$, an addressed family has symbol $1$ at every nonzero point of $bb(F)_2^b$ and has all sites absent at zero. Every such finite cube is arithmetically realizable.]
] <lem:sa:punctured-cube>

#proof[
  In the tensor space of a block, every nonsingular state is the empty state plus a sum of singular states, by Lemma 52. Expand the transferred unit witness this way. Some word consisting entirely of singular blocks, possibly the empty word, has value $1$.
  The lengths of all such words are bounded by Lemma 55(iv). Choose one of maximal length $m$. If $m = 0$, the empty word has value $1$. Otherwise fix one particular maximizing word
  $ W = \( W_1 \, dots.h \, W_m \) . $
  Each $W_i$ uses finitely many slots. These slots, and thus their total number, are fixed before $b$ grows. A bound on the number of blocks alone would not give this conclusion.
  For each $a in bb(F)_2^b \\ { 0 }$, place a copy of $W$ in its original block order. Address its $i$th block to $a$ using Lemma 53. At $a$ the state is exactly $W_i$, with every path site absent. At every other nonzero address the evaluated block is nonsingular, and at zero it is empty. All these finitely many programs are available in the recursive slot list.
  At a nonzero address $x$, expand every block outside the copy designated for $x$ as empty plus singular states. Choosing the empty state in every such block leaves $W$ in its original order, hence gives $1$. Every other term contains its $m$ singular blocks and at least one additional singular block, so maximality forces its value to be zero. This includes alternatives involving path slots: maximality was taken over the whole slot profile. Multilinearity therefore gives $1$ at $x$. All evaluations use one finite restriction of the profile, which is realizable by Lemma 55. ◻
]

#proof[
  #emph[The witness and available slots.] Begin with the nonroot positions of a minimal-weight unit witness. The minimum-transfer rule in Theorem 29 moves them to fresh primes while retaining their fixed-support Frobenius labels. Neither prescribed internal couplings nor couplings to stationary primes change this transfer: the latter primes are outside the coefficient index. The total simple parity is even, so pair its simple positions into sites. Fix admissible generator templates, including support squareclasses and self types, for this pattern.
  At each finite stage place a fresh copy of the pattern in every block to be colored. First apply Lemma 28 with matched actual root probes. The nonroot support labels are unchanged, so retaining the aggregate root’s support label restores the same total parameter label. Adjust only its bits at active vertices to give the prescribed diagonals. By Proposition 27(ii), a split root-bit derivative deletes weight one and vanishes below the minimal weight, while a simple root-bit derivative is zero. Thus every singleton witness still has value $1$, even after all internal and cross-block entries have been prescribed. For the odd symbol, make the transfer at the actual coefficient level and retain the witness’s labels at the detecting prime. Thus the witness entry of every singleton color is $1$ before taking homogeneous restrictions.
  We now enlarge the site library inside each block. For every finite list of earlier site slots and every finite list of addressing requests on it, allocate fresh primary split site slots realizing all those requests. Programs used together receive distinct path slots. Set every undesignated coupling to earlier slots equal to zero in $M$. This gives a countable formal list, since there are countably many finite requests. Any finite set of requested slots, together with its finitely many predecessors, is realizable by Lemma 49. The two simple-pair variants have identical outside bits and the prescribed internal toggle; the aggregate root supplies the split diagonal alternatives. Corresponding types have the same reciprocity correction $L$, so a forward entry $B = M + L$ gives the required reverse entry as well. In every alternative impose $M = 0$ between blocks.
  #emph[Order-invariant evaluations.] Fix the first $q$ sites of the common library. There are finitely many states on these sites, and their matrix entries have been prescribed. For each $j lt.eq q$, color an increasing $j$-tuple of block indices by the finite table of values $cal(E) \( i_1 \, dots.h \, i_j \; s_1 \, dots.h \, s_j \)$ on these states. There are finitely many colors. Apply finite Ramsey successively for these finitely many arities. Starting with sufficiently many blocks gives a homogeneous list of any prescribed finite length.
  Let the lengths, arities, and slot cutoffs tend to infinity. At each fixed cutoff there are only finitely many possible color vectors. Successive subsequences and a diagonal subsequence make every finite vector constant. These compatible values define the ordered profile. Every finite restriction occurs in an original finite array. The tensor identities, deletion rules, and unit witness survive because each involves only such a restriction.
  For the odd symbol, carry out this construction along its fixed nonprincipal ultrafilter of coefficient precisions. The witness has bounded weight, so its fixed-$S$ generator squareclasses and binary self data have only finitely many possibilities; first stabilize these data. Finer ray-neighborhood depths are realization data and need not stabilize. Impose the extra labels at $ell$ at each actual level. For every fixed weight bound, Lemma 18 gives an ultrafilter-large set on which all required lower bounds and smaller-weight vanishing assertions hold. Otherwise one could choose a violating index of that bounded weight at each failing level, contradicting the definitions of the least depth or the least witness weight. More explicitly, let $G_q$ be an ultrafilter-large set on which the witness, cutoff lower bounds, and minimal-weight vanishing assertions needed for the $q$th finite coloring hold. Choose precisions $M_q arrow.r oo$ in $⋂_(j lt.eq q) G_j$, and apply finite Ramsey there. Stabilize the finitely many colors and take the diagonal construction above. The extracted subsequence need not itself be ultrafilter-large: every finite restriction occurs at arbitrarily high precisions, which is the required conclusion. We assert no single level valid at all weight bounds, and choose no infinite array of primes.
  #emph[The bound on singular blocks.] Proposition 50 and the uniform unit-symbol bound in Proposition 19 bound the sum of the block nullities. Each singular block contributes at least one. The type alphabet and its correction cost depend on the fixed support $S$. The moving place $ell$ and any bounded stationary environment contribute only the bounded additional local cost allowed in Proposition 50; they do not enlarge that alphabet as the array grows. This proves (iv) in every finite realization, and therefore in the profile.
  For the final even-symbol assertion, choose fixed templates at sufficient $2$-adic precision for the witness and its simple variants, and a fixed sufficiently primary template for the path sites. Refine each rational residue class to a finite precision determining a finite value of $v_2 \( p^2 - 1 \)$. Only finitely many templates occur. Cross-bit conditions at new odd primes do not change these residues. The same argument will apply to the root primes used below. ◻
]

=== 9.2 Local calibration and the even case <local-calibration-and-the-even-case>

The preceding argument determines the symbol values. We next realize all its local twist classes simultaneously, while keeping each prime’s activation linear in the cube coordinates.

#thm([Lemma 9.4.])[
  (Calibration by root primes).  #emph[The cubes in Lemma 56 admit realizations by signed squarefree parameters 
$ h_x = product_p \( p^(*) \)^(f_p \( x \)) \, #h(2em) x in bb(F)_2^b \, #h(2em) h_0 = 1 \, $

 where each $f_p : bb(F)_2^b arrow.r bb(F)_2$ is linear. The prescribed local classes and diagonal choices hold at every assignment. Moreover, $h_x$ may be required to be a local square at any prescribed finite set of stationary primes. Calibration adds only root primes, whose invariant dimension $t_p$ is zero. In the even case, all added primes may satisfy a bound on $v_2 \( p^2 - 1 \)$ independent of $b$.]
] <lem:sa:root-calibration>

#proof[
  The address and path programs already give a linear activation form for each nonroot prime. Both primes of a simple site have the same form, so their total simple parity vanishes coefficient by coefficient. For each coordinate $x_j$, add a fresh root prime $q_j$, active when $x_j = 1$. Choose its rational radical label at the support to cancel the coefficient of $x_j$ in the total nonroot label. The paired-simple condition makes the residual discriminant obstruction to a rotation label zero. Lemma 49 and root substitution in Theorem 29 therefore allow these choices.
  The same roots supply the diagonal choices. At a nonroot split prime $p$, the unit twist from the other nonroot primes is a linear function of $x$. A desired constant diagonal bit on the active set of $p$ is represented by that constant times $f_p$. The correction needed is therefore linear, say $sum_j c_(p j) x_j$. Give $q_j$ the Legendre bit $c_(p j)$ at $p$. These bits are independently prescribable for the different $p$; simple positions need no diagonal correction. At each stationary prime, choose the root bits to cancel the existing unit twist coefficient by coefficient. To check compatibility, let $L$ be the compositum of the rational quadratic fields recording these finite tests. The fresh-prime radical classes are independent of the support classes by their valuations. Moreover, $F ∩ L = bb(Q)$ for $G = C_3$; for $G = S_3$ it is at most the residual discriminant field. Thus agreement on the already matched discriminant coordinate is the only additional condition for a rotation in $"Gal" \( F \/ bb(Q) \)$. Chebotarev supplies the required roots.
  Using signed prime discriminants gives the prescribed quadratic characters at every place, including infinity and $2$. At each $x$, the nonroot states and their internal data are those of its table entry. The product of the active root primes has the support label and the bits at active split primes of the aggregate-root probe in the corresponding table entry. Its bits at simple primes do not change the symbol. Root substitution in Theorem 29 therefore identifies $A \( \| h_x \| \)$ with that profile value. The same comparison includes $x = 0$, where the root collection is empty and all added primes are absent. Finally, root support labels lie in a fixed finite set, so fixed rational $2$-adic residue refinements determine $v_2 \( q_j^2 - 1 \)$. The extra conditions, ramified at fresh odd primes, are compatible with these refinements as in Lemma 55. ◻
]

#proof[
  By Lemma 5, the functional equation has sign $+ 1$. We use the even coefficient source on the filter of $1$. To obtain its lower bound, choose an auxiliary twist of analytic rank one, with opposite infinity sign and matching local classes at $2 N$, by nonvanishing in these fixed local classes (Proposition 15). Exclude its prime support and the exceptional quadratic fields as in Proposition 16. The reverse genus comparison and Theorem 13 give the lower bound required there. Fix this partner, the exclusions, and the normalized even symbol before choosing the profile or cube dimension.
  If the empty word is a unit, Proposition 19 gives $L \( E \, 1 \) eq.not 0$. Otherwise Lemmas 56 and 57 give arbitrarily large cubes with unit symbol at all $x eq.not 0$. At each such point,
  $ L \( E^(\( h_x \)) \, 1 \) eq.not 0 \, #h(2em) v \( cal(L) \( h_x \) \) - 2 w \( h_x \) - s \( h_x \) lt.eq C_A \, $
  where $C_A$ depends only on the fixed normalized symbol. The local classes are fixed and the added-prime valuations $v_2 \( p^2 - 1 \)$ are bounded independently of $b$. These are precisely the remaining hypotheses of Theorem 8, which yields $L \( E \, 1 \) eq.not 0$. ◻
]

=== 9.3 A bounded companion for the odd cube <a-bounded-companion-for-the-odd-cube>

Assume $c_2 \( E \) = 1$. Parity gives functional sign $- 1$, so the address symbol $A$ is odd and its filter is the filter of $1$. Choose its fixed genus partner of analytic rank zero, with opposite infinity sign and matching classes at $2 N$, by Proposition 15. The irreducible genus bound supplies the coefficient lower estimate. Choose also an even symbol $A_0$ on a fixed filter of negative odd fundamental discriminants $k$ for which $2 N$ splits in $bb(Q) \( sqrt(k) \)$. It has no condition at the moving prime $ell$. Its complementary genus partner has analytic rank one and is chosen by the same nonvanishing proposition. Fix these partners, all excluded prime supports and exceptional fields, and both coefficient normalizations.

If $A \( 1 \) = 1$, unit-symbol detection already gives the desired analytic rank. Otherwise the following construction supplies every arithmetic hypothesis needed for varying-field Heegner interpolation.

#thm([Proposition 9.5.])[
  (An odd cube with a bounded even companion).  #emph[For the fixed symbols $A \, A_0$ just chosen, suppose $A \( 1 \) = 0$. There is a constant $C$ such that, for every sufficiently large $b$, one can find an odd negative fundamental discriminant $k$ and a finite family 
$ h_x = product_p \( p^(*) \)^(f_p \( x \)) \, #h(2em) x in bb(F)_2^b \, #h(2em) f_p : bb(F)_2^b arrow.r bb(F)_2 med upright("linear") \, $

 with the following properties.]
  + #emph[The primes are distinct good odd primes outside the fixed exclusions; $h_0 = 1$, and every $h_x$ has the local squareclasses of $1$ at the fixed support and at infinity. Each $h_x$ is coprime to $k$. The field $K = bb(Q) \( sqrt(k) \)$ satisfies the standing Heegner conditions.]
  + #emph[The prime support of $k$ has cardinality at most $C$. At every nonroot prime $p divides product_x h_x$, the parameter $k$ is a local square. At every nonroot prime $q divides k$, every $h_x$ is a local square.]
  + #emph[The simultaneous symbol values are 
$ A_0 \( \| k \| \) = 1 \, #h(2em) A \( \| h_x \| \) = A_0 \( \| k h_x \| \) = 1 quad \( x eq.not 0 \) . $

 Consequently $E^(\( k \))$ has analytic rank zero and $s \( k \) lt.eq C$.]
  #emph[For the odd source, these assertions mean simultaneous actual tests at arbitrarily high admissible precisions after $b$ and its finite set of tests have been fixed. The constant $C$ is independent of $b$, that precision, and all moving primes. The parameter $k$ may vary with the finite realization.]
] <prop:sa:bounded-companion>

The construction uses the even symbol twice: at $k$ to control the base Selmer group over $K$, and at $k h_x$ to make the product have a simple zero at every nonzero vertex. We first condition $A_0$ by a fixed singular prefix. Only after this conditioning will its later values become determinants.

#thm([Lemma 9.6.])[
  (A determinant-conditioned prefix).  #emph[For the fixed even symbol $A_0$, there are a finite list $a$ of singular blocks and an environment consisting of at most one simple vertex with the following property. Fix these vertices and their split diagonal entries. Let $z$ be any further block of tensor sites whose alternatives all have $B = L$ to every block of $a$. Choose aggregate root data preserving the prefix diagonals and the fixed total label. Then 
#[#set math.equation(numbering: n => "(9.1)")
 $ A_0 \( a \, z \) = det M_z . $ <eq:sa:conditioned-determinant>]

 The left side includes the fixed environment. Its couplings need only be compatible with the tensor alternatives.]
] <lem:sa:prefix>

#proof[
  If the filter of $A_0$ has odd simple parity, retain one simple vertex of a unit witness as the environment; otherwise take the environment empty. The remaining simple positions have even parity, so pair them into sites and put all variable positions of the witness in one block. Allow aggregate roots with the prescribed total class throughout.
  Consider all actual finite configurations with this environment and a list of singular blocks, with $B = L$ between blocks, at which $A_0 = 1$. This collection, allowing an empty list, is nonempty. Indeed, if the witness block is nonsingular, expand it as empty plus singular states by Lemma 52; some resulting term has value $1$. Proposition 50 bounds the lengths of these lists, since the environment has fixed dimension cost. Choose an actual maximizing list $a$ and fix all its primes, singular matrices, and diagonal choices. Only this one finite list is retained; no bound on the sizes of arbitrary maximizing blocks is asserted.
  For a proposed further block, fixing the prefix and environment gives a multilinear symbol functional $f$. It vanishes on every singular pure state $z$, for otherwise appending $z$ contradicts maximality. Also $f \( diameter \) = 1$, because its aggregate root preserves the total label and the prefix diagonal data of the maximizing evaluation. Singular pure states span the kernel of the determinant functional by Lemma 52, and the empty state has determinant $1$. Hence $f = det$, proving Equation (9.1). Maximality here is over actual singular states. It requires no alternative choice for any fixed prefix prime against a later prime. ◻
]

==== 9.3.1 The number of surviving copies <the-number-of-surviving-copies>

Fix a nonempty maximal singular unit word $W = \( W_1 \, dots.h \, W_m \)$ in an odd profile, as in Lemma 56. Write

$ M = xor.big_(i = 1)^m M_i \, #h(2em) D = xor.big_(i = 1)^m D_i \, #h(2em) N = M + D \, $

where $D_i$ is a sum of site toggles making $M_i + D_i$ invertible. The matrix $N$ is invertible and $D$ is alternating. Their common coordinate space $U$ has even dimension, fixed with the word.

#thm([Lemma 9.7.])[
  (Address copies with even total activation).  #emph[For every $b gt.eq 2$, the address construction for $W$ may be chosen so that its symbol is $1$ at every nonzero $x$ and all sites are absent at zero. At a nonzero $x$, eliminating its invertible path sites leaves the designated copy of $M$ and an odd number of copies of $N$. The different copies have zero mutual $M$-entries.]
] <lem:sa:balanced-copies>

#proof[
  For every $a eq.not 0$ choose a linear form $l_a$ with
  #[#set math.equation(numbering: n => "(9.2)")
   $ l_a \( a \) = 1 \, #h(2em) sum_(a eq.not 0) l_a = 0 . $ <eq:sa:activation-parity>]
  To obtain these forms, begin with arbitrary choices satisfying the first condition. Allowed changes at $a$ form its annihilator. The annihilators of two distinct nonzero addresses are distinct hyperplanes and span the entire dual space. Changes at those two addresses can therefore cancel the initial sum.
  Activate all word sites in the copy designated for $a$ by $l_a$, and use a basis of the annihilator of $a$ for its path coordinates in Lemma 53. The saturation proof is unchanged. At a nonzero $x$, the designated copy leaves $M$. Each other active copy leaves $N$, and a copy with $l_a \( x \) = 0$ leaves only invertible paths. Equation (9.2) says that the total number of active copies is even. The designated copy is active, so an odd number of other copies remain. ◻
]

==== 9.3.2 A bounded interface <a-bounded-interface>

We will couple every surviving copy to the same fixed collection of split sites. When two $N$-copies are eliminated, their contributions to that collection cancel in characteristic two. Thus the calculation reduces to one $M$-copy, one $N$-copy, and the fixed collection. The following lemma chooses its couplings; its dimension depends on $W$ and not on the number of addresses.

#thm([Lemma 9.8.])[
  (Alternating interface repair).  #emph[Let $U$ be an even-dimensional vector space over $bb(F)_2$, let $N$ be symmetric and invertible on $U$, and let $D$ be alternating. There are at most $dim U$ linear maps $b_i : U arrow.r bb(F)_2^2$ such that, on writing $J = mat(delim: "(", 0, 1; 1, 0)$ and $H = sum_i b_i^t J b_i$, the matrix 
#[#set math.equation(numbering: n => "(9.3)")
 $ S \( H \) = mat(delim: "(", D, N; N, N + H) $ <eq:sa:interface-matrix>]

 is invertible. If $U$ has the rotation-field structure $bb(F)_4^d$ occurring in the cyclic cubic case, the maps may be chosen $bb(F)_4$-linear from $U$ to the field line $bb(F)_4 = bb(F)_2^2$.]
] <lem:sa:interface>

#proof[
  Start with $H = 0$, and write $pi_2 : U xor U arrow.r U$ for projection to the second coordinate. For every $H$, this projection is injective on $ker S \( H \)$: if $\( u \, 0 \)$ belongs to the kernel, then $N u = 0$, so $u = 0$. The update $H mapsto H + b^t J b$ adds the alternating form $\( b pi_2 \)^t J \( b pi_2 \)$ to $S = S \( H \)$. We show how to choose an update reducing every nonzero kernel.
  If $dim ker S gt.eq 2$, choose $b$ of rank $2$ on $pi_2 \( ker S \)$. Take a complement of $ker S$ and modify its basis vectors by kernel vectors so that $b pi_2$ vanishes on the new complement. The restriction of $S$ to that complement remains nondegenerate. The update is zero there and in its cross pairings, and has rank $2$ on $ker S$. Hence it decreases the nullity by exactly $2$.
  Suppose instead that $ker S = chevron.l k chevron.r$ is one-dimensional. Let $d_S$ denote the diagonal vector. Since $z^t S z = d_S^t z$ for every binary symmetric matrix, $d_S$ annihilates the kernel and lies in the image of $S$. Choose $s$ with $S s = d_S$. We shall use
  #[#set math.equation(numbering: n => "(9.4)")
   $ d_S^t s = "rank" S med \( mod med 2 \) . $ <eq:sa:diagonal-rank>]
  To prove it, restrict to a nondegenerate complement of the radical, with invertible symmetric matrix $A$ and diagonal vector $d_A$. The left side is $d_A^t A^(- 1) d_A$. Off-diagonal terms cancel in pairs, leaving $sum_i \( A^(- 1) \)_(i i) A_(i i)$. Applying the same cancellation to $"tr" \( A^(- 1) A \)$ identifies this with $dim A$ modulo $2$, proving Equation (9.4).
  Since the ambient dimension is even and the kernel has dimension one, $d_S^t s = 1$. The alternating matrices $D$ and $H$ have zero diagonal, so $d_S$ is supported on the second coordinates. Consequently $pi_2 \( s \)$ and $pi_2 \( k \)$ are binary-independent: otherwise the former would be zero or equal to the latter, forcing $d_S^t s = 0$. Choose $b$ sending them to independent vectors of $bb(F)_2^2$.
  Let $z$ belong to the kernel after this update. Self-pairing gives $d_S^t z = 0$. Pairing the updated equation with $k$ gives
  $ \( b pi_2 \( k \) \)^t J \( b pi_2 \( z \) \) = 0 . $
  Pairing with $s$ gives the same equation with $s$ in place of $k$, since $s^t S z = d_S^t z = 0$. Their independent images force $b pi_2 \( z \) = 0$. The updated equation then reduces to $S z = 0$, so $z$ is a multiple of $k$. As $b pi_2 \( k \) eq.not 0$, this multiple is zero. The update has made $S$ invertible.
  Both choices of $b$ remain possible under the field-linear restriction. Two binary-independent vectors $u \, v in bb(F)_4^d$ are either field-independent, in which case a field-linear map can send them to any binary basis of $bb(F)_4$, or satisfy $v = alpha u$ with $alpha in bb(F)_4 \\ bb(F)_2$. In the latter case any field-linear map nonzero on $u$ gives binary-independent images. These maps are allowed by the rotation-field off-diagonal spans, and the preceding argument applies to the underlying binary forms.
  Finally, injectivity of $pi_2$ bounds every kernel dimension by $dim U$. Each update strictly decreases it, so at most $dim U$ maps are required. ◻
]

#proof[
  Choose the prefix and possible one-coordinate environment from Lemma 59 and fix all their primes. Build the odd address profile disjoint from them, with $B = L$ to every prefix block. The alternatives at a simple pair have identical compatible outside bits against the environment. Include these stationary primes among the local-square conditions in Lemma 57.
  Since $A \( 1 \) = 0$, Lemma 56 supplies a nonempty maximal singular unit word $W$. Fix it once. It determines $U \, M \, D \, N$ before $b$ is chosen.
  Choose the maps of Lemma 61 for this fixed pair $\( N \, D \)$. Let $J_(upright("int"))$ be the direct sum of one standard $J$-block for each map, and let $G$ be the matrix obtained by stacking the maps $J b_i$. Then
  $ G^t J_(upright("int"))^(- 1) G = sum_i b_i^t J b_i = H . $
  For a given $b$, use Lemma 60 to obtain the address programs and then calibrate their support labels and diagonals by root primes.
  Lemma 49 realizes these couplings by a fixed number of primary split interface positions, with the field-linear restriction when required.
  Only now, for each actual finite address array, construct the auxiliary parameter $k$. Its support consists of the stationary prefix, its possible environment, fresh primes for the fixed number of interface positions, and one fresh root prime. Prescribe $B = L$ between the interface and the prefix blocks. In the matrix $M$ of the further block, couple the interface by zero to the path sites and by the same matrix $G$ to the word coordinates of every address copy. Keep all other bits of the simple variants identical.
  Require $h_x$ to be a local square at every interface prime for every $x$. This is compatible with the matrix entries: the rational norm bits against address primes are independently prescribable, so their coefficients against the activation forms can be made zero. Include the already chosen address root primes in these conditions; they need only rational norm bits. Treat them as additional residue places in Lemma 49. The independent matrix and norm prescriptions concern the nonroot primes, and the further norm conditions occur at disjoint root primes. Their quadratic radicals, ramified at those fresh primes, create no relation with the preceding extensions, which are unramified there. Root calibration has already made $h_x$ a local square at the prefix and environment primes.
  Choose the last root prime of $k$ to satisfy four requirements: restore the fixed total support class; make $k$ negative and split at $2 N$; make $k$ a local square at every nonroot address prime; and give the prescribed diagonals at the prefix and interface. These are simultaneous finite rational radical conditions. Their residual discriminant coordinate is compatible with a rotation, because the environment accounts for any odd simple parity of the filter and the remaining variable simple positions are paired. The arithmetic realization lemma therefore supplies the prime. All new primes can be taken fresh, so $k$ is squarefree, coprime to every $h_x$, and avoids the excluded fields. Address root primes need no splitting condition, since their invariant dimension is zero.
  These choices preserve all matrices needed for the two symbols. At every actual assignment, the address matrices for $A_0$ equal those for $A$, since the extra twist by $k$ is a local unit square at every nonroot address prime. The prefix and interface matrices also stay fixed as $x$ varies. In the tensor evaluations used in Equation (9.1), aggregate roots preserve these same diagonal choices.
  At zero, the further block is just the interface and has invertible matrix $J_(upright("int"))$. Equation (9.1) therefore gives
  #[#set math.equation(numbering: n => "(9.5)")
   $ A_0 \( \| k \| \) = 1 . $ <eq:sa:auxiliary-unit>]
  At a nonzero address, eliminate the invertible paths. There remains one copy of $M$ and an odd number of copies of $N$, each coupled to the interface by $G$. Eliminate the $N$-copies in pairs: each pair has invertible matrix $N xor N$ and contributes $G N^(- 1) G^t + G N^(- 1) G^t = 0$ to the interface. Retain the one unpaired copy. Eliminating the interface then reduces invertibility of the further block to invertibility of
  $ mat(delim: "(", M + H, H; H, N + H) . $
  The substitution $\( u \, v \) = \( u' \, u' + v' \)$ transforms this matrix by congruence to
  $ mat(delim: "(", M + N, N; N, N + H) = S \( H \) \, $
  which is invertible by Lemma 61. A second application of Equation (9.1) yields
  #[#set math.equation(numbering: n => "(9.6)")
   $ A_0 \( \| k h_x \| \) = 1 quad upright("for every ") x eq.not 0 . $ <eq:sa:paired-units>]
  The odd symbol is also $1$ by saturation. The support of $k$ consists of the fixed prefix and environment, at most $dim U$ interface primes, and one root prime. Its cardinality is bounded independently of $b$. The symbol $A_0 \( \| k \| \) = 1$ gives analytic rank zero and a uniform bound for $s \( k \)$ by Proposition 19.
  For each fixed finite profile restriction, first fix its weight bound and the finite list of symbol and operator comparisons. Choose a sufficiently high actual odd-source level, and realize the address array there as above. Keeping all these address primes fixed, place the required Galois data in a common finite quotient and choose only the fresh interface primes and final root prime of $k$ to meet the remaining matrix and norm prescriptions. All the unit-symbol tests then hold at once. All constants were fixed with the symbols, prefix and word. This proves the proposition. ◻
]

=== 9.4 Completion of the odd case <completion-of-the-odd-case>

#proof[
  #emph[Completion of the proof of Theorem 54.] Apply Proposition 58. It gives $omega \( k \)$ and $s \( k \)$ bounded independently of $b$, with $E^(\( k \))$ of analytic rank zero. For $K = bb(Q) \( sqrt(k) \)$, Lemma 11 gives
  $ "corank"_(bb(Z)_2) "Sel"_(2^oo) \( E \/ K \) = 1 $
  and bounds the length of its finite quotient by the divisible part uniformly in $k$. Its hypotheses hold because $E$ is the fixed corank-one curve, the other twist has rank zero with bounded $s \( k \)$, and $omega \( k \)$ is bounded. This step does not assume finiteness of the Tate–Shafarevich group of $E$.
  For $x eq.not 0$, the two unit symbols give analytic rank one for $E^(\( h_x \))$ and analytic rank zero for $E^(\( k h_x \))$. Their coefficient comparisons also give uniform bounds
  $ j \( P_1 \( h_(*) \) \) lt.eq w \( h_x \) + C_1 \, #h(2em) v \( cal(L) \( k h_x \) \) lt.eq 2 w \( k h_x \) + C_2 . $
  Here $h_(*)$ is the fixed genus partner of the odd symbol. The genus point $P_1 \( h_(*) \)$ is formed over $bb(Q) \( sqrt(h_x h_(*)) \)$, so the point varies with $x$ while $h_(*)$ remains fixed. Coprimality gives $w \( k h_x \) = w \( k \) + w \( h_x \)$. Proposition 9 first yields $2 j \( P_(\| h_x \|) \( h_x \) \) lt.eq 4 w \( h_x \) + 2 w \( k \) + O \( 1 \)$. Since $w \( k \) lt.eq omega \( k \)$ is uniformly bounded, this becomes
  #[#set math.equation(numbering: n => "(9.7)")
   $ 2 j \( P_(\| h_x \|) \( h_x \) \) lt.eq 4 w \( h_x \) + C_3 . $ <eq:sa:heegner-upper>]
  Subtracting the nonnegative finite lengths $s \( h_x \) + s \( k h_x \)$ gives the uniform upper bound in Theorem 10.
  We have also imposed every other hypothesis of that theorem: $K$ is imaginary and split at $2 N$; each $h_x$ is coprime to $k$; $h_0 = 1$; signed prime discriminants are activated by linear forms; the local classes at $2 N$ are fixed; and each added prime either splits in $K$ or is a root prime with $t_p = 0$. For each fixed finite cube, take a sufficiently high precision from its realization set so that all its unit-symbol tests hold at once. The constants depend only on the already fixed normalized symbols, prefix, and word, not on $b$.
  The varying-field uniformity in Theorem 10 therefore applies to these cubes of arbitrarily large dimension. It gives a simple zero at $1$ for $L \( E \, s \) L \( E^(\( k \)) \, s \)$. The second factor is nonzero by Equation (9.5), so $L \( E \, s \)$ has a simple zero. This proves the remaining case $c_2 \( E \) = 1$. ◻
]

== 10 Proof of auxiliary nonvanishing <sec:auxiliary-nonvanishing>

We prove Proposition 15. The even-sign assertion follows from Hoffstein–Luo after one preliminary twist. For the odd-sign assertion we retain the prescribed local conditions throughout a derivative first-moment calculation.

#proof[
  An odd fundamental discriminant is squarefree and congruent to $1$ modulo $4$, so $c_2$ is represented by $u_2 in { 1 \, 5 }$ modulo $8$. For odd $p in S$, choose a nonzero residue $u_p$ representing $c_p$. The Chinese remainder theorem and Dirichlet’s theorem give a prime $q in.not S union B$ satisfying
  $ q equiv sigma u_2 med \( mod med 8 \) \, #h(2em) sigma q equiv u_p med \( mod med p \) quad \( p in S \, med p eq.not 2 \) . $
  Then $D_0 = sigma q$ is an odd fundamental discriminant in the prescribed filter. Put $A = E^(\( D_0 \))$ and let $N_A$ be its conductor. Thus $epsilon \( A \) = 1$.
  The theorem of Hoffstein–Luo #cite(label("HoffsteinLuo1997")) pp. 435–436 gives infinitely many odd fundamental discriminants $h$ such that
  $ L \( A^(\( h \)) \, 1 \) eq.not 0 \, #h(2em) omega \( \| h \| \) lt.eq 4 \, $
  and $chi_h \( p \) = 1$ at every prime in the fixed finite set consisting of $S union B union { q }$ and the prime divisors of $N_A$. The twisting formula for the root number gives
  $ 1 = epsilon \( A^(\( h \)) \) = epsilon \( A \) chi_h \( - N_A \) = "sign" \( h \) \, $
  so $h > 0$. For odd $p$ the condition $chi_h \( p \) = 1$ says that $h$ is a unit square in $bb(Q)_p$. At $2$, odd fundamentality and $chi_h \( 2 \) = 1$ give $h equiv 1 med \( mod med 8 \)$, which has the same meaning. Since $q divides.not h$, the product $D = D_0 h$ is squarefree and congruent to $1$ modulo $4$. It retains the prescribed sign and squareclasses and avoids $B$. Finally,
  $ E^(\( D \)) tilde.eq A^(\( h \)) \, #h(2em) omega \( \| D \| \) = 1 + omega \( h \) lt.eq 5 . $
  Distinct choices of $h$ give distinct $D$. ◻
]

=== 10.1 An odd-sign witness in a fixed progression <odd:fixed-progression>

We retain the modulus of the local conditions throughout the first-moment calculation. Iwaniec’s derivative moment #cite(label("Iwaniec1990")) Theorem on p. 367 and Sections 6–10 treats the negative-discriminant split family. The following argument allows any fixed admissible progression. It makes no uniformity assertion as that progression varies.

#thm([Lemma 10.1.])[
  (Odd first moment).  #emph[Let $f$ be the weight-two newform of an elliptic curve of conductor $N$, with its $L$-function normalized to have center $1 \/ 2$. Fix $H$ divisible by $8$ and $N$, a reduced class $a med \( mod med H \)$, and $sigma in { 1 \, - 1 }$ with $sigma a equiv 1 med \( mod med 4 \)$. Suppose the twists with $n > 0$ squarefree and $n equiv a med \( mod med H \)$ have root number $- 1$. For every nonnegative, nonzero $Phi in C_c^oo \( \( 1 \, 2 \) \)$, there are $c > 0$, $c_1 in bb(R)$, and an absolute $eta > 0$ such that 
#[#set math.equation(numbering: n => "(10.1)")
 $ sum_(n > 0 med upright("squarefree")\
n equiv a med \( H \)) L' \( 1 \/ 2 \, f ⊗ chi_(sigma n) \) Phi \( n \/ X \) = c X log X + c_1 X + O_(f \, H \, a \, sigma \, Phi) \( X^(1 - eta) \) . $ <odd:moment>]

 Consequently this progression contains arbitrarily large $n$ whose twists have a simple central zero.]
] <nv:odd-first-moment>

#proof[
  Write $L \( s \, f \) = sum_(m gt.eq 1) lambda \( m \) m^(- s)$, so $\| lambda \( m \) \| lt.eq tau \( m \)$, where $tau$ is the divisor function, and put $Q = sqrt(N) \/ \( 2 pi \)$. In estimates below, constants may depend on the fixed data in the Lemma; all unspecified power exponents are absolute. The proof separates two issues: preserving the fixed progression while removing the squarefree condition, and controlling the frequencies after Poisson summation. The zero frequency will give a positive main term of order $X log X$; the other frequencies and the discarded square divisors must together have a power-saving bound. We keep the modulus $H$ fixed throughout these steps. Set
  $ V \( y \) = frac(1, 2 pi i) integral_(\( 2 \)) e^(z^2) Gamma \( 1 + z \) y^(- z) frac(d z, z^2) . $
  The conductor of the twist is $N n^2$. Its odd functional equation gives
  #[#set math.equation(numbering: n => "(10.2)")
   $ L' \( 1 \/ 2 \, f ⊗ chi_(sigma n) \) = 2 sum_(m gt.eq 1) frac(lambda \( m \) chi_(sigma n) \( m \), sqrt(m)) V (frac(m, Q n)) . $ <odd:afe>]
  Indeed, shift the defining completed integral across its double pole and use the functional equation. The central value is zero, so the derivative of the completion contributes no additional term. Use the right side of Equation (10.2) to define $cal(A) \( n \)$ also for nonsquarefree $n equiv a med \( mod med H \)$.
  ===== 10.1.1 Large square divisors. <large-square-divisors.>
  We first record the precise large-sieve input. For every $rho > 0$ and fixed $0 < delta < 1 \/ 4$,
  #[#set math.equation(numbering: n => "(10.3)")
   $ sum_(0 < t lt.eq Z med upright("squarefree")\
sigma t med upright("fundamental") \, med \( t \, 2 N \) = 1) \| L \( 1 \/ 2 + delta + i v \, f ⊗ chi_(sigma t) \) \|^2 lt.double_(f \, rho \, delta) Z^(1 + rho) \( 1 + \| v \| \)^(C_(rho \, delta)) . $ <odd:second-moment>]
  To justify this consequence of the quadratic large sieve, its form in #cite(label("HeathBrown1995")) Theorem 1 is
  $ sum_(t lt.eq Z med upright(o d d \, s q u a r e f r e e)) lr(|sum_(u lt.eq U med upright(o d d \, s q u a r e f r e e)) b_u (t / u)|)^2 lt.double_epsilon.alt \( Z U \)^epsilon.alt \( Z + U \) sum_u \| b_u \|^2 . $
  Quadratic reciprocity permits either orientation of the symbol after separating classes modulo $4$. In a Dirichlet polynomial with coefficients $lambda \( m \) m^(- 1 \/ 2)$, write $m = u r^2$, $u$ squarefree. For each $r$, $chi_(sigma t) \( r^2 \)$ restricts $t$ to $\( t \, r \) = 1$; discard that restriction only after taking absolute squares. Since $\| lambda \( u r^2 \) \| lt.eq tau \( u \) tau \( r^2 \)$, Minkowski’s inequality bounds the square root of the moment by
  #[#set math.equation(numbering: n => "(10.4)")
   $ \( Z U \)^(O \( epsilon.alt \)) sum_(r lt.eq sqrt(U)) sqrt(Z + U \/ r^2) / r lt.double \( Z U \)^(O \( epsilon.alt \)) \( sqrt(Z) + sqrt(U) \) . $ <odd:square-index-bound>]
  The powers of primes dividing $2 N$ contribute convergent geometric sums. On a dyadic interval $t asymp T$, the approximate functional equation has length $U lt.double_f T \( 1 + \| v \| \)^C$, apart from rapidly decreasing tails. The main sum’s additional factor $m^(- delta)$ improves partial summation. The dual sum loses at most $U^delta$ in coefficients, but its functional-equation multiplier contributes $T^(- 2 delta)$, up to a fixed power of $1 + \| v \|$. Thus it incurs no positive power of $T$. Mellin inversion separates the smooth conductor weights; the gamma factors give integrable decay in the Mellin variables. Applying Equation (10.4) with sufficiently small $epsilon.alt$, and summing dyadic intervals, proves Equation (10.3).
  Expand $mu^2 \( n \) = sum_(d^2 divides n) mu \( d \)$ and retain $d lt.eq Y$, where $1 lt.eq Y lt.eq sqrt(X)$. The omitted contribution is
  #[#set math.equation(numbering: n => "(10.5)")
   $ O_rho \( X^(1 + rho) \/ Y \) . $ <odd:square-tail>]
  Here are the details for the nonsquarefree terms. Write $n = t v^2$ with $t$ squarefree. An omitted term has $v > Y$, with at most $tau \( v \)$ choices of $d$. Also $sigma t$ is fundamental, $\( t v \, 2 N \) = 1$, and
  $ chi_(sigma n) \( m \) = chi_(sigma t) \( m \) upright(bold(1))_(\( m \, v \) = 1) . $
  On a Mellin line $Re z = delta > 0$, the series defining $cal(A) \( t v^2 \)$ therefore uses
  $ L \( 1 \/ 2 + z \, f ⊗ chi_(sigma t) \) product_(p divides v) (1 - frac(lambda \( p \) chi_(sigma t) \( p \), p^(1 \/ 2 + z)) + frac(chi_(sigma t) \( p \)^2, p^(1 + 2 z))) . $
  The product is $O_epsilon.alt \( v^epsilon.alt \)$. By Cauchy’s inequality and Equation (10.3), the sum of the absolute $L$-values over $t lt.eq 2 X \/ v^2$ is $O \( \( X \/ v^2 \)^(1 + epsilon.alt) \( 1 + \| Im z \| \)^C \)$. The remaining Mellin factors are bounded by $O \( X^delta \)$ times a rapidly decreasing function of $Im z$. Choose $delta$ and $epsilon.alt$ sufficiently small in terms of $rho$. Absorbing the divisor count and these small powers gives $X^(1 + rho) sum_(v > Y) v^(- 2) lt.double X^(1 + rho) \/ Y$, as claimed. The double pole in the kernel is harmless on this fixed positive line.
  ===== 10.1.2 Poisson summation. <poisson-summation.>
  For $\( d \, H \) = 1$ put $J = d^2$ and $c_J equiv a J^(- 1) med \( mod med H \)$. Let $T \( J \)$ be the sum of $cal(A) \( n \) Phi \( n \/ X \)$ over $n equiv a med \( mod med H \)$ with $J divides n$, without a squarefree restriction. Writing $m = m_1 q$ with $m_1 divides H^oo$ and $\( q \, H \) = 1$, put $kappa \( m_1 \) = chi_(sigma a) \( m_1 \)$ and
  $ G_nu \( q \) = sum_(y med mod med q) (y / q) e \( nu y \/ q \) \, #h(2em) W \( z \, R \) = integral_0^oo Phi \( x \) V (frac(z, Q x)) e \( - R x \) thin d x \, $
  where $e \( x \) = e^(2 pi i x)$. Poisson summation gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ T \( J \) =  & frac(2 X, H J) sum_(m_1 divides H^oo) frac(lambda \( m_1 \) kappa \( m_1 \), sqrt(m_1)) sum_(\( q \, H \) = 1) frac(lambda \( q \), q^(3 \/ 2)) (frac(sigma J H, q))\
 & #h(9mm)  dot.op sum_(nu in bb(Z)) G_nu \( q \) e \( nu c_J macron(q) \/ H \) W (frac(m_1 q, X) \, frac(nu X, H J q)) \, $ <odd:poisson>]
  where $q macron(q) equiv 1 med \( mod med H \)$ and $G_nu \( 1 \) = 1$. For clarity, the Chinese remainder theorem evaluates the finite sum as
  $ sum_(x med mod med H q\
x equiv c_J med \( H \)) (x / q) e \( nu x \/ \( H q \) \) = e \( nu c_J macron(q) \/ H \) (H / q) G_nu \( q \) . $
  Multiplication by $\( sigma J \/ q \)$ yields Equation (10.6); this factor vanishes when $\( q \, J \) > 1$.
  ===== 10.1.3 The zero frequency. <the-zero-frequency.>
  The Gauss sum $G_0 \( q \)$ is zero unless $q$ is a square, when it is $phi \( q \)$. Define
  $ H_p \( z \) = 1 + \( 1 - p^(- 1) \) sum_(r gt.eq 1) lambda \( p^(2 r) \) p^(- r \( 1 + 2 z \)) \, #h(2em) F_J \( z \) = product_(p divides.not H J) H_p \( z \) \, $
  $ L_H \( z \) = sum_(m_1 divides H^oo) lambda \( m_1 \) kappa \( m_1 \) m_1^(- 1 \/ 2 - z) \, #h(2em) hat(Phi)_0 \( z \) = integral_0^oo Phi \( x \) x^z thin d x . $
  Mellin inversion expresses the zero-frequency contribution as
  #[#set math.equation(numbering: n => "(10.7)")
   $ T_0 \( J \) = frac(2 X, H J) frac(1, 2 pi i) integral_(\( 2 \)) e^(z^2) Gamma \( 1 + z \) \( Q X \)^z hat(Phi)_0 \( z \) L_H \( z \) F_J \( z \) frac(d z, z^2) . $ <odd:zero-integral>]
  At a good prime, let $alpha_p beta_p = 1$ and $\| alpha_p \| = \| beta_p \| = 1$. The identity
  $ sum_(r gt.eq 0) lambda \( p^(2 r) \) x^r = frac(1 + x, \( 1 - alpha_p^2 x \) \( 1 - beta_p^2 x \)) $
  shows that $H_p \( z \)$ is the symmetric-square Euler factor at $1 + 2 z$ times a polynomial $1 + O \( p^(- 2 - 4 Re z) + p^(- 2 - 2 Re z) \)$. The correction product converges absolutely near $Re z gt.eq - 1 \/ 16$. To omit a prime dividing $J$, omit its correction factor and insert an inverse symmetric-square Euler polynomial; this introduces no poles at zeros of $H_p$. These omitted factors cost at most $J^B$ on that strip. The finite Euler product $L_H$ is holomorphic there. Symmetric-square continuation, its functional equation, and polynomial strip bounds now allow the shift to $Re z = - 1 \/ 16$, with error
  #[#set math.equation(numbering: n => "(10.8)")
   $ T_0 \( J \) = R_J \( X \) + O \( J^B X^(1 - 1 \/ 16) \) \, $ <odd:zero-error>]
  where $R_J \( X \)$ is the residue of the integrand in Equation (10.7), including its factor $2 X \/ \( H J \)$. For this analytic input see #cite(label("GelbartJacquet1978")) Theorem 9.3 and Remark 9.9; in the CM case the untwisted symmetric square is a product of nontrivial Dirichlet and Hecke-character $L$-functions, so the same continuation holds near $1$.
  The sum of the residues, with $d$ extended to infinity, has coefficient function
  $ M \( z \) = e^(z^2) Gamma \( 1 + z \) Q^z hat(Phi)_0 \( z \) L_H \( z \) product_(p divides.not H) #scale(x: 120%, y: 120%)[\(] H_p \( z \) - p^(- 2) #scale(x: 120%, y: 120%)[\)] . $
  The product is interpreted by its symmetric-square factorization and an absolutely convergent correction. It is holomorphic near zero. Moreover $M \( 0 \) > 0$. Indeed
  $ F_p^(upright("ev")) := frac(1 + p^(- 1), \( 1 - alpha_p^2 \/ p \) \( 1 - beta_p^2 \/ p \)) > 0 \, #h(2em) H_p \( 0 \) = p^(- 1) + \( 1 - p^(- 1) \) F_p^(upright("ev")) > p^(- 1) . $
  All the fixed local factors in $L_H \( 0 \)$ are positive, and $L \( 1 \, "sym"^2 f \) > 0$ by the Rankin–Selberg residue formula. The remaining correction factors are positive and form a convergent product. The full residue is therefore
  #[#set math.equation(numbering: n => "(10.9)")
   $ frac(2 X, H) #scale(x: 120%, y: 120%)[\(] M \( 0 \) log X + M' \( 0 \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) c = frac(2 M \( 0 \), H) > 0 . $ <odd:residue>]
  Extending the residue sum costs $O_rho \( X^(1 + rho) \/ Y \)$: its terms contain $d^(- 2) product_(p divides d) H_p \( 0 \)^(- 1)$, and this product, as well as its differentiated version, is $O_epsilon.alt \( d^epsilon.alt \( 1 + log d \) \)$. The resulting $d^(- 2 + epsilon.alt)$ tail also justifies differentiating the residue sum.
  ===== 10.1.4 The nonzero frequencies. <the-nonzero-frequencies.>
  The zero frequency has now supplied the positive main term. We next bound the remaining frequencies uniformly in the square divisor $J$ by a fixed power of $J$, so that summation over the retained square divisors will preserve a power saving in $X$. We prove the bound
  #[#set math.equation(numbering: n => "(10.10)")
   $ T_(eq.not 0) \( J \) lt.double J^B X^(7 \/ 8) . $ <odd:offdiagonal>]
  For odd $q$, set $epsilon.alt_q = 1$ or $i$ according as $q equiv 1$ or $3 med \( mod med 4 \)$, and $tilde(G)_nu \( q \) = epsilon.alt_q^(- 1) G_nu \( q \)$. Quadratic reciprocity makes $tilde(G)_nu$ multiplicative in $q$. As $4 divides H$, the phase $epsilon.alt_q e \( nu c_J macron(q) \/ H \)$ is a function on $\( bb(Z) \/ H bb(Z) \)^times$. Expand it in Dirichlet characters $psi med \( mod med H \)$; every expansion coefficient has absolute value at most one. For $nu eq.not 0$, consider
  $ D_(psi \, J \, nu) \( s \) = sum_(\( q \, H \) = 1) frac(lambda \( q \), q^s) frac(tilde(G)_nu \( q \), sqrt(q)) (frac(sigma J H, q)) psi \( q \) . $
  At $p divides.not 2 H J nu$, its local factor is $1 + lambda \( p \) xi \( p \) p^(- s)$, where $xi \( q \) = psi \( q \) \( sigma J H nu \/ q \)$ is a Dirichlet character. Multiplication by the inverse $upright("GL")_2$ Euler factor leaves
  $ 1 + \( 1 - lambda \( p \)^2 \) xi \( p \)^2 p^(- 2 s) + lambda \( p \) xi \( p \)^3 p^(- 3 s) . $
  These factors converge absolutely for $Re s > 1 \/ 2$.
  The exceptional primes cause only a fixed power loss. For an odd prime $p$, put $v = v_p \( nu \)$. Direct summation over residue lifts gives
  $ G_nu \( p^r \) = cases(delim: "{", phi \( p^r \) \, & r upright(" even") \, med r lt.eq v \,, - p^(r - 1) \, & r upright(" even") \, med r = v + 1 \,, epsilon.alt_p p^(r - 1 \/ 2) (frac(nu \/ p^(r - 1), p)) \, & r upright(" odd") \, med r = v + 1 \,, 0 \, & upright("otherwise") .) $
  For even $r$ this is the Ramanujan sum. For odd $r$, the sum of the lifts vanishes unless $p^(r - 1) divides nu$, and the primitive quadratic Gauss sum then gives the formula. Thus the local sum is a polynomial; on $Re s gt.eq 3 \/ 4$ its absolute value is at most $sum_(r gt.eq 0) \( r + 1 \) p^(- r \/ 4) lt.eq C_0$. The inverse Euler polynomial is also bounded absolutely. Primes dividing $J$ remove the local sum altogether. Passing to the primitive character underlying $xi$ introduces only such inverse Euler polynomials. Hence
  $ D_(psi \, J \, nu) \( s \) = L \( s \, f ⊗ xi^(upright("prim")) \) C_(psi \, J \, nu) \( s \) \, $
  where $C_(psi \, J \, nu)$ is holomorphic for $Re s > 1 \/ 2$ and bounded on $Re s gt.eq 3 \/ 4$ by $\( 2 J \| nu \| \)^C$. Indeed the exceptional-prime cost is at most $C_1^(omega \( J nu \))$, and the other corrections have summable $O \( p^(- 3 \/ 2) \)$ errors there. The conductor of $xi^(upright("prim"))$ is at most $4 H J \| nu \|$. The twisted cusp-form $L$-function is entire; its functional equation and polynomial strip bounds therefore give
  #[#set math.equation(numbering: n => "(10.11)")
   $ \| D_(psi \, J \, nu) \( 3 \/ 4 + i t \) \| lt.double_(f \, H) \( J \| nu \| \)^C \( 1 + \| t \| \)^C . $ <odd:gauss-strip>]
  The exponents are absolute because the degree and weight are fixed.
  It remains to sum these bounds without losing the power saving. The kernel and integration by parts in $x$ give, for fixed $r \, s$ and every $K > 0$,
  #[#set math.equation(numbering: n => "(10.12)")
   $ \| \( z partial_z \)^r \( R partial_R \)^s W \( z \, R \) \| lt.double_(r \, s \, K) \( 1 + z \)^(- K) \( 1 + \| R \| \)^(- K) \( 1 + \| log z \| \) . $ <odd:weight-decay>]
  The logarithm accounts for the double pole when $z$ tends to zero. On the actual sums $z gt.eq X^(- 1)$. For a fixed small $rho > 0$, insert smooth cutoffs $z lt.double X^rho$ and $\| R \| lt.double X^rho$. The discarded part is negligible: use $\| G_nu \( q \) \| lt.eq q$ and
  $ sum_(nu in bb(Z)) \( 1 + \| nu \| X \/ \( H J q \) \)^(- K) lt.double_H 1 + J q \/ X $
  to obtain a polynomial absolute majorant in $X \, J$ for Equation (10.6). More explicitly, its absolute value is $O_epsilon.alt \( X^(3 \/ 2 + epsilon.alt) log X \)$, uniformly for $J gt.eq 1$: the $q$-sums contribute $\( X \/ m_1 \)^(1 \/ 2 + epsilon.alt) + \( J \/ X \) \( X \/ m_1 \)^(3 \/ 2 + epsilon.alt)$, and the remaining $m_1 divides H^oo$ sums converge. For $z > 1$, absorb the positive logarithm into an arbitrarily small power of $z$ in this calculation. On either discarded tail, increasing $K$ in Equation (10.12) supplies an arbitrarily large factor $X^(- rho K)$. The retained nonzero-frequency range satisfies
  #[#set math.equation(numbering: n => "(10.13)")
   $ m_1 q lt.double X^(1 + rho) \, #h(2em) 0 < \| nu \| lt.double_H J X^(2 rho) \, #h(2em) q gt.double_H X^(1 - rho) \/ J . $ <odd:ranges>]
  Partition the $q$-sum into smooth segments $q asymp T$. By Equation (10.12), the finitely many derivative norms needed for Mellin inversion of the segment’s weight are $O \( X^(C' rho) \)$, uniformly in $m_1 \, J \, nu \, T$. Mellin inversion uses $D_(psi \, J \, nu) \( 1 + s \) T^s$. Shift its contour to $Re s = - 1 \/ 4$; the factorization above shows that no pole is crossed. Equation (10.11) and the vertical decay of the weight’s Mellin transform give
  #[#set math.equation(numbering: n => "(10.14)")
   $ sum_q frac(lambda \( q \), q) frac(tilde(G)_nu \( q \), sqrt(q)) (frac(sigma J H, q)) psi \( q \) W_(*) \( q \/ T \) lt.double \( J \| nu \| \)^C X^(C' rho) T^(- 1 \/ 4) . $ <odd:dyadic>]
  Here $W_(*)$ includes the dyadic and cutoff factors and both arguments of the original weight; their logarithmic derivatives are controlled by Equation (10.12). The sum over $m_1$ is bounded since
  $ sum_(m_1 divides H^oo) frac(\| lambda \( m_1 \) \|, sqrt(m_1)) lt.eq product_(p divides H) \( 1 - p^(- 1 \/ 2) \)^(- 2) < oo . $
  Equation (10.13) bounds the dyadic sum of $T^(- 1 \/ 4)$ by $O_H \( J^(1 \/ 4) X^(- 1 \/ 4 + rho \/ 4) \)$, even if its formal lower endpoint is below one. Also
  $ sum_(0 < \| nu \| lt.double_H J X^(2 rho)) \( J \| nu \| \)^C lt.double_H J^(2 C + 1) X^(2 \( C + 1 \) rho) . $
  Multiplying these estimates by $X \/ J$ from Equation (10.6) proves $T_(eq.not 0) \( J \) lt.double J^B X^(3 \/ 4 + C'' rho)$. Choose $rho$ absolutely small enough that $C'' rho lt.eq 1 \/ 8$. This proves Equation (10.10).
  ===== 10.1.5 Conclusion. <conclusion.>
  Sum the zero- and nonzero-frequency errors over $d lt.eq Y$, with $J = d^2$. Together with the large-square and residue tails, the total error is
  $ O (Y^(2 B + 1) X^(1 - kappa) + X^(1 + rho) \/ Y) \, #h(2em) kappa = 1 \/ 16 \, $
  after enlarging $B$. Choose an absolute $delta_0 > 0$ with $\( 2 B + 1 \) delta_0 < kappa \/ 2$, put $Y = X^(delta_0)$, and choose the tail exponent $0 < rho < delta_0 \/ 4$. Both errors are $O \( X^(1 - eta) \)$ for an absolute $eta > 0$. Equation (10.9) proves Equation (10.1). Its leading coefficient is positive, so some derivative is nonzero in every sufficiently large dyadic interval. The odd functional equation already forces the central value to vanish, proving the final assertion. ◻
]

#proof[
  Choose $H$ divisible by $8 N$ and by all primes in $S union B$. The prescribed squareclasses and sign determine a reduced class $a med \( mod med H \)$ with $sigma a equiv 1 med \( mod med 4 \)$, by the Chinese remainder theorem. At a prime in $B \\ S$, choose any nonzero residue. Then every positive squarefree $n equiv a med \( mod med H \)$ gives an odd fundamental discriminant $D = sigma n$ in the prescribed filter and prime to every member of $B$. Lemma 62 supplies arbitrarily large such $n$ with $L' \( E^(\( D \)) \, 1 \) eq.not 0$. ◻
]

== 11 Transfer on a binary cube <sec:binary-algebra>

Both analytic arguments will produce one determinant coordinate at each vertex of a binary cube. The following algebra transfers a bounded valuation at every nonzero vertex to the zero vertex. Its essential feature is that the required dimension depends on a bounded number of coefficients, even when the family involves arbitrarily many primes.

Put $Lambda = bb(Z)_2 \[ \[ t \] \]$ and $O = hat(Lambda_(\( 2 \)))$. Let $G tilde.eq \( bb(Z) \/ 2 bb(Z) \)^b$ and $R = Lambda \[ G \]$. Index the sign homomorphisms $G arrow.r { plus.minus 1 }$ by $x in bb(F)_2^b$, with $x = 0$ the augmentation. For an element or matrix over $O \[ G \]$, a subscript $x$ denotes evaluation at this character. The proofs first control Laurent coefficients, then clear determinant denominators, and finally use the parity of the number of solutions of low-degree equations on the cube.

#thm([Lemma 11.1.])[
  (Laurent expansions).  #emph[For $M gt.eq 1$, 
$ O \/ 2^M O tilde.eq \( bb(Z) \/ 2^M bb(Z) \) \( \( t \) \) . $

 Thus an element of $O$ has a unique expansion $sum_(n in bb(Z)) a_n t^n$ with $a_n in bb(Z)_2$ and $v \( a_n \) arrow.r oo$ as $n arrow.r - oo$. Its $O$-valuation is $min_n v \( a_n \)$.]
] <lem:h:laurent-expansions>

#proof[
  If $s in Lambda \\ \( 2 \)$, write $s = t^h v_1 + 2 w_1$, with $v_1 in Lambda^times$ and $w_1 in Lambda$. Modulo $2^M$ its inverse is a geometric expansion of length $M$ in $2 w_1 \/ \( t^h v_1 \)$. It is a Laurent series with finite negative support. Conversely every Laurent series with finite negative support lies in the localization of $Lambda$ modulo $2^M$, since $t$ is invertible there. Taking inverse limits proves the expansion statement. Reduction modulo successive powers of $2$ proves the valuation formula. ◻
]

#thm([Lemma 11.2.])[
  (A uniform pole bound for Schur elimination).  #emph[Let $A_1 \, dots.h \, A_m$ be square matrices over $Lambda$ with nonzero residual determinants and $"ord"_t \( overline(det A_j) \) lt.eq h$. Put $A = "diag" \( A_1 \, dots.h \, A_m \)$. If $B = A + 2 E_1$ with $E_1$ a matrix over $Lambda$, then $B$ is invertible over $O$. Modulo $2^M$, every entry of $B^(- 1)$ has no powers below $- M h$, independently of $m$ and of the matrix sizes. The same bound holds for a Schur complement $D = P - Q B^(- 1) S$ when $P \, Q \, S$ have entries in $Lambda$.]
  #emph[In particular, suppose a block over $R$ augments to $A$. It is invertible over $O \[ G \]$, and the assertion applies uniformly at all sign evaluations. If the lower off-diagonal block $S$ augments to zero, the Schur complement augments to the old block $P$.]
] <lem:h:bounded-poles>

#proof[
  Write $det A_j = t^(h_j) v_j + 2 w_j$, where $h_j lt.eq h$, $v_j in Lambda^times$, and $w_j in Lambda$. Put
  $ C_j = frac("adj" \( A_j \), t^(h_j) v_j) \, #h(2em) C = "diag" \( C_1 \, dots.h \, C_m \) . $
  Every entry of $C$ has pole at most $h$. We have $B C = 1 + 2 F_1$, with every entry of $F_1$ having pole at most $h$. Consequently
  $ B^(- 1) equiv C sum_(j = 0)^(M - 1) \( - 2 F_1 \)^j med \( mod med 2^M \) . $
  The $j$th summand has pole at most $\( j + 1 \) h lt.eq M h$. The number of summands in a matrix product does not increase a valuation or pole bound. Multiplication by power-series matrices likewise introduces no negative powers. This proves the first assertion.
  The ring $O \[ G \]$ is local with maximal ideal generated by $2$ and the augmentation ideal of $G$. The residual determinant of the proposed block is that of $A$, a unit over $bb(F)_2 \( \( t \) \)$, so the block is invertible. Each sign evaluation differs from augmentation by a matrix divisible by $2$ with entries in $Lambda$. Apply the first assertion to it. The final assertion is the Schur formula with $S_0 = 0$. ◻
]

#thm([Lemma 11.3.])[
  (A bounded clearing factor).  #emph[Let $D$ be a based bounded complex of finite free $O \[ G \]$-modules, of total graded rank at most $r$, whose augmentation $D_0$ is a complex over $Lambda$. Suppose that the rational specialization of $D_0$ at $t = 0$ has one of the following cohomology patterns:]
  + #emph[dimension one in degrees one and two, and zero elsewhere;]
  + #emph[dimension two in degree one, and zero elsewhere.]
  #emph[Suppose that the total torsion length in the integral specialized cohomology is at most $h_1$.]
  #emph[In case (i), take an integral degree-one cycle $z$ and a closed functional $lambda in 2^(- a_0) \( D^2 \)^(*)$, and suppose each character constituent over the fraction field of $O$ is either acyclic or has pattern (i). Let $u_x$ be the determinant tensor of their cohomology classes, with value zero in the acyclic case. In case (ii), take two cycles whose denominator exponents sum to at most $a_0$, suppose each constituent has pattern (ii), and let $u_x$ be their wedge determinant coordinate. One may multiply these coordinates by any one element $eta in O \[ G \]$.]
  #emph[Then there are $f \, d in O \[ G \]$ with $d_x = f_x u_x$ at every character, such that $f$ is $2^(a_0)$ times a polynomial of bounded degree in the differential entries of $D$, the degree depending only on $r$. Moreover 
$ f_0 in Lambda \, #h(2em) f_0 \( 0 \) eq.not 0 \, #h(2em) v \( f_0 \( 0 \) \) lt.eq C \( r \, h_1 \, a_0 \) . $

 If, at every fixed precision, the entries of $D_x$ have a uniform bound on negative Laurent support, then so do the $f_x$. No such assertion is required for $d_x$, for the cycles, or for $eta$.]
] <lem:h:pivot-clearing>

#proof[
  Over $bb(Z)_2$, put the specialized complex into a sum of free cohomology terms and one-dimensional two-term complexes with differentials $2^(a_j)$, by elementary-divisor decomposition. The sum of the positive $a_j$ is at most $h_1$. Lift the constant integral basis changes to $D$. Cancel the same pivot positions formally, retaining their pivot numerators as denominators. The number of operations is bounded by $r$. Each pivot and basis change is rational in the differential entries. Let $P_1$ be a product of sufficiently high powers of the successive pivot numerators so that every denominator in these changes and in the determinant comparison divides $P_1$. Its degree is bounded in terms of $r$; its specialization $P_(1 \, 0) \( 0 \)$ is nonzero with valuation bounded in terms of $r \, h_1$. Increase the powers once more if needed to give all final expressions the same denominator.
  Over $O \[ G \] \[ 1 \/ P_1 \]$, case (i) leaves a complex $\[ O \[ G \] arrow.r^delta O \[ G \] \]$ in degrees one and two. Let $alpha \, beta$ be the projected cycle and closed functional. Their determinant tensor, including the cancelled-pivot determinant factor, is a rational expression in $D \, z \, 2^(a_0) lambda$. If a field constituent has $delta eq.not 0$, the cycle identity $delta alpha = 0$ gives $alpha = 0$, so the same expression yields the stipulated zero coordinate. In case (ii) the remaining complex is $O \[ G \]^2 \[ - 1 \]$ and its coordinate is the determinant of the two projected cycles times the pivot determinant factor. In either case, after denominator clearing, for every constituent on which $P_(1 \, x) eq.not 0$ we have
  $ u_x = 2^(- a_0) eta_x Q_(1 \, x) \/ P_(1 \, x) \, #h(2em) Q_1 in O \[ G \] . $
  Set $f = 2^(a_0) P_1^2$ and $d = eta P_1 Q_1$. This gives $d_x = f_x u_x$ on those constituents. Where a pivot numerator first vanishes, $P_(1 \, x) = 0$, and both sides of the cleared identity are zero. Thus the identity holds on every character. Since $f$ involves only the bounded number of differential entries in the pivot calculation, its degree, augmentation valuation and pole bounds are as asserted. The factor $eta$ has been placed in $d$, never in $f$. ◻
]

The preceding lemmas isolate the denominator problem: after eliminating new blocks, the clearing factor uses a complex of bounded size. The remaining task is to match finitely many coefficients at zero and at some nonzero vertex. The next lemma gives that match once the cube has sufficiently many coordinates.

#thm([Lemma 11.4.])[
  (Finite coefficient congruences).  #emph[Let $A_1 \( x \) \, dots.h \, A_q \( x \) in bb(Z)_2$ each be one specified Laurent coefficient of the evaluation of an element of $O \[ G \]$. If 
$ b > q \( 2^(M - 1) - 1 \) \, $

 there is $x eq.not 0$ such that $A_i \( x \) equiv A_i \( 0 \) med \( mod med 2^M \)$ for every $i$.]
] <lem:h:boolean-coefficients>

#proof[
  For one coefficient write
  $ A \( x \) = sum_(g in G) a_g \( - 1 \)^(g dot.op x) = sum_(S subset.eq { 1 \, dots.h \, b }) c_S x_S \, #h(2em) x_S = product_(i in S) x_i \, #h(2em) 2^(\| S \|) divides c_S . $
  The last divisibility follows by expanding each sign as a product of $1 - 2 x_i$. The $j$th binary digit of $z in bb(Z)_2$ is $delta_j \( z \) = binom(z, 2^j) med mod med 2$; this holds on nonnegative integers by binary expansion and then on $bb(Z)_2$ by continuity. In the ring of functions on the binary cube with coefficients in $bb(F)_2 \[ \[ Z \] \]$,
  $ \( 1 + Z \)^(A \( x \)) = \( 1 + Z \)^(c_diameter) product_(S eq.not diameter) (1 + x_S #scale(x: 120%, y: 120%)[\(] \( 1 + Z \)^(c_S) - 1 #scale(x: 120%, y: 120%)[\)]) . $
  The nonconstant factor indexed by $S$ starts at degree at least $2^(\| S \|)$ in $Z$. A term contributing to $Z^(2^j)$, for $j gt.eq 1$, therefore has Boolean degree at most
  $ sum_S \| S \| lt.eq sum_S 2^(\| S \| - 1) lt.eq 2^(j - 1) . $
  The zeroth digit is constant. The congruences in the statement are thus equations over $bb(F)_2$ of total degree at most $q sum_(j = 1)^(M - 1) 2^(j - 1) = q \( 2^(M - 1) - 1 \)$, all vanishing at zero. For completeness, the number of their common zeros is even: modulo two it is the sum over the cube of the product of $1 + Q$ over all defining equations $Q$. Every monomial has degree below $b$, hence omits a variable and sums to zero. This is the Chevalley–Warning argument #cite(label("Chevalley1935")) #cite(label("Warning1935")). The zero solution therefore has a nonzero companion. ◻
]

We now apply these coefficient congruences to the cleared identity $d_x = f_x u_x$. Only the bounded negative support of $f_x$ is prescribed; for $d_x$ we will match its constant coefficient alone. This distinction keeps the required number of congruences independent of the numerator’s other coefficients.

#thm([Lemma 11.5.])[
  (Transfer through a bounded clearing factor).  #emph[Let $f \, d in O \[ G \]$ and let $u_x in Lambda \[ 1 \/ 2 \]$ satisfy $d_x = f_x u_x$ at each character. Suppose $f_0 in Lambda$ and $c_0 = v \( f_0 \( 0 \) \) < oo$. Fix $M > c_0$, and suppose every $f_x med mod med 2^M$ has no powers below $- L \( M \)$. If 
#[#set math.equation(numbering: n => "(11.1)")
 $ b > \( L \( M \) + 2 \) \( 2^(M - 1) - 1 \) \, $ <eq:h:cube-threshold>]

 some $x eq.not 0$ satisfies 
#[#set math.equation(numbering: n => "(11.2)")
 $ v #scale(x: 120%, y: 120%)[\(] u_x \( 0 \) - u_0 \( 0 \) #scale(x: 120%, y: 120%)[\)] gt.eq M - 2 c_0 . $ <eq:h:central-transfer>]

 Consequently, when $c_0$ and each $L \( M \)$ have bounds independent of the family, a uniform upper bound $v \( u_x \( 0 \) \) lt.eq B_1$ at all nonzero vertices forces $v \( u_0 \( 0 \) \) lt.eq B_1$ for all sufficiently large $b$. The base value itself is allowed to vary with the family.]
] <lem:h:boolean-transfer>

#proof[
  Apply Lemma 66 to the coefficients of $f_x$ in degrees $- L \( M \) \, dots.h \, 0$ and to the constant coefficient of $d_x$. At the supplied nonzero solution, every negative coefficient of $f_x$ is divisible by $2^M$, and its constant coefficient is congruent to $f_0 \( 0 \)$. Therefore its constant coefficient has valuation $c_0$, and $v_O \( f_x \) lt.eq c_0$. Since $d_x in O$, the identity $d_x = f_x u_x$ gives $v_O \( u_x \) gt.eq - c_0$; the same bound holds for $u_0$. By Lemma 63, all their coefficients are in $2^(- c_0) bb(Z)_2$. Both have zero negative coefficients because they lie in $Lambda \[ 1 \/ 2 \]$.
  The convergent constant-term convolution gives
  $ \[ t^0 \] d_x equiv \( \[ t^0 \] f_x \) u_x \( 0 \) med \( mod med 2^(M - c_0) \) \, #h(2em) \[ t^0 \] d_0 = f_0 \( 0 \) u_0 \( 0 \) . $
  Combine these identities with the imposed coefficient congruences and divide by $f_0 \( 0 \)$. This proves Equation (11.2). For the consequence, choose one integer $M > max { c_(*) \, B_1 + 2 c_(*) }$, where $c_(*)$ bounds $c_0$, and then take $b$ above Equation (11.1). If the base valuation exceeded $B_1$, the transferred nonzero valuation would also exceed $B_1$, a contradiction. The pivot valuation affects the required precision and dimension, but not the transferred upper bound. ◻
]

=== 11.1 Finite cochain models <sec:common-finite-models>

The arithmetic applications also need finite free complexes that retain maps to the original cochains. The following algebraic construction provides these models and transports their comparison diagrams. It applies before any determinant coordinate is chosen.

#thm([Lemma 11.6.])[
  (Finite Artin models).  #emph[ Let $\( A \, frak(m) \, k \)$ be an Artin local ring, and let $D$ be a complex of flat $A$-modules. Suppose $H^(*) \( D ⊗_A k \)$ is finite dimensional and supported in $\[ a \, b \]$. There is a bounded finite free complex $C$, with 
$ "rank"_A C^j = dim_k H^j \( D ⊗_A k \) \, $

 and a strong deformation retraction 
$ i : C arrow.r D \, #h(2em) p : D arrow.r C \, #h(2em) p i = 1 \, #h(2em) 1 - i p = d h + h d . $

 Thus maps to the original complex, as well as maps between finite models, are available. Any fixed finite collection of chain maps, homotopies, triangles, and perfect pairings can be transported to these models.]
] <rl:finite-model>

#proof[
  Flat modules over an Artin local ring are free, including modules of infinite rank. Here is a useful version of the argument. Lift a basis of $M \/ frak(m) M$ to a flat module $M$, and map the corresponding free module to $M$. Its cokernel is zero because $frak(m)$ is nilpotent. Flatness shows that the kernel has zero reduction, and nilpotence again makes the kernel zero.
  Split the residual complex as its cohomology, with zero differential, plus contractible two-term disks. Lift all the graded bases. These lifts are graded isomorphisms: an inverse modulo $frak(m)$ lifts to an inverse by a finite geometric series. Let $d_0$ be the lifted disk differential and write $d = d_0 + epsilon.alt$. All coefficients of $epsilon.alt$ belong to $frak(m)$. For the disk contraction $\( i_0 \, p_0 \, h_0 \)$, arrange $h_0^2 = h_0 i_0 = p_0 h_0 = 0$ and $1 - i_0 p_0 = d_0 h_0 + h_0 d_0$. The operators $1 + h_0 epsilon.alt$ and $1 + epsilon.alt h_0$ have finite geometric inverses. The homological perturbation lemma gives explicit contraction maps; we record the formulas to retain their compatibility with the arithmetic diagrams #cite(label("Crainic2004")) Sections 2.2–2.4 and 3.2. The perturbation identities give the differential
  $ d_C = p_0 epsilon.alt \( 1 + h_0 epsilon.alt \)^(- 1) i_0 $
  on the lifted residual cohomology, and give
  $ i = \( 1 + h_0 epsilon.alt \)^(- 1) i_0 \, quad p = p_0 \( 1 + epsilon.alt h_0 \)^(- 1) \, quad h = h_0 \( 1 + epsilon.alt h_0 \)^(- 1) . $
  Substitution, using $\( d_0 + epsilon.alt \)^2 = 0$, proves the asserted contraction identities. These calculations are valid for infinite disk sums: each operator is a module homomorphism and every geometric series terminates at the nilpotence exponent of $frak(m)$.
  Transport a map $f$ as $p' f i$, retaining the contraction homotopies for compositions. A quasi-isomorphism between bounded free complexes has a contractible cone and a homotopy inverse. This transports finite diagrams, including triangles and perfect dualities. ◻
]

== 12 Cyclotomic interpolation at analytic rank zero <sec:cy:interpolation>

The cyclotomic argument transfers a nonzero central value across a binary family. Its input is a uniform upper bound for the normalized valuations at every nonzero vertex. Its output is nonvanishing at a corank-zero base. The class used here is Kato’s zeta class, and the additional variable is the real cyclotomic $bb(Z)_2$-extension of $bb(Q)$.

Retain $T = T_2 \( E \)$ and put $V_2 = T ⊗_(bb(Z)_2) bb(Q)_2$. The local weights, finite Sha lengths and period normalization are those of Section 2, and $D \( h \)$ is defined in Equation (3.1). We prove Theorems 12 and 8 with their stated distinction between the uniform specialization error and the dimension threshold for a fixed base.

For a two-dimensional representation over $bb(F)_2$, reducibility is equivalent to being an extension of trivial modules. These are therefore the two exhaustive residual cases. The proof has three stages: construct a class in a fixed integral lattice, identify its central determinant, and apply the binary congruences. Residual reducibility makes the cyclotomic complex free after localization at $\( 2 \)$; the irreducible case instead uses the bounded clearing factor of Lemma 65.

=== 12.1 The positive cyclotomic complex <the-positive-cyclotomic-complex>

At the coefficient prime $2$, the real place must be included in the cochain construction. The positive complex defined below removes the real cochains and retains their connecting invariant line. We will combine this fixed line with the zeta class to form the determinant whose central value detects nonvanishing at a corank-zero base.

Put

$ Gamma = "Gal" \( bb(Q)_oo \/ bb(Q) \) \, #h(2em) Lambda = bb(Z)_2 \[ \[ Gamma \] \] = bb(Z)_2 \[ \[ t \] \] \, #h(2em) cal(O) = hat(Lambda_(\( 2 \))) \, #h(2em) Omega = cal(O) \/ 2 cal(O) = bb(F)_2 \( \( t \) \) \, $

where a generator of $Gamma$ corresponds to $1 + t$. The completion is $2$-adic. An element of $cal(O)$ has a finite negative Laurent part modulo every $2^M$, but need not have a value at $t = 0$. Every central evaluation below is made on a rational Iwasawa class or on an element of $Lambda \[ 1 \/ 2 \]$ before extending coefficients to $cal(O)$.

For a family in Equation (3.2), let $G = \( bb(Z) \/ 2 bb(Z) \)^b$ have characters indexed by $x in bb(F)_2^b$, and let $psi : G_(bb(Q)) arrow.r G$ be its universal quadratic character: evaluation at $x$ is $chi_(h_x \/ h_0)$. Put

$ R = Lambda \[ G \] \, #h(2em) bb(T) = T ⊗_(bb(Z)_2) R \, $

with the fixed twist $chi_(h_0)$, the universal twist $psi$, and the inverse cyclotomic action. One may replace $G$ by the actual image of $psi$ and subsequently extend scalars. In a family in Theorem 8, a nonzero character trivial on that image already gives the conclusion directly.

Let $S$ be the set of primes dividing $2 N h_0 product_(q in cal(Q)) q$. For $q in cal(Q)$, write $g_q in G$ for its inertia element, so $x \( g_q \) = \( - 1 \)^(lambda_q \( x \))$. Use continuous cochains with their completed coefficient topology, and set

#[#set math.equation(numbering: n => "(12.1)")
 $ C_S^(+) \( bb(T) \) = "Cone" #scale(x: 120%, y: 120%)[\(] R Gamma \( G_(bb(Q) \, S) \, bb(T) \) arrow.r R Gamma \( bb(R) \, bb(T) \) #scale(x: 120%, y: 120%)[\)] \[ - 1 \] . $ <eq:cy:positive-complex>]

The real complex here uses ordinary cochains in nonnegative degrees. There are no imposed local conditions at the finite places. We write $C_S \( bb(T) \) = R Gamma \( G_(bb(Q) \, S) \, bb(T) \)$ for the unmodified complex. Throughout this section, #emph[ordinary global cohomology] means this unmodified cohomology; it imposes no ordinary-reduction hypothesis at $2$.

#thm([Lemma 12.1.])[
  #emph[The complex in Equation (12.1) is perfect over $R$ and computes derived coefficient specializations. There is a class $a in H^1 \( C_S^(+) \( bb(T) \) \)$ whose rational span is the real-place summand. Its integral index in that summand depends only on $E$ and the fixed real sign.]
] <lem:cy:positive-model>

#proof[
  Here are the finiteness and coefficient issues in the use of global cochains. For a finite coefficient quotient of $R$, continuous cochains are filtered unions of finite products of free coefficient modules. Refinement of finite partitions makes these modules flat; over an Artin local coefficient ring they are free. For finite residual coefficients, global cohomology is finite in each degree, and restriction to the real places is an isomorphism in degrees greater than two, by the real-place clause of global duality #cite(label("Nekovar2006")) §5.7.1.7. Thus the residual fiber has bounded amplitude and finite-dimensional cohomology. The same amplitude bound holds for every finite coefficient module, by a composition series and the cohomology long exact sequence.
  This gives a bounded finite free model as follows. Over the residue field split off the acyclic disks, leaving its finitely many cohomology spaces. Lift each invertible disk differential over an Artin coefficient quotient and cancel it. Invertibility of a lifted inverse follows from nilpotence of the maximal ideal. Equivalently one can perform this on a free resolution; a minimal free model cannot have an additional term whose reduction has zero cohomology, because its residual differential is zero. Hence the remaining ranks are the finite residual ranks and are bounded independently of the coefficient quotient. Minimal models identified by a homotopy equivalence over an Artin local ring are isomorphic. Lifting their changes of basis therefore makes these models compatible along $R \/ frak(m)^n$. Taking the inverse limit gives a bounded finite free model over $R$. The cochain construction with finite free coefficients and the same cancellation also proves derived base change. This is a fixed-$S$ argument; it does not assert uniform bounds on the number of generators as $S$ varies.
  All the characters of the family have the same real sign, so the action at the real place is the fixed action on $T chi_(h_0)$ extended to $R$. Choose a nonzero vector in its integral invariant line. Its connecting image in the fiber is $a$. There are no global invariant vectors in the rational elliptic representation, and consequently this connecting map is injective rationally. The choice and its index are fixed. Notice also that $H^1 \( bb(R) \, bb(T) \)$ is killed by $2$; thus twice any ordinary cohomology class lifts to the positive complex. The real-place global duality input is its corrected form at $2$ #cite(label("Nekovar2006")) §§5.7.1–5.7.5; the invariant line and the lifting assertion follow from the long exact sequence of this ordinary-real cone. Complete real Tate cochains, used in the duality formulation, become acyclic after inverting $2$ and would not retain this invariant line. ◻
]

=== 12.2 Fixed-form zeta classes and the integral coefficient map <fixed-form-zeta-classes-and-the-integral-coefficient-map>

To control denominators as the tame support grows, we construct every class in the cohomological lattice of one fixed modular form. Let $f$ be the fixed weight-two form of $E$, and choose its fixed integral cohomological lattice, with the Tate twist making its rational representation $V_2$. Kato’s classes (8.1.2)–(8.1.3), for a fixed symbol $xi in upright("SL")_2 \( bb(Z) \)$, exist for arbitrary $m$ and any $S$ containing the prime factors of $m N$. The trace in Section 8.9 is a homomorphism into the lattice

$ bb(Z)_2 \[ "Gal" \( bb(Q) \( mu_m \) \/ bb(Q) \) \] ⊗ V_(2 \, bb(Z)_2) \( Y_1 \( N \) \) \( 1 \) . $

Section 8.11 then projects to the lattice of the fixed form. Proposition 8.12 supplies its norm relations. These assertions hold at the coefficient prime $2$ #cite(label("Kato2004")) Sections 5.1, 8.1, 8.9–8.12. In particular, the auxiliary modular-curve level used to define a trace does not become the level of the projected newform.

Choose an isomorphism of the resulting fixed rational representation with $V_2$. A single power $2^(c_E)$ sends its integral lattice into $T$. Choose fixed symbols with nonzero projections on the required period lines; their existence and the construction with both signs are made explicit in #cite(label("Kato2004")) Sections 13.6 and 13.9. Taking a fixed linear combination, if needed, costs another fixed denominator.

The following integral coefficient map encodes the binary family. Choose $m = \| h_0 \| product_(q in cal(Q)) q$, which is odd and divisible by the conductors of all the tame characters in the family, including $chi_(h_0)$. At a sufficiently large cyclotomic level write $A_(m \, n) = "Gal" \( bb(Q) \( mu_(m 2^n) \) \/ bb(Q) \)$ and let $Gamma_n$ be its quotient in the real cyclotomic tower. Shapiro identifies the cohomology of the cyclotomic field with global cohomology with induced group-ring coefficients. Push the class along the ring homomorphism

#[#set math.equation(numbering: n => "(12.2)")
 $ bb(Z)_2 \[ A_(m \, n) \] arrow.r bb(Z)_2 \[ Gamma_n times G \] \, #h(2em) \[ sigma \] mapsto chi_(h_0) \( sigma \) \[ sigma \|_(Gamma_n) \] \[ psi \( sigma \) \] . $ <eq:cy:coefficient-map>]

Use inverse actions on both sides if this is required by the chosen Shapiro convention. This is a homomorphism of integral coefficient modules and acts on actual cohomology classes. It requires neither division by $\| G \|$ nor surjectivity of a cohomological specialization map. The prime $2$ belongs to the fixed omitted support, so Proposition 8.12 gives exact norm compatibility as $n$ increases. The pushed classes therefore give an integral smoothed Iwasawa class with coefficients in $bb(T)$, up to the single fixed power $2^(c_E)$.

We have placed all character constituents in the lattice of the same modular form. The next normalization issue is smoothing: its removal must be harmless both after localization at $\( 2 \)$ and at the central value $t = 0$. These are distinct requirements, checked next.

We next remove smoothing. In weight two and with $r = r' = 1$, its factors are

#[#set math.equation(numbering: n => "(12.3)")
 $ \( c^2 - c sigma_c \) \( d^2 - d sigma_d \) . $ <eq:cy:smoothing>]

This is the specialization of #cite(label("Kato2004")) Theorem 6.6 and (4.2.4). Choose a fixed $e gt.eq max \( 2 \, v_2 \( N \) \)$, increasing it to accommodate the finitely many fixed symbol levels. The Chinese remainder theorem permits $c \, d > 1$, prime to $6 N m$, such that

$ c \, d equiv 1 med \( mod med 3 N_(upright("odd")) m \) \, #h(2em) c \, d equiv 1 + 2^e med \( mod med 2^(e + 1) \) . $

Their tame actions in (12.2) are trivial. If $sigma_c$ acts in $Gamma$ as $\( 1 + t \)^(kappa \( c \))$, then $v_2 \( kappa \( c \) \) = e - 2$. Modulo the maximal ideal of $cal(O) \[ G \]$ its smoothing factor is

$ 1 - \( 1 + t \)^(kappa \( c \)) eq.not 0 quad upright("in ") bb(F)_2 \( \( t \) \) . $

It is therefore a unit in $cal(O) \[ G \]$. Its central value is $c \( c - 1 \)$, of valuation exactly $e$. The same statements hold for $d$ and for inverse-translate conventions. Thus unsmoothing introduces neither a $2$-adic denominator at $\( 2 \)$ nor a growing central denominator. The integers $c \, d$ vary with $m$; the congruences fix the needed valuations, not their exact cyclotomic group elements.

Denote the resulting rational ordinary class by $z_S$. #cite(label("Kato2004"), form: "prose") Theorem 9.7 applies to $k = 2 \, r = r' = 1$. In the character constituent $x$, its central reciprocity formula reads

#[#set math.equation(numbering: n => "(12.4)")
 $ v_2 #scale(x: 120%, y: 120%)[\(] exp_2^(*) z_(S \, x) \( 0 \) #scale(x: 120%, y: 120%)[\)] = v_2 \( cal(L) \( h_x \) \) + sum_(q in cal(Q) thin \, med q divides.not h_x) v_2 #scale(x: 120%, y: 120%)[\(] \# E^(\( h_x \)) \( bb(F)_q \) #scale(x: 120%, y: 120%)[\)] + O_E \( 1 \) $ <eq:cy:reciprocity-center>]

when the value is nonzero, and a zero central value gives a zero dual exponential. The omitted primes dividing $2 N$ are included in the error. To check the normalization, the character sum in (12.2) is the unnormalized sum, as in Kato’s trace. Its tame quadratic Gauss sum supplies $sqrt(\| h_x \|)$ up to a root of unity. Tame conductors and their Gauss sums are $2$-adic units. The period vector is the fixed symbol vector of $f$. More explicitly, in the required sign line write the period represented by $delta \( f \, 1 \, xi \)^plus.minus$ as $c_xi^plus.minus Omega_E^plus.minus$. The nonzero scalar $c_xi^plus.minus$ is fixed: the character-sum formula of #cite(label("Kato2004")) Theorem 6.6 uses this same $delta \( f \, 1 \, xi \)^plus.minus$ for every tame character. The tame character enters through its $L$-value and Gauss sum, not through a newly chosen period vector. The comparison with the minimal differential of $E^(\( h_x \))$ at $2$ has bounded valuation, because there are only finitely many local twisting classes there. At a good unused prime the omitted factor is

$ 1 - frac(a_q \( E \) chi_(h_x) \( "Fr"_q \), q) + 1 / q = frac(\# E^(\( h_x \)) \( bb(F)_q \), q) \; $

at a good ramified prime the local $L$-factor is $1$. These account for every varying factor in (12.4).

=== 12.3 Rational divisibility and the local Euler corrections <rational-divisibility-and-the-local-euler-corrections>

We now exclude poles of the zeta determinant away from $\( 2 \)$ and account for every omitted Euler factor. Write $A = Lambda \[ 1 \/ 2 \]$. Theorem 12.5(3) of #cite(label("Kato2004")) is a height-one divisibility over $A$; its possible local $H^2$ correction comes from the arithmetic place $2$. It need not be supported at the Iwasawa ideal $\( 2 \)$. The global groups there use $j_(*)$ outside that prime. The stronger integral assertion of Theorem 12.5(4) is not used. For a non-CM elliptic curve the characteristic-zero image condition is supplied by the open image theorem, independently of the residual image. For CM the required rational statement at every prime, including $2$, is supplied by #cite(label("BurungaleTian2026")) Theorem 2.6 and Remark 2.7. Neither statement asserts uniform integrality in a quadratic group ring. The rational cohomology statements, including #cite(label("Kato2004"), form: "prose") Theorem 12.4, give rank one in degree one and torsion in degree two, with no other positive cohomological rank. The real-place modification adds its invariant line. Hence every generic character constituent of the positive complex has rank two in degree one and no other positive rank.

Fix a character constituent $h$ and write $V_h = V_2 chi_h$. Let $C_(j_(*))$ be the rational Iwasawa complex in Kato’s formulation and $C_S$ the rational full global complex. At an odd prime put

$ W_q = H^1 \( I_q \, V_h \) . $

The localization triangle has local cone

#[#set math.equation(numbering: n => "(12.5)")
 $ Q_q = R Gamma #scale(x: 120%, y: 120%)[\(] G_(bb(F)_q) \, W_q ⊗ A \( Gamma^iota \) #scale(x: 120%, y: 120%)[\)] \[ - 1 \] = [W_q ⊗ A arrow.r^(med 1 - gamma_q "Fr"_(W_q) med) W_q ⊗ A] $ <eq:cy:local-block>]

in degrees one and two. Here $gamma_q$ denotes the scalar cyclotomic Frobenius in the chosen convention. Its exponent is nonzero. Consequently $D_q = det \( 1 - gamma_q "Fr"_(W_q) \)$ is a nonzero element of $A$, and the map in (12.5) is injective. This remains true after localization at a height-one prime dividing $D_q$: localization does not mean reduction modulo that prime. Thus

$ H^1 \( Q_q \) = 0 \, #h(2em) "length"_(A_(frak(p))) H^2 \( Q_q \)_(frak(p)) = v_(frak(p)) \( D_q \) . $

The long exact sequence gives

#[#set math.equation(numbering: n => "(12.6)")
 $ H^1 \( C_(j_(*)) \) tilde.eq H^1 \( C_S \) \,\
0 arrow.r H^2 \( C_(j_(*)) \) arrow.r H^2 \( C_S \) arrow.r xor.big_(q in S \\ { 2 }) H^2 \( Q_q \) arrow.r H^3 \( C_(j_(*)) \) . $ <eq:cy:local-sequence>]

In particular, the length of $H^2 \( C_S \)$ is at most the length of $H^2 \( C_(j_(*)) \)$ plus the sum of the local lengths. No assertion that $H^3 \( C_(j_(*)) \)$ vanishes is required here.

At a good unused prime, $W_q = V_h \( - 1 \)$, so, on including the quadratic Frobenius sign in $Z$,

#[#set math.equation(numbering: n => "(12.7)")
 $ D_q = P_q \( Z \) \, #h(2em) P_q \( Z \) = 1 - frac(a_q \( E \), q) Z + 1 / q Z^2 . $ <eq:cy:local-euler>]

At a good active prime, inertia acts by $- 1$ on $V_h$. Its rational inertia cohomology is zero, so $W_q = 0$ and $D_q = 1$.

At fixed bad primes the general expression is $H^1 \( I_q \, V_h \)$ in (12.5). Replacing it indiscriminately by $V_h^(I_q) \( - 1 \)$ would be incorrect. For example, at split multiplicative reduction,

$ V_h^(I_q) = bb(Q)_2 \( 1 \) \, #h(2em) H^1 \( I_q \, V_h \) = bb(Q)_2 \( - 1 \) \, $

and the correct determinant is $1 - gamma_q \/ q$, with nonzero central value. The incorrect replacement would give $1 - gamma_q$. In general $D_q \( 0 \) eq.not 0$ follows from local duality and the Weil pairing: $H^2 \( bb(Q)_q \, V_h \) = H^0 \( bb(Q)_q \, V_h \)^(*) = 0$, since elliptic torsion over a local field is finite. The fixed bad-prime corrections therefore have nonzero central values for every reduction type.

Let $z_(upright("BK") \, h)$ denote a generator of the rational Kato zeta line in its real cyclotomic component. The rational comparison with the fixed-form class constructed above is made only after taking the character constituent. Both global Iwasawa $H^1$ modules have rank one. Their reciprocity laws at cyclotomic finite-order characters agree up to the omitted Euler factors, a nonzero constant, and a group-like unit. This follows by coprime Gauss-sum factorization and the fixed period comparison; restricting conductor exponents to either fixed parity removes any factor $chi_h \( 2 \)^n$. Infinitely many of these tests have nonzero central value by cyclotomic nonvanishing, as used in #cite(label("Kato2004")) Theorem 13.5(2). After clearing the finitely many denominators of the scalar ratio, the difference is a power series vanishing at infinitely many finite-order characters. Weierstrass preparation forces that difference to be zero. This proves the generic comparison without identifying the integral lattices of varying twisted newforms. Its nonzero scalar in $bb(Q)_2$ may depend on $h$ and need not have a uniformly bounded $2$-valuation: every such scalar is a unit of $A$ and does not affect height-one divisibility over $A$. The uniform integral and central bounds instead concern the actual fixed-form class and the fixed period vector in (12.4).

Equations (12.6)–(12.7) now show exactly how the imprimitive factors enter divisibility. At any height-one $frak(p)$ of $A$, enlarging the global complex increases its degree-two length by at most $sum_q v_(frak(p)) \( D_q \)$, whereas multiplying the rank-one zeta generator by $product_q D_q$ adds exactly that quantity to its index. To cover Kato’s coefficient-prime correction, multiply the class also by a fixed element $F_2 in Lambda$ divisible over $A$ by the characteristic ideal of the relevant local $H_(upright("Iw"))^2$. It may be chosen with $F_2 \( 0 \) eq.not 0$. Indeed derived local control gives

$ H_(upright("Iw"))^2 \( bb(Q)_2 \, T chi_h \)_Gamma ⊗ bb(Q)_2 = H^2 \( bb(Q)_2 \, V_h \) = 0 \, $

so the characteristic ideal has no factor $t$. Local twisting classes at $2$ are fixed, and one element covers their finite set.

Likewise any additional fixed Euler factors in the rational comparison can be cleared by a fixed product with nonzero central value, using the actual blocks (12.5). Denote the total fixed multiplier by $F_E$. Multiplying by it only changes the fixed constants in (12.4) and the integrality bound. For the corrected class, still written $z_S$, we have at every height-one $frak(p)$ of $A$

#[#set math.equation(numbering: n => "(12.8)")
 $ "length"_(A_(frak(p))) H^2 \( C_S \)_(frak(p)) lt.eq "length"_(A_(frak(p))) #scale(x: 120%, y: 120%)[\(] H^1 \( C_S \) \/ A z_(S \, h) #scale(x: 120%, y: 120%)[\)]_(frak(p)) . $ <eq:cy:divisibility>]

There is an integral convention check for the varying unused primes. In $cal(O) \[ G \]$, both $P_q \( Z \)$ and $Z^2 P_q \( Z^(- 1) \)$ are units: their reductions are nonzero polynomials evaluated at the nonconstant cyclotomic Frobenius. The identity

$ P_q \( Z \) - Z^2 P_q \( Z^(- 1) \) = frac(q - 1, q) \( 1 - Z^2 \) $

shows that their ratio $r_q$ is $1$ modulo $2$. If $g_q$ is the universal inertia element, then

#[#set math.equation(numbering: n => "(12.9)")
 $ U_q = 1 + frac(r_q - 1, 2) \( 1 + g_q \) in cal(O) \[ G \]^times $ <eq:cy:reciprocal-correction>]

is integral. At an active character it is $1$; at an unused character it is $r_q$. Its unused central value is $1$, since $Z = plus.minus 1$ there. Thus inverse Frobenius conventions can be reconciled before character evaluation, without a denominator for each prime. Products of these units have the same property. The resulting rational character coordinates have the Euler convention in (12.8).

#thm([Lemma 12.2.])[
  (Fixed-lattice zeta class).  #emph[For every binary family and its ramification set $S$, the corrected class $z_S$ satisfies the central reciprocity formula (12.4) and the rational divisibility (12.8). For some $c_E gt.eq 0$ depending only on $E$, 
$ 2^(c_E) z_S in H^1 #h(-0.16667em) (C_S \( bb(T) \) ⊗_R^(upright(bold(L))) cal(O) \[ G \]) . $

 The same exponent works for all $S$, binary families, and fixed factors $h_0$ with the specified local classes. Here the displayed cohomology is derived scalar extension of the Iwasawa complex.]
] <lem:cy:kato-class>

#proof[
  The integral coefficient map uses the fixed-form lattice and no character averages. Unsmoothing and every varying-prime convention correction are units over $cal(O) \[ G \]$. The multiplier $F_E$ is fixed. The preceding construction therefore gives the displayed assertion with a fixed exponent, as well as the two stated comparison formulas. ◻
]

=== 12.4 The determinant and its central specialization <the-determinant-and-its-central-specialization>

The zeta class now has two controls: rational divisibility will exclude poles of its determinant coordinate away from $\( 2 \)$, and the fixed lattice bounds the class’s integral denominator at $\( 2 \)$. We next identify its determinant coordinate at $t = 0$. This is the step that converts those cohomological controls into a statement about $D \( h \)$.

Choose a basis of the invertible $R$-module $det_R^(- 1) C_S^(+) \( bb(T) \)$; $R$ is local, so such a basis exists. Lift $2 z_S$ to rational positive cohomology and take its wedge with $a$. The factor $2$ is fixed, and two lifts differ by a real-place class, which does not change this wedge. Let $u$ be its generic determinant coordinate, including the fixed multiplier $F_E$ above. The real-place summand introduces no height-one torsion over $A$. Thus (12.8) says that $u_x$ has no pole at any height-one prime of $Lambda$ except possibly $\( 2 \)$. Since $Lambda$ is normal,

#[#set math.equation(numbering: n => "(12.10)")
 $ u_x in Lambda \[ 1 \/ 2 \] #h(2em) upright("for every ") x . $ <eq:cy:rational-integrality>]

The two cycles have a common denominator bounded by a fixed power $2^(C_(upright("int")))$ after extension to $cal(O) \[ G \]$. This follows from Lemma 70 and the factor $2$ needed for the lift.

#thm([Proposition 12.3.])[
  (Central determinant formula).  #emph[There is a constant $C_(upright("loc"))$, depending only on the fixed curve and local classes, with the following property. Suppose $c_2 \( E^(\( h_x \)) \) = 0$. If $L \( E^(\( h_x \)) \, 1 \) = 0$, then $u_x \( 0 \) = 0$; if $L \( E^(\( h_x \)) \, 1 \) eq.not 0$, then 
#[#set math.equation(numbering: n => "(12.11)")
 $ \| v_2 \( u_x \( 0 \) \) - D \( h_x \) #scale(x: 120%, y: 120%)[\|] lt.eq C_(upright("loc")) . $ <eq:cy:determinant-center>]

 The rational positive complex at $t = 0$ has cohomology only in degree one, of dimension two, so these are specializations of the same determinant.]
] <prop:cy:specialization>

#proof[
  Abbreviate $T_h = T_2 E^(\( h_x \))$ and $A_h = E^(\( h_x \)) \[ 2^oo \]$. Use the integral Kummer subgroup
  $ K_v = "im" #scale(x: 120%, y: 120%)[\(] E^(\( h_x \)) \( bb(Q)_v \)_2^and arrow.r H^1 \( bb(Q)_v \, T_h \) #scale(x: 120%, y: 120%)[\)] $
  at every finite place. For $v eq.not 2$ it is all of $H^1 \( bb(Q)_v \, T_h \)$. One way to see this integrally is the inverse-limit Kummer exact sequence: its quotient is $T_2 H^1 \( bb(Q)_v \, E^(\( h_x \)) \)$, which is zero because local Tate duality identifies the $2$-primary local Weil–Châtelet group with the dual of the finite $2$-completion of the local point group. At $2$ the quotient
  $ L_2 = H^1 \( bb(Q)_2 \, T_h \) \/ K_2 $
  is a free rank-one $bb(Z)_2$-module. The same Kummer sequence and local Tate duality identify it with the $bb(Z)_2$-dual of the free part of $E^(\( h_x \)) \( bb(Q)_2 \)_2^and$.
  The dual exponential identifies $L_2 ⊗ bb(Q)_2$ with the one-dimensional de Rham target. To specify its integral comparison, put
  $ B_2 = E^(\( h_x \)) \( bb(Q)_2 \)_2^and \/ upright("tors") $
  and choose a minimal differential $omega_h$. The Bloch–Kato exponential agrees with the Kummer image of the classical elliptic exponential, which is the inverse of the formal logarithm on a sufficiently small open subgroup. This comparison holds for every reduction type #cite(label("BlochKato1990")) Definition 3.10 and Example 3.11. The dual exponential is the adjoint of that exponential under local Tate duality #cite(label("Berger2003")) §II and Proposition II.5. Extend the formal logarithm to the rationalized local point group and write $log_(omega_h) \( B_2 \) = lambda_h bb(Z)_2$. The integral identification $L_2 = "Hom"_(bb(Z)_2) \( B_2 \, bb(Z)_2 \)$ then gives
  $ exp_2^(*) \( L_2 \) = lambda_h^(- 1) bb(Z)_2 omega_h \, $
  using the Weil-pairing identification of the de Rham target with $bb(Q)_2 omega_h$. Thus the relative lattice valuation is fixed by the local curve and differential. Since only finitely many local twist classes occur, these valuations are uniformly bounded.
  The assumption on the Selmer corank implies that the compact finite Selmer group is torsion and that the discrete finite Selmer group has length $s \( h_x \)$. Rational Poitou–Tate consequently identifies ordinary global $H^1$ with the singular line at $2$, and gives ordinary global $H^2 = 0$ rationally. Adding the real invariant line gives the claimed dimension two in degree one. This equals the generic rank, so derived base change of the perfect complex specializes its determinant without a change of rational cohomological rank.
  Here is the integral length calculation. Let $J$ be the image of the free part of global $H^1 \( G_(bb(Q) \, S) \, T_h \)$ in $L_2$, and put $i = "length" \( L_2 \/ J \)$. The compact/discrete Poitou–Tate sequence for the mutually orthogonal Kummer conditions contains
  $ 0 arrow.r L_2 \/ J & arrow.r "Sel"_(2^oo) \( E^(\( h_x \)) \/ bb(Q) \)^or arrow.r H^2 \( G_(bb(Q) \, S) \, T_h \)\
 & arrow.r xor.big_(q in S) H^2 \( bb(Q)_q \, T_h \) arrow.r H^0 \( bb(Q) \, A_h \)^or arrow.r 0 \, $
  with the usual real Tate-cohomology terms inserted. Those terms are killed by $2$ and have dimensions bounded by the fixed dimension of $T$. Taking lengths and using local duality gives
  #[#set math.equation(numbering: n => "(12.12)")
   $ "length" H^2 \( G_(bb(Q) \, S) \, T_h \) = s \( h_x \) - i + sum_(q in S) "length" H^0 \( bb(Q)_q \, A_h \) + O_E \( 1 \) . $ <eq:cy:pt-length>]
  This sequence follows from integral Poitou–Tate duality with the finite Kummer conditions and the real Tate-cohomology correction #cite(label("Nekovar2006")) §§5.7.1.6, 5.7.4–5.7.5 and 6.9.1. The free real invariant line is already accounted for by $a$; only the bounded real torsion terms enter the error above. No unramified condition replaces the Kummer condition at a bad prime. Global torsion is bounded by its injection into $E^(\( h_x \)) \( bb(Q)_2 \) \[ 2^oo \]$, whose order is bounded by the fixed local twisting classes. The finite terms at $2$ and at fixed bad primes are bounded for the same reason. Passing between ordinary and positive cohomology changes only these bounded real and global torsion terms.
  Suppose first that the central value is nonzero. The coordinate of $z_(S \, x) \( 0 \)$ in the free global line has valuation
  $ v_2 \( exp_2^(*) z_(S \, x) \( 0 \) \) - i + O_E \( 1 \) . $
  For the inverse determinant, torsion in degree two subtracts its length and torsion in degree one adds its length. This sign can be checked on the complex $\[ bb(Z)_2 arrow.r^(2^a) bb(Z)_2 \]$ in degrees one and two: its inverse determinant lattice maps to $2^a bb(Z)_2$ in the rational determinant. A vector’s coordinate thus loses $a$. Using (12.12), the two appearances of $i$ cancel, leaving
  $ v_2 \( u_x \( 0 \) \) = v_2 \( exp_2^(*) z_(S \, x) \( 0 \) \) - s \( h_x \) - sum_(q in S) "length" H^0 \( bb(Q)_q \, A_h \) + O_E \( 1 \) . $
  At an active good prime, quadratic inertia acts by $- 1$ on the Tate module. Its invariants on $A_h$ are therefore exactly $E \[ 2 \]$, and taking Frobenius invariants gives length $t_q$. At an unused good prime, reduction identifies the local $2$-primary torsion with $E^(\( h_x \)) \( bb(F)_q \) \[ 2^oo \]$, of length $v_2 \( \# E^(\( h_x \)) \( bb(F)_q \) \)$. These unused terms cancel exactly those in (12.4). The active terms, including the primes of $h_0$, sum to $2 w \( h_x \)$. All other terms have already been bounded independently of the growing support. This proves (12.11).
  If the central value is zero, reciprocity makes the dual exponential zero. The rational ordinary specialization then satisfies the finite condition at $2$, and it satisfies the finite conditions elsewhere automatically. It lies in the rational finite Selmer group, which is zero. Its wedge with the real-place class is therefore zero. The constant-rank determinant specialization proves $u_x \( 0 \) = 0$. ◻
]

=== 12.5 Residual freeness and the lower bound <residual-freeness-and-the-lower-bound>

The central formula expresses $D \( h \)$ through the determinant valuation. When the residual representation is an extension of trivial modules, we can bound that valuation directly: the positive complex becomes a free rank-two module in degree one after extension to $cal(O) \[ G \]$. The fixed-lattice class then supplies the lower bound without any loss from a growing ramification support.

#thm([Lemma 12.4.])[
  (Residual concentration).  #emph[If $E \[ 2 \]$ is an extension of two trivial $bb(F)_2$-modules, then there is an isomorphism in the derived category 
$ C_S^(+) \( bb(T) \) ⊗_R cal(O) \[ G \] tilde.eq cal(O) \[ G \]^2 \[ - 1 \] . $

]
] <lem:cy:residual-free>

#proof[
  The ring $cal(O) \[ G \]$ is local, with residue field $Omega$ obtained by setting $2 = 0$ and every $g = 1$. Thus the quadratic characters disappear. Since $E \[ 2 \]$ has a filtration with trivial factors, it is enough first to compute the positive residual complex for the trivial representation.
  Let $K_n$ be the real cyclotomic layer of degree $d_n = 2^n$. The number of finite primes of $K_n$ above a fixed $S$ is bounded with $n$: at $2$ there is total ramification, and the Frobenius of each fixed odd prime has nonzero image in $Gamma$. The $2$-ranks of the class groups of $K_n$ are also bounded. Let $X$ be the inverse limit, under norm maps, of their $2$-primary class groups. The unique prime above $2$ is totally ramified in this tower, so class-field-theoretic control gives
  $ X_(Gamma^(2^n)) tilde.eq "Cl" \( K_n \) \[ 2^oo \] $
  #cite(label("SharifiIwasawa")) Proposition 3.2.11 and Remark 3.2.12. Ferrero–Washington gives $mu \( X \) = 0$ for this abelian tower #cite(label("FerreroWashington1979")). The Iwasawa structure theorem then makes $X$ finitely generated over $bb(Z)_2$, so all its coinvariants have uniformly bounded $2$-rank. Passing to the quotient $S$-class groups preserves this upper bound.
  The signature map of units in $K_n$ is surjective. For $n gt.eq 1$, let $zeta$ be a primitive $2^(n + 2)$th root and put $epsilon.alt = 1 + zeta + zeta^(- 1)$. If $f_1 \( X \) = X^2 - 2$ and $f_(n + 1) \( X \) = f_n \( X^2 - 2 \)$, then $f_n$ is the minimal polynomial of $zeta + zeta^(- 1)$ and $f_n \( - 1 \) = - 1$. Hence $N_(K_n \/ bb(Q)) \( epsilon.alt \) = - 1$. Its signature vector has odd augmentation. The embeddings form a regular set for the cyclic $2$-group $"Gal" \( K_n \/ bb(Q) \)$, whose group algebra over $bb(F)_2$ is local. A vector with odd augmentation is a unit in this group algebra, so its translates span every signature. For $n = 0$ the assertion follows from the unit $- 1$.
  The signature calculation supplies the real-place surjectivity needed for the positive complex. The class-group and support terms are bounded along the tower. We can therefore identify the one cohomological degree whose dimension grows with the layer degree, and then recover the rank after inverting $t$.
  Kummer theory now determines the cohomological growth. Writing $s_n$ for the number of finite support places and $c_n$ for the $2$-rank of the $S$-class group, one has
  $ dim H^1 \( G_(K_n \, S) \, mu_2 \) = d_n + s_n + c_n . $
  The real degree-one restriction is surjective by the signature result. In degree two, the Kummer sequence has class-group term of dimension $c_n$ and Brauer term. The Brauer invariants at the real and finite support places have their single sum relation. Since a finite support place above $2$ is present, restriction of the Brauer term to the real places is surjective and has kernel of dimension $s_n - 1$. Thus the degree-two kernel of restriction to infinity is bounded. Restriction is an isomorphism in higher degrees by global duality. The degree-zero restriction is injective. The cohomology of the positive fiber is therefore bounded in every degree except one; its degree-one dimension is $d_n + O_S \( 1 \)$.
  Apply Lemma 69 modulo $2$. Derived specialization to the $n$th layer is specialization modulo $t^(2^n)$. For a perfect complex over $bb(F)_2 \[ \[ t \] \]$, the universal-coefficient exact sequence shows that a rank-$r$ cohomology module contributes $r 2^n + O \( 1 \)$ to these dimensions; the torsion terms contribute only $O \( 1 \)$. It follows that after inverting $t$ the trivial-constituent fiber has dimension one in degree one and vanishes in every other degree. Extensions preserve this concentration, so the fiber for $E \[ 2 \]$ has dimension two in degree one. A minimal finite free complex over the local ring $cal(O) \[ G \]$ has zero residual differentials. The concentration just proved forces all its terms except the rank-two term in degree one to vanish. No denominator is introduced by this exact freeness statement. ◻
]

#proof[
  Apply Lemma 72 to the single discriminant $h$. The fixed-lattice construction and the free complex give $2^(C_(upright("int"))) u_h in cal(O)$ with $C_(upright("int"))$ depending only on $E$. Equation (12.10) also gives $u_h in Lambda \[ 1 \/ 2 \]$. Since $cal(O) ∩ Lambda \[ 1 \/ 2 \] = Lambda$, it follows that $v \( u_h \( 0 \) \) gt.eq - C_(upright("int"))$. Analytic rank zero supplies Selmer corank zero by the forward theorem of Gross–Zagier–Kolyvagin. Proposition 71 now gives $D \( h \) gt.eq - C_(upright("int")) - C_(upright("loc"))$. All constants come from the fixed form, the fixed real period line, or the finitely many local twisting classes at $2 N$. ◻
]

=== 12.6 Transfer to the base <transfer-to-the-base>

It remains to prove the missing-vertex theorem. Residual freeness gives a single integral family in the reducible case. In the irreducible case we instead need a bounded clearing factor after eliminating the new local blocks. The bound on $v_2 \( q^2 - 1 \)$ enters precisely here: the next lemma controls the negative Laurent powers in those inverse blocks at each fixed precision.

#thm([Lemma 12.5.])[
  #emph[Suppose that $q$ is an added prime and $v_2 \( q^2 - 1 \) lt.eq L$. At augmentation $G arrow.r 1$, the inverse singular Frobenius block contributed by $q$ has, modulo each fixed $2^M$, negative Laurent support bounded in terms of $L$ and $M$. This bound is independent of $q$.]
] <lem:cy:cyclotomic-poles>

#proof[
  Identify $Gamma$ with $1 + 4 bb(Z)_2$ using a fixed generator. If $gamma_q = \( 1 + t \)^(alpha_q)$ is the image of arithmetic Frobenius at $q$, then
  $ v_2 \( alpha_q \) = v_2 \( q^2 - 1 \) - 3 $
  when the generator is $5$; changing the generator multiplies $alpha_q$ by a unit. In particular $alpha_q eq.not 0$. The singular quotient is represented by a block of bounded size whose determinant is the Euler polynomial in Equation (12.7). Modulo $2$, with $z = \( 1 + t \)^(alpha_q)$, it is
  $ 1 + overline(a_q) z + z^2 . $
  If $overline(a_q) = 1$, its constant coefficient is $1$. If $overline(a_q) = 0$, it is $\( 1 + z \)^2$, whose $t$-order is $2^(v_2 \( alpha_q \) + 1) lt.eq 2^(L - 2)$. Thus the inverse determinant has uniformly bounded pole order modulo $2$. Lift its inverse modulo $2^M$ by a geometric expansion of length at most $M$. Each term contains only a bounded number of inverse residual factors, and all numerators have nonnegative powers of $t$. The adjugate formula gives the same bound for every entry of the inverse block. ◻
]

#proof[
  At every nonzero vertex, analytic rank zero gives $c_2 \( E^(\( h_x \)) \) = 0$ by the forward rank-zero theorem. Thus Proposition 71 applies at every vertex.
  First assume $E \[ 2 \]$ is an extension of trivial modules. Lemma 72 and the fixed-lattice construction give $2^(C_(upright("int"))) u in cal(O) \[ G \]$. Moreover, the character coordinates of $u$ are in $Lambda \[ 1 \/ 2 \]$. Fourier inversion, performed rationally, shows $u in Lambda \[ 1 \/ 2 \] \[ G \]$; intersecting coefficientwise with $cal(O) \[ G \]$ gives
  #[#set math.equation(numbering: n => "(12.13)")
   $ 2^(C_(upright("int"))) u in Lambda \[ G \] . $ <eq:cy:universal-integrality>]
  The coefficients at $t = 0$ therefore obey the bounded-degree Boolean congruences of Lemma 66. For any fixed precision and sufficiently large $b$, there is a nonzero $x$ for which $u_x \( 0 \)$ agrees with $u_0 \( 0 \)$ to that precision. The fixed multiplier in Equation (12.13) affects the required precision but has no dependence on $b$.
  Now suppose $E \[ 2 \]$ is irreducible. At augmentation, represent the positive complex as the old complex, with ramification set excluding $cal(Q)$, extended by the direct sum of singular blocks at the new primes. The differential is upper triangular with the old complex as subcomplex. The finite-model argument of Lemma 11.6 lifts this model over $R$: stabilize the finite free models and lift their graded changes of basis. These lifts are invertible because the augmentation ideal lies in the Jacobson radical. Cancel all additional lifted unit disks before retaining the old-plus-singular grading; their augmented cross terms are zero, so the remaining augmentation is exactly the prescribed block model. Thus no stabilization disk enlarges the old complex. Lemma 64 then applies to this block model. All the new blocks are invertible over $cal(O) \[ G \]$: modulo its maximal ideal their Frobenius determinants are nonzero in $Omega$. Schur elimination leaves a complex of bounded size. Its augmentation is the fixed old complex, and its entries have bounded negative Laurent support modulo each fixed $2^M$. Under the determinant-line identification, write
  $ u = eta u_(upright("bd")) \, #h(2em) eta in cal(O) \[ G \]^times \, $
  where $u_(upright("bd"))$ is the coordinate on this bounded complex and $eta$ is the determinant factor of the eliminated blocks. No uniform Laurent bound on $eta$ is needed.
  The pole bound remains uniform as primes are added. At augmentation the inverse new block is a direct sum of the inverses in Lemma 73. At any character its perturbation has entries divisible by $2$ and no negative powers of $t$. Modulo $2^M$, the inverse uses a geometric series of length at most $M$, independently of the number of blocks. Each product therefore uses a bounded number of inverse entries. Sums of an arbitrary number of such terms cannot decrease the nonarchimedean valuation or the common lower Laurent bound. This is the required bound for Schur elimination.
  At $t = 0$ the old positive complex has rational cohomology only in degree one, of dimension two, by Proposition 71 at $h_0$. Its finite torsion and all old local data are fixed. Choose boundary pivots there, leaving those two free coordinates. Their sizes and valuations may depend on $h_0$ but not on $b$. Apply the determinant clearing argument of Lemma 65 to the wedge of the two bounded-integral cycles $a \, 2 z_S$ on the remaining complex. Its allowance for an arbitrary factor $eta$ puts the eliminated-block factor into the numerator alone. It yields
  #[#set math.equation(numbering: n => "(12.14)")
   $ d = f u in cal(O) \[ G \] \, #h(2em) f in cal(O) \[ G \] \, #h(2em) f_0 in Lambda \, quad f_0 \( 0 \) eq.not 0 . $ <eq:cy:cleared-determinant>]
  For each fixed $M$, the negative Laurent support of $f_x med mod med 2^M$ is bounded independently of $b$ and $x$. The clearing factor is a polynomial of bounded degree in the remaining bounded-size matrix, with the pivot denominators cleared by adjugates. Neither the eliminated-block unit, the zeta class nor $d$ is required to have a uniform bound on its negative Laurent support.
  Equation (12.10) ensures that every $u_x$ has no negative $t$-powers. Thus all hypotheses of Lemma 67 hold for Equation (12.14). In particular, for each fixed precision and sufficiently large $b$, some nonzero $x$ satisfies the corresponding central congruence between $u_x \( 0 \)$ and $u_0 \( 0 \)$. The dependence on $h_0$ enters the required precision and dimension, through $v \( f_0 \( 0 \) \)$, and not the eventual valuation comparison.
  In either residual case let $C$ bound the absolute error in Equation (12.11). The nonzero vertices have $v \( u_x \( 0 \) \) lt.eq B + C$. If $L \( E^(\( h_0 \)) \, 1 \) = 0$, the central coordinate at zero is zero, and a congruence of precision larger than $B + C$ is impossible. Hence the central value is nonzero. If $D \( h_0 \) > B + 2 C$, then $v \( u_0 \( 0 \) \) > B + C$, giving the same contradiction. This proves Equation (3.5) with $C_E = 2 C$. Only the specialization error determines this final loss; all pivot and pole bounds determine how large a cube is needed. ◻
]

== 13 Heegner points and transfer <sec:heegner-interpolation>

We prove the Heegner comparison, the genus and ring bounds, and the interpolation criterion stated in Section 3. The point and its paired functional define one determinant coordinate. Its central value measures the point index after the Selmer and local contributions have been subtracted. Local switches then control its divisors. An outer limit supplies the uniform ring bound when residual irreducibility is unavailable; a universal binary family supplies interpolation.

=== 13.1 Height and base Selmer comparisons <height-and-base-selmer-comparisons>

Retain the genus and ring data, character sums $P_c \( e \)$, and lattice indices of Section 3. We first justify the two comparisons used there.

#proof[
  The explicit Gross–Zagier formula for ring classes #cite(label("CaiShuTian2014")) Theorem 1.1, pp. 2524–2525 applies. Automorphic induction of the quadratic character gives the product in Equation (3.6). Discriminant and conductor are prime to $N$, and the classical split Heegner hypothesis holds; consequently the shared-prime corrections in the general formula are absent. The unit-index convention is constant in the fields retained here. With a character sum, solving the formula for the height gives exactly $c sqrt(\| k \|)$, as in Equation (3.6). The forward Gross–Zagier–Kolyvagin theorem gives the rank and finiteness assertion #cite(label("GrossZagier1986")) #cite(label("Kolyvagin1990")).
  For Equation (3.7), both free points are compared with the free line on $E^(\( h \)) \( bb(Q) \)$. Its regulator cancels from the ratio of their heights, since absolute canonical height is unchanged by twist identification. This height invariance follows from the canonical-height limit and the degree formula for heights under morphisms #cite(label("MilneEC2021")) Chapter IV, Lemmas 4.1 and 4.5–4.6, and Remark 4.12. The remaining variable factor is $sqrt(\| h k \|) L \( E^(\( h k \)) \, 1 \)$; its infinity sign is that of $h_(*)$. Period and lattice changes have bounded $2$-valuation. If the rank-one line is instead that of the fixed curve $E^(\( h_(*) \))$, its regulator is fixed and the same calculation gives Equation (3.8). ◻
]

#proof[
  Restriction, twisting, and addition or subtraction of conjugates give maps in both directions between the Selmer group over $K$ and
  $ "Sel"_(2^oo) \( E^(\( h_0 \)) \/ bb(Q) \) xor "Sel"_(2^oo) \( E^(\( h_0 k \)) \/ bb(Q) \) $
  whose composites are multiplication by $2$. They induce isogenies on divisible subgroups. On the finite quotients the kernel of either induced map is killed by $2$: subtract an element of the divisible subgroup to lift a divisible image, and then use the composite. The generator dimensions are uniformly bounded. Indeed the mod-$2$ Selmer group over $K$ is bounded by Kummer cohomology over $K \( E \[ 2 \] \)$; this is a quadratic extension of a fixed field with a bounded number of ramified primes. Kummer theory bounds the generator number of the corresponding pro-$2$ group over the fixed field, and the index-two subgroup bound preserves a uniform bound. The fixed local support includes that of $h_0$. The finite quotient on the displayed product is bounded by hypothesis; therefore its counterpart over $K$ has bounded length as well. For a finite collection of fields, finiteness of each quotient is enough. ◻
]

=== 13.2 Integral models and ring-class deformation <rl:section>

The determinant argument uses characters of increasing conductor. We construct their cochain limits together with maps to the original cochains. These maps will let us detect limiting Selmer classes by Galois evaluation and choose local switches. Later we retain the same maps through the outer limit needed for the ring bound.

Write $T = T_2 E$ and $Lambda = upright(bold(Z))_2 \[ \[ t \] \]$. For a quadratic squareclass $h$, put $T^h = T ⊗ chi_h$. The imaginary quadratic field $K$ satisfies the split Heegner hypothesis at $2 N$. We omit the two fields with extra units and, when $E$ has complex multiplication, its CM field. A quadratic character $chi$ comes from a quadratic twist over $upright(bold(Q))$. We use

$ A_i = \( upright(bold(Z)) \/ 2^i upright(bold(Z)) \) \[ t \] \/ \( t^i \) . $

The same constructions work over $A_i \[ G \]$ and $Lambda \[ G \]$, where $G$ is a fixed finite elementary abelian $2$-group and the additional character has values in $G$. Statements uniform in the number of generators of $G$ will be identified separately; finite-diagram compactness by itself is a statement for fixed $G$.

==== 13.2.1 Finite models with their cochain maps <finite-models-with-their-cochain-maps>

The general finite-model construction is Lemma 68. We apply it to the following arithmetic cochains and retain its actual contractions throughout.

For a profinite group and a finite free coefficient module over an Artin local ring $A$, continuous inhomogeneous cochains are flat: locally constant functions are the filtered union of the modules of functions on finite clopen partitions, and these modules are finite free. Their reduction is the cochain complex with reduced coefficients. The same observations apply to restrictions, mapping cones, and local conditions given by finite free complexes. In the applications below the groups are Galois groups of totally imaginary number fields or nonarchimedean local fields. Their $2$-cohomological dimension and the usual finiteness theorems give the bounded residual cohomology required in Lemma 68.

For an inner limit, the quadratic field $K$, the active conductor support, the finite group $G$, and the number of derivative primes are fixed. The residual representation is $E \[ 2 \]$: all the scalar characters and group-like coefficients become trivial in the residue field. Put $F = K \( E \[ 2 \] \)$. The number of places of $F$ in the permitted set $S_i$ is bounded even when its auxiliary primes move. Kummer theory bounds $H^1 \( G_(F \, S_i) \, upright(bold(F))_2 \)$ by the $S_i$-units modulo squares and $"Cl" \( F \) \[ 2 \]$; their dimensions are bounded by the unit rank, $\# S_i$, and the fixed class-group dimension. Hochschild–Serre for the fixed group $"Gal" \( F \/ K \)$ then bounds the residual global $H^1$ for $E \[ 2 \]$. The global Euler characteristic bounds $H^2$, and $H^0$ is already bounded. Local cohomology and the specified local conditions have bounded residual dimensions, since the local degrees of $K$ are at most two and the number of places is bounded. Thus the target Selmer cones over $K$ have uniformly bounded finite-model ranks in this inner limit. This bound may depend on the fixed active support; the stronger outer bound is proved in Lemma 88. No rank bound is asserted for cochains over the growing ring-class fields, or for the induced modules in their Shapiro descriptions.

#thm([Lemma 13.1.])[
  (Limits of finite diagrams).  #emph[Suppose diagrams of bounded finite free complexes over $A_i$, or over $A_i \[ G \]$, have a common bounded cohomological degree interval and bounded ranks in every degree. Include the chain homotopies and inverses for every asserted identity or equivalence. Along a cofinal subsequence, or a nonprincipal ultrafilter, their matrices converge to the same diagram of perfect complexes over $Lambda$ or $Lambda \[ G \]$.]
  #emph[Moreover, the contractions into the original cochains may be retained for the evaluation construction in Lemma 80. Adding finitely many new objects or maps does not require changing already chosen models for the old objects. Finite-stage arithmetic operations with unbounded source complexes are permitted when only finitely many of their outputs, and the witnesses to their identities, are retained in the bounded target complexes.]
] <rl:finite-limits>

#proof[
  There are finitely many possible graded ranks. Fix them on an ultrafilter-large set. At a fixed precision $j$, all matrix entries belong to the finite ring $A_j$ (or $A_j \[ G \]$), so have unique ultrafilter limits. These limits are compatible as $j$ varies. Matrix identities, including the homotopy-inverse identities, are finite polynomial identities and pass to the limit. New models and maps may be mapped to old models by their already fixed contractions. Passing to any slower cofinal precision has the same old limits. For the all-sequence evaluation statements below, fix this ultrafilter once and for all, and keep the original contraction at every stage. Later arithmetic diagrams must extend these same stages. Restriction to an ultrafilter-large set and passage to slower cofinal coefficient precision preserve every old evaluation on every old group sequence. Thus later operations use the same stage diagrams and ultrafilter, preserving the arithmetic maps already constructed.
  Here is the last assertion in cochain terms. Let $D_i$ be an original target cochain complex, with contraction $\( iota_i \, pi_i \, h_i \)$ onto its bounded finite model $C_i$. Perform transfer and scalar weighting at stage $i$ before applying this contraction. A resulting cycle $z'_i in D_i^1$ gives $z_i = pi_i z'_i in C_i^1$, and
  $ z'_i - iota_i z_i = d \( h_i z'_i \) . $
  Thus its relation to the original arithmetic cocycle is retained by the original contraction. If an identity in the target is $u'_i - v'_i = d w'_i$, retain the vectors $pi_i u'_i \, pi_i v'_i \, pi_i w'_i$; the corresponding identity is still exact. For identities involving maps between target complexes, use the transported maps $pi'_i f_i iota_i$ and their contraction homotopies, so that the same assertion includes the required boundary corrections. Local lifts, closed degree-two functionals, and witnesses to specialization, duality and switch identities are treated in the same way. They are finitely many vectors or matrices of bounded size. Their entries, as well as the differentials, therefore have simultaneous limits. Neither a free model of the arithmetic source nor the entire transfer map from that source is included in the limiting diagram. Any precision lost in a finite-stage calculation is accounted for before retaining these vectors; passing to the same slower cofinal precision for the whole diagram preserves all its identities. ◻
]

The finite models now retain both the original cochains and their comparison maps. We next specify the local conditions on those cochains. The point is to retain the actual Kummer images at every place dividing $2 N$; the determinant comparisons will use their integral orthogonality, not just the rational Selmer ranks.

==== 13.2.2 Integral local conditions and duality <integral-local-conditions-and-duality>

#thm([Lemma 13.2.])[
  (Integral Kummer local condition).  #emph[ Let $F$ be a finite extension of a nonarchimedean local field of characteristic zero, and let $B \/ F$ be any elliptic curve. Put $M_F = B \( F \)_2^and = "proj lim"_n B \( F \) \/ 2^n B \( F \)$. There is a perfect local condition 
$ U_F = M_F \[ - 1 \] arrow.r R Gamma \( F \, T_2 B \) . $

 For every $n gt.eq 1$, derived reduction has 
$ H^0 \( U_F ⊗^(upright(bold(L))) upright(bold(Z)) \/ 2^n \) = B \( F \) \[ 2^n \] \, #h(2em) H^1 \( U_F ⊗^(upright(bold(L))) upright(bold(Z)) \/ 2^n \) = B \( F \) \/ 2^n B \( F \) . $

 Its map in degree zero is the isomorphism onto $H^0 \( F \, B \[ 2^n \] \)$, and its map in degree one is the finite Kummer injection. The condition is its own exact orthogonal complement under local Tate duality, for every reduction type and with no hypothesis on $B \[ 2 \]$.]
] <rl:kummer>

#proof[
  The local analytic description of $B \( F \)$ shows that $M_F$ is a finitely generated $upright(bold(Z))_2$-module. Its torsion is the finite group $B \( F \) \[ 2^oo \]$. Consequently $M_F$ has a free resolution of length at most one. Also $H^0 \( F \, T_2 B \) = 0$, since $B \( F \) \[ 2^oo \]$ has bounded exponent. The integral Kummer injection into $H^1 \( F \, T_2 B \)$ therefore defines the displayed morphism using the truncation in degrees at most one of $R Gamma \( F \, T_2 B \)$.
  Tensor the free resolution of $M_F$ with $upright(bold(Z)) \/ 2^n$. Its two cohomology groups are $M_F \[ 2^n \]$ and $M_F \/ 2^n M_F$. The inverse limits of the ordinary Kummer sequences identify their maps as asserted.
  For orthogonality, compose cup product and the Weil pairing with the local invariant map. A morphism
  $ M_F \[ - 1 \] ⊗^(upright(bold(L))) M_F \[ - 1 \] arrow.r upright(bold(Z))_2 \[ - 2 \] $
  is determined by its homomorphism $M_F ⊗ M_F arrow.r upright(bold(Z))_2$: the possible $"Tor"_1$ is in degree one and gives no extra degree-zero morphism to this target. The indicated homomorphism vanishes, because the finite Kummer image annihilates itself at every level by local Tate duality. Choose a nullhomotopy in free models. The induced morphism
  $ R Gamma \( F \, T_2 B \) \/ U_F arrow.r R "Hom"_(upright(bold(Z))_2) \( U_F \, upright(bold(Z))_2 \) \[ - 2 \] $
  is a quasi-isomorphism. This can be checked after reduction modulo $2$: degree one is the perfect pairing of the finite Kummer quotient with the Kummer image, and degree two is dual to $B \( F \) \[ 2 \]$. Its perfect cone is therefore zero by derived Nakayama. This proves exact orthogonality and also its compatibility with derived reduction. This is precisely the finite-module duality input of #cite(label("Nekovar2006")) Proposition 5.2.4. ◻
]

Where the scalar deformation is trivial, extend this local condition by derived scalar extension to $A_i$ or $A_i \[ G \]$. At an unramified good prime use the inflated residue-field complex

$ U_v = \[ thin M arrow.r^("Fr"_v - 1) M thin \] quad upright("in degrees ") 0 \, 1 . $

Its quotient in full local cochains is the singular local complex. The full local condition is the identity on local cochains, and its orthogonal strict condition is zero. At a derivative prime the conditions used later are the following specified truncations instead. In its split local model write

$ L_v = D^0 xor \( F_v xor S_v \) \[ - 1 \] xor D^2 \[ - 2 \] \, $

where the differential is zero, $D^0$ is dual to $D^2$, and the finite and transverse planes $F_v \, S_v$ are each isotropic. Put

$ U_(upright("str")) = D^0 \, #h(2em) U_(upright("rel")) = D^0 xor \( F_v xor S_v \) \[ - 1 \] \, #h(2em) U_F = D^0 xor F_v \[ - 1 \] \, #h(2em) U_S = D^0 xor S_v \[ - 1 \] . $

Then $U_(upright("str"))^perp = U_(upright("rel"))$ and each plane condition is its own orthogonal complement. Every displayed condition maps isomorphically onto local $H^0$ and injectively into local $H^1$. Thus they satisfy precisely the detection hypotheses used below. Their finite arithmetic realization and the isotropic-plane nullhomotopies are part of the derivative construction; these truncated conditions are not identified with the full local condition.

For a finite permitted set $S$ the Selmer complex is, by definition,

#[#set math.equation(numbering: n => "(13.1)")
 $ C_S = "Cone" (R Gamma \( G_(K \, S) \, M \) xor xor.big_(v in S) U_v arrow.r xor.big_(v in S) R Gamma \( K_v \, M \)) \[ - 1 \] . $ <rl:selmer-definition>]

At $2 N$ take the Kummer conditions just constructed. Restriction and localization triangles are the triangles of this cone. The finite rings $A_i$ and $A_i \[ G \]$ are Frobenius coefficient rings; alternatively the duality maps may be checked after reduction to their residue field. Exact local orthogonality and global duality therefore give

#[#set math.equation(numbering: n => "(13.2)")
 $ C_S tilde.eq R "Hom" \( C_S^perp \, A_i \) \[ - 3 \] \, $ <rl:global-duality>]

with the appropriate dual representation. This application uses the orthogonality hypotheses of #cite(label("Nekovar2006")) Theorem 6.3.4; the theorem is not being used to assert the existence of a varying-prime limit. Complex places contribute zero Tate complexes. If the character is inverted by the nontrivial automorphism of $K \/ upright(bold(Q))$, conjugate transport followed by the Weil pairing identifies the two representations over the same scalar ring. All maps and nullhomotopies in this paragraph are finite diagrams to which Lemma 74 applies.

=== 13.3 The moving conductor character <sec:h:conductor-direction>

The conductor character must preserve the local conditions at $2 N$ while making the new local terms invertible after reduction modulo $2$ and inversion of $t$. The following proposition supplies those local values. Its separate bounds on Tate Frobenius control the contribution of the moving prime when we later specialize to $t = 0$.

#thm([Proposition 13.3.])[
  (Ring-class characters with prescribed local values).  #emph[ Fix finitely many split primes of $K$ above odd rational primes, outside $2 N$, and orient one prime in each conjugate pair. There are distinct split rational primes $r_i$ avoiding all the fixed data and characters 
$ xi_i : "Gal" \( H_(r_i) \/ K \) arrow.r upright(bold(Z)) \/ 2^(n_i) upright(bold(Z)) \, #h(2em) n_i arrow.r oo \, $

 such that $xi_i$ is surjective on the inertia quotient at $r_i$, is zero at the primes above $2 N$, and has odd value at each prescribed oriented prime. We can require $r_i arrow.r 1$ in $upright(bold(Z))_2$ and 
#[#set math.equation(numbering: n => "(13.3)")
 $ v_2 \( 2 + a_(r_i) \( E \) \) \, quad v_2 \( 2 - a_(r_i) \( E \) \) \, quad v_2 det \( 1 plus.minus "Fr"_(r_i) divides T \) med lt.eq c_E . $ <eq:h:r-avoidance>]

 The constant $c_E$ is independent of the list and of $K$.]
] <rl:characters>

#proof[
  We give the compatibility argument before imposing the Tate condition. Choose prime ideals $frak(p)_1 \, dots.h \, frak(p)_s$ with pairwise disjoint conjugate pairs, including the oriented prescribed primes and the primes above $2 N$, and enough additional split prime ideals to generate $"Cl" \( K \)$. Such additional ideals may avoid any fixed finite set. Put weight $w_j = 1$ at a prescribed odd prime and $w_j = 0$ at every additional prime and every prime above $2 N$. The conjugate weight is $- w_j$. Let
  $ R = ker #scale(x: 120%, y: 120%)[\(] upright(bold(Z))^s arrow.r "Cl" \( K \) #scale(x: 120%, y: 120%)[\)] \, $
  choose a basis $m^(\( a \))$ of $R$, and choose $beta_a in K^times$ with $\( beta_a \) = product_j frak(p)_j^(m_j^(\( a \)))$.
  Work first over $F_oo = K \( mu_(2^oo) \)$ and adjoin $2^n$-th roots of the finitely many $beta_a \/ overline(beta)_a$. Prescribe on these roots the multipliers
  #[#set math.equation(numbering: n => "(13.4)")
   $ zeta_(2^n)^(thin - sum_j m_j^(\( a \)) w_j) . $ <rl:kummer-prescription>]
  The minus sign fixes the choice of connecting map in the ring-class sequence and could be reversed throughout. These prescriptions respect every Kummer relation. Indeed, if
  $ product_a \( beta_a \/ overline(beta)_a \)^(b_a) in \( F_oo^times \)^(2^n) \, $
  take its valuation at a prime above each $frak(p)_j$ of nonzero weight. These odd primes are unramified in $F_oo \/ K$. Thus $2^n$ divides $sum_a b_a m_j^(\( a \))$ for each such $j$, proving the required compatibility of (13.4). Primes over $2$ have weight zero and impose no division by a ramification index. Units impose no additional weighted relation. Kummer duality supplies the prescribed automorphism of the radical extension over $F_oo$.
  At a rational prime $r$ split in a sufficiently large finite cyclotomic subfield, the power-residue character of $upright(bold(F))_r^times$ is surjective onto $mu_(2^n)$. The split ring-class exact sequence is
  $ 1 arrow.r \( cal(O)_K \/ r cal(O)_K \)^times \/ \( upright(bold(Z)) \/ r upright(bold(Z)) \)^times arrow.r "Pic" \( upright(bold(Z)) + r cal(O)_K \) arrow.r "Cl" \( K \) arrow.r 1 . $
  The excluded extra-unit fields are the only source of a unit correction. The first group is $upright(bold(F))_r^times$, with a principal relation measured by $beta \/ overline(beta)$ at the oriented prime over $r$. Consequently (13.4) says exactly that its primitive power-residue character extends to the class group with the specified values $w_j$. More explicitly, the inertia group and the chosen ideal classes present the ring-class group, and the basis of $R$ lists its additional relations. We have imposed those relations on the inertia character itself; we have not divided by a class-group order to extend a previously fixed character. Thus this construction introduces no denominator, even when the class number has a large $2$-part. The class group and the number of prescribed primes change the finite Chebotarev extension, but not the integrality of the character. Since the ring-class extension is unramified at $2 N$, value zero on Frobenius means that the resulting local character is trivial there. Conjugation acts by inversion.
  We now show that imposing these finitely many radical conditions cannot force either forbidden Tate trace. In the non-CM case the image of $G_(K \( mu_(2^oo) \))$ is an open subgroup of $"SL"_2 \( upright(bold(Z))_2 \)$, by the fixed-prime open-image theorem and the cyclotomic determinant identity #cite(label("Serre1968")) Chapter IV, §2.2, theorem, p. IV-11, and Chapter I, §1.2, Example 2, p. I-4: the image is the intersection of the open image of $G_K$ with the determinant-one subgroup. Its index in the corresponding fixed-$E$ image changes by at most two when $K$ changes. Its commutator subgroup contains a fixed open subgroup $U_E$ of $"SL"_2 \( upright(bold(Z))_2 \)$. One may see uniformity by starting with a principal congruence subgroup in the fixed image: every index-two subgroup contains its squares, and the commutators of the resulting fixed congruence subgroup are open. Because the radical extension over $F_oo$ is abelian, these commutators act trivially on it. Hence every permitted Tate coset contains a translate of $U_E$.
  For completeness, in the CM case let $M$ be the CM field. The image over $K M \( mu_(2^oo) \)$ contains a fixed open subgroup of the norm-one Cartan; the index changes by a bounded factor, as $\[ K M : upright(bold(Q)) \] lt.eq 4$. Choose $gamma in G_(K M)$ with $chi_(upright("cyc")) \( gamma \) = 5^4 = 625$. This is possible uniformly: the cyclotomic image of $G_(K M)$ has index at most four in $upright(bold(Z))_2^times$, so contains fourth powers. On the radical Galois group, conjugation by $gamma$ is raising to $625$, because all the radicands lie in $K$. On the Tate image over $K M$, conjugation is trivial. Therefore
  $ gamma u gamma^(- 1) u^(- 625) \, #h(2em) u in G_(K M \( mu_(2^oo) \)) \, $
  fixes every prescribed radical and acts on $T$ as $rho_T \( u \)^(- 624)$. Raising to the fixed nonzero power $624$ carries an open subgroup of the one-dimensional norm-one Cartan onto an open subgroup. This proves the required uniform kernel statement also in the CM case. The open Cartan image used here is the CM part of the usual $ell$-adic image theorem #cite(label("Serre1968")) Chapter IV, §2.2, Remark, p. IV-13.
  On a coset of an open subgroup of $"SL"_2$, trace is not identically $2$ or $- 2$. The same holds on a coset of an open norm-one Cartan subgroup; on the other Cartan-normalizer component trace is zero. The relevant determinant-one sets are compact and have finitely many cosets modulo the fixed open subgroup. Choose in each coset an element whose trace is neither forbidden value. The largest of the finitely many resulting valuations is a constant depending only on $E$.
  Finally restrict the prescribed radical automorphism and such a Tate lift to a finite Galois extension, including as many roots of unity as required. Chebotarev gives infinitely many rational primes with this Frobenius class; choose the place over the prime to realize the chosen representative. They split in $K$ and have arbitrarily high prescribed congruence to $1$. Since $det \( 1 plus.minus "Fr"_r \) = 1 plus.minus a_r + r$, a congruence precision larger than the fixed trace bound gives all of (13.3). All these conditions concern a finite extension at each stage. ◻
]

Choose $n_i$ large enough that $1 + t$ has order dividing $2^(n_i)$ in $A_i^times$, and put $Psi_i = \( 1 + t \)^(xi_i)$. For example $n_i gt.eq 2 i$ is sufficient. Orient the inertia generator to act by $1 + t$; the prescribed split Frobenius exponents remain odd in the limit. Use global cochains unramified outside $2 N$, $r_i$, the active conductor primes and the derivative primes already retained. At $2 N$ use the Kummer conditions above and elsewhere outside the conductors use the unramified condition. Reduction modulo $t$, with the unramified condition restored at $r_i$, gives the ordinary fixed-field complex; retain its comparison map at every finite stage.

#thm([Lemma 13.4.])[
  (Acyclic relaxed local complexes).  #emph[ For a primitive character constituent, let $C$ denote the limiting Selmer complex with full conditions at $r$ and at its active good conductor primes, and the prescribed Kummer, unramified or derivative conditions elsewhere. The limiting full local complexes are acyclic over every height-one residue field of $Lambda$ of characteristic zero. At $\( 2 \)$, with residue field $Omega = upright(bold(F))_2 \( \( t \) \)$, the $r$-complex is acyclic, as are the complexes at active split primes with odd prescribed Frobenius exponent of the deformation character and at active primes $q$ with $t_q = 0$. At each of these acyclic relaxed places, the full and orthogonal strict conditions agree on the indicated test. If every relaxed place is acyclic at that test and the remaining local conditions are self-dual, global duality makes the Selmer complex self-dual. The Selmer complex has no global invariants on these tests.]
] <rl:local-acyclic>

#proof[
  Use tame inertia and unramified Frobenius, or the Hochschild–Serre complex for these two procyclic directions. At $r$, inertia minus one is multiplication by $t$ times a unit. It is invertible on all the indicated fields except the characteristic-zero fiber $t = 0$. There, $r arrow.r 1$, and the two remaining Frobenius differentials have nonzero determinant by (13.3), including either sign of the quadratic twist. The bound also ensures that the integral local torsion at this central fiber has bounded length.
  At an active odd conductor prime, inertia of the quadratic character acts by $- 1$. Its differential is thus $- 2$ and is invertible in characteristic zero. In characteristic two the quadratic character disappears. At a split prime the Frobenius action is $z B$, where $B in "GL"_2 \( upright(bold(F))_2 \)$ and $z = \( 1 + t \)^a$ has odd $a in upright(bold(Z))_2$. Its coefficient of $t$ is one, so $z$ is nonconstant. No nonzero polynomial over the finite constant field vanishes at $z$. Thus both Frobenius complexes, with operators $z B - 1$ and $q^(- 1) z B - 1$, are invertible over $Omega$; here $q = 1$ in the residue field. No irreducibility assumption is used.
  If $t_q = 0$, the rational residual Frobenius $B$ has order three. At a split place the operator is again $z B - 1$, invertible whether $z$ is nonconstant or $z = 1$. At an inert place the ring-class Frobenius is trivial, since the ideal $\( q \)$ is principal, and the Tate Frobenius is $B^2$, which also has no eigenvalue one. These observations give the additional $t_q = 0$ assertion.
  The orthogonal full and strict conditions agree at each place where full local cochains are acyclic. When this holds at every relaxed place and the remaining local conditions are self-dual, Equation (13.2) gives global self-duality. Global invariants in characteristic two are excluded by the nontrivial $r$-inertia scalar. In characteristic zero the same argument works unless the scalar is trivial; in that case $T ⊗ upright(bold(Q))_2$ over $G_K$ is absolutely irreducible. For non-CM curves this follows from the open image, and for CM curves from the open Cartan and its nontrivial normalizer component, since $K$ is not the CM field. Lemma 80 below realizes these actions on the limiting complex as well. On the self-dual tests, duality pairs degrees one and two. ◻
]

=== 13.4 The Heegner determinant and its central value <sec:h:specialization>

The point index is not itself the quantity transferred across a growing family. Each new conductor prime changes the local Selmer terms as well as the point. We combine these changes in a determinant coordinate. Its central valuation will be twice the point index, less the finite Selmer length and the conductor contribution. This formula reduces the index estimates to lower bounds for the determinant coordinate.

Retain a primitive genus or ring instance from Section 3, with point $P_c \( e \)$ over $K$. Use the conductor characters just constructed, taking $n_i gt.eq 2 i$, and the representations $T chi_e Psi_i$. Retain the same auxiliary primes and the same fixed inner ultrafilter, now denoted $cal(U)_(upright("in"))$.

The Selmer complex $C$ is a coefficientwise limit of the corresponding finite free cochain models along $cal(U)_(upright("in"))$. It has the integral Kummer condition at $2 N$, the full condition at $r_i$ and the active good conductor primes, and the unramified condition at all other permitted finite places. Here the full condition means that no restriction is imposed on local cochains. Section 13.2 and Lemma 77 constructed the local models, their duality maps, and the comparison at $t = 0$. We use these concrete complexes and maps; cohomologically equivalent complexes without the comparison maps would not suffice for the later prime choices. Over $"Frac" \( Lambda \)$, the modified full local complexes are acyclic, so the full conditions agree with their orthogonal strict conditions. Global duality, followed by conjugate transport and the Weil pairing, therefore gives a perfect pairing

$ H^1 \( C ⊗_Lambda "Frac" \( Lambda \) \) times H^2 \( C ⊗_Lambda "Frac" \( Lambda \) \) arrow.r "Frac" \( Lambda \) . $

Here conjugation in $K \/ bb(Q)$ inverts the ring-class character. These are the pairing and identification supplied by Equation (13.2) and Lemma 77.

Fix the single integer multiplier $L$ of Lemma 13.12. It depends on the curve, parametrization and fixed local types, and clears descent and local Kummer ambiguities for the complete conductor. In particular its valuation does not grow with the number of primes. The following construction and formulas include that multiplier throughout.

At each finite stage transfer the Kummer class of $y_(c r_i)$ from $H_(c r_i)$ to $K$ with the specified scalar coefficients, using $L y_(c r_i)$. Complete the finite coset sum before contracting its target cocycle and local Kummer lifts into the models over $K$. The resulting cycles $P_i$, with their contraction witnesses, give $P in H^1 \( C \)$ by Lemma 74. Local Kummer conditions at $2 N$ are preserved because $Psi_i$ is trivial there. At the center of the $i$th finite model, the norm relation has the factor

#[#set math.equation(numbering: n => "(13.5)")
 $ b_i & = a_(r_i) - chi_e \( "Fr"_(frak(r)_i) \) - chi_e \( "Fr"_(macron(frak(r))_i) \) \, #h(2em) r_i = frak(r)_i macron(frak(r))_i \,\
P_i \|_(t = 0) & = epsilon_i b_i kappa \( L P_c \( e \) \) . $ <eq:h:trace-center>]

where $kappa$ denotes the Kummer class in the central comparison and $epsilon_i$ is a unit; the equality is taken modulo the finite coefficient precision. Since $chi_e$ is defined over $bb(Q)$, its values at the conjugate Frobenius elements agree; explicitly, $b_i = a_(r_i) - 2 chi_e \( r_i \)$. To retain the central identity at the cochain level, let $B_i$ be the reduction of a fixed finite model of the ordinary Kummer complex over $K$, and let $beta_i : B_i arrow.r C_i \/ \( t \)$ be its comparison map to the relaxed central complex. Choose a cycle $q_i$ representing $kappa \( L P_c \( e \) \)$. The finite norm relation gives a boundary witness $v_i$ in the target model such that

$ P_i med mod med t - epsilon_i b_i beta_i \( q_i \) = d v_i . $

Retain $beta_i \, q_i \, v_i$, and the target contraction homotopies on the same stages and at the same coefficient precision as $P_i$. Retain these units in the same ultrafilter $cal(U)_(upright("in"))$ as all the comparison maps. Then $b = lim_(cal(U)_(upright("in"))) b_i$ has bounded valuation by Equation (13.3), and $epsilon = lim_(cal(U)_(upright("in"))) epsilon_i$ is a unit. Thus $P \|_(t = 0) = epsilon b kappa \( L P_c \( e \) \)$, with $b eq.not 0$. The special complex differs from the ordinary Kummer complex only by the active-prime relaxed quotients and the limit of the singular quotient at the single moving prime $r_i$, the latter of bounded length. Inflation from the complexes omitting $r_i$ gives this comparison. All modified local complexes are rationally acyclic at the center, so pairings agree there as well.

If the product has a simple zero, its rational special fiber has one-dimensional cohomology in degrees one and two, and $P$ specializes nontrivially by Gross–Zagier. The generic dimensions are at most these special dimensions. Moreover, the long exact sequence for multiplication by $t$ shows that $H^1 \( C \[ 1 \/ 2 \] \) \[ t \] = 0$, since the special $H^0$ vanishes. A torsion class that disappeared over the generic field would be killed by a power of $t$ after localization at $\( t \)$; hence the nonzero special class cannot disappear. Thus the generic ranks are one in degrees one and two, $P$ spans $H^1$, and the rational rank is constant at $t = 0$. If only base Selmer corank one is known, the same dimension bound gives generic ranks at most one; a zero generic point is allowed.

#prodef([Definition 13.5.])[
  Choose an integral basis of $det_Lambda^(- 1) C$. In generic rank one, the element formed by $P$ in $H^1$ and the functional $chevron.l P \, dot.op chevron.r$ on $H^2$ determines a scalar $u \( C \, P \) in "Frac" \( Lambda \)$ in that basis. Put $u = 0$ if $P = 0$ or the generic rank is zero. Integral changes of determinant basis multiply $u$ by a unit.
] <def:h:determinant-coordinate>

In the simple-zero case, constancy of the rational cohomology rank at $t = 0$ makes $u$ regular in the local ring $Lambda_(\( t \))$. Its value $u \( 0 \) in bb(Q)_2$ is therefore already defined. This specialization takes place at $\( t \)$; the stronger assertion $u in Lambda \[ 1 \/ 2 \]$ will follow from the divisor estimates below.

The determinant has a simple integral interpretation. On a rank-one free Selmer line, the point and its paired functional each contribute the point’s index. Torsion in degree two subtracts its length from the coordinate in the inverse determinant lattice. For example, the complex $\[ bb(Z)_2 arrow.r^(2^a) bb(Z)_2 \]$ in degrees one and two has inverse determinant lattice mapping to $2^a bb(Z)_2$ in the rational determinant. The coordinate of a fixed rational tensor therefore loses $a$ in valuation. The next lemma carries out this calculation with the actual local Kummer conditions. It also compares the Selmer length over $K$ with those of the two rational twists.

#thm([Lemma 13.6.])[
  (Central determinant valuation).  #emph[For a simple-zero instance, 
#[#set math.equation(numbering: n => "(13.6)")
 $ v \( u \( 0 \) \) & = 2 j \( P_c \( e \) \) - "length" "Sha" \( E^(\( e \)) \/ K \) \[ 2^oo \] - sum_(q divides c) sum_(v divides q) t_v + O_E \( 1 \) \,\
t_v & = dim_(bb(F)_2) E \[ 2 \]^("Fr"_v) . $ <eq:h:central-determinant>]

 Furthermore, 
#[#set math.equation(numbering: n => "(13.7)")
 $ "length" "Sha" \( E^(\( e \)) \/ K \) \[ 2^oo \] + sum_(q divides c) sum_(v divides q) t_v = s \( e \) + s \( e k \) + sum_(q divides k) t_q + 2 sum_(q divides c) t_q + O_E \( 1 \) . $ <eq:h:weil-restriction-length>]

 The constants include the one fixed class multiplier and the bounded local contribution at the moving prime $r_i$.]
] <lem:h:central-valuation>

#proof[
  The ordinary integral Kummer complex over $K$ is self-dual. Its $H^1$ is the compact Selmer module, and the torsion in $H^2$ has the length of the finite quotient of the discrete Selmer group by its divisible subgroup. This follows by derived base change to $bb(Q)_2 \/ bb(Z)_2$: the local complexes give exactly the discrete Kummer conditions. In the present simple-zero case that finite quotient is $"Sha" \( E^(\( e \)) \/ K \) \[ 2^oo \]$. Duality pairs the free parts in degrees one and two perfectly. Torsion in degrees one and three costs a bounded amount, by global torsion and duality. The uniform torsion bound here comes from a fixed nonidentity Tate scalar acting trivially on every ring-class field in the construction: its scalar minus one annihilates that torsion. Lemma 81 constructs this scalar, and the descent argument of Lemma 13.12 uses the same bound.
  At an active odd conductor place inertia acts by minus identity. All integral $H^1$ is Kummer, and the relaxed quotient contributes only $H^2 \( K_v \, T^e \)$ in degree two. Its length is $t_v$, by local duality and the fixed $2$-torsion. At the moving prime $r_i$ the contribution is bounded by Equation (13.3). The generic pairings specialize to the ordinary Kummer pairing because the modified local complexes are rationally acyclic at the center. Thus the free determinant tensor has valuation twice the point index, whereas torsion in degree two contributes negative length to the inverse determinant. Together with Equation (13.5), this proves Equation (13.6). The specialization is at constant rational cohomology rank, so no specialization torsion is being substituted for the point.
  For Equation (13.7), apply the isogeny invariance of the BSD quotient to quadratic Weil restriction and $E^(\( e \)) times E^(\( e k \))$ #cite(label("Tate1966")) Theorem 2.1 and the preceding discussion. All the groups in this comparison are finite apart from the known rank-one lattices; no BSD equality is assumed. The forward and reverse isogenies have composites multiplication by $2$. Consequently the rank-one lattice indices, height ratios, torsion ratios and period ratios contribute bounded $2$-powers. For periods, the pullback indices of Néron differentials at $2$ are bounded by those composites; real kernels and component ratios are bounded as well.
  The remaining terms are the Tamagawa numbers. A ramified quadratic twist of good reduction at an odd prime $q$ has type $I_0^(*)$ and component number one plus the number of roots of its reduced auxiliary cubic #cite(label("BarriosEtAl2025")) Theorem 4.1, Table 4 and proof, Case 3. To identify this number, write a good integral model as $y^2 = f \( x \)$, retaining the quadratic term, and the twisting parameter as $d = pi u$. The auxiliary cubic is $macron(u)^3 macron(f) \( T \/ macron(u) \)$; it is separable and its roots correspond to the nonzero rational two-torsion points. Thus the component number is $\# E \[ 2 \]^(upright("Fr")_q)$ and its $2$-valuation is $t_q$. This argument also applies in residue characteristic $3$. Its connected reduction is unipotent. Some inertia element acts by $- 1$ on the twisted $2$-adic representation, so its local $2$-primary torsion is precisely its Frobenius-fixed $2$-torsion. Over an unramified extension the same formula holds with the Frobenius of the enlarged residue field. At unramified or split places, Weil-restriction component numbers are the products over $v divides q$. At a prime $q divides k$ outside $2 N$, the curve over $K$ has good reduction and its Weil restriction has connected special fiber. Indeed, Weil restriction of its Néron model is the Néron model of the restriction of the curve #cite(label("BoschLutkebohmertRaynaud1990")) Section 7.6, Proposition 6. Its special fiber has the original connected elliptic fiber as quotient, with connected vector-group layers from ramification. Exactly one rational twist has the ramified component factor. At a conductor prime $q divides c$, the two rational twists give a combined valuation $2 t_q$, and the corresponding contribution over $K$ is $sum_(v divides q) t_v$. All places above $2 N$ have bounded local contributions. These are precisely the terms of Equation (13.7). ◻
]

In a simple-zero genus instance, the fixed partner absorbs the terms involving $h_(*)$, while $c = 1$ and $k = h h_(*)$. The displayed formulas therefore identify

$ v \( u \( 0 \) \) = 2 j \( P_1 \( h_(*) \) \) - 2 w \( h \) - s \( h \) + O_(E \, h_(*)) \( 1 \) . $

In a simple-zero ring instance with $omega \( k \) lt.eq a$, the discriminant term is bounded and the conductor term is $4 w \( h \)$, giving

$ v \( u \( 0 \) \) = 2 j \( P_(\| h \|) \( h \) \) - 4 w \( h \) - s \( h \) - s \( h k \) + O_(E \, a) \( 1 \) . $

The ring identity also applies to the interpolation families in which an added nonsplit prime has $t_q = 0$; such a prime contributes no weight. The all-split hypothesis is needed for the uniform ring lower bound. These formulas explain both the lower-bound statements and the normalization in Heegner interpolation. To prove the lower bounds, we must show that $u$ has no negative divisor away from $\( 2 \)$ and has a uniformly bounded negative divisor at $\( 2 \)$ in the stated cases. We will construct integral local switches that preserve its determinant valuation, and use inner detection to choose switches lowering excess Selmer rank. The uniform ring estimate will require an additional characteristic-zero limit; the universal binary family will instead require a bounded clearing factor after the new local blocks have been removed.

The main intermediate estimate is

#[#set math.equation(numbering: n => "(13.8)")
 $ v_(frak(p)) \( u \) & gt.eq 0 &  & #scale(x: 120%, y: 120%)[\(] "ht" frak(p) = 1 \, med frak(p) eq.not \( 2 \) #scale(x: 120%, y: 120%)[\)] \,\
v_(\( 2 \)) \( u \) & gt.eq - O_(E \, h_(*)) \( 1 \) &  & upright("in genus data with irreducible ") E \[ 2 \] \,\
v_(\( 2 \)) \( u \) & gt.eq - O_(E \, a) \( 1 \) &  & upright("in ring data with ") omega \( k \) lt.eq a upright(" and all active primes split.") $ <eq:h:divisor-bounds>]

To construct the switches used in these estimates, we first retain enough Galois evaluation data to select their derivative primes.

=== 13.5 Evaluation and the exact kernel <evaluation-and-the-exact-kernel>

The determinant estimates require switches that detect the excess Selmer dimension at a height-one test. To choose switching primes, we must still detect a nonzero limiting Selmer class by Galois evaluation. The next two lemmas first retain that detection under coefficient specialization, then restrict it to sequences acting trivially on the full Tate module, all ring-class fields, and the quadratic characters in use.

#thm([Lemma 13.7.])[
  (Evaluation on arbitrary Galois sequences).  #emph[ Fix $K$ and a sequence of the finite cochain constructions above. Keep the contraction maps into the original global cochains. Let $Gamma_K = product_i G_K$ and $Gamma = Gamma_K times.r chevron.l tau chevron.r subset product_i G_(upright(bold(Q)))$, with simultaneous complex conjugation $tau$. Thus $Gamma_K$ has index two in $Gamma$; the larger unrestricted product of rational Galois groups is not used for induction. The matrix limit defines a coefficient action of $Gamma_K$ on $Lambda^2$. For every field $L$ receiving a map from $Lambda$, there is a natural injection 
$ H^1 \( C ⊗_Lambda L \) arrow.r H_(upright("abs"))^1 \( Gamma_K \, L^2 \) \, $

 where the right side denotes abstract crossed-homomorphism classes. Here $C$ may be the global complex or a Selmer complex whose local conditions contain all local degree-zero invariants and inject into local $H^1$. The same statement holds for the induced representation of $Gamma$.]
  #emph[The evaluation maps and their degree-two cochain identities exist for every group sequence and commute with coefficient extension.]
] <rl:evaluation>

#proof[
  Let $C_i$ be a finite model and let $iota_i$ be its chosen map to the original global cochains, using the projection from the Selmer cone when appropriate. For every $g = \( g_i \)$ and $h = \( h_i \)$ define matrices
  $ e_i^0 : C_i^0 arrow.r A_i^2 \, quad e_(g \, i)^1 : C_i^1 arrow.r A_i^2 \, quad e_(g \, h \, i)^2 : C_i^2 arrow.r A_i^2 $
  by evaluating $iota_i$ in degrees zero, one, and two. Their source ranks are fixed and their entries belong to $A_i$. Thus each has a coefficientwise ultrafilter limit, for every choice of $g \, h$. The same fixed ultrafilter defines these limits for all $g \, h$. Likewise $rho \( g \) = lim_i rho_i \( g_i \)$ is a representation. The original cochain identities imply
  #[#set math.equation(numbering: n => "(13.9)")
   $ e_g^1 d & = \( rho \( g \) - 1 \) e^0 \,\
e_(g \, h)^2 d & = rho \( g \) e_h^1 - e_(g h)^1 + e_g^1 . $ <rl:eval-boundary>]
  All identities pass to the limit because their matrix expressions have finitely many terms. A cycle $x in C^1 ⊗ L$ consequently gives the crossed homomorphism $g mapsto e_g^1 \( x \)$, and a boundary gives a coboundary.
  We prove injectivity in a way that also controls base change. At each finite stage let $k = upright(bold(F))_2$ be the residual field. Choose a space of representatives for residual $H^1$. Evaluate pairs $\( c \, m \)$, where $c$ is in this space and $m in k^2$, by $b_c \( g \) - \( rho \( g \) - 1 \) m$. The intersection of the kernels of all these evaluations consists precisely of pairs $\( 0 \, m \)$ with $m$ an invariant. Since the vector space is finite dimensional, a list of at most $dim H^1 + 2$ elements already has this intersection. For these elements evaluation is a chain map
  $ C_i arrow.r D_i = \[ thin A_i^2 arrow.r^(\( \( rho_i \( g_j \) - 1 \) \)_j) \( A_i^2 \)^d thin \] $
  in degrees zero and one, inducing an isomorphism on residual $H^0$ and an injection on residual $H^1$. For Selmer complexes this uses the exact sequence of (13.1): the indicated local degree-zero isomorphisms give $H^0 \( C_i \) = H_(upright("glob"))^0$ and $H^1 \( C_i \) arrow.r.hook H_(upright("glob"))^1$ residually.
  Retain these matrices and their chosen group-element sequences. The residual global and local complexes, and the local conditions, have no negative cohomology. The cone definition therefore gives $H^n \( C ⊗ k \) = 0$ for $n < 0$. Put $Q = "Cone" \( C arrow.r D \)$. The long exact sequence gives $H^n \( Q ⊗ k \) = 0$ for $n < - 1$; its groups in degrees $- 1$ and $0$ vanish because the detecting map is an isomorphism on $H^0$ and injective on $H^1$. Any $H^3 \( C ⊗ k \)$ contributes in degree two of this cone, so causes no negative-degree obstruction. Successively cancel the unit differential blocks of $Q$. This gives a homotopy-equivalent bounded free complex starting in degree one. For any $Lambda$-algebra $L$, its ordinary tensor product computes $Q ⊗_Lambda^(upright(bold(L))) L$ and still starts in degree one; no flatness is needed. Thus the long exact sequence makes $H^1 \( C ⊗ L \) arrow.r H^1 \( D ⊗ L \)$ injective. A crossed cocycle that is a coboundary on all of $Gamma_K$ is in particular a coboundary on the detecting list, proving the desired injection. For induction the same proof has coefficient rank four and the detecting bound is $dim H^1 + 4$. ◻
]

#thm([Lemma 13.8.])[
  (The exact common kernel).  #emph[In the notation of Lemma 80, let $H$ be the group of sequences each of whose entries acts trivially on the full Tate module, on all ring-class fields of $K$, and on the quadratic characters in use. Restriction from the crossed classes in that Lemma to $H$ is injective at every characteristic-zero test. It is also injective at the residual $\( 2 \)$ test. The characteristic-zero annihilator needed for this assertion can be chosen with a fixed finite $2$-valuation depending only on $E$, also as $K$ varies.]
] <rl:kernel>

#proof[
  The Tate image contains an open subgroup of scalar homotheties, both in the CM and non-CM cases. Choose once and for all $g in G_(upright(bold(Q)))$ with Tate action $u thin 1$, where $u in 1 + 4 upright(bold(Z))_2$ and $u eq.not 1$. Its square belongs to every quadratic subgroup. Put
  $ z = g^2 tau g^2 tau^(- 1) . $
  The generalized dihedral property of every ring-class extension implies that $z$ is ring-class trivial. It is also trivial on every quadratic character, and its Tate action is the fixed scalar $u^4$. For every sequence in $Gamma_K$, its commutator with the constant sequence $z$ is in the exact group $H$, since its Tate commutator and all its abelian character images are trivial. Thus $z$ is central in $Gamma_K \/ H$ and acts on the coefficients by $u^4$.
  Here the elementary central-scalar argument suffices. If a crossed cocycle $b$ is defined on a group with such a central element, comparison of $b \( z g \)$ and $b \( g z \)$ gives
  $ \( u^4 - 1 \) b \( g \) = \( g - 1 \) b \( z \) . $
  In characteristic zero this makes $b$ a coboundary. Inflation–restriction then gives injectivity on $H$. The valuation of $u^4 - 1$ is fixed.
  In characteristic two choose, at each stage, inertia at $r_i$ mapping onto the chosen generator of $xi_i$. Its Tate action is trivial and its ring-class images commute, so the resulting sequence is central in $Gamma_K \/ H$ and acts on $M$ by $1 + t$. Its scalar minus one is invertible in $upright(bold(F))_2 \( \( t \) \)$.
  For the induced representation $W$, first restrict to $Gamma_K$. There $W = M xor M^tau$, and this inertia sequence acts on the summands by $1 + t$ and $\( 1 + t \)^(- 1)$. Hence $W^(Gamma_K) = 0$. Inflation–restriction for the index-two inclusion gives an injection $H^1 \( Gamma \, W \) arrow.r H^1 \( Gamma_K \, W \)$, even in characteristic two. Apply the central-scalar calculation separately to the two summands to obtain injection on restriction to $H$. The same argument works in characteristic zero with the fixed scalar $u^4$. Throughout, $H$ is defined by exact actions at every stage. ◻
]

#thm([Lemma 13.9.])[
  (Irreducibility on the characteristic-zero tests).  #emph[On an inner characteristic-zero test where $Psi^2 eq.not 1$, the four-dimensional representation induced from $T chi Psi$ is absolutely irreducible. If $Psi^2 = 1$ on an inner test, it splits as two inequivalent absolutely irreducible quadratic twists.]
] <rl:irreducibility>

#proof[
  The two induced summands are distinguished by $r$-inertia, whose scalars are $Psi$ and $Psi^(- 1)$. On either summand, multiplying the Tate matrices by scalars does not alter invariant subspaces. The Tate representation restricted to $G_K$ is absolutely irreducible under the exclusions already specified. These facts give absolute irreducibility of the induction when the two inertia characters differ.
  If $Psi^2 = 1$, extension across conjugation gives the two quadratic twists. They are inequivalent, since a quadratic self-twist of the Tate representation here would make its restriction to $G_K$ reducible over an algebraic closure. In the CM case this would force $K$ to be the CM field, which was excluded. ◻
]

#thm([Lemma 13.10.])[
  (Simultaneous finite Chebotarev realization).  #emph[For any element $u$ of an exact kernel in Lemma 81, derivative primes can be chosen, at increasing finite precision, whose rational Frobenius is $tau u$ on all retained data. Their finite localization is evaluation on $\( tau u \)^2$. The assertion is compatible with any fixed finite list of previous derivative operations.]
] <rl:chebotarev-evaluation>

#proof[
  At one Artin stage, a coordinate of a cochain in the image of a finite model is a locally constant function. The finitely many coordinates being used factor through one finite quotient of the absolute Galois group. Enlarge it to contain the Tate action at the required precision, the finitely many ring-class fields and quadratic characters currently in use, and all old finite data. Chebotarev realizes the conjugacy class of $tau u$ on this finite quotient, with a chosen place realizing the desired representative #cite(label("MilneCFT2020")) Chapter V, Theorem 3.23. It gives a rational prime inert in $K$, outside the old finite set. Because $u$ is exactly Tate-trivial, its Frobenius tends to $rho_T \( tau \)$; in particular $a_ell arrow.r 0$ and $ell arrow.r - 1$. Because $u$ is exactly ring-class trivial, the square Frobenius on the $K$-prime is the identity on every retained ring-class field. The unramified local coordinate is therefore the stated Frobenius-square evaluation.
  Repeat at each finite stage with increasing precision. All conditions remain finite, and no density bound or prime-size bound is required. Previously imposed finite diagrams are unchanged. ◻
]

In induced-module notation, restriction to the exact kernel is additive. For a crossed cocycle $b$ and an exact-kernel element $u$,

$ b \( \( tau u \)^2 \) = \( 1 + tau \) b \( u \) . $

Indeed $tau^2 = 1$, $u$ acts trivially on the coefficients, and the cocycle identity cancels the two occurrences of $b \( tau \)$. Projection to either induced summand identifies $"im" \( 1 + tau \)$ with a two-dimensional coefficient module, also in characteristic two.

=== 13.6 The local switch and its integral determinant <rd:local-subsection>

Fix a complex conjugation $tau$ and write $C_tau$ for its action on $T$. The next two Lemmas construct the integral local switches and the classes that pass through them. Their finite-level formulas are needed before applying the limit constructions above.

#thm([Lemma 13.11.])[
  (The split local model).  #emph[ Let a sequence of inert good primes $ell$ have rational Frobenius lifts tending on $T$ to a fixed complex conjugation $C_tau$. At the unique prime of $K$ above $ell$, the limiting local complex has 
#[#set math.equation(numbering: n => "(13.10)")
 $ H^0 = M \, #h(2em) H^1 = F xor S = M xor M \, #h(2em) H^2 = M \, $ <rd:local-cohomology>]

 with zero differentials in a free split model. Here $M = T ⊗ Lambda$ with the relevant scalar coefficient structure. The two degree-one coordinates of a cocycle are 
#[#set math.equation(numbering: n => "(13.11)")
 $ f \( c \) = c \( gamma^2 \) \, #h(2em) s \( c \) = c \( sigma \) \, $ <eq:h:local-coordinates>]

 where $sigma$ is an oriented pro-$2$ tame generator. The plane conditions $F = { s = 0 }$ and $S = { f = 0 }$ include $H^0$ and exclude $H^2$. Each is its own orthogonal complement for conjugate-Weil duality. The strict condition $H^0$ and the relaxed condition $H^0 xor H^1 \[ - 1 \]$ are mutually dual. All four inclusions can be equipped with compatible integral duality triangles.]
] <rd:local-model>

#proof[
  The prime-to-$ell$ local cochains are computed by the tame inertia and residue-field directions. In these two directions the differentials are formed from inertia minus one and Frobenius minus one, with the usual Frobenius action on tame inertia. On $M$, inertia is trivial at the derivative prime. The square of a rational Frobenius is trivial on every ring-class character. In the limit it is also the identity on $T$, while $ell^2$ tends to one. Thus both differentials become zero, giving (13.10).
  Here is a finite-precision check of the pairing, needed at $2$. At a retained quotient killed by $2^a$, impose also $q = ell^2 equiv 1 med \( mod med 2^(a + 1) \)$, as well as trivial Frobenius-square action on the coefficient module at this quotient. The tame two-generator complex then has zero differentials, with the coordinates in (13.11). Its degree-one scalar generators are the unramified and tame characters. More explicitly, use the presentation $phi.alt sigma phi.alt^(- 1) sigma^(- q) = 1$. After augmentation with trivial coefficient action its Fox resolution has terms of ranks $1 \, 2 \, 1$, with $d^0 = 0$ and $d^1 = \( 0 \, 1 - q \)$, in the ordered finite and tame coordinates. The diagonal from the same resolution has zero pure-finite term, unit mixed terms, and pure-tame coefficient $plus.minus binom(q, 2)$. The latter coefficient is the augmented second derivative of $sigma^(- q)$ together with its adjacent $sigma$ in the relation. Both $1 - q$ and $binom(q, 2)$ vanish modulo $2^a$ under the imposed congruence. Thus this is an actual split complex and an actual pure-plane zero pairing at the retained precision. The field contains the $2^(a + 1)$-st roots of unity, so $- 1$ is a $2^a$-th power. The norm-residue identity $\( x \, x \) = \( x \, - 1 \)$ for the $2^a$-Hilbert symbol therefore makes the square of each scalar generator zero. The two generators form a basis; local Tate duality makes their cross pairing a unit. The same calculation applies coefficientwise to the free Artin coefficient module, including its nilpotent $t$ and quadratic variables. Thus the pure plane restrictions are already zero at every retained quotient. All these congruences can be imposed simultaneously with the derivative Frobenius conditions by increasing their precision. Taking the compatible limit proves integral vanishing of the pure squares. It is not deduced from skew symmetry in characteristic two.
  Equivalently, in the limiting tame presentation $phi.alt sigma phi.alt^(- 1) = sigma^q$ with $q arrow.r 1$, the rank-$\( 1 \, 2 \, 1 \)$ resolution specializes to the exterior resolution for two procyclic directions. The finite Hilbert-symbol calculation specifies the cup product on its split cohomology and rules out a hidden square term. Conjugation transports the finite Tate coordinate by $C_tau$ and the singular coordinate by $- C_tau$, with possible scalar units coming from the orientations. Consequently the cross pairing is
  #[#set math.equation(numbering: n => "(13.12)")
   $ beta \( x \, y \) = epsilon.alt thin chevron.l x \, C_tau y chevron.r \, #h(2em) epsilon.alt in Lambda^times \, quad x in F \, med y in S \, $ <eq:h:cross-pairing>]
  where $chevron.l thin \, thin chevron.r$ is the perfect alternating Weil form. This proves the assertions about orthogonal complements. Since the restrictions of this explicit pairing to either pure plane are zero as maps of the split complexes, their isotropy homotopies may be chosen to be zero. Only a product of two degree-one terms could map to the degree-two local invariant target; the degree-zero terms introduce no additional restriction. These zero homotopies agree on the strict subcomplex. These are the actual orthogonality data required in the Selmer duality construction #cite(label("Nekovar2006")) Theorem 6.3.4; the compatibility assertion is therefore an assertion about these displayed complexes and maps. Lemma 74 is used to retain this finite diagram together with the unchanged local data. ◻
]

For a finite set $I$ of derivative primes, let $C_I$ be obtained from $C$ by replacing the finite plane condition $F$ by $S$ at each prime of $I$, retaining all other local conditions. The classes below use the same multiplier $L$ already included in $P$; in particular, $P_diameter = P$.

#thm([Lemma 13.12.])[
  (Descent and the switch at $2$).  #emph[ Suppose that the finite ring-class transfers are performed before retaining their target cycles and witnesses as in Lemma 74. There is one integer $L eq.not 0$, depending on the fixed curve, parametrization and fixed local types, such that the classes obtained from the Heegner derivatives of $L$ times the point satisfy, for every finite switched set $I$, 
#[#set math.equation(numbering: n => "(13.13)")
 $ P_I in H^1 \( C_I \) \, #h(2em) f \( P_(I union { ell }) \) = 0 \, #h(2em) s \( P_(I union { ell }) \) = C_tau f \( P_I \) . $ <eq:h:finite-singular>]

 The same $L$ works for every number of active and derivative primes. The previously imposed singular conditions are retained.]
] <rd:derivative>

#proof[
  We first descend the derivative classes using one multiplier for the complete conductor, and verify their Kummer conditions at $2 N$. We then compute both local coordinates in Equation (13.13). The last step retains these classes and identities in the same bounded target cochain diagrams used for evaluation.
  Choose the orientations coherently. The relative ring-class group at an inert prime $ell$ is cyclic of order $ell + 1$. For distinct new primes these groups form a product: the ring-class exact sequence has kernel the product of the local residue-unit quotients, and the only global units here are $1 \, - 1$, whose images in these quotients are trivial. Set
  $ D_ell = sum_(i = 1)^ell i sigma_ell^i \, #h(2em) D_I = product_(ell in I) D_ell . $
  Direct multiplication gives
  #[#set math.equation(numbering: n => "(13.14)")
   $ \( sigma_ell - 1 \) D_ell = \( ell + 1 \) - sum_(i = 0)^ell sigma_ell^i . $ <rd:derivative-identity>]
  The Hecke correspondence and reduction of its CM isogenies give, for every class-group translate,
  #[#set math.equation(numbering: n => "(13.15)")
   $ "Tr" \( y_(c r n) \) = a_ell y_(c r n \/ ell) \, #h(2em) tilde(y)_(c r n) = "Fr"_ell tilde(y)_(c r n \/ ell) . $ <eq:h:heegner-norm-reduction>]
  These are the point relations, not an application of a residual irreducibility theorem. A fixed multiple of the parametrization removes cuspidal terms.
  There is a uniform bound on the $2$-primary torsion over the union of the ring-class fields in use. To see this, choose a fixed nonidentity scalar homothety of infinite order in the $2$-adic Tate image. Square a lift so that it belongs to every quadratic subgroup under consideration. Multiply it by its conjugate under complex conjugation. Its action on each ring-class field is trivial, because conjugation inverts the abelian ring-class action, while its action on $T$ is still a fixed nonidentity scalar. If $2^e$ annihilates its scalar minus one up to a unit, then $2^e$ kills the torsion in question. The existence of this fixed scalar, including the CM case, is the Tate-image input used in Lemma 81.
  Work first with coefficients modulo $2^a$. Require $a_ell$ and $ell + 1$ to vanish to a precision substantially larger than $a$. Equations (13.14) and (13.15) then make the derivative Kummer class invariant under the relative ring-class group. In the inflation–restriction sequence, both the obstruction to descent and the ambiguity of descent are killed by $2^e$, since their coefficient module is killed by $2^e$. Multiplication by $2^(2 e)$ therefore gives a descent independent of this ambiguity: descend $2^e$ times the class and multiply its lift by $2^e$. There is no repetition of this factor for individual primes; descent is performed once from the field with the complete conductor.
  The global descent has cost only the fixed factor $2^(2 e)$, regardless of the number of derivative primes. It remains to ensure that the descended class satisfies the Kummer condition at every fixed bad place; this is a separate local descent issue.
  At a place over $2 N$ these descent extensions are unramified. Here is the local descent argument, valid also for even extension degree and for toric or additive reduction. Let $F' \/ F$ be a finite unramified extension with group $G$, and write $k' \/ k$ for its residue extension. The successive formal-group quotients $E_j \( F' \) \/ E_(j + 1) \( F' \)$ are additive copies of $k'$. The normal basis theorem makes each a cohomologically trivial $G$-module, without a restriction on $\| G \|$. Every finite quotient $E_1 \( F' \) \/ E_j \( F' \)$ is therefore cohomologically trivial. The inverse systems of these finite groups and their invariant groups satisfy the Mittag–Leffler condition. Taking inverse limits in finite $G$-cochains consequently gives $H^1 \( G \, E_1 \( F' \) \) = 0$. Let $cal(E) \/ cal(O)_F$ be the Néron model and put $tilde(E)^0 = cal(E)_k^0$, a smooth geometrically connected commutative algebraic group over the finite field $k$. Lang’s finite-extension cocycle theorem #cite(label("Lang1956")) Proposition 3, p. 559 gives $H^1 \( G \, tilde(E)^0 \( k' \) \) = 0$. The smooth reduction sequence then gives $H^1 \( G \, E^0 \( F' \) \) = 0$. Let $Phi = cal(E)_k \/ tilde(E)^0$ be the finite étale component-group scheme. Each fiber over a point of $Phi \( k' \)$ is a torsor under $tilde(E)_(k')^0$, and hence has a $k'$-point by #cite(label("Lang1956"), form: "prose") Theorem 2, pp. 557–558. Smooth lifting therefore makes $E \( F' \) arrow.r Phi \( k' \)$ surjective. Hence
  $ H^1 \( G \, E \( F' \) \) arrow.r.hook H^1 \( G \, Phi \( k' \) \) . $
  Existence of the smooth finite-type model and smooth lifting follow from #cite(label("BoschLutkebohmertRaynaud1990"), form: "prose") Section 1.3, Corollary 2, and Section 2.3, Proposition 5. The right side is killed by the exponent of $Phi \( overline(k) \)$. By inflation–restriction, the left side is exactly the kernel of $H^1 \( F \, E \) arrow.r H^1 \( F' \, E \)$. Thus the same fixed exponent makes a class in $H^1 \( F \, E \[ 2^a \] \)$ Kummer whenever its restriction is Kummer. Néron models commute with unramified base extension #cite(label("BoschLutkebohmertRaynaud1990")) Section 7.2, Theorem 1 and Corollary 2, so their geometric component groups are unchanged. Only the finitely many fixed local twisting types at $2 N$ occur, so the product of these component exponents is bounded independently of the conductor and of the extension degree. Include this product, the single descent factor $2^(2 e)$, and the parametrization factor in $L$. Thus the descended class has the integral Kummer condition at $2 N$. No good-ordinary or semistability condition was used. Transfer with the scalar character preserves this condition because $Psi = 1$ there.
  The single multiplier $L$ now gives descent with the required Kummer conditions. We next prove the finite-to-singular identity itself. Both coordinates matter: the singular coordinate must become $C_tau f$, while the new finite coordinate must vanish at the retained precision.
  Here is the local calculation, including the division by two. Apply the derivatives at all primes other than $ell$, and write $X \, Y$ for the resulting lower and upper points. Put $F_ell = "Fr"_ell$. The lower field splits at the $K$-prime $\( ell \)$, since that ideal is principal. Reduction therefore gives $F_ell^2 X = X$. The following Frobenius-polynomial identities are taken on the reduction; good odd-prime reduction is injective on the $2$-primary torsion coordinates being compared. If $Q$ is a $2^a$-division point of $L X$, the finite coordinate of its Kummer class is
  #[#set math.equation(numbering: n => "(13.16)")
   $ f = \( F_ell^2 - 1 \) Q = #scale(x: 120%, y: 120%)[\(] a_ell F_ell - \( ell + 1 \) #scale(x: 120%, y: 120%)[\)] Q . $ <rd:finite-formula>]
  We give the descent-cocycle calculation of the other coordinate. Choose $Z$ with $2^a Z = L D_ell Y$, and choose the descended cocycle $b$ so that on the upper-field Galois group it is $b \( g \) = \( g - 1 \) Z$. A change by the already bounded descent ambiguity has no effect on the eventual limit. The crossed identity gives
  $ U = \( sigma_ell - 1 \) Z - b \( sigma_ell \) in E \( H_(c r n) \) . $
  For $g$ in the upper-field Galois group, compare the two expansions of $b \( g sigma_ell \)$; they give $g U = U$. Moreover,
  $ 2^a U = L #scale(x: 120%, y: 120%)[\(] \( ell + 1 \) Y - a_ell X #scale(x: 120%, y: 120%)[\)] . $
  Both integers $ell + 1 \, a_ell$ are divisible by $2^a$. Consequently
  $ U_0 = L frac(ell + 1, 2^a) Y - L a_ell / 2^a X $
  is an actual upper-field point with the same $2^a$-multiple as $U$. Thus $U - U_0$ is upper-field torsion of bounded exponent. This comparison with an actual integer quotient is what bounds the ambiguity; arbitrary division points would not give this bound. Reduction makes $sigma_ell$ act trivially and $tilde(Y) = F_ell tilde(X)$. Therefore reduction of $b \( sigma_ell \) = - U$ gives its singular coordinate
  #[#set math.equation(numbering: n => "(13.17)")
   $ s = #scale(x: 120%, y: 120%)[\(] a_ell - \( ell + 1 \) F_ell #scale(x: 120%, y: 120%)[\)] Q $ <rd:singular-formula>]
  up to the uniformly bounded descent torsion already described. The Frobenius polynomial yields the exact operator identity
  #[#set math.equation(numbering: n => "(13.18)")
   $ \( F_ell - a_ell \) #scale(x: 120%, y: 120%)[\(] a_ell F_ell - \( ell + 1 \) #scale(x: 120%, y: 120%)[\)] = a_ell - \( ell + 1 \) F_ell . $ <rd:exact-frobenius>]
  Thus $s = \( F_ell - a_ell \) f$; when $a_ell$ vanishes at the retained torsion precision, this is $s = F_ell f$. Taking the Frobenius limit gives $s = C_tau f$.
  If $gamma$ is the chosen rational Frobenius lift, its image in the generalized-dihedral ring-class Galois group lies outside the abelian subgroup, so $gamma^2$ acts trivially on the full upper ring-class field. The same lift therefore computes the descended finite Kummer coordinate from the reduced point over the common residue field $upright(bold(F))_(ell^2)$. For the new finite coordinate, reduction of the derivative point is
  #[#set math.equation(numbering: n => "(13.19)")
   $ sum_(i = 1)^ell i F_ell X = frac(ell \( ell + 1 \), 2) F_ell X . $ <rd:half-factor>]
  The finite Kummer coordinate consequently vanishes modulo $2^a$ if $v_2 \( ell + 1 \) gt.eq a + 1$. The additional $1$ is essential at $2$. It is imposed in the choice of the next precision, and does not multiply the class by a new denominator. Bounded torsion ambiguities disappear on passing from $E \[ 2^a \]$ to $E \[ 2^m \]$ with $a - m gt.eq e$. Choose $a$ and the Frobenius precision successively faster than $m$.
  The calculation is compatible with every translate in the transfer: transport the place and its Frobenius before applying that translate. The scalar weight on the lower and upper class is identical. Applying the same calculation at each $ell in I$ proves the earlier singular conditions as well.
  The local formulas now give the switch. To use it in the rank-reduction argument, we must retain more than its cohomology class: the transferred target cycles, local lifts and degree-two cochain identities must extend the original finite diagrams. We record this compatibility next.
  Here the transfer itself is integral at the cochain level. For a finite Artin coefficient ring $A$, let $Delta = "Gal" \( H_(c r) \/ K \)$, through which the finite scalar and quadratic characters factor. Shapiro’s cochain map and the coefficient homomorphism
  $ A \[ Delta \] arrow.r A \, #h(2em) \[ sigma \] mapsto chi_e \( sigma \) Psi \( sigma \) $
  send the descended class to the desired twisted class. For a universal quadratic family, replace the quadratic value by its group element in $A \[ G \]$, also including the fixed base character. Choose inverse actions on both sides when using that Shapiro convention. Explicitly, these are the finite coset sums with the indicated scalar weights; there is no division by $\# Delta$. These maps and their degree-zero and degree-two compatibility formulas are used at this finite stage, before passage to a bounded target model. Naturality of restriction and Kummer corestriction supplies the local lifts. At $2 N$ the scalar character is trivial, so these are precisely the Kummer conditions of the indicated quadratic twist.
  More explicitly, in the universal case let $nu : Delta arrow.r G$ be the additional quadratic character. Perform the coefficient map
  $ A_i \[ Delta \] arrow.r A_i \[ G \] \, #h(2em) \[ sigma \] mapsto chi_(h_0) \( sigma \) Psi_i \( sigma \) \[ nu \( sigma \) \] $
  and the finite coset sum before any character evaluation. This gives one cycle over $A_i \[ G \]$, with its local lifts. Every sign evaluation $A_i \[ G \] arrow.r A_i$ sends this cycle and these lifts to the corresponding weighted construction, because it commutes with finite sums and differentials. After contraction, compare an evaluated target model with its already chosen scalar model using their maps to the same original target cochains. Retain these comparison matrices and their contraction homotopies for all the finitely many characters of this fixed $G$. No character idempotent or division by a class-group order is used. At $t = 0$ the split-prime norm multiplier on this universal cycle is
  $ a_(r_i) - 2 chi_(h_0) \( r_i \) \[ nu \( "Fr"_(frak(r)_i) \) \] . $
  The two conjugate Frobenius values of $nu$ agree because each quadratic character comes from $bb(Q)$. Evaluation at the character corresponding to $h$ therefore gives exactly $a_(r_i) - 2 chi_h \( r_i \)$, with the central boundary witness described above.
  Finally contract only the resulting target cycles, local lifts and boundary witnesses into the models over $K$. Retain the target comparison maps, the split local Fox complexes, their zero isotropy homotopies, and their duality and switch identities in degrees zero, one and two. The proof of Lemma 74 shows explicitly how to transport these identities and their witnesses. In particular the unbounded cochains over $H_(c r)$ and the full Shapiro maps are not objects or maps of this limiting diagram. When a further derivative prime is selected, extend the same original finite-stage diagram and its contraction maps, using the same inner ultrafilter. Do not construct an unrelated cohomologically equivalent old complex. The earlier evaluations, including all degree-two cocycle identities, are consequently retained by the same contraction maps after each new switch. For a fixed finite set of switches and fixed $G$, the target rank bounds above apply. Lemma 74 therefore applies to these extended target diagrams at their common retained precision. Their limiting classes give (13.13). The displayed local formulas agree with the calculation underlying #cite(label("Howard2012")) Proposition 1.7.4; Howard’s odd-prime global hypotheses are not being asserted at $2$. ◻
]

#thm([Lemma 13.13.])[
  (Preservation of the determinant coordinate).  #emph[Let $cal(O)$ be a height-one discrete valuation ring at which the complexes and switching conditions are self-dual. Suppose the generic Selmer group for a set $I$ has rank one and is spanned by $P_I$, and $v_0 = f \( P_I \)$ is nonzero at the next derivative prime. Then the switched generic group has rank one and is spanned by $P_(I union { l })$, and 
#[#set math.equation(numbering: n => "(13.20)")
 $ v_(cal(O)) \( u_I \) = v_(cal(O)) \( u_(I union { l }) \) . $ <eq:h:switch-equality>]

 This assertion does not require a primitive localization in either integral plane.]
] <lem:h:determinant-switch>

#proof[
  Compare the strict condition and the relaxed condition of Lemma 13.11. Their complexes are dual. Over the fraction field, the image of relaxed $H^1$ in $F xor S$ is self-annihilating by Poitou–Tate, hence two-dimensional. Strict $H^1$ is zero because the original rank-one group localizes nontrivially. The relaxed image meets $F$ in the line spanned by $v_0$ and, by Equation (13.13), meets $S$ in the nonzero line spanned by $C_tau v_0$. Its intersection with either plane is therefore exactly a line. This proves the rank and spanning assertions.
  For the integral determinant comparison let $A = P_I$ and $B = P_(I union { l })$ be a field basis of relaxed $H^1$. The dual basis $A^or \, B^or$ belongs to strict $H^2$. In the triangle adding $F \[ - 1 \]$ to the strict complex, the map $F arrow.r H_(upright("str"))^2$ pairs a vector $x$ against the relaxed localization. By Equations (13.12) and (13.13), it is a unit times $chevron.l x \, v_0 chevron.r B^or$. The remaining $H^2$ quotient maps to $A^or$. Choose $x$ mapping to $B^or$. Although $v_0$ and $x$ need not be integral separately, the volume of the ordered basis $\( v_0 \, x \)$ of $F$ is a unit of $cal(O)$, precisely because its symplectic pairing is a unit. For $S$ use $C_tau v_0$ and a preimage of $A^or$; its volume is again a unit. The two determinant tensors thus map, up to units, to the same tensor in the strict determinant, using $A^or and B^or$. All triangles and plane lattices in this comparison are integral. Their determinant isomorphisms consequently give Equation (13.20), including any torsion or localization-index contribution. ◻
]

=== 13.7 Rank reduction and nonnegative divisors <sec:h:rank-reduction>

The derivative-prime reduction follows the Kolyvagin-system argument of #cite(label("Howard2012"), form: "prose") Lemmas 1.5.3 and 1.6.4. We carry its switches through integral Selmer complexes and preserve their determinant coordinate. The local calculation and descent above supply the characteristic-two pairing and one fixed multiplier; the argument below supplies the uniformity as the conductor varies.

We now prove the first two bounds in Equation (13.8). A height-one specialization can have larger Selmer dimension than the generic rank-one line. Local switches will remove that excess dimension while preserving the determinant valuation. At test dimension one, integrality is immediate. At the coefficient prime $\( 2 \)$ this argument uses residual irreducibility and therefore applies here to genus data.

Use the sequence groups $Gamma_K subset Gamma$ of Lemma 80, and write $cal(H)$ for the exact kernel of Lemma 81. Over the relevant test field, put $W = "Ind"_(Gamma_K)^Gamma \( T chi_e Psi \)$. Lemma 83 realizes finite localization as the projection of $\( 1 + tau \) b \( u' \)$, for $u' in cal(H)$, to one induced summand. Restriction to $cal(H)$ is injective by Lemma 81, and evaluation there is additive and Galois-equivariant. The image of $1 + tau$ is a copy of the two-dimensional summand, also in characteristic two.

#thm([Lemma 13.14.])[
  (Rank reduction at a height-one prime).  #emph[Suppose a primitive instance has generic cohomology of rank at most one in degrees one and two, zero elsewhere, and $P$ spans $H^1$ when it is nonzero. Then the first line of Equation (13.8) holds. These hypotheses hold in every simple-zero instance and also at the base of Theorem 10. The second line holds in genus data with irreducible $E \[ 2 \]$, with a bound independent of the number of active or derivative primes.]
] <lem:h:height-one-reduction>

#proof[
  There is nothing to prove if $u = 0$. Otherwise the generic rank is one and $P$ is nonzero. Localize, and if convenient complete, at a height-one prime. Test its residue field; at $\( 2 \)$ do this argument only in genus data with irreducible residual representation. Suppose first that $Psi^2 eq.not 1$ on the field. Then $W$ is irreducible. Inertia at $r$ distinguishes its two induced summands. On one summand, irreducibility of $T$ over $K$ comes from open image or the CM normalizer in characteristic zero, and from the assumed residual irreducibility at $\( 2 \)$. In the latter case we have omitted the fields meeting $bb(Q) \( E \[ 2 \] \)$ nontrivially. The cyclic cubic residual case remains irreducible over $bb(F)_2 \( \( t \) \)$, with a possibly quadratic commuting field. Constant Tate matrix images are realized on the sequence group; scalar character twists do not change this irreducibility.
  Let the test Selmer $H^1$ have dimension $s gt.eq 2$. Include the reduction of a primitive generator of the generic free $H^1$ lattice among two independent classes. We can arrange that their localization has rank two. To see this, if the classes are independent over the commuting field of $W$, simplicity and the injective restriction in Lemma 81 imply that the field span of their joint evaluations on $cal(H)$ is the whole of $W xor W$. Otherwise a nontrivial equivariant linear relation would vanish on restriction, and hence on the original classes. Projection by $1 + tau$ therefore spans all pairs in the two-dimensional localization space. Some actual evaluation pair has nonzero determinant: a homogeneous quadratic vanishing on an additive group vanishes on its field span, since its polar form vanishes on every pair from the group. This argument is valid in characteristic two as well. If the classes are dependent over the commuting field but independent over the ground field, projection commutes with that field action on the graph of $tau$. At the residual prime $\( 2 \)$, in the cyclic cubic case, this commuting field is $bb(F)_4 \( \( t \) \)$: rational complex conjugation has trivial residual image, so the commuting-field action is the same on the two induced summands. If the second class is $alpha$ times the first, with $alpha$ outside $bb(F)_2 \( \( t \) \)$, a nonzero projected evaluation $v$ gives the ground-field-independent pair $v \, alpha v$. Thus this case also gives rank-two localization.
  Choose the derivative prime realizing that evaluation. Its localization is nonzero on the primitive generic generator. The relaxed image on the test fiber is self-annihilating of dimension two, and contains all of $F$ because the finite localization has rank two. It is therefore $F$. Switching to $S$ lowers test $H^1$ dimension by two. Generically, Lemmas 13.12 and 86 keep rank one, a nonzero class, and the same determinant valuation.
  It remains to treat $Psi^2 = 1$, which occurs here only in characteristic zero. Extend $Psi$ across $tau$ and split into the two conjugation signs. Conjugation on the cochains includes $1 + t mapsto \( 1 + t \)^(- 1)$, which is trivial on this fiber. The fixed Kummer conditions and relaxed conditions are preserved. At previously switched places the split local model has diagonal conjugation action on $f \, s$, so its plane conditions are preserved too. The induced representation now splits into two nonisomorphic absolutely irreducible twists. Finite and singular localization each have one line per sign. Within a sign the pairing is a symmetric hyperbolic pairing of those two isotropic lines; the signs are orthogonal.
  If both Selmer signs occur, the restriction argument just used gives rank-two localization by choosing one class of each sign, with a nonzero component of the primitive generator among them. If only one sign occurs and $s > 1$, choose rank-one localization nonzero on that generator. The relaxed image has a self-annihilating line in each sign. In the sign hit this is the finite line; in the other it must be the singular line, since a symmetric hyperbolic plane in characteristic zero has exactly these two isotropic lines. The switch preserves the total dimension but introduces the other sign: the old strict kernel has dimension $s - 1 gt.eq 1$ and the new singular line contributes the second sign. A subsequent rank-two switch reduces dimension. Iteration reaches test rank one; it cannot pass below one, because the generic rank-one class has been retained throughout.
  At test rank one the minimal self-dual complex over the DVR has one free term in each of degrees one and two and zero differential; there are no invariants. An integral class and its integral dual functional therefore give an integral determinant coordinate. Reversing the switches gives the first assertion. At $\( 2 \)$ the initial fixed descent and local multiples cost a bounded valuation, independent of every subsequent switch. This proves the second assertion with the stated uniformity. ◻
]

=== 13.8 Uniformity without residual irreducibility <sec:h:uniform-ring-bound>

Only the ring-data bound at $\( 2 \)$ remains. Residual irreducibility is not assumed, so the preceding argument on that residue field does not cover every instance. We first bound the model sizes and retain evaluation through a second limit. These constructions turn a hypothetical sequence of unbounded negative determinant valuations into a characteristic-zero outer limit. There the retained evaluation maps permit rank reduction and force a bounded denominator, giving a contradiction.

#thm([Lemma 13.15.])[
  (Uniform residual sizes).  #emph[Suppose $omega \( "disc" K \) lt.eq A$, the local twisting classes at $2 N$ belong to a fixed finite list, and all active conductor primes are split with odd Frobenius exponent of the deformation character. After localization and completion at $\( 2 \)$, the minimal free ranks of the Selmer complexes are bounded in terms of $E \, A$, and the number of retained derivative primes. They do not depend on the number of active conductor primes.]
] <rl:residual-bound>

#proof[
  Reduce first over $upright(bold(F))_2 \[ \[ t \] \]$. The quadratic character is now trivial. Removing the active conductor primes from the permitted ramification set changes the global complex by their singular local complexes. These, and their unramified local complexes, are acyclic after inverting $t$, by Lemma 77. The resulting smaller-support complex, including its comparison maps, can be constructed at the original Artin stages before taking the limit. Its support consists of $2 N \, r$, and the retained derivative primes. Its $upright(bold(F))_2 \( \( t \) \)$ cohomology dimensions are bounded by those at $t = 0$: choose a minimal finite free model over $upright(bold(F))_2 \[ \[ t \] \]$.
  Here is a uniform bound for the latter residual cohomology. Put $F = upright(bold(Q)) \( E \[ 2 \] \)$, a fixed field. Then $F K \/ F$ is at most quadratic. Enlarge the allowed set of primes of $F$ by those ramified in $K$. Its cardinality is bounded by a constant depending on $E \, A$ and the number of derivative primes. Kummer theory bounds the number of generators of the maximal pro-$2$ Galois group over $F$ unramified outside this set, using the fixed unit group, the fixed $2$-class group, and the allowed valuations. The subgroup defining $F K$ has index at most two; the elementary Schreier bound bounds its generator number. Every finite Galois $2$-extension of $F K$ with this ramification has Galois closure of $2$-power degree over $F$, so this subgroup indeed controls the required pro-$2$ extensions of $F K$.
  Over $F K$ the residual Tate module is trivial. Restriction and inflation–restriction therefore bound the residual $H^1$ over $K$. The $H^0$ bound is immediate, and the global Euler characteristic or global duality bounds $H^2$. The local terms at the remaining bounded set have bounded dimensions, with degrees of the local fields at most two over the fixed rational local fields. At $2 N$ there are only finitely many local quadratic twisting classes. The same bounds apply to the Selmer cone. Lemma 68 now bounds the minimal ranks. Determinant valuations will require a separate argument. ◻
]

==== 13.8.1 Evaluation through the outer limit <evaluation-through-the-outer-limit>

The preceding evaluation argument concerns one inner construction over a fixed $K$. The ring bound must also be uniform when $K$ and the conductor vary. When all active primes split and $omega \( k \)$ is bounded, Lemma 88 bounds the model sizes after any fixed number of derivative operations. The next proposition shows that passing to a second limit of such models preserves detection, including classes represented only by approximate cycles before that limit.

#thm([Proposition 13.16.])[
  (Integral evaluation through the outer limit).  #emph[Let $C_j$ be any family of the preceding limiting complexes, completed over $cal(O)_j = hat(Lambda_(\( 2 \)))$, possibly for different quadratic fields $K_j$. Suppose their minimal ranks are bounded. Assume a common bounded cohomological degree interval. Keep the actual evaluation matrices and transport them to the minimal models through integral contractions. For a nonprincipal ultrafilter $cal(U)$, put 
$ cal(O)_oo = (product_(cal(U)) cal(O)_j) \/ frak(a) \, #h(2em) frak(a) = { \( x_j \) : { j : v_2 \( x_j \) gt.eq n } in cal(U) upright(" for every ") n } . $

 Then $cal(O)_oo$ is a DVR with uniformizer $2$ and a characteristic-zero fraction field $L_oo$. The outer $H^1$ over $L_oo$ injects into crossed classes on the inner quadratic sequence group product, or its extension by one simultaneous complex conjugation for the induced representation. Its restriction to the product of their exact common kernels is injective. All arbitrary-sequence degree-two evaluation identities survive. These conclusions also hold after retaining any fixed finite collection of additional integral diagrams.]
] <rl:outer-evaluation>

#proof[
  A nonzero element of the quotient has a representative whose valuations are bounded on an ultrafilter-large set. A finite partition then makes its valuation equal to a single integer $n$ on such a set. It is $2^n$ times a unit. Products add these finite valuations, so the quotient is a domain, and every nonzero ideal has an element of smallest valuation. It is consequently a DVR. The integer $2^n$ is nonzero for every $n$, so its fraction field has characteristic zero.
  For each $j$, all-sequence evaluation maps originally have entries in $Lambda$. Extension to $cal(O)_j$ and composition with an integral contraction still give integral matrices. Thus evaluation on any sequence of inner group elements has an entrywise image in $cal(O)_oo$. Equations (13.9) and (13.9) survive for all such sequences. In particular, if an outer cycle is represented by vectors $x_j$ for which $d_j x_j$ has valuation tending to infinity, the evaluation of $d_j x_j$ does too: the degree-two evaluation matrix is integral. Thus an outer cycle gives an exact crossed cocycle even when its representatives are only approximate inner cycles.
  Over the inner residue field $Omega_j$, choose a detecting list as in Lemma 80; its length is at most $dim_(Omega_j) H^1 \( C_j ⊗ Omega_j \) + "rank" M$. These lengths are bounded. Include in the integral diagrams the evaluation map to its two-term complex and a contraction of its cone to a complex starting in degree one. Such a contraction uses only unit pivots over $cal(O)_j$ and has bounded graded sizes. All its matrices, including inverses and homotopies, are integral and pass to the quotient. Its cone still starts in degree one after extension to $L_oo$. This proves injectivity just as in Lemma 80.
  Let $H_j$ be the inner exact kernel. In the product of the quadratic sequence groups, the central elements of Lemma 81 give a central element modulo $product_j H_j$ with scalar $u^4$. Since $u^4 - 1$ remains nonzero in $cal(O)_oo$, the same calculation gives restriction injectivity. For the induced representation first restrict to the quadratic subgroup, as in Lemma 81. Additional finite diagrams pass through the same entrywise operations. ◻
]

#thm([Lemma 13.17.])[
  (Irreducibility in the outer limit).  #emph[On the outer characteristic-zero test, $Psi$ has infinite order and the four-dimensional representation induced from $T chi Psi$ is absolutely irreducible.]
] <rl:outer-irreducibility>

#proof[
  The inner irreducibility argument requires a uniform finite witness to survive this limit. The images of the quadratic subgroups have index at most two in the fixed compact $2$-adic Tate image. A compact $2$-adic analytic group is topologically finitely generated and hence has only finitely many closed subgroups of index at most two. Choose one on an ultrafilter-large set. Its absolutely irreducible representation has finitely many matrices spanning $M_2 \( upright(bold(Q))_2 \)$; the determinant expressing this spanning property is a fixed nonzero $2$-adic number. Every one of these Tate matrices is realized by choices of Galois elements in each component. Their accompanying character scalars are units and do not change the spanning assertion. Its determinant remains nonzero in $L_oo$. This proves absolute irreducibility in that field. Also $1 + t$ has infinite order already in every $Omega_j$: for a nonzero integer $n$, the first nonzero term of $\( 1 + t \)^n - 1$ occurs in finite degree. It remains a unit modulo $2$ in every component, so no such power becomes one in the outer field.
  The two induced summands therefore have different inertia scalars, $Psi$ and $Psi^(- 1)$, and the induction is absolutely irreducible as in Lemma 82. ◻
]

#thm([Lemma 13.18.])[
  (Prime realization through the outer limit).  #emph[The finite Chebotarev realization of Lemma 83 is compatible with Proposition 89 and with any fixed finite list of previous derivative operations.]
] <rl:outer-chebotarev>

#proof[
  Apply Lemma 83 at each finite stage. For an outer sequence do this separately for each inner sequence, retaining the relevant finite evaluation matrices and degree-two identities before taking the outer quotient. Approximate inner cycles cause no problem, by the integrality calculation in Proposition 89. Previously imposed finite diagrams are unchanged. ◻
]

#thm([Theorem 13.19.])[
  (Compatibility of the limit constructions).  #emph[The finite free models, ring-class characters, local conditions and pairings constructed above can be retained simultaneously. Their inner limits have the stated height-one acyclicity and all-sequence cohomology detection. For all-split ring data with bounded $omega \( "disc" K \)$, the residual model sizes are bounded independently of the active conductor support. Their outer limits retain arbitrary evaluations, exact-kernel injectivity and finite Chebotarev realization after any fixed number of additional integral arithmetic operations.]
] <rl:limit-evaluation-package>

#proof[
  Use Lemma 68 at each finite stage and keep the same contractions and ultrafilter as in Lemma 74. Perform the finite ring-class transfer and weighting first, retaining only the resulting bounded target cycles and witnesses as in that lemma; no limit of the growing Shapiro source is taken. The local assertions and uniform residual sizes are Lemmas 75, 77 and 88; the required characters come from Proposition 76. Lemmas 80 and 81 give inner detection. Proposition 89 and Lemma 91 preserve it through the outer limit and later finite operations. Every retained identity is an identity of actual integral matrices. The finite derivative classes and local identities of Lemma 13.12 are among the integral arithmetic target diagrams retained in these operations, including the central norm relation before and after sign evaluation. ◻
]

#thm([Lemma 13.20.])[
  (Uniform determinant bound in ring data).  #emph[For simple-zero ring data with every active conductor prime split in $K$ and $omega \( k \) lt.eq a$, the coordinate of Definition 78 satisfies 
$ v_(\( 2 \)) \( u \) gt.eq - C_(E \, a) \, $

 where $C_(E \, a)$ is independent of $h$ and $K$. There is no residual irreducibility assumption. This is the last line of Equation (13.8).]
] <lem:h:uniform-ring-determinant>

#proof[
  Put $O = hat(Lambda_(\( 2 \)))$. By Lemma 88, after any fixed number of derivative switches the minimal $O$-models have bounded size in terms of $E$, $a$ and that number, independently of $h$. The full local complexes at $r$ and the active split primes are contractible over $O$, and the switched planes are integrally self-dual. Thus the class and its paired closed functional have a common bounded clearing exponent, supplied by the fixed descent multiplier and the retained global duality map.
  Suppose the asserted lower bound fails. Choose instances with $v_O \( u \) arrow.r - oo$. Cancel disks over $O$ and take an outer limit of their bounded free models. Transport the class, closed functional, evaluations and the retained comparison and switch maps through these integral contractions, applying the same contractions to their boundary witnesses. Only the resulting bounded target vectors and matrices enter the outer diagram; the eliminated list of active-place complexes does not. Concretely, take the ultraproduct of their valuation rings and quotient by the ideal of sequences whose valuation tends to infinity. The resulting ring $cal(O)_oo$ is a DVR with uniformizer $2$: a nonzero sequence has a finite valuation on an ultrafilter-large set and is that power of $2$ times a unit. Its fraction field has characteristic zero. All integral matrix identities, duality diagrams, and the local switch diagrams pass to this limit.
  Proposition 89 gives injective evaluation on the outer sequence group and on its exact common kernel. This includes outer cycles represented by approximate inner cycles, since their coboundaries are evaluated by integral degree-two matrices. The fixed central scalar remains different from one in the outer field. Lemma 90 gives absolute irreducibility of the induced representation there: the scalar $1 + t$ has infinite order and distinguishes the two summands.
  Each individual minimal $O$-complex is a square complex in degrees one and two, by self-duality and the absence of residual invariants. Choose a primitive vector in its generic kernel. Such vectors survive the outer limit, so outer $H^1$ has rank at least one. If its rank exceeds one, choose rank-two localization by the absolutely irreducible evaluation argument in Lemma 87, making it nonzero on one of these primitive vectors. The inner Chebotarev construction realizes the corresponding sequences of derivative primes. At each original Artin stage retain the old contractions and evaluations, adjoin the new local and derivative diagrams, and pass through the same inner and outer ultrafilters. Slower cofinal coefficient precision is permitted; independent reconstruction of the old diagrams is not. For an ultrafilter-large set of instances the localization is generically nonzero. Lemma 86 preserves the valuations tending to minus infinity, while the outer rank falls by two. The new complexes and integral classes obey the same bounds, with only the now fixed finite number of added derivative primes.
  The process must reach outer rank one: ranks are finite and cannot fall below one while the primitive kernel vector is retained. At this stage some maximal boundary minor is nonzero over the outer fraction field. Its valuation is consequently bounded in the individual DVRs on an ultrafilter-large set. Split that minor over their fraction fields. The entries of the class and duality maps are integral and their common initial multipliers are bounded. The formula for their determinant coordinate, or the elementary-divisor decomposition, then has a lower valuation bound depending on this minor and the bounded complex size. The Heegner classes themselves need not survive the outer limit: a numerator tending to zero only increases its valuation. It is the primitive kernel vector that preserves rank, and the boundary minor that bounds the denominators. This contradicts $v_O \( u \) arrow.r - oo$, and proves the uniform estimate. ◻
]

#proof[
  By Lemmas 87 and 93, the element $u$ has nonnegative valuation away from $\( 2 \)$ and a uniformly bounded negative valuation at $\( 2 \)$. Normality of $Lambda$ implies that a fixed power of $2$ times $u$ belongs to $Lambda$. Its central value therefore has the same lower valuation bound.
  In genus data, $s \( h_(*) \)$ and the weight of $h_(*)$ are fixed, $c = 1$, and $k = h h_(*)$. Equations (13.6) and (13.7) give Equation (3.11). The excluded intersection fields are finite in number, since an irreducible two-division field has at most one quadratic subfield. In ring data, the sum over $q divides k$ is bounded by $2 omega \( k \)$, whereas $2 sum_(q divides h) t_q = 4 w \( h \)$. The same equations give Equation (3.12). ◻
]

=== 13.9 The universal Heegner class <sec:h:universal-class>

For interpolation we combine the non-$\( 2 \)$ divisor estimate and the central valuation formula with a universal binary family. The characterwise coordinates must have a uniformly controlled clearing factor. We first remove the norm and local determinant factors belonging to primes unused at a character, then eliminate the new-prime blocks before choosing that clearing factor.

Recall the binary coefficient rings:

$ G tilde.eq \( bb(Z) \/ 2 bb(Z) \)^b \, #h(2em) R = Lambda \[ G \] \, #h(2em) O = hat(Lambda_(\( 2 \))) . $

We work with the universal quadratic character over $R$ for the family in Theorem 10. At a new prime $q$ let $g_q in G$ be its inertia bit: at a character $x$, it evaluates to $- 1$ when $q$ is active and to $1$ when it is unused. Choose the conductor character of Proposition 76 with odd exponents at all the new split primes. In the universal complex relax at every new prime and at the old active primes, and take the trace class $p$ from the conductor containing all new primes, together with $r$ and the old conductor. As in the proof of Lemma 13.12, form its $A_i \[ G \]$-weighted target cycle at each finite stage, together with its local lifts and boundary witnesses, before evaluating any sign character. Apply the limit construction for this fixed $G$ to those target data; the source ring-class cochains do not enter the limiting diagram. Choose an integral determinant basis and write $u_(upright("rel"))$ for the characterwise determinant coordinate.

#thm([Lemma 13.21.])[
  (Removing the unused-prime factors).  #emph[There is $eta in O \[ G \]$ such that $u = eta u_(upright("rel"))$ agrees at each character with the primitive determinant coordinate up to a $Lambda$-unit. In particular, $u_x in Lambda \[ 1 \/ 2 \]$. If the base product derivative is zero, then $u_0 \( 0 \) = 0$. At the nonzero vertices, 
#[#set math.equation(numbering: n => "(13.21)")
 $ v \( u_x \( 0 \) \) lt.eq B + O_(E \, h_0 \, a) \( 1 \) \, $ <eq:h:normalized-vertex-bound>]

 where $a$ bounds $omega \( k \)$.]
] <lem:h:unused-prime-correction>

#proof[
  At an unused prime, the norm relation multiplies the primitive point class by
  $ e_q = cases(delim: "{", a_q \, & q upright(" inert in ") K \,, a_q - z - z^(- 1) \, & q upright(" split in ") K \,) $
  where $z = chi_(h_0) Psi$ times the universal quadratic scalar at an oriented Frobenius. The relaxed singular quotient contributes
  $ l_q = product_(v divides q) det (1 - q_v^(- 1) eta_v \( "Fr"_v \) "Fr"_v divides T) \, $
  where $q_v$ is the residue cardinality and $eta_v$ denotes the full scalar character. Thus $u_(upright("rel"))$ differs from the primitive coordinate by $e_q^2 \/ l_q$, up to a $Lambda$-unit. This follows from the localization triangle with its integral determinant isomorphism; the pairing comparison is made over the fraction field. Choose conjugate-compatible Frobenius lifts in these formulas, taking the square of rational Frobenius at an inert place, and extend the expressions universally over $O \[ G \]$.
  Both $e_q$ and $l_q$ are units in $O \[ G \]$. At a split prime, the odd Frobenius exponent gives a nonconstant scalar in $bb(F)_2 \( \( t \) \)$; at an inert new prime, the hypothesis $t_q = 0$ gives an odd trace. Moreover, already in the group ring, $l_q equiv e_q^2 med \( mod med 2 \)$. In the split case the residual identity is
  $ \( 1 + a_q z + z^2 \) \( 1 + a_q z^(- 1) + z^(- 2) \) = a_q^2 + z^2 + z^(- 2) = \( a_q + z + z^(- 1) \)^2 . $
  In the inert case the Frobenius-square polynomial gives $a_q^2$. Here the group-like quadratic scalars have square one, so the identities hold before sign evaluation. Consequently
  #[#set math.equation(numbering: n => "(13.22)")
   $ eta = product_(q med upright("new")) (1 + frac(l_q \/ e_q^2 - 1, 2) \( 1 + g_q \)) quad upright("belongs to ") O \[ G \] . $ <eq:h:group-ring-correction>]
  Its factor is $l_q \/ e_q^2$ at unused characters and $1$ at active characters. It makes the required correction without an idempotent denominator for each prime.
  For all the primitive constituents, generic cohomology has rank at most one. At nonzero vertices this follows from the simple-zero assumption. At the base it follows from Selmer corank one; a nonzero generic class then spans the possible rank-one group. Hence Lemma 87 applies to every nonzero primitive determinant coordinate. Its nonnegative valuations away from $\( 2 \)$ imply membership in $Lambda \[ 1 \/ 2 \]$, by normality. The same assertion is automatic for a zero coordinate.
  If the base derivative vanishes, Equation (3.6) makes the specialized point torsion. Either its generic determinant coordinate is zero or the specialization is at constant rational rank one and its degree-one class is zero there. In either case $u_0 \( 0 \) = 0$. At a nonzero vertex use Equations (13.6) and (13.7). Subtracting the two Sha lengths and $4 w \( h_x \)$ leaves precisely the expression bounded in Equation (3.9), together with bounded terms at $k$, the old support and $r$. This gives Equation (13.21). ◻
]

The corrected coordinates have the required upper bounds at nonzero vertices and vanish at the center if the base derivative vanishes. To apply binary transfer, we still need $f \, d in O \[ G \]$ with $d_x = f_x u_x$ at every character. The required controls are a bound on $v \( f_0 \( 0 \) \)$ and, at each fixed precision, a bound on the negative Laurent support of every $f_x$. The next lemma obtains those bounds from the old complex, whose size is bounded, rather than from the full growing conductor.

#thm([Lemma 13.22.])[
  (A uniform clearing factor for the Heegner family).  #emph[For the element $u$ of Lemma 94, there are $f \, d in O \[ G \]$ with $d_x = f_x u_x$ at every character, $f_0 in Lambda$, and $v \( f_0 \( 0 \) \)$ uniformly bounded. For each fixed $M$, the negative Laurent support of every $f_x med mod med 2^M$ has a bound independent of $b$ and of the number of new primes.]
] <lem:h:family-clearing>

#proof[
  First make the pairing functional integral up to a bounded multiplier. The class $p$ is integral. Lift $2^(a_0) p$ to the complex strict at the relaxed places and use integral duality against the relaxed complex. At $r$ and every new prime the full local complex over $O \[ G \]$ is contractible: its reduction at the maximal ideal is acyclic, by the local calculation in Lemma 13.4 and the root-type alternative. At the old active primes its cohomology is killed by a bounded power of $2$, because inertia is minus identity. The old support is fixed. Thus $a_0$ is bounded independently of the new primes. After inverting $2$, lifting is canonical. We obtain a closed representative of the paired functional over $2^(- a_0) O \[ G \]$.
  At augmentation, present the complex as the old complex, with no new primes, extended by the direct sum of their singular complexes. Each singular complex is a bounded-size block in degrees one and two, with differential $A_q$ and determinant $l_(q \, 0)$. The differential is upper triangular with the old complex as a subcomplex. This graded free model lifts to $R$: stabilize the finite free models, identify their augmentations, and lift the corresponding graded changes of basis. The lifts are invertible because the augmentation ideal lies in the Jacobson radical. Cancel the additional lifted unit disks before retaining the old-plus-singular grading. Their augmented cross terms are zero, so cancellation leaves precisely the displayed augmented model; the added disks do not enlarge its old part. The old model has bounded size, since $h_0$ is fixed and $omega \( k \)$ is bounded. Indeed, the fixed-field Kummer and Schreier argument in Lemma 88, now retaining the fixed primes of $h_0$, bounds the residual global and local dimensions uniformly for $omega \( k \)$ bounded. This size bound is separate from the central torsion-length bound used below.
  Over $O \[ G \]$ the entire new-prime block is invertible. Schur elimination leaves a complex $D$ of the bounded old size, with augmentation exactly the old complex. For each $A_q$, the order of its residual determinant at $t = 0$ is bounded uniformly. At a split prime this follows from the odd Frobenius exponent and the degree-two Frobenius polynomial; at a root-type prime the constant term is already nonzero. Every sign evaluation of the lifted block is its augmentation plus a matrix divisible by $2$ with power-series entries. Therefore Lemma 64 bounds the negative Laurent support of the entries of every $D_x$ modulo each fixed $2^M$, independently of the number of blocks.
  The integral central specialization of the old complex is controlled by the ordinary base Kummer complex, the fixed old conductor primes, and the bounded singular contributions at $r$. Its rational $H^1$ and $H^2$ both have dimension one. Its torsion lengths are bounded by the finite Selmer quotient assumed in Theorem 10, together with bounded global torsion and these local contributions. Choose its elementary-divisor bases at the center and lift. Apply case (i) of Lemma 65 to $D$, the projected cycle and paired functional. The eliminated large block contributes an $O \[ G \]$-unit to the determinant, and the multiplier in Equation (13.22) belongs to $O \[ G \]$. Include both in the allowed factor $eta$ of that lemma, so neither enters the clearing factor $f$. The lemma gives $d = f u$, a bounded central valuation for $f_0$, and the asserted pole bounds for $f_x$. ◻
]

#proof[
  The primitive ring-class product has odd functional-equation sign under the standing Heegner conditions. Suppose the base product does not have a simple zero. Its first derivative then vanishes. By Lemma 94, $u_0 \( 0 \) = 0$, whereas every nonzero vertex has central determinant valuation bounded by one constant $B_1$ independent of the family. By Lemma 95, the hypotheses of Lemma 67 hold with uniform central and pole bounds. Choose its fixed precision larger than $B_1$ plus twice the central bound, and then take the cube dimension sufficiently large. It supplies a nonzero vertex whose central valuation exceeds $B_1$, a contradiction. Thus the base product has a simple zero. ◻
]

== 14 The unrestricted converse and Goldfeld’s densities <sec:conclusions>

The two residual constructions now give the pointwise theorem. The density statement then requires only Smith’s Selmer distribution and an elementary change of counting convention.

#proof[
  By Lemma 6, either $E \( bb(Q) \) \[ 2 \] eq.not 0$ or $E \[ 2 \]$ is irreducible. Theorem 48 proves $a \( E \) = c_2 \( E \)$ in the first case, and Theorem 54 proves it in the second. Both use the local Kummer conditions defining the corank in the statement. The isogeny choices in the rational-torsion proof preserve that corank and the $L$-function by Lemma 5. Thus every curve in the theorem has analytic rank zero or one. Lemma 4 supplies the Mordell–Weil rank equality and finiteness of the whole Tate–Shafarevich group. ◻
]

#proof[
  Lemma 7 gives $c_2 \( E \) = d_2 \( E \)$ and shows that $"Sha" \( E \/ bb(Q) \) \[ 2^oo \]$ is divisible. Theorem 1 gives the rank equalities and whole-Sha finiteness. A finite divisible $2$-group is zero, so its $2$-primary part vanishes. ◻
]

#thm([Lemma 14.1.])[
  (From integer to squarefree parameters).  #emph[Let $cal(P)$ be a property of nonzero signed integers unchanged by multiplication by an integer square. Suppose 
$ A \( X \) = \# { n in bb(Z) : 0 < \| n \| lt.eq X \, med cal(P) \( n \) } = 2 delta X + o \( X \) . $

 Then 
$ S \( X \) = \# { d in cal(D) \( X \) : cal(P) \( d \) } = frac(2 delta, zeta \( 2 \)) X + o \( X \) . $

 In particular the property has density $delta$ among signed squarefree parameters ordered by absolute value.]
] <lem:squarefree-density>

#proof[
  Every nonzero integer has a unique expression $n = m^2 d$ with $m > 0$ and $d$ signed squarefree. Thus
  $ A \( X \) = sum_(m lt.eq sqrt(X)) S \( X \/ m^2 \) \, #h(2em) S \( X \) = sum_(m lt.eq sqrt(X)) mu \( m \) A \( X \/ m^2 \) . $
  The second equality follows by substituting the first and using $sum_(m divides r) mu \( m \) = upright(bold(1))_(r = 1)$. For a fixed integer $M$, the terms with $m lt.eq M$, divided by $X$, tend to $2 delta sum_(m lt.eq M) mu \( m \) \/ m^2$. The remaining absolute contribution is at most
  $ 2 X sum_(m > M) m^(- 2) \, $
  because $A \( Y \) lt.eq 2 floor.l Y floor.r lt.eq 2 Y$. First let $X$ and then $M$ tend to infinity. The absolutely convergent series $sum mu \( m \) \/ m^2 = 1 \/ zeta \( 2 \)$ proves the formula. Applying it to the property always true gives $\# cal(D) \( X \) tilde.op 2 X \/ zeta \( 2 \)$, proving the density assertion. ◻
]

#proof[
  Smith’s theorem states that, for every fixed elliptic curve $E \/ bb(Q)$ and $j = 0 \, 1$ #cite(label("Smith2025")) Theorem 1.1,
  $ \# { n in bb(Z) : 0 < \| n \| lt.eq X \, med c_2 \( E^(\( n \)) \) = j } = X + o \( X \) . $
  Quadratic twisting depends only on the squareclass, so Lemma 96 gives density $1 \/ 2$ for each corank among the signed squarefree parameters.
  For $j = 0 \, 1$, Theorem 1 gives $c_2 \( E^(\( d \)) \) = j arrow.r.double a \( E^(\( d \)) \) = j$, while Lemma 4 gives the converse implication. The analytic-rank counts therefore equal the corresponding corank counts exactly. The two densities sum to one. Their complement, the twists of analytic rank at least two, has density zero, and Lemma 4 gives the final rank and finiteness assertions on the density-one union. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
