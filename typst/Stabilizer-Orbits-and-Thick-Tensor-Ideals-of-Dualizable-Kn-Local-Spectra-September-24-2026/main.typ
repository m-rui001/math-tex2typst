#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Stabilizer orbits and thick tensor ideals \
of dualizable $K \( n \)$-local spectra]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Chromatic height organizes both the deformation theory of formal groups and the tensor structure of stable homotopy theory. Two classification problems ask whether height accounts for all the relevant closed subobjects: the invariant ideals in a Lubin–Tate deformation ring, and the thick tensor ideals of dualizable Morava-local spectra. We prove both classifications, using the arithmetic problem as the main step.

Fix a prime $p$ and an integer $n gt.eq 1$. Let $Gamma_n$ be the height-$n$ Honda formal group, let $A_n$ be its endomorphism ring over $overline(bb(F))_p$, and put

$ E_0 = W \( bb(F)_(p^n) \) \[ \[ u_1 \, dots.h \, u_(n - 1) \] \] \, #h(2em) I_0 = 0 \, #h(2em) I_h = \( p \, u_1 \, dots.h \, u_(h - 1) \) quad \( 1 lt.eq h lt.eq n \) . $

The ring $E_0$ represents its marked deformations. The ideals $I_h$ are the height ideals: in characteristic $p$, their vanishing specifies where the formal group has height at least $h$. The nonextended Morava stabilizer $A_n^times$ acts by changing the marking. The canonical extended stabilizer $G_n$ also includes the residue-field Galois action. The unit ideal is listed separately from the proper ideals.

#thm([Theorem 1.1.])[
  (Stabilizer-invariant ideals).  #emph[Let $U subset.eq A_n^times$ be any open subgroup. The proper prime ideals of $E_0$ stabilized by $U$ are precisely 
$ 0 \, med I_1 \, dots.h \, I_n . $

 The $U$-invariant radical ideals are precisely 
$ 0 \, med I_1 \, dots.h \, I_n \, med E_0 . $

 The latter list also gives the radical ideals invariant under the full canonical $G_n$-action.]
] <thm:invariant-radicals>

This proves the invariant-ideal assertion called Chai’s Hope in the finite-residue-field formulation of #cite(label("BHN22")) Hope 4.1 and Remark 4.2, and extends that formulation from the full stabilizer to every open subgroup. The open-subgroup scope also occurs in Chai’s original closed-fiber question, as explained in #cite(label("BHN22")) Remark 4.2. The second classification concerns Honda Morava $E$-theory $E$ with coefficient ring $E_0$, and the homotopy category $cal(D)_(\( n \, p \))$ of dualizable $K \( n \)$-local spectra. Its tensor product and unit are

$ X ⊗ Y = L_(K \( n \)) \( X and Y \) \, #h(2em) upright(bold(1)) = L_(K \( n \)) S . $

A thick tensor ideal is a full subcategory closed under equivalences, finite sums, suspensions and desuspensions, cofiber sequences, retracts, and tensoring with every object of $cal(D)_(\( n \, p \))$. Dualizability is essential here: it is more general than compactness in the $K \( n \)$-local category #cite(label("HS99")) Theorems 8.5–8.6.

A finite $p$-local spectrum $F$ has #emph[type $k$] if $K \( i \)_(*) F = 0$ for $i < k$ and $K \( k \)_(*) F eq.not 0$, with $K \( 0 \) = H bb(Q)$. Such spectra exist in every type: start with the sphere and the degree-$p$ cofiber, and then take cofibers of the self-maps supplied by the Hopkins–Smith periodicity theorem #cite(label("HopkinsSmith98")) Definition 8 and Theorem 9. For $0 lt.eq k lt.eq n$, choose a finite type-$k$ spectrum $F \( k \)$ and put

$ cal(D)_k = chevron.l L_(K \( n \)) F \( k \) chevron.r_⊗ \, #h(2em) cal(D)_(n + 1) = 0 \, $

where the brackets mean the generated thick tensor ideal in $cal(D)_(\( n \, p \))$.

#thm([Theorem 1.2.])[
  (Hovey–Strickland conjecture).  #emph[For every prime $p$ and every $n gt.eq 1$, the thick tensor ideals of $cal(D)_(\( n \, p \))$ are exactly 
$ cal(D)_(\( n \, p \)) = cal(D)_0 supset.neq cal(D)_1 supset.neq dots.h.c supset.neq cal(D)_n supset.neq cal(D)_(n + 1) = 0 . $

 In particular, there are $n + 2$ such ideals, and each $cal(D)_k$ is independent of the chosen finite type-$k$ spectrum.]
] <thm:main>

The Balmer spectrum of a tensor category is the space of its prime thick tensor ideals. Corollary 30 identifies this spectrum here with the $n + 1$ proper members of the displayed chain, including the zero ideal. It also specifies their specialization order and the support of each finite type generator.

=== 1.1 History and the two classification problems <history-and-the-two-classification-problems>

The thick subcategory theorem of Hopkins and Smith classifies thick subcategories of finite spectra by chromatic type, while their periodicity theorem supplies the corresponding self-maps #cite(label("HopkinsSmith98")) Theorems 7 and 9. Hovey and Strickland proposed the dualizable $K \( n \)$-local counterpart in their study of Morava $K$-theory and localization #cite(label("HS99")) Section 12, p. 61. Their Problem 16.8 also asks directly about stabilizer-invariant primes and radical ideals of the deformation ring; it explains why the invariant-prime theorem for ordinary complex cobordism does not by itself answer this question.

Chai studied the action on the closed fiber of Lubin–Tate space and proposed that invariant irreducible formal loci should be height loci #cite(label("Chai96")). We use the precise formulation and comparison of coefficient fields and group actions in #cite(label("BHN22")) Section 4, Hope 4.1 and Remark 4.2. Formal rigidity also has an established role in Chai’s work on $p$-divisible formal groups #cite(label("Chai08")). The formal-closure argument below belongs to this general circle of ideas, but starts from a subgroup of Honda-group points and proves its required annihilator statement directly.

Barthel, Heard, and Naumann proved the Hovey–Strickland conjecture at height two for every prime and established the general implication from Chai’s invariant-ideal assertion to the spectral classification #cite(label("BHN22")) Theorems 4.9 and 4.15. The descent and support methods in that implication build on Mathew’s work on Morava $E$-theory descent #cite(label("Mathew16")) and Balmer’s tensor-nilpotence criterion for surjectivity on spectra #cite(label("Balmer18")). We recall the exact support comparison in Proposition 29. Its direction is unrestricted in $p$. The inequality $2 p - 2 > n^2 + n$ in #cite(label("BHN22")) Theorem 4.13 concerns the converse, which uses realization of Morava modules.

The generic-fiber part has earlier Lie-theoretic precedents. Barthel–Heard–Naumann credit Chai with an unpublished characteristic-zero invariant-ideal result and use the Gross–Hopkins period map to study projective stabilizer orbits #cite(label("BHN22")) Remark 4.2 and Proposition 4.18. We retain a local analytic-germ proof of the needed conclusion. The main issue addressed here is the characteristic-$p$ height strata, where infinitesimal stabilizer directions alone do not give the required control of invariant equations.

Recent generation and comparison results concern related categories. Lee and Pstrągowski identify the category of locally fp spectra, which contains the dualizable $K \( n \)$-local spectra as well as nondualizable objects #cite(label("LP26")) Example 1.6 and Theorems 1.7–1.9. Surjectivity of the map from the $K \( n \)$-local to the $E \( n \)$-local Balmer spectrum was established by Barthel–Heard–Naumann #cite(label("BHN22")) Remark 3.6; Balmer–Sanders give a later general treatment #cite(label("BalmerSanders")) Proposition 8.11 and Remark 8.13. These results provide generation and surjectivity statements. The arithmetic theorem above classifies the invariant supports needed to determine the entire ideal lattice.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-3.35, 0), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Characteristic $p$#linebreak()Formal closure#linebreak()Bundle nondegeneracy#linebreak()Tate coordinates \(Sections~2--4\)]]])])
  content((3.35, 0), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Characteristic zero#linebreak()Gross--Hopkins period map#linebreak()Projective directions \(Section~6\)]]])])
  content((-3.35, -1.735), [#box(width: 5.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Local orbit density \(Section~5\)]]])])
  content((0, -3.188), [#box(width: 9.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Open-subgroup invariant primes and radical ideals]]])])
  content((0, -4.322), [#box(width: 9.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[All-prime support comparison of Barthel--Heard--Naumann]]])])
  content((0, -5.457), [#box(width: 9.953cm, inset: 0.1764cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n+2$ thick tensor ideals and $n+1$ Balmer points]]])])
  line((-3.35, -0.9), (-3.35, -1.4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((-3.35, -2.07), (-3.35, -2.87), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((3.35, -0.9), (3.35, -2.87), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -3.505), (0, -4.005), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -4.64), (0, -5.14), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
})],
  caption: [Figure 1: The two orbit arguments classify invariant primes. Only the characteristic-$p$ branch uses the formal, bundle, and deformation constructions of Sections 2–4. The arithmetic branches join before the all-prime support comparison. ],
) <fig:proof-flow>

=== 1.2 The argument <the-argument>

Set $C = bb(C)_p^flat$ and $k = overline(bb(F))_p$, viewed as the coefficient field in $C$, and write $frak(m)_C = { c in C : \| c \| < 1 }$. Fix a characteristic-$p$ point $x$ of formal height $1 lt.eq h < n$. The main task is to show that a nonzero analytic germ at $x$ on the height-at-least-$h$ parameter locus $I_h = 0$ cannot vanish on the stabilizer orbit of $x$. The finite kernels of the universal deformation give a height-$n$ algebraic $p$-divisible group. At $x$, its connected part has height $h$ and its étale quotient has height $r = n - h$. The universal-cover comparison lets us regard a basis $z_1 \, dots.h \, z_r$ of its étale Tate module as points of the perfected height-$n$ Honda group. Specializing these fixed vectors at nearby parameters in this locus gives analytic functions $theta_i$ vanishing at $x$. Their vanishing tests whether the vectors remain in the nearby Tate lattice. Section 4 proves that their parameter differential is invertible: a vector in its kernel splits the étale quotient over the dual numbers, fixed-height rigidity makes the connected factor constant, and the Kodaira–Spencer map then kills the parameter vector (Proposition 17).

Put $q = p^h$. For a fixed $d in A_n$, let $y_N = \( 1 - p^N d \) dot.op x$; these points tend to $x$. Stabilizer transport relates $theta_i \( y_N \)$ to multiplication by $p^N$ in the formal group at $y_N$. Integral comparison series intertwining multiplication by $p$ with that of the height-$h$ Honda group turn this relation into coordinatewise Frobenius powers. Applying these series to the specializations of $z_i$ and $d z_i$ at $y_N$ gives tuples $U_N$ and $s_N$, respectively, in $frak(m)_C^r$. Theorem 22 proves the exact identity and limit

$ U_N = s_N^(q^N) \, #h(2em) s_N arrow.r s \( d \) = #scale(x: 120%, y: 120%)[\(] nu_x \( d z_1 \) \, dots.h \, nu_x \( d z_r \) #scale(x: 120%, y: 120%)[\)] \, $

where $nu_x$ is specialization at $x$ followed by an integral formal identification with the height-$h$ Honda group. Proposition 19 makes $nu_x$ a nonzero natural map on perfectoid test spaces. The corresponding change of parameter coordinates is formal. To compare it with the numerical tuples $U_N$, we match any fixed finite number of analytic coefficient germs and bound the remaining integral tails (Lemma 23). The coefficient germs may have shrinking domains; the estimates require only one finite jet at a time.

Suppose a nonzero analytic germ $P$ vanishes on the orbit. Its expansion in the formal coordinates has fixed coefficients $B_ell$, chosen before $d$. Finite truncation followed by $q^N$-th roots gives bounds on the finite sums $sum_(\| ell \| lt.eq m) B_ell^(1 \/ q^N) s \( d \)^ell$. Frobenius separation (Lemma 3) turns these bounds into a single nonzero formal equation over $k$ on the subgroup

$ S_x = { #scale(x: 120%, y: 120%)[\(] nu_x \( d z_1 \) \, dots.h \, nu_x \( d z_r \) #scale(x: 120%, y: 120%)[\)] : d in A_n } . $

The formal-closure argument in Section 2 then produces a nonzero row of Honda endomorphisms annihilating $S_x$ (Proposition 7).

The contradiction is geometric. The Fargues–Fontaine curve #cite(label("FF18")) and Le Bras’s theorem on Banach–Colmez sheaves #cite(label("LeBras18")) turn this natural endomorphism relation into a vector-bundle relation. A degree-one determinant argument promotes the $bb(Q)_p$-independence of $z_1 \, dots.h \, z_r$ to independence at the generic point of the curve (Lemma 9). There the division algebra action spans the full matrix algebra. A matrix selecting one of these independent vectors contradicts the nonzero endomorphism row (Proposition 11). Thus $P$ must be zero. This vanishing property is the #emph[local orbit density] proved in Theorem 22.

Section 6 uses this result to classify invariant primes containing $p$. Primes in characteristic zero are handled separately by the Gross–Hopkins period map #cite(label("GH94")) #cite(label("HG94Bundles")). A finite minimal-prime argument classifies invariant radical ideals, and the established support comparison transfers the height chain to thick tensor ideals and their Balmer spectrum. The final description also identifies the support map from $"Spec" \( E_0 \)$: each height stratum maps to one Balmer point. Figure 1 records the two arithmetic branches and where they enter the spectral argument.

== 2 Frobenius separation and formal closure <sec:formal>

We first establish a rigidity statement for subgroups of products of a Honda formal group. A formal equation over the residue field will force such a subgroup to satisfy a nonzero homomorphism equation. The first step separates coefficients by taking increasingly deep Frobenius roots.

=== 2.1 Fields and Honda formal groups <fields-and-honda-formal-groups>

Fix a prime $p$. Throughout the proof, put

$ k = overline(bb(F)_p) \, #h(2em) C = bb(C)_p^flat \, $

and fix the coefficient-field embedding $k arrow.r.hook cal(O)_C$ inducing the identification of the residue field with $k$. The field $C$ is algebraically closed, complete, and of characteristic $p$. We write $frak(m)_C = { c in C : \| c \| < 1 }$ and use the maximum norm on finite tuples. Every nonzero element of $k$ has norm one. Consequently a formal power series over $k$ can be evaluated at any tuple in $frak(m)_C^r$.

For $s gt.eq 1$, set $q_s = p^s$ and $k_s = bb(F)_(q_s)$. The Lubin–Tate formal-module construction for the unramified extension of $bb(Q)_p$ of degree $s$, applied to the series $p T + T^(q_s)$ #cite(label("LT65")) Theorem 1, gives on reduction a one-dimensional commutative Honda formal group $Gamma_s$ over $k_s$ with

$ \[ p \]_(Gamma_s) \( T \) = T^(q_s) . $

Write

$ A_s = "End"_k \( Gamma_s \) \, #h(2em) Delta_s = A_s \[ 1 \/ p \] . $

The classification of one-dimensional formal groups #cite(label("Hazewinkel78")) Theorem 18.5.1 identifies every formal group of height $s$ over an algebraically closed field of characteristic $p$ with $Gamma_s$. Dieudonné theory over perfect fields #cite(label("Demazure72")) Chapter III, §8; Chapter IV, §§1,3–4 shows that its associated $p$-divisible group is simple up to isogeny and that $Delta_s$ is a central division algebra over $bb(Q)_p$ of dimension $s^2$. The isogeny category of $p$-divisible groups over $k$ is semisimple. These statements include height one and the prime two.

Every endomorphism of $Gamma_s$ is defined over $k_s$. Indeed, if $a \( T \) = sum_(j gt.eq 1) a_j T^j$ is such an endomorphism, its commutation with multiplication by $p$ gives

$ a \( T^(q_s) \) = a \( T \)^(q_s) \, $

so $a_j^(q_s) = a_j$ for all $j$. We use formal-group addition in $Gamma_s$ and its products; ordinary sums of power-series coefficients and ordinary differences of coordinates retain their usual meaning.

=== 2.2 Separating coefficients <separating-coefficients>

For a multi-index $ell = \( ell_1 \, dots.h \, ell_r \) in bb(N)^r$, put $\| ell \| = sum_i ell_i$ and $T^ell = product_i T_i^(ell_i)$. Roots under Frobenius in $C$ are unique. For a related separation argument using high Frobenius substitutions, see #cite(label("Chai08")) Proposition 3.1.

#thm([Lemma 2.1.])[
  (Frobenius separation).  #emph[Let $h \, r gt.eq 1$, put $q = p^h$, and let $\( b_ell \)_(ell in bb(N)^r)$ be an arbitrary family in $C$. Suppose $s in frak(m)_C^r$ satisfies, for every integer $m gt.eq 0$, 
#[#set math.equation(numbering: n => "(2.1)")
 $ limsup_(N arrow.r oo) lr(|sum_(\| ell \| lt.eq m) b_ell^(1 \/ q^N) s^ell|) lt.eq parallel s parallel^(m + 1) . $ <formal:root-bound>]

 Then, for every $k$-linear functional $lambda : C arrow.r k$, 
$ sum_(ell in bb(N)^r) lambda \( b_ell \) s^ell = 0 . $

 The series in this conclusion converges, and no continuity assumption on $lambda$ is required.]
] <formal:separation>

#proof[
  Fix $m$. If all the coefficients through degree $m$ vanish, the corresponding assertion is immediate. Otherwise choose a $k$-basis $beta_1 \, dots.h \, beta_a$ for their span and write
  $ b_ell = sum_(j = 1)^a c_(ell j) beta_j \, #h(2em) c_(ell j) in k quad \( \| ell \| lt.eq m \) . $
  There is a subsequence of positive integers $N$ on which $q^N$-power Frobenius fixes all the $c_(ell j)$: finitely many elements of $overline(bb(F)_p)$ lie in a common finite field. On this subsequence,
  $ sum_(\| ell \| lt.eq m) b_ell^(1 \/ q^N) s^ell = sum_(j = 1)^a beta_j^(1 \/ q^N) v_j \, #h(2em) v_j = sum_(\| ell \| lt.eq m) c_(ell j) s^ell . $
  Put $V = max_j \| v_j \|$. If $V > 0$, choose $j_0$ with $\| v_(j_0) \| = V$, set $w_j = v_j \/ v_(j_0)$, and let $rho_j in k$ be the residue of $w_j in cal(O)_C$. At least one $rho_j$ is nonzero, and
  $ eta := max_j \| w_j - rho_j \| < 1 . $
  Pass to a further subsequence on which $q^N$-power Frobenius also fixes all the $rho_j$. The independence of the $beta_j$ gives $sum_j beta_j rho_j eq.not 0$, whence
  $ lr(|sum_j beta_j^(1 \/ q^N) rho_j|) = lr(|sum_j beta_j rho_j|)^(1 \/ q^N) arrow.r 1 . $
  On the other hand,
  $ limsup_N lr(|sum_j beta_j^(1 \/ q^N) \( w_j - rho_j \)|) lt.eq eta < 1 \, $
  since $\| beta_j \|^(1 \/ q^N) arrow.r 1$ for every $j$. The ultrametric inequality therefore implies
  $ lr(|sum_j beta_j^(1 \/ q^N) v_j|) arrow.r V $
  along this subsequence. Equation (2.1) gives $V lt.eq parallel s parallel^(m + 1)$; this inequality also holds if $V = 0$.
  For an arbitrary $k$-linear functional $lambda$, we now have the finite-sum estimate
  $ lr(|sum_(\| ell \| lt.eq m) lambda \( b_ell \) s^ell|) = lr(|sum_j lambda \( beta_j \) v_j|) lt.eq V lt.eq parallel s parallel^(m + 1) . $
  Here $\| lambda \( beta_j \) \| lt.eq 1$, because these values lie in $k$. The series with coefficients $lambda \( b_ell \) in k$ converges at $s$, and the last bound tends to zero as $m arrow.r oo$. At $s = 0$, Equation (2.1) for $m = 0$ forces $b_0 = 0$, giving the same conclusion. ◻
]

#prodef([Remark 2.2.])[
  The family $b_ell$ need not be bounded. All uses of $lambda$ in the proof concern finite sums. Moreover, the conclusion holds for #emph[every] $lambda$ at each tuple satisfying the hypothesis. Thus, if the same family satisfies Equation (2.1) at every point of a set, one may choose a single $lambda$ nonzero on one prescribed nonzero $b_ell$ and obtain a common nonzero formal equation over $k$ on that set. The Frobenius subsequences used to prove the estimates may depend on the tuple and on $m$.
] <formal:separation-quantifiers>

=== 2.3 Reduced formal subgroups <reduced-formal-subgroups>

To prove formal closure, we will show that the ideal of all equations vanishing on a subgroup of points defines a reduced formal subgroup. The next two lemmas turn that formal subgroup into a nonzero homomorphism equation. We first prove smoothness, before its dimension or irreducibility is known. The use of ordinary differentials is justified by the finite Frobenius expansion over a perfect coefficient field.

#thm([Lemma 2.3.])[
  #emph[Let $cal(G)$ be a smooth formal group over $k$ of dimension $r$, with coordinate ring $R = k \[ \[ T_1 \, dots.h \, T_r \] \]$. If $cal(H) subset.eq cal(G)$ is a reduced closed formal subgroup, then $cal(H)$ is smooth. More precisely, for $B = R \/ I$, with augmentation ideal $frak(m)_B$, put $e = dim_k \( frak(m)_B \/ frak(m)_B^2 \)$. Then $B tilde.equiv k \[ \[ X_1 \, dots.h \, X_e \] \]$ as a complete local $k$-algebra.]
] <formal:reduced-smooth>

#proof[
  Every $f in R$ has a unique finite decomposition
  $ f = sum_(0 lt.eq a_i < p) T_1^(a_1) dots.h.c T_r^(a_r) f_a \( T \)^p . $
  An ordinary $k$-derivation kills all the $p$th powers, so this identity shows that it is determined by its values on the $T_i$, through the usual formal partial derivatives. Those partial derivatives themselves are derivations. Hence the ordinary module $Omega_(R \/ k)^1$ is free on $d T_1 \, dots.h \, d T_r$, and the quotient presentation gives
  #[#set math.equation(numbering: n => "(2.2)")
   $ Omega_(B \/ k)^1 tilde.equiv B^r #scale(x: 120%, y: 120%)[\/] ⟨#scale(x: 120%, y: 120%)[\(] partial_1 f \, dots.h \, partial_r f #scale(x: 120%, y: 120%)[\)] : f in I⟩_B . $ <formal:differential-presentation>]
  In particular, this ordinary differential module is finite over $B$.
  Consider the completed product ring
  $ B hat(⊗)_k B = k \[ \[ X_1 \, dots.h \, X_r \, Y_1 \, dots.h \, Y_r \] \] \/ \( I \( X \) \, I \( Y \) \) $
  and its diagonal ideal $J = \( Y_i - X_i \)_i$. Writing $Y = X + Z$ modulo $\( Z \)^2$ gives
  $ f \( X + Z \) = f \( X \) + sum_i partial_i f \( X \) Z_i med \( mod med \( Z \)^2 \) . $
  Thus $J \/ J^2$ has exactly the presentation in Equation (2.2). This computation makes no reducedness assumption on the completed product. The group-difference automorphism
  $ \( x \, y \) mapsto \( x \, y -_(cal(H)) x \) $
  carries the diagonal to the identity section in the second factor. The conormal module of that section is $B ⊗_k \( frak(m)_B \/ frak(m)_B^2 \)$: it is obtained by retaining just the linear terms in the second coordinates. We conclude that
  #[#set math.equation(numbering: n => "(2.3)")
   $ Omega_(B \/ k)^1 tilde.equiv B ⊗_k \( frak(m)_B \/ frak(m)_B^2 \) tilde.equiv B^e . $ <formal:invariant-differentials>]
  Let $frak(p)$ be a minimal prime of $B$ and set $D = B \/ frak(p)$, $K = "Frac" \( D \)$, and $d = dim D$. Since $B$ is reduced, $B_(frak(p))$ is the field $K$. Localization of ordinary differentials in Equation (2.3) gives $dim_K Omega_(K \/ k)^1 = e$.
  Choose a system of parameters in the complete local domain $D$. Completeness and the finite-dimensional quotient by those parameters give a finite map $k \[ \[ x_1 \, dots.h \, x_d \] \] arrow.r D$. It is injective by dimension, since a nonzero ideal in the source would lower its dimension. Thus $K$ is a finite extension of $L = "Frac" \( k \[ \[ x_1 \, dots.h \, x_d \] \] \)$. Monomials with exponents below $p$ form a basis over Frobenius, so $\[ L : L^p \] = p^d$. This degree is unchanged by the finite extension: Frobenius identifies the extensions $K \/ L$ and $K^p \/ L^p$, and comparison of the two towers over $L^p$ gives
  $ \[ K : K^p \] = frac(\[ K : L \] thin \[ L : L^p \], \[ K^p : L^p \]) = p^d . $
  This argument includes inseparable extensions. Because $k$ is perfect, the $p$-basis description of field differentials now gives $dim_K Omega_(K \/ k)^1 = d$. Indeed, a $p$-basis of $K$ over $K^p$ has $d$ elements, and their differentials form a $K$-basis of $Omega_(K \/ k)^1$. Therefore $d = e$.
  Every component has dimension $e$, so $dim B = e$. This equals the embedding dimension of $B$, making $B$ regular. Lifting a basis of $frak(m)_B \/ frak(m)_B^2$ gives a surjection $k \[ \[ X_1 \, dots.h \, X_e \] \] arrow.r B$ by completeness. Equality of dimensions makes its kernel zero, proving the assertion. ◻
]

