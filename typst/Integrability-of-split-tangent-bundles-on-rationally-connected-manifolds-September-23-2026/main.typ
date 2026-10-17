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

#align(center)[#text(size: 16pt, weight: "bold")[Integrability of split tangent bundles \
on rationally connected manifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

A product of complex manifolds has a tangent bundle split into the pullbacks of the tangent bundles of its factors. A converse must keep track of more than the abstract bundles. For a specified decomposition

$ T_X = E_1 xor E_2 \, $

the embeddings of $E_1$ and $E_2$ in $T_X$ are part of the data, and a compatible product must identify these subbundles with its factor directions. A necessary local condition is #emph[integrability]: the holomorphic local sections of each $E_i$ must be closed under the Lie bracket.

We prove that rational connectedness forces this local condition. Here and below, “two general points” means all pairs in some nonempty Zariski open subset of $X times X$. A smooth connected projective complex manifold is rationally connected if two general points lie on the image of a morphism $bb(P)^1 arrow.r X$.

#thm([Theorem 1.1.])[
  (Automatic integrability).  #emph[Let $X$ be a smooth connected projective complex manifold of dimension at least two. Suppose that two general points of $X$ lie on the image of a morphism $bb(P)^1 arrow.r X$. For every specified holomorphic decomposition 
$ T_X = E_1 xor E_2 $

 into subbundles of positive rank, both $E_1$ and $E_2$ are integrable.]
] <thm:main>

The theorem has no further rank or positivity hypothesis. It proves the smooth rationally connected assertion formulated in [8] Conjecture 1.5. Höring’s earlier product theorem then answers the global question for the same specified splitting.

#thm([Corollary 1.2.])[
  (Compatible product).  #emph[Under the hypotheses of 1, there are smooth projective manifolds $X_1 \, X_2$ and an isomorphism $X tilde.eq X_1 times X_2$ under which 
$ E_i = "pr"_i^(*) T_(X_i) #h(2em) \( i = 1 \, 2 \) . $

]
] <cor:product>

#proof[
  Höring’s [6] Theorem 1.4 applies to a smooth connected rationally connected projective complex manifold with a specified splitting of its tangent bundle and at least one integrable summand. By 1, these hypotheses hold. His theorem gives an isomorphism with a product that identifies the specified summands with the factor tangent bundles. Each factor is smooth. It is projective because its realization as a slice of the product is a closed complex submanifold of $X$, and a projective embedding of $X$ restricts to an embedding of that slice. ◻
]

=== Context and scope <context-and-scope>

Beauville studied how a tangent-bundle splitting on a compact Kähler manifold can lead to a product of its universal cover [3]. An abstract product need not make a given summand integrable: Höring’s [6] Example 2.14 gives a nonintegrable summand on a product of an abelian surface with $bb(P)^1$. Rational connectedness rules out that example and supplies the abundance of rational curves used in our proof.

Several earlier results establish compatible products under positivity or rank assumptions. Campana and Peternell treated Fano manifolds with a two-summand splitting when one summand has rank one or two, and hence every two-summand splitting on a Fano manifold of dimension at most five [4] Theorems 3.5–3.6 and Corollary 3.7. Höring’s [6] Theorem 1.4 showed that, for a rationally connected projective manifold, integrability of one summand already gives a compatible product. He then isolated the remaining question by conjecturing that at least one summand is integrable [7] Conjecture 1.2. His later low-rank result applies to a uniruled projective manifold whose tangent bundle splits into summands all of rank at most two, and proves that at least one of them is integrable [7] Lemma 4.21.

The recent Fano-type theorem [8] Theorem 1.1 establishes integrability with algebraic leaves for split tangent sheaves on normal $bb(Q)$-factorial projective klt varieties of Fano type. In the smooth Fano case it yields an actual compatible product [8] Corollary 1.3. The present theorem removes this positivity condition for smooth rationally connected manifolds. Smoothness matters: [8] Example 4.3 gives a singular rationally connected example with a nonintegrable summand. Section 5 applies the smooth theorem to general fibers of the rationally connected quotient, supplying the integrability premise in Höring’s structure theorems for uniruled compact Kähler manifolds.

=== Proof strategy <proof-strategy>

The construction that drives the proof does not require rational connectedness. Given any holomorphic map $g : bb(P)^1 arrow.r X$ into a smooth projective manifold with a split tangent bundle, we construct

$ F : bb(P)^1 times bb(P)^1 arrow.r X \, #h(2em) F \( s \, s \) = g \( s \) \, $

with the first factor direction tangent to $E_1$ and the second tangent to $E_2$. We call $F$ a #emph[tangent box]. The name records these tangencies; the map may have critical points and need not give local coordinates.

Write $P_i : T_X arrow.r E_i subset T_X$ for the holomorphic projectors defined by the splitting. The diagonal first carries a formal solution. In coordinates $u = s$, $v = t - s$, the equation $partial_v hat(F) = P_2 \( hat(F) \) partial_u hat(F)$ recursively separates the derivative of $g$ into its two summands. The positive normal bundle of the diagonal then bounds the number of global formal sections of a twisted line bundle. Comparing that bound with pairs of polynomial sections forces the formal projective coordinate ratios to be rational. A local cancellation makes these ratios holomorphic near a diagonal patch. Finally, on a resolution of the rational map, the two tangency identities force every exceptional curve to be contracted. The resulting map is holomorphic on the entire product. The section-count argument is given directly for holomorphic formal series; the algebraic formal-function literature provides broader context [5,1].

The splitting also provides the projected-bracket partial connection $nabla_xi^i e = P_i \[ xi \, e \]$ on $E_i$ in directions of the complementary summand. On a tangent box it gives transport along the fibers of $"pr"_i$, which vary the complementary factor, and hence

$ F^(*) E_i tilde.eq "pr"_i^(*) \( g^(*) E_i \) \, $

normalized to be the identity on the diagonal. Thus, on a factor curve, the corresponding summand retains the bundle $g^(*) E_i$, while the complementary summand is trivial.

Rational connectedness enters only in the last step. A two-point family of rational curves supplies sections of $g^(*) E_i$ that vanish at one marked point and span the summand at another. Applying the bracket tensor $and.big^2 E_i arrow.r E_j$ to two such sections on a factor curve gives a section of a trivial bundle on $bb(P)^1$. It is constant and vanishes at the first mark, so it vanishes at the second. The spanning property then kills the bracket tensor on an open set of $X$, and hence everywhere. The use of rational curves to annihilate this tensor has a direct antecedent in [6] Section 2.B and Lemma 3.18; the tangent box supplies the trivial complementary target in arbitrary rank.

=== Organization <organization>

2 constructs tangent boxes through the formal Cauchy problem, rational reconstruction, and removal of indeterminacy. 3 establishes the bundle identifications, and 4 proves 1. The rational-quotient consequence follows in 5. Appendix 6 proves the required point-blowup resolution for a surface, and Appendix 7 derives the two-point family directly from rational connectedness.

== 2 Tangent boxes <sec:boxes>

Throughout this section, $X$ is a smooth projective complex manifold with a fixed splitting $T_X = E_1 xor E_2$. Let $P_i : T_X arrow.r E_i subset T_X$ be the corresponding holomorphic projectors. Put

