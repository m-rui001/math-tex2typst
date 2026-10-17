#import "@preview/cetz:0.5.0"
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

#align(center)[#text(size: 16pt, weight: "bold")[Arithmetic Stein-degree bounds \
for log Calabi--Yau pairs]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

For a proper integral variety $S$ over a field $k$, the Stein degree over $k$ is

$ "sdeg" \( S \/ "Spec" k \) = dim_k H^0 \( S \, cal(O)_S \) . $

The field of global functions measures the finite part of the structural morphism. Its degree can be large even when the dimension of $S$ is fixed. The question here is whether a boundary component of a log Calabi–Yau pair has uniformly bounded Stein degree once its coefficient is bounded away from zero.

Birkar formulates this question for log Calabi–Yau fibrations in [4] Conjecture 11.1. Birkar–Qu prove normalized Stein-degree bounds over algebraically closed characteristic-zero fields [6] Theorem 1.3, as summarized in [4] Theorem 12.1. Over an arbitrary characteristic-zero field, the finite arithmetic extensions carried by boundary components must also be controlled.

For any integral $k$-variety $V$, let $k_V$ be the relative algebraic closure of $k$ in its function field and put

#[#set math.equation(numbering: n => "(1.1)")
 $ c \( V \/ k \) = \[ k_V : k \] . $ <eq:constants>]

Our result bounds this stronger invariant.

#thm([Theorem 1.1.])[
  #emph[For every integer $d gt.eq 1$ and real number $t > 0$, there is an integer $N \( d \, t \) gt.eq 1$ with the following property. Let $k$ be any field of characteristic zero, and let $\( X \, B \)$ be a projective log canonical $bb(Q)$-pair such that 
$ dim X = d \, #h(2em) H^0 \( X \, cal(O)_X \) = k \, #h(2em) K_X + B tilde.op_(bb(Q)) 0 . $

 Assume that $X$ is normal and integral and that $B$ is effective. If $S$ is a prime component of $B$ with coefficient at least $t$, then 
$ c \( S \/ k \) lt.eq N \( d \, t \) . $

 Consequently 
$ "sdeg" \( S \/ "Spec" k \) lt.eq dim_k H^0 \( S^nu \, cal(O)_(S^nu) \) = c \( S \/ k \) lt.eq N \( d \, t \) \, $

 where $S^nu$ is the normalization of $S$.]
] <thm:main>

1 thus proves the contraction-to-$"Spec" k$ formulation of Birkar’s Stein-degree conjecture for ordinary $bb(Q)$-pairs.

The birational strategy follows Birkar–Qu [6], using the minimal model program (MMP), bounded complements, and boundedness of Fano varieties. Two additional arguments address the arithmetic and inductive difficulties. First, 3 turns geometric boundedness into a bound on Galois orbits of divisorial valuations. A bounded extension fixes a polarization class; a determinant construction descends a bounded power of that class. On a resolution of the resulting bounded pair, a log canonical place is determined by a stratum and integral weights. The finite permutation action on strata therefore bounds its arithmetic orbit, even though there may be infinitely many such places. Second, when the distinguished divisor becomes vertical on a Mori fibre space, the earlier bigness of that divisor forces a horizontal boundary component of coefficient one. A relative MMP makes the two components intersect, so ordinary divisorial adjunction reduces the dimension (Section 4, Section 5).

== 2 Conventions and foundational inputs <conventions-and-foundational-inputs>

All fields have characteristic zero. A variety is integral and of finite type over its ground field. A contraction is a projective surjective morphism $f : V arrow.r Z$ between normal varieties with $f_(*) cal(O)_V = cal(O)_Z$. Divisors over a variety are identified with divisorial valuations, normalized to have value group $bb(Z)$. We use log discrepancies:

$ a \( P \, X \, B \) = 1 - "coeff"_P B_W \, #h(2em) K_W + B_W = p^(*) \( K_X + B \) . $

The pair is log canonical (lc) if these numbers are nonnegative and Kawamata log terminal (klt) if they are positive. A divisorial valuation of log discrepancy zero is an #emph[lc place]. A variety is $epsilon.alt$-lc if the pair with zero boundary has all log discrepancies at least $epsilon.alt$. Canonical divisors in birational comparisons are chosen compatibly. The relation $tilde.op_(bb(Q)) 0$ means that a positive integral multiple is a principal Cartier divisor.

We require $bb(Q)$-factoriality only over the working field. It need not hold over an algebraic closure. For normal geometrically integral varieties, the singularity conditions just stated are preserved by ground-field extension: resolve in characteristic zero, base change, and apply the log smooth discrepancy criterion. Coefficients on geometric components are unchanged.

=== 2.1 Constants and generic fibres <constants-and-generic-fibres>

#thm([Lemma 2.1.])[
  #emph[Let $V$ be an integral $k$-variety.]
  + #emph[The number $c \( V \/ k \)$ is the number of irreducible components of $V_(overline(k))$; these components form one Galois orbit. It is a birational invariant. If $V$ is proper, then $H^0 \( V \, cal(O)_V \) subset.eq k_V$, with equality when $V$ is normal.]
  + #emph[If $V arrow.r Z$ is dominant and $Z$ is geometrically integral over $k$, then, for its generic fibre, 
#[#set math.equation(numbering: n => "(2.1)")
 $ c \( V \/ k \) lt.eq c \( V_(eta_Z) \/ k \( Z \) \) . $ <eq:generic-constants>]

]
  + #emph[If $X$ is normal projective and $H^0 \( X \, cal(O)_X \) = k$, then $X$ is geometrically integral. The normal base of a contraction from $X$ is also geometrically integral. Its generic fibre is normal, projective, and has global functions $k \( Z \)$.]
] <lem:constants>

#proof[
  The extension $k_V \/ k$ is finite and separable, and $k \( V \) \/ k_V$ is regular. Its embeddings in $overline(k)$ give precisely the geometric components. Properness makes global functions finite over $k$. On a normal variety every element of $k \( V \)$ algebraic over $k$ is integral over every local ring and hence regular, proving (i).
  The regular extension $k \( Z \) \/ k$ is linearly disjoint from $k_V \/ k$. Thus $k_V k \( Z \)$ is a degree-$\[ k_V : k \]$ extension of $k \( Z \)$ inside $k \( V \)$ and is contained in the relative algebraic closure of $k \( Z \)$ there. This proves (ii). The first assertion of (iii) follows from (i). For a contraction, global functions on the base are $k$ and localizing $f_(*) cal(O)_X = cal(O)_Z$ gives the asserted generic-fibre function field. Normality is preserved by localization, and a normal variety over a perfect field is geometrically normal; the assertion follows over $k \( Z \)$ as well. ◻
]

We use $c \( P \/ k \)$ for a divisorial valuation by using its residue function field. Its geometric extensions on a model where it is a divisor are distinct valuations forming a single Galois orbit.

If $\( X \, B \)$ is as in 1 and $X arrow.r Z$ is a contraction, restriction to the generic fibre gives a projective lc log Calabi–Yau pair over $k \( Z \)$. Indeed, work over the smooth locus of $Z$, restrict a log resolution, and use generic smoothness and adjunction. The same argument restricts a specified principal multiple of $K_X + B$. Hence a horizontal boundary component can be treated by induction in the dimension of this generic fibre, using (2.1).