#thm([Lemma 2.4.])[
  #emph[Let $h \, r gt.eq 1$. Every proper reduced closed formal subgroup $cal(H) subset.neq Gamma_h^r$ is annihilated by a nonzero homomorphism $Gamma_h^r arrow.r Gamma_h$ defined over $k$.]
] <formal:annihilator>

#proof[
  Put $q = p^h$, and let $I eq.not 0$ be the defining ideal of $cal(H)$ in $R = k \[ \[ T_1 \, dots.h \, T_r \] \]$. By Lemma 5, its coordinate ring is a power-series ring $B$ of some dimension $e < r$. If $e = 0$, then $B = k$ and $cal(H)$ is the origin; a coordinate projection proves the assertion. Assume henceforth that $e > 0$.
  Let $sigma : R arrow.r R$ raise every coefficient to its $q$th power and fix the variables. For $P in I$, stability under multiplication by $p$ gives
  $ P \( T_1^q \, dots.h \, T_r^q \) = \( sigma^(- 1) P \( T \) \)^q in I . $
  Radicality implies $sigma^(- 1) I subset.eq I$. Applying $sigma$ repeatedly produces the ascending chain
  $ I subset.eq sigma I subset.eq sigma^2 I subset.eq dots.h.c . $
  It stabilizes because $R$ is Noetherian, and applying an inverse iterate of $sigma$ to a stationary pair gives $I = sigma I$. Consequently $sigma$ descends to an automorphism of $B$.
  The coordinate pullback of $\[ p \]$ on $cal(H)$ is the $h$-fold absolute Frobenius of $B$, composed with $sigma^(- 1)$. This $h$-fold Frobenius on $B tilde.equiv k \[ \[ X_1 \, dots.h \, X_e \] \]$ is finite free, with basis given by monomials whose exponents are less than $q$. Thus $\[ p \]$ on $cal(H)$ is finite flat of degree $q^e = p^(h e)$. The kernels $cal(H) \[ p^j \]$ are finite flat of order $p^(h e j)$. The map induced by $\[ p \]$ from level $j + 1$ to level $j$ is a pullback of $\[ p \] : cal(H) arrow.r cal(H)$, hence is faithfully flat. These kernels form a $p$-divisible subgroup $cal(H) \[ p^oo \]$ of $Gamma_h^r \[ p^oo \]$, of height $h e < h r$.
  They also recover the formal topology. If $overline(T)_i$ are the images of the ambient coordinates in $B$ and
  $ J_j = \( overline(T)_1^(q^j) \, dots.h \, overline(T)_r^(q^j) \) \, $
  then
  #[#set math.equation(numbering: n => "(2.4)")
   $ frak(m)_B^(r \( q^j - 1 \) + 1) subset.eq J_j subset.eq frak(m)_B^(q^j) . $ <formal:kernel-topology>]
  The first inclusion follows because any monomial of the indicated total degree has an exponent at least $q^j$.
  In the semisimple isogeny category over $k$, the ambient group is a sum of $r$ copies of the simple object associated to $Gamma_h$. The subgroup has smaller height. Projecting a nonzero complementary summand onto one simple factor gives a nonzero rational morphism
  $ phi_(bb(Q)_p) : Gamma_h^r \[ p^oo \] arrow.r Gamma_h \[ p^oo \] $
  whose restriction to $cal(H) \[ p^oo \]$ is zero. Choose one common power of $p$ clearing its denominator, and let $phi$ be the resulting actual morphism of $p$-divisible groups. Its restriction is actually zero. To see this, Hom groups of $p$-divisible groups are $p$-torsion-free: if $p^a f = 0$, then $f compose \[ p \]^a = 0$, and $\[ p \]^a$ on the source is an epimorphism of fppf sheaves. A rationally zero restriction is killed by one power of $p$ in its Hom group and hence vanishes.
  The compatible coordinate maps at finite levels recover an actual formal homomorphism $Gamma_h^r arrow.r Gamma_h$. In fact, the ambient and target kernel ideals are respectively $\( T_1^(q^j) \, dots.h \, T_r^(q^j) \)$ and $\( T^(q^j) \)$, and inverse limits of their coordinate rings are the corresponding power-series rings. The finite-level homomorphism identities pass to these separated inverse limits. The resulting formal morphism is nonzero since $phi$ is nonzero. Its restriction to $cal(H)$ vanishes by Equation (2.4) and $⋂_j J_j = 0$. This proves the assertion. ◻
]

=== 2.4 From an equation to an annihilator <from-an-equation-to-an-annihilator>

#thm([Proposition 2.5.])[
  (Formal closure).  #emph[Let $h \, r gt.eq 1$, and let $S$ be a subgroup of $Gamma_h^r \( frak(m)_C \)$. If a nonzero power series in $k \[ \[ T_1 \, dots.h \, T_r \] \]$ vanishes on $S$, then there are $a_1 \, dots.h \, a_r in A_h$, not all zero, such that 
$ a_1 \( s_1 \) +_(Gamma_h) dots.h.c +_(Gamma_h) a_r \( s_r \) = 0 #h(2em) upright("for every ") s in S . $

]
] <formal:closure>