$ C = bb(P)^1 \, #h(2em) S = C times C \, #h(2em) Delta = { \( s \, s \) : s in C } \, $

and write $T^(\( i \)) = "pr"_i^(*) T_C subset T_S$.

#thm([Proposition 2.1.])[
  (Tangent box).  #emph[Every holomorphic map $g : C arrow.r X$ admits a holomorphic map $F : S arrow.r X$ such that 
#[#set math.equation(numbering: n => "(2.1)")
 $ F \|_Delta = g \, #h(2em) d F \( T^(\( 1 \)) \) subset F^(*) E_1 \, #h(2em) d F \( T^(\( 2 \)) \) subset F^(*) E_2 . $ <eq:box>]

 Neither summand is assumed integrable.]
] <prop:box>

The proof has three stages. The projectors first determine a formal map along $Delta$. A count of formal sections then produces a rational map with that expansion near part of the diagonal. Finally, the two tangency conditions force every exceptional curve in a resolution to be contracted, so the rational map is holomorphic on all of $S$.

=== 2.1 The formal Cauchy problem <the-formal-cauchy-problem>

We specify the analytic formal neighborhood in which the first stage takes place. Let $cal(I) subset cal(O)_S$ be the analytic ideal sheaf of $Delta$, and let $iota : Delta arrow.r.hook S$ be the inclusion. On the topological space $Delta$, set

$ hat(cal(O))_(S \, Delta) = "proj lim"_(n gt.eq 0) iota^(- 1) \( cal(O)_S \/ cal(I)^(n + 1) \) \, #h(2em) hat(cal(I)) = ker \( hat(cal(O))_(S \, Delta) arrow.r cal(O)_Delta \) . $

Thus the analytic completion is the ringed space $hat(S)_Delta = \( Delta \, hat(cal(O))_(S \, Delta) \)$. On a diagonal coordinate disk with coordinates $u = s$, $v = t - s$, its structure sheaf is $cal(O)_Delta \[ \[ v \] \]$, and $hat(cal(I)) = \( v \)$. The coefficients are holomorphic along the disk; convergence in the normal variable $v$ is not required.

A formal holomorphic map $hat(G) : hat(S)_Delta arrow.r Y$ to a complex manifold $Y$ consists of a holomorphic diagonal map $g_0 : Delta arrow.r Y$ and a morphism of sheaves of $bb(C)$-algebras

$ hat(G)^(\#) : g_0^(- 1) cal(O)_Y arrow.r hat(cal(O))_(S \, Delta) $

reducing to $g_0^(\#)$ modulo $hat(cal(I))$. We require this map to be given locally by holomorphic Taylor substitution, as follows. On a source disk with the above $cal(O)_Delta \[ \[ v \] \]$ description, view functions of $u$ as constant series in $v$. In target coordinates $z = \( z^1 \, dots.h \, z^q \)$, put $f = \( hat(G)^(\#) z^1 \, dots.h \, hat(G)^(\#) z^q \)$ and $eta = f - z compose g_0 in hat(cal(I))^(xor q)$. For a holomorphic function $h$ on the target chart, substitution at order $n$ is

$ hat(G)^(\#) h med mod med hat(cal(I))^(n + 1) = sum_(\| alpha \| lt.eq n) frac(\( partial^alpha h \) \( z compose g_0 \), alpha !) thin eta^alpha med mod med hat(cal(I))^(n + 1) . $

Every monomial in $eta$ of total degree $n + 1$ is zero at this order, so the sum is finite. These substitutions are compatible as $n$ varies and preserve products and holomorphic coordinate changes. Consequently, one can specify a formal map by coordinate series with the stated constant terms, provided that on overlaps they agree by these substitutions. The same rule then determines the pullback of every holomorphic function, not only of the coordinate functions.

A source holomorphic vector field $D$ satisfies $D \( cal(I)^(k + 1) \) subset cal(I)^k$ for $k gt.eq 0$, and hence acts as a continuous derivation on the completion. Locally, $partial_u$ differentiates the coefficients of a series and $partial_v$ differentiates its powers of $v$. A derivation can lower the normal order, so it need not define a derivation on any one fixed-order thickening. Formal differential identities below are equalities in the completion. In target coordinates they are equalities of vectors of formal series; the formal chain rule makes them independent of the target coordinates.

#thm([Lemma 2.2.])[
  #emph[There is a unique formal holomorphic map $hat(F)$ along $Delta$ with diagonal value $g$ and the two tangency properties in (2.1), interpreted formally.]
] <lem:formal>

#proof[
  Use the same coordinate on a source chart in each factor, denoting the two coordinates by $s \, t$. Set
  $ u = s \, #h(2em) v = t - s . $
  After restricting the diagonal disk so that $g$ takes values in one target coordinate chart, impose
  #[#set math.equation(numbering: n => "(2.2)")
   $ hat(F) \( u \, 0 \) = g \( u \) \, #h(2em) partial_v hat(F) = P_2 \( hat(F) \) partial_u hat(F) . $ <eq:cauchy>]
  Here the entries of the holomorphic matrix $P_2$ are substituted by the Taylor rule above. That rule preserves $P_2^2 = P_2$ and $P_1 + P_2 = "id"$.
  Because $partial_u = partial_s + partial_t$ and $partial_v = partial_t$, (2.2) is equivalent to
  $ P_1 \( hat(F) \) partial_t hat(F) = 0 \, #h(2em) P_2 \( hat(F) \) partial_s hat(F) = 0 . $
  Indeed, the equation puts $partial_v hat(F)$ in the image of $P_2 \( hat(F) \)$, while applying $P_2 \( hat(F) \)$ to $partial_u hat(F) - partial_v hat(F)$ gives zero. Conversely, these two statements recover (2.2). They are exactly the two formal tangency conditions.
  Write $hat(F) = sum_(k gt.eq 0) f_k \( u \) v^k$, with $f_0 = g$ in the chosen coordinates. At order zero, (2.2) gives
  $ f_1 = P_2 \( g \) g' . $
  Thus along the diagonal the second-factor derivative is $P_2 \( g \) g'$, and the first-factor derivative is its complement $g' - f_1 = P_1 \( g \) g'$. The higher coefficients extend this forced first-order decomposition. The coefficient of $v^k$ on the right side of (2.2) involves only $f_0 \, dots.h \, f_k$ and their $u$-derivatives. It determines $\( k + 1 \) f_(k + 1)$, so induction gives a unique solution whose coefficients are holomorphic on the diagonal disk.
  We verify that these local solutions define a formal map globally. Under a target-coordinate change $z' = psi \( z \)$, Taylor substitution gives $hat(F)' = psi \( hat(F) \)$, and the formal chain rule gives $D hat(F)' = d psi \( hat(F) \) D hat(F)$. The matrix of $P_2$ changes by the corresponding conjugation, so (2.2) is preserved. For a source change $s' = h \( s \)$, $t' = h \( t \)$, one has
  $ u' = h \( u \) \, #h(2em) v' = h \( u + v \) - h \( u \) . $
  The new normal parameter is $v$ times a unit, so this substitution identifies the two completions. With
  $ a = frac(1, h' \( u \)) \, #h(2em) b = frac(1, h' \( u + v \)) \, $
  the continuous source derivations transform as
  $ partial_(v') = b partial_v \, #h(2em) partial_(u') = a partial_u + \( b - a \) partial_v . $
  Since $P_2 \( hat(F) \) partial_v hat(F) = partial_v hat(F)$, these formulas imply
  $ P_2 \( hat(F) \) partial_(u') hat(F) = b partial_v hat(F) = partial_(v') hat(F) . $
  The initial value also transforms to the same diagonal map. Local uniqueness therefore identifies the coordinate series on every overlap. Their Taylor substitution maps agree as well, since those maps are determined by the coordinate series. This proves both global existence and uniqueness. ◻
]

=== 2.2 Rational reconstruction along the diagonal <rational-reconstruction-along-the-diagonal>

We next recover an ordinary rational map from the formal one. The positive normal bundle of $Delta$ bounds the number of formal sections after twisting; comparison with pairs of polynomial sections then forces each formal coordinate ratio to be rational. The classical study of algebraic formal rational functions provides background for this mechanism; see Hironaka–Matsumura [5] and Bădescu [1]. The proof below works directly in the analytic completion just defined, including the passage to an ordinary holomorphic map near the diagonal.

We use the notation $cal(O)_S \( m \, m \) = "pr"_1^(*) cal(O)_C \( m \) ⊗ "pr"_2^(*) cal(O)_C \( m \)$.

#thm([Lemma 2.3.])[
  #emph[Let $Y subset bb(P)^N$ be a closed complex submanifold and let $hat(G)$ be a formal holomorphic map from the formal neighborhood of $Delta subset S$ to $Y$. There is a rational map $R : S arrow.r.dashed bb(P)^N$ that is holomorphic on a neighborhood of a nonempty open subset of $Delta$, where its formal expansion agrees with $hat(G)$. On that neighborhood it takes values in $Y$.]
] <lem:rational>

