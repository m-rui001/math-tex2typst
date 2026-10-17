#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
#set text(lang: "en", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 12pt, all: true), leading: 0.75em)
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

#align(center)[#text(size: 16pt, weight: "bold")[Termination-of-generalized-log-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Termination of flips rules out an endless sequence of small birational improvements in the minimal model program. Since flips contract no divisors, their number cannot be bounded by counting divisors that disappear. In dimension four, exceptional surfaces bring places centered on surfaces and curves into the argument. On compact Kähler spaces, the contractions may be projective even when the ambient fourfold has no ample line bundle.

Shokurov’s difficulty counts exceptional divisors with small discrepancy to measure the improvement of singularities [25] Definition 2.15 and Corollaries 2.16–2.17. Kawamata, Matsuda, and Matsuki combined it with the rank of surface cycle classes to prove termination of terminal fourfold flips in the algebraic setting [17] Theorem 5-1-15. For boundaries, Fujino’s corrected argument for canonical fourfold pairs exhibits the recurring contributions from successive blowups over a codimension-two center [9] Example 2.1 and Theorems 5.1–5.2. Alexeev, Hacon, and Kawamata developed a weighted difficulty that subtracts these contributions and tracks cycles on normalized boundary components [1] Section 2. Discrepancy improvement and the behavior of boundary cycles also guide the proof here.

Generalized pairs place part of the adjoint data on a higher birational model: a nef divisor there contributes its trace on the space carrying the boundary [3] Definitions 1.4 and 4.1. For algebraic generalized pairs, Hacon and Moraga gave a termination reduction using weak Zariski decompositions [14] Theorem 1. Termination for pseudo-effective generalized log canonical fourfolds with NQC nef data was proved by Chen and Tsakanikas [4] Theorem 1.1 and by Moraga [18] Theorem 4.4. Here NQC means a nonnegative real combination of nef $bb(Q)$-Cartier divisors on the higher model. Han, Liu, and Zhuang proved termination of ordinary klt fourfold minimal model programs when the boundary is big over the fixed algebraic base [16] Corollary 3.2(3).

Hacon and Xie formulate a termination conjecture for generalized klt pairs with higher $\( 1 \, 1 \)$-class data on compact Kähler spaces [15] Conjecture 1.15. The generalized klt case of the theorem below treats a four-dimensional rational-divisor form of that question under the stated projectivity and global Weil $bb(Q)$-factoriality assumptions; the theorem also permits generalized log canonical singularities. Its ambient spaces may be nonprojective, and the prescribed small diagrams may vary their bases and choices under the hypotheses below.

A normal compact complex space $X$ is #emph[globally Weil $bb(Q)$-factorial] if every prime Weil divisor defined on all of $X$ is $bb(Q)$-Cartier and some positive reflexive power of its canonical sheaf is invertible. Projective morphisms of complex spaces are understood in the analytic sense: they admit a relatively ample holomorphic line bundle. A $bb(Q)$-Cartier divisor is relatively ample if a positive Cartier multiple is relatively ample.

For a normal compact Kähler space $X$, a rational nef b-divisor $upright(bold(M))$ in this paper is represented by a $bb(Q)$-Cartier divisor $M'$ on a normal compact Kähler space $X'$ with a projective bimeromorphic map $pi : X' arrow.r X$. We require $c_1 \( M' \)$ to lie in the closure of the Kähler cone in real Bott–Chern cohomology. On a model dominating $X'$, the trace $M_W$ is the pullback of $M'$; on another model it is the pushforward from a common higher model. The divisor $M'$ need not be effective.

We use compatible actual canonical divisor representatives on the birational models under consideration. Given an effective rational Weil divisor $B$ of finite support for which $D_X = K_X + B + M_X$ is $bb(Q)$-Cartier, choose a smooth proper bimeromorphic model $p : W arrow.r X$ dominating $X'$ and write

#[#set math.equation(numbering: n => "(1.1)")
 $ K_W + Delta_W + M_W = p^(*) \( K_X + B + M_X \) . $ <eq:discrepancy-definition>]

A #emph[global divisorial place] is a prime divisor on a normal proper bimeromorphic model, with primes identified by strict transform on common higher models. Its log discrepancy is

$ a \( E \; X \, B + upright(bold(M)) \) = 1 - "coeff"_E \( Delta_W \) $

on a model carrying $E$. The pair is #emph[generalized log canonical] if this number is nonnegative for every global divisorial place, including the primes on $X$. These places are defined on birational models; the definition does not depend on a field of global meromorphic functions.

#thm([Theorem 1.1.])[
  #emph[Let $X_0$ be a normal irreducible globally Weil $bb(Q)$-factorial compact Kähler fourfold. Let $B_0$ be an effective rational Weil divisor of finite support with coefficients in $\[ 0 \, 1 \]$. Let $upright(bold(M))$ be represented by an analytically nef $bb(Q)$-Cartier divisor on a projective bimeromorphic normal compact Kähler model of $X_0$. Fix compatible actual canonical divisor representatives on all birational models under consideration. Suppose that $D_0 = K_(X_0) + B_0 + M_(X_0)$ is $bb(Q)$-Cartier and that $\( X_0 \, B_0 + upright(bold(M)) \)$ is generalized log canonical.]
  #emph[Consider a sequence of normal irreducible globally Weil $bb(Q)$-factorial compact Kähler fourfolds 
$ X_0 arrow.r.dashed X_1 arrow.r.dashed X_2 arrow.r.dashed dots.h.c . $

 On $X_i$, let $B_i$ be the strict transform of $B_0$, let $M_i = M_(X_i)$ be the trace of the same b-divisor, and assume that $D_i = K_(X_i) + B_i + M_i$ is $bb(Q)$-Cartier. Transport the canonical representatives under the induced identifications of prime divisors. Suppose that every step is given by a diagram 
(1.2)
#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$X_i$])
  content((2.321, 0), [$Z_i$])
  content((4.775, 0), [$X_(i + 1)$])
  line((0.468, 0), (1.853, 0), mark: (end: ">"))
  content((1.161, 0.2266), [#text(size: 0.73em)[$f_i$]])
  line((4.175, 0), (2.789, 0), mark: (end: ">"))
  content((3.482, 0.2266), [#text(size: 0.73em)[$f_i^(+)$]])
})

 where $Z_i$ is normal compact Kähler, both maps are projective small bimeromorphic morphisms with connected fibers, neither is an isomorphism, and 
$ - D_i upright(" is ") f_i upright("-ample") \, #h(2em) D_(i + 1) upright(" is ") f_i^(+) upright("-ample") . $

 Here #emph[small] means that the exceptional locus contains no prime divisor. Then the sequence is finite.]
] <thm:main>

We call a diagram satisfying the hypotheses of Theorem 1 a #emph[flip] for the indicated adjoint. The theorem applies to arbitrary choices of such diagrams. Taking $upright(bold(M)) = 0$ gives the ordinary log canonical case.

The proof uses the relative constructions and special termination for generalized pairs in [19], whose precise forms we recall in Section 2.

=== Proof strategy <proof-strategy>

We first prove termination for generalized klt pairs on models satisfying the stronger factoriality condition specified in Section 2. Discrepancy monotonicity and finiteness for the initial pair make the set of exceptional places of discrepancy at most one constant on a tail. Extracting it gives crepant models $h_i : Y_i arrow.r X_i$ whose remaining exceptional discrepancies are greater than one; we call them #emph[terminal junctions]. Each downstairs flip connects two junctions by a decrease of the extracted boundary coefficients followed by a finite, possibly empty, program of small steps. This construction adapts the projective argument of [20] Section 3, Proposition 3.4.

The extracted coefficients may still vary. When an extracted divisor maps onto a surface, a transverse smooth surface cuts its general fiber into exceptional curves. Adjunction and negative definiteness bound the entries of the grouped intersection matrix. The fixed rational boundary and nef data then confine the discrepancies of extracted places with surface centers to a finite set. A downstairs flip strictly raises the discrepancy of a place whose center lies in its exceptional locus. It follows that, on every junction of a tail, each coefficient that still varies belongs to a divisor mapping onto a curve or a point of $X_i$.

The branch bound of Theorem 17 applies to a reduced union $Q$ of divisors on a terminal fourfold $Y$ when a projective bimeromorphic morphism $Y arrow.r X$ of normal irreducible compact Kähler fourfolds sends $Q$ to a set of dimension at most one. A surface in $Q$ may have several prime divisors above it in the disjoint normalization of its components. The theorem bounds the total excess of branches by the ranks of surface cycle classes on those normalizations and the number of global ordinary discrepancy-two places centered on singular curves in $Q$. It is formulated independently of any boundary or crepant equation.

The word #emph[global] is essential. Projective topology over the curve image relates the branch excess to local systems along the singular curves. Saito’s projective analytic decomposition theorem and a Hodge-filtration argument on a compact Kähler resolution give the needed purity. A Quot parameter argument gives finite monodromy. On a Stein neighborhood of a compact core carrying all loops of the curve, we apply Fujino’s local small $bb(Q)$-factorialization theorem; fiber degrees and blowups then produce local ordinary discrepancy-two places. A canonical discrepancy comparison shows that they occur as divisors on one global resolution, and the retained loops keep those global divisors distinct. The normalization and parameter methods follow [20] Sections 5–6; the analytic purity argument and the passage to distinct global divisors are given here.

Section 6 constructs the difficulty by counting exceptional places of discrepancy below two with ceiling weights, subtracting generic blowup contributions locally before summation, and adding cycle-rank corrections on normalized boundary components. The branch bound makes it nonnegative at junctions. Across a small step, the cycle-rank change cancels the change in the local subtractions, leaving a sum of nonnegative weight losses. This adapts the locally corrected difficulty in [20] Section 4.

A surface in the positive exceptional locus of a downstairs flip forces a drop of at least one in the difficulty between its terminal junctions. Only finitely many flips can do this. Every remaining flip has an exceptional surface only on the negative side, so the rank of analytic surface classes on the ambient $X_i$ decreases. This proves termination for generalized klt pairs on these auxiliary models. Special termination and deletion of the whole boundary floor reduce elementary generalized dlt programs to that case. We then use relative continuation and this gdlt termination to lift each diagram of Theorem 1 to a finite program whose endpoint maps crepantly to the next downstairs model. A negative curve downstairs has a negative multisection upstairs, so each lift is nonempty. Their concatenation proves Theorem 1.

== 2 Generalized pairs and auxiliary programs <sec:preliminaries>

The relative constructions used in the proof take place on models with a stronger global factoriality property than the one in Theorem 1. We first specify that property and the generalized pair conventions for those constructions. We then record the precise forms of the auxiliary results that will be used.

The auxiliary definitions and statements in this section use reduced, irreducible, second-countable complex analytic spaces as their ambient spaces.

#prodef([Definition 2.1.])[
  (Global strong factoriality).  A normal compact complex space $T$ is #emph[globally strongly $bb(Q)$-factorial] if, for every coherent rank-one reflexive sheaf $cal(F)$ on all of $T$, some positive reflexive power
  $ cal(F)^(\[ m \]) = \( cal(F)^(⊗ m) \)^(* *) \, #h(2em) m > 0 \, $
  is an invertible sheaf.
] <def:strong-factoriality>

This condition implies global Weil $bb(Q)$-factoriality: apply it to the divisorial sheaf of each global prime divisor and to the reflexive canonical sheaf. It is a condition on sheaves on the whole space; it makes no assertion that arbitrary analytic open subsets, or the analytic local rings, are $bb(Q)$-factorial. We use #emph[strong model] to mean a globally strongly $bb(Q)$-factorial model.

A #emph[rational line bundle] on $T$ is an element of $"Pic" \( T \) ⊗_(bb(Z)) bb(Q)$. An equality of rational line bundles means an isomorphism of holomorphic line bundles after taking a positive common integral multiple. A rank-one reflexive sheaf is #emph[rationally invertible] if a positive reflexive power is invertible. On a projective morphism $T arrow.r V$, a rational line bundle is #emph[relatively nef] if its degree is nonnegative on every compact irreducible curve in a fiber, and is #emph[relatively ample] if a positive integral multiple is relatively ample. For the absolute nef data in this paper, nefness means that the first Chern class lies in the closure of the Kähler cone, as in the introduction; it implies relative nefness for every morphism under consideration.

The auxiliary constructions are stated for rational generalized #emph[b-line data]. On a normal compact space $T$, these consist of an effective rational Weil divisor $B$ of finite support, a projective modification $p : W arrow.r T$, and a rational line bundle $M_W$ on $W$ that is nef absolutely, or nef over the specified base of a relative argument. It is pulled back on every higher model; we continue to denote the resulting b-object by $upright(bold(M))$. After clearing a denominator, proper direct image followed by double dual defines its reflexive trace $M_T$. The adjoint $D_T = K_T + B + M_T$ is required to be rationally invertible. Here $K_T$ in the b-line formulation is the reflexive canonical sheaf. On a smooth log resolution projective over $T$ and carrying the data, the natural meromorphic comparison over the isomorphism locus defines the crepant boundary by

$ K_W + B_W + M_W = p^(*) D_T . $

The log discrepancy of a global place $E$ is $a \( E \; T \, B + upright(bold(M)) \) = 1 - "coeff"_E \( B_W \)$ on a model carrying it. All statements about places below concern the global places defined in the introduction. A global place is exceptional over $T$ if its center on $T$ has codimension at least two.

We abbreviate #emph[generalized klt], #emph[generalized lc], and #emph[generalized dlt] to gklt, glc, and gdlt. A pair is gklt if all of its global log discrepancies are positive, and glc if they are all nonnegative. It is #emph[generalized terminal] if it is gklt and $a \( E \; T \, B + upright(bold(M)) \) > 1$ for every place exceptional over $T$. A #emph[generalized log canonical center] is the center of a global place of log discrepancy zero. A glc pair is gdlt if there is a Zariski-open set $T^compose subset T$ on which $\( T^compose \, B \|_(T^compose) \)$ is simple normal crossing and the b-data descend, and which contains the general point of every generalized log canonical center. The carrier and subsequent log resolutions may be chosen isomorphic on this open. The zero-discrepancy centers there are strata of the coefficient-one boundary. These are the conventions of [19] Convention 9.1 and Definition 9.2.

We explain the relation between this formulation and the actual divisors in Theorem 1. A $bb(Q)$-Cartier divisor determines a rational line bundle. If $m M_W$ is integral Cartier, then on the normal target the reflexive sheaf

$ #scale(x: 120%, y: 120%)[\(] p_(*) cal(O)_W \( m M_W \) #scale(x: 120%, y: 120%)[\)]^(* *) $

agrees with the divisorial sheaf $cal(O)_T \( m p_(*) M_W \)$: the two agree at every codimension-one point, where the modification is an isomorphism, and normality gives uniqueness of the reflexive extension. The same comparison on a common higher model is compatible with pullback and with transport across a small map. The canonical trace is the canonical sheaf of the target. These facts are [19] Lemma 9.3(i)–(ii). The natural meromorphic comparisons therefore agree with the comparisons using the compatible actual canonical representatives in (1.1). In every application below the b-line discrepancies are exactly the discrepancies of that equation, and a crepant b-line identity is the corresponding equality of actual rational divisors. A common projective carrier for any finite part of our birational constructions carries the pullback of the original analytically nef divisor, which is relatively nef over each base used in that part. A single carrier dominating an infinite sequence is not required.

Here is the elementary step used in the auxiliary programs. Suppose that the source $T$ and the output $T_1$ are strong normal compact Kähler spaces, and write $D_T$ and $D_(T_1)$ for their rationally invertible adjoints. An #emph[elementary negative step] is either a projective bimeromorphic divisorial contraction $f : T arrow.r T_1$ for which $- D_T$ is $f$-ample, or a diagram

$ T arrow.r^(med f med) Z arrow.l^(med f^(+) med) T_1 $

of projective small bimeromorphic morphisms to a normal compact Kähler space with $- D_T$ $f$-ample and $D_(T_1)$ $f^(+)$-ample. The degree functionals of the curves contracted on the negative side span one nonzero ray when paired with global rational line bundles on $T$. In the small case the positive side is the relative Proj of the actual adjoint algebra: after choosing a positive multiple of $D_T$ represented by a holomorphic line bundle $cal(L)$, it is

$ T_1 = "Proj"_Z xor.big_(m gt.eq 0) f_(*) cal(L)^(⊗ m) . $

The boundary is pushed forward in the divisorial case and strictly transformed in the small case, and the same b-data are used on common higher models. With the compatible actual canonical representatives, a divisorial step satisfies $D_(T_1) = f_(*) D_T$. If the step is #emph[over $V$], all its maps commute with the given maps to $V$. In the constructions used below the contraction maps have connected fibers, and a small step has nonisomorphic morphisms on both sides; the latter properties are also verified in Section 3. This is the form of [19] Definition 9.6. Its one-ray condition concerns degrees of global line bundles and imposes no condition on the relative Bott–Chern dimension. A diagram in Theorem 1 need not be elementary.

#thm([Proposition 2.2.])[
  (Low places and projective realization).  #emph[Let $\( T \, B + upright(bold(M)) \)$ be gklt rational generalized data on a normal compact Kähler space, with effective boundary of finite support and an absolutely nef rational datum carried by a projective modification. Fix a projective log resolution carrying the datum. There is $epsilon > 0$ such that every global place satisfies 
$ a \( E \; T \, B + upright(bold(M)) \) gt.eq epsilon \, $

 and only finitely many places exceptional over $T$ satisfy 
$ a \( E \; T \, B + upright(bold(M)) \) < 1 + epsilon . $

 This finite set can be represented simultaneously by prime divisors on a smooth model projective over $T$. In particular the exceptional places of discrepancy at most one form a finite set with such a realization.]
] <prop:low-places>

This is the rational nef specialization of [19] Lemma 4.2(i). The positive number $epsilon$ belongs to this one pair; uniformity along a sequence will follow from discrepancy monotonicity.

#thm([Proposition 2.3.])[
  (Exact extraction).  #emph[Let $\( T \, B + upright(bold(M)) \)$ be rational gklt data on a strong normal compact Kähler space, with an absolutely nef rational line bundle on a projective carrier and rationally invertible adjoint. For any specified finite set $cal(E)$ of places exceptional over $T$ with $a \( E \; T \, B + upright(bold(M)) \) lt.eq 1$, there is a projective bimeromorphic morphism $h : U arrow.r T$ such that $U$ is a strong normal compact Kähler space, the $h$-exceptional prime divisors are exactly the members of $cal(E)$, and the crepant generalized pair on $U$ is gklt with effective boundary. Thus, writing this boundary as $B_U$, 
$ K_U + B_U + M_U = h^(*) \( K_T + B + M_T \) . $

]
] <prop:extraction>

This is [19] Proposition 9.11. Terminality is not part of the extraction assertion. It will follow when $cal(E)$ is chosen to contain every exceptional place of discrepancy at most one.

#thm([Proposition 2.4.])[
  (Relative programs).  #emph[Let $pi : T arrow.r V$ be a projective bimeromorphic morphism of normal compact Kähler spaces. Suppose that $T$ is strong and that $\( T \, B + upright(bold(M)) \)$ is rational gdlt, with effective boundary, a projective carrier on which the rational line datum is nef over $V$, and a rationally invertible adjoint $D_T$.]
  + #emph[If $D_T$ is not relatively nef over $V$, there is an elementary negative step over $V$. Its output is projective over $V$, normal compact Kähler and strong, and is gdlt with the transported boundary and b-data. The same construction is available after every finite prefix whose last adjoint is not relatively nef over $V$.]
  + #emph[If the initial pair is gklt, there exists a finite, possibly empty, sequence of elementary negative steps over this one fixed base $V$ whose last adjoint is relatively nef over $V$. Its models and transported data have the properties in the first assertion.]
] <prop:relative-program>

The two assertions are respectively [19] Propositions 9.7 and 9.9. The first is a continuation assertion for gdlt data. The second asserts the existence of one finite run for gklt data; it does not assert termination of every choice of a relative program.

#thm([Proposition 2.5.])[
  (Crepant gdlt modification).  #emph[Let $\( T \, B + upright(bold(M)) \)$ be rational glc data of dimension at most four on a normal compact Kähler space. Assume that the higher absolutely nef rational line datum is carried by a projective modification and that $K_T + B + M_T$ is rationally invertible. There is a projective bimeromorphic morphism $h : Y arrow.r T$ such that $Y$ is a strong normal compact Kähler space, $\( Y \, B_Y + upright(bold(M)) \)$ is gdlt with $B_Y gt.eq 0$, and 
$ K_Y + B_Y + M_Y = h^(*) \( K_T + B + M_T \) . $

 Every $h$-exceptional prime has coefficient one in $B_Y$, equivalently has generalized log discrepancy zero over $\( T \, B + upright(bold(M)) \)$.]
] <prop:gdlt-modification>

This is [19] Proposition 11.4. The base $T$ need not be strong, and the assertion does not require that every zero-discrepancy place be extracted.

#thm([Theorem 2.6.])[
  (Special termination).  #emph[Let $d lt.eq 4$, and let 
$ \( T_0 \, B_0 + upright(bold(M)) \) arrow.r.dashed \( T_1 \, B_1 + upright(bold(M)) \) arrow.r.dashed \( T_2 \, B_2 + upright(bold(M)) \) arrow.r.dashed dots.h.c $

 be a sequence of elementary steps for rational gdlt data on strong normal compact Kähler spaces of dimension $d$. The boundaries are transported as in an elementary program, and the higher absolutely nef b-line datum is fixed and is carried by projective modifications. There is an index $i_0$ such that, for every $i gt.eq i_0$, the exceptional loci on both sides of the step are disjoint from every generalized log canonical center on their respective sides. The contraction bases in this sequence may vary.]
] <thm:special-termination>

This is [19] Theorem 11.3. We use it for the elementary sequences on strong models. Full termination for four-dimensional gdlt data will be deduced in Section 7.

== 3 Birational comparisons <sec:comparisons>

We compare the adjoints on the two sides of a small diagram and at the ends of a finite relative program. The comparisons locate exactly which global places acquire larger discrepancies. They also give a projective morphism from a nef end to a prescribed ample model, with the nef adjoint equal to the pullback of the ample adjoint. We then record the homological ranks that count contracted divisors and surfaces. All divisor equalities in this section are equalities of actual rational divisors, with the compatible canonical representatives and the fixed b-divisor $upright(bold(M))$ of Section 2.

For a projective morphism, a rational Cartier divisor is called #emph[relatively nef] here if it has nonnegative degree on every compact irreducible curve contracted by the morphism. We use the analytic negativity lemma in the following precise form [21] Lemma 2.2: if $r : V arrow.r T$ is a projective bimeromorphic morphism of normal complex spaces, $H$ is a $bb(Q)$-Cartier divisor on $V$, $- H$ is relatively nef, and $r_(*) H gt.eq 0$, then $H gt.eq 0$. Neither compactness nor a singularity hypothesis is part of this input. A divisor is #emph[exceptional over $T$] if every prime in its support has image of codimension at least two in $T$.

We will also use two consequences of normality. An effective $bb(Q)$-Cartier divisor pulls back effectively under a dominant morphism: after clearing its index, a local meromorphic equation with no divisorial poles is holomorphic on a normal space. Such a divisor has nonnegative degree on a compact curve not contained in its support, by restricting its effective section to the normalization of the curve.

=== 3.1 Common models and the nef part <common-models-and-the-nef-part>

The projectivity in the hypotheses permits all comparisons in a finite part of the argument to be made on one compact Kähler resolution. We give the construction for the diagrams used here; compare the common-model construction of [21] Proposition 2.1.

#thm([Lemma 3.1.])[
  (Common models with projective maps).  #emph[Let a finite collection of normal irreducible compact Kähler spaces be joined, with compatible bimeromorphic identifications, by finitely many projective bimeromorphic morphisms and their inverses. Suppose that a fixed nef b-divisor is carried by a projective bimeromorphic morphism $X' arrow.r X$ to one of these spaces, with analytically nef $bb(Q)$-Cartier trace $M'$ on $X'$. Then there is a smooth compact Kähler space $W$ with compatible projective bimeromorphic morphisms to every space in the collection and to $X'$. The resolution may simultaneously principalize finitely many specified generically nonzero coherent ideals and resolve finitely many specified divisors. Its trace $M_W$ is the pullback of $M'$ and is analytically nef.]
] <lem:common-projective-models>