#proof[
  Let $R = k \[ \[ T_1 \, dots.h \, T_r \] \]$, let $F$ be the law of $Gamma_h^r$, and let $I subset R$ be the ideal of all series vanishing on $S$. Evaluation into the field $C$ shows that $I$ is radical. It is nonzero by hypothesis and proper because $0 in S$. We show that it defines a formal subgroup.
  For $P in I$, put $Q \( T \, T' \) = P \( F \( T \, T' \) \)$. Fix $s in S$ and write
  $ Q \( s \, T' \) = sum_ell b_ell \( T' \)^ell . $
  Each $b_ell$ is the evaluation at $s$ of a series over $k$, so $\| b_ell \| lt.eq 1$. For $q = p^h$ and every $t in S$, coordinatewise $q^N$th power is multiplication by $p^N$; hence $Q \( s \, t^(q^N) \) = 0$. Truncation at degree $m$ gives
  $ lr(|sum_(\| ell \| lt.eq m) b_ell t^(q^N ell)|) lt.eq parallel t parallel^(q^N \( m + 1 \)) . $
  Taking $q^N$th roots and applying Lemma 3 shows that, for every $k$-linear $lambda : C arrow.r k$, the coefficientwise transform
  $ Q_(s \, lambda) \( T' \) := sum_ell lambda \( b_ell \) \( T' \)^ell $
  vanishes on $S$, and therefore belongs to $I \( T' \)$.
  To descend this statement in the first variable, fix $m$ and consider the finite-dimensional $k$-algebra
  $ D_m = k \[ \[ T' \] \] \/ #scale(x: 120%, y: 120%)[\(] I \( T' \) + \( T' \)^(m + 1) #scale(x: 120%, y: 120%)[\)] . $
  Choose a $k$-basis $e_1 \, dots.h \, e_b$ of $D_m$. Modulo its defining ideal, write
  $ Q \( T \, T' \) = sum_(a = 1)^b c_a \( T \) e_a \, #h(2em) c_a \( T \) in k \[ \[ T \] \] . $
  Every $c_a \( T \)$ is a finite $k$-linear combination of the coefficients of $\( T' \)^ell$ in $Q$, with $\| ell \| lt.eq m$. Consequently $lambda \( c_a \( s \) \)$ is exactly the $e_a$-coordinate of the image of $Q_(s \, lambda)$ in $D_m$. It is zero. Since algebraic $k$-linear functionals separate the points of $C$, we obtain $c_a \( s \) = 0$ for every $s in S$, and thus $c_a in I \( T \)$. This argument moves $lambda$ across a finite linear combination of already evaluated coefficients; it does not move it through an infinite evaluation.
  It follows that
  $ Q in I \( T \) + I \( T' \) + \( T' \)^(m + 1) #h(2em) upright("for every ") m . $
  Krull intersection #cite(label("Stacks")) Tag 00IP in the Noetherian local quotient by $I \( T \) + I \( T' \)$ gives $Q in I \( T \) + I \( T' \)$. The identity and inversion conditions follow from $0 in S$ and $-_(Gamma_h^r) S = S$. Therefore $"Spf" \( R \/ I \)$ is a proper reduced closed formal subgroup of $Gamma_h^r$.
  Lemma 6 supplies a nonzero formal homomorphism $phi : Gamma_h^r arrow.r Gamma_h$ killing this subgroup. Its restrictions to the factors are endomorphisms $a_i in A_h$, and the commutative group law gives
  $ phi \( T \) = a_1 \( T_1 \) +_(Gamma_h) dots.h.c +_(Gamma_h) a_r \( T_r \) . $
  They are not all zero. The coordinate series of $phi$ belongs to $I$, so evaluating on $S$ proves the required identity. ◻
]

== 3 A nondegeneracy lemma from the Fargues–Fontaine curve <sec:bundles>

The formal-closure result reduces our problem to endomorphism relations among Honda-group points. We first prove the geometric fact that will exclude those relations: fewer than $n$ global sections of the rank-$n$, degree-one stable bundle, independent over $bb(Q)_p$, remain independent at the generic point. We then identify Honda-group points with sections of these bundles. The identification holds on every perfectoid test space, so natural maps and endomorphisms become bundle maps.

=== 3.1 Degree-one bundles and independent sections <degree-one-bundles-and-independent-sections>

Write $X_C$ for the algebraic Fargues–Fontaine curve with coefficient field $bb(Q)_p$. We use the vector bundle GAGA equivalence to pass between its algebraic and adic versions. The following geometric properties are the inputs to the determinant argument.

#thm([Theorem 3.1.])[
  (Fargues–Fontaine).  #emph[The curve $X_C$ is integral, regular and Noetherian of dimension one, and $H^0 \( X_C \, cal(O)_(X_C) \) = bb(Q)_p$. Degrees of vector bundles are integers, and every nonzero effective divisor has positive degree. For each $s gt.eq 1$ there is a stable bundle 
$ cal(E)_s = cal(O)_(X_C) \( 1 \/ s \) $

 of rank $s$ and degree one.]
] <bundles:geometry>

These assertions, including the GAGA comparison, are the Fargues–Fontaine vector bundle theorems #cite(label("FF18")), in the form of #cite(label("FS21")) § II.2.3–II.2.4, especially Propositions II.2.7, II.2.9–II.2.10 and Example II.2.11. The assertion about constants is #cite(label("FS21")) Proposition II.2.5(ii).

#thm([Lemma 3.2.])[
  (Generic independence).  #emph[Let $1 lt.eq r < n$, and let $z_1 \, dots.h \, z_r in H^0 \( X_C \, cal(E)_n \)$ be linearly independent over $bb(Q)_p$. Their images in the generic fiber of $cal(E)_n$ are linearly independent over the function field $K_X$ of $X_C$.]
] <bundles:independence>

#proof[
  Let $cal(F) subset.eq cal(E)_n$ be the saturation of the image of the section map $cal(O)_(X_C)^r arrow.r cal(E)_n$, and let $b = "rank" cal(F)$. On a regular Noetherian curve saturation is a subbundle, and $1 lt.eq b lt.eq r < n$. Choose $b$ of the given sections that are independent at the generic point. Their wedge is a nonzero global section of $det cal(F)$, so $deg cal(F) gt.eq 0$. Semistability of $cal(E)_n$ gives
  $ 0 lt.eq deg cal(F) lt.eq b / n < 1 . $
  Its integral degree is therefore zero. The divisor of the wedge section is effective of degree zero, hence empty by Theorem 8. The chosen $b$ sections thus trivialize $cal(F)$ by the determinant criterion.
  All the original sections belong to $H^0 \( X_C \, cal(F) \)$. Under this trivialization that space is $bb(Q)_p^b$, so their assumed $bb(Q)_p$-independence gives $r lt.eq b$. Consequently $b = r$, as required. ◻
]

To apply this lemma to points of $Gamma_s \( frak(m)_C \)$, we need their realization as global sections and a corresponding realization of natural maps as bundle maps. We establish both comparisons next.

=== 3.2 Honda groups as relative section sheaves <honda-groups-as-relative-section-sheaves>

We use the big pro-étale site of perfectoid spaces over $C = bb(C)_p^flat$, denoted by $"Perf"_C$. For an affinoid $S = "Spa" \( R \, R^(+) \)$, let $R^(compose compose)$ be the topologically nilpotent elements of $R$, and put

$ cal(H)_s \( S \) = Gamma_s \( R^(compose compose) \) \, #h(2em) s gt.eq 1 . $

The underlying functor is the perfected open unit disc, equipped with the Honda group law; in particular, it is a sheaf. Since $R$ is perfect, $\[ p \]_(Gamma_s) \( z \) = z^(q_s)$ is bijective. Together with the continuous formal $bb(Z)_p$-action, this makes $cal(H)_s$ a sheaf of $bb(Q)_p$-vector spaces. All roots appearing in this description are unique.

The choice of $R^(+)$ causes no restriction on these points. Indeed, if $z in R^(compose compose)$, openness of $R^(+)$ gives $z^m in R^(+)$ for some $m gt.eq 1$. The element $z$ is integral over $R^(+)$ and therefore belongs to $R^(+)$, which is integrally closed in $R$. Thus $R^(compose compose) subset.eq R^(+)$ for every affinoid perfectoid pair. We also write $cal(H)_s \( R \)$ for these values, and $cal(H)_s \( C \) = Gamma_s \( frak(m)_C \)$.

For $S in "Perf"_C$, write $X_S$ for the relative curve. If $cal(V)$ is a vector bundle on $X_C$, let $cal(V)_S$ be its pullback and define

$ cal(B) \( cal(V) \) \( S \) = H^0 \( X_S \, cal(V)_S \) . $

This is a pro-étale sheaf; in fact relative sections satisfy $v$-descent #cite(label("FS21")) Proposition II.2.1.

The section-sheaf dictionary has two parts: it identifies the Honda sheaves with the bundles just introduced, and it recovers bundle maps from additive maps of their section sheaves.

#thm([Theorem 3.3.])[
  (Fargues–Fontaine and Le Bras).  #emph[]
  + #emph[For every $s gt.eq 1$, after choosing an identification of a height-$s$ Lubin–Tate special fiber with $Gamma_s$, there is a natural isomorphism of $bb(Q)_p$-vector space sheaves 
$ cal(H)_s med tilde.equiv med cal(B) \( cal(E)_s \) . $

 In particular, its value at $"Spa" \( C \, cal(O)_C \)$ identifies $Gamma_s \( frak(m)_C \)$ with $H^0 \( X_C \, cal(E)_s \)$.]
  + #emph[For vector bundles $cal(V) \, cal(W)$ on $X_C$ with nonnegative Harder–Narasimhan slopes, the natural map 
$ "Hom"_(X_C) \( cal(V) \, cal(W) \) arrow.r "Hom"_("Sh"_(upright("Ab")) \( "Perf"_C \)) #scale(x: 120%, y: 120%)[\(] cal(B) \( cal(V) \) \, cal(B) \( cal(W) \) #scale(x: 120%, y: 120%)[\)] $

 is an isomorphism. Thus every additive sheaf morphism between these section sheaves is induced by a unique bundle morphism.]
] <bundles:input>

#proof[
  #emph[The identification and full faithfulness.] For part (i), let $E^(\( s \)) subset bb(C)_p$ be the unramified extension of $bb(Q)_p$ of degree $s$, and let $G^(\( s \))$ be a Lubin–Tate formal group for $E^(\( s \))$, with uniformizer $p$ #cite(label("LT65")) Theorem 1. Its reduction over $k$ has height $s$ as a $p$-divisible formal group. Choose a formal group isomorphism from this reduction to $Gamma_s$.
  Tilting gives an equivalence between the big pro-étale sites over $bb(C)_p$ and over $C$ #cite(label("LeBras18")) Theorem 2.7. Thus each $S = "Spa" \( R \, R^(+) \)$ has its specified untilt $S^sharp = "Spa" \( R^sharp \, R^(sharp +) \)$ over $bb(C)_p$. Fargues–Scholze identify the Lubin–Tate universal cover with relative sections by a natural isomorphism #cite(label("FS21")) Proposition II.2.2
  $ "proj lim"_(\[ p \]) G^(\( s \)) #scale(x: 120%, y: 120%)[\(] \( R^sharp \)^(compose compose) #scale(x: 120%, y: 120%)[\)] med tilde.equiv med H^0 #scale(x: 120%, y: 120%)[\(] X_(S \, E^(\( s \))) \, cal(O) \( 1 \) #scale(x: 120%, y: 120%)[\)] . $
  Here $X_(S \, E^(\( s \)))$ denotes the relative curve with coefficient field $E^(\( s \))$. Their integral formulation gives the same universal-cover points, since the topologically nilpotent elements belong to every allowed integral subring.
  We spell out the comparison of the left side with $cal(H)_s \( S \)$. Choose $p^flat in cal(O)_C$ with $\( p^flat \)^sharp = p$. The tilting comparison identifies
  $ \( R^sharp \)^compose \/ p med tilde.equiv med R^compose \/ \( p^flat \) \, $
  with compatible residue embeddings of $k$. On these quotient rings the chosen special-fiber isomorphism identifies the two formal group laws. It remains to pass between universal-cover points before and after reduction.
  The relevant reduction comparison can be seen directly. Suppose an integral formal group law is evaluated in a complete uniform algebra, and reduce its power-bounded ring modulo a fixed small base parameter of norm $delta < 1$. A nilpotent element of the quotient lifts to a topologically nilpotent element: if a lift $a$ satisfies $a^m$ in the parameter ideal, its spectral norm satisfies $parallel a parallel^m lt.eq delta$. Given compatible formal points $\( macron(a)_j \)_(j gt.eq 0)$ of the quotient under $\[ p \]$, choose such lifts $a_j$. For each fixed $i$, the sequence
  $ \[ p \]^j \( a_(i + j) \) \, #h(2em) j gt.eq 0 \, $
  converges. Indeed the formal difference between two successive terms is obtained by pushing down $j$ times a difference of norm at most $delta$. For a difference of norm $epsilon.alt < 1$, integrality and the linear coefficient $p$ give the bound
  $ parallel \[ p \] \( w \) parallel lt.eq max { \| p \| epsilon.alt \, epsilon.alt^2 } #h(2em) \( parallel w parallel lt.eq epsilon.alt \) \, $
  and its iterates tend to zero. In characteristic $p$ the linear term is zero, giving the same conclusion. These estimates use an equivalent complete spectral norm, which is submultiplicative and power-multiplicative; no field hypothesis on the test algebra is needed. Integral formal translation also turns these bounds on formal differences into bounds on ordinary coordinate differences.
  For fixed $i$ the limit has norm at most $max { parallel a_i parallel \, delta } < 1$. The scalar ideal is closed for the spectral norm, so the limits retain the prescribed reductions. The limits therefore form a compatible lift of $\( macron(a)_j \)$ by topologically nilpotent points. Two choices of lifts give the same limits by the identical contraction estimate, and the same estimate proves uniqueness of a compatible lift. The comparison therefore commutes with algebra maps and with the group operations. It also commutes with formal scalar multiplication. This proves the required natural reduction invariance of the universal cover; compare #cite(label("FS21")) § II.2.1 and #cite(label("LeBras18")) Proposition 2.14, Lemma 2.15, and Remark 2.21.
  Applying this comparison on both sides of the displayed tilting isomorphism gives
  $ "proj lim"_(\[ p \]) G^(\( s \)) #scale(x: 120%, y: 120%)[\(] \( R^sharp \)^(compose compose) #scale(x: 120%, y: 120%)[\)] med tilde.equiv med "proj lim"_(\[ p \]) Gamma_s \( R^(compose compose) \) med tilde.equiv med Gamma_s \( R^(compose compose) \) . $
  The last isomorphism sends $z$ to the compatible sequence $\( z^(1 \/ q_s^j) \)_(j gt.eq 0)$ and uses perfectness of $R$.
  We now pass from the coefficient field $E^(\( s \))$ to $bb(Q)_p$. Along the unramified coefficient extension $pi_s : X_(S \, E^(\( s \))) arrow.r X_S$, one has
  $ \( pi_s \)_(*) cal(O) \( 1 \) tilde.equiv \( cal(E)_s \)_S . $
  This is the unramified pushforward description of $cal(O) \( 1 \/ s \)$ #cite(label("LeBras18")) § 5.1; see also #cite(label("FS21")) proofs of Theorem II.2.14 and Corollary II.3.3. The description is relative and natural in $S$: on the Frobenius cover, pushforward cycles $s$ lines, with the $s$-fold isocrystal Frobenius having multiplier $p^(- 1)$. It therefore gives the rank-$s$ isocrystal of slope $- 1 \/ s$, and hence the bundle of slope $+ 1 \/ s$. Taking sections commutes with this pushforward, proving part (i) on the whole site.
  For part (ii), Le Bras identifies Banach–Colmez sheaves with the tilted heart
  $ "Coh"_(X_C)^(-) = {F in D^b \( "Coh"_(X_C) \) : H^i \( F \) = 0 med \( i eq.not - 1 \, 0 \) \, quad H^(- 1) \( F \) < 0 \, quad H^0 \( F \) gt.eq 0} $
  by the functor $R^0 tau_(*)$ #cite(label("LeBras18")) Theorem 1.2, Theorem 7.1. The inequalities here refer to all Harder–Narasimhan slopes. A nonnegative-slope vector bundle, placed in degree zero, belongs to this heart, and its $R^0 tau_(*)$ is the relative section sheaf just defined #cite(label("LeBras18")) Proposition 6.8 and its proof. The heart is full in the derived category, so Hom between two such bundles is their usual bundle Hom. Moreover, the proof of #cite(label("LeBras18")) Theorem 7.1 establishes the degree-zero Ext comparison in the category of abelian sheaves on the big site. Consequently it applies to the Hom group in part (ii), without an additional analytic-morphism or scalar-continuity hypothesis. The fixed tilting equivalence transports this statement to $"Perf"_C$. ◻
]

In particular, every endomorphism in $A_s$ acts naturally on $cal(H)_s$ and therefore on $cal(E)_s$. This action extends to $Delta_s = A_s \[ 1 \/ p \]$, since multiplication by $p$ is invertible on both sides. We will use this action on the bundle itself. No full faithfulness assertion for the isocrystal-to-bundle functor is needed.

=== 3.3 Endomorphism orbits <endomorphism-orbits>

#thm([Proposition 3.4.])[
  (Nondegeneracy).  #emph[Let $0 < h < n$ and $1 lt.eq r < n$. Suppose that $z_1 \, dots.h \, z_r in cal(H)_n \( C \)$ are $bb(Q)_p$-linearly independent and that 
$ nu : cal(H)_n arrow.r cal(H)_h $

 is a nonzero morphism of $bb(Q)_p$-vector space sheaves on $"Perf"_C$. Then the subgroup 
$ S_nu = { #scale(x: 120%, y: 120%)[\(] nu \( d z_1 \) \, dots.h \, nu \( d z_r \) #scale(x: 120%, y: 120%)[\)] : d in A_n #scale(x: 120%, y: 120%)[}] subset.eq Gamma_h^r \( frak(m)_C \) $

 satisfies no nonzero formal power series equation over $k$.]
] <bundles:nondegeneracy>