#proof[
  Write $g_0 = hat(G) \|_Delta$. We first construct the formal pullback of $cal(O)_(bb(P)^N) \( 1 \)$. Choose a cover of $g_0 \( Delta \)$ by affine projective charts $U_a$ with holomorphic frames $e_a$ of this line bundle, and write $e_b = t_(a b) e_a$ on overlaps. Restricting $t_(a b)$ to $Y$ and applying $hat(G)^(\#)$ gives formal functions $hat(t)_(a b)$ on $g_0^(- 1) \( U_a ∩ U_b \)$. Their constant terms are $t_(a b) compose g_0$, which are nowhere zero. Thus each $hat(t)_(a b)$ is a unit in the completion. The substitutions preserve the transition cocycle identities, so the relations $hat(e)_b = hat(t)_(a b) hat(e)_a$ glue free rank-one modules into a locally free $hat(cal(O))_(S \, Delta)$-module $L$.
  If the homogeneous coordinate section $x_nu$ is $c_(nu \, a) e_a$ on $U_a$, evaluate $c_(nu \, a) \|_Y$ by the same substitution. The resulting local sections $hat(G)^(\#) \( c_(nu \, a) \|_Y \) hat(e)_a$ agree on overlaps, giving global sections $S_0 \, dots.h \, S_N$ of this very module $L$. Its reduction $L_0 = L \/ hat(cal(I)) L$ is the ordinary holomorphic line bundle $g_0^(*) cal(O)_(bb(P)^N) \( 1 \)$ on $Delta tilde.eq C$. The reductions of the coordinate sections have no common zero, so after reordering, $S_0 \|_Delta$ is not identically zero. Its zero divisor has some degree $d gt.eq 0$ and identifies
  $ L_0 tilde.eq cal(O)_C \( d \) . $
  For example, a degree-$d$ homogeneous polynomial with the same zero divisor gives this identification directly.
  For a fixed $m gt.eq 0$, let $hat(cal(O))_S \( m \, m \)$ denote the restriction of the ordinary line bundle to the completion, and put
  $ cal(M)_m = L ⊗_(hat(cal(O))_(S \, Delta)) hat(cal(O))_S \( m \, m \) \, #h(2em) V = H^0 \( Delta \, cal(M)_m \) \, $
  $ V_k = H^0 \( Delta \, hat(cal(I))^(thin k) cal(M)_m \) subset V quad \( k gt.eq 0 \) . $
  Thus $V_0 = V$, and $V_k$ consists precisely of global formal sections vanishing to normal order at least $k$. Passing a section to its class modulo $hat(cal(I))^(k + 1) cal(M)_m$ has kernel $V_(k + 1)$. It gives the leading-coefficient injection
  #[#set math.equation(numbering: n => "(2.3)")
   $ V_k \/ V_(k + 1) arrow.r.hook H^0 #scale(x: 120%, y: 120%)[\(] C \, cal(O)_C \( d + 2 m - 2 k \) #scale(x: 120%, y: 120%)[\)] . $ <eq:graded>]
  Indeed, the leading-coefficient sheaf is
  $ frac(hat(cal(I))^(thin k) cal(M)_m, hat(cal(I))^(thin k + 1) cal(M)_m) tilde.eq L_0 ⊗ cal(O)_S \( m \, m \) \|_Delta ⊗ iota^(- 1) \( cal(I)^k \/ cal(I)^(k + 1) \) . $
  Only the constant terms of the frame transitions act on this quotient. Since $Delta$ has bidegree $\( 1 \, 1 \)$, its conormal bundle $cal(I) \/ cal(I)^2$ is $cal(O)_C \( - 2 \)$; the displayed sheaf is therefore $cal(O)_C \( d + 2 m - 2 k \)$, as asserted.
  This filtration is separated. In a formal frame a section is a series in $v$, so membership in every $V_k$ makes every coefficient zero. For all sufficiently large $k$, the space on the right side of (2.3) is zero. Hence, for some $K$, $V_k = V_(k + 1)$ for every $k gt.eq K$, and $V_K = ⋂_(k gt.eq K) V_k = 0$ by separatedness. The finite remaining filtration gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ dim_(bb(C)) V lt.eq sum_(k gt.eq 0) max { d + 2 m - 2 k + 1 \, 0 } = m^2 + O \( m + 1 \) . $ <eq:sectionbound>]
  Here $d$ is fixed. More explicitly, the sum is $\( m + q + 1 \)^2$ for $d = 2 q$ and $\( m + q + 1 \) \( m + q + 2 \)$ for $d = 2 q + 1$.
  Restrict ordinary polynomial sections of $cal(O)_S \( m \, m \)$ to the completion. For each $nu = 1 \, dots.h \, N$, consider
  $ H^0 \( S \, cal(O)_S \( m \, m \) \)^(xor 2) arrow.r V \, #h(2em) \( A \, B \) mapsto A S_0 + B S_nu . $
  Its source has dimension $2 \( m + 1 \)^2$. Choose $m$ large enough that this exceeds the bound in (2.4), and choose a nonzero kernel pair $\( A_nu \, B_nu \)$ for each $nu$.
  Fix a connected diagonal coordinate disk $D$ on which $S_0 \|_Delta$ is nowhere zero, contained in one product affine chart. The section $S_0$ is then a formal frame for $L$ along $D$, and $S_nu \/ S_0$ is the substituted affine coordinate $x_nu \/ x_0$. Necessarily $B_nu eq.not 0$: otherwise $A_nu S_0 = 0$ would say that the ordinary section $A_nu$ has zero formal expansion along $D$. Its convergent local Taylor series would make it zero on a neighborhood of $D$, and the identity principle on connected $S$ would give $A_nu = 0$, a contradiction. The ratios
  $ q_nu = - A_nu \/ B_nu in bb(C) \( S \) $
  therefore define a rational map $R = \[ 1 : q_1 : dots.h.c : q_N \]$.
  It remains to show that these ratios are holomorphic simultaneously near one point of $D$. Use $u = s$, $v = t - s$ and an ordinary frame for $cal(O)_S \( m \, m \)$ on the chosen product chart, and represent $A_nu \, B_nu$ by holomorphic functions $a_nu \( u \, v \)$, $b_nu \( u \, v \)$. Write their normal Taylor coefficients on $D$ as $a_(nu \, k) \( u \)$, $b_(nu \, k) \( u \)$. For each $nu$, the generic normal order
  $ r_nu = min { k gt.eq 0 : b_(nu \, k) upright(" is not identically zero on ") D } $
  is finite. Otherwise Taylor uniqueness near $D$, followed by the identity principle on $S$, would make the nonzero ordinary section $B_nu$ vanish identically. Each leading coefficient $b_(nu \, r_nu)$ is a nonzero holomorphic function on the connected disk $D$. Its zeros are discrete, so a single point $p in D$ can be chosen where all the finitely many leading coefficients are nonzero.
  In the formal frame $S_0$, the kernel relations become
  $ a_nu + b_nu \( S_nu \/ S_0 \) = 0 quad upright("in ") cal(O)_D \[ \[ v \] \] . $
  By the definition of $r_nu$, all coefficients of $b_nu$ below that order vanish on $D$; the relation makes the same true of $a_nu$. Since $a_nu$ and $b_nu$ are ordinary holomorphic functions, this formal vanishing implies actual holomorphic divisibility near $p$:
  $ a_nu = v^(r_nu) tilde(a)_nu \, #h(2em) b_nu = v^(r_nu) tilde(b)_nu \, #h(2em) tilde(b)_nu \( p \) = b_(nu \, r_nu) \( p \) eq.not 0 . $
  Indeed, their convergent Taylor expansions in $v$ have the first $r_nu$ coefficients zero. Shrink to one neighborhood of $p$ where every $tilde(b)_nu$ is a holomorphic unit. Multiplication by $v$ is injective on formal series, so the same power can be canceled in each formal relation. It follows that
  $ q_nu = - tilde(a)_nu \/ tilde(b)_nu $
  is holomorphic there and has formal expansion $S_nu \/ S_0$. Thus $R$ is holomorphic on this common neighborhood. Its affine coordinate series agree with those of the composition of $hat(G)$ with $Y arrow.r.hook bb(P)^N$. The Taylor substitution rule then makes these formal maps agree on every holomorphic function on the projective target chart.
  Finally, $R \( p \) = g_0 \( p \)$, so shrink the source neighborhood until its image lies in a target chart with holomorphic defining equations for $Y$. Their compositions with $R$ have zero normal Taylor series, because their substitutions by $hat(G)$ are zero. The convergent Taylor series of these ordinary holomorphic functions make them vanish on a neighborhood of $p$. There $R$ takes values in $Y$. In local submanifold coordinates, every holomorphic function on $Y$ extends to the ambient chart. The ambient formal equality therefore also gives equality of the formal maps to $Y$, as required. ◻
]