=== 2.2 Established theorems used in the proof <established-theorems-used-in-the-proof>

We state the versions needed, so that no arithmetic strengthening of a geometric boundedness theorem is implicit.

- #emph[Klt MMP and extraction.] For a projective morphism of normal varieties over a characteristic-zero field and a $bb(Q)$-factorial klt pair $\( V \, Delta \)$ with effective rational boundary, an MMP with suitable ample scaling terminates in a Mori fibre space if $K_V + Delta$ is not relatively pseudo-effective. If $Delta$ is relatively big and $K_V + Delta$ is relatively pseudo-effective, it terminates in a minimal model. Outputs are $bb(Q)$-factorial and klt. A finite set of exceptional valuations of log discrepancy at most one for a klt $bb(Q)$-pair can be extracted by a projective birational morphism with $bb(Q)$-factorial source and no other exceptional prime divisors. These are consequences of [5]; versions over the fields used here are [10] Theorem 21.7, Corollaries 21.9–21.10, Theorem 22.1. We also use the negativity lemma, monotonicity of discrepancies along a klt MMP, and klt base point freeness.
- #emph[Bounded complements.] In fixed dimension, for an lc pair over an algebraically closed characteristic-zero field, with coefficients in a fixed finite rational set, underlying variety of Fano type, and nef anti-log canonical divisor, there is an enlarged lc boundary $B^(+) gt.eq B$ such that $n \( K + B^(+) \) tilde.op 0$, where $n$ depends only on the dimension and coefficient set. This is the relevant case of [2] Theorem 1.7; a finite rational set is contained in an appropriate hyperstandard set. We may replace $n$ by a prescribed fixed multiple.
- #emph[BAB.] For fixed $q$ and $epsilon.alt > 0$, geometrically $epsilon.alt$-lc projective Fano varieties of dimension $q$ over an algebraically closed characteristic-zero field form a bounded family [3] Theorem 1.1. In particular, they admit very ample line bundles of bounded degree.

Here Fano type over $Z$ means the existence of an effective rational boundary $Delta$ with $\( V \, Delta \)$ klt and $- \( K_V + Delta \)$ ample over $Z$. The absolute term means $Z = "Spec" k$. The other standard inputs are resolution and principalization in characteristic zero, klt vanishing and rational singularities, and divisorial adjunction; see [1,9,8]. We give the index and field arguments for adjunction in 12.

The algebraically closed bounds above are uniform in the ground field. One may also deduce this from their complex versions: descend all finite data, including resolutions and positivity witnesses, to a finitely generated field over $bb(Q)$, embed it into $bb(C)$, and spread and specialize an embedding or a complement. For an embedding, very ampleness and its degree persist after shrinking the parameter space. For the complement used below, the general-member argument in 4 gives the same transfer in its specified linear system.

#thm([Lemma 2.2.])[
  #emph[Suppose $\( V \, D \)$ is lc and $K_V + D tilde.op_(bb(Q)) 0$. Under a birational contraction or flip, push $D$ forward and keep compatible canonical divisors. Then the resulting pair is crepant to $\( V \, D \)$, remains lc with effective boundary, and retains every specified relation $n \( K_V + D \) tilde.op 0$.]
] <lem:crepant>

#proof[
  Write the specified multiple as the divisor of a rational function. Since the map extracts no divisors, pushing forward gives the same principal-divisor identity on the new model. Its two pullbacks to a common resolution are that same principal divisor. Thus the pullbacks agree, which proves crepancy and the discrepancy assertions. Without a specified multiple, choose one first. ◻
]

== 3 Arithmetic consequences of geometric boundedness <sec:arithmetic>

=== 3.1 Descending a complement <descending-a-complement>

#thm([Lemma 3.1.])[
  #emph[Fix $d$ and a rational number $b in \( 0 \, 1 \)$. There is an integer $n = n \( d \, b \)$ such that the following holds over every characteristic-zero field $k$. Suppose $V$ is a normal geometrically integral projective klt Fano variety of dimension $d$, $S$ is a $bb(Q)$-Cartier prime divisor, $\( V \, b S \)$ is lc, and $- K_V - b S$ is nef. Then there is an effective rational boundary $C gt.eq b S$ over $k$ with 
$ \( V \, C \) upright(" lc") \, #h(2em) n \( K_V + C \) tilde.op 0 . $

 We may assume $n b in bb(Z)$.]
] <lem:complement>

#proof[
  Apply bounded complements to $\( V_(overline(k)) \, b S_(overline(k)) \)$ and multiply the index by the denominator of $b$. The geometric complement has the form $b S_(overline(k)) + D \/ n$, where
  #[#set math.equation(numbering: n => "(3.1)")
   $ D in \| - n K_V - n b S \|_(overline(k)) . $ <eq:weil-system>]
  This linear system is defined over $k$. For clarity, its underlying space is the space of rational sections of the integral Weil divisor $- n K_V - n b S$; it can be computed on the smooth locus and extended across codimension two. Sections commute with field extension. The divisor is $bb(Q)$-Cartier, although it need not be Cartier.
  A general geometric member of (3.1) gives an lc pair. To see this, resolve both $\( V \, b S \)$ and the rational map of this linear system. On a further resolution the pullbacks of its members have the form $F + M$, with $F$ fixed and rational and $M$ varying in a base point free Cartier system. Indeed, differences of pullbacks are divisors of ratios of sections, so eliminating the base ideal gives precisely this decomposition. Arrange that the support of $F$ and the crepant boundary $B_W$ of $\( V \, b S \)$ has simple normal crossings. The existence of one lc member implies that every coefficient of $B_W + F \/ n$ is at most one: adding the effective moving part could not remove an excessive coefficient. By Bertini, a general $M$ is smooth and transverse to this support, and its coefficient $1 \/ n$ is at most one. The resulting log smooth pair is lc.
  The argument describes a nonempty geometric open subset of the projective space of sections. Since $k$ is infinite, its $k$-rational points are Zariski dense even after extension to $overline(k)$. Choose a member $D$ over $k$ in this open subset and set $C = b S + D \/ n$. Then $n \( K_V + C \) = n K_V + n b S + D$ is principal over $k$, as required. ◻
]

=== 3.2 Log canonical places of a simple normal crossings pair <log-canonical-places-of-a-simple-normal-crossings-pair>

A stratum of a reduced simple normal crossings divisor will mean an irreducible component of a nonempty intersection of its components, including a single component.

#thm([Lemma 3.2.])[
  #emph[Let $W$ be smooth over an algebraically closed field, and let $H$ be a reduced simple normal crossings divisor. If a divisorial valuation $v$ satisfies $a \( v \, W \, H \) = 0$, then its centre is a stratum. Moreover, $v$ is uniquely determined by that stratum and its positive integral values on the components of $H$ containing the stratum.]
] <lem:weights>