#proof[
  The set $S_nu$ is a subgroup because the ring addition in $A_n$ and the map $nu$ respect the formal group laws. If a nonzero $k$-formal series vanished on it, Proposition 7 would give $a_1 \, dots.h \, a_r in A_h$, not all zero, such that
  #[#set math.equation(numbering: n => "(3.1)")
   $ sum_(i = 1)^r a_i nu d \( z_i \) = 0 #h(2em) upright("for every ") d in A_n . $ <bundles:annihilator-relation>]
  The sum in this equation is the target group sum.
  By Theorem 10, regard the $z_i$ as global sections of $cal(E)_n$ and $nu$ as a nonzero bundle map $cal(E)_n arrow.r cal(E)_h$. The operators in $A_n$ and $A_h$ also act by bundle maps. Passing to the generic point gives a unital $K_X$-algebra homomorphism
  $ Delta_n ⊗_(bb(Q)_p) K_X arrow.r "End"_(K_X) #scale(x: 120%, y: 120%)[\(] \( cal(E)_n \)_(K_X) #scale(x: 120%, y: 120%)[\)] . $
  The source is central simple over $K_X$. The homomorphism is therefore injective, and both algebras have dimension $n^2$ over $K_X$, so it is an isomorphism. In particular, splitting of $Delta_n$ over $K_X$ follows from the displayed action; it has not been assumed in constructing that action.
  Equation (3.1) is linear in $d$. First extend it from $A_n$ to $A_n \[ 1 \/ p \] = Delta_n$. At the generic point it then extends $K_X$-linearly to all of the displayed matrix algebra. This is the extension of a vanishing linear identity; no assertion that an arbitrary matrix preserves the order $A_n$ is involved.
  By Lemma 9, the generic vectors $z_i$ are independent. Choose an index $i_0$ with $a_(i_0) eq.not 0$. This operator is invertible in the division algebra $Delta_h$, hence acts invertibly on $cal(E)_h$. The generic map $nu_(K_X)$ is nonzero: a nonzero morphism between vector bundles on an integral curve cannot have zero generic fiber. Choose $w in \( cal(E)_n \)_(K_X)$ with $nu_(K_X) \( w \) eq.not 0$, and choose a matrix $M$ satisfying
  $ M z_(i_0) = w \, #h(2em) M z_i = 0 quad \( i eq.not i_0 \) . $
  Such a matrix exists by independence. Substituting it into the extended identity gives $a_(i_0) nu_(K_X) \( w \) = 0$, a contradiction. ◻
]

The hypothesis that $nu$ is a sheaf morphism is important: the bundle argument does not apply to an arbitrary linear map between the $C$-valued groups. In the next section we construct the required nonzero natural morphism from a deformation point, together with the independent vectors to which Proposition 11 will be applied.

== 4 Deformation coordinates and specialization <sec:deformations>

At a characteristic-$p$ point of formal height $1 lt.eq h < n$, the full height-$n$ $p$-divisible group has an étale Tate module of rank $n - h$. We embed this module in the height-$n$ Honda universal cover and use a specialization map to detect whether its vectors remain in the Tate lattice at a nearby parameter point. The values of this map on a Tate basis will give analytic functions with invertible differential along the height-at-least-$h$ parameter space.

We first construct the specialization map and prove this differential statement. An integral comparison with the height-$h$ Honda group then gives the nonzero natural map needed in Proposition 11. Finally, we determine how the specialization map changes under the stabilizer action.

=== 4.1 The universal family and its height strata <the-universal-family-and-its-height-strata>

Let $H$ be the universal deformation of $Gamma_n$ over

$ E_0 = W \( k_n \) \[ \[ u_1 \, dots.h \, u_(n - 1) \] \] \, #h(2em) R_0 = E_0 \/ p = k_n \[ \[ u_1 \, dots.h \, u_(n - 1) \] \] . $

We also write $H$ for its reduction over $R_0$. Choose the usual successive height parameters. The Lubin–Tate parameter construction and universality theorem #cite(label("LT66")) Proposition 1.1 and Theorem 3.1 give the following convention: after setting $p \, u_1 \, dots.h \, u_(h - 1)$ to zero, the $p$-series factors as

#[#set math.equation(numbering: n => "(4.1)")
 $ \[ p \]_H \( T \) = f \( T^(q_h) \) \, #h(2em) f \( 0 \) = 0 \, #h(2em) f' \( 0 \) in u_h \( E_0 \/ I_h \)^times quad \( h < n \) \, $ <def:pseries>]

where $f$ is considered over $E_0 \/ I_h$ and the coefficient is a unit when $h = n$. Equivalently, the successive leading coefficients of the $p$-series generate the ideals $I_h = \( p \, u_1 \, dots.h \, u_(h - 1) \)$.

We recall why the factorization assertion holds over nonreduced characteristic-$p$ rings as well. For a homomorphism $a : F arrow.r F'$ of formal groups, differentiation of the homomorphism identity gives

$ a' \( T \) thin partial_2 F \( T \, 0 \) = partial_2 F' \( a \( T \) \, 0 \) thin a' \( 0 \) . $

Both displayed partial derivatives are units. Thus $a' \( 0 \) = 0$ implies $a' \( T \) = 0$, and $a \( T \)$ factors through $T^p$. The resulting series is a homomorphism from the Frobenius twist of $F$. Applying this argument successively to the $p$-series proves the factorization in Equation (4.1). It also shows that the condition defining $I_h$ is invariant under change of coordinate. The universal deformation isomorphisms therefore preserve these ideals.

Fix for the rest of this section

$ 1 lt.eq h < n \, #h(2em) r = n - h \, #h(2em) q = p^h \, #h(2em) Q = p^n . $

The height-at-least-$h$ parameter polydisc has coordinates $y = \( u_h \, dots.h \, u_(n - 1) \)$, all of norm less than one; the preceding parameters are zero. Write $H_y$ for the evaluated law and

$ P_y \( T \) = \[ p \]_(H_y) \( T \) = f_y \( T^q \) \, #h(2em) b \( y \) = f'_y \( 0 \) . $

All their coefficients are integral and analytic in the parameters. Choose a point $x$ in this polydisc with $u_h \( x \) eq.not 0$. The formal group $H_x$ over $C$ has height $h$, and $b \( x \) eq.not 0$.

#thm([Lemma 4.1.])[
  #emph[The finite group schemes 
$ cal(G) \[ p^j \] = "Spec" #scale(x: 120%, y: 120%)[\(] R_0 \[ \[ T \] \] \/ \( \[ p^j \]_H \( T \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) j gt.eq 1 \, $

 form an algebraic $p$-divisible group $cal(G)$ of height $n$ over $R_0$. At the point $x$, its connected formal group is $H_x$ and its étale height is $r = n - h$. All the $C$-valued points of every level have coordinate in $frak(m)_C$.]
] <def:algebraization>

#proof[
  The preparation used here follows from a short division argument. Let $\( A \, frak(a) \)$ be a complete Noetherian local ring, let $d gt.eq 1$, and let $f \( T \) = T^d + e \( T \)$ with $e in frak(a) A \[ \[ T \] \]$. Let $tau$ discard terms of degree below $d$ and shift the remaining degrees down by $d$. Then
  $ tau \( q f \) = \( 1 + L \) q \, #h(2em) L \( q \) = tau \( q e \) . $
  The operator $L$ raises $frak(a)$-adic order, so $\( 1 + L \)^(- 1) = sum_(i gt.eq 0) \( - L \)^i$ converges on $A \[ \[ T \] \]$. For any $g$, take $q = \( 1 + L \)^(- 1) tau \( g \)$; the unique remainder $g - q f$ has degree less than $d$. Dividing $T^d$ gives $T^d = q f + r$ with $q equiv 1 med \( mod med frak(a) \)$ and $r in frak(a) A \[ T \]$ of degree less than $d$. Thus $q$ is a unit and $f = q^(- 1) \( T^d - r \)$ is prepared. The same division proves that $A \[ \[ T \] \] \/ \( f \)$ is free over $A$ on $1 \, T \, dots.h \, T^(d - 1)$.
  Let $frak(m) = \( u_1 \, dots.h \, u_(n - 1) \) subset R_0$. Reduction modulo $frak(m)$ sends $\[ p^j \]_H \( T \)$ to $T^(Q^j)$. Weierstrass preparation therefore writes
  #[#set math.equation(numbering: n => "(4.2)")
   $ \[ p^j \]_H \( T \) = U_j \( T \) W_j \( T \) \, $ <def:prepared-level>]
  with $U_j in R_0 \[ \[ T \] \]^times$ and $W_j$ a distinguished monic polynomial of degree $Q^j$. The level algebra is consequently finite free of rank $Q^j$. It is $frak(m)$-adically complete, and its coordinate $T$ is topologically nilpotent. Substitution of the formal group law in the finite level algebras thus defines genuine group-scheme operations.
  Apply preparation once more to $\[ p \]_H \( T \) - V$ over $R_0 \[ \[ V \] \]$. This shows that substitution $V = \[ p \]_H \( T \)$ is finite free of rank $Q$. Reducing by $\[ p^j \]_H \( V \)$ proves that the multiplication maps between consecutive levels are finite faithfully flat of that rank. The kernel and inclusion identities follow from the identities of the $p$-series. These are exactly the $p$-divisible-group conditions.
  After evaluation at $x$, all nonleading coefficients of $W_j$ have norm less than one. At a point of norm at least one its leading term strictly dominates the others, so every root is small. The evaluated $U_j$ is a unit on the open unit disc: its constant coefficient has norm one and its remaining coefficients have norm at most one. The roots of $W_j$ are therefore precisely the small zeros of $\[ p^j \]_(H_x)$, with the same group operations.
  The initial degree of $\[ p^j \]_(H_x)$ is $q^j$, with nonzero coefficient. Completing the finite algebra at the identity thus gives $C \[ \[ T \] \] \/ \( T^(q^j) \)$, with the group law induced by $H_x$. These kernels recover the formal group $H_x$: their defining ideals are cofinal with the powers of $\( T \)$. Its height is $h$, so the étale height of the full height-$n$ group is $n - h$. ◻
]

=== 4.2 A natural specialization map <a-natural-specialization-map>

Recall that $cal(H)_n \( R \) = Gamma_n \( R^(compose compose) \)$ for an affinoid perfectoid $C$-algebra $R$. We use an equivalent complete spectral norm on $R$; it is power-multiplicative. In particular $R^(compose compose)$ is its open unit ball. The estimates below use power-multiplicativity, not multiplicativity on products of distinct elements.

#thm([Proposition 4.2.])[
  (Specialization).  #emph[For each parameter $y$ in the height-at-least-$h$ polydisc, the formula 
#[#set math.equation(numbering: n => "(4.3)")
 $ Theta_y \( z \) = lim_(j arrow.r oo) P_y^(compose j) #scale(x: 120%, y: 120%)[\(] z^(1 \/ Q^j) #scale(x: 120%, y: 120%)[\)] $ <def:theta-limit>]

 defines a continuous natural homomorphism 
$ Theta_y : cal(H)_n \( R \) arrow.r H_y \( R^(compose compose) \) . $

 Here the roots are unique because $R$ is perfect, and $P_y^(compose j)$ denotes composition. The map 
#[#set math.equation(numbering: n => "(4.4)")
 $ Phi_y : z mapsto #scale(x: 120%, y: 120%)[\(] Theta_y \( p^(- m) z \) #scale(x: 120%, y: 120%)[\)]_(m gt.eq 0) $ <def:cover-identification>]

 is a natural isomorphism 
$ cal(H)_n \( R \) arrow.r^(med tilde.op med) "proj lim"_(\[ p \]_(H_y)) H_y \( R^(compose compose) \) \, $

 and $Theta_y$ is its zeroth projection. For each fixed $z in cal(H)_n \( C \)$, the function $y mapsto Theta_y \( z \)$ is analytic on the parameter polydisc.]
] <def:transport>

#proof[
  First fix $y$ and choose $delta < 1$ bounding the norms of its parameters. The coefficients of $H_y - Gamma_n$ and $P_y \( T \) - T^Q$ then have norm at most $delta$. Integral power series are $1$-Lipschitz on the open unit ball. Since $P_y \( T \) = f_y \( T^q \)$, power-multiplicativity gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ parallel P_y^(compose j) \( a \) - P_y^(compose j) \( b \) parallel lt.eq parallel a - b parallel^(q^j) #h(2em) \( a \, b in R^(compose compose) \) . $ <def:contraction>]
  For $m gt.eq 0$ put
  $ c_(j \, m) = P_y^(compose j) #scale(x: 120%, y: 120%)[\(] z^(1 \/ Q^(j + m)) #scale(x: 120%, y: 120%)[\)] . $
  The discrepancy before the last $j$ compositions is bounded by $delta$, so Equation (4.5) gives
  $ parallel c_(j + 1 \, m) - c_(j \, m) parallel lt.eq delta^(q^j) . $
  Thus $c_(j \, m)$ converges, uniformly in $z$, and its limit satisfies
  #[#set math.equation(numbering: n => "(4.6)")
   $ parallel Phi_y \( z \)_m - z^(1 \/ Q^m) parallel lt.eq delta \, #h(2em) parallel Phi_y \( z \)_m parallel lt.eq max { parallel z parallel^(1 \/ Q^m) \, delta } < 1 . $ <def:cover-tail>]
  Shifting the index in the limit proves $P_y \( Phi_y \( z \)_(m + 1) \) = Phi_y \( z \)_m$.
  Here is an explicit inverse. If $\( t_m \)_(m gt.eq 0)$ is a compatible sequence in the inverse limit, define
  $ Psi_y \( \( t_m \) \) = lim_(m arrow.r oo) t_m^(Q^m) . $
  Indeed,
  $ parallel t_(m + 1)^(Q^(m + 1)) - t_m^(Q^m) parallel = parallel \( t_(m + 1)^Q - P_y \( t_(m + 1) \) \)^(Q^m) parallel lt.eq delta^(Q^m) . $
  The limit $z$ therefore exists and obeys
  #[#set math.equation(numbering: n => "(4.7)")
   $ parallel z - t_m^(Q^m) parallel lt.eq delta^(Q^m) \, #h(2em) parallel z parallel lt.eq max { parallel t_0 parallel \, delta } < 1 . $ <def:inverse-tail>]
  No common bound less than one on the norms of all the $t_m$ is needed. Equation (4.6), raised to the $Q^m$-th power, proves $Psi_y Phi_y \( z \) = z$. Conversely, Equation (4.7) at $m + j$ gives
  $ parallel z^(1 \/ Q^(m + j)) - t_(m + j) parallel lt.eq delta . $
  Applying Equation (4.5) and using $P_y^(compose j) \( t_(m + j) \) = t_m$ proves $Phi_y Psi_y \( \( t_m \) \) = \( t_m \)$.
  To verify the group law, the coefficients of $Gamma_n$ lie in $k_n$, so $Q$-th powers and their inverses commute with its addition. For $a = z^(1 \/ Q^(j + m))$ and $b = w^(1 \/ Q^(j + m))$, the two inputs $Gamma_n \( a \, b \)$ and $H_y \( a \, b \)$ differ by at most $delta$. After $j$ compositions their difference is at most $delta^(q^j)$. Since $P_y^(compose j)$ is an $H_y$-homomorphism, passage to the limit gives
  $ Phi_y \( Gamma_n \( z \, w \) \)_m = H_y \( Phi_y \( z \)_m \, Phi_y \( w \)_m \) . $
  This proves additivity, and hence additivity of the inverse as well. The uniform tail estimates and continuity of roots and convergent series prove continuity of the maps. All constructions commute with continuous morphisms of perfectoid $C$-algebras. They therefore give the asserted natural maps, and commute with $bb(Z)_p$-multiplication by continuity from integer multiplication.
  Finally, fix $z in cal(H)_n \( C \)$ and a closed parameter polydisc strictly inside the open polydisc. Choose $delta < 1$ bounding all its parameter norms. Each finite stage of Equation (4.3) belongs to its Tate algebra: the substituted constant has norm less than one and all coefficients of the law are bounded. The same bound $delta^(q^j)$ holds in the parameter Gauss norm. The stages consequently converge in that complete Tate algebra. This proves analyticity. Partial differentiation is continuous on a fixed closed polydisc, with operator norm bounded by the inverse coordinate radius. The convergence therefore also permits first differentiation. ◻
]

#thm([Lemma 4.3.])[
  #emph[At the chosen point $x$, the map $Theta_x$ is surjective on $C$-points, and 
$ T_x = ker #scale(x: 120%, y: 120%)[\(] Theta_x : cal(H)_n \( C \) arrow.r H_x \( frak(m)_C \) #scale(x: 120%, y: 120%)[\)] tilde.equiv bb(Z)_p^r . $

 In particular, a $bb(Z)_p$-basis $z_1 \, dots.h \, z_r$ of $T_x$ is $bb(Q)_p$-linearly independent in $cal(H)_n \( C \)$.]
] <def:tate-kernel>