#proof[
  For a diagram $T arrow.r Z arrow.l T^(+)$, take the reduced component of $T times_Z T^(+)$ containing the graph over the common isomorphism open. Its projections are projective, and finite normalization preserves projectivity. Adjoin the remaining spaces and the carrier one at a time by the same construction. Resolving the resulting dominating component gives a common smooth model. Analytic resolution and principalization allow the stated simultaneous choices by projective modifications; see [2] Theorems 1.6, 1.10 and 13.2(1). Base change, restriction to a closed analytic subspace, finite normalization, and composition preserve projectivity. For composition in the present compact setting, one can choose a uniform sufficiently large twist of a relative ample bundle by the pullback of the next one. This also proves compatibility with any finite chain of the small diagrams and divisorial contractions considered below.
  A smooth space projective over a compact Kähler space is compact Kähler: a relative ample bundle supplies positivity in the fiber directions, and adding a sufficiently large multiple of a pulled-back Kähler form supplies positivity in all directions. Finally, choose Kähler classes on $X'$ converging to $c_1 \( M' \)$. Their pullbacks to $W$ have semipositive representatives. Adding positive multiples tending to zero of a fixed Kähler class on $W$ gives Kähler classes converging to $c_1 \( M_W \)$. Thus $M_W$ is analytically nef. ◻
]

In particular, $M_W$ has nonnegative degree on every compact curve. For an arbitrary global place, a further common proper model with a model carrying that place suffices to compare coefficients. This last model need not be projective: projectivity is used to establish an effective divisor on a common model, after which its pullbacks remain effective on every higher proper model.

#thm([Lemma 3.2.])[
  (Effective nef defect).  #emph[Let $T$ be a normal compact Kähler model, and let $r : W arrow.r T$ be a projective bimeromorphic morphism from a normal compact Kähler space $W$ dominating the fixed projective carrier of $upright(bold(M))$. Assume that $M_T$ is $bb(Q)$-Cartier. Then 
#[#set math.equation(numbering: n => "(3.1)")
 $ J_(W \/ T) := r^(*) M_T - M_W gt.eq 0 $ <eq:nef-defect>]

 is an exceptional $bb(Q)$-Cartier divisor over $T$. If $s : W' arrow.r W$ is a higher normal model, then $J_(W' \/ T) = s^(*) J_(W \/ T)$.]
] <lem:nef-defect>

#proof[
  The trace definition gives $r_(*) J_(W \/ T) = 0$. On an $r$-contracted curve, $- J_(W \/ T) = M_W - r^(*) M_T$ has the same degree as $M_W$, hence has nonnegative degree by projection formula from the nef carrier. Analytic negativity gives $J_(W \/ T) gt.eq 0$. The final identity follows from functoriality of pullback and the fact that the b-divisor descends on $W$. ◻
]

The next lemma explains why hypotheses stated for global generalized places give the local ordinary singularity conditions needed later. It is here that effectivity of the boundary and of the nef defect enters the singularity comparison. The global Weil and strong $bb(Q)$-factoriality conventions ensure the Cartier hypotheses below for the respective models in the proof, since the divisor traces have finite support.

#thm([Lemma 3.3.])[
  (From global generalized discrepancies to local singularities).  #emph[Let $T$ be a normal compact Kähler space, let $B$ be an effective rational divisor of finite support, and let $upright(bold(M))$ have analytically nef rational data on a projective carrier. Assume that $K_T$, $B$, and $M_T$ are $bb(Q)$-Cartier. If every global generalized log discrepancy of $\( T \, B + upright(bold(M)) \)$ is nonnegative, respectively positive, then the same condition holds for local analytic places. In the positive case, $T$ has ordinary klt singularities locally. If the global generalized discrepancies are positive and every global place exceptional over $T$ has generalized log discrepancy strictly greater than one, then $T$ has ordinary terminal singularities locally. In dimension four the latter conclusion implies $dim "Sing" T lt.eq 1$.]
] <lem:ordinary-singularities>

#proof[
  Choose a smooth log resolution $r : W arrow.r T$, projective over $T$ and carrying $upright(bold(M))$, with divisorial exceptional locus and simple normal crossing support for all divisors in the crepant equation
  $ K_W + Delta_W + M_W = r^(*) \( K_T + B + M_T \) . $
  Such a simultaneous resolution is available by Lemma 8. The assumed inequalities give coefficients at most one, respectively strictly below one, for every global prime of $Delta_W$. The same bounds hold on their local branches. On any further local model the nef part is pulled back from $W$, so its generalized discrepancies are the ordinary discrepancies of the simple normal crossing subpair $\( W \, Delta_W \)$. The simple normal crossing discrepancy criterion proves the asserted local generalized inequalities, including when some coefficients of $Delta_W$ are negative.
  Put $J = J_(W \/ T)$. The ordinary crepant boundary for $\( T \, 0 \)$ is
  #[#set math.equation(numbering: n => "(3.2)")
   $ Delta_W^(\( 0 \)) = Delta_W - r^(*) B - J \, #h(2em) K_W + Delta_W^(\( 0 \)) = r^(*) K_T . $ <eq:ordinary-crepant-boundary>]
  Both $r^(*) B$ and $J$ are effective. After resolving their joint support as above, every coefficient of $Delta_W^(\( 0 \))$ is therefore strictly below one in the positive case. The same local simple normal crossing criterion gives ordinary klt singularities.
  For the terminal assertion, the relative canonical divisor is exceptional, and at an exceptional prime $R$ of $W$ its coefficient is
  $ "coeff"_R \( K_W - r^(*) K_T \) = a \( R \; T \, B + upright(bold(M)) \) - 1 + "coeff"_R \( r^(*) B + J \) > 0 . $
  These positive coefficients persist on every local branch. A local place exceptional over the smooth space $W$ has ordinary log discrepancy at least two over $W$: the Jacobian determinant of a smooth model carrying it has positive integral order along an exceptional divisor. Its discrepancy over $T$ adds the nonnegative order of $K_W - r^(*) K_T$, and hence remains greater than one. Local exceptional places already represented by divisors on $W$ satisfy the displayed strict inequality. Thus $T$ is locally ordinary terminal. For a normal complex fourfold with a rational canonical line bundle, local ordinary terminality implies smoothness in codimension two by [21] Lemma 2.3, giving the last assertion. ◻
]

For later calculations, the same equations give, for every global place $E$ followed on a common higher model,

#[#set math.equation(numbering: n => "(3.3)")
 $ a \( E \; T \, B + upright(bold(M)) \) = a \( E \; T \, 0 \) - "ord"_E \( r^(*) B \) - "ord"_E \( J_(W \/ T) \) . $ <eq:generalized-ordinary-discrepancy>]

The orders on the right mean coefficients after pullback to that model. They are nonnegative under the hypotheses of Lemma 10.

=== 3.2 Small diagrams and finite programs <small-diagrams-and-finite-programs>

We now locate the entire region in which a small step changes discrepancies. All exceptional loci and their images in this subsection are given their reduced structures. We use the graph method of [20] Lemma 2.1 and prove the needed analytic comparison, with the fixed b-divisor, below.

#thm([Lemma 3.4.])[
  (Comparison for an arbitrary small diagram).  #emph[Let 
$ T arrow.r^(med f med) Z arrow.l^(med f^(+) med) T^(+) $

 be a diagram of normal irreducible compact Kähler fourfolds in which $f$ and $f^(+)$ are projective small bimeromorphic morphisms with connected fibers, and both are nonisomorphisms. Let $\( T \, B_T + upright(bold(M)) \)$ and $\( T^(+) \, B_(T^(+)) + upright(bold(M)) \)$ have effective rational boundaries related by strict transform and the same fixed rational b-divisor. Transport the canonical representatives by the identification of prime divisors, and assume that the actual adjoints $D_T$ and $D_(T^(+))$ are $bb(Q)$-Cartier, with $- D_T$ $f$-ample and $D_(T^(+))$ $f^(+)$-ample.]
  #emph[The exceptional images of $f$ and $f^(+)$ are equal. If their common image is $A$, then 
#[#set math.equation(numbering: n => "(3.4)")
 $ L := "Exc" \( f \) = f^(- 1) \( A \) \, #h(2em) L^(+) := "Exc" \( f^(+) \) = \( f^(+) \)^(- 1) \( A \) \, $ <eq:small-loci>]

 the complements are isomorphic, and 
#[#set math.equation(numbering: n => "(3.5)")
 $ dim L \, dim L^(+) lt.eq 2 \, #h(2em) dim A lt.eq 1 \, #h(2em) dim L + dim L^(+) gt.eq 3 . $ <eq:small-dimensions>]

]
  #emph[Let $G$ be the normalization of the main graph, with projections $p : G arrow.r T$, $q : G arrow.r T^(+)$ and $h = f compose p = f^(+) compose q$. Then the actual $bb(Q)$-Cartier divisor 
#[#set math.equation(numbering: n => "(3.6)")
 $ F := p^(*) D_T - q^(*) D_(T^(+)) $ <eq:small-divisor>]

 is effective and exceptional over both $T$ and $T^(+)$, and 
#[#set math.equation(numbering: n => "(3.7)")
 $ "Supp" F = h^(- 1) \( A \) . $ <eq:small-support>]

 Moreover, $F dot.op C < 0$ for every irreducible curve $C$ contracted by $h$.]
  #emph[For every global place $E$ over these spaces, let $"ord"_E \( F \)$ denote the coefficient of the pullback of $F$ on any higher proper model dominating $G$ and carrying $E$. Then 
#[#set math.equation(numbering: n => "(3.8)")
 $ a \( E \; T^(+) \, B_(T^(+)) + upright(bold(M)) \) - a \( E \; T \, B_T + upright(bold(M)) \) = "ord"_E \( F \) gt.eq 0 . $ <eq:small-discrepancies>]

 The inequality is strict exactly when $"cent"_T \( E \) subset L$, and this condition is equivalent to $"cent"_(T^(+)) \( E \) subset L^(+)$. A place is exceptional over $T$ if and only if it is exceptional over $T^(+)$.]
] <lem:small-comparison>

#proof[
  We first recall the fiber description for a proper bimeromorphic morphism $v : V arrow.r S$ of normal spaces. Its positive-dimensional-fiber locus is closed analytic. Over its complement the map is finite locally on $S$, hence an isomorphism by normality. Stein factorization shows that every fiber is connected, because its finite bimeromorphic factor over the normal space $S$ is an isomorphism. A reduced compact connected positive-dimensional fiber has no zero-dimensional irreducible component: such a component would be a singleton disjoint from the finitely many other closed components. Hence no point in such a fiber is a local isomorphism point. The exceptional locus of $v$ is exactly the full inverse image of its positive-dimensional-fiber locus.
  Let $U subset Z$ be the open set over which $f$ is an isomorphism. On $U$, $D_T$ defines a $bb(Q)$-Cartier divisor $D_U$. The actual Weil coefficients of the two adjoints agree under the identification of prime divisors. Since $f^(+)$ is small, it follows that $D_(T^(+)) \|_(\( f^(+) \)^(- 1) U) = \( f^(+) \)^(*) D_U$. A positive-dimensional projective fiber over $U$ would contain a curve on which this divisor has degree zero, contrary to $f^(+)$-ampleness. Thus $f^(+)$ is an isomorphism over $U$. Interchanging the two sides and using $f$-ampleness of $- D_T$ gives the reverse inclusion of the isomorphism opens. This proves the equality of exceptional images and (3.4). Smallness gives $dim L \, dim L^(+) lt.eq 2$. Over a general point of each component of $A$ the fiber has dimension at least one, so the fiber-dimension theorem gives $dim A lt.eq 1$.
  The graph projections are projective and surjective, and the map from $G$ to its component in $T times_Z T^(+)$ is finite. A prime divisor of either side maps to a prime divisor of $Z$ by smallness. On the graph it therefore corresponds to the same prime place on the other side, with the same adjoint coefficient. Consequently $p_(*) F = q_(*) F = 0$. On a $p$-contracted curve, $- F$ has the degree of $q^(*) D_(T^(+))$, which is nonnegative. Analytic negativity gives $F gt.eq 0$.
  For a curve $C$ contracted by $h$, the projection formula and the two ample signs give
  $ - F dot.op C = \( - D_T \) dot.op p_(*) C + D_(T^(+)) dot.op q_(*) C > 0 . $
  Here an image that is a point contributes zero. At least one image is a curve, because the finite map to the fiber product cannot contract $C$ to a point. Thus at least one summand is strictly positive.
  The support of $F$ is contained in $h^(- 1) \( A \)$, since both projections identify the common isomorphism open and the adjoints agree there. Conversely, take $x in h^(- 1) \( A \)$ and write $z = h \( x \)$. The map $h : G arrow.r Z$ is proper bimeromorphic, so its fiber over $z$ is connected. It is projective and positive-dimensional: its projection to the positive-dimensional fiber $f^(- 1) \( z \)$ is surjective. The fiber description above places $x$ on a positive-dimensional irreducible component. Successive projective hyperplane cuts through $x$ give an irreducible curve $C$ in that fiber through $x$. If $x$ were outside $"Supp" F$, then $C$ would not be contained in the effective $bb(Q)$-Cartier divisor $F$, so $F dot.op C gt.eq 0$. The preceding strict inequality excludes this. Hence (3.7) holds.
  Follow a global place $E$ on a common proper model dominating $G$ and the nef carrier. Subtracting its two crepant equations cancels the same trace of $upright(bold(M))$ and gives (3.8). The order of an effective $bb(Q)$-Cartier divisor is positive precisely when the center of the place is contained in its support. Proper images of centers give
  $ "cent"_Z \( E \) = f \( "cent"_T \( E \) \) = f^(+) \( "cent"_(T^(+)) \( E \) \) = h \( "cent"_G \( E \) \) . $
  Together with (3.4) and (3.7), this proves both center equivalence and the stated exact strictness criterion. If the centers are not contained in these loci, their general points correspond on the common open and the order is zero. Finally, a place centered at a divisor on a normal model is that divisorial place. Smallness identifies these prime divisors on the two sides, proving equivalence of exceptionality.
  Since both morphisms are nonisomorphisms, $A$ is nonempty, so $F$ has a prime divisor $R$ in its support. The graph is a fourfold, hence $dim R = 3$. Its finite map to the graph component has image in $L times_Z L^(+)$, whence
  $ 3 lt.eq dim \( L times_Z L^(+) \) lt.eq dim L + dim L^(+) . $
  This is the remaining inequality in (3.5). ◻
]

The discrepancy statement preserves generalized lc and generalized klt inequalities along a small step. It also preserves generalized terminality, because the same places are exceptional on both sides. The isomorphism-open argument did not use nontriviality. In the normal irreducible compact Kähler fourfold setting of Lemma 11, if an elementary small step is initially specified by a nonisomorphic negative contraction, a small positive morphism, and the stated Cartier and ample hypotheses, that argument forces the positive morphism to be nonisomorphic as well. Its fibers are connected by normality and Stein factorization, so Lemma 11 applies. For a finite program we need, in addition, to retain the location of the accumulated correction at its end.

#thm([Lemma 3.5.])[
  (Comparison along a finite negative program).  #emph[Let $Y_0 arrow.r.dashed dots.h.c arrow.r.dashed Y_m$, with $m gt.eq 0$, be a finite sequence of normal irreducible compact Kähler fourfolds with $bb(Q)$-Cartier adjoints $D_j = K_(Y_j) + B_j + M_(Y_j)$. Suppose the effective rational boundaries are transported by pushforward, the canonical representatives are compatible, and the same b-divisor with a projective carrier is used throughout. Assume each step is either a small diagram satisfying Lemma 11, or a projective bimeromorphic divisorial contraction $v_j : Y_j arrow.r Y_(j + 1)$ such that $D_(j + 1) = \( v_j \)_(*) D_j$ and $- D_j$ is $v_j$-ample. These steps extract no prime divisors. On a smooth common model $W$ with projective maps to every $Y_j$ and to the carrier, write $r_j : W arrow.r Y_j$. Then 
#[#set math.equation(numbering: n => "(3.9)")
 $ r_0^(*) D_0 - r_m^(*) D_m = E \, #h(2em) E gt.eq 0 \, #h(2em) \( r_m \)_(*) E = 0 . $ <eq:program-comparison>]

 Every global discrepancy is nondecreasing along the run. If a prime divisor is contracted in a divisorial step, its discrepancy increases strictly at that step, and its discrepancy at the end is strictly larger than before that step.]
] <lem:program-comparison>

#proof[
  For a divisorial step put $E_j = D_j - v_j^(*) D_(j + 1)$. It is exceptional over $Y_(j + 1)$ and has strictly negative degree on every $v_j$-contracted curve. Negativity gives $E_j gt.eq 0$. Every point of an exceptional fiber lies on a curve in that fiber, by the connected projective fiber argument in the proof of Lemma 11. The negative degree therefore forces that point into $"Supp" E_j$. In particular the coefficient of $E_j$ at each contracted prime is positive. Subtracting crepant equations gives nondecreasing discrepancies and this strict increase. For a small step the same assertions, with an effective correction exceptional over its output, follow from Lemma 11.
  Pull the corrections of all steps to $W$ and add them. This gives the effective divisor in (3.9). Each prime in a summand is exceptional over that step’s output, and remains exceptional over every later output. Indeed, if that place became a prime divisor on a later normal model, that prime would have a strict-transform prime on each earlier model, since none of the intervening steps extracts divisors. This contradicts its earlier exceptionality. Thus the sum is exceptional over $Y_m$. Its nonnegative coefficients also show that a strict increase from a contracted prime cannot be canceled later. For $m = 0$ the correction is zero and the assertions are immediate. ◻
]

=== 3.3 A nef end and a prescribed ample model <a-nef-end-and-a-prescribed-ample-model>

An effective correction exceptional over the end is the form needed to compare a finite program with a prescribed positive side of a diagram. The next argument uses the effective-pushforward form of negativity, since the two corrections need not have the same exceptional primes; compare [20] Lemma 2.5 in the projective setting.

#thm([Lemma 3.6.])[
  (Nef and ample models).  #emph[Let $Y_0$, $Y$, and $T_(+)$ be normal irreducible compact Kähler spaces with projective bimeromorphic morphisms to a normal compact Kähler space $S$. On a smooth common model $W$ over $S$, projective over these spaces, let $P_0$, $P$, and $P_(+)$ be the pullbacks of respective $bb(Q)$-Cartier divisors $D_0$, $D_Y$, and $D_(+)$. Suppose that 
$ P_0 = P + E_Y = P_(+) + E_(+) \, $

 where $E_Y gt.eq 0$ is exceptional over $Y$ and $E_(+) gt.eq 0$ is exceptional over $T_(+)$. If $D_Y$ is nef over $S$ and $D_(+)$ is ample over $S$, then $P = P_(+)$ as actual divisors. The induced bimeromorphic map is a projective morphism $phi : Y arrow.r T_(+)$ over $S$, and $D_Y = phi^(*) D_(+)$.]
] <lem:nef-ample>

#proof[
  Write $r : W arrow.r Y$ and $t : W arrow.r T_(+)$, and put $H = P - P_(+) = E_(+) - E_Y$. Then $r_(*) H = r_(*) E_(+) gt.eq 0$. On an $r$-contracted curve, $- H$ has the degree of $P_(+)$, which is nonnegative because the curve lies over a point of $S$. Negativity gives $H gt.eq 0$. Likewise $t_(*) \( - H \) = t_(*) E_Y gt.eq 0$, while $H$ is $t$-nef because $P$ comes from an $S$-nef divisor. Negativity applied to $- H$ gives $H lt.eq 0$. Thus $P = P_(+)$.
  For a curve $C$ in an $r$-fiber, equality gives $t^(*) D_(+) dot.op C = P dot.op C = 0$. The image $t \( C \)$ lies in an $S$-fiber, where $D_(+)$ is ample, so $t \( C \)$ is a point. Every $r$-fiber is projective and connected. If an irreducible component of one such fiber had positive-dimensional image under $t$, a curve in that projective image and projective hyperplane cuts of its inverse image would supply a curve on which $t$ is nonconstant. Thus each component maps to a point, and connectedness makes those points equal. The map $t$ is constant on every $r$-fiber.
  The reduced image of $\( r \, t \) : W arrow.r Y times_S T_(+)$ is a proper analytic graph with one-point fibers over $Y$. Its projection to $Y$ is therefore finite and bimeromorphic, hence an isomorphism by normality of $Y$. This gives the morphism $phi$. Its graph is a closed subspace of $Y times_S T_(+)$, whose projection to $T_(+)$ is projective by base change from $Y arrow.r S$; hence $phi$ is projective. Finally, pushing the equality $P = P_(+)$ to $Y$ gives $D_Y = phi^(*) D_(+)$ as actual divisors. ◻
]

=== 3.4 Ranks of analytic cycle classes <ranks-of-analytic-cycle-classes>

The small-diagram comparison forces a surface on at least one side of every step. The following ranks count the steps after the positive side has no exceptional surface. They also count divisorial steps in the auxiliary programs. Their role is the analytic counterpart of the surface-cycle rank in the terminal fourfold argument of [17] Theorem 5-1-15 and Lemma 5-1-17.

For a compact complex analytic space $V$ and an integer $k gt.eq 0$, put

$ cal(C)_k \( V \) & = "span"_(bb(Q)) { \[ Q \] in H_(2 k) \( V \, bb(Q) \) : Q subset V upright(" irreducible compact analytic") \, med dim Q = k } \,\
c_k \( V \) & = dim_(bb(Q)) cal(C)_k \( V \) . $

Fundamental classes use the complex orientation of the regular loci. Finite compatible triangulations of compact analytic spaces make these ranks finite. If $V$ is compact Kähler, the class of every such $Q$ is nonzero, including when $V$ or $Q$ is singular: for a Kähler form $omega$,

$ chevron.l \[ omega \]^k \, \[ Q \] chevron.r = integral_(Q_(upright("reg"))) omega^k > 0 . $

The same observation applies to a closed analytic subspace of a compact Kähler space. We use ordinary homology on compact spaces and Borel–Moore homology on open complements.

#thm([Lemma 3.7.])[
  (Loss of analytic cycle classes).  #emph[Let $k gt.eq 0$ be an integer, and let $X arrow.r.dashed Y$ be a bimeromorphic transformation of compact Kähler spaces represented by a proper bimeromorphic diagram. Suppose it identifies 
$ U = X \\ A tilde.eq Y \\ B \, $

 where $A$ and $B$ are closed analytic subspaces and $dim B < k$. Then restriction to $U$ and strict transform induce a surjection $cal(C)_k \( X \) arrow.r cal(C)_k \( Y \)$. Consequently $c_k \( X \) gt.eq c_k \( Y \)$, with strict inequality if $A$ contains an irreducible compact analytic subspace of dimension $k$.]
  #emph[In a sequence of bimeromorphic transformations of normal irreducible $n$-dimensional compact Kähler spaces which extract no prime divisors, only finitely many transformations can contract a prime divisor; a small transformation preserves $c_(n - 1)$. In particular, for a small fourfold diagram of Lemma 11, if $dim L^(+) < 2$, then $c_2 \( T \) gt.eq c_2 \( T^(+) \)$, strictly if $L$ contains a surface.]
] <lem:cycle-loss>