#proof[
  Let $T$ be the centre. If fewer than $"codim" T$ components of $H$ pass through its generic point, complete their local equations by a smooth hypersurface containing $T$, keeping simple normal crossings. The enlarged reduced divisor is lc, and the additional hypersurface has positive value under $v$. The discrepancy for $H$ would therefore be positive. Thus the components through the generic point of $T$ have number $"codim" T$, and $T$ is a stratum.
  We prove uniqueness by a sequence of blowups that is determined by the weights. If $T$ is already a divisor, the normalized valuation centred at its generic point is its order of vanishing. Otherwise choose two components through $T$, with values $p_1 \, p_2 > 0$, and blow up their codimension-two intersection near the generic point of $T$. The new reduced total divisor is simple normal crossings and the blowup is log crepant. The exceptional divisor has value $min \( p_1 \, p_2 \)$; the values of the two strict transforms are
  $ p_1 - min \( p_1 \, p_2 \) \, #h(2em) p_2 - min \( p_1 \, p_2 \) \, $
  with a zero value indicating that the centre is not on that strict transform. The other values are unchanged.
  The new centre is again a stratum. These data specify it uniquely over the generic point of $T$: in the exceptional $bb(P)^1$-bundle, the two strict transforms give the two distinguished sections. Unequal weights choose one section; equal weights choose the full fibre, since a different proper subvariety would not be a stratum. Intersecting with the remaining components through $T$ imposes the remaining prescribed conditions. This is also immediate in the two blowup charts. The sum of the positive weights decreases by $min \( p_1 \, p_2 \)$. Repeating therefore reaches a divisorial centre, where the valuation is unique. Tracing back proves the assertion. ◻
]

#thm([Corollary 3.3.])[
  #emph[A klt rational pair has only finitely many divisorial valuations of log discrepancy less than one.]
] <cor:finite-low>

#proof[
  First work over an algebraic closure and take a log resolution with crepant boundary $B_W$. Let $H = sum H_i$ be a reduced simple normal crossings divisor containing its support, and write $B_W = sum b_i H_i$, allowing zero and negative coefficients. Since the pair is klt, $b_i < 1$. For a valuation $v$ with discrepancy less than one,
  #[#set math.equation(numbering: n => "(3.2)")
   $ a \( v \, W \, B_W \) = a \( v \, W \, H \) + sum_i \( 1 - b_i \) v \( H_i \) < 1 . $ <eq:weight-discrepancy>]
  The first term on the right is a nonnegative integer, so it is zero. The centre is therefore a stratum by 5. At each stratum, the positive integral weights satisfy $sum_i \( 1 - b_i \) v \( H_i \) < 1$, which allows only finitely many choices. There are finitely many strata, and 5 gives uniqueness. Over the original field, each divisorial valuation extends to a geometric one with the same discrepancy, so finiteness follows there as well. ◻
]

=== 3.3 Bounded resolutions and Galois orbits <bounded-resolutions-and-galois-orbits>

We record the bounded-family fact needed to keep resolutions over the field of the data.

#thm([Lemma 3.4.])[
  #emph[Fix bounds for the ambient projective dimension, the degree of a normal geometrically integral projective variety $V$, and the degree of a reduced divisor $D subset V$, where $D$ may be empty. There are constants $R \, M$ depending only on these bounds such that, over the field of the embedded pair, one can find a projective resolution $p : W arrow.r V$ and a geometrically simple normal crossings reduced divisor $H$ containing the exceptional locus and the strict transform of $D$, with 
$ b_2 \( W_(macron(k)) \) lt.eq R \, #h(2em) \# { upright("geometric components and strata of ") H } lt.eq M . $

 One may use an $ell$-adic second Betti number for any $ell$.]
] <lem:embedded>

#proof[
  We explain both the finite-type parametrization and the field assertion. A reduced pure-dimensional projective locus of dimension $j$ and degree at most $D_0$ in a fixed $bb(P)^N$ is cut out set-theoretically by equations of bounded degree. Indeed, given a geometric point outside the locus, choose a linear projection to $bb(P)^(j + 1)$ whose centre misses the locus and whose fibre through that point misses it. Such a choice exists by the usual dimension count. The projection is finite on the locus; its image is a hypersurface of degree at most $D_0$. Pulling back its equation separates the point. Multiplying by forms nonvanishing at that point puts these equations in one fixed degree. The codimension-one case uses the identity projection; the empty and full loci require no argument. A basis of the space of equations in this fixed degree has bounded size. These spaces of equations descend to the field of the locus, because extension of the ground field commutes with their defining linear conditions.
  Apply this to $V$ and $D$. Tuples of equations of bounded size and degree give parameter spaces of finite type over $bb(Q)$ containing all the embedded pairs over their original fields. Stratify to take fibrewise reductions and to impose geometric normality, integrality, dimension, and the divisor condition. This can be done by spreading the reductions at generic points and shrinking, using characteristic zero and generic flatness, and then proceeding by Noetherian induction.
  At the generic point of each stratum, resolve the pair over that point’s own function field. Resolution and principalization in characteristic zero may be chosen to give geometric simple normal crossings, with no extension of that function field [1] Theorems 1.3 and 6.1, including the Addendum. Spread the projective morphism, the reduced divisor, and a dense open on which the morphism is an isomorphism. After shrinking, the resolving variety is smooth and projective over the stratum, the morphism is fibrewise birational, and the divisor has geometric simple normal crossings in every fibre and contains the required exceptional and marked loci. To verify the last condition, spread the inverse image of the closed bad locus and the smoothness and expected codimensions of intersections of the divisor components; the components can be considered after an auxiliary finite étale cover of the parameter stratum for this verification. The resolution itself remains defined on the original stratum. Noetherian induction on its complement yields finitely many families.
  Every embedded pair over a field is a point of one of these strata, so pulling back the corresponding family gives a resolution over that same field. Smooth proper base change bounds the second Betti numbers. Applying it also to intersections of components, after the finite étale covers just used, bounds the numbers of their geometric connected components and hence the numbers of strata. Taking maxima over the finitely many families gives $R$ and $M$. ◻
]

#thm([Proposition 3.5.])[
  #emph[Fix an integer $q gt.eq 1$, a real $epsilon.alt > 0$, and an integer $n gt.eq 1$. There is a finite number $A \( q \, epsilon.alt \, n \)$ with the following property. Let $Q \/ k$ be a normal geometrically integral projective $epsilon.alt$-lc Fano variety of dimension $q$, and suppose 
$ \( Q \, Lambda \) upright(" is lc") \, #h(2em) Lambda gt.eq 0 \, #h(2em) n \( K_Q + Lambda \) tilde.op 0 . $

 Then every divisorial valuation $v$ with $a \( v \, Q \, Lambda \) < 1$ satisfies 
$ c \( v \/ k \) lt.eq A \( q \, epsilon.alt \, n \) . $

]
] <prop:bab-orbits>