#proof[
  Under Equation (4.4), the kernel consists of sequences with $t_0 = 0$ and $\[ p \] t_(j + 1) = t_j$. These are precisely the compatible $p^j$-torsion points of $cal(G)_x$. By Lemma 12 every such point is small, and the étale height is $r$. Over the algebraically closed field $C$ the resulting Tate module is $bb(Z)_p^r$.
  For surjectivity, apply Weierstrass preparation to $\[ p \]_H \( T \) - V$ over $R_0 \[ \[ V \] \]$. After setting $y = x$ and $V = w in frak(m)_C$, its distinguished polynomial is monic with all lower coefficients small. Algebraic closedness gives a root, and every root is small. Thus every small point admits division by $p$ within the open unit disc. Repeated choices give a compatible sequence with any prescribed zeroth point, and Proposition 13 proves surjectivity of $Theta_x$. Finally, multiplying a putative rational relation among a $bb(Z)_p$-basis by a sufficiently large power of $p$ proves the last assertion. ◻
]

=== 4.3 The parameter differential <the-parameter-differential>

The values of $Theta_y$ on a basis of $T_x$ will measure parameter motion. To show that their differential detects every direction, we first identify parameter directions with marked first-order deformations of the full $p$-divisible group. This comparison uses the algebraic $p$-divisible group over $R_0$, so it applies even though the map $R_0 arrow.r C$ does not send the parameters to nilpotent elements. For a $p$-divisible group $G$, write $G^or$ for its Cartier dual and $omega_G$ for its module of invariant differentials.

#thm([Proposition 4.4.])[
  #emph[The first-order parameter deformation of $cal(G)$ induces an isomorphism of free $R_0$-modules 
$ sans(K) : R_0^(n - 1) arrow.r^(med tilde.op med) "Hom"_(R_0) \( omega_(cal(G)^or) \, "Lie" cal(G) \) . $

 For every small $C$-valued parameter point $x$, its specialization is the linear isomorphism from parameter directions to marked first-order deformations of $cal(G)_x$, with the constant deformation as origin.]
] <def:ks>

#proof[
  We use the square-zero deformation theorem of #cite(label("Lau08")) Theorem 5.1, in the cotangent-theoretic tradition of Grothendieck and Illusie #cite(label("Illusie85")) Theorem 4.4 and Corollary 4.7, fixing its torsor structure throughout. If $B arrow.r A$ has square-zero kernel $J$ and $p$ is nilpotent, marked lifts of a $p$-divisible group $G \/ A$ form a torsor under
  $ "Hom"_A \( omega_(G^or) \, J ⊗_A "Lie" G \) . $
  The associated Kodaira–Spencer map is characterized by the arbitrary-ring-lift equivariance of #cite(label("Lau08")) Equation (5.1). We use this same construction at the closed point and at every later specialization. The theorem applies in characteristic $p$ at every prime, including $p = 2$.
  Apply this comparison to the two maps into
  $ R_0 \[ epsilon.alt_1 \, dots.h \, epsilon.alt_(n - 1) \] \/ \( epsilon.alt_i epsilon.alt_j : 1 lt.eq i \, j lt.eq n - 1 \) $
  given by $u_i mapsto u_i$ and $u_i mapsto u_i + epsilon.alt_i$. They define the $R_0$-linear map $sans(K)$. The source is the full module of parameter derivations: every series in $R_0$ has a finite expression
  $ a = sum_(0 lt.eq e_i < p) u^e a_e^p \, $
  so ordinary differentials over $bb(F)_p$ are free on $d u_1 \, dots.h \, d u_(n - 1)$. The target is free of the same rank because $"Lie" cal(G)$ has rank one and $omega_(cal(G)^or)$ has rank $n - 1$.
  At the closed point, it is enough to show injectivity of the tangent map from formal-group deformations to $p$-divisible-group deformations: both tangent spaces have dimension $n - 1$, by #cite(label("LT66")) Proposition 2.6 and Theorem 3.1 and the chosen square-zero torsor theorem. Suppose a parameter tangent vector has zero image. Then its $p$-divisible deformation is marked-isomorphic to the constant one, so its finite kernels have compatible marked isomorphisms.
  Those kernels recover the formal-group isomorphism. More explicitly, for a deformation $F$ over a local Artin characteristic-$p$ algebra $B$ with maximal ideal $J$ and $J^a = 0$, one has
  $ \( \[ p^j \]_F \( T \) \) subset.eq \( T^(p^j) \) \, #h(2em) T^(a Q^j) in \( \[ p^j \]_F \( T \) \) . $
  The first inclusion follows by iterated Frobenius factorization. For the second, preparation gives a monic polynomial of degree $Q^j$ whose lower coefficients lie in $J$; in its quotient $T^(Q^j)$ lies in $J$, so its $a$th power vanishes. The kernel ideals are therefore cofinal with the coordinate-adic topology. Taking inverse limits of the compatible finite Hopf-algebra isomorphisms yields a marked formal-group isomorphism. This is the formal reconstruction underlying Tate’s equivalence #cite(label("Tate67")) Section 2.2, Proposition 1 and Lemma 0. Lubin–Tate tangent injectivity forces the original vector to be zero. Thus $sans(K)$ is invertible modulo the maximal ideal of $R_0$. Its determinant is a unit, so it is an isomorphism over $R_0$.
  For a vector $v = \( v_i \) in C^(n - 1)$, the analytic first-order substitution is the actual ring homomorphism
  $ a mapsto a \( x \) + epsilon.alt sum_i v_i partial_i a \( x \) quad upright("from ") R_0 upright(" to ") C \[ epsilon.alt \] \/ epsilon.alt^2 . $
  All evaluations converge because the coordinates of $x$ are small. The arbitrary-map functoriality in the cited deformation theorem identifies its deformation class with the specialization of $sans(K)$. This proves the final assertion. In cotangent notation the specialized map involves $Omega_(R_0 \/ bb(F)_p)^1 ⊗_(R_0) C$, not the intrinsic module $Omega_(C \/ bb(F)_p)^1$, which is zero because $C$ is perfect. ◻
]

#thm([Lemma 4.5.])[
  #emph[Let $A$ be a local Artin $C$-algebra with residue field $C$, and let $F \/ A$ be a marked deformation of a height-$h$ formal group over $C$. If $\[ p \]_F \( T \)$ factors through $T^(p^h)$ over $A$, then $F$ is the constant deformation, with its marking.]
] <def:height-rigidity>

#proof[
  Factorization through $T^(p^h)$ is preserved by a coordinate change: the $p^h$-th power of any series has only exponents divisible by $p^h$. Choose an isomorphism of the special fiber with $Gamma_h$ and apply the marked Lubin–Tate classification over $A$. It gives parameters $a_1 \, dots.h \, a_(h - 1)$ in the maximal ideal of $A$. Successively, modulo preceding parameters the coefficient of $T^(p^i)$ in the $p$-series is $a_i$ times a unit. This is the height-parameter property recalled above; it also follows directly from the leading law term $a_i C_(p^i)$ in #cite(label("LT66")) Proposition 1.1. Here $C_(p^i)$ is the reduction of the integral polynomial $\( \( X + Y \)^(p^i) - X^(p^i) - Y^(p^i) \) \/ p$; its $p$-fold sum has coefficient $p^(p^i - 1) - 1$, a unit modulo $p$. The assumed factorization therefore forces every $a_i$ to vanish. The zero parameter tuple is the constant deformation, and the isomorphism supplied by #cite(label("LT66")) Theorem 3.1 respects the marking. For $h = 1$ there are no parameters and the same conclusion holds. ◻
]

#thm([Proposition 4.6.])[
  (Tate coordinates).  #emph[For a $bb(Z)_p$-basis $z_1 \, dots.h \, z_r$ of $T_x$, the analytic map 
#[#set math.equation(numbering: n => "(4.8)")
 $ theta \( y \) = #scale(x: 120%, y: 120%)[\(] Theta_y \( z_1 \) \, dots.h \, Theta_y \( z_r \) #scale(x: 120%, y: 120%)[\)] $ <def:theta>]

 has invertible differential at $x$ on the height-at-least-$h$ polydisc.]
] <def:coordinates>

#proof[
  Analyticity follows from Proposition 13, and $theta \( x \) = 0$. Let $v$ be a direction in the kernel of its differential. Write $A = C \[ epsilon.alt \] \/ epsilon.alt^2$ and $y'$ for the corresponding first-order parameter point. Its preceding parameters remain zero. By Proposition 15, it suffices to prove that $cal(G)_(y')$ is the constant deformation of $cal(G)_x$ with its residue marking. We will use the vanishing differential to lift the Tate basis as compatible torsion sections, splitting the étale quotient. The fixed-height condition will then trivialize the connected factor.
  #emph[Lifting the Tate basis.] For $j gt.eq 1$ set
  $ t_(i \, j) \( y \) = Theta_y \( p^(- j) z_i \) \, #h(2em) t'_(i \, j) = t_(i \, j) \( y' \) in A \, $
  where evaluation at $y'$ means first-order Taylor evaluation.
  We verify membership in the finite group schemes before passing to a $p$-divisible group. Evaluate Equation (4.2) at the analytic function $t_(i \, j) \( y \)$. Its value at $x$ is small, so on a neighborhood of $x$ this gives an identity of convergent analytic functions
  $ U_(j \, y) \( t_(i \, j) \( y \) \) thin W_(j \, y) \( t_(i \, j) \( y \) \) = Theta_y \( z_i \) . $
  The first factor has nonzero reduced value at $x$. Taylor evaluation in $A$ makes the right side zero, by the choice of $v$, and the first factor remains a unit. Hence $W_(j \, y') \( t'_(i \, j) \) = 0$: the Taylor coordinate is an actual point of $cal(G)_(y') \[ p^j \]$. The analytic multiplication identities also give
  $ \[ p \] t'_(i \, j + 1) = t'_(i \, j) \, #h(2em) \[ p^j \] t'_(i \, j) = 0 . $
  These identities agree with the algebraic finite-level operations. For any finite collection of Taylor points $a + epsilon.alt b$, equip $A$ with the complete submultiplicative norm
  $ parallel a + epsilon.alt b parallel_s = max { \| a \| \, s \| b \| } \, $
  choosing $s > 0$ so that the points and parameter values are small. The universal congruences defining the polynomial finite-level operations then converge; their terms divisible by the appropriate source-level polynomials vanish, so their evaluations agree with the Taylor-evaluated formal operations.
  Each finite identity is evaluated on a neighborhood where its finitely many series converge. Those neighborhoods may depend on $j$; all their Taylor values lie in the same algebraic ring $A$. In particular no bound on the derivatives uniform in $j$ is required.
  Sending a basis vector of $\( bb(Z) \/ p^j \)^r$ to $t'_(i \, j)$ gives a homomorphism of finite group schemes. These maps respect multiplication by $p$ and also the level inclusions: the source inclusion sends the basis vector at level $j$ to $p$ times that at level $j + 1$, exactly as in the displayed identity. Over the strictly henselian local Artin ring $A$, the connected–étale sequence exists and its étale quotient is the unique constant lift of the residue quotient. The constructed maps induce an isomorphism onto that quotient at each level, since they do so over $C$. They therefore split it and give
  $ cal(G)_(y') tilde.equiv cal(G)_(y')^0 times \( bb(Q)_p \/ bb(Z)_p \)^r . $
  #emph[Trivializing the connected factor.] At level $j$, first base-change the finite algebra, obtaining $B_j = A \[ T \] \/ \( W_(j \, y') \( T \) \)$. The idempotents of its residue algebra lift uniquely across $epsilon.alt$, and select the identity factor $B_j^0$. This factor is a finite local Artin algebra, so it equals its completion at $\( epsilon.alt \, T \)$. Equation (4.2) identifies that completion with
  $ B_j^0 tilde.equiv A \[ \[ T \] \] \/ \( \[ p^j \]_(H_(y')) \( T \) \) . $
  Indeed the preparation identity holds coefficientwise over $A$, and all residue factors supported away from $T = 0$ become units in this completion. The group law is $H_(y')$, by Taylor evaluation of the same preparation and group-law identities. Since the preceding parameters are zero and $b \( x \) eq.not 0$, the series $\[ p^j \]_(H_(y'))$ is $T^(q^j)$ times a unit. Thus the displayed algebra is also $A \[ \[ T \] \] \/ \( T^(q^j) \)$. This describes the connected factor by taking the identity factor after algebraic base change.
  Its formal group $H_(y')$ satisfies the hypothesis of Lemma 16, so it is the constant deformation of $H_x$ with the residue marking fixed. That formal isomorphism restricts to all its finite kernels: the coordinates there are nilpotent, so every formal series evaluates by a finite sum. The connected $p$-divisible factor is consequently constant with its marking.
  #emph[Recovering the marked deformation.] The splitting of the étale factor also has the required marking. Over algebraically closed $C$, each connected finite group scheme has only its identity as a $C$-point. A map from a constant finite group scheme is determined by the images of its $C$-points. The actual torsion points given by the chosen Tate basis therefore select the unique section of the étale quotient on the special fiber. The constructed splitting reduces to this section. Combining it with the marked connected trivialization gives the constant deformation of the entire $cal(G)_x$, with the original marking.
  Proposition 15 now implies $v = 0$. Both the parameter tangent space and the target of $D theta_x$ have dimension $r = n - h$, so this differential is invertible. ◻
]

=== 4.4 An integral comparison with the height-$h$ Honda group <an-integral-comparison-with-the-height-h-honda-group>

The next elementary recursion controls every coefficient of the forward comparison. Its necessary-and-sufficient form will also be used to choose comparisons at individual orbit points.

#thm([Lemma 4.7.])[
  #emph[Let $B$ be a characteristic-$p$ algebra, let $f \( Z \) = b Z + c_2 Z^2 + dots.h.c in B \[ \[ Z \] \]$, and put $q = p^h$. For $alpha \( T \) = sum_(j gt.eq 1) a_j T^j$, the identity 
$ alpha \( f \( T^q \) \) = alpha \( T \)^q $

 holds if and only if, for every $j gt.eq 1$, 
#[#set math.equation(numbering: n => "(4.9)")
 $ a_j^q - b^j a_j = sum_(i < j) a_i \[ Z^j \] f \( Z \)^i . $ <def:coefficient-recursion>]

 If $B = C$, all coefficients of $f$ are integral, and the coefficients $a_j$ satisfy these equations, then all $a_j$ are integral. In particular, after prescribing any finite initial segment satisfying the equations, every recursive extension by roots in $C$ has integral coefficients.]
] <def:recursion>

#proof[
  Both sides of the identity contain only powers of $T$ divisible by $q$. Their coefficients at $T^(q j)$ give exactly Equation (4.9), since the contribution of $a_j$ on the left is $b^j a_j$. There are no other coefficient equations.
  For the integrality assertion, argue inductively on $j$. The right side of Equation (4.9) is integral if the preceding coefficients are integral. A root with $\| a_j \| > 1$ would make $\| a_j \|^q$ strictly larger than both $\| b^j a_j \|$ and the norm of the right side, which is impossible. This includes $j = 1$, whose right side is zero. The polynomial is monic, so roots exist in the algebraically closed field $C$, and the same argument bounds every possible choice. ◻
]

#thm([Proposition 4.8.])[
  #emph[Choose a formal group isomorphism $alpha_x : H_x arrow.r^tilde.op Gamma_h$ over $C$. Its forward coefficients are integral, and composition gives a nonzero natural $bb(Q)_p$-linear morphism of sheaves on perfectoid spaces over $C$, 
#[#set math.equation(numbering: n => "(4.10)")
 $ nu_x : cal(H)_n arrow.r cal(H)_h \, #h(2em) nu_x \( z \) = alpha_x \( Theta_x \( z \) \) . $ <def:nu>]

]
] <def:natural-comparison>

#proof[
  The formal isomorphism exists by the height classification over the algebraically closed field $C$. It intertwines $\[ p \]_(H_x) \( T \) = f_x \( T^q \)$ with $\[ p \]_(Gamma_h) \( T \) = T^q$. Lemma 18 therefore shows that every coefficient of $alpha_x$ lies in $cal(O)_C$.
  An integral series with zero constant term converges on $R^(compose compose)$ for every affinoid perfectoid $C$-algebra $R$, with value again in $R^(compose compose)$. Its formal homomorphism identity converges on those arguments as well. Combined with Proposition 13, this proves additivity and naturality of $nu_x$ on all such affinoids, hence as a sheaf morphism. Continuity extends integer linearity to $bb(Z)_p$-linearity. Multiplication by $p$ is invertible on both Honda sheaves, so the morphism is $bb(Q)_p$-linear. If scalars are expressed as the sheaf of continuous $bb(Q)_p$-valued functions, the same equality follows at geometric valued-field points by naturality; these detect equality of coordinates in a uniform affinoid algebra. Equivalently, Theorem 10 permits working throughout with additive sheaf morphisms.
  Write $a_1 = alpha'_x \( 0 \) eq.not 0$ and choose $t in C$ with $0 < \| t \| < \| a_1 \|$. For $j gt.eq 2$ the integral coefficients satisfy
  $ \| a_j t^j \| lt.eq \| t \|^2 < \| a_1 t \| \, $
  so $alpha_x \( t \) eq.not 0$. Lemma 14 supplies $z in cal(H)_n \( C \)$ with $Theta_x \( z \) = t$. Thus $nu_x \( z \) eq.not 0$, proving nonzeroness of the sheaf morphism. Only the forward series has been evaluated on the whole open unit disc; no convergence assertion about its inverse is needed. ◻
]