#proof[
  This is the rational-coefficient version of [19] Lemma 4.1; we include its localization argument. The Borel–Moore localization sequence for $B subset Y$ contains
  $ H_(2 k) \( B \, bb(Q) \) arrow.r H_(2 k) \( Y \, bb(Q) \) arrow.r H_(2 k)^(upright("BM")) \( U \, bb(Q) \) arrow.r H_(2 k - 1) \( B \, bb(Q) \) . $
  The outside groups vanish by $dim B < k$ and the real dimension bound for an analytic triangulation. Thus restriction from $Y$ is an isomorphism in degree $2 k$. Compose restriction from $X$ with its inverse. An irreducible compact analytic $k$-cycle meeting $U$ is sent to its strict transform on $Y$; analyticity of that transform follows by proper mapping through the given diagram. A cycle contained in $A$ is sent to zero. Conversely, no $k$-cycle of $Y$ is contained in $B$, and its strict transform on $X$ maps to its class. This proves the surjection on cycle spans. If $A$ contains a $k$-dimensional irreducible analytic subspace, its nonzero class is in the kernel, giving strict inequality.
  For a transformation that extracts no prime divisors, choose the common isomorphism open with target complement of codimension at least two. Every contracted source prime lies in the source complement. The preceding result with $k = n - 1$ gives a strict drop at each such contraction. The ranks are nonnegative integers, so there can be only finitely many drops. For a small transformation both complements have codimension at least two, and applying the result in both directions gives equality. Finally, (3.4) gives the common open for a small fourfold diagram. Applying the first assertion with $k = 2$, $A = L$ and $B = L^(+)$ proves the last claim. ◻
]

== 4 Terminal junctions and surface centers <sec:junctions>

We now work with a sequence of small diagrams on strong models, and assume that its initial generalized pair is generalized klt. The purpose of this section is to replace the models in the sequence by crepant generalized terminal models. Consecutive terminal models will be joined by a decrease of boundary coefficients followed by a finite sequence of small elementary steps. We then show that, after discarding finitely many diagrams, every coefficient that still changes belongs to a divisor contracted to a curve or a point. The terminal-junction construction follows the method of [20] Section 3, Proposition 3.4; the surface calculation below supplies the control of coefficient variation needed in the present analytic setting.

Throughout this section, write the diagrams as

$ X_i arrow.r^(f_i) Z_i arrow.l^(f_i^(+)) X_(i + 1) \, #h(2em) D_i = K_(X_i) + B_i + M_(X_i) \, $

and put $a_i \( E \) = a \( E \; X_i \, B_i + upright(bold(M)) \)$ for a global place $E$. We retain all the hypotheses on the diagrams and on the fixed nef b-divisor from Theorem 1. In addition, each $X_i$ is strong and $\( X_0 \, B_0 + upright(bold(M)) \)$ is generalized klt. The exceptional loci of $f_i$ and $f_i^(+)$ are denoted by $L_i$ and $L_i^(+)$, respectively. Here the initial boundary and higher nef datum belong to the particular strong generalized klt sequence under study; a later application may use the data of a tail obtained after removing a boundary floor.

#thm([Proposition 4.1.])[
  (Crepant terminal junctions).  #emph[Suppose that the sequence above is infinite. After passing to a tail, there are a number $epsilon > 0$ and a finite set $cal(I)$ of global places such that, at every remaining index $i$, 
#[#set math.equation(numbering: n => "(4.1)")
 $ a_i \( E \) gt.eq epsilon quad upright("for every global place ") E \,\
cal(I) = { E : E upright(" is exceptional over ") X_i \, med a_i \( E \) lt.eq 1 } . $ <eq:stable-low-places>]

 There are projective bimeromorphic crepant morphisms 
#[#set math.equation(numbering: n => "(4.2)")
 $ h_i : \( Y_i \, Theta_i + upright(bold(M)) \) arrow.r \( X_i \, B_i + upright(bold(M)) \) \,\
K_(Y_i) + Theta_i + M_(Y_i) = h_i^(*) D_i \, $ <eq:terminal-junction>]

 with the following properties.]
  + #emph[Each $Y_i$ is a strong normal irreducible compact Kähler fourfold, $Theta_i$ is effective, and $\( Y_i \, Theta_i + upright(bold(M)) \)$ is generalized terminal. The exceptional prime divisors of $h_i$ represent exactly the places in $cal(I)$.]
  + #emph[For $E in cal(I)$, let $S_(i \, E)$ be its prime on $Y_i$. Define 
#[#set math.equation(numbering: n => "(4.3)")
 $ Theta'_i = Theta_i - sum_(E in cal(I)) #scale(x: 120%, y: 120%)[\(] a_(i + 1) \( E \) - a_i \( E \) #scale(x: 120%, y: 120%)[\)] S_(i \, E) . $ <eq:junction-coefficient-change>]

 Starting with $\( Y_i \, Theta'_i + upright(bold(M)) \)$, a finite, possibly empty, sequence of small elementary steps over $Z_i$ ends at $\( Y_(i + 1) \, Theta_(i + 1) + upright(bold(M)) \)$. All its models are strong normal irreducible compact Kähler fourfolds, all its pairs are generalized terminal, and its boundary and nef data are transported as in an elementary program. In particular, every global place is exceptional over one model of this connecting sequence if and only if it is exceptional over all of them.]
  + #emph[There is one finite label set $cal(H)$ for the primes supplied by $cal(I)$ and by the components of $B_0$. Write $S_h$ for the current strict transform of a label and $b_h$ for its current coefficient. Labels are retained when their coefficient is zero. On the entire chain of coefficient changes and small steps, 
$ Theta = sum_(h in cal(H)) b_h S_h \, #h(2em) 0 lt.eq b_h < 1 \, $

 and every $b_h$ is nonincreasing. Call a label #emph[varying] if its coefficient sequence is not eventually constant, and #emph[fixed] otherwise. After a further tail is chosen, all fixed coefficients are constant. Every varying label comes from $cal(I)$ and has positive coefficient at every remaining stage.]
] <prop:terminal-junctions>

Figure 1 records the two kinds of change between crepant junctions. The difficulty in Section 6 will be compared across both upper moves.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$\( Y_i \, Theta_i \)$])
  content((4.994, 0), [$\( Y_i \, Theta'_i \)$])
  content((10.25, 0), [$\( Y_(i + 1) \, Theta_(i + 1) \)$])
  content((0, -1.585), [$X_i$])
  content((4.994, -1.585), [$Z_i$])
  content((10.25, -1.585), [$X_(i + 1)$])
  line((0.864, 0), (4.064, 0), mark: (end: ">"))
  content((2.464, 0.2266), [#text(size: 0.73em)[$Theta'_i lt.eq Theta_i$]])
  line((0, -0.2725), (0, -1.313), mark: (end: ">"))
  content((-0.4186, -0.7927), [#text(size: 0.73em)[$h_i$]])
  line((5.924, 0), (9.124, 0), stroke: (dash: "dashed"), mark: (end: ">"))
  content((7.524, 0.2266), [#text(size: 0.73em)[$upright("finite small program")$]])
  line((10.25, -0.2725), (10.25, -1.313), mark: (end: ">"))
  content((10.77, -0.7927), [#text(size: 0.73em)[$h_(i + 1)$]])
  line((0.468, -1.585), (4.526, -1.585), mark: (end: ">"))
  content((2.497, -1.812), [#text(size: 0.73em)[$f_i$]])
  line((9.652, -1.585), (5.462, -1.585), mark: (end: ">"))
  content((7.557, -1.812), [#text(size: 0.73em)[$f_i^(+)$]])
})],
  caption: [Figure 1: The bridge for one downstairs flip. The first upper arrow changes the boundary on the same space; it is not a morphism. The second denotes a finite, possibly empty, sequence of small elementary steps over $Z_i$. The two vertical maps are crepant for the displayed endpoint boundaries, and the b-divisor $upright(bold(M))$ is fixed throughout. ],
) <fig:terminal-bridge>

#proof[
  By Lemma 11, discrepancies do not decrease, and a place is exceptional over $X_i$ exactly when it is exceptional over $X_(i + 1)$. Consequently the sets
  $ cal(I)_i = { E : E upright(" is exceptional over ") X_i \, med a_i \( E \) lt.eq 1 } $
  form a decreasing sequence. Proposition 3 makes the first of them finite and gives a positive lower bound for all initial discrepancies. Monotonicity preserves that bound. A decreasing sequence of subsets of a finite set stabilizes, which gives (4.1). We reindex this tail.
  If $cal(I)$ is empty, take the identity as the first junction. Otherwise apply Proposition 4 at the first index to extract exactly $cal(I)$. Its hypotheses hold: the model is strong, the pair is generalized klt with rational effective boundary, and the fixed nef data are carried on a higher model projective over $X_i$. The resulting morphism is projective bimeromorphic and has a strong normal irreducible compact Kähler source. Crepancy gives the coefficient $1 - a_i \( E \) in \[ 0 \, 1 - epsilon \]$ on an extracted prime; all other boundary components are strict transforms of $B_i$. Thus the crepant boundary is effective. Notice that a place with $a_i \( E \) = 1$ is extracted with coefficient zero.
  Any place exceptional over this source is exceptional over $X_i$: a prime on $X_i$ has a strict transform on every proper birational model. Such a place is not one of the extracted primes, so its discrepancy is strictly greater than $1$ by (4.1). Crepancy and the positive lower bound prove generalized terminality. This constructs the first junction.
  Suppose the junction over $X_i$ has been constructed. The coefficient of $S_(i \, E)$ changes in (4.3) from $1 - a_i \( E \)$ to $1 - a_(i + 1) \( E \)$. Both are nonnegative because $E$ belongs to the stabilized set at both indices, and the latter is no larger than the former. The divisor subtracted from $Theta_i$ is effective and $bb(Q)$-Cartier on the strong model $Y_i$. Its pullback to a higher model is effective; hence subtracting it only increases discrepancies. In particular, $Theta'_i$ remains effective and $\( Y_i \, Theta'_i + upright(bold(M)) \)$ remains generalized terminal. Set
  $ D'_i = K_(Y_i) + Theta'_i + M_(Y_i) . $
  We first compare this adjoint with the positive model downstairs. By Lemma 8, choose a smooth common model $W$, carrying $upright(bold(M))$, with projective maps $q : W arrow.r Y_i$ and $r : W arrow.r X_(i + 1)$, all over $Z_i$, and put
  #[#set math.equation(numbering: n => "(4.4)")
   $ F = q^(*) D'_i - r^(*) D_(i + 1) . $ <eq:junction-positive-comparison>]
  The coefficient change makes $q_(*) F = 0$. Indeed, at a prime $S_(i \, E)$ with $E in cal(I)$, the coefficient of the crepant boundary computed from $X_(i + 1)$ is $1 - a_(i + 1) \( E \)$, the new coefficient in $Theta'_i$. Every other prime on $Y_i$ corresponds, by smallness downstairs, to a prime on $X_(i + 1)$ and has its transported boundary coefficient. The canonical representatives and the trace of the same b-divisor agree in this calculation. On a curve contracted by $q$, the divisor $- F$ has nonnegative degree: $q^(*) D'_i$ has degree zero and $r^(*) D_(i + 1)$ is pulled back from the $f_i^(+)$-ample divisor $D_(i + 1)$. The negativity lemma therefore gives $F gt.eq 0$. Moreover every prime on $X_(i + 1)$ is represented on $Y_i$, where the coefficient of $F$ is zero. Thus $F$ is exceptional over $X_(i + 1)$.
  Use the finite generalized klt part of Proposition 5 for $D'_i$ over $Z_i$. The map $Y_i arrow.r Z_i$ is projective bimeromorphic to a normal compact Kähler base, the source is strong and generalized klt, and a common higher model projective over $Y_i$ carries the fixed data with the required relative nefness. The proposition supplies a finite elementary program ending at a model $overline(Y)$ whose adjoint $overline(D)$ is nef over $Z_i$. On a further common model, write again $q$ for the map to $Y_i$ and $macron(q)$ for the map to $overline(Y)$. Lemma 12 gives
  $ q^(*) D'_i = macron(q)^(*) overline(D) + G \, #h(2em) G gt.eq 0 upright(" exceptional over ") overline(Y) . $
  Together with (4.4), these are the two effective comparisons required by Lemma 13. That lemma gives a projective morphism $h_(i + 1) : overline(Y) arrow.r X_(i + 1)$ and the actual crepant identity $overline(D) = h_(i + 1)^(*) D_(i + 1)$.
  This program cannot have lost a marked prime $S_(i \, E)$. Its discrepancy immediately after the coefficient change is $a_(i + 1) \( E \)$; by the crepant identity its discrepancy at the end is again $a_(i + 1) \( E \)$. If a divisorial step had contracted it, the strict comparison for that step would have increased this discrepancy, and subsequent comparisons could not decrease it. Nor can the program have lost any other prime on $Y_i$. Such a prime corresponds to a prime on $X_(i + 1)$, and that prime must have a strict transform on $overline(Y)$. An elementary program extracts no prime, so a prime once contracted cannot reappear. We have excluded every divisorial step. All connecting steps are therefore small, and their discrepancy comparisons preserve generalized terminality. They also preserve the exceptionality status of every place. Smallness downstairs keeps each marked place exceptional over $X_(i + 1)$, whereas every other surviving prime corresponds to a prime on $X_(i + 1)$. Thus the surviving marked primes are exactly the exceptional primes of $h_(i + 1)$, and the end is the required junction $Y_(i + 1)$. This proves the construction by induction. The relative program is allowed to have length zero.
  There are finitely many marked primes and finitely many components of $B_0$. Smallness transports all of them through every connector. The downstairs coefficients are constant, and the marked coefficients are $1 - a_i \( E \)$ at junctions and are changed only by (4.3). They are therefore nonincreasing and lie in $\[ 0 \, 1 \)$. For the finitely many coefficient sequences that are eventually constant, discard a prefix after all have become constant. Every other sequence stays positive: a nonnegative nonincreasing sequence that reaches zero is thereafter zero. Only marked coefficients can be of this latter type. This proves the last assertion. ◻
]

All the terminal models just constructed are also ordinarily terminal by Lemma 10. In particular they are smooth in codimension two. To control marked coefficients above a surface, we need no bound on the number of exceptional curves in a transverse slice. Grouping the curves by their global marked labels will give a linear system with at most $\| cal(I) \|$ unknowns and an integer matrix whose columns are linearly independent. We will bound its entries and clear one denominator for its right-hand side; a nonsingular minor then gives a uniform lattice for the marked coefficients.

#thm([Proposition 4.2.])[
  (Finiteness above marked surfaces).  #emph[In the setting of Proposition 15, there is a finite set 
$ cal(A)_(upright("surf")) subset \[ epsilon \, 1 \] ∩ bb(Q) $

 such that $a_i \( E \) in cal(A)_(upright("surf"))$ whenever $E in cal(I)$ and $"cent"_(X_i) \( E \)$ is a surface. After passing to a further tail, the following conclusions hold.]
  + #emph[No $E in cal(I)$ has a surface center contained in $L_i$ on $X_i$, or a surface center contained in $L_i^(+)$ on $X_(i + 1)$.]
  + #emph[Every varying label $S_h subset Y_i$ satisfies $dim h_i \( S_h \) lt.eq 1$ at every junction.]
  + #emph[For an irreducible compact analytic surface contained in either $L_i$ or $L_i^(+)$, the corresponding junction morphism is an isomorphism near its general point, and the downstairs model is smooth there. Blowing up the coherent ideal of that surface defines a unique global generic blowup place. It is exceptional over the corresponding downstairs model and has discrepancy strictly greater than $1$; in particular it does not belong to $cal(I)$.]
] <prop:surface-finiteness>

#proof[
  We first prove the assertion about $cal(A)_(upright("surf"))$. If $cal(I)$ is empty, choose $cal(A)_(upright("surf")) = diameter$. For the remaining case, fix a junction $rho : Y arrow.r X$ and a surface $V subset X$ which is the center of at least one marked prime. We work near general points of $V$.
  #emph[A transverse surface and its curves.] The exceptional image of a proper birational morphism to normal $X$ has codimension at least two. We may avoid every other component of that image and every center properly contained in $V$. The full inverse image of $V$ is a proper analytic subset of the irreducible fourfold $Y$, hence has dimension at most three. A component supplying a curve over a general point of $V$ must therefore have dimension three and be a divisor dominating $V$. All such divisors are marked. Components of dimension at most two cannot supply a curve in a general fiber. These observations also show that the general fibers over $V$ have dimension at most one.
  The singular locus of terminal $Y$ has dimension at most one, so it misses the fiber over a general point of $V$. The singular loci of the marked divisors, their pairwise intersections, and their intersections with strict transforms of components of $B_0$ have dimension at most two. Choose also a projective carrier $sigma : W arrow.r Y$ for the fixed nef data, with $W$ smooth. Its nonisomorphism image has dimension at most two. None of these subsets can contain an entire curve over a general point of $V$: a component that dominates the surface has zero-dimensional general fiber, and components with smaller image can be avoided.
  Here is a precise choice of the slice used below. Near a general smooth point of $V$, lift two local coordinates on $V$ to holomorphic functions on $X$. Take a general common level set of their pullbacks on $Y$. Finite analytic stratifications near the proper fiber can be chosen to respect the divisors and the subsets in the preceding paragraph. On every stratum dominating $V$, generic smoothness makes the two pulled-back functions submersive over general values; the images of all other strata can be avoided. It follows, after shrinking about the fiber, that the level set is a smooth surface $R$. The restriction of $K_Y$ to $R$ is $K_R$, because the two slice equations trivialize its normal bundle.
  Let $C_1 \, dots.h \, C_q$ be the reduced irreducible curves of the fiber in $R$. Each is supplied by exactly one marked divisor, with multiplicity one in that divisor’s slice: at a general point of the curve the divisor is smooth, the slice is transverse on it, and none of the other listed subsets contains that curve. Write $lambda \( j \)$ for its label. The same label may supply several curves, but each marked divisor with center $V$ supplies at least one. No $C_j$ is contained in a strict downstairs boundary component or in the nonisomorphism image of $sigma$.
  The restricted map on the slice is proper near this fiber, contracts the $C_j$ to a point, and is an isomorphism off that point locally. No surface component is mapped to the point, by the fiber dimension bound. Pass, if necessary, to the normal Stein factor of the local target, or equivalently to the normalization of the relevant local image. We then have a proper modification from the smooth surface whose reduced exceptional set is the union of these curves. Grauert’s negative-definiteness criterion [12] Section 4, no. 8(e), pp. 366–367 therefore applies: the matrix
  $ A = \( C_j dot.op C_k \)_(1 lt.eq j \, k lt.eq q) $
  is negative definite. Put $u_j = - C_j^2 in bb(Z)_(> 0)$ and $m_(j k) = C_j dot.op C_k in bb(Z)_(gt.eq 0)$ for $j eq.not k$.
  #emph[Uniform bounds for the intersection equations.] Let $B_Y^(upright("str"))$ denote the strict boundary part coming from $B_i$. It has nonnegative intersection with every $C_j$, since it is effective and contains no such curve. The same nonnegativity holds for $M_Y$. Indeed, the strict transform $C'_j$ on $W$ meets the isomorphism locus of $sigma$. For the effective nef defect of Lemma 9,
  $ J = sigma^(*) M_Y - M_W gt.eq 0 \, $
  the curve $C'_j$ is not contained in $"Supp" J$. The projection formula, nefness on the carrier, and effectivity then give
  $ M_Y dot.op C_j = M_W dot.op C'_j + J dot.op C'_j gt.eq 0 . $
  Intersect the crepant equation $K_Y + Theta + M_Y = rho^(*) D_X$ with $C_j$. On $R$ the marked part near the fiber is $sum_k b_(lambda \( k \)) C_k$. Adjunction for the reduced irreducible compact curve $C_j$ gives $K_R dot.op C_j = 2 p_a \( C_j \) - 2 + u_j$. We obtain
  $ 0 =  & 2 p_a \( C_j \) - 2 + \( 1 - b_(lambda \( j \)) \) u_j + sum_(k eq.not j) b_(lambda \( k \)) m_(j k) + \( B_Y^(upright("str")) + M_Y \) dot.op C_j\
gt.eq  & 2 p_a \( C_j \) - 2 + \( 1 - b_(lambda \( j \)) \) u_j . $
  Since $p_a \( C_j \) gt.eq 0$ and $1 - b_(lambda \( j \)) gt.eq epsilon$, it follows that
  #[#set math.equation(numbering: n => "(4.5)")
   $ \( 1 - b_(lambda \( j \)) \) u_j lt.eq 2 - 2 p_a \( C_j \) lt.eq 2 \, #h(2em) u_j lt.eq U := ⌈2 / epsilon⌉ . $ <eq:surface-self-intersection-bound>]
  Negative definiteness now bounds each whole row of $A$, even when $q$ is large. Fix $j$ and test its quadratic form on the vector whose $j$th entry is $1$ and whose $k$th entry is $m_(j k) \/ u_k$ for $k eq.not j$. Its value is
  $ - u_j + sum_(k eq.not j) m_(j k)^2 / u_k + 2 sum_(k < ell\
k \, ell eq.not j) frac(m_(k ell) m_(j k) m_(j ell), u_k u_ell) < 0 . $
  The last sum is nonnegative. Therefore
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(k eq.not j) m_(j k)^2 / u_k < u_j \, #h(2em) sum_(k eq.not j) m_(j k) lt.eq sum_(k eq.not j) m_(j k)^2 < U^2 . $ <eq:surface-row-bound>]
  The second inequality uses $u_k lt.eq U$ and the integrality and nonnegativity of every $m_(j k)$. The absolute sum in each row of $A$ is thus at most $C_(upright("row")) := U + U^2$.
  #emph[Grouping curves by global labels.] Let $cal(H)_V$ be the marked labels whose center is $V$, and put $t = \| cal(H)_V \| lt.eq \| cal(I) \|$. Define the $q$-by-$t$ zero-one matrix $P$ by
  $ P_(k \, h) = cases(delim: "{", 1 \, & lambda \( k \) = h \,, 0 \, & lambda \( k \) eq.not h .) $
  Its columns have disjoint nonempty supports, so $P$ has column rank $t$. Since $A$ is invertible, $A P$ has the same column rank. Each of its integer entries is a sum from one row of $A$, and hence has absolute value at most $C_(upright("row"))$. The intersection equations take the form
  #[#set math.equation(numbering: n => "(4.7)")
   $ \( A P \) \( b_h \)_(h in cal(H)_V) = - \( v_j \)_(1 lt.eq j lt.eq q) \,\
v_j = K_R dot.op C_j + \( B_Y^(upright("str")) + M_Y \) dot.op C_j . $ <eq:grouped-surface-equations>]
  No marked coefficient occurs in the right-hand side.
  There is a fixed integer $m_(upright("data")) > 0$ such that every $m_(upright("data")) v_j$ is integral, for every junction and surface in this calculation. Choose it to clear the initial boundary coefficients of this strong generalized klt sequence and to make its chosen higher nef divisor integral Cartier. Canonical degrees on the smooth $R$ are integral. Each strict boundary prime is Cartier in the smooth neighborhood of the fiber, so its degree has the chosen boundary denominator. Finally, the trace of the integral Cartier divisor $m_(upright("data")) upright(bold(M))$ on any model is an integral Weil divisor: compute it by pulling back to a common higher model and pushing forward. On the smooth neighborhood of the present fiber that trace is Cartier, so its degree is integral as well. No assertion about its Cartier index elsewhere is needed.
  Choose $t$ rows of $A P$ giving a nonsingular square matrix. Its determinant is a nonzero integer with an absolute value bounded in terms of $t$ and $C_(upright("row"))$, for example by $t^(t \/ 2) C_(upright("row"))^t$ by Hadamard’s inequality. Since $1 lt.eq t lt.eq \| cal(I) \|$, choose one integer $H_(upright("det"))$ bounding all these absolute values. Cramer’s rule applied to (4.7) then gives
  $ q_(upright("surf")) = m_(upright("data")) "lcm" \( 1 \, 2 \, dots.h \, H_(upright("det")) \) \,\
b_h in q_(upright("surf"))^(- 1) bb(Z) #h(2em) \( h in cal(H)_V \) . $
  The denominator is independent of the junction, the surface, and the number of geometric curves in the slice. In particular the marked discrepancies above surfaces belong to the finite set
  #[#set math.equation(numbering: n => "(4.8)")
   $ cal(A)_(upright("surf")) = \[ epsilon \, 1 \] ∩ q_(upright("surf"))^(- 1) bb(Z) . $ <eq:marked-surface-discrepancies>]
  This finite set is used only to exclude recurring marked surface centers contained in the exceptional loci. The weight denominator in Section 6 will be chosen later from the actual fixed coefficients and the initial rational data; it need not clear every element of $cal(A)_(upright("surf"))$.
  #emph[Removing marked surface centers from the exceptional loci.] Fix $E in cal(I)$. Suppose its center is a surface in $L_i$ at infinitely many indices $i_1 < i_2 < dots.h.c$. The strict comparison at $i_k$ and monotonicity between indices give
  $ a_(i_(k + 1)) \( E \) gt.eq a_(i_k + 1) \( E \) > a_(i_k) \( E \) . $
  Both $a_(i_k) \( E \)$ and $a_(i_(k + 1)) \( E \)$ belong to $cal(A)_(upright("surf"))$, a contradiction. If instead its center is a surface in $L_i^(+)$ at infinitely many indices, the corresponding positive-side discrepancies satisfy
  $ a_(i_(k + 1) + 1) \( E \) > a_(i_(k + 1)) \( E \) gt.eq a_(i_k + 1) \( E \) \, $
  again contradicting membership of $a_(i_k + 1) \( E \)$ and $a_(i_(k + 1) + 1) \( E \)$ in the same finite set. There are finitely many $E in cal(I)$, so one tail excludes all such occurrences on both sides. This proves assertion (1).
  On that tail, suppose a marked prime has a surface center $V$ at a junction over $X_i$. Assertion (1) says $V$ is not contained in $L_i$. Its general point is therefore in the common isomorphism open of the next diagram. The next center is its strict transform, still a surface, and Lemma 11 gives equality of its two discrepancies. Repeating the argument at every subsequent index shows that its coefficient is constant from this index onward. A varying label cannot have such a surface center. Its center cannot be a divisor downstairs because it represents an exceptional place. This proves assertion (2).
  Finally let $V$ be an irreducible compact analytic surface in one of the exceptional loci of a remaining diagram, and use the junction on that side. If the junction were not an isomorphism at the general point of $V$, its general fiber there would be positive dimensional: a proper birational morphism to a normal space is an isomorphism wherever it is finite. A component supplying those curves over $V$ would be a divisor with center $V$, by the dimension argument at the start of the proof. This is excluded by assertion (1). Thus the junction is an isomorphism near a general point of $V$. The source is ordinarily terminal and smooth in codimension two, so the downstairs model is smooth at a general point of this surface.
  The coherent ideal of the global analytic surface $V$ has a projective blowup. Over the dense open where the ambient model and $V$ are smooth, this is the ordinary codimension-two blowup and has a unique prime divisor dominating $V$. Its closure on the normalized blowup defines a global place with center $V$, hence an exceptional place on the downstairs model. If its discrepancy were at most $1$, it would belong to the stabilized set $cal(I)$, contradicting assertion (1). This proves assertion (3). ◻
]

At each remaining junction, the reduced union of the varying labels is contracted by $h_i$ to a set of dimension at most one. This is the input for Theorem 17. Assertion (3) has a separate later use: over a surface in the positive exceptional locus of a downstairs diagram, it supplies the global generic blowup place and the smooth downstairs neighborhood used by the detector in Section 7.

== 5 The branch inequality <sec:branch>

The terminal junctions constructed in Section 4 have only finitely many boundary labels, but one label can have several normalization branches along a surface. We need to control the total number of these branches for the labels whose images downstairs are curves or points. The estimate in this section applies to an arbitrary union of exceptional divisors with that image-dimension bound; it does not use a boundary or a crepant equation.

Let $p : Y arrow.r X$ be a projective bimeromorphic morphism of normal irreducible compact Kähler fourfolds, with $Y$ ordinary terminal. Let

$ Q = union.big_(j = 1)^m Q_j subset Y $

be a reduced union of distinct irreducible divisors, with $m gt.eq 0$, and assume that $dim p \( Q \) lt.eq 1$. Write $nu_j : Q_j^nu arrow.r Q_j$ for normalization and $nu : product.co_j Q_j^nu arrow.r Q$ for their disjoint union. For an irreducible compact analytic surface $V subset Q$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ r_V \( Q \) & = \# { F : med F upright(" is a prime divisor of ") product.co_j Q_j^nu \, med nu \( F \) = V } \,\
beta \( Q \) & = sum_(V subset Q\
dim V = 2) \( r_V \( Q \) - 1 \) . $ <eq:branch-count-definition>]

The surface $V$ is counted once in the sum, regardless of which $Q_j$ contain it. A normalization divisor mapping to $V$ with degree greater than one counts once in $r_V \( Q \)$; that degree will instead enter a pushforward map in the proof. The sum in (5.1) will be shown to have only finitely many nonzero terms.

Recall that a global place over $Y$ is a prime divisor on a normal proper bimeromorphic model, with primes identified by strict transform on a common higher model. Put

#[#set math.equation(numbering: n => "(5.2)")
 $ tau_Y \( Q \) = \# mat(delim: "{", E upright(" a global place over ") Y :; "cent"_Y \( E \) upright(" is an irreducible curve contained in ") "Sing" Y ∩ Q \, quad a \( E \; Y \, 0 \) = 2) . $ <eq:branch-place-count>]

Here $a \( E \; Y \, 0 \)$ is the ordinary log discrepancy, defined intrinsically by the natural meromorphic comparisons of rational canonical bundles on birational models. Thus $tau_Y \( Q \)$ counts global divisors, rather than divisors visible only over a neighborhood of a point of a singular curve.

#thm([Theorem 5.1.])[
  (Branch inequality).  #emph[Let $p : Y arrow.r X$ be a projective bimeromorphic morphism of normal irreducible compact Kähler fourfolds, where $Y$ has ordinary terminal singularities. Let $Q = union.big_(j = 1)^m Q_j$ be a reduced union of distinct irreducible divisors satisfying $dim p \( Q \) lt.eq 1$. Then the sum defining $beta \( Q \)$ and the count defining $tau_Y \( Q \)$ are finite, and 
#[#set math.equation(numbering: n => "(5.3)")
 $ beta \( Q \) lt.eq sum_(j = 1)^m c_2 \( Q_j^nu \) + tau_Y \( Q \) . $ <eq:branch-inequality>]

 The rank $c_2 \( Q_j^nu \)$ is the rational rank spanned in $H_4 \( Q_j^nu \, bb(Q) \)$ by the fundamental classes of compact irreducible analytic surfaces.]
] <thm:branch>