#proof[
  #emph[A bounded polarization after a bounded extension.] By BAB, $Q_(overline(k))$ has a very ample line bundle $L$ of bounded degree. Its space of sections also has bounded dimension: for a nondegenerate $q$-dimensional projective variety, degree is at least codimension plus one, so $h^0 \( L \) lt.eq L^q + q$.
  We claim that $"Pic" \( Q_(overline(k)) \)$ is free abelian of bounded rank. First a numerically trivial line bundle $N$ on $Q_(overline(k))$ is trivial. Indeed, klt singularities are rational, so Euler characteristics can be computed on a resolution; Riemann–Roch there gives $chi \( N \) = chi \( cal(O)_(Q_(overline(k))) \)$. Klt Kawamata–Viehweg vanishing applies to both bundles, since $N - K_Q$ and $- K_Q$ are ample. Hence $h^0 \( N \) = h^0 \( cal(O)_(Q_(overline(k))) \) = 1$. The divisor of a nonzero section of $N$ is effective and numerically trivial. Its intersection with a power of an ample divisor forces it to be zero, so $N$ is trivial.
  Pullback to a resolution therefore embeds $"Pic" \( Q_(overline(k)) \)$ into the Néron–Severi group modulo numerical equivalence of that resolution: numerical triviality of a pullback implies numerical triviality downstairs by lifting curves and the projection formula. This is a free abelian group of rank at most the second Betti number. 7, applied to the bounded embedding with empty marking, bounds that number. This proves the claim.
  The Galois action on this lattice has finite image, because its finitely many generators are defined over finite extensions. Finite subgroups of $"GL"_r \( bb(Z) \)$ have bounded order for bounded $r$: reduction modulo $3$ is injective on each such subgroup. To recall why, the kernel has no nontrivial finite-order element. If $I + 3^a M$ with $a gt.eq 1$ and $M equiv.not 0 med \( mod med 3 \)$ had prime order, the binomial expansion at that prime would have a nonzero lowest $3$-adic term; every finite-order element has a power of prime order. Thus an extension $F \/ k$ of bounded degree fixes the class of $L$.
  Invariance of a class need not descend a line bundle, so one more step is necessary. Put $r = h^0 \( L \)$. Choose a finite Galois field of definition of $L$ over $F$, and isomorphisms between its conjugates. Their failure to satisfy the cocycle condition consists of scalar factors. On
  #[#set math.equation(numbering: n => "(3.3)")
   $ L^(⊗ r) ⊗ #scale(x: 120%, y: 120%)[\(] det H^0 \( L \) #scale(x: 120%, y: 120%)[\)]^(- 1) $ <eq:determinant-descent>]
  these factors cancel: a scalar acts to the $r$th power on both factors. This gives effective descent data. The required isomorphisms exist over the chosen field of definition because two line bundles that become isomorphic over an algebraic closure are already isomorphic over that field on a proper geometrically integral variety: apply base change to the sections of their quotient and its inverse. Consequently (3.3) descends to a line bundle $A$ on $Q_F$ whose geometric class is $L^(⊗ r)$. It is very ample and has bounded degree and bounded $h^0 \( A \)$.
  #emph[A bounded marked support.] The principal-divisor identity implies that $n Lambda$ is integral, since $K_Q$ is an integral Weil divisor. Thus every positive coefficient of $Lambda$ is at least $1 \/ n$. On the geometric variety,
  #[#set math.equation(numbering: n => "(3.4)")
   $ \( "Supp" Lambda \)_(upright("red")) dot.op A^(q - 1) lt.eq n \( - K_Q \) dot.op A^(q - 1) lt.eq n #scale(x: 120%, y: 120%)[\(] \( q - 1 \) A^q + 2 #scale(x: 120%, y: 120%)[\)] . $ <eq:marked-degree>]
  For the last inequality, intersect $q - 1$ general members of $\| A \|$. When $q > 1$ they give a smooth curve avoiding the singular locus of the normal variety, and adjunction says
  $ \( - K_Q \) dot.op A^(q - 1) = \( q - 1 \) A^q + 2 - 2 g lt.eq \( q - 1 \) A^q + 2 . $
  For $q = 1$ the same formula is the usual degree formula on a smooth curve. Hence the embedded pair $\( Q_F \, \( "Supp" Lambda \)_(upright("red")) \)$ satisfies the hypotheses of 7 with uniform bounds.
  #emph[The orbit of a valuation.] Choose the resolution supplied there over $F$, and write $K_W + B_W = p^(*) \( K_Q + Lambda \)$. Its geometric reduced divisor $H$ contains the support of $B_W$. Since $\( Q \, Lambda \)$ is lc, $B_W lt.eq H$. For every geometric extension $macron(v)$ of $v$,
  $ 0 lt.eq a \( macron(v) \, W_(overline(k)) \, H \) lt.eq a \( macron(v) \, W_(overline(k)) \, B_W \) < 1 . $
  The left-hand discrepancy is integral, hence zero. By 5, $macron(v)$ is determined by its centre stratum and its weights on the components of $H$. The Galois subgroup over $F$ that fixes all the geometric components and strata fixes each such valuation: its centre and weights cannot change. There are at most $M$ objects in this finite set, so each orbit over $F$ has size at most $M !$. Its full orbit over $k$ has size at most $\[ F : k \] M !$. These are uniformly bounded, proving the proposition. ◻
]

== 4 Birational preparation and adjunction <sec:preparation>

=== 4.1 Making the distinguished component positive <making-the-distinguished-component-positive>

#thm([Lemma 4.1.])[
  #emph[For $\( X \, B \)$ as in 1, there is a projective birational morphism $h : Y arrow.r X$ with $Y$ $bb(Q)$-factorial and klt such that the crepant boundary $B_Y$ is effective. The strict transform of every component of $B$ has its original coefficient.]
] <lem:klt-model>

#proof[
  Take a projective resolution and run a relative $K$-MMP with ample scaling over $X$. In this birational setting every divisor class, including the zero boundary, is big over $X$: the generic fibre is a point. The big-boundary MMP applies. A Mori fibre space over $X$ cannot be an output, since its total space is birational to $X$, whereas its base would have smaller dimension and still dominate $X$. We therefore obtain a $bb(Q)$-factorial klt minimal model $h : Y arrow.r X$. Write
  $ K_Y + B_Y = h^(*) \( K_X + B \) . $
  Minimality says that $- B_Y$ is nef over $X$, and $h_(*) B_Y = B gt.eq 0$. The negativity lemma gives $B_Y gt.eq 0$. Crepancy proves the remaining assertions. ◻
]

#thm([Lemma 4.2.])[
  #emph[Let $X$ be a $bb(Q)$-factorial klt projective variety, $\( X \, B \)$ an effective lc pair with $K_X + B tilde.op_(bb(Q)) 0$, and $S$ a component of coefficient at least $t > 0$. Fix a rational $b$ with $0 < b < t$. There is a sequence of birational MMP steps preserving $S$, followed by a Mori fibre contraction $X_1 arrow.r Z_1$, such that $S_1$ is ample over $Z_1$ and $\( X_1 \, B_1 \)$ is an effective lc log Calabi–Yau pair. If $Z_1$ is a point and $H^0 \( X \, cal(O)_X \) = k$, then 
$ Z_1 = "Spec" k \, #h(2em) - K_(X_1) upright(" ample") \, #h(2em) - K_(X_1) - b S_1 upright(" nef") . $

]
] <lem:positive-component>