#prodef([Remark 2.4.])[
  The normal-bundle calculation in (2.4) is the rationality mechanism in the proof. The related algebraic language uses the $G_3$ property: the restriction map from rational functions on the ambient variety to formal rational functions along the subvariety is an isomorphism. The proof above does not invoke a $G_3$ theorem. Its section count and cancellation work directly with the given holomorphic formal series, without an analytic-to-algebraic comparison.
] <rem:g3>

=== 2.3 Complementary tangency removes indeterminacy <complementary-tangency-removes-indeterminacy>

Rational reconstruction has produced a map only away from its base points. We next use the specified splitting to show that no base point can remain: each exceptional curve would have to map tangentially to both complementary summands, forcing its image to be a point.

#thm([Lemma 2.5.])[
  #emph[Let $R : S arrow.r.dashed X$ be a rational map such that, on its domain of definition, 
$ d R \( T^(\( 1 \)) \) subset R^(*) E_1 \, #h(2em) d R \( T^(\( 2 \)) \) subset R^(*) E_2 . $

 Then $R$ extends to a holomorphic map $S arrow.r X$.]
] <lem:removal>

#proof[
  Choose a projective embedding $X subset bb(P)^N$. By 11, there are a finite set $B subset S$, a composition of point blowups $mu : S' arrow.r S$ over $B$, and a holomorphic map $F' : S' arrow.r bb(P)^N$ extending $R compose mu$. Since $X$ is closed and $F'$ maps a dense open set into $X$, the entire image lies in $X$.
  We show that $F'$ is constant on each exceptional component. Let $H$ be such a component, lying over $p in B$, and let $s \, t$ be coordinates on the two source factors near $p$. On the inverse image of this coordinate neighborhood, $P_i d F'$ is a holomorphic one-form with values in $F' ""^(*) T_X$. The tangency assumptions imply the identities
  #[#set math.equation(numbering: n => "(2.5)")
   $ \( P_1 d F' \) and d \( s compose mu \) = 0 \, #h(2em) \( P_2 d F' \) and d \( t compose mu \) = 0 . $ <eq:wedges>]
  The two wedge expressions are sections of the locally free sheaf $Omega_(S')^2 ⊗ F' ""^(*) T_X$. The identities first hold off the exceptional curves, where $mu$ is an isomorphism, and then hold everywhere by holomorphicity.
  Both coordinate functions $s compose mu - s \( p \)$ and $t compose mu - t \( p \)$ vanish along $H$, since $mu \( H \) = { p }$. Their generic orders along $H$ are positive and finite. Indeed, in a normal coordinate along a connected disk of $H$, the first normal Taylor coefficient that is not identically zero gives that order. If no such coefficient existed, the pullback would vanish on an open neighborhood meeting the dense locus where $mu$ is an isomorphism, which is impossible for a coordinate function. Denote the two respective orders by $alpha \, beta$. This reasoning applies also to components created by later blowups. At a general point of $H$, avoiding intersections with other components and zeros of the two leading coefficients, choose a local equation $r = 0$. We can then write
  $ s compose mu - s \( p \) = r^alpha h \, #h(2em) t compose mu - t \( p \) = r^beta tilde(h) $
  with holomorphic units $h \, tilde(h)$.
  The first identity in (2.5) is therefore
  $ r^(alpha - 1) \( P_1 d F' \) and \( alpha h thin d r + r thin d h \) = 0 . $
  The holomorphic local ring of the smooth surface is a domain, so multiplication by $r^(alpha - 1)$ is injective on the locally free module of bundle-valued two-forms. It can therefore be canceled. At $r = 0$, evaluate the resulting ambient two-form on a vector $w$ tangent to $H$ and a vector $n$ with $d r \( n \) = 1$. The result is $alpha h thin P_1 d F' \( w \) = 0$, hence $P_1 d F' \( w \) = 0$. Canceling $r^(beta - 1)$ in the second identity gives $P_2 d F' \( w \) = 0$ in the same way. Since $P_1 + P_2 = "id"$, the derivative of $F' \|_H$ vanishes on a dense open subset of $H$, and hence everywhere. Since $H$ is connected, $F' \|_H$ is constant.
  The fibers of $mu$ away from $B$ are points. Each nontrivial fiber over $B$ is a connected union of exceptional components: the first blowup creates an exceptional line, and every later blowup over that point replaces its center by a new line meeting the strict transforms of the components through it, as in 11. The constants on intersecting components agree, so $F'$ is constant on every fiber.
  The map $mu$ is a continuous surjection from a compact space to a Hausdorff space. It is therefore a quotient map, and $F'$ descends to a continuous map $F : S arrow.r X$, holomorphic off $B$. Near each point of $B$, continuity places the image in a single target coordinate chart. The coordinate functions are continuous and holomorphic away from the isolated point. One-variable removability on coordinate lines makes them separately holomorphic, and the iterated Cauchy formula makes them holomorphic. Hence $F$ is holomorphic everywhere. ◻
]

#proof[
  Apply 4 and then 5 to a projective embedding of $X$. The resulting rational map is holomorphic near a nonempty diagonal patch and has formal expansion $hat(F)$ there. Continuous differentiation and Taylor substitution identify the expansions of $P_1 \( R \) partial_t R$ and $P_2 \( R \) partial_s R$ with the zero formal tangency expressions of $hat(F)$. These are ordinary holomorphic expressions, so Taylor uniqueness makes them zero on a neighborhood of that patch. Let $B$ be the finite base set from 11. The complement $S \\ B$ is connected; one can perturb any path in the connected real four-manifold $S$ inside coordinate balls to avoid the finitely many points. The inverse image of $X$ under the holomorphic map $R : S \\ B arrow.r bb(P)^N$ is an analytic subset containing a nonempty open set, so it is all of $S \\ B$. The two tangency conditions are then vanishing identities for holomorphic bundle morphisms on this connected complement, and continue there by the identity principle.
  Now 7 gives a holomorphic extension $F : S arrow.r X$. Tangency extends by holomorphicity. The maps $F \|_Delta$ and $g$ agree on the original nonempty diagonal patch, so they agree on all of $Delta$. ◻
]