At a terminal junction, Section 6 will take $Q$ to be the union of varying labels and prove that rounding can leave an integer deficit of at most $r_V \( Q \) - 1$ at each surface $V subset Q$. Thus $beta \( Q \)$ bounds the total possible deficit. The same section shows that the terms from normalization ranks and exceptional weights together contribute at least the right-hand side of (5.3).

The proof first relates the normalization branches to the weight-four part of a degree-five cohomology map. A smooth resolution then confines that part to degree-two cohomology of punctured neighborhoods along the singular curves of $Y$. The remaining argument converts those local classes into the global places counted by (5.2). The normalization method follows the projective branch argument of [20] Section 5, especially Lemma 5.2. Here the ambient fourfolds may be nonprojective, so we supply the analytic and Hodge-theoretic steps needed in that setting.

Unless other coefficients are displayed, homology and cohomology in the rest of this section have rational coefficients and refer to the complex analytic topology. We omit $bb(Q)$ from their notation when this causes no ambiguity. If $Q$ is empty, all terms in (5.3) vanish. We henceforth assume $Q eq.not diameter$.

=== 5.1 Projectivity over the center and normalization relations <projectivity-over-the-center-and-normalization-relations>

To compare normalization relations on $Q$ with cohomology that a resolution can control, enlarge $Q$ to the full inverse image of its center. Set

#[#set math.equation(numbering: n => "(5.4)")
 $ C = p \( Q \)_(upright("red")) \, #h(2em) P = \( p^(- 1) C \)_(upright("red")) . $ <eq:branch-projective-loci>]

Properness makes $C$ a compact analytic subset of $X$. Its components are compact curves and possibly isolated points. The comparison will use $H^5 \( P \) arrow.r H^5 \( Q \)$. We first show that these spaces over $C$ are projective even when $X$ and $Y$ are not.

Choose on each curve component of $C$ a smooth point that lies on no other component. Their sum is a Cartier divisor on $C$, and its line bundle has positive degree on every curve component. The ampleness criterion for reduced compact analytic curves says that this positivity is exactly ampleness; isolated point components impose no condition. One can see why singularities introduce no additional obstruction by normalizing $C$. Write $nu_C : C^nu arrow.r C$ for this map. Its source is a disjoint union of compact Riemann surfaces and points, and

$ 0 arrow.r cal(O)_C arrow.r nu_(C *) cal(O)_(C^nu) arrow.r cal(F) arrow.r 0 $

has a quotient $cal(F)$ supported at finitely many points. On the Riemann surfaces, a sufficiently high power of the chosen line bundle separates points and any fixed finite set of jets by Riemann–Roch. The conditions for these sections to descend to $C$ are the finitely many gluing conditions measured by $cal(F)$. Applying the same jet separation to them gives the compact-curve criterion and a projective embedding of $C$.

We will also use the following form of the relative-embedding criterion. Suppose that $q : R arrow.r C$ is projective and has a global relatively ample holomorphic line bundle $H$. Compactness of $C$ permits one common power $H^n$ for the relative embeddings on a finite cover of $C$. Its relative sections give a closed immersion

$ R arrow.r.hook bb(P)_C \( q_(*) H^n \) . $

Here the direct image is coherent by properness, and the relative projective space is allowed to come from a coherent sheaf. If $A$ is an ample line bundle on $C$, then $q_(*) H^n ⊗ A^k$ is globally generated for $k$ sufficiently large: algebraize the coherent sheaf on the projective $C$ by GAGA [24] Section 12, Theorems 1–3 and apply the usual global-generation criterion. A surjection from a finite free sheaf onto it embeds its projective space, and hence $R$, in $C times bb(P)^N$ for some $N$. An embedding of $C$ and the Segre embedding now make $R$ projective. This reasoning applies to reducible spaces and to nonreduced closed subspaces as well. GAGA algebraizes their coherent ideals, and also algebraizes holomorphic morphisms between the resulting projective spaces.

Apply this argument to the base change $P arrow.r C$. It shows that $P$ is projective. The closed analytic subspaces $Q$ and $Q_j$ are then projective by GAGA, and the finite normalization $Q_j^nu arrow.r Q_j$ is projective (as every finite morphism is), so each $Q_j^nu$ is projective as well. In particular, all these spaces and all the maps between them may now be treated as algebraic for purposes of mixed Hodge theory.

The normalization comparison requires a pure threefold containing $Q$. Let $P_1$ be the reduced union of the three-dimensional components of $P$. The preimage of the proper analytic subset $C subset X$ is a proper analytic subset of the irreducible fourfold $Y$, so its components have dimension at most three. Each $Q_j$ has dimension three and is one of those components. Thus

$ Q subset P_1 subset P \, #h(2em) dim \( P \\ P_1 \) lt.eq 2 . $

These observations also apply when $C$ consists only of points.

For a projective variety $R$, the mixed Hodge structure on $H_k \( R \)$ is dual to that on $H^k \( R \)$. We write $W_bullet$ for the weight filtration on either group. For a map of such groups, $"rk" "Gr"_a^W \[ thin dot.op thin \]$ will mean the rank of its induced map on the weight-$a$ graded pieces. If $R$ has dimension at most two, then $H_4 \( R \)$ has the fundamental classes of its irreducible surface components as a basis. It is pure of weight $- 4$: these classes are the pushforwards of the top classes of smooth projective resolutions of the components, which have that weight; see also [7] Theorem 8.2.4(ii)–(iii).

#thm([Lemma 5.2.])[
  (Normalization relations).  #emph[For the spaces in (5.4), the sum defining $beta \( Q \)$ is finite and 
#[#set math.equation(numbering: n => "(5.5)")
 $ beta \( Q \) - sum_j c_2 \( Q_j^nu \) lt.eq "rk" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] . $ <eq:branch-normalization-bound>]

]
] <lem:branch-normalization>

#proof[
  For a reduced pure projective threefold $R$, write $nu_R : N_R arrow.r R$ for normalization. Choose a closed reduced subset $A_R subset R$ of dimension at most two containing the locus where $nu_R$ is not an isomorphism, and put $F_R = \( nu_R^(- 1) A_R \)_(upright("red"))$. The square
  #cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$F_R$])
  content((1.86, 0), [$N_R$])
  content((0, -1.239), [$A_R$])
  content((1.86, -1.239), [$R$])
  line((0.468, 0), (1.392, 0), mark: (end: ">"))
  line((0.468, 0), (0.468, 0.3))
  line((0, -0.2725), (0, -0.9661), mark: (end: ">"))
  line((1.86, -0.2725), (1.86, -0.9661), mark: (end: ">"))
  content((2.23, -0.6193), [#text(size: 0.73em)[$nu_R$]])
  line((0.468, -1.239), (1.524, -1.239), mark: (end: ">"))
  line((0.468, -1.239), (0.468, -0.9386))
})
  is a proper excision square. Indeed $nu_R$ is finite and proper and identifies the open complements. Collapsing the two closed subsets gives a continuous bijection $N_R \/ F_R arrow.r R \/ A_R$ of compact Hausdorff quotients, hence a homeomorphism. Comparing the two relative homology sequences gives the exact sequence
  #[#set math.equation(numbering: n => "(5.6)")
   $ H_5 \( R \) arrow.r^(partial_R) H_4 \( F_R \) arrow.r H_4 \( A_R \) xor H_4 \( N_R \) . $ <eq:branch-normalization-excision>]
  All its maps are compatible with mixed Hodge structures. This follows from algebraic functoriality and the exact sequence of relative cohomology as a sequence of mixed Hodge structures [7] Propositions 8.2.2 and 8.3.9, followed by duality on these compact spaces.
  Take this square first for $P_1$. For $Q$, take $A_Q = Q ∩ A_(P_1)$. The normalization $N_Q = product.co_j Q_j^nu$ is a union of entire, disjoint normalization components of $N_(P_1)$. Thus these choices give a morphism of the two squares, with $F_Q$ equal to the part of $F_(P_1)$ in those selected components.
  For a surface component $V$ of $A_Q$, let $F_(V \, 1) \, dots.h \, F_(V \, r_V \( Q \))$ be the surface components of $F_Q$ mapping onto it, and let $d_(V \, alpha) > 0$ be their finite degrees over $V$. On top homology the corresponding part of the map to $A_Q$ is
  $ xor.big_(alpha = 1)^(r_V \( Q \)) bb(Q) \[ F_(V \, alpha) \] arrow.r bb(Q) \[ V \] \, #h(2em) sum_alpha t_alpha \[ F_(V \, alpha) \] mapsto (sum_alpha d_(V \, alpha) t_alpha) \[ V \] . $
  Its kernel has dimension $r_V \( Q \) - 1$. A surface not contained in $A_Q$ has exactly one normalization divisor over it, since the normalization is an isomorphism at its general point. Conversely, finiteness and surjectivity of normalization give at least one divisor over every surface in $Q$. It follows that
  $ B_Q := ker #scale(x: 120%, y: 120%)[\[] H_4 \( F_Q \) arrow.r H_4 \( A_Q \) #scale(x: 120%, y: 120%)[\]] \, #h(2em) dim B_Q = beta \( Q \) . $
  This also proves finiteness of the sum: the only possible nonzero terms come from the finitely many surface components of $A_Q$.
  The image of $B_Q$ in $H_4 \( N_Q \)$ is spanned by classes of compact surfaces in its normalization components. Its rank is therefore at most $sum_j c_2 \( Q_j^nu \)$. Hence
  $ U_Q := ker #scale(x: 120%, y: 120%)[\[] B_Q arrow.r H_4 \( N_Q \) #scale(x: 120%, y: 120%)[\]] quad upright("satisfies") quad dim U_Q gt.eq beta \( Q \) - sum_j c_2 \( Q_j^nu \) . $
  By (5.6), $U_Q$ is the image of $partial_Q$.
  The map $H_4 \( F_Q \) arrow.r H_4 \( F_(P_1) \)$ is injective. Both groups have surface components as their bases, and the surfaces in $F_Q$ remain distinct surfaces on the selected normalization components of $P_1$. Naturality of the boundary maps therefore sends $U_Q$ injectively into the image of $partial_(P_1)$ on the image of $H_5 \( Q \) arrow.r H_5 \( P_1 \)$. The groups $H_4 \( F_Q \)$ and $H_4 \( F_(P_1) \)$ are pure of weight $- 4$. Strictness for the weight filtration [6] Theorem 2.3.5(iii)–(iv) says that $partial_R$ maps $"Gr"_(- 4)^W H_5 \( R \)$ onto its image in the pure group $H_4 \( F_R \)$. Applying this to the naturality square, we obtain
  $ dim U_Q lt.eq "rk" "Gr"_(- 4)^W #scale(x: 120%, y: 120%)[\[] H_5 \( Q \) arrow.r H_5 \( P_1 \) #scale(x: 120%, y: 120%)[\]] . $
  Finally, Borel–Moore localization contains
  $ H_6^(upright("BM")) \( P \\ P_1 \) arrow.r H_5 \( P_1 \) arrow.r H_5 \( P \) . $
  The first group vanishes because $P \\ P_1$ has complex dimension at most two. The second arrow is therefore injective, and remains injective on weight-graded pieces by strictness. Duality between rational homology and cohomology reverses the sign of the weight and turns the last two inequalities into (5.5). ◻
]

=== 5.2 A smooth resolution and purity over the center <a-smooth-resolution-and-purity-over-the-center>

Lemma 18 proves the normalization bound and finiteness of $beta \( Q \)$. To finish Theorem 17, we must prove finiteness of $tau_Y \( Q \)$ and the remaining estimate

$ "rk" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] lt.eq tau_Y \( Q \) . $

We first show that $W_4 H^5 \( P \)$ vanishes after pullback to the resolved inverse image. The key purity there comes from compact Kähler Hodge theory on the smooth ambient resolution.

Fix, for the rest of Section 5, one projective resolution with smooth source

$ g : tilde(Y) arrow.r Y $

which is an isomorphism over $Y_(upright("reg"))$, whose exceptional locus is a divisor with simple normal crossings, and which principalizes the ideal of $"Sing" Y$. Thus

$ cal(I)_("Sing" Y) cal(O)_(tilde(Y)) = cal(O)_(tilde(Y)) \( - E_(upright("sing")) \) \, #h(2em) "Supp" E_(upright("sing")) = g^(- 1) \( "Sing" Y \) . $

Smoothness is used for purity here; the conditions on the exceptional divisor and singular ideal will be used in the curve construction. If $Y$ is smooth, we take $g$ to be the identity and the displayed divisor to be zero. Projective resolution and principalization, chosen to preserve the already resolved open $Y_(upright("reg"))$, give such a choice in the analytic category [2] Theorems 1.10, 12.2, and 13.2(1). The resolution is compact Kähler, and both $g$ and $p g$ have global relatively ample line bundles. For the composite one uses a sufficiently positive twist of a $g$-ample bundle by the pullback of a $p$-ample bundle; compactness allows a uniform choice. Set

$ tilde(P) = \( \( p g \)^(- 1) C \)_(upright("red")) . $

The projectivity argument over $C$ given above shows that $tilde(P)$ is projective.

We use intersection complexes in their perverse normalization. For an irreducible complex analytic space $Z$ of dimension $z$ and a local system $cal(E)$ on a smooth dense open, $"IC"_Z \( cal(E) \)$ restricts there to $cal(E) \[ z \]$. It is the middle extension of that shifted local system: it has no nonzero perverse subobject or quotient supported in a proper analytic subset of $Z$. The stalk support condition says that on a smooth boundary stratum of dimension $s$,

#[#set math.equation(numbering: n => "(5.7)")
 $ cal(H)^q \( "IC"_Z \( cal(E) \) \) \|_S = 0 #h(2em) \( q > - s - 1 \) . $ <eq:branch-ic-stalk-bound>]

Here $cal(H)^q$ denotes ordinary cohomology sheaves, not perverse cohomology. These conventions and the support condition are the middle-extension axioms in [11] Section 2.3 and Section 3.3, Axiom \[AX1\] (c). They are local statements on stratified spaces, so they apply to the analytic stratifications used here. If a new stratum of dimension $s$ cuts the local-system open, the only stalk degree is $- z$, which is at most $- s - 1$ whenever $s < z$.

#thm([Lemma 5.3.])[
  (Decomposition for the resolution maps).  #emph[For $f = g$ with target $Y$, and for $f = p g$ with target $X$, the rational complex $R f_(*) bb(Q)_(tilde(Y)) \[ 4 \]$ is a finite direct sum of shifts of perverse middle extensions with irreducible closed analytic supports. Its unique full-support summand is the intersection complex of the target in perverse degree zero.]
] <lem:branch-analytic-decomposition>

#proof[
  Write $B$ for the target of $f$ and $K_f = R f_(*) bb(Q)_(tilde(Y)) \[ 4 \]$. Fix an $f$-relatively ample line bundle and let $ell$ be its rational first Chern class. Cup product defines a global morphism $ell : K_f arrow.r K_f \[ 2 \]$.
  We first obtain relative hard Lefschetz locally on $B$. Around a point of $B$, choose a small chart $V$ embedded as a closed analytic subspace of a complex manifold. After making the chart smaller, relative ampleness embeds $f^(- 1) V$ in a projective space over $V$; composing with the closed embedding of $V$ gives a projective map from the smooth manifold $f^(- 1) V$ to the ambient manifold. On each connected component of the smooth source, the constant shifted sheaf underlies the constant polarizable Hodge module with that strict support. Saito’s projective direct-image theorem [23] Theorem 5.3.1 applies to precisely this situation: its morphisms are projective morphisms of smooth complex analytic manifolds, its Lefschetz class is the Chern class of a relatively ample line bundle, and its conclusion includes relative hard Lefschetz and polarizable perverse direct images. Passing through the closed embedding, which is fully faithful and exact for perverse sheaves, gives on $V$
  $ ell^a : zws^p #h(-0.16667em) H^(- a) \( K_f \) \|_V arrow.r^(med tilde.op med) zws^p #h(-0.16667em) H^a \( K_f \) \|_V #h(2em) \( a gt.eq 0 \) . $
  After forgetting Hodge structures, the Tate twist has the same underlying rational perverse sheaf. The operator is the restriction of the single global $ell$, and a morphism of perverse sheaves is an isomorphism if it is so on an open cover. Thus these are global relative hard Lefschetz isomorphisms on $B$.
  The formal Lefschetz splitting criterion [5] Theorem 1.5 now gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ K_f tilde.eq xor.big_i zws^p #h(-0.16667em) H^i \( K_f \) \[ - i \] . $ <eq:branch-perverse-splitting>]
  The criterion uses truncation triangles and the induced Lefschetz isomorphisms; the same argument applies to the bounded perverse $t$-structure. This explains why the local analytic theorem gives a global derived splitting here.
  We also need to separate the supports of the perverse terms in (5.8). Locally, Saito’s pure direct images decompose by strict support [23] Section 5.1 and Theorem 5.3.1; their underlying perverse terms are middle extensions from smooth opens of those supports. The support decomposition glues without requiring semisimplicity of local systems on arbitrary analytic opens. Indeed, a perverse morphism between middle extensions with different irreducible supports must be zero: its image would be a subobject or a quotient with smaller support in at least one of them. Restriction to an open preserves the middle-extension property; every resulting strict support is a local branch of the original support. The local system may decompose further without changing that support. For each perverse term and each dimension $d$, the sum of the local projectors onto all $d$-dimensional strict-support summands is intrinsic. Restriction preserves dimensions of local branches, so these sums agree on overlaps and glue as perverse morphisms. The support of each glued dimension summand is closed analytic in every chart, hence globally. For each irreducible component $Z$ of this support, sum all local projectors whose strict supports are local branches of $Z$. These sums agree by the same zero-morphism argument and glue to a global projector whose image has strict support $Z$; the middle-extension property is local. Local finiteness and compactness make the number of these summands finite.
  Finally $f$ is an isomorphism over a dense open of its target. On that open $K_f$ is $bb(Q) \[ 4 \]$ in perverse degree zero. The only full-support term is consequently the middle extension of this constant local system, namely $"IC"_B$, in degree zero. This proves the lemma. ◻
]