#proof[
  Set $D = K_X + B - b S tilde.op_(bb(Q)) - b S$. It is not pseudo-effective, since its intersection with a fixed ample divisor to the power $d - 1$ is negative. Choose an ample rational divisor $H$ and $delta > 0$ rational and small enough that $D + delta H$ remains outside the pseudo-effective cone.
  There is an effective klt boundary $Delta$ with $K_X + Delta tilde.op_(bb(Q)) D + delta H$. Indeed, $\( X \, B - b S \)$ is lc and $X$ is klt, so $\( X \, \( 1 - eta \) \( B - b S \) \)$ is klt for $0 < eta lt.double 1$. The class $delta H + eta \( B - b S \)$ is ample for sufficiently small $eta$. Represent it by a general effective rational divisor with small coefficients, preserving klt, and add this divisor to $\( 1 - eta \) \( B - b S \)$.
  Run the MMP for $K_X + Delta$ with scaling by a sufficiently large multiple $m H$. At a ray $R$ used by the program, including the final Mori fibre ray, write $L_i = D_i + delta H_i$ for the transformed class. The scaling condition gives
  $ L_i dot.op R < 0 \, #h(2em) \( L_i + lambda_i m H_i \) dot.op R = 0 \, #h(2em) lambda_i gt.eq 0 . $
  It follows that $lambda_i > 0$, $H_i dot.op R > 0$, and hence $D_i dot.op R < 0$. Thus every step is positive on $S_i$. The divisor $S_i$ cannot be contracted by a divisorial step: if it were, it would be an effective exceptional divisor nef over that contraction, in contradiction with the negativity lemma. Flips do not contract divisors.
  The resulting Mori fibre contraction has relative Picard number one, so positivity on its extremal ray makes $S_1$ relatively ample. 3 gives the assertions about $\( X_1 \, B_1 \)$. If the base is a point, the function-field condition makes it $"Spec" k$. Now $rho \( X_1 \/ k \) = 1$. The nonzero effective divisor $B_1 tilde.op_(bb(Q)) - K_(X_1)$ is ample, and the effective divisor $B_1 - b S_1 tilde.op_(bb(Q)) - K_(X_1) - b S_1$ is nef, as asserted. ◻
]

=== 4.2 Making a vertical prime a pullback <making-a-vertical-prime-a-pullback>

#thm([Lemma 4.3.])[
  #emph[Let $U arrow.r Z$ be a contraction with $U$ projective and $bb(Q)$-factorial of Fano type over $Z$. Let $P$ be a vertical prime divisor. There is a sequence of $\( - P \)$-negative MMP steps over $Z$ such that the final transform $P'$ survives on a $bb(Q)$-factorial klt variety $U'$ and $- P'$ is semiample over $Z$. If $f : U' arrow.r Z'$ is its semiample contraction, then $Z' arrow.r Z$ is birational and for some integer $m > 0$ and a nonzero effective Cartier divisor $T$ on $Z'$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ m P' = f^(*) T . $ <eq:pullback>]

 The MMP is an isomorphism over the generic point of $Z$. Every horizontal prime $E$ therefore survives and meets $P'$; its normalization has a nonzero effective restricted divisor $P' \|_(E^nu)$.]
] <lem:vertical>

#proof[
  First $- P$ is pseudo-effective over $Z$. Choose an effective Cartier divisor on $Z$ containing the proper closed image of $P$. A sufficiently large multiple of its pullback has coefficient at least one along $P$, so subtracting $P$ leaves an effective divisor.
  Choose an effective klt boundary $Delta$ for which $L = - \( K_U + Delta \)$ is ample over $Z$. For a sufficiently small rational $a > 0$, the class $L - a P$ is also relatively ample. After twisting a sufficiently divisible multiple by a divisor from $Z$, choose a general member and divide by that multiple to obtain an effective rational divisor $D_a tilde.op_(bb(Q)) L - a P$ over $Z$ with $\( U \, Delta + D_a \)$ klt. Then $Psi = Delta + D_a$ is big over $Z$, and
  $ K_U + Psi tilde.op_(bb(Q)) - a P quad upright("over ") Z . $
  The big-boundary MMP with ample scaling terminates in a minimal model $U'$, since this class is relatively pseudo-effective. Its steps are $\( - P \)$-negative. As in 10, the negativity lemma prevents the contraction of $P$. The steps are isomorphisms over a nonempty open subset of $Z$: there $P$ is absent and its negative has zero intersection with every curve in a fibre. In particular, every horizontal prime survives.
  Put $L' = K_(U') + Psi'$, which is nef over $Z$. The boundary $Psi'$ is still big over $Z$, so write $Psi' tilde.op_(bb(Q)) A' + D'$ over $Z$ with $A'$ relatively ample and $D' gt.eq 0$. For sufficiently small rational $eta > 0$, the effective boundary
  $ Theta' = \( 1 - eta \) Psi' + eta D' $
  is klt and satisfies
  $ L' - \( K_(U') + Theta' \) tilde.op_(bb(Q)) eta A' quad upright("over ") Z . $
  Klt base point freeness applies to a sufficiently divisible nef Cartier multiple of $L'$ [10] Theorem 11.1. Thus $L'$, and consequently $- P'$, is semiample over $Z$. The relative theorem can also be applied geometrically and descended: relative generation of sections is detected by faithfully flat base change.
  Let $f : U' arrow.r Z'$ be the associated contraction. On the generic fibre over $Z$, the line bundle of a multiple of $P'$ is trivial and the field of global functions is $k \( Z \)$. Hence $Z' arrow.r Z$ is birational. Choose $m > 0$ such that $m P'$ is Cartier and $cal(O)_(U') \( - m P' \) = f^(*) cal(A)$ for a line bundle $cal(A)$ on $Z'$. The canonical section of $cal(O)_(U') \( m P' \) = f^(*) cal(A)^(- 1)$ descends, by $f_(*) cal(O)_(U') = cal(O)_(Z')$ and the projection formula, to a section of $cal(A)^(- 1)$. Its divisor is a nonzero effective Cartier divisor $T$, and its pullback is exactly $m P'$, proving (4.1).
  A horizontal prime $E$ dominates $Z'$ and, being proper, maps onto $Z'$. Thus it meets $f^(- 1) \( T \)$. It is not contained there, so pulling back $T$ to its normalization gives a nonzero effective Cartier divisor. Dividing by $m$ proves the final assertion. ◻
]

=== 4.3 Adjunction with a specified index <adjunction-with-a-specified-index>

#thm([Lemma 4.4.])[
  #emph[Let $\( U \, C \)$ be an effective lc $bb(Q)$-pair over $k$, let $E$ be a prime component of coefficient one, and suppose $n \( K_U + C \) tilde.op 0$. On the normalization $nu : E^nu arrow.r E$ there is an effective different $C_(E^nu)$ such that 
$ \( E^nu \, C_(E^nu) \) upright(" is lc") \, #h(2em) n \( K_(E^nu) + C_(E^nu) \) tilde.op 0 . $

 In particular, $n C_(E^nu)$ is integral and every positive coefficient of $C_(E^nu)$ is at least $1 \/ n$. If $P eq.not E$ is a $bb(Q)$-Cartier prime component of $C$ of coefficient $beta > 0$, then 
#[#set math.equation(numbering: n => "(4.2)")
 $ C_(E^nu) gt.eq beta P \|_(E^nu) . $ <eq:diff-restriction>]

]
] <lem:adjunction>