== 3 Bundles on a tangent box <sec:transport>

A tangent box separates the two bundles as well as the two tangent directions. We show that each pulled-back summand comes from its corresponding factor. Transport from the diagonal gives a natural normalization of this identification at the point where the bracket will be tested.

For $i eq.not j$, the splitting defines a projected-bracket partial connection on $E_i$ in directions of $E_j$:

#[#set math.equation(numbering: n => "(3.1)")
 $ nabla_xi^i e = P_i \[ xi \, e \] \, $ <eq:partial>]

where $xi$ and $e$ are local holomorphic sections of $E_j$ and $E_i$, respectively.

#thm([Proposition 3.1.])[
  #emph[Let $F : S arrow.r X$ be a tangent box of $g : C arrow.r X$. Transport along the fibers of $"pr"_i$ gives holomorphic bundle isomorphisms 
#[#set math.equation(numbering: n => "(3.2)")
 $ Theta_i : "pr"_i^(*) \( g^(*) E_i \) arrow.r^(med tilde.op med) F^(*) E_i \, #h(2em) i = 1 \, 2 \, $ <eq:transport>]

 whose restrictions to the diagonal are the identity.]
] <prop:transport>

#proof[
  The bracket rules and $P_i xi = 0$ give
  $ nabla_(f xi)^i e = f nabla_xi^i e \, #h(2em) nabla_xi^i \( f e \) = xi \( f \) e + f nabla_xi^i e . $
  Thus (3.1) is tensorial in its $E_j$ direction and obeys the connection Leibniz rule in its $E_i$ argument. These two rules use no bracket of two $E_j$ sections and require no integrability of either summand.
  Fix $i$ and let $j eq.not i$. The tangency of $F$ sends the vertical line bundle $ker \( d "pr"_i \) = T^(\( j \))$ into $F^(*) E_j$. The partial connection therefore pulls back to a holomorphic connection on $F^(*) E_i$ relative to $"pr"_i$. We spell out this construction because $F$ may have critical points. Take local frames $e_lambda$ of $E_i$ and $xi_gamma$ of $E_j$, and write
  $ nabla_(xi_gamma)^i e_lambda = sum_nu Gamma_(gamma lambda)^nu e_nu \, #h(2em) d F \( V \) = sum_gamma h_gamma F^(*) xi_gamma $
  for a local holomorphic vertical vector field $V$ on $S$. Define
  $ D_V #h(-0.16667em) (sum_lambda f_lambda F^(*) e_lambda) = sum_lambda V \( f_lambda \) F^(*) e_lambda + sum_(gamma \, lambda \, nu) f_lambda h_gamma \( Gamma_(gamma lambda)^nu compose F \) F^(*) e_nu . $
  The two connection rules and the chain rule $V \( A compose F \) = d A \( d F \( V \) \)$ give the usual connection transformation under a change of the $E_i$ frame; tensoriality in the first argument handles a change of the $E_j$ frame. Hence these formulas agree on overlapping product neighborhoods. They define a holomorphic relative connection
  $ D : cal(O) \( F^(*) E_i \) arrow.r cal(O) \( F^(*) E_i ⊗ Omega_(S \/ C)^1 \) \, $
  where the relative differential is for $"pr"_i : S arrow.r C$. At a point where $d F \( V \) = 0$, all $h_gamma$ vanish there and the formula still applies; no inverse of $d F$ is used.
  The restriction of $D$ to any fiber $C = bb(P)^1$ is a holomorphic connection. Its curvature is a holomorphic two-form on that curve and therefore vanishes. Horizontal sections satisfy an everywhere nonsingular holomorphic linear ordinary differential equation. Local existence and uniqueness give continuation along every path, with reverse transport as its inverse. Flatness and simple connectedness of $bb(P)^1$ make this transport path-independent. Starting at the fiber’s diagonal point therefore identifies its bundle with the corresponding fiber of $g^(*) E_i$.
  These identifications depend holomorphically on both variables. Fix a base point and a path in its fiber from the diagonal to a desired endpoint. Cover the path by a finite chain of coordinate disks and bundle frames, and shrink the base neighborhood so that the same chain applies to nearby fibers. In each disk the coefficient matrix of the horizontal equation is holomorphic in the base and fiber coordinates. Picard iteration converges normally on smaller disks by the exponential-series estimate, so its solution matrix is holomorphic in the base and the start and end coordinates. Composing these local transports and frame changes gives a holomorphic identification near the chosen point of $S$. Path independence makes the local identifications agree globally. Transport at the starting diagonal point is the identity, giving $Theta_i$ and its stated normalization. ◻
]