For each of $g$ and $p g$, choose a splitting as in Lemma 19. For $g$, choose the identification of the full-support summand so that its inclusion and projection are the identity over $Y_(upright("reg"))$.

#thm([Lemma 5.4.])[
  (Purity on the resolved inverse image).  #emph[The restriction map 
$ H^5 \( tilde(Y) \) arrow.r H^5 \( tilde(P) \) $

 is surjective. The mixed Hodge structure on the projective variety $tilde(P)$ is pure of weight $5$ in this degree.]
] <lem:branch-resolved-purity>

#proof[
  Apply Lemma 19 to $f = p g$. Besides $"IC"_X$, write a strict-support summand as $cal(K)_(Z \, i) \[ - i \]$, where $cal(K)_(Z \, i)$ is perverse with proper irreducible support $Z subset X$ of dimension $z$. Over a general point $x$ of $Z$, the fiber of $f$ has dimension at most $3 - z$: $f^(- 1) \( Z \)$ is a proper analytic subset of the irreducible fourfold $tilde(Y)$ and therefore has dimension at most three. Proper base change and the topological dimension of a compact analytic fiber give
  $ cal(H)^k \( K_f \)_x = H^(k + 4) \( f^(- 1) \( x \) \) = 0 quad upright("if ") k > 2 \( 3 - z \) - 4 . $
  The generic nonzero stalk of $cal(K)_(Z \, i) \[ - i \]$ is in degree $i - z$, because a perverse middle extension on $Z$ has its generic local system in degree $- z$. It is a direct summand of this stalk, so
  #[#set math.equation(numbering: n => "(5.9)")
   $ i - z lt.eq 2 \( 3 - z \) - 4 \, #h(2em) upright("or equivalently") #h(2em) i + z lt.eq 2 . $ <eq:branch-support-shift>]
  We now restrict the decomposition to $C$. Suppose first that $Z subset.not C$, and stratify $Z ∩ C$ compatibly with $cal(K)_(Z \, i)$. A stratum $S$ has dimension $s lt.eq z - 1$ and $s lt.eq 1$. Its stalk degrees for $cal(K)_(Z \, i)$ are at most $- s - 1$ by (5.7). This remains valid under the refinement by $C$: a stratum cut out of an old boundary stratum inherits the stronger bound from that stratum, while a stratum cut out of the local-system open has only degree $- z lt.eq - s - 1$. Compactly supported cohomology on the smooth complex $s$-fold $S$ vanishes above degree $2 s$. Thus its contribution to the hypercohomology of $cal(K)_(Z \, i) \[ - i \] \|_C$ vanishes in degrees greater than
  $ i - s - 1 + 2 s = i + s - 1 lt.eq i + z - 2 lt.eq 0 . $
  Filtering $C$ by its finitely many strata proves that this summand has no degree-one hypercohomology on $C$. The full-support summand $"IC"_X$ has the same property: for each stratum of $C$, the upper bound is $- s - 1 + 2 s = s - 1 lt.eq 0$; on the smooth open its only stalk degree is $- 4$, which is smaller still.
  Only summands with $Z subset C$ can therefore contribute in degree one. Such a complex is supported on the closed subset $C$, so its restriction induces an isomorphism on hypercohomology from $X$ to $C$. The chosen global splitting and proper base change now show that
  $ bb(H)^1 \( X \, K_f \) = H^5 \( tilde(Y) \) arrow.r bb(H)^1 \( C \, K_f \|_C \) = H^5 \( tilde(P) \) $
  is surjective.
  It remains to justify what this surjection says about weights. Compact Kähler Hodge theory gives $H^5 \( tilde(Y) \, bb(Q) \)$ its pure Hodge structure of weight $5$. On the projective $tilde(P)$, Deligne’s mixed Hodge structure has weights at most $5$ [7] Theorem 8.2.4(iii). We verify directly that the restriction map preserves its Hodge filtration, because the ambient $tilde(Y)$ may be nonprojective.
  Choose a proper smooth projective hyperresolution $epsilon.alt_bullet : Z_bullet arrow.r tilde(P)$. Deligne’s construction computes the Hodge filtration on $H^5 \( tilde(P) \)$ from the total simplicial de Rham complex of the $Z_n$, filtered by holomorphic form degree [7] Section 8.1, (8.2.1), and Proposition 8.2.2. The terms can be chosen projective because $tilde(P)$ is projective and the construction can use projective resolutions and modifications. We may use smooth forms in this complex, with the same filtration: the Dolbeault resolutions give filtered quasi-isomorphisms from the holomorphic de Rham complexes on the smooth $Z_n$. A class in $F^a H^5 \( tilde(Y) \, bb(C) \)$ has a closed smooth representative $eta$ whose components have holomorphic degree at least $a$, by the Kähler Hodge decomposition. Pullback along the holomorphic map $Z_0 arrow.r tilde(P) arrow.r.hook tilde(Y)$ preserves these bidegrees. Put that pullback in simplicial degree zero of the total complex. Its de Rham differential vanishes, and its simplicial differential is zero because the two face pullbacks to $Z_1$ have the same composite with the augmentation. It is therefore a cocycle in the filtered total de Rham complex. It represents the ordinary topological restriction by de Rham naturality and cohomological descent. Thus restriction preserves $F^a$ for every $a$.
  The restriction is rational on underlying cohomology. It also preserves $W$: the source is pure of weight $5$, and $W_5$ is all of the target. It is consequently a morphism of mixed Hodge structures. Strictness for $W$ [6] Theorem 2.3.5(iii), applied to the surjection just proved, yields
  $ W_4 H^5 \( tilde(P) \) = "im" #scale(x: 120%, y: 120%)[\[] W_4 H^5 \( tilde(Y) \) arrow.r H^5 \( tilde(P) \) #scale(x: 120%, y: 120%)[\]] = 0 . $
  Together with the upper weight bound, this proves purity of weight $5$. Strictness here concerns mixed Hodge structures themselves and does not require a rational polarization on the compact Kähler source. ◻
]

=== 5.3 The contribution of singular curves <the-contribution-of-singular-curves>

Let $j : Y_(upright("reg")) arrow.r.hook Y$ be the inclusion. Ordinary terminal singularities are smooth in codimension two, so $"Sing" Y$ is a finite union of irreducible curves and points. Analytic constructibility and a compatible Whitney stratification let us remove a finite set of points from each singular curve $T$ so that the remaining connected smooth curve $T^compose$ carries the local systems

#[#set math.equation(numbering: n => "(5.10)")
 $ cal(V)_T = \( R^2 j_(*) bb(Q)_(Y_(upright("reg"))) \) \|_(T^compose) \, #h(2em) cal(W)_T = \( R^2 g_(*) bb(Q)_(tilde(Y)) \) \|_(T^compose) \, #h(2em) b_T = dim H_c^2 \( T^compose \, cal(V)_T \) . $ <eq:branch-local-systems>]

Here $cal(V)_T$ records degree-two cohomology of punctured neighborhoods, while $cal(W)_T$ records that of the fixed resolution fibers and will provide geometric representatives. We use one finite puncture set on each $T$ for all the following requirements. All cohomology sheaves of $R j_(*) bb(Q)$ and $R g_(*) bb(Q)$ are locally constant on $T^compose$, and the fibers of $g$ there have dimension at most two. For the latter assertion, $g^(- 1) \( T \)$ has dimension at most three, so the general fiber has dimension at most two; remove its exceptional dimension-jump points. We also remove intersections of singular curves and the finitely many points of $T ∩ Q$ when $T$ is not contained in $Q$.

For later use we impose one further condition on this same finite puncture set. Let $E$ be a prime component of $"Exc" \( g \)$ dominating $T$. It is smooth because the exceptional divisor has simple normal crossings. Its proper map to $T$ has a Stein factorization

$ E arrow.r hat(T)_E arrow.r T \, $

where the first map has connected fibers and the second is finite. The intermediate curve is normal and irreducible because $E$ is normal and irreducible. Remove from $T$ the branch values of the finite map and the critical values of the first map, together with the already excluded singular points. Properness and generic smoothness make these sets finite. Over $T^compose$ the second map is then a finite unramified cover; it stays connected because deleting finitely many points from the irreducible normal curve $hat(T)_E$ leaves it connected. The first map is a smooth proper family with connected fibers. There are only finitely many such $E$, so these conditions can be imposed simultaneously. They will let us recognize global divisors after restricting to a smaller curve domain.

The number $b_T$ is unaffected by any further finite puncturing. Indeed, for $t in T^compose$, Poincaré duality on the oriented real surface $T^compose$ gives

$ H_c^2 \( T^compose \, cal(V)_T \) tilde.eq H^0 \( T^compose \, cal(V)_T^or \)^or tilde.eq #scale(x: 120%, y: 120%)[\(] \( cal(V)_T \)_t #scale(x: 120%, y: 120%)[\)]_(pi_1 \( T^compose \, t \)) \, $

where the last term is the coinvariant space for monodromy. A loop can be perturbed away from finitely many additional points, so the fundamental group of the further punctured curve surjects onto $pi_1 \( T^compose \, t \)$. The restricted local system has the same monodromy image, and hence the same coinvariant dimension.

#thm([Lemma 5.5.])[
  (The weight-four contribution).  #emph[With the choices in (5.10), 
#[#set math.equation(numbering: n => "(5.11)")
 $ "rk" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] lt.eq sum_(T upright(" irreducible curve")\
T subset "Sing" Y ∩ Q) b_T . $ <eq:branch-cone-bound>]

]
] <lem:branch-cone>

#proof[
  Use the full-support projection in the chosen decomposition for $g$ to form the morphism
  $ alpha : bb(Q)_Y \[ 4 \] arrow.r R g_(*) bb(Q)_(tilde(Y)) \[ 4 \] arrow.r "IC"_Y . $
  The first arrow is the natural pullback map. Both arrows restrict to the identity on $Y_(upright("reg"))$. Let $cal(L)$ be the cone of $alpha$, so that
  #[#set math.equation(numbering: n => "(5.12)")
   $ bb(Q)_Y \[ 4 \] arrow.r^alpha "IC"_Y arrow.r cal(L) arrow.r bb(Q)_Y \[ 5 \] . $ <eq:branch-comparison-triangle>]
  It is supported on $"Sing" Y$. Enlarge the finite puncture sets, if necessary, so that the cohomology sheaves of $cal(L)$ are local systems on each $T^compose$. Analytic constructibility permits this enlargement, and the preceding coinvariant description shows that it does not change $b_T$.
  By proper base change, the map induced by $alpha$ on $P$ factors as
  $ H^5 \( P \) arrow.r H^5 \( tilde(P) \) arrow.r bb(H)^1 \( P \, "IC"_Y \|_P \) . $
  The first arrow comes from a holomorphic morphism between the projective spaces $tilde(P)$ and $P$, and is algebraic by GAGA. It therefore preserves weights. Lemma 20 shows that it kills $W_4 H^5 \( P \)$. Hence the displayed composite kills that subspace as well; we need no weight statement about the chosen perverse projection. The long exact sequence of (5.12) on $P$ gives
  $ W_4 H^5 \( P \) subset "im" #scale(x: 120%, y: 120%)[\[] bb(H)^0 \( P \, cal(L) \|_P \) arrow.r H^5 \( P \) #scale(x: 120%, y: 120%)[\]] . $
  Restricting the triangle from $P$ to $Q$ shows that the image of this subspace in $H^5 \( Q \)$ is contained in the image of $bb(H)^0 \( Q \, cal(L) \|_Q \)$. Passing to a weight-graded quotient can only lower rank, and therefore
  #[#set math.equation(numbering: n => "(5.13)")
   $ "rk" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]] lt.eq dim bb(H)^0 \( Q \, cal(L) \|_Q \) . $ <eq:branch-cone-rank>]
  We estimate the last group by its strata. On a stratum of $"Sing" Y$ of dimension $s in { 0 \, 1 }$, the bound (5.7) and the triangle give
  #[#set math.equation(numbering: n => "(5.14)")
   $ cal(H)^q \( cal(L) \) \|_S = 0 #h(2em) \( q > - s - 1 \) . $ <eq:branch-cone-stalk-bound>]
  The constant complex in the triangle has its only stalk cohomology in degree $- 4$; its shifted contribution to the cone is in degree $- 5$, so it cannot alter this upper bound. On a curve $T^compose$, the same triangle identifies $cal(H)^(- 2) \( cal(L) \)$ with $cal(H)^(- 2) \( "IC"_Y \)$. The curve stratum has complex codimension three in $Y$. In the middle-extension construction, attaching a codimension-$c$ stratum retains the unshifted cohomology of $R j_(*) bb(Q)$ through degree $c - 1$. For $c = 3$ this gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ cal(H)^(- 2) \( cal(L) \) \|_(T^compose) = cal(H)^(- 2) \( "IC"_Y \) \|_(T^compose) = \( R^2 j_(*) bb(Q) \) \|_(T^compose) = cal(V)_T . $ <eq:branch-cone-link>]
  This is the attaching truncation of [11] Section 3.1 and Section 3.3, Axiom \[AX1\] (d), with the shift by four from our perverse normalization.
  The restriction $cal(L) \|_Q$ is supported on the closed set $"Sing" Y ∩ Q$, so its hypercohomology may be computed on that set. The complement there of the disjoint opens $T^compose$ for the curves contained in $Q$ is finite. A point stratum contributes nothing to degree-zero hypercohomology by (5.14). The open–closed cohomology sequence therefore gives a surjection
  $ xor.big_(T subset "Sing" Y ∩ Q) bb(H)_c^0 \( T^compose \, cal(L) \|_(T^compose) \) arrow.r bb(H)^0 \( Q \, cal(L) \|_Q \) . $
  On a curve, compactly supported cohomology of a local system vanishes above degree two. In the spectral sequence
  $ H_c^a \( T^compose \, cal(H)^b \( cal(L) \) \|_(T^compose) \) med arrow.r.double med bb(H)_c^(a + b) \( T^compose \, cal(L) \|_(T^compose) \) \, $
  the stalk bound gives $b lt.eq - 2$. The only term in total degree zero is consequently $a = 2$, $b = - 2$, whose dimension is $b_T$ by (5.15). The dimension of each degree-zero abutment is at most $b_T$. This bound and (5.13) prove (5.11). ◻
]

Combining Lemmas 18 and 21 gives the topological reduction of the theorem:

#[#set math.equation(numbering: n => "(5.16)")
 $ beta \( Q \) - sum_j c_2 \( Q_j^nu \) & lt.eq "rk" "Gr"_4^W #scale(x: 120%, y: 120%)[\[] H^5 \( P \) arrow.r H^5 \( Q \) #scale(x: 120%, y: 120%)[\]]\
 & lt.eq sum_(T upright(" irreducible curve")\
T subset "Sing" Y ∩ Q) b_T . $ <eq:branch-topological-bound>]

There are finitely many curves in this sum, and the local systems have finite rank on curves of finite topological type, so its terms are finite. It remains to prove that this sum is at most $tau_Y \( Q \)$ and that $tau_Y \( Q \)$ is finite.

We finish the topological part by relating the punctured cohomology in $cal(V)_T$ to the cohomology of the fixed resolution. This identifies the classes that the subsequent geometric construction will realize.

#thm([Lemma 5.6.])[
  (Resolution cohomology and punctured cohomology).  #emph[For every singular curve $T$ with the choices in (5.10), restriction from the resolution to the regular locus induces a surjection of local systems 
#[#set math.equation(numbering: n => "(5.17)")
 $ cal(W)_T arrow.r.twohead cal(V)_T . $ <eq:branch-link-quotient>]

 For every $t in T^compose$, its map on fibers is equivariant for the action of $pi_1 \( T^compose \, t \)$ and is the map induced by restriction 
#[#set math.equation(numbering: n => "(5.18)")
 $ \( cal(W)_T \)_t & tilde.eq H^2 \( g^(- 1) \( t \) \) tilde.eq "inj lim"_(U in.rev t) H^2 \( g^(- 1) U \)\
 & arrow.r "inj lim"_(U in.rev t) H^2 \( U ∩ Y_(upright("reg")) \) tilde.eq \( cal(V)_T \)_t \, $ <eq:branch-link-stalk-map>]

 where $U$ runs through sufficiently small open neighborhoods of $t$ in $Y$ and $g^(- 1) \( U ∩ Y_(upright("reg")) \)$ is identified with $U ∩ Y_(upright("reg"))$.]
] <lem:link-quotient>

#proof[
  The isomorphism of $g$ over the regular locus and adjunction give a natural morphism
  $ rho : R g_(*) bb(Q)_(tilde(Y)) \[ 4 \] arrow.r R j_(*) bb(Q)_(Y_(upright("reg"))) \[ 4 \] . $
  By the definition of a higher direct-image stalk and proper base change for $g$, its degree-$- 2$ map at $t$ is precisely (5.18). These are the usual sheaf cohomology groups of constant sheaves, equal to singular cohomology on the locally contractible analytic spaces in question.
  Let $kappa : "IC"_Y arrow.r R g_(*) bb(Q)_(tilde(Y)) \[ 4 \]$ be the full-support inclusion in the chosen decomposition. Its restriction to $Y_(upright("reg"))$ is the identity. The composite $rho kappa : "IC"_Y arrow.r R j_(*) bb(Q) \[ 4 \]$ is therefore the canonical comparison morphism: by adjunction a morphism to $R j_(*) bb(Q) \[ 4 \]$ is determined by its restriction to $Y_(upright("reg"))$. The codimension-three attaching construction used in (5.15) says that this comparison is an isomorphism on ordinary stalk cohomology in degree $- 2$ along $T^compose$. Its degree-$- 2$ map factors through
  $ cal(H)^(- 2) \( R g_(*) bb(Q) \[ 4 \] \) \|_(T^compose) = cal(W)_T . $
  Thus the degree-$- 2$ map induced by $rho$, namely (5.17), is surjective. It is a morphism of the local systems in (5.10), which gives the asserted monodromy equivariance. ◻
]

=== 5.4 Curve contributions and global places <subsec:curve-places>

It remains to bound the contribution $b_T$ of each singular curve by global divisors. We realize the relevant cohomology classes by line bundles near a compact subset carrying all loops of $T^compose$. Degrees on the fibers of a small $bb(Q)$-factorialization then produce exceptional surfaces. Retaining those loops will ensure that their blowup places remain distinct on the fixed global resolution.

#thm([Proposition 5.7.])[
  (Global places over a singular curve).  #emph[For every irreducible curve component $T$ of $"Sing" Y$, with $b_T$ as in (5.10) and the fixed resolution $g : tilde(Y) arrow.r Y$, 
$ b_T med lt.eq med \# mat(delim: "{", E upright(" a prime component of ") "Exc" \( g \) :; g \( E \) = T \, quad a \( E \; Y \, 0 \) = 2) . $

 In particular, the divisors counted here represent distinct global divisorial places.]
] <prop:curve-places>