#proof[
  Divisorial adjunction gives an effective lc different on the normalization, geometrically and over $k$; its residue construction is compatible with field extension. We verify that it retains the #emph[specified] index $n$, rather than an unspecified multiple. For the construction see [7] Definition 122 and equations (122.7)–(122.10) and [8].
  Choose a nonzero rational top differential $omega$ on $U$, and write $K_U = "div" \( omega \)$. The relation in the hypothesis provides a rational $n$-canonical form $tau$ with
  $ "div" \( tau \) = - n C . $
  At the generic point of $E$, the variety is regular and $E$ has coefficient one. The logarithmic $n$-fold residue of $tau$ along $E$ therefore defines a nonzero rational $n$-canonical form $rho$ on $E^nu$, over $k$. Residue commutes with powers. After passing to $overline(k)$ and taking any sufficiently divisible power, the usual pluri-residue definition of the different gives
  $ "div" \( rho \) + n C_(E^nu) = 0 . $
  Indeed, the identity for that power is the positive integral multiple of this identity. It consequently holds already for $rho$ over $k$. This proves the principal-divisor assertion at index $n$, and also that $n C_(E^nu)$ is integral. There is no gluing across different normalizations here; the construction is on the single normalized prime $E^nu$.
  For (4.2), remove $beta P$ from $C$. The remaining pair is effective and lc and still has coefficient one along $E$, so its different is effective. After a common Cartier multiple, the two log pluricanonical sheaves differ by the tensor factor $cal(O)_U \( m beta P \)$, and their residues differ by its restriction to $E^nu$. Dividing by $m$ shows that adding $beta P$ adds exactly $beta P \|_(E^nu)$ to the different. This comparison does not require $K_U + E$ to be $bb(Q)$-Cartier. Distinct primes over $k$ have disjoint sets of geometric prime components, so this restriction is defined on every geometric component of $E^nu$. This proves the inequality. ◻
]

#thm([Lemma 4.5.])[
  #emph[Let $U$ be a projective $bb(Q)$-Gorenstein klt variety over an algebraically closed field of characteristic zero, and let $\( U \, C \)$ be lc with $C gt.eq 0$. Given $b > 0$, at most $2 \/ b$ prime components of $C$ with coefficient at least $b$ can contain a fixed irreducible codimension-two subvariety of $U$.]
] <lem:incidence>

#proof[
  Take general very ample hyperplane sections down to a surface, and choose a point where the surface meets a suitable dense open subset of the given codimension-two locus. The surface is normal and klt, and its restricted boundary is lc. These assertions can be checked on a log resolution: general hyperplanes meet its simple normal crossings divisors transversely, adjunction preserves the discrepancy coefficients, and the images of exceptional loci and boundary intersections are met in the expected dimensions. Each prime being counted restricts to a curve germ through the chosen point, with its original coefficient, and the germs are distinct.
  It remains to bound the number of these germs at a klt surface singularity. Descend the finite data and a log resolution to an embeddable characteristic-zero field and work over $bb(C)$. A klt complex surface singularity is a quotient singularity [9] Proposition 4.18; it has a finite smooth analytic uniformizing cover étale in codimension one. The crepant pullback of the pair is lc by the finite-cover discrepancy formula. Each curve germ pulls back to at least one curve through the point upstairs, with at least its original coefficient, and different germs have no common curve component. Blowing up this smooth surface point gives the log discrepancy
  $ 2 - "mult"_0 \( C_(upright("up")) \) gt.eq 0 . $
  If there are $r$ original germs, their contributions give $r b lt.eq "mult"_0 \( C_(upright("up")) \) lt.eq 2$. Thus $r lt.eq 2 \/ b$, as required. ◻
]

== 5 Proof of the arithmetic bound <sec:proof>

We prove 1 by induction on $d$, proving the assertion for #emph[all] positive thresholds simultaneously in each dimension. For $t > 1$ the assertion is vacuous. Henceforth $0 < t lt.eq 1$.

=== 5.1 The curve case <the-curve-case>

For $d = 1$, $X$ is a smooth projective geometrically integral curve. Since $B$ has a positive component and $K_X + B tilde.op_(bb(Q)) 0$,

$ 0 < deg B = 2 - 2 g \( X \) . $

Thus $g \( X \) = 0$ and $deg B = 2$. If $S$ is a component with coefficient at least $t$, then $S$ is a closed point and

$ t thin c \( S \/ k \) = t \[ k \( S \) : k \] lt.eq deg B = 2 . $

We may take $N \( 1 \, t \) = ceil.l 2 \/ t ceil.r$ in the substantive range.

Fix $d gt.eq 2$ and assume the theorem in every smaller dimension and for every positive threshold. Write

#[#set math.equation(numbering: n => "(5.1)")
 $ M_(< d) \( u \) = max_(1 lt.eq r < d) N \( r \, u \) \, #h(2em) u > 0 . $ <eq:Mnotation>]

These are finite numbers by the induction hypothesis.

=== 5.2 An ample component and a bounded complement <an-ample-component-and-a-bounded-complement>

Use 9 to replace $X$ by a $bb(Q)$-factorial klt variety, with effective crepant lc boundary and the same divisorial valuation $S$. Its constant degree is unchanged. Choose once and for all a rational number

#[#set math.equation(numbering: n => "(5.2)")
 $ 0 < b = b \( t \) < t . $ <eq:bchoice>]

Apply 10 to obtain a Mori fibre contraction $X_1 arrow.r Z_1$ on which $S_1$ is relatively ample.

If $dim Z_1 > 0$, the divisor $S_1$ is horizontal: an effective vertical divisor is trivial on the generic fibre and cannot be relatively ample on a positive-dimensional fibre. Its coefficient in $B_1$ is at least $t$, so the generic-fibre induction gives

#[#set math.equation(numbering: n => "(5.3)")
 $ c \( S \/ k \) lt.eq M_(< d) \( t \) . $ <eq:first-horizontal>]

We may therefore assume $Z_1 = "Spec" k$. Now $S_1$ and $- K_(X_1)$ are ample, and $- K_(X_1) - b S_1$ is nef. 4 supplies an integer $n = n \( d \, b \)$ and a boundary $C_1$ over $k$ satisfying

#[#set math.equation(numbering: n => "(5.4)")
 $ \( X_1 \, C_1 \) upright(" lc") \, #h(2em) C_1 gt.eq b S_1 \, #h(2em) n \( K_(X_1) + C_1 \) tilde.op 0 . $ <eq:C1>]

The index $n$ is independent of the field, the original boundary, and its denominators.

=== 5.3 A Mori fibre space with controlled singularities <a-mori-fibre-space-with-controlled-singularities>

Set $epsilon.alt = 1 \/ n$. By 6, there are only finitely many valuations with $a \( v \, X_1 \, 0 \) < epsilon.alt$. They are exceptional, since a divisor on $X_1$ has log discrepancy one for the zero boundary. Every such valuation is an lc place of $\( X_1 \, C_1 \)$. Indeed, the principal-divisor identity in (5.4) implies

$ a \( v \, X_1 \, C_1 \) in 1 / n bb(Z) \, #h(2em) 0 lt.eq a \( v \, X_1 \, C_1 \) lt.eq a \( v \, X_1 \, 0 \) < 1 / n \, $

so the first discrepancy is zero. The middle inequality uses that $C_1$ is effective and $bb(Q)$-Cartier.

Extract exactly these exceptional divisors by $pi : X_2 arrow.r X_1$, using the extraction theorem for the klt pair $\( X_1 \, 0 \)$. The variety $X_2$ is $bb(Q)$-factorial, and the crepant pair $\( X_2 \, C_2 \)$ is effective and lc, with coefficient one on each $pi$-exceptional divisor. Moreover $X_2$ is $epsilon.alt$-lc. To see this, write