== 4 Vanishing of the bracket tensors <sec:vanishing>

We now test the bracket obstruction on sections supplied by deformations of a rational curve. The tangent box makes the complementary target bundle trivial along the curve where the test is performed. This use of rational curves to force bracket vanishing has an antecedent in [6] Section 2.B and Lemma 3.18.

Return to the hypotheses of 1. For $i eq.not j$, define

$ cal(B)_i : and.big^2 E_i arrow.r E_j \, #h(2em) cal(B)_i \( e \, e' \) = P_j \[ e \, e' \] . $

The extra terms in the bracket of scalar multiples lie in $E_i$, so $P_j$ kills them. Thus $cal(B)_i$ is a holomorphic bundle morphism, and $E_i$ is integrable exactly when $cal(B)_i = 0$.

The following consequence of rational connectedness gives the needed sections. Its direct parameter-space proof is in Appendix 7.

#thm([Lemma 4.1.])[
  #emph[Fix distinct $a \, b in C$. There are a nonempty complex manifold $T$ and a holomorphic map $G : C times T arrow.r X$ such that 
$ \( "ev"_a \, "ev"_b \) : T arrow.r X times X \, #h(2em) tau mapsto \( G \( a \, tau \) \, G \( b \, tau \) \) $

 is a submersion. In particular, for $g = G \( thin dot.op thin \, tau \)$, the global sections of $g^(*) E_i$ vanishing at $a$ have values spanning $E_i$ at $g \( b \)$.]
] <lem:variation>