=== 4.5 Compatibility with the stabilizer action <compatibility-with-the-stabilizer-action>

The coordinate construction is complete. We now describe how the specialization map and its Tate lattice change under the stabilizer.

The following finite-level statement concerns the full universal ring for every $n gt.eq 1$, independently of the chosen height stratum.

#thm([Lemma 4.9.])[
  (Continuity of the stabilizer action).  #emph[Put $frak(m)_E = \( p \, u_1 \, dots.h \, u_(n - 1) \) subset E_0$. For $M gt.eq 1$ and $N gt.eq M$, every element of $1 + p^N A_n$ acts trivially on $E_0 \/ frak(m)_E^M$. Consequently the stabilizer action on $E_0$, and on its characteristic-$p$ quotient, is adically continuous.]
] <def:continuous-action>

#proof[
  Let $B = E_0 \/ frak(m)_E^M$, let $J$ be its maximal ideal, and write $F$ for the universal formal group over $B$. For $d in A_n$, lift its coefficients in $k_n$ to $B$, obtaining a series $tilde(d) \( T \)$ with zero constant term. Its homomorphism defect
  $ delta \( X \, Y \) = tilde(d) \( F \( X \, Y \) \) -_F F \( tilde(d) \( X \) \, tilde(d) \( Y \) \) $
  has all coefficients in $J$, because $d$ is a homomorphism on the special fiber. For every $a gt.eq 1$, substitution in $\[ p \]_F \( Z \) = p Z + sum_(j gt.eq 2) c_j Z^j$ sends a series with coefficients in $J^a$ and zero constant term to one with coefficients in $J^(a + 1)$. This uses $p in J$ and $2 a gt.eq a + 1$. Thus $\[ p \]_F^N \( delta \) = 0$ for $N gt.eq M$.
  Since $\[ p \]_F^N$ is itself a homomorphism, this identity says exactly that $f_N = \[ p \]_F^N compose tilde(d)$ is an endomorphism of $F$. Its special fiber is $p^N d$, and $"id"_F -_F f_N$ has linear coefficient $1 - p^N tilde(d)' \( 0 \)$, a unit of $B$. It is therefore an automorphism lifting $1 - p^N d$. The marked Lubin–Tate classification now identifies the deformation with its translate by $1 - p^N d$, so that this element fixes the parameter map $E_0 arrow.r B$. The assertion is uniform in $d$; replacing $d$ by $- d$ gives the stated congruence subgroup. These subgroups form a neighborhood basis of the identity in $A_n^times$, proving continuity. ◻
]

We use the stabilizer action convention in which $g in A_n^times$ carries $x$ to a point $y_g$ together with an integral isomorphism

$ iota_g : H_x arrow.r^(med tilde.op med) H_(y_g) $

whose closed-point reduction is $g$. These are the universal deformation isomorphisms #cite(label("LT66")) Section 3.4. The orbit remains in the height-at-least-$h$ polydisc. Moreover, $y_g arrow.r x$ as $g arrow.r 1$ by Lemma 20: a series in the $M$-th power of the characteristic-$p$ parameter ideal evaluates with norm at most $parallel x parallel^M$. On the characteristic-zero generic fiber the same argument uses $rho^M$, where $rho = max { \| p \| \, parallel x parallel } < 1$.

#thm([Lemma 4.10.])[
  #emph[For $g in A_n^times$ and $z in cal(H)_n \( C \)$ one has 
#[#set math.equation(numbering: n => "(4.11)")
 $ Theta_(y_g) \( g z \) = iota_g \( Theta_x \( z \) \) . $ <def:orbit-transport>]

 Consequently $g T_x = T_(y_g)$.]
] <def:stabilizer>

#proof[
  The coefficients of $g$ lie in $k_n$, so $g \( z^(1 \/ Q^j) \) = \( g z \)^(1 \/ Q^j)$. Choose $delta < 1$ bounding the evaluated parameter ideals. The coefficients of $iota_g - g$ are then bounded by $delta$. On small arguments the two series differ by at most that amount. By Equation (4.5), their images after $j$ compositions with $P_(y_g)$ differ by at most $delta^(q^j)$. Using $P_(y_g)^(compose j) iota_g = iota_g P_x^(compose j)$ and passing to the limit proves Equation (4.11). It gives $g T_x subset.eq T_(y_g)$; the inverse isomorphism gives equality. ◻
]

Choose a $bb(Z)_p$-basis $z_1 \, dots.h \, z_r$ of $T_x$ as in Lemma 14. Since $r = n - h < n$, Proposition 11 applies to this basis and $nu_x$: the subgroup

$ { \( nu_x \( d z_1 \) \, dots.h \, nu_x \( d z_r \) \) : d in A_n #scale(x: 120%, y: 120%)[}] subset Gamma_h^r \( frak(m)_C \) $

satisfies no nonzero formal power-series equation over $k$. The invertible differential of Proposition 17 and the transport identity of Lemma 21 provide the other inputs for the orbit argument in Section 5.

== 5 Positive-characteristic orbit density <sec:orbits>

We prove that on each positive-characteristic height stratum, a stabilizer orbit satisfies no nonzero analytic equation near its base point.

#thm([Theorem 5.1.])[
  (Local orbit density).  #emph[Fix $1 lt.eq h < n$ and a $C$-valued point $x$ of the parameter polydisc $I_h = 0$ with $u_h \( x \) eq.not 0$. For $g in A_n^times$, write $y_g$ for its orbit point, with the transport convention of Lemma 21. Let $G$ be any open subgroup of $A_n^times$. If an analytic germ $P$ at $x$ on the parameter polydisc defined by $I_h = 0$ vanishes at all points of the orbit ${ y_g : g in G }$ sufficiently close to $x$, then $P = 0$.]
  #emph[It suffices to assume that, for every $d in A_n$, $P \( y_(1 - p^N d) \) = 0$ for all sufficiently large $N$.]
] <orb:density>

The proof will compose the Tate coordinates of Section 4 with comparison series whose coefficients are analytic germs in the parameters. These coefficients need not share one domain of convergence. Instead, at individual orbit points we will choose convergent series with integral coefficients that match each fixed finite initial segment eventually. The following lemma shows that this matching suffices to turn formal Taylor identities into numerical estimates.

#thm([Lemma 5.2.])[
  (Finite analytic jets).  #emph[Let $F$ be a complete nonarchimedean valued field, let $r gt.eq 1$, and use the maximum norm on $F^r$. Let $theta = \( theta_i \)_(i = 1)^r$ be an analytic germ at $0 in F^r$ with $theta \( 0 \) = 0$, and let $a_j$, for $j gt.eq 1$, be scalar analytic germs at $0$. Define formal series 
$ U_i \( X \) = sum_(j gt.eq 1) a_j \( X \) theta_i \( X \)^j quad upright("in ") F \[ \[ X_1 \, dots.h \, X_r \] \] \, $

 using the Taylor expansions of the germs. Suppose that the linear part $L = d U_0$ is invertible.]
  #emph[Let $delta_N arrow.r 0$ in $F^r$, and suppose that coefficients $a_(N \, j) in cal(O)_F$ have been chosen for every $N$ and $j gt.eq 1$ so that, for every $M gt.eq 1$, all sufficiently large $N$ satisfy 
$ a_(N \, j) = a_j \( delta_N \) #h(2em) \( 1 lt.eq j lt.eq M \) . $

 This includes the requirement that the finitely many germs in this formula are defined at $delta_N$. For sufficiently large $N$, put 
$ U_(N \, i) = sum_(j gt.eq 1) a_(N \, j) theta_i \( delta_N \)^j . $

 These numerical series converge. If $P$ is an analytic germ with $P \( delta_N \) = 0$ eventually, write its unique formal expansion as 
$ P \( X \) = sum_(ell in bb(N)^r) B_ell U \( X \)^ell . $

 Then there is a constant $D > 0$ such that $parallel delta_N parallel lt.eq D parallel U_N parallel$ for all sufficiently large $N$. Moreover, for every $m gt.eq 0$ there is $D_m > 0$ such that 
#[#set math.equation(numbering: n => "(5.1)")
 $ lr(|sum_(\| ell \| lt.eq m) B_ell U_N^ell|) lt.eq D_m parallel U_N parallel^(m + 1) $ <orb:finite-jet-estimate>]

 for all sufficiently large $N$. The threshold and $D_m$ may depend on $m$. No convergence of the full formal series $U$ or $sum_ell B_ell Z^ell$ is required.]
] <orb:finite-jets>

#proof[
  The formal definition of $U$ is valid because $theta_i in \( X_1 \, dots.h \, X_r \)$, so only finitely many summands contribute to each total degree. Formal inversion applies because $L$ is invertible, and gives the asserted unique expansion of $P$.
  For fixed $m gt.eq 1$, the finite sum
  $ F_(m \, i) \( X \) = sum_(j = 1)^m a_j \( X \) theta_i \( X \)^j $
  is an actual analytic germ. Its Taylor polynomial through total degree $m$ is $J_m U_i$, the corresponding truncation of $U_i$. Analyticity and $theta \( 0 \) = 0$ give $parallel theta \( delta \) parallel lt.eq c parallel delta parallel$ near $0$. For sufficiently large $N$, coefficient matching and integrality give
  $ parallel U_N - F_m \( delta_N \) parallel lt.eq parallel theta \( delta_N \) parallel^(m + 1) lt.eq c^(m + 1) parallel delta_N parallel^(m + 1) . $
  Here $parallel theta \( delta_N \) parallel < 1$, which also proves convergence of the numerical series defining $U_N$. The Taylor estimate for the finitely many analytic functions $F_(m \, i)$ therefore yields
  #[#set math.equation(numbering: n => "(5.2)")
   $ U_N = J_m U \( delta_N \) + R_(m \, N) \, #h(2em) parallel R_(m \, N) parallel lt.eq c_m parallel delta_N parallel^(m + 1) . $ <orb:jet-approximation>]
  Explicitly, an analytic series $H = sum_(\| beta \| gt.eq m + 1) h_beta X^beta$ converging on a closed polydisc of radius $rho$ satisfies $\| H \( delta \) \| lt.eq M rho^(- \( m + 1 \)) parallel delta parallel^(m + 1)$ for $parallel delta parallel lt.eq rho$, where $M = sup_beta \| h_beta \| rho^(\| beta \|) < oo$.
  For $m = 1$, write $U_N = L delta_N + R_(1 \, N)$. If $delta_N eq.not 0$ and $N$ is sufficiently large, then
  $ parallel R_(1 \, N) parallel < parallel L^(- 1) parallel^(- 1) parallel delta_N parallel lt.eq parallel L delta_N parallel . $
  The ultrametric inequality gives $parallel U_N parallel = parallel L delta_N parallel$, and hence $parallel delta_N parallel lt.eq parallel L^(- 1) parallel parallel U_N parallel$. For $delta_N = 0$ the same bound holds directly. For sufficiently large $N$, $U_N = 0$ therefore implies $delta_N = 0$.
  Put $Q_m \( Z \) = sum_(\| ell \| lt.eq m) B_ell Z^ell$ and $V_m = J_m U$. The analytic germ $P - Q_m \( V_m \)$ has zero Taylor coefficients through degree $m$: this follows from the formal identity for $P$ and $V_m equiv U med \( mod med \( X \)^(m + 1) \)$. Consequently,
  $ \| P \( delta_N \) - Q_m \( V_m \( delta_N \) \) \| lt.eq c'_m parallel delta_N parallel^(m + 1) . $
  Both $U_N$ and $V_m \( delta_N \)$ tend to zero. On the unit polydisc the finite polynomial $Q_m$ is Lipschitz: telescoping each monomial gives the constant $max \( 1 \, max_(1 lt.eq \| ell \| lt.eq m) \| B_ell \| \)$. Equation (5.2), the preceding bound, and $P \( delta_N \) = 0$ now imply
  $ \| Q_m \( U_N \) \| lt.eq c''_m parallel delta_N parallel^(m + 1) . $
  The inverse norm estimate proves Equation (5.1) for $m gt.eq 1$. For $m = 0$, continuity gives $B_0 = P \( 0 \) = 0$, so the estimate also holds. Every use of the formal identity in this argument has taken place after a finite truncation. ◻
]