$ K_(X_2) + G = pi^(*) K_(X_1) \, #h(2em) G = sum_(F upright(" exceptional")) \( 1 - a \( F \, X_1 \, 0 \) \) F gt.eq 0 . $

For valuations not extracted, effectivity and $bb(Q)$-Cartierness of $G$ give $a \( v \, X_2 \, 0 \) gt.eq a \( v \, X_1 \, 0 \) gt.eq epsilon.alt$. Each extracted valuation now has log discrepancy one on $X_2$ with zero boundary.

Since $K_(X_2) tilde.op_(bb(Q)) - C_2$ and $C_2$ is nonzero and effective, $K_(X_2)$ is not pseudo-effective. Run a $K_(X_2)$-MMP with ample scaling to a Mori fibre contraction

#[#set math.equation(numbering: n => "(5.5)")
 $ X_2 arrow.r.dashed X_3 arrow.r^g Z . $ <eq:second-mori>]

The variety $X_3$ is $bb(Q)$-factorial and $epsilon.alt$-lc, since log discrepancies do not decrease along this MMP. By 3, its transformed boundary satisfies

$ \( X_3 \, C_3 \) upright(" lc") \, #h(2em) C_3 gt.eq 0 \, #h(2em) n \( K_(X_3) + C_3 \) tilde.op 0 . $

Let $v_S$ denote the original valuation of $S$, whether or not it survives as a divisor on $X_3$. Crepancy gives

#[#set math.equation(numbering: n => "(5.6)")
 $ a \( v_S \, X_3 \, C_3 \) lt.eq 1 - b < 1 . $ <eq:Sdiscrepancy>]

If $dim Z = 0$, then $Z = "Spec" k$ and $X_3$ is an $epsilon.alt$-lc Fano variety. 8 proves

#[#set math.equation(numbering: n => "(5.7)")
 $ c \( S \/ k \) lt.eq A \( d \, 1 \/ n \, n \) . $ <eq:bounded-fano-case>]

We henceforth assume $0 < dim Z < d$.

=== 5.4 Recovering the divisor over a positive-dimensional base <recovering-the-divisor-over-a-positive-dimensional-base>

We first realize $v_S$ as a prime $P$ on a model of Fano type over $Z$. For a sufficiently small rational $lambda > 0$, set $Gamma = \( 1 - lambda \) C_3$. The pair $\( X_3 \, Gamma \)$ is klt: its log discrepancies are the corresponding convex combinations for the klt pair $\( X_3 \, 0 \)$ and the lc pair $\( X_3 \, C_3 \)$. Also

$ - \( K_(X_3) + Gamma \) tilde.op_(bb(Q)) - lambda K_(X_3) $

is ample over $Z$. By (5.6), $lambda$ can be chosen so that $a \( v_S \, X_3 \, Gamma \) < 1$.

If $v_S$ is exceptional over $X_3$, extract it alone by a projective birational morphism $h : U arrow.r X_3$ with $U$ $bb(Q)$-factorial. Otherwise set $U = X_3$. The crepant boundaries for $C_3$ and $Gamma$ are both effective: on the possible new exceptional prime their coefficients are respectively $1 - a \( v_S \, X_3 \, C_3 \) gt.eq b$ and $1 - a \( v_S \, X_3 \, Gamma \) > 0$. The first gives an lc log Calabi–Yau pair $\( U \, C_U \)$ with the same principal multiple $n$; the second gives a klt pair $\( U \, Gamma_U \)$ whose anti-log canonical divisor $L$ is nef and big over $Z$.

This makes $U$ of Fano type over $Z$ in the ample sense used above. Indeed, write $L tilde.op_(bb(Q)) A + D$ over $Z$, with $A$ relatively ample and $D gt.eq 0$. For sufficiently small $eta > 0$, the boundary $Gamma_U + eta D$ is effective and klt, and

$ - \( K_U + Gamma_U + eta D \) tilde.op_(bb(Q)) L - eta D tilde.op_(bb(Q)) \( 1 - eta \) L + eta A $

is ample over $Z$.

Let $P$ denote the prime realizing $v_S$ on $U$. If $P$ is horizontal over $Z$, its coefficient in $C_U$ is at least $b$ and the generic-fibre induction gives

#[#set math.equation(numbering: n => "(5.8)")
 $ c \( S \/ k \) = c \( P \/ k \) lt.eq M_(< d) \( b \) . $ <eq:second-horizontal>]

It remains to treat the case where $P$ is vertical.

=== 5.5 A horizontal coefficient-one component <a-horizontal-coefficient-one-component>

The bigness established before the second MMP now supplies the component needed for adjunction. On $X_2$ the divisor $pi^(*) S_1$ is effective and big. Its support is contained in the strict transform of $S_1$ and the exceptional divisors of $pi$. Its pushforward to $X_3$ under (5.5) is also effective and big. For completeness, bigness survives this pushforward because every section of a divisible multiple upstairs is a rational function with nonnegative divisor on every prime that remains downstairs. The birational map extracts no divisors, so these sections inject into the corresponding spaces downstairs; the growth of order $m^d$ is retained.

An effective big divisor on $X_3$ cannot have only vertical components over $Z$. Such a divisor restricts to zero on the generic fibre, whereas a big divisor restricts to a big class: restrict a Kodaira decomposition into an ample rational divisor and an effective divisor. The generic fibre has positive dimension, so its zero class is not big.

The transform of $S_1$, if present on $X_3$, is vertical because $v_S$ has vertical centre. Hence some horizontal component $E_3$ of the pushforward of $pi^(*) S_1$ comes from a $pi$-exceptional divisor. All of those have coefficient one in $C_2$, and their uncontracted transforms have coefficient one in $C_3$. We have therefore found

#[#set math.equation(numbering: n => "(5.9)")
 $ E_3 subset floor.l C_3 floor.r \, #h(2em) E_3 upright(" horizontal over ") Z . $ <eq:horizontal-floor>]

The generic-fibre induction at threshold one gives

#[#set math.equation(numbering: n => "(5.10)")
 $ c \( E_3 \/ k \) lt.eq M_(< d) \( 1 \) . $ <eq:Ebound>]

=== 5.6 Intersection, adjunction, and counting conjugates <intersection-adjunction-and-counting-conjugates>

Apply 11 to $U \/ Z$ and $P$. We obtain a model $U'$ with a contraction $f : U' arrow.r Z'$, birational $Z' arrow.r Z$, and $m P' = f^(*) T$ for a nonzero effective Cartier divisor $T$ on $Z'$. The transform $E$ of $E_3$ survives and is horizontal. Its coefficient in the crepant boundary $C'$ remains one, the coefficient of $P'$ is at least $b$, and

$ \( U' \, C' \) upright(" lc") \, #h(2em) C' gt.eq 0 \, #h(2em) n \( K_(U') + C' \) tilde.op 0 . $