#proof[
  Choose the family in 9. For each member $g$, take a tangent box $F : S arrow.r X$ from 3; the boxes need not be chosen holomorphically as the member varies. For $j eq.not i$, consider
  $ L_i = { \( s_1 \, s_2 \) in S : s_j = b } . $
  The free coordinate identifies $L_i$ with $C$. As shown in 1, its marked endpoint $\( b \, b \)$ lies on the diagonal. By 8, $Theta_i$ identifies $F^(*) E_i \|_(L_i)$ with $g^(*) E_i$, while $Theta_j$ identifies $F^(*) E_j \|_(L_i)$ with the trivial bundle having fiber $E_(j \, g \( b \))$.
  Let $u \, v$ be any two global sections of $g^(*) E_i$ vanishing at $a$. Restricting the transport maps to $L_i$, the tensor value
  $ sigma_(u \, v) = Theta_j^(- 1) #h(-0.16667em) (\( F^(*) cal(B)_i \) \( Theta_i u and Theta_i v \)) in H^0 #scale(x: 120%, y: 120%)[\(] C \, cal(O)_C ⊗ E_(j \, g \( b \)) #scale(x: 120%, y: 120%)[\)] $
  is a holomorphic section of a trivial bundle on $bb(P)^1$, hence is constant. It vanishes at the point with free coordinate $a$, so it also vanishes at the point with free coordinate $b$. At this latter point, $F \( b \, b \) = g \( b \)$ and both transport maps are the identity. Consequently
  $ cal(B)_i \( g \( b \) \) #scale(x: 120%, y: 120%)[\(] u \( b \) and v \( b \) #scale(x: 120%, y: 120%)[\)] = 0 . $
  By 9, the values $u \( b \)$ of sections vanishing at $a$ span $E_(i \, g \( b \))$. Their pairwise wedges span its exterior square, and therefore $cal(B)_i \( g \( b \) \) = 0$.
  This applies to both $i$ and every member of the family. The map $"ev"_b$ is a submersion, being the composition of the two-point submersion with the second projection. Its image is a nonempty open subset of $X$, on which both bracket tensors vanish. The identity principle for holomorphic bundle morphisms on connected $X$ makes them vanish everywhere. This is precisely integrability of both specified summands. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (5.1, 2.75), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (5.1, 2.75), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((2.448, 1.32), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$Delta$]]], anchor: "south-east", padding: 0.1176cm)
  line((0, 2.75), (4.76, 2.75), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((5.1, 0), (5.1, 2.562), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  circle((0, 0), radius: 0.05292, fill: black, stroke: none)
  circle((0, 2.75), radius: 0.05292, fill: black, stroke: none)
  circle((5.1, 0), radius: 0.05292, fill: black, stroke: none)
  circle((5.1, 2.75), radius: 0.0635, fill: black, stroke: none)
  content((0, 0), [#text(size: 9pt)[$(a,a)$]], anchor: "north-east", padding: 0.1176cm)
  content((0, 2.75), [#text(size: 9pt)[$(a,b)$]], anchor: "east", padding: 0.1176cm)
  content((5.1, 0), [#text(size: 9pt)[$(b,a)$]], anchor: "north", padding: 0.1176cm)
  content((5.1, 2.75), [#text(size: 9pt)[$(b,b)$]], anchor: "south-west", padding: 0.1176cm)
  content((2.38, 2.75), [#text(size: 9pt)[$L_1:#h(0.3333em) s_2=b$]], anchor: "south", padding: 0.1176cm)
  content((5.1, 1.312), [#text(size: 9pt)[$L_2:#h(0.3333em) s_1=b$]], anchor: "west", padding: 0.1176cm)
  content((1.955, 0.5625), [#text(size: 9pt)[$F|_ Delta =g$]])
})],
  caption: [Figure 1: The two factor curves used to test the bracket tensors, drawn schematically in $C times C$. On $L_i tilde.eq bb(P)^1$, the input bundle is $g^(*) E_i$ and the complementary target bundle is trivial. Sections that vanish at the marked off-diagonal point force their tensor values to vanish at $\( b \, b \)$, which maps to $g \( b \)$. ],
) <fig:box>

== 5 Consequences for the rationally connected quotient <sec:consequences>

The main theorem also applies to the general fiber of the rationally connected quotient of a uniruled compact Kähler manifold. That fiber is a smooth projective manifold even when the ambient manifold is not projective. Its tangent splitting is therefore integrable, which supplies the premise in Höring’s structure theorems [7].

#thm([Corollary 5.1.])[
  #emph[Let $X$ be a connected uniruled compact Kähler manifold with a holomorphic splitting $T_X = V_1 xor V_2$. Let $Z$ be a general fiber of its rationally connected quotient and set $W_i = T_Z ∩ V_i \|_Z$. For each $i = 1 \, 2$, there is an almost-holomorphic fibration $phi.alt_i : X arrow.r.dashed Y_i$ whose general fiber $F_i$ is rationally connected and, for compatible choices $F_i subset Z$, satisfies 
$ T_(F_i) = W_i \|_(F_i) subset V_i \|_(F_i) . $

 If $W_i = 0$, one may take $phi.alt_i = "id"_X$, with point fibers.]
  #emph[If $"rank" V_1 = 2$, exactly one of the following holds:]
  + #emph[$W_1 = V_1 \|_Z$, and $X$ admits an analytic fiber bundle $X arrow.r Y$ with rationally connected general fiber and $T_(X \/ Y) = V_1$.]
  + #emph[$W_1$ is a line bundle, and there is an equidimensional holomorphic map $X arrow.r Y$ whose general fiber $F$ is a rational curve with $T_F subset V_1 \|_F$.]
  + #emph[$W_1 = 0$, equivalently $T_Z subset V_2 \|_Z$.]
] <cor:rational-quotient>

#proof[
  Use the published version of [7]; its definition of an almost-holomorphic fibration includes the identity case. Choose $Z$ over a regular value in the fibration locus of the quotient supplied by [7] Definition 2.9 and Theorem 2.10. Then $Z$ is an actual smooth connected compact submanifold of $X$. It inherits a Kähler form and is rationally connected. Campana’s theorem, recalled in the remark after [7] Definition 2.8, makes $Z$ projective.
  By [7] Proposition 3.16, the ambient complementary projections preserve $T_Z$. Their restrictions are complementary holomorphic idempotents. An idempotent has locally constant rank, so on connected $Z$ their images are the holomorphic subbundles $W_i$, and
  $ T_Z = W_1 xor W_2 . $
  If both ranks are positive, then $dim Z gt.eq 2$, and 1 makes both $W_i$ integrable. Otherwise they are $0$ and $T_Z$, which are integrable as well.
  This is the general-fiber integrability hypothesis of [7] Theorem 1.3, which gives the fibrations $phi.alt_i$ and the stated tangent identities. Its proof includes the identity when $W_i = 0$. If $"rank" V_1 = 2$, [7] Theorem 1.4 gives the three conclusions according as $"rank" W_1$ is $2$, $1$, or $0$. These ranks are mutually exclusive and exhaustive, proving the stated trichotomy. ◻
]

== 6 Elementary elimination of surface base points <app:surface>

Elimination of indeterminacy by point blowups is a classical part of the birational theory of smooth surfaces; see [2]. The next lemma supplies exactly the resolution statement used in 7. We include the argument to make explicit the finite termination of the point-blowup process, using the colength of the local base ideal as the decreasing positive integer.

#thm([Lemma 6.1.])[
  #emph[A rational map $R : bb(P)^1 times bb(P)^1 arrow.r.dashed bb(P)^N$ is holomorphic outside a finite set $B$. A finite sequence of point blowups over $B$ gives a smooth projective surface $mu : S' arrow.r bb(P)^1 times bb(P)^1$ on which $R compose mu$ extends holomorphically. The fibers of $mu$ are connected; its exceptional components are smooth curves.]
] <lem:surface>

#proof[
  Clear denominators to represent $R$ by a tuple of bihomogeneous polynomials of the same bidegree, and remove all common factors. The factors can be taken bihomogeneous: the highest and lowest degrees in each variable group are additive in products.
  In any product affine chart, the dehomogenized tuple $h_0 \( x \, y \) \, dots.h \, h_N \( x \, y \)$ has no common nonconstant factor. Otherwise bihomogenizing such a factor would give a common factor of the original tuple. In $bb(C) \( x \) \[ y \]$, the tuple therefore has gcd one. A univariate Bézout identity, with denominators cleared, puts a nonzero polynomial in $x$ in the ideal $\( h_0 \, dots.h \, h_N \)$. Interchanging the variables gives a nonzero polynomial in $y$. The common zero set in the affine chart is finite. At each common zero, the ideal in centered formal coordinates contains powers of both coordinates and consequently has finite colength. There are four product affine charts, so the global base set $B$ is finite.
  If $B = diameter$, the map is already holomorphic, and $S' = S$, $mu = "id"_S$ give the conclusion. Assume from now on that $B eq.not diameter$.
  It remains to resolve such a base point. Let
  $ D = bb(C) \[ \[ x \, y \] \] \, #h(2em) frak(m) = \( x \, y \) \, $
  and let $I subset D$ be the ideal of a representing holomorphic tuple $f_0 \, dots.h \, f_N$ at the point. Assume $I$ is proper and has finite colength, and let $k = min_nu "ord" \( f_nu \) gt.eq 1$. Blow up the point. In a chart $\( x \, z \) mapsto \( x \, x z \)$, divide the pulled-back tuple by $x^k$; the divided functions are holomorphic. The other chart gives the same map, since the two tuples differ by a unit on their overlap.
  On the exceptional projective line, the remaining base points are common zeros of the degree-$k$ initial forms. At least one such form is nonzero, so there are finitely many. Fix one. A linear change of the old coordinates lets us place it at $\( x \, z \) = \( 0 \, 0 \)$ in the displayed chart. Let
  $ J = \( x^(- k) f_nu \( x \, x z \) \)_nu subset bb(C) \[ \[ x \, z \] \] \, #h(2em) D' = bb(C) \[ \[ x \, z \] \] \/ J . $
  A power $x^ell$ belongs to $I$; applying the substitution and division gives $x^(ell - k) in J$. Thus the class of $x$ in $D'$ is nilpotent. Modulo $x$, a nonzero degree-$k$ initial form gives a nonzero polynomial in $z$ of degree at most $k$. Its germ at the new base point is $z^q$ times a unit, with $1 lt.eq q lt.eq k$. Therefore $D' \/ \( x \)$ is spanned by $1 \, z \, dots.h \, z^(k - 1)$. Successively lifting modulo the powers of the nilpotent $x$ shows that $D'$ is spanned by finitely many classes $x^a z^b$, with $0 lt.eq b < k$.
  There is a well-defined $bb(C)$-linear map
  #[#set math.equation(numbering: n => "(6.1)")
   $ frak(m)^k \/ I arrow.r D' \, #h(2em) h mapsto x^(- k) h \( x \, x z \) . $ <eq:transform>]
  Indeed a monomial $x^a y^b$ of total degree at least $k$ maps to $x^(a + b - k) z^b$. All exponents are nonnegative, and the resulting orders tend to infinity with the original orders, so the operation is defined on arbitrary formal series. If $h = sum_nu q_nu f_nu$ lies in $I$, its transform is $sum_nu q_nu \( x \, x z \) x^(- k) f_nu \( x \, x z \) in J$. This proves descent to the quotient; no multiplicativity is needed.
  Each spanning monomial $x^a z^b$, $b < k$, is the image of $x^(a + k - b) y^b in frak(m)^k$, so (6.1) is surjective. It follows that
  #[#set math.equation(numbering: n => "(6.2)")
   $ dim_(bb(C)) D' lt.eq dim_(bb(C)) \( frak(m)^k \/ I \) = dim_(bb(C)) \( D \/ I \) - frac(k \( k + 1 \), 2) < dim_(bb(C)) \( D \/ I \) . $ <eq:lengthdrop>]
  In particular, the new base ideals have finite colength, and that positive integer decreases strictly along every surviving branch of the blowup process.
  There are finitely many initial base points and finitely many children at each step. The maximum initial colength bounds the length of every branch by (6.2). Thus the entire tree is finite, and finitely many point blowups remove all base points. The local divided tuples define the desired holomorphic map.
  Finally, a point blowup is proper, has a projective line over its center, and is an isomorphism elsewhere. The strict transform of a smooth curve remains smooth, and a new exceptional line meets the strict transforms of the components through the center. Induction gives smooth exceptional components and connected fibers of the composite. ◻
]

== 7 Two-point evaluation from rational connectedness <app:variation>

We prove 9 using only polynomial presentations of maps from $bb(P)^1$, analytic subsets, and the holomorphic constant-rank theorem. This isolates the precise two-point variation property used in the proof. For broader background on rationally connected varieties, see [10,9].

We first record an elementary covering observation. If $A$ is a proper closed analytic subset of a connected second-countable complex manifold $M$, then $A$ is covered by countably many complex submanifolds of dimension smaller than $dim M$. The covering submanifolds need not be contained in $A$. To see this, choose a countable cover of $A$ by sufficiently small connected coordinate neighborhoods on which $A$ is defined by holomorphic functions. In each neighborhood choose a non-identically-zero defining function $f$. Such a function exists because a proper analytic subset has empty interior. At a zero of $f$, let $r gt.eq 1$ be its finite order. Some derivative of order $r - 1$ vanishes there and has nonzero differential. Thus that point belongs to the regular zero locus of one of the partial derivatives of $f$. There are countably many such derivatives and charts. Their regular zero loci, with connected components separated, give the asserted covering.

#proof[
  Embed $X$ in $bb(P)^N$. Every holomorphic map $C = bb(P)^1 arrow.r bb(P)^N$ is represented by a tuple of homogeneous polynomials of a degree $d gt.eq 0$, with no common zero. Indeed its pullback of $cal(O)_(bb(P)^N) \( 1 \)$ is $cal(O)_C \( d \)$, and its homogeneous coordinate sections supply such a tuple. For fixed $d$, these tuples form an open subset $M_d$ of a finite-dimensional vector space. Openness follows from compactness of $C$. There is a universal holomorphic evaluation map $C times M_d arrow.r bb(P)^N$.
  We cover the tuples whose maps land in $X$ by countably many manifold families all of whose maps land in $X$. Start with the connected components of $M_d$. For a current connected submanifold $M$, either every tuple maps $C$ into $X$, in which case accept this family, or there are $tau in M$ and $c in C$ with $G \( c \, tau \) in.not X$. In the latter case
  $ { eta in M : G \( c \, eta \) in X } $
  is a proper closed analytic subset of $M$, and contains every desired tuple in $M$. Use the covering observation to replace it by countably many lower-dimensional submanifolds, and repeat the same test on each. All desired tuples survive. Extra points introduced by the covering cause no problem: each new manifold is tested anew. Dimension strictly decreases whenever a family is not accepted. In dimension zero the test accepts precisely the desired points. Finite depth and countable branching give countably many accepted families covering all the desired tuples. On an accepted family the universal evaluation factors holomorphically through the embedded submanifold $X$.
  Perform this construction for every $d$. The resulting countably many two-point evaluation maps to $X times X$ have images containing general pairs: a rational curve through two distinct points can be reparametrized to take those values at the fixed distinct points $a \, b$. By the convention in the introduction, these images contain a nonempty Zariski open subset of $X times X$. It is also open in the usual topology and has positive measure in smooth local coordinates.
  Suppose, for a contradiction, that every one of these evaluation maps has complex rank everywhere less than $2 dim X$. The image of each is then measure zero. Here is a direct verification of that fact for a holomorphic map $phi.alt : M arrow.r X times X$ with the stated rank bound. We may take $M$ connected. On the open set of maximum rank, the constant-rank theorem places the image locally in a submanifold of smaller dimension than $X times X$. Countably many local charts give a measure-zero image. If the maximum rank is zero, this already treats all of $M$. Otherwise its complement is a proper closed analytic subset. Cover that subset by countably many lower-dimensional submanifolds and apply induction on $dim M$. The strict rank bound persists on every such restriction, including the extra points of a covering submanifold. The zero-dimensional case is immediate. This proves the asserted measure-zero property.
  A countable union of measure-zero images cannot contain that open subset. Some family therefore has a point where two-point evaluation is submersive. Restrict its parameter space to the nonempty open set where the differential is surjective; call the resulting manifold $T$.
  Finally, a parameter tangent vector differentiates the holomorphic family to a global section of $g^(*) T_X$. Surjectivity of the two-point evaluation differential provides, for every $w in T_(g \( b \)) X$, such a section with values $0 \, w$ at $a \, b$. Projecting with $P_i$ gives the last assertion of 9. ◻
]

#heading(level: 1)[References]
#bibitem([1])[L.~Bădescu, #emph[Algebraic Barth--Lefschetz theorems], Nagoya Math. J. #strong[142] (1996), 17--38. #link("https://doi.org/10.1017/S0027763000005626")[doi:10.1017/S0027763000005626].]
#bibitem([2])[A.~Beauville, #emph[Complex algebraic surfaces], second edition, London Mathematical Society Student Texts #strong[34], Cambridge University Press, Cambridge, 1996. #link("https://doi.org/10.1017/CBO9780511623936")[doi:10.1017/CBO9780511623936].]
#bibitem([3])[A.~Beauville, #emph[Complex manifolds with split tangent bundle], in #emph[Complex Analysis and Algebraic Geometry], de Gruyter, Berlin, 2000, pp.~61--70. #link("https://arxiv.org/abs/math/9809033v2")[arXiv:math/9809033v2].]
#bibitem([4])[F.~Campana and T.~Peternell, #emph[Projective manifolds with splitting tangent bundle, I], Math. Z. #strong[241] (2002), no.~3, 613--637. #link("https://doi.org/10.1007/s00209-002-0435-5")[doi:10.1007/s00209-002-0435-5]. Theorem numbering follows #link("https://arxiv.org/abs/math/0101198v1")[arXiv:math/0101198v1].]
#bibitem([5])[H.~Hironaka and H.~Matsumura, #emph[Formal functions and formal embeddings], J. Math. Soc. Japan #strong[20] (1968), nos.~1--2, 52--82. #link("https://doi.org/10.2969/jmsj/02010052")[doi:10.2969/jmsj/02010052].]
#bibitem([6])[A.~Höring, #emph[Uniruled varieties with split tangent bundle], #link("https://arxiv.org/abs/math/0505327v3")[arXiv:math/0505327v3]. Published in Math. Z. #strong[256] (2007), 465--479. The title and theorem numbering used here follow the preprint.]
#bibitem([7])[A.~Höring, #emph[The structure of uniruled manifolds with split tangent bundle], Osaka J. Math. #strong[45] (2008), no.~4, 1067--1084. #link("https://www.i-repository.net/contents/osakacu/sugaku/111F0000002-04504-14.pdf")[Published text]. Numbering and the fibration convention used here follow this version.]
#bibitem([8])[A.~Höring, #emph[Fano varieties with split tangent sheaf], preprint, February 17, 2026. #link("https://arxiv.org/abs/2602.15427v1")[arXiv:2602.15427v1].]
#bibitem([9])[J.~Kollár, #emph[Rationally connected varieties over local fields], Ann. of Math. (2) #strong[150] (1999), no.~1, 357--367. #link("https://doi.org/10.2307/121107")[doi:10.2307/121107].]
#bibitem([10])[J.~Kollár, Y.~Miyaoka, and S.~Mori, #emph[Rationally connected varieties], J. Algebraic Geom. #strong[1] (1992), no.~3, 429--448.]