#proof[
  Fix $T$, and write
  $ q_T : cal(W)_T arrow.r cal(V)_T $
  for the natural quotient of Lemma 22. If $b_T = 0$ there is nothing to prove, so assume $b_T > 0$. We may remove finitely many further points of $T^compose$ whenever needed. The local systems already defined restrict to the smaller curve, and the induced map on fundamental groups is surjective. Thus their monodromy images and the coinvariant dimension $b_T$ do not change.
  We first construct sections
  $ sigma_1 \, dots.h \, sigma_(b_T) in H^0 \( T^compose \, cal(W)_T \) $
  whose images under $q_T$ are linearly independent in every fiber of $cal(V)_T$, after the permitted further finite puncturing.
  #emph[Step 1. Invariant lifts from finite monodromy.] First we show that $cal(W)_T$, and therefore its quotient $cal(V)_T$, has finite monodromy. Let $cal(F) = tilde(Y) times_Y T$, with its full complex-space structure. It is projective over the compact projective curve $T$. A relative embedding and GAGA identify this morphism with an algebraic projective family, including its possibly nonreduced scheme fibers. After deleting finitely many points we may assume that $cal(F) arrow.r T^compose$ is flat and that all $\( R^k g_(*) bb(Q) \) \|_(T^compose)$ are local systems.
  For $t in T^compose$, put $F_t = cal(F)_t$. Every integral class in $H^2 \( F_t \, bb(Z) \)$ lifts, by proper base change, to $H^2 \( g^(- 1) U_t \, bb(Z) \)$ for a sufficiently small Stein neighborhood $U_t$ of $t$ in $Y$. Terminal singularities are rational [10] Remark 3.8 and Theorem 3.12. Hence $g_(*) cal(O)_(tilde(Y)) = cal(O)_Y$ and $R^k g_(*) cal(O)_(tilde(Y)) = 0$ for $k > 0$; Leray and Cartan’s Theorem B give
  $ H^2 \( g^(- 1) U_t \, cal(O)_(tilde(Y)) \) = 0 . $
  The exponential sequence therefore realizes the lifted integral class as the first Chern class of a holomorphic line bundle on $g^(- 1) U_t$. Its restriction to the projective scheme $F_t$ is algebraic by the scheme form of GAGA [22] Corollary 4.3 and Theorem 4.4. In particular,
  #[#set math.equation(numbering: n => "(5.19)")
   $ "Pic" \( F_t \) ⊗_(bb(Z)) bb(Q) arrow.r^(med c_1 med) H^2 \( F_t \, bb(Q) \) = \( cal(W)_T \)_t quad upright("is surjective") . $ <eq:curve-fiber-chern>]
  Here and below the cohomology of a scheme fiber means that of its analytic topological space; nilpotents do not change it.
  We use the parameter argument of [20] Section 6.1, proof of Lemma 6.4 to show that a spanning set of fiber classes has finite monodromy orbits. Fix a relatively very ample $cal(O)_(cal(F)) \( 1 \)$. Every line bundle on a fiber is a quotient of some $cal(O)_(F_t) \( - n \)^(xor r)$. Letting $n \, r$, and the Hilbert polynomial vary gives countably many relative Quot schemes of finite type over $T^compose$ [13] Theorems 3.1–3.2. In each take the open set on which the universal quotient is invertible on the whole pulled-back family. These open sets still contain a point representing every fiber line bundle. Indeed the family and universal quotient are flat over the Quot scheme, so the local criterion for flatness makes a fiberwise locally free quotient of rank one locally free near that fiber; properness removes the image of the complementary closed locus.
  There are countably many irreducible components of these parameter spaces. Choose $t$ outside the closures of the images of all components which do not dominate $T^compose$. Such a point exists, since each of those closures is a finite set and a complex curve is uncountable. Put $Gamma = pi_1 \( T^compose \, t \)$. By (5.19), choose finitely many line bundles on $F_t$ whose Chern classes span $\( cal(W)_T \)_t$. Each is represented on a dominating reduced irreducible parameter component $H$. The Chern class of the universal bundle gives a section of the pullback of $cal(W)_T$ to $H^(upright("an"))$: restrict its class on the total family to fibers and use proper base change.
  Choose a closed point of the generic fiber of $H arrow.r T^compose$. Its residue field is a finite extension of the function field of $T$. Spreading this point, normalizing its closure, and deleting finitely many base points gives a connected finite étale cover of a dense open of $T^compose$, together with a morphism from that cover to $H$. The analytification of an irreducible complex algebraic variety is path connected. A path in $H^(upright("an"))$ from the original parameter point to a point of this cover identifies the transported Chern class with the class there. The subgroup fixing that sheet has finite index and fixes this class. The inclusion of the further punctured curve, with the projected path for change of basepoint, still surjects on $Gamma$. The image of the finite-index sheet stabilizer is therefore finite index in $Gamma$ and fixes the original class. Thus each of our spanning classes has a finite orbit under $Gamma$. The intersection of their stabilizers has finite index and acts trivially on $\( cal(W)_T \)_t$. The monodromy group $G$ of $cal(W)_T$ is therefore finite, as is that of $cal(V)_T$.
  Poincaré duality with local coefficients on the oriented curve gives
  $ b_T = dim \( cal(V)_T \)_t zws_Gamma . $
  For a representation of the finite group $G$ over $bb(Q)$, averaging identifies coinvariants with invariants and makes invariants an exact functor. The quotient $q_T$ therefore supplies the asserted sections $sigma_i$ with independent images.
  #emph[Step 2. Line bundles near a compact curve core.] Take $T^compose$ noncompact, removing one more point if needed. Recall the fixed choice made after (5.10): for every prime component $E$ of $"Exc" \( g \)$ dominating $T$, its Stein factor restricts to
  #[#set math.equation(numbering: n => "(5.20)")
   $ E \|_(T^compose) arrow.r hat(T)_E^compose arrow.r T^compose \, $ <eq:global-divisor-family>]
  where the first map is a smooth proper family with connected fibers and the second is a connected finite étale cover. Further finite puncturing preserves these properties. Choose an ambient open $Y^compose subset Y$ in which $T^compose$ is closed: remove the discarded points of $T$, the other singular components, and their intersection points. These choices will be used when we identify the local divisors globally.
  Let $h : g^(- 1) T^compose arrow.r T^compose$ be the restricted resolution. The curve $T^compose$ has the homotopy type of a finite graph, so cohomology of its local systems vanishes in degrees at least two. The Leray spectral sequence for $h$ consequently makes the edge map
  $ H^2 \( g^(- 1) T^compose \, bb(Q) \) arrow.r H^0 \( T^compose \, cal(W)_T \) $
  surjective. Choose lifts of the $sigma_i$. The algebraic space $g^(- 1) T^compose$ has finite triangulation type; after multiplying each lift by a positive integer, it comes from a class $alpha_i in H^2 \( g^(- 1) T^compose \, bb(Z) \)$. Replace $sigma_i$ by the same multiple. Their images are still independent.
  To extend the $alpha_i$ simultaneously while retaining every loop of $T^compose$, choose a compact curve core as follows. In the smooth compactification of $T^compose$, remove small open coordinate discs about its punctures, with disjoint closures, and denote the complement by $K_(*)$. This is a connected compact semianalytic subset of $T^compose$. The inclusion of its interior into $T^compose$ induces a surjection on fundamental groups. The core $K_(*)$ is also Runge: every component of $T^compose \\ K_(*)$ runs to a missing puncture and is therefore not relatively compact. The compact set $g^(- 1) K_(*)$ is semianalytic. Continuity of cohomology on neighborhoods of this compact set extends the restrictions of the finitely many $alpha_i$ to integral classes on one open neighborhood $tilde(U)_0$ of $g^(- 1) K_(*)$ in $tilde(Y)$. One may use Čech cohomology for this continuity statement; semianalytic triangulation and local contractibility identify it with singular cohomology here. Properness of $g$ makes
  $ U_0 = Y \\ g \( tilde(Y) \\ tilde(U)_0 \) $
  an open neighborhood of $K_(*)$ with $g^(- 1) U_0 subset tilde(U)_0$.
  The closed curve $T^compose subset Y^compose$ is Stein. Siu’s Stein-neighborhood theorem, in the form [8] Theorem 2.1 with empty compact set, gives a Stein neighborhood $Omega$ of this curve in $Y^compose$. The Runge property makes $K_(*)$ holomorphically convex in $T^compose$, hence also in $Omega$ by the paragraph preceding that theorem. The usual holomorphic-polyhedron construction for a convex compact in a Stein space gives a Stein neighborhood
  $ K_(*) subset U subset.double Omega ∩ U_0 . $
  Take its connected component containing $K_(*)$. It is normal, being open in $Y$, and therefore irreducible. For the local $bb(Q)$-factorialization, Fujino’s compact construction [10] Section 1.11 supplies an ambient semianalytic Stein compact $K' subset.double U$, with $K_(*) subset "int"_U \( K' \)$, such that
  $ K' ∩ Z med upright("has finitely many connected components") $
  for every analytic subset $Z$ defined on a neighborhood of $K'$. This is the compact condition (P4) in Fujino’s condition (P); normality of the source and Steinness of the base supply its other ambient conditions.
  The classes just extended to $g^(- 1) U$ are Chern classes of line bundles $L_1 \, dots.h \, L_(b_T)$ there, by the same rational-singularity, Cartan, and exponential-sequence argument used above. For every $t$ in the interior of $K_(*)$, their fiber classes are the $sigma_i \( t \)$; hence their images under $q_T$ remain independent. We also need divisor representatives before making any further modification. The sheaf $g_(*) L_i$ is coherent and has rank one on the regular open of $U$. Cartan’s Theorem A supplies a global section nonzero at a point of that open. Its pullback is a nonzero section of $L_i$, whose zero divisor is a Cartier divisor $A_i$ on $g^(- 1) U$ representing $L_i$.
  #emph[Step 3. Fiber degrees and surface families.] We will obtain at least $b_T$ surface families by proving that the $b_T$ line bundles constructed below have linearly independent vectors of fiber degrees. Apply Fujino’s small $bb(Q)$-factorialization theorem [10] Theorem 1.24 to the ordinary pair $\( U \, 0 \)$, the identity $U arrow.r U$, and the full compact $K'$. The identity is projective, $U$ is terminal and therefore klt, and $K_U$ is $bb(Q)$-Cartier. The preceding construction supplies condition (P). After restricting the base to a neighborhood of $K'$, the theorem gives a projective small bimeromorphic morphism
  $ ell : Y' arrow.r U $
  with $Y'$ normal and $bb(Q)$-factorial over $K'$. We retain the notation $U$ after this restriction and restrict $g \, L_i \, A_i$ accordingly. Compactness and local terminality of $Y$ give a common $m_(upright("can")) > 0$ for which $omega_Y^(\[ m_(upright("can")) \])$ is invertible; its restriction to $U$ is $omega_U^(\[ m_(upright("can")) \])$. Since $ell$ is small, the natural identification on the common codimension-one open extends by reflexivity to
  $ omega_(Y')^(\[ m_(upright("can")) \]) tilde.eq ell^(*) omega_U^(\[ m_(upright("can")) \]) . $
  In particular, the left side is invertible and the natural relative canonical divisor $K_(Y' \/ U)$ is zero. This is canonical crepancy, expressed using compatible local canonical generators as $K_(Y') = ell^(*) K_U$. A place exceptional over $Y'$ is exceptional over $U$, because $ell$ is small. Crepancy therefore preserves the terminal discrepancy inequalities, so $Y'$ is terminal. Moreover $ell$ is an isomorphism over $U_(upright("reg"))$. Indeed, for a relatively ample line bundle $cal(A)$ on $Y'$, the rank-one reflexive sheaf $\( ell_(*) cal(A) \)^(* *)$ is locally invertible on the smooth base. Its pullback agrees with $cal(A)$ off codimension two and hence everywhere there, by reflexivity on the normal source. A positive-dimensional fiber over a smooth point would then have degree zero against $cal(A)$, contradicting relative ampleness.
  Push $A_i$ forward to a Weil divisor on $U$, and let $D'_i$ be its strict transform on $Y'$. These are actual locally finite analytic divisors defined on all of the current $Y'$. We apply $bb(Q)$-factoriality precisely in the sense of [10] Definition 2.38: every prime divisor defined on a neighborhood of the whole set $ell^(- 1) \( K' \)$ is $bb(Q)$-Cartier at each point of that set. Properness makes $ell^(- 1) \( K' \)$ compact, and local finiteness leaves only finitely many prime components of the $D'_i$ near it. A finite cover of this full compact and a common multiple therefore give an integer $m_(upright("div")) > 0$ and an open neighborhood of $ell^(- 1) \( K' \)$ on which every $m_(upright("div")) D'_i$ is Cartier. By properness, choose an open set $U_1$ with $K' subset U_1 subset U$ whose full inverse image is contained in that neighborhood, and put
  $ cal(N)_i = cal(O)_(Y') \( m_(upright("div")) D'_i \) \|_(ell^(- 1) U_1) . $
  This completes the use of $bb(Q)$-factoriality on the specified full compact; all later restrictions use these fixed line bundles. In particular, the change-of-compact issue in [10] Remark 2.39 does not arise. On the regular open, where both $g$ and $ell$ are isomorphisms,
  #[#set math.equation(numbering: n => "(5.21)")
   $ cal(N)_i \|_(U_(1 \, upright("reg"))) tilde.eq L_i^(⊗ m_(upright("div"))) \|_(U_(1 \, upright("reg"))) . $ <eq:curve-regular-bundles>]
  Choose connected curve domains
  $ B_0 subset.double B_1 subset.double "int"_(T^compose) \( K_(*) \) $
  such that $pi_1 \( B_0 \) arrow.r pi_1 \( T^compose \)$ is surjective; nested smaller cores obtained by enlarging the omitted discs have this property. The larger domain lets us control finitely many components near $overline(B)_0$ and make their discrete exceptional sets finite on that compact. Work in the ambient open of $U_1$ obtained by removing $T^compose \\ B_1$, so that $B_1$ is closed there. The inverse image of $B_1$ is proper over $B_1$. Local finiteness of its analytic components, compactness of $ell^(- 1) \( overline(B)_0 \)$, and properness allow us first to replace $B_1$ by a neighborhood of $overline(B)_0$ on whose inverse image only finitely many components occur.
  We claim that deleting finitely many points from $B_0$ gives a connected curve domain $B$ with $pi_1 \( B \) arrow.r pi_1 \( T^compose \)$ surjective and the following fiber description. All fibers of $ell$ over $B$ have dimension at most one. The finitely many irreducible surface components $S_1 \, dots.h \, S_s$ of the reduced inverse image of $B$, counted after this restriction, all dominate $B$. Their normalizations factor as
  $ hat(S)_alpha arrow.r^(thin h_alpha thin) C_alpha arrow.r B #h(2em) \( 1 lt.eq alpha lt.eq s \) \, $
  where $C_alpha arrow.r B$ is a connected finite étale cover and $h_alpha$ is a smooth proper family of connected curves. A cover that splits on restriction contributes separate components to this list. For each fixed $t in B$, the pairs $\( alpha \, c \)$ with $c in C_alpha$ over $t$ supply distinct irreducible curves and exhaust the irreducible curves of $ell^(- 1) \( t \)$. Each smooth connected normalization fiber maps birationally to the curve it supplies.
  We verify this description by spelling out the finite exclusions. Smallness gives $dim "Exc" \( ell \) lt.eq 2$, so a general fiber above $B_1$ has dimension at most one. The locus of larger fibers is a proper analytic subset of $B_1$, by the fiber-dimension theorem for proper maps. For each surface component of the reduced inverse image that dominates $B_1$, take its normalization and then its Stein factor over the curve. The normalization is proper and is a normal surface. Its singularities are isolated. Away from the branch values of the finite Stein factor and the critical values of the map from the normalization, it is a smooth proper family of connected curves over a finite unramified cover. The values at which an intersection of two components, or the nonisomorphism locus of a normalization, contains a whole fiber curve also form a discrete analytic subset: these loci have dimension at most one, and their general fibers over the base are zero-dimensional. Finally remove the images of components lying over a point. Each of these excluded sets is discrete on the larger curve domain $B_1$; there are only finitely many components, so their union meets $overline(B)_0$ in a finite set.
  Delete those finitely many points from $B_0$ and call the result $B$. It is connected, and $pi_1 \( B \) arrow.r pi_1 \( T^compose \)$ is still surjective: loops in $B_0$ may be perturbed away from a finite set. The exclusions give the asserted fiber description and families.
  For each $alpha \, i$, let
  $ d_(alpha i) = deg #scale(x: 120%, y: 120%)[\(] cal(N)_i \|_(h_alpha^(- 1) \( c \)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) c in C_alpha \, $
  where pullback to $hat(S)_alpha$ is understood. This integer is independent of $c$, by constancy of degree in a smooth proper family over the connected curve $C_alpha$. Because its fiber maps birationally to the curve it supplies, this is also the degree of $cal(N)_i$ on that fiber curve of $ell$. We claim that the map
  #[#set math.equation(numbering: n => "(5.22)")
   $ bb(Q)^(b_T) arrow.r bb(Q)^s \, #h(2em) \( c_i \)_i mapsto (sum_i c_i d_(alpha i))_alpha $ <eq:curve-degree-map>]
  is injective.
  Suppose its value is zero, and fix $t in B$. Every irreducible curve in $F'_t = ell^(- 1) \( t \)$ then has degree zero against $sum_i c_i c_1 \( cal(N)_i \)$. The fiber has dimension at most one. Its rational $H_2$ is spanned by the fundamental classes of its irreducible curves, also when the fiber is nonreduced, and $H^2 \( F'_t \, bb(Q) \)$ is the rational dual of $H_2 \( F'_t \, bb(Q) \)$. The restricted Chern class is therefore zero. Proper base change identifies it with the germ in $\( R^2 ell_(*) bb(Q) \)_t$. Restriction through the isomorphism over the regular open gives the natural map
  $ \( R^2 ell_(*) bb(Q) \)_t arrow.r \( R^2 j_(*) bb(Q) \)_t = \( cal(V)_T \)_t \, $
  so the corresponding punctured class is zero as well. By (5.21), the restrictions of $sum_i c_i c_1 \( cal(N)_i \)$ and $m_(upright("div")) sum_i c_i c_1 \( L_i \)$ agree on their common regular open. Taking their germ in $\( R^2 j_(*) bb(Q) \)_t$ and applying (5.18) to the latter identifies that zero class with
  $ m_(upright("div")) sum_i c_i thin q_T \( sigma_i \( t \) \) . $
  These vectors are independent; hence every $c_i = 0$. This proves (5.22), and in particular
  #[#set math.equation(numbering: n => "(5.23)")
   $ s gt.eq b_T . $ <eq:curve-surface-count>]
  #emph[Step 4. Distinct global discrepancy-two divisors.] Take an ambient open $U_B subset U_1$ whose intersection with $T^compose$ is the closed subspace $B$, obtained as above by removing $T^compose \\ B$. Each $S_alpha$ is a closed analytic surface in $ell^(- 1) U_B$. Since $Y'$ is terminal, it is smooth in codimension two by [21] Lemma 2.3. Thus at a general point of $S_alpha$ both the ambient space and the surface are smooth. Blow up its coherent ideal and normalize. The unique divisor dominating that dense smooth part defines a local place $v_alpha$ of ordinary log discrepancy $2$ over $Y'$, the value for a smooth codimension-two blowup. Canonical crepancy of $ell$ gives
  $ a \( v_alpha \; U_B \, 0 \) = 2 \, #h(2em) "cent"_(U_B) \( v_alpha \) = B . $
  The $v_alpha$ are distinct because their centers on $Y'$ are the distinct $S_alpha$.
  It remains to represent each $v_alpha$ by a prime divisor on $g^(- 1) U_B$ and show that these local divisors arise from distinct global components of $"Exc" \( g \)$.
  On the fixed global resolution, the relative canonical divisor is intrinsic even if the canonical bundle has no global divisor representative. Using the fixed $m_(upright("can"))$, divide by $m_(upright("can"))$ the divisor of the natural meromorphic comparison $g^(*) omega_Y^(\[ m_(upright("can")) \]) arrow.r.dashed omega_(tilde(Y))^(⊗ m_(upright("can")))$, and denote the result by $K_(tilde(Y) \/ Y)$. It is exceptional; write
  $ K_(tilde(Y) \/ Y) = sum_E kappa_E E . $
  The natural canonical comparisons commute with restriction and composition, so this divisor supplies the relative discrepancy term on $U_B$ as well. Every $kappa_E$ is strictly positive by terminality. The principalization of the ideal of $"Sing" Y$ says that $g^(- 1) \( "Sing" Y \)$ is supported on these exceptional divisors. Put $tilde(U)_B = g^(- 1) U_B$, and consider $v_alpha$ on a common proper model with $tilde(U)_B$. If it were exceptional over this smooth resolution, then $a \( v_alpha \; tilde(U)_B \, 0 \) gt.eq 2$. Its center on the resolution maps into $B subset "Sing" Y$, so it is contained in at least one of the $E$, with $"ord"_(v_alpha) \( E \) > 0$. The discrepancy formula would give
  $ a \( v_alpha \; U_B \, 0 \) = a \( v_alpha \; tilde(U)_B \, 0 \) + sum_E kappa_E "ord"_(v_alpha) \( E \) > 2 \, $
  a contradiction. Thus $v_alpha$ is represented by a prime divisor on $g^(- 1) U_B$. Since $U_B ∩ T = B$, this local divisor is an irreducible component of $E \|_B$ for a global exceptional divisor $E$ with $g \( E \) = T$.
  Such a global divisor cannot split into two components over $B$. Indeed the connected finite cover $hat(T)_E^compose arrow.r T^compose$ in (5.20) remains connected over $B$: the action of $pi_1 \( T^compose \)$ on a fiber is transitive, and $pi_1 \( B \)$ has the same image. Over this connected cover the restriction of $E$ is a smooth proper family with connected fibers, so its total space is connected and smooth, hence irreducible. Therefore the distinct local divisors representing the $v_alpha$ come from distinct global components $E$ of $"Exc" \( g \)$. Their global centers are $T$, and their ordinary log discrepancies are $2$, since this equality holds on the open over $B$. Together with (5.23), this proves the proposition. ◻
]

#proof[
  Every global place of ordinary log discrepancy $2$ whose center is a singular curve is represented by a component of $"Exc" \( g \)$. Indeed the same discrepancy computation in the last part of Proposition 23 would otherwise make its discrepancy strictly greater than $2$. There are only finitely many such components on the compact resolution, so $tau_Y \( Q \)$ is finite. Proposition 23, summed over the singular curves contained in $Q$, gives
  $ sum_(T subset "Sing" Y ∩ Q) b_T lt.eq tau_Y \( Q \) . $
  Combining this with (5.16) yields
  $ beta \( Q \) lt.eq sum_j c_2 \( Q_j^nu \) + tau_Y \( Q \) \, $
  as required. ◻
]

== 6 The difficulty on the terminal chain <sec:difficulty>

We now construct an integer that is nonnegative at the crepant terminal junctions and nonincreasing along the moves between them. The local subtraction of surface contributions and the correction by cycle ranks on boundary normalizations adapt the projective construction in [20] Definition 4.2, Lemma 4.3, and Section 7. We give the required finiteness and comparison arguments in the analytic setting.

Use the terminal chain of Proposition 15, after the truncation in Proposition 16. Its finite set of prime labels is denoted by $cal(H)$. On a current model its boundary is

$ Theta = sum_(h in cal(H)) b_h S_h \, #h(2em) 0 lt.eq b_h < 1 . $

The labels persist by strict transform, including those of coefficient zero, and the coefficients are nonincreasing. The fixed coefficients have already become constant. Every varying coefficient is positive; at a junction $h_i : Y_i arrow.r X_i$, its label is exceptional for $h_i$ and has image of dimension at most one. Each model of the chain is strong and compact Kähler, the generalized pair is terminal, and the underlying fourfold is ordinarily terminal.

Choose a positive integer $N$ that clears the fixed label coefficients, the coefficients of the initial boundary of the particular strong generalized klt sequence under study, and its fixed nef datum: on the chosen higher carrier, $N upright(bold(M))$ is represented by an integral Cartier divisor. These are finite rational data. We impose no denominator condition on a varying coefficient. For $u in bb(R)$, put

#[#set math.equation(numbering: n => "(6.1)")
 $ omega \( u \) = ⌈N max { u \, 0 }⌉ \, #h(2em) w \( E \) = omega #scale(x: 120%, y: 120%)[\(] 2 - a \( E \; Y \, Theta + upright(bold(M)) \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:difficulty-weights>]

where $E$ is a global divisorial place and the current pair is understood in $w \( E \)$. Thus $w \( E \) > 0$ exactly when the discrepancy is less than two; discrepancy equal to two has weight zero.

For a fixed label, $omega \( b_h \) = N b_h$, so its contribution incurs no rounding loss in the local estimate below. The conditions on the initial boundary and nef carrier will give the lattice at the positive endpoint in Lemma 28. The earlier surface lattice has already served to choose the tail; $N$ need not clear every element of $cal(A)_(upright("surf"))$.

=== 6.1 Echoes and finite local corrections <echoes-and-finite-local-corrections>

The recurring places over a generic codimension-two boundary center are the echoes of [1] Example 1.4, Lemma 1.5, and Definition 2.3. The full chain matters: [9] Example 2.1 shows why removing only the first blowup does not make a boundary difficulty finite.

First consider an irreducible compact analytic surface $V subset S_h$ whose general point lies in a smooth open of $Y$ where $S_h$ is smooth, no other label occurs, and $upright(bold(M))$ descends. The following sequence of global places records the predictable contribution above such a surface. Blow up the coherent ideal of $V$ globally and normalize. The global exceptional divisor has a unique irreducible component dominating the dense smooth open of $V$; call its place $E_(V \, h \, 1)$. On this normalized blowup, its analytic intersection with the strict transform of $S_h$ has a unique irreducible component dominating that same open of $V$. Blow up the coherent ideal of this global component, normalize, and take the unique new exceptional prime over that open. Repeat this operation on these normalized blowups, denoting the successive places by $E_(V \, h \, j)$, $j gt.eq 1$. The models are smooth at the general points of the indicated intersections, so each next component exists and is unique there. When another higher model is needed for comparison, a common proper model identifies these same global places by strict transform. We call them the #emph[echoes] of $S_h$ above $V$.

The first exceptional prime has crepant boundary coefficient $- \( 1 - b_h \)$. At stage $j$ this coefficient is $- j \( 1 - b_h \)$: blowing up its intersection with the strict label adds one more $- \( 1 - b_h \)$. Consequently

#[#set math.equation(numbering: n => "(6.2)")
 $ a \( E_(V \, h \, j) \; Y \, Theta + upright(bold(M)) \) = 1 + j \( 1 - b_h \) . $ <eq:echo-discrepancy>]

The contributing echoes are precisely those with $j \( 1 - b_h \) < 1$. In particular there are only finitely many contributing indices for each $b_h < 1$. Define the #emph[default contribution] of label $h$ by the finite sum

#[#set math.equation(numbering: n => "(6.3)")
 $ d_h = sum_(j gt.eq 1) omega #scale(x: 120%, y: 120%)[\(] 1 - j \( 1 - b_h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:echo-default>]

Here terms outside the finite set just described are zero. If $b_h = 0$, then $d_h = 0$. If $b_h > 0$, its first term gives $d_h gt.eq omega \( b_h \) gt.eq 1$. Each summand is nonincreasing as $b_h$ decreases, and no new positive index can appear. Hence every $d_h$ is a nonincreasing nonnegative integer along the chain. After discarding finitely many further junctions, all $d_h$ are constant, including throughout each intervening finite string of moves. Indeed each of the finitely many integers can drop only finitely often, while coefficients stay unchanged during the small steps. We henceforth use this truncated chain and these constant values $d_h$.

On a fixed model, the generic echo contribution is the only contribution that can recur over infinitely many surface centers. We now justify this claim. All places in the following proposition are global divisorial places.

#thm([Proposition 6.1.])[
  (Finiteness below discrepancy two).  #emph[Let $\( Y \, Theta + upright(bold(M)) \)$ be a model of the truncated terminal chain. Among the places exceptional over $Y$ with discrepancy less than two, there are only finitely many whose centers have codimension at least three. For each fixed irreducible compact analytic surface $V subset Y$, there are only finitely many whose center is $V$.]
  #emph[There is a finite set $cal(V)_Y$ of irreducible compact analytic surfaces with the following additional property. If $V in.not cal(V)_Y$, its general point lies in a smooth open where $upright(bold(M))$ descends and either no label occurs or exactly one smooth label $S_h$ occurs. There are no positive-weight places centered on $V$ in the first case or when $b_h = 0$. When $b_h > 0$, they are exactly the echoes $E_(V \, h \, j)$ with $j \( 1 - b_h \) < 1$.]
] <prop:difficulty-finite>