In particular, $P' eq.not E$. Since $E arrow.r Z'$ is surjective, $P' \|_(E^nu)$ is a nonzero effective rational divisor.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.65), [#text(size: 9pt)[$E^ nu$]])
  content((4.2, 1.65), [#text(size: 9pt)[$U'$]])
  content((4.2, 0), [#text(size: 9pt)[$Z'$]])
  line((0.4104, 1.65), (3.869, 1.65), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.1, 1.65), [#text(size: 9pt)[$iota$ \(finite\)]], anchor: "south", padding: 0.1176cm)
  line((4.2, 1.406), (4.2, 0.244), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.2, 0.825), [#text(size: 9pt)[$f$, $"mP"'=f^*T$]], anchor: "west", padding: 0.1176cm)
  line((0.4104, 1.489), (3.869, 0.13), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((2.1, 0.825), [#text(size: 9pt)[$f compose iota$#linebreak()surjective]], anchor: "north-east", padding: 0.1176cm)
})],
  caption: [Figure 1: The vertical case. The map $iota$ is normalization followed by inclusion. Surjectivity gives $m iota^(*) P' = \( f compose iota \)^(*) T eq.not 0$. A prime component $J$ of this pullback maps finitely onto a codimension-two subvariety of $U'$. ],
) <fig:vertical>

Take a prime component $J$ of $P' \|_(E^nu)$. By 12, its coefficient in the different $C_(E^nu)$ is positive and hence at least $1 \/ n$. View $E^nu$ over its own field of constants $k_E$. By 2, this is a normal geometrically integral projective variety of dimension $d - 1$ over $k_E$, with

$ \[ k_E : k \] = c \( E \/ k \) = c \( E_3 \/ k \) lt.eq M_(< d) \( 1 \) . $

Since $k_E \/ k$ is finite separable, changing the ground field from $k$ to $k_E$ does not alter its canonical divisor. The adjunction pair is therefore a log Calabi–Yau pair over $k_E$. Induction in dimension $d - 1$ at threshold $1 \/ n$ gives

$ c \( J \/ k_E \) lt.eq N \( d - 1 \, 1 \/ n \) . $

As $k_E subset k \( J \)$, degrees in the tower of constant fields multiply, and hence

#[#set math.equation(numbering: n => "(5.11)")
 $ c \( J \/ k \) = \[ k_E : k \] c \( J \/ k_E \) lt.eq M_(< d) \( 1 \) N \( d - 1 \, 1 \/ n \) . $ <eq:Jbound>]

Finally work over $overline(k)$. Choose a geometric component $J_0$ of $J$ and let $W_0$ be its image on $U'_(overline(k))$. The normalization map is finite, so $W_0$ has dimension $d - 2$ and is contained in a geometric prime component of $P'$. The geometric components of $P'$ form a single Galois orbit. Thus every one of them contains an image of a conjugate of $J_0$: conjugate both the chosen containment and $J_0$.

There are at most $c \( J \/ k \)$ such images. For each image, 13 bounds by $2 \/ b$ the number of components of $P'_(overline(k))$ that contain it, since all these components have coefficient at least $b$ in $C'_(overline(k))$ and $U'_(overline(k))$ is $bb(Q)$-Gorenstein klt. Counting the incidences, with repeated images only increasing the upper bound, yields

#[#set math.equation(numbering: n => "(5.12)")
 $ c \( S \/ k \) = c \( P' \/ k \) lt.eq 2 / b c \( J \/ k \) lt.eq 2 / b M_(< d) \( 1 \) N \( d - 1 \, 1 \/ n \) . $ <eq:final-incidence>]

=== 5.7 Uniformity and conclusion <uniformity-and-conclusion>

The four cases (5.3), (5.7), (5.8), and (5.12) exhaust the proof. In particular, after choosing $b = b \( t \)$ and $n = n \( d \, b \)$, it suffices to take an integer majorant of

#[#set math.equation(numbering: n => "(5.13)")
 $ max mat(delim: "{", #none, M_(< d) \( t \) \, quad M_(< d) \( b \) \, quad A \( d \, 1 \/ n \, n \) \,; #none, 2 / b M_(< d) \( 1 \) N \( d - 1 \, 1 \/ n \)) . $ <eq:recurrence>]

Every inductive term involves a strictly smaller ambient dimension. All thresholds and the complement index depend only on $d \, t$. Neither the field, any original coefficient denominator, the number of extracted divisors, nor the auxiliary small perturbations enters this maximum. Thus it defines a finite bound depending only on $d \, t$ and closes the induction.

For the original possibly nonnormal component $S$, the injection $H^0 \( S \, cal(O)_S \) arrow.r.hook H^0 \( S^nu \, cal(O)_(S^nu) \)$ now gives the claimed Stein-degree bound. This proves 1. $square.stroked.tiny$

#heading(level: 1)[References]
#bibitem([1])[E.~Bierstone, P.~D.~Milman, and M.~Temkin, $bb(Q)$-universal desingularization, #emph[Asian J. Math.] #strong[15] (2011), 229--250. #link("https://doi.org/10.4310/AJM.2011.v15.n2.a5")[doi:10.4310/AJM.2011.v15.n2.a5].]
#bibitem([2])[C.~Birkar, Anti-pluricanonical systems on Fano varieties, #emph[Ann. of Math.] #strong[190] (2019), 345--463. #link("https://doi.org/10.4007/annals.2019.190.2.1")[doi:10.4007/annals.2019.190.2.1].]
#bibitem([3])[C.~Birkar, Singularities of linear systems and boundedness of Fano varieties, #emph[Ann. of Math.] #strong[193] (2021), 347--405. #link("https://doi.org/10.4007/annals.2021.193.2.1")[doi:10.4007/annals.2021.193.2.1].]
#bibitem([4])[C.~Birkar, #emph[Stein degree of proper morphisms], #link("https://arxiv.org/abs/2603.23939v1")[arXiv:2603.23939v1] (2026).]
#bibitem([5])[C.~Birkar, P.~Cascini, C.~D.~Hacon, and J.~McKernan, Existence of minimal models for varieties of log general type, #emph[J. Amer. Math. Soc.] #strong[23] (2010), 405--468. #link("https://doi.org/10.1090/S0894-0347-09-00649-3")[doi:10.1090/S0894-0347-09-00649-3].]
#bibitem([6])[C.~Birkar and S.~Qu, #emph[Stein degree on log Calabi--Yau fibrations], #link("https://arxiv.org/abs/2509.20948v1")[arXiv:2509.20948v1] (2025).]
#bibitem([7])[J.~Kollár, #emph[Canonical models], author-hosted draft chapter, June 1, 2010, Definition 122 and formulas (122.7)--(122.10), pp.~61--62. #link("https://web.math.princeton.edu/~kollar/book/chap2.pdf")[Author's draft]\; numbering is that of this draft, not the published book.]
#bibitem([8])[J.~Kollár, #emph[Singularities of the Minimal Model Program], with the collaboration of S.~Kovács, Cambridge Tracts in Mathematics 200, Cambridge University Press, 2013. #link("https://doi.org/10.1017/CBO9781139547895")[doi:10.1017/CBO9781139547895].]
#bibitem([9])[J.~Kollár and S.~Mori, #emph[Birational Geometry of Algebraic Varieties], Cambridge Tracts in Mathematics 134, Cambridge University Press, 1998. #link("https://doi.org/10.1017/CBO9780511662560")[doi:10.1017/CBO9780511662560].]
#bibitem([10])[S.~Lyu and T.~Murayama, #emph[The relative minimal model program for excellent algebraic spaces and analytic spaces in equal characteristic zero], #link("https://arxiv.org/abs/2209.08732v4")[arXiv:2209.08732v4] (2026), forthcoming in #emph[Memoirs of the European Mathematical Society].]