#proof[
  Put $r = n - h$ and $q = p^h$. Choose a $bb(Z)_p$-basis $z_1 \, dots.h \, z_r$ of $T_x$ as in Lemma 14. Proposition 17 says that
  $ theta \( y \) = #scale(x: 120%, y: 120%)[\(] Theta_y \( z_i \) #scale(x: 120%, y: 120%)[\)]_(i = 1)^r \, #h(2em) theta \( x \) = 0 \, $
  is analytic with invertible differential at $x$. Fix the formal group isomorphism
  $ alpha_x : H_x arrow.r^tilde.op Gamma_h \, #h(2em) alpha_x \( T \) = sum_(j gt.eq 1) a_j^x T^j \, $
  of Proposition 19. Its forward coefficients belong to $cal(O)_C$, its linear coefficient is nonzero, and $nu_x = alpha_x Theta_x$ is a nonzero natural map $cal(H)_n arrow.r cal(H)_h$.
  #emph[Formal coordinates.] Write $\[ p \]_(H_y) \( T \) = f_y \( T^q \)$ and $b \( y \) = f'_y \( 0 \)$, so that $b \( x \) eq.not 0$. By Lemma 18, a series $alpha \( T \) = sum_(j gt.eq 1) A_j T^j$ intertwines this multiplication by $p$ with $q$th powers exactly when
  #[#set math.equation(numbering: n => "(5.3)")
   $ A_j^q - b \( y \)^j A_j = sum_(i < j) A_i \[ Z^j \] f_y \( Z \)^i #h(2em) \( j gt.eq 1 \) . $ <orb:coefficient-germs>]
  Inductively choose an analytic germ $a_j \( y \)$ satisfying this equation and $a_j \( x \) = a_j^x$. The derivative in the new variable is $- b \( x \)^j eq.not 0$, so the analytic implicit function theorem applies. One can see the analytic branch directly: with the earlier coefficients fixed and $A_j = a_j^x + t$, the equation becomes
  $ t = b \( y \)^(- j) #scale(x: 120%, y: 120%)[\(] t^q + e \( y \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) e \( x \) = 0 . $
  On a sufficiently small closed parameter polydisc, choose $eta > 0$ with $parallel b^(- j) parallel eta^(q - 1) < 1$ and $parallel b^(- j) e parallel lt.eq eta$. The right side is a strict contraction on the ball of analytic functions of norm at most $eta$; its fixed point has value zero at $x$. This proves the required germ at every finite stage.
  Set $delta = y - x$, where this subtraction is ordinary parameter subtraction. Define
  $ U_i \( delta \) = sum_(j gt.eq 1) a_j \( x + delta \) Theta_(x + delta) \( z_i \)^j quad upright("in ") C \[ \[ delta_1 \, dots.h \, delta_r \] \] . $
  Each coefficient of $delta$ uses only finitely many $a_j$. The linear matrix is $a_1^x d theta_x$, which is invertible. Thus, if $P$ were nonzero, there would be a fixed family $\( B_ell \)_(ell in bb(N)^r)$ in $C$, not all zero, such that
  $ P \( x + delta \) = sum_ell B_ell U \( delta \)^ell quad upright("formally") . $
  The germs $a_j$, the formal coordinates $U$, and the coefficients $B_ell$ are now fixed. No common analytic domain for all $a_j$ has been chosen.
  #emph[Matching actual coefficients on an orbit.] Fix $d in A_n$. For all sufficiently large $N$, the element $g_N = 1 - p^N d$ is a unit in $G$, and its orbit point $y_N = y_(g_N)$ tends to $x$ by the continuity discussed before Lemma 21. The subtraction in $g_N$ is in the endomorphism ring. Transport sends $g_N z_i$ into $T_(y_N)$; applying the group homomorphism $Theta_(y_N)$ therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ Theta_(y_N) \( z_i \) = \[ p \]_(H_(y_N))^N #scale(x: 120%, y: 120%)[\(] Theta_(y_N) \( d z_i \) #scale(x: 120%, y: 120%)[\)] . $ <orb:transport-powers>]
  This identity is obtained using formal-group addition.
  We next choose a numerical series at each $y_N$. For every $M gt.eq 1$ choose an integer $N_M gt.eq M$, strictly increasing with $M$, so that for every $N gt.eq N_M$ the following conditions hold: the first $M$ germs $a_j$ are defined at $y_N$, their instances of Equation (5.3) hold there, and $b \( y_N \)$ and $a_1 \( y_N \)$ are nonzero. Such thresholds exist because $y_N arrow.r x$. For $N gt.eq N_1$ put
  $ K \( N \) = max { M lt.eq N : N_M lt.eq N } . $
  Then $K \( N \) arrow.r oo$. Prescribe $a_(N \, j) = a_j \( y_N \)$ for $1 lt.eq j lt.eq K \( N \)$, and extend the sequence inductively by choosing roots in $C$ of Equation (5.3) at $y_N$. Lemma 18 shows that every chosen coefficient, including the prescribed ones, belongs to $cal(O)_C$. The resulting actual series
  $ alpha_N \( T \) = sum_(j gt.eq 1) a_(N \, j) T^j $
  converges on $frak(m)_C$ and satisfies the full identity
  $ alpha_N #scale(x: 120%, y: 120%)[\(] \[ p \]_(H_(y_N)) \( T \) #scale(x: 120%, y: 120%)[\)] = alpha_N \( T \)^q . $
  This intertwining identity is the only property of $alpha_N$ needed below. In particular, for every fixed $j$ its coefficient satisfies $a_(N \, j) = a_j \( y_N \)$ eventually and hence $a_(N \, j) arrow.r a_j^x$.
  Define convergent numerical quantities
  $ U_(N \, i) = alpha_N #scale(x: 120%, y: 120%)[\(] Theta_(y_N) \( z_i \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) s_(N \, i) = alpha_N #scale(x: 120%, y: 120%)[\(] Theta_(y_N) \( d z_i \) #scale(x: 120%, y: 120%)[\)] . $
  Iterating the intertwining identity in Equation (5.4) gives the exact coordinate identity
  #[#set math.equation(numbering: n => "(5.5)")
   $ U_N = s_N^(q^N) . $ <orb:rooted-coordinates>]
  All evaluations are on topologically nilpotent elements; the integral series involved preserve this domain.
  Continuity in the parameter gives $Theta_(y_N) \( d z_i \) arrow.r Theta_x \( d z_i \)$. Choose $c < 1$ bounding the norms of these finitely many arguments for all sufficiently large $N$ and of their limits. Integrality bounds the tails of $alpha_N$ past degree $J$ by $c^(J + 1)$, uniformly in $N$; the same bound holds for $alpha_x$. The first $J$ coefficients converge term by term. Letting first $N arrow.r oo$ and then $J arrow.r oo$ proves
  #[#set math.equation(numbering: n => "(5.6)")
   $ s_N arrow.r s \( d \) := #scale(x: 120%, y: 120%)[\(] nu_x \( d z_i \) #scale(x: 120%, y: 120%)[\)]_(i = 1)^r quad upright("in ") frak(m)_C^r . $ <orb:limit-tuple>]
  This argument also covers a zero coordinate, or a zero limiting tuple.
  #emph[Frobenius roots and one formal equation.] Apply Lemma 23 with $delta_N = y_N - x$, the germs $a_j \( x + delta \)$, and the actual coefficients $a_(N \, j)$. The vanishing hypothesis gives $P \( y_N \) = 0$ eventually. Thus, for every fixed $m gt.eq 0$,
  $ lr(|sum_(\| ell \| lt.eq m) B_ell U_N^ell|) lt.eq D_m parallel U_N parallel^(m + 1) $
  eventually. The constant and threshold may depend on the fixed $d$ as well as on $m$. Since $C$ is perfect of characteristic $p$, Equation (5.5) permits taking the unique $q^N$th root of this finite sum, giving
  $ lr(|sum_(\| ell \| lt.eq m) B_ell^(1 \/ q^N) s_N^ell|) lt.eq D_m^(1 \/ q^N) parallel s_N parallel^(m + 1) . $
  For this fixed $m$, the finitely many numbers $B_ell^(1 \/ q^N)$ are uniformly bounded. By Equation (5.6), replacing $s_N$ by $s \( d \)$ in the finite sum changes its value by a quantity tending to zero. As $D_m^(1 \/ q^N) arrow.r 1$, the ultrametric inequality gives the full-sequence estimate
  #[#set math.equation(numbering: n => "(5.7)")
   $ limsup_(N arrow.r oo) lr(|sum_(\| ell \| lt.eq m) B_ell^(1 \/ q^N) s \( d \)^ell|) lt.eq parallel s \( d \) parallel^(m + 1) . $ <orb:rooted-limit>]
  When $s \( d \) = 0$, the right side of the preceding numerical bound and the replacement error both tend to zero, so the same conclusion holds.
  For each $d in A_n$, Equation (5.7) holds for every $m gt.eq 0$. Lemma 3 therefore gives
  $ sum_ell lambda \( B_ell \) s \( d \)^ell = 0 $
  for every $k$-linear functional $lambda : C arrow.r k$ and every $d in A_n$. Choose one such functional nonzero on a fixed nonzero coefficient $B_(ell_0)$. Since the family $B_ell$ was fixed before $d$, this produces a single nonzero formal series over $k$ vanishing on the whole set
  $ {#scale(x: 120%, y: 120%)[\(] nu_x \( d z_i \) #scale(x: 120%, y: 120%)[\)]_(i = 1)^r : d in A_n} . $
  The $z_i$ are $bb(Q)_p$-linearly independent, $r = n - h < n$, and $nu_x$ is a nonzero natural map. Proposition 11 excludes precisely this formal equation. The contradiction proves the theorem. ◻
]

== 6 Invariant ideals and the spectral classification <sec:classification>

We now pass from the orbit theorem to ideals of the complete deformation ring. Two elementary facts make this passage precise: an auxiliary formal curve supplies a point of the required height, and translation preserves a nonzero equation as an ambient analytic germ. The characteristic-zero argument uses the Gross–Hopkins period map. We then apply the unrestricted support comparison of Barthel–Heard–Naumann.

=== 6.1 Points on formal subschemes <points-on-formal-subschemes>

#thm([Lemma 6.1.])[
  (An auxiliary formal curve).  #emph[Let $R$ be a complete Noetherian local domain with residue field $k_n$.]
  + #emph[Suppose $R$ is a local $k_n$-algebra and $0 eq.not a in frak(m)_R$. For every $c in frak(m)_C \\ { 0 }$, there is a continuous $k_n$-algebra homomorphism 
$ R arrow.r cal(O)_C $

 sending $a$ to $c$ and $frak(m)_R$ into $frak(m)_C$.]
  + #emph[Suppose $R$ is a local $W \( k_n \)$-algebra and $p eq.not 0$ in $R$. Fix the usual embedding $W \( k_n \) arrow.r.hook cal(O)_(bb(C)_p)$. There is a continuous $W \( k_n \)$-algebra homomorphism 
$ R arrow.r cal(O)_(bb(C)_p) $

 sending $frak(m)_R$ into $frak(m)_(bb(C)_p)$.]
  #emph[Neither homomorphism is asserted to be injective.]
] <fin:curve>

#proof[
  We first construct a one-dimensional domain quotient on which a specified nonzero nonunit $a$ survives. We use the Noetherian local dimension and parameter theorems in #cite(label("Stacks")) Tags 00KQ and 00KD. Put $d = dim R$, and extend $a$ to a system of parameters $a \, b_2 \, dots.h \, b_d$. Let $J = \( b_2 \, dots.h \, b_d \)$. Some minimal prime $frak(q)$ over $J$ avoids $a$. Indeed, otherwise $a in sqrt(J)$, and the parameter property would give $sqrt(J) = frak(m)_R$, contradicting the height bound for an ideal generated by $d - 1$ elements.
  The ring $D = R \/ frak(q)$ is a complete local domain in which $a$ is a nonzero nonunit and $sqrt(a D) = frak(m)_D$. The principal ideal theorem gives $dim D lt.eq 1$, and the existence of that nonzero nonunit gives equality. The $a$-adic and maximal-ideal topologies on $D$ coincide. This construction includes $d = 1$, when $J = 0$ and we may take $frak(q) = 0$.
  In the first case, substitution defines an injective map $k_n \[ \[ t \] \] arrow.r D$, $t mapsto a$. To check injectivity, write a nonzero series as $t^m v \( t \)$, where $v \( 0 \) eq.not 0$: its image is a nonzero power of $a$ times a unit. Moreover, $D \/ a D$ is finite-dimensional over $k_n$, so completeness makes $D$ a finite $k_n \[ \[ a \] \]$-module. Explicitly, lift a $k_n$-basis of $D \/ a D$; successively subtract linear combinations of these lifts modulo $a \, a^2 \, dots.h$. The coefficient series converge in $k_n \[ \[ a \] \]$ and express every element of $D$ in their finite span.
  For the prescribed $c$, evaluation embeds $k_n \[ \[ t \] \]$ in $cal(O)_C$: the first nonzero term of a series is uniquely dominant when $0 < \| c \| < 1$. Its fraction field is a complete discretely valued subfield of $C$, with uniformizer $c$. The finite extension $"Frac" \( D \) \/ k_n \( \( a \) \)$ embeds into the algebraically closed field $C$ over this embedding of the base. Every element of $D$ is integral over $k_n \[ \[ a \] \]$, so its image has norm at most one. For $z in frak(m)_D$, some power $z^N$ belongs to $a D$, whence
  $ \| z \|^N lt.eq \| c \| < 1 . $
  Thus the composite $R arrow.r D arrow.r cal(O)_C$ has all the required properties.
  For the second case apply the same construction with $a = p$. The resulting $D$ is finite over $W \( k_n \)$, by the identical successive approximation argument. The structural map from this DVR is injective because $p eq.not 0$ in the domain $D$. Embed the finite extension $"Frac" \( D \) \/ "Frac" \( W \( k_n \) \)$ into $bb(C)_p$ over the fixed base embedding. Integrality again gives boundedness, and $sqrt(p D) = frak(m)_D$ gives strict smallness of $frak(m)_D$.
  Finally, continuity follows in both cases from finite generation of $frak(m)_R$: its generators have images of norm at most some $rho < 1$, so $frak(m)_R^N$ maps to elements of norm at most $rho^N$. ◻
]

The point supplied by Lemma 24 need not retain any given nonzero equation after restriction to the auxiliary curve. What matters is that the equation retains a nonzero germ in the #emph[ambient] polydisc.

#thm([Lemma 6.2.])[
  (Bounded translation).  #emph[Let $L$ be a complete nontrivially valued nonarchimedean field, let $r gt.eq 0$, and let 
$ cal(B)_r \( L \) = {sum_(I in bb(N)^r) a_I T^I : sup_I \| a_I \| < oo} . $

 Equip this algebra with the coefficient norm $parallel f parallel = sup_I \| a_I \|$. For $x in L^r$ with $parallel x parallel < 1$, substitution $T mapsto x + T$ defines an isometric $L$-algebra automorphism $tau_x$ of $cal(B)_r \( L \)$, with inverse $tau_(- x)$. In particular, a nonzero bounded-coefficient series has a nonzero analytic germ at every such $x$.]
] <fin:translation>

#proof[
  The cases $r = 0$ or $x = 0$ are immediate. Otherwise put $rho = parallel x parallel$, so $0 < rho < 1$, and $M = sup_I \| a_I \|$. The coefficient of $T^J$ in the translated series is
  $ \( tau_x f \)_J = sum_(I gt.eq J) binom(I, J) a_I x^(I - J) . $
  Here inequalities between multi-indices are coordinatewise. Each term has norm at most $M rho^(\| I \| - \| J \|)$, so the sum converges and the new coefficients are bounded by $M$.
  For completeness, all reorderings needed for substitution can be checked coefficientwise. The coefficient of $T^K$ in $tau_(- x) tau_x f$ is a sum over $I gt.eq J gt.eq K$. Its individual terms have norm at most $M rho^(\| I \| - \| K \|)$, and only finitely many pairs occur below any fixed total degree. The family is therefore summable independently of order. Regrouping gives
  $ sum_(I gt.eq K) a_I x^(I - K) binom(I, K) sum_(K lt.eq J lt.eq I) \( - 1 \)^(\| J - K \|) binom(I - K, J - K) = a_K . $
  The inner sum is zero unless $I = K$. Replacing $x$ by $- x$ proves the other inverse identity.
  Multiplicativity has the same convergence justification. If $g = sum_Q d_Q T^Q$, the coefficient of $T^H$ in $tau_x f thin tau_x g$ is a sum over $J + K = H$, $P gt.eq J$, and $Q gt.eq K$. The terms are bounded by
  $ parallel f parallel thin parallel g parallel thin rho^(\| P \| + \| Q \| - \| H \|) \, $
  so they may be regrouped. The multi-index Vandermonde identity
  $ sum_(J + K = H\
J lt.eq P \, med K lt.eq Q) binom(P, J) binom(Q, K) = binom(P + Q, H) $
  then identifies the coefficient with that of $tau_x \( f g \)$. Both inverse maps are contractions for the coefficient supremum norm, so they are isometries.
  A bounded-coefficient series converges on every closed polydisc of radius less than one. Its expansion at $x$ is the series $tau_x f$, by the same convergent binomial expansion. A zero analytic germ would have all Taylor coefficients zero and would therefore give $tau_x f = 0$, hence $f = 0$. ◻
]

=== 6.2 Characteristic zero and the Gross–Hopkins map <characteristic-zero-and-the-grosshopkins-map>

Let $frak(X)_(bb(C)_p)$ denote the open unit polydisc with coordinates $u_1 \, dots.h \, u_(n - 1)$, obtained from the generic fiber of $"Spf" \( E_0 \)$ by extending scalars to $bb(C)_p$. The nonextended stabilizer acts on it continuously by Lemma 20. The characteristic-zero argument below develops the Lie-theoretic approach credited to Chai in #cite(label("BHN22")) Remark 4.2; compare the projective tangent calculation in #cite(label("BHN22")) Proposition 4.18.

#thm([Proposition 6.3.])[
  (Characteristic-zero orbit germs).  #emph[Let $U subset.eq A_n^times$ be an open subgroup and $x in frak(X)_(bb(C)_p) \( bb(C)_p \)$. If an analytic germ at $x$ vanishes at $g x$ for every $g in U$ sufficiently close to the identity, that germ is zero.]
] <fin:charzero>

#proof[
  At $n = 1$ the polydisc is a point, so the assertion is immediate. Suppose $n > 1$. We apply the period theorem after completed base change from $W \( k_n \)$ to $W \( k \)$ and the compatible embedding $W \( k \) arrow.r cal(O)_(bb(C)_p)$. The marked universal deformation and its $A_n^times$-action commute with this base change, and the resulting $bb(C)_p$ generic fiber is $frak(X)_(bb(C)_p)$. The Gross–Hopkins period theorem #cite(label("GH94")) Section 1.1, Theorem 1, with its proof in #cite(label("HG94Bundles")) Proposition 23.5, gives an equivariant étale map
  $ Phi : frak(X)_(bb(C)_p) arrow.r bb(P)_(bb(C)_p)^(n - 1) . $
  The action on the target is the projectivization of the split division-algebra representation
  $ Delta_n ⊗_(bb(Q)_p) bb(C)_p tilde.eq "End"_(bb(C)_p) \( bb(C)_p^n \) . $
  Write $xi = Phi \( x \)$. The analytic inverse function theorem supplies neighborhoods $V$ of $x$ and $W$ of $xi$ on which $Phi$ is an analytic isomorphism. For this use and the one below, its local proof is the same contraction argument used in Section 5: after translating and applying the inverse linear part, write the map as $z + R \( z \)$, with $R \( 0 \) = 0$ and $d R_0 = 0$, and shrink a closed polydisc until $R$ has Lipschitz constant less than one. For $w$ in that polydisc, iteration of $z = w - R \( z \)$ contracts in its complete Tate algebra, producing the analytic inverse. Transport the given germ $P$ to the germ $Q = P compose \( Phi \|_V \)^(- 1)$ at $xi$.
  The infinitesimal action of the full matrix algebra surjects onto $T_xi bb(P)_(bb(C)_p)^(n - 1)$. Since $A_n$ spans $Delta_n$ over $bb(Q)_p$, choose $d_1 \, dots.h \, d_(n - 1) in A_n$ whose infinitesimal projective directions form a $bb(C)_p$-basis of this tangent space. For small $t = \( t_1 \, dots.h \, t_(n - 1) \) in bb(C)_p^(n - 1)$, form
  $ eta \( t \) = (1 + sum_i t_i d_i) xi \, $
  using the split representation to interpret the matrix on the right. This is an analytic map with invertible differential at zero. Shrink its domain so that its image lies in $W$ and $Q compose eta$ is defined.
  For sufficiently large $a$, every $t in \( p^a bb(Z)_p \)^(n - 1)$ defines an element $g_t = 1 + sum_i t_i d_i in U$. Continuity of the stabilizer action allows us also to require $g_t x in V$, within the neighborhood on which $P$ vanishes along the orbit. Equivariance and the fixed inverse branch give
  $ \( Phi \|_V \)^(- 1) \( eta \( t \) \) = g_t x \, #h(2em) \( Q compose eta \) \( t \) = 0 . $
  An analytic function on a $bb(C)_p$-polydisc that vanishes on $\( p^a bb(Z)_p \)^(n - 1)$ is zero: fix all but one variable in that set, apply one-variable uniqueness using a sequence tending to zero, and repeat for each variable. Indeed a nonzero one-variable germ has the form $t^r u \( t \)$ with $u \( 0 \) eq.not 0$, so its zeros cannot accumulate at zero. Thus $Q compose eta$ is the zero germ. The invertible differential of $eta$ implies that $Q$, and therefore $P$, is the zero germ. ◻
]