#proof[
  Take a projective resolution $pi : W arrow.r Y$ with $W$ smooth and carrying $upright(bold(M))$, with divisorial exceptional locus, and resolving all labels. Further blowups of intersections in the simple normal crossing divisor make the strict transforms of the labels smooth and pairwise disjoint, while keeping the full divisor simple normal crossing. Write
  $ K_W + Theta_W + M_W = pi^(*) \( K_Y + Theta + M_Y \) . $
  Every $pi$-exceptional component of $Theta_W$ has coefficient $1 - a \( E \; Y \, Theta + upright(bold(M)) \) < 0$, by generalized terminality. The only possible positive components of $Theta_W$ are therefore the strict transforms of the positive labels. On higher models the nef datum pulls back from $W$, so the discrepancy calculation is the ordinary one for the signed boundary $Theta_W$.
  Consider a place $E$ that is also exceptional over $W$, and let its center on $W$ have codimension $c gt.eq 2$. At a general smooth point of this center choose normal parameters $x_1 \, dots.h \, x_c$. The Jacobian formula on a smooth model carrying $E$ gives
  $ a \( E \; W \, 0 \) gt.eq sum_(i = 1)^c "ord"_E \( x_i \) \, #h(2em) "ord"_E \( x_i \) gt.eq 1 . $
  Indeed, in the pullback of a local volume form at most one differential factor can lose one order along $E$; adding one to the Jacobian order gives the displayed bound. If the center lies in no positive component of $Theta_W$, the signed boundary can only raise this discrepancy, which is at least two. Otherwise it lies in a unique positive smooth label of coefficient $b < 1$. Taking $x_1$ as its local equation and discarding the negative boundary terms gives
  #[#set math.equation(numbering: n => "(6.4)")
   $ a \( E \; Y \, Theta + upright(bold(M)) \) gt.eq \( 1 - b \) "ord"_E \( x_1 \) + sum_(i = 2)^c "ord"_E \( x_i \) . $ <eq:local-discrepancy-estimate>]
  A discrepancy less than two thus forces $c = 2$ and containment in a positive label. A label of coefficient zero cannot give such a place.
  If this codimension-two center is contained in $"Exc" \( pi \)$, it is a component of the intersection of its label with one of the finitely many exceptional divisors. There are only finitely many such centers. If it meets the isomorphism open, its general point maps isomorphically to a surface downstairs, and the center is the strict transform of that surface. Thus a center mapping to codimension at least three belongs to the first finite list, and for any fixed surface downstairs there are only finitely many possible centers on $W$.
  There are only finitely many places of discrepancy less than two whose center on $W$ equals a fixed one of these codimension-two centers. To see this, discard the negative components of $Theta_W$; this lowers discrepancies, so it suffices to work with the single smooth label of coefficient $b$. Blow up the center generically. The new exceptional coefficient is $- \( 1 - b \)$. A further place with discrepancy less than two has its center in that exceptional divisor; the estimate (6.4) also forces a codimension-two center in the strict label. It must therefore follow their intersection above the general point of the original center. At stage $j$ the most recent exceptional coefficient is $- j \( 1 - b \)$, and the older exceptional divisors do not meet this generic intersection. A place above it that is still exceptional has discrepancy at least
  $ \( 1 - b \) + 1 + j \( 1 - b \) = 1 + \( j + 1 \) \( 1 - b \) . $
  This reaches two after finitely many stages. The same argument shows that, where no other boundary or nef data enter, the places below two are exactly the echoes in (6.2).
  This generic computation identifies global places. At each global blowup there is a unique irreducible component of its exceptional divisor that dominates the dense smooth part of the center. The global analytic intersection of that prime with the strict label then has a unique irreducible component dominating the same part. These global components have coherent ideals, which define the next global blowups. Conversely, one can follow any given global place on common higher models through these blowups; when its center becomes a divisor on a normal model, that divisor represents the place. Thus the computation does not count different local pieces of one place separately.
  Finally include the finitely many divisors on $W$ that are exceptional over $Y$. The complement of the isomorphism open, and the loci where a label fails to be smooth and alone or the nef datum fails to descend, are contained in a proper analytic subset of $Y$ of codimension at least two. Such a subset has only finitely many surface components on the compact fourfold. Take these components for $cal(V)_Y$, enlarging the set by the finitely many surface images already encountered if necessary. Outside them the preceding one-label calculation applies, or there is no positive label and no place of positive weight. This proves all assertions. ◻
]

For an irreducible compact analytic surface $V subset Y$, let

#[#set math.equation(numbering: n => "(6.5)")
 $ r_(V \, h) = \# { D : med D upright(" is a prime divisor of ") S_h^nu upright(" mapping onto ") V } . $ <eq:difficulty-branches>]

This number is finite, because normalization is finite and the inverse image of $V$ has finitely many components on the compact normalization. It is zero if $V subset.not S_h$. It counts prime divisors on the normalization, without counting their possible multiple sheets over $V$ as separate divisors.

Every place with center a surface, curve, or point on the normal fourfold is exceptional over it: a place with a divisor as center is represented by that divisor. Hence the two raw sums below involve only exceptional places. Proposition 24 makes the local sum $sum_("cent"_Y \( E \) = V) w \( E \)$ finite after zero terms are omitted. Although this raw sum is finite at each fixed surface, the same nonzero contribution $d_h$ can recur at infinitely many surfaces in a label. We therefore subtract the branch contributions at each surface before summing over surfaces. Define the integer

#[#set math.equation(numbering: n => "(6.6)")
 $ q_Y \( V \) = sum_("cent"_Y \( E \) = V) w \( E \) - sum_(h in cal(H)) r_(V \, h) d_h . $ <eq:difficulty-bracket>]

Only finitely many $q_Y \( V \)$ are nonzero. Indeed, outside the finite set in Proposition 24, a surface on a positive label has raw sum $d_h$, with $r_(V \, h) = 1$ and all other branch counts zero. A surface generically on a sole zero-coefficient label has both raw sum and default zero, as does a surface away from all labels. These cases exhaust the surfaces outside that finite set.

We may therefore define the difficulty by

#[#set math.equation(numbering: n => "(6.7)")
 $ frak(D) \( Y \, Theta + upright(bold(M)) \) =  & sum_("codim"_Y "cent"_Y \( E \) gt.eq 3) w \( E \) + sum_(V subset Y\
dim V = 2) q_Y \( V \)\
 & + sum_(h in cal(H)) d_h c_2 \( S_h^nu \) \, $ <eq:difficulty>]

where the surface sum is over irreducible compact analytic surfaces. The first sum has finitely many nonzero terms by Proposition 24; the second has just been shown to have finite support; and the last is finite because $cal(H)$ is finite and every analytic cycle rank is finite. Thus $frak(D)$ is an integer. The subtraction in (6.6) is performed at each surface before the second sum is taken. Both a local bracket and the difficulty on an intermediate model are at this point allowed to be negative.

=== 6.2 The lower bound at the junctions <the-lower-bound-at-the-junctions>

The possible negative part of a surface bracket comes only from rounding the contributions of varying labels. For a surface $V$, put

$ r_V^(upright("var")) = sum_(h upright(" varying")) r_(V \, h) . $

We first prove, on every current terminal model, that

#[#set math.equation(numbering: n => "(6.8)")
 $ q_Y \( V \) gt.eq - max { r_V^(upright("var")) - 1 \, 0 } . $ <eq:difficulty-local-bound>]

The underlying fourfold is ordinarily terminal by Lemma 10, hence smooth at general points of $V$. Blow up $V$ generically to obtain a global exceptional place $E_V$. For each label let $m_h$ be its multiplicity transverse to $V$ at a general point, taking $m_h = 0$ if it does not contain $V$. The ordinary log discrepancy of $E_V$ is two. On a common carrier $pi : W arrow.r Y$ carrying this place, the nef defect $J = pi^(*) M_Y - M_W$ is effective by Lemma 9. If $j_V$ is its coefficient at $E_V$, the discrepancy formula and generalized terminality give

#[#set math.equation(numbering: n => "(6.9)")
 $ a \( E_V \; Y \, Theta + upright(bold(M)) \) = 2 - sum_h m_h b_h - j_V > 1 \, #h(2em) j_V gt.eq 0 . $ <eq:difficulty-first-blowup>]

In particular $sum_h m_h b_h < 1$.

We also have $r_(V \, h) lt.eq m_h$. To see this analytically, work at a general smooth point of $V$. Each prime divisor of $S_h^nu$ counted by $r_(V \, h)$ gives at least one point of the finite normalization over that point of $V$; the points supplied by distinct prime divisors can be taken distinct after avoiding their special loci. They correspond to distinct local analytic branches of $S_h$, each containing the germ of $V$. Each branch contributes at least one to the transverse multiplicity $m_h$. A normalization divisor with several sheets may supply more than one local branch, which preserves the stated inequality.

Let $t = r_V^(upright("var"))$, and list the numbers $N b_h$ for varying labels, repeating each one $r_(V \, h)$ times, as $x_1 \, dots.h \, x_t$. The fixed contribution $k = N sum_(h upright(" fixed")) r_(V \, h) b_h$ is a nonnegative integer. For $t gt.eq 1$, the ceiling inequality gives

$ ⌈k + sum_(ell = 1)^t x_ell⌉ gt.eq k + sum_(ell = 1)^t ceil.l x_ell ceil.r - \( t - 1 \) . $

For $t = 0$ the left side is $k$. Using effectivity, $m_h gt.eq r_(V \, h)$, and (6.9), we obtain in both cases

#[#set math.equation(numbering: n => "(6.10)")
 $ w \( E_V \) gt.eq sum_h r_(V \, h) omega \( b_h \) - max { r_V^(upright("var")) - 1 \, 0 } . $ <eq:difficulty-first-weight>]

No rounding loss is needed for a fixed label because $N b_h$ is integral.

It remains to supply the terms of $d_h$ with $j gt.eq 2$. Such a term is positive only if $b_h > 1 \/ 2$; when $b_h = 1 \/ 2$, the second echo has discrepancy exactly two and weight zero. The strict inequality $sum_h m_h b_h < 1$ implies that at most one label through $V$ has coefficient greater than $1 \/ 2$, and its multiplicity is one. This label is smooth at general points of $V$ and has $r_(V \, h) = 1$. Use its successive generic blowups above $V$. For each $j gt.eq 2$ with a positive default, the resulting global place is distinct from $E_V$ and from all the others. With this label alone its discrepancy is $1 + j \( 1 - b_h \)$. The other effective boundary components and the effective nef defect only lower the discrepancy. Its actual weight is therefore at least $omega \( 1 - j \( 1 - b_h \) \)$. These places supply every remaining default. Adding their weights to (6.10) proves (6.8), including the cases with no varying label or with zero coefficients.

#thm([Proposition 6.2.])[
  (Lower bound at crepant junctions).  #emph[At every crepant junction $h_i : \( Y_i \, Theta_i + upright(bold(M)) \) arrow.r \( X_i \, B_i + upright(bold(M)) \)$ of the truncated chain, 
$ frak(D) \( Y_i \, Theta_i + upright(bold(M)) \) gt.eq 0 . $

]
] <prop:difficulty-lower>

#proof[
  Write $Y = Y_i$ and let $Q = union.big_(h upright(" varying")) S_h$ with its reduced structure. If $Q$ is empty, (6.8) makes every surface bracket nonnegative, and the other terms of (6.7) are nonnegative. Suppose $Q eq.not diameter$. At this junction the map $h_i$ is projective bimeromorphic from an ordinarily terminal compact Kähler fourfold, and $dim h_i \( Q \) lt.eq 1$ by Proposition 16. Thus Theorem 17 applies. For a surface $V subset Q$, its branch count in that theorem is $r_V \( Q \) = r_V^(upright("var")) gt.eq 1$; the last inequality follows from the finite surjective normalizations. Surfaces outside $Q$ have $r_V^(upright("var")) = 0$. The total possible deficit in (6.8) is consequently $beta \( Q \)$.
  Every varying label has $d_h gt.eq 1$. The places counted by $tau_Y \( Q \)$ in Theorem 17 also each supply a weight of at least one in the first sum of (6.7). In fact such a place $E$ has ordinary log discrepancy two and center a singular curve in $Q$. It is exceptional over $Y$. Its center is contained in a varying label of positive coefficient, and that effective label is $bb(Q)$-Cartier on the strong model. Its order at $E$ is therefore strictly positive. On a common carrier the discrepancy formula reads
  $ a \( E \; Y \, Theta + upright(bold(M)) \) = 2 - "ord"_E \( Theta \) - "coeff"_E \( J \) < 2 \, #h(2em) J gt.eq 0 . $
  The count $tau_Y \( Q \)$ uses distinct global places. They occur as distinct terms of the codimension-at-least-three sum, and none is a place in a surface bracket. Theorem 17 now gives
  $ beta \( Q \) lt.eq sum_(h upright(" varying")) c_2 \( S_h^nu \) + tau_Y \( Q \) lt.eq sum_(h in cal(H)) d_h c_2 \( S_h^nu \) + sum_("codim"_Y "cent"_Y \( E \) gt.eq 3) w \( E \) . $
  Summing (6.8) and substituting this inequality in (6.7) proves the assertion. The branch inequality and this lower bound have been used only at the junctions. ◻
]

=== 6.3 Exact change along the chain <exact-change-along-the-chain>

For a small step, the change in the normalization cycle ranks will cancel the change in the surface defaults. We establish this equality before comparing the difficulties.

#thm([Lemma 6.3.])[
  (Normalization cycle ranks).  #emph[Consider a small step of the terminal chain, with exceptional loci $L \, L^(+)$, 
$ Y arrow.r^f Z arrow.l^(f^(+)) Y^(+) . $

 For each label $h$, let $e_h$ and $e_h^(+)$ be the numbers of prime divisors in $S_h^nu$ and $\( S_h^(+) \)^nu$ lying over $L$ and $L^(+)$, respectively. Then these numbers are finite and 
#[#set math.equation(numbering: n => "(6.11)")
 $ e_h = sum_(V subset L\
dim V = 2) r_(V \, h) \, #h(2em) e_h^(+) = sum_(V^(+) subset L^(+)\
dim V^(+) = 2) r_(V^(+) \, h)^(+) \,\
c_2 \( S_h^nu \) - c_2 \( \( S_h^(+) \)^nu \) = e_h - e_h^(+) . $ <eq:difficulty-rank-change>]

 The surface sums run over irreducible compact analytic surfaces.]
] <lem:difficulty-ranks>

#proof[
  Let $T_h$ be the normalization of the common image of the two labels in $Z$. Restricting the projective maps, composing with finite normalization, and factoring through $T_h$ gives projective bimeromorphic maps of normal compact threefolds
  $ S_h^nu arrow.r T_h arrow.l \( S_h^(+) \)^nu . $
  They identify over the common isomorphism open. By Lemma 11, the common exceptional image $A = f \( L \) = f^(+) \( L^(+) \)$ has dimension at most one. A normalization divisor lying over $L$ has a surface as its image in $S_h$, because normalization is finite, and its image in $T_h$ lies over $A$. It is therefore contracted by the displayed map. Conversely, the map is an isomorphism off the preimage of $A$, so every contracted prime divisor lies over $L$. These are exactly the primes counted in the first sum in (6.11). The same reasoning holds on the positive side. The exceptional loci have finitely many surface components, which also proves finiteness.
  We use the following independence fact. For a projective bimeromorphic map $g : S arrow.r T$ of normal compact threefolds, the classes in $H_4 \( S \, bb(Q) \)$ of the prime divisors contracted by $g$ are linearly independent. Take a resolution $r : tilde(S) arrow.r S$ that is projective, has smooth source, and is an isomorphism over $U = S_(upright("reg"))$. Put $R = r^(- 1) \( S \\ U \)$. Normality gives $dim \( S \\ U \) lt.eq 1$, and $dim R lt.eq 2$. If a rational combination of the contracted divisor classes vanished on $S$, the corresponding combination of strict transforms would restrict to zero in $H_4^(upright("BM")) \( U \, bb(Q) \)$. The localization sequence
  $ H_4 \( R \, bb(Q) \) arrow.r H_4 \( tilde(S) \, bb(Q) \) arrow.r H_4^(upright("BM")) \( U \, bb(Q) \) $
  then shows that its class is a rational combination of the classes of the surface components of $R$; those classes span $H_4 \( R \, bb(Q) \)$. Subtract that combination. We obtain a homologically trivial rational Cartier divisor on $tilde(S)$, all of whose components are exceptional over $T$. For the components of $R$, this follows since their images in $S$, hence in $T$, have dimension at most one. On the smooth compact resolution, homological triviality makes this divisor numerically trivial on every curve by the ordinary class pairing. Analytic negativity in both signs, in the form of [21] Lemma 2.2, makes the divisor zero. The strict transforms of the original divisors are distinct from the resolution-exceptional ones, so all original coefficients vanish. This proves independence without any factoriality assumption on $S$.
  For either label normalization, restrict its span of compact analytic surface classes to the common open over $T_h \\ nu^(- 1) \( A \)$, where $nu : T_h arrow.r f \( S_h \)$ is normalization. The complement of this open in either normalization has dimension at most two. Localization shows that the kernel of this restriction is spanned by its surface components, precisely the contracted prime divisors just counted. Their independence makes the kernel dimension $e_h$ on one side and $e_h^(+)$ on the other. The two images agree: any compact analytic prime surface not removed has a strict transform on the other normalization through their proper graph over $T_h$, and the two classes restrict to the same class on the common open. The same holds in the reverse direction. Subtracting the dimensions of these two cycle spans proves the last equality in (6.11). ◻
]

#thm([Proposition 6.4.])[
  (Change of the difficulty).  #emph[The difficulty is nonincreasing under every coefficient change and every small step of the truncated terminal chain. More precisely:]
  + #emph[Suppose $Theta' lt.eq Theta$ is a coefficient change on the same model $Y$, and write $w \( E \)$ and $w' \( E \)$ for its old and new weights. The set 
$ cal(C) = { E : med E upright(" exceptional over ") Y \, med w \( E \) eq.not w' \( E \) } $

 is finite, and 
#[#set math.equation(numbering: n => "(6.12)")
 $ frak(D) \( Y \, Theta + upright(bold(M)) \) - frak(D) \( Y \, Theta' + upright(bold(M)) \) = sum_(E in cal(C)) #scale(x: 120%, y: 120%)[\(] w \( E \) - w' \( E \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:difficulty-coefficient-change>]

]
  + #emph[For a small step $Y arrow.r Z arrow.l Y^(+)$ with exceptional loci $L \, L^(+)$, write $w \( E \) \, w^(+) \( E \)$ for the two weights. The set 
$ cal(P) = { E : med E upright(" exceptional over ") Y \, med "cent"_Y \( E \) subset L \, med w \( E \) + w^(+) \( E \) > 0 } $

 is finite. Its center condition is equivalently $"cent"_(Y^(+)) \( E \) subset L^(+)$, and 
#[#set math.equation(numbering: n => "(6.13)")
 $ frak(D) \( Y \, Theta + upright(bold(M)) \) - frak(D) \( Y^(+) \, Theta^(+) + upright(bold(M)) \) = sum_(E in cal(P)) #scale(x: 120%, y: 120%)[\(] w \( E \) - w^(+) \( E \) #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:difficulty-small-change>]

]
  #emph[In either move, a strict decrease in the weight of any exceptional place forces a strict decrease in the difficulty.]
] <prop:difficulty-change>

#proof[
  For a coefficient change, the removed boundary $Theta - Theta'$ is effective and $bb(Q)$-Cartier on the strong model. For every place,
  $ a \( E \; Y \, Theta' + upright(bold(M)) \) - a \( E \; Y \, Theta + upright(bold(M)) \) = "ord"_E \( Theta - Theta' \) gt.eq 0 . $
  Thus $w \( E \) gt.eq w' \( E \)$. The model, centers, branch counts, and normalization ranks are unchanged, and the defaults $d_h$ are constant by the choice of the tail. At a fixed surface the two raw sums are finite, and therefore
  $ q_Y \( V \) - q'_Y \( V \) = sum_("cent"_Y \( E \) = V) #scale(x: 120%, y: 120%)[\(] w \( E \) - w' \( E \) #scale(x: 120%, y: 120%)[\)] . $
  Let $Sigma$ be the finite union of the supports of the two functions $q_Y$ and $q'_Y$ on surfaces. Outside $Sigma$ the displayed sum is zero. Every summand is nonnegative, so no exceptional place with such a surface center can lose weight. At each surface of $Sigma$ only finitely many places have positive old or new weight, and there are only finitely many positive weights at centers of codimension at least three. This proves that $cal(C)$ is finite. Summing the displayed identity over $Sigma$, adding the finite comparison in codimension at least three, and canceling the unchanged rank term gives (6.12).
  For a small step, Lemma 11 says that exceptionality of a global place is the same on the two sides, that the two center containment conditions in the statement are equivalent, and that $w \( E \) gt.eq w^(+) \( E \)$. If a center is not contained in the exceptional locus, its general point corresponds on the common isomorphism open and its discrepancy is unchanged. The set $cal(P)$ is finite: each exceptional locus has dimension at most two and has finitely many surface components; a surface center contained in it is one of these components. Proposition 24 gives finiteness above each such surface and finiteness of all positive-weight places with lower-dimensional centers, on both sides.
  Surface centers not contained in $L$ correspond by proper strict transform to those not contained in $L^(+)$. At their general points the places, discrepancies, and normalization primes over the surfaces correspond, so the two local brackets agree. The analogous correspondence holds for the raw terms at lower-dimensional centers outside the exceptional loci. In the exceptional loci, every contributing place is counted exactly once in the raw part on each side of (6.7). This remains true if its center changes from a surface to a curve or point, or conversely. The finite comparison of those raw parts is therefore $sum_(E in cal(P)) \( w \( E \) - w^(+) \( E \) \)$. The subtracted defaults on the exceptional surfaces have difference $- sum_h d_h \( e_h - e_h^(+) \)$. Hence
  $ & frak(D) \( Y \, Theta + upright(bold(M)) \) - frak(D) \( Y^(+) \, Theta^(+) + upright(bold(M)) \)\
 & quad = sum_(E in cal(P)) #scale(x: 120%, y: 120%)[\(] w \( E \) - w^(+) \( E \) #scale(x: 120%, y: 120%)[\)] - sum_h d_h \( e_h - e_h^(+) \) + sum_h d_h #scale(x: 120%, y: 120%)[\(] c_2 \( S_h^nu \) - c_2 \( \( S_h^(+) \)^nu \) #scale(x: 120%, y: 120%)[\)]\
 & quad = sum_(E in cal(P)) #scale(x: 120%, y: 120%)[\(] w \( E \) - w^(+) \( E \) #scale(x: 120%, y: 120%)[\)] \, $
  where the last equality is Lemma 26. This is (6.13). Every summand is nonnegative. A strictly decreasing exceptional weight must have its center in the exceptional loci, since weights agree off them, and is in $cal(P)$. A positive weight that becomes zero is included by the definition of $cal(P)$. The same positivity is immediate in (6.12); this proves strictness in both cases. ◻
]

== 7 Termination and the log canonical reduction <sec:completion>

We first show that a surface in the positive exceptional locus of a downstairs diagram is detected by the integer difficulty. The calculation uses the weight denominator $N$ chosen for the particular strong gklt sequence under consideration. We then prove termination for strong gklt models, pass to elementary gdlt programs, and lift the arbitrary diagrams of Theorem 1 to those programs.

#thm([Lemma 7.1.])[
  (A positive exceptional surface).  #emph[Use the truncated terminal chain of Propositions 15 and 16, with the integer $N$, weights, and constant defaults chosen in Section 6. If an irreducible compact analytic surface $V$ is contained in $L_i^(+) subset X_(i + 1)$, there is a global place $E$, exceptional over both junctions and every model of their connector, such that 
$ a_(i + 1) \( E \) in \( 1 \, 2 \] ∩ N^(- 1) bb(Z) \, #h(2em) w_i \( E \) gt.eq w_(i + 1) \( E \) + 1 . $

 Here $w_i$ and $w_(i + 1)$ are the weights at the two crepant junctions. Consequently 
$ frak(D) \( Y_i \, Theta_i + upright(bold(M)) \) > frak(D) \( Y_(i + 1) \, Theta_(i + 1) + upright(bold(M)) \) . $

]
] <lem:positive-surface>

#proof[
  By Proposition 16, the model $X_(i + 1)$ is smooth near the general point of $V$, the junction morphism is an isomorphism there, and the generic blowup of $V$ gives a unique global place $E$ with
  $ a^(+) := a_(i + 1) \( E \) > 1 . $
  This place is exceptional over $X_(i + 1)$ and does not belong to the stabilized extracted set $cal(I)$. The blowup of the coherent ideal of $V$ is projective, so Lemma 8 gives a smooth common model $W$ carrying both $E$ and the fixed nef datum, with a projective morphism $r : W arrow.r X_(i + 1)$. By Lemma 9,
  $ J = r^(*) M_(i + 1) - M_W gt.eq 0 . $
  At the generic smooth codimension-two center, the ordinary log discrepancy of the blowup is two. The discrepancy formula is therefore
  #[#set math.equation(numbering: n => "(7.1)")
   $ a^(+) = 2 - "ord"_E \( B_(i + 1) \) - "coeff"_E \( J \) . $ <eq:positive-detector-discrepancy>]
  Both subtracted terms are nonnegative. Thus $a^(+) lt.eq 2$.
  We verify the denominator in this calculation. By the choice in Section 6, $N$ clears the coefficients of the initial boundary and the Cartier denominator of the higher nef divisor of this strong gklt sequence. Since the downstairs boundaries are strict transforms, $N B_(i + 1)$ is an integral Weil divisor. Also $N M_(i + 1)$ is an integral Weil divisor: it is the pushforward of the integral Cartier divisor $N M_W$ from a common carrier. On the smooth open neighborhood of the general point of $V$, these two integral Weil divisors are Cartier. Their orders at $E$ are consequently integral after multiplication by $N$. In particular,
  $ N "ord"_E \( B_(i + 1) \) in bb(Z) \, #h(2em) N "coeff"_E \( J \) = "ord"_E \( N r^(*) M_(i + 1) \) - "coeff"_E \( N M_W \) in bb(Z) . $
  Only Cartierness on this smooth open has been used. Equation (7.1) gives $a^(+) in \( 1 \, 2 \] ∩ N^(- 1) bb(Z)$.
  Put $a^(-) = a_i \( E \)$. The strict part of Lemma 11 applies because $"cent"_(X_(i + 1)) \( E \) = V subset L_i^(+)$, and gives $a^(-) < a^(+)$. The same lemma says that $E$ is exceptional over both downstairs models. Since it does not belong to $cal(I)$, it is not an extracted prime on either junction; it is therefore exceptional over both. All the intervening steps are small, so it stays exceptional on every model of the connector.
  Crepancy identifies the discrepancies at the junctions with $a^(-)$ and $a^(+)$. Write $k = N \( 2 - a^(+) \)$, a nonnegative integer. Since $a^(-) < a^(+) lt.eq 2$, the ceiling weights satisfy
  $ w_i \( E \) = ⌈N \( 2 - a^(-) \)⌉ gt.eq k + 1 \, #h(2em) w_(i + 1) \( E \) = ⌈N \( 2 - a^(+) \)⌉ = k . $
  This includes $a^(+) = 2$, when $k = 0$. No denominator assertion for $a^(-)$ is needed. The connector consists of one coefficient change and a finite, possibly empty, string of small steps. Its weights are nonincreasing, so the strict decrease between its ends occurs in at least one move. The place $E$ is exceptional throughout that move. Proposition 27 makes the difficulty decrease strictly there and nonincrease in every other move, proving the claim. ◻
]

#thm([Theorem 7.2.])[
  (Termination on strong gklt models).  #emph[Every sequence satisfying the hypotheses of Theorem 1 for which all the models $X_i$ are globally strongly $bb(Q)$-factorial and the initial pair $\( X_0 \, B_0 + upright(bold(M)) \)$ is gklt is finite. The small diagrams may be chosen arbitrarily subject to the hypotheses of that theorem.]
] <thm:strong-gklt>

#proof[
  Suppose such a sequence were infinite. Apply Proposition 15, then Proposition 16, and use the further truncation and denominator choice of Section 6. At every junction the difficulty is a nonnegative integer by Proposition 25. It is nonincreasing from one junction to the next by Proposition 27. By Lemma 28, it drops by at least one whenever the positive exceptional locus contains a surface. There can be only finitely many such indices. This argument uses the lower bound only at junctions; it requires no lower bound on the intermediate models.
  Pass to the remaining tail. There $dim L_i^(+) < 2$. The dimension inequality in Lemma 11 forces $dim L_i = 2$, so $L_i$ contains an irreducible compact analytic surface. By Lemma 14,
  $ c_2 \( X_i \) > c_2 \( X_(i + 1) \) $
  at every step of this tail. These are nonnegative integers, a contradiction. ◻
]

#thm([Theorem 7.3.])[
  (Termination of elementary gdlt programs).  #emph[Let 
$ \( T_0 \, B_0 + upright(bold(M)) \) arrow.r.dashed \( T_1 \, B_1 + upright(bold(M)) \) arrow.r.dashed \( T_2 \, B_2 + upright(bold(M)) \) arrow.r.dashed dots.h.c $

 be a sequence of elementary steps for rational gdlt pairs on strong normal irreducible compact Kähler fourfolds. Assume that the boundaries are effective rational divisors of finite support transported by the steps, that the fixed b-divisor is represented by an analytically nef $bb(Q)$-Cartier divisor on a projective bimeromorphic normal compact Kähler model of $T_0$, and that the actual adjoints are $bb(Q)$-Cartier with compatible canonical representatives. Then the sequence is finite. The contraction bases and the choices of elementary steps may vary.]
] <thm:gdlt>

#proof[
  An elementary program extracts no prime divisors. Lemma 14 with $k = 3$ therefore permits only finitely many divisorial steps. If the sequence were infinite, we could discard a finite prefix containing them and work on a tail of small steps. The rational b-line realization described in Section 2 has the same discrepancies and fixed higher nef data; common projective carriers for finite portions carry their analytically nef pullbacks. Thus Theorem 7 applies. After a further tail, both exceptional loci of every step avoid every generalized log canonical center on their respective sides.
  Set $H_i = floor.l B_i floor.r$. Since the pair is glc and $B_i$ is effective, its coefficients belong to $\[ 0 \, 1 \]$, so $H_i$ is the reduced sum of its coefficient-one components. Each such component is itself a generalized log canonical center. Hence $"Supp" H_i$ is disjoint from the exceptional loci adjacent to $T_i$ on this tail. The divisors $H_i$ are effective and $bb(Q)$-Cartier on the strong models, and they are strict transforms of each other across the small steps.
  Remove the whole floor and write
  $ hat(B)_i = B_i - H_i \, #h(2em) hat(D)_i = K_(T_i) + hat(B)_i + M_(T_i) = D_i - H_i . $
  The new boundary is effective. For every global place $E$, comparison of the two crepant equations gives
  #[#set math.equation(numbering: n => "(7.2)")
   $ a \( E \; T_i \, hat(B)_i + upright(bold(M)) \) = a \( E \; T_i \, B_i + upright(bold(M)) \) + "ord"_E \( H_i \) . $ <eq:full-floor-deletion>]
  The added order is nonnegative. If the old discrepancy is zero, the gdlt definition says that the general point of its center is a stratum of the coefficient-one boundary. Taking its closure places the entire center in $"Supp" H_i$. The order of an effective $bb(Q)$-Cartier divisor at a place whose center lies in its support is strictly positive. Thus every former zero discrepancy becomes positive, and every former positive discrepancy stays positive. The pairs $\( T_i \, hat(B)_i + upright(bold(M)) \)$ are gklt.
  We check the two ample signs after this full deletion. For a step write
  $ T_i arrow.r^f Z arrow.l^(f^(+)) T_(i + 1) \, #h(2em) L = "Exc" \( f \) \, quad L^(+) = "Exc" \( f^(+) \) . $
  Lemma 11 gives a common exceptional image $A$ with $L = f^(- 1) \( A \)$, $L^(+) = \( f^(+) \)^(- 1) \( A \)$, and both maps isomorphisms off $A$. Properness makes $f \( "Supp" H_i \)$ closed. It is disjoint from $A$, because $"Supp" H_i ∩ L = diameter$. On the base open $Z \\ f \( "Supp" H_i \)$, which contains $A$, the divisor $H_i$ vanishes, so $- hat(D)_i = - D_i + H_i$ has the original relative ample sign. On $Z \\ A$ the map $f$ is an isomorphism, and every line bundle is relatively ample for an isomorphism. These two opens cover $Z$. After clearing a common Cartier multiple, relative ampleness is local on the base, so $- hat(D)_i$ is $f$-ample. The identical argument with $f^(+)$ and $H_(i + 1)$ proves that $hat(D)_(i + 1) = D_(i + 1) - H_(i + 1)$ is $f^(+)$-ample.
  Reindex this floor-deleted tail at its first model and regard it as a sequence of the arbitrary small diagrams in Theorem 29. The model and diagram hypotheses are inherited; the new boundaries are effective and related by strict transform, the actual adjoints are $bb(Q)$-Cartier, and the two ample signs have just been checked. A common carrier for the finite preceding portion, projective over the new first model, supplies the fixed analytically nef divisor. In this application the detector integer is chosen afresh for the new initial boundary and nef carrier. The theorem makes the tail finite, contradicting its construction. ◻
]

To lift a prescribed downstairs diagram, we run gdlt continuation over its base. Theorem 30 forces the chosen run to reach a nef adjoint, and Lemma 13 gives a projective crepant morphism from that endpoint to the prescribed positive model. A negative multisection ensures that the run contains a step.

#thm([Lemma 7.4.])[
  (A nonempty gdlt lift).  #emph[Let 
$ X arrow.r^(med f med) Z arrow.l^(med f^(+) med) X^(+) $

 be any one of the small diagrams allowed in Theorem 1, with normal globally Weil $bb(Q)$-factorial compact Kähler fourfolds on the two sides, effective rational boundaries $B \, B^(+)$ related by strict transform, the same rational nef b-divisor, and the compatible actual adjoints $D_X \, D_(X^(+))$. Assume $\( X \, B + upright(bold(M)) \)$ is glc, and represent the b-divisor by an analytically nef $bb(Q)$-Cartier divisor on a projective carrier over $X$. Suppose 
$ h : \( Y \, Theta + upright(bold(M)) \) arrow.r \( X \, B + upright(bold(M)) \) $

 is a projective crepant gdlt modification as in Proposition 6; in particular $Y$ is strong, $Theta gt.eq 0$, and every $h$-exceptional prime has coefficient one. Then there is a finite sequence of elementary negative gdlt steps over $Z$, of length $m gt.eq 1$, 
$ \( Y \, Theta + upright(bold(M)) \) = \( Y_0 \, Theta_0 + upright(bold(M)) \) arrow.r.dashed dots.h.c arrow.r.dashed \( Y_m \, Theta_m + upright(bold(M)) \) \, $

 and a projective bimeromorphic morphism $h^(+) : Y_m arrow.r X^(+)$ such that 
$ K_(Y_m) + Theta_m + M_(Y_m) = \( h^(+) \)^(*) D_(X^(+)) . $

 The end is a strong normal compact Kähler gdlt model with effective boundary, and every $h^(+)$-exceptional prime has coefficient one in $Theta_m$. Thus it is again a crepant gdlt modification of the same type.]
] <lem:nonempty-lift>

#proof[
  The composite $Y arrow.r Z$ is projective bimeromorphic to a normal compact Kähler base. On a projective common carrier, the fixed analytically nef divisor is nef over $Z$. Thus the continuation assertion of Proposition 5 applies to this gdlt pair and to every non-nef finite prefix produced from it.
  The initial adjoint $D_Y = h^(*) D_X$ is not nef over $Z$. Indeed, the nonisomorphic projective contraction $f$ has a positive-dimensional fiber, and projective hyperplane cuts give a compact irreducible curve $C$ in that fiber. The negative ample sign gives $D_X dot.op C < 0$. There is a compact irreducible curve $C' subset Y$ mapping onto $C$. For completeness, normalize $C$, take an irreducible component of its base change under $h$ which dominates that normalization, and write $r$ for its generic fiber dimension. The normalization of $C$ is a projective compact curve, so this component, being projective over it, is projective. A sufficiently high very ample system on the component has $r$ general members whose intersection with a generic fiber is a nonempty zero-dimensional cycle. Their intersection therefore has a compact curve component dominating the base. Its image in $Y$ is such a $C'$. The induced map of normalized curves has a positive finite degree. The projection formula now gives
  $ D_Y dot.op C' = deg \( C' \/ C \) thin D_X dot.op C < 0 . $
  In particular, any run reaching nefness must contain at least one step.
  Choose an elementary negative step whenever the current adjoint is not nef over $Z$. The relative continuation assertion keeps all outputs projective over $Z$, strong normal compact Kähler, and gdlt with the transported data. All models in the run are irreducible: $Y$ is bimeromorphic to the irreducible $X$, and every elementary step is bimeromorphic. If this process never reached a nef adjoint, it would give an infinite elementary gdlt sequence with the fixed analytically nef b-divisor. This contradicts Theorem 30. We obtain a finite run of length $m gt.eq 1$ with end adjoint $D_(Y_m)$ nef over $Z$.
  Take a smooth common model $W$ with projective maps to the models in the run, to $X^(+)$, and to the nef carrier, all over $Z$. Write $P_0 \, P \, P_(+)$ for the pullbacks of $D_Y \, D_(Y_m) \, D_(X^(+))$, respectively. By Lemma 12, the finite run gives
  $ P_0 = P + G \, #h(2em) G gt.eq 0 upright(" exceptional over ") Y_m . $
  Initial crepancy identifies $P_0$ with the pullback of $D_X$. Lemma 11, pulled to $W$, gives the second comparison
  $ P_0 = P_(+) + F \, #h(2em) F gt.eq 0 upright(" exceptional over ") X^(+) . $
  The first end is nef over $Z$, and $D_(X^(+))$ is ample over $Z$. Lemma 13 therefore gives an actual equality $P = P_(+)$ and a projective morphism $h^(+) : Y_m arrow.r X^(+)$ over $Z$ with $D_(Y_m) = \( h^(+) \)^(*) D_(X^(+))$.
  The end is strong, gdlt, and has effective boundary by the relative program. It remains to check its exceptional primes. Every prime on $Y_m$ has a strict-transform prime on $Y$, because an elementary program extracts no prime divisors. Let $R$ be exceptional for $h^(+)$, and let $R_0$ be its prime on $Y$. If $R_0$ were not exceptional for $h$, it would represent a prime on $X$. Smallness downstairs identifies that prime with a prime on $X^(+)$. The place of $R$ would then have a divisorial center on $X^(+)$, contradicting its exceptionality. Hence $R_0$ is $h$-exceptional and has coefficient one in $Theta$. Boundary coefficients of surviving primes are unchanged by an elementary program, so $R$ has coefficient one in $Theta_m$. The displayed crepant equality also identifies its discrepancy over $X^(+)$ as zero. This proves the lemma. ◻
]

#proof[
  Assume that the sequence in the theorem is infinite. By Lemma 11, every global discrepancy is nondecreasing along it. Hence every $\( X_i \, B_i + upright(bold(M)) \)$ is glc. The rational b-line realization of the initial data satisfies Proposition 6: $X_0$ is a normal compact Kähler fourfold, the boundary is effective and rational, the nef datum has a projective carrier, and the adjoint is rationally invertible. The proposition gives a projective crepant gdlt modification
  $ h_0 : \( Y_0 \, Theta_0 + upright(bold(M)) \) arrow.r \( X_0 \, B_0 + upright(bold(M)) \) $
  with a strong normal compact Kähler source and only coefficient-one exceptional primes. It requires no strong factoriality of $X_0$.
  Apply Lemma 31 to the first downstairs diagram and $h_0$. Its endpoint is a crepant gdlt modification of the same type over $X_1$, so it is the input for the next application. At every finite stage a common projective carrier supplies the fixed analytically nef data over the current downstairs model. Induction therefore lifts every downstairs diagram. Each lifted string is finite and contains at least one elementary step, and its endpoint is used as the literal starting model of the next string. Their concatenation is an infinite sequence of elementary gdlt steps on strong normal irreducible compact Kähler fourfolds, with the same b-divisor throughout. Theorem 30 allows the bases to vary and rules out this sequence. The contradiction proves Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Valery Alexeev, Christopher Hacon, and Yujiro Kawamata, #emph[Termination of (many) 4-dimensional log flips], Invent. Math. #strong[168] (2007), no.~2, 433--448. #link("https://doi.org/10.1007/s00222-007-0038-1").]
#bibitem([2])[Edward Bierstone and Pierre D. Milman, #emph[Canonical desingularization in characteristic zero by blowing up the maximum strata of a local invariant], Invent. Math. #strong[128] (1997), no.~2, 207--302. #link("https://doi.org/10.1007/s002220050141").]
#bibitem([3])[Caucher Birkar and De-Qi Zhang, #emph[Effectivity of Iitaka fibrations and pluricanonical systems of polarized pairs], Publ. Math. Inst. Hautes Études Sci. #strong[123] (2016), 283--331. #link("https://doi.org/10.1007/s10240-016-0080-x").]
#bibitem([4])[Guodu Chen and Nikolaos Tsakanikas, #emph[On the termination of flips for log canonical generalized pairs], Acta Math. Sin. (Engl. Ser.) #strong[39] (2023), no.~6, 967--994. #link("https://doi.org/10.1007/s10114-023-0116-3").]
#bibitem([5])[Pierre Deligne, #emph[Théorème de Lefschetz et critères de dégénérescence de suites spectrales], Publ. Math. Inst. Hautes Études Sci. #strong[35] (1968), 107--126. #link("https://doi.org/10.1007/BF02698925").]
#bibitem([6])[Pierre Deligne, #emph[Théorie de Hodge : II], Publ. Math. Inst. Hautes Études Sci. #strong[40] (1971), 5--57. #link("https://doi.org/10.1007/BF02684692").]
#bibitem([7])[Pierre Deligne, #emph[Théorie de Hodge : III], Publ. Math. Inst. Hautes Études Sci. #strong[44] (1974), 5--77. #link("https://doi.org/10.1007/BF02685881").]
#bibitem([8])[Franc Forstnerič, #emph[Extending holomorphic mappings from subvarieties in Stein manifolds], Ann. Inst. Fourier (Grenoble) #strong[55] (2005), no.~3, 733--751. #link("https://doi.org/10.5802/aif.2112").]
#bibitem([9])[Osamu Fujino, #emph[Addendum to “Termination of 4-fold canonical flips”], Publ. Res. Inst. Math. Sci. #strong[41] (2005), no.~1, 251--257. #link("https://doi.org/10.2977/PRIMS/1145475410").]
#bibitem([10])[Osamu Fujino, #emph[Minimal model program for projective morphisms between complex analytic spaces], arXiv:2201.11315v1 (2022). #link("https://arxiv.org/abs/2201.11315v1").]
#bibitem([11])[Mark Goresky and Robert MacPherson, #emph[Intersection homology II], Invent. Math. #strong[72] (1983), no.~1, 77--129. #link("https://doi.org/10.1007/BF01389130").]
#bibitem([12])[Hans Grauert, #emph[Über Modifikationen und exzeptionelle analytische Mengen], Math. Ann. #strong[146] (1962), 331--368. #link("https://doi.org/10.1007/BF01441136").]
#bibitem([13])[Alexander Grothendieck, #emph[Techniques de construction et théorèmes d'existence en géométrie algébrique IV : les schémas de Hilbert], in #emph[Séminaire Bourbaki : années 1960/61, exposés 205--222], Séminaire Bourbaki #strong[6], Société Mathématique de France, 1961, Exposé 221, 249--276; erratum, vol.~7 (1962), p.~302. #link("https://www.numdam.org/item/SB_1960-1961__6__249_0/").]
#bibitem([14])[Christopher Hacon and Joaquín Moraga, #emph[On weak Zariski decompositions and termination of flips], Math. Res. Lett. #strong[27] (2020), no.~5, 1393--1421. #link("https://doi.org/10.4310/MRL.2020.v27.n5.a6").]
#bibitem([15])[Christopher Hacon and Lingyao Xie, #emph[On the Kähler MMP and the transcendental base-point-free theorem], arXiv:2607.24986v1 (2026), submitted July 27, 2026. #link("https://arxiv.org/abs/2607.24986v1").]
#bibitem([16])[Jingjun Han, Jihao Liu, and Ziquan Zhuang, #emph[Effective termination of general type MMPs in dimension at most five], arXiv:2509.01501v1 (2025). #link("https://arxiv.org/abs/2509.01501v1").]
#bibitem([17])[Yujiro Kawamata, Katsumi Matsuda, and Kenji Matsuki, #emph[Introduction to the minimal model problem], in #emph[Algebraic Geometry, Sendai, 1985], Tadao Oda (ed.), Advanced Studies in Pure Mathematics #strong[10], North-Holland, Amsterdam, 1987, 283--360. #link("https://doi.org/10.2969/aspm/01010283").]
#bibitem([18])[Joaquín Moraga, #emph[Termination of pseudo-effective 4-fold flips], Math. Z. #strong[310] (2025), no.~4, Article 73, 32 pp. #link("https://doi.org/10.1007/s00209-025-03766-y").]
#bibitem([19])[OpenAI, #emph[Finite ordinary minimal model programs on compact Kähler fourfolds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Finite-ordinary-minimal-model-programs-on-compact-Kahler-fourfolds-October-5-2026/paper.pdf")[OAI:Finite-ordinary-minimal-model-programs-on-compact-Kahler-fourfolds-October-5-2026], 2026.]
#bibitem([20])[OpenAI, #emph[Termination for projective log canonical fourfolds with rational boundary], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Termination-for-projective-log-canonical-fourfolds-with-rational-boundary-September-24-2026/paper.pdf")[OAI:Termination-for-projective-log-canonical-fourfolds-with-rational-boundary-September-24-2026], 2026.]
#bibitem([21])[OpenAI, #emph[Termination of generalized-canonical flips on compact Kähler fourfolds], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Termination-of-generalized-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026/termination-generalized-terminal-flips-compact-kahler-fourfolds.pdf")[OAI:Termination-of-generalized-canonical-flips-on-compact-Kahler-fourfolds-October-5-2026], 2026.]
#bibitem([22])[Michèle Raynaud, #emph[Géométrie algébrique et géométrie analytique], in #emph[Revêtements étales et groupe fondamental (SGA 1)], Alexander Grothendieck (ed.), Lecture Notes in Mathematics #strong[224], Springer-Verlag, Berlin--Heidelberg, 1971, Exposé XII, 311--343. #link("https://doi.org/10.1007/BFb0058667").]
#bibitem([23])[Morihiko Saito, #emph[Modules de Hodge polarisables], Publ. Res. Inst. Math. Sci. #strong[24] (1988), no.~6, 849--995. #link("https://doi.org/10.2977/PRIMS/1195173930").]
#bibitem([24])[Jean-Pierre Serre, #emph[Géométrie algébrique et géométrie analytique], Ann. Inst. Fourier (Grenoble) #strong[6] (1956), 1--42. #link("https://doi.org/10.5802/aif.59").]
#bibitem([25])[V. V. Shokurov, #emph[The nonvanishing theorem], Math. USSR-Izv. #strong[26] (1986), no.~3, 591--604. Russian original: Izv. Akad. Nauk SSSR Ser. Mat. #strong[49] (1985), no.~3, 635--651. #link("https://doi.org/10.1070/IM1986v026n03ABEH001160").]