This argument uses a $bb(Q)_p$-valued set of parameters in a fixed analytic inverse branch. It requires no openness of the stabilizer orbit in the $bb(C)_p$-topology.

=== 6.3 Primes and radical ideals <primes-and-radical-ideals>

#thm([Theorem 6.4.])[
  #emph[Every proper prime ideal of $E_0$ stable under an open subgroup of $A_n^times$ is one of 
$ 0 \, med I_1 \, dots.h \, I_n . $

]
] <fin:primes>

#proof[
  Let $frak(p)$ be such a prime, stable under the open subgroup $U$.
  Suppose first that $p in frak(p)$, and choose the largest $h$ such that $I_h subset.eq frak(p)$. If $h = n$, the ideal $I_n$ is maximal, so $frak(p) = I_n$. Otherwise the image of $u_h$ in $R = E_0 \/ frak(p)$ is a nonzero nonunit. Lemma 24 gives a point $x : R arrow.r cal(O)_C$ at which all parameters are small and $u_h \( x \) eq.not 0$. It is therefore a point of the height-at-least-$h$ polydisc to which Theorem 22 applies.
  If $frak(p) \/ I_h eq.not 0$, choose a nonzero series
  $ f in frak(p) \/ I_h subset k_n \[ \[ u_h \, dots.h \, u_(n - 1) \] \] . $
  Its coefficients are bounded, and Lemma 25 shows that it defines a nonzero ambient analytic germ at $x$. Stability of $frak(p)$ makes $f$ vanish at every point of the $U$-orbit of $x$. This contradicts Theorem 22. Consequently $frak(p) = I_h$.
  Now suppose $p in.not frak(p)$. The mixed-characteristic part of Lemma 24 supplies a point $x : E_0 \/ frak(p) arrow.r cal(O)_(bb(C)_p)$ with all parameters small. If $frak(p) eq.not 0$, take $0 eq.not f in frak(p)$. The fixed embedding $W \( k_n \) arrow.r.hook cal(O)_(bb(C)_p)$ regards $f$ as a nonzero bounded-coefficient series in the ambient generic polydisc. By Lemma 25, its germ at $x$ is nonzero. It vanishes on the $U$-orbit, contradicting Proposition 26. Thus $frak(p) = 0$. ◻
]

#thm([Corollary 6.5.])[
  #emph[For every open subgroup $U subset.eq A_n^times$, the $U$-invariant radical ideals of $E_0$ are precisely 
$ 0 \, med I_1 \, dots.h \, I_n \, med E_0 . $

 The same list gives the radical ideals invariant under the full canonical extended stabilizer group $G_n$.]
] <fin:radicals>

#proof[
  Let $J$ be a proper $U$-invariant radical ideal. Noetherianity gives finitely many minimal primes, and the group permutes them. The stabilizer of each such prime $P$ is closed. Indeed, ideals in the complete Noetherian local ring $E_0$ are adically closed, and each of the conditions
  $ g \( a \) in P \, #h(2em) g^(- 1) \( a \) in P #h(2em) \( a in P \) $
  is closed by continuity of the action. Together these conditions say $g P = P$. This closed stabilizer has finite index in $U$ and is therefore open in $U$: its complement is a finite union of closed cosets. Since $U$ is open in $A_n^times$, the stabilizer is open in $A_n^times$ as well. Theorem 27 applies to every minimal prime of $J$. Their intersection is $J$; since the standard primes form a chain, this intersection is its smallest member. Hence $J$ is standard.
  An ideal invariant under $G_n$ is invariant under $A_n^times$. Conversely, every ideal in the displayed list is invariant under the full canonical action. For $I_h$, this follows from its intrinsic description as the locus where the universal formal group has height at least $h$, or equivalently from the successive height parameters of its $p$-series. The zero and unit ideals are invariant as well. ◻
]

Theorem 27 and Corollary 28 prove Theorem 1.

=== 6.4 Support and the spectral classification <fin:classification>

Write $cal(D) = cal(D)_(\( n \, p \))$, and denote the thick tensor ideal generated by an object $X$ by $chevron.l X chevron.r_⊗$. For $X in cal(D)$, put

$ cal(F) \( X \) = L_(K \( n \)) \( E and X \) \, #h(2em) M_X = pi_0 cal(F) \( X \) xor pi_1 cal(F) \( X \) \, #h(2em) S \( X \) = "Supp"_(E_0) \( M_X \) . $

The two summands of $M_X$ are the completed Morava $E$-homology groups in degrees zero and one, which determine the remaining degrees by periodicity.

We recall precisely the support input needed here. It is the all-prime direction of the reduction in #cite(label("BHN22")) Theorem 4.9.

#thm([Proposition 6.6.])[
  (Established support comparison).  #emph[For every prime $p$ and height $n gt.eq 1$, the following hold.]
  + #emph[The functor $cal(F) : cal(D) arrow.r "Perf" \( E \)$ is exact and symmetric monoidal, where the source uses the $K \( n \)$-localized product. It detects tensor-nilpotence of morphisms.]
  + #emph[The set $S \( X \)$ is a closed $G_n$-invariant subset of $"Spec" \( E_0 \)$, and 
$ S \( X ⊗ Y \) = S \( X \) ∩ S \( Y \) . $

 For $X \, Y in cal(D)$, 
$ X in chevron.l Y chevron.r_⊗ quad arrow.l.r.double quad S \( X \) subset.eq S \( Y \) . $

]
  + #emph[For any finite $p$-local spectrum $F \( k \)$ of type $k$, $0 lt.eq k lt.eq n$, 
$ S #scale(x: 120%, y: 120%)[\(] L_(K \( n \)) F \( k \) #scale(x: 120%, y: 120%)[\)] = V \( I_k \) . $

 Also $S \( 0 \) = diameter$ and $S \( L_(K \( n \)) S \) = "Spec" \( E_0 \)$.]
] <fin:support>

#proof[
  Here we assemble the established results and spell out the direction of support descent. Base change is symmetric monoidal into the category of $K \( n \)$-local $E$-modules. Its dualizable objects are exactly the ordinary perfect $E$-modules by #cite(label("BHN22")) Proposition 4.7. Thus $cal(F)$ has the asserted target even when $X$ is dualizable but not compact as a $K \( n \)$-local spectrum. Tensor-nilpotence detection is #cite(label("BHN22")) Proposition 4.6; neither statement has a prime bound. These inputs use Morava-$E$ descent and the perfect-module comparison of Mathew #cite(label("Mathew16")) Propositions 3.27 and 10.10–10.11.
  The coefficient ring $E_(*)$ is even-periodic, regular, and Noetherian. The comparison theorem of Dell’Ambrogio–Stanley #cite(label("DellAmbrogioStanley16")) Theorem 1.1 and Lemma 3.10, applied to Morava $E$-theory in #cite(label("BHN22")) Lemmas 4.3–4.4, identifies
  $ "Spc" \( "Perf" \( E \) \) tilde.eq "Spec" \( E_0 \) $
  and identifies the tensor-triangular support of $cal(F) \( X \)$ with $S \( X \)$. The tensor-product identity for that support gives $S \( X ⊗ Y \) = S \( X \) ∩ S \( Y \)$. The module $M_X$ is finite over $E_0$, so this support is closed. Its canonical semilinear stabilizer action makes it invariant; equivalently one may use #cite(label("BHN22")) Lemma 4.5.
  Tensor-nilpotence detection gives a surjection
  $ f : "Spc" \( "Perf" \( E \) \) arrow.r "Spc" \( cal(D) \) $
  by Balmer’s surjectivity theorem #cite(label("Balmer18")) Theorem 1.3, in the form #cite(label("BHN22")) Theorem 2.6 and Corollary 4.8. Writing $"supp"$ for tensor-triangular support, functoriality gives
  $ "supp" \( cal(F) \( X \) \) = f^(- 1) #scale(x: 120%, y: 120%)[\(] "supp" \( X \) #scale(x: 120%, y: 120%)[\)] . $
  If $S \( X \) subset.eq S \( Y \)$, surjectivity of $f$ therefore implies $"supp" \( X \) subset.eq "supp" \( Y \)$. Every object of $cal(D)$ is dualizable, so its thick tensor ideals are radical. Balmer’s classification #cite(label("Balmer05")) Theorem 4.10, in the support-containment form of #cite(label("BHN22")) Corollary 2.4, gives $X in chevron.l Y chevron.r_⊗$. The converse follows from exactness, tensor compatibility, and the same support criterion. This is also the transfer formulated in #cite(label("BHN22")) Corollary 2.7.
  For the finite type-$k$ objects the coefficient support is $V \( I_k \)$, as in #cite(label("BHN22")) Proposition 3.3 and the proof of Theorem 4.9. This is the usual finite chromatic support calculation; it is unrestricted in $p$. The two remaining support calculations follow from $cal(F) \( 0 \) = 0$ and $cal(F) \( L_(K \( n \)) S \) = E$. ◻
]

#proof[
  By Corollary 28 and Proposition 29, the support of every object of $cal(D)$ belongs to the finite chain
  $ "Spec" \( E_0 \) = V \( I_0 \) supset.neq V \( I_1 \) supset.neq dots.h.c supset.neq V \( I_n \) supset.neq diameter . $
  Indeed, $S \( X \) = V \( "Ann"_(E_0) M_X \)$, and its defining radical ideal is $G_n$-invariant. Empty support occurs only for the zero object, by applying the support comparison with $Y = 0$.
  Let $cal(J) eq.not 0$ be any thick tensor ideal. The supports occurring among its objects form a nonempty subset of this finite chain, and so have a greatest member that is #emph[attained] by some $Y in cal(J)$. For every $X in cal(J)$, support comparison gives $X in chevron.l Y chevron.r_⊗$. The reverse containment follows from $Y in cal(J)$, hence
  $ cal(J) = chevron.l Y chevron.r_⊗ . $
  There is no assumption that $cal(J)$ was singly generated: attainment follows solely from finiteness of the possible supports.
  Write $S \( Y \) = V \( I_k \)$. The given object $L_(K \( n \)) F \( k \)$ has the same support, so applying Proposition 29 in both directions gives
  $ cal(J) = chevron.l L_(K \( n \)) F \( k \) chevron.r_⊗ = cal(D)_k . $
  The zero ideal is $cal(D)_(n + 1)$.
  The same comparison proves independence of the generator: any other finite type-$k$ spectrum has support $V \( I_k \)$ and therefore generates the same ideal. This also agrees with the finite thick-subcategory theorem of Hopkins–Smith #cite(label("HopkinsSmith98")). The strict inclusions of the displayed supports imply $cal(D)_k supset.neq cal(D)_(k + 1)$, since $L_(K \( n \)) F \( k \)$ belongs to the first ideal and its support is not contained in that of a generator of the second. For $k = n$, its support $V \( I_n \)$ is nonempty, so $cal(D)_n eq.not 0$. Finally $V \( I_0 \) = "Spec" \( E_0 \)$ is the support of the tensor unit. Thus $cal(D)_0$ contains the unit and equals $cal(D)$. The list has exactly $n + 2$ distinct entries, as asserted. ◻
]

Every support needed in this deduction is already realized by the finite spectra specified in the theorem. No realization of an arbitrary Morava module, and hence no prime restriction from the converse direction of the Hovey–Strickland–Chai comparison, enters the argument.

=== 6.5 The Balmer spectrum <the-balmer-spectrum>

A proper thick tensor ideal $cal(P)$ is #emph[prime] if $X ⊗ Y in cal(P)$ implies $X in cal(P)$ or $Y in cal(P)$. The points of $"Spc" \( cal(D) \)$ are these ideals; the tensor-triangular support of $X$ is $"supp" \( X \) = { cal(P) : X in.not cal(P) }$. The following identifies the spectrum, with the indexing used in #cite(label("BHN22")) Proposition 3.5.

#thm([Corollary 6.7.])[
  #emph[For every prime $p$ and every $n gt.eq 1$, 
$ "Spc" \( cal(D)_(\( n \, p \)) \) = { cal(D)_1 \, dots.h \, cal(D)_(n + 1) } \, #h(2em) overline({ cal(D)_j }) = { cal(D)_l : j lt.eq l lt.eq n + 1 } . $

 Thus $cal(D)_1$ is the generic point and $cal(D)_(n + 1) = 0$ is the unique closed point. For $0 lt.eq k lt.eq n$, 
$ "supp" \( L_(K \( n \)) F \( k \) \) = { cal(D)_j : k < j lt.eq n + 1 } . $

]
] <fin:balmer>

#proof[
  The possible coefficient supports form a total chain, including the empty set. Hence $S \( X \) ∩ S \( Y \)$ is one of $S \( X \)$ and $S \( Y \)$. By the tensor-product and containment statements in Proposition 29, if $X ⊗ Y$ belongs to a proper $cal(D)_j$, then one of $X$ and $Y$ does as well. This also includes $cal(D)_(n + 1) = 0$: two nonempty supports both contain $V \( I_n \)$, so their intersection is nonempty. Every proper member of the chain is therefore prime, and Theorem 2 leaves no other prime ideals.
  In the Balmer topology, a point $cal(Q)$ lies in $overline({ cal(P) })$ precisely when $cal(Q) subset.eq cal(P)$. Indeed every support containing $cal(P)$ must contain $cal(Q)$, which says that $X in.not cal(P)$ implies $X in.not cal(Q)$ for every object $X$. The strict ideal chain gives the stated closure formula. Finally $L_(K \( n \)) F \( k \) in cal(D)_j$ exactly when $k gt.eq j$, by the coefficient-support comparison, proving the support formula. ◻
]

The continuous surjection in Proposition 29 has an explicit description in terms of the height ideals. For $frak(q) in "Spec" \( E_0 \)$, set

$ h \( frak(q) \) = max { 0 lt.eq h lt.eq n : I_h subset.eq frak(q) } . $

Then

$ f : "Spec" \( E_0 \) arrow.r "Spc" \( cal(D) \) \, #h(2em) f \( frak(q) \) = cal(D)_(h \( frak(q) \) + 1) . $

Indeed, functoriality of support says that $X in f \( frak(q) \)$ exactly when $frak(q) in.not S \( X \)$. For a nonzero object with $S \( X \) = V \( I_k \)$, this is equivalent to $k > h \( frak(q) \)$, which by Proposition 29 is exactly the condition $X in cal(D)_(h \( frak(q) \) + 1)$. The zero object belongs to both ideals as well. Consequently the fiber over $cal(D)_(h + 1)$ is $V \( I_h \) \\ V \( I_(h + 1) \)$ for $0 lt.eq h < n$, and the fiber over $cal(D)_(n + 1) = 0$ is $V \( I_n \)$. Here $h \( frak(q) \)$ records the formal-group height stratum, not the Krull height of the prime: all primes avoiding $p$ map to the generic Balmer point $cal(D)_1$, while the maximal ideal $I_n$ maps to the closed point $0$.


#bibliography("refs.bib", style: "ieee", title: [References])
